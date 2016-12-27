function checked_input_color() {
	$('.list_input_color input[type=radio]').each(function() {
		var li = $(this).parent();
    if($( this ).is(':checked')) {
			if(!li.hasClass('checked')) {
				li.addClass('checked');
			}
		} else {
			li.removeClass('checked');
		}
  });
}
function checked_input_size() {
	$('.list_input_size input[type=radio]').each(function() {
		var li = $(this).parent();
    if($( this ).is(':checked')) {
			if(!li.hasClass('checked')) {
				li.addClass('checked');
			}
		} else {
			li.removeClass('checked');
		}
  });
}
function list_input_color() {
	checked_input_color();
	$('.list_input_color li').click(function(){
		checked_input_color();
	});
}
function list_input_size() {
	checked_input_size();
	$('.list_input_size li').click(function(){
		checked_input_size();
	});
}
function detail_quantity() {
	var price_buy = $('#info_row-price_buy .number').data('value');
	$('input[name=quantity]').change(function(){
		var total = price_buy * $(this).val();
		$('#detail-total .number').data('value',total).text(total);
		auto_rate_exchange();
	});
}

function list_combine() {
	$('.list_combine .list_combine-title').click(function(){
		$(this).find('.list_combine-arrow').toggleClass('show');
		$(this).parent().find('ul').slideToggle(200);
	})
	$('.list_combine li input[type=radio]').click(function(){
		$('.list_combine .list_combine-title span').text($(this).data('title'));
	})
	$('.list_combine').mouseleave(function(){
		$(this).find('.list_combine-arrow').removeClass('show');
		$(this).find('ul').slideUp(200);
	})
}

function add_cart(form_id) {
	$("#"+form_id).submit(function(){
		var output = true;
		
		if($("#"+form_id+" select[name^='size']")) {
			var size = $("#"+form_id+" select[name^='size']").val();
			if(size <= 0) {
				jAlert(lang_js['err_invalid_size'], lang_js['aleft_title'], null, 'error');
				output = false;
			}
		}
		
		if($("#"+form_id+" select[name^='quantity']")) {
			var quantity = $("#"+form_id+" select[name^='quantity']").val();
			if(quantity <= 0) {
				jAlert(lang_js['err_invalid_quantity'], lang_js['aleft_title'], null, 'error');
				output = false;
			}
		}
		
		return output;
	});
}