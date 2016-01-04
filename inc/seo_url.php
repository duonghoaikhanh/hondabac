<?php

/*================================================================================*\
Name code : class_functions.php
Copyright © 2013 by Phan Van Lien
@version : 1.0
@date upgrade : 03/02/2013 by Phan Van Lien
\*================================================================================*/

if (! defined('IN_ttH')) {
  die('Access denied');
}

$request_uri = $_SERVER["REQUEST_URI"];
$request_uri = ($ttH->conf["rooturi"] != '/') ? str_replace($ttH->conf["rooturi"],"",$request_uri) : substr($request_uri,1);
$arr_pos = explode("/",$request_uri);
foreach ($arr_pos as $k => $v) {
	$arr_pos[$k] = urldecode($v);
}
$pos_start = 0;
/*if($ttH->data["lang_default"]["num_lang"] > 1){
	$pos_start = 1;
	$ttH->conf['lang_cur'] = (isset($arr_pos[0]) && !empty($arr_pos[0])) ? $arr_pos[0] : $ttH->data["lang_default"]["name"];
}*/

$arr_mod_url = $ttH->load_data->data_modules_url ();

$ttH->conf['lang_cur'] = (isset($ttH->conf['lang_cur'])) ? $ttH->conf['lang_cur'] : $ttH->data["lang_default"]["name"];
$ttH->conf['cur_mod_url'] = (isset($arr_pos[$pos_start]) && !empty($arr_pos[$pos_start])) ? $arr_pos[$pos_start] : "";
$ttH->conf['cur_act_url'] = "";
$ttH->conf['cur_item_url'] = "";
if(isset($arr_pos[$pos_start+2])){
	$ttH->conf['cur_act_url'] = (isset($arr_pos[$pos_start+1]) && !empty($arr_pos[$pos_start+1])) ? $arr_pos[$pos_start+1] : "";
	$ttH->conf['cur_item_url'] = (isset($arr_pos[$pos_start+2]) && !empty($arr_pos[$pos_start+2])) ? $arr_pos[$pos_start+2] : "";
	if(substr($ttH->conf['cur_item_url'],-5) == ".html"){
		$ttH->conf['cur_item_url'] = substr($ttH->conf['cur_item_url'],0,-5);
	}
}elseif(isset($arr_pos[$pos_start+1])){
	if(substr($arr_pos[$pos_start+1],-5) == ".html"){
		$ttH->conf['cur_item_url'] = substr($arr_pos[$pos_start+1],0,-5);
	}else{
		$ttH->conf['cur_act_url'] = $arr_pos[$pos_start+1];
	}
}
//$ttH->conf['cur_mod'] = (isset($arr_pos[$pos_start]) && !empty($arr_pos[$pos_start])) ? $arr_pos[$pos_start] : "home";
//$ttH->conf['cur_act'] = (isset($arr_pos[$pos_start+1]) && !empty($arr_pos[$pos_start+1])) ? $arr_pos[$pos_start+1] : "home";

if(empty($ttH->conf['cur_mod_url'])) {
	$ttH->conf['cur_mod'] = 'home';
	//require_once $ttH->conf['rootpath'].'modules/'.$ttH->conf['cur_mod'].'/seo_url.php';
} else {
	if(array_key_exists($ttH->conf['cur_mod_url'], $arr_mod_url)) {
		$ttH->conf['lang_cur'] = $arr_mod_url[$ttH->conf['cur_mod_url']]['lang'];
		$ttH->conf['cur_mod'] = $arr_mod_url[$ttH->conf['cur_mod_url']]['name_action'];
		//require_once $ttH->conf['rootpath'].'modules/'.$ttH->conf['cur_mod'].'/seo_url.php';
	} else {
		$tmp = (substr($ttH->conf['cur_mod_url'],-5) == ".html") ? substr($ttH->conf['cur_mod_url'],0,-5) : $ttH->conf['cur_mod_url'];
		$sql = "select * from friendly_link 
						where friendly_link='".$tmp."' 
						limit 0,1";
		$result = $ttH->db->query($sql);
		if ($info = $ttH->db->fetch_row($result)){
			$ttH->conf['lang_cur'] = $info['lang'];
			$ttH->conf['cur_mod'] = $info['module'];
			$ttH->conf['cur_act'] = $info['action'];
			$ttH->conf['cur_act_id'] = $info['dbtable_id'];
			/*if($info['action'] == 'detail') {
				$ttH->conf['cur_item'] = $info['action'];
				$ttH->conf['cur_item_id'] = $info['dbtable_id'];
			} else {
				$ttH->conf['cur_act'] = $info['action'];
				$ttH->conf['cur_act_id'] = $info['dbtable_id'];
			}*/
			$ttH->conf['cur_friendly_link'] = $info['friendly_link'];
			
			//require_once $ttH->conf['rootpath'].'modules/'.$ttH->conf['cur_mod'].'/seo_url.php';
		} else {
			if($ttH->conf['is_under_construction'] == 1) {
				if(Session::Get('is_admin')=='admin' || (isset($ttH->input['is_admin']))) {
					Session::Set('is_admin', 'admin');
				}
			}
			$ttH->html->redirect_rel($ttH->conf["rooturl"]);
		}
	}	
}

/*print_arr($ttH->conf);
die();*/
?>