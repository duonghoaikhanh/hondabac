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
	var $action = "receipt_export";
	var $sub = "manage";
	var $temp = "receipt_export";
	var $receipt_type = "export";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		
		require_once('modules/repository/include/receipt_export.php');
	}
  // end class
}
?>