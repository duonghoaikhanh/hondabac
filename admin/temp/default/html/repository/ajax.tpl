<!-- BEGIN: order_detail -->
<!-- BEGIN: row_item -->
<tr>
  <td class="cot">{row.title}</td>
  <td class="cot"><span style="background:{row.color.color}; border:1px solid #000;">&nbsp;&nbsp;&nbsp;&nbsp;</span> {row.color.title}</td>
  <td class="cot">{row.size.title}</td>
  <td class="cot" align="right">{row.price_buy}</td>
  <td class="cot" align="right">{row.quantity}</td>
  <td class="cot" align="right">{row.out_stock}</td>
  <td class="cot" align="center">
    {row.import}
    <script language="javascript">$('select#{row.import_id}').chosen();</script>
  </td>
</tr>
<!-- END: row_item --> 
<!-- BEGIN: row_empty -->
<tr class="warning">
  <td align="center" colspan="7">{row.mess}</td>
</tr>
<!-- END: row_empty --> 
<!-- END: order_detail --> 