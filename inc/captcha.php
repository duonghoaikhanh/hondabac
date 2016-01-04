<?php

class Captcha
{	
  static public function Check($in_captcha)
  {
		$captcha = Captcha::Get();
		if($captcha == $in_captcha) {
			return 1;
		}
		return 0;
  }

  static public function Set()
  {
		$ranStr = md5(microtime()); // Lấy chuỗi rồi mã hóa md5
		$ranStr = substr($ranStr, 0, 6);    // Cắt chuỗi lấy 6 ký tự
		return Session::Set('captcha', $ranStr);
  }

  static public function Get()
  {
		return Session::Get('captcha', 'Error');
  }

  static public function pic()
  {		
		$captcha = Captcha::Get ();
		if($captcha == 'Error') {
			$captcha = Captcha::Set ();
		}
		
		header("Content-Type: image/gif");
		$im = @imagecreate(60, 22)
				or die("Cannot Initialize new GD image stream");
		$background_color = imagecolorallocate($im, 255, 255, 255);
		$text_color = imagecolorallocate($im, 0, 0, 0);
		imagestring($im, 14, 2, 2,  $captcha, $text_color);
		imagepng($im);
		imagedestroy($im);
  }
}

?>