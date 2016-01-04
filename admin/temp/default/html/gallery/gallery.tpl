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

<!-- BEGIN: muti_upload -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
  
  <title>Plupload - jQuery UI Widget</title>
  
  <link rel="stylesheet" href="{DIR_JS}plupload/css/jquery-ui.css" type="text/css" />
  <link rel="stylesheet" href="{DIR_JS}plupload/js/jquery.ui.plupload/css/jquery.ui.plupload.css" type="text/css" />
  
  <script src="{DIR_JS}plupload/js/jquery.min.js"></script>
  <script type="text/javascript" src="{DIR_JS}plupload/js/jquery-ui.min.js"></script>
  
  <!-- production -->
  <script type="text/javascript" src="{DIR_JS}plupload/js/plupload.full.min.js"></script>
  <script type="text/javascript" src="{DIR_JS}plupload/js/jquery.ui.plupload/jquery.ui.plupload.js"></script>
  
  <!-- debug 
  <script type="text/javascript" src="{DIR_JS}plupload/js/moxie.js"></script>
  <script type="text/javascript" src="{DIR_JS}plupload/js/plupload.dev.js"></script>
  <script type="text/javascript" src="{DIR_JS}plupload/js/jquery.ui.plupload/jquery.ui.plupload.js"></script>
  -->

</head>
<body style="font: 13px Verdana; background: #eee; color: #333">
  <form action="{data.link_action}" method="post" name="myForm" id="myForm">
    <div id="uploader">
      <p>Your browser doesn't have Flash, Silverlight or HTML5 support.</p>
    </div>
    <input type="hidden" name="group_id"	 value="{data.group_id}" />
    <input type="hidden" name="do_submit"	 value="1" />
  </form>
  <script type="text/javascript">
  // Initialize the widget when the DOM is ready
  $(function() {
    $("#uploader").plupload({
      // General settings
      runtimes : 'html5,flash,silverlight,html4',
      url : '{data.url_upload}',
  
      // User can upload no more then 20 files in one go (sets multiple_queues to false)
      max_file_count: 20,
      
      chunk_size: '1mb',
  
      // Resize images on clientside if we can
      /*resize : {
        width : 200, 
        height : 200, 
        quality : 90,
        crop: true // crop to exact dimensions
      },*/
      
      filters : {
        // Maximum file size
        max_file_size : '1000mb',
        // Specify what files to browse for
        mime_types: [
          {title : "Image files", extensions : "jpg,gif,png"},
          {title : "Zip files", extensions : "zip"}
        ]
      },
  
      // Rename files by clicking on their titles
      rename: true,
      
      // Sort files
      sortable: true,
  
      // Enable ability to drag'n'drop files onto the widget (currently only HTML5 supports that)
      dragdrop: true,
  
      // Views to activate
      views: {
        list: true,
        thumbs: true, // Show thumbs
        active: 'thumbs'
      },
  
      // Flash settings
      flash_swf_url : '{DIR_JS}plupload/js/Moxie.swf',
  
      // Silverlight settings
      silverlight_xap_url : '{DIR_JS}plupload/js/Moxie.xap',
 
			// Post init events, bound after the internal events
			init : {
					FileUploaded: function(up) {
						if(up.total.queued === 0) {
							$('#myForm').submit();
						}
					}
        }
    });
  
  
    // Handle the case when form was submitted before uploading has finished
    $('#myForm').submit(function(e) {
      // Files in queue upload them first
      if ($('#uploader').plupload('getFiles').length > 0) {
  
        // When all files are uploaded submit myForm
        $('#uploader').on('complete', function() {
          $('#myForm')[0].submit();
        });
  
        $('#uploader').plupload('start');
      } else {
        alert("You must have at least one file in the queue.");
      }
      return false; // Keep the form from submitting
    });
  });
  </script>
</body>
</html>
<!-- END: muti_upload --> 

<!-- BEGIN: add -->
<div class="row">
  <div class="col-lg-12">{data.err}</div
>
</div>
<div class="row">
  <div class="col-lg-6">
    <div class="form-group">
      <label>{LANG.global.parent}</label>
      {data.list_group}
    </div>
  </div>
</div>
<div class="row">
  <div class="col-lg-12">
    <div class="form-group">
      <iframe frameborder="0" height="320" width="100%" src="{data.link_iframe_upload}"></iframe> 
    </div>
  </div>
</div>
<!-- END: add --> 

