<?php

/*================================================================================*\
Name code : function.php
Copyright © 2013 by Phan Van Lien
@version : 1.0
@date upgrade : 03/02/2013 by Phan Van Lien
\*================================================================================*/

if (! defined('IN_ttH')) {
  die('Hacking attempt!');
}

define('DIR_MOD_UPLOAD', $ttH->conf['rooturl'].'uploads/product/');

//=================load_setting===============
function load_setting (){
	global $ttH;
	$ttH->setting = array();
	
	return false;
}

function create_folder($dir="", $mode = 0755) {
	global $ttH;
	
	if($ttH->func->rmkdir("product/".$dir, $mode)){
		return $dir;
	}else{
		return "";
	}
}

function built_group_nav_sub ($group_id, $group_nav = '') {
	global $ttH;
	
	//update product
	$col_up = array();
	$col_up["group_nav"] = $group_nav;
	$ttH->db->do_update("product", $col_up, " group_id='".$group_id."'");	
	//End 
	
	$query = "select group_id 
						from product_group   
						where parent_id='".$group_id."' ";
	//echo $query;
	$result = $ttH->db->query($query);
	while($row = $ttH->db->fetch_row($result)){
		$col = array();
		$col["group_nav"] = $group_nav;
		$col["group_nav"] .= (!empty($col["group_nav"])) ? ',' : '';
		$col["group_nav"] .= $row['group_id'];
		$col["group_level"] = substr_count($col['group_nav'],',') + 1;
		$ok = $ttH->db->do_update("product_group", $col, " group_id='".$row['group_id']."'");	
		if($ok) {
			
		//update product
			$col_up = array();
			$col_up["group_nav"] = $col["group_nav"];
			$ttH->db->do_update("product", $col_up, " group_id='".$row['group_id']."'");
			//End 	
			
			built_group_nav_sub ($row['group_id'], $col["group_nav"]);
		}		
	}
	
	return '';
}

function get_group_nav ($parent_id, $group_id=0, $type='group') {
	global $ttH;
	
	$output = '';
	if($group_id <= 0 && $type == 'group'){
		return '';
	}
	
	$query = "select group_id, group_nav
						from product_group 
						where group_id='".$parent_id."' 
						limit 0,1";
	//echo $query;
	$result = $ttH->db->query($query);
	if($row = $ttH->db->fetch_row($result)){
		$output = $row['group_nav'];
		if($type == 'group'){
			$output .= ','.$group_id;
		}
	}else{
		if($type == 'group'){
			$output = $group_id;
		}
	}
	
	return $output;
}


//-----------get_group_name
function get_group_name ($group_id, $type='none'){
	global $ttH;
	
	$data = $ttH->load_data->data_table ('product_group', 'group_id', 'group_id,title,friendly_link', " lang='".$ttH->conf['lang_cur']."' and group_id='".$group_id."' ");
	
	$output = '---';
	if (isset($data[$group_id])) {
		$row = $data[$group_id];
		switch ($type) {
			case "link":
				$link = $ttH->admin->get_link_admin ('product', 'group', 'edit', array("id"=>$row['group_id']));
				$output = '<a href="'.$link.'">'.$row['title'].'</a>';
				break;
			default:
				$output = $row['title'];
				break;
		}
	}
	
	return $output;
}

//-----------get_brand_name
function get_brand_name ($brand_id, $type='none'){
	global $ttH;
	
	$data = $ttH->load_data->data_table ('product_brand', 'brand_id', 'brand_id,title,friendly_link', " lang='".$ttH->conf['lang_cur']."' and group_id='".$group_id."' ");
	
	$output = '';
	if (isset($data[$group_id])) {
		$row = $data[$group_id];
		switch ($type) {
			case "link":
				$link = $ttH->site->get_link ('product','thuong-hieu',$row['friendly_link']);
				$output = '<a href="'.$link.'">'.$row['title'].'</a>';
				break;
			default:
				$output = $row['title'];
				break;
		}
	}
	
	return $output;
}

