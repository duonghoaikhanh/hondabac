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

define('DIR_MOD_UPLOAD', $ttH->conf['rooturl'].'uploads/user/');


function setting(){
	global $ttH;
	if(!isset($ttH->setting_voucher)){
		$ttH->setting_voucher = array();
		$result = $ttH->db->query("select * from voucher_setting where lang='".$ttH->conf['lang_cur']."' ");
		if($row = $ttH->db->fetch_row($result)){
			$ttH->setting_voucher = $row;
		}
	}
	$ttH->setting_promotion = array();	
	$ttH->setting_promotion['status'] = array(
		0 => array(
			'title' => $ttH->lang['user']['promotion_status_0'],
			'color' => '#000',
			'background_color' => '#fff'
			),
		1=> array(
			'title' => $ttH->lang['user']['promotion_status_1'],
			'color' => '#fff',
			'background_color' => '#710a0e'
			)
	);
	
	return false;
}

setting();

function promotion_status_info ($status=0) {
	global $ttH;
	
	$output = (isset($ttH->setting_promotion['status'][$status])) ? $ttH->setting_promotion['status'][$status] : array();
	return $output;
}

function box_menu ($cur="") {
	global $ttH;
	
	$data = array(
		'title' => $ttH->lang['user']['menu_title'],
		'content' => ''
	);
	
	$arr_is_login = array(
		'user' => array(
			'title' => $ttH->setting["user"]["user_meta_title"],
			'link' => $ttH->site->get_link ("user")
		),
		'account' => array(
			'title' => $ttH->setting["user"]["account_meta_title"],
			'link' => $ttH->site->get_link ("user",$ttH->setting["user"]["account_link"])
		),
		'address_book' => array(
			'title' => $ttH->setting["user"]["address_book_meta_title"],
			'link' => $ttH->site->get_link ("user",$ttH->setting["user"]["address_book_link"])
		),
		'change_pass' => array(
			'title' => $ttH->setting["user"]["change_pass_meta_title"],
			'link' => $ttH->site->get_link ("user",$ttH->setting["user"]["change_pass_link"])
		),
		'ordering' => array(
			'title' => $ttH->setting["user"]["ordering_meta_title"],
			'link' => $ttH->site->get_link ("user",$ttH->setting["user"]["ordering_link"])
		),
		/*'promotion' => array(
			'title' => $ttH->setting["user"]["promotion_meta_title"],
			'link' => $ttH->site->get_link ("user",$ttH->setting["user"]["promotion_link"])
		),
		'voucher' => array(
			'title' => $ttH->setting["user"]["voucher_meta_title"],
			'link' => $ttH->site->get_link ("user",$ttH->setting["user"]["voucher_link"])
		),*/
		'signout' => array(
			'title' => $ttH->lang['user']['signout'],
			'link' => "javascript:void(0)",
			'attr_link' => "onclick=\"ttHUser.signout('')\""
		)
	);
	
	$menu_sub = '';
	$i = 0;
	$num = count($arr_is_login);
	foreach($arr_is_login as $key => $row)
	{
		$i++;
		$arr_class_li = array();
		if($i == 1) {
			$arr_class_li[] = 'first';
		}
		if($i == $num) {
			$arr_class_li[] = 'last';
		}
		$row['class_li'] = (count($arr_class_li) > 0) ? ' class="'.implode(' ',$arr_class_li).'"' : '';
		$row['class'] = ($key == $cur) ? ' class="current"' : '';
		$row['menu_sub'] = '';

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
	
	return $output;
}

//=================box_column===============
function box_left ($action)
{
	global $ttH;
	
	$output = '';
	$output = box_menu ($action);
	//$output = $ttH->site->block_left ();
	
	return $output;
}

//=================box_column===============
function box_column ()
{
	global $ttH;
	
	$output = $ttH->site->block_column ();
	
	return $output;
}

/*==============================SHOPPING==============================*/
function list_quantity ($select_name,$cur="", $ext="",$arr_more=array())
{
	global $ttH;
	
	return $ttH->site->list_number ($select_name, 1, 100, $cur, $ext,$arr_more);
}

?>