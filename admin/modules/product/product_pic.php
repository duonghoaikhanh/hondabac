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
	var $modules = "product";
	var $action = "product_pic";
	var $sub = "manage";
	var $folder_upload = "product";
	var $dir = "";
	var $type = "";
	var $type_id = "";
	var $ext_link = "";
	
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
		
		$this->type = (isset($ttH->get['type'])) ? $ttH->get['type'] : '';
		$this->type_id = (isset($ttH->get['type_id'])) ? (int)$ttH->get['type_id'] : 0;
		$this->ext_link = '&type='.$this->type.'&type_id='.$this->type_id;
		
		if(($this->type != 'group' && $this->type != 'item') || $this->type_id<=0) {
			$ttH->html->redirect_rel($ttH->admin->get_link_admin ($this->modules, $this->modules, "manage"));
		}
		
		$data["link_manage"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "manage").$this->ext_link;
		$data["link_manage_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "manage_trash").$this->ext_link;
		$data["link_add"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "add").$this->ext_link;
		
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
			
			if(empty($ttH->post["title"]))
				$err = $ttH->html->html_alert ($ttH->lang["global"]["err_invalid_title"], "error");
			if(empty($ttH->post["picture"]))
				$err = $ttH->html->html_alert ('Vui lòng chọn hình', "error");	
			
			if(empty($err)){
				$ok = 0;
				$arr_title = $ttH->post["title"];
				$arr_content = $ttH->post["content"];
				foreach($ttH->post["picture"] as $key => $picture) {
					if(!empty($picture)) {
						$col = array();
						$col["pic_id"] = 0;
						$col["type"] = $this->type;
						$col["type_id"] = $this->type_id;
						$col["picture"] = $ttH->func->get_input_pic ($picture);
						$col["title"] = $arr_title[$key];
						$col["content"] = $arr_content[$key];
						$col["show_order"] = 0;
						$col["is_show"] = 1;
						$col["date_create"] = time();
						$col["date_update"] = time();
						$i = 0;
						foreach($ttH->data["lang"] as $lang_id => $lang_row){
							$i++;
							$col["lang"] = $lang_row["name"];
							$ok = $ttH->db->do_insert("product_pic", $col);	
							if($ok && $col["pic_id"] == 0){
								$pic_id = $ttH->db->insertid();
								$col["pic_id"] = $pic_id;
								
								$col_l = array();
								$col_l["pic_id"] = $pic_id;
								
								$ttH->db->do_update("product_pic", $col_l, " id='".$pic_id."'");	// update current
							}
						}
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
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub).$this->ext_link;
		
		for($i=1;$i<=5;$i++) {
			$data['index'] = $i;
			
			$data['html_picture'] = $ttH->admin->get_form_pic (
				'picture['.$data['index'].']', 
				(isset($data['picture'][$data['index']]) ? $data['picture'][$data['index']] : ''),
				$this->folder_upload, 
				$this->dir
				);
			
			$ttH->temp_act->assign('data', $data);
			$ttH->temp_act->parse("add.row");
		}
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("add");
		return $ttH->temp_act->text("add");
	}
	
	//-----------
	function do_edit()
	{
		global $ttH;
		
		$err = "";
		
		$pic_id = $ttH->input["id"];
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			if(empty($ttH->post["title"]))
				$err = $ttH->html->html_alert ($ttH->lang["global"]["err_invalid_title"], "error");	
			
			if(empty($err)){
				$col = array();
				$col["type_id"] = (isset($ttH->post["type_id"])) ? $ttH->post["type_id"] : 0;
				$col["picture"] = $ttH->func->get_input_pic ($ttH->post["picture"]);
				$col["date_update"] = time();
				$ok = $ttH->db->do_update("product_pic", $col, " pic_id='".$pic_id."'");	
				if($ok){
					$col_l = array();
					$col_l["title"] = $ttH->post["title"];
					$col_l["content"] = $ttH->func->input_editor ($ttH->post["content"]);
					
					$ttH->db->do_update("product_pic", $col_l, " pic_id='".$pic_id."' and lang='".$ttH->conf["lang_cur"]."'");	
					
					$link = $ttH->admin->get_link_admin ($this->modules, $this->action).$this->ext_link;
					$err = $ttH->html->alert ($ttH->lang["global"]["edit_success"], $link);
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_false"], "error");	
				}
			}
		}
		
		$sql = "select * from product_pic 
						where lang='".$ttH->conf['lang_cur']."' 
						and pic_id='".$pic_id."' limit 0,1";
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
			if(!empty($data['picture'])) {
				$data['pic'] = '<img src="'.$ttH->conf["rooturl"].'uploads/'.$this->modules.'/'.$data['picture'].'" alt="'.$data['picture'].'" style="max-width:300px;" />';
			}
		}
		
		$data["err"] = $err;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("id"=>$pic_id)).$this->ext_link;
		$data['list_type'] = $this->get_list_type();
		$data['picture'] = $ttH->admin->get_form_pic ('picture', $data['picture'], $this->folder_upload, $this->dir);
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("edit");
		return $ttH->temp_act->text("edit");
	}
	
	//-------------- 
  function do_del ($list_del = "")
  {
    global $ttH;
		
		if(empty($list_del)){
			$ttH->html->alert ($ttH->lang["global"]["not_found_product"], $ttH->admin->get_link_admin ($this->modules, $this->action)).$this->ext_link;
		}
		
		$ok = $ttH->db->delete ("product_pic", "find_in_set(pic_id,'".$list_del."')");
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
						$ok = $ttH->db->do_update("product_pic", $dup, "pic_id=" . $up_id[$i]);
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
						$ok = $ttH->db->do_update("product_pic", $dup, "pic_id=" . $up_id[$i]);
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
						$ok = $ttH->db->do_update("product_pic", $dup, "pic_id=" . $up_id[$i]);
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
		
		$where = " and lang='".$ttH->conf['lang_cur']."' and type='".$this->type."' and type_id='".$this->type_id."' ";
		$ext = "";
		
		if($is_show == "trash" ){
			$where .= " and is_show=0 ";
		}else{
			$where .= " and is_show=1 ";
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
		$res_num = $ttH->db->query("select pic_id 
						from product_pic 
						where 1 ".$where." ");
			$num_total = $ttH->db->num_rows($res_num);
		$n = ($ttH->conf["n_list"]) ? $ttH->conf["n_list"] : 30;
		$num_products = ceil($num_total / $n);
		if ($p > $num_products)
		  $p = $num_products;
		if ($p < 1)
		  $p = 1;
		$start = ($p - 1) * $n;
		
		$link_action = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub).$this->ext_link;
		
		//Sort
		$arr_title = array(
			"pic_id" => array(
				"title" => $ttH->lang["global"]["id"],
				"link" => $link_action."&p=".$p.$ext."&sort=pic_id-desc",
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
				$order_tmp = ($tmp[0] == "pic_id") ? "a.pic_id" : $tmp[0];
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
		
    $sql = "select * 
						from product_pic 
						where 1 
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
				
				$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "edit", array("id"=>$row['pic_id'])).$this->ext_link;
				$row["link_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_trash","id"=>$row['pic_id'])).$this->ext_link;
				$row["link_restore"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_restore","id"=>$row['pic_id'])).$this->ext_link;
				$row["link_del"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row['pic_id'])).$this->ext_link;
				
				if(!empty($row["picture"])){
					$row["picture"] = '<a class="fancybox-effects-a" title="'.$row["picture"].'" href="'.DIR_UPLOAD.$row["picture"].'">
						'.$ttH->func->get_pic_mod($row["picture"], 50, 50, '', 1, 0, array('fix_width'=>1)).'
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
		
		$data['date_begin'] = $date_begin;
		$data['date_end'] = $date_end;
		$data['keyword'] = $keyword;
		$data['list_type'] = $this->get_list_type();
		
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
	function get_list_type()
	{
		global $ttH;
		
		$output = "";		
		
		switch ($this->type) {
			case "group":
				$link = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
				$ext = "onchange=\"go_link('".$link."&type=".$this->type."&type_id='+this.value)\"";
				if($this->sub == 'edit') {
					$ext = '';
				}
				$output = list_group ("type_id", $this->type_id, " class=\"form-control\" ".$ext, array("title" => $ttH->lang['global']['select_title']));
				break;
			case "item":
				$link = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
				$ext = "onchange=\"go_link('".$link."&type=".$this->type."&type_id='+this.value)\"";
				if($this->sub == 'edit') {
					$ext = '';
				}
				$output = list_product ("type_id", $this->type_id, " class=\"form-control\" ".$ext, array("title" => $ttH->lang['global']['select_title']));
				break;
		}
		
		return $output;
	}

  // end class
}
?>