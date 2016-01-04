<!-- BEGIN: main -->
<div class="emaillist">
  <h2>{LANG.widget_maillist.f_emaillist}</h2>
  <form id="form_emaillist_{data.form_id}" name="form_emaillist" method="post"  onsubmit="return false" >
  	<div class="input-group">
    	<input name="email" type="text" maxlength="250" value="" class="emaillist_input css_bo" />
      <span class="input-group-addon"><input type="submit" class="btn_emaillist" value="{LANG.widget_maillist.btn_signup}"/></span>
    </div>
  </form>
  <div class="clear"></div>
</div>
<script language="javascript">ttHGlobal.emaillist("form_emaillist_{data.form_id}");</script>
<!-- END: main --> 