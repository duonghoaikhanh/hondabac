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

$ttH->conf['cur_act'] = "contact";

function load_setting ()
{
	global $ttH;
	
	$ttH->setting = (isset($ttH->setting)) ? $ttH->setting : array();
	$ttH->setting['contact'] = array();
	$result = $ttH->db->query("select *  
								from contact_setting  
								where lang='".$ttH->conf['lang_cur']."' 
								limit 0,1");
	if($row = $ttH->db->fetch_row($result)){
		$row['contact_info'] = $ttH->func->input_editor_decode($row['contact_info']);
		$row['contact_form'] = $ttH->func->input_editor_decode($row['contact_form']);
		$ttH->setting['contact'] = $row;
	}
	
	return true;
}
load_setting ();

/*print_arr($ttH->conf);
die();*/
?>