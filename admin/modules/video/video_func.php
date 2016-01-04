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
	
	if(!isset($ttH->data["video_group"])){
		$result = $ttH->db->query("select p.group_id, title 
																from video_group p, video_group_lang pl  
																where p.group_id=pl.group_id 
																and is_show=1 
																order by show_order desc, date_create asc");
		$ttH->data["video_group"] = array();
		while ($row = $ttH->db->fetch_row($result))
		{
			$ttH->data["video_group"][$row['group_id']] = $row['title'];
		}
	}
	
	return '';
}

function create_folder($dir="", $mode = 0755) {
	global $ttH;
	
	if($ttH->func->rmkdir("video/".$dir, $mode)){
		return $dir;
	}else{
		return "";
	}
}

function built_group_nav_sub ($group_id, $group_nav = '') {
	global $ttH;
	
	$query = "select group_id 
						from video_group   
						where parent_id='".$group_id."' ";
	//echo $query;
	$result = $ttH->db->query($query);
	while($row = $ttH->db->fetch_row($result)){
		$col = array();
		$col["group_nav"] = $group_nav;
		$col["group_nav"] .= (!empty($col["group_nav"])) ? ',' : '';
		$col["group_nav"] .= $row['group_id'];
		$col["group_level"] = substr_count($col['group_nav'],',') + 1;
		$ok = $ttH->db->do_update("video_group", $col, " group_id='".$row['group_id']."'");	
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
						from video_group 
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

//-----------get_group_name
function get_group_name ($group_id, $type='none'){
	global $ttH;
	
	$data = $ttH->load_data->data_table ('video_group_lang', 'group_id', 'group_id,title,friendly_link', " lang='".$ttH->conf['lang_cur']."' and group_id='".$group_id."' ");
	
	$output = '---';
	if (isset($data[$group_id])) {
		$row = $data[$group_id];
		switch ($type) {
			case "link":
				$link = $ttH->admin->get_link_admin ('video', 'group', 'edit', array("id"=>$row['group_id']));
				$output = '<a href="'.$link.'">'.$row['title'].'</a>';
				break;
			default:
				$output = $row['title'];
				break;
		}
	}
	
	return $output;
}

function list_group ($select_name="group_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	if(!isset($ttH->data["video_group"])){
		$result = $ttH->db->query("select p.group_id, title 
																from video_group p, video_group_lang pl  
																where p.group_id=pl.group_id 
																and is_show=1 
																order by show_order desc, date_create asc");
		$ttH->data["video_group"] = array();
		while ($row = $ttH->db->fetch_row($result))
		{
			$ttH->data["video_group"][$row['group_id']] = $row['title'];
		}
	}
	
	return $ttH->html->select ($select_name, $ttH->data["video_group"], $cur, $ext,$arr_more);
}

function list_pic_show ($select_name="pic_show", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	$arr_data = array(
		'slide' => 'Dạng slide',
		'grid' => 'Dạng danh sách'
	);
	
	return $ttH->html->select ($select_name, $arr_data, $cur, $ext,$arr_more);
}

?>