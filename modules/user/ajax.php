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

function load_setting ()
{
	global $ttH;
	
	$ttH->setting = (isset($ttH->setting)) ? $ttH->setting : array();
	if(!isset($ttH->setting['user'])){
		$ttH->setting['user'] = array();
		$result = $ttH->db->query("select * from user_setting ");
		if($row = $ttH->db->fetch_row($result)){
			$ttH->setting['user_'.$row['lang']] = $row;
			if($ttH->conf['lang_cur'] == $row['lang']) {
				$ttH->setting['user'] = $row;
			}
		}
	}
	
	return true;
}
load_setting ();

$nts = new sMain();

class sMain
{
	var $modules = "user";
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
			case "signup":
				echo $this->do_signup ();
				exit;
				break;
			case "signin":
				echo $this->do_signin ();
				exit;
				break;
			case "signout":
				echo $this->do_signout ();
				exit;
				break;
			default:
				echo '';
				exit;
				break;
		}
		
		exit;
	}
	
	private function check_user ($arr_data, $type_check = 'username')
	{
		global $ttH;
		
		$output = 1;
		
		$sql = "select username,email from user 
						where username='".$arr_data['username']."' 
						or email='".$arr_data['email']."' 
						limit 0,1";
    $result = $ttH->db->query($sql);
    if ($rcheck = $ttH->db->fetch_row($result)){
			if($rcheck[$type_check] == $arr_data[$type_check]) {
				$output = 0;
			}
		}
		
		
		return $output;
	}
	
	function do_signup ()
	{
		global $ttH;
		
		$output = array(
			'ok' => 0,
			'mess' => ''
		);
		
		if($ttH->site_func->check_user_login() == 1) {
			$output['ok'] = 1;
			$output['mess'] = 'Bạn đã đăng nhập rồi';
			return json_encode($output);
		}
		
		$input_tmp = $ttH->post['data'];
		foreach($input_tmp as $key) {
			$input[$key['name']] = $key['value'];
		}
		/*print_arr($input);
		die('adasd');*/
		
		$arr_check = array('username','password','nickname','address');
		$arr_in = array();
		
		foreach($arr_check as $key) {
			if(empty($output['mess']) && (!isset($input[$key]) || empty($input[$key]))) {
				$output['mess'] = $ttH->lang['global']['err_invalid_'.$key];
				break;
			}
			$arr_in[$key] = trim($input[$key]);
		}
		
		$arr_in['email'] = $arr_in['username'];
		//$arr_in['nickname'] = trim($arr_in['first_name'].' '.$arr_in['last_name']);
		
		if(empty($output['mess']) && $this->check_user ($arr_in,'username') != 1) {
			$output['mess'] = $ttH->lang['global']['err_exists_username'];
		}
		if(empty($output['mess']) && $this->check_user ($arr_in,'email') != 1) {
			$output['mess'] = $ttH->lang['global']['err_exists_email'];
		}
		if(empty($output['mess']) && Captcha::Check ($input['captcha']) != 1) {
			$output['mess'] = $ttH->lang['global']['err_invalid_captcha'];
		}
		
		if(empty($output['mess'])) {
			$arr_in['password'] = $ttH->func->md25($arr_in['password']);
		}
		
		if(empty($output['mess'])){
			
			$date_login = time();
			
			$arr_in["phone"] = $input["phone"];
			$arr_in["province"] = $input["province"];
			$arr_in["district"] = $input["district"];
			$arr_in["ward"] = $input["ward"];
			$arr_in["user_code"] = time().'c'.$ttH->func->random_str(20);
			$arr_in["show_order"] = 0;
			$arr_in["is_show"] = 1;
			$arr_in["date_login"] = $date_login;
			$arr_in["date_create"] = time();
			$arr_in["date_update"] = time();
			$ok = $ttH->db->do_insert("user", $arr_in);
			if($ok) {
				$userid = $ttH->db->insertid();
				
				$output['ok'] = 1;
				$output['mess'] = $ttH->lang['global']['signup_success'];
				Captcha::Set ();
				
				$mail_arr_key = array(
					'{nickname}',
					'{username}',
					'{password}',
					'{link_active}'
				);
				$mail_arr_value = array(
					$arr_in["nickname"],
					$arr_in['username'],
					$input['password'],
					$ttH->site_func->get_link ($this->modules, $ttH->setting[$this->modules]["active_link"])."?code=".$arr_in["user_code"]
				);
				
				//send to customer
				$ttH->func->send_mail_temp ('signup', $arr_in["email"], $ttH->conf['email'], $mail_arr_key, $mail_arr_value);
				
				Session::Set('user_cur', array(
					'userid' => $userid,
					'username' => $arr_in["username"],
					'password' => $arr_in["password"],
					'session' => ''//md5($arr_in["username"].$date_login)
				));
			} else {				
				$output['mess'] = $ttH->lang['global']['signup_false'];
			}
		}
		
		
		return json_encode($output);
	}
	
	function do_signin ()
	{
		global $ttH;
		
		$output = array(
			'ok' => 0,
			'mess' => ''
		);
		
		if($ttH->site_func->check_user_login() == 1) {
			$output['ok'] = 1;
			$output['mess'] = $ttH->lang['global']['signin_success'];
			return json_encode($output);
		}
		
		$input_tmp = $ttH->post['data'];
		foreach($input_tmp as $key) {
			$input[$key['name']] = $key['value'];
		}
		/*print_arr($input);
		die('adasd');*/
		
		$arr_check = array('username','password');
		$arr_in = array();
		
		foreach($arr_check as $key) {
			if(empty($output['mess']) && (!isset($input[$key]) || empty($input[$key]))) {
				$output['mess'] = $ttH->lang['global']['err_invalid_'.$key];
				break;
			}
			$arr_in[$key] = $input[$key];
		}
		
		if(empty($output['mess'])) {
			$arr_in['password'] = $ttH->func->md25($arr_in['password']);
		}
		
		if(empty($output['mess'])){
			
			$query = "select user_id,username,password,session 
								from user 
								where is_show=1 
								and username='".$arr_in['username']."' 
								and password='".$arr_in['password']."' ";
			$result = $ttH->db->query($query);
			if($row = $ttH->db->fetch_row($result)) {
				Session::Set('user_cur', array(
					'userid' => $row['user_id'],
					'username' => $row['username'],
					'password' => $row['password'],
					'session' => $row['session']
				));
				
				$output['ok'] = 1;
				$output['mess'] = $ttH->lang['global']['signin_success'];
				Captcha::Set ();
			} else {				
				$output['mess'] = $ttH->lang['global']['signin_false'];
			}
		}
		
		return json_encode($output);
	}
	
	function do_signout ()
	{
		global $ttH;
		
		$output = array(
			'ok' => 1
		);
		
		Session::Delete('user_cur');
		Session::Delete('ordering_address');	
		Session::Delete('promotion_code');	
		Session::Delete('gift_voucher');	
		
		return json_encode($output);
	}
		
  // end class
}
?>