function list_group ($select_name="group_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	$ttH->load_data->data_group ('product');
	
	$select_muti = (isset($arr_more['select_muti'])) ? $arr_more['select_muti'] : 0;
	if($select_muti == 1) {
		return $ttH->html->select_muti ($select_name, $ttH->data["product_group_tree"], $cur, $ext,$arr_more);
	} else {
		return $ttH->html->select ($select_name, $ttH->data["product_group_tree"], $cur, $ext,$arr_more);
	}
}

function list_brand ($select_name="brand_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	if(!isset($ttH->data["product_brand"])){
		$query = "select m.brand_id, title 
							from product_brand m, product_brand_lang ml  
							where m.brand_id=ml.brand_id 
							and is_show=1 
							and lang='".$ttH->conf["lang_cur"]."' 
							order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["product_brand"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["product_brand"][$row["brand_id"]] = $row['title'];
			}
		}
	}
	
	return $ttH->html->select ($select_name, $ttH->data["product_brand"], $cur, $ext,$arr_more);
}

function list_product ($select_name="item_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	if(!isset($ttH->data["product"])){
		$query = "select item_id, title 
							from product 
							where is_show=1 
							and lang='".$ttH->conf["lang_cur"]."' 
							order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["product"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["product"][$row["item_id"]] = $row['title'];
			}
		}
	}
	
	return $ttH->html->select ($select_name, $ttH->data["product"], $cur, $ext,$arr_more);
}

function list_product_receipt ($select_name="receipt_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	if(!isset($ttH->data["product_receipt"])){
		$query = "select receipt_id, title 
							from product_receipt 
							where is_show=1 
							order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["product_receipt"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["product_receipt"][$row["receipt_id"]] = $row['title'];
			}
		}
	}
	
	return $ttH->html->select ($select_name, $ttH->data["product_receipt"], $cur, $ext,$arr_more);
}

function list_product_receipt_import ($select_name="receipt_id", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	if(!isset($ttH->data["product_receipt_import"])){
		$query = "select receipt_id, title 
							from product_receipt 
							where is_show=0 
							order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["product_receipt_import"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["product_receipt_import"][$row["receipt_id"]] = $row['title'];
			}
		}
	}
	
	return $ttH->html->select ($select_name, $ttH->data["product_receipt_import"], $cur, $ext,$arr_more);
}

function list_pic_show ($select_name="pic_show", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	$arr_data = array(

		'slide' => 'Dạng slide',
		'grid' => 'Dạng danh sách'
	);
	
	return $ttH->html->select ($select_name, $arr_data, $cur, $ext,$arr_more);
}

function list_color ($select_name="list_color", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	if(empty($cur)) {
		$cur = array();
	} elseif(!is_array($cur)) {
		$cur = explode(',',$cur);
	}
	
	if(!isset($ttH->data["product_color"])){
		$query = "select color_id,color,title  
							from product_color 
							where is_show=1 
							order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["product_color"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["product_color"][$row["color_id"]] = $row['title'];
			}
		}
	}
	
	return $ttH->html->select ($select_name, $ttH->data["product_color"], $cur, $ext,$arr_more);
}

function list_size ($select_name="list_size", $cur="", $ext="",$arr_more=array()) {
	global $ttH;
	
	if(empty($cur)) {
		$cur = array();
	} elseif(!is_array($cur)) {
		$cur = explode(',',$cur);
	}
	
	if(!isset($ttH->data["product_size"])){
		$query = "select size_id,title  
							from product_size 
							where is_show=1 
							order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["product_size"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["product_size"][$row["size_id"]] = $row['title'];
			}
		}
	}
	
	return $ttH->html->select ($select_name, $ttH->data["product_size"], $cur, $ext,$arr_more);
}

