<!-- BEGIN: main -->
<div class="row">
  <div class="col-lg-12">
    <h1>{data.page_title}</h1>
    <ol class="breadcrumb">
      <li><a href="{data.link_manage}" {data.class.manage}><i class="fa fa-th-list"></i> {LANG.global.manage}</a></li>
      <li><a href="{data.link_add}" {data.class.add}><i class="fa fa-edit"></i> {LANG.global.add}</a></li>
    </ol>
  </div>
</div>
{data.main} 
<!-- END: main --> 

<!-- BEGIN: add -->
<script language="javascript">
function html_row_sub_pro(data)
{	
	return ttHTemp.join ('<div id="sub_'+data.type+'_'+data.type_id+'" class="popup_limit" style="min-width:500px;">')
  ('<div class="table-responsive">')
    ('<table class="table table-bordered table-hover table-striped table_row">')
      ('<thead>')
        ('<tr >')
          ('<th class="header">{LANG.global.color}</th>')
          ('<th class="header" >{LANG.global.size}</th>')
          ('<th class="header" width="15%">{LANG.global.quantity}</th>')
        ('</tr>')
      ('</thead>')
      ('<tbody>')
        <!-- BEGIN: row_sub_item -->
        ('<tr>')
          ('<td class="cot"><span style="background:{row.color.color}; border:1px solid #000;">&nbsp;&nbsp;&nbsp;&nbsp;</span> {row.color.title}</td>')
          ('<td class="cot">{row.size.title}</td>')
          ('<td class="cot" align="center"><input type="text" value="{row.import}" class="update_value" name="import_sub[p'+data.type_id+'_{row.sub_id}]" size="4" style="text-align:center;"></td>')
        ('</tr>')
        <!-- END: row_sub_item --> 
      ('</tbody>')
    ('</table>')
  ('</div>')
  ('<div align="right">')
  	('<button type="submit" class="btn btn-default" onclick="$.fancybox.close();">{LANG.global.btn_submit}</button>')
  ('</div>')
('</div>');
}
</script>

