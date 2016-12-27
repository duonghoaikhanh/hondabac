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
		
		$temp = 'popup';
		$data = array();

		flush();
		switch ($fun) {
			case "stock":
				$data['content'] = $this->do_stock ();
				break;
			default:
				echo '';
				break;
		}
		
		echo $ttH->html->temp_box($temp, $data);
		
		exit;
	}
	
	function do_stock ()
	{
		global $ttH;
		
		$type = (isset($ttH->input['type'])) ? $ttH->input['type'] : '';
		$type_id = (isset($ttH->input['type_id'])) ? $ttH->input['type_id'] : 0;
		
		$arr_color = $ttH->load_data->data_table ('product_color', 'color_id', 'color_id,color,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		$arr_size = $ttH->load_data->data_table ('product_size', 'size_id', 'size_id,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		
		$err = "";
		
		$where = " where type='".$type."' and type_id='".$type_id."' ";
		$ext = "";
		
		$where .= " order by color_id desc, size_id desc";
		
    $sql = "select * from product_combine ".$where." ";
    //echo $sql;
		$result = $ttH->db->query($sql);
    $i = 0;
    $html_row = "";
    if ($num = $ttH->db->num_rows($result))
		{
			while ($row = $ttH->db->fetch_row($result)) 
			{
				$i++;
				
				$row["link_edit"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "edit", array("id"=>$row['id'])).$this->ext_link;
				$row["link_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_trash","id"=>$row['id'])).$this->ext_link;
				$row["link_restore"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_restore","id"=>$row['id'])).$this->ext_link;
				$row["link_del"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_del","id"=>$row['id'])).$this->ext_link;
				
				$row['color'] = (isset($arr_color[$row['color_id']])) ? $arr_color[$row['color_id']] : array();
				$row['size'] = (isset($arr_size[$row['size_id']])) ? $arr_size[$row['size_id']] : array();
				$row['in_stock'] = $ttH->func->format_number($row['in_stock']);
				$row['out_stock'] = $ttH->func->format_number($row['out_stock']);
				
				$ttH->temp_act->assign('row', $row);
				$ttH->temp_act->parse("stock.row_item");
			}
		}
		else
		{
			$ttH->temp_act->assign('row', array("mess"=>$ttH->lang["global"]["no_have_data"]));
			$ttH->temp_act->parse("stock.row_empty");
		}
		
		$data['html_row'] = $html_row;
		$data['err'] = $err;
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("stock");
		return $ttH->temp_act->text("stock");
	}
	
  // end class
}
?>