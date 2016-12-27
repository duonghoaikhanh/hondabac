function changce_type_import(){
	var is_type = $('#div_type input:checked').val();
	if(is_type == 'new') {
		$("#div_import_new").slideDown(0);
		$("#div_import_has").slideUp(0);
	} else {
		$("#div_import_new").slideUp(0);
		$("#div_import_has").slideDown(0);
	}
}