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
	* function sMain_sub ()
	* Khoi tao 
	**/
	function sMain_sub ()
	{
		global $ttH;
		$ttH->func->load_language_admin($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS.$this->temp.".tpl");
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		require_once("modules/".$this->modules."/".$this->modules."_func.php");
		
		$data["link_manage"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, "manage");
		$data["link_manage_trash"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, "manage_trash");
		$data["link_add"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, "add");
		
		$is_show = 'manage';
		if($this->action === 'receipt') {
			$is_show = 'all';
		} elseif($this->action === 'receipt_approved') {
			$is_show = 'manage';
		} elseif($this->action === 'receipt_unapproved') {
			$is_show = 'trash';
		}
		
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
				$data["main"] = $this->do_manage($is_show);
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
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			$receipt_id = (isset($ttH->post["receipt_id"])) ? $ttH->post["receipt_id"] : 0;
			$code = (isset($ttH->post["code"])) ? $ttH->post["code"] : '';
			
			if(empty($err) && empty($code)) {
				$err = $ttH->html->html_alert ('Mã số chưa nhập', "error");	
			}	

			if(empty($err)){
				$sql = "select code from repository_receipt_import where code='".$code."'";
				$result = $ttH->db->query($sql);
				if ($check = $ttH->db->fetch_row($result)){
					$err = $ttH->html->html_alert ('Mã số đã tồn tại', "error");	
				}
			}
			
			$receipt_info = array();
			if(empty($err)){
				$sql = "select receipt_id, receipt_code from repository_receipt where is_show=1 and receipt_id='".$receipt_id."'";
				$result = $ttH->db->query($sql);
				if ($receipt_info = $ttH->db->fetch_row($result)){
				} else {
					$err = $ttH->html->html_alert ('Phiếu đề nghị không hợp lệ', "error");
				}
			}
			
			/*print_arr($ttH->post);
			die();*/
			
			if(empty($err)){
				$col = array();
				$col["code"] = $code;
				$col["receipt_type"] = $this->receipt_type;
				$col["type_code"] = $receipt_info['receipt_code'];
				$col["show_order"] = 0;
				$col["is_show"] = 0;
				$col["admin_id"] = $ttH->data['admin']["id"];
				$col["date_create"] = time();
				$col["date_update"] = time();
				$ok = $ttH->db->do_insert("repository_receipt_import", $col);	
				if($ok){
					$id = $ttH->db->insertid();
					
					$ttH->db->query("update repository_receipt 
										set is_show=2, 
											admin_finish='".$ttH->data['admin']["id"]."' , 
											date_update='".time()."' 
										where receipt_id='".$receipt_id."'");

					if($ttH->db->affected()) {
						$sql = "select * 
										from repository_receipt_detail 
										where receipt_id='".$receipt_id."' 
										and is_level=1 ";
						//echo $sql;
						$result = $ttH->db->query($sql);
						while ($row = $ttH->db->fetch_row($result)) {
							
							// if not has product_combine, Insert product_combine
							$ttH->db->query("update product_combine 
												set in_stock=(in_stock+".$row["quantity"]."), 
													date_update=".$row["date_update"]." 
												where type='".$row["type"]."'
												and type_id='".$row["type_id"]."'
												and color_id='".$row["color_id"]."'
												and size_id='".$row["size_id"]."' ");
							if(!$ttH->db->affected()) {
								$col_c = $row;
								$col_c['in_stock'] = $row['quantity'];
								unset($col_c["receipt_id"]);
								unset($col_c["is_level"]);
								unset($col_c["quantity"]);
								
								$ttH->db->do_insert("product_combine", $col_c);	
							}
							// End
						}
						
						$sql = "select * 
										from repository_receipt_detail 
										where receipt_id='".$receipt_id."' 
										and is_level=0 ";
						//echo $sql;
						$result = $ttH->db->query($sql);
						while ($row = $ttH->db->fetch_row($result)) {
							
							$ttH->db->query("update product 
												set in_stock=(in_stock+".$row["quantity"]."), 
													price_import=".$row["price"].", 
													date_update=".$row["date_update"]." 
												where item_id='".$row["type_id"]."' ");
						}
						$data = array();
						$err = $ttH->html->html_alert ($ttH->lang["global"]["add_success"], "success");	
					}	else{
						$data = $ttH->post;
						$err = $ttH->html->html_alert ($ttH->lang["global"]["add_false"], "error");	
					}	
				}else{
					$data = $ttH->post;
					$err = $ttH->html->html_alert ($ttH->lang["global"]["add_false"], "error");	
				}
			}else{
				$data = $ttH->post;
			}
		}
		
		$data["err"] = $err;
		
		$arr_isset = array('receipt_id');
		foreach($arr_isset as $tmp) {
			$data[$tmp] = (isset($data[$tmp])) ? $data[$tmp] : '';
		}
		
		$data['date_create'] = (isset($data['date_create'])) ? $data['date_create'] : date('d/m/Y');
		$data['date_create_hour'] = (isset($data['date_create_hour'])) ? $data['date_create_hour'] : date('H');
		$data['date_create_minute'] = (isset($data['date_create_minute'])) ? $data['date_create_minute'] : date('i');
		
		$data['code'] = (isset($data['code'])) ? $data['code'] : receipt_import_code_next();
		
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, $this->sub);
		
		$data["list_receipt"] = list_receipt ("receipt_id", $data["receipt_id"], " class=\"form-control\"", array('title'=>$ttH->lang['global']['select_title']));
		$data["list_hour"] = $ttH->admin->list_number ("date_create_hour", 0, 23, $data["date_create_hour"]);
		$data["list_minute"] = $ttH->admin->list_number ("date_create_minute", 0, 59, $data["date_create_minute"]);
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("edit");
		return $ttH->temp_act->text("edit");
	}
	
	//-----------
	function do_edit()
	{
		global $ttH;
		
		$err = "";
		
		$dir = create_folder(date("Y_m"));
		
		$id = $ttH->input["id"];
		$sql = "select * from repository_receipt_import 
						where id='".$id."'";
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
		} else {
			$link_go = $ttH->admin->get_link_admin ($this->modules_call, $this->action);
			$ttH->html->alert($ttH->lang['global']['not_found_page'], $link_go);
		}
		
		$arr_admin = $ttH->load_data->data_table ('admin', 'id', 'id,full_name', " find_in_set(id,'".$data['admin_id'].",".$data['admin_edit']."')>0 ");
		
		$data['admin_poster'] = (isset($arr_admin[$data['admin_id']])) ? $arr_admin[$data['admin_id']] : array();
		$data['admin_editor'] = (isset($arr_admin[$data['admin_edit']])) ? $arr_admin[$data['admin_edit']] : array();
		
		$data["err"] = $err;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, $this->sub, array("id"=>$id));
		$data['date_create'] = $ttH->func->get_date_format ($data['date_create'], 1);
		$data['date_update'] = $ttH->func->get_date_format ($data['date_update'], 1);		
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("view");
		return $ttH->temp_act->text("view");
	}

	//-------------- 
  function do_del ($list_del = "")
  {
    global $ttH;
		
		if(empty($list_del)){
			$ttH->html->alert ($ttH->lang["global"]["not_found_product"], $ttH->admin->get_link_admin ($this->modules_call, $this->action));
		}
		
		$ok = 0;//$ttH->db->delete ("repository_receipt_import", "find_in_set(receipt_id,'".$list_del."')");
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
		
		$row["link_view"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, "view", array("id"=>$row['id']));
		$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, "edit", array("id"=>$row['id']));
		$row["link_trash"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, $this->sub, array("do_action"=>"do_trash","id"=>$row['id']));
		$row["link_restore"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, $this->sub, array("do_action"=>"do_restore","id"=>$row['id']));
		$row["link_del"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row['id']));
		
		$arr_admin = $ttH->load_data->data_table ('admin', 'id', 'id,full_name');
		$row['admin_poster'] = (isset($arr_admin[$row['admin_id']])) ? $arr_admin[$row['admin_id']] : array();
		
		$row['date_create'] = date('d/m/Y',$row['date_create']);
		
		$ttH->temp_act->assign('row', $row);
		if($row['is_show'] == 0){
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
						$ok = $ttH->db->do_update("repository_receipt_import", $dup, "id=" . $up_id[$i]);
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
		
		$where = " where 1 ";
		$ext = "";
		$is_search = 0;
		
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
			$where .=" and (id='$search_title' or code like '%$search_title%') ";			
			$ext.="&search_title=".$search_title;
			$is_search = 1;
		}
    
		$num_total = 0;
		$res_num = $ttH->db->query("select id 
						from repository_receipt_import 
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
			"id" => array(
				"title" => $ttH->lang["global"]["id"],
				"link" => $link_action."&p=".$p.$ext."&sort=id-desc",
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
			"code" => array(
				"title" => 'Mã số',
				"link" => $link_action."&p=".$p.$ext."&sort=code-desc",
				"class" => ""
			),
			"receipt_code" => array(
				"title" => 'Mã phiếu đề nghị',
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
				$order_tmp = ($tmp[0] == "id") ? "id" : $tmp[0];
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
		
    $sql = "select * from repository_receipt_import 
						".$where." 
						limit $start,$n";
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