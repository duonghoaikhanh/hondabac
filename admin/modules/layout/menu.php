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
$nts = new sMain();

class sMain
{
	var $modules = "layout";
	var $action = "menu";
	var $sub = "manage";
	var $cur_group = "menu_header";
	var $folder_upload = "layout";
	var $dir = "";
	var $dbtable = "menu";
	var $dbtable_id = "menu_id";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		$ttH->func->load_language_admin($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS.$this->action.".tpl");
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		$ttH->func->include_css($ttH->dir_css_global.'excolor-master/css/excolor.css');
		$ttH->func->include_js($ttH->dir_js.'excolor-master/prettify.js');
		$ttH->func->include_js($ttH->dir_js.'excolor-master/jquery.excolor.js');
		$ttH->func->include_js_content("
			jQuery(document).ready( function($) {
				$('input.color_picker').excolor({
					root_path: '".$ttH->dir_css_global."excolor-master/img/'
				});
			});
		");
		
		include ($this->modules."_func.php");
		load_setting ();
		
		$this->dir = create_folder(date("Y_m"));
		
		$this->cur_group = (isset($ttH->input["group_id"]) && array_key_exists($ttH->input["group_id"], $ttH->data["menu_group"])) ? $ttH->input["group_id"] : $this->cur_group;
		$data["link_manage"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "manage");
		$data["link_manage_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "manage_trash");
		$data["link_add"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "add", array('group_id' => $this->cur_group));
		
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
		
		$arr_isset = array('group_id','parent_id','link_type','target');
		foreach($arr_isset as $tmp) {
			$data[$tmp] = (isset($data[$tmp])) ? $data[$tmp] : '';
		}
		$data['show_mod'] = (isset($data['show_mod'])) ? @implode(',',$data['show_mod']) : '';
		
		$data["list_group"] = list_group ("group_id", $this->cur_group, " class=\"form-control\" onchange=\"window.location.href='".$data["link_action"]."&group_id='+this.value;\"");
		//$data['group_name'] = $ttH->data["menu_group"][$this->cur_group];
		$data["list_menu"] = list_menu ($this->cur_group, "parent_id", $data['parent_id'], " class=\"form-control\"", array("title" => $ttH->lang['global']['select_title']));
		$data["list_link_type"] = $ttH->admin->list_link_type ("link_type", $data['link_type'], " class=\"form-control\"");
		$data["list_target"] = $ttH->admin->list_target ("target", $data['target'], " class=\"form-control\"");
		$data["list_module"] = list_module ("show_mod[]", $data['show_mod'], " class=\"form-control\"", array('title' => $ttH->lang["global"]["select_all"]));
		
		//$data["html_short"] = $ttH->editor->load_editor ("short", "short", $data['short'], "", "mini", array("folder_up" => $this->folder_upload, "fldr" => $this->dir));
		
		//$data['picture'] = $ttH->admin->get_form_pic ('picture', (isset($data['picture']) ? $data['picture'] : ''), $this->folder_upload, $this->dir);
		
		/*$k = 'color';
		$data[$k] = $ttH->html->temp_box('input_color', array(
			'key' => $k,
			'content' => (isset($data[$k]) ? $data[$k] : '')
		));*/
		
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
			
			$name_action = $ttH->func->fix_name_action ($ttH->post["name_action"]);
			
			if(empty($ttH->post["title"]))
				$err = $ttH->html->html_alert ($ttH->lang["global"]["err_invalid_title"], "error");	
			
			if(empty($err)){
				$col = array();
				$col["menu_id"] = 0;
				$col["group_id"] = $this->cur_group;
				$col["parent_id"] = $ttH->post["parent_id"];
				$col["name_action"] = $name_action;
				$col["target"] = $ttH->post["target"];
				//$col["picture"] = (isset($ttH->post['picture'])) ? $ttH->func->get_input_pic ($ttH->post['picture']) : '';
				//$col["color"] = (isset($ttH->post['color'])) ? $ttH->post['color'] : '';
				$col["title"] = $ttH->post["title"];
				//$col["short"] = $ttH->func->input_editor($ttH->post["short"]);
				$col["link_type"] = $ttH->post["link_type"];
				$col["link"] = $ttH->post["link"];
				$col["show_mod"] = (isset($ttH->post["show_mod"])) ? get_input_show ($ttH->post["show_mod"]) : "";
				$col["show_act"] = (isset($ttH->post["show_act"])) ? get_input_show ($ttH->post["show_act"]) : "";
				$col["show_order"] = 0;
				$col["is_show"] = 1;
				$col["date_create"] = time();
				$col["date_update"] = time();
				$i = 0;
				foreach($ttH->data["lang"] as $lang_id => $lang_row){
					$i++;
					$col["lang"] = $lang_row["name"];
					$ok = $ttH->db->do_insert("menu", $col);	
					if($ok && $col["menu_id"] == 0){
						$menu_id = $ttH->db->insertid();
						$col["menu_id"] = $menu_id;
						
						$col_l = array();
						$col_l["menu_id"] = $menu_id;
						
						$ttH->db->do_update("menu", $col_l, " id='".$menu_id."'");	// update current
					}
				}				
				
				if($ok){
					
					//update group_nav
					$col = array();
					$col["menu_nav"] = get_menu_nav ($ttH->post["parent_id"], $menu_id);
					$col["menu_level"] = substr_count($col['menu_nav'],',') + 1;
					$ok = $ttH->db->do_update("menu", $col, " menu_id='".$menu_id."'");	
					if($ok) {
						built_menu_nav_sub ($menu_id, $col["menu_nav"]);
					}
					
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
		
		$menu_id = $ttH->input["id"];
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			$name_action = $ttH->func->fix_name_action ($ttH->post["name_action"]);
			
			if(empty($err) && empty($ttH->post["title"]))
				$err = $ttH->html->html_alert ($ttH->lang["global"]["err_invalid_title"], "error");	
			
			if(empty($err)){
				$col = array();
				$col["menu_nav"] = get_menu_nav ($ttH->post["parent_id"], $menu_id);
				$col["menu_level"] = substr_count($col['menu_nav'],',') + 1;
				$col["parent_id"] = $ttH->post["parent_id"];
				$col["name_action"] = $name_action;
				$col["target"] = $ttH->post["target"];
				//$col["picture"] = (isset($ttH->post['picture'])) ? $ttH->func->get_input_pic ($ttH->post['picture']) : '';
				//$col["color"] = (isset($ttH->post['color'])) ? $ttH->post['color'] : '';
				$col["show_mod"] = (isset($ttH->post["show_mod"])) ? get_input_show ($ttH->post["show_mod"]) : "";
				$col["show_act"] = (isset($ttH->post["show_act"])) ? get_input_show ($ttH->post["show_act"]) : "";
				$col["date_update"] = time();
				$ok = $ttH->db->do_update("menu", $col, " menu_id='".$menu_id."'");	
				if($ok){
					$col_l = array();
					$col_l["title"] = $ttH->post["title"];
					//$col_l["short"] = $ttH->func->input_editor($ttH->post["short"]);
					$col_l["link_type"] = $ttH->post["link_type"];
					$col_l["link"] = $ttH->post["link"];
					
					$ttH->db->do_update("menu", $col_l, " menu_id='".$menu_id."' and lang='".$ttH->conf["lang_cur"]."'");	
					
					built_menu_nav_sub ($menu_id, $col["menu_nav"]);
					
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_success"], "success");
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_false"], "error");	
				}
			}
		}
		
		$sql = "select * from menu 
						where lang='".$ttH->conf['lang_cur']."' 
						and menu_id=" . $menu_id;
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
		} else {
			$ttH->html->alert ($ttH->lang["global"]["not_found_page"], $ttH->admin->get_link_admin ($this->modules, $this->action));
		}
		
		$data["err"] = $err;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("id"=>$menu_id));
		
		return $this->_form_input($data);
	}
	
