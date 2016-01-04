<!-- BEGIN: main -->
{data.content}
<!-- END: main --> 

<!-- BEGIN: table_cart -->
<div class="cart_content">
	<div id="form_cart">
  	<div class="form_mess">{data.err}</div>
    <table class="cart_table" width="100%" border="0" cellpadding="8" cellspacing="1">
      <tr>
        <th class="col" width="10%">{LANG.product.col_picture}</th>
        <th class="col">{LANG.product.col_title}</th>
        <th class="col" width="15%">{LANG.product.col_price}</th>
        <th class="col" width="10%">{LANG.product.col_quantity}</th>
        <th class="col" width="15%">{LANG.product.col_total}</th>
        <th class="col" width="5%">{LANG.product.col_delete}</th>
      </tr>
      <!-- BEGIN: row_item -->
      <tr class="cart_row" id="cart_{row.cart_id}">
        <td class="col" align="center"><img src="{row.picture}" alt="{row.title}"/></td>
        <td class="col">{row.title}</td>
        <td class="col up_price_buy" align="center" value="{row.price_buy}">{row.price_buy_text}</td>
        <td class="col up_quantity" align="center">{row.quantity_text}</td>
        <td class="col up_total" align="center">{row.total}</td>
        <td class="col" align="center"><a href="javascript:void(0)" class="delete_cart"cart_item="{row.cart_id}"><img src="{DIR_IMAGE}icon_trash.png" alt="{LANG.product.col_delete}"/></a></td>
      </tr>
      <!-- END: row_item --> 
      <!-- BEGIN: row_empty -->
      <tr><td class="col col_empty" colspan="6">{row.mess}</td></tr>
      <!-- END: row_empty --> 
      <tr>
        <td class="col col_total cart_total" align="right" colspan="6" data-min_cart_promotion="{data.min_cart_promotion}">
          <span class="col-title">{LANG.product.cart_total}:</span>
          <span class="col-content">{data.cart_total}</span>
        </td>
      </tr>
    </table>
    <div class="row_btn" align="right">
      <input type="button" class="btn" value="{LANG.product.btn_payment}" onclick="ttHOrdering.cart_update('form_cart','{data.link_ordering_address}');"/>
      <input type="button" class="btn" value="{LANG.product.btn_update}" onclick="ttHOrdering.cart_update('form_cart');"/>
    </div>
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
	<form id="form_ordering_address" name="form_ordering_address" method="post" action="" >
	<div class="ordering_address_l">   
  	<h3>{LANG.product.ordering_address}</h3>   
    <div class="row">
    	<br />
      <div class="clear"></div>
    </div> 
    <div class="row">
      <label class="title"><span class="required">*</span>{LANG.product.full_name}</label>
      <input name="o_full_name" type="text" maxlength="100" value="{data.o_full_name}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title"><span class="required">*</span>{LANG.product.email} :</label>
      <input name="o_email" type="text" maxlength="100" value="{data.o_email}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title"><span class="required">*</span>{LANG.product.phone} :</label>
      <input name="o_phone" type="text" maxlength="100" value="{data.o_phone}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title"><span class="required">*</span>{LANG.product.address} :</label>
      <input name="o_address" type="text" maxlength="100" value="{data.o_address}" class="input_text" />
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
      <label class="title"><span class="required">*</span>{LANG.product.full_name}</label>
      <input name="d_full_name" type="text" maxlength="100" value="{data.d_full_name}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title"><span class="required">*</span>{LANG.product.email} :</label>
      <input name="d_email" type="text" maxlength="100" value="{data.d_email}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title"><span class="required">*</span>{LANG.product.phone} :</label>
      <input name="d_phone" type="text" maxlength="100" value="{data.d_phone}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title"><span class="required">*</span>{LANG.product.address} :</label>
      <input name="d_address" type="text" maxlength="100" value="{data.d_address}" class="input_text" />
      <div class="clear"></div>
    </div> 
    <div class="row_btn">
      <input type="hidden" name="do_submit"	 value="1" />
      <input type="submit" class="btn" value="{LANG.product.btn_submit}" />
    </div>
  </div>
  </form>
  <div class="clear"></div>
  <script language="javascript">
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
					}
				},
				messages: {
					o_full_name: "{LANG.global.err_valid_input}",
					o_email: "{LANG.global.err_invalid_email}",
					o_phone: "{LANG.global.err_valid_input}",
					o_address: "{LANG.global.err_valid_input}",
					d_full_name: "{LANG.global.err_valid_input}",
					d_email: "{LANG.global.err_invalid_email}",
					d_phone: "{LANG.global.err_valid_input}",
					d_address: "{LANG.global.err_valid_input}"
				}
			});
		
		});
	</script>
