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
		
		$data["link_stock"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, "stock");
		$data["link_manage"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, "manage");
		$data["link_manage_trash"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, "manage_trash");
		$data["link_add"] = $ttH->admin->get_link_admin ($this->modules_call, 'receipt', "add");
		
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
			case "view":
				$ttH->conf["page_title"] = 'Xem và duyệt phiếu kho';
				$data["main"] = $this->do_view();
				break;
			case "manage_trash":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->action."_".$this->sub];
				$data["main"] = $this->do_manage("trash");
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
		
		$ttH->func->include_js($ttH->dir_temp.'js/'.$this->modules.'/'.$this->modules.'.js');
		
		$arr_color = $ttH->load_data->data_table ('product_color', 'color_id', 'color_id,color,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		$arr_size = $ttH->load_data->data_table ('product_size', 'size_id', 'size_id,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		
		$data = array();
		$err = "";
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			$receipt_code = (isset($ttH->post["receipt_code"])) ? $ttH->post["receipt_code"] : '';
			
			if(empty($err) && empty($receipt_code)) {
				$err = $ttH->html->html_alert ('Mã số chưa nhập', "error");	
			}	

			if(empty($err)){
				$sql = "select receipt_code from repository_receipt where receipt_code='".$receipt_code."'";
				$result = $ttH->db->query($sql);
				if ($check = $ttH->db->fetch_row($result)){
					$err = $ttH->html->html_alert ('Mã số đã tồn tại', "error");	
				}
			}
			
			$price = (isset($ttH->post["price"])) ? $ttH->post["price"] : array();
			$import = (isset($ttH->post["import"])) ? $ttH->post["import"] : array();
			$import_sub = (isset($ttH->post["import_sub"])) ? $ttH->post["import_sub"] : array();
			
			if(empty($err) && count($import) <= 0) {
				$err = $ttH->html->html_alert ('Chưa chọn sản phẩm nhập', "error");	
			}	
			
			$has_import = 0;
			foreach ($import as $k => $v) {
				if($v > 0) {
					$has_import = 1;
				}
			}
			
			foreach ($import_sub as $k => $v) {
				if($v <= 0) {
					unset($import_sub[$k]);
				}
			}
			
			if(empty($err) && ($has_import === 0 && count($import_sub) <= 0)) {
				$err = $ttH->html->html_alert ('Chưa nhập số lượng hàng', "error");	
			}
			
			/*print_arr($ttH->post);
			print_arr($price);
			print_arr($import);
			print_arr($import_sub);
			die();*/
			
			if(empty($err)){
				$col = array();
				$col["receipt_code"] = $receipt_code;
				$col["receipt_type"] = $this->receipt_type;
				$col["repository_id"] = $ttH->post['repository_id'];
				$col["show_order"] = 0;
				$col["is_show"] = 0;
				$col["admin_id"] = $ttH->data['admin']["id"];
				$col["date_create"] = time();
				$col["date_update"] = time();
				$ok = $ttH->db->do_insert("repository_receipt", $col);	
				if($ok){
					$receipt_id = $ttH->db->insertid();		
					
					$arr_type_in_stock = array();
					foreach ($import_sub as $k => $v) {
						
						$arr_tmp = explode('_',$k);
						
						$col_l = array();
						$col_l["receipt_id"] = $receipt_id;
						$col_l["is_level"] = 1;
						$col_l["type"] = 'product';
						$col_l["type_id"] = str_replace('p','',$arr_tmp[0]);
						$col_l["color_id"] = str_replace('c','',$arr_tmp[1]);
						$col_l["size_id"] = str_replace('s','',$arr_tmp[2]);
						$col_l["quantity"] = $v;
						$col_l["date_create"] = time();
						$col_l["date_update"] = time();
						
						$arr_type_in_stock[$col_l["type_id"]] = (isset($arr_type_in_stock[$col_l["type_id"]])) ? $arr_type_in_stock[$col_l["type_id"]]+$col_l["quantity"] : $col_l["quantity"];
						
						$where = "and type='".$col_l["type"]."'
											and type_id='".$col_l["type_id"]."'
											and color_id='".$col_l["color_id"]."'
											and size_id='".$col_l["size_id"]."' ";
											
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
					
					foreach($import as $k => $v) {
						if(isset($arr_type_in_stock[$k]) && $arr_type_in_stock[$k] > 0) {
							$v = $arr_type_in_stock[$k];
						}
						
						if($v > 0) {
							$col_l = array();
							$col_l["receipt_id"] = $receipt_id;
							$col_l["is_level"] = 0;
							$col_l["type"] = 'product';
							$col_l["type_id"] = $k;
							$col_l["color_id"] = 0;
							$col_l["size_id"] = 0;
							$col_l["price"] = (isset($price[$k])) ? $price[$k] : 0;
							$col_l["quantity"] = $v;
							$col_l["date_create"] = time();
							$col_l["date_update"] = time();
							$ttH->db->do_insert("repository_receipt_detail", $col_l);
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
		
		$arr_isset = array('repository_id','list_product');
		foreach($arr_isset as $tmp) {
			$data[$tmp] = (isset($data[$tmp])) ? $data[$tmp] : '';
		}
		
		$data['date_create'] = (isset($data['date_create'])) ? $data['date_create'] : date('d/m/Y');
		$data['date_create_hour'] = (isset($data['date_create_hour'])) ? $data['date_create_hour'] : date('H');
		$data['date_create_minute'] = (isset($data['date_create_minute'])) ? $data['date_create_minute'] : date('i');
		
		$data['receipt_code'] = (isset($data['receipt_code'])) ? $data['receipt_code'] : receipt_code_next();
		
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, $this->sub);
		
		$data["list_product"] = list_product ("list_product", $data["list_product"], " class=\"form-control\" id=\"list_product\"", array('title'=>$ttH->lang['global']['select_title']));
		$data["list_repository"] = list_repository ("repository_id", $data["repository_id"], " class=\"form-control\"", array('title'=>$ttH->lang['global']['select_title']));
		$data["list_hour"] = $ttH->admin->list_number ("date_create_hour", 0, 23, $data["date_create_hour"]);
		$data["list_minute"] = $ttH->admin->list_number ("date_create_minute", 0, 59, $data["date_create_minute"]);
		
		foreach($arr_color as $row_color) {
			foreach($arr_size as $row_size) {
				$row_sub['sub_id'] = 'c'.$row_color['color_id'].'_s'.$row_size['size_id'];
				$row_sub['color'] = $row_color;
				$row_sub['size'] = $row_size;
				$row_sub['in_stock'] = 0;
				$row_sub['out_stock'] = 0;
				$row_sub['import'] = 0;
				
				$ttH->temp_act->assign('row', $row_sub);
				$ttH->temp_act->parse("add.row_sub_item");
			}
		}
		
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
		
		$sql = "select is_show from repository_receipt 
						where receipt_id='".$receipt_id."' and is_show=0";
    $result = $ttH->db->query($sql);
    if (!$ttH->db->num_rows($result)){
			$link_go = $ttH->admin->get_link_admin ($this->modules_call, $this->action);
			$ttH->html->alert($ttH->lang['global']['not_found_page'], $link_go);
		}
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			$price = (isset($ttH->post["price"])) ? $ttH->post["price"] : array();
			$import = (isset($ttH->post["import"])) ? $ttH->post["import"] : array();
			$import_sub = (isset($ttH->post["import_sub"])) ? $ttH->post["import_sub"] : array();
			
			if(empty($err) && count($import) <= 0) {
				$err = $ttH->html->html_alert ('Chưa chọn sản phẩm nhập', "error");	
			}	
			
			$has_import = 0;
			foreach ($import as $k => $v) {
				if($v > 0) {
					$has_import = 1;
				}
			}
			
			foreach ($import_sub as $k => $v) {
				if($v <= 0) {
					unset($import_sub[$k]);
				}
			}
			
			if(empty($err) && ($has_import === 0 && count($import_sub) <= 0)) {
				$err = $ttH->html->html_alert ('Chưa nhập số lượng hàng', "error");	
			}
			
			/*print_arr($ttH->post);
			print_arr($price);
			print_arr($import);
			print_arr($import_sub);
			die();*/
			
			if(empty($err)){
				$col = array();
				$col["is_show"] = 0;
				$col["admin_edit"] = $ttH->data['admin']["id"];
				$col["date_update"] = time();
				$ok = $ttH->db->do_update("repository_receipt", $col, " receipt_id='".$receipt_id."'");	
				if($ok){					
					$arr_type_in_stock = array();
					$type = 'product';
					foreach ($import_sub as $k => $v) {
						
						$arr_tmp = explode('_',$k);
						$type_id = str_replace('p','',$arr_tmp[0]);
						$id = str_replace('id','',$arr_tmp[1]);
						
						$col_l = array();
						$col_l["quantity"] = $v;
						$col_l["date_update"] = time();
						
						$arr_type_quantity[$type_id] = (isset($arr_type_quantity[$type_id])) ? $arr_type_quantity[$type_id]+$col_l["quantity"] : $col_l["quantity"];
											
						$ttH->db->do_update("repository_receipt_detail", $col_l, "
							receipt_id='".$receipt_id."'
							and is_level=1 
							and id='".$id."' 
						");
					}
					
					foreach($import as $k => $v) {
						if(isset($arr_type_quantity[$k]) && $arr_type_quantity[$k] > 0) {
							$v = $arr_type_quantity[$k];
						}
						
						if($v > 0) {
							$col_d = array();
							$col_d["price"] = (isset($price[$k])) ? $price[$k] : 0;
							$col_d["quantity"] = $v;
							$col_d["date_update"] = time();
							$ttH->db->do_update("repository_receipt_detail", $col_d, "
								receipt_id='".$receipt_id."'
								and is_level=0 
								and type='".$type."' 
								and type_id='".$k."' 
							");
						}
					}
					
					$data = array();
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_success"], "success");	
				}else{
					$data = $ttH->post;
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_false"], "error");	
				}
			}else{
				$data = $ttH->post;
			}
		}
		
		$sql = "select * from repository_receipt 
						where receipt_id='".$receipt_id."'";
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
		} else {
			$link_go = $ttH->admin->get_link_admin ($this->modules_call, $this->action);
			$ttH->html->alert($ttH->lang['global']['not_found_page'], $link_go);
		}
		
		$arr_repository = $ttH->load_data->data_table ('repository', 'item_id', 'item_id,title', " lang='".$ttH->conf['lang_cur']."' ");
		$arr_product = $ttH->load_data->data_table ('product_lang', 'item_id', 'item_id,title', " lang='".$ttH->conf['lang_cur']."' ");
		$arr_color = $ttH->load_data->data_table ('product_color', 'color_id', 'color_id,color,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		$arr_size = $ttH->load_data->data_table ('product_size', 'size_id', 'size_id,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		
		$data['repository'] = (isset($arr_repository[$data['repository_id']])) ? $arr_repository[$data['repository_id']] : array();
		
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
				
				$row['sub_id'] = 'p'.$row['type_id'].'_id'.$row['id'];
				
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
				$row['view_detail'] = (isset($arr_sub[$row['type'].'_'.$row['type_id']])) ? '<a href="#sub_'.$row['type'].'_'.$row['type_id'].'" class="fancybox">Click</a>' : '---';
				
				$row['item_id'] = $row['type_id'];
				
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
	
	//-----------
	function do_view()
	{
		global $ttH;
		
		$ttH->func->include_js($ttH->dir_temp.'js/'.$this->modules.'/'.$this->modules.'.js');
		
		$err = "";
		
		$dir = create_folder(date("Y_m"));
		
		$receipt_id = $ttH->input["id"];
		
		$sql = "select is_show from repository_receipt 
						where receipt_id='".$receipt_id."' and is_show=0";
    $result = $ttH->db->query($sql);
    if ($ttH->db->num_rows($result)){
			if (isset($ttH->post['do_submit'])) {
				/*print_arr($ttH->post);
				die();*/
				
				if(empty($err)){
					$col = array();
					$col["is_show"] = 1;
					$col["admin_finish"] = $ttH->data['admin']["id"];
					$col["date_update"] = time();
					$ok = $ttH->db->do_update("repository_receipt", $col, " receipt_id='".$receipt_id."'");	
					if($ok){		
						
						/*$sql = "select * 
										from repository_receipt_detail 
										where receipt_id='".$receipt_id."' 
										and is_level=1 ";
						//echo $sql;
						$result = $ttH->db->query($sql);
						while ($row = $ttH->db->fetch_row($result)) {
							
							// if not has product_combine, Insert product_combine
							$ttH->db->query("update product_combine 
												set in_stock=(in_stock+".$row["in_stock"]."), 
													date_update=".$row["date_update"]." 
												where type='".$row["type"]."'
												and type_id='".$row["type_id"]."'
												and color_id='".$row["color_id"]."'
												and size_id='".$row["size_id"]."' ");
							if(!$ttH->db->affected()) {
								$col_c = $row;
								unset($col_c["receipt_id"]);
								unset($col_c["is_level"]);
								
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
												set in_stock=(in_stock+".$row["in_stock"]."), 
													date_update=".$row["date_update"]." 
												where item_id='".$row["type_id"]."' ");
						}*/
						
						$data = array();
						$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_success"], "success");	
					}else{
						$data = $ttH->post;
						$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_false"], "error");	
					}
				}else{
					$data = $ttH->post;
				}
			}
		}
		
		$sql = "select * from repository_receipt 
						where receipt_id='".$receipt_id."'";
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
			if($data['is_show'] < 1) {
				$ttH->temp_act->parse("view.alert");
			}			
		} else {
			$link_go = $ttH->admin->get_link_admin ($this->modules_call, $this->action);
			$ttH->html->alert($ttH->lang['global']['not_found_page'], $link_go);
		}
		
		$arr_admin = $ttH->load_data->data_table ('admin', 'id', 'id,full_name', " find_in_set(id,'".$data['admin_id'].",".$data['admin_edit'].",".$data['admin_finish']."')>0 ");
		$arr_product = $ttH->load_data->data_table ('product_lang', 'item_id', 'item_id,title', " lang='".$ttH->conf['lang_cur']."' ");
		$arr_color = $ttH->load_data->data_table ('product_color', 'color_id', 'color_id,color,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		$arr_size = $ttH->load_data->data_table ('product_size', 'size_id', 'size_id,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		
		$data['admin_poster'] = (isset($arr_admin[$data['admin_id']])) ? $arr_admin[$data['admin_id']] : array();
		$data['admin_editor'] = (isset($arr_admin[$data['admin_edit']])) ? $arr_admin[$data['admin_edit']] : array();
		$data['admin_finish'] = (isset($arr_admin[$data['admin_finish']])) ? $arr_admin[$data['admin_finish']] : array();
		
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
				$ttH->temp_act->parse("view.row_sub.row_sub_item");
				if(!isset($arr_sub[$row['type'].'_'.$row['type_id']])) {
					$arr_sub[$row['type'].'_'.$row['type_id']] = '';
				}
				$arr_sub[$row['type'].'_'.$row['type_id']] .= $ttH->temp_act->text("view.row_sub.row_sub_item");
				$ttH->temp_act->reset("view.row_sub.row_sub_item");
			}
		}	else {
			$ttH->temp_act->assign('row', array("mess"=>$ttH->lang["global"]["no_have_data"]));
			$ttH->temp_act->parse("view.row_sub.row_sub_empty");
		}
		
		$f_stock = ($data['receipt_type'] === 'import') ? 'Nhập kho' : 'Xuất kho';
		foreach($arr_sub as $list_id => $html) {
			$ttH->temp_act->assign('data', array("list_id"=>$list_id, "list"=>$html, "f_stock" => $f_stock));
			$ttH->temp_act->parse("view.row_sub");
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
				$ttH->temp_act->parse("view.row_item");
			}
		}	else{
			$ttH->temp_act->assign('row', array("mess"=>$ttH->lang["global"]["no_have_data"]));
			$ttH->temp_act->parse("view.row_empty");
		}
		
		$data["err"] = $err;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, $this->sub, array("id"=>$receipt_id));
		$data['f_stock'] = $f_stock;
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
		
		$row["link_view"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, "view", array("id"=>$row['receipt_id']));
		$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, "edit", array("id"=>$row['receipt_id']));
		$row["link_trash"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, $this->sub, array("do_action"=>"do_trash","id"=>$row['receipt_id']));
		$row["link_restore"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, $this->sub, array("do_action"=>"do_restore","id"=>$row['receipt_id']));
		$row["link_del"] = $ttH->admin->get_link_admin ($this->modules_call, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row['receipt_id']));
		
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
		
		$where = " where receipt_type='".$this->receipt_type."' ";
		$ext = "";
		$is_search = 0;
		
		if($is_show == "trash" ){
			$where .= " and is_show=0 ";
		}elseif($is_show == "manage" ){
			$where .= " and is_show>=1 ";
		}else{
			$where .= " ";
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