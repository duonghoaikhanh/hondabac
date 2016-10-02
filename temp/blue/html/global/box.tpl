<!-- BEGIN: box_main -->

<section id="page-title">

  <div class="container clearfix">

    <h1 class="col-md-6 col-sm-6">{data.title}</h1><br>

    {data.navigation}

  </div>

</section>

<section id="content">

  <div class="content-wrap">

    <div class="container clearfix">

      <div class="postcontent nobottommargin clearfix">

        <div class="box_mid css_bo">

          <div class="box_mid-title">

            <div class="mid_title-line"></div>



            <span class="hide"><h1 class="mid_title_l">{data.title}</h1></span>

            <div class="mid_title_r">{data.more_title}</div>

            <div class="clear"></div>

          </div>

          <div class="box_mid-content">{data.content}</div>

        </div>





      </div><!-- .postcontent end -->





      <!-- Sidebar

============================================= -->

      <div class="sidebar nobottommargin col_last clearfix">

        <div class="sidebar-widgets-wrap">



          {data.box_column}



        </div>



      </div>

      <!-- .sidebar end -->



    </div>



  </div>



</section>

<!-- END: box_main -->


<!-- BEGIN: comment -->
<div class="container clearfix" id="comment">

  <h3>{LANG.comment} ({data.total_comment})</h3>
  <!-- BEGIN: row -->
    <div class="item_comment {row.end}">
      <div class="cm_content">
        {row.content}
      </div>
      <div class="author_info">
        <strong>{row.full_name}</strong>
        -
        {row.date_create}
        <a href="javascript:void(0);" class="show_reply_c">{row.LANG.reply}</a>
        
      </div>
      <div class="list_comment_c">
      <!-- BEGIN: row_c -->
        <div class="item_c">
          {row_c.content}
          <div class="author_info">
          <strong>{row_c.full_name}</strong>
          -
          {row_c.date_create}
        </div>
        </div>
      <!-- END: row_c -->
      <div class="reply_c">
          <form method="post" id="reply_c">
            <textarea placeholder="{row.LANG.y_kien_cua_ban}" style='width: 100%;height: 80px;max-width: 100%' class="content_comment"></textarea>
            <input type="button" class="send_comment" value="{row.LANG.send_comment}" onclick="send_comment('reply_c',this)">
            <input type="hidden" name="parent" value="{row.id}">
            <div class="clear"></div>
          </form>
      </div>
      </div>
      
    </div>
  <!-- END: row -->
  <div class="reply">
    <form method="post" id="reply">
      <textarea placeholder="{LANG.y_kien_cua_ban}" style='width: 100%;height: 80px;max-width: 100%' class="content_comment"></textarea>
      <input type="button" class="send_comment" value="{LANG.send_comment}" onclick="send_comment('reply',this)">
      <input type="hidden" name="parent" value="0">
      <input type="hidden" name="tb" value="{data.table}">
      <input type="hidden" name="tb_id" value="{data.table_id}">
      <div class="infor_customer ">
          <table>
            <tr>
              <td>
                <div class="content_info_comment">
                  <h3>
                    {LANG.title_box}
                    <span class="btn_close" onclick="close_info_customer()"><img src="{data.img_close}"></span>
                  </h3>
                  <input type="text" name="email" id="email" placeholder="{LANG.please_enter_email}" style="width: 100%;margin-bottom: 10px;">
                  <div class="error_notifi err_email"></div>
                  <input type="text" name="full_name" id="full_name" placeholder="{LANG.please_full_name}" style="width: 100%;margin-bottom: 10px;">
                  <div class="error_notifi err_name"></div>
                  <input type="button" class="info_done" onclick="add_info()" value="{LANG.info_done}">
                </div>
              </td>
            </tr>
          </table>
      </div>
      <div class="clear"></div>
    </form>
  </div>

</div>
<!-- END: comment -->

<!-- END: box_main -->

