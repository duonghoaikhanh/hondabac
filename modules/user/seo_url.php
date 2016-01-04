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

$ttH->conf['cur_act'] = "user";

function load_setting ()
{
	global $ttH;
	
	$ttH->setting = (isset($ttH->setting)) ? $ttH->setting : array();
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
	
	return true;
}
load_setting ();

if(!empty($ttH->conf['cur_act_url'])){
	switch ($ttH->conf['cur_act_url']) {
		case $ttH->setting['user']['signup_link']:
			$ttH->conf['cur_act'] = "signup";
			break;
		case $ttH->setting['user']['signin_link']:
			$ttH->conf['cur_act'] = "signin";
			break;
		case $ttH->setting['user']['account_link']:
			$ttH->conf['cur_act'] = "account";
			break;
		case $ttH->setting['user']['address_book_link']:
			$ttH->conf['cur_act'] = "address_book";
			break;
		case $ttH->setting['user']['change_pass_link']:
			$ttH->conf['cur_act'] = "change_pass";
			break;
		case $ttH->setting['user']['forget_pass_link']:
			$ttH->conf['cur_act'] = "forget_pass";
			break;
		case $ttH->setting['user']['active_link']:
			$ttH->conf['cur_act'] = "active";
			break;
		case $ttH->setting['user']['ordering_link']:
			$ttH->conf['cur_act'] = "ordering";
			break;
		/*case $ttH->setting['user']['promotion_link']:
			$ttH->conf['cur_act'] = "promotion";
			break;
		case $ttH->setting['user']['voucher_link']:
			$ttH->conf['cur_act'] = "voucher";
			break;*/
	}
}


/*print_arr($ttH->conf);
die();*/
?>