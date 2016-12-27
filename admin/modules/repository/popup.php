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
	var $action = "popup";
	
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
		
		$fun = (isset($ttH->get['f'])) ? $ttH->get['f'] : '';

		switch ($fun) {
			case "stock_detail":
				$ttH->output = $this->do_stock_detail ();
				break;
			case "receipt_history_detail":
				$ttH->output = $this->do_receipt_detail ();
				break;
			default:
				die('Access denied');
				break;
		}
	}
	
	//-----------
	function do_stock_detail()
	{
		global $ttH;
		
		$type = (isset($ttH->get['type'])) ? $ttH->get['type'] : '';
		$type_id = (isset($ttH->get['type_id'])) ? $ttH->get['type_id'] : 0;
		
		$arr_color = $ttH->load_data->data_table ('product_color', 'color_id', 'color_id,color,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		$arr_size = $ttH->load_data->data_table ('product_size', 'size_id', 'size_id,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		
		$err = "";
		
		$where = " where type='".$type."' and type_id='".$type_id."' ";
		$where .= " order by color_id desc, size_id desc";
		
    $sql = "select * from product_combine ".$where."";
    //echo $sql;
		$result = $ttH->db->query($sql);
    $i = 0;
    $html_row = "";
    if ($num = $ttH->db->num_rows($result))
		{
			while ($row = $ttH->db->fetch_row($result)) 
			{
				$i++;
				
				$row['color'] = (isset($arr_color[$row['color_id']])) ? $arr_color[$row['color_id']] : array();
				$row['size'] = (isset($arr_size[$row['size_id']])) ? $arr_size[$row['size_id']] : array();
				
				//$row['import_stock'] = $ttH->func->format_number ($row['in_stock'] + $row['out_stock']);
				$row['in_stock'] = $ttH->func->format_number($row['in_stock']);
				$row['out_stock'] = $ttH->func->format_number($row['out_stock']);
				$row['has_stock'] = $ttH->func->format_number ($row['in_stock'] - $row['out_stock']);
				
				$ttH->temp_act->assign('row', $row);
				$ttH->temp_act->parse("combine.row_item");
			}
		}
		else
		{
			$ttH->temp_act->assign('row', array("mess"=>$ttH->lang["global"]["no_have_data"]));
			$ttH->temp_act->parse("combine.row_empty");
		}
		
		$ttH->temp_act->reset("combine");
		$ttH->temp_act->parse("combine");
		return $ttH->temp_act->text("combine");
	}
	
	//-----------
	function do_receipt_detail($type_show = 0)
	{
		global $ttH;
		
		$receipt_id = (isset($ttH->get['receipt_id'])) ? $ttH->get['receipt_id'] : '';
		$type = (isset($ttH->get['type'])) ? $ttH->get['type'] : '';
		$type_id = (isset($ttH->get['type_id'])) ? $ttH->get['type_id'] : 0;
		
		$arr_color = $ttH->load_data->data_table ('product_color', 'color_id', 'color_id,color,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		$arr_size = $ttH->load_data->data_table ('product_size', 'size_id', 'size_id,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		
		$err = "";
		
		$where = " where is_level>0 and receipt_id='".$receipt_id."' and type='".$type."' and type_id='".$type_id."' ";
		$where .= " order by color_id desc, size_id desc";
		
    $sql = "select * from repository_receipt_detail ".$where."";
    //echo $sql;
		$result = $ttH->db->query($sql);
    $i = 0;
    $html_row = "";
    if ($num = $ttH->db->num_rows($result))
		{
			while ($row = $ttH->db->fetch_row($result)) 
			{
				$i++;
				
				$row['color'] = (isset($arr_color[$row['color_id']])) ? $arr_color[$row['color_id']] : array();
				$row['size'] = (isset($arr_size[$row['size_id']])) ? $arr_size[$row['size_id']] : array();
				
				$row['quantity'] = $ttH->func->format_number($row['quantity']);
				
				$ttH->temp_act->assign('row', $row);
				$ttH->temp_act->parse("receipt_detail.row_item");
			}
		}
		else
		{
			$ttH->temp_act->assign('row', array("mess"=>$ttH->lang["global"]["no_have_data"]));
			$ttH->temp_act->parse("receipt_detail.row_empty");
		}
		
		$ttH->temp_act->reset("receipt_detail");
		$ttH->temp_act->parse("receipt_detail");
		return $ttH->temp_act->text("receipt_detail");
	}
	
  // end class
}
?>