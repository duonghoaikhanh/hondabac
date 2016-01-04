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

$ttH->conf['cur_act'] = "about";

$result = $ttH->db->query("select *  
							from about 
							where lang='".$ttH->conf['lang_cur']."' 
							and friendly_link='".$ttH->conf['cur_item_url']."' 
							limit 0,1");
if($row = $ttH->db->fetch_row($result)){
	$ttH->conf['cur_item'] = $row['item_id'];
	$ttH->data['cur_item'] = $row;
}

/*print_arr($ttH->conf);
die();*/
?>