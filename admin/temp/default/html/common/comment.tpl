<!-- BEGIN: main -->

<div class="row">

    <div class="col-lg-12">
        <h1>{data.page_title}</h1>
        <ol class="breadcrumb">
            <li><a href="{data.link_manage}" {data.class.manage}><i class="fa fa-th-list"></i> {LANG.global.manage}</a>
            </li>
        </ol>
    </div>

</div>

{data.main}

<!-- END: main -->


<!-- BEGIN: edit -->

<form action="{data.link_action}" method="post" enctype="multipart/form-data" name="myForm" id="myForm" role="form">
    <div class="row">
        <div class="col-md-12">{data.err}</div>
    </div>
    <div class="row">
        <!-- BEGIN: element -->
        {row.before}
        <div class="col-md-{row.form_col}">
            <div class="form-group">
                <!-- BEGIN: title -->
                <label>{row.title}</label>
                <!-- END: title -->
                {row.content}
            </div>
        </div>
        <!-- END: element -->

    </div>

    <div class="row" align="center">
        <input type="hidden" name="do_submit" value="1"/>
        <button type="submit" class="btn btn-default">{LANG.global.btn_submit}</button>
        <button type="reset" class="btn btn-default">{LANG.global.btn_reset}</button
    </div>

</form>

<!-- END: edit -->


<!-- BEGIN: manage -->


{data.err}

<form action="{data.link_action}" method="post" name="manage" id="manage">
    <div class="row">
        <div class="col-lg-12">
            <div class="table_btn table_btn_top">
                <img class="icon_arrow" src="{DIR_IMAGE}arrow_down.png"/>
                <button type="button" class="btn btn-default" onclick="do_submit_comment_status('do_access_comment')"
                        value="{LANG.comment.access_comment}">{LANG.comment.access_comment}</button>
                <div class="clear"></div>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered table-hover table-striped table_row">
                    <thead>
                    <tr>
                        <th class="header" width="5%">{data.f_id}</th>
                        <th class="header">{LANG.global.content}</th>
                        <th class="header" width="20%">{LANG.global.info}</th>
                        <th class="header" width="20%">{LANG.comment.status}</th>
                        <th class="header" width="15%">{LANG.global.action}</th>
                    </tr>
                    </thead>
                    <tbody>

                    <!-- BEGIN: row_item -->

                    <tr id="row_{row.item_id}">
                        <td class="cot" align="center">{row.item_id}</td>
                        <td class="cot">
                            {row.content}
                        </td>

                        <td class="cot">
                            <div><strong>{LANG.global.date_create}:</strong> {row.date_create}</div>
                            <div><strong>{LANG.comment.author_name}:</strong> {row.author_name}</div>
                            <div><strong>{LANG.comment.author_email}:</strong> {row.author_email}</div>
                            {row.html_checkbox}
                        </td>
                        <td class="cot" align="center">
                            <strong>{row.status_text}</strong>
                        </td>


                        <td class="cot" align="center">
                            <select name="status[]">
                                <option value="{row.id},1" {row.selected1}>{LANG.comment.access}</option>
                                <option value="{row.id},0" {row.selected0}>{LANG.comment.no_access}</option>
                            </select>
                        </td>


                    </tr>

                    <!-- END: row_item -->

                    <!-- BEGIN: row_empty -->

                    <tr class="warning">
                        <td align="center" colspan="7">{row.mess}</td>
                    </tr>

                    <!-- END: row_empty -->

                    </tbody>

                </table>

            </div>

            <div class="table_btn table_btn_buttom">

                <img class="icon_arrow" src="{DIR_IMAGE}arrow_up.png"/>

                <button type="button" class="btn btn-default" onclick="do_submit('do_edit')"
                        value="{LANG.global.btn_update}" name="btnEdit">{LANG.global.btn_update}</button>

                <!-- BEGIN: button_trash -->

                <!-- END: button_trash -->

                <!-- BEGIN: button_manage -->

                <!-- END: button_manage -->

                <div class="clear"></div>

            </div>

            <div class="table_nav">{data.nav}</div>

            <input id="do_action" type="hidden" value="" name="do_action">

        </div>

    </div>

</form>

<!-- END: manage --> 