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
  var $modules = "project";
	var $action = "setting";
	var $folder_upload = "project";
	var $dir = "";
	var $dbtable = "project_setting";
	var $dbtable_id = "id";
	var $tbl_name = "setting";
	var $arr_element = array(
		'background' => array('form_type' => 'picture'),
		'num_list' => array('form_type' => 'select', 'select_type' => 'list_num', 'title' => 'select_title'),
		'num_order_detail' => array('form_type' => 'select', 'select_type' => 'list_num', 'title' => 'select_title'),
		'lang' => array('of_lang' => true)
	);
	var $arr_element_seo = array(
		'project_meta_title' => array('form_type' => 'meta_title', 'required' => '', 'of_lang' => true),
		'project_meta_key' => array('form_type' => 'meta_key', 'of_lang' => true),
		'project_meta_desc' => array('form_type' => 'meta_desc', 'of_lang' => true),
		'lang' => array('of_lang' => true)
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