function list_input_option ($select_name="arr_option", $cur=array(), $ext="",$arr_more=array()) {
	global $ttH;
	
	if(!isset($ttH->data["product_option"])){
		$query = "select option_id, arr_title  
							from product_option 
							where is_show=1 
							order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["product_option"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$row['arr_title'] = unserialize($row['arr_title']);
				$row['title'] = $row['arr_title'][$ttH->conf['lang_cur']];
				$ttH->data["product_option"][$row["option_id"]] = $row;
			}
		}
	}
	
	if(isset($ttH->data["product_option"]) && count($ttH->data["product_option"]) > 0){
		$ttH->temp_act->parse("edit.f_input_option");
		
		foreach($ttH->data["product_option"] as $row) {
			$row['content'] = (isset($cur[$row['option_id']])) ? $cur[$row['option_id']] : '';
			$ttH->temp_act->assign('row', $row);
			$ttH->temp_act->parse("edit.input_option");
		}
	}
	
	return '';
}

function list_color_checkbox ($input_name="list_color", $cur=array(), $ext="",$arr_more=array()) {
	global $ttH;
	
	if(empty($cur)) {
		$cur = array();
	} elseif(!is_array($cur)) {
		$cur = explode(',',$cur);
	}
	
	if(!isset($ttH->data["product_color"])){
		$query = "select color_id,color,title  
							from product_color 
							where is_show=1 
							order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["product_color"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["product_color"][$row["color_id"]] = $row;
			}
		}
	}
	
	if(isset($ttH->data["product_color"]) && count($ttH->data["product_color"]) > 0){
		foreach($ttH->data["product_color"] as $row) {
			$row['input_name'] = $input_name;
			$row['value'] = $row['color_id'];
			$row['title'] = '<span style="background:'.$row['color'].'; border:1px solid #ccc;">&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;<span>'.$row['title'].'</span>';
			$row['checked'] = (in_array($row['color_id'],$cur)) ? ' checked="checked"' : '';
			$ttH->temp_act->assign('row', $row);
			$ttH->temp_act->parse("checkbox_inline.row");
		}
	}
	
	$ttH->temp_act->reset("checkbox_inline");
	$ttH->temp_act->parse("checkbox_inline");
	return $ttH->temp_act->text("checkbox_inline");
}

function list_size_checkbox ($input_name="list_size", $cur=array(), $ext="",$arr_more=array()) {
	global $ttH;
	
	if(empty($cur)) {
		$cur = array();
	} elseif(!is_array($cur)) {
		$cur = explode(',',$cur);
	}
	
	if(!isset($ttH->data["product_size"])){
		$query = "select size_id,title  
							from product_size 
							where is_show=1 
							order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["product_size"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["product_size"][$row["size_id"]] = $row;
			}
		}
	}
	
	if(isset($ttH->data["product_size"]) && count($ttH->data["product_size"]) > 0){
		foreach($ttH->data["product_size"] as $row) {
			$row['input_name'] = $input_name;
			$row['value'] = $row['size_id'];
			$row['title'] = '<span>'.$row['title'].'</span>';
			$row['checked'] = (in_array($row['size_id'],$cur)) ? ' checked="checked"' : '';
			$ttH->temp_act->assign('row', $row);
			$ttH->temp_act->parse("checkbox_inline.row");
		}
	}
	
	$ttH->temp_act->reset("checkbox_inline");
	$ttH->temp_act->parse("checkbox_inline");
	return $ttH->temp_act->text("checkbox_inline");
}

function list_code_pic ($input_name="list_code_pic", $cur=array(), $ext="",$arr_more=array()) {
	global $ttH;
	
	if(empty($cur)) {
		$cur = array();
	} elseif(!is_array($cur)) {
		$cur = explode(',',$cur);
	}
	
	if(!isset($ttH->data["product_code_pic"])){
		$query = "select code_pic_id,title  
							from product_code_pic 
							where is_show=1 
							order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["product_code_pic"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["product_code_pic"][$row["code_pic_id"]] = $row;
			}
		}
	}
	
	if(isset($ttH->data["product_code_pic"]) && count($ttH->data["product_code_pic"]) > 0){
		foreach($ttH->data["product_code_pic"] as $row) {
			$row['input_name'] = $input_name;
			$row['value'] = $row['code_pic_id'];
			$row['title'] = '<span>'.$row['title'].'</span>';
			$row['checked'] = (in_array($row['code_pic_id'],$cur)) ? ' checked="checked"' : '';
			$ttH->temp_act->assign('row', $row);
			$ttH->temp_act->parse("checkbox_inline.row");
		}
	}
	
	$ttH->temp_act->reset("checkbox_inline");
	$ttH->temp_act->parse("checkbox_inline");
	return $ttH->temp_act->text("checkbox_inline");
}

