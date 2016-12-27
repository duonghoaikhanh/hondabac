<?php

/*================================================================================*\
Name code : html.php
Copyright © 2013 by Phan Van Lien
@version : 1.0
@date upgrade : 03/02/2013 by Phan Van Lien
\*================================================================================*/

class Html
{
	function alert ($mess="", $link="", $type=0)
	{
		global $ttH;
		
		/*if($link)
		{
			echo "<script>alert('".$mess."');location.href='".$link."';</script>";
		}
		else
		{
			echo "<script>alert('".$mess."');history.back();</script>";
		}*/
		
		$data = array(
			'content' => ''
		);
		
		if($link)
		{
			$data['content'] = "<script>alert('".$mess."');location.href='".$link."';</script>";
		}
		else
		{
			$data['content'] = "<script>alert('".$mess."');history.back();</script>";
		}
		
		echo $this->temp_box('alert',$data);
		die();
		return false;
	}
	
	function html_alert ($mess="", $type="warning")
	{
		global $ttH;
		
		$class="warning";
		switch($type)
		{
			case "error":
				$class = "alert_".$type;
				$ttH->temp_box->assign('data', array("mess" => $mess));
				$ttH->temp_box->parse("html_alert_".$type);
				$out =  $ttH->temp_box->text("html_alert_".$type);
				break;
			case "warning":
				$class = "alert_".$type;
				$ttH->temp_box->assign('data', array("mess" => $mess));
				$ttH->temp_box->parse("html_alert_".$type);
				$out =  $ttH->temp_box->text("html_alert_".$type);
				break;
			case "success":
				$class = "alert_".$type;
				$ttH->temp_box->assign('data', array("mess" => $mess));
				$ttH->temp_box->parse("html_alert_".$type);
				$out =  $ttH->temp_box->text("html_alert_".$type);
				break;
			default:
				$class = "alert_info";
				$ttH->temp_box->assign('data', array("mess" => $mess));
				$ttH->temp_box->parse("html_alert_info");
				$out =  $ttH->temp_box->text("html_alert_info");
				break;
		}
		
		return $out;
	}
	
	function server_url()
	{  
		$proto = "http".((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == "on") ? "s" : "") . "://";
		$server = isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : $_SERVER['SERVER_NAME'];
		return $proto . $server;
	}
	
	function redirect_rel($url)
	{
		if (!headers_sent())
		{
			header("Location: $url");
		}
		else
		{
			echo "<meta http-equiv=\"refresh\" content=\"0;url=$url\">\r\n";
		}
		exit('Loading ...');
	}
	
	//=================select===============
	function select_op ($array=array(), $cur="", $lv_text="",$arr_more=array(),$arr_tmp=array())
	{
		global $ttH;
		
		$text = '';
		
		$arr_tmp1 = array();
		
		if($lv_text == 'root') {
			$lv_text = '';
		} else {
			$lv_text .= '|-- ';
		}		
		
		foreach($array as $key => $value)
		{
			if(is_array($value)){
				$selected = ($key == $cur) ? " selected='selected'" : "";
				$disabled = "";
				$arr_tmp1["is_disabled"] = 0;
				if((isset($arr_more["disabled"]) && $key == $arr_more["disabled"]) || (isset($arr_tmp["is_disabled"]) && $arr_tmp["is_disabled"] == 1)){
					$disabled = " disabled='disabled'";
					$arr_tmp1["is_disabled"] = 1;
				}
				$text .= "<option value=\"".$key ."\" ".$selected.$disabled."> " . $lv_text.$value['title'] . " </option>";
				if(isset($value['arr_sub'])){
					$text .= $this->select_op ($value['arr_sub'], $cur, $lv_text,$arr_more,$arr_tmp1);
				}
			}else{
				$selected = ($key == $cur) ? " selected='selected'" : "";
				$disabled = "";
				if((isset($arr_more["disabled"]) && $key == $arr_more["disabled"]) || $arr_tmp["is_disabled"] == 1){
					$disabled = " disabled='disabled'";
				}
				$text .= "<option value=\"".$key ."\" ".$selected.$disabled."> " . $value . " </option>";
			}
		}
		
		return $text;
	}
	
	//=================select===============
	function select ($select_name="id", $array=array(), $cur="", $ext="",$arr_more=array())
	{
		global $ttH;
		//print_arr($array);
		
		$text = "<select name=\"".$select_name."\" ".$ext.">";
		
		if(isset($arr_more["title"]))
			$text .= "<option value=\"\"> " . $arr_more["title"] . " </option>";
		
		foreach($array as $key => $value)
		{
			if(is_array($value)){
				$selected = ($key == $cur) ? " selected='selected'" : "";
				$disabled = "";
				$arr_tmp["is_disabled"] = 0;
				if(isset($arr_more["disabled"]) && $key == $arr_more["disabled"]){
					$disabled = " disabled='disabled'";
					$arr_tmp["is_disabled"] = 1;
				}
				$text .= "<option value=\"".$key ."\" ".$selected.$disabled."> " . $value['title'] . " </option>";
				if(isset($value['arr_sub'])){
					$text .= $this->select_op ($value['arr_sub'], $cur, '',$arr_more,$arr_tmp);
				}
			}else{
				$selected = ($key == $cur) ? " selected='selected'" : "";
				$disabled = "";
				if(isset($arr_more["disabled"]) && $key == $arr_more["disabled"]){
					$disabled = " disabled='disabled'";
				}
				$text .= "<option value=\"".$key ."\" ".$selected.$disabled."> " . $value . " </option>";
			}
		}
		$text .= "</select>";
		
		return $text;
	}
	
