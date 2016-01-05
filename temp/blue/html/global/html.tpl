<!-- BEGIN: body --><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if IE 9 ]>
<html class="ie9 no-js"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="ltr" lang="en-US"> <!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!--[if IE]>
        <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'/>
  <![endif]-->
    <title>{CONF.meta_title}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <meta name="description" content="{CONF.meta_desc}" />
    <meta name="keywords" itemprop="keywords" content="{CONF.meta_key}" />
    <link rel="canonical" href="{CONF.canonical}" />
    <meta property="og:type" content="website" />
    <meta property="og:title" name="title" content="{CONF.meta_title}" />
    <meta property="og:description" itemprop="description" name="description" content="{CONF.meta_desc}" />

    <!--<link href="{DIR_CSS}global/cluetip/jquery.cluetip.css" rel="stylesheet">
      <link href="{DIR_CSS}global/layout.css" rel="stylesheet">-->
  <link href="{DIR_JS}fancybox/jquery.fancybox.css" rel="stylesheet">

  <link href="{DIR_JS}jalert/css/jquery.alerts.css" rel="stylesheet">

  <script type="text/javascript" language="javascript" >
      var ROOT = "{CONF.rooturl}";
      var DIR_IMAGE = "{DIR_IMAGE}";
      var deviceType = "{data.deviceType}";
      var lang = "{CONF.lang_cur}";
      var lang_js = new Array();
			var go_content = 1;
      {LANG_JS}
    </script>
  <script type="text/javascript" src="{DIR_JS}jquery-1.10.2.js"></script>
  <script src="{DIR_JS}jquery.hoverIntent.js"></script>
    <script src="{DIR_JS}fancybox/jquery.fancybox.pack.js"></script>
    <script src="{DIR_JS}cluetip/jquery.cluetip.js"></script>
    <script src="{DIR_JS}auto_numeric/autoNumeric.js"></script>
    <script src="{DIR_JS}jalert/js/jquery.alerts.js"></script>
    <script src="{DIR_JS}jquery.scrollTo.min.js"></script>
    <script src="{DIR_JS}javascript.js"></script>
    {CONF.include_js}
    {CONF.include_css}
    {CONF.include_js_content}
  <!--[if lt IE 9]>
  <script type="text/javascript" src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script type="text/javascript" src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>

  <style type="text/css">
    .css_bo {behavior: url({DIR_JS}PIE.htc);}
  </style>
  <![endif]-->


    <style type="text/css">

      .revo-slider-emphasis-text {
        font-size: 58px;
        font-weight: 700;
        letter-spacing: 1px;
        font-family: 'Raleway', sans-serif;
        padding: 15px 20px;
        border-top: 2px solid #FFF;
        border-bottom: 2px solid #FFF;
      }

      .revo-slider-desc-text {
        font-size: 20px;
        font-family: 'Lato', sans-serif;
        width: 650px;
        text-align: center;
        line-height: 1.5;
      }

      .revo-slider-caps-text {
        font-size: 16px;
        font-weight: 400;
        letter-spacing: 3px;
        font-family: 'Raleway', sans-serif;
      }

    </style>

  <link href="{DIR_CSS}template/font_css_google.css" rel='stylesheet' type='text/css'/>
  <link href="{DIR_CSS}template/bootstrap.css" rel='stylesheet' type='text/css'/>
  <link href="{DIR_CSS}template/style.css" rel='stylesheet' type='text/css'/>
  <link href="{DIR_CSS}template/dark.css" rel='stylesheet' type='text/css'/>
  <link href="{DIR_CSS}template/font-icons.css" rel='stylesheet' type='text/css'/>
  <link href="{DIR_CSS}template/animate.css" rel='stylesheet' type='text/css'/>
  <link href="{DIR_CSS}template/magnific-popup.css" rel='stylesheet' type='text/css'/>
  <link href="{DIR_CSS}template/font_default.css" rel='stylesheet' type='text/css'/>

  <link href="{DIR_CSS}template/responsive.css" rel='stylesheet' type='text/css'/>

  <link href="{DIR_CSS}template/settings.css" type='text/css'/>

  <!-- pwg slider -->
  <link href="{DIR_CSS}template/pgwslideshow.min.css" rel='stylesheet' type='text/css'/>
  <link href="{DIR_CSS}template/jquery.fancybox.css" rel='stylesheet' type='text/css'/>

  <!-- responsive menu -->
  <link href="{DIR_CSS}template/simple-sidebar.css" rel='stylesheet' type='text/css'/>
  <!-- end responsive menu -->

  <!-- pwg slider -->
  <link href="{DIR_CSS}template/pgwslideshow.min.css" rel='stylesheet' type='text/css'/>

  <!-- Egany custom style -->
  <link href="{DIR_CSS}template/custom_style.css" rel='stylesheet' type='text/css'/>

  <!-- script -->

  <script src="{DIR_JS}template/jquery.js" type='text/javascript'></script>
  <!-- Bizweb plugins END -->

  <script src="{DIR_JS}template/plugins.js" type='text/javascript'></script>

  <script src="{DIR_JS}template/jquery.gmap.js" type='text/javascript'></script>
  <!-- External JavaScripts
  ============================================= -->

  <!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
  <script src="{DIR_JS}template/jquery.themepunch.tools.min.js" type='text/javascript'></script>
  <script src="{DIR_JS}template/jquery.themepunch.revolution.min.js" type='text/javascript'></script>

  <script src="{DIR_JS}template/pgwslideshow.min.js" type='text/javascript'></script>

  <!-- Bizweb plugins BEGIN -->
  <script src="{DIR_JS}template/option-selectors.js" type='text/javascript'></script>
  <!-- script.js -->

  <!-- BEGIN products scripts -->
  <script src="{DIR_JS}template/fly-to-cart-aothun.js" type='text/javascript'></script>
  <!-- END products scripts -->

  <!-- BEGIN fancy box -->
  <script src="{DIR_JS}template/jquery.fancybox.pack.js" type='text/javascript'></script>
  <!-- END fancy box -->


  <script src="{DIR_JS}template/pgwslideshow.min.js" type='text/javascript'></script>
  </head>

<body class="stretched no-transition">
<div id='body_overlay'></div>


<!-- mobile menu -->
<div id="menu-wrapper">
  <!-- Sidebar -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <!-- Top Search
