<?php

/*================================================================================*\
Name code : view.php
Copyright © 2015  by Phan Van Lien
@version : 1.0
@date upgrade : 01/01/2015 by Phan Van Lien
\*================================================================================*/

if (! defined('IN_ttH')) {
  die('Access denied');
}
$nts = new sMain();

class sMain
{
	var $modules = "user";
	var $action = "ordering";
	var $sub = "manage";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		
		if($ttH->site_func->check_user_login() != 1) {
			$url = $ttH->func->base64_encode($_SERVER['REQUEST_URI']);
			$url = (!empty($url)) ? '/?url='.$url : '';
			
			$link_go = $ttH->site->get_link ($this->modules, $ttH->setting[$this->modules]["signin_link"]).$url;
			$ttH->html->redirect_rel($link_go);
		}
		
		$ttH->func->load_language($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS.$this->action.".tpl");
		$ttH->temp_act->assign('CONF', $ttH->conf);
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		$ttH->func->include_css ($ttH->dir_css.$this->modules.'/'.$this->modules.'.css');
		
		$ttH->conf['menu_action'] = array($this->modules);
		$ttH->data['link_lang'] = (isset($ttH->data['link_lang'])) ? $ttH->data['link_lang'] : array();
		
		include ($this->modules."_func.php");
		include ($this->action."_func.php");
		
		$data = array();
		//Make link lang
		foreach($ttH->data['lang'] as $row_lang) {
			$ttH->data['link_lang'][$row_lang['name']] = $ttH->site->get_link_lang ($row_lang['name'], $this->modules);
		}
		//End Make link lang
		
		//SEO
		$ttH->site->get_seo (array(
			'meta_title' => (isset($ttH->setting[$this->modules][$this->action."_meta_title"])) ? $ttH->setting[$this->modules][$this->action."_meta_title"] : '',
			'meta_key' => (isset($ttH->setting[$this->modules][$this->action."_meta_key"])) ? $ttH->setting[$this->modules][$this->action."_meta_key"] : '',
			'meta_desc' => (isset($ttH->setting[$this->modules][$this->action."_meta_desc"])) ? $ttH->setting[$this->modules][$this->action."_meta_desc"] : ''
		));
		$ttH->conf["cur_group"] = 0;
		
		$data = array();
		
		$order_code = $ttH->conf["cur_item_url"];
		
		$where = " and user_id='".$ttH->data['user_cur']['user_id']."' 
						and order_code='".$order_code."' ";
		
