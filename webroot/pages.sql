-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2017 at 02:45 PM
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
(39, 'ItemLedgers', 'materialindentreport'),
(40, 'Ledgers', 'AccountStatement'),
(41, 'Ledgers', 'Index'),
(42, 'Customers', 'Add'),
(43, 'Customers', 'View'),
(44, 'Customers', 'Edit'),
(45, 'Customers', 'EditCompany'),
(46, 'Employees', 'Add'),
(47, 'Employees', 'View'),
(48, 'Employees', 'Edit'),
(49, 'Employees', 'EditCompany'),
(50, 'Items', 'Add'),
(51, 'Items', 'Index'),
(52, 'Items', 'Edit'),
(53, 'Items', 'EditCompany'),
(54, 'Vendors', 'Add'),
(55, 'Vendors', 'Index'),
(56, 'Vendors', 'Edit'),
(57, 'Vendors', 'EditCompany'),
(58, 'Companies', 'Add'),
(59, 'Companies', 'View'),
(60, 'Companies', 'Edit'),
(61, 'ItemCategories', 'Index'),
(62, 'ItemGroups', 'Index'),
(63, 'ItemSubGroups', 'Index'),
(64, 'Units', 'Index'),
(65, 'CustomerGroups', 'Add'),
(66, 'CustomerSegs', 'Add'),
(67, 'SaleTaxes', 'Index'),
(68, 'Filenames', 'Index'),
(69, 'Filenames', 'Index2'),
(70, 'Transporters', 'Index'),
(71, 'Districts', 'Index'),
(72, 'Designations', 'Index'),
(73, 'Departments', 'Index'),
(74, 'ledgerAccounts', 'Add'),
(75, 'ledgerAccounts', 'Edit'),
(76, 'AccountReferences', 'Index'),
(77, 'AccountReferences', 'Edit'),
(78, 'Ledgers', 'openingBalance'),
(79, 'Ledgers', 'openingBalanceView'),
(80, 'Items', 'openingBalance'),
(81, 'Items', 'openingBalanceView'),
(82, 'TermsConditions', 'Index'),
(83, 'TermsConditions', 'Edit'),
(84, 'Items', 'cost'),
(85, 'Items', 'costView'),
(86, 'QuotationCloseReasons', 'Index'),
(87, 'QuotationCloseReasons', 'Edit'),
(88, 'LeaveTypes', 'Index'),
(89, 'LeaveTypes', 'Edit'),
(90, 'Payments', 'Add'),
(91, 'Payments', 'Edit'),
(92, 'Payments', 'View'),
(93, 'Payments', 'Index'),
(94, 'Receipts', 'Add'),
(95, 'Receipts', 'Edit'),
(96, 'Receipts', 'View'),
(97, 'Receipts', 'Index'),
(98, 'PettyCashReceiptVouchers', 'Add'),
(99, 'PettyCashReceiptVouchers', 'Edit'),
(100, 'PettyCashReceiptVouchers', 'View'),
(101, 'PettyCashReceiptVouchers', 'Index'),
(102, 'ContraVouchers', 'Add'),
(103, 'ContraVouchers', 'Edit'),
(104, 'ContraVouchers', 'View'),
(105, 'ContraVouchers', 'Index'),
(106, 'CreditNotes', 'Add'),
(107, 'CreditNotes', 'Edit'),
(108, 'CreditNotes', 'View'),
(109, 'CreditNotes', 'Index'),
(110, 'DebitNotes', 'Add'),
(111, 'DebitNotes', 'Edit'),
(112, 'DebitNotes', 'View'),
(113, 'DebitNotes', 'Index'),
(114, 'JournalVouchers', 'Add'),
(115, 'JournalVouchers', 'Edit'),
(116, 'JournalVouchers', 'View'),
(117, 'JournalVouchers', 'Index'),
(118, 'VouchersReferences', 'Index'),
(119, 'VouchersReferences', 'Edit');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
