ttHGlobal = {

	contact:function (form_id) {

		$.validator.setDefaults({

			submitHandler: function() {

				var fData = $("#"+form_id).serializeArray();

				$.ajax({

					type: "POST",

					url: ROOT+"ajax.php",

					data: { "m" : "contact", "f" : "contact", "data" : fData }

				}).done(function( string ) {

					var data = JSON.parse(string);

					if(data.ok == 1) {

						$('#'+form_id)[0].reset();

						alert(data.mess);

					} else {

						alert(data.mess);

					}

				});

				//e.preventDefault(); //STOP default action

				//e.unbind(); //unbind. to stop multiple form submit.

				return false;

			}

		});

		$("#"+form_id).validate({

			rules: {

				full_name: {

					required: true

				},

				phone: {

					required: true

				},

				address: {

					required: true

				},

				email: {

					required: true,

					email: true

				},

				title: {

					required: true

				},

				content: "required"

			},

			messages: {

				full_name: lang_js['err_valid_input'],

				phone: lang_js['err_valid_input'],

				address: lang_js['err_valid_input'],

				email: lang_js['err_invalid_email'],

				title: lang_js['err_valid_input'],

				content: lang_js['err_valid_input']

			}

		});

	},



	emaillist:function (form_id) {

		//this.__emaillist_ajax(form_id);

		$.validator.setDefaults({

			submitHandler: function() {

				var fData = $("#"+form_id).serializeArray();

				$.ajax({

					type: "POST",

					url: ROOT+"ajax.php",

					data: { "m" : "contact", "f" : "emaillist", "data" : fData }

				}).done(function( string ) {

					var data = JSON.parse(string);

					if(data.ok == 1) {

						$('#'+form_id)[0].reset();

						alert(data.mess);

					} else {

						alert(data.mess);

					}

				});

				//e.preventDefault(); //STOP default action

				//e.unbind(); //unbind. to stop multiple form submit.

				return false;

			}

		});

		$("#"+form_id).validate({

			rules: {

				email: {

					required: true,

					email: true

				}

			},

			messages: {

				email: false

			}

		});

	},



	box_lang:function () {

		$('#box-lang .box-lang-list a.current').clone().prependTo('#box-lang .lang-current');

		$('#box-lang a.current').click(function(e) {

			return false;

		});

		$('#box-lang').mouseenter(function(e) {

			$(this).children('.box-lang-list').stop(true, false).slideDown(200);

		}).mouseleave(function(e) {

			$(this).children('.box-lang-list').stop(true, false).slideUp(0);

		});

	},



	btn_temp:function () {

		$('button.btn_temp').each(function(index, element) {

			if(!$(this).hasClass('added')) {

				$(this).addClass('added').html(ttHTemp.html_btn($(this).val()));

			}

    });

	},



	radio_temp:function () {

		$('label.radio_css').each(function(index, element) {

			var radio = $(this).children('input[type="radio"]');

			if(radio.prop('checked')) {

				$(this).addClass('checked');

			}

			if(radio.prop('disabled')) {

				$(this).addClass('disabled');

			}



			if(!$(this).hasClass('added')) {

				$(this).addClass('added').prepend(ttHTemp.html_radio());

			}

    });

		$('label.radio_css').click(function(e) {

			$('label.radio_css').each(function(index, element) {

				var radio = $(this).children('input[type="radio"]');

				if(radio.prop('checked')) {

					$(this).addClass('checked');

				} else {

					$(this).removeClass('checked');

				}

			});

    });

	},



	checkbox_temp:function () {

		$('label.checkbox_css').each(function(index, element) {

			var checkbox = $(this).children('input[type="checkbox"]');

			if(checkbox.prop('checked')) {

				$(this).addClass('checked');

			}

			if(radio.prop('disabled')) {

				$(this).addClass('disabled');

			}



			if(!$(this).hasClass('added')) {

				$(this).addClass('added').prepend(ttHTemp.html_checkbox());

			}

    });

		$('label.checkbox_css').click(function(e) {

			var checkbox = $(this).children('input[type="checkbox"]');

			if(checkbox.prop('checked')) {

				$(this).addClass('checked');

			} else {

				$(this).removeClass('checked');

			}

    });

	}

}



/*var aSep = ',';

var aDec = '.';*/

var aSep = '.';

var aDec = ',';

if(lang == 'vi') {

	aSep = '.';

	aDec = ',';

}