		$sql = "select * from product_order 
						where is_show=1 
						".$where;
    //echo $sql;
		$result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
			$data['content'] = $this->do_edit($data['order_id']);
		} else {
			$data['content'] = $this->do_manage();
		}
		
		$data['box_left'] = box_left($this->action);
		//$data['box_column'] = box_column();
	
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("main");
		$ttH->output .=  $ttH->temp_act->text("main");
	}
	
	function table_promotion ($order_create)
	{
		global $ttH;
		
		$output = '';	
		
		$data = array();
		
		$sql = "select *  
						from promotion   
						where order_create='".$order_create."'   
						order by promotion_id asc";
		//echo $sql;
		$result = $ttH->db->query($sql);
		if ($num = $ttH->db->num_rows($result)) {
			while ($row = $ttH->db->fetch_row($result)) { 
				
				$row['percent'] = $ttH->func->format_number($row['percent']);				
				$row['date_end'] = $ttH->func->get_date_format($row['date_end'],1);
				
				$ttH->temp_act->assign('row', $row);
				$ttH->temp_act->parse("table_promotion.row_item");
			}
			$ttH->temp_act->assign('data', $data);
			$ttH->temp_act->parse("table_promotion");
			$output = $ttH->temp_act->text("table_promotion");
		}
		return $output;
	}
	
	function table_cart ($order = array())
	{
		global $ttH;
		
		$order_id = $order['order_id'];	
		
		$arr_color = $ttH->load_data->data_table ('product_color', 'color_id', 'color_id,color,title', "is_show=1 and lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		$arr_size = $ttH->load_data->data_table ('product_size', 'size_id', 'size_id,title', "is_show=1 and lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		
		$data = array();
		$data['cart_total'] = 0;
		
		$sql = "select *  
						from product_order_detail  
						where order_id='".$order_id."'   
						order by detail_id asc";
		//echo $sql;
		$result = $ttH->db->query($sql);
		$html_row = "";
		if ($num = $ttH->db->num_rows($result)) {
			while ($row = $ttH->db->fetch_row($result)) { 
				
				$row['pic_w'] = 50;
				$row['pic_h'] = 50;
				$row["picture"] = $ttH->func->get_src_mod($row["picture"], $row['pic_w'], $row['pic_h'], 1, 0, array('fix_max' => 1));
				$row['quantity'] = (isset($row['quantity'])) ? $row['quantity'] : 0;
				
				$row['total'] = $row['quantity'] * $row['price_buy'];
				$data['cart_total'] += $row['total'];
				
				$row['color'] = (isset($arr_color[$row['color_id']])) ? $arr_color[$row['color_id']] : array();
				$row['size'] = (isset($arr_size[$row['size_id']])) ? $arr_size[$row['size_id']] : array();
				
				$row['price_buy'] = $ttH->func->get_price_format($row['price_buy']);
				$row['total'] = $ttH->func->get_price_format($row['total']);
				
				$ttH->temp_act->assign('row', $row);
				$ttH->temp_act->parse("table_cart.row_item");
			}
		} else {
			$ttH->temp_act->assign('row', array('mess' => $ttH->lang['user']['no_have_item']));
			$ttH->temp_act->parse("table_cart.row_empty");
		}
		
		$data['cart_total'] = $ttH->func->get_price_format($data['cart_total'], 0);
		$data['promotion_percent'] = $order['promotion_percent'];
		$data['shipping_price'] = $ttH->func->get_price_format($order['shipping_price'], 0);
		$data['voucher_amount'] = $ttH->func->get_price_format($order['voucher_amount'], 0);
		$data['total_payment'] = $ttH->func->get_price_format($order['total_payment'], 0);
				
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("table_cart");
		return $ttH->temp_act->text("table_cart");
	}
	
	//-----------
	function do_edit($order_id)
	{
		global $ttH;
		
		$err = "";
		
		$arr_order_shipping = $ttH->load_data->data_table ('order_shipping', 'shipping_id', 'shipping_id,title,content', "is_show=1 and lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc", array(), array('editor'=>'content'));
		$arr_order_method = $ttH->load_data->data_table ('order_method', 'method_id', 'method_id,title,content', "is_show=1 and lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc", array(), array('editor'=>'content'));
		
		$sql = "select * from product_order where order_id='".$order_id."'";
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
		}
		
		$data["err"] = $err;
		$data["table_cart"] = $this->table_cart ($data);
		
		$data["table_promotion"] = $this->table_promotion ($order_id);
		if(!empty($data["table_promotion"])) {
			$ttH->temp_act->assign('data', $data);
			$ttH->temp_act->parse("edit.list_promotion");
		}elseif($data['is_status'] >= 2) {
			$ttH->temp_act->assign('data', $data);
			$ttH->temp_act->parse("edit.create_promotion");
		}
		
		//$data["list_status_order"] = list_status_order ('is_status',$data['is_status'], " class=\"form-control\"");
		$data["status_order"] = status_order_info ($data["is_status"]);
		
		$data['shipping'] = (isset($data['shipping']) && array_key_exists($data['shipping'], $arr_order_shipping)) ? $arr_order_shipping[$data['shipping']] : array();
		$data['method'] = (isset($data['method']) && array_key_exists($data['method'], $arr_order_method)) ? $arr_order_method[$data['method']] : array();
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("edit");
		return $ttH->temp_act->text("edit");
	}
	
	//-----------
	function manage_row($row)
	{
		global $ttH;
		
		$output = '';
		
		if(!empty($row["picture"])){
			$row["picture"] = '<a class="fancybox-effects-a" title="'.$row["picture"].'" href="'.DIR_UPLOAD.$row["picture"].'">
				'.$ttH->func->get_pic_mod($row["picture"], 50, 50, '', 1, 0, array('fix_width'=>1)).'
			</a>';
		}
		
		$row['link'] = $ttH->site->get_link ("user",$ttH->setting["user"]["ordering_link"], $row["order_code"]);
		
		$row["status_order"] = status_order_info ($row["is_status"]);
		
		$row['total_order'] = $ttH->func->get_price_format($row['total_order']);
		$row['date_create'] = date('d/m/Y',$row['date_create']);
		
		$ttH->temp_act->assign('row', $row);
		
		$ttH->temp_act->parse("manage.row_item");
		$output = $ttH->temp_act->text("manage.row_item");
		$ttH->temp_act->reset("manage.row_item");
		
		return $output;
	}
	
	//-----------
	function do_manage($is_show="")
	{
		global $ttH;
		
		$err = "";
		
		$p = (isset($ttH->input["p"])) ? $ttH->input["p"] : 1;
		$search_date_begin = (isset($ttH->input["search_date_begin"])) ? $ttH->input["search_date_begin"] : "";
		$search_date_end = (isset($ttH->input["search_date_end"])) ? $ttH->input["search_date_end"] : "";
		$search_group_id = (isset($ttH->input["search_group_id"])) ? $ttH->input["search_group_id"] : 0;
		$search_brand_id = (isset($ttH->input["search_brand_id"])) ? $ttH->input["search_brand_id"] : 0;
		$search_title = (isset($ttH->input["search_title"])) ? $ttH->input["search_title"] : "";
		
		$where = " ";
		$ext = "";
		$is_search = 0;
		
		$where .= " where is_show=1 and user_id='".$ttH->data['user_cur']['user_id']."' ";
		
		if($search_date_begin || $search_date_end ){
			$tmp1 = @explode("/", $search_date_begin);
			$time_begin = @mktime(0, 0, 0, $tmp1[1], $tmp1[0], $tmp1[2]);
			
			$tmp2 = @explode("/", $search_date_end);
			$time_end = @mktime(23, 59, 59, $tmp2[1], $tmp2[0], $tmp2[2]);
			
			$where.=" AND (date_create BETWEEN {$time_begin} AND {$time_end} ) ";
			$ext.="&date_begin=".$search_date_begin."&date_end=".$search_date_end;
			$is_search = 1;
		}
		
		if(!empty($search_group_id)){
			$where .=" and find_in_set('".$search_group_id."', group_nav)>0 ";			
			$ext.="&search_group_id=".$search_group_id;
			$is_search = 1;
		}
		
		if(!empty($search_brand_id)){
			$where .=" and brand_id='".$search_brand_id."' ";			
			$ext.="&search_brand_id=".$search_brand_id;
			$is_search = 1;
		}
		
		if(!empty($search_title)){
			$where .=" and (a.order_id='$search_title' or title like '%$search_title%') ";			
			$ext.="&search_title=".$search_title;
			$is_search = 1;
		}
    
		$num_total = 0;
		$res_num = $ttH->db->query("select order_id from product_order ".$where." ");
			$num_total = $ttH->db->num_rows($res_num);
		$n = 20;//($ttH->conf["n_list"]) ? $ttH->conf["n_list"] : 20;
		$num_products = ceil($num_total / $n);
		if ($p > $num_products)
		  $p = $num_products;
		if ($p < 1)
		  $p = 1;
		$start = ($p - 1) * $n;
		
		$link_action = $ttH->site->get_link ($this->modules,$ttH->setting[$this->modules]["ordering_link"]);
		
		$where .= " order by date_create DESC";

    $sql = "select * from product_order ".$where." limit $start,$n";
    //echo $sql;
		
		$nav = $ttH->site->paginate ($link_action, $num_total, $n, $ext, $p);
		
		$result = $ttH->db->query($sql);
    $i = 0;
		$data['row_item'] = '';
    $html_row = "";
    if ($num = $ttH->db->num_rows($result))
		{
			while ($row = $ttH->db->fetch_row($result)) 
			{
				$i++;
				$row['stt'] = $start + $i;
				$data['row_item'] .= $this->manage_row($row);
			}
		}
		else
		{
			$ttH->temp_act->assign('row', array("mess"=>$ttH->lang["user"]["no_have_data"]));
			$ttH->temp_act->parse("manage.row_empty");
		}
		
		$data['html_row'] = $html_row;
		$data['nav'] = $nav;
		$data['err'] = $err;
		
		$data['link_action_search'] = $link_action;
		$data['link_action'] = $link_action."&p=".$p.$ext;
		
		$data['search_date_begin'] = $search_date_begin;
		$data['search_date_end'] = $search_date_end;
		$data['search_title'] = $search_title;
		$data['form_search_class'] = ($is_search == 1) ? ' expand' : '';
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("manage");
		return $ttH->temp_act->text("manage");
	}
	
  // end class
}
?>