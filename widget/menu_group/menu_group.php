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

class widget_menu_group
{
	var $widget = "menu_group";
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
		$data['content'] = $this->box_menu();
	
		$this->temp->reset("main");
		$this->temp->assign('data', $data);
		$this->temp->parse("main");
		$this->output = $this->temp->text("main");
		return $this->output;
	}
	
	//=================box_menu_sub===============
	function box_menu_sub ($array=array())
	{
		global $ttH;

		$output = '';
		$arr_cur = ($ttH->conf['cur_group'] > 0 && isset($ttH->conf["cur_group_nav"])) ? explode(',',$ttH->conf["cur_group_nav"]) : array();
		
		$menu_sub = '';
		$num = count($array);
		$i = 0;
		foreach($array as $row)
		{
			$i++;
			$row['link'] = $ttH->site->get_link ($ttH->conf['cur_mod'],$row['friendly_link']);
			$class_li = array();
			if($i == 1) {
				$class_li[] = 'first';
			}
			if($i == $num) {
				$class_li[] = 'last';
			}
			$row['class_li'] = (count($class_li) > 0) ? ' class="'.implode(' ',$class_li).'"' : '';
			$row['class'] = (in_array($row["group_id"],$arr_cur)) ? ' class="current"' : '';
			$row['menu_sub'] = '';
			if(isset($row['arr_sub'])){
				$row['menu_sub'] = $this->box_menu_sub ($row['arr_sub']);
			}
			$ttH->temp_box->assign('row', $row);
			$ttH->temp_box->parse("box_menu.menu_sub.row");
			$menu_sub .= $ttH->temp_box->text("box_menu.menu_sub.row");
			$ttH->temp_box->reset("box_menu.menu_sub.row");
		}
		
		$ttH->temp_box->reset("box_menu.menu_sub");
		$ttH->temp_box->assign('data', array('content' => $menu_sub));
		$ttH->temp_box->parse("box_menu.menu_sub");
		return $ttH->temp_box->text("box_menu.menu_sub");
	}
	
	//=================box_menu===============
	function box_menu () {
		global $ttH;
		
		$arr_cur = (isset($ttH->conf['cur_group']) && $ttH->conf['cur_group'] > 0 && isset($ttH->conf["cur_group_nav"])) ? explode(',',$ttH->conf["cur_group_nav"]) : array();

		$ttH->load_data->data_group ($ttH->conf['cur_mod']);
		
		$output = '';
		if(($num = count($ttH->data[$ttH->conf['cur_mod']."_group_tree"])) > 0){
			$data = array(
				'title' => (isset($ttH->lang['widget_menu_group']['menu_'.$ttH->conf['cur_mod']]) ? $ttH->lang['widget_menu_group']['menu_'.$ttH->conf['cur_mod']] : $ttH->lang['widget_menu_group']['widget_title']),
				'content' => ''
			);
			//echo $data['title'];die();
			$menu_sub = '';
			$i = 0;
			//echo $ttH->conf['cur_mod'];die();
			//$row=$ttH->data[$ttH->conf['cur_mod']."_group_tree"];
			//print_arr($row);die();
			
			foreach($ttH->data[$ttH->conf['cur_mod']."_group_tree"] as $row)
			{
				$i++;
				if($row['is_focus']==1){
					//print_arr($row);die();
					$row['link'] = $ttH->site->get_link ($ttH->conf['cur_mod'],$row['friendly_link']);
					$class_li = array();
					$class_li[] = 'menu_li';
					if($i == 1) {
						$class_li[] = 'first';
					}
					if($i == $num) {
						$class_li[] = 'last';
					}
					$row['class_li'] = (count($class_li) > 0) ? ' class="'.implode(' ',$class_li).'"' : '';
					
					$row['class'] = (in_array($row["group_id"],$arr_cur)) ? 'current' : '';
					$row['class'] = ' class="menu_link '.$row['class'].'"';
					$row['menu_sub'] = '';
					if(isset($row['arr_sub'])){
						$row['menu_sub'] = $this->box_menu_sub ($row['arr_sub']);
					}
					$ttH->temp_box->assign('row', $row);
					$ttH->temp_box->parse("box_menu.menu_sub.row");
					$menu_sub .= $ttH->temp_box->text("box_menu.menu_sub.row");
					$ttH->temp_box->reset("box_menu.menu_sub.row");
				}
			}		
			
			$ttH->temp_box->reset("box_menu.menu_sub");
			$ttH->temp_box->assign('data', array('content' => $menu_sub));
			$ttH->temp_box->parse("box_menu.menu_sub");
			
			$ttH->temp_box->reset("box_menu");
			$ttH->temp_box->assign('data', $data);
			$ttH->temp_box->parse("box_menu");
			$output = $ttH->temp_box->text("box_menu");
		}
		
		return $output;
	}
	
  // end class
}
?>