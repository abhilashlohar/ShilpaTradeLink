-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2016 at 01:24 PM
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
-- Table structure for table `material_indent_rows`
--

CREATE TABLE `material_indent_rows` (
  `id` int(10) NOT NULL,
  `material_indent_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `approved_purchased_quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `material_indent_rows`
--

INSERT INTO `material_indent_rows` (`id`, `material_indent_id`, `item_id`, `quantity`, `approved_purchased_quantity`) VALUES
(4, 2, 43, 10, 30),
(5, 2, 38, 20, 20),
(6, 2, 37, 30, 50),
(7, 3, 43, 10, 11),
(8, 3, 38, 20, 11),
(9, 3, 37, 30, 22),
(10, 4, 43, 10, 11),
(11, 4, 38, 20, 1),
(12, 4, 37, 30, 22);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `material_indent_rows`
--
ALTER TABLE `material_indent_rows`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `material_indent_rows`
--
ALTER TABLE `material_indent_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
