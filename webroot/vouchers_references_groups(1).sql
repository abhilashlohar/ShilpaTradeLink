-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2016 at 06:18 AM
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
-- Table structure for table `vouchers_references_groups`
--

CREATE TABLE `vouchers_references_groups` (
  `id` int(10) NOT NULL,
  `vouchers_reference_id` int(10) NOT NULL,
  `account_group_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vouchers_references_groups`
--

INSERT INTO `vouchers_references_groups` (`id`, `vouchers_reference_id`, `account_group_id`) VALUES
(1, 1, 1),
(2, 3, 3),
(3, 10, 5),
(4, 6, 5),
(5, 7, 1),
(6, 10, 1),
(7, 5, 1),
(8, 10, 1),
(9, 4, 5),
(10, 2, 2),
(11, 3, 4),
(12, 3, 3),
(13, 10, 3),
(15, 1, 2),
(16, 11, 2),
(17, 12, 1),
(18, 12, 2),
(19, 13, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `vouchers_references_groups`
--
ALTER TABLE `vouchers_references_groups`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `vouchers_references_groups`
--
ALTER TABLE `vouchers_references_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
