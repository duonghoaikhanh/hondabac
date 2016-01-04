<!-- BEGIN: main -->
<div class="row">
  <div class="col-lg-12">
    <h1>{data.page_title}</h1>
    <ol class="breadcrumb">
      <li><a href="{data.link_manage}" {data.class.manage}><i class="fa fa-th-list"></i> {LANG.global.manage}</a></li>
      <li><a href="{data.link_manage_trash}" {data.class.manage_trash}><i class="fa fa-trash-o"></i> {LANG.global.trash}</a></li>
    </ol>
  </div>
</div>
{data.main} 
<!-- END: main --> 

<!-- BEGIN: table_promotion -->
<div class="table-responsive">
  <table class="table table-bordered table-hover table-striped table_row">
    <thead>
      <tr >
        <th class="header">{LANG.global.id}</th>
        <th class="header" width="20%">{LANG.global.percent}</th>
        <th class="header" width="25%">{LANG.global.date_end}</th>
      </tr>
    </thead>
    <tbody>
      <!-- BEGIN: row_item -->
      <tr>
      	<td class="cot" align="center">{row.promotion_id}</td>
        <td class="cot" align="center">{row.percent}%</td>
        <td class="cot" align="center">{row.date_end}</td>
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
<!-- END: table_promotion --> 

<!-- BEGIN: table_cart -->
<div class="table-responsive">
  <table class="table table-bordered table-hover table-striped table_row">
    <thead>
      <tr >
        <th class="header" width="10%">{LANG.global.picture}</th>
        <th class="header">{LANG.repository.col_title}</th>
        <th class="header" width="10%">{LANG.global.color}</th>
        <th class="header" width="10%">{LANG.global.size}</th>
        <th class="header" width="15%">{LANG.repository.col_price}</th>
        <th class="header" width="10%">{LANG.global.quantity}</th>
        <th class="header" width="15%">{LANG.repository.col_total}</th>
      </tr>
    </thead>
    <tbody>
      <!-- BEGIN: row_item -->
      <tr>
      	<td class="cot" align="center"><img src="{row.picture}" alt="{row.title}"/></td>
        <td class="cot">{row.title}</td>
        <td class="cot" align="center">
          <div><span class="color" style="background:{row.color.color};">&nbsp;&nbsp;&nbsp;&nbsp;</span> {row.color.title}</div>
        </td>
        <td class="cot" align="center">{row.size.title}</td>
        <td class="cot" align="center">{row.price_buy}</td>
        <td class="cot" align="center">{row.quantity}</td>
        <td class="cot" align="center">{row.total}</td>
      </tr>
      <!-- END: row_item --> 
      <!-- BEGIN: row_empty -->
      <tr class="warning">
        <td align="center" colspan="7">{row.mess}</td>
      </tr>
      <!-- END: row_empty --> 
      <tr>
        <td class="cot" align="right" colspan="6">       {LANG.repository.cart_total}</td>
        <td class="cot" align="right">{data.cart_total}</td>
      </tr>
      <tr>
        <td class="cot" align="right" colspan="6">   {LANG.repository.promotional_code}</td>
        <td class="cot" align="right">-<span class="number">{data.promotion_percent}</span>%</td>
      </tr>
      <tr>
        <td class="cot" align="right" colspan="6">{LANG.repository.cart_shipping}</td>
        <td class="cot" align="right">{data.shipping_price}</td>
      </tr>
      <tr>
        <td class="cot" align="right" colspan="6">{LANG.repository.gift_voucher}</td>
        <td class="cot" align="right">-{data.voucher_amount}</td>
      </tr>
      <tr>
        <td class="cot" align="right" colspan="6">{LANG.repository.cart_payment}</td>
        <td class="cot" align="right">{data.total_payment}</td>
      </tr>
    </tbody>
  </table>
</div>
<!-- END: table_cart --> 

