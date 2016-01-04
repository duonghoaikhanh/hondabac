<?php
/*================================================================================*\
Name code : inc.php
Copyright © 2013 by Phan Van Lien
@version : 1.0
@date upgrade : 03/02/2013 by Phan Van Lien
\*================================================================================*/

if (! defined('IN_ttH')) {
  die('Access denied');
}

function print_arr($array){
	echo "<div style=\"background:#ffffff; color:#000000\">";
	echo "<pre>";
	print_r($array);
	echo "</pre>";
	echo "</div>";
}

$root_uri = str_replace('http://' . $_SERVER['HTTP_HOST'], "", $conf['rooturl']);
define('ROOT_URI', $root_uri);
$ttH->conf["rooturi"] = $root_uri;
$ttH->conf["rooturi_mod"] = $root_uri;

$ttH->dir_js = $conf['rooturl']."js/";
$ttH->dir_lib = $conf['rooturl']."lib/";

require_once ($conf["rootpath"].DS."inc".DS."session.php"); 
require_once ($conf["rootpath"].DS."inc".DS."captcha.php"); 

require_once ($conf["rootpath"].DS."inc".DS."db.php"); 
$ttH->db = new DB;
require_once ($conf["rootpath"].DS."inc".DS."html.php"); 
$ttH->html = new Html;
require_once ($conf["rootpath"].DS."lib".DS."phpmailer".DS."class.phpmailer.php"); 
$ttH->mailer = new PHPMailer();
require_once ($conf["rootpath"].DS."inc".DS."func.php"); 
$ttH->func = new Func_Global;
require_once ($conf["rootpath"].DS."inc".DS."site_func.php"); 
$ttH->site_func = new SiteFunc;
$ttH->site_func->get_user_info ();

require_once ($conf["rootpath"].DS."inc".DS."data.php"); 
$ttH->load_data = new Data;

$ttH->conf['lang_cur'] = isset($ttH->data["lang_default"]['name']) ? $ttH->data["lang_default"]['name'] : 'vi';
if(isset($ttH->input['lang']) && array_key_exists($ttH->input['lang'],$ttH->data["lang"])) {
	$ttH->conf['lang_cur'] = $ttH->input['lang'];
}

require_once ($conf["rootpath"].DS."inc".DS."site.php"); 
$ttH->site = new Site;

$ttH->load_data->data_banner_group();
$ttH->load_data->data_banner();
$ttH->conf['copyright'] = $ttH->site->copyright ();

$ttH->conf['lang_cur'] = (isset($ttH->input['lang']) && in_array($ttH->input['lang'], $ttH->data["lang"])) ? $ttH->input['lang'] : $ttH->data["lang_default"]['name'];

//$ttH->load_data->data_lang();

$ttH->dir_images = $conf['rooturl']."temp/".$ttH->conf['skin']."/images/";
$ttH->dir_css_global = $conf['rooturl']."temp/".$ttH->conf['skin']."/css/global/";
$ttH->path_html_global = $conf["rootpath"]."temp".DS.$ttH->conf['skin'].DS."html".DS."global".DS."";

$ttH->dir_skin = $conf['rooturl']."temp/".$ttH->conf['skin']."/";
$ttH->dir_css = $conf['rooturl']."temp/".$ttH->conf['skin']."/css/";
$ttH->path_html = $conf["rootpath"]."temp".DS.$ttH->conf['skin'].DS."html".DS."";

require_once ($conf["rootpath"].DS."lib".DS."tinymce".DS."tinymce.php"); 
$ttH->editor = new Editor;

include_once($conf["rootpath"].DS."inc".DS."xtemplate.class.php");
$ttH->temp_box = new XTemplate($ttH->path_html_global."box.tpl");
$ttH->temp_html = new XTemplate($ttH->path_html_global."html.tpl");

$ttH->func->load_language("global");

?>