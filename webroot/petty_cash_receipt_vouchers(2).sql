-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2016 at 11:53 AM
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
-- Table structure for table `petty_cash_receipt_vouchers`
--

CREATE TABLE `petty_cash_receipt_vouchers` (
  `id` int(10) NOT NULL,
  `received_from_id` int(10) NOT NULL,
  `bank_cash_id` int(10) NOT NULL,
  `narration` text NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `company_id` int(10) NOT NULL,
  `created_on` date NOT NULL,
  `transaction_date` date NOT NULL,
  `payment_mode` varchar(10) NOT NULL,
  `created_by` int(11) NOT NULL,
  `edited_by` int(11) NOT NULL,
  `edited_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petty_cash_receipt_vouchers`
--

INSERT INTO `petty_cash_receipt_vouchers` (`id`, `received_from_id`, `bank_cash_id`, `narration`, `amount`, `company_id`, `created_on`, `transaction_date`, `payment_mode`, `created_by`, `edited_by`, `edited_on`) VALUES
(1, 2, 11, 'being received by amzole india pvt ltd for machine bolt', '900.00', 25, '0000-00-00', '2016-12-09', 'Cash', 1, 1, '2016-12-09'),
(2, 5, 11, 'jkhgfcxz', '2000.00', 25, '2016-12-05', '2016-12-05', 'Cash', 1, 0, '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `petty_cash_receipt_vouchers`
--
ALTER TABLE `petty_cash_receipt_vouchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `petty_cash_receipt_vouchers`
--
ALTER TABLE `petty_cash_receipt_vouchers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