<form action="{data.link_action}" method="post" enctype="multipart/form-data" name="myForm" id="myForm" role="form">
  <div class="row">
    <div class="col-lg-12">{data.err}</div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.repository.receipt_code}</label>
        <input name="receipt_code" id="receipt_code" type="text" size="50" maxlength="150" value="{data.receipt_code}" class="form-control">
      </div>
    </div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.repository.repository}</label>
        {data.list_repository}
      </div>
    </div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>Chọn sản phẩm</label>
        {data.list_product}
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-12">
      <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped table_row">
          <thead>
            <tr >
              <th class="header">{LANG.repository.product}</th>
              <th class="header" width="15%">{LANG.global.price_import}</th>
              <th class="header" width="15%">{LANG.global.quantity}</th>
              <th class="header" width="10%">{LANG.repository.detail}</th>
            </tr>
          </thead>
          <tbody id="tbody_product">
          	<!-- BEGIN: row_item -->
            <tr>
              <td class="cot">{row.title}</td>
              <td class="cot" align="center"><input type="text" value="{row.price}" name="import[{row.price}]" size="4" style="text-align:center;"></td>
              <td class="cot" align="center"><input type="text" value="{row.import}" name="import[{row.item_id}]" size="4" style="text-align:center;"></td>
              <td class="cot" align="center"><a href="#sub_{row.type}_{row.type_id}" class="fancybox">Click</a></td>
            </tr>
            <!-- END: row_item --> 
          	<!-- BEGIN: row_empty -->
            <tr class="warning">
              <td align="center" colspan="4">{row.mess}</td>
            </tr>
            <!-- END: row_empty --> 
          </tbody>
        </table>
      </div>
      <div id="list_sub" style="display:none;">
        <script language="javascript">add_pro_row();</script>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.date_create}</label>
        <div class="form-group input-group">
          <span class="input-group-addon">Ngày</span>
          <input name="date_create" id="date_create" type="text" size="50" maxlength="150" value="{data.date_create}" class="form-control datepicker" readonly="readonly">
          <span class="input-group-addon ">Giờ</span>
          <span class="input-group-addon has_input">
          	{data.list_hour}
          </span>
          <span class="input-group-addon has_input">:</span>
          <span class="input-group-addon has_input">
          	{data.list_minute}
          </span>
        </div>
      </div>
    </div>
  </div>
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
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.repository.receipt_code}</label>
        <p>{data.receipt_code}</p>
      </div>
    </div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.repository.repository}</label>
        <p>{data.repository.title}</p>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-12">
      <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped table_row">
          <thead>
            <tr >
              <th class="header">{LANG.repository.product}</th>
              <th class="header" width="15%">{LANG.global.price_import}</th>
              <th class="header" width="15%">{LANG.global.quantity}</th>
              <th class="header" width="10%">{LANG.repository.detail}</th>
            </tr>
          </thead>
          <tbody id="tbody_product">
          	<!-- BEGIN: row_item -->
            <tr>
              <td class="cot">{row.product.title}</td>
              <td class="cot" align="center"><input type="text" value="{row.price}" name="price[{row.type_id}]" size="4" style="text-align:center;"></td>
              <td class="cot" align="center"><input type="text" id="{row.type}_{row.type_id}" value="{row.quantity}" name="import[{row.item_id}]" size="4" style="text-align:center;"></td>
              <td class="cot" align="center">{row.view_detail}</td>
            </tr>
            <!-- END: row_item --> 
          	<!-- BEGIN: row_empty -->
            <tr class="warning">
              <td align="center" colspan="4">{row.mess}</td>
            </tr>
            <!-- END: row_empty --> 
          </tbody>
        </table>
      </div>
      <div id="list_sub" style="display:none;">
      	<!-- BEGIN: row_sub -->
      	<div id="sub_{data.list_id}" class="popup_limit" style="min-width:500px;">
          <div class="table-responsive">
            <table class="table table-bordered table-hover table-striped table_row">
              <thead>
                <tr >
                  <th class="header">{LANG.global.color}</th>
                  <th class="header" >{LANG.global.size}</th>
                  <th class="header" width="20%">{LANG.global.quantity}</th>
                </tr>
              </thead>
              <tbody>
              	{data.list}
                <!-- BEGIN: row_sub_item -->
                <tr>
                  <td class="cot"><span style="background:{row.color.color}; border:1px solid #000;">&nbsp;&nbsp;&nbsp;&nbsp;</span> {row.color.title}</td>
                  <td class="cot">{row.size.title}</td>
                  <td class="cot" align="center"><input class="update_value of_{row.type}_{row.type_id}" data-of="{row.type}_{row.type_id}" type="text" value="{row.quantity}" name="import_sub[{row.sub_id}]" size="4" style="text-align:center;"></td>
                </tr>
                <!-- END: row_sub_item --> 
                <!-- BEGIN: row_sub_empty -->
                <tr class="warning">
                  <td align="center" colspan="5">{row.mess}</td>
                </tr>
                <!-- END: row_sub_empty --> 
              </tbody>
            </table>
          </div>
          <div align="right"><button type="submit" class="btn btn-default" onclick="$.fancybox.close();">{LANG.global.btn_submit}</button></div>
        </div>
        <!-- END: row_sub --> 
        <script language="javascript">auto_update_value();</script>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.date_create}</label>
        <p>{data.date_create}</p>
      </div>
    </div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.date_update}</label>
        <p>{data.date_update}</p>
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

