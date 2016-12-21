-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2016 at 10:53 AM
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
-- Table structure for table `job_cards`
--

CREATE TABLE `job_cards` (
  `id` int(10) NOT NULL,
  `sales_order_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  `jc1` varchar(10) NOT NULL,
  `jc2` varchar(10) NOT NULL,
  `jc3` varchar(10) NOT NULL,
  `jc4` varchar(10) NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_on` date NOT NULL,
  `customer_id` int(10) NOT NULL,
  `dispatch_name` varchar(100) NOT NULL,
  `dispatch_email` varchar(100) NOT NULL,
  `dispatch_address` varchar(100) NOT NULL,
  `customer_po_no` varchar(10) NOT NULL,
  `required_date` date NOT NULL,
  `packing` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_cards`
--

INSERT INTO `job_cards` (`id`, `sales_order_id`, `company_id`, `jc1`, `jc2`, `jc3`, `jc4`, `created_by`, `created_on`, `customer_id`, `dispatch_name`, `dispatch_email`, `dispatch_address`, `customer_po_no`, `required_date`, `packing`) VALUES
(4, 14, 25, 'STL', '2', 'BE-3226', '16-17', 1, '2016-12-21', 1, 'Qwe', 'adasd@wqdw.fwed', 'wscfwedc', 'wqd', '2016-12-06', 'fsad'),
(5, 2, 25, 'STL', '1', 'BE-3', '16-17', 1, '2016-12-21', 1, 'Rajesh', 'rajesh@gmail.com', 'Dispatch Details Address', 'po12', '2016-12-13', 'PACKING');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `job_cards`
--
ALTER TABLE `job_cards`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `job_cards`
--
ALTER TABLE `job_cards`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
