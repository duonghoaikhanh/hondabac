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
			$this->PAYPAL_URL = "https://www.sandbox.paypal.com/webscr?cmd=_xclick";
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
		
		$ordering_payment = Session::get ('ordering_payment' ,array());
		
		$paymentType = "Sale";
		$first_name = explode(' ',trim($payer_name));
		$first_name = $first_name[0];
		$last_name = trim(str_replace($first_name, '', $payer_name));
		
		// Mảng các tham số chuyển tới baokim.vn
		$params = array(
			'business' => strval($this->business),
			'item_name' => strval('Order '.$order_id),
			'item_number' => strval($order_id),
			'amount' => strval($paymentAmount),
			'tax' => strval('0'),
			'quantity' => strval('1'),
			'no_note' => strval('1'),
			'currency_code' => strval($currencyCodeType),
			'address_override' => strval('1'),
			'first_name' => strval($first_name),
			'last_name' => strval($last_name),
			//'address1' => strval($shipping_address),
			'return' => strval($returnURL.'/?order_id='.$order_id.'&transaction_status=4&token='.$ordering_payment['token']),
			'cancel_return' => strval($cancelURL)
		);
		ksort($params);

		$params['checksum']=hash_hmac('SHA1',implode('',$params),$this->API_Password);

		//Kiểm tra  biến $redirect_url xem có '?' không, nếu không có thì bổ sung vào
		$redirect_url = $this->PAYPAL_URL;
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
		/*$url_params = '';
		foreach ($params as $key=>$value)
		{
			if ($url_params == '')
				$url_params .= $key . '=' . urlencode($value);
			else
				$url_params .= '&' . $key . '=' . urlencode($value);
		}*/
		
		//echo $redirect_url.$url_params;
		
		echo '<html><body>
		<div>Loading ...</div>
		<form id="myForm" name="myForm" action="'.$redirect_url.'" method="POST">';
		foreach ($params as $key=>$value)
		{
			echo '<input type=hidden name="'.$key.'" value="'.$value.'"/>';
		}
		echo'</form><script type="text/javascript">
