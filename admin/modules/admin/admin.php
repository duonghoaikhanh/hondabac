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
	var $modules = "admin";
	var $action = "admin";
	var $sub = "manage";
	var $folder_upload = "admin";
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
		
		$err = "";
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			$username = $ttH->post["username"];
			$full_name = $ttH->post["full_name"];
			$email = $ttH->post["email"];
			$password = $ttH->func->md25($ttH->post["password"]);
			
			if(empty($err) && empty($username)) {
				$err = $ttH->html->html_alert ($ttH->lang["admin"]["err_username_invalid"], "error");	
			}
			if(empty($err) && empty($full_name)) {
				$err = $ttH->html->html_alert ($ttH->lang["admin"]["err_full_name_invalid"], "error");
			}
			if(empty($err) && empty($email)) {
				$err = $ttH->html->html_alert ($ttH->lang["admin"]["err_email_invalid"], "error");
			}
			if(empty($err) && empty($ttH->post["password"])) {
				$err = $ttH->html->html_alert ($ttH->lang["admin"]["err_password_invalid"], "error");
			}
					
			if(empty($err)) {
				$res_ck = $ttH->db->query("select username,email from admin where (username='".$username."' or email='".$email."')");
				if ($row_ck = $ttH->db->fetch_row($res_ck))	{
					if(empty($err) && $row_ck["email"] == $email) {
						$err = $ttH->func->html_err($ttH->lang["admin"]["err_email_existed"]);
					}					
					if(empty($err) && $row_ck["username"] == $username) {
						$err = $ttH->func->html_err($ttH->lang["admin"]["err_username_existed"]);
					}					
				}
			}
			
			
			if(empty($err)){
				$col = array();
				$col["group_id"] = $ttH->post["group_id"];
				$col["username"] = $username;
				$col["password"] = $password;			
				$col["picture"] = $ttH->func->get_input_pic ($ttH->post["picture"]);
				$col["full_name"] = $full_name;
				$col["email"] = $email;
				$ok = $ttH->db->do_insert("admin", $col);	
				if($ok){					
					$err = $ttH->html->html_alert ($ttH->lang["global"]["add_success"], "success");
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["global"]["add_false"], "error");	
				}
			}
		}
		
		$data["err"] = $err;
		
		$arr_isset = array('group_id','picture');
		foreach($arr_isset as $tmp) {
			$data[$tmp] = (isset($data[$tmp])) ? $data[$tmp] : '';
		}
		
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
		$data['picture'] = $ttH->admin->get_form_pic ('picture', $data['picture'], $this->folder_upload, $this->dir);
		$data["list_group"] = list_group ("group_id", $data["group_id"], " class=\"form-control\"", array("title" => $ttH->lang['global']['select_title']));
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("edit");
		return $ttH->temp_act->text("edit");
	}
	
	//-----------
	function do_edit()
	{
		global $ttH;
		
		$err = "";
		
		$id = $ttH->input["id"];
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			$username = $ttH->post["username"];
			$full_name = $ttH->post["full_name"];
			$email = $ttH->post["email"];
			$password = $ttH->func->md25($ttH->post["password"]);
			
			if(empty($err) && empty($username)) {
				$err = $ttH->html->html_alert ($ttH->lang["admin"]["err_username_invalid"], "error");	
			}
			if(empty($err) && empty($full_name)) {
				$err = $ttH->html->html_alert ($ttH->lang["admin"]["err_full_name_invalid"], "error");
			}
			if(empty($err) && empty($email)) {
				$err = $ttH->html->html_alert ($ttH->lang["admin"]["err_email_invalid"], "error");
			}
					
			if(empty($err)) {
				$res_ck = $ttH->db->query("select username,email from admin where (username='".$username."' or email='".$email."') AND id !=".$id);
				if ($row_ck = $ttH->db->fetch_row($res_ck))	{
					if(empty($err) && $row_ck["email"] == $email) {
						$err = $ttH->func->html_err($ttH->lang["admin"]["err_email_existed"]);
					}					
					if(empty($err) && $row_ck["username"] == $username) {
						$err = $ttH->func->html_err($ttH->lang["admin"]["err_username_existed"]);
					}					
				}
			}
			
			if(empty($err)){
				$col = array();
				$col["group_id"] = $ttH->post["group_id"];
				$col["username"] = $username;
				if(!empty($ttH->post["password"])) {
					$col["password"] = $password;
				}				
				$col["picture"] = $ttH->func->get_input_pic ($ttH->post["picture"]);
				$col["full_name"] = $full_name;
				$col["email"] = $email;
				$ok = $ttH->db->do_update("admin", $col, " id='".$id."'");	
				if($ok){		
					if($_SESSION[$ttH->conf["admin_ses"]]["userid"] == $id && !empty($ttH->post["password"])){
						$_SESSION[$ttH->conf["admin_ses"]]["password"] = $password;
					}
							
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_success"], "success");
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_false"], "error");	
				}
			}
		}
		
		$sql = "select * from admin where id=" . $id;
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
		}
		
		$data["err"] = $err;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("id"=>$id));
		$data['picture'] = $ttH->admin->get_form_pic ('picture', $data['picture'], $this->folder_upload, $this->dir);
		$data["list_group"] = list_group ("group_id", $data['group_id'], " class=\"form-control\"", array("title" => $ttH->lang['global']['select_title']));
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("edit");
		return $ttH->temp_act->text("edit");
	}
	
	//-------------- 
  function do_del ($list_del = "")
  {
    global $ttH;
		
		if(empty($list_del)){
			$ttH->html->alert ($ttH->lang["global"]["not_found_item"], $ttH->admin->get_link_admin ($this->modules, $this->action));
		}
		
		$ok = $ttH->db->delete ("admin", "id!=1 and find_in_set(id,'".$list_del."')");
    if ($ok){
      $mess = $ttH->html->html_alert($ttH->lang["global"]["del_success"], "success");
    } else  {
      $mess = $ttH->html->html_alert($ttH->lang["global"]["del_false"], "error");
    }
		
		return $mess;
  }
	
	//-----------
	function do_manage()
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
						$ok = $ttH->db->do_update("admin", $dup, "id=" . $up_id[$i]);
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
				case "do_del":
					if(isset($ttH->input['id'])){
						$list_del = $ttH->input['id'];
					}elseif(isset($ttH->post['selected_id']) && is_array($ttH->post['selected_id'])){
						$list_del = implode(',',$ttH->post['selected_id']);
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
		$res_num = $ttH->db->query("select id from admin ".$where." ");
			$num_total = $ttH->db->num_rows($res_num);
		$n = ($ttH->conf["n_list"]) ? $ttH->conf["n_list"] : 30;
		$num_admins = ceil($num_total / $n);
		if ($p > $num_admins)
		  $p = $num_admins;
		if ($p < 1)
		  $p = 1;
		$start = ($p - 1) * $n;
		
		$link_action = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
		
		//Sort
		$arr_title = array(
			"id" => array(
				"title" => $ttH->lang["global"]["id"],
				"link" => $link_action."&p=".$p.$ext."&sort=id-desc",
				"class" => ""
			),
			"full_name" => array(
				"title" => $ttH->lang["admin"]["full_name"],
				"link" => $link_action."&p=".$p.$ext."&sort=full_name-desc",
				"class" => ""
			),
			"picture" => array(
				"title" => $ttH->lang["global"]["picture"],
				"link" => $link_action."&p=".$p.$ext."&sort=picture-desc",
				"class" => ""
			),
			"username" => array(
				"title" => $ttH->lang["admin"]["username"],
				"link" => $link_action."&p=".$p.$ext."&sort=username-desc",
				"class" => ""
			),
			"email" => array(
				"title" => $ttH->lang["admin"]["email"],
				"link" => $link_action."&p=".$p.$ext."&sort=email-desc",
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
			$where .= " order by id DESC";
		}
		//End sort
		
		//Title row
		foreach($arr_title as $k => $v)
		{
			$class = ($v["class"]) ? " class='".$v["class"]."'" : "";
			$data["f_".$k] = '<a href="'.$v["link"].'" '.$class.'>'.$v["title"].'</a>';
		}
		//End title row
		
    $sql = "select * from admin ".$where." limit $start,$n";
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
				
				$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "edit", array("id"=>$row['id']));
				$row["link_del"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row['id']));
				
				if(!empty($row["picture"])){
					$row["picture"] = '<a class="fancybox-effects-a" title="'.$row["picture"].'" href="'.DIR_UPLOAD.$row["picture"].'">
						'.$ttH->func->get_pic_mod($row["picture"], 50, 50, '', 1, 0, array('fix_width'=>1)).'
					</a>';
				}
				if($row['id'] == 1) {
					$ttH->temp_act->assign('row', $row);
					$ttH->temp_act->parse("manage.row_item_admin");
				} else {
					$ttH->temp_act->assign('row', $row);
					$ttH->temp_act->parse("manage.row_item");
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
		
		$data['date_begin'] = $date_begin;
		$data['date_end'] = $date_end;
		//$data["list_search"] = list_search_domain ("search", $search);
		$data['keyword'] = $keyword;
		
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("manage");
		return $ttH->temp_act->text("manage");
	}

  // end class
}
?>