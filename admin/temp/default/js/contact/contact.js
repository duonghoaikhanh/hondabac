function changce_map_type(){
	var is_type = $('#div_type input:checked').val();
	if(is_type == 'google_map') {
		$("#div_gmap").css({'height':400});
		$("#div_image").slideUp(0);
		$("#div_none").slideUp(0);
	} else if(is_type == 'image') {
		$("#div_gmap").css({'height':0});
		$("#div_image").slideDown(0);
		$("#div_none").slideUp(0);
	} else {
		$("#div_gmap").css({'height':0});
		$("#div_image").slideUp(0);
		$("#div_none").slideDown(0);
	}
}