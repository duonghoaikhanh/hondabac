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
	var $action = "ordering_address";
	var $sub = "manage";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;

		$ttH->func->load_language($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS."ordering.tpl");
		$ttH->temp_act->assign('CONF', $ttH->conf);
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		$ttH->func->include_css ($ttH->dir_css.$this->modules.'/ordering.css');
		$ttH->func->include_js($ttH->dir_js.'jquery_plugins/jquery.validate.js');
		$ttH->func->include_js($ttH->dir_skin.'js/global/temp.js');
		$ttH->func->include_js($ttH->dir_skin.'js/location/location.js');
		$ttH->func->include_js($ttH->dir_skin.'js/user/user.js');
		$ttH->func->include_js($ttH->dir_skin.'js/'.$this->modules.'/ordering.js');
		
		$ttH->conf['menu_action'] = array($this->modules);
		$ttH->data['link_lang'] = (isset($ttH->data['link_lang'])) ? $ttH->data['link_lang'] : array();
		
		include ($this->modules."_func.php");
		
		$data = array();
		//Make link lang
		foreach($ttH->data['lang'] as $row_lang) {
			$ttH->data['link_lang'][$row_lang['name']] = $ttH->site->get_link_lang ($row_lang['name'], $this->modules, $ttH->setting[$this->modules.'_'.$row_lang['name']]['ordering_friendly_link'], $ttH->setting[$this->modules.'_'.$row_lang['name']]['ordering_cart_link']);
		}
		//End Make link lang
		
		//SEO
		$ttH->site->get_seo (array(
			'meta_title' => (isset($ttH->setting['product'][$this->action."_meta_title"])) ? $ttH->setting['product'][$this->action."_meta_title"] : '',
			'meta_key' => (isset($ttH->setting['product'][$this->action."_meta_key"])) ? $ttH->setting['product'][$this->action."_meta_key"] : '',
			'meta_desc' => (isset($ttH->setting['product'][$this->action."_meta_desc"])) ? $ttH->setting['product'][$this->action."_meta_desc"] : ''
		));
		$ttH->conf["cur_group"] = 0;
		
		$data = array();
		$data['content'] = $this->do_main();
		$data['box_left'] = box_left();
		$data['box_column'] = box_column();
	
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("main");
		$ttH->output .=  $ttH->temp_act->text("main");
	}
	
	function do_main ()
	{
		global $ttH;
		
		$data = array();
		
		$ordering_address = Session::Get('ordering_address', array());
		
		if($ttH->site_func->check_user_login() || count($ordering_address) > 0 || isset($ttH->get['skip_login'])) {
			return $this->do_address();
		} else {
			//Captcha::Set();
			if(isset($ttH->is_popup)) {
				$link_forget_password = $ttH->site_func->get_link_popup ('user', 'forget_pass');
			
				$data['link_login_go'] = $ttH->site_func->get_link_popup ('product','ordering_address');
				$data['link_address'] = $ttH->site_func->get_link_popup ('product','ordering_address');

			} else {
				$link_forget_password = $ttH->site->get_link ('user', $ttH->setting['user']['forget_pass_link']);
			
				$data['link_login_go'] = $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_address_link']);
				$data['link_address'] = $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_address_link']);
			}
			
			$data['form_signin'] = $ttH->html->temp_box(
				'form_signin', 
				array(
					'link_root' => $ttH->conf['rooturl'],
					'link_login_go' => $data['link_login_go'],
					'link_forget_password' => $link_forget_password
				)
			);
			
			$data["list_location_province"] = $ttH->site_func->list_location_province ("province_code", 'vi', ''," class=\"form-control select_location_province\" data-district='district' data-ward='ward' id='province'", array('title' => $ttH->lang['global']['select_title']));
			$data["list_location_district"] = $ttH->site_func->list_location_district ("district_code", '', ''," class=\"form-control\" data-ward='ward' id='district'", array('title' => $ttH->lang['global']['select_title']));
			$data["list_location_ward"] = $ttH->site_func->list_location_ward ("ward_code", '', ''," class=\"form-control\" id='ward'", array('title' => $ttH->lang['global']['select_title']));
			
			$data['form_signup'] = $ttH->html->temp_box(
				'form_signup', 
				array(
					'link_root' => $ttH->conf['rooturl'],
					'link_login_go' => $data['link_login_go'], 
					'list_location_province' => $data["list_location_province"], 
					'list_location_district' => $data["list_location_district"], 
					'list_location_ward' => $data["list_location_ward"]
				)
			);
			
			$data['signup_info'] = $ttH->site->get_banner('signup');
						
			$ttH->temp_act->assign('data', $data);
			$ttH->temp_act->parse("ordering_user");
			return $ttH->temp_act->text("ordering_user");
		}
	}
	
	function do_address ()
	{
		global $ttH;
		
		$arr_cart = Session::get('cart_pro', array());
		if(isset($ttH->is_popup)) {
			$link_cart = $ttH->site_func->get_link_popup ('product','cart');
			$ordering_address_link = $ttH->site_func->get_link_popup ('product','ordering_address');
			$ordering_method_link = $ttH->site_func->get_link_popup ('product','ordering_method');
		} else {
			$link_cart = $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_cart_link']);
			$ordering_address_link = $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_address_link']);
			$ordering_method_link = $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_method_link']);
		}
		
		if(!is_array($arr_cart) || !count($arr_cart) > 0) {
			$ttH->html->redirect_rel($link_cart);
		}
		
		//print_arr($ttH->data['user_cur']);
		$arr_k = array('full_name','email','phone','address');
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			$col = array();
			foreach($arr_k as $k) {				
				$col['o_'.$k] = (isset($ttH->post['o_'.$k])) ? $ttH->post['o_'.$k] : '';
				$col['d_'.$k] = (isset($ttH->post['d_'.$k])) ? $ttH->post['d_'.$k] : '';
			}
			
			$ordering_address = Session::Set('ordering_address', $col);	
			if(is_array($ordering_address)) {
				$ttH->html->redirect_rel($ordering_method_link);
			}
		}
		
		$ordering_address = Session::Get('ordering_address', array());	
		
		$data = $ttH->func->if_isset($ttH->data['user_cur']['arr_address_book'][0], array());
		foreach($arr_k as $k) {
			
			$tmp = (isset($ttH->data['user_cur'][$k])) ? $ttH->data['user_cur'][$k] : '';
			if($k == 'full_name' && empty($tmp)) {
				$tmp = (isset($ttH->data['user_cur']['nickname'])) ? $ttH->data['user_cur']['nickname'] : '';
			}
			
			if (!isset($data['o_'.$k]) || empty($data['o_'.$k])) {
				$data['o_'.$k] = $tmp;
			}
			if (!isset($data['d_'.$k]) || empty($data['d_'.$k])) {
				$data['d_'.$k] = $tmp;
			}
			
			$data['o_'.$k] = $ttH->func->if_isset($ordering_address['o_'.$k], $data['o_'.$k]);
			$data['d_'.$k] = $ttH->func->if_isset($ordering_address['d_'.$k], $data['d_'.$k]);
			
		}
		
		$data['link_action'] = $ordering_address_link;
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("ordering_address");
		return $ttH->temp_act->text("ordering_address");
	}
	
  // end class
}
?>