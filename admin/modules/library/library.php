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
	var $modules = "library";
	var $action = "library";
	var $sub = "manage";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		$ttH->dir_mod = "modules/".$this->modules."/";
		
		$ttH->func->load_language_admin($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS.$this->action.".tpl");
		$ttH->temp_act->assign('LANG', $ttH->conf["lang_cur"]);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		include ($this->modules."_func.php");
		$this->link_act = "?mod=".$this->modules."&act=".$this->action;
		
		$data["link_manage"] = $this->link_act;
		$data["link_add"] = $this->link_act."&sub=add";
		
		$this->sub = (isset($ttH->input["sub"])) ? $ttH->input["sub"] : "manage";
		switch ($this->sub) {
			case "upload":
				$this->do_upload();
				break;
			case "uploader":
				$this->do_uploader();
				break;
			case "execute":
				$this->do_execute();
				break;
			case "force_download":
				$this->do_force_download();
				break;
			case "ajax_calls":
				$this->do_ajax_calls();
				break;
			case "popup_library":
				$this->do_popup_library();
				break;
			case "manage_library":
				$this->do_manage_library();
				break;
			default:
				$this->sub = "manage";
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->modules."_manage"];
				$data["main"] = $this->do_manage();
				break;
		}
		$data["class"] = array();
		$data["class"][$this->sub] = ' class="active"';
		$data["page_title"] = $ttH->conf["page_title"];
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("main");
		$ttH->output .=  $ttH->temp_act->text("main");
	}
	
	function do_upload()
	{
		global $ttH;
		
		flush();
		$ttH->conf["folder_up"] = (isset($ttH->get["folder_up"])) ? $ttH->get["folder_up"] : "";
		include('config/config.php');
		if($_SESSION["verify"] != "RESPONSIVEfilemanager") die('forbiden');
		include('include/utils.php');
		
		include('upload.php');
		
		exit;
	}
	
	function do_uploader()
	{
		global $ttH;
		
		flush();
		$ttH->conf["folder_up"] = (isset($ttH->get["folder_up"])) ? $ttH->get["folder_up"] : "";
		include('uploader/jupload.php');
		
		exit;
	}
	
	function do_execute()
	{
		global $ttH;
		
		flush();
		$ttH->conf["folder_up"] = (isset($ttH->get["folder_up"])) ? $ttH->get["folder_up"] : "";
		include('config/config.php');
		if($_SESSION["verify"] != "RESPONSIVEfilemanager") die('forbiden');
		include('include/utils.php');
		
		include('execute.php');
		
		exit;
	}
	
	function do_force_download()
	{
		global $ttH;
		
		flush();
		//$ttH->conf["folder_up"] = (isset($ttH->get["folder_up"])) ? $ttH->get["folder_up"] : "";
		include('config/config.php');
		if($_SESSION["verify"] != "RESPONSIVEfilemanager") die('forbiden');
		include('include/utils.php');
		include('force_download.php');
		exit;
	}
	
	function do_ajax_calls()
	{
		global $ttH;
		
		flush();
		$ttH->conf["folder_up"] = (isset($ttH->get["folder_up"])) ? $ttH->get["folder_up"] : "";
		include('config/config.php');
		if($_SESSION["verify"] != "RESPONSIVEfilemanager") die('forbiden');
		include('include/utils.php');
		
		include('ajax_calls.php');
		
		exit;
	}
	
	//-----------
	function do_popup_library()
	{
		global $ttH;
		
		flush();
		
		$ttH->conf["folder_up"] = (isset($ttH->get["folder_up"])) ? $ttH->get["folder_up"] : "";
		include('config/config.php');
		
		include('popup_library.php');
		
		exit;
	}
	
	//-----------
	function do_manage_library()
	{
		global $ttH;
		
		flush();
		
		$ttH->conf["folder_up"] = (isset($ttH->get["folder_up"])) ? $ttH->get["folder_up"] : "";
		include('config/config.php');
		
		include('manage_library.php');
		
		exit;
	}
	
	//-----------
	function do_manage()
	{
		global $ttH;
		
		$data = array();
		$data["link_iframe"] = $this->link_act."&sub=manage_library";
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("manage");
		return $ttH->temp_act->text("manage");
	}

  // end class
}
?>