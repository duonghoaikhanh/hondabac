<!-- BEGIN: main -->
<div class="row">
  <div class="col-lg-12">
    <h1>{data.page_title}</h1>
    <ol class="breadcrumb">
      <li><a href="{data.link_manage}" {data.class.manage}><i class="fa fa-th-list"></i> Phiếu kho hoàn chỉnh</a></li>
      <li><a href="{data.link_manage_trash}" {data.class.manage_trash}><i class="fa fa-th-list"></i> Phiếu kho chưa hoàn chỉnh</a></li>
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
      <div class="form-group">
        <label>{LANG.global.title}</label>
        <input name="title" id="title" type="text" size="50" maxlength="150" value="{data.title}" class="form-control">
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
              <th class="header">{LANG.product.product}</th>
              <th class="header" width="15%">{LANG.product.color}</th>
              <th class="header" width="10%" >{LANG.product.size}</th>
              <th class="header" width="15%">{data.f_stock}</th>
              <th class="header" width="20%">{LANG.global.info}</th>
            </tr>
          </thead>
          <tbody>
          	<!-- BEGIN: row_item -->
            <tr id="row_{row.pic_id}">
              <td class="cot">{row.product.title}</td>
              <td class="cot"><span style="background:{row.color.color}; border:1px solid #000;">&nbsp;&nbsp;&nbsp;&nbsp;</span> {row.color.title}</td>
              <td class="cot">{row.size.title}</td>
              <td class="cot" align="right">{row.in_stock}</td>
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
    </div>
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
        <button type="button" class="btn btn-default" onclick="do_submit_alert('do_trash', 'Bạn có muốn chuyển thành phiếu chưa hoàn chỉnh không?')" value="{LANG.global.btn_trash}" name="btnTrash">Chưa hoàn chỉnh</button>
        <!-- END: button_trash --> 
        <!-- BEGIN: button_manage -->
        <button type="button" class="btn btn-default" onclick="do_submit_alert('do_restore', 'Bạn có muốn chuyển thành phiếu hoàn chỉnh không? \nPhiếu hoàn chỉnh chỉ có thể cập nhật được tiêu đề thôi!')" value="{LANG.global.btn_restore}" name="btnRestore">Hoàn chỉnh</button>
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
              <th class="header" >{data.f_title}</th>
              <th class="header" width="25%">{LANG.global.info}</th>
              <th class="header" width="10%">{LANG.global.action}</th>
            </tr>
          </thead>
          <tbody>
          	{data.row_item}
          	<!-- BEGIN: row_item -->
            <tr id="row_{row.receipt_id}">
              <td class="cot" align="center"><input class="checkbox" type="checkbox" value="{row.receipt_id}" name="selected_id[]"></td>
              <td class="cot" align="center">{row.receipt_id}</td>
              <td class="cot" align="center"><input type="text" value="{row.show_order}" name="show_order[{row.receipt_id}]" size="4" style="text-align:center;" onchange="do_check ({row.receipt_id})"></td>
              <td class="cot">{row.title}</td>
              <td class="cot">
              	<div><strong>{LANG.global.date_create}:</strong> {row.date_create}</div>
              </td>
              <td class="cot" align="center">
                <a href="{row.link_edit}" ><img src="{DIR_IMAGE}icon_view.png" atl="{LANG.global.view}" title="{LANG.global.view}"/></a>
                <!-- BEGIN: row_button_trash -->
                <!-- END: row_button_trash --> 
                <!-- BEGIN: row_button_manage -->
                <a href="javascript:action_item('{row.link_restore}','Bạn có muốn chuyển thành phiếu hoàn chỉnh không? \nPhiếu hoàn chỉnh chỉ có thể cập nhật được tiêu đề thôi!')" ><img src="{DIR_IMAGE}icon_ok.png" atl="{LANG.global.ok}" title="{LANG.global.ok}"/></a>
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