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
		
		$cur_group = (isset($ttH->input['group_id'])) ? $ttH->input['group_id'] : 'menu_header';
		$temp = 'menu_add';
		$name_action = (isset($ttH->get['name_action'])) ? $ttH->get['name_action'] : '';
		$link_action = $ttH->admin->get_link_admin_popup ('layout', 'menu', 'add_menu', array("name_action"=>$name_action));
		
		$tmp = explode('-',$name_action);
		$table = ($tmp[1] != 'item') ? $tmp[0].'_'.$tmp[1] : $tmp[0];
		$table_key = $tmp[1].'_id';
		$table_id = $tmp[2];
		$sql = "select * from ".$table." a, ".$table."_lang al 
						where a.".$table_key."=al.".$table_key." 
						and lang='".$ttH->conf['lang_cur']."' 
						and a.".$table_key."='".$table_id."'";
    $result = $ttH->db->query($sql);
    if ($table_info = $ttH->db->fetch_row($result)){
		}
		$data = array();
		$err = "";
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			$name_action = $ttH->func->get_friendly_link ($ttH->post["name_action"]);
			
			if(empty($ttH->post["title"]))
				$err = $ttH->html->html_alert ($ttH->lang["global"]["err_invalid_title"], "error");	
			
			if(empty($err)){
				$col = array();
				$col["group_id"] = $cur_group;
				$col["parent_id"] = $ttH->post["parent_id"];
				$col["name_action"] = $name_action;
				$col["target"] = $ttH->post["target"];
				$col["show_mod"] = (isset($ttH->post["show_mod"])) ? get_input_show ($ttH->post["show_mod"]) : "";
				$col["show_act"] = (isset($ttH->post["show_act"])) ? get_input_show ($ttH->post["show_act"]) : "";
				$col["show_order"] = 0;
				$col["is_show"] = 1;
				$col["date_create"] = time();
				$col["date_update"] = time();
				$ok = $ttH->db->do_insert("menu", $col);	
				if($ok){
					$menu_id = $ttH->db->insertid();
					$col_l = array();
					$col_l["menu_id"] = $menu_id;
					$col_l["title"] = $ttH->post["title"];
					$col_l["link_type"] = $ttH->post["link_type"];
					$col_l["link"] = $ttH->post["link"];
					
					foreach($ttH->data["lang"] as $lang_id => $lang_row){
						$col_l["lang"] = $lang_row["name"];
						$ttH->db->do_insert("menu_lang", $col_l);	
					}
					
					//update group_nav
					$col = array();
					$col["menu_nav"] = get_menu_nav ($ttH->post["parent_id"], $menu_id);
					$col["menu_level"] = substr_count($col['menu_nav'],',') + 1;
					$ok = $ttH->db->do_update("menu", $col, " menu_id='".$menu_id."'");	
					if($ok) {
						built_menu_nav_sub ($menu_id, $col["menu_nav"]);
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
		
		$arr_isset = array('group_id','parent_id','link_type','target');
		foreach($arr_isset as $tmp) {
			$data[$tmp] = (isset($data[$tmp])) ? $data[$tmp] : '';
		}
		$data['show_mod'] = (isset($data['show_mod'])) ? @implode(',',$data['show_mod']) : '';
		$data['name_action'] = $name_action;
		$data['title'] = (isset($data['title'])) ? $data['title'] : $table_info['title'];
		$data['link'] = (isset($data['link'])) ? $data['link'] : $table_info['friendly_link'];
		$data["link_action"] = $link_action;
		$data["list_group"] = list_group ("group_id", $cur_group, " class=\"form-control\" onchange=\"window.location.href='".$data["link_action"]."&group_id='+this.value;\"");
		//$data['group_name'] = $ttH->data["menu_group"][$cur_group];
		$data["list_menu"] = list_menu ($cur_group, "parent_id", $data['parent_id'], " class=\"form-control\"", array("title" => $ttH->lang['global']['select_title']));
		$data["list_link_type"] = $ttH->admin->list_link_type ("link_type", $data['link_type'], " class=\"form-control\"");
		$data["list_target"] = $ttH->admin->list_target ("target", $data['target'], " class=\"form-control\"");
		$data["list_module"] = list_module ("show_mod[]", $data['show_mod'], " class=\"form-control\"", array('title' => $ttH->lang["global"]["select_all"]));
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse($temp);
		return $ttH->temp_act->text($temp);
	}
	
  // end class
}
?>