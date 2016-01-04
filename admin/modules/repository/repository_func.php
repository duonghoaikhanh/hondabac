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

//=================load_setting===============
function load_setting (){
	global $ttH;
	$ttH->setting = array();
	
	return false;
}

function create_folder($dir="", $folder_upload='user', $mode = 0755) {
	global $ttH;
	
	if($ttH->func->rmkdir($folder_upload."/".$dir, $mode)){
		return $dir;
	}else{
		return "";
	}
}

//-----------get_group_name
function get_group_name ($module = 'product', $group_id, $type='none'){
	global $ttH;
	
	$data = $ttH->load_data->data_table ($module.'_group_lang', 'group_id', 'group_id,title,friendly_link', " lang='".$ttH->conf['lang_cur']."' and group_id='".$group_id."' ");
	
	$output = '---';
	if (isset($data[$group_id])) {
		$row = $data[$group_id];
		switch ($type) {
			case "link":
				$link = $ttH->admin->get_link_admin ($module, 'group', 'edit', array("id"=>$row['group_id']));
				$output = '<a href="'.$link.'">'.$row['title'].'</a>';
				break;
			default:
				$output = $row['title'];
				break;
		}
	}
	
	return $output;
}

//-----------get_brand_name
function get_brand_name ($brand_id, $type='none'){
	global $ttH;
	
	$data = $ttH->load_data->data_table ('product_brand_lang', 'brand_id', 'brand_id,title,friendly_link', " lang='".$ttH->conf['lang_cur']."' and group_id='".$group_id."' ");
	
	$output = '';
	if (isset($data[$group_id])) {
		$row = $data[$group_id];
		switch ($type) {
			case "link":
				$link = $ttH->site->get_link ('product','thuong-hieu',$row['friendly_link']);
				$output = '<a href="'.$link.'">'.$row['title'].'</a>';
				break;
			default:
				$output = $row['title'];
				break;
		}
	}
	
	return $output;
}

function list_group ($module = 'product', $select_name="group_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	if(!isset($ttH->data[$module."_group"])){
		$query = "select m.group_id, group_nav, parent_id, title 
							from product_group m, product_group_lang ml  
							where m.group_id=ml.group_id 
							and is_show=1 
							and lang='".$ttH->conf["lang_cur"]."' 
							order by group_level asc, show_order desc, m.group_id asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data[$module."_group"] = array();
		$ttH->data[$module."_group_tree"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data[$module."_group"][$row["group_id"]] = $row;
				
				$arr_group_nav = explode(',',$row['group_nav']);
				$str_code = '';
				$f = 0;
				foreach($arr_group_nav as $tmp){
					$f++;
					$str_code .= ($f == 1) ? '['.$tmp.']' : '["arr_sub"]['.$tmp.']';
				}
				eval('$ttH->data["'.$module.'_group_tree"]'.$str_code.'["group_id"] = $row["group_id"];
				$ttH->data["'.$module.'_group_tree"]'.$str_code.'["title"] = $row["title"];');
			}
		}
	}
	$select_muti = (isset($arr_more['select_muti'])) ? $arr_more['select_muti'] : 0;
	if($select_muti == 1) {
		return $ttH->html->select_muti ($select_name, $ttH->data[$module."_group_tree"], $cur, $ext,$arr_more);
	} else {
		return $ttH->html->select ($select_name, $ttH->data[$module."_group_tree"], $cur, $ext,$arr_more);
	}
}

function list_brand ($select_name="brand_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	if(!isset($ttH->data["product_brand"])){
		$query = "select m.brand_id, title 
							from product_brand m, product_brand_lang ml  
							where m.brand_id=ml.brand_id 
							and is_show=1 
							and lang='".$ttH->conf["lang_cur"]."' 
							order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["product_brand"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["product_brand"][$row["brand_id"]] = $row['title'];
			}
		}
	}
	
	return $ttH->html->select ($select_name, $ttH->data["product_brand"], $cur, $ext,$arr_more);
}

