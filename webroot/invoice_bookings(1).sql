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
-- Table structure for table `invoice_bookings`
--

CREATE TABLE `invoice_bookings` (
  `id` int(10) NOT NULL,
  `grn_id` int(10) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `created_on` date NOT NULL,
  `company_id` int(10) NOT NULL,
  `created_by` int(10) NOT NULL,
  `ib1` varchar(10) NOT NULL,
  `ib2` varchar(10) NOT NULL,
  `ib3` varchar(10) NOT NULL,
  `ib4` varchar(10) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `due_payment` decimal(15,2) NOT NULL,
  `vendor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_bookings`
--

INSERT INTO `invoice_bookings` (`id`, `grn_id`, `invoice_no`, `created_on`, `company_id`, `created_by`, `ib1`, `ib2`, `ib3`, `ib4`, `total`, `due_payment`, `vendor_id`) VALUES
(1, 1, 'inoice1', '2017-01-04', 25, 1, 'STL', '1', 'BE-1', '16-17', '240.00', '0.00', 0),
(2, 2, 'invoice2', '2017-01-04', 25, 1, 'STL', '2', 'BE-1', '16-17', '550.00', '0.00', 2),
(3, 3, 'inv3', '2017-01-04', 25, 1, 'STL', '3', 'BE-1', '16-17', '360.00', '60.00', 2),
(4, 4, 'in4', '2017-01-04', 25, 1, 'STL', '4', 'BE-1', '16-17', '1070.00', '70.00', 2),
(5, 10, '6789', '2017-01-12', 25, 1, 'STL', '5', 'BE-1', '16-17', '300.00', '300.00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `invoice_bookings`
--
ALTER TABLE `invoice_bookings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `invoice_bookings`
--
ALTER TABLE `invoice_bookings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
