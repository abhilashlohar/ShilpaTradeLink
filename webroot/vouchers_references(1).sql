-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2016 at 06:17 AM
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
-- Table structure for table `vouchers_references`
--

CREATE TABLE `vouchers_references` (
  `id` int(10) NOT NULL,
  `voucher_entity` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vouchers_references`
--

INSERT INTO `vouchers_references` (`id`, `voucher_entity`, `description`) VALUES
(1, 'PaymentVoucher->Paidto', 'payment '),
(2, 'Cash', 'fdghjkj'),
(3, 'Receipt Voucher', 'receipt voucher '),
(4, 'Bank', 'bnvnb'),
(5, 'pettycash', 'bnvnb'),
(6, 'bank', 'bnvnb'),
(7, 'Bank', 'bnvnb'),
(8, 'Bankcash', 'bnvnb'),
(9, 'Journal Voucher->leger1', 'bnvnb'),
(10, 'Debit Notes --> sales acc', 'bnvnb'),
(11, 'Debit Notes --> Party acc', 'bnvnb'),
(12, 'Credit Notes --> purchase acc', 'bnvnb'),
(13, 'Credit Notes --> Party acc', 'bnvnb');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `vouchers_references`
--
ALTER TABLE `vouchers_references`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `vouchers_references`
--
ALTER TABLE `vouchers_references`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
