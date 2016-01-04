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
			$this->arr_picture = array();
		}
		if(!isset($this->arr_editor)) {
			$this->arr_editor = array();
		}
		if(!isset($this->arr_list_num)) {
			$this->arr_list_num = array();
		}
		
		$sql_struc = "show fields from ".$this->modules."_setting";
    $result_struc = $ttH->db->query($sql_struc);
    if ($arr_struc_tmp = $ttH->db->get_array($result_struc)){
			$arr_struc = array();
			foreach($arr_struc_tmp as $v) {
				$arr_struc[] = $v['Field'];
			}
			foreach($this->arr_friendly_link as $k => $v) {
				if(!in_array($k, $arr_struc)) {
					$ttH->db->query("alter table ".$this->modules."_setting add ".$k." varchar(250) not null ;");
				}
			}
			foreach($this->arr_picture as $k => $v) {
				if(!in_array($k, $arr_struc)) {
					$ttH->db->query("alter table ".$this->modules."_setting add ".$k." varchar(250) not null ;");
				}
			}
			foreach($this->arr_editor as $k => $v) {
				if(!in_array($k, $arr_struc)) {
					$ttH->db->query("alter table ".$this->modules."_setting add ".$k." text not null ;");
				}
			}
			foreach($this->arr_list_num as $k => $v) {
				if(!in_array($k, $arr_struc)) {
					$ttH->db->query("alter table ".$this->modules."_setting add ".$k." int not null ;");
				}
			}
		}		
		
		$ttH->func->load_language_admin($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS.$this->action.".tpl");
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		$data["link_manage"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "manage");
		$data["link_seo"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "seo");
		$data["link_add"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "add");
		
		$this->sub = (isset($ttH->input["sub"])) ? $ttH->input["sub"] : "manage";
		switch ($this->sub) {
			case "seo":
				$ttH->conf["page_title"] = $ttH->lang['global']['orientation_search_engine'];
				$data["main"] = $this->do_seo();
				break;
			default:
				$this->sub = "manage";
				$ttH->conf["page_title"] = $ttH->lang[$this->modules]["setting"];
				$data["main"] = $this->do_setting();
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
	function _update()
	{
		global $ttH;
		
		$arr_action = $this->arr_action;
		$arr_friendly_link = $this->arr_friendly_link;
		$arr_editor = $this->arr_editor;
		
		$result = $ttH->db->query("select * from ".$this->modules."_setting where lang='".$ttH->conf['lang_cur']."' limit 0,1");
		$data = $ttH->db->fetch_row($result) ;
		if (isset($ttH->post['do_submit'])) {
      $dup = array();
			foreach ($data as $key => $value) {
				if ($key != 'id' && isset($ttH->post[$key])) {
					if(in_array($key,$arr_friendly_link)){
						//$dup[$key] = $ttH->func->get_friendly_link ($ttH->post[$key]);
						
						$arr_more = array();
						if(array_key_exists($key,$arr_action)) {
							$arr_more['action'] = $arr_action[$key];
						} else {
							$tmp = $key.'))';
							$arr_more['action'] = str_replace('_link))','',$tmp);
						}
						
						$dup[$key] = $ttH->func->get_friendly_link_db (
							$ttH->post[$key], 
							$this->modules.'_setting', 
							'setting_id', 
							$key, 
							$ttH->conf['lang_cur'], 
							$arr_more
						);
					} elseif(array_key_exists($key,$this->arr_picture)) {
						$dup[$key] = (isset($ttH->post[$key])) ? $ttH->func->get_input_pic ($ttH->post[$key]) : '';		
					} elseif(in_array($key,$arr_editor)) {
						$dup[$key] = $ttH->func->input_editor ($ttH->post[$key]);
					} else {
						$dup[$key] = $ttH->post[$key];
					}				
				}
			}
			
			$ok = $ttH->db->do_update($this->modules."_setting", $dup, "id='".$data['id']."'");	
			if($ok){
				$data = $dup;
				$data['err'] = $ttH->html->html_alert($ttH->lang["global"]["edit_success"], "success");
			} else {
				$data['err'] = $ttH->html->html_alert ($ttH->lang["global"]["edit_false"], "error");	
			}
		}

    return $data;
	}
	
	//-----------
	function do_setting()
	{
		global $ttH;
		
		//update
		$data = $this->_update();
		
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action);
		foreach($this->arr_list_num as $k => $v) {
			$data["list_".$k] = $ttH->admin->list_number (
				$k, 
				(isset($v['min']) ? $v['min'] : 1), 
				(isset($v['max']) ? $v['max'] : 100), 
				(isset($data[$k]) ? $data[$k] : ''), 
				" class=\"form-control\""
			);
		}
		
		foreach($this->arr_picture as $k => $v) {
			$data[$k] = $ttH->admin->get_form_pic ($k, (isset($data[$k]) ? $data[$k] : ''), $this->folder_upload, $this->dir);
		}
		
		foreach($this->arr_editor as $k) {
			$data["html_".$k] = $ttH->editor->load_editor ($k, $k, $data[$k], "", "full", array("folder_up" => $this->folder_upload, "fldr" => $this->dir));
		}
		
		$ttH->temp_act->assign('data', $data);
    $ttH->temp_act->parse("setting");
    return $ttH->temp_act->text("setting");
	}
	
	//-----------
	function do_seo()
	{
		global $ttH;
		
		//update
		$data = $this->_update();
		
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, 'seo');
		
		$ttH->temp_act->assign('data', $data);
    $ttH->temp_act->parse("seo");
    return $ttH->temp_act->text("seo");
	}

  // end class
}
?>