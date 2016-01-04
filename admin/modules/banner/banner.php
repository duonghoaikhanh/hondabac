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
	var $modules = "banner";
	var $action = "banner";
	var $sub = "manage";
	var $cur_group = "logo";
	var $folder_upload = "banner";
	var $dir = "";
	
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
		
		$ttH->func->include_js ($ttH->dir_temp.'js/'.$this->modules.'/'.$this->action.".js");
		
		include ($this->modules."_func.php");
		load_setting ();
		
		$this->dir = create_folder(date("Y_m"));
		
		$this->cur_group = (isset($ttH->input["group_id"]) && array_key_exists($ttH->input["group_id"], $ttH->data["banner_group"])) ? $ttH->input["group_id"] : $this->cur_group;
		$data["link_manage"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "manage", array('group_id' => $this->cur_group));
		$data["link_manage_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "manage_trash", array('group_id' => $this->cur_group));
		$data["link_add"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "add", array('group_id' => $this->cur_group));
		
		$this->sub = (isset($ttH->input["sub"])) ? $ttH->input["sub"] : "manage";
		switch ($this->sub) {
			case "add":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->modules."_".$this->sub];
				$data["main"] = $this->do_add();
				break;
			case "edit":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->modules."_".$this->sub];
				$data["main"] = $this->do_edit();
				break;
			case "manage_trash":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->modules."_".$this->sub];
				$data["main"] = $this->do_manage("trash");
				break;
			default:
				$this->sub = "manage";
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->modules."_manage"];
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
	function do_add()
	{
		global $ttH;
		
		$data = array();
		$err = "";
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			if(empty($err) && empty($ttH->post["group_id"])) {
				$err = $ttH->html->html_alert ($ttH->lang["banner"]["err_invalid_group"], "error");	
			}
			
			$content = '';
			$type = $ttH->post["type"];
			if($type == 'image') {
				if(empty($err) && empty($ttH->post["picture"])) {
					$err = $ttH->html->html_alert ('Vui lòng chọn hình', "error");	
				} else {
					$content = $ttH->func->get_input_pic ($ttH->post["picture"]);
				}				
			}else{
				if(empty($err) && empty($ttH->post["content"])) {
					$err = $ttH->html->html_alert ('Vui lòng nhập nội dung', "error");	
				} else {
					$content = $ttH->post["content"];
				}
			}
			
			$date_begin = '';
			$date_end = '';
			
			if($ttH->post["date_begin"]) {
				$tmp = explode(' ', $ttH->post["date_begin"]);
				$tmp[0] = explode('/', $tmp[0]);
				$tmp[1] = explode(':', $tmp[1]);
				$date_begin = mktime($tmp[1][0], $tmp[1][1], 0, $tmp[0][1], $tmp[0][0], $tmp[0][2]);
			}
			if($ttH->post["date_end"]) {
				$tmp = explode(' ', $ttH->post["date_end"]);
				$tmp[0] = explode('/', $tmp[0]);
				$tmp[1] = explode(':', $tmp[1]);
				$date_end = mktime($tmp[1][0], $tmp[1][1], 0, $tmp[0][1], $tmp[0][0], $tmp[0][2]);
			}
			
			if(empty($err)){
				$col = array();
				$col["banner_id"] = 0;
				$col["group_id"] = $ttH->post["group_id"];
				$col["type"] = $ttH->post["type"];
				$col["title"] = $ttH->post["title"];
				$col["link_type"] = $ttH->post["link_type"];
				$col["link"] = $ttH->post["link"];
				$col["target"] = $ttH->post["target"];
				$col["content"] = $content;
				$col["show_mod"] = (isset($ttH->post["show_mod"])) ? get_input_show ($ttH->post["show_mod"]) : "";
				$col["show_act"] = (isset($ttH->post["show_act"])) ? get_input_show ($ttH->post["show_act"]) : "";
				$col["show_order"] = 0;
				$col["is_show"] = 1;
				$col["date_begin"] = $date_begin;
				$col["date_end"] = $date_end;
				$col["date_create"] = time();
				$col["date_update"] = time();
				$i = 0;
				foreach($ttH->data["lang"] as $lang_id => $lang_row){
					$i++;
					$col["lang"] = $lang_row["name"];
					$ok = $ttH->db->do_insert("banner", $col);	
					if($ok && $col["banner_id"] == 0){
						$banner_id = $ttH->db->insertid();
						$col["banner_id"] = $banner_id;
						
						$col_l = array();
						$col_l["banner_id"] = $banner_id;
						
						$ttH->db->do_update("banner", $col_l, " id='".$banner_id."'");	// update current
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
		
		$arr_isset = array('group_id','link_type','picture','content','target','show_mod','date_begin','date_end');
		foreach($arr_isset as $tmp) {
			$data[$tmp] = (isset($data[$tmp])) ? $data[$tmp] : '';
		}
		$data['group_id'] = (!empty($data['group_id'])) ? $data['group_id'] : $this->cur_group;
		
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
		$data['picture'] = $ttH->admin->get_form_pic ('picture', $data['picture'], $this->folder_upload, $this->dir);
		$data["list_group"] = list_group ("group_id", $data["group_id"], " class=\"form-control\"");
		$data["list_link_type"] = $ttH->admin->list_link_type ("link_type", $data['link_type'], " class=\"form-control\"");
		$data["list_target"] = $ttH->admin->list_target ("target", $data['target'], " class=\"form-control\"");
		$data["html_content"] = $ttH->editor->load_editor ("content", "content", $data["content"], "", "full", array("folder_up" => $this->folder_upload, "fldr" => $this->dir));
		$data["list_module"] = list_module ("show_mod[]", @implode(',',$data['show_mod']), " class=\"form-control\"", array('title' => $ttH->lang["global"]["select_all"]));
		$data['type_check_image'] = ' checked="checked"';
		
		$data["date_begin"] = ($data["date_begin"] == 0) ? '' : $data["date_begin"];
		$data["date_end"] = ($data["date_end"] == 0) ? '' : $data["date_end"];
		if($data["date_begin"] && is_numeric($data["date_begin"])) {
			$data["date_begin"] = date('d/m/Y H:i', $data["date_begin"]);
		}
		if($data["date_end"]) {
			$data["date_end"] = date('d/m/Y H:i', $data["date_end"]);
		}
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("edit");
		return $ttH->temp_act->text("edit");
	}
	
	//-----------
	function do_edit()
	{
		global $ttH;
		
		$err = "";
		
		$banner_id = $ttH->input["id"];
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			if(empty($err) && empty($ttH->post["group_id"])) {
				$err = $ttH->html->html_alert ($ttH->lang["banner"]["err_invalid_group"], "error");	
			}
			
			$content = '';
			$type = $ttH->post["type"];
			if($type == 'image') {
				$content = $ttH->func->get_input_pic ($ttH->post["picture"]);
			}else{
				$content = $ttH->post["content"];
			}
			
			$date_begin = '';
			$date_end = '';
			
			if($ttH->post["date_begin"]) {
				$tmp = explode(' ', $ttH->post["date_begin"]);
				$tmp[0] = explode('/', $tmp[0]);
				$tmp[1] = explode(':', $tmp[1]);
				$date_begin = mktime($tmp[1][0], $tmp[1][1], 0, $tmp[0][1], $tmp[0][0], $tmp[0][2]);
			}
			if($ttH->post["date_end"]) {
				$tmp = explode(' ', $ttH->post["date_end"]);
				$tmp[0] = explode('/', $tmp[0]);
				$tmp[1] = explode(':', $tmp[1]);
				$date_end = mktime($tmp[1][0], $tmp[1][1], 0, $tmp[0][1], $tmp[0][0], $tmp[0][2]);
			}
			
			if(empty($err)){
				$col = array();
				$col["group_id"] = $ttH->post["group_id"];
				$col["type"] = $ttH->post["type"];
				$col["title"] = $ttH->post["title"];
				$col["link_type"] = $ttH->post["link_type"];
				$col["link"] = $ttH->post["link"];
				$col["target"] = $ttH->post["target"];
				$col["content"] = $content;
				$col["show_mod"] = (isset($ttH->post["show_mod"])) ? get_input_show ($ttH->post["show_mod"]) : "";
				$col["show_act"] = (isset($ttH->post["show_act"])) ? get_input_show ($ttH->post["show_act"]) : "";
				$col["date_begin"] = $date_begin;
				$col["date_end"] = $date_end;
				$col["date_update"] = time();
				$ok = $ttH->db->do_update("banner", $col, " lang='".$ttH->conf['lang_cur']."' and banner_id='".$banner_id."'");	
				if($ok){
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_success"], "success");
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_false"], "error");	
				}
			}
		}
		
		$sql = "select * from banner where lang='".$ttH->conf['lang_cur']."' and banner_id=" . $banner_id;
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
			if($data['type'] == 'image'){
				$data['picture'] = $ttH->admin->get_form_pic ('picture', $data['content'], $this->folder_upload, $this->dir);
				$data['content'] = '';
			}
		} else {
			$ttH->html->alert ($ttH->lang["global"]["not_found_page"], $ttH->admin->get_link_admin ($this->modules, $this->action));
		}
		
		$data["err"] = $err;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("id"=>$banner_id));
		$data["list_group"] = list_group ("group_id", $data["group_id"], " class=\"form-control\"");
		$data["list_link_type"] = $ttH->admin->list_link_type ("link_type", $data["link_type"], " class=\"form-control\"");
		$data["list_target"] = $ttH->admin->list_target ("target", $data["target"], " class=\"form-control\"");
		$data["html_content"] = $ttH->editor->load_editor ("content", "content", $data["content"], "", "full", array("folder_up" => $this->folder_upload, "fldr" => $this->dir));
		$data["list_module"] = list_module ("show_mod[]", $data["show_mod"], " class=\"form-control\"", array('title' => $ttH->lang["global"]["select_all"]));
		$data['type_check_'.$data['type']] = ' checked="checked"';
		
		$data["date_begin"] = ($data["date_begin"] == 0) ? '' : $data["date_begin"];
		$data["date_end"] = ($data["date_end"] == 0) ? '' : $data["date_end"];
		if($data["date_begin"] && is_numeric($data["date_begin"])) {
			$data["date_begin"] = date('d/m/Y H:i', $data["date_begin"]);
		}
		if($data["date_end"]) {
			$data["date_end"] = date('d/m/Y H:i', $data["date_end"]);
		}
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("edit");
		return $ttH->temp_act->text("edit");
	}
	
	//-------------- 
  function do_del ($list_del = "")
  {
    global $ttH;
		
		if(empty($list_del)){
			$ttH->html->alert ($ttH->lang["global"]["not_found_page"], $ttH->admin->get_link_admin ($this->modules, $this->action));
		}
		
		$ok = $ttH->db->delete ("banner", "find_in_set(banner_id,'".$list_del."')");
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
						$ok = $ttH->db->do_update("banner", $dup, "banner_id=" . $up_id[$i]);
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
						$ok = $ttH->db->do_update("banner", $dup, "banner_id=" . $up_id[$i]);
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
						$ok = $ttH->db->do_update("banner", $dup, "banner_id=" . $up_id[$i]);
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
		$search_show_mod = (isset($ttH->input["search_show_mod"])) ? $ttH->input["search_show_mod"] : '';
		$search_title = (isset($ttH->input["search_title"])) ? $ttH->input["search_title"] : "";
		
		$where = " where lang='".$ttH->conf['lang_cur']."' ";
		$ext = "";
		$is_search = 0;
		
		if($is_show == "trash" ){
			$where .= " and is_show=0 ";
		}else{
			$where .= " and is_show=1 ";
		}
		
		if(!empty($group_id)){
			$where .= " and group_id='".$group_id."' ";
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
    
		$num_total = 0;
		$res_num = $ttH->db->query("select banner_id from banner ".$where." ");
			$num_total = $ttH->db->num_rows($res_num);
		$n = ($ttH->conf["n_list"]) ? $ttH->conf["n_list"] : 30;
		$num_banners = ceil($num_total / $n);
		if ($p > $num_banners)
		  $p = $num_banners;
		if ($p < 1)
		  $p = 1;
		$start = ($p - 1) * $n;
		
		$link_action = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
		
		//Sort
		$arr_title = array(
			"banner_id" => array(
				"title" => $ttH->lang["global"]["id"],
				"link" => $link_action."&p=".$p.$ext."&sort=banner_id-desc",
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
				$order_tmp = ($tmp[0] == "banner_id") ? "banner_id" : $tmp[0];
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
			$where .= " order by date_create desc";
		}
		//End sort
		
		//Title row
		foreach($arr_title as $k => $v)
		{
			$class = ($v["class"]) ? " class='".$v["class"]."'" : "";
			$data["f_".$k] = '<a href="'.$v["link"].'" '.$class.'>'.$v["title"].'</a>';
		}
		//End title row
		
    $sql = "select * from banner ".$where." limit $start,$n";
    //echo $sql;
		
		$nav = $ttH->admin->admin_paginate ($link_action, $num_total, $n, $ext, $p);
		
		$result = $ttH->db->query($sql);
    $i = 0;
    $html_row = "";
    if ($num = $ttH->db->num_rows($result))
		{
			while ($row = $ttH->db->fetch_row($result)) 
			{
				$i++;
				
				$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "edit", array("id"=>$row['banner_id']));
				$row["link_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_trash","id"=>$row['banner_id']));
				$row["link_restore"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_restore","id"=>$row['banner_id']));
				$row["link_del"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row['banner_id']));
				
				if($row['type'] == 'image' && !empty($row["content"]))
				{
					//$row["content"] = '<img alt="'.$row["content"].'" src="'.DIR_UPLOAD.$row["content"].'"/>';
					$row["content"] = '<a class="fancybox-effects-a" title="'.$row["content"].'" href="'.DIR_UPLOAD.$row["content"].'">
						'.$ttH->func->get_pic_mod($row["content"], 300, 100, '', 1, 0, array('fix_max'=>1)).'
					</a>';
				}
				
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
		
		$data["list_group"] = list_group ("group_id", $group_id, " class=\"form-control\" onchange=\"window.location.href='".$link_action."&group_id='+this.value;\"");
		
		$data['search_date_begin'] = $search_date_begin;
		$data['search_date_end'] = $search_date_end;
		$data['search_title'] = $search_title;
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

  // end class
}
?>