<!-- BEGIN: list_home_news -->
    <!-- BEGIN: item -->
    <div class="col_left">
          <div class="media_wrapper">
            <a href="{item.link}"
               rel="bookmark">
               <img src="{item.picture}" class="aligncenter" alt="{item.title}" title="{item.title}"></a>
          </div>
          <div class="postteaser">
            <h2 class="posttitle">
              <a href="{item.link}" rel="bookmark"
                 title="{item.title}">{item.title}</a>
            </h2>
            <p>{item.short}</p>
            <a href="{item.link}" class="readmore" rel="bookmark" title="{item.title}">Xem thêm</a>
          </div>
      </div>
    <!-- END: item -->
    <div class="clear"></div>
    
<!-- END: list_home_news -->

<!-- BEGIN: list_home_news_focus -->
  <!-- BEGIN: item -->
  <div class="col_left">
    <div class="media_wrapper">
      <a href="{item.link}"
         rel="bookmark">
        <img src="{item.picture}" class="aligncenter" alt="{item.title}" title="{item.title}"></a>
    </div>
    <div class="postteaser">
      <h2 class="posttitle">
        <a href="{item.link}" rel="bookmark"
           title="{item.title}">{item.title}</a>
      </h2>
      <p>{item.short}</p>
      <a href="{item.link}" class="readmore" rel="bookmark" title="{item.title}">Xem thêm</a>
    </div>
  </div>
  <!-- END: item -->
<div class="clear"></div>

<!-- END: list_home_news_focus -->



<!-- BEGIN: box_main_focus -->

<div class="box_mid css_bo">

  <div class="box_mid-title">

    <div class="mid_title-line"></div>

    <span><h1 class="mid_title_l">{data.title}</h1></span>

    <div class="mid_title_r">{data.more_title}</div>

    <div class="clear"></div>

  </div>

  <div class="box_mid-content">{data.content}</div>

</div>

<!-- END: box_main_focus -->


<!-- BEGIN: newsest -->
  <ul style="list-style:none">
  <!-- BEGIN: row -->
    <li>
      <div class="img_mar">
        <a href="{item.link}" title="{item.title}"><img src="{item.picture}" alt="{item.title}"></a>
      </div>
      <div class="title_mar">
        <a href="{item.link}" title="{item.title}">{item.title}</a>
      </div>
      <div class="clear"></div>
    </li>
  <!-- END: row -->
  </ul>
<!-- END: newsest -->



<!-- BEGIN: box_mid -->

<div class="box_mid">

	<div class="box_mid-title">

  	<div class="mid_title-line"></div>

  	<span><h2 class="mid_title_l">{data.title}</h2></span>

    <div class="mid_title_r">{data.more_title}</div>

    <div class="clear"></div>

  </div>

  <div class="box_mid-content">{data.content}</div>

</div>

<!-- END: box_mid -->



<!-- BEGIN: box -->

<div class="box bo_css {data.class_box}">

	<div class="box-title">

  	<div class="box-title-icon"></div>

    <div class="box-titleb">{data.title}</div>

  </div>

  <div class="box-content">{data.content}</div>

</div>

<!-- END: box -->



<!-- BEGIN: box_notitle -->

<div class="box bo_css {data.class_box}">

  <div class="box-content">{data.content}</div>

</div>

<!-- END: box_notitle -->



<!-- BEGIN: box_menu -->

<div class="box_menu">

	<div class="box_menu-title">

  	<div class="box_menu-title-icon"></div>

    <div class="box_menu-titleb">{data.title}</div>

  </div>

  <div class="box-content">

    <!-- BEGIN: menu_sub -->

    <ul class="list_none">

      {data.content}

      <!-- BEGIN: row -->

      <li {row.class_li}><a href="{row.link}" {row.class} {row.attr_link}>{row.title}</a>{row.menu_sub}</li>

      <!-- END: row -->

    </ul>

    <!-- END: menu_sub -->

  </div>

</div>

<!-- END: box_menu -->



<!-- BEGIN: box_search -->

