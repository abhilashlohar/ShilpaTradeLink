-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2017 at 08:11 AM
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
-- Table structure for table `receipt_breakups`
--

CREATE TABLE `receipt_breakups` (
  `id` int(10) NOT NULL,
  `ref_type` varchar(30) NOT NULL,
  `new_ref_no` varchar(100) DEFAULT NULL,
  `invoice_id` int(10) NOT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `receipt_voucher_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receipt_breakups`
--

INSERT INTO `receipt_breakups` (`id`, `ref_type`, `new_ref_no`, `invoice_id`, `amount`, `receipt_voucher_id`) VALUES
(2, 'Agst Ref', '', 1, '5000.00', 6),
(3, 'On Account', NULL, 0, '25000.00', 6),
(4, 'Advance', 'tgy', 0, '15000.00', 6),
(5, 'New Ref', 'uiyi', 0, '5000.00', 6),
(6, 'Agst Ref', '', 1, '10000.00', 7),
(7, 'New Ref', 'wertyu', 0, '50000.00', 7),
(8, 'Agst Ref', '', 1, '3000.00', 8),
(9, 'New Ref', 'jhg', 0, '3000.00', 8),
(10, 'Agst Ref', '', 1, '500.00', 9),
(11, 'New Ref', 'dfgh', 0, '500.00', 9),
(12, 'Agst Ref', '', 1, '500.00', 10),
(13, 'New Ref', 'dfgh', 0, '500.00', 10),
(14, 'Agst Ref', '', 1, '300.00', 11),
(15, 'New Ref', 'jhgv', 0, '400.00', 11),
(16, 'Agst Ref', '', 1, '300.00', 12),
(17, 'New Ref', 'jhgv', 0, '400.00', 12),
(18, 'Agst Ref', '', 1, '500.00', 13),
(19, 'On Account', NULL, 0, '200.00', 13),
(20, 'Agst Ref', '', 1, '500.00', 14),
(21, 'On Account', NULL, 0, '200.00', 14),
(22, 'Agst Ref', '', 1, '500.00', 15),
(23, 'On Account', NULL, 0, '200.00', 15),
(24, 'Agst Ref', '', 1, '500.00', 16),
(25, 'On Account', NULL, 0, '200.00', 16),
(26, 'Agst Ref', '', 1, '500.00', 17),
(27, 'On Account', NULL, 0, '200.00', 17),
(28, 'Agst Ref', '', 1, '500.00', 18),
(29, 'On Account', NULL, 0, '200.00', 18),
(30, 'Agst Ref', '', 1, '500.00', 19),
(31, 'On Account', NULL, 0, '200.00', 19),
(32, 'Agst Ref', '', 1, '500.00', 20),
(33, 'On Account', NULL, 0, '200.00', 20),
(34, 'Agst Ref', '', 1, '500.00', 21),
(35, 'On Account', NULL, 0, '200.00', 21),
(36, 'Agst Ref', '', 1, '600.00', 22),
(37, 'On Account', NULL, 0, '100.00', 22),
(38, 'Agst Ref', '', 1, '600.00', 23),
(39, 'On Account', NULL, 0, '100.00', 23),
(40, 'Agst Ref', '', 1, '600.00', 24),
(41, 'On Account', NULL, 0, '100.00', 24),
(42, 'Agst Ref', '', 1, '600.00', 25),
(43, 'On Account', NULL, 0, '100.00', 25),
(44, 'Agst Ref', '', 1, '600.00', 26),
(45, 'On Account', NULL, 0, '100.00', 26),
(46, 'Agst Ref', '', 1, '600.00', 27),
(47, 'On Account', NULL, 0, '100.00', 27),
(48, 'Agst Ref', '', 1, '600.00', 28),
(49, 'On Account', NULL, 0, '100.00', 28),
(50, 'Agst Ref', '', 1, '600.00', 29),
(51, 'On Account', NULL, 0, '100.00', 29),
(52, 'Agst Ref', '', 1, '948.00', 30),
(53, 'Agst Ref', '', 2, '958.00', 30),
(54, 'New Ref', '789', 0, '2094.00', 30),
(55, 'Agst Ref', '', 2, '2000.00', 31),
(56, 'On Account', NULL, 0, '4000.00', 31),
(57, 'Agst Ref', '', 2, '2000.00', 32),
(58, 'On Account', NULL, 0, '4000.00', 32),
(59, 'Agst Ref', '', 1, '4000.82', 33),
(60, 'Agst Ref', '', 3, '856.00', 33),
(61, 'On Account', NULL, 0, '50000.00', 33),
(62, 'New Ref', 'rgf', 0, '14000.00', 33),
(63, 'Advance', 'ytt', 0, '1143.18', 33),
(64, '', NULL, 0, '7000.00', 34),
(71, 'Agst Ref', '', 1, '3000.00', 41),
(72, 'On Account', NULL, 0, '3000.00', 41),
(74, 'Agst Ref', '', 1, '4000.00', 43),
(75, '', NULL, 0, NULL, 43),
(76, 'Agst Ref', '', 1, '400.00', 44),
(77, '', NULL, 0, NULL, 44),
(78, 'Agst Ref', '', 1, '3000.00', 45),
(79, '', NULL, 0, NULL, 45),
(80, 'Agst Ref', '', 1, '400.00', 46),
(81, 'New Ref', '564', 0, '1000.00', 47),
(82, 'Advance', 'rt654', 0, '1000.00', 47),
(83, 'New Ref', '456', 0, '1000.00', 48),
(84, 'On Account', NULL, 0, '2000.00', 48),
(85, 'Advance', '876', 0, '1000.00', 48),
(86, 'Agst Ref', '', 4, '1000.00', 49);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `receipt_breakups`
--
ALTER TABLE `receipt_breakups`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `receipt_breakups`
--
ALTER TABLE `receipt_breakups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
