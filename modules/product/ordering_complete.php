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
	var $action = "ordering_complete";
	var $sub = "manage";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;

		$ttH->func->load_language($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS."ordering.tpl");
		$ttH->temp_act->assign('CONF', $ttH->conf);
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		$ttH->func->include_css ($ttH->dir_css.$this->modules.'/ordering.css');
		$ttH->func->include_js($ttH->dir_js.'jquery_plugins/jquery.validate.js');
		$ttH->func->include_js($ttH->dir_skin.'js/global/temp.js');
		$ttH->func->include_js($ttH->dir_skin.'js/user/user.js');
		$ttH->func->include_js($ttH->dir_skin.'js/'.$this->modules.'/ordering.js');
		
		$ttH->conf['menu_action'] = array($this->modules);
		$ttH->data['link_lang'] = (isset($ttH->data['link_lang'])) ? $ttH->data['link_lang'] : array();
		
		include ($this->modules."_func.php");
		
		$data = array();
		//Make link lang
		foreach($ttH->data['lang'] as $row_lang) {
			$ttH->data['link_lang'][$row_lang['name']] = $ttH->site->get_link_lang ($row_lang['name'], $this->modules, $ttH->setting[$this->modules.'_'.$row_lang['name']]['ordering_friendly_link'], $ttH->setting[$this->modules.'_'.$row_lang['name']]['ordering_cart_link']);
		}
		//End Make link lang
		
		//SEO
		$ttH->site->get_seo (array(
			'meta_title' => (isset($ttH->setting['product'][$this->action."_meta_title"])) ? $ttH->setting['product'][$this->action."_meta_title"] : '',
			'meta_key' => (isset($ttH->setting['product'][$this->action."_meta_key"])) ? $ttH->setting['product'][$this->action."_meta_key"] : '',
			'meta_desc' => (isset($ttH->setting['product'][$this->action."_meta_desc"])) ? $ttH->setting['product'][$this->action."_meta_desc"] : ''
		));
		$ttH->conf["cur_group"] = 0;
		
		$data = array();
		$data['content'] = $this->do_main();
		$data['title'] = $ttH->conf['meta_title'];
		
		$ttH->temp_box->assign('data', $data);
		$ttH->temp_box->parse("box_main");
		$data['content'] = $ttH->temp_box->text("box_main");
	
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("main");
		$ttH->output .=  $ttH->temp_act->text("main");
	}
	
	function do_main ()
	{
		global $ttH;
		
		/*if($ttH->site_func->check_user_login() != 1) {
			$link_method = $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_address_link']);
			$ttH->html->redirect_rel($link_method);
		}*/
		
		$ordering_payment = Session::get ('ordering_payment', array());	
		
		/*print_arr($ordering_payment);
		die();*/
		
		if(!is_array($ordering_payment) || !count($ordering_payment) > 0) {
			$ttH->html->redirect_rel($ttH->site->get_link ('home'));
		}
		
		$arr_pro = $ttH->load_data->data_table (
		'product', 
		'item_id', 
		'item_id,picture,price_buy,title,friendly_link', 
		" is_show=1 
			and lang='".$ttH->conf['lang_cur']."' 
			and find_in_set(item_id,'".@implode(',',$ordering_payment['arr_cart_list_pro'])."')>0 
			order by show_order desc, date_create asc"
		);
		
		$sql = "select * 
						from product_order 
						where order_code='".$ordering_payment['order_code']."' ";
		//echo $sql;
		$result = $ttH->db->query($sql);
		if ($order_info = $ttH->db->fetch_row($result)) {
			
			$arr_order_shipping = $ttH->load_data->data_table ('order_shipping', 'shipping_id', 'shipping_id,title,content', "shipping_id='".$order_info['shipping']."' and lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
			$order_shipping = isset($arr_order_shipping[$order_info['shipping']]) ? $arr_order_shipping[$order_info['shipping']] : array();
			
			$arr_order_method = $ttH->load_data->data_table ('order_method', 'method_id', 'method_id,name_action,title', "is_show=1 and lang='".$ttH->conf['lang_cur']."' and method_id='".$order_info['method']."' order by show_order desc, date_create desc");
			$order_method = isset($arr_order_method[$order_info['method']]) ? $arr_order_method[$order_info['method']] : array();
			
			//Cập nhật trạng thái cho thanh toán online
			if(isset($order_method['name_action']) && $order_method['name_action'] != '') {
				$file = $ttH->conf['rootpath'].'modules'.DS.'product'.DS.'payment_method'.DS.$order_method['name_action'].DS.'payment.php';
				if (file_exists($file)) {
					require_once($file );
					$payment = new Payment;
					
					//Kiểm tra tính hợp lệ của link
					if($payment->verifyResponseUrl($ttH->get) == TRUE) {
						//Kiểm tra tính hợp lệ của đơn hàng
						if($order_info['order_code'] == $ttH->get['order_id']) {
							$col_up = array();
							//Cập nhật thành trạng thái đã thanh toán
							$col_up["is_status"] = 2;
							$ttH->db->do_update("product_order", $col_up, " order_id='".$order_info['order_id']."'");
						}
						
					}
				}
			}
			//End
			
			
			$arr_cart = array();
			$sql_cart = "select * 
							from product_order_detail 
							where order_id='".$order_info['order_id']."' ";
			//echo $sql_cart;
			$result_cart = $ttH->db->query($sql_cart);
			while ($row_cart = $ttH->db->fetch_row($result_cart)) {
				$arr_cart[$row_cart['detail_id']] = $row_cart;
			}
			
			$mail_arr_key = array(
				'{list_cart}',
				'{o_full_name}',
				'{o_email}',
				'{o_phone}',
				'{o_address}',
				'{d_full_name}',
				'{d_email}',
				'{d_phone}',
				'{d_address}',
				'{shipping}',
				'{method}',
				'{request_more}',
				'{order_code}',
				'{date_create}'
			);
			$mail_arr_value = array(
				$this->do_cart ($order_info, $arr_cart, $arr_pro),
				$order_info["o_full_name"],
				$order_info["o_email"],
				$order_info["o_phone"],
				$order_info["o_address"],
				$order_info["d_full_name"],
				$order_info["d_email"],
				$order_info["d_phone"],
				$order_info["d_address"],
				(isset($arr_order_shipping[$order_info['shipping']])) ? $arr_order_shipping[$order_info['shipping']]['title'] : '',
				(isset($arr_order_method[$order_info['method']])) ? $arr_order_method[$order_info['method']]['title'] : '',
				$order_info["request_more"],
				$order_info["order_code"],
				$ttH->func->get_date_format($order_info["date_create"])
			);
			
			//send to admin
			$ttH->func->send_mail_temp ('admin-ordering-complete', $ttH->conf['email'], $ttH->conf['email'], $mail_arr_key, $mail_arr_value);
			//send to customer
			$ttH->func->send_mail_temp ('ordering-complete', $order_info['o_email'], $ttH->conf['email'], $mail_arr_key, $mail_arr_value);
			
			Session::Delete('ordering_payment');
		}
		
		$data = array();
		$data['link_action'] = $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_complete_link']);
		$data['content'] = $ttH->site->get_banner ('content');
		$data['link_buy_more'] = $ttH->site->get_link ('product');
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("ordering_complete");
		$output = $ttH->temp_act->text("ordering_complete");
		return $output;
	}
	
	function do_cart ($order = array(), $arr_cart = array(), $arr_pro = array())
	{
		global $ttH;	
		
		$arr_color = $ttH->load_data->data_table ('product_color', 'color_id', 'color_id,color,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		$arr_size = $ttH->load_data->data_table ('product_size', 'size_id', 'size_id,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		
		$data = $order;
		$data['cart_total'] = 0;
		if(is_array($arr_cart) && count($arr_cart > 0)){
			foreach($arr_cart as $cart_id => $row) {
				$row_pro = $arr_pro[$row['type_id']];
				
				$row['cart_id'] = $cart_id;
				$row['pic_w'] = 50;
				$row['pic_h'] = 50;
				$row['picture'] = (isset($row_pro['picture'])) ? $row_pro['picture'] : '';
				$row["picture"] = $ttH->func->get_src_mod($row["picture"], $row['pic_w'], $row['pic_h'], 1, 0, array('fix_max' => 1));
				$row['price_buy'] = (isset($row_pro['price_buy'])) ? $row_pro['price_buy'] : 0;
				$row['title'] = (isset($row_pro['title'])) ? $row_pro['title'] : '';
				$row['quantity'] = (isset($row['quantity'])) ? $row['quantity'] : 0;
				
				$row['total'] = $row['quantity'] * $row['price_buy'];
				$data['cart_total'] += $row['total'];
				
				$row['color'] = (isset($row['color']) && array_key_exists($row['color'], $arr_color)) ? $row['color'] : 0;
				$color = (isset($arr_color[$row['color']]['color'])) ? '<div><span class="color" style="background:'.$arr_color[$row['color']]['color'].'; display:inline-block; width:20px; height:20px;">&nbsp;</span></div>' : '';
				$row['color'] = (isset($arr_color[$row['color']]['title'])) ? $color.$arr_color[$row['color']]['title'] : '';
				
				$row['size'] = (isset($row['size']) && array_key_exists($row['size'], $arr_size)) ? $row['size'] : 0;
				$row['size'] = (isset($arr_size[$row['size']]['title'])) ? $arr_size[$row['size']]['title'] : '';
				
				/*$row['code_pic'] = (isset($row['code_pic']) && array_key_exists($row['code_pic'], $arr_code_pic)) ? $row['code_pic'] : 0;
				$code_pic = (isset($arr_code_pic[$row['code_pic']]['code_pic'])) ? '<div><span class="code_pic" style="background:'.$arr_code_pic[$row['code_pic']]['code_pic'].';">&nbsp;</span></div>' : '';
				$row['code_pic'] = (isset($arr_code_pic[$row['code_pic']]['title'])) ? $code_pic.$arr_code_pic[$row['code_pic']]['title'] : '';*/
				
				$row['price_buy'] = $ttH->func->get_price_format_email($row['price_buy']);
				$row['total'] = $ttH->func->get_price_format_email($row['total']);
				
				$row['cart_td_attr'] = ' style="background:#ffffff;"';
				
				$ttH->temp_act->assign('row', $row);
				$ttH->temp_act->parse("table_cart_ordering_method.row_item");
			}
		} else {
			$ttH->temp_act->assign('row', array('mess' => $ttH->lang['product']['no_have_item']));
			$ttH->temp_act->parse("table_cart_ordering_method.row_empty");
		}
		
		$promotion_percent = $order['promotion_percent'];
		$shipping_price = $order['shipping_price'];
		$voucher_amount_has = $order['voucher_amount'];
		
		//cart_payment
		$data['cart_payment'] = $data['cart_total'];
		if($promotion_percent > 0 && $promotion_percent < 100) {
			$data['cart_payment'] = (100-$promotion_percent)/100 * $data['cart_payment'];
		}//End
		
		//shipping_price
		if($shipping_price > 0) {
			$data['cart_payment'] += $shipping_price;
		}//End
		
		//voucher_amount
		$voucher_amount_has_out = $voucher_amount_has;
		if($voucher_amount_has > $data['cart_payment']) {
			$voucher_amount_has_out = $data['cart_payment'];
			$data['cart_payment'] = 0;
		} else {
			$data['cart_payment'] -= $voucher_amount_has;
		}//End
		
		$data['cart_total'] = $ttH->func->get_price_format_email($data['cart_total'], 0);
		$data['promotion_percent'] = $promotion_percent;
		$data['shipping_price_out'] = $ttH->func->get_price_format_email($shipping_price, 0);
		$data['voucher_amount'] = $voucher_amount_has;
		$data['voucher_amount_out'] = $ttH->func->get_price_format_email($voucher_amount_has_out, 0);
		$data['cart_payment'] = $ttH->func->get_price_format_email($data['cart_payment'], 0);
		$data['link_action'] = $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_cart_link']);
		$data['link_ordering_address'] = $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_address_link']);
		
		//style 
		$data['cart_table_attr'] = ' style="background:#dbdbdb;"';
		$data['cart_th_attr'] = ' style="font-weight:bold; background:#efefef; text-align:center; color:#800080;"';
		$data['cart_total_attr'] = ' style="background:#ffffff;"';
		//end
				
		$ttH->temp_act->assign('data', $data);
		
		$ttH->temp_act->parse("table_cart_ordering_method.shipping_price");
		
		$ttH->temp_act->parse("table_cart_ordering_method");
		return $ttH->temp_act->text("table_cart_ordering_method");
	}
	
  // end class
}
?>