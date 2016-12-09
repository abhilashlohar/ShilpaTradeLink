-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2016 at 12:28 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

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
-- Table structure for table `petty_cash_receipt_vouchers`
--

CREATE TABLE `petty_cash_receipt_vouchers` (
  `id` int(10) NOT NULL,
  `received_from_id` int(10) NOT NULL,
  `bank_cash_id` int(10) NOT NULL,
  `narration` text NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petty_cash_receipt_vouchers`
--

INSERT INTO `petty_cash_receipt_vouchers` (`id`, `received_from_id`, `bank_cash_id`, `narration`, `amount`, `created_by`, `created_on`) VALUES
(1, 4, 6, 'rfgh', '111.00', 2, '2016-11-29'),
(2, 10, 9, 'qwertty', '12345.00', 2, '2016-11-30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `petty_cash_receipt_vouchers`
--
ALTER TABLE `petty_cash_receipt_vouchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `petty_cash_receipt_vouchers`
--
ALTER TABLE `petty_cash_receipt_vouchers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
