<?php

/*================================================================================*\
Name code : function.php
Copyright © 2013 by Phan Van Lien
@version : 1.0
@date upgrade : 03/02/2013 by Phan Van Lien
\*================================================================================*/

if (! defined('IN_ttH')) {
  die('Hacking attempt!');
}

class commonFunc extends sMain 
{
	
  //=================load_setting===============
	function __construct (){
		global $ttH;
		
		$ttH->setting = array();
		
		return false;
	}
	
	function create_folder($dir="", $mode = 0755) {
		global $ttH;
		
		if($ttH->func->rmkdir($this->folder_upload."/".$dir, $mode)){
			return $dir;
		}else{
			return "";
		}
	}
	
	function _select($k, $v, $data) {
		global $ttH;
		
		$output = '';
		
		$tmp = array();
		if((isset($v['muti'])) && $v['muti'] == true) {
			$tmp["select_muti"] = 1;
		}
		if((isset($v['title']))) {
			$tmp["title"] = (isset($ttH->lang[$this->modules][$v['title']]) ? $ttH->lang[$this->modules][$v['title']] : $ttH->lang['global'][$v['title']]);
		}
		if(isset($v['data']) && is_array($v['data'])) {
			$output = $ttH->html->select (
				(isset($tmp["select_muti"]) ? $k.'[]' : $k), 
				$v['data'], 
				(isset($data[$k]) ? $data[$k] : ''), 
				" class=\"form-control\"",
				$tmp
			);
		} elseif(isset($v['select_type']) && $v['select_type'] == 'list_num') {
			$output = $ttH->admin->list_number (
				(isset($tmp["select_muti"]) ? $k.'[]' : $k), 
				(isset($v['min']) ? $v['min'] : 1), 
				(isset($v['max']) ? $v['max'] : 100), 
				(isset($data[$k]) ? $data[$k] : ''), 
				" class=\"form-control\"",
				$tmp
			);
		} else {
			$func_call = (isset($v['function_call']) && $v['function_call']) ? $v['function_call'] : 'list_'.$k;	
			eval('$output = $this->'.$func_call.' (
			"'.(isset($tmp["select_muti"]) ? $k.'[]' : $k).'", 
			"'.(isset($data[$k]) ? $data[$k] : '').'", 
			" class=\'form-control\'", 
			$tmp);');
		}
		
		return $output;
	}
	