<!-- BEGIN: edit -->
<form action="{data.link_action}" method="post" enctype="multipart/form-data" name="myForm" id="myForm" role="form">
  <div class="row">
    <div class="col-lg-12">{data.err}</div>
    <div class="col-lg-6">
    	<h2>{LANG.repository.ordering_address}</h2>
      <div class="form-group">
        <label>{LANG.repository.full_name}</label>
        <input name="o_full_name" id="o_full_name" type="text" size="50" maxlength="150" value="{data.o_full_name}" class="form-control">
      </div>
      <div class="form-group">
        <label>{LANG.repository.email}</label>
        <input name="o_email" id="o_email" type="text" size="50" maxlength="150" value="{data.o_email}" class="form-control">
      </div>
      <div class="form-group">
        <label>{LANG.repository.phone}</label>
        <input name="o_phone" id="o_phone" type="text" size="50" maxlength="150" value="{data.o_phone}" class="form-control">
      </div>
      <div class="form-group">
        <label>{LANG.repository.address}</label>
        <input name="o_address" id="o_address" type="text" size="50" maxlength="150" value="{data.o_address}" class="form-control">
      </div>
    </div>
    <div class="col-lg-6">
    	<h2>{LANG.repository.delivery_address}</h2>
      <div class="form-group">
        <label>{LANG.repository.full_name}</label>
        <input name="d_full_name" id="d_full_name" type="text" size="50" maxlength="150" value="{data.d_full_name}" class="form-control">
      </div>
      <div class="form-group">
        <label>{LANG.repository.email}</label>
        <input name="d_email" id="d_email" type="text" size="50" maxlength="150" value="{data.d_email}" class="form-control">
      </div>
      <div class="form-group">
        <label>{LANG.repository.phone}</label>
        <input name="d_phone" id="d_phone" type="text" size="50" maxlength="150" value="{data.d_phone}" class="form-control">
      </div>
      <div class="form-group">
        <label>{LANG.repository.address}</label>
        <input name="d_address" id="d_address" type="text" size="50" maxlength="150" value="{data.d_address}" class="form-control">
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-12">
    	<h2>{LANG.repository.ordering_cart}</h2>
      <div class="form-group">
        {data.table_cart}
      </div>
      <div class="form-group">
      	<label>{LANG.repository.ordering_shipping}: {data.shipping.title}</label>
        <div class="form-control-static">{data.shipping.content}</div>
      </div>
      <div class="form-group">
      	<label>{LANG.repository.ordering_method}: {data.method.title}</label>
        <div class="form-control-static">{data.method.content}</div>
      </div>
      <div class="form-group">
      	<label>{LANG.repository.request_more}</label>
        <p class="form-control-static">{data.request_more}</p>
      </div>
    </div>
  </div>
  <!-- BEGIN: create_promotion --> 
  <div class="row">
    <div class="form-group">
      <label class="radio-inline">
        <input name="create_promotion" type="checkbox" value="1">
        Tạo promotional code
      </label>
    </div>
  </div>
  <!-- END: create_promotion --> 
  <!-- BEGIN: list_promotion --> 
  <div class="row">
    <div class="col-lg-12">
    	<label>Danh sách promotional code</label>
    	{data.table_promotion}
    </div>
  </div>
  <div class="row">
    <div class="form-group">
      <label class="radio-inline">
        <input name="send_promotion" type="checkbox" value="1">
        Gửi promotional code
      </label>
    </div>
  </div>
  <!-- END: list_promotion --> 
  <div class="row">
    <div class="col-lg-12">
      <div class="panel panel-default panel_toggle">
      	<div class="panel-heading">
        	<label class="toggle">
            <input name="message_send" type="checkbox" value="1">
            Gửi thông báo ({data.message_send})
          </label>
        </div>
        <div class="panel-body">
          <div class="form-group">
            <label>Gửi từ Email</label>
            <input name="message_from" id="message_from" type="text" size="50" maxlength="150" value="{data.message_from}" class="form-control">
          </div>
          <div class="form-group">
            <label>Gửi đến Email</label>
            <input name="message_to" id="message_to" type="text" size="50" maxlength="150" value="{data.d_email}" class="form-control">
          </div>
          <div class="form-group">
            <label>{LANG.global.title}</label>
            <input name="message_title" id="message_title" type="text" size="50" maxlength="150" value="{data.message_title}" class="form-control">
          </div>
          <div class="form-group">
            <label>{LANG.global.content}</label>
            {data.html_message}
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-12">
      <div class="form-group">
        <label>{LANG.repository.status_order}</label>
        {data.list_status_order}
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

