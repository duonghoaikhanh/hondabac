<!-- BEGIN: main -->



<section id="content">

  <div class="content-wrap">


    <div class="container" style="padding:0px">
      <h2 class="h2_news">{LANG.home.label_news}</h2>
      <div class="list_news_home">
        {data.list_home_news}
      </div>

      <div class="load_more_news">
        <a href="javascript:void(0)" id="load_more" onclick="load_more_news()">{LANG.home.load_more_news}</a>
        <input type="hidden" id='start' value="6">
      </div>
      
    </div>

    <div class="container" style="padding:0px">
      <h2 class="h2_news h2_news_diff">{LANG.home.news_other}</h2>
      {data.group_news_focus}
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



<!-- BEGIN: page_news_focus -->

<div class="container clearfix">

  <div class="list_news_group">

    <!-- BEGIN: row -->

    <div class="col_one_third nobottommargin {row.last}">

      <div class="feature-box media-box">



        <div class="fbox-media">

          <a href='{row.link}'>

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

  </div>

</div>

<!-- END: page_news_focus -->







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