============================================= -->
      {data.box_search_sm}

      <!-- #top-search end -->


      <li class='current'><a href="index.htm" >Trang chủ</a></li>


      <li class=''><a href="all.htm"  class='menu'>Sản
          phẩm<span>+</span></a>
        <ul>


          <li class=''><a class='sub-menu' href="noi-that-nha-bep.htm"
                    >
              <div>Nội thất nhà bếp</div>
            </a></li>


          <li class=''><a class='sub-menu' href="noi-that-phong-tam.htm"
                    >
              <div>Nội thất phòng tắm</div>
            </a></li>


          <li class=''><a class='sub-menu' href="noi-that-phong-khach.htm"
                    >
              <div>Nội thất phòng khách</div>
            </a></li>


          <li class=''><a class='sub-menu' href="noi-that-phong-ngu.htm"
                    >
              <div>Nội thất phòng ngủ</div>
            </a></li>


          <li class=''><a class='sub-menu' href="sofas.htm"
                    >
              <div>Sofas</div>
            </a></li>


          <li class=''><a class='sub-menu' href="ban-cafe.htm"
                    >
              <div>Bàn cafe</div>
            </a></li>


          <li class=''><a class='sub-menu' href="ban.htm" >
              <div>Bàn</div>
            </a></li>


        </ul>
      </li>


      <li class=''><a href="#" class='menu'>Dịch vụ<span>+</span></a>
        <ul>


          <li class=''><a class='sub-menu' href="dich-vu-giam-sat-thi-cong.htm"
                    >
              <div>Dịch vụ giám sát thi công</div>
            </a></li>


          <li class=''><a class='sub-menu' href="dich-vu-thi-cong-noi-that.htm"
                    >
              <div>Dịch vụ thi công nội thất</div>
            </a></li>


          <li class=''><a class='sub-menu' href="dich-vu-thi-cong-xay-dung.htm"
                    >
              <div>Dịch vụ thi công xây dựng</div>
            </a></li>


          <li class=''><a class='sub-menu' href="dich-vu-thiet-ke-noi-that.htm"
                    >
              <div>Dịch vụ thiết kế nội thất</div>
            </a></li>


          <li class=''><a class='sub-menu' href="dich-vu-thiet-ke-kien-truc.htm"
                    >
              <div>Dịch vụ thiết kế kiến trúc</div>
            </a></li>


        </ul>
      </li>


      <li class=''><a href="du-an.htm" >Dự án</a></li>


      <li class=''><a href="gioi-thieu.htm" >Giới
          thiệu</a></li>


    </ul>
  </div>
  <!-- /#sidebar-wrapper -->
  <!-- Page Content -->

  <!-- /#page-content-wrapper -->

</div>
<!-- end mobile menu -->

