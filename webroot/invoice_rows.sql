-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2017 at 10:33 AM
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
-- Table structure for table `invoice_rows`
--

CREATE TABLE `invoice_rows` (
  `id` int(10) NOT NULL,
  `invoice_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `rate` decimal(15,2) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `height` int(3) NOT NULL,
  `item_serial_number` varchar(10) NOT NULL,
  `inventory_voucher_status` varchar(20) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_rows`
--

INSERT INTO `invoice_rows` (`id`, `invoice_id`, `item_id`, `description`, `quantity`, `rate`, `amount`, `height`, `item_serial_number`, `inventory_voucher_status`) VALUES
(3, 2, 38, 'ebbeb', 1, '45.99', '45.99', 0, '3', 'Pending'),
(4, 2, 63, 'eeee', 1, '11000.00', '11000.00', 0, '6', 'Pendi'),
(5, 3, 38, 'ebbeb', 1, '45.99', '45.99', 0, '4', 'Pending'),
(6, 3, 63, 'eeee', 21, '11000.00', '231000.00', 0, '', 'Pending'),
(7, 4, 38, 'ebbeb', 2, '45.99', '91.98', 0, '', 'Done'),
(8, 4, 44, 'eeee', 22, '11000.00', '242000.00', 0, '', 'Pending');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `invoice_rows`
--
ALTER TABLE `invoice_rows`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `invoice_rows`
--
ALTER TABLE `invoice_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
