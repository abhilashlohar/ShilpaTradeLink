-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2016 at 11:51 AM
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
-- Table structure for table `payment_vouchers`
--

CREATE TABLE `payment_vouchers` (
  `id` int(10) NOT NULL,
  `created_on` date NOT NULL,
  `transaction_date` date NOT NULL,
  `paid_to_id` int(10) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `cash_bank_account_id` int(10) NOT NULL,
  `narration` text NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `edited_by` int(10) NOT NULL,
  `edited_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_vouchers`
--

INSERT INTO `payment_vouchers` (`id`, `created_on`, `transaction_date`, `paid_to_id`, `payment_mode`, `cash_bank_account_id`, `narration`, `amount`, `company_id`, `created_by`, `edited_by`, `edited_on`) VALUES
(1, '2016-12-03', '2016-12-03', 6, 'Cash', 8, 'wertyuivbnmhgcxzcxvnm', '800.00', 26, 0, 0, '0000-00-00'),
(2, '0000-00-00', '2016-12-02', 10, 'Cheque', 7, 'being paid from sdfsd', '700.00', 25, 0, 1, '0000-00-00'),
(3, '2016-12-05', '2016-12-06', 8, 'Cash', 6, 'being received by gopaliya ', '3000.00', 25, 0, 0, '0000-00-00'),
(4, '2016-12-05', '2016-12-01', 10, 'Cash', 8, '4000', '2000.00', 25, 0, 0, '0000-00-00'),
(5, '2016-12-05', '2016-12-14', 10, 'Cash', 6, 'derftgyhujikolp;[', '800.00', 25, 0, 0, '0000-00-00'),
(6, '2016-12-05', '2016-12-14', 10, 'Cash', 6, 'derftgyhujikolp;[', '800.00', 25, 0, 0, '0000-00-00'),
(7, '2016-12-05', '2016-12-07', 5, 'Cheque', 7, 'hbvcxzsdfghjk', '300.00', 25, 0, 0, '0000-00-00'),
(8, '2016-12-05', '2016-12-07', 5, 'Cheque', 7, 'hbvcxzsdfghjk', '300.00', 25, 0, 0, '0000-00-00'),
(9, '2016-12-05', '2016-12-07', 5, 'Cheque', 7, 'hbvcxzsdfghjk', '300.00', 25, 0, 0, '0000-00-00'),
(10, '2016-12-05', '2016-12-02', 4, 'Cheque', 7, 'vcxzcvbnm', '900.00', 25, 0, 0, '0000-00-00'),
(11, '2016-12-06', '2016-12-13', 10, 'Cash', 7, 'qwertyuiopasdfghjklzxcvbnm,', '5000.00', 27, 0, 0, '0000-00-00'),
(12, '2016-12-06', '2016-12-02', 1, 'Cash', 7, 'xzcvbnmdsdfghjk', '1000.00', 25, 0, 0, '0000-00-00'),
(13, '2016-12-06', '2016-12-07', 10, 'Cash', 7, 'xcvvnmnbvcfxdfcnbm', '6000.00', 25, 0, 0, '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `payment_vouchers`
--
ALTER TABLE `payment_vouchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payment_vouchers`
--
ALTER TABLE `payment_vouchers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
