function action_item(action, mess) {
	if (confirm(mess)) {
		window.location.href=action;
	}
	else {
	} 
}

function go_link(link_go) {
	window.location.href=link_go;
}

function do_check (id){
	
	$(".table_row td.cot:nth-child(1) input[type=checkbox]").each( function() {
		var row = $(this).parent().parent();
		var row_id = row.val();
		if (id == $(this).val() ){
			row.addClass('active')	;
			$(this).prop('checked', true);
		}																																	 
	});
}

function do_check_row (){
	$( '.table_row td.cot:nth-child(1) input[type=checkbox]' ).click( function(e) {
		var c = $(this).prop('checked');
		//var row_id = 'row_'+$(this).val();
		var row = $(this).parent().parent();
		if (c){
			row.addClass('active')	;
		}else{
			row.removeClass('active')	;	
		}
		
	});
}

/*function do_checkall_old (){
	$('#checkall').click( function(e) {
		var c = $(this).is(':checked');
		
		$(this).parents('form:first').find( '.table_row :checkbox' ).attr( 'checked', function() {
			var row_id = 'row_'+$(this).val();
			if (c){
				$('#'+row_id).addClass('active')	;
				return true;
			}else{
				$('#'+row_id).removeClass('active')	;	
				return false;	
			}
		});
	});
}*/

function do_checkall (){
	$('#checkall').click( function(e) {
		var c = $(this).prop('checked');
		var tbody = $(this).parent().parent().parent().parent().find('tbody');
		tbody.find('tr').each(function(){
			var checkbox = $(this).find('td.cot:eq(0) input[type=checkbox]');
			if (c){
				checkbox.prop('checked', true);
				$(this).addClass('active')	;
				//return true;
			}else{
				checkbox.prop('checked', false);
				$(this).removeClass('active')	;	
				//return false;	
			}
		});
	});
}

function check_username (username) {
	var mydata =  "do=check_username&username='"+username+"'"; 
	$.ajax({
		async: true,
		dataType: 'json',
		url:  ROOT+"ajax/check.php" ,
		type: 'POST',
		data: mydata ,
		success: function (data) {
			return data.mess	   
		}
	}) 
}

// selected_item
function selected_item(){
	var ok = 0 ;
	$("form#manage .table_row input:checkbox").each( function() {
		var c = $(this).prop('checked');
		if (c){
			ok = 1;
		}																																	 
	});
	if(ok) {
		return true;	
	}else{
		alert(lang_js['please_chose_item']);
		return false ;
	}
}

function do_submit(action) {
	document.manage.do_action.value=action;
	if (selected_item()){
		document.manage.submit();
	}
}

function do_submit_alert(action, mess) {
	if (confirm(mess)) {
		document.manage.do_action.value=action;
		if (selected_item()){
			document.manage.submit();
		}
	}
	else {
	} 
}

function clear_input(input_id) {
	$('#'+input_id).val("");
}

function panel_toggle() {
	$('.panel .panel-heading .toggle').click(function(){
		var panel = $(this).parent().parent();
		if(panel.hasClass('expand')) {
			panel.find('.panel-body').stop(true, true).slideUp(200, function(){
				panel.removeClass('expand');
			});
		} else {
			panel.find('.panel-body').stop(true, true).slideDown(200, function(){
				panel.addClass('expand');
			});
		}
	});
}

function loading(s) {
	if(s == 'show'){
		$('#tth-loading').stop(true,true).fadeIn();
	} else {
		$('#tth-loading').stop(true,true).fadeOut();
	}
}

function form_disabled(form_id, s) {
	$('#'+form_id).find('input, textarea, button, select').prop("disabled", s);
}

function sort_token_input (html) {
	$(html).sortable({
		placeholder: 'placeholder',
		connectWith: html
	});
}

function widget_option (html) {
	$(html).each(function(index, element) {
    var input = $(this).children('input[type="hidden"]');
		var str = '[widget_'+input.data('value');
		$(this).find('table .option select').each(function(index, element) {
      str += ' '+$(this).data('name')+'="'+$(this).val()+'"';
    });
		$(this).find('table .option input').each(function(index, element) {
      str += ' '+$(this).data('name')+'="'+$(this).val()+'"';
    });
		str += ']';
		//alert(str);
		input.val(str);
  });
	$(document).on('change',html+' select, '+html+' input', function(){
		var input = $(this).parents(html).children('input[type="hidden"]');
		var str = '[widget_'+input.data('value');
		str += ' '+$(this).data('name')+'="'+$(this).val()+'"';
		if($(this).parent('.input-group').length) {
			$(this).parent().siblings().each(function(index, element) {
				if($(this).hasClass('input-group')) {
					str += ' '+$(this).children('input').data('name')+'="'+$(this).children('input').val()+'"';
				} else {
					str += ' '+$(this).data('name')+'="'+$(this).val()+'"';
				}				
			});
		} else {
			$(this).siblings().each(function(index, element) {
				if($(this).hasClass('input-group')) {
					str += ' '+$(this).children('input').data('name')+'="'+$(this).children('input').val()+'"';
				} else {
					str += ' '+$(this).data('name')+'="'+$(this).val()+'"';
				}		
			});
		}
		
		str += ']';
		//alert(str);
		input.val(str);
	});
}


function _update_number(o, type) {
	var v = o.autoNumeric('get');
	o.parent().find('.'+type+'_input').val(v);
}
function update_number(type) {
	$('.'+type).change(function(e) {
		_update_number($(this), type);
  });
	$('.'+type).keydown(function(e) {
		_update_number($(this), type);
  });
}
function auto_price_format() {
	//$('.price').autoNumeric('init', {aSign:' USD', pSign:'s', mDec:2}); //use mDec:0 if VND
	$('.price').autoNumeric('init', {aSign:' VNĐ', pSign:'s', mDec:0}); 
	update_number('price');
}
function auto_number_format() {
	$('.auto_number').autoNumeric('init', {mDec:0});
	update_number('auto_number');
	
	$('.auto_float').autoNumeric('init', {mDec:10});
	update_number('auto_float');
}
function auto_percent_format() {
	$('.percent').autoNumeric('init', {aSign:' %', pSign:'s', mDec:2, vMin:0, vMax:100});
	update_number('percent');
}
function auto_numeric() {
	$('.auto_numeric').autoNumeric('init');
	update_number('auto_numeric');
}

jQuery(document).ready( function($) {
	do_check_row ();
	do_checkall ();
	panel_toggle();
	auto_price_format();
	auto_number_format();
	auto_percent_format();
	
	//$('.price_format .number').autoNumeric('init', {aSign:'S$ ', mDec:2}); 
	
	$('#manage .table_btn_top, #manage .table_nav, #myForm .row:last-child').addClass('fixedsticky').fixedsticky();
});