<a href="#menu-toggle" class="btn btn-default hidden-md hidden-lg" id="menu-toggle"><i class='icon-reorder'></i></a>
<script type="text/javascript">
  //get_viewed_items_html...
  function get_viewed_items_html($current_product) {
    // saving current viewed-item
    var jsonProducts = sessionStorage.getItem('products_viewed');
    var arrPro = {};
    if (jsonProducts != null)
      arrPro = JSON.parse(jsonProducts);
    else {
      sessionStorage.removeItem('products_viewed');
      sessionStorage.removeItem('products_viewed_indexing'); // must-have this LOC
    }

    // var $current_product = {}; // $current_product object, ko phải string...
    if ($current_product != null && arrPro[$current_product.id] == null) // null / undefined
    {
      arrPro[$current_product.id] = $current_product;
      sessionStorage.setItem('products_viewed', JSON.stringify(arrPro));  //


      // saving current index
      var jsonProIndex = sessionStorage.getItem('products_viewed_indexing');

      var arrProIndex = [];
      if (jsonProIndex != null)
        arrProIndex = JSON.parse(jsonProIndex);
      arrProIndex.push($current_product.id);
      sessionStorage.setItem('products_viewed_indexing', JSON.stringify(arrProIndex));  //

    }

    var jsonProIndex = sessionStorage.getItem('products_viewed_indexing');
    var jsonProducts = sessionStorage.getItem('products_viewed');
    var arrProIndex = [];
    var $strHTML = '';
    var $countViewedItem = 0;
    var $intMaxViewedItems = '';
    if ($intMaxViewedItems == '')
      $intMaxViewedItems = 3;
    else
      $intMaxViewedItems = parseInt($intMaxViewedItems);
    if (jsonProIndex != null & jsonProducts != null & $current_product != null) {
      //parse indexing, products...
      arrProIndex = JSON.parse(jsonProIndex);
      arrPro = JSON.parse(jsonProducts);

      // assign count_items = 0;
      for (i = 0; i < arrProIndex.length; i++) {

        $strProID = arrProIndex[i];
        if ($current_product.id != $strProID && $strProID != null && $countViewedItem < $intMaxViewedItems) {

          var product_viewed = arrPro[$strProID];
          //console.log(product_viewed);
          var price = Bizweb.formatMoney(product_viewed.price, "{{amount_no_decimals_with_comma_separator}}&#8363;") + '</b>';
          var compare_price = Bizweb.formatMoney(product_viewed.compare_at_price, "{{amount_no_decimals_with_comma_separator}}&#8363;") + '</b>';
          var old_price = '';
          if (product_viewed.price < product_viewed.compare_at_price) {
            old_price = '<del>' + compare_price + '</del>';
          }
          // for (img_idx ; i<product_viewed.images.length; img_idx++)

          $bo_found = true;
          //product_viewed['images'][0];
          //==JSON.parse(localStorage.getItem('products_viewed'))['1000302443']['images'][0]
          $strHTML += '<div class="spost clearfix"> <div class="entry-image">'
          + '<a href="' + product_viewed.alias + '" title="' + product_viewed.name + '">'
          + ' <img'
          + ' u="image" '
          + ' src="' + product_viewed['images'][0].src + '"'
          + ' alt="' + product_viewed.name + '"'
          + ' data-big="' + product_viewed['images'][0] + '"'
          + ' data-title="' + product_viewed.name + '"'
          + ' data-description="' + product_viewed.name + '"'
            // +'data_shape_color_code="'+ str_shape_color + '"'
            // +'data_shape_code="'+ arrName[0] + '"'
            // +'data_color_code="'+ arrName[1] + '"
          + '/>'
          + '</a>'
          + '</div>'
          + '<div class="entry-c">'
          + '<div class="entry-title">'
          + '<h4><a href="' + product_viewed.alias + '">' + product_viewed.name + '</a></h4>'
          + '</div>'
          + '<ul class="entry-meta"><li class="color">' + old_price + '<ins> ' + price + '</ins></li></ul>'

          + '</div></div>'

          // console.log($strHTML);

          $countViewedItem = $countViewedItem + 1;

        } //
      } // endfor: arrProIndex
    } // endif: jsonProIndex

    return $strHTML;
  }// get_vied_items_html


  /*** add to cart ***/

  // <<<<<< product BEGIN
  function refreshProductSelections($tagSelectOption0, $option0, $tagSelectOption1, $option1, $tagSelectOption2, $option2) {
    if ($option0 != null && $option0 != '') {
      //change option 0
      $($tagSelectOption0 + ' option[value="' + $option0 + '"]').prop('selected', true); // option-0 => Shape...  okok
      $($tagSelectOption0).change();
    }


    if ($option1 != null && $option1 != '') {
      //change option 1
      $($tagSelectOption1 + ' option[value="' + $option1 + '"]').prop('selected', true); // option-1 => Color...  okok
      $($tagSelectOption1).change();
    }
    if ($option2 != null && $option2 != '') {
      //change option 2
      $($tagSelectOption2 + ' option[value="' + $option2 + '"]').prop('selected', true); // option-1 => Color...  okok
      $($tagSelectOption2).change();
    }
  }

  function update_variant(variant, $tagPrice, $tagPriceCompare, $tagAddToCart, $tagProductSection) {
    //console.log(Bizweb.formatMoney(variant.price, "{{amount_no_decimals_with_comma_separator}}&#8363;"));
    var $unit_price = 0;
    var $unit_price_compare = 0;
    if (variant != null && variant.available == true) {
      $unit_price = variant.price;
      //console.log(Bizweb.formatMoney(variant.price, "{{amount_no_decimals_with_comma_separator}}&#8363;"));
      if (variant.price < variant.compare_at_price) {
        $unit_price_compare = variant.compare_at_price;

        //show onsale label
        $($tagProductSection).find('.sticker-sale').removeClass('hidden');
      } else {

        //hide onsale label... nono: find matching ids: ('[id^="ProductDetails"]')
        $($tagProductSection).find('.sticker-sale').addClass('hidden');
      }

      $($tagAddToCart).html('Thêm vào giỏ');
      $($tagAddToCart).removeAttr('disabled');
    }
    else {

      $($tagAddToCart).html('Hết hàng');
      $($tagAddToCart).prop('disabled', true);
    }

    var $strUnitPrice = Bizweb.formatMoney($unit_price, "{{amount_no_decimals_with_comma_separator}}&#8363;");  // ''  shop.money_format
    //console.log($strUnitPrice);
    var $strUnitPriceCompare = Bizweb.formatMoney($unit_price_compare, "{{amount_no_decimals_with_comma_separator}}&#8363;");  // ''  shop.money_format
    $($tagPrice).html($strUnitPrice);
    if ($unit_price_compare > 0) {
      $($tagPriceCompare).html($strUnitPriceCompare);
    }
    else
      $($tagPriceCompare).html('');

    $($tagProductSection).find('.unit_price_not_formated').val($unit_price);
    // update_total();
  }

  //ajax: add to cart
  function addItem(form_id, fly_img) {

    $.ajax({
      type: 'POST',
      url: 'add.js'/*tpa=http://the-company.bizwebvietnam.net/cart/add.js*/,
      dataType: 'json',
      async: false,
      data: $('#' + form_id).serialize(),
      success: onSuccess(fly_img, '#' + form_id),
      error: onError,
      cache: false
    });
  }

  onSuccess = function (fly_img, form_id) {
    flyToElement($(fly_img), $('.top-cart-block'));

    //update top cart: qty, total price
    var $product_page = $(form_id).parents('[class^="product-page"]');
    var quantity = parseInt($product_page.find('[name="quantity"]').val(), 10) || 1;
    var $item_qty_new = 0;
    var $item_price_new = 0;
    var $item_price_increase = 0;
    var $boUpdated = false;

    //insert "no_item" html
    if ($('.top-cart-block .top-cart-content .top-cart-item').size() <= 0) {
      $('.top-cart-block .top-cart-content').html(top_cart_no_item);
    }
    //update items
    $('.top-cart-block .top-cart-content .top-cart-item').each(function () {
      if ($(this).find('.item_id').val() == $product_page.find('[name="variantId"]').val()) {
        $item_qty_new = parseInt($(this).find('.item_qty').val()) + quantity;
        $item_price_single = parseFloat($(this).find('.item_unit_price_not_formated').val());
        $item_price_new = $item_qty_new * $item_price_single;

        $item_price_increase = quantity * parseFloat($(this).find('.item_unit_price_not_formated').val());
        $(this).find('.item_qty').val($item_qty_new);  // !!!
        $(this).find('.top-cart-item-quantity').html('x ' + $item_qty_new);
        $(this).find('.top-cart-item-price').html(Bizweb.formatMoney($item_price_new, "{{amount_no_decimals_with_comma_separator}}&#8363;"));  // ''  shop.money_format
        $boUpdated = true; // updated item
      }
    });

    if ($boUpdated == false) { // current item is not existed!!!
      var $proURL = $product_page.find('.product_url').val();
      var $proTitle = $product_page.find('.product_title_hd').val();
      var $proUnitPrice = parseFloat($product_page.find('.unit_price_not_formated').val());
      var $strNewItem = '<div class="top-cart-item clearfix">'
              + ' <input type="hidden" class="item_id" value="' + $product_page.find('[name="variantId"]').val() + '"></input>'
              + ' <input type="hidden" class="item_qty" value="' + quantity + '"></input>'
              + ' <input type="hidden" class="item_unit_price_not_formated" value="' + $proUnitPrice + '"></input>'

              + '<div class="top-cart-item-image">'
              + ' <a href="' + $proURL + '"><img src="{DIR_IMAGE}template/{DIR_IMAGE}/template/' + $product_page.find('.product_img_small').val() + '" alt="' + $proTitle + '" ></a>'
              + '</div>'
              + '<div class="top-cart-item-desc">'
                //+ ' <span class="cart-content-count">x'+ quantity +'</span>'
              + '<a href="' + $proURL + '">' + $proTitle + '</a>'
              + '<span class="top-cart-item-price">' + Bizweb.formatMoney(($proUnitPrice * quantity), "{{amount_no_decimals_with_comma_separator}}&#8363;") + '</span>'
              + '<span class="top-cart-item-quantity">x ' + quantity + '</span>'
              + ' </div>'
              + '</div>';
      $('.top-cart-block .top-cart-content .top-cart-items').append($strNewItem);
      $item_price_increase = $proUnitPrice * quantity;

    }
    //check is emptiness...
    check_topcart_empty();

    //update total
    var $quantity_new = parseInt($('.top-cart-block #top-cart-trigger span').text()) + quantity;
    var $price_new = parseFloat($('.top-cart-block .top_cart_total_price_not_format').val()) + $item_price_increase;
    $('.top-cart-block .top_cart_total_price_not_format').val($price_new);  // !!!
    $('.top-cart-block #top-cart-trigger span').html($quantity_new);
    $('.top-cart-block .top-checkout-price').html(Bizweb.formatMoney($price_new, "{{amount_no_decimals_with_comma_separator}}&#8363;"));
    $('.cart_total').html(Bizweb.formatMoney($price_new, "{{amount_no_decimals_with_comma_separator}}&#8363;"));

  };

  var onError = function () {
  }

  var top_cart_empty = '<div> Chưa có sản phẩm trong giỏ!</div>';
  var top_cart_no_item = '';
  function check_topcart_empty() {

    //Bạn chưa mua sản phẩm nào!
    if ($('.top-cart-block .top-cart-content .top-cart-item').size() <= 0) {
      top_cart_no_item = $('.top-cart-block .top-cart-content').html();
      $('.top-cart-block .top-cart-content').html(top_cart_empty);
      $('.top-cart-block .top-cart-content').css('width', '200px');
    }
    else {
      //remove width, okok!!!
      $('.top-cart-block .top-cart-content').css('width', '');
    }
  }
  jQuery(document).ready(function ($) {

    //select first size&color.
    //second item: $($("#colorPicker option").get(1))...
    $("#sizePicker option:first").attr('selected', 'selected');
    $("#colorPicker option:first").attr('selected', 'selected');

    // function: choose size
    $('#option-0 select').change(function () {
      var $size = $(this).val();
      var $color = $('#option-1 select').val();
      var $material = $('#option-2 select').val();
      var $tagSelectOption0 = '#product-select-option-0';
      var $tagSelectOption1 = '#product-select-option-1';
      var $tagSelectOption2 = '#product-select-option-2';

      refreshProductSelections($tagSelectOption0, $size, $tagSelectOption1, $color, $tagSelectOption2, $material);
    });

    // function: choose color
    $('#option-1 select').change(function () {
      var $size = $('#option-0 select').val();
      var $color = $(this).val();
      var $material = $('#option-2 select').val();
      var $tagSelectOption0 = '#product-select-option-0';
      var $tagSelectOption1 = '#product-select-option-1';
      var $tagSelectOption2 = '#product-select-option-2';

      refreshProductSelections($tagSelectOption0, $size, $tagSelectOption1, $color, $tagSelectOption2, $material);
    });

    // function: choose material
    $('#option-2 select').change(function () {
      var $size = $('#option-0 select').val();
      var $color = $('#option-1 select').val();
      var $material = $(this).val();
      var $tagSelectOption0 = '#product-select-option-0';
      var $tagSelectOption1 = '#product-select-option-1';
      var $tagSelectOption2 = '#product-select-option-2';

      refreshProductSelections($tagSelectOption0, $size, $tagSelectOption1, $color, $tagSelectOption2, $material);
    });


    //second item: $($("#colorPicker option").get(1))...
    $("#option-0 select option:first").attr('selected', 'selected');
    $("#option-1 select option:first").attr('selected', 'selected');
    $("#option-2 select option:first").attr('selected', 'selected');
    var $size = $("#option-0 select option:first").val();
    var $color = $("#option-1 select option:first").val();
    var $material = $("#option-2 select option:first").val();
    var $tagSelectOption0 = '#product-select-option-0';
    var $tagSelectOption1 = '#product-select-option-1';
    var $tagSelectOption2 = '#product-select-option-2';

    refreshProductSelections($tagSelectOption0, $size, $tagSelectOption1, $color, $tagSelectOption2, $material);


    //add to cart
    $("#addtocart").on('click', function (e) {  //.click(function(e){ //
      e.preventDefault();
      addItem('ProductDetailsForm', '.product-main-image .slider-wrap img');

    });

    //add to cart for QuickView
    $("#addtocartQV").on('click', function (e) {  //.click(function(e){ //

      e.preventDefault();
      addItem('ProductDetailsFormQV', '#product-pop-up .product-main-image img');

    });

    //check empty for top-cart...
    check_topcart_empty();

    //change qty...
    $('.product-quantity input.quantity').on('change', function () {
      var $qty = parseInt($(this).val());
      if ($qty <= 0) {
        $(this).parents('[class^="product-page"]').find('[id^="addtocart"]').addClass('disabled');
      }
      else {
        $(this).parents('[class^="product-page"]').find('[id^="addtocart"]').removeClass('disabled');
      }
    });

  });
  // >>>>>> product END
