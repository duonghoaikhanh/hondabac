<?php

/*================================================================================*\
Name code : view.php
Copyright © 2015  by Phan Van Lien
@version : 1.0
@date upgrade : 01/01/2015 by Phan Van Lien
\*================================================================================*/

if ( !defined('IN_ttH') )	{ die('Access denied');	} 
$lang = array(
	'repository' => 'Kho',
	'repository_add' => 'Thêm kho mới',
	'repository_edit' => 'Cập nhật kho',
	'repository_del' => 'Xóa kho',
	'repository_manage_trash' => 'Quản lý thùng rác kho',
	'repository_manage' => 'Quản lý kho',
	
	'stock' => 'Kho',
	'stock_manage' => 'Quản lý kho',
	
	'method_group' => 'Nhóm phương thức',
	'method_group_add' => 'Thêm nhóm phương thức mới',
	'method_group_edit' => 'Cập nhật nhóm phương thức',
	'method_group_del' => 'Xóa nhóm phương thức',
	'method_group_manage_trash' => 'Quản lý thùng rác nhóm phương thức',
	'method_group_manage' => 'Quản lý nhóm phương thức',
	
	'method_import' => 'Phương thức nhập',
	'method_import_add' => 'Thêm phương thức nhập mới',
	'method_import_edit' => 'Cập nhật phương thức nhập',
	'method_import_del' => 'Xóa phương thức nhập',
	'method_import_manage_trash' => 'Quản lý thùng rác phương thức nhập',
	'method_import_manage' => 'Quản lý phương thức nhập',
	
	'method_export' => 'Phương thức xuất',
	'method_export_add' => 'Thêm phương thức xuất mới',
	'method_export_edit' => 'Cập nhật phương thức xuất',
	'method_export_del' => 'Xóa phương thức xuất',
	'method_export_manage_trash' => 'Quản lý thùng rác phương thức xuất',
	'method_export_manage' => 'Quản lý phương thức xuất',
	
	'receipt_add' => 'Thêm phiếu đề nghị',
	'receipt_edit' => 'Xem phiếu đề nghị',
	'receipt_del' => 'Xóa phiếu đề nghị',
	'receipt_manage_trash' => 'Quản lý phiếu đề nghị chưa duyệt',
	'receipt_manage' => 'Quản lý phiếu đề nghị đã duyệt',
	
	'receipt_import_add' => 'Thêm phiếu nhập kho',
	'receipt_import_edit' => 'Xem phiếu nhập kho',
	'receipt_import_del' => 'Xóa phiếu nhập kho',
	'receipt_import_manage_trash' => 'Quản lý phiếu nhập kho chưa hoàn chỉnh',
	'receipt_import_manage' => 'Quản lý phiếu nhập kho',
	
	'receipt_export_add' => 'Thêm phiếu xuất kho theo đơn hàng',
	'receipt_export_edit' => 'Xem phiếu xuất kho theo đơn hàng',
	'receipt_export_del' => 'Xóa phiếu xuất kho theo đơn hàng',
	'receipt_export_manage' => 'Quản lý phiếu xuất kho theo đơn hàng',
	
	'receipt_export_option_add' => 'Thêm phiếu xuất kho tùy chọn',
	'receipt_export_option_edit' => 'Xem phiếu xuất kho tùy chọn',
	'receipt_export_option_del' => 'Xóa phiếu xuất kho tùy chọn',
	'receipt_export_option_manage' => 'Quản lý phiếu xuất kho tùy chọn',
	
	'receipt_approved_manage' => 'Quản lý phiếu nhập kho đã duyệt',
	'receipt_unapproved_manage' => 'Quản lý phiếu nhập kho đã duyệt',
	
	'receipt_history_manage' => 'Quản lý lịch sử mua hàng',
	
	'import' => 'Nhập vào',
	'export' => 'Xuất',
	'extant' => 'Tồn kho',
	'receipt_code' => 'Mã phiếu',
	'product' => 'Sản phẩm',
	'detail' => 'Màu và size',
	
	'status_order' => 'Trạng thái đơn hàng',
	
	'ordering_address' => 'Thông tin đặt hàng',
	'delivery_address' => 'Thông tin giao hàng',
	'ordering_shipping' => 'Phương thức giao hàng',
	'ordering_method' => 'Phương thức thanh toán',
	'od_same' => 'Giống thông tin đặt hàng',
	'full_name' => 'Họ và tên',
	'email' => 'Email',
	'phone' => 'Điện thoại',
	'address' => 'Địa chỉ',
	'request_more' => 'Yêu cầu thêm',
	'order_code' => 'Mã đơn hàng',
	
	'col_picture' => 'Hình ảnh',
	'col_title' => 'Sản phẩm',
	'col_color' => 'Màu',
	'col_code_pic' => 'Mã hình',
	'col_price' => 'Giá',
	'col_quantity' => 'Số lượng',
	'col_total' => 'Tổng tiền',
	'col_delete' => 'Xóa',
	'cart_total' => 'TỔNG GIỎ HÀNG',
	'promotional_code' => 'Promotional Code',
	'gift_voucher' => 'Gift Voucher',
	'cart_shipping' => 'Phí vận chuyển',
	'cart_payment' => 'TỔNG TIỀN',
	'total_order' => 'Tổng hóa đơn',
	'status_order' => 'Trạng thái hóa đơn',
	
	'admin_finish' => 'Người kết thúc',
	
	);
?>