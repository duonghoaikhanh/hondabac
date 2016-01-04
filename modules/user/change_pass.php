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
	var $action = "change_pass";
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
		
		$link_action = $ttH->site->get_link ($this->modules, $ttH->setting[$this->modules]["change_pass_link"]);
		$err = '';
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			$password_cur = $ttH->func->md25($ttH->post['password_cur']);
			$password = $ttH->func->md25($ttH->post['password']);
			$re_password = $ttH->func->md25($ttH->post['re_password']);
			
			if(empty($err) && $password_cur != $ttH->data['user_cur']['password']) {
				$err = $ttH->html->html_alert ($ttH->lang['global']['err_invalid_password_cur'], "error");
			}
			if(empty($err) && empty($ttH->post['password'])) {
				$err = $ttH->html->html_alert ($ttH->lang['global']['err_invalid_password'], "error");
			}
			if(empty($err) && $password != $re_password) {
				$err = $ttH->html->html_alert ($ttH->lang['global']['err_invalid_re_password'], "error");
			}
			
			if(empty($err)){
				$col = array();
				$col["password"] = $password;
				$col["date_update"] = time();
				$ok = $ttH->db->do_update("user", $col, " user_id='".$ttH->data['user_cur']['user_id']."'");	
				if($ok){
					
					$user_cur = Session::get('user_cur');
					$user_cur['password'] = $password;
					
					$user_cur = Session::Set('user_cur', $user_cur);
					
					$err = $ttH->html->html_alert ($ttH->lang["user"]["edit_success"], "success");
					//$ttH->html->redirect_rel($link_action);
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["user"]["edit_false"], "error");	
				}
			}
		}
		
		$data = $ttH->data['user_cur'];
		$data['err'] = $err;
		$data['link_action'] = $link_action;
		$data['content'] = $ttH->site->get_banner('change-pass', 1);
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("change_pass");
		return $ttH->temp_act->text("change_pass");
	}
	
  // end class
}
?>