	//-----------
	function _form_input($data)
	{
		global $ttH;
		
		$this->dir = $this->create_folder(date("Y_m"));
		
		foreach($this->arr_element as $k => $v) {
			if(!isset($v['form_type'])) {
				continue;
			}
			$form_type = (isset($v['form_type'])) ? $v['form_type'] : '';
			$html_before = '';
			$form_col = 6;
			$use_title = true;
			switch ($form_type) {
				case "picture":
					$data[$k] = $ttH->admin->get_form_pic ($k, (isset($data[$k]) ? $data[$k] : ''), $this->folder_upload, $this->dir);
					break;
				case "file":
					$data[$k] = $ttH->admin->get_form_file ($k, (isset($data[$k]) ? $data[$k] : ''), $this->folder_upload, $this->dir);
					break;
				case "select":
					
					$data[$k] = (isset($data[$k])) ? $data[$k] : ''; //Check isset
					if($ttH->get['sub'] == 'add') {
						$data[$k] = (isset($ttH->post[$k])) ? $ttH->post[$k] : $data[$k]; //Lấy lại những thông tin đã nhập để giảm thời gian nhập
					}					 
					
					$tmp = array();
					if((isset($v['muti'])) && $v['muti'] == true) {
						$tmp["select_muti"] = 1;
					}
					if((isset($v['title']))) {
						$tmp["title"] = (isset($ttH->lang[$this->modules][$v['title']]) ? $ttH->lang[$this->modules][$v['title']] : $ttH->lang['global'][$v['title']]);
					}
					if(isset($v['data']) && is_array($v['data'])) {
						$data[$k] = $ttH->html->select (
							(isset($tmp["select_muti"]) ? $k.'[]' : $k), 
							$v['data'], 
							(isset($data[$k]) ? $data[$k] : ''), 
							" class=\"form-control\"",
							$tmp
						);
					} elseif(isset($v['select_type']) && $v['select_type'] == 'list_num') {
						$data[$k] = $ttH->admin->list_number (
							(isset($tmp["select_muti"]) ? $k.'[]' : $k), 
							(isset($v['min']) ? $v['min'] : 1), 
							(isset($v['max']) ? $v['max'] : 100), 
							(isset($data[$k]) ? $data[$k] : ''), 
							" class=\"form-control\"",
							$tmp
						);
					} else {						
						$data[$k] = (isset($data[$k]) ? $data[$k] : '');
						if(is_array($data[$k])) {
							$data[$k] = implode(',',$data[$k]);
						}
						$data[$k] = str_replace('"','\"',$data[$k]);	
						$func_call = (isset($v['function_call']) && $v['function_call']) ? $v['function_call'] : 'list_'.$k;	
						eval('$data["'.$k.'"] = $this->'.$func_call.' (
						"'.(isset($tmp["select_muti"]) ? $k.'[]' : $k).'", 
						"'.$data[$k].'", 
						" class=\'form-control\'", 
						$tmp);');
					}
					break;
				case "checkbox":
					if(!(isset($v['data']) && is_array($v['data']))){
						$use_title = false;
					}
					
					$tmp = ' class="checkbox"';
					if(isset($v['inline'])) {
						$tmp = ' class="checkbox-inline"';
					}
					$title = (isset($ttH->lang[$this->modules][$k]) ? $ttH->lang[$this->modules][$k] : (isset($ttH->lang['global'][$k]) ? $ttH->lang['global'][$k] : $k));
					$data[$k] = $ttH->html->checkbox (
						(isset($v['muti'])) ? $k.'[]' : $k, 
						((isset($v['data']) && is_array($v['data'])) ? $v['data'] : array(1 => $title)), 
						(isset($data[$k]) ? $data[$k] : ''), 
						$tmp
					);					
					break;
				case "editor":
					$form_col = 12;
					$data[$k] = $ttH->editor->load_editor (
						$k, 
						$k, 
						(isset($data[$k]) ? $data[$k] : ''), 
						"", 
						(isset($v['editor']) ? $v['editor'] : "full"), 
						array("folder_up" => $this->folder_upload, "fldr" => $this->dir)
					);					
					break;
				case "friendly_link":
					$tmp = ($k != 'friendly_link') ? str_replace('_link','',$k) : $k;
					$tmp_title = $ttH->lang['global']['orientation_search_engine'];
					if(in_array($ttH->input['act'], array('setting','seo'))) {
						$tmp_title = (isset($ttH->lang[$this->modules][$tmp]) ? $ttH->lang[$this->modules][$tmp] : (isset($ttH->lang['global'][$tmp]) ? $ttH->lang['global'][$tmp] : $tmp));
					}
					$html_before = $ttH->html->temp_box('html_title', array(
						'title' => $tmp_title
					));
					$data[$k] = $ttH->html->temp_box('input_text', array(
						'key' => $k,
						'content' => (isset($data[$k]) ? $data[$k] : ''),
						'ext' => '<p>'.$ttH->lang['global'][$form_type.'_note'].'</p>'
					));
					break;
				case "meta_title":
					$data[$k] = $ttH->html->temp_box('input_text', array(
						'key' => $k,
						'content' => (isset($data[$k]) ? $data[$k] : ''),
						'ext' => '<p>'.$ttH->lang['global'][$form_type.'_note'].'</p>'
					));
					break;
				case "meta_key":
					$data[$k] = $ttH->html->temp_box('textarea', array(
						'key' => $k,
						'rows' => 1,
						'content' => (isset($data[$k]) ? $data[$k] : ''),
						'ext' => '<p>'.$ttH->lang['global'][$form_type.'_note'].'</p>'
					));
					break;
				case "meta_desc":
					$data[$k] = $ttH->html->temp_box('textarea', array(
						'key' => $k,
						'rows' => 1,
						'content' => (isset($data[$k]) ? $data[$k] : ''),
						'ext' => '<p>'.$ttH->lang['global'][$form_type.'_note'].'</p>'
					));
					break;
				default:
					if(!$form_type) {
						break;
					}
					$tmp_temp = 'input_text';
					if($form_type == 'price'){
						$tmp_temp = 'input_price';
					}elseif($form_type == 'color'){
						$tmp_temp = 'input_color';
					}elseif($form_type == 'video_youtube'){
						$tmp_temp = 'video_youtube';
					}elseif($form_type == 'code'){
						$data[$k] = $this->item_code ($k, (isset($data[$k]) ? $data[$k] : ''), (isset($ttH->input['id']) ? $ttH->input['id'] : 0));
					}
					
					$data[$k] = $ttH->html->temp_box($tmp_temp, array(
						'key' => $k,
						'content' => (isset($data[$k]) ? $data[$k] : ''),
						'ext' => ($form_type == 'link') ? '<p>Ví dụ: imsvietnamese.com, www.imsvietnamese.com, http://imsvietnamese</p>' : ''
					));
					break;
			}
			
			if(isset($data[$k])) {
				$ttH->temp_act->assign('row', array(
					'before' => $html_before,
					'form_col' => (isset($v['form_col'])) ? $v['form_col'] : $form_col,
					'key' => $k,
					'title' => (isset($ttH->lang[$this->modules][$k]) ? $ttH->lang[$this->modules][$k] : (isset($ttH->lang['global'][$k]) ? $ttH->lang['global'][$k] : $k)),
					'content' => (isset($data[$k]) ? $data[$k] : '')
				));
				if($use_title == true) {
					$ttH->temp_act->parse("edit.element.title");
				}
				$ttH->temp_act->parse("edit.element");
			}
		}
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("edit");
		return $ttH->temp_act->text("edit");
	}
	
