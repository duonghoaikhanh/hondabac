<?php

/*================================================================================*\
Name code : class_functions.php
Copyright © 2013 by Phan Van Lien
@version : 1.0
@date upgrade : 03/02/2013 by Phan Van Lien
\*================================================================================*/

class Site
{
	
	//-----------------box_lang
	public function box_lang ($cur){
		global $ttH;
		//$ttH->data["lang"] = array();
		
		$output = "";
		
		if(!isset($ttH->data["lang"])){
			$result = $ttH->db->query("select * from lang order by show_order desc, id asc");
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["lang"][$row["name"]] = $row;
				if($row["is_default"] == 1)
				{
					$ttH->data["lang_default"] = $row;
				}
			}
		}
		
		//$link_ext = (!empty($_SERVER['QUERY_STRING'])) ? explode('&',$_SERVER['QUERY_STRING']) : '';
		if(!array_key_exists($cur,$ttH->data['lang'])) {
			$ttH->conf['lang_cur'] = $cur = $ttH->data["lang_default"]['name'];
			$url = $ttH->conf["rooturl"];			
			$ttH->html->redirect_rel($url);
		}
		
		foreach($ttH->data['lang'] as $row) {
			$row['link'] = (isset($ttH->data['link_lang'][$row['name']])) ? $ttH->data['link_lang'][$row['name']] : '';
			$row['current'] = ($cur == $row['name']) ? ' current' : '';
			
			$ttH->temp_html->assign("row", $row);
			$ttH->temp_html->parse("box_lang.row");
		}
		
		$data = array();
		$data = $ttH->data['lang'][$cur];
		
