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

class widget_support_info
{
	var $widget = "support_info";
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
		
		$tmp = explode(',',$ttH->conf['hotline_support']);
		foreach($tmp as $hotline) {
			$hotline= trim($hotline);
			if($hotline) {
				$this->temp->assign('row', array(
					'value' => $hotline,
					'class_li' => (substr($hotline,0,1) == '(') ? 'phone' : 'mobile'
				));
				$this->temp->parse("main.li");
			}
		}
		
		if($ttH->conf['fanpage_facebook']) {
			$this->temp->assign('row', array(
				'share_title' => $ttH->conf['share_title'],
				'link' => $ttH->conf['fanpage_facebook']
			));
			$this->temp->parse("main.link");
		}

		$this->temp->parse("main");
		$this->output = $ttH->html->temp_box('box', array(
			'class_box' => 'box_support_info',
			'title' => $ttH->lang['widget_support_info']['widget_title'],
			'content' => $this->temp->text("main")
		));
		return $this->output;
	}
	
  // end class
}
?>