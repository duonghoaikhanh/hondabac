<?php

/*================================================================================*\
Name code : view.php
Copyright © 2015  by Phan Van Lien
@version : 1.0
@date upgrade : 01/01/2015 by Phan Van Lien
\*================================================================================*/

if (! defined('IN_ttH')) {
  die('Access denied');
}
$nts = new sMain();

class sMain
{
	var $modules = "contact";
	var $action = "ajax";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		
		$ttH->func->load_language($this->modules);
		
		$fun = (isset($ttH->post['f'])) ? $ttH->post['f'] : '';

		flush();
		switch ($fun) {
			case "contact":
				echo $this->do_contact ();
				exit;
				break;
			case "emaillist":
				echo $this->do_emaillist ();
				exit;
				break;
			default:
				echo '';
				exit;
				break;
		}
		
		exit;
	}
	
	function do_contact ()
	{
		global $ttH;	
		
		$output = array(
			'ok' => 0,
			'mess' => $ttH->lang['contact']['send_false'],
			'show' => 1
		);
		
		$input_tmp = $ttH->post['data'];
		foreach($input_tmp as $key) {
			$input[$key['name']] = $key['value'];
		}
		
		$arr_in = array();
		$arr_key = array('full_name','email','address','phone','title','content');
		foreach($arr_key as $key) {
			$arr_in[$key] = (isset($input[$key])) ? $input[$key] : '';
		}
		
		if(count($arr_in) > 0) {
			$arr_in["is_status"] = 0;
			$arr_in["date_create"] = time();
			$arr_in["date_update"] = time();
			$ok = $ttH->db->do_insert("contact", $arr_in);
			if($ok) {				
				$output['ok'] = 1;
				$output['mess'] = $ttH->lang['contact']['send_success'];
				
				//Send email
				$mail_arr_value = $arr_in;
				$mail_arr_value['date_create'] = $ttH->func->get_date_format($mail_arr_value["date_create"]);
				$mail_arr_value['domain'] = $_SERVER['HTTP_HOST'];
				$mail_arr_key = array();
				foreach($mail_arr_value as $k => $v) {
					$mail_arr_key[$k] = '{'.$k.'}';
				}
				
				//send to admin
				$ttH->func->send_mail_temp ('admin-contact', $ttH->conf['email'], $ttH->conf['email'], $mail_arr_key, $mail_arr_value);
				
				//send to contact
				$ttH->func->send_mail_temp ('contact', $arr_in["email"], $ttH->conf['email'], $mail_arr_key, $mail_arr_value);
				//End Send email
			}
		}
		
		return json_encode($output);
	}
	
	private function check_emaillist ($arr_data, $type_check = 'username')
	{
		global $ttH;
		
		$output = 1;
		
		$sql = "select email 
						from emaillist 
						where email='".$arr_data['email']."' 
						limit 0,1";
    $result = $ttH->db->query($sql);
    if ($rcheck = $ttH->db->fetch_row($result)){
			if($rcheck[$type_check] == $arr_data[$type_check]) {
				$output = 0;
			}
		}
		
		
		return $output;
	}
	
	function do_emaillist ()
	{
		global $ttH;	
		
		$output = array(
			'ok' => 0,
			'mess' => '',
			'show' => 1
		);
		
		$input_tmp = $ttH->post['data'];
		foreach($input_tmp as $key) {
			$input[$key['name']] = $key['value'];
		}
		
		$arr_in = array();
		$arr_key = array('email', 'email');
		foreach($arr_key as $key) {
			$arr_in[$key] = (isset($input[$key])) ? $input[$key] : '';
		}
		
		if(empty($output['mess']) && $this->check_emaillist ($arr_in,'email') != 1) {
			$output['mess'] = $ttH->lang['global']['err_exists_email'];
		}
		
		if(empty($output['mess']) && count($arr_in) > 0) {
			$arr_in["date_create"] = time();
			$arr_in["date_update"] = time();
			$ok = $ttH->db->do_insert("emaillist", $arr_in);
			if($ok) {				
				$output['ok'] = 1;
				$output['mess'] = $ttH->lang['global']['emaillist_success'];
			} else {
				$output['mess'] = $ttH->lang['global']['emaillist_false'];
			}
		}
		
		if(empty($output['mess'])) {
			$output['mess'] = $ttH->lang['global']['emaillist_false'];
		}
		
		return json_encode($output);
	}
		
  // end class
}
?>