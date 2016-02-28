<!-- BEGIN: main -->
<section id="page-title">
  <div class="container clearfix">
    <h1 class="col-md-6 col-sm-6">Tất cả sản phẩm</h1><br class="hidden-xs">
    <ol class="breadcrumb col-md-6 col-sm-6 hidden-xs">
      <li><a href="index.htm" tppabs="http://the-company.bizwebvietnam.net/">Trang chủ</a></li>
      <li class="active">Tất cả sản phẩm</li>
    </ol>
  </div>
</section>
<section id="content">

  <div class="content-wrap">

    <div class="container clearfix">

      <div class="postcontent nobottommargin col_last">
        {data.content}
      </div>
      <!-- .postcontent end -->
      <!-- Sidebar
============================================= -->
      <div class="sidebar nobottommargin  left-sidebar hidden-sm hidden-xs">
        <div class="sidebar-widgets-wrap">
            {data.box_column}


        </div>
      </div>
      <!-- .sidebar end -->

    </div>

  </div>
    <script>
        $(document).ready(function(){
            var is_popup = 0;
            $('.btn_add_cart_show').click(function() {
                is_popup = 1;
                $('form.form_add_cart').submit();
            });
            $('.btn_add_cart').click(function() {
                is_popup = 0;
                $(this).closest('form.form_add_cart').submit();
            });

            $('form.form_add_cart').submit(function(){
                loading('show');
                var fData = $(this).serializeArray();
                console.log($(this).attr('action'));
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
                    header_cart();
                });

                return false;
            });
        });
    </script>
</section>

<!-- END: main -->

<!-- BEGIN: main1 -->
{data.content}
{data.content_focus}
<!-- END: main1 -->

<!-- BEGIN: list_item -->
<div id="shop" class="product-3 clearfix">
    <div class='row sort-wrapper hide'>
        <div class="browse-tags col-md-8 col-sm-12 col-xs-12 pull-right"
             style='margin-bottom: 30px;'>
            <div class='col-md-9 col-sm-9 col-xs-4 text-right col-xs-push-1 col-sm-push-0 col-md-push-1'>
                <span>Sắp xếp theo:</span>
            </div>
            <div class='col-md-3 col-sm-3 col-xs-7 col-xs-push-1 col-sm-push-0 col-md-push-1'>
                <span class="custom-dropdown custom-dropdown--white pull-right">
                    <select id='sortControl'
                            class="sort-by custom-dropdown__select custom-dropdown__select--white form-control input-sm">
                        <option value="">Thứ tự</option>
                        <option value="?sortby=manual">Mặc định</option>
                        <option value="?sortby=best-selling">Bán chạy nhất</option>
                        <option value="?sortby=alpha-asc">A &rarr; Z</option>
                        <option value="?sortby=alpha-desc">Z &rarr; A</option>
                        <option value="?sortby=price-asc">Giá tăng dần</option>
                        <option value="?sortby=price-desc">Giá giảm dần</option>
                        <option value="?sortby=created-desc">Hàng mới nhất</option>
                        <option value="?sortby=created-asc">Hàng cũ nhất</option>
                    </select>
                </span>
            </div>
        </div>
        <script>
            $('.sort-by').change(function () {
                window.location.href = $(this).val();
            })
        </script>
    </div>
    <div id='grid_pagination'>
      <!-- BEGIN: row_item -->
      <div class='product_wrapper'>

        <!-- BEGIN: col_item -->
        <div class="product clearfix">
          <form id="form_add_cart" action="{col.link_cart}" method="post" class="form_add_cart">
            <div class="product-image">
              <a href="{col.link}" style="max-width: {col.pic_w}px;max-height: {col.pic_h}px">
                <img src="{col.picture}" alt="{col.title}" style="max-width: {col.pic_w}px;max-height: {col.pic_h}px">
              </a>
              <a href="{col.link}" style="max-width: {col.pic_w}px;max-height: {col.pic_h}px">
                <img src="{col.picture}" alt="{col.title}" style="max-width: {col.pic_w}px;max-height: {col.pic_h}px">
              </a>
              <input name="item_id" type="hidden" value="{col.item_id}" />
              <div class="product-overlay">
                <a href="javascript:void(0)" class="add-to-cart product_quick_add btn_add_cart" data-toggle='tooltip' title='{LANG.product.add_cart}'>
                  <i class="icon-shopping-cart"></i><span class='hidden-md hidden-lg'> {LANG.product.add_cart}</span></a>


                <a href="#product-pop-up" class="item-quick-view fancybox-fast-view hidden-sm hidden-xs hide"
                   product_url="/ban-cafe-4" data-toggle='tooltip' title='{LANG.product.view_fast}'>
                  <i class="icon-zoom-in2"></i><span class='hidden-md hidden-lg'> {LANG.product.view_fast}</span>
                </a>
              </div>
            </div>
            <div class="product-desc center">
              <div class="product-title"><h3><a href="{col.link}">{col.title}</a></h3></div>
              <div class="product-price">
                <ins> <span class="auto_price" >{col.price_buy}</span> </ins>
              </div>
            </div>
          </form>

        </div>

        <!-- END: col_item -->

      </div>
      <!-- END: row_item -->
        {data.nav}
    </div>
    <script>auto_price_format();</script>
