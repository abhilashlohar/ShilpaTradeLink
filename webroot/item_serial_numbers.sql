-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2017 at 12:16 PM
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
-- Table structure for table `item_serial_numbers`
--

CREATE TABLE `item_serial_numbers` (
  `id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `serial_no` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `grn_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_serial_numbers`
--

INSERT INTO `item_serial_numbers` (`id`, `item_id`, `serial_no`, `status`, `grn_id`) VALUES
(1, 38, '1', 'In', 21),
(2, 38, '2', 'In', 21),
(3, 38, '3', 'In', 21),
(4, 38, '4', 'In', 21),
(5, 38, '5', 'In', 21),
(6, 112, '2', 'In', 21),
(7, 112, '13', 'In', 21),
(8, 112, '4', 'In', 21),
(9, 112, '3', 'In', 21),
(10, 112, '6', 'In', 21),
(11, 38, '1', 'In', 22),
(12, 38, '2', 'In', 22),
(13, 96, '2', 'In', 22),
(14, 96, '3', 'In', 22),
(15, 96, '41', 'In', 22),
(16, 96, '1', 'In', 22),
(27, 38, '111', 'In', 25),
(28, 38, '222', 'In', 25),
(29, 38, '333', 'In', 25);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `item_serial_numbers`
--
ALTER TABLE `item_serial_numbers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `item_serial_numbers`
--
ALTER TABLE `item_serial_numbers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
