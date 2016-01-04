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
			case "load_menu_parent_op":
				echo $this->do_load_menu_parent_op ();
				exit;
				break;
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
	
	function do_load_menu_parent_op ()
	{
		global $ttH;
		
		$output = array(
			'ok' => 1,
			'html' => ''
		);
		
		$menu_group = (isset($ttH->post['menu_group'])) ? $ttH->post['menu_group'] : '';
		if(empty($menu_group)) {
			$output['html'] = '<option value="">'.$ttH->lang['global']['select_title'].'</option>';
			return json_encode($output);
		}
		
		$ttH->load_data->data_menu ();
		$data = (isset($ttH->data["menu_tree_".$menu_group])) ? $ttH->data["menu_tree_".$menu_group] : array();
		
		$output['html'] = '<option value="">'.$ttH->lang['global']['select_title'].'</option>';
		$output['html'] .= $ttH->html->select_op ($data, "", 'root');
		if(empty($output['html'])) {
			$output['html'] = '<option value="">'.$ttH->lang['global']['select_title'].'</option>';
		}
		
		return json_encode($output);
	}
	
	//-----------
	function _add_menu($name_action)	{
		global $ttH;
		
		$name_action = $ttH->func->get_friendly_link ($name_action);
		
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
		
		$cur_group = (isset($input['group_id'])) ? $input['group_id'] : 'menu_header';
		
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
			$col["menu_id"] = 0;
			$col["group_id"] = $cur_group;
			$col["parent_id"] = $input["parent_id"];
			$col["name_action"] = $name_action;
			$col["show_order"] = 0;
			$col["is_show"] = 1;
			$col["date_create"] = time();
			$col["date_update"] = time();
			$i = 0;
			$sql = "select * from ".$table." a, ".$table."_lang al 
							where a.".$table_key."=al.".$table_key." 
							and a.".$table_key."='".$table_id."'";
			$result = $ttH->db->query($sql);
			while ($table_row = $ttH->db->fetch_row($result)){
				$i++;
				$col["title"] = $table_row["title"];
				$col["link"] = ($add_act == 'item') ? $table_row["friendly_link"].'.html' : $table_row["friendly_link"];
				$col["lang"] = $table_row["lang"];
				$ok = $ttH->db->do_insert("menu", $col);	
				if($ok && $col["menu_id"] == 0){
					$menu_id = $ttH->db->insertid();
					$col["menu_id"] = $menu_id;
					
					$col_l = array();
					$col_l["menu_id"] = $menu_id;
					
					$ttH->db->do_update("menu", $col_l, " id='".$menu_id."'");	// update current
				}
			}				
			
			if($ok){
				
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