</div>
<!-- END: list_item -->

<!-- BEGIN: list_item1 -->
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
<!-- END: list_item1 -->

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


<!-- BEGIN: detail1 -->
<div class='product-page'>
    <div class="single-product">
        <form action="{data.link_cart}" method="post" enctype="multipart/form-data" id="ProductDetailsForm" class="form_add_cart">
            <div class="product">
                <div class="col_half">

                    <div class="product-image product-main-image">
                        <div class="fslider" data-animation="fade" data-thumbs="true"
                             data-arrows="false">
                            <div class="flexslider">
                                <div class="slider-wrap" data-lightbox="gallery">


                                    <div class="slide"
                                         data-thumb="//bizweb.dktcdn.net/thumb/small/100/035/474/products/foto-4834-m-2de1d6be-a0c4-4d80-8fda-f93994250144-ed278e06-21d4-41a6-b49f-c7498b274c3e.jpg?v=1448641199247">
                                        <a href="" title="" data-lightbox="gallery-item">
                                            <img src="{DIR_IMAGE}template/foto-4834-m-2de1d6be-a0c4-4d80-8fda-f93994250144-ed278e06-21d4-41a6-b49f-c7498b274c3e-1.jpg-v=1448641199247" alt="">
                                        </a>
                                    </div>

                                    <div class="slide"
                                         data-thumb="//bizweb.dktcdn.net/thumb/small/100/035/474/products/foto-4838-m-6479345d-14fb-4f14-a8da-74a937a00146-fc415156-4453-43d2-8e27-032eb6b626ae.jpg?v=1448641199153">
                                        <a href="javascript:"
                                           title="" data-lightbox="gallery-item">
                                            <img src="{DIR_IMAGE}template/foto-4838-m-6479345d-14fb-4f14-a8da-74a937a00146-fc415156-4453-43d2-8e27-032eb6b626ae-1.jpg-v=1448641199153"
                                                 alt="">
                                        </a>
                                    </div>

                                    <div class="slide"
                                         data-thumb="//bizweb.dktcdn.net/thumb/small/100/035/474/products/foto-4832-m-05ac8073-b4e8-4f64-9f1e-f3eb6ecbbf3a-ee99b399-b898-4853-a070-15c39de620f0.jpg?v=1448641199183">
                                        <a href=""
                                           title="" data-lightbox="gallery-item">
                                            <img src="{DIR_IMAGE}template/foto-4832-m-05ac8073-b4e8-4f64-9f1e-f3eb6ecbbf3a-ee99b399-b898-4853-a070-15c39de620f0.jpg-v=1448641199183"
                                                 alt="">
                                        </a>
                                    </div>

                                    <div class="slide"
                                         data-thumb="//bizweb.dktcdn.net/thumb/small/100/035/474/products/foto-4830-m-1423c708-e87b-4a39-8925-3e9966c12b30-9f938144-60d5-4a59-931b-78b87398e660.jpg?v=1448641199217">
                                        <a href=""
                                           title="" data-lightbox="gallery-item">
                                            <img src="{DIR_IMAGE}template/foto-4830-m-1423c708-e87b-4a39-8925-3e9966c12b30-9f938144-60d5-4a59-931b-78b87398e660.jpg-v=1448641199217" alt="">
                                        </a>
                                    </div>

                                    <div class="slide"
                                         data-thumb="//bizweb.dktcdn.net/thumb/small/100/035/474/products/foto-4836-m-1639b185-ccd9-408c-9069-b3127267c7c5-56573e32-28d9-45ea-b0e5-160e3a82fd48.jpg?v=1448641199277">
                                        <a href=""
                                           title="" data-lightbox="gallery-item">
                                            <img src="{DIR_IMAGE}template/foto-4836-m-1639b185-ccd9-408c-9069-b3127267c7c5-56573e32-28d9-45ea-b0e5-160e3a82fd48.jpg-v=1448641199277"
                                                 alt="">
                                        </a>
                                    </div>


                                </div>
                            </div>
                        </div>

                    </div>

                </div>

                <div class="col_half col_last product-desc">

                    <div class="product-price">

                        <ins><span class="auto_price">{data.price_buy}</span></ins>
                    </div>

                    <div class="clear"></div>
                    <div class="line"></div>



                    <div class="quantity product-quantity clearfix">
                        <input type="button" value="-" class="minus">
                        <input type="text" id='product_quantity' readonly step="1" min="1"
                               name="quantity" value="1" title="Qty" class="qty" size="4"/>
                        <input type="button" value="+" class="plus">
                    </div>
                    <script>
                        var quantity = parseInt($('#ProductDetailsForm .product-quantity input.qty').val());

                        $('#ProductDetailsForm .minus').click(function () {
                            if (quantity > 0) {
                                if (quantity == 1) {
                                    $('#addtocart').attr('disabled', 'disabled');
                                }
                                quantity -= 1;
                            }
                            else {
                                quantity = 0;
                            }
                            $('#ProductDetailsForm .product-quantity input.qty').val(quantity);
                        });
                        $('#ProductDetailsForm  .plus').click(function () {
                            $('#addtocart').removeAttr('disabled');
                            if (quantity < 100) {
                                quantity += 1;
                            }
                            else {
                                quantity = 100;
                            }
                            $('#ProductDetailsForm .product-quantity input.qty').val(quantity)
                        });

                    </script>
                    <input name="item_id" type="hidden" value="{data.item_id}" />
                    <input class="button btn_add_cart css_bo" id='addtocart' type="submit" value="{LANG.product.btn_add_cart}">



                    <div class="clear"></div>
                    <div class="line"></div>


                    <p> Sự kết hợp hoàn hảo của kim loại với gỗ rắn tạo nên một không gian trẻ
                        trung, tự nhiên mang lại sự tinh tế và hoàn hảo


                        Sự tương phản của phào trần cổ điển màu trắng , định hình không gian nhà
                        thêm đẹp với màu tối của trần gương lạ lẫm ....</p>
                    <!-- Product Single - Short Description End -->

                    <!-- Product Single - Meta
