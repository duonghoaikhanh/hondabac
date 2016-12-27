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
	var $action = "modules";
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
				$res_check = $ttH->db->query("select mod_id  
												from modules 
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
					//$arr_friendly_link[$lang_row["name"]] = (isset($ttH->post["friendly_link"])) ? $ttH->func->get_friendly_link ($ttH->post["friendly_link"]) : $ttH->func->get_friendly_link ($ttH->post["title"]);
					
					$friendly_link = ($ttH->post["friendly_link"]) ? $ttH->post["friendly_link"] : $ttH->post["title"];
					$arr_friendly_link[$lang_row["name"]] = $ttH->func->get_friendly_link_db ($friendly_link, 'modules', 'mod_id', $name_action, $lang_row["name"]);
					
				}
				$col["name_action"] = $name_action;
				$col["arr_title"] = serialize($arr_title);
				$col["arr_friendly_link"] = serialize($arr_friendly_link);
				$ok = $ttH->db->do_insert("modules", $col);	
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
		
		$mod_id = $ttH->input["id"];
		
		$sql = "select * from modules where mod_id='".$mod_id."'";
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
			$data["arr_title"] = unserialize($data["arr_title"]);
			$data["arr_friendly_link"] = unserialize($data["arr_friendly_link"]);
		}
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			$name_action = $ttH->func->fix_name_action ($ttH->post["name_action"]);
			if(empty($ttH->post["title"])) {
				$err = $ttH->html->html_alert ($ttH->lang["global"]["err_invalid_title"], "error");	
			}			
			if(empty($err)){
				$res_check = $ttH->db->query("select mod_id  
												from modules 
												where name_action='".$name_action."' 
												and mod_id!='".$mod_id."' ");
				if($row_ck = $ttH->db->fetch_row($res_check)) {
					$err = $ttH->html->html_alert ($ttH->lang["config"]["err_exited_name_action"], "error");	
				}
			}	
			
			if(empty($err)){
				$col = array();
				
				$data["arr_title"][$ttH->conf["lang_cur"]] = $ttH->post["title"];
				//$data["arr_friendly_link"][$ttH->conf["lang_cur"]] = (isset($ttH->post["friendly_link"])) ? $ttH->func->get_friendly_link ($ttH->post["friendly_link"]) : $ttH->func->get_friendly_link ($ttH->post["title"]);
				$friendly_link = ($ttH->post["friendly_link"]) ? $ttH->post["friendly_link"] : $ttH->post["title"];
				$data["arr_friendly_link"][$ttH->conf["lang_cur"]] = $ttH->func->get_friendly_link_db ($friendly_link, 'modules', 'mod_id', $name_action, $ttH->conf["lang_cur"]);
				
				$arr_title = array();
				$arr_friendly_link = array();
				foreach($ttH->data["lang"] as $lang_id => $lang_row){
					$arr_title[$lang_row["name"]] = $data["arr_title"][$lang_row["name"]];
					$arr_friendly_link[$lang_row["name"]] = $data["arr_friendly_link"][$lang_row["name"]];
				}
				
				$col["name_action"] = $name_action;
				$col["arr_title"] = serialize($arr_title);
				$col["arr_friendly_link"] = serialize($arr_friendly_link);
				$ok = $ttH->db->do_update("modules", $col, " mod_id='".$mod_id."'");	
				if($ok){
					
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_success"], "success");
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_false"], "error");	
				}
			}
		}
		
		$data["err"] = $err;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("id"=>$mod_id));
		$data["title"] = $data["arr_title"][$ttH->conf["lang_cur"]];
		$data["friendly_link"] = $data["arr_friendly_link"][$ttH->conf["lang_cur"]];
		
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
		$del_item = "";
		$del_item_lang = "";
		
		$query = $ttH->db->query("select id, mod_id from modules_lang where find_in_set(mod_id,'".$list_del."') and lang='".$ttH->conf["lang_cur"]."'");	
		while ($row = $ttH->db->fetch_row($query)){
			$check = $ttH->db->query("select id from modules_lang where mod_id='".$row["mod_id"]."' and lang!='".$ttH->conf["lang_cur"]."'");
			if (!$num_check = $ttH->db->num_rows($query)){	
				$del_item .= ($del_item) ? "," : "";
				$del_item .= $row["mod_id"];
			}
			$del_item_lang .= ($del_item_lang) ? "," : "";
			$del_item_lang .= $row["id"];
		}
		
		$ok = $ttH->db->delete ("modules_lang", "find_in_set(id,'".$del_item_lang."')");
    if ($ok){
			$ttH->db->delete ("modules", "find_in_set(mod_id,'".$del_item."')");
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
						$ok = $ttH->db->do_update("modules", $dup, "mod_id=" . $up_id[$i]);
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
		$res_num = $ttH->db->query("select mod_id from modules ".$where." ");
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
				$order_tmp = ($tmp[0] == "mod_id") ? "a.mod_id" : $tmp[0];
				$where .= " order by ".$order_tmp." ".$tmp[1];
				
				$arr_title[$tmp[0]]["class"] = $tmp[1];
				$arr_title[$tmp[0]]["link"] = $link_action."&p=".$p.$ext."&sort=".$tmp[0]."-".$arr_allow_sort[(3-(array_search($tmp[1],$arr_allow_sort)))];				
			} else {
				$sort = "";
			}
		}
		
		if($sort == "") {
			$where .= " order by mod_id asc";
		}
		//End sort
		
		//Title row
		foreach($arr_title as $k => $v) {
			$class = ($v["class"]) ? " class='".$v["class"]."'" : "";
			$data["f_".$k] = '<a href="'.$v["link"].'" '.$class.'>'.$v["title"].'</a>';
		}
		//End title row
		
		$sql = "select * from modules ".$where." limit $start,$n";
		//echo $sql;
		
		$nav = $ttH->admin->admin_paginate ($link_action, $num_total, $n, $ext, $p);
		
		$result = $ttH->db->query($sql);
		$i = 0;
		$html_row = "";
		if ($num = $ttH->db->num_rows($result)) {
			while ($row = $ttH->db->fetch_row($result)) {
				$i++;
				
				$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "edit", array("id"=>$row['mod_id']));
				$row["link_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_trash","id"=>$row['mod_id']));
				$row["link_restore"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_restore","id"=>$row['mod_id']));
				$row["link_del"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row['mod_id']));
				$arr_title = unserialize($row['arr_title']);
				$row['title'] = $arr_title[$ttH->conf['lang_cur']];
				$arr_friendly_link = unserialize($row['arr_friendly_link']);
				$row['friendly_link'] = $arr_friendly_link[$ttH->conf['lang_cur']];
				
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