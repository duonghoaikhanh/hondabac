<?php

/*================================================================================*\
Name code : function.php
Copyright © 2013 by Phan Van Lien
@version : 1.0
@date upgrade : 03/02/2013 by Phan Van Lien
\*================================================================================*/

if (! defined('IN_ttH')) {
  die('Hacking attempt!');
}

//=================list_skin===============
function load_setting (){
	global $ttH;
	$ttH->setting = array();
	
	$ttH->data["menu_group"] = array(
		//'menu_top' => $ttH->lang["layout"]["menu_top"],
		'menu_header' => $ttH->lang["layout"]["menu_header"]
		//'weblink' => $ttH->lang["layout"]["weblink"],
		//'menu_footer' => $ttH->lang["layout"]["menu_footer"]
	);
	
	return true;
}

function create_folder($dir="", $mode = 0755) {
	global $ttH;
	
	if($ttH->func->rmkdir("layout/".$dir, $mode)){
		return $dir;
	}else{
		return "";
	}
}

function list_group ($select_name="group_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	return $ttH->html->select ($select_name, $ttH->data["menu_group"], $cur, $ext,$arr_more);
}

function get_input_show ($arr_show) {
	global $ttH;
	
	$output = '';
	
	if(!in_array("",$arr_show)){
		$output = implode(",",$arr_show);
	}
	
	return $output;
}

function list_module ($select_name="show_mod", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	if(!isset($ttH->data["modules_select"])){
		$result = $ttH->db->query("select name_action, arr_title from modules order by mod_id asc");
		$ttH->data["modules_select"] = array();
		while ($row = $ttH->db->fetch_row($result))
		{
			$arr_title = unserialize($row['arr_title']);
			$ttH->data["modules_select"][$row['name_action']] = $arr_title[$ttH->conf['lang_cur']];
		}
	}
	
	return $ttH->html->select_muti ($select_name, $ttH->data["modules_select"], $cur, $ext,$arr_more);
}

function built_menu_nav_sub ($menu_id, $menu_nav = '') {
	global $ttH;
	
	$query = "select menu_id 
						from menu  
						where parent_id='".$menu_id."' ";
	//echo $query;
	$result = $ttH->db->query($query);
	while($row = $ttH->db->fetch_row($result)){
		$col = array();
		$col["menu_nav"] = $menu_nav;
		$col["menu_nav"] .= (!empty($col["menu_nav"])) ? ',' : '';
		$col["menu_nav"] .= $row['menu_id'];
		$col["menu_level"] = substr_count($col['menu_nav'],',') + 1;
		$ok = $ttH->db->do_update("menu", $col, " menu_id='".$row['menu_id']."'");	
		if($ok) {
			built_menu_nav_sub ($row['menu_id'], $col["menu_nav"]);
		}		
	}
	
	return '';
}

function get_menu_nav ($parent_id, $group_id=0) {
	global $ttH;
	
	$output = '';
	if($group_id <= 0){
		return '';
	}
	
	$query = "select menu_id, menu_nav 
						from menu  
						where menu_id='".$parent_id."' 
						limit 0,1";
	//echo $query;
	$result = $ttH->db->query($query);
	if($row = $ttH->db->fetch_row($result)){
		$output = $row['menu_nav'];
		$output .= ','.$group_id;
	}else{
		$output = $group_id;
	}
	
	return $output;
}

function list_menu ($group_id, $select_name="menu_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	if(!isset($ttH->data["menu_tree"])){
		$query = "select m.menu_id, menu_nav, parent_id, title 
							from menu m, menu_lang ml  
							where m.menu_id=ml.menu_id 
							and is_show=1 
							and group_id='".$group_id."' 
							and lang='".$ttH->conf["lang_cur"]."' 
							order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["menu_tree"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){				
				$arr_group_nav = explode(',',$row['menu_nav']);
				$str_code = '';
				$f = 0;
				foreach($arr_group_nav as $tmp){
					$f++;
					$str_code .= ($f == 1) ? '['.$tmp.']' : '["arr_sub"]['.$tmp.']';
				}
				eval('$ttH->data["menu_tree"]'.$str_code.'["menu_id"] = $row["menu_id"];
				$ttH->data["menu_tree"]'.$str_code.'["title"] = $row["title"];');
			}
		}
	}
	
	return $ttH->html->select ($select_name, $ttH->data["menu_tree"], $cur, $ext,$arr_more);
}

?>