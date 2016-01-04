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
	var $modules_include = "common";
	//var $action = "receipt";
	//var $sub = "manage";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain_sub () {
		global $ttH;
		
		if(!isset($this->arr_element)) {
			$this->arr_element = array();
		}
		if(!isset($this->path_tbl)) {
			$this->path_tbl = $ttH->path_html.$this->modules_include.DS.$this->tbl_name.".tpl";
		}
		
		$ttH->func->load_language_admin($this->modules);
		$ttH->temp_act = new XTemplate($this->path_tbl);
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		require_once ("modules/".$this->modules_include."/".$this->modules_include."_func.php");
		$this->func = new commonFunc;
		
		$this->dir = $this->func->create_folder(date("Y_m"));
		
		$data["link_manage"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "manage");
		$data["link_manage_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "manage_trash");
		$data["link_add"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "add");
		
		$this->sub = (isset($ttH->input["sub"])) ? $ttH->input["sub"] : "manage";
		switch ($this->sub) {
			case "add":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->modules."_".$this->action."_".$this->sub];
				$data["main"] = $this->do_add();
				break;
			case "edit":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->modules."_".$this->action."_".$this->sub];
				$data["main"] = $this->do_edit();
				break;
			case "manage_trash":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->modules."_".$this->action."_".$this->sub];
				$data["main"] = $this->do_manage("trash");
				break;
			default:
				$this->sub = "manage";
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->modules."_".$this->action."_manage"];
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
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			foreach($this->arr_element as $k => $v) {
				if($err) {
					break;
				}
				$required = (isset($v['required'])) ? $v['required'] : false;
				if($required === false) {
					continue;
				}
				$err = $this->func->_required($k, $v);
			}
			
			if(empty($err)){
				$col = array();
				$col["parent_id"] = (isset($ttH->post['parent_id']) ? $ttH->post['parent_id'] : 0);
				
				foreach($this->arr_element as $k => $v) {
					if($k == 'lang') {
						continue;
					}
					$col[$k] = $this->func->_inputdb($k, $v);
				}
				/*print_arr($ttH->post);
				print_arr($col);
				die();*/
				$i = 0;
				foreach($ttH->data["lang"] as $lang_id => $lang_row){
					$i++;
					
					if(array_key_exists('lang', $this->arr_element)) {
						if(isset($item_id) && $item_id) {
							$friendly_link = ($ttH->post["friendly_link"]) ? $ttH->post["friendly_link"] : $ttH->post["title"];
							$col["friendly_link"] = $ttH->func->get_friendly_link_db ($friendly_link, $this->dbtable, $this->dbtable_id, $item_id, $lang_row["name"]);
							$col["meta_title"] = ($ttH->post["meta_title"]) ? $ttH->post["meta_title"] : $ttH->func->meta_title ($ttH->post["title"]);
							$col["meta_key"] = ($ttH->post["meta_key"]) ? $ttH->post["meta_key"] : $ttH->func->meta_key ($ttH->post["title"]);
							$col["meta_desc"] = ($ttH->post["meta_desc"]) ? $ttH->func->meta_desc ($ttH->post["meta_desc"]) : $ttH->func->meta_desc (isset($ttH->post["content"]) ? $ttH->post["content"] : '');
						}
						
						$col["lang"] = $lang_row["name"];
					} elseif($i > 1) {
						break;
					}
					
					$ok = $ttH->db->do_insert($this->dbtable, $col);	
					if($ok && (!isset($col[$this->dbtable_id]))){
						$item_id = $ttH->db->insertid();
						$col[$this->dbtable_id] = $item_id;
						$col["group_nav"] = $this->func->get_group_nav ($col["parent_id"], $item_id,'group');
						$col["group_level"] = substr_count($col['group_nav'],',') + 1;
						
						$col_l = array();
						$col_l[$this->dbtable_id] = $item_id;
						
						
						$col_l["group_nav"] = $col["group_nav"];
						$col_l["group_level"] = $col["group_level"];
						
						$friendly_link = ($ttH->post["friendly_link"]) ? $ttH->post["friendly_link"] : $ttH->post["title"];
						$col_l["friendly_link"] = $ttH->func->get_friendly_link_db ($friendly_link, $this->dbtable, $this->dbtable_id, $item_id, $lang_row["name"]);
						$col_l["meta_title"] = ($ttH->post["meta_title"]) ? $ttH->post["meta_title"] : $ttH->func->meta_title ($ttH->post["title"]);
						$col_l["meta_key"] = ($ttH->post["meta_key"]) ? $ttH->post["meta_key"] : $ttH->func->meta_key ($ttH->post["title"]);
						$col_l["meta_desc"] = ($ttH->post["meta_desc"]) ? $ttH->func->meta_desc ($ttH->post["meta_desc"]) : $ttH->func->meta_desc (isset($ttH->post["content"]) ? $ttH->post["content"] : '');
						
						$ttH->db->do_update($this->dbtable, $col_l, " id='".$item_id."'");	// update current
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
		
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
		
		return $this->func->_form_input($data);
	}
	
	//-----------
	function do_edit()
	{
		global $ttH;
		
		$err = "";
		
		$item_id = $ttH->input["id"];
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			foreach($this->arr_element as $k => $v) {
				if($err) {
					break;
				}
				$required = (isset($v['required'])) ? $v['required'] : false;
				if($required === false) {
					continue;
				}
				$err = $this->func->_required($k, $v);
			}
			
			if(empty($err)){
				$col = array();
				$col["parent_id"] = (isset($ttH->post['parent_id']) ? $ttH->post['parent_id'] : 0);
				$col["group_nav"] = $this->func->get_group_nav ($col["parent_id"],$item_id,'group');
				$col["group_level"] = substr_count($col['group_nav'],',') + 1;
				
				foreach($this->arr_element as $k => $v) {
					$of_lang = (isset($v['of_lang'])) ? true : false;
					if($of_lang == true) {
						continue;
					}
					if($k == 'lang') {
						continue;
					}
					if(isset($v['only']) && $v['only']!=$this->sub) {
						continue;
					}
					$col[$k] = $this->func->_inputdb($k, $v);
				}
				
				/*print_arr($ttH->post);
				print_arr($col);
				die();*/
				
				$ok = $ttH->db->do_update($this->dbtable, $col, " ".$this->dbtable_id."='".$item_id."'");	
				if($ok){
					$col_l = array();
					
					foreach($this->arr_element as $k => $v) {
						$of_lang = (isset($v['of_lang'])) ? true : false;
						if($of_lang == false) {
							continue;
						}
						if($k == 'lang') {
							continue;
						}
						$col_l[$k] = $this->func->_inputdb($k, $v);
					}
					
					$friendly_link = ($ttH->post["friendly_link"]) ? $ttH->post["friendly_link"] : $ttH->post["title"];
					$col_l["friendly_link"] = $ttH->func->get_friendly_link_db ($friendly_link, $this->dbtable, $this->dbtable_id, $item_id, $ttH->conf['lang_cur']);
					$col_l["meta_title"] = ($ttH->post["meta_title"]) ? $ttH->post["meta_title"] : $ttH->func->meta_title ($ttH->post["title"]);
					$col_l["meta_key"] = ($ttH->post["meta_key"]) ? $ttH->post["meta_key"] : $ttH->func->meta_key ($ttH->post["title"]);
					$col_l["meta_desc"] = ($ttH->post["meta_desc"]) ? $ttH->func->meta_desc ($ttH->post["meta_desc"]) : $ttH->func->meta_desc (isset($ttH->post["content"]) ? $ttH->post["content"] : '');
					
					$ttH->db->do_update($this->dbtable, $col_l, " ".$this->dbtable_id."='".$item_id."' and lang='".$ttH->conf["lang_cur"]."'");	
					
					//Update menu link
					$this->func->update_menu_link($this->modules."-group-".$item_id, $col_l);
					//End
					built_group_nav_sub ($item_id, $col["group_nav"]);	
					
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_success"], "success");
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_false"], "error");	
				}
			}
		}
		
		$where = '';
		if(array_key_exists('lang', $this->arr_element)) {
			$where .= " and lang='".$ttH->conf['lang_cur']."' ";
		}
		$sql = "select * from ".$this->dbtable." 
						where ".$this->dbtable_id."='".$item_id."' 
						".$where;
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
		} else {
			$ttH->html->alert ($ttH->lang["global"]["not_found_page"], $ttH->admin->get_link_admin ($this->modules, $this->action));
		}
		
		$data["err"] = $err;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("id"=>$item_id));
		
		return $this->func->_form_input($data);
	}
	
	//-------------- 
  function do_duplicate ($list_duplicate = "")
  {
    global $ttH;
		
		if(empty($list_duplicate)){
			$ttH->html->alert ($ttH->lang["global"]["not_found_page"], $ttH->admin->get_link_admin ($this->modules, $this->action));
		}
		
		$ok = 0;
		
		$query = $ttH->db->query("select * from ".$this->dbtable." where find_in_set(".$this->dbtable_id.",'".$list_duplicate."')>0 and lang='".$ttH->conf['lang_cur']."'");	
		while ($row = $ttH->db->fetch_row($query)){
			$col = $row;
			$col['id'] = '';
			$col[$this->dbtable_id] = '';
			$col["date_create"] = time();
			$col["date_update"] = time();
			$ok = $ttH->db->do_insert($this->dbtable, $col);
			//echo $ttH->db->debug();	
			if($ok){
				$item_id = $ttH->db->insertid();
				$col_up = array();
				$col_up[$this->dbtable_id] = $item_id;			
				$col_up["friendly_link"] = $ttH->func->get_friendly_link_db ($col["friendly_link"], $this->dbtable, $this->dbtable_id, $item_id, $col['lang']);	
				$ttH->db->do_update($this->dbtable, $col_up, " id='".$item_id."' and lang='".$ttH->conf["lang_cur"]."'");	
				
				$query_lang = $ttH->db->query("select * from ".$this->dbtable." where ".$this->dbtable_id."='".$row[$this->dbtable_id]."' and lang!='".$ttH->conf['lang_cur']."'");	
				while ($row_lang = $ttH->db->fetch_row($query_lang)){
					$col_l = $row_lang;
					$col_l["id"] = '';
					$col_l[$this->dbtable_id] = $item_id;
					$col_l["friendly_link"] = $ttH->func->get_friendly_link_db ($col_l["friendly_link"], $this->dbtable, $this->dbtable_id, $item_id, $row_lang['lang']);
					$ttH->db->do_insert($this->dbtable, $col_l);	
					//echo $ttH->db->debug();	
				}			
			}
		}
		
    if ($ok){
      $mess = $ttH->html->html_alert($ttH->lang["global"]["duplicate_success"], "success");
    } else  {
      $mess = $ttH->html->html_alert($ttH->lang["global"]["duplicate_false"], "error");
    }
		
		return $mess;
  }
	
	//-------------- 
  function do_del ($list_del = "")
  {
    global $ttH;
		
		if(empty($list_del)){
			$ttH->html->alert ($ttH->lang["global"]["not_found_page"], $ttH->admin->get_link_admin ($this->modules, $this->action));
		}
		$del_item = "";
		$del_item_lang = "";
		
		$where = "";
		$arr_del = $list_del ? explode(',', $list_del) : array();
		foreach($arr_del as $del_id) {
			$where .= ($where) ? " or " : " where";
			$where .= " find_in_set('".$del_id."', group_nav)";
		}
		
		$query = $ttH->db->query("select ".$this->dbtable_id." from ".$this->dbtable." ".$where);	
		while ($row = $ttH->db->fetch_row($query)){
			$del_item .= ($del_item) ? "," : "";
			$del_item .= $row[$this->dbtable_id];
		}
		
		$ok = $ttH->db->delete ($this->dbtable, "find_in_set(".$this->dbtable_id.",'".$del_item."')");
    if ($ok){
			$ttH->db->delete ("friendly_link", " dbtable='".$this->dbtable."' and find_in_set(dbtable_id,'".$del_item."')");
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
		
		$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "edit", array("id"=>$row['group_id']));
		$row["link_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_trash","id"=>$row['group_id']));
		$row["link_restore"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_restore","id"=>$row['group_id']));
		$row["link_del"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row['group_id']));
		
		$row["link_pic"] = $ttH->admin->get_link_admin ($this->modules, $this->modules.'_pic', 'manage', array("type"=>"group","type_id"=>$row['group_id']));
		
		if(!empty($row["picture"])){
			$row["picture"] = '<a class="fancybox-effects-a" title="'.$row["picture"].'" href="'.DIR_UPLOAD.$row["picture"].'">
				'.$ttH->func->get_pic_mod($row["picture"], 50, 50, '', 1, 0, array('fix_width'=>1)).'
			</a>';
		}
		
		$row['name_action'] = $this->modules.'-group-'.$row["group_id"];
		$row["link_add_menu"] = $ttH->admin->get_link_admin_popup ('layout', 'menu', 'add_menu', array("name_action"=>$row['name_action']));
		
		//$row['link'] = (isset($ttH->data["modules"][$this->modules]["arr_friendly_link"][$ttH->conf['lang_cur']])) ? $ttH->data["modules"][$this->modules]["arr_friendly_link"][$ttH->conf['lang_cur']] : '';
		$row['link'] = $row["friendly_link"];
		
		$row['parent'] = $this->func->get_group_name ($row['parent_id'], 'link');
		$row['date_create'] = date('d/m/Y',$row['date_create']);
		
		$row['html_checkbox'] = '';
		foreach($this->arr_element as $k => $v) {
			$form_type = (isset($v['form_type'])) ? $v['form_type'] : '';
			if($form_type != 'checkbox') {
				continue;
			}
			if(isset($v['muti'])) {
				continue;
			}

			$row[$k.'_checked'] = ($row[$k] == 1) ? ' checked="checked"' : '';
			$row['html_checkbox'] .= '<div><label for="'.$k.'_'.$row[$this->dbtable_id].'"><strong>'.(isset($ttH->lang[$this->modules][$k]) ? $ttH->lang[$this->modules][$k] : (isset($ttH->lang['global'][$k]) ? $ttH->lang['global'][$k] : $k)).':</strong></label> <input type="checkbox" value="1" id="'.$k.'_'.$row[$this->dbtable_id].'" name="'.$k.'['.$row[$this->dbtable_id].']" '.$row[$k.'_checked'].' onchange="do_check(\''.$row[$this->dbtable_id].'\')" /></div>';
		}
		
		$ttH->temp_act->assign('row', $row);
		if($is_show == "trash"){
			$ttH->temp_act->reset("manage.row_item.row_button_manage");
			$ttH->temp_act->parse("manage.row_item.row_button_manage");
			if($row['is_show'] == 0){
				$ttH->temp_act->parse("manage.row_item");
				$output = $ttH->temp_act->text("manage.row_item");
				$ttH->temp_act->reset("manage.row_item");
			}else{
				$row["link_edit"] = 'javascript:void(0);';
				$row["link_trash"] = 'javascript:void(0);';
				$row["link_restore"] = 'javascript:void(0);';
				$row["link_del"] = 'javascript:void(0);';
				
				$ttH->temp_act->parse("manage.row_item_no_control");
				$output = $ttH->temp_act->text("manage.row_item_no_control");
				$ttH->temp_act->reset("manage.row_item_no_control");
			}
		}else{
			$ttH->temp_act->parse("manage.row_item.row_button_trash");
			$ttH->temp_act->parse("manage.row_item");
			$output = $ttH->temp_act->text("manage.row_item");
			$ttH->temp_act->reset("manage.row_item");
		}
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
						//$dup['is_focus'] = (isset($arr_is_focus[$up_id[$i]])) ? $arr_is_focus[$up_id[$i]] : 0;
						foreach($this->arr_element as $k => $v) {
							$form_type = (isset($v['form_type'])) ? $v['form_type'] : '';
							if($form_type != 'checkbox') {
								continue;
							}
							if(isset($v['muti'])) {
								continue;
							}
		
							$dup[$k] = (isset($ttH->post[$k][$up_id[$i]])) ? $ttH->post[$k][$up_id[$i]] : 0;
						}
						
						$ok = $ttH->db->do_update($this->dbtable, $dup, "".$this->dbtable_id."='".$up_id[$i]."'");
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
						$ok = 0;
						$sql = "select group_nav from ".$this->dbtable." where ".$this->dbtable_id."='".$up_id[$i]."' limit 0,1";
						//echo $sql;
						if ($row_group = $ttH->db->fetch_row($ttH->db->query($sql))) {
							$dup = array();
							$dup['is_show'] = 1;
							$ok = $ttH->db->do_update($this->dbtable, $dup, " find_in_set(".$this->dbtable_id.", '".$row_group['group_nav']."')");
						}
						
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
						$ok = $ttH->db->do_update($this->dbtable, $dup, " find_in_set('" . $up_id[$i]."', group_nav)");
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
		$search_title = (isset($ttH->input["search_title"])) ? $ttH->input["search_title"] : "";
		foreach($this->arr_element as $k => $v) {
			$form_type = (isset($v['form_type'])) ? $v['form_type'] : '';
			if($form_type == 'select') {
				eval('$search_'.$k.' = (isset($ttH->input["'.$k.'"])) ? $ttH->input["'.$k.'"] : "";');
			} elseif($form_type == 'checkbox') {
				eval('$search_'.$k.' = (isset($ttH->input["'.$k.'"])) ? $ttH->input["'.$k.'"] : -1;');
			} else {
				continue;
			}
		}
		
		$where = " ";
		$ext = "";
		$is_search = 0;
		
		if(array_key_exists('lang', $this->arr_element)) {
			$where .= " and lang='".$ttH->conf['lang_cur']."' ";
		}
		
		if($is_show == "trash" ){
			//$where .= " AND is_show=0 ";
		}else{
			$where .= " AND is_show=1 ";
		}
		
		if(isset($ttH->input['search'])) {
		
foreach($this->arr_element as $k => $v) {
				$form_type = (isset($v['form_type'])) ? $v['form_type'] : '';
				if($form_type == 'select') {
					eval('if($search_'.$k.'){$where .= " and '.$k.'=\'$search_'.$k.'\' "; $is_search = 1;}');
				} elseif($form_type == 'checkbox') {
					eval('if($search_'.$k.' != -1){$where .= " and '.$k.'=\'$search_'.$k.'\' "; $is_search = 1;}');
				} else {
					continue;
				}
			}
			
			if($search_date_begin || $search_date_end ){
				$tmp1 = @explode("/", $search_date_begin);
				$time_begin = @mktime(0, 0, 0, $tmp1[1], $tmp1[0], $tmp1[2]);
				
				$tmp2 = @explode("/", $search_date_end);
				$time_end = @mktime(23, 59, 59, $tmp2[1], $tmp2[0], $tmp2[2]);
				
				if(array_key_exists('date_create', $this->arr_element)) {
					$where .= " and (date_create BETWEEN {$time_begin} AND {$time_end}) ";
					$ext.="&date_begin=".$search_date_begin."&date_end=".$search_date_end;
					$is_search = 1;
				}			
			}
			
			if(!empty($search_title)){
				if(array_key_exists('title', $this->arr_element)) {
					$where .=" and (".$this->dbtable_id."='$search_title' or title like '%$search_title%') ";		
				} else {
					$where .=" and ".$this->dbtable_id."='$search_title' ";		
				}				
				$ext.="&search_title=".$search_title;
				$is_search = 1;
			}
		}
		
		$where_root = $where;		
		if($is_search == 0) {
			$where_root .= " and parent_id=0  ";
		}
    
		$num_total = 0;
		$res_num = $ttH->db->query("select ".$this->dbtable_id." 
						from ".$this->dbtable." 
						where 1 
						".$where_root." ");
			$num_total = $ttH->db->num_rows($res_num);
		$n = ($ttH->conf["n_list"]) ? $ttH->conf["n_list"] : 30;
		$num_items = ceil($num_total / $n);
		if ($p > $num_items)
		  $p = $num_items;
		if ($p < 1)
		  $p = 1;
		$start = ($p - 1) * $n;
		
		$link_action = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
		
		//Sort
		$arr_title = array(
			$this->dbtable_id => array(
				"title" => $ttH->lang["global"]["id"],
				"link" => $link_action."&p=".$p.$ext."&sort=".$this->dbtable_id."-desc",
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
				"title" => $ttH->lang["global"]["title"],
				"link" => $link_action."&p=".$p.$ext."&sort=title-desc",
				"class" => ""
			),
			"is_focus" => array(
				"title" => $ttH->lang["global"]["focus"],
				"link" => $link_action."&p=".$p.$ext."&sort=is_focus-desc",
				"class" => ""
			),
			"is_show_menu" => array(
				"title" => 'hiện ở menu',
				"link" => $link_action."&p=".$p.$ext."&sort=is_show_menu-desc",
				"class" => ""
			),
			"date_create" => array(
				"title" => $ttH->lang["global"]["date_create"],
				"link" => $link_action."&p=".$p.$ext."&sort=date_create-desc",
				"class" => ""
			)
		);
		
		$sort = (isset($ttH->input["sort"])) ? $ttH->input["sort"] : "";
		$order_by = '';
		if($sort)
		{
			$arr_allow_sort = array(
				1 => "asc",
				2 => "desc"
			);
			$tmp = explode("-",$sort);
			if (array_key_exists($tmp[0],$arr_title) && in_array($tmp[1],$arr_allow_sort)) {
				$order_tmp = ($tmp[0] == $this->dbtable_id) ? $this->dbtable_id : $tmp[0];
				$order_by .= " order by ".$order_tmp." ".$tmp[1];
				
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
			$order_by .= " order by date_create DESC";
		}
		$where .= $order_by;
		//End sort
		
		//Title row
		foreach($arr_title as $k => $v)
		{
			$class = ($v["class"]) ? " class='".$v["class"]."'" : "";
			$data["f_".$k] = '<a href="'.$v["link"].'" '.$class.'>'.$v["title"].'</a>';
			if($k == $this->dbtable_id) {
				$data['f_id'] = $data["f_".$k];
			}
		}
		//End title row
		
    $sql = "select * from ".$this->dbtable." 
						where 1 
						".$where_root.$order_by." 
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
				if($is_search == 0) {
					$data['row_item'] .= $this->manage_sub($row[$this->dbtable_id], $where, $is_show);
				}
			}
		}
		else
		{
			$ttH->temp_act->assign('row', array("mess"=>$ttH->lang["global"]["no_have_data"]));
			$ttH->temp_act->parse("manage.row_empty");
			//$data['row_item'] .= $ttH->temp_act->text("manage.row_empty");
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
		
		foreach($this->arr_element as $k => $v) {
			$form_type = (isset($v['form_type'])) ? $v['form_type'] : '';
			if(!in_array($form_type, array('select', 'checkbox'))) {
				continue;
			}
			$title = (isset($ttH->lang[$this->modules][$k]) ? $ttH->lang[$this->modules][$k] : (isset($ttH->lang['global'][$k]) ? $ttH->lang['global'][$k] : $k));
			if($form_type == 'checkbox') {
				$v['data'] = (isset($v['data']) && is_array($v['data'])) ? $v['data'] : array(-1 => 'Chọn ---', 0 => 'Không', 1 => 'Có');
			}
			
			eval('$data["'.$k.'"] = $search_'.$k.';');
			$ttH->temp_act->assign('row', array(
				'title' => (isset($ttH->lang[$this->modules][$k]) ? $ttH->lang[$this->modules][$k] : (isset($ttH->lang['global'][$k]) ? $ttH->lang['global'][$k] : $k)),
				'content' => $this->func->_select($k, $v, $data)
			));
			$ttH->temp_act->parse("manage.element");
		}
		
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
	function manage_sub($parent_id=0, $where, $is_show='', $lv_text = '')
	{
		global $ttH;
		
		$output = '';
		
		$lv_text .= '|--';
		
		$sql = "select * from ".$this->dbtable." 
						where parent_id>0 
						and parent_id='".$parent_id."' 
						".$where." ";
    //echo $sql;
		$result = $ttH->db->query($sql);
    $i = 0;
		$data['row_item'] = '';
    if ($num = $ttH->db->num_rows($result))
		{
			while ($row = $ttH->db->fetch_row($result)) 
			{
				$i++;
				$row['pre_title'] = $lv_text.' ';
				$output .= $this->manage_row($row, $is_show);
				$output .= $this->manage_sub($row[$this->dbtable_id], $where, $is_show, $lv_text);
			}
		}
		
		return $output;
	}

  // end class
}
?>