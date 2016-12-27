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
	
	$ttH->setting['status'] = array(
		0 => array(
			'title' => 'Đang chờ xét duyệt',
			'color' => '#000',
			'background_color' => '#fff'
			),
		1 => array(
			'title' => 'Đã xét duyệt',
			'color' => '#fff',
			'background_color' => '#406800'
			),
		2 => array(
			'title' => 'Đã bị cấm',
			'color' => '#fff',
			'background_color' => '#710a0e'
			)
	);
	
	return '';
}

function status_info ($status=0) {
	global $ttH;
	
	$output = (isset($ttH->setting['status'][$status])) ? $ttH->setting['status'][$status] : array();
	return $output;
}

function list_status ($select_name="is_show", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	$arr_data = $ttH->setting['status'];
	
	return $ttH->html->select ($select_name, $arr_data, $cur, $ext,$arr_more);
}

function create_folder($dir="", $mode = 0755) {
	global $ttH;
	
	if($ttH->func->rmkdir("user/".$dir, $mode)){
		return $dir;
	}else{
		return "";
	}
}

?>