</script>
<div id="wrapper" class="clearfix"> <!-- style="animation-duration: 1.5s; opacity: 1;"-->
  <!-- Top Bar
============================================= -->
  <div id="top-bar" class="">
    <div class="container clearfix">
      <div class="col_half nobottommargin hidden-xs hidden-sm">
        <p class="nobottommargin">
          <strong><a href='tel:{CONF.hotline}'><i class='icon-phone3'></i> {CONF.hotline}</a> </strong>
          <strong><a href='mailto:{CONF.email}'><i class='icon-email3'></i>{CONF.email}</a> </strong>
        </p>
      </div>

      <div class="col_half col_last fright nobottommargin top_link_wrapper">

        <!-- Top Links
============================================= -->
        <div class="top-link">
          <nav id="primary-menu">
          {data.list_menu_top}
            <div class="clear"></div>
            </nav>
        </div>
        <!-- .top-links end -->

      </div>

    </div>

  </div>
  <!-- #top-bar end -->

  <!-- Header
============================================= -->
  <header id="header" class='full-header'>

    <div id="header-wrap">

      <div class="container clearfix">

        <!--<div id="primary-menu-trigger"><i class="icon-reorder"></i></div>-->

        <!-- Logo
============================================= -->

        <div id="logo" class='col-md-3'>
          <a href="index.htm"  class="standard-logo"><img
                    src="{DIR_IMAGE}template/logo.png-1450838787703.png"
                    alt="The Company"></a>
          <a href="index.htm"  class="retina-logo"><img
                    src="{DIR_IMAGE}template/logo.png-1450838787703.png"
                    alt="The Company"></a>
        </div>
        <!-- #logo end -->

        <!-- Top Search
