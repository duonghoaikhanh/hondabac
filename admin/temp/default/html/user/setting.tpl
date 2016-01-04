<!-- BEGIN: main -->
<div class="row">
  <div class="col-lg-12">
    <h1>{data.page_title}</h1>
    <ol class="breadcrumb">
      <!--<li><a href="{data.link_manage}" {data.class.manage}><i class="fa fa-wrench"></i> {LANG.global.config}</a></li>-->
      <li><a href="{data.link_seo}" {data.class.seo}><i class="fa fa-book"></i> {LANG.global.seo}</a></li>
    </ol>
  </div>
</div>
{data.main} 
<!-- END: main -->

<!-- BEGIN: setting --> 
<form action="{data.link_action}" method="post" enctype="multipart/form-data" name="myForm" id="myForm" role="form">
  <div class="row">
  	<div class="col-lg-12">{data.err}</div>
  </div>
  <div class="row">
    <div class="col-lg-4">
      <div class="form-group">
        <label>Số sản phẩm trên 1 trang</label>
        {data.list_num_list}
      </div>
    </div>
  </div>
  <div class="row" align="center">
  	<input type="hidden" name="do_submit"	 value="1" />
    <button type="submit" class="btn btn-default">{LANG.global.btn_submit}</button>
    <button type="reset" class="btn btn-default">{LANG.global.btn_reset}</button>
  </div>
</form>
<!-- END: setting --> 

