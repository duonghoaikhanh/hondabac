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
	var $action = "logout";
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
		$this->do_logout ();
		exit;
  }

 /**
   * function do_logout() 
   **/	 
	function do_logout ()
	{
		global $ttH;
		
		$data = array();
		
		if(isset($_SESSION[$ttH->conf["admin_ses"]]["userid"])){
			$upd = array();
			$upd["session"] = md5(rand(1000,7000));
			$ok = $ttH->db->do_update("admin", $upd, " id='".$_SESSION[$ttH->conf["admin_ses"]]["userid"]."'");	
			
			$url = $ttH->conf['rooturl'].'admin/?mod=admin&act=login';
			$url .= (isset($ttH->get['url'])) ? '&url='.$ttH->get['url'] : '';
			
			$ttH->html->redirect_rel ($url);
		}
		
		return '';		
 	}

  // end class
}
?>