<div id="top-search" class='hidden-xs hidden-sm'>

  <a href="#" id="top-search-trigger"><i class="icon-search3"></i><i class="icon-line-cross"></i></a>

  <form action="{data.link_search}" method="post">

    <input name="search" value="1" type="hidden" />

    <input type="text" name="text_search" class="form-control" placeholder="{LANG.global.search_text}">

  </form>

</div>

<!-- END: box_search -->

<!-- BEGIN: box_search_sm -->

<div id="top-search-sm">

  <!--<a href="#" id="top-search-trigger"><i class="icon-search3"></i><i class="icon-line-cross"></i></a>-->

  <form action="{data.link_search}" method="post">

    <input name="search" value="1" type="hidden" />

    <input type="text" name="text_search" class="form-control" placeholder="{LANG.global.search_text}">

  </form>

</div>

<!-- END: box_search_sm -->



<!-- BEGIN: box_search1 -->

<div class="box_search">

  <form action="{data.link_search}" method="post">

    <input name="text_search" class="text_search" type="text" value="{data.text_search}" onBlur="if(this.value=='') this.value='{LANG.global.search_text}';" onFocus="if(this.value=='{LANG.global.search_text}') this.value='';">

    <input name="search" value="1" type="hidden" />

    <input class="btn_search" type="image" src="{DIR_IMAGE}btn_search.png" value="{LANG.global.search_btn}" />

    <div class="clear"></div>

  </form>

</div>

<!-- END: box_search1 -->



<!-- BEGIN: main_search -->

<div class="main_search">

	<h1 class="main_search-title">{data.title}</h1>

  <div class="main_search-content">

    <form action="{data.link_search}" method="post">

      <div>

        <input id="text_search" name="text_search" class="text_search" type="text" value="{data.text_search}" onBlur="if(this.value=='') this.value='{LANG.global.search_text}';" onFocus="if(this.value=='{LANG.global.search_text}') this.value='';">

      </div>

      <input name="search" value="1" type="hidden" />

      <input class="btn_search" type="image" src="{DIR_IMAGE}btn_search.png" value="{LANG.global.search_btn}" />

    </form>

  </div>

  <script language="javascript">

		$('.main_search .main_search-content').css({'padding-left':$('.main_search .main_search-title').width()+40});

	</script>

</div>

<!-- END: main_search -->



<!-- BEGIN: mid_search -->

<div class="main_search">

	<h2 class="main_search-title">{data.title}</h2>

  <div class="main_search-content">

    <form action="{data.link_search}" method="post">

      <div>

        <input id="text_search" name="text_search" class="text_search" type="text" value="{data.text_search}" onBlur="if(this.value=='') this.value='{LANG.global.search_text}';" onFocus="if(this.value=='{LANG.global.search_text}') this.value='';">

      </div>

      <input name="search" value="1" type="hidden" />

      <input class="btn_search" type="image" src="{DIR_IMAGE}btn_search.png" value="{LANG.global.search_btn}" />

    </form>

  </div>

  <script language="javascript">

		$('.main_search .main_search-content').css({'padding-left':$('.main_search .main_search-title').width()+40});

	</script>

</div>

<!-- END: mid_search -->



<!-- BEGIN: box_support_old -->

<div class="box box_support">

	<div class="box-title">

  	<div class="box-title-icon"></div>

    <div class="box-titleb">{data.title}</div>

  </div>

  <div class="box-content">

  	<a href="javascript:void(0)" onClick="window.open('{data.link_support}','','toolbar=no, scrollbars=yes, resizable=no, top=100, left=200, width=300, height=400');" class="yahoo"><img src="{DIR_IMAGE}yahoo.png" alt="yahoo" /></a>

  	<a href="javascript:void(0)" onClick="window.open('{data.link_support}','','toolbar=no, scrollbars=yes, resizable=no, top=100, left=200, width=300, height=400');" class="skype"><img src="{DIR_IMAGE}skype.png" alt="skype" /></a>

    <img class="hotline" src="{DIR_IMAGE}hotline.gif" alt="08.6676.1688-08.6293.3336" />

  </div>

