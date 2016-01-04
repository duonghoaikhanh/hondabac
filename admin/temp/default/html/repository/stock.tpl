<!-- BEGIN: main -->
<div class="row">
  <div class="col-lg-12">
    <h1>{data.page_title}</h1>
    <ol class="breadcrumb">
      <li><a href="{data.link_manage}" {data.class.manage}><i class="fa fa-th-list"></i> {LANG.global.manage}</a></li>
    </ol>
  </div>
</div>
{data.main} 
<!-- END: main --> 

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
          <div class="col_search"><label>{LANG.global.parent}:</label> {data.list_group_search}</div>
          <div class="col_search"><label>{LANG.global.brand}:</label> {data.list_brand_search}</div>
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
<div class="row">
  <div class="col-lg-12">
    <div class="table-responsive">
      <table class="table table-bordered table-hover table-striped table_row">
        <thead>
          <tr >
            <th class="header" width="3%">STT</th>
            <th class="header" width="5%">{data.f_item_code}</th>
            <th class="header" >{data.f_title}</th>
            <th class="header" width="15%">{data.f_price}</th>
            <th class="header" width="15%">{data.f_price_import}</th>
            <th class="header" width="10%">{data.f_in_stock}</th>
            <th class="header" width="10%">{data.f_out_stock}</th>
            <th class="header" width="10%">{data.f_has_stock}</th>
            <th class="header" width="7%">Màu và size</th>
          </tr>
        </thead>
        <tbody>
          {data.html_row}
          <!-- BEGIN: row_item -->
          <tr id="row_{row.item_id}">
            <td class="cot" align="center">{row.stt}</td>
            <td class="cot" align="center">{row.item_code}</td>
            <td class="cot">{row.title}</td>
            <td class="cot" align="right">{row.price}</td>
            <td class="cot" align="right">{row.price_import}</td>
            <td class="cot" align="right">{row.in_stock}</td>
            <td class="cot" align="right">{row.out_stock}</td>
            <td class="cot" align="right">{row.has_stock}</td>
            <td class="cot" align="center"><a href="{row.link_stock}" class="fancybox fancybox.ajax" >{LANG.global.view}</a></td>
          </tr>
          <!-- END: row_item --> 
          <!-- BEGIN: row_empty -->
          <tr class="warning">
            <td align="center" colspan="9">{row.mess}</td>
          </tr>
          <!-- END: row_empty --> 
        </tbody>
      </table>
    </div>
    <div class="table_nav">{data.nav}</div>
  </div>
</div>
<!-- END: manage --> 

<!-- BEGIN: manage_old --> 
<div class="panel panel-default panel_toggle {data.form_search_class}">
  <div class="panel-heading">
    <h3 class="panel-title">{LANG.global.box_search}</h3>
    <a class="toggle">&nbsp;</a>
  </div>
  <div class="panel-body">
    <div class="box_search">
      <form action="{data.link_action_search}" method="post" name="form_search" id="form_search">
        <div class="row_search">
          <div class="col_search"><label>{LANG.ordering.product_group}:</label> {data.list_group_search}</div>
          <div class="col_search"><label>{LANG.ordering.product_brand}:</label> {data.list_brand_search}</div>
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
  {data.html_row}
  <!-- BEGIN: row_item -->
  <div class="row">
    <div class="col-lg-12">
      <h3>{row.title}</h3>
      <div>{LANG.ordering.in_stock}: {row.in_stock}</div>
    </div>
  </div>
  {row.row_combine}
  <!-- END: row_item --> 
  <!-- BEGIN: row_empty -->
  <div class="row">
    <div class="col-lg-12">
      <h3>{row.mess}</h3>
    </div>
  </div>
  <!-- END: row_empty --> 
  <div class="row">
  	<div class="col-lg-12">
      <div class="table_nav">{data.nav}</div>
      <input id="do_action" type="hidden" value="" name="do_action">
    </div>
  </div>
</form>
<!-- END: manage_old --> 

<!-- BEGIN: combine --> 
<div class="row">
  <div class="col-lg-12">
    <div class="table-responsive">
      <table class="table table-bordered table-hover table-striped table_row">
        <thead>
          <tr >
            <th class="header" >{LANG.ordering.color}</th>
            <th class="header" >{LANG.ordering.size}</th>
            <th class="header" width="15%">{LANG.ordering.in_stock}</th>
            <th class="header" width="15%">{LANG.ordering.out_stock}</th>
          </tr>
        </thead>
        <tbody>
          <!-- BEGIN: row_item -->
          <tr id="row_{row.pic_id}">
            <td class="cot"><span style="background:{row.color.color}; border:1px solid #000;">&nbsp;&nbsp;&nbsp;&nbsp;</span> {row.color.title}</td>
            <td class="cot">{row.size.title}</td>
            <td class="cot" align="right">{row.in_stock}</td>
            <td class="cot" align="right">{row.out_stock}</td>
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
  </div>
</div>
<!-- END: combine --> 