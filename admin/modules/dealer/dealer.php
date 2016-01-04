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
  var $modules = "dealer";
	var $action = "dealer";
	var $folder_upload = "dealer";
	var $dir = "";
	var $dbtable = "dealer";
	var $dbtable_id = "item_id";
	var $tbl_name = "item";
	var $arr_element = array(
		//'group_id' => array('form_type' => 'select', 'title' => 'select_title'),
		//'group_related' => array('form_type' => 'select', 'muti' => 1),
		
		'area' => array('form_type' => 'select', 'function_call' => 'list_location_area', 'attr' => " class='form-control select_location_area' data-country='country' data-province='province' data-district='district'", 'title' => 'select_title', 'required' => ''),
		'country' => array('form_type' => 'select', 'function_call' => 'list_location_country', 'attr' => " class=\"form-control select_location_country\" data-province='province' data-district='district' id='country'", 'title' => 'select_title', 'arr_more' => array('parent_code' => 'area'), 'required' => ''),
		'province' => array('form_type' => 'select', 'function_call' => 'list_location_province', 'attr' => " class=\"form-control select_location_province\" data-district='district' id='province'", 'title' => 'select_title', 'arr_more' => array('parent_code' => 'country'), 'required' => ''),
		'district' => array('form_type' => 'select', 'function_call' => 'list_location_district', 'attr' => " class=\"form-control select_location_district\" id='district'", 'title' => 'select_title', 'arr_more' => array('parent_code' => 'province'), 'required' => ''),
		'address' => array('form_type' => 'text', 'required' => ''),
		
		'title' => array('form_type' => 'text', 'required' => '', 'of_lang' => true),
		'picture' => array('form_type' => 'picture'),
		//'short' => array('form_type' => 'editor', 'editor' => 'mini', 'of_lang' => true),
		'content' => array('form_type' => 'editor', 'of_lang' => true),
		
		
		'map1' => array('form_type' => 'map_google', 'map_latitude' => 'map_latitude', 'map_longitude' => 'map_longitude', 'only' => 'form'),
		'map_latitude' => array('form_type' => 'hidden', 'attr' => ' id="map1_map_latitude"', 'required' => ''),
		'map_longitude' => array('form_type' => 'hidden', 'attr' => ' id="map1_map_longitude"', 'required' => ''),
		'map_information' => array('form_type' => 'editor', 'editor' => 'mini', 'of_lang' => true),
		
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
		
		$ttH->func->include_js($ttH->dir_temp.'js/config/location.js');
		$ttH->func->include_js_content('
			jQuery(document).ready( function($) {
				ttHLocation.list_location_area_load_child();
				ttHLocation.list_location_country_load_child();
				ttHLocation.list_location_province_load_child();
			});
		');
		
		$ttH->func->include_css ($ttH->dir_js.'gmap3/jquery-autocomplete.css');
		
		$ttH->func->include_js ('http://maps.googleapis.com/maps/api/js?sensor=false');
		$ttH->func->include_js ($ttH->dir_js.'gmap3/gmap3.min.js');
		$ttH->func->include_js ($ttH->dir_js.'gmap3/jquery-autocomplete.js');
		
		include ($this->modules."_func.php");		
		$this->dir = create_folder(date("Y_m"));
		
		require_once('modules/common/include/item.php');
	}
  // end class
}
?>