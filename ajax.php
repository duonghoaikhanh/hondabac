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
require_once ($ttH->conf["rootpath"]."inc/inc_ajax.php"); 

$ttH->output = '';


/*echo "<pre>";
print_r($_SESSION);
echo "</pre>";*/

// main	 
$ttH->conf['cur_mod'] = (isset($ttH->input['m'])) ? $ttH->input['m'] : "home";
$ttH->conf['cur_act'] = (isset($ttH->input['a'])) ? $ttH->input['a'] : "ajax";

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
	
exit();

$ttH->db->close();
?>
