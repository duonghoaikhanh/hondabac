ttHUser = {
	/*signup_old:function (form_id, link_go) {
		alert('asdasd');
		$('#'+form_id).submit(function(e)
		{
			var form_mess = $('#'+form_id).find('.form_mess');
			form_mess.html('');
			alert('bbb');
			var fData = $(this).serializeArray();
			$.ajax({
				type: "POST",
				url: ROOT+"ajax.php",
				data: { "m" : "user", "f" : "signup", "data" : fData }
			}).done(function( ok ) {
				if(ok == 1) {
					form_mess.html(ttHTemp.html_alert(lang_js['signup_success'],'success'));
					if(link_go) {
						go_link(link_go);
					}
				} else {
					form_mess.html(ttHTemp.html_alert(lang_js['signup_false'],'error'));
				}
			});
			e.preventDefault(); //STOP default action
			//e.unbind(); //unbind. to stop multiple form submit.
			return false;
		});
	}*/
	
	show_signup:function (show, hide) {
		$('#'+show).slideDown(200);
		$('#'+hide).slideUp(200);
	},
	
	signup:function (form_id, link_go) {
		$('#'+form_id).submit(function(){return false;});
		$('#'+form_id).submit(function(e)
		{
			var form_mess = $('#'+form_id).find('.form_mess');
			form_mess.stop(true,true).slideUp(200).html('');
			var fData = $(this).serializeArray();
			$.ajax({
				type: "POST",
				url: ROOT+"ajax.php",
				data: { "m" : "user", "f" : "signup", "data" : fData }
			}).done(function( string ) {
				var data = JSON.parse(string);
				if(data.ok == 1) {
					form_mess.html(ttHTemp.html_alert(data.mess,'success')).stop(true,true).slideDown(200);
					go_link(link_go);
				} else {
					form_mess.html(ttHTemp.html_alert(data.mess,'error')).stop(true,true).slideDown(200);
				}
			});
			e.preventDefault(); //STOP default action
			//e.unbind(); //unbind. to stop multiple form submit.
			return false;
		});
	},
	
	signin:function (form_id, link_go) {
		$('#'+form_id).submit(function(){return false;});
		$('#'+form_id).submit(function(e)
		{
			var form_mess = $('#'+form_id).find('.form_mess');
			form_mess.stop(true,true).slideUp(200).html('');
			var fData = $(this).serializeArray();
			$.ajax({
				type: "POST",
				url: ROOT+"ajax.php",
				data: { "m" : "user", "f" : "signin", "data" : fData }
			}).done(function( string ) {
				var data = JSON.parse(string);
				if(data.ok == 1) {
					form_mess.html(ttHTemp.html_alert(data.mess,'success')).stop(true,true).slideDown(200);
					go_link(link_go);
				} else {
					form_mess.html(ttHTemp.html_alert(data.mess,'error')).stop(true,true).slideDown(200);
				}
			});
			e.preventDefault(); //STOP default action
			//e.unbind(); //unbind. to stop multiple form submit.
			return false;
		});
	},
	
	signout:function (link_go) {
		$.ajax({
			type: "POST",
			url: ROOT+"ajax.php",
			data: { "m" : "user", "f" : "signout" }
		}).done(function( string ) {
			var data = JSON.parse(string);
			if(data.ok == 1) {
				go_link(link_go);
			}
		});
		return false;
	}
};