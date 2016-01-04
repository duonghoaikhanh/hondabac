<?php

/*================================================================================*\
Name code : class_functions.php
Copyright © 2013 by Phan Van Lien
@version : 1.0
@date upgrade : 03/02/2013 by Phan Van Lien
\*================================================================================*/

class SiteFunc
{
	
	//-----------------check_user_login
	function check_user_login (){
		global $ttH;
		
		$login = 0;
		$session_user_cur = Session::Get('user_cur', array());
		
		$ttH->data['user_cur'] = (isset($ttH->data['user_cur'])) ? $ttH->data['user_cur'] : array();
		
		if(count($ttH->data['user_cur']) >= 4) {
			if($ttH->data['user_cur']["user_id"] == $session_user_cur["userid"] 
				&& $ttH->data['user_cur']["username"] == $session_user_cur["username"] 
				&& $ttH->data['user_cur']["password"] == $session_user_cur["password"] 
				&& $ttH->data['user_cur']["session"] == $session_user_cur["session"]) {
				return 1;	
			} else {
				$arr_user = Session::Get('user_cur', array(
					'userid' => '',
					'username' => '',
					'password' => '',
					'session' => ''
				));
				return 0;	
			}
		} else {
			$arr_user = Session::Get('user_cur', array(
				'userid' => '',
				'username' => '',
				'password' => '',
				'session' => ''
			));
			$query = "select * from user where is_show=1 and user_id='".$arr_user["userid"]."'";
			//echo $query;
			$result = $ttH->db->query($query);
			if($row = $ttH->db->fetch_row($result)) {
				if($row["user_id"] == $arr_user["userid"] && $row["username"] == $arr_user["username"] && $row["password"] == $arr_user["password"] && $row["session"] == $arr_user["session"]) {
					$row['arr_address_book'] = unserialize($row['arr_address_book']);
					$ttH->data['user_cur'] = $row;
					$login = 1;
				}
			}
		}
			
		return $login; 
	}
	
	//-----------------get_user_info
	function get_user_info (){
		global $ttH;
		
		$output = array();
		
		if($this->check_user_login () == 1) {
			$output = $ttH->data['user_cur'];
		}
			
		return $output; 
	}
	
	//-----------------check_in_stock
	function check_in_stock ($info = array(), $arr_check=array()){
		global $ttH;
		
		return 100;
		$output = 0;
		$type = (isset($info['type'])) ? $info['type'] : 'product';
		$type_id = (isset($info['type_id'])) ? $info['type_id'] : 0;
		
		
		if(isset($arr_check['size_id']) && $arr_check['size_id'] > 0) {
			$size_id = (isset($arr_check['size_id'])) ? $arr_check['size_id'] : 0;
			$arr_combine = $ttH->load_data->data_table ('product_combine', 'id', 'id,color_id,size_id,in_stock,out_stock', " type='".$type."' and type_id='".$type_id."' and size_id='".$size_id."' order by date_create asc limit 0,1");
			foreach($arr_combine as $row) {
				if($row['in_stock'] > $row['out_stock']) {
					$output = $row['in_stock'] - $row['out_stock'];
					break;
				}
			}
		} else {
			
			$sql = "select in_stock, out_stock   
							from product 
							where is_show=1 
							and item_id='".$type_id."' 
							order by show_order desc, date_create asc limit 0,1";
			//echo $sql;
			$result = $ttH->db->query($sql);
			if ($pro_info = $ttH->db->fetch_row($result)) {
				if($pro_info['in_stock'] > $pro_info['out_stock']) {
					$output = $pro_info['in_stock'] - $pro_info['out_stock'];
				}
			}
		}
			
		return $output; 
	}
	
