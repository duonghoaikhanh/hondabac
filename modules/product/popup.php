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
$nts = new pMain();

class pMain
{
	var $modules = "product";
	var $action = "popup";
	var $fun = "";
	
	/**
	* function __construct ()
	* Khoi tao 
	**/
	function __construct ()
	{
		global $ttH;
		
		$this->fun = (isset($ttH->input['f'])) ? $ttH->input['f'] : '';
		switch ($this->fun) {
			case "cart":
				$ttH->output .= $this->do_cart ();
				break;
			case "cart_empty":
				$ttH->output .= $ttH->site->get_banner ('cart-empty');;
				break;
			case "ordering_complete":
				$ttH->output .= $this->do_ordering_complete ();
				break;
			default:
				$ttH->output .= 'Access denied';
				exit;
				break;
		}
	}
	
	function _cart ()
	{
		global $ttH;

		$arr_cart = Session::get('cart_pro', array());
		$arr_cart_list_pro = Session::get('cart_list_pro');
		
		if(isset($ttH->post['data'])) {
			foreach($ttH->post['data'] as $key) {
				eval('$'.$key['name'].' = '.$key['value'].';');
			}
		}
		
		$arr_color = $ttH->load_data->data_table ('product_color', 'color_id', 'color_id,color,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		$arr_size = $ttH->load_data->data_table ('product_size', 'size_id', 'size_id,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		
		$err = '';
		
		/*print_arr($ttH->input); 
		print_arr($arr_cart); */
		//die();
		
		if(isset($item_id)) {
			$item_id = ($item_id > 0) ? $item_id : 0;
			$color = (isset($color)) ? $color : 0;
			$size = (isset($size)) ? $size : 0;
			//$code_pic = (isset($ttH->input['code_pic'])) ? $ttH->input['code_pic'] : 0;
			
			$quantity = (isset($quantity) && $quantity > 0) ? $quantity : 1;
			if($item_id > 0) {
				$cart_id = md5($item_id.'_c'.$color.'_s'.$size);
				//$cart_id = md5($item_id.'_c'.$color.'_cp'.$code_pic);
				$arr_tmp = array(
					'item_id' => $item_id,
					'color' => $color,
					'size' => $size,
					//'code_pic' => $code_pic,
					'quantity' => $quantity
				);
				
				$check_quantity = isset($arr_cart[$cart_id]['quantity']) ? $arr_cart[$cart_id]['quantity'] + $quantity : $quantity;
				$num_max = $ttH->site_func->check_in_stock (array('type_id' => $item_id), array('size_id' => $size));
				if($num_max < $check_quantity) {
					if($size > 0) {
						$err = $ttH->html->html_alert(
							str_replace(array('{item}','{num_has}','{size}'),array('{product_'.$item_id.'}',$num_max, $arr_size[$size]['title']),$ttH->lang['global']['err_in_stock_size'])
							, 'warning');
					} else {
						$err = $ttH->html->html_alert(
							str_replace(array('{item}','{num_has}'),array('{product_'.$item_id.'}',$num_max),$ttH->lang['global']['err_in_stock'])
							, 'warning');
					}
					$quantity = 0;
					if(isset($arr_cart[$cart_id])) {
						$arr_cart[$cart_id]['quantity'] = $arr_tmp['quantity'];
					} else {
						$arr_tmp['quantity'] = $num_max;
					}
					
				}
				
				$arr_cart_list_pro[$item_id] = $item_id;
				
				if(isset($arr_cart[$cart_id])) {
					$arr_cart[$cart_id]['quantity'] += $quantity;
				} else {
					$arr_cart[$cart_id] = $arr_tmp;
				}					
				
				$arr_cart = Session::set ('cart_pro', $arr_cart);
				$arr_cart_list_pro = Session::set ('cart_list_pro', $arr_cart_list_pro);
				
				$link_go = $ttH->site_func->get_link_popup ('product','cart');
				$ttH->html->redirect_rel($link_go);
			}
		}
		
		if(count($arr_cart) <= 0) {
			$link_go = $ttH->site_func->get_link_popup ('product','cart_empty');
			$ttH->html->redirect_rel($link_go);
		}
		
		/*print_arr($arr_cart);
		print_arr($arr_cart_list_pro);
		print_arr($gift_voucher);
		print_arr($ttH->input);*/
		//die('aaa');
		
		$arr_pro = array();
		$sql = "select item_id,picture,price_buy,title,friendly_link   
						from product 
						where is_show=1 
						and find_in_set(item_id,'".@implode(',',$arr_cart_list_pro)."')>0 
						order by show_order desc, date_create asc";
		//echo $sql;
		$result = $ttH->db->query($sql);
		$html_row = "";
		while ($row = $ttH->db->fetch_row($result)) {
			$arr_pro[$row['item_id']] = $row;
			
			if(isset($ttH->input['item_id']) && $ttH->input['item_id'] == $row['item_id'] && !empty($err)) {
				$err = str_replace('{product_'.$ttH->input['item_id'].'}',$row['title'],$err);
			}
		}
		
		$data = array();
		$data['cart_total'] = 0;
		if(is_array($arr_cart) && count($arr_cart > 0)){
			foreach($arr_cart as $cart_id => $row) {
				$row_pro = (isset($row['item_id'])) ? $arr_pro[$row['item_id']] : array();
				
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
				$color = (isset($arr_color[$row['color']]['color'])) ? '<div><span class="color" style="background:'.$arr_color[$row['color']]['color'].';">&nbsp;</span></div>' : '';
				$row['color'] = (isset($arr_color[$row['color']]['title'])) ? $color.$arr_color[$row['color']]['title'] : '';
				
				$row['size'] = (isset($row['size']) && array_key_exists($row['size'], $arr_size)) ? $row['size'] : 0;
				$row['size'] = (isset($arr_size[$row['size']]['title'])) ? $arr_size[$row['size']]['title'] : '';
				
				$row['price_buy_text'] = $ttH->func->get_price_format($row['price_buy']);
				$row['quantity_text'] = list_quantity('quantity[]', $row['quantity'], ' for="'.$cart_id.'" class="quantity" onchange="ttHOrdering.cart_update(\'form_cart\');"');
				$row['total'] = $ttH->func->get_price_format($row['total']);
				
				$ttH->temp_act->assign('row', $row);
				$ttH->temp_act->parse("table_cart.row_item");
			}
		} else {
			$ttH->temp_act->assign('row', array('mess' => $ttH->lang['product']['no_have_item']));
			$ttH->temp_act->parse("table_cart.row_empty");
		}
		
		//promotion
		$err_promotion = '';
		$promotion_percent = 0;
		$promotion_code = (isset($ttH->input['promotional_code'])) ? $ttH->input['promotional_code'] : Session::get('promotion_code');

		/*if($data['cart_total'] >=isset( $ttH->setting)? $ttH->setting['voucher']['min_cart_promotion'] :1) {
			if(!empty($promotion_code)) {
				$sql = "select * 
								from promotion 
								where is_show=1 
								and percent>0 
								and percent<100 
								and promotion_id='".$promotion_code."'";
				//echo $sql;
				$result = $ttH->db->query($sql);
				if ($row_promotion = $ttH->db->fetch_row($result)) {
					if(!empty($row_promotion['order_id'])) {
						$err_promotion = $ttH->lang['product']['err_promotion_order'];
					} elseif(time() > $row_promotion['date_end']) {
						$err_promotion = $ttH->lang['product']['err_promotion_date_end'];
					} else {
						$promotion_percent = $row_promotion['percent'];
						$gift_promotion = Session::set ('promotion_code', $row_promotion['promotion_id']);
					}
				} else {
					Session::set ('promotion_code', '');
				}
			}
			$promotion_code = Session::get('promotion_code');
		} elseif(!empty($promotion_code)) {
			$err_promotion = str_replace('{min_cart}',$ttH->func->get_price_format($ttH->setting['voucher']['min_cart_promotion'], 0),$ttH->lang['global']['err_promotion_min_cart']);
			Session::set ('promotion_code', '');
		}*/
		//End promotion
		
		//voucher
		$err_voucher = '';
		$voucher_amount_has = 0;
		$gift_voucher = (isset($ttH->input['gift_voucher'])) ? $ttH->input['gift_voucher'] : Session::get('gift_voucher');
		if(!empty($gift_voucher)) {
			$sql = "select * 
							from voucher 
							where is_show=1 
							and voucher_id='".$gift_voucher."'";
			//echo $sql;
			$result = $ttH->db->query($sql);
			if ($row_voucher = $ttH->db->fetch_row($result)) {
				if($row_voucher['amount'] <= $row_voucher['amount_use']) {
					$err_voucher = $ttH->lang['product']['err_gift_voucher_no_amount'];
				} elseif(time() > $row_voucher['date_end']) {
					$err_voucher = $ttH->lang['product']['err_gift_voucher_date_end'];
				} else {
					$voucher_amount_has = $row_voucher['amount'] - $row_voucher['amount_use'];
					$gift_voucher = Session::set ('gift_voucher', $row_voucher['voucher_id']);
				}
			} else {
				Session::set ('gift_voucher', '');
			}
		}
		$gift_voucher = Session::get('gift_voucher');
		//End voucher
		
		$data['cart_payment'] = $data['cart_total'];
		if($promotion_percent > 0 && $promotion_percent < 100) {
			$data['cart_payment'] = (100-$promotion_percent)/100 * $data['cart_payment'];
		}
		$voucher_amount_has_out = $voucher_amount_has;
		if($voucher_amount_has > $data['cart_payment']) {
			$voucher_amount_has_out = $data['cart_payment'];
			$data['cart_payment'] = 0;
		} else {
			$data['cart_payment'] -= $voucher_amount_has;
		}
		
		
		$data['cart_total'] = $ttH->func->get_price_format($data['cart_total'], 0);
		//$data['min_cart_promotion'] = $ttH->setting['voucher']['min_cart_promotion'];
		$data['promotion_percent'] = $promotion_percent;
		$data['voucher_amount'] = $voucher_amount_has;
		$data['voucher_amount_out'] = $ttH->func->get_price_format($voucher_amount_has_out, 0);
		$data['cart_payment'] = $ttH->func->get_price_format($data['cart_payment'], 0);
		
		if(isset($ttH->is_popup)) {
			$data['link_action'] = $ttH->site_func->get_link_popup ($this->modules,$this->action);
			$data['link_ordering_address'] = $ttH->site_func->get_link_popup ($this->modules,'ordering_address');
			$data['link_buy_more'] = '#';
		} else {
			$data['link_action'] = $ttH->site->get_link ($this->modules,$ttH->setting[$this->modules]['ordering_friendly_link'],$ttH->setting[$this->modules]['ordering_cart_link']);
			$data['link_ordering_address'] = $ttH->site->get_link ($this->modules,$ttH->setting[$this->modules]['ordering_friendly_link'],$ttH->setting[$this->modules]['ordering_address_link']);
			$data['link_buy_more'] = $ttH->site->get_link ($this->modules);
		}		
		
		$data['err'] = $err;
		$data['err_promotion'] = (!empty($err_promotion)) ? '<div class="error">'.$err_promotion.'</div>' : '';
		$data['err_voucher'] = (!empty($err_voucher)) ? '<div class="error">'.$err_voucher.'</div>' : '';
				
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("table_cart");
		return $ttH->temp_act->text("table_cart");
	}
	
	function _user () {
		global $ttH;
		
		$data = array();
		
		$link_cart = $ttH->site_func->get_link_popup ('product','cart');
		$ordering_address_link = $link_cart;
		$ordering_method_link = $link_cart;
		
		$ordering_address = Session::Get('ordering_address', array());
		
		//Captcha::Set();
		$link_forget_password = $ttH->site->get_link ('user', $ttH->setting['user']['forget_pass_link']);
	
		$data['link_login_go'] = $ordering_address_link;
		$data['link_address'] = $ordering_address_link;
		
		$data['form_signin'] = $ttH->html->temp_box(
			'form_signin', 
			array(
				'link_root' => $ttH->conf['rooturl'],
				'link_login_go' => $data['link_login_go'],
				'link_forget_password' => $link_forget_password
			)
		);
		
		$data["list_location_province"] = $ttH->site_func->list_location_province ("province", 'vi', ''," class=\"form-control select_location_province\" data-district='district' data-ward='ward' id='province'", array('title' => $ttH->lang['global']['select_title']));
		$data["list_location_district"] = $ttH->site_func->list_location_district ("district", '', ''," class=\"form-control select_location_district\" data-ward='ward' id='district'", array('title' => $ttH->lang['global']['select_title']));
		$data["list_location_ward"] = $ttH->site_func->list_location_ward ("ward", '', ''," class=\"form-control\" id='ward'", array('title' => $ttH->lang['global']['select_title']));
		
		$data['form_signup'] = $ttH->html->temp_box(
			'form_signup', 
			array(
				'link_root' => $ttH->conf['rooturl'],
				'link_login_go' => $data['link_login_go'], 
				'list_location_province' => $data["list_location_province"], 
				'list_location_district' => $data["list_location_district"], 
				'list_location_ward' => $data["list_location_ward"]
			)
		);
		
		$data['signup_info'] = $ttH->site->get_banner('signup');
					
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("ordering_user");
		return $ttH->temp_act->text("ordering_user");
	}
	
	function _address ()
	{
		global $ttH;
		
		$link_cart = $ttH->site_func->get_link_popup ('product','cart');
		$ordering_address_link = $link_cart;
		$ordering_method_link = $link_cart;
		
		//print_arr($ttH->data['user_cur']);
		$arr_k = array('full_name','email','phone','address','province','district','ward');
		
		if (isset($ttH->post['do_submit'])) {
			/*print_arr($ttH->post);
			die();*/
			$col = array();
			foreach($arr_k as $k) {				
				$col['o_'.$k] = (isset($ttH->post['o_'.$k])) ? $ttH->post['o_'.$k] : '';
				$col['d_'.$k] = (isset($ttH->post['d_'.$k])) ? $ttH->post['d_'.$k] : '';
			}
			
			$ordering_address = Session::Set('ordering_address', $col);
		}
		
		$ordering_address = Session::Get('ordering_address', array());	
		
		$data = $ttH->func->if_isset($ttH->data['user_cur']['arr_address_book'][0], array());
		foreach($arr_k as $k) {
			
			$tmp = (isset($ttH->data['user_cur'][$k])) ? $ttH->data['user_cur'][$k] : '';
			if($k == 'full_name' && empty($tmp)) {
				$tmp = (isset($ttH->data['user_cur']['nickname'])) ? $ttH->data['user_cur']['nickname'] : '';
			}
			
			if (!isset($data['o_'.$k]) || empty($data['o_'.$k])) {
				$data['o_'.$k] = $tmp;
			}
			if (!isset($data['d_'.$k]) || empty($data['d_'.$k])) {
				$data['d_'.$k] = $tmp;
			}
			
			$data['o_'.$k] = $ttH->func->if_isset($ordering_address['o_'.$k], $data['o_'.$k]);
			$data['d_'.$k] = $ttH->func->if_isset($ordering_address['d_'.$k], $data['d_'.$k]);
			
		}
		
		$data["o_list_location_province"] = $ttH->site_func->list_location_province ("o_province", 'vi', $data['o_province']," class=\"form-control select_location_province\" data-district='o_district' data-ward='o_ward' id='o_province'", array('title' => $ttH->lang['global']['select_title']));
		$data["o_list_location_district"] = $ttH->site_func->list_location_district ("o_district", $data['o_province'], $data['o_district']," class=\"form-control select_location_district\" data-ward='o_ward' id='o_district'", array('title' => $ttH->lang['global']['select_title']));
		$data["o_list_location_ward"] = $ttH->site_func->list_location_ward ("o_ward", $data['o_district'], $data['o_ward']," class=\"form-control\" id='o_ward'", array('title' => $ttH->lang['global']['select_title']));
		
		$data["d_list_location_province"] = $ttH->site_func->list_location_province ("d_province", 'vi', $data['d_province']," class=\"form-control select_location_province\" data-district='d_district' data-ward='d_ward' id='d_province'", array('title' => $ttH->lang['global']['select_title']));
		$data["d_list_location_district"] = $ttH->site_func->list_location_district ("d_district", $data['d_province'], $data['d_district']," class=\"form-control select_location_district\" data-ward='d_ward' id='d_district'", array('title' => $ttH->lang['global']['select_title']));
		$data["d_list_location_ward"] = $ttH->site_func->list_location_ward ("d_ward", $data['d_district'], $data['d_ward']," class=\"form-control\" id='d_ward'", array('title' => $ttH->lang['global']['select_title']));
		
		$data['link_action'] = $ordering_address_link;
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("ordering_address");
		return $ttH->temp_act->text("ordering_address");
	}
	
	function _method ($cur = '')
	{
		global $ttH;
		
		$output = '';
		
		$sql = "select method_id,name_action,picture,title,content 
						from order_method  
						where is_show=1 
						and lang='".$ttH->conf['lang_cur']."' 
						order by show_order desc, date_update desc";
		//echo $sql;
		$result = $ttH->db->query($sql);
		if ($num = $ttH->db->num_rows($result)) {
			$i = 0;
			while ($row = $ttH->db->fetch_row($result)) {
				
				$i++;
				if($cur > 0) {				
					$row['method_checked'] = ($row['method_id'] == $cur) ? ' checked="checked"' : '';
				} else {
					$row['method_checked'] = ($i == 1) ? ' checked="checked"' : '';
				}
				
				$row['content'] = $ttH->func->input_editor_decode($row['content']);
				
				$ttH->temp_act->assign('row', $row);
				$ttH->temp_act->parse("ordering_method_method.row");
			}
			
			$ttH->temp_act->parse("ordering_method_method");
			return $ttH->temp_act->text("ordering_method_method");
		}
		
		return $output;
	}
	
	function _ordering_form ()
	{
		global $ttH;
		
		$data = array();
		$err = '';
		$data['ordering_address'] = $this->_address();
		$data['ordering_method'] = $this->_method();
		
		$arr_cart = Session::get('cart_pro', array());
		$arr_cart_list_pro = Session::get('cart_list_pro', array());
		$ordering_address = Session::Get('ordering_address', array());	
		
		$arr_order_method = $ttH->load_data->data_table ('order_method', 'method_id', 'method_id,name_action,title', "is_show=1 and lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		
		if (isset($ttH->post['do_submit']) && $ttH->post['do_submit'] == 'save') {
			
			$arr_pro = $ttH->load_data->data_table ('product', 'item_id', 'item_id,picture,price_buy,title,friendly_link ', " is_show=1 and lang='".$ttH->conf['lang_cur']."' and find_in_set(item_id,'".@implode(',',$arr_cart_list_pro)."')>0 order by show_order desc, date_create asc");
			
			$method = (isset($ttH->post['method']) && array_key_exists($ttH->post['method'], $arr_order_method)) ? $ttH->post['method'] : '';
			
			if(empty($err)) {
				$col = array();				
				
				$arr_k = array('full_name','email','phone','address','province','district','ward');
				foreach($arr_k as $k) {
					$col['o_'.$k] = (isset($ordering_address['o_'.$k])) ? $ordering_address['o_'.$k] : '';
					$col['d_'.$k] = (isset($ordering_address['d_'.$k])) ? $ordering_address['d_'.$k] : '';
				}
				
				$col['method'] = $method;	
				$col["request_more"] = (isset($ttH->post["request_more"])) ? $ttH->post["request_more"] : '';
				$col["user_id"] = (isset($ttH->data['user_cur']["user_id"])) ? $ttH->data['user_cur']["user_id"] : 0;
				$col["show_order"] = 0;
				$col["is_status"] = 1;
				$col["is_show"] = 1;
				$col["date_create"] = time();
				$col["date_update"] = time();
				/*print_arr($arr_cart);
				print_arr($col);
				die();*/
				$ok = $ttH->db->do_insert("product_order", $col);	
				//echo $ttH->db->debug();
				if($ok){
					$order_id = $ttH->db->insertid();
					
					$order_info = $col;
					
					$total_order = 0;
					if(is_array($arr_cart) && count($arr_cart) > 0){
						foreach($arr_cart as $cart_id => $row) {
							$row_pro = $arr_pro[$row['item_id']];
							
							$col = array();
							$col['order_id'] = $order_id;
							$col['type'] = 'product';
							$col['type_id'] = (isset($row_pro['item_id'])) ? $row_pro['item_id'] : '';
							$col['picture'] = (isset($row_pro['picture'])) ? $row_pro['picture'] : '';
							$col['title'] = (isset($row_pro['title'])) ? $row_pro['title'] : '';
							$col['price_buy'] = (isset($row_pro['price_buy'])) ? $row_pro['price_buy'] : 0;
							$col['quantity'] = (isset($row['quantity'])) ? $row['quantity'] : 0;
							$col['color_id'] = (isset($row['color'])) ? $row['color'] : 0;
							$col['size_id'] = (isset($row['size'])) ? $row['size'] : 0;
							$col['code_pic'] = (isset($row['code_pic'])) ? $row['code_pic'] : 0;
							$ttH->db->do_insert("product_order_detail", $col);	
							
							$total_order += $col['price_buy'] * $col['quantity'];
						}
					}
					
					$total_payment = $total_order;
					
					//update product_order
					$col_up = array();
					$col_up["order_code"] = $order_id.$ttH->func->random_str (5, 'u');
					$col_up["total_order"] = $total_order;
					$col_up["total_payment"] = $total_payment;
					$ttH->db->do_update("product_order", $col_up, " order_id='".$order_id."'");
					$order_info = array_merge($order_info, $col_up);
					//end
					
					Session::set ('ordering_payment', array(
						'order_code' => $order_info['order_code'],
						'method' => $order_info['method'],
						'total_order' => $order_info['total_order'],
						'total_payment' => $order_info['total_payment'],
						'arr_cart_list_pro' => $arr_cart_list_pro,							
						'token' => $ttH->func->random_str(10)
					));	
					
					Session::Delete('cart_pro');
					Session::Delete('cart_list_pro');
					Session::Delete('ordering_address');
					Session::Delete('promotion_code');
					Session::Delete('gift_voucher');						
					
					$link_go = $ttH->site_func->get_link_popup ('product','ordering_complete');
					$ttH->html->redirect_rel($link_go);
				}//End if ok
			}			
		}		
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("ordering_method");
		return $ttH->temp_act->text("ordering_method");		
	}
	
	function do_cart ()
	{
		global $ttH;	
		
		$ordering_address = Session::Get('ordering_address', array());	
		
		$ttH->func->load_language($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS."popup.tpl");
		$ttH->temp_act->assign('CONF', $ttH->conf);
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		$ttH->func->include_css ($ttH->dir_css.$this->modules.'/ordering.css');
		$ttH->func->include_js($ttH->dir_js.'jquery_plugins/jquery.validate.js');
		$ttH->func->include_js($ttH->dir_skin.'js/global/temp.js');
		$ttH->func->include_js($ttH->dir_skin.'js/location/location.js');
		$ttH->func->include_js($ttH->dir_skin.'js/user/user.js');
		$ttH->func->include_js($ttH->dir_skin.'js/'.$this->modules.'/ordering.js');
		
		//require_once ($ttH->conf["rootpath"].DS."modules/".$this->modules."/seo_url_short.php");
		
		require_once ($ttH->conf["rootpath"].DS."modules/".$this->modules."/".$this->modules."_func.php");
		
		$output = '';
		$output .= $this->_cart();
		/*if($ttH->site_func->check_user_login() || count($ordering_address) > 0 || isset($ttH->get['skip_login'])) {
			$output .= $this->_ordering_form();
		} else {
			$output .= $this->_user ();
		}	*/	
		$output .= $this->_ordering_form();
		
		return $output;
	}
	
	function _cart_mail ($order = array(), $arr_cart = array(), $arr_pro = array())
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
		$data['cart_th_attr'] = ' style="font-weight:bold; background:#efefef; text-align:center; color:#000;"';
		$data['cart_total_attr'] = ' style="background:#ffffff;"';
		//end
				
		$ttH->temp_act->assign('data', $data);
		
		$ttH->temp_act->parse("table_cart_ordering_method.shipping_price");
		
		$ttH->temp_act->parse("table_cart_ordering_method");
		return $ttH->temp_act->text("table_cart_ordering_method");
	}
	
	function do_ordering_complete ()
	{
		global $ttH;	
		$ttH->func->load_language($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS."popup.tpl");
		$ttH->temp_act->assign('CONF', $ttH->conf);
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		$ttH->func->include_css ($ttH->dir_css.$this->modules.'/ordering.css');
		$ttH->func->include_js($ttH->dir_js.'jquery_plugins/jquery.validate.js');
		$ttH->func->include_js($ttH->dir_skin.'js/global/temp.js');
		$ttH->func->include_js($ttH->dir_skin.'js/location/location.js');
		$ttH->func->include_js($ttH->dir_skin.'js/user/user.js');
		$ttH->func->include_js($ttH->dir_skin.'js/'.$this->modules.'/ordering.js');
		
		require_once ($ttH->conf["rootpath"].DS."modules/".$this->modules."/seo_url_short.php");
		
		require_once ($ttH->conf["rootpath"].DS."modules/".$this->modules."/".$this->modules."_func.php");
		
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
				'{o_full_address}',
				'{d_full_name}',
				'{d_email}',
				'{d_phone}',
				'{d_full_address}',
				'{shipping}',
				'{method}',
				'{request_more}',
				'{order_code}',
				'{date_create}'
			);
			$mail_arr_value = array(
				$this->_cart_mail ($order_info, $arr_cart, $arr_pro),
				$order_info["o_full_name"],
				$order_info["o_email"],
				$order_info["o_phone"],
				$ttH->func->full_address($order_info, 'o_'),
				$order_info["d_full_name"],
				$order_info["d_email"],
				$order_info["d_phone"],
				$ttH->func->full_address($order_info, 'd_'),
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
		$data['content'] = $ttH->site->get_banner ('ordering-complete');
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("ordering_complete");
		$output = $ttH->temp_act->text("ordering_complete");
		return $output;
	}
	
  // end class
}
?>