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
$_SESSION["statistic_detail"] = ($_SESSION["statistic_detail"]) ? $_SESSION["statistic_detail"] : array();
$_SESSION["statistic_session"] = ($_SESSION["statistic_session"]) ? $_SESSION["statistic_session"] : md5(time());
	
$nts = new sMain();


class sMain
{
	var $modules = "statistic";
	var $action = "ajax";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		
		$ttH->func->load_language($this->modules);
		
		//include ($this->modules."_func.php");
		$fun = (isset($ttH->input['f'])) ? $ttH->input['f'] : '';

		flush();
		switch ($fun) {
			case "statistic":
				echo $this->do_statistic ();
				exit;
				break;
			default:
				echo '';
				exit;
				break;
		}
		
		exit;
	}
	
	function do_post_comment ()
	{
		global $ttH;	
		
		$output = 0;
		$arr_in = array();
		$arr_key = array('full_name','title','content');
		foreach($arr_key as $key) {
			$arr_in[$key] = (isset($ttH->post[$key])) ? urldecode($ttH->post[$key]) : '';
		}
		
		if(count($arr_in) > 0) {
			$arr_in["is_show"] = 2;
			$arr_in["date_create"] = time();
			$arr_in["date_update"] = time();
			$ok = $ttH->db->do_insert("statistic_comment", $arr_in);
			if($ok) {
				$output = 1;
			}
		}
		
		return $output;
	}

	//----- get_pic_statistic
	function get_pic_statistic ($domain)
	{
		global $ttH;
		
		$time = time();
		$time_use_session = 4;
		$go_sql = 0;
		
		$session_code = "statistic_out_".md5($domain);
		$_SESSION[$session_code] = isset($_SESSION[$session_code]) ? $_SESSION[$session_code] : '';
		
		if(is_array($_SESSION[$session_code]))
		{
			if(($time - $_SESSION[$session_code]["date_update"]) >= $time_use_session)
			{
				$go_sql = 1;
			}
		}
		else
		{
			$go_sql = 1;
		}
		
		//$go_sql = 1;
		if($go_sql == 1)
		{
			$sql_total = "select sum(1) as s_number from statistic where domain!=referrer_domain ";
			$result_total = $ttH->db->query($sql_total);
			if ($row_total = $ttH->db->fetch_row($result_total))
			{
				$_SESSION[$session_code]["total"] = $row_total["s_number"] + $ttH->conf['visitors_start'];
			}
			
			$sql_total_day = "select sum(1) as s_number from statistic where domain!=referrer_domain and date_log='".date('d/m/Y')."' ";
			$result_total_day = $ttH->db->query($sql_total_day);
			if ($row_total_day = $ttH->db->fetch_row($result_total_day))
			{
				$_SESSION[$session_code]["total_day"] = $row_total_day["s_number"];
			}
			
			$sql_online = "select sum(1) as s_number from statistic where domain!=referrer_domain and domain='".$domain."' AND date_update>".($time - $time_use_session)." ";
			//echo $sql_online;
			$result_online = $ttH->db->query($sql_online);
			if ($row_online = $ttH->db->fetch_row($result_online))
			{
				$_SESSION[$session_code]["online"] = $row_online["s_number"];
			}
			
			$_SESSION[$session_code]["date_update"] = $time;
		}
		
		/*$online = rand(1000,2000);
		$total = rand(5000,10000);*/
		
		$_SESSION[$session_code]["online"] = ($_SESSION[$session_code]["online"]) ? $_SESSION[$session_code]["online"] : 1;
		$_SESSION[$session_code]["total_day"] = ($_SESSION[$session_code]["total_day"]) ? $_SESSION[$session_code]["total_day"] : 1;
		$_SESSION[$session_code]["total"] = ($_SESSION[$session_code]["total"]) ? $_SESSION[$session_code]["total"] : 1;
		
		return "ttHStatistic.online = ".$_SESSION[$session_code]["online"]."; ttHStatistic.total_day = ".$_SESSION[$session_code]["total_day"]."; ttHStatistic.total = ".$_SESSION[$session_code]["total"].";";
	}
	
	//----- do_statistic
	function do_statistic ()
	{
		global $ttH;
		
		/*echo "<pre>";
		print_r($_SERVER);
		echo "</pre>";
		die();*/
		
		$time = time();
		$time_use_session = 4;
		$ip = $_SERVER['REMOTE_ADDR'];
		$agent = $_SERVER['HTTP_USER_AGENT'];
		$browser = $ttH->func->getBrowser($agent);
		$os = $ttH->func->getOs($agent);
		
		$web_link = (isset($_SERVER['HTTP_HOST'])) ? $_SERVER['HTTP_HOST'] : '';
		//$domain = $_SERVER['SERVER_NAME'];
		$domain = $ttH->func->getHost_URL($web_link);
		$date = date("d/m/Y", $time); 
		
		if( !$web_link)		{
			die("none");
		}
		
		$screen_width = isset($ttH->get["screen_width"]) ? $ttH->get["screen_width"] : '';
		$screen_height = isset($ttH->get["screen_height"]) ? $ttH->get["screen_height"] : '';
		$referrer_link = isset($ttH->get["referrer_link"]) ? $ttH->get["referrer_link"] : '';
		$referrer_domain = $ttH->func->getHost_URL($referrer_link);
		
		$md5_web_link = md5($web_link);
		$go_insert = 0;
		if(is_array($_SESSION["statistic_detail"][$md5_web_link]))	{
			if(($time - $_SESSION["statistic_detail"][$md5_web_link]["date_update"]) > ($time_use_session+2))		{
				$go_insert = 1;
			}
		}	else {
			$go_insert = 1;
		}
		
		if($go_insert == 1)	{
			$cot_d = array();
			$cot_d['session'] = $_SESSION["statistic_session"];
			$cot_d['date_log'] = $date;
			$cot_d['domain'] = $domain;
			$cot_d['web_link'] = $web_link;
			$cot_d['referrer_domain'] = $referrer_domain;
			$cot_d['referrer_link'] = $referrer_link;
			$cot_d['agent'] = $agent;
			$cot_d['browser'] = $browser;
			$cot_d['ip'] = $ip;
			$cot_d['os'] = $os;
			$cot_d['screen_width'] = $screen_width;
			$cot_d['screen_height'] = $screen_height;
			$cot_d['date_time'] = $time;
			$cot_d['date_update'] = $time;
			$cot_d['time_stay'] = 0;
			$ok = $ttH->db->do_insert("statistic", $cot_d); 
			if($ok)	{
				$insertid = $ttH->db->insertid();
				$_SESSION["statistic_detail"][$md5_web_link] = array(
					'id' => $insertid,
					'domain' => $domain,
					'web_link' => $web_link,
					'date_time' => $time,
					'date_update' => $time
				);
			}
		}
		else
		{
			$cot_d = array();
			$cot_d['time_stay'] = $time - (int)$_SESSION["statistic_detail"][$md5_web_link]["date_time"];
			$cot_d['date_update'] = $time;
			$ok = $ttH->db->do_update("statistic", $cot_d, "id=".$_SESSION["statistic_detail"][$md5_web_link]["id"]); 
			if($ok)
			{
				$_SESSION["statistic_detail"][$md5_web_link]["date_update"] = $time;
			}
		}
		
		
		return $this->get_pic_statistic ($domain);
	}
	
  // end class
}
?>