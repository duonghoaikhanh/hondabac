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
	var $action = "cart";
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
		$ttH->func->include_js($ttH->dir_skin.'js/global/temp.js');
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
			'meta_title' => (isset($ttH->setting['product']["ordering_cart_meta_title"])) ? $ttH->setting['product']["ordering_cart_meta_title"] : '',
			'meta_key' => (isset($ttH->setting['product']["ordering_cart_meta_key"])) ? $ttH->setting['product']["ordering_cart_meta_key"] : '',
			'meta_desc' => (isset($ttH->setting['product']["ordering_cart_meta_desc"])) ? $ttH->setting['product']["ordering_cart_meta_desc"] : ''
		));
		$ttH->conf["cur_group"] = 0;
		
		$data = array();
		$data['content'] = $this->do_cart();
		$data['box_left'] = box_left();
		$data['box_column'] = box_column();
	
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("main");
		$ttH->output .=  $ttH->temp_act->text("main");
	}
	
	function do_cart ()
	{
		global $ttH;	
		
		//$arr_cart = $ttH->cookie->get_cookie ('cart');
		$arr_cart = Session::get('cart_pro', array());
		$arr_cart_list_pro = Session::get('cart_list_pro');
		Session::Delete('ordering_address');
		
		$arr_color = $ttH->load_data->data_table ('product_color', 'color_id', 'color_id,color,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		$arr_size = $ttH->load_data->data_table ('product_size', 'size_id', 'size_id,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		
		$err = '';
		
		if(isset($ttH->post['item_id'])) {
			$item_id = ($ttH->post['item_id'] > 0) ? $ttH->post['item_id'] : 0;
			$color = (isset($ttH->post['color'])) ? $ttH->post['color'] : 0;
			$size = (isset($ttH->post['size'])) ? $ttH->post['size'] : 0;
			//$code_pic = (isset($ttH->post['code_pic'])) ? $ttH->post['code_pic'] : 0;
			
			if(isset($ttH->post['combine'])) {
				$combine = explode('_',$ttH->post['combine']);
				$color = (isset($combine[0]) && $combine[0] > 0) ? $combine[0] : 0;
				$size = (isset($combine[1]) && $combine[1] > 0) ? $combine[1] : 0;
			}
			
			$quantity = (isset($ttH->post['quantity']) && $ttH->post['quantity'] > 0) ? $ttH->post['quantity'] : 1;
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
			}
		}
		
		/*print_arr($arr_cart);
		print_arr($arr_cart_list_pro);
		print_arr($gift_voucher);
		print_arr($ttH->post);*/
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
			
			if(isset($ttH->post['item_id']) && $ttH->post['item_id'] == $row['item_id'] && !empty($err)) {
				$err = str_replace('{product_'.$ttH->post['item_id'].'}',$row['title'],$err);
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
				
				/*$row['code_pic'] = (isset($row['code_pic']) && array_key_exists($row['code_pic'], $arr_code_pic)) ? $row['code_pic'] : 0;
				$code_pic = (isset($arr_code_pic[$row['code_pic']]['code_pic'])) ? '<div><span class="code_pic" style="background:'.$arr_code_pic[$row['code_pic']]['code_pic'].';">&nbsp;</span></div>' : '';
				$row['code_pic'] = (isset($arr_code_pic[$row['code_pic']]['title'])) ? $code_pic.$arr_code_pic[$row['code_pic']]['title'] : '';*/
				
				$row['price_buy_text'] = $ttH->func->get_price_format($row['price_buy']);
				$row['quantity_text'] = list_quantity('quantity[]', $row['quantity'], ' for="'.$cart_id.'" class="quantity"');
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
		$promotion_code = (isset($ttH->post['promotional_code'])) ? $ttH->post['promotional_code'] : Session::get('promotion_code');
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
		}
		//End promotion
		
		//voucher
		$err_voucher = '';
		$voucher_amount_has = 0;
		$gift_voucher = (isset($ttH->post['gift_voucher'])) ? $ttH->post['gift_voucher'] : Session::get('gift_voucher');
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
		$data['min_cart_promotion'] = $ttH->setting['voucher']['min_cart_promotion'];
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
	
  // end class
}
?>