	function _required($k, $v) {
		global $ttH;
		
		$output = '';
		
		$required = (isset($v['required'])) ? $v['required'] : false;
		
		$mess = '';
		
		if($required && is_array($v['required'])) {
			foreach($v['required'] as $k1 => $v1) {
				if($k1 == 'exit' || $v1 == 'exit') {
					$query = "select ".$this->dbtable_id."  
							from ".$this->dbtable." 
							where ".$k."='".trim($ttH->post[$k])."' 
							and ".$this->dbtable_id."!='".(isset($ttH->input['id']) ? trim($ttH->input['id']) : 0)."'  
							limit 0,1";
					//echo $query;
					$result = $ttH->db->query($query);
					if($row = $ttH->db->fetch_row($result)){
						$mess = '[name] đã tồn tại';
					}
				} elseif (in_array($k1, array('gte', 'lte'))) {
					$t1 = (float)$ttH->post[$v1];
					if(!is_numeric($v1)) {
						$t1 = (isset($ttH->post[$v1])) ? (float)$ttH->post[$v1] : 0;
					}					
					$t2 = (isset($ttH->post[$k])) ? (float)$ttH->post[$k] : 0;
					if($k1 == 'lte' && $t1 < $t2) {
						$mess = '[name] phải nhỏ hơn hoặc bằng '.(isset($ttH->lang[$this->modules][$v1]) ? $ttH->lang[$this->modules][$v1] : (isset($ttH->lang['global'][$v1]) ? $ttH->lang['global'][$v1] : $v1));
					} elseif($k1 == 'gte' && $t1 > $t2) {
						$mess = '[name] phải lớn hơn hoặc bằng '.(isset($ttH->lang[$this->modules][$v1]) ? $ttH->lang[$this->modules][$v1] : (isset($ttH->lang['global'][$v1]) ? $ttH->lang['global'][$v1] : $v1));
					}
				}
			}
		} elseif(empty($ttH->post[$k])) {
			$mess = (isset($ttH->lang["global"]["err_invalid"])) ? $ttH->lang["global"]["err_invalid"] : '[name] không hợp lệ';
		}
		
		if($required && $mess) {
			$title = (isset($ttH->lang[$this->modules][$k]) ? $ttH->lang[$this->modules][$k] : (isset($ttH->lang['global'][$k]) ? $ttH->lang['global'][$k] : $k));
			$mess = str_ireplace('[name]',$title,$mess);
			$output = $ttH->html->html_alert ($mess, "error");	
		}		
		
		return $output;
	}
	
	function _alterdb($k, $v) {
		global $ttH;
		
		$output = '';
		
		$form_type = (isset($v['form_type'])) ? $v['form_type'] : '';
		switch ($form_type) {
			case "picture":
				$output = $ttH->db->query("alter table ".$this->dbtable." add ".$k." varchar(250) not null ;");
				break;
			case "file":
				$output = $ttH->db->query("alter table ".$this->dbtable." add ".$k." varchar(250) not null ;");
				break;
			case "select":
				if((isset($v['muti'])) && $v['muti'] == true) {
					$output = $ttH->db->query("alter table ".$this->dbtable." add ".$k." text not null ;");
				} else {
					$output = $ttH->db->query("alter table ".$this->dbtable." add ".$k." int(11) not null ;");
				}
				break;
			case "checkbox":
				if((isset($v['muti'])) && $v['muti'] == true) {
					$output = $ttH->db->query("alter table ".$this->dbtable." add ".$k." text not null ;");
				} else {
					$output = $ttH->db->query("alter table ".$this->dbtable." add ".$k." int(11) not null ;");
				}
				break;
			case "editor":
					$output = $ttH->db->query("alter table ".$this->dbtable." add ".$k." text not null ;");
				break;
			case "friendly_link":
				$output = $ttH->db->query("alter table ".$this->dbtable." add ".$k." varchar(250) not null ;");
				break;
			case "meta_title":
				$output = $ttH->db->query("alter table ".$this->dbtable." add ".$k." varchar(250) not null ;");
				break;
			case "meta_key":
					$output = $ttH->db->query("alter table ".$this->dbtable." add ".$k." text not null ;");
				break;
			case "meta_desc":
					$output = $ttH->db->query("alter table ".$this->dbtable." add ".$k." text not null ;");
			default:
				if(!$form_type) {
					break;
				}
				$output = $ttH->db->query("alter table ".$this->dbtable." add ".$k." varchar(250) not null ;");
				break;
		}
		$auto = (isset($v['auto'])) ? $v['auto'] : '';
		if(isset($v['auto'])) {
			if($auto === 'time') {
				$output = $ttH->db->query("alter table ".$this->dbtable." add ".$k." int(11) not null ;");
			} else {
				$output = $ttH->db->query("alter table ".$this->dbtable." add ".$k." int(11) not null ;");
			}
		}		
		
		return $output;
	}
	
