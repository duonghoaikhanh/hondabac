ttHTemp = {
	join:function(str) {
		var store = [str];
		return function extend(other) {
			if (other != null && 'string' == typeof other ) {
				store.push(other);
				return extend;
			}
			return store.join('');
		}
	},
	html_chart:function (data) {
		return ttHTemp.join
		('<div id="box_chart_1" class="box_chart">')
			('<div class="box_chart-title">')
				('<form name="myform" action="" method="post">')
					('<strong>'+lang_js["view_by"]+' :</strong> '+data.list_type+'')
				('<form>')
			('</div>')
			('<div class="box_chart-content">')
				('<div id="chart3" style="min-width:700px;height:300px;"></div>')
			('</div>')
		('</div>')
		('<table width="100%"  border="0" cellspacing="0" cellpadding="0">')
			('<tr>')
				('<td width="50%" >')
					('<div id="box_chart_2" class="box_chart">')
						('<div class="box_chart-title">'+lang_js["statistics_browser"]+'</div>')
						('<div class="box_chart-content">')
							('<div id="chart_browser" style="min-width:450px;width:100%;height:300px;"></div>')
						('</div>')
					('</div>')
				('</td>')
				('<td width="50%" >')
					('<div id="box_chart_3" class="box_chart">')
						('<div class="box_chart-title">'+lang_js["statistics_os"]+'</div>')
						('<div class="box_chart-content">')
							('<div id="chart_os" style="min-width:450px;width:100%;height:300px;"></div>')
						('</div>')
					('</div>')
				('</td>')
			('</tr>')
		('</table><script language="javascript" >'+data.content+'</script>');
	},
	html_form_search:function (data) {
		return ttHTemp.join
		('<table width="100%" border="0" cellspacing="1" cellpadding="1" class="box_menu_content">')
			('<tr>')
				('<td align="center">')
					('<table border="0" cellspacing="2" cellpadding="2" align="center">')
						('<tr>')
							('<td>'+lang_js["type_view"]+' : </td>')
							('<td>'+data.list_type_view+'</td>')
						('</tr>')
					('</table>')
					('<table border="0" cellspacing="2" cellpadding="2" align="center">')
						('<tr>')
							('<td>'+lang_js["title_view"]+' : </td>')
							('<td><input id="date_begin" type="text" maxlength="10" size="10" value="'+data.date_begin+'" name="date_begin" class="textfiled"></td>')
							('<td>'+lang_js["to"]+' </td>')
							('<td><input id="date_end" type="text" maxlength="10" size="10" value="'+data.date_end+'" name="date_end" class="textfiled"></td>')
							('<td><input type="submit" name="btnGo" value="'+lang_js["search"]+'" class="button" onclick="ttHView.submit_search();"></td>')
						('</tr>')
					('</table>')
					('<div class="note">'+lang_js["note_search"]+'</div>')
				('</td>')
			('</tr>')
		('</table>');
	},
	html_result_list_detail:function (data) {
		var title_row = data.title_row;
		return ttHTemp.join
		('<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center"  class="tableborder">')
			('<tr>')
				('<td height="30"  align="center"  style="border-bottom:2px solid #B84120 ;">'+data.text_total+'</td>')
			('</tr>')
			('<tr>')
				('<td>')
					('<table width="100%" border="0" cellspacing="1" cellpadding="1" class="table_row">')
						('<tr class="row row_title">')
							('<td class="cot" align="center" width="10%">'+title_row.f_date_time+'</td>')
							('<td class="cot" align="center" width="10%">'+title_row.f_time_stay+'</td>')
							('<td class="cot" align="center" width="10%">'+title_row.f_ip+'</td>')
							('<td class="cot" align="center" width="10%">'+title_row.f_os+'</td>')
							('<td class="cot" align="center" width="10%">'+title_row.f_browser+'</td>')
							('<td class="cot" align="center" width="10%">'+title_row.f_screen_size+'</td>')
							('<td class="cot" align="center" width="40%">'+title_row.f_web_link+'</td>')
						('</tr>'+data.html_row+'</table>')
				('</td>')
			('</tr>')
		('</table>')
		('<table width="100%"  border="0" align="center" cellspacing="1" class="bg_tab" cellpadding="1">')
			('<tr>')
				('<td height="25">'+data.nav+'</td>')
			('</tr>')
		('</table>');
	}	,
	html_result_list_count:function (data) {
		var title_row = data.title_row;
		return ttHTemp.join
		('<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center"  class="tableborder">')
			('<tr>')
				('<td height="30"  align="center"  style="border-bottom:2px solid #B84120 ;">'+data.text_total+'</td>')
			('</tr>')
			('<tr>')
				('<td>')
					('<table width="100%" border="0" cellspacing="1" cellpadding="1" class="table_row">')
						('<tr class="row row_title">')
							('<td class="cot" >'+data.type_view+'</td>')
							('<td class="cot" align="center" width="10%">'+title_row.f_access_number+'</td>')
							('<td class="cot" align="center" width="10%">'+title_row.f_percent+'</td>')
						('</tr>'+data.html_row+'</table>')
				('</td>')
			('</tr>')
		('</table>')
		('<table width="100%"  border="0" align="center" cellspacing="1" class="bg_tab" cellpadding="1">')
			('<tr>')
				('<td height="25">'+data.nav+'</td>')
			('</tr>')
		('</table>');
	}
};
