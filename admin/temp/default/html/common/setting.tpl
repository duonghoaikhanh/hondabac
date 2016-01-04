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

<!-- BEGIN: edit -->
<form action="{data.link_action}" method="post" enctype="multipart/form-data" name="myForm" id="myForm" role="form">
  <div class="row">
    <div class="col-md-12">{data.err}</div>
  </div>
  <div class="row">
    <!-- BEGIN: element -->
    {row.before}
    <div class="col-md-{row.form_col}">
      <div class="form-group">
      	<!-- BEGIN: title -->
        <label>{row.title}</label>
        <!-- END: title --> 
        {row.content} 
      </div>
    </div>
    <!-- END: element --> 
  </div>
  <div class="row" align="center">
    <input type="hidden" name="do_submit"	 value="1" />
    <button type="submit" class="btn btn-default">{LANG.global.btn_submit}</button>
    <button type="reset" class="btn btn-default">{LANG.global.btn_reset}</button>
  </div>
</form>
<!-- END: edit --> 