	function _inputdb($k, $v) {
		global $ttH;
		
		$output = '';
		
		$form_type = (isset($v['form_type'])) ? $v['form_type'] : '';
		switch ($form_type) {
			case "picture":
				$output = (isset($ttH->post[$k])) ? $ttH->func->get_input_pic ($ttH->post[$k]) : '';
				if(!$output) {
					$output = (isset($ttH->post['video']) && $ttH->post['video']) ? $ttH->func->get_youtube_pic($ttH->post['video'], 'video') : $output;
				}	
				break;
			case "file":
				$output = (isset($ttH->post[$k])) ? $ttH->func->get_input_file ($ttH->post[$k]) : '';
				break;
			case "select":
				if((isset($v['muti'])) && $v['muti'] == true) {
					$output = (isset($ttH->post[$k])) ? implode(',',$ttH->post[$k]) : '';
				} else {
					$output = (isset($ttH->post[$k])) ? $ttH->post[$k] : '';
				}
				break;
			case "checkbox":
				if((isset($v['muti'])) && $v['muti'] == true) {
					$output = (isset($ttH->post[$k])) ? implode(',',$ttH->post[$k]) : '';
				} else {
					$output = (isset($ttH->post[$k])) ? $ttH->post[$k] : '';
				}
				break;
			case "editor":
				$output = $ttH->func->input_editor ($ttH->post[$k]);
				break;
			/*case "friendly_link":
				$output = $ttH->func->get_friendly_link_db (
					$ttH->post[$k], 
					$this->dbtable, 
					$this->dbtable_id, 
					$k, 
					$ttH->conf['lang_cur'], 
					$v
				);
				break;*/
			case "meta_title":
				$output = (isset($ttH->post[$k]) ? $ttH->post[$k] : '');
				//$output = $ttH->func->meta_title($output);
				break;
			case "meta_key":
				$output = (isset($ttH->post[$k]) ? $ttH->post[$k] : '');
				//$output = $ttH->func->meta_key($output);
				break;
			case "meta_desc":
				$output = (isset($ttH->post[$k]) ? $ttH->post[$k] : '');
				$output = $ttH->func->meta_desc($output);
			default:
				if(!$form_type) {
					break;
				}
				$output = (isset($ttH->post[$k]) ? $ttH->post[$k] : '');
				break;
		}
		$auto = (isset($v['auto'])) ? $v['auto'] : '';
		if(isset($v['auto'])) {
			if($auto === 'time') {
				$output = time();
			} elseif($auto === 'discount' && isset($v['discount']) && is_array($v['discount'])) {
				foreach($v['discount'] as $kt => $vt) {
					$output = ($ttH->post[$kt] > 0 && $ttH->post[$vt] > 0 && $ttH->post[$kt] > $ttH->post[$vt]) ? round((($ttH->post[$kt] - $ttH->post[$vt])/$ttH->post[$kt]),2)*100 : 0;
					break;
				}				
			} else {
				$output = $auto;
			}
		}		
		
		return $output;
	}
	
	
	function built_group_nav_sub ($group_id, $group_nav = '') {
		global $ttH;
		
		//update $this->modules
		$col_up = array();
		$col_up["group_nav"] = $group_nav;
		$ttH->db->do_update($this->modules, $col_up, " group_id='".$group_id."'");	
		//End 
		
		$query = "select group_id 
							from ".$this->modules."_group   
							where parent_id='".$group_id."' ";
		//echo $query;
		$result = $ttH->db->query($query);
		while($row = $ttH->db->fetch_row($result)){
			$col = array();
			$col["group_nav"] = $group_nav;
			$col["group_nav"] .= (!empty($col["group_nav"])) ? ',' : '';
			$col["group_nav"] .= $row['group_id'];
			$col["group_level"] = substr_count($col['group_nav'],',') + 1;
			$ok = $ttH->db->do_update($this->modules."_group", $col, " group_id='".$row['group_id']."'");	
			if($ok) {
				
			//update $this->modules
				$col_up = array();
				$col_up["group_nav"] = $col["group_nav"];
				$ttH->db->do_update($this->modules, $col_up, " group_id='".$row['group_id']."'");
				//End 	
				
				built_group_nav_sub ($row['group_id'], $col["group_nav"]);
			}		
		}
		
		return '';
	}
	