</div>

<!-- END: box_support_old -->



<!-- BEGIN: box_support1 -->

<div class="box_support">

	<div class="arrow"></div>

  <!-- BEGIN: row -->

  <div class="row">

    <!-- BEGIN: yahoo -->

    <div class="nick yahoo" data-nick="{row.yahoo}" nick_type="yahoo">

      <div><a class="pic" href="ymsgr:sendIM?{row.yahoo}"><img src='{DIR_IMAGE}icon_yahoo_on.png' alt="{row.yahoo}" /></a></div>

      <div><a class="title" href="ymsgr:sendIM?{row.yahoo}">{row.title}</a></div>

      <div class="clear"></div>

    </div>

    <!-- END: yahoo -->

    <!-- BEGIN: skype -->

    <div class="nick skype" data-nick="{row.skype}" nick_type="skype">

      <div><a class="pic" href="Skype:{row.skype}?chat"><img src="http://mystatus.skype.com/mediumicon/{row.skype}" alt="{row.skype}" height="16" /></a></div>

      <div><a class="title" href="Skype:{row.skype}?chat">{row.skype}</a></div>

      <div class="clear"></div>

    </div>

    <!-- END: skype -->

    <div class="clear"></div>

  </div>

  <!-- END: row -->



</div>

<!-- END: box_support1 -->



<!-- BEGIN: box_support2 -->

<div class="box_support">

  <div class="arrow"></div>

  <!-- BEGIN: row -->

  <div class="row">

    <!-- BEGIN: yahoo -->

    <div class="nick yahoo" data-nick="{row.yahoo}" nick_type="yahoo">

      <div><a class="pic" href="ymsgr:sendIM?{row.yahoo}"><img src='{DIR_IMAGE}icon_yahoo_on.png' alt="{row.yahoo}" /></a></div>

      <div><a class="title" href="ymsgr:sendIM?{row.yahoo}">{row.title}</a></div>

      <div class="clear"></div>

    </div>

    <!-- END: yahoo -->

    <!-- BEGIN: skype -->

    <div class="nick skype" data-nick="{row.skype}" nick_type="skype">

      <div><a class="pic" href="Skype:{row.skype}?chat">

          <img src="{DIR_IMAGE}h.png" alt="{row.skype}" height="16" />{row.skype}</a>

      </div>

      <div class="clear"></div>

    </div>

    <!-- END: skype -->

    <div class="clear"></div>

  </div>

  <!-- END: row -->



</div>

<!-- END: box_support2 -->





<!-- BEGIN: box_support -->

<div class="box_support">
  <div class="arrow"></div>
  <!-- BEGIN: row -->
  <div class="row">
    <!-- BEGIN: yahoo -->
    <div class="nick yahoo" data-nick="{row.yahoo}" nick_type="yahoo">
      <div><a class="pic" href="ymsgr:sendIM?{row.yahoo}"><img src='{DIR_IMAGE}icon_yahoo_on.png' alt="{row.yahoo}" /></a></div>
      <div><a class="title" href="ymsgr:sendIM?{row.yahoo}">{row.title}</a></div>
      <div class="clear"></div>
    </div>
    <!-- END: yahoo -->

    <!-- BEGIN: skype -->
    <p class="nobottommargin">
      <a href='tel:{row.phone}' class="a_phone"><i class='icon-phone3'></i> <strong>{row.phone}</strong></a>
      <a href='mailto:{row.email}' class="a_email"><i class='icon-email3'></i><strong>{row.email}</strong></a>
      <a class="pic a_skype" href="Skype:{row.skype}?chat"><img src="{DIR_IMAGE}h.png" alt="{row.skype}" height="16" />{row.skype}</a>
    </p>
    <!-- END: skype -->
    <div class="clear"></div>
  </div>

  <!-- END: row -->



</div>

<!-- END: box_support -->







<!-- BEGIN: box_category_product -->

