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
function load_setting ()
{
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

function box_menu () {
	global $ttH;
	
	$cur = (isset($ttH->conf["cur_item"])) ? $ttH->conf["cur_item"] : 0;
	
	if(!isset($ttH->data["about"])){
		$query = "select item_id, title, friendly_link 
				from about 
				where is_show=1 
				and lang='".$ttH->conf['lang_cur']."' 
				order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["about"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["about"][$row["item_id"]] = $row;
			}
		}
	}
	
	$output = '';
	
	if(count($ttH->data["about"]) > 0){
		$data = array(
			'title' => $ttH->lang['about']['menu_title'],
			'content' => ''
		);
		
		$menu_sub = '';
		$i = 0;
		foreach($ttH->data["about"] as $row)
		{
			$i++;
			$row['link'] = $ttH->site->get_link ('about','',$row['friendly_link']);
			$row['first'] = ($i == 1) ? ' class="first"' : '';
			$row['class'] = ($row['item_id'] == $cur) ? ' class="current"' : '';
			
			$ttH->temp_box->assign('row', $row);
			$ttH->temp_box->parse("box_menu.menu_sub.row");
			$menu_sub .= $ttH->temp_box->text("box_menu.menu_sub.row");
			$ttH->temp_box->reset("box_menu.menu_sub.row");
		}		
		
		$ttH->temp_box->reset("box_menu.menu_sub");
		$ttH->temp_box->assign('data', array('content' => $menu_sub));
		$ttH->temp_box->parse("box_menu.menu_sub");
		
		$ttH->temp_box->assign('data', $data);
		$ttH->temp_box->parse("box_menu");
		$output = $ttH->temp_box->text("box_menu");
	}
	
	return $output;
}
//=================box_column===============
function box_column ()
{
	global $ttH;
	
	$output = $ttH->site->block_left ();
	
	return $output;
}

?>