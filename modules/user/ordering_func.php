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
			'title' => $ttH->lang['user']['status_order_0'],
			'color' => '#fff',
			'background_color' => '#710a0e'
			),
		1 => array(
			'title' => $ttH->lang['user']['status_order_1'],
			'color' => '#000',
			'background_color' => '#fff'
			),
		2 => array(
			'title' => $ttH->lang['user']['status_order_2'],
			'color' => '#000',
			'background_color' => '#f4d855'
			),
		3 => array(
			'title' => $ttH->lang['user']['status_order_3'],
			'color' => '#fff',
			'background_color' => '#0012ff'
			),
		10 => array(
			'title' => $ttH->lang['user']['status_order_10'],
			'color' => '#fff',
			'background_color' => '#406800'
			)
	);
	
	return false;
}
load_setting_ordering ();

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

function get_data_product_group () {
	global $ttH;
	
	if(!isset($ttH->data["product_group"])){
		$query = "select group_id, group_nav, parent_id, title, friendly_link 
							from product_group 
							where is_show=1 
							and lang='".$ttH->conf["lang_cur"]."' 
							order by group_level asc, show_order desc, group_id asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["product_group"] = array();
		$ttH->data["product_group_tree"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["product_group"][$row["group_id"]] = $row;
				
				$arr_group_nav = explode(',',$row['group_nav']);
				$str_code = '';
				$f = 0;
				foreach($arr_group_nav as $tmp){
					$f++;
					$str_code .= ($f == 1) ? '['.$tmp.']' : '["arr_sub"]['.$tmp.']';
				}
				eval('$ttH->data["product_group_tree"]'.$str_code.'["group_id"] = $row["group_id"];
				$ttH->data["product_group_tree"]'.$str_code.'["title"] = $row["title"];
				$ttH->data["product_group_tree"]'.$str_code.'["friendly_link"] = $row["friendly_link"];');
			}
		}
	}
	
	return $ttH->data["product_group"];
}

function list_product_group ($select_name="group_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	get_data_product_group ();
	
	return $ttH->html->select ($select_name, $ttH->data["product_group_tree"], $cur, $ext,$arr_more);
}

function get_product_group_name ($group_id, $link='') {
	global $ttH;
	$output = '';
		
	get_data_product_group ();
	
	if (isset($ttH->data["product_group"][$group_id])) {
		$row = $ttH->data["product_group"][$group_id];
		if(!empty($link)) {
			$output = '<a href="'.$link.'">'.$row['title'].'</a>';
		} else {
			$output = $row['title'];
		}
	}
	return $output;
}

?>