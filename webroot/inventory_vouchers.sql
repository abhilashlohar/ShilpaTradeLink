-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2017 at 10:25 AM
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
  `job_card_id` int(10) NOT NULL,
  `iv1` varchar(10) NOT NULL,
  `iv2` varchar(10) NOT NULL,
  `iv3` varchar(10) NOT NULL,
  `iv4` varchar(10) NOT NULL,
  `created_by` int(10) NOT NULL,
  `company_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory_vouchers`
--

INSERT INTO `inventory_vouchers` (`id`, `job_card_id`, `iv1`, `iv2`, `iv3`, `iv4`, `created_by`, `company_id`) VALUES
(1, 1, 'STL', '1', 'BE-3', '16-17', 1, 25),
(2, 4, 'STL', '2', 'BE-3104', '16-17', 1, 25),
(3, 0, 'STL', '', '', '', 0, 0),
(4, 1, 'STL', '3', 'BE-3', '', 0, 0),
(5, 1, 'STL', '4', 'BE-3', '16-17', 0, 0),
(6, 1, 'STL', '5', 'BE-3', '16-17', 0, 0),
(7, 5, 'STL', '6', 'BE-3', '16-17', 0, 0),
(8, 1, 'STL', '7', 'BE-3', '16-17', 0, 0),
(9, 1, 'STL', '8', 'BE-3', '16-17', 0, 0),
(10, 1, 'STL', '9', 'BE-3', '16-17', 0, 0),
(11, 1, 'STL', '10', 'BE-3', '16-17', 0, 0);

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
