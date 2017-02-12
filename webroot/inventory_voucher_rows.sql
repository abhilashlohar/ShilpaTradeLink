-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2017 at 10:30 AM
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
  `quantity` int(10) NOT NULL,
  `left_item_id` int(10) NOT NULL,
  `invoice_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory_voucher_rows`
--

INSERT INTO `inventory_voucher_rows` (`id`, `inventory_voucher_id`, `item_id`, `quantity`, `left_item_id`, `invoice_id`) VALUES
(26, 2, 38, 11, 38, 4),
(33, 2, 112, 22, 44, 4),
(34, 2, 119, 33, 44, 4),
(35, 2, 112, 22, 44, 4),
(36, 2, 119, 33, 44, 4),
(37, 2, 112, 22, 44, 4),
(38, 2, 119, 33, 44, 4);

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
