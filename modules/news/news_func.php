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

define('DIR_MOD_UPLOAD', $ttH->conf['rooturl'].'uploads/news/');

//-----------get_group_name
function get_group_name ($group_id, $type='none')
{
	global $ttH;
	
	$output = '';
	
	$sql = "select title,friendly_link    
					from news_group 
					where group_id='".$group_id."' 
					limit 0,1";
	//echo $sql;
	$result = $ttH->db->query($sql);
	$html_row = "";
	if ($row = $ttH->db->fetch_row($result)) {
		switch ($type) {
			case "link":
				$link = $ttH->site->get_link ('news',$row['friendly_link']);
				$output = '<a href="'.$link.'">'.$row['title'].'</a>';
				break;
			default:
				$output = $row['title'];
				break;
		}
	}
	
	return $output;
}

//-----------
function html_list_item ($arr_in = array())
{
	global $ttH;
	
	$output = '';
	
	$link_action = (isset($arr_in['link_action'])) ? $arr_in['link_action'] : $ttH->site->get_link ('news');
	$temp = (isset($arr_in['temp'])) ? $arr_in['temp'] : 'list_item';
	$p = (isset($ttH->input["p"])) ? $ttH->input["p"] : 1;
	$pic_w = (isset($ttH->setting['news']["img_list_w"])) ? $ttH->setting['news']["img_list_w"] : 150;
	$pic_h = (isset($ttH->setting['news']["img_list_h"])) ? $ttH->setting['news']["img_list_h"] : 100;
	$num_row = 3;
	
	$ext = '';
	$where = (isset($arr_in['where'])) ? $arr_in['where'] : '';
	
	$num_total = 0;
	$res_num = $ttH->db->query("select item_id 
					from news 
					where is_show=1 
					and lang='".$ttH->conf["lang_cur"]."' 
					".$where." ");
	$num_total = $ttH->db->num_rows($res_num);
	$n = (isset($ttH->setting['news']["num_list"])) ? $ttH->setting['news']["num_list"] : 30;
	$num_items = ceil($num_total / $n);
	if ($p > $num_items)
		$p = $num_items;
	if ($p < 1)
		$p = 1;
	$start = ($p - 1) * $n;
	
	$where .= " order by show_order desc, date_update desc";
	
	$sql = "select item_id,group_id,picture,title,content,friendly_link,date_update  
					from news 
					where is_show=1 
					and lang='".$ttH->conf["lang_cur"]."' 
					".$where." 
					limit $start,$n";
	//echo $sql;
	
	$nav = $ttH->site->paginate ($link_action, $num_total, $n, $ext, $p);
	
	$result = $ttH->db->query($sql);
	$html_row = "";
	if ($num = $ttH->db->num_rows($result))
	{
		$i = 0;
		while ($row = $ttH->db->fetch_row($result)) 
		{
			$i++;
			$row['stt'] = $i;
			
			$row['pic_w'] = $pic_w;
			$row['pic_h'] = $pic_h;
			$row['link'] = $ttH->site->get_link ('news','',$row['friendly_link']);
			$row["picture"] = $ttH->func->get_src_mod('news/'.$row["picture"], $pic_w, $pic_h, 1, 0, array('fix_min' => 1));
			$row['short'] = $ttH->func->short ($row['content'], 400);
			$row['date_update'] = date('d/m/Y',$row['date_update']);
			
			$row['class'] = ($i%$num_row == 0 || $i == $num) ? ' last' : '';
			
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
		$ttH->temp_act->assign('row', array("mess"=>$ttH->lang["news"]["no_have_item"]));
		$ttH->temp_act->parse($temp.".row_empty");
	}
	
	$data['html_row'] = $html_row;
	$data['nav'] = $nav;
	
	$data['link_action'] = $link_action."&p=".$p;
	
	$ttH->temp_act->assign('data', $data);
	$ttH->temp_act->parse($temp);
	return $ttH->temp_act->text($temp);
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
		$row['link'] = $ttH->site->get_link ('news',$row['friendly_link']);
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
	
	if(!isset($ttH->data["news_group"])){
		$query = "select group_id, group_nav, parent_id, title, friendly_link  
							from news_group 
							where is_show=1 
							and lang='".$ttH->conf["lang_cur"]."' 
							order by group_level asc, show_order desc, date_update desc";
		//echo $query;
		$result = $ttH->db->query($query);
		$ttH->data["news_group"] = array();
		$ttH->data["news_group_tree"] = array();
		if($num = $ttH->db->num_rows($result)){
			while($row = $ttH->db->fetch_row($result)){
				$ttH->data["news_group"][$row["group_id"]] = $row;
				
				$arr_group_nav = explode(',',$row['group_nav']);
				$str_code = '';
				$f = 0;
				foreach($arr_group_nav as $tmp){
					$f++;
					$str_code .= ($f == 1) ? '['.$tmp.']' : '["arr_sub"]['.$tmp.']';
				}
				eval('$ttH->data["news_group_tree"]'.$str_code.'["group_id"] = $row["group_id"];
				$ttH->data["news_group_tree"]'.$str_code.'["title"] = $row["title"];
				$ttH->data["news_group_tree"]'.$str_code.'["friendly_link"] = $row["friendly_link"];');
			}
		}
	}
	
	$output = '';
	
	if(count($ttH->data["news_group_tree"]) > 0){
		$data = array(
			'title' => $ttH->lang['news']['menu_title'],
			'content' => ''
		);
		
		$menu_sub = '';
		foreach($ttH->data["news_group_tree"] as $row)
		{
			$row['link'] = $ttH->site->get_link ('news',$row['friendly_link']);
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

//=================get_navigation===============
function get_navigation ()
{
	global $ttH;
	
	return '';
	
	$arr_nav = array(
		array(
			'title' => $ttH->lang['global']['homepage'],
			'link' => $ttH->site->get_link ('home')
		)
	);
	
	$arr_group = ($ttH->conf['cur_group'] > 0 && isset($ttH->conf["cur_group_nav"])) ? explode(',',$ttH->conf["cur_group_nav"]) : array();
	
	foreach($arr_group as $group_id) {
		if(isset($ttH->data["news_group"][$group_id])) {
			$arr_nav[] = array(
				'title' => $ttH->data["news_group"][$group_id]['title'],
				'link' => $ttH->site->get_link ('news', $ttH->data["news_group"][$group_id]['friendly_link'])
			);
		}
	}
	
	if(isset($ttH->conf['cur_item']) && $ttH->conf['cur_item'] > 0) {
		$arr_nav[] = array(
			'title' => $ttH->data["cur_item"]['title'],
			'link' => $ttH->site->get_link ('news', '', $ttH->data["news_group"][$group_id]['friendly_link'])
		);
	}
	
	return $ttH->site->html_arr_navigation($arr_nav);
}

function list_other ($where='')
{
	global $ttH;	
	
	$output = '';
	
	$sql = "select item_id,title,friendly_link,date_update  
			from news 
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
			$row['link'] = $ttH->site->get_link ('news','',$row['friendly_link']);
			$row['date_update'] = date('d/m/Y',$row['date_update']);
			
			$ttH->temp_act->assign('row', $row);
			$ttH->temp_act->parse("list_other.row");
		}
	
		$ttH->temp_act->parse("list_other");
		return $ttH->temp_act->text("list_other");
	}
}

//=================box_column===============
function box_column ()
{
	global $ttH;
	
	$output = $ttH->site->block_left ();
	
	return $output;
}

?>