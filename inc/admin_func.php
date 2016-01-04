<?php

/*================================================================================*\
Name code : class_functions.php
Copyright © 2013 by Phan Van Lien
@version : 1.0
@date upgrade : 03/02/2013 by Phan Van Lien
\*================================================================================*/

class Admin
{
	function Admin (){
		global $ttH;
		
		$this->check_admin_login ();
		
		$ttH->conf['cur_mod'] = (isset($ttH->input["mod"])) ? $ttH->input["mod"] : "config";
		$ttH->conf['cur_act'] = (isset($ttH->input["act"])) ? $ttH->input["act"] : "config";
		
		//powers
		/*$ttH->arr_powers = array(
			'about' => array(
				'about' => array('add','manage')
			),
			'page' => array(
				'group' => array('add','manage'),
				'page' => array('add','manage')
			)
		);*/
		
		$this->get_admin_powers ();
		if(!is_array($ttH->arr_powers) && $ttH->arr_powers == 'full_powers') {
			return true;
		}
		if(
			$ttH->conf['cur_mod'] == "admin" 
			&& (
				$ttH->conf['cur_act'] == "login" 
				|| $ttH->conf['cur_act'] == "logout"
			)
		) {
			return true;
		}
		
		//print_arr($ttH->arr_powers);die();
		
		if(isset($ttH->arr_powers[$ttH->conf['cur_mod']][$ttH->conf['cur_act']])) {
			if(isset($ttH->input["sub"])) {
				if(!in_array($ttH->input["sub"], $ttH->arr_powers[$ttH->conf['cur_mod']][$ttH->conf['cur_act']])) {
					$ttH->conf['cur_mod'] = "alert";
					$ttH->conf['cur_act'] = "access_denied";
				}
			}
			if(isset($ttH->input["do_action"])) {
				$action = substr($ttH->input["do_action"],3);
				if(!in_array($action, $ttH->arr_powers[$ttH->conf['cur_mod']][$ttH->conf['cur_act']])) {
					$ttH->conf['cur_mod'] = "alert";
					$ttH->conf['cur_act'] = "access_denied";
				}
			}
		} else {
			$ttH->conf['cur_mod'] = "alert";
			$ttH->conf['cur_act'] = "access_denied";
		}
		//End
	}
	
	//-----------------load_config
	function box_lang ($cur){
		global $ttH;
		//$ttH->data["lang"] = array();
		
		$output = "";
		
		if(!isset($ttH->data["lang"])){
			$result = $ttH->db->query("select * from lang");
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["lang"][$row["name"]] = $row;
				if($row["is_default"] == 1)
				{
					$ttH->data["lang_default"] = $row;
				}
			}
		}
		
		
		$arr_link_ext = (!empty($_SERVER['QUERY_STRING'])) ? explode('&',$_SERVER['QUERY_STRING']) : array();
		$key_lang = array_search('lang='.$cur,$arr_link_ext);
		$key_lang = (!empty($key_lang)) ? $key_lang : count($arr_link_ext);
		if(!array_key_exists($cur,$ttH->data['lang'])) {
			$ttH->conf['lang_cur'] = $cur = $ttH->data["lang_default"]['name'];
			$arr_link_ext[$key_lang] = 'lang='.$cur;
			$url = $this->create_link_arr ($ttH->conf["rooturl"].'admin', $arr_link_ext);			
			$ttH->html->redirect_rel($url);
		}
		//$ttH->conf['lang_cur'] = $cur = (in_array($cur,$ttH->data['lang'])) ? $cur : $ttH->data["lang_default"]['name'];
		
