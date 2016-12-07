-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2016 at 01:44 PM
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
(9, 7, 10, 'Cr', 1000);

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
