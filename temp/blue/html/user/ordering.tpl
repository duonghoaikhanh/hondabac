<!-- BEGIN: main -->
{data.content}
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
<div class="manage">
  <table class="manage-table">
    <thead>
      <tr >
        <th class="cot" width="10%">{LANG.user.col_picture}</th>
        <th class="cot">{LANG.user.col_title}</th>
        <th class="cot" width="15%">{LANG.user.col_price}</th>
        <th class="cot" width="10%">{LANG.user.col_quantity}</th>
        <th class="cot" width="15%">{LANG.user.col_total}</th>
      </tr>
    </thead>
    <tbody>
      {data.row_item}
      <!-- BEGIN: row_item -->
      <tr>
        <td class="cot" align="center"><img src="{row.picture}" alt="{row.title}"/></td>
        <td class="cot">{row.title}</td>
        <td class="cot" align="center">{row.price_buy}</td>
        <td class="cot" align="center">{row.quantity}</td>
        <td class="cot" align="center">{row.total}</td>
      </tr>
      <!-- END: row_item --> 
      <!-- BEGIN: row_empty -->
      <tr>
        <td align="center" colspan="5">{row.mess}</td>
      </tr>
      <!-- END: row_empty --> 
      <tr>
        <td class="cot" align="right" colspan="4">{LANG.user.cart_total}</td>
        <td class="cot" align="right">{data.cart_total}</td>
      </tr>
    </tbody>
  </table>
</div>
<!-- END: table_cart --> 

<!-- BEGIN: edit -->
<div class="ordering_address">
	<div class="ordering_address_l">   
  	<h3>{LANG.user.ordering_address}</h3>   
    <div class="row">
      <label class="title">{LANG.user.full_name} : </label>
      <label class="content">{data.o_full_name}</label>
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.user.email} :</label>
      <label class="content">{data.o_email}</label>
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.user.phone} :</label>
      <label class="content">{data.o_phone}</label>
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.user.address} :</label>
      <label class="content">{data.o_address}</label>
      <div class="clear"></div>
    </div>
  </div>
  <div class="ordering_address_r">
  	<h3>{LANG.user.delivery_address}</h3>
    <div class="row">
      <label class="title">{LANG.user.full_name} : </label>
      <label class="content">{data.d_full_name}</label>
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.user.email} :</label>
      <label class="content">{data.d_email}</label>
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.user.phone} :</label>
      <label class="content">{data.d_phone}</label>
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.user.address} :</label>
      <label class="content">{data.d_address}</label>
      <div class="clear"></div>
    </div>  
  </div>
  <div class="clear"></div>
</div>

{data.table_cart}

<div class="ordering_method">
  <h3>{LANG.user.ordering_method}</h3>
  <div class="row">
    <label class="title">{data.method.title}</label>
    <div class="content">{data.method.content}</div>
    <div class="clear"></div>
  </div>
</div>
<div class="clear"></div>
<div class="status_order">
	<h3>{LANG.user.status_order}</h3>
  <div class="content" style="background:{data.status_order.background_color};color:{data.status_order.color};">{data.status_order.title}</div>
</div>
<div class="clear"></div>
<div class="request_more">
	<h3>{LANG.user.request_more}</h3>
  <div class="content">{data.request_more}</div>
</div>
<!-- END: edit --> 

<!-- BEGIN: manage --> 
{data.err}
<div class="manage">
  <table class="manage-table">
    <thead>
      <tr >
        <th class="cot" width="5%">{LANG.user.stt}</th>
        <th class="cot" width="5%">{LANG.user.order_code}</th>
        <th class="cot" width="15%">{LANG.user.status_order}</th>
        <th class="cot">{LANG.user.full_name}</th>
        <th class="cot" width="15%" >{LANG.user.total_order}</th>
        <th class="cot" width="15%">{LANG.user.date_create}</th>
      </tr>
    </thead>
    <tbody>
      {data.row_item}
      <!-- BEGIN: row_item -->
      <tr id="row_{row.order_id}">
        <td class="cot" align="center">{row.stt}</td>
        <td class="cot" align="center"><a href="{row.link}">{row.order_code}</a></td>
        <td class="cot" style="background:{row.status_order.background_color};color:{row.status_order.color};">{row.status_order.title}</td>
        <td class="cot">{row.o_full_name}</td>
        <td class="cot" align="right">{row.total_order}</td>
        <td class="cot" align="center">{row.date_create}</td>
      </tr>
      <!-- END: row_item --> 
      <!-- BEGIN: row_empty -->
      <tr>
        <td class="cot cot_empty" align="center" colspan="6">{row.mess}</td>
      </tr>
      <!-- END: row_empty --> 
    </tbody>
  </table>
</div>
<br />
{data.nav}
<!-- END: manage --> 