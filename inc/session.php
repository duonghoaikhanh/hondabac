<?php

class Session
{
	
	static public function session_pre()
  {
		global $conf;
		return md5($conf['rooturl']);
  }
	
  static public function Exists($name)
  {
		$name = Session::session_pre().$name;
    return isset($_SESSION[$name]);
  }

  static public function IsEmpty($name)
  {
		$name = Session::session_pre().$name;
    return empty($_SESSION[$name]);
  }

  static public function Get($name, $default = '')
  {
		$name = Session::session_pre().$name;
    return (isset($_SESSION[$name]) ? $_SESSION[$name] : $default);
  }

  static public function Set($name, $value)
  {
		$name = Session::session_pre().$name;
		$_SESSION[$name] = $value;
		return Session::get ($name, $value);  
  }

  static public function Delete($name)
  {
		$name = Session::session_pre().$name;
    $output = true;
    if (isset($_SESSION[$name])) {
			unset($_SESSION[$name]);
		}
        
    return $output;
  }
}

?>