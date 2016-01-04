ttHUser = {
	
	show_signup:function (show, hide) {
		$('#'+show).slideDown(200);
		$('#'+hide).slideUp(200);
	},
	
	signup:function (form_id, link_go) {
		$.validator.setDefaults({
			submitHandler: function() {
				var form_mess = $('#'+form_id).find('.form_mess');
				form_mess.stop(true,true).slideUp(200).html('');
				var fData = $("#"+form_id).serializeArray();
				
				$('#tth_loading').stop(true,true).fadeIn(200);
				
				$.ajax({
					type: "POST",
					url: ROOT+"ajax.php",
					data: { "m" : "user", "f" : "signup", "data" : fData }
				}).done(function( string ) {
					
					$('#tth_loading').stop(true,true).fadeOut(200);
					
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
				first_name: {
					required: true
				},
				last_name: {
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
				first_name: lang_js['err_valid_input'],
				last_name: lang_js['err_valid_input'],
				username: lang_js['err_valid_input'],
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
				
				$('#tth_loading').stop(true,true).fadeIn(200);
				
				$.ajax({
					type: "POST",
					url: ROOT+"ajax.php",
					data: { "m" : "user", "f" : "signin", "data" : fData }
				}).done(function( string ) {
					
					$('#tth_loading').stop(true,true).fadeOut(200);
					
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
	
	signout:function (link_go) {
		
		$('#tth_loading').stop(true,true).fadeIn(200);
		
		$.ajax({
			type: "POST",
			url: ROOT+"ajax.php",
			data: { "m" : "user", "f" : "signout" }
		}).done(function( string ) {
			
			$('#tth_loading').stop(true,true).fadeOut(200);
			
			var data = JSON.parse(string);
			if(data.ok == 1) {
				go_link(link_go);
			}
		});
		return false;
	},
	
	same_address:function () {
		$('#same_address').click(function(){
			if($(this).prop('checked') == true) {
				$('.input_text', '.address_book_r').each(function() {
          var n = $(this).attr('id').replace('d_','o_');
					$(this).val($('input[id='+n+']', '.address_book_l').val());
        });
				$('select', '.address_book_r').each(function() {
          var n = $(this).attr('id').replace('d_','o_');
					var o = $('select[id='+n+']', '.address_book_l');
					
					$(this).html(o.html()).find("option[value='"+o.find('option:selected').val()+"']").prop('selected', true);
        });
			} else {
				$('.input_text', '.address_book_r').each(function() {
					$(this).val('');
        });
				$('select', '.address_book_r').each(function() {
					$(this).val('');
        });
			}
		});
		
		$('.input_text', '#form_address_book').change(function(e) {
      $('#same_address').prop('checked',false);
    });
		$('select', '#form_address_book').change(function(e) {
      $('#same_address').prop('checked',false);
    });
		return false;
	}
};