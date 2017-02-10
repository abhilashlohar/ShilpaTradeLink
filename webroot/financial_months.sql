-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2017 at 06:06 AM
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
-- Table structure for table `financial_months`
--

CREATE TABLE `financial_months` (
  `id` int(10) NOT NULL,
  `financial_year_id` int(10) NOT NULL,
  `month` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `financial_months`
--

INSERT INTO `financial_months` (`id`, `financial_year_id`, `month`, `status`) VALUES
(31, 1, '04-2016', 'Open'),
(32, 1, '05-2016', 'Open'),
(33, 1, '06-2016', 'Open'),
(34, 1, '07-2016', 'Open'),
(35, 1, '08-2016', 'Open'),
(36, 1, '09-2016', 'Open'),
(37, 1, '10-2016', 'Open'),
(38, 1, '11-2016', 'Open'),
(39, 1, '12-2016', 'Open'),
(40, 1, '01-2017', 'Open'),
(41, 1, '02-2017', 'Open'),
(42, 1, '03-2017', 'Open'),
(43, 16, '04-2015', 'Open'),
(44, 16, '05-2015', 'Open'),
(45, 16, '06-2015', 'Open'),
(46, 16, '07-2015', 'Open'),
(47, 16, '08-2015', 'Open'),
(48, 16, '09-2015', 'Open'),
(49, 16, '10-2015', 'Open'),
(50, 16, '11-2015', 'Open'),
(51, 16, '12-2015', 'Open'),
(52, 16, '01-2016', 'Open'),
(53, 16, '02-2016', 'Open'),
(54, 16, '03-2016', 'Open'),
(55, 17, '04-2016', 'Open'),
(56, 17, '05-2016', 'Open'),
(57, 17, '06-2016', 'Open'),
(58, 17, '07-2016', 'Open'),
(59, 17, '08-2016', 'Open'),
(60, 17, '09-2016', 'Open'),
(61, 17, '10-2016', 'Open'),
(62, 17, '11-2016', 'Open'),
(63, 17, '12-2016', 'Open'),
(64, 17, '01-2017', 'Open'),
(65, 17, '02-2017', 'Open'),
(66, 17, '03-2017', 'Open'),
(67, 18, '04-2016', 'Open'),
(68, 18, '05-2016', 'Open'),
(69, 18, '06-2016', 'Open'),
(70, 18, '07-2016', 'Open'),
(71, 18, '08-2016', 'Open'),
(72, 18, '09-2016', 'Open'),
(73, 18, '10-2016', 'Open'),
(74, 18, '11-2016', 'Open'),
(75, 18, '12-2016', 'Open'),
(76, 18, '01-2017', 'Open'),
(77, 18, '02-2017', 'Open'),
(78, 18, '03-2017', 'Open');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `financial_months`
--
ALTER TABLE `financial_months`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `financial_months`
--
ALTER TABLE `financial_months`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
