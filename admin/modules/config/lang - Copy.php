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
	var $action = "lang";
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
			/*case "add":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->action."_".$this->sub];
				$data["main"] = $this->do_add();
				break;
			case "edit":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->action."_".$this->sub];
				$data["main"] = $this->do_edit();
				break;*/
			case "setting":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->action."_".$this->sub];
				$data["main"] = $this->do_setting();
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
		
		$dir = create_folder(date("Y_m"));
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			if(empty($ttH->post["title"])) {
				$err = $ttH->html->html_alert ($ttH->lang["global"]["err_invalid_title"], "error");	
			}	
			
			if(empty($err)){
				$col = array();
				$col["show_order"] = 0;
				$col["is_show"] = 1;
				$col["date_create"] = time();
				$col["date_update"] = time();
				$ok = $ttH->db->do_insert("lang", $col);	
				if($ok){
					$id = $ttH->db->insertid();
					$col_l = array();
					$col_l["id"] = $id;
					$col_l["title"] = $ttH->post["title"];
					$col_l["content"] = $ttH->func->input_editor ($ttH->post["content"]);
					$col_l["friendly_link"] = ($ttH->post["friendly_link"]) ? $ttH->func->get_friendly_link ($ttH->post["friendly_link"]) : $ttH->func->get_friendly_link ($ttH->post["title"]);
					$col_l["meta_title"] = ($ttH->post["meta_title"]) ? $ttH->post["meta_title"] : $ttH->func->meta_title ($ttH->post["title"]);
					$col_l["meta_key"] = ($ttH->post["meta_key"]) ? $ttH->post["meta_key"] : $ttH->func->meta_key ($ttH->post["title"]);
					$col_l["meta_desc"] = ($ttH->post["meta_desc"]) ? $ttH->func->meta_desc ($ttH->post["meta_desc"]) : $ttH->func->meta_desc ($ttH->post["content"]);
					
					foreach($ttH->data["lang"] as $lang_id => $lang_row){
						$col_l["lang"] = $lang_row["name"];
						$ttH->db->do_insert("lang_lang", $col_l);	
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
		
		$arr_isset = array('content');
		foreach($arr_isset as $tmp) {
			$data[$tmp] = (isset($data[$tmp])) ? $data[$tmp] : '';
		}
		
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
		$data["html_content"] = $ttH->editor->load_editor ("content", "content", $data['content'], "", "full", array("folder_up" => $this->modules, "fldr" => $dir));
		
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
		
		$id = $ttH->input["id"];
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			if(empty($ttH->post["title"])) {
				$err = $ttH->html->html_alert ($ttH->lang["global"]["err_invalid_title"], "error");	
			}	
				
			if(empty($err)){
				$col = array();
				$col["date_update"] = time();
				$ok = $ttH->db->do_update("lang", $col, " id='".$id."'");	
				if($ok){
					$col_l = array();
					$col_l["title"] = $ttH->post["title"];
					$col_l["content"] = $ttH->func->input_editor ($ttH->post["content"]);
					$col_l["friendly_link"] = ($ttH->post["friendly_link"]) ? $ttH->func->get_friendly_link ($ttH->post["friendly_link"]) : $ttH->func->get_friendly_link ($ttH->post["title"]);
					$col_l["meta_title"] = ($ttH->post["meta_title"]) ? $ttH->post["meta_title"] : $ttH->func->meta_title ($ttH->post["title"]);
					$col_l["meta_key"] = ($ttH->post["meta_key"]) ? $ttH->post["meta_key"] : $ttH->func->meta_key ($ttH->post["title"]);
					$col_l["meta_desc"] = ($ttH->post["meta_desc"]) ? $ttH->func->meta_desc ($ttH->post["meta_desc"]) : $ttH->func->meta_desc ($ttH->post["content"]);
					
					$ttH->db->do_update("lang_lang", $col_l, " id='".$id."' and lang='".$ttH->conf["lang_cur"]."'");	
					
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_success"], "success");
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_false"], "error");	
				}
			}
		}
		
		$sql = "select * from lang a, lang_lang al 
						where a.id=al.id 
						and a.id=" . $id;
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
		}
		
		$data["err"] = $err;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("id"=>$id));
		$data["html_content"] = $ttH->editor->load_editor ("content", "content", $data["content"], "", "full", array("folder_up" => $this->modules, "fldr" => $dir));
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("edit");
		return $ttH->temp_act->text("edit");
	}
	
	//-----------
	function do_setting()
	{
		global $ttH;
		
		$err = "";
		
		$file_name = (isset($ttH->get['file_lang'])) ? $ttH->get['file_lang'] : 'global';
		$file_lang = $ttH->conf["rootpath"] . DS . "lang". DS . $ttH->conf["lang_cur"] . DS . $file_name . ".php";
		if (file_exists($file_lang)) {
		  require_once ($file_lang);
		  if (is_array($lang)) {
				foreach ($lang as $k => $v) {
					$row['arr_key'] = $k;
          $row['arr_text'] = trim(stripslashes($v));
          $ttH->temp_act->assign('row', $row);
          $ttH->temp_act->parse("setting.row");
				}
		  }
		}
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
				
			$file_string = "<?php \n";
      $file_string .= "if ( !defined('IN_ttH') )	{ die('Access denied');	} \n";
      $file_string .= "$" . "lang = array ( \n";
			$i = count($lang);
      foreach ($lang as $key => $value) {
				$i--;
        $value = preg_replace("/'/", "\\'", $ttH->post[$key]);
        $value = str_replace("\r\n", "<br>", $value);
				if(substr($value,-1) == '\\') {
					$value .= ' ';
				}
				
        if (get_magic_quotes_gpc()) {
          $value = stripslashes($value);
        }
        $file_string .= "\t'$key'";
        $file_string .= " => ";
        $file_string .= "'$value'";
        $file_string .= ($i > 0) ? ",\n" : "\n";
        //	echo "key = $key <br>";
      //	echo "value = $value <br>";
      }
      $file_string .= "); \n?>\n";
			
      if ($FH = @fopen($file_lang, 'w')) {
        fwrite($FH, $file_string, strlen($file_string));
        fclose($FH);
        
				$url = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array('file_lang' => $file_name));
				$ttH->html->alert ($ttH->lang["global"]["edit_success"], $url);
			}else{
				$ttH->html->alert ($ttH->lang["global"]["edit_false"], $url);	
      }
		}
		
		$data["err"] = $err;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array('file_lang' => $file_name));
		$data["list_file_lang"] = list_file_lang ("file_lang", $file_name, "class=\"form-control\" onchange=\"go_link('".$data["link_action"]."&file_lang='+this.value)\"");
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("setting");
		return $ttH->temp_act->text("setting");
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
					//Update default
					$is_default = (isset($ttH->post['is_default'])) ? $ttH->post['is_default'] : 1;
					$ok = $ttH->db->do_update("lang", array('is_default' => 1), "id='".$is_default."'");
					if($ok > 0){
						$ttH->db->do_update("lang", array('is_default' => 0), "id!='".$is_default."'");
					}
					//End Update default
					
					$arr_show_order = (isset($ttH->post["show_order"])) ? $ttH->post["show_order"] : array();
					$arr_title = (isset($ttH->post["title"])) ? $ttH->post["title"] : array();
							
					$mess = $ttH->lang['global']['edit_success'] . " ID: <strong>";
					$str_mess = "";
					for ($i = 0; $i < count($up_id); $i ++){
						$dup['show_order'] = $arr_show_order[$up_id[$i]];
						$dup['title'] = $arr_title[$up_id[$i]];
						$ok = $ttH->db->do_update("lang", $dup, "id=" . $up_id[$i]);
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
    
		$num_total = 0;
		$res_num = $ttH->db->query("select id from lang ".$where." ");
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
			"id" => array(
				"title" => $ttH->lang["global"]["id"],
				"link" => $link_action."&p=".$p.$ext."&sort=id-asc",
				"class" => ""
			),
			"show_order" => array(
				"title" => $ttH->lang["global"]["show_order"],
				"link" => $link_action."&p=".$p.$ext."&sort=show_order-asc",
				"class" => ""
			),
			"name" => array(
				"title" => $ttH->lang["global"]["name_action"],
				"link" => $link_action."&p=".$p.$ext."&sort=name-asc",
				"class" => ""
			),
			"title" => array(
				"title" => $ttH->lang["global"]["title"],
				"link" => $link_action."&p=".$p.$ext."&sort=title-asc",
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
				$order_tmp = ($tmp[0] == "id") ? "a.id" : $tmp[0];
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
			$where .= " order by id asc";
		}
		//End sort
		
		//Title row
		foreach($arr_title as $k => $v)
		{
			$class = ($v["class"]) ? " class='".$v["class"]."'" : "";
			$data["f_".$k] = '<a href="'.$v["link"].'" '.$class.'>'.$v["title"].'</a>';
		}
		//End title row
		
    $sql = "select * from lang 
						".$where." 
						limit $start,$n";
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
				
				$row["link_setting"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "setting", array('lang' => $row['name']));
				$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "edit", array("id"=>$row['id']));
				$row["link_del"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row['id']));
				
				$row['ck_default'] = ($row['is_default'] == 1) ? ' checked="checked"' : '';
				
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