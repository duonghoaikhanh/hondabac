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
	var $modules = "user";
	var $action = "signup";
	var $sub = "manage";
	var $sign_go = "";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		
		$this->sign_go = (isset($ttH->get['url'])) ? $ttH->func->base64_decode($ttH->get['url']) : $ttH->site->get_link ('user');
		if($ttH->site_func->check_user_login() == 1) {
			$ttH->html->redirect_rel($this->sign_go);
		}
		
		$ttH->func->load_language($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS.$this->modules.".tpl");
		$ttH->temp_act->assign('CONF', $ttH->conf);
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		$ttH->func->include_css ($ttH->dir_css.$this->modules.'/'.$this->modules.'.css');
		
		$ttH->conf['menu_action'] = array($this->modules);
		$ttH->data['link_lang'] = (isset($ttH->data['link_lang'])) ? $ttH->data['link_lang'] : array();
		
		include ($this->modules."_func.php");
		
		$data = array();
		//Make link lang
		foreach($ttH->data['lang'] as $row_lang) {
			$ttH->data['link_lang'][$row_lang['name']] = $ttH->site->get_link_lang ($row_lang['name'], $this->modules);
		}
		//End Make link lang
		
		//SEO
		$ttH->site->get_seo (array(
			'meta_title' => (isset($ttH->setting[$this->modules][$this->action."_meta_title"])) ? $ttH->setting[$this->modules][$this->action."_meta_title"] : '',
			'meta_key' => (isset($ttH->setting[$this->modules][$this->action."_meta_key"])) ? $ttH->setting[$this->modules][$this->action."_meta_key"] : '',
			'meta_desc' => (isset($ttH->setting[$this->modules][$this->action."_meta_desc"])) ? $ttH->setting[$this->modules][$this->action."_meta_desc"] : ''
		));
		$ttH->conf["cur_group"] = 0;
		
		$data = array();
		
		$ttH->output .=  $this->do_main();
		/*$data['content'] = $this->do_main();
		$data['box_left'] = box_left($this->action);
		//$data['box_column'] = box_column();
	
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("main");
		$ttH->output .=  $ttH->temp_act->text("main");*/
	}
	
	function do_main ()
	{
		global $ttH;	
		
		$link_action = $ttH->site->get_link ($this->modules, $ttH->setting[$this->modules]["change_pass_link"]);
		$err = '';
		
		$data = array();
		$data['err'] = $err;
		$data['link_action'] = $link_action;
		$data["list_location_province"] = $ttH->site_func->list_location_province ("province", 'vi', ''," class=\"form-control select_location_province\" data-district='district' data-ward='ward' id='province'", array('title' => $ttH->lang['global']['province']));
		$data["list_location_district"] = $ttH->site_func->list_location_district ("district", '', ''," class=\"form-control select_location_district\" data-ward='ward' id='district'", array('title' => $ttH->lang['global']['district']));
		$data["list_location_ward"] = $ttH->site_func->list_location_ward ("ward", '', ''," class=\"form-control\" id='ward'", array('title' => $ttH->lang['global']['ward']));
		$data['form_signup'] = $ttH->html->temp_box(
			'form_signup_user', 
			array(
				'link_root' => $ttH->conf['rooturl'],
				'link_login_go' => $this->sign_go, 
				'list_location_province' => $data["list_location_province"], 
				'list_location_district' => $data["list_location_district"], 
				'list_location_ward' => $data["list_location_ward"]
			)
		);
		
		$sql = "select * 
						from order_method  
						where is_show=1 
						and lang='".$ttH->conf['lang_cur']."' 
						order by show_order desc, date_update desc";
		//echo $sql;
		$result = $ttH->db->query($sql);
		if ($num = $ttH->db->num_rows($result)) {
			$i = 0;
			while ($row = $ttH->db->fetch_row($result)) {
				$i++;
				if($row['picture']) {
					$row['picture'] = $ttH->func->get_src_mod($row['picture'],202,52,1,0,array('fix_width'=>1));
					$ttH->temp_act->assign('row', $row);
					$ttH->temp_act->parse("signup.method.img");
				} else {
					$ttH->temp_act->assign('row', $row);
					$ttH->temp_act->parse("signup.method.title");
				}
				$row['class'] = ($i == 1) ? 'first' : '';
				
				$row['short'] = $ttH->func->input_editor_decode($row['short']);
				$row['content'] = $ttH->func->input_editor_decode($row['content']);
				
				$ttH->temp_act->assign('row', $row);
				$ttH->temp_act->parse("signup.method");
			}
		}
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("signup");
		return $ttH->temp_act->text("signup");
	}
	
  // end class
}
?>