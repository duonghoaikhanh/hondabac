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

function list_location_area ($select_name="area_code", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	$data = $ttH->load_data->data_table ('location_area', 'code', 'code,title', "is_show=1 and lang='".$ttH->conf['lang_cur']."'");
	
	return $ttH->html->select ($select_name, $data, $cur, $ext,$arr_more);
}

function list_location_country ($select_name="country_code", $parent_code='', $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	$data = $ttH->load_data->data_table ('location_country', 'code', 'code,title', "is_show=1 and lang='".$ttH->conf['lang_cur']."' and area_code='".$parent_code."'");
	
	return $ttH->html->select ($select_name, $data, $cur, $ext,$arr_more);
}

function list_location_province ($select_name="province_code", $parent_code='', $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	$data = $ttH->load_data->data_table ('location_province', 'code', 'code,title', "is_show=1 and lang='".$ttH->conf['lang_cur']."' and country_code='".$parent_code."'");
	
	return $ttH->html->select ($select_name, $data, $cur, $ext,$arr_more);
}

function list_location_district ($select_name="district_code", $parent_code='', $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	$data = $ttH->load_data->data_table ('location_district', 'code', 'code,title', "is_show=1 and lang='".$ttH->conf['lang_cur']."' and province_code='".$parent_code."'");
	
	return $ttH->html->select ($select_name, $data, $cur, $ext,$arr_more);
}

function list_location_ward ($select_name="ward_code", $parent_code='', $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	$data = $ttH->load_data->data_table ('location_ward', 'code', 'code,title', "is_show=1 and lang='".$ttH->conf['lang_cur']."' and district_code='".$parent_code."'");
	
	return $ttH->html->select ($select_name, $data, $cur, $ext,$arr_more);
}
?>