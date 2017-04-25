-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2017 at 04:46 PM
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
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `controller` varchar(100) NOT NULL,
  `action` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `controller`, `action`) VALUES
(1, 'Quotations', 'Add'),
(2, 'Quotations', 'Edit'),
(3, 'SalesOrders', 'Add'),
(4, 'SalesOrders', 'Edit'),
(5, 'JobCards', 'Add'),
(6, 'JobCards', 'Edit'),
(7, 'Invoices', 'Add'),
(8, 'Invoices', 'Edit'),
(9, 'InventoryVouchers', 'Add'),
(10, 'InventoryVouchers', 'Edit'),
(11, 'Challans', 'Add'),
(12, 'Challans', 'Edit'),
(13, 'PurchaseOrders', 'Add'),
(14, 'PurchaseOrders', 'Edit'),
(15, 'Grns', 'Add'),
(16, 'Grns', 'Edit'),
(17, 'InvoiceBookings', 'Add'),
(18, 'InvoiceBookings', 'Edit'),
(19, 'Logins', 'Add'),
(20, 'UserRights', 'Add'),
(21, 'Quotations', 'Pdf'),
(22, 'SalesOrders', 'Pdf'),
(23, 'Invoices', 'Pdf'),
(24, 'JobCards', 'View'),
(25, 'Quotations', 'Confirm'),
(26, 'SalesOrders', 'Confirm'),
(27, 'Invoices', 'Confirm'),
(28, 'Challans', 'Pdf'),
(29, 'Challans', 'Confirm'),
(30, 'Quotations', 'Close'),
(31, 'PurchaseOrders', 'Pdf'),
(32, 'PurchaseOrders', 'Confirm'),
(33, 'Invoices', 'Close'),
(34, 'JobCards', 'Close'),
(35, 'Grns', 'View'),
(36, 'ItemLedgers', 'stockReport'),
(37, 'LedgerAccounts', 'BalanceSheet'),
(38, 'LedgerAccounts', 'ProfitLossStatement'),
(39, 'ItemLedgers', 'materialindentreport');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
