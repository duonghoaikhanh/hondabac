<!-- BEGIN: main -->
<div class="row">
  <div class="col-lg-12">
    <h1>{data.page_title}</h1>
    <ol class="breadcrumb">
      <li><a href="{data.link_manage}" {data.class.manage}><i class="fa fa-th-list"></i> {LANG.global.manage}</a></li>
      <li><a href="{data.link_manage_trash}" {data.class.manage_trash}><i class="fa fa-trash-o"></i> {LANG.global.trash}</a></li>
      <li><a href="{data.link_add}" {data.class.add}><i class="fa fa-edit"></i> {LANG.global.add}</a></li>
    </ol>
  </div>
</div>
{data.main} 
<!-- END: main --> 

<!-- BEGIN: radio_inline --> 
  <!-- BEGIN: row --> 
  <label class="radio-inline">
    <input name="{row.input_name}" type="radio" value="{row.value}" {row.checked}>
    {row.title}
  </label>
  <!-- END: row --> 
<!-- END: radio_inline --> 

<!-- BEGIN: checkbox_inline --> 
  <!-- BEGIN: row --> 
  <label class="checkbox-inline">
    <input name="{row.input_name}" type="checkbox" value="{row.value}" {row.checked}>
    {row.title}
  </label>
  <!-- END: row --> 
<!-- END: checkbox_inline --> 

