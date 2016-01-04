<?php

/*================================================================================*\
Name code : function.php
Copyright © 2013 by Phan Van Lien
@version : 1.0
@date upgrade : 03/02/2013 by Phan Van Lien
\*================================================================================*/

if (! defined('IN_ttH')) {
  die('Hacking attempt!');
}

function create_folder($dir="", $mode = 0755) {
	global $ttH;
	
	if($ttH->func->rmkdir("gallery/".$dir, $mode)){
		return $dir;
	}else{
		return "";
	}
}

//=================list_skin===============
function list_skin ($select_name="skin", $cur = "", $ext="")
{
	global $ttH;
	$text = "";
	$path = $ttH->conf['rootpath'] . "temp";
	if ($dir = opendir($path)) {
		$text .= "<select size=1 name=\"".$select_name."\" id=\"".$select_name."\" ".$ext.">";
		while (false !== ($file = readdir($dir))) {
		 if ( $file != "index.html" && $file != "." && $file != "..") {
				$selected = ($file == $cur) ? " selected='selected'" : "";
				$text .= "<option value=\"".$file ."\" ".$selected."> " . $file . " </option>";
			}
		}
		$text .= "</select>";
	}
	return $text;
}

//=================list_user===============
function list_user ($select_name="userid", $cur = "", $ext="")
{
  global $ttH;
	$text = "";
	$text = "<select size=1 name=\"".$select_name."\" id=\"".$select_name."\" ".$ext.">";
	$selected = ($cur == "") ? " selected='selected'" : "";
	$text .= "<option value=\"\" ".$selected.">".$ttH->lang["select_user"]."</option>";
	
	$sql = "SELECT userid, username FROM users WHERE status=1";
	$result = $ttH->db->query($sql);
	if ($num = $ttH->db->num_rows($result))
	{
		while ($row = $ttH->db->fetch_row($result))
		{
			$selected = ($row["userid"] == $cur) ? " selected='selected'" : "";
			$text .= "<option value=\"".$row["userid"] ."\" ".$selected."> " . $row["username"] . " </option>";
		}
		
	}
	$text .= "</select>";
	
  return $text;
}

//=================list_domain_view===============
function list_domain_view ($select_name="domain", $cur = "", $ext="")
{
	global $ttH;
	$text = "";
	$text = "<select size=1 name=\"".$select_name."\" id=\"".$select_name."\" ".$ext.">";
	$selected = ($cur == "") ? " selected='selected'" : "";
	$text .= "<option value=\"\" ".$selected.">".$ttH->lang["select_domain"]."</option>";
	
	$sql = "SELECT id, domain_code, domain FROM domain ORDER BY domain ASC";
	$result = $ttH->db->query($sql);
	if ($num = $ttH->db->num_rows($result))
	{
		while ($row = $ttH->db->fetch_row($result))
		{
			/*$selected = ($row["domain"] == $cur) ? " selected='selected'" : "";
			$text .= "<option value=\"".$row["domain"] ."\" ".$selected."> " . $row["domain"] . " </option>";*/
			$selected = ($row["domain_code"] == $cur) ? " selected='selected'" : "";
			$text .= "<option value=\"".$row["domain_code"] ."\" ".$selected."> " . $row["domain"] . " </option>";
		}
		
	}
	$text .= "</select>";
	
	return $text;
}

//=================list_status_user===============
function list_status_user ($select_name="status", $cur = "", $ext="")
{
	global $ttH;
	
	$arr_view = array(
		0 => $ttH->lang["status_0"],
		1 => $ttH->lang["status_1"],
		2 => $ttH->lang["status_2"],
	);
	
	$text = "<select size=1 name=\"".$select_name."\" id=\"".$select_name."\" ".$ext.">";
	foreach($arr_view as $key => $value)
	{
		$selected = ($key == $cur) ? " selected='selected'" : "";
		$text .= "<option value=\"".$key ."\" ".$selected."> " . $value . " </option>";
	}
	$text .= "</select>";
	
	return $text;
}

//=================list_search_user===============
function list_search_user ($select_name="search", $cur = "", $ext="")
{
	global $ttH;
	
	$arr_view = array(
		"userid" => $ttH->lang["userid"],
		"username" => $ttH->lang["username"],
		"full_name" => $ttH->lang["full_name"],
		"email" => $ttH->lang["email"]
	);
	
	$text = "<select size=1 name=\"".$select_name."\" id=\"".$select_name."\" ".$ext.">";
	foreach($arr_view as $key => $value)
	{
		$selected = ($key == $cur) ? " selected='selected'" : "";
		$text .= "<option value=\"".$key ."\" ".$selected."> " . $value . " </option>";
	}
	$text .= "</select>";
	
	return $text;
}

//=================list_search_domain===============
function list_search_domain ($select_name="search", $cur = "", $ext="")
{
	global $ttH;
	
	$arr_view = array(
		"id" => $ttH->lang["id"],
		"domain_code" => $ttH->lang["domain_code"],
		"domain" => $ttH->lang["domain"]
	);
	
	$text = "<select size=1 name=\"".$select_name."\" id=\"".$select_name."\" ".$ext.">";
	foreach($arr_view as $key => $value)
	{
		$selected = ($key == $cur) ? " selected='selected'" : "";
		$text .= "<option value=\"".$key ."\" ".$selected."> " . $value . " </option>";
	}
	$text .= "</select>";
	
	return $text;
}


?>