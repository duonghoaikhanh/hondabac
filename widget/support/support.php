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

class widget_support
{
	var $widget = "support";
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
		
		$result = $ttH->db->query("select *   
														from support 
														where is_show=1
														order by show_order desc, date_update asc");
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$row['arr_title'] = unserialize($row['arr_title']);
				$row['title'] = $row['arr_title'][$ttH->conf['lang_cur']];
				if(isset($row['yahoo']) || isset($row['skype'])) {
					$row['content'] = '';
					
					$this->temp->reset("main.row.yahoo");
					$this->temp->reset("main.row.skype");
					
					if(!empty($row['yahoo'])) {
						/*$status = @file_get_contents('http://opi.yahoo.com/online?u='.$row['yahoo'].'&m=s&t=1');
						$status = ($status == '01') ? 'on' : 'off';
						$status = 'on';*/
						
						$this->temp->assign('row', $row);
						$this->temp->parse("main.row.yahoo");
					}
					
					if(!empty($row['skype'])) {
						/*$status = @file_get_contents('http://mystatus.skype.com/'.$row['skype'].'.num');
						$status = (in_array($status, array(0,1,6))) ? 'off' : 'on';
						$status = 'on';*/

						$this->temp->assign('row', $row);
						$this->temp->parse("main.row.skype");
					}
					
					$this->temp->assign('row', $row);
					$this->temp->parse("main.row");
				}
			}
			$this->temp->parse("main");
			$this->output = $ttH->html->temp_box('box', array(
				'class_box' => 'box_support',
				'title' => $ttH->lang['widget_support']['widget_title'],
				'content' => $this->temp->text("main")
			));
		}
		
		return $this->output;
	}
	
  // end class
}
?>