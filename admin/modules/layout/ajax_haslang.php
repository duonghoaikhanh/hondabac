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
	var $modules = "layout";
	var $action = "ajax";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		
		$ttH->func->load_language_admin($this->modules);
		
		include ($this->modules."_func.php");
		load_setting ();
		
		$fun = (isset($ttH->post['f'])) ? $ttH->post['f'] : '';

		flush();
		switch ($fun) {
			case "add_to_menu":
				echo $this->do_add_to_menu ();
				exit;
				break;
			default:
				echo '';
				exit;
				break;
		}
		
		exit;
	}
	
	//-----------
	function _add_menu($name_action)	{
		global $ttH;
		
		$name_action = $ttH->func->get_friendly_link ($name_action);
		$cur_group = (isset($ttH->input['group_id'])) ? $ttH->input['group_id'] : 'menu_header';
		$tmp = explode('-',$name_action);
		$add_act = $tmp[1];
		$table = ($add_act != 'item') ? $tmp[0].'_'.$add_act : $tmp[0];
		$table_key = $add_act.'_id';
		$table_id = $tmp[2];
		
		
		$input_tmp = $ttH->post['data'];
		foreach($input_tmp as $key) {
			$input[$key['name']] = $key['value'];
		}
		/*print_arr($input);
		die('adasd');*/
		
		$err = '';
		
		$arr_check = array('group_id');
		foreach($arr_check as $key) {
			if(empty($err) && (!isset($input[$key]) || empty($input[$key]))) {
				$tmp = (isset($ttH->lang[$this->modules][$key])) ? $ttH->lang[$this->modules][$key] : $ttH->lang['global'][$key];
				$err = $ttH->html->html_alert (str_replace('[name]',$tmp,$ttH->lang['global']['err_invalid']), "error");
				break;
			}
		}
		
		if(empty($err)){
			
			$col = array();
			$col["group_id"] = $cur_group;
			$col["parent_id"] = $input["parent_id"];
			$col["name_action"] = $name_action;
			$col["show_order"] = 0;
			$col["is_show"] = 1;
			$col["date_create"] = time();
			$col["date_update"] = time();
			$ok = $ttH->db->do_insert("menu", $col);	
			if($ok){
				$menu_id = $ttH->db->insertid();
				$col_l = array();
				$col_l["menu_id"] = $menu_id;
				
				$sql = "select * from ".$table." a, ".$table."_lang al 
								where a.".$table_key."=al.".$table_key." 
								and lang='".$ttH->conf['lang_cur']."' 
								and a.".$table_key."='".$table_id."'";
				$result = $ttH->db->query($sql);
				while ($table_row = $ttH->db->fetch_row($result)){
					$col_l["title"] = $table_row["title"];
					$col_l["link"] = ($add_act == 'item') ? $table_row["friendly_link"].'.html' : $table_row["friendly_link"];
					$col_l["lang"] = $table_row["lang"];
					$ttH->db->do_insert("menu_lang", $col_l);	
				}
				
				//update group_nav
				$col = array();
				$col["menu_nav"] = get_menu_nav ($input["parent_id"], $menu_id);
				$col["menu_level"] = substr_count($col['menu_nav'],',') + 1;
				$ok = $ttH->db->do_update("menu", $col, " menu_id='".$menu_id."'");	
				if($ok) {
					built_menu_nav_sub ($menu_id, $col["menu_nav"]);
				}
				
			}else{
				$err = $ttH->html->html_alert ($ttH->lang["global"]["add_false"], "error");	
			}
		}
		
		return $err;
	}
	
	function do_add_to_menu ()
	{
		global $ttH;
		
		$output = array(
			'ok' => 1,
			'mess' => ''
		);
		
		$input_tmp = $ttH->post['data'];
		foreach($input_tmp as $key) {
			$input[$key['name']] = $key['value'];
		}
		
		$arr_name_action = explode(',',$input['name_action']);
		$err = '';
		foreach($arr_name_action as $name_action) {
			$err .= $this->_add_menu($name_action);
		}
		if($err) {
			$output['ok'] = 0;
		} else {
			$err = $ttH->html->html_alert ($ttH->lang["global"]["add_success"], "success");
		}
		
		$output["mess"] = $err;
		
		return json_encode($output);
	}
	
  // end class
}
?>