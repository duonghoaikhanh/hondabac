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

function create_folder($dir="", $mode = 0755) {
	global $ttH;
	
	if($ttH->func->rmkdir("config/".$dir, $mode)){
		return $dir;
	}else{
		return "";
	}
}

//=================list_skin===============
function list_skin ($select_name="skin", $cur = "", $ext="")
{
	global $ttH;
	$text = "";
	$path = $ttH->conf['rootpath_web'] . "temp";
	if ($dir = opendir($path)) {
		$text .= "<select size=1 name=\"".$select_name."\" id=\"".$select_name."\" ".$ext.">";
		while (false !== ($file = readdir($dir))) {
		 if ( $file != "index.html" && $file != "." && $file != "..") {
				$selected = ($file == $cur) ? " selected='selected'" : "";
				$text .= "<option value=\"".$file ."\" ".$selected."> " . $file . " </option>";
			}
		}
		$text .= "</select>";
	}
	return $text;
}

function list_menu_parent ($select_name="group_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	if(!isset($ttH->data["admin_menu_root"])){
		$query = "select menu_id, arr_title  
							from admin_menu 
							where parent_id=0 
							and is_show=1 
							order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["admin_menu_root"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$row['arr_title'] = unserialize($row['arr_title']);
				$ttH->data["admin_menu_root"][$row["menu_id"]] = $row['arr_title'][$ttH->conf['lang_cur']];
			}
		}
	}
	
	return $ttH->html->select ($select_name, $ttH->data["admin_menu_root"], $cur, $ext,$arr_more);
}

function list_sub_menu ($select_name="sub_menu", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	$arr_data = array(
		'add' => $ttH->lang['global']['add'],
		'edit' => $ttH->lang['global']['edit'],
		'duplicate' => $ttH->lang['global']['duplicate'],
		'manage' => $ttH->lang['global']['manage'],
		'trash' => $ttH->lang['global']['trash'],
		'restore' => $ttH->lang['global']['restore'],
		'del' => $ttH->lang['global']['del'],
		'upload' => isset($ttH->lang['global']['upload']) ? $ttH->lang['global']['upload'] : '',
		'uploader' => isset($ttH->lang['global']['uploader']) ? $ttH->lang['global']['uploader'] : '',
		'ajax_calls' => isset($ttH->lang['global']['ajax_calls']) ? isset($ttH->lang['global']['ajax_calls']) : '',
		'execute' => isset($ttH->lang['global']['execute']) ? $ttH->lang['global']['execute'] : '',
		'force_download' => isset($ttH->lang['global']['force_download']) ? $ttH->lang['global']['force_download'] : '',
		'popup_library' => isset($ttH->lang['global']['popup_library']) ? $ttH->lang['global']['popup_library'] : '',
		'manage_library' => isset($ttH->lang['global']['manage_library']) ? $ttH->lang['global']['manage_library'] : ''
	);
	
	return $ttH->html->select_muti ($select_name, $arr_data, $cur, $ext,$arr_more);
}

function list_file_lang ($select_name="show_mod", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	$arr_file = array(
		'global' => 'Dùng toàn trang'
	);
	
	if(isset($ttH->data["modules"])){
		foreach ($ttH->data["modules"] as $row) {
			$arr_file[$row{'name_action'}] = $row{'arr_title'}[$ttH->conf['lang_cur']];
		}
	}
	
	$ttH->load_data->data_widget();
	if(isset($ttH->data["widget"])){
		foreach ($ttH->data["widget"] as $row) {
			$arr_file['widget-'.$row{'name_action'}] = 'Widget: '.$row{'arr_title'}[$ttH->conf['lang_cur']];
		}
	}
	
	return $ttH->html->select ($select_name, $arr_file, $cur, $ext,$arr_more);
}

?>