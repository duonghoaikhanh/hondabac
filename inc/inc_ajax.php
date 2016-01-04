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

$ttH->conf['lang_cur'] = (isset($ttH->post['lang_cur'])) ? $ttH->post['lang_cur'] : $ttH->data["lang_default"]["name"];
//$ttH->conf['lang_cur'] = (isset($ttH->conf['lang_cur'])) ? $ttH->conf['lang_cur'] : $ttH->data["lang_default"]["name"];

$ttH->dir_images = $conf['rooturl']."temp/".$ttH->conf['skin']."/images/";

$ttH->dir_skin = $conf['rooturl']."temp/".$ttH->conf['skin']."/";

$ttH->func->load_language("global");

?>