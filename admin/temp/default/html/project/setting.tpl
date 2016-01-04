<!-- BEGIN: main -->
<div class="row">
  <div class="col-lg-12">
    <h1>{data.page_title}</h1>
    <ol class="breadcrumb">
      <li><a href="{data.link_manage}" {data.class.manage}><i class="fa fa-wrench"></i> {LANG.global.config}</a></li>
      <li><a href="{data.link_seo}" {data.class.seo}><i class="fa fa-book"></i> {LANG.global.seo}</a></li>
    </ol>
  </div>
</div>
{data.main} 
<!-- END: main --> 

<!-- BEGIN: setting --> 
<form action="{data.link_action}" method="post" enctype="multipart/form-data" name="myForm" id="myForm" role="form">
  <div class="row">
  	<div class="col-md-12">{data.err}</div>
  </div>
  <div class="row">
    <div class="col-md-6">
      <div class="form-group">
        <label>Số item / trang</label>
        {data.list_num_list}
      </div>
    </div>
    <div class="col-md-6">
      <div class="form-group">
        <label>Số trang khác</label>
        {data.list_num_order_detail}
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
    	<h3>{LANG.project.setting_project}</h3>
      <div class="form-group">
        <label>{LANG.global.meta_title}</label>
        <input name="project_meta_title" id="project_meta_title" type="text" size="50" maxlength="150" value="{data.project_meta_title}" class="form-control">
        <p class="help-block">{LANG.global.meta_title_note}</p>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.meta_key}</label>
        <textarea name="project_meta_key" id="project_meta_key" class="form-control" rows="1">{data.project_meta_key}</textarea>
        <p class="help-block">{LANG.global.meta_key_note}</p>
      </div>
    </div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.meta_desc}</label>
        <textarea name="project_meta_desc" id="project_meta_desc" class="form-control" rows="1">{data.project_meta_desc}</textarea>
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
