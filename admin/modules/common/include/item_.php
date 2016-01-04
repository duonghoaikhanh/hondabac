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
		
		if(!isset($this->arr_action)) {
			$this->arr_action = array();
		}
		if(!isset($this->arr_friendly_link)) {
			$this->arr_friendly_link = array();
		}
		if(!isset($this->arr_picture)) {
			$this->arr_picture = array('picture' => array());
		}
		if(!isset($this->arr_file)) {
			$this->arr_file = array();
		}
		if(!isset($this->arr_editor)) {
			$this->arr_editor = array();
		}
		if(!isset($this->arr_tab_editor)) {
			$this->arr_tab_editor = array();
		}
		if(!isset($this->arr_select)) {
			$this->arr_select = array();
		}
		if(!isset($this->arr_checkbox)) {
			$this->arr_checkbox = array();
		}
		if(!isset($this->arr_link)) {
			$this->arr_link = array();
		}
		if(!isset($this->arr_notuse)) {
			$this->arr_notuse = array();
		}
		if(!isset($this->path_tbl)) {
			$this->path_tbl = $ttH->path_html.$this->modules_include.DS.$this->tbl_name.".tpl";
		}
		
		$this->use_group_related = (isset($this->use_group_related)) ? $this->use_group_related : 0;
		
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
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->modules."_".$this->sub];
				$data["main"] = $this->do_add();
				break;
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
	
	//-----------
	function _form_input($data)
	{
		global $ttH;
		
		$arr_isset = array('group_id','picture','content');
		foreach($arr_isset as $tmp) {
			$data[$tmp] = (isset($data[$tmp])) ? $data[$tmp] : '';
		}
		
		$data["list_group"] = $this->func->list_group ("group_id", $data["group_id"], " class=\"form-control\"", array('title'=>$ttH->lang['global']['select_title']));
		
		foreach($this->arr_picture as $k => $v) {
			$data[$k] = $ttH->admin->get_form_pic ($k, (isset($data[$k]) ? $data[$k] : ''), $this->folder_upload, $this->dir);
			
			$ttH->temp_act->assign('row', array(
				'title' => (isset($ttH->lang[$this->modules][$k]) ? $ttH->lang[$this->modules][$k] : (isset($ttH->lang['global'][$k]) ? $ttH->lang['global'][$k] : $k)),
				'content' => $data[$k]
			));
			$ttH->temp_act->parse("edit.picture");
		}
		foreach($this->arr_file as $k => $v) {
			$data[$k] = $ttH->admin->get_form_file ($k, (isset($data[$k]) ? $data[$k] : ''), $this->folder_upload, $this->dir);
			
			$ttH->temp_act->assign('row', array(
				'title' => (isset($ttH->lang[$this->modules][$k]) ? $ttH->lang[$this->modules][$k] : (isset($ttH->lang['global'][$k]) ? $ttH->lang['global'][$k] : $k)),
				'content' => $data[$k]
			));
			$ttH->temp_act->parse("edit.file");
		}
		foreach($this->arr_editor as $k => $v) {
			$data["html_".$k] = $ttH->editor->load_editor (
				$k, 
				$k, 
				(isset($data[$k]) ? $data[$k] : ''), 
				"", 
				(isset($v['editor']) ? $v['editor'] : "full"), 
				array("folder_up" => $this->folder_upload, "fldr" => $this->dir)
			);
			
			$ttH->temp_act->assign('row', array(
				'title' => (isset($ttH->lang[$this->modules][$k]) ? $ttH->lang[$this->modules][$k] : (isset($ttH->lang['global'][$k]) ? $ttH->lang['global'][$k] : $k)),
				'html_editor' => $data["html_".$k]
			));
			$ttH->temp_act->parse("edit.editor");
		}
		
		foreach($this->arr_tab_editor as $k => $v) {				
			$tab_editor = (isset($data[$k]) && $data[$k]) ? $data[$k] : array();
			if(!is_array($tab_editor)) {
				$tab_editor = unserialize($tab_editor);
			}
			//print_arr($tab_editor); die();
			if(count($tab_editor)) {
				$i = 0;
				foreach($tab_editor as $k1 => $v1) {
					foreach($v1 as $k2 => $v2) {
						if(!$v2) {
							unset($arr_tab_editor[$k][$k1]);
							break;
						} elseif($k2 == 'content') {
							$arr_tab_editor[$k][$k1][$k2] = $ttH->func->input_editor ($v2);
						}
					}
					$i++;
					$ttH->temp_act->assign('row', array(
						'active' => ($i == 1) ? ' active in' : '',
						'key' => $k,
						'i' => $i,
						'title' => (isset($tab_editor[$k1]['title']) ? $tab_editor[$k1]['title'] : 'Tab trống'),
						'content' => (isset($tab_editor[$k1]['content']) ? $tab_editor[$k1]['content'] : '')
					));
					$ttH->temp_act->parse("edit.editor_tab.title");
					$ttH->temp_act->parse("edit.editor_tab.content");
				}
			}
			$ttH->temp_act->assign('row', array(
				'key' => $k
			));
			$ttH->temp_act->parse("edit.editor_tab");
		}
		
		foreach($this->arr_select as $k => $v) {
			$tmp = array();
			if((isset($v['muti'])) && $v['muti'] == true) {
				$tmp["select_muti"] = 1;
			}
			if((isset($v['title']))) {
				$tmp["title"] = (isset($ttH->lang[$this->modules][$v['title']]) ? $ttH->lang[$this->modules][$v['title']] : $ttH->lang['global'][$v['title']]);
			}
			if(isset($v['data']) && is_array($v['data'])) {
				$data["list_".$k] = $ttH->html->select (
					(isset($tmp["select_muti"]) ? $k.'[]' : $k), 
					$v['data'], 
					(isset($data[$k]) ? $data[$k] : ''), 
					" class=\"form-control\"",
					$tmp
				);
			} elseif(isset($v['select_type']) && $v['select_type'] == 'list_num') {
				$data["list_".$k] = $ttH->admin->list_number (
					(isset($tmp["select_muti"]) ? $k.'[]' : $k), 
					(isset($v['min']) ? $v['min'] : 1), 
					(isset($v['max']) ? $v['max'] : 100), 
					(isset($data[$k]) ? $data[$k] : ''), 
					" class=\"form-control\"",
					$tmp
				);
			} else {
				eval('$data["list_'.$k.'"] = $this->func->list_'.$k.' (
				"'.(isset($tmp["select_muti"]) ? $k.'[]' : $k).'", 
				"'.(isset($data[$k]) ? $data[$k] : '').'", 
				" class=\'form-control\'", 
				$tmp);');
			}
			
			
			$ttH->temp_act->assign('row', array(
				'title' => (isset($ttH->lang[$this->modules][$k]) ? $ttH->lang[$this->modules][$k] : (isset($ttH->lang['global'][$k]) ? $ttH->lang['global'][$k] : $k)),
				'content' => $data["list_".$k]
			));
			$ttH->temp_act->parse("edit.select");
		}
		
		foreach($this->arr_checkbox as $k => $v) {
			$use_title = true;
			if(!(isset($v['data']) && is_array($v['data']))){
				$use_title = false;
			}
			
			$tmp = ' class="checkbox"';
			if(isset($v['inline'])) {
				$tmp = ' class="checkbox-inline"';
			}
			$title = (isset($ttH->lang[$this->modules][$k]) ? $ttH->lang[$this->modules][$k] : (isset($ttH->lang['global'][$k]) ? $ttH->lang['global'][$k] : $k));
			$data[$k] = $ttH->html->checkbox (
				(isset($v['muti'])) ? $k.'[]' : $k, 
				((isset($v['data']) && is_array($v['data'])) ? $v['data'] : array(1 => $title)), 
				(isset($data[$k]) ? $data[$k] : ''), 
				$tmp
			);
			
			
			$ttH->temp_act->assign('row', array(
				'title' => (isset($ttH->lang[$this->modules][$k]) ? $ttH->lang[$this->modules][$k] : (isset($ttH->lang['global'][$k]) ? $ttH->lang['global'][$k] : $k)),
				'content' => $data[$k]
			));
			if($use_title == true) {
				$ttH->temp_act->parse("edit.checkbox.title");
			}
			$ttH->temp_act->parse("edit.checkbox");
		}
		
		foreach($this->arr_link as $k => $v) {
			$tmp = array();			
			$ttH->temp_act->assign('row', array(
				'key' => $k,
				'title' => (isset($ttH->lang[$this->modules][$k]) ? $ttH->lang[$this->modules][$k] : (isset($ttH->lang['global'][$k]) ? $ttH->lang['global'][$k] : $k)),
				'content' => (isset($data[$k]) ? $data[$k] : '')
			));
			$ttH->temp_act->parse("edit.link");
		}
		
		$ttH->temp_act->assign('data', $data);
		if(!in_array('group_id', $this->arr_notuse)) {
			$ttH->temp_act->parse("edit.group_id");
		}
		$ttH->temp_act->parse("edit");
		return $ttH->temp_act->text("edit");
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
			$group_id = (isset($ttH->post['group_id'])) ? $ttH->post['group_id'] : 0;
			
			if(empty($ttH->post["title"])) {
				$err = $ttH->html->html_alert ($ttH->lang["global"]["err_invalid_title"], "error");	
			}	
			
			$arr_tab_editor = array();
			foreach($this->arr_tab_editor as $k => $v) {
				$arr_tab_editor[$k] = (isset($ttH->post[$k])) ? $ttH->post[$k] : array();
				foreach($arr_tab_editor[$k] as $k1 => $v1) {
					foreach($v1 as $k2 => $v2) {
						if(!$v2) {
							unset($arr_tab_editor[$k][$k1]);
							break;
						} elseif($k2 == 'content') {
							$arr_tab_editor[$k][$k1][$k2] = $ttH->func->input_editor ($v2);
						}
					}
				}
			}
			
			if(empty($err)){
				$col = array();
				$col["group_nav"] = $this->func->get_group_nav ($group_id,0,'item');
				$col["group_id"] = $group_id;
				
				foreach($this->arr_picture as $k => $v) {
					$col[$k] = (isset($ttH->post[$k])) ? $ttH->func->get_input_pic ($ttH->post[$k]) : '';		
				}
				foreach($this->arr_file as $k => $v) {
					$col[$k] = (isset($ttH->post[$k])) ? $ttH->func->get_input_file ($ttH->post[$k]) : '';		
				}
				
				foreach($this->arr_select as $k => $v) {
					if((isset($v['muti'])) && $v['muti'] == true) {
						$col[$k] = (isset($ttH->post[$k])) ? implode(',',$ttH->post[$k]) : '';
					} else {
						$col[$k] = (isset($ttH->post[$k])) ? $ttH->post[$k] : '';
					}					
				}
				
				foreach($this->arr_checkbox as $k => $v) {
					if((isset($v['muti'])) && $v['muti'] == true) {
						$col[$k] = (isset($ttH->post[$k])) ? implode(',',$ttH->post[$k]) : '';
					} else {
						$col[$k] = (isset($ttH->post[$k])) ? $ttH->post[$k] : '';
					}					
				}
				
				$col["show_order"] = 0;
				$col["is_show"] = 1;
				$col["date_create"] = time();
				$col["date_update"] = time();
				$ok = $ttH->db->do_insert($this->dbtable, $col);	
				if($ok){
					$item_id = $ttH->db->insertid();
					$col_l = array();
					$col_l[$this->dbtable_id] = $item_id;
					$col_l["title"] = $ttH->post["title"];
					
					foreach($this->arr_editor as $k => $v) {
						$col_l[$k] = $ttH->func->input_editor ($ttH->post[$k]);
					}
					foreach($this->arr_tab_editor as $k => $v) {
						$col_l[$k] = (isset($arr_tab_editor[$k]) && $arr_tab_editor[$k]) ? serialize($arr_tab_editor[$k]) : '';
					}
					foreach($this->arr_link as $k => $v) {
						$col_l[$k] = $ttH->post[$k];
					}
					
					$col_l["meta_title"] = ($ttH->post["meta_title"]) ? $ttH->post["meta_title"] : $ttH->func->meta_title ($ttH->post["title"]);
					$col_l["meta_key"] = ($ttH->post["meta_key"]) ? $ttH->post["meta_key"] : $ttH->func->meta_key ($ttH->post["title"]);
					$col_l["meta_desc"] = ($ttH->post["meta_desc"]) ? $ttH->func->meta_desc ($ttH->post["meta_desc"]) : $ttH->func->meta_desc (isset($ttH->post["content"]) ? $ttH->post["content"] : '');
					
					foreach($ttH->data["lang"] as $lang_id => $lang_row){
						$friendly_link = ($ttH->post["friendly_link"]) ? $ttH->post["friendly_link"] : $ttH->post["title"];
						$col_l["friendly_link"] = $ttH->func->get_friendly_link_db ($friendly_link, $this->dbtable.'_lang', $this->dbtable_id, $item_id, $lang_row["name"]);
						
						$col_l["lang"] = $lang_row["name"];
						$ttH->db->do_insert($this->dbtable."_lang", $col_l);	
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
		
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
		
		return $this->_form_input($data);
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
			
			$group_id = (isset($ttH->post['group_id'])) ? $ttH->post['group_id'] : 0;
			
			if(empty($ttH->post["title"])) {
				$err = $ttH->html->html_alert ($ttH->lang["global"]["err_invalid_title"], "error");	
			}				
			
			$arr_tab_editor = array();
			foreach($this->arr_tab_editor as $k => $v) {
				$arr_tab_editor[$k] = (isset($ttH->post[$k])) ? $ttH->post[$k] : array();
				foreach($arr_tab_editor[$k] as $k1 => $v1) {
					foreach($v1 as $k2 => $v2) {
						if(!$v2) {
							unset($arr_tab_editor[$k][$k1]);
							break;
						} elseif($k2 == 'content') {
							$arr_tab_editor[$k][$k1][$k2] = $ttH->func->input_editor ($v2);
						}
					}
				}
			}
			
			/*print_arr($ttH->post);
			print_arr($arr_tab_editor);
			die();*/
			
			if(empty($err)){
				$col = array();
				$col["group_nav"] = $this->func->get_group_nav ($group_id,0,'item');
				$col["group_id"] = $group_id;
				
				foreach($this->arr_picture as $k => $v) {
					$col[$k] = (isset($ttH->post[$k])) ? $ttH->func->get_input_pic ($ttH->post[$k]) : '';		
				}
				foreach($this->arr_file as $k => $v) {
					$col[$k] = (isset($ttH->post[$k])) ? $ttH->func->get_input_file ($ttH->post[$k]) : '';		
				}
				
				foreach($this->arr_select as $k => $v) {
					if((isset($v['muti'])) && $v['muti'] == true) {
						$col[$k] = (isset($ttH->post[$k])) ? implode(',',$ttH->post[$k]) : '';
					} else {
						$col[$k] = (isset($ttH->post[$k])) ? $ttH->post[$k] : '';
					}					
				}
				
				foreach($this->arr_checkbox as $k => $v) {
					if((isset($v['muti'])) && $v['muti'] == true) {
						$col[$k] = (isset($ttH->post[$k])) ? implode(',',$ttH->post[$k]) : '';
					} else {
						$col[$k] = (isset($ttH->post[$k])) ? $ttH->post[$k] : '';
					}					
				}
				
				$col["date_update"] = time();
				$ok = $ttH->db->do_update($this->dbtable, $col, " ".$this->dbtable_id."='".$item_id."'");	
				if($ok){
					$col_l = array();
					$col_l["title"] = $ttH->post["title"];
					
					foreach($this->arr_editor as $k => $v) {
						$col_l[$k] = $ttH->func->input_editor ($ttH->post[$k]);
					}
					foreach($this->arr_tab_editor as $k => $v) {
						$col_l[$k] = (isset($arr_tab_editor[$k]) && $arr_tab_editor[$k]) ? serialize($arr_tab_editor[$k]) : '';
					}
					foreach($this->arr_link as $k => $v) {
						$col_l[$k] = $ttH->post[$k];
					}
					
					$friendly_link = ($ttH->post["friendly_link"]) ? $ttH->post["friendly_link"] : $ttH->post["title"];
					$col_l["friendly_link"] = $ttH->func->get_friendly_link_db ($friendly_link, $this->dbtable.'_lang', $this->dbtable_id, $item_id, $ttH->conf['lang_cur']);
					
					$col_l["meta_title"] = ($ttH->post["meta_title"]) ? $ttH->post["meta_title"] : $ttH->func->meta_title ($ttH->post["title"]);
					$col_l["meta_key"] = ($ttH->post["meta_key"]) ? $ttH->post["meta_key"] : $ttH->func->meta_key ($ttH->post["title"]);
					$col_l["meta_desc"] = ($ttH->post["meta_desc"]) ? $ttH->func->meta_desc ($ttH->post["meta_desc"]) : $ttH->func->meta_desc (isset($ttH->post["content"]) ? $ttH->post["content"] : '');
					
					$ttH->db->do_update($this->dbtable."_lang", $col_l, " ".$this->dbtable_id."='".$item_id."' and lang='".$ttH->conf["lang_cur"]."'");	
					
					//Update menu link
					$this->func->update_menu_link($this->modules."-item-".$item_id, $col_l);
					//End
					
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_success"], "success");
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_false"], "error");	
				}
			}
		}
		
		$sql = "select * from ".$this->dbtable." a, ".$this->dbtable."_lang al 
						where a.".$this->dbtable_id."=al.".$this->dbtable_id." 
						and lang='".$ttH->conf['lang_cur']."' 
						and a.".$this->dbtable_id."='".$item_id."'";
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
		}
		
		$data["err"] = $err;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("id"=>$item_id));
		
		return $this->_form_input($data);
	}
	
	//-------------- 
  function do_duplicate ($list_duplicate = "")
  {
    global $ttH;
		
		if(empty($list_duplicate)){
			$ttH->html->alert ($ttH->lang["global"]["not_found_page"], $ttH->admin->get_link_admin ($this->modules, $this->action));
		}
		
		$ok = 0;
		
		$query = $ttH->db->query("select * from ".$this->dbtable." where find_in_set(".$this->dbtable_id.",'".$list_duplicate."')>0");	
		while ($row = $ttH->db->fetch_row($query)){
			$col = $row;
			$col[$this->dbtable_id] = '';
			$col["date_create"] = time();
			$col["date_update"] = time();
			$ok = $ttH->db->do_insert($this->dbtable, $col);
			$ttH->db->debug();	
			if($ok){
				$item_id = $ttH->db->insertid();
				
				$query_lang = $ttH->db->query("select * from ".$this->dbtable."_lang where ".$this->dbtable_id."='".$row[$this->dbtable_id]."'");	
				while ($row_lang = $ttH->db->fetch_row($query_lang)){
					$col_l = $row_lang;
					$col_l["id"] = '';
					$col_l[$this->dbtable_id] = $item_id;
					$col_l["friendly_link"] = $ttH->func->get_friendly_link_db ($col_l["friendly_link"], $this->dbtable.'_lang', $this->dbtable_id, $item_id, $row_lang['lang']);
					$ttH->db->do_insert($this->dbtable."_lang", $col_l);	
					$ttH->db->debug();	
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
		/*$del_item = "";
		$del_item_lang = "";
		
		$query = $ttH->db->query("select id, ".$this->dbtable_id." from ".$this->dbtable."_lang where find_in_set(".$this->dbtable_id.",'".$list_del."') and lang='".$ttH->conf["lang_cur"]."'");	
		while ($row = $ttH->db->fetch_row($query)){
			$check = $ttH->db->query("select id from ".$this->dbtable."_lang where ".$this->dbtable_id."='".$row[$this->dbtable_id]."' and lang!='".$ttH->conf["lang_cur"]."'");
			if (!$num_check = $ttH->db->num_rows($query)){	
				$del_item .= ($del_item) ? "," : "";
				$del_item .= $row[$this->dbtable_id];
			}
			$del_item_lang .= ($del_item_lang) ? "," : "";
			$del_item_lang .= $row["id"];
		}
		
		$ok = $ttH->db->delete ($this->dbtable."_lang", "find_in_set(id,'".$del_item_lang."')");
    if ($ok){
			$ttH->db->delete ($this->dbtable, "find_in_set(".$this->dbtable_id.",'".$del_item."')");
      $mess = $ttH->html->html_alert($ttH->lang["global"]["del_success"], "success");
    } else  {
      $mess = $ttH->html->html_alert($ttH->lang["global"]["del_false"], "error");
    }*/
		
		$ok = $ttH->db->delete ($this->dbtable."_lang", "find_in_set(".$this->dbtable_id.",'".$list_del."')");
	if ($ok){
		$ttH->db->delete ($this->dbtable, "find_in_set(".$this->dbtable_id.",'".$del_item."')");
		$ttH->db->delete ("friendly_link", " dbtable='".$this->dbtable."' and find_in_set(dbtable_id,'".$del_item."')");
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
					//$arr_is_focus = (isset($ttH->post["is_focus"])) ? $ttH->post["is_focus"] : array();
							
					$mess = $ttH->lang['global']['edit_success'] . " ID: <strong>";
					$str_mess = "";
					for ($i = 0; $i < count($up_id); $i ++){
						$dup = array();
						$dup['show_order'] = $arr_show_order[$up_id[$i]];
						//$dup['is_focus'] = (isset($arr_is_focus[$up_id[$i]])) ? $arr_is_focus[$up_id[$i]] : 0;
						
						foreach($this->arr_checkbox as $k => $v) {
							$form_type = (isset($v['form_type'])) ? $v['form_type'] : '';
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
						$dup = array();
						$dup['is_show'] = 1;
						$ok = $ttH->db->do_update($this->dbtable, $dup, "".$this->dbtable_id."='".$up_id[$i]."'");
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
						$ok = $ttH->db->do_update($this->dbtable, $dup, "".$this->dbtable_id."='".$up_id[$i]."'");
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
		$search_title = (isset($ttH->input["search_title"])) ? $ttH->input["search_title"] : "";
		foreach($this->arr_checkbox as $k => $v) {
			eval('$search_'.$k.' = (isset($ttH->input["'.$k.'"])) ? $ttH->input["'.$k.'"] : -1;');
		}
		
		$where = " ";
		$ext = "";
		$is_search = 0;
		
		if($is_show == "trash" ){
			$where .= " AND is_show=0 ";
		}else{
			$where .= " AND is_show=1 ";
		}
		
		foreach($this->arr_checkbox as $k => $v) {
			eval('if($search_'.$k.' != -1){$where .= " and '.$k.'=\'$search_'.$k.'\' "; $is_search = 1;}');
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
			$where .=" and group_id='".$search_group_id."' ";			
			$ext.="&search_group_id=".$search_group_id;
			$is_search = 1;
		}
		
		if(!empty($search_title)){
			$where .=" and (a.".$this->dbtable_id."='$search_title' or title like '%$search_title%') ";			
			$ext.="&search_title=".$search_title;
			$is_search = 1;
		}
    
		$num_total = 0;
		$res_num = $ttH->db->query("select a.".$this->dbtable_id." 
						from ".$this->dbtable." a, ".$this->dbtable."_lang al 
						where a.".$this->dbtable_id."=al.".$this->dbtable_id." 
						and lang='".$ttH->conf["lang_cur"]."' 
						".$where." ");
			$num_total = $ttH->db->num_rows($res_num);
		$n = ($ttH->conf["n_list"]) ? $ttH->conf["n_list"] : 30;
		$num_pages = ceil($num_total / $n);
		if ($p > $num_pages)
		  $p = $num_pages;
		if ($p < 1)
		  $p = 1;
		$start = ($p - 1) * $n;
		
		$link_action = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
		
		//Sort
		$arr_title = array(
			"".$this->dbtable_id."" => array(
				"title" => $ttH->lang["global"]["id"],
				"link" => $link_action."&p=".$p.$ext."&sort=".$this->dbtable_id."-desc",
				"class" => ""
			),
			"show_order" => array(
				"title" => $ttH->lang["global"]["show_order"],
				"link" => $link_action."&p=".$p.$ext."&sort=show_order-desc",
				"class" => ""
			),
			"title" => array(
				"title" => $ttH->lang["global"]["title"],
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
				$order_tmp = ($tmp[0] == $this->dbtable_id) ? "a.".$this->dbtable_id : $tmp[0];
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
		
    $sql = "select * from ".$this->dbtable." a, ".$this->dbtable."_lang al 
						where a.".$this->dbtable_id."=al.".$this->dbtable_id." 
						and lang='".$ttH->conf["lang_cur"]."' 
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
				
				$row["link_duplicate"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_duplicate","id"=>$row['item_id']));
				$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "edit", array("id"=>$row[$this->dbtable_id]));
				$row["link_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_trash","id"=>$row[$this->dbtable_id]));
				$row["link_restore"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_restore","id"=>$row[$this->dbtable_id]));
				$row["link_del"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row[$this->dbtable_id]));
				
				if(!empty($row["picture"])){
					$row["picture"] = '<a class="fancybox-effects-a" title="'.$row["picture"].'" href="'.DIR_UPLOAD.$row["picture"].'">
						'.$ttH->func->get_pic_mod($row["picture"], 50, 50, '', 1, 0, array('fix_width'=>1)).'
					</a>';
				}
				
				/*$row['link'] = (isset($ttH->data["modules"][$this->modules]["arr_friendly_link"][$ttH->conf['lang_cur']])) ? $ttH->data["modules"][$this->modules]["arr_friendly_link"][$ttH->conf['lang_cur']] : '';
				$row['link'] .= '/'.$row["friendly_link"].'.html';*/
				
				$row['name_action'] = $this->modules.'-item-'.$row[$this->dbtable_id];
				$row["link_add_menu"] = $ttH->admin->get_link_admin_popup ('layout', 'menu', 'add_menu', array("name_action"=>$row['name_action']));
				
				$row['link'] = $row["friendly_link"].'.html';
				
				$row['group_name'] = $this->func->get_group_name ($row['group_id']);
				//$row['is_focus_checked'] = ($row['is_focus'] == 1) ? ' checked="checked"' : '';
				$row['html_checkbox'] = '';
				foreach($this->arr_checkbox as $k => $v) {
					if(isset($v['muti'])) {
						continue;
					}

					$row[$k.'_checked'] = ($row[$k] == 1) ? ' checked="checked"' : '';
					$row['html_checkbox'] .= '<div><label for="'.$k.'_'.$row[$this->dbtable_id].'"><strong>'.(isset($ttH->lang[$this->modules][$k]) ? $ttH->lang[$this->modules][$k] : (isset($ttH->lang['global'][$k]) ? $ttH->lang['global'][$k] : $k)).':</strong></label> <input type="checkbox" value="1" id="'.$k.'_'.$row[$this->dbtable_id].'" name="'.$k.'['.$row[$this->dbtable_id].']" '.$row[$k.'_checked'].' onchange="do_check(\''.$row[$this->dbtable_id].'\')" /></div>';
				}
				
				$row['date_create'] = date('d/m/Y',$row['date_create']);
				
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
		$data["list_group_search"] = $this->func->list_group ("search_group_id", $search_group_id, " class=\"form-control\"", array("title" => $ttH->lang['global']['select_title']));
		$data['form_search_class'] = ($is_search == 1) ? ' expand' : '';
		
		foreach($this->arr_checkbox as $k => $v) {
			$title = (isset($ttH->lang[$this->modules][$k]) ? $ttH->lang[$this->modules][$k] : (isset($ttH->lang['global'][$k]) ? $ttH->lang['global'][$k] : $k));
			$v['data'] = (isset($v['data']) && is_array($v['data'])) ? $v['data'] : array(-1 => 'Chọn ---', 0 => 'Không', 1 => 'Có');
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

  // end class
}
?>