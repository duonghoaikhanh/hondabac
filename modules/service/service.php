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
		if(isset($ttH->conf['cur_group'])){
			$result = $ttH->db->query("select group_id, group_nav, type_show, num_show, is_show   
										from service_group 
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
				$ttH->conf["cur_group_nav"] = $row["group_nav"];	
				
				//Make link lang
				$result = $ttH->db->query("select friendly_link,lang   
											from service_group 
											where group_id='".$ttH->conf['cur_group']."' ");
				while($row_lang = $ttH->db->fetch_row($result)){
					$ttH->data['link_lang'][$row_lang['lang']] = $ttH->site->get_link_lang ($row_lang['lang'], $this->modules, $row_lang['friendly_link']);
				}
				//End Make link lang
				//SEO
				$ttH->site->get_seo ($ttH->data['cur_group']);
				
				$ttH->navigation = $ttH->site->html_arr_navigation (array(
					array(
						'title' => $ttH->lang['global']['homepage'],
						'link' => $ttH->site->get_link ('home')
					),
					array(
						'title' => $ttH->data['service_group'][$ttH->conf['cur_group']]['title'],
						'link' => $ttH->site->get_link ('service',$ttH->data['service_group'][$ttH->conf['cur_group']]['friendly_link'])
					)
				));
				
				$data = array();
				$data['content'] = $this->do_list_group($row, $ttH->data['cur_group']);
			}else{
				$ttH->html->redirect_rel($ttH->site->get_link ($this->modules));
			}
		}elseif(isset($ttH->conf['cur_item'])){
			
			$where = " and p.item_id='".$ttH->conf['cur_item']."' ";
			
			$result = $ttH->db->query("select * 
										from service 
										where is_show=1 
										".$where." 
										limit 0,1");
			if($row = $ttH->db->fetch_row($result)){
				$row['content'] = $ttH->func->input_editor_decode($row['content']);
				$ttH->conf['cur_group'] = $row['group_id'];
				$ttH->conf["cur_group_nav"] = $row["group_nav"];			
				$ttH->conf['cur_item'] = $row['item_id'];
				$ttH->data['cur_item'] = $row;
				//Make link lang
				$result = $ttH->db->query("select friendly_link,lang 
											from service 
											where item_id='".$ttH->conf['cur_item']."' ");
				while($row_lang = $ttH->db->fetch_row($result)){
					$ttH->data['link_lang'][$row_lang['lang']] = $ttH->site->get_link_lang ($row_lang['lang'], $this->modules, '', $row_lang['friendly_link']);
				}
				//End Make link lang
				//SEO
				$ttH->site->get_seo ($ttH->data['cur_item']);
				
				$ttH->conf['menu_action'][] = $this->modules.'-group-'.$ttH->conf['cur_group'];
				$ttH->conf['menu_action'][] = $this->modules.'-item-'.$ttH->conf['cur_item'];
				
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
				$data['content'] = $this->do_detail ($ttH->data['cur_item']);
			}else{
				$ttH->html->redirect_rel($ttH->site->get_link ('home'));
			}
		}else{
			$ttH->html->redirect_rel($ttH->site->get_link ('home'));
		}
		
		$data['box_left'] = box_left();
		$data['box_column'] = box_column();
	
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("main");
		$ttH->output .=  $ttH->temp_act->text("main");
	}
	
	function do_list_group ($info = array(), $info_lang = array())
	{
		global $ttH;	
		
		$data = array(
			'title' => $info_lang['title']
		);
		
		$arr_in = array(
			'link_action' => $ttH->site->get_link ('service',$info_lang['friendly_link']),
			'where' => " and find_in_set('".$info['group_id']."',group_nav)>0",
			'temp' => 'list_item',
		);
		
		switch ($info['type_show']) {
			case "list_item":
				$arr_in['temp'] = "list_item";
				$data['content'] = html_list_item($arr_in);
				break;
			case "grid_item":
				$arr_in['temp'] = "grid_item";
				$arr_in['pic_w'] = 200;
				$arr_in['pic_h'] = 200;
				$arr_in['num_row'] = 4;
				if($info['num_show'] > 0) {
					$arr_in['num_show'] = $info['num_show'];
				}
				$arr_in['short_len'] = 200;
				$data['content'] = html_list_item($arr_in);
				break;
			case "go_item":
				//Go to detail
				$result = $ttH->db->query("select friendly_link 
											from service 
											where is_show=1 
											and lang='".$ttH->conf['lang_cur']."' 
											and find_in_set('".$ttH->conf['cur_group']."',group_nav) 
											order by show_order desc, date_create desc
											limit 0,1");
				if($row = $ttH->db->fetch_row($result)){
					$ttH->html->redirect_rel($ttH->site->get_link ($this->modules, '', $row['friendly_link']));
				}
				//End
				break;
			case "content_only":
				$data['content'] = $info_lang['content'];
				break;
			default:
				$arr_in['where'] .= " and a.group_id!='".$info['group_id']."'";
				$data['content'] = html_list_group($arr_in);
				
				if($data['content']) {
				} else {
					$arr_in['where'] = " and find_in_set('".$info['group_id']."',group_nav)>0";
					$arr_in['temp'] = "list_item";
					$data['content'] = html_list_item($arr_in);
				}
				
				break;
		}
		
		$ttH->temp_box->assign('data', $data);
		$ttH->temp_box->parse("box_main");
		return $ttH->temp_box->text("box_main");
	}
	
	function do_detail ($info = array())
	{
		global $ttH;	
		
		$info['link_share'] = $ttH->data['link_lang'][$ttH->conf['lang_cur']];
		$info['date_update'] = date('d-m-Y',$info['date_update']);
		//$info['list_other'] = list_other (" and a.item_id!='".$info['item_id']."'");
		
		$ttH->temp_act->assign('data', $info);
		$ttH->temp_act->parse("item_detail");
		//return $ttH->temp_act->text("item_detail");
		$data = array(
			'content' => $ttH->temp_act->text("item_detail"),
			'title' => $info['title']
		);
		
		$ttH->temp_box->assign('data', $data);
		$ttH->temp_box->parse("box_main");
		return $ttH->temp_box->text("box_main");
	}
	
  // end class
}
?>