function go_link(link_go) {

	if(link_go == '') {

		location.reload();

	} else {

		window.location.href=link_go;

	}	

}



function header_account(){

	$('a','#header_account').mouseenter(function(){

		$('ul','#header_account').stop(true,true).slideDown(200);

	});

	$('#header_account').mouseleave(function() {

		$('ul','#header_account').stop(true,true).slideUp(200);

  });

}


function header_cart(){
	$.ajax({
		type: "POST",
		url: ROOT+"ajax.php",
		data: { "m" : "product", "f" : "cart_info" }
	}).done(function( string ) {
		var data = JSON.parse(string);
		$('#header_cart .num_cart').html(data.num_cart);
	});
	return false;
}

/**
 * load_more_news
 * @returns {boolean}
 */
function load_more_news(){
	var start = $("#start").val();
	console.log(start);
	console.log(ROOT);
	$.ajax({
		type: "POST",
		url: ROOT+"ajax.php",
		data: { "m" : "news", "f" : "load_more_news", 'start' : start}
	}).done(function( string ) {
		console.log(string);
		var data = JSON.parse(string);

		$('.list_news_home').append(data.content);
		$("#start").val(data.start);

		if(data.stop_more == 1){
			$("#load_more").addClass('not-active');
		}

	});

	return false;

}

/**
 * load_more_news_focus
 * @returns {boolean}
 */
function load_more_news_focus(){
	var start = $("#start").val();
	$.ajax({
		type: "POST",
		url: ROOT+"ajax.php",
		data: { "m" : "news", "f" : "load_more_news_focus", 'start' : start}
	}).done(function( string ) {
		console.log(string);
		var data = JSON.parse(string);

		$('.list_news_home_focus').append(data.content);
		$("#start").val(data.start);

		if(data.stop_more == 1){
			$("#load_more_focus").addClass('not-active');
		}

	});

	return false;

}



function 	auto_rate_exchange() {

	//var cur_rate = $('#rate_exchange option:selected');

	var rate = 1;

	var a_sign = ' đ';

	var p_sign = 's';

	var m_dec = 0;

	

	/*$.ajax({

		type: "POST",

		url: ROOT+"ajax.php",

		data: { "m" : "global", "f" : "update_rate_cur", 'id' : cur_rate.attr('value') }

	}).done(function(  ) {

		

	});*/

	

	$('.price_format .number').each(function(index, element) {

		$(this).text($(this).data('value') * rate).autoNumeric('init', {aSign:a_sign, pSign:p_sign, mDec:m_dec}).autoNumeric('update', {aSign:a_sign, pSign:p_sign, mDec:m_dec}); 

	});

	

	//$('.price_format .number').autoNumeric('init', {aSign:cur_rate.data('a_sign'),pSign:cur_rate.data('p_sign'), mDec:cur_rate.data('m_dec')}); 

}



function _update_number(o, type) {

	var v = o.autoNumeric('get');

	o.parent().find('.'+type+'_input').val(v).change();

}

function update_number(type) {

	$('.'+type).change(function(e) {

		_update_number($(this), type);

  }).keydown(function(e) {

		_update_number($(this), type);

  }).keypress(function(e) {

		_update_number($(this), type);

  });

}

function auto_price_format() {

	//$('.price').autoNumeric('init', {aSign:' USD', pSign:'s', mDec:2}); //use mDec:0 if VND

	$('.auto_price').autoNumeric('init', {aSign:' đ', pSign:'s', mDec:0, aSep: aSep, aDec: aDec}); 

	update_number('auto_price');

}

function auto_number_format() {

	$('.auto_number').autoNumeric('init', {mDec:0, aSep: aSep, aDec: aDec});

	update_number('auto_number');

	

	$('.auto_number_positive').autoNumeric('init', {mDec:0, vMin:1, aSep: aSep, aDec: aDec});

	update_number('auto_number_positive');

	

	$('.auto_float').autoNumeric('init', {mDec:10, aSep: aSep, aDec: aDec});

	update_number('auto_float');

	

	$('.auto_float_positive').autoNumeric('init', {mDec:2, vMin:1, aSep: aSep, aDec: aDec});

	update_number('auto_float_positive');

}

function auto_quantity_format() {

	$('.auto_quantity').autoNumeric('init', {mDec:0, vMin:1, vMax:100, aSep: aSep, aDec: aDec});

	update_number('auto_quantity');

	

	$('.auto_float').autoNumeric('init', {mDec:10, aSep: aSep, aDec: aDec});

	update_number('auto_float');

}

