-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2015 at 07:19 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vatsav`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` varchar(255) DEFAULT NULL,
  `to_user` varchar(255) DEFAULT NULL,
  `message` varchar(5000) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `seen` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `from_user`, `to_user`, `message`, `status`, `seen`) VALUES
(1, 'rama', 'rama12', 'VO2qg1veQym5RgBB4uGSE5zvkoKAlfaGp0iVJv7T355FyAcRZnSzyg8mYCpmthG8MzqN5mCW7ZHD7iEvMCXCkOyBudWvtF5X0wr2', 'viewed', '2015-10-18 15:29:44'),
(2, 'rama', 'rama12', '4haYynZvsfT3ZJRcSbm2lrma7PjFodd8UWwGRPcTZfIRw22b9xEW6zvJ6w4EmckjBYKM3FhFqDp3VI6xhfOdI6wGXAI1czkQbnQf', 'viewed', '2015-10-18 15:29:44'),
(3, 'rama', 'rama1', 'NInYBcL1gilQRdZq0G1dMVicLDaP53s4jSvqxmbPmbPLTBgcHiQBTvpV3XkFiRpMcV1KQoZvQXFyiQUQMM2RoYUyJaRoSyKnsQTW', 'sent', '2015-10-11 15:18:57'),
(4, 'rama12', 'rama', 'ORymShOBdhzYFQqdAquwO1kDF43L1zfCdX1q5eWTYQ8gJLaeGt81HUEn7ANtLra40WRmF4s46i3p9zg79naoYGlYVXV4SbsoaN4a', 'recieved', '2015-10-11 20:06:42'),
(5, 'rama12', 'rama', 'BBmrWfKS0azEClqs7dpxmN7AHwEQXmB2tN3l7NBwePlMDRSOGmhSehaFB7CpEPePJS68FeP2PnuM1gH3Cmw6sEACTAXQJ9fumOxM', 'recieved', '2015-10-11 20:06:42'),
(6, 'rama12', 'rama', 'ENwTaWf9b4TnsxWFacmD2mDljTIpH84VoWGt9D08940x9AaLl1sosKkxIzLLPRec1sHp0HDv0qZ5JZgepepwLuT50CHuQXhQwlBJ', 'recieved', '2015-10-11 20:06:42'),
(7, 'rama1', 'rama', 'gIaR0bMf4lOf2VCl193vBJqbSTCnrlXwnjhBivV6h9LXVY7FkbQb5vhYh8g1vP8MSMLdXItPRQ6xbT0R051JW8vD3ghxXbHUK7CI', 'recieved', '2015-10-11 20:07:13'),
(8, 'rama', 'rama1', 'qPpO0PHfV4SzaaE6acgFWMqEUZlR5qKFTaQTlPmSSvwusL24AJ8rdYwXNBqtjdzjfS9lydUTGj3NEKjpSDTAmyvEyBosrngmtYla', 'sent', '2015-10-18 15:10:51'),
(9, 'rama12', 'rama', 'oustH6r82Uv6nvnIbYfPqVQLzrpnA7D1X3KwCPse4y00hP6aHIXyiQiyyhlXqCN9oZTWqWmHZAng3wIY4QyF28CHou9U8vQEIiVK', 'recieved', '2015-10-11 20:07:13'),
(10, 'rama1', 'rama1', 'oJM4SS7q1cYDVUbEaI7WSRBuB3ZKtu6G3VjNszr0h7QPBOmc1mlBEZC03pySlQYb60doq79tUU6TFAUDgSW9NZ1pSDuSA3cywXvR', 'recieved', '2015-10-18 15:26:38'),
(11, 'rama12', 'rama12', 'fQWRgUykRMG4KOLc9ONjMadtSG1j8JFUM87QwgQeBVPEJuwc7OUtucrz3w64y6m5bOacFY0verQBAz9zXaT14Bx27I3dQRVEsR6V', 'viewed', '2015-10-18 15:29:44'),
(12, 'rama1', 'rama', '9JlKVk0FjGULVwowS3iTI1ZmzCiT2zyXb6BwCVO2qg1veQym5RgBB4uGSE5zvkoKAlfaGp0iVJv7T355FyAcRZnSzyg8mYCpmthG', 'recieved', '2015-10-18 15:26:38');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE IF NOT EXISTS `education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `passout` int(4) DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL,
  `university` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `f1` varchar(255) DEFAULT NULL,
  `f2` varchar(255) DEFAULT NULL,
  `fstatus` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `confirmed_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `location` varchar(2000) DEFAULT NULL,
  `times` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `user_name`, `latitude`, `longitude`, `location`, `times`) VALUES
(1, 'rama', 17.4502375, 17.4502375, '103/136, Anjaiah Nagar, Gachibowli, Hyderabad, Telangana 500081, India', '2015-10-22 23:16:05');

-- --------------------------------------------------------

--
-- Table structure for table `universities`
--

