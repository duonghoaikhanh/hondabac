<!-- BEGIN: main -->
<div class="row">
  <div class="col-lg-12">
    <h1>{data.page_title}</h1>
    <ol class="breadcrumb">
      <li><a href="{data.link_manage}" {data.class.manage}><i class="fa fa-th-list"></i> {LANG.global.manage}</a></li>
      <li><a href="{data.link_import}" {data.class.import}><i class="fa fa-edit"></i> Nhập kho</a></li>
      <li><a href="{data.link_add}" {data.class.add}><i class="fa fa-edit"></i> Thêm màu và size cho sản phẩm</a></li>
    </ol>
  </div>
</div>
{data.main} 
<!-- END: main --> 

<!-- BEGIN: add -->
<form action="{data.link_action}" method="post" enctype="multipart/form-data" name="myForm" id="myForm" role="form">
  <div class="row">
    <div class="col-lg-12">{data.err}</div>
  </div>
  <!-- BEGIN: row -->
  <div class="row row_input">
  	<div class="col-lg-12"><h3>Size cho màu sản phẩm: dòng {data.index}</h3></div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.product.color}</label>
        {data.list_color}
      </div>
      <div class="form-group">
        <label>{LANG.product.size}</label>
        {data.list_size}
      </div>
    </div>
  </div>
  <!-- END: row --> 
  <div class="row" align="center">
    <input type="hidden" name="do_submit"	 value="1" />
    <button type="submit" class="btn btn-default">{LANG.global.btn_submit}</button>
    <button type="reset" class="btn btn-default">{LANG.global.btn_reset}</button>
  </div>
</form>
<!-- END: add --> 

<!-- BEGIN: edit -->
<form action="{data.link_action}" method="post" enctype="multipart/form-data" name="myForm" id="myForm" role="form">
  <div class="row">
    <div class="col-lg-12">{data.err}</div>
  </div>
  <div class="row row_input">
    <div class="col-lg-6">
      <div class="form-group">
        <label>Chọn chuyên mục</label>
        {data.list_type}
      </div>
    </div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.title}</label>
        <input name="title" id="title" type="text" size="50" maxlength="150" value="{data.title}" class="form-control">
      </div>
    </div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.picture}</label>
        <div>{data.pic}</div>
        <div class="input-append">
          <div class="form-group input-group">
          	<a class="input-group-addon" type="button" href="javascript:void(0)" onclick="clear_input('picture')">
            	<img src="{DIR_IMAGE}icon_clear.png" height="18" />
            </a>
            <input class="form-control" name="picture" id="picture" type="text" value="{data.picture}" readonly="readonly">
            <a class="input-group-addon iframe-btn" type="button" href="{data.link_up}">Chọn hình</a>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-12">
      <div class="form-group">
        <label>{LANG.global.content}</label>
        <textarea name="content" class="form-control" rows="3">{row.content}</textarea>
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

<!-- BEGIN: import --> 
<div class="row">
  <div class="col-lg-12">{data.list_type}</div>
