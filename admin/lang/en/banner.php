<?php

/*================================================================================*\
Name code : view.php
Copyright © 2015  by Phan Van Lien
@version : 1.0
@date upgrade : 01/01/2015 by Phan Van Lien
\*================================================================================*/

if ( !defined('IN_ttH') )	{ die('Access denied');	} 
$lang = array(
	'banner_add' => 'Thêm banner mới',
	'banner_edit' => 'Cập nhật banner',
	'banner_del' => 'Xóa banner',
	'banner_manage_trash' => 'Quản lý thùng rác banner',
	'banner_manage' => 'Quản lý banner',
	'banner_group' => 'Vị trí',
	
	'group_add' => 'Thêm vị trí mới',
	'group_edit' => 'Cập nhật vị trí',
	'group_del' => 'Xóa vị trí',
	'group_manage_trash' => 'Quản lý thùng rác vị trí',
	'group_manage' => 'Quản lý vị trí',
	
	'name_action' => 'Tên tương tác',
	'name_action_note' => 'Chữ thường hoặc số cách nhau bằng dấu -',
	'width' => 'Chiều rộng (px)',
	'height' => 'Chiều cao (px)',
	'height_note' => '0 hoặc để trống là tự động',
	
	'err_invalid_width' => 'Chiều rộng phải là số lớn hơn 0',
	'err_invalid_group' => 'Tên tương tác không hợp lệ',
	'err_exited_group' => 'Tên tương tác đã tồn tại',
	'err_trash_group' => 'Tên tương tác đã tồn tại trong giõ rác',
	);
?>