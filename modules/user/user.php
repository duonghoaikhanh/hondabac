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
	var $action = "user";
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
		$data['content'] = $this->do_welcome();
		$data['box_left'] = box_left($this->action);
		//$data['box_column'] = box_column();
	
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("main");
		$ttH->output .=  $ttH->temp_act->text("main");
	}
	
	function do_welcome ()
	{
		global $ttH;	
		
		$link_action = $ttH->site->get_link ($this->modules);
		$err = '';
		
		$data = array(
			'content' => $ttH->func->input_editor_decode($ttH->setting[$this->modules]["welcome"])
		);
		$data['content'] = str_replace(
			array('{nickname}'),
			array($ttH->data['user_cur']['nickname']),
			$data['content']
		);
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("welcome");
		return $ttH->temp_act->text("welcome");
	}
	
	function do_main ()
	{
		global $ttH;	
		
		$link_action = $ttH->site->get_link ($this->modules);
		$err = '';
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			if(empty($err)){
				$col = array();
				$col["first_name"] = $ttH->post["first_name"];
				$col["last_name"] = $ttH->post["last_name"];
				$col['nickname'] = trim($col['first_name'].' '.$col['last_name']);
				$col["phone"] = $ttH->post["phone"];
				$col["fax"] = $ttH->post["fax"];
				$col["mobile"] = $ttH->post["mobile"];
				$col["address"] = $ttH->post["address"];
				$col["date_update"] = time();
				$ok = $ttH->db->do_update("user", $col, " user_id='".$ttH->data['user_cur']['user_id']."'");	
				if($ok){					
					$err = $ttH->html->html_alert ($ttH->lang["user"]["edit_success"], "success");
					 $ttH->html->redirect_rel($link_action);
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["user"]["edit_false"], "error");	
				}
			}
		}
		
		$data = $ttH->data['user_cur'];
		$data['err'] = $err;
		$data['link_action'] = $link_action;
		$data['link_change_pass'] = $ttH->site->get_link ($this->modules, $ttH->setting[$this->modules]["change_pass_link"]);
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("profile");
		return $ttH->temp_act->text("profile");
	}
	
  // end class
}
?>