	//-----------------get_link_lang
	public function get_link_lang ($lang, $modules, $action="", $item="", $arr_ext = array()){
		global $ttH;
		
		$link_out = $ttH->conf['rooturl'];
		$arr_full_link = array('user','shipment');
		
		if(in_array($modules, $arr_full_link)) {
			$link_out .= (!empty($modules)) ? $ttH->data["modules"][$modules]["arr_friendly_link"][$lang].'/' : '';
			
			if(!empty($action)) {
				$link_out .= (!empty($action)) ? $action.'/' : '';
			}
			if(!empty($item)) {
				$link_out .= (!empty($item)) ? $item.'.html' : '';
			}
			
		} else {
			if(!empty($action)) {
				$link_out .= (!empty($action)) ? $action.'/' : '';
				if(!empty($item)) {
					$link_out .= (!empty($item)) ? $item.'.html' : '';
				}
			} elseif(!empty($item)) {
				$link_out .= (!empty($item)) ? $item.'.html' : '';
			} else {
				$link_out .= (!empty($modules)) ? $ttH->data["modules"][$modules]["arr_friendly_link"][$lang].'/' : '';
			}
		}
		
		$i = 0;
		foreach($arr_ext as $k => $v){
			$i++;
			$link_out .= ($i == 1) ? '/?' : '&';
			$link_out .= $k."=".$v;
		}
		
		return $link_out; 
	}
	
	//-----------------get_link
	public function get_link ($modules, $action="", $item="", $arr_ext = array()){
		global $ttH;
		
		return $this->get_link_lang ($ttH->conf["lang_cur"], $modules, $action, $item, $arr_ext);
	}
	
	//-----------------get_link_popup
	function get_link_popup ($modules, $fun="mamage", $arr_ext = array()){
		global $ttH;
		
		$link_out = $ttH->conf['rooturl']."popup.php?m=".$modules."&f=".$fun;
		if(!array_key_exists('lang', $arr_ext)) {
			$link_out .= "&lang=".$ttH->conf["lang_cur"];
		}
		
		foreach($arr_ext as $k => $v){
			$link_out .= "&".$k."=".$v;
		}
		
		return $link_out; 
	}
	
	function list_location_area ($select_name="area_code", $cur="", $ext="",$arr_more=array()) {
		global $ttH;
		
		$data = $ttH->load_data->data_table ('location_area', 'code', 'code,title', "is_show=1 and lang='".$ttH->conf['lang_cur']."'");
		
		return $ttH->html->select ($select_name, $data, $cur, $ext,$arr_more);
	}
	
	function list_location_country ($select_name="country_code", $parent_code='', $cur="", $ext="",$arr_more=array()) {
		global $ttH;
		
		$data = $ttH->load_data->data_table ('location_country', 'code', 'code,title', "is_show=1 and lang='".$ttH->conf['lang_cur']."' and area_code='".$parent_code."'");
		
		return $ttH->html->select ($select_name, $data, $cur, $ext,$arr_more);
	}
	
	function list_location_province ($select_name="province_code", $parent_code='', $cur="", $ext="",$arr_more=array()) {
		global $ttH;
		
		$data = $ttH->load_data->data_table ('location_province', 'code', 'code,title', "is_show=1 and lang='".$ttH->conf['lang_cur']."' and country_code='".$parent_code."'");
		
		return $ttH->html->select ($select_name, $data, $cur, $ext,$arr_more);
	}
	
	function list_location_district ($select_name="district_code", $parent_code='', $cur="", $ext="",$arr_more=array()) {
		global $ttH;
		
		$data = $ttH->load_data->data_table ('location_district', 'code', 'code,title', "is_show=1 and lang='".$ttH->conf['lang_cur']."' and province_code='".$parent_code."'");
		
		return $ttH->html->select ($select_name, $data, $cur, $ext,$arr_more);
	}
	
	function list_location_ward ($select_name="ward_code", $parent_code='', $cur="", $ext="",$arr_more=array()) {
		global $ttH;
		
		$data = $ttH->load_data->data_table ('location_ward', 'code', 'code,title', "is_show=1 and lang='".$ttH->conf['lang_cur']."' and district_code='".$parent_code."'");
		
		return $ttH->html->select ($select_name, $data, $cur, $ext,$arr_more);
	}
	
	// load_sidebar
  function load_sidebar ($sidebar_id)
  {
    global $ttH;
		
		$data = $ttH->load_data->data_table (
			'sidebar', 
			'sidebar_id', 
			'*', 
			"is_show=1");
				
		if(isset($data[$sidebar_id]['list_widget'])) {
			return $ttH->func->load_widget_list ($data[$sidebar_id]['list_widget']);
		} else {
			return '';
		}		
  }
	  
// end classs
}
?>