</div>
<!-- END: ordering_address --> 

<!-- BEGIN: ordering_method -->
<form id="form_ordering_address" name="form_ordering_address" method="post" action="{data.link_action}" >
<div id="ordering_method_input">
  {data.content}
  <div class="ordering_method">
    <!-- BEGIN: request_more -->
    <div class="request_more">
      <label class="title">{LANG.product.request_more} :</label>
      <div><textarea name="request_more" class="textarea" rows="5" >{data.request_more}</textarea></div>
      <div class="clear"></div>
    </div> 
    <!-- END: request_more --> 
    <!-- BEGIN: request_more_text -->
    <div class="request_more frame">
      <a class="frame-icon icon-edit" href="{link_edit}">{LANG.global.change}</a>
      <label class="title">{LANG.product.request_more} :</label>
      <div>{data.request_more}</div>
      <div class="clear"></div>
    </div> 
    <!-- END: request_more_text --> 
    <div class="row_btn" align="right">
      <input type="hidden" name="do_submit"	 value="1" />
      <input type="submit" class="btn" value="{LANG.product.btn_complete}"/>
      <input type="button" class="btn" value="{LANG.product.btn_buy_more}" onclick="go_link('{data.link_buy_more}');"/>
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
        <th class="col" width="10%" {data.cart_th_attr}>{LANG.product.col_size}</th>
        <th class="col" width="15%" {data.cart_th_attr}>{LANG.product.col_price}</th>
        <th class="col" width="10%" {data.cart_th_attr}>{LANG.product.col_quantity}</th>
        <th class="col" width="15%" {data.cart_th_attr}>{LANG.product.col_total}</th>
      </tr>
      <!-- BEGIN: row_item -->
      <tr class="cart_row" id="cart_{row.cart_id}">
        <td class="col" align="center" {row.cart_td_attr}><img src="{row.picture}" alt="{row.title}"/></td>
        <td class="col" {row.cart_td_attr}>{row.title}</td>
        <td class="col" align="center" {row.cart_td_attr}>{row.size}</td>
        <td class="col" align="center" {row.cart_td_attr}>{row.price_buy}</td>
        <td class="col" align="center" {row.cart_td_attr}>{row.quantity}</td>
        <td class="col" align="center" {row.cart_td_attr}>{row.total}</td>
      </tr>
      <!-- END: row_item --> 
      <!-- BEGIN: row_empty -->
      <tr><td class="col col_empty" colspan="6" {row.cart_empty_attr}>{row.mess}</td></tr>
      <!-- END: row_empty --> 
      <tr>
        <td class="col col_total" align="right" colspan="6" {data.cart_total_attr}>
          <span class="col-title">{LANG.product.cart_total}:</span>
          <span class="col-content">{data.cart_total}</span>
        </td>
      </tr>
      <tr>
        <td class="col col_total" align="right" colspan="6" {data.cart_total_attr}>
          <span class="col-title">{LANG.product.promotional_code}:</span>
          <span class="col-content cart_promotion">-<span class="number">{data.promotion_percent}</span>%</span>
        </td>
      </tr>
      <!-- BEGIN: shipping_price -->
      <tr>
        <td class="col col_total" align="right" colspan="6" {data.cart_total_attr}>
          <span class="col-title">{LANG.product.cart_shipping}:</span>
          <span class="col-content cart_shipping">{data.shipping_price_out}</span>
        </td>
      </tr>
      <!-- END: shipping_price --> 
      <tr>
        <td class="col col_total" align="right" colspan="6" {data.cart_total_attr}>
          <span class="col-title">{LANG.product.gift_voucher}:</span>
          <span class="col-content cart_voucher">-{data.voucher_amount_out}</span>
        </td>
      </tr>
      <tr>
        <td class="col col_total cart_payment" align="right" colspan="6" {data.cart_total_attr}>
          <span class="col-title">{LANG.product.cart_payment}:</span>
          <span class="col-content">{data.cart_payment}</span>
        </td>
      </tr>
    </table>
  </div>
