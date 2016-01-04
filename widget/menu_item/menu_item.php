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

class widget_menu_item
{
	var $widget = "menu_item";
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
	
	//=================box_menu===============
	function box_menu () {
		global $ttH;
		
		$cur_group = ($ttH->conf['cur_group'] > 0) ? $ttH->conf['cur_group'] : 0;
		$arr_cur = (isset($ttH->conf['cur_item']) && $ttH->conf['cur_item'] > 0) ? array($ttH->conf['cur_item']) : array();
		$group_data = $ttH->load_data->data_group ($ttH->conf['cur_mod']);
		$table_data = $ttH->load_data->data_table (
			$ttH->conf['cur_mod'].' t,'.$ttH->conf['cur_mod'].'_lang tl', 
			'item_id', 
			't.item_id, title, friendly_link, skin', 
			"t.item_id=tl.item_id and lang='".$ttH->conf['lang_cur']."' and is_show=1 and find_in_set('".$cur_group."', group_nav)
			
			 order by show_order desc, date_create desc
			limit 0,5"
		);
		
		$output = '';
		if(($num = count($table_data)) > 0){
			$data = array(
				'title' => (isset($ttH->lang['widget_menu_item']['menu_'.$ttH->conf['cur_mod']]) ? $ttH->lang['widget_menu_item']['menu_'.$ttH->conf['cur_mod']] : $ttH->lang['widget_menu_item']['widget_title']),
				'content' => ''
			);
			$data['title'] = (isset($group_data[$cur_group]['title'])) ? $group_data[$cur_group]['title'] : $data['title'];
			
			$menu_sub = '';
			$i = 0;
			foreach($table_data as $row)
			{
				$i++;
				$row['link'] = $ttH->site->get_link ($ttH->conf['cur_mod'], '',$row['friendly_link']);
				if($row['skin']==1){
				$row['target']='target="_blank"';;	
				}
				$class_li = array();
				$class_li[] = 'menu_li';
				if($i == 1) {
					$class_li[] = 'first';
				}
				if($i == $num) {
					$class_li[] = 'last';
				}
				$row['class_li'] = (count($class_li) > 0) ? ' class="'.implode(' ',$class_li).'"' : '';
				
				$row['class'] = (in_array($row["item_id"],$arr_cur)) ? 'current' : '';
				$row['class'] = ' class="menu_link '.$row['class'].'"';

				$ttH->temp_box->assign('row', $row);
				$ttH->temp_box->parse("box_menu.menu_sub.row");
				$menu_sub .= $ttH->temp_box->text("box_menu.menu_sub.row");
				$ttH->temp_box->reset("box_menu.menu_sub.row");
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