<!-- BEGIN: seo --> 
<form action="{data.link_action}" method="post" enctype="multipart/form-data" name="myForm" id="myForm" role="form">
  <div class="row">
  	<div class="col-lg-12">{data.err}</div>
  </div>
  <div class="row">
    <div class="col-lg-6">
    	<h2>{LANG.user.setting_user}</h2>
      <div class="form-group">
        <label>{LANG.global.meta_title}</label>
        <input name="user_meta_title" id="user_meta_title" type="text" size="50" maxlength="150" value="{data.user_meta_title}" class="form-control">
        <p class="help-block">{LANG.global.meta_title_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_key}</label>
        <textarea name="user_meta_key" id="user_meta_key" class="form-control" rows="1">{data.user_meta_key}</textarea>
        <p class="help-block">{LANG.global.meta_key_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_desc}</label>
        <textarea name="user_meta_desc" id="user_meta_desc" class="form-control" rows="1">{data.user_meta_desc}</textarea>
        <p class="help-block">{LANG.global.meta_desc_note}</p>
      </div>
    </div>
    <div class="col-lg-6">
    	<h2>{LANG.user.setting_signup}</h2>
      <div class="form-group">
        <label>{LANG.global.friendly_link}</label>
        <input name="signup_link" id="signup_link" type="text" size="50" maxlength="150" value="{data.signup_link}" class="form-control">
        <p class="help-block">{LANG.global.friendly_link_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_title}</label>
        <input name="signup_meta_title" id="signup_meta_title" type="text" size="50" maxlength="150" value="{data.signup_meta_title}" class="form-control">
        <p class="help-block">{LANG.global.meta_title_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_key}</label>
        <textarea name="meta_key" id="signup_meta_key" class="form-control" rows="1">{data.signup_meta_key}</textarea>
        <p class="help-block">{LANG.global.meta_key_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_desc}</label>
        <textarea name="signup_meta_desc" id="signup_meta_desc" class="form-control" rows="1">{data.signup_meta_desc}</textarea>
        <p class="help-block">{LANG.global.meta_desc_note}</p>
      </div>
    </div>
    <div class="col-lg-6">
    	<h2>{LANG.user.setting_signin}</h2>
      <div class="form-group">
        <label>{LANG.global.friendly_link}</label>
        <input name="signin_link" id="signin_link" type="text" size="50" maxlength="150" value="{data.signin_link}" class="form-control">
        <p class="help-block">{LANG.global.friendly_link_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_title}</label>
        <input name="signin_meta_title" id="signin_meta_title" type="text" size="50" maxlength="150" value="{data.signin_meta_title}" class="form-control">
        <p class="help-block">{LANG.global.meta_title_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_key}</label>
        <textarea name="meta_key" id="signin_meta_key" class="form-control" rows="1">{data.signin_meta_key}</textarea>
        <p class="help-block">{LANG.global.meta_key_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_desc}</label>
        <textarea name="signin_meta_desc" id="signin_meta_desc" class="form-control" rows="1">{data.signin_meta_desc}</textarea>
        <p class="help-block">{LANG.global.meta_desc_note}</p>
      </div>
    </div>
    <div class="col-lg-6">
    	<h2>{LANG.user.setting_change_pass}</h2>
      <div class="form-group">
        <label>{LANG.global.friendly_link}</label>
        <input name="change_pass_link" id="change_pass_link" type="text" size="50" maxlength="150" value="{data.change_pass_link}" class="form-control">
        <p class="help-block">{LANG.global.friendly_link_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_title}</label>
        <input name="change_pass_meta_title" id="change_pass_meta_title" type="text" size="50" maxlength="150" value="{data.change_pass_meta_title}" class="form-control">
        <p class="help-block">{LANG.global.meta_title_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_key}</label>
        <textarea name="meta_key" id="change_pass_meta_key" class="form-control" rows="1">{data.change_pass_meta_key}</textarea>
        <p class="help-block">{LANG.global.meta_key_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_desc}</label>
        <textarea name="change_pass_meta_desc" id="change_pass_meta_desc" class="form-control" rows="1">{data.change_pass_meta_desc}</textarea>
        <p class="help-block">{LANG.global.meta_desc_note}</p>
      </div>
    </div>
    <div class="col-lg-6">
    	<h2>{LANG.user.setting_forget_pass}</h2>
      <div class="form-group">
        <label>{LANG.global.friendly_link}</label>
        <input name="forget_pass_link" id="forget_pass_link" type="text" size="50" maxlength="150" value="{data.forget_pass_link}" class="form-control">
        <p class="help-block">{LANG.global.friendly_link_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_title}</label>
        <input name="forget_pass_meta_title" id="forget_pass_meta_title" type="text" size="50" maxlength="150" value="{data.forget_pass_meta_title}" class="form-control">
        <p class="help-block">{LANG.global.meta_title_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_key}</label>
        <textarea name="meta_key" id="forget_pass_meta_key" class="form-control" rows="1">{data.forget_pass_meta_key}</textarea>
        <p class="help-block">{LANG.global.meta_key_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_desc}</label>
        <textarea name="forget_pass_meta_desc" id="forget_pass_meta_desc" class="form-control" rows="1">{data.forget_pass_meta_desc}</textarea>
        <p class="help-block">{LANG.global.meta_desc_note}</p>
      </div>
    </div>
    <div class="col-lg-6">
    	<h2>{LANG.user.setting_ordering}</h2>
      <div class="form-group">
        <label>{LANG.global.friendly_link}</label>
        <input name="ordering_link" id="ordering_link" type="text" size="50" maxlength="150" value="{data.ordering_link}" class="form-control">
        <p class="help-block">{LANG.global.friendly_link_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_title}</label>
        <input name="ordering_meta_title" id="ordering_meta_title" type="text" size="50" maxlength="150" value="{data.ordering_meta_title}" class="form-control">
        <p class="help-block">{LANG.global.meta_title_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_key}</label>
        <textarea name="meta_key" id="ordering_meta_key" class="form-control" rows="1">{data.ordering_meta_key}</textarea>
        <p class="help-block">{LANG.global.meta_key_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_desc}</label>
        <textarea name="ordering_meta_desc" id="ordering_meta_desc" class="form-control" rows="1">{data.ordering_meta_desc}</textarea>
        <p class="help-block">{LANG.global.meta_desc_note}</p>
      </div>
    </div>
    <div class="col-lg-6">
    	<h2>{LANG.user.setting_promotion}</h2>
      <div class="form-group">
        <label>{LANG.global.friendly_link}</label>
        <input name="promotion_link" id="promotion_link" type="text" size="50" maxlength="150" value="{data.promotion_link}" class="form-control">
        <p class="help-block">{LANG.global.friendly_link_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_title}</label>
        <input name="promotion_meta_title" id="promotion_meta_title" type="text" size="50" maxlength="150" value="{data.promotion_meta_title}" class="form-control">
        <p class="help-block">{LANG.global.meta_title_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_key}</label>
        <textarea name="meta_key" id="promotion_meta_key" class="form-control" rows="1">{data.promotion_meta_key}</textarea>
        <p class="help-block">{LANG.global.meta_key_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_desc}</label>
        <textarea name="promotion_meta_desc" id="promotion_meta_desc" class="form-control" rows="1">{data.promotion_meta_desc}</textarea>
        <p class="help-block">{LANG.global.meta_desc_note}</p>
      </div>
    </div>
    <div class="col-lg-6">
    	<h2>{LANG.user.setting_voucher}</h2>
      <div class="form-group">
        <label>{LANG.global.friendly_link}</label>
        <input name="voucher_link" id="voucher_link" type="text" size="50" maxlength="150" value="{data.voucher_link}" class="form-control">
        <p class="help-block">{LANG.global.friendly_link_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_title}</label>
        <input name="voucher_meta_title" id="voucher_meta_title" type="text" size="50" maxlength="150" value="{data.voucher_meta_title}" class="form-control">
        <p class="help-block">{LANG.global.meta_title_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_key}</label>
        <textarea name="meta_key" id="voucher_meta_key" class="form-control" rows="1">{data.voucher_meta_key}</textarea>
        <p class="help-block">{LANG.global.meta_key_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_desc}</label>
        <textarea name="voucher_meta_desc" id="voucher_meta_desc" class="form-control" rows="1">{data.voucher_meta_desc}</textarea>
        <p class="help-block">{LANG.global.meta_desc_note}</p>
      </div>
    </div>
  </div>
  <div class="row" align="center">
  	<input type="hidden" name="do_submit"	 value="1" />
    <button type="submit" class="btn btn-default">{LANG.global.btn_submit}</button>
    <button type="reset" class="btn btn-default">{LANG.global.btn_reset}</button>
  </div>
</form>
<!-- END: seo --> 