</div>
<br />
{data.err}
<form action="{data.link_action}" method="post" enctype="multipart/form-data" name="myForm" id="myForm" role="form">
	<div class="row">
    <div class="col-lg-12">
      <div class="form-group">
        <div id="div_type">
          <label class="radio-inline">
            <input type="radio" name="import_type" value="new" checked="checked" onclick="changce_type_import();">
            Tạo phiếu nhập kho mới
          </label>
          <label class="radio-inline">
            <input type="radio" name="import_type" value="has" onclick="changce_type_import();">
            Thêm vào phiếu đã có
          </label>
        </div>
      </div>
    </div>
  </div>
  <div class="row" id="div_import_new">
    <div class="col-lg-12">
      <div class="form-group">
        <label>{LANG.global.title}</label>
        <input name="title" id="title" type="text" size="50" maxlength="150" value="{data.title}" class="form-control">
      </div>
    </div>
  </div>
  <div class="row" id="div_import_has">
    <div class="col-lg-12">
      <div class="form-group">
        <label>Phiếu đã có</label>
        {data.list_product_receipt_import}
      </div>
    </div>
  </div>
  <script language="javascript">changce_type_import();</script>
  <div class="row">
    <div class="col-lg-12">
      <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped table_row">
          <thead>
            <tr >
              <th class="header">{LANG.product.color}</th>
              <th class="header" >{LANG.product.size}</th>
              <th class="header" width="15%">Tồn kho</th>
              <th class="header" width="15%">Đã xuất</th>
              <th class="header" width="15%">Nhập kho</th>
            </tr>
          </thead>
          <tbody>
          	<!-- BEGIN: row_item -->
            <tr id="row_{row.pic_id}">
              <td class="cot"><span style="background:{row.color.color}; border:1px solid #000;">&nbsp;&nbsp;&nbsp;&nbsp;</span> {row.color.title}</td>
              <td class="cot">{row.size.title}</td>
              <td class="cot" align="right">{row.in_stock}</td>
              <td class="cot" align="right">{row.out_stock}</td>
              <td class="cot" align="center"><input type="text" value="{row.import}" name="import[{row.id}]" size="4" style="text-align:center;"></td>
            </tr>
            <!-- END: row_item --> 
          	<!-- BEGIN: row_empty -->
            <tr class="warning">
              <td align="center" colspan="6">{row.mess}</td>
            </tr>
            <!-- END: row_empty --> 
          </tbody>
        </table>
      </div>
      <div class="row" align="center">
        <input type="hidden" name="do_submit"	 value="1" />
        <button type="submit" class="btn btn-default">{LANG.global.btn_submit}</button>
        <button type="reset" class="btn btn-default">{LANG.global.btn_reset}</button>
      </div>
    </div>
  </div>
</form>
<!-- END: import --> 

<!-- BEGIN: manage --> 
<div class="row">
  <div class="col-lg-12">{data.list_type}</div>
</div>
<br  />
{data.err}
<form action="{data.link_action}" method="post" name="manage" id="manage">
  <div class="row">
    <div class="col-lg-12">
      <div class="table_btn table_btn_top">
        <img class="icon_arrow" src="{DIR_IMAGE}arrow_down.png" />
        <button type="button" class="btn btn-default" onclick="do_submit('do_edit')" value="{LANG.global.btn_update}" name="btnEdit">{LANG.global.btn_update}</button>
        <div class="clear"></div>
      </div>
      <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped table_row">
          <thead>
            <tr >
              <th class="header" width="3%"><input id="checkall" class="checkbox" type="checkbox" name="checkall" value="all"/></th>
              <th class="header" >{data.f_color_id}</th>
              <th class="header" >{data.f_size_id}</th>
              <th class="header" width="15%">{data.f_in_stock}</th>
              <th class="header" width="15%">{data.f_out_stock}</th>
            </tr>
          </thead>
          <tbody>
          	<!-- BEGIN: row_item -->
            <tr id="row_{row.pic_id}">
              <td class="cot" align="center"><input class="checkbox" type="checkbox" value="{row.pic_id}" name="selected_id[]"></td>
              <td class="cot"><span style="background:{row.color.color}; border:1px solid #000;">&nbsp;&nbsp;&nbsp;&nbsp;</span> {row.color.title}</td>
              <td class="cot">{row.size.title}</td>
              <td class="cot" align="right">{row.in_stock}</td>
              <td class="cot" align="right">{row.out_stock}</td>
            </tr>
            <!-- END: row_item --> 
          	<!-- BEGIN: row_empty -->
            <tr class="warning">
              <td align="center" colspan="5">{row.mess}</td>
            </tr>
            <!-- END: row_empty --> 
          </tbody>
        </table>
      </div>
      <div class="table_btn table_btn_buttom">
        <img class="icon_arrow" src="{DIR_IMAGE}arrow_up.png" />
        <button type="button" class="btn btn-default" onclick="do_submit('do_edit')" value="{LANG.global.btn_update}" name="btnEdit">{LANG.global.btn_update}</button>
        <div class="clear"></div>
      </div>
      <div class="table_nav">{data.nav}</div>
    </div>
  </div>
</form>
<!-- END: manage --> 