============================================= -->

                    <div class="panel panel-default product-meta">
                        <div class="panel-body">
                            <!--<span itemprop="productID" class="sku_wrapper">SKU: <span class="sku">8465415</span></span>
<span class="posted_in">Category: <a href="#" rel="tag">Dress</a>.</span>-->
											<span class="tagged_as">
												Tags:

												<a href="ban-cafe-5.htm"
                                                   tppabs="http://the-company.bizwebvietnam.net/collections/all/ban-cafe"
                                                   rel="tag">ban_cafe, </a>

											</span>
                        </div>
                    </div>

                    <!-- Product Single - Meta End -->

                    <!-- Product Single - Share
============================================= -->
                    <div class="si-share noborder clearfix">
                        <span>Chia sẻ:</span>

                        <div class='socical-wrapper'>


                            <ul class="social-icons">
                                <!-- check null: == nill -->

                                <div class="item">
                                    <div class="fb-like fix_top" data-href="ban-cafe-3.htm"
                                         tppabs="http://the-company.bi%22http://the-company.bizwebvietnam.net/zwebvietnam.net/ban-cafe-3%22%22 data-layout="
                                         button
                                    " data-action="http://the-company.bizwebvietnam.net/like"
                                    data-show-faces="true" data-share="true" style='margin-right:
                                    5px;'>
                                </div>
                        </div>
                        <div class="fb-send" data-href="ban-cafe-3.htm"
                             tppabs="http://the-company.bizwebvietnam.net/ban-cafe-3"></div>

                        <!-- old style: <li><a class="facebook" data-original-title="facebook" href="#"></a></li>   ...twitter,googleplus,evernote,tumblr -->

                        <script>
                            (function () {
                                var po = document.createElement('script');
                                po.type = 'text/javascript';
                                po.async = true;
                                po.src = 'plusone.js'/*tpa=http://apis.google.com/js/plusone.js*/;
                                var s = document.getElementsByTagName('script')[0];
                                s.parentNode.insertBefore(po, s);
                            })();
                        </script>

                        <div id="fb-root"></div>
                        <script>
                            // // fb SDK v2.4
                            (function(d, s, id) {
                             var js, fjs = d.getElementsByTagName(s)[0];
                             if (d.getElementById(id)) return;
                             js = d.createElement(s); js.id = id;
                             js.src = "sdk-1.js#xfbml=1&version=v2.4"/*tpa=http://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.4*/;
                             fjs.parentNode.insertBefore(js, fjs);
                             }(document, 'script', 'facebook-jssdk'));
                        </script>

                        </ul>
                    </div>
                </div>
            </div>

            <div class="col_full nobottommargin">

                <div class="tabs clearfix nobottommargin hidden-xs" id="tab-1">

                    <ul class="tab-nav clearfix">
                        <li><a href="#tabs-1"><i class="icon-align-justify2"></i><span
                                        class="hidden-xs"> Mô tả</span></a></li>
                        <li class=''><a href="#tabs-2"><i class="icon-info-sign"></i><span
                                        class="hidden-xs"> Bình luận</span></a></li>
                    </ul>

                    <div class="tab-container">
                        <div class="tab-content clearfix" id="tabs-1">
                            <p>

                            <p>Sự kết hợp hoàn hảo của kim loại với gỗ rắn tạo nên một không gian
                                trẻ trung, tự nhiên mang lại sự tinh tế và hoàn hảo</p>

                            <p><img src="{DIR_IMAGE}template/foto-4830-m.jpg-v=1448641064800.jpg"
                                    tppabs="http://bizweb.dktcdn.net/100/035/474/files/foto-4830-m.jpg?v=1448641064800"/>
                            </p>

                            <p>Sự tương phản của phào trần cổ điển màu trắng , định hình không gian
                                nhà thêm đẹp với màu tối của trần gương lạ lẫm . Sự tương phàn giữa
                                thảm trải sàn với họa tiết vằn đen với nền đá mable trắng bóng .</p>

                            <p><img src="{DIR_IMAGE}template/foto-4832-m.jpg-v=1448641076227.jpg"
                                    tppabs="http://bizweb.dktcdn.net/100/035/474/files/foto-4832-m.jpg?v=1448641076227"/>
                            </p>

                            <p>Tương phản ở đây không chỉ là màu Trắng của đá mable lát sàn với màu
                                Gỗ tối của Tủ . Mà còn là sự tương phản giữa Màu tối của Tường với
                                màu trắng trong của cửa gỗ nội thất . Đó là sự tương phản giữa màu
                                sáng thường thấy ở chất liệu hoàn thiện của tủ lạnh side by side ,
                                thì ở đây được chỉ định loại tủ tối màu bóng gương .</p>

                            <p><img src="{DIR_IMAGE}template/foto-4834-m.jpg-v=1448641087569.jpg"
                                    tppabs="http://bizweb.dktcdn.net/100/035/474/files/foto-4834-m.jpg?v=1448641087569"/>
                            </p>

                            <p>Sự tương phản của đồ nội thất sang trọng đặt vào không gian nghỉ bên
                                cửa sổ , Ghế bành gỗ tự nhiên với chi tiết tinh xảo với đệm bọc lông
                                thú cao cấp . Tương phản đến từng chi tiết của 2 lớp Rèm cửa với cả
                                những dây buộc có gắn phụ kiện kim loại màu Đồng lung linh trên nền
                                vải mềm gợn sóng .</p>

                            <p><strong><u>TÓM TẮT THÔNG TIN CHI TIẾT SẢN PHẨM&nbsp;</u></strong></p>

                            <table border="0" cellpadding="1" cellspacing="1" height="auto"
                                   width="100%">
                                <tbody>
                                <tr>
                                    <td>Thương Hiệu</td>
                                    <td>EGANY</td>
                                </tr>
                                <tr>
                                    <td>Danh Mục</td>
                                    <td>Nội thất</td>
                                </tr>
                                <tr>
                                    <td>Chất liệu</td>
                                    <td>khung gỗ kim loại kết hợp gỗ tự nhiên</td>
                                </tr>
                                <tr>
                                    <td>Kích thước</td>
                                    <td>100 X 100 X 100</td>
                                </tr>
                                <tr>
                                    <td>Thời gian giao hàng&nbsp;</td>
                                    <td>7 - 10 ngày làm việc</td>
                                </tr>
                                <tr>
                                    <td>Chính Sách Bảo Hành</td>
                                    <td>&nbsp;Bảo hành chính hãng</td>
                                </tr>
                                <tr>
                                    <td>Showroom</td>
                                    <td>61/2 Quang Trung, P.10 ,&nbsp;Q. Gò Vấp, TP. HCM</td>
                                </tr>
                                <tr>
                                    <td>Hotline</td>
                                    <td>0909 000 000</td>
                                </tr>
                                </tbody>
                            </table>
                            </p>
                        </div>
                        <div class="tab-content clearfix" id="tabs-2">

                            <div id="fb-root"></div>
                            <div class="fb-comments" data-href="ban-cafe-3.htm"
                                 tppabs="http://the-company.bizwebvietnam.net/ban-cafe-3"
                                 data-numposts="5" width="100%" data-colorscheme="light"></div>
                            <!-- script comment fb -->
                        </div>
                    </div>
                </div>

                <div class="panel-group hidden-lg hidden-sm hidden-md" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne">
                            <h4 class="panel-title">
                                <a role="button" data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseOne" style='width: 100%; display: block;'>
                                    <i class="icon-align-justify2"></i><span class=""> Mô tả</span>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel"
                             aria-labelledby="headingOne">
                            <div class="panel-body">
                                <p>Sự kết hợp hoàn hảo của kim loại với gỗ rắn tạo nên một không
                                    gian trẻ trung, tự nhiên mang lại sự tinh tế và hoàn hảo</p>

                                <p><img src="{DIR_IMAGE}template/foto-4830-m.jpg-v=1448641064800.jpg"
                                        tppabs="http://bizweb.dktcdn.net/100/035/474/files/foto-4830-m.jpg?v=1448641064800"/>
                                </p>

                                <p>Sự tương phản của phào trần cổ điển màu trắng , định hình không
                                    gian nhà thêm đẹp với màu tối của trần gương lạ lẫm . Sự tương
                                    phàn giữa thảm trải sàn với họa tiết vằn đen với nền đá mable
                                    trắng bóng .</p>

                                <p><img src="{DIR_IMAGE}template/foto-4832-m.jpg-v=1448641076227.jpg"
                                        tppabs="http://bizweb.dktcdn.net/100/035/474/files/foto-4832-m.jpg?v=1448641076227"/>
                                </p>

                                <p>Tương phản ở đây không chỉ là màu Trắng của đá mable lát sàn với
                                    màu Gỗ tối của Tủ . Mà còn là sự tương phản giữa Màu tối của
                                    Tường với màu trắng trong của cửa gỗ nội thất . Đó là sự tương
                                    phản giữa màu sáng thường thấy ở chất liệu hoàn thiện của tủ
                                    lạnh side by side , thì ở đây được chỉ định loại tủ tối màu bóng
                                    gương .</p>

                                <p><img src="{DIR_IMAGE}template/foto-4834-m.jpg-v=1448641087569.jpg"
                                        tppabs="http://bizweb.dktcdn.net/100/035/474/files/foto-4834-m.jpg?v=1448641087569"/>
                                </p>

                                <p>Sự tương phản của đồ nội thất sang trọng đặt vào không gian nghỉ
                                    bên cửa sổ , Ghế bành gỗ tự nhiên với chi tiết tinh xảo với đệm
                                    bọc lông thú cao cấp . Tương phản đến từng chi tiết của 2 lớp
                                    Rèm cửa với cả những dây buộc có gắn phụ kiện kim loại màu Đồng
                                    lung linh trên nền vải mềm gợn sóng .</p>

                                <p><strong><u>TÓM TẮT THÔNG TIN CHI TIẾT SẢN PHẨM&nbsp;</u></strong>
                                </p>

                                <table border="0" cellpadding="1" cellspacing="1" height="auto"
                                       width="100%">
                                    <tbody>
                                    <tr>
                                        <td>Thương Hiệu</td>
                                        <td>EGANY</td>
                                    </tr>
                                    <tr>
                                        <td>Danh Mục</td>
                                        <td>Nội thất</td>
                                    </tr>
                                    <tr>
                                        <td>Chất liệu</td>
                                        <td>khung gỗ kim loại kết hợp gỗ tự nhiên</td>
                                    </tr>
                                    <tr>
                                        <td>Kích thước</td>
                                        <td>100 X 100 X 100</td>
                                    </tr>
                                    <tr>
                                        <td>Thời gian giao hàng&nbsp;</td>
                                        <td>7 - 10 ngày làm việc</td>
                                    </tr>
                                    <tr>
                                        <td>Chính Sách Bảo Hành</td>
                                        <td>&nbsp;Bảo hành chính hãng</td>
                                    </tr>
                                    <tr>
                                        <td>Showroom</td>
                                        <td>61/2 Quang Trung, P.10 ,&nbsp;Q. Gò Vấp, TP. HCM</td>
                                    </tr>
                                    <tr>
                                        <td>Hotline</td>
                                        <td>0909 000 000</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading " id="headingTwo">
                            <h4 class="panel-title">
                                <a style='width: 100%; display:block;' class="collapsed"
                                   data-toggle="collapse" href="#collapseTwo">
                                    <i class="icon-info-sign"></i><span class=""> Bình luận</span>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse in " role="tabpanel">
                            <div class="panel-body">
                                <div id="fb-root"></div>
                                <div class="fb-comments" data-href="ban-cafe-3.htm"
                                     tppabs="http://the-company.bizwebvietnam.net/ban-cafe-3"
                                     data-numposts="5" width="100%" data-colorscheme="light"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <script type="text/javascript">
                    // fb SDK v2.0
                    (function (d, s, id) {
                        var js, fjs = d.getElementsByTagName(s)[0];
                        if (d.getElementById(id)) return;
                        js = d.createElement(s);
                        js.id = id;
                        js.src = "sdk-1.js#xfbml=1&version=v2.0"/*tpa=http://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.0*/;
                        fjs.parentNode.insertBefore(js, fjs);
                    }(document, 'script', 'facebook-jssdk'));
                </script>


                <div class="line"></div>
                <div class="col_one_third nobottommargin">
                    <a href="javascript:if(confirm(%27http://bizweb.com/  \n\nThis file was not retrieved by Teleport Pro, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://bizweb.com/%27"
                       tppabs="http://bizweb.com/" title="" class="hidden-xs" target='_blank'><img
                                class="image_fade" src="sp_policies_img.jpg-1452002463536.png"
                                tppabs="http://bizweb.dktcdn.net/100/035/474/themes/46087/assets/sp_policies_img.jpg?1452002463536"
                                alt=""></a>
                </div>

                <div class="col_two_third col_last nobottommargin">

                    <div class="col_half">

                        <div class="feature-box fbox-plain fbox-dark fbox-small">
                            <div class="fbox-icon">
                                <i class="icon-plane"></i>
                            </div>
                            <h3>Miễn phí vẫn chuyển</h3>

                            <p class="notopmargin">Nhận hàng trong vòng 3 ngày & hoàn toàn miễn phí
                                vận chuyển</p>
                        </div>

                    </div>

                    <div class="col_half col_last">

                        <div class="feature-box fbox-plain fbox-dark fbox-small">
                            <div class="fbox-icon">
                                <i class="icon-gift"></i>
                            </div>
                            <h3>Quà tặng</h3>

                            <p class="notopmargin">Nhiều quà tặng và ưu đãi hấp dẫn khi mua hàng từ
                                1.000.000đ trở lên.</p>
                        </div>

                    </div>

                    <div class="col_half nobottommargin">

                        <div class="feature-box fbox-plain fbox-dark fbox-small">
                            <div class="fbox-icon">
                                <i class="icon-undo"></i>
                            </div>
                            <h3>Đổi trả hàng</h3>

                            <p class="notopmargin">Hoàn tiền trong 30 ngày nếu không hài lòng</p>
                        </div>

                    </div>

                    <div class="col_half col_last nobottommargin">

                        <div class="feature-box fbox-plain fbox-dark fbox-small">
                            <div class="fbox-icon">
                                <i class="icon-phone3"></i>
                            </div>
                            <h3>HOTLINE: 08 7300 5757</h3>

                            <p class="notopmargin">Dịch vụ chăm sóc khách hàng sẵn sàng hỗ trợ bạn
                                24/7</p>
                        </div>

                    </div>

                </div>
            </div>

        </form>
    </div>

    </div>