<!-- BEGIN: edit -->
<form action="{data.link_action}" method="post" enctype="multipart/form-data" name="myForm" id="myForm" role="form">
  <div class="row">
    <div class="col-lg-12">{data.err}</div>
    <div class="col-lg-9">
      <div class="form-group">
        <label>{LANG.global.title}</label>
        <input name="title" id="title" type="text" size="50" maxlength="150" value="{data.title}" class="form-control">
      </div>
    </div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.picture}</label>
        {data.picture}
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-12">
      <div class="form-group">
        <label>{LANG.global.content}</label>
        {data.html_content} </div>
    </div>
  </div>
  <!-- BEGIN: input_option --> 
  <div class="row">
    <div class="col-lg-12">
      <div class="form-group">
        <label>{row.title}</label>
        <textarea name="arr_option[{row.option_id}]" class="form-control" rows="1">{row.content}</textarea>
      </div>
    </div>
  </div>
  <!-- END: input_option --> 
  <h2>{LANG.global.orientation_search_engine}</h2>
  <div class="row">
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.friendly_link}</label>
        <input name="friendly_link" id="friendly_link" type="text" size="50" maxlength="150" value="{data.friendly_link}" class="form-control">
        <p class="help-block">{LANG.global.friendly_link_note}</p>
      </div>
    </div>
    <div class="col-lg-6">
      <div class="form-group">
        <label>{LANG.global.meta_title}</label>
        <input name="meta_title" id="meta_title" type="text" size="50" maxlength="150" value="{data.meta_title}" class="form-control">
        <p class="help-block">{LANG.global.meta_title_note}</p>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-12">
      <div class="form-group">
        <label>{LANG.global.meta_key}</label>
        <textarea name="meta_key" id="meta_key" class="form-control" rows="3">{data.meta_key}</textarea>
        <p class="help-block">{LANG.global.meta_key_note}</p>
      </div>
      <div class="form-group">
        <label>{LANG.global.meta_desc}</label>
        <textarea name="meta_desc" id="meta_desc" class="form-control" rows="3">{data.meta_desc}</textarea>
        <p class="help-block">{LANG.global.meta_desc_note}</p>
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
<div class="panel panel-default panel_toggle {data.form_search_class}">
  <div class="panel-heading">
    <h3 class="panel-title">{LANG.global.box_search}</h3>
    <a class="toggle">&nbsp;</a>
  </div>
  <div class="panel-body">
    <div class="box_search">
      <form action="{data.link_action}" method="post" name="form_search" id="form_search">
        <div class="row_search">
          <div class="col_search"><label>{LANG.global.group}:</label> {data.list_group_search}</div>
          <div class="col_search"><label>{LANG.global.date_begin}:</label> <input name="search_date_begin" type="text" size="20" maxlength="150" value="{data.search_date_begin}" class="form-control datepicker"></div>
          <div class="col_search"><label>{LANG.global.date_end}:</label> <input name="search_date_end" type="text" size="20" maxlength="150" value="{data.search_date_end}" class="form-control datepicker"></div>
          <div class="col_search"><label>{LANG.global.text_search}:</label> 
            <div class="form-group input-group">
              <input name="search_title" type="text" size="20" maxlength="150" value="{data.search_title}" class="form-control">
              <span class="input-group-btn">
                <button class="btn btn-default" type="submit">
                  <i class="fa fa-search"></i>
                </button>
              </span>
            </div>
          </div>
          <div class="clear"></div>
        </div>
        <div class="row_search">
        	<button class="btn btn-default btn-sm btn-block" type="submit">{LANG.global.btn_search}</button>
        </div>
      </form>
      <div class="clear"></div>
    </div>
  </div>
</div>
{data.err}
<form action="{data.link_action}" method="post" name="manage" id="manage">
  <div class="row">
    <div class="col-lg-12">
      <div class="table_btn table_btn_top">
        <img class="icon_arrow" src="{DIR_IMAGE}arrow_down.png" />
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
              <th class="header" width="5%">{data.f_item_id}</th>
              <th class="header" width="10%">{data.f_show_order}</th>
              <th class="header" width="10%">{data.f_picture}</th>
              <th class="header" >{data.f_title}</th>
              <th class="header" width="15%">{LANG.global.info}</th>
              <th class="header" width="10%">{LANG.global.action}</th>
            </tr>
          </thead>
          <tbody>
          	<!-- BEGIN: row_item -->
            <tr id="row_{row.item_id}">
              <td class="cot" align="center"><input class="checkbox" type="checkbox" value="{row.item_id}" name="selected_id[]"></td>
              <td class="cot" align="center">{row.item_id}</td>
              <td class="cot" align="center"><input type="text" value="{row.show_order}" name="show_order[{row.item_id}]" size="4" style="text-align:center;" onchange="do_check ({row.item_id})"></td>
              <td class="cot" align="center">{row.picture}</td>
              <td class="cot">
                {row.title}
                <div><strong>Link:</strong> {row.link}</div>
              </td>
              <td class="cot">{row.info}</td>
              <td class="cot" align="center">
                <a href="{row.link_edit}" ><img src="{DIR_IMAGE}icon_edit.png" atl="{LANG.global.edit}" title="{LANG.global.edit}"/></a>
                <!-- BEGIN: row_button_trash -->
                <a href="javascript:action_item('{row.link_trash}','{LANG.global.are_you_sure_trash}')" ><img src="{DIR_IMAGE}icon_trash.png" atl="{LANG.global.trash}" title="{LANG.global.trash}"/></a>
                <!-- END: row_button_trash --> 
                <!-- BEGIN: row_button_manage -->
                <a href="javascript:action_item('{row.link_restore}','{LANG.global.are_you_sure_restore}')" ><img src="{DIR_IMAGE}icon_restore.png" atl="{LANG.global.restore}" title="{LANG.global.restore}"/></a>
                <a href="javascript:action_item('{row.link_del}','{LANG.global.are_you_sure_del}')" ><img src="{DIR_IMAGE}icon_del.png" atl="{LANG.global.del}" title="{LANG.global.del}"/></a>
                <!-- END: row_button_manage -->
              </td>
            </tr>
            <!-- END: row_item --> 
          	<!-- BEGIN: row_empty -->
            <tr class="warning">
              <td align="center" colspan="9">{row.mess}</td>
            </tr>
            <!-- END: row_empty --> 
          </tbody>
        </table>
      </div>
      <div class="table_btn table_btn_buttom">
        <img class="icon_arrow" src="{DIR_IMAGE}arrow_up.png" />
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