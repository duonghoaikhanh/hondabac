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
	var $action = "config";
	var $folder_upload = "config";
	var $dir = "";
	
  /**
   * function sMain ()
   * Khoi tao 
   **/
  function sMain ()
  {
    global $ttH;
    include ($this->modules."_func.php");
		$ttH->func->load_language_admin($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS.$this->action . ".tpl");
    $ttH->temp_act->assign('LANG', $ttH->lang);
		
		$this->dir = create_folder(date("Y_m"));
		
		$this->link_act = "?mod=".$this->modules."&act=".$this->action;
		
		$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->modules];
		
		$data["page_title"] = $ttH->conf["page_title"];
		$data["main"] = $this->do_edit();
		
		$ttH->temp_act->assign('data', $data);
    $ttH->temp_act->parse("main");
    $ttH->output .=  $ttH->temp_act->text("main");
  }
	
	//-----------
	function do_edit()
	{
		global $ttH;
		
		$err = "";
		
		$arr_editor = array();
		$arr_checkbox = array('is_under_construction');
		
		$result = $ttH->db->query("select * from config where id=1 ");
		$data = $ttH->db->fetch_row($result) ;
		if (isset($ttH->post['do_submit'])) {
      $dup = array();
			foreach ($data as $key => $value) 
			{
				if ($key != 'id' && isset($ttH->input[$key])) {
					//$dup[$key] = $ttH->input[$key];
					if(in_array($key,$arr_editor)) {
						$dup[$key] = $ttH->func->input_editor ($ttH->post[$key]);
					} else {
						$dup[$key] = $ttH->post[$key];
					}		
				} elseif($key != 'id' && in_array($key,$arr_checkbox)) {
					$dup[$key] = (isset($ttH->post[$key])) ? $ttH->post[$key] : 0;
				} 
			}
			$ok = $ttH->db->do_update("config", $dup, "id=1");	
			if($ok)
			{
				$data = $dup;
				$mess = $ttH->lang["global"]["edit_success"];
				$err = $ttH->html->html_alert ($mess, "success");
			}
		}
		
		$data["err"] = $err;
		$data["link_action"] = $this->link_act;
		$data["list_skin"] = list_skin ("skin", $data["skin"], "class='form-control'");
		$data["list_method_email"] = $this->list_method_email ("method_email", $data["method_email"], "class='form-control'");
		foreach($arr_editor as $k) {
			$data["html_".$k] = $ttH->editor->load_editor ($k, $k, $data[$k], "", "full", array("folder_up" => $this->folder_upload, "fldr" => $this->dir));
		}
		foreach($arr_checkbox as $k) {
			$data["checked_".$k] = (isset($data[$k]) && $data[$k]) ? ' checked="checked"' : '';
		}
		
		$ttH->temp_act->assign('data', $data);
    $ttH->temp_act->parse("edit");
    return $ttH->temp_act->text("edit");
	}
	
	//=================list_method_email===============
	function list_method_email ($select_name="method_email", $cur = "", $ext="")
	{
		global $ttH;
		
		$arr_view = array(
			"smtp" => "SMTP",
			"gmail" => "GMAIL",
			"mail" => "MAIL"
		);
		
		$text = "<select size=1 name=\"".$select_name."\" id=\"".$select_name."\" ".$ext.">";
		foreach($arr_view as $key => $value)
		{
			$selected = ($key == $cur) ? " selected='selected'" : "";
			$text .= "<option value=\"".$key ."\" ".$selected."> " . $value . " </option>";
		}
		$text .= "</select>";
		
		return $text;
	}

  // end class
}
?>