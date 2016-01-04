<!-- BEGIN: menu_add -->
{data.include_js}
<div id="popup-wrapper">
<form action="{data.link_action}" method="post" enctype="multipart/form-data" name="formAddToMenu" id="formAddToMenu" role="form">
	<div class="form_mess"></div>
  <div class="row">
  	<div class="col-md-6">
      <div class="form-group">
        <label>{LANG.layout.menu_group}</label>
        {data.list_group}
      </div>
    </div>
    <div class="col-md-6">
      <div class="form-group">
        <label>{LANG.global.parent}</label>
        {data.list_menu}
      </div>
    </div>
  </div>
  <div class="row" align="center">
    <input type="hidden" name="name_action"	 value="{data.name_action}" />
    <input type="hidden" name="do_submit"	 value="1" />
    <button type="submit" class="btn btn-default">{LANG.global.btn_submit}</button>
    <button type="reset" class="btn btn-default">{LANG.global.btn_reset}</button>
  </div>
</form>
</div>
<script language="javascript">
	ttHLayout.add_to_menu('formAddToMenu', '{data.link_action}');
</script>
<!-- END: menu_add --> 