<div class="widget widget_links clearfix">

  <h4>Danh mục sản phẩm</h4>

  <ul>

    <!-- BEGIN: group_level1 -->

    <li>

      <a href="{row.link}">{row.title}</a>

      <ul>

        <!-- BEGIN: group_level2 -->

          <li><a href="{row.link}">{row.title}</a></li>

        <!-- END: group_level2 -->

      </ul>

    </li>

    <!-- END: group_level1 -->

  </ul>

</div>





<!-- END: box_category_product -->





<!-- BEGIN: box_product_deal -->

<div class="widget clearfix">



  <!-- BEGIN: row -->

  <h4>{row.title}</h4>



  <div id="post-list-footer">

    <!-- BEGIN: row_c -->

      <div class="spost clearfix">

      <div class="entry-image">

        <a href="{row.link}">

          <img src="{row.picture}" alt="{row.title}"></a>

      </div>

      <div class="entry-c">

        <div class="entry-title">

          <h4><a href="{row.title}">{row.title}</a></h4>

        </div>

        <ul class="entry-meta">

          <li class="color">

            <ins><span class="auto_price">{row.price}</span></ins>

            <del><span class="auto_price">{row.price_buy}</span></del>

          </li>

          <!--<li><i class="icon-star3"></i> <i class="icon-star3"></i> <i class="icon-star3"></i> <i class="icon-star3"></i> <i class="icon-star-half-full"></i></li>-->

        </ul>

      </div>

    </div>

    <!-- END: row_c -->

  </div>

  <!-- END: row -->



</div>

<script>

  auto_price_format();

</script>

<!-- END: box_product_deal -->



<!-- BEGIN: box_product_focus -->



<div class="widget clearfix">



  <!-- BEGIN: row -->

  <h4>{row.title}</h4>



  <div id="post-list-footer">

    <!-- BEGIN: row_c -->

    <div class="spost clearfix">

      <div class="entry-image">

        <a href="{row.link}">

          <img src="{row.picture}" alt="{row.title}"></a>

      </div>

      <div class="entry-c">

        <div class="entry-title">

          <h4><a href="{row.title}">{row.title}</a></h4>

        </div>

        <ul class="entry-meta">

          <li class="color">

            <ins><span class="auto_price">{row.price}</span></ins>

            <del><span class="auto_price">{row.price_buy}</span></del>

          </li>

          <!--<li><i class="icon-star3"></i> <i class="icon-star3"></i> <i class="icon-star3"></i> <i class="icon-star3"></i> <i class="icon-star-half-full"></i></li>-->

        </ul>

      </div>

    </div>

    <!-- END: row_c -->

  </div>

  <!-- END: row -->



</div>

<script>

  auto_price_format();

</script>

<!-- END: box_product_focus -->



<!-- BEGIN: box_statistic -->

<div class="box bo_css box_statistic">

	<div class="box-title">

  	<div class="box-title-icon"></div>

    <div class="box-titleb">{LANG.global.box_statistic}</div>

  </div>

  <div class="box-content">

  	<script language="javascript">ttHStatistic.config = ({"full_zero" : false,"split_char" : true});</script>

    <div id="tth-statistic" class="statistic_content">

      <div class="row row_online">

        <div class="col col_title">{LANG.global.current_visitors}</div>

        <div class="col col_mid">:</div>

        <div class="col col_content" id="tth-online"></div>

        <div class="clear"></div>

      </div>

      <div class="row row_visitors">

        <div class="col col_title">{LANG.global.visitors}</div>

        <div class="col col_mid">:</div>

        <div class="col col_content" id="tth-total"></div>

        <div class="clear"></div>

      </div>

    </div>

  </div>

</div>

<!-- END: box_statistic -->



<!-- BEGIN: form_signin -->