	//=================select===============
	function select_muti_old ($select_name="id", $array=array(), $cur="", $ext="",$arr_more=array())
	{
		global $ttH;
		
		$arr_cur = (!empty($cur)) ? explode(",",$cur) : array();
		
		$text = "<select name=\"".$select_name."\" multiple=\"multiple\" ".$ext.">";
		
		if(isset($arr_more["title"])){
			$selected = (count($arr_cur) == 0) ? " selected='selected'" : "";
			$text .= "<option value=\"\" ".$selected."> " . $arr_more["title"] . " </option>";
		}
		
		foreach($array as $key => $value)
		{
			$selected = (in_array($key,$arr_cur) > 0) ? " selected='selected'" : "";
			$text .= "<option value=\"".$key ."\" ".$selected."> " . $value . " </option>";
		}
		$text .= "</select>";
		
		return $text;
	}
	
	
	
	//=================select===============
	function select_muti_op ($array=array(), $arr_cur=array(), $lv_text="",$arr_more=array(),$arr_tmp=array())
	{
		global $ttH;
		
		$text = '';
		
		$arr_tmp1 = array();
		
		$lv_text .= '|-- ';
		
		foreach($array as $key => $value)
		{
			if(is_array($value)){
				$selected = (in_array($key,$arr_cur) > 0) ? " selected='selected'" : "";
				$disabled = "";
				$arr_tmp1["is_disabled"] = 0;
				if((isset($arr_more["disabled"]) && $key == $arr_more["disabled"]) || $arr_tmp["is_disabled"] == 1){
					$disabled = " disabled='disabled'";
					$arr_tmp1["is_disabled"] = 1;
				}
				$text .= "<option value=\"".$key ."\" ".$selected.$disabled."> " . $lv_text.$value['title'] . " </option>";
				if(isset($value['arr_sub'])){
					$text .= $this->select_muti_op ($value['arr_sub'], $arr_cur, $lv_text,$arr_more,$arr_tmp1);
				}
			}else{
				$selected = (in_array($key,$arr_cur) > 0) ? " selected='selected'" : "";
				$disabled = "";
				if((isset($arr_more["disabled"]) && $key == $arr_more["disabled"]) || $arr_tmp["is_disabled"] == 1){
					$disabled = " disabled='disabled'";
				}
				$text .= "<option value=\"".$key ."\" ".$selected.$disabled."> " . $value . " </option>";
			}
		}
		
		return $text;
	}
	
	//=================select===============
	function select_muti ($select_name="id", $array=array(), $cur="", $ext="",$arr_more=array())
	{
		global $ttH;
		//print_arr($array);
		
		$arr_cur = (!empty($cur)) ? explode(",",$cur) : array();
		
		$text = "<select name=\"".$select_name."\" multiple=\"multiple\" ".$ext.">";
		
		if(isset($arr_more["title"])){
			$selected = (count($arr_cur) == 0) ? " selected='selected'" : "";
			$text .= "<option value=\"\" ".$selected."> " . $arr_more["title"] . " </option>";
		}
		
		foreach($array as $key => $value)
		{
			if(is_array($value)){
				$selected = (in_array($key,$arr_cur) > 0) ? " selected='selected'" : "";
				$disabled = "";
				$arr_tmp["is_disabled"] = 0;
				if(isset($arr_more["disabled"]) && $key == $arr_more["disabled"]){
					$disabled = " disabled='disabled'";
					$arr_tmp["is_disabled"] = 1;
				}
				$text .= "<option value=\"".$key ."\" ".$selected.$disabled."> " . $value['title'] . " </option>";
				if(isset($value['arr_sub'])){
					$text .= $this->select_muti_op ($value['arr_sub'], $arr_cur, '',$arr_more,$arr_tmp);
				}
			}else{
				$selected = (in_array($key,$arr_cur) > 0) ? " selected='selected'" : "";
				$disabled = "";
				if(isset($arr_more["disabled"]) && $key == $arr_more["disabled"]){
					$disabled = " disabled='disabled'";
				}
				$text .= "<option value=\"".$key ."\" ".$selected.$disabled."> " . $value . " </option>";
			}
		}
		$text .= "</select>";
		
		return $text;
	}



	//=================select===============
	function temp_box ($box_name="box", $array=array())
	{
		global $ttH;
		
		$ttH->temp_box->reset($box_name);
		$ttH->temp_box->assign('LANG', $ttH->lang);
		$ttH->temp_box->assign('DIR_IMAGE', $ttH->dir_images);
		$ttH->temp_box->assign('data', $array);
		$ttH->temp_box->parse($box_name);
		$output = $ttH->temp_box->text($box_name);
		
		return $output;
	}
// end classs
}
?>