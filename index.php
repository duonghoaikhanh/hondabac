<?php
session_start();
define('IN_ttH', 1);
define('PATH_ROOT', dirname(__FILE__));
define('DS', DIRECTORY_SEPARATOR);
$ttHdebug_start=microtime();

class ttH{}
$ttH = new ttH;
require_once ("dbcon.php"); 
$ttH->conf = $conf;
require_once ($ttH->conf["rootpath"]."inc/inc.php"); 

$ttH->navigation = '';
$ttH->output = '';


// main	 
$ttH->conf['cur_mod'] = (isset($ttH->conf['cur_mod'])) ? $ttH->conf['cur_mod'] : "home";
$ttH->conf['cur_act'] = (isset($ttH->conf['cur_act'])) ? $ttH->conf['cur_act'] : "home";

$fileactname = "modules/".$ttH->conf['cur_mod']."/".$ttH->conf['cur_act'].".php";
//echo $fileactname ;
if (file_exists($fileactname))
{
	require_once $fileactname;
}
else {
	flush();
	require_once ($conf["rootpath"].DS."404.php");
	exit();
}
// end main


$ttH->func->include_css($ttH->dir_css.'global/perfect-scrollbar.css');
$ttH->func->include_js($ttH->dir_js.'jquery_plugins/perfect-scrollbar.js');

$ttH->func->include_css($ttH->dir_css.'global/smartmenus/sm-blue.css');
$ttH->func->include_css($ttH->dir_css.'global/smartmenus/box_menu.css');
$ttH->func->include_js($ttH->dir_js.'smartmenus/jquery.smartmenus.js');

$ttH->func->include_js($ttH->dir_js.'jquery_plugins/jquery.validate.js');
$ttH->func->include_js($ttH->dir_skin.'js/location/location.js');
$ttH->func->include_js($ttH->dir_skin.'js/global/temp.js');
$ttH->func->include_js($ttH->dir_skin.'js/user/user.js');

$box_lang = $ttH->site->box_lang ($ttH->conf["lang_cur"]);

//Lang JS
$lang_js = "";
foreach($ttH->lang["global"] as $k => $v)
{
	$lang_js .= "lang_js['".$k."']='".$v."';";
}
//End Lang JS

$ttH->page_css = (isset($ttH->page_css)) ? $ttH->page_css : "";
$ttH->page_js = (isset($ttH->page_js)) ? $ttH->page_js : "";

$data = array();
$data['logo'] = $ttH->site->get_logo ('logo');
$data['banner_quangcao'] = $ttH->site->get_logo ('banner-quangcao');
$data["header_cart"] = $ttH->site->header_cart();
$data["box_search"] = $ttH->site->box_search();
$data['share'] = $ttH->site->get_banner ('share', 0);
//$data['main_slide'] = $ttH->site->get_banner_slide ('banner-main');
//$data['box_search'] = $ttH->site->box_search ();
//$data['header_user'] = $ttH->site->header_user ();
//$data['header_cart'] = $ttH->site->header_cart ();
$data['share'] = $ttH->site->get_banner ('share', 0);
$data['header_menu'] = $ttH->site->menu_single ('menu_top');
$data['list_menu'] = $ttH->site->list_menu ('menu_header');
$data['footer'] = $ttH->site->get_banner ('footer');
$data['footer_menu'] = $ttH->site->list_menu ('menu_footer', 'menu_footer');
$data['footer_bank'] = $ttH->site->get_banner_slide ('bank', 'bank_scroll');

$data['deviceType'] = ($ttH->detect->isMobile() ? ($ttH->detect->isTablet() ? 'tablet' : 'phone') : 'computer');

$widget = array();
$widget['maillist'] = $ttH->site->load_widget ('maillist');

$ttH->temp_html->assign("BOX_LANG", $box_lang);
$ttH->temp_html->assign("DIR_IMAGE", $ttH->dir_images);
$ttH->temp_html->assign("DIR_SKIN", $ttH->dir_skin);
$ttH->temp_html->assign("DIR_CSS", $ttH->dir_css);
$ttH->temp_html->assign("DIR_JS", $ttH->dir_js);
$ttH->temp_html->assign("LANG", $ttH->lang);
$ttH->temp_html->assign("LANG_JS", $lang_js);
$ttH->temp_html->assign("CONF", $ttH->conf);

$ttH->temp_html->assign("data", $data);
$ttH->temp_html->assign("widget", $widget);


$layout = (isset($ttH->conf['container_layout']) ? $ttH->conf['container_layout'] : 'm-c');
$layout = str_replace('-','_',$layout);

$ttH->temp_html->assign("PAGE_CONTENT", $ttH->output);
if(strpos('  '.$layout, ' c_')) {
	$column_left = $ttH->site->block_left ();
	$ttH->temp_html->assign("PAGE_COLUMN_LEFT", $column_left);
}
if(strpos($layout.' ', '_c ')) {
	$column_right = $ttH->site->block_column ();
	$ttH->temp_html->assign("PAGE_COLUMN", $column_right);
}
$ttH->temp_html->parse("body.container_".$layout);

$ttH->temp_html->parse("body");
$ttH->temp_html->out("body");

$ttHdebug_end=microtime();

 // text Debug
/*$time_start = $ttH->db->micro_time($ttHdebug_start);
$time_stop = $ttH->db->micro_time($ttHdebug_end);
echo '<div style="background:#ffffff; position:absolute; top:0px; left:0px;">';
echo $ttH->db->debug_log();
echo "<br>";
echo "Exec time: ".bcsub($time_stop, $time_start, 6)." s";
echo '</div>';
exit();*/

$ttH->db->close();
?>
