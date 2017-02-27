-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2017 at 01:07 PM
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
-- Table structure for table `account_references`
--

CREATE TABLE `account_references` (
  `id` int(10) NOT NULL,
  `entity_description` varchar(255) NOT NULL,
  `account_first_subgroup_id` int(10) NOT NULL,
  `account_category_id` int(10) NOT NULL,
  `account_group_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_references`
--

INSERT INTO `account_references` (`id`, `entity_description`, `account_first_subgroup_id`, `account_category_id`, `account_group_id`) VALUES
(1, 'Sales Account', 1, 0, 0),
(2, 'Invoice Booking Purchase  Account', 1, 1, 1),
(3, 'Fright Account', 1, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_references`
--
ALTER TABLE `account_references`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_references`
--
ALTER TABLE `account_references`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