CREATE TABLE IF NOT EXISTS `universities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `universities`
--

INSERT INTO `universities` (`id`, `name`, `uuid`) VALUES
(1, 'Adipiscing Elit Etiam Consulting', '78192'),
(2, 'Eget Metus Eu Corp.', '76084'),
(3, 'Phasellus Vitae Corporation', '14997'),
(4, 'Integer LLP', '2496XW'),
(5, 'Morbi Limited', '5585'),
(6, 'Adipiscing Lobortis Consulting', '49462'),
(7, 'Non LLP', '22778'),
(8, 'Aliquam Corporation', '60264'),
(9, 'Lectus Corp.', '01217'),
(10, 'At Pede Cras Consulting', '10534-672'),
(11, 'Maecenas Ornare Company', '20234'),
(12, 'Integer Aliquam Adipiscing Foundation', '8475CG'),
(13, 'Aliquam Eros Incorporated', '6709'),
(14, 'Congue Company', '71408'),
(15, 'At Associates', '1678'),
(16, 'Lacus Institute', '4135'),
(17, 'Adipiscing Elit Aliquam PC', '61-765'),
(18, 'Lorem Donec LLC', '23795'),
(19, 'Aenean Euismod Corporation', 'R7 4QV'),
(20, 'Adipiscing Ltd', 'UH6G 0NO'),
(21, 'Euismod Urna Nullam Ltd', '9855UD'),
(22, 'Vel Industries', '37225'),
(23, 'Cras Vehicula Aliquet Corporation', 'H3 0WR'),
(24, 'Purus Duis Inc.', '20417'),
(25, 'Nullam Nisl Company', '5943NC'),
(26, 'At Institute', '5590SL'),
(27, 'Eu Sem Institute', '64036'),
(28, 'Vitae Incorporated', '17576'),
(29, 'Aliquam Arcu Aliquam LLP', '54-890'),
(30, 'Mauris Rhoncus Id Industries', '4162'),
(31, 'Ligula Nullam Associates', '65816'),
(32, 'Proin Ltd', '95296'),
(33, 'Magna Associates', '35674'),
(34, 'Porttitor Vulputate Incorporated', '8313'),
(35, 'Est Ac Facilisis Associates', '42752'),
(36, 'Augue Id Ante Industries', '94-009'),
(37, 'Suspendisse Aliquet Molestie Consulting', '83004-975'),
(38, 'Ac Inc.', 'GL1 7CZ'),
(39, 'Amet Corporation', '60009'),
(40, 'Sed Sapien Associates', '8127'),
(41, 'Ornare Institute', '100261'),
(42, 'Sed Dui Fusce Industries', '41670'),
(43, 'Eu Arcu Morbi LLC', '43688'),
(44, 'Sed Associates', '1478'),
(45, 'Sapien Cursus Institute', '72313'),
(46, 'Nunc Sed Limited', '7083'),
(47, 'Risus Morbi LLP', 'X8L 7P0'),
(48, 'Nam Porttitor Associates', '5700'),
(49, 'Et Magnis Foundation', 'ID4U 2UP'),
(50, 'Nisl Nulla Limited', '1241'),
(51, 'Elit Incorporated', '6826'),
(52, 'Velit Pellentesque Ultricies Ltd', '30101'),
(53, 'Risus Institute', '8004'),
(54, 'Elementum Limited', '95-783'),
(55, 'Velit Cras Lorem LLP', 'T4B 9V2'),
(56, 'Sed Ltd', '4080IH'),
(57, 'Nibh Ltd', '41671'),
(58, 'Consectetuer Inc.', '52369'),
(59, 'At Nisi Cum Limited', '24589'),
(60, 'Ipsum LLP', '42490'),
(61, 'Tellus Foundation', '3391'),
(62, 'Elit Pellentesque Foundation', '95-471'),
(63, 'Mauris Id PC', '9896LQ'),
(64, 'Volutpat Company', '59-150'),
(65, 'Libero Inc.', '4618'),
(66, 'Vel Turpis Corporation', '9485'),
(67, 'Et Netus Ltd', '99918'),
(68, 'Nullam Consulting', '0302BO'),
(69, 'Sem LLP', 'OR84 9TW'),
(70, 'Dis Parturient LLP', '5650OD'),
(71, 'Dictum Eu Consulting', '3987'),
(72, 'Lobortis Institute', '80734'),
(73, 'Dapibus PC', '8535BX'),
(74, 'Sagittis Duis Gravida Corporation', '6578'),
(75, 'Neque Morbi Associates', '9664'),
(76, 'Semper Nam Tempor Company', '50709'),
(77, 'At Pretium Aliquet Limited', '5660'),
(78, 'Blandit Corp.', 'M23 7EI'),
(79, 'Suspendisse Ac Metus PC', '661619'),
(80, 'Mollis Associates', '300422'),
(81, 'In Faucibus Consulting', '14247'),
(82, 'Ut Pellentesque Foundation', '27-879'),
(83, 'Lacinia Orci Consectetuer Company', '9465'),
(84, 'Aliquet Vel Vulputate PC', '2885'),
(85, 'Ante Iaculis Incorporated', '63453-311'),
(86, 'Diam Proin Ltd', 'ZM95 2RA'),
(87, 'Suscipit Nonummy Fusce Consulting', '73222'),
(88, 'Ut Nulla Ltd', '733014'),
(89, 'Magna Nec Quam Corporation', '1490'),
(90, 'Pellentesque Incorporated', '14325'),
(91, 'Donec PC', '11411'),
(92, 'Non LLC', '666565'),
(93, 'Amet Risus Consulting', '9659'),
(94, 'Vel Est Consulting', '72-985'),
(95, 'Gravida Praesent Eu Consulting', '24410'),
(96, 'Aenean Eget Company', '6485'),
(97, 'Lacus Vestibulum Lorem Inc.', '66981'),
(98, 'Diam Duis Mi Foundation', '1531'),
(99, 'In Nec Company', '640847'),
(100, 'Justo Proin Non Incorporated', '817699');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `online_status` datetime DEFAULT NULL,
  `last_active` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `password`, `email`, `first_name`, `last_name`, `phone`, `gender`, `online_status`, `last_active`) VALUES
(1, 'rama', 'rama', 'ramkey.sam@gmail.com', NULL, NULL, NULL, NULL, '2015-10-22 23:16:05', '2015-10-22 23:16:05'),
(2, 'rama1', 'rama', 'ramkey1.sam@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'rama12', 'rama', 'ramkey.sam@gmail.com1', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `work`
--

CREATE TABLE IF NOT EXISTS `work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
