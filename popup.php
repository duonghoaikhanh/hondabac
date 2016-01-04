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
require_once ($ttH->conf["rootpath"]."inc/inc_popup.php"); 

$ttH->is_popup = 1;
$ttH->output = '';


/*echo "<pre>";
print_r($_SESSION);
echo "</pre>";*/

// main	 
$ttH->conf['cur_mod'] = (isset($ttH->input['m'])) ? $ttH->input['m'] : "home";
$ttH->conf['cur_act'] = "popup";

$fileactname = "modules/".$ttH->conf['cur_mod']."/".$ttH->conf['cur_act'].".php";
//echo $fileactname ;
if (file_exists($fileactname)) {
	require_once $fileactname;
} else {
	flush();
	die('Access denied');
	exit();
}
// end main

//Lang JS
$lang_js = "";
foreach($ttH->lang["global"] as $k => $v)
{
	$lang_js .= "lang_js['".$k."']='".$v."';";
}
//End Lang JS

$ttH->page_css = (isset($ttH->page_css)) ? $ttH->page_css : "";
$ttH->page_js = (isset($ttH->page_js)) ? $ttH->page_js : "";


$ttH->temp_html->assign("DIR_IMAGE", $ttH->dir_images);
$ttH->temp_html->assign("DIR_CSS", $ttH->dir_css);
$ttH->temp_html->assign("DIR_JS", $ttH->dir_js);
$ttH->temp_html->assign("LANG", $ttH->lang);
$ttH->temp_html->assign("LANG_JS", $lang_js);
$ttH->temp_html->assign("CONF", $ttH->conf);
$ttH->temp_html->assign("PAGE_CONTENT", $ttH->output);
$ttH->temp_html->parse("popup");
$ttH->temp_html->out("popup");

$ttHdebug_end=microtime();

 // text Debug
/*$time_start = $ttH->db->micro_time($ttHdebug_start);
$time_stop = $ttH->db->micro_time($ttHdebug_end);
echo '<div style="background:#ffffff;">';
echo $ttH->db->debug_log();
echo "<br>";
echo "Exec time: ".bcsub($time_stop, $time_start, 6)." s";
echo '</div>';*/

exit();

$ttH->db->close();
?>
