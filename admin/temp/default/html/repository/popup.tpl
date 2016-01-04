<!-- BEGIN: combine --> 
<div class="table-responsive">
  <table class="table table-bordered table-hover table-striped table_row">
    <thead>
      <tr >
        <th class="header" >{LANG.global.color}</th>
        <th class="header" >{LANG.global.size}</th>
        <th class="header" width="15%">{LANG.repository.import}</th>
        <th class="header" width="15%">{LANG.repository.export}</th>
        <th class="header" width="15%">{LANG.repository.extant}</th>
      </tr>
    </thead>
    <tbody>
      <!-- BEGIN: row_item -->
      <tr id="row_{row.pic_id}">
        <td class="cot"><span style="background:{row.color.color}; border:1px solid #000;">&nbsp;&nbsp;&nbsp;&nbsp;</span> {row.color.title}</td>
        <td class="cot">{row.size.title}</td>
        <td class="cot" align="right">{row.in_stock}</td>
        <td class="cot" align="right">{row.out_stock}</td>
        <td class="cot" align="right">{row.has_stock}</td>
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
<!-- END: combine --> 

<!-- BEGIN: receipt_detail --> 
<div class="table-responsive">
  <table class="table table-bordered table-hover table-striped table_row">
    <thead>
      <tr >
        <th class="header" >{LANG.global.color}</th>
        <th class="header" >{LANG.global.size}</th>
        <th class="header" width="20%">{LANG.global.quantity}</th>
      </tr>
    </thead>
    <tbody>
      <!-- BEGIN: row_item -->
      <tr id="row_{row.pic_id}">
        <td class="cot"><span style="background:{row.color.color}; border:1px solid #000;">&nbsp;&nbsp;&nbsp;&nbsp;</span> {row.color.title}</td>
        <td class="cot">{row.size.title}</td>
        <td class="cot" align="right">{row.quantity}</td>
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
<!-- END: receipt_detail --> 