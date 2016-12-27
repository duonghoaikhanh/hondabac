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
$ttH->conf["rooturi_mod"] = $root_uri."admin/";

define('DIR_UPLOAD', $ttH->conf["rooturl_web"].'uploads/');

$ttH->conf["admin_ses"] = 'admin_'.md5($ttH->conf["rooturl"]);

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
$ttH->conf["lang_cur"] = (isset($ttH->input["lang"])) ? $ttH->input["lang"] : "vi";

require_once ($conf["rootpath"].DS."inc".DS."admin_func.php"); 
$ttH->admin = new Admin;

require_once ($conf["rootpath"].DS."inc".DS."data.php"); 
$ttH->load_data = new Data;

$ttH->dir_images = $conf['rooturl']."admin/temp/".$ttH->conf['ad_skin']."/images/";
$ttH->dir_css_global = $conf['rooturl']."admin/temp/".$ttH->conf['ad_skin']."/css/global/";
$ttH->path_html_global = $conf["rootpath"]."admin/temp".DS.$ttH->conf['ad_skin'].DS."html".DS."global".DS."";

$ttH->dir_temp = $conf['rooturl']."admin/temp/".$ttH->conf['ad_skin']."/";
$ttH->dir_css = $ttH->dir_temp."css/";
$ttH->path_html = $conf["rootpath"]."admin".DS."temp".DS.$ttH->conf['ad_skin'].DS."html".DS."";

/*require_once ($ttH->path_html_global."box.php"); 
$ttH->temp_box = new Box;
require_once ($ttH->path_html_global."html.php"); 
$ttH->temp_html = new Html;
require_once ($ttH->path_html_global."global.php"); 
$ttH->temp = new Temp;*/

/*require_once ($conf["rootpath"].DS."lib".DS."ckeditor".DS."ckeditor.php"); 
$ttH->editor = new Editor;*/
require_once ($conf["rootpath"].DS."lib".DS."tinymce".DS."tinymce.php"); 
$ttH->editor = new Editor;

include_once($conf["rootpath"].DS."inc".DS."xtemplate.class.php");
$ttH->temp_box = new XTemplate($ttH->path_html_global."box.tpl");
$ttH->temp_html = new XTemplate($ttH->path_html_global."html.tpl");

//$ttH->conf["lang_view"] = "vi";
$ttH->func->load_language_admin ("global");

?>