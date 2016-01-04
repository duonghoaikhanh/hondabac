<!-- BEGIN: main -->
{data.content}
<!-- END: main --> 

<!-- BEGIN: welcome -->
<div id="user_welcome">{data.content}</div>
<!-- END: welcome --> 

<!-- BEGIN: account -->
<div id="user_profile" class="user_form">
	{data.err}
  <form id="{data.form_id_pre}form_profile" name="{data.form_id_pre}form_profile" method="post" action="{data.link_action}" >
    <div class="row">
      <label class="title">{LANG.global.username}<span class="required">*</span> :</label>
      <div class="row-content">{data.username}</div>
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.global.nickname}<span class="required">*</span> :</label>
      <input name="nickname" type="text" maxlength="100" value="{data.nickname}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.global.phone}<span class="required">*</span> :</label>
      <input name="phone" type="text" maxlength="100" value="{data.phone}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.global.address}<span class="required">*</span> :</label>
      <input name="address" type="text" maxlength="100" value="{data.address}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.global.province}</label>
      {data.list_location_province}
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.global.district}</label>
      {data.list_location_district}
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.global.ward}</label>
      {data.list_location_ward}
      <div class="clear"></div>
    </div>
    <div class="row_btn">
      <input type="hidden" name="do_submit"	 value="1" />
      <input type="submit" class="btn" value="{LANG.user.btn_submit}" />
    </div>
  </form>
  <script language="javascript">
		ttHLocation.list_location_province_load_child();
		ttHLocation.list_location_district_load_child();
    $().ready(function() {
      // validate signup form on keyup and submit
      $("#{data.form_id_pre}form_profile").validate({
        rules: {
          first_name: {
						required: true
					},
					last_name: {
						required: true
					},
					phone: {
						required: true
					},
					address: {
						required: true
					}
        },
        messages: {
          first_name: "{LANG.global.err_valid_input}",
          last_name: "{LANG.global.err_valid_input}",
          phone: "{LANG.global.err_valid_input}",
          address: "{LANG.global.err_valid_input}"
        }
      });
    
    });
  </script>
</div>
<!-- END: account -->

<!-- BEGIN: profile -->
<div id="user_profile" class="user_form">
	{data.err}
  <form id="{data.form_id_pre}form_profile" name="{data.form_id_pre}form_profile" method="post" action="{data.link_action}" >
    <div class="row">
      <label class="title">{LANG.global.username}<span class="required">*</span> :</label>
      <div class="row-content">{data.username}</div>
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.global.first_name}<span class="required">*</span> :</label>
      <input name="first_name" type="text" maxlength="100" value="{data.first_name}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.global.last_name}<span class="required">*</span> :</label>
      <input name="last_name" type="text" maxlength="100" value="{data.last_name}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.global.phone}<span class="required">*</span> :</label>
      <input name="phone" type="text" maxlength="100" value="{data.phone}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.global.fax} :</label>
      <input name="fax" type="text" maxlength="100" value="{data.fax}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.global.mobile} :</label>
      <input name="mobile" type="text" maxlength="100" value="{data.mobile}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title">{LANG.global.address}<span class="required">*</span> :</label>
      <input name="address" type="text" maxlength="100" value="{data.address}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row_btn">
      <input type="hidden" name="do_submit"	 value="1" />
      <input type="submit" class="btn" value="{LANG.user.btn_submit}" />
    </div>
  </form>
  <script language="javascript">
    $().ready(function() {
      // validate signup form on keyup and submit
      $("#{data.form_id_pre}form_profile").validate({
        rules: {
          first_name: {
						required: true
					},
					last_name: {
						required: true
					},
					phone: {
						required: true
					},
					address: {
						required: true
					}
        },
        messages: {
          first_name: "{LANG.global.err_valid_input}",
          last_name: "{LANG.global.err_valid_input}",
          phone: "{LANG.global.err_valid_input}",
          address: "{LANG.global.err_valid_input}"
        }
      });
    
    });
  </script>
</div>
<!-- END: profile -->

