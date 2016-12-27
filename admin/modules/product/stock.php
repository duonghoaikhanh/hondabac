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
	var $modules = "product";
	var $action = "stock";
	var $sub = "manage";
	var $type = "";
	var $type_id = "";
	var $ext_link = "";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		$ttH->func->load_language_admin($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS.$this->action.".tpl");
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		$ttH->func->include_js ($ttH->dir_temp.'js/'.$this->modules.'/'.$this->modules.".js");
		
		include ($this->modules."_func.php");
		
		$this->type = (isset($ttH->get['type'])) ? $ttH->get['type'] : '';
		$this->type_id = (isset($ttH->get['type_id'])) ? (int)$ttH->get['type_id'] : 0;
		$this->ext_link = '&type='.$this->type.'&type_id='.$this->type_id;
		
		if(($this->type != 'product') || $this->type_id<=0) {
			$ttH->html->redirect_rel($ttH->admin->get_link_admin ($this->modules, $this->modules, "manage"));
		}
		
		$data["link_manage"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "manage").$this->ext_link;
		$data["link_import"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "import").$this->ext_link;
		$data["link_manage_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "manage_trash").$this->ext_link;
		$data["link_add"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "add").$this->ext_link;
		
		$this->sub = (isset($ttH->input["sub"])) ? $ttH->input["sub"] : "manage";
		switch ($this->sub) {
			case "add":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->action."_".$this->sub];
				$data["main"] = $this->do_add();
				break;
			case "import":
				$ttH->conf["page_title"] = 'Nhập kho';
				$data["main"] = $this->do_import();
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
		
		$data = array();
		$err = "";
		$dir = create_folder(date("Y_m"));
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			if(empty($ttH->post["list_color"]))
				$err = $ttH->html->html_alert ('Vui lòng chọn màu', "error");
			if(empty($ttH->post["list_size"]))
				$err = $ttH->html->html_alert ('Vui lòng chọn size', "error");	
			
			if(empty($err)){
				$ok = 0;
				$arr_color = $ttH->post["list_color"];
				$arr_size = $ttH->post["list_size"];
				foreach($arr_color as $key => $color) {
					$sql = "select id 
									from product_combine 
									where type='".$this->type."' 
									and type_id='".$this->type_id."' 
									and color_id='".$arr_color[$key]."' 
									and size_id='".$arr_size[$key]."' ";
					$result = $ttH->db->query($sql);
					if (! $ttH->db->num_rows($result)){
						$col = array();
						$col["type"] = $this->type;
						$col["type_id"] = $this->type_id;
						$col["color_id"] = $arr_color[$key];
						$col["size_id"] = $arr_size[$key];
						
						$okf = $ttH->db->do_insert("product_combine", $col);	
						if($okf) {
							$ok++;
						}
					}
				}
				
				if($ok){
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
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub).$this->ext_link;
		$data["link_up"] = $ttH->admin->get_link_admin ('library','library','popup_library').'&type=1&folder_up='.$this->modules.'&fldr='.$dir.'&editor=mce_0';
		$data["list_color"] = list_color ("list_color[]", '', " class=\"form-control\"");
		$data["list_size"] = list_size ("list_size[]", '', " class=\"form-control\"");
		
		for($i=1;$i<=5;$i++) {
			$data['index'] = $i;
			$ttH->temp_act->assign('data', $data);
			$ttH->temp_act->parse("add.row");
		}
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("add");
		return $ttH->temp_act->text("add");
	}
	
	//-----------
	function do_import()
	{
		global $ttH;
		
		$arr_color = $ttH->load_data->data_table ('product_color', 'color_id', 'color_id,color,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		$arr_size = $ttH->load_data->data_table ('product_size', 'size_id', 'size_id,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		
		$data = array();
		$err = "";
		$ext = "";
		
		$link_action = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub).$this->ext_link;
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			$title = (isset($ttH->post["title"])) ? $ttH->post["title"] : '';
			$import = (isset($ttH->post["import"])) ? $ttH->post["import"] : array();
			$receipt_id = (isset($ttH->post["receipt_id"])) ? $ttH->post["receipt_id"] : array();
			
			if($ttH->post['import_type'] == 'new') {
				if(empty($ttH->post["title"])) {
					$err = $ttH->html->html_alert ($ttH->lang["global"]["err_invalid_title"], "error");	
				}
			} else {
				if($receipt_id <= 0) {
					$err = $ttH->html->html_alert ('Vui lòng chọn phiếu', "error");	
				}
			}
			
			$import_ok = 0;
			$list_combine = '';
			if(count($import) > 0) {
				foreach($import as $k => $v) {
					if($v > 0) {
						$import_ok = 1;
						$list_combine .= (!empty($list_combine)) ? ',' : '';
						$list_combine .= $k;
					} else {
						unset($import[$k]);
					}
				}
			}
			
			if($import_ok === 0) {
				$err = $ttH->html->html_alert ('Chưa chọn dữ liệu nhập kho', "error");	
			}
			
			if(empty($err)){
				
				if($ttH->post['import_type'] == 'new') {
					$col = array();
					$col["title"] = $title;
					$col["is_show"] = 0;
					$col["date_create"] = time();
					$col["date_update"] = time();
					$ok = $ttH->db->do_insert("product_receipt", $col);
					if($ok){
						$receipt_id = $ttH->db->insertid();
					}
				} else {
					$ttH->db->query("update product_receipt 
											set date_update=".time()." 
											where receipt_id='".$receipt_id."' ");
					if($ttH->db->affected()) {
						$ok = 1;
					} else {
						$receipt_id = 0;
					}
				}
				if($receipt_id){
					
					$sql = "select * 
									from product_combine 
									where type='".$this->type."' 
									and type_id='".$this->type_id."' 
									and find_in_set(id,'".$list_combine."')>0 ";
					//echo $sql;
					$result = $ttH->db->query($sql);
					while ($row = $ttH->db->fetch_row($result)) 
					{
						$col_l = array();
						$col_l["receipt_id"] = $receipt_id;
						$col_l["type"] = $row["type"];
						$col_l["type_id"] = $row["type_id"];
						$col_l["color_id"] = $row["color_id"];
						$col_l["size_id"] = $row["size_id"];
						$col_l["in_stock"] = $import[$row["id"]];
						$col_l["date_create"] = time();
						$col_l["date_update"] = time();
						
						$ttH->db->query("update product_combine 
											set in_stock=(in_stock+".$col_l["in_stock"]."), 
												date_update=".$col_l["date_update"]." 
											where id='".$row["id"]."' ");
													
						$ttH->db->query("update product_receipt_detail 
											set in_stock=(in_stock+".$col_l["in_stock"]."), 
												date_update=".$col_l["date_update"]."  
											where receipt_id='".$col_l["receipt_id"]."'
											and type='".$col_l["type"]."'
											and type_id='".$col_l["type_id"]."'
											and color_id='".$col_l["color_id"]."'
											and size_id='".$col_l["size_id"]."' ");
						
						if(!$ttH->db->affected()) {
							$ttH->db->do_insert("product_receipt_detail", $col_l);	
						}
					}
					
					$data = array();
					$err = $ttH->html->html_alert ($ttH->lang["global"]["add_success"], "success");
				}else{
					$data = $ttH->post;
					$err = $ttH->html->html_alert ($ttH->lang["global"]["add_success"], "error");	
				}
			}else{
				$data = $ttH->post;
			}
		}
		
    $sql = "select * 
						from product_combine 
						where type='".$this->type."' 
						and type_id='".$this->type_id."' 
						order by color_id desc, size_id desc";
    //echo $sql;
		$result = $ttH->db->query($sql);
    $i = 0;
    if ($num = $ttH->db->num_rows($result))
		{
			while ($row = $ttH->db->fetch_row($result)) 
			{
				$i++;
				
				$row['color'] = (isset($arr_color[$row['color_id']])) ? $arr_color[$row['color_id']] : array();
				$row['size'] = (isset($arr_size[$row['size_id']])) ? $arr_size[$row['size_id']] : array();
				$row['in_stock'] = $ttH->func->format_number($row['in_stock']);
				$row['out_stock'] = $ttH->func->format_number($row['out_stock']);
				$row['import'] = (isset($data['import'][$row['id']])) ? $data['import'][$row['id']] : 0;
				
				$ttH->temp_act->assign('row', $row);
				$ttH->temp_act->parse("import.row_item");
			}
		}
		else
		{
			$ttH->temp_act->assign('row', array("mess"=>$ttH->lang["global"]["no_have_data"]));
			$ttH->temp_act->parse("import.row_empty");
		}
		
		$data['err'] = $err;
		
		$arr_isset = array('receipt_id');
		foreach($arr_isset as $tmp) {
			$data[$tmp] = (isset($data[$tmp])) ? $data[$tmp] : '';
		}
		
		$data['link_action'] = $link_action.$ext;
		$data['list_type'] = $this->get_list_type();
		$data['list_product_receipt_import'] = list_product_receipt_import ("receipt_id", $data["receipt_id"], " class=\"form-control\"", array("title" => $ttH->lang['global']['select_title']));
		
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("import");
		return $ttH->temp_act->text("import");
	}
	
	//-------------- 
  function do_del ($list_del = "")
  {
    global $ttH;
		
		if(empty($list_del)){
			$ttH->html->alert ($ttH->lang["global"]["not_found_product"], $ttH->admin->get_link_admin ($this->modules, $this->action)).$this->ext_link;
		}
		
		$ok = $ttH->db->delete ("product_pic", "find_in_set(id,'".$list_del."')");
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
		
		$arr_color = $ttH->load_data->data_table ('product_color', 'color_id', 'color_id,color,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		$arr_size = $ttH->load_data->data_table ('product_size', 'size_id', 'size_id,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		
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
						$ok = $ttH->db->do_update("product_pic", $dup, "id=" . $up_id[$i]);
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
						$ok = $ttH->db->do_update("product_pic", $dup, "id=" . $up_id[$i]);
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
						$ok = $ttH->db->do_update("product_pic", $dup, "id=" . $up_id[$i]);
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
		$date_begin = (isset($ttH->input["date_begin"])) ? $ttH->input["date_begin"] : "";
		$date_end = (isset($ttH->input["date_end"])) ? $ttH->input["date_end"] : "";
		$search = (isset($ttH->input["search"])) ? $ttH->input["search"] : "id";
		$keyword = (isset($ttH->input["keyword"])) ? $ttH->input["keyword"] : "";
		
		$where = " where type='".$this->type."' and type_id='".$this->type_id."' ";
		$ext = "";
		
		if($date_begin || $date_end ){
			$tmp1 = @explode("/", $date_begin);
			$time_begin = @mktime(0, 0, 0, $tmp1[1], $tmp1[0], $tmp1[2]);
			
			$tmp2 = @explode("/", $date_end);
			$time_end = @mktime(23, 59, 59, $tmp2[1], $tmp2[0], $tmp2[2]);
			
			$where.=" AND (date_add BETWEEN {$time_begin} AND {$time_end} ) ";
			$ext.="&date_begin=".$date_begin."&date_end=".$date_end;
		}
		
		if(!empty($keyword)){
			switch($search){
				case "id" : $where .=" and  id = $keyword ";   break;
				default :$where .=" and $search like '%$keyword%' ";break;		
			}
			
			$ext.="&search=".$search."&keyword=".$keyword;
		}
    
		$num_total = 0;
		$res_num = $ttH->db->query("select id from product_combine ".$where." ");
			$num_total = $ttH->db->num_rows($res_num);
		$n = ($ttH->conf["n_list"]) ? $ttH->conf["n_list"] : 30;
		$num_products = ceil($num_total / $n);
		if ($p > $num_products)
		  $p = $num_products;
		if ($p < 1)
		  $p = 1;
		$start = ($p - 1) * $n;
		
		$link_action = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub).$this->ext_link;
		
		//Sort
		$arr_title = array(
			"color_id" => array(
				"title" => $ttH->lang["product"]["color"],
				"link" => $link_action."&p=".$p.$ext."&sort=color_id-desc",
				"class" => ""
			),
			"size_id" => array(
				"title" => $ttH->lang["product"]["size"],
				"link" => $link_action."&p=".$p.$ext."&sort=size_id-desc",
				"class" => ""
			),
			"in_stock" => array(
				"title" => 'Tồn kho',
				"link" => $link_action."&p=".$p.$ext."&sort=in_stock-desc",
				"class" => ""
			),
			"out_stock" => array(
				"title" => 'Đã Xuất',
				"link" => $link_action."&p=".$p.$ext."&sort=out_stock-desc",
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
				$order_tmp = ($tmp[0] == "id") ? "a.id" : $tmp[0];
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
			$where .= " order by color_id desc, size_id desc";
		}
		//End sort
		
		//Title row
		foreach($arr_title as $k => $v)
		{
			$class = ($v["class"]) ? " class='".$v["class"]."'" : "";
			$data["f_".$k] = '<a href="'.$v["link"].'" '.$class.'>'.$v["title"].'</a>';
		}
		//End title row
		
    $sql = "select * from product_combine ".$where." limit $start,$n";
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
				
				$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "edit", array("id"=>$row['id'])).$this->ext_link;
				$row["link_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_trash","id"=>$row['id'])).$this->ext_link;
				$row["link_restore"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_restore","id"=>$row['id'])).$this->ext_link;
				$row["link_del"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row['id'])).$this->ext_link;
				
				$row['color'] = (isset($arr_color[$row['color_id']])) ? $arr_color[$row['color_id']] : array();
				$row['size'] = (isset($arr_size[$row['size_id']])) ? $arr_size[$row['size_id']] : array();
				$row['in_stock'] = $ttH->func->format_number($row['in_stock']);
				$row['out_stock'] = $ttH->func->format_number($row['out_stock']);
				
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
		
		$data['date_begin'] = $date_begin;
		$data['date_end'] = $date_end;
		$data['keyword'] = $keyword;
		$data['list_type'] = $this->get_list_type();
		
		if($is_show == "trash"){
			$ttH->temp_act->parse("manage.button_manage");
		}else{
			$ttH->temp_act->parse("manage.button_trash");
		}
		
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("manage");
		return $ttH->temp_act->text("manage");
	}
	
	//-----------
	function get_list_type()
	{
		global $ttH;
		
		$output = "";		
		
		switch ($this->type) {
			case "product":
				$link = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
				$ext = "onchange=\"go_link('".$link."&type=".$this->type."&type_id='+this.value)\"";
				if($this->sub == 'edit') {
					$ext = '';
				}
				$output = list_product ("type_id", $this->type_id, " class=\"form-control\" ".$ext, array("title" => $ttH->lang['global']['select_title']));
				break;
		}
		
		return $output;
	}

  // end class
}
?>