</div>
<!-- END: detail1 -->

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
      <div class="info_row_content price"><span class="auto_price"> {price}</span></div>
      <div class="clear"></div>
    </div>
    <!-- END: info_row_price -->
  <!-- BEGIN: price_s -->
  	<div id="info_row-price_buy" class="info_row price_buy">
      <span>{LANG.product.price_s}: </span>
      <span class="auto_price">{price_s}</span>
      <div class="clear"></div>
    </div>
  <!-- END: price_s -->
  <!-- BEGIN: price_l -->
      <div id="info_row-price_buy" class="info_row price_buy">
          <span>{LANG.product.price_l}: </span>
          <span class="auto_price">{price_l}</span>
          <div class="clear"></div>
      </div>
  <!-- END: price_l -->

    <form id="form_add_cart_detail" action="{data.link_cart}" method="post" class="form_add_cart_detail">
  	<!-- BEGIN: info_row -->

    <!-- END: info_row -->
  	<div class="info_row">
      <div class="info_row_title">{LANG.product.quantity}: </div>
      <div class="info_row_content"><input type="text" value="1" class="auto_quantity quantity" maxlength="3" /><input name="quantity" type="hidden" value="1" class="auto_quantity_input" /></div>
      <div class="clear"></div>
    </div>
  	<div class="info_row">
      <div class="info_row_title">{LANG.product.total}: </div>
      <div class="info_row_content price_buy" id="detail-total"><span class="auto_price">{data.price_buy}</span></div>
      <div class="clear"></div>
    </div>
    <!-- BEGIN: quantity -->
    <div class="info_row">
        <div class="info_row_title">{LANG.product.quantity_barrel}: </div>
        <div class="info_row_content">{quantity}</div>
        <div class="clear"></div>
    </div>
    <!-- END: quantity -->
    <!-- BEGIN: made_country -->
    <div class="info_row">
        <div class="info_row_title">{LANG.product.made_country}: </div>
        <div class="info_row_content">{made_country}</div>
        <div class="clear"></div>
    </div>
    <!-- END: made_country -->
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

			$('form.form_add_cart_detail').submit(function(){
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
                    header_cart();

                });

				return false;
			});
            auto_price_format();
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