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
	var $action = "ajax";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		
		$ttH->func->load_language($this->modules);
		
		$fun = (isset($ttH->post['f'])) ? $ttH->post['f'] : '';

		flush();
		switch ($fun) {
			case "cart_update":
				echo $this->do_cart_update ();
				exit;
				break;
			case "cart_info":
				echo $this->do_cart_info ();
				exit;
				break;
			case "cart_del_item":
				echo $this->do_cart_del_item ();
				exit;
				break;
			default:
				echo '';
				exit;
				break;
		}
		
		exit;
	}
	
	function do_cart_update ()
	{
		global $ttH;
		
		$output = array(
			'ok' => 1,
			'mess' => '',
			'mess_class' => 'success'
		);
		
		$arr_mess = array();
		
		$arr_cart = Session::get('cart_pro');
		$arr_cart_list_pro = Session::get('cart_list_pro');
		/*print_arr($arr_cart);
		print_arr($ttH->post);
		die();	*/
		
		$arr_size = $ttH->load_data->data_table ('product_size', 'size_id', 'size_id,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		
		$arr_pro = array();
		$sql = "select p.item_id,picture,price_buy,title,friendly_link   
						from product p, product_lang pl 
						where p.item_id=pl.item_id 
						and is_show=1 
						and find_in_set(p.item_id,'".@implode(',',$arr_cart_list_pro)."')>0 
						order by show_order desc, date_create asc";
		//echo $sql;
		$result = $ttH->db->query($sql);
		$html_row = "";
		while ($row = $ttH->db->fetch_row($result)) {
			$arr_pro[$row['item_id']] = $row;
		}
		
		foreach($arr_cart as $key => $value) {
			$quantity = (isset($ttH->post['quantity'][$key]) && $ttH->post['quantity'][$key] > 0) ? $ttH->post['quantity'][$key] : 1;
			
			
			$num_max = $ttH->site_func->check_in_stock (array('type_id' => $value['item_id']), array('size_id' => $value['size']));
			if($num_max < $quantity) {
				if($value['size'] > 0) {
					$arr_mess[] = str_replace(array('{item}','{num_has}','{size}'),array($arr_pro[$value['item_id']]['title'],$num_max, $arr_size[$value['size']]['title']),$ttH->lang['global']['err_in_stock_size']);
					$output['mess_class'] = 'warning';
				} else {
					$arr_mess[] = str_replace(array('{item}','{num_has}'),array($arr_pro[$value['item_id']]['title'],$num_max),$ttH->lang['global']['err_in_stock']);
					$output['mess_class'] = 'warning';
				}
				$quantity = $num_max;
			}
			
			$arr_cart[$key]['quantity'] = $quantity;
		}
		$arr_cart = Session::set ('cart_pro', $arr_cart);
		
		$output['mess'] = (count($arr_mess) > 0) ? implode('<br />',$arr_mess) : $ttH->lang['global']['update_success'];
		
		return json_encode($output);
	}
	
	function do_cart_info ()
	{
		global $ttH;
		
		$output = array(
			'num_cart' => 0
		);
		
		$arr_cart = Session::get('cart_pro', array());
		//$output['num_cart'] = count($arr_cart);
		foreach($arr_cart as $key => $value) {
			$output['num_cart'] += $value['quantity'];
		}
		$output['num_cart'] = number_format($output['num_cart']);
		
		return json_encode($output);
	}
	
	function do_cart_del_item ()
	{
		global $ttH;
		
		$output = 0;
		
		$arr_cart = Session::get('cart_pro');
		$cart_item = (isset($ttH->post['cart_item'])) ? $ttH->post['cart_item'] : '';
		/*print_arr($arr_cart);
		print_arr($ttH->post);
		die();	*/
		
		if(!empty($cart_item)) {
			if(isset($arr_cart[$cart_item])) {
				unset($arr_cart[$cart_item]);
				$arr_cart = Session::set ('cart_pro', $arr_cart);
				/*$arr_cart_list_pro = array();
				foreach($arr_cart as $key => $value) {
					$arr_cart_list_pro[$value['item_id']] = $value['item_id'];
				}
				Session::set ('cart_list_pro', $arr_cart_list_pro);*/
				
				$output = 1;
			}
		}
		
		return $output;
	}
	
  // end class
}
?>