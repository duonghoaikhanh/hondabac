<!-- BEGIN: main -->
<section id="slider" class="slider-parallax swiper_wrapper clearfix">

  <div class="tp-banner-container">
    <div class="tp-banner">
      <ul>    <!-- SLIDE  -->


        <li data-transition="random" data-slotamount="7" data-link="/collection/all" data-title="">
          <img src="{DIR_IMAGE}template/slideshow_1.jpg-1450838787703.jpg">

          <div class="tp-caption customin lfl ltr tp-resizeme revo-slider-caps-text uppercase"
               data-x="center"
               data-y="center"
               data-customin="x:-300px;y:0px;z:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:0% 0%;"
               data-speed="700"
               data-start="1000"
               data-easing="easeOutBack"
               data-splitin="none"
               data-splitout="none"
               data-elementdelay="0.01"
               data-endelementdelay="0.1"
               data-endspeed="1000"
               data-endeasing="easeOutBack" style=" color: #fff; font-size: 60px"></div>
        </li>


        <li data-transition="random" data-slotamount="7" data-link="/san-pham-khuyen-mai" data-title="">
          <img src="{DIR_IMAGE}template/slideshow_3.jpg-1450838787703.jpg"
                  >

          <div class="tp-caption customin lfl ltr tp-resizeme revo-slider-caps-text uppercase"
               data-x="center"
               data-y="center"
               data-customin="x:-300px;y:0px;z:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:0% 0%;"
               data-speed="700"
               data-start="1000"
               data-easing="easeOutBack"
               data-splitin="none"
               data-splitout="none"
               data-elementdelay="0.01"
               data-endelementdelay="0.1"
               data-endspeed="1000"
               data-endeasing="easeOutBack" style=" color: #fff; font-size: 60px"></div>
        </li>


      </ul>
    </div>
  </div>

  <script type="text/javascript">

    jQuery(document).ready(function () {

      jQuery('.tp-banner').show().revolution(
              {
                dottedOverlay: "none",
                delay: 5000,
                startwidth: 1350,
                startheight: 500,
                hideThumbs: 200,

                thumbWidth: 100,
                thumbHeight: 50,
                thumbAmount: 5,

                navigationType: "none",
                navigationArrows: "solo",
                navigationStyle: "preview2",

                touchenabled: "on",
                onHoverStop: "on",

                swipe_velocity: 0.7,
                swipe_min_touches: 1,
                swipe_max_touches: 1,
                drag_block_vertical: false,

                parallax: "mouse",
                parallaxBgFreeze: "on",
                parallaxLevels: [7, 4, 3, 2, 5, 4, 3, 2, 1, 0],

                keyboardNavigation: "off",

                navigationHAlign: "center",
                navigationVAlign: "bottom",
                navigationHOffset: 0,
                navigationVOffset: 20,

                soloArrowLeftHalign: "left",
                soloArrowLeftValign: "center",
                soloArrowLeftHOffset: 20,
                soloArrowLeftVOffset: 0,

                soloArrowRightHalign: "right",
                soloArrowRightValign: "center",
                soloArrowRightHOffset: 20,
                soloArrowRightVOffset: 0,

                shadow: 0,
                fullWidth: "on",
                fullScreen: "off",

                spinner: "spinner4",

                stopLoop: "off",
                stopAfterLoops: -1,
                stopAtSlide: -1,

                shuffle: "off",

                autoHeight: "on",
                forceFullWidth: "off",


                hideThumbsOnMobile: "off",
                hideNavDelayOnMobile: 1500,
                hideBulletsOnMobile: "off",
                hideArrowsOnMobile: "off",
                hideThumbsUnderResolution: 0,

                hideSliderAtLimit: 0,
                hideCaptionAtLimit: 0,
                hideAllCaptionAtLilmit: 0,
                startWithSlide: 0,
                fullScreenOffsetContainer: ".header"
              });


    }); //ready

  </script>

</section>

