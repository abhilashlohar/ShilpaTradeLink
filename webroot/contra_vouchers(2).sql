-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2016 at 11:54 AM
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
-- Table structure for table `contra_vouchers`
--

CREATE TABLE `contra_vouchers` (
  `id` int(10) NOT NULL,
  `created_on` date NOT NULL,
  `transaction_date` date NOT NULL,
  `cash_bank_from` int(10) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `cash_bank_to` int(10) NOT NULL,
  `narration` text NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `edited_by` int(10) NOT NULL,
  `edited_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contra_vouchers`
--

INSERT INTO `contra_vouchers` (`id`, `created_on`, `transaction_date`, `cash_bank_from`, `payment_mode`, `cash_bank_to`, `narration`, `amount`, `company_id`, `created_by`, `edited_by`, `edited_on`) VALUES
(1, '2016-12-06', '2016-12-06', 5, 'Cash', 11, 'dssfgjmn,m', '3900.00', 25, 1, 0, '0000-00-00'),
(2, '0000-00-00', '2016-12-09', 6, 'Cash', 10, 'qwertyudfghjnmbmvb', '5000.00', 25, 1, 1, '2016-12-09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contra_vouchers`
--
ALTER TABLE `contra_vouchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contra_vouchers`
--
ALTER TABLE `contra_vouchers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
