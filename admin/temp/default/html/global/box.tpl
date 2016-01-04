<!-- BEGIN: html_alert_info -->
<div class="alert alert-info alert-dismissable">
    <button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button>
    {data.mess}
</div>
<!-- END: html_alert_info -->

<!-- BEGIN: html_alert_error -->
<div class="alert alert-danger alert-dismissable">
    <button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button>
    {data.mess}
</div>
<!-- END: html_alert_error -->

<!-- BEGIN: html_alert_warning -->
<div class="alert alert-warning alert-dismissable">
    <button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button>
    {data.mess}
</div>
<!-- END: html_alert_warning -->

<!-- BEGIN: html_alert_success -->
<div class="alert alert-success alert-dismissable">
    <button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button>
    {data.mess}
</div>
<!-- END: html_alert_success -->

<!-- BEGIN: alert -->
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>{CONF.page_title}</title>
  </head>

  <body>
  {data.content}
  </body>
</html>
<!-- END: alert -->

<!-- BEGIN: html_title -->
<div class="col-md-12"><h2>{data.title}</h2></div>
<!-- END: html_title -->

<!-- BEGIN: html_form_pic -->
<div>{data.pic}</div>
<div class="input-append">
  <div class="form-group input-group">
    <a class="input-group-addon" type="button" href="javascript:void(0)" onClick="clear_input('{data.html_id}')">
      <img src="{DIR_IMAGE}icon_clear.png" height="18" />
    </a>
    <input class="form-control" name="{data.html_name}" id="{data.html_id}" type="text" value="{data.picture}">
    <a class="input-group-addon iframe-btn" type="button" href="{data.link_up}">Chọn hình</a>
  </div>
</div>
<!-- END: html_form_pic -->

<!-- BEGIN: html_form_file -->
<div class="input-append">
  <div class="form-group input-group">
    <a class="input-group-addon" type="button" href="javascript:void(0)" onClick="clear_input('{data.html_id}')">
      <img src="{DIR_IMAGE}icon_clear.png" height="18" />
    </a>
    <input class="form-control" name="{data.html_name}" id="{data.html_id}" type="text" value="{data.file}" readonly>
    <a class="input-group-addon iframe-btn" type="button" href="{data.link_up}">Chọn file</a>
  </div>
</div>
<!-- END: html_form_file -->

<!-- BEGIN: input_text -->
<input name="{data.key}" type="text" size="50" maxlength="150" value="{data.content}" class="form-control">
{data.ext}
<!-- END: input_text -->

<!-- BEGIN: input_hidden -->
<input name="{data.key}" type="hidden" size="50" maxlength="150" value="{data.content}" class="form-control" {data.attr}>
<!-- END: input_hidden -->

<!-- BEGIN: input_number -->
<input type="text" size="50" maxlength="10" value="{data.content}" class="form-control auto_number"><input name="{data.key}" type="hidden" maxlength="10" value="{data.content}" class="auto_number_input">
{data.ext}
<!-- END: input_number -->

<!-- BEGIN: input_float -->
<input type="text" size="50" maxlength="10" value="{data.content}" class="form-control auto_float"><input name="{data.key}" type="hidden" maxlength="10" value="{data.content}" class="auto_float_input">
{data.ext}
<!-- END: input_float -->

<!-- BEGIN: input_price -->
<input type="text" size="50" maxlength="10" value="{data.content}" class="form-control price"><input name="{data.key}" type="hidden" maxlength="10" value="{data.content}" class="price_input">
{data.ext}
<!-- END: input_price -->

<!-- BEGIN: input_color -->
<input name="{data.key}" type="text" size="50" maxlength="7" value="{data.content}" readonly class="form-control color_picker">
{data.ext}
<!-- END: input_color -->

<!-- BEGIN: textarea -->
<textarea class="form-control" rows="{data.rows}" name="{data.key}">{data.content}</textarea>
{data.ext}
<!-- END: textarea -->

<!-- BEGIN: video_youtube -->
<input name="{data.key}" type="text" size="50" maxlength="150" value="{data.content}" class="form-control">
<p>Chỉ cần nhập link video của youtube hệ thống sẽ tự động lấy hình (Nếu không nhập hình)</p>
<!-- END: video_youtube -->

