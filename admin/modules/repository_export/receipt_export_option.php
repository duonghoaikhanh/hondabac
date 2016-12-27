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
	var $modules_call = "repository_export";
	var $action = "receipt_export_option";
	var $sub = "manage";
	var $temp = "receipt_export_option";
	var $receipt_type = "export_option";
	var $folder_upload = "repository";
	var $dir = '';
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		
		require_once('modules/repository/include/receipt_export_option.php');
	}
  // end class
}
?>