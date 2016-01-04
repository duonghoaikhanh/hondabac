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

//=================get_navigation===============
function get_navigation ()
{
	global $ttH;
	
	$arr_nav = array(
		array(
			'title' => $ttH->lang['global']['homepage'],
			'link' => $ttH->site->get_link ('home')
		),
		array(
			'title' => $ttH->setting['product']['product_meta_title'],
			'link' => $ttH->site->get_link ('product')
		)
	);
	
	$arr_group = ($ttH->conf['cur_group'] > 0 && isset($ttH->conf["cur_group_nav"])) ? explode(',',$ttH->conf["cur_group_nav"]) : array();
	
	foreach($arr_group as $group_id) {
		if(isset($ttH->data["product_group"][$group_id])) {
			$arr_nav[] = array(
				'title' => $ttH->data["product_group"][$group_id]['title'],
				'link' => $ttH->site->get_link ('product', $ttH->data["product_group"][$group_id]['friendly_link'])
			);
		}
	}
	
	if(isset($ttH->conf['cur_item']) && $ttH->conf['cur_item'] > 0) {
		$arr_nav[] = array(
			'title' => $ttH->data["cur_item"]['title'],
			'link' => $ttH->site->get_link ('product', '', $ttH->data["product_group"][$group_id]['friendly_link'])
		);
	}
	
	return $ttH->site->html_arr_navigation($arr_nav);
}

