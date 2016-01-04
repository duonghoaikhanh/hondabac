<!-- BEGIN: main -->
{data.content}
<!-- END: main --> 

<!-- BEGIN: list_item -->
<div class="list_item">
  <!-- BEGIN: row_item -->
  <div class="row_item {row.class}">
    <!-- BEGIN: col_item -->
    <div class="col_item {col.class}">
      <div class="img css_bo">
      	{col.status_pic}
      	<a href="{col.link}" title="{col.title}">
          <div class="limit" style="max-width:{col.pic_w}px; height:{col.pic_h}px;">
            <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0"><tr><td width="100%" height="100%"><img src="{col.picture}" alt="{col.title}" title="{col.title}" /></td></tr></table>
          </div>
        </a>
      </div>
      <div class="col_item-title">
        <h3><a href="{col.link}" title="{col.title}">{col.title}</a></h3>
      </div>
      <div class="col_item-short">{col.short}</div>
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

<!-- BEGIN: img_detail -->
<div id="img_detail" {row.class_detail}>
  <div class="connected-carousels">
    <div class="stage">
      <div class="carousel carousel-stage">
        <ul class="list_none">
        	<!-- BEGIN: pic -->
          <li>
          	<a href="{row.src_zoom}" class="fancybox-effects-a" rel="img_detail"><div class="limit" style="width:{row.pic_w}px; height:{row.pic_h}px;">
            	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0"><tr><td width="100%" height="100%" align="center"><img src="{row.src}" alt="{row.title}"></td></tr></table>
            </div></a>
          </li>
          <!-- END: pic --> 
        </ul>
      </div>
      <a href="#" class="prev prev-stage"><span>&nbsp;</span></a>
      <a href="#" class="next next-stage"><span>&nbsp;</span></a>
    </div>
  
    <div class="navigation">
      <a href="#" class="prev prev-navigation">&nbsp;</a>
      <a href="#" class="next next-navigation">&nbsp;</a>
      <div class="carousel carousel-navigation">
        <ul class="list_none">
        	<!-- BEGIN: pic_thumb -->
          <li>
          	<div class="img"><div class="limit" style="width:{row.thum_w}px; height:{row.thum_h}px;">
            	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0"><tr><td width="100%" height="100%" align="center"><img src="{row.src_thumb}" width="{row.thum_w}" height="{row.thum_h}" alt="{row.title}"></td></tr></table>
            </div></div>
          </li>
          <!-- END: pic_thumb --> 
        </ul>
      </div>
    </div>
  </div>
</div>
<!-- END: img_detail --> 

<!-- BEGIN: detail -->
<div id="item_detail">
  {data.img_detail}
  <iframe src="//www.facebook.com/plugins/like.php?href={data.link_share}&amp;width=160&amp;layout=button_count&amp;action=like&amp;show_faces=true&amp;share=false&amp;height=21" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:160px; height:21px;" allowTransparency="true"></iframe>
  <div id="item_info">
  	<h1>{data.title}</h1>
    <form action="{data.link_cart}" method="post">
  	<!-- BEGIN: info_row_price -->
  	<div class="info_row">
      <div class="info_row_content price">{price}</div>
      <div class="clear"></div>
    </div>
    <!-- END: info_row_price --> 
  	<div class="info_row">
      <div class="info_row_content price_buy">{data.price_buy}</div>
      <div class="clear"></div>
    </div>
  	<!-- BEGIN: info_row -->
  	<div class="info_row">
      <div class="info_row_title">{row.title}</div>
      <div class="info_row_mid">:</div>
      <div class="info_row_content">{row.content}</div>
      <div class="clear"></div>
    </div>
    <!-- END: info_row --> 
  	<!-- BEGIN: btn_add_cart -->
  	<div class="info_row info_row_btn">
    	<input name="item_id" type="hidden" value="{data.item_id}" />
    	<input name="quantity" type="hidden" value="{data.quantity}" />
    	<input class="btn_add_cart" type="image" src="{DIR_IMAGE}btn_add_cart.png" value="{LANG.product.btn_add_cart}">
      <div class="clear"></div>
    </div>
    <!-- END: btn_add_cart --> 
    </form>
    
    <div id="tab-detail">
      <ul id="tab-detail-nav" class="list_none">
        <li><a href="#tab-content">{LANG.product.content}</a></li>
        <li><a href="#tab-size_guide">{LANG.product.size_guide}</a></li>
      </ul>
      <div class="clear"></div>
      <div class="tab tab-content css_bo" id="tab-content">{data.content}</div>
      <div class="tab tab-content css_bo" id="tab-size_guide">{data.size_guide}</div>
    </div>
    
    <script type="text/javascript">
    var tabber1 = new Yetii({
			id: 'tab-detail'
    });
    </script>
  </div>
  <div class="clear"></div>
  <div class="other-title">{LANG.product.other_product}</div>
  {data.other}
</div>
<!-- END: detail --> 

<!-- BEGIN: list_other -->
<div class="list_other">
  <div class="list_other-title"><span>{LANG.product.other_product}</span></div>
  <div class="jcarousel-wrapper css_bo">
    <div class="jcarousel">
      <ul class="slider list_none">
        <!-- BEGIN: row -->
        <li>
          <a href="{row.link}" title="{row.title}">
          	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
            	<tr><td><img src="{row.picture}" alt="{row.title}" title="{row.title}"  /></td></tr>
            </table>
          </a>
        </li>
        <!-- END: row --> 
      </ul>
      <a href="#" class="jcarousel-control-prev">&nbsp;</a>
      <a href="#" class="jcarousel-control-next">&nbsp;</a>
    </div>
  </div>
</div>
<!-- END: list_other --> 