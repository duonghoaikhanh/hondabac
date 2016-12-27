<?php

/**
 *	
 *		Phiên bản: 1.1   
 *		Tên lớp: BaoKimPayment
 *		Chức năng: Tích hợp thanh toán qua baokim.vn cho các merchant site có đăng ký API
 *						- Xây dựng URL chuyển thông tin tới baokim.vn để xử lý việc thanh toán cho merchant site.
 *						- Xác thực tính chính xác của thông tin đơn hàng được gửi về từ baokim.vn.
 *		
 */

class Payment 
{
	// URL checkout của baokim.vn
	private $baokim_url = 'https://www.baokim.vn/payment/order/version11';

	// Mã merchante site 
	private $merchant_id = '1234';	// Biến này được baokim.vn cung cấp khi bạn đăng ký merchant site

	// Mật khẩu bảo mật
	private $secure_pass = 'DED01D1CFF3BE2767196FF0080F6DB6D5C'; // Biến này được baokim.vn cung cấp khi bạn đăng ký merchant site
	
	/**
	 * Lấy config từ cấu hình
	 */
	public function __construct()
	{
		global $ttH;
		require_once($ttH->conf['rootpath'].'modules'.DS.'product'.DS.'payment_method'.DS.'config'.DS.'baokim.php' ); //include config
		
		$this->baokim_url = $config['checkout_url'];
		$this->business = $config['business'];
		$this->merchant_id = $config['merchant_id'];
		$this->secure_pass = $config['secure_pass'];
		
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
		, $total_amount
		, $shipping_fee
		, $tax_fee
		, $order_description
		, $url_success
		, $url_cancel
		, $url_detail
		, $payer_name=null
		, $payer_email=null
		, $payer_phone_no=null
		, $shipping_address=null
		, $currency='VND')
	{
		// Mảng các tham số chuyển tới baokim.vn
		$params = array(
			'merchant_id'		=>	strval($this->merchant_id),
			'order_id'			=>	strval($order_id),
			'business'			=>	strval($this->business),//strval($business),
			'total_amount'		=>	strval($total_amount),
			'shipping_fee'		=>  strval($shipping_fee),
			'tax_fee'			=>  strval($tax_fee),
			'order_description'	=>	strval($order_description),
			'url_success'		=>	strtolower($url_success),
			'url_cancel'		=>	strtolower($url_cancel),
			'url_detail'		=>	strtolower($url_detail),
			'payer_name'		=>  strval($payer_name),
			'payer_email'		=> 	strval($payer_email),
			'payer_phone_no'	=> 	strval($payer_phone_no),
			'shipping_address'  =>  strval($shipping_address),
			'currency'			=>  strval($currency)
		);
		ksort($params);

		$params['checksum']=hash_hmac('SHA1',implode('',$params),$this->secure_pass);

		//Kiểm tra  biến $redirect_url xem có '?' không, nếu không có thì bổ sung vào
		$redirect_url = $this->baokim_url;
		if (strpos($redirect_url, '?') === false)
		{
			$redirect_url .= '?';
		}
		else if (substr($redirect_url, strlen($redirect_url)-1, 1) != '?' && strpos($redirect_url, '&') === false)
		{
			// Nếu biến $redirect_url có '?' nhưng không kết thúc bằng '?' và có chứa dấu '&' thì bổ sung vào cuối
			$redirect_url .= '&';
		}

		// Tạo đoạn url chứa tham số
		$url_params = '';
		foreach ($params as $key=>$value)
		{
			if ($url_params == '')
				$url_params .= $key . '=' . urlencode($value);
			else
				$url_params .= '&' . $key . '=' . urlencode($value);
		}
		return $redirect_url.$url_params;
	}
	
	/**
	 * Hàm thực hiện xác minh tính chính xác thông tin trả về từ BaoKim.vn
	 * @param $url_params chứa tham số trả về trên url
	 * @return true nếu thông tin là chính xác, false nếu thông tin không chính xác
	 */
	public function verifyResponseUrl($url_params = array())
	{
		if(empty($url_params['checksum'])){
			echo "invalid parameters: checksum is missing";
			return FALSE;
		}

		$checksum = $url_params['checksum'];
		unset($url_params['checksum']);
		
		ksort($url_params);

		if(strcasecmp($checksum,hash_hmac('SHA1',implode('',$url_params),$this->secure_pass))===0) {
			
			//Xử lý khi giao dịch hoàn thành
			if($url_params['transaction_status'] == 4) {
				return TRUE;
			} else {
				return FALSE;
			}
			//End
			//return TRUE;
		}
		else {
			return FALSE;
		}
	}
}
?>