</div>
<!-- END: table_cart_ordering_method --> 

<!-- BEGIN: ordering_method_address -->
<div class="ordering_address frame">
  <a class="frame-icon icon-edit" href="{data.link_edit}">{LANG.global.change}</a>
	<div class="ordering_address_l">   
  	<h3>{LANG.product.ordering_address}</h3>   
    <div class="row">
      <label class="title">{LANG.product.full_name}</label>
      <label class="content">{data.o_full_name}</label>
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.product.email} :</label>
      <label class="content">{data.o_email}</label>
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.product.phone} :</label>
      <label class="content">{data.o_phone}</label>
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.product.address} :</label>
      <label class="content">{data.o_address}</label>
      <div class="clear"></div>
    </div>
  </div>
  <div class="ordering_address_r">
  	<h3>{LANG.product.delivery_address}</h3>
    <div class="row">
      <label class="title">{LANG.product.full_name}</label>
      <label class="content">{data.d_full_name}</label>
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.product.email} :</label>
      <label class="content">{data.d_email}</label>
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.product.phone} :</label>
      <label class="content">{data.d_phone}</label>
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.product.address} :</label>
      <label class="content">{data.d_address}</label>
      <div class="clear"></div>
    </div>  
  </div>
  <div class="clear"></div>
</div>
<!-- END: ordering_method_address --> 

<!-- BEGIN: ordering_method_shipping -->
<div class="ordering_method_shipping">
	<div class="title">{LANG.product.ordering_shipping}</div>
  <div class="content">
  	<!-- BEGIN: row -->
  	<div class="row">
    	<div class="row-title"><input type="radio" id="shipping_{row.shipping_id}" name="shipping" value="{row.shipping_id}" {row.shipping_checked} /><label for="shipping_{row.shipping_id}">{row.title} ({row.price})</label></div>
    	<div class="row-content">{row.content}</div>
    </div>
    <!-- END: row --> 
  </div>
  <div class="clear"></div>
</div>
<!-- END: ordering_method_shipping --> 

<!-- BEGIN: ordering_method_shipping_statistic -->
<div class="ordering_method_shipping statistic frame">
  <a class="frame-icon icon-edit" href="{data.link_edit}">{LANG.global.change}</a>
	<div class="title">{LANG.product.ordering_shipping}</div>
  <div class="content">
  	<div class="row">
    	<div class="row-title"><label>{data.title} ({data.price})</label></div>
    	<div class="row-content">{data.content}</div>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!-- END: ordering_method_shipping_statistic --> 

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

<!-- BEGIN: ordering_method_method_statistic -->
<div class="ordering_method_method statistic frame">
  <a class="frame-icon icon-edit" href="{data.link_edit}">{LANG.global.change}</a>
	<div class="title">{LANG.product.ordering_method}</div>
  <div class="content">
  	<div class="row">
    	<div class="row-title"><label>{data.title}</label></div>
    	<div class="row-content">{data.content}</div>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!-- END: ordering_method_method_statistic --> 

<!-- BEGIN: ordering_complete -->
<div class="ordering_complete">
  <div class="content"><div>{data.content}</div></div>
  <div class="clear"></div>
  <div class="row_btn" align="right">
    <input type="button" class="btn" value="{LANG.product.btn_buy_more}" onclick="go_link('{data.link_buy_more}');"/>
  </div>
</div>
<!-- END: ordering_complete --> 