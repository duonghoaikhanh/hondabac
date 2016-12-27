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

function contact_info ()
{
	global $ttH;
	
	$output = '';
	if(isset($ttH->setting['contact']['contact_info'])) {
		$data = array();
		$data['content'] = $ttH->setting['contact']['contact_info'];
	
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("contact_info");
		$output = $ttH->temp_act->text("contact_info");
	}
	return $output;
}

//=================box_column===============
function box_left ()
{
	global $ttH;
	
	$output = $ttH->site->block_left ();
	
	return $output;
}

//=================box_column===============
function box_column ()
{
	global $ttH;
	
	$output = $ttH->site->block_column ();
	
	return $output;
}

?>