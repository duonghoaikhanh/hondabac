-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 22, 2015 at 07:22 AM
-- Server version: 5.5.31
-- PHP Version: 5.3.29

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `imsvietnam_tracdiamn`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE IF NOT EXISTS `about` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `about_meta_title` varchar(250) NOT NULL,
  `about_meta_key` text NOT NULL,
  `about_meta_desc` text NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(10) unsigned NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi',
  `background` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `picture` varchar(250) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `email` varchar(250) NOT NULL,
  `date_login` int(11) NOT NULL,
  `session` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `group_id`, `username`, `password`, `picture`, `full_name`, `email`, `date_login`, `session`) VALUES
(1, -1, 'admin', '91739eb0a14999c738a8cea3691902d7', '', 'Trần Thanh Hiệp', 'ttthiep2007@gmail.com', 1425290819, '4ddb5b8d603f88e9de689f3230234b47'),
(2, 1, 'test', '79de6f8c90944182a38cc2509f8c80e5', '', 'TEST', 'test@gmail.com', 1401700404, 'cbf22ab286e2ad4900bdf5d6a2e47009'),
(4, -1, 'imshiep', '9f4e2b29b29386504f303597823c3f0c', '', 'IMS Thanh Hiep', 'ttthiep2007@gmail.com', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `admin_group`
--

CREATE TABLE IF NOT EXISTS `admin_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `arr_title` text NOT NULL,
  `arr_powers` text NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `date_create` int(10) unsigned NOT NULL,
  `date_update` int(10) unsigned NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

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
  `menu_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `is_type` varchar(50) NOT NULL DEFAULT 'module',
  `name_action` varchar(50) NOT NULL,
  `icon_menu` varchar(50) NOT NULL,
  `arr_title` text NOT NULL,
  `list_sub` varchar(250) NOT NULL,
  `is_show` tinyint(4) NOT NULL DEFAULT '1',
  `show_order` float NOT NULL DEFAULT '0',
  `date_create` int(10) unsigned NOT NULL,
  `date_update` int(10) unsigned NOT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=99 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `group_id` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `title` varchar(250) NOT NULL,
  `link_type` varchar(20) NOT NULL DEFAULT 'site',
  `link` varchar(250) NOT NULL,
  `target` varchar(20) NOT NULL DEFAULT '_blank',
  `content` text NOT NULL,
  `show_mod` text NOT NULL,
  `show_act` text NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `date_create` int(10) unsigned NOT NULL,
  `date_update` int(10) unsigned NOT NULL,
  `lang` varchar(20) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `banner_id`, `group_id`, `type`, `title`, `link_type`, `link`, `target`, `content`, `show_mod`, `show_act`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, 1, 'logo', 'image', 'Công Ty TNHH Giải Pháp IMS', 'site', '', '_self', 'banner/2015_01/IMS_logo.png', '', '', 0, 1, 1407469101, 1421222311, 'vi'),
