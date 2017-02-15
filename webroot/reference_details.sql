-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2017 at 08:02 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

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
-- Table structure for table `reference_details`
--

CREATE TABLE `reference_details` (
  `id` int(25) NOT NULL,
  `ledger_account_id` int(25) NOT NULL,
  `receipt_voucher_id` int(25) NOT NULL,
  `reference_no` varchar(50) NOT NULL,
  `credit` decimal(10,2) NOT NULL,
  `debit` decimal(10,2) NOT NULL,
  `reference_type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reference_details`
--

INSERT INTO `reference_details` (`id`, `ledger_account_id`, `receipt_voucher_id`, `reference_no`, `credit`, `debit`, `reference_type`) VALUES
(34, 4, 0, '0001', '2000.00', '0.00', 'New Reference'),
(35, 4, 0, '0002', '3000.00', '0.00', 'New Reference'),
(40, 4, 9, '0003', '0.00', '1000.00', 'New Reference'),
(41, 4, 9, '0001', '0.00', '1000.00', 'Against Reference'),
(42, 4, 9, '0002', '0.00', '2000.00', 'Against Reference'),
(43, 4, 9, '004', '0.00', '1000.00', 'Advance Reference');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reference_details`
--
ALTER TABLE `reference_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reference_details`
--
ALTER TABLE `reference_details`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
