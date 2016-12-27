function changce_type_banner(){
	var is_type = $('#div_type input:checked').val();
	if(is_type == 'image') {
		$("#div_pic").slideDown(0);
		$("#div_text").slideUp(0);
	} else {
		$("#div_pic").slideUp(0);
		$("#div_text").slideDown(0);
	}
}