function list_status ($input_name="list_status", $cur=array(), $ext="",$arr_more=array()) {
	global $ttH;
	
	if(empty($cur)) {
		$cur = array();
	} elseif(!is_array($cur)) {
		$cur = explode(',',$cur);
	}
	
	if(!isset($ttH->data["product_status"])){
		$query = "select status_id,picture,title  
							from product_status 
							where is_show=1 
							order by show_order desc, date_create asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["product_status"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["product_status"][$row["status_id"]] = $row;
			}
		}
	}
	
	if(isset($ttH->data["product_status"]) && count($ttH->data["product_status"]) > 0){
		$row = array();
		$row['input_name'] = $input_name;
		$row['value'] = '';
		$row['title'] = '<span>Không trạng thái</span>';
		$row['checked'] = (count($cur) <= 0) ? ' checked="checked"' : '';
		$ttH->temp_act->assign('row', $row);
		$ttH->temp_act->parse("radio_inline.row");
		
		foreach($ttH->data["product_status"] as $row) {
			$row['input_name'] = $input_name;
			$row['value'] = $row['status_id'];
			if(!empty($row["picture"])){
				$row["picture"] = '<a class="fancybox-effects-a" title="'.$row["picture"].'" href="'.DIR_MOD_UPLOAD.$row["picture"].'">
					'.$ttH->func->get_pic_mod($row["picture"], 30, 30, '', 1, 0, array('fix_max'=>1)).'
				</a>';
			}
			$row['title'] = $row["picture"].'<span>'.$row['title'].'</span>';
			$row['checked'] = (in_array($row['status_id'],$cur)) ? ' checked="checked"' : '';
			$ttH->temp_act->assign('row', $row);
			$ttH->temp_act->parse("radio_inline.row");
		}
	}
	
	$ttH->temp_act->parse("radio_inline");
	return $ttH->temp_act->text("radio_inline");
}

function item_code_next ($item_code='', $item_id=0) {
	global $ttH;
	
	$output = $ttH->func->random_str(6, 'u');
	
	if($item_code && $item_id > 0) {
		$sql_check = "select item_id, item_code from product where item_code='".$item_code."' and item_id!='".$item_id."'";
		$result_check = $ttH->db->query($sql_check);
		if ($ttH->db->num_rows($result_check)){
			$item_code = $item_id.$ttH->func->random_str(5, 'u');
			return item_code_next ($item_code, $item_id);
		} else {
			return $item_code;
		}
	}
	
	$query = "select item_id  
						from product 
						order by item_id desc 
						limit 0,1";
	//echo $query;
	$result = $ttH->db->query($query);
	if($row = $ttH->db->fetch_row($result)){
		$item_code = ($row['item_id']+1).$ttH->func->random_str(5, 'u');
		return item_code_next ($item_code, $row['item_id']);
	}
	
	return $output;
}

//=================list_method_config===============
function list_method_config ($select_name="name_action", $cur = "", $ext="",$arr_more=array())
{
	global $ttH;
	$text = "";
	$path = $ttH->conf['rootpath_web'] . "modules".DS."product".DS."payment_method".DS."config";
	if ($dir = opendir($path)) {
		$text .= "<select size=1 name=\"".$select_name."\" id=\"".$select_name."\" ".$ext.">";
		
		if(isset($arr_more["title"]))
			$text .= "<option value=\"\"> " . $arr_more["title"] . " </option>";
		
		while (false !== ($file = readdir($dir))) {
			if ( $file != "index.html" && $file != "." && $file != "..") {
				$file = str_replace('.php','',$file);
				$selected = ($file == $cur) ? " selected='selected'" : "";
				$text .= "<option value=\"".$file ."\" ".$selected."> " . $file . " </option>";
			}
		}
		$text .= "</select>";
	}
	return $text;
}

?>