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
function load_setting_ordering (){
	global $ttH;
	if(!isset($ttH->setting_voucher)){
		$ttH->setting_voucher = array();
		$result = $ttH->db->query("select * from voucher_setting where lang='".$ttH->conf['lang_cur']."' ");
		if($row = $ttH->db->fetch_row($result)){
			$ttH->setting_voucher = $row;
		}
	}
	$ttH->setting_ordering = array();	
	$ttH->setting_ordering['status_order'] = array(
		0 => array(
			'title' => 'Đơn hàng đã bị hủy',
			'color' => '#fff',
			'background_color' => '#710a0e'
			),
		1 => array(
			'title' => 'Đơn hàng mới',
			'color' => '#000',
			'background_color' => '#fff'
			),
		2 => array(
			'title' => 'Đã thanh toán',
			'color' => '#000',
			'background_color' => '#f4d855'
			),
		4 => array(
			'title' => 'Đã gửi promotional code',
			'color' => '#000',
			'background_color' => '#f4ee55'
			),
		3 => array(
			'title' => 'Đang giao hàng',
			'color' => '#fff',
			'background_color' => '#0012ff'
			),
		10 => array(
			'title' => 'Đã hoàn tất',
			'color' => '#fff',
			'background_color' => '#406800'
			)
	);
	
	return false;
}

function status_order_name ($status=0) {
	global $ttH;
	
	$output = (isset($ttH->setting_ordering['status_order'][$status]['title'])) ? $ttH->setting_ordering['status_order'][$status]['title'] : '';
	return $output;
}

function status_order_info ($status=0) {
	global $ttH;
	
	$output = (isset($ttH->setting_ordering['status_order'][$status])) ? $ttH->setting_ordering['status_order'][$status] : array();
	return $output;
}

function list_status_order ($select_name="is_status", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	$arr_data = $ttH->setting_ordering['status_order'];
	
	return $ttH->html->select ($select_name, $arr_data, $cur, $ext,$arr_more);
}

?>