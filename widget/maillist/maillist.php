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

class widget_maillist
{
	var $widget = "maillist";
	var $output = '';
	var $temp = '';
	
	/**
	* function __construct ()
	* Khoi tao 
	**/
	function __construct ()
	{
		global $ttH;
		
		$ttH->func->load_language_widget($this->widget);
		
		$file_tbl = $ttH->path_html.'widget'.DS.$this->widget.".tpl";
		if(!file_exists($file_tbl)) {
			$file_tbl = $ttH->conf['rootpath'].DS."widget".DS.$this->widget.DS.$this->widget.".tpl";
		}
		$file_css = $ttH->path_css."widget".DS.$this->widget.DS.$this->widget.".css";
		if(file_exists($file_css)) {
			$ttH->func->include_css ($ttH->dir_css.'widget/'.$this->widget.'/'.$this->widget.".css");
		}

		$this->temp = new XTemplate($file_tbl);
		$this->temp->assign('CONF', $ttH->conf);
		$this->temp->assign('LANG', $ttH->lang);
		$this->temp->assign('DIR_IMAGE', $ttH->dir_images);
	}
	
	//=================main===============
	function do_main ()
	{
		global $ttH;
		
		if($this->output) {
			return $this->output;
		}

		$data = array();
		$data['form_id'] = $ttH->func->random_str(10);
	
		$this->temp->assign('data', $data);
		$this->temp->parse("main");
		$this->output = $this->temp->text("main");
		return $this->output;
	}
	
  // end class
}
?>