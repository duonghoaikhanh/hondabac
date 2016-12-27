<?php

/*================================================================================*\
Name code : class_functions.php
Copyright © 2013 by Phan Van Lien
@version : 1.0
@date upgrade : 03/02/2013 by Phan Van Lien
\*================================================================================*/

class Data
{
	
	function __construct(){
		global $ttH;
		$this->data_lang();
		$this->data_modules();
		return true;
	}
		
	
	//-----------------data_lang
	public function data_lang (){
		global $ttH;
		
		if(isset($ttH->data["lang"])){
			return $ttH->data["lang"];
		}
		
		$ttH->data["lang"] = array();
		
		$output = "";
		
		$result = $ttH->db->query("select * from lang order by show_order desc, id asc");
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["lang"][$row["name"]] = $row;
				if($row["is_default"] == 1)
				{
					$ttH->data["lang_default"] = $row;
					$ttH->data["lang_default"]["num_lang"] = $num;
				}
			}
		}
		
		return $ttH->data["lang"]; 
	}
	
	//-----------------data_lang
	public function data_modules (){
		global $ttH;
		
		if(isset($ttH->data["modules"])){
			return $ttH->data["modules"];
		}
		
		$ttH->data["modules"] = array();
		
		$output = "";
		
		$result = $ttH->db->query("select * from modules");
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["modules"][$row["name_action"]] = $row;
				$ttH->data["modules"][$row["name_action"]]["arr_title"] = unserialize($row["arr_title"]);
				$ttH->data["modules"][$row["name_action"]]["arr_friendly_link"] = unserialize($row["arr_friendly_link"]);
				
			}
		}
		
		return $ttH->data["modules"]; 
	}
	
	//-----------------data_modules_url
	public function data_modules_url (){
		global $ttH;
		
		if(isset($ttH->data["modules_url"])){
			return $ttH->data["modules_url"];
		}else{
			$this->data_modules();
		}
		
		$ttH->data["modules_url"] = array();
		
		$output = "";
		
		foreach($ttH->data["modules"] as $row){
			foreach($row["arr_friendly_link"] as $lang => $friendly_link){
				$ttH->data["modules_url"][$friendly_link] = array(
					"name_action" => $row["name_action"],
					"lang" => $lang
				);
			}
		}
		
		return $ttH->data["modules_url"]; 
	}
	
	//-----------------data_widget
	public function data_widget (){
		global $ttH;
		
		if(isset($ttH->data["widget"])){
			return $ttH->data["widget"];
		}
		
		$ttH->data["widget"] = array();
		
		$output = "";
		
		$result = $ttH->db->query("select * from widget");
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["widget"][$row["name_action"]] = $row;
				$ttH->data["widget"][$row["name_action"]]["arr_title"] = unserialize($row["arr_title"]);
				
			}
		}
		
		return $ttH->data["widget"]; 
	}
	
	//-----------------data_banner_group
	public function data_banner_group (){
		global $ttH;
		
		if(isset($ttH->data["banner_group"])){
			return $ttH->data["banner_group"];
		}
		
		$ttH->data["banner_group"] = array();
		
		$output = "";
		
		$result = $ttH->db->query("select * from banner_group where is_show=1");
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["banner_group"][$row["group_id"]] = $row;
				$ttH->data["banner_group"][$row["group_id"]]["arr_title"] = unserialize($row["arr_title"]);
				
			}
		}
		
		return $ttH->data["banner_group"]; 
	}
	
	//-----------------data_banner
	public function data_banner (){
		global $ttH;
		
		if(isset($ttH->data["banner"])){
			return $ttH->data["banner"];
		}
		
		$ttH->data["banner"] = array();
		
		$output = "";
		$where = " and lang='".$ttH->conf['lang_cur']."'";
		
		if(isset($ttH->conf['cur_mod'])) {
			$where .= " and (find_in_set('".$ttH->conf['cur_mod']."',show_mod)>0 || show_mod='')";
		}
		if(isset($ttH->conf['cur_act'])) {
			$where .= " and (find_in_set('".$ttH->conf['cur_act']."',show_act)>0 || show_act='')";
		}		
		
		$query = "select * 
									from banner 
									where is_show=1 
									".$where." 
									order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["banner"][$row["group_id"]][$row["banner_id"]] = $row;
			}
		}
		
		return $ttH->data["banner"]; 
	}
	
	//-----------------data_menu
	public function data_menu (){
		global $ttH;
		
		if(isset($ttH->data["menu"])){
			return $ttH->data["menu"];
		}
		
		$ttH->data["menu"] = array();
		$ttH->data["menu_action"] = array();
		
		$output = "";
		
		$where = " and (find_in_set('".$ttH->conf['cur_mod']."',show_mod)>0 || show_mod='')";
		if(isset($ttH->conf['cur_act'])) {
			$where .= " and (find_in_set('".$ttH->conf['cur_act']."',show_act)>0 || show_act='')";
		}		
		$query = "select *   
									from menu 
									where is_show=1 
									and lang='".$ttH->conf["lang_cur"]."' 
									".$where." 
									order by menu_level asc, show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["menu_action"][$row["group_id"]][$row["name_action"]] = $row;
				$ttH->data["menu"][$row["group_id"]][$row["menu_id"]] = $row;
				
				$arr_menu_nav = explode(',',$row['menu_nav']);
				$str_code = '';
				$f = 0;
				foreach($arr_menu_nav as $tmp){
					$f++;
					$str_code .= ($f == 1) ? '['.$tmp.']' : '["arr_sub"]['.$tmp.']';
				}
				eval('$ttH->data["menu_tree_'.$row['group_id'].'"]'.$str_code.' = $row;');
			}
		}
		
		return $ttH->data["menu"]; 
	}
	
	//-----------------data_menu
	public function data_group ($type='product'){
		global $ttH;
		
		if(!isset($ttH->data[$type."_group_tree"])){
			$query = "select * 
								from ".$type."_group 
								where is_show=1 
								and lang='".$ttH->conf["lang_cur"]."' 
								order by group_level asc, show_order desc, group_id asc";
			//echo $query;
			$result = $ttH->db->query($query);
			$ttH->data[$type."_group"] = array();
			$ttH->data[$type."_group_tree"] = array();
			if($num = $ttH->db->num_rows($result)){
				while($row = $ttH->db->fetch_row($result)){
					$ttH->data[$type."_group"][$row["group_id"]] = $row;
					
					$arr_group_nav = explode(',',$row['group_nav']);
					$str_code = '';
					$f = 0;
					foreach($arr_group_nav as $tmp){
						$f++;
						$str_code .= ($f == 1) ? '['.$tmp.']' : '["arr_sub"]['.$tmp.']';
					}
					eval('$ttH->data["'.$type.'_group_tree"]'.$str_code.' = $row;');
				}
			}
		}
		
		return $ttH->data[$type."_group"]; 
	}
	
	//-----------------data_table
	public function data_table ($table_name, $table_id, $sql_select='*', $sql_where='', $arr_is_array=array(), $arr_more = array()){
		global $ttH;
		
		if(is_array($sql_where) && count($sql_where) > 0) {
			$sql_where = explode(' and ',$sql_where);
		}
		
		if(!empty($sql_where)) {
			$sql_where = " where ".$sql_where;
		}
		
		$data_name = $table_name.md5($sql_select.$sql_where);
		
		if(isset($ttH->data[$data_name])){
			return $ttH->data[$data_name];
		}
		
		$ttH->data[$data_name] = array();
		
		$output = "";
		
		$query = "select ".$sql_select." from ".$table_name.$sql_where;
		//echo $query;
		$result = $ttH->db->query($query);
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				foreach($arr_is_array as $key) {
					$row[$key] = unserialize($row[$key]);
				}
				if(isset($arr_more['editor'])) {
					$arr_tmp = explode(',',$arr_more['editor']);
					foreach($arr_tmp as $key) {
						$row[$key] = $ttH->func->input_editor_decode($row[$key]);
					}
				}
				$ttH->data[$data_name][$row[$table_id]] = $row;
			}
		}
		
		return $ttH->data[$data_name]; 
	}
	  
// end classs
}
?>