(3, 3, 'footer', 'text', '', 'site', '', '_self', '<div style="text-align: center;">Sử dụng nội dung ở trang n&agrave;y v&agrave; dịch vụ tại IMS c&oacute; nghĩa l&agrave; bạn đồng &yacute; với Thỏa thuận sử dụng v&agrave; Ch&iacute;nh s&aacute;ch bảo mật của ch&uacute;ng t&ocirc;i.</div>\r\n<div style="text-align: center;">Copyright &copy; IMS. All right Reserved.</div>', '', '', 0, 1, 1407476242, 1421402366, 'vi'),
(6, 6, 'share', 'image', 'Facebook', 'web', 'http://www.facebook.com', '_blank', 'banner/2015_01/share-02.gif', '', '', 9, 1, 1407922065, 1421744694, 'vi'),
(7, 7, 'ordering-complete', 'text', 'Thông báo đặt hàng thành công', 'site', '', '_self', '<p>Cảm ơn qu&yacute; kh&aacute;ch đ&atilde; đặt h&agrave;ng tại c&ocirc;ng ty ch&uacute;ng t&ocirc;i!</p>\r\n<p>Đơn h&agrave;ng sẽ được xử l&yacute; trong 24h</p>', '', '', 0, 1, 1408091839, 1408091839, 'vi'),
(8, 8, 'cart-empty', 'text', 'Thông báo giỏ hàng rỗng', 'site', '', '_self', '<p>Hiện tại giỏ h&agrave;ng của bạn đang rỗng!</p>\r\n<p>Vui l&ograve;ng chọn sản phẩm mua để thanh to&aacute;n!</p>', '', '', 0, 1, 1408093957, 1408093957, 'vi'),
(9, 9, 'share', 'image', 'Twitter', 'site', 'http://www.twitter.com', '_self', '2014_09/share_5edde6329a43b114519cbdbcb7f0b0b7.jpg', '', '', 10, 0, 1410860532, 1410860532, 'vi'),
(10, 10, 'share', 'image', 'Youtube', 'web', 'http://www.youtube.com', '_blank', 'banner/2015_01/share.gif', '', '', 0, 1, 1410860573, 1421744756, 'vi'),
(14, 14, 'header', 'image', '', 'site', '', '_self', 'banner/2014_11/share_mess.gif', '', '', 0, 1, 1415352279, 1415352279, 'vi'),
(15, 15, 'slogan', 'image', '', 'site', '', '_self', 'banner/2014_11/slogan.png', '', '', 0, 1, 1415353339, 1415353339, 'vi'),
(16, 16, 'banner-main', 'image', 'bbgreen', 'site', '', '_self', 'banner/2014_11/banner_main.jpg', '', '', 0, 1, 1415601898, 1415601898, 'vi'),
(17, 17, 'banner-main', 'image', 'main banner', 'site', '', '_self', 'banner/2015_01/banner-main-1.jpg', '', '', 0, 1, 1415601928, 1421303944, 'vi'),
(18, 18, 'gallery', 'image', '', 'site', '', '_self', 'banner/2014_11/Jellyfish.jpg', '', '', 0, 1, 1415688590, 1415688590, 'vi'),
(19, 19, 'gallery', 'image', '', 'site', '', '_self', 'banner/2014_11/Koala.jpg', '', '', 0, 1, 1415688598, 1415688598, 'vi'),
(20, 20, 'gallery', 'image', '', 'site', '', '_self', 'banner/2014_11/Lighthouse.jpg', '', '', 0, 1, 1415688605, 1415688605, 'vi'),
(21, 21, 'gallery', 'image', '', 'site', '', '_self', 'banner/2014_11/Penguins.jpg', '', '', 0, 1, 1415688613, 1415688613, 'vi'),
(22, 22, 'support', 'text', '', 'site', '', '_self', '<p>016.88888.163<br />C.Thanh</p>\r\n<p>09.3737.1818<br />A.Thắng</p>', '', '', 0, 1, 1415693484, 1415693484, 'vi'),
(23, 23, 'under-construction', 'text', '', 'site', '', '_self', '<p style="text-align: center;"><span style="font-size: 18pt;">Trang web của ch&uacute;ng t&ocirc;i đang x&acirc;y dựng! Vui l&ograve;ng quay lại sau!</span></p>', '', '', 0, 1, 1420617526, 1420617526, 'vi'),
(24, 24, 'bank', 'image', '', 'site', '', '_self', 'banner/2015_01/bank.jpg', '', '', 0, 1, 1421317249, 1421317249, 'vi'),
(25, 24, 'bank', 'image', '', 'site', '', '_self', 'banner/2015_01/bank.jpg', '', '', 0, 1, 1421317249, 1421317249, 'en'),
(26, 26, 'bank', 'image', '', 'site', '', '_self', 'banner/2015_01/bank-02.jpg', '', '', 0, 1, 1421317306, 1421317306, 'vi'),
(27, 26, 'bank', 'image', '', 'site', '', '_self', 'banner/2015_01/bank-02.jpg', '', '', 0, 1, 1421317306, 1421317306, 'en'),
(28, 28, 'bank', 'image', '', 'site', '', '_self', 'banner/2015_01/bank-03.jpg', '', '', 0, 1, 1421317318, 1421317318, 'vi'),
(29, 28, 'bank', 'image', '', 'site', '', '_self', 'banner/2015_01/bank-03.jpg', '', '', 0, 1, 1421317318, 1421317318, 'en'),
(30, 30, 'bank', 'image', '', 'site', '', '_self', 'banner/2015_01/bank-04.jpg', '', '', 0, 1, 1421317328, 1421317328, 'vi'),
(31, 31, 'bank', 'image', '', 'site', '', '_self', 'banner/2015_01/bank-04.jpg', '', '', 0, 1, 1421317328, 1421317328, 'en'),
(32, 32, 'bank', 'image', '', 'site', '', '_self', 'banner/2015_01/bank-05.jpg', '', '', 0, 1, 1421317337, 1421317337, 'vi'),
(33, 33, 'bank', 'image', '', 'site', '', '_self', 'banner/2015_01/bank-05.jpg', '', '', 0, 1, 1421317337, 1421317337, 'en'),
(34, 1, 'logo', 'image', 'Công Ty TNHH Giải Pháp IMS', 'site', '', '_self', 'banner/2015_01/IMS_logo.png', '', '', 0, 1, 1407469101, 1421222311, 'en'),
(35, 35, 'share', 'image', 'Twitter', 'web', 'http://www.twitter.com', '_blank', 'banner/2015_01/share-03.gif', '', '', 0, 1, 1421744792, 1421744792, 'vi'),
(36, 35, 'share', 'image', 'Twitter', 'web', 'http://www.twitter.com', '_blank', 'banner/2015_01/share-03.gif', '', '', 0, 1, 1421744792, 1421744792, 'en'),
(37, 37, 'share', 'image', 'Google', 'web', 'http://google.com', '_blank', 'banner/2015_01/share-04.gif', '', '', 0, 1, 1421744810, 1421744828, 'vi'),
(38, 37, 'share', 'image', 'Google', 'web', 'http://google.com', '_blank', 'banner/2015_01/share-04.gif', '', '', 0, 1, 1421744810, 1421744828, 'en');

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
  `date_update` int(10) unsigned NOT NULL,
  PRIMARY KEY (`group_id`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `date_check` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `email`, `hotline`, `hotline_support`, `fax`, `n_list`, `ad_skin`, `lang_view`, `skin`, `method_email`, `smtp_host`, `smtp_port`, `smtp_username`, `smtp_password`, `visitors_start`, `fanpage_facebook`, `share_link`, `share_title`, `is_under_construction`, `date_check`) VALUES
