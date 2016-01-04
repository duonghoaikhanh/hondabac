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
	var $modules = "admin";
	var $action = "login";
	var $sub = "manage";
	
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
		$ttH->temp_act->assign('DIR_CSS', $ttH->dir_css);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		flush();
		echo $this->do_login ();
		exit;
  }

 /**
   * function form_Search() 
   **/	 
	function do_login ()
	{
		global $ttH;
		
		$data = array();
		
		$data['link_action'] =  $ttH->conf['rooturl'].'admin/?mod=admin&act=login';
		$data['link_action'] .= (isset($ttH->get['url'])) ? '&url='.$ttH->get['url'] : '';
		
		if (isset($ttH->post['do_submit'])) 
		{
			$username = $ttH->post["username"];
			$password = $ttH->func->md25($ttH->post["password"]);
			$query = "select * from admin where username='".$username."' and password='".$password."'";
			$result = $ttH->db->query($query);
			if ($row = $ttH->db->fetch_row($result)) {
				$date_login = time();
				$_SESSION[$ttH->conf["admin_ses"]]["userid"] = $row["id"];
				$_SESSION[$ttH->conf["admin_ses"]]["username"] = $row["username"];
				$_SESSION[$ttH->conf["admin_ses"]]["password"] = $row["password"];
				$_SESSION[$ttH->conf["admin_ses"]]["session"] = $row["session"]; //Muti login
				//$_SESSION[$ttH->conf["admin_ses"]]["session"] = md5($row["username"].$date_login); //One login
				
				
				$upd = array();
				$upd["session"] = $_SESSION[$ttH->conf["admin_ses"]]["session"];
				$upd["date_login"] = $date_login;
				$ok = $ttH->db->do_update("admin", $upd, " id='".$row["id"]."'");	
				
				$url = $ttH->conf['rooturl'].'admin';
				$url .= (isset($ttH->get['url'])) ? '/?'.$ttH->func->base64_decode($ttH->get['url']) : '';
				
				$ttH->html->redirect_rel ($url);
				//$ttH->DB->debug();
			}
		}
		
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("main");
		return $ttH->temp_act->text("main");		
 	}

  // end class
}
?>