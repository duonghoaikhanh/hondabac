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
	var $action = "forget_pass";
	var $sub = "manage";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		
		$this->sign_go = (isset($ttH->get['url'])) ? $ttH->func->base64_decode($ttH->get['url']) : $ttH->site->get_link ('home');
		if($ttH->site_func->check_user_login() == 1) {
			$ttH->html->redirect_rel($this->sign_go);
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
		$data['content'] = $ttH->site->get_banner('forget-pass');
		if(isset($ttH->get['code'])) {
			$data['content'] .= $this->do_reset_pass();
		} else {
			$data['content'] .= $this->do_main();
		}
		
		//$data['box_left'] = box_left($this->action);
		//$data['box_column'] = box_column();
	
		/*$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("main");
		$ttH->output .=  $ttH->temp_act->text("main");*/
		
		$ttH->output .=  $data['content'];
	}
	
	function do_main ()
	{
		global $ttH;	
		
		$link_action = $ttH->site->get_link ($this->modules, $ttH->setting[$this->modules]["forget_pass_link"]);
		$err = '';
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			$username = trim($ttH->post['username']);
			
			if(empty($err) && empty($ttH->post['username'])) {
				$err = $ttH->html->html_alert ($ttH->lang['global']['err_invalid_username'], "error");
			}
			
			$sql = "select user_id, username, nickname, email from user  
							where is_show=1 
							and username='".$username."' 
							limit 0,1";
			//echo $sql;
			$result = $ttH->db->query($sql);
			if ($user = $ttH->db->fetch_row($result)) {
				
			} else {
				$err = $ttH->html->html_alert ($ttH->lang['global']['err_invalid_username'], "error");
			}
			
			
			if(empty($err)){
				$col = array();
				$col["user_code"] = $ttH->func->random_str (30);
				$col["pass_reset"] = $ttH->func->random_str (10);
				$ok = $ttH->db->do_update("user", $col, " user_id='".$user['user_id']."'");	
				if($ok){
					
					$link_forget_pass = $ttH->site->get_link ('user', $ttH->setting['user']['forget_pass_link']).'/?code='.$col["user_code"];
					$arr_key = array('{nickname}','[new_pass]','[link_forget_pass]');
					$arr_value = array($user['nickname'],$col["pass_reset"],'<a href="'.$link_forget_pass.'">'.$link_forget_pass.'</a>');
					
					$ttH->func->send_mail_temp ('forget-pass', $user['email'], $ttH->conf['email'], $arr_key, $arr_value);
					
					
					$link_go = $ttH->site->get_link ($this->modules, $ttH->setting[$this->modules]["signin_link"]);
					$ttH->html->alert ($ttH->lang["user"]["forget_pass_send"], $link_go);
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["global"]["err_invalid_username"], "error");	
				}
			}
		}
		
		$data = $ttH->data['user_cur'];
		$data['err'] = $err;
		$data['link_action'] = $link_action;
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("forget_pass");
		return $ttH->temp_act->text("forget_pass");
	}
	
	function do_reset_pass ()
	{
		global $ttH;	
		
		$user_code = (isset($ttH->get['code'])) ? $ttH->get['code'] : '';
		
		$sql = "select user_id, username, pass_reset, session from user  
						where is_show=1 
						and user_code='".$user_code."' 
						limit 0,1";
		//echo $sql;
		$result = $ttH->db->query($sql);
		if ($user = $ttH->db->fetch_row($result)) {
			$col = array();
			$col["password"] = $ttH->func->md25($user["pass_reset"]);
			$ok = $ttH->db->do_update("user", $col, " user_id='".$user['user_id']."'");	
			if($ok) {
				Session::Set('user_cur', array(
					'userid' => $user['user_id'],
					'username' => $user['username'],
					'password' => $col['password'],
					'session' => $user['session']
				));
				$link_go = $ttH->site->get_link ($this->modules);
				$ttH->html->redirect_rel($link_go);
			} else {
				$link_go = $ttH->site->get_link ($this->modules, $ttH->setting[$this->modules]["signin_link"]);
				$ttH->html->alert ($ttH->lang["global"]["not_found_page"], $link_go);
			}
		} else {
			$link_go = $ttH->site->get_link ($this->modules, $ttH->setting[$this->modules]["signin_link"]);
			$ttH->html->alert ($ttH->lang["global"]["not_found_page"], $link_go);
		}
	}
	
  // end class
}
?>