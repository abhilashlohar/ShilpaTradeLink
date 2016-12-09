-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2016 at 11:55 AM
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
-- Table structure for table `receipt_vouchers`
--

CREATE TABLE `receipt_vouchers` (
  `id` int(11) NOT NULL,
  `received_from_id` int(11) NOT NULL,
  `bank_cash_id` int(11) NOT NULL,
  `narration` text NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` date NOT NULL,
  `payment_mode` varchar(10) NOT NULL,
  `company_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `edited_by` int(10) NOT NULL,
  `edited_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receipt_vouchers`
--

INSERT INTO `receipt_vouchers` (`id`, `received_from_id`, `bank_cash_id`, `narration`, `amount`, `created_by`, `created_on`, `payment_mode`, `company_id`, `transaction_date`, `edited_by`, `edited_on`) VALUES
(1, 5, 11, 'being received from gopal', '400.00', 1, '2016-12-03', 'Cash', 27, '2016-12-03', 0, '0000-00-00'),
(2, 5, 11, 'fdfghhj', '400.00', 1, '0000-00-00', 'Cash', 25, '2016-12-09', 1, '0000-00-00'),
(3, 2, 11, 'nbvcghcvn mn', '677.00', 1, '2016-12-09', 'Cash', 25, '2016-12-09', 0, '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `receipt_vouchers`
--
ALTER TABLE `receipt_vouchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `receipt_vouchers`
--
ALTER TABLE `receipt_vouchers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
