ttHOrdering = {
	cart_update_html:function (form_id) {
		var total_cart = 0;
		var cart_payment = 0;
		var cart_promotion = 0;
		$('#'+form_id+' .cart_row').each(function() {
      var price_buy = parseInt($(this).find('.up_price_buy').attr('value'));
      var quantity = parseInt($(this).find('.quantity option:selected').val());
      var total = price_buy*quantity;
			total_cart +=total;
			
			//$(this).find('.up_total .number').text(accounting.formatNumber(total));
			$(this).find('.up_total .number').data({value : total});
    });
		
		cart_payment = total_cart;
		
		if($('.cart_promotion','#'+form_id).length) {
			if(total_cart >= $('.cart_total','#'+form_id).data('min_cart_promotion')) {
				cart_promotion = $('.cart_promotion','#'+form_id).attr('value');
				cart_payment = ((100 - cart_promotion) / 100) * cart_payment;
				$('.cart_promotion .number','#'+form_id).text(cart_promotion);
			} else {
				$('.cart_promotion .number','#'+form_id).text(0);
			}
		}
		
		if($('.cart_voucher','#'+form_id).length) {
			cart_voucher = $('.cart_voucher','#'+form_id).attr('value');
			cart_voucher_out = cart_voucher;
			if(cart_voucher > cart_payment) {
				cart_voucher_out = cart_payment;
				cart_payment = 0;
			} else {
				cart_payment -= cart_voucher;
			}
			
			$('#'+form_id).find('.cart_voucher .number').data({value : cart_voucher_out});
		}
		
		/*$('#'+form_id).find('.cart_total .number').text(accounting.formatNumber(total_cart));
		$('#'+form_id).find('.cart_voucher .number').text(accounting.formatNumber(cart_voucher_out));
		$('#'+form_id).find('.cart_payment .number').text(accounting.formatNumber(cart_payment));*/
		$('#'+form_id).find('.cart_total .number').data({value : total_cart});
		
		if($('.cart_payment','#'+form_id).length) {
			$('#'+form_id).find('.cart_payment .number').data({value : cart_payment});
		}
		
		auto_rate_exchange();
		return false;
	},
	cart_update:function (form_id, link_go) {
		loading('show');
		var form_mess = $('#'+form_id).find('.form_mess');
		form_mess.stop(true,true).slideUp(200).html('');
		var quantity = {};
		$('#'+form_id+' .cart_row').each(function(){
			var cid = $(this).attr('id').replace('cart_',''); 
			var val = $(this).find('select[for="'+cid+'"]').find('option:selected').val(); 
			quantity[cid] = val;
			//alert(quantity[cid]);
		})
		//quantity = encodeURIComponent(quantity);
		/*alert(quantity);
		alert('aa');*/
		
		$.ajax({
			type: "POST",
			url: ROOT+"ajax.php",
			data: { "m" : "product", "f" : "cart_update", "quantity" : quantity }
		}).done(function( string ) {
			loading('hide');
			var data = JSON.parse(string);
			if(data.ok == 1) {
				
				if(data.mess_class == 'success') {
					header_cart();
					ttHOrdering.cart_update_html(form_id);
					
					if(link_go) {
						//jAlert(data.mess, lang_js['aleft_title'], function(){go_link(link_go);}, data.mess_class);
						go_link(link_go);
					} else {
						jAlert(data.mess, lang_js['aleft_title'], null, data.mess_class);
					}
				} else {
					jAlert(data.mess, lang_js['aleft_title'], function(){go_link('');}, data.mess_class);
				}
			} else {
				form_mess.html(ttHTemp.html_alert(lang_js['update_false'],'error')).stop(true,true).slideDown(200);
			}
		});
		return false;
	},
	
	cart_del_item:function () {
		
		$('#form_cart .col .delete_cart').click(function(){
			var form_mess = $('#form_cart').find('.form_mess');
			form_mess.stop(true,true).slideUp(200).html('');
			var cart_item = $(this).attr('cart_item');
			
			loading('show');
			
			$.ajax({
				type: "POST",
				url: ROOT+"ajax.php",
				data: { "m" : "product", "f" : "cart_del_item", "cart_item" : cart_item }
			}).done(function( ok ) {
				
				loading('hide');
				
				if(ok == 1) {
					$('#form_cart #cart_'+cart_item).remove();
					header_cart();
					ttHOrdering.cart_update_html('form_cart');
					//form_mess.html(ttHTemp.html_alert(lang_js['delete_success'],'success')).stop(true,true).slideDown(200);
					jAlert(lang_js['delete_success'], lang_js['aleft_title'], null, 'success');
					
					if($('#form_cart tr.cart_row').length <= 0) {
						go_link(ROOT+"popup.php?m=product&f=cart_empty");
					}
				} else {
					form_mess.html(ttHTemp.html_alert(lang_js['delete_false'],'error')).stop(true,true).slideDown(200);
				}
			});
		});
		return false;
	},
	
	signup:function (form_id, link_go) {
		$.validator.setDefaults({
			submitHandler: function() {
				var form_mess = $('#'+form_id).find('.form_mess');
				form_mess.stop(true,true).slideUp(200).html('');
				var fData = $("#"+form_id).serializeArray();
				
				loading('show');
				
				$.ajax({
					type: "POST",
					url: ROOT+"ajax.php",
					data: { "m" : "user", "f" : "signup", "data" : fData }
				}).done(function( string ) {
					
					loading('hide');
					
					var data = JSON.parse(string);
					if(data.ok == 1) {
						//form_mess.html(ttHTemp.html_alert(data.mess,'success')).stop(true,true).slideDown(200);
						//alert(data.mess);
						//go_link(link_go);
						jAlert(data.mess, lang_js['aleft_title'], function(){go_link(link_go);}, 'success');
					} else {
						form_mess.html(ttHTemp.html_alert(data.mess,'error')).stop(true,true).slideDown(200);
					}
				});
				//e.preventDefault(); //STOP default action
				//e.unbind(); //unbind. to stop multiple form submit.
				return false;
			}
		});
		$("#"+form_id).validate({
			rules: {
				nickname: {
					required: true
				},
				username: {
					required: true,
					email: true
				},
				password: {
					required: true
				},
				re_password: {
					equalTo: '#'+form_id+' #password'
				},
				/*phone: {
					required: true
				},*/
				address: {
					required: true
				},
				captcha: {
					required: true
				}
			},
			messages: {
				nickname: lang_js['err_valid_input'],
				username: {
					required: lang_js['err_valid_input'],
					email: lang_js['err_invalid_username']
				},
				password: lang_js['err_valid_input'],
				re_password: lang_js['err_valid_input'],
				//phone: lang_js['err_valid_input'],
				address: lang_js['err_valid_input'],
				captcha: lang_js['err_valid_input']
			}
		});
	},
	
	signin:function (form_id, link_go) {
		$.validator.setDefaults({
			submitHandler: function() {
				var form_mess = $('#'+form_id).find('.form_mess');
				form_mess.stop(true,true).slideUp(200).html('');
				var fData = $('#'+form_id).serializeArray();
				
				loading('show');
				
				$.ajax({
					type: "POST",
					url: ROOT+"ajax.php",
					data: { "m" : "user", "f" : "signin", "data" : fData }
				}).done(function( string ) {
					
					loading('hide');
					
					var data = JSON.parse(string);
					if(data.ok == 1) {
						/*form_mess.html(ttHTemp.html_alert(data.mess,'success')).stop(true,true).slideDown(200);
						go_link(link_go);*/
						
						jAlert(data.mess, lang_js['aleft_title'], function(){go_link(link_go);}, 'success');
					} else {
						form_mess.html(ttHTemp.html_alert(data.mess,'error')).stop(true,true).slideDown(200);
					}
				});
				//e.preventDefault(); //STOP default action
				//e.unbind(); //unbind. to stop multiple form submit.
				return false;
			}
		});
		$("#"+form_id).validate({
			rules: {
				username: {
					required: true,
					email: true
				},
				password: {
					required: true
				}
			},
			messages: {
				username: lang_js['err_valid_input'],
				password: lang_js['err_valid_input']
			}
		});
		
	},
	
	same_address:function () {
		
		$('#same_address').click(function(){
			if($(this).prop('checked') == true) {
				$('.input_text', '.ordering_address_r').each(function() {
          var n = $(this).attr('name').replace('d_','o_');
					$(this).val($('input[name='+n+']', '.ordering_address_l').val());
        });
				$('select', '.ordering_address_r').each(function() {
          var n = $(this).attr('name').replace('d_','o_');
					var o = $('select[name='+n+']', '.ordering_address_l');
					
					$(this).html(o.html()).find("option[value='"+o.find('option:selected').val()+"']").prop('selected', true);
        });
			} else {
				$('.input_text', '.ordering_address_r').each(function() {
					$(this).val('');
        });
				$('select', '.ordering_address_r').each(function() {
					$(this).val('');
        });
			}
		});
		
		$('.input_text', '#form_ordering_address').change(function(e) {
      $('#same_address').prop('checked',false);
    });
		$('select', '#form_ordering_address').change(function(e) {
      $('#same_address').prop('checked',false);
    });
		
		return false;
	}
};