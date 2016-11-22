-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2016 at 01:09 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

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
-- Table structure for table `employee_contact_persons`
--

CREATE TABLE `employee_contact_persons` (
  `id` int(10) NOT NULL,
  `employee_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` bigint(15) NOT NULL,
  `landline` bigint(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `relation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_contact_persons`
--

INSERT INTO `employee_contact_persons` (`id`, `employee_id`, `name`, `mobile`, `landline`, `email`, `relation`) VALUES
(1, 18, 'Gops', 127, 127, 'gops@gmail.com', 'Xdcfvgbh'),
(2, 18, 'Gops', 127, 127, 'gops@gmail.com', '45678'),
(5, 19, 'Gops', 98765432, 9876543, 'gops@gmail.com', 'Bro'),
(6, 19, 'Yash', 98764567, 98765, 'yash@gmail.com', 'Bro'),
(7, 20, 'Wer', 23234, 4324, 'we@df.esdg', 'E3r4r'),
(8, 20, 'Wefrt', 2342, 4234, 'we@df.esdg', 'Qwr45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee_contact_persons`
--
ALTER TABLE `employee_contact_persons`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee_contact_persons`
--
ALTER TABLE `employee_contact_persons`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
