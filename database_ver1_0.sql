-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2015 at 03:19 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `database_ver1.0`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE IF NOT EXISTS `about` (
`id` int(10) unsigned NOT NULL,
  `item_id` int(11) NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `group_nav` varchar(250) NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `is_focus` tinyint(1) NOT NULL DEFAULT '0',
  `is_focus1` tinyint(4) NOT NULL,
  `is_focus2` tinyint(4) NOT NULL,
  `is_focus3` tinyint(4) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`id`, `item_id`, `group_id`, `group_nav`, `picture`, `title`, `short`, `content`, `friendly_link`, `meta_title`, `meta_key`, `meta_desc`, `show_order`, `is_show`, `is_focus`, `is_focus1`, `is_focus2`, `is_focus3`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, 0, '', 'about/2015_03/131010hinh-hai-qua-bong-thuy-tinh-long-lanh.jpg', 'Giới thiệu công ty', '&lt;p&gt;M&amp;ocirc; tả ngắn&lt;/p&gt;', '&lt;p&gt;Nội dung&lt;/p&gt;', 'gioi-thieu-cong-ty-1', 'Giới thiệu công ty | Gioi thieu cong ty', 'Giới thiệu công ty, Gioi thieu cong ty', 'Nội dung', 0, 1, 1, 0, 0, 0, 1425283827, 1425283927, 'vi'),
(2, 1, 0, '', 'about/2015_03/131010hinh-hai-qua-bong-thuy-tinh-long-lanh.jpg', 'Giới thiệu công ty', '&lt;p&gt;M&amp;ocirc; tả ngắn&lt;/p&gt;', '&lt;p&gt;Nội dung&lt;/p&gt;', 'gioi-thieu-cong-ty-3', 'Giới thiệu công ty | Gioi thieu cong ty', 'Giới thiệu công ty, Gioi thieu cong ty', 'Nội dung', 0, 1, 1, 0, 0, 0, 1425283827, 1425283927, 'en'),
(3, 3, 0, '', 'about/2015_03/131010hinh-hai-qua-bong-thuy-tinh-long-lanh.jpg', 'Giới thiệu công ty', '&lt;p&gt;M&amp;ocirc; tả ngắn&lt;/p&gt;', '&lt;p&gt;Nội dung&lt;/p&gt;', 'gioi-thieu-cong-ty-4', 'Giới thiệu công ty | Gioi thieu cong ty', 'Giới thiệu công ty, Gioi thieu cong ty', 'Nội dung', 0, 1, 0, 0, 0, 0, 1425283848, 1425283848, 'vi'),
(4, 3, 0, '', 'about/2015_03/131010hinh-hai-qua-bong-thuy-tinh-long-lanh.jpg', 'Giới thiệu công ty', '&lt;p&gt;M&amp;ocirc; tả ngắn&lt;/p&gt;', '&lt;p&gt;Nội dung&lt;/p&gt;', 'gioi-thieu-cong-ty-3-1', 'Giới thiệu công ty | Gioi thieu cong ty', 'Giới thiệu công ty, Gioi thieu cong ty', 'Nội dung', 0, 1, 0, 0, 0, 0, 1425283827, 1425283827, 'en'),
(5, 5, 0, '', 'about/2015_03/131010hinh-hai-qua-bong-thuy-tinh-long-lanh.jpg', 'test', '&lt;p&gt;M&amp;ocirc; tả ngắn&lt;/p&gt;', '&lt;p&gt;Nội dung&lt;/p&gt;', 'test-2', 'test | test', 'test, test', 'Nội dung', 0, 1, 0, 0, 0, 0, 1425353669, 1425353669, 'vi'),
(6, 5, 0, '', 'about/2015_03/131010hinh-hai-qua-bong-thuy-tinh-long-lanh.jpg', 'test', '&lt;p&gt;M&amp;ocirc; tả ngắn&lt;/p&gt;', '&lt;p&gt;Nội dung&lt;/p&gt;', 'test-3', 'test | test', 'test, test', 'Nội dung', 0, 1, 0, 0, 0, 0, 1425353669, 1425353669, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `about_setting`
--

CREATE TABLE IF NOT EXISTS `about_setting` (
`id` int(11) NOT NULL,
  `about_meta_title` varchar(250) NOT NULL,
  `about_meta_key` text NOT NULL,
  `about_meta_desc` text NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(10) unsigned NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi',
  `background` varchar(250) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `about_setting`
--

INSERT INTO `about_setting` (`id`, `about_meta_title`, `about_meta_key`, `about_meta_desc`, `num_list`, `num_order_detail`, `lang`, `background`) VALUES
(1, 'Trang', '', '', 10, 5, 'vi', ''),
(2, 'aboutus', '', '', 10, 10, 'en', '');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
`id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `picture` varchar(250) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `email` varchar(250) NOT NULL,
  `date_login` int(11) NOT NULL,
  `session` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `group_id`, `username`, `password`, `picture`, `full_name`, `email`, `date_login`, `session`) VALUES
(1, -1, 'admin', '91739eb0a14999c738a8cea3691902d7', '', 'Phan Văn Liền', 'phanlien1093@gmail.com', 1435406290, 'cd61a580392a70389e27b0bc2b439f49');

-- --------------------------------------------------------

--
-- Table structure for table `admin_group`
--

CREATE TABLE IF NOT EXISTS `admin_group` (
`group_id` int(11) NOT NULL,
  `arr_title` text NOT NULL,
  `arr_powers` text NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `date_create` int(10) unsigned NOT NULL,
  `date_update` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_group`
--

INSERT INTO `admin_group` (`group_id`, `arr_title`, `arr_powers`, `show_order`, `is_show`, `date_create`, `date_update`) VALUES
(1, 'a:1:{s:2:"vi";s:4:"test";}', 'a:2:{s:6:"config";a:4:{s:6:"config";a:3:{s:3:"add";s:3:"add";s:4:"edit";s:4:"edit";s:6:"manage";s:6:"manage";}s:4:"lang";a:3:{s:4:"edit";s:4:"edit";s:6:"manage";s:6:"manage";s:5:"trash";s:5:"trash";}s:7:"support";a:3:{s:6:"manage";s:6:"manage";s:5:"trash";s:5:"trash";s:7:"restore";s:7:"restore";}s:14:"template_email";a:3:{s:6:"manage";s:6:"manage";s:5:"trash";s:5:"trash";s:7:"restore";s:7:"restore";}}s:17:"repository_export";a:1:{s:14:"receipt_export";a:5:{s:4:"edit";s:4:"edit";s:9:"duplicate";s:9:"duplicate";s:6:"manage";s:6:"manage";s:5:"trash";s:5:"trash";s:7:"restore";s:7:"restore";}}}', 0, 1, 1401695465, 1401695571);

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE IF NOT EXISTS `admin_menu` (
`menu_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `is_type` varchar(50) NOT NULL DEFAULT 'module',
  `name_action` varchar(50) NOT NULL,
  `icon_menu` varchar(50) NOT NULL,
  `arr_title` text NOT NULL,
  `list_sub` varchar(250) NOT NULL,
  `is_show` tinyint(4) NOT NULL DEFAULT '1',
  `show_order` float NOT NULL DEFAULT '0',
  `date_create` int(10) unsigned NOT NULL,
  `date_update` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`menu_id`, `parent_id`, `is_type`, `name_action`, `icon_menu`, `arr_title`, `list_sub`, `is_show`, `show_order`, `date_create`, `date_update`) VALUES
(1, 0, 'module', 'config', 'fa-folder', 'a:2:{s:2:"vi";s:24:"Cấu hình hệ thống";s:2:"en";s:22:"Configuring the system";} ', 'add,edit,manage,trash,restore,del', 1, 100, 0, 0),
(2, 1, 'action', 'config', 'fa-wrench', 'a:2:{s:2:"vi";s:24:"Cấu hình hệ thống";s:2:"en";s:22:"Configuring the system";} ', 'add,edit,manage,trash,restore,del', 1, 0, 0, 0),
(3, 0, 'module', 'about', 'fa-folder', 'a:2:{s:2:"vi";s:30:"Quản lý bài giới thiệu";s:2:"en";s:12:"Manage about";} ', 'add,edit,manage,trash,restore,del', 1, 96, 0, 0),
(4, 3, 'action', 'setting', 'fa-wrench', 'a:2:{s:2:"vi";s:11:"Cấu hình";s:2:"en";s:13:"Configuration";} ', 'add,edit,manage,trash,restore,del', 1, 0, 0, 0),
(5, 3, 'action', 'about', 'fa-list', 'a:2:{s:2:"vi";s:30:"Quản lý bài giới thiệu";s:2:"en";s:12:"Manage about";} ', 'add,edit,manage,trash,restore,del', 1, 0, 0, 0),
(6, 0, 'module', 'page', 'fa-folder', 'a:2:{s:2:"vi";s:22:"Quản lý trang tĩnh";s:2:"en";s:11:"Manage page";}', 'add,edit,manage,trash,restore,del', 1, 95, 0, 0),
(7, 6, 'action', 'setting', 'fa-wrench', 'a:2:{s:2:"vi";s:11:"Cấu hình";s:2:"en";s:13:"Configuration";} ', 'add,edit,manage,trash,restore,del', 1, 0, 0, 0),
(8, 6, 'action', 'group', 'fa-list', 'a:2:{s:2:"vi";s:22:"Quản lý nhóm trang";s:2:"en";s:17:"Manage group page";} ', 'add,edit,manage,trash,restore,del', 1, 0, 0, 0),
(9, 6, 'action', 'page', 'fa-list', 'a:2:{s:2:"vi";s:16:"Quản lý trang";s:2:"en";s:11:"Manage page";} ', 'add,edit,manage,trash,restore,del', 1, 0, 0, 0),
(10, 0, 'module', 'library', 'fa-folder', 'a:2:{s:2:"vi";s:22:"Quản lý thư viện";s:2:"en";s:14:"Manage library";} ', 'add,edit,manage,trash,restore,del', 1, -10, 0, 0),
(11, 10, 'action', 'library', 'fa-folder', 'a:2:{s:2:"vi";s:22:"Quản lý thư viện";s:2:"en";s:14:"Manage library";} ', 'add,edit,manage,trash,restore,del', 1, 0, 0, 0),
(12, 0, 'module', 'banner', 'fa-folder', 'a:2:{s:2:"vi";s:23:"Quản lý banner, logo";s:2:"en";s:19:"Manage banner, logo";}', 'add,edit,manage,trash,restore,del', 1, -9, 0, 0),
(13, 12, 'action', 'group', 'fa-folder', 'a:2:{s:2:"vi";s:20:"Quản lý vị trí";s:2:"en";s:10:"Manage pos";}', 'add,edit,manage,trash,restore,del', 1, 0, 0, 0),
(14, 12, 'action', 'banner', 'fa-folder', 'a:2:{s:2:"vi";s:23:"Quản lý banner, logo";s:2:"en";s:19:"Manage banner, logo";}', 'add,edit,manage,trash,restore,del', 1, 0, 0, 0),
(15, 0, 'module', 'layout', 'fa-folder', 'a:2:{s:2:"vi";s:25:"Hình thức, giao diện";s:2:"en";s:13:"Manage layout";} ', 'add,edit,manage,trash,restore,del', 1, -8, 0, 0),
(16, 15, 'action', 'menu', 'fa-list', 'a:2:{s:2:"vi";s:15:"Quản lý menu";s:2:"en";s:11:"Manage menu";} ', 'add,edit,manage,trash,restore,del', 1, 0, 0, 0),
(17, 0, 'module', 'contact', 'fa-folder', 'a:2:{s:2:"vi";s:21:"Quản lý liên hệ";s:2:"en";s:14:"Manage contact";} ', 'add,edit,manage,trash,restore,del', 1, 98, 0, 0),
(18, 17, 'action', 'contact_map', 'fa-list', 'a:2:{s:2:"vi";s:21:"Quản lý nội dung";s:2:"en";s:14:"Manage content";} ', 'add,edit,manage,trash,restore,del', 1, 1, 0, 0),
(19, 17, 'action', 'contact', 'fa-list', 'a:2:{s:2:"vi";s:21:"Quản lý liên hệ";s:2:"en";s:14:"Manage contact";}', 'add,edit,manage,trash,restore,del', 1, 0, 0, 0),
(20, 17, 'action', 'setting', 'fa-list', 'a:2:{s:2:"vi";s:11:"Cấu hình";s:2:"en";s:13:"Configuration";}', 'add,edit,manage,trash,restore,del', 1, 2, 0, 0),
(21, 0, 'module', 'product', 'fa-folder', 'a:2:{s:2:"vi";s:23:"Quản lý sản phẩm";s:2:"en";s:14:"Manage product";} ', 'add,edit,manage,trash,restore,del', 1, 80, 0, 0),
(22, 21, 'action', 'setting', 'fa-list', 'a:2:{s:2:"vi";s:11:"Cấu hình";s:2:"en";s:13:"Configuration";}', 'add,edit,manage,trash,restore,del', 1, 10, 0, 0),
(23, 21, 'action', 'group', 'fa-list', 'a:2:{s:2:"vi";s:29:"Quản lý nhóm sản phẩm";s:2:"en";s:17:"Manage group page";}', 'add,edit,manage,trash,restore,del', 1, 9, 0, 1392811655),
(24, 21, 'action', 'product', 'fa-list', 'a:2:{s:2:"vi";s:23:"Quản lý sản phẩm";s:2:"en";s:14:"Manage product";}', 'add,edit,manage,trash,restore,del', 1, 0, 0, 0),
(25, 21, 'action', 'brand', 'fa-list', 'a:2:{s:2:"vi";s:26:"Quản lý thương hiệu";s:2:"en";s:26:"Quản lý thương hiệu";}', 'add,edit,manage,trash,restore,del', 1, 8, 1392356968, 1392356968),
(26, 21, 'action', 'option', 'fa-list', 'a:2:{s:2:"vi";s:24:"Tính năng sản phẩm";s:2:"en";s:24:"Tính năng sản phẩm";}', 'add,edit,manage,trash,restore,del', 1, 7, 1392372571, 1392372571),
(27, 1, 'action', 'lang', 'fa-list', 'a:2:{s:2:"vi";s:22:"Quản lý ngôn ngữ";s:2:"en";s:22:"Quản lý ngôn ngữ";}', 'add,edit,manage,trash,restore,del', 1, 0, 1392864959, 1392864959),
(28, 0, 'module', 'home', 'fa-folder', 'a:2:{s:2:"vi";s:11:"Manage home";s:2:"en";s:11:"Manage home";}', 'add,edit,manage,trash,restore,del', 1, 97, 1392886984, 1392886984),
(29, 28, 'action', 'setting', 'fa-list', 'a:2:{s:2:"vi";s:11:"Cấu hình";s:2:"en";s:11:"Cấu hình";}', 'add,edit,manage,trash,restore,del', 1, 0, 1392887016, 1392887016),
(30, 0, 'module', 'news', 'fa-folder', 'a:2:{s:2:"vi";s:23:"Tin tức & Sự kiện";s:2:"en";s:23:"Tin tức & Sự kiện";}', 'add,edit,manage,trash,restore,del', 1, 0, 1393923318, 1393923318),
(31, 30, 'action', 'setting', 'fa-list', 'a:2:{s:2:"vi";s:11:"Cấu hình";s:2:"en";s:11:"Cấu hình";}', 'add,edit,manage,trash,restore,del', 1, 0, 1393923361, 1393923361),
(32, 30, 'action', 'group', 'fa-list', 'a:2:{s:2:"vi";s:20:"Quản lý nhóm tin";s:2:"en";s:20:"Quản lý nhóm tin";}', 'add,edit,manage,trash,restore,del', 1, 0, 1393923389, 1393923389),
(33, 30, 'action', 'news', 'fa-list', 'a:2:{s:2:"vi";s:14:"Quản lý tin";s:2:"en";s:14:"Quản lý tin";}', 'add,edit,manage,trash,restore,del', 1, 0, 1393923737, 1393923737),
(34, 0, 'module', 'gallery', 'fa-folder', 'a:2:{s:2:"vi";s:17:"Thư viện hình";s:2:"en";s:17:"Thư viện hình";}', 'add,edit,manage,trash,restore,del', 1, 0, 1394006218, 1394006218),
(35, 34, 'action', 'setting', 'fa-list', 'a:2:{s:2:"vi";s:11:"Cấu hình";s:2:"en";s:11:"Cấu hình";}', 'add,edit,manage,trash,restore,del', 1, 0, 1394006246, 1394006246),
(36, 34, 'action', 'group', 'fa-list', 'a:2:{s:2:"vi";s:16:"Quản lý nhóm";s:2:"en";s:16:"Quản lý nhóm";}', 'add,edit,manage,trash,restore,del', 1, 0, 1394006278, 1394006278),
(37, 34, 'action', 'gallery', 'fa-list', 'a:2:{s:2:"vi";s:16:"Quản lý hình";s:2:"en";s:16:"Quản lý hình";}', 'add,edit,manage,trash,restore,del', 1, 0, 1394006294, 1394006294),
(38, 0, 'module', 'admin', 'fa-folder', 'a:1:{s:2:"vi";s:25:"Tài khoản quản trị";}', 'add,edit,manage,trash,restore,del', 1, 99, 1394983368, 1394983368),
(39, 38, 'action', 'group', 'fa-list', 'a:1:{s:2:"vi";s:16:"Quản lý nhóm";}', 'add,edit,manage,trash,restore,del', 1, 0, 1394983568, 1394983568),
(40, 38, 'action', 'admin', 'fa-list', 'a:1:{s:2:"vi";s:23:"Quản lý tài khoản";}', 'add,edit,manage,trash,restore,del', 1, 0, 1394983589, 1394983589),
(41, 21, 'action', 'color', 'fa-list', 'a:1:{s:2:"vi";s:15:"Quản lý màu";}', 'add,edit,manage,trash,restore,del', 1, 6, 1395217382, 1395217382),
(42, 21, 'action', 'status', 'fa-list', 'a:1:{s:2:"vi";s:26:"Trạng thái sản phẩm";}', 'add,edit,manage,trash,restore,del', 1, 5, 1395717158, 1395717158),
(43, 1, 'action', 'support', 'fa-list', 'a:1:{s:2:"vi";s:25:"Hỗ trợ trực tuyến";}', 'add,edit,manage,trash,restore,del', 1, 0, 1395738093, 1395738093),
(44, 21, 'action', 'ordering', 'fa-list', 'a:1:{s:2:"vi";s:22:"Quản ký đơn hàng";}', 'edit,manage,trash,restore,del', 1, -2, 1395817787, 1395817787),
(45, 0, 'module', 'user', 'fa-folder', 'a:1:{s:2:"vi";s:23:"Quản lý thành viên";}', 'add,edit,manage,trash,restore,del', 1, 0, 1395888659, 1395888659),
(46, 45, 'action', 'setting', 'fa-list', 'a:1:{s:2:"vi";s:11:"Cấu hình";}', 'add,edit,manage,trash,restore,del', 1, 0, 1395888675, 1395888675),
(47, 45, 'action', 'user', 'fa-list', 'a:1:{s:2:"vi";s:23:"Danh sách thành viên";}', 'add,edit,manage,trash,restore,del', 1, 0, 1395888703, 1395888703),
(48, 21, 'action', 'order_shipping', 'fa-list', 'a:1:{s:2:"vi";s:30:"Phương thức vận chuyển";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1396281376, 1396281376),
(49, 21, 'action', 'order_method', 'fa-list', 'a:1:{s:2:"vi";s:27:"Phương thức thanh toán";}', 'add,edit,duplicate,manage,trash,restore,del', 1, -1, 1396281394, 1396281394),
(50, 21, 'action', 'size', 'fa-list', 'a:1:{s:2:"vi";s:15:"Quản lý size";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 4, 1396317848, 1398140155),
(51, 21, 'action', 'receipt', 'fa-list', 'a:1:{s:2:"vi";s:22:"Quản lý phiếu kho";}', 'add,edit,duplicate,manage,trash,restore,del', 1, -3, 1398240358, 1398240358),
(52, 0, 'module', 'ordering', 'fa-folder', 'a:1:{s:2:"vi";s:19:"Đơn hàng và kho";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 79, 1398303939, 1398303939),
(53, 52, 'action', 'receipt', 'fa-list', 'a:1:{s:2:"vi";s:22:"Quản lý phiếu kho";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1398303976, 1398304053),
(54, 56, 'action', 'repository', 'fa-list', 'a:1:{s:2:"vi";s:3:"Kho";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1398495627, 1398678657),
(55, 52, 'action', 'receipt_out', 'fa-list', 'a:1:{s:2:"vi";s:18:"Phiếu xuất kho";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1398495710, 1398495710),
(56, 0, 'module', 'repository', 'fa-folder', 'a:1:{s:2:"vi";s:3:"Kho";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 78, 1398672169, 1398672169),
(57, 56, 'action', 'method_group', 'fa-list', 'a:1:{s:2:"vi";s:22:"DM phương thức XNK";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1398672205, 1398672205),
(58, 56, 'action', 'method_import', 'fa-list', 'a:1:{s:2:"vi";s:22:"Phương thức nhập";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1398672289, 1398672289),
(59, 56, 'action', 'method_export', 'fa-list', 'a:1:{s:2:"vi";s:22:"Phương thức xuất";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1398672330, 1398672330),
(60, 0, 'module', 'repository_import', 'fa-folder', 'a:1:{s:2:"vi";s:21:"Quản lý nhập kho";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 77, 1398739765, 1398741401),
(61, 60, 'action', 'receipt', 'fa-list', 'a:1:{s:2:"vi";s:31:"Phiếu đề nghị nhập kho";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 10, 1398739793, 1399252705),
(62, 60, 'action', 'receipt_approved', 'fa-list', 'a:1:{s:2:"vi";s:33:"Phiếu đề nghị đã duyệt";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 9, 1398739824, 1399252729),
(63, 60, 'action', 'receipt_unapproved', 'fa-list', 'a:1:{s:2:"vi";s:34:"Phiếu đề nghị chưa duyệt";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 8, 1398739847, 1399252738),
(64, 60, 'action', 'stock', 'fa-list', 'a:1:{s:2:"vi";s:3:"Kho";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 5, 1398739865, 1398741458),
(65, 60, 'action', 'receipt_history', 'fa-list', 'a:1:{s:2:"vi";s:33:"Thống kê lịch sử mua hàng";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 6, 1398739886, 1399263829),
(66, 60, 'action', 'receipt_import', 'fa-list', 'a:1:{s:2:"vi";s:18:"Phiếu nhập kho";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 7, 1399252766, 1399257078),
(67, 0, 'module', 'repository_export', 'fa-folder', 'a:1:{s:2:"vi";s:21:"Quản lý xuất kho";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 76, 1399276283, 1399276283),
(68, 67, 'action', 'receipt_export', 'fa-list', 'a:1:{s:2:"vi";s:24:"Lập phiếu xuất kho";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1399276836, 1399276836),
(69, 67, 'action', 'ordering', 'fa-list', 'a:1:{s:2:"vi";s:22:"Quản ký đơn hàng";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1399276867, 1399276867),
(70, 0, 'module', 'voucher', 'fa-folder', 'a:1:{s:2:"vi";s:21:"Voucher & promotional";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 75, 1401093674, 1401093674),
(71, 70, 'action', 'voucher', 'fa-list', 'a:1:{s:2:"vi";s:7:"Voucher";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1401093713, 1401093713),
(72, 70, 'action', 'promotion', 'fa-list', 'a:1:{s:2:"vi";s:10:"Pomotional";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1401093840, 1401093840),
(73, 70, 'action', 'setting', 'fa-list', 'a:1:{s:2:"vi";s:11:"Cấu hình";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 10, 1401096668, 1401096668),
(74, 1, 'action', 'template_email', 'fa-list', 'a:1:{s:2:"vi";s:22:"Quản lý mẫu email";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1401165210, 1401165210),
(75, 70, 'action', 'ordering', 'fa-list', 'a:1:{s:2:"vi";s:23:"Đơn hàng mua voucher";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1401180136, 1401180136),
(76, 0, 'module', 'video', 'fa-folder', 'a:1:{s:2:"vi";s:16:"Quản lý video";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1405934794, 1405934794),
(77, 76, 'action', 'setting', 'fa-list', 'a:1:{s:2:"vi";s:11:"Cấu hình";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1405934809, 1405934809),
(78, 76, 'action', 'group', 'fa-list', 'a:1:{s:2:"vi";s:16:"Quản lý nhóm";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1405934822, 1405934822),
(79, 76, 'action', 'video', 'fa-list', 'a:1:{s:2:"vi";s:16:"Quản lý video";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1405934835, 1405934835),
(80, 1, 'action', 'location_area', 'fa-list', 'a:2:{s:2:"vi";s:20:"Quản lý khu vực";s:2:"en";s:20:"Quản lý khu vực";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1407210904, 1407210904),
(81, 1, 'action', 'location_country', 'fa-list', 'a:2:{s:2:"vi";s:21:"Quản lý quốc gia";s:2:"en";s:21:"Quản lý quốc gia";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1407210929, 1407210929),
(82, 1, 'action', 'location_province', 'fa-list', 'a:2:{s:2:"vi";s:32:"Quản lý Tỉnh / Thành phố";s:2:"en";s:32:"Quản lý Tỉnh / Thành phố";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1407210965, 1407210965),
(83, 1, 'action', 'location_district', 'fa-list', 'a:2:{s:2:"vi";s:27:"Quản lý quận / huyện";s:2:"en";s:25:"Quản lý quận huyện";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1407210999, 1407211039),
(84, 1, 'action', 'location_ward', 'fa-list', 'a:2:{s:2:"vi";s:26:"Quản lý phường / xã";s:2:"en";s:26:"Quản lý phường / xã";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1407211022, 1407211022),
(85, 0, 'module', 'service', 'fa-folder', 'a:1:{s:2:"vi";s:22:"Quản lý dịch vụ";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1421047911, 1421047911),
(86, 85, 'action', 'setting', 'fa-list', 'a:1:{s:2:"vi";s:11:"Cấu hình";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1421047945, 1421047945),
(87, 85, 'action', 'group', 'fa-list', 'a:1:{s:2:"vi";s:16:"Quản lý nhóm";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1421047971, 1421047971),
(88, 85, 'action', 'service', 'fa-list', 'a:1:{s:2:"vi";s:22:"Quản lý dịch vụ";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1421048010, 1421048010),
(89, 0, 'module', 'project', 'fa-folder', 'a:2:{s:2:"vi";s:19:"Quản lý dự án";s:2:"en";s:19:"Quản lý dự án";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1421373901, 1421373901),
(90, 89, 'action', 'setting', 'fa-list', 'a:2:{s:2:"vi";s:11:"Cấu hình";s:2:"en";s:11:"Cấu hình";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1421373919, 1421373919),
(91, 89, 'action', 'group', 'fa-list', 'a:2:{s:2:"vi";s:16:"Quản lý nhóm";s:2:"en";s:16:"Quản lý nhóm";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1421373937, 1421373937),
(92, 89, 'action', 'project', 'fa-list', 'a:2:{s:2:"vi";s:19:"Quản lý dự án";s:2:"en";s:19:"Quản lý dự án";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1421373960, 1421373960),
(93, 0, 'module', 'download', 'fa-folder', 'a:2:{s:2:"vi";s:19:"Quản lý download";s:2:"en";s:19:"Quản lý download";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1422842914, 1422842914),
(94, 93, 'action', 'setting', 'fa-list', 'a:2:{s:2:"vi";s:11:"Cấu hình";s:2:"en";s:11:"Cấu hình";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1422843000, 1422843000),
(95, 93, 'action', 'group', 'fa-list', 'a:2:{s:2:"vi";s:16:"Quản lý nhóm";s:2:"en";s:16:"Quản lý nhóm";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1422843021, 1422843021),
(96, 93, 'action', 'download', 'fa-list', 'a:2:{s:2:"vi";s:19:"Quản lý download";s:2:"en";s:19:"Quản lý download";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1422843298, 1422843298),
(97, 15, 'action', 'widget', 'fa-list', 'a:2:{s:2:"vi";s:6:"Widget";s:2:"en";s:6:"Widget";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1423882852, 1423882852),
(98, 15, 'action', 'sidebar', 'fa-list', 'a:2:{s:2:"vi";s:18:"Quản lý sidebar";s:2:"en";s:18:"Quản lý sidebar";}', 'add,edit,duplicate,manage,trash,restore,del', 1, 0, 1423882872, 1423882872);

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
`id` int(10) unsigned NOT NULL,
  `banner_id` int(11) NOT NULL,
  `group_id` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `title` varchar(250) NOT NULL,
  `link_type` varchar(20) NOT NULL DEFAULT 'site',
  `link` varchar(250) NOT NULL,
  `target` varchar(20) NOT NULL DEFAULT '_blank',
  `content` text NOT NULL,
  `date_begin` int(10) NOT NULL,
  `date_end` int(10) NOT NULL,
  `show_mod` text NOT NULL,
  `show_act` text NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `date_create` int(10) unsigned NOT NULL,
  `date_update` int(10) unsigned NOT NULL,
  `lang` varchar(20) NOT NULL DEFAULT 'vi'
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `banner_id`, `group_id`, `type`, `title`, `link_type`, `link`, `target`, `content`, `date_begin`, `date_end`, `show_mod`, `show_act`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, 'logo', 'image', 'Công Ty TNHH Giải Pháp IMS', 'site', '', '_self', 'banner/2015_01/IMS_logo.png', 0, 0, '', '', 0, 1, 1407469101, 1421222311, 'vi'),
(3, 3, 'footer', 'text', '', 'site', '', '_self', '<div style="text-align: center;">Sử dụng nội dung ở trang n&agrave;y v&agrave; dịch vụ tại IMS c&oacute; nghĩa l&agrave; bạn đồng &yacute; với Thỏa thuận sử dụng v&agrave; Ch&iacute;nh s&aacute;ch bảo mật của ch&uacute;ng t&ocirc;i.</div>\r\n<div style="text-align: center;">Copyright &copy; IMS. All right Reserved.</div>', 0, 0, '', '', 0, 1, 1407476242, 1421402366, 'vi'),
(6, 6, 'share', 'image', 'Facebook', 'web', 'http://www.facebook.com', '_blank', 'banner/2015_01/share-02.gif', 0, 0, '', '', 9, 1, 1407922065, 1421744694, 'vi'),
(7, 7, 'ordering-complete', 'text', 'Thông báo đặt hàng thành công', 'site', '', '_self', '<p>Cảm ơn qu&yacute; kh&aacute;ch đ&atilde; đặt h&agrave;ng tại c&ocirc;ng ty ch&uacute;ng t&ocirc;i!</p>\r\n<p>Đơn h&agrave;ng sẽ được xử l&yacute; trong 24h</p>', 0, 0, '', '', 0, 1, 1408091839, 1408091839, 'vi'),
(8, 8, 'cart-empty', 'text', 'Thông báo giỏ hàng rỗng', 'site', '', '_self', '<p>Hiện tại giỏ h&agrave;ng của bạn đang rỗng!</p>\r\n<p>Vui l&ograve;ng chọn sản phẩm mua để thanh to&aacute;n!</p>', 0, 0, '', '', 0, 1, 1408093957, 1408093957, 'vi'),
(9, 9, 'share', 'image', 'Twitter', 'site', 'http://www.twitter.com', '_self', '2014_09/share_5edde6329a43b114519cbdbcb7f0b0b7.jpg', 0, 0, '', '', 10, 0, 1410860532, 1410860532, 'vi'),
(10, 10, 'share', 'image', 'Youtube', 'web', 'http://www.youtube.com', '_blank', 'banner/2015_01/share.gif', 0, 0, '', '', 0, 1, 1410860573, 1421744756, 'vi'),
(14, 14, 'header', 'image', '', 'site', '', '_self', 'banner/2014_11/share_mess.gif', 0, 0, '', '', 0, 1, 1415352279, 1415352279, 'vi'),
(15, 15, 'slogan', 'image', '', 'site', '', '_self', 'banner/2014_11/slogan.png', 0, 0, '', '', 0, 1, 1415353339, 1415353339, 'vi'),
(16, 16, 'banner-main', 'image', 'bbgreen', 'site', '', '_self', 'banner/2014_11/banner_main.jpg', 0, 0, '', '', 0, 1, 1415601898, 1415601898, 'vi'),
(17, 17, 'banner-main', 'image', 'main banner', 'site', '', '_self', 'banner/2015_01/banner-main-1.jpg', 0, 0, '', '', 0, 1, 1415601928, 1421303944, 'vi'),
(18, 18, 'gallery', 'image', '', 'site', '', '_self', 'banner/2014_11/Jellyfish.jpg', 0, 0, '', '', 0, 1, 1415688590, 1415688590, 'vi'),
(19, 19, 'gallery', 'image', '', 'site', '', '_self', 'banner/2014_11/Koala.jpg', 0, 0, '', '', 0, 1, 1415688598, 1415688598, 'vi'),
(20, 20, 'gallery', 'image', '', 'site', '', '_self', 'banner/2014_11/Lighthouse.jpg', 0, 0, '', '', 0, 1, 1415688605, 1415688605, 'vi'),
(21, 21, 'gallery', 'image', '', 'site', '', '_self', 'banner/2014_11/Penguins.jpg', 0, 0, '', '', 0, 1, 1415688613, 1415688613, 'vi'),
(22, 22, 'support', 'text', '', 'site', '', '_self', '<p>016.88888.163<br />C.Thanh</p>\r\n<p>09.3737.1818<br />A.Thắng</p>', 0, 0, '', '', 0, 1, 1415693484, 1415693484, 'vi'),
(23, 23, 'under-construction', 'text', '', 'site', '', '_self', '<p style="text-align: center;"><span style="font-size: 18pt;">Trang web của ch&uacute;ng t&ocirc;i đang x&acirc;y dựng! Vui l&ograve;ng quay lại sau!</span></p>', 0, 0, '', '', 0, 1, 1420617526, 1420617526, 'vi'),
(24, 24, 'bank', 'image', '', 'site', '', '_self', 'banner/2015_01/bank.jpg', 0, 0, '', '', 0, 1, 1421317249, 1421317249, 'vi'),
(25, 24, 'bank', 'image', '', 'site', '', '_self', 'banner/2015_01/bank.jpg', 0, 0, '', '', 0, 1, 1421317249, 1421317249, 'en'),
(26, 26, 'bank', 'image', '', 'site', '', '_self', 'banner/2015_01/bank-02.jpg', 0, 0, '', '', 0, 1, 1421317306, 1421317306, 'vi'),
(27, 26, 'bank', 'image', '', 'site', '', '_self', 'banner/2015_01/bank-02.jpg', 0, 0, '', '', 0, 1, 1421317306, 1421317306, 'en'),
(28, 28, 'bank', 'image', '', 'site', '', '_self', 'banner/2015_01/bank-03.jpg', 0, 0, '', '', 0, 1, 1421317318, 1421317318, 'vi'),
(29, 28, 'bank', 'image', '', 'site', '', '_self', 'banner/2015_01/bank-03.jpg', 0, 0, '', '', 0, 1, 1421317318, 1421317318, 'en'),
(30, 30, 'bank', 'image', '', 'site', '', '_self', 'banner/2015_01/bank-04.jpg', 0, 0, '', '', 0, 1, 1421317328, 1421317328, 'vi'),
(31, 31, 'bank', 'image', '', 'site', '', '_self', 'banner/2015_01/bank-04.jpg', 0, 0, '', '', 0, 1, 1421317328, 1421317328, 'en'),
(32, 32, 'bank', 'image', '', 'site', '', '_self', 'banner/2015_01/bank-05.jpg', 0, 0, '', '', 0, 1, 1421317337, 1421317337, 'vi'),
(33, 33, 'bank', 'image', '', 'site', '', '_self', 'banner/2015_01/bank-05.jpg', 0, 0, '', '', 0, 1, 1421317337, 1421317337, 'en'),
(34, 1, 'logo', 'image', 'Công Ty TNHH Giải Pháp IMS', 'site', '', '_self', 'banner/2015_01/IMS_logo.png', 0, 0, '', '', 0, 1, 1407469101, 1421222311, 'en'),
(35, 35, 'share', 'image', 'Twitter', 'web', 'http://www.twitter.com', '_blank', 'banner/2015_01/share-03.gif', 0, 0, '', '', 0, 1, 1421744792, 1421744792, 'vi'),
(36, 35, 'share', 'image', 'Twitter', 'web', 'http://www.twitter.com', '_blank', 'banner/2015_01/share-03.gif', 0, 0, '', '', 0, 1, 1421744792, 1421744792, 'en'),
(37, 37, 'share', 'image', 'Google', 'web', 'http://google.com', '_blank', 'banner/2015_01/share-04.gif', 0, 0, '', '', 0, 1, 1421744810, 1421744828, 'vi'),
(38, 37, 'share', 'image', 'Google', 'web', 'http://google.com', '_blank', 'banner/2015_01/share-04.gif', 0, 0, '', '', 0, 1, 1421744810, 1421744828, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `banner_group`
--

CREATE TABLE IF NOT EXISTS `banner_group` (
  `group_id` varchar(50) NOT NULL,
  `arr_title` text NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `type_show` varchar(20) NOT NULL DEFAULT 'fixed',
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `date_create` int(10) unsigned NOT NULL,
  `date_update` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banner_group`
--

INSERT INTO `banner_group` (`group_id`, `arr_title`, `width`, `height`, `type_show`, `show_order`, `is_show`, `date_create`, `date_update`) VALUES
('bank', 'a:2:{s:2:"vi";s:11:"Ngân hàng";s:2:"en";s:11:"Ngân hàng";}', 102, 50, 'full', 0, 1, 1421317164, 1421317164),
('banner-main', 'a:2:{s:2:"vi";s:13:"Banner chính";s:2:"en";s:13:"Banner chính";}', 0, 0, 'full', 0, 1, 1393908826, 1421303885),
('cart-empty', 'a:1:{s:2:"vi";s:30:"Thông báo giỏ hàng rỗng";}', 800, 0, 'fixed', 0, 1, 1408093869, 1408093869),
('content', 'a:2:{s:2:"vi";s:16:"Nội dung tĩnh";s:2:"en";s:22:"Nội dung trang chủ";}', 725, 0, 'fixed', 0, 1, 1392038710, 1395710846),
('footer', 'a:2:{s:2:"vi";s:12:"Cuối trang";s:2:"en";s:23:"Nội dung cuối trang";}', 500, 0, 'fixed', -10, 1, 1393814759, 1415354805),
('footer-banner1', 'a:1:{s:2:"vi";s:21:"Banner cuối trang 1";}', 255, 70, 'fixed', 0, 0, 1400747734, 1400747734),
('footer-banner2', 'a:1:{s:2:"vi";s:21:"Banner cuối trang 2";}', 444, 70, 'fixed', 0, 0, 1400747747, 1400747747),
('gallery', 'a:1:{s:2:"vi";s:19:"Hình chụp khách";}', 108, 167, 'fixed', 0, 1, 1415688513, 1415689825),
('header', 'a:2:{s:2:"vi";s:12:"Đầu trang";s:2:"en";s:12:"Đầu trang";}', 342, 38, 'fixed', 99, 1, 1391611737, 1415352246),
('header-tool', 'a:2:{s:2:"vi";s:11:"Header tool";s:2:"en";s:38:"Tin hiệu ứng dưới banner chính";}', 70, 80, 'fixed', 98, 0, 1393994588, 1395116583),
('header1', 'a:1:{s:2:"vi";s:14:"Đầu trang 1";}', 220, 50, 'fixed', 98, 0, 1400638125, 1400638125),
('hotline-footer', 'a:1:{s:2:"vi";s:20:"Hotline cuối trang";}', 160, 0, 'fixed', 0, 0, 1396607739, 1396608026),
('left', 'a:1:{s:2:"vi";s:12:"Banner trái";}', 180, 0, 'fixed', 0, 0, 1397444134, 1397444134),
('logo', 'a:2:{s:2:"vi";s:4:"Logo";s:2:"en";s:4:"Logo";}', 185, 100, 'full', 100, 1, 1391610951, 1421222234),
('logo-footer', 'a:2:{s:2:"vi";s:17:"Logo cuối trang";s:2:"en";s:17:"Logo cuối trang";}', 82, 41, 'fixed', -11, 0, 1393840329, 1393840329),
('ordering-complete', 'a:1:{s:2:"vi";s:37:"Thông báo đặt hàng thành công";}', 800, 0, 'fixed', 0, 1, 1408091759, 1408091759),
('right', 'a:2:{s:2:"vi";s:17:"Cột bên phải";s:2:"en";s:17:"Cột bên phải";}', 184, 0, 'fixed', -9, 0, 1391611851, 1395735328),
('right-top', 'a:1:{s:2:"vi";s:26:"Cột phải (Trên cùng)";}', 198, 0, 'fixed', -8, 0, 1395735220, 1395735220),
('share', 'a:1:{s:2:"vi";s:26:"Chia sẻ mạng xã hội";}', 33, 31, 'fixed', 0, 1, 1395743114, 1421744564),
('signup', 'a:1:{s:2:"vi";s:17:"Create An Account";}', 356, 0, 'fixed', 0, 1, 1401263915, 1401263915),
('slogan', 'a:1:{s:2:"vi";s:5:"Sogan";}', 662, 33, 'fixed', 97, 1, 1400638211, 1415353287),
('support', 'a:1:{s:2:"vi";s:25:"Hỗ trợ trực tuyến";}', 124, 0, 'fixed', 0, 1, 1395738853, 1415693451),
('under-construction', 'a:1:{s:2:"vi";s:18:"Under construction";}', 0, 0, 'full', 0, 1, 1420616861, 1420616861),
('welcome', 'a:1:{s:2:"vi";s:7:"welcome";}', 760, 0, 'fixed', 0, 0, 1400734580, 1400734580);

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
`id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `hotline` varchar(250) NOT NULL,
  `hotline_support` varchar(250) NOT NULL,
  `fax` varchar(250) NOT NULL,
  `n_list` int(11) NOT NULL DEFAULT '30',
  `ad_skin` varchar(50) NOT NULL,
  `lang_view` varchar(4) NOT NULL DEFAULT 'vi',
  `skin` varchar(50) NOT NULL DEFAULT 'default',
  `method_email` varchar(20) NOT NULL DEFAULT 'smtp',
  `smtp_host` varchar(250) NOT NULL,
  `smtp_port` int(11) NOT NULL,
  `smtp_username` varchar(250) NOT NULL,
  `smtp_password` varchar(250) NOT NULL,
  `visitors_start` int(11) NOT NULL,
  `fanpage_facebook` varchar(250) NOT NULL,
  `share_link` varchar(250) NOT NULL,
  `share_title` varchar(250) NOT NULL,
  `is_under_construction` tinyint(4) NOT NULL DEFAULT '0',
  `date_check` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `email`, `hotline`, `hotline_support`, `fax`, `n_list`, `ad_skin`, `lang_view`, `skin`, `method_email`, `smtp_host`, `smtp_port`, `smtp_username`, `smtp_password`, `visitors_start`, `fanpage_facebook`, `share_link`, `share_title`, `is_under_construction`, `date_check`) VALUES
(1, 'phanlien1093@gmail.com', '01697339242', '', '', 20, 'default', 'vi', 'blue', 'gmail', 'smtp.gmail.com', 465, 'imshostemail@gmail.com', 'AaBbCc1122', 500, 'https://www.facebook.com/chuot.chui.37', '', 'lien_cms', 0, 1421638054);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
`contact_id` int(10) unsigned NOT NULL,
  `full_name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `email_forward` varchar(250) NOT NULL,
  `address` varchar(250) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `re_title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `re_content` text NOT NULL,
  `is_status` tinyint(1) NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(10) unsigned NOT NULL,
  `date_update` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact_map`
--

CREATE TABLE IF NOT EXISTS `contact_map` (
`id` int(10) unsigned NOT NULL,
  `map_id` int(11) NOT NULL,
  `map_type` varchar(20) NOT NULL DEFAULT 'google_map',
  `map_latitude` float NOT NULL,
  `map_longitude` float NOT NULL,
  `title` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `map_information` text NOT NULL,
  `map_picture` varchar(250) NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact_map`
--

INSERT INTO `contact_map` (`id`, `map_id`, `map_type`, `map_latitude`, `map_longitude`, `title`, `short`, `content`, `map_information`, `map_picture`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, 'google_map', 10.7761, 106.672, 'Công ty', '&lt;p&gt;M&amp;ocirc; tả ngắn&lt;/p&gt;', '&lt;p&gt;Nội dung&lt;/p&gt;', '&lt;p&gt;fsadfsfds&lt;/p&gt;', '', 0, 1, 1425455383, 1425455400, 'vi'),
(2, 1, 'google_map', 10.7761, 106.672, 'Công ty', '&lt;p&gt;M&amp;ocirc; tả ngắn&lt;/p&gt;', '&lt;p&gt;Nội dung&lt;/p&gt;', '', '', 0, 1, 1425455383, 1425455400, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `contact_setting`
--

CREATE TABLE IF NOT EXISTS `contact_setting` (
`id` int(11) NOT NULL,
  `contact_meta_title` varchar(250) NOT NULL,
  `contact_meta_key` text NOT NULL,
  `contact_meta_desc` text NOT NULL,
  `contact_info` text NOT NULL,
  `contact_form` text NOT NULL,
  `email` varchar(250) NOT NULL,
  `num_order_detail` int(10) unsigned NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi',
  `background` varchar(250) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact_setting`
--

INSERT INTO `contact_setting` (`id`, `contact_meta_title`, `contact_meta_key`, `contact_meta_desc`, `contact_info`, `contact_form`, `email`, `num_order_detail`, `lang`, `background`) VALUES
(1, 'Thông tin liên hệ', '', '', '&lt;p&gt;&lt;span style=&quot;color: #ff0000; font-size: 14pt;&quot;&gt;TH&amp;Ocirc;NG TIN LI&amp;Ecirc;N HỆ&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Địa chỉ:&lt;/strong&gt; 856 Ta Quang Buu - Ward 5 - District 8 - HCM City &amp;ndash; Vietnam&lt;br /&gt;Giai Viet Building, Level 12, Block A2, Room 06&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Tel:&lt;/strong&gt; +84 8 5431 3825 Ext 101/102&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Fax.&lt;/strong&gt; +84 8 5431 3826&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Website:&lt;/strong&gt; www.neovn.com&lt;/p&gt;', '&lt;p&gt;&lt;span style=&quot;color: #ff0000; font-size: 14pt;&quot;&gt;TH&amp;Ocirc;NG TIN CỦA BẠN&lt;br /&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;Với mong muốn ng&amp;agrave;y c&amp;agrave;ng phục vụ kh&amp;aacute;ch h&amp;agrave;ng tốt hơn, ch&amp;uacute;ng t&amp;ocirc;i rất mong muốn nhận được &amp;yacute; kiến phản hồi từ Qu&amp;yacute; kh&amp;aacute;ch mua h&amp;agrave;ng. Bộ phận chăm s&amp;oacute;c kh&amp;aacute;ch h&amp;agrave;ng của ch&amp;uacute;ng t&amp;ocirc;i sẽ phản hồi trong thời gian sớm nhất.&lt;/p&gt;', 'ttthiep2007@gmail.com', 5, 'vi', ''),
(2, 'contact', '', '', '', '', 'ttthiep2007@gmail.com', 10, 'en', '');

-- --------------------------------------------------------

--
-- Table structure for table `dealer`
--

CREATE TABLE IF NOT EXISTS `dealer` (
`id` int(10) unsigned NOT NULL,
  `item_id` int(11) NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `group_nav` varchar(250) NOT NULL,
  `group_related` text NOT NULL,
  `picture` varchar(250) NOT NULL,
  `area` varchar(250) NOT NULL,
  `country` varchar(250) NOT NULL,
  `province` varchar(250) NOT NULL,
  `district` varchar(250) NOT NULL,
  `ward` varchar(250) NOT NULL,
  `address` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `map_latitude` float NOT NULL,
  `map_longitude` float NOT NULL,
  `map_information` text NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `is_focus` tinyint(1) NOT NULL DEFAULT '0',
  `is_focus1` tinyint(4) NOT NULL,
  `is_focus2` tinyint(4) NOT NULL,
  `is_focus3` tinyint(4) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dealer`
--

INSERT INTO `dealer` (`id`, `item_id`, `group_id`, `group_nav`, `group_related`, `picture`, `area`, `country`, `province`, `district`, `ward`, `address`, `title`, `phone`, `map_latitude`, `map_longitude`, `map_information`, `short`, `content`, `friendly_link`, `meta_title`, `meta_key`, `meta_desc`, `show_order`, `is_show`, `is_focus`, `is_focus1`, `is_focus2`, `is_focus3`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, 0, '', '', '', '', '', '', '', '', '', '', '', 21.5475, 39.1899, '&lt;p&gt;Map&lt;/p&gt;', '', '', '1428035655', ' | ', ', ', '', 0, 1, 0, 0, 0, 0, 1428035655, 1428035655, 'vi'),
(2, 1, 0, '', '', '', '', '', '', '', '', '', '', '', 21.5475, 39.1899, '&lt;p&gt;Map&lt;/p&gt;', '', '', '1428035655-1', ' | ', ', ', '', 0, 1, 0, 0, 0, 0, 1428035655, 1428035655, 'en'),
(3, 3, 0, '', '', 'dealer/2015_04/Hydrangeas.jpg', 'c6', 'vi', '08', '0802', '', '60 Nguyễn chí thanh, p. 7', 'Đại lý 1', '', 21.6125, 39.2204, '&lt;p&gt;Map 1&lt;/p&gt;', '', '&lt;p&gt;Nội dung&lt;/p&gt;', 'dai-ly-1', 'Đại lý 1 | Dai ly 1', 'Đại lý 1, Dai ly 1', 'Nội dung', 0, 1, 0, 0, 0, 0, 1428036383, 1428036760, 'vi'),
(4, 3, 0, '', '', 'dealer/2015_04/Hydrangeas.jpg', 'c6', 'vi', '08', '0802', '', '60 Nguyễn chí thanh, p. 7', 'Đại lý 1', '', 21.6125, 39.2204, '&lt;p&gt;Map&lt;/p&gt;', '', '&lt;p&gt;Nội dung&lt;/p&gt;', 'dai-ly-1-1', 'Đại lý 1 | Dai ly 1', 'Đại lý 1, Dai ly 1', 'Nội dung', 0, 1, 0, 0, 0, 0, 1428036383, 1428036760, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `dealer_group`
--

CREATE TABLE IF NOT EXISTS `dealer_group` (
`id` int(10) unsigned NOT NULL,
  `group_id` int(11) NOT NULL,
  `group_nav` varchar(250) NOT NULL,
  `group_level` tinyint(2) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `group_related` varchar(250) NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `pic_show` varchar(50) NOT NULL DEFAULT 'grid',
  `type_show` varchar(20) NOT NULL DEFAULT 'list_item',
  `num_show` int(11) NOT NULL,
  `is_focus` tinyint(1) NOT NULL DEFAULT '0',
  `is_show_menu` tinyint(1) NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dealer_setting`
--

CREATE TABLE IF NOT EXISTS `dealer_setting` (
`id` int(11) NOT NULL,
  `dealer_meta_title` varchar(250) NOT NULL,
  `dealer_meta_key` text NOT NULL,
  `dealer_meta_desc` text NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(10) unsigned NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi',
  `background` varchar(250) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dealer_setting`
--

INSERT INTO `dealer_setting` (`id`, `dealer_meta_title`, `dealer_meta_key`, `dealer_meta_desc`, `num_list`, `num_order_detail`, `lang`, `background`) VALUES
(1, 'Đại lý', '', '', 12, 5, 'vi', ''),
(2, 'Service', '', '', 10, 10, 'en', '');

-- --------------------------------------------------------

--
-- Table structure for table `download`
--

CREATE TABLE IF NOT EXISTS `download` (
`id` int(10) unsigned NOT NULL,
  `item_id` int(11) NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `group_nav` text NOT NULL,
  `picture` varchar(250) NOT NULL,
  `file` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `is_focus` tinyint(1) NOT NULL DEFAULT '0',
  `is_focus1` tinyint(4) NOT NULL,
  `is_focus2` tinyint(4) NOT NULL,
  `is_focus3` tinyint(4) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `download`
--

INSERT INTO `download` (`id`, `item_id`, `group_id`, `group_nav`, `picture`, `file`, `title`, `short`, `content`, `friendly_link`, `meta_title`, `meta_key`, `meta_desc`, `show_order`, `is_show`, `is_focus`, `is_focus1`, `is_focus2`, `is_focus3`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, 0, '', 'download/2015_03/blue_glow_green_background_04_vector_158357.jpg', 'download/2015_03/hinh-nen.rar', 'Thiết kế website', '&lt;p&gt;M&amp;ocirc; tả ngắn&lt;/p&gt;', '&lt;p&gt;Nội dung&lt;/p&gt;', 'thiet-ke-website-2', 'Thiết kế website | Thiet ke website', 'Thiết kế website, Thiet ke website', 'Nội dung', 0, 1, 0, 0, 0, 0, 1425353790, 1425353790, 'vi'),
(2, 1, 0, '', 'download/2015_03/blue_glow_green_background_04_vector_158357.jpg', 'download/2015_03/hinh-nen.rar', 'Thiết kế website', '&lt;p&gt;M&amp;ocirc; tả ngắn&lt;/p&gt;', '&lt;p&gt;Nội dung&lt;/p&gt;', 'thiet-ke-website-3', 'Thiết kế website | Thiet ke website', 'Thiết kế website, Thiet ke website', 'Nội dung', 0, 1, 0, 0, 0, 0, 1425353790, 1425353790, 'en'),
(3, 3, 7, '7', 'download/2015_03/blue_glow_green_background_04_vector_158357.jpg', 'download/2015_03/hinh-nen.rar', 'autopro.com.vn', '&lt;p&gt;M&amp;ocirc; tả ngắn&lt;/p&gt;', '&lt;p&gt;Nội dung&lt;/p&gt;', 'autoprocomvn', 'autopro.com.vn | autopro.com.vn', 'autopro.com.vn, autopro.com.vn', 'Nội dung', 0, 1, 0, 0, 0, 0, 1425353856, 1425353856, 'vi'),
(4, 3, 7, '7', 'download/2015_03/blue_glow_green_background_04_vector_158357.jpg', 'download/2015_03/hinh-nen.rar', 'autopro.com.vn', '&lt;p&gt;M&amp;ocirc; tả ngắn&lt;/p&gt;', '&lt;p&gt;Nội dung&lt;/p&gt;', 'autoprocomvn-1', 'autopro.com.vn | autopro.com.vn', 'autopro.com.vn, autopro.com.vn', 'Nội dung', 0, 1, 0, 0, 0, 0, 1425353856, 1425353856, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `download_group`
--

CREATE TABLE IF NOT EXISTS `download_group` (
`id` int(10) unsigned NOT NULL,
  `group_id` int(11) NOT NULL,
  `group_nav` varchar(250) NOT NULL,
  `group_level` tinyint(2) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `group_related` varchar(250) NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `pic_show` varchar(50) NOT NULL DEFAULT 'grid',
  `type_show` varchar(20) NOT NULL DEFAULT 'list_item',
  `num_show` int(11) NOT NULL,
  `is_focus` tinyint(1) NOT NULL DEFAULT '0',
  `is_show_menu` tinyint(1) NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `download_group`
--

INSERT INTO `download_group` (`id`, `group_id`, `group_nav`, `group_level`, `parent_id`, `group_related`, `picture`, `title`, `short`, `content`, `friendly_link`, `meta_title`, `meta_key`, `meta_desc`, `pic_show`, `type_show`, `num_show`, `is_focus`, `is_show_menu`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(7, 7, '7', 1, 0, '', '', 'Nhóm 4', '&lt;p&gt;asdasd a&lt;/p&gt;', '&lt;p&gt;&amp;nbsp;asd &amp;aacute;d&lt;/p&gt;', 'nhom-4', 'Nhóm 4 | Nhom 4', 'Nhóm 4, Nhom 4', ' asd ád', 'grid', 'list_item', 0, 0, 0, 0, 1, 1425351956, 1425352522, 'vi'),
(8, 7, '7', 1, 0, '', '', 'Nhóm 4', '&lt;p&gt;asdasd a&lt;/p&gt;', '&lt;p&gt;&amp;nbsp;asd &amp;aacute;d&lt;/p&gt;', 'nhom-4-1', 'Nhóm 4 | Nhom 4', 'Nhóm 4, Nhom 4', '&nbsp;asd &aacute;d', 'grid', 'list_item', 0, 0, 0, 0, 1, 1425351956, 1425352522, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `download_setting`
--

CREATE TABLE IF NOT EXISTS `download_setting` (
`id` int(11) NOT NULL,
  `download_meta_title` varchar(250) NOT NULL,
  `download_meta_key` text NOT NULL,
  `download_meta_desc` text NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(10) unsigned NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `download_setting`
--

INSERT INTO `download_setting` (`id`, `download_meta_title`, `download_meta_key`, `download_meta_desc`, `num_list`, `num_order_detail`, `lang`) VALUES
(1, 'Dịch vụ', '', '', 10, 5, 'vi'),
(2, 'Download', '', '', 10, 10, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `friendly_link`
--

CREATE TABLE IF NOT EXISTS `friendly_link` (
`id` int(10) unsigned NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `module` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `dbtable` varchar(50) NOT NULL,
  `dbtable_id` varchar(50) NOT NULL DEFAULT '0',
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  `date_create` int(10) unsigned NOT NULL,
  `date_update` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1277 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `friendly_link`
--

INSERT INTO `friendly_link` (`id`, `friendly_link`, `module`, `action`, `dbtable`, `dbtable_id`, `lang`, `date_create`, `date_update`) VALUES
(22, 'nhom-1', 'page', 'group', 'page_group_lang', '1', 'vi', 1400742794, 1420785467),
(23, 'tin-tuc', 'page', 'group', 'page_group_lang', '2', 'vi', 1400742856, 1411034307),
(24, 'cach-thanh-toan', 'page', 'detail', 'page_lang', '1', 'vi', 1400742985, 1415613862),
(25, 'hotline', 'page', 'detail', 'page_lang', '2', 'vi', 1400743065, 1415614075),
(26, 'about', 'page', 'detail', 'page_lang', '3', 'vi', 1400743109, 1421114680),
(27, 'hon-400-hoc-vien-cai-nghien-pha-trung-tam-keo-ve-tp-hai-phong', 'page', 'detail', 'page_lang', '4', 'vi', 1400743139, 1410786033),
(28, 'hoi-thao-du-hoc-thuy-si-hoc-bong-tai-htmi', 'page', 'detail', 'page_lang', '5', 'vi', 1400743272, 1410789499),
(29, 'tac-dong-cua-che-do-an-uong-va-thoi-quen-sinh-hoat-toi-lan-da-ban', 'page', 'detail', 'page_lang', '6', 'vi', 1400743320, 1409909197),
(30, 'dong-trung-ha-thao-la-gi-cach-phan-biet-that-gia', 'page', 'detail', 'page_lang', '7', 'vi', 1400743352, 1407912230),
(31, 'dong-trung-ha-thao-la-gi-cach-phan-biet-that-gia1', 'page', 'detail', 'page_lang', '8', 'vi', 1400743386, 1407912277),
(32, 'dong-trung-ha-thao-la-gi-cach-phan-biet-that-gia2', 'page', 'detail', 'page_lang', '9', 'vi', 1400743424, 1407912320),
(33, 'dong-trung-ha-thao-la-gi-cach-phan-biet-that-gia3', 'page', 'detail', 'page_lang', '10', 'vi', 1400745646, 1407913512),
(39, 'ho-tro', 'page', 'group', 'page_group_lang', '3', 'vi', 1401067636, 1410784935),
(40, 'lao-hoa-da', 'page', 'group', 'page_group_lang', '4', 'vi', 1401067645, 1407825126),
(41, 'cham-soc-da', 'page', 'group', 'page_group_lang', '5', 'vi', 1401067657, 1407825222),
(42, 'dep-voc-dang', 'page', 'group', 'page_group_lang', '6', 'vi', 1401067664, 1407825393),
(43, 'suc-khoe', 'page', 'group', 'page_group_lang', '7', 'vi', 1401067670, 1407825461),
(44, 'privacy-policy1', 'page', 'group', 'page_group_lang', '8', 'vi', 1401067689, 1401155570),
(45, 'feed-back1', 'page', 'group', 'page_group_lang', '9', 'vi', 1401067694, 1401155566),
(46, 'term-and-condition1', 'page', 'group', 'page_group_lang', '10', 'vi', 1401067703, 1401155563),
(47, 'business-opportunity1', 'page', 'group', 'page_group_lang', '11', 'vi', 1401067709, 1401155206),
(48, 'voucher', 'voucher', 'voucher', 'modules', '0', 'vi', 1400060066, 1401335523),
(49, 'lien-he', 'contact', 'contact', 'modules', 'contact', 'vi', 1401335590, 1407922653),
(50, 'annoying-orange-kitchen-carnage', 'video', 'detail', 'video_lang', '1', 'vi', 1405934605, 1419990425),
(52, 'cach-mua-hang1', 'page', 'group', 'page_group_lang', '1', 'en', 1407475045, 1407475045),
(53, 'goc-kinh-nghiem1', 'page', 'group', 'page_group_lang', '2', 'en', 1407475053, 1407475053),
(54, 'goc-lam-dep1', 'page', 'group', 'page_group_lang', '3', 'en', 1407475062, 1407475062),
(56, 'dong-trung-ha-thao-la-gi-cach-phan-biet-that-gia4', 'page', 'detail', 'page_lang', '11', 'vi', 1407913515, 1407913555),
(57, 'dong-trung-ha-thao-la-gi-cach-phan-biet-that-gia5', 'page', 'detail', 'page_lang', '12', 'vi', 1407913518, 1407913564),
(58, 'dong-trung-ha-thao-la-gi-cach-phan-biet-that-gia6', 'page', 'detail', 'page_lang', '13', 'vi', 1407913521, 1407913573),
(59, 'dong-trung-ha-thao-la-gi-cach-phan-biet-that-gia7', 'page', 'detail', 'page_lang', '14', 'vi', 1407913525, 1407913581),
(60, 'dong-trung-ha-thao-la-gi-cach-phan-biet-that-gia8', 'page', 'detail', 'page_lang', '15', 'vi', 1407913527, 1407913588),
(61, 'thanh-vien', 'user', 'user', 'modules', 'user', 'vi', 1408094837, 1408094837),
(70, 'dich-vu', 'service', 'service', 'modules', 'service', 'vi', 1421048303, 1421048485),
(71, 'contact', 'contact', 'contact', 'modules', 'contact', 'en', 1421048431, 1421048431),
(72, 'search', 'search', 'search', 'modules', 'search', 'en', 1421048448, 1421048448),
(73, 'service', 'service', 'service', 'modules', 'service', 'en', 1421048458, 1421048494),
(74, 'thiet-ke-website', 'service', 'group', 'service_group_lang', '1', 'vi', 1421049125, 1421639850),
(75, 'thiet-ke-website-1', 'service', 'group', 'service_group_lang', '1', 'en', 1421049125, 1421143293),
(76, 'phan-mem', 'service', 'group', 'service_group_lang', '2', 'vi', 1421049155, 1421049155),
(77, 'phan-mem-1', 'service', 'group', 'service_group_lang', '2', 'en', 1421049155, 1421049155),
(78, 'ten-mien', 'service', 'group', 'service_group_lang', '3', 'vi', 1421049171, 1421049171),
(79, 'ten-mien-1', 'service', 'group', 'service_group_lang', '3', 'en', 1421049171, 1421049171),
(80, 'hosting', 'service', 'group', 'service_group_lang', '4', 'vi', 1421049187, 1421049187),
(81, 'hosting-1', 'service', 'group', 'service_group_lang', '4', 'en', 1421049187, 1421049187),
(82, 'thiet-ke-web-mobile', 'service', 'detail', 'service_lang', '1', 'vi', 1421131840, 1421131840),
(83, 'thiet-ke-web-mobile-1', 'service', 'detail', 'service_lang', '1', 'en', 1421131840, 1421131840),
(84, 'du-an', 'project', 'project', 'modules', 'project', 'vi', 1421373770, 1421373770),
(85, 'project', 'project', 'project', 'modules', 'project', 'en', 1421373770, 1421373790),
(86, 'bat-dong-san', 'project', 'group', 'project_group_lang', '1', 'vi', 1421374499, 1421374499),
(87, 'bat-dong-san-1', 'project', 'group', 'project_group_lang', '1', 'en', 1421374499, 1421374499),
(88, 'san-xuat', 'project', 'group', 'project_group_lang', '2', 'vi', 1421374522, 1421374522),
(89, 'san-xuat-1', 'project', 'group', 'project_group_lang', '2', 'en', 1421374522, 1421374522),
(90, 'thuong-mai-dien', 'project', 'group', 'project_group_lang', '3', 'vi', 1421374528, 1421374528),
(91, 'thuong-mai-dien-1', 'project', 'group', 'project_group_lang', '3', 'en', 1421374528, 1421374528),
(92, 'giao-duc-suc-khoe', 'project', 'group', 'project_group_lang', '4', 'vi', 1421374535, 1421374535),
(93, 'giao-duc-suc-khoe-1', 'project', 'group', 'project_group_lang', '4', 'en', 1421374535, 1421374535),
(94, 'nhu-lan', 'project', 'detail', 'project_lang', '1', 'vi', 1421377186, 1421377186),
(95, 'nhu-lan-1', 'project', 'detail', 'project_lang', '1', 'en', 1421377186, 1421377186),
(96, 'test', 'service', 'group', 'service_group_lang', '5', 'vi', 1421652982, 1421652982),
(97, 'test-1', 'service', 'group', 'service_group_lang', '5', 'en', 1421652982, 1421652982),
(99, 'gioi-thieu-1', 'about', 'detail', 'about_lang', '1', 'en', 1421659507, 1421659507),
(100, 'nhu-lan-1-1', 'project', 'detail', 'project_lang', '2', 'vi', 1421724681, 1421724681),
(101, 'nhu-lan-2', 'project', 'detail', 'project_lang', '3', 'en', 1421724710, 1421724710),
(102, 'nhu-lan-2-1', 'project', 'detail', 'project_lang', '4', 'vi', 1421724718, 1421724718),
(103, 'nhu-lan-3', 'project', 'detail', 'project_lang', '5', 'en', 1421724744, 1421724744),
(104, 'nhom-tin-1', 'news', 'group', 'news_group_lang', '1', 'vi', 1421736370, 1421736370),
(105, 'nhom-tin-1-1', 'news', 'group', 'news_group_lang', '1', 'en', 1421736371, 1421736371),
(106, 'ao-bo-chat-lieu-vai-tre-bamboo-hinh-quy-nho-cute-va-coom-1', 'product', 'detail', 'product_lang', '5', 'vi', 1421808125, 1421808125),
(107, 'bang-gia', 'download', 'group', 'download_group_lang', '0', 'vi', 1422843831, 1422843843),
(108, 'bang-gia-1', 'download', 'group', 'download_group_lang', '0', 'en', 1422843831, 1422843843),
(109, 'bang-gib', 'download', 'group', 'download_group_lang', '1', 'vi', 1422844098, 1422844098),
(110, 'bang-gib-1', 'download', 'group', 'download_group_lang', '1', 'en', 1422844098, 1422844098),
(111, 'file-1', 'download', 'detail', 'download_lang', '1', 'vi', 1422845230, 1422845230),
(112, 'file-1-1', 'download', 'detail', 'download_lang', '1', 'en', 1422845230, 1422845230),
(113, '1425271859', 'about', 'detail', 'about', 'friendly_link', 'vi', 1425271859, 1425271859),
(115, 'gioi-thieu-cong-ty-1', 'about', 'detail', 'about', '1', 'vi', 1425283134, 1425283927),
(116, 'gioi-thieu-cong-ty-4', 'about', 'detail', 'about', '3', 'vi', 1425283442, 1425283848),
(117, 'gioi-thieu-cong-ty-2', 'about', 'detail', 'about', '4', 'vi', 1425283442, 1425283442),
(118, 'gioi-thieu-cong-ty-3', 'about', 'detail', 'about', '1', 'en', 1425283827, 1425283827),
(119, 'gioi-thieu-cong-ty-3-1', 'about', 'detail', 'about', '3', 'en', 1425283848, 1425283848),
(126, 'nhom-1-1', 'download', 'group', 'download_group', '0', 'vi', 1425348234, 1425348234),
(127, 'nhom-4', 'download', 'group', 'download_group', '7', 'vi', 1425351956, 1425352522),
(128, 'nhom-4-1', 'download', 'group', 'download_group', '7', 'en', 1425351956, 1425351956),
(129, 'cloud-vps-01', 'download', 'detail', 'download', '7', 'vi', 1425353548, 1425353750),
(130, 'test-2', 'about', 'detail', 'about', '5', 'vi', 1425353669, 1425353669),
(131, 'test-3', 'about', 'detail', 'about', '5', 'en', 1425353669, 1425353669),
(132, 'thiet-ke-website-2', 'download', 'detail', 'download', '1', 'vi', 1425353790, 1425353790),
(133, 'thiet-ke-website-3', 'download', 'detail', 'download', '1', 'en', 1425353790, 1425353790),
(134, 'autoprocomvn', 'download', 'detail', 'download', '3', 'vi', 1425353856, 1425353856),
(135, 'autoprocomvn-1', 'download', 'detail', 'download', '3', 'en', 1425353856, 1425353856),
(136, 'banner', 'gallery', 'group', 'gallery_group', '1', 'vi', 1425354713, 1425354713),
(137, 'banner-1', 'gallery', 'group', 'gallery_group', '1', 'en', 1425354713, 1425354713),
(138, '79463jpg', 'gallery', 'detail', 'gallery', '1', 'vi', 1425356353, 1425356727),
(139, '79463jpg-1', '', 'detail', '', '1', 'en', 1425356353, 1425356624),
(140, 'vista-blue-and-green-aurora-t2jpg', '', 'detail', '', '1', 'vi', 1425356353, 1425356625),
(141, '1425356353-3', 'gallery', 'detail', 'gallery', '3', 'vi', 1425356353, 1425356353),
(142, 'vista-blue-and-green-aurora-t2jpg-2', '', 'detail', '', '3', 'en', 1425356353, 1425356625),
(143, 'vista-blue-and-green-aurora-t2jpg-3', '', 'detail', '', '3', 'vi', 1425356353, 1425356625),
(144, '1425356353-6', 'gallery', 'detail', 'gallery', '5', 'vi', 1425356353, 1425356353),
(145, 'vista-blue-and-green-aurora-t2jpg-5', '', 'detail', '', '5', 'en', 1425356353, 1425356625),
(146, 'vista-blue-and-green-aurora-t2jpg-6', '', 'detail', '', '5', 'vi', 1425356353, 1425356625),
(147, '1425356354', 'gallery', 'detail', 'gallery', '7', 'vi', 1425356354, 1425356354),
(148, 'vista-blue-and-green-aurora-t2jpg-8', '', 'detail', '', '7', 'en', 1425356354, 1425356625),
(149, 'vista-blue-and-green-aurora-t2jpg-9', '', 'detail', '', '7', 'vi', 1425356354, 1425356625),
(150, '1425356354-3', 'gallery', 'detail', 'gallery', '9', 'vi', 1425356354, 1425356354),
(151, 'vista-blue-and-green-aurora-t2jpg-10-1', '', 'detail', '', '9', 'en', 1425356354, 1425356625),
(152, 'vista-blue-and-green-aurora-t2jpg-10', '', 'detail', '', '9', 'vi', 1425356354, 1425356625),
(153, '1425356354-6', 'gallery', 'detail', 'gallery', '11', 'vi', 1425356354, 1425356354),
(154, 'vista-blue-and-green-aurora-t2jpg-10-3', '', 'detail', '', '11', 'en', 1425356354, 1425356625),
(155, 'vista-blue-and-green-aurora-t2jpg-10-4', '', 'detail', '', '11', 'vi', 1425356354, 1425356625),
(156, '1425356354-9', 'gallery', 'detail', 'gallery', '13', 'vi', 1425356354, 1425356354),
(157, 'vista-blue-and-green-aurora-t2jpg-10-6', '', 'detail', '', '13', 'en', 1425356354, 1425356625),
(158, 'vista-blue-and-green-aurora-t2jpg-10-7', '', 'detail', '', '13', 'vi', 1425356354, 1425356625),
(159, '1425356354-10-2', 'gallery', 'detail', 'gallery', '15', 'vi', 1425356354, 1425356354),
(160, 'vista-blue-and-green-aurora-t2jpg-10-9', '', 'detail', '', '15', 'en', 1425356354, 1425356625),
(161, 'vista-blue-and-green-aurora-t2jpg-10-10', '', 'detail', '', '15', 'vi', 1425356354, 1425356625),
(162, '1425356354-10-5', 'gallery', 'detail', 'gallery', '17', 'vi', 1425356354, 1425356354),
(163, 'vista-blue-and-green-aurora-t2jpg-10-10-2', '', 'detail', '', '17', 'en', 1425356354, 1425356626),
(164, 'vista-blue-and-green-aurora-t2jpg-10-10-3', '', 'detail', '', '17', 'vi', 1425356354, 1425356626),
(165, '1425356354-10-8', 'gallery', 'detail', 'gallery', '19', 'vi', 1425356354, 1425356354),
(166, 'vista-blue-and-green-aurora-t2jpg-10-10-5', '', 'detail', '', '19', 'en', 1425356354, 1425356626),
(167, 'vista-blue-and-green-aurora-t2jpg-10-10-6', '', 'detail', '', '19', 'vi', 1425356354, 1425356626),
(168, '1425356355', 'gallery', 'detail', 'gallery', '21', 'vi', 1425356355, 1425356355),
(169, 'vista-blue-and-green-aurora-t2jpg-10-10-8', '', 'detail', '', '21', 'en', 1425356355, 1425356626),
(170, 'vista-blue-and-green-aurora-t2jpg-10-10-9', '', 'detail', '', '21', 'vi', 1425356355, 1425356626),
(171, '1425356355-3', 'gallery', 'detail', 'gallery', '23', 'vi', 1425356355, 1425356355),
(172, 'vista-blue-and-green-aurora-t2jpg-10-10-10-1', '', 'detail', '', '23', 'en', 1425356355, 1425356626),
(173, 'vista-blue-and-green-aurora-t2jpg-10-10-10', '', 'detail', '', '23', 'vi', 1425356355, 1425356626),
(174, '1425356355-6', 'gallery', 'detail', 'gallery', '25', 'vi', 1425356355, 1425356355),
(175, 'vista-blue-and-green-aurora-t2jpg-10-10-10-3', '', 'detail', '', '25', 'en', 1425356355, 1425356626),
(176, 'vista-blue-and-green-aurora-t2jpg-10-10-10-4', '', 'detail', '', '25', 'vi', 1425356355, 1425356626),
(177, '1425356355-9', 'gallery', 'detail', 'gallery', '27', 'vi', 1425356355, 1425356355),
(178, 'vista-blue-and-green-aurora-t2jpg-10-10-10-6', '', 'detail', '', '27', 'en', 1425356355, 1425356626),
(179, 'vista-blue-and-green-aurora-t2jpg-10-10-10-7', '', 'detail', '', '27', 'vi', 1425356355, 1425356627),
(180, '1425356355-10-2', 'gallery', 'detail', 'gallery', '29', 'vi', 1425356355, 1425356355),
(181, 'vista-blue-and-green-aurora-t2jpg-10-10-10-9', '', 'detail', '', '29', 'en', 1425356355, 1425356627),
(182, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10', '', 'detail', '', '29', 'vi', 1425356355, 1425356627),
(183, '1425356355-10-5', 'gallery', 'detail', 'gallery', '31', 'vi', 1425356355, 1425356355),
(184, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-2', '', 'detail', '', '31', 'en', 1425356355, 1425356627),
(185, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-3', '', 'detail', '', '31', 'vi', 1425356355, 1425356627),
(186, '1425356355-10-8', 'gallery', 'detail', 'gallery', '33', 'vi', 1425356355, 1425356355),
(187, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-5', '', 'detail', '', '33', 'en', 1425356355, 1425356627),
(188, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-6', '', 'detail', '', '33', 'vi', 1425356355, 1425356627),
(189, '1425356355-10-10-1', 'gallery', 'detail', 'gallery', '35', 'vi', 1425356355, 1425356355),
(190, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-8', '', 'detail', '', '35', 'en', 1425356355, 1425356627),
(191, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-9', '', 'detail', '', '35', 'vi', 1425356355, 1425356627),
(192, '1425356356', 'gallery', 'detail', 'gallery', '37', 'vi', 1425356356, 1425356356),
(193, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-1', '', 'detail', '', '37', 'en', 1425356356, 1425356627),
(194, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10', '', 'detail', '', '37', 'vi', 1425356356, 1425356627),
(195, '1425356356-3', 'gallery', 'detail', 'gallery', '39', 'vi', 1425356356, 1425356356),
(196, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-3', '', 'detail', '', '39', 'en', 1425356356, 1425356627),
(197, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-4', '', 'detail', '', '39', 'vi', 1425356356, 1425356627),
(198, '1425356356-6', 'gallery', 'detail', 'gallery', '41', 'vi', 1425356356, 1425356356),
(199, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-6', '', 'detail', '', '41', 'en', 1425356356, 1425356627),
(200, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-7', '', 'detail', '', '41', 'vi', 1425356356, 1425356627),
(201, '1425356356-9', 'gallery', 'detail', 'gallery', '43', 'vi', 1425356356, 1425356356),
(202, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-9', '', 'detail', '', '43', 'en', 1425356356, 1425356628),
(203, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-10', '', 'detail', '', '43', 'vi', 1425356356, 1425356628),
(204, '1425356356-10-2', 'gallery', 'detail', 'gallery', '45', 'vi', 1425356356, 1425356356),
(205, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-10-2', '', 'detail', '', '45', 'en', 1425356356, 1425356628),
(206, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-10-3', '', 'detail', '', '45', 'vi', 1425356356, 1425356628),
(207, '1425356356-10-5', 'gallery', 'detail', 'gallery', '47', 'vi', 1425356356, 1425356356),
(208, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-10-5', '', 'detail', '', '47', 'en', 1425356356, 1425356628),
(209, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-10-6', '', 'detail', '', '47', 'vi', 1425356356, 1425356628),
(210, '1425356356-10-8', 'gallery', 'detail', 'gallery', '49', 'vi', 1425356356, 1425356356),
(211, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-10-8', '', 'detail', '', '49', 'en', 1425356356, 1425356628),
(212, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-10-9', '', 'detail', '', '49', 'vi', 1425356356, 1425356628),
(213, '1425356356-10-10-1', 'gallery', 'detail', 'gallery', '51', 'vi', 1425356356, 1425356356),
(214, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-10-10-1', '', 'detail', '', '51', 'en', 1425356356, 1425356628),
(215, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-10-10', '', 'detail', '', '51', 'vi', 1425356357, 1425356628),
(216, '1425356357-1', 'gallery', 'detail', 'gallery', '53', 'vi', 1425356357, 1425356357),
(217, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-10-10-3', '', 'detail', '', '53', 'en', 1425356357, 1425356629),
(218, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-10-10-4', '', 'detail', '', '53', 'vi', 1425356357, 1425356629),
(219, '1425356357-4', 'gallery', 'detail', 'gallery', '55', 'vi', 1425356357, 1425356357),
(220, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-10-10-6', '', 'detail', '', '55', 'en', 1425356357, 1425356629),
(221, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-10-10-7', '', 'detail', '', '55', 'vi', 1425356357, 1425356629),
(222, '1425356357-7', 'gallery', 'detail', 'gallery', '57', 'vi', 1425356357, 1425356357),
(223, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-10-10-9', '', 'detail', '', '57', 'en', 1425356357, 1425356629),
(224, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-10-10-10', '', 'detail', '', '57', 'vi', 1425356357, 1425356629),
(225, '1425356357-10', 'gallery', 'detail', 'gallery', '59', 'vi', 1425356357, 1425356357),
(226, '1425356357-10-1', '', 'detail', '', '59', 'en', 1425356357, 1425356357),
(227, '1425356357-10-2', '', 'detail', '', '59', 'vi', 1425356357, 1425356357),
(228, '1425356357-10-3', 'gallery', 'detail', 'gallery', '61', 'vi', 1425356357, 1425356357),
(229, '1425356357-10-4', '', 'detail', '', '61', 'en', 1425356357, 1425356357),
(230, '1425356357-10-5', '', 'detail', '', '61', 'vi', 1425356357, 1425356357),
(231, '1425356357-10-6', 'gallery', 'detail', 'gallery', '63', 'vi', 1425356357, 1425356357),
(232, '1425356357-10-7', '', 'detail', '', '63', 'en', 1425356357, 1425356357),
(233, '1425356358', '', 'detail', '', '63', 'vi', 1425356358, 1425356358),
(234, '1425356358-1', 'gallery', 'detail', 'gallery', '65', 'vi', 1425356358, 1425356358),
(235, '1425356358-2', '', 'detail', '', '65', 'en', 1425356358, 1425356358),
(236, '1425356358-3', '', 'detail', '', '65', 'vi', 1425356358, 1425356358),
(237, '1425356358-4', 'gallery', 'detail', 'gallery', '67', 'vi', 1425356358, 1425356358),
(238, '1425356358-5', '', 'detail', '', '67', 'en', 1425356358, 1425356358),
(239, '1425356358-6', '', 'detail', '', '67', 'vi', 1425356358, 1425356358),
(240, '1425356358-7', 'gallery', 'detail', 'gallery', '69', 'vi', 1425356358, 1425356358),
(241, '1425356358-8', '', 'detail', '', '69', 'en', 1425356358, 1425356358),
(242, '1425356358-9', '', 'detail', '', '69', 'vi', 1425356358, 1425356358),
(243, '1425356358-10', 'gallery', 'detail', 'gallery', '71', 'vi', 1425356358, 1425356358),
(244, '1425356358-10-1', '', 'detail', '', '71', 'en', 1425356358, 1425356358),
(245, '1425356358-10-2', '', 'detail', '', '71', 'vi', 1425356358, 1425356358),
(246, '1425356358-10-3', 'gallery', 'detail', 'gallery', '73', 'vi', 1425356358, 1425356358),
(247, '1425356358-10-4', '', 'detail', '', '73', 'en', 1425356358, 1425356358),
(248, '1425356358-10-5', '', 'detail', '', '73', 'vi', 1425356358, 1425356358),
(249, '1425356358-10-6', 'gallery', 'detail', 'gallery', '75', 'vi', 1425356358, 1425356358),
(250, '1425356358-10-7', '', 'detail', '', '75', 'en', 1425356358, 1425356358),
(251, '1425356358-10-8', '', 'detail', '', '75', 'vi', 1425356358, 1425356358),
(252, '1425356358-10-9', 'gallery', 'detail', 'gallery', '77', 'vi', 1425356358, 1425356358),
(253, '1425356358-10-10', '', 'detail', '', '77', 'en', 1425356358, 1425356358),
(254, '1425356358-10-10-1', '', 'detail', '', '77', 'vi', 1425356358, 1425356358),
(255, '1425356359', 'gallery', 'detail', 'gallery', '79', 'vi', 1425356359, 1425356359),
(256, '1425356359-1', '', 'detail', '', '79', 'en', 1425356359, 1425356359),
(257, '1425356359-2', '', 'detail', '', '79', 'vi', 1425356359, 1425356359),
(258, '1425356359-3', 'gallery', 'detail', 'gallery', '81', 'vi', 1425356359, 1425356359),
(259, '1425356359-4', '', 'detail', '', '81', 'en', 1425356359, 1425356359),
(260, '1425356359-5', '', 'detail', '', '81', 'vi', 1425356359, 1425356359),
(261, '1425356359-6', 'gallery', 'detail', 'gallery', '83', 'vi', 1425356359, 1425356359),
(262, '1425356359-7', '', 'detail', '', '83', 'en', 1425356359, 1425356359),
(263, '1425356359-8', '', 'detail', '', '83', 'vi', 1425356359, 1425356359),
(264, '1425356359-9', 'gallery', 'detail', 'gallery', '85', 'vi', 1425356359, 1425356359),
(265, '1425356359-10', '', 'detail', '', '85', 'en', 1425356359, 1425356359),
(266, '1425356359-10-1', '', 'detail', '', '85', 'vi', 1425356359, 1425356359),
(267, '1425356359-10-2', 'gallery', 'detail', 'gallery', '87', 'vi', 1425356359, 1425356359),
(268, '1425356359-10-3', '', 'detail', '', '87', 'en', 1425356359, 1425356359),
(269, '1425356359-10-4', '', 'detail', '', '87', 'vi', 1425356359, 1425356359),
(270, '1425356360', 'gallery', 'detail', 'gallery', '89', 'vi', 1425356360, 1425356360),
(271, '1425356360-1', '', 'detail', '', '89', 'en', 1425356360, 1425356360),
(272, '1425356360-2', '', 'detail', '', '89', 'vi', 1425356360, 1425356360),
(273, '1425356360-3', 'gallery', 'detail', 'gallery', '91', 'vi', 1425356360, 1425356360),
(274, '1425356360-4', '', 'detail', '', '91', 'en', 1425356360, 1425356360),
(275, '1425356360-5', '', 'detail', '', '91', 'vi', 1425356360, 1425356360),
(276, '1425356360-6', 'gallery', 'detail', 'gallery', '93', 'vi', 1425356360, 1425356360),
(277, '1425356360-7', '', 'detail', '', '93', 'en', 1425356360, 1425356360),
(278, '1425356360-8', '', 'detail', '', '93', 'vi', 1425356360, 1425356360),
(279, '1425356360-9', 'gallery', 'detail', 'gallery', '95', 'vi', 1425356360, 1425356360),
(280, '1425356360-10', '', 'detail', '', '95', 'en', 1425356360, 1425356360),
(281, '1425356360-10-1', '', 'detail', '', '95', 'vi', 1425356360, 1425356360),
(282, '1425356360-10-2', 'gallery', 'detail', 'gallery', '97', 'vi', 1425356360, 1425356360),
(283, '1425356360-10-3', '', 'detail', '', '97', 'en', 1425356360, 1425356360),
(284, '1425356360-10-4', '', 'detail', '', '97', 'vi', 1425356360, 1425356360),
(285, '1425356360-10-5', 'gallery', 'detail', 'gallery', '99', 'vi', 1425356360, 1425356360),
(286, '1425356360-10-6', '', 'detail', '', '99', 'en', 1425356360, 1425356360),
(287, '1425356360-10-7', '', 'detail', '', '99', 'vi', 1425356360, 1425356360),
(288, '1425356360-10-8', 'gallery', 'detail', 'gallery', '101', 'vi', 1425356360, 1425356360),
(289, '1425356360-10-9', '', 'detail', '', '101', 'en', 1425356360, 1425356360),
(290, '1425356360-10-10', '', 'detail', '', '101', 'vi', 1425356360, 1425356360),
(291, '1425356361', 'gallery', 'detail', 'gallery', '103', 'vi', 1425356361, 1425356361),
(292, '1425356361-1', '', 'detail', '', '103', 'en', 1425356361, 1425356361),
(293, '1425356361-2', '', 'detail', '', '103', 'vi', 1425356361, 1425356361),
(294, '1425356361-3', 'gallery', 'detail', 'gallery', '105', 'vi', 1425356361, 1425356361),
(295, '1425356361-4', '', 'detail', '', '105', 'en', 1425356361, 1425356361),
(296, '1425356361-5', '', 'detail', '', '105', 'vi', 1425356361, 1425356361),
(297, '1425356361-6', 'gallery', 'detail', 'gallery', '107', 'vi', 1425356361, 1425356361),
(298, '1425356361-7', '', 'detail', '', '107', 'en', 1425356361, 1425356361),
(299, '1425356361-8', '', 'detail', '', '107', 'vi', 1425356361, 1425356361),
(300, '1425356361-9', 'gallery', 'detail', 'gallery', '109', 'vi', 1425356361, 1425356361),
(301, '1425356361-10', '', 'detail', '', '109', 'en', 1425356361, 1425356361),
(302, '1425356361-10-1', '', 'detail', '', '109', 'vi', 1425356361, 1425356361),
(303, '1425356361-10-2', 'gallery', 'detail', 'gallery', '111', 'vi', 1425356361, 1425356361),
(304, '1425356361-10-3', '', 'detail', '', '111', 'en', 1425356361, 1425356361),
(305, '1425356361-10-4', '', 'detail', '', '111', 'vi', 1425356361, 1425356361),
(306, '1425356361-10-5', 'gallery', 'detail', 'gallery', '113', 'vi', 1425356361, 1425356361),
(307, '1425356361-10-6', '', 'detail', '', '113', 'en', 1425356361, 1425356361),
(308, '1425356361-10-7', '', 'detail', '', '113', 'vi', 1425356361, 1425356361),
(309, '1425356361-10-8', 'gallery', 'detail', 'gallery', '115', 'vi', 1425356361, 1425356361),
(310, '1425356361-10-9', '', 'detail', '', '115', 'en', 1425356361, 1425356361),
(311, '1425356361-10-10', '', 'detail', '', '115', 'vi', 1425356361, 1425356361),
(312, '1425356361-10-10-1', 'gallery', 'detail', 'gallery', '117', 'vi', 1425356361, 1425356361),
(313, '1425356362', '', 'detail', '', '117', 'en', 1425356362, 1425356362),
(314, '1425356362-1', '', 'detail', '', '117', 'vi', 1425356362, 1425356362),
(315, '1425356362-2', 'gallery', 'detail', 'gallery', '119', 'vi', 1425356362, 1425356362),
(316, '1425356362-3', '', 'detail', '', '119', 'en', 1425356362, 1425356362),
(317, '1425356362-4', '', 'detail', '', '119', 'vi', 1425356362, 1425356362),
(318, '1425356362-5', 'gallery', 'detail', 'gallery', '121', 'vi', 1425356362, 1425356362),
(319, '1425356362-6', '', 'detail', '', '121', 'en', 1425356362, 1425356362),
(320, '1425356362-7', '', 'detail', '', '121', 'vi', 1425356362, 1425356362),
(321, '1425356362-8', 'gallery', 'detail', 'gallery', '123', 'vi', 1425356362, 1425356362),
(322, '1425356362-9', '', 'detail', '', '123', 'en', 1425356362, 1425356362),
(323, '1425356362-10', '', 'detail', '', '123', 'vi', 1425356362, 1425356362),
(324, '1425356362-10-1', 'gallery', 'detail', 'gallery', '125', 'vi', 1425356362, 1425356362),
(325, '1425356362-10-2', '', 'detail', '', '125', 'en', 1425356362, 1425356362),
(326, '1425356362-10-3', '', 'detail', '', '125', 'vi', 1425356362, 1425356362),
(327, '1425356362-10-4', 'gallery', 'detail', 'gallery', '127', 'vi', 1425356362, 1425356362),
(328, '1425356362-10-5', '', 'detail', '', '127', 'en', 1425356362, 1425356362),
(329, '1425356362-10-6', '', 'detail', '', '127', 'vi', 1425356362, 1425356362),
(330, '1425356362-10-7', 'gallery', 'detail', 'gallery', '129', 'vi', 1425356362, 1425356362),
(331, '1425356362-10-8', '', 'detail', '', '129', 'en', 1425356362, 1425356362),
(332, '1425356362-10-9', '', 'detail', '', '129', 'vi', 1425356362, 1425356362),
(333, '1425356362-10-10', 'gallery', 'detail', 'gallery', '131', 'vi', 1425356362, 1425356362),
(334, '1425356363', '', 'detail', '', '131', 'en', 1425356363, 1425356363),
(335, '1425356363-1', '', 'detail', '', '131', 'vi', 1425356363, 1425356363),
(336, '1425356363-2', 'gallery', 'detail', 'gallery', '133', 'vi', 1425356363, 1425356363),
(337, '1425356363-3', '', 'detail', '', '133', 'en', 1425356363, 1425356363),
(338, '1425356363-4', '', 'detail', '', '133', 'vi', 1425356363, 1425356363),
(339, '1425356363-5', 'gallery', 'detail', 'gallery', '135', 'vi', 1425356363, 1425356363),
(340, '1425356363-6', '', 'detail', '', '135', 'en', 1425356363, 1425356363),
(341, '1425356363-7', '', 'detail', '', '135', 'vi', 1425356363, 1425356363),
(342, '1425356363-8', 'gallery', 'detail', 'gallery', '137', 'vi', 1425356363, 1425356363),
(343, '1425356363-9', '', 'detail', '', '137', 'en', 1425356363, 1425356363),
(344, '1425356363-10', '', 'detail', '', '137', 'vi', 1425356363, 1425356363),
(345, '1425356363-10-1', 'gallery', 'detail', 'gallery', '139', 'vi', 1425356363, 1425356363),
(346, '1425356363-10-2', '', 'detail', '', '139', 'en', 1425356363, 1425356363),
(347, '1425356363-10-3', '', 'detail', '', '139', 'vi', 1425356363, 1425356363),
(348, '1425356363-10-4', 'gallery', 'detail', 'gallery', '141', 'vi', 1425356363, 1425356363),
(349, '1425356363-10-5', '', 'detail', '', '141', 'en', 1425356363, 1425356363),
(350, '1425356363-10-6', '', 'detail', '', '141', 'vi', 1425356363, 1425356363),
(351, '1425356363-10-7', 'gallery', 'detail', 'gallery', '143', 'vi', 1425356363, 1425356363),
(352, '1425356363-10-8', '', 'detail', '', '143', 'en', 1425356363, 1425356363),
(353, '1425356364', '', 'detail', '', '143', 'vi', 1425356364, 1425356364),
(354, '1425356364-1', 'gallery', 'detail', 'gallery', '145', 'vi', 1425356364, 1425356364),
(355, '1425356364-2', '', 'detail', '', '145', 'en', 1425356364, 1425356364),
(356, '1425356364-3', '', 'detail', '', '145', 'vi', 1425356364, 1425356364),
(357, '1425356364-4', 'gallery', 'detail', 'gallery', '147', 'vi', 1425356364, 1425356364),
(358, '1425356364-5', '', 'detail', '', '147', 'en', 1425356364, 1425356364),
(359, '1425356364-6', '', 'detail', '', '147', 'vi', 1425356364, 1425356364),
(360, '1425356364-7', 'gallery', 'detail', 'gallery', '149', 'vi', 1425356364, 1425356364),
(361, '1425356364-8', '', 'detail', '', '149', 'en', 1425356364, 1425356364),
(362, '1425356364-9', '', 'detail', '', '149', 'vi', 1425356364, 1425356364),
(363, '1425356364-10', 'gallery', 'detail', 'gallery', '151', 'vi', 1425356364, 1425356364),
(364, '1425356364-10-1', '', 'detail', '', '151', 'en', 1425356364, 1425356364),
(365, '1425356364-10-2', '', 'detail', '', '151', 'vi', 1425356364, 1425356364),
(366, '1425356364-10-3', 'gallery', 'detail', 'gallery', '153', 'vi', 1425356364, 1425356364),
(367, '1425356364-10-4', '', 'detail', '', '153', 'en', 1425356364, 1425356364),
(368, '1425356364-10-5', '', 'detail', '', '153', 'vi', 1425356364, 1425356364),
(369, '1425356364-10-6', 'gallery', 'detail', 'gallery', '155', 'vi', 1425356364, 1425356364),
(370, '1425356364-10-7', '', 'detail', '', '155', 'en', 1425356364, 1425356364),
(371, '1425356365', '', 'detail', '', '155', 'vi', 1425356365, 1425356365),
(372, '1425356365-1', 'gallery', 'detail', 'gallery', '157', 'vi', 1425356365, 1425356365),
(373, '1425356365-2', '', 'detail', '', '157', 'en', 1425356365, 1425356365),
(374, '1425356365-3', '', 'detail', '', '157', 'vi', 1425356365, 1425356365),
(375, '1425356365-4', 'gallery', 'detail', 'gallery', '159', 'vi', 1425356365, 1425356365),
(376, '1425356365-5', '', 'detail', '', '159', 'en', 1425356365, 1425356365),
(377, '1425356365-6', '', 'detail', '', '159', 'vi', 1425356365, 1425356365),
(378, '1425356365-7', 'gallery', 'detail', 'gallery', '161', 'vi', 1425356365, 1425356365),
(379, '1425356365-8', '', 'detail', '', '161', 'en', 1425356365, 1425356365),
(380, '1425356365-9', '', 'detail', '', '161', 'vi', 1425356365, 1425356365),
(381, '1425356365-10', 'gallery', 'detail', 'gallery', '163', 'vi', 1425356365, 1425356365),
(382, '1425356365-10-1', '', 'detail', '', '163', 'en', 1425356365, 1425356365),
(383, '1425356365-10-2', '', 'detail', '', '163', 'vi', 1425356365, 1425356365),
(384, '1425356365-10-3', 'gallery', 'detail', 'gallery', '165', 'vi', 1425356365, 1425356365),
(385, '1425356365-10-4', '', 'detail', '', '165', 'en', 1425356365, 1425356365),
(386, '1425356365-10-5', '', 'detail', '', '165', 'vi', 1425356365, 1425356365),
(387, '1425356365-10-6', 'gallery', 'detail', 'gallery', '167', 'vi', 1425356365, 1425356365),
(388, '1425356366', '', 'detail', '', '167', 'en', 1425356366, 1425356366),
(389, '1425356366-1', '', 'detail', '', '167', 'vi', 1425356366, 1425356366),
(390, '1425356366-2', 'gallery', 'detail', 'gallery', '169', 'vi', 1425356366, 1425356366),
(391, '1425356366-3', '', 'detail', '', '169', 'en', 1425356366, 1425356366),
(392, '1425356366-4', '', 'detail', '', '169', 'vi', 1425356366, 1425356366),
(393, '1425356366-5', 'gallery', 'detail', 'gallery', '171', 'vi', 1425356366, 1425356366),
(394, '1425356366-6', '', 'detail', '', '171', 'en', 1425356366, 1425356366),
(395, '1425356366-7', '', 'detail', '', '171', 'vi', 1425356366, 1425356366),
(396, '1425356366-8', 'gallery', 'detail', 'gallery', '173', 'vi', 1425356366, 1425356366),
(397, '1425356366-9', '', 'detail', '', '173', 'en', 1425356366, 1425356366),
(398, '1425356366-10', '', 'detail', '', '173', 'vi', 1425356366, 1425356366),
(399, '1425356366-10-1', 'gallery', 'detail', 'gallery', '175', 'vi', 1425356366, 1425356366),
(400, '1425356366-10-2', '', 'detail', '', '175', 'en', 1425356366, 1425356366),
(401, '1425356366-10-3', '', 'detail', '', '175', 'vi', 1425356366, 1425356366),
(402, '1425356366-10-4', 'gallery', 'detail', 'gallery', '177', 'vi', 1425356366, 1425356366),
(403, '1425356366-10-5', '', 'detail', '', '177', 'en', 1425356366, 1425356366),
(404, '1425356366-10-6', '', 'detail', '', '177', 'vi', 1425356366, 1425356366),
(405, '1425356366-10-7', 'gallery', 'detail', 'gallery', '179', 'vi', 1425356366, 1425356366),
(406, '1425356366-10-8', '', 'detail', '', '179', 'en', 1425356366, 1425356366),
(407, '1425356366-10-9', '', 'detail', '', '179', 'vi', 1425356366, 1425356366),
(408, '1425356366-10-10', 'gallery', 'detail', 'gallery', '181', 'vi', 1425356366, 1425356366),
(409, '1425356367', '', 'detail', '', '181', 'en', 1425356367, 1425356367),
(410, '1425356367-1', '', 'detail', '', '181', 'vi', 1425356367, 1425356367),
(411, '1425356367-2', 'gallery', 'detail', 'gallery', '183', 'vi', 1425356367, 1425356367),
(412, '1425356367-3', '', 'detail', '', '183', 'en', 1425356367, 1425356367),
(413, '1425356367-4', '', 'detail', '', '183', 'vi', 1425356367, 1425356367),
(414, '1425356367-5', 'gallery', 'detail', 'gallery', '185', 'vi', 1425356367, 1425356367),
(415, '1425356367-6', '', 'detail', '', '185', 'en', 1425356367, 1425356367),
(416, '1425356367-7', '', 'detail', '', '185', 'vi', 1425356367, 1425356367),
(417, '1425356367-8', 'gallery', 'detail', 'gallery', '187', 'vi', 1425356367, 1425356367),
(418, '1425356367-9', '', 'detail', '', '187', 'en', 1425356367, 1425356367),
(419, '1425356367-10', '', 'detail', '', '187', 'vi', 1425356367, 1425356367),
(420, '1425356367-10-1', 'gallery', 'detail', 'gallery', '189', 'vi', 1425356367, 1425356367),
(421, '1425356367-10-2', '', 'detail', '', '189', 'en', 1425356367, 1425356367),
(422, '1425356367-10-3', '', 'detail', '', '189', 'vi', 1425356367, 1425356367),
(423, '1425356367-10-4', 'gallery', 'detail', 'gallery', '191', 'vi', 1425356367, 1425356367),
(424, '1425356367-10-5', '', 'detail', '', '191', 'en', 1425356367, 1425356367),
(425, '1425356367-10-6', '', 'detail', '', '191', 'vi', 1425356367, 1425356367),
(426, '1425356367-10-7', 'gallery', 'detail', 'gallery', '193', 'vi', 1425356367, 1425356367),
(427, '1425356367-10-8', '', 'detail', '', '193', 'en', 1425356367, 1425356367),
(428, '1425356367-10-9', '', 'detail', '', '193', 'vi', 1425356367, 1425356367),
(429, '1425356367-10-10', 'gallery', 'detail', 'gallery', '195', 'vi', 1425356367, 1425356367),
(430, '1425356367-10-10-1', '', 'detail', '', '195', 'en', 1425356367, 1425356367),
(431, '1425356367-10-10-2', '', 'detail', '', '195', 'vi', 1425356367, 1425356367),
(432, '1425356367-10-10-3', 'gallery', 'detail', 'gallery', '197', 'vi', 1425356367, 1425356367),
(433, '1425356367-10-10-4', '', 'detail', '', '197', 'en', 1425356367, 1425356367),
(434, '1425356368', '', 'detail', '', '197', 'vi', 1425356368, 1425356368),
(435, '1425356368-1', 'gallery', 'detail', 'gallery', '199', 'vi', 1425356368, 1425356368),
(436, '1425356368-2', '', 'detail', '', '199', 'en', 1425356368, 1425356368),
(437, '1425356368-3', '', 'detail', '', '199', 'vi', 1425356368, 1425356368),
(438, '1425356368-4', 'gallery', 'detail', 'gallery', '201', 'vi', 1425356368, 1425356368),
(439, '1425356368-5', '', 'detail', '', '201', 'en', 1425356368, 1425356368),
(440, '1425356368-6', '', 'detail', '', '201', 'vi', 1425356368, 1425356368),
(441, '1425356368-7', 'gallery', 'detail', 'gallery', '203', 'vi', 1425356368, 1425356368),
(442, '1425356368-8', '', 'detail', '', '203', 'en', 1425356368, 1425356368),
(443, '1425356368-9', '', 'detail', '', '203', 'vi', 1425356368, 1425356368),
(444, '1425356368-10', 'gallery', 'detail', 'gallery', '205', 'vi', 1425356368, 1425356368),
(445, '1425356368-10-1', '', 'detail', '', '205', 'en', 1425356368, 1425356368),
(446, '1425356368-10-2', '', 'detail', '', '205', 'vi', 1425356368, 1425356368),
(447, '1425356368-10-3', 'gallery', 'detail', 'gallery', '207', 'vi', 1425356368, 1425356368),
(448, '1425356368-10-4', '', 'detail', '', '207', 'en', 1425356368, 1425356368),
(449, '1425356368-10-5', '', 'detail', '', '207', 'vi', 1425356368, 1425356368),
(450, '1425356368-10-6', 'gallery', 'detail', 'gallery', '209', 'vi', 1425356368, 1425356368),
(451, '1425356368-10-7', '', 'detail', '', '209', 'en', 1425356368, 1425356368),
(452, '1425356368-10-8', '', 'detail', '', '209', 'vi', 1425356368, 1425356368),
(453, '1425356368-10-9', 'gallery', 'detail', 'gallery', '211', 'vi', 1425356368, 1425356368),
(454, '1425356368-10-10', '', 'detail', '', '211', 'en', 1425356368, 1425356368),
(455, '1425356368-10-10-1', '', 'detail', '', '211', 'vi', 1425356368, 1425356368),
(456, '1425356369', 'gallery', 'detail', 'gallery', '213', 'vi', 1425356369, 1425356369),
(457, '1425356369-1', '', 'detail', '', '213', 'en', 1425356369, 1425356369),
(458, '1425356369-2', '', 'detail', '', '213', 'vi', 1425356369, 1425356369),
(459, '1425356369-3', 'gallery', 'detail', 'gallery', '215', 'vi', 1425356369, 1425356369),
(460, '1425356369-4', '', 'detail', '', '215', 'en', 1425356369, 1425356369),
(461, '1425356369-5', '', 'detail', '', '215', 'vi', 1425356369, 1425356369),
(462, '1425356369-6', 'gallery', 'detail', 'gallery', '217', 'vi', 1425356369, 1425356369),
(463, '1425356369-7', '', 'detail', '', '217', 'en', 1425356369, 1425356369),
(464, '1425356369-8', '', 'detail', '', '217', 'vi', 1425356369, 1425356369),
(465, '1425356369-9', 'gallery', 'detail', 'gallery', '219', 'vi', 1425356369, 1425356369),
(466, '1425356369-10', '', 'detail', '', '219', 'en', 1425356369, 1425356369),
(467, '1425356369-10-1', '', 'detail', '', '219', 'vi', 1425356369, 1425356369),
(468, '1425356369-10-2', 'gallery', 'detail', 'gallery', '221', 'vi', 1425356369, 1425356369),
(469, '1425356369-10-3', '', 'detail', '', '221', 'en', 1425356369, 1425356369),
(470, '1425356369-10-4', '', 'detail', '', '221', 'vi', 1425356369, 1425356369),
(471, '1425356369-10-5', 'gallery', 'detail', 'gallery', '223', 'vi', 1425356369, 1425356369),
(472, '1425356370', '', 'detail', '', '223', 'en', 1425356370, 1425356370),
(473, '1425356370-1', '', 'detail', '', '223', 'vi', 1425356370, 1425356370),
(474, '1425356370-2', 'gallery', 'detail', 'gallery', '225', 'vi', 1425356370, 1425356370),
(475, '1425356370-3', '', 'detail', '', '225', 'en', 1425356370, 1425356370),
(476, '1425356370-4', '', 'detail', '', '225', 'vi', 1425356370, 1425356370),
(477, '1425356370-5', 'gallery', 'detail', 'gallery', '227', 'vi', 1425356370, 1425356370),
(478, '1425356370-6', '', 'detail', '', '227', 'en', 1425356370, 1425356370),
(479, '1425356370-7', '', 'detail', '', '227', 'vi', 1425356370, 1425356370),
(480, '1425356370-8', 'gallery', 'detail', 'gallery', '229', 'vi', 1425356370, 1425356370),
(481, '1425356370-9', '', 'detail', '', '229', 'en', 1425356370, 1425356370),
(482, '1425356370-10', '', 'detail', '', '229', 'vi', 1425356370, 1425356370),
(483, '1425356370-10-1', 'gallery', 'detail', 'gallery', '231', 'vi', 1425356370, 1425356370),
(484, '1425356370-10-2', '', 'detail', '', '231', 'en', 1425356370, 1425356370),
(485, '1425356370-10-3', '', 'detail', '', '231', 'vi', 1425356370, 1425356370),
(486, '1425356370-10-4', 'gallery', 'detail', 'gallery', '233', 'vi', 1425356370, 1425356370),
(487, '1425356370-10-5', '', 'detail', '', '233', 'en', 1425356370, 1425356370),
(488, '1425356371', '', 'detail', '', '233', 'vi', 1425356371, 1425356371),
(489, '1425356371-1', 'gallery', 'detail', 'gallery', '235', 'vi', 1425356371, 1425356371),
(490, '1425356371-2', '', 'detail', '', '235', 'en', 1425356371, 1425356371),
(491, '1425356371-3', '', 'detail', '', '235', 'vi', 1425356371, 1425356371),
(492, '1425356371-4', 'gallery', 'detail', 'gallery', '237', 'vi', 1425356371, 1425356371),
(493, '1425356371-5', '', 'detail', '', '237', 'en', 1425356371, 1425356371),
(494, '1425356371-6', '', 'detail', '', '237', 'vi', 1425356371, 1425356371),
(495, '1425356371-7', 'gallery', 'detail', 'gallery', '239', 'vi', 1425356371, 1425356371),
(496, '1425356371-8', '', 'detail', '', '239', 'en', 1425356371, 1425356371),
(497, '1425356371-9', '', 'detail', '', '239', 'vi', 1425356371, 1425356371),
(498, '1425356371-10', 'gallery', 'detail', 'gallery', '241', 'vi', 1425356371, 1425356371),
(499, '1425356371-10-1', '', 'detail', '', '241', 'en', 1425356371, 1425356371),
(500, '1425356371-10-2', '', 'detail', '', '241', 'vi', 1425356371, 1425356371),
(501, '1425356371-10-3', 'gallery', 'detail', 'gallery', '243', 'vi', 1425356371, 1425356371),
(502, '1425356371-10-4', '', 'detail', '', '243', 'en', 1425356371, 1425356371),
(503, '1425356371-10-5', '', 'detail', '', '243', 'vi', 1425356371, 1425356371),
(504, '1425356371-10-6', 'gallery', 'detail', 'gallery', '245', 'vi', 1425356371, 1425356371),
(505, '1425356372', '', 'detail', '', '245', 'en', 1425356372, 1425356372),
(506, '1425356372-1', '', 'detail', '', '245', 'vi', 1425356372, 1425356372),
(507, '1425356372-2', 'gallery', 'detail', 'gallery', '247', 'vi', 1425356372, 1425356372),
(508, '1425356372-3', '', 'detail', '', '247', 'en', 1425356372, 1425356372),
(509, '1425356372-4', '', 'detail', '', '247', 'vi', 1425356372, 1425356372),
(510, '1425356372-5', 'gallery', 'detail', 'gallery', '249', 'vi', 1425356372, 1425356372),
(511, '1425356372-6', '', 'detail', '', '249', 'en', 1425356372, 1425356372),
(512, '1425356372-7', '', 'detail', '', '249', 'vi', 1425356372, 1425356372),
(513, '1425356372-8', 'gallery', 'detail', 'gallery', '251', 'vi', 1425356372, 1425356372),
(514, '1425356372-9', '', 'detail', '', '251', 'en', 1425356372, 1425356372),
(515, '1425356372-10', '', 'detail', '', '251', 'vi', 1425356372, 1425356372),
(516, '1425356372-10-1', 'gallery', 'detail', 'gallery', '253', 'vi', 1425356372, 1425356372),
(517, '1425356372-10-2', '', 'detail', '', '253', 'en', 1425356372, 1425356372),
(518, '1425356372-10-3', '', 'detail', '', '253', 'vi', 1425356372, 1425356372),
(519, '1425356372-10-4', 'gallery', 'detail', 'gallery', '255', 'vi', 1425356372, 1425356372),
(520, '1425356372-10-5', '', 'detail', '', '255', 'en', 1425356372, 1425356372),
(521, '1425356372-10-6', '', 'detail', '', '255', 'vi', 1425356372, 1425356372),
(522, '1425356372-10-7', 'gallery', 'detail', 'gallery', '257', 'vi', 1425356372, 1425356372),
(523, '1425356372-10-8', '', 'detail', '', '257', 'en', 1425356372, 1425356372),
(524, '1425356372-10-9', '', 'detail', '', '257', 'vi', 1425356372, 1425356372),
(525, '1425356372-10-10', 'gallery', 'detail', 'gallery', '259', 'vi', 1425356372, 1425356372),
(526, '1425356372-10-10-1', '', 'detail', '', '259', 'en', 1425356372, 1425356372),
(527, '1425356373', '', 'detail', '', '259', 'vi', 1425356373, 1425356373),
(528, '1425356373-1', 'gallery', 'detail', 'gallery', '261', 'vi', 1425356373, 1425356373),
(529, '1425356373-2', '', 'detail', '', '261', 'en', 1425356373, 1425356373),
(530, '1425356373-3', '', 'detail', '', '261', 'vi', 1425356373, 1425356373),
(531, '1425356373-4', 'gallery', 'detail', 'gallery', '263', 'vi', 1425356373, 1425356373),
(532, '1425356373-5', '', 'detail', '', '263', 'en', 1425356373, 1425356373),
(533, '1425356373-6', '', 'detail', '', '263', 'vi', 1425356373, 1425356373),
(534, '1425356373-7', 'gallery', 'detail', 'gallery', '265', 'vi', 1425356373, 1425356373),
(535, '1425356373-8', '', 'detail', '', '265', 'en', 1425356373, 1425356373),
(536, '1425356373-9', '', 'detail', '', '265', 'vi', 1425356373, 1425356373),
(537, '1425356373-10', 'gallery', 'detail', 'gallery', '267', 'vi', 1425356373, 1425356373),
(538, '1425356373-10-1', '', 'detail', '', '267', 'en', 1425356373, 1425356373),
(539, '1425356373-10-2', '', 'detail', '', '267', 'vi', 1425356373, 1425356373),
(540, '1425356373-10-3', 'gallery', 'detail', 'gallery', '269', 'vi', 1425356373, 1425356373),
(541, '1425356373-10-4', '', 'detail', '', '269', 'en', 1425356373, 1425356373),
(542, '1425356373-10-5', '', 'detail', '', '269', 'vi', 1425356373, 1425356373),
(543, '1425356373-10-6', 'gallery', 'detail', 'gallery', '271', 'vi', 1425356373, 1425356373),
(544, '1425356373-10-7', '', 'detail', '', '271', 'en', 1425356373, 1425356373),
(545, '1425356373-10-8', '', 'detail', '', '271', 'vi', 1425356373, 1425356373),
(546, '1425356373-10-9', 'gallery', 'detail', 'gallery', '273', 'vi', 1425356373, 1425356373),
(547, '1425356373-10-10', '', 'detail', '', '273', 'en', 1425356373, 1425356373),
(548, '1425356373-10-10-1', '', 'detail', '', '273', 'vi', 1425356373, 1425356373),
(549, '1425356373-10-10-2', 'gallery', 'detail', 'gallery', '275', 'vi', 1425356373, 1425356373),
(550, '1425356374', '', 'detail', '', '275', 'en', 1425356374, 1425356374),
(551, '1425356374-1', '', 'detail', '', '275', 'vi', 1425356374, 1425356374),
(552, '1425356374-2', 'gallery', 'detail', 'gallery', '277', 'vi', 1425356374, 1425356374),
(553, '1425356374-3', '', 'detail', '', '277', 'en', 1425356374, 1425356374),
(554, '1425356374-4', '', 'detail', '', '277', 'vi', 1425356374, 1425356374),
(555, '1425356374-5', 'gallery', 'detail', 'gallery', '279', 'vi', 1425356374, 1425356374),
(556, '1425356374-6', '', 'detail', '', '279', 'en', 1425356374, 1425356374),
(557, '1425356374-7', '', 'detail', '', '279', 'vi', 1425356374, 1425356374),
(558, '1425356374-8', 'gallery', 'detail', 'gallery', '281', 'vi', 1425356374, 1425356374),
(559, '1425356374-9', '', 'detail', '', '281', 'en', 1425356374, 1425356374),
(560, '1425356374-10', '', 'detail', '', '281', 'vi', 1425356374, 1425356374),
(561, '1425356374-10-1', 'gallery', 'detail', 'gallery', '283', 'vi', 1425356374, 1425356374),
(562, '1425356374-10-2', '', 'detail', '', '283', 'en', 1425356374, 1425356374),
(563, '1425356374-10-3', '', 'detail', '', '283', 'vi', 1425356374, 1425356374),
(564, '1425356374-10-4', 'gallery', 'detail', 'gallery', '285', 'vi', 1425356374, 1425356374),
(565, '1425356374-10-5', '', 'detail', '', '285', 'en', 1425356374, 1425356374),
(566, '1425356374-10-6', '', 'detail', '', '285', 'vi', 1425356374, 1425356374),
(567, '1425356374-10-7', 'gallery', 'detail', 'gallery', '287', 'vi', 1425356374, 1425356374),
(568, '1425356374-10-8', '', 'detail', '', '287', 'en', 1425356374, 1425356374),
(569, '1425356374-10-9', '', 'detail', '', '287', 'vi', 1425356374, 1425356374),
(570, '1425356375', 'gallery', 'detail', 'gallery', '289', 'vi', 1425356375, 1425356375),
(571, '1425356375-1', '', 'detail', '', '289', 'en', 1425356375, 1425356375),
(572, '1425356375-2', '', 'detail', '', '289', 'vi', 1425356375, 1425356375),
(573, '1425356375-3', 'gallery', 'detail', 'gallery', '291', 'vi', 1425356375, 1425356375),
(574, '1425356375-4', '', 'detail', '', '291', 'en', 1425356375, 1425356375),
(575, '1425356375-5', '', 'detail', '', '291', 'vi', 1425356375, 1425356375),
(576, '1425356375-6', 'gallery', 'detail', 'gallery', '293', 'vi', 1425356375, 1425356375),
(577, '1425356375-7', '', 'detail', '', '293', 'en', 1425356375, 1425356375),
(578, '1425356375-8', '', 'detail', '', '293', 'vi', 1425356375, 1425356375),
(579, '1425356375-9', 'gallery', 'detail', 'gallery', '295', 'vi', 1425356375, 1425356375),
(580, '1425356375-10', '', 'detail', '', '295', 'en', 1425356375, 1425356375),
(581, '1425356375-10-1', '', 'detail', '', '295', 'vi', 1425356375, 1425356375),
(582, '1425356375-10-2', 'gallery', 'detail', 'gallery', '297', 'vi', 1425356375, 1425356375),
(583, '1425356376', '', 'detail', '', '297', 'en', 1425356376, 1425356376),
(584, '1425356376-1', '', 'detail', '', '297', 'vi', 1425356376, 1425356376),
(585, '1425356376-2', 'gallery', 'detail', 'gallery', '299', 'vi', 1425356376, 1425356376),
(586, '1425356376-3', '', 'detail', '', '299', 'en', 1425356376, 1425356376),
(587, '1425356376-4', '', 'detail', '', '299', 'vi', 1425356376, 1425356376),
(588, '1425356376-5', 'gallery', 'detail', 'gallery', '301', 'vi', 1425356376, 1425356376),
(589, '1425356376-6', '', 'detail', '', '301', 'en', 1425356376, 1425356376),
(590, '1425356376-7', '', 'detail', '', '301', 'vi', 1425356376, 1425356376),
(591, '1425356376-8', 'gallery', 'detail', 'gallery', '303', 'vi', 1425356376, 1425356376),
(592, '1425356376-9', '', 'detail', '', '303', 'en', 1425356376, 1425356376),
(593, '1425356376-10', '', 'detail', '', '303', 'vi', 1425356376, 1425356376),
(594, '1425356376-10-1', 'gallery', 'detail', 'gallery', '305', 'vi', 1425356376, 1425356376),
(595, '1425356376-10-2', '', 'detail', '', '305', 'en', 1425356376, 1425356376),
(596, '1425356376-10-3', '', 'detail', '', '305', 'vi', 1425356376, 1425356376),
(597, '1425356377', 'gallery', 'detail', 'gallery', '307', 'vi', 1425356377, 1425356377),
(598, '1425356377-1', '', 'detail', '', '307', 'en', 1425356377, 1425356377),
(599, '1425356377-2', '', 'detail', '', '307', 'vi', 1425356377, 1425356377),
(600, '1425356377-3', 'gallery', 'detail', 'gallery', '309', 'vi', 1425356377, 1425356377),
(601, '1425356377-4', '', 'detail', '', '309', 'en', 1425356377, 1425356377),
(602, '1425356377-5', '', 'detail', '', '309', 'vi', 1425356377, 1425356377),
(603, '1425356377-6', 'gallery', 'detail', 'gallery', '311', 'vi', 1425356377, 1425356377),
(604, '1425356377-7', '', 'detail', '', '311', 'en', 1425356377, 1425356377),
(605, '1425356377-8', '', 'detail', '', '311', 'vi', 1425356377, 1425356377),
(606, '1425356377-9', 'gallery', 'detail', 'gallery', '313', 'vi', 1425356377, 1425356377),
(607, '1425356377-10', '', 'detail', '', '313', 'en', 1425356377, 1425356377),
(608, '1425356377-10-1', '', 'detail', '', '313', 'vi', 1425356377, 1425356377),
(609, '1425356377-10-2', 'gallery', 'detail', 'gallery', '315', 'vi', 1425356377, 1425356377),
(610, '1425356377-10-3', '', 'detail', '', '315', 'en', 1425356377, 1425356377),
(611, '1425356377-10-4', '', 'detail', '', '315', 'vi', 1425356377, 1425356377),
(612, '1425356377-10-5', 'gallery', 'detail', 'gallery', '317', 'vi', 1425356377, 1425356377),
(613, '1425356377-10-6', '', 'detail', '', '317', 'en', 1425356377, 1425356377),
(614, '1425356377-10-7', '', 'detail', '', '317', 'vi', 1425356377, 1425356377),
(615, '1425356377-10-8', 'gallery', 'detail', 'gallery', '319', 'vi', 1425356377, 1425356377);
INSERT INTO `friendly_link` (`id`, `friendly_link`, `module`, `action`, `dbtable`, `dbtable_id`, `lang`, `date_create`, `date_update`) VALUES
(616, '1425356377-10-9', '', 'detail', '', '319', 'en', 1425356377, 1425356377),
(617, '1425356378', '', 'detail', '', '319', 'vi', 1425356378, 1425356378),
(618, '1425356378-1', 'gallery', 'detail', 'gallery', '321', 'vi', 1425356378, 1425356378),
(619, '1425356378-2', '', 'detail', '', '321', 'en', 1425356378, 1425356378),
(620, '1425356378-3', '', 'detail', '', '321', 'vi', 1425356378, 1425356378),
(621, '1425356378-4', 'gallery', 'detail', 'gallery', '323', 'vi', 1425356378, 1425356378),
(622, '1425356378-5', '', 'detail', '', '323', 'en', 1425356378, 1425356378),
(623, '1425356378-6', '', 'detail', '', '323', 'vi', 1425356378, 1425356378),
(624, '1425356378-7', 'gallery', 'detail', 'gallery', '325', 'vi', 1425356378, 1425356378),
(625, '1425356378-8', '', 'detail', '', '325', 'en', 1425356378, 1425356378),
(626, '1425356378-9', '', 'detail', '', '325', 'vi', 1425356378, 1425356378),
(627, '1425356378-10', 'gallery', 'detail', 'gallery', '327', 'vi', 1425356378, 1425356378),
(628, '1425356378-10-1', '', 'detail', '', '327', 'en', 1425356378, 1425356378),
(629, '1425356378-10-2', '', 'detail', '', '327', 'vi', 1425356378, 1425356378),
(630, '1425356378-10-3', 'gallery', 'detail', 'gallery', '329', 'vi', 1425356378, 1425356378),
(631, '1425356378-10-4', '', 'detail', '', '329', 'en', 1425356378, 1425356378),
(632, '1425356378-10-5', '', 'detail', '', '329', 'vi', 1425356378, 1425356378),
(633, '1425356378-10-6', 'gallery', 'detail', 'gallery', '331', 'vi', 1425356378, 1425356378),
(634, '1425356378-10-7', '', 'detail', '', '331', 'en', 1425356378, 1425356378),
(635, '1425356378-10-8', '', 'detail', '', '331', 'vi', 1425356378, 1425356378),
(636, '1425356378-10-9', 'gallery', 'detail', 'gallery', '333', 'vi', 1425356378, 1425356378),
(637, '1425356379', '', 'detail', '', '333', 'en', 1425356379, 1425356379),
(638, '1425356379-1', '', 'detail', '', '333', 'vi', 1425356379, 1425356379),
(639, '1425356379-2', 'gallery', 'detail', 'gallery', '335', 'vi', 1425356379, 1425356379),
(640, '1425356379-3', '', 'detail', '', '335', 'en', 1425356379, 1425356379),
(641, '1425356379-4', '', 'detail', '', '335', 'vi', 1425356379, 1425356379),
(642, '1425356379-5', 'gallery', 'detail', 'gallery', '337', 'vi', 1425356379, 1425356379),
(643, '1425356379-6', '', 'detail', '', '337', 'en', 1425356379, 1425356379),
(644, '1425356379-7', '', 'detail', '', '337', 'vi', 1425356379, 1425356379),
(645, '1425356379-8', 'gallery', 'detail', 'gallery', '339', 'vi', 1425356379, 1425356379),
(646, '1425356379-9', '', 'detail', '', '339', 'en', 1425356379, 1425356379),
(647, '1425356379-10', '', 'detail', '', '339', 'vi', 1425356379, 1425356379),
(648, '1425356379-10-1', 'gallery', 'detail', 'gallery', '341', 'vi', 1425356379, 1425356379),
(649, '1425356379-10-2', '', 'detail', '', '341', 'en', 1425356379, 1425356379),
(650, '1425356379-10-3', '', 'detail', '', '341', 'vi', 1425356379, 1425356379),
(651, '1425356379-10-4', 'gallery', 'detail', 'gallery', '343', 'vi', 1425356379, 1425356379),
(652, '1425356379-10-5', '', 'detail', '', '343', 'en', 1425356379, 1425356379),
(653, '1425356379-10-6', '', 'detail', '', '343', 'vi', 1425356379, 1425356379),
(654, '1425356379-10-7', 'gallery', 'detail', 'gallery', '345', 'vi', 1425356379, 1425356379),
(655, '1425356379-10-8', '', 'detail', '', '345', 'en', 1425356379, 1425356379),
(656, '1425356379-10-9', '', 'detail', '', '345', 'vi', 1425356379, 1425356379),
(657, '1425356379-10-10', 'gallery', 'detail', 'gallery', '347', 'vi', 1425356379, 1425356379),
(658, '1425356379-10-10-1', '', 'detail', '', '347', 'en', 1425356379, 1425356379),
(659, '1425356379-10-10-2', '', 'detail', '', '347', 'vi', 1425356380, 1425356380),
(660, '1425356380', 'gallery', 'detail', 'gallery', '349', 'vi', 1425356380, 1425356380),
(661, '1425356380-1', '', 'detail', '', '349', 'en', 1425356380, 1425356380),
(662, '1425356380-2', '', 'detail', '', '349', 'vi', 1425356380, 1425356380),
(663, '1425356380-3', 'gallery', 'detail', 'gallery', '351', 'vi', 1425356380, 1425356380),
(664, '1425356380-4', '', 'detail', '', '351', 'en', 1425356380, 1425356380),
(665, '1425356380-5', '', 'detail', '', '351', 'vi', 1425356380, 1425356380),
(666, '1425356380-6', 'gallery', 'detail', 'gallery', '353', 'vi', 1425356380, 1425356380),
(667, '1425356380-7', '', 'detail', '', '353', 'en', 1425356380, 1425356380),
(668, '1425356380-8', '', 'detail', '', '353', 'vi', 1425356380, 1425356380),
(669, '1425356380-9', 'gallery', 'detail', 'gallery', '355', 'vi', 1425356380, 1425356380),
(670, '1425356380-10', '', 'detail', '', '355', 'en', 1425356380, 1425356380),
(671, '1425356380-10-1', '', 'detail', '', '355', 'vi', 1425356380, 1425356380),
(672, '1425356380-10-2', 'gallery', 'detail', 'gallery', '357', 'vi', 1425356380, 1425356380),
(673, '1425356380-10-3', '', 'detail', '', '357', 'en', 1425356380, 1425356380),
(674, '1425356380-10-4', '', 'detail', '', '357', 'vi', 1425356380, 1425356380),
(675, '1425356380-10-5', 'gallery', 'detail', 'gallery', '359', 'vi', 1425356380, 1425356380),
(676, '1425356380-10-6', '', 'detail', '', '359', 'en', 1425356380, 1425356380),
(677, '1425356380-10-7', '', 'detail', '', '359', 'vi', 1425356380, 1425356380),
(678, '1425356380-10-8', 'gallery', 'detail', 'gallery', '361', 'vi', 1425356380, 1425356380),
(679, '1425356380-10-9', '', 'detail', '', '361', 'en', 1425356380, 1425356380),
(680, '1425356380-10-10', '', 'detail', '', '361', 'vi', 1425356380, 1425356380),
(681, '1425356381', 'gallery', 'detail', 'gallery', '363', 'vi', 1425356381, 1425356381),
(682, '1425356381-1', '', 'detail', '', '363', 'en', 1425356381, 1425356381),
(683, '1425356381-2', '', 'detail', '', '363', 'vi', 1425356381, 1425356381),
(684, '1425356381-3', 'gallery', 'detail', 'gallery', '365', 'vi', 1425356381, 1425356381),
(685, '1425356381-4', '', 'detail', '', '365', 'en', 1425356381, 1425356381),
(686, '1425356381-5', '', 'detail', '', '365', 'vi', 1425356381, 1425356381),
(687, '1425356381-6', 'gallery', 'detail', 'gallery', '367', 'vi', 1425356381, 1425356381),
(688, '1425356381-7', '', 'detail', '', '367', 'en', 1425356381, 1425356381),
(689, '1425356381-8', '', 'detail', '', '367', 'vi', 1425356381, 1425356381),
(690, '1425356381-9', 'gallery', 'detail', 'gallery', '369', 'vi', 1425356381, 1425356381),
(691, '1425356381-10', '', 'detail', '', '369', 'en', 1425356381, 1425356381),
(692, '1425356381-10-1', '', 'detail', '', '369', 'vi', 1425356381, 1425356381),
(693, '1425356381-10-2', 'gallery', 'detail', 'gallery', '371', 'vi', 1425356381, 1425356381),
(694, '1425356381-10-3', '', 'detail', '', '371', 'en', 1425356381, 1425356381),
(695, '1425356381-10-4', '', 'detail', '', '371', 'vi', 1425356381, 1425356381),
(696, '1425356381-10-5', 'gallery', 'detail', 'gallery', '373', 'vi', 1425356381, 1425356381),
(697, '1425356382', '', 'detail', '', '373', 'en', 1425356382, 1425356382),
(698, '1425356382-1', '', 'detail', '', '373', 'vi', 1425356382, 1425356382),
(699, '1425356382-2', 'gallery', 'detail', 'gallery', '375', 'vi', 1425356382, 1425356382),
(700, '1425356382-3', '', 'detail', '', '375', 'en', 1425356382, 1425356382),
(701, '1425356382-4', '', 'detail', '', '375', 'vi', 1425356382, 1425356382),
(702, '1425356382-5', 'gallery', 'detail', 'gallery', '377', 'vi', 1425356382, 1425356382),
(703, '1425356382-6', '', 'detail', '', '377', 'en', 1425356382, 1425356382),
(704, '1425356382-7', '', 'detail', '', '377', 'vi', 1425356382, 1425356382),
(705, '1425356382-8', 'gallery', 'detail', 'gallery', '379', 'vi', 1425356382, 1425356382),
(706, '1425356382-9', '', 'detail', '', '379', 'en', 1425356382, 1425356382),
(707, '1425356382-10', '', 'detail', '', '379', 'vi', 1425356382, 1425356382),
(708, '1425356382-10-1', 'gallery', 'detail', 'gallery', '381', 'vi', 1425356382, 1425356382),
(709, '1425356382-10-2', '', 'detail', '', '381', 'en', 1425356382, 1425356382),
(710, '1425356382-10-3', '', 'detail', '', '381', 'vi', 1425356382, 1425356382),
(711, '1425356382-10-4', 'gallery', 'detail', 'gallery', '383', 'vi', 1425356382, 1425356382),
(712, '1425356382-10-5', '', 'detail', '', '383', 'en', 1425356382, 1425356382),
(713, '1425356382-10-6', '', 'detail', '', '383', 'vi', 1425356382, 1425356382),
(714, '1425356382-10-7', 'gallery', 'detail', 'gallery', '385', 'vi', 1425356382, 1425356382),
(715, '1425356383', '', 'detail', '', '385', 'en', 1425356383, 1425356383),
(716, '1425356383-1', '', 'detail', '', '385', 'vi', 1425356383, 1425356383),
(717, '1425356383-2', 'gallery', 'detail', 'gallery', '387', 'vi', 1425356383, 1425356383),
(718, '1425356383-3', '', 'detail', '', '387', 'en', 1425356383, 1425356383),
(719, '1425356383-4', '', 'detail', '', '387', 'vi', 1425356383, 1425356383),
(720, '1425356383-5', 'gallery', 'detail', 'gallery', '389', 'vi', 1425356383, 1425356383),
(721, '1425356383-6', '', 'detail', '', '389', 'en', 1425356383, 1425356383),
(722, '1425356383-7', '', 'detail', '', '389', 'vi', 1425356383, 1425356383),
(723, '1425356383-8', 'gallery', 'detail', 'gallery', '391', 'vi', 1425356383, 1425356383),
(724, '1425356383-9', '', 'detail', '', '391', 'en', 1425356383, 1425356383),
(725, '1425356383-10', '', 'detail', '', '391', 'vi', 1425356383, 1425356383),
(726, '1425356383-10-1', 'gallery', 'detail', 'gallery', '393', 'vi', 1425356383, 1425356383),
(727, '1425356383-10-2', '', 'detail', '', '393', 'en', 1425356383, 1425356383),
(728, '1425356383-10-3', '', 'detail', '', '393', 'vi', 1425356383, 1425356383),
(729, '1425356383-10-4', 'gallery', 'detail', 'gallery', '395', 'vi', 1425356383, 1425356383),
(730, '1425356383-10-5', '', 'detail', '', '395', 'en', 1425356383, 1425356383),
(731, '1425356383-10-6', '', 'detail', '', '395', 'vi', 1425356383, 1425356383),
(732, '1425356383-10-7', 'gallery', 'detail', 'gallery', '397', 'vi', 1425356383, 1425356383),
(733, '1425356383-10-8', '', 'detail', '', '397', 'en', 1425356383, 1425356383),
(734, '1425356383-10-9', '', 'detail', '', '397', 'vi', 1425356383, 1425356383),
(735, '1425356383-10-10', 'gallery', 'detail', 'gallery', '399', 'vi', 1425356383, 1425356383),
(736, '1425356384', '', 'detail', '', '399', 'en', 1425356384, 1425356384),
(737, '1425356384-1', '', 'detail', '', '399', 'vi', 1425356384, 1425356384),
(738, '1425356384-2', 'gallery', 'detail', 'gallery', '401', 'vi', 1425356384, 1425356384),
(739, '1425356384-3', '', 'detail', '', '401', 'en', 1425356384, 1425356384),
(740, '1425356384-4', '', 'detail', '', '401', 'vi', 1425356384, 1425356384),
(741, '1425356384-5', 'gallery', 'detail', 'gallery', '403', 'vi', 1425356384, 1425356384),
(742, '1425356384-6', '', 'detail', '', '403', 'en', 1425356384, 1425356384),
(743, '1425356384-7', '', 'detail', '', '403', 'vi', 1425356384, 1425356384),
(744, '1425356384-8', 'gallery', 'detail', 'gallery', '405', 'vi', 1425356384, 1425356384),
(745, '1425356384-9', '', 'detail', '', '405', 'en', 1425356384, 1425356384),
(746, '1425356384-10', '', 'detail', '', '405', 'vi', 1425356384, 1425356384),
(747, '1425356384-10-1', 'gallery', 'detail', 'gallery', '407', 'vi', 1425356384, 1425356384),
(748, '1425356384-10-2', '', 'detail', '', '407', 'en', 1425356384, 1425356384),
(749, '1425356384-10-3', '', 'detail', '', '407', 'vi', 1425356384, 1425356384),
(750, '1425356384-10-4', 'gallery', 'detail', 'gallery', '409', 'vi', 1425356384, 1425356384),
(751, '1425356384-10-5', '', 'detail', '', '409', 'en', 1425356384, 1425356384),
(752, '1425356384-10-6', '', 'detail', '', '409', 'vi', 1425356384, 1425356384),
(753, '1425356384-10-7', 'gallery', 'detail', 'gallery', '411', 'vi', 1425356384, 1425356384),
(754, '1425356384-10-8', '', 'detail', '', '411', 'en', 1425356384, 1425356384),
(755, '1425356384-10-9', '', 'detail', '', '411', 'vi', 1425356384, 1425356384),
(756, '1425356384-10-10', 'gallery', 'detail', 'gallery', '413', 'vi', 1425356384, 1425356384),
(757, '1425356384-10-10-1', '', 'detail', '', '413', 'en', 1425356384, 1425356384),
(758, '1425356384-10-10-2', '', 'detail', '', '413', 'vi', 1425356384, 1425356384),
(759, '1425356385', 'gallery', 'detail', 'gallery', '415', 'vi', 1425356385, 1425356385),
(760, '1425356385-1', '', 'detail', '', '415', 'en', 1425356385, 1425356385),
(761, '1425356385-2', '', 'detail', '', '415', 'vi', 1425356385, 1425356385),
(762, '1425356385-3', 'gallery', 'detail', 'gallery', '417', 'vi', 1425356385, 1425356385),
(763, '1425356385-4', '', 'detail', '', '417', 'en', 1425356385, 1425356385),
(764, '1425356385-5', '', 'detail', '', '417', 'vi', 1425356385, 1425356385),
(765, '1425356385-6', 'gallery', 'detail', 'gallery', '419', 'vi', 1425356385, 1425356385),
(766, '1425356385-7', '', 'detail', '', '419', 'en', 1425356385, 1425356385),
(767, '1425356385-8', '', 'detail', '', '419', 'vi', 1425356385, 1425356385),
(768, '1425356385-9', 'gallery', 'detail', 'gallery', '421', 'vi', 1425356385, 1425356385),
(769, '1425356385-10', '', 'detail', '', '421', 'en', 1425356385, 1425356385),
(770, '1425356385-10-1', '', 'detail', '', '421', 'vi', 1425356385, 1425356385),
(771, '1425356385-10-2', 'gallery', 'detail', 'gallery', '423', 'vi', 1425356385, 1425356385),
(772, '1425356385-10-3', '', 'detail', '', '423', 'en', 1425356385, 1425356385),
(773, '1425356385-10-4', '', 'detail', '', '423', 'vi', 1425356385, 1425356385),
(774, '1425356385-10-5', 'gallery', 'detail', 'gallery', '425', 'vi', 1425356385, 1425356385),
(775, '1425356386', '', 'detail', '', '425', 'en', 1425356386, 1425356386),
(776, '1425356386-1', '', 'detail', '', '425', 'vi', 1425356386, 1425356386),
(777, '1425356386-2', 'gallery', 'detail', 'gallery', '427', 'vi', 1425356386, 1425356386),
(778, '1425356386-3', '', 'detail', '', '427', 'en', 1425356386, 1425356386),
(779, '1425356386-4', '', 'detail', '', '427', 'vi', 1425356386, 1425356386),
(780, '1425356386-5', 'gallery', 'detail', 'gallery', '429', 'vi', 1425356386, 1425356386),
(781, '1425356386-6', '', 'detail', '', '429', 'en', 1425356386, 1425356386),
(782, '1425356386-7', '', 'detail', '', '429', 'vi', 1425356386, 1425356386),
(783, '1425356386-8', 'gallery', 'detail', 'gallery', '431', 'vi', 1425356386, 1425356386),
(784, '1425356386-9', '', 'detail', '', '431', 'en', 1425356386, 1425356386),
(785, '1425356386-10', '', 'detail', '', '431', 'vi', 1425356386, 1425356386),
(786, '1425356386-10-1', 'gallery', 'detail', 'gallery', '433', 'vi', 1425356386, 1425356386),
(787, '1425356386-10-2', '', 'detail', '', '433', 'en', 1425356386, 1425356386),
(788, '1425356386-10-3', '', 'detail', '', '433', 'vi', 1425356386, 1425356386),
(789, '1425356386-10-4', 'gallery', 'detail', 'gallery', '435', 'vi', 1425356386, 1425356386),
(790, '1425356386-10-5', '', 'detail', '', '435', 'en', 1425356386, 1425356386),
(791, '1425356386-10-6', '', 'detail', '', '435', 'vi', 1425356386, 1425356386),
(792, '1425356386-10-7', 'gallery', 'detail', 'gallery', '437', 'vi', 1425356386, 1425356386),
(793, '1425356386-10-8', '', 'detail', '', '437', 'en', 1425356386, 1425356386),
(794, '1425356386-10-9', '', 'detail', '', '437', 'vi', 1425356386, 1425356386),
(795, '1425356386-10-10', 'gallery', 'detail', 'gallery', '439', 'vi', 1425356386, 1425356386),
(796, '1425356387', '', 'detail', '', '439', 'en', 1425356387, 1425356387),
(797, '1425356387-1', '', 'detail', '', '439', 'vi', 1425356387, 1425356387),
(798, '1425356387-2', 'gallery', 'detail', 'gallery', '441', 'vi', 1425356387, 1425356387),
(799, '1425356387-3', '', 'detail', '', '441', 'en', 1425356387, 1425356387),
(800, '1425356387-4', '', 'detail', '', '441', 'vi', 1425356387, 1425356387),
(801, '1425356387-5', 'gallery', 'detail', 'gallery', '443', 'vi', 1425356387, 1425356387),
(802, '1425356387-6', '', 'detail', '', '443', 'en', 1425356387, 1425356387),
(803, '1425356387-7', '', 'detail', '', '443', 'vi', 1425356387, 1425356387),
(804, '1425356387-8', 'gallery', 'detail', 'gallery', '445', 'vi', 1425356387, 1425356387),
(805, '1425356387-9', '', 'detail', '', '445', 'en', 1425356387, 1425356387),
(806, '1425356387-10', '', 'detail', '', '445', 'vi', 1425356387, 1425356387),
(807, '1425356387-10-1', 'gallery', 'detail', 'gallery', '447', 'vi', 1425356387, 1425356387),
(808, '1425356387-10-2', '', 'detail', '', '447', 'en', 1425356387, 1425356387),
(809, '1425356387-10-3', '', 'detail', '', '447', 'vi', 1425356387, 1425356387),
(810, '1425356387-10-4', 'gallery', 'detail', 'gallery', '449', 'vi', 1425356387, 1425356387),
(811, '1425356387-10-5', '', 'detail', '', '449', 'en', 1425356387, 1425356387),
(812, '1425356387-10-6', '', 'detail', '', '449', 'vi', 1425356387, 1425356387),
(813, '1425356388', 'gallery', 'detail', 'gallery', '451', 'vi', 1425356388, 1425356388),
(814, '1425356388-1', '', 'detail', '', '451', 'en', 1425356388, 1425356388),
(815, '1425356388-2', '', 'detail', '', '451', 'vi', 1425356388, 1425356388),
(816, '1425356388-3', 'gallery', 'detail', 'gallery', '453', 'vi', 1425356388, 1425356388),
(817, '1425356388-4', '', 'detail', '', '453', 'en', 1425356388, 1425356388),
(818, '1425356388-5', '', 'detail', '', '453', 'vi', 1425356388, 1425356388),
(819, '1425356388-6', 'gallery', 'detail', 'gallery', '455', 'vi', 1425356388, 1425356388),
(820, '1425356388-7', '', 'detail', '', '455', 'en', 1425356388, 1425356388),
(821, '1425356388-8', '', 'detail', '', '455', 'vi', 1425356388, 1425356388),
(822, '1425356388-9', 'gallery', 'detail', 'gallery', '457', 'vi', 1425356388, 1425356388),
(823, '1425356388-10', '', 'detail', '', '457', 'en', 1425356388, 1425356388),
(824, '1425356388-10-1', '', 'detail', '', '457', 'vi', 1425356388, 1425356388),
(825, '1425356388-10-2', 'gallery', 'detail', 'gallery', '459', 'vi', 1425356388, 1425356388),
(826, '1425356388-10-3', '', 'detail', '', '459', 'en', 1425356388, 1425356388),
(827, '1425356388-10-4', '', 'detail', '', '459', 'vi', 1425356388, 1425356388),
(828, '1425356388-10-5', 'gallery', 'detail', 'gallery', '461', 'vi', 1425356388, 1425356388),
(829, '1425356389', '', 'detail', '', '461', 'en', 1425356389, 1425356389),
(830, '1425356389-1', '', 'detail', '', '461', 'vi', 1425356389, 1425356389),
(831, '1425356389-2', 'gallery', 'detail', 'gallery', '463', 'vi', 1425356389, 1425356389),
(832, '1425356389-3', '', 'detail', '', '463', 'en', 1425356389, 1425356389),
(833, '1425356389-4', '', 'detail', '', '463', 'vi', 1425356389, 1425356389),
(834, '1425356389-5', 'gallery', 'detail', 'gallery', '465', 'vi', 1425356389, 1425356389),
(835, '1425356389-6', '', 'detail', '', '465', 'en', 1425356389, 1425356389),
(836, '1425356389-7', '', 'detail', '', '465', 'vi', 1425356389, 1425356389),
(837, '1425356389-8', 'gallery', 'detail', 'gallery', '467', 'vi', 1425356389, 1425356389),
(838, '1425356389-9', '', 'detail', '', '467', 'en', 1425356389, 1425356389),
(839, '1425356389-10', '', 'detail', '', '467', 'vi', 1425356389, 1425356389),
(840, '1425356389-10-1', 'gallery', 'detail', 'gallery', '469', 'vi', 1425356389, 1425356389),
(841, '1425356389-10-2', '', 'detail', '', '469', 'en', 1425356389, 1425356389),
(842, '1425356389-10-3', '', 'detail', '', '469', 'vi', 1425356389, 1425356389),
(843, '1425356389-10-4', 'gallery', 'detail', 'gallery', '471', 'vi', 1425356389, 1425356389),
(844, '1425356389-10-5', '', 'detail', '', '471', 'en', 1425356389, 1425356389),
(845, '1425356389-10-6', '', 'detail', '', '471', 'vi', 1425356389, 1425356389),
(846, '1425356389-10-7', 'gallery', 'detail', 'gallery', '473', 'vi', 1425356389, 1425356389),
(847, '1425356389-10-8', '', 'detail', '', '473', 'en', 1425356389, 1425356389),
(848, '1425356389-10-9', '', 'detail', '', '473', 'vi', 1425356389, 1425356389),
(849, '1425356389-10-10', 'gallery', 'detail', 'gallery', '475', 'vi', 1425356389, 1425356389),
(850, '1425356389-10-10-1', '', 'detail', '', '475', 'en', 1425356389, 1425356389),
(851, '1425356390', '', 'detail', '', '475', 'vi', 1425356390, 1425356390),
(852, '1425356390-1', 'gallery', 'detail', 'gallery', '477', 'vi', 1425356390, 1425356390),
(853, '1425356390-2', '', 'detail', '', '477', 'en', 1425356390, 1425356390),
(854, '1425356390-3', '', 'detail', '', '477', 'vi', 1425356390, 1425356390),
(855, '1425356390-4', 'gallery', 'detail', 'gallery', '479', 'vi', 1425356390, 1425356390),
(856, '1425356390-5', '', 'detail', '', '479', 'en', 1425356390, 1425356390),
(857, '1425356390-6', '', 'detail', '', '479', 'vi', 1425356390, 1425356390),
(858, '1425356390-7', 'gallery', 'detail', 'gallery', '481', 'vi', 1425356390, 1425356390),
(859, '1425356390-8', '', 'detail', '', '481', 'en', 1425356390, 1425356390),
(860, '1425356390-9', '', 'detail', '', '481', 'vi', 1425356390, 1425356390),
(861, '1425356390-10', 'gallery', 'detail', 'gallery', '483', 'vi', 1425356390, 1425356390),
(862, '1425356390-10-1', '', 'detail', '', '483', 'en', 1425356390, 1425356390),
(863, '1425356390-10-2', '', 'detail', '', '483', 'vi', 1425356390, 1425356390),
(864, '1425356390-10-3', 'gallery', 'detail', 'gallery', '485', 'vi', 1425356390, 1425356390),
(865, '1425356390-10-4', '', 'detail', '', '485', 'en', 1425356390, 1425356390),
(866, '1425356390-10-5', '', 'detail', '', '485', 'vi', 1425356390, 1425356390),
(867, '1425356390-10-6', 'gallery', 'detail', 'gallery', '487', 'vi', 1425356390, 1425356390),
(868, '1425356390-10-7', '', 'detail', '', '487', 'en', 1425356390, 1425356390),
(869, '1425356390-10-8', '', 'detail', '', '487', 'vi', 1425356390, 1425356390),
(870, '1425356391', 'gallery', 'detail', 'gallery', '489', 'vi', 1425356391, 1425356391),
(871, '1425356391-1', '', 'detail', '', '489', 'en', 1425356391, 1425356391),
(872, '1425356391-2', '', 'detail', '', '489', 'vi', 1425356391, 1425356391),
(873, '1425356391-3', 'gallery', 'detail', 'gallery', '491', 'vi', 1425356391, 1425356391),
(874, '1425356391-4', '', 'detail', '', '491', 'en', 1425356391, 1425356391),
(875, '1425356391-5', '', 'detail', '', '491', 'vi', 1425356391, 1425356391),
(876, '1425356391-6', 'gallery', 'detail', 'gallery', '493', 'vi', 1425356391, 1425356391),
(877, '1425356391-7', '', 'detail', '', '493', 'en', 1425356391, 1425356391),
(878, '1425356391-8', '', 'detail', '', '493', 'vi', 1425356391, 1425356391),
(879, '1425356391-9', 'gallery', 'detail', 'gallery', '495', 'vi', 1425356391, 1425356391),
(880, '1425356391-10', '', 'detail', '', '495', 'en', 1425356391, 1425356391),
(881, '1425356391-10-1', '', 'detail', '', '495', 'vi', 1425356391, 1425356391),
(882, '1425356391-10-2', 'gallery', 'detail', 'gallery', '497', 'vi', 1425356391, 1425356391),
(883, '1425356391-10-3', '', 'detail', '', '497', 'en', 1425356391, 1425356391),
(884, '1425356391-10-4', '', 'detail', '', '497', 'vi', 1425356391, 1425356391),
(885, '1425356391-10-5', 'gallery', 'detail', 'gallery', '499', 'vi', 1425356391, 1425356391),
(886, '1425356391-10-6', '', 'detail', '', '499', 'en', 1425356391, 1425356391),
(887, '1425356391-10-7', '', 'detail', '', '499', 'vi', 1425356391, 1425356391),
(888, '1425356391-10-8', 'gallery', 'detail', 'gallery', '501', 'vi', 1425356391, 1425356391),
(889, '1425356391-10-9', '', 'detail', '', '501', 'en', 1425356391, 1425356391),
(890, '1425356391-10-10', '', 'detail', '', '501', 'vi', 1425356391, 1425356391),
(891, '1425356391-10-10-1', 'gallery', 'detail', 'gallery', '503', 'vi', 1425356391, 1425356391),
(892, '1425356391-10-10-2', '', 'detail', '', '503', 'en', 1425356391, 1425356391),
(893, '1425356392', '', 'detail', '', '503', 'vi', 1425356392, 1425356392),
(894, '1425356392-1', 'gallery', 'detail', 'gallery', '505', 'vi', 1425356392, 1425356392),
(895, '1425356392-2', '', 'detail', '', '505', 'en', 1425356392, 1425356392),
(896, '1425356392-3', '', 'detail', '', '505', 'vi', 1425356392, 1425356392),
(897, '1425356392-4', 'gallery', 'detail', 'gallery', '507', 'vi', 1425356392, 1425356392),
(898, '1425356392-5', '', 'detail', '', '507', 'en', 1425356392, 1425356392),
(899, '1425356392-6', '', 'detail', '', '507', 'vi', 1425356392, 1425356392),
(900, '1425356392-7', 'gallery', 'detail', 'gallery', '509', 'vi', 1425356392, 1425356392),
(901, '1425356392-8', '', 'detail', '', '509', 'en', 1425356392, 1425356392),
(902, '1425356392-9', '', 'detail', '', '509', 'vi', 1425356392, 1425356392),
(903, '1425356392-10', 'gallery', 'detail', 'gallery', '511', 'vi', 1425356392, 1425356392),
(904, '1425356392-10-1', '', 'detail', '', '511', 'en', 1425356392, 1425356392),
(905, '1425356392-10-2', '', 'detail', '', '511', 'vi', 1425356392, 1425356392),
(906, '1425356392-10-3', 'gallery', 'detail', 'gallery', '513', 'vi', 1425356392, 1425356392),
(907, '1425356392-10-4', '', 'detail', '', '513', 'en', 1425356392, 1425356392),
(908, '1425356392-10-5', '', 'detail', '', '513', 'vi', 1425356392, 1425356392),
(909, '1425356393', 'gallery', 'detail', 'gallery', '515', 'vi', 1425356393, 1425356393),
(910, '1425356393-1', '', 'detail', '', '515', 'en', 1425356393, 1425356393),
(911, '1425356393-2', '', 'detail', '', '515', 'vi', 1425356393, 1425356393),
(912, '1425356393-3', 'gallery', 'detail', 'gallery', '517', 'vi', 1425356393, 1425356393),
(913, '1425356393-4', '', 'detail', '', '517', 'en', 1425356393, 1425356393),
(914, '1425356393-5', '', 'detail', '', '517', 'vi', 1425356393, 1425356393),
(915, '1425356393-6', 'gallery', 'detail', 'gallery', '519', 'vi', 1425356393, 1425356393),
(916, '1425356393-7', '', 'detail', '', '519', 'en', 1425356393, 1425356393),
(917, '1425356393-8', '', 'detail', '', '519', 'vi', 1425356393, 1425356393),
(918, '1425356393-9', 'gallery', 'detail', 'gallery', '521', 'vi', 1425356393, 1425356393),
(919, '1425356393-10', '', 'detail', '', '521', 'en', 1425356393, 1425356393),
(920, '1425356393-10-1', '', 'detail', '', '521', 'vi', 1425356393, 1425356393),
(921, '1425356393-10-2', 'gallery', 'detail', 'gallery', '523', 'vi', 1425356393, 1425356393),
(922, '1425356393-10-3', '', 'detail', '', '523', 'en', 1425356393, 1425356393),
(923, '1425356393-10-4', '', 'detail', '', '523', 'vi', 1425356393, 1425356393),
(924, '1425356393-10-5', 'gallery', 'detail', 'gallery', '525', 'vi', 1425356393, 1425356393),
(925, '1425356393-10-6', '', 'detail', '', '525', 'en', 1425356393, 1425356393),
(926, '1425356393-10-7', '', 'detail', '', '525', 'vi', 1425356393, 1425356393),
(927, '1425356394', 'gallery', 'detail', 'gallery', '527', 'vi', 1425356394, 1425356394),
(928, '1425356394-1', '', 'detail', '', '527', 'en', 1425356394, 1425356394),
(929, '1425356394-2', '', 'detail', '', '527', 'vi', 1425356394, 1425356394),
(930, '1425356394-3', 'gallery', 'detail', 'gallery', '529', 'vi', 1425356394, 1425356394),
(931, '1425356394-4', '', 'detail', '', '529', 'en', 1425356394, 1425356394),
(932, '1425356394-5', '', 'detail', '', '529', 'vi', 1425356394, 1425356394),
(933, '1425356394-6', 'gallery', 'detail', 'gallery', '531', 'vi', 1425356394, 1425356394),
(934, '1425356394-7', '', 'detail', '', '531', 'en', 1425356394, 1425356394),
(935, '1425356394-8', '', 'detail', '', '531', 'vi', 1425356394, 1425356394),
(936, '1425356394-9', 'gallery', 'detail', 'gallery', '533', 'vi', 1425356394, 1425356394),
(937, '1425356394-10', '', 'detail', '', '533', 'en', 1425356394, 1425356394),
(938, '1425356394-10-1', '', 'detail', '', '533', 'vi', 1425356394, 1425356394),
(939, '1425356394-10-2', 'gallery', 'detail', 'gallery', '535', 'vi', 1425356394, 1425356394),
(940, '1425356394-10-3', '', 'detail', '', '535', 'en', 1425356394, 1425356394),
(941, '1425356395', '', 'detail', '', '535', 'vi', 1425356395, 1425356395),
(942, '1425356395-1', 'gallery', 'detail', 'gallery', '537', 'vi', 1425356395, 1425356395),
(943, '1425356395-2', '', 'detail', '', '537', 'en', 1425356395, 1425356395),
(944, '1425356395-3', '', 'detail', '', '537', 'vi', 1425356395, 1425356395),
(945, '1425356395-4', 'gallery', 'detail', 'gallery', '539', 'vi', 1425356395, 1425356395),
(946, '1425356395-5', '', 'detail', '', '539', 'en', 1425356395, 1425356395),
(947, '1425356395-6', '', 'detail', '', '539', 'vi', 1425356395, 1425356395),
(948, '1425356395-7', 'gallery', 'detail', 'gallery', '541', 'vi', 1425356395, 1425356395),
(949, '1425356395-8', '', 'detail', '', '541', 'en', 1425356395, 1425356395),
(950, '1425356395-9', '', 'detail', '', '541', 'vi', 1425356395, 1425356395),
(951, '1425356395-10', 'gallery', 'detail', 'gallery', '543', 'vi', 1425356395, 1425356395),
(952, '1425356395-10-1', '', 'detail', '', '543', 'en', 1425356395, 1425356395),
(953, '1425356395-10-2', '', 'detail', '', '543', 'vi', 1425356395, 1425356395),
(954, '1425356395-10-3', 'gallery', 'detail', 'gallery', '545', 'vi', 1425356395, 1425356395),
(955, '1425356395-10-4', '', 'detail', '', '545', 'en', 1425356395, 1425356395),
(956, '1425356395-10-5', '', 'detail', '', '545', 'vi', 1425356395, 1425356395),
(957, '1425356395-10-6', 'gallery', 'detail', 'gallery', '547', 'vi', 1425356395, 1425356395),
(958, '1425356395-10-7', '', 'detail', '', '547', 'en', 1425356395, 1425356395),
(959, '1425356395-10-8', '', 'detail', '', '547', 'vi', 1425356395, 1425356395),
(960, '1425356395-10-9', 'gallery', 'detail', 'gallery', '549', 'vi', 1425356395, 1425356395),
(961, '1425356395-10-10', '', 'detail', '', '549', 'en', 1425356395, 1425356395),
(962, '1425356396', '', 'detail', '', '549', 'vi', 1425356396, 1425356396),
(963, '1425356396-1', 'gallery', 'detail', 'gallery', '551', 'vi', 1425356396, 1425356396),
(964, '1425356396-2', '', 'detail', '', '551', 'en', 1425356396, 1425356396),
(965, '1425356396-3', '', 'detail', '', '551', 'vi', 1425356396, 1425356396),
(966, '1425356396-4', 'gallery', 'detail', 'gallery', '553', 'vi', 1425356396, 1425356396),
(967, '1425356396-5', '', 'detail', '', '553', 'en', 1425356396, 1425356396),
(968, '1425356396-6', '', 'detail', '', '553', 'vi', 1425356396, 1425356396),
(969, '1425356396-7', 'gallery', 'detail', 'gallery', '555', 'vi', 1425356396, 1425356396),
(970, '1425356396-8', '', 'detail', '', '555', 'en', 1425356396, 1425356396),
(971, '1425356396-9', '', 'detail', '', '555', 'vi', 1425356396, 1425356396),
(972, '1425356396-10', 'gallery', 'detail', 'gallery', '557', 'vi', 1425356396, 1425356396),
(973, '1425356396-10-1', '', 'detail', '', '557', 'en', 1425356396, 1425356396),
(974, '1425356396-10-2', '', 'detail', '', '557', 'vi', 1425356396, 1425356396),
(975, '1425356396-10-3', 'gallery', 'detail', 'gallery', '559', 'vi', 1425356396, 1425356396),
(976, '1425356396-10-4', '', 'detail', '', '559', 'en', 1425356396, 1425356396),
(977, '1425356396-10-5', '', 'detail', '', '559', 'vi', 1425356396, 1425356396),
(978, '1425356397', 'gallery', 'detail', 'gallery', '561', 'vi', 1425356397, 1425356397),
(979, '1425356397-1', '', 'detail', '', '561', 'en', 1425356397, 1425356397),
(980, '1425356397-2', '', 'detail', '', '561', 'vi', 1425356397, 1425356397),
(981, '1425356397-3', 'gallery', 'detail', 'gallery', '563', 'vi', 1425356397, 1425356397),
(982, '1425356397-4', '', 'detail', '', '563', 'en', 1425356397, 1425356397),
(983, '1425356397-5', '', 'detail', '', '563', 'vi', 1425356397, 1425356397),
(984, '1425356397-6', 'gallery', 'detail', 'gallery', '565', 'vi', 1425356397, 1425356397),
(985, '1425356397-7', '', 'detail', '', '565', 'en', 1425356397, 1425356397),
(986, '1425356397-8', '', 'detail', '', '565', 'vi', 1425356397, 1425356397),
(987, '1425356397-9', 'gallery', 'detail', 'gallery', '567', 'vi', 1425356397, 1425356397),
(988, '1425356397-10', '', 'detail', '', '567', 'en', 1425356397, 1425356397),
(989, '1425356397-10-1', '', 'detail', '', '567', 'vi', 1425356397, 1425356397),
(990, '1425356397-10-2', 'gallery', 'detail', 'gallery', '569', 'vi', 1425356397, 1425356397),
(991, '1425356397-10-3', '', 'detail', '', '569', 'en', 1425356397, 1425356397),
(992, '1425356397-10-4', '', 'detail', '', '569', 'vi', 1425356397, 1425356397),
(993, '1425356397-10-5', 'gallery', 'detail', 'gallery', '571', 'vi', 1425356397, 1425356397),
(994, '1425356397-10-6', '', 'detail', '', '571', 'en', 1425356397, 1425356397),
(995, '1425356397-10-7', '', 'detail', '', '571', 'vi', 1425356397, 1425356397),
(996, '1425356397-10-8', 'gallery', 'detail', 'gallery', '573', 'vi', 1425356397, 1425356397),
(997, '1425356397-10-9', '', 'detail', '', '573', 'en', 1425356397, 1425356397),
(998, '1425356398', '', 'detail', '', '573', 'vi', 1425356398, 1425356398),
(999, '1425356398-1', 'gallery', 'detail', 'gallery', '575', 'vi', 1425356398, 1425356398),
(1000, '1425356398-2', '', 'detail', '', '575', 'en', 1425356398, 1425356398),
(1001, '1425356398-3', '', 'detail', '', '575', 'vi', 1425356398, 1425356398),
(1002, '1425356398-4', 'gallery', 'detail', 'gallery', '577', 'vi', 1425356398, 1425356398),
(1003, '1425356398-5', '', 'detail', '', '577', 'en', 1425356398, 1425356398),
(1004, '1425356398-6', '', 'detail', '', '577', 'vi', 1425356398, 1425356398),
(1005, '1425356398-7', 'gallery', 'detail', 'gallery', '579', 'vi', 1425356398, 1425356398),
(1006, '1425356398-8', '', 'detail', '', '579', 'en', 1425356398, 1425356398),
(1007, '1425356398-9', '', 'detail', '', '579', 'vi', 1425356398, 1425356398),
(1008, '1425356398-10', 'gallery', 'detail', 'gallery', '581', 'vi', 1425356398, 1425356398),
(1009, '1425356398-10-1', '', 'detail', '', '581', 'en', 1425356398, 1425356398),
(1010, '1425356398-10-2', '', 'detail', '', '581', 'vi', 1425356398, 1425356398),
(1011, '1425356398-10-3', 'gallery', 'detail', 'gallery', '583', 'vi', 1425356398, 1425356398),
(1012, '1425356398-10-4', '', 'detail', '', '583', 'en', 1425356398, 1425356398),
(1013, '1425356398-10-5', '', 'detail', '', '583', 'vi', 1425356398, 1425356398),
(1014, '1425356398-10-6', 'gallery', 'detail', 'gallery', '585', 'vi', 1425356398, 1425356398),
(1015, '1425356398-10-7', '', 'detail', '', '585', 'en', 1425356398, 1425356398),
(1016, '1425356398-10-8', '', 'detail', '', '585', 'vi', 1425356398, 1425356398),
(1017, '1425356398-10-9', 'gallery', 'detail', 'gallery', '587', 'vi', 1425356398, 1425356398),
(1018, '1425356398-10-10', '', 'detail', '', '587', 'en', 1425356398, 1425356398),
(1019, '1425356398-10-10-1', '', 'detail', '', '587', 'vi', 1425356398, 1425356398),
(1020, '1425356399', 'gallery', 'detail', 'gallery', '589', 'vi', 1425356399, 1425356399),
(1021, '1425356399-1', '', 'detail', '', '589', 'en', 1425356399, 1425356399),
(1022, '1425356399-2', '', 'detail', '', '589', 'vi', 1425356399, 1425356399),
(1023, '1425356399-3', 'gallery', 'detail', 'gallery', '591', 'vi', 1425356399, 1425356399),
(1024, '1425356399-4', '', 'detail', '', '591', 'en', 1425356399, 1425356399),
(1025, '1425356399-5', '', 'detail', '', '591', 'vi', 1425356399, 1425356399),
(1026, '1425356399-6', 'gallery', 'detail', 'gallery', '593', 'vi', 1425356399, 1425356399),
(1027, '1425356399-7', '', 'detail', '', '593', 'en', 1425356399, 1425356399),
(1028, '1425356399-8', '', 'detail', '', '593', 'vi', 1425356399, 1425356399),
(1029, '1425356399-9', 'gallery', 'detail', 'gallery', '595', 'vi', 1425356399, 1425356399),
(1030, '1425356400', '', 'detail', '', '595', 'en', 1425356400, 1425356400),
(1031, '1425356400-1', '', 'detail', '', '595', 'vi', 1425356400, 1425356400),
(1032, '1425356400-2', 'gallery', 'detail', 'gallery', '597', 'vi', 1425356400, 1425356400),
(1033, '1425356400-3', '', 'detail', '', '597', 'en', 1425356400, 1425356400),
(1034, '1425356400-4', '', 'detail', '', '597', 'vi', 1425356400, 1425356400),
(1035, '1425356400-5', 'gallery', 'detail', 'gallery', '599', 'vi', 1425356400, 1425356400),
(1036, '1425356400-6', '', 'detail', '', '599', 'en', 1425356400, 1425356400),
(1037, '1425356400-7', '', 'detail', '', '599', 'vi', 1425356400, 1425356400),
(1038, '1425356400-8', 'gallery', 'detail', 'gallery', '601', 'vi', 1425356400, 1425356400),
(1039, '1425356400-9', '', 'detail', '', '601', 'en', 1425356400, 1425356400),
(1040, '1425356400-10', '', 'detail', '', '601', 'vi', 1425356400, 1425356400),
(1041, '1425356400-10-1', 'gallery', 'detail', 'gallery', '603', 'vi', 1425356400, 1425356400),
(1042, '1425356400-10-2', '', 'detail', '', '603', 'en', 1425356400, 1425356400),
(1043, '1425356400-10-3', '', 'detail', '', '603', 'vi', 1425356400, 1425356400),
(1044, '1425356400-10-4', 'gallery', 'detail', 'gallery', '605', 'vi', 1425356400, 1425356400),
(1045, '1425356400-10-5', '', 'detail', '', '605', 'en', 1425356400, 1425356400),
(1046, '1425356400-10-6', '', 'detail', '', '605', 'vi', 1425356400, 1425356400),
(1047, '1425356400-10-7', 'gallery', 'detail', 'gallery', '607', 'vi', 1425356400, 1425356400),
(1048, '1425356400-10-8', '', 'detail', '', '607', 'en', 1425356400, 1425356400),
(1049, '1425356400-10-9', '', 'detail', '', '607', 'vi', 1425356400, 1425356400),
(1050, '1425356400-10-10', 'gallery', 'detail', 'gallery', '609', 'vi', 1425356400, 1425356400),
(1051, '1425356400-10-10-1', '', 'detail', '', '609', 'en', 1425356400, 1425356400),
(1052, '1425356400-10-10-2', '', 'detail', '', '609', 'vi', 1425356401, 1425356401),
(1053, '1425356401', 'gallery', 'detail', 'gallery', '611', 'vi', 1425356401, 1425356401),
(1054, '1425356401-1', '', 'detail', '', '611', 'en', 1425356401, 1425356401),
(1055, '1425356401-2', '', 'detail', '', '611', 'vi', 1425356401, 1425356401),
(1056, '1425356401-3', 'gallery', 'detail', 'gallery', '613', 'vi', 1425356401, 1425356401),
(1057, '1425356401-4', '', 'detail', '', '613', 'en', 1425356401, 1425356401),
(1058, '1425356401-5', '', 'detail', '', '613', 'vi', 1425356401, 1425356401),
(1059, '1425356401-6', 'gallery', 'detail', 'gallery', '615', 'vi', 1425356401, 1425356401),
(1060, '1425356401-7', '', 'detail', '', '615', 'en', 1425356401, 1425356401),
(1061, '1425356401-8', '', 'detail', '', '615', 'vi', 1425356401, 1425356401),
(1062, '1425356401-9', 'gallery', 'detail', 'gallery', '617', 'vi', 1425356401, 1425356401),
(1063, '1425356401-10', '', 'detail', '', '617', 'en', 1425356401, 1425356401),
(1064, '1425356401-10-1', '', 'detail', '', '617', 'vi', 1425356401, 1425356401),
(1065, '1425356401-10-2', 'gallery', 'detail', 'gallery', '619', 'vi', 1425356401, 1425356401),
(1066, '1425356401-10-3', '', 'detail', '', '619', 'en', 1425356401, 1425356401),
(1067, '1425356401-10-4', '', 'detail', '', '619', 'vi', 1425356401, 1425356401),
(1068, '1425356401-10-5', 'gallery', 'detail', 'gallery', '621', 'vi', 1425356401, 1425356401),
(1069, '1425356401-10-6', '', 'detail', '', '621', 'en', 1425356401, 1425356401),
(1070, '1425356401-10-7', '', 'detail', '', '621', 'vi', 1425356401, 1425356401),
(1071, '1425356401-10-8', 'gallery', 'detail', 'gallery', '623', 'vi', 1425356401, 1425356401),
(1072, '1425356401-10-9', '', 'detail', '', '623', 'en', 1425356401, 1425356401),
(1073, '1425356402', '', 'detail', '', '623', 'vi', 1425356402, 1425356402),
(1074, '1425356402-1', 'gallery', 'detail', 'gallery', '625', 'vi', 1425356402, 1425356402),
(1075, '1425356402-2', '', 'detail', '', '625', 'en', 1425356402, 1425356402),
(1076, '1425356402-3', '', 'detail', '', '625', 'vi', 1425356402, 1425356402),
(1077, '1425356402-4', 'gallery', 'detail', 'gallery', '627', 'vi', 1425356402, 1425356402),
(1078, '1425356402-5', '', 'detail', '', '627', 'en', 1425356402, 1425356402),
(1079, '1425356402-6', '', 'detail', '', '627', 'vi', 1425356402, 1425356402),
(1080, '1425356402-7', 'gallery', 'detail', 'gallery', '629', 'vi', 1425356402, 1425356402),
(1081, '1425356402-8', '', 'detail', '', '629', 'en', 1425356402, 1425356402),
(1082, '1425356402-9', '', 'detail', '', '629', 'vi', 1425356402, 1425356402),
(1083, '1425356402-10', 'gallery', 'detail', 'gallery', '631', 'vi', 1425356402, 1425356402),
(1084, '1425356402-10-1', '', 'detail', '', '631', 'en', 1425356402, 1425356402),
(1085, '1425356402-10-2', '', 'detail', '', '631', 'vi', 1425356402, 1425356402),
(1086, '1425356402-10-3', 'gallery', 'detail', 'gallery', '633', 'vi', 1425356402, 1425356402),
(1087, '1425356402-10-4', '', 'detail', '', '633', 'en', 1425356402, 1425356402),
(1088, '1425356402-10-5', '', 'detail', '', '633', 'vi', 1425356402, 1425356402),
(1089, '1425356402-10-6', 'gallery', 'detail', 'gallery', '635', 'vi', 1425356402, 1425356402),
(1090, '1425356402-10-7', '', 'detail', '', '635', 'en', 1425356402, 1425356402),
(1091, '1425356402-10-8', '', 'detail', '', '635', 'vi', 1425356402, 1425356402),
(1092, '1425356402-10-9', 'gallery', 'detail', 'gallery', '637', 'vi', 1425356402, 1425356402),
(1093, '1425356402-10-10', '', 'detail', '', '637', 'en', 1425356402, 1425356402),
(1094, '1425356402-10-10-1', '', 'detail', '', '637', 'vi', 1425356402, 1425356402),
(1095, '1425356402-10-10-2', 'gallery', 'detail', 'gallery', '639', 'vi', 1425356402, 1425356402),
(1096, '1425356402-10-10-3', '', 'detail', '', '639', 'en', 1425356402, 1425356402),
(1097, '1425356402-10-10-4', '', 'detail', '', '639', 'vi', 1425356403, 1425356403),
(1098, '1425356403', 'gallery', 'detail', 'gallery', '641', 'vi', 1425356403, 1425356403),
(1099, '1425356403-1', '', 'detail', '', '641', 'en', 1425356403, 1425356403),
(1100, '1425356403-2', '', 'detail', '', '641', 'vi', 1425356403, 1425356403),
(1101, '1425356403-3', 'gallery', 'detail', 'gallery', '643', 'vi', 1425356403, 1425356403),
(1102, '1425356403-4', '', 'detail', '', '643', 'en', 1425356403, 1425356403),
(1103, '1425356403-5', '', 'detail', '', '643', 'vi', 1425356403, 1425356403),
(1104, '1425356403-6', 'gallery', 'detail', 'gallery', '645', 'vi', 1425356403, 1425356403),
(1105, '1425356403-7', '', 'detail', '', '645', 'en', 1425356403, 1425356403),
(1106, '1425356403-8', '', 'detail', '', '645', 'vi', 1425356403, 1425356403),
(1107, '1425356403-9', 'gallery', 'detail', 'gallery', '647', 'vi', 1425356403, 1425356403),
(1108, '1425356403-10', '', 'detail', '', '647', 'en', 1425356403, 1425356403),
(1109, '1425356403-10-1', '', 'detail', '', '647', 'vi', 1425356403, 1425356403),
(1110, '1425356403-10-2', 'gallery', 'detail', 'gallery', '649', 'vi', 1425356403, 1425356403),
(1111, '1425356403-10-3', '', 'detail', '', '649', 'en', 1425356403, 1425356403),
(1112, '1425356403-10-4', '', 'detail', '', '649', 'vi', 1425356403, 1425356403),
(1113, '1425356403-10-5', 'gallery', 'detail', 'gallery', '651', 'vi', 1425356403, 1425356403),
(1114, '1425356403-10-6', '', 'detail', '', '651', 'en', 1425356403, 1425356403),
(1115, '1425356403-10-7', '', 'detail', '', '651', 'vi', 1425356403, 1425356403),
(1116, '1425356403-10-8', 'gallery', 'detail', 'gallery', '653', 'vi', 1425356403, 1425356403),
(1117, '1425356403-10-9', '', 'detail', '', '653', 'en', 1425356403, 1425356403),
(1118, '1425356403-10-10', '', 'detail', '', '653', 'vi', 1425356403, 1425356403),
(1119, '1425356403-10-10-1', 'gallery', 'detail', 'gallery', '655', 'vi', 1425356403, 1425356403),
(1120, '1425356403-10-10-2', '', 'detail', '', '655', 'en', 1425356403, 1425356403),
(1121, '1425356403-10-10-3', '', 'detail', '', '655', 'vi', 1425356403, 1425356403),
(1122, '1425356404', 'gallery', 'detail', 'gallery', '657', 'vi', 1425356404, 1425356404),
(1123, '1425356404-1', '', 'detail', '', '657', 'en', 1425356404, 1425356404),
(1124, '1425356404-2', '', 'detail', '', '657', 'vi', 1425356404, 1425356404),
(1125, '1425356404-3', 'gallery', 'detail', 'gallery', '659', 'vi', 1425356404, 1425356404),
(1126, '1425356404-4', '', 'detail', '', '659', 'en', 1425356404, 1425356404),
(1127, '1425356404-5', '', 'detail', '', '659', 'vi', 1425356404, 1425356404),
(1128, '1425356404-6', 'gallery', 'detail', 'gallery', '661', 'vi', 1425356404, 1425356404),
(1129, '1425356404-7', '', 'detail', '', '661', 'en', 1425356404, 1425356404),
(1130, '1425356404-8', '', 'detail', '', '661', 'vi', 1425356404, 1425356404),
(1131, '1425356404-9', 'gallery', 'detail', 'gallery', '663', 'vi', 1425356404, 1425356404),
(1132, '1425356404-10', '', 'detail', '', '663', 'en', 1425356404, 1425356404),
(1133, '1425356404-10-1', '', 'detail', '', '663', 'vi', 1425356404, 1425356404),
(1134, '1425356404-10-2', 'gallery', 'detail', 'gallery', '665', 'vi', 1425356404, 1425356404),
(1135, '1425356404-10-3', '', 'detail', '', '665', 'en', 1425356404, 1425356404),
(1136, '1425356404-10-4', '', 'detail', '', '665', 'vi', 1425356404, 1425356404),
(1137, '1425356404-10-5', 'gallery', 'detail', 'gallery', '667', 'vi', 1425356404, 1425356404),
(1138, '1425356405', '', 'detail', '', '667', 'en', 1425356405, 1425356405),
(1139, '1425356405-1', '', 'detail', '', '667', 'vi', 1425356405, 1425356405),
(1140, '1425356405-2', 'gallery', 'detail', 'gallery', '669', 'vi', 1425356405, 1425356405),
(1141, '1425356405-3', '', 'detail', '', '669', 'en', 1425356405, 1425356405),
(1142, '1425356405-4', '', 'detail', '', '669', 'vi', 1425356405, 1425356405),
(1143, '1425356405-5', 'gallery', 'detail', 'gallery', '671', 'vi', 1425356405, 1425356405),
(1144, '1425356405-6', '', 'detail', '', '671', 'en', 1425356405, 1425356405),
(1145, '1425356405-7', '', 'detail', '', '671', 'vi', 1425356405, 1425356405),
(1146, '1425356405-8', 'gallery', 'detail', 'gallery', '673', 'vi', 1425356405, 1425356405),
(1147, '1425356405-9', '', 'detail', '', '673', 'en', 1425356405, 1425356405),
(1148, '1425356405-10', '', 'detail', '', '673', 'vi', 1425356405, 1425356405),
(1149, '1425356405-10-1', 'gallery', 'detail', 'gallery', '675', 'vi', 1425356405, 1425356405),
(1150, '1425356405-10-2', '', 'detail', '', '675', 'en', 1425356405, 1425356405),
(1151, '1425356405-10-3', '', 'detail', '', '675', 'vi', 1425356405, 1425356405),
(1152, '1425356405-10-4', 'gallery', 'detail', 'gallery', '677', 'vi', 1425356405, 1425356405),
(1153, '1425356405-10-5', '', 'detail', '', '677', 'en', 1425356405, 1425356405),
(1154, '1425356405-10-6', '', 'detail', '', '677', 'vi', 1425356405, 1425356405),
(1155, '1425356406', 'gallery', 'detail', 'gallery', '679', 'vi', 1425356406, 1425356406),
(1156, '1425356406-1', '', 'detail', '', '679', 'en', 1425356406, 1425356406),
(1157, '1425356406-2', '', 'detail', '', '679', 'vi', 1425356406, 1425356406),
(1158, '1425356406-3', 'gallery', 'detail', 'gallery', '681', 'vi', 1425356406, 1425356406),
(1159, '1425356406-4', '', 'detail', '', '681', 'en', 1425356406, 1425356406),
(1160, '1425356406-5', '', 'detail', '', '681', 'vi', 1425356406, 1425356406),
(1161, '1425356406-6', 'gallery', 'detail', 'gallery', '683', 'vi', 1425356406, 1425356406),
(1162, '1425356406-7', '', 'detail', '', '683', 'en', 1425356406, 1425356406),
(1163, '1425356406-8', '', 'detail', '', '683', 'vi', 1425356406, 1425356406),
(1164, '1425356406-9', 'gallery', 'detail', 'gallery', '685', 'vi', 1425356406, 1425356406),
(1165, '1425356406-10', '', 'detail', '', '685', 'en', 1425356406, 1425356406),
(1166, '1425356406-10-1', '', 'detail', '', '685', 'vi', 1425356406, 1425356406),
(1167, '1425356406-10-2', 'gallery', 'detail', 'gallery', '687', 'vi', 1425356406, 1425356406),
(1168, '1425356407', '', 'detail', '', '687', 'en', 1425356407, 1425356407),
(1169, '1425356407-1', '', 'detail', '', '687', 'vi', 1425356407, 1425356407),
(1170, '1425356407-2', 'gallery', 'detail', 'gallery', '689', 'vi', 1425356407, 1425356407),
(1171, '1425356407-3', '', 'detail', '', '689', 'en', 1425356407, 1425356407),
(1172, '1425356407-4', '', 'detail', '', '689', 'vi', 1425356407, 1425356407),
(1173, '1425356407-5', 'gallery', 'detail', 'gallery', '691', 'vi', 1425356407, 1425356407),
(1174, '1425356407-6', '', 'detail', '', '691', 'en', 1425356407, 1425356407),
(1175, '1425356407-7', '', 'detail', '', '691', 'vi', 1425356407, 1425356407),
(1176, '1425356407-8', 'gallery', 'detail', 'gallery', '693', 'vi', 1425356407, 1425356407),
(1177, '1425356407-9', '', 'detail', '', '693', 'en', 1425356407, 1425356407),
(1178, '1425356407-10', '', 'detail', '', '693', 'vi', 1425356407, 1425356407),
(1179, '1425356407-10-1', 'gallery', 'detail', 'gallery', '695', 'vi', 1425356407, 1425356407),
(1180, '1425356407-10-2', '', 'detail', '', '695', 'en', 1425356407, 1425356407),
(1181, '1425356407-10-3', '', 'detail', '', '695', 'vi', 1425356407, 1425356407),
(1182, '1425356407-10-4', 'gallery', 'detail', 'gallery', '697', 'vi', 1425356407, 1425356407),
(1183, '1425356407-10-5', '', 'detail', '', '697', 'en', 1425356407, 1425356407),
(1184, '1425356407-10-6', '', 'detail', '', '697', 'vi', 1425356407, 1425356407),
(1185, '1425356407-10-7', 'gallery', 'detail', 'gallery', '699', 'vi', 1425356407, 1425356407),
(1186, '1425356407-10-8', '', 'detail', '', '699', 'en', 1425356407, 1425356407),
(1187, '1425356408', '', 'detail', '', '699', 'vi', 1425356408, 1425356408),
(1188, '1425356408-1', 'gallery', 'detail', 'gallery', '701', 'vi', 1425356408, 1425356408),
(1189, '1425356408-2', '', 'detail', '', '701', 'en', 1425356408, 1425356408),
(1190, '1425356408-3', '', 'detail', '', '701', 'vi', 1425356408, 1425356408),
(1191, '1425356408-4', 'gallery', 'detail', 'gallery', '703', 'vi', 1425356408, 1425356408),
(1192, '1425356408-5', '', 'detail', '', '703', 'en', 1425356408, 1425356408),
(1193, '1425356408-6', '', 'detail', '', '703', 'vi', 1425356408, 1425356408),
(1194, '1425356408-7', 'gallery', 'detail', 'gallery', '705', 'vi', 1425356408, 1425356408),
(1195, '1425356408-8', '', 'detail', '', '705', 'en', 1425356408, 1425356408),
(1196, '1425356408-9', '', 'detail', '', '705', 'vi', 1425356408, 1425356408),
(1197, '1425356408-10', 'gallery', 'detail', 'gallery', '707', 'vi', 1425356408, 1425356408),
(1198, '1425356408-10-1', '', 'detail', '', '707', 'en', 1425356408, 1425356408),
(1199, '1425356408-10-2', '', 'detail', '', '707', 'vi', 1425356408, 1425356408),
(1200, '1425356408-10-3', 'gallery', 'detail', 'gallery', '709', 'vi', 1425356408, 1425356408),
(1201, '1425356408-10-4', '', 'detail', '', '709', 'en', 1425356408, 1425356408),
(1202, '1425356408-10-5', '', 'detail', '', '709', 'vi', 1425356408, 1425356408),
(1203, '1425356408-10-6', 'gallery', 'detail', 'gallery', '711', 'vi', 1425356408, 1425356408),
(1204, '1425356408-10-7', '', 'detail', '', '711', 'en', 1425356408, 1425356408),
(1205, '1425356408-10-8', '', 'detail', '', '711', 'vi', 1425356408, 1425356408),
(1206, '1425356408-10-9', 'gallery', 'detail', 'gallery', '713', 'vi', 1425356408, 1425356408),
(1207, '1425356408-10-10', '', 'detail', '', '713', 'en', 1425356408, 1425356408),
(1208, '1425356409', '', 'detail', '', '713', 'vi', 1425356409, 1425356409),
(1209, '1425356409-1', 'gallery', 'detail', 'gallery', '715', 'vi', 1425356409, 1425356409),
(1210, '1425356409-2', '', 'detail', '', '715', 'en', 1425356409, 1425356409),
(1211, '1425356409-3', '', 'detail', '', '715', 'vi', 1425356409, 1425356409),
(1212, '1425356409-4', 'gallery', 'detail', 'gallery', '717', 'vi', 1425356409, 1425356409),
(1213, '1425356409-5', '', 'detail', '', '717', 'en', 1425356409, 1425356409),
(1214, '1425356409-6', '', 'detail', '', '717', 'vi', 1425356409, 1425356409),
(1215, '1425356409-7', 'gallery', 'detail', 'gallery', '719', 'vi', 1425356409, 1425356409),
(1216, '1425356409-8', '', 'detail', '', '719', 'en', 1425356409, 1425356409),
(1217, '1425356409-9', '', 'detail', '', '719', 'vi', 1425356409, 1425356409),
(1218, '1425356409-10', 'gallery', 'detail', 'gallery', '721', 'vi', 1425356409, 1425356409),
(1219, '1425356409-10-1', '', 'detail', '', '721', 'en', 1425356409, 1425356409),
(1220, '1425356409-10-2', '', 'detail', '', '721', 'vi', 1425356409, 1425356409);
INSERT INTO `friendly_link` (`id`, `friendly_link`, `module`, `action`, `dbtable`, `dbtable_id`, `lang`, `date_create`, `date_update`) VALUES
(1221, '1425356409-10-3', 'gallery', 'detail', 'gallery', '723', 'vi', 1425356409, 1425356409),
(1222, '1425356409-10-4', '', 'detail', '', '723', 'en', 1425356409, 1425356409),
(1223, '1425356409-10-5', '', 'detail', '', '723', 'vi', 1425356409, 1425356409),
(1224, '1425356409-10-6', 'gallery', 'detail', 'gallery', '725', 'vi', 1425356409, 1425356409),
(1225, '1425356409-10-7', '', 'detail', '', '725', 'en', 1425356409, 1425356409),
(1226, '1425356409-10-8', '', 'detail', '', '725', 'vi', 1425356409, 1425356409),
(1227, '1425356409-10-9', 'gallery', 'detail', 'gallery', '727', 'vi', 1425356409, 1425356409),
(1228, '1425356409-10-10', '', 'detail', '', '727', 'en', 1425356409, 1425356409),
(1229, '1425356410', '', 'detail', '', '727', 'vi', 1425356410, 1425356410),
(1230, '1425356410-1', 'gallery', 'detail', 'gallery', '729', 'vi', 1425356410, 1425356410),
(1231, '1425356410-2', '', 'detail', '', '729', 'en', 1425356410, 1425356410),
(1232, '1425356410-3', '', 'detail', '', '729', 'vi', 1425356410, 1425356410),
(1233, '1425356410-4', 'gallery', 'detail', 'gallery', '731', 'vi', 1425356410, 1425356410),
(1234, 'vista-blue-and-green-aurora-t2jpg-10', '', 'detail', '', '9', 'vi', 1425356625, 1425356625),
(1235, 'vista-blue-and-green-aurora-t2jpg-10-10-10', '', 'detail', '', '23', 'vi', 1425356626, 1425356626),
(1236, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10', '', 'detail', '', '37', 'vi', 1425356627, 1425356627),
(1237, 'vista-blue-and-green-aurora-t2jpg-10-10-10-10-10-10-10', '', 'detail', '', '51', 'vi', 1425356628, 1425356628),
(1238, '79463jpg-2', 'gallery', 'detail', 'gallery', '1', 'en', 1425356727, 1425356727),
(1239, 'quan-ly-download', 'news', 'group', 'news_group', '1', 'vi', 1425358187, 1425358243),
(1240, 'quan-ly-download-1', 'news', 'group', 'news_group', '1', 'en', 1425358187, 1425358243),
(1241, 'cong-ty-tnhh-song-vui', 'news', 'detail', 'news', '1', 'vi', 1425358483, 1425358483),
(1242, 'cong-ty-tnhh-song-vui-1', 'news', 'detail', 'news', '1', 'en', 1425358483, 1425358483),
(1243, 'banner-2', 'page', 'group', 'page_group', '1', 'vi', 1425365552, 1425365552),
(1244, 'banner-3', 'page', 'group', 'page_group', '1', 'en', 1425365552, 1425365552),
(1245, 'cpu', 'page', 'detail', 'page', '1', 'vi', 1425366151, 1425366151),
(1246, 'cpu-1', 'page', 'detail', 'page', '1', 'en', 1425366151, 1425366151),
(1247, 'construction', 'partner', 'group', 'partner_group', '1', 'vi', 1425366739, 1425366739),
(1248, 'construction-1', 'partner', 'group', 'partner_group', '1', 'en', 1425366739, 1425366739),
(1249, 'banner-4', 'partner', 'detail', 'partner', '1', 'vi', 1425367118, 1425367118),
(1250, 'banner-5', 'partner', 'detail', 'partner', '1', 'en', 1425367118, 1425367118),
(1251, 'shipment', 'product', 'brand', 'product_brand', '1', 'vi', 1425367802, 1425367802),
(1252, 'shipment-1', 'product', 'brand', 'product_brand', '1', 'en', 1425367802, 1425367802),
(1253, 'nhom-1-2', 'product', 'group', 'product_group', '1', 'vi', 1425373716, 1425373716),
(1254, 'nhom-1-3', 'product', 'group', 'product_group', '1', 'en', 1425373716, 1425373716),
(1255, 'test-4', 'product', 'detail', 'product', '1', 'vi', 1425435159, 1425435183),
(1256, 'test-5', 'product', 'detail', 'product', '1', 'en', 1425435159, 1425435159),
(1257, 'test-4-1', 'product', 'detail', 'product', '3', 'vi', 1425436879, 1425436879),
(1258, 'test-5-1', 'product', 'detail', 'product', '3', 'en', 1425436879, 1425436879),
(1259, 'test-4-2', 'product', 'detail', 'product', '5', 'vi', 1425437155, 1425437155),
(1260, 'test-5-2', 'product', 'detail', 'product', '5', 'en', 1425437155, 1425437155),
(1261, 'menu-item', 'project', 'group', 'project_group', '1', 'vi', 1425438248, 1425438248),
(1262, 'menu-item-1', 'project', 'group', 'project_group', '1', 'en', 1425438248, 1425438248),
(1263, 'quan-ly-sidebar', 'project', 'detail', 'project', '1', 'vi', 1425438315, 1425438315),
(1264, 'quan-ly-sidebar-1', 'project', 'detail', 'project', '1', 'en', 1425438315, 1425438315),
(1265, 'test-5-3', 'service', 'group', 'service_group', '1', 'vi', 1425438698, 1425438698),
(1266, 'test-5-4', 'service', 'group', 'service_group', '1', 'en', 1425438698, 1425438698),
(1267, 'adasds', 'service', 'detail', 'service', '1', 'vi', 1425438727, 1425438727),
(1268, 'adasds-1', 'service', 'detail', 'service', '1', 'en', 1425438727, 1425438727),
(1269, 'duoi-hinh-chi-tiet-san-pham', 'video', 'group', 'video_group', '1', 'vi', 1425439645, 1425439645),
(1270, 'duoi-hinh-chi-tiet-san-pham-1', 'video', 'group', 'video_group', '1', 'en', 1425439645, 1425439645),
(1271, 'banner-6', 'video', 'detail', 'video', '2', 'vi', 1425440733, 1425440733),
(1272, 'banner-7', 'video', 'detail', 'video', '2', 'en', 1425440733, 1425440733),
(1273, 'thi-cong-xay-dung', 'video', 'detail', 'video', '1', 'vi', 1425440822, 1425440822),
(1274, 'thi-cong-xay-dung-1', 'video', 'detail', 'video', '1', 'en', 1425440822, 1425440822),
(1275, 'thi-cong-xay-dung-2', 'video', 'detail', 'video', '3', 'vi', 1425440870, 1425440870),
(1276, 'thi-cong-xay-dung-3', 'video', 'detail', 'video', '3', 'en', 1425440870, 1425440870);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE IF NOT EXISTS `gallery` (
`id` int(10) unsigned NOT NULL,
  `item_id` int(11) NOT NULL,
  `group_nav` varchar(250) NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `is_focus` tinyint(1) DEFAULT '0',
  `is_focus_group` int(11) NOT NULL DEFAULT '0',
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `item_id`, `group_nav`, `group_id`, `picture`, `title`, `short`, `content`, `friendly_link`, `meta_title`, `meta_key`, `meta_desc`, `is_focus`, `is_focus_group`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, '1', 1, 'gallery/2015_03/79463.jpg', '79463.jpg', '', '', '79463jpg', ' | ', ', ', '', 0, 0, 0, 1, 1425356727, 1425356727, 'vi'),
(2, 1, '1', 1, 'gallery/2015_03/79463.jpg', '79463.jpg', '', '', '79463jpg-2', ' | ', ', ', '', 0, 0, 0, 1, 1425356727, 1425356727, 'en'),
(3, 3, '', 0, 'gallery/2015_03/vista_blue_and_green_aurora-t2.jpg', 'vista_blue_and_green_aurora-t2.jpg', '', '', '1425356810', 'vista_blue_and_green_aurora-t2.jpg | vista_blue_and_green_aurora-t2.jpg', 'vista_blue_and_green_aurora-t2.jpg, vista_blue_and_green_aurora-t2.jpg', '', 0, 0, 0, 1, 1425356810, 1425356810, 'vi'),
(4, 3, '', 0, 'gallery/2015_03/vista_blue_and_green_aurora-t2.jpg', 'vista_blue_and_green_aurora-t2.jpg', '', '', '1425356810', 'vista_blue_and_green_aurora-t2.jpg | vista_blue_and_green_aurora-t2.jpg', 'vista_blue_and_green_aurora-t2.jpg, vista_blue_and_green_aurora-t2.jpg', '', 0, 0, 0, 1, 1425356810, 1425356810, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_group`
--

CREATE TABLE IF NOT EXISTS `gallery_group` (
`id` int(10) unsigned NOT NULL,
  `group_id` int(11) NOT NULL,
  `group_nav` varchar(250) NOT NULL,
  `group_level` tinyint(2) NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `is_focus` tinyint(4) NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gallery_group`
--

INSERT INTO `gallery_group` (`id`, `group_id`, `group_nav`, `group_level`, `parent_id`, `picture`, `title`, `short`, `content`, `friendly_link`, `meta_title`, `meta_key`, `meta_desc`, `is_focus`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, '1', 1, 0, 'gallery/2015_03/vista_blue_and_green_aurora-t2.jpg', 'Banner', '&lt;p&gt;M&amp;ocirc; tả ngắn&lt;/p&gt;', '&lt;p&gt;adasda&lt;/p&gt;', 'banner', 'Banner | Banner', 'Banner, Banner', 'adasda', 0, 0, 1, 1425354713, 1425354713, 'vi'),
(2, 1, '1', 1, 0, 'gallery/2015_03/vista_blue_and_green_aurora-t2.jpg', 'Banner', '&lt;p&gt;M&amp;ocirc; tả ngắn&lt;/p&gt;', '&lt;p&gt;adasda&lt;/p&gt;', 'banner-1', 'Banner | Banner', 'Banner, Banner', 'adasda', 0, 0, 1, 1425354713, 1425354713, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_setting`
--

CREATE TABLE IF NOT EXISTS `gallery_setting` (
`id` int(11) NOT NULL,
  `news_meta_title` varchar(250) NOT NULL,
  `news_meta_key` text NOT NULL,
  `news_meta_desc` text NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(11) NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gallery_setting`
--

INSERT INTO `gallery_setting` (`id`, `news_meta_title`, `news_meta_key`, `news_meta_desc`, `num_list`, `num_order_detail`, `lang`) VALUES
(1, 'Tin tức', '', '', 10, 10, 'vi'),
(2, 'aboutus', '', '', 10, 10, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `home_setting`
--

CREATE TABLE IF NOT EXISTS `home_setting` (
`id` int(11) NOT NULL,
  `home_meta_title` varchar(250) NOT NULL,
  `home_meta_key` text NOT NULL,
  `home_meta_desc` text NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(10) unsigned NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi',
  `layout` int(11) NOT NULL,
  `sidebar_left` int(11) NOT NULL,
  `sidebar_right` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `home_setting`
--

INSERT INTO `home_setting` (`id`, `home_meta_title`, `home_meta_key`, `home_meta_desc`, `num_list`, `num_order_detail`, `lang`, `layout`, `sidebar_left`, `sidebar_right`) VALUES
(1, 'Trang chủ', '', '', 3, 3, 'vi', 0, 0, 0),
(2, 'Homepage', '', '', 6, 10, 'en', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `lang`
--

CREATE TABLE IF NOT EXISTS `lang` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT 'vi',
  `title` varchar(250) NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `is_show` tinyint(4) NOT NULL DEFAULT '1',
  `show_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lang`
--

INSERT INTO `lang` (`id`, `name`, `title`, `is_default`, `is_show`, `show_order`) VALUES
(1, 'vi', 'Việt Nam', 1, 1, 0),
(2, 'en', 'English', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `location_area`
--

CREATE TABLE IF NOT EXISTS `location_area` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `title` varchar(250) NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(4) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location_area`
--

INSERT INTO `location_area` (`id`, `code`, `title`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 'c1', 'Bắc Mỹ', 0, 1, 1407210632, 1407210632, 'vi'),
(2, 'c1', 'Bắc Mỹ', 0, 1, 1407210632, 1407210632, 'en'),
(3, 'c2', 'Nam Mỹ', 0, 1, 1407210650, 1407210650, 'vi'),
(4, 'c2', 'Nam Mỹ', 0, 1, 1407210650, 1407210650, 'en'),
(5, 'c3', 'Châu Nam Cực', 0, 1, 1407210660, 1407210660, 'vi'),
(6, 'c3', 'Châu Nam Cực', 0, 1, 1407210660, 1407210660, 'en'),
(7, 'c4', 'Châu Phi', 0, 1, 1407210671, 1407210671, 'vi'),
(8, 'c4', 'Châu Phi', 0, 1, 1407210671, 1407210671, 'en'),
(9, 'c5', 'Châu Âu', 0, 1, 1407210679, 1407210679, 'vi'),
(10, 'c5', 'Châu Âu', 0, 1, 1407210679, 1407210679, 'en'),
(11, 'c6', 'Châu Á', 0, 1, 1407210733, 1407210733, 'vi'),
(12, 'c6', 'Châu Á', 0, 1, 1407210733, 1407210733, 'en'),
(13, 'c7', 'Châu Đại Dương', 0, 0, 1407210741, 1407211349, 'vi'),
(14, 'c7', 'Châu Đại Dương', 0, 0, 1407210741, 1407211349, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `location_country`
--

CREATE TABLE IF NOT EXISTS `location_country` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `area_code` varchar(20) NOT NULL,
  `title` varchar(250) NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(4) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location_country`
--

INSERT INTO `location_country` (`id`, `code`, `area_code`, `title`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 'vi', 'c6', 'Việt Nam', 0, 1, 1407214663, 1407214663, 'vi'),
(2, 'vi', 'c6', 'Việt Nam', 0, 1, 1407214663, 1407214663, 'en'),
(3, 'jp', 'c6', 'Nhật Bản', 0, 1, 1407214688, 1407214688, 'vi'),
(4, 'jp', 'c6', 'Nhật Bản', 0, 1, 1407214688, 1407214688, 'en'),
(5, 'en', 'c5', 'Nước Anh', 0, 1, 1407214717, 1407214755, 'vi'),
(6, 'en', 'c5', 'Nước Anh', 0, 1, 1407214717, 1407214755, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `location_district`
--

CREATE TABLE IF NOT EXISTS `location_district` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `area_code` varchar(20) NOT NULL,
  `country_code` varchar(20) NOT NULL,
  `province_code` varchar(20) NOT NULL,
  `title` varchar(250) NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(4) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location_district`
--

INSERT INTO `location_district` (`id`, `code`, `area_code`, `country_code`, `province_code`, `title`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, '001', 'c6', 'vi', '01', 'Ba Đình', 0, 1, 1415954087, 1415954087, 'vi'),
(2, '002', 'c6', 'vi', '01', 'Hoàn Kiếm', 0, 1, 1415954087, 1415954087, 'vi'),
(3, '003', 'c6', 'vi', '01', 'Tây Hồ', 0, 1, 1415954088, 1415954088, 'vi'),
(4, '004', 'c6', 'vi', '01', 'Long Biên', 0, 1, 1415954088, 1415954088, 'vi'),
(5, '005', 'c6', 'vi', '01', 'Cầu Giấy', 0, 1, 1415954088, 1415954088, 'vi'),
(6, '006', 'c6', 'vi', '01', 'Đống Đa', 0, 1, 1415954088, 1415954088, 'vi'),
(7, '007', 'c6', 'vi', '01', 'Hai Bà Trưng', 0, 1, 1415954088, 1415954088, 'vi'),
(8, '008', 'c6', 'vi', '01', 'Hoàng Mai', 0, 1, 1415954088, 1415954088, 'vi'),
(9, '009', 'c6', 'vi', '01', 'Thanh Xuân', 0, 1, 1415954088, 1415954088, 'vi'),
(10, '016', 'c6', 'vi', '01', 'Sóc Sơn', 0, 1, 1415954088, 1415954088, 'vi'),
(11, '017', 'c6', 'vi', '01', 'Đông Anh', 0, 1, 1415954088, 1415954088, 'vi'),
(12, '018', 'c6', 'vi', '01', 'Gia Lâm', 0, 1, 1415954088, 1415954088, 'vi'),
(13, '019', 'c6', 'vi', '01', 'Từ Liêm', 0, 1, 1415954088, 1415954088, 'vi'),
(14, '020', 'c6', 'vi', '01', 'Thanh Trì', 0, 1, 1415954088, 1415954088, 'vi'),
(15, '024', 'c6', 'vi', '02', 'Hà Giang', 0, 1, 1415954088, 1415954088, 'vi'),
(16, '026', 'c6', 'vi', '02', 'Đồng Văn', 0, 1, 1415954088, 1415954088, 'vi'),
(17, '027', 'c6', 'vi', '02', 'Mèo Vạc', 0, 1, 1415954088, 1415954088, 'vi'),
(18, '028', 'c6', 'vi', '02', 'Yên Minh', 0, 1, 1415954088, 1415954088, 'vi'),
(19, '029', 'c6', 'vi', '02', 'Quản Bạ', 0, 1, 1415954088, 1415954088, 'vi'),
(20, '030', 'c6', 'vi', '02', 'Vị Xuyên', 0, 1, 1415954088, 1415954088, 'vi'),
(21, '031', 'c6', 'vi', '02', 'Bắc Mê', 0, 1, 1415954088, 1415954088, 'vi'),
(22, '032', 'c6', 'vi', '02', 'Hoàng Su Phì', 0, 1, 1415954088, 1415954088, 'vi'),
(23, '033', 'c6', 'vi', '02', 'Xín Mần', 0, 1, 1415954088, 1415954088, 'vi'),
(24, '034', 'c6', 'vi', '02', 'Bắc Quang', 0, 1, 1415954088, 1415954088, 'vi'),
(25, '035', 'c6', 'vi', '02', 'Quang Bình', 0, 1, 1415954088, 1415954088, 'vi'),
(26, '040', 'c6', 'vi', '04', 'Cao Bằng', 0, 1, 1415954088, 1415954088, 'vi'),
(27, '042', 'c6', 'vi', '04', 'Bảo Lâm', 0, 1, 1415954088, 1415954088, 'vi'),
(28, '043', 'c6', 'vi', '04', 'Bảo Lạc', 0, 1, 1415954088, 1415954088, 'vi'),
(29, '044', 'c6', 'vi', '04', 'Thông Nông', 0, 1, 1415954088, 1415954088, 'vi'),
(30, '045', 'c6', 'vi', '04', 'Hà Quảng', 0, 1, 1415954088, 1415954088, 'vi'),
(31, '046', 'c6', 'vi', '04', 'Trà Lĩnh', 0, 1, 1415954088, 1415954088, 'vi'),
(32, '047', 'c6', 'vi', '04', 'Trùng Khánh', 0, 1, 1415954088, 1415954088, 'vi'),
(33, '048', 'c6', 'vi', '04', 'Hạ Lang', 0, 1, 1415954088, 1415954088, 'vi'),
(34, '049', 'c6', 'vi', '04', 'Quảng Uyên', 0, 1, 1415954088, 1415954088, 'vi'),
(35, '050', 'c6', 'vi', '04', 'Phục Hoà', 0, 1, 1415954088, 1415954088, 'vi'),
(36, '051', 'c6', 'vi', '04', 'Hoà An', 0, 1, 1415954088, 1415954088, 'vi'),
(37, '052', 'c6', 'vi', '04', 'Nguyên Bình', 0, 1, 1415954088, 1415954088, 'vi'),
(38, '053', 'c6', 'vi', '04', 'Thạch An', 0, 1, 1415954088, 1415954088, 'vi'),
(39, '058', 'c6', 'vi', '06', 'Bắc Kạn', 0, 1, 1415954088, 1415954088, 'vi'),
(40, '060', 'c6', 'vi', '06', 'Pác Nặm', 0, 1, 1415954088, 1415954088, 'vi'),
(41, '061', 'c6', 'vi', '06', 'Ba Bể', 0, 1, 1415954088, 1415954088, 'vi'),
(42, '062', 'c6', 'vi', '06', 'Ngân Sơn', 0, 1, 1415954088, 1415954088, 'vi'),
(43, '063', 'c6', 'vi', '06', 'Bạch Thông', 0, 1, 1415954088, 1415954088, 'vi'),
(44, '064', 'c6', 'vi', '06', 'Chợ Đồn', 0, 1, 1415954088, 1415954088, 'vi'),
(45, '065', 'c6', 'vi', '06', 'Chợ Mới', 0, 1, 1415954089, 1415954089, 'vi'),
(46, '066', 'c6', 'vi', '06', 'Na Rì', 0, 1, 1415954089, 1415954089, 'vi'),
(47, '070', 'c6', 'vi', '08', 'Tuyên Quang', 0, 1, 1415954089, 1415954089, 'vi'),
(48, '072', 'c6', 'vi', '08', 'Nà Hang', 0, 1, 1415954089, 1415954089, 'vi'),
(49, '073', 'c6', 'vi', '08', 'Chiêm Hóa', 0, 1, 1415954089, 1415954089, 'vi'),
(50, '074', 'c6', 'vi', '08', 'Hàm Yên', 0, 1, 1415954089, 1415954089, 'vi'),
(51, '075', 'c6', 'vi', '08', 'Yên Sơn', 0, 1, 1415954089, 1415954089, 'vi'),
(52, '076', 'c6', 'vi', '08', 'Sơn Dương', 0, 1, 1415954089, 1415954089, 'vi'),
(53, '080', 'c6', 'vi', '10', 'Lào Cai', 0, 1, 1415954089, 1415954089, 'vi'),
(54, '082', 'c6', 'vi', '10', 'Bát Xát', 0, 1, 1415954089, 1415954089, 'vi'),
(55, '083', 'c6', 'vi', '10', 'Mường Khương', 0, 1, 1415954089, 1415954089, 'vi'),
(56, '084', 'c6', 'vi', '10', 'Si Ma Cai', 0, 1, 1415954089, 1415954089, 'vi'),
(57, '085', 'c6', 'vi', '10', 'Bắc Hà', 0, 1, 1415954089, 1415954089, 'vi'),
(58, '086', 'c6', 'vi', '10', 'Bảo Thắng', 0, 1, 1415954089, 1415954089, 'vi'),
(59, '087', 'c6', 'vi', '10', 'Bảo Yên', 0, 1, 1415954089, 1415954089, 'vi'),
(60, '088', 'c6', 'vi', '10', 'Sa Pa', 0, 1, 1415954089, 1415954089, 'vi'),
(61, '089', 'c6', 'vi', '10', 'Văn Bàn', 0, 1, 1415954089, 1415954089, 'vi'),
(62, '094', 'c6', 'vi', '11', 'Điện Biên Phủ', 0, 1, 1415954089, 1415954089, 'vi'),
(63, '095', 'c6', 'vi', '11', 'Mường Lay', 0, 1, 1415954089, 1415954089, 'vi'),
(64, '096', 'c6', 'vi', '11', 'Mường Nhé', 0, 1, 1415954089, 1415954089, 'vi'),
(65, '097', 'c6', 'vi', '11', 'Mường Chà', 0, 1, 1415954089, 1415954089, 'vi'),
(66, '098', 'c6', 'vi', '11', 'Tủa Chùa', 0, 1, 1415954089, 1415954089, 'vi'),
(67, '099', 'c6', 'vi', '11', 'Tuần Giáo', 0, 1, 1415954089, 1415954089, 'vi'),
(68, '100', 'c6', 'vi', '11', 'Điện Biên', 0, 1, 1415954089, 1415954089, 'vi'),
(69, '101', 'c6', 'vi', '11', 'Điện Biên Đông', 0, 1, 1415954089, 1415954089, 'vi'),
(70, '102', 'c6', 'vi', '11', 'Mường Ảng', 0, 1, 1415954089, 1415954089, 'vi'),
(71, '104', 'c6', 'vi', '12', 'Lai Châu', 0, 1, 1415954089, 1415954089, 'vi'),
(72, '106', 'c6', 'vi', '12', 'Tam Đường', 0, 1, 1415954089, 1415954089, 'vi'),
(73, '107', 'c6', 'vi', '12', 'Mường Tè', 0, 1, 1415954089, 1415954089, 'vi'),
(74, '108', 'c6', 'vi', '12', 'Sìn Hồ', 0, 1, 1415954089, 1415954089, 'vi'),
(75, '109', 'c6', 'vi', '12', 'Phong Thổ', 0, 1, 1415954089, 1415954089, 'vi'),
(76, '110', 'c6', 'vi', '12', 'Than Uyên', 0, 1, 1415954089, 1415954089, 'vi'),
(77, '111', 'c6', 'vi', '12', 'Tân Uyên', 0, 1, 1415954089, 1415954089, 'vi'),
(78, '116', 'c6', 'vi', '14', 'Sơn La', 0, 1, 1415954089, 1415954089, 'vi'),
(79, '118', 'c6', 'vi', '14', 'Quỳnh Nhai', 0, 1, 1415954090, 1415954090, 'vi'),
(80, '119', 'c6', 'vi', '14', 'Thuận Châu', 0, 1, 1415954090, 1415954090, 'vi'),
(81, '120', 'c6', 'vi', '14', 'Mường La', 0, 1, 1415954090, 1415954090, 'vi'),
(82, '121', 'c6', 'vi', '14', 'Bắc Yên', 0, 1, 1415954090, 1415954090, 'vi'),
(83, '122', 'c6', 'vi', '14', 'Phù Yên', 0, 1, 1415954090, 1415954090, 'vi'),
(84, '123', 'c6', 'vi', '14', 'Mộc Châu', 0, 1, 1415954090, 1415954090, 'vi'),
(85, '124', 'c6', 'vi', '14', 'Yên Châu', 0, 1, 1415954090, 1415954090, 'vi'),
(86, '125', 'c6', 'vi', '14', 'Mai Sơn', 0, 1, 1415954090, 1415954090, 'vi'),
(87, '126', 'c6', 'vi', '14', 'Sông Mã', 0, 1, 1415954090, 1415954090, 'vi'),
(88, '127', 'c6', 'vi', '14', 'Sốp Cộp', 0, 1, 1415954090, 1415954090, 'vi'),
(89, '132', 'c6', 'vi', '15', 'Yên Bái', 0, 1, 1415954090, 1415954090, 'vi'),
(90, '133', 'c6', 'vi', '15', 'Nghĩa Lộ', 0, 1, 1415954090, 1415954090, 'vi'),
(91, '135', 'c6', 'vi', '15', 'Lục Yên', 0, 1, 1415954090, 1415954090, 'vi'),
(92, '136', 'c6', 'vi', '15', 'Văn Yên', 0, 1, 1415954090, 1415954090, 'vi'),
(93, '137', 'c6', 'vi', '15', 'Mù Cang Chải', 0, 1, 1415954090, 1415954090, 'vi'),
(94, '138', 'c6', 'vi', '15', 'Trấn Yên', 0, 1, 1415954090, 1415954090, 'vi'),
(95, '139', 'c6', 'vi', '15', 'Trạm Tấu', 0, 1, 1415954090, 1415954090, 'vi'),
(96, '140', 'c6', 'vi', '15', 'Văn Chấn', 0, 1, 1415954090, 1415954090, 'vi'),
(97, '141', 'c6', 'vi', '15', 'Yên Bình', 0, 1, 1415954090, 1415954090, 'vi'),
(98, '148', 'c6', 'vi', '17', 'Hòa Bình', 0, 1, 1415954090, 1415954090, 'vi'),
(99, '150', 'c6', 'vi', '17', 'Đà Bắc', 0, 1, 1415954090, 1415954090, 'vi'),
(100, '151', 'c6', 'vi', '17', 'Kỳ Sơn', 0, 1, 1415954090, 1415954090, 'vi'),
(101, '152', 'c6', 'vi', '17', 'Lương Sơn', 0, 1, 1415954090, 1415954090, 'vi'),
(102, '153', 'c6', 'vi', '17', 'Kim Bôi', 0, 1, 1415954090, 1415954090, 'vi'),
(103, '154', 'c6', 'vi', '17', 'Cao Phong', 0, 1, 1415954090, 1415954090, 'vi'),
(104, '155', 'c6', 'vi', '17', 'Tân Lạc', 0, 1, 1415954090, 1415954090, 'vi'),
(105, '156', 'c6', 'vi', '17', 'Mai Châu', 0, 1, 1415954090, 1415954090, 'vi'),
(106, '157', 'c6', 'vi', '17', 'Lạc Sơn', 0, 1, 1415954090, 1415954090, 'vi'),
(107, '158', 'c6', 'vi', '17', 'Yên Thủy', 0, 1, 1415954091, 1415954091, 'vi'),
(108, '159', 'c6', 'vi', '17', 'Lạc Thủy', 0, 1, 1415954091, 1415954091, 'vi'),
(109, '164', 'c6', 'vi', '19', 'Thái Nguyên', 0, 1, 1415954091, 1415954091, 'vi'),
(110, '165', 'c6', 'vi', '19', 'Sông Công', 0, 1, 1415954091, 1415954091, 'vi'),
(111, '167', 'c6', 'vi', '19', 'Định Hóa', 0, 1, 1415954091, 1415954091, 'vi'),
(112, '168', 'c6', 'vi', '19', 'Phú Lương', 0, 1, 1415954091, 1415954091, 'vi'),
(113, '169', 'c6', 'vi', '19', 'Đồng Hỷ', 0, 1, 1415954091, 1415954091, 'vi'),
(114, '170', 'c6', 'vi', '19', 'Võ Nhai', 0, 1, 1415954091, 1415954091, 'vi'),
(115, '171', 'c6', 'vi', '19', 'Đại Từ', 0, 1, 1415954091, 1415954091, 'vi'),
(116, '172', 'c6', 'vi', '19', 'Phổ Yên', 0, 1, 1415954091, 1415954091, 'vi'),
(117, '173', 'c6', 'vi', '19', 'Phú Bình', 0, 1, 1415954091, 1415954091, 'vi'),
(118, '178', 'c6', 'vi', '20', 'Lạng Sơn', 0, 1, 1415954091, 1415954091, 'vi'),
(119, '180', 'c6', 'vi', '20', 'Tràng Định', 0, 1, 1415954091, 1415954091, 'vi'),
(120, '181', 'c6', 'vi', '20', 'Bình Gia', 0, 1, 1415954091, 1415954091, 'vi'),
(121, '182', 'c6', 'vi', '20', 'Văn Lãng', 0, 1, 1415954091, 1415954091, 'vi'),
(122, '183', 'c6', 'vi', '20', 'Cao Lộc', 0, 1, 1415954091, 1415954091, 'vi'),
(123, '184', 'c6', 'vi', '20', 'Văn Quan', 0, 1, 1415954091, 1415954091, 'vi'),
(124, '185', 'c6', 'vi', '20', 'Bắc Sơn', 0, 1, 1415954091, 1415954091, 'vi'),
(125, '186', 'c6', 'vi', '20', 'Hữu Lũng', 0, 1, 1415954091, 1415954091, 'vi'),
(126, '187', 'c6', 'vi', '20', 'Chi Lăng', 0, 1, 1415954091, 1415954091, 'vi'),
(127, '188', 'c6', 'vi', '20', 'Lộc Bình', 0, 1, 1415954091, 1415954091, 'vi'),
(128, '189', 'c6', 'vi', '20', 'Đình Lập', 0, 1, 1415954091, 1415954091, 'vi'),
(129, '193', 'c6', 'vi', '22', 'Hạ Long', 0, 1, 1415954091, 1415954091, 'vi'),
(130, '194', 'c6', 'vi', '22', 'Móng Cái', 0, 1, 1415954091, 1415954091, 'vi'),
(131, '195', 'c6', 'vi', '22', 'Cẩm Phả', 0, 1, 1415954091, 1415954091, 'vi'),
(132, '196', 'c6', 'vi', '22', 'Uông Bí', 0, 1, 1415954091, 1415954091, 'vi'),
(133, '198', 'c6', 'vi', '22', 'Bình Liêu', 0, 1, 1415954091, 1415954091, 'vi'),
(134, '199', 'c6', 'vi', '22', 'Tiên Yên', 0, 1, 1415954091, 1415954091, 'vi'),
(135, '200', 'c6', 'vi', '22', 'Đầm Hà', 0, 1, 1415954091, 1415954091, 'vi'),
(136, '201', 'c6', 'vi', '22', 'Hải Hà', 0, 1, 1415954091, 1415954091, 'vi'),
(137, '202', 'c6', 'vi', '22', 'Ba Chẽ', 0, 1, 1415954091, 1415954091, 'vi'),
(138, '203', 'c6', 'vi', '22', 'Vân Đồn', 0, 1, 1415954091, 1415954091, 'vi'),
(139, '204', 'c6', 'vi', '22', 'Hoành Bồ', 0, 1, 1415954091, 1415954091, 'vi'),
(140, '205', 'c6', 'vi', '22', 'Đông Triều', 0, 1, 1415954091, 1415954091, 'vi'),
(141, '206', 'c6', 'vi', '22', 'Yên Hưng', 0, 1, 1415954091, 1415954091, 'vi'),
(142, '207', 'c6', 'vi', '22', 'Cô Tô', 0, 1, 1415954091, 1415954091, 'vi'),
(143, '213', 'c6', 'vi', '24', 'Bắc Giang', 0, 1, 1415954091, 1415954091, 'vi'),
(144, '215', 'c6', 'vi', '24', 'Yên Thế', 0, 1, 1415954091, 1415954091, 'vi'),
(145, '216', 'c6', 'vi', '24', 'Tân Yên', 0, 1, 1415954091, 1415954091, 'vi'),
(146, '217', 'c6', 'vi', '24', 'Lạng Giang', 0, 1, 1415954091, 1415954091, 'vi'),
(147, '218', 'c6', 'vi', '24', 'Lục Nam', 0, 1, 1415954091, 1415954091, 'vi'),
(148, '219', 'c6', 'vi', '24', 'Lục Ngạn', 0, 1, 1415954091, 1415954091, 'vi'),
(149, '220', 'c6', 'vi', '24', 'Sơn Động', 0, 1, 1415954091, 1415954091, 'vi'),
(150, '221', 'c6', 'vi', '24', 'Yên Dũng', 0, 1, 1415954091, 1415954091, 'vi'),
(151, '222', 'c6', 'vi', '24', 'Việt Yên', 0, 1, 1415954092, 1415954092, 'vi'),
(152, '223', 'c6', 'vi', '24', 'Hiệp Hòa', 0, 1, 1415954092, 1415954092, 'vi'),
(153, '227', 'c6', 'vi', '25', 'Việt Trì', 0, 1, 1415954092, 1415954092, 'vi'),
(154, '228', 'c6', 'vi', '25', 'Phú Thọ', 0, 1, 1415954092, 1415954092, 'vi'),
(155, '230', 'c6', 'vi', '25', 'Đoan Hùng', 0, 1, 1415954092, 1415954092, 'vi'),
(156, '231', 'c6', 'vi', '25', 'Hạ Hoà', 0, 1, 1415954092, 1415954092, 'vi'),
(157, '232', 'c6', 'vi', '25', 'Thanh Ba', 0, 1, 1415954092, 1415954092, 'vi'),
(158, '233', 'c6', 'vi', '25', 'Phù Ninh', 0, 1, 1415954092, 1415954092, 'vi'),
(159, '234', 'c6', 'vi', '25', 'Yên Lập', 0, 1, 1415954092, 1415954092, 'vi'),
(160, '235', 'c6', 'vi', '25', 'Cẩm Khê', 0, 1, 1415954092, 1415954092, 'vi'),
(161, '236', 'c6', 'vi', '25', 'Tam Nông', 0, 1, 1415954092, 1415954092, 'vi'),
(162, '237', 'c6', 'vi', '25', 'Lâm Thao', 0, 1, 1415954092, 1415954092, 'vi'),
(163, '238', 'c6', 'vi', '25', 'Thanh Sơn', 0, 1, 1415954092, 1415954092, 'vi'),
(164, '239', 'c6', 'vi', '25', 'Thanh Thuỷ', 0, 1, 1415954092, 1415954092, 'vi'),
(165, '240', 'c6', 'vi', '25', 'Tân Sơn', 0, 1, 1415954092, 1415954092, 'vi'),
(166, '243', 'c6', 'vi', '26', 'Vĩnh Yên', 0, 1, 1415954092, 1415954092, 'vi'),
(167, '244', 'c6', 'vi', '26', 'Phúc Yên', 0, 1, 1415954092, 1415954092, 'vi'),
(168, '246', 'c6', 'vi', '26', 'Lập Thạch', 0, 1, 1415954092, 1415954092, 'vi'),
(169, '247', 'c6', 'vi', '26', 'Tam Dương', 0, 1, 1415954092, 1415954092, 'vi'),
(170, '248', 'c6', 'vi', '26', 'Tam Đảo', 0, 1, 1415954092, 1415954092, 'vi'),
(171, '249', 'c6', 'vi', '26', 'Bình Xuyên', 0, 1, 1415954092, 1415954092, 'vi'),
(172, '250', 'c6', 'vi', '01', 'Mê Linh', 0, 1, 1415954092, 1415954092, 'vi'),
(173, '251', 'c6', 'vi', '26', 'Yên Lạc', 0, 1, 1415954092, 1415954092, 'vi'),
(174, '252', 'c6', 'vi', '26', 'Vĩnh Tường', 0, 1, 1415954092, 1415954092, 'vi'),
(175, '253', 'c6', 'vi', '26', 'Sông Lô', 0, 1, 1415954092, 1415954092, 'vi'),
(176, '256', 'c6', 'vi', '27', 'Bắc Ninh', 0, 1, 1415954092, 1415954092, 'vi'),
(177, '258', 'c6', 'vi', '27', 'Yên Phong', 0, 1, 1415954092, 1415954092, 'vi'),
(178, '259', 'c6', 'vi', '27', 'Quế Võ', 0, 1, 1415954092, 1415954092, 'vi'),
(179, '260', 'c6', 'vi', '27', 'Tiên Du', 0, 1, 1415954092, 1415954092, 'vi'),
(180, '261', 'c6', 'vi', '27', 'Từ Sơn', 0, 1, 1415954092, 1415954092, 'vi'),
(181, '262', 'c6', 'vi', '27', 'Thuận Thành', 0, 1, 1415954092, 1415954092, 'vi'),
(182, '263', 'c6', 'vi', '27', 'Gia Bình', 0, 1, 1415954092, 1415954092, 'vi'),
(183, '264', 'c6', 'vi', '27', 'Lương Tài', 0, 1, 1415954092, 1415954092, 'vi'),
(184, '268', 'c6', 'vi', '01', 'Hà Đông', 0, 1, 1415954092, 1415954092, 'vi'),
(185, '269', 'c6', 'vi', '01', 'Sơn Tây', 0, 1, 1415954092, 1415954092, 'vi'),
(186, '271', 'c6', 'vi', '01', 'Ba Vì', 0, 1, 1415954093, 1415954093, 'vi'),
(187, '272', 'c6', 'vi', '01', 'Phúc Thọ', 0, 1, 1415954093, 1415954093, 'vi'),
(188, '273', 'c6', 'vi', '01', 'Đan Phượng', 0, 1, 1415954093, 1415954093, 'vi'),
(189, '274', 'c6', 'vi', '01', 'Hoài Đức', 0, 1, 1415954093, 1415954093, 'vi'),
(190, '275', 'c6', 'vi', '01', 'Quốc Oai', 0, 1, 1415954093, 1415954093, 'vi'),
(191, '276', 'c6', 'vi', '01', 'Thạch Thất', 0, 1, 1415954093, 1415954093, 'vi'),
(192, '277', 'c6', 'vi', '01', 'Chương Mỹ', 0, 1, 1415954093, 1415954093, 'vi'),
(193, '278', 'c6', 'vi', '01', 'Thanh Oai', 0, 1, 1415954093, 1415954093, 'vi'),
(194, '279', 'c6', 'vi', '01', 'Thường Tín', 0, 1, 1415954093, 1415954093, 'vi'),
(195, '280', 'c6', 'vi', '01', 'Phú Xuyên', 0, 1, 1415954093, 1415954093, 'vi'),
(196, '281', 'c6', 'vi', '01', 'Ứng Hòa', 0, 1, 1415954093, 1415954093, 'vi'),
(197, '282', 'c6', 'vi', '01', 'Mỹ Đức', 0, 1, 1415954093, 1415954093, 'vi'),
(198, '288', 'c6', 'vi', '30', 'Hải Dương', 0, 1, 1415954093, 1415954093, 'vi'),
(199, '290', 'c6', 'vi', '30', 'Chí Linh', 0, 1, 1415954093, 1415954093, 'vi'),
(200, '291', 'c6', 'vi', '30', 'Nam Sách', 0, 1, 1415954093, 1415954093, 'vi'),
(201, '292', 'c6', 'vi', '30', 'Kinh Môn', 0, 1, 1415954093, 1415954093, 'vi'),
(202, '293', 'c6', 'vi', '30', 'Kim Thành', 0, 1, 1415954093, 1415954093, 'vi'),
(203, '294', 'c6', 'vi', '30', 'Thanh Hà', 0, 1, 1415954093, 1415954093, 'vi'),
(204, '295', 'c6', 'vi', '30', 'Cẩm Giàng', 0, 1, 1415954093, 1415954093, 'vi'),
(205, '296', 'c6', 'vi', '30', 'Bình Giang', 0, 1, 1415954093, 1415954093, 'vi'),
(206, '297', 'c6', 'vi', '30', 'Gia Lộc', 0, 1, 1415954093, 1415954093, 'vi'),
(207, '298', 'c6', 'vi', '30', 'Tứ Kỳ', 0, 1, 1415954093, 1415954093, 'vi'),
(208, '299', 'c6', 'vi', '30', 'Ninh Giang', 0, 1, 1415954093, 1415954093, 'vi'),
(209, '300', 'c6', 'vi', '30', 'Thanh Miện', 0, 1, 1415954093, 1415954093, 'vi'),
(210, '303', 'c6', 'vi', '31', 'Hồng Bàng', 0, 1, 1415954093, 1415954093, 'vi'),
(211, '304', 'c6', 'vi', '31', 'Ngô Quyền', 0, 1, 1415954093, 1415954093, 'vi'),
(212, '305', 'c6', 'vi', '31', 'Lê Chân', 0, 1, 1415954094, 1415954094, 'vi'),
(213, '306', 'c6', 'vi', '31', 'Hải An', 0, 1, 1415954094, 1415954094, 'vi'),
(214, '307', 'c6', 'vi', '31', 'Kiến An', 0, 1, 1415954094, 1415954094, 'vi'),
(215, '308', 'c6', 'vi', '31', 'Đồ Sơn', 0, 1, 1415954094, 1415954094, 'vi'),
(216, '309', 'c6', 'vi', '31', 'Kinh Dương', 0, 1, 1415954094, 1415954094, 'vi'),
(217, '311', 'c6', 'vi', '31', 'Thuỷ Nguyên', 0, 1, 1415954094, 1415954094, 'vi'),
(218, '312', 'c6', 'vi', '31', 'An Dương', 0, 1, 1415954094, 1415954094, 'vi'),
(219, '313', 'c6', 'vi', '31', 'An Lão', 0, 1, 1415954094, 1415954094, 'vi'),
(220, '314', 'c6', 'vi', '31', 'Kiến Thụy', 0, 1, 1415954094, 1415954094, 'vi'),
(221, '315', 'c6', 'vi', '31', 'Tiên Lãng', 0, 1, 1415954094, 1415954094, 'vi'),
(222, '316', 'c6', 'vi', '31', 'Vĩnh Bảo', 0, 1, 1415954094, 1415954094, 'vi'),
(223, '317', 'c6', 'vi', '31', 'Cát Hải', 0, 1, 1415954094, 1415954094, 'vi'),
(224, '318', 'c6', 'vi', '31', 'Bạch Long Vĩ', 0, 1, 1415954094, 1415954094, 'vi'),
(225, '323', 'c6', 'vi', '33', 'Hưng Yên', 0, 1, 1415954094, 1415954094, 'vi'),
(226, '325', 'c6', 'vi', '33', 'Văn Lâm', 0, 1, 1415954094, 1415954094, 'vi'),
(227, '326', 'c6', 'vi', '33', 'Văn Giang', 0, 1, 1415954094, 1415954094, 'vi'),
(228, '327', 'c6', 'vi', '33', 'Yên Mỹ', 0, 1, 1415954094, 1415954094, 'vi'),
(229, '328', 'c6', 'vi', '33', 'Mỹ Hào', 0, 1, 1415954094, 1415954094, 'vi'),
(230, '329', 'c6', 'vi', '33', 'Ân Thi', 0, 1, 1415954094, 1415954094, 'vi'),
(231, '330', 'c6', 'vi', '33', 'Khoái Châu', 0, 1, 1415954094, 1415954094, 'vi'),
(232, '331', 'c6', 'vi', '33', 'Kim Động', 0, 1, 1415954094, 1415954094, 'vi'),
(233, '332', 'c6', 'vi', '33', 'Tiên Lữ', 0, 1, 1415954094, 1415954094, 'vi'),
(234, '333', 'c6', 'vi', '33', 'Phù Cừ', 0, 1, 1415954094, 1415954094, 'vi'),
(235, '336', 'c6', 'vi', '34', 'Thái Bình', 0, 1, 1415954094, 1415954094, 'vi'),
(236, '338', 'c6', 'vi', '34', 'Quỳnh Phụ', 0, 1, 1415954094, 1415954094, 'vi'),
(237, '339', 'c6', 'vi', '34', 'Hưng Hà', 0, 1, 1415954094, 1415954094, 'vi'),
(238, '340', 'c6', 'vi', '34', 'Đông Hưng', 0, 1, 1415954094, 1415954094, 'vi'),
(239, '341', 'c6', 'vi', '34', 'Thái Thụy', 0, 1, 1415954094, 1415954094, 'vi'),
(240, '342', 'c6', 'vi', '34', 'Tiền Hải', 0, 1, 1415954094, 1415954094, 'vi'),
(241, '343', 'c6', 'vi', '34', 'Kiến Xương', 0, 1, 1415954094, 1415954094, 'vi'),
(242, '344', 'c6', 'vi', '34', 'Vũ Thư', 0, 1, 1415954094, 1415954094, 'vi'),
(243, '347', 'c6', 'vi', '35', 'Phủ Lý', 0, 1, 1415954094, 1415954094, 'vi'),
(244, '349', 'c6', 'vi', '35', 'Duy Tiên', 0, 1, 1415954094, 1415954094, 'vi'),
(245, '350', 'c6', 'vi', '35', 'Kim Bảng', 0, 1, 1415954094, 1415954094, 'vi'),
(246, '351', 'c6', 'vi', '35', 'Thanh Liêm', 0, 1, 1415954094, 1415954094, 'vi'),
(247, '352', 'c6', 'vi', '35', 'Bình Lục', 0, 1, 1415954094, 1415954094, 'vi'),
(248, '353', 'c6', 'vi', '35', 'Lý Nhân', 0, 1, 1415954094, 1415954094, 'vi'),
(249, '356', 'c6', 'vi', '36', 'Nam Định', 0, 1, 1415954094, 1415954094, 'vi'),
(250, '358', 'c6', 'vi', '36', 'Mỹ Lộc', 0, 1, 1415954094, 1415954094, 'vi'),
(251, '359', 'c6', 'vi', '36', 'Vụ Bản', 0, 1, 1415954094, 1415954094, 'vi'),
(252, '360', 'c6', 'vi', '36', 'Ý Yên', 0, 1, 1415954094, 1415954094, 'vi'),
(253, '361', 'c6', 'vi', '36', 'Nghĩa Hưng', 0, 1, 1415954095, 1415954095, 'vi'),
(254, '362', 'c6', 'vi', '36', 'Nam Trực', 0, 1, 1415954095, 1415954095, 'vi'),
(255, '363', 'c6', 'vi', '36', 'Trực Ninh', 0, 1, 1415954095, 1415954095, 'vi'),
(256, '364', 'c6', 'vi', '36', 'Xuân Trường', 0, 1, 1415954095, 1415954095, 'vi'),
(257, '365', 'c6', 'vi', '36', 'Giao Thủy', 0, 1, 1415954095, 1415954095, 'vi'),
(258, '366', 'c6', 'vi', '36', 'Hải Hậu', 0, 1, 1415954095, 1415954095, 'vi'),
(259, '369', 'c6', 'vi', '37', 'Ninh Bình', 0, 1, 1415954095, 1415954095, 'vi'),
(260, '370', 'c6', 'vi', '37', 'Tam Điệp', 0, 1, 1415954095, 1415954095, 'vi'),
(261, '372', 'c6', 'vi', '37', 'Nho Quan', 0, 1, 1415954095, 1415954095, 'vi'),
(262, '373', 'c6', 'vi', '37', 'Gia Viễn', 0, 1, 1415954095, 1415954095, 'vi'),
(263, '374', 'c6', 'vi', '37', 'Hoa Lư', 0, 1, 1415954095, 1415954095, 'vi'),
(264, '375', 'c6', 'vi', '37', 'Yên Khánh', 0, 1, 1415954095, 1415954095, 'vi'),
(265, '376', 'c6', 'vi', '37', 'Kim Sơn', 0, 1, 1415954095, 1415954095, 'vi'),
(266, '377', 'c6', 'vi', '37', 'Yên Mô', 0, 1, 1415954095, 1415954095, 'vi'),
(267, '380', 'c6', 'vi', '38', 'Thanh Hóa', 0, 1, 1415954095, 1415954095, 'vi'),
(268, '381', 'c6', 'vi', '38', 'Bỉm Sơn', 0, 1, 1415954095, 1415954095, 'vi'),
(269, '382', 'c6', 'vi', '38', 'Sầm Sơn', 0, 1, 1415954095, 1415954095, 'vi'),
(270, '384', 'c6', 'vi', '38', 'Mường Lát', 0, 1, 1415954095, 1415954095, 'vi'),
(271, '385', 'c6', 'vi', '38', 'Quan Hóa', 0, 1, 1415954095, 1415954095, 'vi'),
(272, '386', 'c6', 'vi', '38', 'Bá Thước', 0, 1, 1415954095, 1415954095, 'vi'),
(273, '387', 'c6', 'vi', '38', 'Quan Sơn', 0, 1, 1415954095, 1415954095, 'vi'),
(274, '388', 'c6', 'vi', '38', 'Lang Chánh', 0, 1, 1415954095, 1415954095, 'vi'),
(275, '389', 'c6', 'vi', '38', 'Ngọc Lặc', 0, 1, 1415954095, 1415954095, 'vi'),
(276, '390', 'c6', 'vi', '38', 'Cẩm Thủy', 0, 1, 1415954095, 1415954095, 'vi'),
(277, '391', 'c6', 'vi', '38', 'Thạch Thành', 0, 1, 1415954095, 1415954095, 'vi'),
(278, '392', 'c6', 'vi', '38', 'Hà Trung', 0, 1, 1415954095, 1415954095, 'vi'),
(279, '393', 'c6', 'vi', '38', 'Vĩnh Lộc', 0, 1, 1415954095, 1415954095, 'vi'),
(280, '394', 'c6', 'vi', '38', 'Yên Định', 0, 1, 1415954095, 1415954095, 'vi'),
(281, '395', 'c6', 'vi', '38', 'Thọ Xuân', 0, 1, 1415954095, 1415954095, 'vi'),
(282, '396', 'c6', 'vi', '38', 'Thường Xuân', 0, 1, 1415954095, 1415954095, 'vi'),
(283, '397', 'c6', 'vi', '38', 'Triệu Sơn', 0, 1, 1415954095, 1415954095, 'vi'),
(284, '398', 'c6', 'vi', '38', 'Thiệu Hoá', 0, 1, 1415954095, 1415954095, 'vi'),
(285, '399', 'c6', 'vi', '38', 'Hoằng Hóa', 0, 1, 1415954095, 1415954095, 'vi'),
(286, '400', 'c6', 'vi', '38', 'Hậu Lộc', 0, 1, 1415954095, 1415954095, 'vi'),
(287, '401', 'c6', 'vi', '38', 'Nga Sơn', 0, 1, 1415954096, 1415954096, 'vi'),
(288, '402', 'c6', 'vi', '38', 'Như Xuân', 0, 1, 1415954096, 1415954096, 'vi'),
(289, '403', 'c6', 'vi', '38', 'Như Thanh', 0, 1, 1415954096, 1415954096, 'vi'),
(290, '404', 'c6', 'vi', '38', 'Nông Cống', 0, 1, 1415954096, 1415954096, 'vi'),
(291, '405', 'c6', 'vi', '38', 'Đông Sơn', 0, 1, 1415954096, 1415954096, 'vi'),
(292, '406', 'c6', 'vi', '38', 'Quảng Xương', 0, 1, 1415954096, 1415954096, 'vi'),
(293, '407', 'c6', 'vi', '38', 'Tĩnh Gia', 0, 1, 1415954096, 1415954096, 'vi'),
(294, '412', 'c6', 'vi', '40', 'Vinh', 0, 1, 1415954096, 1415954096, 'vi'),
(295, '413', 'c6', 'vi', '40', 'Cửa Lò', 0, 1, 1415954096, 1415954096, 'vi'),
(296, '414', 'c6', 'vi', '40', 'Thái Hoà', 0, 1, 1415954096, 1415954096, 'vi'),
(297, '415', 'c6', 'vi', '40', 'Quế Phong', 0, 1, 1415954096, 1415954096, 'vi'),
(298, '416', 'c6', 'vi', '40', 'Quỳ Châu', 0, 1, 1415954096, 1415954096, 'vi'),
(299, '417', 'c6', 'vi', '40', 'Kỳ Sơn', 0, 1, 1415954096, 1415954096, 'vi'),
(300, '418', 'c6', 'vi', '40', 'Tương Dương', 0, 1, 1415954096, 1415954096, 'vi'),
(301, '419', 'c6', 'vi', '40', 'Nghĩa Đàn', 0, 1, 1415954096, 1415954096, 'vi'),
(302, '420', 'c6', 'vi', '40', 'Quỳ Hợp', 0, 1, 1415954096, 1415954096, 'vi'),
(303, '421', 'c6', 'vi', '40', 'Quỳnh Lưu', 0, 1, 1415954096, 1415954096, 'vi'),
(304, '422', 'c6', 'vi', '40', 'Con Cuông', 0, 1, 1415954096, 1415954096, 'vi'),
(305, '423', 'c6', 'vi', '40', 'Tân Kỳ', 0, 1, 1415954096, 1415954096, 'vi'),
(306, '424', 'c6', 'vi', '40', 'Anh Sơn', 0, 1, 1415954096, 1415954096, 'vi'),
(307, '425', 'c6', 'vi', '40', 'Diễn Châu', 0, 1, 1415954096, 1415954096, 'vi'),
(308, '426', 'c6', 'vi', '40', 'Yên Thành', 0, 1, 1415954096, 1415954096, 'vi'),
(309, '427', 'c6', 'vi', '40', 'Đô Lương', 0, 1, 1415954096, 1415954096, 'vi'),
(310, '428', 'c6', 'vi', '40', 'Thanh Chương', 0, 1, 1415954096, 1415954096, 'vi'),
(311, '429', 'c6', 'vi', '40', 'Nghi Lộc', 0, 1, 1415954096, 1415954096, 'vi'),
(312, '430', 'c6', 'vi', '40', 'Nam Đàn', 0, 1, 1415954096, 1415954096, 'vi'),
(313, '431', 'c6', 'vi', '40', 'Hưng Nguyên', 0, 1, 1415954096, 1415954096, 'vi'),
(314, '436', 'c6', 'vi', '42', 'Hà Tĩnh', 0, 1, 1415954096, 1415954096, 'vi'),
(315, '437', 'c6', 'vi', '42', 'Hồng Lĩnh', 0, 1, 1415954097, 1415954097, 'vi'),
(316, '439', 'c6', 'vi', '42', 'Hương Sơn', 0, 1, 1415954097, 1415954097, 'vi'),
(317, '440', 'c6', 'vi', '42', 'Đức Thọ', 0, 1, 1415954097, 1415954097, 'vi'),
(318, '441', 'c6', 'vi', '42', 'Vũ Quang', 0, 1, 1415954097, 1415954097, 'vi'),
(319, '442', 'c6', 'vi', '42', 'Nghi Xuân', 0, 1, 1415954097, 1415954097, 'vi'),
(320, '443', 'c6', 'vi', '42', 'Can Lộc', 0, 1, 1415954097, 1415954097, 'vi'),
(321, '444', 'c6', 'vi', '42', 'Hương Khê', 0, 1, 1415954097, 1415954097, 'vi'),
(322, '445', 'c6', 'vi', '42', 'Thạch Hà', 0, 1, 1415954097, 1415954097, 'vi'),
(323, '446', 'c6', 'vi', '42', 'Cẩm Xuyên', 0, 1, 1415954097, 1415954097, 'vi'),
(324, '447', 'c6', 'vi', '42', 'Kỳ Anh', 0, 1, 1415954097, 1415954097, 'vi'),
(325, '448', 'c6', 'vi', '42', 'Lộc Hà', 0, 1, 1415954097, 1415954097, 'vi'),
(326, '450', 'c6', 'vi', '44', 'Đồng Hới', 0, 1, 1415954097, 1415954097, 'vi'),
(327, '452', 'c6', 'vi', '44', 'Minh Hóa', 0, 1, 1415954097, 1415954097, 'vi'),
(328, '453', 'c6', 'vi', '44', 'Tuyên Hóa', 0, 1, 1415954097, 1415954097, 'vi'),
(329, '454', 'c6', 'vi', '44', 'Quảng Trạch', 0, 1, 1415954097, 1415954097, 'vi'),
(330, '455', 'c6', 'vi', '44', 'Bố Trạch', 0, 1, 1415954097, 1415954097, 'vi'),
(331, '456', 'c6', 'vi', '44', 'Quảng Ninh', 0, 1, 1415954097, 1415954097, 'vi'),
(332, '457', 'c6', 'vi', '44', 'Lệ Thủy', 0, 1, 1415954097, 1415954097, 'vi'),
(333, '461', 'c6', 'vi', '45', 'Đông Hà', 0, 1, 1415954097, 1415954097, 'vi'),
(334, '462', 'c6', 'vi', '45', 'Quảng Trị', 0, 1, 1415954097, 1415954097, 'vi'),
(335, '464', 'c6', 'vi', '45', 'Vĩnh Linh', 0, 1, 1415954097, 1415954097, 'vi'),
(336, '465', 'c6', 'vi', '45', 'Hướng Hóa', 0, 1, 1415954097, 1415954097, 'vi'),
(337, '466', 'c6', 'vi', '45', 'Gio Linh', 0, 1, 1415954097, 1415954097, 'vi'),
(338, '467', 'c6', 'vi', '45', 'Đa Krông', 0, 1, 1415954097, 1415954097, 'vi'),
(339, '468', 'c6', 'vi', '45', 'Cam Lộ', 0, 1, 1415954097, 1415954097, 'vi'),
(340, '469', 'c6', 'vi', '45', 'Triệu Phong', 0, 1, 1415954097, 1415954097, 'vi'),
(341, '470', 'c6', 'vi', '45', 'Hải Lăng', 0, 1, 1415954097, 1415954097, 'vi'),
(342, '471', 'c6', 'vi', '45', 'Cồn Cỏ', 0, 1, 1415954097, 1415954097, 'vi'),
(343, '474', 'c6', 'vi', '46', 'Huế', 0, 1, 1415954097, 1415954097, 'vi'),
(344, '476', 'c6', 'vi', '46', 'Phong Điền', 0, 1, 1415954097, 1415954097, 'vi'),
(345, '477', 'c6', 'vi', '46', 'Quảng Điền', 0, 1, 1415954097, 1415954097, 'vi'),
(346, '478', 'c6', 'vi', '46', 'Phú Vang', 0, 1, 1415954097, 1415954097, 'vi'),
(347, '479', 'c6', 'vi', '46', 'Hương Thủy', 0, 1, 1415954097, 1415954097, 'vi'),
(348, '480', 'c6', 'vi', '46', 'Hương Trà', 0, 1, 1415954098, 1415954098, 'vi'),
(349, '481', 'c6', 'vi', '46', 'A Lưới', 0, 1, 1415954098, 1415954098, 'vi'),
(350, '482', 'c6', 'vi', '46', 'Phú Lộc', 0, 1, 1415954098, 1415954098, 'vi'),
(351, '483', 'c6', 'vi', '46', 'Nam Đông', 0, 1, 1415954098, 1415954098, 'vi'),
(352, '490', 'c6', 'vi', '48', 'Liên Chiểu', 0, 1, 1415954098, 1415954098, 'vi'),
(353, '491', 'c6', 'vi', '48', 'Thanh Khê', 0, 1, 1415954098, 1415954098, 'vi'),
(354, '492', 'c6', 'vi', '48', 'Hải Châu', 0, 1, 1415954098, 1415954098, 'vi'),
(355, '493', 'c6', 'vi', '48', 'Sơn Trà', 0, 1, 1415954098, 1415954098, 'vi'),
(356, '494', 'c6', 'vi', '48', 'Ngũ Hành Sơn', 0, 1, 1415954098, 1415954098, 'vi'),
(357, '495', 'c6', 'vi', '48', 'Cẩm Lệ', 0, 1, 1415954098, 1415954098, 'vi'),
(358, '497', 'c6', 'vi', '48', 'Hoà Vang', 0, 1, 1415954098, 1415954098, 'vi'),
(359, '498', 'c6', 'vi', '48', 'Hoàng Sa', 0, 1, 1415954098, 1415954098, 'vi'),
(360, '502', 'c6', 'vi', '49', 'Tam Kỳ', 0, 1, 1415954098, 1415954098, 'vi'),
(361, '503', 'c6', 'vi', '49', 'Hội An', 0, 1, 1415954098, 1415954098, 'vi'),
(362, '504', 'c6', 'vi', '49', 'Tây Giang', 0, 1, 1415954098, 1415954098, 'vi'),
(363, '505', 'c6', 'vi', '49', 'Đông Giang', 0, 1, 1415954098, 1415954098, 'vi'),
(364, '506', 'c6', 'vi', '49', 'Đại Lộc', 0, 1, 1415954098, 1415954098, 'vi'),
(365, '507', 'c6', 'vi', '49', 'Điện Bàn', 0, 1, 1415954098, 1415954098, 'vi'),
(366, '508', 'c6', 'vi', '49', 'Duy Xuyên', 0, 1, 1415954098, 1415954098, 'vi'),
(367, '509', 'c6', 'vi', '49', 'Quế Sơn', 0, 1, 1415954098, 1415954098, 'vi'),
(368, '510', 'c6', 'vi', '49', 'Nam Giang', 0, 1, 1415954098, 1415954098, 'vi'),
(369, '511', 'c6', 'vi', '49', 'Phước Sơn', 0, 1, 1415954098, 1415954098, 'vi'),
(370, '512', 'c6', 'vi', '49', 'Hiệp Đức', 0, 1, 1415954098, 1415954098, 'vi'),
(371, '513', 'c6', 'vi', '49', 'Thăng Bình', 0, 1, 1415954098, 1415954098, 'vi'),
(372, '514', 'c6', 'vi', '49', 'Tiên Phước', 0, 1, 1415954098, 1415954098, 'vi'),
(373, '515', 'c6', 'vi', '49', 'Bắc Trà My', 0, 1, 1415954098, 1415954098, 'vi'),
(374, '516', 'c6', 'vi', '49', 'Nam Trà My', 0, 1, 1415954098, 1415954098, 'vi'),
(375, '517', 'c6', 'vi', '49', 'Núi Thành', 0, 1, 1415954098, 1415954098, 'vi'),
(376, '518', 'c6', 'vi', '49', 'Phú Ninh', 0, 1, 1415954098, 1415954098, 'vi'),
(377, '519', 'c6', 'vi', '49', 'Nông Sơn', 0, 1, 1415954099, 1415954099, 'vi'),
(378, '522', 'c6', 'vi', '51', 'Quảng Ngãi', 0, 1, 1415954099, 1415954099, 'vi'),
(379, '524', 'c6', 'vi', '51', 'Bình Sơn', 0, 1, 1415954099, 1415954099, 'vi'),
(380, '525', 'c6', 'vi', '51', 'Trà Bồng', 0, 1, 1415954099, 1415954099, 'vi'),
(381, '526', 'c6', 'vi', '51', 'Tây Trà', 0, 1, 1415954099, 1415954099, 'vi'),
(382, '527', 'c6', 'vi', '51', 'Sơn Tịnh', 0, 1, 1415954099, 1415954099, 'vi'),
(383, '528', 'c6', 'vi', '51', 'Tư Nghĩa', 0, 1, 1415954099, 1415954099, 'vi'),
(384, '529', 'c6', 'vi', '51', 'Sơn Hà', 0, 1, 1415954099, 1415954099, 'vi'),
(385, '530', 'c6', 'vi', '51', 'Sơn Tây', 0, 1, 1415954099, 1415954099, 'vi'),
(386, '531', 'c6', 'vi', '51', 'Minh Long', 0, 1, 1415954099, 1415954099, 'vi'),
(387, '532', 'c6', 'vi', '51', 'Nghĩa Hành', 0, 1, 1415954099, 1415954099, 'vi'),
(388, '533', 'c6', 'vi', '51', 'Mộ Đức', 0, 1, 1415954099, 1415954099, 'vi'),
(389, '534', 'c6', 'vi', '51', 'Đức Phổ', 0, 1, 1415954099, 1415954099, 'vi'),
(390, '535', 'c6', 'vi', '51', 'Ba Tơ', 0, 1, 1415954099, 1415954099, 'vi'),
(391, '536', 'c6', 'vi', '51', 'Lý Sơn', 0, 1, 1415954099, 1415954099, 'vi'),
(392, '540', 'c6', 'vi', '52', 'Qui Nhơn', 0, 1, 1415954099, 1415954099, 'vi'),
(393, '542', 'c6', 'vi', '52', 'An Lão', 0, 1, 1415954099, 1415954099, 'vi'),
(394, '543', 'c6', 'vi', '52', 'Hoài Nhơn', 0, 1, 1415954099, 1415954099, 'vi'),
(395, '544', 'c6', 'vi', '52', 'Hoài Ân', 0, 1, 1415954099, 1415954099, 'vi'),
(396, '545', 'c6', 'vi', '52', 'Phù Mỹ', 0, 1, 1415954099, 1415954099, 'vi'),
(397, '546', 'c6', 'vi', '52', 'Vĩnh Thạnh', 0, 1, 1415954099, 1415954099, 'vi'),
(398, '547', 'c6', 'vi', '52', 'Tây Sơn', 0, 1, 1415954099, 1415954099, 'vi'),
(399, '548', 'c6', 'vi', '52', 'Phù Cát', 0, 1, 1415954099, 1415954099, 'vi'),
(400, '549', 'c6', 'vi', '52', 'An Nhơn', 0, 1, 1415954099, 1415954099, 'vi'),
(401, '550', 'c6', 'vi', '52', 'Tuy Phước', 0, 1, 1415954099, 1415954099, 'vi'),
(402, '551', 'c6', 'vi', '52', 'Vân Canh', 0, 1, 1415954099, 1415954099, 'vi'),
(403, '555', 'c6', 'vi', '54', 'Tuy Hòa', 0, 1, 1415954099, 1415954099, 'vi'),
(404, '557', 'c6', 'vi', '54', 'Sông Cầu', 0, 1, 1415954099, 1415954099, 'vi'),
(405, '558', 'c6', 'vi', '54', 'Đồng Xuân', 0, 1, 1415954099, 1415954099, 'vi'),
(406, '559', 'c6', 'vi', '54', 'Tuy An', 0, 1, 1415954099, 1415954099, 'vi'),
(407, '560', 'c6', 'vi', '54', 'Sơn Hòa', 0, 1, 1415954099, 1415954099, 'vi'),
(408, '561', 'c6', 'vi', '54', 'Sông Hinh', 0, 1, 1415954099, 1415954099, 'vi'),
(409, '562', 'c6', 'vi', '54', 'Tây Hoà', 0, 1, 1415954099, 1415954099, 'vi'),
(410, '563', 'c6', 'vi', '54', 'Phú Hoà', 0, 1, 1415954099, 1415954099, 'vi'),
(411, '564', 'c6', 'vi', '54', 'Đông Hoà', 0, 1, 1415954099, 1415954099, 'vi'),
(412, '568', 'c6', 'vi', '56', 'Nha Trang', 0, 1, 1415954099, 1415954099, 'vi'),
(413, '569', 'c6', 'vi', '56', 'Cam Ranh', 0, 1, 1415954099, 1415954099, 'vi'),
(414, '570', 'c6', 'vi', '56', 'Cam Lâm', 0, 1, 1415954099, 1415954099, 'vi'),
(415, '571', 'c6', 'vi', '56', 'Vạn Ninh', 0, 1, 1415954099, 1415954099, 'vi'),
(416, '572', 'c6', 'vi', '56', 'Ninh Hòa', 0, 1, 1415954099, 1415954099, 'vi'),
(417, '573', 'c6', 'vi', '56', 'Khánh Vĩnh', 0, 1, 1415954099, 1415954099, 'vi'),
(418, '574', 'c6', 'vi', '56', 'Diên Khánh', 0, 1, 1415954099, 1415954099, 'vi'),
(419, '575', 'c6', 'vi', '56', 'Khánh Sơn', 0, 1, 1415954099, 1415954099, 'vi'),
(420, '576', 'c6', 'vi', '56', 'Trường Sa', 0, 1, 1415954099, 1415954099, 'vi'),
(421, '582', 'c6', 'vi', '58', 'Phan Rang-Tháp Chàm', 0, 1, 1415954099, 1415954099, 'vi'),
(422, '584', 'c6', 'vi', '58', 'Bác Ái', 0, 1, 1415954100, 1415954100, 'vi'),
(423, '585', 'c6', 'vi', '58', 'Ninh Sơn', 0, 1, 1415954100, 1415954100, 'vi'),
(424, '586', 'c6', 'vi', '58', 'Ninh Hải', 0, 1, 1415954100, 1415954100, 'vi'),
(425, '587', 'c6', 'vi', '58', 'Ninh Phước', 0, 1, 1415954100, 1415954100, 'vi'),
(426, '588', 'c6', 'vi', '58', 'Thuận Bắc', 0, 1, 1415954100, 1415954100, 'vi'),
(427, '589', 'c6', 'vi', '58', 'Thuận Nam', 0, 1, 1415954100, 1415954100, 'vi'),
(428, '593', 'c6', 'vi', '60', 'Phan Thiết', 0, 1, 1415954100, 1415954100, 'vi'),
(429, '594', 'c6', 'vi', '60', 'La Gi', 0, 1, 1415954100, 1415954100, 'vi'),
(430, '595', 'c6', 'vi', '60', 'Tuy Phong', 0, 1, 1415954100, 1415954100, 'vi'),
(431, '596', 'c6', 'vi', '60', 'Bắc Bình', 0, 1, 1415954100, 1415954100, 'vi'),
(432, '597', 'c6', 'vi', '60', 'Hàm Thuận Bắc', 0, 1, 1415954100, 1415954100, 'vi'),
(433, '598', 'c6', 'vi', '60', 'Hàm Thuận Nam', 0, 1, 1415954100, 1415954100, 'vi'),
(434, '599', 'c6', 'vi', '60', 'Tánh Linh', 0, 1, 1415954100, 1415954100, 'vi'),
(435, '600', 'c6', 'vi', '60', 'Đức Linh', 0, 1, 1415954100, 1415954100, 'vi'),
(436, '601', 'c6', 'vi', '60', 'Hàm Tân', 0, 1, 1415954100, 1415954100, 'vi'),
(437, '602', 'c6', 'vi', '60', 'Phú Quí', 0, 1, 1415954100, 1415954100, 'vi'),
(438, '608', 'c6', 'vi', '62', 'Kon Tum', 0, 1, 1415954100, 1415954100, 'vi'),
(439, '610', 'c6', 'vi', '62', 'Đắk Glei', 0, 1, 1415954100, 1415954100, 'vi'),
(440, '611', 'c6', 'vi', '62', 'Ngọc Hồi', 0, 1, 1415954100, 1415954100, 'vi'),
(441, '612', 'c6', 'vi', '62', 'Đắk Tô', 0, 1, 1415954100, 1415954100, 'vi'),
(442, '613', 'c6', 'vi', '62', 'Kon Plông', 0, 1, 1415954100, 1415954100, 'vi'),
(443, '614', 'c6', 'vi', '62', 'Kon Rẫy', 0, 1, 1415954100, 1415954100, 'vi'),
(444, '615', 'c6', 'vi', '62', 'Đắk Hà', 0, 1, 1415954100, 1415954100, 'vi'),
(445, '616', 'c6', 'vi', '62', 'Sa Thầy', 0, 1, 1415954101, 1415954101, 'vi'),
(446, '617', 'c6', 'vi', '62', 'Tu Mơ Rông', 0, 1, 1415954101, 1415954101, 'vi'),
(447, '622', 'c6', 'vi', '64', 'Pleiku', 0, 1, 1415954101, 1415954101, 'vi'),
(448, '623', 'c6', 'vi', '64', 'An Khê', 0, 1, 1415954101, 1415954101, 'vi'),
(449, '624', 'c6', 'vi', '64', 'Ayun Pa', 0, 1, 1415954101, 1415954101, 'vi'),
(450, '625', 'c6', 'vi', '64', 'Kbang', 0, 1, 1415954101, 1415954101, 'vi'),
(451, '626', 'c6', 'vi', '64', 'Đăk Đoa', 0, 1, 1415954101, 1415954101, 'vi'),
(452, '627', 'c6', 'vi', '64', 'Chư Păh', 0, 1, 1415954101, 1415954101, 'vi'),
(453, '628', 'c6', 'vi', '64', 'Ia Grai', 0, 1, 1415954101, 1415954101, 'vi'),
(454, '629', 'c6', 'vi', '64', 'Mang Yang', 0, 1, 1415954101, 1415954101, 'vi'),
(455, '630', 'c6', 'vi', '64', 'Kông Chro', 0, 1, 1415954101, 1415954101, 'vi'),
(456, '631', 'c6', 'vi', '64', 'Đức Cơ', 0, 1, 1415954101, 1415954101, 'vi'),
(457, '632', 'c6', 'vi', '64', 'Chư Prông', 0, 1, 1415954101, 1415954101, 'vi'),
(458, '633', 'c6', 'vi', '64', 'Chư Sê', 0, 1, 1415954101, 1415954101, 'vi'),
(459, '634', 'c6', 'vi', '64', 'Đăk Pơ', 0, 1, 1415954101, 1415954101, 'vi'),
(460, '635', 'c6', 'vi', '64', 'Ia Pa', 0, 1, 1415954101, 1415954101, 'vi'),
(461, '637', 'c6', 'vi', '64', 'Krông Pa', 0, 1, 1415954101, 1415954101, 'vi'),
(462, '638', 'c6', 'vi', '64', 'Phú Thiện', 0, 1, 1415954101, 1415954101, 'vi'),
(463, '639', 'c6', 'vi', '64', 'Chư Pưh', 0, 1, 1415954101, 1415954101, 'vi'),
(464, '643', 'c6', 'vi', '66', 'Buôn Ma Thuột', 0, 1, 1415954101, 1415954101, 'vi'),
(465, '644', 'c6', 'vi', '66', 'Buôn Hồ', 0, 1, 1415954101, 1415954101, 'vi'),
(466, '645', 'c6', 'vi', '66', 'Ea H''leo', 0, 1, 1415954101, 1415954101, 'vi'),
(467, '646', 'c6', 'vi', '66', 'Ea Súp', 0, 1, 1415954101, 1415954101, 'vi'),
(468, '647', 'c6', 'vi', '66', 'Buôn Đôn', 0, 1, 1415954101, 1415954101, 'vi'),
(469, '648', 'c6', 'vi', '66', 'Cư M''gar', 0, 1, 1415954101, 1415954101, 'vi'),
(470, '649', 'c6', 'vi', '66', 'Krông Búk', 0, 1, 1415954101, 1415954101, 'vi'),
(471, '650', 'c6', 'vi', '66', 'Krông Năng', 0, 1, 1415954101, 1415954101, 'vi'),
(472, '651', 'c6', 'vi', '66', 'Ea Kar', 0, 1, 1415954101, 1415954101, 'vi'),
(473, '652', 'c6', 'vi', '66', 'M''đrắk', 0, 1, 1415954101, 1415954101, 'vi'),
(474, '653', 'c6', 'vi', '66', 'Krông Bông', 0, 1, 1415954101, 1415954101, 'vi'),
(475, '654', 'c6', 'vi', '66', 'Krông Pắc', 0, 1, 1415954101, 1415954101, 'vi'),
(476, '655', 'c6', 'vi', '66', 'Krông A Na', 0, 1, 1415954101, 1415954101, 'vi'),
(477, '656', 'c6', 'vi', '66', 'Lắk', 0, 1, 1415954101, 1415954101, 'vi'),
(478, '657', 'c6', 'vi', '66', 'Cư Kuin', 0, 1, 1415954101, 1415954101, 'vi'),
(479, '660', 'c6', 'vi', '67', 'Gia Nghĩa', 0, 1, 1415954101, 1415954101, 'vi'),
(480, '661', 'c6', 'vi', '67', 'Đắk Glong', 0, 1, 1415954101, 1415954101, 'vi'),
(481, '662', 'c6', 'vi', '67', 'Cư Jút', 0, 1, 1415954101, 1415954101, 'vi'),
(482, '663', 'c6', 'vi', '67', 'Đắk Mil', 0, 1, 1415954101, 1415954101, 'vi'),
(483, '664', 'c6', 'vi', '67', 'Krông Nô', 0, 1, 1415954101, 1415954101, 'vi'),
(484, '665', 'c6', 'vi', '67', 'Đắk Song', 0, 1, 1415954101, 1415954101, 'vi'),
(485, '666', 'c6', 'vi', '67', 'Đắk R''lấp', 0, 1, 1415954102, 1415954102, 'vi'),
(486, '667', 'c6', 'vi', '67', 'Tuy Đức', 0, 1, 1415954102, 1415954102, 'vi'),
(487, '672', 'c6', 'vi', '68', 'Đà Lạt', 0, 1, 1415954102, 1415954102, 'vi'),
(488, '673', 'c6', 'vi', '68', 'Bảo Lộc', 0, 1, 1415954102, 1415954102, 'vi'),
(489, '674', 'c6', 'vi', '68', 'Đam Rông', 0, 1, 1415954102, 1415954102, 'vi'),
(490, '675', 'c6', 'vi', '68', 'Lạc Dương', 0, 1, 1415954102, 1415954102, 'vi'),
(491, '676', 'c6', 'vi', '68', 'Lâm Hà', 0, 1, 1415954102, 1415954102, 'vi'),
(492, '677', 'c6', 'vi', '68', 'Đơn Dương', 0, 1, 1415954102, 1415954102, 'vi'),
(493, '678', 'c6', 'vi', '68', 'Đức Trọng', 0, 1, 1415954102, 1415954102, 'vi'),
(494, '679', 'c6', 'vi', '68', 'Di Linh', 0, 1, 1415954102, 1415954102, 'vi'),
(495, '680', 'c6', 'vi', '68', 'Bảo Lâm', 0, 1, 1415954102, 1415954102, 'vi'),
(496, '681', 'c6', 'vi', '68', 'Đạ Huoai', 0, 1, 1415954102, 1415954102, 'vi'),
(497, '682', 'c6', 'vi', '68', 'Đạ Tẻh', 0, 1, 1415954102, 1415954102, 'vi'),
(498, '683', 'c6', 'vi', '68', 'Cát Tiên', 0, 1, 1415954102, 1415954102, 'vi'),
(499, '688', 'c6', 'vi', '70', 'Phước Long', 0, 1, 1415954102, 1415954102, 'vi'),
(500, '689', 'c6', 'vi', '70', 'Đồng Xoài', 0, 1, 1415954102, 1415954102, 'vi'),
(501, '690', 'c6', 'vi', '70', 'Bình Long', 0, 1, 1415954102, 1415954102, 'vi'),
(502, '691', 'c6', 'vi', '70', 'Bù Gia Mập', 0, 1, 1415954102, 1415954102, 'vi'),
(503, '692', 'c6', 'vi', '70', 'Lộc Ninh', 0, 1, 1415954102, 1415954102, 'vi'),
(504, '693', 'c6', 'vi', '70', 'Bù Đốp', 0, 1, 1415954102, 1415954102, 'vi'),
(505, '694', 'c6', 'vi', '70', 'Hớn Quản', 0, 1, 1415954102, 1415954102, 'vi'),
(506, '695', 'c6', 'vi', '70', 'Đồng Phù', 0, 1, 1415954102, 1415954102, 'vi'),
(507, '696', 'c6', 'vi', '70', 'Bù Đăng', 0, 1, 1415954102, 1415954102, 'vi'),
(508, '697', 'c6', 'vi', '70', 'Chơn Thành', 0, 1, 1415954102, 1415954102, 'vi'),
(509, '703', 'c6', 'vi', '72', 'Tây Ninh', 0, 1, 1415954102, 1415954102, 'vi'),
(510, '705', 'c6', 'vi', '72', 'Tân Biên', 0, 1, 1415954102, 1415954102, 'vi'),
(511, '706', 'c6', 'vi', '72', 'Tân Châu', 0, 1, 1415954102, 1415954102, 'vi'),
(512, '707', 'c6', 'vi', '72', 'Dương Minh Châu', 0, 1, 1415954102, 1415954102, 'vi'),
(513, '708', 'c6', 'vi', '72', 'Châu Thành', 0, 1, 1415954102, 1415954102, 'vi'),
(514, '709', 'c6', 'vi', '72', 'Hòa Thành', 0, 1, 1415954102, 1415954102, 'vi'),
(515, '710', 'c6', 'vi', '72', 'Gò Dầu', 0, 1, 1415954102, 1415954102, 'vi'),
(516, '711', 'c6', 'vi', '72', 'Bến Cầu', 0, 1, 1415954102, 1415954102, 'vi'),
(517, '712', 'c6', 'vi', '72', 'Trảng Bàng', 0, 1, 1415954102, 1415954102, 'vi'),
(518, '718', 'c6', 'vi', '74', 'Thủ Dầu Một', 0, 1, 1415954102, 1415954102, 'vi'),
(519, '720', 'c6', 'vi', '74', 'Dầu Tiếng', 0, 1, 1415954102, 1415954102, 'vi'),
(520, '721', 'c6', 'vi', '74', 'Bến Cát', 0, 1, 1415954102, 1415954102, 'vi'),
(521, '722', 'c6', 'vi', '74', 'Phú Giáo', 0, 1, 1415954102, 1415954102, 'vi'),
(522, '723', 'c6', 'vi', '74', 'Tân Uyên', 0, 1, 1415954102, 1415954102, 'vi'),
(523, '724', 'c6', 'vi', '74', 'Dĩ An', 0, 1, 1415954102, 1415954102, 'vi'),
(524, '725', 'c6', 'vi', '74', 'Thuận An', 0, 1, 1415954102, 1415954102, 'vi'),
(525, '731', 'c6', 'vi', '75', 'Biên Hòa', 0, 1, 1415954102, 1415954102, 'vi'),
(526, '732', 'c6', 'vi', '75', 'Long Khánh', 0, 1, 1415954102, 1415954102, 'vi'),
(527, '734', 'c6', 'vi', '75', 'Tân Phú', 0, 1, 1415954102, 1415954102, 'vi'),
(528, '735', 'c6', 'vi', '75', 'Vĩnh Cửu', 0, 1, 1415954102, 1415954102, 'vi'),
(529, '736', 'c6', 'vi', '75', 'Định Quán', 0, 1, 1415954102, 1415954102, 'vi'),
(530, '737', 'c6', 'vi', '75', 'Trảng Bom', 0, 1, 1415954102, 1415954102, 'vi'),
(531, '738', 'c6', 'vi', '75', 'Thống Nhất', 0, 1, 1415954103, 1415954103, 'vi'),
(532, '739', 'c6', 'vi', '75', 'Cẩm Mỹ', 0, 1, 1415954103, 1415954103, 'vi'),
(533, '740', 'c6', 'vi', '75', 'Long Thành', 0, 1, 1415954103, 1415954103, 'vi'),
(534, '741', 'c6', 'vi', '75', 'Xuân Lộc', 0, 1, 1415954103, 1415954103, 'vi'),
(535, '742', 'c6', 'vi', '75', 'Nhơn Trạch', 0, 1, 1415954103, 1415954103, 'vi'),
(536, '747', 'c6', 'vi', '77', 'Vũng Tầu', 0, 1, 1415954103, 1415954103, 'vi'),
(537, '748', 'c6', 'vi', '77', 'Bà Rịa', 0, 1, 1415954103, 1415954103, 'vi'),
(538, '750', 'c6', 'vi', '77', 'Châu Đức', 0, 1, 1415954103, 1415954103, 'vi'),
(539, '751', 'c6', 'vi', '77', 'Xuyên Mộc', 0, 1, 1415954103, 1415954103, 'vi'),
(540, '752', 'c6', 'vi', '77', 'Long Điền', 0, 1, 1415954103, 1415954103, 'vi'),
(541, '753', 'c6', 'vi', '77', 'Đất Đỏ', 0, 1, 1415954103, 1415954103, 'vi'),
(542, '754', 'c6', 'vi', '77', 'Tân Thành', 0, 1, 1415954103, 1415954103, 'vi'),
(543, '755', 'c6', 'vi', '77', 'Côn Đảo', 0, 1, 1415954103, 1415954103, 'vi'),
(544, '760', 'c6', 'vi', '79', '1', 0, 1, 1415954103, 1415954103, 'vi'),
(545, '761', 'c6', 'vi', '79', '12', 0, 1, 1415954103, 1415954103, 'vi'),
(546, '762', 'c6', 'vi', '79', 'Thủ Đức', 0, 1, 1415954103, 1415954103, 'vi'),
(547, '763', 'c6', 'vi', '79', '9', 0, 1, 1415954103, 1415954103, 'vi'),
(548, '764', 'c6', 'vi', '79', 'Gò Vấp', 0, 1, 1415954103, 1415954103, 'vi'),
(549, '765', 'c6', 'vi', '79', 'Bình Thạnh', 0, 1, 1415954103, 1415954103, 'vi'),
(550, '766', 'c6', 'vi', '79', 'Tân Bình', 0, 1, 1415954103, 1415954103, 'vi'),
(551, '767', 'c6', 'vi', '79', 'Tân Phú', 0, 1, 1415954103, 1415954103, 'vi'),
(552, '768', 'c6', 'vi', '79', 'Phú Nhuận', 0, 1, 1415954103, 1415954103, 'vi'),
(553, '769', 'c6', 'vi', '79', '2', 0, 1, 1415954103, 1415954103, 'vi'),
(554, '770', 'c6', 'vi', '79', '3', 0, 1, 1415954103, 1415954103, 'vi'),
(555, '771', 'c6', 'vi', '79', '10', 0, 1, 1415954103, 1415954103, 'vi'),
(556, '772', 'c6', 'vi', '79', '11', 0, 1, 1415954103, 1415954103, 'vi'),
(557, '773', 'c6', 'vi', '79', '4', 0, 1, 1415954103, 1415954103, 'vi'),
(558, '774', 'c6', 'vi', '79', '5', 0, 1, 1415954103, 1415954103, 'vi'),
(559, '775', 'c6', 'vi', '79', '6', 0, 1, 1415954103, 1415954103, 'vi'),
(560, '776', 'c6', 'vi', '79', '8', 0, 1, 1415954103, 1415954103, 'vi'),
(561, '777', 'c6', 'vi', '79', 'Bình Tân', 0, 1, 1415954103, 1415954103, 'vi'),
(562, '778', 'c6', 'vi', '79', '7', 0, 1, 1415954103, 1415954103, 'vi'),
(563, '783', 'c6', 'vi', '79', 'Củ Chi', 0, 1, 1415954103, 1415954103, 'vi'),
(564, '784', 'c6', 'vi', '79', 'Hóc Môn', 0, 1, 1415954103, 1415954103, 'vi'),
(565, '785', 'c6', 'vi', '79', 'Bình Chánh', 0, 1, 1415954103, 1415954103, 'vi'),
(566, '786', 'c6', 'vi', '79', 'Nhà Bè', 0, 1, 1415954104, 1415954104, 'vi'),
(567, '787', 'c6', 'vi', '79', 'Cần Giờ', 0, 1, 1415954104, 1415954104, 'vi'),
(568, '794', 'c6', 'vi', '80', 'Tân An', 0, 1, 1415954104, 1415954104, 'vi'),
(569, '796', 'c6', 'vi', '80', 'Tân Hưng', 0, 1, 1415954104, 1415954104, 'vi'),
(570, '797', 'c6', 'vi', '80', 'Vĩnh Hưng', 0, 1, 1415954104, 1415954104, 'vi'),
(571, '798', 'c6', 'vi', '80', 'Mộc Hóa', 0, 1, 1415954104, 1415954104, 'vi'),
(572, '799', 'c6', 'vi', '80', 'Tân Thạnh', 0, 1, 1415954104, 1415954104, 'vi'),
(573, '800', 'c6', 'vi', '80', 'Thạnh Hóa', 0, 1, 1415954104, 1415954104, 'vi'),
(574, '801', 'c6', 'vi', '80', 'Đức Huệ', 0, 1, 1415954104, 1415954104, 'vi'),
(575, '802', 'c6', 'vi', '80', 'Đức Hòa', 0, 1, 1415954104, 1415954104, 'vi'),
(576, '803', 'c6', 'vi', '80', 'Bến Lức', 0, 1, 1415954104, 1415954104, 'vi'),
(577, '804', 'c6', 'vi', '80', 'Thủ Thừa', 0, 1, 1415954104, 1415954104, 'vi'),
(578, '805', 'c6', 'vi', '80', 'Tân Trụ', 0, 1, 1415954104, 1415954104, 'vi'),
(579, '806', 'c6', 'vi', '80', 'Cần Đước', 0, 1, 1415954104, 1415954104, 'vi'),
(580, '807', 'c6', 'vi', '80', 'Cần Giuộc', 0, 1, 1415954104, 1415954104, 'vi'),
(581, '808', 'c6', 'vi', '80', 'Châu Thành', 0, 1, 1415954104, 1415954104, 'vi'),
(582, '815', 'c6', 'vi', '82', 'Mỹ Tho', 0, 1, 1415954104, 1415954104, 'vi'),
(583, '816', 'c6', 'vi', '82', 'Gò Công', 0, 1, 1415954104, 1415954104, 'vi'),
(584, '818', 'c6', 'vi', '82', 'Tân Phước', 0, 1, 1415954104, 1415954104, 'vi'),
(585, '819', 'c6', 'vi', '82', 'Cái Bè', 0, 1, 1415954104, 1415954104, 'vi'),
(586, '820', 'c6', 'vi', '82', 'Cai Lậy', 0, 1, 1415954104, 1415954104, 'vi'),
(587, '821', 'c6', 'vi', '82', 'Châu Thành', 0, 1, 1415954104, 1415954104, 'vi'),
(588, '822', 'c6', 'vi', '82', 'Chợ Gạo', 0, 1, 1415954104, 1415954104, 'vi'),
(589, '823', 'c6', 'vi', '82', 'Gò Công Tây', 0, 1, 1415954104, 1415954104, 'vi'),
(590, '824', 'c6', 'vi', '82', 'Gò Công Đông', 0, 1, 1415954104, 1415954104, 'vi'),
(591, '825', 'c6', 'vi', '82', 'Tân Phú Đông', 0, 1, 1415954104, 1415954104, 'vi'),
(592, '829', 'c6', 'vi', '83', 'Bến Tre', 0, 1, 1415954104, 1415954104, 'vi'),
(593, '831', 'c6', 'vi', '83', 'Châu Thành', 0, 1, 1415954104, 1415954104, 'vi'),
(594, '832', 'c6', 'vi', '83', 'Chợ Lách', 0, 1, 1415954104, 1415954104, 'vi'),
(595, '833', 'c6', 'vi', '83', 'Mỏ Cày Nam', 0, 1, 1415954104, 1415954104, 'vi'),
(596, '834', 'c6', 'vi', '83', 'Giồng Trôm', 0, 1, 1415954104, 1415954104, 'vi'),
(597, '835', 'c6', 'vi', '83', 'Bình Đại', 0, 1, 1415954104, 1415954104, 'vi'),
(598, '836', 'c6', 'vi', '83', 'Ba Tri', 0, 1, 1415954105, 1415954105, 'vi'),
(599, '837', 'c6', 'vi', '83', 'Thạnh Phú', 0, 1, 1415954105, 1415954105, 'vi'),
(600, '838', 'c6', 'vi', '83', 'Mỏ Cày Bắc', 0, 1, 1415954105, 1415954105, 'vi'),
(601, '842', 'c6', 'vi', '84', 'Trà Vinh', 0, 1, 1415954105, 1415954105, 'vi'),
(602, '844', 'c6', 'vi', '84', 'Càng Long', 0, 1, 1415954105, 1415954105, 'vi'),
(603, '845', 'c6', 'vi', '84', 'Cầu Kè', 0, 1, 1415954105, 1415954105, 'vi'),
(604, '846', 'c6', 'vi', '84', 'Tiểu Cần', 0, 1, 1415954105, 1415954105, 'vi'),
(605, '847', 'c6', 'vi', '84', 'Châu Thành', 0, 1, 1415954105, 1415954105, 'vi'),
(606, '848', 'c6', 'vi', '84', 'Cầu Ngang', 0, 1, 1415954105, 1415954105, 'vi'),
(607, '849', 'c6', 'vi', '84', 'Trà Cú', 0, 1, 1415954105, 1415954105, 'vi'),
(608, '850', 'c6', 'vi', '84', 'Duyên Hải', 0, 1, 1415954105, 1415954105, 'vi'),
(609, '855', 'c6', 'vi', '86', 'Vĩnh Long', 0, 1, 1415954105, 1415954105, 'vi'),
(610, '857', 'c6', 'vi', '86', 'Long Hồ', 0, 1, 1415954105, 1415954105, 'vi'),
(611, '858', 'c6', 'vi', '86', 'Mang Thít', 0, 1, 1415954105, 1415954105, 'vi'),
(612, '859', 'c6', 'vi', '86', 'Vũng Liêm', 0, 1, 1415954105, 1415954105, 'vi'),
(613, '860', 'c6', 'vi', '86', 'Tam Bình', 0, 1, 1415954105, 1415954105, 'vi'),
(614, '861', 'c6', 'vi', '86', 'Bình Minh', 0, 1, 1415954105, 1415954105, 'vi'),
(615, '862', 'c6', 'vi', '86', 'Trà Ôn', 0, 1, 1415954105, 1415954105, 'vi'),
(616, '863', 'c6', 'vi', '86', 'Bình Tân', 0, 1, 1415954105, 1415954105, 'vi'),
(617, '866', 'c6', 'vi', '87', 'Cao Lãnh', 0, 1, 1415954105, 1415954105, 'vi'),
(618, '867', 'c6', 'vi', '87', 'Sa Đéc', 0, 1, 1415954105, 1415954105, 'vi'),
(619, '868', 'c6', 'vi', '87', 'Hồng Ngự', 0, 1, 1415954105, 1415954105, 'vi'),
(620, '869', 'c6', 'vi', '87', 'Tân Hồng', 0, 1, 1415954105, 1415954105, 'vi'),
(621, '870', 'c6', 'vi', '87', 'Hồng Ngự', 0, 1, 1415954105, 1415954105, 'vi');
INSERT INTO `location_district` (`id`, `code`, `area_code`, `country_code`, `province_code`, `title`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(622, '871', 'c6', 'vi', '87', 'Tam Nông', 0, 1, 1415954105, 1415954105, 'vi'),
(623, '872', 'c6', 'vi', '87', 'Tháp Mười', 0, 1, 1415954105, 1415954105, 'vi'),
(624, '873', 'c6', 'vi', '87', 'Cao Lãnh', 0, 1, 1415954105, 1415954105, 'vi'),
(625, '874', 'c6', 'vi', '87', 'Thanh Bình', 0, 1, 1415954105, 1415954105, 'vi'),
(626, '875', 'c6', 'vi', '87', 'Lấp Vò', 0, 1, 1415954105, 1415954105, 'vi'),
(627, '876', 'c6', 'vi', '87', 'Lai Vung', 0, 1, 1415954105, 1415954105, 'vi'),
(628, '877', 'c6', 'vi', '87', 'Châu Thành', 0, 1, 1415954105, 1415954105, 'vi'),
(629, '883', 'c6', 'vi', '89', 'Long Xuyên', 0, 1, 1415954105, 1415954105, 'vi'),
(630, '884', 'c6', 'vi', '89', 'Châu Đốc', 0, 1, 1415954105, 1415954105, 'vi'),
(631, '886', 'c6', 'vi', '89', 'An Phú', 0, 1, 1415954105, 1415954105, 'vi'),
(632, '887', 'c6', 'vi', '89', 'Tân Châu', 0, 1, 1415954105, 1415954105, 'vi'),
(633, '888', 'c6', 'vi', '89', 'Phú Tân', 0, 1, 1415954105, 1415954105, 'vi'),
(634, '889', 'c6', 'vi', '89', 'Châu Phú', 0, 1, 1415954106, 1415954106, 'vi'),
(635, '890', 'c6', 'vi', '89', 'Tịnh Biên', 0, 1, 1415954106, 1415954106, 'vi'),
(636, '891', 'c6', 'vi', '89', 'Tri Tôn', 0, 1, 1415954106, 1415954106, 'vi'),
(637, '892', 'c6', 'vi', '89', 'Châu Thành', 0, 1, 1415954106, 1415954106, 'vi'),
(638, '893', 'c6', 'vi', '89', 'Chợ Mới', 0, 1, 1415954106, 1415954106, 'vi'),
(639, '894', 'c6', 'vi', '89', 'Thoại Sơn', 0, 1, 1415954106, 1415954106, 'vi'),
(640, '899', 'c6', 'vi', '91', 'Rạch Giá', 0, 1, 1415954106, 1415954106, 'vi'),
(641, '900', 'c6', 'vi', '91', 'Hà Tiên', 0, 1, 1415954106, 1415954106, 'vi'),
(642, '902', 'c6', 'vi', '91', 'Kiên Lương', 0, 1, 1415954106, 1415954106, 'vi'),
(643, '903', 'c6', 'vi', '91', 'Hòn Đất', 0, 1, 1415954106, 1415954106, 'vi'),
(644, '904', 'c6', 'vi', '91', 'Tân Hiệp', 0, 1, 1415954106, 1415954106, 'vi'),
(645, '905', 'c6', 'vi', '91', 'Châu Thành', 0, 1, 1415954106, 1415954106, 'vi'),
(646, '906', 'c6', 'vi', '91', 'Giồng Giềng', 0, 1, 1415954106, 1415954106, 'vi'),
(647, '907', 'c6', 'vi', '91', 'Gò Quao', 0, 1, 1415954106, 1415954106, 'vi'),
(648, '908', 'c6', 'vi', '91', 'An Biên', 0, 1, 1415954106, 1415954106, 'vi'),
(649, '909', 'c6', 'vi', '91', 'An Minh', 0, 1, 1415954106, 1415954106, 'vi'),
(650, '910', 'c6', 'vi', '91', 'Vĩnh Thuận', 0, 1, 1415954106, 1415954106, 'vi'),
(651, '911', 'c6', 'vi', '91', 'Phú Quốc', 0, 1, 1415954106, 1415954106, 'vi'),
(652, '912', 'c6', 'vi', '91', 'Kiên Hải', 0, 1, 1415954106, 1415954106, 'vi'),
(653, '913', 'c6', 'vi', '91', 'U Minh Thượng', 0, 1, 1415954106, 1415954106, 'vi'),
(654, '914', 'c6', 'vi', '91', 'Giang Thành', 0, 1, 1415954106, 1415954106, 'vi'),
(655, '916', 'c6', 'vi', '92', 'Ninh Kiều', 0, 1, 1415954106, 1415954106, 'vi'),
(656, '917', 'c6', 'vi', '92', 'Ô Môn', 0, 1, 1415954106, 1415954106, 'vi'),
(657, '918', 'c6', 'vi', '92', 'Bình Thuỷ', 0, 1, 1415954106, 1415954106, 'vi'),
(658, '919', 'c6', 'vi', '92', 'Cái Răng', 0, 1, 1415954106, 1415954106, 'vi'),
(659, '923', 'c6', 'vi', '92', 'Thốt Nốt', 0, 1, 1415954106, 1415954106, 'vi'),
(660, '924', 'c6', 'vi', '92', 'Vĩnh Thạnh', 0, 1, 1415954106, 1415954106, 'vi'),
(661, '925', 'c6', 'vi', '92', 'Cờ Đỏ', 0, 1, 1415954106, 1415954106, 'vi'),
(662, '926', 'c6', 'vi', '92', 'Phong Điền', 0, 1, 1415954106, 1415954106, 'vi'),
(663, '927', 'c6', 'vi', '92', 'Thới Lai', 0, 1, 1415954106, 1415954106, 'vi'),
(664, '930', 'c6', 'vi', '93', 'Vị Thanh', 0, 1, 1415954106, 1415954106, 'vi'),
(665, '931', 'c6', 'vi', '93', 'Ngã Bảy', 0, 1, 1415954106, 1415954106, 'vi'),
(666, '932', 'c6', 'vi', '93', 'Châu Thành A', 0, 1, 1415954106, 1415954106, 'vi'),
(667, '933', 'c6', 'vi', '93', 'Châu Thành', 0, 1, 1415954106, 1415954106, 'vi'),
(668, '934', 'c6', 'vi', '93', 'Phụng Hiệp', 0, 1, 1415954106, 1415954106, 'vi'),
(669, '935', 'c6', 'vi', '93', 'Vị Thuỷ', 0, 1, 1415954106, 1415954106, 'vi'),
(670, '936', 'c6', 'vi', '93', 'Long Mỹ', 0, 1, 1415954106, 1415954106, 'vi'),
(671, '941', 'c6', 'vi', '94', 'Sóc Trăng', 0, 1, 1415954106, 1415954106, 'vi'),
(672, '942', 'c6', 'vi', '94', 'Châu Thành', 0, 1, 1415954106, 1415954106, 'vi'),
(673, '943', 'c6', 'vi', '94', 'Kế Sách', 0, 1, 1415954107, 1415954107, 'vi'),
(674, '944', 'c6', 'vi', '94', 'Mỹ Tú', 0, 1, 1415954107, 1415954107, 'vi'),
(675, '945', 'c6', 'vi', '94', 'Cù Lao Dung', 0, 1, 1415954107, 1415954107, 'vi'),
(676, '946', 'c6', 'vi', '94', 'Long Phú', 0, 1, 1415954107, 1415954107, 'vi'),
(677, '947', 'c6', 'vi', '94', 'Mỹ Xuyên', 0, 1, 1415954107, 1415954107, 'vi'),
(678, '948', 'c6', 'vi', '94', 'Ngã Năm', 0, 1, 1415954107, 1415954107, 'vi'),
(679, '949', 'c6', 'vi', '94', 'Thạnh Trị', 0, 1, 1415954107, 1415954107, 'vi'),
(680, '950', 'c6', 'vi', '94', 'Vĩnh Châu', 0, 1, 1415954107, 1415954107, 'vi'),
(681, '951', 'c6', 'vi', '94', 'Trần Đề', 0, 1, 1415954107, 1415954107, 'vi'),
(682, '954', 'c6', 'vi', '95', 'Bạc Liêu', 0, 1, 1415954107, 1415954107, 'vi'),
(683, '956', 'c6', 'vi', '95', 'Hồng Dân', 0, 1, 1415954107, 1415954107, 'vi'),
(684, '957', 'c6', 'vi', '95', 'Phước Long', 0, 1, 1415954107, 1415954107, 'vi'),
(685, '958', 'c6', 'vi', '95', 'Vĩnh Lợi', 0, 1, 1415954107, 1415954107, 'vi'),
(686, '959', 'c6', 'vi', '95', 'Giá Rai', 0, 1, 1415954107, 1415954107, 'vi'),
(687, '960', 'c6', 'vi', '95', 'Đông Hải', 0, 1, 1415954107, 1415954107, 'vi'),
(688, '961', 'c6', 'vi', '95', 'Hoà Bình', 0, 1, 1415954107, 1415954107, 'vi'),
(689, '964', 'c6', 'vi', '96', 'Cà Mau', 0, 1, 1415954107, 1415954107, 'vi'),
(690, '966', 'c6', 'vi', '96', 'U Minh', 0, 1, 1415954107, 1415954107, 'vi'),
(691, '967', 'c6', 'vi', '96', 'Thới Bình', 0, 1, 1415954107, 1415954107, 'vi'),
(692, '968', 'c6', 'vi', '96', 'Trần Văn Thời', 0, 1, 1415954107, 1415954107, 'vi'),
(693, '969', 'c6', 'vi', '96', 'Cái Nước', 0, 1, 1415954107, 1415954107, 'vi'),
(694, '970', 'c6', 'vi', '96', 'Đầm Dơi', 0, 1, 1415954107, 1415954107, 'vi'),
(695, '971', 'c6', 'vi', '96', 'Năm Căn', 0, 1, 1415954107, 1415954107, 'vi'),
(696, '972', 'c6', 'vi', '96', 'Phú Tân', 0, 1, 1415954107, 1415954107, 'vi'),
(697, '973', 'c6', 'vi', '96', 'Ngọc Hiển', 0, 1, 1415954107, 1415954107, 'vi');

-- --------------------------------------------------------

--
-- Table structure for table `location_province`
--

CREATE TABLE IF NOT EXISTS `location_province` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `area_code` varchar(20) NOT NULL,
  `country_code` varchar(20) NOT NULL,
  `title` varchar(250) NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(4) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location_province`
--

INSERT INTO `location_province` (`id`, `code`, `area_code`, `country_code`, `title`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, '01', 'c6', 'vi', 'Hà Nội', 0, 1, 1415953852, 1415953852, 'vi'),
(2, '02', 'c6', 'vi', 'Hà Giang', 0, 1, 1415953852, 1415953852, 'vi'),
(3, '04', 'c6', 'vi', 'Cao Bằng', 0, 1, 1415953852, 1415953852, 'vi'),
(4, '06', 'c6', 'vi', 'Bắc Kạn', 0, 1, 1415953852, 1415953852, 'vi'),
(5, '08', 'c6', 'vi', 'Tuyên Quang', 0, 1, 1415953852, 1415953852, 'vi'),
(6, '10', 'c6', 'vi', 'Lào Cai', 0, 1, 1415953852, 1415953852, 'vi'),
(7, '11', 'c6', 'vi', 'Điện Biên', 0, 1, 1415953852, 1415953852, 'vi'),
(8, '12', 'c6', 'vi', 'Lai Châu', 0, 1, 1415953852, 1415953852, 'vi'),
(9, '14', 'c6', 'vi', 'Sơn La', 0, 1, 1415953852, 1415953852, 'vi'),
(10, '15', 'c6', 'vi', 'Yên Bái', 0, 1, 1415953853, 1415953853, 'vi'),
(11, '17', 'c6', 'vi', 'Hòa Bình', 0, 1, 1415953853, 1415953853, 'vi'),
(12, '19', 'c6', 'vi', 'Thái Nguyên', 0, 1, 1415953853, 1415953853, 'vi'),
(13, '20', 'c6', 'vi', 'Lạng Sơn', 0, 1, 1415953853, 1415953853, 'vi'),
(14, '22', 'c6', 'vi', 'Quảng Ninh', 0, 1, 1415953853, 1415953853, 'vi'),
(15, '24', 'c6', 'vi', 'Bắc Giang', 0, 1, 1415953853, 1415953853, 'vi'),
(16, '25', 'c6', 'vi', 'Phú Thọ', 0, 1, 1415953853, 1415953853, 'vi'),
(17, '26', 'c6', 'vi', 'Vĩnh Phúc', 0, 1, 1415953853, 1415953853, 'vi'),
(18, '27', 'c6', 'vi', 'Bắc Ninh', 0, 1, 1415953853, 1415953853, 'vi'),
(19, '30', 'c6', 'vi', 'Hải Dương', 0, 1, 1415953853, 1415953853, 'vi'),
(20, '31', 'c6', 'vi', 'Hải Phòng', 0, 1, 1415953853, 1415953853, 'vi'),
(21, '33', 'c6', 'vi', 'Hưng Yên', 0, 1, 1415953853, 1415953853, 'vi'),
(22, '34', 'c6', 'vi', 'Thái Bình', 0, 1, 1415953853, 1415953853, 'vi'),
(23, '35', 'c6', 'vi', 'Hà Nam', 0, 1, 1415953853, 1415953853, 'vi'),
(24, '36', 'c6', 'vi', 'Nam Định', 0, 1, 1415953853, 1415953853, 'vi'),
(25, '37', 'c6', 'vi', 'Ninh Bình', 0, 1, 1415953853, 1415953853, 'vi'),
(26, '38', 'c6', 'vi', 'Thanh Hóa', 0, 1, 1415953853, 1415953853, 'vi'),
(27, '40', 'c6', 'vi', 'Nghệ An', 0, 1, 1415953853, 1415953853, 'vi'),
(28, '42', 'c6', 'vi', 'Hà Tĩnh', 0, 1, 1415953853, 1415953853, 'vi'),
(29, '44', 'c6', 'vi', 'Quảng Bình', 0, 1, 1415953853, 1415953853, 'vi'),
(30, '45', 'c6', 'vi', 'Quảng Trị', 0, 1, 1415953853, 1415953853, 'vi'),
(31, '46', 'c6', 'vi', 'Thừa Thiên Huế', 0, 1, 1415953853, 1415953853, 'vi'),
(32, '48', 'c6', 'vi', 'Đà Nẵng', 0, 1, 1415953853, 1415953853, 'vi'),
(33, '49', 'c6', 'vi', 'Quảng Nam', 0, 1, 1415953853, 1415953853, 'vi'),
(34, '51', 'c6', 'vi', 'Quảng Ngãi', 0, 1, 1415953853, 1415953853, 'vi'),
(35, '52', 'c6', 'vi', 'Bình Định', 0, 1, 1415953853, 1415953853, 'vi'),
(36, '54', 'c6', 'vi', 'Phú Yên', 0, 1, 1415953853, 1415953853, 'vi'),
(37, '56', 'c6', 'vi', 'Khánh Hòa', 0, 1, 1415953853, 1415953853, 'vi'),
(38, '58', 'c6', 'vi', 'Ninh Thuận', 0, 1, 1415953853, 1415953853, 'vi'),
(39, '60', 'c6', 'vi', 'Bình Thuận', 0, 1, 1415953853, 1415953853, 'vi'),
(40, '62', 'c6', 'vi', 'Kon Tum', 0, 1, 1415953853, 1415953853, 'vi'),
(41, '64', 'c6', 'vi', 'Gia Lai', 0, 1, 1415953853, 1415953853, 'vi'),
(42, '66', 'c6', 'vi', 'Đắk Lắk', 0, 1, 1415953853, 1415953853, 'vi'),
(43, '67', 'c6', 'vi', 'Đắk Nông', 0, 1, 1415953853, 1415953853, 'vi'),
(44, '68', 'c6', 'vi', 'Lâm Đồng', 0, 1, 1415953853, 1415953853, 'vi'),
(45, '70', 'c6', 'vi', 'Bình Phước', 0, 1, 1415953854, 1415953854, 'vi'),
(46, '72', 'c6', 'vi', 'Tây Ninh', 0, 1, 1415953854, 1415953854, 'vi'),
(47, '74', 'c6', 'vi', 'Bình Dương', 0, 1, 1415953854, 1415953854, 'vi'),
(48, '75', 'c6', 'vi', 'Đồng Nai', 0, 1, 1415953854, 1415953854, 'vi'),
(49, '77', 'c6', 'vi', 'Bà Rịa - Vũng Tàu', 0, 1, 1415953854, 1415953854, 'vi'),
(50, '79', 'c6', 'vi', 'Hồ Chí Minh', 0, 1, 1415953854, 1415953854, 'vi'),
(51, '80', 'c6', 'vi', 'Long An', 0, 1, 1415953854, 1415953854, 'vi'),
(52, '82', 'c6', 'vi', 'Tiền Giang', 0, 1, 1415953854, 1415953854, 'vi'),
(53, '83', 'c6', 'vi', 'Bến Tre', 0, 1, 1415953854, 1415953854, 'vi'),
(54, '84', 'c6', 'vi', 'Trà Vinh', 0, 1, 1415953854, 1415953854, 'vi'),
(55, '86', 'c6', 'vi', 'Vĩnh Long', 0, 1, 1415953854, 1415953854, 'vi'),
(56, '87', 'c6', 'vi', 'Đồng Tháp', 0, 1, 1415953854, 1415953854, 'vi'),
(57, '89', 'c6', 'vi', 'An Giang', 0, 1, 1415953854, 1415953854, 'vi'),
(58, '91', 'c6', 'vi', 'Kiên Giang', 0, 1, 1415953854, 1415953854, 'vi'),
(59, '92', 'c6', 'vi', 'Cần Thơ', 0, 1, 1415953854, 1415953854, 'vi'),
(60, '93', 'c6', 'vi', 'Hậu Giang', 0, 1, 1415953854, 1415953854, 'vi'),
(61, '94', 'c6', 'vi', 'Sóc Trăng', 0, 1, 1415953854, 1415953854, 'vi'),
(62, '95', 'c6', 'vi', 'Bạc Liêu', 0, 1, 1415953854, 1415953854, 'vi'),
(63, '96', 'c6', 'vi', 'Cà Mau', 0, 1, 1415953854, 1415953854, 'vi');

-- --------------------------------------------------------

--
-- Table structure for table `location_ward`
--

CREATE TABLE IF NOT EXISTS `location_ward` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `area_code` varchar(20) NOT NULL,
  `country_code` varchar(20) NOT NULL,
  `province_code` varchar(20) NOT NULL,
  `district_code` varchar(20) NOT NULL,
  `title` varchar(250) NOT NULL,
  `is_extramural` tinyint(4) NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(4) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location_ward`
--

INSERT INTO `location_ward` (`id`, `code`, `area_code`, `country_code`, `province_code`, `district_code`, `title`, `is_extramural`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, '00001', 'c6', 'vi', '01', '001', 'Phúc Xá', 0, 0, 1, 1415954327, 1415954327, 'vi'),
(2, '00004', 'c6', 'vi', '01', '001', 'Trúc Bạch', 0, 0, 1, 1415954327, 1415954327, 'vi'),
(3, '00006', 'c6', 'vi', '01', '001', 'Vĩnh Phúc', 0, 0, 1, 1415954327, 1415954327, 'vi'),
(4, '00007', 'c6', 'vi', '01', '001', 'Cống Vị', 0, 0, 1, 1415954327, 1415954327, 'vi'),
(5, '00008', 'c6', 'vi', '01', '001', 'Liễu Giai', 0, 0, 1, 1415954327, 1415954327, 'vi'),
(6, '00010', 'c6', 'vi', '01', '001', 'Nguyễn Trung Trực', 0, 0, 1, 1415954327, 1415954327, 'vi'),
(7, '00013', 'c6', 'vi', '01', '001', 'Quán Thánh', 0, 0, 1, 1415954327, 1415954327, 'vi'),
(8, '00016', 'c6', 'vi', '01', '001', 'Ngọc Hà', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(9, '00019', 'c6', 'vi', '01', '001', 'Điện Biên', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(10, '00022', 'c6', 'vi', '01', '001', 'Đội Cấn', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(11, '00025', 'c6', 'vi', '01', '001', 'Ngọc Khánh', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(12, '00028', 'c6', 'vi', '01', '001', 'Kim Mã', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(13, '00031', 'c6', 'vi', '01', '001', 'Giảng Võ', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(14, '00034', 'c6', 'vi', '01', '001', 'Thành Công', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(15, '00037', 'c6', 'vi', '01', '002', 'Phúc Tân', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(16, '00040', 'c6', 'vi', '01', '002', 'Đồng Xuân', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(17, '00043', 'c6', 'vi', '01', '002', 'Hàng Mã', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(18, '00046', 'c6', 'vi', '01', '002', 'Hàng Buồm', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(19, '00049', 'c6', 'vi', '01', '002', 'Hàng Đào', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(20, '00052', 'c6', 'vi', '01', '002', 'Hàng Bồ', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(21, '00055', 'c6', 'vi', '01', '002', 'Cửa Đông', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(22, '00058', 'c6', 'vi', '01', '002', 'Lý Thái Tổ', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(23, '00061', 'c6', 'vi', '01', '002', 'Hàng Bạc', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(24, '00064', 'c6', 'vi', '01', '002', 'Hàng Gai', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(25, '00067', 'c6', 'vi', '01', '002', 'Chương Dương Độ', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(26, '00070', 'c6', 'vi', '01', '002', 'Hàng Trống', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(27, '00073', 'c6', 'vi', '01', '002', 'Cửa Nam', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(28, '00076', 'c6', 'vi', '01', '002', 'Hàng Bông', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(29, '00079', 'c6', 'vi', '01', '002', 'Tràng Tiền', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(30, '00082', 'c6', 'vi', '01', '002', 'Trần Hưng Đạo', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(31, '00085', 'c6', 'vi', '01', '002', 'Phan Chu Trinh', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(32, '00088', 'c6', 'vi', '01', '002', 'Hàng Bài', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(33, '00091', 'c6', 'vi', '01', '003', 'Phú Thượng', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(34, '00094', 'c6', 'vi', '01', '003', 'Nhật Tân', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(35, '00097', 'c6', 'vi', '01', '003', 'Tứ Liên', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(36, '00100', 'c6', 'vi', '01', '003', 'Quảng An', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(37, '00103', 'c6', 'vi', '01', '003', 'Xuân La', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(38, '00106', 'c6', 'vi', '01', '003', 'Yên Phụ', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(39, '00109', 'c6', 'vi', '01', '003', 'Bưởi', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(40, '00112', 'c6', 'vi', '01', '003', 'Thuỵ Khuê', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(41, '00115', 'c6', 'vi', '01', '004', 'Thượng Thanh', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(42, '00118', 'c6', 'vi', '01', '004', 'Ngọc Thuỵ', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(43, '00121', 'c6', 'vi', '01', '004', 'Giang Biên', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(44, '00124', 'c6', 'vi', '01', '004', 'Đức Giang', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(45, '00127', 'c6', 'vi', '01', '004', 'Việt Hưng', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(46, '00130', 'c6', 'vi', '01', '004', 'Gia Thuỵ', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(47, '00133', 'c6', 'vi', '01', '004', 'Ngọc Lâm', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(48, '00136', 'c6', 'vi', '01', '004', 'Phúc Lợi', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(49, '00139', 'c6', 'vi', '01', '004', 'Bồ Đề', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(50, '00142', 'c6', 'vi', '01', '004', 'Sài Đồng', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(51, '00145', 'c6', 'vi', '01', '004', 'Long Biên', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(52, '00148', 'c6', 'vi', '01', '004', 'Thạch Bàn', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(53, '00151', 'c6', 'vi', '01', '004', 'Phúc Đồng', 0, 0, 1, 1415954328, 1415954328, 'vi'),
(54, '00154', 'c6', 'vi', '01', '004', 'Cự Khối', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(55, '00157', 'c6', 'vi', '01', '005', 'Nghĩa Đô', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(56, '00160', 'c6', 'vi', '01', '005', 'Nghĩa Tân', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(57, '00163', 'c6', 'vi', '01', '005', 'Mai Dịch', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(58, '00166', 'c6', 'vi', '01', '005', 'Dịch Vọng', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(59, '00167', 'c6', 'vi', '01', '005', 'Dịch Vọng Hậu', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(60, '00169', 'c6', 'vi', '01', '005', 'Quan Hoa', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(61, '00172', 'c6', 'vi', '01', '005', 'Yên Hoà', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(62, '00175', 'c6', 'vi', '01', '005', 'Trung Hoà', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(63, '00178', 'c6', 'vi', '01', '006', 'Cát Linh', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(64, '00181', 'c6', 'vi', '01', '006', 'Văn Miếu', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(65, '00184', 'c6', 'vi', '01', '006', 'Quốc Tử Giám', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(66, '00187', 'c6', 'vi', '01', '006', 'Láng Thượng', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(67, '00190', 'c6', 'vi', '01', '006', 'Ô Chợ Dừa', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(68, '00193', 'c6', 'vi', '01', '006', 'Văn Chương', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(69, '00196', 'c6', 'vi', '01', '006', 'Hàng Bột', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(70, '00199', 'c6', 'vi', '01', '006', 'Láng Hạ', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(71, '00202', 'c6', 'vi', '01', '006', 'Khâm Thiên', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(72, '00205', 'c6', 'vi', '01', '006', 'Thổ Quan', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(73, '00208', 'c6', 'vi', '01', '006', 'Nam Đồng', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(74, '00211', 'c6', 'vi', '01', '006', 'Trung Phụng', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(75, '00214', 'c6', 'vi', '01', '006', 'Quang Trung', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(76, '00217', 'c6', 'vi', '01', '006', 'Trung Liệt', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(77, '00220', 'c6', 'vi', '01', '006', 'Phương Liên', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(78, '00223', 'c6', 'vi', '01', '006', 'Thịnh Quang', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(79, '00226', 'c6', 'vi', '01', '006', 'Trung Tự', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(80, '00229', 'c6', 'vi', '01', '006', 'Kim Liên', 0, 0, 1, 1415954329, 1415954329, 'vi'),
(81, '00232', 'c6', 'vi', '01', '006', 'Phương Mai', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(82, '00235', 'c6', 'vi', '01', '006', 'Ngã Tư Sở', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(83, '00238', 'c6', 'vi', '01', '006', 'Khương Thượng', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(84, '00241', 'c6', 'vi', '01', '007', 'Nguyễn Du', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(85, '00244', 'c6', 'vi', '01', '007', 'Bạch Đằng', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(86, '00247', 'c6', 'vi', '01', '007', 'Phạm Đình Hổ', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(87, '00250', 'c6', 'vi', '01', '007', 'Bùi Thị Xuân', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(88, '00253', 'c6', 'vi', '01', '007', 'Ngô Thì Nhậm', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(89, '00256', 'c6', 'vi', '01', '007', 'Lê Đại Hành', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(90, '00259', 'c6', 'vi', '01', '007', 'Đồng Nhân', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(91, '00262', 'c6', 'vi', '01', '007', 'Phố Huế', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(92, '00265', 'c6', 'vi', '01', '007', 'Đống Mác', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(93, '00268', 'c6', 'vi', '01', '007', 'Thanh Lương', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(94, '00271', 'c6', 'vi', '01', '007', 'Thanh Nhàn', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(95, '00274', 'c6', 'vi', '01', '007', 'Cầu Dền', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(96, '00277', 'c6', 'vi', '01', '007', 'Bách Khoa', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(97, '00280', 'c6', 'vi', '01', '007', 'Đồng Tâm', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(98, '00283', 'c6', 'vi', '01', '007', 'Vĩnh Tuy', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(99, '00286', 'c6', 'vi', '01', '007', 'Bạch Mai', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(100, '00289', 'c6', 'vi', '01', '007', 'Quỳnh Mai', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(101, '00292', 'c6', 'vi', '01', '007', 'Quỳnh Lôi', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(102, '00295', 'c6', 'vi', '01', '007', 'Minh Khai', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(103, '00298', 'c6', 'vi', '01', '007', 'Trương Định', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(104, '00301', 'c6', 'vi', '01', '008', 'Thanh Trì', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(105, '00304', 'c6', 'vi', '01', '008', 'Vĩnh Hưng', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(106, '00307', 'c6', 'vi', '01', '008', 'Định Công', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(107, '00310', 'c6', 'vi', '01', '008', 'Mai Động', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(108, '00313', 'c6', 'vi', '01', '008', 'Tương Mai', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(109, '00316', 'c6', 'vi', '01', '008', 'Đại Kim', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(110, '00319', 'c6', 'vi', '01', '008', 'Tân Mai', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(111, '00322', 'c6', 'vi', '01', '008', 'Hoàng Văn Thụ', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(112, '00325', 'c6', 'vi', '01', '008', 'Giáp Bát', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(113, '00328', 'c6', 'vi', '01', '008', 'Lĩnh Nam', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(114, '00331', 'c6', 'vi', '01', '008', 'Thịnh Liệt', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(115, '00334', 'c6', 'vi', '01', '008', 'Trần Phú', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(116, '00337', 'c6', 'vi', '01', '008', 'Hoàng Liệt', 0, 0, 1, 1415954330, 1415954330, 'vi'),
(117, '00340', 'c6', 'vi', '01', '008', 'Yên Sở', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(118, '00343', 'c6', 'vi', '01', '009', 'Nhân Chính', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(119, '00346', 'c6', 'vi', '01', '009', 'Thượng Đình', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(120, '00349', 'c6', 'vi', '01', '009', 'Khương Trung', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(121, '00352', 'c6', 'vi', '01', '009', 'Khương Mai', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(122, '00355', 'c6', 'vi', '01', '009', 'Thanh Xuân Trung', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(123, '00358', 'c6', 'vi', '01', '009', 'Phương Liệt', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(124, '00361', 'c6', 'vi', '01', '009', 'Hạ Đình', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(125, '00364', 'c6', 'vi', '01', '009', 'Khương Đình', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(126, '00367', 'c6', 'vi', '01', '009', 'Thanh Xuân Bắc', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(127, '00370', 'c6', 'vi', '01', '009', 'Thanh Xuân Nam', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(128, '00373', 'c6', 'vi', '01', '009', 'Kim Giang', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(129, '00376', 'c6', 'vi', '01', '016', 'Sóc Sơn', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(130, '00379', 'c6', 'vi', '01', '016', 'Bắc Sơn', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(131, '00382', 'c6', 'vi', '01', '016', 'Minh Trí', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(132, '00385', 'c6', 'vi', '01', '016', 'Hồng Kỳ', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(133, '00388', 'c6', 'vi', '01', '016', 'Nam Sơn', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(134, '00391', 'c6', 'vi', '01', '016', 'Trung Giã', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(135, '00394', 'c6', 'vi', '01', '016', 'Tân Hưng', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(136, '00397', 'c6', 'vi', '01', '016', 'Minh Phú', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(137, '00400', 'c6', 'vi', '01', '016', 'Phù Linh', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(138, '00403', 'c6', 'vi', '01', '016', 'Bắc Phú', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(139, '00406', 'c6', 'vi', '01', '016', 'Tân Minh', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(140, '00409', 'c6', 'vi', '01', '016', 'Quang Tiến', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(141, '00412', 'c6', 'vi', '01', '016', 'Hiền Ninh', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(142, '00415', 'c6', 'vi', '01', '016', 'Tân Dân', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(143, '00418', 'c6', 'vi', '01', '016', 'Tiên Dược', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(144, '00421', 'c6', 'vi', '01', '016', 'Việt Long', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(145, '00424', 'c6', 'vi', '01', '016', 'Xuân Giang', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(146, '00427', 'c6', 'vi', '01', '016', 'Mai Đình', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(147, '00430', 'c6', 'vi', '01', '016', 'Đức Hoà', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(148, '00433', 'c6', 'vi', '01', '016', 'Thanh Xuân', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(149, '00436', 'c6', 'vi', '01', '016', 'Đông Xuân', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(150, '00439', 'c6', 'vi', '01', '016', 'Kim Lũ', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(151, '00442', 'c6', 'vi', '01', '016', 'Phú Cường', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(152, '00445', 'c6', 'vi', '01', '016', 'Phú Minh', 0, 0, 1, 1415954331, 1415954331, 'vi'),
(153, '00448', 'c6', 'vi', '01', '016', 'Phù Lỗ', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(154, '00451', 'c6', 'vi', '01', '016', 'Xuân Thu', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(155, '00454', 'c6', 'vi', '01', '017', 'Đông Anh', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(156, '00457', 'c6', 'vi', '01', '017', 'Xuân Nộn', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(157, '00460', 'c6', 'vi', '01', '017', 'Thuỵ Lâm', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(158, '00463', 'c6', 'vi', '01', '017', 'Bắc Hồng', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(159, '00466', 'c6', 'vi', '01', '017', 'Nguyên Khê', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(160, '00469', 'c6', 'vi', '01', '017', 'Nam Hồng', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(161, '00472', 'c6', 'vi', '01', '017', 'Tiên Dương', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(162, '00475', 'c6', 'vi', '01', '017', 'Vân Hà', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(163, '00478', 'c6', 'vi', '01', '017', 'Uy Nỗ', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(164, '00481', 'c6', 'vi', '01', '017', 'Vân Nội', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(165, '00484', 'c6', 'vi', '01', '017', 'Liên Hà', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(166, '00487', 'c6', 'vi', '01', '017', 'Việt Hùng', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(167, '00490', 'c6', 'vi', '01', '017', 'Kim Nỗ', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(168, '00493', 'c6', 'vi', '01', '017', 'Kim Chung', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(169, '00496', 'c6', 'vi', '01', '017', 'Dục Tú', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(170, '00499', 'c6', 'vi', '01', '017', 'Đại Mạch', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(171, '00502', 'c6', 'vi', '01', '017', 'Vĩnh Ngọc', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(172, '00505', 'c6', 'vi', '01', '017', 'Cổ Loa', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(173, '00508', 'c6', 'vi', '01', '017', 'Hải Bối', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(174, '00511', 'c6', 'vi', '01', '017', 'Xuân Canh', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(175, '00514', 'c6', 'vi', '01', '017', 'Võng La', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(176, '00517', 'c6', 'vi', '01', '017', 'Tầm Xá', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(177, '00520', 'c6', 'vi', '01', '017', 'Mai Lâm', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(178, '00523', 'c6', 'vi', '01', '017', 'Đông Hội', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(179, '00526', 'c6', 'vi', '01', '018', 'Yên Viên', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(180, '00529', 'c6', 'vi', '01', '018', 'Yên Thường', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(181, '00532', 'c6', 'vi', '01', '018', 'Yên Viên', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(182, '00535', 'c6', 'vi', '01', '018', 'Ninh Hiệp', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(183, '00538', 'c6', 'vi', '01', '018', 'Đình Xuyên', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(184, '00541', 'c6', 'vi', '01', '018', 'Dương Hà', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(185, '00544', 'c6', 'vi', '01', '018', 'Phù Đổng', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(186, '00547', 'c6', 'vi', '01', '018', 'Trung Mầu', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(187, '00550', 'c6', 'vi', '01', '018', 'Lệ Chi', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(188, '00553', 'c6', 'vi', '01', '018', 'Cổ Bi', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(189, '00556', 'c6', 'vi', '01', '018', 'Đặng Xá', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(190, '00559', 'c6', 'vi', '01', '018', 'Phú Thị', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(191, '00562', 'c6', 'vi', '01', '018', 'Kim Sơn', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(192, '00565', 'c6', 'vi', '01', '018', 'Trâu Quỳ', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(193, '00568', 'c6', 'vi', '01', '018', 'Dương Quang', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(194, '00571', 'c6', 'vi', '01', '018', 'Dương Xá', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(195, '00574', 'c6', 'vi', '01', '018', 'Đông Dư', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(196, '00577', 'c6', 'vi', '01', '018', 'Đa Tốn', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(197, '00580', 'c6', 'vi', '01', '018', 'Kiêu Kỵ', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(198, '00583', 'c6', 'vi', '01', '018', 'Bát Tràng', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(199, '00586', 'c6', 'vi', '01', '018', 'Kim Lan', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(200, '00589', 'c6', 'vi', '01', '018', 'Văn Đức', 0, 0, 1, 1415954332, 1415954332, 'vi'),
(201, '00592', 'c6', 'vi', '01', '019', 'Cầu Diễn', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(202, '00595', 'c6', 'vi', '01', '019', 'Thượng Cát', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(203, '00598', 'c6', 'vi', '01', '019', 'Liên Mạc', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(204, '00601', 'c6', 'vi', '01', '019', 'Đông Ngạc', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(205, '00604', 'c6', 'vi', '01', '019', 'Thuỵ Phương', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(206, '00607', 'c6', 'vi', '01', '019', 'Tây Tựu', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(207, '00610', 'c6', 'vi', '01', '019', 'Xuân Đỉnh', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(208, '00613', 'c6', 'vi', '01', '019', 'Minh Khai', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(209, '00616', 'c6', 'vi', '01', '019', 'Cổ Nhuế', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(210, '00619', 'c6', 'vi', '01', '019', 'Phú Diễn', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(211, '00622', 'c6', 'vi', '01', '019', 'Xuân Phương', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(212, '00625', 'c6', 'vi', '01', '019', 'Mỹ Đình', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(213, '00628', 'c6', 'vi', '01', '019', 'Tây Mỗ', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(214, '00631', 'c6', 'vi', '01', '019', 'Mễ Trì', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(215, '00634', 'c6', 'vi', '01', '019', 'Đại Mỗ', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(216, '00637', 'c6', 'vi', '01', '019', 'Trung Văn', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(217, '00640', 'c6', 'vi', '01', '020', 'Văn Điển', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(218, '00643', 'c6', 'vi', '01', '020', 'Tân Triều', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(219, '00646', 'c6', 'vi', '01', '020', 'Thanh Liệt', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(220, '00649', 'c6', 'vi', '01', '020', 'Tả Thanh Oai', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(221, '00652', 'c6', 'vi', '01', '020', 'Hữu Hoà', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(222, '00655', 'c6', 'vi', '01', '020', 'Tam Hiệp', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(223, '00658', 'c6', 'vi', '01', '020', 'Tứ Hiệp', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(224, '00661', 'c6', 'vi', '01', '020', 'Yên Mỹ', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(225, '00664', 'c6', 'vi', '01', '020', 'Vĩnh Quỳnh', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(226, '00667', 'c6', 'vi', '01', '020', 'Ngũ Hiệp', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(227, '00670', 'c6', 'vi', '01', '020', 'Duyên Hà', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(228, '00673', 'c6', 'vi', '01', '020', 'Ngọc Hồi', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(229, '00676', 'c6', 'vi', '01', '020', 'Vạn Phúc', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(230, '00679', 'c6', 'vi', '01', '020', 'Đại Áng', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(231, '00682', 'c6', 'vi', '01', '020', 'Liên Ninh', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(232, '00685', 'c6', 'vi', '01', '020', 'Đông Mỹ', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(233, '00688', 'c6', 'vi', '02', '024', 'Quang Trung', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(234, '00691', 'c6', 'vi', '02', '024', 'Trần Phú', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(235, '00692', 'c6', 'vi', '02', '024', 'Ngọc Hà', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(236, '00694', 'c6', 'vi', '02', '024', 'Nguyễn Trãi', 0, 0, 1, 1415954333, 1415954333, 'vi'),
(237, '00697', 'c6', 'vi', '02', '024', 'Minh Khai', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(238, '00700', 'c6', 'vi', '02', '024', 'Ngọc Đường', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(239, '00703', 'c6', 'vi', '02', '030', 'Kim Thạch', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(240, '00706', 'c6', 'vi', '02', '030', 'Phú Linh', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(241, '00709', 'c6', 'vi', '02', '030', 'Kim Linh', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(242, '00712', 'c6', 'vi', '02', '026', 'Phó Bảng', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(243, '00715', 'c6', 'vi', '02', '026', 'Lũng Cú', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(244, '00718', 'c6', 'vi', '02', '026', 'Má Lé', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(245, '00721', 'c6', 'vi', '02', '026', 'Đồng Văn', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(246, '00724', 'c6', 'vi', '02', '026', 'Lũng Táo', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(247, '00727', 'c6', 'vi', '02', '026', 'Phố Là', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(248, '00730', 'c6', 'vi', '02', '026', 'Thài Phìn Tủng', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(249, '00733', 'c6', 'vi', '02', '026', 'Sủng Là', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(250, '00736', 'c6', 'vi', '02', '026', 'Xà Phìn', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(251, '00739', 'c6', 'vi', '02', '026', 'Tả Phìn', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(252, '00742', 'c6', 'vi', '02', '026', 'Tả Lủng', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(253, '00745', 'c6', 'vi', '02', '026', 'Phố Cáo', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(254, '00748', 'c6', 'vi', '02', '026', 'Sính Lủng', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(255, '00751', 'c6', 'vi', '02', '026', 'Sảng Tủng', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(256, '00754', 'c6', 'vi', '02', '026', 'Lũng Thầu', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(257, '00757', 'c6', 'vi', '02', '026', 'Hố Quáng Phìn', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(258, '00760', 'c6', 'vi', '02', '026', 'Vần Chải', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(259, '00763', 'c6', 'vi', '02', '026', 'Lũng Phìn', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(260, '00766', 'c6', 'vi', '02', '026', 'Sủng Trái', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(261, '00769', 'c6', 'vi', '02', '027', 'Mèo Vạc', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(262, '00772', 'c6', 'vi', '02', '027', 'Thượng Phùng', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(263, '00775', 'c6', 'vi', '02', '027', 'Pải Lủng', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(264, '00778', 'c6', 'vi', '02', '027', 'Xín Cái', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(265, '00781', 'c6', 'vi', '02', '027', 'Pả Vi', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(266, '00784', 'c6', 'vi', '02', '027', 'Giàng Chu Phìn', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(267, '00787', 'c6', 'vi', '02', '027', 'Sủng Trà', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(268, '00790', 'c6', 'vi', '02', '027', 'Sủng Máng', 0, 0, 1, 1415954334, 1415954334, 'vi'),
(269, '00793', 'c6', 'vi', '02', '027', 'Sơn Vĩ', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(270, '00796', 'c6', 'vi', '02', '027', 'Tả Lủng', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(271, '00799', 'c6', 'vi', '02', '027', 'Cán Chu Phìn', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(272, '00802', 'c6', 'vi', '02', '027', 'Lũng Pù', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(273, '00805', 'c6', 'vi', '02', '027', 'Lũng Chinh', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(274, '00808', 'c6', 'vi', '02', '027', 'Tát Ngà', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(275, '00811', 'c6', 'vi', '02', '027', 'Nậm Ban', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(276, '00814', 'c6', 'vi', '02', '027', 'Khâu Vai', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(277, '00815', 'c6', 'vi', '02', '027', 'Niêm Tòng', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(278, '00817', 'c6', 'vi', '02', '027', 'Niêm Sơn', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(279, '00820', 'c6', 'vi', '02', '028', 'Yên Minh', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(280, '00823', 'c6', 'vi', '02', '028', 'Thắng Mố', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(281, '00826', 'c6', 'vi', '02', '028', 'Phú Lũng', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(282, '00829', 'c6', 'vi', '02', '028', 'Sủng Tráng', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(283, '00832', 'c6', 'vi', '02', '028', 'Bạch Đích', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(284, '00835', 'c6', 'vi', '02', '028', 'Na Khê', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(285, '00838', 'c6', 'vi', '02', '028', 'Sủng Thài', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(286, '00841', 'c6', 'vi', '02', '028', 'Hữu Vinh', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(287, '00844', 'c6', 'vi', '02', '028', 'Lao Và Chải', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(288, '00847', 'c6', 'vi', '02', '028', 'Mậu Duệ', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(289, '00850', 'c6', 'vi', '02', '028', 'Đông Minh', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(290, '00853', 'c6', 'vi', '02', '028', 'Mậu Long', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(291, '00856', 'c6', 'vi', '02', '028', 'Ngam La', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(292, '00859', 'c6', 'vi', '02', '028', 'Ngọc Long', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(293, '00862', 'c6', 'vi', '02', '028', 'Đường Thượng', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(294, '00865', 'c6', 'vi', '02', '028', 'Lũng Hồ', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(295, '00868', 'c6', 'vi', '02', '028', 'Du Tiến', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(296, '00871', 'c6', 'vi', '02', '028', 'Du Già', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(297, '00874', 'c6', 'vi', '02', '029', 'Tam Sơn', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(298, '00877', 'c6', 'vi', '02', '029', 'Bát Đại Sơn', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(299, '00880', 'c6', 'vi', '02', '029', 'Nghĩa Thuận', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(300, '00883', 'c6', 'vi', '02', '029', 'Cán Tỷ', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(301, '00886', 'c6', 'vi', '02', '029', 'Cao Mã Pờ', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(302, '00889', 'c6', 'vi', '02', '029', 'Thanh Vân', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(303, '00892', 'c6', 'vi', '02', '029', 'Tùng Vài', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(304, '00895', 'c6', 'vi', '02', '029', 'Đông Hà', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(305, '00898', 'c6', 'vi', '02', '029', 'Quản Bạ', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(306, '00901', 'c6', 'vi', '02', '029', 'Lùng Tám', 0, 0, 1, 1415954335, 1415954335, 'vi'),
(307, '00904', 'c6', 'vi', '02', '029', 'Quyết Tiến', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(308, '00907', 'c6', 'vi', '02', '029', 'Tả Ván', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(309, '00910', 'c6', 'vi', '02', '029', 'Thái An', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(310, '00913', 'c6', 'vi', '02', '030', 'Vị Xuyên', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(311, '00916', 'c6', 'vi', '02', '030', 'Nông Trường Việt Lâm', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(312, '00919', 'c6', 'vi', '02', '030', 'Minh Tân', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(313, '00922', 'c6', 'vi', '02', '030', 'Thuận Hoà', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(314, '00925', 'c6', 'vi', '02', '030', 'Tùng Bá', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(315, '00928', 'c6', 'vi', '02', '030', 'Thanh Thủy', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(316, '00931', 'c6', 'vi', '02', '030', 'Thanh Đức', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(317, '00934', 'c6', 'vi', '02', '030', 'Phong Quang', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(318, '00937', 'c6', 'vi', '02', '030', 'Xín Chải', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(319, '00940', 'c6', 'vi', '02', '030', 'Phương Tiến', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(320, '00943', 'c6', 'vi', '02', '030', 'Lao Chải', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(321, '00946', 'c6', 'vi', '02', '024', 'Phương Độ', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(322, '00949', 'c6', 'vi', '02', '024', 'Phương Thiện', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(323, '00952', 'c6', 'vi', '02', '030', 'Cao Bồ', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(324, '00955', 'c6', 'vi', '02', '030', 'Đạo Đức', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(325, '00958', 'c6', 'vi', '02', '030', 'Thượng Sơn', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(326, '00961', 'c6', 'vi', '02', '030', 'Linh Hồ', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(327, '00964', 'c6', 'vi', '02', '030', 'Quảng Ngần', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(328, '00967', 'c6', 'vi', '02', '030', 'Việt Lâm', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(329, '00970', 'c6', 'vi', '02', '030', 'Ngọc Linh', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(330, '00973', 'c6', 'vi', '02', '030', 'Ngọc Minh', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(331, '00976', 'c6', 'vi', '02', '030', 'Bạch Ngọc', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(332, '00979', 'c6', 'vi', '02', '030', 'Trung Thành', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(333, '00982', 'c6', 'vi', '02', '031', 'Minh Sơn', 0, 0, 1, 1415954336, 1415954336, 'vi'),
(334, '00985', 'c6', 'vi', '02', '031', 'Giáp Trung', 0, 0, 1, 1415954337, 1415954337, 'vi'),
(335, '00988', 'c6', 'vi', '02', '031', 'Yên Định', 0, 0, 1, 1415954337, 1415954337, 'vi'),
(336, '00991', 'c6', 'vi', '02', '031', 'Yên Phú', 0, 0, 1, 1415954337, 1415954337, 'vi'),
(337, '00994', 'c6', 'vi', '02', '031', 'Minh Ngọc', 0, 0, 1, 1415954337, 1415954337, 'vi'),
(338, '00997', 'c6', 'vi', '02', '031', 'Yên Phong', 0, 0, 1, 1415954337, 1415954337, 'vi'),
(339, '01000', 'c6', 'vi', '02', '031', 'Lạc Nông', 0, 0, 1, 1415954337, 1415954337, 'vi'),
(340, '01003', 'c6', 'vi', '02', '031', 'Phú Nam', 0, 0, 1, 1415954337, 1415954337, 'vi'),
(341, '01006', 'c6', 'vi', '02', '031', 'Yên Cường', 0, 0, 1, 1415954337, 1415954337, 'vi'),
(342, '01009', 'c6', 'vi', '02', '031', 'Thượng Tân', 0, 0, 1, 1415954337, 1415954337, 'vi'),
(343, '01012', 'c6', 'vi', '02', '031', 'Đường Âm', 0, 0, 1, 1415954337, 1415954337, 'vi'),
(344, '01015', 'c6', 'vi', '02', '031', 'Đường Hồng', 0, 0, 1, 1415954337, 1415954337, 'vi'),
(345, '01018', 'c6', 'vi', '02', '031', 'Phiêng Luông', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(346, '01021', 'c6', 'vi', '02', '032', 'Vinh Quang', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(347, '01024', 'c6', 'vi', '02', '032', 'Bản Máy', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(348, '01027', 'c6', 'vi', '02', '032', 'Thàng Tín', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(349, '01030', 'c6', 'vi', '02', '032', 'Thèn Chu Phìn', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(350, '01033', 'c6', 'vi', '02', '032', 'Pố Lồ', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(351, '01036', 'c6', 'vi', '02', '032', 'Bản Phùng', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(352, '01039', 'c6', 'vi', '02', '032', 'Túng Sán', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(353, '01042', 'c6', 'vi', '02', '032', 'Chiến Phố', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(354, '01045', 'c6', 'vi', '02', '032', 'Đản Ván', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(355, '01048', 'c6', 'vi', '02', '032', 'Tụ Nhân', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(356, '01051', 'c6', 'vi', '02', '032', 'Tân Tiến', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(357, '01054', 'c6', 'vi', '02', '032', 'Nàng Đôn', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(358, '01057', 'c6', 'vi', '02', '032', 'Pờ Ly Ngài', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(359, '01060', 'c6', 'vi', '02', '032', 'Sán Xả Hồ', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(360, '01063', 'c6', 'vi', '02', '032', 'Bản Luốc', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(361, '01066', 'c6', 'vi', '02', '032', 'Ngàm Đăng Vài', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(362, '01069', 'c6', 'vi', '02', '032', 'Bản Nhùng', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(363, '01072', 'c6', 'vi', '02', '032', 'Tả Sử Choóng', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(364, '01075', 'c6', 'vi', '02', '032', 'Nậm Dịch', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(365, '01078', 'c6', 'vi', '02', '032', 'Bản Péo', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(366, '01081', 'c6', 'vi', '02', '032', 'Hồ Thầu', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(367, '01084', 'c6', 'vi', '02', '032', 'Nam Sơn', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(368, '01087', 'c6', 'vi', '02', '032', 'Nậm Tỵ', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(369, '01090', 'c6', 'vi', '02', '032', 'Thông Nguyên', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(370, '01093', 'c6', 'vi', '02', '032', 'Nậm Khòa', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(371, '01096', 'c6', 'vi', '02', '033', 'Cốc Pài', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(372, '01099', 'c6', 'vi', '02', '033', 'Nàn Xỉn', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(373, '01102', 'c6', 'vi', '02', '033', 'Bản Díu', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(374, '01105', 'c6', 'vi', '02', '033', 'Chí Cà', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(375, '01108', 'c6', 'vi', '02', '033', 'Xín Mần', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(376, '01111', 'c6', 'vi', '02', '033', 'Trung Thịnh', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(377, '01114', 'c6', 'vi', '02', '033', 'Thèn Phàng', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(378, '01117', 'c6', 'vi', '02', '033', 'Ngán Chiên', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(379, '01120', 'c6', 'vi', '02', '033', 'Pà Vầy Sủ', 0, 0, 1, 1415954338, 1415954338, 'vi'),
(380, '01123', 'c6', 'vi', '02', '033', 'Cốc Rế', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(381, '01126', 'c6', 'vi', '02', '033', 'Thu Tà', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(382, '01129', 'c6', 'vi', '02', '033', 'Nàn Ma', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(383, '01132', 'c6', 'vi', '02', '033', 'Tả Nhìu', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(384, '01135', 'c6', 'vi', '02', '033', 'Bản Ngò', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(385, '01138', 'c6', 'vi', '02', '033', 'Chế Là', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(386, '01141', 'c6', 'vi', '02', '033', 'Nấm Dẩn', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(387, '01144', 'c6', 'vi', '02', '033', 'Quảng Nguyên', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(388, '01147', 'c6', 'vi', '02', '033', 'Nà Chì', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(389, '01150', 'c6', 'vi', '02', '033', 'Khuôn Lùng', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(390, '01153', 'c6', 'vi', '02', '034', 'Việt Quang', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(391, '01156', 'c6', 'vi', '02', '034', 'Vĩnh Tuy', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(392, '01159', 'c6', 'vi', '02', '034', 'Tân Lập', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(393, '01162', 'c6', 'vi', '02', '034', 'Tân Thành', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(394, '01165', 'c6', 'vi', '02', '034', 'Đồng Tiến', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(395, '01168', 'c6', 'vi', '02', '034', 'Đồng Tâm', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(396, '01171', 'c6', 'vi', '02', '034', 'Tân Quang', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(397, '01174', 'c6', 'vi', '02', '034', 'Thượng Bình', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(398, '01177', 'c6', 'vi', '02', '034', 'Hữu Sản', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(399, '01180', 'c6', 'vi', '02', '034', 'Kim Ngọc', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(400, '01183', 'c6', 'vi', '02', '034', 'Việt Vinh', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(401, '01186', 'c6', 'vi', '02', '034', 'Bằng Hành', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(402, '01189', 'c6', 'vi', '02', '034', 'Quang Minh', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(403, '01192', 'c6', 'vi', '02', '034', 'Liên Hiệp', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(404, '01195', 'c6', 'vi', '02', '034', 'Vô Điếm', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(405, '01198', 'c6', 'vi', '02', '034', 'Việt Hồng', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(406, '01201', 'c6', 'vi', '02', '034', 'Hùng An', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(407, '01204', 'c6', 'vi', '02', '034', 'Đức Xuân', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(408, '01207', 'c6', 'vi', '02', '034', 'Tiên Kiều', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(409, '01210', 'c6', 'vi', '02', '034', 'Vĩnh Hảo', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(410, '01213', 'c6', 'vi', '02', '034', 'Vĩnh Phúc', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(411, '01216', 'c6', 'vi', '02', '034', 'Đồng Yên', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(412, '01219', 'c6', 'vi', '02', '034', 'Đông Thành', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(413, '01222', 'c6', 'vi', '02', '035', 'Xuân Minh', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(414, '01225', 'c6', 'vi', '02', '035', 'Tiên Nguyên', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(415, '01228', 'c6', 'vi', '02', '035', 'Tân Nam', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(416, '01231', 'c6', 'vi', '02', '035', 'Bản Rịa', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(417, '01234', 'c6', 'vi', '02', '035', 'Yên Thành', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(418, '01237', 'c6', 'vi', '02', '035', 'Yên Bình', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(419, '01240', 'c6', 'vi', '02', '035', 'Tân Trịnh', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(420, '01243', 'c6', 'vi', '02', '035', 'Tân Bắc', 0, 0, 1, 1415954339, 1415954339, 'vi'),
(421, '01246', 'c6', 'vi', '02', '035', 'Bằng Lang', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(422, '01249', 'c6', 'vi', '02', '035', 'Yên Hà', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(423, '01252', 'c6', 'vi', '02', '035', 'Hương Sơn', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(424, '01255', 'c6', 'vi', '02', '035', 'Xuân Giang', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(425, '01258', 'c6', 'vi', '02', '035', 'Nà Khương', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(426, '01261', 'c6', 'vi', '02', '035', 'Tiên Yên', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(427, '01264', 'c6', 'vi', '02', '035', 'Vĩ Thượng', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(428, '01267', 'c6', 'vi', '04', '040', 'Sông Hiến', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(429, '01270', 'c6', 'vi', '04', '040', 'Sông Bằng', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(430, '01273', 'c6', 'vi', '04', '040', 'Hợp Giang', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(431, '01276', 'c6', 'vi', '04', '040', 'Tân Giang', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(432, '01279', 'c6', 'vi', '04', '040', 'Ngọc Xuân', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(433, '01282', 'c6', 'vi', '04', '040', 'Đề Thám', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(434, '01285', 'c6', 'vi', '04', '040', 'Hoà Chung', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(435, '01288', 'c6', 'vi', '04', '040', 'Duyệt Trung', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(436, '01290', 'c6', 'vi', '04', '042', 'Pác Mi Ầu', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(437, '01291', 'c6', 'vi', '04', '042', 'Đức Hạnh', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(438, '01294', 'c6', 'vi', '04', '042', 'Lý Bôn', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(439, '01296', 'c6', 'vi', '04', '042', 'Nam Cao', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(440, '01297', 'c6', 'vi', '04', '042', 'Nam Quang', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(441, '01300', 'c6', 'vi', '04', '042', 'Vĩnh Quang', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(442, '01303', 'c6', 'vi', '04', '042', 'Quảng Lâm', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(443, '01304', 'c6', 'vi', '04', '042', 'Thạch Lâm', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(444, '01306', 'c6', 'vi', '04', '042', 'Tân Việt', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(445, '01309', 'c6', 'vi', '04', '042', 'Vĩnh Phong', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(446, '01312', 'c6', 'vi', '04', '042', 'Mông Ân', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(447, '01315', 'c6', 'vi', '04', '042', 'Thái Học', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(448, '01316', 'c6', 'vi', '04', '042', 'Thái Sơn', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(449, '01318', 'c6', 'vi', '04', '042', 'Yên Thổ', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(450, '01321', 'c6', 'vi', '04', '043', 'Bảo Lạc', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(451, '01324', 'c6', 'vi', '04', '043', 'Cốc Pàng', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(452, '01327', 'c6', 'vi', '04', '043', 'Thượng Hà', 0, 0, 1, 1415954340, 1415954340, 'vi'),
(453, '01330', 'c6', 'vi', '04', '043', 'Cô Ba', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(454, '01333', 'c6', 'vi', '04', '043', 'Bảo Toàn', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(455, '01336', 'c6', 'vi', '04', '043', 'Khánh Xuân', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(456, '01339', 'c6', 'vi', '04', '043', 'Xuân Trường', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(457, '01342', 'c6', 'vi', '04', '043', 'Hồng Trị', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(458, '01343', 'c6', 'vi', '04', '043', 'Kim Cúc', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(459, '01345', 'c6', 'vi', '04', '043', 'Phan Thanh', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(460, '01348', 'c6', 'vi', '04', '043', 'Hồng An', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(461, '01351', 'c6', 'vi', '04', '043', 'Hưng Đạo', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(462, '01352', 'c6', 'vi', '04', '043', 'Hưng Thịnh', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(463, '01354', 'c6', 'vi', '04', '043', 'Huy Giáp', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(464, '01357', 'c6', 'vi', '04', '043', 'Đình Phùng', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(465, '01359', 'c6', 'vi', '04', '043', 'Sơn Lập', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(466, '01360', 'c6', 'vi', '04', '043', 'Sơn Lộ', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(467, '01363', 'c6', 'vi', '04', '044', 'Thông Nông', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(468, '01366', 'c6', 'vi', '04', '044', 'Cần Yên', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(469, '01367', 'c6', 'vi', '04', '044', 'Cần Nông', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(470, '01369', 'c6', 'vi', '04', '044', 'Vị Quang', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(471, '01372', 'c6', 'vi', '04', '044', 'Lương Thông', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(472, '01375', 'c6', 'vi', '04', '044', 'Đa Thông', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(473, '01378', 'c6', 'vi', '04', '044', 'Ngọc Động', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(474, '01381', 'c6', 'vi', '04', '044', 'Yên Sơn', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(475, '01384', 'c6', 'vi', '04', '044', 'Lương Can', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(476, '01387', 'c6', 'vi', '04', '044', 'Thanh Long', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(477, '01390', 'c6', 'vi', '04', '044', 'Bình Lãng', 0, 0, 1, 1415954341, 1415954341, 'vi'),
(478, '01392', 'c6', 'vi', '04', '045', 'Xuân Hoà', 0, 0, 1, 1415954342, 1415954342, 'vi'),
(479, '01393', 'c6', 'vi', '04', '045', 'Lũng Nặm', 0, 0, 1, 1415954342, 1415954342, 'vi'),
(480, '01396', 'c6', 'vi', '04', '045', 'Kéo Yên', 0, 0, 1, 1415954342, 1415954342, 'vi'),
(481, '01399', 'c6', 'vi', '04', '045', 'Trường Hà', 0, 0, 1, 1415954342, 1415954342, 'vi'),
(482, '01402', 'c6', 'vi', '04', '045', 'Vân An', 0, 0, 1, 1415954342, 1415954342, 'vi'),
(483, '01405', 'c6', 'vi', '04', '045', 'Cải Viên', 0, 0, 1, 1415954342, 1415954342, 'vi'),
(484, '01408', 'c6', 'vi', '04', '045', 'Nà Sác', 0, 0, 1, 1415954342, 1415954342, 'vi'),
(485, '01411', 'c6', 'vi', '04', '045', 'Nội Thôn', 0, 0, 1, 1415954342, 1415954342, 'vi'),
(486, '01414', 'c6', 'vi', '04', '045', 'Tổng Cọt', 0, 0, 1, 1415954342, 1415954342, 'vi'),
(487, '01417', 'c6', 'vi', '04', '045', 'Sóc Hà', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(488, '01420', 'c6', 'vi', '04', '045', 'Thượng Thôn', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(489, '01423', 'c6', 'vi', '04', '045', 'Vần Dính', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(490, '01426', 'c6', 'vi', '04', '045', 'Hồng Sĩ', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(491, '01429', 'c6', 'vi', '04', '045', 'Sĩ Hai', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(492, '01432', 'c6', 'vi', '04', '045', 'Quý Quân', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(493, '01435', 'c6', 'vi', '04', '045', 'Mã Ba', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(494, '01438', 'c6', 'vi', '04', '045', 'Phù Ngọc', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(495, '01441', 'c6', 'vi', '04', '045', 'Đào Ngạn', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(496, '01444', 'c6', 'vi', '04', '045', 'Hạ Thôn', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(497, '01447', 'c6', 'vi', '04', '046', 'Hùng Quốc', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(498, '01450', 'c6', 'vi', '04', '046', 'Cô Mười', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(499, '01453', 'c6', 'vi', '04', '046', 'Tri Phương', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(500, '01456', 'c6', 'vi', '04', '046', 'Quang Hán', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(501, '01459', 'c6', 'vi', '04', '046', 'Quang Vinh', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(502, '01462', 'c6', 'vi', '04', '046', 'Xuân Nội', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(503, '01465', 'c6', 'vi', '04', '046', 'Quang Trung', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(504, '01468', 'c6', 'vi', '04', '046', 'Lưu Ngọc', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(505, '01471', 'c6', 'vi', '04', '046', 'Cao Chương', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(506, '01474', 'c6', 'vi', '04', '046', 'Quốc Toản', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(507, '01477', 'c6', 'vi', '04', '047', 'Trùng Khánh', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(508, '01480', 'c6', 'vi', '04', '047', 'Ngọc Khê', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(509, '01481', 'c6', 'vi', '04', '047', 'Ngọc Côn', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(510, '01483', 'c6', 'vi', '04', '047', 'Phong Nậm', 0, 0, 1, 1415954343, 1415954343, 'vi'),
(511, '01486', 'c6', 'vi', '04', '047', 'Ngọc Chung', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(512, '01489', 'c6', 'vi', '04', '047', 'Đình Phong', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(513, '01492', 'c6', 'vi', '04', '047', 'Lăng Yên', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(514, '01495', 'c6', 'vi', '04', '047', 'Đàm Thuỷ', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(515, '01498', 'c6', 'vi', '04', '047', 'Khâm Thành', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(516, '01501', 'c6', 'vi', '04', '047', 'Chí Viễn', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(517, '01504', 'c6', 'vi', '04', '047', 'Lăng Hiếu', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(518, '01507', 'c6', 'vi', '04', '047', 'Phong Châu', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(519, '01510', 'c6', 'vi', '04', '047', 'Đình Minh', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(520, '01513', 'c6', 'vi', '04', '047', 'Cảnh Tiên', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(521, '01516', 'c6', 'vi', '04', '047', 'Trung Phúc', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(522, '01519', 'c6', 'vi', '04', '047', 'Cao Thăng', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(523, '01522', 'c6', 'vi', '04', '047', 'Đức Hồng', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(524, '01525', 'c6', 'vi', '04', '047', 'Thông Hoè', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(525, '01528', 'c6', 'vi', '04', '047', 'Thân Giáp', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(526, '01531', 'c6', 'vi', '04', '047', 'Đoài Côn', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(527, '01534', 'c6', 'vi', '04', '048', 'Minh Long', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(528, '01537', 'c6', 'vi', '04', '048', 'Lý Quốc', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(529, '01540', 'c6', 'vi', '04', '048', 'Thắng Lợi', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(530, '01543', 'c6', 'vi', '04', '048', 'Đồng Loan', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(531, '01546', 'c6', 'vi', '04', '048', 'Đức Quang', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(532, '01549', 'c6', 'vi', '04', '048', 'Kim Loan', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(533, '01552', 'c6', 'vi', '04', '048', 'Quang Long', 0, 0, 1, 1415954344, 1415954344, 'vi'),
(534, '01555', 'c6', 'vi', '04', '048', 'An Lạc', 0, 0, 1, 1415954345, 1415954345, 'vi'),
(535, '01558', 'c6', 'vi', '04', '048', 'Thanh Nhật', 0, 0, 1, 1415954345, 1415954345, 'vi');
INSERT INTO `location_ward` (`id`, `code`, `area_code`, `country_code`, `province_code`, `district_code`, `title`, `is_extramural`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(536, '01561', 'c6', 'vi', '04', '048', 'Vinh Quý', 0, 0, 1, 1415954345, 1415954345, 'vi'),
(537, '01564', 'c6', 'vi', '04', '048', 'Việt Chu', 0, 0, 1, 1415954345, 1415954345, 'vi'),
(538, '01567', 'c6', 'vi', '04', '048', 'Cô Ngân', 0, 0, 1, 1415954345, 1415954345, 'vi'),
(539, '01570', 'c6', 'vi', '04', '048', 'Thái Đức', 0, 0, 1, 1415954345, 1415954345, 'vi'),
(540, '01573', 'c6', 'vi', '04', '048', 'Thị Hoa', 0, 0, 1, 1415954345, 1415954345, 'vi'),
(541, '01576', 'c6', 'vi', '04', '049', 'Quảng Uyên', 0, 0, 1, 1415954345, 1415954345, 'vi'),
(542, '01579', 'c6', 'vi', '04', '049', 'Phi Hải', 0, 0, 1, 1415954345, 1415954345, 'vi'),
(543, '01582', 'c6', 'vi', '04', '049', 'Quảng Hưng', 0, 0, 1, 1415954345, 1415954345, 'vi'),
(544, '01585', 'c6', 'vi', '04', '049', 'Bình Lăng', 0, 0, 1, 1415954345, 1415954345, 'vi'),
(545, '01588', 'c6', 'vi', '04', '049', 'Quốc Dân', 0, 0, 1, 1415954345, 1415954345, 'vi'),
(546, '01591', 'c6', 'vi', '04', '049', 'Quốc Phong', 0, 0, 1, 1415954345, 1415954345, 'vi'),
(547, '01594', 'c6', 'vi', '04', '049', 'Độc Lập', 0, 0, 1, 1415954345, 1415954345, 'vi'),
(548, '01597', 'c6', 'vi', '04', '049', 'Cai Bộ', 0, 0, 1, 1415954345, 1415954345, 'vi'),
(549, '01600', 'c6', 'vi', '04', '049', 'Đoài Khôn', 0, 0, 1, 1415954345, 1415954345, 'vi'),
(550, '01603', 'c6', 'vi', '04', '049', 'Phúc Sen', 0, 0, 1, 1415954345, 1415954345, 'vi'),
(551, '01606', 'c6', 'vi', '04', '049', 'Chí Thảo', 0, 0, 1, 1415954346, 1415954346, 'vi'),
(552, '01609', 'c6', 'vi', '04', '049', 'Tự Do', 0, 0, 1, 1415954346, 1415954346, 'vi'),
(553, '01612', 'c6', 'vi', '04', '049', 'Hồng Định', 0, 0, 1, 1415954346, 1415954346, 'vi'),
(554, '01615', 'c6', 'vi', '04', '049', 'Hồng Quang', 0, 0, 1, 1415954346, 1415954346, 'vi'),
(555, '01618', 'c6', 'vi', '04', '049', 'Ngọc Động', 0, 0, 1, 1415954346, 1415954346, 'vi'),
(556, '01621', 'c6', 'vi', '04', '049', 'Hoàng Hải', 0, 0, 1, 1415954346, 1415954346, 'vi'),
(557, '01624', 'c6', 'vi', '04', '049', 'Hạnh Phúc', 0, 0, 1, 1415954346, 1415954346, 'vi'),
(558, '01627', 'c6', 'vi', '04', '050', 'Tà Lùng', 0, 0, 1, 1415954346, 1415954346, 'vi'),
(559, '01630', 'c6', 'vi', '04', '050', 'Triệu Ẩu', 0, 0, 1, 1415954346, 1415954346, 'vi'),
(560, '01633', 'c6', 'vi', '04', '050', 'Hồng Đại', 0, 0, 1, 1415954346, 1415954346, 'vi'),
(561, '01636', 'c6', 'vi', '04', '050', 'Cách Linh', 0, 0, 1, 1415954346, 1415954346, 'vi'),
(562, '01639', 'c6', 'vi', '04', '050', 'Đại Sơn', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(563, '01642', 'c6', 'vi', '04', '050', 'Lương Thiện', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(564, '01645', 'c6', 'vi', '04', '050', 'Tiên Thành', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(565, '01648', 'c6', 'vi', '04', '050', 'Hoà Thuận', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(566, '01651', 'c6', 'vi', '04', '050', 'Mỹ Hưng', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(567, '01654', 'c6', 'vi', '04', '051', 'Nước Hai', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(568, '01657', 'c6', 'vi', '04', '051', 'Dân Chủ', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(569, '01660', 'c6', 'vi', '04', '051', 'Nam Tuấn', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(570, '01663', 'c6', 'vi', '04', '051', 'Đức Xuân', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(571, '01666', 'c6', 'vi', '04', '051', 'Đại Tiến', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(572, '01669', 'c6', 'vi', '04', '051', 'Đức Long', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(573, '01672', 'c6', 'vi', '04', '051', 'Ngũ Lão', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(574, '01675', 'c6', 'vi', '04', '051', 'Trương Lương', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(575, '01678', 'c6', 'vi', '04', '051', 'Bình Long', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(576, '01681', 'c6', 'vi', '04', '051', 'Nguyễn Huệ', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(577, '01684', 'c6', 'vi', '04', '051', 'Công Trừng', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(578, '01687', 'c6', 'vi', '04', '051', 'Hồng Việt', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(579, '01690', 'c6', 'vi', '04', '051', 'Bế Triều', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(580, '01693', 'c6', 'vi', '04', '051', 'Vĩnh Quang', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(581, '01696', 'c6', 'vi', '04', '051', 'Hoàng Tung', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(582, '01699', 'c6', 'vi', '04', '051', 'Trương Vương', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(583, '01702', 'c6', 'vi', '04', '051', 'Quang Trung', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(584, '01705', 'c6', 'vi', '04', '051', 'Hưng Đạo', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(585, '01708', 'c6', 'vi', '04', '051', 'Bạch Đằng', 0, 0, 1, 1415954347, 1415954347, 'vi'),
(586, '01711', 'c6', 'vi', '04', '051', 'Bình Dương', 0, 0, 1, 1415954348, 1415954348, 'vi'),
(587, '01714', 'c6', 'vi', '04', '051', 'Lê Chung', 0, 0, 1, 1415954348, 1415954348, 'vi'),
(588, '01717', 'c6', 'vi', '04', '051', 'Hà Trì', 0, 0, 1, 1415954348, 1415954348, 'vi'),
(589, '01720', 'c6', 'vi', '04', '051', 'Chu Trinh', 0, 0, 1, 1415954348, 1415954348, 'vi'),
(590, '01723', 'c6', 'vi', '04', '051', 'Hồng Nam', 0, 0, 1, 1415954348, 1415954348, 'vi'),
(591, '01726', 'c6', 'vi', '04', '052', 'Nguyên Bình', 0, 0, 1, 1415954348, 1415954348, 'vi'),
(592, '01729', 'c6', 'vi', '04', '052', 'Tĩnh Túc', 0, 0, 1, 1415954348, 1415954348, 'vi'),
(593, '01732', 'c6', 'vi', '04', '052', 'Yên Lạc', 0, 0, 1, 1415954348, 1415954348, 'vi'),
(594, '01735', 'c6', 'vi', '04', '052', 'Triệu Nguyên', 0, 0, 1, 1415954348, 1415954348, 'vi'),
(595, '01738', 'c6', 'vi', '04', '052', 'Ca Thành', 0, 0, 1, 1415954349, 1415954349, 'vi'),
(596, '01741', 'c6', 'vi', '04', '052', 'Thái Học', 0, 0, 1, 1415954349, 1415954349, 'vi'),
(597, '01744', 'c6', 'vi', '04', '052', 'Vũ Nông', 0, 0, 1, 1415954349, 1415954349, 'vi'),
(598, '01747', 'c6', 'vi', '04', '052', 'Minh Tâm', 0, 0, 1, 1415954349, 1415954349, 'vi'),
(599, '01750', 'c6', 'vi', '04', '052', 'Thể Dục', 0, 0, 1, 1415954349, 1415954349, 'vi'),
(600, '01753', 'c6', 'vi', '04', '052', 'Bắc Hợp', 0, 0, 1, 1415954349, 1415954349, 'vi'),
(601, '01756', 'c6', 'vi', '04', '052', 'Mai Long', 0, 0, 1, 1415954349, 1415954349, 'vi'),
(602, '01759', 'c6', 'vi', '04', '052', 'Lang Môn', 0, 0, 1, 1415954349, 1415954349, 'vi'),
(603, '01762', 'c6', 'vi', '04', '052', 'Minh Thanh', 0, 0, 1, 1415954349, 1415954349, 'vi'),
(604, '01765', 'c6', 'vi', '04', '052', 'Hoa Thám', 0, 0, 1, 1415954349, 1415954349, 'vi'),
(605, '01768', 'c6', 'vi', '04', '052', 'Phan Thanh', 0, 0, 1, 1415954349, 1415954349, 'vi'),
(606, '01771', 'c6', 'vi', '04', '052', 'Quang Thành', 0, 0, 1, 1415954349, 1415954349, 'vi'),
(607, '01774', 'c6', 'vi', '04', '052', 'Tam Kim', 0, 0, 1, 1415954349, 1415954349, 'vi'),
(608, '01777', 'c6', 'vi', '04', '052', 'Thành Công', 0, 0, 1, 1415954349, 1415954349, 'vi'),
(609, '01780', 'c6', 'vi', '04', '052', 'Thịnh Vượng', 0, 0, 1, 1415954349, 1415954349, 'vi'),
(610, '01783', 'c6', 'vi', '04', '052', 'Hưng Đạo', 0, 0, 1, 1415954349, 1415954349, 'vi'),
(611, '01786', 'c6', 'vi', '04', '053', 'Đông Khê', 0, 0, 1, 1415954349, 1415954349, 'vi'),
(612, '01789', 'c6', 'vi', '04', '053', 'Canh Tân', 0, 0, 1, 1415954349, 1415954349, 'vi'),
(613, '01792', 'c6', 'vi', '04', '053', 'Kim Đồng', 0, 0, 1, 1415954349, 1415954349, 'vi'),
(614, '01795', 'c6', 'vi', '04', '053', 'Minh Khai', 0, 0, 1, 1415954349, 1415954349, 'vi'),
(615, '01798', 'c6', 'vi', '04', '053', 'Thị Ngân', 0, 0, 1, 1415954349, 1415954349, 'vi'),
(616, '01801', 'c6', 'vi', '04', '053', 'Đức Thông', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(617, '01804', 'c6', 'vi', '04', '053', 'Thái Cường', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(618, '01807', 'c6', 'vi', '04', '053', 'Vân Trình', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(619, '01810', 'c6', 'vi', '04', '053', 'Thuỵ Hùng', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(620, '01813', 'c6', 'vi', '04', '053', 'Quang Trọng', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(621, '01816', 'c6', 'vi', '04', '053', 'Trọng Con', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(622, '01819', 'c6', 'vi', '04', '053', 'Lê Lai', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(623, '01822', 'c6', 'vi', '04', '053', 'Đức Long', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(624, '01825', 'c6', 'vi', '04', '053', 'Danh Sỹ', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(625, '01828', 'c6', 'vi', '04', '053', 'Lê Lợi', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(626, '01831', 'c6', 'vi', '04', '053', 'Đức Xuân', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(627, '01834', 'c6', 'vi', '06', '058', 'Nguyễn Thị Minh Khai', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(628, '01837', 'c6', 'vi', '06', '058', 'Sông Cầu', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(629, '01840', 'c6', 'vi', '06', '058', 'Đức Xuân', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(630, '01843', 'c6', 'vi', '06', '058', 'Phùng Chí Kiên', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(631, '01846', 'c6', 'vi', '06', '058', 'Huyền Tụng', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(632, '01849', 'c6', 'vi', '06', '058', 'Dương Quang', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(633, '01852', 'c6', 'vi', '06', '058', 'Nông Thượng', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(634, '01855', 'c6', 'vi', '06', '058', 'Xuất Hoá', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(635, '01858', 'c6', 'vi', '06', '060', 'Bằng Thành', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(636, '01861', 'c6', 'vi', '06', '060', 'Nhạn Môn', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(637, '01864', 'c6', 'vi', '06', '060', 'Bộc Bố', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(638, '01867', 'c6', 'vi', '06', '060', 'Công Bằng', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(639, '01870', 'c6', 'vi', '06', '060', 'Giáo Hiệu', 0, 0, 1, 1415954350, 1415954350, 'vi'),
(640, '01873', 'c6', 'vi', '06', '060', 'Xuân La', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(641, '01876', 'c6', 'vi', '06', '060', 'An Thắng', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(642, '01879', 'c6', 'vi', '06', '060', 'Cổ Linh', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(643, '01882', 'c6', 'vi', '06', '060', 'Nghiên Loan', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(644, '01885', 'c6', 'vi', '06', '060', 'Cao Tân', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(645, '01888', 'c6', 'vi', '06', '061', 'Chợ Rã', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(646, '01891', 'c6', 'vi', '06', '061', 'Bành Trạch', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(647, '01894', 'c6', 'vi', '06', '061', 'Phúc Lộc', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(648, '01897', 'c6', 'vi', '06', '061', 'Hà Hiệu', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(649, '01900', 'c6', 'vi', '06', '061', 'Cao Thượng', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(650, '01903', 'c6', 'vi', '06', '061', 'Cao Trĩ', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(651, '01906', 'c6', 'vi', '06', '061', 'Khang Ninh', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(652, '01909', 'c6', 'vi', '06', '061', 'Nam Mẫu', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(653, '01912', 'c6', 'vi', '06', '061', 'Thượng Giáo', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(654, '01915', 'c6', 'vi', '06', '061', 'Địa Linh', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(655, '01918', 'c6', 'vi', '06', '061', 'Yến Dương', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(656, '01921', 'c6', 'vi', '06', '061', 'Chu Hương', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(657, '01924', 'c6', 'vi', '06', '061', 'Quảng Khê', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(658, '01927', 'c6', 'vi', '06', '061', 'Mỹ Phương', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(659, '01930', 'c6', 'vi', '06', '061', 'Hoàng Trĩ', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(660, '01933', 'c6', 'vi', '06', '061', 'Đồng Phúc', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(661, '01936', 'c6', 'vi', '06', '062', 'Nà Phặc', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(662, '01939', 'c6', 'vi', '06', '062', 'Thượng Ân', 0, 0, 1, 1415954351, 1415954351, 'vi'),
(663, '01942', 'c6', 'vi', '06', '062', 'Bằng Vân', 0, 0, 1, 1415954352, 1415954352, 'vi'),
(664, '01945', 'c6', 'vi', '06', '062', 'Cốc Đán', 0, 0, 1, 1415954352, 1415954352, 'vi'),
(665, '01948', 'c6', 'vi', '06', '062', 'Trung Hoà', 0, 0, 1, 1415954352, 1415954352, 'vi'),
(666, '01951', 'c6', 'vi', '06', '062', 'Đức Vân', 0, 0, 1, 1415954352, 1415954352, 'vi'),
(667, '01954', 'c6', 'vi', '06', '062', 'Vân Tùng', 0, 0, 1, 1415954352, 1415954352, 'vi'),
(668, '01957', 'c6', 'vi', '06', '062', 'Thượng Quan', 0, 0, 1, 1415954352, 1415954352, 'vi'),
(669, '01960', 'c6', 'vi', '06', '062', 'Lãng Ngâm', 0, 0, 1, 1415954352, 1415954352, 'vi'),
(670, '01963', 'c6', 'vi', '06', '062', 'Thuần Mang', 0, 0, 1, 1415954352, 1415954352, 'vi'),
(671, '01966', 'c6', 'vi', '06', '062', 'Hương Nê', 0, 0, 1, 1415954352, 1415954352, 'vi'),
(672, '01969', 'c6', 'vi', '06', '063', 'Phủ Thông', 0, 0, 1, 1415954352, 1415954352, 'vi'),
(673, '01972', 'c6', 'vi', '06', '063', 'Phương Linh', 0, 0, 1, 1415954352, 1415954352, 'vi'),
(674, '01975', 'c6', 'vi', '06', '063', 'Vi Hương', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(675, '01978', 'c6', 'vi', '06', '063', 'Sĩ Bình', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(676, '01981', 'c6', 'vi', '06', '063', 'Vũ Muộn', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(677, '01984', 'c6', 'vi', '06', '063', 'Đôn Phong', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(678, '01987', 'c6', 'vi', '06', '063', 'Tú Trĩ', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(679, '01990', 'c6', 'vi', '06', '063', 'Lục Bình', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(680, '01993', 'c6', 'vi', '06', '063', 'Tân Tiến', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(681, '01996', 'c6', 'vi', '06', '063', 'Quân Bình', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(682, '01999', 'c6', 'vi', '06', '063', 'Nguyên Phúc', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(683, '02002', 'c6', 'vi', '06', '063', 'Cao Sơn', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(684, '02005', 'c6', 'vi', '06', '063', 'Hà Vị', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(685, '02008', 'c6', 'vi', '06', '063', 'Cẩm Giàng', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(686, '02011', 'c6', 'vi', '06', '063', 'Mỹ Thanh', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(687, '02014', 'c6', 'vi', '06', '063', 'Dương Phong', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(688, '02017', 'c6', 'vi', '06', '063', 'Quang Thuận', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(689, '02020', 'c6', 'vi', '06', '064', 'Bằng Lũng', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(690, '02023', 'c6', 'vi', '06', '064', 'Xuân Lạc', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(691, '02026', 'c6', 'vi', '06', '064', 'Nam Cường', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(692, '02029', 'c6', 'vi', '06', '064', 'Đồng Lạc', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(693, '02032', 'c6', 'vi', '06', '064', 'Tân Lập', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(694, '02035', 'c6', 'vi', '06', '064', 'Bản Thi', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(695, '02038', 'c6', 'vi', '06', '064', 'Quảng Bạch', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(696, '02041', 'c6', 'vi', '06', '064', 'Bằng Phúc', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(697, '02044', 'c6', 'vi', '06', '064', 'Yên Thịnh', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(698, '02047', 'c6', 'vi', '06', '064', 'Yên Thượng', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(699, '02050', 'c6', 'vi', '06', '064', 'Phương Viên', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(700, '02053', 'c6', 'vi', '06', '064', 'Ngọc Phái', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(701, '02056', 'c6', 'vi', '06', '064', 'Rã Bản', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(702, '02059', 'c6', 'vi', '06', '064', 'Đông Viên', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(703, '02062', 'c6', 'vi', '06', '064', 'Lương Bằng', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(704, '02065', 'c6', 'vi', '06', '064', 'Bằng Lãng', 0, 0, 1, 1415954353, 1415954353, 'vi'),
(705, '02068', 'c6', 'vi', '06', '064', 'Đại Sảo', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(706, '02071', 'c6', 'vi', '06', '064', 'Nghĩa Tá', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(707, '02074', 'c6', 'vi', '06', '064', 'Phong Huân', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(708, '02077', 'c6', 'vi', '06', '064', 'Yên Mỹ', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(709, '02080', 'c6', 'vi', '06', '064', 'Bình Trung', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(710, '02083', 'c6', 'vi', '06', '064', 'Yên Nhuận', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(711, '02086', 'c6', 'vi', '06', '065', 'Chợ Mới', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(712, '02089', 'c6', 'vi', '06', '065', 'Tân Sơn', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(713, '02092', 'c6', 'vi', '06', '065', 'Thanh Vận', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(714, '02095', 'c6', 'vi', '06', '065', 'Mai Lạp', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(715, '02098', 'c6', 'vi', '06', '065', 'Hoà Mục', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(716, '02101', 'c6', 'vi', '06', '065', 'Thanh Mai', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(717, '02104', 'c6', 'vi', '06', '065', 'Cao Kỳ', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(718, '02107', 'c6', 'vi', '06', '065', 'Nông Hạ', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(719, '02110', 'c6', 'vi', '06', '065', 'Yên Cư', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(720, '02113', 'c6', 'vi', '06', '065', 'Nông Thịnh', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(721, '02116', 'c6', 'vi', '06', '065', 'Yên Hân', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(722, '02119', 'c6', 'vi', '06', '065', 'Thanh Bình', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(723, '02122', 'c6', 'vi', '06', '065', 'Như Cố', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(724, '02125', 'c6', 'vi', '06', '065', 'Bình Văn', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(725, '02128', 'c6', 'vi', '06', '065', 'Yên Đĩnh', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(726, '02131', 'c6', 'vi', '06', '065', 'Quảng Chu', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(727, '02134', 'c6', 'vi', '06', '066', 'Yến Lạc', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(728, '02137', 'c6', 'vi', '06', '066', 'Vũ Loan', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(729, '02140', 'c6', 'vi', '06', '066', 'Lạng San', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(730, '02143', 'c6', 'vi', '06', '066', 'Lương Thượng', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(731, '02146', 'c6', 'vi', '06', '066', 'Kim Hỷ', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(732, '02149', 'c6', 'vi', '06', '066', 'Văn Học', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(733, '02152', 'c6', 'vi', '06', '066', 'Cường Lợi', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(734, '02155', 'c6', 'vi', '06', '066', 'Lương Hạ', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(735, '02158', 'c6', 'vi', '06', '066', 'Kim Lư', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(736, '02161', 'c6', 'vi', '06', '066', 'Lương Thành', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(737, '02164', 'c6', 'vi', '06', '066', 'Ân Tình', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(738, '02167', 'c6', 'vi', '06', '066', 'Lam Sơn', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(739, '02170', 'c6', 'vi', '06', '066', 'Văn Minh', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(740, '02173', 'c6', 'vi', '06', '066', 'Côn Minh', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(741, '02176', 'c6', 'vi', '06', '066', 'Cư Lễ', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(742, '02179', 'c6', 'vi', '06', '066', 'Hữu Thác', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(743, '02182', 'c6', 'vi', '06', '066', 'Hảo Nghĩa', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(744, '02185', 'c6', 'vi', '06', '066', 'Quang Phong', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(745, '02188', 'c6', 'vi', '06', '066', 'Dương Sơn', 0, 0, 1, 1415954354, 1415954354, 'vi'),
(746, '02191', 'c6', 'vi', '06', '066', 'Xuân Dương', 0, 0, 1, 1415954355, 1415954355, 'vi'),
(747, '02194', 'c6', 'vi', '06', '066', 'Đổng Xá', 0, 0, 1, 1415954355, 1415954355, 'vi'),
(748, '02197', 'c6', 'vi', '06', '066', 'Liêm Thuỷ', 0, 0, 1, 1415954355, 1415954355, 'vi'),
(749, '02200', 'c6', 'vi', '08', '070', 'Phan Thiết', 0, 0, 1, 1415954355, 1415954355, 'vi'),
(750, '02203', 'c6', 'vi', '08', '070', 'Minh Xuân', 0, 0, 1, 1415954355, 1415954355, 'vi'),
(751, '02206', 'c6', 'vi', '08', '070', 'Tân Quang', 0, 0, 1, 1415954355, 1415954355, 'vi'),
(752, '02209', 'c6', 'vi', '08', '070', 'Tràng Đà', 0, 0, 1, 1415954355, 1415954355, 'vi'),
(753, '02212', 'c6', 'vi', '08', '070', 'Nông Tiến', 0, 0, 1, 1415954355, 1415954355, 'vi'),
(754, '02215', 'c6', 'vi', '08', '070', 'Ỷ La', 0, 0, 1, 1415954355, 1415954355, 'vi'),
(755, '02216', 'c6', 'vi', '08', '070', 'Tân Hà', 0, 0, 1, 1415954355, 1415954355, 'vi'),
(756, '02218', 'c6', 'vi', '08', '070', 'Hưng Thành', 0, 0, 1, 1415954355, 1415954355, 'vi'),
(757, '02221', 'c6', 'vi', '08', '072', 'Nà Hang', 0, 0, 1, 1415954355, 1415954355, 'vi'),
(758, '02227', 'c6', 'vi', '08', '072', 'Sinh Long', 0, 0, 1, 1415954355, 1415954355, 'vi'),
(759, '02230', 'c6', 'vi', '08', '072', 'Thượng Giáp', 0, 0, 1, 1415954355, 1415954355, 'vi'),
(760, '02233', 'c6', 'vi', '08', '072', 'Phúc Yên', 0, 0, 1, 1415954355, 1415954355, 'vi'),
(761, '02239', 'c6', 'vi', '08', '072', 'Thượng Nông', 0, 0, 1, 1415954355, 1415954355, 'vi'),
(762, '02242', 'c6', 'vi', '08', '072', 'Xuân Lập', 0, 0, 1, 1415954355, 1415954355, 'vi'),
(763, '02245', 'c6', 'vi', '08', '072', 'Côn Lôn', 0, 0, 1, 1415954355, 1415954355, 'vi'),
(764, '02248', 'c6', 'vi', '08', '072', 'Yên Hoa', 0, 0, 1, 1415954355, 1415954355, 'vi'),
(765, '02251', 'c6', 'vi', '08', '072', 'Khuôn Hà', 0, 0, 1, 1415954355, 1415954355, 'vi'),
(766, '02254', 'c6', 'vi', '08', '072', 'Hồng Thái', 0, 0, 1, 1415954355, 1415954355, 'vi'),
(767, '02260', 'c6', 'vi', '08', '072', 'Đà Vị', 0, 0, 1, 1415954356, 1415954356, 'vi'),
(768, '02263', 'c6', 'vi', '08', '072', 'Khau Tinh', 0, 0, 1, 1415954356, 1415954356, 'vi'),
(769, '02266', 'c6', 'vi', '08', '072', 'Lăng Can', 0, 0, 1, 1415954356, 1415954356, 'vi'),
(770, '02269', 'c6', 'vi', '08', '072', 'Thượng Lâm', 0, 0, 1, 1415954356, 1415954356, 'vi'),
(771, '02275', 'c6', 'vi', '08', '072', 'Sơn Phú', 0, 0, 1, 1415954356, 1415954356, 'vi'),
(772, '02281', 'c6', 'vi', '08', '072', 'Năng Khả', 0, 0, 1, 1415954356, 1415954356, 'vi'),
(773, '02284', 'c6', 'vi', '08', '072', 'Thanh Tương', 0, 0, 1, 1415954356, 1415954356, 'vi'),
(774, '02287', 'c6', 'vi', '08', '073', 'Vĩnh Lộc', 0, 0, 1, 1415954356, 1415954356, 'vi'),
(775, '02290', 'c6', 'vi', '08', '073', 'Bình An', 0, 0, 1, 1415954356, 1415954356, 'vi'),
(776, '02293', 'c6', 'vi', '08', '073', 'Hồng Quang', 0, 0, 1, 1415954356, 1415954356, 'vi'),
(777, '02296', 'c6', 'vi', '08', '073', 'Thổ Bình', 0, 0, 1, 1415954356, 1415954356, 'vi'),
(778, '02299', 'c6', 'vi', '08', '073', 'Phúc Sơn', 0, 0, 1, 1415954356, 1415954356, 'vi'),
(779, '02302', 'c6', 'vi', '08', '073', 'Minh Quang', 0, 0, 1, 1415954356, 1415954356, 'vi'),
(780, '02305', 'c6', 'vi', '08', '073', 'Trung Hà', 0, 0, 1, 1415954356, 1415954356, 'vi'),
(781, '02308', 'c6', 'vi', '08', '073', 'Tân Mỹ', 0, 0, 1, 1415954356, 1415954356, 'vi'),
(782, '02311', 'c6', 'vi', '08', '073', 'Hà Lang', 0, 0, 1, 1415954356, 1415954356, 'vi'),
(783, '02314', 'c6', 'vi', '08', '073', 'Hùng Mỹ', 0, 0, 1, 1415954356, 1415954356, 'vi'),
(784, '02317', 'c6', 'vi', '08', '073', 'Yên Lập', 0, 0, 1, 1415954356, 1415954356, 'vi'),
(785, '02320', 'c6', 'vi', '08', '073', 'Tân An', 0, 0, 1, 1415954356, 1415954356, 'vi'),
(786, '02323', 'c6', 'vi', '08', '073', 'Bình Phú', 0, 0, 1, 1415954356, 1415954356, 'vi'),
(787, '02326', 'c6', 'vi', '08', '073', 'Xuân Quang', 0, 0, 1, 1415954356, 1415954356, 'vi'),
(788, '02329', 'c6', 'vi', '08', '073', 'Ngọc Hội', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(789, '02332', 'c6', 'vi', '08', '073', 'Phú Bình', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(790, '02335', 'c6', 'vi', '08', '073', 'Hòa Phú', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(791, '02338', 'c6', 'vi', '08', '073', 'Phúc Thịnh', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(792, '02341', 'c6', 'vi', '08', '073', 'Kiên Đài', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(793, '02344', 'c6', 'vi', '08', '073', 'Tân Thịnh', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(794, '02347', 'c6', 'vi', '08', '073', 'Trung Hòa', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(795, '02350', 'c6', 'vi', '08', '073', 'Kim Bình', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(796, '02353', 'c6', 'vi', '08', '073', 'Hòa An', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(797, '02356', 'c6', 'vi', '08', '073', 'Vinh Quang', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(798, '02359', 'c6', 'vi', '08', '073', 'Tri Phú', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(799, '02362', 'c6', 'vi', '08', '073', 'Nhân Lý', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(800, '02365', 'c6', 'vi', '08', '073', 'Yên Nguyên', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(801, '02368', 'c6', 'vi', '08', '073', 'Linh Phú', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(802, '02371', 'c6', 'vi', '08', '073', 'Bình Nhân', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(803, '02374', 'c6', 'vi', '08', '074', 'Tân Yên', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(804, '02377', 'c6', 'vi', '08', '074', 'Yên Thuận', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(805, '02380', 'c6', 'vi', '08', '074', 'Bạch Xa', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(806, '02383', 'c6', 'vi', '08', '074', 'Minh Khương', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(807, '02386', 'c6', 'vi', '08', '074', 'Yên Lâm', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(808, '02389', 'c6', 'vi', '08', '074', 'Minh Dân', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(809, '02392', 'c6', 'vi', '08', '074', 'Phù Lưu', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(810, '02395', 'c6', 'vi', '08', '074', 'Minh Hương', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(811, '02398', 'c6', 'vi', '08', '074', 'Yên Phú', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(812, '02401', 'c6', 'vi', '08', '074', 'Tân Thành', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(813, '02404', 'c6', 'vi', '08', '074', 'Bình Xa', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(814, '02407', 'c6', 'vi', '08', '074', 'Thái Sơn', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(815, '02410', 'c6', 'vi', '08', '074', 'Nhân Mục', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(816, '02413', 'c6', 'vi', '08', '074', 'Thành Long', 0, 0, 1, 1415954357, 1415954357, 'vi'),
(817, '02416', 'c6', 'vi', '08', '074', 'Bằng Cốc', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(818, '02419', 'c6', 'vi', '08', '074', 'Thái Hòa', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(819, '02422', 'c6', 'vi', '08', '074', 'Đức Ninh', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(820, '02425', 'c6', 'vi', '08', '074', 'Hùng Đức', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(821, '02428', 'c6', 'vi', '08', '075', 'Tân Bình', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(822, '02431', 'c6', 'vi', '08', '075', 'Quí Quân', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(823, '02434', 'c6', 'vi', '08', '075', 'Lực Hành', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(824, '02437', 'c6', 'vi', '08', '075', 'Kiến Thiết', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(825, '02440', 'c6', 'vi', '08', '075', 'Trung Minh', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(826, '02443', 'c6', 'vi', '08', '075', 'Chiêu Yên', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(827, '02446', 'c6', 'vi', '08', '075', 'Trung Trực', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(828, '02449', 'c6', 'vi', '08', '075', 'Xuân Vân', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(829, '02452', 'c6', 'vi', '08', '075', 'Phúc Ninh', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(830, '02455', 'c6', 'vi', '08', '075', 'Hùng Lợi', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(831, '02458', 'c6', 'vi', '08', '075', 'Trung Sơn', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(832, '02461', 'c6', 'vi', '08', '075', 'Tân Tiến', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(833, '02464', 'c6', 'vi', '08', '075', 'Tứ Quận', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(834, '02467', 'c6', 'vi', '08', '075', 'Đạo Viện', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(835, '02470', 'c6', 'vi', '08', '075', 'Tân Long', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(836, '02473', 'c6', 'vi', '08', '075', 'Thắng Quân', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(837, '02476', 'c6', 'vi', '08', '075', 'Kim Quan', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(838, '02479', 'c6', 'vi', '08', '075', 'Lang Quán', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(839, '02482', 'c6', 'vi', '08', '075', 'Phú Thịnh', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(840, '02485', 'c6', 'vi', '08', '075', 'Công Đa', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(841, '02488', 'c6', 'vi', '08', '075', 'Trung Môn', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(842, '02491', 'c6', 'vi', '08', '075', 'Chân Sơn', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(843, '02494', 'c6', 'vi', '08', '075', 'Thái Bình', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(844, '02497', 'c6', 'vi', '08', '075', 'Kim Phú', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(845, '02500', 'c6', 'vi', '08', '075', 'Tiến Bộ', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(846, '02503', 'c6', 'vi', '08', '070', 'An Khang', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(847, '02506', 'c6', 'vi', '08', '075', 'Mỹ Bằng', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(848, '02509', 'c6', 'vi', '08', '075', 'Phú Lâm', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(849, '02512', 'c6', 'vi', '08', '070', 'An Tường', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(850, '02515', 'c6', 'vi', '08', '070', 'Lưỡng Vượng', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(851, '02518', 'c6', 'vi', '08', '075', 'Hoàng Khai', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(852, '02521', 'c6', 'vi', '08', '070', 'Thái Long', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(853, '02524', 'c6', 'vi', '08', '070', 'Đội Cấn', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(854, '02527', 'c6', 'vi', '08', '075', 'Nhữ Hán', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(855, '02530', 'c6', 'vi', '08', '075', 'Nhữ Khê', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(856, '02533', 'c6', 'vi', '08', '075', 'Đội Bình', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(857, '02536', 'c6', 'vi', '08', '076', 'Sơn Dương', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(858, '02539', 'c6', 'vi', '08', '076', 'Trung Yên', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(859, '02542', 'c6', 'vi', '08', '076', 'Minh Thanh', 0, 0, 1, 1415954358, 1415954358, 'vi'),
(860, '02545', 'c6', 'vi', '08', '076', 'Tân Trào', 0, 0, 1, 1415954359, 1415954359, 'vi'),
(861, '02548', 'c6', 'vi', '08', '076', 'Vĩnh Lợi', 0, 0, 1, 1415954359, 1415954359, 'vi'),
(862, '02551', 'c6', 'vi', '08', '076', 'Thượng Ấm', 0, 0, 1, 1415954359, 1415954359, 'vi'),
(863, '02554', 'c6', 'vi', '08', '076', 'Bình Yên', 0, 0, 1, 1415954359, 1415954359, 'vi'),
(864, '02557', 'c6', 'vi', '08', '076', 'Lương Thiện', 0, 0, 1, 1415954359, 1415954359, 'vi'),
(865, '02560', 'c6', 'vi', '08', '076', 'Tú Thịnh', 0, 0, 1, 1415954359, 1415954359, 'vi'),
(866, '02563', 'c6', 'vi', '08', '076', 'Cấp Tiến', 0, 0, 1, 1415954359, 1415954359, 'vi'),
(867, '02566', 'c6', 'vi', '08', '076', 'Hợp Thành', 0, 0, 1, 1415954359, 1415954359, 'vi'),
(868, '02569', 'c6', 'vi', '08', '076', 'Phúc Ứng', 0, 0, 1, 1415954359, 1415954359, 'vi'),
(869, '02572', 'c6', 'vi', '08', '076', 'Đông Thọ', 0, 0, 1, 1415954359, 1415954359, 'vi'),
(870, '02575', 'c6', 'vi', '08', '076', 'Kháng Nhật', 0, 0, 1, 1415954359, 1415954359, 'vi'),
(871, '02578', 'c6', 'vi', '08', '076', 'Hợp Hòa', 0, 0, 1, 1415954359, 1415954359, 'vi'),
(872, '02581', 'c6', 'vi', '08', '076', 'Thanh Phát', 0, 0, 1, 1415954359, 1415954359, 'vi'),
(873, '02584', 'c6', 'vi', '08', '076', 'Quyết Thắng', 0, 0, 1, 1415954359, 1415954359, 'vi'),
(874, '02587', 'c6', 'vi', '08', '076', 'Đồng Quý', 0, 0, 1, 1415954359, 1415954359, 'vi'),
(875, '02590', 'c6', 'vi', '08', '076', 'Tuân Lộ', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(876, '02593', 'c6', 'vi', '08', '076', 'Vân Sơn', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(877, '02596', 'c6', 'vi', '08', '076', 'Văn Phú', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(878, '02599', 'c6', 'vi', '08', '076', 'Chi Thiết', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(879, '02602', 'c6', 'vi', '08', '076', 'Đông Lợi', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(880, '02605', 'c6', 'vi', '08', '076', 'Thiện Kế', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(881, '02608', 'c6', 'vi', '08', '076', 'Hồng Lạc', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(882, '02611', 'c6', 'vi', '08', '076', 'Phú Lương', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(883, '02614', 'c6', 'vi', '08', '076', 'Ninh Lai', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(884, '02617', 'c6', 'vi', '08', '076', 'Đại Phú', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(885, '02620', 'c6', 'vi', '08', '076', 'Sơn Nam', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(886, '02623', 'c6', 'vi', '08', '076', 'Hào Phú', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(887, '02626', 'c6', 'vi', '08', '076', 'Tam Đa', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(888, '02629', 'c6', 'vi', '08', '076', 'Sầm Dương', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(889, '02632', 'c6', 'vi', '08', '076', 'Lâm Xuyên', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(890, '02635', 'c6', 'vi', '10', '080', 'Duyên Hải', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(891, '02638', 'c6', 'vi', '10', '080', 'Lào Cai', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(892, '02641', 'c6', 'vi', '10', '080', 'Phố Mới', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(893, '02644', 'c6', 'vi', '10', '080', 'Cốc Lếu', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(894, '02647', 'c6', 'vi', '10', '080', 'Kim Tân', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(895, '02650', 'c6', 'vi', '10', '080', 'Bắc Lệnh', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(896, '02653', 'c6', 'vi', '10', '080', 'Pom Hán', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(897, '02656', 'c6', 'vi', '10', '080', 'Xuân Tăng', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(898, '02658', 'c6', 'vi', '10', '080', 'Bình Minh', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(899, '02659', 'c6', 'vi', '10', '080', 'Thống Nhất', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(900, '02662', 'c6', 'vi', '10', '080', 'Đồng Tuyển', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(901, '02665', 'c6', 'vi', '10', '080', 'Vạn Hoà', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(902, '02668', 'c6', 'vi', '10', '080', 'Bắc Cường', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(903, '02671', 'c6', 'vi', '10', '080', 'Nam Cường', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(904, '02674', 'c6', 'vi', '10', '080', 'Cam Đường', 0, 0, 1, 1415954360, 1415954360, 'vi'),
(905, '02677', 'c6', 'vi', '10', '080', 'Tả Phời', 0, 0, 1, 1415954361, 1415954361, 'vi'),
(906, '02680', 'c6', 'vi', '10', '080', 'Hợp Thành', 0, 0, 1, 1415954361, 1415954361, 'vi'),
(907, '02683', 'c6', 'vi', '10', '082', 'Bát Xát', 0, 0, 1, 1415954361, 1415954361, 'vi'),
(908, '02686', 'c6', 'vi', '10', '082', 'A Mú Sung', 0, 0, 1, 1415954361, 1415954361, 'vi'),
(909, '02689', 'c6', 'vi', '10', '082', 'Nậm Chạc', 0, 0, 1, 1415954361, 1415954361, 'vi'),
(910, '02692', 'c6', 'vi', '10', '082', 'A Lù', 0, 0, 1, 1415954361, 1415954361, 'vi'),
(911, '02695', 'c6', 'vi', '10', '082', 'Trịnh Tường', 0, 0, 1, 1415954361, 1415954361, 'vi'),
(912, '02698', 'c6', 'vi', '10', '082', 'Ngải Thầu', 0, 0, 1, 1415954361, 1415954361, 'vi'),
(913, '02701', 'c6', 'vi', '10', '082', 'Y Tý', 0, 0, 1, 1415954361, 1415954361, 'vi'),
(914, '02704', 'c6', 'vi', '10', '082', 'Cốc Mỳ', 0, 0, 1, 1415954361, 1415954361, 'vi'),
(915, '02707', 'c6', 'vi', '10', '082', 'Dền Sáng', 0, 0, 1, 1415954361, 1415954361, 'vi'),
(916, '02710', 'c6', 'vi', '10', '082', 'Bản Vược', 0, 0, 1, 1415954361, 1415954361, 'vi'),
(917, '02713', 'c6', 'vi', '10', '082', 'Sàng Ma Sáo', 0, 0, 1, 1415954361, 1415954361, 'vi'),
(918, '02716', 'c6', 'vi', '10', '082', 'Bản Qua', 0, 0, 1, 1415954361, 1415954361, 'vi'),
(919, '02719', 'c6', 'vi', '10', '082', 'Mường Vi', 0, 0, 1, 1415954361, 1415954361, 'vi'),
(920, '02722', 'c6', 'vi', '10', '082', 'Dền Thàng', 0, 0, 1, 1415954361, 1415954361, 'vi'),
(921, '02725', 'c6', 'vi', '10', '082', 'Bản Xèo', 0, 0, 1, 1415954361, 1415954361, 'vi'),
(922, '02728', 'c6', 'vi', '10', '082', 'Mường Hum', 0, 0, 1, 1415954361, 1415954361, 'vi'),
(923, '02731', 'c6', 'vi', '10', '082', 'Trung Lèng Hồ', 0, 0, 1, 1415954361, 1415954361, 'vi'),
(924, '02734', 'c6', 'vi', '10', '082', 'Quang Kim', 0, 0, 1, 1415954361, 1415954361, 'vi'),
(925, '02737', 'c6', 'vi', '10', '082', 'Pa Cheo', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(926, '02740', 'c6', 'vi', '10', '082', 'Nậm Pung', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(927, '02743', 'c6', 'vi', '10', '082', 'Phìn Ngan', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(928, '02746', 'c6', 'vi', '10', '082', 'Cốc San', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(929, '02749', 'c6', 'vi', '10', '082', 'Tòng Sành', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(930, '02752', 'c6', 'vi', '10', '083', 'Pha Long', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(931, '02755', 'c6', 'vi', '10', '083', 'Tả Ngải Chồ', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(932, '02758', 'c6', 'vi', '10', '083', 'Tung Chung Phố', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(933, '02761', 'c6', 'vi', '10', '083', 'Mường Khương', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(934, '02764', 'c6', 'vi', '10', '083', 'Dìn Chin', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(935, '02767', 'c6', 'vi', '10', '083', 'Tả Gia Khâu', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(936, '02770', 'c6', 'vi', '10', '083', 'Nậm Chảy', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(937, '02773', 'c6', 'vi', '10', '083', 'Nấm Lư', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(938, '02776', 'c6', 'vi', '10', '083', 'Lùng Khấu Nhin', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(939, '02779', 'c6', 'vi', '10', '083', 'Thanh Bình', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(940, '02782', 'c6', 'vi', '10', '083', 'Cao Sơn', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(941, '02785', 'c6', 'vi', '10', '083', 'Lùng Vai', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(942, '02788', 'c6', 'vi', '10', '083', 'Bản Lầu', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(943, '02791', 'c6', 'vi', '10', '083', 'La Pan Tẩn', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(944, '02794', 'c6', 'vi', '10', '083', 'Tả Thàng', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(945, '02797', 'c6', 'vi', '10', '083', 'Bản Sen', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(946, '02800', 'c6', 'vi', '10', '084', 'Nàn Sán', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(947, '02803', 'c6', 'vi', '10', '084', 'Thào Chư Phìn', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(948, '02806', 'c6', 'vi', '10', '084', 'Bản Mế', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(949, '02809', 'c6', 'vi', '10', '084', 'Si Ma Cai', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(950, '02812', 'c6', 'vi', '10', '084', 'Sán Chải', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(951, '02815', 'c6', 'vi', '10', '084', 'Mản Thẩn', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(952, '02818', 'c6', 'vi', '10', '084', 'Lùng Sui', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(953, '02821', 'c6', 'vi', '10', '084', 'Cán Cấu', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(954, '02824', 'c6', 'vi', '10', '084', 'Sín Chéng', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(955, '02827', 'c6', 'vi', '10', '084', 'Cán Hồ', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(956, '02830', 'c6', 'vi', '10', '084', 'Quan Thần Sán', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(957, '02833', 'c6', 'vi', '10', '084', 'Lử Thẩn', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(958, '02836', 'c6', 'vi', '10', '084', 'Nàn Xín', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(959, '02839', 'c6', 'vi', '10', '085', 'Bắc Hà', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(960, '02842', 'c6', 'vi', '10', '085', 'Lùng Cải', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(961, '02845', 'c6', 'vi', '10', '085', 'Bản Già', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(962, '02848', 'c6', 'vi', '10', '085', 'Lùng Phình', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(963, '02851', 'c6', 'vi', '10', '085', 'Tả Van Chư', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(964, '02854', 'c6', 'vi', '10', '085', 'Tả Củ Tỷ', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(965, '02857', 'c6', 'vi', '10', '085', 'Thải Giàng Phố', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(966, '02860', 'c6', 'vi', '10', '085', 'Lầu Thí Ngài', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(967, '02863', 'c6', 'vi', '10', '085', 'Hoàng Thu Phố', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(968, '02866', 'c6', 'vi', '10', '085', 'Bản Phố', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(969, '02869', 'c6', 'vi', '10', '085', 'Bản Liền', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(970, '02872', 'c6', 'vi', '10', '085', 'Tà Chải', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(971, '02875', 'c6', 'vi', '10', '085', 'Na Hối', 0, 0, 1, 1415954362, 1415954362, 'vi'),
(972, '02878', 'c6', 'vi', '10', '085', 'Cốc Ly', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(973, '02881', 'c6', 'vi', '10', '085', 'Nậm Mòn', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(974, '02884', 'c6', 'vi', '10', '085', 'Nậm Đét', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(975, '02887', 'c6', 'vi', '10', '085', 'Nậm Khánh', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(976, '02890', 'c6', 'vi', '10', '085', 'Bảo Nhai', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(977, '02893', 'c6', 'vi', '10', '085', 'Nậm Lúc', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(978, '02896', 'c6', 'vi', '10', '085', 'Cốc Lầu', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(979, '02899', 'c6', 'vi', '10', '085', 'Bản Cái', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(980, '02902', 'c6', 'vi', '10', '086', 'N.t Phong Hải', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(981, '02905', 'c6', 'vi', '10', '086', 'Phố Lu', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(982, '02908', 'c6', 'vi', '10', '086', 'Tằng Loỏng', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(983, '02911', 'c6', 'vi', '10', '086', 'Bản Phiệt', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(984, '02914', 'c6', 'vi', '10', '086', 'Bản Cầm', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(985, '02917', 'c6', 'vi', '10', '086', 'Thái Niên', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(986, '02920', 'c6', 'vi', '10', '086', 'Phong Niên', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(987, '02923', 'c6', 'vi', '10', '086', 'Gia Phú', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(988, '02926', 'c6', 'vi', '10', '086', 'Xuân Quang', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(989, '02929', 'c6', 'vi', '10', '086', 'Sơn Hải', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(990, '02932', 'c6', 'vi', '10', '086', 'Xuân Giao', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(991, '02935', 'c6', 'vi', '10', '086', 'Trì Quang', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(992, '02938', 'c6', 'vi', '10', '086', 'Sơn Hà', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(993, '02941', 'c6', 'vi', '10', '086', 'Phố Lu', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(994, '02944', 'c6', 'vi', '10', '086', 'Phú Nhuận', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(995, '02947', 'c6', 'vi', '10', '087', 'Phố Ràng', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(996, '02950', 'c6', 'vi', '10', '087', 'Tân Tiến', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(997, '02953', 'c6', 'vi', '10', '087', 'Nghĩa Đô', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(998, '02956', 'c6', 'vi', '10', '087', 'Vĩnh Yên', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(999, '02959', 'c6', 'vi', '10', '087', 'Điện Quan', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(1000, '02962', 'c6', 'vi', '10', '087', 'Xuân Hoà', 0, 0, 1, 1415954363, 1415954363, 'vi'),
(1001, '02965', 'c6', 'vi', '10', '087', 'Tân Dương', 0, 0, 1, 1415954385, 1415954385, 'vi'),
(1002, '02968', 'c6', 'vi', '10', '087', 'Thượng Hà', 0, 0, 1, 1415954385, 1415954385, 'vi'),
(1003, '02971', 'c6', 'vi', '10', '087', 'Kim Sơn', 0, 0, 1, 1415954385, 1415954385, 'vi'),
(1004, '02974', 'c6', 'vi', '10', '087', 'Cam Cọn', 0, 0, 1, 1415954385, 1415954385, 'vi'),
(1005, '02977', 'c6', 'vi', '10', '087', 'Minh Tân', 0, 0, 1, 1415954385, 1415954385, 'vi'),
(1006, '02980', 'c6', 'vi', '10', '087', 'Xuân Thượng', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1007, '02983', 'c6', 'vi', '10', '087', 'Việt Tiến', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1008, '02986', 'c6', 'vi', '10', '087', 'Yên Sơn', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1009, '02989', 'c6', 'vi', '10', '087', 'Bảo Hà', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1010, '02992', 'c6', 'vi', '10', '087', 'Lương Sơn', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1011, '02995', 'c6', 'vi', '10', '087', 'Long Phúc', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1012, '02998', 'c6', 'vi', '10', '087', 'Long Khánh', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1013, '03001', 'c6', 'vi', '10', '088', 'Sa Pa', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1014, '03004', 'c6', 'vi', '10', '088', 'Bản Khoang', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1015, '03007', 'c6', 'vi', '10', '088', 'Tả Giàng Phình', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1016, '03010', 'c6', 'vi', '10', '088', 'Trung Chải', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1017, '03013', 'c6', 'vi', '10', '088', 'Tả Phìn', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1018, '03016', 'c6', 'vi', '10', '088', 'Sa Pả', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1019, '03019', 'c6', 'vi', '10', '088', 'San Sả Hồ', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1020, '03022', 'c6', 'vi', '10', '088', 'Bản Phùng', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1021, '03025', 'c6', 'vi', '10', '088', 'Hầu Thào', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1022, '03028', 'c6', 'vi', '10', '088', 'Lao Chải', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1023, '03031', 'c6', 'vi', '10', '088', 'Thanh Kim', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1024, '03034', 'c6', 'vi', '10', '088', 'Suối Thầu', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1025, '03037', 'c6', 'vi', '10', '088', 'Sử Pán', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1026, '03040', 'c6', 'vi', '10', '088', 'Tả Van', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1027, '03043', 'c6', 'vi', '10', '088', 'Thanh Phú', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1028, '03046', 'c6', 'vi', '10', '088', 'Bản Hồ', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1029, '03049', 'c6', 'vi', '10', '088', 'Nậm Sài', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1030, '03052', 'c6', 'vi', '10', '088', 'Nậm Cang', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1031, '03055', 'c6', 'vi', '10', '089', 'Khánh Yên', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1032, '03058', 'c6', 'vi', '10', '089', 'Văn Sơn', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1033, '03061', 'c6', 'vi', '10', '089', 'Võ Lao', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1034, '03064', 'c6', 'vi', '10', '089', 'Sơn Thuỷ', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1035, '03067', 'c6', 'vi', '10', '089', 'Nậm Mả', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1036, '03070', 'c6', 'vi', '10', '089', 'Tân Thượng', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1037, '03073', 'c6', 'vi', '10', '089', 'Nậm Rạng', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1038, '03076', 'c6', 'vi', '10', '089', 'Nậm Chầy', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1039, '03079', 'c6', 'vi', '10', '089', 'Tân An', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1040, '03082', 'c6', 'vi', '10', '089', 'Khánh Yên Thượng', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1041, '03085', 'c6', 'vi', '10', '089', 'Nậm Xé', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1042, '03088', 'c6', 'vi', '10', '089', 'Dần Thàng', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1043, '03091', 'c6', 'vi', '10', '089', 'Chiềng Ken', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1044, '03094', 'c6', 'vi', '10', '089', 'Làng Giàng', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1045, '03097', 'c6', 'vi', '10', '089', 'Hoà Mạc', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1046, '03100', 'c6', 'vi', '10', '089', 'Khánh Yên Trung', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1047, '03103', 'c6', 'vi', '10', '089', 'Khánh Yên Hạ', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1048, '03106', 'c6', 'vi', '10', '089', 'Dương Quỳ', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1049, '03109', 'c6', 'vi', '10', '089', 'Nậm Tha', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1050, '03112', 'c6', 'vi', '10', '089', 'Minh Lương', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1051, '03115', 'c6', 'vi', '10', '089', 'Thẩm Dương', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1052, '03118', 'c6', 'vi', '10', '089', 'Liêm Phú', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1053, '03121', 'c6', 'vi', '10', '089', 'Nậm Xây', 0, 0, 1, 1415954386, 1415954386, 'vi'),
(1054, '03124', 'c6', 'vi', '11', '094', 'Noong Bua', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1055, '03127', 'c6', 'vi', '11', '094', 'Him Lam', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1056, '03130', 'c6', 'vi', '11', '094', 'Thanh Bình', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1057, '03133', 'c6', 'vi', '11', '094', 'Tân Thanh', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1058, '03136', 'c6', 'vi', '11', '094', 'Mường Thanh', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1059, '03139', 'c6', 'vi', '11', '094', 'Nam Thanh', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1060, '03142', 'c6', 'vi', '11', '094', 'Thanh Trường', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1061, '03144', 'c6', 'vi', '11', '094', 'Tà Lèng', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1062, '03145', 'c6', 'vi', '11', '094', 'Thanh Minh', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1063, '03148', 'c6', 'vi', '11', '095', 'Sông Đà', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1064, '03151', 'c6', 'vi', '11', '095', 'Na Lay', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1065, '03154', 'c6', 'vi', '11', '096', 'Sín Thầu', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1066, '03155', 'c6', 'vi', '11', '096', 'Sen Thượng', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1067, '03157', 'c6', 'vi', '11', '096', 'Chung Chải', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1068, '03158', 'c6', 'vi', '11', '096', 'Leng Su Sìn', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1069, '03159', 'c6', 'vi', '11', '096', 'Pá Mỳ', 0, 0, 1, 1415954387, 1415954387, 'vi');
INSERT INTO `location_ward` (`id`, `code`, `area_code`, `country_code`, `province_code`, `district_code`, `title`, `is_extramural`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1070, '03160', 'c6', 'vi', '11', '096', 'Mường Nhé', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1071, '03161', 'c6', 'vi', '11', '096', 'Nậm Vì', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1072, '03162', 'c6', 'vi', '11', '096', 'Nậm Kè', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1073, '03163', 'c6', 'vi', '11', '096', 'Mường Toong', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1074, '03164', 'c6', 'vi', '11', '096', 'Quảng Lâm', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1075, '03165', 'c6', 'vi', '11', '096', 'Pa Tần', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1076, '03166', 'c6', 'vi', '11', '096', 'Chà Cang', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1077, '03167', 'c6', 'vi', '11', '096', 'Na Cô Sa', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1078, '03168', 'c6', 'vi', '11', '096', 'Nà Khoa', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1079, '03169', 'c6', 'vi', '11', '096', 'Nà Hỳ', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1080, '03170', 'c6', 'vi', '11', '096', 'Nà Bủng', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1081, '03172', 'c6', 'vi', '11', '097', 'Mường Chà', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1082, '03174', 'c6', 'vi', '11', '097', 'Nậm Khăn', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1083, '03175', 'c6', 'vi', '11', '097', 'Chà Tở', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1084, '03178', 'c6', 'vi', '11', '097', 'Xá Tổng', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1085, '03181', 'c6', 'vi', '11', '097', 'Mường Tùng', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1086, '03184', 'c6', 'vi', '11', '095', 'Lay Nưa', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1087, '03187', 'c6', 'vi', '11', '097', 'Chà Nưa', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1088, '03190', 'c6', 'vi', '11', '097', 'Hừa Ngài', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1089, '03193', 'c6', 'vi', '11', '097', 'Pa Ham', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1090, '03196', 'c6', 'vi', '11', '097', 'Huổi Lèng', 0, 0, 1, 1415954387, 1415954387, 'vi'),
(1091, '03197', 'c6', 'vi', '11', '097', 'Sa Lông', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1092, '03198', 'c6', 'vi', '11', '097', 'Phìn Hồ', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1093, '03199', 'c6', 'vi', '11', '097', 'Si Pa Phìn', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1094, '03200', 'c6', 'vi', '11', '097', 'Ma Thì Hồ', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1095, '03201', 'c6', 'vi', '11', '097', 'Na Sang', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1096, '03202', 'c6', 'vi', '11', '097', 'Mường Mươn', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1097, '03203', 'c6', 'vi', '11', '101', 'Điện Biên Đông', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1098, '03205', 'c6', 'vi', '11', '101', 'Na Son', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1099, '03208', 'c6', 'vi', '11', '101', 'Phì Nhừ', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1100, '03211', 'c6', 'vi', '11', '101', 'Chiềng Sơ', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1101, '03214', 'c6', 'vi', '11', '101', 'Mường Luân', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1102, '03217', 'c6', 'vi', '11', '098', 'Tủa Chùa', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1103, '03220', 'c6', 'vi', '11', '098', 'Huổi Só', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1104, '03223', 'c6', 'vi', '11', '098', 'Xín Chải', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1105, '03226', 'c6', 'vi', '11', '098', 'Tả Sìn Thàng', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1106, '03229', 'c6', 'vi', '11', '098', 'Lao Xả Phình', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1107, '03232', 'c6', 'vi', '11', '098', 'Tả Phìn', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1108, '03235', 'c6', 'vi', '11', '098', 'Tủa Thàng', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1109, '03238', 'c6', 'vi', '11', '098', 'Trung Thu', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1110, '03241', 'c6', 'vi', '11', '098', 'Sính Phình', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1111, '03244', 'c6', 'vi', '11', '098', 'Sáng Nhè', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1112, '03247', 'c6', 'vi', '11', '098', 'Mường Đun', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1113, '03250', 'c6', 'vi', '11', '098', 'Mường Báng', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1114, '03253', 'c6', 'vi', '11', '099', 'Tuần Giáo', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1115, '03256', 'c6', 'vi', '11', '102', 'Mường Ảng', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1116, '03259', 'c6', 'vi', '11', '099', 'Phình Sáng', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1117, '03262', 'c6', 'vi', '11', '099', 'Mùn Chung', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1118, '03265', 'c6', 'vi', '11', '099', 'Ta Ma', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1119, '03268', 'c6', 'vi', '11', '099', 'Mường Mùn', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1120, '03271', 'c6', 'vi', '11', '099', 'Pú Nhung', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1121, '03274', 'c6', 'vi', '11', '099', 'Quài Nưa', 0, 0, 1, 1415954388, 1415954388, 'vi'),
(1122, '03277', 'c6', 'vi', '11', '099', 'Mường Thín', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1123, '03280', 'c6', 'vi', '11', '099', 'Tỏa Tình', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1124, '03283', 'c6', 'vi', '11', '099', 'Nà Sáy', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1125, '03286', 'c6', 'vi', '11', '102', 'Mường Đăng', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1126, '03287', 'c6', 'vi', '11', '102', 'Ngối Cáy', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1127, '03289', 'c6', 'vi', '11', '099', 'Quài Cang', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1128, '03292', 'c6', 'vi', '11', '102', 'Ẳng Tở', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1129, '03295', 'c6', 'vi', '11', '099', 'Quài Tở', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1130, '03298', 'c6', 'vi', '11', '099', 'Chiềng Sinh', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1131, '03301', 'c6', 'vi', '11', '102', 'Búng Lao', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1132, '03302', 'c6', 'vi', '11', '102', 'Xuân Lao', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1133, '03304', 'c6', 'vi', '11', '099', 'Tênh Phông', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1134, '03307', 'c6', 'vi', '11', '102', 'Ẳng Nưa', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1135, '03310', 'c6', 'vi', '11', '102', 'Ẳng Cang', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1136, '03312', 'c6', 'vi', '11', '102', 'Nặm Lịch', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1137, '03313', 'c6', 'vi', '11', '102', 'Mường Lạn', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1138, '03316', 'c6', 'vi', '11', '100', 'Nà Tấu', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1139, '03317', 'c6', 'vi', '11', '100', 'Nà Nhạn', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1140, '03319', 'c6', 'vi', '11', '100', 'Mường Pồn', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1141, '03322', 'c6', 'vi', '11', '100', 'Thanh Nưa', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1142, '03325', 'c6', 'vi', '11', '100', 'Mường Phăng', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1143, '03328', 'c6', 'vi', '11', '100', 'Thanh Luông', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1144, '03331', 'c6', 'vi', '11', '100', 'Thanh Hưng', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1145, '03334', 'c6', 'vi', '11', '100', 'Thanh Xương', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1146, '03337', 'c6', 'vi', '11', '100', 'Thanh Chăn', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1147, '03340', 'c6', 'vi', '11', '100', 'Pa Thơm', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1148, '03343', 'c6', 'vi', '11', '100', 'Thanh An', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1149, '03346', 'c6', 'vi', '11', '100', 'Thanh Yên', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1150, '03349', 'c6', 'vi', '11', '100', 'Noong Luống', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1151, '03352', 'c6', 'vi', '11', '100', 'Noọng Hẹt', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1152, '03355', 'c6', 'vi', '11', '100', 'Sam Mứn', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1153, '03358', 'c6', 'vi', '11', '100', 'Núa Ngam', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1154, '03361', 'c6', 'vi', '11', '100', 'Na Ư', 0, 0, 1, 1415954389, 1415954389, 'vi'),
(1155, '03364', 'c6', 'vi', '11', '100', 'Mường Nhà', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1156, '03367', 'c6', 'vi', '11', '100', 'Mường Lói', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1157, '03370', 'c6', 'vi', '11', '101', 'Pu Nhi', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1158, '03371', 'c6', 'vi', '11', '101', 'Nong U', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1159, '03373', 'c6', 'vi', '11', '101', 'Xa Dung', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1160, '03376', 'c6', 'vi', '11', '101', 'Keo Lôm', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1161, '03379', 'c6', 'vi', '11', '101', 'Luân Giới', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1162, '03382', 'c6', 'vi', '11', '101', 'Phình Giàng', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1163, '03383', 'c6', 'vi', '11', '101', 'Pú Hồng', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1164, '03384', 'c6', 'vi', '11', '101', 'Tìa Dình', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1165, '03385', 'c6', 'vi', '11', '101', 'Háng Lìa', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1166, '03386', 'c6', 'vi', '12', '104', 'Quyết Thắng', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1167, '03387', 'c6', 'vi', '12', '104', 'Tân Phong', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1168, '03389', 'c6', 'vi', '12', '104', 'Đoàn Kết', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1169, '03390', 'c6', 'vi', '12', '106', 'Tam Đường', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1170, '03391', 'c6', 'vi', '12', '109', 'Lả Nhì Thàng', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1171, '03394', 'c6', 'vi', '12', '106', 'Thèn Sin', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1172, '03397', 'c6', 'vi', '12', '106', 'Sùng Phài', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1173, '03400', 'c6', 'vi', '12', '106', 'Tả Lèng', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1174, '03403', 'c6', 'vi', '12', '104', 'Nậm Loỏng', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1175, '03405', 'c6', 'vi', '12', '106', 'Giang Ma', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1176, '03406', 'c6', 'vi', '12', '106', 'Hồ Thầu', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1177, '03409', 'c6', 'vi', '12', '104', 'San Thàng', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1178, '03412', 'c6', 'vi', '12', '106', 'Bình Lư', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1179, '03413', 'c6', 'vi', '12', '106', 'Sơn Bình', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1180, '03415', 'c6', 'vi', '12', '106', 'Nùng Nàng', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1181, '03418', 'c6', 'vi', '12', '106', 'Bản Giang', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1182, '03421', 'c6', 'vi', '12', '106', 'Bản Hon', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1183, '03424', 'c6', 'vi', '12', '106', 'Bản Bo', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1184, '03427', 'c6', 'vi', '12', '106', 'Nà Tăm', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1185, '03430', 'c6', 'vi', '12', '106', 'Khun Há', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1186, '03433', 'c6', 'vi', '12', '107', 'Mường Tè', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1187, '03436', 'c6', 'vi', '12', '107', 'Thu Lũm', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1188, '03439', 'c6', 'vi', '12', '107', 'Ka Lăng', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1189, '03442', 'c6', 'vi', '12', '107', 'Pa Ủ', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1190, '03445', 'c6', 'vi', '12', '107', 'Mường Tè', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1191, '03448', 'c6', 'vi', '12', '107', 'Pa Vệ Sử', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1192, '03451', 'c6', 'vi', '12', '107', 'Mù Cả', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1193, '03454', 'c6', 'vi', '12', '107', 'Bun Tở', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1194, '03457', 'c6', 'vi', '12', '107', 'Nậm Khao', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1195, '03460', 'c6', 'vi', '12', '107', 'Hua Bun', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1196, '03463', 'c6', 'vi', '12', '107', 'Tà Tổng', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1197, '03466', 'c6', 'vi', '12', '107', 'Bun Nưa', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1198, '03469', 'c6', 'vi', '12', '107', 'Kan Hồ', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1199, '03472', 'c6', 'vi', '12', '107', 'Mường Mô', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1200, '03474', 'c6', 'vi', '12', '107', 'Nậm Manh', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1201, '03475', 'c6', 'vi', '12', '107', 'Nậm Hàng', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1202, '03478', 'c6', 'vi', '12', '108', 'Sìn Hồ', 0, 0, 1, 1415954390, 1415954390, 'vi'),
(1203, '03481', 'c6', 'vi', '12', '108', 'Lê Lợi', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1204, '03484', 'c6', 'vi', '12', '108', 'Pú Đao', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1205, '03487', 'c6', 'vi', '12', '108', 'Chăn Nưa', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1206, '03490', 'c6', 'vi', '12', '109', 'Huổi Luông', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1207, '03493', 'c6', 'vi', '12', '108', 'Pa Tần', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1208, '03496', 'c6', 'vi', '12', '108', 'Phìn Hồ', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1209, '03499', 'c6', 'vi', '12', '108', 'Hồng Thu', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1210, '03502', 'c6', 'vi', '12', '108', 'Nậm Ban', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1211, '03505', 'c6', 'vi', '12', '108', 'Phăng Sô Lin', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1212, '03508', 'c6', 'vi', '12', '108', 'Ma Quai', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1213, '03511', 'c6', 'vi', '12', '108', 'Tả Phìn', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1214, '03514', 'c6', 'vi', '12', '108', 'Sà Dề Phìn', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1215, '03517', 'c6', 'vi', '12', '108', 'Nậm Tăm', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1216, '03520', 'c6', 'vi', '12', '108', 'Tả Ngảo', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1217, '03523', 'c6', 'vi', '12', '108', 'Pu Sam Cáp', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1218, '03526', 'c6', 'vi', '12', '108', 'Nậm Cha', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1219, '03529', 'c6', 'vi', '12', '108', 'Làng Mô', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1220, '03532', 'c6', 'vi', '12', '108', 'Noong Hẻo', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1221, '03535', 'c6', 'vi', '12', '108', 'Nậm Mạ', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1222, '03538', 'c6', 'vi', '12', '108', 'Căn Co', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1223, '03541', 'c6', 'vi', '12', '108', 'Tủa Sín Chải', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1224, '03544', 'c6', 'vi', '12', '108', 'Nậm Cuổi', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1225, '03547', 'c6', 'vi', '12', '108', 'Nậm Hăn', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1226, '03549', 'c6', 'vi', '12', '109', 'Phong Thổ', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1227, '03550', 'c6', 'vi', '12', '109', 'Sì Lờ Lầu', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1228, '03553', 'c6', 'vi', '12', '109', 'Mồ Sì San', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1229, '03556', 'c6', 'vi', '12', '109', 'Ma Li Chải', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1230, '03559', 'c6', 'vi', '12', '109', 'Pa Vây Sử', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1231, '03562', 'c6', 'vi', '12', '109', 'Vàng Ma Chải', 0, 0, 1, 1415954391, 1415954391, 'vi'),
(1232, '03565', 'c6', 'vi', '12', '109', 'Tông Qua Lìn', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1233, '03568', 'c6', 'vi', '12', '109', 'Mù Sang', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1234, '03571', 'c6', 'vi', '12', '109', 'Dào San', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1235, '03574', 'c6', 'vi', '12', '109', 'Ma Ly Pho', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1236, '03577', 'c6', 'vi', '12', '109', 'Bản Lang', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1237, '03580', 'c6', 'vi', '12', '109', 'Hoang Thèn', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1238, '03583', 'c6', 'vi', '12', '109', 'Khổng Lào', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1239, '03586', 'c6', 'vi', '12', '109', 'Nậm Xe', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1240, '03589', 'c6', 'vi', '12', '109', 'Mường So', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1241, '03592', 'c6', 'vi', '12', '109', 'Sin Suối Hồ', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1242, '03595', 'c6', 'vi', '12', '110', 'Than Uyên', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1243, '03598', 'c6', 'vi', '12', '111', 'Tân Uyên', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1244, '03601', 'c6', 'vi', '12', '111', 'Mường Khoa', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1245, '03602', 'c6', 'vi', '12', '111', 'Phúc Khoa', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1246, '03604', 'c6', 'vi', '12', '111', 'Thân Thuộc', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1247, '03605', 'c6', 'vi', '12', '111', 'Trung Đồng', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1248, '03607', 'c6', 'vi', '12', '111', 'Hố Mít', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1249, '03610', 'c6', 'vi', '12', '111', 'Nậm Cần', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1250, '03613', 'c6', 'vi', '12', '111', 'Nậm Sỏ', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1251, '03616', 'c6', 'vi', '12', '111', 'Pắc Ta', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1252, '03618', 'c6', 'vi', '12', '110', 'Phúc Than', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1253, '03619', 'c6', 'vi', '12', '110', 'Mường Than', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1254, '03622', 'c6', 'vi', '12', '111', 'Tà Mít', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1255, '03625', 'c6', 'vi', '12', '110', 'Mường Mít', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1256, '03628', 'c6', 'vi', '12', '110', 'Pha Mu', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1257, '03631', 'c6', 'vi', '12', '110', 'Mường Cang', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1258, '03632', 'c6', 'vi', '12', '110', 'Hua Nà', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1259, '03634', 'c6', 'vi', '12', '110', 'Tà Hừa', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1260, '03637', 'c6', 'vi', '12', '110', 'Mường Kim', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1261, '03638', 'c6', 'vi', '12', '110', 'Tà Mung', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1262, '03640', 'c6', 'vi', '12', '110', 'Tà Gia', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1263, '03643', 'c6', 'vi', '12', '110', 'Khoen On', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1264, '03646', 'c6', 'vi', '14', '116', 'Chiềng Lề', 0, 0, 1, 1415954392, 1415954392, 'vi'),
(1265, '03649', 'c6', 'vi', '14', '116', 'Tô Hiệu', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1266, '03652', 'c6', 'vi', '14', '116', 'Quyết Thắng', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1267, '03655', 'c6', 'vi', '14', '116', 'Quyết Tâm', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1268, '03658', 'c6', 'vi', '14', '116', 'Chiềng Cọ', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1269, '03661', 'c6', 'vi', '14', '116', 'Chiềng Đen', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1270, '03664', 'c6', 'vi', '14', '116', 'Chiềng Xôm', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1271, '03667', 'c6', 'vi', '14', '116', 'Chiềng An', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1272, '03670', 'c6', 'vi', '14', '116', 'Chiềng Cơi', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1273, '03673', 'c6', 'vi', '14', '116', 'Chiềng Ngần', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1274, '03676', 'c6', 'vi', '14', '116', 'Hua La', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1275, '03679', 'c6', 'vi', '14', '116', 'Chiềng Sinh', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1276, '03682', 'c6', 'vi', '14', '118', 'Mường Chiên', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1277, '03685', 'c6', 'vi', '14', '118', 'Cà Nàng', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1278, '03688', 'c6', 'vi', '14', '118', 'Chiềng Khay', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1279, '03691', 'c6', 'vi', '14', '118', 'Pha Khinh', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1280, '03694', 'c6', 'vi', '14', '118', 'Mường Giôn', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1281, '03697', 'c6', 'vi', '14', '118', 'Pắc Ma', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1282, '03700', 'c6', 'vi', '14', '118', 'Chiềng Ơn', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1283, '03703', 'c6', 'vi', '14', '118', 'Mường Giàng', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1284, '03706', 'c6', 'vi', '14', '118', 'Chiềng Bằng', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1285, '03709', 'c6', 'vi', '14', '118', 'Mường Sại', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1286, '03712', 'c6', 'vi', '14', '118', 'Nậm Ét', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1287, '03715', 'c6', 'vi', '14', '118', 'Liệp Muội', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1288, '03718', 'c6', 'vi', '14', '118', 'Chiềng Khoang', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1289, '03721', 'c6', 'vi', '14', '119', 'Thuận Châu', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1290, '03724', 'c6', 'vi', '14', '119', 'Phỏng Lái', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1291, '03727', 'c6', 'vi', '14', '119', 'Mường É', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1292, '03730', 'c6', 'vi', '14', '119', 'Chiềng Pha', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1293, '03733', 'c6', 'vi', '14', '119', 'Chiềng La', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1294, '03736', 'c6', 'vi', '14', '119', 'Chiềng Ngàm', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1295, '03739', 'c6', 'vi', '14', '119', 'Liệp Tè', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1296, '03742', 'c6', 'vi', '14', '119', 'É Tòng', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1297, '03745', 'c6', 'vi', '14', '119', 'Phỏng Lập', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1298, '03748', 'c6', 'vi', '14', '119', 'Phỏng Lặng', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1299, '03751', 'c6', 'vi', '14', '119', 'Chiềng Ly', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1300, '03754', 'c6', 'vi', '14', '119', 'Nong Lay', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1301, '03757', 'c6', 'vi', '14', '119', 'Mường Khiêng', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1302, '03760', 'c6', 'vi', '14', '119', 'Mường Bám', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1303, '03763', 'c6', 'vi', '14', '119', 'Long Hẹ', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1304, '03766', 'c6', 'vi', '14', '119', 'Chiềng Bôm', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1305, '03769', 'c6', 'vi', '14', '119', 'Thôn Mòn', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1306, '03772', 'c6', 'vi', '14', '119', 'Tòng Lệnh', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1307, '03775', 'c6', 'vi', '14', '119', 'Tòng Cọ', 0, 0, 1, 1415954393, 1415954393, 'vi'),
(1308, '03778', 'c6', 'vi', '14', '119', 'Bó Mười', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1309, '03781', 'c6', 'vi', '14', '119', 'Co Mạ', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1310, '03784', 'c6', 'vi', '14', '119', 'Púng Tra', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1311, '03787', 'c6', 'vi', '14', '119', 'Chiềng Pấc', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1312, '03790', 'c6', 'vi', '14', '119', 'Nậm Lầu', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1313, '03793', 'c6', 'vi', '14', '119', 'Bon Phặng', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1314, '03796', 'c6', 'vi', '14', '119', 'Co Tòng', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1315, '03799', 'c6', 'vi', '14', '119', 'Muội Nọi', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1316, '03802', 'c6', 'vi', '14', '119', 'Pá Lông', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1317, '03805', 'c6', 'vi', '14', '119', 'Bản Lầm', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1318, '03808', 'c6', 'vi', '14', '120', 'Ít Ong', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1319, '03811', 'c6', 'vi', '14', '120', 'Nậm Giôn', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1320, '03814', 'c6', 'vi', '14', '120', 'Chiềng Lao', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1321, '03817', 'c6', 'vi', '14', '120', 'Hua Trai', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1322, '03820', 'c6', 'vi', '14', '120', 'Ngọc Chiến', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1323, '03823', 'c6', 'vi', '14', '120', 'Mường Trai', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1324, '03826', 'c6', 'vi', '14', '120', 'Nậm Păm', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1325, '03829', 'c6', 'vi', '14', '120', 'Chiềng Muôn', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1326, '03832', 'c6', 'vi', '14', '120', 'Chiềng Ân', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1327, '03835', 'c6', 'vi', '14', '120', 'Pi Toong', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1328, '03838', 'c6', 'vi', '14', '120', 'Chiềng Công', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1329, '03841', 'c6', 'vi', '14', '120', 'Tạ Bú', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1330, '03844', 'c6', 'vi', '14', '120', 'Chiềng San', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1331, '03847', 'c6', 'vi', '14', '120', 'Mường Bú', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1332, '03850', 'c6', 'vi', '14', '120', 'Chiềng Hoa', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1333, '03853', 'c6', 'vi', '14', '120', 'Mường Chùm', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1334, '03856', 'c6', 'vi', '14', '121', 'Bắc Yên', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1335, '03859', 'c6', 'vi', '14', '121', 'Phiêng Ban', 0, 0, 1, 1415954394, 1415954394, 'vi'),
(1336, '03862', 'c6', 'vi', '14', '121', 'Hang Chú', 0, 0, 1, 1415954395, 1415954395, 'vi'),
(1337, '03865', 'c6', 'vi', '14', '121', 'Xín Vàng', 0, 0, 1, 1415954395, 1415954395, 'vi'),
(1338, '03868', 'c6', 'vi', '14', '121', 'Tà Xùa', 0, 0, 1, 1415954395, 1415954395, 'vi'),
(1339, '03869', 'c6', 'vi', '14', '121', 'Háng Đồng', 0, 0, 1, 1415954395, 1415954395, 'vi'),
(1340, '03871', 'c6', 'vi', '14', '121', 'Bắc Ngà', 0, 0, 1, 1415954395, 1415954395, 'vi'),
(1341, '03874', 'c6', 'vi', '14', '121', 'Làng Chếu', 0, 0, 1, 1415954395, 1415954395, 'vi'),
(1342, '03877', 'c6', 'vi', '14', '121', 'Chim Vàn', 0, 0, 1, 1415954395, 1415954395, 'vi'),
(1343, '03880', 'c6', 'vi', '14', '121', 'Mường Khoa', 0, 0, 1, 1415954395, 1415954395, 'vi'),
(1344, '03883', 'c6', 'vi', '14', '121', 'Song Pe', 0, 0, 1, 1415954395, 1415954395, 'vi'),
(1345, '03886', 'c6', 'vi', '14', '121', 'Hồng Ngài', 0, 0, 1, 1415954395, 1415954395, 'vi'),
(1346, '03889', 'c6', 'vi', '14', '121', 'Tạ Khoa', 0, 0, 1, 1415954395, 1415954395, 'vi'),
(1347, '03890', 'c6', 'vi', '14', '121', 'Hua Nhàn', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1348, '03892', 'c6', 'vi', '14', '121', 'Phiêng Kôn', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1349, '03895', 'c6', 'vi', '14', '121', 'Chiềng Sại', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1350, '03898', 'c6', 'vi', '14', '122', 'Phù Yên', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1351, '03901', 'c6', 'vi', '14', '122', 'Suối Tọ', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1352, '03904', 'c6', 'vi', '14', '122', 'Mường Thải', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1353, '03907', 'c6', 'vi', '14', '122', 'Mường Cơi', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1354, '03910', 'c6', 'vi', '14', '122', 'Quang Huy', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1355, '03913', 'c6', 'vi', '14', '122', 'Huy Bắc', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1356, '03916', 'c6', 'vi', '14', '122', 'Huy Thượng', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1357, '03919', 'c6', 'vi', '14', '122', 'Tân Lang', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1358, '03922', 'c6', 'vi', '14', '122', 'Gia Phù', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1359, '03925', 'c6', 'vi', '14', '122', 'Tường Phù', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1360, '03928', 'c6', 'vi', '14', '122', 'Huy Hạ', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1361, '03931', 'c6', 'vi', '14', '122', 'Huy Tân', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1362, '03934', 'c6', 'vi', '14', '122', 'Mường Lang', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1363, '03937', 'c6', 'vi', '14', '122', 'Suối Bau', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1364, '03940', 'c6', 'vi', '14', '122', 'Huy Tường', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1365, '03943', 'c6', 'vi', '14', '122', 'Mường Do', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1366, '03946', 'c6', 'vi', '14', '122', 'Sập Xa', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1367, '03949', 'c6', 'vi', '14', '122', 'Tường Thượng', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1368, '03952', 'c6', 'vi', '14', '122', 'Tường Tiến', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1369, '03955', 'c6', 'vi', '14', '122', 'Tường Phong', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1370, '03958', 'c6', 'vi', '14', '122', 'Tường Hạ', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1371, '03961', 'c6', 'vi', '14', '122', 'Kim Bon', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1372, '03964', 'c6', 'vi', '14', '122', 'Mường Bang', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1373, '03967', 'c6', 'vi', '14', '122', 'Đá Đỏ', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1374, '03970', 'c6', 'vi', '14', '122', 'Tân Phong', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1375, '03973', 'c6', 'vi', '14', '122', 'Nam Phong', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1376, '03976', 'c6', 'vi', '14', '122', 'Bắc Phong', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1377, '03979', 'c6', 'vi', '14', '123', 'Mộc Châu', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1378, '03982', 'c6', 'vi', '14', '123', 'Nt Mộc Châu', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1379, '03985', 'c6', 'vi', '14', '123', 'Chiềng Sơn', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1380, '03988', 'c6', 'vi', '14', '123', 'Tân Hợp', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1381, '03991', 'c6', 'vi', '14', '123', 'Qui Hướng', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1382, '03994', 'c6', 'vi', '14', '123', 'Suối Bàng', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1383, '03997', 'c6', 'vi', '14', '123', 'Tân Lập', 0, 0, 1, 1415954396, 1415954396, 'vi'),
(1384, '04000', 'c6', 'vi', '14', '123', 'Nà Mường', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1385, '04003', 'c6', 'vi', '14', '123', 'Tà Lai', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1386, '04006', 'c6', 'vi', '14', '123', 'Song Khủa', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1387, '04009', 'c6', 'vi', '14', '123', 'Liên Hoà', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1388, '04012', 'c6', 'vi', '14', '123', 'Chiềng Hắc', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1389, '04015', 'c6', 'vi', '14', '123', 'Hua Păng', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1390, '04018', 'c6', 'vi', '14', '123', 'Tô Múa', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1391, '04021', 'c6', 'vi', '14', '123', 'Mường Tè', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1392, '04024', 'c6', 'vi', '14', '123', 'Chiềng Khừa', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1393, '04027', 'c6', 'vi', '14', '123', 'Mường Sang', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1394, '04030', 'c6', 'vi', '14', '123', 'Đông Sang', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1395, '04033', 'c6', 'vi', '14', '123', 'Phiêng Luông', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1396, '04036', 'c6', 'vi', '14', '123', 'Chiềng Khoa', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1397, '04039', 'c6', 'vi', '14', '123', 'Mường Men', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1398, '04042', 'c6', 'vi', '14', '123', 'Quang Minh', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1399, '04045', 'c6', 'vi', '14', '123', 'Lóng Sập', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1400, '04048', 'c6', 'vi', '14', '123', 'Vân Hồ', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1401, '04051', 'c6', 'vi', '14', '123', 'Lóng Luông', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1402, '04054', 'c6', 'vi', '14', '123', 'Chiềng Yên', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1403, '04056', 'c6', 'vi', '14', '123', 'Chiềng Xuân', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1404, '04057', 'c6', 'vi', '14', '123', 'Xuân Nha', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1405, '04058', 'c6', 'vi', '14', '123', 'Tân Xuân', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1406, '04060', 'c6', 'vi', '14', '124', 'Yên Châu', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1407, '04063', 'c6', 'vi', '14', '124', 'Chiềng Đông', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1408, '04066', 'c6', 'vi', '14', '124', 'Sập Vạt', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1409, '04069', 'c6', 'vi', '14', '124', 'Chiềng Sàng', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1410, '04072', 'c6', 'vi', '14', '124', 'Chiềng Pằn', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1411, '04075', 'c6', 'vi', '14', '124', 'Viêng Lán', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1412, '04078', 'c6', 'vi', '14', '124', 'Chiềng Hặc', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1413, '04081', 'c6', 'vi', '14', '124', 'Mường Lựm', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1414, '04084', 'c6', 'vi', '14', '124', 'Chiềng On', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1415, '04087', 'c6', 'vi', '14', '124', 'Yên Sơn', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1416, '04090', 'c6', 'vi', '14', '124', 'Chiềng Khoi', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1417, '04093', 'c6', 'vi', '14', '124', 'Tú Nang', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1418, '04096', 'c6', 'vi', '14', '124', 'Lóng Phiêng', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1419, '04099', 'c6', 'vi', '14', '124', 'Phiêng Khoài', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1420, '04102', 'c6', 'vi', '14', '124', 'Chiềng Tương', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1421, '04105', 'c6', 'vi', '14', '125', 'Hát Lót', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1422, '04108', 'c6', 'vi', '14', '125', 'Chiềng Sung', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1423, '04111', 'c6', 'vi', '14', '125', 'Mường Bằng', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1424, '04114', 'c6', 'vi', '14', '125', 'Chiềng Chăn', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1425, '04117', 'c6', 'vi', '14', '125', 'Mương Tranh', 0, 0, 1, 1415954397, 1415954397, 'vi'),
(1426, '04120', 'c6', 'vi', '14', '125', 'Chiềng Ban', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1427, '04123', 'c6', 'vi', '14', '125', 'Chiềng Mung', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1428, '04126', 'c6', 'vi', '14', '125', 'Mường Bon', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1429, '04129', 'c6', 'vi', '14', '125', 'Chiềng Chung', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1430, '04132', 'c6', 'vi', '14', '125', 'Chiềng Mai', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1431, '04135', 'c6', 'vi', '14', '125', 'Hát Lót', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1432, '04136', 'c6', 'vi', '14', '125', 'Nà Bó', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1433, '04138', 'c6', 'vi', '14', '125', 'Cò Nòi', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1434, '04141', 'c6', 'vi', '14', '125', 'Chiềng Nơi', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1435, '04144', 'c6', 'vi', '14', '125', 'Phiêng Cằm', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1436, '04147', 'c6', 'vi', '14', '125', 'Chiềng Dong', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1437, '04150', 'c6', 'vi', '14', '125', 'Chiềng Kheo', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1438, '04153', 'c6', 'vi', '14', '125', 'Chiềng Ve', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1439, '04156', 'c6', 'vi', '14', '125', 'Chiềng Lương', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1440, '04159', 'c6', 'vi', '14', '125', 'Phiêng Pằn', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1441, '04162', 'c6', 'vi', '14', '125', 'Nà Ơt', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1442, '04165', 'c6', 'vi', '14', '125', 'Tà Hộc', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1443, '04168', 'c6', 'vi', '14', '126', 'Sông Mã', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1444, '04171', 'c6', 'vi', '14', '126', 'Bó Sinh', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1445, '04174', 'c6', 'vi', '14', '126', 'Pú Pẩu', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1446, '04177', 'c6', 'vi', '14', '126', 'Chiềng Phung', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1447, '04180', 'c6', 'vi', '14', '126', 'Chiềng En', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1448, '04183', 'c6', 'vi', '14', '126', 'Mường Lầm', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1449, '04186', 'c6', 'vi', '14', '126', 'Nậm Ty', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1450, '04189', 'c6', 'vi', '14', '126', 'Đứa Mòn', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1451, '04192', 'c6', 'vi', '14', '126', 'Yên Hưng', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1452, '04195', 'c6', 'vi', '14', '126', 'Chiềng Sơ', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1453, '04198', 'c6', 'vi', '14', '126', 'Nà Ngựu', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1454, '04201', 'c6', 'vi', '14', '126', 'Nậm Mằn', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1455, '04204', 'c6', 'vi', '14', '126', 'Chiềng Khoong', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1456, '04207', 'c6', 'vi', '14', '126', 'Chiềng Cang', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1457, '04210', 'c6', 'vi', '14', '126', 'Huổi Một', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1458, '04213', 'c6', 'vi', '14', '126', 'Mường Sai', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1459, '04216', 'c6', 'vi', '14', '126', 'Mường Cai', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1460, '04219', 'c6', 'vi', '14', '126', 'Mường Hung', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1461, '04222', 'c6', 'vi', '14', '126', 'Chiềng Khương', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1462, '04225', 'c6', 'vi', '14', '127', 'Sam Kha', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1463, '04228', 'c6', 'vi', '14', '127', 'Púng Bánh', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1464, '04231', 'c6', 'vi', '14', '127', 'Xốp Cộp', 0, 0, 1, 1415954398, 1415954398, 'vi'),
(1465, '04234', 'c6', 'vi', '14', '127', 'Dồm Cang', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1466, '04237', 'c6', 'vi', '14', '127', 'Nậm Lạnh', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1467, '04240', 'c6', 'vi', '14', '127', 'Mường Lèo', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1468, '04243', 'c6', 'vi', '14', '127', 'Mường Và', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1469, '04246', 'c6', 'vi', '14', '127', 'Mường Lạn', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1470, '04249', 'c6', 'vi', '15', '132', 'Yên Thịnh', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1471, '04252', 'c6', 'vi', '15', '132', 'Yên Ninh', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1472, '04255', 'c6', 'vi', '15', '132', 'Minh Tân', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1473, '04258', 'c6', 'vi', '15', '132', 'Nguyễn Thái Học', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1474, '04261', 'c6', 'vi', '15', '132', 'Đồng Tâm', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1475, '04264', 'c6', 'vi', '15', '132', 'Nguyễn Phúc', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1476, '04267', 'c6', 'vi', '15', '132', 'Hồng Hà', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1477, '04270', 'c6', 'vi', '15', '132', 'Minh Bảo', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1478, '04273', 'c6', 'vi', '15', '132', 'Nam Cường', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1479, '04276', 'c6', 'vi', '15', '132', 'Tuy Lộc', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1480, '04279', 'c6', 'vi', '15', '132', 'Tân Thịnh', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1481, '04282', 'c6', 'vi', '15', '133', 'Pú Trạng', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1482, '04285', 'c6', 'vi', '15', '133', 'Trung Tâm', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1483, '04288', 'c6', 'vi', '15', '133', 'Tân An', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1484, '04291', 'c6', 'vi', '15', '133', 'Cầu Thia', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1485, '04294', 'c6', 'vi', '15', '133', 'Nghĩa Lợi', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1486, '04297', 'c6', 'vi', '15', '133', 'Nghĩa Phúc', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1487, '04300', 'c6', 'vi', '15', '133', 'Nghĩa An', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1488, '04303', 'c6', 'vi', '15', '135', 'Yên Thế', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1489, '04306', 'c6', 'vi', '15', '135', 'Tân Phượng', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1490, '04309', 'c6', 'vi', '15', '135', 'Lâm Thượng', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1491, '04312', 'c6', 'vi', '15', '135', 'Khánh Thiện', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1492, '04315', 'c6', 'vi', '15', '135', 'Minh Chuẩn', 0, 0, 1, 1415954399, 1415954399, 'vi'),
(1493, '04318', 'c6', 'vi', '15', '135', 'Mai Sơn', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1494, '04321', 'c6', 'vi', '15', '135', 'Khai Trung', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1495, '04324', 'c6', 'vi', '15', '135', 'Mường Lai', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1496, '04327', 'c6', 'vi', '15', '135', 'An Lạc', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1497, '04330', 'c6', 'vi', '15', '135', 'Minh Xuân', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1498, '04333', 'c6', 'vi', '15', '135', 'Tô Mậu', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1499, '04336', 'c6', 'vi', '15', '135', 'Tân Lĩnh', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1500, '04339', 'c6', 'vi', '15', '135', 'Yên Thắng', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1501, '04342', 'c6', 'vi', '15', '135', 'Khánh Hoà', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1502, '04345', 'c6', 'vi', '15', '135', 'Vĩnh Lạc', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1503, '04348', 'c6', 'vi', '15', '135', 'Liễu Đô', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1504, '04351', 'c6', 'vi', '15', '135', 'Động Quan', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1505, '04354', 'c6', 'vi', '15', '135', 'Tân Lập', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1506, '04357', 'c6', 'vi', '15', '135', 'Minh Tiến', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1507, '04360', 'c6', 'vi', '15', '135', 'Trúc Lâu', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1508, '04363', 'c6', 'vi', '15', '135', 'Phúc Lợi', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1509, '04366', 'c6', 'vi', '15', '135', 'Phan Thanh', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1510, '04369', 'c6', 'vi', '15', '135', 'An Phú', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1511, '04372', 'c6', 'vi', '15', '135', 'Trung Tâm', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1512, '04375', 'c6', 'vi', '15', '136', 'Mậu A', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1513, '04378', 'c6', 'vi', '15', '136', 'Lang Thíp', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1514, '04381', 'c6', 'vi', '15', '136', 'Lâm Giang', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1515, '04384', 'c6', 'vi', '15', '136', 'Châu Quế Thượng', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1516, '04387', 'c6', 'vi', '15', '136', 'Châu Quế Hạ', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1517, '04390', 'c6', 'vi', '15', '136', 'An Bình', 0, 0, 1, 1415954400, 1415954400, 'vi'),
(1518, '04393', 'c6', 'vi', '15', '136', 'Quang Minh', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1519, '04396', 'c6', 'vi', '15', '136', 'Đông An', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1520, '04399', 'c6', 'vi', '15', '136', 'Đông Cuông', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1521, '04402', 'c6', 'vi', '15', '136', 'Phong Dụ Hạ', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1522, '04405', 'c6', 'vi', '15', '136', 'Mậu Đông', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1523, '04408', 'c6', 'vi', '15', '136', 'Ngòi A', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1524, '04411', 'c6', 'vi', '15', '136', 'Xuân Tầm', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1525, '04414', 'c6', 'vi', '15', '136', 'Tân Hợp', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1526, '04417', 'c6', 'vi', '15', '136', 'An Thịnh', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1527, '04420', 'c6', 'vi', '15', '136', 'Yên Thái', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1528, '04423', 'c6', 'vi', '15', '136', 'Phong Dụ Thượng', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1529, '04426', 'c6', 'vi', '15', '136', 'Yên Hợp', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1530, '04429', 'c6', 'vi', '15', '136', 'Đại Sơn', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1531, '04432', 'c6', 'vi', '15', '136', 'Yên Hưng', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1532, '04435', 'c6', 'vi', '15', '136', 'Đại Phác', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1533, '04438', 'c6', 'vi', '15', '136', 'Yên Phú', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1534, '04441', 'c6', 'vi', '15', '136', 'Xuân Ái', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1535, '04444', 'c6', 'vi', '15', '136', 'Hoàng Thắng', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1536, '04447', 'c6', 'vi', '15', '136', 'Viễn Sơn', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1537, '04450', 'c6', 'vi', '15', '136', 'Mỏ Vàng', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1538, '04453', 'c6', 'vi', '15', '136', 'Nà Hẩu', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1539, '04456', 'c6', 'vi', '15', '137', 'Mù Cang Chải', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1540, '04459', 'c6', 'vi', '15', '137', 'Hồ Bốn', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1541, '04462', 'c6', 'vi', '15', '137', 'Nậm Có', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1542, '04465', 'c6', 'vi', '15', '137', 'Khao Mang', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1543, '04468', 'c6', 'vi', '15', '137', 'Mồ Dề', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1544, '04471', 'c6', 'vi', '15', '137', 'Chế Cu Nha', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1545, '04474', 'c6', 'vi', '15', '137', 'Lao Chải', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1546, '04477', 'c6', 'vi', '15', '137', 'Kim Nọi', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1547, '04480', 'c6', 'vi', '15', '137', 'Cao Phạ', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1548, '04483', 'c6', 'vi', '15', '137', 'La Pán Tẩn', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1549, '04486', 'c6', 'vi', '15', '137', 'Dế Xu Phình', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1550, '04489', 'c6', 'vi', '15', '137', 'Chế Tạo', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1551, '04492', 'c6', 'vi', '15', '137', 'Púng Luông', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1552, '04495', 'c6', 'vi', '15', '137', 'Nậm Khắt', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1553, '04498', 'c6', 'vi', '15', '138', 'Cổ Phúc', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1554, '04501', 'c6', 'vi', '15', '138', 'Tân Đồng', 0, 0, 1, 1415954401, 1415954401, 'vi'),
(1555, '04504', 'c6', 'vi', '15', '138', 'Báo Đáp', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1556, '04507', 'c6', 'vi', '15', '138', 'Đào Thịnh', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1557, '04510', 'c6', 'vi', '15', '138', 'Việt Thành', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1558, '04513', 'c6', 'vi', '15', '138', 'Hòa Cuông', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1559, '04516', 'c6', 'vi', '15', '138', 'Minh Quán', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1560, '04519', 'c6', 'vi', '15', '138', 'Quy Mông', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1561, '04522', 'c6', 'vi', '15', '138', 'Cường Thịnh', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1562, '04525', 'c6', 'vi', '15', '138', 'Kiên Thành', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1563, '04528', 'c6', 'vi', '15', '138', 'Nga Quán', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1564, '04531', 'c6', 'vi', '15', '138', 'Y Can', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1565, '04534', 'c6', 'vi', '15', '138', 'Minh Tiến', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1566, '04537', 'c6', 'vi', '15', '138', 'Lương Thịnh', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1567, '04540', 'c6', 'vi', '15', '132', 'Âu Lâu', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1568, '04543', 'c6', 'vi', '15', '132', 'Giới Phiên', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1569, '04546', 'c6', 'vi', '15', '132', 'Hợp Minh', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1570, '04549', 'c6', 'vi', '15', '132', 'Văn Tiến', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1571, '04552', 'c6', 'vi', '15', '132', 'Phúc Lộc', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1572, '04555', 'c6', 'vi', '15', '141', 'Văn Lãng', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1573, '04558', 'c6', 'vi', '15', '132', 'Văn Phú', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1574, '04561', 'c6', 'vi', '15', '138', 'Bảo Hưng', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1575, '04564', 'c6', 'vi', '15', '138', 'Việt Cường', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1576, '04567', 'c6', 'vi', '15', '138', 'Minh Quân', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1577, '04570', 'c6', 'vi', '15', '138', 'Hồng Ca', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1578, '04573', 'c6', 'vi', '15', '138', 'Hưng Thịnh', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1579, '04576', 'c6', 'vi', '15', '138', 'Hưng Khánh', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1580, '04579', 'c6', 'vi', '15', '138', 'Việt Hồng', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1581, '04582', 'c6', 'vi', '15', '138', 'Vân Hội', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1582, '04585', 'c6', 'vi', '15', '139', 'Trạm Tấu', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1583, '04588', 'c6', 'vi', '15', '139', 'Túc Đán', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1584, '04591', 'c6', 'vi', '15', '139', 'Pá Lau', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1585, '04594', 'c6', 'vi', '15', '139', 'Xà Hồ', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1586, '04597', 'c6', 'vi', '15', '139', 'Phình Hồ', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1587, '04600', 'c6', 'vi', '15', '139', 'Trạm Tấu', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1588, '04603', 'c6', 'vi', '15', '139', 'Tà Si Láng', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1589, '04606', 'c6', 'vi', '15', '139', 'Pá Hu', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1590, '04609', 'c6', 'vi', '15', '139', 'Làng Nhì', 0, 0, 1, 1415954402, 1415954402, 'vi'),
(1591, '04612', 'c6', 'vi', '15', '139', 'Bản Công', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1592, '04615', 'c6', 'vi', '15', '139', 'Bản Mù', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1593, '04618', 'c6', 'vi', '15', '139', 'Hát Lừu', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1594, '04621', 'c6', 'vi', '15', '140', 'Nông Trường Liên Sơn', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1595, '04624', 'c6', 'vi', '15', '140', 'Nông Trường Nghĩa Lộ', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1596, '04627', 'c6', 'vi', '15', '140', 'Nông Trường Trần Phú', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1597, '04630', 'c6', 'vi', '15', '140', 'Tú Lệ', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1598, '04633', 'c6', 'vi', '15', '140', 'Nậm Búng', 0, 0, 1, 1415954403, 1415954403, 'vi');
INSERT INTO `location_ward` (`id`, `code`, `area_code`, `country_code`, `province_code`, `district_code`, `title`, `is_extramural`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1599, '04636', 'c6', 'vi', '15', '140', 'Gia Hội', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1600, '04639', 'c6', 'vi', '15', '140', 'Sùng Đô', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1601, '04642', 'c6', 'vi', '15', '140', 'Nậm Mười', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1602, '04645', 'c6', 'vi', '15', '140', 'An Lương', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1603, '04648', 'c6', 'vi', '15', '140', 'Nậm Lành', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1604, '04651', 'c6', 'vi', '15', '140', 'Sơn Lương', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1605, '04654', 'c6', 'vi', '15', '140', 'Suối Quyền', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1606, '04657', 'c6', 'vi', '15', '140', 'Suối Giàng', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1607, '04660', 'c6', 'vi', '15', '140', 'Sơn A', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1608, '04663', 'c6', 'vi', '15', '140', 'Phù Nham', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1609, '04666', 'c6', 'vi', '15', '140', 'Nghĩa Sơn', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1610, '04669', 'c6', 'vi', '15', '140', 'Suối Bu', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1611, '04672', 'c6', 'vi', '15', '140', 'Sơn Thịnh', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1612, '04675', 'c6', 'vi', '15', '140', 'Thanh Lương', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1613, '04678', 'c6', 'vi', '15', '140', 'Hạnh Sơn', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1614, '04681', 'c6', 'vi', '15', '140', 'Phúc Sơn', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1615, '04684', 'c6', 'vi', '15', '140', 'Thạch Lương', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1616, '04687', 'c6', 'vi', '15', '140', 'Đại Lịch', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1617, '04690', 'c6', 'vi', '15', '140', 'Đồng Khê', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1618, '04693', 'c6', 'vi', '15', '140', 'Cát Thịnh', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1619, '04696', 'c6', 'vi', '15', '140', 'Tân Thịnh', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1620, '04699', 'c6', 'vi', '15', '140', 'Chấn Thịnh', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1621, '04702', 'c6', 'vi', '15', '140', 'Bình Thuận', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1622, '04705', 'c6', 'vi', '15', '140', 'Thượng Bằng La', 0, 0, 1, 1415954403, 1415954403, 'vi'),
(1623, '04708', 'c6', 'vi', '15', '140', 'Minh An', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1624, '04711', 'c6', 'vi', '15', '140', 'Nghĩa Tâm', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1625, '04714', 'c6', 'vi', '15', '141', 'Yên Bình', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1626, '04717', 'c6', 'vi', '15', '141', 'Thác Bà', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1627, '04720', 'c6', 'vi', '15', '141', 'Xuân Long', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1628, '04723', 'c6', 'vi', '15', '141', 'Tích Cốc', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1629, '04726', 'c6', 'vi', '15', '141', 'Cảm Nhân', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1630, '04729', 'c6', 'vi', '15', '141', 'Ngọc Chấn', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1631, '04732', 'c6', 'vi', '15', '141', 'Tân Nguyên', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1632, '04735', 'c6', 'vi', '15', '141', 'Phúc Ninh', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1633, '04738', 'c6', 'vi', '15', '141', 'Bảo Ái', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1634, '04741', 'c6', 'vi', '15', '141', 'Mỹ Gia', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1635, '04744', 'c6', 'vi', '15', '141', 'Xuân Lai', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1636, '04747', 'c6', 'vi', '15', '141', 'Mông Sơn', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1637, '04750', 'c6', 'vi', '15', '141', 'Cẩm Ân', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1638, '04753', 'c6', 'vi', '15', '141', 'Yên Thành', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1639, '04756', 'c6', 'vi', '15', '141', 'Tân Hương', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1640, '04759', 'c6', 'vi', '15', '141', 'Phúc An', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1641, '04762', 'c6', 'vi', '15', '141', 'Bạch Hà', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1642, '04765', 'c6', 'vi', '15', '141', 'Vũ Linh', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1643, '04768', 'c6', 'vi', '15', '141', 'Đại Đồng', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1644, '04771', 'c6', 'vi', '15', '141', 'Vĩnh Kiên', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1645, '04774', 'c6', 'vi', '15', '141', 'Yên Bình', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1646, '04777', 'c6', 'vi', '15', '141', 'Thịnh Hưng', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1647, '04780', 'c6', 'vi', '15', '141', 'Hán Đà', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1648, '04783', 'c6', 'vi', '15', '141', 'Phú Thịnh', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1649, '04786', 'c6', 'vi', '15', '141', 'Đại Minh', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1650, '04789', 'c6', 'vi', '17', '148', 'Hòa Bình', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1651, '04792', 'c6', 'vi', '17', '148', 'Tân Hòa', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1652, '04795', 'c6', 'vi', '17', '148', 'Thịnh Lang', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1653, '04798', 'c6', 'vi', '17', '148', 'Hữu Nghị', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1654, '04801', 'c6', 'vi', '17', '148', 'Tân Thịnh', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1655, '04804', 'c6', 'vi', '17', '148', 'Đồng Tiến', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1656, '04807', 'c6', 'vi', '17', '148', 'Phương Lâm', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1657, '04810', 'c6', 'vi', '17', '148', 'Chăm Mát', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1658, '04813', 'c6', 'vi', '17', '148', 'Yên Mông', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1659, '04816', 'c6', 'vi', '17', '148', 'Sủ Ngòi', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1660, '04819', 'c6', 'vi', '17', '148', 'Dân Chủ', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1661, '04822', 'c6', 'vi', '17', '148', 'Thái Thịnh', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1662, '04825', 'c6', 'vi', '17', '148', 'Hoà Bình', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1663, '04828', 'c6', 'vi', '17', '148', 'Thống Nhất', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1664, '04831', 'c6', 'vi', '17', '150', 'Đà Bắc', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1665, '04834', 'c6', 'vi', '17', '150', 'Đồng Nghê', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1666, '04837', 'c6', 'vi', '17', '150', 'Suối Nánh', 0, 0, 1, 1415954404, 1415954404, 'vi'),
(1667, '04840', 'c6', 'vi', '17', '150', 'Giáp Đắt', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1668, '04843', 'c6', 'vi', '17', '150', 'Mường Tuổng', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1669, '04846', 'c6', 'vi', '17', '150', 'Mường Chiềng', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1670, '04849', 'c6', 'vi', '17', '150', 'Tân Pheo', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1671, '04852', 'c6', 'vi', '17', '150', 'Đồng Chum', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1672, '04855', 'c6', 'vi', '17', '150', 'Tân Minh', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1673, '04858', 'c6', 'vi', '17', '150', 'Đoàn Kết', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1674, '04861', 'c6', 'vi', '17', '150', 'Đồng Ruộng', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1675, '04864', 'c6', 'vi', '17', '150', 'Hào Lý', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1676, '04867', 'c6', 'vi', '17', '150', 'Tu Lý', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1677, '04870', 'c6', 'vi', '17', '150', 'Trung Thành', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1678, '04873', 'c6', 'vi', '17', '150', 'Yên Hòa', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1679, '04876', 'c6', 'vi', '17', '150', 'Cao Sơn', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1680, '04879', 'c6', 'vi', '17', '150', 'Toàn Sơn', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1681, '04882', 'c6', 'vi', '17', '156', 'Tân Dân', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1682, '04885', 'c6', 'vi', '17', '150', 'Hiền Lương', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1683, '04888', 'c6', 'vi', '17', '150', 'Tiền Phong', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1684, '04891', 'c6', 'vi', '17', '150', 'Vầy Nưa', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1685, '04894', 'c6', 'vi', '17', '151', 'Kỳ Sơn', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1686, '04897', 'c6', 'vi', '17', '151', 'Hợp Thịnh', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1687, '04900', 'c6', 'vi', '17', '151', 'Phú Minh', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1688, '04903', 'c6', 'vi', '17', '151', 'Hợp Thành', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1689, '04906', 'c6', 'vi', '17', '151', 'Phúc Tiến', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1690, '04909', 'c6', 'vi', '17', '151', 'Dân Hòa', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1691, '04912', 'c6', 'vi', '17', '151', 'Mông Hóa', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1692, '04915', 'c6', 'vi', '17', '151', 'Dân Hạ', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1693, '04918', 'c6', 'vi', '17', '148', 'Trung Minh', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1694, '04921', 'c6', 'vi', '17', '151', 'Độc Lập', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1695, '04924', 'c6', 'vi', '17', '152', 'Lương Sơn', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1696, '04927', 'c6', 'vi', '01', '276', 'Yên Trung', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1697, '04930', 'c6', 'vi', '01', '276', 'Yên Bình', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1698, '04933', 'c6', 'vi', '17', '151', 'Yên Quang', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1699, '04936', 'c6', 'vi', '01', '276', 'Tiến Xuân', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1700, '04939', 'c6', 'vi', '01', '275', 'Đông Xuân', 0, 0, 1, 1415954405, 1415954405, 'vi'),
(1701, '04942', 'c6', 'vi', '17', '152', 'Lâm Sơn', 0, 0, 1, 1415954406, 1415954406, 'vi'),
(1702, '04945', 'c6', 'vi', '17', '152', 'Hòa Sơn', 0, 0, 1, 1415954406, 1415954406, 'vi'),
(1703, '04948', 'c6', 'vi', '17', '152', 'Trường Sơn', 0, 0, 1, 1415954406, 1415954406, 'vi'),
(1704, '04951', 'c6', 'vi', '17', '152', 'Tân Vinh', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1705, '04954', 'c6', 'vi', '17', '152', 'Nhuận Trạch', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1706, '04957', 'c6', 'vi', '17', '152', 'Cao Răm', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1707, '04960', 'c6', 'vi', '17', '152', 'Cư Yên', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1708, '04963', 'c6', 'vi', '17', '152', 'Hợp Hòa', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1709, '04966', 'c6', 'vi', '17', '152', 'Liên Sơn', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1710, '04969', 'c6', 'vi', '17', '152', 'Thành Lập', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1711, '04972', 'c6', 'vi', '17', '152', 'Tiến Sơn', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1712, '04975', 'c6', 'vi', '17', '152', 'Trung Sơn', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1713, '04978', 'c6', 'vi', '17', '153', 'Bo', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1714, '04981', 'c6', 'vi', '17', '159', 'Thanh Hà', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1715, '04984', 'c6', 'vi', '17', '153', 'Đú Sáng', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1716, '04987', 'c6', 'vi', '17', '153', 'Bắc Sơn', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1717, '04990', 'c6', 'vi', '17', '153', 'Bình Sơn', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1718, '04993', 'c6', 'vi', '17', '153', 'Hùng Tiến', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1719, '04996', 'c6', 'vi', '17', '152', 'Tân Thành', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1720, '04999', 'c6', 'vi', '17', '153', 'Tú Sơn', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1721, '05002', 'c6', 'vi', '17', '153', 'Nật Sơn', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1722, '05005', 'c6', 'vi', '17', '153', 'Vĩnh Tiến', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1723, '05008', 'c6', 'vi', '17', '152', 'Cao Dương', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1724, '05011', 'c6', 'vi', '17', '153', 'Sơn Thủy', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1725, '05014', 'c6', 'vi', '17', '153', 'Đông Bắc', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1726, '05017', 'c6', 'vi', '17', '153', 'Thượng Bì', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1727, '05020', 'c6', 'vi', '17', '153', 'Lập Chiệng', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1728, '05023', 'c6', 'vi', '17', '152', 'Hợp Châu', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1729, '05026', 'c6', 'vi', '17', '153', 'Vĩnh Đồng', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1730, '05029', 'c6', 'vi', '17', '153', 'Hạ Bì', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1731, '05032', 'c6', 'vi', '17', '153', 'Trung Bì', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1732, '05035', 'c6', 'vi', '17', '153', 'Kim Sơn', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1733, '05038', 'c6', 'vi', '17', '153', 'Hợp Đồng', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1734, '05041', 'c6', 'vi', '17', '152', 'Long Sơn', 0, 0, 1, 1415954407, 1415954407, 'vi'),
(1735, '05044', 'c6', 'vi', '17', '153', 'Thượng Tiến', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1736, '05047', 'c6', 'vi', '17', '152', 'Cao Thắng', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1737, '05050', 'c6', 'vi', '17', '153', 'Kim Tiến', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1738, '05053', 'c6', 'vi', '17', '153', 'Kim Bình', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1739, '05056', 'c6', 'vi', '17', '153', 'Hợp Kim', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1740, '05059', 'c6', 'vi', '17', '152', 'Thanh Lương', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1741, '05062', 'c6', 'vi', '17', '152', 'Hợp Thanh', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1742, '05065', 'c6', 'vi', '17', '153', 'Kim Bôi', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1743, '05068', 'c6', 'vi', '17', '153', 'Nam Thượng', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1744, '05071', 'c6', 'vi', '17', '153', 'Kim Truy', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1745, '05074', 'c6', 'vi', '17', '159', 'Thanh Nông', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1746, '05077', 'c6', 'vi', '17', '153', 'Cuối Hạ', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1747, '05080', 'c6', 'vi', '17', '153', 'Sào Báy', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1748, '05083', 'c6', 'vi', '17', '153', 'Mi Hòa', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1749, '05086', 'c6', 'vi', '17', '153', 'Nuông Dăm', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1750, '05089', 'c6', 'vi', '17', '154', 'Cao Phong', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1751, '05092', 'c6', 'vi', '17', '154', 'Bình Thanh', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1752, '05095', 'c6', 'vi', '17', '154', 'Thung Nai', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1753, '05098', 'c6', 'vi', '17', '154', 'Bắc Phong', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1754, '05101', 'c6', 'vi', '17', '154', 'Thu Phong', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1755, '05104', 'c6', 'vi', '17', '154', 'Đông Phong', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1756, '05107', 'c6', 'vi', '17', '154', 'Xuân Phong', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1757, '05110', 'c6', 'vi', '17', '154', 'Tây Phong', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1758, '05113', 'c6', 'vi', '17', '154', 'Tân Phong', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1759, '05116', 'c6', 'vi', '17', '154', 'Dũng Phong', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1760, '05119', 'c6', 'vi', '17', '154', 'Nam Phong', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1761, '05122', 'c6', 'vi', '17', '154', 'Yên Lập', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1762, '05125', 'c6', 'vi', '17', '154', 'Yên Thượng', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1763, '05128', 'c6', 'vi', '17', '155', 'Mường Khến', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1764, '05131', 'c6', 'vi', '17', '155', 'Ngòi Hoa', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1765, '05134', 'c6', 'vi', '17', '155', 'Trung Hòa', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1766, '05137', 'c6', 'vi', '17', '155', 'Phú Vinh', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1767, '05140', 'c6', 'vi', '17', '155', 'Phú Cường', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1768, '05143', 'c6', 'vi', '17', '155', 'Mỹ Hòa', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1769, '05146', 'c6', 'vi', '17', '155', 'Quy Hậu', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1770, '05149', 'c6', 'vi', '17', '155', 'Phong Phú', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1771, '05152', 'c6', 'vi', '17', '155', 'Quyết Chiến', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1772, '05155', 'c6', 'vi', '17', '155', 'Mãn Đức', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1773, '05158', 'c6', 'vi', '17', '155', 'Địch Giáo', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1774, '05161', 'c6', 'vi', '17', '155', 'Tuân Lộ', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1775, '05164', 'c6', 'vi', '17', '155', 'Tử Nê', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1776, '05167', 'c6', 'vi', '17', '155', 'Thanh Hối', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1777, '05170', 'c6', 'vi', '17', '155', 'Ngọc Mỹ', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1778, '05173', 'c6', 'vi', '17', '155', 'Đông Lai', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1779, '05176', 'c6', 'vi', '17', '155', 'Lũng Vân', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1780, '05179', 'c6', 'vi', '17', '155', 'Bắc Sơn', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1781, '05182', 'c6', 'vi', '17', '155', 'Quy Mỹ', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1782, '05185', 'c6', 'vi', '17', '155', 'Do Nhân', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1783, '05188', 'c6', 'vi', '17', '155', 'Nam Sơn', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1784, '05191', 'c6', 'vi', '17', '155', 'Lỗ Sơn', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1785, '05194', 'c6', 'vi', '17', '155', 'Ngổ Luông', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1786, '05197', 'c6', 'vi', '17', '155', 'Gia Mô', 0, 0, 1, 1415954408, 1415954408, 'vi'),
(1787, '05200', 'c6', 'vi', '17', '156', 'Mai Châu', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1788, '05203', 'c6', 'vi', '17', '156', 'Tân Mai', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1789, '05206', 'c6', 'vi', '17', '156', 'Phúc Sạn', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1790, '05209', 'c6', 'vi', '17', '156', 'Pà Cò', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1791, '05212', 'c6', 'vi', '17', '156', 'Hang Kia', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1792, '05215', 'c6', 'vi', '17', '156', 'Ba Khan', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1793, '05218', 'c6', 'vi', '17', '156', 'Tân Sơn', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1794, '05221', 'c6', 'vi', '17', '156', 'Đồng Bảng', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1795, '05224', 'c6', 'vi', '17', '156', 'Cun Pheo', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1796, '05227', 'c6', 'vi', '17', '156', 'Bao La', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1797, '05230', 'c6', 'vi', '17', '156', 'Piềng Vế', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1798, '05233', 'c6', 'vi', '17', '156', 'Tòng Đậu', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1799, '05236', 'c6', 'vi', '17', '156', 'Nà Mèo', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1800, '05239', 'c6', 'vi', '17', '156', 'Thung Khe', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1801, '05242', 'c6', 'vi', '17', '156', 'Nà Phòn', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1802, '05245', 'c6', 'vi', '17', '156', 'Săm Khóe', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1803, '05248', 'c6', 'vi', '17', '156', 'Chiềng Châu', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1804, '05251', 'c6', 'vi', '17', '156', 'Mai Hạ', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1805, '05254', 'c6', 'vi', '17', '156', 'Nong Luông', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1806, '05257', 'c6', 'vi', '17', '156', 'Mai Hịch', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1807, '05260', 'c6', 'vi', '17', '156', 'Pù Pin', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1808, '05263', 'c6', 'vi', '17', '156', 'Vạn Mai', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1809, '05266', 'c6', 'vi', '17', '157', 'Vụ Bản', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1810, '05269', 'c6', 'vi', '17', '157', 'Quý Hòa', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1811, '05272', 'c6', 'vi', '17', '157', 'Miền Đồi', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1812, '05275', 'c6', 'vi', '17', '157', 'Mỹ Thành', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1813, '05278', 'c6', 'vi', '17', '157', 'Tuân Đạo', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1814, '05281', 'c6', 'vi', '17', '157', 'Văn Nghĩa', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1815, '05284', 'c6', 'vi', '17', '157', 'Văn Sơn', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1816, '05287', 'c6', 'vi', '17', '157', 'Tân Lập', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1817, '05290', 'c6', 'vi', '17', '157', 'Nhân Nghĩa', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1818, '05293', 'c6', 'vi', '17', '157', 'Thượng Cốc', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1819, '05296', 'c6', 'vi', '17', '157', 'Phú Lương', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1820, '05299', 'c6', 'vi', '17', '157', 'Phúc Tuy', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1821, '05302', 'c6', 'vi', '17', '157', 'Xuất Hóa', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1822, '05305', 'c6', 'vi', '17', '157', 'Yên Phú', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1823, '05308', 'c6', 'vi', '17', '157', 'Bình Hẻm', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1824, '05311', 'c6', 'vi', '17', '157', 'Chí Thiện', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1825, '05314', 'c6', 'vi', '17', '157', 'Bình Cảng', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1826, '05317', 'c6', 'vi', '17', '157', 'Bình Chân', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1827, '05320', 'c6', 'vi', '17', '157', 'Định Cư', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1828, '05323', 'c6', 'vi', '17', '157', 'Chí Đạo', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1829, '05326', 'c6', 'vi', '17', '157', 'Liên Vũ', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1830, '05329', 'c6', 'vi', '17', '157', 'Ngọc Sơn', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1831, '05332', 'c6', 'vi', '17', '157', 'Hương Nhượng', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1832, '05335', 'c6', 'vi', '17', '157', 'Vũ Lâm', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1833, '05338', 'c6', 'vi', '17', '157', 'Tự Do', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1834, '05341', 'c6', 'vi', '17', '157', 'Yên Nghiệp', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1835, '05344', 'c6', 'vi', '17', '157', 'Tân Mỹ', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1836, '05347', 'c6', 'vi', '17', '157', 'Ân Nghĩa', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1837, '05350', 'c6', 'vi', '17', '157', 'Ngọc Lâu', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1838, '05353', 'c6', 'vi', '17', '158', 'Hàng Trạm', 0, 0, 1, 1415954409, 1415954409, 'vi'),
(1839, '05356', 'c6', 'vi', '17', '158', 'Lạc Sỹ', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1840, '05359', 'c6', 'vi', '17', '158', 'Lạc Hưng', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1841, '05362', 'c6', 'vi', '17', '158', 'Lạc Lương', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1842, '05365', 'c6', 'vi', '17', '158', 'Bảo Hiệu', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1843, '05368', 'c6', 'vi', '17', '158', 'Đa Phúc', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1844, '05371', 'c6', 'vi', '17', '158', 'Hữu Lợi', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1845, '05374', 'c6', 'vi', '17', '158', 'Lạc Thịnh', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1846, '05377', 'c6', 'vi', '17', '158', 'Yên Lạc', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1847, '05380', 'c6', 'vi', '17', '158', 'Đoàn Kết', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1848, '05383', 'c6', 'vi', '17', '158', 'Phú Lai', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1849, '05386', 'c6', 'vi', '17', '158', 'Yên Trị', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1850, '05389', 'c6', 'vi', '17', '158', 'Ngọc Lương', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1851, '05392', 'c6', 'vi', '17', '159', 'Chi Nê', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1852, '05395', 'c6', 'vi', '17', '159', 'Phú Lão', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1853, '05398', 'c6', 'vi', '17', '159', 'Phú Thành', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1854, '05401', 'c6', 'vi', '17', '159', 'Cố Nghĩa', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1855, '05404', 'c6', 'vi', '17', '159', 'Hưng Thi', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1856, '05407', 'c6', 'vi', '17', '159', 'Lạc Long', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1857, '05410', 'c6', 'vi', '17', '159', 'Liên Hòa', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1858, '05413', 'c6', 'vi', '17', '159', 'Khoan Dụ', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1859, '05416', 'c6', 'vi', '17', '159', 'Đồng Môn', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1860, '05419', 'c6', 'vi', '17', '159', 'Đồng Tâm', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1861, '05422', 'c6', 'vi', '17', '159', 'Yên Bồng', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1862, '05425', 'c6', 'vi', '17', '159', 'An Lạc', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1863, '05428', 'c6', 'vi', '17', '159', 'An Bình', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1864, '05431', 'c6', 'vi', '19', '164', 'Quán Triều', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1865, '05434', 'c6', 'vi', '19', '164', 'Quang Vinh', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1866, '05437', 'c6', 'vi', '19', '164', 'Túc Duyên', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1867, '05440', 'c6', 'vi', '19', '164', 'Hoàng Văn Thụ', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1868, '05443', 'c6', 'vi', '19', '164', 'Trưng Vương', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1869, '05446', 'c6', 'vi', '19', '164', 'Quang Trung', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1870, '05449', 'c6', 'vi', '19', '164', 'Phan Đình Phùng', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1871, '05452', 'c6', 'vi', '19', '164', 'Tân Thịnh', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1872, '05455', 'c6', 'vi', '19', '164', 'Thịnh Đán', 0, 0, 1, 1415954410, 1415954410, 'vi'),
(1873, '05458', 'c6', 'vi', '19', '164', 'Đồng Quang', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1874, '05461', 'c6', 'vi', '19', '164', 'Gia Sàng', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1875, '05464', 'c6', 'vi', '19', '164', 'Tân Lập', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1876, '05467', 'c6', 'vi', '19', '164', 'Cam Giá', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1877, '05470', 'c6', 'vi', '19', '164', 'Phú Xá', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1878, '05473', 'c6', 'vi', '19', '164', 'Hương Sơn', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1879, '05476', 'c6', 'vi', '19', '164', 'Trung Thành', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1880, '05479', 'c6', 'vi', '19', '164', 'Tân Thành', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1881, '05482', 'c6', 'vi', '19', '164', 'Tân Long', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1882, '05485', 'c6', 'vi', '19', '164', 'Phúc Hà', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1883, '05488', 'c6', 'vi', '19', '164', 'Phúc Xuân', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1884, '05491', 'c6', 'vi', '19', '164', 'Quyết Thắng', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1885, '05494', 'c6', 'vi', '19', '164', 'Phúc Trìu', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1886, '05497', 'c6', 'vi', '19', '164', 'Thịnh Đức', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1887, '05500', 'c6', 'vi', '19', '164', 'Tích Lương', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1888, '05503', 'c6', 'vi', '19', '164', 'Tân Cương', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1889, '05506', 'c6', 'vi', '19', '164', 'Lương Sơn', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1890, '05509', 'c6', 'vi', '19', '165', 'Lương Châu', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1891, '05512', 'c6', 'vi', '19', '165', 'Mỏ Chè', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1892, '05515', 'c6', 'vi', '19', '165', 'Cải Đan', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1893, '05518', 'c6', 'vi', '19', '165', 'Thắng Lợi', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1894, '05521', 'c6', 'vi', '19', '165', 'Phố Cò', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1895, '05524', 'c6', 'vi', '19', '165', 'Vinh Sơn', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1896, '05527', 'c6', 'vi', '19', '165', 'Tân Quang', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1897, '05530', 'c6', 'vi', '19', '165', 'Bình Sơn', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1898, '05533', 'c6', 'vi', '19', '165', 'Bá Xuyên', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1899, '05536', 'c6', 'vi', '19', '167', 'Chợ Chu', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1900, '05539', 'c6', 'vi', '19', '167', 'Linh Thông', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1901, '05542', 'c6', 'vi', '19', '167', 'Lam Vỹ', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1902, '05545', 'c6', 'vi', '19', '167', 'Quy Kỳ', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1903, '05548', 'c6', 'vi', '19', '167', 'Tân Thịnh', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1904, '05551', 'c6', 'vi', '19', '167', 'Kim Phượng', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1905, '05554', 'c6', 'vi', '19', '167', 'Bảo Linh', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1906, '05557', 'c6', 'vi', '19', '167', 'Kim Sơn', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1907, '05560', 'c6', 'vi', '19', '167', 'Phúc Chu', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1908, '05563', 'c6', 'vi', '19', '167', 'Tân Dương', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1909, '05566', 'c6', 'vi', '19', '167', 'Phượng Tiến', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1910, '05569', 'c6', 'vi', '19', '167', 'Bảo Cường', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1911, '05572', 'c6', 'vi', '19', '167', 'Đồng Thịnh', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1912, '05575', 'c6', 'vi', '19', '167', 'Định Biên', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1913, '05578', 'c6', 'vi', '19', '167', 'Thanh Định', 0, 0, 1, 1415954411, 1415954411, 'vi'),
(1914, '05581', 'c6', 'vi', '19', '167', 'Trung Hội', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1915, '05584', 'c6', 'vi', '19', '167', 'Trung Lương', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1916, '05587', 'c6', 'vi', '19', '167', 'Bình Yên', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1917, '05590', 'c6', 'vi', '19', '167', 'Điềm Mặc', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1918, '05593', 'c6', 'vi', '19', '167', 'Phú Tiến', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1919, '05596', 'c6', 'vi', '19', '167', 'Bộc Nhiêu', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1920, '05599', 'c6', 'vi', '19', '167', 'Sơn Phú', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1921, '05602', 'c6', 'vi', '19', '167', 'Phú Đình', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1922, '05605', 'c6', 'vi', '19', '167', 'Bình Thành', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1923, '05608', 'c6', 'vi', '19', '168', 'Giang Tiên', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1924, '05611', 'c6', 'vi', '19', '168', 'Đu', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1925, '05614', 'c6', 'vi', '19', '168', 'Yên Ninh', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1926, '05617', 'c6', 'vi', '19', '168', 'Yên Trạch', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1927, '05620', 'c6', 'vi', '19', '168', 'Yên Đổ', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1928, '05623', 'c6', 'vi', '19', '168', 'Yên Lạc', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1929, '05626', 'c6', 'vi', '19', '168', 'Ôn Lương', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1930, '05629', 'c6', 'vi', '19', '168', 'Động Đạt', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1931, '05632', 'c6', 'vi', '19', '168', 'Phủ Lý', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1932, '05635', 'c6', 'vi', '19', '168', 'Phú Đô', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1933, '05638', 'c6', 'vi', '19', '168', 'Hợp Thành', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1934, '05641', 'c6', 'vi', '19', '168', 'Tức Tranh', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1935, '05644', 'c6', 'vi', '19', '168', 'Phấn Mễ', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1936, '05647', 'c6', 'vi', '19', '168', 'Vô Tranh', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1937, '05650', 'c6', 'vi', '19', '168', 'Cổ Lũng', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1938, '05653', 'c6', 'vi', '19', '168', 'Sơn Cẩm', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1939, '05656', 'c6', 'vi', '19', '169', 'Sông Cầu', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1940, '05659', 'c6', 'vi', '19', '169', 'Chùa Hang', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1941, '05662', 'c6', 'vi', '19', '169', 'Trại Cau', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1942, '05665', 'c6', 'vi', '19', '169', 'Văn Lăng', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1943, '05668', 'c6', 'vi', '19', '169', 'Tân Long', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1944, '05671', 'c6', 'vi', '19', '169', 'Hòa Bình', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1945, '05674', 'c6', 'vi', '19', '169', 'Quang Sơn', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1946, '05677', 'c6', 'vi', '19', '169', 'Minh Lập', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1947, '05680', 'c6', 'vi', '19', '169', 'Văn Hán', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1948, '05683', 'c6', 'vi', '19', '169', 'Hóa Trung', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1949, '05686', 'c6', 'vi', '19', '169', 'Khe Mo', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1950, '05689', 'c6', 'vi', '19', '169', 'Cây Thị', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1951, '05692', 'c6', 'vi', '19', '169', 'Hóa Thượng', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1952, '05695', 'c6', 'vi', '19', '164', 'Cao Ngạn', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1953, '05698', 'c6', 'vi', '19', '169', 'Hợp Tiến', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1954, '05701', 'c6', 'vi', '19', '169', 'Linh Sơn', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1955, '05704', 'c6', 'vi', '19', '169', 'Tân Lợi', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1956, '05707', 'c6', 'vi', '19', '169', 'Nam Hòa', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1957, '05710', 'c6', 'vi', '19', '164', 'Đồng Bẩm', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1958, '05713', 'c6', 'vi', '19', '169', 'Huống Thượng', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1959, '05716', 'c6', 'vi', '19', '170', 'Đình Cả', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1960, '05719', 'c6', 'vi', '19', '170', 'Sảng Mộc', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1961, '05722', 'c6', 'vi', '19', '170', 'Nghinh Tường', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1962, '05725', 'c6', 'vi', '19', '170', 'Thần Xa', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1963, '05728', 'c6', 'vi', '19', '170', 'Vũ Chấn', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1964, '05731', 'c6', 'vi', '19', '170', 'Thượng Nung', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1965, '05734', 'c6', 'vi', '19', '170', 'Phú Thượng', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1966, '05737', 'c6', 'vi', '19', '170', 'Cúc Đường', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1967, '05740', 'c6', 'vi', '19', '170', 'La Hiên', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1968, '05743', 'c6', 'vi', '19', '170', 'Lâu Thượng', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1969, '05746', 'c6', 'vi', '19', '170', 'Tràng Xá', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1970, '05749', 'c6', 'vi', '19', '170', 'Phương Giao', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1971, '05752', 'c6', 'vi', '19', '170', 'Liên Minh', 0, 0, 1, 1415954412, 1415954412, 'vi'),
(1972, '05755', 'c6', 'vi', '19', '170', 'Dân Tiến', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1973, '05758', 'c6', 'vi', '19', '170', 'Bình Long', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1974, '05761', 'c6', 'vi', '19', '171', 'Đại Từ', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1975, '05764', 'c6', 'vi', '19', '171', 'Quân Chu', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1976, '05767', 'c6', 'vi', '19', '171', 'Phúc Lương', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1977, '05770', 'c6', 'vi', '19', '171', 'Minh Tiến', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1978, '05773', 'c6', 'vi', '19', '171', 'Yên Lãng', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1979, '05776', 'c6', 'vi', '19', '171', 'Đức Lương', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1980, '05779', 'c6', 'vi', '19', '171', 'Phú Cường', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1981, '05782', 'c6', 'vi', '19', '171', 'Na Mao', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1982, '05785', 'c6', 'vi', '19', '171', 'Phú Lạc', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1983, '05788', 'c6', 'vi', '19', '171', 'Tân Linh', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1984, '05791', 'c6', 'vi', '19', '171', 'Phú Thịnh', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1985, '05794', 'c6', 'vi', '19', '171', 'Phục Linh', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1986, '05797', 'c6', 'vi', '19', '171', 'Phú Xuyên', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1987, '05800', 'c6', 'vi', '19', '171', 'Bản Ngoại', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1988, '05803', 'c6', 'vi', '19', '171', 'Tiên Hội', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1989, '05806', 'c6', 'vi', '19', '171', 'Hùng Sơn', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1990, '05809', 'c6', 'vi', '19', '171', 'Cù Vân', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1991, '05812', 'c6', 'vi', '19', '171', 'Hà Thượng', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1992, '05815', 'c6', 'vi', '19', '171', 'La Bằng', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1993, '05818', 'c6', 'vi', '19', '171', 'Hoàng Nông', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1994, '05821', 'c6', 'vi', '19', '171', 'Khôi Kỳ', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1995, '05824', 'c6', 'vi', '19', '171', 'An Khánh', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1996, '05827', 'c6', 'vi', '19', '171', 'Tân Thái', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1997, '05830', 'c6', 'vi', '19', '171', 'Bình Thuận', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1998, '05833', 'c6', 'vi', '19', '171', 'Lục Ba', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(1999, '05836', 'c6', 'vi', '19', '171', 'Mỹ Yên', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(2000, '05839', 'c6', 'vi', '19', '171', 'Vạn Thọ', 0, 0, 1, 1415954413, 1415954413, 'vi'),
(2001, '05842', 'c6', 'vi', '19', '171', 'Văn Yên', 0, 0, 1, 1415954436, 1415954436, 'vi'),
(2002, '05845', 'c6', 'vi', '19', '171', 'Ký Phú', 0, 0, 1, 1415954436, 1415954436, 'vi'),
(2003, '05848', 'c6', 'vi', '19', '171', 'Cát Nê', 0, 0, 1, 1415954436, 1415954436, 'vi'),
(2004, '05851', 'c6', 'vi', '19', '171', 'Quân Chu', 0, 0, 1, 1415954436, 1415954436, 'vi'),
(2005, '05854', 'c6', 'vi', '19', '172', 'Bãi Bông', 0, 0, 1, 1415954436, 1415954436, 'vi'),
(2006, '05857', 'c6', 'vi', '19', '172', 'Bắc Sơn', 0, 0, 1, 1415954436, 1415954436, 'vi'),
(2007, '05860', 'c6', 'vi', '19', '172', 'Ba Hàng', 0, 0, 1, 1415954436, 1415954436, 'vi'),
(2008, '05863', 'c6', 'vi', '19', '172', 'Phúc Tân', 0, 0, 1, 1415954436, 1415954436, 'vi'),
(2009, '05866', 'c6', 'vi', '19', '172', 'Phúc Thuận', 0, 0, 1, 1415954436, 1415954436, 'vi'),
(2010, '05869', 'c6', 'vi', '19', '172', 'Hồng Tiến', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2011, '05872', 'c6', 'vi', '19', '172', 'Minh Đức', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2012, '05875', 'c6', 'vi', '19', '172', 'Đắc Sơn', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2013, '05878', 'c6', 'vi', '19', '172', 'Đồng Tiến', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2014, '05881', 'c6', 'vi', '19', '172', 'Thành Công', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2015, '05884', 'c6', 'vi', '19', '172', 'Tiên Phong', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2016, '05887', 'c6', 'vi', '19', '172', 'Vạn Phái', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2017, '05890', 'c6', 'vi', '19', '172', 'Nam Tiến', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2018, '05893', 'c6', 'vi', '19', '172', 'Tân Hương', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2019, '05896', 'c6', 'vi', '19', '172', 'Đông Cao', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2020, '05899', 'c6', 'vi', '19', '172', 'Trung Thành', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2021, '05902', 'c6', 'vi', '19', '172', 'Tân Phú', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2022, '05905', 'c6', 'vi', '19', '172', 'Thuận Thành', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2023, '05908', 'c6', 'vi', '19', '173', 'Hương Sơn', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2024, '05911', 'c6', 'vi', '19', '173', 'Bàn Đạt', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2025, '05914', 'c6', 'vi', '19', '173', 'Đồng Liên', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2026, '05917', 'c6', 'vi', '19', '173', 'Tân Khánh', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2027, '05920', 'c6', 'vi', '19', '173', 'Tân Kim', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2028, '05923', 'c6', 'vi', '19', '173', 'Tân Thành', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2029, '05926', 'c6', 'vi', '19', '173', 'Đào Xá', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2030, '05929', 'c6', 'vi', '19', '173', 'Bảo Lý', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2031, '05932', 'c6', 'vi', '19', '173', 'Thượng Đình', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2032, '05935', 'c6', 'vi', '19', '173', 'Tân Hòa', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2033, '05938', 'c6', 'vi', '19', '173', 'Nhã Lộng', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2034, '05941', 'c6', 'vi', '19', '173', 'Điềm Thụy', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2035, '05944', 'c6', 'vi', '19', '173', 'Xuân Phương', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2036, '05947', 'c6', 'vi', '19', '173', 'Tân Đức', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2037, '05950', 'c6', 'vi', '19', '173', 'Úc Kỳ', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2038, '05953', 'c6', 'vi', '19', '173', 'Lương Phú', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2039, '05956', 'c6', 'vi', '19', '173', 'Nga My', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2040, '05959', 'c6', 'vi', '19', '173', 'Kha Sơn', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2041, '05962', 'c6', 'vi', '19', '173', 'Thanh Ninh', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2042, '05965', 'c6', 'vi', '19', '173', 'Dương Thành', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2043, '05968', 'c6', 'vi', '19', '173', 'Hà Châu', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2044, '05971', 'c6', 'vi', '20', '178', 'Hoàng Văn Thụ', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2045, '05974', 'c6', 'vi', '20', '178', 'Tam Thanh', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2046, '05977', 'c6', 'vi', '20', '178', 'Vĩnh Trại', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2047, '05980', 'c6', 'vi', '20', '178', 'Đông Kinh', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2048, '05983', 'c6', 'vi', '20', '178', 'Chi Lăng', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2049, '05986', 'c6', 'vi', '20', '178', 'Hoàng Đồng', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2050, '05989', 'c6', 'vi', '20', '178', 'Quảng Lạc', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2051, '05992', 'c6', 'vi', '20', '178', 'Mai Pha', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2052, '05995', 'c6', 'vi', '20', '180', 'Thất Khê', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2053, '05998', 'c6', 'vi', '20', '180', 'Khánh Long', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2054, '06001', 'c6', 'vi', '20', '180', 'Đoàn Kết', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2055, '06004', 'c6', 'vi', '20', '180', 'Quốc Khánh', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2056, '06007', 'c6', 'vi', '20', '180', 'Vĩnh Tiến', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2057, '06010', 'c6', 'vi', '20', '180', 'Cao Minh', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2058, '06013', 'c6', 'vi', '20', '180', 'Chí Minh', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2059, '06016', 'c6', 'vi', '20', '180', 'Tri Phương', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2060, '06019', 'c6', 'vi', '20', '180', 'Tân Tiến', 0, 0, 1, 1415954437, 1415954437, 'vi'),
(2061, '06022', 'c6', 'vi', '20', '180', 'Tân Yên', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2062, '06025', 'c6', 'vi', '20', '180', 'Đội Cấn', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2063, '06028', 'c6', 'vi', '20', '180', 'Tân Minh', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2064, '06031', 'c6', 'vi', '20', '180', 'Kim Đồng', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2065, '06034', 'c6', 'vi', '20', '180', 'Chi Lăng', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2066, '06037', 'c6', 'vi', '20', '180', 'Trung Thành', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2067, '06040', 'c6', 'vi', '20', '180', 'Đại Đồng', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2068, '06043', 'c6', 'vi', '20', '180', 'Đào Viên', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2069, '06046', 'c6', 'vi', '20', '180', 'Đề Thám', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2070, '06049', 'c6', 'vi', '20', '180', 'Kháng Chiến', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2071, '06052', 'c6', 'vi', '20', '180', 'Bắc Ái', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2072, '06055', 'c6', 'vi', '20', '180', 'Hùng Sơn', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2073, '06058', 'c6', 'vi', '20', '180', 'Quốc Việt', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2074, '06061', 'c6', 'vi', '20', '180', 'Hùng Việt', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2075, '06064', 'c6', 'vi', '20', '181', 'Bình Gia', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2076, '06067', 'c6', 'vi', '20', '181', 'Hưng Đạo', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2077, '06070', 'c6', 'vi', '20', '181', 'Vĩnh Yên', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2078, '06073', 'c6', 'vi', '20', '181', 'Hoa Thám', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2079, '06076', 'c6', 'vi', '20', '181', 'Quý Hòa', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2080, '06079', 'c6', 'vi', '20', '181', 'Hồng Phong', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2081, '06082', 'c6', 'vi', '20', '181', 'Yên Lỗ', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2082, '06085', 'c6', 'vi', '20', '181', 'Thiện Hòa', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2083, '06088', 'c6', 'vi', '20', '181', 'Quang Trung', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2084, '06091', 'c6', 'vi', '20', '181', 'Thiện Thuật', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2085, '06094', 'c6', 'vi', '20', '181', 'Minh Khai', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2086, '06097', 'c6', 'vi', '20', '181', 'Thiện Long', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2087, '06100', 'c6', 'vi', '20', '181', 'Hoàng Văn Thụ', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2088, '06103', 'c6', 'vi', '20', '181', 'Hòa Bình', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2089, '06106', 'c6', 'vi', '20', '181', 'Mông Ân', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2090, '06109', 'c6', 'vi', '20', '181', 'Tân Hòa', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2091, '06112', 'c6', 'vi', '20', '181', 'Tô Hiệu', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2092, '06115', 'c6', 'vi', '20', '181', 'Hồng Thái', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2093, '06118', 'c6', 'vi', '20', '181', 'Bình La', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2094, '06121', 'c6', 'vi', '20', '181', 'Tân Văn', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2095, '06124', 'c6', 'vi', '20', '182', 'Na Sầm', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2096, '06127', 'c6', 'vi', '20', '182', 'Trùng Khánh', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2097, '06130', 'c6', 'vi', '20', '182', 'Tân Việt', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2098, '06133', 'c6', 'vi', '20', '182', 'Bắc La', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2099, '06136', 'c6', 'vi', '20', '182', 'Thụy Hùng', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2100, '06139', 'c6', 'vi', '20', '182', 'Trùng Quán', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2101, '06142', 'c6', 'vi', '20', '182', 'Tân Tác', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2102, '06145', 'c6', 'vi', '20', '182', 'An Hùng', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2103, '06148', 'c6', 'vi', '20', '182', 'Thanh Long', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2104, '06151', 'c6', 'vi', '20', '182', 'Hội Hoan', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2105, '06154', 'c6', 'vi', '20', '182', 'Tân Lang', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2106, '06157', 'c6', 'vi', '20', '182', 'Hoàng Việt', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2107, '06160', 'c6', 'vi', '20', '182', 'Gia Miễn', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2108, '06163', 'c6', 'vi', '20', '182', 'Thành Hòa', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2109, '06166', 'c6', 'vi', '20', '182', 'Tân Thanh', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2110, '06169', 'c6', 'vi', '20', '182', 'Nam La', 0, 0, 1, 1415954438, 1415954438, 'vi'),
(2111, '06172', 'c6', 'vi', '20', '182', 'Tân Mỹ', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2112, '06175', 'c6', 'vi', '20', '182', 'Hồng Thái', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2113, '06178', 'c6', 'vi', '20', '182', 'Hoàng Văn Thụ', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2114, '06181', 'c6', 'vi', '20', '182', 'Nhạc Kỳ', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2115, '06184', 'c6', 'vi', '20', '183', 'Đồng Đăng', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2116, '06187', 'c6', 'vi', '20', '183', 'Cao Lộc', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2117, '06190', 'c6', 'vi', '20', '183', 'Bảo Lâm', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2118, '06193', 'c6', 'vi', '20', '183', 'Thanh Loà', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2119, '06196', 'c6', 'vi', '20', '183', 'Cao Lâu', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2120, '06199', 'c6', 'vi', '20', '183', 'Thạch Đạn', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2121, '06202', 'c6', 'vi', '20', '183', 'Xuất Lễ', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2122, '06205', 'c6', 'vi', '20', '183', 'Hồng Phong', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2123, '06208', 'c6', 'vi', '20', '183', 'Thụy Hùng', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2124, '06211', 'c6', 'vi', '20', '183', 'Lộc Yên', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2125, '06214', 'c6', 'vi', '20', '183', 'Phú Xá', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2126, '06217', 'c6', 'vi', '20', '183', 'Bình Trung', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2127, '06220', 'c6', 'vi', '20', '183', 'Hải Yến', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2128, '06223', 'c6', 'vi', '20', '183', 'Hòa Cư', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2129, '06226', 'c6', 'vi', '20', '183', 'Hợp Thành', 0, 0, 1, 1415954439, 1415954439, 'vi');
INSERT INTO `location_ward` (`id`, `code`, `area_code`, `country_code`, `province_code`, `district_code`, `title`, `is_extramural`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(2130, '06229', 'c6', 'vi', '20', '183', 'Song Giáp', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2131, '06232', 'c6', 'vi', '20', '183', 'Công Sơn', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2132, '06235', 'c6', 'vi', '20', '183', 'Gia Cát', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2133, '06238', 'c6', 'vi', '20', '183', 'Mẫu Sơn', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2134, '06241', 'c6', 'vi', '20', '183', 'Xuân Long', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2135, '06244', 'c6', 'vi', '20', '183', 'Tân Liên', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2136, '06247', 'c6', 'vi', '20', '183', 'Yên Trạch', 0, 0, 1, 1415954439, 1415954439, 'vi'),
(2137, '06250', 'c6', 'vi', '20', '183', 'Tân Thành', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2138, '06253', 'c6', 'vi', '20', '184', 'Văn Quan', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2139, '06256', 'c6', 'vi', '20', '184', 'Trấn Ninh', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2140, '06259', 'c6', 'vi', '20', '184', 'Phú Mỹ', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2141, '06262', 'c6', 'vi', '20', '184', 'Việt Yên', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2142, '06265', 'c6', 'vi', '20', '184', 'Song Giang', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2143, '06268', 'c6', 'vi', '20', '184', 'Vân Mộng', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2144, '06271', 'c6', 'vi', '20', '184', 'Vĩnh Lại', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2145, '06274', 'c6', 'vi', '20', '184', 'Hòa Bình', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2146, '06277', 'c6', 'vi', '20', '184', 'Tú Xuyên', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2147, '06280', 'c6', 'vi', '20', '184', 'Văn An', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2148, '06283', 'c6', 'vi', '20', '184', 'Đại An', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2149, '06286', 'c6', 'vi', '20', '184', 'Khánh Khê', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2150, '06289', 'c6', 'vi', '20', '184', 'Chu Túc', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2151, '06292', 'c6', 'vi', '20', '184', 'Lương Năng', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2152, '06295', 'c6', 'vi', '20', '184', 'Đồng Giáp', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2153, '06298', 'c6', 'vi', '20', '184', 'Xuân Mai', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2154, '06301', 'c6', 'vi', '20', '184', 'Tràng Các', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2155, '06304', 'c6', 'vi', '20', '184', 'Tràng Sơn', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2156, '06307', 'c6', 'vi', '20', '184', 'Tân Đoàn', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2157, '06310', 'c6', 'vi', '20', '184', 'Bình Phúc', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2158, '06313', 'c6', 'vi', '20', '184', 'Tri Lễ', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2159, '06316', 'c6', 'vi', '20', '184', 'Tràng Phái', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2160, '06319', 'c6', 'vi', '20', '184', 'Yên Phúc', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2161, '06322', 'c6', 'vi', '20', '184', 'Hữu Lễ', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2162, '06325', 'c6', 'vi', '20', '185', 'Bắc Sơn', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2163, '06328', 'c6', 'vi', '20', '185', 'Long Đống', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2164, '06331', 'c6', 'vi', '20', '185', 'Vạn Thủy', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2165, '06334', 'c6', 'vi', '20', '185', 'Quỳnh Sơn', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2166, '06337', 'c6', 'vi', '20', '185', 'Đồng Ý', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2167, '06340', 'c6', 'vi', '20', '185', 'Tân Tri', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2168, '06343', 'c6', 'vi', '20', '185', 'Bắc Sơn', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2169, '06346', 'c6', 'vi', '20', '185', 'Hữu Vĩnh', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2170, '06349', 'c6', 'vi', '20', '185', 'Hưng Vũ', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2171, '06352', 'c6', 'vi', '20', '185', 'Tân Lập', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2172, '06355', 'c6', 'vi', '20', '185', 'Vũ Sơn', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2173, '06358', 'c6', 'vi', '20', '185', 'Chiêu Vũ', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2174, '06361', 'c6', 'vi', '20', '185', 'Tân Hương', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2175, '06364', 'c6', 'vi', '20', '185', 'Chiến Thắng', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2176, '06367', 'c6', 'vi', '20', '185', 'Vũ Lăng', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2177, '06370', 'c6', 'vi', '20', '185', 'Trấn Yên', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2178, '06373', 'c6', 'vi', '20', '185', 'Vũ Lễ', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2179, '06376', 'c6', 'vi', '20', '185', 'Nhất Hòa', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2180, '06379', 'c6', 'vi', '20', '185', 'Tân Thành', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2181, '06382', 'c6', 'vi', '20', '185', 'Nhất Tiến', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2182, '06385', 'c6', 'vi', '20', '186', 'Hữu Lũng', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2183, '06388', 'c6', 'vi', '20', '186', 'Hữu Liên', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2184, '06391', 'c6', 'vi', '20', '186', 'Yên Bình', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2185, '06394', 'c6', 'vi', '20', '186', 'Quyết Thắng', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2186, '06397', 'c6', 'vi', '20', '186', 'Hòa Bình', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2187, '06400', 'c6', 'vi', '20', '186', 'Yên Thịnh', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2188, '06403', 'c6', 'vi', '20', '186', 'Yên Sơn', 0, 0, 1, 1415954440, 1415954440, 'vi'),
(2189, '06406', 'c6', 'vi', '20', '186', 'Thiện Kỵ', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2190, '06409', 'c6', 'vi', '20', '186', 'Tân Lập', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2191, '06412', 'c6', 'vi', '20', '186', 'Yên Vượng', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2192, '06415', 'c6', 'vi', '20', '186', 'Minh Tiến', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2193, '06418', 'c6', 'vi', '20', '186', 'Nhật Tiến', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2194, '06421', 'c6', 'vi', '20', '186', 'Thanh Sơn', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2195, '06424', 'c6', 'vi', '20', '186', 'Đồng Tân', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2196, '06427', 'c6', 'vi', '20', '186', 'Cai Kinh', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2197, '06430', 'c6', 'vi', '20', '186', 'Hòa Lạc', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2198, '06433', 'c6', 'vi', '20', '186', 'Vân Nham', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2199, '06436', 'c6', 'vi', '20', '186', 'Đồng Tiến', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2200, '06439', 'c6', 'vi', '20', '186', 'Đô Lương', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2201, '06442', 'c6', 'vi', '20', '186', 'Tân Thành', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2202, '06445', 'c6', 'vi', '20', '186', 'Hòa Sơn', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2203, '06448', 'c6', 'vi', '20', '186', 'Minh Sơn', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2204, '06451', 'c6', 'vi', '20', '186', 'Hồ Sơn', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2205, '06454', 'c6', 'vi', '20', '186', 'Sơn Hà', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2206, '06457', 'c6', 'vi', '20', '186', 'Minh Hòa', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2207, '06460', 'c6', 'vi', '20', '186', 'Hòa Thắng', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2208, '06463', 'c6', 'vi', '20', '187', 'Đồng Mỏ', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2209, '06466', 'c6', 'vi', '20', '187', 'Chi Lăng', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2210, '06469', 'c6', 'vi', '20', '187', 'Vân An', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2211, '06472', 'c6', 'vi', '20', '187', 'Vân Thủy', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2212, '06475', 'c6', 'vi', '20', '187', 'Gia Lộc', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2213, '06478', 'c6', 'vi', '20', '187', 'Bắc Thủy', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2214, '06481', 'c6', 'vi', '20', '187', 'Chiến Thắng', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2215, '06484', 'c6', 'vi', '20', '187', 'Mai Sao', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2216, '06487', 'c6', 'vi', '20', '187', 'Bằng Hữu', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2217, '06490', 'c6', 'vi', '20', '187', 'Thượng Cường', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2218, '06493', 'c6', 'vi', '20', '187', 'Bằng Mạc', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2219, '06496', 'c6', 'vi', '20', '187', 'Nhân Lý', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2220, '06499', 'c6', 'vi', '20', '187', 'Lâm Sơn', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2221, '06502', 'c6', 'vi', '20', '187', 'Liên Sơn', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2222, '06505', 'c6', 'vi', '20', '187', 'Vạn Linh', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2223, '06508', 'c6', 'vi', '20', '187', 'Hòa Bình', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2224, '06511', 'c6', 'vi', '20', '187', 'Quang Lang', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2225, '06514', 'c6', 'vi', '20', '187', 'Hữu Kiên', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2226, '06517', 'c6', 'vi', '20', '187', 'Quan Sơn', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2227, '06520', 'c6', 'vi', '20', '187', 'Y Tịch', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2228, '06523', 'c6', 'vi', '20', '187', 'Chi Lăng', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2229, '06526', 'c6', 'vi', '20', '188', 'Na Dương', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2230, '06529', 'c6', 'vi', '20', '188', 'Lộc Bình', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2231, '06532', 'c6', 'vi', '20', '188', 'Mẫu Sơn', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2232, '06535', 'c6', 'vi', '20', '188', 'Bằng Khánh', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2233, '06538', 'c6', 'vi', '20', '188', 'Xuân Lễ', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2234, '06541', 'c6', 'vi', '20', '188', 'Yên Khoái', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2235, '06544', 'c6', 'vi', '20', '188', 'Xuân Mãn', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2236, '06547', 'c6', 'vi', '20', '188', 'Tú Mịch', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2237, '06550', 'c6', 'vi', '20', '188', 'Hữu Khánh', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2238, '06553', 'c6', 'vi', '20', '188', 'Đồng Bục', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2239, '06556', 'c6', 'vi', '20', '188', 'Vân Mộng', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2240, '06559', 'c6', 'vi', '20', '188', 'Tam Gia', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2241, '06562', 'c6', 'vi', '20', '188', 'Tú Đoạn', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2242, '06565', 'c6', 'vi', '20', '188', 'Khuất Xá', 0, 0, 1, 1415954441, 1415954441, 'vi'),
(2243, '06568', 'c6', 'vi', '20', '188', 'Như Khuê', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2244, '06571', 'c6', 'vi', '20', '188', 'Lục Thôn', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2245, '06574', 'c6', 'vi', '20', '188', 'Tĩnh Bắc', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2246, '06577', 'c6', 'vi', '20', '188', 'Xuân Tình', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2247, '06580', 'c6', 'vi', '20', '188', 'Hiệp Hạ', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2248, '06583', 'c6', 'vi', '20', '188', 'Nhượng Bạn', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2249, '06586', 'c6', 'vi', '20', '188', 'Quan Bản', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2250, '06589', 'c6', 'vi', '20', '188', 'Sàn Viên', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2251, '06592', 'c6', 'vi', '20', '188', 'Đông Quan', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2252, '06595', 'c6', 'vi', '20', '188', 'Minh Phát', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2253, '06598', 'c6', 'vi', '20', '188', 'Hữu Lân', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2254, '06601', 'c6', 'vi', '20', '188', 'Lợi Bác', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2255, '06604', 'c6', 'vi', '20', '188', 'Nam Quan', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2256, '06607', 'c6', 'vi', '20', '188', 'Xuân Dương', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2257, '06610', 'c6', 'vi', '20', '188', 'Ái Quốc', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2258, '06613', 'c6', 'vi', '20', '189', 'Đình Lập', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2259, '06616', 'c6', 'vi', '20', '189', 'N T Thái Bình', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2260, '06619', 'c6', 'vi', '20', '189', 'Bắc Xa', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2261, '06622', 'c6', 'vi', '20', '189', 'Bính Xá', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2262, '06625', 'c6', 'vi', '20', '189', 'Kiên Mộc', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2263, '06628', 'c6', 'vi', '20', '189', 'Đình Lập', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2264, '06631', 'c6', 'vi', '20', '189', 'Thái Bình', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2265, '06634', 'c6', 'vi', '20', '189', 'Cường Lợi', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2266, '06637', 'c6', 'vi', '20', '189', 'Châu Sơn', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2267, '06640', 'c6', 'vi', '20', '189', 'Lâm Ca', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2268, '06643', 'c6', 'vi', '20', '189', 'Đồng Thắng', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2269, '06646', 'c6', 'vi', '20', '189', 'Bắc Lãng', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2270, '06649', 'c6', 'vi', '22', '193', 'Hà Khánh', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2271, '06652', 'c6', 'vi', '22', '193', 'Hà Phong', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2272, '06655', 'c6', 'vi', '22', '193', 'Hà Khẩu', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2273, '06658', 'c6', 'vi', '22', '193', 'Cao Xanh', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2274, '06661', 'c6', 'vi', '22', '193', 'Giếng Đáy', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2275, '06664', 'c6', 'vi', '22', '193', 'Hà Tu', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2276, '06667', 'c6', 'vi', '22', '193', 'Hà Trung', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2277, '06670', 'c6', 'vi', '22', '193', 'Hà Lầm', 0, 0, 1, 1415954442, 1415954442, 'vi'),
(2278, '06673', 'c6', 'vi', '22', '193', 'Bãi Cháy', 0, 0, 1, 1415954443, 1415954443, 'vi'),
(2279, '06676', 'c6', 'vi', '22', '193', 'Cao Thắng', 0, 0, 1, 1415954443, 1415954443, 'vi'),
(2280, '06679', 'c6', 'vi', '22', '193', 'Hùng Thắng', 0, 0, 1, 1415954443, 1415954443, 'vi'),
(2281, '06682', 'c6', 'vi', '22', '193', 'Yết Kiêu', 0, 0, 1, 1415954443, 1415954443, 'vi'),
(2282, '06685', 'c6', 'vi', '22', '193', 'Trần Hưng Đạo', 0, 0, 1, 1415954443, 1415954443, 'vi'),
(2283, '06688', 'c6', 'vi', '22', '193', 'Hồng Hải', 0, 0, 1, 1415954443, 1415954443, 'vi'),
(2284, '06691', 'c6', 'vi', '22', '193', 'Hồng Gai', 0, 0, 1, 1415954443, 1415954443, 'vi'),
(2285, '06694', 'c6', 'vi', '22', '193', 'Bạch Đằng', 0, 0, 1, 1415954443, 1415954443, 'vi'),
(2286, '06697', 'c6', 'vi', '22', '193', 'Hồng Hà', 0, 0, 1, 1415954443, 1415954443, 'vi'),
(2287, '06700', 'c6', 'vi', '22', '193', 'Tuần Châu', 0, 0, 1, 1415954443, 1415954443, 'vi'),
(2288, '06703', 'c6', 'vi', '22', '193', 'Việt Hưng', 0, 0, 1, 1415954443, 1415954443, 'vi'),
(2289, '06706', 'c6', 'vi', '22', '193', 'Đại Yên', 0, 0, 1, 1415954443, 1415954443, 'vi'),
(2290, '06709', 'c6', 'vi', '22', '194', 'Ka Long', 0, 0, 1, 1415954443, 1415954443, 'vi'),
(2291, '06712', 'c6', 'vi', '22', '194', 'Trần Phú', 0, 0, 1, 1415954443, 1415954443, 'vi'),
(2292, '06715', 'c6', 'vi', '22', '194', 'Ninh Dương', 0, 0, 1, 1415954443, 1415954443, 'vi'),
(2293, '06718', 'c6', 'vi', '22', '194', 'Hoà Lạc', 0, 0, 1, 1415954443, 1415954443, 'vi'),
(2294, '06721', 'c6', 'vi', '22', '194', 'Trà Cổ', 0, 0, 1, 1415954443, 1415954443, 'vi'),
(2295, '06724', 'c6', 'vi', '22', '194', 'Hải Sơn', 0, 0, 1, 1415954443, 1415954443, 'vi'),
(2296, '06727', 'c6', 'vi', '22', '194', 'Bắc Sơn', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2297, '06730', 'c6', 'vi', '22', '194', 'Hải Đông', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2298, '06733', 'c6', 'vi', '22', '194', 'Hải Tiến', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2299, '06736', 'c6', 'vi', '22', '194', 'Hải Yên', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2300, '06739', 'c6', 'vi', '22', '194', 'Quảng Nghĩa', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2301, '06742', 'c6', 'vi', '22', '194', 'Hải Hoà', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2302, '06745', 'c6', 'vi', '22', '194', 'Hải Xuân', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2303, '06748', 'c6', 'vi', '22', '194', 'Vạn Ninh', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2304, '06751', 'c6', 'vi', '22', '194', 'Bình Ngọc', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2305, '06754', 'c6', 'vi', '22', '194', 'Vĩnh Trung', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2306, '06757', 'c6', 'vi', '22', '194', 'Vĩnh Thực', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2307, '06760', 'c6', 'vi', '22', '195', 'Mông Dương', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2308, '06763', 'c6', 'vi', '22', '195', 'Cửa Ông', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2309, '06766', 'c6', 'vi', '22', '195', 'Cẩm Sơn', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2310, '06769', 'c6', 'vi', '22', '195', 'Cẩm Đông', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2311, '06772', 'c6', 'vi', '22', '195', 'Cẩm Phú', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2312, '06775', 'c6', 'vi', '22', '195', 'Cẩm Tây', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2313, '06778', 'c6', 'vi', '22', '195', 'Quang Hanh', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2314, '06781', 'c6', 'vi', '22', '195', 'Cẩm Thịnh', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2315, '06784', 'c6', 'vi', '22', '195', 'Cẩm Thủy', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2316, '06787', 'c6', 'vi', '22', '195', 'Cẩm Thạch', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2317, '06790', 'c6', 'vi', '22', '195', 'Cẩm Thành', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2318, '06793', 'c6', 'vi', '22', '195', 'Cẩm Trung', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2319, '06796', 'c6', 'vi', '22', '195', 'Cẩm Bình', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2320, '06799', 'c6', 'vi', '22', '195', 'Cộng Hòa', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2321, '06802', 'c6', 'vi', '22', '195', 'Cẩm Hải', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2322, '06805', 'c6', 'vi', '22', '195', 'Dương Huy', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2323, '06808', 'c6', 'vi', '22', '196', 'Vàng Danh', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2324, '06811', 'c6', 'vi', '22', '196', 'Thanh Sơn', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2325, '06814', 'c6', 'vi', '22', '196', 'Bắc Sơn', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2326, '06817', 'c6', 'vi', '22', '196', 'Quang Trung', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2327, '06820', 'c6', 'vi', '22', '196', 'Trưng Vương', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2328, '06823', 'c6', 'vi', '22', '196', 'Nam Khê', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2329, '06826', 'c6', 'vi', '22', '196', 'Yên Thanh', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2330, '06829', 'c6', 'vi', '22', '196', 'Thượng Yên Công', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2331, '06832', 'c6', 'vi', '22', '196', 'Phương Đông', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2332, '06835', 'c6', 'vi', '22', '196', 'Phương Nam', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2333, '06838', 'c6', 'vi', '22', '198', 'Bình Liêu', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2334, '06841', 'c6', 'vi', '22', '198', 'Hoành Mô', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2335, '06844', 'c6', 'vi', '22', '198', 'Đồng Tâm', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2336, '06847', 'c6', 'vi', '22', '198', 'Đồng Văn', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2337, '06850', 'c6', 'vi', '22', '198', 'Tình Húc', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2338, '06853', 'c6', 'vi', '22', '198', 'Vô Ngại', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2339, '06856', 'c6', 'vi', '22', '198', 'Lục Hồn', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2340, '06859', 'c6', 'vi', '22', '198', 'Húc Động', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2341, '06862', 'c6', 'vi', '22', '199', 'Tiên Yên', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2342, '06865', 'c6', 'vi', '22', '199', 'Hà Lâu', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2343, '06868', 'c6', 'vi', '22', '199', 'Đại Dực', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2344, '06869', 'c6', 'vi', '22', '199', 'Đại Thành', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2345, '06871', 'c6', 'vi', '22', '199', 'Phong Dụ', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2346, '06874', 'c6', 'vi', '22', '199', 'Điền Xá', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2347, '06877', 'c6', 'vi', '22', '199', 'Đông Ngũ', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2348, '06880', 'c6', 'vi', '22', '199', 'Yên Than', 0, 0, 1, 1415954444, 1415954444, 'vi'),
(2349, '06883', 'c6', 'vi', '22', '199', 'Đông Hải', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2350, '06886', 'c6', 'vi', '22', '199', 'Hải Lạng', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2351, '06889', 'c6', 'vi', '22', '199', 'Tiên Lãng', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2352, '06892', 'c6', 'vi', '22', '199', 'Đồng Rui', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2353, '06895', 'c6', 'vi', '22', '200', 'Đầm Hà', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2354, '06898', 'c6', 'vi', '22', '200', 'Quảng Lâm', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2355, '06901', 'c6', 'vi', '22', '200', 'Quảng An', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2356, '06904', 'c6', 'vi', '22', '200', 'Tân Bình', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2357, '06907', 'c6', 'vi', '22', '200', 'Quảng Lợi', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2358, '06910', 'c6', 'vi', '22', '200', 'Dực Yên', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2359, '06913', 'c6', 'vi', '22', '200', 'Quảng Tân', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2360, '06916', 'c6', 'vi', '22', '200', 'Đầm Hà', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2361, '06917', 'c6', 'vi', '22', '200', 'Tân Lập', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2362, '06919', 'c6', 'vi', '22', '200', 'Đại Bình', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2363, '06922', 'c6', 'vi', '22', '201', 'Quảng Hà', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2364, '06925', 'c6', 'vi', '22', '201', 'Quảng Đức', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2365, '06928', 'c6', 'vi', '22', '201', 'Quảng Sơn', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2366, '06931', 'c6', 'vi', '22', '201', 'Quảng Thành', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2367, '06934', 'c6', 'vi', '22', '201', 'Quảng Thắng', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2368, '06937', 'c6', 'vi', '22', '201', 'Quảng Thịnh', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2369, '06940', 'c6', 'vi', '22', '201', 'Quảng Minh', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2370, '06943', 'c6', 'vi', '22', '201', 'Quảng Chính', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2371, '06946', 'c6', 'vi', '22', '201', 'Quảng Long', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2372, '06949', 'c6', 'vi', '22', '201', 'Đường Hoa', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2373, '06952', 'c6', 'vi', '22', '201', 'Quảng Phong', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2374, '06955', 'c6', 'vi', '22', '201', 'Quảng Trung', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2375, '06958', 'c6', 'vi', '22', '201', 'Phú Hải', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2376, '06961', 'c6', 'vi', '22', '201', 'Quảng Điền', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2377, '06964', 'c6', 'vi', '22', '201', 'Tiến Tới', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2378, '06967', 'c6', 'vi', '22', '201', 'Cái Chiên', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2379, '06970', 'c6', 'vi', '22', '202', 'Ba Chẽ', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2380, '06973', 'c6', 'vi', '22', '202', 'Thanh Sơn', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2381, '06976', 'c6', 'vi', '22', '202', 'Thanh Lâm', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2382, '06979', 'c6', 'vi', '22', '202', 'Đạp Thanh', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2383, '06982', 'c6', 'vi', '22', '202', 'Nam Sơn', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2384, '06985', 'c6', 'vi', '22', '202', 'Lương Mông', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2385, '06988', 'c6', 'vi', '22', '202', 'Đồn Đạc', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2386, '06991', 'c6', 'vi', '22', '202', 'Minh Cầm', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2387, '06994', 'c6', 'vi', '22', '203', 'Cái Rồng', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2388, '06997', 'c6', 'vi', '22', '203', 'Đài Xuyên', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2389, '07000', 'c6', 'vi', '22', '203', 'Bình Dân', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2390, '07003', 'c6', 'vi', '22', '203', 'Vạn Yên', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2391, '07006', 'c6', 'vi', '22', '203', 'Minh Châu', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2392, '07009', 'c6', 'vi', '22', '203', 'Đoàn Kết', 0, 0, 1, 1415954445, 1415954445, 'vi'),
(2393, '07012', 'c6', 'vi', '22', '203', 'Hạ Long', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2394, '07015', 'c6', 'vi', '22', '203', 'Đông Xá', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2395, '07018', 'c6', 'vi', '22', '203', 'Bản Sen', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2396, '07021', 'c6', 'vi', '22', '203', 'Thắng Lợi', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2397, '07024', 'c6', 'vi', '22', '203', 'Quan Lạn', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2398, '07027', 'c6', 'vi', '22', '203', 'Ngọc Vừng', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2399, '07030', 'c6', 'vi', '22', '204', 'Trới', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2400, '07033', 'c6', 'vi', '22', '204', 'Kỳ Thượng', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2401, '07036', 'c6', 'vi', '22', '204', 'Đồng Sơn', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2402, '07039', 'c6', 'vi', '22', '204', 'Tân Dân', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2403, '07042', 'c6', 'vi', '22', '204', 'Đồng Lâm', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2404, '07045', 'c6', 'vi', '22', '204', 'Hòa Bình', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2405, '07048', 'c6', 'vi', '22', '204', 'Vũ Oai', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2406, '07051', 'c6', 'vi', '22', '204', 'Dân Chủ', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2407, '07054', 'c6', 'vi', '22', '204', 'Quảng La', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2408, '07057', 'c6', 'vi', '22', '204', 'Bằng Cả', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2409, '07060', 'c6', 'vi', '22', '204', 'Thống Nhất', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2410, '07063', 'c6', 'vi', '22', '204', 'Sơn Dương', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2411, '07066', 'c6', 'vi', '22', '204', 'Lê Lợi', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2412, '07069', 'c6', 'vi', '22', '205', 'Mạo Khê', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2413, '07072', 'c6', 'vi', '22', '205', 'Đông Triều', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2414, '07075', 'c6', 'vi', '22', '205', 'An Sinh', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2415, '07078', 'c6', 'vi', '22', '205', 'Tràng Lương', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2416, '07081', 'c6', 'vi', '22', '205', 'Bình Khê', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2417, '07084', 'c6', 'vi', '22', '205', 'Việt Dân', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2418, '07087', 'c6', 'vi', '22', '205', 'Tân Việt', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2419, '07090', 'c6', 'vi', '22', '205', 'Bình Dương', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2420, '07093', 'c6', 'vi', '22', '205', 'Đức Chính', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2421, '07096', 'c6', 'vi', '22', '205', 'Tràng An', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2422, '07099', 'c6', 'vi', '22', '205', 'Nguyễn Huệ', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2423, '07102', 'c6', 'vi', '22', '205', 'Thủy An', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2424, '07105', 'c6', 'vi', '22', '205', 'Xuân Sơn', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2425, '07108', 'c6', 'vi', '22', '205', 'Hồng Thái Tây', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2426, '07111', 'c6', 'vi', '22', '205', 'Hồng Thái Đông', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2427, '07114', 'c6', 'vi', '22', '205', 'Hoàng Quế', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2428, '07117', 'c6', 'vi', '22', '205', 'Yên Thọ', 0, 0, 1, 1415954446, 1415954446, 'vi'),
(2429, '07120', 'c6', 'vi', '22', '205', 'Hồng Phong', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2430, '07123', 'c6', 'vi', '22', '205', 'Kim Sơn', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2431, '07126', 'c6', 'vi', '22', '205', 'Hưng Đạo', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2432, '07129', 'c6', 'vi', '22', '205', 'Yên Đức', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2433, '07132', 'c6', 'vi', '22', '206', 'Quảng Yên', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2434, '07135', 'c6', 'vi', '22', '206', 'Đông Mai', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2435, '07138', 'c6', 'vi', '22', '206', 'Minh Thành', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2436, '07141', 'c6', 'vi', '22', '196', 'Điền Công', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2437, '07144', 'c6', 'vi', '22', '206', 'Sông Khoai', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2438, '07147', 'c6', 'vi', '22', '206', 'Hiệp Hòa', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2439, '07150', 'c6', 'vi', '22', '206', 'Cộng Hòa', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2440, '07153', 'c6', 'vi', '22', '206', 'Tiền An', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2441, '07156', 'c6', 'vi', '22', '206', 'Hoàng Tân', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2442, '07159', 'c6', 'vi', '22', '206', 'Tân An', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2443, '07162', 'c6', 'vi', '22', '206', 'Yên Giang', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2444, '07165', 'c6', 'vi', '22', '206', 'Nam Hòa', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2445, '07168', 'c6', 'vi', '22', '206', 'Hà An', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2446, '07171', 'c6', 'vi', '22', '206', 'Cẩm La', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2447, '07174', 'c6', 'vi', '22', '206', 'Phong Hải', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2448, '07177', 'c6', 'vi', '22', '206', 'Yên Hải', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2449, '07180', 'c6', 'vi', '22', '206', 'Liên Hòa', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2450, '07183', 'c6', 'vi', '22', '206', 'Phong Cốc', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2451, '07186', 'c6', 'vi', '22', '206', 'Liên Vị', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2452, '07189', 'c6', 'vi', '22', '206', 'Tiền Phong', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2453, '07192', 'c6', 'vi', '22', '207', 'Cô Tô', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2454, '07195', 'c6', 'vi', '22', '207', 'Đồng Tiến', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2455, '07198', 'c6', 'vi', '22', '207', 'Thanh Lân', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2456, '07201', 'c6', 'vi', '24', '213', 'Thọ Xương', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2457, '07204', 'c6', 'vi', '24', '213', 'Trần Nguyên Hãn', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2458, '07207', 'c6', 'vi', '24', '213', 'Ngô Quyền', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2459, '07210', 'c6', 'vi', '24', '213', 'Hoàng Văn Thụ', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2460, '07213', 'c6', 'vi', '24', '213', 'Trần Phú', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2461, '07216', 'c6', 'vi', '24', '213', 'Mỹ Độ', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2462, '07219', 'c6', 'vi', '24', '213', 'Lê Lợi', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2463, '07222', 'c6', 'vi', '24', '213', 'Song Mai', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2464, '07225', 'c6', 'vi', '24', '213', 'Xương Giang', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2465, '07228', 'c6', 'vi', '24', '213', 'Đa Mai', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2466, '07231', 'c6', 'vi', '24', '213', 'Dĩnh Kế', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2467, '07234', 'c6', 'vi', '24', '215', 'Cầu Gồ', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2468, '07237', 'c6', 'vi', '24', '215', 'Bố Hạ', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2469, '07243', 'c6', 'vi', '24', '215', 'Đồng Tiến', 0, 0, 1, 1415954447, 1415954447, 'vi'),
(2470, '07246', 'c6', 'vi', '24', '215', 'Canh Nậu', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2471, '07249', 'c6', 'vi', '24', '215', 'Xuân Lương', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2472, '07252', 'c6', 'vi', '24', '215', 'Tam Tiến', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2473, '07255', 'c6', 'vi', '24', '215', 'Đồng Vương', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2474, '07258', 'c6', 'vi', '24', '215', 'Đồng Hưu', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2475, '07260', 'c6', 'vi', '24', '215', 'Đồng Tâm', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2476, '07261', 'c6', 'vi', '24', '215', 'Tam Hiệp', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2477, '07264', 'c6', 'vi', '24', '215', 'Tiến Thắng', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2478, '07267', 'c6', 'vi', '24', '215', 'Hồng Kỳ', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2479, '07270', 'c6', 'vi', '24', '215', 'Đồng Lạc', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2480, '07273', 'c6', 'vi', '24', '215', 'Đông Sơn', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2481, '07276', 'c6', 'vi', '24', '215', 'Tân Hiệp', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2482, '07279', 'c6', 'vi', '24', '215', 'Hương Vĩ', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2483, '07282', 'c6', 'vi', '24', '215', 'Đồng Kỳ', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2484, '07285', 'c6', 'vi', '24', '215', 'An Thượng', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2485, '07288', 'c6', 'vi', '24', '215', 'Phồn Xương', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2486, '07291', 'c6', 'vi', '24', '215', 'Tân Sỏi', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2487, '07294', 'c6', 'vi', '24', '215', 'Bố Hạ', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2488, '07297', 'c6', 'vi', '24', '216', 'Cao Thượng', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2489, '07300', 'c6', 'vi', '24', '216', 'Nhã Nam', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2490, '07303', 'c6', 'vi', '24', '216', 'Lan Giới', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2491, '07306', 'c6', 'vi', '24', '216', 'Nhã Nam', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2492, '07309', 'c6', 'vi', '24', '216', 'Tân Trung', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2493, '07312', 'c6', 'vi', '24', '216', 'Đại Hóa', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2494, '07315', 'c6', 'vi', '24', '216', 'Quang Tiến', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2495, '07318', 'c6', 'vi', '24', '216', 'Phúc Sơn', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2496, '07321', 'c6', 'vi', '24', '216', 'An Dương', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2497, '07324', 'c6', 'vi', '24', '216', 'Phúc Hòa', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2498, '07327', 'c6', 'vi', '24', '216', 'Liên Sơn', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2499, '07330', 'c6', 'vi', '24', '216', 'Hợp Đức', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2500, '07333', 'c6', 'vi', '24', '216', 'Lam Cốt', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2501, '07336', 'c6', 'vi', '24', '216', 'Cao Xá', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2502, '07339', 'c6', 'vi', '24', '216', 'Cao Thượng', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2503, '07342', 'c6', 'vi', '24', '216', 'Việt Ngọc', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2504, '07345', 'c6', 'vi', '24', '216', 'Song Vân', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2505, '07348', 'c6', 'vi', '24', '216', 'Ngọc Châu', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2506, '07351', 'c6', 'vi', '24', '216', 'Ngọc Vân', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2507, '07354', 'c6', 'vi', '24', '216', 'Việt Lập', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2508, '07357', 'c6', 'vi', '24', '216', 'Liên Chung', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2509, '07360', 'c6', 'vi', '24', '216', 'Ngọc Thiện', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2510, '07363', 'c6', 'vi', '24', '216', 'Ngọc Lý', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2511, '07366', 'c6', 'vi', '24', '216', 'Quế Nham', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2512, '07369', 'c6', 'vi', '24', '217', 'Kép', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2513, '07375', 'c6', 'vi', '24', '217', 'Vôi', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2514, '07378', 'c6', 'vi', '24', '217', 'Nghĩa Hòa', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2515, '07381', 'c6', 'vi', '24', '217', 'Nghĩa Hưng', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2516, '07384', 'c6', 'vi', '24', '217', 'Quang Thịnh', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2517, '07387', 'c6', 'vi', '24', '217', 'Hương Sơn', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2518, '07390', 'c6', 'vi', '24', '217', 'Đào Mỹ', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2519, '07393', 'c6', 'vi', '24', '217', 'Tiên Lục', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2520, '07396', 'c6', 'vi', '24', '217', 'An Hà', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2521, '07399', 'c6', 'vi', '24', '217', 'Tân Thịnh', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2522, '07402', 'c6', 'vi', '24', '217', 'Mỹ Hà', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2523, '07405', 'c6', 'vi', '24', '217', 'Hương Lạc', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2524, '07408', 'c6', 'vi', '24', '217', 'Dương Đức', 0, 0, 1, 1415954448, 1415954448, 'vi'),
(2525, '07411', 'c6', 'vi', '24', '217', 'Tân Thanh', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2526, '07414', 'c6', 'vi', '24', '217', 'Yên Mỹ', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2527, '07417', 'c6', 'vi', '24', '217', 'Tân Hưng', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2528, '07420', 'c6', 'vi', '24', '217', 'Mỹ Thái', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2529, '07423', 'c6', 'vi', '24', '217', 'Phi Mô', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2530, '07426', 'c6', 'vi', '24', '217', 'Xương Lâm', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2531, '07429', 'c6', 'vi', '24', '217', 'Xuân Hương', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2532, '07432', 'c6', 'vi', '24', '217', 'Tân Dĩnh', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2533, '07435', 'c6', 'vi', '24', '217', 'Đại Lâm', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2534, '07438', 'c6', 'vi', '24', '217', 'Thái Đào', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2535, '07441', 'c6', 'vi', '24', '217', 'Dĩnh Trì', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2536, '07444', 'c6', 'vi', '24', '218', 'Đồi Ngô', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2537, '07447', 'c6', 'vi', '24', '218', 'Lục Nam', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2538, '07450', 'c6', 'vi', '24', '218', 'Đông Hưng', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2539, '07453', 'c6', 'vi', '24', '218', 'Đông Phú', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2540, '07456', 'c6', 'vi', '24', '218', 'Tam Dị', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2541, '07459', 'c6', 'vi', '24', '218', 'Bảo Sơn', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2542, '07462', 'c6', 'vi', '24', '218', 'Bảo Đài', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2543, '07465', 'c6', 'vi', '24', '218', 'Thanh Lâm', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2544, '07468', 'c6', 'vi', '24', '218', 'Tiên Nha', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2545, '07471', 'c6', 'vi', '24', '218', 'Trường Giang', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2546, '07474', 'c6', 'vi', '24', '218', 'Tiên Hưng', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2547, '07477', 'c6', 'vi', '24', '218', 'Phương Sơn', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2548, '07480', 'c6', 'vi', '24', '218', 'Chu Điện', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2549, '07483', 'c6', 'vi', '24', '218', 'Cương Sơn', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2550, '07486', 'c6', 'vi', '24', '218', 'Nghĩa Phương', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2551, '07489', 'c6', 'vi', '24', '218', 'Vô Tranh', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2552, '07492', 'c6', 'vi', '24', '218', 'Bình Sơn', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2553, '07495', 'c6', 'vi', '24', '218', 'Lan Mẫu', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2554, '07498', 'c6', 'vi', '24', '218', 'Yên Sơn', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2555, '07501', 'c6', 'vi', '24', '218', 'Khám Lạng', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2556, '07504', 'c6', 'vi', '24', '218', 'Huyền Sơn', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2557, '07507', 'c6', 'vi', '24', '218', 'Trường Sơn', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2558, '07510', 'c6', 'vi', '24', '218', 'Lục Sơn', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2559, '07513', 'c6', 'vi', '24', '218', 'Bắc Lũng', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2560, '07516', 'c6', 'vi', '24', '218', 'Vũ Xá', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2561, '07519', 'c6', 'vi', '24', '218', 'Cẩm Lý', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2562, '07522', 'c6', 'vi', '24', '218', 'Đan Hội', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2563, '07525', 'c6', 'vi', '24', '219', 'Chũ', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2564, '07528', 'c6', 'vi', '24', '219', 'Cấm Sơn', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2565, '07531', 'c6', 'vi', '24', '219', 'Tân Sơn', 0, 0, 1, 1415954449, 1415954449, 'vi'),
(2566, '07534', 'c6', 'vi', '24', '219', 'Phong Minh', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2567, '07537', 'c6', 'vi', '24', '219', 'Phong Vân', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2568, '07540', 'c6', 'vi', '24', '219', 'Xa Lý', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2569, '07543', 'c6', 'vi', '24', '219', 'Hộ Đáp', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2570, '07546', 'c6', 'vi', '24', '219', 'Sơn Hải', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2571, '07549', 'c6', 'vi', '24', '219', 'Thanh Hải', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2572, '07552', 'c6', 'vi', '24', '219', 'Kiên Lao', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2573, '07555', 'c6', 'vi', '24', '219', 'Biên Sơn', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2574, '07558', 'c6', 'vi', '24', '219', 'Kiên Thành', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2575, '07561', 'c6', 'vi', '24', '219', 'Hồng Giang', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2576, '07564', 'c6', 'vi', '24', '219', 'Kim Sơn', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2577, '07567', 'c6', 'vi', '24', '219', 'Tân Hoa', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2578, '07570', 'c6', 'vi', '24', '219', 'Giáp Sơn', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2579, '07573', 'c6', 'vi', '24', '219', 'Biển Động', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2580, '07576', 'c6', 'vi', '24', '219', 'Quý Sơn', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2581, '07579', 'c6', 'vi', '24', '219', 'Trù Hựu', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2582, '07582', 'c6', 'vi', '24', '219', 'Phì Điền', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2583, '07585', 'c6', 'vi', '24', '219', 'Nghĩa Hồ', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2584, '07588', 'c6', 'vi', '24', '219', 'Tân Quang', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2585, '07591', 'c6', 'vi', '24', '219', 'Đồng Cốc', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2586, '07594', 'c6', 'vi', '24', '219', 'Tân Lập', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2587, '07597', 'c6', 'vi', '24', '219', 'Phú Nhuận', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2588, '07600', 'c6', 'vi', '24', '219', 'Mỹ An', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2589, '07603', 'c6', 'vi', '24', '219', 'Nam Dương', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2590, '07606', 'c6', 'vi', '24', '219', 'Tân Mộc', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2591, '07609', 'c6', 'vi', '24', '219', 'Đèo Gia', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2592, '07612', 'c6', 'vi', '24', '219', 'Phượng Sơn', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2593, '07615', 'c6', 'vi', '24', '220', 'An Châu', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2594, '07616', 'c6', 'vi', '24', '220', 'Thanh Sơn', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2595, '07618', 'c6', 'vi', '24', '220', 'Thạch Sơn', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2596, '07621', 'c6', 'vi', '24', '220', 'Vân Sơn', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2597, '07624', 'c6', 'vi', '24', '220', 'Hữu Sản', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2598, '07627', 'c6', 'vi', '24', '220', 'Quế Sơn', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2599, '07630', 'c6', 'vi', '24', '220', 'Phúc Thắng', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2600, '07633', 'c6', 'vi', '24', '220', 'Chiên Sơn', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2601, '07636', 'c6', 'vi', '24', '220', 'Giáo Liêm', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2602, '07639', 'c6', 'vi', '24', '220', 'Vĩnh Khương', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2603, '07642', 'c6', 'vi', '24', '220', 'Cẩm Đàn', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2604, '07645', 'c6', 'vi', '24', '220', 'An Lạc', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2605, '07648', 'c6', 'vi', '24', '220', 'An Lập', 0, 0, 1, 1415954450, 1415954450, 'vi'),
(2606, '07651', 'c6', 'vi', '24', '220', 'Yên Định', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2607, '07654', 'c6', 'vi', '24', '220', 'Lệ Viễn', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2608, '07657', 'c6', 'vi', '24', '220', 'An Châu', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2609, '07660', 'c6', 'vi', '24', '220', 'An Bá', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2610, '07663', 'c6', 'vi', '24', '220', 'Tuấn Đạo', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2611, '07666', 'c6', 'vi', '24', '220', 'Dương Hưu', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2612, '07669', 'c6', 'vi', '24', '220', 'Bồng Am', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2613, '07672', 'c6', 'vi', '24', '220', 'Long Sơn', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2614, '07675', 'c6', 'vi', '24', '220', 'Tuấn Mậu', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2615, '07678', 'c6', 'vi', '24', '220', 'Thanh Luận', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2616, '07681', 'c6', 'vi', '24', '221', 'Neo', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2617, '07682', 'c6', 'vi', '24', '221', 'Tân Dân', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2618, '07684', 'c6', 'vi', '24', '221', 'Lão Hộ', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2619, '07687', 'c6', 'vi', '24', '221', 'Tân Mỹ', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2620, '07690', 'c6', 'vi', '24', '221', 'Hương Gián', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2621, '07693', 'c6', 'vi', '24', '221', 'Tân An', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2622, '07696', 'c6', 'vi', '24', '221', 'Đồng Sơn', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2623, '07699', 'c6', 'vi', '24', '221', 'Tân Tiến', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2624, '07702', 'c6', 'vi', '24', '221', 'Quỳnh Sơn', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2625, '07705', 'c6', 'vi', '24', '221', 'Song Khê', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2626, '07708', 'c6', 'vi', '24', '221', 'Nội Hoàng', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2627, '07711', 'c6', 'vi', '24', '221', 'Tiền Phong', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2628, '07714', 'c6', 'vi', '24', '221', 'Xuân Phú', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2629, '07717', 'c6', 'vi', '24', '221', 'Tân Liễu', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2630, '07720', 'c6', 'vi', '24', '221', 'Trí Yên', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2631, '07723', 'c6', 'vi', '24', '221', 'Lãng Sơn', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2632, '07726', 'c6', 'vi', '24', '221', 'Yên Lư', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2633, '07729', 'c6', 'vi', '24', '221', 'Tiến Dũng', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2634, '07732', 'c6', 'vi', '24', '221', 'Nham Sơn', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2635, '07735', 'c6', 'vi', '24', '221', 'Đức Giang', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2636, '07738', 'c6', 'vi', '24', '221', 'Cảnh Thụy', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2637, '07741', 'c6', 'vi', '24', '221', 'Tư Mại', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2638, '07744', 'c6', 'vi', '24', '221', 'Thắng Cương', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2639, '07747', 'c6', 'vi', '24', '221', 'Đồng Việt', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2640, '07750', 'c6', 'vi', '24', '221', 'Đồng Phúc', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2641, '07753', 'c6', 'vi', '24', '222', 'Bích Động', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2642, '07756', 'c6', 'vi', '24', '222', 'Nếnh', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2643, '07759', 'c6', 'vi', '24', '222', 'Thượng Lan', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2644, '07762', 'c6', 'vi', '24', '222', 'Việt Tiến', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2645, '07765', 'c6', 'vi', '24', '222', 'Nghĩa Trung', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2646, '07768', 'c6', 'vi', '24', '222', 'Minh Đức', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2647, '07771', 'c6', 'vi', '24', '222', 'Hương Mai', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2648, '07774', 'c6', 'vi', '24', '222', 'Tự Lạn', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2649, '07777', 'c6', 'vi', '24', '222', 'Bích Sơn', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2650, '07780', 'c6', 'vi', '24', '222', 'Trung Sơn', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2651, '07783', 'c6', 'vi', '24', '222', 'Hồng Thái', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2652, '07786', 'c6', 'vi', '24', '222', 'Tiên Sơn', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2653, '07789', 'c6', 'vi', '24', '222', 'Tăng Tiến', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2654, '07792', 'c6', 'vi', '24', '222', 'Quảng Minh', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2655, '07795', 'c6', 'vi', '24', '222', 'Hoàng Ninh', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2656, '07798', 'c6', 'vi', '24', '222', 'Ninh Sơn', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2657, '07801', 'c6', 'vi', '24', '222', 'Vân Trung', 0, 0, 1, 1415954451, 1415954451, 'vi'),
(2658, '07804', 'c6', 'vi', '24', '222', 'Vân Hà', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2659, '07807', 'c6', 'vi', '24', '222', 'Quang Châu', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2660, '07810', 'c6', 'vi', '24', '223', 'Thắng', 0, 0, 1, 1415954452, 1415954452, 'vi');
INSERT INTO `location_ward` (`id`, `code`, `area_code`, `country_code`, `province_code`, `district_code`, `title`, `is_extramural`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(2661, '07813', 'c6', 'vi', '24', '223', 'Đồng Tân', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2662, '07816', 'c6', 'vi', '24', '223', 'Thanh Vân', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2663, '07819', 'c6', 'vi', '24', '223', 'Hoàng Lương', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2664, '07822', 'c6', 'vi', '24', '223', 'Hoàng Vân', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2665, '07825', 'c6', 'vi', '24', '223', 'Hoàng Thanh', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2666, '07828', 'c6', 'vi', '24', '223', 'Hoàng An', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2667, '07831', 'c6', 'vi', '24', '223', 'Ngọc Sơn', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2668, '07834', 'c6', 'vi', '24', '223', 'Thái Sơn', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2669, '07837', 'c6', 'vi', '24', '223', 'Hòa Sơn', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2670, '07840', 'c6', 'vi', '24', '223', 'Đức Thắng', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2671, '07843', 'c6', 'vi', '24', '223', 'Quang Minh', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2672, '07846', 'c6', 'vi', '24', '223', 'Lương Phong', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2673, '07849', 'c6', 'vi', '24', '223', 'Hùng Sơn', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2674, '07852', 'c6', 'vi', '24', '223', 'Đại Thành', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2675, '07855', 'c6', 'vi', '24', '223', 'Thường Thắng', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2676, '07858', 'c6', 'vi', '24', '223', 'Hợp Thịnh', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2677, '07861', 'c6', 'vi', '24', '223', 'Danh Thắng', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2678, '07864', 'c6', 'vi', '24', '223', 'Mai Trung', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2679, '07867', 'c6', 'vi', '24', '223', 'Đoan Bái', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2680, '07870', 'c6', 'vi', '24', '223', 'Bắc Lý', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2681, '07873', 'c6', 'vi', '24', '223', 'Xuân Cẩm', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2682, '07876', 'c6', 'vi', '24', '223', 'Hương Lâm', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2683, '07879', 'c6', 'vi', '24', '223', 'Đông Lỗ', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2684, '07882', 'c6', 'vi', '24', '223', 'Châu Minh', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2685, '07885', 'c6', 'vi', '24', '223', 'Mai Đình', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2686, '07888', 'c6', 'vi', '25', '227', 'Dữu Lâu', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2687, '07891', 'c6', 'vi', '25', '227', 'Vân Cơ', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2688, '07894', 'c6', 'vi', '25', '227', 'Nông Trang', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2689, '07897', 'c6', 'vi', '25', '227', 'Tân Dân', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2690, '07900', 'c6', 'vi', '25', '227', 'Gia Cẩm', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2691, '07903', 'c6', 'vi', '25', '227', 'Tiên Cát', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2692, '07906', 'c6', 'vi', '25', '227', 'Thọ Sơn', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2693, '07909', 'c6', 'vi', '25', '227', 'Thanh Miếu', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2694, '07912', 'c6', 'vi', '25', '227', 'Bạch Hạc', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2695, '07915', 'c6', 'vi', '25', '227', 'Bến Gót', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2696, '07918', 'c6', 'vi', '25', '227', 'Vân Phú', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2697, '07921', 'c6', 'vi', '25', '227', 'Phượng Lâu', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2698, '07924', 'c6', 'vi', '25', '227', 'Thụy Vân', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2699, '07927', 'c6', 'vi', '25', '227', 'Minh Phương', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2700, '07930', 'c6', 'vi', '25', '227', 'Trưng Vương', 0, 0, 1, 1415954452, 1415954452, 'vi'),
(2701, '07933', 'c6', 'vi', '25', '227', 'Minh Nông', 0, 0, 1, 1415954453, 1415954453, 'vi'),
(2702, '07936', 'c6', 'vi', '25', '227', 'Sông Lô', 0, 0, 1, 1415954453, 1415954453, 'vi'),
(2703, '07939', 'c6', 'vi', '25', '228', 'Trường Thịnh', 0, 0, 1, 1415954453, 1415954453, 'vi'),
(2704, '07942', 'c6', 'vi', '25', '228', 'Hùng Vương', 0, 0, 1, 1415954453, 1415954453, 'vi'),
(2705, '07945', 'c6', 'vi', '25', '228', 'Phong Châu', 0, 0, 1, 1415954453, 1415954453, 'vi'),
(2706, '07948', 'c6', 'vi', '25', '228', 'Âu Cơ', 0, 0, 1, 1415954453, 1415954453, 'vi'),
(2707, '07951', 'c6', 'vi', '25', '228', 'Hà Lộc', 0, 0, 1, 1415954453, 1415954453, 'vi'),
(2708, '07954', 'c6', 'vi', '25', '228', 'Phú Hộ', 0, 0, 1, 1415954453, 1415954453, 'vi'),
(2709, '07957', 'c6', 'vi', '25', '228', 'Văn Lung', 0, 0, 1, 1415954453, 1415954453, 'vi'),
(2710, '07960', 'c6', 'vi', '25', '228', 'Thanh Minh', 0, 0, 1, 1415954453, 1415954453, 'vi'),
(2711, '07963', 'c6', 'vi', '25', '228', 'Hà Thạch', 0, 0, 1, 1415954453, 1415954453, 'vi'),
(2712, '07966', 'c6', 'vi', '25', '228', 'Thanh Vinh', 0, 0, 1, 1415954453, 1415954453, 'vi'),
(2713, '07969', 'c6', 'vi', '25', '230', 'Đoan Hùng', 0, 0, 1, 1415954453, 1415954453, 'vi'),
(2714, '07972', 'c6', 'vi', '25', '230', 'Đông Khê', 0, 0, 1, 1415954453, 1415954453, 'vi'),
(2715, '07975', 'c6', 'vi', '25', '230', 'Nghinh Xuyên', 0, 0, 1, 1415954453, 1415954453, 'vi'),
(2716, '07978', 'c6', 'vi', '25', '230', 'Hùng Quan', 0, 0, 1, 1415954453, 1415954453, 'vi'),
(2717, '07981', 'c6', 'vi', '25', '230', 'Bằng Luân', 0, 0, 1, 1415954453, 1415954453, 'vi'),
(2718, '07984', 'c6', 'vi', '25', '230', 'Vân Du', 0, 0, 1, 1415954453, 1415954453, 'vi'),
(2719, '07987', 'c6', 'vi', '25', '230', 'Phương Trung', 0, 0, 1, 1415954453, 1415954453, 'vi'),
(2720, '07990', 'c6', 'vi', '25', '230', 'Quế Lâm', 0, 0, 1, 1415954453, 1415954453, 'vi'),
(2721, '07993', 'c6', 'vi', '25', '230', 'Minh Lương', 0, 0, 1, 1415954453, 1415954453, 'vi'),
(2722, '07996', 'c6', 'vi', '25', '230', 'Bằng Doãn', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2723, '07999', 'c6', 'vi', '25', '230', 'Chí Đám', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2724, '08002', 'c6', 'vi', '25', '230', 'Phong Phú', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2725, '08005', 'c6', 'vi', '25', '230', 'Phúc Lai', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2726, '08008', 'c6', 'vi', '25', '230', 'Ngọc Quan', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2727, '08011', 'c6', 'vi', '25', '230', 'Hữu Đô', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2728, '08014', 'c6', 'vi', '25', '230', 'Đại Nghĩa', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2729, '08017', 'c6', 'vi', '25', '230', 'Sóc Đăng', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2730, '08020', 'c6', 'vi', '25', '230', 'Phú Thứ', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2731, '08023', 'c6', 'vi', '25', '230', 'Tây Cốc', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2732, '08026', 'c6', 'vi', '25', '230', 'Yên Kiện', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2733, '08029', 'c6', 'vi', '25', '230', 'Hùng Long', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2734, '08032', 'c6', 'vi', '25', '230', 'Vụ Quang', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2735, '08035', 'c6', 'vi', '25', '230', 'Vân Đồn', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2736, '08038', 'c6', 'vi', '25', '230', 'Tiêu Sơn', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2737, '08041', 'c6', 'vi', '25', '230', 'Minh Tiến', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2738, '08044', 'c6', 'vi', '25', '230', 'Minh Phú', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2739, '08047', 'c6', 'vi', '25', '230', 'Chân Mộng', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2740, '08050', 'c6', 'vi', '25', '230', 'Ca Đình', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2741, '08053', 'c6', 'vi', '25', '231', 'Hạ Hoà', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2742, '08056', 'c6', 'vi', '25', '231', 'Đại Phạm', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2743, '08059', 'c6', 'vi', '25', '231', 'Hậu Bổng', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2744, '08062', 'c6', 'vi', '25', '231', 'Đan Hà', 0, 0, 1, 1415954454, 1415954454, 'vi'),
(2745, '08065', 'c6', 'vi', '25', '231', 'Hà Lương', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2746, '08068', 'c6', 'vi', '25', '231', 'Lệnh Khanh', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2747, '08071', 'c6', 'vi', '25', '231', 'Phụ Khánh', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2748, '08074', 'c6', 'vi', '25', '231', 'Liên Phương', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2749, '08077', 'c6', 'vi', '25', '231', 'Đan Thượng', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2750, '08080', 'c6', 'vi', '25', '231', 'Hiền Lương', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2751, '08083', 'c6', 'vi', '25', '231', 'Động Lâm', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2752, '08086', 'c6', 'vi', '25', '231', 'Lâm Lợi', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2753, '08089', 'c6', 'vi', '25', '231', 'Phương Viên', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2754, '08092', 'c6', 'vi', '25', '231', 'Gia Điền', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2755, '08095', 'c6', 'vi', '25', '231', 'Ấm Hạ', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2756, '08098', 'c6', 'vi', '25', '231', 'Quân Khê', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2757, '08101', 'c6', 'vi', '25', '231', 'Y Sơn', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2758, '08104', 'c6', 'vi', '25', '231', 'Hương Xạ', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2759, '08107', 'c6', 'vi', '25', '231', 'Cáo Điền', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2760, '08110', 'c6', 'vi', '25', '231', 'Xuân Áng', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2761, '08113', 'c6', 'vi', '25', '231', 'Yên Kỳ', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2762, '08116', 'c6', 'vi', '25', '231', 'Chuế Lưu', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2763, '08119', 'c6', 'vi', '25', '231', 'Minh Hạc', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2764, '08122', 'c6', 'vi', '25', '231', 'Lang Sơn', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2765, '08125', 'c6', 'vi', '25', '231', 'Bằng Giã', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2766, '08128', 'c6', 'vi', '25', '231', 'Yên Luật', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2767, '08131', 'c6', 'vi', '25', '231', 'Vô Tranh', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2768, '08134', 'c6', 'vi', '25', '231', 'Văn Lang', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2769, '08137', 'c6', 'vi', '25', '231', 'Chính Công', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2770, '08140', 'c6', 'vi', '25', '231', 'Minh Côi', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2771, '08143', 'c6', 'vi', '25', '231', 'Vĩnh Chân', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2772, '08146', 'c6', 'vi', '25', '231', 'Mai Tùng', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2773, '08149', 'c6', 'vi', '25', '231', 'Vụ Cầu', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2774, '08152', 'c6', 'vi', '25', '232', 'Thanh Ba', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2775, '08155', 'c6', 'vi', '25', '232', 'Thanh Vân', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2776, '08156', 'c6', 'vi', '25', '232', 'Vân Lĩnh', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2777, '08158', 'c6', 'vi', '25', '232', 'Đông Lĩnh', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2778, '08161', 'c6', 'vi', '25', '232', 'Đại An', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2779, '08164', 'c6', 'vi', '25', '232', 'Hanh Cù', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2780, '08167', 'c6', 'vi', '25', '232', 'Thái Ninh', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2781, '08170', 'c6', 'vi', '25', '232', 'Đồng Xuân', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2782, '08173', 'c6', 'vi', '25', '232', 'Năng Yên', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2783, '08176', 'c6', 'vi', '25', '232', 'Yển Khê', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2784, '08179', 'c6', 'vi', '25', '232', 'Ninh Dân', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2785, '08182', 'c6', 'vi', '25', '232', 'Quảng Nạp', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2786, '08185', 'c6', 'vi', '25', '232', 'Vũ Yển', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2787, '08188', 'c6', 'vi', '25', '232', 'Yên Nội', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2788, '08191', 'c6', 'vi', '25', '232', 'Phương Lĩnh', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2789, '08194', 'c6', 'vi', '25', '232', 'Võ Lao', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2790, '08197', 'c6', 'vi', '25', '232', 'Khải Xuân', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2791, '08200', 'c6', 'vi', '25', '232', 'Mạn Lạn', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2792, '08203', 'c6', 'vi', '25', '232', 'Thanh Xá', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2793, '08206', 'c6', 'vi', '25', '232', 'Chí Tiên', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2794, '08209', 'c6', 'vi', '25', '232', 'Đông Thành', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2795, '08212', 'c6', 'vi', '25', '232', 'Hoàng Cương', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2796, '08215', 'c6', 'vi', '25', '232', 'Sơn Cương', 0, 0, 1, 1415954455, 1415954455, 'vi'),
(2797, '08218', 'c6', 'vi', '25', '232', 'Thanh Hà', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2798, '08221', 'c6', 'vi', '25', '232', 'Đỗ Sơn', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2799, '08224', 'c6', 'vi', '25', '232', 'Đỗ Xuyên', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2800, '08227', 'c6', 'vi', '25', '232', 'Lương Lỗ', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2801, '08230', 'c6', 'vi', '25', '233', 'Phong Châu', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2802, '08233', 'c6', 'vi', '25', '233', 'Phú Mỹ', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2803, '08234', 'c6', 'vi', '25', '233', 'Lệ Mỹ', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2804, '08236', 'c6', 'vi', '25', '233', 'Liên Hoa', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2805, '08239', 'c6', 'vi', '25', '233', 'Trạm Thản', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2806, '08242', 'c6', 'vi', '25', '233', 'Trị Quận', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2807, '08245', 'c6', 'vi', '25', '233', 'Trung Giáp', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2808, '08248', 'c6', 'vi', '25', '233', 'Tiên Phú', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2809, '08251', 'c6', 'vi', '25', '233', 'Hạ Giáp', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2810, '08254', 'c6', 'vi', '25', '233', 'Bảo Thanh', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2811, '08257', 'c6', 'vi', '25', '233', 'Phú Lộc', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2812, '08260', 'c6', 'vi', '25', '233', 'Gia Thanh', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2813, '08263', 'c6', 'vi', '25', '233', 'Tiên Du', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2814, '08266', 'c6', 'vi', '25', '233', 'Phú Nham', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2815, '08269', 'c6', 'vi', '25', '233', 'Bình Bộ', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2816, '08272', 'c6', 'vi', '25', '233', 'An Đạo', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2817, '08275', 'c6', 'vi', '25', '233', 'Tử Đà', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2818, '08278', 'c6', 'vi', '25', '233', 'Phù Ninh', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2819, '08281', 'c6', 'vi', '25', '227', 'Kim Đức', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2820, '08284', 'c6', 'vi', '25', '233', 'Vĩnh Phú', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2821, '08287', 'c6', 'vi', '25', '227', 'Hùng Lô', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2822, '08290', 'c6', 'vi', '25', '234', 'Yên Lập', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2823, '08293', 'c6', 'vi', '25', '234', 'Mỹ Lung', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2824, '08296', 'c6', 'vi', '25', '234', 'Mỹ Lương', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2825, '08299', 'c6', 'vi', '25', '234', 'Lương Sơn', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2826, '08302', 'c6', 'vi', '25', '234', 'Xuân An', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2827, '08305', 'c6', 'vi', '25', '234', 'Xuân Viên', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2828, '08308', 'c6', 'vi', '25', '234', 'Xuân Thủy', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2829, '08311', 'c6', 'vi', '25', '234', 'Trung Sơn', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2830, '08314', 'c6', 'vi', '25', '234', 'Hưng Long', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2831, '08317', 'c6', 'vi', '25', '234', 'Nga Hoàng', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2832, '08320', 'c6', 'vi', '25', '234', 'Đồng Lạc', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2833, '08323', 'c6', 'vi', '25', '234', 'Thượng Long', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2834, '08326', 'c6', 'vi', '25', '234', 'Đồng Thịnh', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2835, '08329', 'c6', 'vi', '25', '234', 'Phúc Khánh', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2836, '08332', 'c6', 'vi', '25', '234', 'Minh Hòa', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2837, '08335', 'c6', 'vi', '25', '234', 'Ngọc Lập', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2838, '08338', 'c6', 'vi', '25', '234', 'Ngọc Đồng', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2839, '08341', 'c6', 'vi', '25', '235', 'Sông Thao', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2840, '08344', 'c6', 'vi', '25', '235', 'Tiên Lương', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2841, '08347', 'c6', 'vi', '25', '235', 'Tuy Lộc', 0, 0, 1, 1415954456, 1415954456, 'vi'),
(2842, '08350', 'c6', 'vi', '25', '235', 'Ngô Xá', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2843, '08353', 'c6', 'vi', '25', '235', 'Phương Xá', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2844, '08356', 'c6', 'vi', '25', '235', 'Phượng Vĩ', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2845, '08359', 'c6', 'vi', '25', '235', 'Đồng Cam', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2846, '08362', 'c6', 'vi', '25', '235', 'Thụy Liễu', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2847, '08365', 'c6', 'vi', '25', '235', 'Phùng Xá', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2848, '08368', 'c6', 'vi', '25', '235', 'Sơn Nga', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2849, '08371', 'c6', 'vi', '25', '235', 'Sai Nga', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2850, '08374', 'c6', 'vi', '25', '235', 'Tùng Khê', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2851, '08377', 'c6', 'vi', '25', '235', 'Tam Sơn', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2852, '08380', 'c6', 'vi', '25', '235', 'Văn Bán', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2853, '08383', 'c6', 'vi', '25', '235', 'Cấp Dẫn', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2854, '08386', 'c6', 'vi', '25', '235', 'Thanh Nga', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2855, '08389', 'c6', 'vi', '25', '235', 'Xương Thịnh', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2856, '08392', 'c6', 'vi', '25', '235', 'Phú Khê', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2857, '08395', 'c6', 'vi', '25', '235', 'Sơn Tình', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2858, '08398', 'c6', 'vi', '25', '235', 'Yên Tập', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2859, '08401', 'c6', 'vi', '25', '235', 'Hương Lung', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2860, '08404', 'c6', 'vi', '25', '235', 'Tạ Xá', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2861, '08407', 'c6', 'vi', '25', '235', 'Phú Lạc', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2862, '08410', 'c6', 'vi', '25', '235', 'Tình Cương', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2863, '08413', 'c6', 'vi', '25', '235', 'Chương Xá', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2864, '08416', 'c6', 'vi', '25', '235', 'Hiền Đa', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2865, '08419', 'c6', 'vi', '25', '235', 'Văn Khúc', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2866, '08422', 'c6', 'vi', '25', '235', 'Yên Dưỡng', 0, 0, 1, 1415954457, 1415954457, 'vi'),
(2867, '08425', 'c6', 'vi', '25', '235', 'Cát Trù', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2868, '08428', 'c6', 'vi', '25', '235', 'Điêu Lương', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2869, '08431', 'c6', 'vi', '25', '235', 'Đồng Lương', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2870, '08434', 'c6', 'vi', '25', '236', 'Hưng Hoá', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2871, '08437', 'c6', 'vi', '25', '236', 'Vực Trường', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2872, '08440', 'c6', 'vi', '25', '236', 'Hiền Quan', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2873, '08443', 'c6', 'vi', '25', '236', 'Hương Nha', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2874, '08446', 'c6', 'vi', '25', '236', 'Thanh Uyên', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2875, '08449', 'c6', 'vi', '25', '236', 'Xuân Quang', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2876, '08452', 'c6', 'vi', '25', '236', 'Tứ Mỹ', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2877, '08455', 'c6', 'vi', '25', '236', 'Văn Lương', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2878, '08458', 'c6', 'vi', '25', '236', 'Hùng Đô', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2879, '08461', 'c6', 'vi', '25', '236', 'Phương Thịnh', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2880, '08464', 'c6', 'vi', '25', '236', 'Tam Cường', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2881, '08467', 'c6', 'vi', '25', '236', 'Cổ Tiết', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2882, '08470', 'c6', 'vi', '25', '236', 'Quang Húc', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2883, '08473', 'c6', 'vi', '25', '236', 'Hương Nộn', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2884, '08476', 'c6', 'vi', '25', '236', 'Tề Lễ', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2885, '08479', 'c6', 'vi', '25', '236', 'Thọ Văn', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2886, '08482', 'c6', 'vi', '25', '236', 'Dị Nậu', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2887, '08485', 'c6', 'vi', '25', '236', 'Hồng Đà', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2888, '08488', 'c6', 'vi', '25', '236', 'Dậu Dương', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2889, '08491', 'c6', 'vi', '25', '236', 'Thượng Nông', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2890, '08494', 'c6', 'vi', '25', '237', 'Lâm Thao', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2891, '08497', 'c6', 'vi', '25', '237', 'Tiên Kiên', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2892, '08498', 'c6', 'vi', '25', '237', 'Sơn Hùng', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2893, '08500', 'c6', 'vi', '25', '237', 'Xuân Lũng', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2894, '08503', 'c6', 'vi', '25', '227', 'Hy Cương', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2895, '08506', 'c6', 'vi', '25', '227', 'Chu Hóa', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2896, '08509', 'c6', 'vi', '25', '237', 'Xuân Huy', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2897, '08512', 'c6', 'vi', '25', '237', 'Thạch Sơn', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2898, '08515', 'c6', 'vi', '25', '227', 'Thanh Đình', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2899, '08518', 'c6', 'vi', '25', '237', 'Sơn Vi', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2900, '08521', 'c6', 'vi', '25', '237', 'Hợp Hải', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2901, '08524', 'c6', 'vi', '25', '237', 'Sơn Dương', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2902, '08527', 'c6', 'vi', '25', '237', 'Cao Xá', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2903, '08530', 'c6', 'vi', '25', '237', 'Kinh Kệ', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2904, '08533', 'c6', 'vi', '25', '237', 'Vĩnh Lại', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2905, '08536', 'c6', 'vi', '25', '237', 'Tứ Xã', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2906, '08539', 'c6', 'vi', '25', '237', 'Bản Nguyên', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2907, '08542', 'c6', 'vi', '25', '238', 'Thanh Sơn', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2908, '08545', 'c6', 'vi', '25', '240', 'Thu Cúc', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2909, '08548', 'c6', 'vi', '25', '240', 'Thạch Kiệt', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2910, '08551', 'c6', 'vi', '25', '240', 'Thu Ngạc', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2911, '08554', 'c6', 'vi', '25', '240', 'Kiệt Sơn', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2912, '08557', 'c6', 'vi', '25', '240', 'Đồng Sơn', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2913, '08560', 'c6', 'vi', '25', '240', 'Lai Đồng', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2914, '08563', 'c6', 'vi', '25', '238', 'Sơn Hùng', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2915, '08566', 'c6', 'vi', '25', '240', 'Tân Phú', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2916, '08569', 'c6', 'vi', '25', '240', 'Mỹ Thuận', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2917, '08572', 'c6', 'vi', '25', '238', 'Địch Quả', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2918, '08575', 'c6', 'vi', '25', '238', 'Giáp Lai', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2919, '08578', 'c6', 'vi', '25', '240', 'Tân Sơn', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2920, '08581', 'c6', 'vi', '25', '238', 'Thục Luyện', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2921, '08584', 'c6', 'vi', '25', '238', 'Võ Miếu', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2922, '08587', 'c6', 'vi', '25', '238', 'Thạch Khoán', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2923, '08590', 'c6', 'vi', '25', '240', 'Xuân Đài', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2924, '08593', 'c6', 'vi', '25', '240', 'Minh Đài', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2925, '08596', 'c6', 'vi', '25', '240', 'Văn Luông', 0, 0, 1, 1415954458, 1415954458, 'vi'),
(2926, '08599', 'c6', 'vi', '25', '240', 'Xuân Sơn', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2927, '08602', 'c6', 'vi', '25', '238', 'Cự Thắng', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2928, '08605', 'c6', 'vi', '25', '238', 'Tất Thắng', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2929, '08608', 'c6', 'vi', '25', '240', 'Long Cốc', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2930, '08611', 'c6', 'vi', '25', '238', 'Văn Miếu', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2931, '08614', 'c6', 'vi', '25', '238', 'Cự Đồng', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2932, '08617', 'c6', 'vi', '25', '240', 'Kim Thượng', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2933, '08620', 'c6', 'vi', '25', '240', 'Tam Thanh', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2934, '08623', 'c6', 'vi', '25', '238', 'Thắng Sơn', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2935, '08626', 'c6', 'vi', '25', '240', 'Vinh Tiền', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2936, '08629', 'c6', 'vi', '25', '238', 'Tân Minh', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2937, '08632', 'c6', 'vi', '25', '238', 'Hương Cần', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2938, '08635', 'c6', 'vi', '25', '238', 'Khả Cửu', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2939, '08638', 'c6', 'vi', '25', '238', 'Đông Cửu', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2940, '08641', 'c6', 'vi', '25', '238', 'Tân Lập', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2941, '08644', 'c6', 'vi', '25', '238', 'Yên Lãng', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2942, '08647', 'c6', 'vi', '25', '238', 'Yên Lương', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2943, '08650', 'c6', 'vi', '25', '238', 'Thượng Cửu', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2944, '08653', 'c6', 'vi', '25', '238', 'Lương Nha', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2945, '08656', 'c6', 'vi', '25', '238', 'Yên Sơn', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2946, '08659', 'c6', 'vi', '25', '238', 'Tinh Nhuệ', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2947, '08662', 'c6', 'vi', '25', '239', 'Đào Xá', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2948, '08665', 'c6', 'vi', '25', '239', 'Thạch Đồng', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2949, '08668', 'c6', 'vi', '25', '239', 'Xuân Lộc', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2950, '08671', 'c6', 'vi', '25', '239', 'Tân Phương', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2951, '08674', 'c6', 'vi', '25', '239', 'La Phù', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2952, '08677', 'c6', 'vi', '25', '239', 'Sơn Thủy', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2953, '08680', 'c6', 'vi', '25', '239', 'Bảo Yên', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2954, '08683', 'c6', 'vi', '25', '239', 'Đoan Hạ', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2955, '08686', 'c6', 'vi', '25', '239', 'Đồng Luận', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2956, '08689', 'c6', 'vi', '25', '239', 'Hoàng Xá', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2957, '08692', 'c6', 'vi', '25', '239', 'Trung Thịnh', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2958, '08695', 'c6', 'vi', '25', '239', 'Trung Nghĩa', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2959, '08698', 'c6', 'vi', '25', '239', 'Phượng Mao', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2960, '08701', 'c6', 'vi', '25', '239', 'Yến Mao', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2961, '08704', 'c6', 'vi', '25', '239', 'Tu Vũ', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2962, '08707', 'c6', 'vi', '26', '243', 'Tích Sơn', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2963, '08710', 'c6', 'vi', '26', '243', 'Liên Bảo', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2964, '08713', 'c6', 'vi', '26', '243', 'Hội Hợp', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2965, '08716', 'c6', 'vi', '26', '243', 'Đống Đa', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2966, '08719', 'c6', 'vi', '26', '243', 'Ngô Quyền', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2967, '08722', 'c6', 'vi', '26', '243', 'Đồng Tâm', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2968, '08725', 'c6', 'vi', '26', '243', 'Định Trung', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2969, '08728', 'c6', 'vi', '26', '243', 'Khai Quang', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2970, '08731', 'c6', 'vi', '26', '243', 'Thanh Trù', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2971, '08734', 'c6', 'vi', '26', '244', 'Trưng Trắc', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2972, '08737', 'c6', 'vi', '26', '244', 'Hùng Vương', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2973, '08740', 'c6', 'vi', '26', '244', 'Trưng Nhị', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2974, '08743', 'c6', 'vi', '26', '244', 'Phúc Thắng', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2975, '08746', 'c6', 'vi', '26', '244', 'Xuân Hoà', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2976, '08747', 'c6', 'vi', '26', '244', 'Đồng Xuân', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2977, '08749', 'c6', 'vi', '26', '244', 'Ngọc Thanh', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2978, '08752', 'c6', 'vi', '26', '244', 'Cao Minh', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2979, '08755', 'c6', 'vi', '26', '244', 'Nam Viêm', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2980, '08758', 'c6', 'vi', '26', '244', 'Tiền Châu', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2981, '08761', 'c6', 'vi', '26', '246', 'Lập Thạch', 0, 0, 1, 1415954459, 1415954459, 'vi'),
(2982, '08764', 'c6', 'vi', '26', '246', 'Quang Sơn', 0, 0, 1, 1415954460, 1415954460, 'vi'),
(2983, '08767', 'c6', 'vi', '26', '246', 'Ngọc Mỹ', 0, 0, 1, 1415954460, 1415954460, 'vi'),
(2984, '08770', 'c6', 'vi', '26', '246', 'Hợp Lý', 0, 0, 1, 1415954460, 1415954460, 'vi'),
(2985, '08773', 'c6', 'vi', '26', '253', 'Lãng Công', 0, 0, 1, 1415954460, 1415954460, 'vi'),
(2986, '08776', 'c6', 'vi', '26', '253', 'Quang Yên', 0, 0, 1, 1415954460, 1415954460, 'vi'),
(2987, '08779', 'c6', 'vi', '26', '253', 'Bạch Lưu', 0, 0, 1, 1415954460, 1415954460, 'vi'),
(2988, '08782', 'c6', 'vi', '26', '253', 'Hải Lựu', 0, 0, 1, 1415954460, 1415954460, 'vi'),
(2989, '08785', 'c6', 'vi', '26', '246', 'Bắc Bình', 0, 0, 1, 1415954460, 1415954460, 'vi'),
(2990, '08788', 'c6', 'vi', '26', '246', 'Thái Hòa', 0, 0, 1, 1415954460, 1415954460, 'vi'),
(2991, '08789', 'c6', 'vi', '26', '246', 'Hoa Sơn', 0, 0, 1, 1415954460, 1415954460, 'vi'),
(2992, '08791', 'c6', 'vi', '26', '246', 'Liễn Sơn', 0, 0, 1, 1415954460, 1415954460, 'vi'),
(2993, '08794', 'c6', 'vi', '26', '246', 'Xuân Hòa', 0, 0, 1, 1415954460, 1415954460, 'vi'),
(2994, '08797', 'c6', 'vi', '26', '246', 'Vân Trục', 0, 0, 1, 1415954460, 1415954460, 'vi'),
(2995, '08800', 'c6', 'vi', '26', '253', 'Đồng Quế', 0, 0, 1, 1415954460, 1415954460, 'vi'),
(2996, '08803', 'c6', 'vi', '26', '253', 'Nhân Đạo', 0, 0, 1, 1415954460, 1415954460, 'vi'),
(2997, '08806', 'c6', 'vi', '26', '253', 'Đôn Nhân', 0, 0, 1, 1415954460, 1415954460, 'vi'),
(2998, '08809', 'c6', 'vi', '26', '253', 'Phương Khoan', 0, 0, 1, 1415954460, 1415954460, 'vi'),
(2999, '08812', 'c6', 'vi', '26', '246', 'Liên Hòa', 0, 0, 1, 1415954460, 1415954460, 'vi'),
(3000, '08815', 'c6', 'vi', '26', '246', 'Tử Du', 0, 0, 1, 1415954460, 1415954460, 'vi'),
(3001, '08818', 'c6', 'vi', '26', '253', 'Tân Lập', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3002, '08821', 'c6', 'vi', '26', '253', 'Nhạo Sơn', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3003, '08824', 'c6', 'vi', '26', '253', 'Tam Sơn', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3004, '08827', 'c6', 'vi', '26', '253', 'Như Thụy', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3005, '08830', 'c6', 'vi', '26', '253', 'Yên Thạch', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3006, '08833', 'c6', 'vi', '26', '246', 'Bàn Giản', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3007, '08836', 'c6', 'vi', '26', '246', 'Xuân Lôi', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3008, '08839', 'c6', 'vi', '26', '246', 'Đồng Ích', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3009, '08842', 'c6', 'vi', '26', '246', 'Tiên Lữ', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3010, '08845', 'c6', 'vi', '26', '246', 'Văn Quán', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3011, '08848', 'c6', 'vi', '26', '253', 'Đồng Thịnh', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3012, '08851', 'c6', 'vi', '26', '253', 'Tứ Yên', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3013, '08854', 'c6', 'vi', '26', '253', 'Đức Bác', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3014, '08857', 'c6', 'vi', '26', '246', 'Đình Chu', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3015, '08860', 'c6', 'vi', '26', '253', 'Cao Phong', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3016, '08863', 'c6', 'vi', '26', '246', 'Triệu Đề', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3017, '08866', 'c6', 'vi', '26', '246', 'Sơn Đông', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3018, '08869', 'c6', 'vi', '26', '247', 'Hợp Hòa', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3019, '08872', 'c6', 'vi', '26', '247', 'Hoàng Hoa', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3020, '08875', 'c6', 'vi', '26', '247', 'Đồng Tĩnh', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3021, '08878', 'c6', 'vi', '26', '247', 'Kim Long', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3022, '08881', 'c6', 'vi', '26', '247', 'Hướng Đạo', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3023, '08884', 'c6', 'vi', '26', '247', 'Đạo Tú', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3024, '08887', 'c6', 'vi', '26', '247', 'An Hòa', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3025, '08890', 'c6', 'vi', '26', '247', 'Thanh Vân', 0, 0, 1, 1415954478, 1415954478, 'vi'),
(3026, '08893', 'c6', 'vi', '26', '247', 'Duy Phiên', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3027, '08896', 'c6', 'vi', '26', '247', 'Hoàng Đan', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3028, '08899', 'c6', 'vi', '26', '247', 'Hoàng Lâu', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3029, '08902', 'c6', 'vi', '26', '247', 'Vân Hội', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3030, '08905', 'c6', 'vi', '26', '247', 'Hợp Thịnh', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3031, '08908', 'c6', 'vi', '26', '248', 'Tam Đảo', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3032, '08911', 'c6', 'vi', '26', '248', 'Hợp Châu', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3033, '08914', 'c6', 'vi', '26', '248', 'Đạo Trù', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3034, '08917', 'c6', 'vi', '26', '248', 'Yên Dương', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3035, '08920', 'c6', 'vi', '26', '248', 'Bồ Lý', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3036, '08923', 'c6', 'vi', '26', '248', 'Đại Đình', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3037, '08926', 'c6', 'vi', '26', '248', 'Tam Quan', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3038, '08929', 'c6', 'vi', '26', '248', 'Hồ Sơn', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3039, '08932', 'c6', 'vi', '26', '248', 'Minh Quang', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3040, '08935', 'c6', 'vi', '26', '249', 'Hương Canh', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3041, '08936', 'c6', 'vi', '26', '249', 'Gia Khánh', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3042, '08938', 'c6', 'vi', '26', '249', 'Trung Mỹ', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3043, '08944', 'c6', 'vi', '26', '249', 'Bá Hiến', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3044, '08947', 'c6', 'vi', '26', '249', 'Thiện Kế', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3045, '08950', 'c6', 'vi', '26', '249', 'Hương Sơn', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3046, '08953', 'c6', 'vi', '26', '249', 'Tam Hợp', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3047, '08956', 'c6', 'vi', '26', '249', 'Quất Lưu', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3048, '08959', 'c6', 'vi', '26', '249', 'Sơn Lôi', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3049, '08962', 'c6', 'vi', '26', '249', 'Đạo Đức', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3050, '08965', 'c6', 'vi', '26', '249', 'Tân Phong', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3051, '08968', 'c6', 'vi', '26', '249', 'Thanh Lãng', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3052, '08971', 'c6', 'vi', '26', '249', 'Phú Xuân', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3053, '08973', 'c6', 'vi', '01', '250', 'Chi Đông', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3054, '08974', 'c6', 'vi', '01', '250', 'Đại Thịnh', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3055, '08977', 'c6', 'vi', '01', '250', 'Kim Hoa', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3056, '08980', 'c6', 'vi', '01', '250', 'Thạch Đà', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3057, '08983', 'c6', 'vi', '01', '250', 'Tiến Thắng', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3058, '08986', 'c6', 'vi', '01', '250', 'Tự Lập', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3059, '08989', 'c6', 'vi', '01', '250', 'Quang Minh', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3060, '08992', 'c6', 'vi', '01', '250', 'Thanh Lâm', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3061, '08995', 'c6', 'vi', '01', '250', 'Tam Đồng', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3062, '08998', 'c6', 'vi', '01', '250', 'Liên Mạc', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3063, '09001', 'c6', 'vi', '01', '250', 'Vạn Yên', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3064, '09004', 'c6', 'vi', '01', '250', 'Chu Phan', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3065, '09007', 'c6', 'vi', '01', '250', 'Tiến Thịnh', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3066, '09010', 'c6', 'vi', '01', '250', 'Mê Linh', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3067, '09013', 'c6', 'vi', '01', '250', 'Văn Khê', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3068, '09016', 'c6', 'vi', '01', '250', 'Hoàng Kim', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3069, '09019', 'c6', 'vi', '01', '250', 'Tiền Phong', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3070, '09022', 'c6', 'vi', '01', '250', 'Tráng Việt', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3071, '09025', 'c6', 'vi', '26', '251', 'Yên Lạc', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3072, '09028', 'c6', 'vi', '26', '251', 'Đồng Cương', 0, 0, 1, 1415954479, 1415954479, 'vi'),
(3073, '09031', 'c6', 'vi', '26', '251', 'Đồng Văn', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3074, '09034', 'c6', 'vi', '26', '251', 'Bình Định', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3075, '09037', 'c6', 'vi', '26', '251', 'Trung Nguyên', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3076, '09040', 'c6', 'vi', '26', '251', 'Tề Lỗ', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3077, '09043', 'c6', 'vi', '26', '251', 'Tam Hồng', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3078, '09046', 'c6', 'vi', '26', '251', 'Yên Đồng', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3079, '09049', 'c6', 'vi', '26', '251', 'Văn Tiến', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3080, '09052', 'c6', 'vi', '26', '251', 'Nguyệt Đức', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3081, '09055', 'c6', 'vi', '26', '251', 'Yên Phương', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3082, '09058', 'c6', 'vi', '26', '251', 'Hồng Phương', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3083, '09061', 'c6', 'vi', '26', '251', 'Trung Kiên', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3084, '09064', 'c6', 'vi', '26', '251', 'Liên Châu', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3085, '09067', 'c6', 'vi', '26', '251', 'Đại Tự', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3086, '09070', 'c6', 'vi', '26', '251', 'Hồng Châu', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3087, '09073', 'c6', 'vi', '26', '251', 'Trung Hà', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3088, '09076', 'c6', 'vi', '26', '252', 'Vĩnh Tường', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3089, '09079', 'c6', 'vi', '26', '252', 'Kim Xá', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3090, '09082', 'c6', 'vi', '26', '252', 'Yên Bình', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3091, '09085', 'c6', 'vi', '26', '252', 'Chấn Hưng', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3092, '09088', 'c6', 'vi', '26', '252', 'Nghĩa Hưng', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3093, '09091', 'c6', 'vi', '26', '252', 'Yên Lập', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3094, '09094', 'c6', 'vi', '26', '252', 'Việt Xuân', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3095, '09097', 'c6', 'vi', '26', '252', 'Bồ Sao', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3096, '09100', 'c6', 'vi', '26', '252', 'Đại Đồng', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3097, '09103', 'c6', 'vi', '26', '252', 'Tân Tiến', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3098, '09106', 'c6', 'vi', '26', '252', 'Lũng Hoà', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3099, '09109', 'c6', 'vi', '26', '252', 'Cao Đại', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3100, '09112', 'c6', 'vi', '26', '252', 'Thổ Tang', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3101, '09115', 'c6', 'vi', '26', '252', 'Vĩnh Sơn', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3102, '09118', 'c6', 'vi', '26', '252', 'Bình Dương', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3103, '09121', 'c6', 'vi', '26', '252', 'Tân Cương', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3104, '09124', 'c6', 'vi', '26', '252', 'Phú Thịnh', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3105, '09127', 'c6', 'vi', '26', '252', 'Thượng Trưng', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3106, '09130', 'c6', 'vi', '26', '252', 'Vũ Di', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3107, '09133', 'c6', 'vi', '26', '252', 'Lý Nhân', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3108, '09136', 'c6', 'vi', '26', '252', 'Tuân Chính', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3109, '09139', 'c6', 'vi', '26', '252', 'Vân Xuân', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3110, '09142', 'c6', 'vi', '26', '252', 'Tam Phúc', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3111, '09145', 'c6', 'vi', '26', '252', 'Tứ Trưng', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3112, '09148', 'c6', 'vi', '26', '252', 'Ngũ Kiên', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3113, '09151', 'c6', 'vi', '26', '252', 'An Tường', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3114, '09154', 'c6', 'vi', '26', '252', 'Vĩnh Thịnh', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3115, '09157', 'c6', 'vi', '26', '252', 'Phú Đa', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3116, '09160', 'c6', 'vi', '26', '252', 'Vĩnh Ninh', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3117, '09163', 'c6', 'vi', '27', '256', 'Vũ Ninh', 0, 0, 1, 1415954480, 1415954480, 'vi'),
(3118, '09166', 'c6', 'vi', '27', '256', 'Đáp Cầu', 0, 0, 1, 1415954481, 1415954481, 'vi'),
(3119, '09169', 'c6', 'vi', '27', '256', 'Thị Cầu', 0, 0, 1, 1415954481, 1415954481, 'vi'),
(3120, '09172', 'c6', 'vi', '27', '256', 'Kinh Bắc', 0, 0, 1, 1415954481, 1415954481, 'vi'),
(3121, '09175', 'c6', 'vi', '27', '256', 'Vệ An', 0, 0, 1, 1415954481, 1415954481, 'vi'),
(3122, '09178', 'c6', 'vi', '27', '256', 'Tiền An', 0, 0, 1, 1415954481, 1415954481, 'vi'),
(3123, '09181', 'c6', 'vi', '27', '256', 'Đại Phúc', 0, 0, 1, 1415954481, 1415954481, 'vi'),
(3124, '09184', 'c6', 'vi', '27', '256', 'Ninh Xá', 0, 0, 1, 1415954481, 1415954481, 'vi'),
(3125, '09187', 'c6', 'vi', '27', '256', 'Suối Hoa', 0, 0, 1, 1415954481, 1415954481, 'vi'),
(3126, '09190', 'c6', 'vi', '27', '256', 'Võ Cường', 0, 0, 1, 1415954481, 1415954481, 'vi'),
(3127, '09193', 'c6', 'vi', '27', '258', 'Chờ', 0, 0, 1, 1415954481, 1415954481, 'vi'),
(3128, '09196', 'c6', 'vi', '27', '258', 'Dũng Liệt', 0, 0, 1, 1415954481, 1415954481, 'vi'),
(3129, '09199', 'c6', 'vi', '27', '258', 'Tam Đa', 0, 0, 1, 1415954481, 1415954481, 'vi'),
(3130, '09202', 'c6', 'vi', '27', '258', 'Tam Giang', 0, 0, 1, 1415954481, 1415954481, 'vi'),
(3131, '09205', 'c6', 'vi', '27', '258', 'Yên Trung', 0, 0, 1, 1415954481, 1415954481, 'vi'),
(3132, '09208', 'c6', 'vi', '27', '258', 'Thụy Hòa', 0, 0, 1, 1415954481, 1415954481, 'vi'),
(3133, '09211', 'c6', 'vi', '27', '258', 'Hòa Tiến', 0, 0, 1, 1415954481, 1415954481, 'vi'),
(3134, '09214', 'c6', 'vi', '27', '256', 'Hòa Long', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3135, '09217', 'c6', 'vi', '27', '258', 'Đông Tiến', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3136, '09220', 'c6', 'vi', '27', '258', 'Yên Phụ', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3137, '09223', 'c6', 'vi', '27', '258', 'Trung Nghĩa', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3138, '09226', 'c6', 'vi', '27', '256', 'Vạn An', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3139, '09229', 'c6', 'vi', '27', '258', 'Đông Phong', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3140, '09232', 'c6', 'vi', '27', '258', 'Long Châu', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3141, '09235', 'c6', 'vi', '27', '256', 'Khúc Xuyên', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3142, '09238', 'c6', 'vi', '27', '258', 'Văn Môn', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3143, '09241', 'c6', 'vi', '27', '258', 'Đông Thọ', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3144, '09244', 'c6', 'vi', '27', '256', 'Phong Khê', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3145, '09247', 'c6', 'vi', '27', '259', 'Phố Mới', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3146, '09250', 'c6', 'vi', '27', '259', 'Việt Thống', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3147, '09253', 'c6', 'vi', '27', '259', 'Đại Xuân', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3148, '09256', 'c6', 'vi', '27', '256', 'Kim Chân', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3149, '09259', 'c6', 'vi', '27', '259', 'Nhân Hòa', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3150, '09262', 'c6', 'vi', '27', '259', 'Bằng An', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3151, '09265', 'c6', 'vi', '27', '259', 'Phương Liễu', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3152, '09268', 'c6', 'vi', '27', '259', 'Quế Tân', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3153, '09271', 'c6', 'vi', '27', '256', 'Vân Dương', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3154, '09274', 'c6', 'vi', '27', '259', 'Phù Lương', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3155, '09277', 'c6', 'vi', '27', '259', 'Phù Lãng', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3156, '09280', 'c6', 'vi', '27', '259', 'Phượng Mao', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3157, '09283', 'c6', 'vi', '27', '259', 'Việt Hùng', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3158, '09286', 'c6', 'vi', '27', '256', 'Nam Sơn', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3159, '09289', 'c6', 'vi', '27', '259', 'Ngọc Xá', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3160, '09292', 'c6', 'vi', '27', '259', 'Châu Phong', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3161, '09295', 'c6', 'vi', '27', '259', 'Bồng Lai', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3162, '09298', 'c6', 'vi', '27', '259', 'Cách Bi', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3163, '09301', 'c6', 'vi', '27', '259', 'Đào Viên', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3164, '09304', 'c6', 'vi', '27', '259', 'Yên Giả', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3165, '09307', 'c6', 'vi', '27', '259', 'Mộ Đạo', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3166, '09310', 'c6', 'vi', '27', '259', 'Đức Long', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3167, '09313', 'c6', 'vi', '27', '259', 'Chi Lăng', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3168, '09316', 'c6', 'vi', '27', '259', 'Hán Quảng', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3169, '09319', 'c6', 'vi', '27', '260', 'Lim', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3170, '09322', 'c6', 'vi', '27', '260', 'Phú Lâm', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3171, '09325', 'c6', 'vi', '27', '256', 'Khắc Niệm', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3172, '09328', 'c6', 'vi', '27', '260', 'Nội Duệ', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3173, '09331', 'c6', 'vi', '27', '256', 'Hạp Lĩnh', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3174, '09334', 'c6', 'vi', '27', '260', 'Liên Bão', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3175, '09337', 'c6', 'vi', '27', '260', 'Hiên Vân', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3176, '09340', 'c6', 'vi', '27', '260', 'Hoàn Sơn', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3177, '09343', 'c6', 'vi', '27', '260', 'Lạc Vệ', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3178, '09346', 'c6', 'vi', '27', '260', 'Việt Đoàn', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3179, '09349', 'c6', 'vi', '27', '260', 'Phật Tích', 0, 0, 1, 1415954482, 1415954482, 'vi'),
(3180, '09352', 'c6', 'vi', '27', '260', 'Tân Chi', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3181, '09355', 'c6', 'vi', '27', '260', 'Đại Đồng', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3182, '09358', 'c6', 'vi', '27', '260', 'Tri Phương', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3183, '09361', 'c6', 'vi', '27', '260', 'Minh Đạo', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3184, '09364', 'c6', 'vi', '27', '260', 'Cảnh Hưng', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3185, '09367', 'c6', 'vi', '27', '261', 'Đông Ngàn', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3186, '09370', 'c6', 'vi', '27', '261', 'Tam Sơn', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3187, '09373', 'c6', 'vi', '27', '261', 'Hương Mạc', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3188, '09376', 'c6', 'vi', '27', '261', 'Tương Giang', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3189, '09379', 'c6', 'vi', '27', '261', 'Phù Khê', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3190, '09382', 'c6', 'vi', '27', '261', 'Đồng Kỵ', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3191, '09383', 'c6', 'vi', '27', '261', 'Trang Hạ', 0, 0, 1, 1415954483, 1415954483, 'vi');
INSERT INTO `location_ward` (`id`, `code`, `area_code`, `country_code`, `province_code`, `district_code`, `title`, `is_extramural`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(3192, '09385', 'c6', 'vi', '27', '261', 'Đồng Nguyên', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3193, '09388', 'c6', 'vi', '27', '261', 'Châu Khê', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3194, '09391', 'c6', 'vi', '27', '261', 'Tân Hồng', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3195, '09394', 'c6', 'vi', '27', '261', 'Đình Bảng', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3196, '09397', 'c6', 'vi', '27', '261', 'Phù Chẩn', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3197, '09400', 'c6', 'vi', '27', '262', 'Hồ', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3198, '09403', 'c6', 'vi', '27', '262', 'Hoài Thượng', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3199, '09406', 'c6', 'vi', '27', '262', 'Đại Đồng Thành', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3200, '09409', 'c6', 'vi', '27', '262', 'Mão Điền', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3201, '09412', 'c6', 'vi', '27', '262', 'Song Hồ', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3202, '09415', 'c6', 'vi', '27', '262', 'Đình Tổ', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3203, '09418', 'c6', 'vi', '27', '262', 'An Bình', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3204, '09421', 'c6', 'vi', '27', '262', 'Trí Quả', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3205, '09424', 'c6', 'vi', '27', '262', 'Gia Đông', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3206, '09427', 'c6', 'vi', '27', '262', 'Thanh Khương', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3207, '09430', 'c6', 'vi', '27', '262', 'Trạm Lộ', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3208, '09433', 'c6', 'vi', '27', '262', 'Xuân Lâm', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3209, '09436', 'c6', 'vi', '27', '262', 'Hà Mãn', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3210, '09439', 'c6', 'vi', '27', '262', 'Ngũ Thái', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3211, '09442', 'c6', 'vi', '27', '262', 'Nguyệt Đức', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3212, '09445', 'c6', 'vi', '27', '262', 'Ninh Xá', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3213, '09448', 'c6', 'vi', '27', '262', 'Nghĩa Đạo', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3214, '09451', 'c6', 'vi', '27', '262', 'Song Liễu', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3215, '09454', 'c6', 'vi', '27', '263', 'Gia Bình', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3216, '09457', 'c6', 'vi', '27', '263', 'Vạn Ninh', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3217, '09460', 'c6', 'vi', '27', '263', 'Thái Bảo', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3218, '09463', 'c6', 'vi', '27', '263', 'Giang Sơn', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3219, '09466', 'c6', 'vi', '27', '263', 'Cao Đức', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3220, '09469', 'c6', 'vi', '27', '263', 'Đại Lai', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3221, '09472', 'c6', 'vi', '27', '263', 'Song Giang', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3222, '09475', 'c6', 'vi', '27', '263', 'Bình Dương', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3223, '09478', 'c6', 'vi', '27', '263', 'Lãng Ngâm', 0, 0, 1, 1415954483, 1415954483, 'vi'),
(3224, '09481', 'c6', 'vi', '27', '263', 'Nhân Thắng', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3225, '09484', 'c6', 'vi', '27', '263', 'Xuân Lai', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3226, '09487', 'c6', 'vi', '27', '263', 'Đông Cứu', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3227, '09490', 'c6', 'vi', '27', '263', 'Đại Bái', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3228, '09493', 'c6', 'vi', '27', '263', 'Quỳnh Phú', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3229, '09496', 'c6', 'vi', '27', '264', 'Thứa', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3230, '09499', 'c6', 'vi', '27', '264', 'An Thịnh', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3231, '09502', 'c6', 'vi', '27', '264', 'Trung Kênh', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3232, '09505', 'c6', 'vi', '27', '264', 'Phú Hòa', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3233, '09508', 'c6', 'vi', '27', '264', 'Mỹ Hương', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3234, '09511', 'c6', 'vi', '27', '264', 'Tân Lãng', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3235, '09514', 'c6', 'vi', '27', '264', 'Quảng Phú', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3236, '09517', 'c6', 'vi', '27', '264', 'Trừng Xá', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3237, '09520', 'c6', 'vi', '27', '264', 'Lai Hạ', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3238, '09523', 'c6', 'vi', '27', '264', 'Trung Chính', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3239, '09526', 'c6', 'vi', '27', '264', 'Minh Tân', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3240, '09529', 'c6', 'vi', '27', '264', 'Bình Định', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3241, '09532', 'c6', 'vi', '27', '264', 'Phú Lương', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3242, '09535', 'c6', 'vi', '27', '264', 'Lâm Thao', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3243, '09538', 'c6', 'vi', '01', '268', 'Nguyễn Trãi', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3244, '09541', 'c6', 'vi', '01', '268', 'Mộ Lao', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3245, '09542', 'c6', 'vi', '01', '268', 'Văn Quán', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3246, '09544', 'c6', 'vi', '01', '268', 'Vạn Phúc', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3247, '09547', 'c6', 'vi', '01', '268', 'Yết Kiêu', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3248, '09550', 'c6', 'vi', '01', '268', 'Quang Trung', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3249, '09551', 'c6', 'vi', '01', '268', 'La Khê', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3250, '09552', 'c6', 'vi', '01', '268', 'Phú La', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3251, '09553', 'c6', 'vi', '01', '268', 'Phúc La', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3252, '09556', 'c6', 'vi', '01', '268', 'Hà Cầu', 0, 0, 1, 1415954484, 1415954484, 'vi'),
(3253, '09562', 'c6', 'vi', '01', '268', 'Yên Nghĩa', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3254, '09565', 'c6', 'vi', '01', '268', 'Kiến Hưng', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3255, '09568', 'c6', 'vi', '01', '268', 'Phú Lãm', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3256, '09571', 'c6', 'vi', '01', '268', 'Phú Lương', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3257, '09574', 'c6', 'vi', '01', '269', 'Lê Lợi', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3258, '09577', 'c6', 'vi', '01', '269', 'Phú Thịnh', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3259, '09580', 'c6', 'vi', '01', '269', 'Ngô Quyền', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3260, '09583', 'c6', 'vi', '01', '269', 'Quang Trung', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3261, '09586', 'c6', 'vi', '01', '269', 'Sơn Lộc', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3262, '09589', 'c6', 'vi', '01', '269', 'Xuân Khanh', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3263, '09592', 'c6', 'vi', '01', '269', 'Đường Lâm', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3264, '09595', 'c6', 'vi', '01', '269', 'Viên Sơn', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3265, '09598', 'c6', 'vi', '01', '269', 'Xuân Sơn', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3266, '09601', 'c6', 'vi', '01', '269', 'Trung Hưng', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3267, '09604', 'c6', 'vi', '01', '269', 'Thanh Mỹ', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3268, '09607', 'c6', 'vi', '01', '269', 'Trung Sơn Trầm', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3269, '09610', 'c6', 'vi', '01', '269', 'Kim Sơn', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3270, '09613', 'c6', 'vi', '01', '269', 'Sơn Đông', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3271, '09616', 'c6', 'vi', '01', '269', 'Cổ Đông', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3272, '09619', 'c6', 'vi', '01', '271', 'Tây Đằng', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3273, '09622', 'c6', 'vi', '25', '227', 'Tân Đức', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3274, '09625', 'c6', 'vi', '01', '271', 'Phú Cường', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3275, '09628', 'c6', 'vi', '01', '271', 'Cổ Đô', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3276, '09631', 'c6', 'vi', '01', '271', 'Tản Hồng', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3277, '09634', 'c6', 'vi', '01', '271', 'Vạn Thắng', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3278, '09637', 'c6', 'vi', '01', '271', 'Châu Sơn', 0, 0, 1, 1415954485, 1415954485, 'vi'),
(3279, '09640', 'c6', 'vi', '01', '271', 'Phong Vân', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3280, '09643', 'c6', 'vi', '01', '271', 'Phú Đông', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3281, '09646', 'c6', 'vi', '01', '271', 'Phú Phương', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3282, '09649', 'c6', 'vi', '01', '271', 'Phú Châu', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3283, '09652', 'c6', 'vi', '01', '271', 'Thái Hòa', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3284, '09655', 'c6', 'vi', '01', '271', 'Đồng Thái', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3285, '09658', 'c6', 'vi', '01', '271', 'Phú Sơn', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3286, '09661', 'c6', 'vi', '01', '271', 'Minh Châu', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3287, '09664', 'c6', 'vi', '01', '271', 'Vật Lại', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3288, '09667', 'c6', 'vi', '01', '271', 'Chu Minh', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3289, '09670', 'c6', 'vi', '01', '271', 'Tòng Bạt', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3290, '09673', 'c6', 'vi', '01', '271', 'Cẩm Lĩnh', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3291, '09676', 'c6', 'vi', '01', '271', 'Sơn Đà', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3292, '09679', 'c6', 'vi', '01', '271', 'Đông Quang', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3293, '09682', 'c6', 'vi', '01', '271', 'Tiên Phong', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3294, '09685', 'c6', 'vi', '01', '271', 'Thụy An', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3295, '09688', 'c6', 'vi', '01', '271', 'Cam Thượng', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3296, '09691', 'c6', 'vi', '01', '271', 'Thuần Mỹ', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3297, '09694', 'c6', 'vi', '01', '271', 'Tản Lĩnh', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3298, '09697', 'c6', 'vi', '01', '271', 'Ba Trại', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3299, '09700', 'c6', 'vi', '01', '271', 'Minh Quang', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3300, '09703', 'c6', 'vi', '01', '271', 'Ba Vì', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3301, '09706', 'c6', 'vi', '01', '271', 'Vân Hòa', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3302, '09709', 'c6', 'vi', '01', '271', 'Yên Bài', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3303, '09712', 'c6', 'vi', '01', '271', 'Khánh Thượng', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3304, '09715', 'c6', 'vi', '01', '272', 'Phúc Thọ', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3305, '09718', 'c6', 'vi', '01', '272', 'Vân Hà', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3306, '09721', 'c6', 'vi', '01', '272', 'Vân Phúc', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3307, '09724', 'c6', 'vi', '01', '272', 'Vân Nam', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3308, '09727', 'c6', 'vi', '01', '272', 'Xuân Phú', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3309, '09730', 'c6', 'vi', '01', '272', 'Phương Độ', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3310, '09733', 'c6', 'vi', '01', '272', 'Sen Chiểu', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3311, '09736', 'c6', 'vi', '01', '272', 'Cẩm Đình', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3312, '09739', 'c6', 'vi', '01', '272', 'Võng Xuyên', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3313, '09742', 'c6', 'vi', '01', '272', 'Thọ Lộc', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3314, '09745', 'c6', 'vi', '01', '272', 'Long Xuyên', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3315, '09748', 'c6', 'vi', '01', '272', 'Thượng Cốc', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3316, '09751', 'c6', 'vi', '01', '272', 'Hát Môn', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3317, '09754', 'c6', 'vi', '01', '272', 'Tích Giang', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3318, '09757', 'c6', 'vi', '01', '272', 'Thanh Đa', 0, 0, 1, 1415954486, 1415954486, 'vi'),
(3319, '09760', 'c6', 'vi', '01', '272', 'Trạch Mỹ Lộc', 0, 0, 1, 1415954487, 1415954487, 'vi'),
(3320, '09763', 'c6', 'vi', '01', '272', 'Phúc Hòa', 0, 0, 1, 1415954487, 1415954487, 'vi'),
(3321, '09766', 'c6', 'vi', '01', '272', 'Ngọc Tảo', 0, 0, 1, 1415954487, 1415954487, 'vi'),
(3322, '09769', 'c6', 'vi', '01', '272', 'Phụng Thượng', 0, 0, 1, 1415954487, 1415954487, 'vi'),
(3323, '09772', 'c6', 'vi', '01', '272', 'Tam Thuấn', 0, 0, 1, 1415954487, 1415954487, 'vi'),
(3324, '09775', 'c6', 'vi', '01', '272', 'Tam Hiệp', 0, 0, 1, 1415954487, 1415954487, 'vi'),
(3325, '09778', 'c6', 'vi', '01', '272', 'Hiệp Thuận', 0, 0, 1, 1415954487, 1415954487, 'vi'),
(3326, '09781', 'c6', 'vi', '01', '272', 'Liên Hiệp', 0, 0, 1, 1415954487, 1415954487, 'vi'),
(3327, '09784', 'c6', 'vi', '01', '273', 'Phùng', 0, 0, 1, 1415954487, 1415954487, 'vi'),
(3328, '09787', 'c6', 'vi', '01', '273', 'Trung Châu', 0, 0, 1, 1415954487, 1415954487, 'vi'),
(3329, '09790', 'c6', 'vi', '01', '273', 'Thọ An', 0, 0, 1, 1415954487, 1415954487, 'vi'),
(3330, '09793', 'c6', 'vi', '01', '273', 'Thọ Xuân', 0, 0, 1, 1415954487, 1415954487, 'vi'),
(3331, '09796', 'c6', 'vi', '01', '273', 'Hồng Hà', 0, 0, 1, 1415954487, 1415954487, 'vi'),
(3332, '09799', 'c6', 'vi', '01', '273', 'Liên Hồng', 0, 0, 1, 1415954487, 1415954487, 'vi'),
(3333, '09802', 'c6', 'vi', '01', '273', 'Liên Hà', 0, 0, 1, 1415954487, 1415954487, 'vi'),
(3334, '09805', 'c6', 'vi', '01', '273', 'Hạ Mỗ', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3335, '09808', 'c6', 'vi', '01', '273', 'Liên Trung', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3336, '09811', 'c6', 'vi', '01', '273', 'Phương Đình', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3337, '09814', 'c6', 'vi', '01', '273', 'Thượng Mỗ', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3338, '09817', 'c6', 'vi', '01', '273', 'Tân Hội', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3339, '09820', 'c6', 'vi', '01', '273', 'Tân Lập', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3340, '09823', 'c6', 'vi', '01', '273', 'Đan Phượng', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3341, '09826', 'c6', 'vi', '01', '273', 'Đồng Tháp', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3342, '09829', 'c6', 'vi', '01', '273', 'Song Phượng', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3343, '09832', 'c6', 'vi', '01', '274', 'Trạm Trôi', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3344, '09835', 'c6', 'vi', '01', '274', 'Đức Thượng', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3345, '09838', 'c6', 'vi', '01', '274', 'Minh Khai', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3346, '09841', 'c6', 'vi', '01', '274', 'Dương Liễu', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3347, '09844', 'c6', 'vi', '01', '274', 'Di Trạch', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3348, '09847', 'c6', 'vi', '01', '274', 'Đức Giang', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3349, '09850', 'c6', 'vi', '01', '274', 'Cát Quế', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3350, '09853', 'c6', 'vi', '01', '274', 'Kim Chung', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3351, '09856', 'c6', 'vi', '01', '274', 'Yên Sở', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3352, '09859', 'c6', 'vi', '01', '274', 'Sơn Đồng', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3353, '09862', 'c6', 'vi', '01', '274', 'Vân Canh', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3354, '09865', 'c6', 'vi', '01', '274', 'Đắc Sở', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3355, '09868', 'c6', 'vi', '01', '274', 'Lại Yên', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3356, '09871', 'c6', 'vi', '01', '274', 'Tiền Yên', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3357, '09874', 'c6', 'vi', '01', '274', 'Song Phương', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3358, '09877', 'c6', 'vi', '01', '274', 'An Khánh', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3359, '09880', 'c6', 'vi', '01', '274', 'An Thượng', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3360, '09883', 'c6', 'vi', '01', '274', 'Vân Côn', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3361, '09886', 'c6', 'vi', '01', '268', 'Dương Nội', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3362, '09889', 'c6', 'vi', '01', '274', 'La Phù', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3363, '09892', 'c6', 'vi', '01', '274', 'Đông La', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3364, '09895', 'c6', 'vi', '01', '275', 'Quốc Oai', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3365, '09898', 'c6', 'vi', '01', '275', 'Sài Sơn', 0, 0, 1, 1415954488, 1415954488, 'vi'),
(3366, '09901', 'c6', 'vi', '01', '275', 'Phượng Cách', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3367, '09904', 'c6', 'vi', '01', '275', 'Yên Sơn', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3368, '09907', 'c6', 'vi', '01', '275', 'Ngọc Liệp', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3369, '09910', 'c6', 'vi', '01', '275', 'Ngọc Mỹ', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3370, '09913', 'c6', 'vi', '01', '275', 'Liệp Tuyết', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3371, '09916', 'c6', 'vi', '01', '275', 'Thạch Thán', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3372, '09919', 'c6', 'vi', '01', '275', 'Đồng Quang', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3373, '09922', 'c6', 'vi', '01', '275', 'Phú Cát', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3374, '09925', 'c6', 'vi', '01', '275', 'Tuyết Nghĩa', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3375, '09928', 'c6', 'vi', '01', '275', 'Nghĩa Hương', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3376, '09931', 'c6', 'vi', '01', '275', 'Cộng Hòa', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3377, '09934', 'c6', 'vi', '01', '275', 'Tân Phú', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3378, '09937', 'c6', 'vi', '01', '275', 'Đại Thành', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3379, '09940', 'c6', 'vi', '01', '275', 'Phú Mãn', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3380, '09943', 'c6', 'vi', '01', '275', 'Cấn Hữu', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3381, '09946', 'c6', 'vi', '01', '275', 'Tân Hòa', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3382, '09949', 'c6', 'vi', '01', '275', 'Hòa Thạch', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3383, '09952', 'c6', 'vi', '01', '275', 'Đông Yên', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3384, '09955', 'c6', 'vi', '01', '276', 'Liên Quan', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3385, '09958', 'c6', 'vi', '01', '276', 'Đại Đồng', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3386, '09961', 'c6', 'vi', '01', '276', 'Cẩm Yên', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3387, '09964', 'c6', 'vi', '01', '276', 'Lại Thượng', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3388, '09967', 'c6', 'vi', '01', '276', 'Phú Kim', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3389, '09970', 'c6', 'vi', '01', '276', 'Hương Ngải', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3390, '09973', 'c6', 'vi', '01', '276', 'Canh Nậu', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3391, '09976', 'c6', 'vi', '01', '276', 'Kim Quan', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3392, '09979', 'c6', 'vi', '01', '276', 'Dị Nậu', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3393, '09982', 'c6', 'vi', '01', '276', 'Bình Yên', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3394, '09985', 'c6', 'vi', '01', '276', 'Chàng Sơn', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3395, '09988', 'c6', 'vi', '01', '276', 'Thạch Hoà', 0, 0, 1, 1415954489, 1415954489, 'vi'),
(3396, '09991', 'c6', 'vi', '01', '276', 'Cần Kiệm', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3397, '09994', 'c6', 'vi', '01', '276', 'Hữu Bằng', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3398, '09997', 'c6', 'vi', '01', '276', 'Phùng Xá', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3399, '10000', 'c6', 'vi', '01', '276', 'Tân Xã', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3400, '10003', 'c6', 'vi', '01', '276', 'Thạch Xá', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3401, '10006', 'c6', 'vi', '01', '276', 'Bình Phú', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3402, '10009', 'c6', 'vi', '01', '276', 'Hạ Bằng', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3403, '10012', 'c6', 'vi', '01', '276', 'Đồng Trúc', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3404, '10015', 'c6', 'vi', '01', '277', 'Chúc Sơn', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3405, '10018', 'c6', 'vi', '01', '277', 'Xuân Mai', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3406, '10021', 'c6', 'vi', '01', '277', 'Phụng Châu', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3407, '10024', 'c6', 'vi', '01', '277', 'Tiên Phương', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3408, '10027', 'c6', 'vi', '01', '277', 'Đông Sơn', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3409, '10030', 'c6', 'vi', '01', '277', 'Đông Phương Yên', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3410, '10033', 'c6', 'vi', '01', '277', 'Phú Nghĩa', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3411, '10039', 'c6', 'vi', '01', '277', 'Trường Yên', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3412, '10042', 'c6', 'vi', '01', '277', 'Ngọc Hòa', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3413, '10045', 'c6', 'vi', '01', '277', 'Thủy Xuân Tiên', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3414, '10048', 'c6', 'vi', '01', '277', 'Thanh Bình', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3415, '10051', 'c6', 'vi', '01', '277', 'Trung Hòa', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3416, '10054', 'c6', 'vi', '01', '277', 'Đại Yên', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3417, '10057', 'c6', 'vi', '01', '277', 'Thụy Hương', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3418, '10060', 'c6', 'vi', '01', '277', 'Tốt Động', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3419, '10063', 'c6', 'vi', '01', '277', 'Lam Điền', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3420, '10066', 'c6', 'vi', '01', '277', 'Tân Tiến', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3421, '10069', 'c6', 'vi', '01', '277', 'Nam Phương Tiến', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3422, '10072', 'c6', 'vi', '01', '277', 'Hợp Đồng', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3423, '10075', 'c6', 'vi', '01', '277', 'Hoàng Văn Thụ', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3424, '10078', 'c6', 'vi', '01', '277', 'Hoàng Diệu', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3425, '10081', 'c6', 'vi', '01', '277', 'Hữu Văn', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3426, '10084', 'c6', 'vi', '01', '277', 'Quảng Bị', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3427, '10087', 'c6', 'vi', '01', '277', 'Mỹ Lương', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3428, '10090', 'c6', 'vi', '01', '277', 'Thượng Vực', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3429, '10093', 'c6', 'vi', '01', '277', 'Hồng Phong', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3430, '10096', 'c6', 'vi', '01', '277', 'Đồng Phú', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3431, '10099', 'c6', 'vi', '01', '277', 'Trần Phú', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3432, '10102', 'c6', 'vi', '01', '277', 'Văn Võ', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3433, '10105', 'c6', 'vi', '01', '277', 'Đồng Lạc', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3434, '10108', 'c6', 'vi', '01', '277', 'Hòa Chính', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3435, '10111', 'c6', 'vi', '01', '277', 'Phú Nam An', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3436, '10114', 'c6', 'vi', '01', '278', 'Kim Bài', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3437, '10117', 'c6', 'vi', '01', '268', 'Đồng Mai', 0, 0, 1, 1415954490, 1415954490, 'vi'),
(3438, '10120', 'c6', 'vi', '01', '278', 'Cự Khê', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3439, '10123', 'c6', 'vi', '01', '268', 'Biên Giang', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3440, '10126', 'c6', 'vi', '01', '278', 'Bích Hòa', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3441, '10129', 'c6', 'vi', '01', '278', 'Mỹ Hưng', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3442, '10132', 'c6', 'vi', '01', '278', 'Cao Viên', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3443, '10135', 'c6', 'vi', '01', '278', 'Bình Minh', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3444, '10138', 'c6', 'vi', '01', '278', 'Tam Hưng', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3445, '10141', 'c6', 'vi', '01', '278', 'Thanh Cao', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3446, '10144', 'c6', 'vi', '01', '278', 'Thanh Thùy', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3447, '10147', 'c6', 'vi', '01', '278', 'Thanh Mai', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3448, '10150', 'c6', 'vi', '01', '278', 'Thanh Văn', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3449, '10153', 'c6', 'vi', '01', '278', 'Đỗ Động', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3450, '10156', 'c6', 'vi', '01', '278', 'Kim An', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3451, '10159', 'c6', 'vi', '01', '278', 'Kim Thư', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3452, '10162', 'c6', 'vi', '01', '278', 'Phương Trung', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3453, '10165', 'c6', 'vi', '01', '278', 'Tân Ước', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3454, '10168', 'c6', 'vi', '01', '278', 'Dân Hòa', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3455, '10171', 'c6', 'vi', '01', '278', 'Liên Châu', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3456, '10174', 'c6', 'vi', '01', '278', 'Cao Dương', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3457, '10177', 'c6', 'vi', '01', '278', 'Xuân Dương', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3458, '10180', 'c6', 'vi', '01', '278', 'Hồng Dương', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3459, '10183', 'c6', 'vi', '01', '279', 'Thường Tín', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3460, '10186', 'c6', 'vi', '01', '279', 'Ninh Sở', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3461, '10189', 'c6', 'vi', '01', '279', 'Nhị Khê', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3462, '10192', 'c6', 'vi', '01', '279', 'Duyên Thái', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3463, '10195', 'c6', 'vi', '01', '279', 'Khánh Hà', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3464, '10198', 'c6', 'vi', '01', '279', 'Hòa Bình', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3465, '10201', 'c6', 'vi', '01', '279', 'Văn Bình', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3466, '10204', 'c6', 'vi', '01', '279', 'Hiền Giang', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3467, '10207', 'c6', 'vi', '01', '279', 'Hồng Vân', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3468, '10210', 'c6', 'vi', '01', '279', 'Vân Tảo', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3469, '10213', 'c6', 'vi', '01', '279', 'Liên Phương', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3470, '10216', 'c6', 'vi', '01', '279', 'Văn Phú', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3471, '10219', 'c6', 'vi', '01', '279', 'Tự Nhiên', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3472, '10222', 'c6', 'vi', '01', '279', 'Tiền Phong', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3473, '10225', 'c6', 'vi', '01', '279', 'Hà Hồi', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3474, '10228', 'c6', 'vi', '01', '279', 'Thư Phú', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3475, '10231', 'c6', 'vi', '01', '279', 'Nguyễn Trãi', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3476, '10234', 'c6', 'vi', '01', '279', 'Quất Động', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3477, '10237', 'c6', 'vi', '01', '279', 'Chương Dương', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3478, '10240', 'c6', 'vi', '01', '279', 'Tân Minh', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3479, '10243', 'c6', 'vi', '01', '279', 'Lê Lợi', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3480, '10246', 'c6', 'vi', '01', '279', 'Thắng Lợi', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3481, '10249', 'c6', 'vi', '01', '279', 'Dũng Tiến', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3482, '10252', 'c6', 'vi', '01', '279', 'Thống Nhất', 0, 0, 1, 1415954491, 1415954491, 'vi'),
(3483, '10255', 'c6', 'vi', '01', '279', 'Nghiêm Xuyên', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3484, '10258', 'c6', 'vi', '01', '279', 'Tô Hiệu', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3485, '10261', 'c6', 'vi', '01', '279', 'Văn Tự', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3486, '10264', 'c6', 'vi', '01', '279', 'Vạn Điểm', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3487, '10267', 'c6', 'vi', '01', '279', 'Minh Cường', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3488, '10270', 'c6', 'vi', '01', '280', 'Phú Minh', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3489, '10273', 'c6', 'vi', '01', '280', 'Phú Xuyên', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3490, '10276', 'c6', 'vi', '01', '280', 'Hồng Minh', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3491, '10279', 'c6', 'vi', '01', '280', 'Phượng Dực', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3492, '10282', 'c6', 'vi', '01', '280', 'Văn Nhân', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3493, '10285', 'c6', 'vi', '01', '280', 'Thụy Phú', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3494, '10288', 'c6', 'vi', '01', '280', 'Tri Trung', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3495, '10291', 'c6', 'vi', '01', '280', 'Đại Thắng', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3496, '10294', 'c6', 'vi', '01', '280', 'Phú Túc', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3497, '10297', 'c6', 'vi', '01', '280', 'Văn Hoàng', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3498, '10300', 'c6', 'vi', '01', '280', 'Hồng Thái', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3499, '10303', 'c6', 'vi', '01', '280', 'Hoàng Long', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3500, '10306', 'c6', 'vi', '01', '280', 'Quang Trung', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3501, '10309', 'c6', 'vi', '01', '280', 'Nam Phong', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3502, '10312', 'c6', 'vi', '01', '280', 'Nam Triều', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3503, '10315', 'c6', 'vi', '01', '280', 'Tân Dân', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3504, '10318', 'c6', 'vi', '01', '280', 'Sơn Hà', 0, 0, 1, 1415954492, 1415954492, 'vi'),
(3505, '10321', 'c6', 'vi', '01', '280', 'Chuyên Mỹ', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3506, '10324', 'c6', 'vi', '01', '280', 'Khai Thái', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3507, '10327', 'c6', 'vi', '01', '280', 'Phúc Tiến', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3508, '10330', 'c6', 'vi', '01', '280', 'Vân Từ', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3509, '10333', 'c6', 'vi', '01', '280', 'Tri Thủy', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3510, '10336', 'c6', 'vi', '01', '280', 'Đại Xuyên', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3511, '10339', 'c6', 'vi', '01', '280', 'Phú Yên', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3512, '10342', 'c6', 'vi', '01', '280', 'Bạch Hạ', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3513, '10345', 'c6', 'vi', '01', '280', 'Quang Lãng', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3514, '10348', 'c6', 'vi', '01', '280', 'Châu Can', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3515, '10351', 'c6', 'vi', '01', '280', 'Minh Tân', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3516, '10354', 'c6', 'vi', '01', '281', 'Vân Đình', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3517, '10357', 'c6', 'vi', '01', '281', 'Viên An', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3518, '10360', 'c6', 'vi', '01', '281', 'Viên Nội', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3519, '10363', 'c6', 'vi', '01', '281', 'Hoa Sơn', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3520, '10366', 'c6', 'vi', '01', '281', 'Quảng Phú Cầu', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3521, '10369', 'c6', 'vi', '01', '281', 'Trường Thịnh', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3522, '10372', 'c6', 'vi', '01', '281', 'Cao Thành', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3523, '10375', 'c6', 'vi', '01', '281', 'Liên Bạt', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3524, '10378', 'c6', 'vi', '01', '281', 'Sơn Công', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3525, '10381', 'c6', 'vi', '01', '281', 'Đồng Tiến', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3526, '10384', 'c6', 'vi', '01', '281', 'Phương Tú', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3527, '10387', 'c6', 'vi', '01', '281', 'Trung Tú', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3528, '10390', 'c6', 'vi', '01', '281', 'Đồng Tân', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3529, '10393', 'c6', 'vi', '01', '281', 'Tảo Dương Văn', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3530, '10396', 'c6', 'vi', '01', '281', 'Vạn Thái', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3531, '10399', 'c6', 'vi', '01', '281', 'Minh Đức', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3532, '10402', 'c6', 'vi', '01', '281', 'Hòa Lâm', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3533, '10405', 'c6', 'vi', '01', '281', 'Hòa Xá', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3534, '10408', 'c6', 'vi', '01', '281', 'Trầm Lộng', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3535, '10411', 'c6', 'vi', '01', '281', 'Kim Đường', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3536, '10414', 'c6', 'vi', '01', '281', 'Hòa Nam', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3537, '10417', 'c6', 'vi', '01', '281', 'Hòa Phú', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3538, '10420', 'c6', 'vi', '01', '281', 'Đội Bình', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3539, '10423', 'c6', 'vi', '01', '281', 'Đại Hùng', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3540, '10426', 'c6', 'vi', '01', '281', 'Đông Lỗ', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3541, '10429', 'c6', 'vi', '01', '281', 'Phù Lưu', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3542, '10432', 'c6', 'vi', '01', '281', 'Đại Cường', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3543, '10435', 'c6', 'vi', '01', '281', 'Lưu Hoàng', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3544, '10438', 'c6', 'vi', '01', '281', 'Hồng Quang', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3545, '10441', 'c6', 'vi', '01', '282', 'Đại Nghĩa', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3546, '10444', 'c6', 'vi', '01', '282', 'Đồng Tâm', 0, 0, 1, 1415954493, 1415954493, 'vi'),
(3547, '10447', 'c6', 'vi', '01', '282', 'Thượng Lâm', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3548, '10450', 'c6', 'vi', '01', '282', 'Tuy Lai', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3549, '10453', 'c6', 'vi', '01', '282', 'Phúc Lâm', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3550, '10456', 'c6', 'vi', '01', '282', 'Mỹ Thành', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3551, '10459', 'c6', 'vi', '01', '282', 'Bột Xuyên', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3552, '10462', 'c6', 'vi', '01', '282', 'An Mỹ', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3553, '10465', 'c6', 'vi', '01', '282', 'Hồng Sơn', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3554, '10468', 'c6', 'vi', '01', '282', 'Lê Thanh', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3555, '10471', 'c6', 'vi', '01', '282', 'Xuy Xá', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3556, '10474', 'c6', 'vi', '01', '282', 'Phùng Xá', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3557, '10477', 'c6', 'vi', '01', '282', 'Phù Lưu Tế', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3558, '10480', 'c6', 'vi', '01', '282', 'Đại Hưng', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3559, '10483', 'c6', 'vi', '01', '282', 'Vạn Kim', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3560, '10486', 'c6', 'vi', '01', '282', 'Đốc Tín', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3561, '10489', 'c6', 'vi', '01', '282', 'Hương Sơn', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3562, '10492', 'c6', 'vi', '01', '282', 'Hùng Tiến', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3563, '10495', 'c6', 'vi', '01', '282', 'An Tiến', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3564, '10498', 'c6', 'vi', '01', '282', 'Hợp Tiến', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3565, '10501', 'c6', 'vi', '01', '282', 'Hợp Thanh', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3566, '10504', 'c6', 'vi', '01', '282', 'An Phú', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3567, '10507', 'c6', 'vi', '30', '288', 'Cẩm Thượng', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3568, '10510', 'c6', 'vi', '30', '288', 'Bình Hàn', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3569, '10513', 'c6', 'vi', '30', '288', 'Ngọc Châu', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3570, '10514', 'c6', 'vi', '30', '288', 'Nhị Châu', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3571, '10516', 'c6', 'vi', '30', '288', 'Quang Trung', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3572, '10519', 'c6', 'vi', '30', '288', 'Nguyễn Trãi', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3573, '10522', 'c6', 'vi', '30', '288', 'Phạm Ngũ Lão', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3574, '10525', 'c6', 'vi', '30', '288', 'Trần Hưng Đạo', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3575, '10528', 'c6', 'vi', '30', '288', 'Trần Phú', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3576, '10531', 'c6', 'vi', '30', '288', 'Thanh Bình', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3577, '10532', 'c6', 'vi', '30', '288', 'Tân Bình', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3578, '10534', 'c6', 'vi', '30', '288', 'Lê Thanh Nghị', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3579, '10537', 'c6', 'vi', '30', '288', 'Hải Tân', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3580, '10540', 'c6', 'vi', '30', '288', 'Tứ Minh', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3581, '10543', 'c6', 'vi', '30', '288', 'Việt Hòa', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3582, '10546', 'c6', 'vi', '30', '290', 'Phả Lại', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3583, '10549', 'c6', 'vi', '30', '290', 'Sao Đỏ', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3584, '10552', 'c6', 'vi', '30', '290', 'Bến Tắm', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3585, '10555', 'c6', 'vi', '30', '290', 'Hoàng Hoa Thám', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3586, '10558', 'c6', 'vi', '30', '290', 'Bắc An', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3587, '10561', 'c6', 'vi', '30', '290', 'Hưng Đạo', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3588, '10564', 'c6', 'vi', '30', '290', 'Lê Lợi', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3589, '10567', 'c6', 'vi', '30', '290', 'Hoàng Tiến', 0, 0, 1, 1415954494, 1415954494, 'vi'),
(3590, '10570', 'c6', 'vi', '30', '290', 'Cộng Hòa', 0, 0, 1, 1415954495, 1415954495, 'vi'),
(3591, '10573', 'c6', 'vi', '30', '290', 'Hoàng Tân', 0, 0, 1, 1415954495, 1415954495, 'vi'),
(3592, '10576', 'c6', 'vi', '30', '290', 'Cổ Thành', 0, 0, 1, 1415954495, 1415954495, 'vi'),
(3593, '10579', 'c6', 'vi', '30', '290', 'Văn An', 0, 0, 1, 1415954495, 1415954495, 'vi'),
(3594, '10582', 'c6', 'vi', '30', '290', 'Chí Minh', 0, 0, 1, 1415954495, 1415954495, 'vi'),
(3595, '10585', 'c6', 'vi', '30', '290', 'Văn Đức', 0, 0, 1, 1415954495, 1415954495, 'vi'),
(3596, '10588', 'c6', 'vi', '30', '290', 'Thái Học', 0, 0, 1, 1415954495, 1415954495, 'vi'),
(3597, '10591', 'c6', 'vi', '30', '290', 'Nhân Huệ', 0, 0, 1, 1415954495, 1415954495, 'vi'),
(3598, '10594', 'c6', 'vi', '30', '290', 'An Lạc', 0, 0, 1, 1415954495, 1415954495, 'vi'),
(3599, '10597', 'c6', 'vi', '30', '290', 'Kênh Giang', 0, 0, 1, 1415954495, 1415954495, 'vi'),
(3600, '10600', 'c6', 'vi', '30', '290', 'Đồng Lạc', 0, 0, 1, 1415954495, 1415954495, 'vi'),
(3601, '10603', 'c6', 'vi', '30', '290', 'Tân Dân', 0, 0, 1, 1415954495, 1415954495, 'vi'),
(3602, '10606', 'c6', 'vi', '30', '291', 'Nam Sách', 0, 0, 1, 1415954495, 1415954495, 'vi'),
(3603, '10609', 'c6', 'vi', '30', '291', 'Nam Hưng', 0, 0, 1, 1415954495, 1415954495, 'vi'),
(3604, '10612', 'c6', 'vi', '30', '291', 'Nam Tân', 0, 0, 1, 1415954495, 1415954495, 'vi'),
(3605, '10615', 'c6', 'vi', '30', '291', 'Hợp Tiến', 0, 0, 1, 1415954495, 1415954495, 'vi'),
(3606, '10618', 'c6', 'vi', '30', '291', 'Hiệp Cát', 0, 0, 1, 1415954495, 1415954495, 'vi'),
(3607, '10621', 'c6', 'vi', '30', '291', 'Thanh Quang', 0, 0, 1, 1415954495, 1415954495, 'vi'),
(3608, '10624', 'c6', 'vi', '30', '291', 'Quốc Tuấn', 0, 0, 1, 1415954495, 1415954495, 'vi'),
(3609, '10627', 'c6', 'vi', '30', '291', 'Nam Chính', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3610, '10630', 'c6', 'vi', '30', '291', 'An Bình', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3611, '10633', 'c6', 'vi', '30', '291', 'Nam Trung', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3612, '10636', 'c6', 'vi', '30', '291', 'An Sơn', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3613, '10639', 'c6', 'vi', '30', '291', 'Cộng Hòa', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3614, '10642', 'c6', 'vi', '30', '291', 'Thái Tân', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3615, '10645', 'c6', 'vi', '30', '291', 'An Lâm', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3616, '10648', 'c6', 'vi', '30', '291', 'Phú Điền', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3617, '10651', 'c6', 'vi', '30', '291', 'Nam Hồng', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3618, '10654', 'c6', 'vi', '30', '291', 'Hồng Phong', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3619, '10657', 'c6', 'vi', '30', '291', 'Đồng Lạc', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3620, '10660', 'c6', 'vi', '30', '288', 'Ái Quốc', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3621, '10663', 'c6', 'vi', '30', '288', 'An Châu', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3622, '10666', 'c6', 'vi', '30', '291', 'Minh Tân', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3623, '10669', 'c6', 'vi', '30', '288', 'Thượng Đạt', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3624, '10672', 'c6', 'vi', '30', '288', 'Nam Đồng', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3625, '10675', 'c6', 'vi', '30', '292', 'An Lưu', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3626, '10678', 'c6', 'vi', '30', '292', 'Bạch Đằng', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3627, '10681', 'c6', 'vi', '30', '292', 'Thất Hùng', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3628, '10684', 'c6', 'vi', '30', '292', 'Lê Ninh', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3629, '10687', 'c6', 'vi', '30', '292', 'Hoành Sơn', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3630, '10690', 'c6', 'vi', '30', '292', 'Phúc Thành B', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3631, '10693', 'c6', 'vi', '30', '292', 'Thái Sơn', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3632, '10696', 'c6', 'vi', '30', '292', 'Duy Tân', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3633, '10699', 'c6', 'vi', '30', '292', 'Tân Dân', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3634, '10702', 'c6', 'vi', '30', '292', 'Minh Tân', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3635, '10705', 'c6', 'vi', '30', '292', 'Quang Trung', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3636, '10708', 'c6', 'vi', '30', '292', 'Hiệp Hòa', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3637, '10711', 'c6', 'vi', '30', '292', 'Phạm Mệnh', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3638, '10714', 'c6', 'vi', '30', '292', 'Phú Thứ', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3639, '10717', 'c6', 'vi', '30', '292', 'Thăng Long', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3640, '10720', 'c6', 'vi', '30', '292', 'Lạc Long', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3641, '10723', 'c6', 'vi', '30', '292', 'An Sinh', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3642, '10726', 'c6', 'vi', '30', '292', 'Hiệp Sơn', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3643, '10729', 'c6', 'vi', '30', '292', 'Thượng Quận', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3644, '10732', 'c6', 'vi', '30', '292', 'An Phụ', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3645, '10735', 'c6', 'vi', '30', '292', 'Hiệp An', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3646, '10738', 'c6', 'vi', '30', '292', 'Long Xuyên', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3647, '10741', 'c6', 'vi', '30', '292', 'Thái Thịnh', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3648, '10744', 'c6', 'vi', '30', '292', 'Hiến Thành', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3649, '10747', 'c6', 'vi', '30', '292', 'Minh Hòa', 0, 0, 1, 1415954496, 1415954496, 'vi'),
(3650, '10750', 'c6', 'vi', '30', '293', 'Phú Thái', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3651, '10753', 'c6', 'vi', '30', '293', 'Lai Vu', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3652, '10756', 'c6', 'vi', '30', '293', 'Cộng Hòa', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3653, '10759', 'c6', 'vi', '30', '293', 'Thượng Vũ', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3654, '10762', 'c6', 'vi', '30', '293', 'Cổ Dũng', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3655, '10765', 'c6', 'vi', '30', '293', 'Việt Hưng', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3656, '10768', 'c6', 'vi', '30', '293', 'Tuấn Hưng', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3657, '10771', 'c6', 'vi', '30', '293', 'Kim Xuyên', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3658, '10774', 'c6', 'vi', '30', '293', 'Phúc Thành A', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3659, '10777', 'c6', 'vi', '30', '293', 'Ngũ Phúc', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3660, '10780', 'c6', 'vi', '30', '293', 'Kim Anh', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3661, '10783', 'c6', 'vi', '30', '293', 'Kim Lương', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3662, '10786', 'c6', 'vi', '30', '293', 'Kim Tân', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3663, '10789', 'c6', 'vi', '30', '293', 'Kim Khê', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3664, '10792', 'c6', 'vi', '30', '293', 'Kim Đính', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3665, '10795', 'c6', 'vi', '30', '293', 'Cẩm La', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3666, '10798', 'c6', 'vi', '30', '293', 'Bình Dân', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3667, '10801', 'c6', 'vi', '30', '293', 'Tam Kỳ', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3668, '10804', 'c6', 'vi', '30', '293', 'Đồng Gia', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3669, '10807', 'c6', 'vi', '30', '293', 'Liên Hòa', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3670, '10810', 'c6', 'vi', '30', '293', 'Đại Đức', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3671, '10813', 'c6', 'vi', '30', '294', 'Thanh Hà', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3672, '10816', 'c6', 'vi', '30', '294', 'Hồng Lạc', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3673, '10819', 'c6', 'vi', '30', '294', 'Việt Hồng', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3674, '10822', 'c6', 'vi', '30', '294', 'Quyết Thắng', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3675, '10825', 'c6', 'vi', '30', '294', 'Tân Việt', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3676, '10828', 'c6', 'vi', '30', '294', 'Cẩm Chế', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3677, '10831', 'c6', 'vi', '30', '294', 'Thanh An', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3678, '10834', 'c6', 'vi', '30', '294', 'Thanh Lang', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3679, '10837', 'c6', 'vi', '30', '294', 'Tiền Tiến', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3680, '10840', 'c6', 'vi', '30', '294', 'Tân An', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3681, '10843', 'c6', 'vi', '30', '294', 'Liên Mạc', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3682, '10846', 'c6', 'vi', '30', '294', 'Thanh Hải', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3683, '10849', 'c6', 'vi', '30', '294', 'Thanh Khê', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3684, '10852', 'c6', 'vi', '30', '294', 'Thanh Xá', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3685, '10855', 'c6', 'vi', '30', '294', 'Thanh Xuân', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3686, '10858', 'c6', 'vi', '30', '294', 'An Lương', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3687, '10861', 'c6', 'vi', '30', '294', 'Thanh Thủy', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3688, '10864', 'c6', 'vi', '30', '294', 'Phượng Hoàng', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3689, '10867', 'c6', 'vi', '30', '294', 'Thanh Sơn', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3690, '10870', 'c6', 'vi', '30', '294', 'Hợp Đức', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3691, '10873', 'c6', 'vi', '30', '294', 'Trường Thành', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3692, '10876', 'c6', 'vi', '30', '294', 'Thanh Bính', 0, 0, 1, 1415954497, 1415954497, 'vi'),
(3693, '10879', 'c6', 'vi', '30', '294', 'Thanh Hồng', 0, 0, 1, 1415954498, 1415954498, 'vi'),
(3694, '10882', 'c6', 'vi', '30', '294', 'Thanh Cường', 0, 0, 1, 1415954498, 1415954498, 'vi'),
(3695, '10885', 'c6', 'vi', '30', '294', 'Vĩnh Lập', 0, 0, 1, 1415954498, 1415954498, 'vi'),
(3696, '10888', 'c6', 'vi', '30', '295', 'Cẩm Giàng', 0, 0, 1, 1415954498, 1415954498, 'vi'),
(3697, '10891', 'c6', 'vi', '30', '295', 'Lai Cách', 0, 0, 1, 1415954498, 1415954498, 'vi'),
(3698, '10894', 'c6', 'vi', '30', '295', 'Cẩm Hưng', 0, 0, 1, 1415954498, 1415954498, 'vi'),
(3699, '10897', 'c6', 'vi', '30', '295', 'Cẩm Hoàng', 0, 0, 1, 1415954498, 1415954498, 'vi'),
(3700, '10900', 'c6', 'vi', '30', '295', 'Cẩm Văn', 0, 0, 1, 1415954498, 1415954498, 'vi'),
(3701, '10903', 'c6', 'vi', '30', '295', 'Ngọc Liên', 0, 0, 1, 1415954498, 1415954498, 'vi'),
(3702, '10906', 'c6', 'vi', '30', '295', 'Thạch Lỗi', 0, 0, 1, 1415954498, 1415954498, 'vi'),
(3703, '10909', 'c6', 'vi', '30', '295', 'Cẩm Vũ', 0, 0, 1, 1415954498, 1415954498, 'vi'),
(3704, '10912', 'c6', 'vi', '30', '295', 'Đức Chính', 0, 0, 1, 1415954498, 1415954498, 'vi'),
(3705, '10915', 'c6', 'vi', '30', '295', 'Cẩm Sơn', 0, 0, 1, 1415954498, 1415954498, 'vi'),
(3706, '10918', 'c6', 'vi', '30', '295', 'Cẩm Định', 0, 0, 1, 1415954498, 1415954498, 'vi'),
(3707, '10921', 'c6', 'vi', '30', '295', 'Kim Giang', 0, 0, 1, 1415954498, 1415954498, 'vi'),
(3708, '10924', 'c6', 'vi', '30', '295', 'Lương Điền', 0, 0, 1, 1415954498, 1415954498, 'vi'),
(3709, '10927', 'c6', 'vi', '30', '295', 'Cao An', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3710, '10930', 'c6', 'vi', '30', '295', 'Tân Trường', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3711, '10933', 'c6', 'vi', '30', '295', 'Cẩm Phúc', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3712, '10936', 'c6', 'vi', '30', '295', 'Cẩm Điền', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3713, '10939', 'c6', 'vi', '30', '295', 'Cẩm Đông', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3714, '10942', 'c6', 'vi', '30', '295', 'Cẩm Đoài', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3715, '10945', 'c6', 'vi', '30', '296', 'Kẻ Sặt', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3716, '10948', 'c6', 'vi', '30', '296', 'Hưng Thịnh', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3717, '10951', 'c6', 'vi', '30', '296', 'Vĩnh Tuy', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3718, '10954', 'c6', 'vi', '30', '296', 'Hùng Thắng', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3719, '10957', 'c6', 'vi', '30', '296', 'Tráng Liệt', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3720, '10960', 'c6', 'vi', '30', '296', 'Vĩnh Hồng', 0, 0, 1, 1415954499, 1415954499, 'vi');
INSERT INTO `location_ward` (`id`, `code`, `area_code`, `country_code`, `province_code`, `district_code`, `title`, `is_extramural`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(3721, '10963', 'c6', 'vi', '30', '296', 'Long Xuyên', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3722, '10966', 'c6', 'vi', '30', '296', 'Tân Việt', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3723, '10969', 'c6', 'vi', '30', '296', 'Thúc Kháng', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3724, '10972', 'c6', 'vi', '30', '296', 'Tân Hồng', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3725, '10975', 'c6', 'vi', '30', '296', 'Bình Minh', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3726, '10978', 'c6', 'vi', '30', '296', 'Hồng Khê', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3727, '10981', 'c6', 'vi', '30', '296', 'Thái Học', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3728, '10984', 'c6', 'vi', '30', '296', 'Cổ Bi', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3729, '10987', 'c6', 'vi', '30', '296', 'Nhân Quyền', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3730, '10990', 'c6', 'vi', '30', '296', 'Thái Dương', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3731, '10993', 'c6', 'vi', '30', '296', 'Thái Hòa', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3732, '10996', 'c6', 'vi', '30', '296', 'Bình Xuyên', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3733, '10999', 'c6', 'vi', '30', '297', 'Gia Lộc', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3734, '11002', 'c6', 'vi', '30', '288', 'Thạch Khôi', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3735, '11005', 'c6', 'vi', '30', '297', 'Liên Hồng', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3736, '11008', 'c6', 'vi', '30', '297', 'Thống Nhất', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3737, '11011', 'c6', 'vi', '30', '288', 'Tân Hưng', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3738, '11014', 'c6', 'vi', '30', '297', 'Trùng Khánh', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3739, '11017', 'c6', 'vi', '30', '297', 'Gia Xuyên', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3740, '11020', 'c6', 'vi', '30', '297', 'Yết Kiêu', 0, 0, 1, 1415954499, 1415954499, 'vi'),
(3741, '11023', 'c6', 'vi', '30', '297', 'Gia Hòa', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3742, '11026', 'c6', 'vi', '30', '297', 'Phương Hưng', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3743, '11029', 'c6', 'vi', '30', '297', 'Gia Tân', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3744, '11032', 'c6', 'vi', '30', '297', 'Tân Tiến', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3745, '11035', 'c6', 'vi', '30', '297', 'Gia Khánh', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3746, '11038', 'c6', 'vi', '30', '297', 'Gia Lương', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3747, '11041', 'c6', 'vi', '30', '297', 'Lê Lợi', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3748, '11044', 'c6', 'vi', '30', '297', 'Toàn Thắng', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3749, '11047', 'c6', 'vi', '30', '297', 'Hoàng Diệu', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3750, '11050', 'c6', 'vi', '30', '297', 'Hồng Hưng', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3751, '11053', 'c6', 'vi', '30', '297', 'Phạm Trấn', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3752, '11056', 'c6', 'vi', '30', '297', 'Đoàn Thượng', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3753, '11059', 'c6', 'vi', '30', '297', 'Thống Kênh', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3754, '11062', 'c6', 'vi', '30', '297', 'Quang Minh', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3755, '11065', 'c6', 'vi', '30', '297', 'Đồng Quang', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3756, '11068', 'c6', 'vi', '30', '297', 'Nhật Tân', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3757, '11071', 'c6', 'vi', '30', '297', 'Đức Xương', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3758, '11074', 'c6', 'vi', '30', '298', 'Tứ Kỳ', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3759, '11077', 'c6', 'vi', '30', '298', 'Ngọc Sơn', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3760, '11080', 'c6', 'vi', '30', '298', 'Kỳ Sơn', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3761, '11083', 'c6', 'vi', '30', '298', 'Đại Đồng', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3762, '11086', 'c6', 'vi', '30', '298', 'Hưng Đạo', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3763, '11089', 'c6', 'vi', '30', '298', 'Ngọc Kỳ', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3764, '11092', 'c6', 'vi', '30', '298', 'Bình Lăng', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3765, '11095', 'c6', 'vi', '30', '298', 'Tứ Xuyên', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3766, '11098', 'c6', 'vi', '30', '298', 'Tái Sơn', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3767, '11101', 'c6', 'vi', '30', '298', 'Quang Phục', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3768, '11104', 'c6', 'vi', '30', '298', 'Đông Kỳ', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3769, '11107', 'c6', 'vi', '30', '298', 'Tây Kỳ', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3770, '11110', 'c6', 'vi', '30', '298', 'Dân Chủ', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3771, '11113', 'c6', 'vi', '30', '298', 'Tân Kỳ', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3772, '11116', 'c6', 'vi', '30', '298', 'Quang Khải', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3773, '11119', 'c6', 'vi', '30', '298', 'Đại Hợp', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3774, '11122', 'c6', 'vi', '30', '298', 'Quảng Nghiệp', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3775, '11125', 'c6', 'vi', '30', '298', 'An Thanh', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3776, '11128', 'c6', 'vi', '30', '298', 'Minh Đức', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3777, '11131', 'c6', 'vi', '30', '298', 'Văn Tố', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3778, '11134', 'c6', 'vi', '30', '298', 'Quang Trung', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3779, '11137', 'c6', 'vi', '30', '298', 'Phượng Kỳ', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3780, '11140', 'c6', 'vi', '30', '298', 'Cộng Lạc', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3781, '11143', 'c6', 'vi', '30', '298', 'Tiên Động', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3782, '11146', 'c6', 'vi', '30', '298', 'Nguyên Giáp', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3783, '11149', 'c6', 'vi', '30', '298', 'Hà Kỳ', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3784, '11152', 'c6', 'vi', '30', '298', 'Hà Thanh', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3785, '11155', 'c6', 'vi', '30', '299', 'Ninh Giang', 0, 0, 1, 1415954500, 1415954500, 'vi'),
(3786, '11158', 'c6', 'vi', '30', '299', 'Quyết Thắng', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3787, '11161', 'c6', 'vi', '30', '299', 'Ứng Hoè', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3788, '11164', 'c6', 'vi', '30', '299', 'Nghĩa An', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3789, '11167', 'c6', 'vi', '30', '299', 'Hồng Đức', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3790, '11170', 'c6', 'vi', '30', '299', 'Ninh Hòa', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3791, '11173', 'c6', 'vi', '30', '299', 'An Đức', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3792, '11176', 'c6', 'vi', '30', '299', 'Vạn Phúc', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3793, '11179', 'c6', 'vi', '30', '299', 'Tân Hương', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3794, '11182', 'c6', 'vi', '30', '299', 'Ninh Thành', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3795, '11185', 'c6', 'vi', '30', '299', 'Vĩnh Hòa', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3796, '11188', 'c6', 'vi', '30', '299', 'Đông Xuyên', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3797, '11191', 'c6', 'vi', '30', '299', 'Hoàng Hanh', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3798, '11194', 'c6', 'vi', '30', '299', 'Quang Hưng', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3799, '11197', 'c6', 'vi', '30', '299', 'Tân Phong', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3800, '11200', 'c6', 'vi', '30', '299', 'Ninh Hải', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3801, '11203', 'c6', 'vi', '30', '299', 'Đồng Tâm', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3802, '11206', 'c6', 'vi', '30', '299', 'Tân Quang', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3803, '11209', 'c6', 'vi', '30', '299', 'Kiến Quốc', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3804, '11212', 'c6', 'vi', '30', '299', 'Hồng Thái', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3805, '11215', 'c6', 'vi', '30', '299', 'Hồng Dụ', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3806, '11218', 'c6', 'vi', '30', '299', 'Văn Hội', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3807, '11221', 'c6', 'vi', '30', '299', 'Hưng Thái', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3808, '11224', 'c6', 'vi', '30', '299', 'Hồng Phong', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3809, '11227', 'c6', 'vi', '30', '299', 'Hiệp Lực', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3810, '11230', 'c6', 'vi', '30', '299', 'Hồng Phúc', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3811, '11233', 'c6', 'vi', '30', '299', 'Hưng Long', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3812, '11236', 'c6', 'vi', '30', '299', 'Văn Giang', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3813, '11239', 'c6', 'vi', '30', '300', 'Thanh Miện', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3814, '11242', 'c6', 'vi', '30', '300', 'Thanh Tùng', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3815, '11245', 'c6', 'vi', '30', '300', 'Phạm Kha', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3816, '11248', 'c6', 'vi', '30', '300', 'Ngô Quyền', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3817, '11251', 'c6', 'vi', '30', '300', 'Đoàn Tùng', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3818, '11254', 'c6', 'vi', '30', '300', 'Hồng Quang', 0, 0, 1, 1415954501, 1415954501, 'vi'),
(3819, '11257', 'c6', 'vi', '30', '300', 'Tân Trào', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3820, '11260', 'c6', 'vi', '30', '300', 'Lam Sơn', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3821, '11263', 'c6', 'vi', '30', '300', 'Đoàn Kết', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3822, '11266', 'c6', 'vi', '30', '300', 'Lê Hồng', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3823, '11269', 'c6', 'vi', '30', '300', 'Tứ Cường', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3824, '11272', 'c6', 'vi', '30', '300', 'Hùng Sơn', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3825, '11275', 'c6', 'vi', '30', '300', 'Ngũ Hùng', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3826, '11278', 'c6', 'vi', '30', '300', 'Cao Thắng', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3827, '11281', 'c6', 'vi', '30', '300', 'Chi Lăng Bắc', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3828, '11284', 'c6', 'vi', '30', '300', 'Chi Lăng Nam', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3829, '11287', 'c6', 'vi', '30', '300', 'Thanh Giang', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3830, '11290', 'c6', 'vi', '30', '300', 'Diên Hồng', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3831, '11293', 'c6', 'vi', '30', '300', 'Tiền Phong', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3832, '11296', 'c6', 'vi', '31', '303', 'Quán Toan', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3833, '11299', 'c6', 'vi', '31', '303', 'Hùng Vương', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3834, '11302', 'c6', 'vi', '31', '303', 'Sở Dầu', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3835, '11305', 'c6', 'vi', '31', '303', 'Thượng Lý', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3836, '11308', 'c6', 'vi', '31', '303', 'Hạ Lý', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3837, '11311', 'c6', 'vi', '31', '303', 'Minh Khai', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3838, '11314', 'c6', 'vi', '31', '303', 'Trại Chuối', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3839, '11317', 'c6', 'vi', '31', '303', 'Quang Trung', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3840, '11320', 'c6', 'vi', '31', '303', 'Hoàng Văn Thụ', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3841, '11323', 'c6', 'vi', '31', '303', 'Phan Bội Châu', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3842, '11326', 'c6', 'vi', '31', '303', 'Phạm Hồng Thái', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3843, '11329', 'c6', 'vi', '31', '304', 'Máy Chai', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3844, '11332', 'c6', 'vi', '31', '304', 'Máy Tơ', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3845, '11335', 'c6', 'vi', '31', '304', 'Vạn Mỹ', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3846, '11338', 'c6', 'vi', '31', '304', 'Cầu Tre', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3847, '11341', 'c6', 'vi', '31', '304', 'Lạc Viên', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3848, '11344', 'c6', 'vi', '31', '304', 'Lương Khánh Thiện', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3849, '11347', 'c6', 'vi', '31', '304', 'Gia Viên', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3850, '11350', 'c6', 'vi', '31', '304', 'Đông Khê', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3851, '11353', 'c6', 'vi', '31', '304', 'Cầu Đất', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3852, '11356', 'c6', 'vi', '31', '304', 'Lê Lợi', 0, 0, 1, 1415954502, 1415954502, 'vi'),
(3853, '11359', 'c6', 'vi', '31', '304', 'Đằng Giang', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3854, '11362', 'c6', 'vi', '31', '304', 'Lạch Tray', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3855, '11365', 'c6', 'vi', '31', '304', 'Đổng Quốc Bình', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3856, '11368', 'c6', 'vi', '31', '305', 'Cát Dài', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3857, '11371', 'c6', 'vi', '31', '305', 'An Biên', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3858, '11374', 'c6', 'vi', '31', '305', 'Lam Sơn', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3859, '11377', 'c6', 'vi', '31', '305', 'An Dương', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3860, '11380', 'c6', 'vi', '31', '305', 'Trần Nguyên Hãn', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3861, '11383', 'c6', 'vi', '31', '305', 'Hồ Nam', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3862, '11386', 'c6', 'vi', '31', '305', 'Trại Cau', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3863, '11389', 'c6', 'vi', '31', '305', 'Dư Hàng', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3864, '11392', 'c6', 'vi', '31', '305', 'Hàng Kênh', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3865, '11395', 'c6', 'vi', '31', '305', 'Đông Hải', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3866, '11398', 'c6', 'vi', '31', '305', 'Niệm Nghĩa', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3867, '11401', 'c6', 'vi', '31', '305', 'Nghĩa Xá', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3868, '11404', 'c6', 'vi', '31', '305', 'Dư Hàng Kênh', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3869, '11405', 'c6', 'vi', '31', '305', 'Kênh Dương', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3870, '11407', 'c6', 'vi', '31', '305', 'Vĩnh Niệm', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3871, '11410', 'c6', 'vi', '31', '306', 'Đông Hải 1', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3872, '11411', 'c6', 'vi', '31', '306', 'Đông Hải 2', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3873, '11413', 'c6', 'vi', '31', '306', 'Đằng Lâm', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3874, '11414', 'c6', 'vi', '31', '306', 'Thành Tô', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3875, '11416', 'c6', 'vi', '31', '306', 'Đằng Hải', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3876, '11419', 'c6', 'vi', '31', '306', 'Nam Hải', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3877, '11422', 'c6', 'vi', '31', '306', 'Cát Bi', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3878, '11425', 'c6', 'vi', '31', '306', 'Tràng Cát', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3879, '11428', 'c6', 'vi', '31', '307', 'Quán Trữ', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3880, '11429', 'c6', 'vi', '31', '307', 'Lãm Hà', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3881, '11431', 'c6', 'vi', '31', '307', 'Đồng Hoà', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3882, '11434', 'c6', 'vi', '31', '307', 'Bắc Sơn', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3883, '11437', 'c6', 'vi', '31', '307', 'Nam Sơn', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3884, '11440', 'c6', 'vi', '31', '307', 'Ngọc Sơn', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3885, '11443', 'c6', 'vi', '31', '307', 'Trần Thành Ngọ', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3886, '11446', 'c6', 'vi', '31', '307', 'Văn Đẩu', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3887, '11449', 'c6', 'vi', '31', '307', 'Phù Liễn', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3888, '11452', 'c6', 'vi', '31', '307', 'Tràng Minh', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3889, '11455', 'c6', 'vi', '31', '308', 'Ngọc Xuyên', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3890, '11458', 'c6', 'vi', '31', '308', 'Ngọc Hải', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3891, '11461', 'c6', 'vi', '31', '308', 'Vạn Hương', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3892, '11464', 'c6', 'vi', '31', '308', 'Vạn Sơn', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3893, '11465', 'c6', 'vi', '31', '308', 'Minh Đức', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3894, '11467', 'c6', 'vi', '31', '308', 'Bàng La', 0, 0, 1, 1415954503, 1415954503, 'vi'),
(3895, '11470', 'c6', 'vi', '31', '311', 'Núi Đèo', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3896, '11473', 'c6', 'vi', '31', '311', 'Minh Đức', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3897, '11476', 'c6', 'vi', '31', '311', 'Lại Xuân', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3898, '11479', 'c6', 'vi', '31', '311', 'An Sơn', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3899, '11482', 'c6', 'vi', '31', '311', 'Kỳ Sơn', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3900, '11485', 'c6', 'vi', '31', '311', 'Liên Khê', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3901, '11488', 'c6', 'vi', '31', '311', 'Lưu Kiếm', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3902, '11491', 'c6', 'vi', '31', '311', 'Lưu Kỳ', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3903, '11494', 'c6', 'vi', '31', '311', 'Gia Minh', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3904, '11497', 'c6', 'vi', '31', '311', 'Gia Đức', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3905, '11500', 'c6', 'vi', '31', '311', 'Minh Tân', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3906, '11503', 'c6', 'vi', '31', '311', 'Phù Ninh', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3907, '11506', 'c6', 'vi', '31', '311', 'Quảng Thanh', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3908, '11509', 'c6', 'vi', '31', '311', 'Chính Mỹ', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3909, '11512', 'c6', 'vi', '31', '311', 'Kênh Giang', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3910, '11515', 'c6', 'vi', '31', '311', 'Hợp Thành', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3911, '11518', 'c6', 'vi', '31', '311', 'Cao Nhân', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3912, '11521', 'c6', 'vi', '31', '311', 'Mỹ Đồng', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3913, '11524', 'c6', 'vi', '31', '311', 'Đông Sơn', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3914, '11527', 'c6', 'vi', '31', '311', 'Hoà Bình', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3915, '11530', 'c6', 'vi', '31', '311', 'Trung Hà', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3916, '11533', 'c6', 'vi', '31', '311', 'An Lư', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3917, '11536', 'c6', 'vi', '31', '311', 'Thuỷ Triều', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3918, '11539', 'c6', 'vi', '31', '311', 'Ngũ Lão', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3919, '11542', 'c6', 'vi', '31', '311', 'Phục Lễ', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3920, '11545', 'c6', 'vi', '31', '311', 'Tam Hưng', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3921, '11548', 'c6', 'vi', '31', '311', 'Phả Lễ', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3922, '11551', 'c6', 'vi', '31', '311', 'Lập Lễ', 0, 0, 1, 1415954504, 1415954504, 'vi'),
(3923, '11554', 'c6', 'vi', '31', '311', 'Kiền Bái', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3924, '11557', 'c6', 'vi', '31', '311', 'Thiên Hương', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3925, '11560', 'c6', 'vi', '31', '311', 'Thuỷ Sơn', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3926, '11563', 'c6', 'vi', '31', '311', 'Thuỷ Đường', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3927, '11566', 'c6', 'vi', '31', '311', 'Hoàng Động', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3928, '11569', 'c6', 'vi', '31', '311', 'Lâm Động', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3929, '11572', 'c6', 'vi', '31', '311', 'Hoa Động', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3930, '11575', 'c6', 'vi', '31', '311', 'Tân Dương', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3931, '11578', 'c6', 'vi', '31', '311', 'Dương Quan', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3932, '11581', 'c6', 'vi', '31', '312', 'An Dương', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3933, '11584', 'c6', 'vi', '31', '312', 'Lê Thiện', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3934, '11587', 'c6', 'vi', '31', '312', 'Đại Bản', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3935, '11590', 'c6', 'vi', '31', '312', 'An Hoà', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3936, '11593', 'c6', 'vi', '31', '312', 'Hồng Phong', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3937, '11596', 'c6', 'vi', '31', '312', 'Tân Tiến', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3938, '11599', 'c6', 'vi', '31', '312', 'An Hưng', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3939, '11602', 'c6', 'vi', '31', '312', 'An Hồng', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3940, '11605', 'c6', 'vi', '31', '312', 'Bắc Sơn', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3941, '11608', 'c6', 'vi', '31', '312', 'Nam Sơn', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3942, '11611', 'c6', 'vi', '31', '312', 'Lê Lợi', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3943, '11614', 'c6', 'vi', '31', '312', 'Đặng Cương', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3944, '11617', 'c6', 'vi', '31', '312', 'Đồng Thái', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3945, '11620', 'c6', 'vi', '31', '312', 'Quốc Tuấn', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3946, '11623', 'c6', 'vi', '31', '312', 'An Đồng', 0, 0, 1, 1415954505, 1415954505, 'vi'),
(3947, '11626', 'c6', 'vi', '31', '312', 'Hồng Thái', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3948, '11629', 'c6', 'vi', '31', '313', 'An Lão', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3949, '11632', 'c6', 'vi', '31', '313', 'Bát Trang', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3950, '11635', 'c6', 'vi', '31', '313', 'Trường Thọ', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3951, '11638', 'c6', 'vi', '31', '313', 'Trường Thành', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3952, '11641', 'c6', 'vi', '31', '313', 'An Tiến', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3953, '11644', 'c6', 'vi', '31', '313', 'Quang Hưng', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3954, '11647', 'c6', 'vi', '31', '313', 'Quang Trung', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3955, '11650', 'c6', 'vi', '31', '313', 'Quốc Tuấn', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3956, '11653', 'c6', 'vi', '31', '313', 'An Thắng', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3957, '11656', 'c6', 'vi', '31', '313', 'Trường Sơn', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3958, '11659', 'c6', 'vi', '31', '313', 'Tân Dân', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3959, '11662', 'c6', 'vi', '31', '313', 'Thái Sơn', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3960, '11665', 'c6', 'vi', '31', '313', 'Tân Viên', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3961, '11668', 'c6', 'vi', '31', '313', 'Mỹ Đức', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3962, '11671', 'c6', 'vi', '31', '313', 'Chiến Thắng', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3963, '11674', 'c6', 'vi', '31', '313', 'An Thọ', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3964, '11677', 'c6', 'vi', '31', '313', 'An Thái', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3965, '11680', 'c6', 'vi', '31', '314', 'Núi Đối', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3966, '11683', 'c6', 'vi', '31', '309', 'Đa Phúc', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3967, '11686', 'c6', 'vi', '31', '309', 'Hưng Đạo', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3968, '11689', 'c6', 'vi', '31', '309', 'Anh Dũng', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3969, '11692', 'c6', 'vi', '31', '309', 'Hải Thành', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3970, '11695', 'c6', 'vi', '31', '314', 'Đông Phương', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3971, '11698', 'c6', 'vi', '31', '314', 'Thuận Thiên', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3972, '11701', 'c6', 'vi', '31', '314', 'Hữu Bằng', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3973, '11704', 'c6', 'vi', '31', '314', 'Đại Đồng', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3974, '11707', 'c6', 'vi', '31', '309', 'Hoà Nghĩa', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3975, '11710', 'c6', 'vi', '31', '314', 'Ngũ Phúc', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3976, '11713', 'c6', 'vi', '31', '314', 'Kiến Quốc', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3977, '11716', 'c6', 'vi', '31', '314', 'Du Lễ', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3978, '11719', 'c6', 'vi', '31', '314', 'Thuỵ Hương', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3979, '11722', 'c6', 'vi', '31', '314', 'Thanh Sơn', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3980, '11725', 'c6', 'vi', '31', '314', 'Minh Tân', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3981, '11728', 'c6', 'vi', '31', '314', 'Đại Hà', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3982, '11731', 'c6', 'vi', '31', '314', 'Ngũ Đoan', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3983, '11734', 'c6', 'vi', '31', '314', 'Tân Phong', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3984, '11737', 'c6', 'vi', '31', '308', 'Hợp Đức', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3985, '11740', 'c6', 'vi', '31', '309', 'Tân Thành', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3986, '11743', 'c6', 'vi', '31', '314', 'Tân Trào', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3987, '11746', 'c6', 'vi', '31', '314', 'Đoàn Xá', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3988, '11749', 'c6', 'vi', '31', '314', 'Tú Sơn', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3989, '11752', 'c6', 'vi', '31', '314', 'Đại Hợp', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3990, '11755', 'c6', 'vi', '31', '315', 'Tiên Lãng', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3991, '11758', 'c6', 'vi', '31', '315', 'Đại Thắng', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3992, '11761', 'c6', 'vi', '31', '315', 'Tiên Cường', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3993, '11764', 'c6', 'vi', '31', '315', 'Tự Cường', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3994, '11767', 'c6', 'vi', '31', '315', 'Tiên Tiến', 0, 0, 1, 1415954506, 1415954506, 'vi'),
(3995, '11770', 'c6', 'vi', '31', '315', 'Quyết Tiến', 0, 0, 1, 1415954507, 1415954507, 'vi'),
(3996, '11773', 'c6', 'vi', '31', '315', 'Khởi Nghĩa', 0, 0, 1, 1415954507, 1415954507, 'vi'),
(3997, '11776', 'c6', 'vi', '31', '315', 'Tiên Thanh', 0, 0, 1, 1415954507, 1415954507, 'vi'),
(3998, '11779', 'c6', 'vi', '31', '315', 'Cấp Tiến', 0, 0, 1, 1415954507, 1415954507, 'vi'),
(3999, '11782', 'c6', 'vi', '31', '315', 'Kiến Thiết', 0, 0, 1, 1415954507, 1415954507, 'vi'),
(4000, '11785', 'c6', 'vi', '31', '315', 'Đoàn Lập', 0, 0, 1, 1415954507, 1415954507, 'vi'),
(4001, '11788', 'c6', 'vi', '31', '315', 'Bạch Đằng', 0, 0, 1, 1415954517, 1415954517, 'vi'),
(4002, '11791', 'c6', 'vi', '31', '315', 'Quang Phục', 0, 0, 1, 1415954517, 1415954517, 'vi'),
(4003, '11794', 'c6', 'vi', '31', '315', 'Toàn Thắng', 0, 0, 1, 1415954517, 1415954517, 'vi'),
(4004, '11797', 'c6', 'vi', '31', '315', 'Tiên Thắng', 0, 0, 1, 1415954517, 1415954517, 'vi'),
(4005, '11800', 'c6', 'vi', '31', '315', 'Tiên Minh', 0, 0, 1, 1415954517, 1415954517, 'vi'),
(4006, '11803', 'c6', 'vi', '31', '315', 'Bắc Hưng', 0, 0, 1, 1415954517, 1415954517, 'vi'),
(4007, '11806', 'c6', 'vi', '31', '315', 'Nam Hưng', 0, 0, 1, 1415954517, 1415954517, 'vi'),
(4008, '11809', 'c6', 'vi', '31', '315', 'Hùng Thắng', 0, 0, 1, 1415954517, 1415954517, 'vi'),
(4009, '11812', 'c6', 'vi', '31', '315', 'Tây Hưng', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4010, '11815', 'c6', 'vi', '31', '315', 'Đông Hưng', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4011, '11818', 'c6', 'vi', '31', '315', 'Tiên Hưng', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4012, '11821', 'c6', 'vi', '31', '315', 'Vinh Quang', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4013, '11824', 'c6', 'vi', '31', '316', 'Vĩnh Bảo', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4014, '11827', 'c6', 'vi', '31', '316', 'Dũng Tiến', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4015, '11830', 'c6', 'vi', '31', '316', 'Giang Biên', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4016, '11833', 'c6', 'vi', '31', '316', 'Thắng Thuỷ', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4017, '11836', 'c6', 'vi', '31', '316', 'Trung Lập', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4018, '11839', 'c6', 'vi', '31', '316', 'Việt Tiến', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4019, '11842', 'c6', 'vi', '31', '316', 'Vĩnh An', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4020, '11845', 'c6', 'vi', '31', '316', 'Vĩnh Long', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4021, '11848', 'c6', 'vi', '31', '316', 'Hiệp Hoà', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4022, '11851', 'c6', 'vi', '31', '316', 'Hùng Tiến', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4023, '11854', 'c6', 'vi', '31', '316', 'An Hoà', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4024, '11857', 'c6', 'vi', '31', '316', 'Tân Hưng', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4025, '11860', 'c6', 'vi', '31', '316', 'Tân Liên', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4026, '11863', 'c6', 'vi', '31', '316', 'Nhân Hoà', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4027, '11866', 'c6', 'vi', '31', '316', 'Tam Đa', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4028, '11869', 'c6', 'vi', '31', '316', 'Hưng Nhân', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4029, '11872', 'c6', 'vi', '31', '316', 'Vinh Quang', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4030, '11875', 'c6', 'vi', '31', '316', 'Đồng Minh', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4031, '11878', 'c6', 'vi', '31', '316', 'Thanh Lương', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4032, '11881', 'c6', 'vi', '31', '316', 'Liên Am', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4033, '11884', 'c6', 'vi', '31', '316', 'Lý Học', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4034, '11887', 'c6', 'vi', '31', '316', 'Tam Cường', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4035, '11890', 'c6', 'vi', '31', '316', 'Hoà Bình', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4036, '11893', 'c6', 'vi', '31', '316', 'Tiền Phong', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4037, '11896', 'c6', 'vi', '31', '316', 'Vĩnh Phong', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4038, '11899', 'c6', 'vi', '31', '316', 'Cộng Hiền', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4039, '11902', 'c6', 'vi', '31', '316', 'Cao Minh', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4040, '11905', 'c6', 'vi', '31', '316', 'Cổ Am', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4041, '11908', 'c6', 'vi', '31', '316', 'Vĩnh Tiến', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4042, '11911', 'c6', 'vi', '31', '316', 'Trấn Dương', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4043, '11914', 'c6', 'vi', '31', '317', 'Cát Bà', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4044, '11917', 'c6', 'vi', '31', '317', 'Cát Hải', 0, 0, 1, 1415954518, 1415954518, 'vi'),
(4045, '11920', 'c6', 'vi', '31', '317', 'Nghĩa Lộ', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4046, '11923', 'c6', 'vi', '31', '317', 'Đồng Bài', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4047, '11926', 'c6', 'vi', '31', '317', 'Hoàng Châu', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4048, '11929', 'c6', 'vi', '31', '317', 'Văn Phong', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4049, '11932', 'c6', 'vi', '31', '317', 'Phù Long', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4050, '11935', 'c6', 'vi', '31', '317', 'Gia Luận', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4051, '11938', 'c6', 'vi', '31', '317', 'Hiền Hào', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4052, '11941', 'c6', 'vi', '31', '317', 'Trân Châu', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4053, '11944', 'c6', 'vi', '31', '317', 'Việt Hải', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4054, '11947', 'c6', 'vi', '31', '317', 'Xuân Đám', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4055, '11950', 'c6', 'vi', '33', '323', 'Lam Sơn', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4056, '11953', 'c6', 'vi', '33', '323', 'An Tảo', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4057, '11956', 'c6', 'vi', '33', '323', 'Hiến Nam', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4058, '11959', 'c6', 'vi', '33', '323', 'Lê Lợi', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4059, '11962', 'c6', 'vi', '33', '323', 'Hồng Châu', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4060, '11965', 'c6', 'vi', '33', '323', 'Minh Khai', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4061, '11968', 'c6', 'vi', '33', '323', 'Quang Trung', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4062, '11971', 'c6', 'vi', '33', '323', 'Bảo Khê', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4063, '11974', 'c6', 'vi', '33', '323', 'Trung Nghĩa', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4064, '11977', 'c6', 'vi', '33', '323', 'Liên Phương', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4065, '11980', 'c6', 'vi', '33', '323', 'Hồng Nam', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4066, '11983', 'c6', 'vi', '33', '323', 'Quảng Châu', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4067, '11986', 'c6', 'vi', '33', '325', 'Như Quỳnh', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4068, '11989', 'c6', 'vi', '33', '325', 'Lạc Đạo', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4069, '11992', 'c6', 'vi', '33', '325', 'Chỉ Đạo', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4070, '11995', 'c6', 'vi', '33', '325', 'Đại Đồng', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4071, '11998', 'c6', 'vi', '33', '325', 'Việt Hưng', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4072, '12001', 'c6', 'vi', '33', '325', 'Tân Quang', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4073, '12004', 'c6', 'vi', '33', '325', 'Đình Dù', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4074, '12007', 'c6', 'vi', '33', '325', 'Minh Hải', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4075, '12010', 'c6', 'vi', '33', '325', 'Lương Tài', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4076, '12013', 'c6', 'vi', '33', '325', 'Trưng Trắc', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4077, '12016', 'c6', 'vi', '33', '325', 'Lạc Hồng', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4078, '12019', 'c6', 'vi', '33', '326', 'Văn Giang', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4079, '12022', 'c6', 'vi', '33', '326', 'Xuân Quan', 0, 0, 1, 1415954519, 1415954519, 'vi'),
(4080, '12025', 'c6', 'vi', '33', '326', 'Cửu Cao', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4081, '12028', 'c6', 'vi', '33', '326', 'Phụng Công', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4082, '12031', 'c6', 'vi', '33', '326', 'Nghĩa Trụ', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4083, '12034', 'c6', 'vi', '33', '326', 'Long Hưng', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4084, '12037', 'c6', 'vi', '33', '326', 'Vĩnh Khúc', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4085, '12040', 'c6', 'vi', '33', '326', 'Liên Nghĩa', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4086, '12043', 'c6', 'vi', '33', '326', 'Tân Tiến', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4087, '12046', 'c6', 'vi', '33', '326', 'Thắng Lợi', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4088, '12049', 'c6', 'vi', '33', '326', 'Mễ Sở', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4089, '12052', 'c6', 'vi', '33', '327', 'Yên Mỹ', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4090, '12055', 'c6', 'vi', '33', '327', 'Giai Phạm', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4091, '12058', 'c6', 'vi', '33', '327', 'Nghĩa Hiệp', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4092, '12061', 'c6', 'vi', '33', '327', 'Đồng Than', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4093, '12064', 'c6', 'vi', '33', '327', 'Ngọc Long', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4094, '12067', 'c6', 'vi', '33', '327', 'Liêu Xá', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4095, '12070', 'c6', 'vi', '33', '327', 'Hoàn Long', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4096, '12073', 'c6', 'vi', '33', '327', 'Tân Lập', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4097, '12076', 'c6', 'vi', '33', '327', 'Thanh Long', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4098, '12079', 'c6', 'vi', '33', '327', 'Yên Phú', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4099, '12082', 'c6', 'vi', '33', '327', 'Việt Cường', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4100, '12085', 'c6', 'vi', '33', '327', 'Trung Hòa', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4101, '12088', 'c6', 'vi', '33', '327', 'Yên Hòa', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4102, '12091', 'c6', 'vi', '33', '327', 'Minh Châu', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4103, '12094', 'c6', 'vi', '33', '327', 'Trung Hưng', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4104, '12097', 'c6', 'vi', '33', '327', 'Lý Thường Kiệt', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4105, '12100', 'c6', 'vi', '33', '327', 'Tân Việt', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4106, '12103', 'c6', 'vi', '33', '328', 'Bần Yên Nhân', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4107, '12106', 'c6', 'vi', '33', '328', 'Phan Đình Phùng', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4108, '12109', 'c6', 'vi', '33', '328', 'Cẩm Xá', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4109, '12112', 'c6', 'vi', '33', '328', 'Dương Quang', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4110, '12115', 'c6', 'vi', '33', '328', 'Hòa Phong', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4111, '12118', 'c6', 'vi', '33', '328', 'Nhân Hòa', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4112, '12121', 'c6', 'vi', '33', '328', 'Dị Sử', 0, 0, 1, 1415954520, 1415954520, 'vi'),
(4113, '12124', 'c6', 'vi', '33', '328', 'Bạch Sam', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4114, '12127', 'c6', 'vi', '33', '328', 'Minh Đức', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4115, '12130', 'c6', 'vi', '33', '328', 'Phùng Chí Kiên', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4116, '12133', 'c6', 'vi', '33', '328', 'Xuân Dục', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4117, '12136', 'c6', 'vi', '33', '328', 'Ngọc Lâm', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4118, '12139', 'c6', 'vi', '33', '328', 'Hưng Long', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4119, '12142', 'c6', 'vi', '33', '329', 'Ân Thi', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4120, '12145', 'c6', 'vi', '33', '329', 'Phù Ủng', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4121, '12148', 'c6', 'vi', '33', '329', 'Bắc Sơn', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4122, '12151', 'c6', 'vi', '33', '329', 'Bãi Sậy', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4123, '12154', 'c6', 'vi', '33', '329', 'Đào Dương', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4124, '12157', 'c6', 'vi', '33', '329', 'Tân Phúc', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4125, '12160', 'c6', 'vi', '33', '329', 'Vân Du', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4126, '12163', 'c6', 'vi', '33', '329', 'Quang Vinh', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4127, '12166', 'c6', 'vi', '33', '329', 'Xuân Trúc', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4128, '12169', 'c6', 'vi', '33', '329', 'Hoàng Hoa Thám', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4129, '12172', 'c6', 'vi', '33', '329', 'Quảng Lãng', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4130, '12175', 'c6', 'vi', '33', '329', 'Văn Nhuệ', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4131, '12178', 'c6', 'vi', '33', '329', 'Đặng Lễ', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4132, '12181', 'c6', 'vi', '33', '329', 'Cẩm Ninh', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4133, '12184', 'c6', 'vi', '33', '329', 'Nguyễn Trãi', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4134, '12187', 'c6', 'vi', '33', '329', 'Đa Lộc', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4135, '12190', 'c6', 'vi', '33', '329', 'Hồ Tùng Mậu', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4136, '12193', 'c6', 'vi', '33', '329', 'Tiền Phong', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4137, '12196', 'c6', 'vi', '33', '329', 'Hồng Vân', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4138, '12199', 'c6', 'vi', '33', '329', 'Hồng Quang', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4139, '12202', 'c6', 'vi', '33', '329', 'Hạ Lễ', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4140, '12205', 'c6', 'vi', '33', '330', 'Khoái Châu', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4141, '12208', 'c6', 'vi', '33', '330', 'Đông Tảo', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4142, '12211', 'c6', 'vi', '33', '330', 'Bình Minh', 0, 0, 1, 1415954521, 1415954521, 'vi'),
(4143, '12214', 'c6', 'vi', '33', '330', 'Dạ Trạch', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4144, '12217', 'c6', 'vi', '33', '330', 'Hàm Tử', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4145, '12220', 'c6', 'vi', '33', '330', 'Ông Đình', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4146, '12223', 'c6', 'vi', '33', '330', 'Tân Dân', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4147, '12226', 'c6', 'vi', '33', '330', 'Tứ Dân', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4148, '12229', 'c6', 'vi', '33', '330', 'An Vĩ', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4149, '12232', 'c6', 'vi', '33', '330', 'Đông Kết', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4150, '12235', 'c6', 'vi', '33', '330', 'Bình Kiều', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4151, '12238', 'c6', 'vi', '33', '330', 'Dân Tiến', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4152, '12241', 'c6', 'vi', '33', '330', 'Đồng Tiến', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4153, '12244', 'c6', 'vi', '33', '330', 'Hồng Tiến', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4154, '12247', 'c6', 'vi', '33', '330', 'Tân Châu', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4155, '12250', 'c6', 'vi', '33', '330', 'Liên Khê', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4156, '12253', 'c6', 'vi', '33', '330', 'Phùng Hưng', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4157, '12256', 'c6', 'vi', '33', '330', 'Việt Hòa', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4158, '12259', 'c6', 'vi', '33', '330', 'Đông Ninh', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4159, '12262', 'c6', 'vi', '33', '330', 'Đại Tập', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4160, '12265', 'c6', 'vi', '33', '330', 'Chí Tân', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4161, '12268', 'c6', 'vi', '33', '330', 'Đại Hưng', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4162, '12271', 'c6', 'vi', '33', '330', 'Thuần Hưng', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4163, '12274', 'c6', 'vi', '33', '330', 'Thành Công', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4164, '12277', 'c6', 'vi', '33', '330', 'Nhuế Dương', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4165, '12280', 'c6', 'vi', '33', '331', 'Lương Bằng', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4166, '12283', 'c6', 'vi', '33', '331', 'Nghĩa Dân', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4167, '12286', 'c6', 'vi', '33', '331', 'Toàn Thắng', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4168, '12289', 'c6', 'vi', '33', '331', 'Vĩnh Xá', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4169, '12292', 'c6', 'vi', '33', '331', 'Phạm Ngũ Lão', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4170, '12295', 'c6', 'vi', '33', '331', 'Thọ Vinh', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4171, '12298', 'c6', 'vi', '33', '331', 'Đồng Thanh', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4172, '12301', 'c6', 'vi', '33', '331', 'Song Mai', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4173, '12304', 'c6', 'vi', '33', '331', 'Chính Nghĩa', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4174, '12307', 'c6', 'vi', '33', '331', 'Nhân La', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4175, '12310', 'c6', 'vi', '33', '331', 'Phú Thịnh', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4176, '12313', 'c6', 'vi', '33', '331', 'Mai Động', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4177, '12316', 'c6', 'vi', '33', '331', 'Đức Hợp', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4178, '12319', 'c6', 'vi', '33', '331', 'Hùng An', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4179, '12322', 'c6', 'vi', '33', '331', 'Ngọc Thanh', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4180, '12325', 'c6', 'vi', '33', '331', 'Vũ Xá', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4181, '12328', 'c6', 'vi', '33', '331', 'Hiệp Cường', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4182, '12331', 'c6', 'vi', '33', '331', 'Phú Cường', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4183, '12334', 'c6', 'vi', '33', '331', 'Hùng Cường', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4184, '12337', 'c6', 'vi', '33', '332', 'Vương', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4185, '12340', 'c6', 'vi', '33', '332', 'Hưng Đạo', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4186, '12343', 'c6', 'vi', '33', '332', 'Ngô Quyền', 0, 0, 1, 1415954522, 1415954522, 'vi'),
(4187, '12346', 'c6', 'vi', '33', '332', 'Nhật Tân', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4188, '12349', 'c6', 'vi', '33', '332', 'Dị Chế', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4189, '12352', 'c6', 'vi', '33', '332', 'Lệ Xá', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4190, '12355', 'c6', 'vi', '33', '332', 'An Viên', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4191, '12358', 'c6', 'vi', '33', '332', 'Đức Thắng', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4192, '12361', 'c6', 'vi', '33', '332', 'Trung Dũng', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4193, '12364', 'c6', 'vi', '33', '332', 'Hải Triều', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4194, '12367', 'c6', 'vi', '33', '332', 'Thủ Sỹ', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4195, '12370', 'c6', 'vi', '33', '332', 'Thiện Phiến', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4196, '12373', 'c6', 'vi', '33', '332', 'Thụy Lôi', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4197, '12376', 'c6', 'vi', '33', '332', 'Cương Chính', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4198, '12379', 'c6', 'vi', '33', '332', 'Minh Phương', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4199, '12382', 'c6', 'vi', '33', '332', 'Phương Chiểu', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4200, '12385', 'c6', 'vi', '33', '332', 'Tân Hưng', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4201, '12388', 'c6', 'vi', '33', '332', 'Hoàng Hanh', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4202, '12391', 'c6', 'vi', '33', '333', 'Trần Cao', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4203, '12394', 'c6', 'vi', '33', '333', 'Minh Tân', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4204, '12397', 'c6', 'vi', '33', '333', 'Phan Sào Nam', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4205, '12400', 'c6', 'vi', '33', '333', 'Quang Hưng', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4206, '12403', 'c6', 'vi', '33', '333', 'Minh Hoàng', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4207, '12406', 'c6', 'vi', '33', '333', 'Đoàn Đào', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4208, '12409', 'c6', 'vi', '33', '333', 'Tống Phan', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4209, '12412', 'c6', 'vi', '33', '333', 'Đình Cao', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4210, '12415', 'c6', 'vi', '33', '333', 'Nhật Quang', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4211, '12418', 'c6', 'vi', '33', '333', 'Tiền Tiến', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4212, '12421', 'c6', 'vi', '33', '333', 'Tam Đa', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4213, '12424', 'c6', 'vi', '33', '333', 'Minh Tiến', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4214, '12427', 'c6', 'vi', '33', '333', 'Nguyên Hòa', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4215, '12430', 'c6', 'vi', '33', '333', 'Tống Trân', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4216, '12433', 'c6', 'vi', '34', '336', 'Lê Hồng Phong', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4217, '12436', 'c6', 'vi', '34', '336', 'Bồ Xuyên', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4218, '12439', 'c6', 'vi', '34', '336', 'Đề Thám', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4219, '12442', 'c6', 'vi', '34', '336', 'Kỳ Bá', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4220, '12445', 'c6', 'vi', '34', '336', 'Quang Trung', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4221, '12448', 'c6', 'vi', '34', '336', 'Phú Khánh', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4222, '12451', 'c6', 'vi', '34', '336', 'Tiền Phong', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4223, '12452', 'c6', 'vi', '34', '336', 'Trần Hưng Đạo', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4224, '12454', 'c6', 'vi', '34', '336', 'Trần Lãm', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4225, '12457', 'c6', 'vi', '34', '336', 'Đông Hòa', 0, 0, 1, 1415954523, 1415954523, 'vi'),
(4226, '12460', 'c6', 'vi', '34', '336', 'Hoàng Diệu', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4227, '12463', 'c6', 'vi', '34', '336', 'Phú Xuân', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4228, '12466', 'c6', 'vi', '34', '336', 'Vũ Phúc', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4229, '12469', 'c6', 'vi', '34', '336', 'Vũ Chính', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4230, '12472', 'c6', 'vi', '34', '338', 'Quỳnh Côi', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4231, '12475', 'c6', 'vi', '34', '338', 'An Khê', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4232, '12478', 'c6', 'vi', '34', '338', 'An Đồng', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4233, '12481', 'c6', 'vi', '34', '338', 'Quỳnh Hoa', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4234, '12484', 'c6', 'vi', '34', '338', 'Quỳnh Lâm', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4235, '12487', 'c6', 'vi', '34', '338', 'Quỳnh Thọ', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4236, '12490', 'c6', 'vi', '34', '338', 'An Hiệp', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4237, '12493', 'c6', 'vi', '34', '338', 'Quỳnh Hoàng', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4238, '12496', 'c6', 'vi', '34', '338', 'Quỳnh Giao', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4239, '12499', 'c6', 'vi', '34', '338', 'An Thái', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4240, '12502', 'c6', 'vi', '34', '338', 'An Cầu', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4241, '12505', 'c6', 'vi', '34', '338', 'Quỳnh Hồng', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4242, '12508', 'c6', 'vi', '34', '338', 'Quỳnh Khê', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4243, '12511', 'c6', 'vi', '34', '338', 'Quỳnh Minh', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4244, '12514', 'c6', 'vi', '34', '338', 'An Ninh', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4245, '12517', 'c6', 'vi', '34', '338', 'Quỳnh Ngọc', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4246, '12520', 'c6', 'vi', '34', '338', 'Quỳnh Hải', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4247, '12523', 'c6', 'vi', '34', '338', 'An Bài', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4248, '12526', 'c6', 'vi', '34', '338', 'An Ấp', 0, 0, 1, 1415954524, 1415954524, 'vi');
INSERT INTO `location_ward` (`id`, `code`, `area_code`, `country_code`, `province_code`, `district_code`, `title`, `is_extramural`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(4249, '12529', 'c6', 'vi', '34', '338', 'Quỳnh Hội', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4250, '12532', 'c6', 'vi', '34', '338', 'Quỳnh Sơn', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4251, '12535', 'c6', 'vi', '34', '338', 'Quỳnh Mỹ', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4252, '12538', 'c6', 'vi', '34', '338', 'An Quí', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4253, '12541', 'c6', 'vi', '34', '338', 'An Thanh', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4254, '12544', 'c6', 'vi', '34', '338', 'Quỳnh Châu', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4255, '12547', 'c6', 'vi', '34', '338', 'An Vũ', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4256, '12550', 'c6', 'vi', '34', '338', 'An Lễ', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4257, '12553', 'c6', 'vi', '34', '338', 'Quỳnh Hưng', 0, 0, 1, 1415954524, 1415954524, 'vi'),
(4258, '12556', 'c6', 'vi', '34', '338', 'Quỳnh Bảo', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4259, '12559', 'c6', 'vi', '34', '338', 'An Mỹ', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4260, '12562', 'c6', 'vi', '34', '338', 'Quỳnh Nguyên', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4261, '12565', 'c6', 'vi', '34', '338', 'An Vinh', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4262, '12568', 'c6', 'vi', '34', '338', 'Quỳnh Xá', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4263, '12571', 'c6', 'vi', '34', '338', 'An Dục', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4264, '12574', 'c6', 'vi', '34', '338', 'Đông Hải', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4265, '12577', 'c6', 'vi', '34', '338', 'Quỳnh Trang', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4266, '12580', 'c6', 'vi', '34', '338', 'An Tràng', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4267, '12583', 'c6', 'vi', '34', '338', 'Đồng Tiến', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4268, '12586', 'c6', 'vi', '34', '339', 'Hưng Hà', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4269, '12589', 'c6', 'vi', '34', '339', 'Điệp Nông', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4270, '12592', 'c6', 'vi', '34', '339', 'Tân Lễ', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4271, '12595', 'c6', 'vi', '34', '339', 'Cộng Hòa', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4272, '12598', 'c6', 'vi', '34', '339', 'Dân Chủ', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4273, '12601', 'c6', 'vi', '34', '339', 'Canh Tân', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4274, '12604', 'c6', 'vi', '34', '339', 'Hòa Tiến', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4275, '12607', 'c6', 'vi', '34', '339', 'Hùng Dũng', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4276, '12610', 'c6', 'vi', '34', '339', 'Tân Tiến', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4277, '12613', 'c6', 'vi', '34', '339', 'Hưng Nhân', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4278, '12616', 'c6', 'vi', '34', '339', 'Đoan Hùng', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4279, '12619', 'c6', 'vi', '34', '339', 'Duyên Hải', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4280, '12622', 'c6', 'vi', '34', '339', 'Tân Hòa', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4281, '12625', 'c6', 'vi', '34', '339', 'Văn Cẩm', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4282, '12628', 'c6', 'vi', '34', '339', 'Bắc Sơn', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4283, '12631', 'c6', 'vi', '34', '339', 'Đông Đô', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4284, '12634', 'c6', 'vi', '34', '339', 'Phúc Khánh', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4285, '12637', 'c6', 'vi', '34', '339', 'Liên Hiệp', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4286, '12640', 'c6', 'vi', '34', '339', 'Tây Đô', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4287, '12643', 'c6', 'vi', '34', '339', 'Thống Nhất', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4288, '12646', 'c6', 'vi', '34', '339', 'Tiến Đức', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4289, '12649', 'c6', 'vi', '34', '339', 'Thái Hưng', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4290, '12652', 'c6', 'vi', '34', '339', 'Thái Phương', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4291, '12655', 'c6', 'vi', '34', '339', 'Hoà Bình', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4292, '12656', 'c6', 'vi', '34', '339', 'Chi Lăng', 0, 0, 1, 1415954525, 1415954525, 'vi'),
(4293, '12658', 'c6', 'vi', '34', '339', 'Minh Khai', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4294, '12661', 'c6', 'vi', '34', '339', 'Hồng An', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4295, '12664', 'c6', 'vi', '34', '339', 'Kim Chung', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4296, '12667', 'c6', 'vi', '34', '339', 'Hồng Lĩnh', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4297, '12670', 'c6', 'vi', '34', '339', 'Minh Tân', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4298, '12673', 'c6', 'vi', '34', '339', 'Văn Lang', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4299, '12676', 'c6', 'vi', '34', '339', 'Độc Lập', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4300, '12679', 'c6', 'vi', '34', '339', 'Chí Hòa', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4301, '12682', 'c6', 'vi', '34', '339', 'Minh Hòa', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4302, '12685', 'c6', 'vi', '34', '339', 'Hồng Minh', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4303, '12688', 'c6', 'vi', '34', '340', 'Đông Hưng', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4304, '12691', 'c6', 'vi', '34', '340', 'Đô Lương', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4305, '12694', 'c6', 'vi', '34', '340', 'Đông Phương', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4306, '12697', 'c6', 'vi', '34', '340', 'Liên Giang', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4307, '12700', 'c6', 'vi', '34', '340', 'An Châu', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4308, '12703', 'c6', 'vi', '34', '340', 'Đông Sơn', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4309, '12706', 'c6', 'vi', '34', '340', 'Đông Cường', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4310, '12709', 'c6', 'vi', '34', '340', 'Phú Lương', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4311, '12712', 'c6', 'vi', '34', '340', 'Mê Linh', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4312, '12715', 'c6', 'vi', '34', '340', 'Lô Giang', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4313, '12718', 'c6', 'vi', '34', '340', 'Đông La', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4314, '12721', 'c6', 'vi', '34', '340', 'Minh Tân', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4315, '12724', 'c6', 'vi', '34', '340', 'Đông Xá', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4316, '12727', 'c6', 'vi', '34', '340', 'Chương Dương', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4317, '12730', 'c6', 'vi', '34', '340', 'Nguyên Xá', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4318, '12733', 'c6', 'vi', '34', '340', 'Phong Châu', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4319, '12736', 'c6', 'vi', '34', '340', 'Hợp Tiến', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4320, '12739', 'c6', 'vi', '34', '340', 'Hồng Việt', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4321, '12742', 'c6', 'vi', '34', '340', 'Đông Hà', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4322, '12745', 'c6', 'vi', '34', '340', 'Đông Giang', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4323, '12748', 'c6', 'vi', '34', '340', 'Đông Kinh', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4324, '12751', 'c6', 'vi', '34', '340', 'Đông Hợp', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4325, '12754', 'c6', 'vi', '34', '340', 'Thăng Long', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4326, '12757', 'c6', 'vi', '34', '340', 'Đông Các', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4327, '12760', 'c6', 'vi', '34', '340', 'Phú Châu', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4328, '12763', 'c6', 'vi', '34', '340', 'Hoa Lư', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4329, '12766', 'c6', 'vi', '34', '340', 'Minh Châu', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4330, '12769', 'c6', 'vi', '34', '340', 'Đông Tân', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4331, '12772', 'c6', 'vi', '34', '340', 'Đông Vinh', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4332, '12775', 'c6', 'vi', '34', '340', 'Đông Động', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4333, '12778', 'c6', 'vi', '34', '340', 'Hồng Châu', 0, 0, 1, 1415954526, 1415954526, 'vi'),
(4334, '12781', 'c6', 'vi', '34', '340', 'Bạch Đằng', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4335, '12784', 'c6', 'vi', '34', '340', 'Trọng Quan', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4336, '12787', 'c6', 'vi', '34', '340', 'Hoa Nam', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4337, '12790', 'c6', 'vi', '34', '340', 'Hồng Giang', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4338, '12793', 'c6', 'vi', '34', '340', 'Đông Phong', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4339, '12796', 'c6', 'vi', '34', '340', 'Đông Quang', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4340, '12799', 'c6', 'vi', '34', '340', 'Đông Xuân', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4341, '12802', 'c6', 'vi', '34', '340', 'Đông Á', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4342, '12805', 'c6', 'vi', '34', '340', 'Đông Lĩnh', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4343, '12808', 'c6', 'vi', '34', '340', 'Đông Hoàng', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4344, '12811', 'c6', 'vi', '34', '340', 'Đông Dương', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4345, '12814', 'c6', 'vi', '34', '340', 'Đông Huy', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4346, '12817', 'c6', 'vi', '34', '336', 'Đông Mỹ', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4347, '12820', 'c6', 'vi', '34', '336', 'Đông Thọ', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4348, '12823', 'c6', 'vi', '34', '340', 'Đồng Phú', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4349, '12826', 'c6', 'vi', '34', '341', 'Diêm Điền', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4350, '12829', 'c6', 'vi', '34', '341', 'Thụy Tân', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4351, '12832', 'c6', 'vi', '34', '341', 'Thụy Trường', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4352, '12835', 'c6', 'vi', '34', '341', 'Hồng Quỳnh', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4353, '12838', 'c6', 'vi', '34', '341', 'Thụy Dũng', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4354, '12841', 'c6', 'vi', '34', '341', 'Thụy Hồng', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4355, '12844', 'c6', 'vi', '34', '341', 'Thụy Quỳnh', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4356, '12847', 'c6', 'vi', '34', '341', 'Thụy An', 0, 0, 1, 1415954527, 1415954527, 'vi'),
(4357, '12850', 'c6', 'vi', '34', '341', 'Thụy Ninh', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4358, '12853', 'c6', 'vi', '34', '341', 'Thụy Hưng', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4359, '12856', 'c6', 'vi', '34', '341', 'Thụy Việt', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4360, '12859', 'c6', 'vi', '34', '341', 'Thụy Văn', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4361, '12862', 'c6', 'vi', '34', '341', 'Thụy Xuân', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4362, '12865', 'c6', 'vi', '34', '341', 'Thụy Dương', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4363, '12868', 'c6', 'vi', '34', '341', 'Thụy Trình', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4364, '12871', 'c6', 'vi', '34', '341', 'Thụy Bình', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4365, '12874', 'c6', 'vi', '34', '341', 'Thụy Chính', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4366, '12877', 'c6', 'vi', '34', '341', 'Thụy Dân', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4367, '12880', 'c6', 'vi', '34', '341', 'Thụy Hải', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4368, '12883', 'c6', 'vi', '34', '341', 'Thụy Phúc', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4369, '12886', 'c6', 'vi', '34', '341', 'Thụy Lương', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4370, '12889', 'c6', 'vi', '34', '341', 'Thụy Liên', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4371, '12892', 'c6', 'vi', '34', '341', 'Thụy Duyên', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4372, '12895', 'c6', 'vi', '34', '341', 'Thụy Hà', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4373, '12898', 'c6', 'vi', '34', '341', 'Thụy Thanh', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4374, '12901', 'c6', 'vi', '34', '341', 'Thụy Sơn', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4375, '12904', 'c6', 'vi', '34', '341', 'Thụy Phong', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4376, '12907', 'c6', 'vi', '34', '341', 'Thái Thượng', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4377, '12910', 'c6', 'vi', '34', '341', 'Thái Nguyên', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4378, '12913', 'c6', 'vi', '34', '341', 'Thái Thuỷ', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4379, '12916', 'c6', 'vi', '34', '341', 'Thái Dương', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4380, '12919', 'c6', 'vi', '34', '341', 'Thái Giang', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4381, '12922', 'c6', 'vi', '34', '341', 'Thái Hoà', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4382, '12925', 'c6', 'vi', '34', '341', 'Thái Sơn', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4383, '12928', 'c6', 'vi', '34', '341', 'Thái Hồng', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4384, '12931', 'c6', 'vi', '34', '341', 'Thái An', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4385, '12934', 'c6', 'vi', '34', '341', 'Thái Phúc', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4386, '12937', 'c6', 'vi', '34', '341', 'Thái Hưng', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4387, '12940', 'c6', 'vi', '34', '341', 'Thái Đô', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4388, '12943', 'c6', 'vi', '34', '341', 'Thái Xuyên', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4389, '12946', 'c6', 'vi', '34', '341', 'Thái Hà', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4390, '12949', 'c6', 'vi', '34', '341', 'Mỹ Lộc', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4391, '12952', 'c6', 'vi', '34', '341', 'Thái Tân', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4392, '12955', 'c6', 'vi', '34', '341', 'Thái Thuần', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4393, '12958', 'c6', 'vi', '34', '341', 'Thái Học', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4394, '12961', 'c6', 'vi', '34', '341', 'Thái Thịnh', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4395, '12964', 'c6', 'vi', '34', '341', 'Thái Thành', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4396, '12967', 'c6', 'vi', '34', '341', 'Thái Thọ', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4397, '12970', 'c6', 'vi', '34', '342', 'Tiền Hải', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4398, '12973', 'c6', 'vi', '34', '342', 'Đông Hải', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4399, '12976', 'c6', 'vi', '34', '342', 'Đông Trà', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4400, '12979', 'c6', 'vi', '34', '342', 'Đông Long', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4401, '12982', 'c6', 'vi', '34', '342', 'Đông Quí', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4402, '12985', 'c6', 'vi', '34', '342', 'Vũ Lăng', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4403, '12988', 'c6', 'vi', '34', '342', 'Đông Xuyên', 0, 0, 1, 1415954528, 1415954528, 'vi'),
(4404, '12991', 'c6', 'vi', '34', '342', 'Tây Lương', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4405, '12994', 'c6', 'vi', '34', '342', 'Tây Ninh', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4406, '12997', 'c6', 'vi', '34', '342', 'Đông Trung', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4407, '13000', 'c6', 'vi', '34', '342', 'Đông Hoàng', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4408, '13003', 'c6', 'vi', '34', '342', 'Đông Minh', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4409, '13006', 'c6', 'vi', '34', '342', 'Tây An', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4410, '13009', 'c6', 'vi', '34', '342', 'Đông Phong', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4411, '13012', 'c6', 'vi', '34', '342', 'An Ninh', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4412, '13015', 'c6', 'vi', '34', '342', 'Tây Sơn', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4413, '13018', 'c6', 'vi', '34', '342', 'Đông Cơ', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4414, '13021', 'c6', 'vi', '34', '342', 'Tây Giang', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4415, '13024', 'c6', 'vi', '34', '342', 'Đông Lâm', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4416, '13027', 'c6', 'vi', '34', '342', 'Phương Công', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4417, '13030', 'c6', 'vi', '34', '342', 'Tây Phong', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4418, '13033', 'c6', 'vi', '34', '342', 'Tây Tiến', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4419, '13036', 'c6', 'vi', '34', '342', 'Nam Cường', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4420, '13039', 'c6', 'vi', '34', '342', 'Vân Trường', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4421, '13042', 'c6', 'vi', '34', '342', 'Nam Thắng', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4422, '13045', 'c6', 'vi', '34', '342', 'Nam Chính', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4423, '13048', 'c6', 'vi', '34', '342', 'Bắc Hải', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4424, '13051', 'c6', 'vi', '34', '342', 'Nam Thịnh', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4425, '13054', 'c6', 'vi', '34', '342', 'Nam Hà', 0, 0, 1, 1415954529, 1415954529, 'vi'),
(4426, '13057', 'c6', 'vi', '34', '342', 'Nam Thanh', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4427, '13060', 'c6', 'vi', '34', '342', 'Nam Trung', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4428, '13063', 'c6', 'vi', '34', '342', 'Nam Hồng', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4429, '13066', 'c6', 'vi', '34', '342', 'Nam Hưng', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4430, '13069', 'c6', 'vi', '34', '342', 'Nam Hải', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4431, '13072', 'c6', 'vi', '34', '342', 'Nam Phú', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4432, '13075', 'c6', 'vi', '34', '343', 'Thanh Nê', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4433, '13078', 'c6', 'vi', '34', '343', 'Trà Giang', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4434, '13081', 'c6', 'vi', '34', '343', 'Quốc Tuấn', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4435, '13084', 'c6', 'vi', '34', '336', 'Vũ Đông', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4436, '13087', 'c6', 'vi', '34', '343', 'An Bình', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4437, '13090', 'c6', 'vi', '34', '343', 'Vũ Tây', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4438, '13093', 'c6', 'vi', '34', '343', 'Hồng Thái', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4439, '13096', 'c6', 'vi', '34', '343', 'Bình Nguyên', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4440, '13099', 'c6', 'vi', '34', '343', 'Vũ Sơn', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4441, '13102', 'c6', 'vi', '34', '343', 'Lê Lợi', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4442, '13105', 'c6', 'vi', '34', '343', 'Quyết Tiến', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4443, '13108', 'c6', 'vi', '34', '336', 'Vũ Lạc', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4444, '13111', 'c6', 'vi', '34', '343', 'Vũ Lễ', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4445, '13114', 'c6', 'vi', '34', '343', 'Thanh Tân', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4446, '13117', 'c6', 'vi', '34', '343', 'Thượng Hiền', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4447, '13120', 'c6', 'vi', '34', '343', 'Nam Cao', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4448, '13123', 'c6', 'vi', '34', '343', 'Đình Phùng', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4449, '13126', 'c6', 'vi', '34', '343', 'Vũ Ninh', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4450, '13129', 'c6', 'vi', '34', '343', 'Vũ An', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4451, '13132', 'c6', 'vi', '34', '343', 'Quang Lịch', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4452, '13135', 'c6', 'vi', '34', '343', 'Hòa Bình', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4453, '13138', 'c6', 'vi', '34', '343', 'Bình Minh', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4454, '13141', 'c6', 'vi', '34', '343', 'Vũ Quí', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4455, '13144', 'c6', 'vi', '34', '343', 'Quang Bình', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4456, '13147', 'c6', 'vi', '34', '343', 'An Bồi', 0, 0, 1, 1415954530, 1415954530, 'vi'),
(4457, '13150', 'c6', 'vi', '34', '343', 'Vũ Trung', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4458, '13153', 'c6', 'vi', '34', '343', 'Vũ Thắng', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4459, '13156', 'c6', 'vi', '34', '343', 'Vũ Công', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4460, '13159', 'c6', 'vi', '34', '343', 'Vũ Hòa', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4461, '13162', 'c6', 'vi', '34', '343', 'Quang Minh', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4462, '13165', 'c6', 'vi', '34', '343', 'Quang Trung', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4463, '13168', 'c6', 'vi', '34', '343', 'Minh Hưng', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4464, '13171', 'c6', 'vi', '34', '343', 'Quang Hưng', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4465, '13174', 'c6', 'vi', '34', '343', 'Vũ Bình', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4466, '13177', 'c6', 'vi', '34', '343', 'Minh Tân', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4467, '13180', 'c6', 'vi', '34', '343', 'Nam Bình', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4468, '13183', 'c6', 'vi', '34', '343', 'Bình Thanh', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4469, '13186', 'c6', 'vi', '34', '343', 'Bình Định', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4470, '13189', 'c6', 'vi', '34', '343', 'Hồng Tiến', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4471, '13192', 'c6', 'vi', '34', '344', 'Vũ Thư', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4472, '13195', 'c6', 'vi', '34', '344', 'Hồng Lý', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4473, '13198', 'c6', 'vi', '34', '344', 'Đồng Thanh', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4474, '13201', 'c6', 'vi', '34', '344', 'Xuân Hòa', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4475, '13204', 'c6', 'vi', '34', '344', 'Hiệp Hòa', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4476, '13207', 'c6', 'vi', '34', '344', 'Phúc Thành', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4477, '13210', 'c6', 'vi', '34', '344', 'Tân Phong', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4478, '13213', 'c6', 'vi', '34', '344', 'Song Lãng', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4479, '13216', 'c6', 'vi', '34', '344', 'Tân Hòa', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4480, '13219', 'c6', 'vi', '34', '344', 'Việt Hùng', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4481, '13222', 'c6', 'vi', '34', '344', 'Minh Lãng', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4482, '13225', 'c6', 'vi', '34', '336', 'Tân Bình', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4483, '13228', 'c6', 'vi', '34', '344', 'Minh Khai', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4484, '13231', 'c6', 'vi', '34', '344', 'Dũng Nghĩa', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4485, '13234', 'c6', 'vi', '34', '344', 'Minh Quang', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4486, '13237', 'c6', 'vi', '34', '344', 'Tam Quang', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4487, '13240', 'c6', 'vi', '34', '344', 'Tân Lập', 0, 0, 1, 1415954531, 1415954531, 'vi'),
(4488, '13243', 'c6', 'vi', '34', '344', 'Bách Thuận', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4489, '13246', 'c6', 'vi', '34', '344', 'Tự Tân', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4490, '13249', 'c6', 'vi', '34', '344', 'Song An', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4491, '13252', 'c6', 'vi', '34', '344', 'Trung An', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4492, '13255', 'c6', 'vi', '34', '344', 'Vũ Hội', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4493, '13258', 'c6', 'vi', '34', '344', 'Hòa Bình', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4494, '13261', 'c6', 'vi', '34', '344', 'Nguyên Xá', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4495, '13264', 'c6', 'vi', '34', '344', 'Việt Thuận', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4496, '13267', 'c6', 'vi', '34', '344', 'Vũ Vinh', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4497, '13270', 'c6', 'vi', '34', '344', 'Vũ Đoài', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4498, '13273', 'c6', 'vi', '34', '344', 'Vũ Tiến', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4499, '13276', 'c6', 'vi', '34', '344', 'Vũ Vân', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4500, '13279', 'c6', 'vi', '34', '344', 'Duy Nhất', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4501, '13282', 'c6', 'vi', '34', '344', 'Hồng Phong', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4502, '13285', 'c6', 'vi', '35', '347', 'Quang Trung', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4503, '13288', 'c6', 'vi', '35', '347', 'Lương Khánh Thiện', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4504, '13291', 'c6', 'vi', '35', '347', 'Lê Hồng Phong', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4505, '13294', 'c6', 'vi', '35', '347', 'Minh Khai', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4506, '13297', 'c6', 'vi', '35', '347', 'Hai Bà Trưng', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4507, '13300', 'c6', 'vi', '35', '347', 'Trần Hưng Đạo', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4508, '13303', 'c6', 'vi', '35', '347', 'Lam Hạ', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4509, '13306', 'c6', 'vi', '35', '347', 'Phù Vân', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4510, '13309', 'c6', 'vi', '35', '347', 'Liêm Chính', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4511, '13312', 'c6', 'vi', '35', '347', 'Liêm Chung', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4512, '13315', 'c6', 'vi', '35', '347', 'Thanh Châu', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4513, '13318', 'c6', 'vi', '35', '347', 'Châu Sơn', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4514, '13321', 'c6', 'vi', '35', '349', 'Đồng Văn', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4515, '13324', 'c6', 'vi', '35', '349', 'Hòa Mạc', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4516, '13327', 'c6', 'vi', '35', '349', 'Mộc Bắc', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4517, '13330', 'c6', 'vi', '35', '349', 'Châu Giang', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4518, '13333', 'c6', 'vi', '35', '349', 'Bạch Thượng', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4519, '13336', 'c6', 'vi', '35', '349', 'Duy Minh', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4520, '13339', 'c6', 'vi', '35', '349', 'Mộc Nam', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4521, '13342', 'c6', 'vi', '35', '349', 'Duy Hải', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4522, '13345', 'c6', 'vi', '35', '349', 'Chuyên Ngoại', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4523, '13348', 'c6', 'vi', '35', '349', 'Yên Bắc', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4524, '13351', 'c6', 'vi', '35', '349', 'Trác Văn', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4525, '13354', 'c6', 'vi', '35', '349', 'Tiên Nội', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4526, '13357', 'c6', 'vi', '35', '349', 'Hoàng Đông', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4527, '13360', 'c6', 'vi', '35', '349', 'Yên Nam', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4528, '13363', 'c6', 'vi', '35', '349', 'Tiên Ngoại', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4529, '13366', 'c6', 'vi', '35', '349', 'Tiên Tân', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4530, '13369', 'c6', 'vi', '35', '349', 'Đọi Sơn', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4531, '13372', 'c6', 'vi', '35', '349', 'Tiên Hiệp', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4532, '13375', 'c6', 'vi', '35', '349', 'Châu Sơn', 0, 0, 1, 1415954532, 1415954532, 'vi'),
(4533, '13378', 'c6', 'vi', '35', '349', 'Tiền Phong', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4534, '13381', 'c6', 'vi', '35', '349', 'Tiên Hải', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4535, '13384', 'c6', 'vi', '35', '350', 'Quế', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4536, '13387', 'c6', 'vi', '35', '350', 'Nguyễn Úy', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4537, '13390', 'c6', 'vi', '35', '350', 'Đại Cương', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4538, '13393', 'c6', 'vi', '35', '350', 'Lê Hồ', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4539, '13396', 'c6', 'vi', '35', '350', 'Tượng Lĩnh', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4540, '13399', 'c6', 'vi', '35', '350', 'Nhật Tựu', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4541, '13402', 'c6', 'vi', '35', '350', 'Nhật Tân', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4542, '13405', 'c6', 'vi', '35', '350', 'Đồng Hóa', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4543, '13408', 'c6', 'vi', '35', '350', 'Hoàng Tây', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4544, '13411', 'c6', 'vi', '35', '350', 'Tân Sơn', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4545, '13414', 'c6', 'vi', '35', '350', 'Thụy Lôi', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4546, '13417', 'c6', 'vi', '35', '350', 'Văn Xá', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4547, '13420', 'c6', 'vi', '35', '350', 'Khả Phong', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4548, '13423', 'c6', 'vi', '35', '350', 'Ngọc Sơn', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4549, '13426', 'c6', 'vi', '35', '350', 'Kim Bình', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4550, '13429', 'c6', 'vi', '35', '350', 'Ba Sao', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4551, '13432', 'c6', 'vi', '35', '350', 'Liên Sơn', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4552, '13435', 'c6', 'vi', '35', '350', 'Thi Sơn', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4553, '13438', 'c6', 'vi', '35', '350', 'Thanh Sơn', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4554, '13441', 'c6', 'vi', '35', '351', 'Kiện Khê', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4555, '13444', 'c6', 'vi', '35', '351', 'Liêm Tuyền', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4556, '13447', 'c6', 'vi', '35', '351', 'Liêm Tiết', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4557, '13450', 'c6', 'vi', '35', '351', 'Liêm Phong', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4558, '13453', 'c6', 'vi', '35', '351', 'Thanh Hà', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4559, '13456', 'c6', 'vi', '35', '351', 'Liêm Cần', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4560, '13459', 'c6', 'vi', '35', '351', 'Thanh Tuyền', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4561, '13462', 'c6', 'vi', '35', '351', 'Thanh Bình', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4562, '13465', 'c6', 'vi', '35', '351', 'Liêm Thuận', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4563, '13468', 'c6', 'vi', '35', '351', 'Thanh Thủy', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4564, '13471', 'c6', 'vi', '35', '351', 'Thanh Phong', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4565, '13474', 'c6', 'vi', '35', '351', 'Thanh Lưu', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4566, '13477', 'c6', 'vi', '35', '351', 'Thanh Tân', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4567, '13480', 'c6', 'vi', '35', '351', 'Liêm Túc', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4568, '13483', 'c6', 'vi', '35', '351', 'Liêm Sơn', 0, 0, 1, 1415954533, 1415954533, 'vi'),
(4569, '13486', 'c6', 'vi', '35', '351', 'Thanh Hương', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4570, '13489', 'c6', 'vi', '35', '351', 'Thanh Nghị', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4571, '13492', 'c6', 'vi', '35', '351', 'Thanh Tâm', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4572, '13495', 'c6', 'vi', '35', '351', 'Thanh Nguyên', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4573, '13498', 'c6', 'vi', '35', '351', 'Thanh Hải', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4574, '13501', 'c6', 'vi', '35', '352', 'Bình Mỹ', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4575, '13504', 'c6', 'vi', '35', '352', 'Bình Nghĩa', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4576, '13507', 'c6', 'vi', '35', '352', 'Đinh Xá', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4577, '13510', 'c6', 'vi', '35', '352', 'Tràng An', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4578, '13513', 'c6', 'vi', '35', '352', 'Trịnh Xá', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4579, '13516', 'c6', 'vi', '35', '352', 'Đồng Du', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4580, '13519', 'c6', 'vi', '35', '352', 'Ngọc Lũ', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4581, '13522', 'c6', 'vi', '35', '352', 'Hưng Công', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4582, '13525', 'c6', 'vi', '35', '352', 'Đồn Xá', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4583, '13528', 'c6', 'vi', '35', '352', 'An Ninh', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4584, '13531', 'c6', 'vi', '35', '352', 'Bồ Đề', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4585, '13534', 'c6', 'vi', '35', '352', 'Bối Cầu', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4586, '13537', 'c6', 'vi', '35', '352', 'An Mỹ', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4587, '13540', 'c6', 'vi', '35', '352', 'An Nội', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4588, '13543', 'c6', 'vi', '35', '352', 'Vũ Bản', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4589, '13546', 'c6', 'vi', '35', '352', 'Trung Lương', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4590, '13549', 'c6', 'vi', '35', '352', 'Mỹ Thọ', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4591, '13552', 'c6', 'vi', '35', '352', 'An Đổ', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4592, '13555', 'c6', 'vi', '35', '352', 'La Sơn', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4593, '13558', 'c6', 'vi', '35', '352', 'Tiêu Động', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4594, '13561', 'c6', 'vi', '35', '352', 'An Lão', 0, 0, 1, 1415954534, 1415954534, 'vi'),
(4595, '13564', 'c6', 'vi', '35', '353', 'Vĩnh Trụ', 0, 0, 1, 1415954535, 1415954535, 'vi'),
(4596, '13567', 'c6', 'vi', '35', '353', 'Hợp Lý', 0, 0, 1, 1415954535, 1415954535, 'vi'),
(4597, '13570', 'c6', 'vi', '35', '353', 'Nguyên Lý', 0, 0, 1, 1415954535, 1415954535, 'vi'),
(4598, '13573', 'c6', 'vi', '35', '353', 'Chính Lý', 0, 0, 1, 1415954535, 1415954535, 'vi'),
(4599, '13576', 'c6', 'vi', '35', '353', 'Chân Lý', 0, 0, 1, 1415954535, 1415954535, 'vi'),
(4600, '13579', 'c6', 'vi', '35', '353', 'Đạo Lý', 0, 0, 1, 1415954535, 1415954535, 'vi'),
(4601, '13582', 'c6', 'vi', '35', '353', 'Công Lý', 0, 0, 1, 1415954535, 1415954535, 'vi'),
(4602, '13585', 'c6', 'vi', '35', '353', 'Văn Lý', 0, 0, 1, 1415954535, 1415954535, 'vi'),
(4603, '13588', 'c6', 'vi', '35', '353', 'Bắc Lý', 0, 0, 1, 1415954535, 1415954535, 'vi'),
(4604, '13591', 'c6', 'vi', '35', '353', 'Đức Lý', 0, 0, 1, 1415954535, 1415954535, 'vi'),
(4605, '13594', 'c6', 'vi', '35', '353', 'Nhân Đạo', 0, 0, 1, 1415954535, 1415954535, 'vi'),
(4606, '13597', 'c6', 'vi', '35', '353', 'Đồng Lý', 0, 0, 1, 1415954535, 1415954535, 'vi'),
(4607, '13600', 'c6', 'vi', '35', '353', 'Nhân Thịnh', 0, 0, 1, 1415954535, 1415954535, 'vi'),
(4608, '13603', 'c6', 'vi', '35', '353', 'Nhân Hưng', 0, 0, 1, 1415954535, 1415954535, 'vi'),
(4609, '13606', 'c6', 'vi', '35', '353', 'Nhân Khang', 0, 0, 1, 1415954535, 1415954535, 'vi'),
(4610, '13609', 'c6', 'vi', '35', '353', 'Nhân Mỹ', 0, 0, 1, 1415954535, 1415954535, 'vi'),
(4611, '13612', 'c6', 'vi', '35', '353', 'Nhân Nghĩa', 0, 0, 1, 1415954535, 1415954535, 'vi'),
(4612, '13615', 'c6', 'vi', '35', '353', 'Nhân Chính', 0, 0, 1, 1415954535, 1415954535, 'vi'),
(4613, '13618', 'c6', 'vi', '35', '353', 'Nhân Bình', 0, 0, 1, 1415954535, 1415954535, 'vi'),
(4614, '13621', 'c6', 'vi', '35', '353', 'Phú Phúc', 0, 0, 1, 1415954536, 1415954536, 'vi'),
(4615, '13624', 'c6', 'vi', '35', '353', 'Xuân Khê', 0, 0, 1, 1415954536, 1415954536, 'vi'),
(4616, '13627', 'c6', 'vi', '35', '353', 'Tiến Thắng', 0, 0, 1, 1415954536, 1415954536, 'vi'),
(4617, '13630', 'c6', 'vi', '35', '353', 'Hòa Hậu', 0, 0, 1, 1415954536, 1415954536, 'vi'),
(4618, '13633', 'c6', 'vi', '36', '356', 'Hạ Long', 0, 0, 1, 1415954536, 1415954536, 'vi'),
(4619, '13636', 'c6', 'vi', '36', '356', 'Trần Tế Xương', 0, 0, 1, 1415954536, 1415954536, 'vi'),
(4620, '13639', 'c6', 'vi', '36', '356', 'Vị Hoàng', 0, 0, 1, 1415954537, 1415954537, 'vi'),
(4621, '13642', 'c6', 'vi', '36', '356', 'Vị Xuyên', 0, 0, 1, 1415954537, 1415954537, 'vi'),
(4622, '13645', 'c6', 'vi', '36', '356', 'Quang Trung', 0, 0, 1, 1415954537, 1415954537, 'vi'),
(4623, '13648', 'c6', 'vi', '36', '356', 'Cửa Bắc', 0, 0, 1, 1415954537, 1415954537, 'vi'),
(4624, '13651', 'c6', 'vi', '36', '356', 'Nguyễn Du', 0, 0, 1, 1415954537, 1415954537, 'vi'),
(4625, '13654', 'c6', 'vi', '36', '356', 'Bà Triệu', 0, 0, 1, 1415954537, 1415954537, 'vi'),
(4626, '13657', 'c6', 'vi', '36', '356', 'Trường Thi', 0, 0, 1, 1415954537, 1415954537, 'vi'),
(4627, '13660', 'c6', 'vi', '36', '356', 'Phan Đình Phùng', 0, 0, 1, 1415954537, 1415954537, 'vi'),
(4628, '13663', 'c6', 'vi', '36', '356', 'Ngô Quyền', 0, 0, 1, 1415954537, 1415954537, 'vi'),
(4629, '13666', 'c6', 'vi', '36', '356', 'Trần Hưng Đạo', 0, 0, 1, 1415954537, 1415954537, 'vi'),
(4630, '13669', 'c6', 'vi', '36', '356', 'Trần Đăng Ninh', 0, 0, 1, 1415954537, 1415954537, 'vi'),
(4631, '13672', 'c6', 'vi', '36', '356', 'Năng Tĩnh', 0, 0, 1, 1415954537, 1415954537, 'vi'),
(4632, '13675', 'c6', 'vi', '36', '356', 'Văn Miếu', 0, 0, 1, 1415954537, 1415954537, 'vi'),
(4633, '13678', 'c6', 'vi', '36', '356', 'Trần Quang Khải', 0, 0, 1, 1415954537, 1415954537, 'vi'),
(4634, '13681', 'c6', 'vi', '36', '356', 'Thống Nhất', 0, 0, 1, 1415954537, 1415954537, 'vi'),
(4635, '13684', 'c6', 'vi', '36', '356', 'Lộc Hạ', 0, 0, 1, 1415954537, 1415954537, 'vi'),
(4636, '13687', 'c6', 'vi', '36', '356', 'Lộc Vượng', 0, 0, 1, 1415954537, 1415954537, 'vi'),
(4637, '13690', 'c6', 'vi', '36', '356', 'Cửa Nam', 0, 0, 1, 1415954537, 1415954537, 'vi'),
(4638, '13693', 'c6', 'vi', '36', '356', 'Lộc Hoà', 0, 0, 1, 1415954537, 1415954537, 'vi'),
(4639, '13696', 'c6', 'vi', '36', '356', 'Nam Phong', 0, 0, 1, 1415954537, 1415954537, 'vi'),
(4640, '13699', 'c6', 'vi', '36', '356', 'Mỹ Xá', 0, 0, 1, 1415954537, 1415954537, 'vi'),
(4641, '13702', 'c6', 'vi', '36', '356', 'Lộc An', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4642, '13705', 'c6', 'vi', '36', '356', 'Nam Vân', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4643, '13708', 'c6', 'vi', '36', '358', 'Mỹ Lộc', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4644, '13711', 'c6', 'vi', '36', '358', 'Mỹ Hà', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4645, '13714', 'c6', 'vi', '36', '358', 'Mỹ Tiến', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4646, '13717', 'c6', 'vi', '36', '358', 'Mỹ Thắng', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4647, '13720', 'c6', 'vi', '36', '358', 'Mỹ Trung', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4648, '13723', 'c6', 'vi', '36', '358', 'Mỹ Tân', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4649, '13726', 'c6', 'vi', '36', '358', 'Mỹ Phúc', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4650, '13729', 'c6', 'vi', '36', '358', 'Mỹ Hưng', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4651, '13732', 'c6', 'vi', '36', '358', 'Mỹ Thuận', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4652, '13735', 'c6', 'vi', '36', '358', 'Mỹ Thịnh', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4653, '13738', 'c6', 'vi', '36', '358', 'Mỹ Thành', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4654, '13741', 'c6', 'vi', '36', '359', 'Gôi', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4655, '13744', 'c6', 'vi', '36', '359', 'Minh Thuận', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4656, '13747', 'c6', 'vi', '36', '359', 'Hiển Khánh', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4657, '13750', 'c6', 'vi', '36', '359', 'Tân Khánh', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4658, '13753', 'c6', 'vi', '36', '359', 'Hợp Hưng', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4659, '13756', 'c6', 'vi', '36', '359', 'Đại An', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4660, '13759', 'c6', 'vi', '36', '359', 'Tân Thành', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4661, '13762', 'c6', 'vi', '36', '359', 'Cộng Hòa', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4662, '13765', 'c6', 'vi', '36', '359', 'Trung Thành', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4663, '13768', 'c6', 'vi', '36', '359', 'Quang Trung', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4664, '13771', 'c6', 'vi', '36', '359', 'Minh Tân', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4665, '13774', 'c6', 'vi', '36', '359', 'Liên Bảo', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4666, '13777', 'c6', 'vi', '36', '359', 'Thành Lợi', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4667, '13780', 'c6', 'vi', '36', '359', 'Kim Thái', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4668, '13783', 'c6', 'vi', '36', '359', 'Liên Minh', 0, 0, 1, 1415954538, 1415954538, 'vi'),
(4669, '13786', 'c6', 'vi', '36', '359', 'Đại Thắng', 0, 0, 1, 1415954539, 1415954539, 'vi'),
(4670, '13789', 'c6', 'vi', '36', '359', 'Tam Thanh', 0, 0, 1, 1415954539, 1415954539, 'vi'),
(4671, '13792', 'c6', 'vi', '36', '359', 'Vĩnh Hào', 0, 0, 1, 1415954539, 1415954539, 'vi'),
(4672, '13795', 'c6', 'vi', '36', '360', 'Lâm', 0, 0, 1, 1415954539, 1415954539, 'vi'),
(4673, '13798', 'c6', 'vi', '36', '360', 'Yên Trung', 0, 0, 1, 1415954539, 1415954539, 'vi'),
(4674, '13801', 'c6', 'vi', '36', '360', 'Yên Thành', 0, 0, 1, 1415954539, 1415954539, 'vi'),
(4675, '13804', 'c6', 'vi', '36', '360', 'Yên Tân', 0, 0, 1, 1415954539, 1415954539, 'vi'),
(4676, '13807', 'c6', 'vi', '36', '360', 'Yên Lợi', 0, 0, 1, 1415954539, 1415954539, 'vi'),
(4677, '13810', 'c6', 'vi', '36', '360', 'Yên Thọ', 0, 0, 1, 1415954539, 1415954539, 'vi'),
(4678, '13813', 'c6', 'vi', '36', '360', 'Yên Nghĩa', 0, 0, 1, 1415954539, 1415954539, 'vi'),
(4679, '13816', 'c6', 'vi', '36', '360', 'Yên Minh', 0, 0, 1, 1415954539, 1415954539, 'vi'),
(4680, '13819', 'c6', 'vi', '36', '360', 'Yên Phương', 0, 0, 1, 1415954539, 1415954539, 'vi'),
(4681, '13822', 'c6', 'vi', '36', '360', 'Yên Chính', 0, 0, 1, 1415954539, 1415954539, 'vi'),
(4682, '13825', 'c6', 'vi', '36', '360', 'Yên Bình', 0, 0, 1, 1415954539, 1415954539, 'vi'),
(4683, '13828', 'c6', 'vi', '36', '360', 'Yên Phú', 0, 0, 1, 1415954539, 1415954539, 'vi'),
(4684, '13831', 'c6', 'vi', '36', '360', 'Yên Mỹ', 0, 0, 1, 1415954539, 1415954539, 'vi'),
(4685, '13834', 'c6', 'vi', '36', '360', 'Yên Dương', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4686, '13837', 'c6', 'vi', '36', '360', 'Yên Xá', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4687, '13840', 'c6', 'vi', '36', '360', 'Yên Hưng', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4688, '13843', 'c6', 'vi', '36', '360', 'Yên Khánh', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4689, '13846', 'c6', 'vi', '36', '360', 'Yên Phong', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4690, '13849', 'c6', 'vi', '36', '360', 'Yên Ninh', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4691, '13852', 'c6', 'vi', '36', '360', 'Yên Lương', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4692, '13855', 'c6', 'vi', '36', '360', 'Yên Hồng', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4693, '13858', 'c6', 'vi', '36', '360', 'Yên Quang', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4694, '13861', 'c6', 'vi', '36', '360', 'Yên Tiến', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4695, '13864', 'c6', 'vi', '36', '360', 'Yên Thắng', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4696, '13867', 'c6', 'vi', '36', '360', 'Yên Phúc', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4697, '13870', 'c6', 'vi', '36', '360', 'Yên Cường', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4698, '13873', 'c6', 'vi', '36', '360', 'Yên Lộc', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4699, '13876', 'c6', 'vi', '36', '360', 'Yên Bằng', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4700, '13879', 'c6', 'vi', '36', '360', 'Yên Đồng', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4701, '13882', 'c6', 'vi', '36', '360', 'Yên Khang', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4702, '13885', 'c6', 'vi', '36', '360', 'Yên Nhân', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4703, '13888', 'c6', 'vi', '36', '360', 'Yên Trị', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4704, '13891', 'c6', 'vi', '36', '361', 'Liễu Đề', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4705, '13894', 'c6', 'vi', '36', '361', 'Rạng Đông', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4706, '13897', 'c6', 'vi', '36', '361', 'Nghĩa Đồng', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4707, '13900', 'c6', 'vi', '36', '361', 'Nghĩa Thịnh', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4708, '13903', 'c6', 'vi', '36', '361', 'Nghĩa Minh', 0, 0, 1, 1415954540, 1415954540, 'vi'),
(4709, '13906', 'c6', 'vi', '36', '361', 'Nghĩa Thái', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4710, '13909', 'c6', 'vi', '36', '361', 'Hoàng Nam', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4711, '13912', 'c6', 'vi', '36', '361', 'Nghĩa Châu', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4712, '13915', 'c6', 'vi', '36', '361', 'Nghĩa Trung', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4713, '13918', 'c6', 'vi', '36', '361', 'Nghĩa Sơn', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4714, '13921', 'c6', 'vi', '36', '361', 'Nghĩa Lạc', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4715, '13924', 'c6', 'vi', '36', '361', 'Nghĩa Hồng', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4716, '13927', 'c6', 'vi', '36', '361', 'Nghĩa Phong', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4717, '13930', 'c6', 'vi', '36', '361', 'Nghĩa Phú', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4718, '13933', 'c6', 'vi', '36', '361', 'Nghĩa Bình', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4719, '13936', 'c6', 'vi', '36', '361', 'Quỹ Nhất', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4720, '13939', 'c6', 'vi', '36', '361', 'Nghĩa Tân', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4721, '13942', 'c6', 'vi', '36', '361', 'Nghĩa Hùng', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4722, '13945', 'c6', 'vi', '36', '361', 'Nghĩa Lâm', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4723, '13948', 'c6', 'vi', '36', '361', 'Nghĩa Thành', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4724, '13951', 'c6', 'vi', '36', '361', 'Nghĩa Thắng', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4725, '13954', 'c6', 'vi', '36', '361', 'Nghĩa Lợi', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4726, '13957', 'c6', 'vi', '36', '361', 'Nghĩa Hải', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4727, '13960', 'c6', 'vi', '36', '361', 'Nghĩa Phúc', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4728, '13963', 'c6', 'vi', '36', '361', 'Nam Điền', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4729, '13966', 'c6', 'vi', '36', '362', 'Nam Giang', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4730, '13969', 'c6', 'vi', '36', '362', 'Nam Mỹ', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4731, '13972', 'c6', 'vi', '36', '362', 'Điền Xá', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4732, '13975', 'c6', 'vi', '36', '362', 'Nghĩa An', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4733, '13978', 'c6', 'vi', '36', '362', 'Nam Thắng', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4734, '13981', 'c6', 'vi', '36', '362', 'Nam Toàn', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4735, '13984', 'c6', 'vi', '36', '362', 'Hồng Quang', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4736, '13987', 'c6', 'vi', '36', '362', 'Tân Thịnh', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4737, '13990', 'c6', 'vi', '36', '362', 'Nam Cường', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4738, '13993', 'c6', 'vi', '36', '362', 'Nam Hồng', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4739, '13996', 'c6', 'vi', '36', '362', 'Nam Hùng', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4740, '13999', 'c6', 'vi', '36', '362', 'Nam Hoa', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4741, '14002', 'c6', 'vi', '36', '362', 'Nam Dương', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4742, '14005', 'c6', 'vi', '36', '362', 'Nam Thanh', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4743, '14008', 'c6', 'vi', '36', '362', 'Nam Lợi', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4744, '14011', 'c6', 'vi', '36', '362', 'Bình Minh', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4745, '14014', 'c6', 'vi', '36', '362', 'Đồng Sơn', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4746, '14017', 'c6', 'vi', '36', '362', 'Nam Tiến', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4747, '14020', 'c6', 'vi', '36', '362', 'Nam Hải', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4748, '14023', 'c6', 'vi', '36', '362', 'Nam Thái', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4749, '14026', 'c6', 'vi', '36', '363', 'Cổ Lễ', 0, 0, 1, 1415954541, 1415954541, 'vi'),
(4750, '14029', 'c6', 'vi', '36', '363', 'Phương Định', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4751, '14032', 'c6', 'vi', '36', '363', 'Trực Chính', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4752, '14035', 'c6', 'vi', '36', '363', 'Trung Đông', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4753, '14038', 'c6', 'vi', '36', '363', 'Liêm Hải', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4754, '14041', 'c6', 'vi', '36', '363', 'Trực Tuấn', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4755, '14044', 'c6', 'vi', '36', '363', 'Việt Hùng', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4756, '14047', 'c6', 'vi', '36', '363', 'Trực Đạo', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4757, '14050', 'c6', 'vi', '36', '363', 'Trực Hưng', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4758, '14053', 'c6', 'vi', '36', '363', 'Trực Nội', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4759, '14056', 'c6', 'vi', '36', '363', 'Cát Thành', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4760, '14059', 'c6', 'vi', '36', '363', 'Trực Thanh', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4761, '14062', 'c6', 'vi', '36', '363', 'Trực Khang', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4762, '14065', 'c6', 'vi', '36', '363', 'Trực Thuận', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4763, '14068', 'c6', 'vi', '36', '363', 'Trực Mỹ', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4764, '14071', 'c6', 'vi', '36', '363', 'Trực Đại', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4765, '14074', 'c6', 'vi', '36', '363', 'Trực Cường', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4766, '14077', 'c6', 'vi', '36', '363', 'Trực Phú', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4767, '14080', 'c6', 'vi', '36', '363', 'Trực Thái', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4768, '14083', 'c6', 'vi', '36', '363', 'Trực Hùng', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4769, '14086', 'c6', 'vi', '36', '363', 'Trực Thắng', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4770, '14089', 'c6', 'vi', '36', '364', 'Xuân Trường', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4771, '14092', 'c6', 'vi', '36', '364', 'Xuân Châu', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4772, '14095', 'c6', 'vi', '36', '364', 'Xuân Hồng', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4773, '14098', 'c6', 'vi', '36', '364', 'Xuân Thành', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4774, '14101', 'c6', 'vi', '36', '364', 'Xuân Thượng', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4775, '14104', 'c6', 'vi', '36', '364', 'Xuân Phong', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4776, '14107', 'c6', 'vi', '36', '364', 'Xuân Đài', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4777, '14110', 'c6', 'vi', '36', '364', 'Xuân Tân', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4778, '14113', 'c6', 'vi', '36', '364', 'Xuân Thủy', 0, 0, 1, 1415954542, 1415954542, 'vi');
INSERT INTO `location_ward` (`id`, `code`, `area_code`, `country_code`, `province_code`, `district_code`, `title`, `is_extramural`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(4779, '14116', 'c6', 'vi', '36', '364', 'Xuân Ngọc', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4780, '14119', 'c6', 'vi', '36', '364', 'Xuân Bắc', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4781, '14122', 'c6', 'vi', '36', '364', 'Xuân Phương', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4782, '14125', 'c6', 'vi', '36', '364', 'Thọ Nghiệp', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4783, '14128', 'c6', 'vi', '36', '364', 'Xuân Phú', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4784, '14131', 'c6', 'vi', '36', '364', 'Xuân Trung', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4785, '14134', 'c6', 'vi', '36', '364', 'Xuân Vinh', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4786, '14137', 'c6', 'vi', '36', '364', 'Xuân Kiên', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4787, '14140', 'c6', 'vi', '36', '364', 'Xuân Tiến', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4788, '14143', 'c6', 'vi', '36', '364', 'Xuân Ninh', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4789, '14146', 'c6', 'vi', '36', '364', 'Xuân Hòa', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4790, '14149', 'c6', 'vi', '36', '365', 'Ngô Đồng', 0, 0, 1, 1415954542, 1415954542, 'vi'),
(4791, '14152', 'c6', 'vi', '36', '365', 'Quất Lâm', 0, 0, 1, 1415954543, 1415954543, 'vi'),
(4792, '14155', 'c6', 'vi', '36', '365', 'Giao Hương', 0, 0, 1, 1415954543, 1415954543, 'vi'),
(4793, '14158', 'c6', 'vi', '36', '365', 'Hồng Thuận', 0, 0, 1, 1415954543, 1415954543, 'vi'),
(4794, '14161', 'c6', 'vi', '36', '365', 'Giao Thiện', 0, 0, 1, 1415954543, 1415954543, 'vi'),
(4795, '14164', 'c6', 'vi', '36', '365', 'Giao Thanh', 0, 0, 1, 1415954543, 1415954543, 'vi'),
(4796, '14167', 'c6', 'vi', '36', '365', 'Hoành Sơn', 0, 0, 1, 1415954543, 1415954543, 'vi'),
(4797, '14170', 'c6', 'vi', '36', '365', 'Bình Hòa', 0, 0, 1, 1415954543, 1415954543, 'vi'),
(4798, '14173', 'c6', 'vi', '36', '365', 'Giao Tiến', 0, 0, 1, 1415954543, 1415954543, 'vi'),
(4799, '14176', 'c6', 'vi', '36', '365', 'Giao Hà', 0, 0, 1, 1415954543, 1415954543, 'vi'),
(4800, '14179', 'c6', 'vi', '36', '365', 'Giao Nhân', 0, 0, 1, 1415954543, 1415954543, 'vi'),
(4801, '14182', 'c6', 'vi', '36', '365', 'Giao An', 0, 0, 1, 1415954543, 1415954543, 'vi'),
(4802, '14185', 'c6', 'vi', '36', '365', 'Giao Lạc', 0, 0, 1, 1415954543, 1415954543, 'vi'),
(4803, '14188', 'c6', 'vi', '36', '365', 'Giao Châu', 0, 0, 1, 1415954543, 1415954543, 'vi'),
(4804, '14191', 'c6', 'vi', '36', '365', 'Giao Tân', 0, 0, 1, 1415954543, 1415954543, 'vi'),
(4805, '14194', 'c6', 'vi', '36', '365', 'Giao Yến', 0, 0, 1, 1415954543, 1415954543, 'vi'),
(4806, '14197', 'c6', 'vi', '36', '365', 'Giao Xuân', 0, 0, 1, 1415954543, 1415954543, 'vi'),
(4807, '14200', 'c6', 'vi', '36', '365', 'Giao Thịnh', 0, 0, 1, 1415954543, 1415954543, 'vi'),
(4808, '14203', 'c6', 'vi', '36', '365', 'Giao Hải', 0, 0, 1, 1415954543, 1415954543, 'vi'),
(4809, '14206', 'c6', 'vi', '36', '365', 'Bạch Long', 0, 0, 1, 1415954543, 1415954543, 'vi'),
(4810, '14209', 'c6', 'vi', '36', '365', 'Giao Long', 0, 0, 1, 1415954543, 1415954543, 'vi'),
(4811, '14212', 'c6', 'vi', '36', '365', 'Giao Phong', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4812, '14215', 'c6', 'vi', '36', '366', 'Yên Định', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4813, '14218', 'c6', 'vi', '36', '366', 'Cồn', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4814, '14221', 'c6', 'vi', '36', '366', 'Thịnh Long', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4815, '14224', 'c6', 'vi', '36', '366', 'Hải Nam', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4816, '14227', 'c6', 'vi', '36', '366', 'Hải Trung', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4817, '14230', 'c6', 'vi', '36', '366', 'Hải Vân', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4818, '14233', 'c6', 'vi', '36', '366', 'Hải Minh', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4819, '14236', 'c6', 'vi', '36', '366', 'Hải Anh', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4820, '14239', 'c6', 'vi', '36', '366', 'Hải Hưng', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4821, '14242', 'c6', 'vi', '36', '366', 'Hải Bắc', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4822, '14245', 'c6', 'vi', '36', '366', 'Hải Phúc', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4823, '14248', 'c6', 'vi', '36', '366', 'Hải Thanh', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4824, '14251', 'c6', 'vi', '36', '366', 'Hải Hà', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4825, '14254', 'c6', 'vi', '36', '366', 'Hải Long', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4826, '14257', 'c6', 'vi', '36', '366', 'Hải Phương', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4827, '14260', 'c6', 'vi', '36', '366', 'Hải Đường', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4828, '14263', 'c6', 'vi', '36', '366', 'Hải Lộc', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4829, '14266', 'c6', 'vi', '36', '366', 'Hải Quang', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4830, '14269', 'c6', 'vi', '36', '366', 'Hải Đông', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4831, '14272', 'c6', 'vi', '36', '366', 'Hải Sơn', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4832, '14275', 'c6', 'vi', '36', '366', 'Hải Tân', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4833, '14278', 'c6', 'vi', '36', '366', 'Hải Toàn', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4834, '14281', 'c6', 'vi', '36', '366', 'Hải Phong', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4835, '14284', 'c6', 'vi', '36', '366', 'Hải An', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4836, '14287', 'c6', 'vi', '36', '366', 'Hải Tây', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4837, '14290', 'c6', 'vi', '36', '366', 'Hải Lý', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4838, '14293', 'c6', 'vi', '36', '366', 'Hải Phú', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4839, '14296', 'c6', 'vi', '36', '366', 'Hải Giang', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4840, '14299', 'c6', 'vi', '36', '366', 'Hải Cường', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4841, '14302', 'c6', 'vi', '36', '366', 'Hải Ninh', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4842, '14305', 'c6', 'vi', '36', '366', 'Hải Chính', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4843, '14308', 'c6', 'vi', '36', '366', 'Hải Xuân', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4844, '14311', 'c6', 'vi', '36', '366', 'Hải Châu', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4845, '14314', 'c6', 'vi', '36', '366', 'Hải Triều', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4846, '14317', 'c6', 'vi', '36', '366', 'Hải Hòa', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4847, '14320', 'c6', 'vi', '37', '369', 'Đông Thành', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4848, '14323', 'c6', 'vi', '37', '369', 'Tân Thành', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4849, '14326', 'c6', 'vi', '37', '369', 'Thanh Bình', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4850, '14329', 'c6', 'vi', '37', '369', 'Vân Giang', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4851, '14332', 'c6', 'vi', '37', '369', 'Bích Đào', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4852, '14335', 'c6', 'vi', '37', '369', 'Phúc Thành', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4853, '14338', 'c6', 'vi', '37', '369', 'Nam Bình', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4854, '14341', 'c6', 'vi', '37', '369', 'Nam Thành', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4855, '14344', 'c6', 'vi', '37', '369', 'Ninh Khánh', 0, 0, 1, 1415954544, 1415954544, 'vi'),
(4856, '14347', 'c6', 'vi', '37', '369', 'Ninh Nhất', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4857, '14350', 'c6', 'vi', '37', '369', 'Ninh Tiến', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4858, '14353', 'c6', 'vi', '37', '369', 'Ninh Phúc', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4859, '14356', 'c6', 'vi', '37', '369', 'Ninh Sơn', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4860, '14359', 'c6', 'vi', '37', '369', 'Ninh Phong', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4861, '14362', 'c6', 'vi', '37', '370', 'Bắc Sơn', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4862, '14365', 'c6', 'vi', '37', '370', 'Trung Sơn', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4863, '14368', 'c6', 'vi', '37', '370', 'Nam Sơn', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4864, '14369', 'c6', 'vi', '37', '370', 'Tây Sơn', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4865, '14371', 'c6', 'vi', '37', '370', 'Yên Sơn', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4866, '14374', 'c6', 'vi', '37', '370', 'Yên Bình', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4867, '14375', 'c6', 'vi', '37', '370', 'Tân Bình', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4868, '14377', 'c6', 'vi', '37', '370', 'Quang Sơn', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4869, '14380', 'c6', 'vi', '37', '370', 'Đông Sơn', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4870, '14383', 'c6', 'vi', '37', '372', 'Nho Quan', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4871, '14386', 'c6', 'vi', '37', '372', 'Xích Thổ', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4872, '14389', 'c6', 'vi', '37', '372', 'Gia Lâm', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4873, '14392', 'c6', 'vi', '37', '372', 'Gia Sơn', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4874, '14395', 'c6', 'vi', '37', '372', 'Thạch Bình', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4875, '14398', 'c6', 'vi', '37', '372', 'Gia Thủy', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4876, '14401', 'c6', 'vi', '37', '372', 'Gia Tường', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4877, '14404', 'c6', 'vi', '37', '372', 'Cúc Phương', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4878, '14407', 'c6', 'vi', '37', '372', 'Phú Sơn', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4879, '14410', 'c6', 'vi', '37', '372', 'Đức Long', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4880, '14413', 'c6', 'vi', '37', '372', 'Lạc Vân', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4881, '14416', 'c6', 'vi', '37', '372', 'Đồng Phong', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4882, '14419', 'c6', 'vi', '37', '372', 'Yên Quang', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4883, '14422', 'c6', 'vi', '37', '372', 'Lạng Phong', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4884, '14425', 'c6', 'vi', '37', '372', 'Thượng Hòa', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4885, '14428', 'c6', 'vi', '37', '372', 'Văn Phong', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4886, '14431', 'c6', 'vi', '37', '372', 'Văn Phương', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4887, '14434', 'c6', 'vi', '37', '372', 'Thanh Lạc', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4888, '14437', 'c6', 'vi', '37', '372', 'Sơn Lai', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4889, '14440', 'c6', 'vi', '37', '372', 'Sơn Thành', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4890, '14443', 'c6', 'vi', '37', '372', 'Văn Phú', 0, 0, 1, 1415954545, 1415954545, 'vi'),
(4891, '14446', 'c6', 'vi', '37', '372', 'Phú Lộc', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4892, '14449', 'c6', 'vi', '37', '372', 'Kỳ Phú', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4893, '14452', 'c6', 'vi', '37', '372', 'Quỳnh Lưu', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4894, '14455', 'c6', 'vi', '37', '372', 'Sơn Hà', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4895, '14458', 'c6', 'vi', '37', '372', 'Phú Long', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4896, '14461', 'c6', 'vi', '37', '372', 'Quảng Lạc', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4897, '14464', 'c6', 'vi', '37', '373', 'Me', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4898, '14467', 'c6', 'vi', '37', '373', 'Gia Hòa', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4899, '14470', 'c6', 'vi', '37', '373', 'Gia Hưng', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4900, '14473', 'c6', 'vi', '37', '373', 'Liên Sơn', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4901, '14476', 'c6', 'vi', '37', '373', 'Gia Thanh', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4902, '14479', 'c6', 'vi', '37', '373', 'Gia Vân', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4903, '14482', 'c6', 'vi', '37', '373', 'Gia Phú', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4904, '14485', 'c6', 'vi', '37', '373', 'Gia Xuân', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4905, '14488', 'c6', 'vi', '37', '373', 'Gia Lập', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4906, '14491', 'c6', 'vi', '37', '373', 'Gia Vượng', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4907, '14494', 'c6', 'vi', '37', '373', 'Gia Trấn', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4908, '14497', 'c6', 'vi', '37', '373', 'Gia Thịnh', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4909, '14500', 'c6', 'vi', '37', '373', 'Gia Phương', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4910, '14503', 'c6', 'vi', '37', '373', 'Gia Tân', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4911, '14506', 'c6', 'vi', '37', '373', 'Gia Thắng', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4912, '14509', 'c6', 'vi', '37', '373', 'Gia Trung', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4913, '14512', 'c6', 'vi', '37', '373', 'Gia Minh', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4914, '14515', 'c6', 'vi', '37', '373', 'Gia Lạc', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4915, '14518', 'c6', 'vi', '37', '373', 'Gia Tiến', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4916, '14521', 'c6', 'vi', '37', '373', 'Gia Sinh', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4917, '14524', 'c6', 'vi', '37', '373', 'Gia Phong', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4918, '14527', 'c6', 'vi', '37', '374', 'Thiên Tôn', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4919, '14530', 'c6', 'vi', '37', '374', 'Ninh Giang', 0, 0, 1, 1415954546, 1415954546, 'vi'),
(4920, '14533', 'c6', 'vi', '37', '374', 'Trường Yên', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4921, '14536', 'c6', 'vi', '37', '374', 'Ninh Khang', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4922, '14539', 'c6', 'vi', '37', '374', 'Ninh Mỹ', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4923, '14542', 'c6', 'vi', '37', '374', 'Ninh Hòa', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4924, '14545', 'c6', 'vi', '37', '374', 'Ninh Xuân', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4925, '14548', 'c6', 'vi', '37', '374', 'Ninh Hải', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4926, '14551', 'c6', 'vi', '37', '374', 'Ninh Thắng', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4927, '14554', 'c6', 'vi', '37', '374', 'Ninh Vân', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4928, '14557', 'c6', 'vi', '37', '374', 'Ninh An', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4929, '14560', 'c6', 'vi', '37', '375', 'Yên Ninh', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4930, '14563', 'c6', 'vi', '37', '375', 'Khánh Tiên', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4931, '14566', 'c6', 'vi', '37', '375', 'Khánh Phú', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4932, '14569', 'c6', 'vi', '37', '375', 'Khánh Hòa', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4933, '14572', 'c6', 'vi', '37', '375', 'Khánh Lợi', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4934, '14575', 'c6', 'vi', '37', '375', 'Khánh An', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4935, '14578', 'c6', 'vi', '37', '375', 'Khánh Cường', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4936, '14581', 'c6', 'vi', '37', '375', 'Khánh Cư', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4937, '14584', 'c6', 'vi', '37', '375', 'Khánh Thiện', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4938, '14587', 'c6', 'vi', '37', '375', 'Khánh Hải', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4939, '14590', 'c6', 'vi', '37', '375', 'Khánh Trung', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4940, '14593', 'c6', 'vi', '37', '375', 'Khánh Mậu', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4941, '14596', 'c6', 'vi', '37', '375', 'Khánh Vân', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4942, '14599', 'c6', 'vi', '37', '375', 'Khánh Hội', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4943, '14602', 'c6', 'vi', '37', '375', 'Khánh Công', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4944, '14608', 'c6', 'vi', '37', '375', 'Khánh Thành', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4945, '14611', 'c6', 'vi', '37', '375', 'Khánh Nhạc', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4946, '14614', 'c6', 'vi', '37', '375', 'Khánh Thủy', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4947, '14617', 'c6', 'vi', '37', '375', 'Khánh Hồng', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4948, '14620', 'c6', 'vi', '37', '376', 'Phát Diệm', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4949, '14623', 'c6', 'vi', '37', '376', 'Bình Minh', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4950, '14626', 'c6', 'vi', '37', '376', 'Xuân Thiện', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4951, '14629', 'c6', 'vi', '37', '376', 'Hồi Ninh', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4952, '14632', 'c6', 'vi', '37', '376', 'Chính Tâm', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4953, '14635', 'c6', 'vi', '37', '376', 'Kim Định', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4954, '14638', 'c6', 'vi', '37', '376', 'Ân Hòa', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4955, '14641', 'c6', 'vi', '37', '376', 'Hùng Tiến', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4956, '14644', 'c6', 'vi', '37', '376', 'Yên Mật', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4957, '14647', 'c6', 'vi', '37', '376', 'Quang Thiện', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4958, '14650', 'c6', 'vi', '37', '376', 'Như Hòa', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4959, '14653', 'c6', 'vi', '37', '376', 'Chất Bình', 0, 0, 1, 1415954547, 1415954547, 'vi'),
(4960, '14656', 'c6', 'vi', '37', '376', 'Đồng Hướng', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4961, '14659', 'c6', 'vi', '37', '376', 'Kim Chính', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4962, '14662', 'c6', 'vi', '37', '376', 'Thượng Kiệm', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4963, '14665', 'c6', 'vi', '37', '376', 'Lưu Phương', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4964, '14668', 'c6', 'vi', '37', '376', 'Tân Thành', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4965, '14671', 'c6', 'vi', '37', '376', 'Yên Lộc', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4966, '14674', 'c6', 'vi', '37', '376', 'Lai Thành', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4967, '14677', 'c6', 'vi', '37', '376', 'Định Hóa', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4968, '14680', 'c6', 'vi', '37', '376', 'Văn Hải', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4969, '14683', 'c6', 'vi', '37', '376', 'Kim Tân', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4970, '14686', 'c6', 'vi', '37', '376', 'Kim Mỹ', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4971, '14689', 'c6', 'vi', '37', '376', 'Cồn Thoi', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4972, '14692', 'c6', 'vi', '37', '376', 'Kim Hải', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4973, '14695', 'c6', 'vi', '37', '376', 'Kim Trung', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4974, '14698', 'c6', 'vi', '37', '376', 'Kim Đông', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4975, '14701', 'c6', 'vi', '37', '377', 'Yên Thịnh', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4976, '14704', 'c6', 'vi', '37', '377', 'Khánh Thượng', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4977, '14707', 'c6', 'vi', '37', '377', 'Khánh Dương', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4978, '14710', 'c6', 'vi', '37', '377', 'Mai Sơn', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4979, '14713', 'c6', 'vi', '37', '377', 'Khánh Thịnh', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4980, '14716', 'c6', 'vi', '37', '377', 'Yên Phú', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4981, '14719', 'c6', 'vi', '37', '377', 'Yên Phong', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4982, '14722', 'c6', 'vi', '37', '377', 'Yên Hòa', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4983, '14725', 'c6', 'vi', '37', '377', 'Yên Thắng', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4984, '14728', 'c6', 'vi', '37', '377', 'Yên Từ', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4985, '14731', 'c6', 'vi', '37', '377', 'Yên Hưng', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4986, '14734', 'c6', 'vi', '37', '377', 'Yên Thành', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4987, '14737', 'c6', 'vi', '37', '377', 'Yên Nhân', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4988, '14740', 'c6', 'vi', '37', '377', 'Yên Mỹ', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4989, '14743', 'c6', 'vi', '37', '377', 'Yên Mạc', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4990, '14746', 'c6', 'vi', '37', '377', 'Yên Đồng', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4991, '14749', 'c6', 'vi', '37', '377', 'Yên Thái', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4992, '14752', 'c6', 'vi', '37', '377', 'Yên Lâm', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4993, '14755', 'c6', 'vi', '38', '380', 'Hàm Rồng', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4994, '14758', 'c6', 'vi', '38', '380', 'Đông Thọ', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4995, '14761', 'c6', 'vi', '38', '380', 'Nam Ngạn', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4996, '14764', 'c6', 'vi', '38', '380', 'Trường Thi', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4997, '14767', 'c6', 'vi', '38', '380', 'Điện Biên', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4998, '14770', 'c6', 'vi', '38', '380', 'Phú Sơn', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(4999, '14773', 'c6', 'vi', '38', '380', 'Lam Sơn', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(5000, '14776', 'c6', 'vi', '38', '380', 'Ba Đình', 0, 0, 1, 1415954548, 1415954548, 'vi'),
(5001, '14779', 'c6', 'vi', '38', '380', 'Ngọc Trạo', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5002, '14782', 'c6', 'vi', '38', '380', 'Đông Vệ', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5003, '14785', 'c6', 'vi', '38', '380', 'Đông Sơn', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5004, '14788', 'c6', 'vi', '38', '380', 'Tân Sơn', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5005, '14791', 'c6', 'vi', '38', '380', 'Đông Cương', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5006, '14794', 'c6', 'vi', '38', '380', 'Đông Hương', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5007, '14797', 'c6', 'vi', '38', '380', 'Đông Hải', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5008, '14800', 'c6', 'vi', '38', '380', 'Quảng Hưng', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5009, '14803', 'c6', 'vi', '38', '380', 'Quảng Thắng', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5010, '14806', 'c6', 'vi', '38', '380', 'Quảng Thành', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5011, '14809', 'c6', 'vi', '38', '381', 'Bắc Sơn', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5012, '14812', 'c6', 'vi', '38', '381', 'Ba Đình', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5013, '14815', 'c6', 'vi', '38', '381', 'Lam Sơn', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5014, '14818', 'c6', 'vi', '38', '381', 'Ngọc Trạo', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5015, '14821', 'c6', 'vi', '38', '381', 'Đông Sơn', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5016, '14823', 'c6', 'vi', '38', '381', 'Phú Sơn', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5017, '14824', 'c6', 'vi', '38', '381', 'Quang Trung', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5018, '14827', 'c6', 'vi', '38', '381', 'Hà Lan', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5019, '14830', 'c6', 'vi', '38', '382', 'Trung Sơn', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5020, '14833', 'c6', 'vi', '38', '382', 'Bắc Sơn', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5021, '14836', 'c6', 'vi', '38', '382', 'Trường Sơn', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5022, '14839', 'c6', 'vi', '38', '382', 'Quảng Cư', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5023, '14842', 'c6', 'vi', '38', '382', 'Quảng Tiến', 0, 0, 1, 1415954562, 1415954562, 'vi'),
(5024, '14845', 'c6', 'vi', '38', '384', 'Mường Lát', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5025, '14848', 'c6', 'vi', '38', '384', 'Tam Chung', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5026, '14851', 'c6', 'vi', '38', '384', 'Tén Tằn', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5027, '14854', 'c6', 'vi', '38', '384', 'Mường Lý', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5028, '14857', 'c6', 'vi', '38', '384', 'Trung Lý', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5029, '14860', 'c6', 'vi', '38', '384', 'Quang Chiểu', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5030, '14863', 'c6', 'vi', '38', '384', 'Pù Nhi', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5031, '14864', 'c6', 'vi', '38', '384', 'Nhi Sơn', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5032, '14866', 'c6', 'vi', '38', '384', 'Mường Chanh', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5033, '14869', 'c6', 'vi', '38', '385', 'Quan Hóa', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5034, '14872', 'c6', 'vi', '38', '385', 'Thành Sơn', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5035, '14875', 'c6', 'vi', '38', '385', 'Trung Sơn', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5036, '14878', 'c6', 'vi', '38', '385', 'Phú Thanh', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5037, '14881', 'c6', 'vi', '38', '385', 'Trung Thành', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5038, '14884', 'c6', 'vi', '38', '385', 'Phú Lệ', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5039, '14887', 'c6', 'vi', '38', '385', 'Phú Sơn', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5040, '14890', 'c6', 'vi', '38', '385', 'Phú Xuân', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5041, '14893', 'c6', 'vi', '38', '385', 'Thanh Xuân', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5042, '14896', 'c6', 'vi', '38', '385', 'Hiền Chung', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5043, '14899', 'c6', 'vi', '38', '385', 'Hiền Kiệt', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5044, '14902', 'c6', 'vi', '38', '385', 'Nam Tiến', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5045, '14905', 'c6', 'vi', '38', '385', 'Hồi Xuân', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5046, '14908', 'c6', 'vi', '38', '385', 'Thiên Phủ', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5047, '14911', 'c6', 'vi', '38', '385', 'Phú Nghiêm', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5048, '14914', 'c6', 'vi', '38', '385', 'Nam Xuân', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5049, '14917', 'c6', 'vi', '38', '385', 'Nam Động', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5050, '14920', 'c6', 'vi', '38', '385', 'Xuân Phú', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5051, '14923', 'c6', 'vi', '38', '386', 'Cành Nàng', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5052, '14926', 'c6', 'vi', '38', '386', 'Điền Thượng', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5053, '14929', 'c6', 'vi', '38', '386', 'Điền Hạ', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5054, '14932', 'c6', 'vi', '38', '386', 'Điền Quang', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5055, '14935', 'c6', 'vi', '38', '386', 'Điền Trung', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5056, '14938', 'c6', 'vi', '38', '386', 'Thành Sơn', 0, 0, 1, 1415954563, 1415954563, 'vi'),
(5057, '14941', 'c6', 'vi', '38', '386', 'Lương Ngoại', 0, 0, 1, 1415954564, 1415954564, 'vi'),
(5058, '14944', 'c6', 'vi', '38', '386', 'Ái Thượng', 0, 0, 1, 1415954564, 1415954564, 'vi'),
(5059, '14947', 'c6', 'vi', '38', '386', 'Lương Nội', 0, 0, 1, 1415954564, 1415954564, 'vi'),
(5060, '14950', 'c6', 'vi', '38', '386', 'Điền Lư', 0, 0, 1, 1415954564, 1415954564, 'vi'),
(5061, '14953', 'c6', 'vi', '38', '386', 'Lương Trung', 0, 0, 1, 1415954564, 1415954564, 'vi'),
(5062, '14956', 'c6', 'vi', '38', '386', 'Lũng Niêm', 0, 0, 1, 1415954564, 1415954564, 'vi'),
(5063, '14959', 'c6', 'vi', '38', '386', 'Lũng Cao', 0, 0, 1, 1415954564, 1415954564, 'vi'),
(5064, '14962', 'c6', 'vi', '38', '386', 'Hạ Trung', 0, 0, 1, 1415954564, 1415954564, 'vi'),
(5065, '14965', 'c6', 'vi', '38', '386', 'Cổ Lũng', 0, 0, 1, 1415954564, 1415954564, 'vi'),
(5066, '14968', 'c6', 'vi', '38', '386', 'Thành Lâm', 0, 0, 1, 1415954564, 1415954564, 'vi'),
(5067, '14971', 'c6', 'vi', '38', '386', 'Ban Công', 0, 0, 1, 1415954564, 1415954564, 'vi'),
(5068, '14974', 'c6', 'vi', '38', '386', 'Kỳ Tân', 0, 0, 1, 1415954564, 1415954564, 'vi'),
(5069, '14977', 'c6', 'vi', '38', '386', 'Văn Nho', 0, 0, 1, 1415954564, 1415954564, 'vi'),
(5070, '14980', 'c6', 'vi', '38', '386', 'Thiết Ống', 0, 0, 1, 1415954564, 1415954564, 'vi'),
(5071, '14983', 'c6', 'vi', '38', '386', 'Lâm Sa', 0, 0, 1, 1415954564, 1415954564, 'vi'),
(5072, '14986', 'c6', 'vi', '38', '386', 'Thiết Kế', 0, 0, 1, 1415954564, 1415954564, 'vi'),
(5073, '14989', 'c6', 'vi', '38', '386', 'Tân Lập', 0, 0, 1, 1415954564, 1415954564, 'vi'),
(5074, '14992', 'c6', 'vi', '38', '387', 'Quan Sơn', 0, 0, 1, 1415954564, 1415954564, 'vi');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
`id` int(10) unsigned NOT NULL,
  `menu_id` int(11) NOT NULL,
  `group_id` varchar(20) NOT NULL DEFAULT 'menu_header',
  `menu_nav` varchar(250) NOT NULL,
  `menu_level` tinyint(2) NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `name_action` varchar(50) NOT NULL,
  `target` varchar(20) NOT NULL DEFAULT '_self',
  `title` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `link_type` varchar(20) NOT NULL DEFAULT 'site',
  `link` varchar(250) NOT NULL,
  `auto_sub` varchar(20) NOT NULL,
  `lock_title` tinyint(4) NOT NULL,
  `show_mod` text NOT NULL,
  `show_act` text NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `date_create` int(10) unsigned NOT NULL,
  `date_update` int(10) unsigned NOT NULL,
  `lang` varchar(5) NOT NULL DEFAULT 'vi'
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `menu_id`, `group_id`, `menu_nav`, `menu_level`, `parent_id`, `name_action`, `target`, `title`, `short`, `link_type`, `link`, `auto_sub`, `lock_title`, `show_mod`, `show_act`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, 'menu_header', '1', 1, 0, 'home', '_self', 'Trang chủ', '', 'site', 'trang-chu', '', 0, '', '', 0, 0, 1421140615, 1421140615, 'vi'),
(2, 1, 'menu_header', '1', 1, 0, 'home', '_self', 'Trang chủ', '', 'site', 'trang-chu', '', 0, '', '', 0, 0, 1421140615, 1421140615, 'en'),
(5, 5, 'menu_header', '5', 1, 0, 'service-group-1', '_self', 'Thiết kế website', '', 'site', 'thiet-ke-website', 'item', 0, '', '', 0, 1, 1421141492, 1421378535, 'vi'),
(6, 5, 'menu_header', '5', 1, 0, 'service-group-1', '_self', 'Thiết kế website', '', 'site', 'thiet-ke-website-1', 'item', 0, '', '', 0, 1, 1421141492, 1421378535, 'en'),
(7, 7, 'menu_header', '7', 1, 0, 'service-group-2', '_self', 'Phần mềm', '', 'site', 'phan-mem', 'group', 0, '', '', 0, 1, 1421141590, 1421141590, 'vi'),
(8, 7, 'menu_header', '7', 1, 0, 'service-group-2', '_self', 'Phần mềm', '', 'site', 'phan-mem-1', 'group', 0, '', '', 0, 1, 1421141590, 1421141590, 'en'),
(9, 9, 'menu_header', '9', 1, 0, 'service-group-3', '_self', 'Tên miền', '', 'site', 'ten-mien', 'group', 0, '', '', 0, 1, 1421141596, 1421141596, 'vi'),
(10, 9, 'menu_header', '9', 1, 0, 'service-group-3', '_self', 'Tên miền', '', 'site', 'ten-mien-1', 'group', 0, '', '', 0, 1, 1421141596, 1421141596, 'en'),
(11, 11, 'menu_header', '11', 1, 0, 'service-group-4', '_self', 'Hosting', '', 'site', 'hosting', 'group', 0, '', '', 0, 1, 1421141603, 1421141603, 'vi'),
(12, 11, 'menu_header', '11', 1, 0, 'service-group-4', '_self', 'Hosting', '', 'site', 'hosting-1', 'group', 0, '', '', 0, 1, 1421141603, 1421141603, 'en'),
(13, 13, 'menu_header', '5,13', 2, 5, '1421656049', '_self', 'Thiết kế website', '', 'site', 'thiet-ke-website', '', 0, '', '', 0, 0, 1421642515, 1421656049, 'vi'),
(14, 13, 'menu_header', '5,13', 2, 5, '1421656049', '_self', 'Thiết kế website', '', 'site', 'thiet-ke-website-1', '', 0, '', '', 0, 0, 1421642515, 1421656049, 'en'),
(15, 15, 'menu_header', '15', 1, 0, 'service-group-2', '_self', 'Phần mềm', '', 'site', 'phan-mem', '', 0, '', '', 0, 0, 1421642568, 1421642568, 'vi'),
(16, 15, 'menu_header', '15', 1, 0, 'service-group-2', '_self', 'Phần mềm', '', 'site', 'phan-mem-1', '', 0, '', '', 0, 0, 1421642568, 1421642568, 'en'),
(17, 17, 'menu_footer', '17', 1, 0, 'service-group-4', '_self', 'Hosting', '', 'site', 'hosting', 'item', 0, '', '', 0, 1, 1421642682, 1421642682, 'vi'),
(18, 17, 'menu_footer', '17', 1, 0, 'service-group-4', '_self', 'Hosting', '', 'site', 'hosting-1', 'item', 0, '', '', 0, 1, 1421642682, 1421642682, 'en'),
(19, 19, 'menu_footer', '19', 1, 0, 'service-group-1', '_self', 'Thiết kế website', '', 'site', 'thiet-ke-website', 'item', 0, '', '', 0, 1, 1421642704, 1421642704, 'vi'),
(20, 19, 'menu_footer', '19', 1, 0, 'service-group-1', '_self', 'Thiết kế website', '', 'site', 'thiet-ke-website-1', 'item', 0, '', '', 0, 1, 1421642704, 1421642704, 'en'),
(21, 21, 'menu_footer', '21', 1, 0, 'service-group-2', '_self', 'Phần mềm', '', 'site', 'phan-mem', 'item', 0, '', '', 0, 1, 1421642723, 1421642723, 'vi'),
(22, 21, 'menu_footer', '21', 1, 0, 'service-group-2', '_self', 'Phần mềm', '', 'site', 'phan-mem-1', 'item', 0, '', '', 0, 1, 1421642723, 1421642723, 'en'),
(23, 23, 'menu_footer', '19,23', 2, 19, '1421659022', '_self', 'test', '', 'site', '', '', 0, '', '', 0, 0, 1421659022, 1421659022, 'vi'),
(24, 23, 'menu_footer', '19,23', 2, 19, '1421659022', '_self', 'test', '', 'site', '', '', 0, '', '', 0, 0, 1421659022, 1421659022, 'en'),
(25, 25, 'menu_top', '25', 1, 0, 'home', '_self', 'Trang chủ', '', 'site', '', '', 0, '', '', 0, 1, 1421659174, 1421659174, 'vi'),
(26, 25, 'menu_top', '25', 1, 0, 'home', '_self', 'Trang chủ', '', 'site', '', '', 0, '', '', 0, 1, 1421659174, 1421659174, 'en'),
(27, 27, 'menu_top', '27', 1, 0, 'about-item-1', '_self', 'Giới thiệu', '', 'site', 'gioi-thieu.html', '', 0, '', '', 0, 1, 1421659530, 1421659530, 'vi'),
(28, 27, 'menu_top', '27', 1, 0, 'about-item-1', '_self', 'Giới thiệu', '', 'site', 'gioi-thieu-1.html', '', 0, '', '', 0, 1, 1421659530, 1421659530, 'en'),
(29, 29, 'menu_header', '29', 1, 0, 'project', '_self', 'Dự án', '', 'site', 'du-an', '', 0, '', '', 0, 1, 1421662452, 1421662452, 'vi'),
(30, 29, 'menu_header', '29', 1, 0, 'project', '_self', 'Dự án', '', 'site', 'du-an', '', 0, '', '', 0, 1, 1421662452, 1421662452, 'en'),
(31, 31, 'menu_header', '5,31', 2, 5, 'product-brand-1', '_self', 'Shipment', '', 'site', 'shipment', '', 0, '', '', 0, 1, 1425368085, 1425368085, 'vi'),
(32, 31, 'menu_header', '5,31', 2, 5, 'product-brand-1', '_self', 'Shipment', '', 'site', 'shipment-1', '', 0, '', '', 0, 1, 1425368085, 1425368085, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
`mod_id` int(10) unsigned NOT NULL,
  `name_action` varchar(50) NOT NULL,
  `arr_title` text NOT NULL,
  `arr_friendly_link` text NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`mod_id`, `name_action`, `arr_title`, `arr_friendly_link`, `show_order`, `is_show`) VALUES
(1, 'home', 'a:2:{s:2:"vi";s:11:"Trang chủ";s:2:"en";s:4:"Home";}', 'a:2:{s:2:"vi";s:9:"trang-chu";s:2:"en";s:4:"home";}', 0, 1),
(2, 'about', 'a:2:{s:2:"vi";s:14:"Giới thiệu";s:2:"en";s:5:"about";}', 'a:2:{s:2:"vi";s:10:"gioi-thieu";s:2:"en";s:7:"aboutus";}', 0, 1),
(3, 'page', 'a:2:{s:2:"vi";s:11:"Trang tĩnh";s:2:"en";s:5:"Pages";}', 'a:2:{s:2:"vi";s:5:"trang";s:2:"en";s:4:"page";}', 0, 1),
(4, 'contact', 'a:2:{s:2:"vi";s:10:"Liên hệ";s:2:"en";s:7:"Contact";}', 'a:2:{s:2:"vi";s:7:"lien-he";s:2:"en";s:7:"contact";}', 0, 1),
(7, 'search', 'a:2:{s:2:"vi";s:11:"Tìm kiếm";s:2:"en";s:6:"Search";}', 'a:2:{s:2:"vi";s:8:"tim-kiem";s:2:"en";s:6:"search";}', 0, 1),
(9, 'service', 'a:2:{s:2:"vi";s:7:"Service";s:2:"en";s:7:"Service";}', 'a:2:{s:2:"vi";s:7:"dich-vu";s:2:"en";s:7:"service";}', 0, 1),
(10, 'project', 'a:2:{s:2:"vi";s:8:"Dự án";s:2:"en";s:7:"Project";}', 'a:2:{s:2:"vi";s:5:"du-an";s:2:"en";s:7:"project";}', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
`id` int(10) unsigned NOT NULL,
  `item_id` int(11) NOT NULL,
  `group_nav` varchar(250) NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `group_related` text NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `is_focus` tinyint(1) DEFAULT '0',
  `is_focus_group` int(11) NOT NULL DEFAULT '0',
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `item_id`, `group_nav`, `group_id`, `group_related`, `picture`, `title`, `short`, `content`, `friendly_link`, `meta_title`, `meta_key`, `meta_desc`, `is_focus`, `is_focus_group`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, '1', 1, '1', 'news/2015_03/blue_glow_green_background_04_vector_158357.jpg', 'Công Ty TNHH Sống Vui', '&lt;p&gt;sadadas&lt;/p&gt;', '&lt;p&gt;asdasdas&lt;/p&gt;', 'cong-ty-tnhh-song-vui', 'Công Ty TNHH Sống Vui | Cong Ty TNHH Song Vui', 'Công Ty TNHH Sống Vui, Cong Ty TNHH Song Vui', 'asdasdas', 0, 0, 0, 1, 1425358483, 1425358483, 'vi'),
(2, 1, '1', 1, '1', 'news/2015_03/blue_glow_green_background_04_vector_158357.jpg', 'Công Ty TNHH Sống Vui', '&lt;p&gt;sadadas&lt;/p&gt;', '&lt;p&gt;asdasdas&lt;/p&gt;', 'cong-ty-tnhh-song-vui-1', 'Công Ty TNHH Sống Vui | Cong Ty TNHH Song Vui', 'Công Ty TNHH Sống Vui, Cong Ty TNHH Song Vui', 'asdasdas', 0, 0, 0, 1, 1425358483, 1425358483, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `news_group`
--

CREATE TABLE IF NOT EXISTS `news_group` (
`id` int(10) unsigned NOT NULL,
  `group_id` int(11) NOT NULL,
  `group_nav` varchar(250) NOT NULL,
  `group_level` tinyint(2) NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `group_related` text NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `pic_show` varchar(20) NOT NULL DEFAULT 'grid',
  `type_show` varchar(20) NOT NULL DEFAULT 'list_item',
  `num_show` int(11) NOT NULL,
  `is_focus` tinyint(4) NOT NULL,
  `is_show_menu` tinyint(4) NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news_group`
--

INSERT INTO `news_group` (`id`, `group_id`, `group_nav`, `group_level`, `parent_id`, `group_related`, `picture`, `title`, `short`, `content`, `friendly_link`, `meta_title`, `meta_key`, `meta_desc`, `pic_show`, `type_show`, `num_show`, `is_focus`, `is_show_menu`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, '1', 1, 0, '', 'news/2015_03/blue_glow_green_background_04_vector_158357.jpg', 'Quản lý download', '&lt;p&gt;asda&lt;/p&gt;', '', 'quan-ly-download', 'Quản lý download | Quan ly download', 'Quản lý download, Quan ly download', '', 'grid', 'list_item', 0, 0, 0, 0, 1, 1425358243, 1425358243, 'vi'),
(2, 1, '1', 1, 0, '', 'news/2015_03/blue_glow_green_background_04_vector_158357.jpg', 'Quản lý download', '&lt;p&gt;asda&lt;/p&gt;', '', 'quan-ly-download-1', 'Quản lý download | Quan ly download', 'Quản lý download, Quan ly download', '', 'grid', 'list_item', 0, 0, 0, 0, 1, 1425358243, 1425358243, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `news_setting`
--

CREATE TABLE IF NOT EXISTS `news_setting` (
`id` int(11) NOT NULL,
  `news_meta_title` varchar(250) NOT NULL,
  `news_meta_key` text NOT NULL,
  `news_meta_desc` text NOT NULL,
  `img_list_w` int(11) NOT NULL DEFAULT '100',
  `img_list_h` int(11) NOT NULL DEFAULT '100',
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(11) NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news_setting`
--

INSERT INTO `news_setting` (`id`, `news_meta_title`, `news_meta_key`, `news_meta_desc`, `img_list_w`, `img_list_h`, `num_list`, `num_order_detail`, `lang`) VALUES
(1, 'Tin tức', '', '', 100, 100, 10, 10, 'vi'),
(2, 'aboutus', '', '', 100, 100, 10, 10, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `order_method`
--

CREATE TABLE IF NOT EXISTS `order_method` (
`id` int(10) unsigned NOT NULL,
  `method_id` int(10) unsigned NOT NULL,
  `name_action` varchar(50) NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(2) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_method`
--

INSERT INTO `order_method` (`id`, `method_id`, `name_action`, `picture`, `title`, `short`, `content`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, '', 'product/2014_08/method1.png', 'Qua thẻ hoặc tài khản ngân hàng', '&lt;p&gt;( Sau khi đặt h&amp;agrave;ng, bạn vui l&amp;ograve;ng đến ng&amp;acirc;n h&amp;agrave;ng hoặc ATM để chuyển 100% gi&amp;aacute; trị sản phẩm cho REIKO)&lt;/p&gt;', '&lt;p&gt;Nội dung đang cập nhật ...&lt;/p&gt;', 1, 1, 1407234470, 1408344688, 'vi'),
(2, 1, '', 'product/2014_08/method1.png', 'Qua thẻ hoặc tài khản ngân hàng', '', '&lt;p&gt;Nội dung đang cập nhật ...&lt;/p&gt;', 1, 1, 1407234470, 1408344688, 'en'),
(3, 3, '', 'product/2014_08/method2.png', 'Reiko thu tiền tận nơi khi giao hàng', '&lt;p&gt;(Nh&amp;acirc;n vi&amp;ecirc;n giao h&amp;agrave;ng sẽ nhận trực tiếp tiền mặt khi giao h&amp;agrave;ng cho bạn)&lt;/p&gt;', '&lt;p&gt;Nội dung đang cập nhật ...&lt;/p&gt;', 0, 1, 1407234524, 1408344707, 'vi'),
(4, 3, '', 'product/2014_08/method2.png', 'Reiko thu tiền tận nơi khi giao hàng', '', '&lt;p&gt;Nội dung đang cập nhật ...&lt;/p&gt;', 0, 1, 1407234524, 1408344707, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `order_shipping`
--

CREATE TABLE IF NOT EXISTS `order_shipping` (
`id` int(10) unsigned NOT NULL,
  `shipping_id` int(10) unsigned NOT NULL,
  `picture` varchar(250) NOT NULL,
  `price` float NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(2) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_shipping`
--

INSERT INTO `order_shipping` (`id`, `shipping_id`, `picture`, `price`, `title`, `content`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, '2014_03/862590119_050.jpg', 0, 'Giao hàng tại nhà 1', '<p>Nội dung Giao h&agrave;ng tại nh&agrave; 1</p>', 0, 1, 1396269176, 1396270617, 'vi'),
(3, 3, 'product/2015_03/vista_blue_and_green_aurora-t2.jpg', 0, 'Nhận hàng tại công ty', '&lt;p&gt;Nội dung nhận h&amp;agrave;ng tại c&amp;ocirc;ng ty&lt;/p&gt;', 0, 1, 1396321549, 1425374785, 'vi');

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE IF NOT EXISTS `page` (
`id` int(10) unsigned NOT NULL,
  `item_id` int(11) NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `group_nav` varchar(250) NOT NULL,
  `group_related` text NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `is_focus` tinyint(1) NOT NULL DEFAULT '0',
  `is_focus1` tinyint(4) NOT NULL,
  `is_focus2` tinyint(4) NOT NULL,
  `is_focus3` tinyint(4) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `item_id`, `group_id`, `group_nav`, `group_related`, `picture`, `title`, `short`, `content`, `friendly_link`, `meta_title`, `meta_key`, `meta_desc`, `show_order`, `is_show`, `is_focus`, `is_focus1`, `is_focus2`, `is_focus3`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, 1, '1', '', 'page/2015_03/blue_glow_green_background_04_vector_158357.jpg', 'CPU', '&lt;p&gt;fsfsdfdsfdsf&lt;/p&gt;', '&lt;p&gt;&amp;nbsp;sdf ds fsdf sdf dsfds&lt;/p&gt;', 'cpu', 'CPU | CPU', 'CPU, CPU', '&nbsp;sdf ds fsdf sdf dsfds', 0, 1, 0, 0, 0, 0, 1425366151, 1425366151, 'vi'),
(2, 1, 1, '1', '', 'page/2015_03/blue_glow_green_background_04_vector_158357.jpg', 'CPU', '&lt;p&gt;fsfsdfdsfdsf&lt;/p&gt;', '&lt;p&gt;&amp;nbsp;sdf ds fsdf sdf dsfds&lt;/p&gt;', 'cpu-1', 'CPU | CPU', 'CPU, CPU', '&nbsp;sdf ds fsdf sdf dsfds', 0, 1, 0, 0, 0, 0, 1425366151, 1425366151, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `page_group`
--

CREATE TABLE IF NOT EXISTS `page_group` (
`id` int(10) unsigned NOT NULL,
  `group_id` int(11) NOT NULL,
  `group_nav` varchar(250) NOT NULL,
  `group_level` tinyint(2) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `group_related` varchar(250) NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `pic_show` varchar(50) NOT NULL DEFAULT 'grid',
  `type_show` varchar(20) NOT NULL DEFAULT 'list_item',
  `num_show` int(11) NOT NULL,
  `is_focus` tinyint(1) NOT NULL DEFAULT '0',
  `is_show_menu` tinyint(1) NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page_group`
--

INSERT INTO `page_group` (`id`, `group_id`, `group_nav`, `group_level`, `parent_id`, `group_related`, `picture`, `title`, `short`, `content`, `friendly_link`, `meta_title`, `meta_key`, `meta_desc`, `pic_show`, `type_show`, `num_show`, `is_focus`, `is_show_menu`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, '1', 1, 0, '', 'page/2015_03/blue_glow_green_background_04_vector_158357.jpg', 'Banner', '&lt;p&gt;asdasdasd&lt;/p&gt;', '&lt;p&gt;a sd adsasd as&lt;/p&gt;', 'banner-2', 'Banner | Banner', 'Banner, Banner', 'a sd adsasd as', 'grid', 'list_item', 1, 0, 0, 0, 1, 1425365552, 1425365552, 'vi'),
(2, 1, '1', 1, 0, '', 'page/2015_03/blue_glow_green_background_04_vector_158357.jpg', 'Banner', '&lt;p&gt;asdasdasd&lt;/p&gt;', '&lt;p&gt;a sd adsasd as&lt;/p&gt;', 'banner-3', 'Banner | Banner', 'Banner, Banner', 'a sd adsasd as', 'grid', 'list_item', 1, 0, 0, 0, 1, 1425365552, 1425365552, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `page_setting`
--

CREATE TABLE IF NOT EXISTS `page_setting` (
`id` int(11) NOT NULL,
  `page_meta_title` varchar(250) NOT NULL,
  `page_meta_key` text NOT NULL,
  `page_meta_desc` text NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(10) unsigned NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page_setting`
--

INSERT INTO `page_setting` (`id`, `page_meta_title`, `page_meta_key`, `page_meta_desc`, `num_list`, `num_order_detail`, `lang`) VALUES
(1, 'Trang', '', '', 10, 5, 'vi'),
(2, 'aboutus', '', '', 10, 10, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `partner`
--

CREATE TABLE IF NOT EXISTS `partner` (
`id` int(10) unsigned NOT NULL,
  `item_id` int(11) NOT NULL,
  `group_nav` varchar(250) NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `group_related` text NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `link` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `is_focus` tinyint(1) DEFAULT '0',
  `is_focus_group` int(11) NOT NULL DEFAULT '0',
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `partner`
--

INSERT INTO `partner` (`id`, `item_id`, `group_nav`, `group_id`, `group_related`, `picture`, `title`, `link`, `short`, `content`, `friendly_link`, `meta_title`, `meta_key`, `meta_desc`, `is_focus`, `is_focus_group`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, '1', 1, '', 'partner/2015_03/79463.jpg', 'Banner', 'imsvietnamese.com', '&lt;p&gt;adsadsasd&lt;/p&gt;', '&lt;p&gt;asd ad asd asd&lt;/p&gt;', 'banner-4', 'Banner | Banner', 'Banner, Banner', 'asd ad asd asd', 0, 0, 0, 1, 1425367118, 1425367118, 'vi'),
(2, 1, '1', 1, '', 'partner/2015_03/79463.jpg', 'Banner', 'imsvietnamese.com', '&lt;p&gt;adsadsasd&lt;/p&gt;', '&lt;p&gt;asd ad asd asd&lt;/p&gt;', 'banner-5', 'Banner | Banner', 'Banner, Banner', 'asd ad asd asd', 0, 0, 0, 1, 1425367118, 1425367118, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `partner_comment`
--

CREATE TABLE IF NOT EXISTS `partner_comment` (
`cid` int(10) unsigned NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'partner',
  `type_id` int(11) NOT NULL DEFAULT '0',
  `link_page` varchar(250) NOT NULL,
  `full_name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `company` varchar(250) NOT NULL,
  `address` varchar(250) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `show_order` int(11) NOT NULL DEFAULT '0',
  `is_show` tinyint(2) NOT NULL DEFAULT '2',
  `date_create` int(10) unsigned NOT NULL,
  `date_update` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `partner_group`
--

CREATE TABLE IF NOT EXISTS `partner_group` (
`id` int(10) unsigned NOT NULL,
  `group_id` int(11) NOT NULL,
  `group_nav` varchar(250) NOT NULL,
  `group_level` tinyint(2) NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `is_focus` tinyint(4) NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `partner_group`
--

INSERT INTO `partner_group` (`id`, `group_id`, `group_nav`, `group_level`, `parent_id`, `picture`, `title`, `short`, `content`, `friendly_link`, `meta_title`, `meta_key`, `meta_desc`, `is_focus`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, '1', 1, 0, 'partner/2015_03/79463.jpg', 'Construction', '&lt;p&gt;adadas&lt;/p&gt;', '&lt;p&gt;&amp;nbsp;asd asd&lt;/p&gt;', 'construction', 'Construction | Construction', 'Construction, Construction', '&nbsp;asd asd', 0, 0, 1, 1425366739, 1425366739, 'vi'),
(2, 1, '1', 1, 0, 'partner/2015_03/79463.jpg', 'Construction', '&lt;p&gt;adadas&lt;/p&gt;', '&lt;p&gt;&amp;nbsp;asd asd&lt;/p&gt;', 'construction-1', 'Construction | Construction', 'Construction, Construction', '&nbsp;asd asd', 0, 0, 1, 1425366739, 1425366739, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `partner_setting`
--

CREATE TABLE IF NOT EXISTS `partner_setting` (
`id` int(11) NOT NULL,
  `partner_meta_title` varchar(250) NOT NULL,
  `partner_meta_key` text NOT NULL,
  `partner_meta_desc` text NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(11) NOT NULL DEFAULT '5',
  `img_list_w` int(11) NOT NULL DEFAULT '150',
  `img_list_h` int(11) NOT NULL DEFAULT '100',
  `lang` varchar(10) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `partner_setting`
--

INSERT INTO `partner_setting` (`id`, `partner_meta_title`, `partner_meta_key`, `partner_meta_desc`, `num_list`, `num_order_detail`, `img_list_w`, `img_list_h`, `lang`) VALUES
(1, 'Khách hàng', '', '', 9, 5, 141, 87, 'vi'),
(2, 'aboutus', '', '', 10, 5, 150, 100, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
`id` int(10) unsigned NOT NULL,
  `item_id` int(11) NOT NULL,
  `group_nav` varchar(250) NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `arr_option` varchar(250) NOT NULL,
  `group_related` varchar(250) NOT NULL,
  `brand_id` int(10) unsigned NOT NULL,
  `item_code` varchar(50) NOT NULL,
  `picture` varchar(250) NOT NULL,
  `file` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `pic_show` varchar(50) NOT NULL DEFAULT 'slide',
  `price_import` float NOT NULL,
  `price` float NOT NULL,
  `percent_discount` float NOT NULL,
  `price_buy` float NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `in_stock` int(11) NOT NULL,
  `out_stock` int(11) NOT NULL,
  `list_color` text NOT NULL,
  `list_size` text NOT NULL,
  `list_code_pic` text NOT NULL,
  `list_status` varchar(250) NOT NULL,
  `num_view` int(11) NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `is_focus` tinyint(1) NOT NULL DEFAULT '0',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `item_id`, `group_nav`, `group_id`, `arr_option`, `group_related`, `brand_id`, `item_code`, `picture`, `file`, `title`, `pic_show`, `price_import`, `price`, `percent_discount`, `price_buy`, `short`, `content`, `friendly_link`, `meta_title`, `meta_key`, `meta_desc`, `in_stock`, `out_stock`, `list_color`, `list_size`, `list_code_pic`, `list_status`, `num_view`, `show_order`, `is_show`, `is_focus`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, '1', 1, '', '1', 0, 'EGTPKE', 'product/2015_03/vista_blue_and_green_aurora-t2.jpg', '', 'test 1', 'slide', 0, 500000, 40, 300000, '&lt;p&gt;dadasd&lt;/p&gt;', '&lt;p&gt;asd&lt;/p&gt;', 'test-4', 'test | test', 'test, test', 'asd', 0, 0, '', '', '', '', 0, 0, 1, 1, 1425435159, 1425435183, 'vi'),
(2, 1, '1', 1, '', '1', 0, 'EGTPKE', 'product/2015_03/vista_blue_and_green_aurora-t2.jpg', '', 'test', 'slide', 0, 500000, 40, 300000, '&lt;p&gt;dadasd&lt;/p&gt;', '&lt;p&gt;asd&lt;/p&gt;', 'test-5', 'test | test', 'test, test', 'asd', 0, 0, '', '', '', '', 0, 0, 1, 1, 1425435159, 1425435183, 'en'),
(3, 3, '1', 1, '', '1', 0, 'EGTPKE', 'product/2015_03/vista_blue_and_green_aurora-t2.jpg', '', 'test 1', 'slide', 0, 500000, 40, 300000, '&lt;p&gt;dadasd&lt;/p&gt;', '&lt;p&gt;asd&lt;/p&gt;', 'test-4-1', 'test | test', 'test, test', 'asd', 0, 0, '', '', '', '', 0, 0, 1, 1, 1425436879, 1425436879, 'vi'),
(4, 3, '1', 1, '', '1', 0, 'EGTPKE', 'product/2015_03/vista_blue_and_green_aurora-t2.jpg', '', 'test', 'slide', 0, 500000, 40, 300000, '&lt;p&gt;dadasd&lt;/p&gt;', '&lt;p&gt;asd&lt;/p&gt;', 'test-5-1', 'test | test', 'test, test', 'asd', 0, 0, '', '', '', '', 0, 0, 1, 1, 1425435159, 1425435183, 'en'),
(5, 5, '1', 1, '', '1', 0, 'EGTPKE', 'product/2015_03/vista_blue_and_green_aurora-t2.jpg', '', 'test 1', 'slide', 0, 500000, 40, 300000, '&lt;p&gt;dadasd&lt;/p&gt;', '&lt;p&gt;asd&lt;/p&gt;', 'test-4-2', 'test | test', 'test, test', 'asd', 0, 0, '', '', '', '', 0, 0, 1, 1, 1425437155, 1425437155, 'vi'),
(6, 5, '1', 1, '', '1', 0, 'EGTPKE', 'product/2015_03/vista_blue_and_green_aurora-t2.jpg', '', 'test', 'slide', 0, 500000, 40, 300000, '&lt;p&gt;dadasd&lt;/p&gt;', '&lt;p&gt;asd&lt;/p&gt;', 'test-5-2', 'test | test', 'test, test', 'asd', 0, 0, '', '', '', '', 0, 0, 1, 1, 1425435159, 1425435183, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `product_brand`
--

CREATE TABLE IF NOT EXISTS `product_brand` (
`id` int(10) unsigned NOT NULL,
  `brand_id` int(11) NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_brand`
--

INSERT INTO `product_brand` (`id`, `brand_id`, `picture`, `title`, `content`, `friendly_link`, `meta_title`, `meta_key`, `meta_desc`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, '', 'Shipment', '&lt;p&gt;adasd&lt;/p&gt;', 'shipment', 'Shipment | Shipment', 'Shipment, Shipment', 'adasd', 0, 1, 1425367802, 1425367802, 'vi'),
(2, 1, '', 'Shipment', '&lt;p&gt;adasd&lt;/p&gt;', 'shipment-1', 'Shipment | Shipment', 'Shipment, Shipment', 'adasd', 0, 1, 1425367802, 1425367802, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `product_code_pic`
--

CREATE TABLE IF NOT EXISTS `product_code_pic` (
`id` int(10) unsigned NOT NULL,
  `code_pic_id` int(10) unsigned NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(2) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_code_pic`
--

INSERT INTO `product_code_pic` (`id`, `code_pic_id`, `picture`, `title`, `content`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, '', 'Fanpage Facebook', '', 0, 1, 1425368534, 1425368534, 'vi'),
(2, 1, '', 'Fanpage Facebook', '', 0, 1, 1425368534, 1425368534, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `product_color`
--

CREATE TABLE IF NOT EXISTS `product_color` (
`id` int(10) unsigned NOT NULL,
  `color_id` int(10) unsigned NOT NULL,
  `picture` varchar(250) NOT NULL,
  `color` varchar(7) NOT NULL,
  `title` varchar(250) NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_color`
--

INSERT INTO `product_color` (`id`, `color_id`, `picture`, `color`, `title`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, '', '#ff0000', 'Đỏ', 0, 1, 1415590811, 1415590811, 'vi'),
(2, 2, '', '#ebff00', 'Vàng', 0, 1, 1415590820, 1415590820, 'vi'),
(3, 3, '', '#00f7ff', 'Xanh dương', 0, 1, 1415590832, 1415590832, 'vi'),
(4, 4, '', '#05ff00', 'Lục', 0, 1, 1415590878, 1415590878, 'vi'),
(5, 5, '', '#ff00d1', 'Hồng', 0, 1, 1415590891, 1415590891, 'vi'),
(6, 6, '', '#ba00ff', 'Tím', 0, 1, 1415590955, 1415590955, 'vi'),
(7, 7, '', '#ff9400', 'Cam', 0, 1, 1415590968, 1415590968, 'vi'),
(8, 8, '', '#ff0000', 'Đỏ', 0, 1, 1425370972, 1425370972, 'vi'),
(9, 8, '', '#ff0000', 'Đỏ', 0, 1, 1425370972, 1425370972, 'en'),
(10, 10, '', '#ff9400', 'Cam', 0, 1, 1425371850, 1425371850, 'vi');

-- --------------------------------------------------------

--
-- Table structure for table `product_combine`
--

CREATE TABLE IF NOT EXISTS `product_combine` (
`id` int(11) unsigned NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'product',
  `type_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `price_buy` float NOT NULL,
  `in_stock` int(11) NOT NULL,
  `out_stock` int(11) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_group`
--

CREATE TABLE IF NOT EXISTS `product_group` (
`id` int(10) unsigned NOT NULL,
  `group_id` int(11) NOT NULL,
  `group_nav` varchar(250) NOT NULL,
  `group_level` tinyint(2) NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `group_related` varchar(250) NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `pic_show` varchar(50) NOT NULL DEFAULT 'grid',
  `type_show` varchar(20) NOT NULL DEFAULT 'list_item',
  `num_show` int(11) NOT NULL,
  `is_focus` tinyint(1) NOT NULL DEFAULT '0',
  `is_show_menu` tinyint(4) NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_group`
--

INSERT INTO `product_group` (`id`, `group_id`, `group_nav`, `group_level`, `parent_id`, `group_related`, `picture`, `title`, `short`, `content`, `friendly_link`, `meta_title`, `meta_key`, `meta_desc`, `pic_show`, `type_show`, `num_show`, `is_focus`, `is_show_menu`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, '1', 1, 0, '', 'product/2015_03/vista_blue_and_green_aurora-t2.jpg', 'Nhóm 1', '&lt;p&gt;fsdfsdfd&lt;/p&gt;', '&lt;p&gt;dsfsdfsfds&lt;/p&gt;', 'nhom-1-2', 'Nhóm 1 | Nhom 1', 'Nhóm 1, Nhom 1', 'dsfsdfsfds', 'grid', 'list_item', 0, 0, 0, 0, 1, 1425373716, 1425373716, 'vi'),
(2, 1, '1', 1, 0, '', 'product/2015_03/vista_blue_and_green_aurora-t2.jpg', 'Nhóm 1', '&lt;p&gt;fsdfsdfd&lt;/p&gt;', '&lt;p&gt;dsfsdfsfds&lt;/p&gt;', 'nhom-1-3', 'Nhóm 1 | Nhom 1', 'Nhóm 1, Nhom 1', 'dsfsdfsfds', 'grid', 'list_item', 0, 0, 0, 0, 1, 1425373716, 1425373716, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `product_option`
--

CREATE TABLE IF NOT EXISTS `product_option` (
`id` int(10) unsigned NOT NULL,
  `option_id` int(11) NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_option`
--

INSERT INTO `product_option` (`id`, `option_id`, `picture`, `title`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, '', 'Menu item 2', 0, 1, 1425374235, 1425374235, 'vi'),
(2, 1, '', 'Menu item 2', 0, 1, 1425374235, 1425374235, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `product_order`
--

CREATE TABLE IF NOT EXISTS `product_order` (
`order_id` int(10) unsigned NOT NULL,
  `order_code` varchar(20) NOT NULL,
  `o_full_name` varchar(250) NOT NULL,
  `o_email` varchar(250) NOT NULL,
  `o_phone` varchar(250) NOT NULL,
  `o_address` varchar(250) NOT NULL,
  `o_area` varchar(250) NOT NULL,
  `o_country` varchar(250) NOT NULL,
  `o_province` varchar(250) NOT NULL,
  `o_district` varchar(250) NOT NULL,
  `o_ward` varchar(250) NOT NULL,
  `d_full_name` varchar(250) NOT NULL,
  `d_email` varchar(250) NOT NULL,
  `d_phone` varchar(250) NOT NULL,
  `d_address` varchar(250) NOT NULL,
  `d_area` varchar(250) NOT NULL,
  `d_country` varchar(250) NOT NULL,
  `d_province` varchar(250) NOT NULL,
  `d_district` varchar(250) NOT NULL,
  `d_ward` varchar(250) NOT NULL,
  `shipping` int(11) NOT NULL,
  `method` int(11) NOT NULL,
  `request_more` text NOT NULL,
  `message_send` tinyint(2) NOT NULL DEFAULT '0',
  `message_title` varchar(250) NOT NULL,
  `message_content` text NOT NULL,
  `total_order` double NOT NULL,
  `promotion_id` varchar(50) NOT NULL,
  `promotion_percent` float NOT NULL,
  `shipping_price` double NOT NULL,
  `voucher_id` varchar(50) NOT NULL,
  `voucher_amount` double NOT NULL,
  `total_payment` double NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_status` tinyint(4) NOT NULL DEFAULT '1',
  `is_show` tinyint(2) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_order`
--

INSERT INTO `product_order` (`order_id`, `order_code`, `o_full_name`, `o_email`, `o_phone`, `o_address`, `o_area`, `o_country`, `o_province`, `o_district`, `o_ward`, `d_full_name`, `d_email`, `d_phone`, `d_address`, `d_area`, `d_country`, `d_province`, `d_district`, `d_ward`, `shipping`, `method`, `request_more`, `message_send`, `message_title`, `message_content`, `total_order`, `promotion_id`, `promotion_percent`, `shipping_price`, `voucher_id`, `voucher_amount`, `total_payment`, `user_id`, `show_order`, `is_status`, `is_show`, `date_create`, `date_update`) VALUES
(1, '1GWUUV', 'Nguyễn Văn A', 'test@imsvietnamese.com', '0123456789', '62d2asd314', '', '', '08', '0801', '080101', 'Nguyễn Văn A', 'test@imsvietnamese.com', '0123456789', '62d2asd314', '', '', '08', '0801', '080101', 0, 1, 'qadasdasfr', 0, '', '', 1080000, '', 0, 0, '', 0, 1080000, 0, 0, 1, 1, 1415621930, 1415621930);

-- --------------------------------------------------------

--
-- Table structure for table `product_order_detail`
--

CREATE TABLE IF NOT EXISTS `product_order_detail` (
`detail_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'product',
  `type_id` int(10) unsigned NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `price_buy` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `out_stock` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `code_pic` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_order_detail`
--

INSERT INTO `product_order_detail` (`detail_id`, `order_id`, `type`, `type_id`, `picture`, `title`, `price_buy`, `quantity`, `out_stock`, `color_id`, `size_id`, `code_pic`) VALUES
(1, 1, 'product', 5, 'product/2014_11/sp1.png', 'Áo bộ chất liệu vải TRE (Bamboo) hình quỷ nhỏ cute và cool', 180000, 6, 0, 3, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_pic`
--

CREATE TABLE IF NOT EXISTS `product_pic` (
`id` int(10) unsigned NOT NULL,
  `pic_id` int(11) NOT NULL,
  `type` varchar(250) NOT NULL DEFAULT 'item',
  `type_id` int(10) unsigned NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_pic`
--

INSERT INTO `product_pic` (`id`, `pic_id`, `type`, `type_id`, `picture`, `title`, `content`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, 'item', 5, 'product/2015_03/vista_blue_and_green_aurora-t2.jpg', 'ádadasdasd', 'ádaasdasd', 0, 1, 1425444784, 1425444784, 'vi'),
(2, 1, 'item', 5, 'product/2015_03/vista_blue_and_green_aurora-t2.jpg', 'ádadasdasd', 'ádaasdasd', 0, 1, 1425444784, 1425444784, 'en'),
(3, 3, 'item', 5, 'product/2015_03/vista_blue_and_green_aurora-t2.jpg', 'ádadasdasd', 'ádaasdasd', 0, 1, 1425444820, 1425444820, 'vi'),
(4, 3, 'item', 5, 'product/2015_03/vista_blue_and_green_aurora-t2.jpg', 'ádadasdasd', 'ádaasdasd', 0, 1, 1425444820, 1425444820, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `product_receipt`
--

CREATE TABLE IF NOT EXISTS `product_receipt` (
`receipt_id` int(10) unsigned NOT NULL,
  `receipt_code` varchar(20) NOT NULL,
  `receipt_type` varchar(20) NOT NULL DEFAULT 'import',
  `type_code` varchar(20) NOT NULL,
  `title` varchar(250) NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(4) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_receipt_detail`
--

CREATE TABLE IF NOT EXISTS `product_receipt_detail` (
`id` int(11) unsigned NOT NULL,
  `receipt_id` int(11) NOT NULL,
  `is_level` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT 'product',
  `type_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `in_stock` int(11) NOT NULL,
  `out_stock` int(11) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_setting`
--

CREATE TABLE IF NOT EXISTS `product_setting` (
`id` int(11) NOT NULL,
  `product_meta_title` varchar(250) NOT NULL,
  `product_meta_key` text NOT NULL,
  `product_meta_desc` text NOT NULL,
  `brand_friendly_link` varchar(250) NOT NULL,
  `brand_meta_title` varchar(250) NOT NULL,
  `brand_meta_key` text NOT NULL,
  `brand_meta_desc` text NOT NULL,
  `ordering_friendly_link` varchar(250) NOT NULL,
  `ordering_cart_link` varchar(250) NOT NULL,
  `ordering_cart_meta_title` varchar(250) NOT NULL,
  `ordering_cart_meta_key` text NOT NULL,
  `ordering_cart_meta_desc` text NOT NULL,
  `ordering_address_link` varchar(250) NOT NULL,
  `ordering_address_meta_title` varchar(250) NOT NULL,
  `ordering_address_meta_key` text NOT NULL,
  `ordering_address_meta_desc` text NOT NULL,
  `ordering_shipping_link` varchar(250) NOT NULL,
  `ordering_shipping_meta_title` varchar(250) NOT NULL,
  `ordering_shipping_meta_key` text NOT NULL,
  `ordering_shipping_meta_desc` text NOT NULL,
  `ordering_method_link` varchar(250) NOT NULL,
  `ordering_method_meta_title` varchar(250) NOT NULL,
  `ordering_method_meta_key` text NOT NULL,
  `ordering_method_meta_desc` text NOT NULL,
  `ordering_complete_link` varchar(250) NOT NULL,
  `ordering_complete_meta_title` varchar(250) NOT NULL,
  `ordering_complete_meta_key` text NOT NULL,
  `ordering_complete_meta_desc` text NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(11) NOT NULL DEFAULT '6',
  `lang` varchar(10) NOT NULL DEFAULT 'vi',
  `brand_link` varchar(250) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_setting`
--

INSERT INTO `product_setting` (`id`, `product_meta_title`, `product_meta_key`, `product_meta_desc`, `brand_friendly_link`, `brand_meta_title`, `brand_meta_key`, `brand_meta_desc`, `ordering_friendly_link`, `ordering_cart_link`, `ordering_cart_meta_title`, `ordering_cart_meta_key`, `ordering_cart_meta_desc`, `ordering_address_link`, `ordering_address_meta_title`, `ordering_address_meta_key`, `ordering_address_meta_desc`, `ordering_shipping_link`, `ordering_shipping_meta_title`, `ordering_shipping_meta_key`, `ordering_shipping_meta_desc`, `ordering_method_link`, `ordering_method_meta_title`, `ordering_method_meta_key`, `ordering_method_meta_desc`, `ordering_complete_link`, `ordering_complete_meta_title`, `ordering_complete_meta_key`, `ordering_complete_meta_desc`, `num_list`, `num_order_detail`, `lang`, `brand_link`) VALUES
(1, 'Sản phẩm', '', '', 'thuong-hieu', 'Thương hiệu', '', '', 'dat-hang', 'gio-hang', 'Giỏ hàng', '', '', 'dia-chi-dat-hang', 'Địa chỉ đặt hàng', '', '', 'phuong-thuc-van-chuyen', 'Phương thức vận chuyển', '', '', 'xac-nhan-don-hang', 'Xác nhận đơn hàng', '', '', 'hoan-tat', 'Hoàn tất đơn hàng', '', '', 6, 6, 'vi', ''),
(2, 'aboutus', '', '', 'brand', 'Brand', '', '', 'orders', 'cart', '', '', '', 'address', '', '', '', 'shipping', '', '', '', 'method', '', '', '', '', '', '', '', 10, 6, 'en', '');

-- --------------------------------------------------------

--
-- Table structure for table `product_size`
--

CREATE TABLE IF NOT EXISTS `product_size` (
`id` int(10) unsigned NOT NULL,
  `size_id` int(10) unsigned NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_size`
--

INSERT INTO `product_size` (`id`, `size_id`, `picture`, `title`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, '', '10', 0, 1, 1415590988, 1415590988, 'vi'),
(2, 2, '', '20', 0, 1, 1415590992, 1415590992, 'vi'),
(3, 3, '', '30', 0, 1, 1415590995, 1415590995, 'vi'),
(4, 4, '', '40', 0, 1, 1415590998, 1415590998, 'vi'),
(5, 5, '', '50', 0, 1, 1415591002, 1415591002, 'vi'),
(6, 6, '', '60', 0, 1, 1415591006, 1415591006, 'vi'),
(7, 7, '', '70', 0, 1, 1415591010, 1415591010, 'vi'),
(8, 8, '', '80', 0, 1, 1415591014, 1415591014, 'vi'),
(9, 9, '', '90', 0, 1, 1415591018, 1415591018, 'vi'),
(10, 10, '', '100', 0, 1, 1415591022, 1415591022, 'vi'),
(11, 11, '', 'XXL', 0, 1, 1415591027, 1415591027, 'vi'),
(12, 12, '', 'XL', 0, 1, 1415591031, 1415591031, 'vi'),
(13, 13, '', 'L', 0, 1, 1415591034, 1415591034, 'vi'),
(14, 14, '', 'M', 0, 1, 1415591038, 1415591038, 'vi'),
(15, 15, '', 'S', 0, 1, 1415591044, 1425375604, 'vi');

-- --------------------------------------------------------

--
-- Table structure for table `product_status`
--

CREATE TABLE IF NOT EXISTS `product_status` (
`id` int(10) unsigned NOT NULL,
  `status_id` int(11) NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_status`
--

INSERT INTO `product_status` (`id`, `status_id`, `picture`, `title`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, 'product/2015_03/vista_blue_and_green_aurora-t2.jpg', 'Banner', 0, 1, 1425375771, 1425375771, 'vi'),
(2, 1, 'product/2015_03/vista_blue_and_green_aurora-t2.jpg', 'Banner', 0, 1, 1425375771, 1425375771, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
`id` int(10) unsigned NOT NULL,
  `item_id` int(11) NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `group_nav` varchar(250) NOT NULL,
  `group_related` text NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `is_focus` tinyint(1) NOT NULL DEFAULT '0',
  `is_focus1` tinyint(4) NOT NULL,
  `is_focus2` tinyint(4) NOT NULL,
  `is_focus3` tinyint(4) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `item_id`, `group_id`, `group_nav`, `group_related`, `picture`, `title`, `short`, `content`, `friendly_link`, `meta_title`, `meta_key`, `meta_desc`, `show_order`, `is_show`, `is_focus`, `is_focus1`, `is_focus2`, `is_focus3`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, 1, '1', '1', 'project/2015_03/vista_blue_and_green_aurora-t2.jpg', 'Quản lý sidebar', '&lt;p&gt;qweqweqw&lt;/p&gt;', '&lt;p&gt;qweqweqwe&lt;/p&gt;', 'quan-ly-sidebar', 'Quản lý sidebar | Quan ly sidebar', 'Quản lý sidebar, Quan ly sidebar', 'qweqweqwe', 0, 1, 0, 0, 0, 0, 1425438315, 1425438315, 'vi'),
(2, 1, 1, '1', '1', 'project/2015_03/vista_blue_and_green_aurora-t2.jpg', 'Quản lý sidebar', '&lt;p&gt;qweqweqw&lt;/p&gt;', '&lt;p&gt;qweqweqwe&lt;/p&gt;', 'quan-ly-sidebar-1', 'Quản lý sidebar | Quan ly sidebar', 'Quản lý sidebar, Quan ly sidebar', 'qweqweqwe', 0, 1, 0, 0, 0, 0, 1425438315, 1425438315, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `project_group`
--

CREATE TABLE IF NOT EXISTS `project_group` (
`id` int(10) unsigned NOT NULL,
  `group_id` int(11) NOT NULL,
  `group_nav` varchar(250) NOT NULL,
  `group_level` tinyint(2) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `group_related` varchar(250) NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `pic_show` varchar(50) NOT NULL DEFAULT 'grid',
  `type_show` varchar(20) NOT NULL DEFAULT 'list_item',
  `num_show` int(11) NOT NULL,
  `is_focus` tinyint(1) NOT NULL DEFAULT '0',
  `is_show_menu` tinyint(1) NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_group`
--

INSERT INTO `project_group` (`id`, `group_id`, `group_nav`, `group_level`, `parent_id`, `group_related`, `picture`, `title`, `short`, `content`, `friendly_link`, `meta_title`, `meta_key`, `meta_desc`, `pic_show`, `type_show`, `num_show`, `is_focus`, `is_show_menu`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, '1', 1, 0, '', 'project/2015_03/vista_blue_and_green_aurora-t2.jpg', 'Menu item', '&lt;p&gt;dzadas&lt;/p&gt;', '&lt;p&gt;asdasdasd&lt;/p&gt;', 'menu-item', 'Menu item | Menu item', 'Menu item, Menu item', 'asdasdasd', 'grid', 'list_item', 0, 0, 0, 0, 1, 1425438248, 1425438248, 'vi'),
(2, 1, '1', 1, 0, '', 'project/2015_03/vista_blue_and_green_aurora-t2.jpg', 'Menu item', '&lt;p&gt;dzadas&lt;/p&gt;', '&lt;p&gt;asdasdasd&lt;/p&gt;', 'menu-item-1', 'Menu item | Menu item', 'Menu item, Menu item', 'asdasdasd', 'grid', 'list_item', 0, 0, 0, 0, 1, 1425438248, 1425438248, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `project_setting`
--

CREATE TABLE IF NOT EXISTS `project_setting` (
`id` int(11) NOT NULL,
  `project_meta_title` varchar(250) NOT NULL,
  `project_meta_key` text NOT NULL,
  `project_meta_desc` text NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(10) unsigned NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_setting`
--

INSERT INTO `project_setting` (`id`, `project_meta_title`, `project_meta_key`, `project_meta_desc`, `num_list`, `num_order_detail`, `lang`) VALUES
(1, 'Dự án', '', '', 12, 5, 'vi'),
(2, 'Service', '', '', 10, 10, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE IF NOT EXISTS `promotion` (
  `promotion_id` varchar(50) NOT NULL,
  `order_create` int(11) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `percent` float NOT NULL,
  `is_show` tinyint(2) NOT NULL DEFAULT '1',
  `date_start` int(11) NOT NULL,
  `date_end` int(11) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `repository`
--

CREATE TABLE IF NOT EXISTS `repository` (
`id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `title_search` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(4) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `repository_method`
--

CREATE TABLE IF NOT EXISTS `repository_method` (
`id` int(10) unsigned NOT NULL,
  `method_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `method_type` varchar(20) NOT NULL DEFAULT 'import',
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `title_search` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `show_order` int(10) unsigned NOT NULL,
  `is_show` tinyint(4) NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `date_create` int(10) unsigned NOT NULL,
  `date_update` int(10) unsigned NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `repository_method_group`
--

CREATE TABLE IF NOT EXISTS `repository_method_group` (
`id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `title_search` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `show_order` int(10) unsigned NOT NULL,
  `is_show` tinyint(4) NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `date_create` int(10) unsigned NOT NULL,
  `date_update` int(10) unsigned NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `repository_receipt`
--

CREATE TABLE IF NOT EXISTS `repository_receipt` (
`receipt_id` int(10) unsigned NOT NULL,
  `receipt_code` varchar(20) NOT NULL,
  `receipt_type` varchar(20) NOT NULL DEFAULT 'import',
  `type_code` varchar(20) NOT NULL,
  `repository_id` int(10) unsigned NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(4) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_edit` int(11) NOT NULL,
  `admin_finish` int(11) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `repository_receipt_detail`
--

CREATE TABLE IF NOT EXISTS `repository_receipt_detail` (
`id` int(11) unsigned NOT NULL,
  `receipt_id` int(11) NOT NULL,
  `is_level` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT 'product',
  `type_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `repository_receipt_import`
--

CREATE TABLE IF NOT EXISTS `repository_receipt_import` (
`id` int(10) unsigned NOT NULL,
  `code` varchar(20) NOT NULL,
  `receipt_type` varchar(20) NOT NULL DEFAULT 'import',
  `type_code` varchar(20) NOT NULL,
  `title` varchar(250) NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(4) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_edit` int(11) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
`id` int(10) unsigned NOT NULL,
  `item_id` int(11) NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `group_nav` text NOT NULL,
  `group_related` text NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `is_focus` tinyint(1) NOT NULL DEFAULT '0',
  `is_focus1` tinyint(4) NOT NULL,
  `is_focus2` tinyint(4) NOT NULL,
  `is_focus3` tinyint(4) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `item_id`, `group_id`, `group_nav`, `group_related`, `picture`, `title`, `short`, `content`, `friendly_link`, `meta_title`, `meta_key`, `meta_desc`, `show_order`, `is_show`, `is_focus`, `is_focus1`, `is_focus2`, `is_focus3`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, 1, '1', '1', 'service/2015_03/131010hinh-hai-qua-bong-thuy-tinh-long-lanh.jpg', 'adasds', '&lt;p&gt;asdasd&lt;/p&gt;', '&lt;p&gt;asdasdsa&lt;/p&gt;', 'adasds', 'adasds | adasds', 'adasds, adasds', 'asdasdsa', 0, 1, 0, 0, 0, 0, 1425438727, 1425438727, 'vi'),
(2, 1, 1, '1', '1', 'service/2015_03/131010hinh-hai-qua-bong-thuy-tinh-long-lanh.jpg', 'adasds', '&lt;p&gt;asdasd&lt;/p&gt;', '&lt;p&gt;asdasdsa&lt;/p&gt;', 'adasds-1', 'adasds | adasds', 'adasds, adasds', 'asdasdsa', 0, 1, 0, 0, 0, 0, 1425438727, 1425438727, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `service_group`
--

CREATE TABLE IF NOT EXISTS `service_group` (
`id` int(10) unsigned NOT NULL,
  `group_id` int(11) NOT NULL,
  `group_nav` varchar(250) NOT NULL,
  `group_level` tinyint(2) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `group_related` varchar(250) NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `pic_show` varchar(50) NOT NULL DEFAULT 'grid',
  `type_show` varchar(20) NOT NULL DEFAULT 'list_item',
  `num_show` int(11) NOT NULL,
  `is_focus` tinyint(1) NOT NULL DEFAULT '0',
  `is_show_menu` tinyint(1) NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `service_group`
--

INSERT INTO `service_group` (`id`, `group_id`, `group_nav`, `group_level`, `parent_id`, `group_related`, `picture`, `title`, `short`, `content`, `friendly_link`, `meta_title`, `meta_key`, `meta_desc`, `pic_show`, `type_show`, `num_show`, `is_focus`, `is_show_menu`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, '1', 1, 0, '', 'service/2015_03/131010hinh-hai-qua-bong-thuy-tinh-long-lanh.jpg', 'test', '&lt;p&gt;dasd&lt;/p&gt;', '&lt;p&gt;dasda&lt;/p&gt;', 'test-5-3', 'test | test', 'test, test', 'dasda', 'grid', 'list_item', 0, 0, 0, 0, 1, 1425438698, 1425438698, 'vi'),
(2, 1, '1', 1, 0, '', 'service/2015_03/131010hinh-hai-qua-bong-thuy-tinh-long-lanh.jpg', 'test', '&lt;p&gt;dasd&lt;/p&gt;', '&lt;p&gt;dasda&lt;/p&gt;', 'test-5-4', 'test | test', 'test, test', 'dasda', 'grid', 'list_item', 0, 0, 0, 0, 1, 1425438698, 1425438698, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `service_setting`
--

CREATE TABLE IF NOT EXISTS `service_setting` (
`id` int(11) NOT NULL,
  `service_meta_title` varchar(250) NOT NULL,
  `service_meta_key` text NOT NULL,
  `service_meta_desc` text NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(10) unsigned NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi',
  `background` varchar(250) NOT NULL,
  `sidebar_left` int(11) NOT NULL,
  `sidebar_right` int(11) NOT NULL,
  `sidebar_group_left` int(11) NOT NULL,
  `sidebar_group_right` int(11) NOT NULL,
  `sidebar_item_left` int(11) NOT NULL,
  `sidebar_item_right` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `service_setting`
--

INSERT INTO `service_setting` (`id`, `service_meta_title`, `service_meta_key`, `service_meta_desc`, `num_list`, `num_order_detail`, `lang`, `background`, `sidebar_left`, `sidebar_right`, `sidebar_group_left`, `sidebar_group_right`, `sidebar_item_left`, `sidebar_item_right`) VALUES
(1, 'Dịch vụ', '', '', 10, 5, 'vi', '', 0, 0, 0, 0, 0, 0),
(2, 'Service', '', '', 10, 10, 'en', '', 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sidebar`
--

CREATE TABLE IF NOT EXISTS `sidebar` (
`sidebar_id` int(10) unsigned NOT NULL,
  `title` varchar(250) NOT NULL,
  `list_widget` text NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sidebar`
--

INSERT INTO `sidebar` (`sidebar_id`, `title`, `list_widget`, `show_order`, `is_show`, `date_create`, `date_update`) VALUES
(1, 'sidebar right', '[widget_menu_group],[widget_fanpage_facebook width="242" height="300" colorscheme="light" show_faces="true" header="true" stream="false" show_border="true"]', 0, 1, 1423562525, 1423815612),
(2, 'sidebar group right', '[widget_banner group="bank"]', 0, 1, 1423792150, 1423822868),
(3, 'sidebar group right 2', '[widget_menu_item_2],[widget_banner]', 0, 1, 1423801982, 1423822899),
(4, 'test', '[widget_menu_group]', 0, 1, 1425443336, 1425443336);

-- --------------------------------------------------------

--
-- Table structure for table `statistic`
--

CREATE TABLE IF NOT EXISTS `statistic` (
`id` double NOT NULL,
  `session` varchar(32) NOT NULL,
  `date_log` varchar(150) NOT NULL DEFAULT '01-01-2000',
  `domain` varchar(250) NOT NULL,
  `web_link` varchar(1000) NOT NULL,
  `referrer_domain` varchar(250) NOT NULL,
  `referrer_link` varchar(1000) NOT NULL,
  `agent` varchar(250) NOT NULL,
  `browser` varchar(150) DEFAULT NULL,
  `ip` varchar(150) DEFAULT NULL,
  `os` varchar(150) DEFAULT NULL,
  `screen_width` int(11) NOT NULL,
  `screen_height` int(11) NOT NULL,
  `date_time` int(11) NOT NULL DEFAULT '0',
  `date_update` int(11) NOT NULL,
  `time_stay` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statistic`
--

INSERT INTO `statistic` (`id`, `session`, `date_log`, `domain`, `web_link`, `referrer_domain`, `referrer_link`, `agent`, `browser`, `ip`, `os`, `screen_width`, `screen_height`, `date_time`, `date_update`, `time_stay`) VALUES
(1, '42bb76e2907ee88beaeb19c5db497d04', '15/09/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1410789416, 1410789781, 365),
(2, '1bc6af041fb62ece2c9f7005c94b6247', '16/09/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1410857888, 1410859303, 1415),
(3, '1bc6af041fb62ece2c9f7005c94b6247', '16/09/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1410859339, 1410862997, 3658),
(4, '1bc6af041fb62ece2c9f7005c94b6247', '16/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1410863257, 1410863357, 100),
(5, 'c2dcff5db0da675a8390163b7bdda050', '17/09/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1410948854, 1410952198, 3344),
(6, 'c2dcff5db0da675a8390163b7bdda050', '17/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/gioi-thieu.html', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1410952205, 1410952779, 574),
(7, 'c2dcff5db0da675a8390163b7bdda050', '17/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/gioi-thieu.html', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1410952845, 1410952881, 36),
(8, 'c2dcff5db0da675a8390163b7bdda050', '17/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/gioi-thieu.html', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1410952889, 1410953559, 670),
(9, 'c2dcff5db0da675a8390163b7bdda050', '17/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/gioi-thieu.html', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1410953567, 1410953599, 32),
(10, 'c2dcff5db0da675a8390163b7bdda050', '17/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/gioi-thieu.html', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1410953612, 1410954937, 1325),
(11, 'c2dcff5db0da675a8390163b7bdda050', '17/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/gioi-thieu.html', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1410954944, 1410955236, 292),
(12, 'c2dcff5db0da675a8390163b7bdda050', '17/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/gioi-thieu.html', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1410955243, 1410956028, 785),
(13, 'c2dcff5db0da675a8390163b7bdda050', '17/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/gioi-thieu.html', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1410956036, 1410956726, 690),
(14, 'c2dcff5db0da675a8390163b7bdda050', '17/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/gioi-thieu.html', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1410956733, 1410958170, 1437),
(15, 'c2dcff5db0da675a8390163b7bdda050', '17/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/san-pham', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1410958178, 1410960184, 2006),
(16, 'c2dcff5db0da675a8390163b7bdda050', '17/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/san-pham//?p=2', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1410960193, 1410961766, 1573),
(17, '9b47b1a53325ead598e09850f3a96ac4', '18/09/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1411031557, 1411031621, 64),
(18, '9b47b1a53325ead598e09850f3a96ac4', '18/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/san-pham', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1411031628, 1411031744, 116),
(19, '9b47b1a53325ead598e09850f3a96ac4', '18/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/san-pham', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1411031751, 1411033077, 1326),
(20, '9b47b1a53325ead598e09850f3a96ac4', '18/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/gioi-thieu.html', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1411033084, 1411042693, 9609),
(21, '9b47b1a53325ead598e09850f3a96ac4', '18/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/gioi-thieu.html', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1411042701, 1411043632, 931),
(22, '9b47b1a53325ead598e09850f3a96ac4', '18/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/lien-he', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1411043639, 1411045140, 1501),
(23, '9b47b1a53325ead598e09850f3a96ac4', '18/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/lien-he', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1411045149, 1411045718, 569),
(24, '9b47b1a53325ead598e09850f3a96ac4', '18/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/lien-he', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1411045794, 1411046727, 933),
(25, '9b47b1a53325ead598e09850f3a96ac4', '18/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1411046745, 1411046745, 0),
(26, '9b47b1a53325ead598e09850f3a96ac4', '18/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1411046762, 1411047062, 300),
(27, '9b47b1a53325ead598e09850f3a96ac4', '18/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1411047069, 1411047555, 486),
(28, '9b47b1a53325ead598e09850f3a96ac4', '18/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1411047562, 1411048016, 454),
(29, '9b47b1a53325ead598e09850f3a96ac4', '18/09/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/go_thanh_cong/web/', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1468, 1101, 1411048025, 1411049191, 1166),
(30, 'afb75f90555b1a92cbaa111086bd089f', '19/09/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '127.0.0.1', 'Windows 7', 1024, 768, 1411125678, 1411130045, 4367),
(31, 'afb75f90555b1a92cbaa111086bd089f', '19/09/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '127.0.0.1', 'Windows 7', 1024, 768, 1411130704, 1411131232, 528),
(32, '174c588572594536b5c7c778657a7c77', '15/10/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1413365652, 1413367569, 1917),
(33, '23e1cb503ccee7a34643abbb6b8997c3', '07/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415342758, 1415352582, 9824),
(34, '23e1cb503ccee7a34643abbb6b8997c3', '07/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415352596, 1415352733, 137),
(35, '23e1cb503ccee7a34643abbb6b8997c3', '07/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415352748, 1415358115, 5367),
(36, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/bbgreen/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415582533, 1415585317, 2784),
(37, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/bbgreen/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415585330, 1415585452, 122),
(38, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/bbgreen/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415585496, 1415587138, 1642),
(39, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415587146, 1415587250, 104),
(40, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415587264, 1415587276, 12),
(41, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415587289, 1415587329, 40),
(42, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415587355, 1415587376, 21),
(43, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415587388, 1415587429, 41),
(44, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415587441, 1415587485, 44),
(45, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415587499, 1415587499, 0),
(46, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415587512, 1415587516, 4),
(47, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415587530, 1415587546, 16),
(48, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415587558, 1415587578, 20),
(49, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415587592, 1415587657, 65),
(50, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415587668, 1415587792, 124),
(51, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415587806, 1415587826, 20),
(52, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415587840, 1415587848, 8),
(53, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415587861, 1415587869, 8),
(54, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415587883, 1415587895, 12),
(55, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415587909, 1415588008, 99),
(56, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415588021, 1415589799, 1778),
(57, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415589811, 1415589859, 48),
(58, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415589877, 1415590261, 384),
(59, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415590275, 1415590335, 60),
(60, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415590348, 1415590404, 56),
(61, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415590428, 1415590508, 80),
(62, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415590520, 1415590541, 21),
(63, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415590552, 1415590572, 20),
(64, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415590586, 1415590610, 24),
(65, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415590623, 1415590675, 52),
(66, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415590688, 1415592859, 2171),
(67, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415592873, 1415592929, 56),
(68, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415592942, 1415592994, 52),
(69, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415593009, 1415593218, 209),
(70, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415593230, 1415593466, 236),
(71, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415593481, 1415593577, 96),
(72, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415593589, 1415593592, 3),
(73, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415593606, 1415593646, 40),
(74, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415593658, 1415593694, 36),
(75, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415593707, 1415593723, 16),
(76, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415593738, 1415593842, 104),
(77, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415593855, 1415593863, 8),
(78, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415593877, 1415594401, 524),
(79, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415594430, 1415595046, 616),
(80, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415595060, 1415595237, 177),
(81, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415595249, 1415595289, 40),
(82, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415595303, 1415595600, 297),
(83, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415595614, 1415595739, 125),
(84, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415595849, 1415597554, 1705),
(85, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415601447, 1415601675, 228),
(86, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415601684, 1415616223, 14539),
(87, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415619991, 1415620304, 313),
(88, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/bbgreen/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415620313, 1415621929, 1616),
(89, '5afbd996f46cb711c95ca4affb7562d2', '10/11/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/bbgreen/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415621943, 1415624422, 2479),
(90, 'e372e1e86aa5af5e822cbc76f9f7b1fe', '11/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415675082, 1415675466, 384),
(91, '9cfac031101d2416ac03bac00a09a325', '11/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415676089, 1415677472, 1383),
(92, '9cfac031101d2416ac03bac00a09a325', '11/11/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/bbgreen/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415677479, 1415681381, 3902),
(93, '9cfac031101d2416ac03bac00a09a325', '11/11/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/bbgreen/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415681388, 1415681742, 354),
(94, '9cfac031101d2416ac03bac00a09a325', '11/11/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/bbgreen/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415681750, 1415681772, 22),
(95, '9cfac031101d2416ac03bac00a09a325', '11/11/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/bbgreen/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415681779, 1415683881, 2102),
(96, '9cfac031101d2416ac03bac00a09a325', '11/11/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/bbgreen/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415687497, 1415692908, 5411),
(97, '9cfac031101d2416ac03bac00a09a325', '11/11/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/bbgreen/web/ao-bo-chat-lieu-vai-tre-bamboo-hinh-quy-nho-cute-va-coom-1.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1415692919, 1415698402, 5483),
(98, '1a1bfb9a6f022b86b9388db4cfe85ab7', '13/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '127.0.0.1', 'Windows 7', 1024, 768, 1415844663, 1415846988, 2325),
(99, '1a1bfb9a6f022b86b9388db4cfe85ab7', '13/11/2014', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/bbgreen/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '127.0.0.1', 'Windows 7', 1024, 768, 1415846996, 1415854731, 7735),
(100, 'c69a1aacbf5812a8f55f8936d5a4ad0e', '19/11/2014', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1416390732, 1416391036, 304),
(101, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420618508, 1420618597, 89),
(102, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420618605, 1420619210, 605),
(103, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420619268, 1420619284, 16),
(104, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420619334, 1420619366, 32),
(105, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420619445, 1420619475, 30),
(106, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420619503, 1420619755, 252),
(107, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420619905, 1420619989, 84),
(108, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420619997, 1420620136, 139),
(109, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420620480, 1420620496, 16),
(110, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420620503, 1420620653, 150),
(111, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420620661, 1420620673, 12),
(112, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420620680, 1420620953, 273),
(113, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420620960, 1420621019, 59),
(114, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420621061, 1420621151, 90),
(115, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420621158, 1420621180, 22),
(116, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420621188, 1420621249, 61),
(117, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420621378, 1420621386, 8),
(118, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420621393, 1420621403, 10),
(119, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420621411, 1420621816, 405),
(120, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420621824, 1420621824, 0),
(121, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420621831, 1420621991, 160),
(122, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420621998, 1420621998, 0),
(123, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420622005, 1420622039, 34),
(124, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420622055, 1420622059, 4),
(125, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420622066, 1420622072, 6),
(126, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420622082, 1420622124, 42),
(127, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420622131, 1420622142, 11),
(128, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420622153, 1420622177, 24),
(129, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420622185, 1420622267, 82),
(130, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420622274, 1420622280, 6),
(131, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420622287, 1420622296, 9),
(132, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420622303, 1420622412, 109),
(133, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420622420, 1420622873, 453),
(134, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/quan-ao-be-gai/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420622880, 1420624566, 1686),
(135, '5b750cd70075aec008de197b9272391c', '07/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/quan-ao-be-gai/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420624575, 1420627242, 2667),
(136, '45e21acb8a9b1326d14123987c20fb66', '09/01/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420785708, 1420785708, 0),
(137, '45e21acb8a9b1326d14123987c20fb66', '09/01/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420785715, 1420785768, 53),
(138, '45e21acb8a9b1326d14123987c20fb66', '09/01/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420785775, 1420789939, 4164),
(139, '45e21acb8a9b1326d14123987c20fb66', '09/01/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420790535, 1420794883, 4348),
(140, '45e21acb8a9b1326d14123987c20fb66', '09/01/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1420794892, 1420800274, 5382),
(141, 'e84cb027c2e07a4c561afca9cf8db69a', '14/01/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421222494, 1421223435, 941),
(142, 'e84cb027c2e07a4c561afca9cf8db69a', '14/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421223645, 1421228271, 4626),
(143, 'e84cb027c2e07a4c561afca9cf8db69a', '14/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/ten-mien', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421228278, 1421230800, 2522),
(144, 'e84cb027c2e07a4c561afca9cf8db69a', '14/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/ten-mien', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421230810, 1421232105, 1295),
(145, 'e84cb027c2e07a4c561afca9cf8db69a', '15/01/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421285459, 1421285459, 0),
(146, 'e84cb027c2e07a4c561afca9cf8db69a', '15/01/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421285466, 1421285487, 21),
(147, 'e84cb027c2e07a4c561afca9cf8db69a', '15/01/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421286419, 1421290196, 3777),
(148, 'e84cb027c2e07a4c561afca9cf8db69a', '15/01/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421290204, 1421299720, 9516),
(149, 'e84cb027c2e07a4c561afca9cf8db69a', '15/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/phan-mem', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421303605, 1421310314, 6709),
(150, 'e84cb027c2e07a4c561afca9cf8db69a', '15/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/phan-mem', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421310356, 1421310372, 16),
(151, 'e84cb027c2e07a4c561afca9cf8db69a', '15/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/phan-mem', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421310379, 1421310499, 120),
(152, 'e84cb027c2e07a4c561afca9cf8db69a', '15/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/phan-mem', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421310703, 1421310873, 170),
(153, 'e84cb027c2e07a4c561afca9cf8db69a', '15/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/phan-mem', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421310880, 1421312765, 1885),
(154, 'e84cb027c2e07a4c561afca9cf8db69a', '15/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/phan-mem', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421312772, 1421316494, 3722),
(155, 'e84cb027c2e07a4c561afca9cf8db69a', '15/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/phan-mem', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421316519, 1421316852, 333),
(156, 'e84cb027c2e07a4c561afca9cf8db69a', '15/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/phan-mem', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421316879, 1421316912, 33),
(157, 'e84cb027c2e07a4c561afca9cf8db69a', '15/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/phan-mem', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421316941, 1421318499, 1558),
(158, 'e84cb027c2e07a4c561afca9cf8db69a', '15/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/phan-mem', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421318991, 1421319047, 56),
(159, 'e84cb027c2e07a4c561afca9cf8db69a', '15/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/phan-mem', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421319163, 1421319195, 32),
(160, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421378299, 1421378596, 297),
(161, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-web-mobile.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421378883, 1421382498, 3615),
(162, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-web-mobile.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421382637, 1421382641, 4),
(163, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-web-mobile.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421382648, 1421382652, 4),
(164, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-web-mobile.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421382659, 1421382685, 26),
(165, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-web-mobile.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421382698, 1421382698, 0),
(166, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-web-mobile.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421382705, 1421382777, 72),
(167, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-web-mobile.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421382785, 1421383114, 329),
(168, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-web-mobile.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421383121, 1421383407, 286),
(169, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-web-mobile.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421383414, 1421386195, 2781),
(170, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-web-mobile.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421386235, 1421386847, 612),
(171, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-web-mobile.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421390058, 1421392488, 2430),
(172, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-web-mobile.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421392499, 1421393036, 537),
(173, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-web-mobile.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421393043, 1421393043, 0),
(174, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-web-mobile.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421393051, 1421393083, 32),
(175, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-web-mobile.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421393095, 1421393095, 0),
(176, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/phan-mem/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421393107, 1421393300, 193),
(177, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/phan-mem/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421393307, 1421393343, 36),
(178, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/phan-mem/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421393350, 1421393768, 418),
(179, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/phan-mem/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421393804, 1421403499, 9695),
(180, 'c67619df1cc746fd97f7f846b95d0ef2', '16/01/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36', 'Chrome', '::1', 'Windows 7', 1024, 768, 1421400283, 1421405158, 4875),
(181, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-website/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421403625, 1421404668, 1043),
(182, 'e84cb027c2e07a4c561afca9cf8db69a', '16/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-website/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421404689, 1421405157, 468),
(183, 'e84cb027c2e07a4c561afca9cf8db69a', '19/01/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421634639, 1421636541, 1902),
(184, 'e84cb027c2e07a4c561afca9cf8db69a', '19/01/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421638375, 1421645685, 7310),
(185, 'e84cb027c2e07a4c561afca9cf8db69a', '19/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-web-mobile.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421649464, 1421653104, 3640);
INSERT INTO `statistic` (`id`, `session`, `date_log`, `domain`, `web_link`, `referrer_domain`, `referrer_link`, `agent`, `browser`, `ip`, `os`, `screen_width`, `screen_height`, `date_time`, `date_update`, `time_stay`) VALUES
(186, 'e84cb027c2e07a4c561afca9cf8db69a', '19/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-web-mobile.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421653163, 1421653457, 294),
(187, 'e84cb027c2e07a4c561afca9cf8db69a', '19/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-web-mobile.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421653663, 1421658918, 5255),
(188, 'e84cb027c2e07a4c561afca9cf8db69a', '19/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-web-mobile.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421659032, 1421662466, 3434),
(189, 'e84cb027c2e07a4c561afca9cf8db69a', '19/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/thiet-ke-web-mobile.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421662561, 1421663110, 549),
(190, 'e84cb027c2e07a4c561afca9cf8db69a', '19/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/trang-chu/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421663117, 1421664001, 884),
(191, 'e84cb027c2e07a4c561afca9cf8db69a', '19/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/trang-chu/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421664008, 1421664290, 282),
(192, 'e84cb027c2e07a4c561afca9cf8db69a', '20/01/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421717671, 1421717671, 0),
(193, 'e84cb027c2e07a4c561afca9cf8db69a', '20/01/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421717679, 1421721212, 3533),
(194, 'e84cb027c2e07a4c561afca9cf8db69a', '20/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421721225, 1421726825, 5600),
(195, 'e84cb027c2e07a4c561afca9cf8db69a', '20/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/du-an', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421726835, 1421728006, 1171),
(196, 'e84cb027c2e07a4c561afca9cf8db69a', '20/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/du-an//?p=2', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421728014, 1421732277, 4263),
(197, 'e84cb027c2e07a4c561afca9cf8db69a', '20/01/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/imsvietnamese/web/du-an/?p=1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1421735491, 1421745974, 10483),
(198, 'fc2f3cda0d364f477e7c4b92b5d61cb6', '03/02/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1422953032, 1422953273, 241),
(199, 'fc2f3cda0d364f477e7c4b92b5d61cb6', '03/02/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1422953433, 1422953441, 8),
(200, 'fc2f3cda0d364f477e7c4b92b5d61cb6', '03/02/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1422953509, 1422953576, 67),
(201, 'fc2f3cda0d364f477e7c4b92b5d61cb6', '03/02/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms/web/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1422953583, 1422954367, 784),
(202, 'f2b1618d2714bae2e29c9eeb772e2383', '04/03/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1425462409, 1425462435, 26),
(203, 'f2b1618d2714bae2e29c9eeb772e2383', '04/03/2015', 'localhost', 'localhost', 'localhost_hiep', 'http://localhost/hiep/hiepcms2_1/web/lien-he/?is_admin=admin', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1425462442, 1425465824, 3382),
(204, 'f2b1618d2714bae2e29c9eeb772e2383', '05/03/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1425519182, 1425519182, 0),
(205, 'f2b1618d2714bae2e29c9eeb772e2383', '05/03/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1425519189, 1425519428, 239),
(206, 'f2b1618d2714bae2e29c9eeb772e2383', '05/03/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1425519461, 1425520418, 957),
(207, 'f2b1618d2714bae2e29c9eeb772e2383', '05/03/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1425520430, 1425522888, 2458),
(208, '35f82114b167da4fa04e35eb04e661c5', '06/03/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1425610330, 1425611287, 957),
(209, 'd348d592f925e0893f81993e7505d80a', '27/06/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', 'Chrome', '::1', 'UnKnown', 1366, 768, 1435406772, 1435407282, 510),
(210, 'f0dda06993451aa91c61a437c249af86', '30/06/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', 'Chrome', '::1', 'UnKnown', 1366, 768, 1435667054, 1435667121, 67);

-- --------------------------------------------------------

--
-- Table structure for table `support`
--

CREATE TABLE IF NOT EXISTS `support` (
`id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `yahoo` varchar(250) NOT NULL,
  `skype` varchar(250) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `template_email`
--

CREATE TABLE IF NOT EXISTS `template_email` (
`id` int(10) unsigned NOT NULL,
  `template_id` varchar(50) NOT NULL,
  `title` varchar(250) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(2) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `template_email`
--

INSERT INTO `template_email` (`id`, `template_id`, `title`, `subject`, `content`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 'ordering-complete', 'Xác nhận đặt hàng thành công !', 'Xác nhận đặt hàng thành công !', '&lt;p style=&quot;text-align: left;&quot;&gt;&lt;span style=&quot;font-size: 12pt; color: #000000;&quot;&gt;Cảm ơn qu&amp;yacute; kh&amp;aacute;ch đ&amp;atilde; quan t&amp;acirc;m v&amp;agrave; đặt h&amp;agrave;ng tại c&amp;ocirc;ng ty ch&amp;uacute;ng t&amp;ocirc;i.&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;text-align: left;&quot;&gt;&lt;span style=&quot;font-size: 12pt; color: #000000;&quot;&gt;Đơn h&amp;agrave;ng của qu&amp;yacute; kh&amp;aacute;ch sẽ được xử l&amp;yacute; trong thời gian sớm nhất.&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;text-align: left;&quot;&gt;&lt;span style=&quot;font-size: 12pt; color: #000000;&quot;&gt;Shop sẽ li&amp;ecirc;n lạc với bạn để x&amp;aacute;c nhận đơn h&amp;agrave;ng qua số điện thoại đ&amp;atilde; đăng k&amp;yacute; trong 24h!&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Danh s&amp;aacute;ch đơn h&amp;agrave;ng&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;{list_cart}&lt;/p&gt;\r\n&lt;table class=&quot;cart_table&quot; style=&quot;background: #dbdbdb;&quot; border=&quot;0&quot; width=&quot;100%&quot; cellspacing=&quot;1&quot; cellpadding=&quot;2&quot;&gt;\r\n&lt;tbody&gt;\r\n&lt;tr&gt;&lt;th class=&quot;col&quot; style=&quot;font-weight: bold; background: #efefef; text-align: center; color: #800080;&quot; colspan=&quot;2&quot;&gt;&lt;span style=&quot;color: #000000;&quot;&gt;Th&amp;ocirc;ng tin đặt h&amp;agrave;ng&lt;/span&gt;&lt;/th&gt;&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: none repeat scroll 0% 0% #ffffff; width: 30%;&quot;&gt;&lt;strong&gt;&lt;strong&gt;Họ v&amp;agrave; t&amp;ecirc;n:&lt;/strong&gt;&lt;/strong&gt;&lt;/td&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: #ffffff;&quot;&gt;{o_full_name}&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: none repeat scroll 0% 0% #ffffff; width: 30%;&quot;&gt;&lt;strong&gt;Email :&lt;/strong&gt;&lt;/td&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: #ffffff;&quot;&gt;{o_email}&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: none repeat scroll 0% 0% #ffffff; width: 30%;&quot;&gt;&lt;strong&gt;&lt;strong&gt;Điện thoại :&lt;/strong&gt;&lt;/strong&gt;&lt;/td&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: #ffffff;&quot;&gt;{o_phone}&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: none repeat scroll 0% 0% #ffffff; width: 30%;&quot;&gt;&lt;strong&gt;&lt;strong&gt;Địa chỉ cụ thể:&lt;/strong&gt;&lt;/strong&gt;&lt;/td&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: #ffffff;&quot;&gt;{o_full_address}&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;table class=&quot;cart_table&quot; style=&quot;background: #dbdbdb;&quot; border=&quot;0&quot; width=&quot;100%&quot; cellspacing=&quot;1&quot; cellpadding=&quot;2&quot;&gt;\r\n&lt;tbody&gt;\r\n&lt;tr&gt;&lt;th class=&quot;col&quot; style=&quot;font-weight: bold; background: #efefef; text-align: center; color: #800080;&quot; colspan=&quot;2&quot;&gt;&lt;span style=&quot;color: #000000;&quot;&gt;Th&amp;ocirc;ng tin nhận h&amp;agrave;ng&lt;/span&gt;&lt;/th&gt;&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: none repeat scroll 0% 0% #ffffff; width: 30%;&quot;&gt;&lt;strong&gt;&lt;strong&gt;&lt;strong&gt;Họ v&amp;agrave; t&amp;ecirc;n:&lt;/strong&gt;&lt;/strong&gt;&lt;/strong&gt;&lt;/td&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: #ffffff;&quot;&gt;{d_full_name}&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: none repeat scroll 0% 0% #ffffff; width: 30%;&quot;&gt;&lt;strong&gt;Email :&lt;/strong&gt;&lt;/td&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: #ffffff;&quot;&gt;{d_email}&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: none repeat scroll 0% 0% #ffffff; width: 30%;&quot;&gt;&lt;strong&gt;&lt;strong&gt;&lt;strong&gt;Điện thoại :&lt;/strong&gt;&lt;/strong&gt;&lt;/strong&gt;&lt;/td&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: #ffffff;&quot;&gt;{d_phone}&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: none repeat scroll 0% 0% #ffffff; width: 30%;&quot;&gt;&lt;strong&gt;&lt;strong&gt;&lt;strong&gt;Địa chỉ cụ thể:&lt;/strong&gt;&lt;/strong&gt;&lt;/strong&gt;&lt;/td&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: #ffffff;&quot;&gt;{d_full_address}&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;p&gt;&lt;strong&gt;Phương thức thanh to&amp;aacute;n:&lt;/strong&gt; {method}&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Y&amp;ecirc;u cầu kh&amp;aacute;c:&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;{request_more}&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;M&amp;atilde; đơn h&amp;agrave;ng:&lt;/strong&gt; {order_code}&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Ng&amp;agrave;y đặt:&lt;/strong&gt; {date_create}&lt;/p&gt;', 0, 1, 1396639333, 1408092319, 'vi'),
(2, 'admin-ordering-complete', 'Gửi cho admin khi có đặt hàng', 'Có đơn đặt hàng mới', '&lt;p&gt;C&amp;oacute; đơn h&amp;agrave;ng mới&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Danh s&amp;aacute;ch đơn h&amp;agrave;ng&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;{list_cart}&lt;/p&gt;\r\n&lt;table class=&quot;cart_table&quot; style=&quot;background: #dbdbdb;&quot; border=&quot;0&quot; width=&quot;100%&quot; cellspacing=&quot;1&quot; cellpadding=&quot;2&quot;&gt;\r\n&lt;tbody&gt;\r\n&lt;tr&gt;&lt;th class=&quot;col&quot; style=&quot;font-weight: bold; background: #efefef; text-align: center; color: #800080;&quot; colspan=&quot;2&quot;&gt;&lt;span style=&quot;color: #000000;&quot;&gt;Th&amp;ocirc;ng tin đặt h&amp;agrave;ng&lt;/span&gt;&lt;/th&gt;&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: none repeat scroll 0% 0% #ffffff; width: 30%;&quot;&gt;&lt;strong&gt;&lt;strong&gt;Họ v&amp;agrave; t&amp;ecirc;n:&lt;/strong&gt;&lt;/strong&gt;&lt;/td&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: #ffffff;&quot;&gt;{o_full_name}&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: none repeat scroll 0% 0% #ffffff; width: 30%;&quot;&gt;&lt;strong&gt;Email :&lt;/strong&gt;&lt;/td&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: #ffffff;&quot;&gt;{o_email}&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: none repeat scroll 0% 0% #ffffff; width: 30%;&quot;&gt;&lt;strong&gt;&lt;strong&gt;Điện thoại :&lt;/strong&gt;&lt;/strong&gt;&lt;/td&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: #ffffff;&quot;&gt;{o_phone}&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: none repeat scroll 0% 0% #ffffff; width: 30%;&quot;&gt;&lt;strong&gt;&lt;strong&gt;Địa chỉ cụ thể:&lt;/strong&gt;&lt;/strong&gt;&lt;/td&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: #ffffff;&quot;&gt;{o_full_address}&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;table class=&quot;cart_table&quot; style=&quot;background: #dbdbdb;&quot; border=&quot;0&quot; width=&quot;100%&quot; cellspacing=&quot;1&quot; cellpadding=&quot;2&quot;&gt;\r\n&lt;tbody&gt;\r\n&lt;tr&gt;&lt;th class=&quot;col&quot; style=&quot;font-weight: bold; background: #efefef; text-align: center; color: #800080;&quot; colspan=&quot;2&quot;&gt;&lt;span style=&quot;color: #000000;&quot;&gt;Th&amp;ocirc;ng tin nhận h&amp;agrave;ng&lt;/span&gt;&lt;/th&gt;&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: none repeat scroll 0% 0% #ffffff; width: 30%;&quot;&gt;&lt;strong&gt;&lt;strong&gt;&lt;strong&gt;Họ v&amp;agrave; t&amp;ecirc;n:&lt;/strong&gt;&lt;/strong&gt;&lt;/strong&gt;&lt;/td&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: #ffffff;&quot;&gt;{d_full_name}&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: none repeat scroll 0% 0% #ffffff; width: 30%;&quot;&gt;&lt;strong&gt;Email :&lt;/strong&gt;&lt;/td&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: #ffffff;&quot;&gt;{d_email}&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: none repeat scroll 0% 0% #ffffff; width: 30%;&quot;&gt;&lt;strong&gt;&lt;strong&gt;&lt;strong&gt;Điện thoại :&lt;/strong&gt;&lt;/strong&gt;&lt;/strong&gt;&lt;/td&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: #ffffff;&quot;&gt;{d_phone}&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: none repeat scroll 0% 0% #ffffff; width: 30%;&quot;&gt;&lt;strong&gt;&lt;strong&gt;&lt;strong&gt;Địa chỉ cụ thể:&lt;/strong&gt;&lt;/strong&gt;&lt;/strong&gt;&lt;/td&gt;\r\n&lt;td class=&quot;col&quot; style=&quot;background: #ffffff;&quot;&gt;{d_full_address}&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;p&gt;&lt;strong&gt;Phương thức thanh to&amp;aacute;n:&lt;/strong&gt; {method}&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Y&amp;ecirc;u cầu kh&amp;aacute;c:&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;{request_more}&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;M&amp;atilde; đơn h&amp;agrave;ng:&lt;/strong&gt; {order_code}&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Ng&amp;agrave;y đặt:&lt;/strong&gt; {date_create}&lt;/p&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;', 0, 1, 1396641238, 1408092333, 'vi'),
(5, 'signup', 'Đăng ký', 'Đăng ký', '&lt;p&gt;Ch&amp;agrave;o mừng {nickname} đến với ch&amp;uacute;ng t&amp;ocirc;i&lt;/p&gt;\r\n&lt;p&gt;Th&amp;ocirc;ng tin t&amp;agrave;i khoản:&lt;/p&gt;\r\n&lt;p&gt;T&amp;ecirc;n đăng nhập: {username}&lt;/p&gt;\r\n&lt;p&gt;Mật khẩu: {password}&lt;/p&gt;\r\n&lt;p&gt;Vui l&amp;ograve;ng click v&amp;agrave;o link b&amp;ecirc;n dưới để k&amp;iacute;ch hoạt t&amp;agrave;i khoản:&lt;/p&gt;\r\n&lt;p&gt;{link_active}&lt;/p&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;', 0, 1, 1403170748, 1403170748, 'vi'),
(7, 'forget-pass', 'Quên mật khẩu', 'Lấy lại mật khẩu', '&lt;p&gt;Vui l&amp;ograve;ng click v&amp;agrave;o link b&amp;ecirc;n dưới để k&amp;iacute;ch hoạt mật khẩu mới&lt;/p&gt;\r\n&lt;p&gt;mật khẩu mới: &lt;span style=&quot;color: #ff6600;&quot;&gt;&lt;strong&gt;[new_pass]&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;[link_forget_pass]&lt;/p&gt;', 0, 1, 1403774097, 1403774097, 'vi'),
(8, 'admin-contact', 'Gửi cho admin khi có liên hệ mới', 'Thông tin liên hệ của {domain}', '&lt;p&gt;C&amp;oacute; li&amp;ecirc;n hệ mới!&lt;/p&gt;\r\n&lt;p&gt;Th&amp;ocirc;ng tin người gửi:&lt;/p&gt;\r\n&lt;p&gt;Fullname: {full_name}&lt;/p&gt;\r\n&lt;p&gt;Email: {email}&lt;/p&gt;\r\n&lt;p&gt;Address: {address}&lt;/p&gt;\r\n&lt;p&gt;Phone: {phone}&lt;/p&gt;\r\n&lt;p&gt;Title: {title}&lt;/p&gt;\r\n&lt;p&gt;Content: {content}&lt;/p&gt;\r\n&lt;p&gt;Date: {date_create}&lt;/p&gt;', 0, 1, 1404957670, 1404957670, 'vi'),
(9, 'contact', 'Thông báo cho người liên hệ', '{domain} đã nhận được email liên hệ từ bạn', '&lt;p&gt;Cảm ơn bạn đ&amp;atilde; g&amp;oacute;p &amp;yacute; cho trang web ch&amp;uacute;ng t&amp;ocirc;i!&lt;/p&gt;\r\n&lt;p&gt;Ch&amp;uacute;ng t&amp;ocirc;i sẽ phản hồi lại cho bạn trong thời gian sớm nhất!&lt;/p&gt;', 0, 1, 1404957870, 1404957870, 'vi'),
(12, 'send-email', 'Mẫu email thông báo quảng cáo', 'Thông tin quảng cáo', '&lt;h1&gt;&lt;img src=&quot;http://www.demo.giaiphapnhanh.com.vn/hiep/dambau/uploads/config/template_email/logo.png&quot; alt=&quot;&quot; width=&quot;234&quot; height=&quot;152&quot; /&gt;&lt;/h1&gt;\r\n&lt;table border=&quot;0&quot; width=&quot;100%&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; bgcolor=&quot;#800080&quot;&gt;\r\n&lt;tbody&gt;\r\n&lt;tr&gt;\r\n&lt;td style=&quot;padding: 8px 0;&quot; align=&quot;center&quot; valign=&quot;top&quot;&gt;\r\n&lt;table border=&quot;0&quot; width=&quot;550&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot;&gt;\r\n&lt;tbody&gt;\r\n&lt;tr&gt;\r\n&lt;td align=&quot;left&quot; width=&quot;650&quot;&gt;\r\n&lt;h1 style=&quot;font-style: italic; margin: 0; padding: 0; font-family: Georgia, times new roman, serif; font-size: 17px; font-weight: normal; color: white;&quot;&gt;Th&amp;ocirc;ng tin quản c&amp;aacute;o&lt;/h1&gt;\r\n&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;table border=&quot;0&quot; width=&quot;100%&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot;&gt;\r\n&lt;tbody&gt;\r\n&lt;tr&gt;\r\n&lt;td style=&quot;padding: 20px 0 20px 0;&quot; align=&quot;center&quot; valign=&quot;top&quot;&gt;\r\n&lt;table style=&quot;border: 1px solid #E0E0E0;&quot; border=&quot;0&quot; width=&quot;550&quot; cellspacing=&quot;0&quot; cellpadding=&quot;10&quot; bgcolor=&quot;#FFFFFF&quot;&gt;\r\n&lt;tbody&gt;\r\n&lt;tr&gt;\r\n&lt;td&gt;\r\n&lt;p&gt;Nội dung quảng c&amp;aacute;o!&lt;/p&gt;\r\n&lt;p&gt;Nội dung quảng c&amp;aacute;o!&lt;/p&gt;\r\n&lt;p&gt;Nội dung quảng c&amp;aacute;o!&lt;/p&gt;\r\n&lt;p&gt;Nội dung quảng c&amp;aacute;o!&lt;/p&gt;\r\n&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td&gt;\r\n&lt;p&gt;The Seraphine Team&lt;br /&gt; &lt;a href=&quot;http://www.momybaby.com&quot;&gt;www.momybaby.com&lt;/a&gt;&lt;br /&gt; Tel&lt;/p&gt;\r\n&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;p style=&quot;font-size: 10px;&quot;&gt;Copyright &amp;copy; Mummy &amp;amp; Baby | All Rights Reserved&lt;/p&gt;', 0, 1, 1406017663, 1406868077, 'vi');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`user_id` int(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(50) NOT NULL,
  `session` varchar(50) NOT NULL,
  `date_login` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `nickname` varchar(250) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `fax` varchar(250) NOT NULL,
  `mobile` varchar(250) NOT NULL,
  `area` varchar(250) NOT NULL,
  `country` varchar(250) NOT NULL,
  `province` varchar(250) NOT NULL,
  `district` varchar(250) NOT NULL,
  `ward` varchar(250) NOT NULL,
  `address` varchar(250) NOT NULL,
  `arr_address_book` text NOT NULL,
  `user_code` varchar(50) NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(2) NOT NULL DEFAULT '0',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_setting`
--

CREATE TABLE IF NOT EXISTS `user_setting` (
`id` int(11) NOT NULL,
  `welcome` text NOT NULL,
  `user_meta_title` varchar(250) NOT NULL,
  `user_meta_key` text NOT NULL,
  `user_meta_desc` text NOT NULL,
  `signup_link` varchar(250) NOT NULL,
  `signup_meta_title` varchar(250) NOT NULL,
  `signup_meta_key` text NOT NULL,
  `signup_meta_desc` text NOT NULL,
  `signin_link` varchar(250) NOT NULL,
  `signin_meta_title` varchar(250) NOT NULL,
  `signin_meta_key` text NOT NULL,
  `signin_meta_desc` text NOT NULL,
  `account_link` varchar(250) NOT NULL,
  `account_meta_title` varchar(250) NOT NULL,
  `account_meta_key` text NOT NULL,
  `account_meta_desc` text NOT NULL,
  `address_book_link` varchar(250) NOT NULL,
  `address_book_meta_title` varchar(250) NOT NULL,
  `address_book_meta_key` text NOT NULL,
  `address_book_meta_desc` text NOT NULL,
  `change_pass_link` varchar(250) NOT NULL,
  `change_pass_meta_title` varchar(250) NOT NULL,
  `change_pass_meta_key` text NOT NULL,
  `change_pass_meta_desc` text NOT NULL,
  `forget_pass_link` varchar(250) NOT NULL,
  `forget_pass_meta_title` varchar(250) NOT NULL,
  `forget_pass_meta_key` text NOT NULL,
  `forget_pass_meta_desc` text NOT NULL,
  `active_link` varchar(250) NOT NULL,
  `active_meta_title` varchar(250) NOT NULL,
  `active_meta_key` text NOT NULL,
  `active_meta_desc` text NOT NULL,
  `ordering_link` varchar(250) NOT NULL,
  `ordering_meta_title` varchar(250) NOT NULL,
  `ordering_meta_key` text NOT NULL,
  `ordering_meta_desc` text NOT NULL,
  `promotion_link` varchar(250) NOT NULL,
  `promotion_meta_title` varchar(250) NOT NULL,
  `promotion_meta_key` text NOT NULL,
  `promotion_meta_desc` text NOT NULL,
  `voucher_link` varchar(250) NOT NULL,
  `voucher_meta_title` varchar(250) NOT NULL,
  `voucher_meta_key` text NOT NULL,
  `voucher_meta_desc` text NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_setting`
--

INSERT INTO `user_setting` (`id`, `welcome`, `user_meta_title`, `user_meta_key`, `user_meta_desc`, `signup_link`, `signup_meta_title`, `signup_meta_key`, `signup_meta_desc`, `signin_link`, `signin_meta_title`, `signin_meta_key`, `signin_meta_desc`, `account_link`, `account_meta_title`, `account_meta_key`, `account_meta_desc`, `address_book_link`, `address_book_meta_title`, `address_book_meta_key`, `address_book_meta_desc`, `change_pass_link`, `change_pass_meta_title`, `change_pass_meta_key`, `change_pass_meta_desc`, `forget_pass_link`, `forget_pass_meta_title`, `forget_pass_meta_key`, `forget_pass_meta_desc`, `active_link`, `active_meta_title`, `active_meta_key`, `active_meta_desc`, `ordering_link`, `ordering_meta_title`, `ordering_meta_key`, `ordering_meta_desc`, `promotion_link`, `promotion_meta_title`, `promotion_meta_key`, `promotion_meta_desc`, `voucher_link`, `voucher_meta_title`, `voucher_meta_key`, `voucher_meta_desc`, `num_list`, `lang`) VALUES
(1, '&lt;p&gt;Xin ch&amp;agrave;o {nickname}:&lt;/p&gt;', 'Tài khoản thành viên', '', '', 'dang-ky', 'Đăng ký', '', '', 'dang-nhap', 'Đăng nhập', '', '', 'thong-tin-tai-khoan', 'Thông tin tài khoản', '', '', 'thong-tin-mua-hang', 'Thông tin mua hàng', '', '', 'doi-mat-khau', 'Đổi mật khẩu', '', '', 'quen-mat-khau', 'Quên mật khẩu', '', '', 'kich-hoat-tai-khoan', 'Kích hoạt tài khoản', '', '', 'don-hang', 'Đơn hàng', '', '', 'promotion-code', 'promotion code', '', '', 'voucher', 'voucher', '', '', 10, 'vi'),
(2, '', 'aboutus', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'brand', 'Brand', '', '', '', '', '', '', 'cart', '', '', '', '', '', '', '', '', '', '', '', 10, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE IF NOT EXISTS `video` (
`id` int(10) unsigned NOT NULL,
  `item_id` int(11) NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `group_nav` text NOT NULL,
  `group_related` text NOT NULL,
  `picture` varchar(250) NOT NULL,
  `video_type` varchar(50) NOT NULL DEFAULT 'youtube_url',
  `video` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `is_focus` tinyint(2) NOT NULL DEFAULT '0',
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id`, `item_id`, `group_id`, `group_nav`, `group_related`, `picture`, `video_type`, `video`, `title`, `short`, `content`, `friendly_link`, `meta_title`, `meta_key`, `meta_desc`, `is_focus`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, 1, '1', '1', '', 'youtube_url', 'https://www.youtube.com/watch?v=fOJN_SQF59w', 'THI CÔNG XÂY DỰNG', '&lt;p&gt;asdasdas&lt;/p&gt;', '&lt;p&gt;asdasda&lt;/p&gt;', 'thi-cong-xay-dung', 'THI CÔNG XÂY DỰNG | THI CONG XAY DUNG', 'THI CÔNG XÂY DỰNG, THI CONG XAY DUNG', 'asdasda', 0, 0, 1, 1425440822, 1425440822, 'vi'),
(2, 1, 1, '1', '1', '', 'youtube_url', 'https://www.youtube.com/watch?v=fOJN_SQF59w', 'THI CÔNG XÂY DỰNG', '&lt;p&gt;asdasdas&lt;/p&gt;', '&lt;p&gt;asdasda&lt;/p&gt;', 'thi-cong-xay-dung-1', 'THI CÔNG XÂY DỰNG | THI CONG XAY DUNG', 'THI CÔNG XÂY DỰNG, THI CONG XAY DUNG', 'asdasda', 0, 0, 1, 1425440822, 1425440822, 'en'),
(3, 3, 1, '1', '1', 'video/2015_03/0_17aafe142adff37175e72f6dfd14da39.jpg', 'youtube_url', 'https://www.youtube.com/watch?v=fOJN_SQF59w', 'THI CÔNG XÂY DỰNG', '&lt;p&gt;asdasdas&lt;/p&gt;', '&lt;p&gt;asdasda&lt;/p&gt;', 'thi-cong-xay-dung-2', 'THI CÔNG XÂY DỰNG | THI CONG XAY DUNG', 'THI CÔNG XÂY DỰNG, THI CONG XAY DUNG', 'asdasda', 0, 0, 1, 1425440870, 1425440870, 'vi'),
(4, 3, 1, '1', '1', 'video/2015_03/0_17aafe142adff37175e72f6dfd14da39.jpg', 'youtube_url', 'https://www.youtube.com/watch?v=fOJN_SQF59w', 'THI CÔNG XÂY DỰNG', '&lt;p&gt;asdasdas&lt;/p&gt;', '&lt;p&gt;asdasda&lt;/p&gt;', 'thi-cong-xay-dung-3', 'THI CÔNG XÂY DỰNG | THI CONG XAY DUNG', 'THI CÔNG XÂY DỰNG, THI CONG XAY DUNG', 'asdasda', 0, 0, 1, 1425440870, 1425440870, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `video_group`
--

CREATE TABLE IF NOT EXISTS `video_group` (
`id` int(10) unsigned NOT NULL,
  `group_id` int(11) NOT NULL,
  `group_nav` varchar(250) NOT NULL,
  `group_level` tinyint(2) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `group_related` varchar(250) NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `short` text NOT NULL,
  `content` text NOT NULL,
  `friendly_link` varchar(250) NOT NULL,
  `meta_title` varchar(250) NOT NULL,
  `meta_key` text NOT NULL,
  `meta_desc` text NOT NULL,
  `pic_show` varchar(50) NOT NULL DEFAULT 'grid',
  `is_focus` tinyint(1) NOT NULL DEFAULT '0',
  `is_show_menu` tinyint(1) NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `video_group`
--

INSERT INTO `video_group` (`id`, `group_id`, `group_nav`, `group_level`, `parent_id`, `group_related`, `picture`, `title`, `short`, `content`, `friendly_link`, `meta_title`, `meta_key`, `meta_desc`, `pic_show`, `is_focus`, `is_show_menu`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, '1', 1, 0, '', 'video/2015_03/vista_blue_and_green_aurora-t2.jpg', 'Dưới hình chi tiết sản phẩm', '&lt;p&gt;asdadsa&lt;/p&gt;', '&lt;p&gt;adasdasdasd&lt;/p&gt;', 'duoi-hinh-chi-tiet-san-pham', 'Dưới hình chi tiết sản phẩm | Duoi hinh chi tiet san pham', 'Dưới hình chi tiết sản phẩm, Duoi hinh chi tiet san pham', 'adasdasdasd', 'grid', 0, 0, 0, 1, 1425439644, 1425439644, 'vi'),
(2, 1, '1', 1, 0, '', 'video/2015_03/vista_blue_and_green_aurora-t2.jpg', 'Dưới hình chi tiết sản phẩm', '&lt;p&gt;asdadsa&lt;/p&gt;', '&lt;p&gt;adasdasdasd&lt;/p&gt;', 'duoi-hinh-chi-tiet-san-pham-1', 'Dưới hình chi tiết sản phẩm | Duoi hinh chi tiet san pham', 'Dưới hình chi tiết sản phẩm, Duoi hinh chi tiet san pham', 'adasdasdasd', 'grid', 0, 0, 0, 1, 1425439644, 1425439644, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `video_setting`
--

CREATE TABLE IF NOT EXISTS `video_setting` (
`id` int(11) NOT NULL,
  `video_meta_title` varchar(250) NOT NULL,
  `video_meta_key` text NOT NULL,
  `video_meta_desc` text NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(10) unsigned NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `video_setting`
--

INSERT INTO `video_setting` (`id`, `video_meta_title`, `video_meta_key`, `video_meta_desc`, `num_list`, `num_order_detail`, `lang`) VALUES
(1, 'Video', '', '', 9, 10, 'vi');

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE IF NOT EXISTS `voucher` (
  `voucher_id` varchar(50) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `amount` float NOT NULL,
  `amount_use` float NOT NULL,
  `is_show` tinyint(2) NOT NULL DEFAULT '1',
  `date_start` int(11) NOT NULL,
  `date_end` int(11) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_history`
--

CREATE TABLE IF NOT EXISTS `voucher_history` (
`id` int(11) NOT NULL,
  `voucher_id` varchar(50) NOT NULL,
  `order_code` varchar(50) NOT NULL,
  `amount_type` varchar(20) NOT NULL DEFAULT 'buy_product',
  `amount` float NOT NULL,
  `amount_has` float NOT NULL,
  `content` varchar(250) NOT NULL,
  `date_create` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_order`
--

CREATE TABLE IF NOT EXISTS `voucher_order` (
  `order_id` varchar(20) NOT NULL,
  `o_full_name` varchar(250) NOT NULL,
  `o_email` varchar(250) NOT NULL,
  `o_phone` varchar(250) NOT NULL,
  `o_address` varchar(250) NOT NULL,
  `d_full_name` varchar(250) NOT NULL,
  `d_email` varchar(250) NOT NULL,
  `d_phone` varchar(250) NOT NULL,
  `d_address` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `email_content` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` float NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_status` tinyint(2) NOT NULL DEFAULT '1',
  `is_show` tinyint(2) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_setting`
--

CREATE TABLE IF NOT EXISTS `voucher_setting` (
`id` int(11) NOT NULL,
  `voucher_meta_title` varchar(250) NOT NULL,
  `voucher_meta_key` text NOT NULL,
  `voucher_meta_desc` text NOT NULL,
  `voucher_content` text NOT NULL,
  `promotion_percent` float NOT NULL,
  `promotion_day_end` int(11) NOT NULL,
  `min_cart_promotion` float NOT NULL DEFAULT '50',
  `voucher_day_end` int(11) NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(10) unsigned NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `voucher_setting`
--

INSERT INTO `voucher_setting` (`id`, `voucher_meta_title`, `voucher_meta_key`, `voucher_meta_desc`, `voucher_content`, `promotion_percent`, `promotion_day_end`, `min_cart_promotion`, `voucher_day_end`, `num_list`, `num_order_detail`, `lang`) VALUES
(1, 'Voucher', '', '', '&lt;h1&gt;Gift Vouchers&lt;/h1&gt;\r\n&lt;p&gt;Purchase a gift voucher for your friends or family here. Simply fill in your details below and a gift voucher will be automatically generated and sent to them.&lt;br /&gt; &lt;br /&gt; Gift vouchers can be used towards purchases on this website and unused portions of gift vouchers can be used on future purchases.&lt;/p&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;', 10, 60, 50, 60, 10, 5, 'vi'),
(2, 'aboutus', '', '', '', 0, 0, 50, 0, 10, 10, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `widget`
--

CREATE TABLE IF NOT EXISTS `widget` (
`widget_id` int(10) unsigned NOT NULL,
  `name_action` varchar(50) NOT NULL,
  `arr_title` text NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `widget`
--

INSERT INTO `widget` (`widget_id`, `name_action`, `arr_title`, `show_order`, `is_show`) VALUES
(1, 'menu_group', 'a:2:{s:2:"vi";s:10:"Menu nhóm";s:2:"en";s:10:"Menu nhóm";}', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `about_setting`
--
ALTER TABLE `about_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_group`
--
ALTER TABLE `admin_group`
 ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
 ADD PRIMARY KEY (`menu_id`), ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner_group`
--
ALTER TABLE `banner_group`
 ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
 ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `contact_map`
--
ALTER TABLE `contact_map`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_setting`
--
ALTER TABLE `contact_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dealer`
--
ALTER TABLE `dealer`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dealer_group`
--
ALTER TABLE `dealer_group`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dealer_setting`
--
ALTER TABLE `dealer_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `download`
--
ALTER TABLE `download`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `download_group`
--
ALTER TABLE `download_group`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `download_setting`
--
ALTER TABLE `download_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friendly_link`
--
ALTER TABLE `friendly_link`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery_group`
--
ALTER TABLE `gallery_group`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery_setting`
--
ALTER TABLE `gallery_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_setting`
--
ALTER TABLE `home_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lang`
--
ALTER TABLE `lang`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
 ADD PRIMARY KEY (`mod_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_group`
--
ALTER TABLE `news_group`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_setting`
--
ALTER TABLE `news_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_method`
--
ALTER TABLE `order_method`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_shipping`
--
ALTER TABLE `order_shipping`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_group`
--
ALTER TABLE `page_group`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_setting`
--
ALTER TABLE `page_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner`
--
ALTER TABLE `partner`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner_comment`
--
ALTER TABLE `partner_comment`
 ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `partner_group`
--
ALTER TABLE `partner_group`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner_setting`
--
ALTER TABLE `partner_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_brand`
--
ALTER TABLE `product_brand`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_code_pic`
--
ALTER TABLE `product_code_pic`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_color`
--
ALTER TABLE `product_color`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_combine`
--
ALTER TABLE `product_combine`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_group`
--
ALTER TABLE `product_group`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_option`
--
ALTER TABLE `product_option`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_order`
--
ALTER TABLE `product_order`
 ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `product_order_detail`
--
ALTER TABLE `product_order_detail`
 ADD PRIMARY KEY (`detail_id`);

--
-- Indexes for table `product_pic`
--
ALTER TABLE `product_pic`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_receipt`
--
ALTER TABLE `product_receipt`
 ADD PRIMARY KEY (`receipt_id`);

--
-- Indexes for table `product_receipt_detail`
--
ALTER TABLE `product_receipt_detail`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_setting`
--
ALTER TABLE `product_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_size`
--
ALTER TABLE `product_size`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_status`
--
ALTER TABLE `product_status`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_group`
--
ALTER TABLE `project_group`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_setting`
--
ALTER TABLE `project_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
 ADD PRIMARY KEY (`promotion_id`);

--
-- Indexes for table `repository`
--
ALTER TABLE `repository`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repository_method`
--
ALTER TABLE `repository_method`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repository_method_group`
--
ALTER TABLE `repository_method_group`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repository_receipt`
--
ALTER TABLE `repository_receipt`
 ADD PRIMARY KEY (`receipt_id`);

--
-- Indexes for table `repository_receipt_detail`
--
ALTER TABLE `repository_receipt_detail`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repository_receipt_import`
--
ALTER TABLE `repository_receipt_import`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_group`
--
ALTER TABLE `service_group`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_setting`
--
ALTER TABLE `service_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sidebar`
--
ALTER TABLE `sidebar`
 ADD PRIMARY KEY (`sidebar_id`);

--
-- Indexes for table `statistic`
--
ALTER TABLE `statistic`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support`
--
ALTER TABLE `support`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_email`
--
ALTER TABLE `template_email`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`user_id`), ADD KEY `username` (`username`), ADD KEY `email` (`email`);

--
-- Indexes for table `user_setting`
--
ALTER TABLE `user_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video_group`
--
ALTER TABLE `video_group`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video_setting`
--
ALTER TABLE `video_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
 ADD PRIMARY KEY (`voucher_id`);

--
-- Indexes for table `voucher_history`
--
ALTER TABLE `voucher_history`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher_order`
--
ALTER TABLE `voucher_order`
 ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `voucher_setting`
--
ALTER TABLE `voucher_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `widget`
--
ALTER TABLE `widget`
 ADD PRIMARY KEY (`widget_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `about_setting`
--
ALTER TABLE `about_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `admin_group`
--
ALTER TABLE `admin_group`
MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
MODIFY `menu_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=99;
--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
MODIFY `contact_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact_map`
--
ALTER TABLE `contact_map`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `contact_setting`
--
ALTER TABLE `contact_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dealer`
--
ALTER TABLE `dealer`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `dealer_group`
--
ALTER TABLE `dealer_group`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dealer_setting`
--
ALTER TABLE `dealer_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `download`
--
ALTER TABLE `download`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `download_group`
--
ALTER TABLE `download_group`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `download_setting`
--
ALTER TABLE `download_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `friendly_link`
--
ALTER TABLE `friendly_link`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1277;
--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `gallery_group`
--
ALTER TABLE `gallery_group`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `gallery_setting`
--
ALTER TABLE `gallery_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `home_setting`
--
ALTER TABLE `home_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lang`
--
ALTER TABLE `lang`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
MODIFY `mod_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `news_group`
--
ALTER TABLE `news_group`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `news_setting`
--
ALTER TABLE `news_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `order_method`
--
ALTER TABLE `order_method`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `order_shipping`
--
ALTER TABLE `order_shipping`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `page_group`
--
ALTER TABLE `page_group`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `page_setting`
--
ALTER TABLE `page_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `partner`
--
ALTER TABLE `partner`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `partner_comment`
--
ALTER TABLE `partner_comment`
MODIFY `cid` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `partner_group`
--
ALTER TABLE `partner_group`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `partner_setting`
--
ALTER TABLE `partner_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `product_brand`
--
ALTER TABLE `product_brand`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `product_code_pic`
--
ALTER TABLE `product_code_pic`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `product_color`
--
ALTER TABLE `product_color`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `product_combine`
--
ALTER TABLE `product_combine`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_group`
--
ALTER TABLE `product_group`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `product_option`
--
ALTER TABLE `product_option`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `product_order`
--
ALTER TABLE `product_order`
MODIFY `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `product_order_detail`
--
ALTER TABLE `product_order_detail`
MODIFY `detail_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `product_pic`
--
ALTER TABLE `product_pic`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `product_receipt`
--
ALTER TABLE `product_receipt`
MODIFY `receipt_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_receipt_detail`
--
ALTER TABLE `product_receipt_detail`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_setting`
--
ALTER TABLE `product_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `product_size`
--
ALTER TABLE `product_size`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `product_status`
--
ALTER TABLE `product_status`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `project_group`
--
ALTER TABLE `project_group`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `project_setting`
--
ALTER TABLE `project_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `repository`
--
ALTER TABLE `repository`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `repository_method`
--
ALTER TABLE `repository_method`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `repository_method_group`
--
ALTER TABLE `repository_method_group`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `repository_receipt`
--
ALTER TABLE `repository_receipt`
MODIFY `receipt_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `repository_receipt_detail`
--
ALTER TABLE `repository_receipt_detail`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `repository_receipt_import`
--
ALTER TABLE `repository_receipt_import`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `service_group`
--
ALTER TABLE `service_group`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `service_setting`
--
ALTER TABLE `service_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sidebar`
--
ALTER TABLE `sidebar`
MODIFY `sidebar_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `statistic`
--
ALTER TABLE `statistic`
MODIFY `id` double NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=211;
--
-- AUTO_INCREMENT for table `support`
--
ALTER TABLE `support`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `template_email`
--
ALTER TABLE `template_email`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_setting`
--
ALTER TABLE `user_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `video_group`
--
ALTER TABLE `video_group`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `video_setting`
--
ALTER TABLE `video_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `voucher_history`
--
ALTER TABLE `voucher_history`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `voucher_setting`
--
ALTER TABLE `voucher_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `widget`
--
ALTER TABLE `widget`
MODIFY `widget_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
