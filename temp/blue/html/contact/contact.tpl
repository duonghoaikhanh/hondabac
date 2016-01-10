<!-- BEGIN: main -->
<div class="content-wrap">

    <div class="container clearfix">
        {data.content}
    </div>

</div>
<!-- END: main -->
<!-- BEGIN: main1 -->
{data.content}
<!-- END: main1-->

<!-- BEGIN: contact_info1 -->
<div id="contact_info"><div class="content">{data.content}</div></div>
<!-- END: contact_info1 -->

<!-- BEGIN: html_contact -->
<section class="container" style="margin-bottom: 40px">
    <div class="google-map">
        <div id="contact_map" class="map" style="position: relative; overflow: hidden; transform: translateZ(0px); background-color: rgb(229, 227, 223);">
        </div>
        {data.contact_map}
    </div>
</section>

<style>
    .google-map {width:100%;}
    .google-map .map {width:100%; height:350px; background:#dedede}
</style>
<!-- Google Map End -->

<!-- Postcontent
============================================= -->
<div class="postcontent nobottommargin" id="contact_form">

    <h3>Viết nhận xét</h3>
    {data.err}
    <form id="form_contact" name="form_contact" method="post" action="{data.link_action}" >
        <div class="col_one_third">
            <label for="template-contactform-name">{LANG.contact.full_name} <small class="require_symbol">*</small></label>
            <input type="text" id="template-contactform-name" name="full_name" value="{data.full_name}" placeholder="Họ tên của bạn" class="sm-form-control required">
        </div>
        <div class="col_one_third">
            <label for="template-contactform-email">{LANG.contact.email} <small class="require_symbol">*</small></label>
            <input type="text" id="template-contactform-email" name="email" value="{data.email}" placeholder="Email" class="sm-form-control required">
        </div>
        <div class="col_one_third">
            <label for="template-contactform-phone">{LANG.contact.phone} <small class="require_symbol">*</small></label>
            <input type="text" id="template-contactform-phone" name="phone" value="{data.phone}" placeholder="Phone" class="sm-form-control required">
        </div>
        <div class="col_one_third">
            <label for="template-contactform-address">{LANG.contact.address} <small class="require_symbol">*</small></label>
            <input type="text" id="template-contactform-address" name="address" value="{data.address}" placeholder="Address" class="sm-form-control required">
        </div>
        <div class="clear"></div>

        <div class="col_full">
            <label for="template-contactform-message">{LANG.contact.content} <small class="require_symbol">*</small></label>
            <textarea class="required sm-form-control" id="template-contactform-message" name="content" rows="6" cols="30">{data.content}</textarea>
        </div>
        <div class="col_full">
            <button class="button button-3d nomargin" type="submit" id="template-contactform-submit" name="template-contactform-submit" value="submit">{LANG.contact.btn_send}</button>
        </div>
        <input type="hidden" name="save" value="1">
    </form>
    <!-- </form>-->

    <script language="javascript">ttHGlobal.contact('form_contact');</script>
</div><!-- .postcontent end -->

<!-- Sidebar
============================================= -->
<div class="sidebar col_last nobottommargin">
    <h3>Chúng tôi ở đây</h3>
    <address>
        <strong>THE COMPANY HEAD OFFICE</strong><br>
        61/2 Quang Trung, P.10  Q. Gò Vấp, TP. HCM
    </address>
    <abbr title="Phone Number"><strong>Số điện thoại:</strong></abbr> (91) 8547 632521<br>
    <abbr title="Fax"><strong>Fax:</strong></abbr> (91) 8547 632521<br>
    <abbr title="Email Address"><strong>Email:</strong></abbr> hi@Bizweb.com

</div><!-- .sidebar end -->

<!-- END: html_contact -->