	function update_menu_link($name_action="", $info = array()) {
		global $ttH;
		
		$tmp = explode('-',$name_action);
		$add_act = $tmp[1];
		
		/*$col = array();
		$col["link"] = ($add_act == 'item') ? $friendly_link.'.html' : $friendly_link;
		$ok = $ttH->db->do_update("menu", $col, " name_action='".$name_action."' and lang='".$ttH->conf['lang_cur']."'");	*/
		$query = "select id,menu_id,title,link,lock_title  
							from menu 
							where name_action='".$name_action."' 
							and lang='".$ttH->conf['lang_cur']."' ";
		//echo $query;
		$result = $ttH->db->query($query);
		while($row = $ttH->db->fetch_row($result)){
			
			$title = (isset($info['title'])) ? $info['title'] : $row['title'];
			$friendly_link = (isset($info['friendly_link'])) ? $info['friendly_link'] : $row['friendly_link'];
			
			$col = array();
			if($row['lock_title'] != 1) {
				$col["title"] = $title;
			}
			$col["link"] = ($add_act == 'item') ? $friendly_link.'.html' : $friendly_link;
			$ttH->db->do_update("menu", $col, " id='".$row['id']."'");
		}
	}
	
	function del_menu($name_action="") {
		global $ttH;
		
		$ttH->db->delete ("menu", "name_action='".$name_action."'");
	}
	
	function get_group_nav ($parent_id, $group_id=0, $type='group') {
		global $ttH;
		
		$output = '';
		if($group_id <= 0 && $type == 'group'){
			return '';
		}
		
		$query = "select group_id, group_nav
							from ".$this->modules."_group 
							where group_id='".$parent_id."' 
							and group_id>0  
							limit 0,1";
		//echo $query;
		$result = $ttH->db->query($query);
		if($row = $ttH->db->fetch_row($result)){
			$output = $row['group_nav'];
			if($type == 'group'){
				$output .= ','.$group_id;
			}
		}else{
			if($type == 'group'){
				$output = $group_id;
			}
		}
		
		return $output;
	}
	
	
	//-----------get_group_name
	function get_group_name ($group_id, $type='none'){
		global $ttH;
		
		$data = $ttH->load_data->data_table ($this->modules.'_group', 'group_id', 'group_id,title,friendly_link', " lang='".$ttH->conf['lang_cur']."' and group_id='".$group_id."' ");
		
		$output = '---';
		if (isset($data[$group_id])) {
			$row = $data[$group_id];
			switch ($type) {
				case "link":
					$link = $ttH->admin->get_link_admin ($this->modules, 'group', 'edit', array("id"=>$row['group_id']));
					$output = '<a href="'.$link.'">'.$row['title'].'</a>';
					break;
				default:
					$output = $row['title'];
					break;
			}
		}
		
		return $output;
	}
	
	//-----------get_brand_name
	function get_brand_name ($brand_id, $type='none'){
		global $ttH;
		
		$data = $ttH->load_data->data_table ($this->modules.'_brand_lang', 'brand_id', 'brand_id,title,friendly_link', " lang='".$ttH->conf['lang_cur']."' and group_id='".$group_id."' ");
		
		$output = '';
		if (isset($data[$group_id])) {
			$row = $data[$group_id];
			switch ($type) {
				case "link":
					$link = $ttH->site->get_link ($this->modules,'thuong-hieu',$row['friendly_link']);
					$output = '<a href="'.$link.'">'.$row['title'].'</a>';
					break;
				default:
					$output = $row['title'];
					break;
			}
		}
		
		return $output;
	}
	
	function list_group ($select_name="group_id", $cur="", $ext="",$arr_more=array()) {
		global $ttH;
		
		$ttH->load_data->data_group ($this->modules);
		
		$select_muti = (isset($arr_more['select_muti'])) ? $arr_more['select_muti'] : 0;
		if($select_muti == 1) {
			return $ttH->html->select_muti ($select_name, $ttH->data[$this->modules."_group_tree"], $cur, $ext,$arr_more);
		} else {
			return $ttH->html->select ($select_name, $ttH->data[$this->modules."_group_tree"], $cur, $ext,$arr_more);
		}
	}
	
