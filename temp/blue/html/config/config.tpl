<!-- BEGIN: main -->
<div class="row">
  <div class="col-lg-12">
    <h1>{data.page_title}</h1>
    <ol class="breadcrumb">
      <li><a href="index.html"><i class="fa fa-dashboard"></i> Dashboard</a></li>
      <li class="active"><i class="fa fa-edit"></i> Forms</li>
    </ol>
  </div>
</div>
{data.main} 
<!-- END: main --> 

<!-- BEGIN: edit --> 
<form action="{data.link_action}" method="post" enctype="multipart/form-data" name="myForm" id="myForm" role="form">
  <div class="row">
  	<div class="col-lg-12">{data.err}</div>
    <div class="col-lg-6">
    	<h1>{LANG.config.general_config}</h1>
      <div class="form-group">
        <label>{LANG.config.email}</label>
        <input name="email" id="email" type="text" size="50" maxlength="150" value="{data.email}" class="form-control">
        <p class="help-block">Example block-level help text here.</p>
      </div>
      <div class="form-group">
        <label>{LANG.config.list_skin}</label>
        {data.list_skin}
      </div>
      <div class="form-group">
        <label>{LANG.config.n_list}</label>
        <input name="n_list" id="n_list" type="text" size="4" value="{data.n_list}" class="form-control">
      </div>
      <h1>{LANG.config.user_config}</h1>
      <div class="form-group">
        <label>{LANG.config.signup_method}</label>
        {data.list_signup_method}
      </div>
    </div>
    <div class="col-lg-6">
      <h1>{LANG.config.send_email_config}</h1>
      <div class="form-group">
        <label>{LANG.config.method_email}</label>
        {data.list_method_email}
      </div>
      <div class="form-group">
        <label>{LANG.config.smtp_host}</label>
        <input name="smtp_host" id="smtp_host" type="text" size="50" maxlength="150" value="{data.smtp_host}" class="form-control">
      </div>
      <div class="form-group">
        <label>{LANG.config.smtp_username}</label>
        <input name="smtp_username" id="smtp_username" type="text" size="50" maxlength="150" value="{data.smtp_username}" class="form-control">
      </div>
      <div class="form-group">
        <label>{LANG.config.smtp_password}</label>
        <input name="smtp_password" id="smtp_password" type='password' size="50" maxlength="150" value="{data.smtp_password}" class="form-control">
      </div>
    </div>
  </div>
  <div class="row" align="center">
  	<input type="hidden" name="do_submit"	 value="1" />
    <button type="submit" class="btn btn-default">{LANG.global.btn_submit}</button>
    <button type="reset" class="btn btn-default">{LANG.global.btn_reset}</button>
  </div>
</form>
<!-- END: edit --> 
