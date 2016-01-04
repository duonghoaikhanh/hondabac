<!-- BEGIN: main -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>{LANG.admin.f_login}</title>
<link rel="stylesheet" href="{DIR_CSS}admin/login.css">
</head>

<body>
<div id="tth-login">
	<div class="tth-login-title"><div class="title_back"></div>Login</div>
	<div id="tth-login-content">
  	{data.err}
    <form id="formSearch" name="formSearch" method="post" action="{data.link_action}" onSubmit="return check_login(this);" class="box_search">
      <div class="form_login">
        <div class="login_row">
          <label><div class="label_back"></div>Username</label>
          <input id="username" name="username" class="input_text" type="text" value="">
        </div>
        <div class="login_row">
          <label><div class="label_back"></div>Password</label>
          <input id="password" name="password" class="input_text" type="password" value="">
        </div>
        <div class="login_action">
          <input type="hidden" name="do_submit"	 value="1" />
          <button type="submit" class="btn_login">Login<div class="btn_back"></div></button>
        </div>
      </div>				
    </form>
  </div>
</div>
</body>
</html>
<!-- END: main --> 