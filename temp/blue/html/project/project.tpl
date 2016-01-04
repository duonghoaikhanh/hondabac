<!-- BEGIN: main -->
{data.content}
<!-- END: main --> 

<!-- BEGIN: main1 -->
<div id="content">{data.content}</div>
<div id="column">{data.box_column}</div> 
<!-- END: main1 --> 

<!-- BEGIN: main2 -->
<div id="group_detail">{data.content}</div>
{data.box_column}
<div class="clear"></div>
<!-- END: main2 --> 

<!-- BEGIN: list_item -->
<div class="list_item">
  <!-- BEGIN: row_item -->
  <div class="row_item {row.class}">
    <!-- BEGIN: col_item -->
    <div class="col_item {col.class}">
      <div class="img"><div class="limit" style="width:{col.pic_w}px;height:{col.pic_h}px;"><a href="{col.link}" title="{col.title}"><img src="{col.picture}" alt="{col.title}" title="{col.title}" /></a></div></div>
      <h3><a href="{col.link}" title="{col.title}">{col.title}</a></h3>
      <div class="short">{col.short}</div>
      <div class="view_detail"><a href="{col.link}" title="{col.title}"><span>{LANG.project.view_detail}</span></a></div>
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

<!-- BEGIN: grid_item -->
<div class="grid_item">
  <div class="row_item {row.class}">
    <!-- BEGIN: row_item -->
      <!-- BEGIN: col_item -->
      <div class="col_item {col.class}">
      	<a href="{col.link}" target="_blank" title="{col.title}">
          <div class="img"><div class="limit"><img src="{col.picture}" alt="{col.title}" title="{col.title}" /></div></div>
          <h3>{col.title}</h3>
          <div class="view_detail"><span>{LANG.project.view_website}</span></div>
        </a>
      </div>
      <!-- END: col_item --> 
    <!-- END: row_item --> 
    <!-- BEGIN: row_empty -->
    <div class="row_empty">{row.mess}</div>
    <!-- END: row_empty --> 
    <div class="clear"></div>
  </div>
  {data.nav}
</div>
<!-- END: grid_item --> 

<!-- BEGIN: list_item_detail -->
<div class="list_item_detail">
  <!-- BEGIN: row_item -->
  <div class="row_item {row.class}">
    <!-- BEGIN: col_item -->
    <div class="col_item {col.class}">
      <h3><a href="{col.link}" title="{col.title}">{col.title}</a></h3>
      <ul class="tool_project list_none">
        <li class="date">{col.date_update}</li>
        <li class="num_comment">{col.num_comment} {LANG.project.comments}</li>
        <li><iframe src="//www.facebook.com/plugins/like.php?href={col.link_share}&amp;width=90px&amp;layout=button_count&amp;action=like&amp;show_faces=true&amp;share=false&amp;height=21;width=90" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:90px; height:21px;" allowTransparency="true"></iframe></li>
        <li class="share_facebook"><a href="https://www.facebook.com/sharer/sharer.php?u={col.link_share}" target="_blank">&nbsp;</a></li>
        <li class="share_twitter"><a href="https://twitter.com/home?status={col.link_share}" target="_blank">&nbsp;</a></li>
        <li class="share_google"><a href="https://plus.google.com/share?url={col.link_share}" target="_blank">&nbsp;</a></li>
      </ul>
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
<!-- END: list_item_detail --> 

<!-- BEGIN: item_detail --> 
<div id="item_detail">
	<div class="item_info">
  	<span class="date">{data.date_update}</span>
  </div>
  <div class="content">{data.content}</div>
  <div class="clear"></div>
  {data.list_other}
</div>
<!-- END: item_detail --> 

<!-- BEGIN: html_title_more -->
<div class="tool_project">
  <a href="javascript:print();" class="icon_print">{LANG.project.print}</a>
  <span>|</span>
  <a href="mailto:?subject={data.title}
&body={data.link}" class="icon_send_email">{LANG.project.send_email}</a>
</div>
<!-- END: html_title_more --> 

<!-- BEGIN: list_other -->
<div class="list_other">
  <div class="hr"></div>
  <div class="list_other-title">{LANG.project.other_project}</div>
	<ul class="list_none">
  	<!-- BEGIN: row -->
  	<li><a href="{row.link}" title="{row.title}">{row.title}</a></li>
    <!-- END: row --> 
  </ul>
</div>
<!-- END: list_other --> 