============================================= -->
        <!-- Primary Navigation
============================================= -->


        <nav id="primary-menu">
          {data.list_menu}
          <!-- Top Cart
      ============================================= -->
          <div id="top-cart" class='top-cart-block'>
            <a href="javascript:if(confirm(%27http://the-company.bizwebvietnam.net/cart  \n\nThis file was not retrieved by Teleport Pro, because it is addressed on a path excluded by the site\%27s Robot Exclusion parameters.  (Teleport Pro\%27s compliance with this system is optional; see the Project Properties, Netiquette page.)  \n\nDo you want to open it from the server?%27))window.location=%27http://the-company.bizwebvietnam.net/cart%27"
               id="top-cart-trigger"><i
                      class="icon-shopping-cart"></i><span>0</span></a>

            <div class="top-cart-content">
              <div class="top-cart-title">
                <h4>Giỏ hàng</h4>
              </div>
              <div class="top-cart-items">

              </div>
              <div class="top-cart-action clearfix">
                <span class="fleft top-checkout-price">0&#8363;</span>
                <input type="hidden" class="top_cart_total_price_not_format" value="0"/>
                <button onclick='window.location.href="http://the-company.bizwebvietnam.net/cart"'
                        class="button button-small nomargin fright">Xem giỏ hàng
                </button>
              </div>

            </div>
          </div>
          <!-- #top-cart end -->

          <!-- Top Search
      ============================================= -->
          {data.box_search}
          <!-- #top-search end -->
        </nav>
        <!-- top link trigger --->
        <a href='#' id='top_link_trigger' class='hidden-lg hidden-md'><i class='icon-ellipsis-vertical'></i></a>
        <!-- end top link trigger --->
        <script type="text/javascript">
          $("#sidebar-wrapper ul li a span").click(function (event) {
            event.preventDefault();
            var li = $(this).parents('li');
            li.children('ul').toggle('slow');
          });
        </script>
        <!-- #primary-menu end -->

      </div>

    </div>

  </header>
  <!-- #header end -->

  <!-- Content
============================================= -->
  <!-- Slider -->

  <section id="slider" class="slider-parallax swiper_wrapper clearfix">
    <!--
#################################
- THEMEPUNCH BANNER -
#################################
-->
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

    <!-- END REVOLUTION SLIDER -->

  </section>  <!-- end slider -->
  <section id="content">
    <!-- BEGIN: container_m_c -->
    <div class="wrapper">
      <div id="container">
        <div id="content">{PAGE_CONTENT}</div>
        <div class="clear"></div>
      </div>
      <div class="clear"></div>
    </div>
    <!-- END: container_m_c -->
    <!-- BEGIN: container_c_m -->
    <div class="wrapper">
      <div id="container">
        <div id="column_left">{PAGE_COLUMN_LEFT}</div>
        <div id="content">{PAGE_CONTENT}</div>
        <div class="clear"></div>
      </div>
      <div class="clear"></div>
    </div>
    <!-- END: container_c_m -->
    <!-- BEGIN: container_c_m_c -->
    <div class="wrapper">
      <div id="container">
        <div id="column_left">{PAGE_COLUMN_LEFT}</div>
        <div id="content">{PAGE_CONTENT}</div>
        <div id="column">{PAGE_COLUMN}</div>
        <div class="clear"></div>
      </div>
      <div class="clear"></div>
    </div>
    <!-- END: container_c_m_c -->
    <!-- BEGIN: container_m -->
    <div class="wrapper">
      <div id="container">
        {PAGE_CONTENT}
        <div class="clear"></div>
      </div>
      <div class="clear"></div>
    </div>
    <!-- END: container_m -->
    <!-- BEGIN: container_full -->
    <div id="container">
      {PAGE_CONTENT}
      <div class="clear"></div>
    </div>
    <div class="clear"></div>
    <!-- END: container_full -->
  </section>
  <!-- Footer
============================================= -->
  <footer id="footer" class='dark'>

    <div class="container">

      <!-- Footer Widgets
  ============================================= -->
      <div class="footer-widgets-wrap clearfix">

        <div class="col_two_third">

          <div class="col_one_third prefooter_one">

            <div class="widget clearfix">

              <h4>Văn phòng chính</h4>

              <p>

              <p>Chúng tôi tin chất lượng là dịch vụ tốt nhất.</p>

              Địa chỉ: <br/>
              61/2 Quang Trung, P.10 <br/>
              Q. Gò Vấp, TP. HCM<br/>
              Phone: (91) 8547 632521<br/>
              Fax: (91) 11 4752 1433<br/>
              Email: hi@Bizweb.com<br/>
              Skype: egany.com</p>


            </div>

          </div>

          <div class="col_one_third prefooter_one">

            <div class="widget widget_links clearfix">

              <h4>Thông tin</h4>

              <ul>

                <li><a href="huong-dan-thanh-toan.htm">Hướng dẫn
                    thanh toán</a></li>

                <li><a href="cac-doi-tac-cua-chung-toi.htm">Đối
                    tác</a></li>

                <li><a href="chinh-sach-rieng-tu.htm">Chính sách
                    riêng tư</a></li>

                <li><a href="giao-nhan-hang.htm">Giao nhận hàng</a>
                </li>

                <li><a href="du-an-1.htm">Dự
                    án</a></li>

                <li><a href="tin-tuc.htm" >Tin
                    tức</a></li>

                <li><a href="lien-he.htm" >Liên
                    hệ</a></li>

                <li><a href="tuyen-dung-1.htm">Tuyển dụng</a></li>


              </ul>

            </div>
            <div class='marginbottom hidden-lg hidden-md hidden-sm'>

            </div>
          </div>

          <div class="col_one_third col_last prefooter_one">

            <div class="widget clearfix">
              <h4>Bài viết mới nhất</h4>

              <div id="post-list-footer">


                <div class="spost clearfix">
                  <div class="entry-c">
                    <div class="entry-title">
                      <h4><a href="thiet-ke-khu-bep-sang-trong-am-cung.htm">Thiết
                          kế khu bếp sang trọng, ấm cúng</a></h4>
                    </div>
                    <ul class="entry-meta">
                      <li>Ngày đăng 01/12/2015</li>
                    </ul>
                  </div>
                </div>

                <div class="spost clearfix">
                  <div class="entry-c">
                    <div class="entry-title">
                      <h4><a href="cac-chung-cu-thiet-ke-dep-la-khien-nhieu-nguoi-me.htm">Các
                          chung cư thiết kế đẹp lạ khiến nhiều người mê</a></h4>
                    </div>
                    <ul class="entry-meta">
                      <li>Ngày đăng 28/11/2015</li>
                    </ul>
                  </div>
                </div>

                <div class="spost clearfix">
                  <div class="entry-c">
                    <div class="entry-title">
                      <h4><a href="nha-ong-50-m2-co-cach-bo-tri-dao-nguoc.htm">Nhà
                          ống 50 m2 có cách bố trí đảo ngược</a></h4>
                    </div>
                    <ul class="entry-meta">
                      <li>Ngày đăng 28/11/2015</li>
                    </ul>
                  </div>
                </div>


              </div>
            </div>
            <div class='marginbottom hidden-lg hidden-md hidden-sm'>

            </div>
          </div>

        </div>

        <div class="col_one_third col_last">
          <div class="widget clearfix">

            <h4>Facebook</h4>
            <div class="fb-page" data-href="https://www.facebook.com/facebook" data-tabs="timeline" data-width="300" data-height="214" data-small-header="false" data-adapt-container-width="false" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/facebook"><a href="https://www.facebook.com/facebook">Facebook</a></blockquote></div></div>
          </div>

        </div>

      </div>
      <!-- .footer-widgets-wrap end -->
    </div>

    <!-- Copyrights
