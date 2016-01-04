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
  var $modules = "product";
	var $action = "brand";
	var $folder_upload = "product";
	var $dir = "";
	var $dbtable = "product_brand";
	var $dbtable_id = "brand_id";
	var $tbl_name = "item";
	var $arr_element = array(
		'title' => array('form_type' => 'text', 'required' => '', 'of_lang' => true),
		'picture' => array('form_type' => 'picture'),
		//'short' => array('form_type' => 'editor', 'editor' => 'mini', 'of_lang' => true),
		'content' => array('form_type' => 'editor', 'of_lang' => true),
		//'is_focus' => array('form_type' => 'checkbox'),
		'friendly_link' => array('form_type' => 'friendly_link', 'of_lang' => true),
		'meta_title' => array('form_type' => 'meta_title', 'of_lang' => true),
		'meta_key' => array('form_type' => 'meta_key', 'of_lang' => true),
		'meta_desc' => array('form_type' => 'meta_desc', 'of_lang' => true),
		'show_order' => array('auto' => 0, 'only' => 'add'),
		'is_show' => array('auto' => 1, 'only' => 'add'),
		'date_create' => array('auto' => 'time', 'only' => 'add'),
		'date_update' => array('auto' => 'time'),
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
		
		require_once('modules/common/include/item.php');
	}
  // end class
}
?>