	//-------------- 
  function do_del ($list_del = "")
  {
    global $ttH;
		
		if(empty($list_del)){
			$ttH->html->alert ($ttH->lang["global"]["not_found_page"], $ttH->admin->get_link_admin ($this->modules, $this->action));
		}
		$del_item = "";
		
		$where = "";
		$arr_del = $list_del ? explode(',', $list_del) : array();
		foreach($arr_del as $del_id) {
			$where .= ($where) ? " or " : " where";
			$where .= " find_in_set('".$del_id."', menu_nav)";
		}
		
		$query = $ttH->db->query("select menu_id from menu ".$where);	
		while ($row = $ttH->db->fetch_row($query)){
			$del_item .= ($del_item) ? "," : "";
			$del_item .= $row["menu_id"];
		}
		
		$ok = $ttH->db->delete ("menu", "find_in_set(menu_id,'".$del_item."')");
    if ($ok){
      $mess = $ttH->html->html_alert($ttH->lang["global"]["del_success"], "success");
    } else  {
      $mess = $ttH->html->html_alert($ttH->lang["global"]["del_false"], "error");
    }
		
		return $mess;
  }
	
	//-----------
	function manage_row($row, $is_show='')
	{
		global $ttH;
		
		$output = '';
		
		$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "edit", array("id"=>$row['menu_id']));
		$row["link_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_trash","id"=>$row['menu_id']));
		$row["link_restore"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_restore","id"=>$row['menu_id']));
		$row["link_del"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row['menu_id']));
		
		$row["list_auto_sub"] = list_auto_sub ("auto_sub[".$row["menu_id"]."]", $row["auto_sub"], " class=\"form-control\"  onchange=\"do_check (".$row["menu_id"].")\"");
		$row['lock_title_checked'] = ($row['lock_title'] == 1) ? ' checked="checked"' : '';
		
		$ttH->temp_act->assign('row', $row);
		if($is_show == "trash"){
			$ttH->temp_act->reset("manage.row_item.row_button_manage");
			$ttH->temp_act->parse("manage.row_item.row_button_manage");
			if($row['is_show'] == 0){
				$ttH->temp_act->parse("manage.row_item");
				$output = $ttH->temp_act->text("manage.row_item");
				$ttH->temp_act->reset("manage.row_item");
			}else{
				$row["link_edit"] = 'javascript:void(0);';
				$row["link_trash"] = 'javascript:void(0);';
				$row["link_restore"] = 'javascript:void(0);';
				$row["link_del"] = 'javascript:void(0);';
				
				$ttH->temp_act->parse("manage.row_item_no_control");
				$output = $ttH->temp_act->text("manage.row_item_no_control");
				$ttH->temp_act->reset("manage.row_item_no_control");
			}
		}else{
			$ttH->temp_act->parse("manage.row_item.row_button_trash");
			$ttH->temp_act->parse("manage.row_item");
			$output = $ttH->temp_act->text("manage.row_item");
			$ttH->temp_act->reset("manage.row_item");
		}
		return $output;
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
					$arr_auto_sub = (isset($ttH->post["auto_sub"])) ? $ttH->post["auto_sub"] : array();
					$arr_lock_title = (isset($ttH->post["lock_title"])) ? $ttH->post["lock_title"] : array();
							
					$mess = $ttH->lang['global']['edit_success'] . " ID: <strong>";
					$str_mess = "";
					for ($i = 0; $i < count($up_id); $i ++){
						$dup = array();
						$dup['show_order'] = $arr_show_order[$up_id[$i]];
						$dup['auto_sub'] = $arr_auto_sub[$up_id[$i]];
						$dup['lock_title'] = isset($arr_lock_title[$up_id[$i]]) ? $arr_lock_title[$up_id[$i]] : 0;
						$ok = $ttH->db->do_update("menu", $dup, "menu_id=" . $up_id[$i]);
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
				case "do_restore":
					$up_id = (isset($ttH->input["id"])) ? array($ttH->input["id"]) : $up_id;
					$mess = $ttH->lang['global']['restore_success'] . " ID: <strong>";
					$str_mess = "";
					for ($i = 0; $i < count($up_id); $i ++){
						$dup = array();
						$dup['is_show'] = 1;
						$ok = $ttH->db->do_update("menu", $dup, "menu_id=" . $up_id[$i]);
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
						$ok = $ttH->db->do_update("menu", $dup, "menu_id=" . $up_id[$i]);
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
		$group_id = $this->cur_group;
		$search_date_begin = (isset($ttH->input["search_date_begin"])) ? $ttH->input["search_date_begin"] : "";
		$search_date_end = (isset($ttH->input["search_date_end"])) ? $ttH->input["search_date_end"] : "";
		$search_parent_id = (isset($ttH->input["search_parent_id"])) ? $ttH->input["search_parent_id"] : 0;
		$search_show_mod = (isset($ttH->input["search_show_mod"])) ? $ttH->input["search_show_mod"] : '';
		$search_title = (isset($ttH->input["search_title"])) ? $ttH->input["search_title"] : "";
		
		$where = " ";
		$ext = "";
		$is_search = 0;
		
		if($is_show == "trash" ){
			//$where .= " and is_show=0 ";
		}else{
			$where .= " and is_show=1 ";
		}
		
		if(!empty($group_id)){
			$where .=" and group_id='".$group_id."' ";			
			$ext.="&group_id=".$group_id;
		}
		
		if($search_date_begin || $search_date_end ){
			$tmp1 = @explode("/", $search_date_begin);
			$time_begin = @mktime(0, 0, 0, $tmp1[1], $tmp1[0], $tmp1[2]);
			
			$tmp2 = @explode("/", $search_date_end);
			$time_end = @mktime(23, 59, 59, $tmp2[1], $tmp2[0], $tmp2[2]);
			
			$where.=" AND (date_create BETWEEN {$time_begin} AND {$time_end} ) ";
			$ext.="&date_begin=".$search_date_begin."&date_end=".$search_date_end;
			$is_search = 1;
		}
		
		if(!empty($search_parent_id)){
			$where .=" and parent_id='".$search_parent_id."' ";			
			$ext.="&search_parent_id=".$search_parent_id;
			$is_search = 1;
		}
		
		if(!empty($search_show_mod)){
			$where .=" and (show_mod='' or find_in_set('".$search_show_mod."',show_mod)) ";			
			$ext.="&search_show_mod=".$search_show_mod;
			$is_search = 1;
		}
		
		if(!empty($search_title)){
			$where .=" and (menu_id='$search_title' or title like '%$search_title%' or link like '%$search_title%') ";			
			$ext.="&search_title=".$search_title;
			$is_search = 1;
		}
		
		$where_root = "";		
		if($is_search == 0) {
			$where_root .= " and parent_id=0  ";
		}
    
		$num_total = 0;
		$res_num = $ttH->db->query("select menu_id 
						from menu 
						where lang='".$ttH->conf["lang_cur"]."' 
						".$where_root.$where." ");
			$num_total = $ttH->db->num_rows($res_num);
		$n = ($ttH->conf["n_list"]) ? $ttH->conf["n_list"] : 30;
		$num_menus = ceil($num_total / $n);
		if ($p > $num_menus)
		  $p = $num_menus;
		if ($p < 1)
		  $p = 1;
		$start = ($p - 1) * $n;
		
		$link_action = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
		
		//Sort
		$arr_title = array(
			"name_action" => array(
				"title" => $ttH->lang["global"]["name_action"],
				"link" => $link_action."&p=".$p.$ext."&sort=name_action-desc",
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
			"link" => array(
				"title" => $ttH->lang["global"]["link"],
				"link" => $link_action."&p=".$p.$ext."&sort=link-desc",
				"class" => ""
			),
			"auto_sub" => array(
				"title" => 'Cấp con tự động',
				"link" => $link_action."&p=".$p.$ext."&sort=auto_sub-desc",
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
				$order_tmp = ($tmp[0] == "menu_id") ? "a.menu_id" : $tmp[0];
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
			$where .= " order by show_order desc, date_create asc";
		}
		//End sort
		
		//Title row
		foreach($arr_title as $k => $v)
		{
			$class = ($v["class"]) ? " class='".$v["class"]."'" : "";
			$data["f_".$k] = '<a href="'.$v["link"].'" '.$class.'>'.$v["title"].'</a>';
		}
		//End title row
		
    $sql = "select * from menu 
						where lang='".$ttH->conf["lang_cur"]."' 
						".$where_root.$where." 
						limit $start,$n";
    //echo $sql;
		
		$nav = $ttH->admin->admin_paginate ($link_action, $num_total, $n, $ext, $p);
		
		$result = $ttH->db->query($sql);
    $i = 0;
		$data['row_item'] = '';
    $html_row = "";
    if ($num = $ttH->db->num_rows($result))
		{
			while ($row = $ttH->db->fetch_row($result)) 
			{
				$i++;
				$data['row_item'] .= $this->manage_row($row, $is_show);
				if($is_search == 0) {
					$data['row_item'] .= $this->manage_sub($row['menu_id'], $where, $is_show);
				}
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
		$data["list_group_search"] = list_group ("group_id", $group_id, " class=\"form-control\" onchange=\"window.location.href='".$link_action."&group_id='+this.value;\"");
		$data["list_parent_search"] = list_menu ($group_id, "search_parent_id", $search_parent_id, " class=\"form-control\"", array("title" => $ttH->lang['global']['select_title']));
		$data["list_module_search"] = list_module ("search_show_mod", $search_show_mod, " class=\"form-control\"", array('title' => $ttH->lang["global"]["select_title"]));
		$data['form_search_class'] = ($is_search == 1) ? ' expand' : '';
		
		if($is_show == "trash"){
			$ttH->temp_act->parse("manage.button_manage");
		}else{
			$ttH->temp_act->parse("manage.button_trash");
		}
		
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("manage");
		return $ttH->temp_act->text("manage");
	}
	
	//-----------
	function manage_sub($parent_id=0, $where, $is_show='', $lv_text = '')
	{
		global $ttH;
		
		$output = '';
		
		$lv_text .= '|--';
		
		$sql = "select * from menu 
						where lang='".$ttH->conf["lang_cur"]."' 
						and parent_id='".$parent_id."'  
						".$where." ";
    //echo $sql;
		$result = $ttH->db->query($sql);
    $i = 0;
    if ($num = $ttH->db->num_rows($result))
		{
			while ($row = $ttH->db->fetch_row($result)) 
			{
				$i++;
				$row['pre_title'] = $lv_text.' ';
				$output .= $this->manage_row($row, $is_show);
				$output .= $this->manage_sub($row['menu_id'], $where, $is_show, $lv_text);
			}
		}
		
		return $output;
	}

  // end class
}
?>