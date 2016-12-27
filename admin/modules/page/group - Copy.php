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
	var $modules = "page";
	var $action = "group";
	var $sub = "manage";
	var $folder_upload = "page";
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
		
		include ($this->modules."_func.php");
		
		$this->dir = create_folder(date("Y_m"));
		
		$data["link_manage"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "manage");
		$data["link_manage_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "manage_trash");
		$data["link_add"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "add");
		
		$this->sub = (isset($ttH->input["sub"])) ? $ttH->input["sub"] : "manage";
		switch ($this->sub) {
			case "add":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->modules."_".$this->action."_".$this->sub];
				$data["main"] = $this->do_add();
				break;
			case "edit":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->modules."_".$this->action."_".$this->sub];
				$data["main"] = $this->do_edit();
				break;
			case "manage_trash":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->modules."_".$this->action."_".$this->sub];
				$data["main"] = $this->do_manage("trash");
				break;
			default:
				$this->sub = "manage";
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->modules."_".$this->action."_manage"];
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
			
			$parent_id = (isset($ttH->post["parent_id"])) ? (float)$ttH->post["parent_id"] : 0;
			
			if(empty($ttH->post["title"])) {
				$err = $ttH->html->html_alert ($ttH->lang["global"]["err_invalid_title"], "error");	
			}
			
			if(empty($err)){
				$col = array();
				$col["parent_id"] = $parent_id;
				$col["picture"] = $ttH->func->get_input_pic ($ttH->post["picture"]);
				$col["group_related"] = (isset($ttH->post["group_related"])) ? implode(',',$ttH->post["group_related"]) : '';
				$col["pic_show"] = (isset($ttH->post["pic_show"])) ? $ttH->post["pic_show"] : 'slide';
				$col["type_show"] = (isset($ttH->post["type_show"])) ? $ttH->post["type_show"] : 'list_item';
				$col["num_show"] = (isset($ttH->post["num_show"])) ? $ttH->post["num_show"] : 0;
				$col["show_order"] = 0;
				$col["is_show"] = 1;
				$col["date_create"] = time();
				$col["date_update"] = time();
				$ok = $ttH->db->do_insert("page_group", $col);	
				if($ok){
					$group_id = $ttH->db->insertid();
					
					$col_l = array();
					$col_l["group_id"] = $group_id;
					$col_l["title"] = $ttH->post["title"];
					$col_l["short"] = $ttH->func->input_editor ($ttH->post["short"]);
					$col_l["content"] = $ttH->func->input_editor ($ttH->post["content"]);

					$col_l["meta_title"] = ($ttH->post["meta_title"]) ? $ttH->post["meta_title"] : $ttH->func->meta_title ($ttH->post["title"]);
					$col_l["meta_key"] = ($ttH->post["meta_key"]) ? $ttH->post["meta_key"] : $ttH->func->meta_key ($ttH->post["title"]);
					$col_l["meta_desc"] = ($ttH->post["meta_desc"]) ? $ttH->func->meta_desc ($ttH->post["meta_desc"]) : $ttH->func->meta_desc ($ttH->post["content"]);
					
					foreach($ttH->data["lang"] as $lang_id => $lang_row){
						
						$friendly_link = ($ttH->post["friendly_link"]) ? $ttH->post["friendly_link"] : $ttH->post["title"];
						$col_l["friendly_link"] = $ttH->func->get_friendly_link_db ($friendly_link, 'page_group_lang', 'group_id', $group_id, $lang_row["name"]);
						
						$col_l["lang"] = $lang_row["name"];
						$ttH->db->do_insert("page_group_lang", $col_l);	
					}
					
					//update group_nav
					$col = array();
					$col["group_nav"] = get_group_nav ($parent_id, $group_id);
					$col["group_level"] = substr_count($col['group_nav'],',') + 1;
					$ok = $ttH->db->do_update("page_group", $col, " group_id='".$group_id."'");	
					if($ok) {
						built_group_nav_sub ($group_id, $col["group_nav"]);
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
		
		$arr_isset = array('parent_id','picture','pic_show','type_show','num_show','short','content');
		foreach($arr_isset as $tmp) {
			$data[$tmp] = (isset($data[$tmp])) ? $data[$tmp] : '';
		}
		$data["group_related"] = (isset($data["group_related"])) ? $data["group_related"] : array();
		
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
		$data["list_group"] = list_group ("parent_id", $data['parent_id'], " class=\"form-control\"", array("title" => $ttH->lang['global']['select_title']));
		
		$data['picture'] = $ttH->admin->get_form_pic ('picture', $data['picture'], $this->folder_upload, $this->dir);
		$data["html_short"] = $ttH->editor->load_editor ("short", "short", $data['short'], "", "mini", array("folder_up" => $this->folder_upload, "fldr" => $this->dir));
		$data["html_content"] = $ttH->editor->load_editor ("content", "content", $data['content'], "", "full", array("folder_up" => $this->folder_upload, "fldr" => $this->dir));
		
		//$data["list_group_related"] = list_group ("group_related[]", $data["group_related"], " class=\"form-control\"", array('select_muti' => 1));
		$data["list_pic_show"] = list_pic_show ("pic_show", $data["pic_show"], " class=\"form-control\"");
		$data["list_type_show"] = list_type_show ("type_show", $data["type_show"], " class=\"form-control\"");
		$data["list_num_show"] = $ttH->admin->list_number ("num_show", 1, 50, $data['num_show'], " class=\"form-control\"", array('title'=>'Tự động ---'));
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("edit");
		return $ttH->temp_act->text("edit");
	}
	
	//-----------
	function do_edit()
	{
		global $ttH;
		
		$err = "";
		
		$group_id = $ttH->input["id"];
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			$parent_id = (isset($ttH->post["parent_id"])) ? (float)$ttH->post["parent_id"] : 0;
			
			if(empty($ttH->post["title"])) {
				$err = $ttH->html->html_alert ($ttH->lang["global"]["err_invalid_title"], "error");	
			}
			
			if(empty($err)){
				$col = array();
				$col["group_nav"] = get_group_nav ($parent_id, $group_id);
				$col["group_level"] = substr_count($col['group_nav'],',') + 1;
				$col["parent_id"] = $parent_id;
				$col["picture"] = $ttH->func->get_input_pic ($ttH->post["picture"]);
				$col["group_related"] = (isset($ttH->post["group_related"])) ? implode(',',$ttH->post["group_related"]) : '';
				$col["pic_show"] = (isset($ttH->post["pic_show"])) ? $ttH->post["pic_show"] : 'slide';
				$col["type_show"] = (isset($ttH->post["type_show"])) ? $ttH->post["type_show"] : 'list_item';
				$col["num_show"] = (isset($ttH->post["num_show"])) ? $ttH->post["num_show"] : 0;
				$col["date_update"] = time();
				$ok = $ttH->db->do_update("page_group", $col, " group_id='".$group_id."'");	
				if($ok){
					$col_l = array();
					$col_l["title"] = $ttH->post["title"];
					$col_l["short"] = $ttH->func->input_editor ($ttH->post["short"]);
					$col_l["content"] = $ttH->func->input_editor ($ttH->post["content"]);
					
					$friendly_link = ($ttH->post["friendly_link"]) ? $ttH->post["friendly_link"] : $ttH->post["title"];
					$col_l["friendly_link"] = $ttH->func->get_friendly_link_db ($friendly_link, 'page_group_lang', 'group_id', $group_id, $ttH->conf['lang_cur']);
					
					$col_l["meta_title"] = ($ttH->post["meta_title"]) ? $ttH->post["meta_title"] : $ttH->func->meta_title ($ttH->post["title"]);
					$col_l["meta_key"] = ($ttH->post["meta_key"]) ? $ttH->post["meta_key"] : $ttH->func->meta_key ($ttH->post["title"]);
					$col_l["meta_desc"] = ($ttH->post["meta_desc"]) ? $ttH->func->meta_desc ($ttH->post["meta_desc"]) : $ttH->func->meta_desc ($ttH->post["content"]);
					
					$ttH->db->do_update("page_group_lang", $col_l, " group_id='".$group_id."' and lang='".$ttH->conf["lang_cur"]."'");
					
					built_group_nav_sub ($group_id, $col["group_nav"]);	
					
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_success"], "success");
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_false"], "error");	
				}
			}
		}
		
		$sql = "select * from page_group a, page_group_lang al 
						where a.group_id=al.group_id 
						and lang='".$ttH->conf['lang_cur']."' 
						and a.group_id=" . $group_id;
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
		}
		
		$data["err"] = $err;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("id"=>$group_id));
		$data["list_group"] = list_group ("parent_id", $data['parent_id'], " class=\"form-control\"", array("title" => $ttH->lang['global']['select_title'], 'disabled' => $data["group_id"]));
		$data['picture'] = $ttH->admin->get_form_pic ('picture', $data['picture'], $this->folder_upload, $this->dir);
		$data["html_short"] = $ttH->editor->load_editor ("short", "short", $data['short'], "", "mini", array("folder_up" => $this->folder_upload, "fldr" => $this->dir));
		$data["html_content"] = $ttH->editor->load_editor ("content", "content", $data['content'], "", "full", array("folder_up" => $this->folder_upload, "fldr" => $this->dir));
		
		$data["group_related"] = (is_array($data["group_related"])) ? $data["group_related"] : explode(',',$data["group_related"]);
		//$data["list_group_related"] = list_group ("group_related[]", $data["group_related"], " class=\"form-control\"", array('select_muti' => 1));
		$data["list_pic_show"] = list_pic_show ("pic_show", $data["pic_show"], " class=\"form-control\"");
		$data["list_type_show"] = list_type_show ("type_show", $data["type_show"], " class=\"form-control\"");
		$data["list_num_show"] = $ttH->admin->list_number ("num_show", 1, 50, $data['num_show'], " class=\"form-control\"", array('title'=>'Tự động ---'));
		
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
		$del_item = "";
		$del_item_lang = "";
		
		/*$query = $ttH->db->query("select id, group_id from page_group_lang where find_in_set(group_id,'".$list_del."') and lang='".$ttH->conf["lang_cur"]."'");	
		while ($row = $ttH->db->fetch_row($query)){
			$check = $ttH->db->query("select id from page_group_lang where group_id='".$row["group_id"]."' and lang!='".$ttH->conf["lang_cur"]."'");
			if (!$num_check = $ttH->db->num_rows($query)){	
				$del_item .= ($del_item) ? "," : "";
				$del_item .= $row["group_id"];
			}
			$del_item_lang .= ($del_item_lang) ? "," : "";
			$del_item_lang .= $row["id"];
		}
		
		$ok = $ttH->db->delete ("page_group_lang", "find_in_set(id,'".$del_item_lang."')");
    if ($ok){
			$ttH->db->delete ("page_group", "find_in_set(group_id,'".$del_item."')");
			$ttH->db->delete ("friendly_link", " dbtable='page_group_lang' and find_in_set(dbtable_id,'".$del_item."')");

      $mess = $ttH->html->html_alert($ttH->lang["global"]["del_success"], "success");
    } else  {
      $mess = $ttH->html->html_alert($ttH->lang["global"]["del_false"], "error");
    }*/
		
		$where = "";
		$arr_del = $list_del ? explode(',', $list_del) : array();
		foreach($arr_del as $del_id) {
			$where .= ($where) ? " or " : " where";
			$where .= " find_in_set('".$del_id."', group_nav)";
		}
		
		$query = $ttH->db->query("select group_id from page_group ".$where);	
		while ($row = $ttH->db->fetch_row($query)){
			$del_item .= ($del_item) ? "," : "";
			$del_item .= $row["group_id"];
		}
		
		$ok = $ttH->db->delete ("page_group_lang", "find_in_set(group_id,'".$del_item."')");
    if ($ok){
			$ttH->db->delete ("page_group", "find_in_set(group_id,'".$del_item."')");
			$ttH->db->delete ("friendly_link", " dbtable='page_group_lang' and find_in_set(dbtable_id,'".$del_item."')");
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
		
		$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "edit", array("id"=>$row['group_id']));
		$row["link_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_trash","id"=>$row['group_id']));
		$row["link_restore"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_restore","id"=>$row['group_id']));
		$row["link_del"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row['group_id']));
		
		if(!empty($row["picture"])){
			$row["picture"] = '<a class="fancybox-effects-a" title="'.$row["picture"].'" href="'.DIR_UPLOAD.$row["picture"].'">
				'.$ttH->func->get_pic_mod($row["picture"], 50, 50, '', 1, 0, array('fix_width'=>1)).'
			</a>';
		}
		
		$row['name_action'] = $this->modules.'-group-'.$row["group_id"];
		
		/*$row['link'] = (isset($ttH->data["modules"][$this->modules]["arr_friendly_link"][$ttH->conf['lang_cur']])) ? $ttH->data["modules"][$this->modules]["arr_friendly_link"][$ttH->conf['lang_cur']] : '';
		$row['link'] .= '/'.$row["friendly_link"];*/
		
		$row['link'] = $row["friendly_link"];
		
		$row['parent'] = get_group_name ($row['parent_id'], 'link');
		$row['date_create'] = date('d/m/Y',$row['date_create']);
		
		//$row['is_focus'] = $ttH->admin->list_yesno ("is_focus[".$row['group_id']."]", $row['is_focus'], "  onchange=\"do_check (".$row['group_id'].")\"");
		$row['is_focus_checked'] = ($row['is_focus'] == 1) ? ' checked="checked"' : '';
		$row['is_show_menu_checked'] = ($row['is_show_menu'] == 1) ? ' checked="checked"' : '';
		
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
					$arr_is_focus = (isset($ttH->post["is_focus"])) ? $ttH->post["is_focus"] : array();
					$arr_is_show_menu = (isset($ttH->post["is_show_menu"])) ? $ttH->post["is_show_menu"] : array();
							
					$mess = $ttH->lang['global']['edit_success'] . " ID: <strong>";
					$str_mess = "";
					for ($i = 0; $i < count($up_id); $i ++){
						$dup = array();
						$dup['show_order'] = $arr_show_order[$up_id[$i]];
						$dup['is_focus'] = (isset($arr_is_focus[$up_id[$i]])) ? $arr_is_focus[$up_id[$i]] : 0;
						$dup['is_show_menu'] = (isset($arr_is_show_menu[$up_id[$i]])) ? $arr_is_show_menu[$up_id[$i]] : 0;
						$ok = $ttH->db->do_update("page_group", $dup, "group_id=" . $up_id[$i]);
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
						$ok = 0;
						$sql = "select group_nav from page_group where group_id='".$up_id[$i]."' limit 0,1";
						//echo $sql;
						if ($row_group = $ttH->db->fetch_row($ttH->db->query($sql))) {
							$dup = array();
							$dup['is_show'] = 1;
							$ok = $ttH->db->do_update("page_group", $dup, " find_in_set(group_id, '".$row_group['group_nav']."')");
						}
						
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
						$ok = $ttH->db->do_update("page_group", $dup, " find_in_set('" . $up_id[$i]."', group_nav)");
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
		$search_parent_id = (isset($ttH->input["search_parent_id"])) ? $ttH->input["search_parent_id"] : 0;
		$search_group_id = (isset($ttH->input["search_group_id"])) ? $ttH->input["search_group_id"] : 0;
		$search_title = (isset($ttH->input["search_title"])) ? $ttH->input["search_title"] : "";
		
		$where = " ";
		$ext = "";
		$is_search = 0;
		
		if($is_show == "trash" ){
			//$where .= " AND is_show=0 ";
		}else{
			$where .= " AND is_show=1 ";
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
		
		if(!empty($search_group_id)){
			$where .=" and a.group_id='".$search_group_id."' ";			
			$ext.="&search_group_id=".$search_group_id;
			$is_search = 1;
		}
		
		if(!empty($search_title)){
			$where .=" and (a.group_id='$search_title' or title like '%$search_title%') ";			
			$ext.="&search_title=".$search_title;
			$is_search = 1;
		}
		
		$where_root = "";		
		if($is_search == 0) {
			$where_root .= " and parent_id=0  ";
		}
    
		$num_total = 0;
		$res_num = $ttH->db->query("select a.group_id 
						from page_group a, page_group_lang al 
						where a.group_id=al.group_id 
						and lang='".$ttH->conf["lang_cur"]."' 
						".$where_root.$where." ");
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
			"group_id" => array(
				"title" => $ttH->lang["global"]["id"],
				"link" => $link_action."&p=".$p.$ext."&sort=group_id-desc",
				"class" => ""
			),
			"show_order" => array(
				"title" => $ttH->lang["global"]["show_order"],
				"link" => $link_action."&p=".$p.$ext."&sort=show_order-desc",
				"class" => ""
			),
			"picture" => array(
				"title" => $ttH->lang["global"]["picture"],
				"link" => $link_action."&p=".$p.$ext."&sort=picture-desc",
				"class" => ""
			),
			"title" => array(
				"title" => $ttH->lang["global"]["title"],
				"link" => $link_action."&p=".$p.$ext."&sort=title-desc",
				"class" => ""
			),
			"is_focus" => array(
				"title" => $ttH->lang["global"]["focus"],
				"link" => $link_action."&p=".$p.$ext."&sort=is_focus-desc",
				"class" => ""
			),
			"is_show_menu" => array(
				"title" => 'hiện ở menu',
				"link" => $link_action."&p=".$p.$ext."&sort=is_show_menu-desc",
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
				$order_tmp = ($tmp[0] == "group_id") ? "a.group_id" : $tmp[0];
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
		
    $sql = "select * from page_group a, page_group_lang al 
						where a.group_id=al.group_id 
						and lang='".$ttH->conf["lang_cur"]."' 
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
					$data['row_item'] .= $this->manage_sub($row['group_id'], $where, $is_show);
				}
			}
		}
		else
		{
			$ttH->temp_act->assign('row', array("mess"=>$ttH->lang["global"]["no_have_data"]));
			$ttH->temp_act->parse("manage.row_empty");
			//$data['row_item'] .= $ttH->temp_act->text("manage.row_empty");
		}
		
		$data['html_row'] = $html_row;
		$data['nav'] = $nav;
		$data['err'] = $err;
		
		$data['link_action_search'] = $link_action;
		$data['link_action'] = $link_action."&p=".$p.$ext;
		
		$data['search_date_begin'] = $search_date_begin;
		$data['search_date_end'] = $search_date_end;
		$data['search_title'] = $search_title;
		$data["list_group_search"] = list_group ("search_group_id", $search_group_id, " class=\"form-control\"", array("title" => $ttH->lang['global']['select_title']));
		$data["list_parent_search"] = list_group ("search_parent_id", $search_parent_id, " class=\"form-control\"", array("title" => $ttH->lang['global']['select_title']));
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
		
		$sql = "select * from page_group a, page_group_lang al 
						where a.group_id=al.group_id 
						and lang='".$ttH->conf["lang_cur"]."' 
						and parent_id='".$parent_id."'  
						".$where." ";
    //echo $sql;
		$result = $ttH->db->query($sql);
    $i = 0;
		$data['row_item'] = '';
    if ($num = $ttH->db->num_rows($result))
		{
			while ($row = $ttH->db->fetch_row($result)) 
			{
				$i++;
				$row['pre_title'] = $lv_text.' ';
				$output .= $this->manage_row($row, $is_show);
				$output .= $this->manage_sub($row['group_id'], $where, $is_show, $lv_text);
			}
		}
		
		return $output;
	}

  // end class
}
?>