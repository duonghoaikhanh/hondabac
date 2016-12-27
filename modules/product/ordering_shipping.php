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
	var $action = "ordering_shipping";
	var $sub = "manage";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		die();

		$ttH->func->load_language($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS."ordering.tpl");
		$ttH->temp_act->assign('CONF', $ttH->conf);
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		$ttH->func->include_css ($ttH->dir_css.$this->modules.'/ordering.css');
		$ttH->func->include_js($ttH->dir_js.'jquery_plugins/jquery.validate.js');
		$ttH->func->include_js($ttH->dir_skin.'js/global/temp.js');
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
		$data['content'] = $ttH->site->main_search ($ttH->conf['meta_title']);
		$data['content'] .= $this->do_main();
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
		
		if($ttH->site_func->check_user_login() == 1) {
			return $this->do_address();
		} else {
			Captcha::Set();
			
			$data['link_login_go'] = $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_address_link']);
			$data['form_signin'] = $ttH->html->temp_box('form_signin', array('link_root' => $ttH->conf['rooturl'],'link_login_go' => $data['link_login_go']));
			$data['form_signup'] = $ttH->html->temp_box('form_signup', array('link_root' => $ttH->conf['rooturl'],'link_login_go' => $data['link_login_go']));
			
			$ttH->temp_act->assign('data', $data);
			$ttH->temp_act->parse("ordering_user");
			return $ttH->temp_act->text("ordering_user");
		}
	}
	
	function do_address ()
	{
		global $ttH;
		
		//print_arr($ttH->data['user_cur']);
		
		$o_address = Session::Get('o_address', array());	
		$d_address = Session::Get('d_address', array());	
		$data = array();
		$arr_k = array('full_name','email','phone','address');
		foreach($arr_k as $k) {
			
			$tmp = (isset($ttH->data['user_cur'][$k])) ? $ttH->data['user_cur'][$k] : '';
			if($k == 'full_name' && empty($tmp)) {
				$tmp = (isset($ttH->data['user_cur']['nickname'])) ? $ttH->data['user_cur']['nickname'] : '';
			}
			
			$data['o_'.$k] = (isset($o_address[$k])) ? $o_address[$k] : $tmp;
			$data['d_'.$k] = (isset($d_address[$k])) ? $d_address[$k] : $tmp;
		}
		
		$data['link_action'] = $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_shipping_link']);
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("ordering_address");
		return $ttH->temp_act->text("ordering_address");
	}
	
  // end class
}
?>