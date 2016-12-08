-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2016 at 01:32 PM
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
-- Table structure for table `journal_voucher_rows`
--

CREATE TABLE `journal_voucher_rows` (
  `id` int(10) NOT NULL,
  `journal_voucher_id` int(10) NOT NULL,
  `ledger_account_id` int(10) NOT NULL,
  `cr_dr` varchar(10) NOT NULL,
  `amount` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `journal_voucher_rows`
--

INSERT INTO `journal_voucher_rows` (`id`, `journal_voucher_id`, `ledger_account_id`, `cr_dr`, `amount`) VALUES
(1, 4, 2, 'Dr', 11),
(2, 4, 3, 'Cr', 11),
(3, 5, 2, 'Dr', 100),
(4, 5, 1, 'Cr', 300),
(5, 5, 3, 'Dr', 200),
(6, 6, 3, 'Dr', 12),
(7, 6, 1, 'Cr', 12),
(8, 7, 1, 'Dr', 1000),
(9, 7, 10, 'Cr', 1000),
(10, 8, 1, 'Dr', 1000),
(11, 8, 10, 'Cr', 1000),
(12, 9, 1, 'Dr', 11),
(13, 9, 2, 'Cr', 11),
(14, 10, 1, 'Dr', 11),
(15, 10, 2, 'Cr', 11),
(16, 11, 1, 'Dr', 11),
(17, 11, 2, 'Cr', 11),
(18, 12, 1, 'Dr', 11),
(19, 12, 2, 'Cr', 11),
(20, 13, 1, 'Dr', 11),
(21, 13, 2, 'Cr', 11),
(22, 14, 1, 'Dr', 11),
(23, 14, 2, 'Cr', 11),
(24, 15, 1, 'Dr', 11),
(25, 15, 2, 'Cr', 11),
(26, 16, 1, 'Dr', 11),
(27, 16, 2, 'Cr', 11),
(28, 17, 1, 'Dr', 11),
(29, 17, 2, 'Cr', 11),
(30, 18, 1, 'Dr', 11),
(31, 18, 2, 'Cr', 11),
(32, 19, 1, 'Dr', 11),
(33, 19, 2, 'Cr', 11),
(34, 20, 1, 'Dr', 11),
(35, 20, 2, 'Cr', 11),
(36, 21, 1, 'Dr', 11),
(37, 21, 2, 'Cr', 11),
(38, 22, 1, 'Dr', 11),
(39, 22, 2, 'Cr', 11),
(40, 23, 1, 'Dr', 11),
(41, 23, 2, 'Cr', 11),
(42, 24, 1, 'Dr', 11),
(43, 24, 2, 'Cr', 11),
(44, 25, 1, 'Dr', 11),
(45, 25, 2, 'Cr', 11),
(46, 26, 1, 'Dr', 11),
(47, 26, 2, 'Cr', 11),
(48, 27, 1, 'Dr', 11),
(49, 27, 2, 'Cr', 11),
(50, 28, 1, 'Dr', 11),
(51, 28, 2, 'Cr', 11),
(52, 29, 1, 'Dr', 11),
(53, 29, 2, 'Cr', 11),
(54, 30, 1, 'Dr', 200),
(55, 30, 10, 'Cr', 200),
(56, 31, 2, 'Dr', 234),
(57, 31, 10, 'Cr', 234);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `journal_voucher_rows`
--
ALTER TABLE `journal_voucher_rows`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `journal_voucher_rows`
--
ALTER TABLE `journal_voucher_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
