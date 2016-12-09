-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2016 at 06:59 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

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
-- Table structure for table `receipt_vouchers`
--

CREATE TABLE `receipt_vouchers` (
  `id` int(11) NOT NULL,
  `received_from_id` int(11) NOT NULL,
  `bank_cash_id` int(11) NOT NULL,
  `narration` text NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` date NOT NULL,
  `payment_mode` varchar(10) NOT NULL,
  `company_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `payment_process` varchar(20) NOT NULL,
  `new_ref_number` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receipt_vouchers`
--

INSERT INTO `receipt_vouchers` (`id`, `received_from_id`, `bank_cash_id`, `narration`, `amount`, `created_by`, `created_on`, `payment_mode`, `company_id`, `transaction_date`, `payment_process`, `new_ref_number`) VALUES
(1, 5, 11, 'being received from gopal', '400.00', 1, '2016-12-03', 'Cash', 27, '2016-12-03', '', ''),
(2, 1, 2, 'dsfgdfg', '200.00', 1, '2016-12-06', 'Cheque', 0, '2016-12-06', '', ''),
(3, 3, 5, 'sdfsdf', '100.00', 1, '2016-12-07', 'Cheque', 0, '2016-12-07', '', ''),
(4, 2, 3, 'rdgrsyr\r\nretyrey', '400.00', 1, '2016-12-08', 'Cheque', 26, '2016-12-08', 'New Reference Number', ''),
(5, 3, 5, 'sadfsadf\r\nsdfsdf', '100.00', 1, '2016-12-08', 'Cheque', 26, '2016-12-08', 'New Reference Number', '32432'),
(6, 2, 5, 'werewr\r\nwerwer', '1000.00', 1, '2016-12-08', 'Cheque', 27, '2016-12-08', 'On Account Pay', ''),
(7, 1, 4, 'erwet\r\nretert			', '500.00', 1, '2016-12-08', 'Cheque', 26, '2016-12-08', 'On Account Pay', ''),
(8, 1, 4, 'erwet\r\nretert			', '100.00', 1, '2016-12-08', 'Cash', 26, '2016-12-08', 'Against Reference Nu', ''),
(9, 1, 4, 'erwet\r\nretert			', '100.00', 1, '2016-12-08', 'Cash', 26, '2016-12-08', 'Against Reference Nu', ''),
(10, 1, 4, 'erwet\r\nretert			', '100.00', 1, '2016-12-08', 'Cash', 26, '2016-12-08', 'Against Reference Nu', ''),
(11, 1, 4, 'erwet\r\nretert			', '100.00', 1, '2016-12-08', 'Cash', 26, '2016-12-08', 'Against Reference Nu', ''),
(12, 1, 4, 'erwet\r\nretert			', '100.00', 1, '2016-12-08', 'Cash', 26, '2016-12-08', 'Against Reference Nu', ''),
(13, 1, 4, 'erwet\r\nretert			', '100.00', 1, '2016-12-08', 'Cash', 26, '2016-12-08', 'Against Reference Nu', ''),
(14, 1, 4, 'erwet\r\nretert			', '100.00', 1, '2016-12-08', 'Cash', 26, '2016-12-08', 'Against Reference Nu', ''),
(15, 1, 4, 'erwet\r\nretert			', '100.00', 1, '2016-12-08', 'Cash', 26, '2016-12-08', 'Against Reference Nu', ''),
(16, 1, 4, 'erwet\r\nretert			', '100.00', 1, '2016-12-08', 'Cash', 26, '2016-12-08', 'Against Reference Nu', ''),
(17, 1, 4, 'erwet\r\nretert			', '100.00', 1, '2016-12-08', 'Cash', 26, '2016-12-08', 'Against Reference Nu', ''),
(18, 1, 4, 'erwet\r\nretert			', '100.00', 1, '2016-12-08', 'Cash', 26, '2016-12-08', 'Against Reference Nu', ''),
(19, 1, 4, 'erwet\r\nretert			', '100.00', 1, '2016-12-08', 'Cash', 26, '2016-12-08', 'Against Reference Nu', ''),
(20, 1, 4, 'erwet\r\nretert			', '100.00', 1, '2016-12-08', 'Cash', 26, '2016-12-08', 'Against Reference Nu', ''),
(21, 1, 4, 'erwet\r\nretert			', '100.00', 1, '2016-12-08', 'Cash', 26, '2016-12-08', 'Against Reference Nu', ''),
(22, 1, 4, 'erwet\r\nretert			', '100.00', 1, '2016-12-08', 'Cash', 26, '2016-12-08', 'Against Reference Nu', ''),
(23, 1, 4, 'erwet\r\nretert			', '100.00', 1, '2016-12-08', 'Cash', 26, '2016-12-08', 'Against Reference Nu', ''),
(24, 15, 1, 'esfewf\r\nwefewf', '300.00', 1, '2016-12-08', 'Cheque', 26, '2016-12-08', 'Against Reference Nu', ''),
(25, 15, 1, 'esfewf\r\nwefewf', '300.00', 1, '2016-12-08', 'Cheque', 26, '2016-12-08', 'Against Reference Nu', ''),
(26, 15, 1, 'esfewf\r\nwefewf', '300.00', 1, '2016-12-08', 'Cheque', 26, '2016-12-08', 'Against Reference Nu', ''),
(27, 15, 1, 'esfewf\r\nwefewf', '300.00', 1, '2016-12-08', 'Cheque', 26, '2016-12-08', 'Against Reference Nu', ''),
(28, 15, 1, 'esfewf\r\nwefewf', '300.00', 1, '2016-12-08', 'Cheque', 26, '2016-12-08', 'Against Reference Nu', ''),
(29, 15, 1, 'esfewf\r\nwefewf', '300.00', 1, '2016-12-08', 'Cheque', 26, '2016-12-08', 'Against Reference Nu', ''),
(30, 3, 2, 'sdfsdf', '30000.00', 1, '2016-12-08', 'Cheque', 25, '2016-12-08', 'Against Reference Nu', ''),
(31, 14, 3, 'erewr\r\nwerwe', '30000.00', 1, '2016-12-08', 'Cash', 25, '2016-12-08', 'Against Reference Nu', ''),
(32, 14, 3, 'erewr\r\nwerwe', '30000.00', 1, '2016-12-08', 'Cash', 25, '2016-12-08', 'Against Reference Nu', ''),
(33, 14, 3, 'erewr\r\nwerwe', '30000.00', 1, '2016-12-08', 'Cash', 25, '2016-12-08', 'Against Reference Nu', ''),
(34, 15, 2, 'assaf\r\n', '30000.00', 1, '2016-12-08', 'Cheque', 26, '2016-12-08', 'Against Reference Nu', ''),
(35, 15, 3, 'dfgdfg\r\ndfgdfgd', '100.00', 1, '2016-12-08', 'Cheque', 26, '2016-12-09', 'Against Reference Nu', ''),
(36, 15, 2, 'sdfsdf\r\nsdf', '100.00', 1, '2016-12-08', 'Cheque', 27, '2016-12-08', 'Against Reference Nu', ''),
(37, 15, 2, 'sdfsdf\r\nsdf', '100.00', 1, '2016-12-08', 'Cheque', 27, '2016-12-08', 'Against Reference Nu', ''),
(38, 15, 2, 'sdfsdf\r\nsdf', '100.00', 1, '2016-12-08', 'Cheque', 27, '2016-12-08', 'Against Reference Nu', ''),
(39, 15, 2, 'sdfsdf\r\nsdf', '100.00', 1, '2016-12-08', 'Cheque', 27, '2016-12-08', 'Against Reference Nu', ''),
(40, 15, 3, 'sdfdsf\r\nsdfdsf', '100.00', 1, '2016-12-08', 'Cheque', 25, '2016-12-08', 'Against Reference Nu', ''),
(41, 15, 3, 'sdfdsf\r\nsdfdsf', '25000.00', 1, '2016-12-08', 'Cheque', 25, '2016-12-08', 'Against Reference Nu', ''),
(42, 1, 2, 'sgfdsg', '100.00', 1, '2016-12-08', 'Cheque', 26, '2016-12-08', 'On Account Pay', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `receipt_vouchers`
--
ALTER TABLE `receipt_vouchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `receipt_vouchers`
--
ALTER TABLE `receipt_vouchers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
