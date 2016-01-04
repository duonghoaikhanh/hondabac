<!-- BEGIN: main -->

<div class="column">FSDFSDF</div>
<div class="content">
  {data.main_slide}
  {data.content}
  {data.content_focus}
</div>
<!-- END: main --> 

<!-- BEGIN: main_slide -->
<div class="wrapper">
  <div id="main_slide">
    <ul class="slider">
      <!-- BEGIN: row -->
      <li>
      	<a href="{row.link}">
        	<img src="{row.picture}" alt="{row.title}"/>
        	<div class="slider-info">
          	<h3>{row.title}</h3>
            <div class="short">{row.short}</div>
            <div class="view-deital">{LANG.home.btn_detail}</div>
          </div>
        </a>
      </li>
      <!-- END: row -->
    </ul>
  </div>
</div>
<script language="javascript">
	jQuery(document).ready(function($){
		$('#main_slide .slider').bxSlider({
			controls:	false,
			pager:false,
			auto:	true,
			mode:	'fade',
			//autoHover: true,
			pause: 4000,
			autoDelay: 2000,
			speed:	800
		});
	});
</script>
<!-- END: main_slide -->

<!-- BEGIN: list_item -->
<div class="list_item {data.class}">
  <!-- BEGIN: row_item -->
  <div class="row_item {row.class}">
    <!-- BEGIN: col_item -->
    <div class="col_item {col.class}">
      <div class="img css_bo">
      	{col.status_pic}
      	<a href="{col.link}" title="{col.title}">
          <div class="limit" style="max-width:{col.pic_w}px; height:{col.pic_h}px;">
            <img src="{col.picture}" alt="{col.title}" title="{col.title}" />
          </div>
        </a>
      </div>
      <div class="col_item-info">
      	<h3><a href="{col.link}" title="{col.title}">{LANG.global.series}: {col.item_code}</a></h3>
        <div class="price_buy"><span class="auto_price">{col.price_buy}</span></div>
      </div>
      <div class="clear"></div>
    </div>
    <!-- END: col_item --> 
    <div class="clear"></div>
  </div>
  {row.hr}
  <!-- END: row_item --> 
  <!-- BEGIN: row_empty -->
  <div class="row_empty">{row.mess}</div>
  <!-- END: row_empty --> 
</div>
{data.nav}
<!-- END: list_item --> 