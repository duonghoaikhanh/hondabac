<?php

/*================================================================================*\
Name code : view.php
Copyright © 2015  by Phan Van Lien
@version : 1.0
@date upgrade : 01/01/2015 by Phan Van Lien
\*================================================================================*/

if ( !defined('IN_ttH') )	{ die('Access denied');	} 
$lang = array(
	'config' => 'Cấu hình hệ thống',
	'general_config' => 'Cấu hình chung' , 
	'email' => 'Email' , 
	'hotline' => 'Hotline',
	'list_skin' => 'Danh sách giao diện',
	'n_list' => 'Số dòng trên 1 trang',
	'send_email_config' => 'Cấu hình gửi email' , 
	'method_email' => 'Phương thức gửi' , 
	'smtp_host' => 'Host email' , 
	'smtp_port' => 'Cổng SMTP' , 
	'smtp_username' => 'Tài khoản' , 
	'smtp_password' => 'Mật khẩu' ,
	'user_config' => 'Cấu hình thành viên' , 
	'signup_method' => 'Kích hoạt tài khoản' , 
	'signup_method_0' => 'Không cần kích hoạt' , 
	'signup_method_1' => 'Kích hoạt qua email' , 
	'signup_method_2' => 'Kích hoạt bởi ban quản trị' , 
	
	'menu_add' => 'Thêm menu mới',
	'menu_edit' => 'Cập nhật menu',
	'menu_del' => 'Xóa menu',
	'menu_manage_trash' => 'Quản lý thùng rác menu',
	'menu_manage' => 'Quản lý menu',
	'icon_menu' => 'Biểu tượng',
	
	'lang_add' => 'Thêm bài mới',
	'lang_edit' => 'Cập nhật bài viết',
	'lang_manage' => 'Quản lý ngôn ngữ',
	'lang_setting' => 'Cấu hình ngôn ngữ',
	
	'database_manage' => 'Quản lý database',
	'btn_backup' => 'Backup',
	'backup_success' => 'Backup thành công',
	'backup_false' => 'Backup không thành công',
	'file_size' => 'Dung lượng',
	
	'support_add' => 'Thêm hỗ trợ mới',
	'support_edit' => 'Cập nhật hỗ trợ',
	'support_del' => 'Xóa hỗ trợ',
	'support_manage_trash' => 'Quản lý thùng rác hỗ trợ',
	'support_manage' => 'Quản lý hỗ trợ',
	'phone' => 'Điện thoại',
	
	'modules_add' => 'Thêm module mới',
	'modules_edit' => 'Cập nhật module',
	'modules_del' => 'Xóa module',
	'modules_manage_trash' => 'Quản lý thùng rác modules',
	'modules_manage' => 'Quản lý modules',
	'err_invalid_name_action' => 'Tên tương tác không hợp lệ',
	'err_exited_name_action' => 'Tên tương tác đã tồn tại',
	'err_trash_name_action' => 'Tên tương tác đã tồn tại trong giõ rác',
	
	'template_email_add' => 'Thêm email mẫu mới',
	'template_email_edit' => 'Cập nhật email mẫu',
	'template_email_del' => 'Xóa email mẫu',
	'template_email_manage' => 'Quản lý email mẫu',
	
	'location_area' => 'Khu vực',
	'location_area_add' => 'Thêm khu vực mới',
	'location_area_edit' => 'Cập nhật khu vực',
	'location_area_del' => 'Xóa khu vực',
	'location_area_manage_trash' => 'Quản lý thùng rác khu vực',
	'location_area_manage' => 'Quản lý khu vực',
	
	'location_country' => 'Quốc gia',
	'location_country_add' => 'Thêm quốc gia mới',
	'location_country_edit' => 'Cập nhật quốc gia',
	'location_country_del' => 'Xóa quốc gia',
	'location_country_manage_trash' => 'Quản lý thùng rác quốc gia',
	'location_country_manage' => 'Quản lý quốc gia',
	
	'location_province' => 'Tỉnh / Thành phố',
	'location_province_add' => 'Thêm tỉnh / thành phố mới',
	'location_province_edit' => 'Cập nhật tỉnh / thành phố',
	'location_province_del' => 'Xóa tỉnh / thành phố',
	'location_province_manage_trash' => 'Quản lý thùng rác tỉnh / thành phố',
	'location_province_manage' => 'Quản lý tỉnh / thành phố',
	
	'location_district' => 'Quận / Huyện',
	'location_district_add' => 'Thêm quận / huyện mới',
	'location_district_edit' => 'Cập nhật quận / huyện',
	'location_district_del' => 'Xóa quận / huyện',
	'location_district_manage_trash' => 'Quản lý thùng rác quận / huyện',
	'location_district_manage' => 'Quản lý quận / huyện',
	
	'location_ward' => 'Phường / Xã',
	'location_ward_add' => 'Thêm phường / xã mới',
	'location_ward_edit' => 'Cập nhật phường / xã',
	'location_ward_del' => 'Xóa phường / xã',
	'location_ward_manage_trash' => 'Quản lý thùng rác phường / xã',
	'location_ward_manage' => 'Quản lý phường / xã',
	
	'area_code' => 'Mã khu vực',
	'country_code' => 'Mã quốc gia',
	'province_code' => 'Mã tỉnh / thành phố',
	'district_code' => 'Mã quận / huyện',
	'ward_code' => 'Mã phường / xã',
	);
?>