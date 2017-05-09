-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: May 09, 2017 at 05:11 AM
-- Server version: 5.6.32-78.0-log
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wwwshant_livestl`
--

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

CREATE TABLE IF NOT EXISTS `purchase_returns` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_booking_id` int(10) NOT NULL,
  `created_on` date NOT NULL,
  `company_id` int(10) NOT NULL,
  `created_by` int(10) NOT NULL,
  `voucher_no` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `purchase_returns`
--

INSERT INTO `purchase_returns` (`id`, `invoice_booking_id`, `created_on`, `company_id`, `created_by`, `voucher_no`) VALUES
(2, 1, '2017-04-25', 25, 16, 0),
(3, 3, '2017-04-29', 25, 16, 0),
(4, 6, '2017-05-05', 25, 16, 0),
(6, 7, '2017-05-05', 25, 16, 0),
(7, 2, '2017-05-05', 25, 16, 0),
(8, 12, '2017-05-05', 25, 16, 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_rows`
--

CREATE TABLE IF NOT EXISTS `purchase_return_rows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `purchase_return_rows`
--

INSERT INTO `purchase_return_rows` (`id`, `item_id`, `quantity`) VALUES
(7, 589, 1),
(10, 1191, 495),
(11, 1192, 404),
(12, 1171, 2),
(14, 963, 2),
(15, 966, 1),
(16, 1178, 1),
(17, 746, 5),
(18, 782, 2),
(19, 1207, 2),
(28, 867, 2),
(29, 1039, 60),
(30, 1038, 91),
(31, 1040, 23),
(32, 1041, 23),
(33, 1185, 1),
(34, 1038, 239),
(35, 1214, 8);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
