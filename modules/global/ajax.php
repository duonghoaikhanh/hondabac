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
	var $action = "ajax";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		
		$ttH->func->load_language($this->modules);
		
		$fun = (isset($ttH->input['f'])) ? $ttH->input['f'] : '';

		switch ($fun) {
			case "captcha":
				$this->do_captcha ();
				exit;
				break;
			default:
				flush();
				echo '';
				exit;
				break;
		}
		
		exit;
	}
	
	function do_captcha ()
	{
		global $ttH;
		
		Captcha::pic();
	}
		
  // end class
}
?>