-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2017 at 10:25 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shilpa_treding`
--

-- --------------------------------------------------------

--
-- Table structure for table `inventory_voucher_rows`
--

CREATE TABLE `inventory_voucher_rows` (
  `id` int(10) NOT NULL,
  `inventory_voucher_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory_voucher_rows`
--

INSERT INTO `inventory_voucher_rows` (`id`, `inventory_voucher_id`, `item_id`, `quantity`) VALUES
(1, 1, 38, 3),
(2, 1, 41, 5),
(3, 1, 54, 6),
(4, 2, 38, 1),
(5, 2, 37, 2),
(6, 3, 37, 1),
(7, 3, 37, 1),
(8, 3, 37, 11),
(9, 3, 38, 2),
(10, 3, 37, 3),
(11, 3, 38, 20),
(12, 3, 37, 30),
(13, 3, 38, 33),
(14, 3, 38, 44),
(15, 4, 37, 10),
(16, 4, 39, 1),
(17, 4, 37, 11),
(18, 4, 38, 20),
(19, 4, 37, 30),
(20, 4, 38, 33),
(21, 4, 38, 44),
(22, 5, 37, 11),
(23, 5, 37, 11),
(24, 5, 37, 11),
(25, 5, 38, 20),
(26, 5, 37, 30),
(27, 5, 38, 20),
(28, 5, 37, 30),
(29, 5, 38, 33),
(30, 5, 38, 44),
(31, 6, 49, 2),
(32, 6, 37, 1),
(33, 6, 40, 3),
(34, 6, 44, 4),
(35, 6, 67, 5),
(36, 6, 37, 3),
(37, 6, 38, 2),
(38, 6, 75, 20),
(39, 6, 39, 30),
(40, 6, 57, 33),
(41, 6, 68, 44),
(42, 7, 37, 1),
(43, 7, 37, 1),
(44, 7, 37, 11),
(45, 7, 38, 2),
(46, 7, 37, 3),
(47, 7, 38, 20),
(48, 7, 37, 30),
(49, 7, 38, 33),
(50, 7, 38, 44),
(51, 8, 37, 10),
(52, 8, 37, 10),
(53, 8, 37, 11),
(54, 8, 38, 2),
(55, 8, 37, 3),
(56, 8, 38, 20),
(57, 9, 37, 1),
(58, 9, 40, 1),
(59, 9, 53, 11),
(60, 9, 38, 2),
(61, 9, 37, 3),
(62, 9, 43, 20),
(63, 9, 37, 30),
(64, 9, 89, 33),
(65, 10, 37, 1),
(66, 10, 37, 1),
(67, 10, 37, 11),
(68, 10, 38, 2),
(69, 10, 37, 3),
(70, 10, 38, 20),
(71, 10, 37, 30),
(72, 10, 38, 33),
(73, 10, 38, 44),
(74, 11, 37, 11),
(75, 11, 37, 3),
(76, 11, 37, 30),
(77, 11, 38, 33),
(78, 11, 38, 44);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inventory_voucher_rows`
--
ALTER TABLE `inventory_voucher_rows`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inventory_voucher_rows`
--
ALTER TABLE `inventory_voucher_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
