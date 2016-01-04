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
	var $modules = "product";
	var $action = "detail";
	var $sub = "manage";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		
		$ttH->func->load_language($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS.$this->modules.".tpl");
		$ttH->temp_act->assign('CONF', $ttH->conf);
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		$ttH->func->include_css ($ttH->dir_css.$this->modules.'/'.$this->modules.".css");
		$ttH->func->include_js($ttH->dir_skin.'js/'.$this->modules.'/'.$this->modules.".js");
		$ttH->func->include_js($ttH->dir_js."yetii-min.js");
		
		$ttH->conf['menu_action'] = array($this->modules);
		$ttH->data['link_lang'] = (isset($ttH->data['link_lang'])) ? $ttH->data['link_lang'] : array();
		
		include ($this->modules."_func.php");
		
		$data = array();
		if(isset($ttH->conf['cur_item'])){
			$result = $ttH->db->query("select * 
										from product 
										where item_id='".$ttH->conf['cur_item']."' 
										and is_show=1 
										limit 0,1");
			if($row = $ttH->db->fetch_row($result)){
				//Make link lang
				$result = $ttH->db->query("select friendly_link,lang   
											from product 
											where item_id='".$ttH->conf['cur_item']."' ");
				while($row_lang = $ttH->db->fetch_row($result)){
					$ttH->data['link_lang'][$row_lang['lang']] = $ttH->site->get_link_lang ($row_lang['lang'], $this->modules, '', $row_lang['friendly_link']);
				}
				//End Make link lang
				//SEO
				$ttH->site->get_seo ($ttH->data['cur_item']);
				$ttH->conf["cur_group"] = $row["group_id"];
				$ttH->conf["cur_group_nav"] = $row["group_nav"];
				
				//Current menu
				$arr_group_nav = (!empty($ttH->conf["cur_group_nav"])) ? explode(',',$ttH->conf["cur_group_nav"]) : array();
				foreach($arr_group_nav as $v) {
					$ttH->conf['menu_action'][] = $this->modules.'-group-'.$v;
				}
				$ttH->conf['menu_action'][] = $this->modules.'-item-'.$ttH->conf['cur_item'];
				//End current menu
				
				$group_name = get_group_name ($row["group_id"], 'link');
				$data['content'] = $this->do_detail($row, $ttH->data['cur_item']);
			}else{
				$ttH->html->redirect_rel($ttH->site->get_link ($this->modules));
			}
		}else{
			$ttH->html->redirect_rel($ttH->site->get_link ($this->modules));
		}
		
		$ttH->navigation = get_navigation ();	
	
		$data['navigation'] = $ttH->navigation;
		$data['box_left'] = box_left();
		$data['box_column'] = box_column();
	
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("main");
		$ttH->output .=  $ttH->temp_act->text("main");
	}
	
	function do_detail ($info = array(), $info_lang = array())
	{
		global $ttH;	
		
		$ttH->func->include_css($ttH->dir_skin.'js/jcarousel-master/connected-carousels/product.css');
		$ttH->func->include_js($ttH->dir_skin.'js/jcarousel-master/dist/jquery.jcarousel.min.js');
		$ttH->func->include_js($ttH->dir_skin.'js/jcarousel-master/connected-carousels/jcarousel.connected-carousels.js');
		
		$data = array_merge($info,$info_lang);
		
		$data["link_action"] = $ttH->site->get_link ('product','',$info_lang['friendly_link']);
		//$data["link_cart"] = $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_cart_link']).'/?item_id='.$data['item_id'];
		$data["link_cart"] = $ttH->site_func->get_link_popup ('product','cart', array('item_id'=>$data['item_id']));
		
		$data["img_detail"] = $this->pic_slide ($data);
		$data["brand_name"] = get_brand_name ($info["brand_id"],'link');
		$data["group_name"] = get_group_name ($info["group_id"],'link');
		$data["price"] = $ttH->func->get_price_format ($info["price"]);
		$data["price_buy"] = $ttH->func->get_price_format ($info["price_buy"]);
		
		if($info["price"] > $info["price_buy"] && $info["price_buy"]>0) {
			$ttH->temp_act->assign('price', $data['price']);
			$ttH->temp_act->parse("detail.info_row_price");
		}
		
		$sql = "select option_id,title  
						from product_option 
						where is_show=1 
						and lang= '".$ttH->conf['lang_cur']."'
						order by show_order desc, date_create asc";
		//echo $sql;
		$result = $ttH->db->query($sql);
		$html_row = "";
		while ($row = $ttH->db->fetch_row($result)) {
			if(isset($data['arr_option'][$row['option_id']])){
				$row['content'] = $data['arr_option'][$row['option_id']];
				$ttH->temp_act->assign('row', $row);
				$ttH->temp_act->parse("detail.info_row");
			}
		}
		
		$data["list_color"] = list_color ($info["item_id"], $info["list_color"]);
		if(!empty($data["list_color"])) {
			$row = array();
			$row['info_row_class'] = 'list_color';
			$row['title'] = $ttH->lang['product']['color'];
			$row['content'] = $data["list_color"];
			$ttH->temp_act->assign('row', $row);
			$ttH->temp_act->parse("detail.info_row");
		}
		
		$data["list_size"] = list_size ($info["item_id"], $info["list_size"]);
		if(!empty($data["list_size"])) {
			$row = array();
			$row['info_row_class'] = 'list_size';
			$row['title'] = $ttH->lang['product']['size'];
			$row['content'] = $data["list_size"];
			$ttH->temp_act->assign('row', $row);
			$ttH->temp_act->parse("detail.info_row");
		}
		
		//$data["list_combine"] = list_combine ($info["item_id"]);
		
		/*$data["list_code_pic"] = list_code_pic ($info["item_id"], $info["list_code_pic"]);
		if(!empty($data["list_code_pic"])) {
			$row = array();
			$row['title'] = $ttH->lang['product']['code_pic'];
			$row['content'] = $data["list_code_pic"];
			$ttH->temp_act->assign('row', $row);
			$ttH->temp_act->parse("detail.info_row");
		}*/
		
		$data["link_cart"] = $ttH->site_func->get_link_popup ('product','cart');
		$data["list_quantity"] = list_quantity ('quantity', 1, ' class="quantity"');
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("detail.btn_add_cart");
		
		/*$arr_order_method = $ttH->load_data->data_table ('order_method', 'method_id', 'method_id,name_action,title', "is_show=1 and lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		$data['order_method'] = '';
		foreach($arr_order_method as $k => $v) {
			$data['order_method'] .= '<li>'.$v['title'].'</li>';
		}
		if($data['order_method']) {
			$data['order_method'] = '<ul class="list_none order_method-list">'.$data['order_method'].'</ul>';
			$ttH->temp_act->assign('order_method', $data['order_method']);
			$ttH->temp_act->parse("detail.order_method");
		}*/
		
		$arr_content = array('content','content1','content2','content3','content4','content5');
		$has_content = 0;
		$index = 10;
		foreach($arr_content as $k) {
			if($data[$k]) {
				$index--;
				$has_content = 1;
				$ttH->temp_act->assign('tab', array('key'=>$k, 'index' => $index, 'title'=>$ttH->lang['product'][$k]));
				$ttH->temp_act->parse("detail.tab.title");
				
				$ttH->temp_act->assign('tab', array('key'=>$k, 'content'=>$data[$k]));
				$ttH->temp_act->parse("detail.tab.content");
			}
		}
		
		if($has_content == 1) {
			$ttH->temp_act->parse("detail.tab");
		}
		
		
		$data['navigation'] = $ttH->navigation;
		$data['date_update'] = date('d-m-Y',$data['date_update']);
				
		//$data['other'] = list_other (" and a.item_id!='".$data['item_id']."'");
		//$data['other'] = $this->do_other ($data);
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("detail");
		return $ttH->temp_act->text("detail");
		
		$nd = array(
			'title' => $data['title'],
			'content' => $ttH->temp_act->text("detail")
		);
		
		return $ttH->html->temp_box ("box_main", $nd);
	}
	
	function pic_slide ($info = array())
	{
		global $ttH;	
		
		$output = '';
		$pic_w = 375;
		$pic_h = 375;
		$thum_w = 70;
		$thum_h = 70;
		$is_show = 0;
		
		$info["link_action"] = $ttH->site->get_link ('product','',$info['friendly_link']);
		if(!empty($info["picture"])) {
			$is_show = 1;
			$info['pic_w'] = $pic_w;
			$info['pic_h'] = $pic_h;
			$info['thum_w'] = $thum_w;
			$info['thum_h'] = $thum_h;
			
			$info['src_zoom'] = $ttH->func->get_src_mod($info["picture"], 1000, 800, 1, 0, array('zoom_max'=>1));
			$info['src'] = $ttH->func->get_src_mod($info["picture"], $pic_w, $pic_h, 1, 0, array('zoom_max'=>1));
			$info['src_thumb'] = $ttH->func->get_src_mod($info["picture"], $thum_w, $thum_h, 1, 0, array('zoom_max'=>1));
				
			$ttH->temp_act->assign('row', $info);
			$ttH->temp_act->parse("img_detail.pic");
			$ttH->temp_act->parse("img_detail.pic_thumb");
		}
		
		$sql = "select pic_id,picture,title 
						from product_pic 
						where is_show=1 
						and lang='".$ttH->conf['lang_cur']."' 
						and picture!='' 
						and type='item' 
						and type_id='".$info["item_id"]."' 
						order by show_order desc, date_create asc";
		//echo $sql;
		$result = $ttH->db->query($sql);
		$list_pic = '';
		if ($num = $ttH->db->num_rows($result)) {
			$is_show = 1;
			$i = 0;
			while ($row = $ttH->db->fetch_row($result)) {
				$i++;
				
				$row['pic_w'] = $pic_w;
				$row['pic_h'] = $pic_h;
				$row['thum_w'] = $thum_w;
				$row['thum_h'] = $thum_h;
				
				$row['src_zoom'] = $ttH->func->get_src_mod($row["picture"], 1000, 800, 1, 0, array('zoom_max'=>1));
				$row['src'] = $ttH->func->get_src_mod($row["picture"], $pic_w, $pic_h, 1, 0, array('zoom_max'=>1));
				$row['src_thumb'] = $ttH->func->get_src_mod($row["picture"], $thum_w, $thum_h, 1, 0, array('zoom_max'=>1));
				
				$ttH->temp_act->assign('row', $row);
				$ttH->temp_act->parse("img_detail.pic");
				$ttH->temp_act->parse("img_detail.pic_thumb");
			}
		}
		
		$info['link_share'] = $ttH->site->get_link ('product','',$info['friendly_link']);
		
		if($is_show == 1) {
			$ttH->temp_act->assign('info', $info);
			$ttH->temp_act->parse("img_detail");
			$output = $ttH->temp_act->text("img_detail");
		}
		return $output;
	}
	
	function pic_grid ($info = array())
	{
		global $ttH;	
		
		$data = $info;
		$pic_w = 298;
		$pic_h = 250;
		$thum_w = 87;
		$thum_h = 66;
		$data['pic_show'] = (isset($data['pic_show'])) ? $data['pic_show'] : 'slide';
		
		$data["link_action"] = $ttH->site->get_link ('product','',$info_lang['friendly_link']);
		$data["pic_view"] = '';
		if(!empty($info["picture"])) {
			$data["pic_view"] = $ttH->func->get_pic_mod($info["picture"], $pic_w, $pic_h, ' alt="'.$data["title"].'"', 1, 0, array('fix_max'=>1));
		}
		
		$sql = "select pic_id,picture,title,content   
						from product_pic 
						where is_show=1 
						and lang='".$ttH->conf['lang_cur']."' 
						and picture!='' 
						and type='".$type."' 
						and type_id='".$type_id."' 
						order by show_order desc, date_create asc";
		//echo $sql;
		$result = $ttH->db->query($sql);
		$list_pic = '';
		if ($num = $ttH->db->num_rows($result)) {
			$i = 0;
			while ($row = $ttH->db->fetch_row($result)) {
				$i++;
				
				$row['pic_w'] = $pic_w;
				$row['pic_h'] = $pic_h;
				$row['thum_w'] = $thum_w;
				$row['thum_h'] = $thum_h;
				
				if(empty($info["picture"]) && $i == 1) {
					$data["pic_view"] = $ttH->func->get_pic_mod($row["picture"], $pic_w, $pic_h, ' alt="'.$row["title"].'"', 1, 0, array('fix_max'=>1));
				}
				$row['src'] = $ttH->func->get_src_mod($row["picture"], $pic_w, $pic_h, 1, 0, array('fix_max'=>1));
				$row['src_thumb'] = $ttH->func->get_src_mod($row["picture"], $thum_w, $thum_h, 1, 0, array('fix_min'=>1));
				
				if($data['pic_show'] == 'slide') {
					$ttH->temp_act->assign('row', $row);
					$ttH->temp_act->parse("detail.img_detail.list_pic");
				} else {
					$row['content'] = $ttH->func->txt_html($row['content']);
					$row['class'] = ($i%2 == 0) ? 'first' : '';
					$ttH->temp_act->assign('row', $row);
					$ttH->temp_act->parse("detail.img_list.row_item.col_item");
					
					if($i%2 == 0 || $i == $num){
						$ttH->temp_act->assign('row', array('hr' => ($i < $num) ? '<div class="hr"></div>' : ''));
						$ttH->temp_act->parse("detail.img_list.row_item");
					}
				}
			}
		}
		
		if(!empty($data["pic_view"])) {
			if($data['pic_show'] == 'slide') {
				$data['class_detail'] = ($num > 6) ? ' class="full"' : '';
				$ttH->temp_act->assign('row', $data);
				$ttH->temp_act->parse("detail.img_detail");
			} else {
				$ttH->temp_act->assign('row', $data);
				$ttH->temp_act->parse("detail.img_list");
			}
		}
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("detail");
		return $ttH->temp_act->text("detail");
	}
	
	function do_other ($info)
	{
		global $ttH;	
		
		$arr_in = array(
			'link_action' => $ttH->site->get_link ('product'),
			'where' => " and a.item_id!='".$info['item_id']."' ",
			'temp' => 'list_item',
			'num_list' => $ttH->setting['product']["num_order_detail"],
			'paginate' => 0,
		);
		
		if($info['group_id'] > 0) {
			$arr_in['where'] .= "and ( 
										find_in_set('".$info['group_id']."',group_nav)>0 
										or find_in_set('".$info['group_id']."',group_related)>0 
									)";
		}
		
		return html_list_item($arr_in);
	}
	
  // end class
}
?>