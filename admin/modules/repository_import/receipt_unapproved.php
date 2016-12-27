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
	var $modules_call = "repository_import";
	var $action = "receipt_unapproved";
	var $sub = "manage";
	var $temp = "receipt";
	var $receipt_type = "import";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		
		require_once('modules/repository/include/receipt.php');
	}
  // end class
}
?>