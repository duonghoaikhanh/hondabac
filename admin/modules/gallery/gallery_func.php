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

define('DIR_MOD_UPLOAD', $ttH->conf['rooturl'].'uploads/gallery/');

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
	return $ttH->setting;
}

function create_folder($dir="", $mode = 0755) {
	global $ttH;
	
	if($ttH->func->rmkdir("gallery/".$dir, $mode)){
		return $dir;
	}else{
		return "";
	}
}

function built_group_nav_sub ($group_id, $group_nav = '') {
	global $ttH;
	
	$query = "select group_id 
						from gallery_group   
						where parent_id='".$group_id."' ";
	//echo $query;
	$result = $ttH->db->query($query);
	while($row = $ttH->db->fetch_row($result)){
		$col = array();
		$col["group_nav"] = $group_nav;
		$col["group_nav"] .= (!empty($col["group_nav"])) ? ',' : '';
		$col["group_nav"] .= $row['group_id'];
		$col["group_level"] = substr_count($col['group_nav'],',') + 1;
		$ok = $ttH->db->do_update("gallery_group", $col, " group_id='".$row['group_id']."'");	
		if($ok) {
			built_group_nav_sub ($row['group_id'], $col["group_nav"]);
		}		
	}
	
	return '';
}

function get_group_nav ($parent_id, $group_id=0, $type='group') {
	global $ttH;
	
	$output = '';
	if($group_id <= 0 && $type == 'group'){
		return '';
	}
	
	$query = "select group_id, group_nav
						from gallery_group 
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

function get_data_group () {
	global $ttH;
	
	$ttH->load_data->data_group ('gallery');
	
	return $ttH->data["gallery_group"];
}

function list_group ($select_name="group_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	$ttH->load_data->data_group ('gallery');
	
	$select_muti = (isset($arr_more['select_muti'])) ? $arr_more['select_muti'] : 0;
	if($select_muti == 1) {
		return $ttH->html->select_muti ('gallery', $ttH->data["gallery_group_tree"], $cur, $ext,$arr_more);
	} else {
		return $ttH->html->select ($select_name, $ttH->data["gallery_group_tree"], $cur, $ext,$arr_more);
	}
}

function get_group_name ($group_id, $link='') {
	global $ttH;
	$output = '';
		
	get_data_group ();
	
	if (isset($ttH->data["gallery_group"][$group_id])) {
		$row = $ttH->data["gallery_group"][$group_id];
		if(!empty($link)) {
			$output = '<a href="'.$link.'">'.$row['title'].'</a>';
		} else {
			$output = $row['title'];
		}
	}
	return $output;
}

?>