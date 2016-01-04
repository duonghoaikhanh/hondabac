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
$nts = new sMain_sub();

class sMain_sub extends sMain {
	var $modules_include = "common";
	//var $action = "receipt";
	//var $sub = "manage";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain_sub () {
		global $ttH;
		//echo "Run";die();
		if(!isset($this->arr_element)) {
			$this->arr_element = array();
		}
		if(!isset($this->arr_element_seo)) {
			$this->arr_element_seo = array();
		}
		if(!isset($this->path_tbl)) {
			//echo  $ttH->path_html.$this->modules_include.DS.$this->tbl_name.".tpl";die();
			//echo $ttH->tbl_name;die();
			$this->path_tbl = isset($this->tbl_name) ? $ttH->path_html.$this->modules_include.DS.$this->tbl_name.".tpl" :$ttH->path_html.$this->modules_include.DS."user_setting.tpl";
		}

		$ttH->func->load_language_admin($this->modules);
		$ttH->temp_act = new XTemplate($this->path_tbl);
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);

		require_once ("modules/".$this->modules_include."/".$this->modules_include."_func.php");
		$this->func = new commonFunc;
		$this->dir = $this->func->create_folder(date("Y_m"));
		//echo $this->dbtable;die();
		if(!isset($this->dbtable)){
			$this->dbtable ='user_setting';
		}
		$sql_struc = "show fields from ".$this->dbtable;
    $result_struc = $ttH->db->query($sql_struc);
    if ($arr_struc_tmp = $ttH->db->get_array($result_struc)){
			$arr_struc = array();
			foreach($arr_struc_tmp as $v) {
				$arr_struc[] = $v['Field'];
			}

			foreach($this->arr_element as $k => $v) {
				if(!in_array($k, $arr_struc)) {
					$this->func->_alterdb($k, $v);
				}
			}
			foreach($this->arr_element_seo as $k => $v) {
				if(!in_array($k, $arr_struc)) {
					$this->func->_alterdb($k, $v);
				}
			}
		}

		$data["link_manage"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "manage");
		$data["link_seo"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "seo");
		$data["link_add"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "add");


		$this->sub = (isset($ttH->input["sub"])) ? $ttH->input["sub"] : "manage";
		switch ($this->sub) {
			case "seo":
				$ttH->conf["page_title"] = $ttH->lang['global']['orientation_search_engine'];
				$data["main"] = $this->do_seo();
				break;
			default:
				$this->sub = "manage";
				$ttH->conf["page_title"] = $ttH->lang[$this->modules]["setting"];
				$data["main"] = $this->do_setting();
				break;
		}
		$data["class"] = array();
		$data["class"][$this->sub] = ' class="active"';
		$data["page_title"] = $ttH->conf["page_title"];

		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("main");
		$ttH->output .=  $ttH->temp_act->text("main");
  }

	//-----------
	function _form_input($arr_element, $data)
	{
		global $ttH;
		foreach($arr_element as $k => $v) {
			if(!isset($v['form_type'])) {
				continue;
			}
			$form_type = (isset($v['form_type'])) ? $v['form_type'] : '';
			$html_before = '';
			$form_col = 6;
			$use_title = true;
			
			if(isset($v['before']['html_title'])) {
				$tmp = $v['before']['html_title'];
				$html_before = $ttH->html->temp_box('html_title', array(
					'title' => (isset($ttH->lang[$this->modules][$tmp]) ? $ttH->lang[$this->modules][$tmp] : (isset($ttH->lang['global'][$tmp]) ? $ttH->lang['global'][$tmp] : $tmp))
				));
			}
			
			switch ($form_type) {
				case "picture":
					$data[$k] = $ttH->admin->get_form_pic ($k, (isset($data[$k]) ? $data[$k] : ''), $this->folder_upload, $this->dir);
					break;
				case "file":
					$data[$k] = $ttH->admin->get_form_file ($k, (isset($data[$k]) ? $data[$k] : ''), $this->folder_upload, $this->dir);
					break;
				case "select":
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
					} elseif(isset($v['select_func']) && $v['select_func']) {
						eval('$data["'.$k.'"] = $this->func->'.$v['select_func'].' (
						"'.(isset($tmp["select_muti"]) ? $k.'[]' : $k).'", 
						"'.(isset($data[$k]) ? $data[$k] : '').'", 
						" class=\'form-control\'", 
						$tmp);');
					}else {
						eval('$data["'.$k.'"] = $this->func->list_'.$k.' (
						"'.(isset($tmp["select_muti"]) ? $k.'[]' : $k).'", 
						"'.(isset($data[$k]) ? $data[$k] : '').'", 
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
					$html_before = $ttH->html->temp_box('html_title', array(
						'title' => (isset($ttH->lang[$this->modules][$tmp]) ? $ttH->lang[$this->modules][$tmp] : (isset($ttH->lang['global'][$tmp]) ? $ttH->lang['global'][$tmp] : $tmp))
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
					if($form_type == 'hidden'){
						$use_title = false;
						$tmp_temp = 'input_hidden';
					}elseif($form_type == 'number'){
						$tmp_temp = 'input_number';
					}elseif($form_type == 'float'){
						$tmp_temp = 'input_float';
					}elseif($form_type == 'price'){
						$tmp_temp = 'input_price';
					}elseif($form_type == 'color'){
						$tmp_temp = 'input_color';
					}elseif($form_type == 'video_youtube'){
						$tmp_temp = 'video_youtube';
					}
					$data[$k] = $ttH->html->temp_box($tmp_temp, array(
						'key' => $k,
						'content' => (isset($data[$k]) ? $data[$k] : ''),
						'ext' => ($form_type == 'link') ? '<p>Ví dụ: imsvietnamese.com, www.imsvietnamese.com, http://imsvietnamese</p>' : ''
					));
					break;
			}
			
			$title = (in_array($form_type, array('friendly_link', 'meta_title', 'meta_key', 'meta_desc')) && isset($ttH->lang['global'][$form_type])) ? $ttH->lang['global'][$form_type] : $k;
			$title = (isset($ttH->lang[$this->modules][$k]) ? $ttH->lang[$this->modules][$k] : (isset($ttH->lang['global'][$k]) ? $ttH->lang['global'][$k] : $title));
			if(isset($data[$k])) {
				$ttH->temp_act->assign('row', array(
					'before' => $html_before,
					'form_col' => $form_col,
					'key' => $k,
					'title' => $title,
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
	
	//-----------
	function _update($arr_element)
	{
		global $ttH;
		
		$result = $ttH->db->query("select * from ".$this->dbtable." where lang='".$ttH->conf['lang_cur']."' limit 0,1");
		$data = $ttH->db->fetch_row($result) ;
		if (isset($ttH->post['do_submit'])) {
      $dup = array();
      $dup_lang = array();
			foreach ($data as $key => $value) {
				if ($key != $this->dbtable_id && isset($ttH->post[$key]) && array_key_exists($key,$arr_element)) {
					
					$tmp = $this->func->_inputdb($key, $arr_element[$key]);
					
					$form_type = (isset($arr_element[$key]['form_type'])) ? $arr_element[$key]['form_type'] : '';
					if($form_type == 'friendly_link'){
						$tmp = $ttH->func->get_friendly_link ($ttH->post[$key]);
						
						/*$arr_more = array();
						if(array_key_exists($key,$arr_action)) {
							$arr_more['action'] = $arr_action[$key];
						} else {
							$tmp = $key.'))';
							$arr_more['action'] = str_replace('_link))','',$tmp);
						}
						
						$tmp = $ttH->func->get_friendly_link_db (
							$ttH->post[$key], 
							$this->dbtable, 
							$this->dbtable_id, 
							$key, 
							$ttH->conf['lang_cur'], 
							$arr_more
						);*/
					}
					
					if(isset($arr_element[$key]['of_lang']) && $arr_element[$key]['of_lang'] == true) {
						$dup_lang[$key] = $tmp;
					} else {
						$dup[$key] = $tmp;
					}
				}
			}
			
			//print_arr($dup_lang); die();
			$ok = 0;
			if(count($dup)) {
				$ok = $ttH->db->do_update($this->dbtable, $dup);	
			}
			if(count($dup_lang)) {
				$ok = $ttH->db->do_update($this->dbtable, $dup_lang, $this->dbtable_id."='".$data[$this->dbtable_id]."' and lang='".$ttH->conf['lang_cur']."'");	
			}			
			if($ok){
				$data = array_merge($dup, $dup_lang);
				$data['err'] = $ttH->html->html_alert($ttH->lang["global"]["edit_success"], "success");
			} else {
				$data['err'] = $ttH->html->html_alert ($ttH->lang["global"]["edit_false"], "error");	
			}
		}

    return $data;
	}
	
	//-----------
	function do_setting()
	{
		global $ttH;
		
		//update
		$data = $this->_update($this->arr_element);
		
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action);
		
		return $this->_form_input($this->arr_element, $data);
	}
	
	//-----------
	function do_seo()
	{
		global $ttH;
		
		//update
		$data = $this->_update($this->arr_element_seo);
		
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, 'seo');
		
		return $this->_form_input($this->arr_element_seo, $data);
	}

  // end class
}
?>