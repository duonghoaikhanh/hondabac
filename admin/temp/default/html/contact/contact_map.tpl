<!-- BEGIN: main -->
<div class="row">
  <div class="col-lg-12">
    <h1>{data.page_title}</h1>
    <ol class="breadcrumb">
      <li><a href="{data.link_manage}" {data.class.manage}><i class="fa fa-th-list"></i> {LANG.global.manage}</a></li>
      <li><a href="{data.link_manage_trash}" {data.class.manage_trash}><i class="fa fa-trash-o"></i> {LANG.global.trash}</a></li>
      <li><a href="{data.link_add}" {data.class.add}><i class="fa fa-edit"></i> {LANG.global.add}</a></li>
    </ol>
  </div>
</div>
{data.main} 
<!-- END: main --> 

<!-- BEGIN: edit -->
<form action="{data.link_action}" method="post" enctype="multipart/form-data" name="myForm" id="myForm" role="form">
  <div class="row">
    <div class="col-lg-12">{data.err}</div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.title}</label>
        <input name="title" id="title" type="text" size="50" maxlength="150" value="{data.title}" class="form-control">
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-12">
      <div class="form-group">
        <label>{LANG.global.short}</label>
        {data.html_short} </div>
    </div>
    <div class="col-lg-12">
      <div class="form-group">
        <label>{LANG.global.content}</label>
        {data.html_content} </div>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-12">
      <div class="form-group">
        <label>Bản đồ</label>
        <div id="div_type">
          <label class="radio-inline">
            <input type="radio" name="map_type" value="google_map" {data.map_type_google_map} onclick="changce_map_type();">
            Google Maps </label>
          <label class="radio-inline">
            <input type="radio" name="map_type" value="none" {data.map_type_none} onclick="changce_map_type();">
            None </label>
        </div>
        <div id="div_google_map">
          <div class="form-group">
            <input id="gmap_address" type="text" size="50" maxlength="150" value="" class="form-control">
          </div>
          <div id="div_gmap" style="overflow:hidden;"><div id="gmap" style="width:100%; height:400px;"></div></div>
          <div class="form-group">
          <label>{LANG.contact.map_information}</label>
          {data.html_map_information} </div>
          <input type="hidden" id="map_latitude" name="map_latitude" value="{data.map_latitude}" />
          <input type="hidden" id="map_longitude" name="map_longitude" value="{data.map_longitude}" />
          <script language="javascript">
						function markerSelected(id){
							var marker = $('#gmap').gmap3({get:id});
							
							//$("#markerId .value").text(id);
							$("#map_latitude").val(marker.getPosition().lat());
							$("#map_longitude").val(marker.getPosition().lng());
						}
						$(function() {
							$("#gmap").gmap3({
								map:{
									options:{
										center:[{data.map_latitude},{data.map_longitude}],
										zoom: 15
									}
								},
								marker:{
									values:[
										{latLng: [{data.map_latitude},{data.map_longitude}], id:"cur_marker"}
									],
									options:{
										icon: "{DIR_IMAGE}icon_markers.png",
										draggable: true
									},
									events: {
										load: function(marker, event, context){
											markerSelected(context.id);
										},
										mouseup: function(marker, event, context){
											markerSelected(context.id);
										}/*,
										mouseover: function(marker, event, context){
											$(this).gmap3(
												{clear:"overlay"},
												{
												overlay:{
													latLng: marker.getPosition(),
													options:{
														content:  '<textarea name="map_information" id="map_information" class="form-control" rows="3">{data.map_information}</textarea>'
													}
												}
											});
										}*/
									}
								}
							});
									
							$("#gmap_address").autocomplete({
                source: function() {
                    $("#gmap").gmap3({
                        getaddress: {
                            address: $(this).val(),
                            callback: function(results){
                                if (!results) return;
                                $("#gmap_address").autocomplete("display", results, false);
                            }
                        }
                    });
                },
                cb:{
                    cast: function(item){
                        return item.formatted_address;
                    },
                    select: function(item) {
                        $("#gmap").gmap3({
                            clear: "marker",
                            marker: {
                                //latLng: item.geometry.location,
																values:[
																	{latLng: item.geometry.location, id:"cur_marker"}
																],
																options: {
																		draggable: true
                                },
																events: {
																	load: function(marker, event, context){
																		markerSelected(context.id);
																	},
																	mouseup: function(marker, event, context){
																		markerSelected(context.id);
																	}
																}
                            },
                            map:{
                                options: {
                                    center: item.geometry.location
                                }
                            }
                        });
												markerSelected('cur_marker');
                    }
                }
            })
            .focus();
							
							/*$('#gmap').goMap({
								markers: [{ 
									latitude: "{data.map_latitude}",
									longitude: "{data.map_longitude}",
									id: 'cur_marker', 
									draggable: true,
									html: {
										content: '<textarea name="map_information" id="map_information" class="form-control" rows="3">{data.map_information}</textarea>',
										popup: true
									}
								}],
								icon: '{DIR_IMAGE}icon_markers.png',
								maptype: 'ROADMAP',
								zoom: 15
							});
						
							$.goMap.createListener({type:'marker', marker:'cur_marker'}, 'mouseup', function() { 
								//$("#dump").html($.dump($.goMap.getMarkers())); 
								var str_pos = String($.goMap.getMarkers());
								var arr_pos = str_pos.split(',');
								$("#map_latitude").val(arr_pos[0]);
								$("#map_longitude").val(arr_pos[1]);
							}); */
						});
					</script> 
        </div>
        <div id="div_image" style="display:none" >
          <div class="input-append">
            <div class="form-group input-group">
              <input class="form-control" name="map_picture" id="map_picture" type="text" value="{data.map_picture}" readonly="readonly">
              <a class="input-group-addon iframe-btn" type="button" href="{data.link_up}">Chọn hình</a> </div>
          </div>
        </div>
        <div id="div_none" >&nbsp;</div>
        <script language="javascript">changce_map_type();</script>
      </div>
    </div>
  </div>
  <div class="row" align="center">
    <input type="hidden" name="do_submit"	 value="1" />
    <button type="submit" class="btn btn-default">{LANG.global.btn_submit}</button>
    <button type="reset" class="btn btn-default">{LANG.global.btn_reset}</button>
  </div>