(1, 'hiep@imsvietnamese.com', '01652.752.954', '0938 338 404, 0938 161 568, (08) 6264 9227, (08) 6264 9228', '', 20, 'default', 'vi', 'blue', 'gmail', 'smtp.gmail.com', 465, 'imshostemail@gmail.com', 'AaBbCc1122', 500, 'https://www.facebook.com/dongvatdethuongdangyeu', '', 'hiep_cms', 0, 1421638054);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `contact_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `date_update` int(10) unsigned NOT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contact_map`
--

CREATE TABLE IF NOT EXISTS `contact_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_meta_title` varchar(250) NOT NULL,
  `contact_meta_key` text NOT NULL,
  `contact_meta_desc` text NOT NULL,
  `contact_info` text NOT NULL,
  `contact_form` text NOT NULL,
  `email` varchar(250) NOT NULL,
  `num_order_detail` int(10) unsigned NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi',
  `background` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dealer_setting`
--

CREATE TABLE IF NOT EXISTS `dealer_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealer_meta_title` varchar(250) NOT NULL,
  `dealer_meta_key` text NOT NULL,
  `dealer_meta_desc` text NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(10) unsigned NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi',
  `background` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `download_meta_title` varchar(250) NOT NULL,
  `download_meta_key` text NOT NULL,
  `download_meta_desc` text NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(10) unsigned NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `friendly_link` varchar(250) NOT NULL,
  `module` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `dbtable` varchar(50) NOT NULL,
  `dbtable_id` varchar(50) NOT NULL DEFAULT '0',
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  `date_create` int(10) unsigned NOT NULL,
  `date_update` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1277 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_meta_title` varchar(250) NOT NULL,
  `news_meta_key` text NOT NULL,
  `news_meta_desc` text NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(11) NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `home_meta_title` varchar(250) NOT NULL,
  `home_meta_key` text NOT NULL,
  `home_meta_desc` text NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(10) unsigned NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `home_setting`
--

