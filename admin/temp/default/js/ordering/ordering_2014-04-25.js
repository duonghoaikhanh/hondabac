function html_row_pro(data)
{	
	return ttHTemp.join ('<tr id="row_'+data.type+'_'+data.type_id+'">')
              ('<td class="cot">'+data.title+'</td>')
              ('<td class="cot" align="center"><input type="text" value="'+data.price+'" name="price['+data.type_id+']" size="4" style="text-align:center;"></td>')
              ('<td class="cot" align="right">'+data.in_stock+'</td>')
              ('<td class="cot" align="right">'+data.out_stock+'</td>')
              ('<td class="cot" align="center"><input type="text" value="'+data.num_add+'" name="import['+data.type_id+']" size="4" style="text-align:center;"></td>')
              ('<td class="cot" align="center"><a href="#sub_'+data.type+'_'+data.type_id+'" class="fancybox">Click</a></td>')
            ('</tr>');
}

function add_pro_row(){
	$('#list_product').change(function(){
		var data = new Array();
		data['title'] = $(this).find('option:selected').text();
		data['price'] = 0;
		data['in_stock'] = 0;
		data['out_stock'] = 0;
		data['num_add'] = 0;
		data['type'] = 'product';
		data['type_id'] = $(this).val();
		if(!$('#row_'+data.type+'_'+data.type_id).length) {
			$('#tbody_product').append(html_row_pro(data));
		}
		if(!$('#sub_'+data.type+'_'+data.type_id).length) {
			$('#list_sub').append(html_row_sub_pro(data));
		}
	});
}