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
	var $modules = "common";
	var $action = "ajax";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		
		$ttH->func->load_language_admin($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS.$this->action.".tpl");
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		$fun = (isset($ttH->post['f'])) ? $ttH->post['f'] : '';

		flush();
		switch ($fun) {
			case "list_widget":
				echo $this->do_list_widget();
				exit;
				break;
			default:
				echo '';
				exit;
				break;
		}
		
		exit;
	}
	
	function do_list_widget ()
	{
		global $ttH;
		
		$output = '';
		
		$text_search = (isset($ttH->input['text_search'])) ? $ttH->input['text_search'] : '';
		
		$arr_key = explode(' ',$text_search);
		$where = '';
		$arr_tmp = array();
		foreach($arr_key as $value) {
			$value = trim($value);
			if(!empty($value)) {
				$arr_tmp['title'][] = "arr_title like '%".$value."%'";
			}	
		}
		if(count($arr_tmp) > 0) {
			foreach($arr_tmp as $tmp_k => $tmp_v) {
				$arr_tmp[$tmp_k] = '('.implode(" and ",$tmp_v).')';
			}
			$where .= " and (".implode(" or ",$arr_tmp).")";
		}
		
		$sql = "select widget_id,name_action,arr_title   
								from widget 
								where is_show=1 
								".$where."";
		//echo $sql;
		$result = $ttH->db->query($sql);
		if ($num = $ttH->db->num_rows($result))	{
			$i = 0;
			$output .= '[';
			while ($row = $ttH->db->fetch_row($result))	{
				$i++;
				$row["id"] = $row["name_action"];
				$row["arr_title"] = unserialize($row["arr_title"]);
				$row["title"] = $row["arr_title"][$ttH->conf['lang_cur']];
				$row["picture"] = $ttH->func->get_src_mod('', 50, 50, 1, 1);
				$row["option"] = '';
				$path = $ttH->conf['rootpath_web'].'widget'.DS.$row['name_action'];
				if ($dir = opendir($path)) {
					if(file_exists($path.DS.'thumbnail.png')) {
					$row["picture"] = $ttH->conf['rooturl_web'].'widget/'.$row['name_action'].'/thumbnail.png';
					}
				
					$path_wconf = $path.DS.'config.php';
					if(file_exists($path_wconf)) {
						require_once ($path_wconf); 
						if(isset($conf['parametric']) && is_array($conf['parametric'])) {
							foreach($conf['parametric'] as $k => $v) {
								if(is_array($v)) {
									$k = str_replace(array('[',']'),'',$k);
									$k_title = $k;
									$is_muti = 0;
									$ext = '';
									if(substr($k, 0, 4) == 'arr_') {
										//$k_title = substr($k, 0, strlen($k)-2);
										$is_muti = 1;
										$ext .= ' multiple="multiple"';
									}
									$ext .= ' class="form-control input-sm"';
									$ext .= ' data-name="'.$k.'"';
									$row["option"] .= $ttH->html->select ($k.'-'.rand(0,9999), $v, (isset($arr_widget_call[$row['name_action']][$k]) ? $arr_widget_call[$row['name_action']][$k] : ''), $ext);
								} else {
									$row["option"] .= '<div class="input-group">
										<span class="input-group-addon">'.$k.':</span>
										<input type="text" data-name="'.$k.'" size="80" class="form-control input-sm" value="'.$v.'"/>
									</div>';
								}
							}									
						}
					}
				}
				$output .= json_encode($row);
				$output .= ($i < $num) ? ',' : '';
			}
			$output .= ']';
		}
		
		return $output;
	}
	
	
  // end class
}
?>