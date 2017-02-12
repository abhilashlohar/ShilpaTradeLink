-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2017 at 08:58 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

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
-- Table structure for table `material_indents`
--

CREATE TABLE `material_indents` (
  `id` int(10) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_on` date NOT NULL,
  `created_by` int(10) NOT NULL,
  `mi1` varchar(10) NOT NULL,
  `mi2` varchar(10) NOT NULL,
  `mi3` varchar(10) NOT NULL,
  `mi4` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `material_indent_rows`
--

CREATE TABLE `material_indent_rows` (
  `id` int(10) NOT NULL,
  `material_indent_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `required_quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `material_indent_rows`
--

INSERT INTO `material_indent_rows` (`id`, `material_indent_id`, `item_id`, `required_quantity`) VALUES
(1, 1, 37, 99),
(2, 2, 37, 99);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `material_indents`
--
ALTER TABLE `material_indents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `material_indent_rows`
--
ALTER TABLE `material_indent_rows`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `material_indents`
--
ALTER TABLE `material_indents`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `material_indent_rows`
--
ALTER TABLE `material_indent_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
