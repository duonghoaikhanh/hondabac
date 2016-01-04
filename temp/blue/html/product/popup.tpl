<!-- BEGIN: main -->
{data.content}
<!-- END: main --> 

<!-- BEGIN: table_cart -->
<div class="cart_content"> 
	<div id="form_cart">
  	<div class="form_mess">{data.err}</div>
    <table class="cart_table" width="100%" border="0" cellpadding="8" cellspacing="1">
      <tr>
        <th class="col" width="7%">{LANG.product.col_picture}</th>
        <th class="col">{LANG.product.col_title}</th>
        <th class="col" width="12%">{LANG.product.col_color}</th>
        <th class="col" width="10%">{LANG.product.col_size}</th>
        <th class="col" width="12%">{LANG.product.col_price}</th>
        <th class="col" width="10%">{LANG.product.col_quantity}</th>
        <th class="col" width="12%">{LANG.product.col_total}</th>
        <th class="col" width="3%">{LANG.product.col_delete}</th>
      </tr>
      <!-- BEGIN: row_item -->
      <tr class="cart_row" id="cart_{row.cart_id}">
        <td class="col" align="center"><img src="{row.picture}" alt="{row.title}"/></td>
        <td class="col">{row.title}</td>
        <td class="col" align="center">{row.color}</td>
        <td class="col" align="center">{row.size}</td>
        <td class="col up_price_buy" align="center" value="{row.price_buy}">{row.price_buy_text}</td>
        <td class="col up_quantity" align="center">{row.quantity_text}</td>
        <td class="col up_total" align="center">{row.total}</td>
        <td class="col" align="center"><a href="javascript:void(0)" class="delete_cart"cart_item="{row.cart_id}"><img src="{DIR_IMAGE}icon_trash.png" alt="{LANG.product.col_delete}"/></a></td>
      </tr>
      <!-- END: row_item --> 
      <!-- BEGIN: row_empty -->
      <tr><td class="col col_empty" colspan="8">{row.mess}</td></tr>
      <!-- END: row_empty --> 
      <tr>
        <td class="col col_total cart_total" align="right" colspan="8" data-min_cart_promotion="{data.min_cart_promotion}">
          <span class="col-title">{LANG.product.cart_total}:</span>
          <span class="col-content">{data.cart_total}</span>
        </td>
      </tr>
    </table>
  </div>
  <script language="javascript">ttHOrdering.cart_del_item();</script>
  <div class="clear"></div>  
</div>
<!-- END: table_cart --> 

<!-- BEGIN: ordering_user -->
<div class="ordering_user">
	<div class="ordering_user_l">
  	<div class="ordering_user-title">{LANG.product.form_signin_title}</div>
    <div class="ordering_signin">{data.form_signin}<div class="clear"></div></div>
  </div>
  <div class="ordering_user_r">
  	<div class="ordering_user-title">{LANG.product.form_signup_title}</div>
    <div class="ordering_signup">{data.form_signup}<div class="clear"></div></div>
  </div>
  <div class="clear"></div>
</div>
<!-- END: ordering_user --> 

<!-- BEGIN: ordering_address -->
<div class="ordering_address">
	<div class="ordering_address_l">   
  	<h3>{LANG.product.ordering_address}</h3>   
    <div class="row">
    	<br />
      <div class="clear"></div>
    </div> 
    <div class="row">
      <label class="title">{LANG.product.full_name}</label>
      <input name="o_full_name" type="text" maxlength="100" value="{data.o_full_name}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.product.email}</label>
      <input name="o_email" type="text" maxlength="100" value="{data.o_email}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.product.phone}</label>
      <input name="o_phone" type="text" maxlength="100" value="{data.o_phone}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.product.address}</label>
      <input name="o_address" type="text" maxlength="100" value="{data.o_address}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.global.province}</label>
      {data.o_list_location_province}
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.global.district}</label>
      {data.o_list_location_district}
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.global.ward}</label>
      {data.o_list_location_ward}
      <div class="clear"></div>
    </div>
  </div>
  <div class="ordering_address_r">
  	<h3>{LANG.product.delivery_address}</h3>
    <div class="row">
      <label><input id="same_address" type="checkbox" value="1" />{LANG.product.same_address}</label>
      <div class="clear"></div>
    </div> 
    <div class="row">
      <label class="title">{LANG.product.full_name}</label>
      <input name="d_full_name" type="text" maxlength="100" value="{data.d_full_name}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.product.email}</label>
      <input name="d_email" type="text" maxlength="100" value="{data.d_email}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.product.phone}</label>
      <input name="d_phone" type="text" maxlength="100" value="{data.d_phone}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.product.address}</label>
      <input name="d_address" type="text" maxlength="100" value="{data.d_address}" class="input_text" />
      <div class="clear"></div>
    </div> 
    <div class="row">
      <label class="title">{LANG.global.province}</label>
      {data.d_list_location_province}
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.global.district}</label>
      {data.d_list_location_district}
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.global.ward}</label>
      {data.d_list_location_ward}
      <div class="clear"></div>
    </div>
  </div>
  <div class="clear"></div>
  <script language="javascript">
		ttHLocation.list_location_province_load_child();
		ttHLocation.list_location_district_load_child();
		ttHOrdering.same_address();
		$().ready(function() {
			// validate signup form on keyup and submit
			$("#form_ordering_address").validate({
				rules: {
					o_full_name: {
						required: true
					},
					o_email: {
						required: true,
						email: true
					},
					o_phone: {
						required: true
					},
					o_address: {
						required: true
					},
					o_province: {
						required: true
					},
					o_district: {
						required: true
					},
					o_ward: {
						required: true
					},
					d_full_name: {
						required: true
					},
					d_email: {
						required: true,
						email: true
					},
					d_phone: {
						required: true
					},
					d_address: {
						required: true
					},
					d_province: {
						required: true
					},
					d_district: {
						required: true
					},
					d_ward: {
						required: true
					},
				},
				messages: {
					o_full_name: "{LANG.global.err_valid_input}",
					o_email: "{LANG.global.err_invalid_email}",
					o_phone: "{LANG.global.err_valid_input}",
					o_address: "{LANG.global.err_valid_input}",
					o_province: "{LANG.global.err_valid_input}",
					o_district: "{LANG.global.err_valid_input}",
					o_ward: "{LANG.global.err_valid_input}",
					d_full_name: "{LANG.global.err_valid_input}",
					d_email: "{LANG.global.err_invalid_email}",
					d_phone: "{LANG.global.err_valid_input}",
					d_address: "{LANG.global.err_valid_input}",
					d_province: "{LANG.global.err_valid_input}",
					d_district: "{LANG.global.err_valid_input}",
					d_ward: "{LANG.global.err_valid_input}"
				}
			});
		
		});
	</script>
