-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2020 年 07 月 11 日 08:41
-- 伺服器版本： 10.4.11-MariaDB
-- PHP 版本： 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `Master`
--

-- --------------------------------------------------------

--
-- 資料表結構 `master_admin`
--

CREATE TABLE `master_admin` (
  `admin_id` int(11) NOT NULL,
  `login_name` varchar(32) DEFAULT NULL,
  `admin_group_id` int(11) DEFAULT 0,
  `firstname` varchar(32) DEFAULT '',
  `lastname` varchar(32) DEFAULT '',
  `email` varchar(96) DEFAULT '',
  `password` varchar(40) DEFAULT '',
  `salt` varchar(12) DEFAULT NULL,
  `ip` varchar(40) DEFAULT '',
  `status` tinyint(1) DEFAULT 0,
  `token` varchar(255) DEFAULT '',
  `date_added` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `lastlogintime` datetime DEFAULT '0000-00-00 00:00:00',
  `login_session` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `master_admin`
--

INSERT INTO `master_admin` (`admin_id`, `login_name`, `admin_group_id`, `firstname`, `lastname`, `email`, `password`, `salt`, `ip`, `status`, `token`, `date_added`, `date_modified`, `lastlogintime`, `login_session`) VALUES
(1, 'root', 6, 'admin', '', 'jeff@ryl.hk', 'bf55710ed8061ec59b9858ee45a88424', '0', '::1', 1, '', '2015-09-17 09:00:32', '0000-00-00 00:00:00', '2020-07-11 14:05:41', 'e5f347c3285ae395914a92f5d1aeb9da'),
(12, 'admin', 6, '', '', 'jeff@ryl.hk', '8cd90caa0ec3085794bbe73a192456f5', '0', '203.198.251.57', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-12-27 10:04:16', '9426e616f2eeafe27e3a4c6287fae694');

-- --------------------------------------------------------

--
-- 資料表結構 `master_admin_activity`
--

CREATE TABLE `master_admin_activity` (
  `admin_activity_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT 0,
  `activity_type` varchar(32) DEFAULT '',
  `section` varchar(250) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `master_admin_activity`
--

INSERT INTO `master_admin_activity` (`admin_activity_id`, `admin_id`, `activity_type`, `section`, `details`, `date_added`) VALUES
(1, 1, 'login', '', '', '2020-01-25 14:20:19'),
(2, 1, 'duplicate', 'CFG(170)', '', '2020-01-25 14:20:57'),
(3, 1, 'update', 'CFG Fields(2894, field_index => db_name)', '', '2020-01-25 14:21:43'),
(4, 1, 'update', 'CFG Fields(2894, field_name => Database)', '', '2020-01-25 14:21:43'),
(5, 1, 'update', 'CFG Fields(2894, list_width => )', '', '2020-01-25 14:21:43'),
(6, 1, 'update', 'CFG Fields(2894, field_options => )', '', '2020-01-25 14:21:43'),
(7, 1, 'update', 'CFG Fields(2894, field_type => text)', '', '2020-01-25 14:21:43'),
(8, 1, 'update', 'CFG Fields(3668, field_index => related_id)', '', '2020-01-25 14:21:43'),
(9, 1, 'update', 'CFG Fields(3668, field_name => related from CFG Table)', '', '2020-01-25 14:21:43'),
(10, 1, 'update', 'CFG Fields(3668, list_width => )', '', '2020-01-25 14:21:43'),
(11, 1, 'update', 'CFG Fields(3668, field_options => )', '', '2020-01-25 14:21:43'),
(12, 1, 'update', 'CFG Fields(3668, field_type => related)', '', '2020-01-25 14:21:43'),
(13, 1, 'update', 'CFG Fields(218, field_index => table_index)', '', '2020-01-25 14:21:43'),
(14, 1, 'update', 'CFG Fields(218, field_name => index)', '', '2020-01-25 14:21:43'),
(15, 1, 'update', 'CFG Fields(218, list_width => )', '', '2020-01-25 14:21:43'),
(16, 1, 'update', 'CFG Fields(218, field_options => )', '', '2020-01-25 14:21:43'),
(17, 1, 'update', 'CFG Fields(218, field_type => text)', '', '2020-01-25 14:21:43'),
(18, 1, 'update', 'CFG Fields(219, field_index => table_name)', '', '2020-01-25 14:21:43'),
(19, 1, 'update', 'CFG Fields(219, field_name => table_name)', '', '2020-01-25 14:21:43'),
(20, 1, 'update', 'CFG Fields(219, list_width => )', '', '2020-01-25 14:21:43'),
(21, 1, 'update', 'CFG Fields(219, field_options => )', '', '2020-01-25 14:21:43'),
(22, 1, 'update', 'CFG Fields(219, field_type => text)', '', '2020-01-25 14:21:43'),
(23, 1, 'update', 'CFG Fields(240, field_index => table_title)', '', '2020-01-25 14:21:43'),
(24, 1, 'update', 'CFG Fields(240, field_name => title)', '', '2020-01-25 14:21:43'),
(25, 1, 'update', 'CFG Fields(240, list_width => 200px)', '', '2020-01-25 14:21:43'),
(26, 1, 'update', 'CFG Fields(240, field_options => )', '', '2020-01-25 14:21:43'),
(27, 1, 'update', 'CFG Fields(240, field_type => text)', '', '2020-01-25 14:21:43'),
(28, 1, 'update', 'CFG Fields(220, field_index => table_primarykey)', '', '2020-01-25 14:21:43'),
(29, 1, 'update', 'CFG Fields(220, field_name => table_primarykey)', '', '2020-01-25 14:21:43'),
(30, 1, 'update', 'CFG Fields(220, list_width => )', '', '2020-01-25 14:21:43'),
(31, 1, 'update', 'CFG Fields(220, field_options => )', '', '2020-01-25 14:21:43'),
(32, 1, 'update', 'CFG Fields(220, field_type => text)', '', '2020-01-25 14:21:43'),
(33, 1, 'update', 'CFG Fields(221, field_index => table_order_field)', '', '2020-01-25 14:21:43'),
(34, 1, 'update', 'CFG Fields(221, field_name => table_order_field)', '', '2020-01-25 14:21:43'),
(35, 1, 'update', 'CFG Fields(221, list_width => )', '', '2020-01-25 14:21:43'),
(36, 1, 'update', 'CFG Fields(221, field_options => )', '', '2020-01-25 14:21:43'),
(37, 1, 'update', 'CFG Fields(221, field_type => text)', '', '2020-01-25 14:21:43'),
(38, 1, 'update', 'CFG Fields(222, field_index => table_order_default_direction)', '', '2020-01-25 14:21:43'),
(39, 1, 'update', 'CFG Fields(222, field_name => default_direction)', '', '2020-01-25 14:21:43'),
(40, 1, 'update', 'CFG Fields(222, list_width => )', '', '2020-01-25 14:21:43'),
(41, 1, 'update', 'CFG Fields(222, field_options => )', '', '2020-01-25 14:21:43'),
(42, 1, 'update', 'CFG Fields(222, field_type => select)', '', '2020-01-25 14:21:43'),
(43, 1, 'update', 'CFG Fields(223, field_index => table_order_type)', '', '2020-01-25 14:21:43'),
(44, 1, 'update', 'CFG Fields(223, field_name => order_type)', '', '2020-01-25 14:21:43'),
(45, 1, 'update', 'CFG Fields(223, list_width => )', '', '2020-01-25 14:21:43'),
(46, 1, 'update', 'CFG Fields(223, field_options => )', '', '2020-01-25 14:21:43'),
(47, 1, 'update', 'CFG Fields(223, field_type => select)', '', '2020-01-25 14:21:43'),
(48, 1, 'update', 'CFG Fields(224, field_index => listwidth_class)', '', '2020-01-25 14:21:43'),
(49, 1, 'update', 'CFG Fields(224, field_name => listwidth_class)', '', '2020-01-25 14:21:43'),
(50, 1, 'update', 'CFG Fields(224, list_width => )', '', '2020-01-25 14:21:43'),
(51, 1, 'update', 'CFG Fields(224, field_options => )', '', '2020-01-25 14:21:43'),
(52, 1, 'update', 'CFG Fields(224, field_type => select)', '', '2020-01-25 14:21:43'),
(53, 1, 'update', 'CFG Fields(225, field_index => perpage_nums)', '', '2020-01-25 14:21:43'),
(54, 1, 'update', 'CFG Fields(225, field_name => perpage_nums)', '', '2020-01-25 14:21:43'),
(55, 1, 'update', 'CFG Fields(225, list_width => )', '', '2020-01-25 14:21:43'),
(56, 1, 'update', 'CFG Fields(225, field_options => )', '', '2020-01-25 14:21:43'),
(57, 1, 'update', 'CFG Fields(225, field_type => text)', '', '2020-01-25 14:21:43'),
(58, 1, 'update', 'CFG Fields(226, field_index => table_create_field)', '', '2020-01-25 14:21:43'),
(59, 1, 'update', 'CFG Fields(226, field_name => table_create_field)', '', '2020-01-25 14:21:43'),
(60, 1, 'update', 'CFG Fields(226, list_width => )', '', '2020-01-25 14:21:43'),
(61, 1, 'update', 'CFG Fields(226, field_options => )', '', '2020-01-25 14:21:43'),
(62, 1, 'update', 'CFG Fields(226, field_type => text)', '', '2020-01-25 14:21:43'),
(63, 1, 'update', 'CFG Fields(227, field_index => table_modify_field)', '', '2020-01-25 14:21:43'),
(64, 1, 'update', 'CFG Fields(227, field_name => table_modify_field)', '', '2020-01-25 14:21:43'),
(65, 1, 'update', 'CFG Fields(227, list_width => )', '', '2020-01-25 14:21:43'),
(66, 1, 'update', 'CFG Fields(227, field_options => )', '', '2020-01-25 14:21:43'),
(67, 1, 'update', 'CFG Fields(227, field_type => text)', '', '2020-01-25 14:21:43'),
(68, 1, 'update', 'CFG Fields(3296, field_index => table_create_admin)', '', '2020-01-25 14:21:43'),
(69, 1, 'update', 'CFG Fields(3296, field_name => table_create_admin)', '', '2020-01-25 14:21:43'),
(70, 1, 'update', 'CFG Fields(3296, list_width => )', '', '2020-01-25 14:21:43'),
(71, 1, 'update', 'CFG Fields(3296, field_options => )', '', '2020-01-25 14:21:43'),
(72, 1, 'update', 'CFG Fields(3296, field_type => text)', '', '2020-01-25 14:21:43'),
(73, 1, 'update', 'CFG Fields(3297, field_index => table_modified_admin)', '', '2020-01-25 14:21:43'),
(74, 1, 'update', 'CFG Fields(3297, field_name => table_modified_admin)', '', '2020-01-25 14:21:43'),
(75, 1, 'update', 'CFG Fields(3297, list_width => )', '', '2020-01-25 14:21:43'),
(76, 1, 'update', 'CFG Fields(3297, field_options => )', '', '2020-01-25 14:21:43'),
(77, 1, 'update', 'CFG Fields(3297, field_type => text)', '', '2020-01-25 14:21:43'),
(78, 1, 'update', 'CFG Fields(228, field_index => extra_urlpar)', '', '2020-01-25 14:21:43'),
(79, 1, 'update', 'CFG Fields(228, field_name => extra_urlpar)', '', '2020-01-25 14:21:43'),
(80, 1, 'update', 'CFG Fields(228, list_width => )', '', '2020-01-25 14:21:43'),
(81, 1, 'update', 'CFG Fields(228, field_options => )', '', '2020-01-25 14:21:43'),
(82, 1, 'update', 'CFG Fields(228, field_type => text)', '', '2020-01-25 14:21:43'),
(83, 1, 'update', 'CFG Fields(229, field_index => preview_url)', '', '2020-01-25 14:21:43'),
(84, 1, 'update', 'CFG Fields(229, field_name => preview_url)', '', '2020-01-25 14:21:43'),
(85, 1, 'update', 'CFG Fields(229, list_width => )', '', '2020-01-25 14:21:43'),
(86, 1, 'update', 'CFG Fields(229, field_options => )', '', '2020-01-25 14:21:43'),
(87, 1, 'update', 'CFG Fields(229, field_type => text)', '', '2020-01-25 14:21:43'),
(88, 1, 'update', 'CFG Fields(230, field_index => table_option)', '', '2020-01-25 14:21:43'),
(89, 1, 'update', 'CFG Fields(230, field_name => table_option)', '', '2020-01-25 14:21:43'),
(90, 1, 'update', 'CFG Fields(230, list_width => )', '', '2020-01-25 14:21:43'),
(91, 1, 'update', 'CFG Fields(230, field_options => )', '', '2020-01-25 14:21:43'),
(92, 1, 'update', 'CFG Fields(230, field_type => checkbox)', '', '2020-01-25 14:21:43'),
(93, 1, 'update', 'CFG Fields(231, field_index => list_filter)', '', '2020-01-25 14:21:43'),
(94, 1, 'update', 'CFG Fields(231, field_name => list_filter)', '', '2020-01-25 14:21:43'),
(95, 1, 'update', 'CFG Fields(231, list_width => )', '', '2020-01-25 14:21:43'),
(96, 1, 'update', 'CFG Fields(231, field_options => )', '', '2020-01-25 14:21:43'),
(97, 1, 'update', 'CFG Fields(231, field_type => related_multiple)', '', '2020-01-25 14:21:43'),
(98, 1, 'update', 'CFG Fields(232, field_index => search_field)', '', '2020-01-25 14:21:43'),
(99, 1, 'update', 'CFG Fields(232, field_name => search field)', '', '2020-01-25 14:21:43'),
(100, 1, 'update', 'CFG Fields(232, list_width => )', '', '2020-01-25 14:21:43'),
(101, 1, 'update', 'CFG Fields(232, field_options => )', '', '2020-01-25 14:21:43'),
(102, 1, 'update', 'CFG Fields(232, field_type => related_multiple)', '', '2020-01-25 14:21:43'),
(103, 1, 'update', 'CFG Fields(233, field_index => list_update)', '', '2020-01-25 14:21:43'),
(104, 1, 'update', 'CFG Fields(233, field_name => list update)', '', '2020-01-25 14:21:43'),
(105, 1, 'update', 'CFG Fields(233, list_width => )', '', '2020-01-25 14:21:43'),
(106, 1, 'update', 'CFG Fields(233, field_options => )', '', '2020-01-25 14:21:43'),
(107, 1, 'update', 'CFG Fields(233, field_type => related_multiple)', '', '2020-01-25 14:21:43'),
(108, 1, 'update', 'CFG Fields(234, field_index => export_field)', '', '2020-01-25 14:21:43'),
(109, 1, 'update', 'CFG Fields(234, field_name => export field)', '', '2020-01-25 14:21:43'),
(110, 1, 'update', 'CFG Fields(234, list_width => )', '', '2020-01-25 14:21:43'),
(111, 1, 'update', 'CFG Fields(234, field_options => )', '', '2020-01-25 14:21:43'),
(112, 1, 'update', 'CFG Fields(234, field_type => related_multiple)', '', '2020-01-25 14:21:43'),
(113, 1, 'update', 'CFG Fields(235, field_index => parent_related_key)', '', '2020-01-25 14:21:43'),
(114, 1, 'update', 'CFG Fields(235, field_name => parent_related_key)', '', '2020-01-25 14:21:43'),
(115, 1, 'update', 'CFG Fields(235, list_width => )', '', '2020-01-25 14:21:43'),
(116, 1, 'update', 'CFG Fields(235, field_options => )', '', '2020-01-25 14:21:43'),
(117, 1, 'update', 'CFG Fields(235, field_type => text)', '', '2020-01-25 14:21:43'),
(118, 1, 'update', 'CFG Fields(236, field_index => parent_table)', '', '2020-01-25 14:21:43'),
(119, 1, 'update', 'CFG Fields(236, field_name => parent_table)', '', '2020-01-25 14:21:43'),
(120, 1, 'update', 'CFG Fields(236, list_width => )', '', '2020-01-25 14:21:43'),
(121, 1, 'update', 'CFG Fields(236, field_options => )', '', '2020-01-25 14:21:43'),
(122, 1, 'update', 'CFG Fields(236, field_type => text)', '', '2020-01-25 14:21:43'),
(123, 1, 'update', 'CFG Fields(237, field_index => parent_show_title)', '', '2020-01-25 14:21:43'),
(124, 1, 'update', 'CFG Fields(237, field_name => parent_show_title)', '', '2020-01-25 14:21:43'),
(125, 1, 'update', 'CFG Fields(237, list_width => )', '', '2020-01-25 14:21:43'),
(126, 1, 'update', 'CFG Fields(237, field_options => )', '', '2020-01-25 14:21:43'),
(127, 1, 'update', 'CFG Fields(237, field_type => text)', '', '2020-01-25 14:21:43'),
(128, 1, 'update', 'CFG Fields(238, field_index => table_type)', '', '2020-01-25 14:21:43'),
(129, 1, 'update', 'CFG Fields(238, field_name => table_type)', '', '2020-01-25 14:21:43'),
(130, 1, 'update', 'CFG Fields(238, list_width => )', '', '2020-01-25 14:21:43'),
(131, 1, 'update', 'CFG Fields(238, field_options => )', '', '2020-01-25 14:21:43'),
(132, 1, 'update', 'CFG Fields(238, field_type => select)', '', '2020-01-25 14:21:43'),
(133, 1, 'update', 'CFG Fields(242, field_index => )', '', '2020-01-25 14:21:43'),
(134, 1, 'update', 'CFG Fields(242, field_name => <div class=\"table_type_rtdselect table_type_setting\" style=\"display:none;\">)', '', '2020-01-25 14:21:43'),
(135, 1, 'update', 'CFG Fields(242, list_width => )', '', '2020-01-25 14:21:43'),
(136, 1, 'update', 'CFG Fields(242, field_options => )', '', '2020-01-25 14:21:43'),
(137, 1, 'update', 'CFG Fields(242, field_type => html)', '', '2020-01-25 14:21:43'),
(138, 1, 'update', 'CFG Fields(243, field_index => table_key)', '', '2020-01-25 14:21:43'),
(139, 1, 'update', 'CFG Fields(243, field_name => table_key)', '', '2020-01-25 14:21:43'),
(140, 1, 'update', 'CFG Fields(243, list_width => )', '', '2020-01-25 14:21:43'),
(141, 1, 'update', 'CFG Fields(243, field_options => )', '', '2020-01-25 14:21:43'),
(142, 1, 'update', 'CFG Fields(243, field_type => text)', '', '2020-01-25 14:21:43'),
(143, 1, 'update', 'CFG Fields(244, field_index => table_value)', '', '2020-01-25 14:21:43'),
(144, 1, 'update', 'CFG Fields(244, field_name => table_value)', '', '2020-01-25 14:21:43'),
(145, 1, 'update', 'CFG Fields(244, list_width => )', '', '2020-01-25 14:21:43'),
(146, 1, 'update', 'CFG Fields(244, field_options => )', '', '2020-01-25 14:21:43'),
(147, 1, 'update', 'CFG Fields(244, field_type => text)', '', '2020-01-25 14:21:43'),
(148, 1, 'update', 'CFG Fields(245, field_index => )', '', '2020-01-25 14:21:43'),
(149, 1, 'update', 'CFG Fields(245, field_name => </div>)', '', '2020-01-25 14:21:43'),
(150, 1, 'update', 'CFG Fields(245, list_width => )', '', '2020-01-25 14:21:43'),
(151, 1, 'update', 'CFG Fields(245, field_options => )', '', '2020-01-25 14:21:43'),
(152, 1, 'update', 'CFG Fields(245, field_type => html)', '', '2020-01-25 14:21:43'),
(153, 1, 'update', 'CFG Fields(437, field_index => )', '', '2020-01-25 14:21:43'),
(154, 1, 'update', 'CFG Fields(437, field_name => <div class=\"table_type_rtdselect table_type_imagelist\" style=\"display:none;\">)', '', '2020-01-25 14:21:43'),
(155, 1, 'update', 'CFG Fields(437, list_width => )', '', '2020-01-25 14:21:43'),
(156, 1, 'update', 'CFG Fields(437, field_options => )', '', '2020-01-25 14:21:43'),
(157, 1, 'update', 'CFG Fields(437, field_type => html)', '', '2020-01-25 14:21:43'),
(158, 1, 'update', 'CFG Fields(438, field_index => image_field)', '', '2020-01-25 14:21:43'),
(159, 1, 'update', 'CFG Fields(438, field_name => image_field)', '', '2020-01-25 14:21:43'),
(160, 1, 'update', 'CFG Fields(438, list_width => )', '', '2020-01-25 14:21:43'),
(161, 1, 'update', 'CFG Fields(438, field_options => )', '', '2020-01-25 14:21:43'),
(162, 1, 'update', 'CFG Fields(438, field_type => text)', '', '2020-01-25 14:21:43'),
(163, 1, 'update', 'CFG Fields(439, field_index => )', '', '2020-01-25 14:21:43'),
(164, 1, 'update', 'CFG Fields(439, field_name => </div>)', '', '2020-01-25 14:21:43'),
(165, 1, 'update', 'CFG Fields(439, list_width => )', '', '2020-01-25 14:21:43'),
(166, 1, 'update', 'CFG Fields(439, field_options => )', '', '2020-01-25 14:21:43'),
(167, 1, 'update', 'CFG Fields(439, field_type => html)', '', '2020-01-25 14:21:43'),
(168, 1, 'update', 'CFG Fields(546, field_index => list_url)', '', '2020-01-25 14:21:43'),
(169, 1, 'update', 'CFG Fields(546, field_name => list_file)', '', '2020-01-25 14:21:43'),
(170, 1, 'update', 'CFG Fields(546, list_width => )', '', '2020-01-25 14:21:43'),
(171, 1, 'update', 'CFG Fields(546, field_options => )', '', '2020-01-25 14:21:43'),
(172, 1, 'update', 'CFG Fields(546, field_type => text)', '', '2020-01-25 14:21:43'),
(173, 1, 'update', 'CFG Fields(246, field_index => modify_url)', '', '2020-01-25 14:21:43'),
(174, 1, 'update', 'CFG Fields(246, field_name => modify_file)', '', '2020-01-25 14:21:43'),
(175, 1, 'update', 'CFG Fields(246, list_width => )', '', '2020-01-25 14:21:43'),
(176, 1, 'update', 'CFG Fields(246, field_options => )', '', '2020-01-25 14:21:43'),
(177, 1, 'update', 'CFG Fields(246, field_type => text)', '', '2020-01-25 14:21:43'),
(178, 1, 'update', 'CFG Fields(247, field_index => create_url)', '', '2020-01-25 14:21:43'),
(179, 1, 'update', 'CFG Fields(247, field_name => create_file)', '', '2020-01-25 14:21:43'),
(180, 1, 'update', 'CFG Fields(247, list_width => )', '', '2020-01-25 14:21:43'),
(181, 1, 'update', 'CFG Fields(247, field_options => )', '', '2020-01-25 14:21:43'),
(182, 1, 'update', 'CFG Fields(247, field_type => text)', '', '2020-01-25 14:21:43'),
(183, 1, 'update', 'CFG Fields(3022, field_index => duplicate_url)', '', '2020-01-25 14:21:43'),
(184, 1, 'update', 'CFG Fields(3022, field_name => duplicate_file)', '', '2020-01-25 14:21:43'),
(185, 1, 'update', 'CFG Fields(3022, list_width => )', '', '2020-01-25 14:21:43'),
(186, 1, 'update', 'CFG Fields(3022, field_options => )', '', '2020-01-25 14:21:43'),
(187, 1, 'update', 'CFG Fields(3022, field_type => text)', '', '2020-01-25 14:21:43'),
(188, 1, 'update', 'CFG Fields(248, field_index => cnt_btns)', '', '2020-01-25 14:21:43'),
(189, 1, 'update', 'CFG Fields(248, field_name => cnt_btns)', '', '2020-01-25 14:21:43'),
(190, 1, 'update', 'CFG Fields(248, list_width => )', '', '2020-01-25 14:21:43'),
(191, 1, 'update', 'CFG Fields(248, field_options => )', '', '2020-01-25 14:21:43'),
(192, 1, 'update', 'CFG Fields(248, field_type => text)', '', '2020-01-25 14:21:43'),
(193, 1, 'update', 'CFG Fields(249, field_index => default_filter)', '', '2020-01-25 14:21:43'),
(194, 1, 'update', 'CFG Fields(249, field_name => default_filter)', '', '2020-01-25 14:21:43'),
(195, 1, 'update', 'CFG Fields(249, list_width => )', '', '2020-01-25 14:21:43'),
(196, 1, 'update', 'CFG Fields(249, field_options => )', '', '2020-01-25 14:21:43'),
(197, 1, 'update', 'CFG Fields(249, field_type => serialize)', '', '2020-01-25 14:21:43'),
(198, 1, 'update', 'CFG Fields(250, field_index => )', '', '2020-01-25 14:21:43'),
(199, 1, 'update', 'CFG Fields(250, field_name => Fields)', '', '2020-01-25 14:21:43'),
(200, 1, 'update', 'CFG Fields(250, list_width => 50px)', '', '2020-01-25 14:21:43'),
(201, 1, 'update', 'CFG Fields(250, field_options => )', '', '2020-01-25 14:21:43'),
(202, 1, 'update', 'CFG Fields(250, field_type => sublist)', '', '2020-01-25 14:21:43'),
(203, 1, 'update', 'CFG Fields(442, field_index => table_parent_id)', '', '2020-01-25 14:21:43'),
(204, 1, 'update', 'CFG Fields(442, field_name => table_parent_id)', '', '2020-01-25 14:21:43'),
(205, 1, 'update', 'CFG Fields(442, list_width => )', '', '2020-01-25 14:21:43'),
(206, 1, 'update', 'CFG Fields(442, field_options => )', '', '2020-01-25 14:21:43'),
(207, 1, 'update', 'CFG Fields(442, field_type => text)', '', '2020-01-25 14:21:43'),
(208, 1, 'update', 'CFG Fields(251, field_index => status)', '', '2020-01-25 14:21:43'),
(209, 1, 'update', 'CFG Fields(251, field_name => Status)', '', '2020-01-25 14:21:43'),
(210, 1, 'update', 'CFG Fields(251, list_width => 60px)', '', '2020-01-25 14:21:43'),
(211, 1, 'update', 'CFG Fields(251, field_options => )', '', '2020-01-25 14:21:43'),
(212, 1, 'update', 'CFG Fields(251, field_type => onoff)', '', '2020-01-25 14:21:43'),
(213, 1, 'delete', 'CFG(170)', '', '2020-01-25 14:21:50'),
(214, 1, 'duplicate', 'CFG(171)', '', '2020-01-25 14:22:01'),
(215, 1, 'delete selected', 'CFG Fields(3751,3753,3752)', '', '2020-01-25 14:22:09'),
(216, 1, 'create', 'CFG Fields(3754)', '', '2020-01-25 14:22:48'),
(217, 1, 'create', 'Main Menu(145)', '', '2020-01-25 14:23:06'),
(218, 1, 'modify', 'CFG(171)', '', '2020-01-25 14:24:14'),
(219, 1, 'modify', 'SETTING()', '', '2020-01-25 14:25:03'),
(220, 1, 'modify', 'SETTING()', '', '2020-01-25 14:25:05'),
(221, 1, 'modify', 'SETTING()', '', '2020-01-25 14:25:06'),
(222, 1, 'duplicate', 'CFG Fields(3755)', '', '2020-01-25 14:29:42'),
(223, 1, 'modify', 'SETTING()', '', '2020-01-25 14:48:27'),
(224, 1, 'modify', 'SETTING()', '', '2020-01-25 14:54:22'),
(225, 1, 'modify', 'SETTING()', '', '2020-01-25 14:54:43'),
(226, 1, 'modify', 'SETTING()', '', '2020-01-25 14:55:29'),
(227, 1, 'modify', 'SETTING()', '', '2020-01-25 14:56:20'),
(228, 1, 'modify', 'SETTING()', '', '2020-01-25 15:01:58'),
(229, 1, 'modify', 'SETTING()', '', '2020-01-25 15:02:19'),
(230, 1, 'modify', 'SETTING()', '', '2020-01-25 15:03:47'),
(231, 1, 'modify', 'SETTING()', '', '2020-01-25 15:04:16'),
(232, 1, 'modify', 'SETTING()', '', '2020-01-25 15:11:20'),
(233, 1, 'modify', 'CFG Fields(3754)', '', '2020-01-25 15:11:36'),
(234, 1, 'modify', 'CFG Fields(3755)', '', '2020-01-25 15:11:39'),
(235, 1, 'modify', 'SETTING()', '', '2020-01-25 15:11:47'),
(236, 1, 'modify', 'SETTING()', '', '2020-01-25 15:34:48'),
(237, 1, 'modify', 'SETTING()', '', '2020-01-25 15:34:55'),
(238, 1, 'delete selected', 'CFG(172,173,174)', '', '2020-01-25 15:39:21'),
(239, 1, 'modify', 'SETTING()', '', '2020-01-25 15:46:11'),
(240, 1, 'modify', 'SETTING()', '', '2020-01-25 15:46:15'),
(241, 1, 'duplicate', 'CFG(184)', '', '2020-01-25 15:46:33'),
(242, 1, 'duplicate', 'CFG(185)', '', '2020-01-25 15:46:44'),
(243, 1, 'duplicate', 'CFG(186)', '', '2020-01-25 15:46:55'),
(244, 1, 'delete selected', 'CFG(175,176,177)', '', '2020-01-25 15:51:57'),
(245, 1, 'update', 'Main Menu(1, name_en => Admin Manage)', '', '2020-01-25 15:52:48'),
(246, 1, 'update', 'Main Menu(1, name_tc => Admin Manage)', '', '2020-01-25 15:52:48'),
(247, 1, 'update', 'Main Menu(1, name_sc => Admin Manage)', '', '2020-01-25 15:52:48'),
(248, 1, 'update', 'Main Menu(1, status => 1)', '', '2020-01-25 15:52:48'),
(249, 1, 'update', 'Main Menu(145, name_en => SQL to Table CFG)', '', '2020-01-25 15:52:48'),
(250, 1, 'update', 'Main Menu(145, name_tc => SQL to Table CFG)', '', '2020-01-25 15:52:48'),
(251, 1, 'update', 'Main Menu(145, name_sc => SQL to Table CFG)', '', '2020-01-25 15:52:48'),
(252, 1, 'update', 'Main Menu(145, status => 1)', '', '2020-01-25 15:52:48'),
(253, 1, 'login', '', '', '2020-03-08 07:41:15'),
(254, 1, 'create', 'CFG Fields(3830)', '', '2020-03-08 07:45:53'),
(255, 1, 'create', 'CFG Fields(3831)', '', '2020-03-08 07:46:28'),
(256, 1, 'modify', 'CFG Fields(3372)', '', '2020-03-08 07:46:59'),
(257, 1, 'login', '', '', '2020-04-01 09:50:43'),
(258, 1, 'duplicate', 'CFG Fields(3832)', '', '2020-04-01 09:52:07'),
(259, 1, 'order', 'CFG Fields(39, 1)', '', '2020-04-01 09:52:23'),
(260, 1, 'order', 'CFG Fields(39, 1)', '', '2020-04-01 09:52:25'),
(261, 1, 'duplicate', 'CFG admin(309)', '', '2020-04-01 10:28:12'),
(262, 1, 'login', '', '', '2020-04-01 10:44:37'),
(263, 1, 'duplicate', 'CFG admin(309)', '', '2020-04-01 10:44:49'),
(264, 1, 'update', 'CFG Fields(3832, field_index => db_name)', '', '2020-04-01 10:51:15'),
(265, 1, 'update', 'CFG Fields(3832, field_name => Database)', '', '2020-04-01 10:51:15'),
(266, 1, 'update', 'CFG Fields(3832, list_width => )', '', '2020-04-01 10:51:15'),
(267, 1, 'update', 'CFG Fields(3832, field_options => )', '', '2020-04-01 10:51:15'),
(268, 1, 'update', 'CFG Fields(3832, field_type => text)', '', '2020-04-01 10:51:15'),
(269, 1, 'update', 'CFG Fields(2835, field_index => table_index)', '', '2020-04-01 10:51:15'),
(270, 1, 'update', 'CFG Fields(2835, field_name => index)', '', '2020-04-01 10:51:15'),
(271, 1, 'update', 'CFG Fields(2835, list_width => )', '', '2020-04-01 10:51:15'),
(272, 1, 'update', 'CFG Fields(2835, field_options => )', '', '2020-04-01 10:51:15'),
(273, 1, 'update', 'CFG Fields(2835, field_type => text)', '', '2020-04-01 10:51:15'),
(274, 1, 'update', 'CFG Fields(2836, field_index => table_name)', '', '2020-04-01 10:51:15'),
(275, 1, 'update', 'CFG Fields(2836, field_name => table_name)', '', '2020-04-01 10:51:15'),
(276, 1, 'update', 'CFG Fields(2836, list_width => )', '', '2020-04-01 10:51:15'),
(277, 1, 'update', 'CFG Fields(2836, field_options => )', '', '2020-04-01 10:51:15'),
(278, 1, 'update', 'CFG Fields(2836, field_type => text)', '', '2020-04-01 10:51:15'),
(279, 1, 'update', 'CFG Fields(2857, field_index => table_title)', '', '2020-04-01 10:51:15'),
(280, 1, 'update', 'CFG Fields(2857, field_name => title)', '', '2020-04-01 10:51:15'),
(281, 1, 'update', 'CFG Fields(2857, list_width => 200px)', '', '2020-04-01 10:51:15'),
(282, 1, 'update', 'CFG Fields(2857, field_options => )', '', '2020-04-01 10:51:15'),
(283, 1, 'update', 'CFG Fields(2857, field_type => text)', '', '2020-04-01 10:51:15'),
(284, 1, 'update', 'CFG Fields(2837, field_index => table_primarykey)', '', '2020-04-01 10:51:15'),
(285, 1, 'update', 'CFG Fields(2837, field_name => table_primarykey)', '', '2020-04-01 10:51:15'),
(286, 1, 'update', 'CFG Fields(2837, list_width => )', '', '2020-04-01 10:51:15'),
(287, 1, 'update', 'CFG Fields(2837, field_options => )', '', '2020-04-01 10:51:15'),
(288, 1, 'update', 'CFG Fields(2837, field_type => text)', '', '2020-04-01 10:51:15'),
(289, 1, 'update', 'CFG Fields(2838, field_index => table_order_field)', '', '2020-04-01 10:51:15'),
(290, 1, 'update', 'CFG Fields(2838, field_name => table_order_field)', '', '2020-04-01 10:51:15'),
(291, 1, 'update', 'CFG Fields(2838, list_width => )', '', '2020-04-01 10:51:15'),
(292, 1, 'update', 'CFG Fields(2838, field_options => )', '', '2020-04-01 10:51:15'),
(293, 1, 'update', 'CFG Fields(2838, field_type => text)', '', '2020-04-01 10:51:15'),
(294, 1, 'update', 'CFG Fields(2839, field_index => table_order_default_direction)', '', '2020-04-01 10:51:15'),
(295, 1, 'update', 'CFG Fields(2839, field_name => default_direction)', '', '2020-04-01 10:51:15'),
(296, 1, 'update', 'CFG Fields(2839, list_width => )', '', '2020-04-01 10:51:15'),
(297, 1, 'update', 'CFG Fields(2839, field_options => )', '', '2020-04-01 10:51:15'),
(298, 1, 'update', 'CFG Fields(2839, field_type => select)', '', '2020-04-01 10:51:15'),
(299, 1, 'update', 'CFG Fields(2840, field_index => table_order_type)', '', '2020-04-01 10:51:15'),
(300, 1, 'update', 'CFG Fields(2840, field_name => order_type)', '', '2020-04-01 10:51:15'),
(301, 1, 'update', 'CFG Fields(2840, list_width => )', '', '2020-04-01 10:51:15'),
(302, 1, 'update', 'CFG Fields(2840, field_options => )', '', '2020-04-01 10:51:15'),
(303, 1, 'update', 'CFG Fields(2840, field_type => select)', '', '2020-04-01 10:51:15'),
(304, 1, 'update', 'CFG Fields(2841, field_index => listwidth_class)', '', '2020-04-01 10:51:15'),
(305, 1, 'update', 'CFG Fields(2841, field_name => listwidth_class)', '', '2020-04-01 10:51:15'),
(306, 1, 'update', 'CFG Fields(2841, list_width => )', '', '2020-04-01 10:51:15'),
(307, 1, 'update', 'CFG Fields(2841, field_options => )', '', '2020-04-01 10:51:15'),
(308, 1, 'update', 'CFG Fields(2841, field_type => select)', '', '2020-04-01 10:51:15'),
(309, 1, 'update', 'CFG Fields(2842, field_index => perpage_nums)', '', '2020-04-01 10:51:15'),
(310, 1, 'update', 'CFG Fields(2842, field_name => perpage_nums)', '', '2020-04-01 10:51:15'),
(311, 1, 'update', 'CFG Fields(2842, list_width => )', '', '2020-04-01 10:51:15'),
(312, 1, 'update', 'CFG Fields(2842, field_options => )', '', '2020-04-01 10:51:15'),
(313, 1, 'update', 'CFG Fields(2842, field_type => text)', '', '2020-04-01 10:51:15'),
(314, 1, 'update', 'CFG Fields(2843, field_index => table_create_field)', '', '2020-04-01 10:51:15'),
(315, 1, 'update', 'CFG Fields(2843, field_name => table_create_field)', '', '2020-04-01 10:51:15'),
(316, 1, 'update', 'CFG Fields(2843, list_width => )', '', '2020-04-01 10:51:15'),
(317, 1, 'update', 'CFG Fields(2843, field_options => )', '', '2020-04-01 10:51:15'),
(318, 1, 'update', 'CFG Fields(2843, field_type => text)', '', '2020-04-01 10:51:15'),
(319, 1, 'update', 'CFG Fields(2844, field_index => table_modify_field)', '', '2020-04-01 10:51:15'),
(320, 1, 'update', 'CFG Fields(2844, field_name => table_modify_field)', '', '2020-04-01 10:51:15'),
(321, 1, 'update', 'CFG Fields(2844, list_width => )', '', '2020-04-01 10:51:15'),
(322, 1, 'update', 'CFG Fields(2844, field_options => )', '', '2020-04-01 10:51:15'),
(323, 1, 'update', 'CFG Fields(2844, field_type => text)', '', '2020-04-01 10:51:15'),
(324, 1, 'update', 'CFG Fields(2845, field_index => extra_urlpar)', '', '2020-04-01 10:51:15'),
(325, 1, 'update', 'CFG Fields(2845, field_name => extra_urlpar)', '', '2020-04-01 10:51:15'),
(326, 1, 'update', 'CFG Fields(2845, list_width => )', '', '2020-04-01 10:51:15'),
(327, 1, 'update', 'CFG Fields(2845, field_options => )', '', '2020-04-01 10:51:15'),
(328, 1, 'update', 'CFG Fields(2845, field_type => text)', '', '2020-04-01 10:51:15'),
(329, 1, 'update', 'CFG Fields(2846, field_index => preview_url)', '', '2020-04-01 10:51:15'),
(330, 1, 'update', 'CFG Fields(2846, field_name => preview_url)', '', '2020-04-01 10:51:15'),
(331, 1, 'update', 'CFG Fields(2846, list_width => )', '', '2020-04-01 10:51:15'),
(332, 1, 'update', 'CFG Fields(2846, field_options => )', '', '2020-04-01 10:51:15'),
(333, 1, 'update', 'CFG Fields(2846, field_type => text)', '', '2020-04-01 10:51:15'),
(334, 1, 'update', 'CFG Fields(2847, field_index => table_option)', '', '2020-04-01 10:51:15'),
(335, 1, 'update', 'CFG Fields(2847, field_name => table_option)', '', '2020-04-01 10:51:15'),
(336, 1, 'update', 'CFG Fields(2847, list_width => )', '', '2020-04-01 10:51:15'),
(337, 1, 'update', 'CFG Fields(2847, field_options => )', '', '2020-04-01 10:51:15'),
(338, 1, 'update', 'CFG Fields(2847, field_type => checkbox)', '', '2020-04-01 10:51:15'),
(339, 1, 'update', 'CFG Fields(2848, field_index => list_filter)', '', '2020-04-01 10:51:15'),
(340, 1, 'update', 'CFG Fields(2848, field_name => list_filter)', '', '2020-04-01 10:51:15'),
(341, 1, 'update', 'CFG Fields(2848, list_width => )', '', '2020-04-01 10:51:15'),
(342, 1, 'update', 'CFG Fields(2848, field_options => )', '', '2020-04-01 10:51:15'),
(343, 1, 'update', 'CFG Fields(2848, field_type => related_multiple)', '', '2020-04-01 10:51:15'),
(344, 1, 'update', 'CFG Fields(2849, field_index => search_field)', '', '2020-04-01 10:51:15'),
(345, 1, 'update', 'CFG Fields(2849, field_name => search field)', '', '2020-04-01 10:51:15'),
(346, 1, 'update', 'CFG Fields(2849, list_width => )', '', '2020-04-01 10:51:15'),
(347, 1, 'update', 'CFG Fields(2849, field_options => )', '', '2020-04-01 10:51:15'),
(348, 1, 'update', 'CFG Fields(2849, field_type => related_multiple)', '', '2020-04-01 10:51:15'),
(349, 1, 'update', 'CFG Fields(2850, field_index => list_update)', '', '2020-04-01 10:51:15'),
(350, 1, 'update', 'CFG Fields(2850, field_name => list update)', '', '2020-04-01 10:51:15'),
(351, 1, 'update', 'CFG Fields(2850, list_width => )', '', '2020-04-01 10:51:15'),
(352, 1, 'update', 'CFG Fields(2850, field_options => )', '', '2020-04-01 10:51:15'),
(353, 1, 'update', 'CFG Fields(2850, field_type => related_multiple)', '', '2020-04-01 10:51:15'),
(354, 1, 'update', 'CFG Fields(2851, field_index => export_field)', '', '2020-04-01 10:51:15'),
(355, 1, 'update', 'CFG Fields(2851, field_name => export field)', '', '2020-04-01 10:51:15'),
(356, 1, 'update', 'CFG Fields(2851, list_width => )', '', '2020-04-01 10:51:15'),
(357, 1, 'update', 'CFG Fields(2851, field_options => )', '', '2020-04-01 10:51:15'),
(358, 1, 'update', 'CFG Fields(2851, field_type => related_multiple)', '', '2020-04-01 10:51:15'),
(359, 1, 'update', 'CFG Fields(2852, field_index => parent_related_key)', '', '2020-04-01 10:51:15'),
(360, 1, 'update', 'CFG Fields(2852, field_name => parent_related_key)', '', '2020-04-01 10:51:15'),
(361, 1, 'update', 'CFG Fields(2852, list_width => )', '', '2020-04-01 10:51:15'),
(362, 1, 'update', 'CFG Fields(2852, field_options => )', '', '2020-04-01 10:51:15'),
(363, 1, 'update', 'CFG Fields(2852, field_type => text)', '', '2020-04-01 10:51:15'),
(364, 1, 'update', 'CFG Fields(2853, field_index => parent_table)', '', '2020-04-01 10:51:15'),
(365, 1, 'update', 'CFG Fields(2853, field_name => parent_table)', '', '2020-04-01 10:51:15'),
(366, 1, 'update', 'CFG Fields(2853, list_width => )', '', '2020-04-01 10:51:15'),
(367, 1, 'update', 'CFG Fields(2853, field_options => )', '', '2020-04-01 10:51:15'),
(368, 1, 'update', 'CFG Fields(2853, field_type => text)', '', '2020-04-01 10:51:15'),
(369, 1, 'update', 'CFG Fields(2854, field_index => parent_show_title)', '', '2020-04-01 10:51:15'),
(370, 1, 'update', 'CFG Fields(2854, field_name => parent_show_title)', '', '2020-04-01 10:51:15'),
(371, 1, 'update', 'CFG Fields(2854, list_width => )', '', '2020-04-01 10:51:15'),
(372, 1, 'update', 'CFG Fields(2854, field_options => )', '', '2020-04-01 10:51:15'),
(373, 1, 'update', 'CFG Fields(2854, field_type => text)', '', '2020-04-01 10:51:15'),
(374, 1, 'update', 'CFG Fields(2855, field_index => table_type)', '', '2020-04-01 10:51:15'),
(375, 1, 'update', 'CFG Fields(2855, field_name => table_type)', '', '2020-04-01 10:51:15'),
(376, 1, 'update', 'CFG Fields(2855, list_width => )', '', '2020-04-01 10:51:15'),
(377, 1, 'update', 'CFG Fields(2855, field_options => )', '', '2020-04-01 10:51:15'),
(378, 1, 'update', 'CFG Fields(2855, field_type => select)', '', '2020-04-01 10:51:15'),
(379, 1, 'update', 'CFG Fields(2858, field_index => )', '', '2020-04-01 10:51:15'),
(380, 1, 'update', 'CFG Fields(2858, field_name => <div class=\"table_type_rtdselect table_type_setting\" style=\"display:none;\">)', '', '2020-04-01 10:51:15'),
(381, 1, 'update', 'CFG Fields(2858, list_width => )', '', '2020-04-01 10:51:15'),
(382, 1, 'update', 'CFG Fields(2858, field_options => )', '', '2020-04-01 10:51:15'),
(383, 1, 'update', 'CFG Fields(2858, field_type => html)', '', '2020-04-01 10:51:15'),
(384, 1, 'update', 'CFG Fields(2859, field_index => table_key)', '', '2020-04-01 10:51:15'),
(385, 1, 'update', 'CFG Fields(2859, field_name => table_key)', '', '2020-04-01 10:51:15'),
(386, 1, 'update', 'CFG Fields(2859, list_width => )', '', '2020-04-01 10:51:15'),
(387, 1, 'update', 'CFG Fields(2859, field_options => )', '', '2020-04-01 10:51:15'),
(388, 1, 'update', 'CFG Fields(2859, field_type => text)', '', '2020-04-01 10:51:15'),
(389, 1, 'update', 'CFG Fields(2860, field_index => table_value)', '', '2020-04-01 10:51:15'),
(390, 1, 'update', 'CFG Fields(2860, field_name => table_value)', '', '2020-04-01 10:51:15'),
(391, 1, 'update', 'CFG Fields(2860, list_width => )', '', '2020-04-01 10:51:15'),
(392, 1, 'update', 'CFG Fields(2860, field_options => )', '', '2020-04-01 10:51:15'),
(393, 1, 'update', 'CFG Fields(2860, field_type => text)', '', '2020-04-01 10:51:15'),
(394, 1, 'update', 'CFG Fields(2861, field_index => )', '', '2020-04-01 10:51:15'),
(395, 1, 'update', 'CFG Fields(2861, field_name => </div>)', '', '2020-04-01 10:51:15'),
(396, 1, 'update', 'CFG Fields(2861, list_width => )', '', '2020-04-01 10:51:15'),
(397, 1, 'update', 'CFG Fields(2861, field_options => )', '', '2020-04-01 10:51:15'),
(398, 1, 'update', 'CFG Fields(2861, field_type => html)', '', '2020-04-01 10:51:15'),
(399, 1, 'update', 'CFG Fields(2868, field_index => )', '', '2020-04-01 10:51:15'),
(400, 1, 'update', 'CFG Fields(2868, field_name => <div class=\"table_type_rtdselect table_type_imagelist\" style=\"display:none;\">)', '', '2020-04-01 10:51:15'),
(401, 1, 'update', 'CFG Fields(2868, list_width => )', '', '2020-04-01 10:51:15'),
(402, 1, 'update', 'CFG Fields(2868, field_options => )', '', '2020-04-01 10:51:15'),
(403, 1, 'update', 'CFG Fields(2868, field_type => html)', '', '2020-04-01 10:51:15'),
(404, 1, 'update', 'CFG Fields(2869, field_index => image_field)', '', '2020-04-01 10:51:15'),
(405, 1, 'update', 'CFG Fields(2869, field_name => image_field)', '', '2020-04-01 10:51:15'),
(406, 1, 'update', 'CFG Fields(2869, list_width => )', '', '2020-04-01 10:51:15'),
(407, 1, 'update', 'CFG Fields(2869, field_options => )', '', '2020-04-01 10:51:15'),
(408, 1, 'update', 'CFG Fields(2869, field_type => text)', '', '2020-04-01 10:51:15'),
(409, 1, 'update', 'CFG Fields(2870, field_index => )', '', '2020-04-01 10:51:15'),
(410, 1, 'update', 'CFG Fields(2870, field_name => </div>)', '', '2020-04-01 10:51:15'),
(411, 1, 'update', 'CFG Fields(2870, list_width => )', '', '2020-04-01 10:51:15'),
(412, 1, 'update', 'CFG Fields(2870, field_options => )', '', '2020-04-01 10:51:15'),
(413, 1, 'update', 'CFG Fields(2870, field_type => html)', '', '2020-04-01 10:51:15'),
(414, 1, 'update', 'CFG Fields(2856, field_index => list_url)', '', '2020-04-01 10:51:15'),
(415, 1, 'update', 'CFG Fields(2856, field_name => list_url)', '', '2020-04-01 10:51:15'),
(416, 1, 'update', 'CFG Fields(2856, list_width => )', '', '2020-04-01 10:51:15'),
(417, 1, 'update', 'CFG Fields(2856, field_options => )', '', '2020-04-01 10:51:15'),
(418, 1, 'update', 'CFG Fields(2856, field_type => text)', '', '2020-04-01 10:51:15'),
(419, 1, 'update', 'CFG Fields(2862, field_index => modify_url)', '', '2020-04-01 10:51:15'),
(420, 1, 'update', 'CFG Fields(2862, field_name => modify_url)', '', '2020-04-01 10:51:15'),
(421, 1, 'update', 'CFG Fields(2862, list_width => )', '', '2020-04-01 10:51:15'),
(422, 1, 'update', 'CFG Fields(2862, field_options => )', '', '2020-04-01 10:51:15'),
(423, 1, 'update', 'CFG Fields(2862, field_type => text)', '', '2020-04-01 10:51:15'),
(424, 1, 'update', 'CFG Fields(2863, field_index => create_url)', '', '2020-04-01 10:51:15'),
(425, 1, 'update', 'CFG Fields(2863, field_name => create_url)', '', '2020-04-01 10:51:15'),
(426, 1, 'update', 'CFG Fields(2863, list_width => )', '', '2020-04-01 10:51:15'),
(427, 1, 'update', 'CFG Fields(2863, field_options => )', '', '2020-04-01 10:51:15'),
(428, 1, 'update', 'CFG Fields(2863, field_type => text)', '', '2020-04-01 10:51:15'),
(429, 1, 'update', 'CFG Fields(3023, field_index => duplicate_url)', '', '2020-04-01 10:51:15'),
(430, 1, 'update', 'CFG Fields(3023, field_name => duplicate_url)', '', '2020-04-01 10:51:15'),
(431, 1, 'update', 'CFG Fields(3023, list_width => )', '', '2020-04-01 10:51:15'),
(432, 1, 'update', 'CFG Fields(3023, field_options => )', '', '2020-04-01 10:51:15'),
(433, 1, 'update', 'CFG Fields(3023, field_type => text)', '', '2020-04-01 10:51:15'),
(434, 1, 'update', 'CFG Fields(2864, field_index => cnt_btns)', '', '2020-04-01 10:51:15'),
(435, 1, 'update', 'CFG Fields(2864, field_name => cnt_btns)', '', '2020-04-01 10:51:15'),
(436, 1, 'update', 'CFG Fields(2864, list_width => )', '', '2020-04-01 10:51:15'),
(437, 1, 'update', 'CFG Fields(2864, field_options => )', '', '2020-04-01 10:51:15'),
(438, 1, 'update', 'CFG Fields(2864, field_type => text)', '', '2020-04-01 10:51:15'),
(439, 1, 'update', 'CFG Fields(2865, field_index => default_filter)', '', '2020-04-01 10:51:15'),
(440, 1, 'update', 'CFG Fields(2865, field_name => default_filter)', '', '2020-04-01 10:51:15'),
(441, 1, 'update', 'CFG Fields(2865, list_width => )', '', '2020-04-01 10:51:15'),
(442, 1, 'update', 'CFG Fields(2865, field_options => )', '', '2020-04-01 10:51:15'),
(443, 1, 'update', 'CFG Fields(2865, field_type => serialize)', '', '2020-04-01 10:51:15'),
(444, 1, 'update', 'CFG Fields(2866, field_index => )', '', '2020-04-01 10:51:15'),
(445, 1, 'update', 'CFG Fields(2866, field_name => Fields)', '', '2020-04-01 10:51:15'),
(446, 1, 'update', 'CFG Fields(2866, list_width => 50px)', '', '2020-04-01 10:51:15'),
(447, 1, 'update', 'CFG Fields(2866, field_options => )', '', '2020-04-01 10:51:15'),
(448, 1, 'update', 'CFG Fields(2866, field_type => sublist)', '', '2020-04-01 10:51:15'),
(449, 1, 'update', 'CFG Fields(2834, field_index => table_parent_id)', '', '2020-04-01 10:51:15'),
(450, 1, 'update', 'CFG Fields(2834, field_name => table_parent_id)', '', '2020-04-01 10:51:15'),
(451, 1, 'update', 'CFG Fields(2834, list_width => )', '', '2020-04-01 10:51:15'),
(452, 1, 'update', 'CFG Fields(2834, field_options => )', '', '2020-04-01 10:51:15'),
(453, 1, 'update', 'CFG Fields(2834, field_type => text)', '', '2020-04-01 10:51:15'),
(454, 1, 'update', 'CFG Fields(2867, field_index => status)', '', '2020-04-01 10:51:15'),
(455, 1, 'update', 'CFG Fields(2867, field_name => Status)', '', '2020-04-01 10:51:15'),
(456, 1, 'update', 'CFG Fields(2867, list_width => 60px)', '', '2020-04-01 10:51:15'),
(457, 1, 'update', 'CFG Fields(2867, field_options => )', '', '2020-04-01 10:51:15'),
(458, 1, 'update', 'CFG Fields(2867, field_type => onoff)', '', '2020-04-01 10:51:15'),
(459, 1, 'duplicate', 'CFG admin(310)', '', '2020-04-01 10:51:40'),
(460, 1, 'duplicate', 'CFG Fields(3833)', '', '2020-04-04 12:11:46'),
(461, 1, 'duplicate', 'CFG Fields(3834)', '', '2020-04-04 12:14:15'),
(462, 1, 'duplicate', 'CFG Fields(3835)', '', '2020-04-04 12:14:54'),
(463, 1, 'order', 'CFG Fields(71, 70)', '', '2020-04-04 12:15:14'),
(464, 1, 'order', 'CFG Fields(71, 70)', '', '2020-04-04 12:15:21'),
(465, 1, 'modify', 'CFG Fields(3835)', '', '2020-04-04 12:15:52'),
(466, 1, 'modify', 'CFG Fields(3835)', '', '2020-04-04 12:16:20'),
(467, 1, 'modify', 'CFG Fields(3835)', '', '2020-04-04 12:16:41'),
(468, 1, 'modify', 'CFG Fields(3050)', '', '2020-04-04 12:23:48'),
(469, 1, 'modify', 'CFG Fields(3835)', '', '2020-04-04 17:31:55'),
(470, 1, 'update', 'CFG Fields(3830, field_index => inlinelist_field_type)', '', '2020-04-04 17:32:47'),
(471, 1, 'update', 'CFG Fields(3830, field_name => field_type)', '', '2020-04-04 17:32:47'),
(472, 1, 'update', 'CFG Fields(3830, list_width => )', '', '2020-04-04 17:32:47'),
(473, 1, 'update', 'CFG Fields(3830, field_options => )', '', '2020-04-04 17:32:47'),
(474, 1, 'update', 'CFG Fields(3830, field_type => select)', '', '2020-04-04 17:32:47'),
(475, 1, 'update', 'CFG Fields(3831, field_index => inlinelist_related)', '', '2020-04-04 17:32:47'),
(476, 1, 'update', 'CFG Fields(3831, field_name => inlinelist_related)', '', '2020-04-04 17:32:47'),
(477, 1, 'update', 'CFG Fields(3831, list_width => )', '', '2020-04-04 17:32:47'),
(478, 1, 'update', 'CFG Fields(3831, field_options => )', '', '2020-04-04 17:32:47'),
(479, 1, 'update', 'CFG Fields(3831, field_type => related)', '', '2020-04-04 17:32:47'),
(480, 1, 'modify', 'CFG Fields(3835)', '', '2020-04-04 17:33:15'),
(481, 1, 'modify', 'CFG Fields(3835)', '', '2020-04-04 20:08:24'),
(482, 1, 'modify', 'CFG Fields(3835)', '', '2020-04-04 20:08:53'),
(483, 1, 'modify', 'CFG Fields(3835)', '', '2020-04-05 09:18:39'),
(484, 1, 'login', '', '', '2020-06-01 12:04:39'),
(485, 1, 'logout', '', '', '2020-06-01 12:04:43'),
(486, 1, 'login', '', '', '2020-06-01 12:05:13'),
(487, 1, 'logout', '', '', '2020-06-01 13:29:10'),
(488, 1, 'login', '', '', '2020-07-11 14:05:41'),
(489, 1, 'logout', '', '', '2020-07-11 14:06:02');

-- --------------------------------------------------------

--
-- 資料表結構 `master_admin_group`
--

CREATE TABLE `master_admin_group` (
  `admin_group_id` int(11) NOT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `name_tc` varchar(255) NOT NULL DEFAULT '',
  `name_sc` varchar(255) NOT NULL DEFAULT '',
  `permission` text DEFAULT NULL,
  `ord` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `master_admin_group`
--

INSERT INTO `master_admin_group` (`admin_group_id`, `name_en`, `name_tc`, `name_sc`, `permission`, `ord`, `status`, `date_added`, `date_modified`) VALUES
(6, NULL, 'Administrator', '', '501,503,504,502,505,507,509,510,508,511,273,158,125,124,428,126,524,526,527,525,528,530,532,533,531,534,513,515,516,514,517,537,536,519,521,522,520,551,553,555,554,552,545,547,549,548,546,557,559,561,560,558,539,541,543,542,540,394,97,98,427,565,564,563,566,440,349,351,352,350,442', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `master_admin_permission`
--

CREATE TABLE `master_admin_permission` (
  `admin_permission_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `name_en` varchar(50) NOT NULL,
  `name_tc` varchar(50) NOT NULL DEFAULT '',
  `name_sc` varchar(50) NOT NULL DEFAULT '',
  `permission_index` varchar(50) DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  `status` int(1) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `master_admin_permission`
--

INSERT INTO `master_admin_permission` (`admin_permission_id`, `parent_id`, `name_en`, `name_tc`, `name_sc`, `permission_index`, `sort_order`, `status`) VALUES
(96, 0, 'SETTING', 'SETTING', 'SETTING', 'setting', 35, 1),
(97, 96, 'allow_list', 'allow_list', 'allow_list', 'allow_list', 1, 1),
(98, 96, 'allow_modify', 'allow_modify', 'allow_modify', 'allow_modify', 2, 1),
(123, 0, 'Email Template', 'Email Template', 'Email Template', 'email_template', 45, 1),
(124, 123, 'allow_modify', 'allow_modify', 'allow_modify', 'allow_modify', 1, 1),
(125, 123, 'allow_list', 'allow_list', 'allow_list', 'allow_list', 2, 1),
(126, 123, 'support_language', 'support_language', 'support_language', 'support_language', 3, 1),
(130, 0, 'admin_zmenu', 'admin_zmenu', 'admin_zmenu', 'admin_zmenu', 49, 1),
(131, 130, 'allow_create', 'allow_create', 'allow_create', 'allow_create', 1, 1),
(132, 130, 'allow_modify', 'allow_modify', 'allow_modify', 'allow_modify', 2, 1),
(133, 130, 'allow_delete', 'allow_delete', 'allow_delete', 'allow_delete', 3, 1),
(134, 130, 'sublist_shortcut', 'sublist_shortcut', 'sublist_shortcut', 'sublist_shortcut', 4, 1),
(135, 0, 'admin_zmenu/Sub Menu', 'admin_zmenu/Sub Menu', 'admin_zmenu/Sub Menu', 'admin_zmenu_sub', 51, 1),
(136, 135, 'allow_create', 'allow_create', 'allow_create', 'allow_create', 1, 1),
(137, 135, 'allow_modify', 'allow_modify', 'allow_modify', 'allow_modify', 2, 1),
(138, 135, 'allow_delete', 'allow_delete', 'allow_delete', 'allow_delete', 3, 1),
(139, 135, 'sublist_shortcut', 'sublist_shortcut', 'sublist_shortcut', 'sublist_shortcut', 4, 1),
(140, 0, 'admin_zconfigtable', 'admin_zconfigtable', 'admin_zconfigtable', 'admin_zconfigtable', 53, 1),
(141, 140, 'allow_create', 'allow_create', 'allow_create', 'allow_create', 1, 1),
(142, 140, 'allow_modify', 'allow_modify', 'allow_modify', 'allow_modify', 2, 1),
(143, 140, 'allow_delete', 'allow_delete', 'allow_delete', 'allow_delete', 3, 1),
(144, 140, 'allow_duplicate', 'allow_duplicate', 'allow_duplicate', 'allow_duplicate', 4, 1),
(145, 140, 'sublist_shortcut', 'sublist_shortcut', 'sublist_shortcut', 'sublist_shortcut', 5, 1),
(146, 0, 'admin_zconfigtable/CFG Fields', 'admin_zconfigtable/CFG Fields', 'admin_zconfigtable/CFG Fields', 'admin_zconfigtable_fields', 55, 1),
(147, 146, 'allow_create', 'allow_create', 'allow_create', 'allow_create', 1, 1),
(148, 146, 'allow_modify', 'allow_modify', 'allow_modify', 'allow_modify', 2, 1),
(149, 146, 'allow_delete', 'allow_delete', 'allow_delete', 'allow_delete', 3, 1),
(150, 146, 'allow_duplicate', 'allow_duplicate', 'allow_duplicate', 'allow_duplicate', 4, 1),
(151, 0, 'Admin', 'Admin', 'Admin', 'admin', 57, 1),
(152, 151, 'allow_list', 'allow_list', 'allow_list', 'allow_list', 1, 1),
(153, 151, 'allow_create', 'allow_create', 'allow_create', 'allow_create', 2, 1),
(154, 151, 'allow_delete', 'allow_delete', 'allow_delete', 'allow_delete', 3, 1),
(155, 151, 'allow_details', 'allow_details', 'allow_details', 'allow_details', 4, 1),
(156, 151, 'allow_modify', 'allow_modify', 'allow_modify', 'allow_modify', 5, 1),
(157, 0, 'UPDATE PASSWORD', 'UPDATE PASSWORD', 'UPDATE PASSWORD', 'change_password', 59, 1),
(158, 157, 'allow_modify', 'allow_modify', 'allow_modify', 'allow_modify', 1, 1),
(159, 0, 'Admin Group', 'Admin Group', 'Admin Group', 'admin_group', 61, 1),
(160, 159, 'allow_list', 'allow_list', 'allow_list', 'allow_list', 1, 1),
(161, 159, 'allow_create', 'allow_create', 'allow_create', 'allow_create', 2, 1),
(162, 159, 'allow_delete', 'allow_delete', 'allow_delete', 'allow_delete', 3, 1),
(163, 159, 'allow_details', 'allow_details', 'allow_details', 'allow_details', 4, 1),
(164, 159, 'allow_modify', 'allow_modify', 'allow_modify', 'allow_modify', 5, 1),
(165, 0, 'Admin Text', 'Admin Text', 'Admin Text', 'admin_text_config', 63, 1),
(166, 165, 'allow_list', 'allow_list', 'allow_list', 'allow_list', 1, 1),
(167, 165, 'allow_modify', 'allow_modify', 'allow_modify', 'allow_modify', 2, 1),
(168, 165, 'allow_create', 'allow_create', 'allow_create', 'allow_create', 3, 1),
(169, 165, 'support_language', 'support_language', 'support_language', 'support_language', 4, 1),
(170, 0, 'admin_permission_section', 'admin_permission_section', 'admin_permission_section', 'admin_permission_section', 65, 1),
(171, 170, 'allow_list', 'allow_list', 'allow_list', 'allow_list', 1, 1),
(172, 170, 'allow_create', 'allow_create', 'allow_create', 'allow_create', 2, 1),
(173, 170, 'allow_delete', 'allow_delete', 'allow_delete', 'allow_delete', 3, 1),
(174, 170, 'allow_modify', 'allow_modify', 'allow_modify', 'allow_modify', 4, 1),
(175, 0, 'admin_permission/action', 'admin_permission/action', 'admin_permission/action', 'admin_permission', 67, 1),
(176, 175, 'allow_create', 'allow_create', 'allow_create', 'allow_create', 1, 1),
(177, 175, 'allow_modify', 'allow_modify', 'allow_modify', 'allow_modify', 2, 1),
(178, 175, 'allow_delete', 'allow_delete', 'allow_delete', 'allow_delete', 3, 1),
(179, 175, 'allow_list', 'allow_list', 'allow_list', 'allow_list', 4, 1),
(180, 0, 'Admin Activity', 'Admin Activity', 'Admin Activity', 'admin_activity', 69, 1),
(181, 180, 'allow_list', 'allow_list', 'allow_list', 'allow_list', 1, 1),
(265, 0, 'admin_zconfigtable_admin', 'admin_zconfigtable_admin', 'admin_zconfigtable_admin', 'admin_zconfigtable_admin', 115, 1),
(266, 265, 'allow_create', 'allow_create', 'allow_create', 'allow_create', 1, 1),
(267, 265, 'allow_modify', 'allow_modify', 'allow_modify', 'allow_modify', 2, 1),
(268, 265, 'allow_delete', 'allow_delete', 'allow_delete', 'allow_delete', 3, 1),
(269, 265, 'allow_duplicate', 'allow_duplicate', 'allow_duplicate', 'allow_duplicate', 4, 1),
(270, 265, 'sublist_shortcut', 'sublist_shortcut', 'sublist_shortcut', 'sublist_shortcut', 5, 1),
(271, 0, '', '', '', '', 117, 1),
(273, 157, 'allow_list', 'allow_list', 'allow_list', 'allow_list', 2, 1),
(274, 146, 'submit_backlist', 'submit_backlist', 'submit_backlist', 'submit_backlist', 5, 1),
(275, 0, 'CFG', 'CFG', 'CFG', 'admin_zconfigtable_template', 118, 1),
(276, 275, 'allow_create', 'allow_create', 'allow_create', 'allow_create', 1, 1),
(277, 275, 'allow_modify', 'allow_modify', 'allow_modify', 'allow_modify', 2, 1),
(278, 275, 'allow_delete', 'allow_delete', 'allow_delete', 'allow_delete', 3, 1),
(279, 275, 'allow_list', 'allow_list', 'allow_list', 'allow_list', 4, 1),
(280, 275, 'allow_duplicate', 'allow_duplicate', 'allow_duplicate', 'allow_duplicate', 5, 1),
(338, 0, 'option', 'option', 'option', 'setting_option', 142, 1),
(339, 338, 'allow_create', 'allow_create', 'allow_create', 'allow_create', 1, 1),
(340, 338, 'allow_modify', 'allow_modify', 'allow_modify', 'allow_modify', 2, 1),
(341, 338, 'allow_delete', 'allow_delete', 'allow_delete', 'allow_delete', 3, 1),
(342, 338, 'allow_list', 'allow_list', 'allow_list', 'allow_list', 4, 1),
(394, 96, 'allow_duplicate', 'allow_duplicate', 'allow_duplicate', 'allow_duplicate', 3, 1),
(421, 0, 'admin_zconfigtable_inlinelist', 'admin_zconfigtable_inlinelist', 'admin_zconfigtable_inlinelist', 'admin_zconfigtable_inlinelist', 166, 1),
(422, 421, 'allow_create', 'allow_create', 'allow_create', 'allow_create', 1, 1),
(423, 421, 'allow_modify', 'allow_modify', 'allow_modify', 'allow_modify', 2, 1),
(424, 421, 'allow_delete', 'allow_delete', 'allow_delete', 'allow_delete', 3, 1),
(425, 421, 'allow_list', 'allow_list', 'allow_list', 'allow_list', 4, 1),
(426, 421, 'submit_backlist', 'submit_backlist', 'submit_backlist', 'submit_backlist', 5, 1),
(427, 96, 'submit_backlist', 'submit_backlist', 'submit_backlist', 'submit_backlist', 4, 1),
(428, 123, 'submit_backlist', 'submit_backlist', 'submit_backlist', 'submit_backlist', 4, 1),
(440, 338, 'submit_backlist', 'submit_backlist', 'submit_backlist', 'submit_backlist', 5, 1),
(484, 123, 'allow_create', 'allow_create', 'allow_create', 'allow_create', 5, 1),
(567, 0, 'SETTING', 'SETTING', 'SETTING', 'setting_import', 167, 1),
(568, 567, 'allow_modify', 'allow_modify', 'allow_modify', 'allow_modify', 1, 1),
(569, 567, 'allow_list', 'allow_list', 'allow_list', 'allow_list', 2, 1),
(570, 567, 'allow_duplicate', 'allow_duplicate', 'allow_duplicate', 'allow_duplicate', 3, 1),
(571, 567, 'submit_backlist', 'submit_backlist', 'submit_backlist', 'submit_backlist', 4, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `master_admin_text_config`
--

CREATE TABLE `master_admin_text_config` (
  `text_config_id` int(11) NOT NULL,
  `text_index` varchar(250) NOT NULL,
  `text_en` text NOT NULL,
  `text_tc` text NOT NULL,
  `text_sc` text NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `master_admin_text_config`
--

INSERT INTO `master_admin_text_config` (`text_config_id`, `text_index`, `text_en`, `text_tc`, `text_sc`, `date_added`, `date_modified`) VALUES
(1, 'login_admin', 'Admin', '系統管理', '網頁管理', NULL, NULL),
(2, 'login_login', 'Sign In', '登入', '登入', NULL, NULL),
(3, 'login_username', 'Username', '登入名稱', '登入名稱', NULL, NULL),
(4, 'login_password', 'Password', '密碼', '密碼', NULL, NULL),
(5, 'login_message', 'Sign in to start your session', '', '', NULL, NULL),
(6, 'login_logout', 'Logout', '登出', '登出', NULL, NULL),
(7, 'login_forget_password', 'Lost your password?', '忘記密碼', '忘記密碼', NULL, NULL),
(8, 'change_password', 'Change Password', '更改密碼', '更改密碼', NULL, NULL),
(9, 'list_control', 'Control', '控制選項', '控制選項', NULL, NULL),
(10, 'list_modify', 'Modify', '修改', '修改', NULL, NULL),
(11, 'list_delete', 'Delete', '刪除', '刪除', NULL, NULL),
(12, 'list_details', 'Details', '詳細資料', '詳細資料', NULL, NULL),
(13, 'list_create', 'Create', '新增', '新增', NULL, NULL),
(14, 'list_order', 'Order', '排序', '排序', NULL, NULL),
(15, 'list_preview', 'Preview', '預覽', '預覽', NULL, NULL),
(16, 'list_create_sub', 'Create Sub', '新增下層', '新增下層', NULL, NULL),
(17, 'list_create_top', 'Create Top', '新增上層', '新增上層', NULL, NULL),
(18, 'list_onoff_on', 'yes', '啟用', '啟用', NULL, NULL),
(19, 'list_onoff_off', 'no', '停用', '停用', NULL, NULL),
(20, 'list_show', 'Showing txt_from to txt_toind of txt_total entries', 'Showing txt_from to txt_toind of txt_total entries', 'Showing txt_from to txt_toind of txt_total entries', NULL, NULL),
(21, 'list_del_selected', 'Delete selected', '刪除已選取', '删除已选取', NULL, NULL),
(22, 'list_del_no_record_selected', 'no record selected', '請先選擇', 'no record selected', NULL, NULL),
(23, 'list_search', 'Search', 'Search', 'Search', NULL, NULL),
(24, 'unit_invalid', 'Unit invalid', '單位不正確', '单位不正确', NULL, NULL),
(25, 'no_unit_need_book', 'No unit need booking', '沒有單位需要預約', '没有单位需要预约', NULL, NULL),
(26, 'date_invalid', 'Invalid date', '日期不正確', '日期不正确', NULL, NULL),
(27, 'btn_back', 'Back', '返回', '返回', NULL, NULL),
(28, 'btn_list', 'List', '列表', '列表', NULL, NULL),
(29, 'con_back', 'Back', '返回', '返回', NULL, NULL),
(30, 'con_submit', 'Submit', '提交', '提交', NULL, NULL),
(31, 'msg_suc', 'success', '成功', '成功', NULL, NULL),
(32, 'msg_cre', 'Create', '新增', '新增', NULL, NULL),
(33, 'msg_upd', 'Update', '修改', '修改', NULL, NULL),
(34, 'msg_exists', 'exists', '已存在', '已存在', NULL, NULL),
(35, 'msg_notmatch', 'not match', '不一樣', '不一樣', NULL, NULL),
(36, 'msg_invaild_email', 'invalid email address', 'invalid email address', 'invalid email address', NULL, NULL),
(37, 'con_newtag', 'new tag', '請輸入＃tag名稱', '請輸入＃tag名稱', NULL, NULL),
(38, 'msg_missing_field', 'This field is required.', 'This field is required.', 'This field is required.', NULL, NULL),
(39, 'msg_sent', 'sent success', '', '', NULL, NULL),
(40, 'menu_admintext', 'TEXT Setting', '', '', NULL, NULL),
(41, 'btn_test_template', 'Test template', '測試電郵', '測試電郵', NULL, NULL),
(42, 'not_available', 'Products marked with *** are not available in the desired quantity or not in stock!', '', 'Products marked with *** are not available in the desired quantity or not in stock!', NULL, NULL),
(43, 'list_update', 'Update List', '更新列表', '更新列表', NULL, NULL),
(44, 'list_duplicate', 'duplicate', '複制', '复制', NULL, NULL),
(45, 'list_export', 'Export', '匯出', '汇出', NULL, NULL),
(46, 'upload_image', 'upload images', '上傳圖片', '上传图片', NULL, NULL),
(47, 'list_keyword', 'Search keyword', '搜索關鍵字', '搜索关键字', NULL, NULL),
(48, 'filter_all', 'ALL', '全部', '全部', NULL, NULL),
(49, 'list_clear', 'Clear', '清除', '清除', NULL, NULL),
(50, 'list_filter', 'Flter', '過濾', '过滤', NULL, NULL),
(51, 'btn_download', 'Download', '下載', '下载', NULL, NULL),
(52, 'list_insert', 'Inert', '揷入', '揷入', '2018-04-19 22:10:26', NULL),
(53, 'btn_build_tableconfig', 'Build CFG', 'Build CFG', 'Build CFG', '2019-02-07 16:08:12', NULL),
(54, 'old_password', 'Old Password', 'Old Password', 'Old Password', '2019-10-08 14:07:59', '2019-10-08 14:08:09'),
(55, 'new_password', 'New Password', 'New Password', 'New Password', '2019-10-08 14:08:35', NULL),
(56, 'field_confirm_password', 'Re Enter Password', 'Re Enter Password', 'Re Enter Password', '2019-10-08 14:09:34', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `master_admin_zconfigtable`
--

CREATE TABLE `master_admin_zconfigtable` (
  `admin_zconfigtable_id` int(11) NOT NULL,
  `related_id` int(11) DEFAULT NULL,
  `configtable_parent` int(11) NOT NULL DEFAULT 0,
  `config_type` tinyint(1) DEFAULT 1,
  `table_index` varchar(255) DEFAULT NULL,
  `table_title` varchar(255) DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `table_primarykey` varchar(255) DEFAULT NULL,
  `table_order_field` varchar(255) DEFAULT NULL,
  `table_order_default_direction` varchar(255) DEFAULT NULL,
  `table_order_type` varchar(255) DEFAULT NULL,
  `listwidth_class` varchar(255) DEFAULT NULL,
  `contentwidth_class` varchar(255) DEFAULT NULL,
  `table_option` text DEFAULT NULL,
  `parent_table` varchar(255) DEFAULT NULL,
  `parent_related_key` varchar(255) DEFAULT NULL,
  `parent_show_title` varchar(255) DEFAULT NULL,
  `perpage_nums` varchar(255) DEFAULT NULL,
  `table_create_field` varchar(255) DEFAULT NULL,
  `table_modify_field` varchar(255) DEFAULT NULL,
  `table_create_admin` varchar(255) DEFAULT NULL,
  `table_modified_admin` varchar(255) DEFAULT NULL,
  `list_filter` text DEFAULT NULL,
  `search_field` text DEFAULT NULL,
  `export_field` text DEFAULT NULL,
  `list_update` text DEFAULT NULL,
  `default_filter` text DEFAULT NULL,
  `table_type` varchar(255) DEFAULT NULL,
  `extra_urlpar` varchar(255) DEFAULT NULL,
  `list_url` varchar(255) DEFAULT NULL,
  `preview_url` varchar(255) DEFAULT NULL,
  `modify_url` varchar(255) DEFAULT NULL,
  `create_url` varchar(255) DEFAULT NULL,
  `duplicate_url` varchar(255) DEFAULT NULL,
  `table_key` varchar(255) DEFAULT NULL,
  `table_value` varchar(255) DEFAULT NULL,
  `cnt_btns` text DEFAULT NULL,
  `image_field` varchar(255) DEFAULT NULL,
  `table_parent_id` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `language` text DEFAULT NULL COMMENT 'support language'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `master_admin_zconfigtable`
--

INSERT INTO `master_admin_zconfigtable` (`admin_zconfigtable_id`, `related_id`, `configtable_parent`, `config_type`, `table_index`, `table_title`, `table_name`, `table_primarykey`, `table_order_field`, `table_order_default_direction`, `table_order_type`, `listwidth_class`, `contentwidth_class`, `table_option`, `parent_table`, `parent_related_key`, `parent_show_title`, `perpage_nums`, `table_create_field`, `table_modify_field`, `table_create_admin`, `table_modified_admin`, `list_filter`, `search_field`, `export_field`, `list_update`, `default_filter`, `table_type`, `extra_urlpar`, `list_url`, `preview_url`, `modify_url`, `create_url`, `duplicate_url`, `table_key`, `table_value`, `cnt_btns`, `image_field`, `table_parent_id`, `status`, `date_added`, `date_modified`, `language`) VALUES
(22, NULL, 0, 1, 'setting', 'SETTING', 'setting', 'setting_id', '', '', '', 'col-md-12', NULL, 'allow_modify,allow_list,allow_duplicate,submit_backlist', '', 'setting_type', '', '30', 'date_added', 'date_modified', 'admin_added', 'admin_modified', '', '', '', '', '', 'setting', '&setting_type=0', 'com_list.php', '', 'com_content.php', 'com_content.php', '', 'key', 'value', '', '', '', 1, '2017-02-10 16:21:31', '2019-12-26 12:52:43', NULL),
(29, NULL, 0, 1, 'email_template', 'Email Template', 'email_template', 'email_template_id', 'email_template_id', 'ASC', 'text', 'col-md-12', 'col-md-12', 'allow_modify,allow_list,submit_backlist,support_language', '', '', '', '30', 'date_added', 'date_modified', 'admin_added', 'admin_modified', '', '', '', '', 'a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}', '', '', 'com_list.php', '', 'email_template.php', 'email_template.php', '', '', '', 'btn_test_template', '', '', 1, '2017-02-10 16:21:31', '2019-11-01 12:33:14', NULL),
(31, NULL, 0, 0, 'admin_zmenu', 'Main Menu', 'admin_zmenu', 'admin_zmenu_id', 'sort_order', 'ASC', 'order', 'col-md-12', NULL, 'allow_create,allow_modify,allow_delete,sublist_shortcut', '', 'parent_id', '', '30', 'date_added', 'date_modified', NULL, NULL, '', '', '', '206,207,208,211', 'a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}', '', '&parent_id=0', '', '', '', '', '', '', '', '', '', '', 1, '2017-02-10 16:21:31', '2018-01-27 20:54:00', NULL),
(32, NULL, 0, 0, 'admin_zmenu_sub', 'Sub Menu', 'admin_zmenu', 'admin_zmenu_id', 'sort_order', 'ASC', 'order', 'col-md-12', NULL, 'allow_create,allow_modify,allow_delete,sublist_shortcut', 'admin_zmenu', 'parent_id', 'name_tc', '30', 'date_added', 'date_modified', NULL, NULL, '', '', '', '213,214,215,217', 'a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}', '', '', '', '', '', '', '', '', '', '', '', '', 1, '2017-02-10 16:21:31', '2018-01-27 20:57:33', NULL),
(33, NULL, 0, 0, 'admin_zconfigtable', 'CFG', 'admin_zconfigtable', 'admin_zconfigtable_id', 'table_index', 'ASC', 'text', 'col-md-12', NULL, 'allow_create,allow_modify,allow_delete,allow_duplicate,sublist_shortcut', '', 'config_type', '', '60', 'date_added', 'date_modified', NULL, NULL, '', '', '', '230,240', 'a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}', 'sublist', '&config_type=1', '', '', '', '', '', '', '', 'create_db', '', '', 1, '2017-02-10 16:21:31', '2019-07-24 08:26:09', NULL),
(34, NULL, 0, 0, 'admin_zconfigtable_fields', 'CFG Fields', 'admin_zconfigtable_fields', 'admin_zconfigtable_fields_id', 'sort_order,list_order', 'ASC', 'order', 'col-md-12', NULL, 'allow_create,allow_modify,allow_delete,allow_duplicate,submit_backlist', 'admin_zconfigtable', 'admin_zconfigtable_id', 'table_title', '200', 'date_added', 'date_modified', NULL, NULL, '', '', '', '252,253,254,255,258', 'a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}', '', '', '', '', '', '', '', '', '', '', '', '', 1, '2017-02-10 16:21:31', '2019-07-24 09:32:11', NULL),
(35, NULL, 0, 0, 'admin', 'Admin', 'admin', 'admin_id', 'admin_id', NULL, NULL, 'col-md-12', NULL, 'allow_list,allow_create,allow_delete,allow_details,allow_modify', NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, 1, '2017-02-10 16:21:31', NULL, NULL),
(36, NULL, 0, 0, 'change_password', 'Update Password', 'admin', 'admin_id', 'admin_id', 'ASC', 'int', 'col-md-12', NULL, 'allow_modify,allow_list', '', '', '', '30', 'date_added', 'date_modified', NULL, NULL, '', '', '', '', '', 'change_password', '', '', '', '', '', '', '', '', '', '', '', 1, '2017-02-10 16:21:31', '2018-03-17 17:11:26', NULL),
(37, NULL, 0, 0, 'admin_group', 'Admin Group', 'admin_group', 'admin_group_id', 'ord', 'ASC', 'order', 'col-md-12', NULL, 'allow_list,allow_create,allow_delete,allow_details,allow_modify', NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, 1, '2017-02-10 16:21:31', NULL, NULL),
(38, NULL, 0, 0, 'admin_text_config', 'Admin Text', 'admin_text_config', 'text_config_id', 'text_config_id', 'ASC', 'text', 'col-md-12', NULL, 'allow_create,allow_modify,allow_list,support_language', '', '', '', '50', 'date_added', 'date_modified', NULL, NULL, '', '', '', '296,297,298', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, '2017-02-10 16:21:31', '2018-02-19 15:28:22', NULL),
(39, NULL, 0, 0, 'admin_permission_section', 'Permission', 'admin_permission', 'admin_permission_id', 'permission_index', 'ASC', 'text', 'col-md-12', NULL, 'allow_list,allow_create,allow_delete,allow_modify', NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, 1, '2017-02-10 16:21:31', NULL, NULL),
(40, NULL, 0, 0, 'admin_permission', 'action', 'admin_permission', 'admin_permission_id', 'permission_index', 'ASC', 'text', 'col-md-12', NULL, 'allow_create,allow_modify,allow_delete,allow_list', 'admin_permission_section', 'parent_id', 'name_en', '30', 'date_added', 'date_modified', NULL, NULL, '', '', '', '', '', 'sublist', '', '', '', '', '', '', '', '', '', '', '', 1, '2017-02-10 16:21:31', '2017-04-13 16:23:58', NULL),
(41, NULL, 0, 0, 'admin_activity', 'Admin Activity', 'admin_activity', 'admin_activity_id', 'date_added', 'DESC', 'date', 'col-md-12', NULL, 'allow_list', NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'list', NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, 1, '2017-02-10 16:21:31', NULL, NULL),
(107, NULL, 0, 0, 'admin_zconfigtable_admin', 'CFG admin', 'admin_zconfigtable', 'admin_zconfigtable_id', 'table_index', 'ASC', 'text', 'col-md-12', NULL, 'allow_create,allow_modify,allow_delete,allow_duplicate,sublist_shortcut', '', 'config_type', '', '60', 'date_added', 'date_modified', NULL, NULL, '', '', '', '', 'a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}', 'sublist', '&config_type=0', '', '', '', '', '', '', '', 'create_db', '', '', 1, '2018-01-27 21:04:45', '2019-07-24 08:24:34', NULL),
(111, NULL, 0, 0, 'admin_zconfigtable_template', 'CFG', 'admin_zconfigtable_template', 'admin_zconfigtable_id', 'table_index', 'ASC', 'text', 'col-md-12', NULL, 'allow_create,allow_modify,allow_delete,allow_list,allow_duplicate', '', '', '', '60', 'date_added', 'date_modified', NULL, NULL, '', '', '', '2972,2994', 'a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}', '', '', '', '', 'admin_zconfigtable_template.php', 'admin_zconfigtable_template.php', 'admin_zconfigtable_template.php', '', '', 'btn_build_tableconfig', '', '', 1, '2019-02-07 09:54:34', '2020-01-10 11:08:36', NULL),
(129, NULL, 0, 1, 'setting_option', 'option', 'setting_option', 'setting_option_id', 'sort_order', 'ASC', 'order', 'col-md-6', NULL, 'allow_create,allow_modify,allow_delete,allow_list,submit_backlist', '', '', '', '30', 'date_added', 'date_modified', 'admin_added', 'admin_modified', '', '', '', '', '', '', '', 'com_list.php', '', 'com_content.php', 'com_content.php', '', '', '', '', '', '', 1, '2019-07-24 08:23:07', '2019-11-10 14:53:33', ''),
(143, NULL, 0, 0, 'admin_zconfigtable_inlinelist', 'admin_zconfigtable_inlinelist', 'admin_zconfigtable_inlinelist', 'admin_zconfigtable_inlinelist_id', 'sort_order', 'ASC', 'order', '', NULL, 'allow_create,allow_modify,allow_delete,allow_list,submit_backlist', '', '', '', '30', 'date_added', 'date_modified', 'date_modified', 'date_modified', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, '2019-10-21 11:12:12', '2019-10-21 11:13:07', NULL),
(171, NULL, 0, 1, 'setting_import', 'SETTING', 'setting', 'setting_id', '', '', '', 'col-md-12', NULL, 'allow_modify,allow_list,allow_duplicate,submit_backlist', '', 'setting_type', '', '30', 'date_added', 'date_modified', 'admin_added', 'admin_modified', '', '', '', '', '', 'setting', '&setting_type=0', 'conver_sql2tableCfg.php', '', 'conver_sql2tableCfg.php', 'conver_sql2tableCfg.php', '', 'key', 'value', '', '', '', 1, '2020-01-25 14:22:01', '2020-01-25 14:24:14', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `master_admin_zconfigtable_fields`
--

CREATE TABLE `master_admin_zconfigtable_fields` (
  `admin_zconfigtable_fields_id` int(11) NOT NULL,
  `admin_zconfigtable_id` int(11) NOT NULL,
  `field_index` varchar(255) DEFAULT NULL,
  `field_name` varchar(600) DEFAULT NULL,
  `field_type` varchar(255) DEFAULT NULL,
  `field_default` varchar(255) DEFAULT NULL,
  `field_options` text DEFAULT NULL,
  `field_remark` varchar(500) DEFAULT NULL,
  `list_width` varchar(255) DEFAULT NULL,
  `extra_opt` text DEFAULT NULL,
  `serialize_opt` text DEFAULT NULL,
  `reserved_index` text DEFAULT NULL,
  `length_limit` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `list_order` int(11) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `master_admin_zconfigtable_fields`
--

INSERT INTO `master_admin_zconfigtable_fields` (`admin_zconfigtable_fields_id`, `admin_zconfigtable_id`, `field_index`, `field_name`, `field_type`, `field_default`, `field_options`, `field_remark`, `list_width`, `extra_opt`, `serialize_opt`, `reserved_index`, `length_limit`, `sort_order`, `list_order`, `date_added`, `date_modified`) VALUES
(442, 33, 'table_parent_id', 'table_parent_id', 'text', '', 'modify,create', '', '', '', NULL, NULL, NULL, 41, 41, '2017-03-01 00:05:42', NULL),
(3439, 22, 'from_email_address', 'From Email', 'text', '', 'modify,create', '', '', '', '', '', NULL, 1, 1, '2019-10-22 17:42:44', NULL),
(2790, 29, 'subject', 'Subject', 'text', '', 'list,modify,details,create', '', '', '', '', NULL, NULL, 2, 2, '2018-01-04 20:04:01', NULL),
(196, 29, 'email_type', 'Type', 'text', '', 'list,details,modify_show,create,require,unique', '', '300px', 'a:1:{i:0;a:1:{i:0;s:0:\"\";}}', '', '', NULL, 1, 1, '2017-02-10 16:21:31', '2019-11-01 12:34:04'),
(198, 29, 'message', 'html', 'editor', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 3, 3, '2017-02-10 16:21:31', NULL),
(199, 29, 'replace_tag', 'replace code', 'text', NULL, 'details,modify_show,create', '', '', 'a:0:{}', NULL, NULL, NULL, 4, 4, '2017-02-10 16:21:31', NULL),
(200, 29, 'test_email', 'test email', 'text', NULL, 'modify,details,create,skipsql', '', '', 'a:0:{}', NULL, NULL, NULL, 5, 5, '2017-02-10 16:21:31', NULL),
(205, 31, 'admin_zconfigtable_id', 'table_index', 'related', '', 'list,modify,details,create,sorting', '', '150px', 'a:1:{i:0;a:5:{i:0;s:18:\"admin_zconfigtable\";i:1;s:23:\"table_index,table_title\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";}}', '', '', NULL, 1, 1, '2017-02-10 16:21:31', '2018-07-14 12:23:30'),
(206, 31, 'name_en', 'Name EN', 'text', NULL, 'list,create,modify,details', '', '150px', 'a:0:{}', NULL, NULL, NULL, 2, 2, '2017-02-10 16:21:31', NULL),
(207, 31, 'name_tc', 'Name TC', 'text', '', 'list,modify,details,create', '', '', '', NULL, NULL, NULL, 3, 3, '2017-02-10 16:21:31', '2017-03-02 09:07:13'),
(208, 31, 'name_sc', 'Name SC', 'text', '', 'list,modify,details,create', '', '', '', NULL, NULL, NULL, 4, 4, '2017-02-10 16:21:31', '2017-03-02 09:07:17'),
(209, 31, 'sort_order', 'order', 'text', NULL, 'list,sorting', '', '100px', 'a:0:{}', NULL, NULL, NULL, 5, 5, '2017-02-10 16:21:31', NULL),
(210, 31, '', 'Sub Menu', 'sublist', '', 'list', '', '80px', 'a:1:{i:0;a:4:{i:0;s:15:\"admin_zmenu_sub\";i:1;s:9:\"parent_id\";i:2;s:14:\"admin_zmenu_id\";i:3;s:1:\"1\";}}', '', '', NULL, 6, 6, '2017-02-10 16:21:31', '2020-01-10 11:53:00'),
(211, 31, 'status', 'Status', 'onoff', NULL, 'list,create,modify,details', '', '60px', 'a:0:{}', NULL, NULL, NULL, 7, 7, '2017-02-10 16:21:31', NULL),
(212, 32, 'admin_zconfigtable_id', 'table_index', 'related', '', 'list,modify,details,create,sorting', '', '150px', 'a:1:{i:0;a:5:{i:0;s:18:\"admin_zconfigtable\";i:1;s:23:\"table_index,table_title\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";}}', '', '', NULL, 1, 1, '2017-02-10 16:21:31', '2018-07-14 12:24:14'),
(213, 32, 'name_en', 'Name EN', 'text', NULL, 'list,create,modify,details', '', '150px', 'a:0:{}', NULL, NULL, NULL, 2, 2, '2017-02-10 16:21:31', NULL),
(214, 32, 'name_tc', 'Name TC', 'text', '', 'list,modify,details,create', '', '', '', '', NULL, NULL, 3, 3, '2017-02-10 16:21:31', '2018-01-27 20:57:47'),
(215, 32, 'name_sc', 'Name SC', 'text', '', 'list,modify,details,create', '', '', '', '', NULL, NULL, 4, 4, '2017-02-10 16:21:31', '2018-01-27 20:57:50'),
(216, 32, 'sort_order', 'order', 'text', NULL, 'list,sorting', '', '100px', 'a:0:{}', NULL, NULL, NULL, 5, 5, '2017-02-10 16:21:31', NULL),
(217, 32, 'status', 'Status', 'onoff', NULL, 'list,create,modify,details', '', '60px', 'a:0:{}', NULL, NULL, NULL, 6, 6, '2017-02-10 16:21:31', NULL),
(218, 33, 'table_index', 'index', 'text', NULL, 'list,modify,details,create,sorting', '', '', 'a:0:{}', NULL, NULL, NULL, 3, 3, '2017-02-10 16:21:31', NULL),
(219, 33, 'table_name', 'table_name', 'text', NULL, 'list,modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 4, 4, '2017-02-10 16:21:31', NULL),
(220, 33, 'table_primarykey', 'table_primarykey', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 6, 6, '2017-02-10 16:21:31', NULL),
(221, 33, 'table_order_field', 'table_order_field', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 7, 7, '2017-02-10 16:21:31', NULL),
(222, 33, 'table_order_default_direction', 'default_direction', 'select', '', 'modify,details,create', '', '', 'a:2:{i:0;a:1:{i:0;s:3:\"ASC\";}i:1;a:1:{i:0;s:4:\"DESC\";}}', '', NULL, NULL, 8, 8, '2017-02-10 16:21:31', '2017-09-12 21:37:42'),
(223, 33, 'table_order_type', 'order_type', 'select', '', 'modify,details,create', '', '', 'a:5:{i:0;a:1:{i:0;s:5:\"order\";}i:1;a:1:{i:0;s:4:\"date\";}i:2;a:1:{i:0;s:4:\"time\";}i:3;a:1:{i:0;s:3:\"int\";}i:4;a:1:{i:0;s:4:\"text\";}}', '', NULL, NULL, 9, 9, '2017-02-10 16:21:31', '2017-09-12 21:38:36'),
(224, 33, 'listwidth_class', 'listwidth_class', 'select', '', 'modify,details,create', '', '', 'a:4:{i:0;a:1:{i:0;s:9:\"col-md-12\";}i:1;a:1:{i:0;s:9:\"col-md-10\";}i:2;a:1:{i:0;s:8:\"col-md-8\";}i:3;a:1:{i:0;s:8:\"col-md-6\";}}', '', NULL, NULL, 10, 10, '2017-02-10 16:21:31', '2017-09-12 21:39:14'),
(225, 33, 'perpage_nums', 'perpage_nums', 'text', '30', 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 11, 11, '2017-02-10 16:21:31', NULL),
(226, 33, 'table_create_field', 'table_create_field', 'text', 'date_added', 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 12, 12, '2017-02-10 16:21:31', NULL),
(227, 33, 'table_modify_field', 'table_modify_field', 'text', 'date_modified', 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 13, 13, '2017-02-10 16:21:31', NULL),
(228, 33, 'extra_urlpar', 'extra_urlpar', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 16, 16, '2017-02-10 16:21:31', NULL),
(229, 33, 'preview_url', 'preview_url', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 17, 17, '2017-02-10 16:21:31', NULL),
(230, 33, 'table_option', 'table_option', 'checkbox', 'allow_create,allow_modify,allow_delete,allow_list,submit_backlist', 'list,modify,details,create', '', '', 'a:15:{i:0;a:1:{i:0;s:12:\"allow_create\";}i:1;a:1:{i:0;s:12:\"allow_modify\";}i:2;a:1:{i:0;s:12:\"allow_delete\";}i:3;a:1:{i:0;s:10:\"allow_list\";}i:4;a:1:{i:0;s:13:\"allow_preview\";}i:5;a:1:{i:0;s:14:\"allow_download\";}i:6;a:1:{i:0;s:13:\"allow_publish\";}i:7;a:1:{i:0;s:12:\"allow_export\";}i:8;a:1:{i:0;s:15:\"allow_duplicate\";}i:9;a:1:{i:0;s:16:\"sublist_shortcut\";}i:10;a:1:{i:0;s:15:\"submit_backlist\";}i:11;a:1:{i:0;s:16:\"support_language\";}i:12;a:1:{i:0;s:13:\"allow_details\";}i:13;a:1:{i:0;s:17:\"allow_multiselect\";}i:14;a:1:{i:0;s:12:\"allow_select\";}}', '', '', NULL, 18, 18, '2017-02-10 16:21:31', '2019-06-19 19:01:42'),
(231, 33, 'list_filter', 'list_filter', 'related_multiple', '', 'modify,details,create', '', '', 'a:1:{i:0;a:10:{i:0;s:25:\"admin_zconfigtable_fields\";i:1;s:10:\"field_name\";i:2;s:0:\"\";i:3;s:10:\"field_type\";i:4;s:70:\"date,onoff,related,related_multiple,related_checkbox,select,radio,text\";i:5;s:0:\"\";i:6;s:0:\"\";i:7;s:1:\"1\";i:8;s:21:\"admin_zconfigtable_id\";i:9;s:0:\"\";}}', '', '', NULL, 19, 19, '2017-02-10 16:21:31', '2019-11-01 12:40:45'),
(232, 33, 'search_field', 'search field', 'related_multiple', '', 'modify,details,create', '', '', 'a:1:{i:0;a:10:{i:0;s:25:\"admin_zconfigtable_fields\";i:1;s:10:\"field_name\";i:2;s:0:\"\";i:3;s:10:\"field_type\";i:4;s:41:\"int,text,textarea,editor,related,keyindex\";i:5;s:0:\"\";i:6;s:0:\"\";i:7;s:1:\"1\";i:8;s:21:\"admin_zconfigtable_id\";i:9;s:0:\"\";}}', '', '', NULL, 20, 20, '2017-02-10 16:21:31', '2019-11-02 09:28:11'),
(233, 33, 'list_update', 'list update', 'related_multiple', '', 'modify,details,create', '', '', 'a:1:{i:0;a:10:{i:0;s:25:\"admin_zconfigtable_fields\";i:1;s:10:\"field_name\";i:2;s:0:\"\";i:3;s:10:\"field_type\";i:4;s:53:\"text,onoff,textarea,int,date,checkbox,select,keyindex\";i:5;s:0:\"\";i:6;s:0:\"\";i:7;s:1:\"1\";i:8;s:21:\"admin_zconfigtable_id\";i:9;s:0:\"\";}}', '', '', NULL, 21, 21, '2017-02-10 16:21:31', '2019-11-01 11:47:50'),
(234, 33, 'export_field', 'export field', 'related_multiple', '', 'modify,details,create', '', '', 'a:1:{i:0;a:9:{i:0;s:25:\"admin_zconfigtable_fields\";i:1;s:10:\"field_name\";i:2;s:0:\"\";i:3;s:10:\"field_type\";i:4;s:220:\"audio,checkbox,date,datetime,dollar,editor,email,file,image,int,keyindex,link,onoff,password,qrcode,radio,related,related_checkbox,related_multi,select,serialize,single_password,sublist,tabs,tag,text,textarea,token,video\";i:5;s:0:\"\";i:6;s:0:\"\";i:7;s:1:\"1\";i:8;s:21:\"admin_zconfigtable_id\";}}', '', '', NULL, 22, 22, '2017-02-10 16:21:31', '2019-07-24 13:10:05'),
(235, 33, 'parent_related_key', 'parent_related_key', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 23, 23, '2017-02-10 16:21:31', NULL),
(236, 33, 'parent_table', 'parent_table', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 24, 24, '2017-02-10 16:21:31', NULL),
(237, 33, 'parent_show_title', 'parent_show_title', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 25, 25, '2017-02-10 16:21:31', NULL),
(238, 33, 'table_type', 'table_type', 'select', '', 'list,modify,details,create', '', '', 'a:7:{i:0;a:1:{i:0;s:4:\"list\";}i:1;a:1:{i:0;s:7:\"content\";}i:2;a:1:{i:0;s:7:\"setting\";}i:3;a:1:{i:0;s:7:\"sublist\";}i:4;a:1:{i:0;s:15:\"change_password\";}i:5;a:1:{i:0;s:9:\"imagelist\";}i:6;a:1:{i:0;s:4:\"tree\";}}', '', NULL, NULL, 26, 26, '2017-02-10 16:21:31', '2017-09-12 21:37:19'),
(546, 33, 'list_url', 'list_file', 'text', '', 'modify,details,create', '', '', '', '', NULL, NULL, 34, 34, '2017-04-15 07:46:05', NULL),
(240, 33, 'table_title', 'title', 'text', '', 'list,modify,details,create', '', '200px', '', '', NULL, NULL, 5, 5, '2017-02-10 16:21:31', '2018-01-10 19:16:13'),
(242, 33, '', '<div class=\"table_type_rtdselect table_type_setting\" style=\"display:none;\">', 'html', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 27, 27, '2017-02-10 16:21:31', NULL),
(243, 33, 'table_key', 'table_key', 'text', 'cfg_key', 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 28, 28, '2017-02-10 16:21:31', NULL),
(244, 33, 'table_value', 'table_value', 'text', 'cfg_val', 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 29, 29, '2017-02-10 16:21:31', NULL),
(245, 33, '', '</div>', 'html', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 30, 30, '2017-02-10 16:21:31', NULL),
(246, 33, 'modify_url', 'modify_file', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 35, 35, '2017-02-10 16:21:31', NULL),
(247, 33, 'create_url', 'create_file', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 36, 36, '2017-02-10 16:21:31', NULL),
(248, 33, 'cnt_btns', 'cnt_btns', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 38, 38, '2017-02-10 16:21:31', NULL),
(249, 33, 'default_filter', 'default_filter', 'serialize', NULL, 'modify,details,create', '', '', 'a:2:{i:0;a:3:{i:0;s:6:\"df_key\";i:1;s:4:\"text\";i:2;s:5:\"152px\";}i:1;a:3:{i:0;s:6:\"df_val\";i:1;s:4:\"text\";i:2;s:5:\"152px\";}}', '1,', NULL, NULL, 39, 39, '2017-02-10 16:21:31', NULL),
(250, 33, '', 'Fields', 'sublist', '', 'list,duplicate', '', '50px', 'a:1:{i:0;a:4:{i:0;s:25:\"admin_zconfigtable_fields\";i:1;s:21:\"admin_zconfigtable_id\";i:2;s:21:\"admin_zconfigtable_id\";i:3;s:1:\"1\";}}', '', '', NULL, 40, 40, '2017-02-10 16:21:31', '2020-01-10 11:52:05'),
(251, 33, 'status', 'Status', 'onoff', NULL, 'modify,details,create', '', '60px', 'a:0:{}', NULL, NULL, NULL, 42, 42, '2017-02-10 16:21:31', NULL),
(252, 34, 'field_index', 'index', 'keyindex', '', 'list,modify,details,create', '', '', 'a:0:{}', '', '', NULL, 2, 2, '2017-02-10 16:21:31', '2019-07-24 08:29:20'),
(253, 34, 'field_name', 'field_name', 'text', NULL, 'list,modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 3, 3, '2017-02-10 16:21:31', NULL),
(254, 34, 'list_width', 'list_width(px)', 'text', NULL, 'list,modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 4, 4, '2017-02-10 16:21:31', NULL),
(255, 34, 'field_options', 'field_options', 'checkbox', '', 'list,modify,details,create', '', '', 'a:12:{i:0;a:1:{i:0;s:4:\"list\";}i:1;a:1:{i:0;s:6:\"modify\";}i:2;a:1:{i:0;s:7:\"details\";}i:3;a:1:{i:0;s:11:\"modify_show\";}i:4;a:1:{i:0;s:6:\"create\";}i:5;a:1:{i:0;s:7:\"sorting\";}i:6;a:1:{i:0;s:7:\"require\";}i:7;a:1:{i:0;s:6:\"unique\";}i:8;a:1:{i:0;s:5:\"email\";}i:9;a:1:{i:0;s:9:\"duplicate\";}i:10;a:1:{i:0;s:7:\"skipsql\";}i:11;a:1:{i:0;s:13:\"after_newline\";}}', '', '', NULL, 5, 5, '2017-02-10 16:21:31', '2019-10-22 14:05:29'),
(256, 34, 'field_default', 'field_default', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 6, 6, '2017-02-10 16:21:31', NULL),
(257, 34, 'field_remark', 'field_remark', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 7, 7, '2017-02-10 16:21:31', NULL),
(258, 34, 'field_type', 'field_type', 'select', '', 'list,modify,details,create,require', '', '', 'a:1:{i:0;a:1:{i:0;s:13:\"select_option\";}}', '', NULL, NULL, 10, 10, '2017-02-10 16:21:31', '2018-02-13 02:43:30'),
(259, 34, 'sort_order', 'order', 'int', '', 'list,sorting', '', '100px', '', '', NULL, NULL, 11, 11, '2017-02-10 16:21:31', '2018-02-13 02:05:31'),
(260, 34, '', '<div class=\"field_type_rtdselect field_type_language\" style=\"display:none;\">', 'html', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 13, 13, '2017-02-10 16:21:31', NULL),
(261, 34, 'extra_opt', 'extra_opt language', 'serialize', NULL, 'modify,details,create', '', '', 'a:2:{i:0;a:3:{i:0;s:3:\"tab\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:1;a:3:{i:0;s:5:\"label\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', '1,extra_opt_language', NULL, NULL, 14, 14, '2017-02-10 16:21:31', NULL),
(262, 34, '', '</div>', 'html', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 15, 15, '2017-02-10 16:21:31', NULL),
(263, 34, '', '<div class=\"field_type_rtdselect field_type_related\" style=\"display:none;\">', 'html', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 16, 16, '2017-02-10 16:21:31', NULL),
(264, 34, 'extra_opt', 'extra_opt related', 'serialize', '', 'modify,details,create', 'html_type 0 or null = selelct , 1=radio', '', 'a:6:{i:0;a:3:{i:0;s:13:\"related_table\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:1;a:3:{i:0;s:12:\"related_name\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:2;a:3:{i:0;s:11:\"related_key\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:3;a:3:{i:0;s:17:\"related_extra_key\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:4;a:3:{i:0;s:19:\"related_extra_value\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:5;a:3:{i:0;s:9:\"html_type\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', ',extra_opt_related', '', NULL, 17, 17, '2017-02-10 16:21:31', '2019-10-21 18:56:57'),
(265, 34, '', '</div>', 'html', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 18, 18, '2017-02-10 16:21:31', NULL),
(266, 34, '', '<div class=\"field_type_rtdselect field_type_related_checkbox\" style=\"display:none;\">', 'html', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 19, 19, '2017-02-10 16:21:31', NULL),
(267, 34, 'extra_opt', 'extra_opt related_checkbox', 'serialize', '', 'modify,details,create', '', '', 'a:9:{i:0;a:3:{i:0;s:13:\"related_table\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:1;a:3:{i:0;s:12:\"related_name\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:2;a:3:{i:0;s:11:\"related_key\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:3;a:3:{i:0;s:17:\"related_extra_key\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:4;a:3:{i:0;s:19:\"related_extra_value\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:5;a:3:{i:0;s:16:\"related_to_table\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:6;a:3:{i:0;s:14:\"related_to_key\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:7;a:3:{i:0;s:13:\"hide_checkall\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:8;a:3:{i:0;s:17:\"related_filterkey\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', ',extra_opt_related_checkbox', NULL, NULL, 20, 20, '2017-02-10 16:21:31', '2018-02-19 15:21:03'),
(268, 34, '', '</div>', 'html', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 21, 21, '2017-02-10 16:21:31', NULL),
(269, 34, '', '<div class=\"field_type_rtdselect field_type_related_multiple\" style=\"display:none;\">', 'html', '', 'modify,details,create', '', '', 'a:0:{}', '', '', NULL, 22, 22, '2017-02-10 16:21:31', '2019-10-20 10:09:46'),
(270, 34, 'extra_opt', 'extra_opt related_multiple', 'serialize', '', 'modify,details,create', 'hide_checkall =1|0 , html_type 0 or null =checkbox 1=multi select', '', 'a:10:{i:0;a:3:{i:0;s:13:\"related_table\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:1;a:3:{i:0;s:12:\"related_name\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:2;a:3:{i:0;s:11:\"related_key\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:3;a:3:{i:0;s:17:\"related_extra_key\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:4;a:3:{i:0;s:19:\"related_extra_value\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:5;a:3:{i:0;s:16:\"related_to_table\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:6;a:3:{i:0;s:16:\"related_to_mykey\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:7;a:3:{i:0;s:13:\"hide_checkall\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:8;a:3:{i:0;s:17:\"related_filterkey\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:9;a:3:{i:0;s:9:\"html_type\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', ',extra_opt_related_multiple', '', NULL, 23, 23, '2017-02-10 16:21:31', '2019-10-20 14:42:31'),
(271, 34, '', '</div>', 'html', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 24, 24, '2017-02-10 16:21:31', NULL),
(272, 34, '', '<div class=\"field_type_rtdselect field_type_select\" style=\"display:none;\">', 'html', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 25, 25, '2017-02-10 16:21:31', NULL),
(273, 34, 'extra_opt', 'extra_opt select', 'serialize', '', 'modify,details,create', '', '', 'a:2:{i:0;a:3:{i:0;s:13:\"select_option\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:1;a:3:{i:0;s:10:\"select_key\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', '1,extra_opt_select', '', NULL, 26, 26, '2017-02-10 16:21:31', '2019-11-10 19:00:17'),
(274, 34, '', '</div>', 'html', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 27, 27, '2017-02-10 16:21:31', NULL),
(275, 34, '', '<div class=\"field_type_rtdselect field_type_serialize\" style=\"display:none;\">', 'html', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 28, 28, '2017-02-10 16:21:31', NULL),
(276, 34, 'extra_opt', 'extra_opt serialize', 'serialize', NULL, 'modify,details,create', '', '', 'a:3:{i:0;a:3:{i:0;s:4:\"name\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:1;a:3:{i:0;s:4:\"type\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:2;a:3:{i:0;s:12:\"width(100px)\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', '1,extra_opt_serialize', NULL, NULL, 30, 30, '2017-02-10 16:21:31', NULL),
(277, 34, '', '</div>', 'html', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 31, 31, '2017-02-10 16:21:31', NULL),
(278, 34, '', '<div class=\"field_type_rtdselect field_type_sublist\" style=\"display:none;\">', 'html', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 32, 32, '2017-02-10 16:21:31', NULL),
(279, 34, 'extra_opt', 'extra_opt sublist', 'serialize', '', 'modify,details,create', '', '', 'a:4:{i:0;a:3:{i:0;s:13:\"related_table\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:1;a:3:{i:0;s:11:\"related_key\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:2;a:3:{i:0;s:14:\"related_my_key\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:3;a:3:{i:0;s:12:\"allow_delete\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', ',extra_opt_sublist', '', NULL, 33, 33, '2017-02-10 16:21:31', '2020-01-10 11:51:35'),
(280, 34, '', '</div>', 'html', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 34, 34, '2017-02-10 16:21:31', NULL),
(281, 34, '', '<div class=\"field_type_rtdselect field_type_tag\" style=\"display:none;\">', 'html', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 35, 35, '2017-02-10 16:21:31', NULL),
(282, 34, 'extra_opt', 'extra_opt tag', 'serialize', NULL, 'modify,details,create', '', '', 'a:2:{i:0;a:3:{i:0;s:9:\"item_type\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:1;a:3:{i:0;s:7:\"item_id\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', ',extra_opt_tag', NULL, NULL, 36, 36, '2017-02-10 16:21:31', NULL),
(283, 34, '', '</div>', 'html', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 37, 37, '2017-02-10 16:21:31', NULL),
(284, 35, 'status', 'status', 'onoff', NULL, 'create,modify,details', '', '', 'a:0:{}', NULL, NULL, NULL, 1, 1, '2017-02-10 16:21:31', NULL),
(285, 35, 'admin_id', '#', 'text', NULL, 'list,sorting,details', '', '40px', 'a:0:{}', NULL, NULL, NULL, 2, 2, '2017-02-10 16:21:31', NULL),
(286, 35, 'login_name', 'Login', 'text', NULL, 'list,sorting,create,modify,details,require,unique', '', '100px', 'a:0:{}', NULL, NULL, NULL, 3, 3, '2017-02-10 16:21:31', NULL),
(287, 35, 'password', 'Password', 'password', NULL, 'create,modify', '', '', 'a:0:{}', NULL, NULL, NULL, 4, 4, '2017-02-10 16:21:31', NULL),
(288, 35, 'admin_group_id', 'Group', 'related', NULL, 'list,sorting,create,modify,details', '', '200px', 'a:1:{i:0;a:5:{i:0;s:11:\"admin_group\";i:1;s:7:\"name_tc\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";}}', NULL, NULL, NULL, 5, 5, '2017-02-10 16:21:31', NULL),
(289, 36, 'current', 'old_password', 'single_password', NULL, 'modify,create,details,skipsql', '', '', 'a:0:{}', NULL, NULL, NULL, 1, 1, '2017-02-10 16:21:31', NULL),
(290, 36, 'password', 'new_password', 'password', NULL, 'list,sorting,create,modify,details', '', '100px', 'a:0:{}', NULL, NULL, NULL, 2, 2, '2017-02-10 16:21:31', NULL),
(291, 37, 'status', 'status active', 'onoff', NULL, 'create,modify,details', '', '', 'a:0:{}', NULL, NULL, NULL, 1, 1, '2017-02-10 16:21:31', NULL),
(292, 37, 'name_tc', 'Group Name', 'text', NULL, 'list,sorting,create,modify,details', '', '100px', 'a:0:{}', NULL, NULL, NULL, 2, 2, '2017-02-10 16:21:31', NULL),
(293, 37, 'permission', 'Permission', 'related_multiple', '', 'modify,details,create', '', '', 'a:1:{i:0;a:8:{i:0;s:16:\"admin_permission\";i:1;s:7:\"name_en\";i:2;s:0:\"\";i:3;s:9:\"parent_id\";i:4;s:1:\"0\";i:5;s:0:\"\";i:6;s:0:\"\";i:7;s:0:\"\";}}', '', NULL, NULL, 3, 3, '2017-02-10 16:21:31', '2018-01-04 21:43:01'),
(294, 38, 'text_index', 'text Index', 'text', NULL, 'list,create,modify_show,details,unique', '', '', 'a:0:{}', NULL, NULL, NULL, 1, 1, '2017-02-10 16:21:31', NULL),
(2876, 34, '', '</div>', 'html', '', 'modify,details,create', '', '', '', '', NULL, NULL, 49, 49, '2018-03-30 09:03:52', NULL),
(2877, 34, 'extra_opt', 'extra_opt date', 'serialize', '', 'modify,details,create', '', '', 'a:1:{i:0;a:3:{i:0;s:11:\"date_format\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', '1,extra_opt_date', '', NULL, 48, 48, '2018-03-30 09:04:55', '2018-05-03 09:25:06'),
(296, 38, 'text_en', 'text EN', 'text', '', 'list,modify,details,create', '', '', '', '', NULL, NULL, 2, 2, '2017-02-10 16:21:31', '2018-02-19 15:28:46'),
(297, 38, 'text_tc', 'text TC', 'text', '', 'list,modify,details,create', '', '', '', '', NULL, NULL, 3, 3, '2017-02-10 16:21:31', '2018-02-19 15:28:50'),
(298, 38, 'text_sc', 'text SC', 'text', '', 'list,modify,details,create', '', '', '', '', NULL, NULL, 4, 4, '2017-02-10 16:21:31', '2018-02-19 15:28:54'),
(299, 39, 'name_en', 'EN Name', 'text', NULL, 'list,create,modify,details', '', '250px', 'a:0:{}', NULL, NULL, NULL, 1, 1, '2017-02-10 16:21:31', NULL),
(300, 39, 'name_tc', 'TC Name', 'text', NULL, 'list,create,modify,details', '', '250px', 'a:0:{}', NULL, NULL, NULL, 2, 2, '2017-02-10 16:21:31', NULL),
(301, 39, 'name_sc', 'SC Name', 'text', NULL, 'list,create,modify,details', '', '250px', 'a:0:{}', NULL, NULL, NULL, 3, 3, '2017-02-10 16:21:31', NULL),
(302, 39, 'permission_index', 'section index', 'text', NULL, 'list,create,modify,details', '', '250px', 'a:0:{}', NULL, NULL, NULL, 4, 4, '2017-02-10 16:21:31', NULL),
(303, 39, 'sort_order', 'Order', 'text', NULL, 'sorting', '', '160px', 'a:0:{}', NULL, NULL, NULL, 5, 5, '2017-02-10 16:21:31', NULL),
(304, 39, '', 'Sub', 'sublist', NULL, 'list', '', '50px', 'a:1:{i:0;a:3:{i:0;s:10:\"ap_cat_sub\";i:1;s:9:\"ap_cat_id\";i:2;s:0:\"\";}}', NULL, NULL, NULL, 6, 6, '2017-02-10 16:21:31', NULL),
(305, 39, '', 'Action', 'sublist', NULL, 'list', '', '160px', 'a:1:{i:0;a:3:{i:0;s:23:\"admin_permission_action\";i:1;s:9:\"parent_id\";i:2;s:19:\"admin_permission_id\";}}', NULL, NULL, NULL, 7, 7, '2017-02-10 16:21:31', NULL),
(306, 39, 'status', 'status', 'onoff', NULL, 'list,create,modify,details', '', '60px', 'a:0:{}', NULL, NULL, NULL, 8, 8, '2017-02-10 16:21:31', NULL),
(307, 40, 'name_tc', 'name', 'text', NULL, 'list,create,modify,details', '', '120px', 'a:0:{}', NULL, NULL, NULL, 1, 1, '2017-02-10 16:21:31', NULL),
(308, 40, 'status', 'status', 'onoff', NULL, 'list,create,modify,details', '', '60px', 'a:0:{}', NULL, NULL, NULL, 2, 2, '2017-02-10 16:21:31', NULL),
(309, 41, 'admin_id', 'Admin', 'related', NULL, 'list,modify,details,create', '', '', 'a:1:{i:0;a:5:{i:0;s:5:\"admin\";i:1;s:10:\"login_name\";i:2;s:8:\"admin_id\";i:3;s:0:\"\";i:4;s:0:\"\";}}', NULL, NULL, NULL, 1, 1, '2017-02-10 16:21:31', NULL),
(310, 41, 'activity_type', 'Action', 'textarea', NULL, 'list,modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 2, 2, '2017-02-10 16:21:31', NULL),
(311, 41, 'section', 'Section(#id)', 'editor', NULL, 'list,modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 3, 3, '2017-02-10 16:21:31', NULL),
(312, 41, 'date_added', 'added time', 'datetime', '', 'list,modify,details,create', '', '', 'a:1:{i:0;a:1:{i:0;s:5:\"Y-m-d\";}}', '', NULL, NULL, 4, 4, '2017-02-10 16:21:31', '2018-03-30 09:14:42'),
(437, 33, '', '<div class=\"table_type_rtdselect table_type_imagelist\" style=\"display:none;\">', 'html', '', 'modify,details,create', '', '', '', NULL, NULL, NULL, 31, 31, NULL, '2017-02-25 16:46:24'),
(438, 33, 'image_field', 'image_field', 'text', '', 'modify,details,create', '', '', '', NULL, NULL, NULL, 32, 32, '2017-02-25 16:47:11', NULL),
(439, 33, '', '</div>', 'html', '', 'modify,details,create', '', '', '', NULL, NULL, NULL, 33, 33, '2017-02-25 16:47:37', NULL),
(506, 34, '', '<div class=\"field_type_rtdselect field_type_tabs\" style=\"display:none;\">', 'html', '', 'modify,details,create', '', '', '', NULL, NULL, NULL, 38, 38, '2017-03-14 08:45:07', NULL),
(507, 34, 'extra_opt', 'extra_opt tabs', 'serialize', '', 'modify,details,create', '', '', 'a:2:{i:0;a:3:{i:0;s:3:\"tab\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:1;a:3:{i:0;s:5:\"label\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', '1,extra_opt_tabs', NULL, NULL, 39, 39, '2017-03-14 08:46:44', '2017-03-14 09:17:39'),
(508, 34, '', '</div>', 'html', '', 'modify,details,create', '', '', '', NULL, NULL, NULL, 40, 40, '2017-03-14 08:48:25', NULL),
(510, 34, 'serialize_opt', 'serialize_opt', 'text', '', 'modify,details,create', '(allow_create,serialize_key)', '', '', '', NULL, NULL, 29, 29, '2017-03-14 09:01:28', '2018-03-30 10:17:03'),
(614, 34, '', '<div class=\"field_type_rtdselect field_type_checkbox\" style=\"display:none;\">', 'html', '', 'modify,details,create', '', '', '', '', NULL, NULL, 41, 41, '2017-09-12 21:41:47', NULL),
(615, 34, 'extra_opt', 'extra_opt checkbox', 'serialize', '', 'modify,details,create', '', '', 'a:1:{i:0;a:3:{i:0;s:15:\"checkbox_option\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', '1,extra_opt_checkbox', NULL, NULL, 42, 42, '2017-09-12 21:44:29', '2017-09-12 23:21:47'),
(616, 34, '', '</div>', 'html', '', 'modify,details,create', '', '', '', '', NULL, NULL, 43, 43, '2017-09-12 21:44:36', '2017-09-12 21:45:19'),
(617, 41, 'details', 'details', 'textarea', '', 'details', '', '', '', '', NULL, NULL, 5, 5, '2017-09-12 23:30:32', NULL),
(2618, 34, '', '</div>', 'html', '', 'modify,details,create', '', '', '', '', NULL, NULL, 46, 46, '2017-09-23 15:32:33', NULL),
(2617, 34, 'extra_opt', 'extra_opt textarea', 'serialize', '', 'modify,details,create', '', '', 'a:1:{i:0;a:3:{i:0;s:15:\"textarea_height\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', '1,extra_opt_textarea', NULL, NULL, 45, 45, '2017-09-23 15:32:27', NULL),
(2616, 34, '', '<div class=\"field_type_rtdselect field_type_textarea\" style=\"display:none;\">', 'html', '', 'modify,details,create', '', '', '', '', NULL, NULL, 44, 44, '2017-09-23 15:31:54', NULL),
(2834, 107, 'table_parent_id', 'table_parent_id', 'text', '', 'modify,create', '', '', '', NULL, NULL, NULL, 38, 38, '2017-03-01 00:05:42', NULL),
(2835, 107, 'table_index', 'index', 'text', NULL, 'list,modify,details,create,sorting', '', '', 'a:0:{}', NULL, NULL, NULL, 2, 2, '2017-02-10 16:21:31', NULL),
(2836, 107, 'table_name', 'table_name', 'text', NULL, 'list,modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 3, 3, '2017-02-10 16:21:31', NULL),
(2837, 107, 'table_primarykey', 'table_primarykey', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 5, 5, '2017-02-10 16:21:31', NULL),
(2838, 107, 'table_order_field', 'table_order_field', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 6, 6, '2017-02-10 16:21:31', NULL),
(2839, 107, 'table_order_default_direction', 'default_direction', 'select', '', 'modify,details,create', '', '', 'a:2:{i:0;a:1:{i:0;s:3:\"ASC\";}i:1;a:1:{i:0;s:4:\"DESC\";}}', '', NULL, NULL, 7, 7, '2017-02-10 16:21:31', '2017-09-12 21:37:42'),
(2840, 107, 'table_order_type', 'order_type', 'select', '', 'modify,details,create', '', '', 'a:5:{i:0;a:1:{i:0;s:5:\"order\";}i:1;a:1:{i:0;s:4:\"date\";}i:2;a:1:{i:0;s:4:\"time\";}i:3;a:1:{i:0;s:3:\"int\";}i:4;a:1:{i:0;s:4:\"text\";}}', '', NULL, NULL, 8, 8, '2017-02-10 16:21:31', '2017-09-12 21:38:36'),
(2841, 107, 'listwidth_class', 'listwidth_class', 'select', '', 'modify,details,create', '', '', 'a:4:{i:0;a:1:{i:0;s:9:\"col-md-12\";}i:1;a:1:{i:0;s:9:\"col-md-10\";}i:2;a:1:{i:0;s:8:\"col-md-8\";}i:3;a:1:{i:0;s:8:\"col-md-6\";}}', '', NULL, NULL, 9, 9, '2017-02-10 16:21:31', '2017-09-12 21:39:14'),
(2842, 107, 'perpage_nums', 'perpage_nums', 'text', '30', 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 10, 10, '2017-02-10 16:21:31', NULL),
(2843, 107, 'table_create_field', 'table_create_field', 'text', 'date_added', 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 11, 11, '2017-02-10 16:21:31', NULL),
(2844, 107, 'table_modify_field', 'table_modify_field', 'text', 'date_modified', 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 12, 12, '2017-02-10 16:21:31', NULL),
(2845, 107, 'extra_urlpar', 'extra_urlpar', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 13, 13, '2017-02-10 16:21:31', NULL),
(2846, 107, 'preview_url', 'preview_url', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 14, 14, '2017-02-10 16:21:31', NULL),
(2847, 107, 'table_option', 'table_option', 'checkbox', 'allow_create,allow_modify,allow_delete,allow_list,submit_backlist', 'list,modify,details,create', '', '', 'a:13:{i:0;a:1:{i:0;s:12:\"allow_create\";}i:1;a:1:{i:0;s:12:\"allow_modify\";}i:2;a:1:{i:0;s:12:\"allow_delete\";}i:3;a:1:{i:0;s:10:\"allow_list\";}i:4;a:1:{i:0;s:13:\"allow_preview\";}i:5;a:1:{i:0;s:14:\"allow_download\";}i:6;a:1:{i:0;s:13:\"allow_publish\";}i:7;a:1:{i:0;s:12:\"allow_export\";}i:8;a:1:{i:0;s:15:\"allow_duplicate\";}i:9;a:1:{i:0;s:16:\"sublist_shortcut\";}i:10;a:1:{i:0;s:15:\"submit_backlist\";}i:11;a:1:{i:0;s:16:\"support_language\";}i:12;a:1:{i:0;s:13:\"allow_details\";}}', '', NULL, NULL, 15, 15, '2017-02-10 16:21:31', '2018-02-08 19:01:57'),
(2848, 107, 'list_filter', 'list_filter', 'related_multiple', '', 'modify,details,create', '', '', 'a:1:{i:0;a:9:{i:0;s:25:\"admin_zconfigtable_fields\";i:1;s:10:\"field_name\";i:2;s:0:\"\";i:3;s:10:\"field_type\";i:4;s:42:\"date,onoff,related,related_checkbox,select\";i:5;s:0:\"\";i:6;s:0:\"\";i:7;s:1:\"1\";i:8;s:21:\"admin_zconfigtable_id\";}}', '', NULL, NULL, 16, 16, '2017-02-10 16:21:31', '2018-02-19 15:22:25'),
(2849, 107, 'search_field', 'search field', 'related_multiple', '', 'modify,details,create', '', '', 'a:1:{i:0;a:9:{i:0;s:25:\"admin_zconfigtable_fields\";i:1;s:10:\"field_name\";i:2;s:0:\"\";i:3;s:10:\"field_type\";i:4;s:20:\"text,textarea,editor\";i:5;s:0:\"\";i:6;s:0:\"\";i:7;s:1:\"1\";i:8;s:21:\"admin_zconfigtable_id\";}}', '', NULL, NULL, 17, 17, '2017-02-10 16:21:31', '2018-02-19 15:22:37'),
(2850, 107, 'list_update', 'list update', 'related_multiple', '', 'modify,details,create', '', '', 'a:1:{i:0;a:9:{i:0;s:25:\"admin_zconfigtable_fields\";i:1;s:10:\"field_name\";i:2;s:0:\"\";i:3;s:10:\"field_type\";i:4;s:53:\"text,onoff,textarea,int,date,checkbox,select,keyindex\";i:5;s:0:\"\";i:6;s:0:\"\";i:7;s:1:\"1\";i:8;s:21:\"admin_zconfigtable_id\";}}', '', '', NULL, 18, 18, '2017-02-10 16:21:31', '2019-07-24 07:53:27'),
(2851, 107, 'export_field', 'export field', 'related_multiple', '', 'modify,details,create', '', '', 'a:1:{i:0;a:9:{i:0;s:25:\"admin_zconfigtable_fields\";i:1;s:10:\"field_name\";i:2;s:0:\"\";i:3;s:10:\"field_type\";i:4;s:220:\"audio,checkbox,date,datetime,dollar,editor,email,file,image,int,keyindex,link,onoff,password,qrcode,radio,related,related_checkbox,related_multi,select,serialize,single_password,sublist,tabs,tag,text,textarea,token,video\";i:5;s:0:\"\";i:6;s:0:\"\";i:7;s:1:\"1\";i:8;s:21:\"admin_zconfigtable_id\";}}', '', '', NULL, 19, 19, '2017-02-10 16:21:31', '2019-07-24 09:31:39'),
(2852, 107, 'parent_related_key', 'parent_related_key', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 20, 20, '2017-02-10 16:21:31', NULL),
(2853, 107, 'parent_table', 'parent_table', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 21, 21, '2017-02-10 16:21:31', NULL),
(2854, 107, 'parent_show_title', 'parent_show_title', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 22, 22, '2017-02-10 16:21:31', NULL),
(2855, 107, 'table_type', 'table_type', 'select', '', 'list,modify,details,create', '', '', 'a:8:{i:0;a:1:{i:0;s:4:\"list\";}i:1;a:1:{i:0;s:7:\"content\";}i:2;a:1:{i:0;s:7:\"setting\";}i:3;a:1:{i:0;s:7:\"sublist\";}i:4;a:1:{i:0;s:15:\"change_password\";}i:5;a:1:{i:0;s:9:\"imagelist\";}i:6;a:1:{i:0;s:4:\"tree\";}i:7;a:1:{i:0;s:25:\"admin_zconfigtable_create\";}}', '', '', NULL, 23, 23, '2017-02-10 16:21:31', '2019-02-07 10:44:47'),
(2856, 107, 'list_url', 'list_url', 'text', '', 'modify,details,create', '', '', '', '', NULL, NULL, 31, 31, '2017-04-15 07:46:05', NULL),
(2857, 107, 'table_title', 'title', 'text', '', 'list,modify,details,create', '', '200px', '', '', NULL, NULL, 4, 4, '2017-02-10 16:21:31', '2018-01-10 19:16:13'),
(2858, 107, '', '<div class=\"table_type_rtdselect table_type_setting\" style=\"display:none;\">', 'html', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 24, 24, '2017-02-10 16:21:31', NULL),
(2859, 107, 'table_key', 'table_key', 'text', 'cfg_key', 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 25, 25, '2017-02-10 16:21:31', NULL),
(2860, 107, 'table_value', 'table_value', 'text', 'cfg_val', 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 26, 26, '2017-02-10 16:21:31', NULL),
(2861, 107, '', '</div>', 'html', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 27, 27, '2017-02-10 16:21:31', NULL),
(2862, 107, 'modify_url', 'modify_url', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 32, 32, '2017-02-10 16:21:31', NULL),
(2863, 107, 'create_url', 'create_url', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 33, 33, '2017-02-10 16:21:31', NULL),
(2864, 107, 'cnt_btns', 'cnt_btns', 'text', NULL, 'modify,details,create', '', '', 'a:0:{}', NULL, NULL, NULL, 35, 35, '2017-02-10 16:21:31', NULL),
(2865, 107, 'default_filter', 'default_filter', 'serialize', NULL, 'modify,details,create', '', '', 'a:2:{i:0;a:3:{i:0;s:6:\"df_key\";i:1;s:4:\"text\";i:2;s:5:\"152px\";}i:1;a:3:{i:0;s:6:\"df_val\";i:1;s:4:\"text\";i:2;s:5:\"152px\";}}', '1,', NULL, NULL, 36, 36, '2017-02-10 16:21:31', NULL),
(2866, 107, '', 'Fields', 'sublist', '', 'list,duplicate', '', '50px', 'a:1:{i:0;a:4:{i:0;s:25:\"admin_zconfigtable_fields\";i:1;s:21:\"admin_zconfigtable_id\";i:2;s:21:\"admin_zconfigtable_id\";i:3;s:1:\"1\";}}', '', '', NULL, 37, 37, '2017-02-10 16:21:31', '2020-01-10 11:52:21'),
(2867, 107, 'status', 'Status', 'onoff', '1', 'modify,create', '', '60px', '', '', NULL, NULL, 39, 39, '2017-02-10 16:21:31', '2018-04-19 22:05:11'),
(2868, 107, '', '<div class=\"table_type_rtdselect table_type_imagelist\" style=\"display:none;\">', 'html', '', 'modify,details,create', '', '', '', NULL, NULL, NULL, 28, 28, NULL, '2017-02-25 16:46:24'),
(2869, 107, 'image_field', 'image_field', 'text', '', 'modify,details,create', '', '', '', NULL, NULL, NULL, 29, 29, '2017-02-25 16:47:11', NULL),
(2870, 107, '', '</div>', 'html', '', 'modify,details,create', '', '', '', NULL, NULL, NULL, 30, 30, '2017-02-25 16:47:37', NULL),
(2871, 34, 'list_order', 'list order', 'int', '', 'list,sorting', '', '100px', '', '', NULL, NULL, 12, 12, '2018-02-13 02:05:05', NULL),
(2878, 34, '', '<div class=\"field_type_rtdselect field_type_date\" style=\"display:none;\">', 'html', '', 'modify,details,create', '', '', 'a:1:{i:0;a:1:{i:0;s:0:\"\";}}', '', NULL, NULL, 47, 47, '2018-03-30 09:05:16', NULL),
(2879, 34, '', '</div>', 'html', '', 'modify,details,create', '', '', '', '', NULL, NULL, 52, 52, '2018-03-30 09:06:46', NULL),
(2880, 34, 'extra_opt', 'extra_opt image', 'serialize', '', 'modify,details,create', '', '', 'a:7:{i:0;a:3:{i:0;s:11:\"reisze_type\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:1;a:3:{i:0;s:5:\"width\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:2;a:3:{i:0;s:6:\"height\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:3;a:3:{i:0;s:10:\"water_mark\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:4;a:3:{i:0;s:8:\"mb_limit\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:5;a:3:{i:0;s:9:\"mime_type\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:6;a:3:{i:0;s:12:\"allow_rotate\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', ',extra_opt_image', '', NULL, 51, 51, '2018-03-30 09:12:24', '2019-10-22 18:00:58'),
(2881, 34, '', '<div class=\"field_type_rtdselect field_type_image\" style=\"display:none;\">', 'html', '', 'modify,details,create', '', '', 'a:1:{i:0;a:6:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:5;s:0:\"\";}}', '', NULL, NULL, 50, 50, '2018-03-30 09:13:01', NULL),
(2883, 34, '', '<div class=\"field_type_rtdselect field_type_file\" style=\"display:none;\">', 'html', '', 'modify,details,create', '', '', '', '', NULL, NULL, 53, 53, '2018-03-30 10:43:32', '2018-03-30 10:44:51'),
(2884, 34, 'extra_opt', 'extra_opt file', 'serialize', '', 'modify,details,create', '', '', 'a:2:{i:0;a:3:{i:0;s:8:\"mb_limit\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:1;a:3:{i:0;s:9:\"mime_type\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', '1,extra_opt_file', NULL, NULL, 54, 54, '2018-03-30 10:43:37', NULL),
(2885, 34, '', '</div>', 'html', '', 'modify,details,create', '', '', '', '', NULL, NULL, 55, 55, '2018-03-30 10:43:42', '2018-03-30 10:45:59'),
(2887, 34, '', '<div class=\"field_type_rtdselect field_type_video\" style=\"display:none;\">', 'html', '', 'modify,details,create', '', '', '', '', NULL, NULL, 56, 56, '2018-03-30 10:48:31', NULL),
(2888, 34, '', '</div>', 'html', '', 'modify,details,create', '', '', '', '', NULL, NULL, 58, 58, '2018-03-30 10:48:59', NULL),
(2889, 34, 'extra_opt', 'extra_opt video', 'serialize', '', 'modify,details,create', '', '', 'a:5:{i:0;a:3:{i:0;s:5:\"width\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:1;a:3:{i:0;s:6:\"height\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:2;a:3:{i:0;s:8:\"mb_limit\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:3;a:3:{i:0;s:9:\"mime_type\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:4;a:3:{i:0;s:11:\"accpet_file\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', ',extra_opt_video', '', NULL, 57, 57, '2018-03-30 10:49:46', '2019-10-22 18:00:44'),
(2890, 34, '', '<div class=\"field_type_rtdselect field_type_text\" style=\"display:none;\">', 'html', '', 'modify,create', '', '', '', '', NULL, NULL, 59, 59, '2018-04-19 21:59:49', '2018-04-19 22:02:41'),
(2891, 34, 'extra_opt', 'extra_opt text', 'serialize', '', 'modify,create', '', '', 'a:1:{i:0;a:3:{i:0;s:12:\"autocomplete\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', '1,extra_opt_text', NULL, NULL, 60, 60, '2018-04-19 22:00:09', '2018-04-19 22:02:35'),
(2892, 34, '', '</div>', 'html', '', 'modify,create', '', '', 'a:1:{i:0;a:1:{i:0;s:0:\"\";}}', '', NULL, NULL, 61, 61, '2018-04-19 22:00:15', '2018-04-19 22:02:31'),
(2893, 34, 'reserved_index', 'reserved index', 'text', '', 'modify,create', '', '', 'a:1:{i:0;a:1:{i:0;s:0:\"\";}}', '', NULL, NULL, 8, 8, '2018-04-19 22:13:21', NULL),
(2894, 33, 'db_name', 'Database', 'text', '', 'duplicate,skipsql', '', '', 'a:1:{i:0;a:1:{i:0;s:0:\"\";}}', '', '', NULL, 1, 1, '2018-05-03 09:25:58', NULL),
(2972, 111, 'table_index', 'index', 'keyindex', '', 'list,modify,create,duplicate', '', '', 'a:1:{i:0;a:1:{i:0;s:0:\"\";}}', '', '', NULL, 2, 2, '2017-02-10 16:21:31', '2019-07-24 07:51:07'),
(3014, 111, 'videos_language', 'videos with language', 'serialize', '', 'modify,create,duplicate', 'setting(accpet_mime_type, size_max_mb) \'.mp4,.mov\', 10, list(1 or 0)', '', 'a:4:{i:0;a:3:{i:0;s:11:\"field_index\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:1;a:3:{i:0;s:4:\"name\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:2;a:3:{i:0;s:7:\"setting\";i:1;s:4:\"text\";i:2;s:5:\"450px\";}i:3;a:3:{i:0;s:4:\"list\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', '1,videos_language', '', NULL, 16, 16, '2019-02-07 10:28:35', '2019-02-07 13:32:39'),
(3016, 111, 'table_order_type', 'order_type', 'select', '', 'modify,create,duplicate', '', '', 'a:3:{i:0;a:1:{i:0;s:5:\"order\";}i:1;a:1:{i:0;s:4:\"date\";}i:2;a:1:{i:0;s:2:\"id\";}}', '', '', NULL, 5, 5, '2019-02-07 11:14:27', '2019-02-07 11:23:33'),
(3017, 111, 'table_type', 'table_type', 'select', 'list', 'list,modify,create,duplicate', '', '', 'a:8:{i:0;a:1:{i:0;s:4:\"list\";}i:1;a:1:{i:0;s:7:\"content\";}i:2;a:1:{i:0;s:7:\"setting\";}i:3;a:1:{i:0;s:7:\"sublist\";}i:4;a:1:{i:0;s:9:\"imagelist\";}i:5;a:1:{i:0;s:6:\"1level\";}i:6;a:1:{i:0;s:6:\"2level\";}i:7;a:1:{i:0;s:4:\"tree\";}}', '', '', NULL, 4, 4, '2019-02-07 11:18:28', '2019-07-24 07:38:39'),
(3018, 111, 'images_none_language', 'Images normal', 'serialize', '', 'modify,create,duplicate', 'list(1 or 0),setting(resize_type[resize|copy|crop], width, height, accpet_mime_type, water_mark, size_max_mb) \'resize\', 800, 600, \'.jpg,.jpeg,.png\', null, 2', '', 'a:4:{i:0;a:3:{i:0;s:11:\"field_index\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:1;a:3:{i:0;s:4:\"name\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:2;a:3:{i:0;s:7:\"setting\";i:1;s:4:\"text\";i:2;s:5:\"450px\";}i:3;a:3:{i:0;s:4:\"list\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', '1,images_none_language', '', NULL, 9, 9, '2019-02-07 12:57:50', '2019-02-07 13:26:26'),
(3019, 111, 'videos_none_language', 'videos normal', 'serialize', '', 'modify,create,duplicate', 'setting(accpet_mime_type, size_max_mb) \'.mp4,.mov\', 10, list(1 or 0)', '', 'a:4:{i:0;a:3:{i:0;s:11:\"field_index\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:1;a:3:{i:0;s:4:\"name\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:2;a:3:{i:0;s:7:\"setting\";i:1;s:4:\"text\";i:2;s:5:\"450px\";}i:3;a:3:{i:0;s:4:\"list\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', '1,videos_none_language', '', NULL, 10, 10, '2019-02-07 12:58:26', '2019-02-07 13:32:44'),
(3020, 111, 'files_none_language', 'files normal', 'serialize', '', 'modify,create,duplicate', 'setting(accpet_mime_type, size_max_mb) \'.mp4,.mov\', 10, list(1 or 0)', '', 'a:4:{i:0;a:3:{i:0;s:11:\"field_index\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:1;a:3:{i:0;s:4:\"name\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:2;a:3:{i:0;s:7:\"setting\";i:1;s:4:\"text\";i:2;s:5:\"450px\";}i:3;a:3:{i:0;s:4:\"list\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', '1,files_none_language', '', NULL, 11, 11, '2019-02-07 12:58:40', '2019-02-07 13:33:09'),
(3022, 33, 'duplicate_url', 'duplicate_file', 'text', '', 'modify,details,create', '', '', 'a:1:{i:0;a:1:{i:0;s:0:\"\";}}', '', '', NULL, 37, 37, '2019-02-07 13:55:01', NULL),
(3023, 107, 'duplicate_url', 'duplicate_url', 'text', '', 'modify,details,create', '', '', 'a:1:{i:0;a:1:{i:0;s:0:\"\";}}', '', '', NULL, 34, 34, '2019-02-07 13:56:00', NULL),
(3024, 111, '', '', 'tabs', 'opt_wolang', 'modify,create,duplicate', '', '', 'a:2:{i:0;a:2:{i:0;s:10:\"opt_wolang\";i:1;s:13:\"fields normal\";}i:1;a:2:{i:0;s:9:\"opt_wlang\";i:1;s:20:\"fields with language\";}}', '', '', NULL, 7, 7, '2019-02-07 14:48:03', '2019-02-07 14:55:28'),
(3025, 111, '', '<div class=\"opt_wlang\">', 'html', '', 'modify,create,duplicate', '', '', NULL, '', '', NULL, 14, 14, '2019-02-07 14:49:38', NULL),
(2994, 111, 'table_title', 'title', 'text', '', 'list,modify,create,duplicate', '', '200px', 'a:1:{i:0;a:1:{i:0;s:0:\"\";}}', '', '', NULL, 3, 3, '2017-02-10 16:21:31', '2019-02-07 11:23:28'),
(3015, 111, 'files_language', 'files with language', 'serialize', '', 'modify,create,duplicate', 'setting(accpet_mime_type, size_max_mb) \'.mp4,.mov\', 10, list(1 or 0)', '', 'a:4:{i:0;a:3:{i:0;s:11:\"field_index\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:1;a:3:{i:0;s:4:\"name\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:2;a:3:{i:0;s:7:\"setting\";i:1;s:4:\"text\";i:2;s:5:\"450px\";}i:3;a:3:{i:0;s:4:\"list\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', '1,files_language', '', NULL, 17, 17, '2019-02-07 10:34:20', '2019-02-07 13:33:03'),
(3013, 111, 'images_language', 'Images with language', 'serialize', '', 'modify,create,duplicate', 'list(1 or 0),setting(resize_type[resize|copy|crop], width, height, accpet_mime_type, water_mark, size_max_mb) \'resize\', 800, 600, \'.jpg,.jpeg,.png\', null, 2', '', 'a:4:{i:0;a:3:{i:0;s:11:\"field_index\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:1;a:3:{i:0;s:4:\"name\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:2;a:3:{i:0;s:7:\"setting\";i:1;s:4:\"text\";i:2;s:5:\"450px\";}i:3;a:3:{i:0;s:4:\"list\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', '1,images_language', '', NULL, 15, 15, '2019-02-07 10:19:26', '2019-02-07 13:26:33'),
(3012, 111, 'language', 'language', 'serialize', '', 'modify,create,duplicate', '(ENG,en)(繁體,tc)(簡體,sc)', '', 'a:2:{i:0;a:3:{i:0;s:4:\"name\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:1;a:3:{i:0;s:4:\"code\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', '1,language', '', NULL, 6, 6, '2019-02-07 10:06:28', '2019-07-23 21:02:08'),
(3011, 111, 'text_none_language', 'text fields normal', 'serialize', '', 'modify,create,duplicate', 'type (text or textarea), list(1 or 0)', '', 'a:4:{i:0;a:3:{i:0;s:5:\"index\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:1;a:3:{i:0;s:4:\"name\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:2;a:3:{i:0;s:9:\"html_type\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:3;a:3:{i:0;s:4:\"list\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', '1,text_none_language', '', NULL, 12, 12, '2019-02-07 10:03:15', '2019-02-07 16:02:26'),
(3021, 111, 'saveas_template', 'Save as template', 'onoff', '1', 'create,duplicate,skipsql', '', '', NULL, '', '', NULL, 20, 20, '2019-02-07 13:08:44', '2019-07-24 07:38:06'),
(3010, 111, 'text_language', 'text fields with language', 'serialize', '', 'modify,create,duplicate', 'type (text or textarea), list(1 or 0)', '', 'a:4:{i:0;a:3:{i:0;s:5:\"index\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:1;a:3:{i:0;s:4:\"name\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:2;a:3:{i:0;s:9:\"html_type\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}i:3;a:3:{i:0;s:4:\"list\";i:1;s:4:\"text\";i:2;s:5:\"150px\";}}', '1,text_language', '', NULL, 18, 18, '2019-02-07 10:01:39', '2019-02-07 16:01:58'),
(3008, 111, 'db_name', 'Database', 'text', '', 'modify,create,duplicate', '', '', 'a:1:{i:0;a:1:{i:0;s:0:\"\";}}', '', '', NULL, 1, 1, '2018-05-03 09:25:58', '2019-02-07 11:23:19'),
(3026, 111, '', '<div class=\"opt_wolang\">', 'html', '', 'modify,create,duplicate', '', '', NULL, '', '', NULL, 8, 8, '2019-02-07 14:49:49', NULL),
(3027, 111, '', '</div>', 'html', '', 'modify,create,duplicate', '', '', NULL, '', '', NULL, 13, 13, '2019-02-07 14:50:17', NULL),
(3028, 111, '', '</div>', 'html', '', 'modify,create,duplicate', '', '', NULL, '', '', NULL, 19, 19, '2019-02-07 14:50:26', NULL),
(3049, 34, '', '<div class=\"field_type_rtdselect field_type_radio\" style=\"display:none;\">', 'html', '', 'modify,create', '', '', NULL, '', '', NULL, 62, 62, '2019-05-16 14:11:07', NULL),
(3050, 34, 'extra_opt', 'extra_opt radio', 'inlinelist', '', 'modify,details,create', '', '', 'a:2:{i:0;a:3:{i:0;s:12:\"radio_option\";i:1;s:4:\"text\";i:2;s:0:\"\";}i:1;a:3:{i:0;s:9:\"radio_key\";i:1;s:4:\"text\";i:2;s:0:\"\";}}', '1,extra_opt_radio', '', NULL, 63, 63, '2019-05-16 14:12:39', '2020-04-04 12:23:48'),
(3051, 34, '', '</div>', 'html', '', 'modify,create', '', '', NULL, '', '', NULL, 64, 64, '2019-05-16 14:13:00', NULL),
(3052, 34, 'length_limit', 'length_limit', 'text', '', 'modify,create', '', '', 'a:1:{i:0;a:1:{i:0;s:0:\"\";}}', '', '', NULL, 9, 9, '2019-06-08 15:11:26', NULL),
(3174, 129, 'option_type', 'option_type', 'text', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, '2019-07-24 08:23:07', NULL),
(3175, 129, 'name', 'name', 'text', NULL, 'list,modify,create,duplicate', NULL, '', NULL, NULL, NULL, NULL, 2, 2, '2019-07-24 08:23:07', NULL),
(3176, 129, 'sort_order', 'Order', 'int', NULL, 'list,sorting', NULL, '100px', NULL, NULL, NULL, NULL, 3, 3, '2019-07-24 08:23:07', NULL),
(3177, 129, 'status', 'Status', 'onoff', '1', 'list,modify,create,duplicate', NULL, '', NULL, NULL, NULL, NULL, 4, 4, '2019-07-24 08:23:07', NULL),
(3668, 33, 'related_id', 'related from CFG Table', 'related', '', 'modify,create', '', '', 'a:1:{i:0;a:6:{i:0;s:18:\"admin_zconfigtable\";i:1;s:23:\"table_index,table_title\";i:2;s:21:\"admin_zconfigtable_id\";i:3;s:0:\"\";i:4;s:0:\"\";i:5;s:0:\"\";}}', '', '', NULL, 2, 2, '2019-11-10 15:02:47', '2019-11-10 15:06:45'),
(3296, 33, 'table_create_admin', 'table_create_admin', 'text', 'admin_added', 'modify,create', '', '', 'a:1:{i:0;a:1:{i:0;s:0:\"\";}}', '', '', NULL, 14, 14, '2019-09-12 09:48:03', '2019-10-22 14:35:32');
INSERT INTO `master_admin_zconfigtable_fields` (`admin_zconfigtable_fields_id`, `admin_zconfigtable_id`, `field_index`, `field_name`, `field_type`, `field_default`, `field_options`, `field_remark`, `list_width`, `extra_opt`, `serialize_opt`, `reserved_index`, `length_limit`, `sort_order`, `list_order`, `date_added`, `date_modified`) VALUES
(3297, 33, 'table_modified_admin', 'table_modified_admin', 'text', 'admin_modified', 'modify,create', '', '', 'a:1:{i:0;a:1:{i:0;s:0:\"\";}}', '', '', NULL, 15, 15, '2019-09-12 09:48:35', '2019-10-22 14:35:41'),
(3339, 129, 'admin_modified', 'modify by', 'related', '', 'list', '', '', 'a:1:{i:0;a:5:{i:0;s:5:\"admin\";i:1;s:10:\"login_name\";i:2;s:8:\"admin_id\";i:3;s:0:\"\";i:4;s:0:\"\";}}', '', '', NULL, 6, 6, '2019-10-11 16:41:04', NULL),
(3340, 129, 'date_modified', 'Last modify date', 'datetime', '', 'list', '', '', NULL, '', '', NULL, 5, 5, '2019-10-11 16:37:11', NULL),
(3369, 34, '', '<div class=\"field_type_rtdselect field_type_inlinelist\" style=\"display:none;\">', 'html', '', 'modify,details,create', '', '', NULL, '', '', NULL, 65, 65, '2019-10-21 10:06:50', NULL),
(3370, 34, 'serialize_opt', 'inlinelist_opt', 'text', '', 'modify,details,create', '(allow_create,inlinelist_key)', '', '', '', '', NULL, 66, 66, '2019-10-21 10:07:30', NULL),
(3371, 34, '', '</div>', 'html', '', 'modify,details,create', '', '', NULL, '', '', NULL, 68, 68, '2019-10-21 10:10:00', NULL),
(3372, 34, 'extra_opt', 'extra_opt inlinelist', 'inlinelist', '', 'modify,details,create', '', '', 'a:6:{i:0;a:6:{i:0;s:4:\"name\";i:1;s:4:\"text\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:5;s:5:\"100px\";}i:1;a:6:{i:0;s:4:\"type\";i:1;s:4:\"text\";i:2;s:4:\"3830\";i:3;s:0:\"\";i:4;s:0:\"\";i:5;s:5:\"100px\";}i:2;a:6:{i:0;s:10:\"related_id\";i:1;s:4:\"text\";i:2;s:4:\"3831\";i:3;s:0:\"\";i:4;s:0:\"\";i:5;s:5:\"150px\";}i:3;a:6:{i:0;s:7:\"require\";i:1;s:4:\"text\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:5;s:5:\"100px\";}i:4;a:6:{i:0;s:7:\"default\";i:1;s:4:\"text\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:5;s:5:\"100px\";}i:5;a:6:{i:0;s:12:\"width(100px)\";i:1;s:4:\"text\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:5;s:5:\"100px\";}}', '1,extra_opt_inlinelist', '', NULL, 67, 67, '2019-10-21 10:10:29', '2020-03-08 07:46:59'),
(3624, 34, 'admin_zconfigtable_id', 'CFG Table', 'related', '', 'modify_show,duplicate', '', '', 'a:1:{i:0;a:6:{i:0;s:18:\"admin_zconfigtable\";i:1;s:11:\"table_index\";i:2;s:21:\"admin_zconfigtable_id\";i:3;s:0:\"\";i:4;s:0:\"\";i:5;s:0:\"\";}}', '', '', NULL, 1, 1, '2019-11-02 10:13:47', '2019-11-02 10:13:47'),
(3622, 22, 'hr_email', 'HR Email', 'textarea', '', 'modify,create', '', '', 'a:1:{i:0;a:1:{i:0;s:2:\"80\";}}', '', '', NULL, 3, 3, '2019-11-01 19:07:39', '2019-11-01 19:17:32'),
(3623, 22, 'from_email_name', 'From Name', 'text', '', 'modify,create', '', '', '', '', '', NULL, 2, 2, '2019-11-01 19:19:51', '2019-11-01 19:19:51'),
(3625, 35, 'email', 'email', 'email', '', 'list,modify,create', '', '', NULL, '', '', NULL, 6, 6, '2019-11-02 10:48:41', '2019-11-02 10:48:41'),
(3754, 171, 'import_database', 'import_database', 'select', '', 'list,modify,create', '', '', '', '', '', NULL, 1, 1, '2020-01-25 14:22:48', '2020-01-25 15:11:36'),
(3755, 171, 'import_tables', 'import_tables', 'checkbox', '', 'list,modify,create', '', '', '', '', '', NULL, 2, 2, '2020-01-25 14:29:42', '2020-01-25 15:11:39'),
(3830, 143, 'inlinelist_field_type', 'field_type', 'select', '', NULL, '', '', 'a:3:{i:0;a:2:{i:0;s:4:\"text\";i:1;s:0:\"\";}i:1;a:2:{i:0;s:8:\"textarea\";i:1;s:0:\"\";}i:2;a:2:{i:0;s:7:\"related\";i:1;s:0:\"\";}}', '', '', NULL, 1, 1, '2020-03-08 07:45:53', '2020-03-08 07:45:53'),
(3831, 143, 'inlinelist_related', 'inlinelist_related', 'related', '', NULL, '', '', 'a:1:{i:0;a:6:{i:0;s:25:\"admin_zconfigtable_fields\";i:1;s:10:\"field_name\";i:2;s:28:\"admin_zconfigtable_fields_id\";i:3;s:21:\"admin_zconfigtable_id\";i:4;s:3:\"143\";i:5;s:0:\"\";}}', '', '', NULL, 2, 2, '2020-03-08 07:46:28', '2020-03-08 07:46:28'),
(3832, 107, 'db_name', 'Database', 'text', '', 'duplicate,skipsql', '', '', 'a:1:{i:0;a:1:{i:0;s:0:\"\";}}', '', '', NULL, 1, 1, '2020-04-01 09:52:07', '2020-04-01 09:52:07'),
(3833, 34, '', '<div class=\"field_type_rtdselect field_type_slider\" style=\"display:none;\">', 'html', '', 'modify,details,create', '', '', NULL, '', '', NULL, 69, 69, '2020-04-04 12:11:46', '2020-04-04 12:11:46'),
(3834, 34, '', '</div>', 'html', '', 'modify,details,create', '', '', NULL, '', '', NULL, 71, 71, '2020-04-04 12:14:15', '2020-04-04 12:14:15'),
(3835, 34, 'extra_opt', 'extra_opt slider', 'inlinelist', '', 'modify,details,create', '', '', 'a:5:{i:0;a:6:{i:0;s:9:\"is_single\";i:1;s:4:\"text\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:5;s:5:\"100px\";}i:1;a:6:{i:0;s:3:\"min\";i:1;s:4:\"text\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:5;s:5:\"100px\";}i:2;a:6:{i:0;s:3:\"max\";i:1;s:4:\"text\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:5;s:5:\"100px\";}i:3;a:6:{i:0;s:5:\"label\";i:1;s:4:\"text\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:5;s:5:\"300px\";}i:4;a:6:{i:0;s:4:\"step\";i:1;s:4:\"text\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:5;s:5:\"100px\";}}', '1,extra_opt_slider', '', NULL, 70, 70, '2020-04-04 12:14:54', '2020-04-05 09:18:39');

-- --------------------------------------------------------

--
-- 資料表結構 `master_admin_zconfigtable_template`
--

CREATE TABLE `master_admin_zconfigtable_template` (
  `admin_zconfigtable_id` int(11) UNSIGNED NOT NULL,
  `table_index` varchar(255) DEFAULT NULL,
  `videos_language` text DEFAULT NULL,
  `table_order_type` varchar(255) DEFAULT NULL,
  `table_type` varchar(255) DEFAULT NULL,
  `images_none_language` text DEFAULT NULL,
  `videos_none_language` text DEFAULT NULL,
  `files_none_language` text DEFAULT NULL,
  `table_title` varchar(255) DEFAULT NULL,
  `files_language` text DEFAULT NULL,
  `images_language` text DEFAULT NULL,
  `language` text DEFAULT NULL,
  `text_none_language` text DEFAULT NULL,
  `saveas_template` varchar(255) DEFAULT NULL,
  `text_language` text DEFAULT NULL,
  `db_name` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `master_admin_zmenu`
--

CREATE TABLE `master_admin_zmenu` (
  `admin_zmenu_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `admin_zconfigtable_id` int(11) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `name_tc` varchar(255) DEFAULT NULL,
  `name_sc` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `status` tinyint(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `master_admin_zmenu`
--

INSERT INTO `master_admin_zmenu` (`admin_zmenu_id`, `parent_id`, `admin_zconfigtable_id`, `name_en`, `name_tc`, `name_sc`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(1, 0, NULL, 'Admin Manage', 'Admin Manage', 'Admin Manage', 1, 1, '2017-02-10 16:21:31', NULL),
(2, 1, 31, 'CFG Menu', 'CFG Menu', 'CFG Menu', 1, 1, '2017-02-10 16:21:31', NULL),
(3, 1, 33, 'CFG Table', 'CFG Table', 'CFG Table', 3, 1, '2017-02-10 16:21:31', NULL),
(4, 1, 35, 'Admin', 'Admin', 'Admin', 5, 1, '2017-02-10 16:21:31', NULL),
(5, 1, 37, 'Admin Group', 'Admin Group', 'Admin Group', 6, 1, '2017-02-10 16:21:31', NULL),
(6, 1, 41, 'Admin Activity', 'Admin Activity', 'Admin Activity', 7, 1, '2017-02-10 16:21:31', NULL),
(7, 1, 38, 'Admin Text', 'Admin Text', 'Admin Text', 8, 1, '2017-02-10 16:21:31', NULL),
(95, 1, 107, 'CFG Table Admin', 'CFG Table Admin', 'CFG Table Admin', 4, 1, '2018-01-27 21:10:47', NULL),
(97, 1, 111, 'CFG Table Template', 'CFG Table Template', 'CFG Table Template', 2, 1, '2019-02-07 10:35:21', NULL),
(145, 0, 171, 'SQL to Table CFG', 'SQL to Table CFG', 'SQL to Table CFG', 2, 1, '2020-01-25 14:23:06', '2020-01-25 14:23:06');

-- --------------------------------------------------------

--
-- 資料表結構 `master_email_template`
--

CREATE TABLE `master_email_template` (
  `email_template_id` int(11) UNSIGNED NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `email_type` varchar(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `replace_tag` varchar(255) DEFAULT NULL,
  `test_email` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `admin_added` int(11) DEFAULT NULL,
  `admin_modified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `master_files`
--

CREATE TABLE `master_files` (
  `file_id` int(11) NOT NULL,
  `url` varchar(450) NOT NULL DEFAULT '',
  `url_md5` varchar(45) NOT NULL DEFAULT '',
  `filename_md5` varchar(45) NOT NULL DEFAULT '',
  `type` varchar(45) NOT NULL DEFAULT '',
  `table` varchar(50) DEFAULT NULL,
  `file_org` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `admin_added` int(11) DEFAULT NULL,
  `admin_modified` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `master_files`
--

INSERT INTO `master_files` (`file_id`, `url`, `url_md5`, `filename_md5`, `type`, `table`, `file_org`, `status`, `date_added`, `date_modified`, `admin_added`, `admin_modified`) VALUES
(1, '', '', '1044047e716b03d1a9f0cea557a27dd8', 'csv', 'import_sales_brochure', 'tabula.csv', 1, '2019-11-10 18:46:16', '0000-00-00 00:00:00', NULL, NULL),
(37, '', '', 'ba5a359430c1e0b5ffdfcc14f02895b9', 'csv', 'import_sales_brochure', 'tabula-Pages from vanke_salesbook_20191206_web_part1 (2).csv', 1, '2019-12-27 15:29:09', NULL, NULL, NULL),
(12, '', '', '31ce904bbaa062fdc4382a02e2f577eb', 'csv', 'import_sales_brochure', 'tabula-Pages from Salesbrochurepart1 (1).csv', 1, '2019-11-12 15:28:10', '0000-00-00 00:00:00', NULL, NULL),
(18, '', '', 'd49897efc7fd7cdc001c134662447ded', 'csv', 'import_sales_brochure', 'tabula-K-Summit_Full-Book_20191108_Upload_Locked.csv', 1, '2019-11-27 22:00:58', NULL, NULL, NULL),
(17, '', '', '1044047e716b03d1a9f0cea557a27dd8', 'csv', 'import_sales_brochure', 'tabula.csv', 1, '2019-11-12 18:43:49', NULL, NULL, NULL),
(38, '', '', '4c5c45909b429f21eb1388e2953c01cf', 'csv', 'import_price_list', '上源 Lepont 價單.csv', 1, '2019-12-27 15:30:35', NULL, NULL, NULL),
(26, '', '', '417b1e73fbdb710d8ac7b77ac682fc6b', 'csv', 'import_Register', 'tabula-Pages from RegisterOfTransaction1312-1.csv', 1, '2019-12-25 14:13:55', NULL, NULL, NULL),
(32, '', '', '3aaf4e48b86f0673e48fa95630376059', 'csv', 'import_sales_brochure', '上源 Lepont 售樓書.csv', 1, '2019-12-27 13:14:20', NULL, NULL, NULL),
(33, '', '', '685233e74e4777937e61801c333e2faa', 'csv', 'import_sales_brochure', '上源 Lepont 售樓書2.csv', 1, '2019-12-27 13:19:30', NULL, NULL, NULL),
(34, '', '', '4c5c45909b429f21eb1388e2953c01cf', 'csv', 'import_price_list', '上源 Lepont 價單.csv', 1, '2019-12-27 14:56:46', NULL, NULL, NULL),
(35, '', '', 'b939df89a504cd85335b4c5aaa1b3e27', 'csv', 'import_Register', '上源 Lepont 成交紀錄.csv', 1, '2019-12-27 14:57:52', NULL, NULL, NULL),
(39, '', '', 'b939df89a504cd85335b4c5aaa1b3e27', 'csv', 'import_Register', '上源 Lepont 成交紀錄.csv', 1, '2019-12-27 15:35:24', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `master_images`
--

CREATE TABLE `master_images` (
  `image_id` int(11) NOT NULL,
  `url` varchar(450) NOT NULL DEFAULT '',
  `url_md5` varchar(45) NOT NULL DEFAULT '',
  `filename_md5` varchar(45) NOT NULL DEFAULT '',
  `type` varchar(45) NOT NULL DEFAULT '',
  `table` varchar(50) DEFAULT NULL,
  `file_org` varchar(255) DEFAULT NULL,
  `width` mediumint(4) DEFAULT 0,
  `height` mediumint(4) DEFAULT 0,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `admin_added` int(11) DEFAULT NULL,
  `admin_modified` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `master_setting`
--

CREATE TABLE `master_setting` (
  `setting_id` int(11) NOT NULL,
  `setting_type` varchar(50) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `admin_added` int(11) DEFAULT NULL,
  `admin_modified` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `master_setting`
--

INSERT INTO `master_setting` (`setting_id`, `setting_type`, `key`, `value`, `date_added`, `date_modified`, `admin_added`, `admin_modified`) VALUES
(1, '1', 'estate_project_id', '1', NULL, NULL, NULL, NULL),
(2, '0', 'import_database', 'oh360', NULL, NULL, NULL, NULL),
(3, '0', 'import_tables', 'oh360_IVC_VI_GetQuotation,oh360_IVC_VI_GetValidBP,oh360_IVC_VI_GetValidItem', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `master_setting_option`
--

CREATE TABLE `master_setting_option` (
  `setting_option_id` int(11) UNSIGNED NOT NULL,
  `option_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `admin_added` int(11) DEFAULT NULL,
  `admin_modified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `master_setting_option`
--

INSERT INTO `master_setting_option` (`setting_option_id`, `option_type`, `name`, `sort_order`, `status`, `date_added`, `date_modified`, `admin_added`, `admin_modified`) VALUES
(1, '1', '電熱水爐', 1, NULL, '2019-11-10 14:53:12', '2019-11-10 14:53:12', 1, 1);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `master_admin`
--
ALTER TABLE `master_admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `login_name` (`login_name`);

--
-- 資料表索引 `master_admin_activity`
--
ALTER TABLE `master_admin_activity`
  ADD PRIMARY KEY (`admin_activity_id`);

--
-- 資料表索引 `master_admin_group`
--
ALTER TABLE `master_admin_group`
  ADD PRIMARY KEY (`admin_group_id`);

--
-- 資料表索引 `master_admin_permission`
--
ALTER TABLE `master_admin_permission`
  ADD PRIMARY KEY (`admin_permission_id`);

--
-- 資料表索引 `master_admin_text_config`
--
ALTER TABLE `master_admin_text_config`
  ADD PRIMARY KEY (`text_config_id`);

--
-- 資料表索引 `master_admin_zconfigtable`
--
ALTER TABLE `master_admin_zconfigtable`
  ADD PRIMARY KEY (`admin_zconfigtable_id`);

--
-- 資料表索引 `master_admin_zconfigtable_fields`
--
ALTER TABLE `master_admin_zconfigtable_fields`
  ADD PRIMARY KEY (`admin_zconfigtable_fields_id`);

--
-- 資料表索引 `master_admin_zconfigtable_template`
--
ALTER TABLE `master_admin_zconfigtable_template`
  ADD PRIMARY KEY (`admin_zconfigtable_id`);

--
-- 資料表索引 `master_admin_zmenu`
--
ALTER TABLE `master_admin_zmenu`
  ADD PRIMARY KEY (`admin_zmenu_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- 資料表索引 `master_email_template`
--
ALTER TABLE `master_email_template`
  ADD PRIMARY KEY (`email_template_id`);

--
-- 資料表索引 `master_files`
--
ALTER TABLE `master_files`
  ADD PRIMARY KEY (`file_id`);

--
-- 資料表索引 `master_images`
--
ALTER TABLE `master_images`
  ADD PRIMARY KEY (`image_id`);

--
-- 資料表索引 `master_setting`
--
ALTER TABLE `master_setting`
  ADD PRIMARY KEY (`setting_id`),
  ADD KEY `setting_type` (`setting_type`);

--
-- 資料表索引 `master_setting_option`
--
ALTER TABLE `master_setting_option`
  ADD PRIMARY KEY (`setting_option_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `master_admin`
--
ALTER TABLE `master_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `master_admin_activity`
--
ALTER TABLE `master_admin_activity`
  MODIFY `admin_activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=490;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `master_admin_group`
--
ALTER TABLE `master_admin_group`
  MODIFY `admin_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `master_admin_permission`
--
ALTER TABLE `master_admin_permission`
  MODIFY `admin_permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=587;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `master_admin_text_config`
--
ALTER TABLE `master_admin_text_config`
  MODIFY `text_config_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `master_admin_zconfigtable`
--
ALTER TABLE `master_admin_zconfigtable`
  MODIFY `admin_zconfigtable_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `master_admin_zconfigtable_fields`
--
ALTER TABLE `master_admin_zconfigtable_fields`
  MODIFY `admin_zconfigtable_fields_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3836;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `master_admin_zconfigtable_template`
--
ALTER TABLE `master_admin_zconfigtable_template`
  MODIFY `admin_zconfigtable_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `master_admin_zmenu`
--
ALTER TABLE `master_admin_zmenu`
  MODIFY `admin_zmenu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `master_email_template`
--
ALTER TABLE `master_email_template`
  MODIFY `email_template_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `master_files`
--
ALTER TABLE `master_files`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `master_images`
--
ALTER TABLE `master_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `master_setting`
--
ALTER TABLE `master_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `master_setting_option`
--
ALTER TABLE `master_setting_option`
  MODIFY `setting_option_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
