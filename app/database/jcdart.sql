-- phpMyAdmin SQL Dump
-- version 3.4.7
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2014 年 10 月 14 日 17:58
-- 服务器版本: 5.5.17
-- PHP 版本: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `jcdart`
--

-- --------------------------------------------------------

--
-- 表的结构 `jcd_activations`
--

CREATE TABLE IF NOT EXISTS `jcd_activations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `token` varchar(255) NOT NULL COMMENT '令牌',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `activations_token_unique` (`token`),
  KEY `activations_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='账号激活' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jcd_articles`
--

CREATE TABLE IF NOT EXISTS `jcd_articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '作者ID',
  `category_id` int(10) unsigned NOT NULL COMMENT '文章分类ID',
  `comments_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `slug` varchar(255) NOT NULL COMMENT '文章缩略名',
  `content` text NOT NULL COMMENT '内容',
  `content_format` varchar(255) NOT NULL DEFAULT 'markdown' COMMENT '内容格式，为后期加入非 markdown 编辑器做准备',
  `meta_title` varchar(255) DEFAULT NULL COMMENT 'SEO 页面标题',
  `meta_description` varchar(255) DEFAULT NULL COMMENT 'SEO 页面描述',
  `meta_keywords` varchar(255) DEFAULT NULL COMMENT 'SEO 页面关键词',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `articles_title_unique` (`title`),
  UNIQUE KEY `articles_slug_unique` (`slug`),
  KEY `articles_user_id_index` (`user_id`),
  KEY `articles_category_id_index` (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文章' AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `jcd_articles`
--

INSERT INTO `jcd_articles` (`id`, `user_id`, `category_id`, `comments_count`, `title`, `slug`, `content`, `content_format`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, 0, '标题1', 'slug-biao-ti-1', '1、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(2, 2, 4, 0, '标题2', 'slug-biao-ti-2', '2、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(3, 3, 1, 0, '标题3', 'slug-biao-ti-3', '3、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器&hellip;&hellip;这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', '', '', '', '2014-10-11 11:45:01', '2014-10-14 07:56:15', NULL),
(4, 4, 2, 0, '标题4', 'slug-biao-ti-4', '4、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(5, 5, 3, 0, '标题5', 'slug-biao-ti-5', '5、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(6, 6, 4, 0, '标题6', 'slug-biao-ti-6', '6、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(7, 7, 5, 0, '标题7', 'slug-biao-ti-7', '7、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(8, 8, 2, 0, '标题8', 'slug-biao-ti-8', '8、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(9, 9, 3, 0, '标题9', 'slug-biao-ti-9', '9、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(10, 10, 4, 0, '标题10', 'slug-biao-ti-10', '10、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(11, 11, 5, 0, '标题11', 'slug-biao-ti-11', '11、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(12, 12, 2, 0, '标题12', 'slug-biao-ti-12', '12、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(13, 13, 3, 0, '标题13', 'slug-biao-ti-13', '13、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(14, 14, 4, 0, '标题14', 'slug-biao-ti-14', '14、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(15, 15, 5, 0, '标题15', 'slug-biao-ti-15', '15、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(16, 16, 2, 0, '标题16', 'slug-biao-ti-16', '16、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(17, 17, 3, 0, '标题17', 'slug-biao-ti-17', '17、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(18, 18, 4, 0, '标题18', 'slug-biao-ti-18', '18、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(19, 19, 5, 0, '标题19', 'slug-biao-ti-19', '19、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(20, 20, 2, 0, '标题20', 'slug-biao-ti-20', '20、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(21, 21, 3, 0, '标题21', 'slug-biao-ti-21', '21、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(22, 22, 4, 0, '标题22', 'slug-biao-ti-22', '22、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(23, 23, 5, 0, '标题23', 'slug-biao-ti-23', '23、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(24, 24, 2, 0, '标题24', 'slug-biao-ti-24', '24、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(25, 25, 3, 0, '标题25', 'slug-biao-ti-25', '25、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(26, 26, 4, 0, '标题26', 'slug-biao-ti-26', '26、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(27, 27, 5, 0, '标题27', 'slug-biao-ti-27', '27、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(28, 28, 2, 0, '标题28', 'slug-biao-ti-28', '28、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(29, 29, 3, 5, '标题29', 'slug-biao-ti-29', '29、什么是依赖\r\n每个项目都有依赖（外界提供的输入）, 项目越复杂，越需要更多的依赖。在现今的网络应用程序中，最常见的依赖是数据库，其风险在于，一旦数据库暂停运行，那么整个程序也因此而停止运行。这是因为代码依赖数据库服务器……这已足够。因为数据库服务器有时会崩溃，而弃用它是荒谬的。尽管依赖有其自身的瑕疵，却仍然存在代码中，因为它使程序开发人员的工作更加轻松。', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:06', NULL),
(30, 1, 2, 6, 'PSR-0 自动加载规范', 'psr-0', '下面描述了关于自动加载器特性强制性要求：\r\n\r\n强制性\r\n---------\r\n\r\n* 一个完全标准的命名空间必须要有以下的格式结构`\\<Vendor Name>\\(<Namespace>\\)*<Class Name>`\r\n* 命名空间必须有一个顶级的组织名称 ("Vendor Name").\r\n* 命名空间中可以根据情况使用任意数量的子空间\r\n* 从文件系统中加载源文件的时，命名空间中的分隔符将被映射为 `DIRECTORY_SEPARATOR`\r\n* 命名空间中的类名中的`_`没有特殊含义，也将被作为`DIRECTORY_SEPARATOR`对待.\r\n* 标准的命名空间和类从文件系统加载源文件时只需要加上`.php`后缀即可\r\n* 组织名，空间名，类名都可以随意使用大小写英文字符的组合\r\n\r\n示例\r\n--------\r\n\r\n* `\\Doctrine\\Common\\IsolatedClassLoader` => `/path/to/project/lib/vendor/Doctrine/Common/IsolatedClassLoader.php`\r\n* `\\Symfony\\Core\\Request` => `/path/to/project/lib/vendor/Symfony/Core/Request.php`\r\n* `\\Zend\\Acl` => `/path/to/project/lib/vendor/Zend/Acl.php`\r\n* `\\Zend\\Mail\\Message` => `/path/to/project/lib/vendor/Zend/Mail/Message.php`\r\n\r\n命名空间和类名中的下划线\r\n-----------------------------------------\r\n\r\n* `\\namespace\\package\\Class_Name` => `/path/to/project/lib/vendor/namespace/package/Class/Name.php`\r\n* `\\namespace\\package_name\\Class_Name` => `/path/to/project/lib/vendor/namespace/package_name/Class/Name.php`\r\n\r\n以上是我们为轻松实现自动加载特性设定的最低标准。你可以利用下面这个可以自动加载 PHP 5.3 类的SplClassLoader来测试你的代码是否符合以上这些标准。\r\n\r\n实例\r\n----------------------\r\n\r\n下面是一个函数实例简单展示如何使用上面建议的标准进行自动加载\r\n```php\r\n<?php\r\n\r\nfunction autoload($className)\r\n{\r\n    $className = ltrim($className, ''\\\\'');\r\n    $fileName  = '''';\r\n    $namespace = '''';\r\n    if ($lastNsPos = strrpos($className, ''\\\\'')) {\r\n        $namespace = substr($className, 0, $lastNsPos);\r\n        $className = substr($className, $lastNsPos + 1);\r\n        $fileName  = str_replace(''\\\\'', DIRECTORY_SEPARATOR, $namespace) . DIRECTORY_SEPARATOR;\r\n    }\r\n    $fileName .= str_replace(''_'', DIRECTORY_SEPARATOR, $className) . ''.php'';\r\n\r\n    require $fileName;\r\n}\r\n```\r\n\r\nSplClassLoader实现\r\n-----------------------------\r\n\r\n下面的gist是一个可以按照上面建议的自动加载特性来加载类的SplClassLoader实例。这也是我们当前在PHP5.3中依据以上标准加载类时推荐的方。\r\n\r\n* [http://gist.github.com/221634](http://gist.github.com/221634)\r\n\r\n\r\n', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:02', '2014-10-11 11:45:06', NULL),
(31, 1, 2, 6, 'PSR-1 基础编码规范', 'psr-1-basic-coding-standard', '基本代码规范\r\n=====================\r\n\r\n本节标准包含了成为标准代码所需要的基本元素，以确保开源出来的PHP代码之间有较高度的技术互用性。\r\n\r\n在 [RFC 2119][]中的特性关键词"必须"(MUST)，“不可”(MUST NOT)，“必要”(REQUIRED)，“将会”(SHALL)，“不会”(SHALL NOT)，“应当”(SHOULD)，“不应”(SHOULD NOT)，“推荐”(RECOMMENDED)，“可以”(MAY)和“可选”(OPTIONAL)在这文档中将被用来描述。\r\n\r\n[RFC 2119]: http://www.ietf.org/rfc/rfc2119.txt\r\n[PSR-0]: https://github.com/hfcorriez/fig-standards/blob/zh_CN/接受/PSR-0.md\r\n\r\n\r\n1. 大纲\r\n-----------\r\n\r\n- 源文件`必须`只使用 `<?php` 和 `<?=` 标签。\r\n\r\n- 源文件中`必须`只使用不带BOM的UTF-8作为PHP代码。\r\n\r\n- 源文件`应当`只声明符号（类，函数，常量等...）或者引起副作用（例如：生成输出，修改.ini配置等）,但`不应`同时做这两件事。\r\n\r\n- 命名空间和类`必须`遵守 [PSR-0][]。\r\n\r\n- 类名`必须`使用骆驼式`StudlyCaps`写法 (译者注：驼峰式的一种变种，后文将直接用`StudlyCaps`表示)。\r\n\r\n- 类中的常量`必须`使用全大写和下划线分隔符。\r\n\r\n- 方法名`必须`使用驼峰式`cameCase`写法(译者注：后文将直接用`camelCase`表示)。\r\n\r\n\r\n2. 文件\r\n--------\r\n\r\n### 2.1. PHP标签\r\n\r\nPHP代码`必须`只使用长标签`<?php ?>`或者短输出式`<?= ?>`标签；它`不可`使用其他的标签变种。\r\n\r\n### 2.2. 字符编码\r\n\r\nPHP代码`必须`只使用不带BOM的UTF-8。\r\n\r\n### 2.3. 副作用\r\n\r\n一个文件`应当`声明新符号 (类名，函数名，常量等)并且不产生副作用，或者`应当`执行有副作用的逻辑，但不能同时做这两件事。\r\n\r\n短语"副作用"意思是不直接执行逻辑的类，函数，常量等 *仅包括文件*\r\n\r\n“副作用”包含但不局限于：生成输出，显式地使用`require`或`include`，连接外部服务，修改ini配置，触发错误或异常，修改全局或者静态变量，读取或修改文件等等\r\n\r\n下面是一个既包含声明又有副作用的示例文件；即应避免的例子：\r\n\r\n```php\r\n<?php\r\n// side effect: change ini settings\r\nini_set(''error_reporting'', E_ALL);\r\n\r\n// side effect: loads a file\r\ninclude "file.php";\r\n\r\n// side effect: generates output\r\necho "<html>\\n";\r\n\r\n// declaration\r\nfunction foo()\r\n{\r\n    // function body\r\n}\r\n```\r\n\r\n下面是一个仅包含声明的示例文件；即需要提倡的例子：\r\n\r\n```php\r\n<?php\r\n// declaration\r\nfunction foo()\r\n{\r\n    // function body\r\n}\r\n\r\n// conditional declaration is *not* a side effect\r\nif (! function_exists(''bar'')) {\r\n    function bar()\r\n    {\r\n        // function body\r\n    }\r\n}\r\n```\r\n\r\n\r\n3. 命名空间和类名\r\n----------------------------\r\n\r\n命名空间和类名必须遵守 [PSR-0][].\r\n\r\n这意味着每个类必须单独一个源文件，并且至少有一级命名空间：顶级的组织名。\r\n\r\n类名必须使用骆驼式`StudlyCaps`写法。\r\n\r\nPHP5.3之后的代码`必须`使用正式的命名空间\r\n例子：\r\n\r\n```php\r\n<?php\r\n// PHP 5.3 and later:\r\nnamespace Vendor\\Model;\r\n\r\nclass Foo\r\n{\r\n}\r\n```\r\n\r\nPHP5.2.x之前的代码应当用伪命名空间`Vendor_`作为类名的前缀\r\n\r\n```php\r\n<?php\r\n// PHP 5.2.x and earlier:\r\nclass Vendor_Model_Foo\r\n{\r\n}\r\n```\r\n\r\n4. 类常量，属性和方法\r\n-------------------------------------------\r\n\r\n术语“类”指所有的类，接口和特性(traits)\r\n\r\n### 4.1. 常量\r\n\r\n类常量`必须`使用全大写，并使用分隔符作为下划线。\r\n例子：\r\n\r\n```php\r\n<?php\r\nnamespace Vendor\\Model;\r\n\r\nclass Foo\r\n{\r\n    const VERSION = ''1.0'';\r\n    const DATE_APPROVED = ''2012-06-01'';\r\n}\r\n```\r\n\r\n### 4.2. 属性\r\n\r\n本手册有意避免推荐使用`$StulyCaps`，`$camelCase`或者`unser_score`作为属性名字\r\n\r\n不管名称如何约定，它`应当`在一个合理范围内保持一致。这个范围可能是组织层，包层，类层，方法层。\r\n\r\n### 4.3. 方法\r\n\r\n方法名必须用`camelCase()`写法。\r\n', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:03', '2014-10-11 11:45:06', NULL);
INSERT INTO `jcd_articles` (`id`, `user_id`, `category_id`, `comments_count`, `title`, `slug`, `content`, `content_format`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`, `deleted_at`) VALUES
(32, 1, 2, 6, 'PSR-2 编码风格规范', 'psr-2-coding-style-guide', '代码样式规范\r\n==================\r\n\r\n本手册是 [PSR-1][]基础代码规范的继承和扩展\r\n\r\n本指南的意图是为了减少不同开发者在浏览代码时减少认知的差异。 为此列举一组如何格式化PHP代码的共用规则。\r\n\r\n各个成员项目的共性组成了本文的样式规则。当不同的开发者在不同的项目中合作时，将会在这些不同的项目中使用一个共同的标准。 因此，本指南的好处不在于规则本身，而在于共用这些规则。\r\n\r\n在 [RFC 2119][]中的特性关键词"必须"(MUST)，“不可”(MUST NOT)，“必要”(REQUIRED)，“将会”(SHALL)，“不会”(SHALL NOT)，“应当”(SHOULD)，“不应”(SHOULD NOT)，“推荐”(RECOMMENDED)，“可以”(MAY)和“可选”(OPTIONAL)在这文档中将被用来描述。\r\n\r\n[RFC 2119]: http://www.ietf.org/rfc/rfc2119.txt\r\n[PSR-0]: https://github.com/hfcorriez/fig-standards/blob/zh_CN/接受/PSR-0.md\r\n[PSR-1]: https://github.com/hfcorriez/fig-standards/blob/zh_CN/接受/PSR-1-basic-coding-standard.md\r\n\r\n\r\n1. 大纲\r\n-----------\r\n\r\n- 代码必须遵守 [PSR-1][]。\r\n\r\n- 代码`必须`使用4个空格的缩进，而不是制表符。\r\n\r\n- 一行代码长度`不应`硬性限制；软限制`必须`为120个字符；也`应当`是80个字符或者更少。\r\n\r\n- 在`namespace`声明下面`必须`有一个空行，并且`use`声明代码块下面也`必须`有一个空行。\r\n\r\n- 类的左花括号`必须`放到下一行，右花括号`必须`放在类主体的下一行。\r\n\r\n- 方法的左花括号`必须`放在下一行，右花括号`必须`放在方法主体下面。\r\n\r\n- 所有的属性和方法`必须`有可见性(译者注：Public, Protect, Private)声明；`abstract`和`final`声明`必须`在可见性之前；`static`声明`必须`在可见性之后。\r\n\r\n- 控制结构的关键词`必须`在后面有一个空格； 方法和函数`不可`有。\r\n\r\n- 控制结构的左花括号`必须`放在同一行，右花括号`必须`放在控制主体的下一行。\r\n\r\n- 控制结构的左括号后面`不可`有空格，右括号之前`不可`有空格。\r\n\r\n### 1.1. 示例\r\n\r\n本示例包含上面的一些规则简单展示：\r\n\r\n```php\r\n<?php\r\nnamespace Vendor\\Package;\r\n\r\nuse FooInterface;\r\nuse BarClass as Bar;\r\nuse OtherVendor\\OtherPackage\\BazClass;\r\n\r\nclass Foo extends Bar implements FooInterface\r\n{\r\n    public function sampleFunction($a, $b = null)\r\n    {\r\n        if ($a === $b) {\r\n            bar();\r\n        } elseif ($a > $b) {\r\n            $foo->bar($arg1);\r\n        } else {\r\n            BazClass::bar($arg2, $arg3);\r\n        }\r\n    }\r\n\r\n    final public static function bar()\r\n    {\r\n        // method body\r\n    }\r\n}\r\n```\r\n\r\n2. 概括\r\n----------\r\n\r\n### 2.1 基础代码规范\r\n\r\n代码`必须`遵守 [PSR-1][] 的所有规则。\r\n\r\n### 2.2 文件\r\n\r\n所有的PHP文件`必须`使用Unix LF(换行)作为行结束符。\r\n\r\n所有PHP文件`必须`以一个空行结束。\r\n\r\n纯PHP代码的文件关闭标签`?>``必须`省略\r\n\r\n### 2.3. 行\r\n\r\n行长度`不可`有硬限制。\r\n\r\n行长度的软限制`必须`是120个字符；对于软限制，自动样式检查器`必须`警告但`不可`报错。\r\n\r\n行实际长度`不应`超过80个字符；较长的行`应当`被拆分成多个不超过80个字符的后续行。\r\n\r\n在非空行后面`不可`有空格。\r\n\r\n空行`可以`用来改善可读性和区分相关的代码块。\r\n\r\n一行`不应`多于一个语句。\r\n\r\n### 2.4. 缩进\r\n\r\n代码`必须`使用4个空格的缩进，并且`不可`使用制表符作为缩进。\r\n\r\n> 注意：只用空格，不和制表符混合使用，将会对避免代码差异，补丁，历史和注解中的一些问题有帮助。使用空格还可以使调整细微的缩进来改进行间对齐变得非常简单。\r\n\r\n### 2.5. 关键词和 True/False/Null\r\n\r\nPHP [keywords][] `必须`使用小写。\r\n\r\nPHP常量`true`, `false`和`null``必须`使用小写。\r\n\r\n[keywords]: http://php.net/manual/en/reserved.keywords.php\r\n\r\n\r\n3. Namespace和Use声明\r\n---------------------------------\r\n\r\n如果存在，`namespace`声明之后`必须`有一个空行。\r\n\r\n如果存在，所有的`use`声明`必须`放在`namespace`声明的下面。\r\n\r\n一个`use`关键字`必须`只用于一个声明。\r\n\r\n在`use`声明代码块后面`必须`有一个空行。\r\n\r\n示例:\r\n\r\n```php\r\n<?php\r\nnamespace Vendor\\Package;\r\n\r\nuse FooClass;\r\nuse BarClass as Bar;\r\nuse OtherVendor\\OtherPackage\\BazClass;\r\n\r\n// ... additional PHP code ...\r\n\r\n```\r\n\r\n\r\n4. 类，属性和方法\r\n-----------------------------------\r\n\r\n术语“类”指所有的类，接口和特性（traits）。\r\n\r\n### 4.1. 扩展和继承\r\n\r\n一个类的`extends`和`implements`关键词`必须`和类名在同一行。\r\n\r\n类的左花括号`必须`放在下面自成一行；右花括号必须放在类主体的后面自成一行。\r\n\r\n\r\n```php\r\n<?php\r\nnamespace Vendor\\Package;\r\n\r\nuse FooClass;\r\nuse BarClass as Bar;\r\nuse OtherVendor\\OtherPackage\\BazClass;\r\n\r\nclass ClassName extends ParentClass implements \\ArrayAccess, \\Countable\r\n{\r\n    // constants, properties, methods\r\n}\r\n```\r\n\r\n`implements`一个列表`可以`被拆分为多个有一次缩进的后续行。如果这么做，列表的第一项`必须`要放在下一行，并且每行`必须`只有一个接口。\r\n\r\n```php\r\n<?php\r\nnamespace Vendor\\Package;\r\n\r\nuse FooClass;\r\nuse BarClass as Bar;\r\nuse OtherVendor\\OtherPackage\\BazClass;\r\n\r\nclass ClassName extends ParentClass implements\r\n    \\ArrayAccess,\r\n    \\Countable,\r\n    \\Serializable\r\n{\r\n    // constants, properties, methods\r\n}\r\n```\r\n\r\n### 4.2. 属性\r\n\r\n所有的属性`必须`声明可见性。\r\n\r\n`var`关键词`不可`用来声明属性。\r\n\r\n一个语句`不可`声明多个属性。\r\n\r\n属性名称`不应`使用单个下划线作为前缀来表明保护或私有的可见性。\r\n\r\n一个属性声明看起来应该下面这样的。\r\n\r\n```php\r\n<?php\r\nnamespace Vendor\\Package;\r\n\r\nclass ClassName\r\n{\r\n    public $foo = null;\r\n}\r\n```\r\n\r\n### 4.3. 方法\r\n\r\n所有的方法`必须`声明可见性。\r\n\r\n方法名`不应`只使用单个下划线来表明是保护或私有的可见性。\r\n\r\n方法名在声明之后`不可`跟随一个空格。左花括号`必须`放在下面自成一行，并且右花括号`必须`放在方法主体的下面自成一行。左括号后面`不可`有空格，右括号前面`不可`有空格。\r\n\r\n一个方法定义看来应该像下面这样。 注意括号，逗号，空格和花括号：\r\n\r\n```php\r\n<?php\r\nnamespace Vendor\\Package;\r\n\r\nclass ClassName\r\n{\r\n    public function fooBarBaz($arg1, &$arg2, $arg3 = [])\r\n    {\r\n        // method body\r\n    }\r\n}\r\n```\r\n\r\n### 4.4. 方法参数\r\n\r\n在参数列表中，逗号之前`不可`有空格，逗号之后`必须`要有一个空格。\r\n\r\n方法中有默认值的参数必须放在参数列表的最后面。\r\n\r\n```php\r\n<?php\r\nnamespace Vendor\\Package;\r\n\r\nclass ClassName\r\n{\r\n    public function foo($arg1, &$arg2, $arg3 = [])\r\n    {\r\n        // method body\r\n    }\r\n}\r\n```\r\n\r\n参数列表`可以`被分为多个有一次缩进的多个后续行。如果这么做，列表的第一项`必须`放在下一行，并且每行`必须`只放一个参数。\r\n\r\n当参数列表被分为多行，右括号和左花括号`必须`夹带一个空格放在一起自成一行。\r\n\r\n```php\r\n<?php\r\nnamespace Vendor\\Package;\r\n\r\nclass ClassName\r\n{\r\n    public function aVeryLongMethodName(\r\n        ClassTypeHint $arg1,\r\n        &$arg2,\r\n        array $arg3 = []\r\n    ) {\r\n        // method body\r\n    }\r\n}\r\n```\r\n\r\n### 4.5. `abstract`，`final`和 `static`\r\n\r\n如果存在，`abstract`和`final`声明必须放在可见性声明前面。\r\n\r\n如果存在，`static`声明`必须`跟着可见性声明。\r\n\r\n```php\r\n<?php\r\nnamespace Vendor\\Package;\r\n\r\nabstract class ClassName\r\n{\r\n    protected static $foo;\r\n\r\n    abstract protected function zim();\r\n\r\n    final public static function bar()\r\n    {\r\n        // method body\r\n    }\r\n}\r\n```\r\n\r\n### 4.6. 调用方法和函数\r\n\r\n要调用一个方法或函数，在方法或者函数名和左括号之间`不可`有空格，左括号之后`不可`有空格，右括号之前`不可`有空格。函数列表中，逗号之前`不可`有空格，逗号之后`必须`有一个空格。\r\n\r\n```php\r\n<?php\r\nbar();\r\n$foo->bar($arg1);\r\nFoo::bar($arg2, $arg3);\r\n```\r\n\r\n参数列表`可以`被拆分成多个有一个缩进的后续行。如果这么做，列表中的第一项必须放在下一行，并且每一行`必须`只有一个参数。\r\n\r\n```php\r\n<?php\r\n$foo->bar(\r\n    $longArgument,\r\n    $longerArgument,\r\n    $muchLongerArgument\r\n);\r\n```\r\n\r\n5. 控制结构\r\n---------------------\r\n\r\n对于控制结构的样式规则概括如下：\r\n\r\n- 控制结构关键词之后`必须`有一个空格\r\n- 左括号之后`不可`有空格\r\n- 右括号之前`不可`有空格\r\n- 在右括号和左花括号之间`必须`有一个空格\r\n- 代码主体`必须`有一次缩进\r\n- 右花括号`必须`主体的下一行\r\n\r\n每个结构的主体`必须`被括在花括号里。这结构看上去更标准化，并且当加新行的时候可以减少引入错误的可能性。\r\n\r\n### 5.1. `if`，`elseif`，`else`\r\n\r\n一个`if`结构看起来应该像下面这样。注意括号，空格，花括号的位置；并且`else`和`elseif`和前一个主体的右花括号在同一行。\r\n\r\n```php\r\n<?php\r\nif ($expr1) {\r\n    // if body\r\n} elseif ($expr2) {\r\n    // elseif body\r\n} else {\r\n    // else body;\r\n}\r\n```\r\n\r\n关键词`elseif``应该`替代`else if`使用以保持所有的控制关键词像一个单词。\r\n\r\n\r\n### 5.2. `switch`，`case`\r\n\r\n一个`switch`结构看起来应该像下面这样。注意括号，空格和花括号。`case`语句必须从`switch`处缩进，并且`break`关键字（或其他中止关键字）`必须`和`case`主体缩进在同级。如果一个非空的`case`主体往下落空则`必须`有一个类似`// no break`的注释。\r\n\r\n```php\r\n<?php\r\nswitch ($expr) {\r\n    case 0:\r\n        echo ''First case, with a break'';\r\n        break;\r\n    case 1:\r\n        echo ''Second case, which falls through'';\r\n        // no break\r\n    case 2:\r\n    case 3:\r\n    case 4:\r\n        echo ''Third case, return instead of break'';\r\n        return;\r\n    default:\r\n        echo ''Default case'';\r\n        break;\r\n}\r\n```\r\n\r\n\r\n### 5.3. `while`，`do while`\r\n\r\n一个`while`语句看起来应该像下面这样。注意括号，空格和花括号的位置。\r\n\r\n```php\r\n<?php\r\nwhile ($expr) {\r\n    // structure body\r\n}\r\n```\r\n\r\n同样的，一个`do while`语句看起来应该像下面这样。注意括号，空格和花括号的位置。\r\n\r\n```php\r\n<?php\r\ndo {\r\n    // structure body;\r\n} while ($expr);\r\n```\r\n\r\n### 5.4. `for`\r\n\r\n一个`for`语句看起来应该像下面这样。注意括号，空格和花括号的位置。\r\n\r\n```php\r\n<?php\r\nfor ($i = 0; $i < 10; $i++) {\r\n    // for body\r\n}\r\n```\r\n\r\n### 5.5. `foreach`\r\n\r\n一个`foreach`语句看起来应该像下面这样。注意括号，空格和花括号的位置。\r\n\r\n```php\r\n<?php\r\nforeach ($iterable as $key => $value) {\r\n    // foreach body\r\n}\r\n```\r\n\r\n### 5.6. `try`, `catch`\r\n\r\n一个`try catch`语句看起来应该像下面这样。注意括号，空格和花括号的位置。\r\n\r\n```php\r\n<?php\r\ntry {\r\n    // try body\r\n} catch (FirstExceptionType $e) {\r\n    // catch body\r\n} catch (OtherExceptionType $e) {\r\n    // catch body\r\n}\r\n```\r\n\r\n6. 闭包\r\n-----------\r\n\r\n闭包在声明时`function`关键词之后`必须`有一个空格，并且`use`之前也需要一个空格。\r\n\r\n左花括号`必须`在同一行，右花括号`必须`在主体的下一行。\r\n\r\n参数列表和变量列表的左括号之后`不可`有空格，其右括号之前也`不可`有空格。\r\n\r\n在参数列表和变量列表中，逗号之前`不可`有空格，逗号之后`必须`有空格。\r\n\r\n闭包带默认值的参数`必须`放在参数列表后面。\r\n\r\n一个闭包声明看起来应该像下面这样。注意括号，空格和花括号的位置。\r\n\r\n```php\r\n<?php\r\n$closureWithArgs = function ($arg1, $arg2) {\r\n    // body\r\n};\r\n\r\n$closureWithArgsAndVars = function ($arg1, $arg2) use ($var1, $var2) {\r\n    // body\r\n};\r\n```\r\n\r\n参数和变量列表`可以`被分成多个带一次缩进的后续行。如果这么做，列表的第一项`必须`放在下一行，并且一行`必须`只放一个参数或变量。\r\n\r\n当最终列表（不管是参数还是变量）被分成多行，右括号和左花括号`必须`夹带一个空格放在一起自成一行。\r\n\r\n下面是一个参数和变量列表被分割成多行的示例。\r\n\r\n```php\r\n<?php\r\n$longArgs_noVars = function (\r\n    $longArgument,\r\n    $longerArgument,\r\n    $muchLongerArgument\r\n) {\r\n   // body\r\n};\r\n\r\n$noArgs_longVars = function () use (\r\n    $longVar1,\r\n    $longerVar2,\r\n    $muchLongerVar3\r\n) {\r\n   // body\r\n};\r\n\r\n$longArgs_longVars = function (\r\n    $longArgument,\r\n    $longerArgument,\r\n    $muchLongerArgument\r\n) use (\r\n    $longVar1,\r\n    $longerVar2,\r\n    $muchLongerVar3\r\n) {\r\n   // body\r\n};\r\n\r\n$longArgs_shortVars = function (\r\n    $longArgument,\r\n    $longerArgument,\r\n    $muchLongerArgument\r\n) use ($var1) {\r\n   // body\r\n};\r\n\r\n$shortArgs_longVars = function ($arg) use (\r\n    $longVar1,\r\n    $longerVar2,\r\n    $muchLongerVar3\r\n) {\r\n   // body\r\n};\r\n```\r\n\r\n注意如果在函数或者方法中把闭包作为一个参数调用，如上格式规则同样适用。\r\n\r\n```php\r\n<?php\r\n$foo->bar(\r\n    $arg1,\r\n    function ($arg2) use ($var1) {\r\n        // body\r\n    },\r\n    $arg3\r\n);\r\n```\r\n\r\n\r\n7. 结论\r\n--------------\r\n\r\n在该指南中有很多风格的元素和做法有意被忽略掉。这些包括但不局限于：\r\n\r\n- 全局变量和全局常量的声明\r\n\r\n- 方法声明\r\n\r\n- 操作符和赋值\r\n\r\n- 行间对齐\r\n\r\n- 注释和文档块\r\n\r\n- 类名给你前缀和后缀\r\n\r\n- 最佳实践\r\n\r\n以后的建议`可以`修改和扩展该指南以满足这些或其他风格的元素和实践。\r\n\r\n附录A 调查\r\n------------------\r\n\r\n为了写这个风格指南，我们采用了调查个项目以确定共同的做法。这个调查在这里供他人查看。\r\n\r\n### A.1. 调查数据\r\n\r\n    url,http://www.horde.org/apps/horde/docs/CODING_STANDARDS,http://pear.php.net/manual/en/standards.php,http://solarphp.com/manual/appendix-standards.style,http://framework.zend.com/manual/en/coding-standard.html,http://symfony.com/doc/2.0/contributing/code/standards.html,http://www.ppi.io/docs/coding-standards.html,https://github.com/ezsystems/ezp-next/wiki/codingstandards,http://book.cakephp.org/2.0/en/contributing/cakephp-coding-conventions.html,https://github.com/UnionOfRAD/lithium/wiki/Spec%3A-Coding,http://drupal.org/coding-standards,http://code.google.com/p/sabredav/,http://area51.phpbb.com/docs/31x/coding-guidelines.html,https://docs.google.com/a/zikula.org/document/edit?authkey=CPCU0Us&hgd=1&id=1fcqb93Sn-hR9c0mkN6m_tyWnmEvoswKBtSc0tKkZmJA,http://www.chisimba.com,n/a,https://github.com/Respect/project-info/blob/master/coding-standards-sample.php,n/a,Object Calisthenics for PHP,http://doc.nette.org/en/coding-standard,http://flow3.typo3.org,https://github.com/propelorm/Propel2/wiki/Coding-Standards,http://developer.joomla.org/coding-standards.html\r\n    voting,yes,yes,yes,yes,yes,yes,yes,yes,yes,yes,yes,yes,yes,yes,yes,no,no,no,?,yes,no,yes\r\n    indent_type,4,4,4,4,4,tab,4,tab,tab,2,4,tab,4,4,4,4,4,4,tab,tab,4,tab\r\n    line_length_limit_soft,75,75,75,75,no,85,120,120,80,80,80,no,100,80,80,?,?,120,80,120,no,150\r\n    line_length_limit_hard,85,85,85,85,no,no,no,no,100,?,no,no,no,100,100,?,120,120,no,no,no,no\r\n    class_names,studly,studly,studly,studly,studly,studly,studly,studly,studly,studly,studly,lower_under,studly,lower,studly,studly,studly,studly,?,studly,studly,studly\r\n    class_brace_line,next,next,next,next,next,same,next,same,same,same,same,next,next,next,next,next,next,next,next,same,next,next\r\n    constant_names,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper\r\n    true_false_null,lower,lower,lower,lower,lower,lower,lower,lower,lower,upper,lower,lower,lower,upper,lower,lower,lower,lower,lower,upper,lower,lower\r\n    method_names,camel,camel,camel,camel,camel,camel,camel,camel,camel,camel,camel,lower_under,camel,camel,camel,camel,camel,camel,camel,camel,camel,camel\r\n    method_brace_line,next,next,next,next,next,same,next,same,same,same,same,next,next,same,next,next,next,next,next,same,next,next\r\n    control_brace_line,same,same,same,same,same,same,next,same,same,same,same,next,same,same,next,same,same,same,same,same,same,next\r\n    control_space_after,yes,yes,yes,yes,yes,no,yes,yes,yes,yes,no,yes,yes,yes,yes,yes,yes,yes,yes,yes,yes,yes\r\n    always_use_control_braces,yes,yes,yes,yes,yes,yes,no,yes,yes,yes,no,yes,yes,yes,yes,no,yes,yes,yes,yes,yes,yes\r\n    else_elseif_line,same,same,same,same,same,same,next,same,same,next,same,next,same,next,next,same,same,same,same,same,same,next\r\n    case_break_indent_from_switch,0/1,0/1,0/1,1/2,1/2,1/2,1/2,1/1,1/1,1/2,1/2,1/1,1/2,1/2,1/2,1/2,1/2,1/2,0/1,1/1,1/2,1/2\r\n    function_space_after,no,no,no,no,no,no,no,no,no,no,no,no,no,no,no,no,no,no,no,no,no,no\r\n    closing_php_tag_required,no,no,no,no,no,no,no,no,yes,no,no,no,no,yes,no,no,no,no,no,yes,no,no\r\n    line_endings,LF,LF,LF,LF,LF,LF,LF,LF,?,LF,?,LF,LF,LF,LF,?,,LF,?,LF,LF,LF\r\n    static_or_visibility_first,static,?,static,either,either,either,visibility,visibility,visibility,either,static,either,?,visibility,?,?,either,either,visibility,visibility,static,?\r\n    control_space_parens,no,no,no,no,no,no,yes,no,no,no,no,no,no,yes,?,no,no,no,no,no,no,no\r\n    blank_line_after_php,no,no,no,no,yes,no,no,no,no,yes,yes,no,no,yes,?,yes,yes,no,yes,no,yes,no\r\n    class_method_control_brace,next/next/same,next/next/same,next/next/same,next/next/same,next/next/same,same/same/same,next/next/next,same/same/same,same/same/same,same/same/same,same/same/same,next/next/next,next/next/same,next/same/same,next/next/next,next/next/same,next/next/same,next/next/same,next/next/same,same/same/same,next/next/same,next/next/next\r\n\r\n### A.2. 调查说明\r\n\r\n`indent_type`:\r\n缩进类型。 `tab` = "使用制表符"，`2` or `4` = "空格数量"\r\n\r\n`line_length_limit_soft`:\r\n行长度的“软”限制，用字符。 `?` = 不表示或者数字 `no` 意为不限制.\r\n\r\n`line_length_limit_hard`:\r\n行长度的"硬"限制，用字符。 `?` = 不表示或者数字, `no` 意为不限制.\r\n\r\n`class_names`:\r\n类名如何命名 `lower` = 只是小写, `lower_under` = 小写加下划线, `studly` = 骆驼型.\r\n\r\n`class_brace_line`:\r\n类的左花括号是放在同(`same`)一行还是在下(`next`)一行？\r\n\r\n`constant_names`:\r\n类常量如何命名？`upper` = 大写加下划线分隔符。\r\n\r\n`true_false_null`:\r\n全校写或者全大写？\r\n\r\n`method_names`:\r\n方法名如何命名？`camel` = `驼峰式`, `lower_under` = 小写加下划线分隔符。\r\n\r\n`method_brace_line`:\r\n方法的左花括号在同(`same`)一行还是在下(`next`)一行？\r\n\r\n`control_brace_line`:\r\n控制结构的左花括号在同(`same`)一行还是在下(`next`)一行？\r\n\r\n`control_space_after`:\r\n控制结构关键词后是否有空格？\r\n\r\n`always_use_control_braces`:\r\n控制结构总是使用花括号？\r\n\r\n`else_elseif_line`:\r\n当使用`else`和`elseif`，是否放在同(`same`)一行还是在下(`next`)一行？\r\n\r\n`case_break_indent_from_switch`:\r\n`case`和`break`分别从`swith`语句处缩进多少次？\r\n\r\n`function_space_after`:\r\n函数调用的函数名和左括号是否有空格？\r\n\r\n`closing_php_tag_required`:\r\n如过是纯PHP文件，关闭标签`?>`是否需要？\r\n\r\n`line_endings`:\r\n使用何种的行结束符？\r\n\r\n`static_or_visibility_first`:\r\n在定义方法的时候`static`和可见性谁在前面？\r\n\r\n`control_space_parens`:\r\n在控制结构表达式中，左括号后面和右括号前面是否要有一个空格？`yes` = `if ( $expr )`, `no` = `if ($expr)`.\r\n\r\n`blank_line_after_php`:\r\nPHP的开始标签后面是否需要一个空行？\r\n\r\n`class_method_control_brace`:\r\n左花括号在类，方法和控制结构中的位置。\r\n\r\n### A.3. 调查结果\r\n\r\n    indent_type:\r\n        tab: 7\r\n        2: 1\r\n        4: 14\r\n    line_length_limit_soft:\r\n        ?: 2\r\n        no: 3\r\n        75: 4\r\n        80: 6\r\n        85: 1\r\n        100: 1\r\n        120: 4\r\n        150: 1\r\n    line_length_limit_hard:\r\n        ?: 2\r\n        no: 11\r\n        85: 4\r\n        100: 3\r\n        120: 2\r\n    class_names:\r\n        ?: 1\r\n        lower: 1\r\n        lower_under: 1\r\n        studly: 19\r\n    class_brace_line:\r\n        next: 16\r\n        same: 6\r\n    constant_names:\r\n        upper: 22\r\n    true_false_null:\r\n        lower: 19\r\n        upper: 3\r\n    method_names:\r\n        camel: 21\r\n        lower_under: 1\r\n    method_brace_line:\r\n        next: 15\r\n        same: 7\r\n    control_brace_line:\r\n        next: 4\r\n        same: 18\r\n    control_space_after:\r\n        no: 2\r\n        yes: 20\r\n    always_use_control_braces:\r\n        no: 3\r\n        yes: 19\r\n    else_elseif_line:\r\n        next: 6\r\n        same: 16\r\n    case_break_indent_from_switch:\r\n        0/1: 4\r\n        1/1: 4\r\n        1/2: 14\r\n    function_space_after:\r\n        no: 22\r\n    closing_php_tag_required:\r\n        no: 19\r\n        yes: 3\r\n    line_endings:\r\n        ?: 5\r\n        LF: 17\r\n    static_or_visibility_first:\r\n        ?: 5\r\n        either: 7\r\n        static: 4\r\n        visibility: 6\r\n    control_space_parens:\r\n        ?: 1\r\n        no: 19\r\n        yes: 2\r\n    blank_line_after_php:\r\n        ?: 1\r\n        no: 13\r\n        yes: 8\r\n    class_method_control_brace:\r\n        next/next/next: 4\r\n        next/next/same: 11\r\n        next/same/same: 1\r\n        same/same/same: 6\r\n', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:04', '2014-10-11 11:45:06', NULL),
(33, 1, 2, 6, 'PSR-3 日志接口规范', 'psr-3-logger-interface', '日志接口\r\n================\r\n\r\n本文档用来描述日志类库的通用接口。\r\n\r\n主要目标是让类库获得一个`Psr\\Log\\LoggerInterface`对象并且使用一个简单通用的方式来写日志。有自定义需求的框架和CMS`可以`根据情况扩展这个接口，但`应当`保持和该文档的兼容性，这将确保使用第三方库和应用能统一的写应用日志。\r\n\r\nThe key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD",\r\n"SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be\r\ninterpreted as described in [RFC 2119][].\r\n\r\n关键词`实现者`在这个文档被解释为：在日志相关的库和框架实现`LoggerInterface`接口的人。用这些实现的人都被称作`用户`。\r\n\r\n[RFC 2119]: http://tools.ietf.org/html/rfc2119\r\n\r\n1. 规范\r\n-----------------\r\n\r\n### 1.1 基础\r\n\r\n- `LoggerInterface`暴露八个接口用来记录八个等级(debug, info, notice, warning, error, critical, alert, emergency)的日志。\r\n\r\n- 第九个方法是`log`，接受日志等级作为第一个参数。用一个日志等级常量来调用这个方法的结果`必须`和调用具体等级方法的一致。如果具体的实现不知道传入的不按规范的等级来调用这个方法`必须`抛出一个`Psr\\Log\\InvalidArgumentException`。用户`不应`自定义一个当前不支持的未知等级。\r\n\r\n[RFC 5424]: http://tools.ietf.org/html/rfc5424\r\n\r\n### 1.2 消息\r\n\r\n- 每个方法都接受字符串，或者有`__toString`方法的对象作为消息。实现者可以对传入的对象有特殊的处理。如果不是，实现者`必须`将它转换成字符串。\r\n\r\n- 消息`可以`包含`可以`被上下文数组的数值替换的占位符。\r\n\r\n  占位符名字`必须`和上下文数组键名对应。\r\n\r\n  占位符名字`必须`使用使用一对花括号为分隔。在占位符和分隔符之间`不能`有任何空格。\r\n\r\n  占位符名字`应该`由`A-Z`，`a-z`，`0-9`，下划线`_`和句号`.`。其它的字符作为以后占位符规范的保留。\r\n\r\n  实现者可以使用占位符来实现不同的转义和翻译日志成文。用户在不知道上下文数据是什么的时候`不应`提前转义占位符。\r\n\r\n  下面提供一个占位符替换的例子，仅作为参考：\r\n\r\n  ```php\r\n  /**\r\n   * Interpolates context values into the message placeholders.\r\n   */\r\n  function interpolate($message, array $context = array())\r\n  {\r\n      // build a replacement array with braces around the context keys\r\n      $replace = array();\r\n      foreach ($context as $key => $val) {\r\n          $replace[''{'' . $key . ''}''] = $val;\r\n      }\r\n\r\n      // interpolate replacement values into the message and return\r\n      return strtr($message, $replace);\r\n  }\r\n\r\n  // a message with brace-delimited placeholder names\r\n  $message = "User {username} created";\r\n\r\n  // a context array of placeholder names => replacement values\r\n  $context = array(''username'' => ''bolivar'');\r\n\r\n  // echoes "Username bolivar created"\r\n  echo interpolate($message, $context);\r\n  ```\r\n\r\n### 1.3 上下文\r\n\r\n- 每个方法接受一个数组作为上下文数据，用来存储不适合在字符串中填充的信息。数组可以包括任何东西。实现者`必须`确保他们对上下文数据足够的掌控。在上下文中一个给定值`不可`抛出一个异常，也`不可`产生任何PHP错误，警告或者提醒。\r\n\r\n- 如果在上下文中传入了一个`异常`对象，它必须以`exception`作为键名。记录异常轨迹是通用的模式，如果日志底层支持这样也是可以被允许的。实现者在使用它之前`必须`验证`exception`的键值是不是一个`异常`对象，因为它`可以`允许是任何东西。\r\n\r\n### 1.4 助手类和接口\r\n\r\n- `Psr\\Log\\AbstractLogger`类让你非常简单的实现和扩展`LoggerInterface`接口以实现通用的`log`方法。其他八个方法将会把消息和上下文转发给它。\r\n\r\n- 类似的，使用`Psr\\Log\\LoggerTrait`只需要你实现通用的`log`方法。记住traits不能实现接口前，你依然需要`implement LoggerInterface`。\r\n\r\n- `Psr\\Log\\NullLogger`是和接口一个提供的。它`可以`为使用接口的用户提供一个后备的“黑洞”。如果上下文数据非常重要，这不失为一个记录日志更好的办法。\r\n\r\n- `Psr\\Log\\LoggerAwareInterface`只有一个`setLogger(LoggerInterface $logger)`方法可以用来随意设置一个日志记录器。\r\n\r\n- `Psr\\Log\\LoggerAwareTrait`trait可以更简单的实现等价于接口。通过它可以访问到`$this->logger`。\r\n\r\n- `Psr\\Log\\LogLevel`类拥有八个等级的常量。\r\n\r\n2. 包\r\n----------\r\n\r\n作为[psr/log](https://packagist.org/packages/psr/log) 的一部分，提供接口和相关异常类的一些描述以及一些测试单元用来验证你的实现。\r\n\r\n3. `Psr\\Log\\LoggerInterface`\r\n----------------------------\r\n\r\n```php\r\n<?php\r\n\r\nnamespace Psr\\Log;\r\n\r\n/**\r\n * Describes a logger instance\r\n *\r\n * The message MUST be a string or object implementing __toString().\r\n *\r\n * The message MAY contain placeholders in the form: {foo} where foo\r\n * will be replaced by the context data in key "foo".\r\n *\r\n * The context array can contain arbitrary data, the only assumption that\r\n * can be made by implementors is that if an Exception instance is given\r\n * to produce a stack trace, it MUST be in a key named "exception".\r\n *\r\n * See https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-3-logger-interface.md\r\n * for the full interface specification.\r\n */\r\ninterface LoggerInterface\r\n{\r\n    /**\r\n     * System is unusable.\r\n     *\r\n     * @param string $message\r\n     * @param array $context\r\n     * @return null\r\n     */\r\n    public function emergency($message, array $context = array());\r\n\r\n    /**\r\n     * Action must be taken immediately.\r\n     *\r\n     * Example: Entire website down, database unavailable, etc. This should\r\n     * trigger the SMS alerts and wake you up.\r\n     *\r\n     * @param string $message\r\n     * @param array $context\r\n     * @return null\r\n     */\r\n    public function alert($message, array $context = array());\r\n\r\n    /**\r\n     * Critical conditions.\r\n     *\r\n     * Example: Application component unavailable, unexpected exception.\r\n     *\r\n     * @param string $message\r\n     * @param array $context\r\n     * @return null\r\n     */\r\n    public function critical($message, array $context = array());\r\n\r\n    /**\r\n     * Runtime errors that do not require immediate action but should typically\r\n     * be logged and monitored.\r\n     *\r\n     * @param string $message\r\n     * @param array $context\r\n     * @return null\r\n     */\r\n    public function error($message, array $context = array());\r\n\r\n    /**\r\n     * Exceptional occurrences that are not errors.\r\n     *\r\n     * Example: Use of deprecated APIs, poor use of an API, undesirable things\r\n     * that are not necessarily wrong.\r\n     *\r\n     * @param string $message\r\n     * @param array $context\r\n     * @return null\r\n     */\r\n    public function warning($message, array $context = array());\r\n\r\n    /**\r\n     * Normal but significant events.\r\n     *\r\n     * @param string $message\r\n     * @param array $context\r\n     * @return null\r\n     */\r\n    public function notice($message, array $context = array());\r\n\r\n    /**\r\n     * Interesting events.\r\n     *\r\n     * Example: User logs in, SQL logs.\r\n     *\r\n     * @param string $message\r\n     * @param array $context\r\n     * @return null\r\n     */\r\n    public function info($message, array $context = array());\r\n\r\n    /**\r\n     * Detailed debug information.\r\n     *\r\n     * @param string $message\r\n     * @param array $context\r\n     * @return null\r\n     */\r\n    public function debug($message, array $context = array());\r\n\r\n    /**\r\n     * Logs with an arbitrary level.\r\n     *\r\n     * @param mixed $level\r\n     * @param string $message\r\n     * @param array $context\r\n     * @return null\r\n     */\r\n    public function log($level, $message, array $context = array());\r\n}\r\n```\r\n\r\n4. `Psr\\Log\\LoggerAwareInterface`\r\n---------------------------------\r\n\r\n```php\r\n<?php\r\n\r\nnamespace Psr\\Log;\r\n\r\n/**\r\n * Describes a logger-aware instance\r\n */\r\ninterface LoggerAwareInterface\r\n{\r\n    /**\r\n     * Sets a logger instance on the object\r\n     *\r\n     * @param LoggerInterface $logger\r\n     * @return null\r\n     */\r\n    public function setLogger(LoggerInterface $logger);\r\n}\r\n```\r\n\r\n5. `Psr\\Log\\LogLevel`\r\n---------------------\r\n\r\n```php\r\n<?php\r\n\r\nnamespace Psr\\Log;\r\n\r\n/**\r\n * Describes log levels\r\n */\r\nclass LogLevel\r\n{\r\n    const EMERGENCY = ''emergency'';\r\n    const ALERT     = ''alert'';\r\n    const CRITICAL  = ''critical'';\r\n    const ERROR     = ''error'';\r\n    const WARNING   = ''warning'';\r\n    const NOTICE    = ''notice'';\r\n    const INFO      = ''info'';\r\n    const DEBUG     = ''debug'';\r\n}\r\n```\r\n', 'markdown', NULL, NULL, NULL, '2014-10-11 11:45:05', '2014-10-11 11:45:06', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `jcd_article_categories`
--

CREATE TABLE IF NOT EXISTS `jcd_article_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `slug` varchar(255) NOT NULL,
  `enname` varchar(255) NOT NULL,
  `abbr` varchar(255) NOT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_categories_name_unique` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文章分类' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `jcd_article_categories`
--

INSERT INTO `jcd_article_categories` (`id`, `name`, `slug`, `enname`, `abbr`, `sort_order`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '视觉规范', 'design', 'VISUAL DESIGN SPECS', 'VD', 0, '2014-10-11 11:44:55', '2014-10-14 09:47:02', NULL),
(2, '交互规范', 'Interaction', 'INTERACTION DESIGN SPECS', 'ID', 1, '2014-10-11 11:45:01', '2014-10-14 09:47:45', NULL),
(3, '前端规范', 'frontdevelop', 'FRONT END SPECS', 'FD', 2, '2014-10-11 11:45:01', '2014-10-14 09:48:19', NULL),
(4, '新分类三', '', '', '', 3, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(5, '新分类四', '', '', '', 4, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(6, '新分类五', '', '', '', 5, '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `jcd_article_comments`
--

CREATE TABLE IF NOT EXISTS `jcd_article_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '作者ID',
  `article_id` int(10) unsigned NOT NULL COMMENT '归属文章ID',
  `content` text NOT NULL COMMENT '内容',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_comments_user_id_index` (`user_id`),
  KEY `article_comments_article_id_index` (`article_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文章的评论' AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `jcd_article_comments`
--

INSERT INTO `jcd_article_comments` (`id`, `user_id`, `article_id`, `content`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 30, '评论内容1', '2014-10-11 11:45:05', '2014-10-11 11:45:05', NULL),
(2, 2, 31, '评论内容2', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(3, 3, 32, '评论内容3', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(4, 4, 33, '评论内容4', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(5, 5, 29, '评论内容5', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(6, 6, 30, '评论内容6', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(7, 7, 31, '评论内容7', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(8, 8, 32, '评论内容8', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(9, 9, 33, '评论内容9', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(10, 10, 29, '评论内容10', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(11, 11, 30, '评论内容11', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(12, 12, 31, '评论内容12', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(13, 13, 32, '评论内容13', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(14, 14, 33, '评论内容14', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(15, 15, 29, '评论内容15', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(16, 16, 30, '评论内容16', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(17, 17, 31, '评论内容17', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(18, 18, 32, '评论内容18', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(19, 19, 33, '评论内容19', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(20, 20, 29, '评论内容20', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(21, 21, 30, '评论内容21', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(22, 22, 31, '评论内容22', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(23, 23, 32, '评论内容23', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(24, 24, 33, '评论内容24', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(25, 25, 29, '评论内容25', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(26, 26, 30, '评论内容26', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(27, 27, 31, '评论内容27', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(28, 28, 32, '评论内容28', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL),
(29, 29, 33, '评论内容29', '2014-10-11 11:45:06', '2014-10-11 11:45:06', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `jcd_migrations`
--

CREATE TABLE IF NOT EXISTS `jcd_migrations` (
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `jcd_migrations`
--

INSERT INTO `jcd_migrations` (`migration`, `batch`) VALUES
('2014_09_09_135540_create_authority_tables', 1),
('2014_09_09_141726_create_blog_tables', 1),
('2014_10_14_163834_add_slug_enname_to_categories_table', 2),
('2014_10_14_163836_add_slug_enname_to_categories_table', 3);

-- --------------------------------------------------------

--
-- 表的结构 `jcd_password_reminders`
--

CREATE TABLE IF NOT EXISTS `jcd_password_reminders` (
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `token` varchar(255) NOT NULL COMMENT '令牌',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE KEY `password_reminders_token_unique` (`token`),
  KEY `password_reminders_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='密码重置';

-- --------------------------------------------------------

--
-- 表的结构 `jcd_users`
--

CREATE TABLE IF NOT EXISTS `jcd_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `portrait` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `remember_token` varchar(255) DEFAULT NULL COMMENT '记住登陆状态的令牌',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否管理员',
  `signin_at` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `activated_at` timestamp NULL DEFAULT NULL COMMENT '邮箱激活时间',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `jcd_users`
--

INSERT INTO `jcd_users` (`id`, `email`, `password`, `portrait`, `remember_token`, `is_admin`, `signin_at`, `activated_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin@jd.com', '$2y$10$0BzdLEdj6sPr8Q56L7DC4Op1Kt8lcYLB1EBrP/5TA9aVzndTi30O.', NULL, NULL, 1, '2014-10-14 07:19:38', '2014-10-11 11:44:54', '2014-10-11 11:44:54', '2014-10-14 07:19:38', NULL),
(2, 'a1@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(3, 'a2@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(4, 'a3@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(5, 'a4@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(6, 'a5@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(7, 'a6@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(8, 'a7@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(9, 'a8@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(10, 'a9@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(11, 'a10@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(12, 'a11@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(13, 'a12@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(14, 'a13@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(15, 'a14@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(16, 'a15@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(17, 'a16@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(18, 'a17@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(19, 'a18@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(20, 'a19@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(21, 'a20@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(22, 'a21@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(23, 'a22@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(24, 'a23@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(25, 'a24@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(26, 'a25@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(27, 'a26@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(28, 'a27@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(29, 'a28@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL),
(30, 'a29@a.com', '$2y$10$OeQ7sJePbtlxt5B0wTk1A.te6KoravzcfbohdbmvkI1lEBe3U8hrO', NULL, NULL, 0, NULL, '2014-10-11 11:45:01', '2014-10-11 11:45:01', '2014-10-11 11:45:01', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
