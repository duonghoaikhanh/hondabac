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

//$ttH->load_data->data_lang();

require_once ($conf["rootpath"].DS."inc".DS."site.php"); 
$ttH->site = new Site;

require_once ($conf["rootpath"].DS."inc".DS."seo_url.php"); 

require_once ($conf["rootpath"].DS."inc".DS."Mobile_Detect.php"); 
$ttH->detect = new Mobile_Detect;

$ttH->load_data->data_banner_group();
$ttH->load_data->data_banner();
$ttH->conf['copyright'] = $ttH->site->copyright ();

if($ttH->conf['is_under_construction'] == 1) {
	if(Session::Get('is_admin')=='admin' || (isset($ttH->input['is_admin']))) {
		Session::Set('is_admin', 'admin');
	} else {
		require_once ($conf["rootpath"].DS."under-construction.php");
		exit();
	}
}

$ttH->dir_images = $conf['rooturl']."temp/".$ttH->conf['skin']."/images/";
$ttH->dir_css_global = $conf['rooturl']."temp/".$ttH->conf['skin']."/css/global/";
$ttH->path_html_global = $conf["rootpath"]."temp".DS.$ttH->conf['skin'].DS."html".DS."global".DS."";

$ttH->dir_skin = $conf['rooturl']."temp/".$ttH->conf['skin']."/";
$ttH->dir_css = $conf['rooturl']."temp/".$ttH->conf['skin']."/css/";
$ttH->path_html = $conf["rootpath"]."temp".DS.$ttH->conf['skin'].DS."html".DS."";
$ttH->path_css = $conf["rootpath"]."temp".DS.$ttH->conf['skin'].DS."css".DS."";

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

$ttH->func->load_language("global");

require_once $ttH->conf['rootpath'].'modules/'.$ttH->conf['cur_mod'].'/seo_url.php';

?>