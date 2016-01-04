<!-- BEGIN: main -->
{data.content}
{data.content_focus}
<!-- END: main --> 

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
      {col.title}
      <div class="col_item-info">
      	<h3><a href="{col.link}" title="{col.title}">{LANG.global.series}: {col.item_code}</a></h3>
        <div class="price_buy"><span class="auto_price">{col.price_buy}</span> </div>
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
      <a href="#" class="prev-navigation"><span>&nbsp;</span></a>
      <a href="#" class="next-navigation"><span>&nbsp;</span></a>
    </div>
  </div>
</div>
<!-- END: img_detail --> 

<!-- BEGIN: detail -->
{data.navigation}
<div id="item_detail">
  {data.img_detail}
  <div id="item_info">
  	<div class="info_row">
      <span class="info_col-num_view">
      	<span class="col-title">{LANG.product.num_view}</span>
      	<span class="col-mid">:</span>
      	<span class="col-content">{data.num_view}</span>
      </span>      
      <span class="info_col-mid">|</span>
      <span class="info_col-date_update">
      	<span class="col-title">{LANG.product.date_update}</span>
      	<span class="col-mid">:</span>
      	<span class="col-content">{data.date_update}</span>
      </span>
    </div>
    <h1>{data.title}</h1>
  	<div class="info_row">
    	<span class="info_col-series">
      	<span class="col-title">{LANG.product.series}</span>
      	<span class="col-mid">:</span>
      	<span class="col-content">{data.item_code}</span>
      </span>
    	<span class="info_col-like"><iframe src="//www.facebook.com/plugins/like.php?href={data.link_action}%2F&amp;width=120&amp;layout=button_count&amp;action=like&amp;show_faces=true&amp;share=false&amp;height=21&amp;appId=1448360858753522" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:21px; width:120px;" allowTransparency="true"></iframe></span>
      <div class="clear"></div>
    </div>
  	<div class="info_row">
      <div class="info_row-short">{data.short}</div>
      <div class="clear"></div>
    </div>
  	<!-- BEGIN: info_row_price -->
  	<div class="info_row">
      <div class="info_row_title">{LANG.product.price}</div>
      <div class="info_row_mid">:</div>
      <div class="info_row_content price">{price}</div>
      <div class="clear"></div>
    </div>
    <!-- END: info_row_price --> 
  	<div id="info_row-price_buy" class="info_row price_buy">
      <span>{LANG.product.price_buy}: </span>
      <span>{data.price_buy}</span>
      <div class="clear"></div>
    </div>
    <form id="form_add_cart" action="{data.link_cart}" method="post" class="form_add_cart">
  	<!-- BEGIN: info_row -->
  	<div class="info_row {row.info_row_class}">
      <div class="info_row_title">{row.title}: </div>
      <div class="info_row_content">{row.content}</div>
      <div class="clear"></div>
    </div>
    <!-- END: info_row --> 
  	<div class="info_row">
      <div class="info_row_title">{LANG.product.quantity}: </div>
      <div class="info_row_content"><input type="text" value="1" class="auto_quantity quantity" maxlength="3" /><input name="quantity" type="hidden" value="1" class="auto_quantity_input" /></div>
      <div class="clear"></div>
    </div>
  	<div class="info_row">
      <div class="info_row_title">{LANG.product.total}: </div>
      <div class="info_row_content price_buy" id="detail-total"><span>{data.price_buy}</span></div>
      <div class="clear"></div>
    </div>
  	<div id="info_row-shipping" class="info_row">
      <div class="info_row_title">{LANG.product.shipping}: </div>
      <div class="info_row_content"><span>{LANG.product.shipping_content}</span></div>
      <div class="clear"></div>
    </div>
  	<!-- BEGIN: btn_add_cart -->
  	<div class="info_row info_row_btn">
      <input name="item_id" type="hidden" value="{data.item_id}" />
      <input class="btn_add_cart_show css_bo" type="submit" value="{LANG.product.btn_add_cart_show}">
      <input class="btn_add_cart css_bo" type="submit" value="{LANG.product.btn_add_cart}">
      <div class="clear"></div>
    </div>
    <!-- END: btn_add_cart --> 
    </form>
    <script language="javascript">
			detail_quantity();
			var is_popup = 0;
			$('.btn_add_cart_show').click(function() {
				is_popup = 1;
			});
			$('.btn_add_cart').click(function() {
				is_popup = 0;
			});
			
			$('form.form_add_cart').submit(function(){
				loading('show');
				var fData = $(this).serializeArray();
				
				var form = $(this);
				$.ajax({
					type: "POST",
					url: $(this).attr('action'),
					data: { "data" : fData }
				}).done(function( data ) {
					loading('hide');
					if(is_popup == 1) {
						$.fancybox({
							"width"	: 880,
							"height"	: 570,
							'type'   : 'iframe',
							"autoScale"   : false,
							'padding': 10,
							'href': form.attr('action')						
							//'data': fData
						});
					} else {
						jAlert('Thêm vào giỏ hàng thành công!', lang_js['aleft_title'], null, 'success');
					}
				});
				
				return false;
			});
    </script>
  	<span class="info_row-share">
    	<span class="info_row-share-title">{LANG.global.share_page}</span>
    	<!-- Go to www.addthis.com/dashboard to customize your tools -->
      <div class="addthis_sharing_toolbox"></div>      
    	<!-- Go to www.addthis.com/dashboard to customize your tools -->
			<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5461905c1fc78f9b" async="async"></script>
      <div class="clear"></div>
    </span>
  </div>
  <div class="clear"></div>
  
  <!-- BEGIN: tab -->
  <div id="tab-detail">
    <ul id="tab-detail-nav" class="list_none">
    	<!-- BEGIN: title -->
      <li style="z-index:{tab.index};"><a href="#tab-{tab.key}">{tab.title}</a></li>
      <!-- END: title --> 
    </ul>
    <div class="clear"></div>
    <!-- BEGIN: content -->
    <div class="tab tab-content detail-content css_bo" id="tab-{tab.key}"><div>{tab.content}</div></div>
    <!-- END: content --> 
  </div>
  
  <script type="text/javascript">
  var tabber1 = new Yetii({
    id: 'tab-detail'
  });
  </script>
  <!-- END: tab -->
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