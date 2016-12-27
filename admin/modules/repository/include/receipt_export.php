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
			case "add":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->action."_".$this->sub];
				$data["main"] = $this->do_add();			
				break;
			case "edit":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->action."_".$this->sub];
				$data["main"] = $this->do_edit();
				break;
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
	function do_add()
	{
		global $ttH;
		
		$ttH->func->include_js($ttH->dir_temp.'js/'.$this->modules.'/'.$this->modules.'.js');
		
		$data = array();
		$err = "";
		
		$dir = create_folder(date("Y_m"));
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			$receipt_code = (isset($ttH->post["receipt_code"])) ? $ttH->post["receipt_code"] : '';
			if(empty($err) && empty($receipt_code)) {
				$err = $ttH->html->html_alert ('Mã số chưa nhập', "error");	
			}	
			
			$order_id = (isset($ttH->post["order_id"])) ? $ttH->post["order_id"] : '';
			if(empty($err) && empty($order_id)) {
				$err = $ttH->html->html_alert ('Chưa chọn đơn hàng', "error");	
			}	
			
			if(empty($err)) {
				$sql = "select * from product_order  
								where order_id='".$order_id."'";
				$result = $ttH->db->query($sql);
				if ($order_info = $ttH->db->fetch_row($result)){
				} else {
					$err = $ttH->html->html_alert ('Đơn hàng không tồn tại', "error");	
				}
			}	

			if(empty($err)){
				$sql = "select receipt_code from repository_receipt where receipt_code='".$receipt_code."'";
				$result = $ttH->db->query($sql);
				if ($check = $ttH->db->fetch_row($result)){
					$err = $ttH->html->html_alert ('Mã số đã tồn tại', "error");	
				}
			}
			
			$import = (isset($ttH->post["import"])) ? $ttH->post["import"] : array();
			
			foreach ($import as $k => $v) {
				if($v <= 0) {
					unset($import[$k]);
				}
			}
			
			if(empty($err) && (count($import) <= 0)) {
				$err = $ttH->html->html_alert ('Chưa nhập số lượng hàng', "error");	
			}
			
			$tmp = explode('/',$ttH->post['date_create']);
			$date_create = mktime($ttH->post['date_create_hour'],$ttH->post['date_create_minute'], 0, $tmp[1], $tmp[0], $tmp[2]);
			
			/*print_arr($ttH->post);
			print_arr($import);
			die();*/
			
			if(empty($err)){
				$col = array();
				$col["receipt_code"] = $receipt_code;
				$col["receipt_type"] = 'export';
				$col["type_code"] = $order_info['order_code'];
				$col["show_order"] = 0;
				$col["is_show"] = 1;
				$col["date_create"] = $date_create;
				$col["date_update"] = time();
				$ok = $ttH->db->do_insert("repository_receipt", $col);	
				if($ok){
					$receipt_id = $ttH->db->insertid();		
					
					$arr_type_in_stock = array();
					
					$sql = "select * from product_order_detail   
									where quantity>out_stock 
									and order_id='".$order_id."'";
					//die($sql);
					$result = $ttH->db->query($sql);
					while ($row_detail = $ttH->db->fetch_row($result)){
						$max_num = $row_detail['quantity'] - $row_detail['out_stock'];
						$col_l = array();
						$col_l["receipt_id"] = $receipt_id;
						$col_l["is_level"] = 1;
						$col_l["type"] = $row_detail['type'];
						$col_l["type_id"] = $row_detail['type_id'];
						$col_l["color_id"] = $row_detail['color_id'];
						$col_l["size_id"] = $row_detail['size_id'];
						$col_l["quantity"] = ($import[$k] >0 && $import[$k] < $max_num) ? $import[$k] : $max_num;
						$col_l["date_create"] = time();
						$col_l["date_update"] = time();
						
						$arr_type_in_stock[$col_l["type_id"]] = (isset($arr_type_in_stock[$col_l["type_id"]])) ? $arr_type_in_stock[$col_l["type_id"]]+$col_l["quantity"] : $col_l["quantity"];
						
						$where = "and type='".$col_l["type"]."'
											and type_id='".$col_l["type_id"]."'
											and color_id='".$col_l["color_id"]."'
											and size_id='".$col_l["size_id"]."' ";
						
						// update product_order_detail
						$ttH->db->query("update product_order_detail 
											set out_stock=(out_stock+".$col_l["quantity"].")
											where detail_id='".$row_detail['detail_id']."'");
						// End
						
						// if not has product_combine, Insert product_combine		
						$ttH->db->query("update product_combine 
											set out_stock=(out_stock+".$col_l["quantity"]."),
												date_update=".$col_l["date_update"]." 
											where 1 ".$where);
						// End
										
						// if not has repository_receipt_detail, Insert repository_receipt_detail		
						$ttH->db->query("update repository_receipt_detail 
											set quantity=(quantity+".$col_l["quantity"]."), 
												date_update=".$col_l["date_update"]."  
											where receipt_id='".$col_l["receipt_id"]."'
											".$where);
						if(!$ttH->db->affected()) {
							$ttH->db->do_insert("repository_receipt_detail", $col_l);	
						}
						// End
					}
					
					foreach($arr_type_in_stock as $k => $v) {						
						if($v > 0) {
							$col_l = array();
							$col_l["receipt_id"] = $receipt_id;
							$col_l["is_level"] = 0;
							$col_l["type"] = 'product';
							$col_l["type_id"] = $k;
							$col_l["color_id"] = 0;
							$col_l["size_id"] = 0;
							$col_l["quantity"] = $v;
							$col_l["date_create"] = time();
							$col_l["date_update"] = time();
							$ok = $ttH->db->do_insert("repository_receipt_detail", $col_l);
							if($ok) {
								$ttH->db->query("update product 
											set out_stock=(out_stock+".$col_l["quantity"]."),
												date_update=".$col_l["date_update"]."  
											where item_id='".$col_l["type_id"]."' ");
							}
						}
					}
					
					$data = array();
					$err = $ttH->html->html_alert ($ttH->lang["global"]["add_success"], "success");	
				}else{
					$data = $ttH->post;
					$err = $ttH->html->html_alert ($ttH->lang["global"]["add_false"], "error");	
				}
			}else{
				$data = $ttH->post;
			}
		}
		
		$data["err"] = $err;
		
		$arr_isset = array('order_id');
		foreach($arr_isset as $tmp) {
			$data[$tmp] = (isset($data[$tmp])) ? $data[$tmp] : '';
		}
		
		$data['date_create'] = (isset($data['date_create'])) ? $data['date_create'] : date('d/m/Y');
		$data['date_create_hour'] = (isset($data['date_create_hour'])) ? $data['date_create_hour'] : date('H');
		$data['date_create_minute'] = (isset($data['date_create_minute'])) ? $data['date_create_minute'] : date('i');
		
		$data['receipt_code'] = (isset($data['receipt_code'])) ? $data['receipt_code'] : receipt_code_next();
		
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, $this->sub);
		
		$data["list_ordering"] = list_ordering ("order_id", $data["order_id"], " class=\"form-control\" id=\"list_ordering\"", array('title'=>$ttH->lang['global']['select_title']));
		$data["list_hour"] = $ttH->admin->list_number ("date_create_hour", 0, 23, $data["date_create_hour"]);
		$data["list_minute"] = $ttH->admin->list_number ("date_create_minute", 0, 59, $data["date_create_minute"]);
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("add");
		return $ttH->temp_act->text("add");
	}
	
	//-----------
	function do_edit()
	{
		global $ttH;
		
		$ttH->func->include_js($ttH->dir_temp.'js/'.$this->modules.'/'.$this->modules.'.js');
		
		$err = "";
		
		$dir = create_folder(date("Y_m"));
		
		$receipt_id = $ttH->input["id"];
		
		$sql = "select * from repository_receipt 
						where receipt_id='".$receipt_id."'";
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
			if($data['is_show'] != 1) {
				$ttH->temp_act->parse("edit.alert");
			}			
		} else {
			$link_go = $ttH->admin->get_link_admin ($this->modules_call, $this->action);
			$ttH->html->alert($ttH->lang['global']['not_found_page'], $link_go);
		}
		
		$arr_product = $ttH->load_data->data_table ('product_lang', 'item_id', 'item_id,title', " lang='".$ttH->conf['lang_cur']."' ");
		$arr_color = $ttH->load_data->data_table ('product_color', 'color_id', 'color_id,color,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		$arr_size = $ttH->load_data->data_table ('product_size', 'size_id', 'size_id,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		
		//sub
		$arr_sub = array();
		$sql = "select * 
						from repository_receipt_detail 
						where receipt_id='".$data['receipt_id']."' 
						and is_level=1 
						order by type asc, type_id asc, color_id desc, size_id desc";
    //echo $sql;
		$result = $ttH->db->query($sql);
    if ($num = $ttH->db->num_rows($result)){
			while ($row = $ttH->db->fetch_row($result)) {
				
				$row['product'] = (isset($arr_product[$row['type_id']])) ? $arr_product[$row['type_id']] : array();
				$row['color'] = (isset($arr_color[$row['color_id']])) ? $arr_color[$row['color_id']] : array();
				$row['size'] = (isset($arr_size[$row['size_id']])) ? $arr_size[$row['size_id']] : array();
				$row['quantity'] = $ttH->func->format_number($row['quantity']);
				
				$row['date_create'] = $ttH->func->get_date_format ($row['date_create'], 1);
				$row['date_update'] = $ttH->func->get_date_format ($row['date_update'], 1);
				
				$ttH->temp_act->assign('row', $row);
				$ttH->temp_act->parse("edit.row_sub.row_sub_item");
				if(!isset($arr_sub[$row['type'].'_'.$row['type_id']])) {
					$arr_sub[$row['type'].'_'.$row['type_id']] = '';
				}
				$arr_sub[$row['type'].'_'.$row['type_id']] .= $ttH->temp_act->text("edit.row_sub.row_sub_item");
				$ttH->temp_act->reset("edit.row_sub.row_sub_item");
			}
		}	else {
			$ttH->temp_act->assign('row', array("mess"=>$ttH->lang["global"]["no_have_data"]));
			$ttH->temp_act->parse("edit.row_sub.row_sub_empty");
		}
		
		foreach($arr_sub as $list_id => $html) {
			$ttH->temp_act->assign('data', array("list_id"=>$list_id, "list"=>$html));
			$ttH->temp_act->parse("edit.row_sub");
		}
		// end
		
		$sql = "select * 
						from repository_receipt_detail 
						where receipt_id='".$data['receipt_id']."' 
						and is_level=0 
						order by type asc, type_id asc, color_id desc, size_id desc";
    //echo $sql;
		$result = $ttH->db->query($sql);
    if ($num = $ttH->db->num_rows($result))	{
			while ($row = $ttH->db->fetch_row($result)) {
				
				$row['product'] = (isset($arr_product[$row['type_id']])) ? $arr_product[$row['type_id']] : array();
				$row['color'] = (isset($arr_color[$row['color_id']])) ? $arr_color[$row['color_id']] : array();
				$row['size'] = (isset($arr_size[$row['size_id']])) ? $arr_size[$row['size_id']] : array();
				$row['price'] = $ttH->func->get_price_format($row['price']);
				$row['quantity'] = $ttH->func->format_number($row['quantity']);
				$row['view_detail'] = (isset($arr_sub[$row['type'].'_'.$row['type_id']])) ? '<a href="#sub_'.$row['type'].'_'.$row['type_id'].'" class="fancybox">Click</a>' : '---';
				
				$row['date_create'] = $ttH->func->get_date_format ($row['date_create'], 1);
				$row['date_update'] = $ttH->func->get_date_format ($row['date_update'], 1);
				
				$ttH->temp_act->assign('row', $row);
				$ttH->temp_act->parse("edit.row_item");
			}
		}	else{
			$ttH->temp_act->assign('row', array("mess"=>$ttH->lang["global"]["no_have_data"]));
			$ttH->temp_act->parse("edit.row_empty");
		}
		
		$data["err"] = $err;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, $this->sub, array("id"=>$receipt_id));
		$data['date_create'] = $ttH->func->get_date_format ($data['date_create'], 1);
		$data['date_update'] = $ttH->func->get_date_format ($data['date_update'], 1);		
		
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
		
		$ok = 0;//$ttH->db->delete ("repository_receipt", "find_in_set(receipt_id,'".$list_del."')");
    if ($ok){
      $mess = $ttH->html->html_alert($ttH->lang["global"]["del_success"], "success");
    } else  {
      $mess = $ttH->html->html_alert($ttH->lang["global"]["del_false"], "error");
    }
		
		return $mess;
  }
	
	//-----------
	function manage_row($row, $is_show='')
	{
		global $ttH;
		
		$output = '';
		
		$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, "edit", array("id"=>$row['receipt_id']));
		$row["link_trash"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, $this->sub, array("do_action"=>"do_trash","id"=>$row['receipt_id']));
		$row["link_restore"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, $this->sub, array("do_action"=>"do_restore","id"=>$row['receipt_id']));
		$row["link_del"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row['receipt_id']));
		
		$row['date_create'] = date('d/m/Y',$row['date_create']);
		
		$ttH->temp_act->assign('row', $row);
		if($is_show == "trash"){
			$ttH->temp_act->parse("manage.row_item.row_button_manage");
		}else{
			$ttH->temp_act->parse("manage.row_item.row_button_trash");
		}
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
							
					$mess = $ttH->lang['global']['edit_success'] . " ID: <strong>";
					$str_mess = "";
					for ($i = 0; $i < count($up_id); $i ++){
						$dup = array();
						$dup['show_order'] = $arr_show_order[$up_id[$i]];
						$ok = $ttH->db->do_update("repository_receipt", $dup, "receipt_id=" . $up_id[$i]);
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
				/*case "do_del":
					if(isset($ttH->input['id'])){
						$list_del = $ttH->input['id'];
					}elseif(isset($ttH->post['selected_id']) && is_array($ttH->post['selected_id'])){
						$list_del = @implode(',',$ttH->post['selected_id']);
					}
					$err = $this->do_del ($list_del);
					break;*/
		  }
		}
		$p = (isset($ttH->input["p"])) ? $ttH->input["p"] : 1;
		$search_date_begin = (isset($ttH->input["search_date_begin"])) ? $ttH->input["search_date_begin"] : "";
		$search_date_end = (isset($ttH->input["search_date_end"])) ? $ttH->input["search_date_end"] : "";
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
		
		if(!empty($search_title)){
			$where .=" and (receipt_id='$search_title' or receipt_code like '%$search_title%') ";			
			$ext.="&search_title=".$search_title;
			$is_search = 1;
		}
    
		$num_total = 0;
		$res_num = $ttH->db->query("select receipt_id 
						from repository_receipt 
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
			"receipt_id" => array(
				"title" => $ttH->lang["global"]["id"],
				"link" => $link_action."&p=".$p.$ext."&sort=receipt_id-desc",
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
			"receipt_code" => array(
				"title" => $ttH->lang["repository"]["receipt_code"],
				"link" => $link_action."&p=".$p.$ext."&sort=receipt_code-desc",
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
				$order_tmp = ($tmp[0] == "receipt_id") ? "a.receipt_id" : $tmp[0];
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
		
    $sql = "select * from repository_receipt 
						".$where." 
						limit $start,$n";
    //echo $sql;
		
		$nav = $ttH->admin->admin_paginate ($link_action, $num_total, $n, $ext, $p);
		
		$result = $ttH->db->query($sql);
    $i = 0;
		$data['row_item'] = '';
    $html_row = "";
    if ($num = $ttH->db->num_rows($result))
		{
			while ($row = $ttH->db->fetch_row($result)) 
			{
				$i++;
				$data['row_item'] .= $this->manage_row($row, $is_show);
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