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
	/*var $action = "stock";
	var $sub = "manage";*/
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain_sub ()
	{
		global $ttH;
		$ttH->func->load_language_admin($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS.$this->action.".tpl");
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		require_once("modules/".$this->modules."/".$this->modules."_func.php");
		
		$data["link_stock"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, "stock");
		$data["link_manage"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, "manage");
		$data["link_manage_trash"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, "manage_trash");
		$data["link_add"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, "add");
		
		$this->sub = (isset($ttH->input["sub"])) ? $ttH->input["sub"] : "manage";
		switch ($this->sub) {
			default:
				$this->sub = "manage";
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->action."_manage"];
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
	
	//-----------
	function row_combine($type="product", $type_id=0)
	{
		global $ttH;
		
		$arr_color = $ttH->load_data->data_table ('product_color', 'color_id', 'color_id,color,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		$arr_size = $ttH->load_data->data_table ('product_size', 'size_id', 'size_id,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		
		$err = "";
		
		$where = " where type='".$type."' and type_id='".$type_id."' ";
		$where .= " order by color_id desc, size_id desc";
		
    $sql = "select * from product_combine ".$where."";
    //echo $sql;
		$result = $ttH->db->query($sql);
    $i = 0;
    $html_row = "";
    if ($num = $ttH->db->num_rows($result))
		{
			while ($row = $ttH->db->fetch_row($result)) 
			{
				$i++;
				
				$row['color'] = (isset($arr_color[$row['color_id']])) ? $arr_color[$row['color_id']] : array();
				$row['size'] = (isset($arr_size[$row['size_id']])) ? $arr_size[$row['size_id']] : array();
				$row['in_stock'] = $ttH->func->format_number($row['in_stock']);
				$row['out_stock'] = $ttH->func->format_number($row['out_stock']);
				
				$ttH->temp_act->assign('row', $row);
				$ttH->temp_act->parse("combine.row_item");
			}
		}
		else
		{
			$ttH->temp_act->assign('row', array("mess"=>$ttH->lang["global"]["no_have_data"]));
			$ttH->temp_act->parse("combine.row_empty");
		}
		
		$ttH->temp_act->reset("combine");
		$ttH->temp_act->parse("combine");
		return $ttH->temp_act->text("combine");
	}
	
	//-----------
	function manage_row($row, $is_show='')
	{
		global $ttH;
		
		$output = '';
		
		$row["link_stock"] = $ttH->admin->get_link_admin_popup ($this->modules, 'stock', 'stock_detail', array("type"=>'product',"type_id"=>$row['item_id']));
		
		if(!empty($row["picture"])){
			$row["picture"] = '<a class="fancybox-effects-a" title="'.$row["picture"].'" href="'.DIR_UPLOAD.$row["picture"].'">
				'.$ttH->func->get_pic_mod($row["picture"], 50, 50, '', 1, 0, array('fix_width'=>1)).'
			</a>';
		}
		
		$row['price_import'] = $ttH->func->get_price_format ($row['price_import'], '0');
		$row['price'] = $ttH->func->get_price_format ($row['price']);
		//$row['import_stock'] = $ttH->func->format_number ($row['in_stock'] + $row['out_stock']);
		$row['in_stock'] = $ttH->func->format_number ($row['in_stock']);
		$row['has_stock'] = $ttH->func->format_number ($row['in_stock'] - $row['out_stock']);
		$row['date_create'] = date('d/m/Y',$row['date_create']);
		
		//$row['row_combine'] = $this->row_combine("product", $row['item_id']);
		
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
						$dup['is_focus'] = (isset($arr_is_focus[$up_id[$i]])) ? $arr_is_focus[$up_id[$i]] : 0;
						$ok = $ttH->db->do_update("product", $dup, "item_id=" . $up_id[$i]);
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
				case "do_duplicate":
					if(isset($ttH->input['id'])){
						$list_duplicate = $ttH->input['id'];
					}elseif(isset($ttH->post['selected_id']) && is_array($ttH->post['selected_id'])){
						$list_duplicate = @implode(',',$ttH->post['selected_id']);
					}
					$err = $this->do_duplicate ($list_duplicate);
					break;
				case "do_restore":
					$up_id = (isset($ttH->input["id"])) ? array($ttH->input["id"]) : $up_id;
					$mess = $ttH->lang['global']['restore_success'] . " ID: <strong>";
					$str_mess = "";
					for ($i = 0; $i < count($up_id); $i ++){
						$dup = array();
						$dup['is_show'] = 1;
						$ok = $ttH->db->do_update("product", $dup, "item_id=" . $up_id[$i]);
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
						$ok = $ttH->db->do_update("product", $dup, "item_id=" . $up_id[$i]);
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
			$where .= " AND is_show=0 ";
		}else{
			$where .= " AND is_show=1 ";
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
			$where .=" and (a.item_id='$search_title' or title like '%$search_title%') ";			
			$ext.="&search_title=".$search_title;
			$is_search = 1;
		}
    
		$num_total = 0;
		$res_num = $ttH->db->query("select a.item_id 
						from product a, product_lang al 
						where a.item_id=al.item_id 
						and lang='".$ttH->conf["lang_cur"]."' 
						".$where." ");
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
			"item_id" => array(
				"title" => $ttH->lang["global"]["id"],
				"link" => $link_action."&p=".$p.$ext."&sort=item_id-desc",
				"class" => ""
			),
			"item_code" => array(
				"title" => $ttH->lang["global"]["series"],
				"link" => $link_action."&p=".$p.$ext."&sort=item_code-desc",
				"class" => ""
			),
			"show_order" => array(
				"title" => $ttH->lang["global"]["show_order"],
				"link" => $link_action."&p=".$p.$ext."&sort=show_order-desc",
				"class" => ""
			),
			"picture" => array(
				"title" => $ttH->lang["global"]["picture"],
				"link" => $link_action."&p=".$p.$ext."&sort=picture-desc",
				"class" => ""
			),
			"title" => array(
				"title" => 'Tên sản phẩm',
				"link" => $link_action."&p=".$p.$ext."&sort=title-desc",
				"class" => ""
			),
			"price_import" => array(
				"title" => 'Giá nhập',
				"link" => $link_action."&p=".$p.$ext."&sort=price_import-desc",
				"class" => ""
			),
			"price" => array(
				"title" => 'Giá bán',
				"link" => $link_action."&p=".$p.$ext."&sort=price-desc",
				"class" => ""
			),
			"in_stock" => array(
				"title" => 'Nhập kho',
				"link" => $link_action."&p=".$p.$ext."&sort=import_stock-desc",
				"class" => ""
			),
			"out_stock" => array(
				"title" => 'Xuất kho',
				"link" => $link_action."&p=".$p.$ext."&sort=out_stock-desc",
				"class" => ""
			),
			"has_stock" => array(
				"title" => 'Tồn kho',
				"link" => $link_action."&p=".$p.$ext."&sort=in_stock-desc",
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
				$order_tmp = ($tmp[0] == "item_id") ? "a.item_id" : $tmp[0];
				$order_tmp = ($tmp[0] == "import_stock") ? "(in_stock+out_stock)" : $tmp[0];
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
		
    $sql = "select * from product a, product_lang al 
						where a.item_id=al.item_id 
						and lang='".$ttH->conf["lang_cur"]."' 
						".$where." 
						limit $start,$n";
    //die($sql);
		
		$nav = $ttH->admin->admin_paginate ($link_action, $num_total, $n, $ext, $p);
		
		$result = $ttH->db->query($sql);
    $i = 0;
    $html_row = "";
    if ($num = $ttH->db->num_rows($result))
		{
			while ($row = $ttH->db->fetch_row($result)) 
			{
				$i++;
				$row['stt'] = $start+$i;
				$html_row .= $this->manage_row($row, $is_show);
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
		$data["list_group_search"] = list_group ('product', "search_group_id", $search_group_id, " class=\"form-control\"", array("title" => $ttH->lang['global']['select_title']));
		$data["list_brand_search"] = list_brand ("search_brand_id", $search_brand_id, " class=\"form-control\"", array("title" => $ttH->lang['global']['select_title']));
		$data['form_search_class'] = ($is_search == 1) ? ' expand' : '';
				
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("manage");
		return $ttH->temp_act->text("manage");
	}

  // end class
}
?>