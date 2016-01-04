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
	var $modules = "service";
	var $action = "service";
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
		if(isset($ttH->conf['cur_group']) || isset($ttH->conf['cur_item'])){
			
			if(isset($ttH->conf['cur_item'])){
				$where = " and item_id='".$ttH->conf['cur_item']."' ";
			} else {
				$where = " and group_id='".$ttH->conf['cur_group']."' order by show_order desc, date_create desc";
			}
			
			$result = $ttH->db->query("select * 
										from service 
										where is_show=1 
										".$where." 
										limit 0,1");
			if($row = $ttH->db->fetch_row($result)){
				$ttH->conf['cur_group'] = $row['group_id'];
				$ttH->conf['cur_item'] = $row['item_id'];
				$ttH->data['cur_item'] = $row;
				//Make link lang
				$result = $ttH->db->query("select friendly_link,lang 
											from service_lang 
											where item_id='".$ttH->conf['cur_item']."' ");
				while($row_lang = $ttH->db->fetch_row($result)){
					$ttH->data['link_lang'][$row_lang['lang']] = $ttH->site->get_link_lang ($row_lang['lang'], $this->modules, '', $row_lang['friendly_link']);
				}
				//End Make link lang
				//SEO
				$ttH->site->get_seo ($ttH->data['cur_item']);
				
				$ttH->conf['menu_action'][] = $this->modules.'-group-'.$ttH->conf['cur_group'];
				$ttH->conf['menu_action'][] = $this->modules.'-item-'.$ttH->conf['cur_item'];
				
				$ttH->navigation = $ttH->site->html_arr_navigation (array(
					array(
						'title' => $ttH->lang['global']['homepage'],
						'link' => $ttH->site->get_link ('home')
					),
					/*array(
						'title' => $ttH->data['service_group'][$ttH->conf['cur_group']]['title'],
						'link' => $ttH->site->get_link ('service',$ttH->data['service_group'][$ttH->conf['cur_group']]['friendly_link'])
					),*/
					array(
						'title' => $ttH->data['cur_item']['title'],
						'link' => $ttH->data['link_lang'][$ttH->conf['lang_cur']]
					)
				));
				
				//$data = $ttH->data['cur_item'];
	
				/*$ttH->temp_act->assign('data', array(
					'title' => urlencode($data['title']),
					'link' => $ttH->data['link_lang'][$ttH->conf['lang_cur']]
				));
				$ttH->temp_act->parse("html_title_more");
				$data['more_title'] = $ttH->temp_act->text("html_title_more");
				$ttH->temp_box->assign('data', $data);
				$ttH->temp_box->parse("box_main");
				$data = array(
					"content" => $ttH->temp_box->text("box_main"),
					"box_right" => box_right ()
				);*/
				
				$data = array();
				$data['main_search'] = $ttH->site->main_search ($ttH->data['cur_item']['title']);
				$data['content'] = $ttH->data['cur_item']['content'];
				$data['box_left'] = box_left();
				$data['box_column'] = box_column();
				
				$ttH->temp_box->assign('data', array('link_share' => $ttH->data['link_lang'][$ttH->conf['lang_cur']]));
				$ttH->temp_box->parse("html_list_share");
				$data['content'] .= $ttH->temp_box->text("html_list_share");
			}else{
				$ttH->html->redirect_rel($ttH->site->get_link ('home'));
			}
		}else{
			$ttH->html->redirect_rel($ttH->site->get_link ('home'));
		}
	
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("main");
		$ttH->output .=  $ttH->temp_act->text("main");
	}
	
  // end class
}
?>