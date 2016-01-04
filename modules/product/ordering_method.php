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
	var $action = "ordering_method";
	var $sub = "manage";
	var $show_method_online = true;
	
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
		
		if(isset($ttH->is_popup)) {
			$link_cart = $ttH->site_func->get_link_popup ('product','cart');
			$ordering_address_link = $ttH->site_func->get_link_popup ('product','ordering_address');
			$ordering_method_link = $ttH->site_func->get_link_popup ('product','ordering_method');
			$ordering_complete_link = $ttH->site_func->get_link_popup ('product','ordering_complete');
		} else {
			$link_cart = $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_cart_link']);
			$ordering_address_link = $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_address_link']);
			$ordering_method_link = $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_method_link']);
			$ordering_complete_link = $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_complete_link']);
		}
		
		$err = '';
		
		//Get cart
		$arr_cart = Session::get('cart_pro', array());
		$arr_cart_list_pro = Session::get('cart_list_pro');
		$ordering_address = Session::Get('ordering_address', array());	
		
		if(count($ordering_address) == 0) {
			$link_go = $ordering_address_link;
			$ttH->html->redirect_rel($link_go);
		}
		
		if(!is_array($arr_cart) || !count($arr_cart) > 0) {
			$ttH->html->redirect_rel($link_cart);
		}
		
		//load order_method
		$order_shipping = $ttH->load_data->data_table ('order_shipping', 'shipping_id', 'shipping_id,price,title,content', "is_show=1 and lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc", array(), array('editor'=>'content'));
		$order_method = $ttH->load_data->data_table ('order_method', 'method_id', '*', "is_show=1 and lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc", array(), array('editor'=>'content'));
		
		if (isset($ttH->post['do_submit'])) {
			
			if (isset($ttH->post['shipping']) && isset($ttH->post['method'])) {
				
				$ordering_address['shipping'] = (isset($ttH->post["shipping"]) && array_key_exists($ttH->post["shipping"], $order_shipping)) ? $ttH->post["shipping"] : '';
				$ordering_address['shipping_price'] = (isset($order_shipping[$ordering_address['shipping']]['price'])) ? $order_shipping[$ordering_address['shipping']]['price'] : 0;
				$ordering_address['method'] = (isset($ttH->post["method"]) && array_key_exists($ttH->post["method"], $order_method)) ? $ttH->post["method"] : '';
				$ordering_address['request_more'] = (isset($ttH->post["request_more"])) ? $ttH->post["request_more"] : '';
				$ordering_address = Session::Set('ordering_address', $ordering_address);	
			} else {
			
				//$arr_color = $ttH->load_data->data_table ('product_color', 'color_id', 'color_id,color,title', "	is_show=1 and lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
				//$arr_size = $ttH->load_data->data_table ('product_size', 'size_id', 'size_id,title', " is_show=1 and lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
				$arr_pro = $ttH->load_data->data_table ('product', 'item_id', 'item_id,picture,price_buy,title,friendly_link ', " is_show=1 and lang='".$ttH->conf['lang_cur']."' and find_in_set(item_id,'".@implode(',',$arr_cart_list_pro)."')>0 order by show_order desc, date_create asc");
				
				$col = array();
				$arr_k = array('full_name','email','phone','address');
				foreach($arr_k as $k) {
					$col['o_'.$k] = (isset($ordering_address['o_'.$k])) ? $ordering_address['o_'.$k] : '';
					$col['d_'.$k] = (isset($ordering_address['d_'.$k])) ? $ordering_address['d_'.$k] : '';
				}
					
				if(empty($err)){
					
					//promotion
					$err_promotion = '';
					$promotion_percent = 0;
					$promotion_code = Session::get('promotion_code');
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
								Session::set ('promotion_code', '');
								$ttH->html->alert($err_promotion,$link_cart);
							} elseif(time() > $row_promotion['date_end']) {
								$err_promotion = $ttH->lang['product']['err_promotion_date_end'];
								Session::set ('promotion_code', '');
								$ttH->html->alert($err_promotion,$link_cart);
							} else {
								$promotion_percent = $row_promotion['percent'];
							}
						} else {
							Session::set ('promotion_code', '');
						}
					}
					$promotion_code = Session::get('promotion_code');
					//End promotion
					
					//voucher
					$err_voucher = '';
					$voucher_amount_has = 0;
					$gift_voucher = Session::get('gift_voucher');
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
								Session::set ('gift_voucher', '');
								$ttH->html->alert($err_voucher,$link_cart);
							} elseif(time() > $row_voucher['date_end']) {
								$err_voucher = $ttH->lang['product']['err_gift_voucher_date_end'];
								Session::set ('gift_voucher', '');
								$ttH->html->alert($err_voucher,$link_cart);
							} else {
								$voucher_amount_has = $row_voucher['amount'] - $row_voucher['amount_use'];
							}
						} else {
							Session::set ('gift_voucher', '');
						}
					}
					$gift_voucher = Session::get('gift_voucher');
					//End voucher
					
					
					$col['shipping'] = (isset($ordering_address['shipping']) && array_key_exists($ordering_address['shipping'], $order_shipping)) ? $ordering_address['shipping'] : '';
					$col['shipping_price'] = (isset($order_shipping[$col['shipping']]['price'])) ? $order_shipping[$col['shipping']]['price'] : 0;
					
					$col['method'] = (isset($ordering_address['method']) && array_key_exists($ordering_address['method'], $order_method)) ? $ordering_address['method'] : '';
		
					$col["request_more"] = (isset($ordering_address["request_more"])) ? $ordering_address["request_more"] : '';
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
						//promotion_percent
						if($promotion_percent > 0 && $promotion_percent < 100) {
							$total_payment = (100-$promotion_percent)/100 * $total_payment;
						}//end
						
						//shipping_price
						if($order_info['shipping_price'] > 0) {
							$total_payment += $order_info['shipping_price'];
						}
						//End
						
						//voucher_amount
						$voucher_amount_has_use = $voucher_amount_has;						
						if($voucher_amount_has > $total_payment) {
							$voucher_amount_has_use = $total_payment;
							$total_payment = 0;
						} else {
							$total_payment -= $voucher_amount_has;
						}//end
						
						//update promotion 
						$ttH->db->query("update promotion 
													set order_id='".$order_id."', 
														date_update=".time()." 
													where promotion_id='".$promotion_code."' ");
						//end
						
						//update voucher 
						$ttH->db->query("update voucher 
													set amount_use=(amount_use+".$voucher_amount_has_use."), 
														date_update=".time()." 
													where voucher_id='".$gift_voucher."' ");
						//end
						
						//update product_order
						$col_up = array();
						$col_up["order_code"] = $order_id.$ttH->func->random_str (5, 'u');
						$col_up["total_order"] = $total_order;
						$col_up["promotion_id"] = $promotion_code;
						$col_up["promotion_percent"] = $promotion_percent;
						$col_up["voucher_id"] = $gift_voucher;
						$col_up["voucher_amount"] = $voucher_amount_has_use;
						$col_up["total_payment"] = $total_payment;
						$ttH->db->do_update("product_order", $col_up, " order_id='".$order_id."'");
						$order_info = array_merge($order_info, $col_up);
						//end
						
						//write log
						$col_log = array();
						$col_log["voucher_id"] = $gift_voucher;
						$col_log["order_code"] = $col_up["order_code"];
						$col_log["amount_type"] = 'buy_product';
						$col_log["amount"] = $voucher_amount_has_use;
						$col_log["amount_has"] = $voucher_amount_has - $voucher_amount_has_use;
						$col_log["date_create"] = time();
						$ttH->db->do_insert("voucher_history", $col_log);
						//end
						
						//$order_method_info = $order_method[$order_info['method']];
						
						$arr_cart = Session::set ('ordering_payment', array(
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
							
						if(isset($order_method[$order_info['method']])) {
							$order_method_info = $order_method[$order_info['method']];
							$file = $ttH->conf['rootpath'].'modules'.DS.'product'.DS.'payment_method'.DS.$order_method_info['name_action'].DS.'payment.php';
							if (file_exists($file)) {
								require_once($file );
								$payment = new Payment;
								
								$link_go = $payment->createRequestUrl(
								$order_info['order_code'] //Mã đơn hàng thanh toán submit lên baokim.vn
								, $ttH->conf['email'] //Email tài khoản nhận thanh toán đăng ký trên baokim.vn
								, $order_info['total_payment'] //Giá trị đơn hàng
								, '' //Phí vận chuyển
								, '' //thuế
								, '' //Mô tả đơn hàng
								, $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_complete_link']).'/?order_id='.$order_info['order_code'].'&token_web='.$arr_cart['token'] //Địa chỉ nhận kết quả trả về từ baokim.vn để cập nhật thông tin thanh toán vào đơn hàng
								, $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_complete_link']).'/?is_action=cancel' //Địa chỉ trả về khi người thanh toán click vào link Từ chối thanh toán
								, $ttH->site->get_link ('home') //Địa chỉ chứa thông tin chi tiết về đơn hàng trên website tích hợp
								, $order_info['o_full_name']
								, $order_info['o_email']
								, $order_info['o_phone']
								, $order_info['o_address']
								);
								$ttH->html->redirect_rel($link_go);
							}
							$link_go = $ordering_complete_link;
							$ttH->html->redirect_rel($link_go);
						}
						$link_go = $ordering_complete_link;
						$ttH->html->redirect_rel($link_go);
					}//End if ok
				}//End if err
			}//End else
		}//End if submit
		
		$output = '';
		$data = $ordering_address;
		$data['content'] = $this->do_cart ();
		$data['content'] .= $this->do_address ();
		
		$data['shipping'] = (isset($ordering_address['shipping']) && array_key_exists($ordering_address['shipping'], $order_shipping)) ? $ordering_address['shipping'] : '';
		$data['method'] = (isset($ordering_address['method']) && array_key_exists($ordering_address['method'], $order_method)) ? $ordering_address['method'] : '';
		$data['request_more'] = isset($ordering_address['request_more']) ? $ordering_address['request_more'] : '';
		if (!empty($data['shipping']) && !isset($ttH->get['change'])) {
			
			$data_tmp = $order_shipping[$ordering_address['shipping']];
			if(isset($ttH->is_popup)) {
				$data_tmp['link_edit'] = $ordering_method_link.'&change=1';
			} else {
				$data_tmp['link_edit'] = $ordering_method_link.'/?change=1';
			}
			
			$data_tmp['price'] = $ttH->func->get_price_format($data_tmp['price'],0);
			
			$ttH->temp_act->assign('data', $data_tmp);
			$ttH->temp_act->parse("ordering_method_shipping_statistic");			
			$data['content'] .= $ttH->temp_act->text("ordering_method_shipping_statistic");
		} else {
			$data['content'] .= $this->do_shipping ($data['shipping']);
		}

		if (!empty($data['method']) && !isset($ttH->get['change'])) {

			$data_tmp = $order_method[$ordering_address['method']];
			if(isset($ttH->is_popup)) {
				$data_tmp['link_edit'] = $ordering_method_link.'&change=1';
			} else {
				$data_tmp['link_edit'] = $ordering_method_link.'/?change=1';
			}
			
			$ttH->temp_act->assign('data', $data_tmp);
			$ttH->temp_act->parse("ordering_method_method_statistic");			
			$data['content'] .= $ttH->temp_act->text("ordering_method_method_statistic");
		} else {
			$data['content'] .= $this->do_method ($data['method']);
		}

		if (!empty($data['request_more']) && !isset($ttH->get['change'])) {
			if(isset($ttH->is_popup)) {
				$link_edit = $ordering_method_link.'&change=1';
			} else {
				$link_edit = $ordering_method_link.'/?change=1';
			}
			
			$ttH->temp_act->assign('link_edit', $link_edit);
			$ttH->temp_act->assign('data', $data);
			$ttH->temp_act->parse("ordering_method.request_more_text");
		} else {
			$ttH->temp_act->assign('data', $data);
			$ttH->temp_act->parse("ordering_method.request_more");
		}
		
		$data['link_action'] = $ordering_method_link;
		$data['link_buy_more'] = $ttH->site->get_link ('product');
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("ordering_method");
		$output .= $ttH->temp_act->text("ordering_method");
		return $output;
	}
	
	function do_cart ()
	{
		global $ttH;	
		
		//$arr_cart = $ttH->cookie->get_cookie ('cart');
		$arr_cart = Session::get('cart_pro', array());
		$arr_cart_list_pro = Session::get('cart_list_pro');
		$ordering_address = Session::Get('ordering_address', array());	
		
		if(isset($ttH->is_popup)) {
			$link_cart = $ttH->site_func->get_link_popup ('product','cart');
			$ordering_address_link = $ttH->site_func->get_link_popup ('product','ordering_address');
			$ordering_method_link = $ttH->site_func->get_link_popup ('product','ordering_method');
			$ordering_complete_link = $ttH->site_func->get_link_popup ('product','ordering_complete');
		} else {
			$link_cart = $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_cart_link']);
			$ordering_address_link = $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_address_link']);
			$ordering_method_link = $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_method_link']);
			$ordering_complete_link = $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_complete_link']);
		}
		
		if(!is_array($arr_cart) || !count($arr_cart) > 0) {
			$ttH->html->redirect_rel($link_cart);
		}
		
		//print_arr($arr_cart);
		//print_arr($arr_cart_list_pro);
		//print_arr($ttH->post);
		//die('aaa');
		
		$arr_color = $ttH->load_data->data_table ('product_color', 'color_id', 'color_id,color,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		$arr_size = $ttH->load_data->data_table ('product_size', 'size_id', 'size_id,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		
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
		}
		
		$data = array();
		$data['cart_total'] = 0;
		if(is_array($arr_cart) && count($arr_cart > 0)){
			foreach($arr_cart as $cart_id => $row) {
				$row_pro = $arr_pro[$row['item_id']];
				
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
				
				/*$row['code_pic'] = (isset($row['code_pic']) && array_key_exists($row['code_pic'], $arr_code_pic)) ? $row['code_pic'] : 0;
				$code_pic = (isset($arr_code_pic[$row['code_pic']]['code_pic'])) ? '<div><span class="code_pic" style="background:'.$arr_code_pic[$row['code_pic']]['code_pic'].';">&nbsp;</span></div>' : '';
				$row['code_pic'] = (isset($arr_code_pic[$row['code_pic']]['title'])) ? $code_pic.$arr_code_pic[$row['code_pic']]['title'] : '';*/
				
				$row['price_buy'] = $ttH->func->get_price_format($row['price_buy'],0);
				$row['total'] = $ttH->func->get_price_format($row['total'],0);
				
				$ttH->temp_act->assign('row', $row);
				$ttH->temp_act->parse("table_cart_ordering_method.row_item");
			}
		} else {
			$ttH->temp_act->assign('row', array('mess' => $ttH->lang['product']['no_have_item']));
			$ttH->temp_act->parse("table_cart_ordering_method.row_empty");
		}
		
		//promotion
		$err_promotion = '';
		$promotion_percent = 0;
		$promotion_code = Session::get('promotion_code', '');
		if($data['cart_total'] >= $ttH->setting['voucher']['min_cart_promotion']) {
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
						$err_promotion = $ttH->lang['product']['err_gift_promotion_date_end'];
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
			$err_promotion = strip_tags($err_promotion);
			$ttH->html->alert($err_promotion, $link_cart);
		}
		//End promotion
		
		//voucher
		$err_voucher = '';
		$voucher_amount_has = 0;
		$gift_voucher = Session::get('gift_voucher');
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
				}
			} else {
				Session::set ('gift_voucher', '');
			}
		}
		$gift_voucher = Session::get('gift_voucher');
		//End voucher
		
		//cart_payment
		$data['cart_payment'] = $data['cart_total'];
		if($promotion_percent > 0 && $promotion_percent < 100) {
			$data['cart_payment'] = (100-$promotion_percent)/100 * $data['cart_payment'];
		}//End
		
		//shipping_price
		$data['shipping_price'] = (isset($ordering_address['shipping_price'])) ? $ordering_address['shipping_price'] : 0;
		if($data['shipping_price'] > 0) {
			$data['cart_payment'] += $data['shipping_price'];
		}//End
		
		//voucher_amount
		$voucher_amount_has_out = $voucher_amount_has;
		if($voucher_amount_has > $data['cart_payment']) {
			$voucher_amount_has_out = $data['cart_payment'];
			$data['cart_payment'] = 0;
		} else {
			$data['cart_payment'] -= $voucher_amount_has;
		}//End
		
		if($data['cart_payment'] <= 0 || $data['cart_payment'] > 9990) {
			$this->show_method_online = false;
		}
		
		$data['cart_total'] = $ttH->func->get_price_format($data['cart_total'], 0);
		$data['promotion_percent'] = $promotion_percent;
		$data['shipping_price_out'] = $ttH->func->get_price_format($data['shipping_price'],0);
		$data['voucher_amount'] = $voucher_amount_has;
		$data['voucher_amount_out'] = $ttH->func->get_price_format($voucher_amount_has_out, 0);
		$data['cart_payment'] = $ttH->func->get_price_format($data['cart_payment'], 0);
		$data['link_action'] = $link_cart;
		$data['link_ordering_address'] = $ordering_address_link;
		$data['link_edit'] = $link_cart;
				
		$ttH->temp_act->assign('data', $data);
		
		if(isset($ordering_address['shipping_price'])) {
			$ttH->temp_act->parse("table_cart_ordering_method.shipping_price");
		}
		
		$ttH->temp_act->parse("table_cart_ordering_method");
		return $ttH->temp_act->text("table_cart_ordering_method");
	}
	
	function do_address ()
	{
		global $ttH;
		
		//print_arr($ttH->data['user_cur']);
		$arr_k = array('full_name','email','phone','address');
		$ordering_address = Session::Get('ordering_address', array());	
		
		if(isset($ttH->is_popup)) {
			$link_address = $ttH->site_func->get_link_popup ('product','ordering_address');
		} else {
			$link_address = $ttH->site->get_link ('product',$ttH->setting['product']['ordering_friendly_link'],$ttH->setting['product']['ordering_address_link']);
		}
		if(!is_array($ordering_address) || !count($ordering_address) > 0) {
			$ttH->html->redirect_rel($link_address);
		}
		
		$data = array();
		foreach($arr_k as $k) {
			
			$tmp = (isset($ttH->data['user_cur'][$k])) ? $ttH->data['user_cur'][$k] : '';
			if($k == 'full_name' && empty($tmp)) {
				$tmp = (isset($ttH->data['user_cur']['nickname'])) ? $ttH->data['user_cur']['nickname'] : '';
			}
			
			$data['o_'.$k] = (isset($ordering_address['o_'.$k])) ? $ordering_address['o_'.$k] : $tmp;
			$data['d_'.$k] = (isset($ordering_address['d_'.$k])) ? $ordering_address['d_'.$k] : $tmp;
		}
		
		$data['link_edit'] = $link_address;
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("ordering_method_address");
		return $ttH->temp_act->text("ordering_method_address");
	}
	
	function do_shipping ($cur = '')
	{
		global $ttH;
		
		$output = '';
		
		$sql = "select shipping_id,picture,price,title,content 
						from order_shipping  
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
					$row['shipping_checked'] = ($row['shipping_id'] == $cur) ? ' checked="checked"' : '';
				} else {
					$row['shipping_checked'] = ($i == 1) ? ' checked="checked"' : '';
				}
				
				$row['price'] = $ttH->func->get_price_format($row['price'], 0);
				$row['content'] = $ttH->func->input_editor_decode($row['content']);
				
				$ttH->temp_act->assign('row', $row);
				$ttH->temp_act->parse("ordering_method_shipping.row");
			}
			
			$ttH->temp_act->parse("ordering_method_shipping");
			return $ttH->temp_act->text("ordering_method_shipping");
		}
		
		return $output;
	}
	
	function do_method ($cur = '')
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
				
				if($this->show_method_online == false && $row['name_action']) {
					continue;
				}
				
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
	
  // end class
}
?>