<form id="{data.form_id_pre}form_signin" name="{data.form_id_pre}form_signin" method="post" action="{data.link_action}" onSubmit="return false" >

  <div class="form_mess"></div>

  <div class="row">

    <label class="title">{LANG.global.username}</label>

    <input name="username" type="text" maxlength="100" value="{data.username}" class="input_text" />

    <div class="clear"></div>

  </div>

  <div class="row">

    <label class="title">{LANG.global.password}</label>

    <input name="password" type="password" maxlength="100" value="{data.password}" class="input_text" />

    <div class="clear"></div>

  </div>

  <div class="row_btn">

    <input type="hidden" name="do_submit"	 value="1" />

    <input type="submit" class="btn" value="{LANG.global.btn_signin}" />

  </div>

  <div class="forget_password">

  	<a href="{data.link_forget_password}" target="_top">{LANG.global.forget_password}</a>

  </div>

  <div class="clear"></div>

</form>

<script language="javascript">

	ttHUser.signin('{data.form_id_pre}form_signin', '{data.link_login_go}');

</script>

<!-- END: form_signin -->



<!-- BEGIN: form_signup -->

<form id="{data.form_id_pre}form_signup" name="{data.form_id_pre}form_signup" method="post" action="{data.link_action}" onSubmit="return false" >

  <div class="form_mess"></div>

  <div class="row_l">

    <div class="row">

      <label class="title">{LANG.global.username}</label>

      <input name="username" type="text" maxlength="100" value="{data.username}" class="input_text" />

      <div class="clear"></div>

    </div>

    <div class="row">

      <label class="title">{LANG.global.password}</label>

      <input id="{data.form_id_pre}password" name="password" type="password" maxlength="100" value="{data.password}" class="input_text" />

      <div class="clear"></div>

    </div>

    <div class="row">

      <label class="title">{LANG.global.re_password}</label>

      <input name="re_password" type="password" maxlength="100" value="{data.re_password}" class="input_text" />

      <div class="clear"></div>

    </div>

    <div class="row">

      <label class="title">{LANG.global.nickname}</label>

      <input name="nickname" type="text" maxlength="100" value="{data.nickname}" class="input_text" />

      <div class="clear"></div>

    </div>

    <div class="row">

      <label class="title">{LANG.global.phone}</label>

      <input name="phone" type="text" maxlength="100" value="{data.phone}" class="input_text" />

      <div class="clear"></div>

    </div>

  </div>

  <div class="row_r">

    <div class="row">

      <label class="title">{LANG.global.address}</label>

      <input name="address" type="text" maxlength="100" value="{data.address}" class="input_text" />

      <div class="clear"></div>

    </div>

    <div class="row">

      <label class="title">{LANG.global.province}</label>

      {data.list_location_province}

      <div class="clear"></div>

    </div>

    <div class="row">

      <label class="title">{LANG.global.district}</label>

      {data.list_location_district}

      <div class="clear"></div>

    </div>

    <div class="row">

      <label class="title">{LANG.global.ward}</label>

      {data.list_location_ward}

      <div class="clear"></div>

    </div>

    <div class="row">

      <label class="title"><img src="{data.link_root}ajax.php?m=global&f=captcha" alt="captcha" /></label>

      <input name="captcha" type="text" maxlength="6" value="" class="input_text" />

      <div class="clear"></div>

    </div>

  </div>

  <div class="clear"></div>

  <div class="row_btn">

    <input type="hidden" name="do_submit"	 value="1" />

    <input type="submit" class="btn" value="{LANG.global.btn_signup}" />

  </div>

</form>

<script language="javascript">

	ttHLocation.list_location_province_load_child();

	ttHLocation.list_location_district_load_child();

	ttHUser.signup('{data.form_id_pre}form_signup', '{data.link_login_go}');

</script>

<!-- END: form_signup -->



<!-- BEGIN: form_signup_user -->

