ttHLayout = {
	list_menu_parent_load_child:function (form_id) {
		var o = $('#'+form_id+' select#menu_group_id');
		//ttHLayout.load_menu_parent_op(o);
		o.change(function(e) {
      ttHLayout.load_menu_parent_op($(this));
    });
	},
	
	load_menu_parent_op:function (parent_html) {
		loading('show');
		
		var html_id = parent_html.data('menu_list');
		
		$.ajax({
			type: "POST",
			url: ROOT+"ajax.php",
			data: { "m" : "layout", "f" : "load_menu_parent_op", "menu_group" : parent_html.val()}
		}).done(function( string ) {
			loading('hide');
			var data = JSON.parse(string);
			if(data.ok == 1) {
				$('#'+html_id).html(data.html).trigger('chosen:updated');
			}
		});
	},
	
	add_to_menu:function (form_id, link_go) {
		ttHLayout.list_menu_parent_load_child(form_id);
		
		$.validator.setDefaults({
			submitHandler: function() {
				var form_mess = $('#'+form_id).find('.form_mess');
				form_mess.stop(true,true).slideUp(200).html('');
				var fData = $("#"+form_id).serializeArray();
				form_disabled(form_id, true);
				
				loading('show');
				
				$.ajax({
					type: "POST",
					url: ROOT+"ajax.php",
					data: { "m" : "layout", "f" : "add_to_menu", "data" : fData }
				}).done(function( string ) {
					
					loading('hide');
					
					var data = JSON.parse(string);
					if(data.ok == 1) {
						form_mess.html(data.mess).stop(true,true).slideDown(200);						
						setTimeout("$.fancybox.close();", 2000);
						/*$.fancybox({
							href: link_go,
							type: 'ajax'
						});*/
					} else {
						form_mess.html(data.mess).stop(true,true).slideDown(200);
						form_disabled(form_id, false);
					}
				});
				//e.preventDefault(); //STOP default action
				//e.unbind(); //unbind. to stop multiple form submit.
				return false;
			}
		});
		$("#"+form_id).validate({
			rules: {
				group_id: {
					required: true
				}
			},
			messages: {
				group_id: lang_js['err_valid_input']
			}
		});
	}
};