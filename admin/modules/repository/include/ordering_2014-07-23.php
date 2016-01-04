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
$nts = new sMain_sub();

class sMain_sub extends sMain {
	var $modules = "repository";
	//var $action = "receipt";
	//var $sub = "manage";
	var $type = "product";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain_sub () {
		global $ttH;
		$ttH->func->load_language_admin($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS.$this->action.".tpl");
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		require_once("modules/".$this->modules."/".$this->modules."_func.php");
		load_setting ();
		require_once("modules/".$this->modules."/".$this->action."_func.php");
		load_setting_ordering ();
		
		$data["link_manage"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, "manage");
		$data["link_manage_trash"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, "manage_trash");
		$data["link_add"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, "add");
		
		$this->sub = (isset($ttH->input["sub"])) ? $ttH->input["sub"] : "manage";
		switch ($this->sub) {
			case "edit":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->modules."_".$this->sub];
				$data["main"] = $this->do_edit();
				break;
			case "manage_trash":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->modules."_".$this->sub];
				$data["main"] = $this->do_manage("trash");
				break;
			default:
				$this->sub = "manage";
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->modules."_manage"];
				$data["main"] = $this->do_manage();
				break;
		}
		$data["class"] = array();
		$data["class"][$this->sub] = ' class="active"';
		$data["page_title"] = $ttH->conf["page_title"];
		
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
		
		$arr_color = $ttH->load_data->data_table ('product_color', 'color_id', 'color_id,color,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		$arr_size = $ttH->load_data->data_table ('product_size', 'size_id', 'size_id,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		
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
				$row["picture"] = $ttH->func->get_src_mod('product/'.$row["picture"], $row['pic_w'], $row['pic_h'], 1, 0, array('fix_max' => 1));
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
			$ttH->temp_act->assign('row', array('mess' => $ttH->lang['product']['no_have_item']));
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
	function do_edit()
	{
		global $ttH;
		
		$err = "";
		
		/*$arr_order_shipping = array();
		$sql = "select shipping_id,title,content  
						from order_shipping  
						where is_show=1 
						order by show_order desc, date_create asc";
		//echo $sql;
		$result = $ttH->db->query($sql);
		$html_row = "";
		while ($row = $ttH->db->fetch_row($result)) {
			$arr_order_shipping[$row['shipping_id']] = $row;
		}
		
		$arr_order_method = array();
		$sql = "select method_id,title,content  
						from order_method  
						where is_show=1 
						order by show_order desc, date_create asc";
		//echo $sql;
		$result = $ttH->db->query($sql);
		$html_row = "";
		while ($row = $ttH->db->fetch_row($result)) {
			$arr_order_method[$row['method_id']] = $row;
		}*/
		$arr_order_shipping = $ttH->load_data->data_table ('order_shipping', 'shipping_id', 'shipping_id,title,content', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc", array(), array('editor' => 'content'));
		$arr_order_method = $ttH->load_data->data_table ('order_method', 'method_id', 'method_id,title,content', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc", array(), array('editor' => 'content'));
		
		$dir = create_folder(date("Y_m"));
		
		$order_id = $ttH->input["id"];
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			if(empty($err)){
				$col = array();
				$arr_key = array('o_full_name','o_email','o_phone','o_address','d_full_name','d_email','d_phone','d_address','is_status');
				foreach($arr_key as $key) {
					$col[$key] = (isset($ttH->post[$key])) ? $ttH->post[$key] : '';
				}
				
				if(isset($ttH->post["message_send"])) {					
					$col["message_send"] = 1;
					$col["message_title"] = $ttH->post["message_title"];
					$col["message_content"] = $ttH->post["message_content"];
					
					$ttH->func->send_mail ($ttH->post["message_to"], $col["message_title"], $col["message_content"], $ttH->post["message_from"]);
				}
				
				$col["date_update"] = time();
				$ok = $ttH->db->do_update("product_order", $col, " order_id='".$order_id."'");	
				if($ok){
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_success"], "success");
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_false"], "error");	
				}
			}
		}
		
		$sql = "select * from product_order where order_id='".$order_id."'";
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
			
			if($data['is_status'] == 0) {
					if($data["voucher_amount"] > 0) {
						// update voucher if is_status = 0
						$ttH->db->query("update voucher  
											set amount_use=(amount_use-".$data["voucher_amount"]."), 
												date_update=".time()."  
											where voucher_id='".$data["voucher_id"]."'");
						if($ttH->db->affected()) {
							
							$sql_voucher = "select * from voucher where voucher_id='".$data["voucher_id"]."'";
							$result_voucher = $ttH->db->query($sql_voucher);
							if ($data_voucher = $ttH->db->fetch_row($result_voucher)){
								//write log
								$col_log = array();
								$col_log["voucher_id"] = $data_voucher["voucher_id"];
								$col_log["order_code"] = $data["order_code"];
								$col_log["amount_type"] = 'ordering_cancel';
								$col_log["amount"] = $data["voucher_amount"];
								$col_log["amount_has"] = $data_voucher["amount"] - $data_voucher["amount_use"];
								$col_log["date_create"] = time();
								$ttH->db->do_insert("voucher_history", $col_log);
								//end
							}
							
							$ttH->db->query("update product_order  
											set voucher_id='', 
													total_payment=(total_payment+voucher_amount), 
													voucher_amount=0  
											where order_id='".$data["order_id"]."'");
							if($ttH->db->affected()) {
								$data["total_payment"] += $data["voucher_amount"];
								$data["voucher_id"] = '';
								$data["voucher_amount"] = 0;
							}
						}
						// End
					}
					
					if($data["promotion_percent"] > 0) {
						// update voucher if is_status = 0
						$ttH->db->query("update promotion  
											set order_id='', 
												date_update=".time()."  
											where promotion_id='".$data["promotion_id"]."'");
						if($ttH->db->affected()) {
							$ttH->db->query("update product_order  
											set promotion_id='', 
													total_payment=(total_order+shipping_price), 
													promotion_percent=0  
											where order_id='".$data["order_id"]."'");
							if($ttH->db->affected()) {
								$data["total_payment"] = $data["total_order"] + $data["shipping_price"];
								$data["promotion_id"] = '';
								$data["promotion_percent"] = 0;
							}
						}
						// End
					}
				}
			
			//create_promotion
			if(isset($ttH->post["create_promotion"]) && $data['is_status'] >= 2) {
				$col_v = array();
				$col_v["order_create"] = $data['order_id'];
				$col_v["user_id"] = $data["user_id"];
				$col_v["percent"] = (isset($ttH->post["promotion_percent"])) ? $ttH->post["promotion_percent"] : $ttH->setting_voucher["promotion_percent"];
				if($col_v["percent"] >= 100 || $col_v["percent"] <= 0) {
					$col_v["percent"] = $ttH->setting_voucher["promotion_percent"];
				}
				$col_v["is_show"] = 1;
				$col_v["date_start"] = time();
				$col_v["date_end"] = time() + $ttH->setting_voucher["promotion_percent"]*86400;
				$col_v["date_create"] = time();
				$col_v["date_update"] = time();
				
				for($j=0; $j<10;$j++) {
					$len = 6+$j;
					$col_v['promotion_id'] = $ttH->func->random_str ($len, 'un');
					$ok = $ttH->db->do_insert("promotion", $col_v);	
					if($ok){
						break;
					}
				}
			}
			//end
			
			if(isset($ttH->post["send_promotion"]) && $data['is_status'] >= 2) {
				
				$arr_promotion = $ttH->load_data->data_table ('promotion', 'promotion_id', 'promotion_id, percent, date_end', " order_create='".$order_id."'");
				//print_arr($row_promotion);die();
				if(is_array($arr_promotion) && count($arr_promotion) > 0) {
					foreach($arr_promotion as $row_promotion){
						$ttH->func->send_mail_temp (
							'send-promotion', $data["d_email"], $ttH->conf['email'], 
							array(
								'{promotional_code}',
								'{percent}',
								'{min_cart_promotion}',
								'{date_end}'
							), 
							array(
								$row_promotion["promotion_id"],
								$row_promotion["percent"],
								$ttH->func->get_price_format($ttH->setting_voucher["min_cart_promotion"], 0),
								$ttH->func->get_date_format($row_promotion["date_end"])
							)
						);
						
						break;
					}
					if($data['is_status'] == 2) {
						$col_up = array();
						
						$data['is_status'] = $col_up["is_status"] = 4;
						$col_up["date_update"] = time();
						$ttH->db->do_update("product_order", $col_up, " order_id='".$order_id."'");
					}
					
				}
			}
			
		}
		
		$data["err"] = $err;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, $this->sub, array("id"=>$order_id));
		$data["link_up"] = $ttH->admin->get_link_admin ('library','library','popup_library').'&type=1&folder_up='.$this->modules.'&fldr='.$dir.'&editor=mce_0&field_id=picture';
		$data["table_cart"] = $this->table_cart ($data);
		
		$data["table_promotion"] = $this->table_promotion ($order_id);
		if(!empty($data["table_promotion"])) {
			$ttH->temp_act->assign('data', $data);
			$ttH->temp_act->parse("edit.list_promotion");
		}elseif($data['is_status'] >= 2) {
			$ttH->temp_act->assign('data', $data);
			$ttH->temp_act->parse("edit.create_promotion");
		}
		
		if($data['is_status'] == 0) {
			$status_order_info  = status_order_info ($data['is_status']);
			$data["list_status_order"] = '<p style="background:'.$status_order_info['background_color'].'; color:'.$status_order_info['color'].'">'.$status_order_info['title'].'</p><input type="hidden" name="is_status" value="'.$data['is_status'].'" />';
		} else {
			$data["list_status_order"] = list_status_order ('is_status',$data['is_status'], " class=\"form-control\"");
		}
		
		$data['shipping'] = (isset($data['shipping']) && array_key_exists($data['shipping'], $arr_order_shipping)) ? $arr_order_shipping[$data['shipping']] : array();
		$data['method'] = (isset($data['method']) && array_key_exists($data['method'], $arr_order_method)) ? $arr_order_method[$data['method']] : array();
		$data['message_send'] = ($data['message_send'] == 1) ? 'Đã gửi' : 'Chưa gửi';
		$data["message_from"] = $ttH->conf['email'];
		$data["html_message"] = $ttH->editor->load_editor ("message_content", "message_content", $data['message_content'], "", "full", array("folder_up" => $this->modules, "fldr" => $dir));
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("edit");
		return $ttH->temp_act->text("edit");
	}
	
	//-------------- 
  function do_del ($list_del = "")
  {
    global $ttH;
		
		if(empty($list_del)){
			$ttH->html->alert ($ttH->lang["global"]["not_found_product"], $ttH->admin->get_link_admin ($this->modules_call, $this->action));
		}
		$ok = $ttH->db->delete ("product_order", "find_in_set(order_id,'".$list_del."')");
    if ($ok){
      $mess = $ttH->html->html_alert($ttH->lang["global"]["del_success"], "success");
    } else  {
      $mess = $ttH->html->html_alert($ttH->lang["global"]["del_false"], "error");
    }
		
		return $mess;
  }
	
	//-----------
	function do_manage($is_show="")
	{
		global $ttH;
		
		$err = "";
		
		//update
		if (isset($ttH->input['do_action']))
		{
			$up_id = (isset($ttH->input["selected_id"])) ? $ttH->input["selected_id"] : array();
		  switch ($ttH->input["do_action"]){
				case "do_edit":
					
					$arr_show_order = (isset($ttH->post["show_order"])) ? $ttH->post["show_order"] : array();
					$arr_is_focus = (isset($ttH->post["is_focus"])) ? $ttH->post["is_focus"] : array();
							
					$mess = $ttH->lang['global']['edit_success'] . " ID: <strong>";
					$str_mess = "";
					for ($i = 0; $i < count($up_id); $i ++){
						$dup = array();
						$dup['show_order'] = $arr_show_order[$up_id[$i]];
						$dup['is_focus'] = $arr_is_focus[$up_id[$i]];
						$ok = $ttH->db->do_update("product_order", $dup, "order_id=" . $up_id[$i]);
						if ($ok){
							$str_mess .= ($str_mess) ? ", " : "";
							$str_mess .= $up_id[$i];
						} else{
							$mess .= $ttH->lang["global"]['edit_false'] . " ID: <strong>" . $up_id[$i] . "</strong>";
						}
					}
					$mess .= $str_mess . "</strong>";
					$err = $ttH->html->html_alert ($mess, "success");
					break;
				case "do_restore":
					$up_id = (isset($ttH->input["id"])) ? array($ttH->input["id"]) : $up_id;
					$mess = $ttH->lang['global']['restore_success'] . " ID: <strong>";
					$str_mess = "";
					for ($i = 0; $i < count($up_id); $i ++){
						$dup = array();
						$dup['is_show'] = 1;
						$ok = $ttH->db->do_update("product_order", $dup, "order_id=" . $up_id[$i]);
						if ($ok){
							$str_mess .= ($str_mess) ? ", " : "";
							$str_mess .= $up_id[$i];
						} else{
							$mess .= $ttH->lang["global"]['restore_false'] . " ID: <strong>" . $up_id[$i] . "</strong>";
						}
					}
					$mess .= $str_mess . "</strong>";
					$err = $ttH->html->html_alert ($mess, "success");
					break;
				case "do_trash":
					$up_id = (isset($ttH->input["id"])) ? array($ttH->input["id"]) : $up_id;
					$mess = $ttH->lang['global']['trash_success'] . " ID: <strong>";
					$str_mess = "";
					for ($i = 0; $i < count($up_id); $i ++){
						$dup = array();
						$dup['is_show'] = 0;
						$ok = $ttH->db->do_update("product_order", $dup, "order_id=" . $up_id[$i]);
						if ($ok){
							$str_mess .= ($str_mess) ? ", " : "";
							$str_mess .= $up_id[$i];
						} else{
							$mess .= $ttH->lang["global"]['trash_false'] . " ID: <strong>" . $up_id[$i] . "</strong>";
						}
					}
					$mess .= $str_mess . "</strong>";
					$err = $ttH->html->html_alert ($mess, "success");
					break;
				case "do_del":
					if(isset($ttH->input['id'])){
						$list_del = $ttH->input['id'];
					}elseif(isset($ttH->post['selected_id']) && is_array($ttH->post['selected_id'])){
						$list_del = @implode(',',$ttH->post['selected_id']);
					}
					$err = $this->do_del ($list_del);
					break;
		  }
		}
		$p = (isset($ttH->input["p"])) ? $ttH->input["p"] : 1;
		$search_date_begin = (isset($ttH->input["search_date_begin"])) ? $ttH->input["search_date_begin"] : "";
		$search_date_end = (isset($ttH->input["search_date_end"])) ? $ttH->input["search_date_end"] : "";
		$search_group_id = (isset($ttH->input["search_group_id"])) ? $ttH->input["search_group_id"] : 0;
		$search_brand_id = (isset($ttH->input["search_brand_id"])) ? $ttH->input["search_brand_id"] : 0;
		$search_title = (isset($ttH->input["search_title"])) ? $ttH->input["search_title"] : "";
		
		$where = " ";
		$ext = "";
		$is_search = 0;
		
		if($is_show == "trash" ){
			$where .= " where is_show=0 ";
		}else{
			$where .= " where is_show=1 ";
		}
		
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
		$n = ($ttH->conf["n_list"]) ? $ttH->conf["n_list"] : 30;
		$num_products = ceil($num_total / $n);
		if ($p > $num_products)
		  $p = $num_products;
		if ($p < 1)
		  $p = 1;
		$start = ($p - 1) * $n;
		
		$link_action = $ttH->admin->get_link_admin ($this->modules_call, $this->action, $this->sub);
		
		//Sort
		$arr_title = array(
			"order_id" => array(
				"title" => $ttH->lang["global"]["id"],
				"link" => $link_action."&p=".$p.$ext."&sort=order_id-desc",
				"class" => ""
			),
			"order_code" => array(
				"title" => $ttH->lang["repository"]["order_code"],
				"link" => $link_action."&p=".$p.$ext."&sort=order_code-desc",
				"class" => ""
			),
			"show_order" => array(
				"title" => $ttH->lang["global"]["show_order"],
				"link" => $link_action."&p=".$p.$ext."&sort=show_order-desc",
				"class" => ""
			),
			"is_status" => array(
				"title" => $ttH->lang["repository"]["status_order"],
				"link" => $link_action."&p=".$p.$ext."&sort=is_status-desc",
				"class" => ""
			),
			"d_full_name" => array(
				"title" => 'Người nhận hàng',
				"link" => $link_action."&p=".$p.$ext."&sort=d_full_name-desc",
				"class" => ""
			),
			"total_order" => array(
				"title" => $ttH->lang["repository"]["total_order"],
				"link" => $link_action."&p=".$p.$ext."&sort=title-desc",
				"class" => ""
			),
			"date_create" => array(
				"title" => $ttH->lang["global"]["date_create"],
				"link" => $link_action."&p=".$p.$ext."&sort=date_create-desc",
				"class" => ""
			)
		);
		$sort = (isset($ttH->input["sort"])) ? $ttH->input["sort"] : "";
		if($sort)
		{
			$arr_allow_sort = array(
				1 => "asc",
				2 => "desc"
			);
			$tmp = explode("-",$sort);
			if (array_key_exists($tmp[0],$arr_title) && in_array($tmp[1],$arr_allow_sort)) {
				$order_tmp = ($tmp[0] == "order_id") ? "a.order_id" : $tmp[0];
				$where .= " order by ".$order_tmp." ".$tmp[1];
				
				$arr_title[$tmp[0]]["class"] = $tmp[1];
				$arr_title[$tmp[0]]["link"] = $link_action."&p=".$p.$ext."&sort=".$tmp[0]."-".$arr_allow_sort[(3-(array_search($tmp[1],$arr_allow_sort)))];				
			}
			else
			{
				$sort = "";
			}
		}
		
		if($sort == "")
		{
			$where .= " order by date_create DESC";
		}
		//End sort
		
		//Title row
		foreach($arr_title as $k => $v)
		{
			$class = ($v["class"]) ? " class='".$v["class"]."'" : "";
			$data["f_".$k] = '<a href="'.$v["link"].'" '.$class.'>'.$v["title"].'</a>';
		}
		//End title row
		
    $sql = "select * from product_order ".$where." limit $start,$n";
    //echo $sql;
		
		$nav = $ttH->admin->admin_paginate ($link_action, $num_total, $n, $ext, $p);
		
		$result = $ttH->db->query($sql);
    $i = 0;
    $html_row = "";
    if ($num = $ttH->db->num_rows($result))
		{
			while ($row = $ttH->db->fetch_row($result)) 
			{
				$i++;
				
				$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, "edit", array("id"=>$row['order_id']));
				$row["link_trash"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, $this->sub, array("do_action"=>"do_trash","id"=>$row['order_id']));
				$row["link_restore"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, $this->sub, array("do_action"=>"do_restore","id"=>$row['order_id']));
				$row["link_del"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row['order_id']));
				
				$row["link_pic"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action.'_pic', 'manage', array("type"=>"item","type_id"=>$row['order_id']));
				
				if(!empty($row["picture"])){
					$row["picture"] = '<a class="fancybox-effects-a" title="'.$row["picture"].'" href="'.DIR_MOD_UPLOAD.$row["picture"].'">
						'.$ttH->func->get_pic_mod('product/'.$row["picture"], 50, 50, '', 1, 0, array('fix_width'=>1)).'
					</a>';
				}
				
				$row["status_order"] = status_order_info ($row["is_status"]);
				
				$row['total_order'] = $ttH->func->get_price_format($row['total_order']);
				$row['date_create'] = date('H:i:s, d/m/Y',$row['date_create']);
				
				$ttH->temp_act->assign('row', $row);
				if($is_show == "trash"){
					$ttH->temp_act->parse("manage.row_item.row_button_manage");
				}else{
					$ttH->temp_act->parse("manage.row_item.row_button_trash");
				}
				$ttH->temp_act->parse("manage.row_item");
			}
		}
		else
		{
			$ttH->temp_act->assign('row', array("mess"=>$ttH->lang["global"]["no_have_data"]));
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
		
		if($is_show == "trash"){
			$ttH->temp_act->parse("manage.button_manage");
		}else{
			$ttH->temp_act->parse("manage.button_trash");
		}
		
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("manage");
		return $ttH->temp_act->text("manage");
	}

  // end class
}
?>