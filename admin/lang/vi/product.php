<?php

/*================================================================================*\
Name code : view.php
Copyright © 2015  by Phan Van Lien
@version : 1.0
@date upgrade : 01/01/2015 by Phan Van Lien
\*================================================================================*/

if ( !defined('IN_ttH') )	{ die('Access denied');	} 
$lang = array(
	'setting' => 'Cấu hình',
	'setting_product' => 'Cấu hình sản phẩm',
	'setting_brand' => 'Cấu hình thương hiệu',
	'setting_ordering' => 'Cấu hình đặt hàng',
	'ordering_cart' => 'Giỏ hàng',
	'ordering_cart_link' => 'Đường dẫn giỏ hàng',
	'ordering_address' => 'Địa chỉ đặt hàng',
	'ordering_address_link' => 'Đường dẫn địa chỉ đặt hàng',
	'ordering_shipping' => 'Phương thức vận chuyển',
	'ordering_shipping_link' => 'Đường dẫn phương thức vận chuyển',
	'ordering_method' => 'Phương thức thanh toán',
	'ordering_method_link' => 'Đường dẫn phương thức thanh toán',
	'ordering_complete' => 'Hoàn tất đơn hàng',
	'ordering_complete_link' => 'Đường dẫn hoàn tất đơn hàng',
	
	'product' => 'Sản phẩm',
	'product_add' => 'Thêm sản phẩm mới',
	'product_edit' => 'Cập nhật sản phẩm',
	'product_del' => 'Xóa sản phẩm',
	'product_stock' => 'Quản lý kho sản phẩm',
	'product_manage_trash' => 'Quản lý thùng rác sản phẩm',
	'product_manage' => 'Quản lý sản phẩm',
	
	'product_group' => 'Nhóm sản phẩm',
	'product_group_add' => 'Thêm nhóm sản phẩm mới',
	'product_group_edit' => 'Cập nhật nhóm sản phẩm',
	'product_group_del' => 'Xóa nhóm sản phẩm',
	'product_group_manage_trash' => 'Quản lý thùng rác nhóm sản phẩm',
	'product_group_manage' => 'Quản lý nhóm sản phẩm',
	
	'brand' => 'Thương hiệu',
	'brand_add' => 'Thêm thương hiệu mới',
	'brand_edit' => 'Cập nhật thương hiệu',
	'brand_del' => 'Xóa thương hiệu',
	'brand_manage_trash' => 'Quản lý thùng rác thương hiệu',
	'brand_manage' => 'Quản lý thương hiệu',
	
	'option' => 'Tinh năng',
	'option_add' => 'Thêm tinh năng mới',
	'option_edit' => 'Cập nhật tinh năng',
	'option_del' => 'Xóa tinh năng',
	'option_manage_trash' => 'Quản lý thùng rác tinh năng',
	'option_manage' => 'Quản lý tinh năng',
	
	'color' => 'Màu sắc',
	'color_add' => 'Thêm màu mới',
	'color_edit' => 'Cập nhật màu',
	'color_del' => 'Xóa màu',
	'color_manage_trash' => 'Quản lý thùng rác màu',
	'color_manage' => 'Quản lý màu',
	
	'code_pic' => 'Mã hình',
	'code_pic_add' => 'Thêm mã hình mới',
	'code_pic_edit' => 'Cập nhật mã hình',
	'code_pic_del' => 'Xóa mã hình',
	'code_pic_manage_trash' => 'Quản lý thùng rác mã hình',
	'code_pic_manage' => 'Quản lý mã hình',
	
	'size' => 'Size',
	'size_add' => 'Thêm size mới',
	'size_edit' => 'Cập nhật size',
	'size_del' => 'Xóa size',
	'size_manage_trash' => 'Quản lý thùng rác size',
	'size_manage' => 'Quản lý size',
	
	'status' => 'Trạng thái',
	'status_add' => 'Thêm trạng thái mới',
	'status_edit' => 'Cập nhật trạng thái',
	'status_del' => 'Xóa trạng thái',
	'status_manage_trash' => 'Quản lý thùng rác trạng thái',
	'status_manage' => 'Quản lý trạng thái',
	
	'stock' => 'Kho',
	'stock_add' => 'Thêm size và màu cho sản phẩm',
	'stock_edit' => 'Cập nhật dữ liệu kho',
	'stock_del' => 'Xóa dữ liệu kho',
	'stock_manage' => 'Quản lý kho',
	
	
	'receipt_edit' => 'Xem phiếu kho',
	'receipt_del' => 'Xóa phiếu kho',
	'receipt_manage_trash' => 'Quản lý phiếu kho chưa hoàn chỉnh',
	'receipt_manage' => 'Quản lý phiếu kho hoàn chỉnh',
	
	'product_pic' => 'Hình phụ',
	'product_pic_add' => 'Thêm hình phụ mới',
	'product_pic_edit' => 'Cập nhật hình phụ',
	'product_pic_del' => 'Xóa hình phụ',
	'product_pic_manage_trash' => 'Quản lý thùng rác hình phụ',
	'product_pic_manage' => 'Quản lý hình phụ',
	
	'product_ordering' => 'Đơn hàng',
	'product_ordering_edit' => 'Cập nhật đơn hàng',
	'product_ordering_del' => 'Xóa đơn hàng',
	'product_ordering_manage_trash' => 'Quản lý thùng rác đơn hàng',
	'product_ordering_manage' => 'Quản lý đơn hàng',
	
	'order_shipping' => 'Phương thức vận chuyển',
	'order_shipping_add' => 'Thêm phương thức vận chuyển mới',
	'order_shipping_edit' => 'Cập nhật phương thức vận chuyển',
	'order_shipping_del' => 'Xóa phương thức vận chuyển',
	'order_shipping_manage_trash' => 'Quản lý thùng rác phương thức vận chuyển',
	'order_shipping_manage' => 'Quản lý phương thức vận chuyển',
	
	'product_order_method' => 'Phương thức thanh toán',
	'product_order_method_add' => 'Thêm phương thức thanh toán mới',
	'product_order_method_edit' => 'Cập nhật phương thức thanh toán',
	'product_order_method_setting' => 'Cấu hình phương thức thanh toán',
	'product_order_method_del' => 'Xóa phương thức thanh toán',
	'product_order_method_manage_trash' => 'Quản lý thùng rác phương thức thanh toán',
	'product_order_method_manage' => 'Quản lý phương thức thanh toán',
	
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
	
	'col_picture' => 'Hình ảnh',
	'col_title' => 'Sản phẩm',
	'col_color' => 'Màu',
	'col_code_pic' => 'Mã hình',
	'col_price' => 'Giá',
	'col_quantity' => 'Số lượng',
	'col_total' => 'Tổng tiền',
	'col_delete' => 'Xóa',
	'cart_total' => 'TỔNG TIỀN',
	'total_order' => 'Tổng hóa đơn',
	'status_order' => 'Trạng thái hóa đơn',
	
	);
?>