	function list_group_id ($select_name="group_id", $cur="", $ext="",$arr_more=array()) {
		global $ttH;

		return $this->list_group ($select_name, $cur, $ext,$arr_more);
	}
	
	function list_parent_id ($select_name="group_id", $cur="", $ext="",$arr_more=array()) {
		global $ttH;
		
		if($ttH->input['act'] == 'group' && $ttH->input['sub'] == 'edit' && $ttH->input['id']) {
			$arr_more['disabled'] = $ttH->input['id'];
		}
		
		return $this->list_group ($select_name, $cur, $ext,$arr_more);
	}
	
	function list_group_related ($select_name="group_id", $cur="", $ext="",$arr_more=array()) {
		global $ttH;
		
		return $this->list_group ($select_name, $cur, $ext,$arr_more);
	}
	
	function list_brand ($select_name="brand_id", $cur="", $ext="",$arr_more=array()) {
		global $ttH;
		
		$data = $ttH->load_data->data_table (
			$this->modules."_brand", 
			"brand_id", 
			"brand_id, title", 
			"is_show=1 and lang='".$ttH->conf["lang_cur"]."' order by show_order desc, date_create asc");
		
		return $ttH->html->select ($select_name, $data, $cur, $ext,$arr_more);
	}
	
	function list_nature ($select_name="nature_id", $cur="", $ext="",$arr_more=array()) {
		global $ttH;
		
		$data = $ttH->load_data->data_table (
			$this->modules."_nature", 
			"nature_id", 
			"nature_id, title", 
			"is_show=1 and lang='".$ttH->conf["lang_cur"]."' order by show_order desc, date_create asc");
		
		return $ttH->html->select ($select_name, $data, $cur, $ext,$arr_more);
	}
	
	function list_item ($select_name="item_id", $cur="", $ext="",$arr_more=array()) {
		global $ttH;
		
		$data = $ttH->load_data->data_table (
			$this->modules." m, ".$this->modules."_lang ml", 
			"item_id", 
			"m.item_id, title", 
			"m.item_id=ml.item_id and is_show=1 and lang='".$ttH->conf["lang_cur"]."' order by show_order desc, date_create asc");
		
		return $ttH->html->select ($select_name, $ttH->data[$this->modules], $cur, $ext,$arr_more);
	}

	function list_pic_show ($select_name="pic_show", $cur="", $ext="",$arr_more=array()) {
		global $ttH;
		
		$arr_data = array(
			'slide' => 'Dạng slide',
			'grid' => 'Dạng danh sách'
		);
		
		return $ttH->html->select ($select_name, $arr_data, $cur, $ext,$arr_more);
	}
	
	function list_type_show ($select_name="type_show", $cur="", $ext="",$arr_more=array()) {
		global $ttH;
		
		$arr_data = array(
			'list_item' => 'Hiển thị tin dạng danh sách',
			'list_item-nopicture' => 'Hiển thị tin dạng danh sách (Không hình ảnh)',
			'grid_item' => 'Hiển thị tin dạng lưới',
			'list_sub' => 'Hiển thị cấp con dạng danh sách',
			//'grid_sub' => 'Hiển thị cấp con dạng lưới',
			'go_item' => 'Dẫn đến chi tiết tin',
			'content_only' => 'Chỉ hiển thị nội dung danh mục'
		);
		
		if(isset($this->arr_select['type_show']['data']) && is_array($this->arr_select['type_show']['data'])) {
			$arr_data = $this->arr_select['type_show']['data'];
		}
		
		return $ttH->html->select ($select_name, $arr_data, $cur, $ext,$arr_more);
	}
	
	function list_type_input ($select_name="type_input", $cur="", $ext="",$arr_more=array()) {
		global $ttH;
		
		$arr_data = array(
			'text' => 'Text',
			'editor' => 'Trình soạn thảo',
			'radio' => 'Radio',
			'checkbox' => 'Checkbox',
			'checkbox_muti' => 'Checkbox muti'
		);
		
		return $ttH->html->select ($select_name, $arr_data, $cur, $ext,$arr_more);
	}
	
	function list_list_use ($select_name="list_use", $cur="", $ext="",$arr_more=array()) {
		global $ttH;
		
		return $this->list_group ($select_name, $cur, $ext,$arr_more);
	}
	
