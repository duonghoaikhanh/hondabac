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
	var $action = "address_book";
	var $sub = "manage";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		
		if($ttH->site_func->check_user_login() != 1) {
			$url = $ttH->func->base64_encode($_SERVER['REQUEST_URI']);
			$url = (!empty($url)) ? '/?url='.$url : '';
			$link_go = $ttH->site->get_link ($this->modules, $ttH->setting[$this->modules]["signin_link"]).$url;
			$ttH->html->redirect_rel($link_go);
		}
		
		$ttH->func->load_language($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS.$this->modules.".tpl");
		$ttH->temp_act->assign('CONF', $ttH->conf);
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		$ttH->func->include_css ($ttH->dir_css.$this->modules.'/'.$this->modules.'.css');
		
		$ttH->func->include_js($ttH->dir_js.'jquery_plugins/jquery.validate.js');
		$ttH->func->include_js($ttH->dir_skin.'js/location/location.js');
		$ttH->func->include_js($ttH->dir_skin.'js/'.$this->modules.'/'.$this->modules.'.js');
		
		$ttH->conf['menu_action'] = array($this->modules);
		$ttH->data['link_lang'] = (isset($ttH->data['link_lang'])) ? $ttH->data['link_lang'] : array();
		
		include ($this->modules."_func.php");
		
		$data = array();
		//Make link lang
		foreach($ttH->data['lang'] as $row_lang) {
			$ttH->data['link_lang'][$row_lang['name']] = $ttH->site->get_link_lang ($row_lang['name'], $this->modules);
		}
		//End Make link lang
		
		//SEO
		$ttH->site->get_seo (array(
			'meta_title' => (isset($ttH->setting[$this->modules][$this->action."_meta_title"])) ? $ttH->setting[$this->modules][$this->action."_meta_title"] : '',
			'meta_key' => (isset($ttH->setting[$this->modules][$this->action."_meta_key"])) ? $ttH->setting[$this->modules][$this->action."_meta_key"] : '',
			'meta_desc' => (isset($ttH->setting[$this->modules][$this->action."_meta_desc"])) ? $ttH->setting[$this->modules][$this->action."_meta_desc"] : ''
		));
		$ttH->conf["cur_group"] = 0;
		
		$data = array();
		$data['content'] = $this->do_main();
		$data['box_left'] = box_left($this->action);
		//$data['box_column'] = box_column();
	
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("main");
		$ttH->output .=  $ttH->temp_act->text("main");
	}
	
	function do_main ()
	{
		global $ttH;	
		
		$link_action = $ttH->site->get_link ($this->modules, $ttH->setting[$this->modules][$this->action."_link"]);
		$err = '';
		
		if (isset($ttH->post['do_submit'])) {
			if(empty($err)){
				$col = array();
				$col["arr_address_book"] = $ttH->func->serialize($ttH->post["data"]);
				$col["date_update"] = time();
				$ok = $ttH->db->do_update("user", $col, " user_id='".$ttH->data['user_cur']['user_id']."'");	
				if($ok){					
					$err = $ttH->html->alert ($ttH->lang["user"]["edit_success"], $link_action);
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["user"]["edit_false"], "error");	
				}
			}
		}
		
		$data = $ttH->func->if_isset($ttH->data['user_cur']['arr_address_book'][0], array());
		$arr_k = array('email','phone','address','province','district','ward');
		if (count($data) < 1) {
			
			$data['o_full_name'] = $ttH->func->if_isset($ttH->data['user_cur']['nickname'], '');
			$data['d_full_name'] = $ttH->func->if_isset($ttH->data['user_cur']['nickname'], '');
			foreach($arr_k as $k) {		
				$data['o_'.$k] = $ttH->func->if_isset($ttH->data['user_cur'][$k], '');
				$data['d_'.$k] = $ttH->func->if_isset($ttH->data['user_cur'][$k], '');
			}
		}
		
		//print_arr($data); die();
		
		$data["o_list_location_province"] = $ttH->site_func->list_location_province ("data[0][o_province]", 'vi', $data['o_province']," class=\"form-control select_location_province\" data-district='o_district_0' data-ward='o_ward_0' id='o_province_0'", array('title' => $ttH->lang['global']['select_title']));
		$data["o_list_location_district"] = $ttH->site_func->list_location_district ("data[0][o_district]", $data['o_province'], $data['o_district']," class=\"form-control select_location_district\" data-ward='o_ward_0' id='o_district_0'", array('title' => $ttH->lang['global']['select_title']));
		$data["o_list_location_ward"] = $ttH->site_func->list_location_ward ("data[0][o_ward]", $data['o_district'], $data['o_ward']," class=\"form-control\" id='o_ward_0'", array('title' => $ttH->lang['global']['select_title']));
		
		$data["d_list_location_province"] = $ttH->site_func->list_location_province ("data[0][d_province]", 'vi', $data['d_province']," class=\"form-control select_location_province\" data-district='d_district_0' data-ward='d_ward_0' id='d_province_0'", array('title' => $ttH->lang['global']['select_title']));
		$data["d_list_location_district"] = $ttH->site_func->list_location_district ("data[0][d_district]", $data['d_province'], $data['d_district']," class=\"form-control select_location_district\" data-ward='d_ward_0' id='d_district_0'", array('title' => $ttH->lang['global']['select_title']));
		$data["d_list_location_ward"] = $ttH->site_func->list_location_ward ("data[0][d_ward]", $data['d_district'], $data['d_ward']," class=\"form-control\" id='d_ward_0'", array('title' => $ttH->lang['global']['select_title']));
		
		$data['err'] = $err;
		$data['link_action'] = $link_action;
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("address_book");
		return $ttH->temp_act->text("address_book");
	}
	
  // end class
}
?>