<!-- BEGIN: manage --> 
<div class="panel panel-default panel_toggle {data.form_search_class}">
  <div class="panel-heading">
    <h3 class="panel-title">{LANG.global.box_search}</h3>
    <a class="toggle">&nbsp;</a>
  </div>
  <div class="panel-body">
    <div class="box_search">
      <form action="{data.link_action}" method="post" name="form_search" id="form_search">
        <div class="row_search">
          <div class="col_search"><label>{LANG.global.date_begin}:</label> <input name="search_date_begin" type="text" size="20" maxlength="150" value="{data.search_date_begin}" class="form-control datepicker"></div>
          <div class="col_search"><label>{LANG.global.date_end}:</label> <input name="search_date_end" type="text" size="20" maxlength="150" value="{data.search_date_end}" class="form-control datepicker"></div>
          <!--<div class="col_search"><label>{LANG.global.text_search}:</label> 
            <div class="form-group input-group">
              <input name="search_title" type="text" size="20" maxlength="150" value="{data.search_title}" class="form-control">
              <span class="input-group-btn">
                <button class="btn btn-default" type="submit">
                  <i class="fa fa-search"></i>
                </button>
              </span>
            </div>
          </div>-->
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
        <button type="button" class="btn btn-default" onclick="do_submit_alert('do_trash', '{LANG.global.are_you_sure_trash}')" value="{LANG.global.btn_trash}" name="btnTrash">{LANG.global.btn_trash}</button>
        <!-- END: button_trash --> 
        <!-- BEGIN: button_manage -->
        <button type="button" class="btn btn-default" onclick="do_submit_alert('do_restore', '{LANG.global.are_you_sure_restore}')" value="{LANG.global.btn_restore}" name="btnRestore">{LANG.global.btn_restore}</button>
        <button type="button" class="btn btn-default" onclick="do_submit_alert('do_del', '{LANG.global.are_you_sure_del}')" value="{LANG.global.btn_del}" name="btnDel">{LANG.global.btn_del}</button>
        <!-- END: button_manage --> 
        <div class="clear"></div>
      </div>
      <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped table_row">
          <thead>
            <tr >
              <th class="header" width="3%"><input id="checkall" class="checkbox" type="checkbox" name="checkall" value="all"/></th>
              <th class="header" width="5%">{data.f_order_id}</th>
              <th class="header" width="5%">{data.f_order_code}</th>
              <th class="header" width="15%">{data.f_is_status}</th>
              <th class="header">{data.f_d_full_name}</th>
              <th class="header" width="15%" >{data.f_total_order}</th>
              <th class="header" width="15%">{data.f_date_create}</th>
              <th class="header" width="10%">{LANG.global.action}</th>
            </tr>
          </thead>
          <tbody>
          	<!-- BEGIN: row_item -->
            <tr id="row_{row.order_id}">
              <td class="cot" align="center"><input class="checkbox" type="checkbox" value="{row.order_id}" name="selected_id[]"></td>
              <td class="cot" align="center">{row.order_id}</td>
              <td class="cot" align="center">{row.order_code}</td>
              <td class="cot" style="background:{row.status_order.background_color};color:{row.status_order.color};">{row.status_order.title}</td>
              <td class="cot">{row.o_full_name}</td>
              <td class="cot" align="right">{row.total_order}</td>
              <td class="cot" align="center">{row.date_create}</td>
              <td class="cot" align="center">
                <a href="{row.link_edit}" ><img src="{DIR_IMAGE}icon_edit.png" atl="{LANG.global.edit}" title="{LANG.global.edit}"/></a>
                <!-- BEGIN: row_button_trash -->
                <a href="javascript:action_item('{row.link_trash}','{LANG.global.are_you_sure_trash}')" ><img src="{DIR_IMAGE}icon_trash.png" atl="{LANG.global.trash}" title="{LANG.global.trash}"/></a>
                <!-- END: row_button_trash --> 
                <!-- BEGIN: row_button_manage -->
                <a href="javascript:action_item('{row.link_restore}','{LANG.global.are_you_sure_restore}')" ><img src="{DIR_IMAGE}icon_restore.png" atl="{LANG.global.restore}" title="{LANG.global.restore}"/></a>
                <a href="javascript:action_item('{row.link_del}','{LANG.global.are_you_sure_del}')" ><img src="{DIR_IMAGE}icon_del.png" atl="{LANG.global.del}" title="{LANG.global.del}"/></a>
                <!-- END: row_button_manage -->
              </td>
            </tr>
            <!-- END: row_item --> 
          	<!-- BEGIN: row_empty -->
            <tr class="warning">
              <td align="center" colspan="8">{row.mess}</td>
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