============================================= -->
    <div id="copyrights">

      <div class="container clearfix">

        <div class="col_half">
          Bản quyền thuộc về
          <div class="copyright-links">
          </div>
        </div>

        <div class="col_half col_last tright">
          <div class="fright clearfix">
            <div style='float:right;'>
              <a href="#" class="social-icon si-small si-borderless si-facebook">
                <i class="icon-facebook"></i>
                <i class="icon-facebook"></i>
              </a>


              <a href="#" class="social-icon si-small si-borderless si-twitter">
              <i class="icon-twitter"></i>
              <i class="icon-twitter"></i>
              </a>


              <a href="#" class="social-icon si-small si-borderless si-gplus">
              <i class="icon-gplus"></i>
              <i class="icon-gplus"></i>
              </a>


              <a href="#" class="social-icon si-small si-borderless si-pinterest">
              <i class="icon-pinterest"></i>
              <i class="icon-pinterest"></i>
              </a>


              <a href="#" class="social-icon si-small si-borderless si-vimeo">
              <i class="icon-vimeo"></i>
              <i class="icon-vimeo"></i>
              </a>


              <a href="#" class="social-icon si-small si-borderless si-github">
              <i class="icon-github"></i>
              <i class="icon-github"></i>
              </a>


              <a href="#" class="social-icon si-small si-borderless si-yahoo">
              <i class="icon-yahoo"></i>
              <i class="icon-yahoo"></i>
              </a>


              <a href="#" class="social-icon si-small si-borderless si-linkedin">
              <i class="icon-linkedin"></i>
              <i class="icon-linkedin"></i>
              </a>

            </div>
          </div>
          <div class="clear"></div>

          EGANY Co.Ltd - 61/2 Quang Trung, Q. Gò Vấp, Tp.HCM | Email: hello@egany.com
        </div>

      </div>

    </div>
    <!-- #copyrights end -->

  </footer>
  <!-- #footer end -->
  </div>
<!-- Go To Top
============================================= -->
<div id="gotoTop" class="icon-angle-up"></div>

<!-- Footer Scripts
============================================= -->
<script src="{DIR_JS}template/functions.js" type='text/javascript'></script>

<!-- quick add cart -->
<div id='product-pop-up' style="display:none;" class="single-product shop-quick-view-ajax clearfix">

  <div class="ajax-modal-title">
    <a href='#'><h2>Pink Printed Dress</h2></a>
  </div>

  <div class="product-page product modal-padding clearfix">
    <div class="col_half nobottommargin">
      <div class="product-image">
        <div class="product-main-image">
          <ul class="pgwSlideshow">

          </ul>
        </div>

        <div class="sale-flash">Sale!</div>
      </div>
    </div>
    <div class="col_half nobottommargin col_last product-desc">
      <div class="product-price">
        <del>$39.99</del>
        <ins>$24.99</ins>
      </div>

      <div class="clear"></div>
      <div class="line"></div>
      <!-- variants -->
      <div class="product-page-options ">
        <div class="sizePicker">
          <label class="control-label options-title">Kích thước:</label>

          <div class='options-selection'>
            <select class="form-control input-sm size"></select>
          </div>
        </div>
        <div class="sizePicker">
          <label class="control-label options-title">Màu sắc:</label>

          <div class='options-selection'>
            <select class="form-control input-sm color" style='color:#555!important;'></select>
          </div>
        </div>
        <div class="sizePicker">
          <label class="control-label options-title">Chất liệu:</label>

          <div class='options-selection'>
            <select class="form-control input-sm material"></select>
          </div>
        </div>
      </div>
      <!-- end variant -->
      <!-- Product Single - Quantity & Cart Button
============================================= -->
      <form id='ProductDetailsFormQV' class="cart nobottommargin clearfix">
        <div class="quantity product-quantity clearfix col-md-12" style='margin-bottom: 20px;'>
          <input type="button" value="-" class="minus">
          <input type="text" class='qty' id='product_quantity' readonly step="1" min="1" name="quantity"
                 value="1" title="Qty" class="qty" size="4"/>
          <input type="button" value="+" class="plus">
        </div>
        <div class="hidden" style="">
          <select id="product-select-qw" name="variantId">
          </select>

          <input type="hidden" class="unit_price_not_formated" value="">
          <input type="hidden" class="product_url" value="">
          <input type="hidden" class="product_title_hd" value="">
          <input type="hidden" class="product_img_small" value="">
        </div>
        <a class='button view_detail' href='#'>Xem chi tiết</a>
        <button type="submit" id='addtocartQV' class="add-to-cart button nomargin">Add to cart</button>
      </form>
      <!-- Product Single - Quantity & Cart Button End -->

      <div class="clear"></div>
      <div class="line"></div>
      <p class="description">Libero velit id eaque ex quae laboriosam nulla optio doloribus! Perspiciatis, libero,
        neque, perferendis at nisi optio dolor!</p>
    </div>
  </div>
