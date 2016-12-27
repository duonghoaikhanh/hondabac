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
	var $modules = "config";
	var $action = "ajax";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		
		$ttH->func->load_language_admin($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS.$this->action.".tpl");
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		$fun = (isset($ttH->post['f'])) ? $ttH->post['f'] : '';

		flush();
		switch ($fun) {
			case "load_country_op":
				echo $this->do_load_country_op ();
				exit;
				break;
			case "load_province_op":
				echo $this->do_load_province_op ();
				exit;
				break;
			case "load_district_op":
				echo $this->do_load_district_op ();
				exit;
				break;
			default:
				echo '';
				exit;
				break;
		}
		
		exit;
	}
	
	function do_load_country_op ()
	{
		global $ttH;
		
		$output = array(
			'ok' => 1,
			'html' => ''
		);
		
		
		$where = '';
		if(!empty($ttH->post['area_code'])) {
			$where .= " and area_code='".$ttH->post['area_code']."'";
		}
		if(empty($where)) {
			$output['html'] = '<option value="">'.$ttH->lang['global']['select_title'].'</option>';
			return json_encode($output);
		}
		
		$area_code = (isset($ttH->post['area_code'])) ? $ttH->post['area_code'] : '';
		
		$data = $ttH->load_data->data_table ('location_country', 'code', 'code,title', "is_show=1 and lang='".$ttH->conf['lang_cur']."' ".$where."");
		
		$output['html'] = $ttH->html->select_op ($data, "", 'root');
		if(empty($output['html'])) {
			$output['html'] = '<option value="">'.$ttH->lang['global']['select_title'].'</option>';
		}
		
		return json_encode($output);
	}
	
	function do_load_province_op ()
	{
		global $ttH;
		
		$output = array(
			'ok' => 1,
			'html' => ''
		);
		
		$where = '';
		if(!empty($ttH->post['area_code'])) {
			$where .= " and area_code='".$ttH->post['area_code']."'";
		}
		if(!empty($ttH->post['country_code'])) {
			$where .= " and country_code='".$ttH->post['country_code']."'";
		}
		
		if(empty($where)) {
			$output['html'] = '<option value="">'.$ttH->lang['global']['select_title'].'</option>';
			return json_encode($output);
		}
		
		//$country_code = (isset($ttH->post['country_code'])) ? $ttH->post['country_code'] : '';
		
		$data = $ttH->load_data->data_table ('location_province', 'code', 'code,title', "is_show=1 and lang='".$ttH->conf['lang_cur']."' ".$where."");
		
		$output['html'] = $ttH->html->select_op ($data, "", 'root');
		if(empty($output['html'])) {
			$output['html'] = '<option value="">'.$ttH->lang['global']['select_title'].'</option>';
		}
		
		return json_encode($output);
	}
	
	function do_load_district_op ()
	{
		global $ttH;
		
		$output = array(
			'ok' => 1,
			'html' => ''
		);
		
		$where = '';
		if(!empty($ttH->post['area_code'])) {
			$where .= " and area_code='".$ttH->post['area_code']."'";
		}
		if(!empty($ttH->post['country_code'])) {
			$where .= " and country_code='".$ttH->post['country_code']."'";
		}
		if(!empty($ttH->post['province_code'])) {
			$where .= " and province_code='".$ttH->post['province_code']."'";
		}
		
		if(empty($where)) {
			$output['html'] = '<option value="">'.$ttH->lang['global']['select_title'].'</option>';
			return json_encode($output);
		}
		
		//$country_code = (isset($ttH->post['country_code'])) ? $ttH->post['country_code'] : '';
		
		$data = $ttH->load_data->data_table ('location_district', 'code', 'code,title', "is_show=1 and lang='".$ttH->conf['lang_cur']."' ".$where."");
		
		$output['html'] = $ttH->html->select_op ($data, "", 'root');
		if(empty($output['html'])) {
			$output['html'] = '<option value="">'.$ttH->lang['global']['select_title'].'</option>';
		}
		
		return json_encode($output);
	}
	
  // end class
}
?>