<!-- BEGIN: address_book -->
<div class="address_book">
	<form id="form_address_book" name="form_address_book" method="post" action="" >
	<div class="address_book_l">   
  	<h3>{LANG.user.ordering_address}</h3>   
    <div class="row">
    	<br />
      <div class="clear"></div>
    </div> 
    <div class="row">
      <label class="title"><span class="required">*</span>{LANG.user.full_name}</label>
      <input id="o_full_name_0" name="data[0][o_full_name]" type="text" maxlength="100" value="{data.o_full_name}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title"><span class="required">*</span>{LANG.user.email} :</label>
      <input id="o_email_0" name="data[0][o_email]" type="text" maxlength="100" value="{data.o_email}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title"><span class="required">*</span>{LANG.user.phone} :</label>
      <input id="o_phone_0" name="data[0][o_phone]" type="text" maxlength="100" value="{data.o_phone}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title"><span class="required">*</span>{LANG.user.address} :</label>
      <input id="o_address_0" name="data[0][o_address]" type="text" maxlength="100" value="{data.o_address}" class="input_text" />
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
  <div class="address_book_r">
  	<h3>{LANG.user.delivery_address}</h3>
    <div class="row">
      <label><input id="same_address" type="checkbox" value="1" />{LANG.user.od_same}</label>
      <div class="clear"></div>
    </div> 
    <div class="row">
      <label class="title"><span class="required">*</span>{LANG.user.full_name}</label>
      <input id="d_full_name_0" name="data[0][d_full_name]" type="text" maxlength="100" value="{data.d_full_name}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title"><span class="required">*</span>{LANG.user.email} :</label>
      <input id="d_email_0" name="data[0][d_email]" type="text" maxlength="100" value="{data.d_email}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title"><span class="required">*</span>{LANG.user.phone} :</label>
      <input id="d_phone_0" name="data[0][d_phone]" type="text" maxlength="100" value="{data.d_phone}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label class="title"><span class="required">*</span>{LANG.user.address} :</label>
      <input id="d_address_0" name="data[0][d_address]" type="text" maxlength="100" value="{data.d_address}" class="input_text" />
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
    <div class="row_btn">
      <input type="hidden" name="do_submit"	 value="1" />
      <input type="submit" class="btn" value="{LANG.user.btn_submit}" />
    </div>
  </div>
  </form>
  <div class="clear"></div>
  <script language="javascript">
		ttHLocation.list_location_province_load_child();
		ttHLocation.list_location_district_load_child();
		ttHUser.same_address();
		$().ready(function() {
			// validate signup form on keyup and submit
			$("#form_address_book").validate({
				rules: {
					'data[0][o_full_name]': {
						required: true
					},
					'data[0][o_email]': {
						required: true,
						email: true
					},
					'data[0][o_phone]': {
						required: true
					},
					'data[0][o_address]': {
						required: true
					},
					'data[0][d_full_name]': {
						required: true
					},
					'data[0][d_email]': {
						required: true,
						email: true
					},
					'data[0][d_phone]': {
						required: true
					},
					'data[0][d_address]': {
						required: true
					}
				},
				messages: {
					'data[0][o_full_name]': "{LANG.global.err_valid_input}",
					'data[0][o_email]': "{LANG.global.err_invalid_email}",
					'data[0][o_phone]': "{LANG.global.err_valid_input}",
					'data[0][o_address]': "{LANG.global.err_valid_input}",
					'data[0][d_full_name]': "{LANG.global.err_valid_input}",
					'data[0][d_email]': "{LANG.global.err_invalid_email}",
					'data[0][d_phone]': "{LANG.global.err_valid_input}",
					'data[0][d_address]': "{LANG.global.err_valid_input}"
				}
			});
		
		});
	</script>
</div>
<!-- END: address_book -->

<!-- BEGIN: change_pass -->
{data.content}
<div id="user_change_pass" class="user_form">
	{data.err}
  <form id="{data.form_id_pre}form_change_pass" name="{data.form_id_pre}form_change_pass" method="post" action="{data.link_action}" >
    <div class="row">
      <label>{LANG.global.password_cur}<span class="required">*</span> :</label>
      <input id="password_cur" name="password_cur" type="password" maxlength="100" value="" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label>{LANG.global.password}<span class="required">*</span> :</label>
      <input id="password" name="password" type="password" maxlength="100" value="" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label>{LANG.global.re_password}<span class="required">*</span> :</label>
      <input name="re_password" type="password" maxlength="100" value="" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row_btn">
      <input type="hidden" name="do_submit"	 value="1" />
      <input type="submit" class="btn" value="{LANG.user.btn_submit}" />
    </div>
  </form>
  <script language="javascript">
    $().ready(function() {
      // validate signup form on keyup and submit
      $("#{data.form_id_pre}form_change_pass").validate({
        rules: {
					password_cur: {
						required: true
					},
					password: {
						required: true
					},
					re_password: {
						equalTo: '#password'
					}
        },
        messages: {
          password_cur: "{LANG.global.err_valid_input}",
          password: "{LANG.global.err_valid_input}",
					re_password: "{LANG.global.err_invalid_re_password}"
        }
      });
    
    });
  </script>
</div>
<!-- END: change_pass -->

<!-- BEGIN: forget_pass -->
{data.content}
<div id="user_forgot_pass" class="user_form">
	{data.err}
  <form id="{data.form_id_pre}form_change_pass" name="{data.form_id_pre}form_change_pass" method="post" action="{data.link_action}" >
    <div class="row">
      <label>{LANG.global.username}<span class="required">*</span> :</label>
      <input id="username" name="username" type="text" maxlength="100" value="" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row_btn">
      <input type="hidden" name="do_submit"	 value="1" />
      <input type="submit" class="btn" value="{LANG.user.btn_submit}" />
    </div>
  </form>
  <script language="javascript">
    $().ready(function() {
      // validate signup form on keyup and submit
      $("#{data.form_id_pre}form_change_pass").validate({
        rules: {
					username: {
						required: true
					}
        },
        messages: {
          username: "{LANG.global.err_valid_input}"
        }
      });
    
    });
  </script>