<!-- BEGIN: view -->
<form action="{data.link_action}" method="post" enctype="multipart/form-data" name="myForm" id="myForm" role="form">
  <div class="row">
    <div class="col-lg-12">{data.err}</div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.ordering.receipt_code}</label>
        <p>{data.receipt_code}</p>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-12">
    	<label>{LANG.global.content}</label>
      <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped table_row">
          <thead>
            <tr >
              <th class="header">{LANG.repository.product}</th>
              <th class="header" width="15%">{LANG.global.price_import}</th>
              <th class="header" width="15%">{LANG.global.quantity}</th>
              <th class="header" width="10%">Xem chi tiết</th>
              <th class="header" width="20%">{LANG.global.info}</th>
            </tr>
          </thead>
          <tbody>
          	<!-- BEGIN: row_item -->
            <tr id="row_{row.pic_id}">
              <td class="cot">{row.product.title}</td>
              <td class="cot" align="right">{row.price}</td>
              <td class="cot" align="right">{row.quantity}</td>
              <td class="cot" align="center">{row.view_detail}</td>
              <td class="cot">
              	<div><strong>{LANG.global.date_create}:</strong> {row.date_create}</div>
                <div><strong>{LANG.global.date_update}:</strong> {row.date_update}</div>
              </td>
            </tr>
            <!-- END: row_item --> 
          	<!-- BEGIN: row_empty -->
            <tr class="warning">
              <td align="center" colspan="3">{row.mess}</td>
            </tr>
            <!-- END: row_empty --> 
          </tbody>
        </table>
      </div>
      <div id="list_sub">
      	<!-- BEGIN: row_sub -->
      	<div id="sub_{data.list_id}" class="popup_limit" style="min-width:500px; display:none;">
          <div class="table-responsive">
            <table class="table table-bordered table-hover table-striped table_row">
              <thead>
                <tr >
                  <th class="header">{LANG.global.color}</th>
                  <th class="header" >{LANG.global.size}</th>
                  <th class="header" width="15%">{LANG.global.quantity}</th>
                  <th class="header" width="30%">{LANG.global.info}</th>
                </tr>
              </thead>
              <tbody>
              	{data.list}
                <!-- BEGIN: row_sub_item -->
                <tr id="row_{row.pic_id}">
                  <td class="cot"><span style="background:{row.color.color}; border:1px solid #000;">&nbsp;&nbsp;&nbsp;&nbsp;</span> {row.color.title}</td>
                  <td class="cot">{row.size.title}</td>
                  <td class="cot" align="right">{row.quantity}</td>
                  <td class="cot">
                    <div><strong>{LANG.global.date_create}:</strong> {row.date_create}</div>
                    <div><strong>{LANG.global.date_update}:</strong> {row.date_update}</div>
                  </td>
                </tr>
                <!-- END: row_sub_item --> 
                <!-- BEGIN: row_sub_empty -->
                <tr class="warning">
                  <td align="center" colspan="5">{row.mess}</td>
                </tr>
                <!-- END: row_sub_empty --> 
              </tbody>
            </table>
          </div>
        </div>
        <!-- END: row_sub --> 
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.poster}</label>
        <p>{data.admin_poster.full_name}</p>
      </div>
    </div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.editor}</label>
        <p>{data.admin_editor.full_name}</p>
      </div>
    </div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.repository.admin_finish}</label>
        <p>{data.admin_finish.full_name}</p>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.date_create}</label>
        <p>{data.date_create}</p>
      </div>
    </div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.date_update}</label>
        <p>{data.date_update}</p>
      </div>
    </div>
  </div>
  <!-- BEGIN: alert --> 
  <div class="row">
    <div class="col-lg-12 alert alert-danger alert-dismissable">
    	Cần lưu ý khi phiếu hoàn tất thì sẽ cập nhập vào kho và sau đó sẽ không thể chỉnh lại phiếu nữa!
    </div>
  </div>
  <div class="row" align="center">
    <input type="hidden" name="do_submit"	 value="1" />
    <button type="submit" class="btn btn-default">{LANG.global.btn_submit}</button>
  </div>
  <!-- END: alert --> 
</form>
<!-- END: view --> 

