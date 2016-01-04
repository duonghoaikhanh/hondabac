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
  	<div class="col-lg-12">{data.err}</div>
  </div>
  <div class="row">
    <div class="col-lg-6 col-md-6">
      <div class="form-group">
        <label>Số sản phẩm trên 1 trang</label>
        {data.list_num_list}
      </div>
    </div>
    <div class="col-lg-6 col-md-6">
      <div class="form-group">
        <label>Số sản phẩm khác</label>
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
    	<h2>{LANG.product.setting_product}</h2>
      <div class="form-group">
        <label>{LANG.global.meta_title}</label>
        <input name="product_meta_title" id="product_meta_title" type="text" size="50" maxlength="150" value="{data.product_meta_title}" class="form-control">
        <p class="help-block">{LANG.global.meta_title_note}</p>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.meta_key}</label>
        <textarea name="product_meta_key" id="product_meta_key" class="form-control" rows="1">{data.product_meta_key}</textarea>
        <p class="help-block">{LANG.global.meta_key_note}</p>
      </div>
    </div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.meta_desc}</label>
        <textarea name="product_meta_desc" id="product_meta_desc" class="form-control" rows="1">{data.product_meta_desc}</textarea>
        <p class="help-block">{LANG.global.meta_desc_note}</p>
      </div>
    </div>
  </div>
  <div class="row">
  	<div class="col-lg-12"><h2>{LANG.product.setting_brand}</h2></div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.friendly_link}</label>
        <input name="brand_friendly_link" id="brand_friendly_link" type="text" size="50" maxlength="150" value="{data.brand_friendly_link}" class="form-control">
        <p class="help-block">{LANG.global.friendly_link_note}</p>
      </div>
    </div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.meta_title}</label>
        <input name="brand_meta_title" id="brand_meta_title" type="text" size="50" maxlength="150" value="{data.brand_meta_title}" class="form-control">
        <p class="help-block">{LANG.global.meta_title_note}</p>
      </div>
    </div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.meta_key}</label>
        <textarea name="meta_key" id="brand_meta_key" class="form-control" rows="1">{data.brand_meta_key}</textarea>
        <p class="help-block">{LANG.global.meta_key_note}</p>
      </div>
    </div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.meta_desc}</label>
        <textarea name="brand_meta_desc" id="brand_meta_desc" class="form-control" rows="1">{data.brand_meta_desc}</textarea>
        <p class="help-block">{LANG.global.meta_desc_note}</p>
      </div>
    </div>
  </div>
  <div class="row">
  	<div class="col-lg-12"><h2>{LANG.product.setting_ordering}</h2></div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.friendly_link}</label>
        <input name="ordering_friendly_link" id="ordering_friendly_link" type="text" size="50" maxlength="150" value="{data.ordering_friendly_link}" class="form-control">
        <p class="help-block">{LANG.global.friendly_link_note}</p>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-6">
    	<h3>{LANG.product.ordering_cart}</h3>
      <div class="form-group">
        <label>{LANG.product.ordering_cart_link}</label>
        <input name="ordering_cart_link" id="ordering_cart_link" type="text" size="50" maxlength="150" value="{data.ordering_cart_link}" class="form-control">
        <p class="help-block">{LANG.global.friendly_link_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_title}</label>
        <input name="ordering_cart_meta_title" id="ordering_cart_meta_title" type="text" size="50" maxlength="150" value="{data.ordering_cart_meta_title}" class="form-control">
        <p class="help-block">{LANG.global.meta_title_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_key}</label>
        <textarea name="meta_key" id="ordering_cart_meta_key" class="form-control" rows="1">{data.ordering_cart_meta_key}</textarea>
        <p class="help-block">{LANG.global.meta_key_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_desc}</label>
        <textarea name="ordering_cart_meta_desc" id="ordering_cart_meta_desc" class="form-control" rows="1">{data.ordering_cart_meta_desc}</textarea>
        <p class="help-block">{LANG.global.meta_desc_note}</p>
      </div>
    </div>
    <div class="col-lg-6">
    	<h3>{LANG.product.ordering_address}</h3>
      <div class="form-group">
        <label>{LANG.product.ordering_address_link}</label>
        <input name="ordering_address_link" id="ordering_address_link" type="text" size="50" maxlength="150" value="{data.ordering_address_link}" class="form-control">
        <p class="help-block">{LANG.global.friendly_link_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_title}</label>
        <input name="ordering_address_meta_title" id="ordering_address_meta_title" type="text" size="50" maxlength="150" value="{data.ordering_address_meta_title}" class="form-control">
        <p class="help-block">{LANG.global.meta_title_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_key}</label>
        <textarea name="meta_key" id="ordering_address_meta_key" class="form-control" rows="1">{data.ordering_address_meta_key}</textarea>
        <p class="help-block">{LANG.global.meta_key_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_desc}</label>
        <textarea name="ordering_address_meta_desc" id="ordering_address_meta_desc" class="form-control" rows="1">{data.ordering_address_meta_desc}</textarea>
        <p class="help-block">{LANG.global.meta_desc_note}</p>
      </div>
    </div>
    <div class="col-lg-6">
    	<h3>{LANG.product.ordering_method}</h3>
      <div class="form-group">
        <label>{LANG.product.ordering_method_link}</label>
        <input name="ordering_method_link" id="ordering_method_link" type="text" size="50" maxlength="150" value="{data.ordering_method_link}" class="form-control">
        <p class="help-block">{LANG.global.friendly_link_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_title}</label>
        <input name="ordering_method_meta_title" id="ordering_method_meta_title" type="text" size="50" maxlength="150" value="{data.ordering_method_meta_title}" class="form-control">
        <p class="help-block">{LANG.global.meta_title_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_key}</label>
        <textarea name="meta_key" id="ordering_method_meta_key" class="form-control" rows="1">{data.ordering_method_meta_key}</textarea>
        <p class="help-block">{LANG.global.meta_key_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_desc}</label>
        <textarea name="ordering_method_meta_desc" id="ordering_method_meta_desc" class="form-control" rows="1">{data.ordering_method_meta_desc}</textarea>
        <p class="help-block">{LANG.global.meta_desc_note}</p>
      </div>
    </div>
    <div class="col-lg-6">
    	<h3>{LANG.product.ordering_complete}</h3>
      <div class="form-group">
        <label>{LANG.product.ordering_complete_link}</label>
        <input name="ordering_complete_link" id="ordering_complete_link" type="text" size="50" maxlength="150" value="{data.ordering_complete_link}" class="form-control">
        <p class="help-block">{LANG.global.friendly_link_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_title}</label>
        <input name="ordering_complete_meta_title" id="ordering_complete_meta_title" type="text" size="50" maxlength="150" value="{data.ordering_complete_meta_title}" class="form-control">
        <p class="help-block">{LANG.global.meta_title_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_key}</label>
        <textarea name="meta_key" id="ordering_complete_meta_key" class="form-control" rows="1">{data.ordering_complete_meta_key}</textarea>
        <p class="help-block">{LANG.global.meta_key_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_desc}</label>
        <textarea name="ordering_complete_meta_desc" id="ordering_complete_meta_desc" class="form-control" rows="1">{data.ordering_complete_meta_desc}</textarea>
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
