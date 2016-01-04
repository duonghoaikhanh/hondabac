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
	var $action = "location_ward";
	var $sub = "manage";
	var $folder_upload = "config";
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
		include ("location_func.php");
		
		$this->dir = create_folder(date("Y_m"));
		
		$ttH->func->include_js($ttH->dir_temp.'js/'.$this->modules.'/location.js');
		
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
			
			$code = $ttH->func->get_friendly_link(trim($ttH->post['code']));
			$area_code = trim($ttH->post['area_code']);
			$country_code = trim($ttH->post['country_code']);
			$province_code = trim($ttH->post['province_code']);
			$district_code = trim($ttH->post['district_code']);
			$title = trim($ttH->post['title']);
			
			$sql = "select code,title from location_ward where (code='".$code."' or title='".$title."')";
			$result = $ttH->db->query($sql);
			if ($check = $ttH->db->fetch_row($result)){
				if(empty($err) && $check['code'] == $code) {
					$err = $ttH->html->html_alert ('Mã số đã tồn tại', "error");	
				}
				if(empty($err) && $check['title'] == $title) {
					$err = $ttH->html->html_alert ('Tiêu đề đã tồn tại', "error");	
				}
			}
			
			if(empty($err) && empty($area_code)) {
				$err = $ttH->html->html_alert ('Chưa chọn khu vực', "error");	
			}
			if(empty($err) && empty($country_code)) {
				$err = $ttH->html->html_alert ('Chưa chọn quốc gia', "error");	
			}
			if(empty($err) && empty($province_code)) {
				$err = $ttH->html->html_alert ('Chưa chọn tỉnh / thành phố', "error");	
			}
			if(empty($err) && empty($district_code)) {
				$err = $ttH->html->html_alert ('Chưa chọn quận / huyện', "error");	
			}
			if(empty($err) && empty($code)) {
				$err = $ttH->html->html_alert ('Mã số chưa nhập', "error");	
			}
			if(empty($err) && empty($title)) {
				$err = $ttH->html->html_alert ('Tiêu đề chưa nhập', "error");	
			}
			
			if(empty($err)){
				
				$col = array();
				$col["code"] = $code;
				$col["area_code"] = $area_code;
				$col["country_code"] = $country_code;
				$col["province_code"] = $province_code;
				$col["district_code"] = $district_code;
				$col["title"] = $title;
				$col["show_order"] = 0;
				$col["is_show"] = 1;
				$col["date_create"] = time();
				$col["date_update"] = time();
				$i = 0;
				foreach($ttH->data["lang"] as $lang_id => $lang_row){
					$i++;
					$col["lang"] = $lang_row["name"];
					$ok = $ttH->db->do_insert("location_ward", $col);	
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
		
		$arr_isset = array('area_code', 'country_code', 'province_code', 'district_code');
		foreach($arr_isset as $tmp) {
			$data[$tmp] = (isset($data[$tmp])) ? $data[$tmp] : '';
		}
		
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
		$data["list_location_area"] = list_location_area ("area_code", $data['area_code']," class=\"form-control select_location_area\" data-country='country' data-province='province' data-district='district'");
		$data["list_location_country"] = list_location_country ("country_code", $data['area_code'], $data['country_code']," class=\"form-control select_location_country\" data-province='province' data-district='district' id='country'");
		$data["list_location_province"] = list_location_province ("province_code", $data['country_code'], $data['province_code']," class=\"form-control select_location_province\" data-district='district' id='province'");
		$data["list_location_district"] = list_location_district ("district_code", $data['province_code'], $data['district_code']," class=\"form-control\" id='district'");
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("edit");
		return $ttH->temp_act->text("edit");
	}
	
	//-----------
	function do_edit()
	{
		global $ttH;
		
		$err = "";
		
		$code = $ttH->input["id"];
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			
			//$arr_common = array('picture','show_order','is_show','date_update');
			
			$area_code = trim($ttH->post['area_code']);
			$country_code = trim($ttH->post['country_code']);
			$province_code = trim($ttH->post['province_code']);
			$district_code = trim($ttH->post['district_code']);
			$title = trim($ttH->post['title']);
			
			$sql = "select code,title from location_ward where title='".$title."' and code!='".$code."'";
			$result = $ttH->db->query($sql);
			if ($check = $ttH->db->fetch_row($result)){
				if(empty($err) && $check['title'] == $title) {
					$err = $ttH->html->html_alert ('Tiêu đề đã tồn tại', "error");	
				}
			}
			
			if(empty($err) && empty($area_code)) {
				$err = $ttH->html->html_alert ('Chưa chọn khu vực', "error");	
			}
			if(empty($err) && empty($country_code)) {
				$err = $ttH->html->html_alert ('Chưa chọn quốc gia', "error");	
			}
			if(empty($err) && empty($province_code)) {
				$err = $ttH->html->html_alert ('Chưa chọn tỉnh / thành phố', "error");	
			}
			if(empty($err) && empty($district_code)) {
				$err = $ttH->html->html_alert ('Chưa chọn quận / huyện', "error");	
			}
			if(empty($err) && empty($code)) {
				$err = $ttH->html->html_alert ('Mã số không hợp lệ', "error");	
			}
			if(empty($err) && empty($title)) {
				$err = $ttH->html->html_alert ('Tiêu đề chưa nhập', "error");	
			}		
			
			if(empty($err)){
				$col = array();
				$col["area_code"] = $area_code;
				$col["country_code"] = $country_code;
				$col["province_code"] = $province_code;
				$col["district_code"] = $district_code;
				$col["date_update"] = time();
				$ok = $ttH->db->do_update("location_ward", $col, " code='".$code."'");	
				if($ok){
					$col_l = array();
					$col_l["title"] = $ttH->post["title"];
					
					$ttH->db->do_update("location_ward", $col_l, " code='".$code."' and lang='".$ttH->conf["lang_cur"]."'");	
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_success"], "success");
				}else{
					$err = $ttH->html->html_alert ($ttH->lang["global"]["edit_false"], "error");	
				}
			}
		}
		
		$sql = "select * from location_ward 
						where lang='".$ttH->conf['lang_cur']."' 
						and code='".$code."'";
    $result = $ttH->db->query($sql);
    if ($data = $ttH->db->fetch_row($result)){
		}
		
		$data["err"] = $err;
		$data["link_action"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("id"=>$code));
		$data["list_location_area"] = list_location_area ("area_code", $data['area_code']," class=\"form-control select_location_area\" data-country='country' data-province='province' data-district='district'");
		$data["list_location_country"] = list_location_country ("country_code", $data['area_code'], $data['country_code']," class=\"form-control select_location_country\" data-province='province' data-district='district' id='country'");
		$data["list_location_province"] = list_location_province ("province_code", $data['country_code'], $data['province_code']," class=\"form-control select_location_province\" data-district='district' id='province'");
		$data["list_location_district"] = list_location_district ("district_code", $data['province_code'], $data['district_code']," class=\"form-control\" id='district'");
		$data['disabled_code'] = 'disabled="disabled"';
		
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
		$ok = $ttH->db->delete ("location_ward", "find_in_set(code,'".$list_del."')");
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
						$ok = $ttH->db->do_update("location_ward", $dup, "code='".$up_id[$i]."'");
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
						$ok = $ttH->db->do_update("location_ward", $dup, "code='".$up_id[$i]."'");
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
						$ok = $ttH->db->do_update("location_ward", $dup, "code='".$up_id[$i]."'");
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
		$search_area_code = (isset($ttH->input["search_area_code"])) ? $ttH->input["search_area_code"] : '';
		$search_country_code = (isset($ttH->input["search_country_code"])) ? $ttH->input["search_country_code"] : '';
		$search_province_code = (isset($ttH->input["search_province_code"])) ? $ttH->input["search_province_code"] : '';
		$search_district_code = (isset($ttH->input["search_district_code"])) ? $ttH->input["search_district_code"] : '';
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
		
		if(!empty($search_area_code)){
			$where .=" and area_code='".$search_area_code."' ";			
			$ext.="&search_area_code=".$search_area_code;
			$is_search = 1;
		}
		
		if(!empty($search_country_code)){
			$where .=" and country_code='".$search_country_code."' ";			
			$ext.="&search_country_code=".$search_country_code;
			$is_search = 1;
		}
		
		if(!empty($search_province_code)){
			$where .=" and province_code='".$search_province_code."' ";			
			$ext.="&search_province_code=".$search_province_code;
			$is_search = 1;
		}
		
		if(!empty($search_district_code)){
			$where .=" and district_code='".$search_district_code."' ";			
			$ext.="&search_district_code=".$search_district_code;
			$is_search = 1;
		}
		
		if(!empty($search_title)){
			$where .=" and (code='$search_title' or title like '%$search_title%') ";			
			$ext.="&search_title=".$search_title;
			$is_search = 1;
		}
    
		$num_total = 0;
		$res_num = $ttH->db->query("select code 
																	from location_ward 
																	where lang='".$ttH->conf["lang_cur"]."' 
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
			"code" => array(
				"title" => $ttH->lang["config"]["district_code"],
				"link" => $link_action."&p=".$p.$ext."&sort=code-desc",
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
				"title" => 'Bán chạy',
				"link" => $link_action."&p=".$p.$ext."&sort=is_focus-desc",
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
				$order_tmp = ($tmp[0] == "code") ? "code" : $tmp[0];
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
		
    $sql = "select * from location_ward 
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
				
				$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "edit", array("id"=>$row['code']));
				$row["link_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_trash","id"=>$row['code']));
				$row["link_restore"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_restore","id"=>$row['code']));
				$row["link_del"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row['code']));
				
				$row["link_pic"] = $ttH->admin->get_link_admin ($this->modules, $this->action.'_pic', 'manage', array("type"=>"item","type_id"=>$row['code']));
				
				if(!empty($row["picture"])){
					$row["picture"] = '<a class="fancybox-effects-a" title="'.$row["picture"].'" href="'.DIR_UPLOAD.$row["picture"].'">
						'.$ttH->func->get_pic_mod($row["picture"], 50, 50, '', 1, 0, array('fix_width'=>1)).'
					</a>';
				}
				
				$row['date_create'] = $ttH->func->get_date_format ($row['date_create']);
				$row['date_update'] = $ttH->func->get_date_format ($row['date_update']);
				
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
		$data["list_location_area_search"] = list_location_area ("search_area_code", $search_area_code," class=\"form-control select_location_area\" data-country='search_country_code' data-province='search_province_code'  data-district='search_district_code'");
		$data["list_location_country_search"] = list_location_country ("search_country_code", $search_area_code, $search_country_code," class=\"form-control select_location_country\" data-province='search_province_code'  data-district='search_district_code' id='search_country_code'");
		$data["list_location_province_search"] = list_location_province ("search_province_code", $search_country_code, $search_province_code," class=\"form-control select_location_province\" data-district='search_district_code' id='search_province_code'");
		$data["list_location_district_search"] = list_location_district ("search_district_code", $search_province_code, $search_district_code," class=\"form-control\" id='search_district_code'");
		
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

  // end class
}
?>