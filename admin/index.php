<?php
session_start();
define('IN_ttH', 1);
define('PATH_ROOT', dirname(__FILE__));
define('DS', DIRECTORY_SEPARATOR);
$ttHdebug_start=microtime();
class ttH{}
$ttH = new ttH;
require_once ("../dbcon.php"); 
$ttH->conf = $conf;
$ttH->output='';
require_once ($ttH->conf["rootpath"]."inc/admin_inc.php"); 

$box_lang = $ttH->admin->box_lang ($ttH->conf["lang_cur"]);

/*echo "<pre>";
print_r($_SESSION);
echo "</pre>";*/

flush(); 	

// main	 
/*$ttH->conf['cur_mod'] = (isset($ttH->input["mod"])) ? $ttH->input["mod"] : "config";
$ttH->conf['cur_act'] = (isset($ttH->input["act"])) ? $ttH->input["act"] : "config";*/
$ttH->conf['cur_mod'] = (isset($ttH->conf["cur_mod"])) ? $ttH->conf["cur_mod"] : "config";
$ttH->conf['cur_act'] = (isset($ttH->conf["cur_act"])) ? $ttH->conf["cur_act"] : "config";

if($ttH->admin->check_admin_login() != 1 && $ttH->conf['cur_act'] != "login")
{
	$url = $ttH->func->base64_encode($_SERVER['QUERY_STRING']);
	$url = (!empty($url)) ? '&url='.$url : '';
	$ttH->html->redirect_rel($ttH->conf["rooturl"]."admin/?mod=admin&act=login".$url);
	die();
}

$fileactname = "modules/".$ttH->conf['cur_mod']."/".$ttH->conf['cur_act'].".php";
//echo $fileactname ;
if (file_exists($fileactname))
{
	include $fileactname;
}
else {
	include ($conf["rootpath"].DS.'admin'.DS."404.php");
}
// end main

$ttH->conf["page_title"] = (isset($ttH->conf["page_title"])) ? $ttH->conf["page_title"] : ".:[ADMIN]:.";

//Lang JS
$lang_js = "";
foreach($ttH->lang["global"] as $k => $v)
{
	$lang_js .= "lang_js['".$k."']='".$v."';";
}
//End Lang JS

$menu_admin = $ttH->admin->get_menu_admin ();
$box_admin = $ttH->admin->get_box_admin ();

$ttH->func->include_js ($ttH->dir_js.'jquery_plugins/jquery.validate.js');

$ttH->page_css = (isset($ttH->page_css)) ? $ttH->page_css : "";
$ttH->page_js = (isset($ttH->page_js)) ? $ttH->page_js : "";

$ttH->temp_html->assign("DIR_TEMP", $ttH->dir_temp);
$ttH->temp_html->assign("DIR_IMAGE", $ttH->dir_images);
$ttH->temp_html->assign("DIR_CSS", $ttH->dir_css);
$ttH->temp_html->assign("DIR_JS", $ttH->dir_js);
$ttH->temp_html->assign("LANG", $ttH->lang);
$ttH->temp_html->assign("LANG_JS", $lang_js);
$ttH->temp_html->assign("CONF", $ttH->conf);

/*$ttH->temp_html->assign("EXT_HEAD", $ttH->html->fetchHead());
$ttH->temp_html->assign("BOX_LEFT", $box_left);*/
$ttH->temp_html->assign("MENU_ADMIN", $menu_admin);
$ttH->temp_html->assign("BOX_LANG", $box_lang);
$ttH->temp_html->assign("BOX_ADMIN", $box_admin);
$ttH->temp_html->assign("PAGE_CONTENT", $ttH->output);
//$ttH->temp_html->assign("select_skins", $func->list_skin_admin());

$ttH->temp_html->parse("body");
$ttH->temp_html->out("body");

$ttHdebug_end=microtime();

 // text Debug
 
/*$time_start = $ttH->db->micro_time($ttHdebug_start);
$time_stop = $ttH->db->micro_time($ttHdebug_end);
echo $ttH->db->debug_log();
echo "<br>";
echo "Exec time: ".bcsub($time_stop, $time_start, 6)." s";
exit();*/

$ttH->db->close();
?>
