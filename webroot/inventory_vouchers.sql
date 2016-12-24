-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2016 at 10:19 AM
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
-- Table structure for table `inventory_vouchers`
--

CREATE TABLE `inventory_vouchers` (
  `id` int(10) NOT NULL,
  `invoice_id` int(10) NOT NULL,
  `invoice_row_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `iv1` varchar(10) NOT NULL,
  `iv2` varchar(10) NOT NULL,
  `iv3` varchar(10) NOT NULL,
  `iv4` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory_vouchers`
--

INSERT INTO `inventory_vouchers` (`id`, `invoice_id`, `invoice_row_id`, `item_id`, `iv1`, `iv2`, `iv3`, `iv4`) VALUES
(8, 1, 4, 124, 'STL', '1', 'BE-3', '16-17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inventory_vouchers`
--
ALTER TABLE `inventory_vouchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inventory_vouchers`
--
ALTER TABLE `inventory_vouchers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
