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
	
	if(!isset($ttH->data["banner_group"])){
		$result = $ttH->db->query("select group_id, arr_title, width, height from banner_group where is_show=1 order by show_order desc, date_create asc");
		$ttH->data["banner_group"] = array();
		while ($row = $ttH->db->fetch_row($result))
		{
			$arr_title = unserialize($row['arr_title']);
			$width = ($row['width'] > 0) ? $row['width'].'px' : 'auto';
			$height = ($row['height'] > 0) ? $row['height'].'px' : 'auto';
			foreach($arr_title as $k => $v) {
				$arr_title[$k] = $v.' ('.$width.' x '.$height.')';
			}			
			$ttH->data["banner_group"][$row['group_id']] = isset($arr_title[$ttH->conf['lang_cur']]) ? $arr_title[$ttH->conf['lang_cur']] :'';
		}
	}
	
	return true;
}

function list_group ($select_name="group_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	if(!isset($ttH->data["banner_group"])){
		$result = $ttH->db->query("select group_id, arr_title, width, height from banner_group where is_show=1 order by show_order desc, date_create asc");
		$ttH->data["banner_group"] = array();
		while ($row = $ttH->db->fetch_row($result))
		{
			$arr_title = unserialize($row['arr_title']);
			$width = ($row['width'] > 0) ? $row['width'].'px' : 'auto';
			$height = ($row['height'] > 0) ? $row['height'].'px' : 'auto';
			foreach($arr_title as $k => $v) {
				$arr_title[$k] = $v.' ('.$width.' x '.$height.')';
			}			
			$ttH->data["banner_group"][$row['group_id']] = $arr_title[$ttH->conf['lang_cur']];
		}
	}
	
	return $ttH->html->select ($select_name, $ttH->data["banner_group"], $cur, $ext,$arr_more);
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
	
	if(substr($select_name,-1) == "]") {
		return $ttH->html->select_muti ($select_name, $ttH->data["modules_select"], $cur, $ext,$arr_more);
	} else {
		return $ttH->html->select ($select_name, $ttH->data["modules_select"], $cur, $ext,$arr_more);
	}
}

function list_type_show ($select_name="type_show", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	$data = array(
		'fixed' => 'Cố định',
		'full' => 'Co giãn theo khung chứa'
	);
	
	return $ttH->html->select ($select_name, $data, $cur, $ext,$arr_more);
}

function list_size_unit ($select_name="size_unit", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	$data = array(
		'px' => 'px',
		'%' => '%'
	);
	
	return $ttH->html->select ($select_name, $data, $cur, $ext,$arr_more);
}

function create_folder ($dir="", $mode = 0755) {
	global $ttH;
	
	if($ttH->func->rmkdir("banner/".$dir, $mode)){
		return $dir;
	}else{
		return "";
	}
}

?>