</div>
<!-- END: forget_pass -->

<!-- BEGIN: signup -->
<div class="user_signup">
	<div class="out_info">
    <div class="out_info-content">
    	<div class="out_info-title">{LANG.user.signup_info_title}</div>
      <!-- BEGIN: method -->
      <div class="method_row {row.class}">
      	<div>
          <a href="#method-popup-{row.method_id}" class="fancybox">
            <!-- BEGIN: img -->
            <div class="method-img"><img src="{row.picture}" alt="{row.title}"/></div>
            <!-- END: img -->
            <!-- BEGIN: title -->
            <div class="method-title"></div>
            <!-- END: title -->
          </a>
        </div>
        <div class="method-short">{row.short}</div>
        <div id="method-popup-{row.method_id}" class="method-popup" style="display:none">{row.content}</div>
      </div>
      <!-- END: method -->
    </div>
  </div>
  <div class="user_signup_r">
  	<div class="user_signup-title">{LANG.user.form_signup_title}</div>
    <div class="user_signup">
      {data.form_signup}
    </div>
  </div>
  <div class="clear"></div>
</div>
<!-- END: signin --> 

<!-- BEGIN: signin -->
<div class="user_login">
	<div class="out_info">
    <div class="out_info-content">
    	<div class="out_info-title">{LANG.user.signup_info_title}</div>
      <!-- BEGIN: method -->
      <div class="method_row {row.class}">
      	<div>
          <a href="#method-popup-{row.method_id}" class="fancybox">
            <!-- BEGIN: img -->
            <div class="method-img"><img src="{row.picture}" alt="{row.title}"/></div>
            <!-- END: img -->
            <!-- BEGIN: title -->
            <div class="method-title"></div>
            <!-- END: title -->
          </a>
        </div>
        <div class="method-short">{row.short}</div>
        <div id="method-popup-{row.method_id}" class="method-popup" style="display:none">{row.content}</div>
      </div>
      <!-- END: method -->
    </div>
  </div>
	<div class="user_login_r">
  	<div class="user_login-title">{LANG.user.form_signin_title}</div>
    <div class="user_signin">{data.form_signin}</div>
  </div>
  <div class="clear"></div>
</div>
<!-- END: signin --> 

<!-- BEGIN: promotion --> 
<div class="manage">
  <table class="manage-table">
    <thead>
      <tr >
        <th class="cot" width="20%">{LANG.user.promotion_code}</th>
        <th class="cot" width="20%" >{LANG.user.percent}</th>
        <th class="cot" width="25%">{LANG.user.date_end}</th>
        <th class="cot">{LANG.user.promotion_status}</th>
      </tr>
    </thead>
    <tbody>
      {data.row_item}
      <!-- BEGIN: row_item -->
      <tr>
        <td class="cot" align="center">{row.promotion_id}</td>
        <td class="cot" align="right">{row.percent}%</td>
        <td class="cot" align="center">{row.date_end}</td>
        <td class="cot" style="background:{row.status.background_color};color:{row.status.color};">{row.status.title}</td>
      </tr>
      <!-- END: row_item --> 
      <!-- BEGIN: row_empty -->
      <tr>
        <td class="cot cot_empty" align="center" colspan="5">{row.mess}</td>
      </tr>
      <!-- END: row_empty --> 
    </tbody>
  </table>
</div>
<br />
{data.nav}
<!-- END: promotion --> 

<!-- BEGIN: voucher --> 
<div class="manage">
  <table class="manage-table">
    <thead>
      <tr >
        <th class="cot" width="20%">{LANG.user.voucher_code}</th>
        <th class="cot" width="20%" >{LANG.user.amount}</th>
        <th class="cot" width="20%" >{LANG.user.amount_use}</th>
        <th class="cot" width="25%">{LANG.user.date_end}</th>
      </tr>
    </thead>
    <tbody>
      {data.row_item}
      <!-- BEGIN: row_item -->
      <tr>
        <td class="cot" align="center">{row.voucher_id}</td>
        <td class="cot" align="right">{row.amount}</td>
        <td class="cot" align="right">{row.amount_use}</td>
        <td class="cot" align="center">{row.date_end}</td>
      </tr>
      <!-- END: row_item --> 
      <!-- BEGIN: row_empty -->
      <tr>
        <td class="cot cot_empty" align="center" colspan="4">{row.mess}</td>
      </tr>
      <!-- END: row_empty --> 
    </tbody>
  </table>
</div>
<br />
{data.nav}
<!-- END: voucher --> 