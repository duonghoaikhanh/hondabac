<?php

/*================================================================================*\
Name code : class_functions.php
Copyright © 2013 by Phan Van Lien
@version : 1.0
@date upgrade : 03/02/2013 by Phan Van Lien
\*================================================================================*/

if (! defined('IN_ttH')) {
  die('Access denied');
}

$ttH->conf['cur_act'] = (isset($ttH->conf['cur_act'])) ? $ttH->conf['cur_act'] : "product";

function load_setting ()
{
	global $ttH;
	
	$ttH->setting = (isset($ttH->setting)) ? $ttH->setting : array();
	if(!isset($ttH->setting['product'])){
		$ttH->setting['product'] = array();
		$result = $ttH->db->query("select * from product_setting ");
		while($row = $ttH->db->fetch_row($result)){
			$ttH->setting['product_'.$row['lang']] = $row;
			if($ttH->conf['lang_cur'] == $row['lang']) {
				$ttH->setting['product'] = $row;
			}
		}
	}
	
	if(!isset($ttH->setting['user'])){
		$ttH->setting['user'] = array();
		$result = $ttH->db->query("select * from user_setting ");
		if($row = $ttH->db->fetch_row($result)){
			$ttH->setting['user_'.$row['lang']] = $row;
			if($ttH->conf['lang_cur'] == $row['lang']) {
				$ttH->setting['user'] = $row;
			}
		}
	}
	
	if(!isset($ttH->setting['voucher'])){
		$ttH->setting['voucher'] = array();
		$result = $ttH->db->query("select * from voucher_setting where lang='".$ttH->conf['lang_cur']."' ");
		if($row = $ttH->db->fetch_row($result)){
			$ttH->setting['voucher'] = $row;
		}
	}
	
	$ttH->load_data->data_group ('product');
	
	return true;
}
load_setting ();


if($ttH->conf['cur_act'] == "group" && !empty($ttH->conf['cur_act_id'])) {
	$result = $ttH->db->query("select *  
								from product_group 
								where lang='".$ttH->conf['lang_cur']."' 
								and group_id='".$ttH->conf['cur_act_id']."' 
								limit 0,1");
	if($row = $ttH->db->fetch_row($result)){
		$row['content'] = $ttH->func->input_editor_decode($row['content']);
		$ttH->conf['cur_act'] = "product";
		$ttH->conf['cur_group'] = $row['group_id'];
		$ttH->data['cur_group'] = $row;
	}
}elseif($ttH->conf['cur_act'] == "detail" && !empty($ttH->conf['cur_act_id'])) {
	$result = $ttH->db->query("select *  
							from product 
							where lang='".$ttH->conf['lang_cur']."' 
							and item_id='".$ttH->conf['cur_act_id']."' 
							limit 0,1");
	if($row = $ttH->db->fetch_row($result)){
		$row['short'] = $ttH->func->input_editor_decode($row['short']);
		$row['content'] = $ttH->func->input_editor_decode($row['content']);
		$row['content1'] = isset($row['content1']) ? $ttH->func->input_editor_decode($row['content1']) : '';
		$row['content2'] = isset($row['content2']) ? $ttH->func->input_editor_decode($row['content2']) : '';
		$row['content3'] = isset($row['content3']) ? $ttH->func->input_editor_decode($row['content3']) : '';
		$row['content4'] = isset($row['content4']) ? $ttH->func->input_editor_decode($row['content4']) : '';
		$row['content5'] = isset($row['content5']) ? $ttH->func->input_editor_decode($row['content5']) : '';
		$row['arr_option'] = unserialize($row['arr_option']);
		$ttH->conf['cur_act'] = "detail";
		$ttH->conf['cur_item'] = $row['item_id'];
		$ttH->data['cur_item'] = $row;
	}
}

//if(!empty($ttH->conf['cur_act_url']) && !empty($ttH->conf['cur_item_url']) && $ttH->conf['cur_act_url']==$ttH->setting['product']['ordering_friendly_link']){
//	switch ($ttH->conf['cur_item_url']) {
//		case $ttH->setting['product']['ordering_cart_link']:
//			$ttH->conf['cur_act'] = "cart";
//			break;
//		case $ttH->setting['product']['ordering_address_link']:
//			$ttH->conf['cur_act'] = "ordering_address";
//			break;
//		/*case $ttH->setting['product']['ordering_shipping_link']:
//			$ttH->conf['cur_act'] = "shipping";
//			break;*/
//		case $ttH->setting['product']['ordering_method_link']:
//			$ttH->conf['cur_act'] = "ordering_method";
//			break;
//		case $ttH->setting['product']['ordering_complete_link']:
//			$ttH->conf['cur_act'] = "ordering_complete";
//			break;
//	}
//}


/*print_arr($ttH->conf);
die();*/
?>