<!-- BEGIN: edit -->
<form action="{data.link_action}" method="post" enctype="multipart/form-data" name="myForm" id="myForm" role="form">
  <div class="row">
    <div class="col-lg-12">{data.err}</div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.product.product_group}</label>
        {data.list_group}
      </div>
    </div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>Danh mục phụ</label>
        {data.list_group_related}
      </div>
    </div>
    <div class="col-lg-3 col-md-3">
      <div class="form-group">
        <label>{LANG.global.series}</label>
        <input name="item_code" id="item_code" type="text" size="50" maxlength="150" value="{data.item_code}" class="form-control">
      </div>
    </div>
    <div class="col-lg-9 col-md-9">
      <div class="form-group">
        <label>{LANG.global.title}</label>
        <input name="title" id="title" type="text" size="50" maxlength="150" value="{data.title}" class="form-control">
      </div>
    </div>
    <div class="col-lg-6 col-md-6">
      <div class="form-group">
        <label>{LANG.global.picture}</label>
        {data.picture}
      </div>
    </div>
    <div class="col-lg-3 col-md-3 col-xs-6">
      <div class="form-group">
        <label>{LANG.global.price}</label>
        <input type="text" size="50" maxlength="150" value="{data.price}" class="form-control price">
        <input name="price" type="hidden" value="{data.price}" class="price_input">
      </div>
    </div>
    <div class="col-lg-3 col-md-3 col-xs-6">
      <div class="form-group">
        <label>{LANG.global.price_buy}</label>        
        <input type="text" size="50" maxlength="150" value="{data.price_buy}" class="form-control price">
        <input name="price_buy" type="hidden" value="{data.price_buy}" class="price_input">
      </div>
    </div>
  </div>
  
  <div class="row">
    <div class="col-lg-12">
      <div class="bs-example">
        <ul class="nav nav-tabs" style="margin-bottom: 15px;">
          <li class="active"><a href="#tab_short" data-toggle="tab">{LANG.global.short}</a></li>
          <li><a href="#tab_content" data-toggle="tab">Chi tiết sản phẩm</a></li>
          <!--<li><a href="#tab_content1" data-toggle="tab">Cách dùng</a></li>
          <li><a href="#tab_content2" data-toggle="tab">Công dụng</a></li>
          <li><a href="#tab_content3" data-toggle="tab">Phụ tùng mua thêm</a></li>
          <li><a href="#tab_content4" data-toggle="tab">Nội dung 5</a></li>
          <li><a href="#tab_content5" data-toggle="tab">Nội dung 6</a></li>-->
        </ul>
        <div id="myTabContent" class="tab-content">
          <div class="tab-pane fade active in" id="tab_short">
            {data.html_short}
          </div>
          <div class="tab-pane fade" id="tab_content">
            {data.html_content}
          </div>
          <!--<div class="tab-pane fade" id="tab_content1">
            {data.html_content1}
          </div>
          <div class="tab-pane fade" id="tab_content2">
            {data.html_content2}
          </div>
          <div class="tab-pane fade" id="tab_content3">
            {data.html_content3}
          </div>
          <div class="tab-pane fade" id="tab_content4">
            {data.html_content4}
          </div>
          <div class="tab-pane fade" id="tab_content5">
            {data.html_content5}
          </div>-->
        </div>
      </div>
    </div>
  </div>
  <br />
  <div class="row">
    <div class="col-lg-12">
      <div class="form-group">
        <label>{LANG.product.color}: </label>
        {data.list_color}
      </div>
    </div>
    <div class="col-lg-12">
      <div class="form-group">
        <label>{LANG.product.size}: </label>
        {data.list_size}
      </div>
    </div>
  </div>
  <!-- BEGIN: f_input_option --> 
  <h2>{LANG.product.product_option}</h2>
  <!-- END: f_input_option --> 
  <!-- BEGIN: input_option --> 
  <div class="row">
    <div class="col-lg-12">
      <div class="form-group">
        <label>{row.title}</label>
        <textarea name="arr_option[{row.option_id}]" class="form-control" rows="1">{row.content}</textarea>
      </div>
    </div>
  </div>
  <!-- END: input_option --> 
  <h2>{LANG.global.orientation_search_engine}</h2>
  <div class="row">
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.friendly_link}</label>
        <input name="friendly_link" id="friendly_link" type="text" size="50" maxlength="150" value="{data.friendly_link}" class="form-control">
        <p class="help-block">{LANG.global.friendly_link_note}</p>
      </div>
    </div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.meta_title}</label>
        <input name="meta_title" id="meta_title" type="text" size="50" maxlength="150" value="{data.meta_title}" class="form-control">
        <p class="help-block">{LANG.global.meta_title_note}</p>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-12">
      <div class="form-group">
        <label>{LANG.global.meta_key}</label>
        <textarea name="meta_key" id="meta_key" class="form-control" rows="3">{data.meta_key}</textarea>
        <p class="help-block">{LANG.global.meta_key_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_desc}</label>
        <textarea name="meta_desc" id="meta_desc" class="form-control" rows="3">{data.meta_desc}</textarea>
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
          <div class="col_search"><label>{LANG.product.product_group}:</label> {data.list_group_search}</div>
          <div class="col_search"><label>{LANG.product.product_brand}:</label> {data.list_brand_search}</div>
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
        <button type="button" class="btn btn-default" onclick="do_submit_alert('do_duplicate', '{LANG.global.are_you_sure_duplicate}')" value="{LANG.global.duplicate}" name="btnTrash">{LANG.global.duplicate}</button>
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
              <th class="header" width="5%">{data.f_item_id}</th>
              <th class="header" width="10%">{data.f_show_order}</th>
              <th class="header" width="10%">{data.f_picture}</th>
              <th class="header" >{data.f_title}</th>
              <th class="header" width="10%">{data.f_in_stock}</th>
              <th class="header" width="20%">{LANG.global.info}</th>
              <th class="header" width="10%">{LANG.global.action}</th>
            </tr>
          </thead>
          <tbody>
          	{data.row_item}
          	<!-- BEGIN: row_item -->
            <tr id="row_{row.item_id}">
              <td class="cot" align="center"><input class="checkbox" type="checkbox" value="{row.item_id}" name="selected_id[]"></td>
              <td class="cot" align="center">{row.item_id}</td>
              <td class="cot" align="center"><input type="text" value="{row.show_order}" name="show_order[{row.item_id}]" size="4" style="text-align:center;" onchange="do_check ({row.item_id})"></td>
              <td class="cot" align="center">{row.picture}</td>
              <td class="cot">
                {row.title}
                <div><strong>Link:</strong> {row.link}</div>
              </td>
              <td class="cot" align="right">{row.in_stock}</td>
              <td class="cot">
              	<div><strong>{LANG.global.price}:</strong> <span style="text-decoration:line-through">{row.price_out}</span></div>
              	<div><strong>{LANG.global.price_buy}:</strong> <strong style="color:#00C;">{row.price_buy}</strong></div>
              	<div><strong>{LANG.global.date_create}:</strong> {row.date_create}</div>
              	<div><label for="is_focus_{row.item_id}"><strong>{LANG.global.focus}:</strong></label> <input type="checkbox" value="1" id="is_focus_{row.item_id}" name="is_focus[{row.item_id}]" {row.is_focus_checked} onchange="do_check ('{row.item_id}')" /></div>
              </td>
              <td class="cot" align="center">
              	<a href="{row.link_add_menu}" class="fancybox fancybox.ajax" ><img src="{DIR_IMAGE}icon_menu.png" atl="{LANG.global.add_to_menu}" title="{LANG.global.add_to_menu}"/></a>
                <a href="{row.link_edit}" ><img src="{DIR_IMAGE}icon_edit.png" atl="{LANG.global.edit}" title="{LANG.global.edit}"/></a>
                <!-- BEGIN: row_button_trash -->
              	<a href="{row.link_pic}" ><img src="{DIR_IMAGE}icon_pic.png" atl="{LANG.global.picture}" title="{LANG.global.picture}"/></a>
              	<a href="javascript:action_item('{row.link_duplicate}','{LANG.global.are_you_sure_duplicate}')" ><img src="{DIR_IMAGE}icon_duplicate.png" atl="{LANG.global.duplicate}" title="{LANG.global.duplicate}"/></a>
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
              <td align="center" colspan="7">{row.mess}</td>
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