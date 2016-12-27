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
  var $modules = "layout";
	var $action = "sidebar";
	var $folder_upload = "layout";
	var $dir = "";
	var $dbtable = "sidebar";
	var $dbtable_id = "sidebar_id";
	var $tbl_name = "single";
	var $arr_element = array(
		'title' => array('form_type' => 'text', 'required' => '', 'of_lang' => true),
		'list_widget' => array('form_type' => 'select' ,'muti' => true, 'title' => 'select_title'),
		'show_order' => array('auto' => 0, 'only' => 'add'),
		'is_show' => array('auto' => 1, 'only' => 'add'),
		'date_create' => array('auto' => 'time', 'only' => 'add'),
		'date_update' => array('auto' => 'time')
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
		
		require_once('modules/common/include/single.php');
	}
  // end class
}
?>