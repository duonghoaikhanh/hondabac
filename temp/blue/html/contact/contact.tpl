<!-- BEGIN: main -->
{data.content}
<!-- END: main --> 

<!-- BEGIN: contact_info -->
<div id="contact_info"><div class="content">{data.content}</div></div>
<!-- END: contact_info --> 

<!-- BEGIN: html_contact --> 
<div id="contact_info">{data.contact_info}</div>
<div id="contact_form">
	{data.err}
	<form id="form_contact" name="form_contact" method="post" action="{data.link_action}" >
    <div class="row form_note">(<span class="required">*</span>) {LANG.contact.required}</div>
    <div class="row">
      <label>{LANG.contact.full_name} (<span class="required">*</span>) :</label>
      <input name="full_name" type="text" maxlength="250" value="{data.full_name}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label>{LANG.contact.address} (<span class="required">*</span>) :</label>
      <input name="address" type="text" maxlength="250" value="{data.address}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label>{LANG.contact.email} (<span class="required">*</span>) :</label>
      <input name="email" type="text" maxlength="250" value="{data.email}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label>{LANG.contact.phone} (<span class="required">*</span>) :</label>
      <input name="phone" type="text" maxlength="250" value="{data.phone}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label>{LANG.contact.title} (<span class="required">*</span>) :</label>
      <input name="title" type="text" maxlength="250" value="{data.title}" class="input_text" />
      <div class="clear"></div>
    </div>
    <div class="row">
      <label>{LANG.contact.content} (<span class="required">*</span>) :</label>
      <textarea name="content" class="textarea" rows="10" >{data.content}</textarea>
      <div class="clear"></div>
    </div>
    <div class="row_btn" align="right">
      <input type="hidden" name="do_submit"	 value="1" />
      <input type="submit" class="btn" value="{LANG.contact.btn_send}"/>
    </div>
  </form>
  <script language="javascript">ttHGlobal.contact('form_contact');</script>
</div>
<div id="contact_map">
	<div class="contact_map_bg"><div id="map_view"></div></div>
  {data.contact_map}
</div>
<div class="clear"></div>  
<!-- END: html_contact -->