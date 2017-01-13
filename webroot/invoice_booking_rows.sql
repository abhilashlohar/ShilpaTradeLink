-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2017 at 02:05 PM
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
-- Table structure for table `invoice_booking_rows`
--

CREATE TABLE `invoice_booking_rows` (
  `id` int(11) NOT NULL,
  `invoice_booking_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `rate` decimal(15,2) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_booking_rows`
--

INSERT INTO `invoice_booking_rows` (`id`, `invoice_booking_id`, `item_id`, `quantity`, `rate`, `amount`, `description`) VALUES
(8, 1, 41, 3, '80.00', '240.0000', 'asdrfgyhj'),
(9, 2, 42, 3, '50.00', '150.0000', 'fghj'),
(10, 2, 41, 5, '80.00', '400.0000', 'sdfghj'),
(11, 3, 58, 6, '60.00', '360.0000', 'asdrfgyhj'),
(24, 4, 41, 4, '70.00', '280.0000', 'kjhg'),
(25, 4, 43, 6, '90.00', '540.0000', 'jkhg'),
(26, 4, 62, 5, '50.00', '250.0000', 'lkjhg'),
(27, 5, 40, 1, '70.00', '70.0000', 'item1'),
(28, 5, 41, 1, '80.00', '80.0000', 'item2'),
(29, 5, 43, 3, '50.00', '150.0000', 'xdfg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `invoice_booking_rows`
--
ALTER TABLE `invoice_booking_rows`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `invoice_booking_rows`
--
ALTER TABLE `invoice_booking_rows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