function auto_percent_format() {

	$('.auto_percent').autoNumeric('init', {aSign:' %', pSign:'s', mDec:2, vMin:0, vMax:100, aSep: aSep, aDec: aDec});

	update_number('auto_percent');

}

function auto_numeric() {

	$('.auto_numeric').autoNumeric('init');

	update_number('auto_numeric');

}



function loading(s) {

	if(s == 'show'){

		$('#tth-loading').stop(true,true).fadeIn();

	} else {

		$('#tth-loading').stop(true,true).fadeOut();

	}

}



function sh_scroll_banner(){

	var p = 20;

	var cw = $('#container').width();

	var w = $(window).width() - cw;

	var wl = $('#tth-scroll_left').width() + 20;

	var wr = $('#tth-scroll_right').width() + 12;

	var t = $('#header').height() + 10;

	if((w / 2) > (wl + p)) {

		/*$('#tth-scroll_left').css({'margin-right' : (cw/2) + p}).fadeIn();

		$('#tth-scroll_right').css({'margin-left' : (cw/2) + p}).fadeIn();*/

		//$('#tth-scroll_left').css({'top' : t}).fadeIn();

		$('#tth-scroll_right').css({'top' : t}).fadeIn();

	} else {		

		//$('#tth-scroll_left').fadeOut();

		$('#tth-scroll_right').fadeOut();

	}

}



function box_menu(){	

	

	$('.box_menu-content li a.current').siblings('ul').stop(true,true).slideDown(0);

    console.log('te');



	var runing = 0;

	$('.box_menu-content').mouseleave(function(event) {

		runing = 0;

	});

	$('.box_menu-content li a').mouseenter(function(event) {

		if($(this).siblings('ul').length) {

			$('.box_menu-content .mask').css('display','block');

			if(runing == 1) {

				return false;

			}

			runing = 1;

		} else {

			return false;

		}

		

		var a = $(this);

    $(this).siblings('ul').stop(true,true).slideDown(300).delay(1000,function(){

			$('.box_menu-content .mask').css('display','none');

			runing = 0;

		});

    $(this).parent().siblings('li').children('ul').stop(true,true).slideUp(200);

		return false;

  });

}



function main_menu(){	

	$('#main-menu-bg .btn-toggle').removeClass('x');

	var mw = $('#main-menu-bg').width();

	$('#main-menu-bg').css({

		left:-mw

	});

	if($(window).width() >= 640) {

		$('#main-menu-scrollbar.scrollbar.ps-container').css({

			'overflow' : 'visible'

		}).perfectScrollbar('destroy');

	} else {

		$('#main-menu-scrollbar.scrollbar.ps-container').perfectScrollbar('instroy');

	}

}



function perfectScrollbar(){	

	if(deviceType == 'computer') {

		$('.scrollbar').css({

			'overflow' : 'hidden'

		}).perfectScrollbar();

	}

}



var call_containerFix = 0;

function containerFix(){

	if(call_containerFix < 10) {

		call_containerFix++;

	}

	

	var w = 0;

	if($('#content').length && w < $('#content').height()) {

		w = $('#content').height();

	}

	if($('#column').length && w < $('#column').height()) {

		w = $('#column').height();

	}

	$('#container').css('min-height',w);

	setTimeout('containerFix()',call_containerFix * 1000);

}



function loadpage(){

	$('.fancybox').fancybox();

	$(".fancybox-effects-a").fancybox({

		helpers: {

			title : {

				type : 'outside'

			},

			overlay : {

				speedOut : 0

			}

		}

	});

	

	$(".ifancybox").fancybox({

		"type"	: "iframe"

	});

	$(".fancybox-support").fancybox({

		"width"	: 250,

		"height"	: 400,

		"type"	: "iframe"

	});

	

	$(".fancybox-iframe").fancybox({

		"type"	: "iframe"

	});

	

	//header_account();

	auto_number_format();

	auto_numeric();

	//auto_quantity_format();

	

	// perfectScrollbar

	perfectScrollbar();	

	

	containerFix();

	//main menu

	main_menu();

	$(window).resize(function(e) {

    main_menu();

    containerFix();

  });

	$('#main-menu-bg .btn-toggle').click(function(e) {

		var btn = $(this);

    if(btn.hasClass('x')) {

			$('#main-menu-bg').animate({

				left : -($('#main-menu-bg').width())

			},300,null,function(){

				btn.removeClass('x');

			});

		} else{

			$('#main-menu-bg').animate({

				left : 0	

			},300,null,function(){

				btn.addClass('x');

			});

		}

  });

	

	$('#main-menu-scrollbar').children('ul').attr('id','main-menu').addClass('sm sm-blue').smartmenus({

		subMenusSubOffsetX: 1,

		subMenusSubOffsetY: -8

	});

	

	$('.box_menu .box-content > ul').addClass('sm sm-vertical sm-menu_box sm-menu_box-vertical').smartmenus({

		subMenusSubOffsetX: 1,

		subMenusSubOffsetY: -8

	});

	

	ttHGlobal.btn_temp();

	ttHGlobal.radio_temp();

	ttHGlobal.checkbox_temp();

	auto_price_format();



	$('.box_mid-content table').each(function(index, element) {
		var div = $('<div class="table-responsive"></div>').insertBefore($(this));
		var table = $(this).detach();
		table.appendTo(div);

	});

}

