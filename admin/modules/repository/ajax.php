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
	var $modules = "repository";
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
			case "order_detail":
				echo $this->do_order_detail ();
				exit;
				break;
			default:
				echo '';
				exit;
				break;
		}
		
		exit;
	}
	
	function do_order_detail ()
	{
		global $ttH;
		
		$output = array(
			'ok' => 1,
			'html' => ''
		);
		
		$arr_color = $ttH->load_data->data_table ('product_color', 'color_id', 'color_id,color,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		$arr_size = $ttH->load_data->data_table ('product_size', 'size_id', 'size_id,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		
		$order_id = (isset($ttH->post['order_id'])) ? $ttH->post['order_id'] : 0;
		
		$sql = "select * 
						from product_order_detail  
						where order_id='".$order_id."' 
						order by type asc, type_id asc, color_id desc, size_id desc";
    //echo $sql;
		$result = $ttH->db->query($sql);
    if ($num = $ttH->db->num_rows($result)){
			while ($row = $ttH->db->fetch_row($result)) {
				
				$row['product'] = $row['title'];
				$row['color'] = (isset($arr_color[$row['color_id']])) ? $arr_color[$row['color_id']] : array();
				$row['size'] = (isset($arr_size[$row['size_id']])) ? $arr_size[$row['size_id']] : array();
				
				$import = $row['quantity'] - $row['out_stock'];
				
				$row['price_buy'] = $ttH->func->get_price_format($row['price_buy']);
				$row['quantity'] = $ttH->func->format_number($row['quantity']);
				$row['out_stock'] = $ttH->func->format_number($row['out_stock']);
				
				$row['import_id'] = 'import_'.$row['detail_id'];
				$row['import'] = ($import > 0) ? $ttH->admin->list_number ("import[".$row['detail_id']."]", 0, $import, $import, ' id="'.$row['import_id'].'" class="form-control"') : '---';
				
				$ttH->temp_act->assign('row', $row);
				$ttH->temp_act->parse("order_detail.row_item");
				//$output['html'] .= $ttH->temp_act->text("order_detail.row_item");
			}
		}	else {
			$ttH->temp_act->assign('row', array("mess"=>$ttH->lang["global"]["no_have_data"]));
			$ttH->temp_act->parse("order_detail.row_empty");
			//$output['html'] .= $ttH->temp_act->text("order_detail.row_empty");
		}
		
		$ttH->temp_act->parse("order_detail");
		$output['html'] = $ttH->temp_act->text("order_detail");
		
		return json_encode($output);
	}
	
  // end class
}
?>