INSERT INTO `home_setting` (`id`, `home_meta_title`, `home_meta_key`, `home_meta_desc`, `num_list`, `num_order_detail`, `lang`) VALUES
(1, 'Trang chủ', '', '', 3, 3, 'vi'),
(2, 'Homepage', '', '', 6, 10, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `lang`
--

CREATE TABLE IF NOT EXISTS `lang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT 'vi',
  `title` varchar(250) NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `is_show` tinyint(4) NOT NULL DEFAULT '1',
  `show_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `title` varchar(250) NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(4) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `area_code` varchar(20) NOT NULL,
  `title` varchar(250) NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(4) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `area_code` varchar(20) NOT NULL,
  `country_code` varchar(20) NOT NULL,
  `province_code` varchar(20) NOT NULL,
  `title` varchar(250) NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(4) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `location_district`
--

INSERT INTO `location_district` (`id`, `code`, `area_code`, `country_code`, `province_code`, `title`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, '0801', 'c6', 'vi', '08', 'Quận 1', 0, 1, 1407228247, 1407228532, 'vi'),
(2, '0801', 'c6', 'vi', '08', 'Quận 1', 0, 1, 1407228247, 1407228532, 'en'),
(3, '0802', 'c6', 'vi', '08', 'Quận 2', 0, 1, 1407228285, 1407228285, 'vi'),
(4, '0802', 'c6', 'vi', '08', 'Quận 2', 0, 1, 1407228285, 1407228285, 'en'),
(5, '0803', 'c6', 'vi', '08', 'Quận 3', 0, 1, 1407228319, 1407228319, 'vi'),
(6, '0803', 'c6', 'vi', '08', 'Quận 3', 0, 1, 1407228319, 1407228319, 'en'),
(7, '0804', 'c6', 'vi', '08', 'Quận 4', 0, 1, 1407228333, 1407228333, 'vi'),
(8, '0804', 'c6', 'vi', '08', 'Quận 4', 0, 1, 1407228333, 1407228333, 'en'),
(9, '0805', 'c6', 'vi', '08', 'Quận 5', 0, 1, 1407228351, 1407228351, 'vi'),
(10, '0805', 'c6', 'vi', '08', 'Quận 5', 0, 1, 1407228351, 1407228351, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `location_province`
--

CREATE TABLE IF NOT EXISTS `location_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `area_code` varchar(20) NOT NULL,
  `country_code` varchar(20) NOT NULL,
  `title` varchar(250) NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(4) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `location_province`
--

INSERT INTO `location_province` (`id`, `code`, `area_code`, `country_code`, `title`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, '04', 'c6', 'vi', 'Hà Nội', 0, 1, 1407224671, 1407224671, 'vi'),
(2, '04', 'c6', 'vi', 'Hà Nội', 0, 1, 1407224671, 1407224671, 'en'),
(3, '08', 'c6', 'vi', 'TP Hồ Chí Minh', 0, 1, 1407224693, 1407224693, 'vi'),
(4, '08', 'c6', 'vi', 'TP Hồ Chí Minh', 0, 1, 1407224693, 1407224693, 'en'),
(5, '86', 'c6', 'vi', 'Bình Thuận', 0, 1, 1407224794, 1407224794, 'vi'),
(6, '86', 'c6', 'vi', 'Bình Thuận', 0, 1, 1407224794, 1407224794, 'en'),
(7, '49', 'c6', 'vi', 'Lâm Đồng', 0, 1, 1407224832, 1407225359, 'vi'),
(8, '49', 'c6', 'vi', 'Lâm Đồng', 0, 1, 1407224832, 1407225359, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `location_ward`
--

CREATE TABLE IF NOT EXISTS `location_ward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `area_code` varchar(20) NOT NULL,
  `country_code` varchar(20) NOT NULL,
  `province_code` varchar(20) NOT NULL,
  `district_code` varchar(20) NOT NULL,
  `title` varchar(250) NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(4) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `location_ward`
--

INSERT INTO `location_ward` (`id`, `code`, `area_code`, `country_code`, `province_code`, `district_code`, `title`, `show_order`, `is_show`, `date_create`, `date_update`, `lang`) VALUES
(1, '080101', 'c6', 'vi', '08', '0801', 'Phường 1', 0, 1, 1407231204, 1407231204, 'vi'),
(2, '080101', 'c6', 'vi', '08', '0801', 'Phường 1', 0, 1, 1407231204, 1407231204, 'en'),
(3, '080102', 'c6', 'vi', '08', '0801', 'Phường 2', 0, 1, 1407231240, 1407232182, 'vi'),
(4, '080102', 'c6', 'vi', '08', '0801', 'Phường 2', 0, 1, 1407231240, 1407232182, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(5) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

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
  `mod_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_action` varchar(50) NOT NULL,
  `arr_title` text NOT NULL,
  `arr_friendly_link` text NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`mod_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_meta_title` varchar(250) NOT NULL,
  `news_meta_key` text NOT NULL,
  `news_meta_desc` text NOT NULL,
  `img_list_w` int(11) NOT NULL DEFAULT '100',
  `img_list_h` int(11) NOT NULL DEFAULT '100',
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(11) NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shipping_id` int(10) unsigned NOT NULL,
  `picture` varchar(250) NOT NULL,
  `price` float NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(2) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_meta_title` varchar(250) NOT NULL,
  `page_meta_key` text NOT NULL,
  `page_meta_desc` text NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(10) unsigned NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `date_update` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `partner_group`
--

CREATE TABLE IF NOT EXISTS `partner_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_meta_title` varchar(250) NOT NULL,
  `partner_meta_key` text NOT NULL,
  `partner_meta_desc` text NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(11) NOT NULL DEFAULT '5',
  `img_list_w` int(11) NOT NULL DEFAULT '150',
  `img_list_h` int(11) NOT NULL DEFAULT '100',
  `lang` varchar(10) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code_pic_id` int(10) unsigned NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(2) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `color_id` int(10) unsigned NOT NULL,
  `picture` varchar(250) NOT NULL,
  `color` varchar(7) NOT NULL,
  `title` varchar(250) NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

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
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL DEFAULT 'product',
  `type_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `price_buy` float NOT NULL,
  `in_stock` int(11) NOT NULL,
  `out_stock` int(11) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_group`
--

CREATE TABLE IF NOT EXISTS `product_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `date_update` int(11) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

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
  `detail_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `code_pic` int(11) NOT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

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
  `receipt_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `receipt_code` varchar(20) NOT NULL,
  `receipt_type` varchar(20) NOT NULL DEFAULT 'import',
  `type_code` varchar(20) NOT NULL,
  `title` varchar(250) NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(4) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  PRIMARY KEY (`receipt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_receipt_detail`
--

CREATE TABLE IF NOT EXISTS `product_receipt_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
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
  `date_update` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_setting`
--

CREATE TABLE IF NOT EXISTS `product_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `brand_link` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `size_id` int(10) unsigned NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_id` int(11) NOT NULL,
  `picture` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_meta_title` varchar(250) NOT NULL,
  `project_meta_key` text NOT NULL,
  `project_meta_desc` text NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(10) unsigned NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `date_update` int(11) NOT NULL,
  PRIMARY KEY (`promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `repository`
--

CREATE TABLE IF NOT EXISTS `repository` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `repository_method`
--

CREATE TABLE IF NOT EXISTS `repository_method` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `repository_method_group`
--

CREATE TABLE IF NOT EXISTS `repository_method_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `repository_receipt`
--

CREATE TABLE IF NOT EXISTS `repository_receipt` (
  `receipt_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `date_update` int(11) NOT NULL,
  PRIMARY KEY (`receipt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `repository_receipt_detail`
--

CREATE TABLE IF NOT EXISTS `repository_receipt_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `receipt_id` int(11) NOT NULL,
  `is_level` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT 'product',
  `type_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `repository_receipt_import`
--

CREATE TABLE IF NOT EXISTS `repository_receipt_import` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `receipt_type` varchar(20) NOT NULL DEFAULT 'import',
  `type_code` varchar(20) NOT NULL,
  `title` varchar(250) NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(4) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_edit` int(11) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `sidebar_item_right` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `sidebar_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `list_widget` text NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  PRIMARY KEY (`sidebar_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

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
  `id` double NOT NULL AUTO_INCREMENT,
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
  `time_stay` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=209 ;

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
(208, '35f82114b167da4fa04e35eb04e661c5', '06/03/2015', 'localhost', 'localhost', '', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'Firefox', '::1', 'Windows 7', 1024, 768, 1425610330, 1425611287, 957);

-- --------------------------------------------------------

--
-- Table structure for table `support`
--

CREATE TABLE IF NOT EXISTS `support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `template_email`
--

CREATE TABLE IF NOT EXISTS `template_email` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` varchar(50) NOT NULL,
  `title` varchar(250) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `show_order` float NOT NULL,
  `is_show` tinyint(2) NOT NULL,
  `date_create` int(11) NOT NULL,
  `date_update` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

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
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `date_update` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_setting`
--

CREATE TABLE IF NOT EXISTS `user_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(10) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(4) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_meta_title` varchar(250) NOT NULL,
  `video_meta_key` text NOT NULL,
  `video_meta_desc` text NOT NULL,
  `num_list` int(10) unsigned NOT NULL DEFAULT '10',
  `num_order_detail` int(10) unsigned NOT NULL DEFAULT '10',
  `lang` varchar(10) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

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
  `date_update` int(11) NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_history`
--

CREATE TABLE IF NOT EXISTS `voucher_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` varchar(50) NOT NULL,
  `order_code` varchar(50) NOT NULL,
  `amount_type` varchar(20) NOT NULL DEFAULT 'buy_product',
  `amount` float NOT NULL,
  `amount_has` float NOT NULL,
  `content` varchar(250) NOT NULL,
  `date_create` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
  `date_update` int(11) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_setting`
--

CREATE TABLE IF NOT EXISTS `voucher_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(10) NOT NULL DEFAULT 'vi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `widget_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_action` varchar(50) NOT NULL,
  `arr_title` text NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`widget_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `widget`
--

INSERT INTO `widget` (`widget_id`, `name_action`, `arr_title`, `show_order`, `is_show`) VALUES
(1, 'menu_group', 'a:2:{s:2:"vi";s:10:"Menu nhóm";s:2:"en";s:10:"Menu nhóm";}', 0, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
