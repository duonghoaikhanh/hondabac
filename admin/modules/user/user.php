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
	var $modules = "user";
	var $action = "user";
	var $sub = "manage";
	var $folder_upload = "user";
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
		load_setting ();
		
		$this->dir = create_folder(date("Y_m"));
		
		$data["link_manage"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "manage");
		$data["link_manage_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "manage_trash");
		$data["link_add"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "add");
		
		$this->sub = (isset($ttH->input["sub"])) ? $ttH->input["sub"] : "manage";
		switch ($this->sub) {
			/*case "add":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->modules."_".$this->sub];
				$data["main"] = $this->do_add();
				break;*/
			case "edit":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->modules."_".$this->sub];
				$data["main"] = $this->do_edit_pass();
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
	function do_edit_pass()
	{
		global $ttH;
		
		$err = "";
		
		$user_id = $ttH->input["id"];
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			$password = $ttH->func->md25($ttH->post['password']);
			
			if(empty($err) && $ttH->post['password'] != $ttH->post['re_password']) {
				$err = $ttH->html->html_alert ('Xác nhận mật khẩu không đúng', "error");	
			}	
			
			if(empty($err)){
				$col = array();
				if(!empty($ttH->post['password'])) {
					$col["password"] = $password;
				}
				$col["date_update"] = time();
				$ok = $ttH->db->do_update("user", $col, " user_id='".$user_id."'");	
				if($ok){
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_success"], "success");
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_false"], "error");	
				}
			}
		}
		
		$sql = "select * from user where user_id='".$user_id."'";
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
			$data['full_address'] = $ttH->func->full_address($data);
		} else {
			$link_go = $ttH->admin->get_link_admin ($this->modules, $this->action);
			$ttH->html->redirect_rel($link_go);
		}
		
		$data["err"] = $err;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("id"=>$user_id));
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("edit_pass");
		return $ttH->temp_act->text("edit_pass");
	}
	
	//-----------
	function do_edit()
	{
		global $ttH;
		
		$err = "";
		
		$user_id = $ttH->input["id"];
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			$username = trim($ttH->post['username']);
			$email = trim($ttH->post['email']);
			$nickname = trim($ttH->post['nickname']);
			$phone = trim($ttH->post['phone']);
			$address = trim($ttH->post['address']);
			
			$password = $ttH->func->md25($ttH->post['password']);
			
			$sql = "select username,email from user where (username='".$username."' or email='".$email."') and user_id!='".$user_id."'";
			$result = $ttH->db->query($sql);
			if ($check = $ttH->db->fetch_row($result)){
				if(empty($err) && $check['username'] == $username) {
					$err = $ttH->html->html_alert ('Tên đăng nhập đã tồn tại', "error");	
				}
				if(empty($err) && $check['email'] == $email) {
					$err = $ttH->html->html_alert ('Email đã tồn tại', "error");	
				}
			}
			
			if(empty($err) && empty($username)) {
				$err = $ttH->html->html_alert ('Tên đăng nhập chưa nhập', "error");	
			}
			if(empty($err) && empty($email)) {
				$err = $ttH->html->html_alert ('Email chưa nhập', "error");	
			}
			if(empty($err) && empty($nickname)) {
				$err = $ttH->html->html_alert ('Tên hiển thị chưa nhập', "error");	
			}	
			if(empty($err) && empty($phone)) {
				$err = $ttH->html->html_alert ('Điện thoại chưa nhập', "error");	
			}		
			if(empty($err) && empty($address)) {
				$err = $ttH->html->html_alert ('Địa chỉ chưa nhập', "error");	
			}	
			
			if(empty($err) && $ttH->post['password'] != $ttH->post['re_password']) {
				$err = $ttH->html->html_alert ('Xác nhận mật khẩu không đúng', "error");	
			}	
			
			if(empty($err)){
				$col = array();
				$col["username"] = $username;
				if(!empty($ttH->post['password'])) {
					$col["password"] = $password;
				}
				$col["email"] = $email;
				$col["nickname"] = $nickname;
				$col["phone"] = $phone;
				$col["address"] = $address;
				$col["date_update"] = time();
				$ok = $ttH->db->do_update("user", $col, " user_id='".$user_id."'");	
				if($ok){
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_success"], "success");
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_false"], "error");	
				}
			}
		}
		
		$sql = "select * from user where user_id='".$user_id."'";
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
		} else {
			$link_go = $ttH->admin->get_link_admin ($this->modules, $this->action);
			$ttH->html->redirect_rel($link_go);
		}
		
		$data["err"] = $err;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("id"=>$user_id));
		
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
		
		$ok = $ttH->db->delete ("user", "find_in_set(user_id,'".$list_del."')");
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
					$arr_is_show = (isset($ttH->post["is_show"])) ? $ttH->post["is_show"] : array();
							
					$mess = $ttH->lang['global']['edit_success'] . " ID: <strong>";
					$str_mess = "";
					for ($i = 0; $i < count($up_id); $i ++){
						$dup = array();
						//$dup['show_order'] = $arr_show_order[$up_id[$i]];
						$dup['is_show'] = $arr_is_show[$up_id[$i]];
						$ok = $ttH->db->do_update("user", $dup, "user_id=" . $up_id[$i]);
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
						$list_del = @implode(',',$ttH->post['selected_id']);
					}
					$err = $this->do_del ($list_del);
					break;
		  }
		}
		$p = (isset($ttH->input["p"])) ? $ttH->input["p"] : 1;
		$search_date_begin = (isset($ttH->input["search_date_begin"])) ? $ttH->input["search_date_begin"] : "";
		$search_date_end = (isset($ttH->input["search_date_end"])) ? $ttH->input["search_date_end"] : "";
		$search_group_id = (isset($ttH->input["search_group_id"])) ? $ttH->input["search_group_id"] : 0;
		$search_title = (isset($ttH->input["search_title"])) ? $ttH->input["search_title"] : "";
		
		$where = " where user_id>0 ";
		$ext = "";
		
		if($search_date_begin || $search_date_end ){
			$tmp1 = @explode("/", $search_date_begin);
			$time_begin = @mktime(0, 0, 0, $tmp1[1], $tmp1[0], $tmp1[2]);
			
			$tmp2 = @explode("/", $search_date_end);
			$time_end = @mktime(23, 59, 59, $tmp2[1], $tmp2[0], $tmp2[2]);
			
			$where.=" AND (date_create BETWEEN {$time_begin} AND {$time_end} ) ";
			$ext.="&date_begin=".$search_date_begin."&date_end=".$search_date_end;
		}
		
		if(!empty($search_group_id)){
			$where .=" and group_id='".$search_group_id."' ";			
			$ext.="&search_group_id=".$search_group_id;
		}
		
		if(!empty($search_title)){
			$where .=" and (
				user_id='$search_title' 
				or username like '%$search_title%'
				or nickname like '%$search_title%'
				or email like '%$search_title%'
				or address like '%$search_title%'
			) ";			
			$ext.="&search_title=".$search_title;
		}
    
		$num_total = 0;
		$res_num = $ttH->db->query("select user_id from user ".$where." ");
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
			"user_id" => array(
				"title" => $ttH->lang["global"]["id"],
				"link" => $link_action."&p=".$p.$ext."&sort=user_id-desc",
				"class" => ""
			),
			"username" => array(
				"title" => $ttH->lang["user"]["username"],
				"link" => $link_action."&p=".$p.$ext."&sort=username-desc",
				"class" => ""
			),
			"nickname" => array(
				"title" => $ttH->lang["user"]["nickname"],
				"link" => $link_action."&p=".$p.$ext."&sort=nickname-desc",
				"class" => ""
			),
			"is_show" => array(
				"title" => $ttH->lang["user"]["status"],
				"link" => $link_action."&p=".$p.$ext."&sort=is_show-desc",
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
				$order_tmp = ($tmp[0] == "user_id") ? "a.user_id" : $tmp[0];
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
		
    $sql = "select * from user ".$where." limit $start,$n";
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
				
				$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "edit", array("id"=>$row['user_id']));
				$row["link_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_trash","id"=>$row['user_id']));
				$row["link_restore"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_restore","id"=>$row['user_id']));
				$row["link_del"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row['user_id']));
				
				$row["status"] = status_info ($row["is_show"]);
				$row['is_show'] = list_status ("is_show[".$row['user_id']."]", $row['is_show'], "  onchange=\"do_check (".$row['user_id'].")\" style=\"width:100%;\"");
				
				$ttH->temp_act->assign('row', $row);
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
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("manage");
		return $ttH->temp_act->text("manage");
	}

  // end class
}
?>