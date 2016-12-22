-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2016 at 01:23 PM
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
-- Table structure for table `material_indents`
--

CREATE TABLE `material_indents` (
  `id` int(10) NOT NULL,
  `company_id` int(11) NOT NULL,
  `job_card_id` int(11) NOT NULL,
  `required_date` date NOT NULL,
  `created_on` date NOT NULL,
  `created_by` int(10) NOT NULL,
  `mi1` int(10) NOT NULL,
  `mi2` int(10) NOT NULL,
  `mi3` int(10) NOT NULL,
  `mi4` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `material_indents`
--

INSERT INTO `material_indents` (`id`, `company_id`, `job_card_id`, `required_date`, `created_on`, `created_by`, `mi1`, `mi2`, `mi3`, `mi4`) VALUES
(2, 25, 7, '1970-01-01', '2016-12-22', 1, 0, 1, 0, 0),
(3, 25, 7, '1970-01-01', '2016-12-22', 1, 0, 2, 0, 0),
(4, 25, 7, '1970-01-01', '2016-12-22', 1, 0, 3, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `material_indents`
--
ALTER TABLE `material_indents`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `material_indents`
--
ALTER TABLE `material_indents`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
