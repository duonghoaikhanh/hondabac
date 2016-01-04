<!-- BEGIN: main -->
{data.content}
<!-- END: main --> 

<!-- BEGIN: focus -->
<div class="news_focus">
	<div class="news_focus-title">
  	<a href="{row.link}" title="{row.title}">{row.title}</a> <span class="date">({row.date_update})</span>
  </div>
	<div class="img"><a href="{row.link}" title="{row.title}"><img src="{row.picture}" alt="{row.title}" title="{row.title}" /></a></div>
	<div class="short">{row.short}</div>
	<div class="view_detail"><a href="{row.link}" title="{row.title}">{LANG.news.view_detail}</a></div>
  <div class="clear"></div>
</div>
<!-- END: focus --> 

<!-- BEGIN: list_group -->
<div class="list_group">
	{data.content}
  <!-- BEGIN: row_item -->
  <h2 class="row_item-title"><a href="{row_group.link}" title="{row_group.title}">{row_group.title}</a></h2> 
  <div class="row_item {row_group.class}">  	 
    <div class="img"><a href="{row.link}" title="{row.title}"><img src="{row.picture}" alt="{row.title}" title="{row.title}" /></a></div>
    <h3 class="title"><a href="{row.link}" title="{row.title}">{row.title}</a> <span class="date">({row.date_update})</span></h3>
    <div class="short">{row.short}</div>	
    <!-- BEGIN: other -->
    <ul class="other">
      <!-- BEGIN: li -->
      <li><a href="{other.link}">{other.title}</a> <span class="date">({other.date_update})</span></li>
      <!-- END: li -->  
    </ul>
    <!-- END: other -->    
    <div class="clear"></div>
  </div>
  {row_group.hr}
  <!-- END: row_item --> 
  <!-- BEGIN: row_empty -->
  <h2 class="row_item-title"><a href="{row_group.link}" title="{row_group.title}">{row_group.title}</a></h2> 
  <div class="row_empty {row_group.class}">{row_group.mess}</div>
  {row_group.hr}
  <!-- END: row_empty --> 
</div>
<!-- END: list_group --> 

<!-- BEGIN: list_item -->
<div class="list_item">
  <!-- BEGIN: row_item -->
  <div class="row_item {row.class}">
    <!-- BEGIN: col_item -->
    <div class="col_item {col.class}">
      <div class="img"><div class="limit" style="width:{col.pic_w}px;height:{col.pic_h}px;"><a href="{col.link}" title="{col.title}"><img src="{col.picture}" alt="{col.title}" title="{col.title}" /></a></div></div>
      <h3><a href="{col.link}" title="{col.title}">{col.title}</a><span>&nbsp;</span></h3>
      <div class="short">{col.short}</div>
      <div class="date">{col.date_update}</div>
      <a href="{col.link}" class="view_detail" title="{col.title}">{LANG.news.view_detail}</a>
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

<!-- BEGIN: html_title_more -->
<div class="tool_page">
  <a href="javascript:print();" class="icon_print">{LANG.news.print}</a>
</div>
<!-- END: html_title_more --> 

<!-- BEGIN: list_other -->
<div class="hr"></div>
<div class="list_other">
  <div class="list_other-title">{LANG.news.other_news}</div>
	<ul>
  	<!-- BEGIN: row -->
  	<li><a href="{row.link}" title="{row.title}">{row.title}</a> <span class="date">({row.date_update})</span></li>
    <!-- END: row --> 
  </ul>
</div>
<!-- END: list_other --> 