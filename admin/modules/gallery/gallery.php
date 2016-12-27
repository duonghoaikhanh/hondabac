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
	var $modules = "gallery";
	var $action = "gallery";
	var $sub = "manage";
	var $folder_upload = "gallery";
	var $dir = "";
	var $dbtable = "gallery";
	var $dbtable_id = "item_id";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		$ttH->func->load_language_admin($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS.$this->action.".tpl");
		$ttH->temp_act->assign('DIR_JS', $ttH->dir_js);
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
			case "ajax_upload":
				$this->ajax_upload();
				break;
			case "iframe_upload":
				$this->iframe_upload();
				break;
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
	function ajax_upload()
	{
		global $ttH;
		
		flush();
		
		$ttH->conf['cur_folder'] = $this->dir;
		
		require_once('ajax/upload.php');
		
		exit;
	}
	
	//-----------
	function iframe_upload()
	{
		global $ttH;
		
		flush();
		
		$data = array();
		$err = '';
		$ok = 0;
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			$group_id = (isset($ttH->post['group_id'])) ? $ttH->post['group_id'] : 0;
			
			if(empty($err)){
				
				$num = (isset($ttH->post['uploader_count'])) ? $ttH->post['uploader_count'] : 0;
				for($i=0; $i< $num; $i++) {
					$status = (isset($ttH->post['uploader_'.$i.'_status'])) ? $ttH->post['uploader_'.$i.'_status'] : '';
					if($status == 'done') {
						
						$title = $ttH->post['uploader_'.$i.'_name'];
						
						$col = array();
						$col["group_nav"] = get_group_nav ($group_id,0,'gallery');
						$col["group_id"] = $group_id;
						$col["picture"] = $this->folder_upload.'/'.$this->dir.'/'.$ttH->post['uploader_'.$i.'_name'];
						$col["title"] = $title;
						$col["show_order"] = 0;
						$col["is_show"] = 1;
						$col["date_create"] = time();
						$col["date_update"] = time();
						
						foreach($ttH->data["lang"] as $lang_id => $lang_row){
		
							if(isset($item_id) && $item_id) {
								$friendly_link = (isset($ttH->post["friendly_link"]) && $ttH->post["friendly_link"]) ? $ttH->post["friendly_link"] : $title;
								$col["friendly_link"] = $ttH->func->get_friendly_link_db ($friendly_link, $this->dbtable, $this->dbtable_id, $item_id, $lang_row["name"]);
								$col["meta_title"] = (isset($ttH->post["meta_title"]) && $ttH->post["meta_title"]) ? $ttH->post["meta_title"] : $ttH->func->meta_title ($title);
								$col["meta_key"] = (isset($ttH->post["meta_key"]) && $ttH->post["meta_key"]) ? $ttH->post["meta_key"] : $ttH->func->meta_key ($title);
								$col["meta_desc"] = (isset($ttH->post["meta_desc"]) && $ttH->post["meta_desc"]) ? $ttH->func->meta_desc ($ttH->post["meta_desc"]) : $ttH->func->meta_desc (isset($ttH->post["content"]) ? $ttH->post["content"] : '');
							}
							
							$col["lang"] = $lang_row["name"];
							
							$ok = $ttH->db->do_insert('gallery', $col);	
							if($ok && (!isset($col['item_id']))){
								$item_id = $ttH->db->insertid();
								$col['item_id'] = $item_id;
								
								$col_l = array();
								$col_l['item_id'] = $item_id;
								
								$friendly_link = (isset($ttH->post["friendly_link"]) && $ttH->post["friendly_link"]) ? $ttH->post["friendly_link"] : $title;
								$col_l["friendly_link"] = $ttH->func->get_friendly_link_db ($friendly_link, $this->dbtable, $this->dbtable_id, $item_id, $lang_row["name"]);
								$col_l["meta_title"] = (isset($ttH->post["meta_title"]) && $ttH->post["meta_title"]) ? $ttH->post["meta_title"] : $ttH->func->meta_title ($title);
								$col_l["meta_key"] = (isset($ttH->post["meta_key"]) && $ttH->post["meta_key"]) ? $ttH->post["meta_key"] : $ttH->func->meta_key ($title);
								$col_l["meta_desc"] = (isset($ttH->post["meta_desc"]) && $ttH->post["meta_desc"]) ? $ttH->func->meta_desc ($ttH->post["meta_desc"]) : $ttH->func->meta_desc (isset($ttH->post["content"]) ? $ttH->post["content"] : '');
								
								$ttH->db->do_update('gallery', $col_l, " id='".$item_id."'");	// update current
							}
						}
					}
				}
				$link = $ttH->admin->get_link_admin ($this->modules, $this->action, "iframe_upload");
				if($ok){
					$ttH->html->alert($ttH->lang["global"]["add_success"], $link);
				}else{
					$ttH->html->alert($ttH->lang["global"]["add_false"], $link);	
				}
			}
		}
		
		$data['group_id'] = (isset($ttH->input['group_id'])) ? $ttH->input['group_id'] : 0;
		$data['link_action'] = $ttH->admin->get_link_admin ($this->modules, $this->action, "iframe_upload");
		$data['url_upload'] = $ttH->admin->get_link_admin ($this->modules, $this->action, "ajax_upload");
		//$data['url_upload'] = $ttH->conf['rooturl'].'admin/modules/gallery/ajax/upload.php';
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("muti_upload");
		echo $ttH->temp_act->text("muti_upload");
		
		exit;
	}
	
	//-----------
	function do_add()
	{
		global $ttH;
		
		$data = array();
		$err = "";
		
		$data['group_id'] = (isset($ttH->input['group_id'])) ? $ttH->input['group_id'] : 0;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
		$data['link_iframe_upload'] = $ttH->admin->get_link_admin ($this->modules, $this->action, "iframe_upload", array('group_id' => $data['group_id']));
		
		$arr_isset = array('group_id');
		foreach($arr_isset as $tmp) {
			$data[$tmp] = (isset($data[$tmp])) ? $data[$tmp] : '';
		}
		
		$data["list_group"] = list_group ("group_id", $data["group_id"], " class=\"form-control\" onchange=\"go_link('".$data["link_action"]."&group_id='+this.value)\"", array('title'=>$ttH->lang['global']['select_title']));
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("add");
		return $ttH->temp_act->text("add");
	}
	
	//-----------
	function do_edit()
	{
		global $ttH;
		
		$err = "";
		
		$item_id = $ttH->input["id"];
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			if(empty($ttH->post["title"]))
				$err = $ttH->html->html_alert ($ttH->lang["global"]["err_invalid_title"], "error");	
			
			if(empty($err)){
				$col = array();
				//$col["group_nav"] = get_group_nav ($ttH->post["group_id"],0,'gallery');
				//$col["group_id"] = $ttH->post["group_id"];
				$col["picture"] = $ttH->func->get_input_pic ($ttH->post["picture"]);
				$col["date_update"] = time();
				$ok = $ttH->db->do_update("gallery", $col, " item_id='".$item_id."'");	
				if($ok){
					$col_l = array();
					$col_l["title"] = $ttH->post["title"];
					$col_l["content"] = $ttH->func->input_editor ($ttH->post["content"]);
					$col_l["friendly_link"] = ($ttH->post["friendly_link"]) ? $ttH->func->get_friendly_link ($ttH->post["friendly_link"]) : $ttH->func->get_friendly_link ($ttH->post["title"]);
					$col_l["meta_title"] = ($ttH->post["meta_title"]) ? $ttH->post["meta_title"] : $ttH->func->meta_title ($ttH->post["title"]);
					$col_l["meta_key"] = ($ttH->post["meta_key"]) ? $ttH->post["meta_key"] : $ttH->func->meta_key ($ttH->post["title"]);
					$col_l["meta_desc"] = ($ttH->post["meta_desc"]) ? $ttH->post["meta_desc"] : $ttH->func->meta_desc ($ttH->post["content"]);
					
					$ttH->db->do_update("gallery", $col_l, " item_id='".$item_id."' and lang='".$ttH->conf["lang_cur"]."'");	
					
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_success"], "success");
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_false"], "error");	
				}
			}
		}
		
		$sql = "select * from gallery 
						where lang='".$ttH->conf['lang_cur']."' 
						and item_id=" . $item_id;
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
			$data['arr_option'] = unserialize($data['arr_option']);
		}
		
		$data["err"] = $err;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("id"=>$item_id));
		$data['picture'] = $ttH->admin->get_form_pic ('picture', $data['picture'], $this->folder_upload, $this->dir);
		$data["list_group"] = list_group ("group_id", $data['group_id'], " class=\"form-control\"", array("title" => $ttH->lang['global']['select_title']));
		$data["html_content"] = $ttH->editor->load_editor ("content", "content", $data['content'], "", "full", array("folder_up" => $this->folder_upload, "fldr" => $this->dir));
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("edit");
		return $ttH->temp_act->text("edit");
	}
	
	//-------------- 
  function do_del ($list_del = "")
  {
    global $ttH;
		
		if(empty($list_del)){
			$ttH->html->alert ($ttH->lang["global"]["not_found_gallery"], $ttH->admin->get_link_admin ($this->modules, $this->action));
		}

		$ok = $ttH->db->delete ("gallery", "find_in_set(item_id,'".$list_del."')");
    if ($ok){
			$ttH->db->delete ("friendly_link", " dbtable='gallery' and find_in_set(dbtable_id,'".$list_del."')");
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
					$arr_focus = (isset($ttH->post["is_focus"])) ? $ttH->post["is_focus"] : array();
					$arr_focus_group = (isset($ttH->post["is_focus_group"])) ? $ttH->post["is_focus_group"] : array();
							
					$mess = $ttH->lang['global']['edit_success'] . " ID: <strong>";
					$str_mess = "";
					for ($i = 0; $i < count($up_id); $i ++){
						$dup = array();
						$dup['show_order'] = $arr_show_order[$up_id[$i]];
						$dup['is_focus'] = $arr_focus[$up_id[$i]];
						$dup['is_focus_group'] = $arr_focus_group[$up_id[$i]];
						$ok = $ttH->db->do_update("gallery", $dup, "item_id=" . $up_id[$i]);
						if ($ok){
							$str_mess .= ($str_mess) ? ", " : "";
							$str_mess .= $up_id[$i];
						} else{
							$mess .= $ttH->lang["global"]['edit_failt'] . " ID: <strong>" . $up_id[$i] . "</strong>";
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
						$ok = $ttH->db->do_update("gallery", $dup, "item_id=" . $up_id[$i]);
						if ($ok){
							$str_mess .= ($str_mess) ? ", " : "";
							$str_mess .= $up_id[$i];
						} else{
							$mess .= $ttH->lang["global"]['restore_failt'] . " ID: <strong>" . $up_id[$i] . "</strong>";
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
						$ok = $ttH->db->do_update("gallery", $dup, "item_id=" . $up_id[$i]);
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
						$list_del = implode(',',$ttH->post['selected_id']);
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
		
		$where = " ";
		$ext = "";
		$is_search = 0;
		
		if($is_show == "trash" ){
			$where .= " AND is_show=0 ";
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
		
		if(!empty($search_group_id)){
			$where .=" and find_in_set(group_id, '".$search_group_id."') ";			
			$ext.="&search_group_id=".$search_group_id;
			$is_search = 1;
		}
		
		if(!empty($search_title)){
			$where .=" and (a.item_id='$search_title' or title like '%$search_title%') ";			
			$ext.="&search_title=".$search_title;
			$is_search = 1;
		}
    
		$num_total = 0;
		$res_num = $ttH->db->query("select item_id 
						from gallery 
						where lang='".$ttH->conf["lang_cur"]."' 
						".$where." ");
			$num_total = $ttH->db->num_rows($res_num);
		$n = ($ttH->conf["n_list"]) ? $ttH->conf["n_list"] : 30;
		$num_gallerys = ceil($num_total / $n);
		if ($p > $num_gallerys)
		  $p = $num_gallerys;
		if ($p < 1)
		  $p = 1;
		$start = ($p - 1) * $n;
		
		$link_action = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
		
		//Sort
		$arr_title = array(
			"item_id" => array(
				"title" => $ttH->lang["global"]["id"],
				"link" => $link_action."&p=".$p.$ext."&sort=item_id-desc",
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
			"focus" => array(
				"title" => $ttH->lang["global"]["focus"],
				"link" => $link_action."&p=".$p.$ext."&sort=is_focus-desc",
				"class" => ""
			),
			"focus_group" => array(
				"title" => $ttH->lang["gallery"]["focus_group"],
				"link" => $link_action."&p=".$p.$ext."&sort=is_focus_group-desc",
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
				$order_tmp = ($tmp[0] == "item_id") ? "item_id" : $tmp[0];
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
		
    $sql = "select * from gallery 
						where lang='".$ttH->conf["lang_cur"]."' 
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
				
				$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "edit", array("id"=>$row['item_id']));
				$row["link_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_trash","id"=>$row['item_id']));
				$row["link_restore"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_restore","id"=>$row['item_id']));
				$row["link_del"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row['item_id']));
				
				if(!empty($row["picture"])){
					$row["picture"] = '<a class="fancybox-effects-a" title="'.$row["picture"].'" href="'.DIR_UPLOAD.$row["picture"].'">
						'.$ttH->func->get_pic_mod($row["picture"], 50, 50, '', 1, 0, array('fix_width'=>1)).'
					</a>';
				}
				
				$link_group = $ttH->admin->get_link_admin ($this->modules, 'group', 'edit', array("id"=>$row['group_id']));
		
				//$row['link'] = (isset($ttH->data["modules"][$this->modules]["arr_friendly_link"][$ttH->conf['lang_cur']])) ? $ttH->data["modules"][$this->modules]["arr_friendly_link"][$ttH->conf['lang_cur']] : '';
				$row['link'] = $row["friendly_link"].'.html';
				
				$row['group_name'] = get_group_name ($row['group_id']);
				
				$row['info'] = '<div><strong>'.$ttH->lang['global']['group'].':</strong> '.$row['group_name'].'</div>';
				$row['info'] .= '<div><strong>'.$ttH->lang['global']['date_create'].':</strong> '.date('d/m/Y',$row['date_create']).'</div>';
				
				$row['list_focus'] = $ttH->admin->list_yesno ("is_focus[".$row['item_id']."]", $row['is_focus'], "  onchange=\"do_check (".$row['item_id'].")\"");
				$row['list_focus_group'] = $ttH->admin->list_yesno ("is_focus_group[".$row['item_id']."]", $row['is_focus_group'], "  onchange=\"do_check (".$row['item_id'].")\"");
				
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
		
		$data['search_date_begin'] = $search_date_begin;
		$data['search_date_end'] = $search_date_end;
		$data['search_title'] = $search_title;
		$data["list_group_search"] = list_group ("search_group_id", $search_group_id, " class=\"form-control\"", array("title" => $ttH->lang['global']['select_title']));
		$data['form_search_class'] = ($is_search == 1) ? ' expand' : '';
		
		//$data["list_group"] = list_group ("group_id", $group_id, " class=\"form-control\" onchange=\"window.location.href='".$link_action."&group_id='+this.value;\"", array('title' => $ttH->lang['global']['select_all']));
		
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