</div>


<script src="{DIR_JS}template/layout.js" type='text/javascript'></script>
<script type="text/javascript">
  jQuery(document).ready(function () {
    Layout.init();
    Layout.initOWL();

    //LayersliderInit.initLayerSlider();
    //Layout.initImageZoom();
    //Layout.initTouchspin();
    //Layout.initTwitter();

    Layout.initFixHeaderWithPreHeader();
    Layout.initNavScrolling();
  });
</script>
<script src="{DIR_JS}template/footer_scripts.js" type='text/javascript'></script>

<script language="javascript">
		jQuery(document).ready(function(){
			loadpage();
		});
  </script>
</body>
</html>
<!-- END: body -->

<!-- BEGIN: main_slide -->
<div id="main_slide">
  <div id="owl-main_slide" class="owl-carousel">  	
    <!-- BEGIN: row -->
    <div class="item">
    	<a href="{row.link}" target="{row.target}" {row.class}>
        {row.content}
      </a>
    </div>
    <!-- END: row -->
  </div>
</div>
<script type="text/javascript" language="javascript">
	jQuery(document).ready(function($){
		$("#owl-main_slide").owlCarousel({
			pagination : false,
			navigation : false,
			singleItem : true,
			autoPlay : true,
      stopOnHover : true
		});
	});
</script>
<!-- END: main_slide -->

<!-- BEGIN: bank_scroll -->
<div id="bank_scroll">
	<div class="bank_scroll-title">{LANG.global.footer_bank}</div>
  <div id="owl-bank_scroll" class="owl-carousel">  	
    <!-- BEGIN: row -->
    <div class="item">
    	<a href="{row.link}" target="{row.target}" {row.class}>
        {row.content}
      </a>
    </div>
    <!-- END: row -->
  </div>
  <div class="clear"></div>
</div>
<script type="text/javascript" language="javascript">
	jQuery(document).ready(function($){
		$("#owl-bank_scroll").owlCarousel({
			pagination : false,
			navigation : false,
			autoPlay : true,
			items : 5,
			itemsDesktop : [1000,5],
			itemsDesktopSmall : [900,5],
			itemsTablet: [350,4],
			itemsMobile : [250,3],
      stopOnHover : true
		});
	});
</script>
<!-- END: bank_scroll -->

<!-- BEGIN: menu_product -->
<div class="box_menu_product">
	<div class="tt_box">{box.title}</div>
	<ul class="list_item">
	<!-- BEGIN: row -->
		<li class="item">
			<a href="{row.link}" title="{row.title}" class="{row.current}">
				{row.title}
			</a>
		</li>
		{row.line}
	<!-- END: row -->
	</ul>
</div>
<!-- END: menu_product -->

<!-- BEGIN: scroll_right_gallery -->
<div id="scroll-right-gallery">
  <div id="owl-right-gallery" class="owl-carousel">  	
    <!-- BEGIN: row -->
    <div class="item">
    	<a href="{row.content_popup}" class="fancybox-effects-a">
        {row.content}
      </a>
    </div>
    <!-- END: row -->
  </div>
</div>
<script type="text/javascript" language="javascript">
	jQuery(document).ready(function($){
		$("#owl-right-gallery").owlCarousel({
			pagination : false,
			navigation : true,
			singleItem : true,
			autoPlay : true,
      stopOnHover : true
		});
	});
</script>
<!-- END: scroll_right_gallery -->

<!-- BEGIN: news_slide -->
<ul class="slider">
  <!-- BEGIN: row -->
  <li>
  	<div style="{row.style}">
    	<h3><a href="{row.link}">{row.title}</a></h3>
    	{row.content}
    </div>
  </li>
  <!-- END: row -->
</ul>
<script type="text/javascript" language="javascript">
	jQuery(document).ready(function($){
		$('.news_slide .slider').bxSlider({
			controls:	true,
			pager:false,
			auto:	true,
			mode:	'fade',
			speed:	800
		});
	});
</script>
<!-- END: news_slide -->

<!-- BEGIN: box_lang -->
<div id="box_lang">
	<ul>
  	<!-- BEGIN: row -->
    <li><a href="{row.link}" class="flag_{row.name} {row.current}">&nbsp;</a></li>
    <!-- END: row -->
  </ul>
</div>
<!-- END: box_lang -->


<!-- BEGIN: header_user --> 
<div class="header_user">
	
	<ul class="list_none">
    <!-- BEGIN: is_login --> 
    <li><a href="javascript:void(0);" onclick="ttHUser.signout('')">{LANG.global.header_signout}</a></li>
  	<li class="mid">|</li>
    <li id="header_account">
    	<a href="{data.link_user}">Chào bạn {row.nickname}</a>
    </li>
    <!-- END: is_login -->
    <!-- BEGIN: not_login --> 
		
    <li id="header_signup">
			<a href="#header_signin_form" class="fancybox-effects-a">{LANG.global.header_signin}</a>
			<div id="header_signin_form">
				{row.header_signin}
			</div>
			
		</li>
  	<li class="mid">|</li>
    <li id="header_signin">
			<a href="#header_signup_form" class="fancybox-effects-a">{LANG.global.header_signup}</a>
			<div id="header_signup_form">
				{row.header_signup}
			</div>
		</li>
		
		
    <!-- END: not_login -->
		<li class="clear"></li>
  </ul>
  <div class="clear"></div>
</div>
<!-- END: header_user -->


<!-- BEGIN: header_user1 --> 
<div class="header_user">
	<ul class="list_none">
    <!-- BEGIN: is_login --> 
    <li><a href="javascript:void(0);" onclick="ttHUser.signout('')">{LANG.global.header_signout}</a></li>
  	<li class="mid">|</li>
    <li id="header_account">
    	<a href="{data.link_user}">{LANG.global.my_account}</a>
      <ul class="list_none">
      	<li><a href="{row.user.link}">{row.user.title}</a></li>
      	<li><a href="{row.change_pass.link}">{row.change_pass.title}</a></li>
      	<li><a href="{row.signout.link}" {row.signout.attr_link}>{row.signout.title}</a></li>
      </ul>
    </li>
    <!-- END: is_login -->
    <!-- BEGIN: not_login --> 
    <li><a href="{data.link_user}">{LANG.global.header_signin}</a></li>
  	<li class="mid">|</li>
    <li><a href="{data.link_user}">{LANG.global.my_account}</a></li>
    <!-- END: not_login -->
  </ul>
  <div class="clear"></div>