	function list_layout ($select_name="layout", $cur="", $ext="",$arr_more=array()) {
		global $ttH;
		
		$arr_data = array(
			'm-c' => 'Nội dung - cột',
			'c-m' => 'Cột - nội dung',
			'c-m-c' => 'Cột - nội dung -cột',
			'm' => 'Nội dung',
			'full' => 'Tràn biên (full)'
			//'only' => 'Chỉ hiện nội dung'
		);
		
		return $ttH->html->select ($select_name, $arr_data, $cur, $ext,$arr_more);
	}
	
	function list_skin ($select_name="layout", $cur="", $ext="",$arr_more=array()) {
		global $ttH;
		
		$arr_data = array(
			1 => 'Skin 1',
			2 => 'Skin 2'
		);
		
		return $ttH->html->select ($select_name, $arr_data, $cur, $ext,$arr_more);
	}
	
	function list_list_widget ($select_name="list_widget", $cur="", $ext="",$arr_more=array()) {
		global $ttH;
		
		$arr_cur = array();
		preg_match_all('/\[widget_(.*?)\]/', $cur, $matches);
		$arr_widget_call = array();
		foreach($matches[1] as $k => $v) {
			$v = trim($v);
			$v = str_replace('&nbsp;',' ',$v);
			while(strlen(strstr($v,"  ")) > 0){
				$v = str_replace('  ',' ',$v);
			}
		
			$tmp = explode(' ',$v);
			$arr_widget_call[$k] = array();
			$arr_widget_call[$k]['text_replace'] = $matches[0][$k];
			foreach($tmp as $k1 => $v1) {
				if($k1 == 0) {
					$arr_widget_call[$k]['name_action'] = $v1;
				} else {
					$tmp1 = explode('=', $v1);
					$arr_widget_call[$k][$tmp1[0]] = $tmp1[1];
					$arr_widget_call[$k][$tmp1[0]] = str_replace('"','',$arr_widget_call[$k][$tmp1[0]]);
					$arr_widget_call[$k][$tmp1[0]] = str_replace("'",'',$arr_widget_call[$k][$tmp1[0]]);
				}
			}
			$arr_cur[] = $arr_widget_call[$k]['name_action'];
		}
		/*$arr_widget_tmp = $arr_widget_call;
		$arr_widget_call = array();
		foreach($arr_widget_tmp as $k => $v) {
			$arr_widget_call[$v['name_action']] = $v;
		}*/
		$cur = (count($arr_cur) > 0) ? implode(',',$arr_cur) : '';
		
		$ttH->func->include_js($ttH->dir_js.'tokeninput/src/jquery.tokeninput.js');
		$ttH->func->include_css($ttH->dir_js.'tokeninput/styles/token-input.css');
		$ttH->func->include_css($ttH->dir_js.'tokeninput/styles/token-input-facebook.css');
		$select_name = str_replace('[]','',$select_name);
		
		$output = '<input name="'.$select_name.'_tmp" id="'.$select_name.'_tmp" type="text" size="50" maxlength="150" value="" class="form-control">';
		$output .= '<script type="text/javascript">
		$(document).ready(function() {
			$("#'.$select_name.'_tmp").tokenInput("'.$ttH->admin->get_link_admin_ajax ('common', 'common', 'list_widget').'", {
				method: "POST",
				//preventDuplicates: true,
				queryParam: "text_search",
				tokenValue: "id",
				propertyToSearch: "title",
				onAdd: function(){sort_token_input(\'.token-input-list\');},
				onDelete: function(){sort_token_input(\'.token-input-list\');},';
				
				/*$order_field = $cur;
				$tmp = explode(',',$cur);
				foreach($tmp as $k => $v) {
					$tmp[$k] = "'".$v."'";
				}
				$order_field = implode(',',$tmp);*/
				
				$data_widget = $ttH->load_data->data_table (
					'widget', 
					'name_action', 
					'*', 
					" is_show=1 and find_in_set(name_action,'".$cur."') ", 
					array('arr_title')
				);
				
				if($num = count($arr_widget_call)){
					$i = 0;
					$output .= 'prePopulate: [';
					foreach ($arr_widget_call as $call_key => $call_row)	{
						if(!isset($data_widget[$call_row['name_action']])) {
							continue;
						}
						$row = $data_widget[$call_row['name_action']];
						$i++;
						$row["id"] = $row["name_action"];
						//$row["arr_title"] = unserialize($row["arr_title"]);
						$row["title"] = $row["arr_title"][$ttH->conf['lang_cur']];
						$row["picture"] = $ttH->func->get_src_mod('', 50, 50, 1, 1);
						$row["option"] = '';
						$path = $ttH->conf['rootpath_web'].'widget'.DS.$row['name_action'];
						if ($dir = opendir($path)) {
							if(file_exists($path.DS.'thumbnail.png')) {
							$row["picture"] = $ttH->conf['rooturl_web'].'widget/'.$row['name_action'].'/thumbnail.png';
							}
						
							$path_wconf = $path.DS.'config.php';
							if(file_exists($path_wconf)) {
								require_once ($path_wconf); 
								if(isset($conf['parametric']) && is_array($conf['parametric'])) {
									foreach($conf['parametric'] as $k => $v) {
										if(is_array($v)) {
											$k = str_replace(array('[',']'),'',$k);
											$k_title = $k;
											$is_muti = 0;
											$ext = '';
											if(substr($k, 0, 4) == 'arr_') {
												//$k_title = substr($k, 0, strlen($k)-2);
												$is_muti = 1;
												$ext .= ' multiple="multiple"';
											}
											$ext .= ' class="form-control input-sm"';
											$ext .= ' data-name="'.$k.'"';
											$row["option"] .= $ttH->html->select ($k.'-'.rand(0,9999), $v, (isset($call_row[$k]) ? $call_row[$k] : ''), $ext);
										} else {
											$row["option"] .= '<div class="input-group">
												<span class="input-group-addon">'.$k.':</span>
												<input type="text" data-name="'.$k.'" size="80" class="form-control input-sm" value="'.(isset($call_row[$k]) ? $call_row[$k] : $v).'"/>
											</div>';
										}
									}									
								}
							}
						}
						
						$output .= json_encode($row);
						$output .= ($i < $num) ? ',' : '';
					}
					$output .= '],';
				}
				
		$output .= '
				resultsFormatter: function(item){ return "<li><table width=\'100%\' border=\'0\' cellspacing=\'0\' cellpadding=\'0\'><tr><td width=\'50\'><img src=\'" + item.picture + "\' title=\'" + item.title + "\' width=\'50\' /></td><td><div style=\'display: inline-block; padding-left: 10px;\'><div class=\'title\'>" + item.title + "</div><div class=\'option\'>" + item.option + "</div></div></td></tr></table></li>" },
				tokenFormatter: function(item){ return "<li style=\'cursor:move;\'><table width=\'100%\' border=\'0\' cellspacing=\'0\' cellpadding=\'0\'><tr><td width=\'50\'><img src=\'" + item.picture + "\' title=\'" + item.title + "\' width=\'50\' /></td><td><div style=\'display: inline-block; padding-left: 10px;\'><div class=\'title\'>" + item.title + "</div><div class=\'option\'>" + item.option + "</div></div></td></tr></table><input name=\''.$select_name.'[]\' type=\'hidden\' data-value=\'" + item.id + "\' value=\'[widget_" + item.id + "]\' /></li>" },
				hintText: "Nhập từ khóa để tìm tin",
				noResultsText: "Không tìm thấy kết quả nào",
				searchingText: "Đang xử lý..."
			});
			sort_token_input(\'.token-input-list\');
			widget_option(\'.token-input-token\');
		});
		</script>';
		
		return $output;
	}
	
	function list_sidebar ($select_name="sidebar", $cur="", $ext="",$arr_more=array()) {
		global $ttH;
		
		$data = $ttH->load_data->data_table (
			"sidebar", 
			"sidebar_id", 
			"sidebar_id, title", 
			"is_show=1 order by show_order desc, date_create asc");
		
		return $ttH->html->select ($select_name, $data, $cur, $ext,$arr_more);
	}
	
	function item_code ($item_code_key='', $item_code='', $item_id=0) {
		global $ttH;
		
		$output = $ttH->func->random_str(6, 'u');
		
		if($item_code && $item_id > 0) {
			$sql_check = "select ".$this->dbtable_id.", ".$item_code_key." from ".$this->dbtable." where ".$item_code_key."='".$item_code."' and ".$this->dbtable_id."!='".$item_id."'";
			$result_check = $ttH->db->query($sql_check);
			if ($ttH->db->num_rows($result_check)){
				$item_code = $item_id.$ttH->func->random_str(5, 'u');
				return $this->item_code ($item_code_key='', $item_code, $item_id);
			} else {
				return $item_code;
			}
		}
		
		$query = "select ".$this->dbtable_id."  
							from ".$this->dbtable." 
							order by ".$this->dbtable_id." desc 
							limit 0,1";
		//echo $query;
		$result = $ttH->db->query($query);
		if($row = $ttH->db->fetch_row($result)){
			$item_code = ($row[$this->dbtable_id]+1).$ttH->func->random_str(5, 'u');
			return $this->item_code ($item_code_key='', $item_code, $row[$this->dbtable_id]);
		}
		
		return $output;
	}
	
  // end class
}
?>