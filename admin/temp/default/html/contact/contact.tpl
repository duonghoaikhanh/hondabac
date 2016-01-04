<!-- BEGIN: main -->
<div class="row">
  <div class="col-md-12">
    <h1>{data.page_title}</h1>
    <ol class="breadcrumb">
      <li><a href="{data.link_manage}" {data.class.manage}><i class="fa fa-th-list"></i> {LANG.global.manage}</a></li>
      <li><a href="{data.link_manage_trash}" {data.class.manage_trash}><i class="fa fa-trash-o"></i> {LANG.global.trash}</a></li>
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
      <div class="form-group">
        <label>{LANG.contact.full_name}</label>
        <p class="form-control-static">{data.full_name}</p>
      </div>
    </div>
    <div class="col-md-6">
      <div class="form-group">
        <label>{LANG.contact.email}</label>
        <p class="form-control-static">{data.email}</p>
      </div>
    </div>
    <div class="col-md-6">
      <div class="form-group">
        <label>{LANG.contact.address}</label>
        <p class="form-control-static">{data.address}</p>
      </div>
    </div>
    <div class="col-md-6">
      <div class="form-group">
        <label>{LANG.contact.phone}</label>
        <p class="form-control-static">{data.phone}</p>
      </div>
    </div>
    <div class="col-md-6">
      <div class="form-group">
        <label>{LANG.contact.title}</label>
        <p class="form-control-static">{data.title}</p>
      </div>
    </div>
    <div class="col-md-12">
      <div class="form-group">
        <label>{LANG.contact.content}</label>
        <p class="form-control-static">{data.content}</p>
      </div>
    </div>
    <div class="col-md-6">
      <div class="form-group">
        <label>{LANG.contact.re_title}</label>
        <input name="re_title" id="re_title" type="text" size="50" maxlength="150" value="{data.re_title}" class="form-control">
      </div>
    </div>
    <div class="col-md-6">
      <div class="form-group">
        <label>{LANG.contact.email_forward}</label>
        <input name="email_forward" id="email_forward" type="text" size="50" maxlength="150" value="{data.email_forward}" class="form-control">
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="form-group">
        <label>{LANG.global.content}</label>
        {data.html_content} </div>
    </div>
  </div>
  <div class="row" align="center">
    <input type="hidden" name="do_submit"	 value="1" />
    <button type="submit" class="btn btn-default" name="do_status_0" value="1">{LANG.contact.is_status_0}</button>
    <button type="submit" class="btn btn-default" name="do_status_2" value="1">{LANG.contact.is_status_2}</button>
    <button type="submit" class="btn btn-default" name="do_status_3" value="1">{LANG.contact.is_status_3}</button>
    <button type="reset" class="btn btn-default">{LANG.global.btn_reset}</button>
  </div>
</form>
<!-- END: edit --> 

<!-- BEGIN: manage --> 
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">{LANG.global.box_search}</h3>
  </div>
  <div class="panel-body">
    <div class="box_search">
      <form action="{data.link_action}" method="post" name="form_search" id="form_search">
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
    <div class="col-md-12">
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
              <th class="header" width="5%">{data.f_contact_id}</th>
              <th class="header">{data.f_full_name}</th>
              <th class="header" width="25%">{data.f_email}</th>
              <th class="header" width="10%">{data.f_date_create}</th>
              <th class="header" width="10%">{data.f_is_status}</th>
              <th class="header" width="10%">{LANG.global.action}</th>
            </tr>
          </thead>
          <tbody>
          	<!-- BEGIN: row_item -->
            <tr id="row_{row.contact_id}">
              <td class="cot" align="center"><input class="checkbox" type="checkbox" value="{row.contact_id}" name="selected_id[]"></td>
              <td class="cot" align="center">{row.contact_id}</td>
              <td class="cot">{row.full_name}</td>
              <td class="cot">{row.email}</td>
              <td class="cot" align="center">{row.date_create}</td>
              <td class="cot" align="center">{row.is_status}</td>
              <td class="cot" align="center">
                <a href="{row.link_view}" ><img src="{DIR_IMAGE}icon_view.png" atl="{LANG.global.view}" title="{LANG.global.view}"/></a>
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
              <td align="center" colspan="5">{row.mess}</td>
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