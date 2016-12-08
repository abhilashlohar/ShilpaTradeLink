-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2016 at 01:32 PM
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
-- Table structure for table `journal_vouchers`
--

CREATE TABLE `journal_vouchers` (
  `id` int(10) NOT NULL,
  `created_on` date NOT NULL,
  `transaction_date` date NOT NULL,
  `narration` text NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `journal_vouchers`
--

INSERT INTO `journal_vouchers` (`id`, `created_on`, `transaction_date`, `narration`, `company_id`, `created_by`) VALUES
(4, '0000-00-00', '2016-12-07', 'wece', 26, 2),
(5, '2016-12-07', '2016-12-22', 'Its Demo', 25, 2),
(6, '2016-12-07', '2016-12-07', 'its demo', 25, 2),
(7, '2016-12-07', '2016-12-07', 'Its Show Time', 27, 2),
(8, '2016-12-08', '2016-12-08', 'qwerty', 25, 2),
(9, '2016-12-08', '2016-12-08', 'ftgyhuji', 26, 2),
(10, '2016-12-08', '2016-12-08', 'ftgyhuji', 26, 2),
(11, '2016-12-08', '2016-12-08', 'ftgyhuji', 26, 2),
(12, '2016-12-08', '2016-12-08', 'ftgyhuji', 26, 2),
(13, '2016-12-08', '2016-12-08', 'ftgyhuji', 26, 2),
(14, '2016-12-08', '2016-12-08', 'ftgyhuji', 26, 2),
(15, '2016-12-08', '2016-12-08', 'ftgyhuji', 26, 2),
(16, '2016-12-08', '2016-12-08', 'ftgyhuji', 26, 2),
(17, '2016-12-08', '2016-12-08', 'ftgyhuji', 26, 2),
(18, '2016-12-08', '2016-12-08', 'ftgyhuji', 26, 2),
(19, '2016-12-08', '2016-12-08', 'ftgyhuji', 26, 2),
(20, '2016-12-08', '2016-12-08', 'ftgyhuji', 26, 2),
(21, '2016-12-08', '2016-12-08', 'ftgyhuji', 26, 2),
(22, '2016-12-08', '2016-12-08', 'ftgyhuji', 26, 2),
(23, '2016-12-08', '2016-12-08', 'ftgyhuji', 26, 2),
(24, '2016-12-08', '2016-12-08', 'ftgyhuji', 26, 2),
(25, '2016-12-08', '2016-12-08', 'ftgyhuji', 26, 2),
(26, '2016-12-08', '2016-12-08', 'ftgyhuji', 26, 2),
(27, '2016-12-08', '2016-12-08', 'ftgyhuji', 26, 2),
(28, '2016-12-08', '2016-12-08', 'ftgyhuji', 26, 2),
(29, '2016-12-08', '2016-12-08', 'ftgyhuji', 26, 2),
(30, '2016-12-08', '2016-12-08', 'esdrfgyhuji', 25, 2),
(31, '2016-12-08', '2016-12-08', 'rdtfyhij', 25, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `journal_vouchers`
--
ALTER TABLE `journal_vouchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `journal_vouchers`
--
ALTER TABLE `journal_vouchers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
