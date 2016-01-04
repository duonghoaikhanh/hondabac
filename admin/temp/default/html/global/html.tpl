<!-- BEGIN: body --><!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>{CONF.page_title}</title>

    <!-- Bootstrap core CSS -->
    <link href="{DIR_CSS}global/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="{DIR_CSS}global/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="{DIR_CSS}font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="{DIR_CSS}global/admin.css">
    <!-- Page Specific CSS -->
    <!--<link rel="stylesheet" href="http://cdn.oesmith.co.uk/morris-0.4.3.min.css">-->
    <link rel="stylesheet" href="{DIR_JS}jquery_ui/themes/base/ui.all.css">
    <link rel="stylesheet" href="{DIR_JS}fancybox/jquery.fancybox.css">
    <link rel="stylesheet" href="{DIR_CSS}global/chosen/chosen.css">
    <link rel="stylesheet" href="{DIR_JS}fixedsticky/fixedsticky.css">
    <link href="{DIR_JS}ui_datetimepicker/jquery-ui-timepicker-addon.css" rel="stylesheet">    
    <script language="javascript" >
			var ROOT = "{CONF.rooturl}admin/";
			var ROOT_WEB = "{CONF.rooturl_web}";
			var DIR_IMAGE = "{DIR_IMAGE}";
			var lang = "{CONF.lang_cur}";
			var lang_js = new Array();
			{LANG_JS}
		</script>
    <script src="{DIR_JS}jquery-1.10.2.js"></script>
    <!--<script src="{DIR_JS}jquery_ui/jquery-ui.js"></script>-->
    <script src="{DIR_JS}ui_datetimepicker/jquery-ui.min.js"></script>
    <script src="{DIR_JS}fancybox/jquery.fancybox.pack.js"></script>
    <script src="{DIR_JS}chosen/chosen.jquery.js"></script>
    <script src="{DIR_JS}auto_numeric/autoNumeric.js"></script>
    <script src="{DIR_JS}fixedsticky/fixedsticky.js"></script>
    <script src="{DIR_JS}ui_datetimepicker/jquery-ui-timepicker-addon.min.js"></script>
    <script src="{DIR_TEMP}js/global/temp.js"></script>
    <script src="{DIR_JS}admin/global.js"></script>
    <script type="text/javascript">
		
		jQuery(document).ready(function ($) {
			$('select.form-control').chosen();
			
			$('.datepicker').datepicker({
				changeMonth: true,
				changeYear: true,
				dateFormat: 'dd/mm/yy'
			});
			
			/*
			 *  Simple image gallery. Uses default settings
			 */

			$('.fancybox').fancybox();

			/*
			 *  Different effects
			 */

			// Change title type, overlay closing speed
			$(".fancybox-effects-a").fancybox({
				helpers: {
					title : {
						type : 'outside'
					},
					overlay : {
						speedOut : 0
					}
				}
			});
			
			$(".iframe-btn").fancybox({
				"width"	: 880,
				"height"	: 570,
				"type"	: "iframe",
				"autoScale"   : false
					});
					$("#download-button").on("click", function() {
					ga("send", "event", "button", "click", "download-buttons");      
					});
					$(".toggle").click(function(){
					var _this=$(this);
					$("#"+_this.data("ref")).toggle(200);
					var i=_this.find("i");
					if (i.hasClass("icon-plus")) {
					i.removeClass("icon-plus");
					i.addClass("icon-minus");
					}else{
					i.removeClass("icon-minus");
					i.addClass("icon-plus");
					}
			});			
		});
		
		function open_popup(url)
		{
						var w = 880;
						var h = 570;
						var l = Math.floor((screen.width-w)/2);
						var t = Math.floor((screen.height-h)/2);
						var win = window.open(url, "ResponsiveFilemanager", "scrollbars=1,width=" + w + ",height=" + h + ",top=" + t + ",left=" + l);
		}
		
	</script>
    {CONF.include_js}
    {CONF.include_css}
    {CONF.include_js_content}
    
    <!--[if lt IE 9]>
    	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>   
    <![endif]-->
  </head>

  <body>

    <div id="wrapper">

      <!-- Sidebar -->
      <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a href="{CONF.rooturl}admin"><img src="{DIR_IMAGE}logo.png" alt="Admin" style="width:43px; height:30px"/></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          {MENU_ADMIN}
          <ul class="nav navbar-nav navbar-right navbar-user">
          {BOX_LANG}
					{BOX_ADMIN}
          </ul>
        </div><!-- /.navbar-collapse -->
      </nav>

      <div id="page-wrapper">
        {PAGE_CONTENT}
      </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->
    
    <div id="tth-loading"></div>

    <!-- JavaScript -->
    <script src="{DIR_JS}bootstrap.js"></script>

    <!-- Page Specific Plugins -->
    <!--<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>-->
    <!--<script src="{DIR_JS}tablesorter/jquery.tablesorter.js"></script>
    <script src="{DIR_JS}tablesorter/tables.js"></script>-->

  </body>
</html>
<!-- END: body -->

<!-- BEGIN: menu_admin -->
<ul class="nav navbar-nav side-nav">
	<!-- BEGIN: item -->
  <li {row.class}><a href="{row.link}" class="dropdown-toggle" data-toggle="dropdown"><i class="fa {row.icon_menu}"></i> {row.title}</a>
  	<!-- BEGIN: sub -->
  	<ul class="dropdown-menu">
      <!-- BEGIN: sub_item -->
      <li {row.class}><a href="{row.link}"><i class="fa {row.icon_menu}"></i> {row.title}</a></li>
      <!-- END: sub_item -->
    </ul>
    <!-- END: sub -->
  </li>
  <!-- END: item -->
  <li style="height:40px;">&nbsp;</li>
</ul>
<!-- END: menu_admin -->

<!-- BEGIN: box_lang -->
<li class="dropdown lang-dropdown">
  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-flag"></i> {data.title} <b class="caret"></b></a>
  <ul class="dropdown-menu">
  	<!-- BEGIN: row -->
    <li><a href="{row.link}">{row.title}</a></li>
    <!-- END: row -->
  </ul>
</li>
<!-- END: box_lang -->

<!-- BEGIN: box_admin -->
<li class="dropdown user-dropdown">
  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> {data.full_name} <b class="caret"></b></a>
  <ul class="dropdown-menu">
    <li><a href="{data.link_profile}"><i class="fa fa-user"></i> {LANG.global.profile}</a></li>
    <li class="divider"></li>
    <li><a href="{data.link_logout}"><i class="fa fa-power-off"></i> {LANG.global.log_out}</a></li>
  </ul>
</li>
<!-- END: box_admin -->