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
	var $action = "widget";
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
		
		$data = array();
		$err = "";
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			$name_action = $ttH->func->fix_name_action ($ttH->post["name_action"]);
			
			if(empty($err) && empty($ttH->post["name_action"])) {
				$err = $ttH->html->html_alert ($ttH->lang["config"]["err_invalid_name_action"], "error");	
			}
			if(empty($err)){
				$res_check = $ttH->db->query("select widget_id  
												from widget 
												where name_action='".$name_action."' ");
				if($row_ck = $ttH->db->fetch_row($res_check)) {
					$err = $ttH->html->html_alert ($ttH->lang["config"]["err_exited_name_action"], "error");	
				}
			}
			
			if(empty($err)){
				$col = array();
				$arr_title = array();
				$arr_friendly_link = array();
				foreach($ttH->data["lang"] as $lang_id => $lang_row){
					$arr_title[$lang_row["name"]] = $ttH->post["title"];					
				}
				$col["name_action"] = $name_action;
				$col["arr_title"] = serialize($arr_title);
				$ok = $ttH->db->do_insert("widget", $col);	
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
		
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("edit");
		return $ttH->temp_act->text("edit");
	}
	
	//-----------
	function do_edit()
	{
		global $ttH;
		
		$err = "";
		
		$widget_id = $ttH->input["id"];
		
		$sql = "select * from widget where widget_id='".$widget_id."'";
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
			$data["arr_title"] = unserialize($data["arr_title"]);
		}
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			$name_action = $ttH->func->fix_name_action ($ttH->post["name_action"]);
			if(empty($ttH->post["title"])) {
				$err = $ttH->html->html_alert ($ttH->lang["global"]["err_invalid_title"], "error");	
			}			
			if(empty($err)){
				$res_check = $ttH->db->query("select widget_id  
												from widget 
												where name_action='".$name_action."' 
												and widget_id!='".$widget_id."' ");
				if($row_ck = $ttH->db->fetch_row($res_check)) {
					$err = $ttH->html->html_alert ($ttH->lang["config"]["err_exited_name_action"], "error");	
				}
			}	
			
			if(empty($err)){
				$col = array();
				$data["arr_title"][$ttH->conf["lang_cur"]] = $ttH->post["title"];
				
				$col["name_action"] = $name_action;
				$col["arr_title"] = serialize($data["arr_title"]);
				$ok = $ttH->db->do_update("widget", $col, " widget_id='".$widget_id."'");	
				if($ok){
					
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_success"], "success");
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_false"], "error");	
				}
			}
		}
		
		$data["err"] = $err;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("id"=>$widget_id));
		$data["title"] = $data["arr_title"][$ttH->conf["lang_cur"]];
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("edit");
		return $ttH->temp_act->text("edit");
	}
	
	//-------------- 
  function do_del ($list_del = "")
  {
    global $ttH;
		
		if(empty($list_del)){
			$ttH->html->alert ($ttH->lang["global"]["not_found_modules"], $ttH->admin->get_link_admin ($this->modules, $this->action));
		}
		
		$ok = $ttH->db->delete ("widget", "find_in_set(widget_id,'".$list_del."')");
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
						$ok = $ttH->db->do_update("list_del", $dup, "widget_id=" . $up_id[$i]);
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
			$where .= " where is_show=0 ";
		}else{
			$where .= " where is_show=1 ";
		}
    
		$num_total = 0;
		$res_num = $ttH->db->query("select widget_id from widget ".$where." ");
		$num_total = $ttH->db->num_rows($res_num);
		$n = ($ttH->conf["n_list"]) ? $ttH->conf["n_list"] : 30;
		$num_moduless = ceil($num_total / $n);
		if ($p > $num_moduless){
			$p = $num_moduless;
		}
		if ($p < 1){
			$p = 1;
		}
		$start = ($p - 1) * $n;
		
		$link_action = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
		
		//Sort
		$arr_title = array(
			"name_action" => array(
				"title" => $ttH->lang["global"]["id"],
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
			"friendly_link" => array(
				"title" => $ttH->lang["global"]["friendly_link"],
				"link" => $link_action."&p=".$p.$ext."&sort=friendly_link-desc",
				"class" => ""
			)
		);
		$sort = (isset($ttH->input["sort"])) ? $ttH->input["sort"] : "";
		if($sort) {
			$arr_allow_sort = array(
				1 => "asc",
				2 => "desc"
			);
			$tmp = explode("-",$sort);
			if (array_key_exists($tmp[0],$arr_title) && in_array($tmp[1],$arr_allow_sort)) {
				$order_tmp = ($tmp[0] == "widget_id") ? "widget_id" : $tmp[0];
				$where .= " order by ".$order_tmp." ".$tmp[1];
				
				$arr_title[$tmp[0]]["class"] = $tmp[1];
				$arr_title[$tmp[0]]["link"] = $link_action."&p=".$p.$ext."&sort=".$tmp[0]."-".$arr_allow_sort[(3-(array_search($tmp[1],$arr_allow_sort)))];				
			} else {
				$sort = "";
			}
		}
		
		if($sort == "") {
			$where .= " order by widget_id asc";
		}
		//End sort
		
		//Title row
		foreach($arr_title as $k => $v) {
			$class = ($v["class"]) ? " class='".$v["class"]."'" : "";
			$data["f_".$k] = '<a href="'.$v["link"].'" '.$class.'>'.$v["title"].'</a>';
		}
		//End title row
		
		$sql = "select * from widget ".$where." limit $start,$n";
		//echo $sql;
		
		$nav = $ttH->admin->admin_paginate ($link_action, $num_total, $n, $ext, $p);
		
		$result = $ttH->db->query($sql);
		$i = 0;
		$html_row = "";
		if ($num = $ttH->db->num_rows($result)) {
			while ($row = $ttH->db->fetch_row($result)) {
				$i++;
				
				$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "edit", array("id"=>$row['widget_id']));
				$row["link_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_trash","id"=>$row['widget_id']));
				$row["link_restore"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_restore","id"=>$row['widget_id']));
				$row["link_del"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row['widget_id']));
				$arr_title = unserialize($row['arr_title']);
				$row['title'] = $arr_title[$ttH->conf['lang_cur']];
				
				$ttH->temp_act->assign('row', $row);
				$ttH->temp_act->parse("manage.row_item");
			}
		} else {
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

  // end class
}
?>