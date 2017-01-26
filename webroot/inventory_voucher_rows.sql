-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2017 at 11:36 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

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
  `invoice_row_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory_voucher_rows`
--

INSERT INTO `inventory_voucher_rows` (`id`, `inventory_voucher_id`, `invoice_row_id`, `item_id`, `quantity`) VALUES
(1, 1, 6, 147, 4),
(2, 1, 6, 150, 5),
(3, 1, 7, 147, 3),
(4, 1, 7, 149, 5),
(5, 1, 7, 146, 4),
(6, 1, 8, 148, 3),
(7, 1, 8, 150, 4);

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
