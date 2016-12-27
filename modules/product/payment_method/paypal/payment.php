<?php

/********************************************
PayPal API Module
 
Defines all the global variables and the wrapper functions 
********************************************/

class Payment 
{

	private $PROXY_HOST = '127.0.0.1';
	private $PROXY_PORT = '808';
	private $SandboxFlag = true;
	//'------------------------------------
	//' PayPal API Credentials
	//' Replace <API_USERNAME> with your API Username
	//' Replace <API_PASSWORD> with your API Password
	//' Replace <API_SIGNATURE> with your Signature
	//'------------------------------------
	private $business="<EMAIL>";
	private $API_UserName="<API_USERNAME>";
	private $API_Password="<API_PASSWORD>";
	private $API_Signature="<API_SIGNATURE>";
	// BN Code 	is only applicable for partners
	private $sBNCode = "PP-ECWizard";
	
	private $API_Endpoint = "https://api-3t.paypal.com/nvp";
	private $PAYPAL_URL = "https://www.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=";
	
	private $USE_PROXY = false;
	private $version="93";
	
	/**
	 * Lấy config từ cấu hình
	 */
	public function __construct()
	{
		global $ttH;
		require_once($ttH->conf['rootpath'].'modules'.DS.'product'.DS.'payment_method'.DS.'config'.DS.'paypal.php' ); //include config
		
		$this->PROXY_HOST = $config['PROXY_HOST'];
		$this->PROXY_PORT = $config['PROXY_PORT'];
		$this->SandboxFlag = $config['SandboxFlag'];
		$this->business = $config['business'];
		$this->API_UserName = $config['API_UserName'];
		$this->API_Password = $config['API_Password'];
		$this->API_Signature = $config['API_Signature'];
		$this->sBNCode = $config['sBNCode'];
		
		if ($this->SandboxFlag == true || $this->SandboxFlag == 'true') 
		{
			$this->API_Endpoint = "https://api-3t.sandbox.paypal.com/nvp";
			$this->PAYPAL_URL = "https://www.sandbox.paypal.com/webscr?cmd=_express-checkout&token=";
		}
		
		return FALSE;
	}