//-----------get_group_name
function get_group_name ($group_id, $type='none'){
	global $ttH;
	
	$output = '';
	
	$sql = "select title,friendly_link    
					from product_group 
					where group_id='".$group_id."' 
					limit 0,1";
	//echo $sql;
	$result = $ttH->db->query($sql);
	$html_row = "";
	if ($row = $ttH->db->fetch_row($result)) {
		switch ($type) {
			case "link":
				$link = $ttH->site->get_link ('product',$row['friendly_link']);
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
	
	$output = '';
	
	$sql = "select title,friendly_link  
					from product_brand 
					where brand_id='".$brand_id."' 
					limit 0,1";
	//echo $sql;
	$result = $ttH->db->query($sql);
	$html_row = "";
	if ($row = $ttH->db->fetch_row($result)) {
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

//-----------get_status_pic
function get_status_pic ($status_id, $type='none'){
	global $ttH;
	
	$arr_status = $ttH->load_data->data_table ('product_status', 'status_id', 'status_id,picture,arr_title', '', array('arr_title'));
	$pic_w = 68;
	$pic_h = 68;
	
	$output = '';
	if (isset($arr_status[$status_id])) {
		$row = $arr_status[$status_id];
		$row["picture"] = $ttH->func->get_src_mod($row["picture"], $pic_w, $pic_h, 1, 0, array('fix_max' => 1));
		$row["title"] = $row["arr_title"][$ttH->conf['lang_cur']];
		switch ($type) {
			/*case "link":
				$link = $ttH->site->get_link ('product','thuong-hieu',$row['friendly_link']);
				$output = '<a href="'.$link.'">'.$row['picture'].'</a>';
				break;*/
			default:
				$output = '<div class="status_pic"><img src="'.$row['picture'].'" alt="'.$row["title"].'" /></div>';
				break;
		}
	}
	
	return $output;
}

//-----------list_color
function list_color ($item_is, $list_color='', $cur=0){
	global $ttH;
	
	$output = '';
	
	$sql = "select color_id,color,title   
					from product_color  
					where is_show=1 
					and lang='".$ttH->conf['lang_cur']."' 
					and find_in_set(color_id,'".$list_color."')>0 
					order by show_order desc, date_update desc";
	//echo $sql;
	$result = $ttH->db->query($sql);
	if ($num = $ttH->db->num_rows($result)) {
		$output = '<ul class="list_none list_input_color list_input">';
		$i = 0;
		while ($row = $ttH->db->fetch_row($result)) {
			$i++;
			if($cur > 0) {				
				$checked_li = ($row['color_id'] == $cur) ? ' class="checked"' : '';
				$checked = ($row['color_id'] == $cur) ? ' checked="checked"' : '';
			} else {
				$checked_li = ($i == 1) ? ' class="checked"' : '';
				$checked = ($i == 1) ? ' checked="checked"' : '';
			}
			
			$output .= '<li '.$checked_li.'><input type="radio" id="color_'.$row['color_id'].'" name="color" value="'.$row['color_id'].'" '.$checked.' /><label for="color_'.$row['color_id'].'" class="label_view">'.$row['title'].'</label></li>';
		}
		$output .= '</ul><div class="clear"></div><script language="javascript">list_input_color();</script>';
	}
	
	return $output;
}

//-----------list_size
function list_size ($item_is, $list_size='', $cur=0){
	global $ttH;
	
	$output = '';
	
	$sql = "select size_id,title   
					from product_size  
					where is_show=1 
					and lang='".$ttH->conf['lang_cur']."' 
					and find_in_set(size_id,'".$list_size."')>0 
					order by show_order desc, date_update desc";
	//echo $sql;
	$result = $ttH->db->query($sql);
	if ($num = $ttH->db->num_rows($result)) {
		$output = '<ul class="list_none list_input_size list_input">';
		$i = 0;
		while ($row = $ttH->db->fetch_row($result)) {
			$i++;
			if($cur > 0) {				
				$checked_li = ($row['size_id'] == $cur) ? ' class="checked"' : '';
				$checked = ($row['size_id'] == $cur) ? ' checked="checked"' : '';
			} else {
				$checked_li = ($i == 1) ? ' class="checked"' : '';
				$checked = ($i == 1) ? ' checked="checked"' : '';
			}
			
			$output .= '<li '.$checked_li.'><input type="radio" id="size_'.$row['size_id'].'" name="size" value="'.$row['size_id'].'" '.$checked.' /><label for="size_'.$row['size_id'].'" class="label_view">'.$row['title'].'</label></li>';
		}
		$output .= '</ul><div class="clear"></div><script language="javascript">list_input_size();</script>';
	}
	
	return $output;
}

//-----------list_combine
function list_combine ($item_id, $cur=0){
	global $ttH;
	
	$output = '';
	
	$arr_color = $ttH->load_data->data_table ('product_color', 'color_id', 'color_id,color,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
	$arr_size = $ttH->load_data->data_table ('product_size', 'size_id', 'size_id,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
	$arr_combine = $ttH->load_data->data_table ('product_combine', 'id', 'id,color_id,size_id', " type='product' and type_id='".$item_id."' order by date_create asc");
	
	$arr_option = array();
	if (($num = count($arr_combine)) > 0) {
		
		$i = 0;
		foreach ($arr_combine as $row) {
			$i++;
			
			if(!isset($arr_color[$row['color_id']]) || !isset($arr_color[$row['size_id']])) {
				continue;
			}
			
			$option_id = $row['color_id'].'_'.$row['size_id'];
			
			$checked_li = '';
			$checked = '';
			/*if($cur > 0) {				
				$checked_li = ($option_id == $cur) ? ' class="checked"' : '';
				$checked = ($option_id == $cur) ? ' checked="checked"' : '';
			} else {
				$checked_li = ($i == 1) ? ' class="checked"' : '';
				$checked = ($i == 1) ? ' checked="checked"' : '';
			}*/
			
			$arr_option[$row['color_id']] = (isset($arr_option[$row['color_id']])) ? $arr_option[$row['color_id']] : '';
			$arr_option[$row['color_id']] .= '<li '.$checked_li.'><label for="combine_'.$option_id.'"><input type="radio" id="combine_'.$option_id.'" name="combine" value="'.$option_id.'" '.$checked.' data-title="'.$arr_size[$row['size_id']]['title'].'" />'.$arr_size[$row['size_id']]['title'].'</label></li>';
		}
		
		if(count($arr_option) > 0) {
			$output = '<div class="list_combine">
			<div class="list_combine-title"><span>'.$ttH->lang['product']['choose_as_option'].'</span><div class="list_combine-arrow">&nbsp;</div></div>
			<ul class="list_none">';
			foreach ($arr_option as $color_id => $html) {
				//$text_color = ($arr_color[$color_id]['color'] > '#555555') ? '#ffffff' : '#000000';
				
				$tmp = array();
				foreach($ttH->func->hex2rgb($arr_color[$color_id]['color']) as $tmp1v) {
					$tmp[] = 255-$tmp1v;
					//$tmp[] = ($tmp1v > 127) ? 0 : 255;
				}
				
				$text_color = '#'.$ttH->func->rgb2hex($tmp);
				
				$output .= '<li '.$checked_li.' class="optgroup" style="background:'.$arr_color[$color_id]['color'].'; color:'.$text_color.';">'.$arr_color[$color_id]['title'].'</li>';
				$output .= $html;
			}
			$output .= '</ul><script language="javascript">list_combine()</script></div>';
		}
	}
	
	return $output;
}

//-----------list_code_pic
function list_code_pic ($item_is, $list_code_pic='', $cur=0){
	global $ttH;
	
	$output = '';
	
	$sql = "select code_pic_id,title   
					from product_code_pic  
					where is_show=1 
					and find_in_set(code_pic_id,'".$list_code_pic."')>0 
					order by show_order desc, date_update desc";
	//echo $sql;
	$result = $ttH->db->query($sql);
	if ($num = $ttH->db->num_rows($result)) {
		$output = '<ul class="list_none list_input_code_pic">';
		$i = 0;
		while ($row = $ttH->db->fetch_row($result)) {
			$i++;
			if($cur > 0) {				
				$checked_li = ($row['code_pic_id'] == $cur) ? ' class="checked"' : '';
				$checked = ($row['code_pic_id'] == $cur) ? ' checked="checked"' : '';
			} else {
				$checked_li = ($i == 1) ? ' class="checked"' : '';
				$checked = ($i == 1) ? ' checked="checked"' : '';
			}
			
			$output .= '<li '.$checked_li.'><input type="radio" id="code_pic_'.$row['code_pic_id'].'" name="code_pic" value="'.$row['code_pic_id'].'" '.$checked.' /><label for="code_pic_'.$row['code_pic_id'].'">'.$row['title'].'</label></li>';
		}
		$output .= '</ul><div class="clear"></div><script language="javascript">list_input_code_pic();</script>';
	}
	
	return $output;
}

//-----------
function html_list_item ($arr_in = array()){
	global $ttH;
	
	$output = '';
	
	$link_action = (isset($arr_in['link_action'])) ? $arr_in['link_action'] : $ttH->site->get_link ('product');
	$temp = (isset($arr_in['temp'])) ? $arr_in['temp'] : 'list_item';
	$paginate = (isset($arr_in['paginate'])) ? $arr_in['paginate'] : 1;
	$p = (isset($ttH->input["p"])) ? $ttH->input["p"] : 1;
	$n = (isset($ttH->setting['product']["num_list"])) ? $ttH->setting['product']["num_list"] : 30;
	$n = (isset($arr_in["num_list"])) ? $arr_in["num_list"] : $n;
	$num_row = (isset($arr_in['num_row'])) ? $arr_in['num_row'] : 3;
	$pic_w = (isset($arr_in['pic_w'])) ? $arr_in['pic_w'] : 130;//302;
	$pic_h = (isset($arr_in['pic_h'])) ? $arr_in['pic_h'] : 130;//377;
	
	$ext = '';
	$where = (isset($arr_in['where'])) ? $arr_in['where'] : '';
	
	$nav = '';
	$num_total = 0;
	$start = 0;
	if($paginate == 1) {
		
		$res_num = $ttH->db->query("select item_id 
						from product 
						where is_show=1 
						and lang='".$ttH->conf["lang_cur"]."' 
						".$where." ");
		$num_total = $ttH->db->num_rows($res_num);
		$num_items = ceil($num_total / $n);
		if ($p > $num_items)
			$p = $num_items;
		if ($p < 1)
			$p = 1;
		$start = ($p - 1) * $n;
		
		$nav = $ttH->site->paginate ($link_action, $num_total, $n, $ext, $p);
	}
	
	$where .= " order by show_order desc, date_create desc";
	
	$sql = "select item_id,item_code,group_id,brand_id,picture,price,percent_discount,price_buy,list_status,title,short,arr_option,friendly_link  
					from product 
					where is_show=1 
					and lang='".$ttH->conf["lang_cur"]."' 
					".$where." 
					limit $start,$n";
	//echo $sql;
	
	$result = $ttH->db->query($sql);
	$html_row = "";
	if ($num = $ttH->db->num_rows($result))
	{
		$arr_option = $ttH->load_data->data_table ('product_option', 'option_id', 'option_id,title', "is_show=1 order by show_order desc, date_create desc");
		
		$i = 0;
		while ($row = $ttH->db->fetch_row($result)) 
		{
			$i++;
			$row['stt'] = $i;
			$row['pic_w'] = $pic_w;
			$row['pic_h'] = $pic_h;
			$row['link'] = $ttH->site->get_link ('product','',$row['friendly_link']);
			$row["picture"] = $ttH->func->get_src_mod($row["picture"], $pic_w, $pic_h, 1, 1);
			
			$row["short"] = $ttH->func->short($row["short"], 120);
			
			$row['status_pic'] = get_status_pic ($row['list_status']);
			
			$row['class'] = ($i%$num_row == 0 || $i == $num) ? ' last' : '';
			
			$row['arr_option'] = unserialize($row['arr_option']);
			if(is_array($row['arr_option']) && count($row['arr_option']) > 0) {
				foreach($row['arr_option'] as $k => $v) {
					$op_title = $arr_option[$k]['title'];
					if(!empty($op_title) && $v) {
							$ttH->temp_act->assign('info', array('title'=>$op_title, 'content'=>$v));
							$ttH->temp_act->parse($temp.".row_item.col_item.info");
						}
				}
			}
			
			
			$row['price_out'] = '';
			if($row['price'] > $row['price_buy'] && $row['price_buy'] > 0) {
				$ttH->temp_act->assign('info', array('title'=>$ttH->lang['product']['price'], 'content'=>'<div class="price">'.$ttH->func->get_price_format ($row['price']).'</div>'));
				$ttH->temp_act->parse($temp.".row_item.col_item.info");
			}
			
			$row['price_buy'] = $ttH->func->get_price_format ($row['price_buy']);
			//$ttH->temp_act->parse($temp.".row_item.col_item.info");
			
			$row["link_cart"] = $ttH->site_func->get_link_popup ('product','cart', array('item_id'=>$row['item_id']));
			
			$ttH->temp_act->assign('col', $row);
			$ttH->temp_act->parse($temp.".row_item.col_item");
			if($i%$num_row == 0 || $i == $num){
				$ttH->temp_act->assign('row', array('hr' => ($i < $num) ? '<div class="hr"></div>' : ''));
				$ttH->temp_act->parse($temp.".row_item");

			}
		}


	}
	else
	{
		$ttH->temp_act->assign('row', array("mess"=>$ttH->lang["product"]["no_have_item"]));
		$ttH->temp_act->parse($temp.".row_empty");
	}
	
	$data['html_row'] = $html_row;
	$data['nav'] = (!empty($nav)) ? '<div class="hr"></div>'.$nav : '';
	$data['link_action'] = $link_action."&p=".$p;

	$ttH->temp_act->assign('data', $data);
	$ttH->temp_act->reset($temp);
	$ttH->temp_act->parse($temp);

	return $ttH->temp_act->text($temp);
}

function list_other ($where='')
{
	global $ttH;	
	
	$ttH->func->include_css($ttH->dir_js.'jcarousel/css/jcarousel.skeleton.css');
	$ttH->func->include_js($ttH->dir_js.'jcarousel/jquery.jcarousel.min.js');
	$ttH->func->include_js($ttH->dir_js.'jcarousel/jcarousel.skeleton.js');
	
	$output = '';
	
	$pic_w = 175;
	$pic_h = 189;
	
	$sql = "select item_id,picture,title,friendly_link,date_update  
			from product 
			where is_show=1 
			and lang='".$ttH->conf["lang_cur"]."' 
			".$where."
			order by show_order desc, date_update desc";
	//echo $sql;
	
	$result = $ttH->db->query($sql);
	$html_row = '';
	if ($num = $ttH->db->num_rows($result))
	{
		$i = 0;
		while ($row = $ttH->db->fetch_row($result)) 
		{
			$i++;
			$row['pic_w'] = $pic_w;
			$row['pic_h'] = $pic_h;
			$row['link'] = $ttH->site->get_link ('product','',$row['friendly_link']);
			$row['date_update'] = date('d/m/Y',$row['date_update']);
			$row['picture'] = $ttH->func->get_src_mod($row['picture'],$pic_w,$pic_h,1,0,array('fix_max'=>1));
			
			$ttH->temp_act->assign('row', $row);
			$ttH->temp_act->parse("list_other.row");
		}
	
		$ttH->temp_act->parse("list_other");
		return $ttH->temp_act->text("list_other");
	}
}

//=================select===============
function box_menu_sub ($array=array())
{
	global $ttH;
	
	$output = '';
	$arr_cur = ($ttH->conf['cur_group'] > 0 && isset($ttH->conf["cur_group_nav"])) ? explode(',',$ttH->conf["cur_group_nav"]) : array();
	
	$menu_sub = '';
	foreach($array as $row)
	{
		$row['link'] = $ttH->site->get_link ('product',$row['friendly_link']);
		$row['class'] = (in_array($row["group_id"],$arr_cur)) ? ' class="current"' : '';
		$row['menu_sub'] = '';
		if(isset($row['arr_sub'])){
			$row['menu_sub'] = box_menu_sub ($row['arr_sub']);
		}
		$ttH->temp_box->assign('row', $row);
		$ttH->temp_box->parse("box_menu.menu_sub.row");
		$menu_sub .= $ttH->temp_box->text("box_menu.menu_sub.row");
		$ttH->temp_box->reset("box_menu.menu_sub.row");
	}
	
	$ttH->temp_box->reset("box_menu.menu_sub");
	$ttH->temp_box->assign('data', array('content' => $menu_sub));
	$ttH->temp_box->parse("box_menu.menu_sub");
	return $ttH->temp_box->text("box_menu.menu_sub");
}

function box_menu () {
	global $ttH;
	
	$arr_cur = ($ttH->conf['cur_group'] > 0 && isset($ttH->conf["cur_group_nav"])) ? explode(',',$ttH->conf["cur_group_nav"]) : array();
	
	if(!isset($ttH->data["product_group"])){
		$query = "select group_id, group_nav, parent_id, title, friendly_link  
							from product_group 
							where is_show=1 
							and lang='".$ttH->conf["lang_cur"]."' 
							order by group_level asc, show_order desc, group_id asc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["product_group"] = array();
		$ttH->data["product_group_tree"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["product_group"][$row["group_id"]] = $row;
				
				$arr_group_nav = explode(',',$row['group_nav']);
				$str_code = '';
				$f = 0;
				foreach($arr_group_nav as $tmp){
					$f++;
					$str_code .= ($f == 1) ? '['.$tmp.']' : '["arr_sub"]['.$tmp.']';
				}
				eval('$ttH->data["product_group_tree"]'.$str_code.'["group_id"] = $row["group_id"];
				$ttH->data["product_group_tree"]'.$str_code.'["title"] = $row["title"];
				$ttH->data["product_group_tree"]'.$str_code.'["friendly_link"] = $row["friendly_link"];');
			}
		}
	}
	
	$output = '';
	
	if(count($ttH->data["product_group_tree"]) > 0){
		$data = array(
			'title' => $ttH->lang['product']['menu_title'],
			'content' => ''
		);
		
		$menu_sub = '';
		foreach($ttH->data["product_group_tree"] as $row)
		{
			$row['link'] = $ttH->site->get_link ('product',$row['friendly_link']);
			$row['class'] = (in_array($row["group_id"],$arr_cur)) ? ' class="current"' : '';
			$row['menu_sub'] = '';
			if(isset($row['arr_sub'])){
				$row['menu_sub'] = box_menu_sub ($row['arr_sub']);
			}
			$ttH->temp_box->assign('row', $row);
			$ttH->temp_box->parse("box_menu.menu_sub.row");
			$menu_sub .= $ttH->temp_box->text("box_menu.menu_sub.row");
			$ttH->temp_box->reset("box_menu.menu_sub.row");
		}		
		
		$ttH->temp_box->reset("box_menu.menu_sub");
		$ttH->temp_box->assign('data', array('content' => $menu_sub));
		$ttH->temp_box->parse("box_menu.menu_sub");
		
		$ttH->temp_box->assign('data', $data);
		$ttH->temp_box->parse("box_menu");
		$output = $ttH->temp_box->text("box_menu");
	}
	
	return $output;
}

//=================box_column===============
function box_left ()
{
	global $ttH;
	
	$output = $ttH->site->block_left ();
	
	return $output;
}

//=================box_column===============
function box_column ()
{
	global $ttH;
	
	$output = $ttH->site->block_column ();
	
	return $output;
}

/*==============================SHOPPING==============================*/
function list_quantity ($select_name,$cur="", $ext="",$arr_more=array())
{
	global $ttH;
	
	return $ttH->site->list_number ($select_name, 1, 100, $cur, $ext,$arr_more);
}

?>