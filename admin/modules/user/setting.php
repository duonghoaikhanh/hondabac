<?php

/*================================================================================*\
Name code : view.php
Copyright © 2015  by Phan Van Lien
@version : 1.0
@date upgrade : 01/01/2015 by Phan Van Lien
\*================================================================================*/

if (! defined('IN_ttH')) {
  die('Access denied');
}
$nts = new sMain();

class sMain
{
  var $modules = "user";
	var $action = "setting";
	var $folder_upload = "user";
	var $dir = "";
	var $arr_action = array();
	var	$arr_friendly_link = array('signup_link','signin_link','change_pass_link','forget_pass_link','ordering_link','promotion_link','voucher_link');
	var	$arr_editor = array();
	var $arr_list_num = array(
		'num_list' => array()
	);
	
  /**
   * function sMain ()
   * Khoi tao 
   **/
	function sMain ()
	{
		global $ttH;
		
		include ($this->modules."_func.php");		
		$this->dir = create_folder(date("Y_m"));
		
		require_once('modules/common/include/setting.php');
	}
  // end class
}
?>