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
	var $action = "product";
	var $sub = "manage";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		
		$ttH->func->load_language($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS.$this->action.".tpl");
		$ttH->temp_act->assign('CONF', $ttH->conf);
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		$ttH->func->include_css ($ttH->dir_css.$this->modules.'/'.$this->action.".css");
		
		$ttH->conf['menu_action'] = array($this->modules);
		$ttH->data['link_lang'] = (isset($ttH->data['link_lang'])) ? $ttH->data['link_lang'] : array();
		
		include ($this->modules."_func.php");
		
		$data = array();
		if(isset($ttH->conf['cur_group'])){
			$result = $ttH->db->query("select group_id, group_nav, is_show   
										from product_group 
										where group_id='".$ttH->conf['cur_group']."' 
										and is_show=1 
										limit 0,1");
			if($row = $ttH->db->fetch_row($result)){
				
				//Current menu
				$arr_group_nav = (!empty($row["group_nav"])) ? explode(',',$row["group_nav"]) : array();
				foreach($arr_group_nav as $v) {
					$ttH->conf['menu_action'][] = $this->modules.'-group-'.$v;
				}
				//End current menu
				
				//Make link lang
				$result = $ttH->db->query("select friendly_link,lang   
											from product_group 
											where group_id='".$ttH->conf['cur_group']."' ");
				while($row_lang = $ttH->db->fetch_row($result)){
					$ttH->data['link_lang'][$row_lang['lang']] = $ttH->site->get_link_lang ($row_lang['lang'], $this->modules, $row_lang['friendly_link']);
				}
				//End Make link lang
				//SEO
				$ttH->site->get_seo ($ttH->data['cur_group']);
				
				$ttH->conf["cur_group_nav"] = $row["group_nav"];				
				$data['content'] = $this->do_list_group($row, $ttH->data['cur_group']);
			}else{
				$ttH->html->redirect_rel($ttH->site->get_link ($this->modules));
			}
		}else{
			//Make link lang
			foreach($ttH->data['lang'] as $row_lang) {
				$ttH->data['link_lang'][$row_lang['name']] = $ttH->site->get_link_lang ($row_lang['name'], $this->modules);
			}
			//End Make link lang
			
			//SEO
			$ttH->site->get_seo (array(
				'meta_title' => (isset($ttH->setting['product']["product_meta_title"])) ? $ttH->setting['product']["product_meta_title"] : '',
				'meta_key' => (isset($ttH->setting['product']["product_meta_key"])) ? $ttH->setting['product']["product_meta_key"] : '',
				'meta_desc' => (isset($ttH->setting['product']["product_meta_desc"])) ? $ttH->setting['product']["product_meta_desc"] : ''
			));
			$ttH->conf["cur_group"] = 0;
			
			$data['content'] = $this->do_list();
			$data['content_focus'] = $this->do_list_focus('focus');
		}
		
		$ttH->navigation = get_navigation ();	
		
		$data['box_left'] = box_left();
		$data['box_column'] = box_column();

		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("main");
		$ttH->output .=  $ttH->temp_act->text("main");
	}
	
	function do_list ()
	{
		global $ttH;	
		$text_search = (isset($ttH->input['text_search'])) ? $ttH->input['text_search'] : '';
		$ext = '&text_search='.$text_search;
		//$text_search = $ttH->func->get_text_search ($str);
		$arr_key = explode(' ',$text_search);
		$where = '';
		$arr_tmp = array();
		foreach($arr_key as $value) {
			$value = trim($value);
			if(!empty($value)) {
				$arr_tmp[] = "title like '%".$value."%'";
				//$arr_tmp[] = "content like '%".$value."%'";
			}	
		}
		if(count($arr_tmp) > 0) {
			//$where .= " and (".implode(" or ",$arr_tmp).")";
			$where .= " and (".implode(" and ",$arr_tmp).")";
		}
		
		$arr_in = array(
			'link_action' => $ttH->site->get_link ('product'),
			'where' => $where,
			'temp' => 'list_item',
		);
		//return html_list_item($arr_in);
		$data = array(
			'content' => html_list_item($arr_in),
			'title' => $ttH->lang['product']['product']
		);

		$ttH->temp_box->assign('data', $data);

		$ttH->temp_box->parse("box_main");

		return $ttH->temp_box->text("box_main");
	}

	/** do_list_focus */
	function do_list_focus ($type = 'focus')
	{
		global $ttH;
		$text_search = (isset($ttH->input['text_search'])) ? $ttH->input['text_search'] : '';
		$ext = '&text_search='.$text_search;
		//$text_search = $ttH->func->get_text_search ($str);
		$arr_key = explode(' ',$text_search);
		$where = '';
		$arr_tmp = array();
		foreach($arr_key as $value) {
			$value = trim($value);
			if(!empty($value)) {
				$arr_tmp[] = "title like '%".$value."%'";
				//$arr_tmp[] = "content like '%".$value."%'";
			}
		}
		if(count($arr_tmp) > 0) {
			//$where .= " and (".implode(" or ",$arr_tmp).")";
			$where .= " and (".implode(" and ",$arr_tmp).")";
		}

		$arr_in = array(
			'link_action' => $ttH->site->get_link ('product'),
			'where' => $where,
			'temp' => 'list_item',
		);

		if (!empty($type) && $type == 'focus') {
			$arr_in['where'] .= " and is_focus=1";
		}
		//return html_list_item($arr_in);
		$data = array(
			'content' => html_list_item($arr_in),
			'title' => $ttH->lang['product']['product_focus']
		);

		$ttH->temp_box->assign('data', $data);
		$ttH->temp_box->parse("box_main_focus");
		return $ttH->temp_box->text("box_main_focus");
	}
	
	function do_list_group ($info = array(), $info_lang = array())
	{
		global $ttH;	
		
		$arr_in = array(
			'link_action' => $ttH->site->get_link ('product',$info_lang['friendly_link']),
			'where' => " and ( 
										find_in_set('".$info['group_id']."',group_nav)>0 
										or find_in_set('".$info['group_id']."',group_related)>0 
									)",
			'temp' => 'list_item',
			'num_row' => 3,
			'pic_w' => 300,
			'pic_h' => 300,
		);
		
		if($info['group_id'] == 15) {
			$arr_in['where'] = " and price>price_buy and price_buy>0 ";
		}
		
		//return html_list_item($arr_in);
		$data = array(
			'content' => html_list_item($arr_in),
			'title' => $info_lang['title']
		);
		
		$ttH->temp_box->assign('data', $data);
		$ttH->temp_box->parse("box_main");
		return $ttH->temp_box->text("box_main");
	}
	
	function do_detail ($info = array(), $info_lang = array())
	{
		global $ttH;	
		
		$data = array_merge($info,$info_lang);
		
		$data["link_action"] = $ttH->site->get_link ('product','',$info_lang['friendly_link']);
		
		$data["picture"] = $ttH->func->get_src_mod('product/'.$info["picture"], 300, 300, 1, 0, array('fix_width'=>1));
		$data["brand_name"] = get_brand_name ($info["brand_id"],'link');
		$data["group_name"] = get_group_name ($info["group_id"],'link');
		$data["price"] = $ttH->func->get_price_format ($info["price"]);
		
		$sql = "select option_id,title  
						from product_option 
						where is_show=1 
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
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("detail.btn_add_cart");
		
		$data['other'] = list_other (" and a.item_id!='".$data['item_id']."'");
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("detail");
		
		$nd = array(
			'title' => $data['title'],
			'content' => $ttH->temp_act->text("detail")
		);
		
		return $ttH->html->temp_box ("box_main", $nd);
	}
	
  // end class
}
?>