</form>
<!-- END: edit --> 

<!-- BEGIN: manage --> 
{data.err}
<form action="{data.link_action}" method="post" name="manage" id="manage">
  <div class="row">
    <div class="col-lg-12">
      <div class="table_btn table_btn_top"> <img class="icon_arrow" src="{DIR_IMAGE}arrow_down.png" />
        <button type="button" class="btn btn-default" onclick="do_submit('do_edit')" value="{LANG.global.btn_update}" name="btnEdit">{LANG.global.btn_update}</button>
        <!-- BEGIN: button_trash -->
        <button type="button" class="btn btn-default" onclick="do_submit_alert('do_trash', '{LANG.global.are_you_sure_trash}')" value="{LANG.global.btn_trash}" name="btnTrash">{LANG.global.btn_trash}</button>
        <!-- END: button_trash --> 
        <!-- BEGIN: button_manage -->
        <button type="button" class="btn btn-default" onclick="do_submit_alert('do_restore', '{LANG.global.are_you_sure_restore}')" value="{LANG.global.btn_restore}" name="btnRestore">{LANG.global.btn_restore}</button>
        <button type="button" class="btn btn-default" onclick="do_submit_alert('do_del', '{LANG.global.are_you_sure_del}')" value="{LANG.global.btn_del}" name="btnDel">{LANG.global.btn_del}</button>
        <!-- END: button_manage -->
        <div class="clear"></div>
      </div>
      <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped table_row">
          <thead>
            <tr >
              <th class="header" width="3%"><input id="checkall" class="checkbox" type="checkbox" name="checkall" value="all"/></th>
              <th class="header" width="5%">{data.f_map_id}</th>
              <th class="header" width="10%">{data.f_show_order}</th>
              <th class="header" >{data.f_title}</th>
              <th class="header" width="10%">{LANG.global.action}</th>
            </tr>
          </thead>
          <tbody>
            <!-- BEGIN: row_item -->
            <tr id="row_{row.map_id}">
              <td class="cot" align="center"><input class="checkbox" type="checkbox" value="{row.map_id}" name="selected_id[]"></td>
              <td class="cot" align="center">{row.map_id}</td>
              <td class="cot" align="center"><input type="text" value="{row.show_order}" name="show_order[{row.map_id}]" size="4" style="text-align:center;" onchange="do_check ({row.map_id})"></td>
              <td class="cot">{row.title}</td>
              <td class="cot" align="center"><a href="{row.link_edit}" ><img src="{DIR_IMAGE}icon_edit.png" atl="{LANG.global.edit}" title="{LANG.global.edit}"/></a> 
                <!-- BEGIN: row_button_trash --> 
                <a href="javascript:action_item('{row.link_trash}','{LANG.global.are_you_sure_trash}')" ><img src="{DIR_IMAGE}icon_trash.png" atl="{LANG.global.trash}" title="{LANG.global.trash}"/></a> 
                <!-- END: row_button_trash --> 
                <!-- BEGIN: row_button_manage --> 
                <a href="javascript:action_item('{row.link_restore}','{LANG.global.are_you_sure_restore}')" ><img src="{DIR_IMAGE}icon_restore.png" atl="{LANG.global.restore}" title="{LANG.global.restore}"/></a> <a href="javascript:action_item('{row.link_del}','{LANG.global.are_you_sure_del}')" ><img src="{DIR_IMAGE}icon_del.png" atl="{LANG.global.del}" title="{LANG.global.del}"/></a> 
                <!-- END: row_button_manage --></td>
            </tr>
            <!-- END: row_item --> 
            <!-- BEGIN: row_empty -->
            <tr class="warning">
              <td align="center" colspan="5">{row.mess}</td>
            </tr>
            <!-- END: row_empty -->
          </tbody>
        </table>
      </div>
      <div class="table_btn table_btn_buttom"> <img class="icon_arrow" src="{DIR_IMAGE}arrow_up.png" />
        <button type="button" class="btn btn-default" onclick="do_submit('do_edit')" value="{LANG.global.btn_update}" name="btnEdit">{LANG.global.btn_update}</button>
        <!-- BEGIN: button_trash --> 
        <!-- END: button_trash --> 
        <!-- BEGIN: button_manage --> 
        <!-- END: button_manage -->
        <div class="clear"></div>
      </div>
      <div class="table_nav">{data.nav}</div>
      <input id="do_action" type="hidden" value="" name="do_action">
    </div>
  </div>
</form>
<!-- END: manage --> 