<section id="content">
  <div class="content-wrap">

  <!-- promo -->
  <div class="promo promo-light promo-full bottommargin-lg header-stick notopborder">
    <div class="container clearfix">
      <div class='col-md-9 nopadding promo_title'>
        <h3>{data.banner_tell_us_page_home}</h3>
        <span>{data.banner_support_247}</span>
      </div>
      <div class='col-md-3 promo_btn'>
        <a href="{data.link_contact}"
           class="button button-dark button-xlarge button-rounded">{LANG.home.contact_now}</a>
      </div>
    </div>
  </div>
  <!-- end promo -->

  {data.list_page_group_focus}


  <!-- banner -->
  <div class="banner-img">
    {data.banner_pa_home}
  </div>
  <!-- end banner -->

  {data.list_product_focus}

  <div class="section parallax dark" data-stellar-background-ratio="0.4">
    <h4 class="uppercase center testimonial_title">
      {LANG.homve.customer_said_about_us}
    </h4>

    <div class="fslider testimonial testimonial-full" data-arrows="false" style="z-index: 2;">
      <div class="flexslider">
        <div class="slider-wrap">


          <div class="slide">
            <div class="testi-image">
              <a href="#"><img src="{DIR_IMAGE}avt1.jpg"
                               alt="Customer Testimonails"></a>
            </div>
            <div class="testi-content">
              <p>
                Nhân viên rất nhiệt tình, sản phẩm chất lượng tốt, ngoài ra bảo hành rất chu đáo, tôi rất thích cách làm việc của công ty.
              </p>

              <div class="testi-meta">
                VÕ QUỐC CƯỜNG
              </div>
            </div>
          </div>


          <div class="slide">
            <div class="testi-image">
              <a href="#"><img src="{DIR_IMAGE}avt2.jpg"
                               alt="Customer Testimonails"></a>
            </div>
            <div class="testi-content">
              <p>

                Tôi hoàn toàn bị chinh phục bởi tác phong làm việc & quy trình chuyên nghiệp của
                đội ngũ The Company
              </p>

              <div class="testi-meta">
                Phan Nguyễn
              </div>
            </div>
          </div>


          <div class="slide">
            <div class="testi-image">
              <a href="#"><img src="{DIR_IMAGE}avt3.jpg"
                               alt="Customer Testimonails"></a>
            </div>
            <div class="testi-content">
              <p>
                Sản phẩm rất chất lượng, giá thành rất phù hợp. Chính sách công ty rất tốt, tôi rất thích sản phẩm của công ty.
              </p>

              <div class="testi-meta">
                Minh Hằng
              </div>
            </div>
          </div>
          <div class="slide">
            <div class="testi-image">
              <a href="#"><img src="{DIR_IMAGE}avt4.jpg"
                               alt="Customer Testimonails"></a>
            </div>
            <div class="testi-content">
              <p>
                Đầu tiên là sự ân cần khi giới thiệu sản phẩm, sản phẩm chất lượng tuyệt đối trong khi giá thành rất phải chăng.
              </p>

              <div class="testi-meta">
                Văn Quý
              </div>
            </div>
          </div>


        </div>
      </div>
    </div>
  </div>


  <div class='brand'>

    <div id="oc-clients-full" class="owl-carousel image-carousel">


      <a href="all.htm" target='_blank'><img
                src="{DIR_IMAGE}template/popular_brand_img_1.png-1450838787703.png"
                alt=""></a>


      <a href="all.htm" target='_blank'><img
                src="{DIR_IMAGE}template/popular_brand_img_2.png-1450838787703.png"
                alt=""></a>


      <a href="all.htm" target='_blank'><img
                src="{DIR_IMAGE}template/popular_brand_img_3.png-1450838787703.png"
                alt=""></a>


      <a href="all.htm"  target='_blank'><img
                src="{DIR_IMAGE}template/popular_brand_img_4.png-1450838787703.png"
                alt=""></a>


      <a href="all.htm"  target='_blank'><img
                src="{DIR_IMAGE}template/popular_brand_img_5.png-1450838787703.png"
                alt=""></a>


      <a href="all.htm" target='_blank'><img
                src="{DIR_IMAGE}template/popular_brand_img_6.png-1450838787703.png"
                alt=""></a>


    </div>

    <script type="text/javascript">

      jQuery(document).ready(function ($) {

        var ocClients = $("#oc-clients-full");

        ocClients.owlCarousel({
          items: 6,
          margin: 30,
          loop: true,
          nav: true,
          navText: ['<i class="icon-angle-left"></i>', '<i class="icon-angle-right"></i>'],
          autoplay: true,
          dots: false,
          autoplayHoverPause: true,
          responsive: {
            0: {items: 2},
            480: {items: 3},
            768: {items: 4},
            992: {items: 5},
            1200: {items: 6}
          }
        });

      });

    </script>
  </div>

</div>
</section>
<!-- END: main -->


<!-- BEGIN: list_product_focus -->
<div class='container clearfix'>
  <div id="portfolio" class="clearfix">
    <div class="heading-block center">
      <h3>{LANG.home.products_focus_year}</h3>
      <span>{LANG.home.text_products_focus_year}</span>
    </div>
    <!-- BEGIN: row -->
    <article class="porfolio_single portfolio-item pf-media pf-icons col-xs-6 col-md-6 porfolio_single_left">
      <div class="portfolio-image">
        <a href="kien-truc-hien-dai.htm">
          <img src="{row.picture_show}" alt="{row.title}">
        </a>

        <div class="portfolio-overlay">
          <a href="{row.picture_popup}" class="left-icon" data-lightbox="image"><i class="icon-line-plus"></i></a>
          <a href="{row.link}" class="right-icon"><i class="icon-line-ellipsis"></i></a>
        </div>
      </div>
      <div class="portfolio-desc">
        <h3>
          <a href="{row.link}">{row.title}</a></h3>
        <span class="auto_price">{row.price}</span>
      </div>
    </article>
    <!-- END: row -->
    <div class='clear' style='margin-bottom: 15px'></div>
    <div class='clear' style='margin-bottom: 15px'></div>

  </div>
</div>
<script>
  auto_price_format();
</script>
<!-- END: list_product_focus -->




<!-- BEGIN: list_page_group_focus -->
<div class="container clearfix">

  <!-- BEGIN: row -->
  <div class="col_one_third nobottommargin {row.last}">
    <div class="feature-box media-box">

      <div class="fbox-media">
        <a href='javascript:void(0)'>
          <img src="{row.picture}" alt="{row.title}">
        </a>
      </div>
      <div class="fbox-desc">
        <a href='javascript:void(0)'><h3>{row.title}</h3></a>
        <span class="subtitle">{row.short}</span>

        <p>{row.content}</p>
      </div>
    </div>
  </div>
  <!-- END: row -->

  <div class="clear"></div>
  <div class="clear"></div>



</div>

<!-- END: list_page_group_focus -->



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