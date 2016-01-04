<!-- BEGIN: stock --> 
<div class="row">
  <div class="col-lg-12">
    <div class="table-responsive">
      <table class="table table-bordered table-hover table-striped table_row">
        <thead>
          <tr >
            <th class="header" >{data.f_color_id}</th>
            <th class="header" >{data.f_size_id}</th>
            <th class="header" width="15%">{data.f_in_stock}</th>
            <th class="header" width="15%">{data.f_out_stock}</th>
          </tr>
        </thead>
        <tbody>
          <!-- BEGIN: row_item -->
          <tr id="row_{row.pic_id}">
            <td class="cot"><span style="background:{row.color.color}; border:1px solid #000;">&nbsp;&nbsp;&nbsp;&nbsp;</span> {row.color.title}</td>
            <td class="cot">{row.size.title}</td>
            <td class="cot" align="right">{row.in_stock}</td>
            <td class="cot" align="right">{row.out_stock}</td>
          </tr>
          <!-- END: row_item --> 
          <!-- BEGIN: row_empty -->
          <tr class="warning">
            <td align="center" colspan="5">{row.mess}</td>
          </tr>
          <!-- END: row_empty --> 
        </tbody>
      </table>
    </div>
  </div>
</div>
<!-- END: stock --> 