document.getElementById("myForm").submit();
</script></body></html>';
		die();
		
		return $redirect_url.$url_params;
	}
	
	/**
	 * Hàm xây dựng url chuyển đến paypal thực hiện thanh toán, trong đó có tham số mã hóa (còn gọi là public key)
	 */
	public function CallMarkExpressCheckout(
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
		//------------------------------------------------------------------------------------------------------------------------------------
		// Construct the parameter string that describes the SetExpressCheckout API call in the shortcut implementation
		
		$nvpstr="&PAYMENTREQUEST_0_AMT=". $paymentAmount;
		$nvpstr = $nvpstr . "&PAYMENTREQUEST_0_PAYMENTACTION=" . "Sale";//$paymentType;
		$nvpstr = $nvpstr . "&RETURNURL=" . $returnURL;
		$nvpstr = $nvpstr . "&CANCELURL=" . $cancelURL;
		$nvpstr = $nvpstr . "&PAYMENTREQUEST_0_CURRENCYCODE=" . $currencyCodeType;
		$nvpstr = $nvpstr . "&ADDROVERRIDE=1";
		$nvpstr = $nvpstr . "&PAYMENTREQUEST_0_SHIPTONAME=" . $shipToName;
		$nvpstr = $nvpstr . "&PAYMENTREQUEST_0_SHIPTOSTREET=" . $shipToStreet;
		$nvpstr = $nvpstr . "&PAYMENTREQUEST_0_SHIPTOSTREET2=" . $shipToStreet2;
		$nvpstr = $nvpstr . "&PAYMENTREQUEST_0_SHIPTOCITY=" . $shipToCity;
		$nvpstr = $nvpstr . "&PAYMENTREQUEST_0_SHIPTOSTATE=" . $shipToState;
		$nvpstr = $nvpstr . "&PAYMENTREQUEST_0_SHIPTOCOUNTRYCODE=" . $shipToCountryCode;
		$nvpstr = $nvpstr . "&PAYMENTREQUEST_0_SHIPTOZIP=" . $shipToZip;
		$nvpstr = $nvpstr . "&PAYMENTREQUEST_0_SHIPTOPHONENUM=" . $phoneNum;
		
		$_SESSION["currencyCodeType"] = $currencyCodeType;	  
		$_SESSION["PaymentType"] = $paymentType;

		//'--------------------------------------------------------------------------------------------------------------- 
		//' Make the API call to PayPal
		//' If the API call succeded, then redirect the buyer to PayPal to begin to authorize payment.  
		//' If an error occured, show the resulting errors
		//'---------------------------------------------------------------------------------------------------------------
		$resArray=$this->hash_call("SetExpressCheckout", $nvpstr);
		$ack = strtoupper($resArray["ACK"]);
		if($ack=="SUCCESS" || $ack=="SUCCESSWITHWARNING")
		{
			$token = urldecode($resArray["TOKEN"]);
			$_SESSION['TOKEN']=$token;
		}
		   
		return $resArray;
	}
	
	/**
	  '-------------------------------------------------------------------------------------------------------------------------------------------
	  * hash_call: Function to perform the API call to PayPal using API signature
	  * @methodName is name of API  method.
	  * @nvpStr is nvp string.
	  * returns an associtive array containing the response from the server.
	  '-------------------------------------------------------------------------------------------------------------------------------------------
	*/
	public function hash_call($methodName,$nvpStr)
	{

		//setting the curl parameters.
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL,$this->API_Endpoint);
		curl_setopt($ch, CURLOPT_VERBOSE, 1);

		//turning off the server and peer verification(TrustManager Concept).
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);

		curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
		curl_setopt($ch, CURLOPT_POST, 1);
		
	    //if USE_PROXY constant set to TRUE in Constants.php, then only proxy will be enabled.
	   //Set proxy name to PROXY_HOST and port number to PROXY_PORT in constants.php 
		if($this->USE_PROXY)
			curl_setopt ($ch, CURLOPT_PROXY, $this->PROXY_HOST. ":" . $this->PROXY_PORT); 

		//NVPRequest for submitting to server
		$nvpreq="METHOD=" . urlencode($methodName) . "&VERSION=" . urlencode($this->version) . "&PWD=" . urlencode($this->API_Password) . "&USER=" . urlencode($this->API_UserName) . "&SIGNATURE=" . urlencode($this->API_Signature) . $nvpStr . "&BUTTONSOURCE=" . urlencode($this->sBNCode);

		//setting the nvpreq as POST FIELD to curl
		curl_setopt($ch, CURLOPT_POSTFIELDS, $nvpreq);

		//getting response from server
		$response = curl_exec($ch);

		//convrting NVPResponse to an Associative Array
		$nvpResArray=$this->deformatNVP($response);
		$nvpReqArray=$this->deformatNVP($nvpreq);
		$_SESSION['nvpReqArray']=$nvpReqArray;

		if (curl_errno($ch)) 
		{
			// moving to display page to display curl errors
			  $_SESSION['curl_error_no']=curl_errno($ch) ;
			  $_SESSION['curl_error_msg']=curl_error($ch);

			  //Execute the Error handling module to display errors. 
		} 
		else 
		{
			 //closing the curl
		  	curl_close($ch);
		}

		return $nvpResArray;
	}

	/*'----------------------------------------------------------------------------------
	 Purpose: Redirects to PayPal.com site.
	 Inputs:  NVP string.
	 Returns: 
	----------------------------------------------------------------------------------
	*/
	public function RedirectToPayPal ( $token )
	{
		
		// Redirect to paypal.com here
		$payPalURL = $this->PAYPAL_URL . $token;
		header("Location: ".$payPalURL);
		exit;
	}

	
	/*'----------------------------------------------------------------------------------
	 * This function will take NVPString and convert it to an Associative Array and it will decode the response.
	  * It is usefull to search for a particular key and displaying arrays.
	  * @nvpstr is NVPString.
	  * @nvpArray is Associative Array.
	   ----------------------------------------------------------------------------------
	  */
	public function deformatNVP($nvpstr)
	{
		$intial=0;
	 	$nvpArray = array();

		while(strlen($nvpstr))
		{
			//postion of Key
			$keypos= strpos($nvpstr,'=');
			//position of value
			$valuepos = strpos($nvpstr,'&') ? strpos($nvpstr,'&'): strlen($nvpstr);

			/*getting the Key and Value values and storing in a Associative Array*/
			$keyval=substr($nvpstr,$intial,$keypos);
			$valval=substr($nvpstr,$keypos+1,$valuepos-$keypos-1);
			//decoding the respose
			$nvpArray[urldecode($keyval)] =urldecode( $valval);
			$nvpstr=substr($nvpstr,$valuepos+1,strlen($nvpstr));
	     }
		return $nvpArray;
	}
	
	/**
	 * Hàm thực hiện xác minh tính chính xác thông tin trả về từ BaoKim.vn
	 * @param $url_params chứa tham số trả về trên url
	 * @return true nếu thông tin là chính xác, false nếu thông tin không chính xác
	 */
	public function verifyResponseUrl($url_params = array())
	{
		$ordering_payment = Session::get ('ordering_payment');
		
		if(empty($url_params['order_id']) && empty($url_params['token'])){
			echo "Access denied";
			return FALSE;
		}
		
		if($ordering_payment['order_code'] == $url_params['order_id'] && $ordering_payment['order_code'] == $url_params['token']) {
			if($url_params['transaction_status'] == 4) {
				return FALSE;
				//return TRUE;
			} else {
				return FALSE;
			}
		}	else {
			return FALSE;
		}
	}
}
?>