-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 08, 2022 at 08:44 AM
-- Server version: 10.5.9-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cuch_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `fs_album`
--

CREATE TABLE `fs_album` (
  `id` int(11) NOT NULL,
  `summary` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `category_alias` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_id_wrapper` varchar(255) DEFAULT NULL,
  `category_alias_wrapper` varchar(255) DEFAULT NULL,
  `category_icon` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `source_website` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `editor` varchar(255) DEFAULT NULL,
  `show_in_homepage` tinyint(4) DEFAULT NULL,
  `hits` int(11) NOT NULL DEFAULT 0,
  `published` tinyint(4) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `title_display` varchar(255) DEFAULT NULL,
  `display_title` tinyint(4) NOT NULL DEFAULT 1,
  `display_column` int(11) NOT NULL,
  `tags_group` int(11) DEFAULT NULL,
  `rating_count` int(11) NOT NULL,
  `rating_sum` int(11) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `hot` tinyint(4) DEFAULT 0,
  `total_images` tinyint(4) DEFAULT 0,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keyword` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `lang` varchar(255) DEFAULT 'vi'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `fs_album_categories`
--

CREATE TABLE `fs_album_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `alias_wrapper` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `list_parents` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `published` tinyint(4) NOT NULL DEFAULT 1,
  `ordering` int(11) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `show_in_homepage` tinyint(4) NOT NULL DEFAULT 1,
  `estore_id` int(11) DEFAULT NULL,
  `display_title` tinyint(4) NOT NULL DEFAULT 1,
  `display_tags` tinyint(4) NOT NULL DEFAULT 1,
  `display_related` tinyint(4) NOT NULL DEFAULT 1,
  `display_created_time` tinyint(4) NOT NULL DEFAULT 1,
  `display_category` tinyint(4) NOT NULL DEFAULT 1,
  `display_comment` tinyint(4) NOT NULL DEFAULT 1,
  `display_sharing` tinyint(4) NOT NULL DEFAULT 1,
  `name_display` varchar(255) NOT NULL,
  `is_comment` tinyint(4) NOT NULL,
  `notice` tinyint(4) DEFAULT 0 COMMENT 'Danh mục tin thông báo',
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keyword` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `lang` varchar(255) DEFAULT 'vi'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_album_categories`
--

INSERT INTO `fs_album_categories` (`id`, `name`, `alias`, `category_id`, `alias_wrapper`, `parent_id`, `list_parents`, `level`, `published`, `ordering`, `image`, `icon`, `created_time`, `updated_time`, `show_in_homepage`, `estore_id`, `display_title`, `display_tags`, `display_related`, `display_created_time`, `display_category`, `display_comment`, `display_sharing`, `name_display`, `is_comment`, `notice`, `seo_title`, `seo_keyword`, `seo_description`, `lang`) VALUES
(1, 'Album ảnh', 'album-anh', NULL, ',album-anh,', 0, ',1,', 0, 1, 1, NULL, NULL, '2018-08-27 12:01:31', '2018-08-27 12:01:31', 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, '', '', '', 'vi');

-- --------------------------------------------------------

--
-- Table structure for table `fs_album_images`
--

CREATE TABLE `fs_album_images` (
  `id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `tmp` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `fs_backgrounds`
--

CREATE TABLE `fs_backgrounds` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `image` varchar(150) DEFAULT NULL,
  `is_default` tinyint(2) NOT NULL DEFAULT 0,
  `background_color` varchar(10) DEFAULT NULL,
  `repeat_x` tinyint(4) DEFAULT NULL,
  `repeat_y` tinyint(4) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 1,
  `ordering` int(11) NOT NULL DEFAULT 1,
  `created_time` datetime DEFAULT NULL,
  `edited_time` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `fs_banners`
--

CREATE TABLE `fs_banners` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `type` int(4) DEFAULT NULL COMMENT '0: images/flash; 1: content',
  `image` varchar(255) DEFAULT NULL,
  `flash` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `width` int(11) NOT NULL DEFAULT 0,
  `height` int(11) NOT NULL DEFAULT 0,
  `link` varchar(255) DEFAULT NULL,
  `hits` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `edited_time` datetime DEFAULT NULL,
  `published` tinyint(4) DEFAULT NULL,
  `target` varchar(255) DEFAULT '_blank',
  `ordering` int(11) DEFAULT NULL,
  `lang` varchar(255) DEFAULT 'vi'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_banners`
--

INSERT INTO `fs_banners` (`id`, `category_id`, `name`, `alias`, `type`, `image`, `flash`, `content`, `width`, `height`, `link`, `hits`, `created_time`, `edited_time`, `published`, `target`, `ordering`, `lang`) VALUES
(1, 1, 'Banner home', 'banner-home', 1, 'images/banners/original/banner-home-1650771832.png', NULL, '', 0, 0, '', 0, '2022-04-24 10:43:52', '2022-04-24 10:43:52', 1, '_blank', 1, 'vi');

-- --------------------------------------------------------

--
-- Table structure for table `fs_banners_categories`
--

CREATE TABLE `fs_banners_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 1,
  `ordering` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `lang` varchar(255) DEFAULT 'vi'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_banners_categories`
--

INSERT INTO `fs_banners_categories` (`id`, `name`, `published`, `ordering`, `created_time`, `updated_time`, `lang`) VALUES
(1, 'Banner home', 1, 1, '2022-04-24 10:43:43', '2022-04-24 10:43:43', 'vi');

-- --------------------------------------------------------

--
-- Table structure for table `fs_blocks`
--

CREATE TABLE `fs_blocks` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `published` tinyint(4) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `position` varchar(250) DEFAULT NULL,
  `listItemid` varchar(500) DEFAULT NULL,
  `params` text DEFAULT NULL,
  `showTitle` tinyint(4) DEFAULT NULL,
  `products_categories` text NOT NULL,
  `module_categories` text DEFAULT NULL,
  `lang` varchar(255) DEFAULT 'vi'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_blocks`
--

INSERT INTO `fs_blocks` (`id`, `title`, `content`, `ordering`, `published`, `module`, `position`, `listItemid`, `params`, `showTitle`, `products_categories`, `module_categories`, `lang`) VALUES
(1, 'Menu top', '', 1, 1, 'menu', 'menu-position', 'all', 'suffix=_menu\rgroup=1\rorder_by=default\rstyle=nav\rclass=navbar-nav me-auto mb-lg-0', 0, '', 'all', 'vi'),
(6, 'Ecosystems', '', 3, 1, 'news', 'header-position', ',1,', 'suffix=_album\rwhere=default\rorder_by=default\rstyle=list\rcategory_id=\rlimit=5\rwidth=\rfloat=none\rmargin_pos=_\rmargin_value=', 0, '', 'all', 'vi'),
(19, 'Beginner', '', 4, 1, 'news', 'header-position', ',1,', 'suffix=_news\rwhere=default\rorder_by=new\rstyle=grid\rcategory_id=\rlimit=6\rwidth=\rfloat=none\rmargin_pos=margin-bottom\rmargin_value=30', 0, '', 'all', 'vi'),
(20, 'Banner home', '', 2, 1, 'banners', 'header-position', ',1,', 'suffix=_banner\rcategory_id=1\rstyle=default_container\rwidth=\rfloat=none\rmargin_pos=margin-bottom\rmargin_value=30', 0, '', 'all', 'vi'),
(21, 'Latest', '', 6, 1, 'news', 'header-position', ',1,', 'suffix=_news\rwhere=default\rorder_by=default\rstyle=list2\rcategory_id=\rlimit=4\rwidth=\rfloat=none\rmargin_pos=margin-bottom\rmargin_value=30', 0, '', 'all', 'vi'),
(22, 'Menu footer', '', 4, 1, 'menu', 'menu-footer-position', 'all', 'suffix=_menu\rgroup=2\rorder_by=default\rstyle=default\rclass=', 0, '', 'all', 'vi'),
(23, 'Latest Slideshow', '', 1, 1, 'news', 'header-position', ',1,', 'suffix=_categories\rwhere=default\rorder_by=default\rstyle=latest\rcategory_id=\rlimit=5\rwidth=\rfloat=none\rmargin_pos=_\rmargin_value=', 0, '', 'all', 'vi'),
(24, 'Latest', '', 1, 1, 'news', 'aside-position', ',7,', 'suffix=_news\rwhere=default\rorder_by=default\rstyle=aside\rcategory_id=\rlimit=2\rwidth=\rfloat=none\rmargin_pos=margin-top\rmargin_value=30', 0, '', 'all', 'vi'),
(25, 'Chuyên mục', '', 2, 1, 'menu', 'header-position', ',1,', 'suffix=_menu\rgroup=5\rorder_by=default\rstyle=cats\rclass=', 0, '', 'all', 'vi'),
(26, 'Kiếm tiền cùng New Moon', '', 7, 1, 'news', 'header-position', ',1,', 'suffix=_news\rwhere=default\rorder_by=default\rstyle=list_tags\rcategory_id=\rlimit=3\rwidth=\rfloat=none\rmargin_pos=margin-top\rmargin_value=20', 0, '', 'all', 'vi');

-- --------------------------------------------------------

--
-- Table structure for table `fs_blocks_exist`
--

CREATE TABLE `fs_blocks_exist` (
  `id` int(11) NOT NULL,
  `block` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 1,
  `price` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_blocks_exist`
--

INSERT INTO `fs_blocks_exist` (`id`, `block`, `name`, `ordering`, `content`, `published`, `price`) VALUES
(7, 'news', 'Danh sách tin', 7, NULL, 1, ''),
(12, 'about', 'Giới thiệu', 7, NULL, 1, ''),
(5, 'fanbox', 'Facebook', 5, NULL, 0, ''),
(4, 'contents', 'Nội dung tĩnh', 4, NULL, 0, ''),
(3, 'products', 'Danh sách sản phẩm', 3, NULL, 1, ''),
(2, 'categories', 'Danh mục sản phẩm', 2, NULL, 1, ''),
(1, 'catsmenu', 'Menu danh mục', 1, NULL, 0, ''),
(8, 'banners', 'Quảng cáo', 8, NULL, 1, ''),
(9, 'space', 'Dòng trắng', 9, NULL, 0, ''),
(11, 'social', 'Social', 10, NULL, 0, ''),
(13, 'diet', 'Thực đơn của bạn', 11, NULL, 0, ''),
(14, 'fitness', 'Kế hoạch tập luyện', 12, NULL, 0, ''),
(15, 'videos', 'Videos', 13, NULL, 0, ''),
(16, 'filters', 'Lọc sản phẩm', 14, NULL, 0, ''),
(17, 'menu', 'Menu', 15, NULL, 1, ''),
(18, 'album', 'Album ảnh', 16, NULL, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `fs_config`
--

CREATE TABLE `fs_config` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `data_type` varchar(50) DEFAULT 'text',
  `is_common` tinyint(1) NOT NULL DEFAULT 1,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `published` tinyint(4) NOT NULL DEFAULT 1,
  `lang` varchar(255) DEFAULT 'vi'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_config`
--

INSERT INTO `fs_config` (`id`, `name`, `title`, `value`, `data_type`, `is_common`, `ordering`, `published`, `lang`) VALUES
(1, 'site_name', 'Site Name', 'New Moon', 'text', 1, 1, 1, 'vi'),
(2, 'title', 'Title', 'New Moon - Your Daily Source for Crypto Latest News &amp; Information', 'text', 1, 2, 1, 'vi'),
(3, 'meta_des', 'Meta description', 'Your Daily Source for Crypto Latest News &amp; Information', 'text', 1, 4, 1, 'vi'),
(4, 'mate_key', 'Meta keywords', 'Your Daily Source for Crypto Latest News &amp; Information', 'text', 1, 3, 1, 'vi'),
(5, 'admin_name', 'Admin name', '', 'text', 1, 8, 1, 'vi'),
(6, 'admin_email', 'Admin email', '', 'text', 1, 9, 1, 'vi'),
(7, 'main_title', 'Đuôi tiêu đề', '', 'text', 1, 5, 1, 'vi'),
(8, 'main_meta_key', 'Thẻ meta_key chính', '', 'text', 1, 6, 0, 'vi'),
(9, 'main_meta_des', 'Thẻ meta_des chính', '', 'text', 1, 7, 0, 'vi'),
(10, 'contact', 'Liên hệ', '', 'editor', 1, 100, 1, 'vi'),
(11, 'footer_info', 'Thông tin chân trang', '', 'editor', 1, 13, 0, 'vi'),
(21, 'link_google', 'Link Google+', 'https://plus.google.com/', 'text', 1, 20, 0, 'vi'),
(22, 'link_youtube', 'Link Youtube', 'https://youtube.com', 'text', 1, 20, 1, 'vi'),
(14, 'ganalytics', 'Google Analytics ID', '', 'text', 1, 11, 1, 'vi'),
(15, 'license', 'license', '62b95176555ef61086ceb33f6d3b1b7d', 'text', 1, 11, 0, 'vi'),
(16, 'hotline', 'Hotline', '', 'text', 1, 10, 1, 'vi'),
(17, 'link_facebook', 'Link Facebook', 'https://facebook.com', 'text', 1, 20, 1, 'vi'),
(18, 'link_twitter', 'Link Twitter', 'https://twitter.com/newmoon_tv', 'text', 1, 20, 1, 'vi'),
(23, 'tags', 'Trending Search', 'Airdrop,BSC,Perspective,Metamask,Panorama,Wallet,Exchange', 'text', 1, 14, 1, 'vi'),
(24, 'link_discord', 'Link discord', '', 'text', 1, 20, 1, 'vi'),
(45, 'link_telegram', 'Link telegram', 'https://t.me/newmoon_news', 'text', 1, 20, 1, 'vi');

-- --------------------------------------------------------

--
-- Table structure for table `fs_config_modules`
--

CREATE TABLE `fs_config_modules` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL COMMENT 'Tên module hoặc type',
  `view` varchar(255) DEFAULT NULL,
  `task` varchar(255) DEFAULT NULL COMMENT 'Mặc định là display',
  `published` tinyint(4) NOT NULL DEFAULT 1,
  `ordering` varchar(255) DEFAULT NULL,
  `cache` int(11) DEFAULT NULL,
  `params` text DEFAULT NULL,
  `fields_seo_title` varchar(255) DEFAULT NULL COMMENT 'số 1 đứng đằng trước trường tức là "AND" là luôn cộng vào\r\nsố 0 đứng đằng trước trường là "OR" là có tham số trước nó rồi thì sau sẽ ko cộng thêm vào nữa',
  `fields_seo_keyword` varchar(255) DEFAULT NULL COMMENT 'số 1 đứng đằng trước trường tức là "AND" là luôn cộng vào\r\nsố 0 đứng đằng trước trường là "OR" là có tham số trước nó rồi thì sau sẽ ko cộng thêm vào nữa',
  `fields_seo_description` varchar(255) DEFAULT NULL COMMENT 'số 1 đứng đằng trước trường tức là "AND" là luôn cộng vào\r\nsố 0 đứng đằng trước trường là "OR" là có tham số trước nó rồi thì sau sẽ ko cộng thêm vào nữa',
  `fields_seo_h1` varchar(255) DEFAULT NULL,
  `fields_seo_h2` varchar(255) DEFAULT NULL,
  `fields_seo_image_alt` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_config_modules`
--

INSERT INTO `fs_config_modules` (`id`, `title`, `module`, `view`, `task`, `published`, `ordering`, `cache`, `params`, `fields_seo_title`, `fields_seo_keyword`, `fields_seo_description`, `fields_seo_h1`, `fields_seo_h2`, `fields_seo_image_alt`) VALUES
(24, 'Danh mục sản phẩm', 'products', 'cat', NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'Hãng sản xuất', 'products', 'manufactory', NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'Chi tiết sản phẩm', 'products', 'product', NULL, 1, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'Loại sản phẩm', 'products', 'types', NULL, 1, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'Danh mục tin', 'news', 'cat', NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'Chi tiết tin', 'news', 'news', '', 1, NULL, 21, NULL, '1,seo_title|1,title', '1,seo_keyword|2,summary', '1,title|1,summary|2,seo_keyword', 'summary', 'title|summary', '1,title|1,summary|2,seo_title'),
(30, 'Tìm kiếm tin', 'news', 'search', NULL, 1, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fs_contact`
--

CREATE TABLE `fs_contact` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `edited_time` datetime NOT NULL,
  `created_time` datetime NOT NULL,
  `published` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `fs_faqs`
--

CREATE TABLE `fs_faqs` (
  `id` int(11) NOT NULL,
  `summary` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `category_alias` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_id_wrapper` varchar(255) DEFAULT NULL,
  `category_alias_wrapper` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `source_website` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `editor` varchar(255) DEFAULT NULL,
  `show_in_homepage` tinyint(4) DEFAULT NULL,
  `hits` int(11) NOT NULL DEFAULT 0,
  `published` tinyint(4) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `title_display` varchar(255) DEFAULT NULL,
  `display_title` tinyint(4) NOT NULL DEFAULT 1,
  `display_column` int(11) NOT NULL,
  `tags_group` int(11) DEFAULT NULL,
  `rating_count` int(11) NOT NULL,
  `rating_sum` int(11) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `hot` tinyint(4) DEFAULT 0,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keyword` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_faqs`
--

INSERT INTO `fs_faqs` (`id`, `summary`, `content`, `tags`, `category_id`, `category_alias`, `category_name`, `category_id_wrapper`, `category_alias_wrapper`, `title`, `alias`, `image`, `creator`, `source_website`, `created_time`, `updated_time`, `editor`, `show_in_homepage`, `hits`, `published`, `ordering`, `title_display`, `display_title`, `display_column`, `tags_group`, `rating_count`, `rating_sum`, `keywords`, `hot`, `seo_title`, `seo_keyword`, `seo_description`) VALUES
(1, '', '<p>Chi ph&iacute; cho việc bảo tr&igrave; n&acirc;ng cấp app thường xuy&ecirc;n l&agrave; bao nhi&ecirc;u?</p>', NULL, 1, 'cau-hoi-thuong-gap', 'Câu hỏi thường gặp', ',1,', ',cau-hoi-thuong-gap,', 'Chi phí cho việc bảo trì nâng cấp app thường xuyên là bao nhiêu?', 'chi-phi-cho-viec-bao-tri-nang-cap-app-thuong-xuyen-la-bao-nhieu?', NULL, NULL, NULL, '2018-04-30 23:10:17', '2018-04-30 23:10:57', NULL, NULL, 0, 1, 1, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', ''),
(2, '', '<p>Việc quản l&yacute; v&agrave; đăng sản phẩm tr&ecirc;n app c&oacute; thuận tiện v&agrave; dễ d&agrave;ng sử dụng kh&ocirc;ng?</p>', NULL, 1, 'cau-hoi-thuong-gap', 'Câu hỏi thường gặp', ',1,', ',cau-hoi-thuong-gap,', 'Việc quản lý và đăng sản phẩm trên app có thuận tiện và dễ dàng sử dụng không?', 'viec-quan-ly-va-dang-san-pham-tren-app-co-thuan-tien-va-de-dang-su-dung-khong?', NULL, NULL, NULL, '2018-04-30 23:11:28', '2018-04-30 23:11:34', NULL, NULL, 0, 1, 2, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', ''),
(3, '', '<p>Thời gian thiết kế app b&aacute;n h&agrave;ng th&ocirc;ng thường khoảng bao l&acirc;u? C&oacute; hỗ trợ nhập dữ liệu kh&ocirc;ng?</p>', NULL, 1, 'cau-hoi-thuong-gap', 'Câu hỏi thường gặp', ',1,', ',cau-hoi-thuong-gap,', 'Thời gian thiết kế app bán hàng thông thường khoảng bao lâu? Có hỗ trợ nhập dữ liệu không?', 'thoi-gian-thiet-ke-app-ban-hang-thong-thuong-khoang-bao-lau?-co-ho-tro-nhap-du-lieu-khong?', NULL, NULL, NULL, '2018-04-30 23:11:41', '2018-04-30 23:11:48', NULL, NULL, 0, 1, 3, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', ''),
(4, '', '<p>Chi ph&iacute; cho việc bảo tr&igrave; n&acirc;ng cấp app thường xuy&ecirc;n l&agrave; bao nhi&ecirc;u?</p>', NULL, 1, 'cau-hoi-thuong-gap', 'Câu hỏi thường gặp', ',1,', ',cau-hoi-thuong-gap,', 'Chi phí cho việc bảo trì nâng cấp app thường xuyên là bao nhiêu?', 'chi-phi-cho-viec-bao-tri-nang-cap-app-thuong-xuyen-la-bao-nhieu?', NULL, NULL, NULL, '2018-04-30 23:11:59', '2018-04-30 23:12:11', NULL, NULL, 0, 1, 4, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', ''),
(5, '', '<p>Việc quản l&yacute; v&agrave; đăng sản phẩm tr&ecirc;n app c&oacute; thuận tiện v&agrave; dễ d&agrave;ng sử dụng kh&ocirc;ng?</p>', NULL, 1, 'cau-hoi-thuong-gap', 'Câu hỏi thường gặp', ',1,', ',cau-hoi-thuong-gap,', 'Việc quản lý và đăng sản phẩm trên app có thuận tiện và dễ dàng sử dụng không?', 'viec-quan-ly-va-dang-san-pham-tren-app-co-thuan-tien-va-de-dang-su-dung-khong?', NULL, NULL, NULL, '2018-04-30 23:12:20', '2018-04-30 23:12:25', NULL, NULL, 0, 1, 5, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', ''),
(6, '', '<p>Thời gian thiết kế app b&aacute;n h&agrave;ng th&ocirc;ng thường khoảng bao l&acirc;u? C&oacute; hỗ trợ nhập dữ liệu kh&ocirc;ng?</p>', NULL, 1, 'cau-hoi-thuong-gap', 'Câu hỏi thường gặp', ',1,', ',cau-hoi-thuong-gap,', 'Thời gian thiết kế app bán hàng thông thường khoảng bao lâu? Có hỗ trợ nhập dữ liệu không?', 'thoi-gian-thiet-ke-app-ban-hang-thong-thuong-khoang-bao-lau?-co-ho-tro-nhap-du-lieu-khong?', NULL, NULL, NULL, '2018-04-30 23:12:43', '2018-04-30 23:12:47', NULL, NULL, 0, 1, 6, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', ''),
(7, '', '<p>C&ocirc;ng ty c&oacute; thiết kế app chuy&ecirc;n d&agrave;nh cho c&aacute;c hệ thống quản l&yacute; nh&acirc;n sự kh&ocirc;ng?</p>', NULL, 1, 'cau-hoi-thuong-gap', 'Câu hỏi thường gặp', ',1,', ',cau-hoi-thuong-gap,', 'Công ty có thiết kế app chuyên dành cho các hệ thống quản lý nhân sự không?', 'cong-ty-co-thiet-ke-app-chuyen-danh-cho-cac-he-thong-quan-ly-nhan-su-khong?', NULL, NULL, NULL, '2018-04-30 23:12:59', '2018-04-30 23:13:05', NULL, NULL, 0, 1, 7, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', ''),
(8, '', '<p>Bảo tr&igrave; sản phẩm app thiết kế tại Finalstyle l&agrave; bao nhi&ecirc;u l&acirc;u? c&oacute; hỗ trợ miễn ph&iacute; trong qu&aacute; tr&igrave;nh hoạt động kh&ocirc;ng?</p>', NULL, 1, 'cau-hoi-thuong-gap', 'Câu hỏi thường gặp', ',1,', ',cau-hoi-thuong-gap,', 'Bảo trì sản phẩm app thiết kế tại Finalstyle là bao nhiêu lâu? có hỗ trợ miễn phí trong quá trình hoạt động không?', 'bao-tri-san-pham-app-thiet-ke-tai-finalstyle-la-bao-nhieu-lau?-co-ho-tro-mien-phi-trong-qua-trinh-hoat-dong-khong?', NULL, NULL, NULL, '2018-04-30 23:13:32', '2018-04-30 23:13:38', NULL, NULL, 0, 1, 8, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', ''),
(9, '', '<p>Chi ph&iacute; cho việc thiết kế app d&agrave;nh ri&ecirc;ng cho ch&uacute;ng t&ocirc;i như thế n&agrave;o?</p>', NULL, 1, 'cau-hoi-thuong-gap', 'Câu hỏi thường gặp', ',1,', ',cau-hoi-thuong-gap,', 'Chi phí cho việc thiết kế app dành riêng cho chúng tôi như thế nào?', 'chi-phi-cho-viec-thiet-ke-app-danh-rieng-cho-chung-toi-nhu-the-nao?', NULL, NULL, NULL, '2018-04-30 23:13:45', '2018-04-30 23:13:50', NULL, NULL, 0, 1, 9, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', ''),
(10, '', '<p>Việc kh&aacute;ch h&agrave;ng thường xuy&ecirc;n sử dụng smartphone hoặc tablet để duyệt web cho thấy cơ hội quảng b&aacute; sản phẩm của bạn l&agrave; rất lớn. Với app d&agrave;nh ri&ecirc;ng cho di động m&agrave; ch&uacute;ng t&ocirc;i thiết kế, kh&aacute;ch h&agrave;ng của bạn dễ d&agrave;ng trải nghiệm những tiện &iacute;ch v&agrave; mua sắm an to&agrave;n, mang lại doanh thu cho doanh nghiệp. Với đội ngũ kỹ thuật kinh nghiệm l&acirc;u năm sẽ mang lại sản phẩm tốt nhất v&agrave; tối ưu nhất cho bạn.</p>', NULL, 1, 'cau-hoi-thuong-gap', 'Câu hỏi thường gặp', ',1,', ',cau-hoi-thuong-gap,', 'Tôi có nên xem xét dùng app cho hệ thống website bán hàng hiện nay không?', 'toi-co-nen-xem-xet-dung-app-cho-he-thong-website-ban-hang-hien-nay-khong?', NULL, NULL, NULL, '2018-04-30 23:13:56', '2018-04-30 23:14:08', NULL, NULL, 0, 1, 10, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `fs_faqs_categories`
--

CREATE TABLE `fs_faqs_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `alias_wrapper` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `list_parents` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `published` tinyint(4) NOT NULL DEFAULT 1,
  `ordering` int(11) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `show_in_homepage` tinyint(4) NOT NULL DEFAULT 1,
  `estore_id` int(11) DEFAULT NULL,
  `display_title` tinyint(4) NOT NULL DEFAULT 1,
  `display_tags` tinyint(4) NOT NULL DEFAULT 1,
  `display_related` tinyint(4) NOT NULL DEFAULT 1,
  `display_created_time` tinyint(4) NOT NULL DEFAULT 1,
  `display_category` tinyint(4) NOT NULL DEFAULT 1,
  `display_comment` tinyint(4) NOT NULL DEFAULT 1,
  `display_sharing` tinyint(4) NOT NULL DEFAULT 1,
  `name_display` varchar(255) NOT NULL,
  `is_comment` tinyint(4) NOT NULL,
  `notice` tinyint(4) DEFAULT 0 COMMENT 'Danh mục tin thông báo',
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keyword` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_faqs_categories`
--

INSERT INTO `fs_faqs_categories` (`id`, `name`, `alias`, `category_id`, `alias_wrapper`, `parent_id`, `list_parents`, `level`, `published`, `ordering`, `image`, `icon`, `created_time`, `updated_time`, `show_in_homepage`, `estore_id`, `display_title`, `display_tags`, `display_related`, `display_created_time`, `display_category`, `display_comment`, `display_sharing`, `name_display`, `is_comment`, `notice`, `seo_title`, `seo_keyword`, `seo_description`) VALUES
(1, 'Câu hỏi thường gặp', 'cau-hoi-thuong-gap', NULL, ',cau-hoi-thuong-gap,', 0, ',1,', 0, 1, 1, NULL, NULL, '2018-04-30 23:06:14', '2018-04-30 23:06:14', 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `fs_groups`
--

CREATE TABLE `fs_groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `description` text CHARACTER SET latin1 DEFAULT NULL,
  `published` tinyint(4) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `edit_other` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_groups`
--

INSERT INTO `fs_groups` (`id`, `group_name`, `description`, `published`, `ordering`, `created_time`, `creator`, `updated_time`, `edit_other`) VALUES
(1, 'Super Admin', 'full permission', 1, 1, '2015-02-26 07:10:35', 1, '2015-02-26 07:10:35', 0),
(55, 'Content', NULL, 1, 1, '2022-05-06 08:40:48', NULL, '2022-05-06 08:40:48', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fs_groups_permission`
--

CREATE TABLE `fs_groups_permission` (
  `id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `module_type_id` int(11) DEFAULT NULL,
  `permission` int(4) DEFAULT NULL COMMENT '3: view\r\n5: edit\r\n7: delete'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- Dumping data for table `fs_groups_permission`
--

INSERT INTO `fs_groups_permission` (`id`, `group_id`, `module_type_id`, `permission`) VALUES
(1, 28, 1, 3),
(2, 28, 2, 3),
(3, 28, 3, 0),
(4, 28, 4, 3),
(5, 29, 1, 5),
(6, 29, 2, 7),
(7, 29, 3, 5),
(8, 29, 4, 5),
(9, 30, 1, 5),
(10, 30, 2, 7),
(11, 30, 3, 5),
(12, 30, 4, 3),
(24, 43, 4, 3),
(23, 43, 3, 3),
(22, 43, 2, 3),
(21, 43, 1, 3),
(25, 44, 1, 7),
(26, 44, 2, 7),
(27, 44, 3, 7),
(28, 44, 4, 7),
(29, 45, 1, 7),
(30, 45, 2, 7),
(31, 45, 3, 7),
(32, 45, 4, 7),
(33, 1, 1, 3),
(34, 1, 2, 7),
(35, 1, 3, 7),
(36, 1, 4, 7),
(134, 1, 5, 0),
(135, 1, 6, 0),
(136, 1, 7, 0),
(137, 1, 8, 0),
(138, 1, 11, 0),
(139, 1, 13, 0),
(140, 1, 15, 0),
(141, 1, 16, 0),
(142, 1, 17, 0),
(143, 1, 22, 0),
(144, 1, 23, 0),
(145, 55, 1, 0),
(146, 55, 3, 5),
(147, 55, 4, 0),
(148, 55, 5, 0),
(149, 55, 6, 0),
(150, 55, 7, 0),
(151, 55, 11, 0),
(152, 55, 17, 0),
(153, 55, 23, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fs_languages`
--

CREATE TABLE `fs_languages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lang_sort` varchar(255) DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_languages`
--

INSERT INTO `fs_languages` (`id`, `language`, `lang_sort`, `is_default`) VALUES
(1, 'Việt Nam', 'vi', 1),
(2, 'English', 'en', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fs_languages_contents`
--

CREATE TABLE `fs_languages_contents` (
  `id` int(11) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `published` tinyint(4) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `fs_languages_tables`
--

CREATE TABLE `fs_languages_tables` (
  `id` int(11) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `ordering` int(11) DEFAULT 1,
  `name` varchar(255) DEFAULT NULL,
  `main_field_display` varchar(255) DEFAULT NULL COMMENT 'field to display main when show records',
  `edited_time` datetime DEFAULT NULL,
  `published` int(11) NOT NULL DEFAULT 1,
  `field_not_display` text DEFAULT NULL COMMENT 'các trường ko hiển thị',
  `field_synchronize` text DEFAULT NULL COMMENT 'Các trường luôn phải lấy theo trang gốc, ko thay đổi theo ngôn ngữ',
  `field_inner_change_simultaneously` varchar(255) DEFAULT NULL COMMENT 'Những trường (ẩn) trong bảng tự động thay đổi theo, thay đổi cùng lúc save',
  `field_inner_change_after` varchar(255) DEFAULT NULL COMMENT 'Những trường (ẩn) trong bảng tự động thay đổi theo, thay đổi sau khi lưu record',
  `field_outer_change` varchar(255) DEFAULT NULL COMMENT 'những trường ngoài bảng tự động thay đổi theo\r\nfield_outer_change => field_inner_from|table_outer|function|field_compare_inner|field_compare_outer'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_languages_tables`
--

INSERT INTO `fs_languages_tables` (`id`, `table_name`, `ordering`, `name`, `main_field_display`, `edited_time`, `published`, `field_not_display`, `field_synchronize`, `field_inner_change_simultaneously`, `field_inner_change_after`, `field_outer_change`) VALUES
(3, 'fs_menus_items', 1, 'Menu', 'name', '0000-00-00 00:00:00', 1, ',alias,target,link,template,list_parent,', NULL, NULL, NULL, NULL),
(11, 'fs_news', 3, 'Tin tức', 'title', NULL, 1, ',category_alias,category_name,category_id_wrapper,category_alias_wrapper,editor,creator,source_website,alias,', NULL, NULL, NULL, NULL),
(12, 'fs_news_categories', 2, 'Danh mục tin tức', 'name', NULL, 1, ',alias_wrapper,list_parents,icon,parent_id,alias,', ',list_parents,', 'alias_wrapper=>list_parents|generate_alias_wrapper;\r\n', NULL, 'category_alias=>alias|fs_news||id|category_id;'),
(13, 'fs_products_categories', 4, 'Danh mục sản phẩm', 'name', NULL, 1, ',category_alias,category_name,category_id_wrapper,category_alias_wrapper,editor,creator,source_website,alias,', NULL, 'alias_wrapper=>list_parents|generate_alias_wrapper;', NULL, 'category_alias=>alias|fs_products||id|category_id;'),
(14, 'fs_products', 5, 'Sản phẩm', 'name', NULL, 1, ',category_alias,category_name,category_id_wrapper,category_alias_wrapper,category_root_alias,editor,creator,discount_unit,currency,color,size,origin,tags,code,alias,', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fs_languages_text`
--

CREATE TABLE `fs_languages_text` (
  `id` int(11) NOT NULL,
  `lang_key` varchar(255) NOT NULL,
  `lang_vi` varchar(255) DEFAULT NULL,
  `lang_en` varchar(255) DEFAULT NULL,
  `lang_jp` varchar(255) DEFAULT NULL,
  `is_common` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(100) DEFAULT NULL,
  `admin_change` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `fs_languages_text_admin`
--

CREATE TABLE `fs_languages_text_admin` (
  `id` int(11) NOT NULL,
  `lang_key` varchar(255) NOT NULL,
  `lang_vi` varchar(255) DEFAULT NULL,
  `lang_en` varchar(255) DEFAULT NULL,
  `lang_fr` varchar(255) DEFAULT NULL,
  `is_common` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(100) DEFAULT NULL,
  `admin_change` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_languages_text_admin`
--

INSERT INTO `fs_languages_text_admin` (`id`, `lang_key`, `lang_vi`, `lang_en`, `lang_fr`, `is_common`, `module`, `admin_change`) VALUES
(1, 'Languages', 'Ngôn ngữ', 'Languages', '', 1, NULL, 1),
(2, 'Configuration', 'Cấu hình', 'Configuration', NULL, 1, NULL, 1),
(3, 'Banner', 'Quảng cáo', 'Banner', NULL, 1, NULL, 1),
(4, 'Contact', 'Liên hệ', 'Contact', NULL, 1, NULL, 1),
(5, 'Translate phrases (backend)', 'Ngôn ngữ admin', 'Translate phrases (backend)', NULL, 1, NULL, 1),
(6, 'Translate phrases (font-end)', 'Ngôn ngữ website', 'Translate phrases (font-end)', NULL, 1, NULL, 1),
(7, 'Translate content', 'Dịch nội dung', 'Translate content', NULL, 1, NULL, 1),
(8, 'Synchronize', 'Đồng bộ nội dung', 'Synchronize', NULL, 1, NULL, 1),
(9, 'summary', 'Mô tả', 'Description', NULL, 1, NULL, 1),
(10, 'Thành viên quản trị', 'Thành viên quản trị', 'Users manager', NULL, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fs_local_cities`
--

CREATE TABLE `fs_local_cities` (
  `id` int(11) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `regions_id` int(11) DEFAULT 1,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `shipping` int(11) DEFAULT 0,
  `ordering` int(11) DEFAULT NULL,
  `published` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_local_cities`
--

INSERT INTO `fs_local_cities` (`id`, `country_id`, `regions_id`, `code`, `name`, `shipping`, `ordering`, `published`) VALUES
(1, 66, 1, NULL, 'Hà Nội', 40000, 1, 1),
(3, 66, 1, NULL, 'Hải Phòng', 40000, 4, 1),
(4, 66, 1, NULL, 'Bắc Giang', 40000, 10, 1),
(5, 66, 1, NULL, 'Bắc Kạn', 40000, 9, 1),
(6, 66, 1, NULL, 'Bắc Ninh', 40000, 11, 1),
(7, 66, 1, NULL, 'Cao Bằng', 40000, 18, 1),
(8, 66, 1, NULL, 'Điện Biên', 40000, 23, 1),
(9, 66, 1, NULL, 'Hà Giang', 40000, 25, 1),
(10, 66, 1, NULL, 'Hà Nam', 40000, 26, 1),
(11, 66, 1, NULL, 'Hải Dương', 40000, 28, 1),
(12, 66, 1, NULL, 'Hòa Bình', 40000, 29, 1),
(13, 66, 1, NULL, 'Hưng Yên', 40000, 31, 1),
(14, 66, 1, NULL, 'Lai Châu', 40000, 35, 1),
(15, 66, 1, NULL, 'Lạng Sơn', 40000, 37, 1),
(16, 66, 1, NULL, 'Lào Cai', 40000, 36, 1),
(17, 66, 1, NULL, 'Nam Định', 40000, 40, 1),
(18, 66, 1, NULL, 'Ninh Bình', 40000, 42, 1),
(19, 66, 1, NULL, 'Phú Thọ', 40000, 44, 1),
(20, 66, 1, NULL, 'Quảng Ninh', 40000, 49, 1),
(21, 66, 1, NULL, 'Sơn La', 40000, 52, 1),
(22, 66, 1, NULL, 'Thái Bình', 40000, 54, 1),
(23, 66, 1, NULL, 'Thái Nguyên', 40000, 55, 1),
(24, 66, 1, NULL, 'Thanh Hóa', 40000, 56, 1),
(25, 66, 1, NULL, 'Tuyên Quang', 40000, 60, 1),
(26, 66, 1, NULL, 'Vĩnh Phúc', 40000, 62, 1),
(27, 66, 1, NULL, 'Yên Bái', 40000, 63, 1),
(28, 66, 2, NULL, 'Đà Nẵng', 40000, 3, 1),
(29, 66, 2, NULL, 'Bình Định', 40000, 14, 1),
(30, 66, 2, NULL, 'Bình Phước', 40000, 15, 1),
(31, 66, 2, NULL, 'Bình Thuận', 40000, 16, 1),
(32, 66, 2, NULL, 'Đắk Lắk', 40000, 19, 1),
(33, 66, 2, NULL, 'Đắk Nông', 40000, 20, 1),
(34, 66, 2, NULL, 'Gia Lai', 40000, 24, 1),
(35, 66, 2, NULL, 'Hà Tĩnh', 40000, 27, 1),
(36, 66, 2, NULL, 'Khánh Hòa', 40000, 32, 1),
(37, 66, 2, NULL, 'Kon Tum', 40000, 34, 1),
(38, 66, 2, NULL, 'Lâm Đồng', 40000, 38, 1),
(39, 66, 2, NULL, 'Nghệ An', 40000, 41, 1),
(40, 66, 2, NULL, 'Ninh Thuận', 40000, 43, 1),
(41, 66, 2, NULL, 'Phú Yên', 40000, 45, 1),
(42, 66, 2, NULL, 'Quảng Bình', 40000, 46, 1),
(43, 66, 2, NULL, 'Quảng Nam', 40000, 47, 1),
(44, 66, 2, NULL, 'Quảng Ngãi', 40000, 48, 1),
(45, 66, 3, NULL, 'Cà Mau', 40000, 1, 1),
(46, 66, 3, NULL, 'Bạc Liêu', 40000, 2, 1),
(47, 66, 3, NULL, 'Sóc Trăng', 40000, 3, 1),
(48, 66, 3, NULL, 'Đồng Tháp', 40000, 4, 1),
(49, 66, 3, NULL, 'Bà Rịa - Vũng Tàu', 40000, 5, 1),
(50, 66, 3, NULL, 'Kiên Giang', 40000, 6, 1),
(51, 66, 3, NULL, 'Hậu Giang', 40000, 7, 1),
(52, 66, 3, NULL, 'Trà Vinh', 40000, 8, 1),
(53, 66, 3, NULL, 'Vĩnh Long', 40000, 9, 1),
(54, 66, 3, NULL, 'Bến Tre', 40000, 10, 1),
(55, 66, 3, NULL, 'Tiền Giang', 40000, 11, 1),
(56, 66, 3, NULL, 'An Giang', 40000, 12, 1),
(57, 66, 3, NULL, 'Bình Phước', 40000, 13, 1),
(58, 66, 3, NULL, 'Tây Ninh', 40000, 14, 1),
(59, 66, 3, NULL, 'Cần Thơ', 40000, 15, 1),
(60, 66, 3, NULL, 'Long An', 40000, 16, 1),
(61, 66, 3, NULL, 'Đồng Nai', 40000, 17, 1),
(62, 66, 3, NULL, 'Bình Dương', 40000, 18, 1),
(63, 66, 3, NULL, 'Hồ Chí Minh', 40000, 19, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fs_local_countries`
--

CREATE TABLE `fs_local_countries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `sort_name` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL COMMENT 'flag',
  `ordering` int(11) DEFAULT 0,
  `published` tinyint(4) NOT NULL DEFAULT 1,
  `created_time` datetime DEFAULT NULL,
  `edited_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_local_countries`
--

INSERT INTO `fs_local_countries` (`id`, `name`, `alias`, `sort_name`, `flag`, `ordering`, `published`, `created_time`, `edited_time`) VALUES
(1, 'Thụy Sĩ', 'thuy-si', NULL, NULL, 0, 1, NULL, NULL),
(2, 'Anh', 'anh', NULL, NULL, 0, 1, NULL, NULL),
(3, 'Hà Lan', 'ha-lan', NULL, NULL, 0, 1, NULL, NULL),
(4, 'Mexico', 'mexico', NULL, NULL, 0, 1, NULL, NULL),
(5, 'Morocco', 'morocco', NULL, NULL, 0, 1, NULL, NULL),
(6, 'Đan Mạch', 'dan-mach', NULL, NULL, 0, 1, NULL, NULL),
(7, 'Tây Ban Nha', 'tay-ban-nha', NULL, NULL, 0, 1, NULL, NULL),
(8, 'Đức', 'duc', NULL, NULL, 0, 1, NULL, NULL),
(9, 'Ba Lan', 'ba-lan', NULL, NULL, 0, 1, NULL, NULL),
(10, 'Italia', 'italia', NULL, NULL, 0, 1, NULL, NULL),
(11, 'Czech', 'czech', NULL, NULL, 0, 1, NULL, NULL),
(12, 'Brazil', 'brazil', NULL, NULL, 0, 1, NULL, NULL),
(13, 'Wales', 'wales', NULL, NULL, 0, 1, NULL, NULL),
(14, 'Cameroon', 'cameroon', NULL, NULL, 0, 1, NULL, NULL),
(15, 'Nga', 'nga', NULL, NULL, 0, 1, NULL, NULL),
(16, 'Bờ Biển Ngà', 'bo-bien-nga', NULL, NULL, 0, 1, NULL, NULL),
(17, 'Ghana', 'ghana', NULL, NULL, 0, 1, NULL, NULL),
(18, 'Ireland', 'ireland', NULL, NULL, 0, 1, NULL, NULL),
(19, 'Senegal', 'senegal', NULL, NULL, 0, 1, NULL, NULL),
(20, 'Mỹ', 'my', NULL, 'images/countries/original/usa_1349063791.jpg', 0, 1, NULL, '2012-10-01 11:56:31'),
(21, 'Australia', 'australia', NULL, NULL, 0, 1, NULL, NULL),
(22, 'Bulgaria', 'bulgaria', NULL, NULL, 0, 1, NULL, NULL),
(23, 'Scotland', 'scotland', NULL, NULL, 0, 1, NULL, NULL),
(24, 'Thụy Điển', 'thuy-dien', NULL, NULL, 0, 1, NULL, NULL),
(25, 'Congo', 'congo', NULL, NULL, 0, 1, NULL, NULL),
(26, 'New Zealand', 'new-zealand', NULL, NULL, 0, 1, NULL, NULL),
(27, 'Croatia', 'croatia', NULL, NULL, 0, 1, NULL, NULL),
(28, 'Zimbabwe', 'zimbabwe', NULL, NULL, 0, 1, NULL, NULL),
(29, 'Canada', 'canada', NULL, NULL, 0, 1, NULL, NULL),
(30, 'Grenada', 'grenada', NULL, NULL, 0, 1, NULL, NULL),
(31, 'Argentina', 'argentina', NULL, NULL, 0, 1, NULL, NULL),
(32, 'Nauy', 'nauy', NULL, NULL, 0, 1, NULL, NULL),
(33, 'Algeria', 'algeria', NULL, NULL, 0, 1, NULL, NULL),
(34, 'Iceland', 'iceland', NULL, NULL, 0, 1, NULL, NULL),
(35, 'Hungary', 'hungary', NULL, NULL, 0, 1, NULL, NULL),
(36, 'Phần Lan', 'phan-lan', NULL, NULL, 0, 1, NULL, NULL),
(37, 'Oman', 'oman', NULL, NULL, 0, 1, NULL, NULL),
(38, 'Jamaica', 'jamaica', NULL, NULL, 0, 1, NULL, NULL),
(39, 'Hàn Quốc', 'han-quoc', NULL, NULL, 0, 1, NULL, NULL),
(40, 'Serbia', 'serbia', NULL, NULL, 0, 1, NULL, NULL),
(41, 'Bồ Đào Nha', 'bo-dao-nha', NULL, NULL, 0, 1, NULL, NULL),
(42, 'Israel', 'israel', NULL, NULL, 0, 1, NULL, NULL),
(43, 'Nigeria', 'nigeria', NULL, NULL, 0, 1, NULL, NULL),
(44, 'Hy Lạp', 'hy-lap', NULL, NULL, 0, 1, NULL, NULL),
(45, 'Slovakia', 'slovakia', NULL, NULL, 0, 1, NULL, NULL),
(46, 'Bắc Ireland', 'bac-ireland', NULL, NULL, 0, 1, NULL, NULL),
(47, 'Uruguay', 'uruguay', NULL, 'images/countries/original/uruguay_1349064075.jpg', 0, 1, NULL, '2012-10-01 12:01:15'),
(48, 'Togo', 'togo', NULL, NULL, 0, 1, NULL, NULL),
(49, 'Bosnia and Herzegovina', 'bosnia-and-herzegovina', NULL, NULL, 0, 1, NULL, NULL),
(50, 'Paraguay', 'paraguay', NULL, NULL, 0, 1, NULL, NULL),
(51, 'Ecuador', 'ecuador', NULL, NULL, 0, 1, NULL, NULL),
(52, 'Colombia', 'colombia', NULL, NULL, 0, 1, NULL, NULL),
(53, 'Đảo Faroe', 'dao-faroe', NULL, NULL, 0, 1, NULL, NULL),
(54, 'Slovenia', 'slovenia', NULL, NULL, 0, 1, NULL, NULL),
(55, 'Latvia', 'latvia', NULL, NULL, 0, 1, NULL, NULL),
(56, 'Trinidad and Tobago', 'trinidad-and-tobago', NULL, NULL, 0, 1, NULL, NULL),
(57, 'Mali', 'mali', NULL, NULL, 0, 1, NULL, NULL),
(58, 'Ai Cập', 'ai-cap', NULL, NULL, 0, 1, NULL, NULL),
(59, 'Benin', 'benin', NULL, NULL, 0, 1, NULL, NULL),
(60, 'Nam Phi', 'nam-phi', NULL, NULL, 0, 1, NULL, NULL),
(61, 'Honduras', 'honduras', NULL, NULL, 0, 1, NULL, NULL),
(62, 'Romania', 'romania', NULL, NULL, 0, 1, NULL, NULL),
(63, 'Chile', 'chile', NULL, NULL, 0, 1, NULL, NULL),
(64, 'Barbados', 'barbados', NULL, NULL, 3, 1, NULL, NULL),
(65, 'Guadeloupe', 'guadeloupe', NULL, NULL, 2, 1, NULL, NULL),
(66, 'Việt Nam', 'viet-nam', NULL, 'images/countries/original/vietnam-flag_1349065079.gif', 1, 1, NULL, '2012-10-01 12:17:59'),
(67, 'Trung Quốc', 'trung-quoc', NULL, 'images/countries/original/China_1349063823.gif', 4, 1, '2012-07-24 10:28:57', '2012-10-01 11:57:22');

-- --------------------------------------------------------

--
-- Table structure for table `fs_local_districts`
--

CREATE TABLE `fs_local_districts` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `published` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_local_districts`
--

INSERT INTO `fs_local_districts` (`id`, `code`, `city_id`, `name`, `ordering`, `published`) VALUES
(1, NULL, 1, 'Q.Hoàn Kiếm', 1, 1),
(2, NULL, 1, 'Q.Ba Đình', 2, 1),
(3, NULL, 1, 'Q.Đống Đa ', 4, 1),
(4, NULL, 1, 'Q.Hai Bà Trưng', 6, 1),
(5, NULL, 1, 'Q.Thanh Xuân ', 7, 1),
(6, NULL, 1, 'Q.Tây Hồ', 5, 1),
(7, NULL, 1, 'Q.Cầu Giấy', 3, 1),
(8, NULL, 1, 'Q.Hoàng Mai', 10, 1),
(9, NULL, 1, 'Q.Long Biên', 8, 1),
(10, NULL, 1, 'H.Đông Anh', 13, 1),
(11, NULL, 1, 'H.Gia Lâm', 15, 1),
(12, NULL, 1, 'H.Sóc Sơn', 16, 1),
(13, NULL, 1, 'H.Thanh Trì', 9, 1),
(14, NULL, 1, 'H.Từ Liêm', 15, 1),
(15, NULL, 1, 'Q.Hà Đông', 11, 1),
(16, NULL, 1, 'TX.Sơn Tây', 13, 1),
(17, NULL, 1, 'H.Mê Linh', 21, 1),
(18, NULL, 1, 'H.Ba Vì', 19, 1),
(19, NULL, 1, 'H.Phúc Thọ', 24, 1),
(20, NULL, 1, 'H.Đan Phượng', 29, 1),
(21, NULL, 1, 'H.Hoài Đức', 20, 1),
(22, NULL, 1, 'H.Quốc Oai', 17, 1),
(23, NULL, 1, 'H.Thạch Thất', 25, 1),
(24, NULL, 1, 'H.Chương Mỹ', 18, 1),
(25, NULL, 1, 'H.Thanh Oai', 26, 1),
(26, NULL, 1, 'H.Thường Tín', 27, 1),
(27, NULL, 1, 'H.Phú Xuyên', 23, 1),
(28, NULL, 1, 'H.Ứng Hòa', 28, 1),
(29, NULL, 1, 'H.Mỹ Đức', 22, 1),
(30, NULL, 2, 'Quận 1', 3, 1),
(31, NULL, 2, 'Quận 2', 4, 1),
(32, NULL, 2, 'Quận 3', 3, 1),
(33, NULL, 2, 'Quận 4', 4, 1),
(34, NULL, 2, 'Quận 5', 5, 1),
(35, NULL, 2, 'Quận 6', 6, 1),
(36, NULL, 2, 'Quận 7', 7, 1),
(37, NULL, 2, 'Quận 8', 8, 1),
(38, NULL, 2, 'Quận 9', 9, 1),
(39, NULL, 2, 'Quận 10', 11, 1),
(40, NULL, 2, 'Quận 11', 11, 1),
(41, NULL, 2, 'Quận 12', 12, 1),
(42, NULL, 2, 'Quận Bình Tân', 13, 1),
(43, NULL, 2, 'Quận Bình Thạnh', 14, 1),
(44, NULL, 2, 'Quận Gò Vấp', 15, 1),
(45, NULL, 2, 'Quận Phú Nhuận', 16, 1),
(46, NULL, 2, 'Quận Tân Bình', 17, 1),
(47, NULL, 2, 'Quận Tân Phú', 18, 1),
(48, NULL, 2, 'Quận Thủ Đức', 19, 1),
(49, NULL, 2, 'H.Bình Chánh', 20, 1),
(50, NULL, 2, 'H.Cần Giờ', 21, 1),
(51, NULL, 2, 'H.Củ Chi', 22, 1),
(52, NULL, 2, 'H.Hóc Môn', 23, 1),
(53, NULL, 2, 'H.Nhà Bè', 24, 1),
(54, NULL, 3, 'H.An Lão', 9, 1),
(55, NULL, 3, 'Q.Đồ Sơn', 0, 1),
(56, NULL, 3, 'Q.Dương Kinh', 0, 1),
(57, NULL, 3, 'Q.Hải An', 0, 1),
(58, NULL, 3, 'Q.Hồng Bàng', 0, 1),
(59, NULL, 3, 'Q.Kiến An', 0, 1),
(60, NULL, 3, 'Q.Lê Chân', 0, 1),
(61, NULL, 3, 'Q.Ngô Quyền', 0, 1),
(62, NULL, 3, 'H.An Dương', 8, 1),
(63, NULL, 3, 'H.Bạch Long Vĩ', 15, 1),
(64, NULL, 3, 'H.Cát Hải', 10, 1),
(65, NULL, 3, 'H.Kiến Thụy', 11, 1),
(66, NULL, 3, 'H.Thủy Nguyên', 12, 1),
(67, NULL, 3, 'H.Tiên Lãng', 13, 1),
(68, NULL, 3, 'H.Vĩnh Bảo', 14, 1),
(69, NULL, 4, 'H.Tân Yên', 7, 1),
(70, NULL, 4, 'H.Việt Yên', 8, 1),
(71, NULL, 4, 'H.Yên Dũng', 9, 1),
(72, NULL, 4, 'H.Yên Thế', 10, 1),
(73, NULL, 4, 'TP.Bắc Giang', 1, 1),
(74, NULL, 4, 'H.Hiệp Hòa', 2, 1),
(75, NULL, 4, 'H.Lạng Giang', 3, 1),
(76, NULL, 4, 'H.Lục Nam', 4, 1),
(77, NULL, 4, 'H.Lục Ngạn', 5, 1),
(78, NULL, 4, 'H.Sơn Động', 6, 1),
(79, NULL, 5, 'H.Pac Nặm', 8, 1),
(80, NULL, 5, 'H.Ba Bể', 2, 1),
(81, NULL, 5, 'H.Bạch Thông', 3, 1),
(82, NULL, 5, 'H.Chợ Đồn', 5, 1),
(83, NULL, 5, 'H.Na Rì', 6, 1),
(84, NULL, 5, 'H.Ngân Sơn', 7, 1),
(85, NULL, 5, 'H.Chợ Mới', 4, 1),
(86, NULL, 5, 'TX.Bắc Kạn', 1, 1),
(87, NULL, 6, 'H.Lương Tài', 3, 1),
(88, NULL, 6, 'H.Quế Võ', 4, 1),
(89, NULL, 6, 'H.Thuận Thành', 5, 1),
(90, NULL, 6, 'H.Tiên Du', 6, 1),
(91, NULL, 6, 'H.Từ Sơn', 7, 1),
(92, NULL, 6, 'H.Yên Phong', 8, 1),
(93, NULL, 6, 'TP.Bắc Ninh', 1, 1),
(94, NULL, 6, 'H.Gia Bình', 2, 1),
(95, NULL, 7, 'TX.Cao Bằng', 1, 1),
(96, NULL, 7, 'H.Bảo Lạc', 2, 1),
(97, NULL, 7, 'H.Hạ Lang', 3, 1),
(98, NULL, 7, 'H.Hà Quảng', 4, 1),
(99, NULL, 7, 'H.Hòa An', 5, 1),
(100, NULL, 7, 'H.Nguyên Bình', 6, 1),
(101, NULL, 7, 'H.Quảng Hòa', 7, 1),
(102, NULL, 7, 'H.Thạch An', 8, 1),
(103, NULL, 7, 'H.Thông Nông', 9, 1),
(104, NULL, 7, 'H.Trà Lĩnh', 10, 1),
(105, NULL, 7, 'H.Trùng Khánh', 11, 1),
(106, NULL, 8, 'TP. Điện Biên Phủ', 1, 1),
(107, NULL, 8, 'TX.Lai Châu', 2, 1),
(108, NULL, 8, 'H.Mường Nhé', 5, 1),
(109, NULL, 8, 'H.Điện Biên', 8, 1),
(110, NULL, 8, 'H. Điện Biên Đông', 3, 1),
(111, NULL, 8, 'H.Tuần Giáo', 7, 1),
(112, NULL, 8, 'H.Tủa Chùa', 6, 1),
(113, NULL, 8, 'H.Mường Lay', 4, 1),
(114, NULL, 9, 'TX.Hà Giang', 1, 1),
(115, NULL, 9, 'H.Quang Bình', 7, 1),
(116, NULL, 9, 'H.Bắc Quang', 3, 1),
(117, NULL, 9, 'H.Mèo Vạc ', 5, 1),
(118, NULL, 9, 'H.Bắc Mê', 2, 1),
(119, NULL, 9, 'H.Đồng Văn', 10, 1),
(120, NULL, 9, 'H.Hoàng Su Phì', 4, 1),
(121, NULL, 9, 'H.Quản Bạ', 6, 1),
(122, NULL, 9, 'H.Vị Xuyên', 8, 1),
(123, NULL, 9, 'H.Xí Mần', 9, 1),
(124, NULL, 10, 'H.Lý Nhân', 5, 1),
(125, NULL, 10, 'TP.Phủ Lý', 1, 1),
(126, NULL, 10, 'H.Lục Bình', 4, 1),
(127, NULL, 10, 'H.Duy Tiên', 2, 1),
(128, NULL, 10, 'H.Kim Bảng', 3, 1),
(129, NULL, 10, 'H.Thanh Liêm', 6, 1),
(130, NULL, 11, 'H.Bình Giang', 3, 1),
(131, NULL, 11, 'H.Cẩm Giàng', 4, 1),
(132, NULL, 11, 'TX. Chí Linh', 2, 1),
(133, NULL, 11, 'H.Kim Thành', 6, 1),
(134, NULL, 11, 'H.Kinh Môn', 7, 1),
(135, NULL, 11, 'H.Thanh Hà', 10, 1),
(136, NULL, 11, 'H.Thanh Miện', 11, 1),
(137, NULL, 11, 'H.Tứ Kỳ', 12, 1),
(138, NULL, 11, 'TP.Hải Dương', 1, 1),
(139, NULL, 11, 'H.Gia Lộc', 5, 1),
(140, NULL, 11, 'H.Nam Sách', 8, 1),
(141, NULL, 11, 'H.Ninh Giang', 9, 1),
(142, NULL, 12, 'H.Kim Bôi', 3, 1),
(143, NULL, 12, 'H.Kỳ Sơn', 4, 1),
(144, NULL, 12, 'H.Lương Sơn', 7, 1),
(145, NULL, 12, 'TP.Hoà Bình', 1, 1),
(146, NULL, 12, 'H.Cao Phong', 2, 1),
(147, NULL, 12, 'H.Đà Bắc', 11, 1),
(148, NULL, 12, 'H.Lạc Sơn', 5, 1),
(149, NULL, 12, 'H.Lạc Thủy', 6, 1),
(150, NULL, 12, 'H.Mai Châu', 8, 1),
(151, NULL, 12, 'H.Tân Lạc', 9, 1),
(152, NULL, 12, 'H.Yên Thủy', 10, 1),
(153, NULL, 13, 'H.Khoái Châu', 3, 1),
(154, NULL, 13, 'H.Mỹ Hào ', 5, 1),
(155, NULL, 13, 'H.Phù Cừ ', 6, 1),
(156, NULL, 13, 'H.Văn Giang', 8, 1),
(157, NULL, 13, 'H.Văn Lâm', 9, 1),
(158, NULL, 13, 'H.Yên Mỹ', 10, 1),
(159, NULL, 13, 'TP.Hưng Yên', 1, 1),
(160, NULL, 13, 'H.Ân Thi', 2, 1),
(161, NULL, 13, 'H.Kim Động', 4, 1),
(162, NULL, 13, 'H.Tiên Lữ', 7, 1),
(163, NULL, 14, 'TX.Lai Châu', 1, 1),
(164, NULL, 14, 'H.Mường Tè', 2, 1),
(165, NULL, 14, 'H.Phong Thổ', 3, 1),
(166, NULL, 14, 'H.Sìn Hồ', 4, 1),
(167, NULL, 14, 'H.Tam Đường', 5, 1),
(168, NULL, 14, 'H.Than Uyên', 7, 1),
(169, NULL, 14, 'H.Tân Uyên', 6, 1),
(170, NULL, 15, 'TP.Lạng Sơn', 1, 1),
(171, NULL, 15, 'H.Tràng Định', 8, 1),
(172, NULL, 15, 'H.Văn Lãng', 9, 1),
(173, NULL, 15, 'H.Văn Quan', 10, 1),
(174, NULL, 15, 'H.Bình Gia', 3, 1),
(175, NULL, 15, 'H.Bắc Sơn', 2, 1),
(176, NULL, 15, 'H.Hữu Lũng', 6, 1),
(177, NULL, 15, 'H.Chi Lăng', 5, 1),
(178, NULL, 15, 'H.Cao Lộc', 4, 1),
(179, NULL, 15, 'H.Lộc Bình', 7, 1),
(180, NULL, 15, 'H.Đình Lập', 11, 1),
(181, NULL, 16, 'H.Sa Pa', 7, 1),
(182, NULL, 16, 'TP.Lào Cai', 1, 1),
(183, NULL, 16, 'H.Bảo Thắng', 3, 1),
(184, NULL, 16, 'H.Bảo Yên', 4, 1),
(185, NULL, 16, 'H.Bát Xát', 5, 1),
(186, NULL, 16, 'H.Bắc Hà', 2, 1),
(187, NULL, 16, 'H.Mường Khương', 6, 1),
(188, NULL, 16, 'H.Si Ma Cai', 8, 1),
(189, NULL, 16, 'H.Văn Bàn', 9, 1),
(190, NULL, 17, 'H.Nghĩa Hưng', 6, 1),
(191, NULL, 17, 'H.Vụ Bản', 8, 1),
(192, NULL, 17, 'TP. Nam Định', 1, 1),
(193, NULL, 17, 'H.Hải Hậu', 3, 1),
(194, NULL, 17, 'H.Giao Thủy', 2, 1),
(195, NULL, 17, 'H.Ý Yên', 10, 1),
(196, NULL, 17, 'H.Trực Ninh', 7, 1),
(197, NULL, 17, 'H.Xuân Trường', 9, 1),
(198, NULL, 17, 'H.Nam Trực', 5, 1),
(199, NULL, 17, 'H.Mỹ Lộc', 4, 1),
(200, NULL, 18, ' H.Hoa Lư', 3, 1),
(201, NULL, 18, 'H.Kim Sơn', 5, 1),
(202, NULL, 18, 'H.Nho Quan', 6, 1),
(203, NULL, 18, 'TP.Ninh Bình', 1, 1),
(204, NULL, 18, 'TX.Tam Điệp', 2, 1),
(205, NULL, 18, 'H.Gia Viễn', 4, 1),
(206, NULL, 18, 'H.Yên Khánh', 7, 1),
(207, NULL, 18, 'H.Yên Mô', 8, 1),
(208, NULL, 19, 'H.Đoan Hùng ', 13, 1),
(209, NULL, 19, 'H.Thanh Sơn', 10, 1),
(210, NULL, 19, 'TP. Việt Trì', 1, 1),
(211, NULL, 19, 'TX Phú Thọ', 2, 1),
(212, NULL, 19, 'H.Cẩm Khê', 3, 1),
(213, NULL, 19, 'H.Hạ Hòa', 4, 1),
(214, NULL, 19, 'H.Lâm Thao', 5, 1),
(215, NULL, 19, 'H.Phù Ninh', 6, 1),
(216, NULL, 19, 'H.Tam Nông', 7, 1),
(217, NULL, 19, 'H.Tân Sơn', 8, 1),
(218, NULL, 19, 'H.Thạch Ba', 9, 1),
(219, NULL, 19, 'H.Thanh Thủy', 11, 1),
(220, NULL, 19, 'H.Yên Lập', 12, 1),
(221, NULL, 20, 'H.Đầm Hà', 13, 1),
(222, NULL, 20, 'H.Đông Triều', 14, 1),
(223, NULL, 20, 'H.Hoành Bồ', 10, 1),
(224, NULL, 20, 'H.Yên Hưng', 12, 1),
(225, NULL, 20, ' H.Vân Đồn', 5, 1),
(226, NULL, 20, 'TP. Hạ Long', 1, 1),
(227, NULL, 20, 'TX.Cẩm Phả', 3, 1),
(228, NULL, 20, 'TP.Móng Cái', 2, 1),
(229, NULL, 20, 'TX.Uông Bí', 4, 1),
(230, NULL, 20, 'H.Ba Chế', 6, 1),
(231, NULL, 20, 'H.Bình Liêu', 7, 1),
(232, NULL, 20, 'H.Cô Tô', 8, 1),
(233, NULL, 20, 'H.Hải Hà', 9, 1),
(234, NULL, 20, 'H.Tiên Yên', 11, 1),
(235, NULL, 21, 'TP Sơn La', 1, 1),
(236, NULL, 21, 'H.Quỳnh Nhai', 7, 1),
(237, NULL, 21, 'H.Mường La', 5, 1),
(238, NULL, 21, 'H.Thuận Châu', 10, 1),
(239, NULL, 21, 'H.Phù Yên', 6, 1),
(240, NULL, 21, 'H.Bắc Yên', 2, 1),
(241, NULL, 21, 'H.Mai Sơn', 3, 1),
(242, NULL, 21, 'H.Sông Mã', 8, 1),
(243, NULL, 21, 'H.Yên Châu', 11, 1),
(244, NULL, 21, 'H.Mộc Châu', 4, 1),
(245, NULL, 21, 'H.Sốp Cộp', 9, 1),
(246, NULL, 22, 'H.Quỳnh Phụ', 4, 1),
(247, NULL, 22, 'H.Vũ Thư', 7, 1),
(248, NULL, 22, 'TP.Thái Bình', 1, 1),
(249, NULL, 22, 'H.Đông Hưng', 8, 1),
(250, NULL, 22, 'H.Hưng Hà', 2, 1),
(251, NULL, 22, 'H.Kiến Xương', 3, 1),
(252, NULL, 22, 'H.Thái Thụy', 5, 1),
(253, NULL, 22, 'H.Tiền Hải', 6, 1),
(254, NULL, 23, 'TP.Thái Nguyên', 1, 1),
(255, NULL, 23, 'H.Phổ Yên', 3, 1),
(256, NULL, 23, 'TX.Sông Công', 2, 1),
(257, NULL, 23, 'H.Phú Bình', 4, 1),
(258, NULL, 23, 'H.Đồng Hỷ', 9, 1),
(259, NULL, 23, 'H.Võ Nhai', 6, 1),
(260, NULL, 23, 'H.Định Hóa', 8, 1),
(261, NULL, 23, 'H.Đại Từ', 7, 1),
(262, NULL, 23, 'H.Phú Lương', 5, 1),
(263, NULL, 24, ' H.Quảng Xương', 4, 1),
(264, NULL, 24, ' H.Triệu Sơn', 5, 1),
(265, NULL, 24, 'TP.Thanh Hoá', 1, 1),
(266, NULL, 24, 'TX.Bỉm Sơn', 2, 1),
(267, NULL, 24, 'TX.Sầm Sơn', 3, 1),
(268, NULL, 24, 'H.Như Xuân', 16, 1),
(269, NULL, 24, 'H.Tĩnh Gia', 24, 1),
(270, NULL, 24, 'H.Đông Sơn', 27, 1),
(271, NULL, 24, 'H.Hoằng Hóa', 10, 1),
(272, NULL, 24, 'H.Yên Định', 26, 1),
(273, NULL, 24, 'H.Vĩnh Lộc', 25, 1),
(274, NULL, 24, 'H.Thiệu Hóa', 21, 1),
(275, NULL, 24, 'H.Hậu Lộc', 9, 1),
(276, NULL, 24, 'H.Nga Sơn', 13, 1),
(277, NULL, 24, 'H.Hà Trung', 8, 1),
(278, NULL, 24, 'H.Nông Cống', 17, 1),
(279, NULL, 24, 'H.Thọ Xuân', 22, 1),
(280, NULL, 24, 'H.Ngọc Lặc', 14, 1),
(281, NULL, 24, 'H.Cẩm Thủy', 7, 1),
(282, NULL, 24, 'H.Thạch Thành', 20, 1),
(283, NULL, 24, 'H.Như Thành', 15, 1),
(284, NULL, 24, 'H.Thường Xuân', 23, 1),
(285, NULL, 24, 'H.Bá Thước', 6, 1),
(286, NULL, 24, 'H.Lang Chánh', 11, 1),
(287, NULL, 24, 'H.Quan Hóa', 18, 1),
(288, NULL, 24, 'H.Quan Sơn', 19, 1),
(289, NULL, 24, 'H.Mường Lát', 12, 1),
(290, NULL, 25, 'TX.Tuyên Quang', 1, 1),
(291, NULL, 25, 'H.Chiêm Hoá', 2, 1),
(292, NULL, 25, 'H.Yên Sơn', 6, 1),
(293, NULL, 25, 'H.Hàm Yên', 3, 1),
(294, NULL, 25, 'H.Na Hang', 4, 1),
(295, NULL, 25, 'H.Sơn Dương', 5, 1),
(296, NULL, 26, 'H.Bình Xuyên ', 3, 1),
(297, NULL, 26, 'H.Lập Thạch', 4, 1),
(298, NULL, 26, 'H.Tam Đảo', 7, 1),
(299, NULL, 26, 'H.Tam Dương', 6, 1),
(300, NULL, 26, 'TP.Vĩnh Yên ', 1, 1),
(301, NULL, 26, 'TX.Phúc Yên', 2, 1),
(302, NULL, 26, 'H.Sông Lô', 5, 1),
(303, NULL, 26, 'H.Vĩnh Tường', 8, 1),
(304, NULL, 26, 'H.Yên Lạc', 9, 1),
(305, NULL, 27, 'H.Yên Bình ', 9, 1),
(306, NULL, 27, 'TP.Yên Bái', 1, 1),
(307, NULL, 27, 'TX Nghĩa Lộ', 2, 1),
(308, NULL, 27, 'H.Lục Yên', 3, 1),
(309, NULL, 27, 'H.Mù Cang Chải', 4, 1),
(310, NULL, 27, 'H.Trấn Yên', 6, 1),
(311, NULL, 27, 'H.Trạm Tấu', 5, 1),
(312, NULL, 27, 'H.Văn Chấn', 7, 1),
(313, NULL, 27, 'H.Văn Yên', 8, 1),
(314, NULL, 28, 'Q.Cẩm Lệ', 0, 1),
(315, NULL, 28, 'Q.Hải Châu', 0, 1),
(316, NULL, 28, 'Q.Liên Chiểu', 0, 1),
(317, NULL, 28, 'Q.Ngũ Hành Sơn', 0, 1),
(318, NULL, 28, 'Q.Sơn Trà', 0, 1),
(319, NULL, 28, 'Q.Thanh Khê', 0, 1),
(320, NULL, 28, 'H.Hoà Vang', 7, 1),
(321, NULL, 28, 'Huyện đảo Hoàng Sa', 8, 1),
(322, NULL, 29, 'H.Hoài Nhơn', 5, 1),
(323, NULL, 29, 'TP.Quy Nhơn', 1, 1),
(324, NULL, 29, 'H.An Lão', 2, 1),
(325, NULL, 29, 'H.An Nhơn', 3, 1),
(326, NULL, 29, 'H.Hoài Ân', 4, 1),
(327, NULL, 29, 'H.Phù Cát', 6, 1),
(328, NULL, 29, 'H.Phù Mỹ', 7, 1),
(329, NULL, 29, 'H.Tây Sơn', 8, 1),
(330, NULL, 29, 'H.Tuy Phước', 9, 1),
(331, NULL, 29, 'H.Vân Canh', 10, 1),
(332, NULL, 29, 'H.Vĩnh Thạnh', 11, 1),
(333, NULL, 30, 'TX.Bình Long', 3, 1),
(334, NULL, 30, 'H.Bù Đốp', 6, 1),
(335, NULL, 30, 'H.Chơn Thành', 7, 1),
(336, NULL, 30, 'H.Đồng Phú', 10, 1),
(337, NULL, 30, 'H.Lộc Ninh', 9, 1),
(338, NULL, 30, 'TX.Phước Long', 2, 1),
(339, NULL, 30, 'TX.Đồng Xoài', 1, 1),
(340, NULL, 30, 'H.Bù Gia Mập', 4, 1),
(341, NULL, 30, 'H.Bù Đăng', 5, 1),
(342, NULL, 30, 'H.Hớn Quản', 8, 1),
(343, NULL, 31, 'H.Bắc Bình', 3, 1),
(344, NULL, 31, 'H.Đức Linh', 10, 1),
(345, NULL, 31, 'H.Hàm Tân', 4, 1),
(346, NULL, 31, 'H.Hàm Thuận Bắc', 5, 1),
(347, NULL, 31, 'H.Hàm Thuận Nam', 6, 1),
(348, NULL, 31, 'H.Tánh Linh', 8, 1),
(349, NULL, 31, 'H.Tuy Phong', 9, 1),
(350, NULL, 31, 'TP. Phan Thiết', 1, 1),
(351, NULL, 31, 'TX.La Gi', 2, 1),
(352, NULL, 31, 'H.Phú Quý', 7, 1),
(353, NULL, 32, 'H.Buôn Đôn', 2, 1),
(354, NULL, 32, 'H.Cư M gar', 4, 1),
(355, NULL, 32, 'H.Ea Kar', 6, 1),
(356, NULL, 32, 'H.Krông Ana', 8, 1),
(357, NULL, 32, 'H.Krông Buk', 10, 1),
(358, NULL, 32, 'H.Krông Pắc', 12, 1),
(359, NULL, 32, 'TP.Buôn Ma Thuột', 1, 1),
(360, NULL, 32, 'H.Ea Suop', 7, 1),
(361, NULL, 32, 'H.Ea H\'Leo', 5, 1),
(362, NULL, 32, 'H.Krông Bông', 9, 1),
(363, NULL, 32, 'H.Krông Năng', 11, 1),
(364, NULL, 32, 'H.Cư Kuin', 3, 1),
(365, NULL, 32, 'H.M\'Đrăk', 13, 1),
(366, NULL, 33, 'H.Đăk R\'Lâp', 7, 1),
(367, NULL, 33, 'TX.Gia Nghĩa', 1, 1),
(368, NULL, 33, 'H.Đăk Song', 8, 1),
(369, NULL, 33, 'H.Đăk Mil', 6, 1),
(370, NULL, 33, 'H.Tuy Đức', 5, 1),
(371, NULL, 33, 'H.Cư Jut', 2, 1),
(372, NULL, 33, 'H.Krông Nô', 3, 1),
(373, NULL, 33, 'H.Lăk', 4, 1),
(374, NULL, 34, 'H.Chưprông', 7, 1),
(375, NULL, 34, 'H.Ia Grai', 8, 1),
(376, NULL, 34, 'TP.Pleiku', 1, 1),
(377, NULL, 34, 'TX An Khê', 2, 1),
(378, NULL, 34, 'TX Ayunpa', 3, 1),
(379, NULL, 34, 'H.Chư Păh', 4, 1),
(380, NULL, 34, 'H.Chư Pưh', 5, 1),
(381, NULL, 34, 'H.Chư Sê', 6, 1),
(382, NULL, 34, 'H.Đắk Đoa', 16, 1),
(383, NULL, 34, 'H.Đak Pơ', 15, 1),
(384, NULL, 34, 'H.Đức Cơ', 17, 1),
(385, NULL, 34, 'H.La Pa', 12, 1),
(386, NULL, 34, 'H.Kbang', 9, 1),
(387, NULL, 34, 'H.Kông Chro', 10, 1),
(388, NULL, 34, 'H.Krông Pa', 11, 1),
(389, NULL, 34, 'H.Mang Yang', 13, 1),
(390, NULL, 34, 'H.Phú Thiện', 14, 1),
(391, NULL, 35, 'H.Cẩm Xuyên', 3, 1),
(392, NULL, 35, 'TP.Hà Tĩnh', 1, 1),
(393, NULL, 35, 'H.Can Lộc', 4, 1),
(394, NULL, 35, 'H.Đức Thọ', 12, 1),
(395, NULL, 35, 'TX Hồng Lĩnh', 2, 1),
(396, NULL, 35, 'H.Hương Khê', 5, 1),
(397, NULL, 35, 'H.Hương Sơn', 6, 1),
(398, NULL, 35, 'H.Kỳ Anh', 7, 1),
(399, NULL, 35, 'H.Nghi Xuân', 9, 1),
(400, NULL, 35, 'H.Thạch Hà', 10, 1),
(401, NULL, 35, 'H.Vũ Quang', 11, 1),
(402, NULL, 35, 'H.Lộc Hà', 8, 1),
(403, NULL, 36, 'H.Cam Lâm', 3, 1),
(404, NULL, 36, 'H.Khánh Vĩnh', 6, 1),
(405, NULL, 36, 'H.Ninh Hoà ', 7, 1),
(406, NULL, 36, 'H.Vạn Ninh', 8, 1),
(407, NULL, 36, 'TP.Nha Trang', 1, 1),
(408, NULL, 36, 'TX.Cam Ranh', 2, 1),
(409, NULL, 36, 'H.Diên Khánh', 4, 1),
(410, NULL, 36, 'H.Khánh Sơn', 5, 1),
(411, NULL, 36, 'Huyện đảo Trường Sa', 9, 1),
(412, NULL, 37, 'TP.KonTum', 1, 1),
(413, NULL, 37, 'H.Đắk Glei', 7, 1),
(414, NULL, 37, 'H.Đắk Hà', 8, 1),
(415, NULL, 37, 'H.Đắk Tô', 9, 1),
(416, NULL, 37, 'H.Kon Plông', 2, 1),
(417, NULL, 37, 'H.Kon Rẫy', 3, 1),
(418, NULL, 37, 'H.Ngọc Hồi', 4, 1),
(419, NULL, 37, 'H.Sa Thầy', 5, 1),
(420, NULL, 37, 'H.Tu Mơ Rông', 6, 1),
(421, NULL, 38, 'H.Bảo Lâm', 3, 1),
(422, NULL, 38, 'H.Đạ Huoai', 6, 1),
(423, NULL, 38, 'H.Di Linh', 0, 1),
(424, NULL, 38, 'H.Đức Trọng', 9, 1),
(425, NULL, 38, 'H.Lạc Dương', 0, 1),
(426, NULL, 38, 'H.Lâm Hà', 5, 1),
(427, NULL, 38, 'TP. Đà Lạt ', 1, 1),
(428, NULL, 38, 'TX.Bảo Lộc', 2, 1),
(429, NULL, 38, 'H.Đơn Dương', 8, 1),
(430, NULL, 38, 'H.Đạ Tẻh', 7, 1),
(431, NULL, 38, 'H.Cát Tiên', 4, 1),
(432, NULL, 39, 'H.Diễn Châu', 6, 1),
(433, NULL, 39, 'H.Đô Lương', 20, 1),
(434, NULL, 39, 'H.Hưng Nguyên', 7, 1),
(435, NULL, 39, 'H.Kỳ Sơn', 8, 1),
(436, NULL, 39, 'H.Nghi Lộc', 10, 1),
(437, NULL, 39, 'H.Quỳnh Lưu ', 15, 1),
(438, NULL, 39, 'H.Yên Thành', 19, 1),
(439, NULL, 39, 'TP.Vinh', 1, 1),
(440, NULL, 39, 'TX.Cửa Lò', 3, 1),
(441, NULL, 39, 'TX Thái Hòa', 2, 1),
(442, NULL, 39, 'H.Anh Sơn', 4, 1),
(443, NULL, 39, 'H.Con Cuông', 5, 1),
(444, NULL, 39, 'H.Quỳ Châu', 13, 1),
(445, NULL, 39, 'H.Nam Đàn', 9, 1),
(446, NULL, 39, 'H.Nghĩa Đàn', 11, 1),
(447, NULL, 39, 'H.Quế Phong', 12, 1),
(448, NULL, 39, 'H.Quỳ Hợp', 14, 1),
(449, NULL, 39, 'H.Tân Kỳ', 16, 1),
(450, NULL, 39, 'H.Thanh Chương', 17, 1),
(451, NULL, 39, 'H.Tương Dương', 18, 1),
(452, NULL, 40, 'H.Ninh Phước', 4, 1),
(453, NULL, 40, 'TP.Phan Rang-Tháp Chàm', 1, 1),
(454, NULL, 40, 'H.Ninh Sơn', 5, 1),
(455, NULL, 40, 'H.Bác Ái', 2, 1),
(456, NULL, 40, 'H.Ninh Hải', 3, 1),
(457, NULL, 40, 'H.Thuận Bắc', 6, 1),
(458, NULL, 40, 'H.Thuận Nam', 7, 1),
(459, NULL, 41, 'H.Sơn Hoà', 4, 1),
(460, NULL, 41, 'TP.Tuy Hòa', 1, 1),
(461, NULL, 41, 'TX Sông Cầu', 2, 1),
(462, NULL, 41, 'H.Đông Hòa', 8, 1),
(463, NULL, 41, 'H.Đồng Xuân', 9, 1),
(464, NULL, 41, 'H.Phú Hòa', 3, 1),
(465, NULL, 41, 'H.Sông Hinh', 5, 1),
(466, NULL, 41, 'H.Tây Hòa', 6, 1),
(467, NULL, 41, 'H.Tuy An', 7, 1),
(468, NULL, 42, 'TP.Đồng Hới', 1, 1),
(469, NULL, 42, 'H.Quảng Trạch', 6, 1),
(470, NULL, 42, 'H.Lệ Thuỷ ', 3, 1),
(471, NULL, 42, 'H.Bố Trạch', 2, 1),
(472, NULL, 42, 'H.Minh Hóa', 4, 1),
(473, NULL, 42, 'H.Quảng Ninh', 5, 1),
(474, NULL, 42, 'H.Tuyên Hóa', 7, 1),
(475, NULL, 43, 'H.Bắc Trà My', 4, 1),
(476, NULL, 43, 'H.Đại Lộc', 16, 1),
(477, NULL, 43, 'H.Điện Bàn', 7, 1),
(478, NULL, 43, 'H.Núi Thành', 10, 1),
(479, NULL, 43, 'H.Quế Sơn', 13, 1),
(480, NULL, 43, ' H.Thăng Bình', 3, 1),
(481, NULL, 43, 'TP.Tam Kỳ ', 1, 1),
(482, NULL, 43, 'TX.Hội An', 2, 1),
(483, NULL, 43, 'H.Nam Trà My', 8, 1),
(484, NULL, 43, 'H.Phước Sơn', 12, 1),
(485, NULL, 43, 'H.Tiên Phước', 15, 1),
(486, NULL, 43, 'H.Hiệp Đức', 6, 1),
(487, NULL, 43, 'H.Nông Sơn', 9, 1),
(488, NULL, 43, 'H.Đông Giang', 18, 1),
(489, NULL, 43, 'H.Nam Giang', 7, 1),
(490, NULL, 43, 'H.Phú Ninh', 11, 1),
(491, NULL, 43, 'H.Tây Giang', 14, 1),
(492, NULL, 43, 'H.Duy Xuyên', 5, 1),
(493, NULL, 44, 'H.Bình Sơn', 3, 1),
(494, NULL, 44, 'H.Đức Phổ', 14, 1),
(495, NULL, 44, 'H.Mộ Đức ', 6, 1),
(496, NULL, 44, 'H.Sơn Tịnh', 10, 1),
(497, NULL, 44, 'TP.Quảng Ngãi', 1, 1),
(498, NULL, 44, 'H.Ba Tơ', 2, 1),
(499, NULL, 44, 'H.Minh Long', 5, 1),
(500, NULL, 44, 'H.Nghĩa Hành', 7, 1),
(501, NULL, 44, 'H.Sơn Hà', 8, 1),
(502, NULL, 44, 'H.Sơn Tây', 9, 1),
(503, NULL, 44, 'H.Tây Trà', 11, 1),
(504, NULL, 44, 'H.Trà Bồng', 12, 1),
(505, NULL, 44, 'H.Tư Nghĩa', 13, 1),
(506, NULL, 44, 'H.Lý Sơn', 4, 1),
(507, NULL, 45, 'TP.Đông Hà', 1, 1),
(508, NULL, 45, 'TX Quảng Trị', 2, 1),
(509, NULL, 45, 'H.Cam Lộ', 3, 1),
(510, NULL, 45, 'H.Cồn Cỏ', 4, 1),
(511, NULL, 45, 'H.Đa Krông', 10, 1),
(512, NULL, 45, 'H.Gio Linh', 5, 1),
(513, NULL, 45, 'H.Hải Lăng', 6, 1),
(514, NULL, 45, 'H.Hướng Hóa', 7, 1),
(515, NULL, 45, 'H.Triệu Phong', 8, 1),
(516, NULL, 45, 'H.Vĩnh Linh', 9, 1),
(517, NULL, 46, 'TP. Huế ', 1, 1),
(518, NULL, 46, 'TX Hương Thủy', 2, 1),
(519, NULL, 46, 'H. A Lưới', 3, 1),
(520, NULL, 46, 'H. Hương Trà', 4, 1),
(521, NULL, 46, 'H.Nam Đông', 5, 1),
(522, NULL, 46, 'H.Phong Điền', 6, 1),
(523, NULL, 46, 'H.Phú Lộc', 7, 1),
(524, NULL, 46, 'H.Phú Vang', 8, 1),
(525, NULL, 46, 'H.Quảng Điền', 9, 1),
(526, NULL, 47, 'H.Thới Lai', 8, 1),
(527, NULL, 47, 'H.Phong Điền', 7, 1),
(528, NULL, 47, 'Q.Bình Thuỷ', 0, 1),
(529, NULL, 47, 'Q.Cái Răng', 0, 1),
(530, NULL, 47, 'Q.Ninh Kiều', 0, 1),
(531, NULL, 47, 'Q.Ô Môn', 0, 1),
(532, NULL, 47, 'Q.Thốt Nốt', 0, 1),
(533, NULL, 47, 'H.Cờ Đỏ', 6, 1),
(534, NULL, 47, 'H.Vĩnh Thạch', 9, 1),
(535, NULL, 48, 'H.Thoại Sơn', 9, 1),
(536, NULL, 48, 'TP.Long Xuyên', 1, 1),
(537, NULL, 48, 'TX Châu Đốc', 2, 1),
(538, NULL, 48, 'H.An Phú', 4, 1),
(539, NULL, 48, 'H.Châu Phú', 5, 1),
(540, NULL, 48, 'H.Châu Thành', 6, 1),
(541, NULL, 48, 'H.Chợ Mới', 7, 1),
(542, NULL, 48, 'H.Phú Tân', 8, 1),
(543, NULL, 48, 'H.Tịnh Biên', 10, 1),
(544, NULL, 48, 'H.Tri Tôn', 11, 1),
(545, NULL, 48, 'TX Tân Châu', 3, 1),
(546, NULL, 49, 'H.Châu Đức', 3, 1),
(547, NULL, 49, 'H.Côn Đảo', 4, 1),
(548, NULL, 49, 'H.Đất Đỏ', 8, 1),
(549, NULL, 49, 'H.Long Điền', 5, 1),
(550, NULL, 49, 'H.Tân Thành', 6, 1),
(551, NULL, 49, 'H.Xuyên Mộc', 7, 1),
(552, NULL, 49, 'TP.Vũng Tàu', 1, 1),
(553, NULL, 49, 'TX.Bà Rịa', 2, 1),
(554, NULL, 50, 'TX Bạc Liêu', 1, 1),
(555, NULL, 50, 'H.Phước Long', 5, 1),
(556, NULL, 50, 'H.Hồng Dân', 4, 1),
(557, NULL, 50, 'H.Vĩnh Lợi', 6, 1),
(558, NULL, 50, 'H.Giá Rai', 2, 1),
(559, NULL, 50, 'H.Đông Hải', 7, 1),
(560, NULL, 50, 'H.Hòa Bình', 3, 1),
(561, NULL, 51, 'H.Ba Tri', 2, 1),
(562, NULL, 51, 'H.Bình Đại', 3, 1),
(563, NULL, 51, 'H.Châu Thành', 4, 1),
(564, NULL, 51, 'H.Chợ Lách', 5, 1),
(565, NULL, 51, 'H.Giồng Trôm', 6, 1),
(566, NULL, 51, 'H.Mỏ Cày', 7, 1),
(567, NULL, 51, 'TX.Bến Tre', 1, 1),
(568, NULL, 51, 'H.Thạnh Phú', 8, 1),
(569, NULL, 52, 'H.Bến Cát', 2, 1),
(570, NULL, 52, 'H.Dầu Tiếng', 3, 1),
(571, NULL, 52, 'H.Dĩ An', 4, 1),
(572, NULL, 52, 'H.Phú Giáo', 5, 1),
(573, NULL, 52, 'H.Tân Uyên', 6, 1),
(574, NULL, 52, 'H.Thuận An', 7, 1),
(575, NULL, 52, 'TX.Thủ Dầu Một', 1, 1),
(576, NULL, 53, 'H.Năm Căn', 3, 1),
(577, NULL, 53, 'TP. Cà Mau', 1, 1),
(578, NULL, 53, 'H.Cái Nước', 2, 1),
(579, NULL, 53, 'H.Ngọc Hiển', 4, 1),
(580, NULL, 53, 'H.Thới Bình', 5, 1),
(581, NULL, 53, 'H.Trần Văn Thời', 6, 1),
(582, NULL, 53, 'H.U Minh', 7, 1),
(583, NULL, 53, 'H.Đầm Dơi', 8, 1),
(584, NULL, 54, 'H.Cẩm Mỹ', 3, 1),
(585, NULL, 54, 'H.Định Quán', 11, 1),
(586, NULL, 54, 'H.Long Thành', 4, 1),
(587, NULL, 54, 'H.Nhơn Trạch', 5, 1),
(588, NULL, 54, 'H.Thống Nhất', 7, 1),
(589, NULL, 54, 'H.Trảng Bom', 8, 1),
(590, NULL, 54, 'H.Vĩnh Cửu', 9, 1),
(591, NULL, 54, 'H.Xuân Lộc', 10, 1),
(592, NULL, 54, 'TP.Biên Hoà', 1, 1),
(593, NULL, 54, 'TX.Long Khánh', 2, 1),
(594, NULL, 54, 'H.Tân Phú', 6, 1),
(595, NULL, 55, 'H.Châu Thành', 3, 1),
(596, NULL, 55, 'H.Lai Vung', 5, 1),
(597, NULL, 55, 'H.Tháp Mười', 10, 1),
(598, NULL, 55, 'TP.Cao Lãnh', 1, 1),
(599, NULL, 55, 'TX.Sa Đéc', 2, 1),
(600, NULL, 55, 'H.Hồng Ngự', 4, 1),
(601, NULL, 55, 'H.Lấp Vò', 6, 1),
(602, NULL, 55, 'H.Tam Nông', 7, 1),
(603, NULL, 55, 'H.Tân Hồng', 8, 1),
(604, NULL, 55, 'H.Thanh Bình', 9, 1),
(605, NULL, 56, 'TX.Vị Thanh', 1, 1),
(606, NULL, 56, 'TX. Ngã Bảy', 2, 1),
(607, NULL, 56, 'H.Châu Thành', 3, 1),
(608, NULL, 56, 'H.Châu Thành A', 4, 1),
(609, NULL, 56, 'H.Long Mỹ', 5, 1),
(610, NULL, 56, 'H.Phụng Hiệp', 6, 1),
(611, NULL, 56, 'H.Vị Thủy', 7, 1),
(612, NULL, 57, 'H.Phú Quốc', 12, 1),
(613, NULL, 57, 'TP.Rạch Giá', 1, 1),
(614, NULL, 57, 'TX. Hà Tiên', 2, 1),
(615, NULL, 57, 'H.An Biên', 3, 1),
(616, NULL, 57, 'H.An Minh', 4, 1),
(617, NULL, 57, 'H.Châu Thành', 5, 1),
(618, NULL, 57, 'H.Giồng Riềng', 7, 1),
(619, NULL, 57, 'H.Gò Quao', 8, 1),
(620, NULL, 57, 'H.Hòn Đất', 9, 1),
(621, NULL, 57, 'H.Kiên Hải', 10, 1),
(622, NULL, 57, 'H.Kiên Lương', 11, 1),
(623, NULL, 57, 'H.Tân Hiệp', 13, 1),
(624, NULL, 57, 'H.Vĩnh Thuận', 15, 1),
(625, NULL, 57, 'H.U Minh Thượng', 14, 1),
(626, NULL, 57, 'H.Giang Thành', 6, 1),
(627, NULL, 58, 'H.Bến Lức ', 2, 1),
(628, NULL, 58, 'H.Cần Đước', 4, 1),
(629, NULL, 58, 'H.Cần Giuộc', 3, 1),
(630, NULL, 58, 'H.Đức Hoà', 13, 1),
(631, NULL, 58, 'H.Đức Huệ', 14, 1),
(632, NULL, 58, 'H.Mộc Hoá ', 6, 1),
(633, NULL, 58, 'H.Tân Trụ', 9, 1),
(634, NULL, 58, 'H.Thủ Thừa', 11, 1),
(635, NULL, 58, 'TX.Tân An', 1, 1),
(636, NULL, 58, 'H.Thạch Hóa', 10, 1),
(637, NULL, 58, 'H.Châu Thành', 5, 1),
(638, NULL, 58, 'H.Tân Hưng', 7, 1),
(639, NULL, 58, 'H.Tân Thạch', 8, 1),
(640, NULL, 58, 'H.Vĩnh Hưng', 12, 1),
(641, NULL, 59, 'H.Mỹ Xuyên', 7, 1),
(642, NULL, 59, 'TP.Sóc Trăng', 1, 1),
(643, NULL, 59, 'H.Cù Lao Dung', 3, 1),
(644, NULL, 59, 'H.Kế Sách', 4, 1),
(645, NULL, 59, 'H.Long Phú', 5, 1),
(646, NULL, 59, 'H.Mỹ Tú', 6, 1),
(647, NULL, 59, 'H.Ngã Năm', 8, 1),
(648, NULL, 59, 'H.Thạch Trị', 9, 1),
(649, NULL, 59, 'H.Vĩnh Châu', 11, 1),
(650, NULL, 59, 'H.Châu Thành', 2, 1),
(651, NULL, 59, 'H.Trần Đề', 10, 1),
(652, NULL, 60, 'H.Bến Cầu', 2, 1),
(653, NULL, 60, 'H.Châu Thành', 3, 1),
(654, NULL, 60, 'H.Dương Minh Châu', 4, 1),
(655, NULL, 60, 'H.Gò Dầu', 5, 1),
(656, NULL, 60, 'H.Hoà Thành', 6, 1),
(657, NULL, 60, 'H.Tân Biên', 7, 1),
(658, NULL, 60, 'H.Tân Châu', 8, 1),
(659, NULL, 60, 'H.Trảng Bàng', 9, 1),
(660, NULL, 60, 'TX.Tây Ninh', 1, 1),
(661, NULL, 61, 'H.Chợ Gạo', 6, 1),
(662, NULL, 61, 'H.Gò Công Đông', 8, 1),
(663, NULL, 61, 'H.Gò Công Tây', 7, 1),
(664, NULL, 61, 'H.Tân Phước', 10, 1),
(665, NULL, 61, 'TP.Mỹ Tho', 1, 1),
(666, NULL, 61, 'TX.Gò Công', 2, 1),
(667, NULL, 61, ' H.Cái Bè', 3, 1),
(668, NULL, 61, 'H.Cai Lậy', 5, 1),
(669, NULL, 61, ' H.Châu Thành', 4, 1),
(670, NULL, 61, 'H.Tân Phú Đông', 9, 1),
(671, NULL, 62, 'TP.Trà Vinh', 1, 1),
(672, NULL, 62, 'H.Càng Long', 2, 1),
(673, NULL, 62, 'H.Châu Thành', 5, 1),
(674, NULL, 62, 'H.Cầu Kè', 3, 1),
(675, NULL, 62, 'H.Tiểu Cần', 7, 1),
(676, NULL, 62, 'H.Cầu Ngang', 4, 1),
(677, NULL, 62, 'H.Trà Cú', 8, 1),
(678, NULL, 62, 'H.Duyên Hải', 6, 1),
(679, NULL, 63, 'H.Bình Minh', 2, 1),
(680, NULL, 63, 'H.Long Hồ', 4, 1),
(681, NULL, 63, 'H.Mang Thít', 5, 1),
(682, NULL, 63, 'H.Tam Bình', 6, 1),
(683, NULL, 63, 'H.Trà Ôn', 7, 1),
(684, NULL, 63, 'TX.Vĩnh Long', 1, 1),
(685, NULL, 63, 'H.Bình Tân', 3, 1),
(686, NULL, 63, 'H.Vũng Liêm', 8, 1),
(687, NULL, 63, 'Quận 5', 30, 1),
(688, NULL, 63, 'Quận 4', 31, 1),
(689, NULL, 63, 'Quận 3', 32, 1),
(690, NULL, 1, 'Quận Ba Đình', 33, 1),
(691, NULL, 1, 'Quận Hoàn Kiếm', 34, 1),
(692, NULL, 1, 'Quận Đống Đa', 35, 1),
(693, NULL, 1, 'Quận Cầu Giấy', 36, 1),
(694, NULL, 63, 'Quận 1', 37, 1),
(695, NULL, 63, 'Quận 2', 38, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fs_local_streets`
--

CREATE TABLE `fs_local_streets` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `published` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_local_streets`
--

INSERT INTO `fs_local_streets` (`id`, `code`, `city_id`, `district_id`, `name`, `ordering`, `published`, `created_time`, `updated_time`) VALUES
(1, NULL, 1, 2, 'Giảng Võ', 1, 1, '2015-12-16 09:25:17', '2015-12-16 10:31:04'),
(2, NULL, 1, 2, 'Liễu Giai', 2, 1, '2015-12-16 10:31:22', '2015-12-16 10:31:22'),
(3, NULL, 1, 2, 'La Thành', 3, 1, '2015-12-16 10:31:49', '2015-12-16 10:31:49'),
(4, NULL, 1, 1, 'Bà Triệu', 4, 1, '2015-12-16 10:32:37', '2015-12-16 10:32:37'),
(5, NULL, 1, 1, 'Bát Đàn', 5, 1, '2015-12-16 10:32:57', '2015-12-16 10:32:57'),
(6, NULL, 1, 1, 'Đồng Xuân', 6, 1, '2015-12-16 10:33:13', '2015-12-16 10:33:13'),
(7, NULL, 1, 7, 'Bưởi', 7, 1, '2015-12-16 10:33:44', '2015-12-16 10:33:44'),
(8, NULL, 1, 7, 'Mai Dịch', 8, 1, '2015-12-16 10:33:57', '2015-12-16 10:33:57'),
(9, NULL, 1, 7, 'Doãn Kế Thiện', 9, 1, '2015-12-16 10:34:15', '2015-12-16 10:34:15'),
(10, NULL, 1, 7, 'Hoàng Quốc Việt', 10, 1, '2015-12-16 10:34:36', '2015-12-16 10:34:36'),
(11, NULL, 1, 3, 'Thái Thịnh', 11, 1, '2015-12-16 10:35:16', '2015-12-16 10:37:06'),
(12, NULL, 1, 3, 'Cát Linh', 12, 1, '2015-12-16 10:35:58', '2015-12-16 10:36:25'),
(13, NULL, 1, 3, 'Thái Hà', 13, 1, '2015-12-16 10:37:31', '2015-12-16 10:37:31'),
(14, NULL, 2, 34, 'An Bình', 14, 1, '2015-12-16 10:42:45', '2015-12-16 10:42:45'),
(15, NULL, 2, 34, 'An Biên', 15, 1, '2015-12-16 10:43:04', '2015-12-16 10:43:04'),
(16, NULL, 2, 34, 'An Dương Vương', 16, 1, '2015-12-16 10:43:18', '2015-12-16 10:43:19'),
(17, NULL, 2, 33, 'Bến Vân Đồn', 17, 1, '2015-12-16 10:43:45', '2015-12-16 10:43:45'),
(18, NULL, 2, 33, 'Đinh Lễ', 18, 1, '2015-12-16 10:44:53', '2015-12-16 10:44:53'),
(19, NULL, 2, 33, 'Đoàn Văn Bơ', 19, 1, '2015-12-16 10:45:05', '2015-12-16 10:45:05'),
(20, NULL, 2, 32, 'Bàn Cờ', 20, 1, '2015-12-16 10:45:47', '2015-12-16 10:45:47'),
(21, NULL, 2, 32, 'Cách Mạng Tháng Tám', 21, 1, '2015-12-16 10:46:00', '2015-12-16 10:46:00'),
(22, NULL, 2, 32, 'Cao Thắng', 22, 1, '2015-12-16 10:46:11', '2015-12-16 10:46:11'),
(23, NULL, 2, 32, 'Điện Biên Phủ', 23, 1, '2015-12-16 10:46:23', '2015-12-16 10:46:23');

-- --------------------------------------------------------

--
-- Table structure for table `fs_local_ward`
--

CREATE TABLE `fs_local_ward` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `published` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_local_ward`
--

INSERT INTO `fs_local_ward` (`id`, `code`, `district_id`, `name`, `ordering`, `published`, `created_time`, `updated_time`) VALUES
(1, NULL, 30, 'Phường Tân Định', 1, 1, '2015-12-16 09:53:42', '2015-12-16 09:53:42'),
(2, NULL, 30, 'Phường Đa Kao', 2, 1, '2015-12-16 09:54:03', '2015-12-16 09:54:03'),
(3, NULL, 30, 'Phường Bến Nghé', 3, 1, '2015-12-16 09:54:29', '2015-12-16 09:54:29'),
(4, NULL, 30, 'Phường Bến Thành', 4, 1, '2015-12-16 09:54:45', '2015-12-16 09:54:45'),
(5, NULL, 30, 'Phường Nguyễn Thái Bình', 5, 1, '2015-12-16 09:55:00', '2015-12-16 09:55:01'),
(6, NULL, 31, 'Phường Thảo Điền', 6, 1, '2015-12-16 09:59:55', '2015-12-16 09:59:55'),
(7, NULL, 31, 'Phường An Phú', 7, 1, '2015-12-16 10:00:11', '2015-12-16 10:00:11'),
(8, NULL, 34, 'Phường 3', 8, 1, '2015-12-16 10:00:27', '2015-12-16 10:53:01'),
(9, NULL, 34, 'Phường 2', 9, 1, '2015-12-16 10:00:44', '2015-12-16 10:52:50'),
(10, NULL, 34, 'Phường 1', 10, 1, '2015-12-16 10:01:00', '2015-12-16 10:52:34'),
(11, NULL, 32, 'Phường 07', 11, 1, '2015-12-16 10:01:31', '2015-12-16 10:01:31'),
(12, NULL, 32, 'Phường 14', 12, 1, '2015-12-16 10:02:27', '2015-12-16 10:02:39'),
(13, NULL, 32, 'Phường 08', 13, 1, '2015-12-16 10:02:56', '2015-12-16 10:02:59'),
(14, NULL, 32, 'Phường 10', 14, 1, '2015-12-16 10:03:16', '2015-12-16 10:03:26'),
(15, NULL, 33, 'Phường 12', 15, 1, '2015-12-16 10:03:53', '2015-12-16 10:03:53'),
(16, NULL, 33, 'Phường 13', 16, 1, '2015-12-16 10:04:09', '2015-12-16 10:04:09'),
(17, NULL, 32, 'Phường 09', 17, 1, '2015-12-16 10:04:22', '2015-12-16 10:04:22'),
(18, NULL, 33, 'Phường 06', 18, 1, '2015-12-16 10:04:40', '2015-12-16 10:04:40'),
(19, NULL, 3, 'Cát Linh', 19, 1, '2015-12-16 10:38:29', '2015-12-16 10:38:29'),
(20, NULL, 3, 'Khâm Thiên', 20, 1, '2015-12-16 10:38:53', '2015-12-16 10:38:53'),
(21, NULL, 3, 'Trung Liệt', 21, 1, '2015-12-16 10:39:17', '2015-12-16 10:39:17'),
(22, NULL, 7, 'Dịch vọng', 22, 1, '2015-12-16 10:39:50', '2015-12-16 10:39:50'),
(23, NULL, 7, 'Nghĩa Đô', 23, 1, '2015-12-16 10:40:09', '2015-12-16 10:40:09'),
(24, NULL, 7, 'Trung Hòa', 24, 1, '2015-12-16 10:40:30', '2015-12-16 10:40:30'),
(25, NULL, 2, 'Điện Biên', 25, 1, '2015-12-16 10:41:07', '2015-12-16 10:41:07'),
(26, NULL, 2, 'Đội Cấn', 26, 1, '2015-12-16 10:41:22', '2015-12-16 10:41:22'),
(27, NULL, 2, 'Trúc Bạch', 27, 1, '2015-12-16 10:41:40', '2015-12-16 10:41:40');

-- --------------------------------------------------------

--
-- Table structure for table `fs_members`
--

CREATE TABLE `fs_members` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(200) NOT NULL,
  `birthday` datetime DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `city_name` varchar(255) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `district_name` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL,
  `point` int(11) NOT NULL DEFAULT 0,
  `poster_avatar` varchar(255) DEFAULT NULL,
  `poster_name` varchar(50) DEFAULT NULL,
  `poster_mobile` varchar(30) DEFAULT NULL,
  `poster_phone` varchar(255) DEFAULT NULL,
  `poster_address` varchar(4000) DEFAULT NULL,
  `poster_facebook` varchar(255) DEFAULT NULL,
  `company_logo` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_mobile` varchar(255) DEFAULT NULL,
  `company_phone` varchar(255) DEFAULT NULL,
  `company_fax` varchar(255) DEFAULT NULL,
  `company_website` varchar(255) DEFAULT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `company_longitude` double DEFAULT 106,
  `company_latitude` double DEFAULT 21.032711,
  `company_zoom` tinyint(4) DEFAULT 10,
  `background_color` varchar(255) DEFAULT '#FFFFFF',
  `text_color` varchar(255) DEFAULT '#000000',
  `money` double(255,0) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `published` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_members`
--

INSERT INTO `fs_members` (`id`, `code`, `username`, `password`, `birthday`, `gender`, `city_id`, `city_name`, `district_id`, `district_name`, `level`, `email`, `point`, `poster_avatar`, `poster_name`, `poster_mobile`, `poster_phone`, `poster_address`, `poster_facebook`, `company_logo`, `company_name`, `company_mobile`, `company_phone`, `company_fax`, `company_website`, `company_address`, `company_longitude`, `company_latitude`, `company_zoom`, `background_color`, `text_color`, `money`, `created_time`, `ordering`, `published`) VALUES
(1, 'M000001', 'vangiangfly', '2ea2956acd1e3db98136dec9851ce42db883b0e0', '1930-01-01 09:00:00', 'male', 1, NULL, 1, NULL, 0, 'vangiangfly@gmail.com', 0, 'images/members/2015/12/original/vangiangfly_avatar.jpg', 'Trần Văn Giang', '0979588790', NULL, 'Phòng 103, Tầng 1, Lô 2bx3, khu đô thị Mỹ Đình I, Hà Nội', 'https://www.facebook.com/', 'images/members/2015/12/original/vangiangfly_logo.jpg', 'TNHH Phong Cách Số', '0979588790', '0462872977', '0462872932', 'http://finalstyle.com/', 'Phòng 103, Tầng 1, Lô 2bx3, khu đô thị Mỹ Đình I, Hà Nội', 105.72445031, 21.00345824, 16, '#000000', '#ffffff', NULL, '2015-12-16 05:47:18', 0, 1),
(2, 'M000002', 'mailinh2115', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '1930-01-01 09:00:00', 'female', 1, NULL, 1, NULL, 0, 'mailinh2115@gmail.com', 0, 'images/members/2015/12/original/mailinh2115_avatar.jpg', 'Bùi Thị Mai Linh', '01689537993', NULL, 'Ngõ 35, Đường Lê Đức Thọ, Từ Liêm, Hà Nội', 'https://www.facebook.com/', 'images/members/2015/12/original/mailinh2115_logo.png', 'Century 21 On Main Pakenham -Pakenham', '01356895426', '0436584814', '0436584814', 'www.century21.com', 'Ngõ 167 Thanh Nhàn, Hai Bà Trưng, Hà Nội', 105.850525, 21.032711, 10, '#000000', '#ffffff', NULL, '2015-12-18 04:01:15', 0, 1),
(3, 'M000003', 'Dương Quang Dũng', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '1930-01-01 09:00:00', 'male', 1, NULL, 1, NULL, 0, 'dungpt@gmail.com', 0, 'images/members/2015/12/original/Dương Quang Dũng_avatar.jpg', 'Dương Quang Dũng', '01689574236', NULL, 'Chung cư Kim Lũ, Thanh Xuân, Hà Nội', 'https://www.facebook.com/', 'images/members/2015/12/original/Dương Quang Dũng_logo.jpg', 'Công Ty Bất động sản An Viên', '0989657894', '043658975', '043658975', 'www.century20.com', 'Ngõ 167 Thanh Nhàn, Hai Bà Trưng, Hà Nội', 105.850525, 21.032711, 10, '#000000', '#ffffff', NULL, '2015-12-18 04:45:06', 0, 1),
(4, 'M000004', 'Phạm Thị Thương', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'thuong@gmail.com', 0, 'images/members/2015/12/original/Phạm Thị Thương_avatar.jpg', NULL, '01689542369', NULL, NULL, NULL, 'images/members/2015/12/original/Phạm Thị Thương_logo.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 105.850525, 21.032711, 10, '#FFFFFF', '#000000', NULL, '2015-12-18 05:11:10', 0, 1),
(5, 'M000005', 'mailinh', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '1930-01-01 09:00:00', 'male', 1, NULL, 1, NULL, 0, 'mailinh@finalstyle.com', 0, 'images/members/2015/12/original/mailinh_avatar.jpg', 'Bùi Thị Linh', '0123654789', NULL, 'Cầu Giấy, Hà Nội', 'www.facebook.com', 'images/members/2016/01/original/mailinh_logo.jpg', 'Công Ty Bất động sản An Khánh', '0985642358', '043659875', '043659875', 'http://www.cru.org/', 'Cầu Giấy, Hà Nội', 105.850525, 21.032711, 10, '#000000', '#ffffff', NULL, '2015-12-18 05:54:14', 0, 1),
(6, 'M000006', 'Đào Văn Tuấn', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '1988-06-17 09:00:00', 'male', 1, NULL, NULL, NULL, 0, 'tuan@gmail.com', 0, 'images/members/2015/12/original/Đào Văn Tuấn_avatar.jpg', 'Đào Văn Tuấn', '01658935769', NULL, 'Mai Dịch, Cầu Giấy, Hà Nội', 'www.facebook.com', 'images/members/2015/12/original/Đào Văn Tuấn_logo.png', '', '01689534669', '043256987', '043256987', 'www.century21.com', 'Ngõ 167 Thanh Nhàn, Hai Bà Trưng, Hà Nội', 105.850525, 21.032711, 10, '#FFFFFF', '#000000', NULL, '2015-12-18 07:37:13', 0, 1),
(8, 'M000008', 'linhbui', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '1930-01-01 09:00:00', 'female', 1, NULL, 1, NULL, 0, 'linh@gmail.com', 0, 'images/members/2015/12/original/linhbui_avatar.jpg', 'Bùi Mai Linh', '01689578425', NULL, 'Ngõ 156, Lê Trọng Tấn, Thanh Xuân, Hà Nội', 'www.facebook.com', 'images/members/2015/12/original/linhbui_logo.jpg', 'Công ty TNHH hodges', '0987568924', '043568975', '043568975', 'www.hodges.com', 'Ngõ 156, Lê Trọng Tấn, Thanh Xuân, Hà Nội', 105.850525, 21.032711, 10, '#000000', '#ffffff', NULL, '2015-12-23 10:12:00', 0, 1),
(12, 'M000012', 'ttle2509', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '1930-01-01 09:00:00', 'male', 2, NULL, NULL, NULL, 0, 'ttle2509@gmail.com', 0, 'images/members/2016/01/original/ttle2509_avatar.jpg', 'Mr. ABC', '0923192807', NULL, 'Quận 10', 'https://www.facebook.com/', 'images/members/2016/01/original/ttle2509_logo.jpg', 'Biggin Scott Company', '', '', '', 'http://bigginscott.com.au/', '126 Đường 3/2, P.6, Quận 10', 105.850525, 21.032711, 10, '#FFFFFF', '#000000', NULL, '2016-01-06 10:56:48', 0, 1),
(10, 'M000010', 'phuc', '38af9d29ed387895e9955bc65184fd25146821fa', '1930-01-01 09:00:00', 'female', 1, NULL, NULL, NULL, 0, 'phuc@gmail.com', 0, NULL, 'Bùi Văn Phúc', '0189562457', NULL, 'Nguyễn Cơ Thạch, Hà Nội', 'www.facebook.com', NULL, 'Công ty TNHH Việt Phát', '08954523541', '043245789', '043245789', 'www.vietphat.com', 'Nguyễn Cơ Thạch, Hà Nội', 105.850525, 21.032711, 10, '#FFFFFF', '#000000', NULL, '2015-12-31 09:50:52', 0, 1),
(13, 'M000013', 'Bùi Đại Cát', '38af9d29ed387895e9955bc65184fd25146821fa', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'buidaicat@gmail.com', 0, NULL, NULL, '0989654978', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 106, 21.032711, 10, '#FFFFFF', '#000000', NULL, '2016-01-28 11:27:12', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fs_members_level`
--

CREATE TABLE `fs_members_level` (
  `id` int(11) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `point` int(200) NOT NULL,
  `money` double(200,0) NOT NULL,
  `discount` double(50,0) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `published` tinyint(1) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_members_level`
--

INSERT INTO `fs_members_level` (`id`, `level`, `name`, `point`, `money`, `discount`, `description`, `published`, `ordering`) VALUES
(1, 0, 'Thành viên thường', 0, 0, 0, NULL, 1, 0),
(2, 1, 'Thành viên VIP', 1000, 1000000, 1, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fs_menus_admin`
--

CREATE TABLE `fs_menus_admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL,
  `link` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 1,
  `featured` tinyint(1) DEFAULT 0,
  `admin_type` tinyint(4) NOT NULL COMMENT 'to used for Admin or User in back-end',
  `created_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_menus_admin`
--

INSERT INTO `fs_menus_admin` (`id`, `name`, `parent_id`, `ordering`, `image`, `link`, `published`, `featured`, `admin_type`, `created_time`) VALUES
(1, 'Thành viên quản trị', 0, 1, 'backend.png', NULL, 1, 1, 1, '0000-00-00 00:00:00'),
(2, 'User group', 1, 2, NULL, 'index.php?module=users&view=groups', 1, 0, 1, '0000-00-00 00:00:00'),
(3, 'User', 1, 3, NULL, 'index.php?module=users&view=users', 1, 0, 0, '0000-00-00 00:00:00'),
(6, 'Menu', 0, 2, 'no-image.png', '', 1, 1, 0, '0000-00-00 00:00:00'),
(7, 'Menu groups', 6, 6, NULL, 'index.php?module=menus&view=groups', 0, 0, 1, '0000-00-00 00:00:00'),
(8, 'Menus Items', 6, 8, NULL, 'index.php?module=menus&view=items', 1, 0, 1, '0000-00-00 00:00:00'),
(13, 'Tin tức', 0, 9, 'news.png', '', 1, 1, 0, '0000-00-00 00:00:00'),
(14, 'Danh mục tin tức', 13, 1, NULL, 'index.php?module=news&view=categories', 1, 0, 0, '0000-00-00 00:00:00'),
(15, 'Danh sách tin', 13, 2, NULL, 'index.php?module=news&view=news', 1, 0, 0, '0000-00-00 00:00:00'),
(43, 'Configuration', 0, 5, 'config.png', '', 1, 0, 0, '0000-00-00 00:00:00'),
(59, 'Contact', 0, 100, 'no-image.png', 'index.php?module=contact&view=contact', 1, 0, 0, '0000-00-00 00:00:00'),
(63, 'Thành viên', 0, 11, 'user.png', 'index.php?module=members&view=members', 0, 0, 0, '0000-00-00 00:00:00'),
(74, 'Địa điểm', 0, 12, 'no-image.png', NULL, 0, 0, 0, '0000-00-00 00:00:00'),
(75, 'Tỉnh/Thành phố', 74, 2, NULL, 'index.php?module=location&view=cities', 1, 0, 0, '0000-00-00 00:00:00'),
(76, 'Quận/Huyện', 74, 3, NULL, 'index.php?module=location&view=districts', 1, 0, 0, '0000-00-00 00:00:00'),
(77, 'Sản phẩm', 0, 7, 'no-image.png', NULL, 0, 1, 0, '0000-00-00 00:00:00'),
(78, 'Danh mục sản phẩm', 77, 1, NULL, 'index.php?module=products&view=categories', 1, 0, 0, '0000-00-00 00:00:00'),
(79, 'Danh sách  sản phẩm', 77, 2, NULL, 'index.php?module=products&view=products', 1, 0, 0, '0000-00-00 00:00:00'),
(80, 'Màu sắc', 77, 3, NULL, 'index.php?module=products&view=colors', 0, 0, 0, '0000-00-00 00:00:00'),
(82, 'Câu hỏi', 81, 1, NULL, 'index.php?module=poll&view=questions', 1, 0, 0, '0000-00-00 00:00:00'),
(83, 'Câu trả lời', 81, 1, NULL, 'index.php?module=poll&view=answers', 1, 0, 0, '0000-00-00 00:00:00'),
(130, 'Banner', 0, 4, NULL, NULL, 1, 0, 0, '0000-00-00 00:00:00'),
(131, 'Danh mục banner', 130, 1, NULL, 'index.php?module=banners&view=categories', 1, 0, 0, '0000-00-00 00:00:00'),
(132, 'Danh sách banner', 130, 2, NULL, 'index.php?module=banners&view=banners', 1, 0, 0, '0000-00-00 00:00:00'),
(133, 'Block', 0, 3, NULL, 'index.php?module=module&view=module', 1, 0, 0, '0000-00-00 00:00:00'),
(178, 'Danh sách dữ liệu mở rộng', 176, 2, NULL, 'index.php?module=extends&view=extends', 1, 0, 0, '0000-00-00 00:00:00'),
(177, 'Bảng dữ liệu mở rộng', 176, 1, NULL, 'index.php?module=extends&view=tables', 1, 0, 0, '0000-00-00 00:00:00'),
(163, 'Hạng thành viên', 62, 2, NULL, 'index.php?module=members&view=level', 1, 0, 0, '0000-00-00 00:00:00'),
(164, 'Đơn hàng', 0, 8, 'no-image.png', NULL, 0, 0, 0, '0000-00-00 00:00:00'),
(165, 'Danh sách đơn hàng', 77, 5, NULL, 'index.php?module=order&view=order', 0, 0, 0, '0000-00-00 00:00:00'),
(173, 'Cấu hình chung', 43, 1, NULL, 'index.php?module=config&view=config', 1, 0, 0, '0000-00-00 00:00:00'),
(198, 'Translate phrases (font-end)', 195, 2, NULL, 'index.php?module=languages&view=text&type=fontend', 1, 0, 0, '0000-00-00 00:00:00'),
(185, 'Trang tĩnh', 0, 10, 'static.png', NULL, 0, 0, 0, '0000-00-00 00:00:00'),
(186, 'Danh mục ', 185, 1, NULL, 'index.php?module=statics&view=categories', 1, 0, 0, '0000-00-00 00:00:00'),
(187, 'Danh sách tin', 185, 1, NULL, 'index.php?module=statics&view=statics', 1, 0, 0, '0000-00-00 00:00:00'),
(197, 'Translate phrases (backend)', 195, 1, NULL, 'index.php?module=languages&view=text_admin&type=backend', 1, 0, 0, '0000-00-00 00:00:00'),
(195, 'Languages', 0, 6, NULL, NULL, 1, 0, 0, '0000-00-00 00:00:00'),
(196, 'Translate content', 195, 3, NULL, 'index.php?module=languages&view=tables', 0, 0, 0, '0000-00-00 00:00:00'),
(199, 'Xuất xứ', 77, 4, NULL, 'index.php?module=products&view=origins', 0, 0, 0, '0000-00-00 00:00:00'),
(200, 'Mã giảm giá', 77, 6, NULL, 'index.php?module=products&view=discount', 0, 0, 0, '0000-00-00 00:00:00'),
(201, 'Lọc giá sản phẩm', 77, 5, NULL, 'index.php?module=products&view=fprice', 0, 0, 0, '0000-00-00 00:00:00'),
(202, 'Quản lý comments', 77, 3, NULL, 'index.php?module=products&view=comments', 0, 0, 0, '0000-00-00 00:00:00'),
(203, 'Xóa cache', 43, 2, NULL, 'index.php?module=config&view=config&task=delete_cache', 0, 0, 0, '0000-00-00 00:00:00'),
(204, 'Thực đơn giảm cân', 0, 8, NULL, NULL, 0, 0, 0, '0000-00-00 00:00:00'),
(205, 'Loại thực phẩm', 204, 1, NULL, 'index.php?module=foods&view=categories', 1, 0, 0, '0000-00-00 00:00:00'),
(206, 'Món ăn', 204, 1, NULL, 'index.php?module=foods&view=foods', 1, 0, 0, '0000-00-00 00:00:00'),
(207, 'Giới thiệu', 0, 9, NULL, '', 0, 0, 0, '0000-00-00 00:00:00'),
(208, 'Danh mục', 207, 1, NULL, 'index.php?module=about&view=categories', 1, 0, 0, '0000-00-00 00:00:00'),
(209, 'Danh sách', 207, 2, NULL, 'index.php?module=about&view=about', 1, 0, 0, '0000-00-00 00:00:00'),
(210, 'Videos', 0, 10, NULL, 'index.php?module=videos&view=videos', 0, 0, 0, '0000-00-00 00:00:00'),
(211, 'Dữ liệu mở rộng', 77, 9, NULL, NULL, 0, 0, 0, '0000-00-00 00:00:00'),
(212, 'Bảng mở rộng', 211, 1, NULL, 'index.php?module=extends&view=tables', 1, 0, 0, '0000-00-00 00:00:00'),
(213, 'Dữ liệu mở rộng', 211, 2, NULL, 'index.php?module=extends&view=extends', 1, 0, 0, '0000-00-00 00:00:00'),
(214, 'Định nghĩa thuộc tính, bộ lọc', 77, 10, NULL, 'index.php?module=products&view=tables', 0, 0, 0, '0000-00-00 00:00:00'),
(215, 'Hệ sinh thái', 216, 3, NULL, 'index.php?module=projects&view=categories', 1, 0, 0, '0000-00-00 00:00:00'),
(216, 'Dự án', 0, 15, NULL, '', 1, 0, 0, '0000-00-00 00:00:00'),
(217, 'Dự án', 216, 9, NULL, 'index.php?module=projects&view=projects', 1, 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `fs_menus_createlink`
--

CREATE TABLE `fs_menus_createlink` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `published` tinyint(4) UNSIGNED NOT NULL DEFAULT 1,
  `parent_id` varchar(255) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `link_menu` varchar(255) DEFAULT NULL,
  `add_parameter` varchar(255) DEFAULT NULL,
  `add_table` varchar(255) DEFAULT NULL,
  `add_field_display` varchar(255) DEFAULT NULL COMMENT 'component of module',
  `add_field_value` varchar(255) DEFAULT NULL,
  `add_field_distinct` tinyint(4) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_menus_createlink`
--

INSERT INTO `fs_menus_createlink` (`id`, `name`, `published`, `parent_id`, `ordering`, `link_menu`, `add_parameter`, `add_table`, `add_field_display`, `add_field_value`, `add_field_distinct`, `params`) VALUES
(24, 'Trang tĩnh', 1, '0', 99, 'index.php?module=statics&view=statics', 'code,ccode,id', 'fs_statics', 'title', 'alias,category_alias,id', NULL, NULL),
(23, 'Trang chủ', 1, '0', 1, 'index.php?module=home', NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'Tư vấn', 0, '19', 6, 'index.php?module=consult&view=consult', 'code,ccode', 'fs_consult', 'title', 'alias,category_alias,id', NULL, NULL),
(19, 'Tư vấn', 0, '0', 5, 'index.php?module=consult&view=home', NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'Danh mục', 0, '19', 5, 'index.php?module=consult&view=cat', 'ccode,id', 'fs_consult_categories', 'name', 'alias,id', NULL, NULL),
(17, 'Sản phẩm', 0, '15', 3, 'index.php?module=product&view=product', 'code,ccode', 'fs_products', 'name', 'alias,category_alias,id', NULL, NULL),
(16, 'Danh mục', 1, '15', 2, 'index.php?module=product&view=cat', 'ccode,id', 'fs_products_categories', 'name', 'alias,id', NULL, NULL),
(15, 'Sản phẩm', 1, '0', 2, 'index.php?module=product&view=home', NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'Liên hệ', 1, '0', 100, 'index.php?module=contact', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Danh mục', 1, '1', 1, 'index.php?module=news&view=cat', 'ccode,id', 'fs_news_categories', 'name', 'alias,id', NULL, NULL),
(2, 'Bài viết', 1, '1', 2, 'index.php?module=news&view=news', 'code,ccode,id', 'fs_news', 'title', 'alias,category_alias,id', NULL, NULL),
(1, 'Tin tức', 1, '0', 3, 'index.php?module=news&view=home', NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'Album ảnh', 0, '0', 7, 'index.php?module=album&view=home', NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'Giới thiệu', 0, '0', 8, 'index.php?module=about&view=cat', 'ccode,id', 'fs_about_categories', 'name', 'alias,id', NULL, NULL),
(27, 'Bài viết', 1, '26', 16, 'index.php?module=about&view=about', 'code,ccode,id', 'fs_about', 'title', 'alias,category_alias,id', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fs_menus_groups`
--

CREATE TABLE `fs_menus_groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `published` tinyint(4) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `lang` varchar(255) DEFAULT 'vi'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_menus_groups`
--

INSERT INTO `fs_menus_groups` (`id`, `group_name`, `published`, `ordering`, `lang`) VALUES
(1, 'Menu top', 1, 1, 'vi'),
(2, 'Menu footer', 1, 2, 'vi'),
(5, 'Menu cats', 1, 3, 'vi');

-- --------------------------------------------------------

--
-- Table structure for table `fs_menus_items`
--

CREATE TABLE `fs_menus_items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `link` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `parent_id_a` int(11) NOT NULL DEFAULT 0,
  `show_admin` tinyint(4) NOT NULL DEFAULT 1,
  `target` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 1,
  `default` tinyint(4) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 1,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `template` varchar(50) DEFAULT NULL,
  `condition` int(11) DEFAULT NULL,
  `list_parent` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `is_rewrite` tinyint(1) NOT NULL DEFAULT 0,
  `lang` varchar(255) DEFAULT 'vi',
  `category_banner` tinyint(4) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_menus_items`
--

INSERT INTO `fs_menus_items` (`id`, `name`, `alias`, `image`, `link`, `parent_id`, `parent_id_a`, `show_admin`, `target`, `group_id`, `ordering`, `default`, `published`, `created_time`, `updated_time`, `template`, `condition`, `list_parent`, `level`, `is_rewrite`, `lang`, `category_banner`) VALUES
(1, 'Trang chủ', 'trang-chu', NULL, '', 0, 0, 0, '_self', 0, 1, 0, 1, '2013-02-21 08:45:29', '2013-02-21 08:45:29', NULL, NULL, '1', 0, 0, 'vi', 0),
(2, 'Sản phẩm', 'san-pham', NULL, '', 0, 0, 0, '_self', 0, 2, 0, 0, '2013-02-21 08:45:29', '2013-02-21 08:45:29', NULL, NULL, '1', 0, 0, 'vi', 0),
(3, 'Danh mục sản phẩm', 'danh-muc-san-pham', NULL, '', 0, 0, 0, '_self', 0, 3, 0, 0, '2013-02-21 08:45:29', '2013-02-21 08:45:29', '', NULL, '1', 0, 0, 'vi', 0),
(4, 'Chi tiết sản phẩm', 'chi-tiet-san-pham', NULL, '', 0, 0, 0, '_self', 0, 4, 0, 0, '2013-02-21 08:45:29', '2013-02-21 08:45:29', NULL, NULL, '1', 0, 0, 'vi', 0),
(5, 'Tin tức', 'tin-tuc', NULL, '', 0, 0, 0, '_self', 0, 5, 0, 1, '2013-02-21 08:45:29', '2013-02-21 08:45:29', NULL, NULL, '1', 0, 0, 'vi', 0),
(6, 'Danh mục tin tức', 'danh-muc-tin-tuc', NULL, '', 0, 0, 0, '_self', 0, 6, 0, 1, '2013-02-21 08:45:29', '2013-02-21 08:45:29', NULL, NULL, '1', 0, 0, 'vi', 0),
(7, 'Chi tiết tin tức', 'chi-tiet-tin-tuc', NULL, '', 0, 0, 0, '_self', 0, 7, 0, 1, '2013-02-21 08:45:29', '2013-02-21 08:45:29', NULL, NULL, '1', 0, 0, 'vi', 0),
(104, 'Contact Us', 'contact-us', NULL, 'contact', 0, 0, 1, '_self', 1, 7, 0, 1, '2022-05-06 10:09:12', '2022-05-06 10:09:55', NULL, NULL, '104', 0, 0, 'vi', 0),
(97, 'Spotlight News', 'spotlight-news', 'images/menus/tin-noi-bat-1650905367.png', '', 0, 0, 1, '_self', 5, 2, 0, 1, '2022-04-25 23:49:27', '2022-05-07 11:34:57', NULL, NULL, '97', 0, 0, 'vi', 0),
(74, 'Ecosystem', 'ecosystem', NULL, '', 79, 0, 1, '_self', 1, 2, 0, 1, '2020-02-12 15:08:35', '2022-05-06 10:10:17', NULL, NULL, '79,74', 1, 0, 'vi', 0),
(76, 'Make money', 'make-money', NULL, 'index.php?module=news&view=cat&ccode=make-money&id=1', 0, 0, 1, '_self', 1, 5, 0, 1, '2020-02-12 15:10:05', '2022-04-24 02:33:28', NULL, NULL, '76', 0, 0, 'vi', 0),
(77, 'Investment', 'investment', NULL, 'index.php?module=news&view=cat&ccode=investment&id=2', 79, 0, 1, '_self', 1, 1, 0, 1, '2020-02-12 15:13:28', '2022-05-06 10:07:13', NULL, NULL, '79,77', 1, 0, 'vi', 0),
(78, 'Learn', 'learn', NULL, 'index.php?module=news&view=home', 0, 0, 1, '_self', 1, 3, 0, 1, '2020-02-12 15:15:21', '2022-05-06 10:06:23', NULL, NULL, '78', 0, 0, 'vi', 0),
(79, 'News', 'news', NULL, '', 0, 0, 1, '_self', 1, 2, 0, 1, '2020-02-12 15:15:50', '2022-05-06 10:06:04', NULL, NULL, '79', 0, 0, 'vi', 0),
(80, 'Projects', 'projects', NULL, 'projects', 0, 0, 1, '_self', 1, 1, 0, 1, '2020-02-12 21:04:38', '2022-05-06 09:45:09', NULL, NULL, '80', 0, 0, 'vi', 0),
(96, 'Trending', 'trending', 'images/menus/trending-1650905337.png', '', 0, 0, 1, '_self', 5, 1, 0, 1, '2022-04-25 23:48:57', '2022-04-25 23:48:57', NULL, NULL, '96', 0, 0, 'vi', 0),
(82, 'About', 'about', NULL, '', 0, 0, 1, '_self', 2, 1, 0, 1, '2022-04-22 21:29:54', '2022-04-22 21:29:54', NULL, NULL, '82', 0, 0, 'vi', 0),
(83, 'Projects', 'projects', NULL, 'projects', 0, 0, 1, '_self', 2, 2, 0, 1, '2022-04-22 21:30:07', '2022-05-06 10:14:56', NULL, NULL, '83', 0, 0, 'vi', 0),
(84, 'News', 'news', NULL, 'news', 0, 0, 1, '_self', 2, 3, 0, 1, '2022-04-22 21:30:18', '2022-05-06 10:15:30', NULL, NULL, '84', 0, 0, 'vi', 0),
(85, 'Community', 'community', NULL, '', 0, 0, 1, '_self', 2, 4, 0, 1, '2022-04-22 21:30:28', '2022-04-22 21:30:28', NULL, NULL, '85', 0, 0, 'vi', 0),
(86, 'About us', 'about-us', NULL, '', 82, 0, 1, '_self', 2, 1, 0, 1, '2022-04-22 21:38:04', '2022-04-22 21:38:04', NULL, NULL, '82,86', 1, 0, 'vi', 0),
(87, 'Contact us', 'contact-us', NULL, '', 82, 0, 1, '_self', 2, 2, 0, 1, '2022-04-22 21:38:19', '2022-05-06 10:14:13', NULL, NULL, '82,87', 1, 0, 'vi', 0),
(88, 'Wallet', 'wallet', NULL, '', 83, 0, 1, '_self', 2, 1, 0, 1, '2022-04-22 21:38:37', '2022-04-22 21:38:37', NULL, NULL, '83,88', 1, 0, 'vi', 0),
(89, 'Exchange', 'exchange', NULL, '', 83, 0, 1, '_self', 2, 2, 0, 1, '2022-04-22 21:40:25', '2022-04-22 21:40:25', NULL, NULL, '83,89', 1, 0, 'vi', 0),
(90, 'Market', 'market', NULL, '', 83, 0, 1, '_self', 2, 3, 0, 1, '2022-04-22 21:40:39', '2022-04-22 21:40:39', NULL, NULL, '83,90', 1, 0, 'vi', 0),
(91, 'Portfolio', 'portfolio', NULL, '', 83, 0, 1, '_self', 2, 4, 0, 1, '2022-04-22 21:40:53', '2022-04-22 21:40:53', NULL, NULL, '83,91', 1, 0, 'vi', 0),
(92, 'Email', 'email', NULL, '', 84, 0, 1, '_self', 2, 1, 0, 1, '2022-04-22 21:41:06', '2022-04-22 21:41:06', NULL, NULL, '84,92', 1, 0, 'vi', 0),
(93, 'Live Chat', 'live-chat', NULL, '', 84, 0, 1, '_self', 2, 2, 0, 1, '2022-04-22 21:41:19', '2022-04-22 21:41:19', NULL, NULL, '84,93', 1, 0, 'vi', 0),
(94, 'Telegram Chat', 'telegram-chat', NULL, 'https://t.me/newmoon_tv', 85, 0, 1, '_blank', 2, 2, 0, 1, '2022-04-22 21:42:28', '2022-05-06 10:17:12', NULL, NULL, '85,94', 1, 0, 'vi', 0),
(95, 'Telegram Channel', 'telegram-channel', NULL, 'https://t.me/newmoon_news', 85, 0, 1, '_blank', 2, 1, 0, 1, '2022-04-22 21:42:39', '2022-05-06 10:17:20', NULL, NULL, '85,95', 1, 0, 'vi', 0),
(98, 'News', 'news', 'images/menus/tin-tuc-1650905427.png', '', 0, 0, 1, '_self', 5, 3, 0, 1, '2022-04-25 23:50:16', '2022-05-07 11:34:46', NULL, NULL, '98', 0, 0, 'vi', 0),
(99, 'knowledge', 'knowledge', 'images/menus/kien-thuc-dau-tu-1650905452.png', '', 0, 0, 1, '_self', 5, 4, 0, 1, '2022-04-25 23:50:52', '2022-05-07 11:35:46', NULL, NULL, '99', 0, 0, 'vi', 0),
(100, 'Exchange', 'exchange', 'images/menus/san-giao-dich-1650905469.png', '', 0, 0, 1, '_self', 5, 5, 0, 1, '2022-04-25 23:51:09', '2022-05-07 11:34:11', NULL, NULL, '100', 0, 0, 'vi', 0),
(101, 'Ecosystem', 'ecosystem', 'images/menus/he-sinh-thai-1650905490.png', '', 0, 0, 1, '_self', 5, 6, 0, 1, '2022-04-25 23:51:30', '2022-05-07 11:01:55', NULL, NULL, '101', 0, 0, 'vi', 0),
(102, 'Airdrop', 'airdrop', NULL, '', 76, 0, 1, '_self', 1, 2, 0, 1, '2022-04-26 01:17:04', '2022-04-26 01:17:04', NULL, NULL, '76,102', 1, 0, 'vi', 0),
(103, 'ICO, IEO, SHO &amp; IDO', 'ico-ieo-sho-amp;-ido', NULL, '', 76, 0, 1, '_self', 1, 1, 0, 1, '2022-04-26 01:17:22', '2022-04-26 01:17:22', NULL, NULL, '76,103', 1, 0, 'vi', 0),
(105, 'Binance Smart Chain', 'binance-smart-chain', NULL, 'projects/binance-smart-chain-c2', 0, 0, 1, '_self', 0, 1, 0, 1, '2022-05-07 14:08:26', '2022-05-07 14:08:26', NULL, NULL, '105', 0, 0, 'vi', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fs_modules_admin`
--

CREATE TABLE `fs_modules_admin` (
  `id` int(11) NOT NULL,
  `module_type_name` varchar(255) DEFAULT NULL,
  `module_type` varchar(255) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_modules_admin`
--

INSERT INTO `fs_modules_admin` (`id`, `module_type_name`, `module_type`, `published`) VALUES
(1, 'User management', 'users', 1),
(9, 'Thành viên ngoài font-end', 'members', 0),
(3, 'News', 'news', 1),
(4, 'Blocks', 'module', 1),
(5, 'Contact', 'contact', 1),
(6, 'Menu', 'menus', 1),
(7, 'Dự án', 'projects', 1),
(8, 'Đơn hàng', 'order', 0),
(10, 'Languages', 'languages', 0),
(11, 'Configuration', 'config', 1),
(13, 'Slideshow', 'slideshow', 0),
(14, 'Messages', 'messages', 0),
(15, 'Thăm dò ý kiến', 'poll', 0),
(16, 'Địa điểm', 'location', 0),
(17, 'Banner', 'banners', 1),
(18, 'Training', 'training', 0),
(19, 'Đối tác', 'partners', 0),
(21, 'Hỗ trợ trực tuyến', 'onlinesupport', 0),
(22, 'Từ khóa', 'keywords', 0),
(23, 'Trang tĩnh', 'statics', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fs_news`
--

CREATE TABLE `fs_news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `category_alias` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_id_wrapper` varchar(255) DEFAULT NULL,
  `category_alias_wrapper` varchar(255) DEFAULT NULL,
  `category_icon` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creator_name` varchar(255) DEFAULT NULL,
  `creator_avatar` varchar(255) NOT NULL,
  `source_website` varchar(255) DEFAULT NULL,
  `new_date` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `editor` varchar(255) DEFAULT NULL,
  `show_in_homepage` tinyint(4) DEFAULT NULL,
  `hits` int(11) NOT NULL DEFAULT 0,
  `published` tinyint(4) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `title_display` varchar(255) DEFAULT NULL,
  `display_title` tinyint(4) NOT NULL DEFAULT 1,
  `display_column` int(11) NOT NULL,
  `tags_group` int(11) DEFAULT NULL,
  `rating_count` int(11) NOT NULL,
  `rating_sum` int(11) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `hot` tinyint(4) DEFAULT 0,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keyword` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `lang` varchar(255) DEFAULT 'vi'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_news`
--

INSERT INTO `fs_news` (`id`, `title`, `summary`, `content`, `image`, `tags`, `category_id`, `category_alias`, `category_name`, `category_id_wrapper`, `category_alias_wrapper`, `category_icon`, `alias`, `creator_id`, `creator`, `creator_name`, `creator_avatar`, `source_website`, `new_date`, `created_time`, `updated_time`, `editor`, `show_in_homepage`, `hits`, `published`, `ordering`, `title_display`, `display_title`, `display_column`, `tags_group`, `rating_count`, `rating_sum`, `keywords`, `hot`, `seo_title`, `seo_keyword`, `seo_description`, `lang`) VALUES
(1, 'How to Farm Crypto and join DeFi safely?', 'How to Farm Crypto and join DeFi safely?', '<p>Polkastarter is among the top-tier IDO platforms in the crypto world. It has enabled many projects to raise funds successfully. According to cryptorank.io, Polkastarter is the No.1 IDO platform by the number of funded projects (73) and AVG ATH ROI (41.17x).&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/ido-comparision-1633912564464.jpg\" /></p>\r\n\r\n<p>As retail investors, of course, we can not miss any chance to make profits by taking part in promising IDO events. In this article, I will guide you to participate in IDO on Polkastarter step by step.</p>\r\n\r\n<h2 id=\"section-10\">Polkastarter Overview</h2>\r\n\r\n<p>As a leading launchpad, Polkastarter has enabled many projects to raise funds in a cheaper and faster way than IEO platforms. From the user&rsquo;s perspective, Polkastarter gives them the opportunities to buy tokens at a quite early stage with potentially high ROI afterward.</p>\r\n\r\n<p>The vision of Polkastarer is to be integrated into Polkadot to take advantage of the high scalability of the ecosystem. Built on Polkadot, Polkastater can leverage its cross-chain swaps, enjoying the high throughput of the native blockchain while still staying connected with other blockchains for liquidity. In the time waiting for the Polkadot&rsquo;s mainnet, Polkastarter has already run on Ethereum, Polygon, and Binance Smart Chain.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/polkastarter-1633912588810.jpg\" /></p>\r\n\r\n<h2 id=\"section-11\">How Polkastarter selects a whitelist winner</h2>\r\n\r\n<p>Firstly, to be eligible for a whitelist, users must hold POLS tokens/ LP tokens in their wallets for at least 7 days. If you do not want to wait, you can stake POLS instead. Your token will be locked for 7 days while you will have immediate access to apply for the whitelist.&nbsp;</p>\r\n\r\n<p>Secondly, to increase your chance of being selected, you should increase your &ldquo;POLS power&rdquo; in 3 following ways:&nbsp;</p>\r\n\r\n<p>Holing POLS: For every 250 POLS you hold in your wallet, you will receive 1 &ldquo;ticket&rdquo;, which is counted as 1 entry into the whitelist process. Note that you are not exchanging POLS for tickets, the number of POLS just &ldquo;represents&rdquo; the number of tickets you receive. The more POLS you hold, the more chances you will win the whitelist.<br />\r\nStaking POLS: It counts POLS power the same way as holding POLS.<br />\r\nProviding liquidity: Each LP token of the liquidity pool ETH - POLS on Uniswap equals 100 POLS while BNB - POLS on PancakeSwap equals 20 POLS. It means that with 2.5 ETH - POLS or 12.5 BNB - POLS LP tokens (~ 250 POLS), you will receive 1 ticket. Therefore, similar to holding POLS, the more LP tokens you have, the higher chance you will be selected.</p>\r\n\r\n<h2 id=\"section-12\">Preparations before participating</h2>\r\n\r\n<p>After being eligible for the whitelist by staking or holding POLS/ LP tokens for 7 days, to participate in the IDO, you will need to prepare ETH/ BNB as the gas fee, which depends on what chain your desired project is on.&nbsp; Besides that, you will also need an additional amount of ETH/ BNB to buy the IDO token.&nbsp;</p>', 'images/news/2022/04/original/-1650744112.png', 'IDO,Product Walkthrough,Make Money, IDO & SHO', 2, 'investment', 'Investment', ',2,', ',investment,', NULL, 'how-to-farm-crypto-and-join-defi-safely', 9, 'admin', 'New Moon', '', NULL, NULL, '2022-04-24 03:01:23', '2022-04-24 03:01:53', NULL, NULL, 0, 1, 1, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', '', 'vi'),
(2, 'Evergrande and its effects on Crypto summarized in 30 sentences', 'Evergrande and its effects on Crypto summarized in 30 sentences', '<p>Polkastarter is among the top-tier IDO platforms in the crypto world. It has enabled many projects to raise funds successfully. According to cryptorank.io, Polkastarter is the No.1 IDO platform by the number of funded projects (73) and AVG ATH ROI (41.17x).&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/ido-comparision-1633912564464.jpg\" /></p>\r\n\r\n<p>As retail investors, of course, we can not miss any chance to make profits by taking part in promising IDO events. In this article, I will guide you to participate in IDO on Polkastarter step by step.</p>\r\n\r\n<h2 id=\"section-10\">Polkastarter Overview</h2>\r\n\r\n<p>As a leading launchpad, Polkastarter has enabled many projects to raise funds in a cheaper and faster way than IEO platforms. From the user&rsquo;s perspective, Polkastarter gives them the opportunities to buy tokens at a quite early stage with potentially high ROI afterward.</p>\r\n\r\n<p>The vision of Polkastarer is to be integrated into Polkadot to take advantage of the high scalability of the ecosystem. Built on Polkadot, Polkastater can leverage its cross-chain swaps, enjoying the high throughput of the native blockchain while still staying connected with other blockchains for liquidity. In the time waiting for the Polkadot&rsquo;s mainnet, Polkastarter has already run on Ethereum, Polygon, and Binance Smart Chain.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/polkastarter-1633912588810.jpg\" /></p>\r\n\r\n<h2 id=\"section-11\">How Polkastarter selects a whitelist winner</h2>\r\n\r\n<p>Firstly, to be eligible for a whitelist, users must hold POLS tokens/ LP tokens in their wallets for at least 7 days. If you do not want to wait, you can stake POLS instead. Your token will be locked for 7 days while you will have immediate access to apply for the whitelist.&nbsp;</p>\r\n\r\n<p>Secondly, to increase your chance of being selected, you should increase your &ldquo;POLS power&rdquo; in 3 following ways:&nbsp;</p>\r\n\r\n<p>Holing POLS: For every 250 POLS you hold in your wallet, you will receive 1 &ldquo;ticket&rdquo;, which is counted as 1 entry into the whitelist process. Note that you are not exchanging POLS for tickets, the number of POLS just &ldquo;represents&rdquo; the number of tickets you receive. The more POLS you hold, the more chances you will win the whitelist.<br />\r\nStaking POLS: It counts POLS power the same way as holding POLS.<br />\r\nProviding liquidity: Each LP token of the liquidity pool ETH - POLS on Uniswap equals 100 POLS while BNB - POLS on PancakeSwap equals 20 POLS. It means that with 2.5 ETH - POLS or 12.5 BNB - POLS LP tokens (~ 250 POLS), you will receive 1 ticket. Therefore, similar to holding POLS, the more LP tokens you have, the higher chance you will be selected.</p>\r\n\r\n<h2 id=\"section-12\">Preparations before participating</h2>\r\n\r\n<p>After being eligible for the whitelist by staking or holding POLS/ LP tokens for 7 days, to participate in the IDO, you will need to prepare ETH/ BNB as the gas fee, which depends on what chain your desired project is on.&nbsp; Besides that, you will also need an additional amount of ETH/ BNB to buy the IDO token.&nbsp;</p>', 'images/news/2022/04/original/-1650744173.png', 'IDO,Product Walkthrough,Make Money, IDO & SHO', 2, 'investment', 'Investment', ',2,', ',investment,', NULL, 'evergrande-and-its-effects-on-crypto-summarized-in-30-sentences', 9, 'admin', 'New Moon', '', NULL, NULL, '2022-04-24 03:02:23', '2022-04-24 03:02:53', NULL, NULL, 0, 1, 2, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', '', 'vi'),
(3, 'Web3 Founder alpha leaks and What’s next for DeFi?', 'Web3 Founder alpha leaks and What’s next for DeFi?', '<p>Polkastarter is among the top-tier IDO platforms in the crypto world. It has enabled many projects to raise funds successfully. According to cryptorank.io, Polkastarter is the No.1 IDO platform by the number of funded projects (73) and AVG ATH ROI (41.17x).&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/ido-comparision-1633912564464.jpg\" /></p>\r\n\r\n<p>As retail investors, of course, we can not miss any chance to make profits by taking part in promising IDO events. In this article, I will guide you to participate in IDO on Polkastarter step by step.</p>\r\n\r\n<h2 id=\"section-10\">Polkastarter Overview</h2>\r\n\r\n<p>As a leading launchpad, Polkastarter has enabled many projects to raise funds in a cheaper and faster way than IEO platforms. From the user&rsquo;s perspective, Polkastarter gives them the opportunities to buy tokens at a quite early stage with potentially high ROI afterward.</p>\r\n\r\n<p>The vision of Polkastarer is to be integrated into Polkadot to take advantage of the high scalability of the ecosystem. Built on Polkadot, Polkastater can leverage its cross-chain swaps, enjoying the high throughput of the native blockchain while still staying connected with other blockchains for liquidity. In the time waiting for the Polkadot&rsquo;s mainnet, Polkastarter has already run on Ethereum, Polygon, and Binance Smart Chain.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/polkastarter-1633912588810.jpg\" /></p>\r\n\r\n<h2 id=\"section-11\">How Polkastarter selects a whitelist winner</h2>\r\n\r\n<p>Firstly, to be eligible for a whitelist, users must hold POLS tokens/ LP tokens in their wallets for at least 7 days. If you do not want to wait, you can stake POLS instead. Your token will be locked for 7 days while you will have immediate access to apply for the whitelist.&nbsp;</p>\r\n\r\n<p>Secondly, to increase your chance of being selected, you should increase your &ldquo;POLS power&rdquo; in 3 following ways:&nbsp;</p>\r\n\r\n<p>Holing POLS: For every 250 POLS you hold in your wallet, you will receive 1 &ldquo;ticket&rdquo;, which is counted as 1 entry into the whitelist process. Note that you are not exchanging POLS for tickets, the number of POLS just &ldquo;represents&rdquo; the number of tickets you receive. The more POLS you hold, the more chances you will win the whitelist.<br />\r\nStaking POLS: It counts POLS power the same way as holding POLS.<br />\r\nProviding liquidity: Each LP token of the liquidity pool ETH - POLS on Uniswap equals 100 POLS while BNB - POLS on PancakeSwap equals 20 POLS. It means that with 2.5 ETH - POLS or 12.5 BNB - POLS LP tokens (~ 250 POLS), you will receive 1 ticket. Therefore, similar to holding POLS, the more LP tokens you have, the higher chance you will be selected.</p>\r\n\r\n<h2 id=\"section-12\">Preparations before participating</h2>\r\n\r\n<p>After being eligible for the whitelist by staking or holding POLS/ LP tokens for 7 days, to participate in the IDO, you will need to prepare ETH/ BNB as the gas fee, which depends on what chain your desired project is on.&nbsp; Besides that, you will also need an additional amount of ETH/ BNB to buy the IDO token.&nbsp;</p>', 'images/news/2022/04/original/-1650744230.png', 'IDO,Product Walkthrough,Make Money, IDO & SHO', 2, 'investment', 'Investment', ',2,', ',investment,', NULL, 'web3-founder-alpha-leaks-and-what’s-next-for-defi', 9, 'admin', 'New Moon', '', NULL, NULL, '2022-04-24 03:03:35', '2022-04-24 03:03:50', NULL, NULL, 0, 1, 3, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', '', 'vi'),
(4, 'How To Participate In DAO Maker IDO', 'How To Participate In DAO Maker IDO', '<p>Polkastarter is among the top-tier IDO platforms in the crypto world. It has enabled many projects to raise funds successfully. According to cryptorank.io, Polkastarter is the No.1 IDO platform by the number of funded projects (73) and AVG ATH ROI (41.17x).&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/ido-comparision-1633912564464.jpg\" /></p>\r\n\r\n<p>As retail investors, of course, we can not miss any chance to make profits by taking part in promising IDO events. In this article, I will guide you to participate in IDO on Polkastarter step by step.</p>\r\n\r\n<h2 id=\"section-10\">Polkastarter Overview</h2>\r\n\r\n<p>As a leading launchpad, Polkastarter has enabled many projects to raise funds in a cheaper and faster way than IEO platforms. From the user&rsquo;s perspective, Polkastarter gives them the opportunities to buy tokens at a quite early stage with potentially high ROI afterward.</p>\r\n\r\n<p>The vision of Polkastarer is to be integrated into Polkadot to take advantage of the high scalability of the ecosystem. Built on Polkadot, Polkastater can leverage its cross-chain swaps, enjoying the high throughput of the native blockchain while still staying connected with other blockchains for liquidity. In the time waiting for the Polkadot&rsquo;s mainnet, Polkastarter has already run on Ethereum, Polygon, and Binance Smart Chain.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/polkastarter-1633912588810.jpg\" /></p>\r\n\r\n<h2 id=\"section-11\">How Polkastarter selects a whitelist winner</h2>\r\n\r\n<p>Firstly, to be eligible for a whitelist, users must hold POLS tokens/ LP tokens in their wallets for at least 7 days. If you do not want to wait, you can stake POLS instead. Your token will be locked for 7 days while you will have immediate access to apply for the whitelist.&nbsp;</p>\r\n\r\n<p>Secondly, to increase your chance of being selected, you should increase your &ldquo;POLS power&rdquo; in 3 following ways:&nbsp;</p>\r\n\r\n<p>Holing POLS: For every 250 POLS you hold in your wallet, you will receive 1 &ldquo;ticket&rdquo;, which is counted as 1 entry into the whitelist process. Note that you are not exchanging POLS for tickets, the number of POLS just &ldquo;represents&rdquo; the number of tickets you receive. The more POLS you hold, the more chances you will win the whitelist.<br />\r\nStaking POLS: It counts POLS power the same way as holding POLS.<br />\r\nProviding liquidity: Each LP token of the liquidity pool ETH - POLS on Uniswap equals 100 POLS while BNB - POLS on PancakeSwap equals 20 POLS. It means that with 2.5 ETH - POLS or 12.5 BNB - POLS LP tokens (~ 250 POLS), you will receive 1 ticket. Therefore, similar to holding POLS, the more LP tokens you have, the higher chance you will be selected.</p>\r\n\r\n<h2 id=\"section-12\">Preparations before participating</h2>\r\n\r\n<p>After being eligible for the whitelist by staking or holding POLS/ LP tokens for 7 days, to participate in the IDO, you will need to prepare ETH/ BNB as the gas fee, which depends on what chain your desired project is on.&nbsp; Besides that, you will also need an additional amount of ETH/ BNB to buy the IDO token.&nbsp;</p>', 'images/news/2022/04/original/-1650744430.png', 'IDO,Product Walkthrough,Make Money, IDO & SHO', 1, 'make-money', 'Make money', ',1,', ',make-money,', NULL, 'how-to-participate-in-dao-maker-ido', 9, 'admin', 'New Moon', '', NULL, NULL, '2022-04-23 03:06:54', '2022-04-23 03:07:10', NULL, NULL, 0, 1, 4, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', '', 'vi'),
(5, 'How to participate in an IDO on AcceleRaytor (Raydium)', 'Polkastarter is among the top-tier IDO platforms in the crypto world. In this article, Coin98 will guide you on how to participate in Polkastarter IDO.', '<p>Polkastarter is among the top-tier IDO platforms in the crypto world. It has enabled many projects to raise funds successfully. According to cryptorank.io, Polkastarter is the No.1 IDO platform by the number of funded projects (73) and AVG ATH ROI (41.17x).&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/ido-comparision-1633912564464.jpg\" /></p>\r\n\r\n<p>As retail investors, of course, we can not miss any chance to make profits by taking part in promising IDO events. In this article, I will guide you to participate in IDO on Polkastarter step by step.</p>\r\n\r\n<h2 id=\"section-10\">Polkastarter Overview</h2>\r\n\r\n<p>As a leading launchpad, Polkastarter has enabled many projects to raise funds in a cheaper and faster way than IEO platforms. From the user&rsquo;s perspective, Polkastarter gives them the opportunities to buy tokens at a quite early stage with potentially high ROI afterward.</p>\r\n\r\n<p>The vision of Polkastarer is to be integrated into Polkadot to take advantage of the high scalability of the ecosystem. Built on Polkadot, Polkastater can leverage its cross-chain swaps, enjoying the high throughput of the native blockchain while still staying connected with other blockchains for liquidity. In the time waiting for the Polkadot&rsquo;s mainnet, Polkastarter has already run on Ethereum, Polygon, and Binance Smart Chain.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/polkastarter-1633912588810.jpg\" /></p>\r\n\r\n<h2 id=\"section-11\">How Polkastarter selects a whitelist winner</h2>\r\n\r\n<p>Firstly, to be eligible for a whitelist, users must hold POLS tokens/ LP tokens in their wallets for at least 7 days. If you do not want to wait, you can stake POLS instead. Your token will be locked for 7 days while you will have immediate access to apply for the whitelist.&nbsp;</p>\r\n\r\n<p>Secondly, to increase your chance of being selected, you should increase your &ldquo;POLS power&rdquo; in 3 following ways:&nbsp;</p>\r\n\r\n<p>Holing POLS: For every 250 POLS you hold in your wallet, you will receive 1 &ldquo;ticket&rdquo;, which is counted as 1 entry into the whitelist process. Note that you are not exchanging POLS for tickets, the number of POLS just &ldquo;represents&rdquo; the number of tickets you receive. The more POLS you hold, the more chances you will win the whitelist.<br />\r\nStaking POLS: It counts POLS power the same way as holding POLS.<br />\r\nProviding liquidity: Each LP token of the liquidity pool ETH - POLS on Uniswap equals 100 POLS while BNB - POLS on PancakeSwap equals 20 POLS. It means that with 2.5 ETH - POLS or 12.5 BNB - POLS LP tokens (~ 250 POLS), you will receive 1 ticket. Therefore, similar to holding POLS, the more LP tokens you have, the higher chance you will be selected.</p>\r\n\r\n<h2 id=\"section-12\">Preparations before participating</h2>\r\n\r\n<p>After being eligible for the whitelist by staking or holding POLS/ LP tokens for 7 days, to participate in the IDO, you will need to prepare ETH/ BNB as the gas fee, which depends on what chain your desired project is on.&nbsp; Besides that, you will also need an additional amount of ETH/ BNB to buy the IDO token.&nbsp;</p>', 'images/news/2022/04/original/-1650744466.png', 'IDO,Product Walkthrough,Make Money, IDO & SHO', 3, 'airdrop', 'Airdrop', ',3,1,', ',airdrop,make-money,', NULL, 'how-to-participate-in-an-ido-on-acceleraytor-raydium', 9, 'admin', 'New Moon', '', NULL, NULL, '2022-04-22 03:07:26', '2022-04-25 02:59:10', NULL, NULL, 0, 1, 5, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', '', 'vi'),
(6, 'How to participate in an IDO on Polkastarter', 'How to participate in an IDO on Polkastarter', '<p>Polkastarter is among the top-tier IDO platforms in the crypto world. It has enabled many projects to raise funds successfully. According to cryptorank.io, Polkastarter is the No.1 IDO platform by the number of funded projects (73) and AVG ATH ROI (41.17x).&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/ido-comparision-1633912564464.jpg\" /></p>\r\n\r\n<p>As retail investors, of course, we can not miss any chance to make profits by taking part in promising IDO events. In this article, I will guide you to participate in IDO on Polkastarter step by step.</p>\r\n\r\n<h2 id=\"section-10\">Polkastarter Overview</h2>\r\n\r\n<p>As a leading launchpad, Polkastarter has enabled many projects to raise funds in a cheaper and faster way than IEO platforms. From the user&rsquo;s perspective, Polkastarter gives them the opportunities to buy tokens at a quite early stage with potentially high ROI afterward.</p>\r\n\r\n<p>The vision of Polkastarer is to be integrated into Polkadot to take advantage of the high scalability of the ecosystem. Built on Polkadot, Polkastater can leverage its cross-chain swaps, enjoying the high throughput of the native blockchain while still staying connected with other blockchains for liquidity. In the time waiting for the Polkadot&rsquo;s mainnet, Polkastarter has already run on Ethereum, Polygon, and Binance Smart Chain.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/polkastarter-1633912588810.jpg\" /></p>\r\n\r\n<h2 id=\"section-11\">How Polkastarter selects a whitelist winner</h2>\r\n\r\n<p>Firstly, to be eligible for a whitelist, users must hold POLS tokens/ LP tokens in their wallets for at least 7 days. If you do not want to wait, you can stake POLS instead. Your token will be locked for 7 days while you will have immediate access to apply for the whitelist.&nbsp;</p>\r\n\r\n<p>Secondly, to increase your chance of being selected, you should increase your &ldquo;POLS power&rdquo; in 3 following ways:&nbsp;</p>\r\n\r\n<p>Holing POLS: For every 250 POLS you hold in your wallet, you will receive 1 &ldquo;ticket&rdquo;, which is counted as 1 entry into the whitelist process. Note that you are not exchanging POLS for tickets, the number of POLS just &ldquo;represents&rdquo; the number of tickets you receive. The more POLS you hold, the more chances you will win the whitelist.<br />\r\nStaking POLS: It counts POLS power the same way as holding POLS.<br />\r\nProviding liquidity: Each LP token of the liquidity pool ETH - POLS on Uniswap equals 100 POLS while BNB - POLS on PancakeSwap equals 20 POLS. It means that with 2.5 ETH - POLS or 12.5 BNB - POLS LP tokens (~ 250 POLS), you will receive 1 ticket. Therefore, similar to holding POLS, the more LP tokens you have, the higher chance you will be selected.</p>\r\n\r\n<h2 id=\"section-12\">Preparations before participating</h2>\r\n\r\n<p>After being eligible for the whitelist by staking or holding POLS/ LP tokens for 7 days, to participate in the IDO, you will need to prepare ETH/ BNB as the gas fee, which depends on what chain your desired project is on.&nbsp; Besides that, you will also need an additional amount of ETH/ BNB to buy the IDO token.&nbsp;</p>', 'images/news/2022/04/original/-1650782328.png', 'IDO,Product Walkthrough,Make Money, IDO & SHO', 1, 'make-money', 'Make money', ',1,', ',make-money,', NULL, 'how-to-participate-in-an-ido-on-polkastarter', 9, 'admin', 'New Moon', '', NULL, NULL, '2022-04-10 13:35:57', '2022-04-29 14:57:23', NULL, NULL, 0, 1, 6, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', '', 'vi');

-- --------------------------------------------------------

--
-- Table structure for table `fs_newsletter`
--

CREATE TABLE `fs_newsletter` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `published` tinyint(4) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `fs_news_`
--

CREATE TABLE `fs_news_` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `category_alias` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_id_wrapper` varchar(255) DEFAULT NULL,
  `category_alias_wrapper` varchar(255) DEFAULT NULL,
  `category_icon` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creator_name` varchar(255) DEFAULT NULL,
  `source_website` varchar(255) DEFAULT NULL,
  `new_date` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `editor` varchar(255) DEFAULT NULL,
  `show_in_homepage` tinyint(4) DEFAULT NULL,
  `hits` int(11) NOT NULL DEFAULT 0,
  `published` tinyint(4) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `title_display` varchar(255) DEFAULT NULL,
  `display_title` tinyint(4) NOT NULL DEFAULT 1,
  `display_column` int(11) NOT NULL,
  `tags_group` int(11) DEFAULT NULL,
  `rating_count` int(11) NOT NULL,
  `rating_sum` int(11) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `hot` tinyint(4) DEFAULT 0,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keyword` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `lang` varchar(255) DEFAULT 'vi'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_news_`
--

INSERT INTO `fs_news_` (`id`, `title`, `summary`, `content`, `image`, `tags`, `category_id`, `category_alias`, `category_name`, `category_id_wrapper`, `category_alias_wrapper`, `category_icon`, `alias`, `creator_id`, `creator`, `creator_name`, `source_website`, `new_date`, `created_time`, `updated_time`, `editor`, `show_in_homepage`, `hits`, `published`, `ordering`, `title_display`, `display_title`, `display_column`, `tags_group`, `rating_count`, `rating_sum`, `keywords`, `hot`, `seo_title`, `seo_keyword`, `seo_description`, `lang`) VALUES
(1, 'How to Farm Crypto and join DeFi safely?', 'How to Farm Crypto and join DeFi safely?', '<p>Polkastarter is among the top-tier IDO platforms in the crypto world. It has enabled many projects to raise funds successfully. According to cryptorank.io, Polkastarter is the No.1 IDO platform by the number of funded projects (73) and AVG ATH ROI (41.17x).&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/ido-comparision-1633912564464.jpg\" /></p>\r\n\r\n<p>As retail investors, of course, we can not miss any chance to make profits by taking part in promising IDO events. In this article, I will guide you to participate in IDO on Polkastarter step by step.</p>\r\n\r\n<h2 id=\"section-10\">Polkastarter Overview</h2>\r\n\r\n<p>As a leading launchpad, Polkastarter has enabled many projects to raise funds in a cheaper and faster way than IEO platforms. From the user&rsquo;s perspective, Polkastarter gives them the opportunities to buy tokens at a quite early stage with potentially high ROI afterward.</p>\r\n\r\n<p>The vision of Polkastarer is to be integrated into Polkadot to take advantage of the high scalability of the ecosystem. Built on Polkadot, Polkastater can leverage its cross-chain swaps, enjoying the high throughput of the native blockchain while still staying connected with other blockchains for liquidity. In the time waiting for the Polkadot&rsquo;s mainnet, Polkastarter has already run on Ethereum, Polygon, and Binance Smart Chain.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/polkastarter-1633912588810.jpg\" /></p>', 'images/news/2022/04/original/-1650744112.png', 'IDO,Product Walkthrough,Make Money, IDO & SHO', 2, 'investment', 'Investment', ',2,', ',investment,', NULL, 'how-to-farm-crypto-and-join-defi-safely', 9, 'admin', 'New Moon', NULL, NULL, '2022-04-24 03:01:23', '2022-04-24 03:01:53', NULL, NULL, 0, 1, 1, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', '', 'vi'),
(2, 'Evergrande and its effects on Crypto summarized in 30 sentences', 'Evergrande and its effects on Crypto summarized in 30 sentences', '<p>Polkastarter is among the top-tier IDO platforms in the crypto world. It has enabled many projects to raise funds successfully. According to cryptorank.io, Polkastarter is the No.1 IDO platform by the number of funded projects (73) and AVG ATH ROI (41.17x).&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/ido-comparision-1633912564464.jpg\" /></p>\r\n\r\n<p>As retail investors, of course, we can not miss any chance to make profits by taking part in promising IDO events. In this article, I will guide you to participate in IDO on Polkastarter step by step.</p>\r\n\r\n<h2 id=\"section-10\">Polkastarter Overview</h2>\r\n\r\n<p>As a leading launchpad, Polkastarter has enabled many projects to raise funds in a cheaper and faster way than IEO platforms. From the user&rsquo;s perspective, Polkastarter gives them the opportunities to buy tokens at a quite early stage with potentially high ROI afterward.</p>\r\n\r\n<p>The vision of Polkastarer is to be integrated into Polkadot to take advantage of the high scalability of the ecosystem. Built on Polkadot, Polkastater can leverage its cross-chain swaps, enjoying the high throughput of the native blockchain while still staying connected with other blockchains for liquidity. In the time waiting for the Polkadot&rsquo;s mainnet, Polkastarter has already run on Ethereum, Polygon, and Binance Smart Chain.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/polkastarter-1633912588810.jpg\" /></p>', 'images/news/2022/04/original/-1650744173.png', 'IDO,Product Walkthrough,Make Money, IDO & SHO', 2, 'investment', 'Investment', ',2,', ',investment,', NULL, 'evergrande-and-its-effects-on-crypto-summarized-in-30-sentences', 9, 'admin', 'New Moon', NULL, NULL, '2022-04-24 03:02:23', '2022-04-24 03:02:53', NULL, NULL, 0, 1, 2, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', '', 'vi'),
(3, 'Web3 Founder alpha leaks and What’s next for DeFi?', 'Web3 Founder alpha leaks and What’s next for DeFi?', '<p>Polkastarter is among the top-tier IDO platforms in the crypto world. It has enabled many projects to raise funds successfully. According to cryptorank.io, Polkastarter is the No.1 IDO platform by the number of funded projects (73) and AVG ATH ROI (41.17x).&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/ido-comparision-1633912564464.jpg\" /></p>\r\n\r\n<p>As retail investors, of course, we can not miss any chance to make profits by taking part in promising IDO events. In this article, I will guide you to participate in IDO on Polkastarter step by step.</p>\r\n\r\n<h2 id=\"section-10\">Polkastarter Overview</h2>\r\n\r\n<p>As a leading launchpad, Polkastarter has enabled many projects to raise funds in a cheaper and faster way than IEO platforms. From the user&rsquo;s perspective, Polkastarter gives them the opportunities to buy tokens at a quite early stage with potentially high ROI afterward.</p>\r\n\r\n<p>The vision of Polkastarer is to be integrated into Polkadot to take advantage of the high scalability of the ecosystem. Built on Polkadot, Polkastater can leverage its cross-chain swaps, enjoying the high throughput of the native blockchain while still staying connected with other blockchains for liquidity. In the time waiting for the Polkadot&rsquo;s mainnet, Polkastarter has already run on Ethereum, Polygon, and Binance Smart Chain.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/polkastarter-1633912588810.jpg\" /></p>', 'images/news/2022/04/original/-1650744230.png', 'IDO,Product Walkthrough,Make Money, IDO & SHO', 2, 'investment', 'Investment', ',2,', ',investment,', NULL, 'web3-founder-alpha-leaks-and-what’s-next-for-defi', 9, 'admin', 'New Moon', NULL, NULL, '2022-04-24 03:03:35', '2022-04-24 03:03:50', NULL, NULL, 0, 1, 3, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', '', 'vi'),
(4, 'How To Participate In DAO Maker IDO', 'How To Participate In DAO Maker IDO', '<p>Polkastarter is among the top-tier IDO platforms in the crypto world. It has enabled many projects to raise funds successfully. According to cryptorank.io, Polkastarter is the No.1 IDO platform by the number of funded projects (73) and AVG ATH ROI (41.17x).&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/ido-comparision-1633912564464.jpg\" /></p>\r\n\r\n<p>As retail investors, of course, we can not miss any chance to make profits by taking part in promising IDO events. In this article, I will guide you to participate in IDO on Polkastarter step by step.</p>\r\n\r\n<h2 id=\"section-10\">Polkastarter Overview</h2>\r\n\r\n<p>As a leading launchpad, Polkastarter has enabled many projects to raise funds in a cheaper and faster way than IEO platforms. From the user&rsquo;s perspective, Polkastarter gives them the opportunities to buy tokens at a quite early stage with potentially high ROI afterward.</p>\r\n\r\n<p>The vision of Polkastarer is to be integrated into Polkadot to take advantage of the high scalability of the ecosystem. Built on Polkadot, Polkastater can leverage its cross-chain swaps, enjoying the high throughput of the native blockchain while still staying connected with other blockchains for liquidity. In the time waiting for the Polkadot&rsquo;s mainnet, Polkastarter has already run on Ethereum, Polygon, and Binance Smart Chain.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/polkastarter-1633912588810.jpg\" /></p>', 'images/news/2022/04/original/-1650744430.png', 'IDO,Product Walkthrough,Make Money, IDO & SHO', 1, 'make-money', 'Make money', ',1,', ',make-money,', NULL, 'how-to-participate-in-dao-maker-ido', 9, 'admin', 'New Moon', NULL, NULL, '2022-04-23 03:06:54', '2022-04-23 03:07:10', NULL, NULL, 0, 1, 4, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', '', 'vi'),
(5, 'How to participate in an IDO on AcceleRaytor (Raydium)', 'Polkastarter is among the top-tier IDO platforms in the crypto world. In this article, Coin98 will guide you on how to participate in Polkastarter IDO.', '<p>Polkastarter is among the top-tier IDO platforms in the crypto world. It has enabled many projects to raise funds successfully. According to cryptorank.io, Polkastarter is the No.1 IDO platform by the number of funded projects (73) and AVG ATH ROI (41.17x).&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/ido-comparision-1633912564464.jpg\" /></p>\r\n\r\n<p>As retail investors, of course, we can not miss any chance to make profits by taking part in promising IDO events. In this article, I will guide you to participate in IDO on Polkastarter step by step.</p>\r\n\r\n<h2 id=\"section-10\">Polkastarter Overview</h2>\r\n\r\n<p>As a leading launchpad, Polkastarter has enabled many projects to raise funds in a cheaper and faster way than IEO platforms. From the user&rsquo;s perspective, Polkastarter gives them the opportunities to buy tokens at a quite early stage with potentially high ROI afterward.</p>\r\n\r\n<p>The vision of Polkastarer is to be integrated into Polkadot to take advantage of the high scalability of the ecosystem. Built on Polkadot, Polkastater can leverage its cross-chain swaps, enjoying the high throughput of the native blockchain while still staying connected with other blockchains for liquidity. In the time waiting for the Polkadot&rsquo;s mainnet, Polkastarter has already run on Ethereum, Polygon, and Binance Smart Chain.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/polkastarter-1633912588810.jpg\" /></p>', 'images/news/2022/04/original/-1650744466.png', 'IDO,Product Walkthrough,Make Money, IDO & SHO', 3, 'airdrop', 'Airdrop', ',3,1,', ',airdrop,make-money,', NULL, 'how-to-participate-in-an-ido-on-acceleraytor-raydium', 9, 'admin', 'New Moon', NULL, NULL, '2022-04-22 03:07:26', '2022-04-25 02:59:10', NULL, NULL, 0, 1, 5, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', '', 'vi'),
(6, 'How to participate in an IDO on Polkastarter', 'How to participate in an IDO on Polkastarter', '<p>Polkastarter is among the top-tier IDO platforms in the crypto world. It has enabled many projects to raise funds successfully. According to cryptorank.io, Polkastarter is the No.1 IDO platform by the number of funded projects (73) and AVG ATH ROI (41.17x).&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/ido-comparision-1633912564464.jpg\" /></p>\r\n\r\n<p>As retail investors, of course, we can not miss any chance to make profits by taking part in promising IDO events. In this article, I will guide you to participate in IDO on Polkastarter step by step.</p>\r\n\r\n<h2 id=\"section-10\">Polkastarter Overview</h2>\r\n\r\n<p>As a leading launchpad, Polkastarter has enabled many projects to raise funds in a cheaper and faster way than IEO platforms. From the user&rsquo;s perspective, Polkastarter gives them the opportunities to buy tokens at a quite early stage with potentially high ROI afterward.</p>\r\n\r\n<p>The vision of Polkastarer is to be integrated into Polkadot to take advantage of the high scalability of the ecosystem. Built on Polkadot, Polkastater can leverage its cross-chain swaps, enjoying the high throughput of the native blockchain while still staying connected with other blockchains for liquidity. In the time waiting for the Polkadot&rsquo;s mainnet, Polkastarter has already run on Ethereum, Polygon, and Binance Smart Chain.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploaded/images/polkastarter-1633912588810.jpg\" /></p>\r\n\r\n<p>How Polkastarter selects a whitelist winner</p>\r\n\r\n<p>Firstly, to be eligible for a whitelist, users must hold POLS tokens/ LP tokens in their wallets for at least 7 days. If you do not want to wait, you can stake POLS instead. Your token will be locked for 7 days while you will have immediate access to apply for the whitelist.&nbsp;</p>\r\n\r\n<p>Secondly, to increase your chance of being selected, you should increase your &ldquo;POLS power&rdquo; in 3 following ways:&nbsp;</p>\r\n\r\n<p>Holing POLS: For every 250 POLS you hold in your wallet, you will receive 1 &ldquo;ticket&rdquo;, which is counted as 1 entry into the whitelist process. Note that you are not exchanging POLS for tickets, the number of POLS just &ldquo;represents&rdquo; the number of tickets you receive. The more POLS you hold, the more chances you will win the whitelist.<br />\r\nStaking POLS: It counts POLS power the same way as holding POLS.<br />\r\nProviding liquidity: Each LP token of the liquidity pool ETH - POLS on Uniswap equals 100 POLS while BNB - POLS on PancakeSwap equals 20 POLS. It means that with 2.5 ETH - POLS or 12.5 BNB - POLS LP tokens (~ 250 POLS), you will receive 1 ticket. Therefore, similar to holding POLS, the more LP tokens you have, the higher chance you will be selected.</p>\r\n\r\n<p>Preparations before participating</p>\r\n\r\n<p>After being eligible for the whitelist by staking or holding POLS/ LP tokens for 7 days, to participate in the IDO, you will need to prepare ETH/ BNB as the gas fee, which depends on what chain your desired project is on.&nbsp; Besides that, you will also need an additional amount of ETH/ BNB to buy the IDO token.&nbsp;</p>', 'images/news/2022/04/original/-1650782328.png', 'IDO,Product Walkthrough,Make Money, IDO & SHO', 1, 'make-money', 'Make money', ',1,', ',make-money,', NULL, 'how-to-participate-in-an-ido-on-polkastarter', 9, 'admin', 'New Moon', NULL, NULL, '2022-04-10 13:35:57', '2022-04-29 14:57:23', NULL, NULL, 0, 1, 6, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', '', 'vi');

-- --------------------------------------------------------

--
-- Table structure for table `fs_news_categories`
--

CREATE TABLE `fs_news_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `alias_wrapper` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `list_parents` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `published` tinyint(4) NOT NULL DEFAULT 1,
  `ordering` int(11) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `show_in_homepage` tinyint(4) NOT NULL DEFAULT 1,
  `estore_id` int(11) DEFAULT NULL,
  `display_title` tinyint(4) NOT NULL DEFAULT 1,
  `display_tags` tinyint(4) NOT NULL DEFAULT 1,
  `display_related` tinyint(4) NOT NULL DEFAULT 1,
  `display_created_time` tinyint(4) NOT NULL DEFAULT 1,
  `display_category` tinyint(4) NOT NULL DEFAULT 1,
  `display_comment` tinyint(4) NOT NULL DEFAULT 1,
  `display_sharing` tinyint(4) NOT NULL DEFAULT 1,
  `name_display` varchar(255) NOT NULL,
  `is_comment` tinyint(4) NOT NULL,
  `notice` tinyint(4) DEFAULT 0 COMMENT 'Danh mục tin thông báo',
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keyword` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `lang` varchar(255) DEFAULT 'en'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_news_categories`
--

INSERT INTO `fs_news_categories` (`id`, `name`, `alias`, `category_id`, `alias_wrapper`, `parent_id`, `list_parents`, `level`, `published`, `ordering`, `image`, `icon`, `created_time`, `updated_time`, `show_in_homepage`, `estore_id`, `display_title`, `display_tags`, `display_related`, `display_created_time`, `display_category`, `display_comment`, `display_sharing`, `name_display`, `is_comment`, `notice`, `seo_title`, `seo_keyword`, `seo_description`, `lang`) VALUES
(1, 'Make money', 'make-money', NULL, ',make-money,', 0, ',1,', 0, 1, 1, NULL, NULL, '2022-04-24 02:32:38', '2022-04-24 02:32:38', 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, '', '', '', 'en'),
(2, 'Investment', 'investment', NULL, ',investment,', 0, ',2,', 0, 1, 2, NULL, NULL, '2022-04-24 02:32:52', '2022-04-24 02:32:52', 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, '', '', '', 'en'),
(3, 'Airdrop', 'airdrop', NULL, ',airdrop,make-money,', 1, ',3,1,', 1, 1, 3, NULL, NULL, '2022-04-24 02:33:07', '2022-04-24 02:33:07', 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, '', '', '', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `fs_news_menus`
--

CREATE TABLE `fs_news_menus` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `link` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `show_admin` tinyint(4) NOT NULL DEFAULT 1,
  `target` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 1,
  `default` tinyint(4) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 1,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `template` varchar(50) DEFAULT NULL,
  `condition` int(11) DEFAULT NULL,
  `list_parent` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `is_rewrite` tinyint(1) NOT NULL DEFAULT 0,
  `lang` varchar(255) DEFAULT 'vi',
  `category_banner` tinyint(4) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_news_menus`
--

INSERT INTO `fs_news_menus` (`id`, `name`, `alias`, `image`, `link`, `parent_id`, `post_id`, `show_admin`, `target`, `group_id`, `ordering`, `default`, `published`, `created_time`, `updated_time`, `template`, `condition`, `list_parent`, `level`, `is_rewrite`, `lang`, `category_banner`) VALUES
(1, 'How Polkastarter selects a whitelist winner', '', NULL, 'section-11', 0, 1, 1, NULL, NULL, 2, NULL, 0, '2022-04-29 14:57:06', '2022-04-29 14:57:06', NULL, NULL, NULL, NULL, 0, 'vi', 0),
(2, 'Polkastarter Overview', '', NULL, 'section-10', 0, 1, 1, NULL, NULL, 1, NULL, 0, '2022-04-29 14:52:14', '2022-04-29 14:52:14', NULL, NULL, NULL, NULL, 0, 'vi', 0),
(3, 'Preparations before participating', '', NULL, 'section-12', 0, 1, 1, NULL, NULL, 3, NULL, 0, '2022-04-29 14:57:19', '2022-04-29 14:57:19', NULL, NULL, NULL, NULL, 0, 'vi', 0),
(11, 'How Polkastarter selects a whitelist winner', '', NULL, 'section-11', 0, 2, 1, NULL, NULL, 1, NULL, 0, '2022-04-29 14:57:06', '2022-04-29 14:57:06', NULL, NULL, NULL, NULL, 0, 'vi', 0),
(12, 'Polkastarter Overview', '', NULL, 'section-10', 0, 2, 1, NULL, NULL, 0, NULL, 0, '2022-04-29 14:52:14', '2022-04-29 14:52:14', NULL, NULL, NULL, NULL, 0, 'vi', 0),
(13, 'Preparations before participating', '', NULL, 'section-12', 0, 2, 1, NULL, NULL, 0, NULL, 0, '2022-04-29 14:57:19', '2022-04-29 14:57:19', NULL, NULL, NULL, NULL, 0, 'vi', 0),
(21, 'How Polkastarter selects a whitelist winner', '', NULL, 'section-11', 0, 3, 1, NULL, NULL, 0, NULL, 0, '2022-04-29 14:57:06', '2022-04-29 14:57:06', NULL, NULL, NULL, NULL, 0, 'vi', 0),
(22, 'Polkastarter Overview', '', NULL, 'section-10', 0, 3, 1, NULL, NULL, 0, NULL, 0, '2022-04-29 14:52:14', '2022-04-29 14:52:14', NULL, NULL, NULL, NULL, 0, 'vi', 0),
(23, 'Preparations before participating', '', NULL, 'section-12', 0, 3, 1, NULL, NULL, 0, NULL, 0, '2022-04-29 14:57:19', '2022-04-29 14:57:19', NULL, NULL, NULL, NULL, 0, 'vi', 0),
(31, 'How Polkastarter selects a whitelist winner', '', NULL, 'section-11', 0, 4, 1, NULL, NULL, 0, NULL, 0, '2022-04-29 14:57:06', '2022-04-29 14:57:06', NULL, NULL, NULL, NULL, 0, 'vi', 0),
(32, 'Polkastarter Overview', '', NULL, 'section-10', 0, 4, 1, NULL, NULL, 0, NULL, 0, '2022-04-29 14:52:14', '2022-04-29 14:52:14', NULL, NULL, NULL, NULL, 0, 'vi', 0),
(33, 'Preparations before participating', '', NULL, 'section-12', 0, 4, 1, NULL, NULL, 0, NULL, 0, '2022-04-29 14:57:19', '2022-04-29 14:57:19', NULL, NULL, NULL, NULL, 0, 'vi', 0),
(41, 'How Polkastarter selects a whitelist winner', '', NULL, 'section-11', 0, 5, 1, NULL, NULL, 0, NULL, 0, '2022-04-29 14:57:06', '2022-04-29 14:57:06', NULL, NULL, NULL, NULL, 0, 'vi', 0),
(42, 'Polkastarter Overview', '', NULL, 'section-10', 0, 5, 1, NULL, NULL, 0, NULL, 0, '2022-04-29 14:52:14', '2022-04-29 14:52:14', NULL, NULL, NULL, NULL, 0, 'vi', 0),
(43, 'Preparations before participating', '', NULL, 'section-12', 0, 5, 1, NULL, NULL, 0, NULL, 0, '2022-04-29 14:57:19', '2022-04-29 14:57:19', NULL, NULL, NULL, NULL, 0, 'vi', 0),
(51, 'How Polkastarter selects a whitelist winner', '', NULL, 'section-11', 0, 6, 1, NULL, NULL, 0, NULL, 0, '2022-04-29 14:57:06', '2022-04-29 14:57:06', NULL, NULL, NULL, NULL, 0, 'vi', 0),
(52, 'Polkastarter Overview', '', NULL, 'section-10', 0, 6, 1, NULL, NULL, 0, NULL, 0, '2022-04-29 14:52:14', '2022-04-29 14:52:14', NULL, NULL, NULL, NULL, 0, 'vi', 0),
(53, 'Preparations before participating', '', NULL, 'section-12', 0, 6, 1, NULL, NULL, 0, NULL, 0, '2022-04-29 14:57:19', '2022-04-29 14:57:19', NULL, NULL, NULL, NULL, 0, 'vi', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fs_products`
--

CREATE TABLE `fs_products` (
  `id` int(11) NOT NULL,
  `affiliate` enum('shopee','lazada') CHARACTER SET latin1 DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `link` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `image` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `price` double DEFAULT NULL,
  `price_old` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_products`
--

INSERT INTO `fs_products` (`id`, `affiliate`, `title`, `link`, `image`, `price`, `price_old`) VALUES
(1, 'shopee', 'Bao cao su Okamoto 0.03 Platinum hộp 3 chiếc', 'https://shopee.vn/p-i.16751833.1708436292?deep_and_deferred=1&pid=partnerize_int&af_click_lookback=7d&is_retargeting=true&af_reengagement_window=7d&af_installpostback=false&af_sub3=&af_sub4=&af_sub2=SHOPEE&clickid=1101l7I4QT7V&af_siteid=1100l103605&utm_so', 'https://cf.shopee.vn/file/ace39ee5d98ff31bda067df35aa6db76', 89000, 110000),
(2, 'shopee', 'Bao cao su Sagami Original 0.01 hộp 5 chiếc nhập khẩu Nhật Bản - mỏng nhất thế giới', 'https://shopee.vn/p-i.16283701.1643201333?deep_and_deferred=1&pid=partnerize_int&af_click_lookback=7d&is_retargeting=true&af_reengagement_window=7d&af_installpostback=false&af_sub3=&af_sub4=&af_sub2=SHOPEE&clickid=1011l7KJe8rJ&af_siteid=1100l103605&utm_so', 'https://cf.shopee.vn/file/080b1244f207dcc20238b62e8fb81a09', 219000, 239000),
(3, 'shopee', 'Bao cao su sagami 0.02 cao cấp siêu mỏng - 12 chiếc', 'https://shopee.vn/p-i.16283701.1698540756?deep_and_deferred=1&pid=partnerize_int&af_click_lookback=7d&is_retargeting=true&af_reengagement_window=7d&af_installpostback=false&af_sub3=&af_sub4=&af_sub2=SHOPEE&clickid=1100l7Lbyiy4&af_siteid=1100l103605&utm_so', 'https://cf.shopee.vn/file/d2703e72efa96184ce2a743370be8b1c', 300000, 315000),
(4, 'lazada', 'Khẩu trang chống bụi mịn PM2.5', 'https://c.lazada.vn/t/c.1Pe4?url=https%3A%2F%2Fwww.lazada.vn%2Fproducts%2Fkhau-trang-chong-bui-min-pm25-i347432385-s564252592.html&', '//vn-test-11.slatic.net/p/f0b77c0860ff8eb03847948bee16518d.jpg_340x340q80.jpg_.webp', 20000, NULL),
(5, 'lazada', 'Giày thể thao nam TARANTO TRT-GTTN-02', 'https://www.lazada.vn/products/giay-the-thao-nam-taranto-trt-gttn-02-i202755455-s269583768.html?laz_trackid=2:mm_150581264_51753134_2010753180:clk5h33d81e23pt5g0mq55', '//vn-test-11.slatic.net/original/e8efbbe6c72f9e32718e0906bef2f1be.jpg_340x340q80.jpg_.webp', 168000, 290000),
(6, 'lazada', 'Balo cao cấp đựng laptop 15.6 inch cả nam và nữ đều dùng được balo tích hợp cổng sạc USB sử dụng đi học đi làm đi chơi sành điệu', 'https://c.lazada.vn/t/c.1VYw?url=https%3A%2F%2Fwww.lazada.vn%2Fproducts%2Fbalo-cao-cap-dung-laptop-156-inch-ca-nam-va-nu-deu-dung-duoc-balo-tich-hop-cong-sac-usb-su-dung-di-hoc-di-lam-di-choi-sanh-dieu-i313242081-s502140643.html&', '//vn-test-11.slatic.net/p/fa12c00d38586e55759b9839c25894e6.jpg_340x340q80.jpg_.webp', 95000, 230000),
(8, 'shopee', 'Hộp Bao cao su Durex Performa 12 cái + Tặng 1 Bao cao su Durex Performa 3 cái', 'https://shopee.vn/p-i.61792033.1037173896?deep_and_deferred=1&pid=partnerize_int&af_click_lookback=7d&is_retargeting=true&af_reengagement_window=7d&af_installpostback=false&af_sub3=&af_sub4=&af_sub2=SHOPEE&clickid=1101l7I5as8z&af_siteid=1100l103605&utm_so', 'https://cf.shopee.vn/file/22b784b23216e870f3d2f9149fa2e9a9', 194000, 216000),
(9, 'shopee', '[CHÍNH HÃNG]COMBO 2H Bao cao su Sagami Xtreme Spearmint hương bạc hà', 'https://shopee.vn/p-i.121698453.1855798222?deep_and_deferred=1&pid=partnerize_int&af_click_lookback=7d&is_retargeting=true&af_reengagement_window=7d&af_installpostback=false&af_sub3=&af_sub4=&af_sub2=SHOPEE&clickid=1100l7LbSLQb&af_siteid=1100l103605&utm_s', 'https://cf.shopee.vn/file/7db200bc28ce378804791d32d5f3de39', 137000, 170000),
(10, 'shopee', 'Áo Thun Unisex Tay Lỡ NY Phản Quang Đa Sắc Cực Hot', 'https://shopee.prf.hn/click/camref:1011l9cZN/adref:/pubref:/destination:https%3A%2F%2Fshopee.vn%2Funiversal-link%2Fp-i.112220565.2883767440', 'https://cf.shopee.vn/file/a875f5b70ac51c1cc5aafbc4d608c965', 83300, 119000),
(11, 'shopee', 'Áo Thun Unisex Hades Phản Quang Đa Sắc', 'https://shopee.prf.hn/click/camref:1011l9cZN/adref:/pubref:/destination:https%3A%2F%2Fshopee.vn%2Funiversal-link%2Fp-i.194001630.6305176231', 'https://cf.shopee.vn/file/83d23b691fe38de7264b8ba667f82f57', 89000, 119000);

-- --------------------------------------------------------

--
-- Table structure for table `fs_products_categories`
--

CREATE TABLE `fs_products_categories` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `alias` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `icon` varchar(250) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `show_in_homepage` tinyint(2) NOT NULL DEFAULT 0,
  `show_in_footer` tinyint(2) NOT NULL DEFAULT 1,
  `root_id` int(11) DEFAULT NULL,
  `root_alias` varchar(100) DEFAULT NULL,
  `list_parents` varchar(255) DEFAULT NULL,
  `alias_wrapper` varchar(255) DEFAULT NULL,
  `tablename` varchar(255) DEFAULT NULL,
  `tags_group` varchar(255) DEFAULT NULL,
  `total_products` int(11) DEFAULT 0,
  `source` varchar(255) NOT NULL,
  `discount` double DEFAULT NULL COMMENT 'Giảm giá cho list sản phẩm trong categories',
  `category_news` int(11) DEFAULT 0,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keyword` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `lang` varchar(255) DEFAULT 'vi'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `fs_projects`
--

CREATE TABLE `fs_projects` (
  `id` int(11) NOT NULL,
  `summary` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `category_alias` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_id_wrapper` varchar(255) DEFAULT NULL,
  `category_alias_wrapper` varchar(255) DEFAULT NULL,
  `category_icon` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `source_website` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `editor` varchar(255) DEFAULT NULL,
  `show_in_homepage` tinyint(4) DEFAULT NULL,
  `hits` int(11) NOT NULL DEFAULT 0,
  `published` tinyint(4) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `title_display` varchar(255) DEFAULT NULL,
  `display_title` tinyint(4) NOT NULL DEFAULT 1,
  `display_column` int(11) NOT NULL,
  `tags_group` int(11) DEFAULT NULL,
  `rating_count` int(11) NOT NULL,
  `rating_sum` int(11) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `hot` tinyint(4) DEFAULT 0,
  `total_images` tinyint(4) DEFAULT 0,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keyword` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `lang` varchar(255) DEFAULT 'vi',
  `twitter` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `telegram` varchar(255) NOT NULL,
  `github` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `reddit` varchar(255) NOT NULL,
  `medium` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_projects`
--

INSERT INTO `fs_projects` (`id`, `summary`, `content`, `tags`, `category_id`, `category_alias`, `category_name`, `category_id_wrapper`, `category_alias_wrapper`, `category_icon`, `title`, `alias`, `image`, `creator`, `source_website`, `created_time`, `updated_time`, `editor`, `show_in_homepage`, `hits`, `published`, `ordering`, `title_display`, `display_title`, `display_column`, `tags_group`, `rating_count`, `rating_sum`, `keywords`, `hot`, `total_images`, `seo_title`, `seo_keyword`, `seo_description`, `lang`, `twitter`, `website`, `telegram`, `github`, `facebook`, `reddit`, `medium`) VALUES
(1, 'Hamster Token is a de-centralized meme token which was created on BSC Network. The specific feature that distinguishes it from other meme tokens in the market is that it is more powerful and secure.', '', 'DApp,DEX', 2, 'binance-smart-chain', 'Binance Smart Chain', ',2,', ',binance-smart-chain,', NULL, 'Hamster', 'hamster', 'images/projects/2022/04/original/hamster-1650965607.png', NULL, NULL, '2022-04-26 16:31:23', '2022-05-06 08:51:58', NULL, NULL, 0, 1, 1, NULL, 1, 0, NULL, 0, 0, '', 0, 0, '', '', '', 'vi', 'http://newmoon.cuchay.vn/projects/binance-smart-chain-c2', 'http://newmoon.cuchay.vn/projects/binance-smart-chain-c2', 'http://newmoon.cuchay.vn/projects/binance-smart-chain-c2', 'http://newmoon.cuchay.vn/projects/binance-smart-chain-c2', 'http://newmoon.cuchay.vn/projects/binance-smart-chain-c2', 'http://newmoon.cuchay.vn/projects/binance-smart-chain-c2', 'http://newmoon.cuchay.vn/projects/binance-smart-chain-c2'),
(2, 'JUMPN is a web3 lifestyle app that implements the jump-to-earn concept.', '', '', 2, 'binance-smart-chain', 'Binance Smart Chain', ',2,', ',binance-smart-chain,', NULL, 'JUMPN', 'jumpn', 'images/projects/2022/04/original/jumpn-1650965655.png', NULL, NULL, '2022-04-26 16:33:53', '2022-05-06 08:51:33', NULL, NULL, 0, 1, 2, NULL, 1, 0, NULL, 0, 0, '', 0, 0, '', '', '', 'vi', 'http://newmoon.cuchay.vn/projects/binance-smart-chain-c2', 'http://newmoon.cuchay.vn/projects/binance-smart-chain-c2', 'http://newmoon.cuchay.vn/projects/binance-smart-chain-c2', 'http://newmoon.cuchay.vn/projects/binance-smart-chain-c2', 'http://newmoon.cuchay.vn/projects/binance-smart-chain-c2', 'http://newmoon.cuchay.vn/projects/binance-smart-chain-c2', 'http://newmoon.cuchay.vn/projects/binance-smart-chain-c2');

-- --------------------------------------------------------

--
-- Table structure for table `fs_projects_categories`
--

CREATE TABLE `fs_projects_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `alias_wrapper` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `list_parents` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `published` tinyint(4) NOT NULL DEFAULT 1,
  `ordering` int(11) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `show_in_homepage` tinyint(4) NOT NULL DEFAULT 1,
  `estore_id` int(11) DEFAULT NULL,
  `display_title` tinyint(4) NOT NULL DEFAULT 1,
  `display_tags` tinyint(4) NOT NULL DEFAULT 1,
  `display_related` tinyint(4) NOT NULL DEFAULT 1,
  `display_created_time` tinyint(4) NOT NULL DEFAULT 1,
  `display_category` tinyint(4) NOT NULL DEFAULT 1,
  `display_comment` tinyint(4) NOT NULL DEFAULT 1,
  `display_sharing` tinyint(4) NOT NULL DEFAULT 1,
  `name_display` varchar(255) NOT NULL,
  `is_comment` tinyint(4) NOT NULL,
  `notice` tinyint(4) DEFAULT 0 COMMENT 'Danh mục tin thông báo',
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keyword` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `lang` varchar(255) DEFAULT 'vi',
  `tags` text DEFAULT NULL,
  `summary` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_projects_categories`
--

INSERT INTO `fs_projects_categories` (`id`, `name`, `alias`, `category_id`, `alias_wrapper`, `parent_id`, `list_parents`, `level`, `published`, `ordering`, `image`, `icon`, `created_time`, `updated_time`, `show_in_homepage`, `estore_id`, `display_title`, `display_tags`, `display_related`, `display_created_time`, `display_category`, `display_comment`, `display_sharing`, `name_display`, `is_comment`, `notice`, `seo_title`, `seo_keyword`, `seo_description`, `lang`, `tags`, `summary`) VALUES
(2, 'Binance Smart Chain', 'binance-smart-chain', NULL, ',binance-smart-chain,', 0, ',2,', 0, 1, 1, NULL, 'images/categories/_1650962430.png', '2022-04-26 15:40:30', '2022-04-28 01:43:22', 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, '', '', '', 'vi', 'AMM Aggregator,DApp,Dashboard,DEX,Governance', 'Top BSC Projects: NFT, Blockchain Games, Web3, DeFi, Dapps & More'),
(3, 'Solana', 'solana', NULL, ',solana,', NULL, ',3,', 0, 1, 2, NULL, 'images/categories/_1650962513.png', '2022-04-26 15:41:53', '2022-04-26 15:41:53', 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, '', '', '', 'vi', NULL, NULL),
(4, 'Polygon', 'polygon', NULL, ',polygon,', NULL, ',4,', 0, 1, 3, NULL, 'images/categories/_1650962548.png', '2022-04-26 15:42:28', '2022-04-26 15:42:28', 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, '', '', '', 'vi', NULL, NULL),
(5, 'Play To Earn', 'play-to-earn', NULL, ',play-to-earn,', NULL, ',5,', 0, 1, 4, NULL, 'images/categories/_1650964550.png', '2022-04-26 16:15:50', '2022-05-06 10:20:49', 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, '', '', '', 'vi', '', ''),
(6, 'Avalanche', 'avalanche', NULL, ',avalanche,', NULL, ',6,', 0, 1, 5, NULL, 'images/categories/_1650966046.png', '2022-04-26 16:40:46', '2022-05-06 10:23:32', 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, '', '', '', 'vi', '', ''),
(7, 'Cardano', 'cardano', NULL, ',cardano,', NULL, ',7,', 0, 1, 6, NULL, 'images/categories/_1651807428.png', '2022-05-06 10:23:48', '2022-05-06 10:24:48', 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, '', '', '', 'vi', '', ''),
(8, 'Terra', 'terra', NULL, ',terra,', NULL, ',8,', 0, 1, 7, NULL, 'images/categories/_1651807510.png', '2022-05-06 10:25:10', '2022-05-06 10:25:10', 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, '', '', '', 'vi', '', ''),
(9, 'Fantom', 'fantom', NULL, ',fantom,', NULL, ',9,', 0, 1, 8, NULL, 'images/categories/_1651807532.jpeg', '2022-05-06 10:25:32', '2022-05-06 10:25:32', 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, '', '', '', 'vi', '', ''),
(10, 'Celo', 'celo', NULL, ',celo,', NULL, ',10,', 0, 1, 9, NULL, 'images/categories/_1651807547.jpeg', '2022-05-06 10:25:47', '2022-05-06 10:25:47', 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, '', '', '', 'vi', '', ''),
(11, 'Near', 'near', NULL, ',near,', NULL, ',11,', 0, 1, 10, NULL, 'images/categories/_1651807561.png', '2022-05-06 10:26:01', '2022-05-06 10:26:01', 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, '', '', '', 'vi', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `fs_shortlink`
--

CREATE TABLE `fs_shortlink` (
  `id` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_shortlink`
--

INSERT INTO `fs_shortlink` (`id`, `link`) VALUES
(1486, 'https://shopee.prf.hn/click/camref:1011l9cZN/adref:/pubref:/destination:https%3A%2F%2Fshopee.vn%2Funiversal-link%2Fp-i.29678782.1906785904'),
(1487, 'https://shopee.prf.hn/click/camref:1011l9cZN/adref:/pubref:/destination:https%3A%2F%2Fshopee.vn%2Funiversal-link%2Fp-i.11370831.124147885'),
(1488, 'https://shopee.prf.hn/click/camref:1011l9cZN/adref:/pubref:/destination:https%3A%2F%2Fshopee.vn%2Funiversal-link%2Fp-i.16283701.1643201333'),
(1489, 'https://shopee.prf.hn/click/camref:1011l9cZN/adref:/pubref:/destination:https%3A%2F%2Fshopee.vn%2Funiversal-link%2Fp-i.16283701.1698540756'),
(1490, 'https://shopee.prf.hn/click/camref:1011l9cZN/adref:/pubref:/destination:https%3A%2F%2Fshopee.vn%2Funiversal-link%2Fp-i.16751833.1708436292'),
(1491, 'https://shopee.prf.hn/click/camref:1011l9cZN/adref:/pubref:/destination:https%3A%2F%2Fshopee.vn%2Funiversal-link%2Fp-i.61792033.1037173896'),
(1492, 'https://shopee.prf.hn/click/camref:1011l9cZN/adref:/pubref:/destination:https%3A%2F%2Fshopee.vn%2Funiversal-link%2Fp-i.121698453.1855798222'),
(1493, 'https://shopee.prf.hn/click/camref:1011l9cZN/adref:/pubref:/destination:https%3A%2F%2Fshopee.vn%2Funiversal-link%2Fp-i.94287230.1550007262');

-- --------------------------------------------------------

--
-- Table structure for table `fs_sitemap`
--

CREATE TABLE `fs_sitemap` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `alias_wrapper` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `list_parents` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `published` tinyint(4) NOT NULL DEFAULT 1,
  `ordering` int(11) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `is_root` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_sitemap`
--

INSERT INTO `fs_sitemap` (`id`, `name`, `alias`, `alias_wrapper`, `parent_id`, `list_parents`, `level`, `published`, `ordering`, `image`, `icon`, `record_id`, `module`, `table_name`, `created_time`, `updated_time`, `is_root`) VALUES
(2, 'Hệ thống chất lượng', 'he-thong-chat-luong', ',he-thong-chat-luong,', 0, ',2,', 0, 1, 2, NULL, NULL, 2, 'products', 'fs_products_categories', '2018-08-21 16:27:41', '2018-08-21 16:27:41', 0),
(3, 'Sản phẩm Clinker', 'san-pham-clinker', ',san-pham-clinker,', 0, ',3,', 0, 1, 3, NULL, NULL, 3, 'products', 'fs_products_categories', '2018-08-21 16:27:52', '2018-08-21 16:27:52', 0),
(5, 'Sản phẩm đá CaCO3', 'san-pham-da-caco3', ',san-pham-da-caco3,', 0, ',5,', 0, 1, 5, NULL, NULL, 5, 'products', 'fs_products_categories', '2018-08-21 16:28:14', '2018-08-21 16:28:14', 0),
(6, 'Sàn thể thao', 'san-the-thao', ',san-the-thao,', 0, ',6,', 0, 1, 6, NULL, NULL, 6, 'products', 'fs_products_categories', '2018-07-01 14:08:55', '2018-07-01 14:55:49', 0),
(7, 'Thiên Xứng', 'thien-xung', ',thien-xung,', 0, ',7,', 0, 1, 0, NULL, NULL, 7, 'products', 'fs_products_categories', '2015-02-11 14:17:01', '2015-03-19 09:14:46', 0),
(8, 'Thiên Hạt', 'thien-hat', ',thien-hat,', 0, ',8,', 0, 1, 0, NULL, NULL, 8, 'products', 'fs_products_categories', '2015-02-11 14:17:12', '2015-03-19 09:15:16', 0),
(10, 'Trợ giúp', 'tro-giup', ',tro-giup,', 0, ',2,', 0, 1, 2, NULL, NULL, 2, 'statics', 'fs_statics_categories', '2015-03-03 10:58:01', '2015-03-03 10:58:01', 0),
(11, 'Hợp tác', 'hop-tac', ',hop-tac,', 0, ',3,', 0, 1, 3, NULL, NULL, 3, 'statics', 'fs_statics_categories', '2015-03-03 11:00:24', '2015-03-03 11:00:24', 0),
(13, 'Răng hàm mặt', 'rang-ham-mat', ',rang-ham-mat,', 0, ',2,', 0, 1, 2, NULL, NULL, 2, 'specialist', 'fs_specialist', '2015-09-07 06:32:17', '2015-09-07 06:32:17', 0),
(14, 'Tai mũi họng', 'tai-mui-hong', ',tai-mui-hong,', 0, ',3,', 0, 1, 3, NULL, NULL, 3, 'specialist', 'fs_specialist', '2015-09-07 06:34:20', '2015-09-07 06:34:20', 0),
(16, 'Nội tổng hợp', 'noi-khoa', ',noi-khoa,', 0, ',5,', 0, 1, 5, NULL, NULL, 5, 'specialist', 'fs_specialist', '2015-09-07 06:34:38', '2015-10-16 11:55:09', 0),
(17, 'Ngoại tổng hợp', 'ngoai-tong-hop', ',ngoai-tong-hop,', 0, ',6,', 0, 1, 6, NULL, NULL, 6, 'specialist', 'fs_specialist', '2015-09-07 06:34:49', '2015-10-16 11:55:00', 0),
(18, 'Tim mạch', 'tim-mach', ',tim-mach,', 0, ',7,', 0, 1, 7, NULL, NULL, 7, 'specialist', 'fs_specialist', '2015-10-16 11:36:24', '2015-10-16 11:36:24', 0),
(19, 'Thần kinh', 'than-kinh', ',than-kinh,', 0, ',8,', 0, 1, 8, NULL, NULL, 8, 'specialist', 'fs_specialist', '2015-10-16 11:36:37', '2015-10-16 11:36:37', 0),
(20, 'Cơ xương khớp', 'co-xuong-khop', ',co-xuong-khop,', 0, ',9,', 0, 1, 9, NULL, NULL, 9, 'specialist', 'fs_specialist', '2015-10-16 11:36:48', '2015-10-16 11:36:48', 0),
(21, 'Tâm thần', 'tam-than', ',tam-than,', 0, ',10,', 0, 1, 10, NULL, NULL, 10, 'specialist', 'fs_specialist', '2015-10-16 11:36:57', '2015-10-16 11:36:57', 0),
(22, 'Phục hồi chức năng', 'phuc-hoi-chuc-nang', ',phuc-hoi-chuc-nang,', 0, ',11,', 0, 1, 11, NULL, NULL, 11, 'specialist', 'fs_specialist', '2015-10-16 11:37:06', '2015-10-16 11:37:06', 0),
(23, 'Tiêu hóa', 'tieu-hoa', ',tieu-hoa,', 0, ',12,', 0, 1, 12, NULL, NULL, 12, 'specialist', 'fs_specialist', '2015-10-16 11:38:06', '2015-10-16 11:38:06', 0),
(24, 'Thận – Tiết niệu', 'than-–-tiet-nieu', ',than-–-tiet-nieu,', 0, ',13,', 0, 1, 13, NULL, NULL, 13, 'specialist', 'fs_specialist', '2015-10-16 11:38:16', '2015-10-16 11:38:16', 0),
(25, 'Huyết học', 'huyet-hoc', ',huyet-hoc,', 0, ',14,', 0, 1, 14, NULL, NULL, 14, 'specialist', 'fs_specialist', '2015-10-16 11:38:25', '2015-10-16 11:38:25', 0),
(26, 'Hô hấp', 'ho-hap', ',ho-hap,', 0, ',15,', 0, 1, 15, NULL, NULL, 15, 'specialist', 'fs_specialist', '2015-10-16 11:38:34', '2015-10-16 11:38:34', 0),
(27, 'Truyền nhiễm', 'truyen-nhiem', ',truyen-nhiem,', 0, ',16,', 0, 1, 16, NULL, NULL, 16, 'specialist', 'fs_specialist', '2015-10-16 11:38:42', '2015-10-16 11:38:42', 0),
(41, 'Biệt thự / Penhouse Bán', 'biet-thu-penhouse-ban', ',biet-thu-penhouse-ban,', 0, ',2,', 0, 1, 3, NULL, NULL, 2, 'lands', 'fs_lands_categories', '2015-12-16 10:20:09', '2016-01-08 11:49:01', 0),
(42, 'Nhà Bán', 'nha-ban', ',nha-ban,', 0, ',3,', 0, 1, 4, NULL, NULL, 3, 'lands', 'fs_lands_categories', '2015-12-16 10:21:21', '2016-01-08 11:49:16', 0),
(44, 'Căn hộ/ Chung cư Bán', 'can-ho-chung-cu-ban', ',can-ho-chung-cu-ban,', 0, ',5,', 0, 1, 6, NULL, NULL, 5, 'lands', 'fs_lands_categories', '2015-12-16 10:21:48', '2016-01-08 11:50:11', 0),
(45, 'Kho / Xưởng bán', 'kho-xuong-ban', ',kho-xuong-ban,', 0, ',6,', 0, 1, 6, NULL, NULL, 6, 'lands', 'fs_lands_categories', '2015-12-16 10:22:06', '2015-12-24 14:03:53', 0),
(46, 'Các loại bất động sản khác', 'khac', ',khac,', 0, ',7,', 0, 1, 7, NULL, NULL, 7, 'lands', 'fs_lands_categories', '2015-12-16 10:22:19', '2015-12-24 14:04:11', 0),
(47, 'Nhà thuê', 'nha-thue', ',nha-thue,', 0, ',8,', 0, 1, 1, NULL, NULL, 8, 'lands', 'fs_lands_categories', '2015-12-16 10:25:41', '2015-12-24 14:05:29', 0),
(48, 'Phòng trọ thuê', 'nha-tro', ',nha-tro,', 0, ',9,', 0, 1, 2, NULL, NULL, 9, 'lands', 'fs_lands_categories', '2015-12-16 10:26:37', '2015-12-24 14:05:51', 0),
(49, 'Căn hộ/Chung cư thuê', 'can-hochung-cu-thue', ',can-hochung-cu-thue,', 0, ',10,', 0, 1, 3, NULL, NULL, 10, 'lands', 'fs_lands_categories', '2015-12-16 10:26:48', '2015-12-24 14:06:37', 0),
(50, 'Văn phòng thuê', 'van-phong-thue', ',van-phong-thue,', 0, ',11,', 0, 1, 4, NULL, NULL, 11, 'lands', 'fs_lands_categories', '2015-12-16 10:27:21', '2015-12-24 14:06:58', 0),
(51, 'Đất thuê', 'dat-thue', ',dat-thue,', 0, ',12,', 0, 1, 5, NULL, NULL, 12, 'lands', 'fs_lands_categories', '2015-12-16 10:27:47', '2015-12-24 14:07:25', 0),
(52, 'Khách sạn thuê', 'khach-san-thue', ',khach-san-thue,', 0, ',13,', 0, 1, 6, NULL, NULL, 13, 'lands', 'fs_lands_categories', '2015-12-16 10:28:05', '2015-12-24 14:07:46', 0),
(53, 'Kho xưởng thuê', 'kho-xuong', ',kho-xuong,', 0, ',14,', 0, 1, 7, NULL, NULL, 14, 'lands', 'fs_lands_categories', '2015-12-16 10:28:18', '2015-12-24 14:08:03', 0),
(54, 'Chọn tất cả', 'dat', ',dat,', 0, ',15,', 0, 0, 11, NULL, NULL, 15, 'lands', 'fs_lands_categories', '2015-12-16 10:28:32', '2015-12-24 14:08:25', 0),
(55, 'Các loại bất động sản khác', 'cac-loai-bat-dong-san-khac', ',cac-loai-bat-dong-san-khac,', 0, ',16,', 0, 1, 9, NULL, NULL, 16, 'lands', 'fs_lands_categories', '2015-12-16 10:28:41', '2015-12-24 14:08:48', 0),
(123, 'Investment', 'investment', ',investment,', 0, ',2,', 0, 1, 2, NULL, NULL, 2, 'news', 'fs_news_categories', '2022-04-24 02:32:52', '2022-04-24 02:32:52', 0),
(76, 'Quán Cafe - Quán Nước', 'quan-cafe-quan-nuoc', ',quan-cafe-quan-nuoc,', 0, ',37,', 0, 1, 18, NULL, NULL, 37, 'lands', 'fs_lands_categories', '2015-12-24 14:12:05', '2015-12-24 14:12:05', 0),
(77, 'Nhà Hàng - Quán Ăn', 'nha-hang-quan-an', ',nha-hang-quan-an,', 0, ',38,', 0, 1, 19, NULL, NULL, 38, 'lands', 'fs_lands_categories', '2015-12-24 14:12:28', '2015-12-24 14:12:28', 0),
(78, 'Quán Bar - Quán Karaoke', 'quan-bar-quan-karaoke', ',quan-bar-quan-karaoke,', 0, ',39,', 0, 1, 20, NULL, NULL, 39, 'lands', 'fs_lands_categories', '2015-12-24 14:12:42', '2015-12-24 14:12:42', 0),
(79, 'Cửa Hàng / Shop Thời Trang', 'cua-hang-shop-thoi-trang', ',cua-hang-shop-thoi-trang,', 0, ',40,', 0, 1, 21, NULL, NULL, 40, 'lands', 'fs_lands_categories', '2015-12-24 14:12:54', '2015-12-24 14:12:54', 0),
(80, 'Spa - Thẩm Mỹ Viện', 'spa-tham-my-vien', ',spa-tham-my-vien,', 0, ',41,', 0, 1, 22, NULL, NULL, 41, 'lands', 'fs_lands_categories', '2015-12-24 14:13:04', '2015-12-24 14:13:12', 0),
(81, 'Studio / Áo Cưới', 'studio-ao-cuoi', ',studio-ao-cuoi,', 0, ',42,', 0, 1, 23, NULL, NULL, 42, 'lands', 'fs_lands_categories', '2015-12-24 14:13:31', '2015-12-24 14:13:31', 0),
(82, 'Kios - Mặt Bằng Chợ', 'kios-mat-bang-cho', ',kios-mat-bang-cho,', 0, ',43,', 0, 1, 24, NULL, NULL, 43, 'lands', 'fs_lands_categories', '2015-12-24 14:13:46', '2015-12-24 14:13:46', 0),
(83, 'Các Loại Sang Nhượng Khác', 'cac-loai-sang-nhuong-khac', ',cac-loai-sang-nhuong-khac,', 0, ',44,', 0, 1, 25, NULL, NULL, 44, 'lands', 'fs_lands_categories', '2015-12-24 14:14:01', '2015-12-24 14:14:01', 0),
(124, 'Airdrop', 'airdrop', ',airdrop,make-money,', 1, ',3,1,', 1, 1, 3, NULL, NULL, 3, 'news', 'fs_news_categories', '2022-04-24 02:33:07', '2022-04-24 02:33:07', 0),
(131, 'Câu hỏi thường gặp', 'cau-hoi-thuong-gap', ',cau-hoi-thuong-gap,', 0, ',1,', 0, 1, 1, NULL, NULL, 1, 'faqs', 'fs_faqs_categories', '2018-04-30 23:06:14', '2018-04-30 23:06:14', 0),
(93, 'Nhà Trọ Bán', 'nha-tro-ban', ',nha-tro-ban,', 0, ',54,', 0, 1, 29, NULL, NULL, 54, 'lands', 'fs_lands_categories', '2016-01-08 11:51:04', '2016-01-08 11:51:04', 0),
(94, 'Khách Sạn Bán', 'khach-san-ban', ',khach-san-ban,', 0, ',55,', 0, 1, 30, NULL, NULL, 55, 'lands', 'fs_lands_categories', '2016-01-08 11:51:25', '2016-01-08 11:51:25', 0),
(95, 'Biệt thự / Penhouse Thuê', 'biet-thu-penhouse-thue', ',biet-thu-penhouse-thue,', 0, ',56,', 0, 1, 12, NULL, NULL, 56, 'lands', 'fs_lands_categories', '2016-01-08 11:59:31', '2016-01-08 11:59:31', 0),
(96, 'Chọn tất cả', 'chon-tat-ca', ',chon-tat-ca,', 0, ',57,', 0, 0, 21, NULL, NULL, 57, 'lands', 'fs_lands_categories', '2016-01-08 12:02:11', '2016-01-08 12:02:11', 0),
(97, 'Chọn tất cả', 'chon-tat-ca', ',chon-tat-ca,', 0, ',58,', 0, 0, 30, NULL, NULL, 58, 'lands', 'fs_lands_categories', '2016-01-08 12:03:24', '2016-01-08 12:03:24', 0),
(98, 'Khu đô thị', 'khu-do-thi', ',khu-do-thi,', 0, ',59,', 0, 1, 31, NULL, NULL, 59, 'lands', 'fs_lands_categories', '2016-01-08 12:03:40', '2016-01-08 12:03:40', 0),
(99, 'Khu dân cư', 'khu-dan-cu', ',khu-dan-cu,', 0, ',60,', 0, 1, 32, NULL, NULL, 60, 'lands', 'fs_lands_categories', '2016-01-08 12:03:56', '2016-01-08 12:03:56', 0),
(100, 'Khu biệt thự', 'khu-biet-thu', ',khu-biet-thu,', 0, ',61,', 0, 1, 33, NULL, NULL, 61, 'lands', 'fs_lands_categories', '2016-01-08 12:04:08', '2016-01-08 12:04:08', 0),
(101, 'Căn hộ - Chung cư', 'can-ho-chung-cu', ',can-ho-chung-cu,', 0, ',62,', 0, 1, 34, NULL, NULL, 62, 'lands', 'fs_lands_categories', '2016-01-08 12:04:22', '2016-01-08 12:04:22', 0),
(102, 'Cao ốc - Văn phòng', 'cao-oc-van-phong', ',cao-oc-van-phong,', 0, ',63,', 0, 1, 35, NULL, NULL, 63, 'lands', 'fs_lands_categories', '2016-01-08 12:04:42', '2016-01-08 12:04:42', 0),
(103, 'Khu trung tâm thương mại', 'khu-trung-tam-thuong-mai', ',khu-trung-tam-thuong-mai,', 0, ',64,', 0, 1, 36, NULL, NULL, 64, 'lands', 'fs_lands_categories', '2016-01-08 12:04:56', '2016-01-08 12:04:56', 0),
(104, 'Khu phức hợp', 'khu-phuc-hop', ',khu-phuc-hop,', 0, ',65,', 0, 1, 37, NULL, NULL, 65, 'lands', 'fs_lands_categories', '2016-01-08 12:05:12', '2016-01-08 12:05:12', 0),
(105, 'Khu du lịch - nghỉ dưỡng', 'khu-du-lich-nghi-duong', ',khu-du-lich-nghi-duong,', 0, ',66,', 0, 1, 38, NULL, NULL, 66, 'lands', 'fs_lands_categories', '2016-01-08 12:05:29', '2016-01-08 12:05:29', 0),
(106, 'Khu công nghiệp', 'khu-cong-nghiep', ',khu-cong-nghiep,', 0, ',67,', 0, 1, 39, NULL, NULL, 67, 'lands', 'fs_lands_categories', '2016-01-08 12:05:48', '2016-01-11 15:50:21', 0),
(107, 'Môi giới', 'moi-gioi', ',moi-gioi,khach-san,', 13, ',68,13,', 1, 1, 60, NULL, NULL, 68, 'lands', 'fs_lands_categories', '2015-12-17 10:20:35', '2015-12-17 10:20:35', 0),
(108, 'Dự án', 'du-an', ',du-an,khach-san,', 13, ',69,13,', 1, 1, 61, NULL, NULL, 69, 'lands', 'fs_lands_categories', '2015-12-17 10:20:44', '2015-12-17 10:20:44', 0),
(109, 'Tất cả', 'tat-ca', ',tat-ca,kho-xuong,', 14, ',70,14,', 1, 1, 62, NULL, NULL, 70, 'lands', 'fs_lands_categories', '2015-12-17 10:20:54', '2015-12-17 10:20:54', 0),
(110, 'Chính chủ', 'chinh-chu', ',chinh-chu,kho-xuong,', 14, ',71,14,', 1, 1, 63, NULL, NULL, 71, 'lands', 'fs_lands_categories', '2015-12-17 10:21:05', '2015-12-17 10:21:05', 0),
(111, 'Môi giới', 'moi-gioi', ',moi-gioi,kho-xuong,', 14, ',72,14,', 1, 1, 64, NULL, NULL, 72, 'lands', 'fs_lands_categories', '2015-12-17 10:21:15', '2015-12-17 10:21:15', 0),
(112, 'Dự án', 'du-an', ',du-an,kho-xuong,', 14, ',73,14,', 1, 1, 65, NULL, NULL, 73, 'lands', 'fs_lands_categories', '2015-12-17 10:21:23', '2015-12-17 10:21:23', 0),
(113, 'Tất cả', 'tat-ca', ',tat-ca,dat,', 15, ',74,15,', 1, 1, 66, NULL, NULL, 74, 'lands', 'fs_lands_categories', '2015-12-17 10:21:31', '2015-12-17 10:21:31', 0),
(114, 'Chính chủ', 'chinh-chu', ',chinh-chu,dat,', 15, ',75,15,', 1, 1, 67, NULL, NULL, 75, 'lands', 'fs_lands_categories', '2015-12-17 10:21:40', '2015-12-17 10:21:40', 0),
(115, 'Môi giới', 'moi-gioi', ',moi-gioi,dat,', 15, ',76,15,', 1, 1, 68, NULL, NULL, 76, 'lands', 'fs_lands_categories', '2015-12-17 10:21:49', '2015-12-17 10:21:49', 0),
(116, 'Dự án', 'du-an', ',du-an,dat,', 15, ',77,15,', 1, 1, 69, NULL, NULL, 77, 'lands', 'fs_lands_categories', '2015-12-17 10:21:58', '2015-12-17 10:21:58', 0),
(117, 'Tất cả', 'tat-ca', ',tat-ca,khac,', 16, ',78,16,', 1, 1, 70, NULL, NULL, 78, 'lands', 'fs_lands_categories', '2015-12-17 10:22:05', '2015-12-17 10:22:05', 0),
(118, 'Chính chủ', 'chinh-chu', ',chinh-chu,khac,', 16, ',79,16,', 1, 1, 71, NULL, NULL, 79, 'lands', 'fs_lands_categories', '2015-12-17 10:22:13', '2015-12-17 10:22:13', 0),
(119, 'Môi giới', 'moi-gioi', ',moi-gioi,khac,', 16, ',80,16,', 1, 1, 72, NULL, NULL, 80, 'lands', 'fs_lands_categories', '2015-12-17 10:22:22', '2015-12-17 10:22:22', 0),
(120, 'Dự án', 'du-an', ',du-an,khac,', 16, ',81,16,', 1, 1, 73, NULL, NULL, 81, 'lands', 'fs_lands_categories', '2015-12-17 10:22:30', '2015-12-17 10:22:30', 0),
(127, 'App dành cho website', 'app-danh-cho-website', ',app-danh-cho-website,', 0, ',2,', 0, 1, 2, NULL, NULL, 2, 'customers', 'fs_customers_categories', '2018-03-04 23:30:36', '2018-03-04 23:30:36', 0),
(128, 'App quản lý nội bộ', 'app-quan-ly-noi-bo', ',app-quan-ly-noi-bo,', 0, ',3,', 0, 1, 3, NULL, NULL, 3, 'customers', 'fs_customers_categories', '2018-03-04 23:30:50', '2018-03-04 23:30:50', 0),
(130, 'Make money', 'make-money', ',make-money,', 0, ',1,', 0, 1, 1, NULL, NULL, 1, 'news', 'fs_news_categories', '2022-04-24 02:32:38', '2022-04-24 02:32:38', 0),
(132, 'Trình độ công nghệ', 'trinh-do-cong-nghe', ',trinh-do-cong-nghe,', 0, ',1,', 0, 1, 1, NULL, NULL, 1, 'products', 'fs_products_categories', '2018-08-21 16:27:05', '2018-09-13 10:03:09', 0),
(133, 'Sản phẩm xi măng', 'san-pham-xi-mang', ',san-pham-xi-mang,', 0, ',4,', 0, 1, 4, NULL, NULL, 4, 'products', 'fs_products_categories', '2018-08-21 16:28:06', '2018-08-21 16:28:06', 0),
(134, 'Thông tin giới thiệu', 'gioi-thieu', ',gioi-thieu,', 0, ',1,', 0, 1, 1, NULL, NULL, 1, 'about', 'fs_about_categories', '2018-08-18 15:38:12', '2018-09-13 14:42:29', 0),
(135, 'Album ảnh', 'album-anh', ',album-anh,', 0, ',1,', 0, 1, 1, NULL, NULL, 1, 'album', 'fs_album_categories', '2018-08-27 12:01:31', '2018-08-27 12:01:31', 0),
(136, 'Dự án', 'du-an', ',du-an,', 0, ',2,', 0, 1, 2, NULL, NULL, 2, 'about', 'fs_about_categories', '2018-09-13 14:36:13', '2018-09-13 14:36:13', 0),
(137, 'Bản cáo bạch', 'ban-cao-bach', ',ban-cao-bach,', 0, ',3,', 0, 1, 3, NULL, NULL, 3, 'about', 'fs_about_categories', '2018-09-13 14:54:31', '2018-09-13 14:54:31', 0),
(138, 'Phân phối', 'phan-phoi', ',phan-phoi,', 0, ',4,', 0, 1, 4, NULL, NULL, 4, 'about', 'fs_about_categories', '2018-09-13 14:59:23', '2018-09-13 14:59:23', 0),
(139, 'Làm đẹp', 'lam-dep', ',lam-dep,', 0, ',4,', 0, 1, 4, NULL, NULL, 4, 'news', 'fs_news_categories', '2020-02-12 14:51:04', '2020-02-14 21:22:27', 0),
(140, 'Du lịch', 'du-lich', ',du-lich,', 0, ',5,', 0, 1, 5, NULL, NULL, 5, 'news', 'fs_news_categories', '2020-02-12 14:53:23', '2020-02-14 21:11:00', 0),
(141, 'Giải trí', 'giai-tri', ',giai-tri,', 0, ',6,', 0, 1, 6, NULL, NULL, 6, 'news', 'fs_news_categories', '2020-02-12 14:55:03', '2020-02-14 21:23:43', 0),
(142, 'Xe cộ', 'xe-co', ',xe-co,', 0, ',7,', 0, 1, 7, NULL, NULL, 7, 'news', 'fs_news_categories', '2020-02-12 14:56:37', '2020-02-14 21:16:51', 0),
(143, 'Kiến thức', 'kien-thuc', ',kien-thuc,', 0, ',8,', 0, 1, 9, NULL, NULL, 8, 'news', 'fs_news_categories', '2020-02-14 21:28:37', '2020-02-14 21:28:37', 0),
(144, 'Binance Smart Chain', 'binance-smart-chain', ',binance-smart-chain,', 0, ',2,', 0, 1, 1, NULL, NULL, 2, 'projects', 'fs_projects_categories', '2022-04-26 15:40:30', '2022-04-26 15:40:30', 0),
(145, 'Solana', 'solana', ',solana,', 0, ',3,', 0, 1, 2, NULL, NULL, 3, 'projects', 'fs_projects_categories', '2022-04-26 15:41:53', '2022-04-26 15:41:53', 0),
(146, 'Polygon', 'polygon', ',polygon,', 0, ',4,', 0, 1, 3, NULL, NULL, 4, 'projects', 'fs_projects_categories', '2022-04-26 15:42:28', '2022-04-26 15:42:28', 0),
(147, 'Play To Earn', 'play-to-earn', ',play-to-earn,', 0, ',5,', 0, 1, 4, NULL, NULL, 5, 'projects', 'fs_projects_categories', '2022-04-26 16:15:50', '2022-05-06 10:20:49', 0),
(148, 'Avalanche', 'avalanche', ',avalanche,', 0, ',6,', 0, 1, 5, NULL, NULL, 6, 'projects', 'fs_projects_categories', '2022-04-26 16:40:46', '2022-05-06 10:23:32', 0),
(149, 'Cardano', 'cardano', ',cardano,', 0, ',7,', 0, 1, 6, NULL, NULL, 7, 'projects', 'fs_projects_categories', '2022-05-06 10:23:48', '2022-05-06 10:24:48', 0),
(150, 'Terra', 'terra', ',terra,', 0, ',8,', 0, 1, 7, NULL, NULL, 8, 'projects', 'fs_projects_categories', '2022-05-06 10:25:10', '2022-05-06 10:25:10', 0),
(151, 'Fantom', 'fantom', ',fantom,', 0, ',9,', 0, 1, 8, NULL, NULL, 9, 'projects', 'fs_projects_categories', '2022-05-06 10:25:32', '2022-05-06 10:25:32', 0),
(152, 'Celo', 'celo', ',celo,', 0, ',10,', 0, 1, 9, NULL, NULL, 10, 'projects', 'fs_projects_categories', '2022-05-06 10:25:47', '2022-05-06 10:25:47', 0),
(153, 'Near', 'near', ',near,', 0, ',11,', 0, 1, 10, NULL, NULL, 11, 'projects', 'fs_projects_categories', '2022-05-06 10:26:01', '2022-05-06 10:26:01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fs_statics`
--

CREATE TABLE `fs_statics` (
  `id` int(11) NOT NULL,
  `summary` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `category_alias` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_id_wrapper` varchar(255) DEFAULT NULL,
  `category_alias_wrapper` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `source_website` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `editor` varchar(255) DEFAULT NULL,
  `show_in_homepage` tinyint(4) DEFAULT NULL,
  `hits` int(11) NOT NULL DEFAULT 0,
  `published` tinyint(4) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `title_display` varchar(255) DEFAULT NULL,
  `display_title` tinyint(4) NOT NULL DEFAULT 1,
  `display_column` int(11) NOT NULL,
  `tags_group` int(11) DEFAULT NULL,
  `rating_count` int(11) NOT NULL,
  `rating_sum` int(11) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `hot` tinyint(4) DEFAULT 0,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keyword` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_statics`
--

INSERT INTO `fs_statics` (`id`, `summary`, `content`, `tags`, `category_id`, `category_alias`, `category_name`, `category_id_wrapper`, `category_alias_wrapper`, `title`, `alias`, `image`, `creator`, `source_website`, `created_time`, `updated_time`, `editor`, `show_in_homepage`, `hits`, `published`, `ordering`, `title_display`, `display_title`, `display_column`, `tags_group`, `rating_count`, `rating_sum`, `keywords`, `hot`, `seo_title`, `seo_keyword`, `seo_description`) VALUES
(1, 'Mọi dịch vụ thiết kế App của chúng tôi đều được bảo trì dài hạn, uy tín và cam kết tới tất cả mọi khách hàng', '', NULL, 1, 'gioi-thieu', 'Giới thiệu', ',1,', ',gioi-thieu,', 'Bảo trì dài hạn', 'bao-tri-dai-han', 'images/statics/2018/02/21/original/bao-tri-dai-han-1519232336.png', NULL, NULL, '2018-02-21 23:58:56', '2018-02-22 00:23:33', NULL, NULL, 0, 1, 1, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', ''),
(2, 'Với nhiều kỹ sư IT và chuyên viên đồ họa kinh nghiệm lâu năm đem lại sản phẩm tối ưu và giải pháp hoàn thiện nhất.', '', NULL, 1, 'gioi-thieu', 'Giới thiệu', ',1,', ',gioi-thieu,', 'Dịch vụ chuyên nghiệp', 'dich-vu-chuyen-nghiep', 'images/statics/2018/02/22/original/dich-vu-chuyen-nghiep-1519232855.png', NULL, NULL, '2018-02-22 00:07:35', '2018-02-22 00:23:36', NULL, NULL, 0, 1, 2, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', ''),
(3, 'Finalstyle cung cấp dịch vụ thiết kế App theo yêu cầu riêng cho từng đối tượng khách hàng, lĩnh vực khác nhau.', '', NULL, 1, 'gioi-thieu', 'Giới thiệu', ',1,', ',gioi-thieu,', 'Thiết kế riêng biệt', 'thiet-ke-rieng-biet', 'images/statics/2018/02/22/original/thiet-ke-rieng-biet-1519232980.png', NULL, NULL, '2018-02-22 00:09:40', '2018-02-22 00:23:39', NULL, NULL, 0, 1, 3, NULL, 1, 0, NULL, 0, 0, '', 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `fs_statics_categories`
--

CREATE TABLE `fs_statics_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `alias_wrapper` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `list_parents` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `published` tinyint(4) NOT NULL DEFAULT 1,
  `ordering` int(11) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `show_in_homepage` tinyint(4) NOT NULL DEFAULT 1,
  `estore_id` int(11) DEFAULT NULL,
  `display_title` tinyint(4) NOT NULL DEFAULT 1,
  `display_tags` tinyint(4) NOT NULL DEFAULT 1,
  `display_related` tinyint(4) NOT NULL DEFAULT 1,
  `display_created_time` tinyint(4) NOT NULL DEFAULT 1,
  `display_category` tinyint(4) NOT NULL DEFAULT 1,
  `display_comment` tinyint(4) NOT NULL DEFAULT 1,
  `display_sharing` tinyint(4) NOT NULL DEFAULT 1,
  `name_display` varchar(255) NOT NULL,
  `is_comment` tinyint(4) NOT NULL,
  `notice` tinyint(4) DEFAULT 0 COMMENT 'Danh mục tin thông báo',
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keyword` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `lang` varchar(255) DEFAULT 'vi'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_statics_categories`
--

INSERT INTO `fs_statics_categories` (`id`, `name`, `alias`, `category_id`, `alias_wrapper`, `parent_id`, `list_parents`, `level`, `published`, `ordering`, `image`, `icon`, `created_time`, `updated_time`, `show_in_homepage`, `estore_id`, `display_title`, `display_tags`, `display_related`, `display_created_time`, `display_category`, `display_comment`, `display_sharing`, `name_display`, `is_comment`, `notice`, `seo_title`, `seo_keyword`, `seo_description`, `lang`) VALUES
(1, 'Giới thiệu', 'gioi-thieu', NULL, ',gioi-thieu,', 0, ',1,', 0, 1, 1, NULL, NULL, '2018-02-21 23:38:36', '2018-02-21 23:38:36', 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, '', '', '', 'vi');

-- --------------------------------------------------------

--
-- Table structure for table `fs_stories`
--

CREATE TABLE `fs_stories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `category_alias` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_id_wrapper` varchar(255) DEFAULT NULL,
  `category_alias_wrapper` varchar(255) DEFAULT NULL,
  `category_icon` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `source_website` varchar(255) DEFAULT NULL,
  `new_date` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `editor` varchar(255) DEFAULT NULL,
  `show_in_homepage` tinyint(4) DEFAULT NULL,
  `hits` int(11) NOT NULL DEFAULT 0,
  `published` tinyint(4) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `title_display` varchar(255) DEFAULT NULL,
  `display_title` tinyint(4) NOT NULL DEFAULT 1,
  `display_column` int(11) NOT NULL,
  `tags_group` int(11) DEFAULT NULL,
  `rating_count` int(11) NOT NULL,
  `rating_sum` int(11) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `hot` tinyint(4) DEFAULT 0,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keyword` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `lang` varchar(255) DEFAULT 'vi',
  `source` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_stories`
--

INSERT INTO `fs_stories` (`id`, `title`, `summary`, `content`, `image`, `tags`, `category_id`, `category_alias`, `category_name`, `category_id_wrapper`, `category_alias_wrapper`, `category_icon`, `alias`, `creator`, `source_website`, `new_date`, `created_time`, `updated_time`, `editor`, `show_in_homepage`, `hits`, `published`, `ordering`, `title_display`, `display_title`, `display_column`, `tags_group`, `rating_count`, `rating_sum`, `keywords`, `hot`, `seo_title`, `seo_keyword`, `seo_description`, `lang`, `source`) VALUES
(1, 'Phép thử', 'Quán cũ, bàn cũ, bản nhạc cũ... Hai đen đá không đường...Tất cả đều như trước, duy chỉ có mối quan hệ của họ giờ đã khác. Cách đây hai năm, cũng tại nơi này họ đã chia tay nhau sau nhiều năm gắn bó.', '\r\n        	<p><strong>Quán cũ, bàn cũ, bản nhạc cũ... Hai đen đá không đường...Tất cả đều như trước, duy chỉ có mối quan hệ của họ giờ đã khác. Cách đây hai năm, cũng tại nơi này họ đã chia tay nhau sau nhiều năm gắn bó.</strong></p>\r\n<p>&nbsp;</p>\r\n\r\n\r\n\r\n\r\n\r\n			<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/thinking-of-you1-1024x640.jpg\"  /></p>\r\n<p><br /> Khuấy nhẹ li cà phê, anh đẩy nó về phía nàng:<br /> <br /> - Em ổn chứ?<br /> <br /> Nàng lơ đãng nghe nhạc, giật mình ngoảng lại. Anh nhắc lại câu hỏi:</p>\r\n\r\n\r\n<p>&nbsp;</p>         ', 'images/stories/2020/08/original/phep-thu.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'phep-thu', NULL, NULL, NULL, '2020-08-20 00:38:38', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/182-phep-thu.html'),
(2, 'Chai sữa tắm hết date', 'Cô muốn bù đắp cho chàng trai mồ côi mẹ từ nhỏ tình yêu từ thân xác người con gái, để rồi một ngày anh sợ khi nhận ra mình biết rõ cái áo nào của cô có bao nhiêu cúc, rằng anh rất khéo khi cởi chiếc áo trong của cô ra, ...', '\r\n        	<p><strong>Cô muốn bù đắp cho chàng trai mồ côi mẹ từ nhỏ tình yêu từ thân xác người con gái, để rồi một ngày anh sợ khi nhận ra mình biết rõ cái áo nào của cô có bao nhiêu cúc, rằng anh rất khéo khi cởi chiếc áo trong của cô ra, ...</strong></p>\r\n<p >&nbsp;***</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/tam.jpg\" /></p>\r\n<p>Mùa thu Hà Nội đến với gió heo may ôm chầm mái ngói những ngôi nhà cổ. Hương của gió ngọt nhẹ đưa tâm hồn cô phiêu diêu khắp nơi. Cô yêu những chiều đi dạo quanh hồ Hoàn Kiếm, yêu hàng liễu rủ yểu điệu và thanh thanh, và cũng từ nơi ấy, cô yêu anh.</p>\r\n<p>Cô xả nước khắp người. Nước ấm. Cảm thấy thoải mái từ khi những tia nước đầu tiên chạm vào da thịt. Vớ lấy cái bông tắm, cô đổ sữa tắm ra. Bỗng nhìn cái hạn sử dụng chai sữa tắm: best before: 211207. “ Mẹ kiếp! Hết hạn những 3 tháng rồi!”, cô chép miệng, rủa thầm cái mụ bán chai sữa tắm, đon đả u u con con, hóa ra cũng là mụ lừa đảo.&nbsp;</p>\r\n<p>Bực mình, cô vứt cái bông tắm đã ướt vào gương, nhìn dòng nước chảy trên mặt gương, đột nhiên một tia chớp loáng trong đầu, 21 tháng 12 năm 2007, cô chia tay anh.<br /> <br /> Mùa thu Hà Nội đến với gió heo may ôm chầm mái ngói những ngôi nhà cổ. Hương của gió ngọt nhẹ đưa tâm hồn cô phiêu diêu khắp nơi. Cô yêu những chiều đi dạo quanh hồ Hoàn Kiếm, yêu hàng liễu rủ yểu điệu và thanh thanh, và cũng từ nơi ấy, cô yêu anh. Anh tò mò muốn xem cái mặt dây chuyền hình cánh hoa thủy tiên của một cô gái xa lạ, cô rất bạo dạn khi đồng‎ ý tháo chiếc dây chuyền của mình ra cho một người xa lạ xem chỉ vì cô thấy anh ta thực sự thích nó.</p>\r\n<p>Lúc tháo nó ra, cô vô tình làm rơi sợi dây chuyền xuống đất. Mặc chiếc áo cổ rộng, cô cúi xuống nhặt. Nét thanh xuân vô tình bị anh nhìn thấy qua mảnh áo phập phồng. Từ lúc đó, họ yêu nhau. Từ lúc đó, họ thuộc về nhau. Từ hôm đó, anh có thể được phép xem mặt dây chuyền ngay trên cổ cô. Từ hôm đó, từ chiếc cổ ấy, anh có quyền được nhìn xuống dưới nữa…<br /> <br /> Nhặt bông tắm lên, cô chợt lấy chai sữa tắm đổ ra, đúng là sữa tắm hết date, đặc cả vào!</p>\r\n<p>Nhạt nhẽo. Như cái mối tình mới chấm dứt 3 tháng trước đây của cô. Nhưng cô nhận ra rằng mùi của nó vẫn rất đậm, rất thơm. Chà bông tắm lên người, cô vẫn cảm nhận được mùi kiêu sa của nó. Cuộc tình của họ đẹp và lãng mạn. Cô thích e ấp bên người yêu mình mỗi tối cuối tuần, nắm tay, dạo phố. Sao bàn tay em bé thế? Để che vừa khuôn mặt bé nhỏ của em.</p>\r\n<p>------------------------</p>\r\n<p><em>Sao ngón tay nhỏ thế? </em></p>\r\n<p><em>Để sau này anh bớt tiền mua nhẫn kim cương to cho em. </em></p>\r\n<p><em>Sao tay em bị chai nhiều thế? </em></p>\r\n\r\n\r\n\r\n\r\n\r\n			<p><em>À, bởi vì… anh ơi mình cùng đếm cánh hoa sữa nhé! </em></p>\r\n<p><em>Để làm gì hả em? </em></p>\r\n<p><em>Trên đời có bao nhiêu cánh hoa sữa, là em yêu anh bấy nhiêu năm. </em></p>\r\n<p><em>Uh, mình cùng đếm em nhé. 1 này, 2 anh ạ, 3, 4…2112 rồi em ạ. </em></p>\r\n<p><em>Em muốn ngủ! </em></p>\r\n<p><em>Uh, em ngả đầu vào anh mà ngủ. Ngủ ngon trong lòng anh nhé!</em></p>\r\n<p>------------------</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/wallpaper-holiday-1-truyenn.jpg\" /></p>\r\n<p><br /> <br /> Trời tháng ba hôm nay có nắng. Nắng vàng ruộm như nắng mùa thu. Cô nghe thấy tiếng xe cộ tấp nập ngoài đường, tiếng chim hót rộn rang, tiếng nhạc dịu dịu của quán Trà Hoa gần nhà. Anh cũng là một thanh âm trong bản hòa ca của cô. Anh luôn là tia sáng lấp lánh của thời con gái lãng mạn say mê. Yêu hết mình. Nhưng ngu ngốc.</p>\r\n<p>Cô muốn bù đắp cho chàng trai mồ côi mẹ từ nhỏ tình yêu từ thân xác người con gái.&nbsp;Để rồi, một ngày anh sợ khi nhận ra mình biết rõ cái áo nào của cô có bao nhiêu cúc, khi nhận ra rằng anh rất khéo khi cởi chiếc áo trong của cô ra, khi nhận ra rằng anh si mê cô hơn tất cả mọi thứ trên đời, khi nhận ra rằng anh đã uống cạn mạch máu thanh xuân của cô. Anh nợ cô mọi thứ trên đời. Như 2112 cánh hoa sữa nồng nàn…</p>\r\n<p>Cô vặn vòi để thêm nước ấm lên người. Tiếng nước như đang trò chuyện cùng cái chai sữa tắm hết hạn sử dụng rất vô duyên kia. Soi mình trong gương, trần trụi và xơ xác như muôn thuở xa xôi, cô muốn đập tan cái gương nhờ nhờ hơi nước phòng tắm kia, cố hét lên bằng ‎ý chí của một bông hoa sữa đã hết mùi nhưng thanh âm chẳng lọt qua được khí quản. Cô cảm thấy những mạch máu đang chảy hỗn loạn trong cơ thể mình, như hàng loạt xe cộ tắc vào giờ tan tầm, chúng cũng ích kỷ muốn len lỏi tìm chỗ trống cho mình lách ra khỏi đám đông, để cố giấu đi tình yêu vụng dại của cô với anh.</p>\r\n<p>Cô nhớ anh đến cồn cào…Với em, yêu là cho tất cả. Mà anh cũng thấy đó, em đã cho, cho hết! Anh xin lỗi, tại anh rạo rực khi thấy em. Rạo rực muốn nhìn. Rạo rực muốn cảm nhận. Rạo rực cháy. Và rồi, em rạo rực tan đi. Em sao? Đúng, em tan vào anh rồi, và anh không cầm được nữa. Đồ khốn nạn! Cút đi! Và anh đi như tiếng hét trong bãi cỏ hoang dài hun hút. Cỏ mọc cao như để dìm chết ánh nhìn dõi theo sẽ giết chết cô trong mê mệt ngẩn ngơt.</p>\r\n<p>Đột nhiên, cô đổ thêm sữa ra cái bông tắm, chà mạnh đến ửng đỏ như trái hồng vào rằm tháng 8. Cô quyết định sẽ tắm hết chai sữa trong ngày hôm nay. Cứ chà lên người, dội nước sạch, lại chà bông tắm có sữa. Cứ thế, cứ thế! Cô không muốn phải tắm chai sữa ấy thêm một ngày nào nữa. Nhưng lại không muốn vứt nó đi.</p>\r\n<p>Giá như em chịu tin rằng mình bé dại. Giá như em cứ mãi ngủ vùi trong lòng anh chứ không phải ngược lại. Giá như em chịu nắm chặt bàn tay anh, để nó không tự do lướt những phím đàn trên con người em.</p>\r\n<p>Giá như anh đừng đi, tháng ba không anh, em lạnh lắm! Em rệu rã trong căn lò sưởi cô đơn mà khói chẳng hun đủ lòng. Tháng ba về Hà Nội chỉ có hoa sưa trắng muốt và thanh khiết. Không có những bông hoa sữa mùa thu ngọt lịm. Em không muốn anh đi. Cũng như em muốn đổi tên hoa xưa là hoa Sữa. Nhưng em chẳng thể.</p>\r\n<p>Em chới với nắm những thứ đã không thuộc về mình, như cô bé 5 tuổi nhón chân mà muốn hái trái cành cao nhất. Em ngã, ngất lịm…</p>\r\n<p>--------------------------</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/210111010-lu-rut.jpg\" /></p>\r\n<p><br /> Bệnh viện Việt Đức. Các bác sĩ đang chuẩn bị cho một ca đứt mạch máu não sau khi người nhà đã vay mượn khắp nơi đủ tiền.</p>\r\n<p>Mấy chục triệu, chả đơn giản với một bà mẹ hơn 40 mà người ta tưởng là đã 60 tuổi rồi. Bà làm nghề bán cháo trai buổi sáng. Vất vả mấy chục năm trời cũng nuôi được cô con gái mà bà mang tiếng chửa hoang đỗ Đại học. Thế mà chẳng biết kiếp trước bà ăn ở thế nào, cô con gái bà lại bị tai biến mạch máu não khi mới bước sang tuổi 20.<br /> <br /> Không cứu được cô gái, bà mẹ chết lặng, không khóc.</p>\r\n<p>Một buổi chiều tháng ba trời mưa tầm tã.</p>\r\n<p>Bà đi trong hoang hoải, những bông hoa bướm trồng ngoài đường sũng sượi ướt.</p>\r\n<p>Cuộc đời có độc ác với bà quá không?</p>\r\n<p><strong>Bất tận trong những bước chân ấy, có một người con trai ủ ê trong men tình đầu giúp bà lo hậu sự cho cô con gái.</strong></p>\r\n\r\n\r\n\r\n					\r\n\r\n		<p><strong>Chàng đặt lên mộ cô 2012 cánh hoa cúc vạn thọ. </strong></p>\r\n<p><strong>Ngày 20 tháng 12, mình chưa chia tay em nhỉ?</strong></p>\r\n<p><strong>Anh sống cuộc đời từ ngày ấy về trước thôi… </strong></p>         ', 'images/stories/2020/08/original/chai-sua-tam-het-date.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'chai-sua-tam-het-date', NULL, NULL, NULL, '2020-08-20 00:38:40', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/178-chai-sua-tam-het-date.html'),
(3, 'Người có muốn nghe về những hoang mang?', 'Tháng mười hai tràn về trong em cùng nỗi nhớ anh vô tận. Tuyết rơi dày nơi xứ người lạnh lẽo. Hơi lạnh cuộn tròn vào người em lim dim mắt, tìm chút hơi ấm còn sót lại mà biết đâu rằng trong em cũng lạnh lẽo từng giờ. Bất giác, em thèm lắm cảm giác được anh ôm thật chặt, được vòng tay anh ủ ấm trong những đêm thâu.', '\r\n        	<p><strong>Tháng mười hai tràn về trong em cùng nỗi nhớ anh vô tận. Tuyết rơi dày nơi xứ người lạnh lẽo. Hơi lạnh cuộn tròn vào người em lim dim mắt, tìm chút hơi ấm còn sót lại mà biết đâu rằng trong em cũng lạnh lẽo từng giờ. Bất giác, em thèm lắm cảm giác được anh ôm thật chặt, được vòng tay anh ủ ấm trong những đêm thâu.</strong></p>\r\n<p>Quán cà phê cũ xưa chìm trong tuyết lạnh. Đôi lần, em nghiêng đầu áp mặt vào ô cửa kính, im lặng lắng nghe. Chẳng gì cả anh ạ, ngoài những âm thanh ù ù khàn đục. Tuyết rơi không kêu thành tiếng. Em nhớ tiếng mưa, nhớ tiếng lộp độp của mưa khi chạm vào chiếc ô nhỏ bé. Cũng vì chiếc ô nhỏ bé ấy, mà em thấy anh gần em hơn đôi chút, mà em thấy người em nóng bừng lên thêm đôi chút, mà khiến em mất ngủ cả đêm dài. Nhưng đó sẽ chỉ là bí mật của riêng em thôi. Nếu biết, chắc anh sẽ cười xòa chê em ngốc.</p>\r\n<p>Em đưa tay khuấy đều cốc đen đá đã dần nhạt vị. Ở đâu đó vang lên một bản nhạc không lời. Chàng nhạc công trẻ mỗi khi thấy em đều đệm đàn bài đó. Em gọi đó là bản nhạc cho em, anh ạ. Là bản nhạc của em.</p>\r\n<p>Xa anh, em bắt đầu tập quen dần với cái đắng ngắt của cà phê đen. Ngày xưa em chỉ dùng bạc sỉu, anh chê em không biết thưởng thức cà phê. Giờ thì em đã hiểu vì sao anh lại thích cà phê đen như thế. Vì trong đắng có ngọt, ngọt nơi đầu môi chóp lưỡi, rồi đắng ngắt đến tận bên trong.</p>\r\n<p>Em hay có thói quen đưa tay di từng đường trên lớp kính lạnh mờ hơi nước. Một hình trái tim be bé. Một hình trái tim khuất ngay sau. Và một chiếc mũi tên đâm qua rất nhẹ. Thần tình ái cũng thật trêu ngươi, anh nhỉ? Muốn dính hai trái tim lại với nhau lại phải dùng đến mũi tên làm rỉ máu. Em đôi lần hỏi thần rằng sao không lấy băng keo dán tim em lại với tim anh? Thần mỉm cười và bảo, băng keo sẽ làm tim em rớt khỏi tim anh mấy hồi. Em bơ vơ lạc lõng, chẳng biết tìm đâu cho mình một câu trả lời.</p>\r\n<p>&nbsp;</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/1344844774-hinh2.jpg\"  /></p>\r\n<p>&nbsp;</p>\r\n<p><em>Này anh, nếu được chọn, anh sẽ chọn để con tim ta cùng rỉ máu và dính chặt vào nhau? Hay thả nhau ra cho con tim nhau nguyên vẹn?</em></p>\r\n<p>Đôi lần, anh ạ, khi lang thang trên những con phố vắng, em lại nhớ đến anh. Nhớ con đường Việt Nam sực mùi hoa sữa, nhớ đôi bàn tay ấm siết chặt em giữa phố đông người, nhớ nụ hôn vội vàng và vụng dại trước hiên nhà khi “giờ giới nghiêm” của em vừa điểm. Để rồi, giờ đây trong em chỉ còn lại mùi tuyết đang tan, chỉ còn lại cái rét đến cắt da thịt mà thèm biết bao một bàn tay ấm áp, chỉ còn lại nỗi hụt hẫng chơi vơi khi đứng trước cửa nhà lạnh lẽo chẳng một bóng người.</p>\r\n<p>Khi chạm tay vào cánh cửa sắt lạnh đến buốt da, em chợt thấy hận anh vô hạn. Hận anh sao làm rỉ máu trái tim em rồi lại buông ra, để vết thương không bao giờ lành lặn? Sao từ đầu không để cho em một lối đi riêng? Đâm em vào mũi tên của thần tình ái làm chi, để giờ đây lạnh lùng quay bước?</p>\r\n<p>Em đau, còn anh thì sao?</p>\r\n<p>Vết thương trên tim anh rồi sẽ ra sao? Máu cũng chảy dài từng giọt như em? Hay rồi một trái tim khác sẽ được móc vào? Vết thương chưa lành ấy, mũi tên khác của thần cupid sẽ xoa dịu lại, phải không anh?</p>\r\n<p>Cánh cửa sắt nhẹ nhàng đưa đẩy. Trong giây lát, em đã tưởng lệ sẽ hóa thành băng.</p>\r\n<p>Người ta bảo giọt nước mắt đầu tiên của con gái là kim cương, giọt nước mắt thứ hai sẽ là pha lê. Nhưng từ giọt nước mắt thứ ba trở đi thì cũng chỉ như bao giọt nước mắt khác mà thôi.</p>\r\n<p>Anh bảo thế thì em đã làm rớt kim cương và pha lê khi lọt lòng mẹ rồi. Không đâu anh, thực ra giọt nước mắt của con gái chẳng là kim cương hay pha lê gì cả, chỉ đơn giản là nước mắt thôi, vô giá và vô giá trị. Nó vốn là thứ chẳng ai thiếu, nhưng mất đi rồi, sẽ chẳng nhặt lại được đâu.</p>\r\n\r\n\r\n\r\n\r\n\r\n			<p>Đôi lần em tự hỏi, Việt Nam giờ này có lạnh lắm chăng? Cô bạn cùng phòng của em đôi lần ôm lấy em vỗ về. Em đáng thương đến thế sao anh? Cô ấy bảo em hãy quên anh đi. Nhưng quên thế nào được, hả anh? Có lẽ em là một con bé ngốc nghếch khi cứ ngỡ chia tay chỉ mỗi mình anh đau. Vì em là đứa con gái mạnh mẽ nhất thế gian, nên cứ ngỡ chỉ có anh buồn, chứ em thì chẳng buồn tẹo nào đâu.</p>\r\n<p>Thế mà giờ này em lại chìm trong nỗi nhớ anh quằn quại. Em không đau đâu anh, chỉ là nhớ quay nhớ quắt. Không lạnh đâu anh, chỉ là thèm lắm một vòng tay.</p>\r\n<p>Em với tay lấy điện thoại bấm tin nhắn gởi cho anh. Giờ này Việt Nam chắc có mưa anh nhỉ? Không có em, anh có quên mặc ấm không anh? Không có em, còn ai chăm anh mỗi khi anh ho cảm lạnh không anh? Không có em, còn ai cho anh siết trong vòng tay thật chặt không anh?</p>\r\n<p>Cô bạn cùng phòng nhìn em nhắn tin cho anh mà bất giác thở dài. Não nề quá anh nhỉ? Ừ, mình chia tay rồi mà, sao em cứ bấu víu hoài những kỷ niệm? Sao không để tình yêu anh trao em còn mãi mãi và vẹn toàn? Có lẽ, cô ấy bảo em thật ngốc. Níu kéo làm gì chút kỉ niệm đã qua?</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/1315753069-55312179-1279097994-hoang-mang-2.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>Tin nhắn gởi đi trong vô vọng. Anh không thèm đáp trả. Là vì… chia tay rồi sao anh? Em cất điện thoại, cuộn tròn mình trong chiếc chăn bông ấm áp. Thèm lắm… một vòng tay…</p>\r\n<p>Sáng nay, em lại đến quán cà phê xưa cũ và tìm một li đen đá. Người nhạc công lại đệm lên bản nhạc không lời xưa cũ. Bản nhạc dành riêng cho em. Cũng đã hai năm rồi đó anh, từ ngày ta chia tay nhau ấy. Em vẫn đều đặn đến quán dăm ba lần mỗi tháng. Và ở nơi đây, em thấy mình như rơi trong vô cực. Rơi mãi không ngừng…</p>\r\n<p><em>Nếu như em có thể chạm vào vô cực, liệu tháng mười ba có chờ em ở đó không anh?</em></p>\r\n<p>Bản nhạc ngưng lên bất chợt. Gió đông khẽ lùa vào làm chiếc chuông gió đung đưa từng nhịp. Âm thanh của chiếc chuông gió gỗ phát ra trầm buồn đến kỳ lạ. Em đưa tay lục tìm tấm ảnh cuối cùng em còn giữ của anh, vuốt lên khuôn mặt anh nhè nhẹ. Việt Nam giờ này lạnh lắm không anh?...</p>\r\n<p>Chàng nhạc công tiến lại gần, nở nụ cười thuần thục. Anh ta hỏi, em đã quên anh chưa. Em cười buồn. Biết nói sao được hả anh? Làm sao em có thể quên anh khi vết thương anh gây ra cho em ngày ấy vẫn chưa lành sẹo? Và làm sao để em quên anh khi những giọt lệ nơi khóe mắt em lúc nào cũng chực hóa thành băng?</p>\r\n<p>Chàng ta đưa cho em một chiếc phong bì nhỏ. Chàng trai ấy bảo đó là của anh gởi lại, một ngày nọ lúc em có thể bình tâm.</p>\r\n<p >&nbsp;</p>\r\n<p ><em>Một trăm năm nữa,hẹn gặp lại em ở tháng mười ba xưa cũ</em></p>\r\n<p >.</p>\r\n<p ><em>Tháng mười ba</em></p>\r\n<p ><em>.</em></p>\r\n<p ><em>Của em và của anh</em></p>\r\n<p >…</p>\r\n<p>Việt Nam những ngày này mưa nhiều lắm anh ơi. Con đường đến nhà anh gập ghềnh và lênh đênh những nước. Bao lâu rồi em mới đến gặp anh từ sau lần mình chia tay nhau anh nhỉ? Em không phải lúc nào cũng ngu ngơ ngỡ rằng anh đang tay trong tay với một cô gái khác đâu anh. Chỉ là đôi khi nhớ anh, em hoang mang muốn khóc. Nếu như anh đang đắm say cùng một ai đó khác, hẳn em cũng an lòng…</p>\r\n<p>Hai năm rồi, sao anh vẫn chẳng hề thay đổi? Vẫn ấm áp như ngày xưa ấy. Anh đừng hỏi tại sao em không khóc. Không phải vì em đã khóc quá nhiều, cũng chẳng phải tại em trọi trơ cảm xúc. Đơn giản là vì, chỉ đôi lần, rất ít thôi, em mới chông chênh và bật khóc.</p>\r\n<p>&nbsp;</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/truyenngan-hoangmang.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>Anh biết đấy, em là con gái cung Thiên Bình mà. Con gái cung Thiên Bình rất giỏi cân bằng cảm xúc, cho dẫu quá trình cảm xúc từ lúc lung lay đến khi đứng yên là cả một quá trình dài. Nhưng không sao đâu anh, rồi em sẽ ổn cả thôi. Em sẽ phải tiếp tục sống, thật vững chãi, để bước tiếp cả bước chân dài của anh, để sống tiếp cuộc sống còn dài của anh.</p>\r\n<p>Chàng nhạc công trẻ đưa tay kéo nhẹ chiếc vĩ cầm, tạo nên những nốt nhạc buồn. Sao em không nhận ra em trai của anh giống anh đến thế? Đôi mắt chàng nhạc công trẻ vẫn cứ bình thường, trầm lặng. Nhưng trong khoảnh khắc xoáy sâu vào đôi mắt ấy, em tựa hồ thấy được nỗi cô đơn và xáo rỗng của cả tâm hồn. Đó có phải là sự đồng điệu không anh? Sự đồng điệu khi phải chấp nhận sự thật mất đi người mình thân yêu nhất, như thể chuyện đó xảy ra chỉ vừa mới hôm qua.</p>\r\n<p>Anh biết em mạnh mẽ đến nhường nào, phải không? Mạnh mẽ quên anh, mạnh mẽ sống. Anh biết đó, đôi khi em mạnh mẽ trong vô vọng. Chỉ mỉm cười khi đứng cạnh anh thôi. Chỉ ôm anh và khao khát được anh ôm. Chưa bao giờ đòi hỏi một điểm tựa, và chưa bao giờ vững chãi để làm điểm tựa cho anh. Nhưng đôi lần trong cô đơn và lạc lõng thoáng qua, em vẫn muốn hỏi anh, câu hỏi của một thời xưa cũ mà đứa bé huênh hoang ngạo mạn là em chưa bao giờ dám hỏi…</p>\r\n<p><em>Này người, người có muốn nghe về những hoang mang?</em></p>\r\n<p>---</p>\r\n<p>&nbsp;</p>\r\n \r\n<p><strong><em>Lời tác giả: </em></strong><em>Cái đề là \"chôm chỉa\" từ nhật ký của một bà chị ==\' Và cái đống chữ loằn ngoằn mình viết dưới đây, mình cũng chả hiểu nó là của ai :| Căn bản là ghi trong lúc điên rồ và tâm trạng bất ổn định ==\' Ghi xong rồi còn không thèm xem lại và cũng chả hiểu mình vừa ghi cái gì luôn :|</em></p>\r\n\r\n\r\n\r\n					\r\n\r\n		<p><em>Thôi kệ vậy, bỏ vào đây mà ngắm nghía vài ngày ==\'</em></p>\r\n<p><em>Cái này, đề tặng một phần Phiêu Du là-của-em ^^</em></p>\r\n<p><em>Gởi tặng bà chị có cái NK bắt đầu bằng mấy dòng kia&nbsp;&nbsp;Cho dù câu đó hơm phải là của ss, thì vẫn là ss cho em cảm giác để viết bài này&nbsp;&nbsp;Nên, yêu ss lắm đó, biết không?&nbsp;</em></p>\r\n<p><em>Nhét thêm tên ông anh Bóng Đêm vào đây :| Vì sợ ông ấy ghét mà làm nổ tung cái máy tính nhà mình thì khổ&nbsp;</em></p>\r\n<p><em>Và, thân tặng bạn Clown ^^ Nhớ bạn, lại về ^^ Rồi sẽ lại đi ^^</em></p>        ', 'images/stories/2020/08/original/nguoi-co-muon-nghe-ve-nhung-hoang-mang.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'nguoi-co-muon-nghe-ve-nhung-hoang-mang', NULL, NULL, NULL, '2020-08-20 00:38:42', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/173-nguoi-co-muon-nghe-ve-nhung-hoang-mang.html'),
(4, 'Những hạt đậu', 'Biết gì không? Một đứa con gái quái dị như tao cũng cần được ai đó yêu thương lắm chứ? Nếu như 17 tuổi tao có mày để nắm tay, thì 18 tuổi – tao cũng cần được yêu thương ai đó', '\r\n        	<p><strong>Biết gì không? Một đứa con gái quái dị như tao cũng cần được ai đó yêu thương lắm chứ? Nếu như 17 tuổi tao có mày để nắm tay, thì 18 tuổi – tao cũng cần được yêu thương ai đó</strong></p>\r\n<p>----------------------------------</p>\r\n<p>Nhi có một gương mặt lạnh lùng cùng đôi mắt mí lót không thiện cảm cho lắm. Để che giấu thân hình quá mỏng manh, nó thường mặc nhiều lớp áo với những khối màu tối và u ám. Nhiều khi nó thầm cảm ơn ai đó vì đã phát minh ra túi áo và mắt kính. Nhờ có chúng, đôi bàn tay mới thôi không thừa thãi và đôi mắt sẽ dễ dàng che giấu sự cô độc sau lớp kính dày. Được đặt biệt danh là kẻ bất thường, thế giới xung quanh Nhi cũng bất thường biết bao. Như cái túi&nbsp;xách hình đinh tán nó tha đi khắp nơi, như những đôi giày boot kỳ quái nó luôn mang trong mọi thời tiết. Không ai có thể chơi với nó, ngoại trừ Đằng.</p>\r\n<p>Đằng sở hữu vẻ ngoài gầy guộc. Khi đi cùng cặp kính cận tròn to choán hết cả khuôn mặt, trông Đằng không khác gì Nobita phiên bản Xeko ốm yếu. Đằng có thói quen kỳ dị: Mua sổ và chất đầy nhà. Mỗi lần buồn buồn lại lấy ra hít hà và ngắm nghía. Một mảnh ghép hoàn hảo của Nhi, là người mà Nhi thường nói vui là “Cặp đôi hoàn cảnh”. Tụi nó đi với nhau từ những năm cấp 2, rồi lên cấp 3. Nhi cảm thấy may mắn vì có Đằng ở bên.&nbsp;</p>\r\n<p>Thật sự thì con người ta dù kỳ dị đến đâu cũng không thể thoát khỏi cảm giác cô đơn đến xám hồn mỗi khi ngồi thu lu một góc lớp trong giờ ra chơi, đứng một mình gần trụ bóng rổ khi mọi người đang xôn xao ở góc sân với những chàng trai đình đám, hoặc đơn giản chỉ là khi lên danh sách tham gia party cuối năm của lớp, nó như chưa bao giờ tồn tại. Để sót, quên hoặc không chú tâm luôn là lý do người ta đưa ra để bao che cho sự xa cách có chủ ý của mọi người . Cho nên Nhi luôn nhớ như in cái ngày Đằng xuất hiện từ cái xó xỉnh nào đó, bước tới bên nó và nói: “Sao lại đứng một mình vậy? Đi ăn không? Cantin mới có món chè đậu ngon tuyệt”.</p>\r\n<p>Tới tận sau này, Nhi mới thấy cực kỳ biết ơn giây phút đó, cái giây phút mà Nhi biết từ đây nó sẽ thôi một mình.Khi người ta lên cấp ba, bỗng nhiên có biết bao thay đổi. Về ngoại hình, lẫn tính tình. Trái ngược với vẻ lầm lì càng ngày càng được tô đậm, Đằng bỗng hóa dễ nhìn và thu hút. Trào lưu unisex lên ngôi, đôi chân khẳng khiu của cậu ta bỗng chốc vừa khít với những đôi skinny thời thượng. Theo đó, kiến thức và gu thời trang của Đằng bỗng tiến bộ vượt bậc. Khi đi trong sân trường, biết bao ánh mắt ngoái nhìn. Và vô tình, tình cảnh này khiến kẻ đồng hành bỗng chốc trở nên tội nghiệp.</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/uploaded/images/stories/2020/08/img-0215.PNG\"    /></p>\r\n<p>Đằng đã bao lần thử khoác lên người Nhi một đống quần áo và phụ kiện phong cách. Nhưng tuyệt nhiên, chúng bị chủ nhân lờ đi một cách mạnh bạo. Nhi vẫn trung thành với gam màu tối nặng nề của mình. Duy nhất một điều, khuôn mặt nó – như một phép màu – bỗng trở nên cá tính khủng khiếp. Nhất là đôi lông mi – giống như được dưỡng bằng một dung dịch thật kỳ nào đó – hóa dày và cong như tấm rèm kỳ diệu. Tất cả khiến mọi đường nét khuôn mặt bỗng hóa sắc sảo và đẹp lung linh.&nbsp;Đến cả Đằng, sau một đêm ngủ lại nhà Nhi, thì cũng đã phải thốt lên: “Mày ăn cái quái gì mà đẹp thế hả?” ngay trong buổi sáng thức giấc, quay qua và chạm phải gương mặt đang ngái ngủ ấy. Nhi làu bàu: “Chẳng ăn gì. Chỉ là tao đẹp thì đẹp, vậy thôi. Thật sai lầm khi một người đẹp như tao giờ đây còn nằm đây với mày”.</p>\r\n<p>- Này, thích thằng Phi A4 không? Cái thằng mà “Vạn người mê” ấy?</p>\r\n<p>- Mày nghĩ sao khi bên cạnh tao bây giờ cũng có một thằng “Khối người say” nằm đây mà tao lại phải đi kết đôi với cái thằng dấm dớ dở người có huyền thoại tè dầm khi đã 17 đó?</p>\r\n<p>- Hừm…đơn giản là bất cứ ai đó – khi ở tuổi 17 – đều cần có ai đó để thích hoặc nhớ thương.</p>\r\n<p>- Tao khác người từ khi 7 tuổi rồi Đằng à. Không cần chờ tới 17 đâu.</p>\r\n<p>- Này! – Đằng ngập ngừng, xoay hẳn người lại như vừa phát hiện ra một điều gì đó thú vị nhất quả đất – Có phải bây giờ chúng ta đã 17, nhưng chưa một lần nắm tay ai đó khác đúng không?</p>\r\n<p>- Đúng. Thì sao?</p>\r\n<p>- Mày lạnh lùng một cách đáng sợ, Nhi à.</p>\r\n\r\n\r\n\r\n\r\n\r\n			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nói rồi Đằng giơ tay ra, ôm ngang người Nhi và nắm chặt bàn tay của nó. Tay Nhi gầy guộc, da mỏng và nổi gân xanh. Không khó để có thể ôm trọn bàn tay ấy. Đằng siết nhẹ. Cái nắm tay sáng sớm khiến Nhi bất ngờ. Nhi nằm im, chợt nhớ về cái ngày tụi nó gặp nhau lần đâu, khẽ hỏi nhỏ: “Đằng này, mày nhớ cái ý nghĩ đầu tiên hiện ra trong đầu tao vào cái ngày mình gặp nhau lần đầu không? Tao đã nghĩ: Không thể chấp nhận cái việc có một đứa bạn không biết rằng mình không ăn được tất cả các loại chè đậu. Thế đấy”. Đằng cười. “Chỉ đơn giản là tao bỗng dưng muốn làm bạn với mày. Bất chấp tất”.</p>\r\n<p>Sau này khi họ lớn lên, đoạn hội thoại sáng tinh mơ hôm đó vẫn còn in dấu hằn. Không thể phai mờ.</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hết năm 11, khi cả hai lên 12, Phi “Vạn người mê” – vào một ngày đẹp trời – đã vô tình chớp được khoảnh khắc Nhi đứng tựa lan can và nhắm nghiền mắt (lý do thật sự cho cái hành động hết sức sến súa này cũng chẳng có gì to lớn cho cam: Đêm qua nó thức luyện phim tới 3 giờ sáng). Cậu ta giật mình nhận ra cô nàng im lặng và kỳ dị nhất trong lớp hóa ra cũng đẹp đấy chứ. Ít nhất là ở cô ta hiện lên vẻ gì đó thật tự tin và lôi cuốn. Kiểu như “Đây là thế giới của riêng tôi, rất khó để bước vào nhưng vào rồi thì sẽ chẳng muốn ra”. Và đúng là như thế – Phi muốn khám phá thế giới ấy.</p>\r\n<p>Rất nhanh chóng, cậu ta kết thân với Đằng, bất kể trước đó Phi không ưa Đằng tẹo nào. Đối với một thằng con trai mê thể thao, bóng rổ và đi tập gym hàng tuần, thì cái thân hình mỏng dính cùng những bộ đồ màu sắc lả lướt của Đằng luôn khiến Phi mắc nghẹn. Đằng không tỏ rõ thái độ nào trước sự thân thiết đến bất ngờ của Phi. Tỉnh bơ, hờ hững. Hỏi gì, trả lời nấy. Không khó để Phi có được số điện thoại và email của Nhi. Bằng sự ngạc nhiên bình thường nhất, Đằng hỏi lý do. Phi mỉm cười, vẻ tự tin và kiêu ngạo hiện rõ lên khuôn mặt: “Cô bạn Nhi của cậu nhìn thật hay. Có lẽ tớ nên đổi gu chút xíu”. Không ai nhận ra trong mắt Đằng như có lửa.</p>\r\n<p>- Này Nhi, hôm qua mày đi chơi với Phi hả? Vui không?</p>\r\n<p>- Vui.</p>\r\n<p>- Kể nghe.</p>\r\n<p>- Phi có não. Nói chuyện được. Phần nghe phần nhìn đều ổn.</p>\r\n<p>- Gì nữa?</p>\r\n<p>- Phi cũng không ăn được các thể loại đậu như tao. – Nhi bỗng quay qua và cười toe với Đằng – Nhiêu đó thôi cũng đủ làm tao sướng điên vì kiếm được đồng minh.</p>\r\n<p>- Tao nói với nó điều đấy chứ đâu.</p>\r\n<p>- Tao không quan tâm ai nói. Nhưng ít nhất Phi đã không rủ tao đi ăn chè đậu ngay trong lần đầu tiên gặp nhau như mày – Nhi thè lưỡi, vẻ xỉa xói hiện rõ.</p>\r\n<p>- Tại sao mày không gọi là “nó” thay vì “Phi” như những lúc bình thường mình bàn về cái thằng dở hơi nào đấy?</p>\r\n<p>Nhi đứng lại, nhíu mày: “Tao không biết. Nhưng có lẽ vì…Phi không phải thằng dở hơi”.</p>\r\n<p>Thời gian sau đó, Nhi bỗng nhiên thay đổi. Cười nhiều hơn. Khuôn mặt bớt u ám hơn. Và đi với Đằng ít hơn. Đôi ba lần, nó lạnh lùng thản nhiên hủy hẹn đi mua sổ với Đằng chỉ vì Phi hứng lên rủ nó đi chơi. Những lúc ấy, Đằng đi một mình và đứng rất lâu bên kệ sách bày vô vàn những cuốn sổ đầy màu sắc. Nó tự dưng không muốn mua nữa. Mọi đam mê bỗng nhiên tan biến. Nó chỉ còn biết đứng nhìn, lật ngắm và cất lại, cảm thấy buồn khủng khiếp. Như khi người ta đánh mất một thứ gì đó quý giá. Vô thức, nó lấy cây bút và ghi lên trang cuối của tất cả những cuốn sổ đẹp nhất ở tiệm lúc đó hai chữ Nhi Nhi. Lén lút. Ngắn gọn. Thân thương. Và suốt quãng đường về, Đằng không biết vì sao cậu lại hành động như vậy.</p>\r\n<p>&nbsp;Một tối nọ, Nhi và Đằng cãi nhau một trận tơi bời. Sau hơn 5 năm bên nhau, chưa bao giờ tụi nó gây nhau đến vậy. Đằng dám chắc chắn cái thằng hồi chiều nó gặp là Phi, cái thằng mà công khai ôm eo một con nhỏ tóc vàng đua đòi trong quán cà phê đó. Chuyện sẽ chẳng có gì lạ. Nếu như ngày hôm trước cậu ta không nói với Nhi rằng họ yêu nhau đi. Nếu như Đằng không chứng kiến cảnh Nhi cười mỉm rất lâu sau lời tỏ tình đó.</p>\r\n<p>Nếu như Nhi không phải là Nhi Nhi mà cậu quý mến. Và rõ ràng Phi là một thằng con trai tồi tệ. Những đứa con gái đang yêu – dù bình thường nó có thông minh đến kỳ dị như thế nào đi nữa – thì trong tình yêu vẫn ngốc nghếch như thường. Nhi không tin bất cứ lời nào Đằng nói. Nó bướng bỉnh và nói những lời cay nghiệt với Đằng. Vào giây phút Nhi quay đi, Đằng đã kéo tay nó lại và hỏi: “Vì cái gì vậy Nhi? Vì cái gì mà mày bỏ rơi tao suốt như thế?”.</p>\r\n<p>Nhi lặng đi sau câu hỏi đó. Một lát sau, nó khẽ khàng: “Biết gì không? Một đứa con gái quái dị như tao cũng cần được ai đó yêu thương lắm chứ? Phi bảo yêu quý tao, vì tao đặc biệt,. Chưa bao giờ tao được nghe những lời nói như vậy cả Đằng à. Nếu như 17 tuổi tao có mày để nắm tay, thì 18 tuổi – tao cũng cần được yêu thương ai đó”. Nói xong Nhi bước đi vội, chẳng thể nghe rõ trong cổ họng của chàng trai 18 lí nhí không thành tiếng câu nói: “Có tao đây mà”. Đằng đứng lặng. Dáng đứng gầy guộc in trên con đường mòn hoang hoải.</p>\r\n<p><img src=\"/uploaded/images/stories/2020/08/3759-3252311045811-1969235580-n.jpg\" alt=\"\"  /></p>\r\n<p>Tụi nó giận nhau lâu thật lâu. Đằng dường không thiết tha gì nữa ngoài việc nghĩ mãi về Nhi. Cậu nhanh chóng nhận ra, mình đã dành cho cô bạn kỳ dị ấy thứ tình cảm thật khác lạ. Nó không đơn thuần là tình bạn giữa hai kẻ cô đơn nữa. Như lúc này đây, mọi thứ về Nhi bỗng nhiên hiện rõ nét. Những cái áo khoác tối màu, làn mi dày, đôi boot cũ kỹ xộc xệch nhưng tuyệt đẹp, cả thói quen luôn cho tay vào túi áo phải nữa.</p>\r\n<p>Phát hiện đơn giản, nhưng đủ gây xúc động mạnh. Cậu thảng thốt nhận ra, ngay từ buổi sáng diệu kỳ ở nhà Nhi hôm đó, cái nắm tay ấy không đơn giản là một cái nắm tay của tình bạn. Biết bao tình cảm cậu đã gửi trao trong hành động đó, một cách vô thức. Tình yêu, tuổi trẻ, chân thành, đậm sâu. Cho nên cái không khí lạnh lùng và xa cách này khiến Đằng buồn bã không nguôi. Cậu rất muốn gặp Nhi và nói đơn giản: “Tao nhớ mày”. Đơn giản vậy thôi, mà sao khó khăn quá.</p>\r\n<p>Kỳ thi cuối cùng trải qua trong im lặng. Một buổi sáng đẹp trời, Nhi bỗng xuất hiện trước cửa nhà Đằng và rủ Đằng đi ăn. Một cách thản nhiên, như chưa có chuyện gì xảy ra. Nhi đề nghị đi ăn chè đậu. Lời đề nghị khiến Đằng đứng sững. “Có lẽ tao nên tập ăn đậu. Đậu tốt cho sức khỏe mà, đúng không?”. Đằng tức giận nghĩ thầm trong bụng: “Chứ không phải do thằng khốn đó đã nói rằng đậu tốt cho sức khỏe à?”.</p>\r\n<p>Nhưng cậu vẫn im lặng đi bên cạnh. Đằng gọi cho Nhi một ly chè thập cẩm: “Mới tập ăn, đừng ăn chè toàn đậu. Món này cũng có đậu nhưng ít hơn”. Khi Nhi nuốt muỗng chè đầu tiên vô bụng, Đằng chợt muốn phì cười. Chưa thấy được ai ăn chè mà lại đau khổ đến vậy. Đằng nhìn vào đôi mi cong của Nhi, nhớ về khoảng thời gian đã qua. Cuộc đời thật đẹp biết bao khi một khoảnh khắc bất ngờ nào đó, ta nhận ra thật ấm áp khi nghĩ về một người khác. Rằng ta chẳng bao giờ muốn quên cái buổi sáng có cái nắm tay bất ngờ, những buổi chiều lang thang lùng sổ, những giờ phút mà ta hạnh phúc vì có ai đó kế bên và sẻ chia biết bao nhiêu điều kỳ lạ.</p>\r\n<p>Đằng giật vội cốc chè trên tay Nhi và nhẹ nhàng: “Đưa đây.”. Sau đó cậu kiên nhẫn ngồi vớt hết những hạt đậu trong cốc ra. Khi ngẩng mặt lên, đã thấy mắt Nhi đầy nước.</p>\r\n<p>- Điên à? Tự nhiên khóc.</p>\r\n<p>- Mày biết gì không Đằng? Tao chợt nhớ ra là từ khi quen biết tao, mày đã bỏ hẳn cái món chè đậu mà mày từng yêu thích đúng không?</p>\r\n<p>- Đúng. Vì tao sợ mày nghỉ chơi với tao vì cái lý do đó.</p>\r\n<p>- Cảm ơn mày, Đằng.</p>\r\n<p>- Lý do cho buổi đi chơi hôm nay đó hả?</p>\r\n<p>- Không – Nhi ngập ngừng – Đơn giản là…một thời gian dài không gặp, tao nhận ra là tao nhớ mày kinh khủng khiếp.</p>\r\n<p>- Còn Phi?</p>\r\n<p>- Đừng nói nữa – Mi cong cụp xuống, nhưng ánh mắt vẫn giữ nguyên vẻ bướng bỉnh – Tao chia tay rồi.</p>\r\n\r\n\r\n\r\n					\r\n\r\n		<p>- Phi biết ăn chè đậu đúng không? Và đã nói dối mày? Và mày đã phát hiện ra và đòi chia tay?</p>\r\n<p>- Sao mày biết? – Nhi trố mắt.</p>\r\n<p>- Đơn giản là tao biết. Tao biết tất. Không cần lý do. Giống như sau bao nhiêu chuyện, tao vẫn bên mày không lý do vậy.<br /> Ly chè không còn một hạt đậu nào. Phút chốc, Nhi nhận ra Đằng vẫn ở đây, bên Nhi, sau bao nhiêu chuyện đã xảy ra. Mọi thứ rõ ràng như một thước phim chậm. Nhi ngồi đó, khóc lặng. Nhưng nhiều, đến mức Đằng phải gắt lên: “Khóc gì mà lắm thế hả? Tính tiền rồi đi mua sổ với tao”. Nhi phì cười, nắm chặt tay Đằng bước ra khỏi quán. Sau vài phút yên lặng, Nhi khẽ đung đưa cánh tay. Đằng ngoảnh nhìn, đôi mắt nheo lại dưới ánh nắng, tò mò. Nhi cười bình yên và nói bình thản: “Mày biết không? Hôm qua có một con điên nào đó cứ đứng khóc mãi trong nhà sách.</p>\r\n<p>Giữa những kệ hàng màu sắc rực rỡ. Sau khi nó tình cờ phát hiện rất cả các trang cuối cùng trong những cuốn sổ ở đó, đều có ghi tên nó. Theo mày thì cái đứa làm chuyện ấy có bị khùng không?”. Đằng không đứng lại. Cậu cười thành tiếng trong lòng và nói: “Cái đó tao không chắc. Nhưng tao nghĩ nó có não. Nói chuyện được. Phần nghe phần nhìn đều ổn. Và quan trọng nhất, là nó có thể làm tất cả cho cái con điên được ghi tên trong mấy cuốn sổ đẹp đẽ ấy, Nhi ạ”</p>\r\n<p>&nbsp;</p>         ', 'images/stories/2020/08/original/nhung-hat-dau.PNG', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'nhung-hat-dau', NULL, NULL, NULL, '2020-08-20 00:38:46', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/170-cau-chuyen-ve-nhung-hat-dau.html'),
(5, 'Không là lựa chọn đầu tiên', 'Mình xin lỗi khi cậu không phải là sự lựa chọn đầu tiên nhưng mình chắc chắn rằng cậu là người con gái duy nhất mình muốn đi cùng đến suốt cuộc đời.', '\r\n        	<p >\r\n	<strong>Mình xin lỗi khi cậu không phải là sự lựa chọn đầu tiên nhưng mình chắc chắn rằng cậu là người con gái duy nhất mình muốn đi cùng đến suốt cuộc đời.</strong></p>\r\n<p >\r\n	-------------------</p>\r\n<p >\r\n	Vy bước vào quán cà phê &nbsp;và chọn góc quán quen thuộc, cô gọi một cà phê sữa cho mình và một cà phê đen cho Hải, vẫn luôn là như vậy. Hải điện thoại nói là có chuyện cần cô giúp. Vy lơ đãng nhìn dòng người đang hối hả ngoài kia. Trong quán những bản nhạc của The Beatles vang lên nhẹ nhàng.</p>\r\n<p >\r\n	<img alt=\"\"  src=\"/uploaded/images/stories/2020/08/khonglaluachondautien.jpg\"  /></p>\r\n<p >\r\n	Ai cũng nói Vy là cô gái của mùa thu vì cô trầm lắng, sâu sắc và lãng mạn. Cô nhìn mọi thứ trong cuộc sống bằng đôi mắt đầy tình cảm. Người như cô không dễ gì bộc lộ cảm xúc. Mọi thứ chuyển biến chỉ diễn ra trong sâu thẳm tâm hồn cô. Với cô mọi mối quan hệ trong cuộc sống đều được trân trọng một cách tuyệt đối từ sự chân thành của trái tim.</p>\r\n<p >\r\n	Cô và Hải chơi với nhau khá lâu, từ khi còn ở trường phổ thông khi Hải còn là một cậu học trò lém lỉnh với gương mặt sáng, thông minh và đá bóng rất cừ. Mỗi chiều tan học cô và Hải cùng nhau đạp xe qua những hàng me đầy lá, cùng đi thả diều mỗi mùa hè. Tình cảm của Vy cứ lớn dần theo thời gian và khi thành thiếu nữ cô đã cảm nhận rõ ràng đó là tình yêu. Hải thì cứ mãi vô tư xem cô như bạn thân, có lần Hải nắm tay cô và nói:</p>\r\n<p >\r\n	-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Chúng ta sẽ mãi là bạn thân như vầy đúng không? Không ai hiểu tớ như cậu đâu.</p>\r\n<p >\r\n	Thế là tình cảm của Vy cứ mãi ngủ yên trong tim. Cô không dám bộc lộ vì lo sợ mối dây liên kết duy nhất của cô và Hải “bạn thân” sẽ bị đứt gãy. Với cô mỗi ngày nhìn thấy Hải, nghe anh nói là quá đủ với cô.</p>\r\n<p >\r\n	Hải đến, nhẹ nhàng ngồi xuống ghế:</p>\r\n<p >\r\n	-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cậu đợi mình lâu chưa? Cậu gọi cà phê cho mình rồi à?</p>\r\n<p >\r\n	-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ừ vẫn như mọi khi – Vy quan sát những giọt mồ hôi trên trán Hải – Có gì mà cần tớ thế?</p>\r\n<p >\r\n	-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Uh, tớ muốn gặp cậu về chuyện của tớ và Mai – Hải bắt đầu chậm rãi.</p>\r\n<p >\r\n	Mai – cái tên ấy nghe như một lát dao cắt vào lồng ngực Vy. Hải gặp Mai vào ngày sinh nhật thứ hai mươi của Vy. Mai là bạn cùng lớp Đại Học của Vy, xinh đẹp và năng động. Sau ngày hôm ấy Hải và Mai thành một đôi. Và suốt thời gian họ quen nhau, Vy bất đắt dĩ thành cầu nối. Mai kể tường tận từng chi tiết buổi hẹn đầu, món quà Hải tặng, lần đầu nắm tay…. Mỗi lần như thế Vy mỉm cười nhưng rồi quay đi và khóc, nỗi đau ấy cứ như một vết xước trong tim nhưng không bao giờ lành, nó cứ âm ĩ rĩ máu từng ngày. Hai người họ không bao giờ biết vì Vy đóng vai một người bạn hoan hỉ vì hạnh phúc của bạn mình một cách hoàn hảo.</p>\r\n<p >\r\n	Vì sâu thẳm lòng mình Vy luôn muốn thấy Hải hạnh phúc, dù bên cạnh anh không phải là cô. Giờ đây vẫn vậy, Vy lại ngồi đây nghe tâm sự của Hải về Mai. Chắc hai người lại giận nhau và cần Vy làm cầu nối giản hòa.</p>\r\n<p >\r\n	-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cậu lại làm Mai giận nữa à? – My hỏi</p>\r\n<p >\r\n	-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tớ cũng không biết nữa, tớ không làm gì cả, nhưng Mai nói chia tay, lần này có lẽ nghiêm trọng lắm.</p>\r\n<p >\r\n	-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Chia tay? – Vy nghe giọng mình hình như có chút vui sướng</p>\r\n<p >\r\n	-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ừ, Mai nói gì tớ cũng chẳng hiểu. Cô ấy nói là tớ không yêu cô ấy, rồi là tớ chẳng bao giờ hiểu được tình cảm của bản thân tớ.</p>\r\n<p >\r\n	-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hay cậu làm gì có lỗi với cô ấy, cậu không còn quan tâm chăm sóc cô ấy? Cậu cố sửa sai là được mà. – Vy trấn an Hải. Cô thầm nghỉ chắc lại như mọi lần Mai giận dỗi rồi lại thôi.</p>\r\n<p >\r\n	-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cậu giúp mình gặp Mai đi, chắc cô ấy sẽ kể cho cậu nghe là tại sao, giúp tớ nhé?- Hải năn nỉ.</p>\r\n<p >\r\n	-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Được rồi, đến khổ với các cậu, lần nào cũng là tớ. – Vy ngán ngẩm.</p>\r\n<p >\r\n	Hải cười:</p>\r\n<p >\r\n	-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cảm ơn nhé bạn thân, mỗi khi như thế này chỉ có cậu là đáng tin cậy.</p>\r\n<p >\r\n	Vy cười buồn, ừ đáng tin cậy, tớ đóng vai một người bạn hoàn hảo quá mà.</p>\r\n<p >\r\n	Vy giữ đúng lời hứa với Hải, cô hẹn gặp Mai, cố tìm hiểu lý do và giúp Hải hàn gắn. Nhưng cô không báo giờ lường trước tình huống mọi tình cảm của cô bị bóc trần.</p>\r\n<p >\r\n	-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Vy định đóng vai ấy đến khi nào – Mai bắt đầu khi Vy chưa kịp lên tiếng – Vy lại đến để giảng hòa cho bọn tớ à? Anh Hải không nhận ra nhưng tớ biết hết cả đấy, sao cậu phải cười trước mặt bọn tớ rồi quay mặt đi mà khóc. Cậu có biết lý do tớ chia tay là vì cậu không?</p>\r\n<p >\r\n	-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tại sao lại vì tớ, tớ luôn mong hai người tốt đẹp – Vy lại thấy tim mình nhói lên.</p>\r\n<p >\r\n	-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Đúng, tớ là sự lựa chọn đầu tiên của anh ấy nhưng không ai biết tớ là người đến sau. Cậu và anh ấy hợp với nhau đấy – Mai cười buồn – một người thì không bao giờ nhận ra tình cảm của bản thân mình, một người thì không bao giờ dám thừa nhận tình cảm của mình. Cả hai cậu sao không sống thật với lòng mình nhỉ. Tớ yêu Hải nhưng tớ thấy mình xứng đáng được nhiều hơn thế.</p>\r\n<p >\r\n	Sau cuộc hẹn với Mai, Vy không liên lạc với Hải. Cô không biết phải đối mặt và giải thích với Hải thế nào, cô không hiểu hết những lời Mai nói nhưng cô có thể hiểu Mai ra đi vì cô ấy biết tình cảm của Vy. Mai nói đúng, Vy không dám sống thật với tình cảm của mình cũng như giờ giờ đây cô không dám đối mặt với Hải. Cô lo sợ mối quan hệ của cô và Hải rồi sẽ như Mai, cũng ra đi.</p>\r\n<p >\r\n	Hải ngồi lặng góc quán, liên tục đốt thuốc. Một tháng rồi anh không gặp cả&nbsp; Mai và Vy, anh không hiểu Mai đã nói những gì mà Vy không gặp anh, điện thoại cũng không nghe, anh đến tìm thì cô toàn đi vắng. Một tháng, anh suy nghĩ nhiều và dường như anh đã hiểu những gì Mai nói. Không gặp Mai anh cũng chẳn thấy gì là khó khăn hay nhung nhớ. Nhưng quả thật một tháng không gặp Vy anh thấy thật khó chịu.</p>\r\n<p >\r\n	Anh có biết bao chuyện cần kể cho Vy nghe, Anh vừa được thăng chức, anh vừa gặp lại cậu bạn từ thời phổ thông, anh vừa hoàn thành mô hình trò chơi Vy yêu thích…. Có biết bao là chuyện anh không biết nói với ai. Mỗi tối tan sở về anh muốn cùng ai đó tạt vào quán cà phê, nghe những giai điệu nhẹ nhàng của The Beathles hay ghé ngang công viên ngồi nhìn những dòng xe qua lại nhưng… Mai nói đúng anh chưa bao giờ nhận ra tình cảm thật của bản thân mình.</p>\r\n<p >\r\n	Anh cần Vy biết bao, bấy lâu nay cô ấy bên cạnh anh như hơi thở, nó trở thành một thói quen. Mai đối với anh như một sự say đắm nhưng Vy đối với anh như cuộc sống mỗi ngày. Đốt điếu thuốc cuối cùng, Hải quyết định, anh phải làm gì đó trước khi quá muộn.</p>\r\n<p >\r\n	Tối muộn, Vy miệt mài gõ những dòng chữ trên màn hình máy tính xanh lè. Cô đang cố hoàn thành chương cuối của bản dịch. Cô bị chậm tiến độ do không dễ tập trung khi hình ảnh Hải cứ trong đầu. Điện thoại báo có tin nhắn: “ Mình cần gặp cậu”. Vy không trả lời như hàng chục tin nhắn khác của Hải. Điện thoại lại có tin nhắn: “Mình chỉ cần gặp cậu năm phút, mình đang trước nhà cậu”. Cuối cùng Vy cũng phải đối mặt với Hải. Có lẽ đây là lần cuối cho cả hai. Có lẽ Vy sẽ phải thú nhận tình cảm của mình và giải thích cho Hải hiểu vì sao Mai ra đi. Vy thở dài khoác chiếc áo len.</p>\r\n<p >\r\n	Hình ảnh thân quen của Hải đứng đó, dưới ánh đèn đường vàng le lói, hình ảnh hàng nghìn lần Vy mong nhớ. Tóc Hải dài hơn, ánh mắt có vẻ mệt mỏi.</p>\r\n<p >\r\n	Hải chậm rãi tiến về phía Vy, anh đưa cho cô bó hoa đồng tiền, loại hoa mà Hải biết cô rất thích.</p>\r\n<p >\r\n	-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Có lẽ cần quá nhiều thời gian để mình nhận ra cậu quan trọng với mình như thế nào. Mình không biết bây giờ có quá muộn không khi nhận ra cậu là cuộc sống của mình. Mình xin lỗi khi cậu không phải là sự lựa chọn đầu tiên nhưng mình chắc chắn rằng cậu là người con gái duy nhất mình muốn đi cùng đến suốt cuộc đời.</p>\r\n<p >\r\n	Mắt Vy hình như có nước. Cô biết mình không cần nói gì nữa, cô tiến về phía anh, ôm chầm. Hình như có giọt nước mắt rơi xuống vai anh. My thầm thì:</p>\r\n<p >\r\n	-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Đúng là đồ ngốc, cả hai ta đều là đồ ngốc.</p>\r\n<p >\r\n	Chiếc đèn đường lặng lẽ chiếu ánh sáng vàng nhạt in bóng hai người họ bên nhau.</p>\r\n<p >\r\n	&nbsp;</p>\r\n         ', 'images/stories/2020/08/original/khong-la-lua-chon-dau-tien.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'khong-la-lua-chon-dau-tien', NULL, NULL, NULL, '2020-08-20 00:38:48', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/166-khong-la-lua-chon-dau-tien.html');
INSERT INTO `fs_stories` (`id`, `title`, `summary`, `content`, `image`, `tags`, `category_id`, `category_alias`, `category_name`, `category_id_wrapper`, `category_alias_wrapper`, `category_icon`, `alias`, `creator`, `source_website`, `new_date`, `created_time`, `updated_time`, `editor`, `show_in_homepage`, `hits`, `published`, `ordering`, `title_display`, `display_title`, `display_column`, `tags_group`, `rating_count`, `rating_sum`, `keywords`, `hot`, `seo_title`, `seo_keyword`, `seo_description`, `lang`, `source`) VALUES
(6, 'Cầu vồng và mưa', 'Phải đi qua những ngày mưa mới đi đến được những ngày nắng, nhưng có vẻ tôi chỉ muốn chọn 1 con đường tắt, đó là đi thẳng đến những ngày tươi sáng. Một người sống yên bình như tôi không thích những nốt lặng của cuộc đời hay những nỗi buồn mà mình phải chịu đựng.', '\r\n        	<p ><strong>Phải đi qua những ngày mưa mới đi đến được những ngày nắng, nhưng có vẻ tôi chỉ muốn chọn 1 con đường tắt, đó là đi thẳng đến những ngày tươi sáng. Một người sống yên bình như tôi không thích những nốt lặng của cuộc đời hay những nỗi buồn mà mình phải chịu đựng.</strong></p>\r\n<p >***</p>\r\n<p >&nbsp;</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/cauvongvamua.jpg\" /></p>\r\n<p >&nbsp;</p>\r\n<p >Tôi là 1 đứa con gái 17 tuổi, cũng giống như các bạn nữ cùng trang lứa khác, tâm hồn tôi lãng mạn, hay thả mình chìm vào trong những giấc mơ và rồi đôi lúc cũng chẳng buồn đứng dậy. Bởi tôi luôn hy vọng những tưởng tượng của tôi rồi sẽ có ngày trở thành hiện thực. Đến nàng công chúa ngủ trong rừng 100 năm còn có thể thức dậy bởi nụ hôn của hoàng tử thì cớ gì tôi lại không dám tin vào ước mơ của mình chứ? Cho dù nó hơi viển vông, nhưng có sao đâu nhỉ? Bởi vì đâu ai đánh thuế giấc mơ bao giờ…</p>\r\n<p >Có thể bạn đang nghĩ giấc mơ của tôi có lẽ rất hoang tưởng và xa vời thực tiễn? Nếu không tại sao tôi lại ấp ủ 17 năm như thế phải không? Thực ra thì điều tôi vẫn chờ đợi và mong chờ ấy đơn giản lắm. Là 1 buổi sáng tôi được đánh thức bởi bé Mèo Béo dễ thương cùng ánh nắng của sáng sớm đang cố gắng xuyên mình qua song cửa sổ, với 1 tách cà phê đắng bên trên bàn học, sau đó sẽ cùng đi dạo với hoàng tử trong mộng của mình.</p>\r\n<p >Nếu như hôm đó trời có đổ mưa, 2 đứa chúng tôi sẽ chạy thật vội đến 1 cửa hàng tạp hoá nào gần đó, cả 2 sẽ vô tình cùng gọi “ Cô ơi cho con 2 kem ốc quế” rồi quay sang đỏ mặt nhìn nhau cười. Phải làm sao để có thể bớt xấu hổ trong mắt người ấy được nhỉ? Và tôi sẽ lại giả vờ đưa bàn tay nhỏ nhắn của mình ra hứng từng hạt mưa, rồi quay sang hỏi</p>\r\n<p >-Cậu chọn là những hạt mưa còn đọng lại trong lòng bàn tay tớ hay là những giọt mưa bị rơi qua những kẽ tay</p>\r\n<p >Và có lẽ sẽ chẳng còn câu trả lời nào tuyệt vời hơn ngoài câu nói<br /> -Sẽ là tất cả, bởi vì tình yêu của chúng ta nhiều và bất tận, như mưa…</p>\r\n<p >Qua những cơn mưa sẽ có những dải màu vắt qua nhau trên nền trời xanh thẳm, mê hoặc và lung linh, giống hệt như tâm hồn trong trẻo của 1 đứa con gái đang ở trong tuổi 17<br /> ….</p>\r\n<p >Nhưng hình như là tôi đang bị mê muội bởi xem phim truyền hình quá nhiều rồi thì phải. Bởi những cảnh tượng đó có khi nào gặp ở ngoài đời thực đâu. Nhưng không sao, cuộc sống sẽ thật hạnh phúc hơn khi bạn biết mơ mộng và biết giữ gìn những giấc mơ đó cho riêng mình, có gì thú vị hơn khi mình có 1 bí mật riêng mà người khác không thể nào biết, không thể nào nhìn thấy được và đương nhiên là cũng không thể nào chiếm đoạt được nó.</p>\r\n<p >Bởi đó là kho báu của riêng tôi thôi! Cũng như tôi thích Minh, nhưng tôi không dám nói ra điều đó, Vì tôi sợ sẽ đánh mất bí mật riêng của mình.</p>\r\n<p >Tôi yêu cầu vồng và cũng sẽ chẳng có gì bất ngờ nếu tôi luôn ghi ở nhãn vở của mình là Rainbow ở dòng Họ và tên. Nhưng có một điều rất bực là Minh (cậu ấy ngồi cùng bàn với tôi) luôn lấy bút xoá gạch chữ Bow phía sau Rain đi, lý do đơn giản, cậu ấy thích mưa. Minh thích điều đó đâu có nghĩa là bắt người khác phải có cùng chung sở thích với mình cơ chứ? Cũng như tôi thích Minh nhưng cũng đâu dám bắt cậu ấy phải thích tôi đâu?</p>\r\n<p >Bản thân tôi vốn dĩ đã không thích những cơn mưa bồn bã và lạnh lẽo, hành động của Minh khiến tôi đâm ra ghét mưa hơn, mặc dù tôi biết, nếu không có mưa, cầu vồng cũng sẽ chẳng thể nào xuất hiện.</p>\r\n<p >-Này, sao cậu thích mưa?</p>\r\n<p >Khi Minh đang đưa đôi mắt thẫn thờ ra phía ngoài cửa sổ để nhìn những hạt mưa đang rơi tí tách, tôi nhảy tới ngồi cạnh và đẩy chai c2 về phía cậu ấy. Minh quay sang nhìn tôi đầy lạ lẫm<br /> -Buổi sáng vui vẻ, hôm nay là 1 ngày đẹp trời với cậu phải không?</p>\r\n<p >Và Minh cười, phải chú thích thêm là khi cậu ấy cười, 2 má lúm đồng tiền đã góp phần làm tăng độ duyên trai cho cậu ấy</p>\r\n<p >Tôi không hiểu Minh cuồng mưa thế nào mà suốt 5 tiết học cậu ấy chỉ chú tâm đến những hạt mưa đó. Xem nào, nó là những giọt nước không màu, không mùi, không vị, có gì hấp dẫn đâu nhỉ? Hay cậu ta đi theo xu hướng lãng mạn thái quá giống tôi? Thế này thì không ổn cho lắm. Cũng giống như màu hồng không hoàn toàn thuộc về giới tính nào cả, nhưng nếu như có 1 anh chàng nào đó mà thích màu hồng chắc cũng dễ gây hiểu lầm về giới tính lắm! Và trong trường hợp này, tôi đang bắt đầu nghi hoặc về giới tính của Minh rồi đấy! Liệu tôi có đang thích 1 người cùng giới không nhỉ :-/ Là con trai, bay bổng quá cũng thấy có gì đó hơi bất thường J</p>\r\n<p >-Mi ngố, sao cậu thích cầu vồng?</p>\r\n<p >Câu hỏi của Minh làm tôi rơi vào trạng thái đơ toàn tập. Bởi dù sao cũng là kẻ bị động, tôi còn chưa kịp chuẩn bị tâm lý để thuyết trình về 1 thứ quá ư là tuyệt vời như thế. Vậy là thay vì làm một bài văn miêu tả, tự sự, thuyết minh kết hợp biểu cảm tôi chỉ lắp bắp nói 1 câu ngớ ngẩn</p>\r\n<p >-Vì nó đẹp</p>\r\n<p >-Đúng là đồ con gái</p>\r\n\r\n\r\n\r\n\r\n\r\n			<p >-Còn cậu đúng là đồ… con trai- Tôi nhăn mũi</p>\r\n<p >Cậu ấy lại cười với tôi, cũng chẳng biết là cười vì tôi ngây thơ quá hay là vì độ ngớ ngẩn khó ai đuổi kịp của mình nữa nhưng thấy cậu ấy vui, tôi cũng vui theo cậu ấy</p>\r\n<p >Tôi cũng đưa mắt mình nhìn ra ngoài cửa sổ. Thực tế là tôi không thích mưa, bởi mỗi lần mưa không hiểu sao tâm trạng tôi rất buồn. Nếu mỗi hạt mưa như 1 nốt nhạc thì mỗi cơn mưa sẽ là mỗi bản nhạc buồn với tôi.</p>\r\n<p >Phải đi qua những ngày mưa mới đi đến được những ngày nắng, nhưng có vẻ tôi chỉ muốn chọn 1 con đường tắt, đó là đi thẳng đến những ngày tươi sáng. Một người sống yên bình như tôi không thích những nốt lặng của cuộc đời hay những nỗi buồn mà mình phải chịu đựng. Có một kí ức về mưa mà tôi không thể quên. Cũng chẳng biết có nên gọi đó là kí ức hay không nữa. Bởi kí ức thường là rất đẹp còn cái mà tôi gọi là kí ức thì đúng là một câu chuyện rất buồn. Tôi không muốn nhớ tới nhưng mỗi lần mưa những giây phút đó lại hiện về làm nước mắt tôi như trực rơi, mọi thứ cứ như mới xảy ra từ ngày hôm qua vậy</p>\r\n<p >Mưa mang người tôi yêu thương nhất đi và tôi đã không thể níu giữ người đó ở bên cạnh mình. Chúng tôi yêu nhau vào một ngày mưa, chia tay cũng vào một ngày mưa. Cứ như là đinh mệnh vậy, đưa chúng tôi đến với nhau rồi lại đẩy chúng tôi ra xa, mỗi người một cực của Trái đất, khoảng cách là một thứ vô hình mà tôi không thể nhìn thấy</p>\r\n<p >Từ đó đến giờ tôi không gặp được người ấy nữa, nhưng mọi thứ về người ta tôi vẫn nhớ, giữ lại một khoảng kí ức cho riêng mình, để khi nhớ lại sao mà tôi thấy tim mình đau nhói.</p>\r\n<p >Tôi ngoảnh sang nhìn Minh, cậu ấy là một người rất dễ thương, nhưng vẫn có những nét lạnh lùng nào đó rất hấp dẫn tôi. Người ta bảo mối tình đầu thường để lại cho chúng ta nhiều dư âm, và những lần sau khi chúng ta yêu một người nào đó, người ấy sẽ luôn luôn có chút gì đó của người đầu tiên. Nghiệm lại mình thấy cũng chẳng có gì sai. Tôi nhớ lần đầu tiên nhìn Minh tôi đã ngỡ như gặp anh ấy, cả 2 thực sự có rất nhiều nét tương đồng với nhau. Nhưng con người thì chẳng ai giống nhau hoàn toàn cả, anh ấy có nét riêng của anh ấy, Minh có nét riêng của Minh, tôi không nhầm lẫn đến mức ấy, chỉ là đôi lúc nhìn Minh tôi lại nhớ lại một chút về tình yêu trước kia của mình thôi.</p>\r\n<p >-Cậu có vẻ không thích mưa lắm, có tâm sự gì à?</p>\r\n<p >-Hừm- Tôi cười gượng gạo, tôi không nghĩ sẽ nói chuyện đó ra với Minh, thế mà lại bị cậu ấy phát hiện ra – Một chuyện buồn thôi</p>\r\n<p >-Vậy thôi cậu đừng kể, nếu điều đó làm cậu buồn</p>\r\n<p >Minh cũng là một chàng trai rất tâm lý nữa, có lần cậu ấy nói với tôi con trai sợ nhất là khi con gái khóc. Tôi nhìn mưa ngày càng rơi nặng hạt hơn rồi tự hỏi tại sao Minh không sợ nhìn thấy nước mắt của ông trời? Còn tôi, hễ gặp mưa là lòng tôi lại trùng xuống</p>\r\n<p >Tan học, trời vẫn mưa to, không có dấu hiệu là sẽ ngớt, còn tôi thì lúng túng, không biết mình sẽ về nhà bằng cách nào. Lúc sáng tôi đi học trời chỉ mưa nhỏ nên tôi cũng mặc kệ, chẳng thèm mang ô hay áo mưa gì hêt. Giờ thì bắt đầu thấy hối hận rồi. Trong lúc tôi còn đang chẳng biết phải làm thế nào định dầm mưa chạy về thì Minh vỗ vai tôi nói</p>\r\n<p >-Cùng về nhé!</p>\r\n<p >-Sao cơ?- Tôi quay người lại tròn mắt nhìn Minh vì đây là lần đầu tiên cậu ấy đề nghị đi chung với tôi</p>\r\n<p >-Thì tại tớ thấy cậu không mang ô dù gì mà. Đi bộ từ trường ra bến xe bus cũng mất 10 phút, từng ấy đủ làm cậu ướt nhẹt rồi, phụ xe không cho lên đâu</p>\r\n<p >-Hi, cảm ơn cậu trước nhé</p>\r\n<p >Để cảm ơn Minh tôi mua cho cậu ấy một gói bim bim, và tôi sẽ là người cầm ô cho cậu ấy. Nhưng có lẽ do tay tôi ngắn hoặc là Minh quá cao mà tôi luôn để cậu ấy bị ướt</p>\r\n<p >-Cậu phải giơ cao lên chứ? Tớ bị ướt rồi này</p>\r\n<p >-Nhưng mỏi tay lắm, cậu mau ăn hết bim bim rồi cầm ô đi, chiều cao tớ và cậu chênh lệch bao nhiêu cậu cũng biết mà</p>\r\n<p >-Cậu đúng là nấm lùn di động, một mét bẻ đôi<br /> Tôi méo xẹo mặt, cậu ấy đang chê tôi lùn phải không?</p>\r\n<p >-Để tớ ga lăng nốt lần này vậy, ăn nốt bim bim đi này</p>\r\n<p >-Hi hi, tớ biết cậu là người tốt mà, tốt thì tốt luôn cho trót Minh nhỉ</p>\r\n<p >Minh lườm tôi một cái rất đáng yêu rồi mắng tôi đúng là đồ láu cá, tôi vẫn toe toét lúc lắc cái đầu đi sát bên cạnh cậu ấy. Đột nhiên Minh đưa tay đặt nhẹ lên vai tôi rồi thì thầm</p>\r\n<p >-Mi à, thực ra thì tớ thích mưa, cũng thích cả cầu vồng nữa.</p>\r\n<p >Tôi còn đang bất ngờ về hành động kì lạ của Minh thì càng bất ngờ hơn khi đột nhiên cậu ấy nói với tôi câu đó. Tôi không ăn nữa, chỉ đưa mắt lên nhìn cậu ấy, ý muốn hỏi “Là sao?”</p>\r\n<p >-Đi mau nào, bến xe bus kia rồi<br /> Minh chạy thật nhanh về phía bến xe, chân tôi thì hệt như bị ai giữ lại vậy, cứ nặng trĩu không thể bước nổi.</p>\r\n<p >-Sao vậy? Cậu không sợ bị ướt à??? Còn tớ thì sợ đấy</p>\r\n<p >Hết bất ngờ này đến bất ngờ khác tôi thấy Minh thật kì lạ, cậu ấy bây giờ rất khác với mọi khi<br /> -Mau lên. Xe bus đến rồi kìa!!</p>\r\n<p >Minh kéo lấy tay tôi, những bước chân chạy thật nhanh, thật dài, thật vội. Tôi cũng không biết lúc này mình đang thế nào nữa, đầu óc trống rỗng, cử chỉ thì lúng túng, còn hơn cả lúc tôi đứng nhìn trời mưa và nghĩ mình sẽ về nhà bằng cách nào</p>\r\n<p >Chạy tới bến xe thì xe bus cũng đã chạy rồi. Minh thở dài vì đã để lỡ nó, vậy là 15 phút nữa mới có xe, 2 đứa chúng tôi sẽ lại phải đợi rồi. Cậu ấy cụp ô lại rồi quay sang hỏi tôi có lạnh không, tôi chỉ e thẹn lắc đầu, sự quan tâm của Minh lúc này làm tôi bối rối, mặc dù vẫn âm ỉ niềm vui trong lòng. Mưa mỗi lúc lại ngớt dần, ngớt dần</p>\r\n<p >-Cậu đoán xem mấy phút nữa thì mưa tạnh? – Minh hỏi tôi</p>\r\n<p >-Nhìn trời mưa lâm râm thế này chắc là một lát nữa thôi, cảm ơn cậu vì chiếc ô nhé!!!- Tôi lúng túng nói</p>\r\n<p >-Cậu đếm đến 100 mưa sẽ tạnh, tin tớ đi, tớ là nhà thiên văn học đấy- Minh nở nụ cười roi rói quay sang nhìn tôi</p>\r\n<p >-Thật không vậy?- Tôi ngờ hoặc</p>\r\n<p >-Không tin thì cậu cứ thử đếm mà xem</p>\r\n<p >Tôi không biết có nên tin Minh hay không nữa, nhưng cũng chẳng biết sẽ làm gì trong thời gian đợi xe bus cả, vậy là tôi (có vẻ) ngây thơ khi nhắm mắt đếm từ 1 đến 100 theo cậu ấy</p>\r\n<p >-Mi! Cầu vồng kìa</p>\r\n<p >-Đâu?- Tôi giật mình vội mở mắt- Trời chưa tạnh mà!</p>\r\n<p >Đó là sự thật, cầu vồng xuất hiện ở phía xa chân trời kia với đủ 7 màu: lục, da cam, vàng, lục, lam, chàm, tím. Tôi gần như phát khóc khi khung cảnh tuyệt vời này đang xuất hiện trước mắt tôi, bởi đã rất lâu rồi tôi chưa được ngắm nó được chân thậ và rõ ràng như thế này</p>\r\n<p >-Đấy, tớ đã nói mà</p>\r\n<p >-Có đẹp hơn mưa không?- Tôi mơ hồ nói</p>\r\n<p >-Cầu vồng đẹp, nhưng nếu không có mưa cũng sẽ không thể có cầu vồng, tớ nghĩ cậu cũng nên dần học cách yêu mưa đi. Tớ cũng đã từng không thích cầu vồng, nhưng vì một người, tớ có thể thay đổi được, còn cậu thì sao???</p>\r\n<p >Môi tôi cứng đờ không biết trả lời Minh ra sao, nhưng khi nhìn cậu ấy vẫn thản nhiên huýt sáo tay đút túi quần, tôi khẽ mỉm cười, nép mình vào người cậu ấy. Giấc mơ tôi đợi 17 năm nay cuối cùng cũng tới, có thể sự việc diễn ra không hoàn toàn giống như trong mộng tưởng của tôi, nhưng đối với tôi giây phút hiện giờ đã là quá đỗi hoàn hảo. Rốt cuộc thì tôi cũng đã được ngắm cầu vồng cùng Minh rồi</p>\r\n<p >Một chiếc xe bus lại tiếp tục đi qua nhưng chúng tôi đều không muốn bước lên, bởi lẽ chúng tôi không muốn để lỡ mất cái khung cảnh lãng mạn này. Tôi muốn ngắm cầu vồng thật lâu, và cũng muốn ở bên cạnh Minh thật lâu để cảm nhận được rằng đây là sự thực, không phải là một câu chuyện cổ tích.</p>\r\n<p >Minh nắm chặt tay tôi nói:<br /> - Nếu Minh mà không có Mi, sẽ không thể là Minh toàn vẹn. Và cầu vồng cũng vậy, không có mưa cũng sẽ chẳng thể có cầu vồng</p>\r\n\r\n\r\n\r\n					\r\n\r\n		<p >Đúng rồi, có một phép tính thế này, tôi cũng chẳng biết có phải là một sự trùng hợp ngẫu nhiên không nữa nhưng quả thật là rất dễ thương</p>\r\n<p >Mi+nh= Minh</p>\r\n<p >Rain+bow= Rainbow</p>\r\n<p >Cuộc sống cũng giống như mưa và cầu vồng vậy. Nếu thiếu 1 trong 2 thì cuộc sống sẽ không còn ý nghĩa nữa, vậy nên chúng luôn song song cùng tồn tại. Nỗi buồn cũng chỉ như một chút hương vị của hạnh phúc mà thôi. Để đến được những gì mà người ta mong muốn phải trải qua ít nhất một nỗi buồn, nó làm ta trưởng thành hơn. Học cách chấp nhận chứ không phải lãng quên. Tình yêu đầu của tôi đã kết thúc. Đó dù sao cũng chỉ còn là quá khứ mà thôi.</p>\r\n<p >Cất quá khứ vào một góc trong trái tim rồi khoá nó lại, vậy là sẽ không ai có thể mở được nó, ngay cả chính tôi cũng sẽ không bao giờ mở nó ra thêm một lần nào nữa. Chấp nhận để cho những cơn mưa đi qua cuộc đời để có một ngày nắng ấm. Sẽ nghe những bản nhạc buồn để thấu hiểu được những cảm xúc xuất phát từ con tim. Tôi định hỏi Minh nếu hôm nay không phải là một ngày mưa, tôi có biết được tình cảm cậu ấy dành cho tôi không?</p>\r\n<p >Nhưng rồi tôi cũng lại tự trả lời mình. Tình yêu đôi khi không cần thể hiện qua lời nói, lời nói có thể giả tạo, còn tình cảm thì sẽ luôn chân thành…</p>\r\n<p >Và tôi, trong giờ phút này, đang dần yêu những cơn mưa vừa rồi đây, còn bạn thì sao? Bạn yêu mưa? Và cũng yêu cả cầu vồng nữa chứ?</p>         ', 'images/stories/2020/08/original/cau-vong-va-mua.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'cau-vong-va-mua', NULL, NULL, NULL, '2020-08-20 00:38:49', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/165-cau-vong-va-mua.html'),
(7, 'Chiếc mặt nạ quỷ', 'Từ đó cậu bé ấy mang bên mình mặt nạ ác độc của quỷ và sống một cuộc đời cô độc đáng thương.&nbsp;Câu chuyện cô kể cho anh vẫn chưa đến đoạn kết. Chiếc mặt nạ quỷ anh sẵn sàng mang…', '\r\n        	<p><strong>Từ đó cậu bé ấy mang bên mình mặt nạ ác độc của quỷ và sống một cuộc đời cô độc đáng thương.&nbsp;Câu chuyện cô kể cho anh vẫn chưa đến đoạn kết. Chiếc mặt nạ quỷ anh sẵn sàng mang…</strong></p>\r\n<p ><strong>***</strong></p>\r\n<p>Truyện kể rằng: Ác quỷ vô tình rơi mất mặt nạ của mình. Một cô bé tò mò nhặt được ướm thử lên mặt. Mặt nạ của quỷ dính chặt vào da thịt, cô bé không tài nào tháo gỡ được.&nbsp;Cô bé trở thành một con quỷ xấu xí.</p>\r\n<p>Cô bé hoảng loạn, chạy thật nhanh về làng kiếm mẹ. Mẹ cô không nhận ra cô cùng người trong làng đuổi cô bé đi.Cô bé tội nghiệp đau đớn tột cùng. Thế rồi, cậu bạn thanh mai trúc mã của cô bé xuất hiện, ra mặt giúp cô bé giải thích mọi chuyện… Chỉ vì cậu tin đấy là cô bé. Cô bé có được niềm tin yêu… Mặt nạ được gỡ bỏ…”</p>\r\n<p><img alt=\"\" border=\"0\" src=\"/uploaded/images/stories/2020/08/matnaquy.jpg\"  /></p>\r\n<p>&nbsp;</p>\r\n<p>-Thế nào anh yêu, đã nghe truyện này chưa ?</p>\r\n<p>Quàng tay qua vai anh, mái tóc thướt tha của cô lan tỏa một mùi hương đặc trưng. Anh ngây ngất say mê trong vòng tay ấm áp của người yêu.</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n			<p>Từng ngón tay chạm vào da mặt sần sùi nếp gấp khúc, nhăn nhúm như một con quỷ. Đâu rồi ? Cô gái xinh xắn đáng yêu lúc trước đâu rồi ? Anh sẽ nghĩ thế nào đây ? Có còn yêu cô nữa không ? Sẽ còn thích cô nữa hay không ? Càng nghĩ cô càng chẳng dám mơ đến việc sẽ chuẩn bị đám cưới với anh.</p>\r\n<p>- Thế….. Đó cũng là một cơ hội để cậu thử lòng anh ấy đó chứ !</p>\r\n<p>Bạn bè cứ khuyên nhủ, cuối cùng cô quyết định liên lạc lại với anh. Nhưng cô không hề đá động đến khuôn mặt biến dạng của mình. Cô tự thu mình trong nỗi sợ hãi.</p>\r\n<p>Ngày nối ngày trôi qua…. kì hạn mộ năm đã cận kề.</p>\r\n<p>Anh vui vẻ bàn tính đến các khâu đám cưới mà hai người phải chuẩn bị trong thư gửi cho cô. Cô lặng người….vỡ tan…. lo sợ….</p>\r\n<p>Ngày anh về đã đến.</p>\r\n<p>Bạn bè đưa cô đến sân bay.Tim cô bấn loạn, bất an, nhưng vẫn rất muốn có một cơ hội..Có thật là anh sẽ nhận ra cô như trong truyện đã nói không ? Cô đeo kính đen, đội nón, mang khẩu trang, đứng lặng im tại góc khuất sân bay, đợi người cô yêu.</p>\r\n<p>Anh bước xuống máy bay với tâm trạng hứng khởi.Thời gian một năm xa cô đủ để anh hiểu tình yêu của anh dành cho cô không lời nói nào đủ để bày tỏ. Một năm liên lạc với cô, dù có gián đoạn nhưng những lá thư gửi cho nhau đã khiến hai người đong đầy nỗi nhớ. dù có đôi chút lo lắng không biết cô ta đã gặp sự cố gì mà bạn bè cô một mực giấu bặt tin. Thôi thì, không nghĩ ngợi nữa….Vì hôm nay anh được gặp cô người mà suốt một năm dai dẳng anh nhớ đến.</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/1308726505-su-im-lang-cua-teen-eva.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>Bước chân xuống sân bay.</p>\r\n<p>Trong dòng người đông đúc</p>\r\n<p>Anh đảo mắt kiếm tìm bóng hình quen thuộc.</p>\r\n<p>Anh tin rằng.</p>\r\n<p>Cô sẽ thật khác biệt so với mọi người.</p>\r\n<p>Nhất định cô đã đến.</p>\r\n<p>Thế là anh bắt đầu rảo bước khắp nơi tìm kiếm cô.</p>\r\n<p>Cuối cùng…Tại đằng sau cây cột trước cổng ra vào, anh đã tìm ra cô.Anh vui vẻ chạy đến phía sau, ôm chặt lấy cô.</p>\r\n<p>- Ui da, nhớ em chết đi được ! Đến đây rước anh, mà lại còn chơi trốn tìm với anh thế này à !</p>\r\n<p>- Anh… kiếm được em ? Giọng cô ta nhỏ dần..</p>\r\n<p>Cảm giác kì lạ bao quanh anh . Xoay vai anh nhìn thẳng vào cô. Mà sao cô lại che khuôn mặt của mình như thế ?</p>\r\n<p>- Anh… anh… còn nhận ra em chứ ?</p>\r\n<p>Giọng nói trầm ngâm vang lên từ đằng sau khẩu trang. Anh lo sợ vòng tay ôm cô vào lòng. Nhất định có chuyện xảy ra rồi.</p>\r\n<p>- Anh dĩ nhiên là nhận ra em rồi. Anh yêu em mà !<br /> - Thế… như vậy thì anh có còn yêu em không ?</p>\r\n<p>Trước mặt anh, cô cởi bỏ nón, tháo mắt kính và cuối cùng cùng là cái khẩu trang.Khuôn mặt xấu xí kinh khủng xuất hiện trước mặt anh.Mọi người kinh hoàng … Những tiếng kêu thảng thốt khi nhìn thấy khuôn mặt ấy vang lên. Anh vẫn không phản ứng gì và bình thản cười to:</p>\r\n<p>- Anh hoàn toàn không để tâm .Ôm gọn cô vào lòng anh nhẹ nhàng rót vào tai cô:</p>\r\n<p>- Dĩ nhiên. Anh yêu em !</p>\r\n<p>Anh đưa tay, từng ngón từng ngón tay chạm vào những vết sẹo trên mặt cô và đặt nụ hôn lên mặt cô như thể hiện rằng dù mặt cô có thay đổi đi chăng nữa(cô gái xinh đẹp lúc trước không còn.) anh vẫn rất yêu, rất yêu cô.</p>\r\n<p>Anh và cô bắt đầu chuẩn bị lễ cưới.Mặc cho sự cản trở từ phía gia đình anh,anh vẫn kiên định sẽ cưới cô. Chỉ vì anh thật sự rất yêu cô.Yêu vẻ đẹp nội tâm.Vì vậy… từ ánh nhìn đầu tiên anh đã nhận ra cô.</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>Sau khi về nước, để hòa nhập nhanh chóng hơn với công việc anh thường xuyên về nhà muộn.Cô ở nhà chờ đợi và lo lắng.Mặc cho những cú điện thoại báo cáo anh đã đi đâu, làm gì cô vẫn cứ lo, vẫn cứ sợ…… rất sợ. Sợ anh sẽ bỏ rơi cô . Cô sống khép mình, mất hoàn toàn lòng tự tin. Lúc đầu, cô hay gọi điện cho anh.Chỉ cần một phút chậm trễcô cũng vặn vẹo hỏi đủ điều. Thời gian, lòng hoài nghi của cô cứ ngày một tăng.Cô càng ngày càng khắt khe và cáu bẳn. Thậm chí cô không muốn cho anh đi làm.</p>\r\n<p>Anh khó chịu. Nhiều lần muốn nói rõ vấn đề, nhưng lại sợ làm tổn thương cô anh kìm nén và im lặng. Dần dà, cô càng ngang tàng, thường la làng như thể một bà điên. Gánh nặng công việc cộng áp lực trước những lời buộc tội vô cớ rút cuộc anh đã nói :</p>\r\n<p>- Em đừng làm cho tâm hồn em cũng trở nên xấu xí đi chứ !</p>\r\n<p>Nói rồi, anh bỏ đi. Đối diện với lời anh vừa nói cô òa khóc tức tưởi. Cô không muốn thế đâu… chỉ vì… chỉ vì…. cô sợ mất anh thôi mà.Trước đây, cô đâu phải như thế. Trái tim cô trở nên xấu xí chắc bắt nguồn từ cái khuôn mặt xấu xí .</p>\r\n<p>Cô quyết định xin lỗi anh. Gọi điện anh bảo đang họp tại công ty.Cô chạy đến công ty tìm anh, nhân viên lại bảo anh không đi làm ngày hôm nay. Bàng hoàng…..cô gọi điện lại cho anh….. Khóa máy. Cô bắt đầu lo sợ.Không lẽ anh đã tìm người phụ nữ khác sao ? Nghĩ đến đó… cô chau mày… Chẳng phải vì những suy nghĩ linh tinh thế, nên anh bỏ đi à .Cô tự động viên mình rằng cô nên tin tưởng anh nhiều hơn.</p>\r\n<p>Trên đường về vô tình cô nhìn thấy anh đang ngồi cùng 1 phụ nữ trong tiệm coffee shop sang trọng. Thật không ngờ suy đoán của cô lại là sự thật. Bên đường anh và cô gái đang trò chuyện vui vẻ, nói nói cười cười. Những giọt nước mắt của cô lặng lẽ rơi. Cô ta có khuôn mặt thật xinh đẹp. Cái khuôn mặt xinh xắn đáng yêu mà trước đây cô đã từng sở hữu.Cô ghét… rất ghét anh ! Anh chê cô xấu xí….. Anh chê cô có khuôn mặt dị dạng…. Anh bỏ rơi cô rồi !</p>\r\n<p>Lễ cưới bị hủy. Anh không hề nhận được một lý do.Anh đến thăm nhà, nhưng bị cô cự tuyệt. Đến lời giải thích cuối cùng, cô cũng chẳng muốn nghe anh nói.</p>\r\n<p>Thế rồi lại một năm trôi đi.Cô ta mang cái mặt dị dạng sống. Bạn bè nhiều người khuyên nhủ cô phẫu thuật nhưng cô một mực từ chối.Cô bảo ít ra với khuôn mặt này cô nhận ra rất nhiều bộ mặt thật của người khác. Bạn bè cô không từ bỏ lần nữa khuyên nhủ cô sang Nhật phẫu thuật. Bên đấy có bác sĩ rất giỏi sẽ đưa cô ta trở về với khuôn mặt trước đây.Cô cười cười.Thôi thì mặc, thử cũng chẳng sao.Làm sao thì cũng chỉ là một miếng da thôi mà.</p>\r\n<p>Trải qua cuộc phẫu thuật kéo dài 12 tiếng và hơn tháng điều dưỡng cũng đã đến ngày cô và bạn bè cởi bỏ lớp băng trắng trên mặt cô. Một khuôn mặt thân quen xuất hiện.Là cô.Cô lúc trước đây mà ! Cô gái ngày trước đã trở về rồi !Cô ấy cười đau khổ.Khuôn mặt lúc trước đã trở về nhưng anh đã không còn nữa rồi.</p>\r\n<p>Sau đó cô sống một cuộc sống hoàn toàn khác. Quan hệ được nới rộng hơn, quen biết nhiều người hơn và quen được những người có thể là chỗ dựa cho cô. Cô không cần tình yêu, chỉ cần vui vẻ và hạnh phúc.Khuôn mặt mới mang đến cho cô một cuộc sống hạnh phúc vui vẻ.</p>\r\n<p>Cô nhận lời cầu hôn của một người đàn ông.Cô quay trở về Nhật Bản vì muốn bày tỏ sự cảm kích với người bác sĩ đã phẫu thuật cho cô.Nhưng đến nơi cô được bệnh viện trả lời vị bác sĩ ấy đã rời khỏi bệnh viện. Cô ngồi chờ. Thời gian rất lâu mà vị bác sĩ vẫn chưa xuất hiện. Vừa định quay bước đi bất ngờ cô trông thấy một bệnh nhân với khuôn mặt băng đầy băng trắng.</p>\r\n<p>- Xin lỗi. Cô nói với vốn tiếng Nhật ít ỏi của mình.</p>\r\n<p>Chỉ thấy người bệnh ấy nhìn cô kinh ngạc rồi gấp rút bỏ đi.</p>\r\n<p>Cô như nghĩ ra cái gì đó, nói tiếp :</p>\r\n<p>- Bác sĩ ở đây tốt lắm. Hãy để họ phẫu thuật cho anh. Khuôn mặt anh nhất định sẽ trỡ về như trước đây.Đây, xem này ! Tui cũng phẫu thuật ở đây đấy, đẹp chứ ?</p>\r\n<p>- ………….</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/207914-400.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>Người bệnh đứng yên và im lặng.</p>\r\n<p>Vị hôn phu của cô đứng ngoài gọi với vào. Cô nhìn anh bệnh nhân cười nhẹ rồi quay đầu sải bước đi về phía vị hôn phu.</p>\r\n<p>Nhìn cánh cổng bệnh viện, nhìn khuôn mặt cười tràn ngập hạnh phúc của cô nước mắt anh lặng lẽ rơi.</p>\r\n\r\n\r\n\r\n					\r\n\r\n		<p>Thốt nhiên một nữ bác sĩ xuất hiện đằng sau anh nói bằng tiến bản địa :</p>\r\n<p>- Anh thật sự yêu cô ấy. Vì cô ấy, dâng hiến da mặt của chính mình. Thế mà giờ đây….. cô ta lại chẳng nhận ra anh. Một năm trước đây anh đã tìm tôi với hy vọng về cuộc phẫu thuật. Kết quả này anh mãn nguyện chưa ?</p>\r\n<p>Anh vẫn im lặng</p>\r\n<p>- Nhưng mà tôi có thể miễn phí làm cho khuôn mặt anh trở về như xưa, nếu anh muốn…</p>\r\n<p>- Không cần đâu.Cô ấy không nhận ra tôi thì thôi vậy….. Hãy để tôi đeo mặt nạ này mà sống nốt những ngày còn lại vậy…..Vừa nói anh vừa đi về phòng mình. Bước chân nặng chĩu.</p>\r\n<p>Nước mắt chảy ngược vào trong.Hương thơm thoang thoảng từ mái tóc của cô cứ vương vấn bên anh. Mùi hương nhẹ nhàng quay quắt. Mùi hương đặc trưng của cô làm anh chạnh lòng , cảm giác càng cô đơn………</p>\r\n<p>“Sau này cậu bé nhặt lấy mặt nạ của quỷ. Cậu muốn thử cô bé xem cô bé có nhận ra cậu ta không.Thật bất ngờ…. Cô bé không chỉ khóc thét lên khi nhìn thấy cậu, lại còn bảo cậu đừng bao giờ đến gần cô ta nữa.</p>\r\n<p>Từ đó cậu bé ấy mang bên mình mặt nạ ác độc của quỷ và sống một cuộc đời cô độc đáng thương.&nbsp;Câu chuyện cô kể cho anh vẫn chưa đến đoạn kết. Chiếc mặt nạ quỷ anh sẵn sàng mang….”</p>\r\n</div>\r\n</div>         ', 'images/stories/2020/08/original/chiec-mat-na-quy.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'chiec-mat-na-quy', NULL, NULL, NULL, '2020-08-20 00:38:52', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/146-chiec-mat-na-quy.html'),
(8, 'Mình sẽ đặt tên con là gì?', 'Tuấn ngỏ lời yêu Ly cô gái xấu xí có thể nói là nhất trường đại học luật này, da thì đen,tính tình thì khù khờ đã hai mươi tuổi nhưng chưa anh chàng nào dám rớ. Chuyện đó nhanh chóng trở thành tiêu điểm của cả trường khi một hot boy sành điệu yêu một “cô bé lọ lem” nhưng lọ lem không xinh đẹp.&nbsp;', '\r\n        	<p>\r\n	<strong>Tuấn ngỏ lời yêu Ly cô gái xấu xí có thể nói là nhất trường đại học luật này, da thì đen,tính tình thì khù khờ đã hai mươi tuổi nhưng chưa anh chàng nào dám rớ. Chuyện đó nhanh chóng trở thành tiêu điểm của cả trường khi một hot boy sành điệu yêu một “cô bé lọ lem” nhưng lọ lem không xinh đẹp.&nbsp;</strong></p>\r\n<br />\r\n\r\n\r\n\r\n<p>\r\n	- Cái gì? con nhỏ xấu như ma chơi.</p>\r\n<p>\r\n	- Thì vậy! Cưa nó rồi yêu nó một tháng tao thua mày hai vé đi Thái.</p>\r\n<p>\r\n	- Thật không? Mà sao tự nhiên khui ra trò này vậy?</p>\r\n<p>\r\n	- Chẳng có gì tao thấy mày dạo này buồn kiếm trò cho mày chơi thôi.</p>\r\n<p>\r\n	- Ok! Nhưng hai tuần thôi,yêu con đó một tháng tao chết mất.</p>\r\n<p>\r\n	- Cũng được</p>\r\n<p>\r\n	Tuấn ngỏ lời yêu Ly cô gái xấu xí có thể nói là nhất trường đại học luật này, da thì đen,tính tình thì khù khờ đã hai mươi tuổi nhưng chưa anh chàng nào dám rớ. Chuyện đó nhanh chóng trở thành tiêu điểm của cả trường khi một hot boy sành điệu yêu một “cô bé lọ lem” nhưng lọ lem không xinh đẹp.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p >\r\n	<img alt=\"\" src=\"/uploaded/images/stories/2020/08/wallpaper-holiday-16-giaodu.jpg\" /></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Ly ngồi sau lưng cho Tuấn chở qua những con phố dài dầy mùi nắng mới hay nắng hạnh phúc trong lòng cô.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	- Anh Tuấn!</p>\r\n<p>\r\n	Tuấn quay mặt lại càu nhàu:</p>\r\n<p>\r\n	- Gì thế!</p>\r\n<p>\r\n	- Em thích ăn kem hay mình đi ăn kem nha!</p>\r\n<p>\r\n	Tuấn nhăn mặt:</p>\r\n<p>\r\n	- Kem cỏ gì anh thích ăn bánh xèo thôi, không kem gì cả.Ly rụt người lại:</p>\r\n<p>\r\n	- Vậy thôi ăn bánh xèo cũng được.Ly là vậy hiền và yêu hết mình khù khờ và ngây ngô trong tình yêu. Chẵng lẽ cô không hiểu rằng một tên con trai yêu mình thì sẽ không bao giờ để mình phải thất vọng. Những người bạn thân, những cô nàng ghen tị với cô đều nói rằng Tuấn chỉ đùa giỡn nhưng cô đâu tin. Cô tin là tin vào tình yêu của mình và Tuấn sẽ không dịch chuyển.</p>\r\n<p>\r\n	- Sau này có con anh thích đặt tên gì?</p>\r\n<p>\r\n	- Em khéo “mơ” thật, con cái gì?</p>\r\n<p>\r\n	- Thì em chỉ hỏi thôi, nhưng nếu có con gái em sẽ đặt nó tên là Tịnh Yến yên bình và hạnh phúc như tình yêu hai mình.Tuấn nhếch môi cười:<br />\r\n	- Khéo mơ mộng.</p>\r\n<p>\r\n	Một tuần trôi qua</p>\r\n<p>\r\n	- Tuấn mày vẫn còn cặp với con Ly chứ?</p>\r\n<p>\r\n	- Tất nhiên,tụi mày chuẩn bi chung độ là vừa.</p>\r\n<p>\r\n	- Chớ vội mừng,còn một tuần cơ đấy.</p>\r\n<p>\r\n	- Vượt qua nhanh thôi,mày đừng lo mà không hiểu con nhỏ đào đâu ra tiền mà tao cứ than hết tiền là có chi phí.</p>\r\n<p>\r\n	- Con nhỏ mê mày quá rồi, tao biết nó làm nghề gì nè!</p>\r\n<p>\r\n	- Nghề gì?</p>\r\n<p>\r\n	- Hỏi chi! Tuần sau biết thôi nhậu tới bến hôm nay đi.</p>\r\n<p>\r\n	- Ok</p>\r\n<p>\r\n	- Sao anh say quá vậy?Tuấn lèm bèm tát vào mặt Ly:</p>\r\n<p>\r\n	- Con khốn! Thế này mà cũng nói là say, qua đây làm gì về nhà đi.</p>\r\n<p>\r\n	Ly ngước mặt lên, ngân ngấn lệ:</p>\r\n<p>\r\n	- Em sang vì anh gọi mà, anh quên hả, thôi vào nhà nghỉ đi.Ly dìu Tuấn vào phòng nghĩ ngơi cô cũng không hiểu sao sức chịu đựng của mình cao đến thế một cái tát.Tuấn kéo Ly nằm xuống cạnh mình cười ha hả:</p>\r\n<p>\r\n	- Sao người yêu tôi đẹp thế này.</p>\r\n<p>\r\n	- Anh ngủ đi say quá rồi, em đi về.Tuấn kéo Ly lại trong men say Tuấn không nhìn ra Ly một cô gái xấu xí. Tuấn hôn Ly thật nồng nàn. Đèn được tắt đi. Khung cửa sổ bị đóng lại. Họ trao nhau tất cả những ngọt ngào vào đêm đó.</p>\r\n<p>\r\n	- Trời con nhỏ xấu vậy mà mày củng ngủ với nó tao bó tay.</p>\r\n<p>\r\n	- Tao cũng đâu biết say quá không biết mình làm gì nữa.</p>\r\n<p>\r\n	- Mà thật là, tao đang hi vọng mày bỏ nó sớm sớm tao đỡ tốn tiền.</p>\r\n<p>\r\n	- Mơ đi em.</p>\r\n<p>\r\n	- Chia tay đi!</p>\r\n<p>\r\n	- Là sao Tuấn.</p>\r\n<p>\r\n	Ly kéo tay Tuấn lại, Tuấn gạc tay Ly ra:</p>\r\n<p>\r\n	- Anh không yêu em nữa chia tay thì tốt hơn.</p>\r\n<p>\r\n	- Em xin</p>\r\n<p>\r\n	- Không cần xin, bye bé!</p>\r\n<p>\r\n	Tuấn bỏ đi với nụ cười đểu giả chỉ có Ly là gục chân xuống đau lòng, khi yêu cô đã trao tất cả và bây giờ thì cô còn có chi.</p>\r\n<p>\r\n	- Thua tao nhé, chung đi!</p>\r\n<p>\r\n	- Ok! Nhưng trước tiên tao cho mày biết một chuyện.</p>\r\n<p>\r\n	- Chuyện gì?</p>\r\n<p>\r\n	Nhìn theo tay thằng bạn Tuấn nhìn thấy Ly đang dọn dẹp lau chùi bàn ghế trong quán nước.</p>\r\n<p>\r\n	- Con nhỏ này lau chùi, bưng bê mà cho tiền mày xài như nước bó tay</p>\r\n<p>\r\n	Tuấn chợt thấy cái gì đó nhói trong tim khi nhìn thấy một người đàn ông già xấu xí đi ngang và đánh vào mông Ly một cái.</p>\r\n<p>\r\n	- Lão tồi! Tuấn thốt lên tức giận, thằng bạn thân của Tuấn cười:</p>\r\n<p>\r\n	- Mày ghen hả? Nếu nói về tồi mày còn tồi hơn lão, mày ngủ với nó rồi bỏ còn gì</p>\r\n<p>\r\n	Ly bước về trong đêm lụi cụi,dáng đi siêu vẹo như kẻ say rượu khụy chân giữa lòng đường đêm tối khóc nất lên. Tuấn định chạy đến đỡ Ly lên nhưng anh vẫn nấp sau trụ đèn dõi theo. Ly đứng dậy và đi tiếp (không có anh em vẫn có thể bước đi nhưng chỉ là chậm hơn một chút)</p>\r\n<p>\r\n	2 tháng sau.</p>\r\n<p>\r\n	- Mày nghe tin gì chưa ông bố trẻ?</p>\r\n<p>\r\n	Tuấn vừa đi Thái về đặt phịch chiếc ba lô xuống:</p>\r\n<p>\r\n	- Cái gì?</p>\r\n<p>\r\n	- Ly có thai đội áo rồi, mày sướng nhé!</p>\r\n<p>\r\n	- Cái gì!</p>\r\n<p>\r\n	Nửa năm sau.</p>\r\n<p>\r\n	- Ly nhập viện rồi, sắp sinh con.</p>\r\n<p>\r\n	- Cái gì?</p>\r\n<p>\r\n	- Lại là cái gì mày không hiểu con nhỏ có thai thì phải sinh con à!</p>\r\n<p>\r\n	- Tao không biết!</p>\r\n<p>\r\n	- Tùy mày thôi!</p>\r\n<p>\r\n	- Nhưng bệnh viện nào.</p>\r\n<p>\r\n	- Chúng tôi chỉ giữ được đứa bé còn mẹ thì chúng tôi xin lỗi.</p>\r\n<p>\r\n	Hoa bạn thân Ly đứng lên:</p>\r\n<p>\r\n	- Tại sao? Bác sĩ à giúp bạn tôi nó còn trẻ lắm!</p>\r\n<p>\r\n	Hoa khóc nất lên, khụy chân xuống. Một bó hoa rơi xuống, một con người khụy chân xuống. Tuấn gục đầu vào tường khóc</p>\r\n<p>\r\n	Tuấn đi Thái mua cho Ly một cái áo, không hiểu sao nhưng khi đi anh luôn nghĩ đến hình bóng Ly, anh muốn xin lỗi nhưng không còn can đảm “bà mẹ có lẻ đã làm việc quá sức khi mang thai,nên cô ấy không vượt qua”. Tuấn hận bản than mình, Tuấn xin Hoa cho anh được chăm sóc con, Hoa từ chối nhưng anh vẫn kiên quyết và thành công. Nhìn vào đôi mắt to tròn của đứa bé gái Tuấn thì thầm:</p>\r\n<p>\r\n	- Tịnh Yến à, yên bình và hạnh phúc ba sẽ đặt tên con là Tịnh Yến nhé! Mẹ con thích vậy mà. Cúi xuống hôn lên trán con:</p>\r\n<p>\r\n	- Cha yêu con và yêu mẹ con lắm Trên trời một thiên thần nhìn xuống mỉm cười.”Ly à! Anh xin lỗi nhé, anh yêu em nhưng không nhận ra…anh hối hận lắm”</p>\r\n<p >\r\n	<strong>Sưu tầm</strong></p>\r\n         ', 'images/stories/2020/08/original/minh-se-dat-ten-con-la-gi.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'minh-se-dat-ten-con-la-gi', NULL, NULL, NULL, '2020-08-20 00:38:54', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/140-anh-a-minh-se-dat-ten-con-la-gi.html'),
(9, 'Anh sẽ đến ...', 'Rồi con bé cứ lao đao chao đảo vì buồn 1 cách không tên, Quang cứ tíu tít, Quang cứ đến rồi đi để lại hụt hẫng, Những cuộc điện thoại,những lời yêu thương tan nhanh vào đêm để lại trong Hân những thổn thức mong đợi, con bé đa sầu, đa diện cảm xúc.', '\r\n        	<p><strong>Rồi con bé cứ lao đao chao đảo vì buồn 1 cách không tên, Quang cứ tíu tít, Quang cứ đến rồi đi để lại hụt hẫng, Những cuộc điện thoại,những lời yêu thương tan nhanh vào đêm để lại trong Hân những thổn thức mong đợi, con bé đa sầu, đa diện cảm xúc.</strong></p>\r\n<p >***</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/wallpaper-holiday-3-giaoduc.jpg\"  /></p>\r\n<p >&nbsp;</p>\r\n<p>Chẳng hiểu tại sao tâm trạng buồn 1 chút là ai đó sẵn sàng dìm mình vào cơn mưa, tại sao khi lòng đứt đoạn lại thêm mưa làm chi cho tình cảh thêm oan trái, Hân chỉ muốn thử cảm giác giữa đông mà dầm mưa thì sẽ như thế nào, Cô ghét mưa nhưng rồi lại đang hoà vào nó, tìm 1 cảm giác lạnh đông cứng, rồi quên, Quên việc phải yêu cái người luôn chỉ biết yêu mình cô như thế nào cho đúng, cho đỡ đau.&nbsp;</p>\r\n<p>Hân đi ngược dòng người dưới cơn mưa…</p>\r\n<p>Cơn mưa vội vã đổ xuống con phố bên quán cóc nhỏ ven đường khiến Hân cô đơn khó hiểu, cô bé cô đơn trong chính tình yêu của mình,cô đơn trong mọi cuộc vui, và cô đơn mọi lúc.</p>\r\n<p>Chẳng hiểu tại sao tâm trạng buồn 1 chút là ai đó sẵn sàng dìm mình vào cơn mưa, tại sao khi lòng đứt đoạn lại thêm mưa làm chi cho tình cảh thêm oan trái, Hân chỉ muốn thử cảm giác giữa đông mà dầm mưa thì sẽ như thế nào, Cô ghét mưa nhưng rồi lại đang hoà vào nó, tìm 1 cảm giác lạnh đông cứng, rồi quên, Quên việc phải yêu cái người luôn chỉ biết yêu mình cô như thế nào cho đúng, cho đỡ đau.</p>\r\n<p>Lạ quá, Hân rất yêu Quang và không ai phủ nhận điều ngược lại, Rằng Quang chưa bao giờ nghĩ sẽ làm Hân tổn thương dù chỉ 1 chút, anh đã chỉ biết yêu có 1 mình Hân.</p>\r\n<p>Nhưng rồi sao,Việc ai đó luôn chỉ yêu 1 ai đó, Là chỉ yêu người đó thôi, liệu đã đủ chưa.</p>\r\n<p>Hân thấy luôn thiếu hụt gì đó đến khát khao mà nó không tài nào có thể kể tên để 1 lần cho Quang hiểu cái cảm giác ấy..</p>\r\n<p>- Này, em đã đi taxi về chưa?</p>\r\n<p>- Em đang tắm mưa..</p>\r\n<p>- Ơ, em không đi taxi về mà lang thang mưa gió làm gì?</p>\r\n<p>- Anh không muốn biết em đang ở đâu à ?</p>\r\n<p>- Em ở đâu thì cũng bắt taxi về ngay đây cho anh</p>\r\n<p>- Anh không muốn đến đón em về sao ?</p>\r\n<p>- (im lặng) … ừ … (im lặng) …, thế (do dự) e đang ở đâu?</p>\r\n<p>- Anh sẽ đến ngay hả?</p>\r\n<p>- Em tìm tạm chỗ nào trú rồi anh đến đón.</p>\r\n<p>- Em chỉ muốn nghe câu ANH SẼ ĐẾN NGAY thôi!</p>\r\n<p>- Em sao vậy, ???</p>\r\n<p>- Không sao đâu … em đi taxi về đây, anh đừng lo!</p>\r\n<p><img alt=\"\" border=\"0\" src=\"/uploaded/images/stories/2020/08/anh-se-den.jpg\"  /></p>\r\n<p>Chỉ là Hân muốn Quang nói SẼ ĐẾN NGAY – dù là không thể ngay được nhưng ít ra Hân biết Quang đang thật sự sẽ tới ngay, đang thật sự muốn chạy đến bên mình ngay, chỉ thế thôi,tình yêu nhỏ nhoi có thế thôi, Hân đợi chờ nhiều quá rồi đúng không?</p>\r\n<p>Một câu nói khó quá đúng không, Quang sợ không đến ngay được nên không dám nói, rồi Quang quên, câu nói đó không phải là 1 lời hứa, nó đơn giản lắm,chỉ là 1 liệu pháp ổn định tâm lí đối phương, chỉ là cách cho Hân hiểu rằng: Anh luôn ở đây gần em lắm, em đừng lo.</p>\r\n<p>Rồi con bé cứ lao đao chao đảo vì buồn 1 cách không tên, Quang cứ tíu tít, Quang cứ đến rồi đi để lại hụt hẫng, Những cuộc điện thoại,những lời yêu thương tan nhanh vào đêm để lại trong Hân những thổn thức mong đợi, con bé đa sầu, đa diện cảm xúc.</p>\r\n<p>Quang luôn yêu thương nó quá đà rồi lại lơ là 1 cách quá đáng, trái tim nó cứ hạnh phúc tột cùng rồi vô tình rơi vội bên lề tình yêu của 2 đứa.</p>\r\n<p>- Em ăn uống gì chưa hả?</p>\r\n<p>- Em ăn rồi mà..</p>\r\n<p>- Thế em đang làm cái gì mà giờ mới chịu nghe máy?</p>\r\n<p>- Em đang thấy buồn..</p>\r\n<p>- Em có anh rồi mà sao cứ kêu buồn thế?</p>\r\n<p>- Ừmmm, anh có thấy lạ không? (sụt sịt)</p>\r\n<p>- Em ngạt mũi đấy à?</p>\r\n<p>- Em khóc đấy..</p>\r\n<p>- Ô hay sao lại khóc?</p>\r\n<p>- Bố mẹ em cãi nhau suốt, em thấy tủi thân!</p>\r\n<p>- Thôi bố mẹ cãi nhau là chuyện bình thường,em đừng buồn làm gì nhé!</p>\r\n\r\n\r\n\r\n\r\n\r\n			<p>- Em có thể mượn vai anh được không ???</p>\r\n<p>- Anh có ở đấy đâu mà mượn …</p>\r\n<p>- Anh nói ANH SẼ ĐẾN NGAY đi …</p>\r\n<p>- Ờ, nhưng mà anh đến ngay làm sao được..</p>\r\n<p>- Ừm, vậy em không khóc nữa..</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/love.jpg\" /></p>\r\n<p>Hân ước ao 1 câu nói dù chỉ là nói cho có ấy sẽ mang bờ vai vô hình của Quang đến nhưng không được, Nó dựa đầu vào bức tường lạnh ngắt,nước mắt cứ rơi ào ạt thắt lại ở ngực, đau đớn ở tim, nó lau nước mắt đặt tay lên tường, gượng cười như đang hạnh phúc lắm khi bức tường đó là lồng ngực ấm áp của anh..</p>\r\n<p>Khó quá, anh yêu nó những lúc vui, đến bên nó khi anh cần, và vô tình quên là nó cũng có lúc cần anh những khi anh có thể, giờ nó hiểu, khát khao của nó chỉ là những lúc nó tha thiết cần anh, anh sẽ đến ngay bên nó,chỉ 1 câu nói vô tri – nó cũng yên lòng tin vào điều đó.</p>\r\n<p>Gió lạnh lùa qua cánh cửa mở hé..</p>\r\n<p>Tiếng con bé thút thít qua điện thoại!</p>\r\n<p>Thi thoảng lại lau nước mắt, thi thoảng lại ghìm giọng, thi thoảng lại thở nhẹ …</p>\r\n<p>Nó ngồi co ro bên 1 góc phòng tối, Hôm nay nó cần anh nhiều lắm, mới hôm qua còn quấn quýt bên anh cười toe, nhưng hôm nay nó lại khóc như chưa bao giờ được hạnh phúc như thế,thi thoảng nó lại hít 1 hơi thật sâu rồi khóc bật ra không thành tiếng, Hình như nó đau đớn quá chừng..</p>\r\n<p>- Em lại khóc rồi..</p>\r\n<p>- Em buồn mà, em chỉ biết có khóc thôi</p>\r\n<p>- Những lúc anh không ở bên em thì em lại khóc lóc thế</p>\r\n<p>- Bố mẹ em bỏ nhau rồi …</p>\r\n<p>- (im lặng) … thế à, sao lại vậy?</p>\r\n<p>- Thì, họ không yêu nhau nữa..không cần em nữa</p>\r\n<p>- Sao lại không cần em, anh cần em lắm mà</p>\r\n<p>- Vậy … anh đến đây được không..</p>\r\n<p>- Thôi em đừng khóc nữa, trời không mưa anh qua với em ngay</p>\r\n<p>- Ừmmm, em biết rồi, em mệt quá</p>\r\n<p>- Em đừng khóc nữa, em đã ăn uống gì chưa?</p>\r\n<p>- Em chưa …</p>\r\n<p>- Em ăn gì vào rồi nằm nghỉ đi.</p>\r\n<p>- Vâng..</p>\r\n<p>- Ừm, thế tí có gì anh gọi điện.</p>\r\n<p>Hân lại lăn lóc 1 mình trong đớn đau ấy, Nó không phải nỗi đau của anh, muốn anh hiểu cho là điều quá khó, muốn anh bên cạnh có lẽ là khó hơn..</p>\r\n<p>- Em đã ăn gì chưa đấy?</p>\r\n<p>- Em vừa ăn rồi..</p>\r\n<p>- Em cho anh đi chơi với bạn tí nhé, bạn anh đến lôi đi..</p>\r\n<p>- Ừmmm, anh đi đi!</p>\r\n<p>- ừm, tí anh gọi điện cho em nhé, Yêu em lắm!</p>\r\n<p>Rồi Quang thấy thế là đủ cho 1 sự an ủi, nó yên tâm để đi chơi, Hân càng hụt hẫng nhiều thêm, con bé nóng sốt người và lả đi vì đói,với tâm trạng đó liệu ai có thể nuốt nổi, con bé khóc, khóc vì bố mẹ khóc vì tủi thân, khóc vì sự vô tâm vô lí của người yêu..</p>\r\n<p>Nó khóc,Khóc đau khóc đớn khóc thành tiếng trong im lặng, trong cô đơn, trong hờn trách.</p>\r\n<p>- Em đã ngủ chưa, anh về rồi</p>\r\n<p>- Anh đi chơi có vui không?</p>\r\n<p>- Hì, vui lắm..</p>\r\n<p>- Ừm..</p>\r\n<p>- Em đỡ mệt chưa?</p>\r\n<p>- Rồi</p>\r\n<p>- Vậy chúng mình đi ngủ nhé!</p>\r\n<p>- Vâng …</p>\r\n<p>>><<</p>\r\n<p>- Anh đang ở đâu?</p>\r\n<p>- Anh đang ở nhà..</p>\r\n<p>- Anh đến chỗ làm đón em được không?</p>\r\n<p>- Anh đang trông nhà cơ, em đi tạm taxi về đi.</p>\r\n<p>- Anh nói anh sẽ đến có được không, em xin anh!</p>\r\n<p>- Anh không đến được mà, không anh đi ngay</p>\r\n<p>- Anh nói sẽ đến đi..</p>\r\n<p>- Ơ em làm sao thế?</p>\r\n<p>- Nếu không, Em sẽ bỏ anh..</p>\r\n<p>- Em hấp à, mỗi thế bỏ gì mà bỏ?</p>\r\n<p>…</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Những tiếng điện thoại trong vô vọng.</p>\r\n<p>Quang không thấy tiếng hồi âm.</p>\r\n<p>Chắc Hân lại giận rồi..</p>\r\n<p>Như mọi khi Quang vẫn kệ, Nó nhắn tin chúc Hân ngủ ngon, như mọi lần đến hôm sau Hân sẽ hết giận ngay, Quang chỉ cần đến tíu tít bên Hân làm Hân cười là mọi chuyện sẽ ổn..</p>\r\n<p>Rồi hôm đó, chiều dài trên con đường tan sở,Quang vẫn không nhận được tin nhắn hồi âm, đến bãi đỗ xe, Quang gọi điện để tiện sẽ qua với Hân luôn, Tiếng chuông dài hồi lâu..</p>\r\n<p>Đầu dây nhấc máy trong yên lặng…</p>\r\n<p>- Sao em không nghe máy thế?</p>\r\n<p>- Cháu là ai đấy?</p>\r\n<p>- Dạ, cháu Quang đây ak, Hân đâu bác?</p>\r\n<p>- Ôi cháu ơi, sao hôm qua cháu không đến đón Hân?</p>\r\n<p>- Có chuyện gì thế bác?</p>\r\n<p>- Hân nó chết rồi!</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/matna.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>Chết rồi, Như không vậy, Quang có đến ngay được không, Quang cũng chết lặng rồi còn đâu, đó là trò đùa thôi, Bác ấy đùa thôi, Chạy đi tìm Hân đi, chết đâu dễ thế đâu, lao đi thôi, như điên dại Quang chạy đến nhà Hân ngay lập tức..</p>\r\n<p>Nhà Hân đông lắm, bạn bè đang ngồi ngoài cửa đứa nào đứa nấy khóc ngẹn lời, Tiếng mẹ Hân gào lên trong tay vẫn cầm điện thoại dơ về phía tấm ảnh khuôn mặt tươi sáng của Hân, nụ cười còn chưa tắt sao hơi thở Hân đã tắt..</p>\r\n<p>- Con ơi, Quang nó gọi còn rồi này, con dậy mà nghe đi</p>\r\n<p>Tan nát hết lòng Quang, tại sao lại như thế này chứ.. 1 đứa con trai đột nhiên lay tay Quang trong khi mắt cũng đỏ hoe giọng lạc đi vì khóc..</p>\r\n<p>- Sao anh không đến đón Hân sáng hôm qua?</p>\r\n\r\n\r\n\r\n					\r\n\r\n		<p>- Anh, anh, lúc ấy anh..</p>\r\n<p>- Sao cả ngay hôm qua anh cũng không đến?</p>\r\n<p>- Anh không biết gì cả, anh…</p>\r\n<p>- Hân nó nói đúng anh biết không?</p>\r\n<p>- (nước mắt Quang rơi nhiều đến nỗi nó không thể nói nổi gì nữa)</p>\r\n<p>- Em hỏi nó anh có đến đón không, nó bảo bao giờ nó chết là lúc anh sẽ đến, Bố mẹ nó không kiềm chế được túm lấy áo Quang rồi phát điên lên..</p>\r\n<p>- Bạn sao thế, chỉ là Hân qua đường không để ý thôi mà…</p>\r\n<p>- Vì sao mà Hân không để ý chứ, không phải vì thằng này sao?</p>\r\n<p>Tất cả ầm ĩ chỉ vì sự xuất hiện của Quang,Mọi người dường như đều đổ hết lỗi đấy cho Quang, Quang bị đẩy ra ngoài, nó gục gối xuống đất, Đôi chân nó rã rời, Hân đã khiến nó trả giá quá đắt, Hân đã biết cách rời bỏ Quang 1 cách cay nghiệt nhất..</p>\r\n<p>Tiếng điện thoại trong túi Quang reo lên 1 mail đến..</p>\r\n<p>“ Từ giờ, lúc nào anh cần đến em, Em sẽ không bao giờ đến nữa đâu, Anh à, Em sẽ bỏ anh “</p>\r\n<p>Chiếc điện thoại rơi xuống đất, 1 đôi mắt nhắm lại còn 1 đôi mắt vô hồn rơi nước mắt!</p>         ', 'images/stories/2020/08/original/anh-se-den.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'anh-se-den', NULL, NULL, NULL, '2020-08-20 00:38:56', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/143-anh-se-den.html'),
(10, 'Hẹn hò và… yêu', 'Tặng anh chàng Song Ngư với tình yêu say đắm, đã níu giữ được sự lửng lơ của một cô nàng Bảo Bình.', '\r\n        	<p><strong>Tặng anh chàng Song Ngư với tình yêu say đắm, đã níu giữ được sự lửng lơ của một cô nàng Bảo Bình.</strong></p>\r\n<p >&nbsp;***</p>\r\n\r\n\r\n\r\n\r\n\r\n			<p>Tôi chưa bao giờ thích thú và tin tưởng vào những cuộc gặp gỡ giữa một người con trai và một người con gái qua lời kể không thật thà của một người thứ ba. Tôi nghĩ người ta chỉ có thể yêu qua những hoàn cảnh và điều kiện nhất định, tiếp xúc nhiều và đủ hiểu về nhau.</p>\r\n<p>Chỉ qua những câu chuyện thoáng chốc tại quán café hay vài nơi hò hẹn, vậy thì ta yêu điều gì? Yêu những khoảnh khắc có một người kề bên? Thật chẳng giống người ta nói về tình yêu là việc thương yêu tất cả mọi điều của một người nào đó.</p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</div>         ', '', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'hen-ho-va-yeu', NULL, NULL, NULL, '2020-08-20 00:38:56', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/142-hen-ho-va-yeu.html');
INSERT INTO `fs_stories` (`id`, `title`, `summary`, `content`, `image`, `tags`, `category_id`, `category_alias`, `category_name`, `category_id_wrapper`, `category_alias_wrapper`, `category_icon`, `alias`, `creator`, `source_website`, `new_date`, `created_time`, `updated_time`, `editor`, `show_in_homepage`, `hits`, `published`, `ordering`, `title_display`, `display_title`, `display_column`, `tags_group`, `rating_count`, `rating_sum`, `keywords`, `hot`, `seo_title`, `seo_keyword`, `seo_description`, `lang`, `source`) VALUES
(11, 'Ngày hoa hướng dương', '\"Anh nghĩ rất nhiều, nhưng chẳng cái gì ra cái gì cả. Anh thấy hai đứa mình xa lạ với nhau quá. Em không quan tâm gì đến hoa hướng dương, trong khi đầu óc anh thì cứ cuồng loạn vì nó. Nhưng rồi khi em kể về chuyện mấy cái ghế đá, thì anh lại nghĩ trên đời này, nếu không có anh thì em biết kể chuyện này với ai đây. Anh chẳng quan tâm đến đám ghế đá trong trường em màu gì, thú thật là vậy. Nhưng anh yêu em.\"', '\r\n        	<p><strong>\"Anh nghĩ rất nhiều, nhưng chẳng cái gì ra cái gì cả. Anh thấy hai đứa mình xa lạ với nhau quá. Em không quan tâm gì đến hoa hướng dương, trong khi đầu óc anh thì cứ cuồng loạn vì nó. Nhưng rồi khi em kể về chuyện mấy cái ghế đá, thì anh lại nghĩ trên đời này, nếu không có anh thì em biết kể chuyện này với ai đây. Anh chẳng quan tâm đến đám ghế đá trong trường em màu gì, thú thật là vậy. Nhưng anh yêu em.\"</strong></p>\r\n<p >***</p>\r\n<p>Khi An bước vào tiệm bánh ngọt ở phố núi, mắt anh như bị hút vào một chi tiết: lọ hoa hướng dương đặt ở chiếc bàn gỗ góc quán.</p>\r\n<p>Có năm bông tất cả, mỗi bông chỉ nhỏ bằng lòng bàn tay, nhụy màu nâu thẫm, cánh nhỏ vàng ươm bung nở. Cành hoa thẳng, to bằng ngón tay, tuyệt nhiên không có lá. Chúng được cắm trong một cốc gốm màu xanh da trời có đi vài đường gân trắng. Chiếc bàn nhỏ làm bằng thứ gỗ đen bóng. Một sự kết hợp màu sắc hài hòa, một chi tiết trang trí giản dị mà làm người ta thấy vừa ngỡ ngàng lại vừa bình yên.</p>\r\n<p>Cô gái phục vụ mang tạp dề đỏ dường như hiểu ý, cười bảo anh \"Hoa trong vườn nhà đó anh\". Anh quay sang mỉm cười, bắt chuyện \"Ồ, sau nhà mình có vườn à?\" \"Dạ, không phải ở đây. Vườn nhà của chị chủ quán ở trên đèo anh à\" \"Ngoài chợ có bán hoa này không em?\" \"Có chứ anh. Anh mua về làm quà à?!\" Cô gái thân thiện hỏi lại. Câu hỏi của anh đã tố cáo anh là du khách.</p>\r\n<p><img src=\"/uploaded/images/stories/2020/08/huongduong.jpg\"   alt=\"huongduong\"  /></p>\r\n<p>Anh chọn mua vài chiếc bánh ngọt cho chuyến đi vào rừng. Trước khi rời khỏi tiệm bánh, anh ngoái nhìn bình hoa vàng một lần nữa. Có cái gì như là sự mê hoặc tỏa ra từ năm bông hoa tươi mới, rực rỡ này.<br />Quỳnh, vợ mới cưới của anh đang ngồi ngay ngắn bên cạnh ghế lái. Cô hôm nay trông thật khỏe khoắn trong bộ đồ thể thao xám nhạt viền xanh, giày cao cổ gọn gàng.</p>\r\n<p>Thường ngày, Quỳnh luôn mặc váy. Lúc nào cô cũng thướt tha guộc gầy, khiến cho người xung quanh bao giờ cũng có cảm giác rình rập của sự gãy đổ. Nước da cô trắng xanh nhìn rất yếu đuối. An nhớ như in ngày anh dẫn cô về nhà, mẹ anh cứ hỏi \"Hình như cô bé này hay đau ốm lắm phải không con?\"</p>\r\n<p>Sự thật là Quỳnh chẳng đau ốm gì cả. \"Tạng người của em nó vậy!\" Cô giải thích. Cô bơi và đánh tennis thường xuyên. Lúc nào cô cũng chê anh to cao vậy mà yếu xìu. Đúng thế thật, anh chỉ vướng một trận mưa thôi đã cảm, hắt hơi sổ mũi om xòm. Còn Quỳnh, ít khi cô bị ốm vặt. Đôi khi anh và cô thường đùa nhau, trời cho cô cái vóc dáng tội nghiệp ấy để cô dễ bề \"lừa đảo\" thiên hạ. Người ta – một cách vô thức – nương nhẹ, cẩn trọng khi tiếp xúc với cô. Như thể đang bưng một cây nến leo lét, nếu thở mạnh thì sẽ tắt phụt ngay.</p>\r\n<p>Anh để túi bánh cạnh mấy chai nước suối, lấy chiếc mũ rộng vành từ băng sau chụp lên đầu vợ. Cô tròn mắt nhìn anh \"Em muốn rám nắng một chút mà!\" Anh cười, vặn chìa khóa, nổ máy xe \"Không hiểu sao anh cứ lo là mặt trời sẽ xuyên thấu qua em mất\" Cô chồm lên hôn má anh. Rồi họ chạy ra ngoại thành.</p>\r\n<p>Con đường một bên là hồ, một bên là rừng thông nằm êm đềm trong ngày đầu thu nắng nhẹ. Quỳnh gỡ kính mát ra, nheo nheo mắt. Cô muốn nhìn rõ màu thật của cảnh vật chung quanh. Đeo kính, như cô nói, luôn mang lại cảm giác xem ảnh đã qua chỉnh sửa. \"Anh, sao không thấy hoa quỳ?\" Cô chợt hỏi. \"Mới đầu thu mà em. Đến mùa đông mới có hoa quỳ. Người ta gọi nó là hoa báo đông\" \"À, vậy mà em cứ tưởng nó nở quanh năm chứ\".</p>\r\n<p>Quỳnh luôn làm người ta ngạc nhiên. Cô có thể đọc được vanh vách đến hai mươi ba chữ số sau dấu phẩy của số pi, nhưng không thể phân biệt được cây gì với cây gì. Kiểu vậy. Hay là nếu ta bắt đầu đếm sao trên trời với vận tốc 1 phút 1 ngôi sao, thì sau bao lâu sẽ đếm xong, Quỳnh biết rõ. Nhưng cô không thể nào biết tại sao người ta lại phải sơn gốc cây cho trắng hếu cả lên. (Để phòng sâu bệnh đấy, trong trường hợp bạn cũng không biết) Và tất nhiên cô không biết là ở ngoài Trung, dù là chị hay em của mẹ cũng kêu bằng dì hết. Những chi tiết đại loại như vậy đối với cô rất lạ kỳ, mới mẻ và cô luôn ghi nhận chúng một cách thích thú.</p>\r\n\r\n\r\n\r\n\r\n\r\n			<p>Và anh, như một định mệnh, trở thành chồng cô để giải đáp cho cô những điều đó. Cái tập hợp những thứ anh và Quỳnh biết dường như không giao nhau. Họ chưa bao giờ thôi bất ngờ về nhau.</p>\r\n<p>\"Em, sáng nay anh thấy năm bông hoa hướng dương cắm trong một cái ly gốm màu xanh da trời\" Anh bảo Quỳnh. \"Dạ\" Cô thờ ơ. Anh cố gắng bám víu vào câu chuyện. \"Nhìn đẹp lắm em à!\" \"Dạ\" Cô lặp lại, vẫn nhịp điệu như thế. \"Em không quan tâm đến hoa hướng dương hả?\" Anh quay sang vợ, ngạc nhiên. Anh tưởng cô quan tâm đến hoa quỳ, thì phải quan tâm đến hướng dương chứ.</p>\r\n<p>Cô nhìn anh ngỡ ngàng, hỏi lại \"Anh thích hoa hướng dương lắm sao?\" Bỗng nhiên anh thần người ra. Mình thích hoa hướng dương lắm sao? Lâu nay anh đâu có quan tâm gì đến chuyện hoa hoét. Sao tự nhiên hôm nay bình hoa nọ lại ám ảnh anh lâu vậy? \"Không. Đâu có.\" Anh lắc đầu, cũng không biết mình đang nghĩ gì nữa. Quỳnh nhìn anh lạ lùng hồi lâu, rồi cô lại dán mắt vào con đường trước mặt.</p>\r\n<p>Chẳng hiểu sao, suốt buổi picnic trong rừng hôm đó, anh và cô im lặng đến ngột ngạt. Họ chỉ trao đổi những câu thiết yếu nhất. Cô lặng yên gọt táo, anh lặng yên quét mứt cam và bơ lên bánh mì. Đến khi cô bật nhạc bằng cái loa nhỏ mang theo, thì họ dường như không mở miệng ra nói nữa.</p>\r\n<p>Anh nhìn xuống đồi thông xanh mướt, mặt hồ lấp loáng nắng, cố gắng nghĩ xem mình đang nghĩ gì. Nhưng anh không thể nắm bắt được. Ý nghĩ cứ chuồi khỏi tầm kiểm soát của anh như một con cá da trơn ướt. Anh tập trung nghe lời Beatles đang hát. Họ hát về đồng dâu, chiếc tàu ngầm màu vàng, con chim đen, về căn nhà gỗ Nauy... Thằng trong bài \"Gỗ Nauy\" đã đốt nhà khi sáng thức dậy không thấy người yêu đâu. Thằng này khiếp thật chứ! Anh băn khoăn không biết khi châm lửa đốt, thằng đó có đứng luôn trong nhà không, hay là ra ngoài rồi mới búng que diêm cháy vào.</p>\r\n<p>Anh định nói điều đó cho Quỳnh nghe, nhưng khi anh quay sang, Quỳnh đã úp chiếc nón cói rộng vành lên mặt. Hình như cô đã ngủ rồi. Anh ngắm nhìn cô gái mà đến bây giờ, anh vẫn không khỏi ngạc nhiên vì nàng đã là vợ mình hồi lâu. Rồi anh nâng nhẹ bàn tay cô lên, áp môi vào đó nhẹ nhàng. Cô vẫn nằm im lìm, thở đều đặn. Bỗng dưng anh thấy sao mà họ xa lạ với nhau quá chừng. Chưa bao giờ xa lạ như thế.</p>\r\n<p>Anh nhớ đến người yêu đầu tiên, hồi vừa tốt nghiệp đại học. Cô ấy không xinh đẹp, nhưng lúc nào cũng đem cho người đối diện một cảm giác rất tươi mới. Họ quen nhau một năm, hay hơn gì đó, rồi cô tạm biệt anh sang Nhật du học.</p>\r\n<p>Như những người lớn thực tế, anh và cô đều hiểu chuyến ra đi của cô là sự kết thúc. Nhưng anh không buồn, hai người cũng không nói nhiều về việc ấy. Anh đưa cô ra sân bay, họ ôm nhau dịu dàng, rồi cô đi. Chính lúc đó anh mới mơ hồ nhận ra, mình không gắn bó với cô gái này đậm sâu như mình tưởng. Anh nhìn cô bước ra khỏi đời anh cũng thản nhiên như nhìn một ngày mưa, hay là cái cốc vỡ. Chúng làm anh xáo động chút ít. Nhưng chỉ vậy thôi. Rồi anh cũng phải đi tiếp, dù là trời mưa hay cốc vỡ.</p>\r\n<p>Anh tu một ngụm nước rồi đứng dậy mở cửa xe, lấy điện thoại đang cắm sạc. Màn hình hiển thị thông báo có email mới. Từ cô ấy, cô người yêu cũ đang sống ở Nhật. Thỉnh thoảng cô vẫn email về cho anh hỏi thăm và kể vài câu chuyện về cô. Cô đang làm luận án tiến sĩ văn chương Nhật, đề tài là tiểu thuyết cổ đại gì đó. Anh không rành lắm mấy từ chuyên môn trong email của cô viết, nhưng đại khái anh hiểu cô rất hạnh phúc với điều mình đang làm. Vậy là đủ. Trong anh, cô là một cái gì đó rất êm đềm và tin tưởng, luôn như vậy. Và việc biết cô đang ổn thỏa làm anh yên lòng.</p>\r\n<p><em>\"Lúc đọc email anh thông báo đám cưới, em rất muốn gọi ngay cho anh. Em muốn hỏi vợ anh là người như thế nào, làm gì, có xinh không. Đại loại vậy. Rồi em nghĩ sao mà mình vô duyên quá, nên đã cố gắng không liên lạc gì với anh kể từ hôm đó. Giờ thì em nghĩ em đã điều khiển được sự tò mò của mình rồi.</em></p>\r\n<p><em>Vậy là anh đã lập gia đình. Em cố gắng hình dung ra anh trong vai trò của một ông chồng. Không biết anh có giúp vợ rửa chén không, có cùng vợ đi siêu thị không. Nhưng hình ảnh đó quá xa lạ với em. Em vẫn chỉ nhớ về anh như một anh chàng độc thân, hàng ngày tan làm chỉ về nhà đọc sách hoặc chúi đầu vào máy tính. Việc có ai đó đột nhiên gắn bó với cuộc sống của anh, thú thật, vẫn làm em ngơ ngác.</em></p>\r\n<p><em>Mấy ngày gần đây em đi làm tình nguyện viên ở Fukushima cùng với sinh viên trong trường. Anh biết tụi em làm gì không? Trồng hoa hướng dương. Mỗi người được phát một túi hạt giống. Người dân thì trồng trong vườn nhà, trong chậu cảnh, còn tình nguyện viên tụi em thì trồng ở những khu đất công. Người ta nói cây hoa hướng dương sẽ khử phóng xạ trong đất.</em></p>\r\n<p><em>Fukushima vẫn còn đầy vết dấu hoang tàn. Nhưng em cứ tưởng tượng mãi về cái cảnh khi hàng ngàn hàng vạn cây hướng dương lớn lên và ra hoa....\"</em></p>\r\n<p><em><img src=\"/uploaded/images/stories/2020/08/huongduong2.jpg\"   alt=\"huongduong2\"  /></em></p>\r\n<p>An lặng người khi đọc những dòng về hoa hướng dương. Giữa họ vẫn còn một sợi dây bí ẩn liên kết, hay chỉ là sự trùng hợp, anh không quan tâm. Anh chỉ đang cố gắng hiểu tại sao trong cùng một ngày, quá nhiều, quá nhiều những bông hoa hướng dương như trăm ngàn mặt trời rực rỡ rơi xuống cuộc đời anh. Anh thấy mình bốc cháy. Anh thấy tro bụi của chính mình. Anh thấy cuộc sống đang chảy trôi trước mắt cuốn mình đi. Anh thấy như thể có cái gì đó thiết yếu nhất trong mình đột nhiên bị rút cạn. Anh thấy hoảng sợ một cách vô lý.</p>\r\n<p>Anh bất chợt nắm bàn tay gầy xanh của Quỳnh, xiết mạnh. Cô bỗng cất tiếng, mặt vẫn giấu dưới cái nón rộng vành. \"Đau em!\" Cô đã thức dậy, hoặc chưa bao giờ ngủ. An nằm xuống bên cạnh, ôm lấy vợ. Anh có cảm giác cô là điều cuối cùng có thể kết nối anh với cuộc sống này. Dù cô chẳng quan tâm gì đến hoa hướng dương cả.</p>\r\n<p>\"Em à, bên Nhật người ta đang trồng hướng dương để khử phóng xạ ở những khu rò rỉ hạt nhân.\" Anh nghe mình cất tiếng nói thì thầm.</p>\r\n<p>\"Trong phóng xạ có chất Xê-si, cũng là thành phần của phân bón. Em đoán hoa hướng dương sẽ hút chất này để lớn lên\" Cô nói, giọng âm vang trong lồng ngực anh. Lại là một điều kì quặc khác mà cô biết.</p>\r\n<p>\"Tự nhiên hôm nay anh gặp thấy và đọc thấy toàn về hoa hướng dương. Đến nỗi anh như bị nó ám ảnh. Kỳ quặc nhỉ?\" Anh nói với vợ.</p>\r\n<p>\"Chẳng sao hết anh à, bình thường thôi. Như hồi đại học, đang ngồi trong lớp Triết bỗng nhiên em cứ muốn đi ra ngoài để xem mấy cái ghế đá trong trường màu gì. Em chẳng hiểu tại sao nữa, chỉ là em muốn kinh khủng. Em nghĩ lúc đó mà thầy không cho em ra ngoài, chắc em tự tử chứ chẳng chơi. Ngay phút đó, việc tụi ghế đá màu gì quan trọng với em kinh lắm. Thế là em khom người chuồn ra khỏi lớp bằng cửa sau. Bọn ghế đá ấy, cái thì màu xanh, cái thì màu đỏ, cái thì màu vàng. Em nói một mình: hóa ra chúng không trùng màu với nhau. Rồi em đi vào lớp.\"</p>\r\n<p>Quỳnh ngừng một lát. Rồi cô khẽ khàng hỏi anh \"Anh có hiểu em đang nói gì không?\"</p>\r\n<p>\"Anh nghĩ là anh hiểu\" Anh trầm tư.</p>\r\n<p>Kiểu như thế, bỗng một ngày người ta đặt tất cả chú ý vào một chi tiết xuất hiện trong đời mình, và thấy nó thật lạ lùng. Họ cố gắng tìm kiếm sự đồng cảm của những người xung quanh về cái chi tiết đó. Nhưng chẳng may nó lại nằm ngoài tầm quan tâm của những người kia. Thế là họ thấy hóa ra họ cô đơn kinh khủng. Anh thầm nghĩ.</p>\r\n<p>\"Vậy, anh nghĩ gì về hoa hướng dương? Nói cho em nghe đi.\" Quỳnh đẩy anh ra, nhìn thẳng vào mắt anh.</p>\r\n\r\n\r\n\r\n					\r\n\r\n		<p>\"Anh nghĩ rất nhiều, nhưng chẳng cái gì ra cái gì cả. Anh thấy hai đứa mình xa lạ với nhau quá. Em không quan tâm gì đến hoa hướng dương, trong khi đầu óc anh thì cứ cuồng loạn vì nó. Nhưng rồi khi em kể về chuyện mấy cái ghế đá, thì anh lại nghĩ trên đời này, nếu không có anh thì em biết kể chuyện này với ai đây. Anh chẳng quan tâm đến đám ghế đá trong trường em màu gì, thú thật là vậy. Nhưng anh yêu em.\" An mỉm cười, nhìn sâu vào mắt vợ.</p>\r\n<p>Lúc đó, một ý thức trong anh hiện lên rất mãnh liệt, rằng cô gái này là người đang chia sẻ cuộc đời cùng anh, trọn vẹn. Dù cô ấy không quan tâm đến hoa hướng dương, và có thể là nhiều điều khác nữa sẽ hiện ra trong đời anh, như những bông hướng dương ngày hôm nay.</p>\r\n<p ><strong>Nguyễn Thiên Ngân</strong></p>         ', 'images/stories/2020/08/original/ngay-hoa-huong-duong.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'ngay-hoa-huong-duong', NULL, NULL, NULL, '2020-08-20 00:39:29', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/264-ngay-hoa-huong-duong.html'),
(12, 'Đừng bao giờ bỏ rơi tình yêu của mình', 'Nếu bạn thực sự yêu một người, đừng rời bỏ người ấy. Không bao giờ rời bỏ. Bởi vì có thể bạn không biết được, tình yêu đó có ý nghĩa thế nào với người ấy đâu. Đôi khi nó có giá của cả một mạng người. Hãy trân trọng và giữ gìn tình yêu của mình. Chiến đấu vì nó. Và bạn sẽ không bao giờ hối hận.', '\r\n        	<p ><strong>Nếu bạn thực sự yêu một người, đừng rời bỏ người ấy. Không bao giờ rời bỏ. Bởi vì có thể bạn không biết được, tình yêu đó có ý nghĩa thế nào với người ấy đâu. Đôi khi nó có giá của cả một mạng người. Hãy trân trọng và giữ gìn tình yêu của mình. Chiến đấu vì nó. Và bạn sẽ không bao giờ hối hận.</strong></p>\r\n<p ><strong>***</strong></p>\r\n<p ><strong><img alt=\"\" src=\"/uploaded/images/stories/2020/08/1-bun.jpg\" /></strong></p>\r\n<p >Câu chuyện bắt đầu với một anh chàng tên Paul và một cô nàng tên Ella. Cả hai đang là sinh viên đại học.</p>\r\n<p >Một ngày hè, cả hai gặp nhau lần đầu tiên trên sân bóng rổ của trường. Ngẫu nhiên, họ được xếp chơi chung một đội. Hôm đó cả hai đều rất vui.</p>\r\n<p >Lúc về, Ella giả vờ hỏi mượn điện thoại của Paul rồi gọi vào máy mình. Thế là cô có số của Paul. Sau đó, Ella gửi tin nhắn cho Paul, giả vờ như mình nhầm số.&nbsp;Paul trả lời lại. Ella lại gửi tiếp tin nhắn khác. Cứ thế, họ nhắn tin qua lại. Từ nhắn tin, họ chuyển qua gọi điện. Từ nói chuyện trên điện thoại, họ hẹn hò gặp nhau. Và rồi tình yêu đến với họ lúc nào không biết. Cả hai những tưởng, họ sẽ ở bên nhau cho đến cuối đời. Tình yêu của họ sẽ là vĩnh cửu.</p>\r\n\r\n\r\n\r\n\r\n\r\n			<p >Nhưng ba má Ella thì không nghĩ vậy. Họ cho rằng Paul không xứng với Ella và rằng chuyện yêu đương nhảm nhí hiện giờ sẽ phá hỏng tương lai tươi sáng của con gái họ.</p>\r\n<p >Ella không đủ mạnh mẽ để chiến đấu với ba má mình. Ella muốn chia tay. Paul không đủ mạnh mẽ để chiến đấu với Ella hòng cứu lấy tình yêu của hai người. Anh chỉ có một lựa chọn duy nhất: để Ella bước khỏi cuộc đời mình. Ella bị buộc đi du học ở nước ngoài. Vậy là hai người mất luôn liên lạc.</p>\r\n<p >Đau đớn thật đó. Nhưng rồi mọi chuyện cũng qua.</p>\r\n<p >Năm năm sau, lúc này cả hai người đều đã trưởng thành và tự lập, Ella vẫn còn độc thân và Paul thì có người yêu khác, Mary. Nhưng sâu thẳm tâm hồn, Paul chỉ yêu duy nhất một mình Ella thôi. Chỉ là, anh không có cơ hội để nói với cô điều đó.</p>\r\n<p >Một lần, đang cùng Mary dạo phố, Paul vô tình trông thấy Ella. Cô thật sự chỉ đứng phía bên kia đường thôi. Chỉ cách anh có một sải chân. Trái tim anh như ngừng đập. Thật sự không rõ bản thân đang làm gì nữa, anh vùng người chạy băng qua đường, bỏ mặc Mary ở lại phía sau. Bần thần và ngơ ngẩn, anh đã không nhìn thấy một chiếc xe tải đang chạy tới.</p>\r\n<p >Lúc Mary hét lên kinh hoàng cũng là lúc Ella quay người nhìn lại. Cô nhận ra khuôn mặt ấy, ánh mắt ấy. Trái tim cô cũng như ngừng đập.</p>\r\n<p >Ella nhào vào đám đông đang tụ tập. Paul vẫn còn thở. Bên cạnh anh lúc này là Mary, đang nói trong nghẹn ngào: \"Paul, anh không được bỏ cuộc... hãy gọi tên em, hãy gọi 100 lần, 1000 ngàn lần... được không anh? Đừng ngừng lại, gọi tên em... đừng nhắm mắt, anh... mở mắt ra nào và hãy gọi tên em...\"</p>\r\n<p >Paul được đưa đến bệnh viện. Cả Mary và Ella đều đi theo. Họ không biết nhau. Mỗi người đứng một góc, cúi đầu cầu nguyện.</p>\r\n<p >Vị bác sĩ trở ra, đứng trước mặt Mary và nói: \"Cô Ella, chúng tôi xin lỗi, anh ấy đã bỏ cuộc sau khi gọi tên cô được 157 lần. Chúng tôi đã cố gắng hết sức.\"</p>\r\n<p >Mary gục người khóc nức nở, cô không quan tâm đến chuyện vị bác sĩ ấy đã gọi nhầm tên.</p>\r\n<p >Chỉ có Ella, người run rẩy quỵ ngã nơi góc phòng là thấu hiểu. Cô biết tại sao Paul ngừng lại ở lần thứ 157. Bởi vì đó là ngày họ chia tay nhau. Ngày 15 tháng 7. Năm năm, cô đã bỏ rơi tình yêu của mình đến 5 năm. Và bây giờ nỗi đau gấp ngàn lần ngày trước đang quật vào tim cô. Đau đớn.</p>\r\n\r\n\r\n\r\n					\r\n\r\n		<p >Nếu bạn thực sự yêu một người, đừng rời bỏ người ấy. Không bao giờ rời bỏ. Bởi vì có thể bạn không biết được, tình yêu đó có ý nghĩa thế nào với người ấy đâu. Đôi khi nó có giá của cả một mạng người. Hãy trân trọng và giữ gìn tình yêu của mình. Chiến đấu vì nó. Và bạn sẽ không bao giờ hối hận.</p>         ', 'images/stories/2020/08/original/dung-bao-gio-bo-roi-tinh-yeu-cua-minh.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'dung-bao-gio-bo-roi-tinh-yeu-cua-minh', NULL, NULL, NULL, '2020-08-20 00:39:31', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/254-dung-bao-gio-bo-doi-tinh-yeu-cua-minh.html'),
(13, 'Ngày cuối cùng bị mất', 'Tôi nghĩ về những đường thẳng chạy chéo trong không gian. Dù tôi có gặp lại Rei cả trăm lần, yêu cô cả trăm lần, thì cũng sẽ làm tổn thương và chia tay cô cả trăm lần đó. Chỉ cùng một lí do. Có lẽ tôi và cô yêu nhau, nhưng không ở cạnh nhau mãi được. Chẳng phải ngang trái cuộc đời gì, chỉ là do lựa chọn của mỗi người, và yêu nhau không đủ để thay đổi bản ngã vốn có.', '\r\n        	<p><strong>Tôi nghĩ về những đường thẳng chạy chéo trong không gian. Dù tôi có gặp lại Rei cả trăm lần, yêu cô cả trăm lần, thì cũng sẽ làm tổn thương và chia tay cô cả trăm lần đó. Chỉ cùng một lí do. Có lẽ tôi và cô yêu nhau, nhưng không ở cạnh nhau mãi được. Chẳng phải ngang trái cuộc đời gì, chỉ là do lựa chọn của mỗi người, và yêu nhau không đủ để thay đổi bản ngã vốn có.</strong></p>\r\n<p ><strong>***</strong></p>\r\n<p><strong>1. Cửa sổ gió</strong></p>\r\n<p>Rei trở lại vào một ngày tháng Tư.</p>\r\n<p>Là một ngày tôi cặm cụi với ipad để duyệt nốt kịch bản phim cho một quảng cáo ngân hàng, với cốc café vơi hơn nửa đã nguội. Trời đổ dần màu tối, in mảng lên nhà thờ chìm sau dãy lá xanh non ngoài cửa sổ.</p>\r\n<p>Gió thổi mát nhẹ như đền bù cho cả ngày nóng chuyển mùa nắng cớm nhạt. Tôi ngước lên, và thấy tấm lưng của Rei. Không nhầm lẫn đi đâu được, vẫn bờ vai nhỏ ấy, chiếc áo cardigan màu navy ấy, và đặc biệt mái tóc buông lơi tự nhiên xoăn những lọn nhỏ nâu nhạt không níu giữ. Tôi mấp máy gọi tên cô. Rei không nghe thấy. Đã bao nhiêu lâu rồi nhỉ?</p>\r\n<p>Gấp ipad lại, tôi nhấp nốt ngụm café cuối, thả lưng vào ghế sofa êm bọc màu cát, nhìn Rei chăm chú, cố lục lại yêu thương từ một miền cũ kỹ. Rei ngồi bên cửa sổ to màu xanh nhạt như balcony, tựa tay vươn cổ trắng nhỏ ra bên ngoài. Cô từng rất thích những ngày gió. Và nghe nhạc.</p>\r\n<p >&nbsp;Tôi hơi nghiêng đầu. Không còn sợi earphones màu mè nữa, chỉ còn hai sợi dây trắng mảnh dẫn đến chiếc máy nghe nhạc màu đen trên bàn. Tôi bật cười. Rei cũng không nghe thấy, cũng chẳng cảm thấy tôi nhìn cô phía sau. Cô ngay trước mắt, mà nỗi nhớ cứ hiện về. Nỗi nhớ quánh đặc cả không khí, tưởng như những âm thanh bất tận từ chiếc tai nghe nhỏ rỉ ra sẽ trở thành những dòng nước buồn thấy được.</p>\r\n<p >Trời thì gió, nhưng tôi thì bất động. Đã bao lâu rồi nhỉ?</p>\r\n<p><img src=\"/uploaded/images/stories/2020/08/ngaycuoicung2.jpg\"   alt=\"ngaycuoicung2\"  /></p>\r\n<p>Trên bàn Rei còn có một quyển sách và một cốc smoothie màu đỏ tím. Ngón tay cô gõ nhẹ lên bàn thảnh thơi. Chẳng có vẻ gì là chờ đợi. Có lẽ cô ấy đến đây một mình. Vào một ngày đẹp trời, người ta cũng có hứng thú tận hưởng cuộc sống một mình lắm chứ. Nhưng chắc chắn Rei phải nhìn thấy tôi, hoặc nhận dạng ra tôi, hoặc là phải có một tí gì trong tiềm thức là có người ngồi ở góc sofa cạnh cửa sổ có dáng giống như một người cô đã từng quen biết chứ. Chưa nói đến là chúng tôi đã từng yêu nhau. Tại sao cô không cất tiếng gọi, tại sao cô không đơn giản là kéo ghế ra, ngồi trước mặt tôi và lẳng lặng ngắm nhìn tôi làm việc như ngày xưa vẫn thế? Và tại sao tôi không đứng lên, đi đến chỗ cô cho đến khi cô nhận ra, ngước mắt ngỡ ngàng và mỉm cười trong ánh sáng cuối ngày? Mọi thứ có thay đổi gì đâu. Lần cuối gặp cô cũng chẳng phải là chia tay. Nhưng chúng tôi không gặp nhau nữa.</p>\r\n<p>Nghĩ về Rei, tôi cứ ngỡ như đã thuộc về miền xa xôi lắm, nhưng nhìn cô xác thực nổi từng sợi tóc lơ thơ trong khúc sáng từ ngoài hắt vào, thảng như Rei vẫn ở cạnh tôi mới đây thôi. Thời gian có lúc tưởng kéo dài bất tận, thế mà gặp lại cứ nghĩ chỉ ngắn như một ác mộng cô đơn. Thế mà cũng gần ba năm rồi đấy.</p>\r\n<p>Tôi khẽ nhấc người dậy. Người ta khi gặp lại người mình yêu, cơ thể hoặc sẽ phản ứng quá nhanh hoặc sẽ chết lặng tại một chỗ. Có vẻ như tôi thuộc loại thứ hai. Kí ức mờ nhạt, tôi không nhớ rõ vì sao Rei chia tay tôi. Chỉ là một chuyến đi xa về, Rei biến mất. Không còn một dấu vết trong căn hộ hai đứa ở chung. Đến cả đôi dép cô đi trong nhà cũng được gói kĩ trong túi rác màu xanh. Tôi đi tìm mãi, nhưng chẳng thể nào thấy cô lại được nữa. Cuộc sống nhàm chán, nhưng không quá đỗi khó khăn. Vẫn có những mối quan hệ lấp vào, những khuôn mặt thay thế với mùi son môi luôn chạy theo quảng cáo mới nhất. Vậy mà giờ găp lại Rei, tôi cứ như quên sạch tháng ngày qua, cả chuỗi quá khứ chỉ còn sót lại đúng cô ấy.</p>\r\n<p>Tôi thẳng người, bước về phía cô ấy, kéo ghế và ngồi xuống.</p>\r\n<p>Tôi hơi vươn cổ ra ngoài, nhìn về chiếc đồng hồ lớn chạm đá trên nhà thờ. Hơn 6h tối. Các cửa hàng sáng trưng dù trời vẫn còn màu xanh xám mờ. Tôi xoay lại nhìn Rei. Cô vẫn xinh như thế, và nhướn mắt nhìn tôi, và cười. Ba năm mà cứ như một bản Nocturne của Chopin. Tôi vội quay đầu, hướng mắt về phía tán cây đung đưa. Chà, nếu tôi cứ lặng ra nhìn cô ấy, đầu tôi sẽ bị trắng toát, trống rỗng xâm chiếm và chẳng nói được gì hay ho mất.</p>\r\n<p>Rei bỏ tai nghe xuống, dùng hai ngón tay chạm chiếc ống hút, xoay xoay quanh thành cốc: \"Sho, anh xong việc rồi đấy à?\"</p>\r\n<p><strong>2. Tấm bản đồ</strong></p>\r\n<p>Sho-chan nhận ra tôi.</p>\r\n\r\n\r\n\r\n\r\n\r\n			<p>Dù có cố gắng giữ thản nhiên thế nào, đầu óc tôi vẫn như bị đánh bật bởi một chiếc lò xo. Tôi đã giữ mọi liên lạc ở mức nhỏ nhất. Thu mình vào trong căn hộ thuê ở phía nam trung tâm, tôi cứ nghĩ xác suất gặp lại người quen cũ sẽ chỉ còn là số không. Không có gì là khó nếu thực sự muốn biến mất, và yên ổn. Nhưng ngay khi nhìn thấy Sho, tôi biết là chẳng có ích gì. Giống như khóc trong mưa vậy. Sẽ không biết được bao nhiêu là đủ cho nỗi buồn. Nhưng tôi không chạy đi đâu cả. Tôi tiến nhanh đến khung cửa to sáng nhất, và thả tóc mình xuống, che bớt phần khuôn mặt đi. Nếu Sho không nhận ra tôi cũng chẳng sao, nhưng tôi biết mình đang bị phấn khích. Đến mức quyển sách tôi đọc suốt trên tàu điện giờ cũng chẳng thể tập trung nổi vào nữa. Single mới của sleepy.ab chạy qua lại bên tai, tôi vươn ra hưởng một ngày gió đẹp.</p>\r\n<p>Và chờ Sho.</p>\r\n<p><img src=\"/uploaded/images/stories/2020/08/ngaycuoicung1.jpg\"   alt=\"ngaycuoicung1\"  /></p>\r\n<p>\"Sho, anh xong việc rồi đấy à?\"</p>\r\n<p>Lông mày bên trái của anh hơi xô lên, tỏ ý ngạc nhiên. Nhưng rất nhanh chóng, đôi mắt hơi giãn ra, và cười hiền. Y như ngày xưa, mỗi lần tôi cọ mũi vào má anh, anh cũng cười hiền như thế. Và Sho nhìn tôi rất lâu.</p>\r\n<p>\"Chúng ta đi dạo nhé\". Sho đề nghị.</p>\r\n<p>Tôi gật đầu.</p>\r\n<p>Sho một tay cầm ipad, một tay để cho tay tôi khoác lên. Một cách tự nhiên và thói quen cũng chẳng phải là xấu xí. Sho không bao giờ đặt câu hỏi cầu kì, hay đi sâu vào đời sống người khác. Nhưng những gì về anh ấy, thì chẳng thể nào biết trước được. Thông tin anh bất ngờ và thích thú. Thông tin tôi đều đều và tẻ nhạt. Bề mặt và hời hợt. Giữa tôi và Sho có một khoảng lặng lớn. Lớn đến mức cảm tưởng như tôi đặt một chiếc ghế, ngồi trên một mõm đá và nhìn biển đêm vô tận hết ngày này qua ngày khác. Sẽ chẳng biết bắt đầu từ đâu, điểm nhìn không có khởi đầu mà cũng chẳng có kết thúc. Dù ngày hôm nay sẽ chỉ gặp nhau thế thôi, nhưng rồi Sho sẽ tìm tôi lần nữa, tôi sẽ gặp anh lần nữa. Nếu hai người yêu nhau theo cách cũ, liệu họ có chia tay theo cách cũ không?</p>\r\n<p>Sho cùng tôi đi ra ga điện ngầm. Bước gần về những con phố lớn, Sho buông nhẹ bàn tay xuống cổ tay tôi, rồi nắm tay tôi lúc qua đường.</p>\r\n<p>Cảm giác dễ chịu đó lại ùa về, run nhẹ trong từng mạch máu. Và tôi khẽ xiết tay Sho.</p>\r\n<p><em><strong>Ước gì tôi có thể yêu anh trong một ngày.</strong></em></p>\r\n<p><em><strong>Tôi không cho Sho số điện thoại của mình. Ước gì tôi có thể làm thế, để quay lại yêu anh dễ dàng hơn, nhưng khi đó bỏ đi cũng khó hơn gấp ngàn lần.</strong></em></p>\r\n<p><em><strong>Tại sao tôi luôn nghĩ đến việc bỏ đi như là lựa chọn duy nhất? Tại sao vẫn ham muốn khi biết trước kết cục sẽ rất tan và tàn?</strong></em></p>\r\n<p>...</p>\r\n<p>\"Em dịch nhiều sách, đã bao giờ em nghe tới hồ muối Uyuni ở Bolivia chưa?\"</p>\r\n<p>\"Chưa. Ở đó có gì?\"</p>\r\n<p>\"Vào mùa mưa, hồ muối đó sẽ trở thành tấm gương khổng lồ, phản chiếu mọi thứ. Phản chiếu bầu trời, kể cả chính em. Người ta gọi những lúc như thế là nơi trời và đất gặp nhau.\"</p>\r\n<p>Im lặng.</p>\r\n<p>\"Anh sẽ đi Bolivia tháng tới. Rei đi cùng anh không?\"</p>\r\n<p>...</p>\r\n<p>Đấy là chuyện cuối cùng xảy ra giữa chúng tôi. Ý nghĩ trở thành một phần chuyến đi của Sho khiến tôi háo hức. Nhưng vì lí do công việc lúc đó có một số trục trặc sao đó, tôi không nhớ rõ nữa, nên đã chẳng thể đi được. Sho lên đường như một phần tất yếu của cuộc sống, như anh sinh ra là phải đi như vậy. Tôi ở nhà một mình, đẩy cái ghế sofa ra trước cửa sổ lớn. Đã rất nhiều đêm như thế. Đằng sau lưng là tấm bản đồ thế giới to đùng, Sho đánh dấu những pin nơi anh từng đi. Tôi ngồi khoanh chân, nhấp một ngụm bia, bật đĩa klavier của Bach, nhìn chăm chăm tấm bản đồ lớn đó.</p>\r\n<p>Tokyo chỉ là một điểm nhỏ xíu, và tôi chỉ là một hạt bụi li ti mắc kẹt trong đó. Nhưng tôi ổn, không có nhu cầu biết quá nhiều. Sho từng bảo việc tôi không bước ra khỏi bên ngoài, giống như mọi quyển sổ chỉ có bản đồ tàu điện ngầm của Tokyo và Osaka mà không có bản đồ thế giới. Đấy là sự thực. Tôi đi làm về, tự chào mình và nấu mì ăn. Và nghe nhạc, và xem phim, và thiếp đi trên sofa nhìn ra bên ngoài triệu điểm sáng đến sớm chỉ còn lớp sương mờ.</p>\r\n<p>Tôi nghĩ về Sho. Như những ngày gió không bao giờ ở lại lâu. Gió ở một chỗ cũng chẳng còn ý nghĩa.</p>\r\n<p>Tôi dọn đi nơi khác. Cũng chẳng buồn đến mức mà gào to khóc lấy một lần.</p>\r\n<p>Thế mà cũng được ba năm.</p>\r\n<p>Ngày hôm sau, tôi quay lại hàng café. Và nhìn thấy Sho.</p>\r\n<p>Cả tuần sau đấy tôi nhìn thấy anh, gặp anh, nói chuyện với anh, và cùng nhau đi đến điểm ga tàu điện. Trong vài lần khoác vai, anh quay sang tôi thì thầm, miệng ghé sát tai tôi ngọt ngào. Chủ nhật cuối tuần, ngay trước khi tôi đưa thẻ áp lên khu vực cửa vào ga, Sho kéo tôi lại, và hôn.</p>\r\n<p>Ở thành phố này, chẳng có mấy cái hôn tạm biệt.</p>\r\n<p>Ít nhất là đối với những người trẻ độc thân.</p>\r\n<p><strong>3. Hoàng hôn đêm.</strong></p>\r\n<p>Rei dựa vào vai tôi suốt trên tàu đi về khu Shimokitazawa. Thi thoảng tôi quay sang, hôn nhẹ vào mái tóc êm và thơm ấy. Cuối cùng cô cũng ở cạnh tôi. Dù tôi không còn biết gì về Rei nữa. Số điện thoại cũng không. Rei không nói về lí do cô biến mất ngày trước. Nhưng cô đã sống tốt. Tôi cũng sống tốt. Và gặp lại nhau. Thế là tốt lắm rồi.</p>\r\n<p>Rei bước vào nhà, mắt nhìn quanh như để kiếm những gì còn sót lại thân quen ngày trước. Hoặc chỉ là quan sát căn hộ mới, tôi cũng không rõ nữa. Trong khi tôi loay hoay đun nước để nấu mì soba, Rei đã co chân lên sofa nâu cũ, mắt ngước nhìn vào tấm bản đồ lớn, nay đã đính thêm đầy pin trên khắp vùng Nam Mỹ. Khi tôi bê hai bát mì to đùng để lên bàn, và ngồi xuống cạnh Rei, thì cô đứng dậy, đi về phía cửa sổ trong cùng. Tôi gọi cô, nhưng cô không nghe thấy, hoặc tỏ như không nghe thấy. Ở cạnh cửa sổ đầy gió đó, có nhìn thấy gì đâu.</p>\r\n<p>Tôi nhìn Rei bất động, đi vào phòng và ôm cô từ phía sau. \"Ở đây không nhìn thấy cả thành phố như trước...\" \"Ừ, nhưng bù lại cảnh hoàng hôn sẽ rất đẹp. Ở Budapest còn đẹp hơn gấp nhiều lần...\" Rei không nói gì nữa. Cô chỉ run lên. Và khóc. Tôi xoay cô lại, hôn lên những giọt nước vỡ trên khoé mắt, gờ mũi, hôn lên má và cả cằm nữa. Rei ngồi thụp xuống, khóc như một đứa trẻ con đi lạc. Tôi chẳng thể xin lỗi vì những lời nói ra, nhưng lòng thì vỡ tan.</p>\r\n<p><img src=\"/uploaded/images/stories/2020/08/ngaycuoicung.jpg\"   alt=\"ngaycuoicung\"  /></p>\r\n<p>\"Sho, em không thể tiếp tục nữa...\"</p>\r\n<p>\"Em không đi đâu cả. Anh có thể yêu em nhưng anh không bao giờ hiểu những người như em. Em không chờ nữa...\"</p>\r\n\r\n\r\n\r\n					\r\n\r\n		<p>Rei ôm tôi, nói nghẹn lời và khóc. Tôi ôm cô trong phòng tối, nhìn ra ngoài mảng sáng hắt vào. Tôi nhìn thấy hai bát mì đã trương phềnh lên. Sofa da lộn cũ, ba đôi giày treo góc cửa, vài cái ô. Điểm chấm trắng sáng lên mờ đi từ chiếc máy tính xách tay trên bàn. Tất cả vẫn thế. Tất cả vẫn cố hữu như cái cuộc sống độc thân di động của tôi. Chỉ có Rei xuất hiện, rồi sẽ biến mất. Thành phố tôi cứ nghĩ chật chội, nhưng chỉ cần ai đó biến mất, dù có lục tung mọi ngõ ngách cũng chẳng thể tìm lại lần nữa. Tôi vẫn chưa biết gì về cô ấy cả. Tôi ôm cô chặt hơn, đặt những nụ hôn lên cổ. Cô ấy rồi sẽ biến mất thôi. Tôi chỉ biết có thế.</p>\r\n<p>Sáng hôm sau tỉnh dậy trên giường, Rei đã đi từ lâu. Tôi chạm tay vào phần cô ấy đã nằm cạnh, chỉ còn một ít cảm giác mơ hồ. Tôi nằm cả ngày cho đến khi ánh nắng chiều hắt vào cửa sổ, nghĩ về rất nhiều thứ. Những gì Rei nói với tôi. Những gì xảy ra ba năm trước. Cứ như được nối liền với nhau, hôm qua là ngày cuối cùng bị mất của ba năm trước. Hôm qua là ngày chia tay của ba năm trước. Phải mất rất lâu, tôi mới nhận thức được điều đó.</p>\r\n<p>Tôi nghĩ về những đường thẳng chạy chéo trong không gian. Dù tôi có gặp lại Rei cả trăm lần, yêu cô cả trăm lần, thì cũng sẽ làm tổn thương và chia tay cô cả trăm lần đó. Chỉ cùng một lí do. Có lẽ tôi và cô yêu nhau, nhưng không ở cạnh nhau mãi được. Chẳng phải ngang trái cuộc đời gì, chỉ là do lựa chọn của mỗi người, và yêu nhau không đủ để thay đổi bản ngã vốn có.</p>\r\n<p>Trời thì vẫn gió như thế. Rồi tôi sẽ sống tốt. Rei sẽ sống tốt.</p>\r\n<p><strong>Có gặp lại nhau là tốt rồi.</strong></p>\r\n<p ><strong>Z</strong></p>         ', 'images/stories/2020/08/original/ngay-cuoi-cung-bi-mat.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'ngay-cuoi-cung-bi-mat', NULL, NULL, NULL, '2020-08-20 00:39:34', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/250-ngay-cuoi-cung-bi-mat.html'),
(14, 'Yêu trẻ con', 'Nhờ anh và tình yêu của anh, nó đã thay đổi rất nhiều, chịu khó học hành, biết suy nghĩ chín chắn hơn, vâng lời, lễ phép ...&nbsp;Có lẽ bố mẹ nó cũng phải biết ơn anh lắm.&nbsp;Cũng vì anh khéo léo, luôn biết bản ban nó nhẹ nhàng, đúng mực. Vậy mà lần này..&nbsp;', '\r\n        	<p><strong>Nhờ anh và tình yêu của anh, nó đã thay đổi rất nhiều, chịu khó học hành, biết suy nghĩ chín chắn hơn, vâng lời, lễ phép ...&nbsp;Có lẽ bố mẹ nó cũng phải biết ơn anh lắm.&nbsp;Cũng vì anh khéo léo, luôn biết bản ban nó nhẹ nhàng, đúng mực. Vậy mà lần này..&nbsp;</strong></p>\r\n\r\n\r\n<p>- Hôm nay em lại trốn học ?</p>\r\n<p>- Sao anh biết?&nbsp;</p>\r\n<p>- Em đi đâu?&nbsp;</p>\r\n<p>- Megastar.&nbsp;Hôm nay ra phim mới, em đi với mấy đứa lớp mà.&nbsp;Hôm nay trốn tập thể chứ có phải mình em đâu.</p>\r\n<p>- Em giỏi nhỉ, có biết đang là thời điểm nước rút rồi không?&nbsp;Còn mấy tháng nữa là thi Đại Học hả?\"&nbsp;</p>\r\n<p>- Em đi tìm người mà.&nbsp;</p>\r\n<p>- Tìm ai? Tìm người thay thế anh à?.&nbsp;</p>\r\n<p>- Đúng là em đi tìm nhưng không phải là tìm người thay thế.&nbsp;</p>\r\n<p>- Em chỉ muốn... chỉ muốn... - nó viết dang dở nhưng rồi chẳng viết nữa.&nbsp;</p>\r\n<p>Nó xóa đi - Em xin lỗi.&nbsp;Chồng ơi,em buồn ngủ lắm rồi mai chồng gọi em dậy nhá.&nbsp;Em biết em hư rồi ạ, chồng tha lỗi cho em làm phúc.&nbsp;</p>\r\n<p>\"Em đã xin lỗi bao nhiêu lần rồi?&nbsp;</p>\r\n<p>Anh không thừa lỗi cho em xin mãi đâu!&nbsp;</p>\r\n<p>Thực ra trong mắt em, anh là cái quái gì vậy?\"&nbsp;</p>\r\n<p>Nó bàng hoàng. Anh giận đến thế sao?&nbsp;</p>\r\n<p>- Hôm nay em trốn học hả?&nbsp;</p>\r\n<p>Anh nổi cáu với nó sao? Chỉ vì một chuyện bé tẹo teo con kiến này hay sao?&nbsp;</p>\r\n<p>Chưa bao giờ anh dám nặng lời với nó.&nbsp;</p>\r\n<p>Bởi nó chỉ là một đứa trẻ con, chính nó đã nói với anh điều này trước khi nhận lời yêu anh.&nbsp;</p>\r\n<p>Anh biết, anh bảo vì yêu nó, anh chấp nhận hết.&nbsp;</p>\r\n<p>Và vì thế, anh sẽ cố gạt cái tự trọng sang một bên, đè cái sĩ diện xuống ngàn nghìn mét đất, làm mọi việc khiến nó vui, để yêu nó.&nbsp;</p>\r\n<p>Ừ thì lớp 12, nó ý thức được tầm quan trọng của việc học. Ai bảo nó đã mạnh mồm tuyên bố: \"Sau này em sẽ đi làm nuôi anh\"&nbsp;</p>\r\n<p>Nhưng anh phải hiểu, sau những áp lực học hành ấy, nó cần chút thời gian thư giãn chứ.&nbsp;</p>\r\n<p>Anh chẳng tâm lí thì thôi, lại còn không biết thương, biết nghĩ cho nó.&nbsp;</p>\r\n<p>Nó đã xuống nước xin lỗi, anh còn làm mình làm mẩy.&nbsp;</p>\r\n<p>Cục tự ái chẹn ngang cổ họng, đắng ngắt.&nbsp;</p>\r\n<p>Nó điên cuồng miết những ngón tay nhỏ xinh trên bàn phím điện thoại:&nbsp;</p>\r\n<p>- Thế bây giờ làm sao?&nbsp;Chơi hay nghỉ?</p>\r\n<p>- Em bỏ ngay kiểu ăn nói hỗn hào ấy đi!&nbsp;</p>\r\n<p>- À ừ - Nó lồng lộn -&nbsp;Được thôi.&nbsp;Chúng mình chia tay đi, xin lỗi vì em yêu anh!</p>\r\n\r\n\r\n\r\n\r\n\r\n			<p >***&nbsp;</p>\r\n<p>Trước khi gặp anh, nó là một con bé ngỗ ngược, mải chơi, lười học, quậy phá, đành hanh ... hội tụ đủ những thói hư tật xấu của một đứa trẻ \"không thuộc 5 điều Bác Hồ dạy\".&nbsp;</p>\r\n<p>Một lần, thừa lúc bà chị gái đang say \"Giấc mơ trưa\", nó \"hack\" luôn con xe không biển mới mua còn bóng loáng màu sơn của bà ý để rồi \"như mây xuống phố\".&nbsp;</p>\r\n<p>Lớ ngớ thế nào lại quệt ngay vào \"thằng cha mặt thộn\" là anh, đang trên đường đi lấy tài liệu cho công ty.&nbsp;</p>\r\n<p>Nó hoảng hồn, nghĩ bụng kiểu gì cũng ăn một tràng giang đại hải từ \"nạn nhân\", vớ vẩn còn phải đền cho \"lão\" nữa ấy chứ,đang định mở miệng: \"Anh ơi em đi vội không mang tiền, anh cho em xin lỗi...\" ,thì đã thấy \"lão\" lù lù trước mặt, nhìn nó bằng ánh mắt lo lắng:&nbsp;</p>\r\n<p>- Anh xin lỗi, có sao không em?&nbsp;</p>\r\n<p>Nó tròn mắt, nghĩ thầm:&nbsp;\"Ô hô, thời thế đảo điên rồi đấy, thế là quen\"&nbsp;</p>\r\n<p>Ít lâu sau thì yêu, yêu nhau nhiều lắm.&nbsp;</p>\r\n\r\n\r\n\r\n\r\n\r\n			<p >***&nbsp;</p>\r\n<p>Anh – bằng tất cả suy nghĩ của một người lớn hơn 6 tuổi, yêu nó tha thiết.&nbsp;</p>\r\n<p>Nó – đã có bằng cử nhân mẫu giáo, và tính cách thì cũng chỉ xấp xỉ hơn các em mẫu giáo một tẹo.&nbsp;</p>\r\n<p>Anh đang cố gắng làm gia sư cho cái bản chất của nó dần dần đến cấp I, cấp II, cấp II và lên được Đại học luôn thì tốt!&nbsp;</p>\r\n<p>Nhờ anh và tình yêu của anh, nó đã thay đổi rất nhiều,chịu khó học hành, biết suy nghĩ chín chắn hơn, vâng lời, lễ phép ...&nbsp;</p>\r\n<p>Có lẽ bố mẹ nó cũng phải biết ơn anh lắm.&nbsp;</p>\r\n<p>Cũng vì anh khéo léo, luôn biết bản ban nó nhẹ nhàng, đúng mực .</p>\r\n<p>Vậy mà lần này..&nbsp;</p>\r\n<p><strong>Ngày thứ nhất sau khi chia tay.</strong>&nbsp;</p>\r\n<p>- \" Anh!,em muốn đi ăn kem\" - tin nhắn gửi đi,nó hoảng hồn vì chợt nhận ra \"Đã chia tay rồi mà\".&nbsp;</p>\r\n<p>Có lẽ việc mè nheo anh mỗi ngày đã trở thành cái \"thú vui tao nhã\" của nó,rồi nó dặn lòng mình, từ từ cũng sẽ quen thôi..&nbsp;</p>\r\n<p>- \" Hôm nay anh bận\" - giật mình khi thấy anh rep lại,ngắn gọn, xúc tich, \"đi sâu vào lòng người\".&nbsp;</p>\r\n<p>Nó cười cay đắng.&nbsp;</p>\r\n<p><strong>Ngày thứ hai sau khi chia tay</strong></p>\r\n<p>Tự thưởng cho mình một buổi shopping đã đời.&nbsp;</p>\r\n<p>Quần áo, giày dép lấn át nỗi nhớ anh một chút,lúc về nhà lại cồn cào nôn nao.&nbsp;</p>\r\n<p>Soi gương, nó nhìn lại bản thân nó, lại cười. Nó tự nhủ với đứa con gái đang đứng trong gương:&nbsp;</p>\r\n<p>- Cười gì mà cười? Xem cái mặt kìa, làm như hạnh phúc lắm ý!&nbsp;</p>\r\n<p><strong>Ngày thứ ba sau khi chia tay.</strong>&nbsp;</p>\r\n<p>Đi học về, online gặp thằng em nhận quen trên mạng.&nbsp;</p>\r\n<p>Hai chị em thi nhau chém gió ầm ầm, cười đổ cả ghế.&nbsp;</p>\r\n<p>Thằng em nhờ nó dạy cách để cưa ... cô giáo dạy Tiếng Anh,nó nhiệt tình chỉ bảo.&nbsp;</p>\r\n<p>Chợt nhớ ra ngày trước cứ cố vun cho anh với con bé hàng xóm, còn định giúp anh \"thành đôi thành lứa\" với bé ấy nữa chứ, thật may là anh đã không đồng ý, lòng nó chợt se lại.&nbsp;</p>\r\n<p><strong>Ngày thứ tư sau khi chia tay.</strong>&nbsp;</p>\r\n<p>Nó chán thật sự, cũng chả biết chán gì, nó đôi khi vẫn thế, nằm quăng quật, dày vò cái điện thoại.&nbsp;</p>\r\n<p>Hết đi ra rồi lại đi vào, đứng lên rồi lại nằm xuống.&nbsp;</p>\r\n<p>Nó nhớ anh, quay cuồng đầu óc,có lẽ nó sai rồi ... Anh mắng nó cũng vì muốn tốt cho nó, đâu phải anh ghét bỏ?&nbsp;</p>\r\n<p>Sao lại có thể giận dỗi anh cơ chứ.&nbsp;</p>\r\n<p>Bất giác nó nghe thấy tiếng anh:&nbsp;</p>\r\n<p>- Có chuyện gì không em?&nbsp;</p>\r\n<p>- Không! - nó giật mình khi nhận ra đã vô thức gọi cho anh.&nbsp;</p>\r\n<p>- À có, em đang buồn, anh hát cho em nghe nhé.&nbsp;</p>\r\n<p>- Nó vẫn luôn muốn vậy,muốn ngồi nghe anh hát để gột rửa hết nỗi buồn của nó.&nbsp;</p>\r\n<p>- Ừ, vậy đợi anh ra ban công nhé!&nbsp;</p>\r\n<p>Nó to mắt khi thấy anh chả gắt lên với nó chút nào như nó đã tưởng tượng.&nbsp;</p>\r\n<p>- Dạ! Thôi ạ anh ngủ đi.&nbsp;</p>\r\n<p>- Nó tắt máy.&nbsp;</p>\r\n<p><strong>Ngày thứ năm sau khi chia tay.</strong></p>\r\n<p>Hôm nay nó không đi học,cũng không làm gì cả,chỉ nằm bẹp trên giường. Chả ai biết nước mắt nó làm ướt cái gối.&nbsp;</p>\r\n<p>Nó nhớ anh,nhớ phát ốm...nhưng lại chẳng dám gọi anh như hôm qua, nó biết anh đang đi làm.&nbsp;</p>\r\n<p>Ngày thứ sáu sau khi chia tay,sớm ngày ra đã thấy thằng em nhận nhắn tin hỏi thăm sức khỏe, \"tại mấy hôm nay không thấy chị online\".&nbsp;</p>\r\n<p>Nó chả sao cả, bình thường vẫn thế.&nbsp;</p>\r\n<p>Tin thứ 2 từ thằng em:\" Chị ơi, chị có yêu em không? hìhì\"&nbsp;</p>\r\n<p>Nó lặng thinh. Sống mũi cay cay. Trước kia hình như cũng có người hỏi nó câu này.&nbsp;</p>\r\n<p>Lục lọi cái mớ hỗn độn tạp nham trong óc nó, tất cả những vui buồn của nó đều do anh tạo nên, vậy mà nó lại đòi chia tay trong khi công việc của anh bộn bề, vẫn không quên dành nhiều yêu thương cho nó, nó thấy mình ích kỉ.</p>\r\n<p>&nbsp;<img  alt=\"\" src=\"/uploaded/images/stories/2020/08/1-kid2.jpg\" /></p>\r\n<p><strong>Ngày thứ bảy sau khi chia tay.</strong>&nbsp;</p>\r\n<p>- Anh ơi.&nbsp;</p>\r\n<p>- Sao nào?&nbsp;</p>\r\n<p>- Em đang ở dưới nhà anh.&nbsp;</p>\r\n<p>Anh vội vã chạy ra mở cổng,như sợ đợi lâu chút nữa thì nó sẽ biến mất mãi mãi.&nbsp;</p>\r\n<p>Nó đứng đó, mắt mũi đỏ tưng bừng.&nbsp;</p>\r\n<p>Vừa thấy anh, nó chợt òa khóc.&nbsp;</p>\r\n<p>Anh bối rối ôm nó vào lòng:&nbsp;</p>\r\n<p>- Sao thế này?&nbsp;</p>\r\n<p>Ai bắt nạt em?&nbsp;</p>\r\n<p>- Anh ơi ...! – Nó mếu máo – Em xin lỗi, em sai rồi ... Huuuuhhu.&nbsp;</p>\r\n<p>Anh phì cười, xoa đầu nó:&nbsp;</p>\r\n<p>- Ừ ừ.. biết rồi ... nín đi không hàng xóm người ta lại tưởng anh đánh em bây giờ ...&nbsp;</p>\r\n<p>Nằm gọn trong lòng anh, ấm áp. Nó thủ thỉ:&nbsp;</p>\r\n<p>- Chồng ơi!&nbsp;</p>\r\n<p>- Hả?&nbsp;</p>\r\n<p>- Hát cho em nghe điiiiiiiiiiiiii...&nbsp;</p>\r\n<p>- Bài gì nào?&nbsp;</p>\r\n<p>- Yêu lại từ đầu.&nbsp;</p>\r\n<p>- Nhưng anh hát không hay.&nbsp;</p>\r\n<p>Anh hát không hay, chả hay tí nào luôn mà nó vẫn cười toe.&nbsp;</p>\r\n<p>Nó cắt ngang lời anh hát.&nbsp;</p>\r\n<p>- Anh! Em xin lỗi.&nbsp;</p>\r\n<p>- Vì gì nào?&nbsp;</p>\r\n<p>- Vì em yêu anh.&nbsp;</p>\r\n<p>- Vẫn yêu chứ.&nbsp;</p>\r\n<p>- Dạ vẫn.&nbsp;</p>\r\n<p>- Thì về bên anh đi.&nbsp;</p>\r\n<p>- Dạ vâng.&nbsp;</p>\r\n\r\n\r\n\r\n					\r\n\r\n		<p>- Không đi lang thang như mèo hoang nữa nhé.&nbsp;</p>\r\n<p>Anh cho uống sữa là phải uống hết. Anh hát thì phải bịt lỗ tai vào mà ngủ nghe chưa...&nbsp;</p>\r\n<p>Nó xị mặt:&nbsp;</p>\r\n<p>- Ứ ...Anh lườm yêu, bắt chước điệu bộ của nó:&nbsp;</p>\r\n<p>- Này ...! Thế bây giờ..chơi hay nghỉ?&nbsp;</p>\r\n<p>Nó lè lưỡi tinh nghịch.&nbsp;</p>\r\n<p>Lát sau:&nbsp;</p>\r\n<p>- Hì hì. Anh này ...&nbsp;</p>\r\n<p>- Sao nữa?&nbsp;</p>\r\n<p>- Anh vẫn yêu em chứ ?&nbsp;</p>\r\n<p>- Biết rồi còn hỏi ...&nbsp;</p>\r\n<p>- Không! Anh nói cơ... *ôm*</p>         ', 'images/stories/2020/08/original/yeu-tre-con.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'yeu-tre-con', NULL, NULL, NULL, '2020-08-20 00:39:36', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/247-yeu-tre-con.html');
INSERT INTO `fs_stories` (`id`, `title`, `summary`, `content`, `image`, `tags`, `category_id`, `category_alias`, `category_name`, `category_id_wrapper`, `category_alias_wrapper`, `category_icon`, `alias`, `creator`, `source_website`, `new_date`, `created_time`, `updated_time`, `editor`, `show_in_homepage`, `hits`, `published`, `ordering`, `title_display`, `display_title`, `display_column`, `tags_group`, `rating_count`, `rating_sum`, `keywords`, `hot`, `seo_title`, `seo_keyword`, `seo_description`, `lang`, `source`) VALUES
(15, 'Nhất định anh sẽ cưới em', '10 giờ tối, tôi đang đi trên đường thì nghe điện thoại reo, kinh ngạc khi nhận ra đó là tin nhắn của Lan. Lần đầu tiên kể từ khi kết hôn, cô ấy nhắn cho tôi. \"Anh, em đã sai rồi...\" - Lan viết.', '\r\n        	<h2  class=\"fon33 mt1\"><strong>10 giờ tối, tôi đang đi trên đường thì nghe điện thoại reo, kinh ngạc khi nhận ra đó là tin nhắn của Lan. Lần đầu tiên kể từ khi kết hôn, cô ấy nhắn cho tôi. \"Anh, em đã sai rồi...\" - Lan viết.</strong></h2>\r\n<p ><strong>***</strong></p>\r\n<p ><strong><img alt=\"\" src=\"/uploaded/images/stories/2020/08/0-sad.jpg\" /></strong></p>\r\n<p >Cách đây chừng 5 năm, tôi và Lan yêu nhau. Hai chúng tôi có rất nhiều điểm chung: Còn trẻ, học hành chăm chỉ, nhiều hoài bão và cùng xuất thân từ những gia đình rất nghèo. Lan quê ở Thái Bình, bố cô ấy mất sớm, chỉ còn mẹ tần tảo trồng cấy nuôi bốn chị em cô ấy ăn học. Lan xinh đẹp nổi bật ở trường dù cô ấy không bao giờ có những bộ quần áo mốt, trang sức đắt tiền để trưng diện.</p>\r\n<p >Còn tôi, hoàn cảnh nhà tôi cũng rất vất vả. Bố mẹ tôi là công nhân nghỉ mất sức đã nhiều năm nay và vì thế, khi vào đại học, để có tiền đóng học phí, tôi đi làm gia sư, làm nhân viên tiếp thị ngay từ năm thứ nhất. Càng khó khăn vất vả, tôi lại càng chăm chỉ học hành bởi tôi biết, học giỏi là con đường duy nhất để giúp tôi thay đổi cuộc sống của mình.</p>\r\n<p >Quãng thời gian tôi và Lan yêu nhau, đó có lẽ là quãng thời gian đẹp nhất của đời tôi. Chúng tôi cùng nhau lên thư viện học bài mỗi chiều, đèo nhau bằng chiếc xe đạp cũ lên Hồ Gươm ngắm phố phường. Hôm nào tôi nhận được tiền lương đi dạy thêm, chúng tôi lại lên phố Nguyễn Xí tìm mua những quyển sách giá rẻ và kết thúc buổi tối đi chơi vui vẻ bằng hai que kem Tràng Tiền mát lạnh. Dù chúng tôi nghèo nhưng cả hai không lấy đó làm buồn lòng bởi Lan luôn động viên tôi rằng: \"Em biết tương lai chúng mình sẽ khá mà, em tin ở anh\".</p>\r\n<p >Lời động viên của người yêu là nguồn động lực tiếp thêm sức mạnh cho tôi. Tốt nghiệp đại học với tấm bằng loại giỏi, tôi tiếp tục lao vào học tiếng Anh và săn tìm học bổng trên mạng. Cuối cùng, may mắn đã mỉm cười với tôi khi tôi nhận được một học bổng sang&nbsp;Singaporehọc thạc sỹ hai năm.</p>\r\n<p >Lan rất mừng khi biết tin tôi được học bổng đi du học nước ngoài nhưng đồng thời cô ấy cũng buồn da diết. Tôi nhận thấy điều đó rõ ràng trước khi tôi lên đường sang&nbsp;Singapore. Tối nào chúng tôi gặp nhau, mắt Lan cũng rưng rưng nhưng cô ấy nói quả quyết: \"Em không buồn gì đâu, anh đi học về chúng mình sẽ cưới nhau. Hai năm thôi mà\".</p>\r\n<p >Sang&nbsp;Singapore, tôi cắm đầu vào học và làm. Hàng đêm, khi kết thúc công việc tại một quán cháo của người Hoa, tôi trở về nhà, vừa học bài vừa tranh thủ lên mạng chat và tâm sự với người yêu mình. Lan của tôi ở trong nước cũng không kém cỏi, cô ấy ra trường và xin việc được ở một tập đoàn truyền thông khá lớn. Lan làm việc chăm chỉ và thường được khen thưởng mỗi tuần. Lan hồ hởi khoe với tôi rằng cứ đà này, sau một năm, lương cô ấy có thể tăng lên gấp đôi, gấp ba.</p>\r\n<p >***</p>\r\n<p >Quãng thời gian ngọt ngào của chúng tôi trôi qua khá nhanh, chừng dăm bẩy tháng sau khi tôi đi du học, tối thứ bảy, chủ nhật, tôi lên mạng nhưng không thấy người yêu của mình online nữa. Thi thoảng tôi gọi điện thoại về, Lan cũng không muốn nói chuyện dài và lấy lý do đang bận công việc. Tôi không mảy may nghi ngờ người yêu mình vì tôi cho rằng tôi đủ hiểu Lan, cô ấy đang rất nỗ lực để khẳng định mình trong công ty mới.</p>\r\n\r\n\r\n\r\n\r\n\r\n			<p >Một buổi tối tháng 8, tôi đi làm về, như thường lệ, tôi mở hộp thư để check mail và rất bất ngờ khi thấy người yêu tôi gửi thư điện tử cho mình. Tôi vừa mở thư vừa nghĩ: \"Bình thường toàn chờ nhau lên để chat, hôm nay lại gửi thư cơ đấy\". Mở thư ra, tôi đọc nhanh và càng đọc càng không tin vào mắt mình, cho tới bây giờ, tôi vẫn còn nhớ rõ bức thư ngày ấy Lan viết cho tôi, cô ấy viết đại ý là không thể chờ tôi được nữa và cô ấy đã có người yêu mới, cô ấy sắp cưới và xin tôi tha lỗi.</p>\r\n<p >Cả đêm hôm đó, tôi gọi điện thoại cho Lan liên tục nhưng cô ấy không nghe máy. Lúc đó tôi chỉ ước ao tôi đang ở Việt Nam, tôi sẽ chạy ngay tới chỗ Lan và hỏi cô ấy vì sao cô ấy lại làm như vậy nhưng tôi - một anh sinh viên nghèo, tiết kiệm từng đồng để học, để trang trải cuộc sống lấy đâu ra tiền mua vé máy bay về nhà chỉ để đi tìm câu giải thích của người yêu.</p>\r\n<p >***</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/0-sad2.jpg\" /></p>\r\n<p >Sau này khi tôi học xong, về nước, tôi biết rằng Lan đã cưới con một quan chức lớn trong ngành truyền thông và đám cưới cô ấy tổ chức rất hoành tráng trong một khách sạn sang trọng nhất Hà Nội. Lòng tràn đầy đau đớn nhưng tôi vẫn không cảm thấy căm giận người yêu của mình. Tôi hiểu, Lan luôn ao ước được thay đổi cuộc sống nghèo túng mà cô ấy phải sống từ nhiều năm nay. Cũng như bản thân tôi, tôi đã rất cố gắng để thay đổi cuộc sống của tôi đấy thôi.</p>\r\n<p >Trở lại với buổi tối tôi nhận được tin nhắn của Lan, lúc đó lòng tôi tràn đầy xúc động, bao kỷ niệm đẹp cô ấy và tôi từng có với nhau bỗng chốc ùa về đầy tâm trí tôi. Tôi nhắn tin cho Lan: \"Anh gặp em có được không?\" và Lan đồng ý hẹn gặp tôi vào 11 giờ trưa hôm sau.</p>\r\n<p >Trưa hôm sau, tôi ăn mặc chỉnh tề tới điểm hẹn với Lan, tôi đến sớm nửa tiếng, lòng bồn chồn và nôn nao khi ngồi đợi. Rồi Lan cũng xuất hiện, tôi nhận ra cô ấy từ rất xa...Lan vẫn vậy: Xinh đẹp và mong manh, chỉ khác là người yêu cũ của tôi giờ mặc một bộ váy đỏ rất sang trọng chứ không chỉ áo sơ mi với quần Jeans như ngày chúng tôi yêu nhau nữa. Lan ngồi xuống ghế, nhìn tôi cười, mắt cô ấy đượm buồn khiến lòng tôi chùng xuống khi nhớ cũng ánh nhìn này đã chia tay tôi ở sân bay cách đây 5 năm.</p>\r\n<p >Buổi nói chuyện của chúng tôi diễn ra trong khoảng ba tiếng đồng hồ. Trong khoảng thời gian ấy, tôi nói về mình rất ít, chỉ thông báo với Lan là hiện tôi làm việc cho một công ty của Bỉ, đã mua được một ngôi nhà nhỏ và vẫn chưa yêu ai sau khi chia tay Lan. Tôi muốn nghe Lan tâm sự và cô ấy đã kể với tôi tất cả về cuộc sống của mình, bằng một giọng đều đều, chậm rãi...</p>\r\n<p >\"Em và Bình cưới nhau thế nào chắc anh cũng biết rồi. Em vẫn luôn ao ước được sống giàu sang, phú quý, em không có lỗi khi mơ ước cuộc sống như thế, đúng không anh? Vấn đề của em là em không thể sinh con anh ạ...Ngay sau khi đi khám, biết tin này, Bình thay đổi thái độ với em rõ rệt. Anh ấy công khai cặp kè với một cô gái khác và cách đây chừng nửa tháng, cô ta đến gặp em, thản nhiên nói với em rằng: \"Chị nên ly dị anh Bình đi, tôi đang mang thai đứa con của anh ấy\". Em đau đớn quá anh ạ, chồng em đã có con với người tình và giờ đây em không biết phải làm sao. Mấy ngày nay anh ấy còn không về nhà buổi tối và cũng không nói với em một lời. Em không đẻ được, không có gì để níu kéo anh ấy và hình như em cũng không muốn níu kéo nữa. Em chưa bao giờ yêu Bình, em lấy anh ấy vì tiền, đó là sai lầm của em...Bình đã từng yêu em nhưng giờ chắc cũng hết rồi...\".</p>\r\n<p >Cả buổi tối sau cuộc hẹn với Lan, tôi bị ám ảnh bởi đôi mắt buồn của cô ấy. Lan của tôi cá tính lắm, cô ấy không muốn tỏ ra quá đau khổ trước mặt tôi nhưng tôi hiểu cô ấy đang rất khổ sở vì cuộc sống không lối thoát. Trong đầu tôi, hình ảnh của Lan - ngày xa xưa lại hiện về ngập tràn tâm trí. Tôi hiểu là tôi vẫn còn yêu cô ấy rất nhiều và đó chính là lý do khiến tôi không thể yêu ai dù biết Lan đã cưới chồng.</p>\r\n<p >Tôi cầm điện thoại lên, nhắn cho Lan một cái tin: \"Anh luôn ở bên em, nếu em cần\", Lan nhắn lại rất nhanh: \"Anh tha thứ cho em rồi sao?\", tôi lại nhắn: \"Anh chưa bao giờ ghét em, anh không thay đổi tình cảm với em, em ạ.\" và cô ấy không nhắn tin trả lời nữa.</p>\r\n<p >***</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/0-sad3.jpg\" /></p>\r\n<p >Ngày hôm sau, sáng sớm, tôi lên mạng đọc tin tức thì thấy một tin nổi bật gây chú ý về một vụ tự tử&nbsp;&nbsp;bên cầu CD.</p>\r\n<p >Tôi run hết cả người khi thấy người viết miêu tả nạn nhân là một cô gái trẻ mặc một chiếc váy đỏ, tóc dài ngang lưng, tay đeo đồng hồ vàng. Tôi vẫn nhớ như in bộ váy mà Lan mặc, chiếc đồng hồ cô ấy đeo ở tay khi đến gặp tôi buổi chiều đó. Tôi run rẩy bấm số gọi điện cho Minh, một cô bạn thân của Lan. Minh làm tim tôi vỡ tan khi òa khóc trong điện thoại: \"Em không hiểu sao Lan lại làm như vậy, tối qua hội em vẫn gặp nhau và nó gửi cho anh một bức thư rồi về một mình. Sao nó lại dại dột thế...\"</p>\r\n<p >...Tôi nghỉ làm một tuần liền sau cái chết của Lan, ngày thứ tám, tôi hẹn gặp Minh và nhận bức thư Lan gửi cho tôi trước khi chết. Vẫn là những nét chữ nghiêng nghiêng nhỏ xinh quen thuộc và đôi chỗ hình như bị nhòa bởi những giọt nước mắt, Lan viết:</p>\r\n<p >\"Anh, khi anh nhận được lá thư này, có lẽ em đã đi xa rồi. Em đã mong chờ biết bao cái ngày được gặp lại anh, người em yêu và có lẽ cũng yêu em nhất trên đời này. Không còn gì níu kéo em nữa cả... Em biết anh vẫn giang rộng vòng tay đón em nhưng em có còn xứng đáng với anh nữa đâu. Vĩnh biệt anh, có thể một ngày nào đó chúng mình sẽ gặp lại ở một thế giới khác và nếu may mắn được như vậy, anh sẽ cưới em, anh nhé!\"</p>\r\n<p >Tôi gập bức thư lại, nước mắt chứa chan và thầm nói: \"Nhất định anh sẽ cưới em\".</p>\r\n\r\n\r\n\r\n					\r\n\r\n		<p >Trần N.Đ</p>\r\n<p >&nbsp;</p>\r\n<p >&nbsp;</p>         ', 'images/stories/2020/08/original/nhat-dinh-anh-se-cuoi-em.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'nhat-dinh-anh-se-cuoi-em', NULL, NULL, NULL, '2020-08-20 00:39:39', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/244-nhat-dinh-anh-se-cuoi-em.html'),
(16, 'Lối không nhau', 'Anh vẫn yêu Cô nhưng trong lòng thấy mênh mông như đứng trước bờ vực thẳm của sự thay đổi. Chính anh muốn mình thay đổi và anh không thể giữ Cô bên mình mãi. Có điều gì đó trong anh gào thét, anh không muốn quay sang Cô khi cái nội tại trong anh đang mâu thuẫn. Anh muốn ra đi và anh cần chia tay với Cô. Anh nghĩ vậy.', '\r\n        	<p><strong>Anh vẫn yêu Cô nhưng trong lòng thấy mênh mông như đứng trước bờ vực thẳm của sự thay đổi. Chính anh muốn mình thay đổi và anh không thể giữ Cô bên mình mãi. Có điều gì đó trong anh gào thét, anh không muốn quay sang Cô khi cái nội tại trong anh đang mâu thuẫn. Anh muốn ra đi và anh cần chia tay với Cô. Anh nghĩ vậy.</strong></p>\r\n<p ><strong>***</strong></p>\r\n<p ><strong><img alt=\"\" src=\"/uploaded/images/stories/2020/08/1-way.jpg\" /></strong></p>\r\n<p>Gom tất cả giấy nằm bừa bộn trên bàn bỏ vào hộc, anh đóng mạnh tay rồi ngồi thừ ra nhìn chằm chằm vào màn hình vi tính đang tắt. Đến lúc phải kết thúc một ngày dài. Theo thói quen, anh bật nắp địên thoại lên dù biết rằng chẳng hề có tin nhắn nào mới, không có cuộc gọi nào lỡ, chỉ là thói quen mà thôi. Cũng thói quen, anh mở hộp thư tin nhắn. Hộp thư đến còn lại 03 tin từ Minh, tin nhắn chúc ngủ ngon từ hôm qua và vài dòng đùa cợt. Anh chọn Delete all cho tin nhắn đến. Lần lựơt truợt xuống những cái tên trong danh bạ mong kiếm một cái tên nào đó vừa quen vừa lâu rồi không liên lạc, cũng chẳng biết để làm gì, chỉ như một cách giết thời gian quên đi cái khí trời Sài Gòn về chiều nhiều xe và đầy nghẹt tiếng ồn. Bất chợt ngón tay cái anh dừng lại.</p>\r\n<p>Đã lâu rồi anh không gọi cho Cô. Từ bao giờ cho lần cuối cùng anh không nhớ nữa. Chỉ có Cô vẫn hay gọi hoặc nhắn tin cho anh. Cũng lâu rồi Cô không làm vậy nữa. Có lẽ anh quen với việc đó rồi nên khi yêu dù không ít lần nhớ đến Cô nhưng anh vẫn thường đợi những tin nhắn hay cuộc gọi từ Cô vì anh biết chắc chắn thế nào Cô cũng làm thế.</p>\r\n<p>Ngay sau khi anh nói lời chia tay, thỉnh thoảng Cô vẫn giữ thói quen nhắn tin cho anh mỗi đêm hoặc gọi cho anh khi đi làm về. Những lúc ấy chỉ nói với nhau những chuyện huyên thuyên, đến một lúc tự thấy không còn cho nhau sự đồng điệu nào chung nên cũng không kéo dài cuộc nói chuyện. Sự xa lạ từ đâu tìm đến, vứt những thói quen đi xa. Đôi khi anh thấy hơi khó chịu khi bắt máy, cũng không biết phải nói với nhau điều gì. Ngày truớc khi yêu nhau, hai đứa có thể nói với nhau đủ thứ mà không thấy chán, nhưng về sau anh thấy nhàm khi nghe bất kì điều gì từ Cô. Anh thấy nhạt thếch cho những lời nhõng nhẽo của Cô mà trước kia anh rất thích. Cả những thói quen lạ lùng của Cô cũng có thể khiến anh bực bội và cáu gắt. Anh không hiểu tại sao với chính mình nữa. Đó là dấu hiệu ra đi của một tình yêu sao?</p>\r\n<p>Cô vẫn luôn nồng nhiệt với anh. Cô gọi hỏi thăm anh hằng ngày khi anh đi công tác xa. Cô nhắn tin nhắc nhở anh nhớ mang áo mưa theo khi mùa mưa đến. Vẫn bằng thái độ nhẹ nhàng nhất và chu đáo nhất, Cô quan tâm đến anh bằng một tình yêu tinh nguyên như nào mới quen. Nhưng sao anh thấy bực bội với Cô, với cách cư xử đó, ngày qua ngày. Anh bắt đầu những cuộc điện thoại từ Cô bằng câu nói \"Có chuyện gì không?\" một cách khô khan và chát nghét. Anh thấy mình độc ác và nhẫn tâm, căm giận chính mình và với Cô. Anh quyết định chia tay dù biết Cô còn yêu anh nhiều lắm. Anh vẫn yêu Cô nhưng trong lòng thấy mênh mông như đứng trước bờ vực thẳm của sự thay đổi. Chính anh muốn mình thay đổi và anh không thể giữ Cô bên mình mãi. Có điều gì đó trong anh gào thét, anh không muốn quay sang Cô khi cái nội tại trong anh đang mâu thuẫn. Anh muốn ra đi và anh cần chia tay với Cô. Anh nghĩ vậy.</p>\r\n<p>Ngày chia tay Cô không khóc. Cô cũng không cười, dù là nhếch mép. Đôi mắt Cô nhìn xa xăm, anh cảm giác như nó chứa cả một sa mạc đang trong cơn lốc cát. Có cái gì đó rất xa xôi nhưng cũng rất mãnh liệt, nó có thể cuốn người ta vào vòng xóay ấy rồi nghiền nát người ta trong đó thành từng mảnh vụn. Giọng Cô đều đều, như những lời thốt ra là những hạt suơng, lờn vờn và chẳng bay lên được, nặng trĩu. Anh cảm giác như những lời nói thoát ra mang theo hơi nước để rồi Cô giữ lại cho riêng mình một sự hoang sơ và khô khốc. Ngay lúc ấy anh nghĩ đến Minh, anh quen Minh được khoảng 1 tháng qua sự giới thiệu của một người bạn.</p>\r\n<p>Minh khác Cô nhiều. Minh bốc đồng và đôi khi hơi mạnh miệng, là con gái thành phố nên trong cách nói năng ít nhiều Minh hơi xốc nổi. Anh vẫn thuờng ngầm so sánh Minh với Cô khi hai người đi chơi chung. Chẳng tìm thấy điểm đồng nào giữa hai người ngoài việc cả hai đều là giới nữ. Nhưng thời gian quen với Minh làm anh thích thú. Có thể là cảm giác mới lạ. Minh như làn gió lạ thổi ào vào cuộc sống của anh vốn bình lặng bên Cô. Anh thấy đầu mình căng ra, vì những lời Cô nói hay vì hình ảnh Minh lờn vờn, anh không rõ. Có lẽ là cả hai.</p>\r\n<p >***</p>\r\n<p>Thay vì là tiếng chuông đổ dài là tiếng ò í e báo không liên lạc đựơc. Anh chau mày. Trước giờ chưa bao giờ thuê bao của Cô trong tình trạng không liên lạc đuợc. Cô luôn cẩn thận sạc đầy pin trước khi ra ngoài và luôn trong tư thế sẵn sàng bắt máy các cuộc gọi đến. Tiếng báo của tổng đài làm anh ngạc nhiên và chút bực bội.</p>\r\n<p>Hay là Cô đổi số?</p>\r\n<p>Anh thử bấm lại số máy ấy một cách cáu gắt. Đứng trước bãi đậu xe anh đưa điện thoại lên tai và mày cau lại. Lần này là tiếng nhạc chờ, giọng nữ ca sĩ nghe da diết \" Và rồi một ngày ngồi mãi nhớ về anh, một ngừoi tuyệt vời hiện hữu trong tim em, một nguời tình cờ làm trái tim của em bật khóc khi mỗi đêm về...\" Anh nghe tim mình đánh liên hồi, như cảm giác hồi còn đi học mỗi lần chuẩn bị vào thi, có cái gì đó bóp nghẹn lấy tim mình.</p>\r\n<p>&nbsp;- Alo.</p>\r\n<p>- Ừ. Em hả? Anh đây.</p>\r\n<p>- Gọi em có chuyện gì không? – lại một lần nữa anh nghe rõ tiếng nhịp tim đập thình thịch trong lòng ngực. Câu nói ấy anh vẫn thuờng nói với Cô ngày trước</p>\r\n<p>- Em tan giờ làm chưa? Đang làm gì vậy?</p>\r\n\r\n\r\n\r\n\r\n\r\n			<p>- Em đang làm cho xong một số việc. Vẫn còn ở công ty. Sao vậy anh?</p>\r\n<p>- Mình gặp nhau chút. Đuợc không? – anh cảm giác mình đang hồi hộp, như sợ rằng lời đề nghị của một thằng nhóc mới lớn với cô bé nó thích sẽ bị từ chối.</p>\r\n<p>- Anh ghé đón em nhé. Sáng nay em hơi mệt nên nhờ bạn rước đi làm.</p>\r\n<p>- Anh đến ngay.</p>\r\n<p>Luống cuống. Anh không hiểu tại sao nữa. Nửa như mong chờ nửa như sợ đánh mất.</p>\r\n<p>Café chiều. Cô ngồi đối diện anh, tươi trẻ với lớp trang điểm nhẹ. Nhưng sao anh vẫn có cảm giác lờn vờn đâu đó chút hoang sơ, một thứ gì đó đã ra đi, là gì thì anh chịu. Cô nhìn anh bằng cái nhìn trống vắng nhất. Quán cũ, nơi hai ngừơi vẫn thuờng ghé, anh không nhớ tại sao Cô hay chọn quán này, có lần anh đã cảm thấy bực bội với Cô vì có hằng trăm quán trong thành phố hơn 07 triệu dân này sao Cô cứ nhất quyết bắt anh chở đến quán này. Những lần ấy Cô chỉ cười. Những ô cửa đỏ, những chậu hoa bày dọc lối đi và những khu dành cho khách bằng gỗ, chỉ có vậy.</p>\r\n<p>-&nbsp;&nbsp; Cho em một cacao nóng. – Cô quay sang cười cùng ngưòi phục vụ, giữ nguyên nụ cười ấy, Cô quay sang anh – Anh dạo này thế nào? Bận lắm không?</p>\r\n<p>-&nbsp; Tùy ngày thôi.</p>\r\n<p>-&nbsp; Hôm nay anh bận lắm đúng không? – cô nhấm chút nứơc lọc rồi nhoẻn nụ cừơi</p>\r\n<p>Cô luôn làm anh ngạc nhiên về những sự thật không thể chối bỏ mà chẳng ai nói ra, vậy mà Cô lại biết.</p>\r\n<p>- Sao em biết?</p>\r\n<p>Em đã từng yêu anh mà. Điều đó đâu phải là bí mật gì. Hôm truớc em có thấy anh trong Vincom, vì cũng bận nên em không đến chào.</p>\r\n<p>Vincom? Hồi nào nhỉ? – anh căng não ra, cố nặn kí ức cho nó trôi về miền nào đó gắn với chữ Vincom. Chẳng lẽ là lần anh bị Minh kéo hết hàng này qua hàng khác trong Vincom một buổi tối tháng trúơc chỉ để kiếm cho bằng được bộ váy đi đám cưới bạn Minh?</p>\r\n<p>- Cách đây không lâu. Minh nhìn xinh. – Cô cừơi.</p>\r\n<p>Dùơng như chẳng có gì giấu đuợc Cô. Anh cũng không rõ tại sao Cô biết Minh, không hiểu Cô đã biết chuyện ấy như thế nào, và Cô đã ra sao khi biết tất cả những chuyện về anh mà không nói ra. Anh rối bời.</p>\r\n<p>- Em nhìn xanh xao quá. Không khỏe sao?</p>\r\n<p>- Em vừa xuất viện.</p>\r\n<p>- Xuất viện? Bị gì mà xuất viện? Sao không gọi cho anh?</p>\r\n<p>- Ừ. Chút bệnh vặt thôi, hì. – cô lại cừơi, nhưng rõ ràng đó là một nụ cừời lịch sự. Cô nhìn anh -&nbsp;Gọi anh để làm gì?</p>\r\n<p>Câu hỏi ấy trôi bềnh bồng. Anh hỏi mà không tìm cho chính mình một lý do nào cụ thể. Rõ ràng Cô chẳng trách anh một lời mà sao anh thấy lòng đắng nghẹn. Café pha đậm quá chăng? Chắc chắn là không.</p>\r\n<p >***</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/1-way2.jpg\" /></p>\r\n<p><strong>Cô.</strong></p>\r\n<p>Những việc cuối cùng cho việc thu xếp đã xong, mọi thứ đã đuợc gói ghém gọn gàng. Căn phòng của Cô giờ chỉ còn lại không gian đầy khí, như ngày đầu tiên Cô dọn đến. Chỉ có cảm giác là khác. Nó trở nên thân thuơng với Cô từ lúc nào, giờ ra đi thấy lòng hơi luyến tiếc. Ngày ấy, khi còn yêu nhau, mỗi ngày cuối tuần anh hay ghé, cùng Cô nấu ăn và tận huởng trọn ngày trong tiếng cười. Vô cảm.</p>\r\n<p>Cô không tìm thấy một lý do để tình yêu ra đi. Chỉ biết ngay lúc nó đang lớn dần trong Cô thì anh lại muốn chia tay. Có thể nào vì người ta yêu nhau quá nên họ không thể giữ nhau bên mình. Ra đi là một trong những cách yêu? Cô lao vào công việc như một con quái thú tìm thấy một miếng mồi béo. Chính trong công việc Cô trở thành người sôi nổi hơn nhưng cũng gom về cho mình những khoảng lặng nhiều hơn khi trở về sau giờ làm. Cô thích nghi khá nhanh với cảm giác không anh, nhủ lòng rằng mình có thể sống tốt mà không có anh. Mỗi sáng Cô nghiền ngẫm từng lời của \"I\'ve learned to walk alone\", và tự có thể cười cho mình. Có ai có thể bên ai cả đời?</p>\r\n<p>Công ty mẹ đề nghị cử một nhân viên ra Hà Nội công tác 06 tháng với mức lương gấp rưỡi. Mọi người trong công ty bàn tán. Vấn đề không chỉ vì lương hậu hĩnh mà còn vì ai sẽ có thể đi công tác 06 tháng. Sáu tháng không phải là ngắn và nó thật sự dài cho bất kì ai đang yêu, đang có gia đình. Cuối cùng người đựơc đề cử là Cô. Cô không bận bịu gia đình, chưa con, chưa chồng và vừa trải qua một cuộc chấn động trong lòng. Đi xa lúc này là thích hợp. Cô là ngừơi trẻ. Vân vân và vân vân. Nó như cú hít vội, thúc vào Cô dồn dập. Cô gật đầu. Đi đâu đó lúc này có khi lại hay.</p>\r\n<p>Hà Nội đón Cô bằng cái dang tay của gió lạnh cóng. Dù đã biết mùa này Hà Nội trở lạnh, mang ba lớp áo ấm mà Cô vẫn cảm thấy cái lạnh đang len lỏi vào từng thớ thịt, tê cứng mọi thứ, từng chút một. Cô loay hoay trong dòng ngừơi tấp nập với đống đồ lỉnh kỉnh, Cô cảm giác mình không thể nhấc nổi các balo mang theo vì đôi tay đã cóng lại. Người quá đông, Cô tự hỏi ngày gì mà sân bay đông dữ dội. Người qua ngừơi lại huýt vào vai Cô, chen chúc. Cô cảm giác như ai đó bắt lấy mình từ sau. Quay lại chỉ là những người xa lạ.</p>\r\n<p>Chen ra khỏi đám đông, đến bên anh đồng nghiệp xa lạ sẽ làm việc chung, Cô nhoẻn một nụ cười. Gật đầu chào nhẹ Cô đưa tay vào túi áo lấy điện thoại thì giật bắn người khi nó chẳng còn nằm tại chỗ nó đáng ra phải nằm. Sờ khắp nơi Cô mới kịp nhận ra nó đã đi về nơi xa lắm cùng một tên móc túi nào đó trong chen chúc ban nãy. Cô thở dài. Rồi lại tự mỉm cười. Chẳng lẽ sợ dây duy nhất cũng đến lúc đứt? Chiếc điện thoại đó anh và Cô cùng chọn cách đây 02 năm, sim cũng cùng mua, giờ mất cả hai. Lựa chọn gì giữa nối lại hay tuân theo ý trời. Cô móc từ túi chiếc E63, số điện thoại liên lạc với các đối tác và đồng nghiệp vẫn còn lưu trong điện thoại này.</p>\r\n<p>Chỉ có một người vừa ra đi. Là định mệnh.</p>\r\n<p >***</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/1-way0.jpg\" /></p>\r\n<p><strong>Anh.</strong></p>\r\n\r\n\r\n\r\n					\r\n\r\n		<p>Các cuộc hẹn hò với Minh thưa dần. Anh lấy lý do là bận công việc. Minh cũng không hỏi nhiều, đôi lần trách hờn và giận dỗi. Anh chẳng giải thích. Mọi thứ trong anh bây giờ là nhàn nhạt. Đúng 03 tháng ngày xa Cô, không liên lạc với Minh anh cũng không hẹn hò ai khác.</p>\r\n<p>Cuối tuần. Đêm qua anh đã nghĩ sẽ gọi cho Cô hôm nay. Chẳng tìm lấy một lý do để gặp lại. Tự cừơi cho chính mình, anh lầm bầm, hai người bạn lâu ngày gặp nhau cần chi một lý do. Anh bấm số Cô. Số máy không liên lạc được. Anh bấm lại, hy vọng là như lần trứơc. Nhưng lần này cũng là giọng cô phát thanh viên báo số máy không liên lạc được, khô khốc. Tìm kiếm trong tòan danh bạ, anh sửng sờ vì mình hòan tòan không còn mối dây nào để tìm thấy Cô. Ngày trứơc khi Cô lưu số của anh trai anh, anh lầu bầu cho rằng phiền toái. Chính lúc này kí ức ấy tinh quái quay lại, thọt sâu vào tim anh.</p>\r\n<p>Sài Gòn vẫn vậy. Những con phố dài và chật chội người. Chưa lần nào anh gặp lại Cô, dù là tình cờ. Đôi lần khi đi trên phố anh ứơc gì mình tình cờ gặp lại. Cũng từng nghĩ rồi sẽ nói gì với nhau lúc ấy, chào nhau như hai người qua đừơng hay sẽ hoan hỉ như hai người quen lâu ngày không gặp. Sẽ vui hay buồn. Mọi chuyện giờ hóa xa xôi khi anh không thể biết Cô đang ở đâu giữa thành phố này, hay đã về một nơi nào đó. Ngày yêu nhau Cô hay nói \"định mệnh mang chúng ta đến với nhau nhưng chính chúng ta mới là người làm cho định mệnh đó trở thành sự thật\". Mãi mãi không có ngày ấy, anh và Cô đã chọn cho riêng mình những ngã rẽ không nhau và anh biết chắc chắn định mệnh chẳng đến với ai hai lần bao giờ.</p>\r\n<p><em>Tình yêu như trò chơi cút bắt, tìm kiếm và chạy trốn, đến bao giờ mới chùng chân và dừng lại?</em></p>\r\n<p ><strong>MAI HƯƠNG</strong></p>         ', 'images/stories/2020/08/original/loi-khong-nhau.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'loi-khong-nhau', NULL, NULL, NULL, '2020-08-20 00:39:44', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/243-loi-khong-nhau.html'),
(17, 'Một chuyện đùa', 'Điều bí ẩn ấy làm nàng không yên lòng chút nào, nàng không chịu được nữa. Cô bé đáng thương ấy không trả lời nổi những câu hỏi, nét mặt rầu rĩ như muốn khóc.', '\r\n        	<p><strong>Điều bí ẩn ấy làm nàng không yên lòng chút nào, nàng không chịu được nữa. Cô bé đáng thương ấy không trả lời nổi những câu hỏi, nét mặt rầu rĩ như muốn khóc.</strong></p>\r\n<p ><strong></strong>***</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/1-snow.jpg\" /></p>\r\n<p>Một buổi trưa mùa đông trong sáng... Trời giá lạnh, rét cóng. Nađia khoác tay tôi. Những hạt bụi tuyết nhỏ trắng xóa bám lên mấy món tóc xoăn vòng rủ hai bên thái dương nàng, lên hàng lông tơ mịn phía trên môi. Nàng và tôi đứng trên một ngọn đồi cao. Từ chỗ chúng tôi đứng, sườn đồi đổ dài thoai thoải xuống lấp loáng dưới ánh nắng, như một tấm gương. Bên cạnh chúng tôi là một chiếc xe trượt tuyết nhỏ bọc một lớp dạ màu đỏ tươi.</p>\r\n<p>- Chúng ta cùng trượt xuống dưới đi, Nađia! - tôi van nài nàng - Một lần thôi! Tôi cam đoan với cô là chúng ta sẽ chẳng hề gì đâu.</p>\r\n<p>Nhưng Nađia sợ. Cả khoảng gian từ đôi giày cao su nhỏ nhắn của nàng đến chân quả đồi phủ băng này đối với nàng thật ghê sợ, tưởng như là một vực sâu vô tận. Đứng đây, nàng chỉ mới đưa mắt nhìn xuống dưới, hay tôi chỉ mới gợi ý bảo nàng ngồi vào xe trượt tuyết là nàng đã sợ hết hồn, không thở được nữa, huống hồ nếu nàng liều mạng lao xuống cái vực sâu kia thì không biết rồi ra sao! Nàng sẽ chết mất, sẽ phát điên mất.</p>\r\n<p>- Ta trượt đi cô! - Tôi cố nài - Việc gì mà sợ! Cô phải biết sợ thế là nhát gan, xoàng lắm cô ạ!</p>\r\n<p>Cuối cùng, Nađia cũng ưng thuận, nhưng qua nét mặt nàng, tôi biết rằng nàng liều mạng mà nghe lời tôi. Tôi đỡ nàng vào xe trượt; nàng run rẩy, gương mặt nàng tái nhợt. Tôi vòng tay qua giữ lấy Nađia và cùng nhau lao xuống.</p>\r\n<p>Chiếc xe lao đi vun vút như một viên đạn. Làn không khí bị xé ra quật vào mặt, gào rít bên tai dữ tợn đâm vào da buốt nhói, gió như muốn giật phăng đầu ra khỏi vai. Gió ép mạnh, đến nghẹt thở. Tưởng chừng như có một con quỷ nào đang giơ tay nắm lấy chúng tôi và vừa rú lên vừa kéo xuống địa ngục. Mọi vật chung quanh nhập lại thành một vệt dài vun vút lao về phía sau... Chỉ một giây lát nữa thôi có lẽ chúng tôi sẽ chêt!</p>\r\n<p>- Nađia, anh yêu em! - tôi thì thào nói.</p>\r\n<p>Chiếc xe trượt dần dần chạy chậm lại, tiếng gió gào và tiếng càng trượt xe rít lúc này đã không còn đáng ghê sợ, ngực đã thấy dễ thở, và thế là chúng tôi đã xuống đến chân đồi. Nađia sợ tưởng chết đi được, gương mặt tái nhợt, nàng thở không ra hơi... Tôi đỡ nàng đứng dậy.</p>\r\n<p>- Các vàng tôi cũng không trượt lần nữa đâu! - nàng nói và đưa cặp mắt mở to đầy sợ hãi, nhìn tôi - Các vàng tôi cũng chịu! Chỉ thiếu chút nữa là tôi chết!</p>\r\n<p>Một lát sau, nàng dần dần hết sợ và đã bắt đầu nhìn vào mắt tôi với vẻ dò xét: có phải tôi đã nói bốn tiếng ấy, hay chỉ là trong tiếng gió gào rít nàng nghe thấy như vậy? Còn tôi, tôi đứng bên cạnh nàng, lấy thuốc lá ra hút và chăm chú nhìn chiếc găng tay của mình.</p>\r\n<p>Nàng khoác tay tôi và chúng tôi cùng nhau dạo chơi hồi lâu bên đồi tuyết. Hình như điều bí ẩn làm nàng thấy trong lòng băn khoăn. Có phải anh nói ra những lời đó không? Có những lời đó hay không? Có hay không? Đó là một câu hỏi của lòng tự trọng, của danh dự, của cuộc đời và niềm hạnh phúc - một câu hỏi rất hệ trọng, hệ trọng nhất trên đời này.</p>\r\n\r\n\r\n\r\n\r\n\r\n			<p>Nađia chăm chăm nhìn tôi bằng cặp mắt buồn rầu nôn nóng bồn chồn. Nàng chậm rãi do dự trả lời những câu hỏi của tôi như chờ mong tôi sẽ tự nói ra cái điều bí ẩn ấy. Ôi, khuôn mặt nàng lúc ấy đáng yêu biết bao, ý nhị biết bao! Tôi thấy rõ nàng đang tự day dứt với mình, nàng cần nói một điều gì, cần hỏi một điều gì, nhưng nàng không tìm được lời, nàng cảm thấy rụt rè kinh sợ, một niềm vui nào đang ngăn trở nàng nói...</p>\r\n<p>- Này anh... - Nàng nói, mắt không nhìn tôi.</p>\r\n<p>- Cái gì vậy? - tôi hỏi.</p>\r\n<p>- Chúng ta cùng nhau... lao dốc lần nữa đi.</p>\r\n<p>Chúng tôi lần theo những bậc thang trèo lên đồi. Tôi lại đỡ Nađia lên xe, mặt nàng tái nhợt, và toàn thân run run. Chúng tôi lại lao xe về phía vực thẳm khủng khiếp và, gió lại gào, tiếng xe lại rít lên. Và cũng đúng vào lúc chiếc xe lao nhanh nhất, tiếng gió gào rít ghê gớm nhất, tôi lại nói:</p>\r\n<p>- Nađia, anh yêu em!</p>\r\n<p>Khi chiếc xe dừng lại, Nađia vội đưa mắt nhìn quanh quả đồi mà chúng tôi vừa trượt xuống, rồi nhìn đăm đăm vào mặt tôi, lắng nghe giọng nói thờ ơ lãnh đạm của tôi và toàn thân nàng, cả từ cái mũ, cái bao tay và dáng người nàng nữa, đều toát lên một cái gì hồ nghi khó hiểu. Trên gương mặt nàng như hiện lên các câu hỏi:</p>\r\n<p>\"Điều gì đã xảy ra? Ai nói những lời ấy? Anh ấy hay là chỉ do ta nghe được?\"</p>\r\n<p>Điều bí ẩn ấy làm nàng không yên lòng chút nào, nàng không chịu được nữa. Cô bé đáng thương ấy không trả lời nổi những câu hỏi, nét mặt rầu rĩ như muốn khóc.</p>\r\n<p>- Chúng ta về nhà thôi nhé? - tôi hỏi.</p>\r\n<p>- Không, không... tôi thích... trượt xe thế này, - nàng nói, mặt ửng đỏ lên - Hay là chúng ta cùng nhau trượt lần nữa đi?</p>\r\n<p>Nađia nói rằng nàng \"thích\" cái trò trượt này, thế mà khi ngồi lên xe, nàng vẫn run, gương mặt nàng vẫn tái nhợt, hơi thở vẫn ngắt quãng vì sợ hãi như những lần trước.</p>\r\n<p>Lần thứ ba chúng tôi trượt xuống. Tôi thấy nàng đăm đăm nhìn lên mặt tôi. theo dõi đôi môi tôi. Nhưng tôi lấy chiếc khăn tay che miệng đi rồi khẽ đằng hắng lên mấy tiếng, và khi xe lao xuống lưng chừng đồi, tôi còn kịp nói:</p>\r\n<p>- Nađia, anh yêu em!</p>\r\n<p>Điều bí ẩn vẫn là điều bí ẩn! Nađia im lặng, nàng đang nghĩ ngợi điều gì... Tôi tiễn nàng từ sân trượt về nhà. Nàng cố đi chậm lại, chờ xem tôi có nói với nàng những lời ấy không. Tôi cảm thấy tâm hồn nàng đang đau khổ, nàng đang cố dằn lòng để khỏi phải thốt lên:</p>\r\n<p>- Không, gió không thể nói được những lời ấy! Mà tôi cũng không muốn tin rằng gió đã nói những lời ấy!</p>\r\n<p >***</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/1-snow2.jpg\" /></p>\r\n<p >Sáng hôm sau, tôi nhận được một mảnh giấy của nàng: \"Nếu hôm nay anh có đi trượt tuyết, đến rủ tôi cùng đi nhé! Nađia\".</p>\r\n<p >Từ hôm đó, ngày nào tôi và Nađia cũng lên đồi và mỗi lần lao xe từ trên đồi xuống, tôi lại thì thào nhắc lại những lời đó:</p>\r\n<p >- Nađia, anh yêu em!</p>\r\n<p >Chẳng bao lâu sau, Nađia quen nghe những lời ấy như quen uống rượu, hay dùng moócphin. Nàng không thể sống thiếu những lời đó nữa. Thực ra, lao xe từ trên đồi xuống vẫn đáng sợ như xưa, nhưng giờ đây chính cái nguy hiểm, cái kinh sợ đó lại đem đến một cái gì đặc biệt đắm say cho những lời yêu đương ấy, những lời vẫn là điều bí ẩn và dằn vặt lòng người như trước... Kẻ bị nghi ngờ vẫn là gió và tôi... Ai, gió hay là tôi, đã thổ lộ với nàng những lời yêu đương ấy, nàng không biết được; nhưng hình như nàng không để ý đến điều đó nữa bởi vì tục ngữ nói uống rượu từ bình nào, có gì đáng bận tâm dâu, chỉ cốt sao say được thôi.</p>\r\n<p >Có lần vào một buổi trưa, tôi đến sân trượt một mình; đi lẫn trong đám đông. tôi bỗng nhìn thấy Nađia đang đi về phía đồi và đưa mắt tìm tôi... Rồi nàng chậm chạp bước theo bậc thang trèo lên đỉnh đồi... Trượt xe một mình thật đáng ghê sợ biết bao, ôi, thật đáng ghê sợ! Mặt nàng tái nhợt, trắng như tuyết, toàn thân run rẩy, nàng bước đi hệt như đến nơi chịu án tử hình, nhưng nàng vẫn xăm xăm đi, đầu không ngoái lại.</p>\r\n<p >Chắc là cuối cùng nàng quyết định thử xem: nàng có còn nghe thấy những lời ngọt ngào say đắm ấy nữa không, khi không có tôi bên cạnh? Tôi nhìn thấy nàng tái nhợt, miệng há ra vì sợ hãi; ngồi lên xe, nhắm mắt lại và, sau khi vĩnh biệt trái đất, bắt đầu lao xuống chân đồi... Tiếng càng trượt xe rít lên... Nađia có nghe thấy những lời đó nữa không, tôi không biết... Tôi chỉ thấy nàng bước ra khỏi xe một cách mệt nhọc, gần như kiệt sức. Qua nét mặt nàng có thể thấy rằng chính nàng cũng không biết nàng có nghe được những lời đó hay không. Nỗi sợ hãi khi xe lao xuống đồi đã làm nàng không còn khả năng nghe được, phân biệt được các âm thanh, không còn khả năng hiểu nữa...</p>\r\n<p >Thế rồi những ngày xuân tháng Ba đã tới... Mặt trời như trở nên dịu dàng hơn. Quả đồi tuyết của chúng tôi bắt đầu sẫm lại, dần mất đi cái vẻ óng ánh của nó, và cuối cùng thì tan đi. Chúng tôi thôi không trượt xe nữa. Nađia đáng thương cũng không còn nơi nào để nghe những lời ấy nữa, bởi vì gió thì không còn thổi nữa, mà tôi thì sửa soạn đi Pêtérburg - đi rất lâu, có lẽ là suốt đời.</p>\r\n<p >Có lần khoảng hai ngày trước khi đi Pêtérburg vào một buổi chiều tà, tôi ngồi trong khu vườn nhỏ. Một hàng rào cao có đinh nhọn ngăn cách khu vườn ấy với sân nhà Nađia... Trời hãy còn lạnh, tuyết hãy còn đọng lại dưới đám phân cây cối vẫn trơ trụi, nhưng hương vị mùa xuân đã đến, từng đàn quạ bay về tổ, trú đêm kêu lên quàng quạc. Tôi đến bên hàng rào và ghé nhìn qua khe hở. Tôi thấy Nađia bước ra thềm và đưa mắt nhìn lên trời buồn bã... Làn gió xuân nhẹ thổi qua khuôn mặt nhợt nhạt rầu rĩ của nàng... Làn gió xuân gợi lại cho nàng cái tiếng gió rít trên đồi tuyết, khi nàng nghe thấy bốn tiếng ấy, và gương mặt nàng trở nên buồn bã lạ thường, nước mắt lặng lẽ chảy trên má... Nàng đáng thương đưa hai tay mình về phía trước như muốn cầu xin làn gió đem đến cho nàng những lời yêu đương đó một lần nữa. Và tôi, chờ khi có làn gió đến, thì thào nói:</p>\r\n<p >- Nađia, anh yêu em!</p>\r\n<p >Trời, điều gì đã xảy ra với nàng lúc ấy! Nađia khẽ kêu kên và khuôn mặt nàng bỗng chan hoà một nụ cười rạng rỡ. Nađia đưa hai tay lên đón lấy gió, trông nàng lúc ấy thật là mừng rỡ, đẹp xinh và hạnh phúc.</p>\r\n\r\n\r\n\r\n					\r\n\r\n		<p >Còn tôi, tôi trở vào nàh và đi thu xếp đồ đạc...</p>\r\n<p >Chuyện ấy đã qua lâu rồi. Bây giờ Nađia đã có chồng, gia đình nàng gả chồng cho nàng hay nàng tự nguyện lấy? - điều ấy cũng chẳng có gì đáng bận tâm. Chồng nàng là thư ký hội đồng giám hộ trẻ con quý tộc. Nađia đã có ba con. Nhưng chút kỷ niệm cùng nhau trượt băng và gió lúc ấy đem đến cho nàng bốn tiếng: \"Nađia, anh yêu em!\" thì nàng không quên được; đối với nàng, điều ấy đã trở thành kỷ niệm hạnh phúc nhất, xúc động nhất, đẹp đẽ nhất trong đời nàng...</p>\r\n<p >Còn tôi, bây giờ tôi đã đứng tuổi, tôi không hiểu nổi vì lẽ gì tôi đã nói những lời đó, làm sao tôi đã đùa như thế...</p>\r\n<p ><strong>Sêkhốp</strong></p>         ', 'images/stories/2020/08/original/mot-chuyen-dua.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'mot-chuyen-dua', NULL, NULL, NULL, '2020-08-20 00:39:49', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/240-mot-chuyen-dua.html');
INSERT INTO `fs_stories` (`id`, `title`, `summary`, `content`, `image`, `tags`, `category_id`, `category_alias`, `category_name`, `category_id_wrapper`, `category_alias_wrapper`, `category_icon`, `alias`, `creator`, `source_website`, `new_date`, `created_time`, `updated_time`, `editor`, `show_in_homepage`, `hits`, `published`, `ordering`, `title_display`, `display_title`, `display_column`, `tags_group`, `rating_count`, `rating_sum`, `keywords`, `hot`, `seo_title`, `seo_keyword`, `seo_description`, `lang`, `source`) VALUES
(18, 'Em chưa hiểu hết về anh đâu, con khốn!', '\"Đồ đĩ...\"', '\r\n        	<p><strong>\"Đồ đĩ...\"</strong><br /><strong>Tuấn nghiến răng, tay run run nắm chặt cái ly trong tay đánh rắc một cái, những mảnh vở thủy tinh cắm sau vào bàn tay, từng giọt máu rơi xuống đất... Nhìn điệu bộ hung dữ của Tuấn như vậy, bà chủ quán nước sợ xanh mặt mà chẳng dám hó hé một câu nào.</strong></p>\r\n<p >***</p>\r\n<p>Không cảm thấy đau, Tuấn vẫn nhìn chăm chăm vào đôi nam nữ trước cổng khách sạn bên kia đường, và người nữ không ai khác, là Thu... người yêu Tuấn! Cả hai líu ríu cười nói vui vẻ, vội vã quay đầu nhìn quanh, người đàn ông dắt tay Thu đi thẳng vào khách sạn.<br /><br />Thực ra, đã từ lâu rồi Tuấn đã có cảm giác Thu lừa dối mình. Một lần Thu bị hư máy tính, nhờ Tuấn sửa hộ, vậy mà khi sửa Thu lại cứ kè kè ở bên, một hai đòi Tuấn xóa dữ liệu ổ đĩa C đi, đôi khi đọc tin nhắn, Thu lại cứ đưa mắt nhìn sang Tuấn, Thu bận rộn với công việc nhiều hơn, bỏ rơi Tuấn nhiều hơn, đến nỗi đôi lúc Tuấn đã mơ hồ cảm nhận được hình bóng một người khác đàn ông khác bên cạnh Thu. Trong nhiều ngày liền Tuấn âm thầm theo dõi... cho đến ngày hôm nay, thì ra bấy lâu nay Thu vẫn lừa dối Tuấn, cặp kè với một người đàn ông khác.</p>\r\n<p><img src=\"/uploaded/images/stories/2020/08/khonghieuanh.jpg\" alt=\"\"  /></p>\r\n<p>\"Cô ta đi với ai?\", \"Sao cô ta phản bội mình?\", \"cô ta đã lừa dối mình bao lâu?\", \"Sao chỉ mới hồi chiều thôi cô ta còn cười nói với mình rằng hôm nay phải làm việc ca tối? Hờ, \"ca tối\" của mày đây sao, tao giết...\". Hàng loạt suy nghĩ chạy qua đầu Tuấn khiến hắn như muốn phát điên. Hắn nhìn quanh, tay túm lấy cái chai hùng hổ bước qua bên phía bên kia đường, nhằm thẳng cái khách sạn.</p>\r\n<p>Đi được vài bước, hắn đứng sững lại và cười như mếu... Hết! Hết thật rồi, giờ còn làm gì được nữa đây, níu kéo gì nữa ở đây... Hắn buông cái chai ra, ngồi phịch xuống đường, 2 tay úp lấy mặt khóc nức nở... Máu, nước mắt chằng chéo trên mặt, đôi mắt hằn lên những đường gân đỏ.</p>\r\n<p>Và ác quỷ đã ra đời từ giây phút đó...</p>\r\n<p >***</p>\r\n<p>\"Anh, tối nay em đi sinh nhật chị bạn trong công ty, mai mình đi chơi bù nhé\"</p>\r\n<p>Tuấn cười khẩy, đặt cái điện thoại xuống bàn, mắt chăm chú nhìn vào màn hình máy tính. Làm việc chuyên ngành công nghệ thông tin, không khó để Tuấn dò ra mật khẩu Yahoo! và mail của Thu. Trước mặt Tuấn là nhật kí chat giữa Thu và người đàn ông kia, qua những lời lẽ tâm sự của hai bên, Tuấn xác định người này tên Vũ, trường phòng kinh doanh công ty Thu đang làm việc. Hóa ra hai người đã qua lại với nhau hơn 3 tháng qua, Tuấn nhớ lúc đó Thu đang đảm nhận một dự án nên thường xuyên phải ở lại công ty làm đêm, có lẽ Vũ tiếp cận Thu bắt đầu từ lúc đó. Càng đọc Tuấn càng điên người vì những lời lẽ tình cảm mà hai người chat với nhau, mặt Tuấn tái đỏ, nếu không phải điều tra về cuộc tình vụng trộm giữa Vũ và Thu, có lẽ Tuấn đã đập tan cái laptop trong cơn nóng giận.</p>\r\n<p>Dù sao, Tuấn cũng đã thu thập được một số thông tin khá có ích, đó là Vũ và có gia đình và Tuấn cũng cảm nhận được Thu chỉ đang lợi dụng Vũ cho bước đường thăng tiến của mình.</p>\r\n<p>Nhưng dù là thế cũng không thể tha thứ!</p>\r\n<p>Tự dưng Tuấn lại chảy nước mắt, rất tự nhiên đôi dòng lệ tràn xuống, Tuấn cũng chẳng buồn lau đi, hắn nẳm ngã ngửa lên trên thành ghế, ngả đầu về phía sau đóng chặt mắt lại, người nhẹ như bỗng. Tự nhiên hắn yếu đuối tới lạ lùng, chỉ muốn đến ngay bên Thu mà ôm chặt lấy cô vào lòng, giữ thật chặt để cô hiểu rằng hắn biết hết đấy và hắn sẵn sàng quên hết ngay, chỉ cần cô ở bên hắn và đừng làm hắn tổn thương thêm nữa. Vớ lấy chai rượu, hắn nốc ừng ực mặc cho cổ họng trở nên đắng nghét như muốn cháy bung lên... hắn sặc, rượu nhớp nháp trên mặt, chảy lênh láng trên sàn nhà, hơi rượu cay cay xộc vào mũi làm hắn như ngừng thở, trong cơn điên loạn hắn rạo rực quyết tâm trả thù, trả thù người con gái hắn yêu thương nhất. Tuấn lấy điện thoại, nhắn tin sang cho Thu:</p>\r\n<p>\"Mai anh về quê vài ngày, có việc gấp em ơi\"</p>\r\n<p>\"Sao tự dưng anh lại về gấp thế, để tối em sang gửi ít quà về cho bố mẹ\"</p>\r\n<p>\"Không cần đâu em, anh muốn ngủ 1 lúc, sáng mai đi sớm, gặp lại em sau\"</p>\r\n<p >***</p>\r\n<p>\"Yesterday was hell but today I\'m fine without you, runaway this time without you...\" miệng lẩm nhẩm theo một bài hát tiếng Anh, tay lái xe bám theo chiếc Land Cruise bóng lộn, trông Tuấn không khác lắm một thám tử được các bà các cô thuê để theo dõi các đức ông chồng rửng mỡ. 3 ngày bám theo Vũ, lắm lúc nhìn Thu cặp kè bên hắn, lắm lúc Tuấn muốn bước ngay tới mà tống một đấm vào bộ mặt bẩn thỉu, cái điệu cười nhơn nhơn của Vũ, để nhìn Thu hốt hoảng quỳ xuống mà van xin hắn bỏ qua. Nhưng cũng lắm lúc Tuấn nghĩ đến cảnh Thu trở mặt ngay với hắn, vênh mặt lên mà hỏi ngược rằng \"Ừ thì tôi phản bội anh đấy, anh làm gì tôi nào\" thì lúc đó Tuấn sẽ xử lý ra sao? Tát một tát vào bộ mặt đáng khinh đó và quay lưng bỏ đi? Không, không thể như vậy, hắn muốn Thu phải trả giá, một cái giá rất đắt vì đôi sừng vô hình mà Thu đã đặt lên đầu hắn. Nhục! Hắn cảm thấy rất nhục, và một thằng đàn ông một khi đã mang nhục thì tất thảy hắn có ý nghĩ trả thù, dù bằng cách hèn hạ nhất.</p>\r\n<p>Dẫu sao, trong cái chuyến làm thám tử không mong muốn này, Tuấn như chai sạn dần, sang đến ngày thứ 4, nhìn Vũ và Thu dắt tay nhau vào khách sạn, hắn chỉ lặng lẽ đốt thuốc, trầm ngâm không nói gì, dường như hắn đang nghĩ ngợi đến điều gì xa xôi lắm. Rồi hắn lên xe, rồ ga đi thẳng.</p>\r\n<p>Tuấn tìm đến nhà Vũ, hắn bấm chuông và một người đàn bà ra mở cửa. Trái ngược với suy nghĩ của Tuấn, vợ Vũ là một người phụ nữ trẻ xinh đẹp, cả 2 đã có một con gái sống tại một ngôi nhà khá bề thế tại phố nhà giàu.</p>\r\n<p>- Anh hỏi ai?</p>\r\n<p>Tuấn nhập vai, không chút dè dặt:</p>\r\n<p>- Chào chị, em là Tuấn làm việc tại công ty ABC chuyên về sửa chữa cài đặt mạng, máy tính. Em phụ trách quanh đây nên đến giới thiệu để khi gia đình mình cần sửa chữa cài đặt gì thì chỉ cần gọi cho em, em sẽ đến tận nhà sửa chữa và công ty bọn em tính công rất rẻ. Nhà mình có dùng máy tính chứ chị?</p>\r\n<p>- Có, nhưng không hư gì cả, không cần sửa.</p>\r\n<p>- Dạ vậy chị cứ cầm danh thiếp của em, nếu cần sửa chữa, cài đặt gì chị cứ gọi điện đến cho em, em tới liền.</p>\r\n<p>- Thôi được rồi, có gì tôi gọi</p>\r\n<p>- Dạ phiền chị cho em biết tên và số điện thoại của chị luôn, để em lưu vào danh mục khách hàng.</p>\r\n<p>- Chú phiền quá, tôi tên Hương, số điện thoại đây, 01668256xxx.</p>\r\n<p>- Dạ em cảm ơn chị nhiều.</p>\r\n<p>Tuấn đã định quay đi, bỗng đâu tự nhiên từ đâu một người đàn ông dáng người cao to trong nhà xồng xộc bước ra, hất hàm hỏi.</p>\r\n\r\n\r\n\r\n\r\n\r\n			<p>- Gì vậy mày?</p>\r\n<p>Tuấn chưa kịp trả lời, Hương đã đáp.</p>\r\n<p>- Người ta đến giới thiệu dịch vụ thôi. Anh vào nhà đi anh em mình nói tiếp chuyện.</p>\r\n<p>Hương đóng cửa lại cùng người đàn ông đi vào nhà, Tuấn chỉ nghe loáng thoáng Hương nói với người đàn ông đó, có vẻ khá thân thuộc: \"Em là em nghi ngờ bữa giờ rồi, hắn đi suốt ngày, về tới nhà cũng chẳng thèm ngó ngàng tới vợ con, không phải hú hí bên ngoài thì là gì, không biết con mắt xanh mỏ đỏ nào....\"</p>\r\n<p>Tuấn nhếch mép cười, vậy là đã xong, giờ chỉ còn chờ hạ màn.</p>\r\n<p>Nhưng vẫn còn có một việc Tuấn phải làm.</p>\r\n<p>Đêm, Tuấn ngồi vân vê cái điện thoại, lục tìm danh bạ, Tuấn ngạc nhiên khi vẫn lưu tên Thu trong máy là \"Vợ yêu\", hắn ngần ngừ, rồi bấm nút gọi.</p>\r\n<p>Một hồi chuông dài... không ai nhấc máy</p>\r\n<p>Thu đang làm gì? Lại ở bên Vũ sao?</p>\r\n<p>Lại một hồi chuông dài... vô cảm...</p>\r\n<p>Tuấn lại nghĩ đến cảnh Thu và Vũ dắt tay nhau bước vào khách sạn, tự nhiên hắn lại muốn ném thẳng cái điện thoại vào bức tường.</p>\r\n<p>Lại một hồi chuông nữa... Tuấn hít một hơi sâu, hai mắt khẽ nhắm. Mở mắt, rồi hắn khẽ nhún vai.</p>\r\n<p>- Anh!</p>\r\n<p>Hắn mỉm cười, vẫn thói quen cũ của Thu, luôn cố làm hắn giật mình trong mọi tình huống.</p>\r\n<p>- Đang làm gì vậy em</p>\r\n<p>- Em vừa đi tắm. Về quê vui không anh. Sao mấy ngày qua anh chẳng liên lạc gì với em, em nt anh cũng không trả lời.</p>\r\n<p>- À, máy anh hết pin, anh lại quên cầm cục sạc.</p>\r\n<p>- Anh đừng nói dối em, sao em điện thoại máy vẫn đổ chuông? Hay anh lại trốn đi chơi với đứa nào à, em mà biết là không xong đâu nghe.</p>\r\n<p>- Làm gì có em, mấy ngày nay ở quê rối việc quá, anh chẳng còn tâm trí đâu nữa.</p>\r\n<p>- Chuyện gì mà rối rắm, anh chỉ khéo viện lý do thôi.</p>\r\n<p>- Anh nói thật, đứa em họ anh uống thuốc ngủ tự tử, may mà cứu kịp. Tội nghiệp con bé, nó bị thằng người yêu phản bội nên nghĩ quẩn – Tuấn chống chế, và tự nhiên hài lòng với lời nói dối của mình, và hắn chờ xem phản ứng của Thu.</p>\r\n<p>- Anh..., thôi đừng nói những chuyện không vui nữa.</p>\r\n<p>- Ừ, nhưng anh thấy dạo này em xa cách quá, em không còn dành nhiều thời gian cho anh nữa.</p>\r\n<p>- Em xin lỗi, công việc của em dạo này bận rộn quá, em đang phụ trách một dự án quan trọng của công ty, lần này em muốn chuyên tâm để làm tốt, thành công thì sau này chỗ đững trong công ty mới vững chắc được.</p>\r\n<p>- Sự nghiệp quan trọng, nhưng có nhất thiết phải thế không em, hình như từ 2 tuần nay, mỗi ngày em chỉ ghé qua ngó mặt anh lấy một lần. Em có gì giấu anh sao?</p>\r\n<p>- Anh đừng nói chuyện như vậy nữa, em thấy mệt mỏi lắm. Em cố gắng vì công việc có gì sai, anh không ủng hộ em thì đừng làm em thêm gánh nặng như thế. Sự nghiệp đương nhiên là quan trọng, sống trên đời phải có tiền, càng có nhiều tiền thì càng thoải mái và người ta càng tôn trọng mình, em không cam chịu sống nghèo mãi.</p>\r\n<p>- Nhưng anh vẫn có thể lo cho em?</p>\r\n<p>- Em biết, nhưng bao giờ đây. Lương anh cũng chỉ đủ để anh cà phê, bù khú với bạn bè, nếu mình lấy nhau, rồi có con, làm sao lo lắng đầy đủ cho con được đây anh?</p>\r\n<p>- Anh biết, là tại anh cả - Tuấn như thấy cổ họng mình nghẹn đắng, nước mắt cứ ầng ậc như muốn trào ra.</p>\r\n<p>- Anh... anh sao vậy, em xin lỗi, đáng lẽ em không nên nói vậy. Mà anh nè, bao giờ anh lên đây với em lại vậy.</p>\r\n<p>- Chắc vài ngày nữa em ạ, dưới này vẫn còn nhiều việc quá.</p>\r\n<p>- Vâng, cho em gửi lời hỏi thăm bố mẹ anh nhé. Mà anh biết không, mấy ngày nay....</p>\r\n<p>Tuấn thẫn thờ, để mặc Thu huyên thuyên đủ thứ chuyện trên điện thoại, hắn chỉ ậm ừ cho có lệ, thấy Tuấn không hào hứng nói chuyện, Thu cũng chẳng biết nói thêm gì.</p>\r\n<p>Họ gác máy, hai tâm trạng hỗn loạn, hai đôi mắt nhìn về hai hướng, hai trái tim đã không còn chung nhịp đập... Tuấn chầm chậm xóa tên Thu ra khỏi danh bạ máy.</p>\r\n<p >***</p>\r\n<p >&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>- Chị là chị Hương phải không?</p>\r\n<p>- Vâng, ai vậy?</p>\r\n<p>- Tôi thấy chồng chị đi vào khách sạn XYZ cùng một cô gái, sao chị không đến đó xem thử xem.</p>\r\n<p>- Anh là ai, alô alô... này...</p>\r\n<p>Đầu bên kia đã gác máy...</p>\r\n<p>Tay run run, Hương bấm gọi lại, nhưng thuê bao đã không liên lạc được. Hương lại gọi ngay vào số khác.</p>\r\n<p>- Anh qua nhà em ngay, loạn, loạn thật rồi, Vũ ngoại tình thật rồi, huhu...</p>\r\n<p>Hương buông thõng người xuống sàn, chiếc điện thoại rơi xuống bung ra, máy một đường, pin một nẻo.</p>\r\n<p ><strong>***</strong></p>\r\n<p >&nbsp;</p>\r\n<p>- Tao thấy nó ra khỏi nhà rồi. Ngồi trên xe thằng nào to con lắm, có thêm vài đứa đi theo nữa, trông như du côn.</p>\r\n<p>- Ừ cảm ơn mày, rút đi.</p>\r\n<p>- Mà mày đang làm clgt? Tao đéo hiểu cái cm gì cả.</p>\r\n<p>- Có việc cần phải làm thôi, thế nhé.</p>\r\n<p>Tuấn cúp máy, vậy là Hương đã ra khỏi nhà, Thu và Vũ cũng đã tay trong tay dắt nhau vào khách sạn, mọi việc đã an bài, giờ hắn chỉ cần chờ đợi. Tuấn nhếch mép, khoan khoái nghĩ đến cảnh Thu và Vũ bị bắt tại trận, về dáng vẻ nhục nhã của Thu khi đó. Và đương nhiên, vụ đánh ghen hẳn cũng sẽ dìm Thu xuống bùn, hay ít nhất Thu cũng không còn mặt mũi để làm việc cùng công ty với Vũ nữa, hơn ai hết, Tuấn hiểu rõ tính cách Thu, chịu đả kích lớn như vậy sẽ không thể nào đứng dậy nổi. Cứ nghĩ đến cảnh Thu và Vũ khóc lóc quỳ xuống lạy lục, van xin người đàn bà nọ, Tuấn lại cười thích thú. Thu như đang quỳ trước mặt hắn, chịu những cái tát, cái đấm đá của đám người hung tợn, hắn bật cười to hơn, tiếng cười của hắn làm những vị khách trong quán khó chịu, ai cũng nhìn chăm chăm về phía hắn khó hiểu nhưng hắn nào có để ý, nghĩ đến lúc Thu đối diện với hắn, hắn càng cười như điên dại, như thể chưa bao giờ được cười... Nước mắt vẫn rơi đều theo từng tràng cười của hắn, trong cơn điên, hắn vớ lấy điện thoại bấm số, một số điện thoại hắn không thể nào quên...</p>\r\n<p >***</p>\r\n<p>Thu lững thững bước từng bước chậm, tâm trạng cô rối bời, ánh mắt cô không dấu được vẻ phiền muộn, đi dạo nhưng lòng không chút thanh thản chỉ muốn tìm một chỗ để nghỉ chân, ngồi xuống ghế đá nhưng lòng bất an khiến cô đứng vụt dậy, lại lững thững cất bước. Hôm nay Tuấn hẹn gặp cô ở đây sau những ngày anh cố tình tránh mặt, mặc cho cô đến tận phòng trọ lẫn công ty anh để tìm, hỏi bạn bè Tuấn cũng không ai biết anh ở đâu. Thu tự hỏi một lúc nữa thôi, đối diện với Tuấn cô phải làm sao? Và tại sao mọi chuyện lại diễn biến kì lạ như vậy... có tiếng chuông tin nhắn, Thu run run mở ra xem, tin nhắn từ một số lạ: \"Tạm thời cắt liên lạc, vợ anh làm dữ quá. Đừng tìm anh\" – là tin nhắn của Vũ, Thu không để tâm, tâm trí cô như lùi về cái ngày hôm đó...</p>\r\n<p>Ngày hôm đó, Thu và Vũ vừa lên đến phòng khách sạn thì chuông điện thoại đổ vang, là số của Tuấn, hơi ngần ngừ nhưng Thu vẫn bắt máy, không để cô kịp cất lời, đầu dây bên kia nói như hét: \"Ra khỏi đó ngay, vợ Vũ sắp đến đấy rồi\", và cũng bất ngờ như cuộc gọi đến, Tuấn đã cắt máy. Thu như chết đứng, ánh mắt nhìn Vũ trân trân khiến Vũ cũng phát hoảng.</p>\r\n<p>Cả hai vội vã xuống quầy, Vũ ném vội chìa khóa và 2 tờ 500k lên bàn cô lễ tân cùng lời dặn: \"Ai hỏi cũng không được nói anh đến đây\" rồi kéo tay Thu vội vã chui vào xe, chuồn thẳng. Chạy được một quãng, qua gương chiếu hậu, cả Thu và Vũ đều nhận ra Hương đang hung hăng xộc thẳng vào khách sạn. Vũ như trút được gánh nặng, hắn thả Thu xuống một góc đường, còn Thu như người mất hồn, tóc tai rũ rượi, chỉ lẩm bẩm \"Tuấn... Tuấn... biết rồi...\".</p>\r\n<p>- Cô ơi cô.</p>\r\n<p>Thu nhìn xuống, một cô bé đến bên Thu từ bao giờ</p>\r\n<p>- Cô ơi cô, có chú gì đó nhờ con đưa cái này cho cô</p>\r\n\r\n\r\n\r\n					\r\n\r\n		<p>- Cô cám ơn con – Thu mỉm cười nhận lá thư từ con bé – Thế người đưa cho con cái này đâu rồi?</p>\r\n<p>- Chú ấy đi rồi cô ạ.</p>\r\n<p>Thu vội vã nhìn quanh, chạy tới chạy lui quanh những gốc cây tìm Tuấn nhưng tuyệt nhiên không thấy, chạy một hồi đã thấm mệt, cô ngồi xuống và mở bức thư, là nét chữ quen thuộc nhưng dường như vết mực đã nhòe đi vì nước mắt của Tuấn...</p>\r\n<p><strong><em>Rốt cuộc thì anh cũng không thể làm tổn thương đến em, là tại vì sao, là vì anh còn quá yêu em hay anh chỉ là một thằng đàn ông hèn nhát? Giờ chắc em đang có nhiều câu hỏi muốn hỏi anh, vậy để anh nói cho em biết, mọi việc là do anh sắp đặt hết. Là anh đã theo dõi em và Vũ, và cũng chính anh là người báo cho vợ Vũ biết hai người đã đến khách sạn. Anh làm thế là vì anh hận em lắm, em là một đứa con gái khốn nạn mà anh thấy ghê tởm. </em></strong></p>\r\n<p><strong><em>Em nghĩ anh là thằng ngu chỉ biết dán mắt vào màn hình máy tính, để em có thể phản bội anh bất cứ lúc nào em muốn? Em đã phản bội lại tất, anh thật sự muốn biết vì sao em lại làm như vậy. Nhưng để làm gì hả em? cả anh và em đều đã sai lầm mà không cách nào sửa chữa. Anh đã nghĩ là anh sẽ hả hê lắm khi đã dồn em vào chỗ chết, nhưng anh lại không thể xuống tay hạ thủ dù anh muốn em đau đớn hơn thế hàng ngàn lần. </em></strong></p>\r\n<p><strong><em>Ừ, em có thể chửi anh, nguyền rủa anh là hèn hạ, không dám đối diện với em mà lại lén lút bày ra trò đê tiện này, tại sao anh lại đối xử tuyệt tình như thế đối với em để rồi lại hèn nhát nương tay? Em có thể cười mà khinh bỉ, anh không quan tâm, tất cả với anh giờ đây đã không còn quan trọng, tất cả, kể cả em. Có bao giờ em tự hỏi anh tại sao anh lại tuyệt tình như thế với em, và giữa những bộ mặt lạnh lùng, hèn hạ và đàn bà đó, em tìm thấy anh ở đâu? Có lẽ em sẽ chẳng thể nào trả lời được, em vẫn chưa hiểu hết về anh đâu, con khốn!</em></strong></p>\r\n<p><strong><em>Hãy cứ làm những gì em muốn, anh sẽ đi khỏi cái thành phố chết tiệt đầy ắp những kỉ niệm về em này. Đừng tha thứ cho anh, cũng như anh vĩnh viễn không tha thứ cho em. Kết thúc ở đây thôi em, anh và em sẽ cùng mang cái mặt nạ thơ ngây để lừa ai đó mà ta có tình cảm sau này, chôn giấu tất cả những gì của quá khứ vào một ngóc ngách khó tìm ra nhất để hai ta không lặp lại thêm bất cứ một lần nào nữa. Em hãy sống một cuộc sống tốt như em hằng mong muốn, nhưng đừng đánh đổi bản thân em và hạnh phúc của những người em yêu thương.</em></strong><br /><strong><em>Vĩnh biệt!</em></strong></p>\r\n<p>Đến tận bây giờ Thu vẫn không thể tin vào những gì vừa trải qua. Tay cầm lá thư của Tuấn mà cô đã đọc đi đọc lại không biết bao nhiêu lần, Thu lững thững đi dạo trong công viên, con đường vắng vẻ sâu hun hút nằm giữa hai hàng cây lúc này đã trơ trọi lá, con đường mà Tuấn đã dẫn cô đi dạo trong buổi hẹn đầu. Thu vừa bước vừa nhắm mắt, cô như cảm thấy bàn tay anh đang nắm chặt tay mình, nụ cười hồn nhiên và giọng nói ấm áp ngày nào của anh vẫn như văng vẳng bên tai cô: \"Anh sẽ không bao giờ xa em đâu, ngốc ạ\". Một giọt nước mắt lăn nhẹ trên má Thu...</p>\r\n<p ><em><strong>Minh Anh</strong></em></p>         ', 'images/stories/2020/08/original/em-chua-hieu-het-ve-anh-dau-con-khon.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'em-chua-hieu-het-ve-anh-dau-con-khon', NULL, NULL, NULL, '2020-08-20 00:39:50', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/235-em-chua-hieu-het-ve-anh-dau-con-khon.html'),
(19, 'Bạn tốt nhất', 'Tôi muốn nói với em, tôi muốn cho em biết rằng tôi không muốn chỉ là bạn. Tôi yêu em nhưng tôi quá nhút nhát, tôi cũng không hiểu tại sao.', '\r\n        	<p ><strong>Tôi muốn nói với em, tôi muốn cho em biết rằng tôi không muốn chỉ là bạn. Tôi yêu em nhưng tôi quá nhút nhát, tôi cũng không hiểu tại sao.</strong></p>\r\n<p ><strong>***</strong></p>\r\n<p ><strong><img alt=\"1-than\" src=\"/uploaded/images/stories/2020/08/1-than.jpg\"   /></strong></p>\r\n<p ><em>Năm học lớp 10,</em></p>\r\n<p >Ngồi trong lớp học Anh văn, tôi chăm chú nhìn cô bé cạnh bên. Em là người mà tôi luôn gọi là BẠN TỐT NHẤT. Tôi chăm chú nhìn mái tóc dài và mượt của em và ước gì em là của tôi. Nhưng em không xem tôi như thế và tôi biết điều đó. Sau buổi học, em đến gần và hỏi mượn tôi bài học em nghỉ hôm trước. Em nói : \"Cảm ơn anh !\" và hôn lên má tôi. Tôi muốn nói với em, tôi muốn cho em biết rằng tôi không muốn chỉ là bạn. Tôi yêu em nhưng tôi quá nhút nhát, tôi cũng không hiểu tại sao.</p>\r\n<p ><br /><em>Năm học lớp 11,</em></p>\r\n\r\n\r\n\r\n\r\n\r\n			<p >Chuông điện thoại reo. Đầu dây bên kia là em. Em khóc và thút thít về cuộc tình vừa tan vỡ. Em muốn tôi đến với em, vì em không muốn ở một mình, và tôi đã đến. Khi ngồi cạnh em trên sofa, tôi chăm chú nhìn đôi mắt ướt nước của em và ước gì em là của tôi. Sau hai tiếng đồng hồ, cùng bộ phim của Drew Barrymore và ba túi khoai tây rán, em quyết định đi ngủ. Em nhìn tôi, nói : \"Cảm ơn anh !\" và hôn lên má tôi. Tôi muốn nói với em, tôi muốn cho em biết rằng tôi không muốn chỉ là bạn. Tôi yêu em nhưng tôi quá nhút nhát, tôi cũng không hiểu tại sao.</p>\r\n<p ><br /><em>Năm cuối cấp,</em></p>\r\n<p >Vào một ngày trước đêm khiêu vũ dạ hội mãn khóa, em bước đến tủ đựng đồ của tôi. \"Bạn nhảy của em bị ốm\", em nói, \"Anh ấy sẽ không khỏe sớm được và em không có ai để nhảy cùng. Năm lớp 7, chúng mình đã hứa với nhau là nếu cả hai đứa đều không có bạn nhảy, chúng mình sẽ đi cùng nhau như NHỮNG NGƯỜI BẠN TỐT NHẤT.\" Và chúng tôi đã làm như thế. Vào đêm dạ hội, sau khi tiệc tan, tôi đứng ở bậc tam cấp trước cửa phòng em. Tôi chăm chú nhìn em khi em mỉm cười và nhìn bóng tôi trong đôi mắt lấp lánh của em. Tôi muốn em là của tôi nhưng em không nghĩ về tôi như thế và tôi biết điều đó. Rồi sau, em nói : \"Em đã có giờ phút vui vẻ nhất, cảm ơn anh !\" và hôn lên má tôi. Tôi muốn nói với em, tôi muốn cho em biết rằng tôi không muốn chỉ là bạn. Tôi yêu em nhưng tôi quá nhút nhát, tôi cũng không hiểu tại sao.</p>\r\n<p><img  alt=\"1-than2\" src=\"/uploaded/images/stories/2020/08/1-than2.jpg\"   /></p>\r\n<p ><br /><em>Ngày tốt nghiệp,</em></p>\r\n<p >Từng ngày trôi qua, rồi từng tuần, từng tháng. Chớp mắt đã là ngày tốt nghiệp. Tôi ngắm nhìn hình dáng tuyệt vời của em nổi lên như một thiên thần trên sân khấu khi nhận bằng tốt nghiệp. Tôi muốn em là của tôi nhưng em không xem tôi như thế và tôi biết điều đó. Trước khi mọi người trở về nhà, em tiến về phía tôi trong áo khoác và mũ, khóc khi tôi ôm em. Rồi sau, nhấc đầu lên khỏi vai tôi, em nói : \"Anh là BẠN TỐT NHẤT của em, cảm ơn anh !\" và hôn lên má tôi. Tôi muốn nói với em, tôi muốn cho em biết rằng tôi không muốn chỉ là bạn. Tôi yêu em nhưng tôi quá nhút nhát, tôi cũng không hiểu tại sao.</p>\r\n<p ><br /><em>Vài năm sau,</em></p>\r\n<p >Giờ đây, tôi đang ngồi trong băng ghế dài trong nhà thờ. Cô bé ấy đang làm lễ kết hôn. Tôi nhìn em khi em nói : \"Tôi hứa\" và bắt đầu một cuộc sống mới, với một người đàn ông khác. Tôi muốn em là của tôi nhưng em không xem tôi như thế và tôi biết điều đó. Nhưng trước khi lên xe đi, em đến gần tôi và nói : \"Anh đã đến, cảm ơn anh !\" và hôn lên má tôi. Tôi muốn nói với em, tôi muốn cho em biết rằng tôi không muốn chỉ là bạn. Tôi yêu em nhưng tôi quá nhút nhát, tôi cũng không hiểu tại sao.</p>\r\n<p ><br /><em>Lễ tang,</em></p>\r\n<p >Đã nhiều năm trôi qua, tôi nhìn xuống chiếc quan tài chứa bên trong cô bé đã từng là BẠN TỐT NHẤT của mình. Trong buổi lễ, người ta đã tìm thấy quyển nhật ký của em trong suốt những năm trung học. Và đây là những gì em viết : <em>\" Tôi chăm chú nhìn anh và ước gì anh là của tôi nhưng anh không xem tôi như thế và tôi biết điều đó. Tôi ước anh nói với tôi rằng anh yêu tôi. Tôi ước mình cũng có thể làm được điều đó... Tôi chỉ nghĩ một mình và khóc.</em><br /><em>Em yêu anh em yêu anh em yêu anh...\"</em><br /><strong></strong></p>\r\n\r\n\r\n\r\n					\r\n\r\n		<p ><strong>(Bảo Vy -&nbsp;</strong><strong>dịch từ Internet)</strong></p>         ', 'images/stories/2020/08/original/ban-tot-nhat.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'ban-tot-nhat', NULL, NULL, NULL, '2020-08-20 00:39:54', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/234-ban-tot-nhat.html'),
(20, 'Chị yêu em mất rồi', 'Em biết, em chẳng thể dạy chị những bài toán khó như các anh khác nhưng chị hãy tin, chỉ cần em thôi, sẽ lo lắng được cho chị mọi điều. Em biết, em chẳng thể yêu ai ngoài chị, nên xin chị đừng gạt em ra khỏi cuộc đời nhỏ bé của chị. Em biết, khi mọi thứ có thay đổi thì tình yêu em vẫn thế, dành trọn cả cho chị…chị của em……em sẽ không gọi chị là chị nữa, em muốn được 1 lần gọi chị là em…..để nói rằng anh yêu em.', '\r\n        	<p><strong>Em biết, em chẳng thể dạy chị những bài toán khó như các anh khác nhưng chị hãy tin, chỉ cần em thôi, sẽ lo lắng được cho chị mọi điều. Em biết, em chẳng thể yêu ai ngoài chị, nên xin chị đừng gạt em ra khỏi cuộc đời nhỏ bé của chị. Em biết, khi mọi thứ có thay đổi thì tình yêu em vẫn thế, dành trọn cả cho chị…chị của em……em sẽ không gọi chị là chị nữa, em muốn được 1 lần gọi chị là em…..để nói rằng anh yêu em.</strong></p>\r\n<p >***</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/1-lovesmall.jpg\" /></p>\r\n<p>- Sao em</p>\r\n<p>- Em có chuyện muốn nói</p>\r\n<p>- Uh, chị nghe nè</p>\r\n<p>- Em yêu chị</p>\r\n<p>Tôi quay lại nhìn vào đôi nó rồi vội vã quay đi</p>\r\n<p>- Về ngủ đi , muộn rồi, chị tự về nhà được</p>\r\n<p>Chẳng hiểu sao lại sợ đôi mắt của em đến vậy, nó chứa đựng sự thật mà tôi đang cố trốn tránh, cố lãng quên chăng? Hay tại nó quá can đảm làm tôi run sợ? em và tôi vốn dĩ đã là 2 thế giới, giữa chúng ta có muôn ngàn cách trở mà chẳng thể nào đến bên cạnh nhau đựơc dù cho tôi có làm bất cứ điều gì đi nữa</p>\r\n<p>- Chị à ngủ ngon nhé………em sẽ chờ chị ……..sẽ chờ……….sẽ chờ</p>\r\n<p>Tiếng em hét lên từ đằng sau tôi, nhỏ dần, nhỏ dần rồi im bặt đi khoảng không bao đang tràn ngập trong bóng tối đến lạnh cả người. Tình yêu của chúng ta rồi sẽ thế thôi em à, nó vỗn dĩ đã mỏng manh, yếu đuối và dại khờ.</p>\r\n<p >***</p>\r\n\r\n\r\n\r\n\r\n\r\n			<p>Tôi và em quen nhau cũng đã khá lâu rồi nhỉ, tôi không biết chắc là từ ngày nào nhưng hình như đã 14 năm rồi kể từ ngày tôi dọn đến cạnh nhà em, lúc đó tôi 5 tuổi và em chỉ mới là cậu bé còn bế bồng trên tay. Điều gì đã xảy ra giữa chúng ta cho đến tận ngày hôm nay nhỉ? Tôi quên rồi, em còn nhớ không? Đâu đó mờ ảo những tiếng cười…..giọng nói……và cả hình bóng em nữa…..</p>\r\n<p>- Sao chị không nói gì cả</p>\r\n<p>- Nói gì là nói gì?</p>\r\n<p>- Em…….em…</p>\r\n<p>- Thôi dẹp em đi, chị bận lắm, đừng làm phiền</p>\r\n<p>- Vậy em về trước</p>\r\n<p>Nói thế rồi nó bước đi, tôi đợi nó đi xa mới dám quay lại nhìn, tôi đã nhìn theo nó từng ngày, từng ngày từ lúc nó còn bé xíu cho đến tận bây giờ, khi nó đã đủ lớn để tự bước đi, không phải vịn vào đôi tay tôi nữa. Nó cũng chẳng còn khóc mếu máo trước mặt tôi, chẳng lon ton với cây kem sữa như ngày nào, nó lớn rồi, ừ lớn thật rồi.</p>\r\n<p>Hôm nay trời mưa to lắm, tôi biết thế nào em cũng cầm dù đứng đợi tôi cùng về thế nên tôi lại sợ, sợ trái tim mình loạn nhịp, sợ lý trí mình không thể kiểm soát được con tim……sợ em…….sợ em nói yêu tôi……sợ tôi sẽ không đủ mạnh mẽ để bước qua những rung động từ trong chính tình yêu của mình.</p>\r\n<p>- Chị ơi</p>\r\n<p>- Mưa mà cũng đến à</p>\r\n<p>- Em sợ chị ướt</p>\r\n<p>- Thôi về lẹ, lạnh quá</p>\r\n<p>Chúng tôi cùng bước trên con đường dài quen thuộc đến từng viên sỏi nhỏ, sao bỗng dưng hôm nay con đường lại trở nên vắng vẻ và buồn tẻ đến lạ thường</p>\r\n<p>- Chị</p>\r\n<p>- Ừ</p>\r\n<p>- Cho em nắm tay chị như lúc còn bé nhé</p>\r\n<p>Tôi lạnh cả người trước câu nói của em, cũng chợt nhớ ra không biết từ lúc nào mình không còn nắm tay em nữa. Có lẽ từ ngày tôi hiểu, trái tim tôi, rất lạ….khi cạnh em.</p>\r\n<p>- Làm gì?</p>\r\n<p>- Em chỉ muốn thế thôi.</p>\r\n<p>Rồi em đưa đôi bàn tay nhỏ bé ngày nào nắm lấy tay tôi. Điều tôi lo sợ đã thật sự xảy ra. Tôi chẳng thể làm được gì cả….</p>\r\n<p>- Chị</p>\r\n<p>- Gì nữa đây</p>\r\n<p>Trái tim tôi ngừng đập đúng giờ phút ấy khi em nhìn thẳng vào đôi mắt tôi, tôi sợ em sẽ bắt gặp được điều tôi đã cố dấu kín từ rất lâu. Tôi quay đi, chạy thật nhanh, đôi tay tôi rời khỏi bàn tay em, nhói đau đến lạ thường, tôi bật khóc.</p>\r\n<p>Ba ngày sau tôi chẳng bước chân ra khỏi nhà, một phần vì sợ, phần khác vì tôi ốm, ốm trong ngày mưa hôm ấy và vì tôi bận suy nghĩ về em.</p>\r\n\r\n\r\n\r\n					\r\n\r\n		<p>Ngày thứ tư, sau khi lấy hết can đảm và bình tĩnh tôi đến tìm em. Ngôi nhà mà tôi thuộc lòng đến từng vị trí kể cả công tắc điện. Hơi lạ, lẽ ra em phải ngồi ở đây chơi đàn chứ, sao lại không thấy? tôi cứ ngỡ em đi đâu đó nên ra về.</p>\r\n<p>Trong căn phòng nhỏ của tôi, nơi đầy dẫy sự hiện diện của em và đúng thật, em đã đến đây, cho cá ăn dùm tôi và tưới nước cho mấy chậu hoa, em để lại cho tôi 1 lá thư dài :</p>\r\n<p><em>“ Chị à, nếu em không phải là em chị có mở lòng để yêu em không? Nếu em chẳng giàu có hay sang trọng gì chị có yêu em không? Nếu em bỏ đi thật xa để quên chị, chị có muốn thế không?. Em biết, em chẳng phải người anh hùng trong những câu chuyện chị kể khi còn bé, người anh hùng có thể bảo vệ người mình yêu, nhưng em tin, chỉ cần em thôi cũng đủ để chị dựa vào mọi lúc. Em biết, em chẳng thể dạy chị những bài toán khó như các anh khác nhưng chị hãy tin, chỉ cần em thôi, sẽ lo lắng được cho chị mọi điều. Em biết, em chẳng thể yêu ai ngoài chị, nên xin chị đừng gạt em ra khỏi cuộc đời nhỏ bé của chị. Em biết, khi mọi thứ có thay đổi thì tình yêu em vẫn thế, dành trọn cả cho chị, chị của em……em sẽ không gọi chị là chị nữa, em muốn được 1 lần gọi chị là em…..để nói rằng anh yêu em. Anh sẽ trở về, anh hứa đấy, trở về để còn yêu em như bây giờ hoặc hơn cả bây giờ, em hãy chờ và hãy mở lòng để cũng yêu anh đi nhé……em đã từng nói, phía sau bóng đêm là ánh sáng và phía sau giọt nước nước mắt là nụ cười đúng không? Anh sẽ đi tìm điều đó, rồi anh sẽ tìm thấy, phía sau sự tin tưởng là tình yêu của chúng ta. Yêu em! “</em></p>\r\n<p>Tôi đã khóc từ lúc nào rồi ngủ thiếp đi bên lá thư của em, có giấc mơ nào đó tôi thấy em, và tôi cũng thấy tôi, chúng ta cùng đứng cạnh nhau trong giáo đường nhỏ, có tiếng đàn, tiếng chúc mừng của mọi người…Tôi là cô dâu của em.</p>         ', 'images/stories/2020/08/original/chi-yeu-em-mat-roi.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'chi-yeu-em-mat-roi', NULL, NULL, NULL, '2020-08-20 00:39:56', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/217-chi-yeu-em-mat-rui.html'),
(21, 'Ngoại lệ duy nhất', 'Phải! Anh có thể không coi tôi là gì cả, anh có thể sẽ rời khỏi cuộc đời tôi mãi mãi. Nhưng tôi muốn gặp anh lần cuối, muốn chạm vào anh lần cuối, muốn nói với anh rằng: \"Anh là ngoại lệ của em...Vì thế, em yêu anh!\"', '\r\n        	<p><strong>Phải! Anh có thể không coi tôi là gì cả, anh có thể sẽ rời khỏi cuộc đời tôi mãi mãi. Nhưng tôi muốn gặp anh lần cuối, muốn chạm vào anh lần cuối, muốn nói với anh rằng: \"Anh là ngoại lệ của em...Vì thế, em yêu anh!\"</strong></p>\r\n<p ><strong>***</strong></p>\r\n<p ><strong><img alt=\"\" src=\"/uploaded/images/stories/2020/08/1o.jpg\" /></strong></p>\r\n<p>\"Anh nói thế mà nghe được à?\"</p>\r\n<p>\"Tao nói thế đấy!\"</p>\r\n<p>\"Anh và cả gia đình anh là một lũ vô tình khốn nạn!\"</p>\r\n<p>Một cái bạt tai thẳng vào mặt khiến mẹ ngã nhào xuống đất. Tôi vội vàng ôm lấy thân hình gầy guộc và chịu lấy những cú đấm từ sau lưng, nước mắt chảy tan xuống môi mặn cay không phải vì đau. Tôi ngước đôi mắt đỏ hoắc, xoáy vào đôi mắt ông. Nhận ra đôi tay mình đã dội những cú đau điếng xuống cô con gái bé nhỏ chứ không phải người vợ của mình. Khuôn mặt tội lỗi, ông cũng đau đáu nhìn tôi ngân ngấn một hàng lệ, trước khi quay mặt và chạy ra khỏi cửa.</p>\r\n<p >***</p>\r\n<p>Học chuyên toán nhưng say mê những cuốn tiểu thuyết tình yêu, thích làm những việc lãng mạn một mình. Tôi lúc nào cũng lang thang trên con đường riêng với những suy nghĩ độc lập, che dấu, giết chết một phần khao khát được yêu thương trong mình. Bởi từ lâu, tôi không còn tin vào tình yêu. Bởi nếu nó có thật, nó cũng chẳng đi đến đâu.</p>\r\n\r\n\r\n\r\n\r\n\r\n			<p>\"Con sẽ không lấy chồng cũng chẳng cần yêu ai. Con sẽ ở vậy với mẹ\" - Tôi nói rành rọt như vậy từ cái ngày còn chớm dậy thì khi mà bạn bè xunh quanh mình còn đang ngây ngất với những cú cảm nắng \"lãng xoẹt\".</p>\r\n<p>Đã gần mười năm trôi qua, mẹ gặng hỏi bao nhiêu lần tôi vẫn trả lời nguyên một câu như vậy. Đó chẳng phải là lời ngây ngô của một đứa con nít, đó là cách sống tôi lựa chọn. Tôi làm mọi thứ có sắp xếp theo sự lựa chọn của mình. Đối với tôi, không có số phận nào cả, tất cả đều nằm trong lòng bàn tay mình.</p>\r\n<p>Nhưng anh đâu có nằm trong đôi bàn tay tôi. Anh không phải là là kiểu người thân thiện, biết cách nói chuyện đùa làm tôi cười, không biết cách làm cái trái tim vốn lạnh giá của tôi nồng ấm trở lại. Anh chỉ đơn giản ... khiến tôi phát điên.</p>\r\n<p>Chúng tôi chỉ đơn giản như hai tảng băng buốt giá đang tan chảy vì nhau. Tôi thích được nhìn thấy anh cười, nghe anh gọi tên mình, niềm yêu thích trở thành thói quen. Tôi thường cố gắng đi thật nhanh trước anh để anh gọi to tên tôi, và khi quay lại sẽ thấy anh đang mỉm cười. Những ngày mùa thu và mùa đông ấm áp hiếm hoi trong cuộc đời tôi...có anh.</p>\r\n<p>Giữa chúng tôi không có một sự ràng buộc nào cả, bởi cả hai cùng sợ điều đó. Chỉ có những cảm xúc thật gần bên anh, những lúc tôi mệt mỏi và có thể dựa vào bờ vai anh hít thở thật dễ chịu mỗi buổi chiều, mỗi khi khó khăn đều có anh bên cạnh dẫu chỉ là một lời cổ vũ \"Cố lên!\". Hay những khi vô tình bắt gặp ánh mắt nhau, trao cho nhau những nụ hôn mà cả hai cùng biết đó không thể chỉ là tình bạn.</p>\r\n<p>Bạn bè cũng không khỏi tò mò hỏi han về mối quan hệ của chúng tôi mà bản thân tôi cũng không biết đó là gì. Cả hai chúng tôi đều hài lòng và hạnh phúc bên nhau. Có cần thiết đặt tên cho mối quan hệ khi mà tất cả những gì tôi cần chỉ là anh thôi.</p>\r\n<p>Anh đi Đức ngay sau ngày khi tốt nghiệp. Tôi vẫn luôn biết rồi một ngày anh sẽ ra đi khỏi cuộc đời mình theo một cách nào đó nhưng khi biết ngày mai anh sẽ ra đi. Ngày mai và rất nhiều năm sau này nữa, tôi có thể sẽ không bao giờ còn gặp lại anh. Tôi cảm thấy như một phần trong tôi đang sụp đổ.</p>\r\n<p>Đêm hôm ấy, trước ngày anh đi, tôi thức trắng. Cả một tuần dài tôi cũng không buồn gặp anh hay một lời hỏi thăm trước khi anh rời đi và anh cũng không nói lời nào. Có lẽ như vậy tốt hơn, im lặng từ biệt và im lặng quên đi. Dẫu sao, chúng tôi đâu phải là gì để níu kéo hay nhớ mong.</p>\r\n<p>Ngồi cùng lũ bạn tụ tập cuối năm, tôi rối bời liếc nhìn kim đồng hồ, chỉ tiếng rưỡi nữa là máy bay cất cánh. Những tràng vỗ tay, hát hò, chúc tụng náo nhiệt xung quanh, tôi đặt cốc rượu xuống bàn vội vàng gọi taxi đến phi trường. Phải! Anh có thể không coi tôi là gì cả, anh có thể sẽ rời khỏi cuộc đời tôi mãi mãi. Nhưng tôi muốn gặp anh lần cuối, muốn chạm vào anh lần cuối, muốn nói với anh rằng: \"Anh là ngoại lệ của em...Vì thế, em yêu anh!\"</p>\r\n<p>Tôi hộc tốc chạy vào khu cửa kiểm soát, nhưng đã muộn. Tôi vội vàng rút điện thoại gọi cho anh vừa thở hổn hển. Anh nghe máy:</p>\r\n<p>- Có chuyện gì vậy em?<br />- Anh...anh.....bay...rồi..à?<br />- Ừ. Máy bay sắp cất cánh...anh phải tắt máy đây. Tạm biệt em!</p>\r\n<p>Tôi đứng trân trân giữa bao người, nước mắt đã ướt đẫm mặt từ khi nào, hai tay buông thõng. Tôi khóc nấc lên trước sự chú ý của bao người qua lại. Tạm biệt anh!</p>\r\n<p >***</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/1o1.jpg\" /><br />&nbsp;</p>\r\n<p>Những năm sau này mẹ và bạn bè luôn cố gắng giới thiệu, đưa tôi đi xem mặt, làm quen rất nhiều đám mong muốn tôi từ bỏ ý định độc thân. Tôi cũng đã nghĩ nếu có thể rung động một lần, biết đâu lại có lần thứ hai. Nhưng mọi thứ đều như một trò hề vô ích, tôi càng gặp nhiều người càng chỉ càng chán ngán chuyện chồng con. Tôi thuyết phục mẹ và lập kế hoạch làm mẹ đơn thân. Sau bao ngăn cản, nhưng vì tôi quá bướng bỉnh mọi người đành&nbsp;đồng tình và giúp đỡ tôi.</p>\r\n<p>Hôm ấy là một ngày mùa thu bắt đầu se lạnh, cô bạn lái xe đưa tôi đến một bệnh viện phụ sản tư nhân nghe nói rất có danh tiếng trong việc điều trị mang thai theo ý muốn. Nhìn hàng cây xơ xác lá, nụ cười ấm áp của anh lại thoảng qua trong tâm trí tôi.</p>\r\n<p>Người ta thay cho tôi một bộ váy bệnh nhân rồi dẫn đến phòng khám, nghe nói sẽ có một bác sĩ đầu ngành từng tu nghiệp ở nước ngoài sẽ khám riêng cho tôi nhờ sự sắp xếp của cô bạn.</p>\r\n<p>Vừa ngước mắt lên, tôi như sững người, không phải là anh nhưng chính là anh. Không còn dáng vẻ thư sinh như ngày đi học nhưng khuôn mặt, nụ cười ấy lại chính là anh.</p>\r\n\r\n\r\n\r\n					\r\n\r\n		<p>- Vẫn quyết tâm sống độc thân à? - Anh hỏi<br />- Vâng. Làm mẹ đơn thân - Tôi chần chừ rồi mới trả lời.<br />- Hay nhỉ! Không thay đổi gì cả. Anh cũng muốn thế, nhưng chưa có người mang thai hộ. - Anh cười nhìn tôi không chớp mắt trước khi cúi xuống tệp bệnh án.</p>\r\n<p>Tôi nhìn từng đường nét trên khuôn mặt anh mãi không thôi. Không ngờ tôi lại được gặp anh lần nữa. Anh vô tình ngẩng lên bắt gặp ánh mắt tôi, tôi vẫn cứ nhìn anh như thế, không hề trốn tránh.</p>\r\n<p ><br />MsQuan</p>         ', 'images/stories/2020/08/original/ngoai-le-duy-nhat.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'ngoai-le-duy-nhat', NULL, NULL, NULL, '2020-08-20 00:39:59', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/210-ngoai-le-duy-nhat.html'),
(22, 'Lời Hứa', '\"My dear do not be sad, we have to see what the future has in mind for us\" - Đừng buồn em ạ, hãy chờ xem tương lai... ...', '\r\n        	<p><strong>\"My dear do not be sad, we have to see what the future has in mind for us\" - Đừng buồn em ạ, hãy chờ xem tương lai... ...</strong></p>\r\n<p >***</p>\r\n<p>Dù đã thấy nhau trên webcam nhiều lần, song Miên không thể không lúng túng khi lần đầu gặp Bent. Trong webcam anh trông trẻ hơn bên ngoài. Khi đối diện, nhìn những nếp nhăn nhỏ trên trán, Miên đoán chừng anh cũng phải lớn hơn mình đến chục tuổi.</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/tumblr-lzvemuwwkk1qlo9hgo1-500.jpg\" /></p>\r\n<p >&nbsp;</p>\r\n<p>\"Sao anh đến mà không báo, làm em không kịp mua hoa?\", \"Anh muốn dành cho em một ngạc nhiên bất ngờ. Vậy mà em vẫn biết\". Bent cười, ôm choàng lấy Miên... Miên lúng túng bởi thấy mọi người đang quay lại nhìn mình. Đây là sân bay một thành phố nhỏ, rất nhiều người quen... Mà mình có giữ ý thái quá chăng, đây đâu phải một người lạ. Con người này và mình đã hiểu nhau từng li từng tí hơn một năm nay rồi.</p>\r\n<p>Tự nhủ mình thế nên khi taxi đi được ba phần tư con đường từ sân bay vào thành phố thì Miên đã xua được gần hết cảm giác ngại ngùng. Miên nhớ lại lời cô bạn tham mưu: \"Tất cả những ai quen nhau trên mạng khi lần đầu gặp gỡ đều cảm thấy một chút thất vọng. Ai vượt qua được cảm giác ban đầu đó thì còn, mà không được, thì coi như tiêu luôn\". Liếc nhìn Bent, Miên thấy sau phút nồng hậu ban đầu, giờ anh cũng đang ngồi im, đôi mắt xanh lơ bối rối. Biết đâu chừng anh ấy cũng đang thất vọng... Bỗng cảm giác thân quen từ hơn ba trăm bức email chợt tràn ngập trong Miên, cô rụt rè đưa tay cầm lấy tay Bent... Anh quay lại, mỉm cười thật hiền, thế là phút lóng ngóng ban đầu đã qua đi.</p>\r\n<p>Xe dừng trước khách sạn, Bent nhìn Miên, ngạc nhiên. Như đã nói trong email, anh tính sẽ ở lại nhà Miên. Trong không gian mạng anh đã đánh thức Miên dậy mỗi buổi sáng, uống cà phê với cô, đưa cô đến sở làm. Buổi tối Miên nấu cơm đợi anh về, anh vừa ăn vừa luôn miệng khen ngon... Ăn xong anh còn làm việc thêm ba tiếng đồng hồ trên máy tính, đêm nào Miên cũng phải nhắc anh đi ngủ sớm.</p>\r\n<p>Vậy mà bây giờ Miên đưa anh đến một khách sạn! Miên lúng túng giải thích: Ở đây không giống trên mạng. Muốn được ở chung một nhà thì còn phải qua nhiều công đoạn lắm.</p>\r\n<p>***</p>\r\n<p>Khách sạn Hoa Tím nằm bên sông, nhỏ xinh và sạch sẽ, xây dựng đơn giản nhưng đẹp nhờ cảnh thiên nhiên bao quanh. Chọn khách sạn này, Miên đã hỏi thăm thông tin từ nhiều bạn bè trong ngành du lịch. Theo lời các bạn Miên, khách sạn này trông có vẻ giống một nơi ở ẩn, không có tiếng gõ cửa lúc đêm khuya. Trong lúc chờ Bent lên phòng cất hành lý và tắm, Miên đọc lại thực đơn để đặt bữa tối. \"Theo em thì chị đừng gọi món vả chua. Sợ người nước ngoài chưa quen bụng với đồ ăn lên men của xứ mình\". Cô gái ở khách sạn e dè đề nghị. Miên nghĩ cô ta có lý, nhưng món ăn này cô đã nhiều lần tả với Bent trong những bữa ăn chung trên mạng. Anh vẫn thường hỏi mỗi khi ngồi vào bàn ăn tưởng tượng giữa hai người. Vậy hôm nay cũng nên để anh nếm thử một chút, Miên tự nhủ, mình sẽ cẩn thận bảo anh ăn ít thôi.</p>\r\n\r\n\r\n\r\n\r\n\r\n			<p>Bữa ăn tối tuyệt vời. Một dĩa nhạc Schubert nhẹ nhàng tha thiết. Bàn ăn đặt bên cửa sổ. Xa xa là nhịp cầu lấp lánh đèn soi bóng trên sông. Bent ăn ngon miệng, anh đánh sạch cả dĩa vả chua. Đúng là bên ngoài trông anh hơi thô, bụng đã hơi mập, không lung linh như trong trí tưởng tượng của Miên. Nhưng cái quan trọng là mình phải biết mình muốn gì!</p>\r\n<p>Ba mươi sáu tuổi, Miên không còn trẻ. Cuộc hôn nhân đầu đời đổ vỡ làm cô trở thành lầm lì khép kín hơn mười năm. Hơn mười năm sau khi chia tay Tuấn, Miên không quen thân được với một người đàn ông nào, chỉ vì luôn bị ám ảnh: họ lại sắp nói dối, sắp nói dối...</p>\r\n<p>Sau này, khi công tác ở bộ phận đối ngoại có lần Miên nghe một khách nước ngoài than vãn: \"Ở đây thật lạ, đôi khi chỉ một chuyện đơn giản, lý do đi trễ chẳng hạn người ta cũng không chịu nói thật\". Ấn tượng về Tuấn bỗng quay lại, Miên bất giác lạnh người. Mười năm trước, điện thoại di động chưa phổ biến như bây giờ. Lần nào cô đi công tác, Tuấn cũng gọi điện cho cô mỗi đêm. \"Anh đang ở đâu?\". \"Ở nhà, xem tivi, nhớ em lắm!\". Miên xuýt xoa khuyên chồng đi ngủ sớm... Một hôm tình cờ nghe lọt vào trong điện thoại một âm thanh lạ, cô tò mò kiểm tra tổng đài, phát hiện ra số điện từ đó Tuấn gọi là số điện của một hộp đêm... Lúc đó, cô lạnh da gà, mỗi chân lông đều sởn ốc.</p>\r\n<p>Từ đó Miên thận trọng, thận trọng thái quá đến nỗi chẳng tìm được cho mình một người đàn ông nào khác. \"Muốn có tình yêu thì phải mở lòng ra chứ\" - Bạn gái khuyên. Họ giới thiệu Bent. \"Anh ấy là người tốt. Những người Việt qua bên đó công tác đều được Bent giúp đỡ. Thật thà như đếm và dễ tính vô cùng\". Mấy dòng lý lịch trích ngang đó làm Miên tạm yên tâm. Khoảng cách xa làm Miên không bị ám ảnh bởi nỗi sợ đàn ông, rồi sự cô đơn làm cho trò chơi lứa đôi trên mạng dần dần trở nên một nửa cuộc sống.</p>\r\n<p>Bây giờ Bent ngồi đây. Miên bắt đầu thôi không nhìn thấy cái bụng đã hơi mập, mái tóc bắt đầu thưa và những nếp nhăn nhỏ trên trán. Bây giờ cô thấy ánh mắt anh cởi mở, miệng cười thân thiện, những câu nói đùa hóm hỉnh thật dễ thương, đúng là hình ảnh đã thấy qua những bức thư. Những bức thư luôn kết thúc bằng dòng chữ ấm áp: \"Lots of love from Bent\" rồi \"Lots of kisses from Bent \"- rất nhiều tình yêu và cái hôn từ Bent.</p>\r\n<p>\"Anh muốn đến thăm nhà em, nơi anh đã đến nhiều lần lắm rồi\". Bent bảo. Miên do dự. Bây giờ trời đã tối. Hàng xóm sẽ nghĩ sao khi thấy cô đột ngột xuất hiện với một ông Tây cao lêu đêu.</p>\r\n<p>\"Để mai đi anh\", Miên hẹn. Miên đưa Bent đến một quán cà phê nhạc để anh có thể nghe Beethoven và uống một ly Brandy như anh vẫn thường miêu tả về những buổi tối một mình. Một nghệ sĩ vĩ cầm đang chơi nhạc cạnh cái lò sưởi cũ hắt lên một thứ ánh sáng ấm áp. Khi nghe hết bài Sonate moonlight, Bent đặt tay lên vai Miên, rồi cánh tay anh quàng quanh vai cô.</p>\r\n<p>Họ chưa dám nói gì về tương lai, bởi cả hai đều cảm thấy trước hết phải làm sao cho những gì trong không gian mạng bước ra ngoài cuộc đời. Họ tiếp tục câu chuyện thường nói: những món ăn, thời tiết, những bộ phim rồi những dự tính cho tương lai, những kỷ niệm trong quãng đời quá khứ...</p>\r\n<p>Miên bất giác bật ra một câu từ đâu đó sâu trong tâm tưởng: \"Em chỉ mong lúc nào anh cũng nói thật với em về mọi chuyện\". Bent mỉm cười: \"Tất nhiên. Nói dối là một tội trọng, anh sẽ không bao giờ hạ mình làm chuyện đó\".</p>\r\n<p>***</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/tumblr-m4c4tg5kef1qlbhoeo1-500.jpg\"  /></p>\r\n<p>Một tuần sau Bent đi. Miên hỏi cảm tưởng, Bent cười: \"More than I can dream\" - Còn hơn những gì anh có thể mơ. Anh ôm Miên thật chặt khi chia tay, lần này Miên không còn thấy ngượng ngùng nữa. \"Anh sẽ quay lại chứ?\". \"Tất nhiên\" Anh cúi xuống hôn từ biệt. Miên vòng hai tay quanh người anh siết chặt, cái bụng hơi cồm cộm của anh chạm vào dưới ngực, một cảm giác ngộ nghĩnh và thân thương. Bent chỉ vắng có hai hôm đi đường, sau đó lại trở về ngay với Miên... trên mạng. Những bức thư lại tiếp tục. Bây giờ hơi khác đi, những bức thư kết thúc bằng \"Warmest hugs from Bent\" - Bent ôm hôn thắm thiết. Sao thế, Miên cười thầm, bây giờ anh đã nhiễm ngôn ngữ chính trị rồi chắc?</p>\r\n<p>Bốn tháng sau, đột nhiên Bent gửi mail hỏi Miên về giá đất, giá nhà. \"Anh định sống ở đây sao?\", \"Tại sao không? Đi đi về về giữa hai châu lục, đó là cuộc sống mà ở đây nhiều người mơ ước\". Một tháng trời, Miên đi hỏi rồi mail cho Bent cả một danh sách giá cả đủ loại đất từ mặt tiền đường phố đến đất rẻo ở ven sông.</p>\r\n<p>Bent thì miệt mài làm việc. Bây giờ anh làm việc đến mười ba giờ một ngày, nhiều đêm ngủ gật bên máy tính. Kể với Miên, Miên xót cả ruột. Miên chẳng biết làm gì để giúp anh ngoài những lời chăm sóc. Nhớ ăn nhiều trái cây, ăn nhiều cá, nhớ cẩn thận khi lái xe trên đường. Thư của anh thưa hơn trước. Hai hôm một bức, rồi ba bốn hôm. Chỉ vì muốn có một chỗ ở đẹp mà anh phải hy sinh nhiều thế... Mỗi lần mở hộp thư không thấy Bent, Miên buồn hẫng cả người. \"Bent, không cần phải vất vả thế, mình có thể ở trong căn nhà nhỏ của em mà!\". Nhưng Bent bảo: \"My dear do not be sad, we have to see what the future has in mind for us\" - Đừng buồn em ạ, hãy chờ xem tương lai... Vậy là Miên lại thấy tin tưởng, lại vui...</p>\r\n<p>***</p>\r\n<p>Rồi tháng chín đến, mùa du lịch bắt đầu và bỗng nhiên đèn nickname của Bent tắt hẳn trên mạng. Trước đó Bent đã nói với Miên dự định tháng chín này về Huế. Hay là anh đã lên đường? Nhưng sao anh không nói gì với Miên? Anh muốn dành một ngạc nhiên bất ngờ?</p>\r\n<p>Lòng Miên tưng bừng vui, cô lau dọn căn nhà nhỏ, mua thức ăn chất đầy tủ lạnh rồi dạo phố sắm cho mình vài bộ cánh mới. Lần này không phải quá e dè nữa, có thể để Bent về đây ăn cơm với mình, anh có vẻ thích hợp với cơm Á Đông, món vả chua anh còn xơi được cả dĩa nữa là.</p>\r\n<p>Chuông điện thoại reo. Miên cầm máy, chắc chắn là Bent, ai có thể gọi vào giờ khuya khoắt như thế này.</p>\r\n<p>\"Cám ơn chị...\", đó là tiếng bà chủ miếng đất - một trong những miếng đất mà Miên đã đi hỏi cách đây mấy tháng. \"Tôi đã bán được miếng đất nặng vía cho ông Tây đó rồi, muốn gặp chị để gửi chút hoa hồng...\".</p>\r\n<p>Sao có thể như vậy được? Vậy là Bent đã về, nhưng đang ở đâu?</p>\r\n<p>Miên gọi điện đến khách sạn Hoa Tím. Liên tục nghe trả lời: \"Ông Bent Johnson có ở đây, nhưng ông ấy đi chưa về\". Một cuốc taxi đến khách sạn, Miên được cô gái ở quầy tiếp tân mời ngồi chờ. Một tiếng, hai tiếng. Đây là lần đầu Miên ngồi đây vào buổi tối. Trông vẻ căng thẳng của Miên, cô gái làm ở khách sạn đến ngồi cạnh cô, bắt chuyện.</p>\r\n\r\n\r\n\r\n					\r\n\r\n		<p>Miên nhìn kỹ cô gái: Đây chính là cô gái lần trước đã góp ý về món vả chua... Hôm ấy thu mình trong chiếc áo dày cộp trông cô có vẻ chất phác, nhưng giờ này với chiếc áo hai dây mềm mại trông cô thật sexy với khuôn mặt tuổi hai mươi và khóe môi đầy nhục cảm. Nghe Miên bảo là cùng làm việc với Bent, cô tâm sự:</p>\r\n<p>\"Chị làm việc được với Bent thật giỏi... Chưa thấy ai kỹ tính như anh ấy. Khiếp, mua có miếng đất nhỏ tẹo mà cũng hỏi lui hỏi tới giá cả, thuê phiên dịch đọc giấy tờ, lại còn bảo đã tham khảo nhiều nguồn tin... Em bực mình, dọa bỏ luôn, ảnh mới chịu dứt khoát ký giấy\".</p>\r\n<p>Mười ngày sau Bent làm đám cưới với cô dâu nhỏ hơn chú rể hơn ba mươi tuổi. Miên cũng nhận được thiếp mời. Dù vẫn còn khản giọng, sưng mắt, trán còn chưa hết mùi dầu gió, Miên cũng mặc chiếc áo đầm mới mua đi dự tiệc. Dù sao đi nữa, cũng đến để chúc mừng Bent quả thực đã được \"nhiều hơn mơ ước\", bởi dù sao, anh đã giữ lời, anh không hề nói dối khi bảo Miên: \"Hãy chờ xem tương lai...\".</p>         ', 'images/stories/2020/08/original/loi-hua.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'loi-hua', NULL, NULL, NULL, '2020-08-20 00:40:01', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/205-loi-hua.html');
INSERT INTO `fs_stories` (`id`, `title`, `summary`, `content`, `image`, `tags`, `category_id`, `category_alias`, `category_name`, `category_id_wrapper`, `category_alias_wrapper`, `category_icon`, `alias`, `creator`, `source_website`, `new_date`, `created_time`, `updated_time`, `editor`, `show_in_homepage`, `hits`, `published`, `ordering`, `title_display`, `display_title`, `display_column`, `tags_group`, `rating_count`, `rating_sum`, `keywords`, `hot`, `seo_title`, `seo_keyword`, `seo_description`, `lang`, `source`) VALUES
(23, 'Mặc áo dài giữa mùa đông', '\'Anh vẫn không hiểu ư, sẽ chẳng bao giờ có ai tốt với anh hơn em đâu. Bởi vì em đã lớn rồi. Và... hình như em yêu anh ! \'', '\r\n        	<p><strong>\'\'Anh vẫn không hiểu ư, sẽ chẳng bao giờ có ai tốt với anh hơn em đâu. Bởi vì em đã lớn rồi. Và... hình như em yêu anh ! \'\'</strong></p>\r\n<p ><strong>***</strong></p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/1aodai.jpg\" /></p>\r\n<p>Tôi quen anh từ khi tôi còn là một cô bé lớp 10 mơ mộng, khi anh vẫn hay cốc đầu tôi như trẻ con. Anh đi du học, tôi lao vào \'\'cày\'\' sách vở như điên với mong muốn tốt nghiệp phổ thông sẽ thi để sang úc với anh. Không may, tôi thi TOEFL thiếu gần 50 điểm. Tôi vào học ở một trường Đại học trong nước, mắt không hề nhìn thấy một người con trai nào khác.</p>\r\n\r\n\r\n\r\n\r\n\r\n			<p>Anh về nước ăn tết. Trong hơn một tháng trời, ngày nào chúng tôi cũng cùng nhau đi chơi, đi tìm sách vở, thăm bạn bè. Chúng tôi luôn vui vẻ và rất hiểu nhau. Đó là những ngày xuân tươi thắm nhất và cũng tuyệt vọng nhất đối với tôi.</p>\r\n<p>Càng ngày, tôi càng nhận ra mình đã không yêu lầm người và suốt đời, tôi sẽ không thể nào tìm thấy một người nào khác giống như anh. Nhưng tôi cũng lại mơ hồ lo sợ anh chỉ coi tôi như một cô bé, như một đứa em gái, mà do hai gia đình thân quen, tôi và anh từ nhỏ đã cùng nhau lớn lên. Tuyệt vọng nhưng hạnh phúc, nỗi buồn ấy với tôi có màu rực rỡ.</p>\r\n<p>Chỉ còn một ngày nữa thôi anh sẽ phải quay lại úc. Tối hôm trước, anh vô tình nói: \'\'Anh muốn chụp mấy bức ảnh chùa chiền cho bọn Tây xem. Nhưng chán thật, đang giữa mùa lạnh, không bói đâu ra một bóng áo dài...\'\'.</p>\r\n<p>Sáng hôm sau, trong cái rét 14 độ của buổi sáng tháng Hai, tôi mặc một chiếc áo dài lụa trắng cùng anh đi chụp ảnh, không kèm theo bất kỳ một chiếc áo len hay áo khoác nào. Suốt một ngày, từ 6 giờ sáng đến 6 giờ tối, tôi đứng làm mẫu cho anh chụp, từ Cổ Loa về tới Phủ Tây Hồ, chùa Trấn Quốc... Đến bây giờ, tôi vẫn không hiểu tại sao chỉ một trái tim bé nhỏ lại có thể cung cấp một nguồn nhiệt lượng lớn lao nhường ấy cho con người.</p>\r\n<p>Hôm sau, anh bay. Tôi không ra tiễn, nằm nhà sốt li bì. Tôi ngủ suốt hai ngày, giấc ngủ nặng nề mê man, không biết vì ốm hay vì trong lòng luôn văng vẳng tiếng ầm è của chiếc máy bay đã mang anh đi xa...</p>\r\n<p>Tỉnh dậy, mẹ đưa tôi mảnh giấy anh gửi lại: \'\'Anh chưa gặp một người con gái nào như em. Người con gái trong suốt thời gian vừa qua luôn tận tình giúp anh tìm tài liệu trong một lĩnh vực mà anh biết cô ấy không hề hứng thú. Người con gái nghe anh huýt sáo vu vơ mà biết được anh nghĩ gì. Người con gái ấy, cả ngày hôm qua mặc mỗi tấm áo mỏng manh đi cùng anh, mà lúc nào cũng vui vẻ tươi cười, nghĩ ra đủ thứ chuyện để anh an tâm chụp hình mà không áy náy, luôn luôn hồng hào và xinh đẹp... Cám ơn em nhé, sao em lại tốt với anh đến thế!\'\'.</p>\r\n<p>Cơn sốt đã qua mà trong tôi bừng bừng như có muôn ngọn lửa thiêu đốt. Tôi biết, dù sau này có phải hứng chịu điều gì đi nữa, tôi nhất thiết phải bộc bạch lòng mình, và cũng chỉ có lúc này thôi. Vớ lấy giấy, bút, tôi viết một hơi: \'\'Anh vẫn không hiểu ư, sẽ chẳng bao giờ có ai tốt với anh hơn em đâu. Bởi vì em đã lớn rồi. Và... hình như em yêu anh ! \'\'.</p>\r\n<p>Chục ngày sau, vào lúc 12 giờ đêm, tôi nhận được điện thoại của anh. Ngay sau khi nhận được mấy dòng tôi gửi, anh đã chạy đi tìm điện thoại để gọi cho tôi. Trong máy, giọng anh rất dịu dàng: \'\'Thảo à, bỏ hai từ \'\'hình như\'\' đi, được không em...\'\'</p>\r\n\r\n\r\n\r\n					\r\n\r\n		<p>&nbsp;</p>         ', 'images/stories/2020/08/original/mac-ao-dai-giua-mua-dong.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'mac-ao-dai-giua-mua-dong', NULL, NULL, NULL, '2020-08-20 00:40:03', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/202-mac-ao-dai-giua-mua-dong.html'),
(24, 'Vợ Hờ', 'Anh lấy của cô chữ \"trinh\" và trả về cho cô chữ \"khinh\"<br /> <br /> Cô là Cỏ. Cô xấu xí, không có duyên, mỏng manh hoang dại, và tròn vo.<br /> <br /> Anh là Gió. Anh lãng tử, galăng, đào hoa, mạnh mẽ và đa tình.', '\r\n        	\r\n\r\n\r\n\r\n\r\n			<p>&nbsp;</p>\r\n<p><strong>Anh lấy của cô chữ \"trinh\" và trả về cho cô chữ \"khinh\"<br /> <br /> Cô là Cỏ. Cô xấu xí, không có duyên, mỏng manh hoang dại, và tròn vo.<br /> <br /> Anh là Gió. Anh lãng tử, galăng, đào hoa, mạnh mẽ và đa tình.</strong></p>\r\n\r\n\r\n\r\n\r\n\r\n			<p>&nbsp;</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/not-always-the-fairy-tale-b.jpg\"  /></p>\r\n<p><br /> Năm cô 16 – là lúc anh 17. Hai con người thuộc về hai thế giới gặp nhau.</p>\r\n<p>Cô yêu anh từ cái nhìn đầu tiên. Anh chê cô xấu và chán nản khi nhìn cô…<br /> <br /> Tuổi trẻ của họ, là những năm tháng anh hờn hợt – còn cô thì nồng nàn.<br /> <br /> Với anh, cô là người tình hờ. Với cô, anh là tất cả.<br /> <br /> Anh đa tình, cô giỏi chịu đựng. Anh sành đời, cô gà mờ.<br /> <br /> Tình yêu của cô – không ích kỉ, không thèm khát, không ham muốn. Là tình yêu nhẹ nhàng, nhưng rất sâu và rất thật.<br /> <br /> Tình yêu của anh – không thuộc về nơi cô…<br /> <br /> Năm cô 19 – là lúc anh 20.<br /> <br /> Cô trao tấm thân cho anh.<br /> <br /> Anh dạy cô hút thuốc, cô có hút – nhưng không ghiền.<br /> <br /> Anh dạy cô uống bia, cô có uống – nhưng lại ói ra hết.<br /> <br /> Anh dạy cô làm tình, cô làm anh lên đỉnh – nhưng không bằng những người phụ nữ ngoài kia.<br /> <br /> Anh lấy của cô chữ \"trinh\", và trả về chữ \"khinh\".<br /> <br /> Cô vẫn chấp nhận.<br /> <br /> Cô chung thuỷ đến đáng thương. Anh nhận ra nhiều điều. Và xem cô như một chỗ dựa tinh thần vững chắc nhất.<br /> <br /> Khi tâm trạng đâm vào ngõ cụt, anh tìm cô.<br /> <br /> Khi anh buồn, cô cứ ở mãi một chỗ nghe anh nói và dỗ dành anh.<br /> <br /> Thấy anh đau vì một người con gái khác, cô không ghen – chỉ buồn theo anh.<br /> <br /> Cô cứ ở mãi một chỗ, đợi chờ anh.<br /> <br /> Anh cứ rong chơi mãi, vì biết cô sẽ đợi…<br /> <br /> Sinh nhật lần thứ 25 của anh, anh ngỏ lời cầu hôn cô.<br /> <br /> Anh cho cô bốn tháng để suy nghĩ – nhưng biết chắc câu trả lời, anh âm thầm chuẩn bị hôn lễ.<br /> <br /> Sinh nhật lần thứ 24 của cô, cô đồng ý làm vợ anh.<br /> <br /> Không có gì là bất ngờ, vì cô yêu anh.<br /> <br /> Không có gì là bất ngờ, vì từ lâu – anh xem cô là tri kỉ…<br /> <br /> Lấy nhau về, anh vẫn không bỏ được thói trăng hoa – còn cô, vẫn là người phụ nữ đứng sau và chờ đợi anh.<br /> <br /> Lấy nhau về, nhiều lúc anh bỏ mặc cô ở nhà một mình tận ba bốn ngày, có khi là một tuần – thế mà cô chẳng trách móc anh một câu nào cả.<br /> <br /> Lấy nhau về, anh hỏi cô:\" Sao em không cấm cửa anh?!\" – cô trả lời:\" Vì em biết mình không thể ràng buộc anh\".<br /> <br /> Lấy nhau về, anh càng đa tình hơn – cô càng chung thuỷ hơn…<br /> <br /> Năm cô 30 – là lúc anh 31.Biến cố xảy ra.Anh chạy theo một người đàn bà khác.<br /> <br /> Ôm ấp con ả ấy về nhà.<br /> <br /> Cô đi chợ về, thấy đôi giày đỏ – tự động đóng cửa ra cafe ngồi.<br /> <br /> Trưa – cô gặp con ả ấy trước cửa.<br /> <br /> Chiều – cô để lại cho anh một tờ giấy:<br /> <br /> \" Người ta có thể làm người tình hờ của nhau cả đời, nhưng để làm vợ hờ – là rất khó. Cái giá của một người vợ rất lớn, không phải con đĩ nào cũng có quyền chỉ thẳng vào mặt em mà nói:&nbsp;<br /> <br /> – \"Giữ được chồng còn không thể thì mày làm được gì?!\".<br /> <br /> Anh không sợ mất em, cho nên anh mất em rồi đấy.\"<br /> <br /> Tối – anh đọc tờ giấy, vò nát, nước mắt rưng rưng…<br /> <br /> Anh yêu cô từ lúc nào không hay…</p>         ', 'images/stories/2020/08/original/vo-ho.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'vo-ho', NULL, NULL, NULL, '2020-08-20 00:40:05', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/188-vo-ho.html'),
(25, 'Người đàn ông yêu em....', 'Người đàn ông thật sự yêu em, là người&nbsp;có lòng dũng cảm, dám giành giật cái điều khiển ti vi với em, song sau cùng dù thắng cũng chỉ dám ngoan ngoãn ngồi dựa cằm vào vai em xem MTV.&nbsp;', '\r\n        	<p><em><strong>Người đàn ông thật sự yêu em, là người&nbsp;có lòng dũng cảm, dám giành giật cái điều khiển ti vi với em, song sau cùng dù thắng cũng chỉ dám ngoan ngoãn ngồi dựa cằm vào vai em xem MTV.&nbsp;</strong></em></p>\r\n\r\n\r\n\r\n\r\n\r\n			<p>&nbsp;</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/wallpaper-holiday-8-giaoduc-net-vn.jpg\"  /></p>\r\n\r\n\r\n\r\n\r\n\r\n			<p>&nbsp;</p>\r\n<p><em>Người đàn ông thật sự yêu em, là người....</em></p>\r\n<p>Ôm sẽ thật ấm áp, càu nhàu sẽ rất bực mình, ở gần thì ghét, ở xa em lại rất nhớ.&nbsp;</p>\r\n<p>Bát mì ăn dở không được để lãng phí, họ sẽ ăn nốt giùm em.&nbsp;<br /> <br /> Đôi bàn chân giá rét của em áp vào đùi, họ rét nhưng họ sẽ không bao giờ đẩy bàn chân em ra.&nbsp;<br /> <br /> Đi siêu thị mua đồ, họ sẽ xách nhiều hơn em một hai cái túi lớn, nhưng vẫn còn thừa ra một bàn tay để dắt em đi.&nbsp;<br /> <br /> Đi dạo phố em sẽ thêm một người cằn nhằn, nhắc em đừng mua linh tinh.&nbsp;<br /> <br /> Kỳ kinh nguyệt, nếu tóm được em ăn vụng kem, họ sẽ là cái người giận dữ.&nbsp;<br /> <br /> Em ốm, họ có thể còn đau hơn em.&nbsp;<br /> <br /> Trước khi ra khỏi nhà, mắt họ ngắm em kỹ hơn một cái gương soi.&nbsp;<br /> <br /> Là người con trai hàng tháng nhớ mua băng vệ sinh theo lịch, là người dù cãi cọ với em dù có lỗi với em nhưng vẫn trơ trơ mặt dầy tới cầm tay em.&nbsp;<br /> <br /> Rồi sau nhiều năm, qua nhiều kỷ niệm ngày yêu nhau đầu tiên, họ đã quên đi tất cả, quên ngày Valentine, họ cũng quên trên đời còn có Lễ giáng sinh.&nbsp;<br /> <br /> Chỉ vì muốn xem trận bóng trực tiếp, họ sẽ vứt em sang một bên lạnh lẽo.&nbsp;<br /> <br /> Họ sẽ không còn mua tặng em hoa...<br /> <br /> Nhưng sẽ là người thường mua tặng em túi ni lông đựng rác, băng vệ sinh, trái cây...&nbsp;<br /> <br /> Rỗi rãi chả có việc gì làm họ sẽ quẩn quanh ở nhà em, nhưng có việc họ cũng vẫn cứ quẩn quanh ở nhà em.<br /> <br /> Làm em nghĩ, chả lẽ họ không có bạn bè nào khác sao?&nbsp;<br /> <br /> Là người vô cùng thích nhìn lúc em cười to thoải mái, rồi họ cười lại với vẻ đầy ngốc nghếch.&nbsp;<br /> <br /> Người hay bỏ sót các cuộc em gọi, nhưng lại gọi tới nóng rực máy em.&nbsp;<br /> <br /> Chăm em ăn cơm, chăm em xem phim, chăm em đi mua đồ, rồi lại nghĩ sau này sẽ chăm em những gì.&nbsp;<br /> <br /> Ghét nhất sợ nhất là khi em khóc, nên chỉ nghe tiếng nức nở, sẽ bay từ hàng nghìn km về bên cạnh em.&nbsp;<br /> <br /> Họ sẽ lặng lẽ làm cho em rất nhiều điều, nhưng sẽ không kể công.&nbsp;<br /> <br /> Họ là một người tự thấy cánh tay là chiếc gối cho em.&nbsp;<br /> <br /> Họ là một người có lòng dũng cảm, dám giành giật cái điều khiển ti vi với em, song sau cùng dù thắng cũng chỉ dám ngoan ngoãn ngồi dựa cằm vào vai em xem MTV.&nbsp;<br /> <br /> Lúc xa, họ vẫn bên em vô hình.<br /> <br /> Em một mình dựa vai khi nhớ.&nbsp;<br /> <br /> <br /> <em><strong>Nếu bạn thấy ở bên cạnh bạn có một người như thế này, thì... đừng để họ chạy thoát!</strong></em></p>         ', 'images/stories/2020/08/original/nguoi-dan-ong-yeu-em.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'nguoi-dan-ong-yeu-em', NULL, NULL, NULL, '2020-08-20 00:40:08', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/184-nguoi-dan-ong-yeu-em.html'),
(26, 'Đột Quỵ', 'Nhưng chàng không lấy người bạn thân nhất của vợ, người làm chàng mê muội, người đến thăm vợ chàng thường xuyên khi vợ chàng nằm ổ, người bị mê hoặc bởi vẻ ga-lăng của chàng và đồng ý quấn lấy chàng trên chiếc sa-lông ở phòng khách...', '\r\n        	<p><strong>Nhưng chàng không lấy người bạn thân nhất của vợ, người làm chàng mê muội, người đến thăm vợ chàng thường xuyên khi vợ chàng nằm ổ, người bị mê hoặc bởi vẻ ga-lăng của chàng và đồng ý quấn lấy chàng trên chiếc sa-lông ở phòng khách...</strong></p>\r\n<p>------------------------</p>\r\n<p ><img alt=\"\" src=\"/uploaded/images/stories/2020/08/wallpaper-holiday-16-giaodu-1.jpg\"  /></p>\r\n\r\n\r\n\r\n\r\n\r\n			<p>Người chồng trẻ của kẻ quá cố đang rũ người ra vì khóc. Nhìn chàng rất bơ phờ - dẫu là cái bơ phờ của người đẹp trai - và chàng cứ bám lấy quan tài mà lảm nhảm: \"Anh đã giết em rồi... anh đã giết em rồi\".</p>\r\n<p>Người đi viếng tặc lưỡi: \"Khổ thế, vợ mới sinh con so mà chết nên anh chồng mới tiếc hận\".</p>\r\n<p>Qua tang một năm, chàng lấy vợ mới vì con nhỏ cần có người chăm sóc.</p>\r\n<p>Nhưng chàng không lấy người bạn thân nhất của vợ, người làm chàng mê muội, người đến thăm vợ chàng thường xuyên khi vợ chàng nằm ổ, người bị mê hoặc bởi vẻ ga-lăng của chàng và đồng ý quấn lấy chàng trên chiếc sa-lông ở phòng khách bởi cứ tưởng vợ chàng nằm ổ không thể ra ngoài. Người mà vợ chàng nhìn thấy đang ở tư thế nóng bỏng nhất lúc mây mưa và khiến vợ chàng ngã vật ra, ra đi chỉ ngay sau vài phút.</p>\r\n<p>Chàng không cưới nàng. Dại gì, chàng đâu thích đột quỵ. Chàng cưới một cô gái không hẳn là đẹp, không hề lãng mạn nhưng hiền lành và dễ bảo, để nếu chuyện ấy lại xảy ra thì bác sĩ sau một hồi loay hoay cứu chữa sẽ ghi vào hồ sơ bệnh án: \"Đột quỵ\". &nbsp;</p>         ', 'images/stories/2020/08/original/dot-quy.jpg', NULL, 1, 'yeu', 'Yêu', '.1.', ',yeu,', NULL, 'dot-quy', NULL, NULL, NULL, '2020-08-20 00:40:09', NULL, NULL, NULL, 0, 1, NULL, NULL, 1, 0, NULL, 0, 0, '', 0, NULL, NULL, NULL, 'vi', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/183-dot-quy.html');

-- --------------------------------------------------------

--
-- Table structure for table `fs_stories_categories`
--

CREATE TABLE `fs_stories_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `alias_wrapper` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `list_parents` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `published` tinyint(4) NOT NULL DEFAULT 1,
  `ordering` int(11) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `show_in_homepage` tinyint(4) NOT NULL DEFAULT 1,
  `estore_id` int(11) DEFAULT NULL,
  `display_title` tinyint(4) NOT NULL DEFAULT 1,
  `display_tags` tinyint(4) NOT NULL DEFAULT 1,
  `display_related` tinyint(4) NOT NULL DEFAULT 1,
  `display_created_time` tinyint(4) NOT NULL DEFAULT 1,
  `display_category` tinyint(4) NOT NULL DEFAULT 1,
  `display_comment` tinyint(4) NOT NULL DEFAULT 1,
  `display_sharing` tinyint(4) NOT NULL DEFAULT 1,
  `name_display` varchar(255) NOT NULL,
  `is_comment` tinyint(4) NOT NULL,
  `notice` tinyint(4) DEFAULT 0 COMMENT 'Danh mục tin thông báo',
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keyword` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `lang` varchar(255) DEFAULT 'en',
  `link` varchar(255) DEFAULT NULL,
  `page` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_stories_categories`
--

INSERT INTO `fs_stories_categories` (`id`, `name`, `alias`, `category_id`, `alias_wrapper`, `parent_id`, `list_parents`, `level`, `published`, `ordering`, `image`, `icon`, `created_time`, `updated_time`, `show_in_homepage`, `estore_id`, `display_title`, `display_tags`, `display_related`, `display_created_time`, `display_category`, `display_comment`, `display_sharing`, `name_display`, `is_comment`, `notice`, `seo_title`, `seo_keyword`, `seo_description`, `lang`, `link`, `page`) VALUES
(1, 'Yêu', 'yeu', NULL, ',yeu,', 0, '.1.', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, NULL, NULL, NULL, 'en', 'https://www.truyenngan.com.vn/truyen-ngan/truyen-ngan-yeu/', 102),
(2, 'Bạn', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, NULL, NULL, NULL, 'en', NULL, 0),
(3, 'Sống', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, NULL, NULL, NULL, 'en', NULL, 0),
(4, 'Gia đình', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, NULL, NULL, NULL, 'en', NULL, 0),
(5, 'Tản mạn', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, NULL, NULL, NULL, 'en', NULL, 0),
(6, 'Kinh dị', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, 1, 1, '', 0, 0, NULL, NULL, NULL, 'en', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fs_tables`
--

CREATE TABLE `fs_tables` (
  `id` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 NOT NULL,
  `field_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `field_alias` varchar(255) CHARACTER SET utf8 NOT NULL,
  `field_name_display` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `field_type` varchar(255) NOT NULL,
  `field_length` int(11) DEFAULT NULL,
  `foreign_id` int(11) DEFAULT NULL,
  `foreign_name` varchar(255) DEFAULT NULL,
  `foreign_tablename` varchar(255) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `is_filter` tinyint(4) NOT NULL DEFAULT 0,
  `is_display_in_admin` tinyint(4) NOT NULL DEFAULT 1,
  `is_default` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `fs_users`
--

CREATE TABLE `fs_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `fname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `avatar` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `published` tinyint(4) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `last_visit_time` datetime DEFAULT NULL,
  `nums_visit` int(11) DEFAULT NULL,
  `status_online` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_users`
--

INSERT INTO `fs_users` (`id`, `username`, `password`, `fullname`, `birthday`, `fname`, `lname`, `avatar`, `email`, `phone`, `address`, `country`, `published`, `ordering`, `created_time`, `updated_time`, `last_visit_time`, `nums_visit`, `status_online`) VALUES
(9, 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'New Moon', NULL, '', '', '', 'admin@newmoon.com', '', 'Ha Noi', 'Việt Nam', 1, 1, '2010-09-18 03:33:51', '2022-05-07 03:41:12', NULL, NULL, NULL),
(31, 'near', '95d47be0d380a7cd3bb5bbe78e8bed49', 'Near', NULL, '', '', '', '', '', '', '', 1, 0, '2022-05-06 08:39:13', '2022-05-06 08:43:27', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fs_users_groups`
--

CREATE TABLE `fs_users_groups` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

--
-- Dumping data for table `fs_users_groups`
--

INSERT INTO `fs_users_groups` (`id`, `userid`, `groupid`) VALUES
(39, 4, 1),
(41, 8, 1),
(129, 9, 1),
(51, 12, 1),
(56, 13, 1),
(60, 16, 1),
(70, 20, 1),
(78, 23, 1),
(81, 24, 1),
(111, 26, 1),
(85, 27, 1),
(125, 29, 1),
(100, 33, 1),
(119, 36, 1),
(107, 38, 1),
(118, 39, 1),
(120, 40, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fs_users_online`
--

CREATE TABLE `fs_users_online` (
  `au_session_id` varchar(40) NOT NULL DEFAULT '',
  `au_last_visit` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fs_users_online`
--

INSERT INTO `fs_users_online` (`au_session_id`, `au_last_visit`) VALUES
('1hfeun4dstb55nogauna4gv2e4', 1387161565),
('ncbejp897f4q0b1tl66b2i2707', 1387160871),
('j8a76n2qj4cabel66vvn7o9110', 1387161107),
('pgd3nb1sqj4amqsodbo5li1556', 1387161509),
('vf8hn7ltfctisi50af72lhodo1', 1387161008),
('p9lo5f72sbv2eduhrfhs72ldv1', 1387161557),
('0tjp5qmnj0lnrhkp3ebmoa7je5', 1387161476),
('igcl759cqrhsknus85chn5m300', 1387161379),
('o0k3p346orvm0jfgrktf5ivtf0', 1387161450),
('p6uko6gte4p9l9ent4v3n3avd0', 1387161537),
('bh4gr6ib23eiod8giru2p8pmu6', 1387161517);

-- --------------------------------------------------------

--
-- Table structure for table `fs_visited`
--

CREATE TABLE `fs_visited` (
  `vis_id` int(11) NOT NULL,
  `vis_count` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Den so lan truy cap' ROW_FORMAT=FIXED;

--
-- Dumping data for table `fs_visited`
--

INSERT INTO `fs_visited` (`vis_id`, `vis_count`) VALUES
(1, 591004);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fs_album`
--
ALTER TABLE `fs_album`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_album_categories`
--
ALTER TABLE `fs_album_categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_album_images`
--
ALTER TABLE `fs_album_images`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_backgrounds`
--
ALTER TABLE `fs_backgrounds`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_banners`
--
ALTER TABLE `fs_banners`
  ADD PRIMARY KEY (`id`) USING BTREE;
ALTER TABLE `fs_banners` ADD FULLTEXT KEY `name` (`name`);

--
-- Indexes for table `fs_banners_categories`
--
ALTER TABLE `fs_banners_categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_blocks`
--
ALTER TABLE `fs_blocks`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_blocks_exist`
--
ALTER TABLE `fs_blocks_exist`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_config`
--
ALTER TABLE `fs_config`
  ADD PRIMARY KEY (`id`,`name`) USING BTREE;

--
-- Indexes for table `fs_config_modules`
--
ALTER TABLE `fs_config_modules`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_contact`
--
ALTER TABLE `fs_contact`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_faqs`
--
ALTER TABLE `fs_faqs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_faqs_categories`
--
ALTER TABLE `fs_faqs_categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_groups`
--
ALTER TABLE `fs_groups`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_groups_permission`
--
ALTER TABLE `fs_groups_permission`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_languages`
--
ALTER TABLE `fs_languages`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_languages_contents`
--
ALTER TABLE `fs_languages_contents`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_languages_tables`
--
ALTER TABLE `fs_languages_tables`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_languages_text`
--
ALTER TABLE `fs_languages_text`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_languages_text_admin`
--
ALTER TABLE `fs_languages_text_admin`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_local_cities`
--
ALTER TABLE `fs_local_cities`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_local_countries`
--
ALTER TABLE `fs_local_countries`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_local_districts`
--
ALTER TABLE `fs_local_districts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_local_streets`
--
ALTER TABLE `fs_local_streets`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_local_ward`
--
ALTER TABLE `fs_local_ward`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_members`
--
ALTER TABLE `fs_members`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_members_level`
--
ALTER TABLE `fs_members_level`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_menus_admin`
--
ALTER TABLE `fs_menus_admin`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_menus_createlink`
--
ALTER TABLE `fs_menus_createlink`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_menus_groups`
--
ALTER TABLE `fs_menus_groups`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_menus_items`
--
ALTER TABLE `fs_menus_items`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_modules_admin`
--
ALTER TABLE `fs_modules_admin`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_news`
--
ALTER TABLE `fs_news`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_newsletter`
--
ALTER TABLE `fs_newsletter`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_news_`
--
ALTER TABLE `fs_news_`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_news_categories`
--
ALTER TABLE `fs_news_categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_news_menus`
--
ALTER TABLE `fs_news_menus`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_products`
--
ALTER TABLE `fs_products`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_products_categories`
--
ALTER TABLE `fs_products_categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_projects`
--
ALTER TABLE `fs_projects`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_projects_categories`
--
ALTER TABLE `fs_projects_categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_shortlink`
--
ALTER TABLE `fs_shortlink`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_sitemap`
--
ALTER TABLE `fs_sitemap`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_statics`
--
ALTER TABLE `fs_statics`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_statics_categories`
--
ALTER TABLE `fs_statics_categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_stories`
--
ALTER TABLE `fs_stories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_stories_categories`
--
ALTER TABLE `fs_stories_categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_tables`
--
ALTER TABLE `fs_tables`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_users`
--
ALTER TABLE `fs_users`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_users_groups`
--
ALTER TABLE `fs_users_groups`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `fs_users_online`
--
ALTER TABLE `fs_users_online`
  ADD PRIMARY KEY (`au_session_id`) USING BTREE;

--
-- Indexes for table `fs_visited`
--
ALTER TABLE `fs_visited`
  ADD PRIMARY KEY (`vis_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fs_album`
--
ALTER TABLE `fs_album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fs_album_categories`
--
ALTER TABLE `fs_album_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fs_album_images`
--
ALTER TABLE `fs_album_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fs_backgrounds`
--
ALTER TABLE `fs_backgrounds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fs_banners`
--
ALTER TABLE `fs_banners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fs_banners_categories`
--
ALTER TABLE `fs_banners_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fs_blocks`
--
ALTER TABLE `fs_blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `fs_blocks_exist`
--
ALTER TABLE `fs_blocks_exist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `fs_config`
--
ALTER TABLE `fs_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `fs_config_modules`
--
ALTER TABLE `fs_config_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `fs_contact`
--
ALTER TABLE `fs_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fs_faqs`
--
ALTER TABLE `fs_faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fs_faqs_categories`
--
ALTER TABLE `fs_faqs_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fs_groups`
--
ALTER TABLE `fs_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `fs_groups_permission`
--
ALTER TABLE `fs_groups_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `fs_languages`
--
ALTER TABLE `fs_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fs_languages_contents`
--
ALTER TABLE `fs_languages_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fs_languages_tables`
--
ALTER TABLE `fs_languages_tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `fs_languages_text`
--
ALTER TABLE `fs_languages_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fs_languages_text_admin`
--
ALTER TABLE `fs_languages_text_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fs_local_cities`
--
ALTER TABLE `fs_local_cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `fs_local_countries`
--
ALTER TABLE `fs_local_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `fs_local_districts`
--
ALTER TABLE `fs_local_districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=696;

--
-- AUTO_INCREMENT for table `fs_local_streets`
--
ALTER TABLE `fs_local_streets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `fs_local_ward`
--
ALTER TABLE `fs_local_ward`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `fs_members`
--
ALTER TABLE `fs_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `fs_members_level`
--
ALTER TABLE `fs_members_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `fs_menus_admin`
--
ALTER TABLE `fs_menus_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `fs_menus_createlink`
--
ALTER TABLE `fs_menus_createlink`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `fs_menus_groups`
--
ALTER TABLE `fs_menus_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fs_menus_items`
--
ALTER TABLE `fs_menus_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `fs_modules_admin`
--
ALTER TABLE `fs_modules_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `fs_news`
--
ALTER TABLE `fs_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fs_newsletter`
--
ALTER TABLE `fs_newsletter`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fs_news_`
--
ALTER TABLE `fs_news_`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fs_news_categories`
--
ALTER TABLE `fs_news_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fs_news_menus`
--
ALTER TABLE `fs_news_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `fs_products`
--
ALTER TABLE `fs_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `fs_products_categories`
--
ALTER TABLE `fs_products_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fs_projects`
--
ALTER TABLE `fs_projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fs_projects_categories`
--
ALTER TABLE `fs_projects_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `fs_shortlink`
--
ALTER TABLE `fs_shortlink`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1494;

--
-- AUTO_INCREMENT for table `fs_sitemap`
--
ALTER TABLE `fs_sitemap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `fs_statics`
--
ALTER TABLE `fs_statics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fs_statics_categories`
--
ALTER TABLE `fs_statics_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fs_stories`
--
ALTER TABLE `fs_stories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `fs_stories_categories`
--
ALTER TABLE `fs_stories_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fs_tables`
--
ALTER TABLE `fs_tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fs_users`
--
ALTER TABLE `fs_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `fs_users_groups`
--
ALTER TABLE `fs_users_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `fs_visited`
--
ALTER TABLE `fs_visited`
  MODIFY `vis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
