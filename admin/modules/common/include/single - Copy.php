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
		
		if(!isset($this->arr_element)) {
			$this->arr_element = array();
		}
		if(!isset($this->path_tbl)) {
			$this->path_tbl = $ttH->path_html.$this->modules_include.DS.$this->tbl_name.".tpl";
		}
		
		$ttH->func->load_language_admin($this->modules);
		$ttH->temp_act = new XTemplate($this->path_tbl);
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		require_once ("modules/".$this->modules_include."/".$this->modules_include."_func.php");
		$this->func = new commonFunc;
		
		$this->dir = $this->func->create_folder(date("Y_m"));
		
		$data["link_manage"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "manage");
		$data["link_manage_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "manage_trash");
		$data["link_add"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "add");
		
		$this->sub = (isset($ttH->input["sub"])) ? $ttH->input["sub"] : "manage";
		switch ($this->sub) {
			case "add":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->action."_".$this->sub];
				$data["main"] = $this->do_add();
				break;
			case "edit":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->action."_".$this->sub];
				$data["main"] = $this->do_edit();
				break;
			case "manage_trash":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->action."_".$this->sub];
				$data["main"] = $this->do_manage("trash");
				break;
			default:
				$this->sub = "manage";
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->action."_manage"];
				$data["main"] = $this->do_manage();
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
	function _form_input($data)
	{
		global $ttH;
		
		foreach($this->arr_element as $k => $v) {
			if(!isset($v['form_type'])) {
				continue;
			}
			$form_type = (isset($v['form_type'])) ? $v['form_type'] : '';
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
						$data[$k] = str_replace('"','\"',$data[$k]);
						eval('$data["'.$k.'"] = $this->func->list_'.$k.' (
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
				default:
					if(!$form_type) {
						break;
					}
					$tmp_temp = 'input_text';
					if($form_type == 'price'){
						$tmp_temp = 'input_price';
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
					'form_col' => $form_col,
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
	
	//-----------
	function do_add()
	{
		global $ttH;
		
		$data = array();
		$err = "";
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			foreach($this->arr_element as $k => $v) {
				if($err) {
					break;
				}
				$required = (isset($v['required'])) ? $v['required'] : false;
				if($required === false) {
					continue;
				}
				$err = $this->func->_required($k, $v);
			}
			
			if(empty($err)){
				$col = array();
				
				foreach($this->arr_element as $k => $v) {
					/*$of_lang = (isset($v['of_lang'])) ? true : false;
					if($of_lang == true) {
						continue;
					}*/
					if($k == 'lang') {
						continue;
					}
					$col[$k] = $this->func->_inputdb($k, $v);
				}
				/*print_arr($ttH->post);
				print_arr($col);
				die();*/
				$i = 0;
				foreach($ttH->data["lang"] as $lang_id => $lang_row){
					$i++;
					
					if(array_key_exists('lang', $this->arr_element)) {
						$col["lang"] = $lang_row["name"];
					} elseif($i > 1) {
						break;
					}
					
					$ok = $ttH->db->do_insert($this->dbtable, $col);	
					if($ok && (!isset($col[$this->dbtable_id]))){
						$item_id = $ttH->db->insertid();
						$col[$this->dbtable_id] = $item_id;
						
						$col_l = array();
						$col_l[$this->dbtable_id] = $item_id;
						
						$ttH->db->do_update($this->dbtable, $col_l, " id='".$item_id."'");	// update current
					}
				}
				if($ok){					
					$data = array();					
					$err = $ttH->html->html_alert ($ttH->lang["global"]["add_success"], "success");
				}else{
					$data = $ttH->post;
					$err = $ttH->html->html_alert ($ttH->lang["global"]["add_false"], "error");	
				}
			}else{
				$data = $ttH->post;
			}
		}
		
		$data["err"] = $err;
		
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
		
		return $this->_form_input($data);
	}
	
	//-----------
	function do_edit()
	{
		global $ttH;
		
		$err = "";
		
		$item_id = $ttH->input["id"];
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			foreach($this->arr_element as $k => $v) {
				if($err) {
					break;
				}
				$required = (isset($v['required'])) ? $v['required'] : false;
				if($required === false) {
					continue;
				}
				$err = $this->func->_required($k, $v);
			}
			
			if(empty($err)){
				$col = array();
				
				foreach($this->arr_element as $k => $v) {
					$of_lang = (isset($v['of_lang'])) ? true : false;
					if($of_lang == true) {
						continue;
					}
					if($k == 'lang') {
						continue;
					}
					if(isset($v['only']) && $v['only']!=$this->sub) {
						continue;
					}
					$col[$k] = $this->func->_inputdb($k, $v);
				}
				
				/*print_arr($ttH->post);
				print_arr($col);
				die();*/
				
				$ok = $ttH->db->do_update($this->dbtable, $col, " ".$this->dbtable_id."='".$item_id."'");	
				if($ok){
					$col_l = array();
					
					foreach($this->arr_element as $k => $v) {
						$of_lang = (isset($v['of_lang'])) ? true : false;
						if($of_lang == false) {
							continue;
						}
						if($k == 'lang') {
							continue;
						}
						$col_l[$k] = $this->func->_inputdb($k, $v);
					}
					
					$ttH->db->do_update($this->dbtable, $col_l, " ".$this->dbtable_id."='".$item_id."' and lang='".$ttH->conf["lang_cur"]."'");	
					
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_success"], "success");
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_false"], "error");	
				}
			}
		}
		
		$where = '';
		if(array_key_exists('lang', $this->arr_element)) {
			$where .= " and lang='".$ttH->conf['lang_cur']."' ";
		}
		$sql = "select * from ".$this->dbtable." 
						where ".$this->dbtable_id."='".$item_id."' 
						".$where;
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
		}
		
		$data["err"] = $err;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("id"=>$item_id));
		
		return $this->_form_input($data);
	}
	
	//-------------- 
  function do_duplicate ($list_duplicate = "")
  {
    global $ttH;
		
		if(empty($list_duplicate)){
			$ttH->html->alert ($ttH->lang["global"]["not_found_page"], $ttH->admin->get_link_admin ($this->modules, $this->action));
		}
		
		$ok = 0;
		
		$query = $ttH->db->query("select * from ".$this->dbtable." where find_in_set(".$this->dbtable_id.",'".$list_duplicate."')>0");	
		while ($row = $ttH->db->fetch_row($query)){
			$col = $row;
			$col[$this->dbtable_id] = '';
			$col["date_create"] = time();
			$col["date_update"] = time();
			$ok = $ttH->db->do_insert($this->dbtable, $col);
			$ttH->db->debug();	
			if($ok){
				$item_id = $ttH->db->insertid();
				
				$query_lang = $ttH->db->query("select * from ".$this->dbtable."_lang where ".$this->dbtable_id."='".$row[$this->dbtable_id]."'");	
				while ($row_lang = $ttH->db->fetch_row($query_lang)){
					$col_l = $row_lang;
					$col_l["id"] = '';
					$col_l[$this->dbtable_id] = $item_id;
					$col_l["friendly_link"] = $ttH->func->get_friendly_link_db ($col_l["friendly_link"], $this->dbtable.'_lang', $this->dbtable_id, $item_id, $row_lang['lang']);
					$ttH->db->do_insert($this->dbtable."_lang", $col_l);	
					$ttH->db->debug();	
				}			
			}
		}
		
    if ($ok){
      $mess = $ttH->html->html_alert($ttH->lang["global"]["duplicate_success"], "success");
    } else  {
      $mess = $ttH->html->html_alert($ttH->lang["global"]["duplicate_false"], "error");
    }
		
		return $mess;
  }
	
	//-------------- 
  function do_del ($list_del = "")
  {
    global $ttH;
		
		if(empty($list_del)){
			$ttH->html->alert ($ttH->lang["global"]["not_found_page"], $ttH->admin->get_link_admin ($this->modules, $this->action));
		}
		
		$ok = $ttH->db->delete ($this->dbtable, "find_in_set(".$this->dbtable_id.",'".$del_item."')");
	if ($ok){
		$mess = $ttH->html->html_alert($ttH->lang["global"]["del_success"], "success");
	} else  {
		$mess = $ttH->html->html_alert($ttH->lang["global"]["del_false"], "error");
	}
		
		return $mess;
  }
	
	//-----------
	function do_manage($is_show="")
	{
		global $ttH;
		
		$err = "";
		
		//update
		if (isset($ttH->input['do_action']))
		{
			$up_id = (isset($ttH->input["selected_id"])) ? $ttH->input["selected_id"] : array();
		  switch ($ttH->input["do_action"]){
				case "do_edit":
					
					$arr_show_order = (isset($ttH->post["show_order"])) ? $ttH->post["show_order"] : array();
							
					$mess = $ttH->lang['global']['edit_success'] . " ID: <strong>";
					$str_mess = "";
					for ($i = 0; $i < count($up_id); $i ++){
						$dup = array();
						$dup['show_order'] = $arr_show_order[$up_id[$i]];
						//$dup['is_focus'] = (isset($arr_is_focus[$up_id[$i]])) ? $arr_is_focus[$up_id[$i]] : 0;
						foreach($this->arr_element as $k => $v) {
							$form_type = (isset($v['form_type'])) ? $v['form_type'] : '';
							if($form_type != 'checkbox') {
								continue;
							}
							if(isset($v['muti'])) {
								continue;
							}
		
							$dup[$k] = (isset($ttH->post[$k][$up_id[$i]])) ? $ttH->post[$k][$up_id[$i]] : 0;
						}
						
						$ok = $ttH->db->do_update($this->dbtable, $dup, "".$this->dbtable_id."='".$up_id[$i]."'");
						if ($ok){
							$str_mess .= ($str_mess) ? ", " : "";
							$str_mess .= $up_id[$i];
						} else{
							$mess .= $ttH->lang["global"]['edit_false'] . " ID: <strong>" . $up_id[$i] . "</strong>";
						}
					}
					$mess .= $str_mess . "</strong>";
					$err = $ttH->html->html_alert ($mess, "success");
					break;
				case "do_duplicate":
					if(isset($ttH->input['id'])){
						$list_duplicate = $ttH->input['id'];
					}elseif(isset($ttH->post['selected_id']) && is_array($ttH->post['selected_id'])){
						$list_duplicate = @implode(',',$ttH->post['selected_id']);
					}
					$err = $this->do_duplicate ($list_duplicate);
					break;
				case "do_restore":
					$up_id = (isset($ttH->input["id"])) ? array($ttH->input["id"]) : $up_id;
					$mess = $ttH->lang['global']['restore_success'] . " ID: <strong>";
					$str_mess = "";
					for ($i = 0; $i < count($up_id); $i ++){
						$dup = array();
						$dup['is_show'] = 1;
						$ok = $ttH->db->do_update($this->dbtable, $dup, "".$this->dbtable_id."='".$up_id[$i]."'");
						if ($ok){
							$str_mess .= ($str_mess) ? ", " : "";
							$str_mess .= $up_id[$i];
						} else{
							$mess .= $ttH->lang["global"]['restore_false'] . " ID: <strong>" . $up_id[$i] . "</strong>";
						}
					}
					$mess .= $str_mess . "</strong>";
					$err = $ttH->html->html_alert ($mess, "success");
					break;
				case "do_trash":
					$up_id = (isset($ttH->input["id"])) ? array($ttH->input["id"]) : $up_id;
					$mess = $ttH->lang['global']['trash_success'] . " ID: <strong>";
					$str_mess = "";
					for ($i = 0; $i < count($up_id); $i ++){
						$dup = array();
						$dup['is_show'] = 0;
						$ok = $ttH->db->do_update($this->dbtable, $dup, "".$this->dbtable_id."='".$up_id[$i]."'");
						if ($ok){
							$str_mess .= ($str_mess) ? ", " : "";
							$str_mess .= $up_id[$i];
						} else{
							$mess .= $ttH->lang["global"]['trash_false'] . " ID: <strong>" . $up_id[$i] . "</strong>";
						}
					}
					$mess .= $str_mess . "</strong>";
					$err = $ttH->html->html_alert ($mess, "success");
					break;
				case "do_del":
					if(isset($ttH->input['id'])){
						$list_del = $ttH->input['id'];
					}elseif(isset($ttH->post['selected_id']) && is_array($ttH->post['selected_id'])){
						$list_del = @implode(',',$ttH->post['selected_id']);
					}
					$err = $this->do_del ($list_del);
					break;
		  }
		}
		$p = (isset($ttH->input["p"])) ? $ttH->input["p"] : 1;
		$search_date_begin = (isset($ttH->input["search_date_begin"])) ? $ttH->input["search_date_begin"] : "";
		$search_date_end = (isset($ttH->input["search_date_end"])) ? $ttH->input["search_date_end"] : "";
		$search_title = (isset($ttH->input["search_title"])) ? $ttH->input["search_title"] : "";
		foreach($this->arr_element as $k => $v) {
			$form_type = (isset($v['form_type'])) ? $v['form_type'] : '';
			if($form_type == 'select') {
				eval('$search_'.$k.' = (isset($ttH->input["'.$k.'"])) ? $ttH->input["'.$k.'"] : "";');
			} elseif($form_type == 'checkbox') {
				eval('$search_'.$k.' = (isset($ttH->input["'.$k.'"])) ? $ttH->input["'.$k.'"] : -1;');
			} else {
				continue;
			}
		}
		
		$where = " where 1 ";
		$ext = "";
		$is_search = 0;
		
		if(array_key_exists('lang', $this->arr_element)) {
			$where .= " and lang='".$ttH->conf['lang_cur']."' ";
		}
		
		if($is_show == "trash" ){
			$where .= " and is_show=0 ";
		}else{
			$where .= " and is_show=1 ";
		}
		
		foreach($this->arr_element as $k => $v) {
			$form_type = (isset($v['form_type'])) ? $v['form_type'] : '';
			if($form_type == 'select') {
				eval('if($search_'.$k.'){$where .= " and '.$k.'=\'$search_'.$k.'\' "; $is_search = 1;}');
			} elseif($form_type == 'checkbox') {
				eval('if($search_'.$k.' != -1){$where .= " and '.$k.'=\'$search_'.$k.'\' "; $is_search = 1;}');
			} else {
				continue;
			}
			
			
		}
		
		if($search_date_begin || $search_date_end ){
			$tmp1 = @explode("/", $search_date_begin);
			$time_begin = @mktime(0, 0, 0, $tmp1[1], $tmp1[0], $tmp1[2]);
			
			$tmp2 = @explode("/", $search_date_end);
			$time_end = @mktime(23, 59, 59, $tmp2[1], $tmp2[0], $tmp2[2]);
			
			if(array_key_exists('date_create', $this->arr_element)) {
				$where .= " and (date_create BETWEEN {$time_begin} AND {$time_end}) ";
				$ext.="&date_begin=".$search_date_begin."&date_end=".$search_date_end;
				$is_search = 1;
			}			
		}
		
		if(!empty($search_title)){
			if(array_key_exists('title', $this->arr_element)) {
				$where .=" and (".$this->dbtable_id."='$search_title' or title like '%$search_title%') ";		
			} else {
				$where .=" and ".$this->dbtable_id."='$search_title' ";		
			}				
			$ext.="&search_title=".$search_title;
			$is_search = 1;
		}
    
		$num_total = 0;
		$res_num = $ttH->db->query("select ".$this->dbtable_id." 
						from ".$this->dbtable." 
						".$where." ");
			$num_total = $ttH->db->num_rows($res_num);
		$n = ($ttH->conf["n_list"]) ? $ttH->conf["n_list"] : 30;
		$num_pages = ceil($num_total / $n);
		if ($p > $num_pages)
		  $p = $num_pages;
		if ($p < 1)
		  $p = 1;
		$start = ($p - 1) * $n;
		
		$link_action = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
		
		//Sort
		$arr_title = array(
			'id' => array(
				"title" => $ttH->lang["global"]["id"],
				"link" => $link_action."&p=".$p.$ext."&sort=".$this->dbtable_id."-desc",
				"class" => ""
			),
			"show_order" => array(
				"title" => $ttH->lang["global"]["show_order"],
				"link" => $link_action."&p=".$p.$ext."&sort=show_order-desc",
				"class" => ""
			),
			"title" => array(
				"title" => $ttH->lang["global"]["title"],
				"link" => $link_action."&p=".$p.$ext."&sort=title-desc",
				"class" => ""
			),
			"date_create" => array(
				"title" => $ttH->lang["global"]["date_create"],
				"link" => $link_action."&p=".$p.$ext."&sort=date_create-desc",
				"class" => ""
			)
		);
		$sort = (isset($ttH->input["sort"])) ? $ttH->input["sort"] : "";
		if($sort)
		{
			$arr_allow_sort = array(
				1 => "asc",
				2 => "desc"
			);
			$tmp = explode("-",$sort);
			if (array_key_exists($tmp[0],$arr_title) && in_array($tmp[1],$arr_allow_sort)) {
				$order_tmp = ($tmp[0] == $this->dbtable_id) ? "a.".$this->dbtable_id : $tmp[0];
				$where .= " order by ".$order_tmp." ".$tmp[1];
				
				$arr_title[$tmp[0]]["class"] = $tmp[1];
				$arr_title[$tmp[0]]["link"] = $link_action."&p=".$p.$ext."&sort=".$tmp[0]."-".$arr_allow_sort[(3-(array_search($tmp[1],$arr_allow_sort)))];				
			}
			else
			{
				$sort = "";
			}
		}
		
		if($sort == "")
		{
			$where .= " order by date_create DESC";
		}
		//End sort
		
		//Title row
		foreach($arr_title as $k => $v)
		{
			$class = ($v["class"]) ? " class='".$v["class"]."'" : "";
			$data["f_".$k] = '<a href="'.$v["link"].'" '.$class.'>'.$v["title"].'</a>';
		}
		//End title row
		
    $sql = "select * from ".$this->dbtable." 
						".$where." 
						limit $start,$n";
    //echo $sql; die();
		
		$nav = $ttH->admin->admin_paginate ($link_action, $num_total, $n, $ext, $p);
		
		$result = $ttH->db->query($sql);
    $i = 0;
    $html_row = "";
    if ($num = $ttH->db->num_rows($result))
		{
			while ($row = $ttH->db->fetch_row($result)) 
			{
				$i++;
				
				$row["link_duplicate"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_duplicate","id"=>$row[$this->dbtable_id]));
				$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "edit", array("id"=>$row[$this->dbtable_id]));
				$row["link_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_trash","id"=>$row[$this->dbtable_id]));
				$row["link_restore"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_restore","id"=>$row[$this->dbtable_id]));
				$row["link_del"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row[$this->dbtable_id]));
				
				if(!empty($row["picture"])){
					$row["picture"] = '<a class="fancybox-effects-a" title="'.$row["picture"].'" href="'.DIR_UPLOAD.$row["picture"].'">
						'.$ttH->func->get_pic_mod($row["picture"], 50, 50, '', 1, 0, array('fix_width'=>1)).'
					</a>';
				}
				
				$row['item_id'] = $row[$this->dbtable_id];
				$row['html_checkbox'] = '';
				foreach($this->arr_element as $k => $v) {
					$form_type = (isset($v['form_type'])) ? $v['form_type'] : '';
					if($form_type != 'checkbox') {
						continue;
					}
					if(isset($v['muti'])) {
						continue;
					}

					$row[$k.'_checked'] = ($row[$k] == 1) ? ' checked="checked"' : '';
					$row['html_checkbox'] .= '<div><label for="'.$k.'_'.$row[$this->dbtable_id].'"><strong>'.(isset($ttH->lang[$this->modules][$k]) ? $ttH->lang[$this->modules][$k] : (isset($ttH->lang['global'][$k]) ? $ttH->lang['global'][$k] : $k)).':</strong></label> <input type="checkbox" value="1" id="'.$k.'_'.$row[$this->dbtable_id].'" name="'.$k.'['.$row[$this->dbtable_id].']" '.$row[$k.'_checked'].' onchange="do_check(\''.$row[$this->dbtable_id].'\')" /></div>';
				}
				
				//$row['is_focus_checked'] = ($row['is_focus'] == 1) ? ' checked="checked"' : '';
				$row['date_create'] = date('d/m/Y',$row['date_create']);
				
				$ttH->temp_act->assign('row', $row);
				if($is_show == "trash"){
					$ttH->temp_act->parse("manage.row_item.row_button_manage");
				}else{
					$ttH->temp_act->parse("manage.row_item.row_button_trash");
				}
				$ttH->temp_act->parse("manage.row_item");
			}
		}
		else
		{
			$ttH->temp_act->assign('row', array("mess"=>$ttH->lang["global"]["no_have_data"]));
			$ttH->temp_act->parse("manage.row_empty");
		}
		
		$data['html_row'] = $html_row;
		$data['nav'] = $nav;
		$data['err'] = $err;
		
		$data['link_action_search'] = $link_action;
		$data['link_action'] = $link_action."&p=".$p.$ext;
		
		$data['search_date_begin'] = $search_date_begin;
		$data['search_date_end'] = $search_date_end;
		$data['search_title'] = $search_title;
		$data['form_search_class'] = ($is_search == 1) ? ' expand' : '';
		
		foreach($this->arr_element as $k => $v) {
			$form_type = (isset($v['form_type'])) ? $v['form_type'] : '';
			if(!in_array($form_type, array('select', 'checkbox'))) {
				continue;
			}
			$title = (isset($ttH->lang[$this->modules][$k]) ? $ttH->lang[$this->modules][$k] : (isset($ttH->lang['global'][$k]) ? $ttH->lang['global'][$k] : $k));
			$v['data'] = (isset($v['data']) && is_array($v['data'])) ? $v['data'] : array(-1 => 'Chọn ---', 0 => 'Không', 1 => 'Có');
			
			eval('$data["'.$k.'"] = $search_'.$k.';');
			$ttH->temp_act->assign('row', array(
				'title' => (isset($ttH->lang[$this->modules][$k]) ? $ttH->lang[$this->modules][$k] : (isset($ttH->lang['global'][$k]) ? $ttH->lang['global'][$k] : $k)),
				'content' => $this->func->_select($k, $v, $data)
			));
			$ttH->temp_act->parse("manage.element");
		}
		
		if($is_show == "trash"){
			$ttH->temp_act->parse("manage.button_manage");
		}else{
			$ttH->temp_act->parse("manage.button_trash");
		}
		
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("manage");
		return $ttH->temp_act->text("manage");
	}

  // end class
}
?>