<!-- BEGIN: manage --> 
<div class="panel panel-default panel_toggle {data.form_search_class}">
  <div class="panel-heading">
    <h3 class="panel-title">{LANG.global.box_search}</h3>
    <a class="toggle">&nbsp;</a>
  </div>
  <div class="panel-body">
    <div class="box_search">
      <form action="{data.link_action_search}" method="post" name="form_search" id="form_search">
        <div class="row_search">
          <div class="col_search"><label>{LANG.global.date_begin}:</label> <input name="search_date_begin" type="text" size="20" maxlength="150" value="{data.search_date_begin}" class="form-control datepicker"></div>
          <div class="col_search"><label>{LANG.global.date_end}:</label> <input name="search_date_end" type="text" size="20" maxlength="150" value="{data.search_date_end}" class="form-control datepicker"></div>
          <div class="col_search"><label>{LANG.global.text_search}:</label> 
            <div class="form-group input-group">
              <input name="search_title" type="text" size="20" maxlength="150" value="{data.search_title}" class="form-control">
              <span class="input-group-btn">
                <button class="btn btn-default" type="submit">
                  <i class="fa fa-search"></i>
                </button>
              </span>
            </div>
          </div>
          <div class="clear"></div>
        </div>
        <div class="row_search">
        	<button class="btn btn-default btn-sm btn-block" type="submit">{LANG.global.btn_search}</button>
        </div>
      </form>
      <div class="clear"></div>
    </div>
  </div>
</div>
{data.err}
<form action="{data.link_action}" method="post" name="manage" id="manage">
  <div class="row">
    <div class="col-lg-12">
      <div class="table_btn table_btn_top">
        <img class="icon_arrow" src="{DIR_IMAGE}arrow_down.png" />
        <button type="button" class="btn btn-default" onclick="do_submit('do_edit')" value="{LANG.global.btn_update}" name="btnEdit">{LANG.global.btn_update}</button>
        <!-- BEGIN: button_trash -->
        <!-- END: button_trash --> 
        <!-- BEGIN: button_manage -->
        <!-- END: button_manage --> 
        <div class="clear"></div>
      </div>
      <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped table_row">
          <thead>
            <tr >
              <th class="header" width="3%"><input id="checkall" class="checkbox" type="checkbox" name="checkall" value="all"/></th>
              <th class="header" width="5%">{data.f_receipt_id}</th>
              <th class="header" width="10%">{data.f_show_order}</th>
              <th class="header" >{data.f_receipt_code}</th>
              <th class="header" width="25%">{LANG.global.info}</th>
              <th class="header" width="10%">{LANG.global.action}</th>
            </tr>
          </thead>
          <tbody>
          	{data.html_row}
          	<!-- BEGIN: row_item -->
            <tr id="row_{row.receipt_id}">
              <td class="cot" align="center"><input class="checkbox" type="checkbox" value="{row.receipt_id}" name="selected_id[]"></td>
              <td class="cot" align="center">{row.receipt_id}</td>
              <td class="cot" align="center"><input type="text" value="{row.show_order}" name="show_order[{row.receipt_id}]" size="4" style="text-align:center;" onchange="do_check ({row.receipt_id})"></td>
              <td class="cot">{row.receipt_code}</td>
              <td class="cot">
              	<div><strong>{LANG.global.date_create}:</strong> {row.date_create}</div>
              </td>
              <td class="cot" align="center">
                <a href="{row.link_view}" ><img src="{DIR_IMAGE}icon_view.png" atl="{LANG.global.view}" title="{LANG.global.view}"/></a>
                <!-- BEGIN: row_button_trash -->
                <!-- END: row_button_trash --> 
                <!-- BEGIN: row_button_manage -->
                <a href="{row.link_edit}" ><img src="{DIR_IMAGE}icon_edit.png" atl="{LANG.global.edit}" title="{LANG.global.edit}"/></a>
                <!-- END: row_button_manage -->
              </td>
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
      <div class="table_btn table_btn_buttom">
        <img class="icon_arrow" src="{DIR_IMAGE}arrow_up.png" />
        <button type="button" class="btn btn-default" onclick="do_submit('do_edit')" value="{LANG.global.btn_update}" name="btnEdit">{LANG.global.btn_update}</button>
        <!-- BEGIN: button_trash -->
        <!-- END: button_trash --> 
        <!-- BEGIN: button_manage -->
        <!-- END: button_manage --> 
        <div class="clear"></div>
      </div>
      <div class="table_nav">{data.nav}</div>
      <input id="do_action" type="hidden" value="" name="do_action">
    </div>
  </div>
</form>
<!-- END: manage --> 