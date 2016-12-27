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
	var $action = "color";
	var $folder_upload = "product";
	var $dir = "";
	var $dbtable = "product_color";
	var $dbtable_id = "color_id";
	var $tbl_name = "single";
	var $arr_element = array(
		'title' => array('form_type' => 'text', 'required' => '', 'of_lang' => true),
		'color' => array('form_type' => 'color', 'required' => ''),
		//'is_focus' => array('form_type' => 'checkbox'),
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
		
		$ttH->func->include_css($ttH->dir_css_global.'excolor-master/css/excolor.css');
		$ttH->func->include_js($ttH->dir_js.'excolor-master/prettify.js');
		$ttH->func->include_js($ttH->dir_js.'excolor-master/jquery.excolor.js');
		$ttH->func->include_js_content("
			jQuery(document).ready( function($) {
				$('input.color_picker').excolor({
					root_path: '".$ttH->dir_css_global."excolor-master/img/'
				});
			});
		");
		
		include ($this->modules."_func.php");		
		$this->dir = create_folder(date("Y_m"));
		
		require_once('modules/common/include/single.php');
	}
  // end class
}
?>