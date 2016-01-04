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

<!-- BEGIN: table_powers -->
<div class="row">
  <div class="col-lg-12">
    <div class="table-responsive">
      <table class="table table-bordered table-hover table-striped table_row">
        <tbody>
        	{data.row_item}
          <!-- BEGIN: row_item_mod -->
          <tr class="{row.class}">
            <td class="cot" colspan="3"><label>{row.title}</label></td>
          </tr>
          <!-- END: row_item_mod --> 
          <!-- BEGIN: row_item_act -->
          <tr class="{row.class}">
            <td class="cot" align="center" width="4%">
            	|--
            </td>
            <td class="cot" colspan="2"><label>{row.title}</label></td>
          </tr>
          <!-- END: row_item_act --> 
          <!-- BEGIN: row_item_sub -->
          <tr class="{row.class}">
            <td class="cot" align="center" width="4%">
            	|--
            </td>
            <td class="cot" align="center" width="4%">
            	|--
            </td>
            <td class="cot">
            	<!-- BEGIN: list_sub -->
              <label class="checkbox-inline" for="col_sub_{sub.menu_id}_{sub.sub_name}">
                <input class="checkbox" type="checkbox" value="{sub.sub_name}" name="powers[{sub.name_action_mod}][{sub.name_action}][{sub.sub_name}]" id="col_sub_{sub.menu_id}_{sub.sub_name}" {sub.checked}>
                <span>{sub.sub_title}</span>
              </label>
              <!-- END: list_sub --> 
            </td>
          </tr>
          <!-- END: row_item_sub --> 
          <!-- BEGIN: row_empty -->
          <tr class="warning">
            <td align="center" colspan="3">{row.mess}</td>
          </tr>
          <!-- END: row_empty --> 
        </tbody>
      </table>
    </div>
  </div>
</div>
<!-- END: table_powers --> 

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
  {data.table_powers}
  <div class="row" align="center">
    <input type="hidden" name="do_submit"	 value="1" />
    <button type="submit" class="btn btn-default">{LANG.global.btn_submit}</button>
    <button type="reset" class="btn btn-default">{LANG.global.btn_reset}</button>
  </div>
</form>
<!-- END: edit --> 

<!-- BEGIN: manage --> 
{data.err}
<form action="{data.link_action}" method="post" name="manage" id="manage">
  <div class="row">
    <div class="col-lg-12">
      <div class="table_btn table_btn_top">
        <img class="icon_arrow" src="{DIR_IMAGE}arrow_down.png" />
        <button type="button" class="btn btn-default" onclick="do_submit('do_edit')" value="{LANG.global.btn_update}" name="btnEdit">{LANG.global.btn_update}</button>
        <button type="button" class="btn btn-default" onclick="do_submit_alert('do_restore', '{LANG.global.are_you_sure_restore}')" value="{LANG.global.btn_restore}" name="btnRestore">{LANG.global.btn_restore}</button>
        <button type="button" class="btn btn-default" onclick="do_submit_alert('do_del', '{LANG.global.are_you_sure_del}')" value="{LANG.global.btn_del}" name="btnDel">{LANG.global.btn_del}</button>
        <div class="clear"></div>
      </div>
      <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped table_row">
          <thead>
            <tr >
              <th class="header" width="3%"><input id="checkall" class="checkbox" type="checkbox" name="checkall" value="all"/></th>
              <th class="header" width="5%">{data.f_group_id}</th>
              <th class="header" width="10%">{data.f_show_order}</th>
              <th class="header" >{data.f_title}</th>
              <th class="header" width="10%">{LANG.global.action}</th>
            </tr>
          </thead>
          <tbody>
          	<!-- BEGIN: row_item -->
            <tr id="row_{row.group_id}">
              <td class="cot" align="center"><input class="checkbox" type="checkbox" value="{row.group_id}" name="selected_id[]"></td>
              <td class="cot" align="center">{row.group_id}</td>
              <td class="cot" align="center"><input type="text" value="{row.show_order}" name="show_order[{row.group_id}]" size="4" style="text-align:center;" onchange="do_check ({row.group_id})"></td>
              <td class="cot">
              {row.title}
              </td>
              <td class="cot" align="center">
                <a href="{row.link_edit}" ><img src="{DIR_IMAGE}icon_edit.png" atl="{LANG.global.edit}" title="{LANG.global.edit}"/></a>
                <a href="javascript:action_item('{row.link_del}','{LANG.global.are_you_sure_del}')" ><img src="{DIR_IMAGE}icon_del.png" atl="{LANG.global.del}" title="{LANG.global.del}"/></a>
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
        <button type="button" class="btn btn-default" onclick="do_submit_alert('do_restore', '{LANG.global.are_you_sure_restore}')" value="{LANG.global.btn_restore}" name="btnRestore">{LANG.global.btn_restore}</button>
        <button type="button" class="btn btn-default" onclick="do_submit_alert('do_del', '{LANG.global.are_you_sure_del}')" value="{LANG.global.btn_del}" name="btnDel">{LANG.global.btn_del}</button>
        <div class="clear"></div>
      </div>
      <div class="table_nav">{data.nav}</div>
      <input id="do_action" type="hidden" value="" name="do_action">
    </div>
  </div>
</form>
<!-- END: manage --> 