$(document).ready(function(){
	var parent_comment = "";
	var parent = "";
	var content = "";
	$( ".show_reply_c" ).on( "click", function( event, person ) {
		var parent = $(this).closest(".item_comment");
		$(parent).find(".reply_c").toggleClass("show");
	});
});

function send_comment(type_rep,item_comment){
	if(type_rep =='reply_c'){
		parent_comment = $(item_comment).closest(".item_comment");
	}else{
		parent_comment = $(item_comment).closest(".reply");
	}
	content = $(parent_comment).find(".content_comment").val();

	if(content == ""){
		alert(lang_js['err_valid_input']);
		return false;
	}
	parent = $(parent_comment).find("input[name='parent']").val();

	$(".infor_customer").toggleClass("show");

}
function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}
function add_info(){
	var email = $(".infor_customer #email").val();
	var name = $(".infor_customer #full_name").val();
	if(email == ""){
		$(".infor_customer .err_email").text(lang_js['err_valid_input']);
	}else{
		$(".infor_customer .err_email").text("");
	}
	if (!validateEmail(email)) {
		$(".infor_customer .err_email").text("Email không đúng dịnh dạng");
	}
	if(name == ""){
		$(".infor_customer .err_name").text(lang_js['err_valid_input']);
	}else{
		$(".infor_customer .err_name").text("");
	}
	add_comment();
}
function add_comment(){
	$(".infor_customer").toggleClass("show");
	var table = $("input[name='tb']").val();
	var table_id = $("input[name='tb_id']").val();
	var email = $("input[name='email']").val();
	var full_name = $("input[name='full_name']").val();
	var fData = { "m" : "global", "f" : "comment",'parent': parent, 'table': table, 'table_id': table_id, 'email': email, 'full_name': full_name, 'content': content};
	$.ajax({
		type: "POST",
		url: ROOT+"ajax.php",
		data: fData
	}).done(function( response ) {

		var data = JSON.parse(response);

		if(data.status == 1) {
			$(".content_comment").val("");
			alert(data.mess);
		} else {
			alert(data.mess);
		}

	});

}
function close_info_customer(){
	$(".infor_customer").toggleClass("show");
}

/**
 * receive_info_contact
 * @param idForm
 */
function receive_info_contact(idForm) {
	$('#' + idForm).submit();
	/*var stringError = "";
	var isSubmit = true;
	var email = $("input[name='email']").val();
	var full_name = $("input[name='full_name']").val();
	var phone = $("input[name='phone']").val();
	var areas_concern = $("#areas_concern").val();
	if (full_name == "") {
		isSubmit = false;
		stringError += "Hãy nhập họ và tên." + "<br />";
	}
	if (email == "") {
		isSubmit = false;
		stringError += "Hãy nhập email." + "<br />";
	} else {
		if (!validateEmail(email)) {
			isSubmit = false;
			stringError += "Email không đúng dịnh dạng." + "<br />";
		}
	}
	if (phone == "") {
		isSubmit = false;
		stringError += "Hãy nhập số điện thoại." + "<br />";
	}
	if (areas_concern == "") {
		isSubmit = false;
		stringError += "Hãy chọn lĩnh vực quan tâm." + "<br />";
	}

	if (isSubmit) {
		$('#' + idForm).submit();
	} else {
		$(".err_notification").html(stringError);
	}*/
}

/**
 * receive_register_tour
 * @param idForm
 */
function receive_register_tour(idForm) {
	$('#' + idForm).submit();
}