<form id="{data.form_id_pre}form_signup" name="{data.form_id_pre}form_signup" method="post" action="{data.link_action}" onSubmit="return false" >

  <div class="form_mess"></div>

  <div class="row_l">

    <div class="row">

      <input name="username" type="text" maxlength="100" value="{data.username}" class="input_text" placeholder="{LANG.global.username}" />

      <div class="clear"></div>

    </div>

    <div class="row">

      <input id="{data.form_id_pre}password" name="password" type="password" maxlength="100" value="{data.password}" class="input_text" placeholder="{LANG.global.password}" />

      <div class="clear"></div>

    </div>

    <div class="row">

      <input name="re_password" type="password" maxlength="100" value="{data.re_password}" class="input_text" placeholder="{LANG.global.re_password}" />

      <div class="clear"></div>

    </div>

    <div class="row">

      <input name="nickname" type="text" maxlength="100" value="{data.nickname}" class="input_text" placeholder="{LANG.global.nickname}" />

      <div class="clear"></div>

    </div>

    <div class="row">

      <input name="phone" type="text" maxlength="100" value="{data.phone}" class="input_text" placeholder="{LANG.global.phone}" />

      <div class="clear"></div>

    </div>

  </div>

  <div class="row_r">

    <div class="row">

      <input name="address" type="text" maxlength="100" value="{data.address}" class="input_text" placeholder="{LANG.global.address}" />

      <div class="clear"></div>

    </div>

    <div class="row">

      {data.list_location_province}

      <div class="clear"></div>

    </div>

    <div class="row">

      {data.list_location_district}

      <div class="clear"></div>

    </div>

    <div class="row">

      {data.list_location_ward}

      <div class="clear"></div>

    </div>

    <div class="row">

      <img src="{data.link_root}ajax.php?m=global&f=captcha" alt="captcha" />

      <input name="captcha" type="text" maxlength="6" value="" class="input_text captcha" />

      <div class="clear"></div>

    </div>

  </div>

  <div class="clear"></div>

  <div class="row_btn">

    <input type="hidden" name="do_submit"	 value="1" />

    <input type="submit" class="btn" value="{LANG.global.btn_signup}" />

  </div>

</form>

<script language="javascript">

	ttHLocation.list_location_province_load_child();

	ttHLocation.list_location_district_load_child();

	ttHUser.signup('{data.form_id_pre}form_signup', '{data.link_login_go}');

</script>

<!-- END: form_signup_user -->



<!-- BEGIN: html_navigation -->

<ol class="breadcrumb col-md-6 col-sm-6 hidden-xs">

  <!-- BEGIN: row -->

  <li>{row.content}</li>

  <!-- END: row -->



</ol>



<!-- END: html_navigation -->



<!-- BEGIN: html_list_share -->
<!-- Place this tag in your head or just before your close body tag. -->
<div class="list_share">
  <iframe src="https://www.facebook.com/plugins/like.php?href={data.link_share}&width=122&layout=button_count&action=like&show_faces=false&share=true&height=20&appId" width="130" height="20" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe>
  <!-- Place this tag in your head or just before your close body tag. -->
  <script src="https://apis.google.com/js/platform.js" async defer></script>
  <!-- Place this tag where you want the share button to render. -->
  <div class="g-plus" data-action="share" data-href="https://www.google.com.vn/"></div>

</div>

<!-- END: html_list_share -->



<!-- BEGIN: html_alert_info -->

<div class="alert alert-info alert-dismissable">

    {data.mess}

</div>

<!-- END: html_alert_info -->



<!-- BEGIN: html_alert_error -->

<div class="alert alert-danger alert-dismissable">

    {data.mess}

</div>

<!-- END: html_alert_error -->



<!-- BEGIN: html_alert_warning -->

<div class="alert alert-warning alert-dismissable">

    {data.mess}

</div>

<!-- END: html_alert_warning -->



<!-- BEGIN: html_alert_success -->

<div class="alert alert-success alert-dismissable">

    {data.mess}

</div>

<!-- END: html_alert_success -->



<!-- BEGIN: alert -->

<html lang="en">

  <head>

    <meta charset="utf-8">

    <title>{CONF.page_title}</title>

  </head>



  <body>

  {data.content}

  </body>

</html>

<!-- END: alert -->