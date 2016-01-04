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

//-----------get_status_pic
function get_status_pic ($status_id, $type='none'){
	global $ttH;
	
	$arr_status = $ttH->load_data->data_table ('product_status', 'status_id', 'status_id,picture,arr_title', '', array('arr_title'));
	$pic_w = 68;
	$pic_h = 68;
	
	$output = '';
	if (isset($arr_status[$status_id])) {
		$row = $arr_status[$status_id];
		$row["picture"] = $ttH->func->get_src_mod('product/'.$row["picture"], $pic_w, $pic_h, 1, 0, array('fix_max' => 1));
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

//-----------
function html_list_item ($arr_in = array()){
	global $ttH;
	
	$output = '';
	
	$link_action = (isset($arr_in['link_action'])) ? $arr_in['link_action'] : $ttH->site->get_link ('product');
	$temp = (isset($arr_in['temp'])) ? $arr_in['temp'] : 'list_item';
	$paginate = (isset($arr_in['paginate'])) ? $arr_in['paginate'] : 1;
	$p = (isset($ttH->input["p"])) ? $ttH->input["p"] : 1;
	$n = (isset($ttH->setting['home']["num_list"])) ? $ttH->setting['home']["num_list"] : 30;
	$n = (isset($arr_in["num_list"])) ? $arr_in["num_list"] : $n;
	$num_row = (isset($arr_in['num_row'])) ? $arr_in['num_row'] : 3;
	$pic_w = (isset($arr_in['pic_w'])) ? $arr_in['pic_w'] : 130;//302;
	$pic_h = (isset($arr_in['pic_h'])) ? $arr_in['pic_h'] : 130;//377;
	
	$ext = '';
	$where = (isset($arr_in['where'])) ? $arr_in['where'] : '';
	$order_by = (isset($arr_in['order_by'])) ? $arr_in['order_by'] : 'order by show_order desc, date_create desc';
	
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
	
	$where .= ' '.$order_by.' ';
	
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
		$arr_option = $ttH->load_data->data_table ('product_option', 'option_id', 'option_id,arr_title', "is_show=1 order by show_order desc, date_create desc", array('arr_title'));
		
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
					$op_title = isset($arr_option[$k]['arr_title'][$ttH->conf['lang_cur']]) ? $arr_option[$k]['arr_title'][$ttH->conf['lang_cur']] : '';
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
			$ttH->temp_act->parse($temp.".row_item.col_item.info");
			
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
		$ttH->temp_act->assign('row', array("mess"=>$ttH->lang["home"]["no_have_item"]));
		$ttH->temp_act->parse($temp.".row_empty");
	}
	
	$data['html_row'] = $html_row;
	$data['nav'] = (!empty($nav)) ? '<div class="hr"></div>'.$nav : '';
	
	$data['link_action'] = $link_action."&p=".$p;
	
	$ttH->temp_act->reset($temp);
	$ttH->temp_act->assign('data', $data);
	$ttH->temp_act->parse($temp);
	return $ttH->temp_act->text($temp);
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
?>