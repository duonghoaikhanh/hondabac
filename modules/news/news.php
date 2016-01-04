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
	var $modules = "news";
	var $action = "news";
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
										from news_group 
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
											from news_group 
											where group_id='".$ttH->conf['cur_group']."' ");
				while($row_lang = $ttH->db->fetch_row($result)){
					$ttH->data['link_lang'][$row_lang['lang']] = $ttH->site->get_link_lang ($row_lang['lang'], $this->modules, $row_lang['friendly_link']);
				}
				//End Make link lang
				//SEO
				$ttH->site->get_seo ($ttH->data['cur_group']);
				
				$ttH->conf["cur_group_nav"] = $row["group_nav"];			
				$ttH->navigation = get_navigation ();	
				$data = array(
					"content" => $this->do_list_group($row, $ttH->data['cur_group']),
					"box_column" => box_column ()
				);
			}else{
				$ttH->html->redirect_rel($ttH->site->get_link ($this->modules));
			}
		}elseif(isset($ttH->conf['cur_item'])){
			$result = $ttH->db->query("select * 
										from news 
										where item_id='".$ttH->conf['cur_item']."' 
										and is_show=1 
										limit 0,1");
			if($row = $ttH->db->fetch_row($result)){
				//Make link lang
				$result = $ttH->db->query("select friendly_link,lang   
											from news 
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
				
				$ttH->navigation = get_navigation ();
				
				$data = array(
					"content" => $this->do_detail($row, $ttH->data['cur_item']),
					"box_column" => box_column ()
				);
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
				'meta_title' => (isset($ttH->setting['news']["news_meta_title"])) ? $ttH->setting['news']["news_meta_title"] : '',
				'meta_key' => (isset($ttH->setting['news']["news_meta_key"])) ? $ttH->setting['news']["news_meta_key"] : '',
				'meta_desc' => (isset($ttH->setting['news']["news_meta_desc"])) ? $ttH->setting['news']["news_meta_desc"] : ''
			));
			$ttH->conf["cur_group"] = 0;
			
			$ttH->navigation = get_navigation ();
			
			$data = array(
				"content" => $this->do_list(),
				"box_column" => box_column ()
			);
		}
	
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("main");
		$ttH->output .=  $ttH->temp_act->text("main");
	}
	
	function do_focus ()
	{
		global $ttH;	
		
		$sql = "select item_id,picture,title,content,friendly_link,date_update  
						from news 
						where is_show=1 
						and lang='".$ttH->conf["lang_cur"]."' 
						and is_focus=1 
						order by show_order desc, date_update desc
						limit 0,1";
		//echo $sql;
		
		$result = $ttH->db->query($sql);
		$html_row = '';
		if ($num = $ttH->db->num_rows($result))
		{
			$j = 0;
			while ($row = $ttH->db->fetch_row($result)) 
			{
				$j++;
				$row['link'] = $ttH->site->get_link ('news','',$row['friendly_link']);
				$row["picture"] = $ttH->func->get_src_mod($row["picture"], 347, 237, 1, array('fix_min' => 1));
				$row['short'] = $ttH->func->short($row['content'], 1200);
				$row['date_update'] = date('d/m/Y',$row['date_update']);
				
				$ttH->temp_act->assign('row', $row);
				$ttH->temp_act->parse("focus");
				return $ttH->temp_act->text("focus");
			}
		}
	}
	
	function do_list_old ()
	{
		global $ttH;	
		
		$data = array(
			'content' => ''
		);
		
		$sql_group = "select group_id,picture,title,friendly_link  
						from news_group 
						where is_show=1 
						and lang='".$ttH->conf["lang_cur"]."' 
						order by show_order desc, date_update desc";
		//echo $sql;
		
		$result_group = $ttH->db->query($sql_group);
		$html_row = '';
		if ($num_group = $ttH->db->num_rows($result_group))
		{
			$i = 0;
			while ($row_group = $ttH->db->fetch_row($result_group)) 
			{
				$i++;
				
				$row_group['link'] = $ttH->site->get_link ('news',$row_group['friendly_link']);
				$row_group['class'] = ($i == $num_group) ? ' last' : '';
				$row_group['hr'] = ($i < $num_group) ? '<div class="hr"></div>' : '';
				
				$sql = "select item_id,picture,title,content,friendly_link,date_update  
						from news 
						where is_show=1 
						and lang='".$ttH->conf["lang_cur"]."' 
						and group_id='".$row_group['group_id']."' 
						order by show_order desc, date_update desc
						limit 0,4";
				//echo $sql;
				
				$result = $ttH->db->query($sql);
				$html_row = '';
				if ($num = $ttH->db->num_rows($result))
				{
					$j = 0;
					$ttH->temp_act->reset("list_group.row_item");
					$ttH->temp_act->reset("list_group.row_item.other");
					$ttH->temp_act->reset("list_group.row_item.other.li");
					while ($row = $ttH->db->fetch_row($result)) 
					{
						$j++;
						$row['link'] = $ttH->site->get_link ('news','',$row['friendly_link']);
						$row['date_update'] = date('d/m/Y',$row['date_update']);
						
						if($j == 1) {
							$row["picture"] = $ttH->func->get_src_mod('news/'.$row["picture"], 177, 118, 1, 0, array('fix_min' => 1));
							$row['short'] = $ttH->func->short($row['content'], 400);
							$ttH->temp_act->assign('row', $row);
						} else {
							$ttH->temp_act->assign('other', $row);
							$ttH->temp_act->parse("list_group.row_item.other.li");
						}
					}
					if($num > 1) {
						$ttH->temp_act->parse("list_group.row_item.other");
					}
					
					$ttH->temp_act->assign('row_group', $row_group);
					$ttH->temp_act->parse("list_group.row_item");
					$data['content'] .= $ttH->temp_act->text("list_group.row_item");
					$ttH->temp_act->reset("list_group.row_item");
				} else {
					$row_group['mess'] = $ttH->lang['news']['no_have_item'];
					$ttH->temp_act->assign('row_group', $row_group);
					$ttH->temp_act->parse("list_group.row_empty");
					$data['content'] .= $ttH->temp_act->text("list_group.row_empty");
					$ttH->temp_act->reset("list_group.row_empty");				
				}
			} 
			
			$ttH->temp_act->assign('data', $data);
			$ttH->temp_act->parse("list_group");
			return $ttH->temp_act->text("list_group");
		}
	}
	
	function do_list ()
	{
		global $ttH;	
		
		$arr_in = array(
			'link_action' => $ttH->site->get_link ('news'),
			'where' => " ",
			'temp' => 'list_item',
		);
		
		$data = array(
			'content' => html_list_item($arr_in),
			'title' => $ttH->conf['meta_title']
		);
		
		$ttH->temp_box->assign('data', $data);
		$ttH->temp_box->parse("box_main");
		return $ttH->temp_box->text("box_main");
	}
	
	function do_list_group ($info = array(), $info_lang = array())
	{
		global $ttH;	
		
		$arr_in = array(
			'link_action' => $ttH->site->get_link ('news',$info_lang['friendly_link']),
			'where' => " and find_in_set('".$info['group_id']."',group_nav)>0",
			'temp' => 'list_item',
		);
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
		
		$output = '';
		
		$data = array_merge($info,$info_lang);
		
		$data["link_action"] = $ttH->site->get_link ('news','',$info_lang['friendly_link']);
		$data["picture"] = $ttH->func->get_src_mod($info["picture"], 300, 300, 1, 0, array('fix_widtn'=>1));
		
		$ttH->temp_box->assign('data', array('link_share' => $ttH->data['link_lang'][$ttH->conf['lang_cur']]));
		$ttH->temp_box->parse("html_list_share");
		$data['content'] .= $ttH->temp_box->text("html_list_share");
		$data['content'] .= list_other (" and a.item_id!='".$data['item_id']."'");
		
		$ttH->temp_act->assign('data', array(
			'title' => urlencode($data['title']),
			'link' => $ttH->data['link_lang'][$ttH->conf['lang_cur']]
		));
		$ttH->temp_act->parse("html_title_more");
		$data['more_title'] = $ttH->temp_act->text("html_title_more");
		$ttH->temp_box->assign('data', $data);
		$ttH->temp_box->parse("box_main");
		$output = $ttH->navigation.$ttH->temp_box->text("box_main");
		
		return $output;
	}
	
  // end class
}
?>