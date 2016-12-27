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
	var $action = "popup";
	
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
		
		include ($this->modules."_func.php");
		load_setting ();
		
		$fun = (isset($ttH->get['f'])) ? $ttH->get['f'] : '';

		switch ($fun) {
			case "add_menu":
				$ttH->output = $this->do_add_menu ();
				break;
			default:
				die('Access denied');
				break;
		}
	}
	
	//-----------
	function do_add_menu()
	{
		global $ttH;
		
		$include_js = $ttH->func->include_js ($ttH->dir_temp.'js/'.$this->modules.'/'.$this->modules.'.js');
		
		$cur_group = (isset($ttH->input['group_id'])) ? $ttH->input['group_id'] : 'menu_header';
		$temp = 'menu_add';
		$name_action = (isset($ttH->get['name_action'])) ? $ttH->get['name_action'] : '';
		$link_action = $ttH->admin->get_link_admin_popup ('layout', 'menu', 'add_menu', array("name_action"=>$name_action));
		
		$arr_name_action = explode(',',$name_action);
		
		$data = array();
		
		$arr_isset = array('group_id','parent_id','link_type','target');
		foreach($arr_isset as $tmp) {
			$data[$tmp] = (isset($data[$tmp])) ? $data[$tmp] : '';
		}
		$data['include_js'] = $include_js;
		$data["name_action"] = $name_action;
		$data["link_action"] = $link_action;
		//$data["list_group"] = list_group ("group_id", $cur_group, " class=\"form-control\" onchange=\"window.location.href='".$data["link_action"]."&group_id='+this.value;\"");
		$data["list_group"] = list_group ("group_id", $cur_group, " class=\"form-control\" id=\"menu_group_id\" data-menu_list=\"menu_parent_id\"");
		//$data['group_name'] = $ttH->data["menu_group"][$cur_group];
		$data["list_menu"] = list_menu ($cur_group, "parent_id", $data['parent_id'], " class=\"form-control\" id=\"menu_parent_id\"", array("title" => $ttH->lang['global']['select_title']));
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse($temp);
		return $ttH->temp_act->text($temp);
	}
	
  // end class
}
?>