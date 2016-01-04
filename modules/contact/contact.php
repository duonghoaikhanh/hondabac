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
	var $modules = "contact";
	var $action = "contact";
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
		$data['content'] = $this->do_Contact();
		$data['box_left'] = box_left();
		$data['box_column'] = box_column();
	
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("main");
		$ttH->output .=  $ttH->temp_act->text("main");
	}
	
	// do_Contact
  function do_Contact ()
  {
    global $ttH;
		
		$ttH->func->include_js ('http://maps.google.com/maps/api/js?sensor=false');
		$ttH->func->include_js ($ttH->dir_js.'gomap/js/jquery.gomap-1.3.1.min.js');
		$ttH->func->include_js ($ttH->dir_js.'gomap/js/jquery.dump.js');
		$ttH->func->include_js ($ttH->dir_js.'gomap/js/jquery.chili-2.2.js');
		$ttH->func->include_js ($ttH->dir_js.'gomap/js/recipes.js');
		
		$ttH->func->include_js($ttH->dir_js.'jquery_plugins/jquery.validate.js');
		
 		$data = array();
    $err = "";
		
		$contact_info ='';
    $result = $ttH->db->query("select *  
																from contact_map   
																where is_show=1 
																and lang='".$ttH->conf["lang_cur"]."' 
																order by show_order desc, date_create asc");
    if ($num = $ttH->db->num_rows($result)) 
		{
     	$i=0;
			$list_markers = '';
			$list_pic = '';
			while($row = $ttH->db->fetch_row($result))
			{
				$i++;		
				
				$link_map = '';
				
				switch ($row['map_type'])
				{
					case 'google_map' : 
						$row['map_information'] = str_replace(array("\r\n","\n"),'',$ttH->func->input_editor_decode($row['map_information']));
						$list_markers .= (!empty($list_markers)) ? ',' : '';
						$list_markers .= '{ 
							latitude: "'.$row['map_latitude'].'",
							longitude: "'.$row['map_longitude'].'",
							id: "map_id_'.$row['map_id'].'", 
							html: {
								content: "'.$row['map_information'].'",
								popup: true
							}
						}';		
						$link_map = "<a href=\"javascript:void(0)\" onclick=\"$.goMap.fitBounds('markers',['map_id_".$row['map_id']."'])\">".$ttH->lang["contact"]["view_map"]."</a>";				
						break ;	
					case 'image' : 
						$list_pic .= '<img id="map_id_'.$row['map_id'].'" src="'.$ttH->conf['rooturl'].'contact/'.$row['map_picture'].'" alt="map_picture" />';		
						break ;	
				} 
				
				$row['content'] = $ttH->func->input_editor_decode($row['content']);
				$row['content'] = str_replace('{link_map}',$link_map,$row['content']);
				$contact_info .= '<div class="contact_info">'.$row['content'].'</div>';						
				
				$i++;
			}
			
			if(!empty($list_markers)) {
				$data['contact_map'] = '<script language="javascript">
					$(function() {
						$("#map_view").goMap({
							markers: ['.$list_markers.'],
							icon: "'.$ttH->dir_images.'icon_markers.png",
							maptype: "ROADMAP",
							zoom: 15
						});
					});
				</script>';
			}
    }	
		 
		$data["err"] = $err;
    $data['link_action'] = $ttH->site->get_link ($this->modules);
		
		$data['title'] = isset($ttH->input['title']) ? $ttH->input['title'] : '';
    $data['contact_info'] = $contact_info; 
		
    $ttH->temp_act->assign("data", $data);
    $ttH->temp_act->assign("setting", $ttH->setting['contact']);
    $ttH->temp_act->parse("html_contact");
		
		$ttH->temp_box->assign('data', array(
			'title' => $ttH->conf['meta_title'],
			'content' => $ttH->temp_act->text("html_contact")
		));
		$ttH->temp_box->parse("box_main");
    return $ttH->temp_box->text("box_main");
  }
	
  // end class
}
?>