	/**
	 * Hàm xây dựng url chuyển đến BaoKim.vn thực hiện thanh toán, trong đó có tham số mã hóa (còn gọi là public key)
	 * @param $order_id				Mã đơn hàng
	 * @param $business 			Email tài khoản người bán
	 * @param $total_amount			Giá trị đơn hàng
	 * @param $shipping_fee			Phí vận chuyển
	 * @param $tax_fee				Thuế
	 * @param $order_description	Mô tả đơn hàng
	 * @param $url_success			Url trả về khi thanh toán thành công
	 * @param $url_cancel			Url trả về khi hủy thanh toán
	 * @param $url_detail			Url chi tiết đơn hàng
	 * @return url cần tạo
	 */
	public function createRequestUrl(
		$order_id
		, $business
		, $paymentAmount
		, $shipping_fee
		, $tax_fee
		, $order_description
		, $returnURL
		, $cancelURL
		, $url_detail
		, $payer_name=null
		, $payer_email=null
		, $payer_phone_no=null
		, $shipping_address=null
		, $currencyCodeType='SGD')
	{
		global $ttH;
		
		$ordering_payment = Session::get ('ordering_payment', array());
		
		$params = array (
			'USER' => $this->API_UserName, 
			'PWD' => $this->API_Password, 
			'SIGNATURE' => $this->API_Signature, 
			'METHOD' => 'SetExpressCheckout', 
			'RETURNURL' => $returnURL, 
			//'NOTIFYURL' => $returnURL, 
			'CANCELURL' => $cancelURL, 
			'VERSION' => '93.0', 
			//'BRANDNAME' => 'Công ty TNHH một thành viên Đầm Bầu',
			'LOGOIMG' => $ttH->conf['rooturl'].'logo-on-paypal.png',
			'CHANNELTYPE' => 'Merchant',
			'CARTBORDERCOLOR' => '9b1386',
			'PAYMENTREQUEST_0_CURRENCYCODE' => $currencyCodeType, 
			'PAYMENTREQUEST_0_PAYMENTACTION' => 'Order', 
			'PAYMENTREQUEST_0_INVNUM' => $order_id, 
			'PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID' => $this->business, 
			'PAYMENTREQUEST_0_PAYMENTREQUESTID' => $order_id
		);
		
		$arr_size = $ttH->load_data->data_table ('product_size', 'size_id', 'size_id,title', "	lang='".$ttH->conf['lang_cur']."' order by show_order desc, date_create desc");
		
		
		$sql = "select * 
						from product_order 
						where order_code='".$order_id."' ";
		//echo $sql;
		$result = $ttH->db->query($sql);
		if ($order_info = $ttH->db->fetch_row($result)) {
			$params['PAYMENTREQUEST_0_ITEMAMT'] = 0;
			
			$sql_cart = "select * 
							from product_order_detail 
							where order_id='".$order_info['order_id']."' ";
			//echo $sql;
			$result_cart = $ttH->db->query($sql_cart);
			$i = 0;
			while ($row_cart = $ttH->db->fetch_row($result_cart)) {			
				$params['L_PAYMENTREQUEST_0_NAME'.$i] = $row_cart['title'];
				if(isset($arr_size[$row_cart['size_id']]['title'])) {
					$params['L_PAYMENTREQUEST_0_DESC'.$i] = 'Size: '.$arr_size[$row_cart['size_id']]['title'];
				}
				$params['L_PAYMENTREQUEST_0_QTY'.$i] = $row_cart['quantity'];
				$params['L_PAYMENTREQUEST_0_AMT'.$i] = $row_cart['price_buy'];
				
				$params['PAYMENTREQUEST_0_ITEMAMT'] += $row_cart['quantity'] * $row_cart['price_buy'];
				$i++;
			}			
			
			$params['PAYMENTREQUEST_0_SHIPPINGAMT'] = $order_info['shipping_price'];
			$params['PAYMENTREQUEST_0_SHIPDISCAMT'] = 0;
			$params['PAYMENTREQUEST_0_AMT'] = $params['PAYMENTREQUEST_0_ITEMAMT'];
			
			//promotion_percent
			if($order_info['promotion_percent'] > 0 && $order_info['promotion_percent'] < 100) {
				$params['PAYMENTREQUEST_0_AMT'] = (100-$order_info['promotion_percent'])/100 * $params['PAYMENTREQUEST_0_AMT'];
				$params['PAYMENTREQUEST_0_AMT'] = round($params['PAYMENTREQUEST_0_AMT'], 2);
			}//end
			
			//shipping_price
			if($order_info['shipping_price'] > 0) {
				$params['PAYMENTREQUEST_0_AMT'] += $order_info['shipping_price'];
			}
			//End
			
			//voucher_amount					
			if($order_info['voucher_amount'] > 0) {
				$params['PAYMENTREQUEST_0_AMT'] -= $order_info['voucher_amount'];
			}
			$params['PAYMENTREQUEST_0_SHIPDISCAMT'] = $params['PAYMENTREQUEST_0_ITEMAMT'] - $params['PAYMENTREQUEST_0_AMT'] + $order_info['shipping_price'];
			$params['PAYMENTREQUEST_0_SHIPDISCAMT'] = round($params['PAYMENTREQUEST_0_SHIPDISCAMT'], 2);
			$params['PAYMENTREQUEST_0_SHIPDISCAMT'] = -$params['PAYMENTREQUEST_0_SHIPDISCAMT'];
		}
		
		//print_arr($params);
		//die();
		
		$data = http_build_query($params);
		//echo $data;
		
		$context_options = array (
		'http' => array (
				'method' => 'POST',
				'header'=> "Content-type: application/x-www-form-urlencoded\r\n"
						. "Content-Length: " . strlen($data) . "\r\n",
				'content' => $data
				)
		);
	
		$context = stream_context_create($context_options);
		$result = @file_get_contents($this->API_Endpoint,false,$context); 
		//echo $result;
		//die();
		$arr_tmp = explode('&',$result);
		
		$array = array();
		foreach($arr_tmp as $v) {
			$tmp = explode('=',$v);
			$array[$tmp[0]] = $tmp[1];
		}
		
		$ordering_payment['token_paypal'] = $array['TOKEN'];
		Session::set ('ordering_payment', $ordering_payment);
		
		return $this->PAYPAL_URL.$array['TOKEN'];
	}
	
	
	/**
	 * Hàm thực hiện xác minh tính chính xác thông tin trả về từ BaoKim.vn
	 * @param $url_params chứa tham số trả về trên url
	 * @return true nếu thông tin là chính xác, false nếu thông tin không chính xác
	 */
	public function verifyResponseUrl($url_params = array())
	{
		$ordering_payment = Session::get ('ordering_payment');
		
		if(empty($url_params['order_id']) && empty($url_params['token_web']) && empty($url_params['token'])){
			echo "Access denied";
			return FALSE;
		}
		
		if($ordering_payment['order_code'] == $url_params['order_id'] 
			&& $ordering_payment['token'] == $url_params['token_web'] 
			&& urldecode($ordering_payment['token_paypal']) == $url_params['token']) {
			return TRUE;
		}	else {
			return FALSE;
		}
	}
}
?>