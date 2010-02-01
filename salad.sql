-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2008 at 01:43 AM
-- Server version: 5.0.41
-- PHP Version: 4.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `salad`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `categories`
-- 

CREATE TABLE `categories` (
  `id` int(11) NOT NULL auto_increment,
  `name` text,
  `category_id` int(11) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `categories`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `comments`
-- 

CREATE TABLE `comments` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL default '',
  `text` text NOT NULL,
  `parent_id` int(11) NOT NULL default '0',
  `votes_count` int(11) default '0',
  `feature_id` int(11) default NULL,
  `datetime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

-- 
-- Dumping data for table `comments`
-- 

INSERT INTO `comments` (`id`, `user_id`, `product_id`, `subject`, `text`, `parent_id`, `votes_count`, `feature_id`, `datetime`) VALUES 
(1, 1, 3, '', 'test', 0, 0, 1, '2007-10-02 02:38:05'),
(2, 1, 3, '', 'thank you!', 0, 0, 1, '2007-10-02 02:46:39'),
(3, 1, 12, '', 'excelente idea!', 0, 0, 43, '2007-10-02 02:51:06'),
(4, 1, 6, '', 'with gestures?', 0, 0, 5, '2007-10-02 02:54:42'),
(5, 1, 14, '', 'Esta birria es puuura mierd', 0, 0, 41, '2007-10-02 03:07:28'),
(6, 1, 13, '', 'Si porque da un error <b>bien feo!</b>', 0, 0, 38, '2007-10-02 11:08:33'),
(7, 1, 14, '', 'Con limon y es la mejor', 0, 0, 49, '2007-10-02 11:26:14'),
(8, 1, 14, '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n', 0, 0, 49, '2007-10-02 11:26:56'),
(10, 1, 14, '', 'otra', 0, 0, 49, '2007-10-04 00:11:53'),
(11, 1, 14, '', 'nice', 0, 0, 49, '2007-10-04 00:13:32'),
(12, 1, 14, '', 'excelente birrai\n', 0, 0, 49, '2007-10-04 12:53:07'),
(13, 1, 12, '', 'Add friend activity log\nyour friend corp has created a list!', 0, 0, 59, '2007-10-15 20:01:23'),
(14, 5, 19, '', 'this camera rules', 0, 0, 56, '2007-10-16 00:22:45'),
(15, 5, 12, '', 'cheque este ya esta!', 0, 0, 27, '2007-10-16 00:23:50'),
(16, 1, 26, '', 'y esta banda de donde es?', 0, 0, 81, '2007-10-17 16:55:58'),
(17, 1, 27, '', 'Este show adonde lo dan?', 0, 0, 92, '2007-10-17 17:30:19');

-- --------------------------------------------------------

-- 
-- Table structure for table `features`
-- 

CREATE TABLE `features` (
  `id` int(11) NOT NULL auto_increment,
  `list_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL default '',
  `user_id` int(11) NOT NULL,
  `feature_votes_count` int(11) NOT NULL default '0',
  `datetime` datetime NOT NULL,
  `points` int(11) NOT NULL default '0',
  `comments_count` int(11) default '0',
  `description` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=111 ;

-- 
-- Dumping data for table `features`
-- 

INSERT INTO `features` (`id`, `list_id`, `title`, `user_id`, `feature_votes_count`, `datetime`, `points`, `comments_count`, `description`) VALUES 
(1, 3, 'F11 Will clear your desktop', 1, 7, '2007-06-17 15:33:26', 10, 0, NULL),
(2, 3, 'fn F9 will launch expose', 1, 1, '2007-06-17 15:34:37', 1, 0, NULL),
(3, 3, 'Command L im your browser will go to address bar', 1, 2, '2007-06-19 02:27:15', 2, 0, NULL),
(4, 4, 'istat pro www.islayer.com for cpu stats', 2, 0, '2007-06-19 02:30:01', 2, 0, NULL),
(5, 6, 'bottomless mouse', 2, 0, '2007-06-19 03:04:48', 0, 0, NULL),
(6, 6, 'micro mouse', 2, 0, '2007-06-19 03:04:59', 0, 0, NULL),
(7, 6, 'invisible mouse', 2, 0, '2007-06-19 03:05:10', 1, 0, NULL),
(8, 5, 'mouse with two buttons', 2, 0, '2007-06-19 03:26:41', 0, 0, NULL),
(9, 6, 'a multitouch mouse', 2, 0, '2007-06-19 03:29:48', 0, 0, NULL),
(10, 4, 'Lava Lamp', 2, 0, '2007-06-19 03:36:48', 0, 0, NULL),
(11, 7, 'Touch Screen', 2, 0, '2007-06-19 03:38:27', 0, 0, NULL),
(12, 7, 'Multitouch screen', 2, 0, '2007-06-19 03:38:35', -1, 0, NULL),
(13, 7, 'wi-fi', 2, 0, '2007-06-19 03:38:46', -1, 0, NULL),
(14, 7, 'voip', 2, 0, '2007-06-19 03:38:49', 1, 0, NULL),
(15, 7, 'Bluetooth', 2, 0, '2007-06-19 03:39:09', 2, 0, NULL),
(16, 4, 'Bluetooth scan connect', 2, 0, '2007-06-19 03:39:23', 0, 0, NULL),
(17, 5, 'bluetooth wireless chat', 1, 1, '2007-06-19 15:51:14', 1, 0, NULL),
(18, 8, 'Viernes 13', 1, 1, '2007-06-22 16:22:39', 2, 0, NULL),
(19, 8, 'Freddy Cuggar', 1, 0, '2007-06-22 16:22:52', 3, 0, NULL),
(20, 8, 'cuggqr', 1, 0, '2007-06-22 16:25:08', 0, 0, NULL),
(21, 0, 'cuggar', 1, 0, '2007-06-25 01:22:34', 0, 0, NULL),
(22, 8, 'cuggar', 1, 1, '2007-06-25 01:28:20', 3, 0, NULL),
(23, 8, 'r', 1, 0, '2007-06-25 01:53:05', 0, 0, NULL),
(24, 12, 'fix report spam', 1, 0, '2007-06-25 02:42:58', 0, 0, NULL),
(25, 12, 'admin to delete', 1, 1, '2007-06-25 02:43:12', -1, 0, NULL),
(26, 6, 'bluetooth mouse', 1, 0, '2007-06-25 02:44:16', 2, 0, NULL),
(27, 12, 'captcha', 1, 10, '2007-06-25 02:52:05', 0, 1, NULL),
(28, 12, 'hot list', 1, 0, '2007-06-25 02:52:34', -2, 0, NULL),
(29, 12, 'fix latest', 1, 2, '2007-06-25 03:13:01', -1, 0, NULL),
(30, 12, '\\?', 1, 1, '2007-06-25 03:18:09', -1, 0, NULL),
(31, 12, 'check anti spam no post miles', 1, 8, '2007-06-25 03:27:53', -2, 0, NULL),
(32, 12, 'userlogs', 1, 1, '2007-06-25 03:28:33', -1, 0, NULL),
(33, 12, 'private lists with passwords', 1, 4, '2007-06-25 03:28:43', 2, 0, NULL),
(34, 12, 'minimize los que tienen pocos votos y viejos', 1, 11, '2007-06-25 14:34:25', -2, 0, NULL),
(35, 12, 'test', 1, 2, '2007-06-30 18:08:36', -2, 0, NULL),
(36, 12, 'test', 1, 2, '2007-06-30 18:08:48', -2, 0, NULL),
(37, 13, 'Contests', 1, 0, '2007-06-30 18:09:22', 0, 0, NULL),
(38, 13, 'Arreglar news', 1, 0, '2007-06-30 18:10:00', 0, 0, NULL),
(39, 14, 'Dos Equis', 3, 3, '2007-06-30 18:20:19', 2, 0, NULL),
(40, 14, 'Imperial', 3, 0, '2007-06-30 18:20:23', -1, 0, NULL),
(41, 14, 'Port Royal', 3, 0, '2007-06-30 18:20:28', -1, 0, NULL),
(42, 14, 'Negra Modelo', 3, 3, '2007-06-30 18:20:35', 5, 0, NULL),
(43, 12, 'agregar contenido en cada feature (video, foto o texto)', 1, 3, '2007-06-30 18:27:30', 0, 0, NULL),
(44, 14, 'Gallo', 1, 1, '2007-06-30 18:31:28', 3, 0, NULL),
(45, 12, 'Ver Your List en tu account', 1, 10, '2007-06-30 18:32:21', -2, 0, NULL),
(46, 12, 'Arreglar el listado del perfil que voto', 1, 0, '2007-06-30 18:35:01', 0, 0, NULL),
(47, 14, 'Corona', 3, 1, '2007-06-30 20:01:03', 6, 0, NULL),
(48, 12, 'check dupes en hacer listas', 1, 7, '2007-06-30 20:01:05', -3, 0, NULL),
(49, 14, 'Coronita', 3, 0, '2007-06-30 20:01:08', 11, 3, NULL),
(50, 12, 'Crear private listings y poder invitar amigos', 3, 1, '2007-06-30 20:13:39', -1, 0, NULL),
(51, 12, 'Crear private lists y poder invitar amigos', 3, 2, '2007-06-30 20:14:17', 3, 0, NULL),
(52, 12, 'IPhone version de listas', 3, 3, '2007-06-30 20:16:27', 3, 0, NULL),
(53, 16, 'Budweisser', 1, 0, '2007-07-03 22:11:03', 1, 0, NULL),
(54, 19, 'Canon 5D', 1, 0, '2007-07-04 05:11:56', 1, 0, NULL),
(55, 19, 'Nikon D40', 1, 0, '2007-07-04 05:12:06', 0, 0, NULL),
(56, 19, 'Canon XTI 350', 1, 1, '2007-07-04 05:12:15', 2, 1, NULL),
(57, 3, 'Press Command-V during startup 	Start up in Verbose mode.', 1, 3, '2007-10-04 00:32:29', 1, 0, NULL),
(58, 6, 'This is a great long idea Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequ', 1, 0, '2007-10-04 01:58:50', 0, 0, NULL),
(59, 12, 'Friend Activity', 1, 18, '2007-10-05 23:49:00', 0, 1, NULL),
(60, 3, 'option-shift k = ï£¿', 1, 0, '2007-10-15 20:25:03', 0, 0, NULL),
(61, 3, 'uh qeu paso', 1, 4, '2007-10-15 20:25:16', -4, 0, NULL),
(62, 22, 'Oblivion ', 5, 0, '2007-10-16 00:13:55', 0, 0, NULL),
(63, 12, 'ajusta threshold en my account', 5, 4, '2007-10-16 00:26:08', 4, 0, NULL),
(64, 12, 'add Google this button y hacer un add to rss feed and digg this', 5, 2, '2007-10-16 00:27:07', 2, 0, NULL),
(65, 12, 'fix profile ', 5, 4, '2007-10-16 00:35:11', 4, 0, NULL),
(66, 23, 'Pantera Rosa', 1, 2, '2007-10-16 22:17:37', 2, 0, NULL),
(67, 12, 'Tipos de listas\r\npublicas/privadas para amigos\r\nsolo vos podas agregar elementos y amigos solo votan\r\nabierta', 1, 5, '2007-10-16 22:50:37', 5, 0, NULL),
(68, 24, 'Cost -- Linux is free, and that includes all the apps. Microsoft is greedy. Vista Home Premium and Ultimate cost hundreds of dollars, even when upgrading from Windows XP. Moving up to Office 2007 involves handing over another bundle of dollars.', 1, 0, '2007-10-17 11:29:41', 0, 0, NULL),
(69, 24, 'Security', 1, 0, '2007-10-17 11:29:57', 0, 0, NULL),
(70, 24, 'Performance ', 1, 2, '2007-10-17 11:30:09', 2, 0, NULL),
(71, 24, 'No bloatware ', 1, 1, '2007-10-17 11:30:26', -1, 0, NULL),
(72, 3, 'command - W closes any window', 1, 5, '2007-10-17 11:44:47', 1, 0, NULL),
(73, 3, 'Acentos: option-e + vocal', 1, 0, '2007-10-17 12:04:02', 0, 0, NULL),
(74, 12, 'INvite Friends!', 1, 6, '2007-10-17 12:07:18', 6, 0, NULL),
(75, 12, 'Beta testers', 1, 0, '2007-10-17 12:13:41', 0, 0, NULL),
(76, 14, 'Quilmes', 1, 0, '2007-10-17 12:15:19', 0, 0, NULL),
(77, 6, 'brain controlled mouse', 1, 0, '2007-10-17 12:22:44', 0, 0, NULL),
(78, 3, 'command-ESC launches front row', 1, 1, '2007-10-17 12:27:25', 1, 0, NULL),
(79, 25, 'iPod Touch is cheaper', 3, 1, '2007-10-17 16:48:03', 1, 0, NULL),
(80, 26, 'mewithoutYou', 6, 2, '2007-10-17 16:50:43', 2, 0, NULL),
(81, 26, 'Pedro the Lion', 6, 3, '2007-10-17 16:51:06', 3, 1, NULL),
(82, 26, 'Kings of Leon', 6, 0, '2007-10-17 16:51:13', 0, 0, NULL),
(83, 26, 'Lovedrug', 6, 1, '2007-10-17 16:51:27', 1, 0, NULL),
(84, 23, 'Freddy vs. Jason', 6, 1, '2007-10-17 16:57:25', -1, 0, NULL),
(85, 12, 'Avisos cuando alguien comenta\r\n', 1, 2, '2007-10-17 17:01:16', 2, 0, NULL),
(86, 12, 'resize HUGE images, no aceptar imagenes tan grandes', 1, 3, '2007-10-17 17:03:51', 3, 0, NULL),
(87, 12, 'Arreglar despues de crop, redireccion', 1, 0, '2007-10-17 17:06:04', 0, 0, NULL),
(88, 27, 'Heroes', 7, 2, '2007-10-17 17:07:07', 2, 0, NULL),
(89, 27, 'Prison Break', 7, 1, '2007-10-17 17:07:28', 1, 0, NULL),
(90, 27, 'House', 7, 3, '2007-10-17 17:07:35', 3, 0, NULL),
(91, 27, 'Lost', 1, 3, '2007-10-17 17:09:35', 3, 0, NULL),
(92, 27, 'Family Guy', 1, 5, '2007-10-17 17:09:51', 5, 1, NULL),
(93, 12, 'Categorias (Wish lists, top 10s, Technology etc..)', 1, 0, '2007-10-17 17:29:15', 0, 0, NULL),
(94, 28, 'OpenDocument and Word 2007 Formats', 1, 0, '2007-10-17 17:34:30', 0, 0, NULL),
(95, 28, 'Workspaces', 1, 0, '2007-10-17 17:35:15', 0, 0, NULL),
(96, 3, 'Capture Screen Area: command-shift-4 ', 1, 1, '2007-10-19 19:23:58', 1, 0, NULL),
(97, 31, 'Arreglar My Personal List', 1, 0, '2007-10-31 20:11:33', 0, 0, NULL),
(98, 31, 'Que no todos puedan accesar las privadas solo el owner', 1, 0, '2007-10-31 20:11:46', 0, 0, NULL),
(99, 28, 'Time Machine', 1, 4, '2007-11-08 09:56:55', 4, 0, NULL),
(100, 27, 'The Office', 1, 0, '2007-11-08 10:00:19', 0, 0, NULL),
(101, 31, 'Probando que no puedan accesar', 1, 1, '2007-11-08 10:01:09', 1, 0, NULL),
(102, 12, 'People who liked this also liked...', 1, 4, '2007-11-15 13:55:23', 4, 0, NULL),
(103, 32, 'Rumor has it.... (insert chisme aca)', 1, 1, '2007-12-06 04:05:29', 1, 0, NULL),
(104, 3, 'Command E', 1, 1, '2008-01-10 02:25:28', 1, 0, 'Para poner hacendos hay que apretar command y y luego la letra'),
(105, 3, 'Command E', 1, 0, '2008-01-10 02:26:12', 0, 0, NULL),
(106, 3, 'Command E', 1, 1, '2008-01-10 02:26:52', 1, 0, NULL),
(107, 3, 'Command E', 1, 1, '2008-01-10 02:27:17', 1, 0, NULL),
(108, 3, 'Command E', 1, 0, '2008-01-10 02:29:16', 0, 0, NULL),
(109, 4, 'To Do', 1, 0, '2008-01-10 02:31:21', 0, 0, 'A lightweight and fast widget to manage tasks. Thanks to Mac OS X Leopard it integrates with iCal and Mail. The big advantage: to manage your tasks you donâ€™t have to leave these applications open.\r\n\r\nhttp://www.apple.com/downloads/dashboard/email_messaging/todo.html'),
(110, 24, 'The Fanboy alienation factor,', 1, 0, '2008-01-10 03:15:32', 0, 0, 'Let me explain: We all know that the statement is pretty much self-evident. We also know that posting such a thing in public will bring the attack dogs out of the Web work. However, I''d venture to bet that they''ll be far less inclined to discuss my thesis than to engage in an ad hominem attack on the messenger (me).\r\n\r\nAccordingly, let me try to head off the expected invectives at the pass. Some people consider fanboys a pejorative. I don''t intend it that way. I say it''s a fair, descriptive term. I''d define it as an overenthusiastic and myopic techie who brooks no disagreement with his -- let''s admit that it''s almost always a "he" we''re talking about -- views. (Hey, if the Linux or Apple foobar fits...) ');

-- --------------------------------------------------------

-- 
-- Table structure for table `feature_votes`
-- 

CREATE TABLE `feature_votes` (
  `id` int(11) NOT NULL auto_increment,
  `feature_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `ip` varchar(255) default NULL,
  `points` int(11) default NULL,
  `value` tinyint(1) NOT NULL,
  `list_id` int(11) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=267 ;

-- 
-- Dumping data for table `feature_votes`
-- 

INSERT INTO `feature_votes` (`id`, `feature_id`, `user_id`, `datetime`, `ip`, `points`, `value`, `list_id`) VALUES 
(1, 1, 1, '2007-06-17 15:33:58', '127.0.0.1', 1, 1, 0),
(2, 3, 1, '2007-06-19 02:27:27', '127.0.0.1', 1, 1, 0),
(3, 4, 2, '2007-06-19 02:30:07', '127.0.0.1', 1, 1, 0),
(4, 4, 2, '2007-06-19 02:30:11', '127.0.0.1', 1, 1, 0),
(5, 3, 2, '2007-06-19 02:32:45', '127.0.0.1', 1, 1, 0),
(6, 7, 2, '2007-06-19 03:05:13', '127.0.0.1', 1, 1, 0),
(7, 15, 2, '2007-06-19 04:01:17', '127.0.0.1', 1, 1, 0),
(8, 13, 1, '2007-06-19 15:53:33', '127.0.0.1', 1, 1, 0),
(9, 13, 1, '2007-06-19 15:53:35', '127.0.0.1', -1, 0, 0),
(10, 13, 1, '2007-06-19 15:53:36', '127.0.0.1', -1, 0, 0),
(11, 12, 1, '2007-06-19 15:53:39', '127.0.0.1', -1, 0, 0),
(12, 18, 1, '2007-06-22 16:22:42', '127.0.0.1', 1, 1, 0),
(13, 18, 1, '2007-06-22 16:22:44', '127.0.0.1', -1, 0, 0),
(14, 18, 1, '2007-06-22 16:22:45', '127.0.0.1', 1, 1, 0),
(15, 19, 1, '2007-06-22 16:22:55', '127.0.0.1', 1, 1, 0),
(16, 18, 1, '2007-06-22 16:22:56', '127.0.0.1', 1, 1, 0),
(17, 18, 1, '2007-06-22 16:22:57', '127.0.0.1', 1, 1, 0),
(18, 19, 1, '2007-06-22 16:22:58', '127.0.0.1', 1, 1, 0),
(19, 15, 1, '2007-06-22 16:26:07', '127.0.0.1', 1, 1, 0),
(20, 14, 1, '2007-06-22 16:26:09', '127.0.0.1', 1, 1, 0),
(21, 22, 1, '2007-06-25 01:28:23', '127.0.0.1', 1, 1, 0),
(22, 22, 1, '2007-06-25 01:28:24', '127.0.0.1', 1, 1, 0),
(23, 26, 1, '2007-06-25 02:44:20', '127.0.0.1', 1, 1, 0),
(24, 26, 1, '2007-06-25 03:02:02', '127.0.0.1', 1, 1, 0),
(25, 29, 1, '2007-06-25 03:18:24', '127.0.0.1', 1, 1, 0),
(26, 28, 1, '2007-06-25 03:26:04', '127.0.0.1', -1, 0, 0),
(27, 31, 1, '2007-06-25 03:28:02', '127.0.0.1', 1, 1, 0),
(28, 31, 1, '2007-06-25 03:28:02', '127.0.0.1', 1, 1, 0),
(29, 34, 1, '2007-06-25 14:34:31', '127.0.0.1', 1, 1, 0),
(30, 34, 1, '2007-06-25 14:34:32', '127.0.0.1', 1, 1, 0),
(31, 34, 1, '2007-06-25 14:34:32', '127.0.0.1', 1, 1, 0),
(32, 42, 3, '2007-06-30 18:21:20', '127.0.0.1', 1, 1, 0),
(33, 42, 3, '2007-06-30 18:22:09', '127.0.0.1', 1, 1, 0),
(34, 42, 3, '2007-06-30 18:22:11', '127.0.0.1', 1, 1, 0),
(35, 43, 1, '2007-06-30 18:27:44', '127.0.0.1', 1, 1, 0),
(36, 43, 1, '2007-06-30 18:27:56', '127.0.0.1', 1, 1, 0),
(37, 43, 1, '2007-06-30 18:27:56', '127.0.0.1', 1, 1, 0),
(38, 43, 3, '2007-06-30 18:30:39', '127.0.0.1', 1, 1, 0),
(39, 28, 3, '2007-06-30 18:31:13', '127.0.0.1', -1, 0, 0),
(40, 42, 1, '2007-06-30 18:31:24', '127.0.0.1', 1, 1, 0),
(41, 1, 1, '2007-06-30 18:33:59', '127.0.0.1', 1, 1, 0),
(42, 1, 1, '2007-06-30 18:33:59', '127.0.0.1', 1, 1, 0),
(43, 1, 1, '2007-06-30 18:34:00', '127.0.0.1', 1, 1, 0),
(44, 1, 1, '2007-06-30 18:34:00', '127.0.0.1', 1, 1, 0),
(45, 44, 1, '2007-06-30 18:34:14', '127.0.0.1', 1, 1, 0),
(46, 44, 3, '2007-06-30 20:00:59', '127.0.0.1', 1, 1, 0),
(47, 48, 1, '2007-06-30 20:01:09', '127.0.0.1', 1, 1, 0),
(48, 48, 1, '2007-06-30 20:01:09', '127.0.0.1', 1, 1, 0),
(49, 49, 3, '2007-06-30 20:24:42', '127.0.0.1', 1, 1, 0),
(50, 49, 3, '2007-06-30 20:24:43', '127.0.0.1', 1, 1, 0),
(51, 49, 3, '2007-06-30 20:24:43', '127.0.0.1', 1, 1, 0),
(52, 49, 3, '2007-06-30 20:24:44', '127.0.0.1', 1, 1, 0),
(53, 49, 3, '2007-06-30 20:24:44', '127.0.0.1', 1, 1, 0),
(54, 49, 3, '2007-06-30 20:24:44', '127.0.0.1', 1, 1, 0),
(55, 49, 3, '2007-06-30 20:24:44', '127.0.0.1', 1, 1, 0),
(56, 49, 3, '2007-06-30 20:24:44', '127.0.0.1', 1, 1, 0),
(57, 49, 3, '2007-06-30 20:24:45', '127.0.0.1', 1, 1, 0),
(58, 49, 3, '2007-06-30 20:24:45', '127.0.0.1', 1, 1, 0),
(59, 49, 3, '2007-06-30 20:24:45', '127.0.0.1', 1, 1, 0),
(60, 47, 3, '2007-06-30 20:25:28', '127.0.0.1', 1, 1, 0),
(61, 47, 3, '2007-06-30 20:25:28', '127.0.0.1', 1, 1, 0),
(62, 47, 3, '2007-06-30 20:25:28', '127.0.0.1', 1, 1, 0),
(63, 47, 3, '2007-06-30 20:25:29', '127.0.0.1', 1, 1, 0),
(64, 47, 3, '2007-06-30 20:25:30', '127.0.0.1', 1, 1, 0),
(65, 39, 1, '2007-07-02 02:34:44', '127.0.0.1', -1, 0, 0),
(66, 40, 1, '2007-07-02 02:34:49', '127.0.0.1', -1, 0, 0),
(67, 41, 1, '2007-07-02 02:36:49', '127.0.0.1', -1, 0, 0),
(68, 19, 1, '2007-07-02 14:40:54', '127.0.0.1', 1, 1, 0),
(69, 53, 1, '2007-07-03 22:11:07', '127.0.0.1', 1, 1, 0),
(70, 56, 1, '2007-07-04 05:12:32', '127.0.0.1', 1, 1, 0),
(71, 54, 1, '2007-07-04 05:12:35', '127.0.0.1', 1, 1, 0),
(72, 43, 1, '2007-10-02 02:56:45', '127.0.0.1', -1, 0, 0),
(73, 43, 1, '2007-10-02 02:56:46', '127.0.0.1', -1, 0, 0),
(74, 43, 1, '2007-10-02 02:56:48', '127.0.0.1', -1, 0, 0),
(75, 31, 1, '2007-10-02 02:56:59', '127.0.0.1', 1, 1, 0),
(76, 31, 1, '2007-10-02 02:56:59', '127.0.0.1', 1, 1, 0),
(77, 51, 1, '2007-10-02 02:57:06', '127.0.0.1', 1, 1, 0),
(78, 47, 1, '2007-10-02 11:07:42', '127.0.0.1', -1, 0, 0),
(79, 47, 1, '2007-10-04 00:26:06', '127.0.0.1', 1, 1, 0),
(80, 42, 1, '2007-10-04 00:26:19', '127.0.0.1', 1, 1, 0),
(81, 47, 1, '2007-10-04 00:26:22', '127.0.0.1', 1, 1, 0),
(82, 42, 1, '2007-10-04 00:26:24', '127.0.0.1', 1, 1, 0),
(83, 42, 1, '2007-10-04 00:26:27', '127.0.0.1', -1, 0, 0),
(84, 57, 1, '2007-10-04 00:32:37', '127.0.0.1', 1, 1, 0),
(85, 22, 1, '2007-10-04 03:52:09', NULL, 1, 1, 8),
(86, 18, 1, '2007-10-04 03:53:13', NULL, -1, 0, 8),
(87, 52, 1, '2007-10-04 11:21:27', NULL, 1, 1, 12),
(88, 50, 1, '2007-10-04 11:21:32', NULL, -1, 0, 12),
(89, 27, 1, '2007-10-04 11:23:15', NULL, 1, 1, 12),
(90, 27, 1, '2007-10-04 11:23:15', NULL, 1, 1, 12),
(91, 27, 1, '2007-10-04 11:23:15', NULL, 1, 1, 12),
(92, 27, 1, '2007-10-04 11:23:16', NULL, 1, 1, 12),
(93, 31, 1, '2007-10-04 12:53:58', NULL, 1, 1, 12),
(94, 59, 1, '2007-10-05 23:49:05', NULL, 1, 1, 12),
(95, 59, 1, '2007-10-05 23:49:05', NULL, 1, 1, 12),
(96, 59, 1, '2007-10-05 23:49:06', NULL, 1, 1, 12),
(97, 59, 1, '2007-10-05 23:49:07', NULL, 1, 1, 12),
(98, 59, 1, '2007-10-05 23:49:07', NULL, 1, 1, 12),
(99, 59, 1, '2007-10-05 23:49:09', NULL, 1, 1, 12),
(100, 59, 1, '2007-10-05 23:49:10', NULL, 1, 1, 12),
(101, 59, 1, '2007-10-05 23:49:10', NULL, 1, 1, 12),
(102, 45, 1, '2007-10-05 23:49:20', NULL, 1, 1, 12),
(103, 45, 1, '2007-10-05 23:49:20', NULL, 1, 1, 12),
(104, 45, 1, '2007-10-05 23:49:20', NULL, 1, 1, 12),
(105, 36, 1, '2007-10-05 23:49:23', NULL, -1, 0, 12),
(106, 35, 1, '2007-10-05 23:49:23', NULL, -1, 0, 12),
(107, 33, 1, '2007-10-05 23:49:24', NULL, -1, 0, 12),
(108, 32, 1, '2007-10-05 23:49:25', NULL, -1, 0, 12),
(109, 30, 1, '2007-10-05 23:49:25', NULL, -1, 0, 12),
(110, 25, 1, '2007-10-05 23:49:26', NULL, -1, 0, 12),
(111, 2, 1, '2007-10-15 20:26:04', NULL, 1, 1, 3),
(112, 61, 1, '2007-10-15 20:32:34', NULL, -1, 0, 3),
(113, 61, 1, '2007-10-15 20:32:35', NULL, -1, 0, 3),
(114, 61, 1, '2007-10-15 20:32:35', NULL, -1, 0, 3),
(115, 61, 1, '2007-10-15 20:32:35', NULL, -1, 0, 3),
(116, 27, 1, '2007-10-15 20:37:12', NULL, 1, 1, 12),
(117, 1, 5, '2007-10-16 00:15:41', NULL, 1, 1, 3),
(118, 57, 5, '2007-10-16 00:15:45', NULL, 1, 1, 3),
(119, 3, 5, '2007-10-16 00:15:58', NULL, 1, 1, 3),
(120, 56, 5, '2007-10-16 00:22:23', NULL, 1, 1, 19),
(121, 34, 5, '2007-10-16 00:24:08', NULL, 1, 1, 12),
(122, 34, 5, '2007-10-16 00:24:08', NULL, 1, 1, 12),
(123, 34, 5, '2007-10-16 00:24:08', NULL, 1, 1, 12),
(124, 34, 5, '2007-10-16 00:24:09', NULL, -1, 0, 12),
(125, 34, 5, '2007-10-16 00:24:09', NULL, -1, 0, 12),
(126, 34, 5, '2007-10-16 00:24:10', NULL, -1, 0, 12),
(127, 34, 5, '2007-10-16 00:24:10', NULL, -1, 0, 12),
(128, 34, 5, '2007-10-16 00:24:10', NULL, -1, 0, 12),
(129, 34, 5, '2007-10-16 00:24:10', NULL, -1, 0, 12),
(130, 34, 5, '2007-10-16 00:24:10', NULL, -1, 0, 12),
(131, 45, 5, '2007-10-16 00:24:12', NULL, -1, 0, 12),
(132, 45, 5, '2007-10-16 00:24:12', NULL, -1, 0, 12),
(133, 45, 5, '2007-10-16 00:24:12', NULL, -1, 0, 12),
(134, 45, 5, '2007-10-16 00:24:12', NULL, -1, 0, 12),
(135, 45, 5, '2007-10-16 00:24:13', NULL, -1, 0, 12),
(136, 45, 5, '2007-10-16 00:24:14', NULL, 1, 1, 12),
(137, 48, 5, '2007-10-16 00:24:35', NULL, -1, 0, 12),
(138, 48, 5, '2007-10-16 00:24:36', NULL, -1, 0, 12),
(139, 48, 5, '2007-10-16 00:24:39', NULL, 1, 1, 12),
(140, 52, 5, '2007-10-16 00:24:41', NULL, 1, 1, 12),
(141, 51, 5, '2007-10-16 00:24:43', NULL, 1, 1, 12),
(142, 29, 5, '2007-10-16 00:24:47', NULL, -1, 0, 12),
(143, 29, 5, '2007-10-16 00:24:48', NULL, -1, 0, 12),
(144, 43, 5, '2007-10-16 00:24:50', NULL, 1, 1, 12),
(145, 31, 5, '2007-10-16 00:25:16', NULL, -1, 0, 12),
(146, 31, 5, '2007-10-16 00:25:17', NULL, -1, 0, 12),
(147, 31, 5, '2007-10-16 00:25:17', NULL, -1, 0, 12),
(148, 31, 5, '2007-10-16 00:25:17', NULL, -1, 0, 12),
(149, 31, 5, '2007-10-16 00:25:18', NULL, -1, 0, 12),
(150, 31, 5, '2007-10-16 00:25:19', NULL, -1, 0, 12),
(151, 31, 5, '2007-10-16 00:25:20', NULL, -1, 0, 12),
(152, 45, 5, '2007-10-16 00:25:21', NULL, -1, 0, 12),
(153, 34, 5, '2007-10-16 00:25:22', NULL, -1, 0, 12),
(154, 51, 5, '2007-10-16 00:25:30', NULL, 1, 1, 12),
(155, 63, 5, '2007-10-16 00:26:12', NULL, 1, 1, 12),
(156, 63, 5, '2007-10-16 00:26:13', NULL, 1, 1, 12),
(157, 64, 5, '2007-10-16 00:27:19', NULL, 1, 1, 12),
(158, 64, 5, '2007-10-16 00:27:20', NULL, 1, 1, 12),
(159, 65, 5, '2007-10-16 00:35:22', NULL, 1, 1, 12),
(160, 65, 5, '2007-10-16 00:35:22', NULL, 1, 1, 12),
(161, 65, 5, '2007-10-16 00:35:22', NULL, 1, 1, 12),
(162, 65, 5, '2007-10-16 00:35:23', NULL, 1, 1, 12),
(163, 66, 1, '2007-10-16 22:22:01', NULL, 1, 1, 23),
(164, 66, 1, '2007-10-16 22:22:02', NULL, 1, 1, 23),
(165, 52, 1, '2007-10-16 22:46:47', NULL, 1, 1, 12),
(166, 48, 1, '2007-10-16 22:46:51', NULL, -1, 0, 12),
(167, 48, 1, '2007-10-16 22:46:51', NULL, -1, 0, 12),
(168, 48, 1, '2007-10-16 22:46:51', NULL, -1, 0, 12),
(169, 48, 1, '2007-10-16 22:46:51', NULL, -1, 0, 12),
(170, 67, 1, '2007-10-16 22:50:43', NULL, 1, 1, 12),
(171, 67, 1, '2007-10-16 22:50:43', NULL, 1, 1, 12),
(172, 67, 1, '2007-10-16 22:50:44', NULL, 1, 1, 12),
(173, 67, 1, '2007-10-16 22:50:44', NULL, 1, 1, 12),
(174, 67, 1, '2007-10-16 22:50:44', NULL, 1, 1, 12),
(175, 70, 1, '2007-10-17 11:30:32', NULL, 1, 1, 24),
(176, 72, 1, '2007-10-17 11:44:54', NULL, 1, 1, 3),
(177, 72, 1, '2007-10-17 11:44:55', NULL, -1, 0, 3),
(178, 72, 1, '2007-10-17 11:44:56', NULL, 1, 1, 3),
(179, 72, 1, '2007-10-17 11:44:57', NULL, 1, 1, 3),
(180, 70, 1, '2007-10-17 11:50:37', NULL, 1, 1, 24),
(181, 74, 1, '2007-10-17 12:07:21', NULL, 1, 1, 12),
(182, 74, 1, '2007-10-17 12:07:21', NULL, 1, 1, 12),
(183, 74, 1, '2007-10-17 12:07:22', NULL, 1, 1, 12),
(184, 74, 1, '2007-10-17 12:07:22', NULL, 1, 1, 12),
(185, 74, 1, '2007-10-17 12:07:22', NULL, 1, 1, 12),
(186, 74, 1, '2007-10-17 12:07:23', NULL, 1, 1, 12),
(187, 63, 1, '2007-10-17 12:11:54', NULL, 1, 1, 12),
(188, 27, 1, '2007-10-17 12:13:22', NULL, -1, 0, 12),
(189, 27, 1, '2007-10-17 12:13:22', NULL, -1, 0, 12),
(190, 27, 1, '2007-10-17 12:13:23', NULL, -1, 0, 12),
(191, 27, 1, '2007-10-17 12:13:23', NULL, -1, 0, 12),
(192, 27, 1, '2007-10-17 12:13:23', NULL, -1, 0, 12),
(193, 1, 1, '2007-10-17 12:47:13', NULL, 1, 1, 3),
(194, 1, 1, '2007-10-17 12:48:25', NULL, 1, 1, 3),
(195, 71, 1, '2007-10-17 12:50:06', NULL, -1, 0, 24),
(196, 1, 1, '2007-10-17 15:49:04', NULL, 1, 1, 3),
(197, 59, 1, '2007-10-17 16:29:02', NULL, -1, 0, 12),
(198, 59, 1, '2007-10-17 16:29:02', NULL, -1, 0, 12),
(199, 59, 1, '2007-10-17 16:29:02', NULL, -1, 0, 12),
(200, 59, 1, '2007-10-17 16:29:03', NULL, -1, 0, 12),
(201, 59, 1, '2007-10-17 16:29:03', NULL, -1, 0, 12),
(202, 59, 1, '2007-10-17 16:29:03', NULL, -1, 0, 12),
(203, 59, 1, '2007-10-17 16:29:03', NULL, -1, 0, 12),
(204, 59, 1, '2007-10-17 16:29:03', NULL, -1, 0, 12),
(205, 59, 1, '2007-10-17 16:29:04', NULL, -1, 0, 12),
(206, 59, 1, '2007-10-17 16:29:05', NULL, 1, 1, 12),
(207, 43, 1, '2007-10-17 16:29:28', NULL, -1, 0, 12),
(208, 43, 1, '2007-10-17 16:29:28', NULL, -1, 0, 12),
(209, 79, 3, '2007-10-17 16:52:40', NULL, 1, 1, 25),
(210, 80, 6, '2007-10-17 16:52:42', NULL, 1, 1, 26),
(211, 83, 1, '2007-10-17 16:52:49', NULL, 1, 1, 26),
(212, 44, 3, '2007-10-17 16:52:53', NULL, 1, 1, 14),
(213, 39, 3, '2007-10-17 16:52:56', NULL, 1, 1, 14),
(214, 39, 3, '2007-10-17 16:52:56', NULL, 1, 1, 14),
(215, 39, 3, '2007-10-17 16:52:57', NULL, 1, 1, 14),
(216, 81, 3, '2007-10-17 16:53:16', NULL, 1, 1, 26),
(217, 81, 3, '2007-10-17 16:53:19', NULL, 1, 1, 26),
(218, 84, 6, '2007-10-17 16:57:32', NULL, -1, 0, 23),
(219, 85, 1, '2007-10-17 17:01:22', NULL, 1, 1, 12),
(220, 85, 1, '2007-10-17 17:01:23', NULL, 1, 1, 12),
(221, 80, 6, '2007-10-17 17:02:51', NULL, 1, 1, 26),
(222, 86, 1, '2007-10-17 17:04:04', NULL, 1, 1, 12),
(223, 86, 1, '2007-10-17 17:04:04', NULL, 1, 1, 12),
(224, 86, 1, '2007-10-17 17:04:04', NULL, 1, 1, 12),
(225, 63, 1, '2007-10-17 17:04:14', NULL, 1, 1, 12),
(226, 36, 1, '2007-10-17 17:05:29', NULL, -1, 0, 12),
(227, 35, 1, '2007-10-17 17:05:29', NULL, -1, 0, 12),
(228, 33, 1, '2007-10-17 17:05:32', NULL, 1, 1, 12),
(229, 33, 1, '2007-10-17 17:05:33', NULL, 1, 1, 12),
(230, 33, 1, '2007-10-17 17:05:33', NULL, 1, 1, 12),
(231, 90, 7, '2007-10-17 17:07:53', NULL, 1, 1, 27),
(232, 89, 7, '2007-10-17 17:07:55', NULL, 1, 1, 27),
(233, 88, 7, '2007-10-17 17:07:56', NULL, 1, 1, 27),
(234, 90, 7, '2007-10-17 17:07:58', NULL, 1, 1, 27),
(235, 88, 1, '2007-10-17 17:09:28', NULL, 1, 1, 27),
(236, 91, 1, '2007-10-17 17:09:38', NULL, 1, 1, 27),
(237, 91, 1, '2007-10-17 17:09:39', NULL, 1, 1, 27),
(238, 92, 1, '2007-10-17 17:09:53', NULL, 1, 1, 27),
(239, 92, 1, '2007-10-17 17:09:54', NULL, 1, 1, 27),
(240, 90, 7, '2007-10-17 17:16:38', NULL, 1, 1, 27),
(241, 92, 7, '2007-10-17 17:19:17', NULL, 1, 1, 27),
(242, 91, 7, '2007-10-17 17:19:20', NULL, 1, 1, 27),
(243, 92, 3, '2007-10-17 17:30:45', NULL, 1, 1, 27),
(244, 92, 3, '2007-10-17 17:30:45', NULL, 1, 1, 27),
(245, 81, 1, '2007-10-17 17:31:27', NULL, 1, 1, 26),
(246, 96, 1, '2007-10-19 19:24:22', NULL, 1, 1, 3),
(247, 78, 1, '2007-10-19 19:24:31', NULL, 1, 1, 3),
(248, 101, 1, '2007-11-08 10:05:11', NULL, 1, 1, 31),
(249, 102, 1, '2007-11-15 13:55:31', NULL, 1, 1, 12),
(250, 102, 1, '2007-11-15 13:55:31', NULL, 1, 1, 12),
(251, 102, 1, '2007-11-15 13:55:32', NULL, 1, 1, 12),
(252, 102, 1, '2007-11-15 13:55:32', NULL, 1, 1, 12),
(253, 99, 5, '2007-11-19 18:18:08', NULL, 1, 1, 28),
(254, 3, 5, '2007-11-19 18:18:20', NULL, -1, 0, 3),
(255, 1, 5, '2007-11-19 18:18:21', NULL, -1, 0, 3),
(256, 72, 5, '2007-11-19 18:18:21', NULL, -1, 0, 3),
(257, 57, 5, '2007-11-19 18:18:22', NULL, -1, 0, 3),
(258, 99, 1, '2007-12-03 18:05:32', NULL, 1, 1, 28),
(259, 99, 1, '2007-12-03 18:42:12', NULL, 1, 1, 28),
(260, 99, 1, '2007-12-05 23:26:47', NULL, 1, 1, 28),
(261, 1, 1, '2007-12-05 23:36:48', NULL, 1, 1, 3),
(262, 1, 1, '2007-12-05 23:40:21', NULL, 1, 1, 3),
(263, 103, 1, '2007-12-06 04:13:02', NULL, 1, 1, 32),
(264, 104, 1, '2008-01-10 03:06:17', NULL, 1, 1, 3),
(265, 106, 1, '2008-01-10 03:07:03', NULL, 1, 1, 3),
(266, 17, 1, '2008-01-10 03:07:32', NULL, 1, 1, 5);

-- --------------------------------------------------------

-- 
-- Table structure for table `friends`
-- 

CREATE TABLE `friends` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `accept` int(2) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `friends`
-- 

INSERT INTO `friends` (`id`, `user_id`, `friend_id`, `accept`) VALUES 
(1, 1, 3, NULL),
(2, 1, 2, NULL),
(3, 5, 1, NULL),
(4, 1, 6, NULL),
(5, 3, 6, NULL),
(6, 6, 3, NULL),
(7, 6, 1, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `lists`
-- 

CREATE TABLE `lists` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `datetime` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `points` int(11) NOT NULL default '0',
  `tags` text,
  `lastupdate` datetime NOT NULL,
  `listtype` varchar(10) NOT NULL,
  `password` varchar(255) default NULL,
  `comments_count` int(11) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

-- 
-- Dumping data for table `lists`
-- 

INSERT INTO `lists` (`id`, `name`, `description`, `datetime`, `user_id`, `status_id`, `points`, `tags`, `lastupdate`, `listtype`, `password`, `comments_count`) VALUES 
(3, 'Mac OSX Tips', 'Post your mac osx tips and links here', '2007-06-17 15:23:14', 1, 1, 106, 'osx tips mac apple links', '2008-01-10 03:07:03', '0', '', 0),
(4, 'Best OS X Widgets', 'Post the best osx widgets', '2007-06-19 02:29:25', 2, 1, 0, 'apple osx top10 best', '2007-06-19 02:30:11', '0', '', 0),
(5, 'Mac OSX Ideas new features', 'Post new features for macocs', '2007-06-19 02:55:58', 2, 1, 0, 'macosx features ideas apple', '2008-01-10 03:07:32', '0', '', 0),
(6, 'New mouse ideas', 'Post ideas for a new mouse', '2007-06-19 03:04:42', 2, 1, 2, 'mouse new ideas ', '2007-06-25 03:02:02', '0', '', 0),
(7, 'Best DS Features', 'Post best DS features', '2007-06-19 03:38:22', 2, 1, 0, 'ds features games nintendo', '2007-06-22 16:26:09', '0', '', 0),
(8, 'Peliculas Favoritas de Miedo', 'Postea tus pelicuals favoritas', '2007-06-22 16:22:25', 1, 1, 0, 'movie peliculas favoritas', '2007-10-04 03:53:13', '0', '', 0),
(9, 'Todo Listmaker', 'Todo en este programa', '2007-06-25 02:07:33', 1, 1, 0, 'todo salad programming coding', '2007-06-25 02:07:33', '0', '', 0),
(10, 'Todo Listmaker', 'Todo en este programa', '2007-06-25 02:08:32', 1, 1, 0, 'todo salad programming coding', '2007-06-25 02:08:32', '0', '', 0),
(11, 'Todo Listmaker', 'Todo en este programa', '2007-06-25 02:10:07', 1, 1, 0, 'todo salad programming coding', '2007-06-25 02:10:07', '0', '', 0),
(12, 'Todo Listmaker', 'Todo en este programa', '2007-06-25 02:42:31', 1, 1, 20, 'todo salad programming coding', '2007-11-15 13:55:32', '0', '', 0),
(13, 'Todo Dodge', 'todos de dodge', '2007-06-25 02:51:09', 1, 1, 2, 'dodge todo list ', '2007-06-25 02:51:09', '0', '', 0),
(14, 'Best latin american beers', 'Beers from latin american countries that you can buy in the US', '2007-06-30 18:19:06', 3, 1, 8, 'beer alcohol latin ', '2007-10-17 16:52:57', '0', '', 0),
(15, 'best beer', '', '2007-06-30 18:34:33', 3, 1, 0, '', '2007-06-30 18:34:33', '0', '', 0),
(16, 'Worst American Beers', 'Post the worst', '2007-06-30 18:49:11', 1, 1, 1, 'beer worst ', '2007-07-03 22:11:07', '0', '', 0),
(17, '<script>alert("lol");</script>', '<script>alert("lol");</script>', '2007-07-02 16:01:42', 1, 1, 0, 'asdfasdf', '2007-07-02 16:01:42', '0', '', 0),
(18, 'What Mac Should I Buy?', 'Please help me buy a Mac', '2007-07-03 03:21:14', 1, 1, 0, '', '2007-07-03 03:21:14', '1', 'mac', 0),
(19, 'Best SLR digital cameras', 'Post the best ones', '2007-07-04 05:11:41', 1, 1, 3, 'best cameras digital photography', '2007-10-16 00:22:23', '0', '', 0),
(20, 'Mi lista privada', 'sadfsadfsad', '2007-07-04 16:37:21', 1, 1, 0, 'my private', '2007-07-04 16:37:21', '1', 'a', 0),
(21, 'Best SLR digital cameras', 'Testing dupe!', '2007-10-02 03:05:56', 1, 1, 0, 'beer lame', '2007-10-02 03:05:56', '0', '', 0),
(22, 'Top PS3 Games', 'tHE best ps3 games?', '2007-10-16 00:13:30', 5, 1, 1, 'ps3 games gaming', '2007-10-16 00:13:30', '0', '', 0),
(23, 'Worst movies', 'post worst movies', '2007-10-16 22:17:18', 1, 1, 2, 'worst movies', '2007-10-17 16:57:32', '0', '', 0),
(24, 'Reasons why linux should be on the desktop', 'Post reasons why', '2007-10-17 11:29:21', 1, 1, 4, 'linux reasons ', '2007-10-17 12:50:06', '0', '', 0),
(25, 'Bad things about the iPhone', 'post the things you dont like about the iphone', '2007-10-17 12:38:12', 1, 1, 1, 'iphone bad worst', '2007-10-17 16:52:40', '0', '', 0),
(26, 'Best Indie Bands (Last 8 years)', 'List Best Indie Rock Bands from 1999 and older.', '2007-10-17 16:50:24', 6, 1, 4, 'music rock indie', '2007-10-17 17:31:27', '0', '', 0),
(27, 'Top  American Tv Shows', 'Currently on TV', '2007-10-17 17:05:09', 7, 1, 6, 'tv, shows', '2007-10-17 17:30:45', '0', '', 0),
(28, 'Cool New Features in Mac OSX', '', '2007-10-17 17:34:02', 1, 1, 3, 'mac osx features ', '2007-12-05 23:26:47', '0', '', 0),
(29, 'Private List 01', 'This is my private list', '2007-10-20 08:54:29', 1, 1, 0, 'private', '2007-10-20 08:54:29', '1', 'private', 0),
(30, 'My personal to do', 'this is my list', '2007-10-29 19:04:06', 1, 1, 0, '', '2007-10-29 19:04:06', '2', '', 0),
(31, 'My Personal TODO 2', 'test2', '2007-10-31 19:21:11', 1, 1, 3, 'personal todo', '2007-11-08 10:05:11', '2', '', 0),
(32, 'Social Network ideas', 'ideas de redes sociales', '2007-12-06 03:36:20', 1, 1, 1, '', '2007-12-06 04:13:02', '0', '', 0),
(33, '', '', '2008-01-11 03:45:08', 1, 1, 0, NULL, '2008-01-11 03:45:08', '', NULL, 0),
(34, '', '', '2008-01-11 03:45:24', 1, 1, 0, NULL, '2008-01-11 03:45:24', '', NULL, 0),
(35, '', '', '2008-01-11 03:45:33', 1, 1, 0, NULL, '2008-01-11 03:45:33', '', NULL, 0),
(36, 'Icoms Prioridades', 'Poner aca las prioridades de Icoms', '2008-01-11 03:48:26', 1, 1, 0, '', '2008-01-11 03:48:26', 'FRIENDS', 'icoms', 0),
(37, 'Icoms Prioridades', 'Poner aca las prioridades de Icoms', '2008-01-11 03:49:07', 1, 1, 0, '', '2008-01-11 03:49:07', 'FRIENDS', 'icoms', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `logs`
-- 

CREATE TABLE `logs` (
  `id` int(11) NOT NULL auto_increment,
  `datetime` datetime default NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) default NULL,
  `list_id` int(11) default NULL,
  `text` text NOT NULL,
  `comment_id` int(11) default '0',
  `feature_id` int(11) default NULL,
  `action` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- 
-- Dumping data for table `logs`
-- 

INSERT INTO `logs` (`id`, `datetime`, `user_id`, `name`, `list_id`, `text`, `comment_id`, `feature_id`, `action`) VALUES 
(1, '2007-12-05 23:40:21', 1, NULL, 3, '', 0, 1, 'VOTE_UP'),
(2, '2007-12-06 04:05:29', 1, NULL, 32, '', 0, 103, 'NEW_FEATURE_PUBLIC'),
(3, '2007-12-06 04:13:02', 1, NULL, 32, '', 0, 103, 'VOTE_UP'),
(4, '2008-01-10 02:27:17', 1, NULL, 3, '', 0, 107, 'NEW_FEATURE_PUBLIC'),
(5, '2008-01-10 02:29:16', 1, NULL, 3, '', 0, 108, 'NEW_FEATURE_PUBLIC'),
(6, '2008-01-10 02:31:21', 1, NULL, 4, '', 0, 109, 'NEW_FEATURE_PUBLIC'),
(7, '2008-01-10 03:07:03', 1, NULL, 3, '', 0, 106, 'VOTE_UP'),
(8, '2008-01-10 03:07:32', 1, NULL, 5, '', 0, 17, 'VOTE_UP'),
(9, '2008-01-10 03:15:32', 1, NULL, 24, '', 0, 110, 'NEW_FEATURE_PUBLIC'),
(10, '2008-01-11 03:49:07', 1, NULL, 37, '', 0, NULL, 'NEW_LIST_FRIENDS');

-- --------------------------------------------------------

-- 
-- Table structure for table `schema_info`
-- 

CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `schema_info`
-- 

INSERT INTO `schema_info` (`version`) VALUES 
(21);

-- --------------------------------------------------------

-- 
-- Table structure for table `tags`
-- 

CREATE TABLE `tags` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `n` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

-- 
-- Dumping data for table `tags`
-- 

INSERT INTO `tags` (`id`, `name`, `n`) VALUES 
(1, 'todo', 11),
(2, 'salad', 1),
(3, 'programming', 1),
(4, 'coding', 1),
(5, 'dodge', 2),
(6, 'list', 1),
(7, 'beer', 3),
(8, 'alcohol', 1),
(9, 'latin', 1),
(10, 'worst', 3),
(11, 'asdfasdf', 3),
(12, 'best', 1),
(13, 'cameras', 1),
(14, 'digital', 1),
(15, 'photography', 1),
(16, 'my', 1),
(17, 'private', 2),
(18, 'lame', 1),
(19, 'ps3', 1),
(20, 'games', 1),
(21, 'gaming', 1),
(22, 'movies', 1),
(23, 'linux', 1),
(24, 'reasons', 1),
(25, 'iphone', 1),
(26, 'bad', 1),
(27, 'music', 1),
(28, 'rock', 1),
(29, 'indie', 1),
(30, 'tv,', 1),
(31, 'shows', 1),
(32, 'mac', 1),
(33, 'osx', 1),
(34, 'features', 1),
(35, 'personal', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `users`
-- 

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `lastname` varchar(255) default NULL,
  `date_reg` datetime default NULL,
  `birthday` date default NULL,
  `email` varchar(255) default NULL,
  `image` varchar(255) default NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `users`
-- 

INSERT INTO `users` (`id`, `username`, `password`, `name`, `lastname`, `date_reg`, `birthday`, `email`, `image`, `status`) VALUES 
(1, 'rbreve', 'a', 'Roberto', 'Breve', '2007-06-17 15:22:38', NULL, 'rbreve@gmail.com', 'mo93jimg_3397_1.jpg', 1),
(2, 'mark', 'mark', 'Mark', 'Looki', '2007-06-19 02:28:51', NULL, 'mark@gmail.com', NULL, 1),
(3, 'acorpeno', 'mackiko', 'Alejandro', 'Corp', '2007-06-30 18:12:37', NULL, 'corp@icomstec.com', 'nks45backyardigans_foto03.jpg', 1),
(4, 'wario', 'a', 'Wario', 'Ware', '2007-10-16 00:01:07', NULL, 'rbreve@gmail.com', NULL, 1),
(5, 'wario1', 'a', 'Wario', 'Ware', '2007-10-16 00:03:57', NULL, 'wario@gmail.com', 'cbc35yoafro.jpg', 1),
(6, 'The Wilmer', 'wilmer', 'Wilmer', 'Murillo', '2007-10-17 16:48:24', NULL, 'wilmern@gmail.com', 'tibb1yovolando_displaypic.jpg', 1),
(7, 'daywalker', 'tyler666', 'Wilson', 'Sanchez', '2007-10-17 16:57:12', NULL, 'wilson3122@gmail.com', 'keyo5uxdjp5863225-02.jpg', 1);
