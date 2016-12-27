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
	var $modules = "waybill";
	var $action = "waybill";
	var $sub = "manage";
	var $folder_upload = "waybill";
	var $dir = "";
	var $dbtable = 'waybill';
	var $dbtable_id = 'id';
	
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
	
	//-------------- 
  function do_del ($list_del = "")
  {
    global $ttH;
		
		if(empty($list_del)){
			$ttH->html->alert ($ttH->lang["global"]["not_found_page"], $ttH->admin->get_link_admin ($this->modules, $this->action));
		}
		
		$ok = $ttH->db->delete ("waybill", "find_in_set(".$this->dbtable_id.",'".$list_del."')");
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
					
					$arr_staff_name = (isset($ttH->post["staff_name"])) ? $ttH->post["staff_name"] : array();
					$arr_status = (isset($ttH->post["status"])) ? $ttH->post["status"] : array();
							
					$mess = $ttH->lang['global']['edit_success'] . " ID: <strong>";
					$str_mess = "";
					for ($i = 0; $i < count($up_id); $i ++){
						$dup = array();
						$dup['staff_name'] = $arr_staff_name[$up_id[$i]];
						$dup['status'] = $arr_status[$up_id[$i]];
						$ok = $ttH->db->do_update("waybill", $dup, "".$this->dbtable_id."=" . $up_id[$i]);
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
		
		$where = " where ".$this->dbtable_id.">0 ";
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
				".$this->dbtable_id."='$search_title' 
				or waybillname like '%$search_title%'
				or nickname like '%$search_title%'
				or email like '%$search_title%'
				or address like '%$search_title%'
			) ";			
			$ext.="&search_title=".$search_title;
		}
    
		$num_total = 0;
		$res_num = $ttH->db->query("select ".$this->dbtable_id." from ".$this->dbtable." ".$where." ");
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
			$this->dbtable_id => array(
				"title" => $ttH->lang["global"]["id"],
				"link" => $link_action."&p=".$p.$ext."&sort=".$this->dbtable_id."-desc",
				"class" => ""
			),
			"waybillname" => array(
				"title" => $ttH->lang["waybill"]["waybillname"],
				"link" => $link_action."&p=".$p.$ext."&sort=waybillname-desc",
				"class" => ""
			),
			"nickname" => array(
				"title" => $ttH->lang["waybill"]["nickname"],
				"link" => $link_action."&p=".$p.$ext."&sort=nickname-desc",
				"class" => ""
			),
			"is_show" => array(
				"title" => $ttH->lang["waybill"]["status"],
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
				$order_tmp = ($tmp[0] == $this->dbtable_id) ? $this->dbtable_id : $tmp[0];
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
		
    $sql = "select * from ".$this->dbtable." ".$where." limit $start,$n";
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
				
				$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "edit", array("id"=>$row[$this->dbtable_id]));
				$row["link_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_trash","id"=>$row[$this->dbtable_id]));
				$row["link_restore"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_restore","id"=>$row[$this->dbtable_id]));
				$row["link_del"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row[$this->dbtable_id]));
				
				$row['status'] = list_status ("status[".$row[$this->dbtable_id]."]", $row['status'], " class=\"form-control\" onchange=\"do_check (".$row[$this->dbtable_id].")\" style=\"width:100%;\"");
				
				$row['province'] = $ttH->func->location_name('province', $row['province']);
				$row['district'] = $ttH->func->location_name('district', $row['district']);
				$row['ward'] = $ttH->func->location_name('ward', $row['ward']);
				
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