function list_group_method ($select_name="brand_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	$arr_group_method = $ttH->load_data->data_table ('repository_method_group', 'group_id', 'group_id,title', " lang='".$ttH->conf['lang_cur']."' and is_show=1 ");
	
	if(!isset($ttH->data["group_method_select"])){
		$ttH->data["group_method_select"] = array();
		if(count($arr_group_method > 0)){
			foreach($arr_group_method as $row){
				$ttH->data["group_method_select"][$row["group_id"]] = $row['title'];
			}
		}
	}

	return $ttH->html->select ($select_name, $ttH->data["group_method_select"], $cur, $ext,$arr_more);
}

function list_product ($select_name="item_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	if(!isset($ttH->data["product"])){
		$query = "select m.item_id, title 
							from product m, product_lang ml  
							where m.item_id=ml.item_id 
							and is_show=1 
							and lang='".$ttH->conf["lang_cur"]."' 
							order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["product"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["product"][$row["item_id"]] = $row['title'];
			}
		}
	}
	
	return $ttH->html->select ($select_name, $ttH->data["product"], $cur, $ext,$arr_more);
}

function list_repository ($select_name="repository_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	if(!isset($ttH->data["repository"])){
		$query = "select item_id, title 
							from repository 
							where is_show=1 
							and lang='".$ttH->conf['lang_cur']."' 
							order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["repository"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["repository"][$row["item_id"]] = $row['title'];
			}
		}
	}
	
	return $ttH->html->select ($select_name, $ttH->data["repository"], $cur, $ext,$arr_more);
}

function list_receipt ($select_name="receipt_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	if(!isset($ttH->data["repository_receipt"])){
		$query = "select receipt_id, receipt_code 
							from repository_receipt 
							where is_show=1 
							order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["repository_receipt"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["repository_receipt"][$row["receipt_id"]] = $row['receipt_code'];
			}
		}
	}
	
	return $ttH->html->select ($select_name, $ttH->data["repository_receipt"], $cur, $ext,$arr_more);
}

function list_product_receipt_import ($select_name="receipt_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	if(!isset($ttH->data["product_receipt_import"])){
		$query = "select receipt_id, title 
							from product_receipt 
							where is_show=0 
							order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["product_receipt_import"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["product_receipt_import"][$row["receipt_id"]] = $row['title'];
			}
		}
	}
	
	return $ttH->html->select ($select_name, $ttH->data["product_receipt_import"], $cur, $ext,$arr_more);
}

function list_ordering ($select_name="item_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	if(!isset($ttH->data["product_order"])){
		$query = "select order_id, order_code  
							from product_order 
							where is_show=1 
							and is_status=2 
							order by show_order desc, date_create asc";
		//echo $query; die();
		$result = $ttH->db->query($query);
		$ttH->data["product_order"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["product_order"][$row["order_id"]] = $row['order_code'];
			}
		}
	}
	
	$select_muti = (isset($arr_more['select_muti'])) ? $arr_more['select_muti'] : 0;
	if($select_muti == 1) {
		return $ttH->html->select_muti ($select_name, $ttH->data["product_order"], $cur, $ext,$arr_more);
	} else {
		return $ttH->html->select ($select_name, $ttH->data["product_order"], $cur, $ext,$arr_more);
	}
}

function receipt_code_next () {
	global $ttH;
	
	$output = 'PK00001';
	
	$query = "select receipt_code  
						from repository_receipt  
						order by receipt_code desc 
						limit 0,1";
	//echo $query;
	$result = $ttH->db->query($query);
	if($row = $ttH->db->fetch_row($result)){
		$output = $row['receipt_code'];
		$output++;
	}
	
	return $output;
}

function receipt_import_code_next () {
	global $ttH;
	
	$output = 'PN00001';
	
	$query = "select code  
						from repository_receipt_import  
						order by code desc 
						limit 0,1";
	//echo $query;
	$result = $ttH->db->query($query);
	if($row = $ttH->db->fetch_row($result)){
		$output = $row['code'];
		$output++;
	}
	
	return $output;
}

?>