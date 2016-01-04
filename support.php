<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php
define('IN_ttH', 1);
define('PATH_ROOT', dirname(__FILE__));
define('DS', DIRECTORY_SEPARATOR);
class ttH{}
$ttH = new ttH;
require_once ("dbcon.php"); 
$ttH->conf = $conf;
$ttH->conf['lang_cur'] = (isset($_GET['lang'])) ? $_GET['lang'] : 'vi';

require_once ($conf["rootpath"].DS."inc".DS."inc_basic.php"); 

$show = (isset($ttH->get['show'])) ? $ttH->get['show'] : 'yahoo,skype';
$arr_show = explode(',',$show);
?>
<title><?php echo $ttH->lang['global']['support']; ?></title>
<link href="<?php echo $ttH->dir_css; ?>support/support.css" rel="stylesheet">
</head>

<body>
<div id="list_support">
<?php

$result = $ttH->db->query("select *   
														from support 
														order by show_order desc, date_update asc");
if($num = $ttH->db->num_rows($result)){
	while($row = $ttH->db->fetch_row($result)){
		$row['arr_title'] = unserialize($row['arr_title']);
		?>
    <div class="row">
    	<?php 
			if(isset($row['arr_title'][$ttH->conf['lang_cur']])) {
			?>
			<div class="name"><?php echo $row['arr_title'][$ttH->conf['lang_cur']]; ?></div>
    	<?php 
			}
			if(isset($row['yahoo']) && in_array('yahoo',$arr_show)) {
			?>
      <div class="nick yahoo">
        <a href="ymsgr:sendIM?<?php echo $row['yahoo']; ?>">
          <img src='http://opi.yahoo.com/online?u=<?php echo $row['yahoo']; ?>&m=g&t=8' height="20" />
          <?php echo $row['yahoo']; ?>
          <div class="clear"></div>
        </a>
      </div>
    	<?php 
			}
			if(isset($row['skype']) && in_array('skype',$arr_show)) {
			?>
      <div class="nick skype">
        <a href="Skype:<?php echo $row['skype']; ?>?chat">
          <img src="http://mystatus.skype.com/mediumicon/<?php echo $row['skype']; ?>" alt="<?php echo $row['skype']; ?>" height="20" />
          <?php echo $row['skype']; ?>
          <div class="clear"></div>
        </a>
      </div>
    	<?php 
			}
			if(isset($row['phone'])) {
			?>
      <div class="phone"><strong><?php echo $ttH->lang['global']['phone']; ?>:</strong> <?php echo $row['phone']; ?></div>
    	<?php 
			}
			if(isset($row['email'])) {
			?>
      <div class="email"><strong><?php echo $ttH->lang['global']['email']; ?>:</strong> <a href="mailto:<?php echo $row['email']; ?>"><?php echo $row['email']; ?></a></div>
    	<?php 
			}
			?>
    </div>
    <?php
	}
}
?>
</div>
</body>
</html>