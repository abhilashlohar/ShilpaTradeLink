-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2017 at 08:03 AM
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
-- Table structure for table `reference_balances`
--

CREATE TABLE `reference_balances` (
  `id` int(25) NOT NULL,
  `ledger_account_id` int(25) NOT NULL,
  `reference_no` varchar(30) NOT NULL,
  `credit` decimal(15,2) NOT NULL,
  `debit` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reference_balances`
--

INSERT INTO `reference_balances` (`id`, `ledger_account_id`, `reference_no`, `credit`, `debit`) VALUES
(29, 4, '0002', '3000.00', '2000.00'),
(32, 4, '0001', '2000.00', '1000.00'),
(33, 4, '0003', '0.00', '1000.00'),
(34, 4, '004', '0.00', '1000.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reference_balances`
--
ALTER TABLE `reference_balances`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reference_balances`
--
ALTER TABLE `reference_balances`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