</div>
<!-- END: header_user1 -->

<!-- BEGIN: header_cart --> 
<div class="header_cart">
	<ul class="list_none">
	  	<li class="cart-item">
        	<a id="header_cart" href="{data.link_cart}" class="fancybox-iframe">(<span class="num_cart">0<script language="javascript">header_cart();</script></span>)</a>
        </li>
  </ul>
</div>
<!-- END: header_cart -->

<!-- BEGIN: header_cart1 --> 
<div class="header_cart">
	<ul class="list_none">
  	<li class="cart-item"><a href="{data.link_cart}">{LANG.global.items}</a></li>
  	<li class="mid">|</li>
  	<li><a href="{data.link_cart}">{LANG.global.basket}</a></li>
  	<li class="mid">|</li>
  </ul>
</div>
<!-- END: header_cart1 -->

<!-- BEGIN: header_cart_old --> 
<a id="header_cart" href="{data.link_cart}">(<span class="num_cart">0<script language="javascript">header_cart();</script></span>)</a>
<!-- END: header_cart_old -->

<!-- BEGIN: menu_main_sub -->
<div class="sf-mega">
  <!-- BEGIN: menu_sub -->
  <div class="sf-mega-section">
    <h2><a href="{row.link}" target="{row.target}" {row.class}>{row.title}</a></h2>
    <ul class="list_none">
      <!-- BEGIN: row -->
      <li {col.class_li}><a href="{col.link}" target="{col.target}" {col.class}>{col.title}</a></li>
      <!-- END: row -->
    </ul>
  </div>
  <!-- END: menu_sub -->
</div>
<!-- END: menu_main_sub -->

<!-- BEGIN: menu_main -->
<ul class="list_none sf-menu {data.class}" {data.ul_ext}>
	<!-- BEGIN: item -->
  <li class="menu_li {row.class_li}" {row.attr_menu_li}><a href="{row.link}" target="{row.target}"  class="menu_link css_bo {row.class}">{row.title}</a>
  	{row.menu_sub}
  </li>
  <!-- END: item -->
</ul>
<!-- END: menu_main -->

<!-- BEGIN: menu -->

<ul>
  <!-- BEGIN: item -->
  <li class=""><a href="{row.link}" target="{row.target}"  class="menu">{row.title}</a>
    {row.menu_sub}
    <!-- BEGIN: menu_sub -->
    <ul>
      {row.content}
      <!-- BEGIN: row -->
      <li class=""><a href="{row.link}" target="{row.target}" class="sub-menu">
          <div>{row.title}</div></a>{row.menu_sub}
      </li>
      <!-- END: row -->
    </ul>
    <!-- END: menu_sub -->
  </li>
  <!-- END: item -->

</ul>
<!-- END: menu -->


<!-- BEGIN: menu1 -->
<ul class="list_none {data.class}" {data.ul_ext}>
	<!-- BEGIN: item -->
  <li class="menu_li {row.class_li}"><a href="{row.link}" target="{row.target}"  class="menu_link css_bo {row.class}">{row.title}</a>
  	{row.menu_sub}
  	<!-- BEGIN: menu_sub -->
    <ul class="list_none">
      {row.content}
      <!-- BEGIN: row -->
      <li class="{row.class_li}"><a href="{row.link}" target="{row.target}" {row.class}><span>{row.title}</span></a>{row.menu_sub}</li>
      <!-- END: row -->
    </ul>
    <!-- END: menu_sub -->
  </li>
  <!-- END: item -->
</ul>
<!-- END: menu1 -->

<!-- BEGIN: menu_footer -->
<!-- BEGIN: item -->
<div class="col col_25 footer-menu">
  <h2><a href="{row.link}" target="{row.target}" {row.class}><span>{row.title}</span></a></h2>
  {row.menu_sub}
  <!-- BEGIN: menu_sub -->
  <ul class="list_none">
    {row.content}
    <!-- BEGIN: row -->
    <li {row.class_li}><a href="{row.link}" target="{row.target}" {row.class}><span>{row.title}</span></a>{row.menu_sub}</li>
    <!-- END: row -->
  </ul>
  <!-- END: menu_sub -->
</div>
<!-- END: item -->
<!-- END: menu_footer -->

<!-- BEGIN: footer_contact --> 
<div class="footer_contact">
	<!-- BEGIN: row --> 
  <div class="footer_contact-detail css_bo">
    <div class="contact_short">{row.short}</div>
    <div class="contact_map">
      <div id="footer_map_view_{row.map_id}" class="map_view"></div>
      {row.contact_map}
    </div>
  </div>
  <!-- END: row -->
  <div class="clear"></div>
</div>
<!-- END: footer_contact -->

<!-- BEGIN: popup --><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>{CONF.meta_title}</title>

    <link rel="stylesheet" href="{DIR_JS}jquery_ui/themes/base/ui.all.css">
    <link href="{DIR_JS}jalert/css/jquery.alerts.css" rel="stylesheet">
    <link href="{DIR_CSS}global/popup.css" rel="stylesheet">
  
    <script type="text/javascript" language="javascript" >
      var ROOT = "{CONF.rooturl}";
      var DIR_IMAGE = "{DIR_IMAGE}";
      var lang = "{CONF.lang_cur}";
      var lang_js = new Array();
      {LANG_JS}
    </script>
    <script type="text/javascript" src="{DIR_JS}jquery-1.10.2.js"></script>
    <script type="text/javascript" src="{DIR_JS}jquery_ui/jquery-ui.js"></script>
    <script type="text/javascript" src="{DIR_JS}jquery_plugins/jquery.validate.js"></script>
    <script type="text/javascript" src="{DIR_JS}auto_numeric/autoNumeric.js"></script>
    <script type="text/javascript" src="{DIR_JS}jalert/js/jquery.alerts.js"></script>
    <script type="text/javascript" src="{DIR_JS}javascript.js"></script>
    {CONF.include_js}
    {CONF.include_css}
    {CONF.include_js_content}
    
    <!--[if lt IE 9]>
			<style>
        .css_bo {behavior: url({DIR_JS}PIE.htc);} 
      </style>      
    <![endif]-->
  </head>

  <body>
  	<div id="popup">{PAGE_CONTENT}</div>
    <div id="tth-loading"></div>
    <script type="text/javascript" language="javascript">
    	jQuery(document).ready(function(){
				header_account();
				auto_rate_exchange();
			});
    </script>
	</body>
</html>
<!-- END: popup -->