</div>
<!-- END: ordering_address --> 

<!-- BEGIN: ordering_method -->
<form id="form_ordering_address" name="form_ordering_address" method="post" action="" >
{data.ordering_address}
{data.ordering_method}
<div id="ordering_method_input">
  <div class="ordering_method">
    <div class="request_more">
      <label class="title">{LANG.product.request_more}</label>
      <div><textarea name="request_more" class="textarea" rows="5" >{data.request_more}</textarea></div>
      <div class="clear"></div>
    </div> 
    <div class="row_btn" align="right">
      <input type="hidden" name="do_submit"	 value="save" />
      <input type="submit" class="btn" value="{LANG.product.btn_complete}"/>
    </div>
  </div>
</div> 
</form>
<script language="javascript">
function hide_content(e){
	$('.'+e+' .content .row .row-title input').each(function(){
		var c = $(this).prop('checked');
		content = $(this).parent().parent().find('.row-content');
		if (c){
			content.stop(true, true).slideDown(200);
		}else{
			content.stop(true, true).slideUp(200);
		}
	})
}
hide_content('ordering_method_shipping');
hide_content('ordering_method_method');
$('.ordering_method_shipping').click(function(){
hide_content('ordering_method_shipping');
});
$('.ordering_method_method').click(function(){
hide_content('ordering_method_method');
});
</script>
<!-- END: ordering_method --> 

<!-- BEGIN: table_cart_ordering_method -->
<div class="cart_content">
	<div id="form_cart" class="frame">
  <a class="frame-icon icon-edit" href="{data.link_edit}">{LANG.global.change}</a>
  	<div class="form_mess"></div>
    <table class="cart_table" width="100%" border="0" cellpadding="8" cellspacing="1" {data.cart_table_attr}>
      <tr>
        <th class="col" width="10%" {data.cart_th_attr}>{LANG.product.col_picture}</th>
        <th class="col" {data.cart_th_attr}>{LANG.product.col_title}</th>
        <th class="col" width="15%" {data.cart_th_attr}>{LANG.product.col_price}</th>
        <th class="col" width="10%" {data.cart_th_attr}>{LANG.product.col_quantity}</th>
        <th class="col" width="15%" {data.cart_th_attr}>{LANG.product.col_total}</th>
      </tr>
      <!-- BEGIN: row_item -->
      <tr class="cart_row" id="cart_{row.cart_id}">
        <td class="col" align="center" {row.cart_td_attr}><img src="{row.picture}" alt="{row.title}"/></td>
        <td class="col" {row.cart_td_attr}>{row.title}</td>
        <td class="col" align="center" {row.cart_td_attr}>{row.price_buy}</td>
        <td class="col" align="center" {row.cart_td_attr}>{row.quantity}</td>
        <td class="col" align="center" {row.cart_td_attr}>{row.total}</td>
      </tr>
      <!-- END: row_item --> 
      <!-- BEGIN: row_empty -->
      <tr><td class="col col_empty" colspan="5" {row.cart_empty_attr}>{row.mess}</td></tr>
      <!-- END: row_empty --> 
      <tr>
        <td class="col col_total" align="right" colspan="5" {data.cart_total_attr}>
          <span class="col-title">{LANG.product.cart_total}:</span>
          <span class="col-content">{data.cart_total}</span>
        </td>
      </tr>
    </table>
  </div>
</div>
<!-- END: table_cart_ordering_method --> 

<!-- BEGIN: ordering_method_method -->
<div class="ordering_method_method">
	<div class="title">{LANG.product.ordering_method}</div>
  <div class="content">
  	<!-- BEGIN: row -->
  	<div class="row">
    	<div class="row-title"><input type="radio" id="method_{row.method_id}" name="method" value="{row.method_id}" {row.method_checked} /><label for="method_{row.method_id}">{row.title}</label></div>
    	<div class="row-content">{row.content}</div>
    </div>
    <!-- END: row --> 
  </div>
  <div class="clear"></div>
</div>
<!-- END: ordering_method_method --> 

<!-- BEGIN: ordering_complete -->
<div class="ordering_complete">
  <div class="content"><div>{data.content}</div></div>
  <div class="clear"></div>
</div>
<!-- END: ordering_complete --> 