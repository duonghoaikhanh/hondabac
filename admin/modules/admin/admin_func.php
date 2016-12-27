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

define('DIR_MOD_UPLOAD', $ttH->conf['rooturl'].'uploads/admin/');

//=================list_skin===============
function load_setting (){
	global $ttH;
	$ttH->setting = array();
	$sql = "SELECT userid, username FROM users WHERE status=1";
	$result = $ttH->db->query($sql);
	if ($num = $ttH->db->num_rows($result))
	{
		while ($row = $ttH->db->fetch_row($result))
		{
			$selected = ($row["userid"] == $cur) ? " selected='selected'" : "";
			$text .= "<option value=\"".$row["userid"] ."\" ".$selected."> " . $row["username"] . " </option>";
		}
		
	}
	return $text;
}

function create_folder($dir="", $mode = 0755) {
	global $ttH;
	
	if($ttH->func->rmkdir("admin/".$dir, $mode)){
		return $dir;
	}else{
		return "";
	}
}

function get_group_nav ($parent_id, $group_id=0, $type='group') {
	global $ttH;
	
	$output = '';
	if($group_id <= 0 && $type == 'group'){
		return '';
	}
	
	$query = "select group_id, group_nav
						from admin_group 
						where group_id='".$parent_id."' 
						limit 0,1";
	//echo $query;
	$result = $ttH->db->query($query);
	if($row = $ttH->db->fetch_row($result)){
		$output = $row['group_nav'];
		if($type == 'group'){
			$output .= ','.$group_id;
		}
	}else{
		if($type == 'group'){
			$output = $group_id;
		}
	}
	
	return $output;
}

function list_group ($select_name="group_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	if(!isset($ttH->data["admin_group"])){
		$query = "select group_id, arr_title 
							from admin_group 
							where is_show=1 
							order by show_order desc, date_create asc";
		//echo $query; die();
		$result = $ttH->db->query($query);
		$ttH->data["admin_group"] = array();
		$ttH->data["admin_group"][-1] = array(
			'title' => 'Admin'
		);
		
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$row['arr_title'] = unserialize($row['arr_title']);
				$row['title'] = $row['arr_title'][$ttH->conf['lang_cur']];
				$ttH->data["admin_group"][$row["group_id"]] = $row;
			}
		}
	}
	
	return $ttH->html->select ($select_name, $ttH->data["admin_group"], $cur, $ext,$arr_more);
}

function list_brand ($select_name="brand_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	if(!isset($ttH->data["admin_brand"])){
		$query = "select m.brand_id, title 
							from admin_brand m, admin_brand_lang ml  
							where m.brand_id=ml.brand_id 
							and is_show=1 
							and lang='".$ttH->conf["lang_cur"]."' 
							order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["admin_brand"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["admin_brand"][$row["brand_id"]] = $row['title'];
			}
		}
	}
	
	return $ttH->html->select ($select_name, $ttH->data["admin_brand"], $cur, $ext,$arr_more);
}

function list_input_option ($select_name="arr_option", $cur=array(), $ext="",$arr_more=array()) {
	global $ttH;
	
	if(!isset($ttH->data["admin_option"])){
		$query = "select option_id, arr_title  
							from admin_option 
							where is_show=1 
							order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["admin_option"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$row['arr_title'] = unserialize($row['arr_title']);
				$row['title'] = $row['arr_title'][$ttH->conf['lang_cur']];
				$ttH->data["admin_option"][$row["option_id"]] = $row;
			}
		}
	}
	
	if(isset($ttH->data["admin_option"])){
		$ttH->temp_act->parse("edit.f_input_option");
		
		foreach($ttH->data["admin_option"] as $row) {
			$row['content'] = (isset($cur[$row['option_id']])) ? $cur[$row['option_id']] : '';
			$ttH->temp_act->assign('row', $row);
			$ttH->temp_act->parse("edit.input_option");
		}
	}
	
	return '';
}

?>