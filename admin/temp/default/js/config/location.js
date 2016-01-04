ttHLocation = {	
	list_location_area_load_child:function () {
		/*$('select.select_location_area').each(function(e) {
      ttHLocation.load_country_op($(this));
    });*/
		$('select.select_location_area').change(function(e) {
      ttHLocation.load_country_op($(this));
			$('#'+$(this).data('province')).html('<option value="">'+lang_js['select_title']+'</option>').trigger('chosen:updated')
			$('#'+$(this).data('district')).html('<option value="">'+lang_js['select_title']+'</option>').trigger('chosen:updated')
      //ttHLocation.load_province_op($(this), 'area');
    });
	},
	
	list_location_country_load_child:function () {
		$('select.select_location_country').change(function(e) {
      ttHLocation.load_province_op($(this), 'country');
			$('#'+$(this).data('district')).html('<option value="">'+lang_js['select_title']+'</option>').trigger('chosen:updated')
    });
	},
	
	list_location_province_load_child:function () {
		$('select.select_location_province').change(function(e) {
      ttHLocation.load_district_op($(this), 'province');
    });
	},
	
	load_country_op:function (parent_html) {
		loading('show');
		
		var html_id = parent_html.data('country');
		
		$.ajax({
			type: "POST",
			url: ROOT+"ajax.php",
			data: { "m" : "config", "f" : "load_country_op", "area_code" : parent_html.val()}
		}).done(function( string ) {
			loading('hide');
			var data = JSON.parse(string);
			if(data.ok == 1) {
				$('#'+html_id).html(data.html).trigger('chosen:updated');
				ttHLocation.load_province_op($('#'+html_id), 'country');
				$('#'+$(this).data('district')).html('<option value="">'+lang_js['select_title']+'</option>').trigger('chosen:updated')
			}
		});
	},
	
	load_province_op:function (parent_html, type) {
		var html_id = parent_html.data('province');
		
		if(!html_id) {
			return false;
		}
		loading('show');
		
		var area_code = (type == 'area') ? parent_html.val() : '';
		var country_code = (type == 'country') ? parent_html.val() : '';
		
		$.ajax({
			type: "POST",
			url: ROOT+"ajax.php",
			data: { "m" : "config", "f" : "load_province_op", "area_code" : area_code, "country_code" : country_code}
		}).done(function( string ) {
			loading('hide');
			var data = JSON.parse(string);
			if(data.ok == 1) {
				$('#'+html_id).html(data.html).trigger('chosen:updated');
				ttHLocation.load_district_op($('#'+html_id), 'province');
			}
		});
	},
	
	load_district_op:function (parent_html, type) {
		var html_id = parent_html.data('district');
		
		if(!html_id) {
			return false;
		}
		loading('show');
		
		var area_code = (type == 'area') ? parent_html.val() : '';
		var country_code = (type == 'country') ? parent_html.val() : '';
		var province_code = (type == 'province') ? parent_html.val() : '';
		
		$.ajax({
			type: "POST",
			url: ROOT+"ajax.php",
			data: { "m" : "config", "f" : "load_district_op", "area_code" : area_code, "country_code" : country_code, "province_code" : province_code}
		}).done(function( string ) {
			loading('hide');
			var data = JSON.parse(string);
			if(data.ok == 1) {
				$('#'+html_id).html(data.html).trigger('chosen:updated');
			}
		});
	}
};