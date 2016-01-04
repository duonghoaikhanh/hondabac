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
	var $modules = "home";
	var $action = "home";
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
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		$ttH->func->include_css ($ttH->dir_css.$this->modules.'/'.$this->action.".css");
		
		$ttH->conf['menu_action'] = $this->modules;
		
		include ($this->modules."_func.php");
		
		//Make link lang
		foreach($ttH->data['lang'] as $row_lang) {
			$ttH->data['link_lang'][$row_lang['name']] = $ttH->site->get_link_lang ($row_lang['name'], $this->modules);
		}
		//End Make link lang
		
		//SEO
		$ttH->site->get_seo (array(
			'meta_title' => (isset($ttH->setting[$this->modules][$this->modules."_meta_title"])) ? $ttH->setting[$this->modules][$this->modules."_meta_title"] : '',
			'meta_key' => (isset($ttH->setting[$this->modules][$this->modules."_meta_key"])) ? $ttH->setting[$this->modules][$this->modules."_meta_key"] : '',
			'meta_desc' => (isset($ttH->setting[$this->modules][$this->modules."_meta_desc"])) ? $ttH->setting[$this->modules][$this->modules."_meta_desc"] : ''
		));

		$data = array();
		$data['main_slide'] = $ttH->site->get_banner_slide ('banner-main');
		//$data['content'] = 'Nội dung trang chủ';
		$data['content'] = $this->do_list ();
		$data['content_focus'] = $this->do_list ('focus');
		// Why use .= in method error

		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("main");
		$ttH->output .=  $ttH->temp_act->text("main");
	}
	
	//=================get_banner_slide===============
	function get_banner_slide (){
		global $ttH;
		
		$output = '';
		
		$pic_w = 500;
		$pic_h = 500;
		
		$sql = "select item_id,picture,title,content,friendly_link  
						from page 
						where is_show=1 
						and lang='".$ttH->conf["lang_cur"]."' 
						and is_focus2=1 
						order by show_order desc, date_update desc 
						limit 0,10";
		//echo $sql;
		
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
				$row['link'] = $ttH->site->get_link ('product','',$row['friendly_link']);
				$row["picture"] = $ttH->func->get_src_mod($row["picture"], $pic_w, $pic_h, 1, 1);
				
				$row["short"] = $ttH->func->short($row["content"], 200);
				
				$ttH->temp_act->assign('row', $row);
				$ttH->temp_act->parse("main_slide.row");
			}
			$ttH->func->include_css($ttH->dir_skin.'js/jquery.bxslider/jquery.bxslider.css');
			$ttH->func->include_js($ttH->dir_skin.'js/jquery.bxslider/jquery.bxslider.min.js');			
			$ttH->temp_act->parse("main_slide");
			$output = $ttH->temp_act->text("main_slide");
		}
		
		return $output; 
	}
	
	function do_list ($type = 'new')
	{
		global $ttH;	
		
		$arr_in = array(
			'link_action' => $ttH->site->get_link ('product'),
			'where' => '',
			'temp' => 'list_item',
			'num_row' => 3,
			'pic_w' => 300,
			'pic_h' => 300,
			'paginate' => 0
		);
		//return html_list_item($arr_in);
		$data = array(
			'title' => $ttH->lang['home']['product_'.$type]
		);
		
		if($type == 'focus') {
			$arr_in['where'] = " and is_focus=1";
		}
		$data['content'] = html_list_item($arr_in);
		
		return $ttH->html->temp_box('box_main', $data);
	}
	
	function do_list_group ()
	{
		global $ttH;	
		
		$arr_in = array(
			'link_action' => $ttH->site->get_link ('product'),
			'where' => ' and is_focus=1 ',
			'temp' => 'list_item',
			'paginate' => 0
		);
		return html_list_group($arr_in);
		/*$data = array(
			'content' => html_list_item($arr_in),
			'title' => $ttH->lang['product']['product']
		);
		
		$ttH->temp_box->assign('data', $data);
		$ttH->temp_box->parse("box_main");
		return $ttH->temp_box->text("box_main");*/
	}
	
  // end class
}
?>