		foreach($ttH->data['lang'] as $row) {
			$arr_link_ext[$key_lang] = 'lang='.$row['name'];
			$row['link'] = $this->create_link_arr ($ttH->conf["rooturl"].'admin', $arr_link_ext);
			
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
	
	//-----------------create_link_arr
	function create_link_arr ($link_root, $arr_link = array(), $first='/?'){
		global $ttH;
		
		$link_out = $link_root;
		$link_ext = @implode('&',$arr_link);
		$link_out .= (!empty($link_ext)) ? $first.$link_ext : '';
		
		return $link_out; 
	}
	
	//-----------------get_link_admin
	function get_link_admin ($modules, $action, $sub="manage", $arr_ext = array()){
		global $ttH;
		
		$link_out = $ttH->conf['rooturl']."admin/?mod=".$modules."&act=".$action."&sub=".$sub;
		if(!array_key_exists('lang', $arr_ext)) {
			$link_out .= "&lang=".$ttH->conf["lang_cur"];
		}
		
		foreach($arr_ext as $k => $v){
			$link_out .= "&".$k."=".$v;
		}
		
		return $link_out; 
	}
	
	//-----------------get_link_admin_ajax
	function get_link_admin_ajax ($modules, $action, $sub="mamage", $arr_ext = array()){
		global $ttH;
		
		//$link_out = $ttH->conf['rooturl']."admin/popup.php?mod=".$modules."&act=".$action."&sub=".$sub;
		$link_out = $ttH->conf['rooturl']."admin/ajax.php?m=".$modules."&f=".$sub;
		if(!array_key_exists('lang', $arr_ext)) {
			$link_out .= "&lang=".$ttH->conf["lang_cur"];
		}
		
		foreach($arr_ext as $k => $v){
			$link_out .= "&".$k."=".$v;
		}
		
		return $link_out; 
	}
	
	//-----------------get_link_admin_popup
	function get_link_admin_popup ($modules, $action, $sub="mamage", $arr_ext = array()){
		global $ttH;
		
		//$link_out = $ttH->conf['rooturl']."admin/popup.php?mod=".$modules."&act=".$action."&sub=".$sub;
		$link_out = $ttH->conf['rooturl']."admin/popup.php?m=".$modules."&f=".$sub;
		if(!array_key_exists('lang', $arr_ext)) {
			$link_out .= "&lang=".$ttH->conf["lang_cur"];
		}
		
		foreach($arr_ext as $k => $v){
			$link_out .= "&".$k."=".$v;
		}
		
		return $link_out; 
	}
	
	//-----------------check_admin_login
	function check_admin_login (){
		global $ttH;
		
		$login = 0;
		if(isset($_SESSION[$ttH->conf["admin_ses"]]) && is_array($_SESSION[$ttH->conf["admin_ses"]])){
			if(isset($ttH->data['admin']) && is_array($ttH->data['admin']) && count($ttH->data['admin']) > 0) {
				if($ttH->data['admin']["id"] == $_SESSION[$ttH->conf["admin_ses"]]["userid"] 
					&& $ttH->data['admin']["username"] == $_SESSION[$ttH->conf["admin_ses"]]["username"] 
					&& $ttH->data['admin']["password"] == $_SESSION[$ttH->conf["admin_ses"]]["password"] 
					&& $ttH->data['admin']["session"] == $_SESSION[$ttH->conf["admin_ses"]]["session"]) {
					return 1;	
				}
			} else {
				$ttH->data['admin'] = array();
			}
			$arr_user = $_SESSION[$ttH->conf["admin_ses"]];
			$query = "select * from admin where id=".$arr_user["userid"]."";
			$result = $ttH->db->query($query);
			$row = $ttH->db->fetch_row($result);
			if($row["id"] == $arr_user["userid"] && $row["username"] == $arr_user["username"] && $row["password"] == $arr_user["password"] && $row["session"] == $arr_user["session"]) {
				$ttH->data['admin'] = $row;
				$login = 1;
			}
		}
		return $login; 
	}
	
	//-----------------get_admin_powers
	function get_admin_powers (){
		global $ttH;
		
		if(isset($ttH->arr_powers)) {
			return $ttH->arr_powers;
		}
		$ttH->arr_powers = array();
		
		if($this->check_admin_login() == 1) {
			
			if($ttH->data['admin']["group_id"] == -1) {
				$ttH->arr_powers = 'full_powers';
			}
			
			$query = "select group_id, arr_powers 
								from admin_group 
								where group_id='".$ttH->data['admin']["group_id"]."'";
			//echo $query; die();
			$result = $ttH->db->query($query);
			if($row = $ttH->db->fetch_row($result)) {
				$ttH->arr_powers = unserialize($row['arr_powers']);
			}
		}
		
		return $ttH->arr_powers; 
	}
	
	function list_target ($select_name="target", $cur="_self", $ext="",$arr_more=array()) {
		global $ttH;
		
		$arr_data = array(
			'_self' => '[_self] Thây trang hiện tại',
			'_blank' => '[_blank] Mở tab mới',
			'_new' => '[_new] Mở cửa xổ mới',
			'_parent' => '[_parent] Ra khỏi iframe 1 cấp',
			'_top' => '[_top] Thoát tất cả iframe',
		);
		
		return $ttH->html->select ($select_name, $arr_data, $cur, $ext,$arr_more);
	}
	
	function list_link_type ($select_name="link_type", $cur="site", $ext="",$arr_more=array()) {
		global $ttH;
		
		$arr_data = array(
			'site' => 'Nội bộ trang',
			'web' => 'Liên kết web khác',
			'mail' => 'Thư điện tử',
			'neo' => 'Neo trong trang',
		);
		
		return $ttH->html->select ($select_name, $arr_data, $cur, $ext,$arr_more);
	}
	
	
	function get_input_pic ($url, $mod = '') {
		global $ttH;
		
		$output = '';
		
		$link = $ttH->conf['rooturl_web'].'uploads/';
		if($mod != '') {
			$link .= $mod.'/';
		}
		$output = str_replace($link,'',$url);
		
		return $output;
	}
	
	function get_form_pic ($html_name='picture', $picture='', $folder_upload='', $dir='') {
		global $ttH;
		
		$output = '';
		
		$data = array();
		$data['picture'] = $picture;
		if(!empty($picture)){
			$data["pic"] = '<a class="fancybox-effects-a" title="'.$picture.'" href="'.DIR_UPLOAD.$picture.'">
				'.$ttH->func->get_pic_mod($picture, 200, 200, '', 1, 0, array('fix_width'=>1)).'
			</a>';
		}
		
		$data['html_name'] = $html_name;
		$data['html_id'] = str_replace(array('[',']'),array('_',''),$html_name);
		$data['folder_upload'] = $folder_upload;
		$data["link_up"] = $this->get_link_admin ('library','library','popup_library').'&type=1&folder_up='.$data['folder_upload'].'&fldr='.$dir.'&editor=mce_0&field_id='.$data['html_id'];
		$output = $ttH->html->temp_box('html_form_pic', $data);
		
		return $output;
	}
	
	function get_form_file ($html_name='file', $file='', $folder_upload='', $dir='') {
		global $ttH;
		
		$output = '';
		
		$data = array();
		$data['file'] = $file;
		if(!empty($file)){
			/*$data["pic"] = '<a class="fancybox-effects-a" title="'.$file.'" href="'.DIR_UPLOAD.$file.'">
				'.$ttH->func->get_pic_mod($file, 200, 200, '', 1, 0, array('fix_width'=>1)).'
			</a>';*/
		}
		
		$data['html_name'] = $html_name;
		$data['html_id'] = str_replace(array('[',']'),array('_',''),$html_name);
		$data['folder_upload'] = $folder_upload;
		$data["link_up"] = $this->get_link_admin ('library','library','popup_library').'&type=2&folder_up='.$data['folder_upload'].'&fldr='.$dir.'&editor=mce_0&field_id='.$data['html_id'];
		$output = $ttH->html->temp_box('html_form_file', $data);
		
		return $output;
	}
	
	//======admin_paginate	
	function admin_paginate ($root_link, $numRows, $maxRows, $extra = "", $cPage = 1, $p = "p", $pmore = 4, $class = "pagelink")
	{
		global $ttH;
		$navigation = "";
		// get total pages
		$totalPages = ceil($numRows / $maxRows);
		$next_page = $pmore;
		$prev_page = $pmore;
		if ($cPage < $pmore) $next_page = $pmore + $pmore - $cPage;
		if ($totalPages - $cPage < $pmore) $prev_page = $pmore + $pmore - ($totalPages - $cPage);
		if ($totalPages > 1)
		{
			$navigation .= '<ul class="pagination">';
		  //$navigation .= "<span class=\"pagetotal\">" . $totalPages . " " . $ttH->lang['global']['pages'] . "</span>";
		  // Show first page
		  if ($cPage > ($pmore + 1)){
				$pLink = $root_link . "&{$p}=1{$extra}";
				$class = ($cPage == 1) ? ' class="disabled"' : '';
				$navigation .= '<li '.$class.'><a href="'.$pLink.'">««</a></li>';
		  }
		  // End
		  // Show Prev page
		  if ($cPage > 1)
		  {
				$numpage = $cPage - 1;
				if (! empty($extra)) {
					$pLink = $root_link . "&{$p}=" . $numpage . "{$extra}";
				}else {
					$pLink = $root_link . "&{$p}=" . $numpage;
				}
				$class = ($cPage == 1) ? ' class="disabled"' : '';
				$navigation .= '<li '.$class.'><a href="'.$pLink.'">«</a></li>';
		  }
		  // End	
		  // Left
		  for ($i = $prev_page; $i >= 0; $i --){
				$pagenum = $cPage - $i;
				if (($pagenum > 0) && ($pagenum < $cPage)){
					$pLink = $root_link . "&{$p}={$pagenum}{$extra}";
					$navigation .= '<li ><a href="'.$pLink.'">'.$pagenum.'</a></li>';
				}
		  }
		  // End	
		  // Current
		  $navigation .= '<li class="active"><a href="javascript:void(0);">'.$cPage.'</a></li>';
		  // End
		  // Right
		  for ($i = 1; $i <= $next_page; $i ++){
				$pagenum = $cPage + $i;
				if (($pagenum > $cPage) && ($pagenum <= $totalPages)){
					$pLink = $root_link . "&{$p}={$pagenum}{$extra}";
					$navigation .= '<li ><a href="'.$pLink.'">'.$pagenum.'</a></li>';
				}
		  }
		  // End
		  // Show Next page
		  if ($cPage < $totalPages){
				$numpage = $cPage + 1;
				$pLink = $root_link . "&{$p}=" . $numpage . "{$extra}";
				$class = ($cPage == $totalPages) ? ' class="disabled"' : '';
				$navigation .= '<li '.$class.'><a href="'.$pLink.'">»</a></li>';
		  }
		  // End		
		  // Show Last page
		  if ($cPage < ($totalPages - $pmore)){
				$pLink = $root_link . "&{$p}=" . $totalPages . "{$extra}";
				$class = ($cPage == $totalPages) ? ' class="disabled"' : '';
				$navigation .= '<li '.$class.'><a href="'.$pLink.'">»»</a></li>';
		  }
			$navigation .= '</ul>';
		  // End
		} // end if total pages is greater than one
		return $navigation;
	}
	
	//-----------------get_menu_admin
	function get_menu_admin (){
		global $ttH;
		
		$arr_menu = array();
		
		$sql = "select * from admin_menu where is_show=1 order by show_order desc, date_create asc";
    $result = $ttH->db->query($sql);
    while($row = $ttH->db->fetch_row($result)){
			$row["arr_title"] = unserialize($row["arr_title"]);
			$arr_menu[$row["parent_id"]][$row["menu_id"]] = $row;
		}
		
		foreach($arr_menu[0] as $row){
			
			if(!isset($ttH->arr_powers[$row['name_action']]) && $ttH->arr_powers != 'full_powers'){
				continue;
			}
			
			$row["class"] = "";
			if(isset($arr_menu[$row["menu_id"]])){
				foreach($arr_menu[$row["menu_id"]] as $sub){
					
					if(!isset($ttH->arr_powers[$row['name_action']][$sub['name_action']]) && $ttH->arr_powers != 'full_powers'){
						continue;
					}
					
					$sub["title"] = $sub["arr_title"][$ttH->conf["lang_view"]];
					$sub["link"] = $this->get_link_admin ($row["name_action"], $sub["name_action"], "manage");
					
					$sub["class"] = ($ttH->conf['cur_mod'] == $row["name_action"] && $ttH->conf['cur_act'] == $sub["name_action"]) ? ' active' : '';
					$sub["class"] = $sub["class"] ? ' class="'.$sub["class"].'"' : '';
					
					$ttH->temp_html->assign("row", $sub);
					$ttH->temp_html->parse("menu_admin.item.sub.sub_item");
				}
				
				$ttH->temp_html->parse("menu_admin.item.sub");
				
				$row["class"] = 'dropdown';
			}
			
			$row["class"] .= ($ttH->conf['cur_mod'] == $row["name_action"]) ? ' open current' : '';
			$row["class"] = $row["class"] ? ' class="'.$row["class"].'"' : '';
			
			$row["title"] = $row["arr_title"][$ttH->conf["lang_view"]];
			$row["link"] = "#";
			
			$ttH->temp_html->assign("row", $row);
			$ttH->temp_html->parse("menu_admin.item");
		}
		
		$ttH->temp_html->assign("row", $row);
		$ttH->temp_html->parse("menu_admin");
		return $ttH->temp_html->text("menu_admin"); 
	}
	
	//-----------------get_box_admin
	function get_box_admin (){
		global $ttH;
		
		$data = $ttH->data['admin'];
		$data['link_profile'] = $this->get_link_admin ('admin', 'admin', "edit", array('id'=>$data['id']));
		$data['link_logout'] = $ttH->conf['rooturl'].'admin/?mod=admin&act=logout';
		$url = $ttH->func->base64_encode($_SERVER['QUERY_STRING']);
		$data['link_logout'] .= (!empty($url)) ? '&url='.$url : '';
		
		$ttH->temp_html->assign("LANG", $ttH->lang);
		$ttH->temp_html->assign("data", $data);
		$ttH->temp_html->parse("box_admin");
		return $ttH->temp_html->text("box_admin"); 
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
	
	//-----------------list_yesno
	function list_yesno ($select_name="id", $cur="", $ext="",$arr_more=array()){
		global $ttH;
		
		$array = array(
			0 => $ttH->lang['global']['no'],
			1 => $ttH->lang['global']['yes']
		);
		
		return $ttH->html->select ($select_name, $array, $cur, $ext,$arr_more); 
	}
  
	// end classs
}
?>