<!-- BEGIN: input_option -->
	<h2>Tính năng</h2>
  <!-- BEGIN: row --> 
  <div class="col-md-6">
    <div class="form-group">
      <label>{row.title}</label>
      <textarea name="{row.input_name}" class="form-control" rows="1">{row.content}</textarea>
    </div>
  </div>
  <!-- END: row --> 
<!-- END: input_option --> 

<!-- BEGIN: map_google -->
<div>
  <div class="form-group">
    <input id="{data.pre}gmap_address" type="text" size="50" maxlength="150" value="" class="form-control">
  </div>
  <div id="{data.pre}div_gmap" style="overflow:hidden;"><div id="{data.pre}gmap" style="width:100%; height:400px;"></div></div>
  <script language="javascript">
    function markerSelected(id){
      var marker = $('#{data.pre}gmap').gmap3({get:id});
      
      //$("#markerId .value").text(id);
      $("#{data.pre}map_latitude").val(marker.getPosition().lat());
      $("#{data.pre}map_longitude").val(marker.getPosition().lng());
    }
    $(function() {
      $("#{data.pre}gmap").gmap3({
        map:{
          options:{
            center:["{data.map_latitude}","{data.map_longitude}"],
            zoom: 15
          }
        },
        marker:{
          values:[
            {latLng: ["{data.map_latitude}","{data.map_longitude}"], id:"cur_marker"}
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
            }
          }
        }
      });
          
      $("#{data.pre}gmap_address").autocomplete({
        source: function() {
            $("#{data.pre}gmap").gmap3({
                getaddress: {
                    address: $(this).val(),
                    callback: function(results){
                        if (!results) return;
                        $("#{data.pre}gmap_address").autocomplete("display", results, false);
                    }
                }
            });
        },
        cb:{
            cast: function(item){
                return item.formatted_address;
            },
            select: function(item) {
                $("#{data.pre}gmap").gmap3({
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
    });
  </script> 
</div>
<!-- END: map_google -->

<!-- BEGIN: manage_action -->
<!-- BEGIN: add_menu -->
<a href="{data.link_add_menu}" class="fancybox fancybox.ajax" ><img src="{DIR_IMAGE}icon_menu.png" atl="{LANG.global.add_to_menu}" title="{LANG.global.add_to_menu}"/></a>                
<!-- END: add_menu --> 
<!-- BEGIN: edit -->
<a href="{data.link_edit}" ><img src="{DIR_IMAGE}icon_edit.png" atl="{LANG.global.edit}" title="{LANG.global.edit}"/></a>
<!-- END: edit --> 
<!-- BEGIN: pic -->
<a href="{data.link_pic}" ><img src="{DIR_IMAGE}icon_pic.png" atl="{LANG.global.picture}" title="{LANG.global.picture}"/></a>
<!-- END: pic --> 
<!-- BEGIN: duplicate -->
<a href="javascript:action_item('{data.link_duplicate}','{LANG.global.are_you_sure_duplicate}')" ><img src="{DIR_IMAGE}icon_duplicate.png" atl="{LANG.global.duplicate}" title="{LANG.global.duplicate}"/></a>
<!-- END: duplicate --> 
<!-- BEGIN: trash -->
<a href="javascript:action_item('{data.link_trash}','{LANG.global.are_you_sure_trash}')" ><img src="{DIR_IMAGE}icon_trash.png" atl="{LANG.global.trash}" title="{LANG.global.trash}"/></a>
<!-- END: trash --> 
<!-- BEGIN: restore -->
<a href="javascript:action_item('{data.link_restore}','{LANG.global.are_you_sure_restore}')" ><img src="{DIR_IMAGE}icon_restore.png" atl="{LANG.global.restore}" title="{LANG.global.restore}"/></a>
<!-- END: restore --> 
<!-- BEGIN: del -->
<a href="javascript:action_item('{data.link_del}','{LANG.global.are_you_sure_del}')" ><img src="{DIR_IMAGE}icon_del.png" atl="{LANG.global.del}" title="{LANG.global.del}"/></a>
<!-- END: del --> 
<!-- END: manage_action --> 

<!-- BEGIN: popup -->
<div id="tth-popup">{data.content}</div>
<!-- END: popup -->

<!-- BEGIN: popup_iframe --><!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>{data.page_title}</title>
    {CONF.include_js}
    {CONF.include_css}
    {CONF.include_js_content}
  </head>
  <body>
    <div id="tth-popup">{data.content}</div>
  </body>
</html>
<!-- END: popup_iframe -->