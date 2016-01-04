<?php

/*================================================================================*\
Name code : setting.php
Copyright © 2013 by Phan Van Lien
@version : 1.0
@date upgrade : 03/02/2013 by Phan Van Lien
\*================================================================================*/

class Home
{
	
	//-----------------  html_edit
	function html_edit ($data)
	{
		global $ttH;
		
		?>
    <?php echo $data["err"]?>
    <form action="<?php echo $data["link_action"]?>" method="post" enctype="multipart/form-data" name="myForm" id="myForm">
			<table align="center" border="0"  cellspacing="1" cellpadding="1" class="table_input">
				<tr class="row row_title">
					<td class="col" colspan="3" ><span><?php echo $ttH->lang["global"]["general_config"]?></span></td>
				</tr>
				<tr class="row row_0">
					<td class="col col_1" ><?php echo $ttH->lang["global"]["email"]?></td>
					<td class="col col_2"> : </td>
					<td class="col col_3"><input name="email" id="email" type="text" size="50" maxlength="150" value="<?php echo $data["email"]?>" class="textfiled"></td>
				</tr>
				<tr class="row row_1 form-required">
					<td class="col col_1" ><?php echo $ttH->lang["global"]["list_skin"]?></td>
					<td class="col col_2"> : </td>
					<td class="col col_3"><?php echo $data["list_skin"]?></td>
				</tr>
				<tr class="row row_0">
					<td class="col col_1" ><?php echo $ttH->lang["global"]["n_list"]?></td>
					<td class="col col_2"> : </td>
					<td class="col col_3"><input name="n_list" id="n_list" type="text" size="4" value="<?php echo $data["n_list"]?>" class="textfiled"></td>
				</tr>
				<tr class="row row_title">
					<td class="col" colspan="3" ><span><?php echo $ttH->lang["global"]["send_email_config"]?></span></td>
				</tr>
				<tr class="row row_1 form-required">
					<td class="col col_1" ><?php echo $ttH->lang["global"]["method_email"]?></td>
					<td class="col col_2"> : </td>
					<td class="col col_3"><?php echo $data["list_method_email"]?></td>
				</tr>
				<tr class="row row_0">
					<td class="col col_1" ><?php echo $ttH->lang["global"]["smtp_host"]?></td>
					<td class="col col_2"> : </td>
					<td class="col col_3"><input name="smtp_host" id="smtp_host" type="text" size="50" maxlength="150" value="<?php echo $data["smtp_host"]?>" class="textfiled"></td>
				</tr>
				<tr class="row row_1 form-required">
					<td class="col col_1" ><?php echo $ttH->lang["global"]["smtp_port"]?></td>
					<td class="col col_2"> : </td>
					<td class="col col_3"><input name="smtp_port" id="smtp_port" type="text" size="50" maxlength="150" value="<?php echo $data["smtp_port"]?>" class="textfiled"></td>
				</tr>
				<tr class="row row_0">
					<td class="col col_1" ><?php echo $ttH->lang["global"]["smtp_username"]?></td>
					<td class="col col_2"> : </td>
					<td class="col col_3"><input name="smtp_username" id="smtp_username" type="text" size="50" maxlength="150" value="<?php echo $data["smtp_username"]?>" class="textfiled"></td>
				</tr>
				<tr class="row row_1 form-required">
					<td class="col col_1" ><?php echo $ttH->lang["global"]["smtp_password"]?></td>
					<td class="col col_2"> : </td>
					<td class="col col_3"><input name="smtp_password" id="smtp_password" type="text" size="50" maxlength="150" value="<?php echo $data["smtp_password"]?>" class="textfiled"></td>
				</tr>
				<tr class="row row_title">
					<td class="col" colspan="3" ><span><?php echo $ttH->lang["global"]["user_config"]?></span></td>
				</tr>
				<tr class="row row_0 form-required">
					<td class="col col_1" ><?php echo $ttH->lang["global"]["signup_method"]?></td>
					<td class="col col_2"> : </td>
					<td class="col col_3"><?php echo $data["list_signup_method"]?></td>
				</tr>
				<tr>
					<td class="col col_1" >&nbsp;</td>
					<td class="col col_2">&nbsp;</td>
					<td class="col col_3">
						<input type="hidden" name="do_submit"	 value="1" />
						<?php echo $ttH->temp->html_button ("btn_submit", "submit", $ttH->lang["btn_submit"])?> &nbsp; 
						<?php echo $ttH->temp->html_button ("btn_reset", "reset", $ttH->lang["btn_reset"])?>
					</td>
				</tr>
			</table>
		</form>
    <?php
	}
  // end class
}
?>