		$ttH->temp_html->assign("LANG", $ttH->lang);
		$ttH->temp_html->assign("data", $data);
		$ttH->temp_html->parse("box_lang");
		return $ttH->temp_html->text("box_lang"); 
	}
	
	//-----------------get_link
	public function get_seo ($data = array()){
		global $ttH;
		
		if(!is_array($data) && $data) {
			$data = array(
				'meta_title' => (isset($ttH->setting[$ttH->conf['cur_mod']][$ttH->conf['cur_mod']."_meta_title"])) ? $ttH->setting[$ttH->conf['cur_mod']][$ttH->conf['cur_mod']."_meta_title"] : '',
				'meta_key' => (isset($ttH->setting[$ttH->conf['cur_mod']][$ttH->conf['cur_mod']."_meta_key"])) ? $ttH->setting[$ttH->conf['cur_mod']][$ttH->conf['cur_mod']."_meta_key"] : '',
				'meta_desc' => (isset($ttH->setting[$ttH->conf['cur_mod']][$ttH->conf['cur_mod']."_meta_desc"])) ? $ttH->setting[$ttH->conf['cur_mod']][$ttH->conf['cur_mod']."_meta_desc"] : ''
			);
		}
		
		$ttH->conf['meta_title'] = (isset($data['meta_title'])) ? $data['meta_title'] : $ttH->conf['meta_title'];
		$ttH->conf['meta_key'] = (isset($data['meta_key'])) ? $data['meta_key'] : $ttH->conf['meta_key'];
		$ttH->conf['meta_desc'] = (isset($data['meta_desc'])) ? $data['meta_desc'] : $ttH->conf['meta_desc'];
		
		$ttH->conf['canonical'] = $ttH->conf['rooturl'];
		if(isset($data['item_id'])) {
			$ttH->conf['canonical'] = $this->get_link ($ttH->conf['cur_mod'], "", $data['friendly_link']);
		} elseif(isset($data['group_id'])) {
			$ttH->conf['canonical'] = $this->get_link ($ttH->conf['cur_mod'], $data['friendly_link']);
		}
		
		return true; 
	}
	
	//-----------------get_link_lang
	public function get_link_lang ($lang='vi', $modules, $action="", $item="", $arr_ext = array()){
		global $ttH;
		
		return $ttH->site_func->get_link_lang ($lang, $modules, $action, $item, $arr_ext);
	}
	
	//-----------------get_link
	public function get_link ($modules, $action="", $item="", $arr_ext = array()){
		global $ttH;
		
		return $ttH->site_func->get_link ($modules, $action, $item, $arr_ext); 
	}
	
	//-----------------get_link_menu
	public function get_link_menu ($link, $link_type = 'site'){
		global $ttH;
		
		$arr_data = array(
			'site' => 'Nội bộ trang',
			'web' => 'Liên kết web khác',
			'mail' => 'Thư điện tử',
			'neo' => 'Neo trong trang',
		);
		
		switch ($link_type) {
			case "site":
				$link = $ttH->conf['rooturl'].$link;
				break;
			case "web":
				$link = $link;
				break;
			case "mail":
				$link = 'mailto:'.$link;
				break;
			case "neo":
				$link = '#'.$link;
				break;
		}
		
		return $link; 
	}
	
	//-----------------list_number

	function list_number ($select_name="id", $min=0, $max=10, $cur="", $ext="",$arr_more=array()){
		global $ttH;
		
		$min = (int)$min;
		$max = (int)$max;
		$max = ($max >= $min) ? $max : $min;
		
		$array = array();
		for($i=$min;$i<=$max;$i++){
			$array[$i] = $i;
		}
		
		return $ttH->html->select ($select_name, $array, $cur, $ext,$arr_more); 
	}
	
	//-----------------get_logo
	public function get_logo ($group_id='logo'){
		global $ttH;
		
		$output = '';
		
		$arr_h1 = array('home');
		
		if(isset($ttH->data["banner_group"][$group_id]) && isset($ttH->data["banner"][$group_id])){
			foreach($ttH->data["banner"][$group_id] as $banner){
				$w = $ttH->data["banner_group"][$group_id]['width'];
				$h = $ttH->data["banner_group"][$group_id]['height'];	 
				$style = "width:".$w."px;";
				$style .= ($h > 0) ? "height:".$h."px;overflow:hidden;" : "";
				
				$banner['link'] = $this->get_link_menu ($banner['link'], $banner['link_type']);
				
				if($banner['type'] == 'image'){
					//$banner['content'] = $ttH->func->get_pic_mod ($banner['content'], $w, $h, " alt=\"".$banner['title']."\"",1 ,0, array('fix_width' => 1));
					$banner['content'] = '<a href="'.$banner['link'].'" target="'.$banner['target'].'">'.$ttH->func->get_pic_mod ($banner['content'], $w, $h, " alt=\"".$banner['title']."\"",1 ,0, array('fix_width' => 1)).'</a>';
				} 
				
				if(in_array($ttH->conf['cur_mod'],$arr_h1)) {
					$banner['content'] = "<h1>".$banner['content']."<span style='display:none;'>".$banner['title']."</span></h1>";
				}
				$output = '<div style="'.$style.'">'.$banner['content'].'</div>';
				return $output; 
			}
		}
		
		return $output; 
	}
	
	//-----------------get_banner
	public function get_banner ($group_id='logo', $limit = 1){
		global $ttH;
		
		$output = '';
		
		if(isset($ttH->data["banner_group"][$group_id]) && isset($ttH->data["banner"][$group_id])){
			$i = 0;
			foreach($ttH->data["banner"][$group_id] as $banner){
				$i++;
				$w = $ttH->data["banner_group"][$group_id]['width'];
				$h = $ttH->data["banner_group"][$group_id]['height'];	 
				
				$style_pic = '';
				$style_frame = '';
				if($ttH->data["banner_group"][$group_id]['height'] == 'fixed') {
					$style_frame = "width:".$w."px;";
					$style_frame .= ($h > 0) ? "height:".$h."px;overflow:hidden;" : "";
					$style_frame = ($w > 0 || $h > 0) ? $style : '';
				} elseif($ttH->data["banner_group"][$group_id]['height'] == 'full') {
					$style_pic = "width:100%;";
				}
				
				$banner['link'] = $this->get_link_menu ($banner['link'], $banner['link_type']);
				
				if($banner['type'] == 'image'){
					//$banner['content'] = '<img src="'.$ttH->conf["rooturl"].'uploads/banner/'.$banner['content'].'" alt="'.$banner['title'].'" />';
					$banner['content'] = '<a href="'.$banner['link'].'" target="'.$banner['target'].'">'.$ttH->func->get_pic_mod ($banner['content'], $w, $h, " alt=\"".$banner['title']."\" style=\"".$style_pic."\"",1 ,0, array('fix_width' => 1)).'</a>';
				} 
				$output .= '<div class="banner_item" style="'.$style_frame.'">'.$banner['content'].'</div>';
				if($i >= $limit && $limit > 0) {
					return $output; 
				}
			}
		}
		
		return $output; 
	}
	
	//=================list_menu_sub_group===============
	function list_menu_sub_group ($temp_name, $name_action = '', $arr_cur = array(), $is_recursive = 0)
	{
		global $ttH;
		
		if(is_array($name_action)) {
			$array = $name_action;
		} else {
			$tmp = explode('-',$name_action);
			$mod = (isset($tmp[0])) ? $tmp[0] : '';
			$act = (isset($tmp[1])) ? $tmp[1] : '';
			$act_id = (isset($tmp[2])) ? $tmp[2] : 0;
			if(!$mod) {
				return '';
			}
			$ttH->load_data->data_group ($mod);
			$array = $ttH->data[$mod."_group_tree"];
			$group_act = ($act_id > 0 && isset($ttH->data[$mod."_group"][$act_id])) ? $ttH->data[$mod."_group"][$act_id] : 0;
			if($group_act){
				$arr_menu_nav = explode(',',$group_act['group_nav']);
				$str_code = '';
				$f = 0;
				foreach($arr_menu_nav as $tmp){
					$f++;
					$str_code .= ($f == 1) ? '['.$tmp.']' : '["arr_sub"]['.$tmp.']';
					if($tmp == $group_act['group_id']) {
						break;
					}
				}
				eval('$array = $array'.$str_code.';');
				if(isset($array['arr_sub'])) {
					$array = $array['arr_sub'];
				} else {
					return '';
				}
			}		
		}		
		
		$arr_cur = (isset($ttH->conf['cur_group']) && $ttH->conf['cur_group'] > 0 && isset($ttH->conf["cur_group_nav"])) ? explode(',',$ttH->conf["cur_group_nav"]) : array();
		
		$output = '';
		
		$menu_sub = '';
		$num = count($array);
		$i = 0;
		foreach($array as $row)
		{
			$i++;
			$row['link'] = $ttH->site->get_link ($ttH->conf['cur_mod'],$row['friendly_link']);
			$row['class'] = ($mod == $ttH->conf['cur_mod'] && in_array($row["group_id"],$arr_cur)) ? ' class="current"' : '';
			$arr_class_li = array();
				if($i == 1) {
					$arr_class_li[] = 'first';
				}
				if($i == $num) {
					$arr_class_li[] = 'last';
				}
				$row['class_li'] = (count($arr_class_li) > 0) ? implode(' ',$arr_class_li) : '';
			$row['menu_sub'] = '';
			if(isset($row['arr_sub'])){
				$row['menu_sub'] = $this->list_menu_sub_group ($temp_name, $row['arr_sub'], $arr_cur, 1);
			}
			$ttH->temp_html->assign('row', $row);
			$ttH->temp_html->parse($temp_name.".item.menu_sub.row");
			$menu_sub .= $ttH->temp_html->text($temp_name.".item.menu_sub.row");
			$ttH->temp_html->reset($temp_name.".item.menu_sub.row");
		}
		
		if($is_recursive == 1) {
			$ttH->temp_html->reset("menu.item.menu_sub");
			$ttH->temp_html->assign('row', array('content' => $menu_sub));
			$ttH->temp_html->parse("menu.item.menu_sub");
			$menu_sub = $ttH->temp_html->text("menu.item.menu_sub");
			$ttH->temp_html->reset("menu.item.menu_sub");
		}
		
		
		return $menu_sub;
	}
	
	//=================list_menu_sub_item===============
	function list_menu_sub_item ($temp_name, $name_action = '', $arr_cur = array())
	{
		global $ttH;
		
		if(is_array($name_action)) {
			$array = $name_action;
		} else {
			$tmp = explode('-',$name_action);
			$mod = (isset($tmp[0])) ? $tmp[0] : '';
			$act = (isset($tmp[1])) ? $tmp[1] : '';
			$act_id = (isset($tmp[2])) ? $tmp[2] : 0;
			if(!$mod) {
				return '';
			}
			$group_act = ($act_id > 0 && isset($ttH->data[$mod."_group"][$act_id])) ? $ttH->data[$mod."_group"][$act_id] : 0;
			$where = "";
			if($act_id > 0) {
				$where .= " and find_in_set('".$act_id."', group_nav)";
			}
			
			$array = $ttH->load_data->data_table (
				$mod, 
				'item_id', 
				'item_id, title, friendly_link', 
				"lang='".$ttH->conf['lang_cur']."' and is_show=1 ".$where."  order by show_order desc, date_create desc"
			);
			if(count($array) <= 0){
				return '';
			}		
		}		
		
		$arr_cur = (isset($ttH->conf['cur_item']) && $ttH->conf['cur_item'] > 0) ? array($ttH->conf['cur_item']) : array();
		
		$output = '';
		
		$menu_sub = '';
		$num = count($array);
		$i = 0;
		foreach($array as $row)
		{
			if($i > 10){
				break;
			}
			$i++;
			$row['link'] = $ttH->site->get_link ($ttH->conf['cur_mod'], '',$row['friendly_link']);
			$row['class'] = ($mod == $ttH->conf['cur_mod'] && in_array($row["item_id"],$arr_cur)) ? ' class="current"' : '';
			$arr_class_li = array();
				if($i == 1) {
					$arr_class_li[] = 'first';
				}
				if($i == $num) {
					$arr_class_li[] = 'last';
				}
				$row['class_li'] = (count($arr_class_li) > 0) ? implode(' ',$arr_class_li) : '';

			$ttH->temp_html->assign('row', $row);
			$ttH->temp_html->parse($temp_name.".item.menu_sub.row");
			$menu_sub .= $ttH->temp_html->text($temp_name.".item.menu_sub.row");
			$ttH->temp_html->reset($temp_name.".item.menu_sub.row");
		}
		
		return $menu_sub;
	}
	
	//=================select===============
	function list_menu_sub ($temp_name, $array=array(), $arr_cur = array(), $is_recursive=0)
	{
		global $ttH;
		
		$output = '';
		
		$menu_sub = '';
		$num = count($array);
		$i = 0;
		foreach($array as $row)
		{
			$i++;
			$row['link'] = $this->get_link_menu ($row['link'], $row['link_type']);
			$row['class'] = (in_array($row["menu_id"],$arr_cur)) ? ' class="current"' : '';
			$arr_class_li = array();
			if($i == 1) {
				$arr_class_li[] = 'first';
			}
			if($i == $num) {
				$arr_class_li[] = 'last';
			}
			$row['class_li'] = (count($arr_class_li) > 0) ? implode(' ',$arr_class_li) : '';
			$row['menu_sub'] = '';
			if($row['auto_sub'] == 'group'){
				$row['menu_sub'] .= $this->list_menu_sub_group ($temp_name, $row['name_action']);
			} 
			if($row['auto_sub'] == 'item'){
				$row['menu_sub'] .= $this->list_menu_sub_item ($temp_name, $row['name_action']);
			} 
			if (isset($row['arr_sub'])){
				$row['menu_sub'] .= $this->list_menu_sub ($temp_name, $row['arr_sub'], $arr_cur, 1);
			}
			
			if($row['menu_sub']) {
				$ttH->temp_html->reset($temp_name.".item.menu_sub");
				$ttH->temp_html->assign('row', array('content' => $row['menu_sub']));
				$ttH->temp_html->parse($temp_name.".item.menu_sub");
				$row['menu_sub'] = $ttH->temp_html->text("menu.item.menu_sub");
				$ttH->temp_html->reset($temp_name.".item.menu_sub");
			}
			
			$ttH->temp_html->assign('row', $row);
			$ttH->temp_html->parse($temp_name.".item.menu_sub.row");
			$menu_sub .= $ttH->temp_html->text($temp_name.".item.menu_sub.row");
			$ttH->temp_html->reset($temp_name.".item.menu_sub.row");
		}
		
		if($is_recursive == 1) {
			$ttH->temp_html->reset("menu.item.menu_sub");
			$ttH->temp_html->assign('row', array('content' => $menu_sub));
			$ttH->temp_html->parse("menu.item.menu_sub");
			$menu_sub = $ttH->temp_html->text("menu.item.menu_sub");
			$ttH->temp_html->reset("menu.item.menu_sub");
		}
		
		/*$ttH->temp_html->reset("menu.item.menu_sub");
		$ttH->temp_html->assign('row', array('content' => $menu_sub));
		$ttH->temp_html->parse("menu.item.menu_sub");
		$output = $ttH->temp_html->text("menu.item.menu_sub");
		$ttH->temp_html->reset("menu.item.menu_sub");*/
		return $menu_sub;
	}
	
	//=================list_menu===============
	function list_menu ($group_id='menu_header', $temp_name = 'menu'){
		global $ttH;
		
		$ttH->load_data->data_menu ();
		
		$arr_cur = array();
		$str_cur = '';
		
		$menu_aciton = (isset($ttH->conf['menu_action'])) ? $ttH->conf['menu_action'] : '';
		if(is_array($menu_aciton)) {
			foreach($menu_aciton as $value) {
				$arr_menu_action = (isset($ttH->data['menu_action'][$group_id][$value])) ? $ttH->data['menu_action'][$group_id][$value] : array();
				$str_cur .= (!empty($str_cur)) ? ',' : '';
				$str_cur .= (isset($arr_menu_action["menu_nav"])) ? $arr_menu_action["menu_nav"] : '';
			}
			$arr_cur = (!empty($str_cur)) ? explode(',',$str_cur) : array();
		} else {
			$arr_menu_action = (isset($ttH->data['menu_action'][$group_id][$menu_aciton])) ? $ttH->data['menu_action'][$group_id][$menu_aciton] : array();
			$arr_cur = (isset($arr_menu_action["menu_nav"])) ? explode(',',$arr_menu_action["menu_nav"]) : array();
		}
		
		$arr_cur = array_unique($arr_cur);
		
		$output = '';
		
		if(count($ttH->data["menu_tree_".$group_id]) > 0){
			$menu_sub = '';
			$menu_more_tree = array();
			
			$num = count($ttH->data["menu_tree_".$group_id]);
			$i = 0;
			foreach($ttH->data["menu_tree_".$group_id] as $row)
			{
				$i++;
				
				$row['link'] = $this->get_link_menu ($row['link'], $row['link_type']);
				$row['class'] = (isset($row['class'])) ? $row['class'] : '';
				$row['class'] = (in_array($row["menu_id"],$arr_cur)) ? 'current' : $row['class'];
				
				
				$arr_class_li = array();
				if($i == 1) {
					$arr_class_li[] = 'first';
				}
				if($i == $num) {
					$arr_class_li[] = 'last';
				}
				$row['class_li'] = (count($arr_class_li) > 0) ? implode(' ',$arr_class_li) : '';
				//$row['attr_menu_li'] = ' style="width:'.(100/$num).'%;"';
				
				$row['menu_sub'] = '';
				if($row['auto_sub'] == 'group'){
					$row['menu_sub'] .= $this->list_menu_sub_group ($temp_name, $row['name_action']);
				} 
				if($row['auto_sub'] == 'item'){
					$row['menu_sub'] .= $this->list_menu_sub_item ($temp_name, $row['name_action']);
				} 
				if (isset($row['arr_sub'])){
					$row['menu_sub'] .= $this->list_menu_sub ($temp_name, $row['arr_sub'], $arr_cur);
				}
				
				if($row['menu_sub']) {
					$ttH->temp_html->reset($temp_name.".item.menu_sub");
					$ttH->temp_html->assign('row', array('content' => $row['menu_sub']));
					$ttH->temp_html->parse($temp_name.".item.menu_sub");
					$row['menu_sub'] = $ttH->temp_html->text($temp_name.".item.menu_sub");
					$ttH->temp_html->reset($temp_name.".item.menu_sub");
				}
				
				$ttH->temp_html->assign('row', $row);
				$ttH->temp_html->parse($temp_name.".item");
			}		
			
			$ttH->temp_html->reset($temp_name);
			$ttH->temp_html->parse($temp_name);
			$output = $ttH->temp_html->text($temp_name);
		}
		
		return $output;
	}
	
	function menu_single ($group_id='menu_header', $temp_name = 'menu'){
		global $ttH;
		
		$ttH->load_data->data_menu ();
		if(!isset($ttH->data["menu"][$group_id])){
			return '';
		}
		
		$arr_cur = array();
		
		$menu_aciton = (isset($ttH->conf['menu_action'])) ? $ttH->conf['menu_action'] : '';
		if(is_array($menu_aciton)) {
			foreach($menu_aciton as $value) {
				$arr_menu_action = (isset($ttH->data['menu_action'][$group_id][$value])) ? $ttH->data['menu_action'][$group_id][$value] : array();
				$arr_tmp = (isset($arr_menu_action["menu_nav"])) ? explode(',',$arr_menu_action["menu_nav"]) : array();
				//$arr_cur = array_combine($arr_cur,$arr_cur);
				$arr_tmp = array_combine($arr_tmp,$arr_tmp);
				$arr_cur = array_merge($arr_cur,$arr_tmp);
			}
		} else {
			$arr_menu_action = (isset($ttH->data['menu_action'][$group_id][$menu_aciton])) ? $ttH->data['menu_action'][$group_id][$menu_aciton] : array();
			$arr_cur = (isset($arr_menu_action["menu_nav"])) ? explode(',',$arr_menu_action["menu_nav"]) : array();
		}
		
		$arr_cur = array_unique($arr_cur);
		
		$output = '';
		
		if(count($ttH->data["menu_tree_".$group_id]) > 0){
			$menu_sub = '';
			$num = count($ttH->data["menu_tree_".$group_id]);
			$i = 0;
			foreach($ttH->data["menu_tree_".$group_id] as $row)
			{
				$i++;
				$row['link'] = $this->get_link_menu ($row['link'], $row['link_type']);
				$row['class'] = '';
				$row['class'] = (in_array($row["menu_id"],$arr_cur)) ? 'current' : '';
				
				$arr_class_li = array();
				if($i == 1) {
					$arr_class_li[] = 'first';
				}
				if($i == $num) {
					$arr_class_li[] = 'last';
				}
				$row['class_li'] = (count($arr_class_li) > 0) ? implode(' ',$arr_class_li) : '';
				$ttH->temp_html->assign('row', $row);
				$ttH->temp_html->parse($temp_name.".item");
			}		
			
			$ttH->temp_html->reset($temp_name);
			$ttH->temp_html->parse($temp_name);
			$output = $ttH->temp_html->text($temp_name);
		}
		
		return $output;
	}
	
	//=================menu_footer_sub===============
	function menu_footer_sub ($array=array(), $arr_cur = array())
	{
		global $ttH;
		
		$output = '';
		
		$menu_sub = '';
		foreach($array as $row)
		{
			$row['link'] = $this->get_link_menu ($row['link'], $row['link_type']);
			$row['class'] = (in_array($row["menu_id"],$arr_cur)) ? 'current' : '';
			$row['menu_sub'] = '';
			/*if(isset($row['arr_sub'])){
				$row['menu_sub'] = $this->list_menu_sub ($row['arr_sub'], $arr_cur);
			}*/
			$ttH->temp_html->assign('row', $row);
			$ttH->temp_html->parse("menu_footer.item.menu_sub.row");
			$menu_sub .= $ttH->temp_html->text("menu_footer.item.menu_sub.row");
			$ttH->temp_html->reset("menu_footer.item.menu_sub.row");
		}
		
		$ttH->temp_html->reset("menu_footer.item.menu_sub");
		$ttH->temp_html->assign('row', array('content' => $menu_sub));
		$ttH->temp_html->parse("menu_footer.item.menu_sub");
		$output = $ttH->temp_html->text("menu_footer.item.menu_sub");
		$ttH->temp_html->reset("menu_footer.item.menu_sub");
		return $output;
	}
	
	function menu_footer ($group_id='menu_header'){
		global $ttH;
		
		$ttH->load_data->data_menu ();
		
		$arr_cur = array();
		
		$menu_aciton = (isset($ttH->conf['menu_action'])) ? $ttH->conf['menu_action'] : '';
		if(is_array($menu_aciton)) {
			foreach($menu_aciton as $value) {
				$arr_menu_action = (isset($ttH->data['menu_action'][$group_id][$value])) ? $ttH->data['menu_action'][$group_id][$value] : array();
				$arr_tmp = (isset($arr_menu_action["menu_nav"])) ? explode(',',$arr_menu_action["menu_nav"]) : array();
				//$arr_cur = array_combine($arr_cur,$arr_cur);
				$arr_tmp = array_combine($arr_tmp,$arr_tmp);
				$arr_cur = array_merge($arr_cur,$arr_tmp);
			}
		} else {
			$arr_menu_action = (isset($ttH->data['menu_action'][$group_id][$menu_aciton])) ? $ttH->data['menu_action'][$group_id][$menu_aciton] : array();
			$arr_cur = (isset($arr_menu_action["menu_nav"])) ? explode(',',$arr_menu_action["menu_nav"]) : array();
		}
		
		$arr_cur = array_unique($arr_cur);
		
		if(isset($ttH->data["menu"][$group_id])){
			foreach($ttH->data["menu"][$group_id] as $row){
				
				$arr_group_nav = explode(',',$row['menu_nav']);
				$str_code = '';
				$f = 0;
				foreach($arr_group_nav as $tmp){
					$f++;
					$str_code .= ($f == 1) ? '['.$tmp.']' : '["arr_sub"]['.$tmp.']';
				}
				eval('$ttH->data["menu_tree_'.$group_id.'"]'.$str_code.'["menu_id"] = $row["menu_id"];
				$ttH->data["menu_tree_'.$group_id.'"]'.$str_code.'["name_action"] = $row["name_action"];
				$ttH->data["menu_tree_'.$group_id.'"]'.$str_code.'["target"] = $row["target"];
				$ttH->data["menu_tree_'.$group_id.'"]'.$str_code.'["title"] = $row["title"];
				$ttH->data["menu_tree_'.$group_id.'"]'.$str_code.'["link_type"] = $row["link_type"];
				$ttH->data["menu_tree_'.$group_id.'"]'.$str_code.'["link"] = $row["link"];');
			}
		}
		
		$output = '';
		
		if(count($ttH->data["menu_tree_".$group_id]) > 0){
			$menu_sub = '';
			$num = count($ttH->data["menu_tree_".$group_id]);
			$i = 0;
			foreach($ttH->data["menu_tree_".$group_id] as $row)
			{
				$i++;
				$row['link'] = $this->get_link_menu ($row['link'], $row['link_type']);
				$row['class'] = '';
				$row['class'] = (in_array($row["menu_id"],$arr_cur)) ? 'current' : '';
				
				$arr_class_li = array();
				if($i == 1) {
					$arr_class_li[] = 'first';
				}
				if($i == $num) {
					$arr_class_li[] = 'last';
				}
				$row['class_li'] = (count($arr_class_li) > 0) ? implode(' ',$arr_class_li) : '';
				
				$row['menu_sub'] = '';
				if(isset($row['arr_sub'])){
					$row['menu_sub'] = $this->list_menu_sub ($row['arr_sub'], $arr_cur);
				}
				$ttH->temp_html->assign('row', $row);
				$ttH->temp_html->parse("menu_footer.item");
			}		
			
			$ttH->temp_html->reset("menu_footer");
			$ttH->temp_html->parse("menu_footer");
			$output = $ttH->temp_html->text("menu_footer");
		}
		
		return $output;
	}
	
	//======paginate	
	function paginate ($root_link, $numRows, $maxRows, $extra = "", $cPage = 1, $p = "p", $pmore = 4, $class = "pagelink")
	{
		global $ttH;
		
		$root_link = (substr($root_link,-1,1) == '/') ? substr($root_link,0,strlen($root_link)-1) : $root_link;
		
		$navigation = "";
		// get total pages
		$totalPages = ceil($numRows / $maxRows);
		$next_page = $pmore;
		$prev_page = $pmore;
		if ($cPage < $pmore) $next_page = $pmore + $pmore - $cPage;
		if ($totalPages - $cPage < $pmore) $prev_page = $pmore + $pmore - ($totalPages - $cPage);
		if ($totalPages > 1)
		{
		  //$navigation .= "<span class=\"pagetotal\">" . $totalPages . " " . $ttH->lang['global']['pages'] . "</span>";
		  // Show first page
		  if ($cPage > ($pmore + 1))
		  {
			$pLink = $root_link . "/?{$p}=1{$extra}";
			$navigation .= "<a href='" . $pLink . "' class='btnPage first'>&laquo;&laquo;</a>";
		  }
		  // End
		  // Show Prev page
		  if ($cPage > 1)
		  {
			$numpage = $cPage - 1;
			if (! empty($extra)) $pLink = $root_link . "/?{$p}=" . $numpage . "{$extra}";
			else
			  $pLink = $root_link . "/?{$p}=" . $numpage;
			$navigation .= "<a href='" . $pLink . "' class='btnPage prev'>&#8249;</a>";
		  }
		  // End	
		  // Left
		  for ($i = $prev_page; $i >= 0; $i --)
		  {
			$pagenum = $cPage - $i;
			if (($pagenum > 0) && ($pagenum < $cPage))
			{
			  $pLink = $root_link . "/?{$p}={$pagenum}{$extra}";
			  $navigation .= "<a href='" . $pLink . "' class='" . $class . "'>" . $pagenum . "</a>";
			}
		  }
		  // End	
		  // Current
		  $navigation .= "<span class=\"pagecur\">" . $cPage . "</span>";
		  // End
		  // Right
		  for ($i = 1; $i <= $next_page; $i ++)
		  {
			$pagenum = $cPage + $i;
			if (($pagenum > $cPage) && ($pagenum <= $totalPages))
			{
			  $pLink = $root_link . "/?{$p}={$pagenum}{$extra}";
			  $navigation .= "<a href='" . $pLink . "' class='" . $class . "'>" . $pagenum . "</a>";
			}
		  }
		  // End
		  // Show Next page
		  if ($cPage < $totalPages)
		  {

			$numpage = $cPage + 1;
			$pLink = $root_link . "/?{$p}=" . $numpage . "{$extra}";
			$navigation .= "<a href='" . $pLink . "' class='btnPage next'>&#8250;</a>";
		  }
		  // End		
		  // Show Last page
		  if ($cPage < ($totalPages - $pmore))
		  {
			$pLink = $root_link . "/?{$p}=" . $totalPages . "{$extra}";
			$navigation .= "<a href='" . $pLink . "' class='btnPage last' >&raquo;&raquo;</a>";
		  }
		  // End
			
			$navigation = '<div class="paginate">'.$navigation.'</div>';
			
		} // end if total pages is greater than one
		return $navigation;
	}
	
	//=================html_arr_navigation===============
	function html_arr_navigation ($arr_nav=array())
	{
		global $ttH;
		
		$output = '';
		
		$menu_sub = '';
		$i = 0;
		$num = count($arr_nav);
		if($num > 0) {
			foreach($arr_nav as $row)
			{
				$i++;
				$row['class_li'] = ($i == 1) ? ' class="first"' : '';
				$row['class'] = ($i == $num) ? ' class="current"' : '';
				$ttH->temp_box->assign('row', $row);
				$ttH->temp_box->parse("html_navigation.row");
			}
			
			$ttH->temp_box->parse("html_navigation");
			$output = $ttH->temp_box->text("html_navigation");
		}
		
		return $output;
	}
	
	//=================get_navigation===============
	function get_navigation ()
	{
		global $ttH;
		
		$arr_nav = array(
			array(
				'title' => $ttH->lang['global']['homepage'],
				'link' => $ttH->site->get_link ('home')
			)
		);
		
		$arr_group = (isset($ttH->conf['cur_group']) && ($ttH->conf['cur_group'] > 0) && isset($ttH->conf["cur_group_nav"])) ? explode(',',$ttH->conf["cur_group_nav"]) : array();
		
		foreach($arr_group as $group_id) {
			if(isset($ttH->data[$ttH->conf['cur_mod']."_group"][$group_id])) {
				$arr_nav[] = array(
					'title' => $ttH->data[$ttH->conf['cur_mod']."_group"][$group_id]['title'],
					'link' => $ttH->site->get_link ($ttH->conf['cur_mod'], $ttH->data[$ttH->conf['cur_mod']."_group"][$group_id]['friendly_link'])
				);
			}
		}
		
		if(isset($ttH->conf['cur_item']) && $ttH->conf['cur_item'] > 0) {
			$arr_nav[] = array(
				'title' => $ttH->data["cur_item"]['title'],
				'link' => $ttH->site->get_link ($ttH->conf['cur_mod'], '', $ttH->data[$ttH->conf['cur_mod']."_group"][$group_id]['friendly_link'])
			);
		}
		
		return $this->html_arr_navigation($arr_nav);
	}
	
	//=================get_banner_slide===============
	function get_banner_slide ($group_id='logo', $temp = 'main_slide'){
		global $ttH;
		
		$output = '';
		
		if(isset($ttH->data["banner_group"][$group_id]) && isset($ttH->data["banner"][$group_id])){
			foreach($ttH->data["banner"][$group_id] as $banner){
				$w = $ttH->data["banner_group"][$group_id]['width'];
				$h = $ttH->data["banner_group"][$group_id]['height'];	 
				$style = "width:".$w."px;";
				$style .= ($h > 0) ? "height:".$h."px;overflow:hidden;" : "";
				if($banner['type'] == 'image'){
					$banner['link'] = $this->get_link_menu ($banner['link'], $banner['link_type']);
					$banner['content_popup'] = $ttH->func->get_src_mod ($banner['content']);
					$banner['content'] = $ttH->func->get_pic_mod ($banner['content'], $w, $h, " alt=\"".$banner['title']."\"",1 ,1);
					
					$ttH->temp_html->assign('row', $banner);
					$ttH->temp_html->parse($temp.".row");
				} 
			}
			
			$ttH->func->include_css($ttH->dir_skin.'js/owl.carousel/owl.carousel.css');
			$ttH->func->include_css($ttH->dir_skin.'js/owl.carousel/owl.theme.css');
			$ttH->func->include_js($ttH->dir_skin.'js/owl.carousel/owl.carousel.js');		
			$ttH->temp_html->reset($temp);	
			$ttH->temp_html->parse($temp);
			$output = $ttH->temp_html->text($temp);
		}
		
		return $output; 
	}
	
	//=================get_banner_scroll===============
	function get_banner_scroll ($group_id='logo'){
		global $ttH;
		
		$output = '';
		
		if(isset($ttH->data["banner_group"][$group_id]) && isset($ttH->data["banner"][$group_id])){
			$html = '';
			$i = 0;
			foreach($ttH->data["banner"][$group_id] as $banner){
				$i++;
				$w = (isset($ttH->data["banner_group"][$group_id]['width'])) ? $ttH->data["banner_group"][$group_id]['width'] : 100;	 
				$h = (isset($ttH->data["banner_group"][$group_id]['height'])) ? $ttH->data["banner_group"][$group_id]['height'] : 100;	 
				$banner['link'] = $this->get_link_menu ($banner['link'], $banner['link_type']);
				if($banner['type'] == 'image'){
					$banner['content'] = $ttH->func->get_pic_mod ($banner['content'], $w, $h, " alt=\"".$banner['title']."\"",1 ,0, array('fix_height' => 1));
					
					$html .= '<a href="'.$banner['link'].'" target="'.$banner['target'].'">'.$banner['content'].'</a>';
				} 
			}
			if($i <= 7) {
				$html .= $html;
			}
			$output .= '<div class="banner_scroll"><div class="smooth_img">'.$html.'</div><div class="clear"></div></div>';
			
			$ttH->func->include_css($ttH->dir_js.'smooth/css/smoothDivScroll.css');
			
			$ttH->func->include_js($ttH->dir_js.'jquery_ui/jquery-ui-1.10.3.custom.min.js');
			$ttH->func->include_js($ttH->dir_js.'jquery.mousewheel.min.js');
			$ttH->func->include_js($ttH->dir_js.'smooth/js/jquery.smoothdivscroll-1.3-min.js');
			
			$ttH->func->include_js_content('
				$(document).ready(function () {
					$(".smooth_img").smoothDivScroll({
						mousewheelScrolling: "allDirections",
						manualContinuousScrolling: true
					});
		
		
					$(".smooth_img").bind("mouseover", function () {
						$(this).smoothDivScroll("stopAutoScrolling");
					});
		
					$(".smooth_img").bind("mouseout", function () {
						$(this).smoothDivScroll("startAutoScrolling");
					});
		
				});
			');
			
		}
		
		return $output; 
	}
	
	//=================news_slide===============
	function news_slide ($group_id='logo'){
		global $ttH;
		
		$output = '';
		
		if(isset($ttH->data["banner_group"][$group_id]) && isset($ttH->data["banner"][$group_id])){
			foreach($ttH->data["banner"][$group_id] as $banner){
				$w = $ttH->data["banner_group"][$group_id]['width'];
				$h = $ttH->data["banner_group"][$group_id]['height'];	 
				$style = "width:".$w."px;";
				$style .= ($h > 0) ? "height:".$h."px;overflow:hidden;" : "";
				if($banner['type'] == 'image'){
					$banner['content'] = $ttH->func->get_pic_mod ($banner['content'], $w, $h, " alt=\"".$banner['title']."\"",1 ,0, array('fix_width' => 1));
				} 
				$banner['link'] = $this->get_link_menu ($banner['link'], $banner['link_type']);
				
				$banner['style'] = $style;
				$ttH->temp_html->assign('row', $banner);
				$ttH->temp_html->parse("news_slide.row");
			}
			
			$ttH->func->include_css($ttH->dir_skin.'js/jquery.bxslider/jquery.bxslider.css');
			$ttH->func->include_js($ttH->dir_skin.'js/jquery.bxslider/jquery.bxslider.min.js');
			
			$ttH->temp_html->parse("news_slide");
			$output = $ttH->temp_html->text("news_slide");
		}
		
		return $output; 
	}
	
	//=================menu_pro_sub===============
	function menu_pro_sub ($array=array())
	{
		global $ttH;
		
		$output = '';
		$arr_cur = array();
		if($ttH->conf['cur_mod'] == 'product') {
			$arr_cur = ($ttH->conf['cur_group'] > 0 && isset($ttH->conf["cur_group_nav"])) ? explode(',',$ttH->conf["cur_group_nav"]) : array();
		}
		
		$menu_sub = '';
		$num = count($array);
		$i = 0;
		foreach($array as $row)
		{
			$i++;
			$row['link'] = $ttH->site->get_link ('product',$row['friendly_link']);
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
				$row['menu_sub'] = $this->menu_pro_sub ($row['arr_sub']);
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
	
	function menu_pro () {
		global $ttH;
		
		$arr_cur = array();
		if($ttH->conf['cur_mod'] == 'product') {
			$arr_cur = ($ttH->conf['cur_group'] > 0 && isset($ttH->conf["cur_group_nav"])) ? explode(',',$ttH->conf["cur_group_nav"]) : array();
		}
		
		$ttH->load_data->data_group ('product');
		
		$output = '';
		
		if($num = count($ttH->data["product_group_tree"]) > 0){
			$data = array(
				'title' => $ttH->lang['global']['menu_product'],
				'content' => ''
			);
			
			$menu_sub = '';
			$i = 0;
			foreach($ttH->data["product_group_tree"] as $row)
			{
				$i++;
				$row['link'] = $ttH->site->get_link ('product',$row['friendly_link']);
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
					$row['menu_sub'] = $this->menu_pro_sub ($row['arr_sub']);
				}
				$ttH->temp_box->assign('row', $row);
				$ttH->temp_box->parse("box_menu.menu_sub.row");
				$menu_sub .= $ttH->temp_box->text("box_menu.menu_sub.row");
				$ttH->temp_box->reset("box_menu.menu_sub.row");
			}		
			
			$ttH->temp_box->reset("box_menu.menu_sub");
			$ttH->temp_box->assign('data', array('content' => $menu_sub));
			$ttH->temp_box->parse("box_menu.menu_sub");
			
			$ttH->temp_box->assign('data', $data);
			$ttH->temp_box->parse("box_menu");
			$output = $ttH->temp_box->text("box_menu");
		}
		
		return $output;
	}
	
	function box_product_focus ($num_show = 1)
	{
		global $ttH;	
		
		$output = '';
		
		$output .= '<div class="share_page">
			<div class="share_page-title">'.$ttH->lang['global']['share_page'].'</div>
			<iframe src="//www.facebook.com/plugins/like.php?href='.$ttH->conf['share_link'].'&amp;width&amp;layout=button_count&amp;action=like&amp;show_faces=true&amp;share=false&amp;height=21&amp;width=90" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:21px; width:90px;" allowTransparency="true"></iframe>
			<div class="clear"></div>
		</div>';
		
		$pic_w = 84;
		$pic_h = 69;
		
		$sql = "select picture,price,price_buy,title,friendly_link 
						from product 
						where is_show=1 
						and is_focus=1 
						and lang='".$ttH->conf['lang_cur']."'
						order by show_order desc, date_update desc 
						limit 0,".$num_show;
		//echo $sql;
		$result = $ttH->db->query($sql);
		if ($num = $ttH->db->num_rows($result)) {
			$output .= '<ul class="list_none">';
			$i = 0;
			while ($row = $ttH->db->fetch_row($result)) {
				$i++;
				$row['link'] = $ttH->site->get_link('product','',$row['friendly_link']);
				$row['picture'] = $ttH->func->get_src_mod('product/'.$row['picture'], $pic_w, $pic_h,1, 0, array('fix_min' => 1));
				$class = ($i==1) ? ' class="first"' : '';
				$output .= '<li '.$class.'>
					<div class="img">
						<div class="limit bo_css" style="width:'.$pic_w.'px; height:'.$pic_h.'px;"><a href="'.$row['link'].'"><img src="'.$row['picture'].'" alt="'.$row['title'].'" title="'.$row['title'].'" /></a></div>
					</div>
					<h3><a href="'.$row['link'].'">'.$row['title'].'</a></h3>
					<div class="price_out">';
						if($row['price'] > $row['price_buy'] && $row['price_buy']>0) {
							$output .= '<div class="price">'.$ttH->func->get_price_format($row['price'],'','<u>đ</u>').'</div>';
						}
						$output .= '<div class="price_buy">'.$ttH->func->get_price_format($row['price_buy'],'','<u>đ</u>').'</div>
					</div>
					<div class="clear"></div>
				</li>';
			}
			$output .= '</ul>';
			//$output .= '<div class="view_more"><a href="'.$ttH->site->get_link('product').'"><img src="'.$ttH->dir_images.'view_more.gif" alt="Xem thêm" /></a></div>';
			
			$nd = array(
				'class_box' => 'box_product_focus',
				'title' => $ttH->lang['global']['product_focus'],
				'content' => $output
			);
			
			$output = $ttH->html->temp_box ("box_notitle", $nd);
		}
		
		return $output;
	}
	
	function box_page_focus ($num_show = 1)
	{
		global $ttH;	
		
		$output = '';
		
		$pic_w = 84;
		$pic_h = 69;
		
		$sql = "select picture,title,friendly_link 
						from page 
						where is_show=1 
						and lang='".$ttH->conf['lang_cur']."'
						and is_focus=1 
						order by show_order desc, date_update desc 
						limit 0,".$num_show;
		//echo $sql;
		$result = $ttH->db->query($sql);
		if ($num = $ttH->db->num_rows($result)) {
			$output .= '<ul class="list_none">';
			$i = 0;
			while ($row = $ttH->db->fetch_row($result)) {
				$i++;
				$row['link'] = $ttH->site->get_link('page','',$row['friendly_link']);
				$row['picture'] = $ttH->func->get_src_mod($row['picture'], $pic_w, $pic_h,1, 0, array('fix_min' => 1));
				$class = ($i==1) ? ' class="first"' : '';
				$output .= '<li '.$class.'><a href="'.$row['link'].'">'.$row['title'].'</a>		</li>';
			}
			$output .= '</ul>';
			//$output .= '<div class="view_more"><a href="'.$ttH->site->get_link('page').'"><img src="'.$ttH->dir_images.'view_more.gif" alt="Xem thêm" /></a></div>';
			
			$nd = array(
				'class_box' => 'box_page_focus',
				'title' => $ttH->lang['global']['page_focus'],
				'content' => $output
			);
			
			$output = $ttH->html->temp_box ("box", $nd);
		}
		
		return $output;
	}
	
	function box_page_footer ($num_show = 1)
	{
		global $ttH;	
		
		$output = '';
		
		$pic_w = 275;
		$pic_h = 275;
		
		$sql = "select picture,title,content,friendly_link 
						from page 
						where is_show=1 
						and lang='".$ttH->conf['lang_cur']."'
						and is_focus1=1 
						order by show_order desc, date_update desc 
						limit 0,".$num_show;
		//echo $sql;
		$result = $ttH->db->query($sql);
		if ($num = $ttH->db->num_rows($result)) {
			$output .= '<div id="footer_page_focus"><ul class="list_none">';
			$i = 0;
			while ($row = $ttH->db->fetch_row($result)) {
				$i++;
				$row['link'] = $ttH->site->get_link('page','',$row['friendly_link']);
				$row['picture'] = $ttH->func->get_src_mod($row['picture'], $pic_w, $pic_h,1, 1);
				$row['title'] = $ttH->func->short($row['title'], 40);
				$row['short'] = $ttH->func->short($row['content'], 250);
				
				$class = ($i==1) ? ' class="first"' : '';
				$output .= '<li '.$class.'>
					<a href="'.$row['link'].'">
						<div class="img">
							<img src="'.$row['picture'].'" alt="'.$row['title'].'" title="'.$row['title'].'"/>
							<h3><div class="limit"><table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0"><tr><td width="100%" height="100%">'.$row['title'].'</td></tr></table></div></h3>
						</div>
						<div class="short">'.$row['short'].'</div>
						<span class="view_detail">'.$ttH->lang['global']['view_detail'].'</span>
					</a>
				</li>';
			}
			$output .= '</ul><div class="clear"></div></div>';
		}
		
		return $output;
	}
	
	// box_support
  function box_support_old ()
  {
    global $ttH;
		
		$data = array(
			'title' => $ttH->lang['global']['support'],
			'link_support' => $ttH->conf['rooturl'].'support.php/lang='.$ttH->conf['lang_cur']
		);
		$output = $ttH->html->temp_box('box_support', $data);
		
		return $output;
  }
	
	//=================box_support===============
	function box_support ()
	{
		global $ttH;
		
		$output = '';
		
		$result = $ttH->db->query("select *   
														from support 
														where is_show=1
														order by show_order desc, date_update asc");
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				if(isset($row['yahoo']) || isset($row['skype'])) {
					$row['content'] = '';
					
					$ttH->temp_box->reset("box_support.row.yahoo");
					$ttH->temp_box->reset("box_support.row.skype");
					
					if(!empty($row['yahoo'])) {
						/*$status = @file_get_contents('http://opi.yahoo.com/online?u='.$row['yahoo'].'&m=s&t=1');
						$status = ($status == '01') ? 'on' : 'off';
						$status = 'on';*/
						
						$ttH->temp_box->assign('row', $row);
						$ttH->temp_box->parse("box_support.row.yahoo");
					}
					
					if(!empty($row['skype'])) {
						/*$status = @file_get_contents('http://mystatus.skype.com/'.$row['skype'].'.num');
						$status = (in_array($status, array(0,1,6))) ? 'off' : 'on';
						$status = 'on';*/
						
						$ttH->temp_box->assign('row', $row);
						$ttH->temp_box->parse("box_support.row.skype");
					}
					
					$ttH->temp_box->assign('row', $row);
					$ttH->temp_box->parse("box_support.row");
				}
			}
			$hotline = str_replace(',','<br />',$ttH->conf['hotline']);
			$email = str_replace(',','<br />',$ttH->conf['email']);
			
			$output = $ttH->html->temp_box("box_support", array(
					//'title' => $ttH->lang['global']['support'],
					//'hotline' => $hotline,
					'support_web' => $this->get_banner('support',0)
				));
		}
		
		return $output;
	}
	
	// box_support
  function box_statistic ()
  {
    global $ttH;
		
		$output = $ttH->html->temp_box('box_statistic', array());
		
		return $output;
  }
	
	// load_widget
  function load_widget ($name)
  {
    global $ttH;
				
		return $ttH->func->load_widget ($name);
  }
	
	// auto_sidebar
  function auto_sidebar ($pos = 'left')
  {
    global $ttH;
		
		$output = '';
		
		$data_setting = (isset($ttH->setting[$ttH->conf['cur_mod']])) ? $ttH->setting[$ttH->conf['cur_mod']] : array();
		$cur_group = (isset($ttH->conf['cur_group'])) ? $ttH->conf['cur_group'] : 0;
		$data_group = (isset($ttH->data['cur_group'])) ? $ttH->data['cur_group'] : array();
		$data_item = (isset($ttH->data['cur_item'])) ? $ttH->data['cur_item'] : array();
		if(count($data_item)) {
			$arr_group = $ttH->load_data->data_group ($ttH->conf['cur_mod']);
			if(isset($data_item['sidebar_'.$pos]) && $data_item['sidebar_'.$pos]) {
				$output .= $ttH->site_func->load_sidebar ($data_item['sidebar_'.$pos]);
			} elseif(isset($arr_group[$cur_group]['sidebar_'.$pos]) && $arr_group[$cur_group]['sidebar_'.$pos]) {
				$output .= $ttH->site_func->load_sidebar ($arr_group[$cur_group]['sidebar_'.$pos]);				
			}elseif(isset($data_setting['sidebar_item_'.$pos]) && $data_setting['sidebar_item_'.$pos]) {
				$output .= $ttH->site_func->load_sidebar ($data_setting['sidebar_item_'.$pos]);				
			}
		} elseif(count($data_group)) {
			if(isset($data_group['sidebar_'.$pos]) && $data_group['sidebar_'.$pos]) {
				$output .= $ttH->site_func->load_sidebar ($data_group['sidebar_'.$pos]);
			} elseif(isset($data_setting['sidebar_group_'.$pos]) && $data_setting['sidebar_group_'.$pos]) {
				$output .= $ttH->site_func->load_sidebar ($data_setting['sidebar_group_'.$pos]);				
			}
		} elseif(isset($data_setting['sidebar_'.$pos]) && $data_setting['sidebar_'.$pos]) {
			$output .= $ttH->site_func->load_sidebar ($data_setting['sidebar_'.$pos]);				
		} 
		
		return $output;		
  }
	
	// block_left
  function block_left ()
  {
    global $ttH;
		$output = '';
		$output .= $this->auto_sidebar ('left');
		
		return $output;
  }
	
	// block_column
  function block_column ()
  {
    global $ttH;
		
		$output = '';
		$output .= $this->box_menu_product ();
		//$output .= $this->auto_sidebar ('right');
		//$output .= $this->get_facebook ();
		//thống kê truy cập
		$online = isset($ttH->lang['global']['online']) ? $ttH->lang['global']['online'] : "";
		$total_online = isset($ttH->lang['global']['online']) ? $ttH->lang['global']['total_online'] : "";
		$output .= '<div id="tth-statistic">
                        <div class="title_static" >'. $online.': &nbsp;<span id="tth-online" style="font-weight:bold;"></span></div>


                        <div class="title_static last" >'.$total_online .':&nbsp;	<span id="tth-total" style="font-weight:bold;"></span></div>

                    </div>';
		
		return $output;
  }
	
	function box_menu_product ($num_show = 1)
	{
		global $ttH;	
		
		$output = '';
		
		$temp = 'menu_product';
		
		$pic_w = 275;
		$pic_h = 275;
		
		$sql = "select *
						from product_group 
						where is_show=1 
						and lang='".$ttH->conf['lang_cur']."'
						order by show_order desc, date_update desc ";
		//echo $sql;die();
		$result = $ttH->db->query($sql);
		if ($num = $ttH->db->num_rows($result)) {
			
			$i = 0;
			while ($row = $ttH->db->fetch_row($result)) {
				$i++;
				$row['link'] = $ttH->site->get_link('product',$row['friendly_link']);
				$row['line'] = ($i<$num) ? "<li class='line'></li>" :"";
				$row['current'] = (isset($ttH->conf['cur_group']) && ($ttH->conf['cur_group']==$row['group_id'])) ? "current" :"";
				//print_arr($ttH->conf);die();
				$ttH->temp_html->assign('row', $row);
				$ttH->temp_html->parse($temp.".row");
			}
			$data = array(
				'title'=>isset($ttH->lang['global']['product']) ? $ttH->lang['global']['product']:""
			);
			$ttH->temp_html->assign('box', $data);
			$ttH->temp_html->parse($temp);
			$output .= $ttH->temp_html->text($temp);
		}
		
		return $output;
	}
	
	//=================get_facebook===============
	function get_facebook (){
		global $ttH;
		
		$output = '';
		$share_page = isset($ttH->conf['share_page']) ? $ttH->conf['share_page'] : "";
		//print_arr($ttH->conf);die();
		$output .= '<div class="facebook">
                        <div class="share_page">
                            <div class="share_page-title">'.$share_page.'</div>
                            <iframe src="//www.facebook.com/plugins/likebox.php?href='.$ttH->conf['fanpage_facebook'].'&amp;width&amp;layout=button_count&amp;action=like&amp;show_faces=true&amp;share=false&amp;height=420px&amp;width=274px" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:420px; width:274px;" allowTransparency="true"></iframe>
                            <div class="clear"></div>
                        </div>
                    </div>';
		
		return $output; 
	}
	
	// header_user
  function header_user_old ()
  {
    global $ttH;
		
		$ttH->setting = (isset($ttH->setting)) ? $ttH->setting : array();
		if(!isset($ttH->setting['user'])){
			$ttH->setting['user'] = array();
			$result = $ttH->db->query("select * from user_setting ");
			while($row = $ttH->db->fetch_row($result)){
				$ttH->setting['user_'.$row['lang']] = $row;
				if($ttH->conf['lang_cur'] == $row['lang']) {
					$ttH->setting['user'] = $row;
				}
			}
		}
		
		$ttH->func->include_js($ttH->dir_js.'jquery_plugins/jquery.validate.js');
		$ttH->func->include_js($ttH->dir_skin.'js/global/temp.js');
		$ttH->func->include_js($ttH->dir_skin.'js/user/user.js');
		
		$data = array();
		$data['link_user'] = $ttH->site->get_link ('user');
		
		$ttH->temp_html->assign('data', $data);
		if($ttH->site_func->check_user_login () == 1){
			$row = (isset($ttH->data['user_cur'])) ? $ttH->data['user_cur'] : array();
			
			$arr_is_login = array(
				'user' => array(
					'title' => $ttH->setting["user"]["user_meta_title"],
					'link' => $ttH->site->get_link ("user")
				),
				'change_pass' => array(
					'title' => $ttH->setting["user"]["change_pass_meta_title"],
					'link' => $ttH->site->get_link ("user",$ttH->setting["user"]["change_pass_link"])
				),
				/*'ordering_link' => array(
					'title' => $ttH->setting["user"]["ordering_meta_title"],
					'link' => $ttH->site->get_link ("user",$ttH->setting["user"]["ordering_link"])
				),*/
				'signout' => array(
					'title' => $ttH->lang['global']['signout'],
					'link' => "javascript:void(0)",
					'attr_link' => "onclick=\"ttHUser.signout('')\""
				)
			);
			$row = array_merge($row, $arr_is_login);
			
			$ttH->temp_html->assign('row', $row);
			$ttH->temp_html->parse("header_user.is_login");
		} else {
			//Captcha::Set();
			$ttH->temp_html->assign('row', array(
				'header_signup' => $ttH->html->temp_box("form_signup", array(
					'link_root' => $ttH->conf['rooturl'],
					'form_id_pre' => 'header_'
				)),
				'header_signin' => $ttH->html->temp_box("form_signin", array(
					'form_id_pre' => 'header_'
				))
			));
			$ttH->temp_html->parse("header_user.not_login");
		}
		$ttH->temp_html->parse("header_user");
		return $ttH->temp_html->text("header_user");
  }
	
	
	function header_user ()
  {
    global $ttH;
		
		$ttH->setting = (isset($ttH->setting)) ? $ttH->setting : array();
		if(!isset($ttH->setting['user'])){
			$ttH->setting['user'] = array();
			$result = $ttH->db->query("select * from user_setting ");
			while($row = $ttH->db->fetch_row($result)){
				$ttH->setting['user_'.$row['lang']] = $row;
				if($ttH->conf['lang_cur'] == $row['lang']) {
					$ttH->setting['user'] = $row;
				}
			}
		}
		
		$ttH->func->include_js($ttH->dir_js.'jquery_plugins/jquery.validate.js');
		$ttH->func->include_js($ttH->dir_skin.'js/global/temp.js');
		$ttH->func->include_js($ttH->dir_skin.'js/user/user.js');
		$ttH->func->include_js($ttH->dir_skin.'js/location/location.js');
		
		$data = array();
		$data['link_user'] = $ttH->site->get_link ('user');
		//$data['link_user_signin'] = $ttH->site->get_link ('user','signin');
		//$data['link_user_signup'] = $ttH->site->get_link ('user','signup');
			//$data["link_user_signin"] = $ttH->site_func->get_link_popup ('user','signin');
			//$data["link_user_signup"] = $ttH->site_func->get_link_popup ('user','signup');
		
		$ttH->temp_html->assign('data', $data);
		if($ttH->site_func->check_user_login () == 1){
			$row = (isset($ttH->data['user_cur'])) ? $ttH->data['user_cur'] : array();
			
			$arr_is_login = array(
				'user' => array(
					'title' => $ttH->setting["user"]["user_meta_title"],
					'link' => $ttH->site->get_link ("user")
				),
				'change_pass' => array(
					'title' => $ttH->setting["user"]["change_pass_meta_title"],
					'link' => $ttH->site->get_link ("user",$ttH->setting["user"]["change_pass_link"])
				),
				/*'ordering_link' => array(
					'title' => $ttH->setting["user"]["ordering_meta_title"],
					'link' => $ttH->site->get_link ("user",$ttH->setting["user"]["ordering_link"])
				),*/
				'signout' => array(
					'title' => $ttH->lang['global']['signout'],
					'link' => "javascript:void(0)",
					'attr_link' => "onclick=\"ttHUser.signout('')\""
				)
			);
			$row = array_merge($row, $arr_is_login);
			//print_arr($row);die();
		//	print_arr($ttH->data);die();
			
			$ttH->temp_html->assign('row', $row);
			$ttH->temp_html->parse("header_user.is_login");
		} else {
			//Captcha::Set();
			
			$data["list_location_province"] = $ttH->site_func->list_location_province ("province", 'vi', ''," class=\"form-control select_location_province\" data-district='district' data-ward='ward' id='province'", array('title' => $ttH->lang['global']['province']));
		$data["list_location_district"] = $ttH->site_func->list_location_district ("district", '', ''," class=\"form-control select_location_district\" data-ward='ward' id='district'", array('title' => $ttH->lang['global']['district']));
		$data["list_location_ward"] = $ttH->site_func->list_location_ward ("ward", '', ''," class=\"form-control\" id='ward'", array('title' => $ttH->lang['global']['ward']));
		
			$ttH->temp_html->assign('row', array(
				'header_signup' => $ttH->html->temp_box("form_signup", array(
					'link_root' => $ttH->conf['rooturl'],
					'form_id_pre' => 'header_',
					'list_location_province'=>$ttH->site_func->list_location_province ("province", 'vi', ''," class=\"form-control select_location_province\" data-district='district' data-ward='ward' id='province'", array('title' => $ttH->lang['global']['province'])),
					'list_location_district'=>$ttH->site_func->list_location_district ("district", '', ''," class=\"form-control select_location_district\" data-ward='ward' id='district'", array('title' => $ttH->lang['global']['district'])),
					'list_location_ward'=>$ttH->site_func->list_location_ward ("ward", '', ''," class=\"form-control\" id='ward'", array('title' => $ttH->lang['global']['ward']))
					
				)),
				'header_signin' => $ttH->html->temp_box("form_signin", array(
					'form_id_pre' => 'header_',
					'link_forget_password'=>$link_forget_password = $ttH->site->get_link ('user', $ttH->setting['user']['forget_pass_link'])
				))
			));
			//print_arr($data);die();
			
			$ttH->temp_html->parse("header_user.not_login");
		}
		
		$ttH->temp_html->parse("header_user");
		return $ttH->temp_html->text("header_user");
  }
	
	// header_cart
  function header_cart ()
  {
    global $ttH;
		
		$ttH->setting = (isset($ttH->setting)) ? $ttH->setting : array();

		if(!isset($ttH->setting['product'])){
			$ttH->setting['product'] = array();
			$result = $ttH->db->query("select * from product_setting ");
			if($row = $ttH->db->fetch_row($result)){
				$ttH->setting['product_'.$row['lang']] = $row;
				if($ttH->conf['lang_cur'] == $row['lang']) {
					$ttH->setting['product'] = $row;
				}
			}
		}
		$data = array(
			//'link_cart' => $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_cart_link'])
			"link_cart" => $ttH->site_func->get_link_popup ('product','cart', array('item_id'=> isset($row['item_id']) ? $row['item_id']: ""))
		);
		$ttH->temp_html->assign('data', $data);
		$ttH->temp_html->parse("header_cart");
		return $ttH->temp_html->text("header_cart");
  }
	
	// header_cart
  function header_cart_old ()
  {
    global $ttH;
		
		$ttH->setting = (isset($ttH->setting)) ? $ttH->setting : array();
		if(!isset($ttH->setting['product'])){
			$ttH->setting['product'] = array();
			$result = $ttH->db->query("select * from product_setting ");
			if($row = $ttH->db->fetch_row($result)){
				$ttH->setting['product_'.$row['lang']] = $row;
				if($ttH->conf['lang_cur'] == $row['lang']) {
					$ttH->setting['product'] = $row;
				}
			}
		}
		$data = array(
			'link_cart' => $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_cart_link'])
		);
		$ttH->temp_html->assign('data', $data);
		$ttH->temp_html->parse("header_cart");
		return $ttH->temp_html->text("header_cart");
  }
	
	
	function box_search_category ()
  {
    global $ttH;
		
		$output= '';
		$sql = "select *
						from product_group
						where is_show=1 
						and lang='".$ttH->conf["lang_cur"]."' 
						order by show_order desc , date_create asc ";
		//echo $sql;die();
		$result = $ttH->db->query($sql);
		 if ($num = $ttH->db->num_rows($result)) 
		{
     	$i=0;
			while($row = $ttH->db->fetch_row($result))
			{
				$i++;
				$ttH->temp_box->assign("row", $row);
				$ttH->temp_box->parse("box_search.row");
			}
		}
		$data= array();
		$data['link_search']=$ttH->site->get_link('product');
		if(isset($ttH->post['search'])){
			if(!empty($ttH->post['search'])){
				$data['text_search']=(isset($ttH->input['text_search'])) ? $ttH->input['text_search'] : $ttH->lang['global']['search_text'];
			}
		/*	$data = array(
				'link_search' => $ttH->site->get_link('product'),
				'text_search' => (isset($ttH->input['text_search'])) ? $ttH->input['text_search'] : $ttH->lang['global']['search_text']
			);*/
			if(isset($ttH->post['slcategory'])){
				if(!empty($ttH->post['slcategory'])){
					$data['group_id'] = $ttH->post['slcategory'];
				}
				//echo $data['group_id'];die();
			}
			
		}
		//print_arr($data);die();
		$ttH->temp_html->assign("data", $data);
		$output .= $ttH->html->temp_box('box_search', $data);
		return $output;
  }
	
	// box_search
  function box_search ()
  {
    global $ttH;
		
		$data = array(
			'link_search' => $ttH->site->get_link('product'),
			'text_search' => (isset($ttH->input['text_search'])) ? $ttH->input['text_search'] : $ttH->lang['global']['search_text']
		);
		
		$output = $ttH->html->temp_box('box_search', $data);
		return $output;
  }
	
	// main_search
  function main_search ($title='')
  {
    global $ttH;
		
		$data = array(
			'title' => $title,
			'link_search' => $ttH->site->get_link('product'),
			'text_search' => (isset($ttH->input['text_search'])) ? $ttH->input['text_search'] : $ttH->lang['global']['search_text']
		);
		
		$arr_h2 = array('product_detail');
		if(in_array($ttH->conf['cur_mod'].'_'.$ttH->conf['cur_act'],$arr_h2)) {
			$output = $ttH->html->temp_box('mid_search', $data);
		} else {
			$output = $ttH->html->temp_box('main_search', $data);
		}		
		
		return $output;
  }
	
	// footer_contact
  function footer_contact ()
  {
    global $ttH;
		
		$ttH->func->include_js ('http://maps.google.com/maps/api/js?sensor=false');
		$ttH->func->include_js ($ttH->dir_js.'gomap/js/jquery.gomap-1.3.1.min.js');
		$ttH->func->include_js ($ttH->dir_js.'gomap/js/jquery.dump.js');
		$ttH->func->include_js ($ttH->dir_js.'gomap/js/jquery.chili-2.2.js');
		$ttH->func->include_js ($ttH->dir_js.'gomap/js/recipes.js');
		
		$contact_info ='';
    $result = $ttH->db->query("select c.map_id, map_type, map_latitude, map_longitude, title, short, map_information, map_picture 
																from contact_map c, contact_map_lang cl   
																where c.map_id=cl.map_id 
																and is_show=1 
																and lang='".$ttH->conf["lang_cur"]."' 
																order by show_order desc , date_create asc 
																limit 0,2");
    if ($num = $ttH->db->num_rows($result)) 
		{
     	$i=0;
			$list_markers = '';
			$list_pic = '';
			while($row = $ttH->db->fetch_row($result))
			{
				$i++;		
				$list_markers = '';
				
				switch ($row['map_type'])
				{
					case 'google_map' : 
						$list_markers .= (!empty($list_markers)) ? ',' : '';
						$list_markers .= '{ 
							latitude: "'.$row['map_latitude'].'",
							longitude: "'.$row['map_longitude'].'",
							id: "map_id_'.$row['map_id'].'", 
							html: {
								content: "'.$row['map_information'].'",
								popup: true
							}
						}';		
						break ;	
				} 
				
				if(!empty($list_markers)) {
					$row['contact_map'] = '<script language="javascript">
						$(function() {
							$("#footer_map_view_'.$row['map_id'].'").goMap({
								markers: ['.$list_markers.'],
								icon: "'.$ttH->dir_images.'icon_markers.png",
								maptype: "ROADMAP",
								zoom: 15
							});
						});
					</script>';
					
					$ttH->temp_html->assign("row", $row);
					$ttH->temp_html->parse("footer_contact.row");
				}
			}
    }				
		 
    $ttH->temp_html->parse("footer_contact");
    $nd['content'] = $ttH->temp_html->text("footer_contact");
    return $ttH->temp_html->text("footer_contact");
  }
	
	// copyright
  function copyright ()
  {
    global $ttH;
		
    $output = "";
		
		$arr_data = array(
			'vi' => '<a href="http://imsvietnamese.com" target="_blank">Thiết kế website</a>
			<a href="http://imsvietnamese.com" target="_blank">IMS</a>',
			'en' => '<a href="http://imsvietnamese.com" target="_blank" class="title">Designed by</a>
			<a href="http://imsvietnamese.com" target="_blank">IMS</a>'
		);
		
		$output = (isset($arr_data[$ttH->conf['lang_cur']])) ? $arr_data[$ttH->conf['lang_cur']] : $arr_data['vi'];
		
    return $output;
  }
	  
// end classs
}
?>