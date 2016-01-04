<!-- BEGIN: main -->
<div class="row">
  <div class="col-md-12">
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
  	<div class="col-md-12">{data.err}</div>
  </div>
  <div class="row">
    <div class="col-md-6">
    	<h3>{LANG.config.general_config}</h3>
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
      <div class="form-group">
        <label>{LANG.config.hotline}</label>
        <input name="hotline" id="hotline" type="text" size="50" maxlength="150" value="{data.hotline}" class="form-control">
      </div>
      <div class="form-group">
        <label>{LANG.config.hotline} support</label>
        <input name="hotline_support" id="hotline_support" type="text" size="50" maxlength="250" value="{data.hotline_support}" class="form-control">
      </div>
      <div class="form-group">
        <label>Fax</label>
        <input name="fax" id="fax" type="text" size="50" maxlength="150" value="{data.fax}" class="form-control">
      </div>
      <div class="form-group">
        <label class="checkbox-inline">
          <input name="is_under_construction" type="checkbox" value="1" {data.checked_is_under_construction}>
          <strong>Bật trang ở chế độ đang xây dựng</strong>
        </label>
      </div>
    </div>
    <div class="col-md-6">
      <h3>{LANG.config.send_email_config}</h3>
      <div class="form-group">
        <label>{LANG.config.method_email}</label>
        {data.list_method_email}
      </div>
      <div class="form-group">
        <label>{LANG.config.smtp_host}</label>
        <input name="smtp_host" id="smtp_host" type="text" size="50" maxlength="150" value="{data.smtp_host}" class="form-control">
      </div>
      <div class="form-group">
        <label>{LANG.config.smtp_port}</label>
        <input name="smtp_port" id="smtp_port" type="text" size="50" maxlength="150" value="{data.smtp_port}" class="form-control">
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
    <div class="col-md-6">
      <h3>Cấu hình truy cập</h3>
      <div class="form-group">
        <label>Số truy cập ban đầu</label>
        <input name="visitors_start" id="visitors_start" type="text" size="50" maxlength="150" value="{data.visitors_start}" class="form-control">
      </div>
    </div>
    <div class="col-md-6">
      <h3>Cấu hình mạng xã hội</h3>
      <div class="form-group">
        <label>Liên kết chia sẽ</label>
        <input name="share_link" id="share_link" type="text" size="50" maxlength="150" value="{data.share_link}" class="form-control">
      </div>
      <div class="form-group">
        <label>Tiêu đề chia sẽ</label>
        <input name="share_title" id="share_title" type="text" size="50" maxlength="150" value="{data.share_title}" class="form-control">
      </div>
      <div class="form-group">
        <label>Fanpage Facebook</label>
        <input name="fanpage_facebook" id="fanpage_facebook" type="text" size="50" maxlength="150" value="{data.fanpage_facebook}" class="form-control">
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
