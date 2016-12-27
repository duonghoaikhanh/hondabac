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
	var $modules = "config";
	var $action = "menu";
	var $sub = "manage";
	
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
	function do_add()
	{
		global $ttH;
		
		$err = "";
		
		$data = array();

		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			if(empty($ttH->post["title"]))
				$err = $ttH->html->html_alert ($ttH->lang["global"]["err_invalid_title"], "error");	
			
			if(empty($err)){
				$col = array();
				$arr_title = array();
				foreach($ttH->data["lang"] as $lang_id => $lang_row){
					$arr_title[$lang_row["name"]] = $ttH->post["title"];
				}
				$col["parent_id"] = $ttH->post["parent_id"];
				$col["is_type"] = ($ttH->post["parent_id"] > 0) ? 'action' : 'module';
				$col["name_action"] = $ttH->post["name_action"];
				$col["icon_menu"] = $ttH->post["icon_menu"];
				if(empty($col["icon_menu"])) {
					$col["icon_menu"] = ($ttH->post["parent_id"] > 0) ? 'fa-list' : 'fa-folder';
				}
				$col["arr_title"] = serialize($arr_title);
				$col["list_sub"] = (isset($ttH->post["list_sub"])) ? implode(',',$ttH->post["list_sub"]) : '';
				$col["show_order"] = 0;
				$col["is_show"] = 1;
				$col["date_create"] = time();
				$col["date_update"] = time();

				$ok = $ttH->db->do_insert("admin_menu", $col);	
				if($ok){
					$data = array();
					$err = $ttH->html->html_alert ($ttH->lang["global"]["add_success"], "success");
				}else{
					$data = $ttH->post;
					$err = $ttH->html->html_alert ($ttH->lang["global"]["add_false"], "error");	
				}
			} else {
				$data = $ttH->post;
			}
		}
		
		$data["err"] = $err;
		
		$arr_isset = array('parent_id');
		foreach($arr_isset as $tmp) {
			$data[$tmp] = (isset($data[$tmp])) ? $data[$tmp] : '';
		}
		$data['list_sub'] = (isset($data['list_sub'])) ? @implode(',',$data['list_sub']) : 'add,edit,duplicate,manage,trash,restore,del';
		
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
		$data["list_menu_parent"] = list_menu_parent ("parent_id", $data['parent_id'], " class=\"form-control\"", array("title" => $ttH->lang['global']['select_title']));
		$data["list_sub_menu"] = list_sub_menu ("list_sub[]", $data['list_sub'], " class=\"form-control\"", array());
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("edit");
		return $ttH->temp_act->text("edit");
	}
	
	//-----------
	function do_edit()
	{
		global $ttH;
		
		$err = "";
		
		$dir = create_folder(date("Y_m"));
		$menu_id = $ttH->input["id"];
		
		$sql = "select * from admin_menu where menu_id=" . $menu_id;
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
			$data["arr_title"] = unserialize($data["arr_title"]);
			$data["title"] = $data["arr_title"][$ttH->conf["lang_cur"]];
		}
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			if(empty($ttH->post["title"])) {
				$err = $ttH->html->html_alert ($ttH->lang["global"]["err_invalid_title"], "error");	
			}				
			
			if(empty($err)){
				$col = array();
				$data["arr_title"][$ttH->conf["lang_cur"]] = $ttH->post["title"];
				$data["parent_id"] = $col["parent_id"] = $ttH->post["parent_id"];
				$data["is_type"] = $col["is_type"] = ($ttH->post["parent_id"] > 0) ? 'action' : 'module';
				$data["name_action"] = $col["name_action"] = $ttH->post["name_action"];
				$data["icon_menu"] = $col["icon_menu"] = $ttH->post["icon_menu"];
				if(empty($col["icon_menu"])) {
					$data["icon_menu"] = $col["icon_menu"] = ($ttH->post["parent_id"] > 0) ? 'fa-list' : 'fa-folder';
				}
				$col["arr_title"] = serialize($data["arr_title"]);
				$data["list_sub"] = $col["list_sub"] = (isset($ttH->post["list_sub"])) ? implode(',',$ttH->post["list_sub"]) : '';
				$col["date_update"] = time();
				$ok = $ttH->db->do_update("admin_menu", $col, " menu_id='".$menu_id."'");	
				if($ok){					
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_success"], "success");
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_false"], "error");	
				}
			}
		}
		
		
		
		$data["err"] = $err;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("id"=>$menu_id));
		$data["list_menu_parent"] = list_menu_parent ("parent_id", $data['parent_id'], " class=\"form-control\"", array("title" => $ttH->lang['global']['select_title']));
		$data["list_sub_menu"] = list_sub_menu ("list_sub[]", $data['list_sub'], " class=\"form-control\"", array());
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("edit");
		return $ttH->temp_act->text("edit");
	}
	
	//-------------- 
  function do_del ($list_del = "")
  {
    global $ttH;
		
		if(empty($list_del)){
			$ttH->html->alert ($ttH->lang["global"]["not_found_product"], $ttH->admin->get_link_admin ($this->modules, $this->action));
		}
		$del_item = "";
		$del_item_lang = "";
		
		$query = $ttH->db->query("select id, menu_id from admin_menu_lang where find_in_set(menu_id,'".$list_del."') and lang='".$ttH->conf["lang_cur"]."'");	
		while ($row = $ttH->db->fetch_row($query)){
			$check = $ttH->db->query("select id from admin_menu_lang where menu_id='".$row["menu_id"]."' and lang!='".$ttH->conf["lang_cur"]."'");
			if (!$num_check = $ttH->db->num_rows($query)){	
				$del_item .= ($del_item) ? "," : "";
				$del_item .= $row["menu_id"];
			}
			$del_item_lang .= ($del_item_lang) ? "," : "";
			$del_item_lang .= $row["id"];
		}
		
		$ok = $ttH->db->delete ("admin_menu_lang", "find_in_set(id,'".$del_item_lang."')");
    if ($ok){
			$ttH->db->delete ("admin_menu", "find_in_set(menu_id,'".$del_item."')");
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
		
		$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "edit", array("id"=>$row['menu_id']));
		$row["link_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_trash","id"=>$row['menu_id']));
		$row["link_restore"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_restore","id"=>$row['menu_id']));
		$row["link_del"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row['menu_id']));
		
		$row['arr_title'] = unserialize($row['arr_title']);
		//print_arr($row);die();
		$row['title'] = $row['arr_title'][$ttH->conf['lang_cur']];
		//echo $ttH->conf['lang_cur'];
		//print_arr($row);die();
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
							
					$mess = $ttH->lang['global']['edit_success'] . " ID: <strong>";
					$str_mess = "";
					for ($i = 0; $i < count($up_id); $i ++){
						$dup = array();
						$dup['show_order'] = $arr_show_order[$up_id[$i]];
						$ok = $ttH->db->do_update("admin_menu", $dup, "menu_id=" . $up_id[$i]);
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
						$ok = $ttH->db->do_update("admin_menu", $dup, "menu_id=" . $up_id[$i]);
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
						$ok = $ttH->db->do_update("admin_menu", $dup, "menu_id=" . $up_id[$i]);
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
		$date_begin = (isset($ttH->input["date_begin"])) ? $ttH->input["date_begin"] : "";
		$date_end = (isset($ttH->input["date_end"])) ? $ttH->input["date_end"] : "";
		$search = (isset($ttH->input["search"])) ? $ttH->input["search"] : "id";
		$keyword = (isset($ttH->input["keyword"])) ? $ttH->input["keyword"] : "";
		
		$where = " ";
		$ext = "";
		
		if($is_show == "trash" ){
			//$where .= " AND is_show=0 ";
		}else{
			$where .= " AND is_show=1 ";
		}
		
		if($date_begin || $date_end ){
			$tmp1 = @explode("/", $date_begin);
			$time_begin = @mktime(0, 0, 0, $tmp1[1], $tmp1[0], $tmp1[2]);
			
			$tmp2 = @explode("/", $date_end);
			$time_end = @mktime(23, 59, 59, $tmp2[1], $tmp2[0], $tmp2[2]);
			
			$where.=" AND (date_add BETWEEN {$time_begin} AND {$time_end} ) ";
			$ext.="&date_begin=".$date_begin."&date_end=".$date_end;
		}
		
		if(!empty($keyword)){
			switch($search){
				case "id" : $where .=" and  id = $keyword ";   break;
				default :$where .=" and $search like '%$keyword%' ";break;		
			}
			
			$ext.="&search=".$search."&keyword=".$keyword;
		}
    
		$num_total = 0;
		$res_num = $ttH->db->query("select menu_id 
																	from admin_menu 
																	where parent_id=0 
																	".$where." ");
			$num_total = $ttH->db->num_rows($res_num);
		$n = ($ttH->conf["n_list"]) ? $ttH->conf["n_list"] : 30;
		$num_products = ceil($num_total / $n);
		if ($p > $num_products)
		  $p = $num_products;
		if ($p < 1)
		  $p = 1;
		$start = ($p - 1) * $n;
		
		$link_action = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
		
		//Sort
		$arr_title = array(
			"menu_id" => array(
				"title" => $ttH->lang["global"]["id"],
				"link" => $link_action."&p=".$p.$ext."&sort=menu_id-desc",
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
		
    $sql = "select * from admin_menu 
						where parent_id=0 
						".$where." 
						limit $start,$n";
    //echo $sql; die();
		
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
				$data['row_item'] .= $this->manage_sub($row['menu_id'], $where, $is_show);
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
		
		$data['date_begin'] = $date_begin;
		$data['date_end'] = $date_end;
		//$data["list_search"] = list_search_domain ("search", $search);
		$data['keyword'] = $keyword;
		
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
		
		$sql = "select * from admin_menu 
						where parent_id='".$parent_id."'  
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