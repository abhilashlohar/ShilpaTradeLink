-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Apr 01, 2017 at 08:39 AM
-- Server version: 5.6.32-78.0-log
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wwwshant_stlpl`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_categories`
--

CREATE TABLE IF NOT EXISTS `account_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `account_categories`
--

INSERT INTO `account_categories` (`id`, `name`) VALUES
(1, 'Assets'),
(2, 'Liablities'),
(3, 'Income'),
(4, 'Expense');

-- --------------------------------------------------------

--
-- Table structure for table `account_first_subgroups`
--

CREATE TABLE IF NOT EXISTS `account_first_subgroups` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `account_group_id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `account_first_subgroups`
--

INSERT INTO `account_first_subgroups` (`id`, `account_group_id`, `name`) VALUES
(1, 2, 'Sundry Debtors'),
(2, 6, 'Trade Payables'),
(3, 2, 'Inventory'),
(4, 6, 'Duties & Taxes'),
(5, 2, 'Loans and Advances'),
(6, 7, 'Sales Income'),
(7, 2, 'Staff Advances'),
(8, 6, 'Unsecured Loan'),
(9, 8, 'Purchase'),
(10, 15, 'Purchases'),
(11, 8, 'Direct Expenses'),
(12, 9, 'Indirect Expenses'),
(13, 9, 'Administration Expenses'),
(14, 9, 'Financial Expenses'),
(15, 13, 'Other Income'),
(16, 14, 'Other Incomes'),
(17, 2, 'Bank Account'),
(18, 12, 'Unsecured Loan'),
(19, 2, 'Cash in Hand'),
(20, 11, 'Fixed Assets'),
(21, 6, 'Bank Account'),
(22, 4, 'Share Capital'),
(23, 5, 'Reserves & Surplus'),
(24, 12, 'Secured Loans'),
(25, 6, 'Short Term Provisions');

-- --------------------------------------------------------

--
-- Table structure for table `account_groups`
--

CREATE TABLE IF NOT EXISTS `account_groups` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `account_category_id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `account_groups`
--

INSERT INTO `account_groups` (`id`, `account_category_id`, `name`) VALUES
(2, 1, 'Current Assets'),
(3, 1, 'Investments'),
(4, 2, 'Share Capital'),
(5, 2, 'Reserves & Surplus'),
(6, 2, 'Current Liabilities'),
(7, 3, 'Sales Income'),
(8, 4, 'Direct Expenses'),
(9, 4, 'Indirect Expenses'),
(10, 3, 'Other Income'),
(11, 1, 'Fixed Assets'),
(12, 2, 'Long Term Borrowings'),
(13, 3, 'Indirect Income'),
(14, 3, 'Direct Income'),
(15, 4, 'Purchase');

-- --------------------------------------------------------

--
-- Table structure for table `account_references`
--

CREATE TABLE IF NOT EXISTS `account_references` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `entity_description` varchar(255) NOT NULL,
  `account_first_subgroup_id` int(10) NOT NULL,
  `account_category_id` int(10) NOT NULL,
  `account_group_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `account_references`
--

INSERT INTO `account_references` (`id`, `entity_description`, `account_first_subgroup_id`, `account_category_id`, `account_group_id`) VALUES
(1, 'Invoice Sales Account', 6, 3, 7),
(2, 'Invoice Booking Purchase  Account', 9, 4, 8),
(3, 'Invoice Freight Account', 11, 4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `account_second_subgroups`
--

CREATE TABLE IF NOT EXISTS `account_second_subgroups` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `account_first_subgroup_id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `account_second_subgroups`
--

INSERT INTO `account_second_subgroups` (`id`, `account_first_subgroup_id`, `name`) VALUES
(1, 1, 'Cash Debtors'),
(2, 1, 'Credit Debtors'),
(3, 2, 'Cash Creditors'),
(4, 2, 'Credit Creditors'),
(5, 4, 'Output Sales Tax'),
(6, 4, 'Input Sales Tax'),
(7, 5, 'Staff Advances'),
(8, 6, 'Sales Income'),
(9, 4, 'Fright amount'),
(10, 7, 'Staff Advance'),
(11, 8, 'Directors Loan'),
(12, 8, 'Other Than Directors Loan'),
(13, 9, 'VAT Purchases'),
(14, 9, 'CST Purchases'),
(15, 9, 'VAT Paid Purchases'),
(16, 10, 'Other Purchase'),
(17, 11, 'Direct Expenses'),
(18, 12, 'Sales Expenses'),
(19, 13, 'Administration Expenses'),
(20, 13, 'Staff Expenses'),
(21, 13, 'Directors Expenses'),
(22, 14, 'Financial Expenses'),
(23, 15, 'Other Income'),
(24, 17, 'Bank Account'),
(25, 16, 'Other Incomes'),
(26, 21, 'Bank Account'),
(27, 24, 'Vehicle Loan'),
(28, 19, 'Petty Cash'),
(29, 20, 'Plant & Machinery'),
(30, 20, 'Furniture & Fixtures'),
(31, 20, 'Vehicles'),
(32, 22, 'Share Capital'),
(33, 23, 'Reserves & Surplus'),
(34, 24, 'Secured Loans'),
(35, 24, 'HDFC Vehicle Loan Ciaz'),
(36, 24, 'ICICI Vehicle Loan Fortuner'),
(37, 2, 'Due to Related Parties'),
(38, 25, 'Provisions for Expenses'),
(39, 2, 'Other Payables');

-- --------------------------------------------------------

--
-- Table structure for table `challans`
--

CREATE TABLE IF NOT EXISTS `challans` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `invoice_booking_id` int(10) NOT NULL,
  `created_on` date NOT NULL,
  `transporter_id` int(11) NOT NULL,
  `lr_no` varchar(50) NOT NULL,
  `reference_detail` varchar(255) NOT NULL,
  `total` decimal(18,2) NOT NULL,
  `documents` varchar(255) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `challan_type` varchar(30) NOT NULL,
  `challan_for` varchar(14) NOT NULL,
  `vendor_id` int(10) NOT NULL,
  `vendor_address` varchar(200) NOT NULL,
  `ch1` varchar(10) NOT NULL,
  `ch2` int(10) NOT NULL,
  `ch3` varchar(10) NOT NULL,
  `ch4` varchar(10) NOT NULL,
  `pass_credit_note` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `challan_rows`
--

CREATE TABLE IF NOT EXISTS `challan_rows` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `challan_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `quantity` int(5) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `alias` varchar(10) NOT NULL,
  `address` text NOT NULL,
  `pan_no` varchar(30) NOT NULL,
  `tin_no` varchar(50) NOT NULL,
  `tan_no` varchar(30) NOT NULL,
  `cin_no` varchar(50) NOT NULL,
  `service_tax_no` varchar(30) NOT NULL,
  `landline_no` varchar(15) NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `website` varchar(50) NOT NULL,
  `company_group_id` int(11) NOT NULL,
  `inventory_status` varchar(50) NOT NULL,
  `logo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `alias`, `address`, `pan_no`, `tin_no`, `tan_no`, `cin_no`, `service_tax_no`, `landline_no`, `mobile_no`, `email`, `website`, `company_group_id`, `inventory_status`, `logo`) VALUES
(25, 'Shilpa Trade Links Pvt. Ltd.', 'STL', '"A - SQUARE ", 3rd Floor,\r\n1 Shobhagpura, 100 Ft. Road,  \r\nUdaipur - 313011 ( Raj )', 'AACCS0229A', '08743900079', 'JDHS01013F', 'U51101RJ1990PTC005468', '', '02942980435', '8696029999', 'sales@mogragroup.com', 'www.mogragroup.com', 1, 'With Inventory', '58a8183a5a116.png'),
(26, 'Shilpa Mechtrad Ltd.', 'SML', '"A - SQUARE",  3rd Floor,\r\n1, Shobhagpura, 100 ft. Road, \r\nUdaipur-313011 ( Rajasthan ) ', 'AAGCS4913H', '08203900570', '', 'U51102RJ1995PLC010149', '', '02942980435', '8696029999', 'info@mogragroup.com', 'www.mogragroup.com', 1, 'With Inventory', '58a7fe6ac6c80.png'),
(27, 'Fluid Management & Solutions Llp', 'FMSL', '" A-Square ", 3rd Floor,\r\n100 Ft. Road, 1 Shobhagpura,\r\nUdaipur 313011 ( Raj. )', 'AAEFF0911B', '08453967799', 'JDHF00466E', 'AAD5399', '', '2980435', '8696029999', 'info@mogragroup.com', 'www.mogragroup.com', 1, 'With Inventory', '57fcb8149f735.png');

-- --------------------------------------------------------

--
-- Table structure for table `company_banks`
--

CREATE TABLE IF NOT EXISTS `company_banks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `account_no` bigint(20) NOT NULL,
  `ifsc_code` varchar(100) NOT NULL,
  `default_bank` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `company_banks`
--

INSERT INTO `company_banks` (`id`, `company_id`, `bank_name`, `branch`, `account_no`, `ifsc_code`, `default_bank`) VALUES
(17, 25, 'Union Bank of India', 'New Fatehpura Udaipur', 394004010029332, 'UBIN0539406', 1),
(18, 25, 'SBBJ', 'Shobhagpura', 29762460011, 'SBBJ0011485', 0),
(19, 27, 'State Bank of Bikaner & Jaipur', 'Shobhagpura', 61297460226, 'SBBJ0011485', 1),
(20, 26, 'State Bank of Bikaner & Jaipur', 'Shobhagpura', 61299211176, 'SBBJ0011485', 1);

-- --------------------------------------------------------

--
-- Table structure for table `company_groups`
--

CREATE TABLE IF NOT EXISTS `company_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `company_groups`
--

INSERT INTO `company_groups` (`id`, `name`) VALUES
(1, 'Mogra Group');

-- --------------------------------------------------------

--
-- Table structure for table `contra_vouchers`
--

CREATE TABLE IF NOT EXISTS `contra_vouchers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `voucher_no` varchar(10) NOT NULL,
  `cheque_no` varchar(25) NOT NULL,
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
  `edited_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `credit_notes`
--

CREATE TABLE IF NOT EXISTS `credit_notes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `voucher_no` varchar(10) NOT NULL,
  `created_on` date NOT NULL,
  `transaction_date` date NOT NULL,
  `purchase_acc_id` int(10) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `party_id` int(10) NOT NULL,
  `narration` text NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `edited_by` int(11) NOT NULL,
  `edited_on` date NOT NULL,
  `cheque_no` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(10) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `district_id` int(10) NOT NULL,
  `company_group_id` int(10) NOT NULL,
  `customer_seg_id` int(10) NOT NULL,
  `tin_no` varchar(100) NOT NULL,
  `gst_no` varchar(100) NOT NULL,
  `pan_no` varchar(100) NOT NULL,
  `ecc_no` varchar(100) NOT NULL,
  `flag` int(2) NOT NULL DEFAULT '0',
  `employee_id` int(10) NOT NULL,
  `payment_terms` int(2) NOT NULL,
  `mode_of_payment` varchar(20) NOT NULL,
  `credit_limit` int(8) NOT NULL,
  `transporter_id` int(10) NOT NULL,
  `account_category_id` int(10) NOT NULL,
  `account_group_id` int(10) NOT NULL,
  `account_first_subgroup_id` int(10) NOT NULL,
  `account_second_subgroup_id` int(10) NOT NULL,
  `ledger_account_id` int(10) NOT NULL,
  `bill_to_bill_account` varchar(10) NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=114 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_group_id`, `customer_name`, `alias`, `district_id`, `company_group_id`, `customer_seg_id`, `tin_no`, `gst_no`, `pan_no`, `ecc_no`, `flag`, `employee_id`, `payment_terms`, `mode_of_payment`, `credit_limit`, `transporter_id`, `account_category_id`, `account_group_id`, `account_first_subgroup_id`, `account_second_subgroup_id`, `ledger_account_id`, `bill_to_bill_account`) VALUES
(1, 4, 'Hindustan Zinc Ltd ', 'Dariba Smelter Complex', 4, 0, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM005', 0, 11, 30, 'NEFT', 1000000, 7, 1, 2, 1, 2, 23, 'Yes'),
(2, 2, 'Ultratech Cement Limited', 'Unit-Aditya Cement Works', 2, 0, 3, '08832112853', '', 'AAACL6442L', 'AAACL6442LEM033', 0, 11, 30, 'Cheque', 1000000, 7, 1, 2, 1, 2, 25, 'Yes'),
(3, 1, 'JK Laxmi Cement Ltd', 'JK Laxmi Cement Ltd', 7, 0, 3, '08453300051', '', 'AAACJ6715G', 'AAACJ6715GXM003', 0, 15, 30, 'Cheque', 1000000, 2, 1, 2, 1, 2, 26, 'Yes'),
(4, 8, 'Shree Cement Limited', 'Shree Cement Ltd Unit 1', 3, 0, 3, '08530101044', '', 'AACCS8796G', 'AACCS8796GXM001', 0, 4, 30, 'Cheque', 1000000, 7, 1, 2, 1, 2, 27, 'Yes'),
(5, 9, 'Trinetra Cement Ltd', 'The India Cement', 17, 0, 3, '08513750195', '', 'AAACI0990C', 'AAACI0990CXM002', 0, 4, 30, 'Cheque', 1000000, 12, 1, 2, 1, 2, 28, 'Yes'),
(6, 2, 'Ultratech Cement Limited', 'Unit: Vikram Cement Works', 10, 0, 3, '23762701822', '', 'AAACL6442L', 'AAACL6442LEM031', 0, 11, 30, 'Cheque', 100000, 13, 1, 2, 1, 2, 33, 'Yes'),
(7, 7, 'Adani Power Rajasthan Ltd.', 'Adani ', 19, 0, 8, '08932910817', '', 'AAGCA9379P', '', 0, 7, 30, 'NEFT', 100000, 15, 1, 2, 1, 2, 38, 'Yes'),
(8, 10, 'Shriram Rayons', 'Shriram Rayons', 13, 0, 2, '08672951700', '', 'AAACD0204C', 'AAACD0204CXM004', 0, 7, 2, 'Cheque', 10000, 3, 1, 2, 1, 1, 39, 'Yes'),
(9, 1, 'Mangalam Cement Ltd', 'Mangalam Cement Ltd', 13, 0, 3, '08442902696', '', 'AABCM6602Q', 'AABCM6602QXM001', 0, 7, 30, 'NEFT', 50000, 3, 1, 2, 1, 2, 40, 'Yes'),
(10, 11, 'Sutlej Textiles and Industries Limited', 'Sutlej Textiles and Industries Limited', 30, 0, 2, '08223050160', '', 'AAJCS1850N', 'AAJCS1850NXM001', 0, 7, 15, 'NEFT', 200000, 15, 1, 2, 1, 2, 41, 'Yes'),
(11, 1, 'Ambuja Cements Limited', 'Unit-Rabriyawas', 16, 0, 3, '08160101490', '', 'AAACG0569P', 'AAACG0569PXM008', 0, 4, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 43, 'Yes'),
(12, 4, 'Hindustan Zinc Ltd ', 'Sindesar Khurd Mine', 4, 0, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KEM070', 0, 11, 30, 'Cheque', 1000000, 16, 1, 2, 1, 2, 47, 'Yes'),
(15, 0, 'J.K. Cement Works Mangrol', 'Unit of J.K. Cement Ltd.', 2, 0, 3, '08841152305', '', 'AABCJ0355R', 'AABCJ0355RXM003', 0, 15, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 50, 'Yes'),
(16, 4, 'Hindustan Zinc Ltd', 'Haridwar Zinc Plant', 37, 0, 1, '05007432844', '', 'AAACH7354K', 'AAACH7354KXM016', 0, 11, 30, 'NEFT', 100000, 1, 1, 2, 1, 2, 51, 'Yes'),
(17, 4, 'Hindustan Zinc Ltd', 'Rajpura Dariba Mines', 4, 0, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM003', 0, 11, 30, 'NEFT', 100000, 16, 1, 2, 1, 2, 53, 'Yes'),
(18, 4, 'Hindustan Zinc Ltd', 'Chanderia Smelter Complex (CPP)', 2, 0, 1, '08053901768', '', 'AAAPM7450Q', 'AAAPM7450QXD001', 0, 11, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 54, 'Yes'),
(19, 4, 'Hindustan Zinc Ltd', 'Unit-Pyro', 2, 0, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM005', 0, 11, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 55, 'Yes'),
(20, 4, 'Hindustan Zinc ltd', 'Zinc Smelter Debari', 1, 0, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM010', 0, 11, 30, 'Cheque', 100000, 16, 1, 2, 1, 2, 56, 'Yes'),
(21, 4, 'Hindustan Zinc Ltd', 'CPP Zawar Mines', 1, 0, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM008', 0, 11, 30, 'Cheque', 100000, 16, 1, 2, 1, 2, 57, 'Yes'),
(22, 2, 'Ultratech Cement Limited', 'Unit-Birla White', 15, 0, 3, '08832112853', '', 'AAACL6442L', 'AAACL6442LEM034', 0, 11, 30, 'Cheque', 100000, 2, 1, 2, 1, 2, 58, 'Yes'),
(23, 2, 'Ultratech Cement Limited', 'Unit-Sewagram Cement Works', 38, 0, 3, '24131300430', '', 'AAACL6442L', 'AAACL6442LEM182', 0, 11, 30, 'Cheque', 100000, 26, 1, 2, 1, 2, 59, 'Yes'),
(24, 2, 'Ultratech Cement Limited', 'Unit-Bathinda Cement Works', 39, 0, 3, '03231021288', '', 'AAACL6442L', 'AAACL6442LEM021', 0, 11, 30, 'Cheque', 100000, 27, 1, 2, 1, 2, 60, 'Yes'),
(25, 2, 'Ultratech Cement Limited', 'Unit-Awarpur Cement Works', 40, 0, 3, '27710299627', '', 'AAACL6442L', 'AAACL6442LXM005', 0, 11, 30, 'Cheque', 100000, 27, 1, 2, 1, 2, 61, 'Yes'),
(26, 2, 'Ultratech Cement Limited', 'Unit-Kotputli Cement Works', 14, 0, 3, '08832112853', '', 'AAACL6442L', 'AAACL6442LEM032', 0, 7, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 62, 'Yes'),
(29, 8, 'Shree Cement Limited', 'Unit -RAS', 16, 0, 3, '08530101044', '', 'AACCS8796G', 'AACCS8796GXM003', 0, 11, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 63, 'Yes'),
(30, 8, 'Shree Raipur Cement Plant', 'Unit-Shree Cement Ltd', 9, 0, 3, '22851308675', '', 'AACCS8796G', 'AACCS8796GSD010', 0, 11, 30, 'Cheque', 100000, 27, 1, 2, 1, 2, 64, 'Yes'),
(31, 8, 'Shree Cement Unit Panipat', 'Panipat', 41, 0, 3, '06021913366', '', 'AACCS8796G', 'AACCS8796GSD015', 0, 11, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 65, 'Yes'),
(32, 5, 'RSWM Limited', 'Power Plant', 17, 0, 2, '08041001037', '', 'AAACR9700M', 'AAACR9700MXM003', 0, 11, 30, 'Cheque', 100000, 12, 1, 2, 1, 2, 66, 'Yes'),
(33, 5, 'RSWM Limited', 'Unit:-LNJ Denim', 17, 0, 2, '08041001037', '', 'AAACR9700M', 'AAACR9700MXM003', 0, 11, 30, 'Cheque', 100000, 12, 1, 2, 1, 2, 67, 'Yes'),
(34, 5, 'RSWM Limited', 'Unit-Rishabhdev', 1, 0, 2, '08041001037', '', 'AAACR9700M', 'AAACR9700MXM002', 0, 11, 30, 'Cheque', 100000, 28, 1, 2, 1, 2, 68, 'Yes'),
(35, 1, 'Cavendish Industries Limited', 'CIL', 37, 0, 4, '05015370839', '', 'AAFCC8999J', 'AAFCC8999JSD002', 0, 7, 30, 'Cheque', 50000, 3, 1, 2, 1, 2, 69, 'Yes'),
(36, 5, 'BMD Pvt Ltd', 'BMD ', 17, 0, 2, '08671003940', '', 'AABCB2235N', 'AABCB2235NXM001', 0, 11, 30, 'Cheque', 150000, 12, 1, 2, 1, 2, 71, 'Yes'),
(37, 1, 'Ginni international Ltd.', 'GIL', 42, 0, 2, '08570700482', '08570700482', 'AAACG0182E', 'AAACG0182EXM001', 0, 15, 15, 'Cheque', 100000, 3, 1, 2, 1, 2, 72, 'Yes'),
(38, 10, 'Shriram Fertilisers & Chemicals', 'Shriram Fertilisers & Chemicals', 13, 0, 4, '08452101422', '', 'AAACD0097R', 'AAACD0097RST007', 0, 15, 30, 'NEFT', 50000, 15, 1, 2, 1, 2, 73, 'Yes'),
(40, 1, 'Maharaja Shree Umaid Mills Ltd', 'Maharaja Shree Umaid Mills Ltd', 16, 0, 2, '08613251269', '', 'AABCM1849B', 'AABCM1849BXM001', 0, 4, 30, 'Cheque', 100000, 22, 1, 2, 1, 2, 77, 'Yes'),
(41, 1, 'Banawara Syntex Limited', 'Unit BTM', 17, 0, 2, '08203750996', '', 'AAACB8403F', 'AAACB8403FXM001', 0, 4, 30, 'Cheque', 100000, 12, 1, 2, 1, 2, 78, 'Yes'),
(42, 13, 'Udaipur Cement Works Ltd', 'Unit of JK Laxmi Cement', 1, 0, 3, '08134000373', '', 'AAACU8858M', 'AAACU8858MEM001', 0, 4, 30, 'Cheque', 100000, 29, 1, 2, 1, 2, 79, 'Yes'),
(43, 1, 'Neyveli Lignite Corporation Limited', 'NLC', 11, 0, 8, '08351305980', '', 'AAACN1121C', 'AAACN1121CEM011', 0, 11, 45, 'Cheque', 100000, 3, 1, 2, 1, 2, 80, 'Yes'),
(44, 1, 'Wonder Cement Ltd.', 'Unit-Nimbahera', 2, 0, 3, '08400058969', '`', 'AAACW6009L', 'AAACW6009LEM001', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 85, 'Yes'),
(45, 6, 'Sangam (India) Limited', 'Spinning Unit -I', 5, 0, 2, '08111002405', '', 'AACC0486K', 'AACC0486KXM001', 0, 12, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 86, 'Yes'),
(46, 5, 'RSWM Limited', 'Unit-Gulabpura', 5, 0, 2, '08041001037', '', 'AAACR9700M', 'AAACR9700MXM002', 0, 12, 30, 'Cheque', 100000, 2, 1, 2, 1, 2, 87, 'Yes'),
(47, 1, 'Lafarge India Pvt.Ltd. ', 'Lafarge India Pvt.Ltd. ', 2, 0, 3, '08392113289', '', 'AAACL4159L', 'AAACL4159LEM006', 0, 15, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 88, 'Yes'),
(48, 1, 'Jindal Saw Ltd.', 'Jindal Saw Ltd.', 5, 0, 1, '08044052269', '', 'AABCS7280C', 'AABCS7280CEM018', 0, 15, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 89, 'Yes'),
(49, 1, 'Kalisindh Thermal Power Project ', 'KTPP-RRVUNL', 30, 0, 8, '08332105465', '', '', '', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 90, 'Yes'),
(50, 1, 'Chhabra Thermal Power Project', 'CTPS-RRVUNL', 19, 0, 8, '08332105465', '', '', '', 0, 12, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 91, 'Yes'),
(51, 1, 'Parle Biscuit Pvt. Ltd. ', 'Parle Biscuit Pvt. Ltd. ', 42, 0, 7, '08440700796', '', 'AAACP0485D', 'AAACP0485DXM001', 0, 15, 30, 'Cheque', 100000, 27, 1, 2, 1, 2, 92, 'Yes'),
(52, 1, 'United Spirits Limited ', 'Unit- Alwar', 42, 0, 6, '08432101045', '', '', '', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 93, 'Yes'),
(53, 1, 'United Spirits Ltd.', 'Unit- Udaipur', 1, 0, 6, '08432101045', '', '', '', 0, 15, 30, 'Cheque', 100000, 29, 1, 2, 1, 2, 94, 'Yes'),
(54, 1, 'Balkrishna Industries Ltd.', 'Unit-Chopanki', 42, 0, 7, '08470852051', '', 'AAACB3333J', 'AAACB3333JXM011', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 95, 'Yes'),
(55, 1, 'Balkrishna Industries Ltd.', 'Unit-Bhiwadi', 42, 0, 7, '05470852051', '', 'AAACB3333J', 'AAACB3333JXM012', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 96, 'Yes'),
(56, 1, 'Sabmiller India Ltd.', 'Unit-Rochees Breweries', 42, 0, 6, '08743900079', '', 'AAICS2238R', 'AAICS2238R', 0, 15, 30, 'Cheque', 100000, 3, 1, 2, 1, 2, 97, 'Yes'),
(57, 10, 'Shriram Axiall', 'Shriram Axiall', 13, 0, 4, '08762960623', '', 'AAMCS7912E', 'AAMCS7912EEM001', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 98, 'Yes'),
(58, 1, 'J K Tyre & Industries Ltd.', 'J K Tyre & Industries Ltd.', 4, 0, 7, '08851250124', '', 'AAACJ6716F', 'AAACJ6716FXM003', 0, 15, 30, 'Cheque', 100000, 3, 1, 2, 1, 2, 102, 'Yes'),
(59, 1, 'Sanjeev Traders', 'Sanjeev Traders', 5, 0, 10, '08421004320', '', '', '', 0, 15, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 128, 'Yes'),
(60, 1, 'Birla Corporation Limited', 'Unit-Birla cement Works', 2, 0, 3, '08761103461', '', 'AABCB2075J', 'AABCB2075JXM011', 0, 15, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 148, 'Yes'),
(61, 1, 'Chambal Fertilisers And Chemicals Limited', 'CFCL', 13, 0, 4, '08222951511', '', 'AAACC9762A', 'AAACC9762AXM002', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 158, 'Yes'),
(62, 1, 'Lucid Colloid Ltd.', 'Lucid Colloid Ltd.', 15, 0, 7, '08692652832', '', 'AAACL2673B', 'AAACL2673BXM001', 0, 11, 30, 'Cheque', 100000, 2, 1, 2, 1, 2, 271, 'Yes'),
(63, 1, 'Kota Super Thermal Power Plant ', 'KSTPS-RRVUNL', 13, 0, 8, '08332105465', '', '', '', 0, 12, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 272, 'Yes'),
(64, 1, 'United Breweries Limited', 'Unit- Chopanki', 42, 0, 6, '08040583694', '', '', '', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 273, 'Yes'),
(65, 1, 'Carlsberg India Pvt. Ltd.', 'CIPL', 42, 0, 6, '08020605967', '', 'AAJCS8454J', '', 0, 15, 30, 'Cheque', 100000, 3, 1, 2, 1, 2, 274, 'Yes'),
(66, 5, 'RSWM Limited', 'Unit- Mandpam', 5, 0, 2, '08041001037', '', 'AAACR9700M', 'AAACR9700MXM001', 0, 15, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 275, 'Yes'),
(67, 1, 'H.S. Engineering & Marketing', 'HSEM', 43, 0, 10, '27640135784', '', 'AAEHV9693L', '', 0, 7, 30, 'Cheque', 100000, 10, 1, 2, 1, 2, 278, 'Yes'),
(68, 1, 'Suratgarh Super thermal Power Station', 'SSTPS-RRVUNL', 26, 0, 8, '08332105465', '', '', '', 0, 12, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 291, 'Yes'),
(69, 1, 'United Breweries Ltd.-Dharuhera', 'Unit-Dharuhera', 44, 0, 6, '06482703178', '', '', '', 0, 15, 30, 'Cheque', 100000, 3, 1, 2, 1, 2, 298, 'Yes'),
(70, 1, 'Honda Cars India Pvt. Ltd.', 'HCIPL', 42, 0, 5, '0828054435', '', 'AAACH1765Q', 'AAACH1765QXM002', 0, 15, 30, 'Cheque', 100000, 3, 1, 2, 1, 2, 299, 'Yes'),
(71, 1, 'Wasser Technochem (India) Ltd.', 'WTIL', 18, 0, 10, '08810002823', '', 'ACGPM7046L', 'ACGPM7046LXD001', 0, 15, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 300, 'Yes'),
(72, 1, 'Bhavik Terryfab', 'Unit of KG Petrochem Limited', 14, 0, 2, '08511659554', '', 'AAACK7052R', 'AAACK7052RXM002', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 301, 'Yes'),
(73, 1, 'Rajasthan Liquors Ltd', 'Rajasthan Liquors Ltd', 14, 0, 6, '08591757383', '', '', '', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 302, 'Yes'),
(74, 1, 'Varun Beverages Ltd.', 'Varun Beverages Ltd.', 42, 0, 6, '08621650618', '', 'AAACV2678L', 'AAACV2678LXM005', 0, 15, 30, 'Cheque', 100000, 3, 1, 2, 1, 2, 303, 'Yes'),
(75, 1, 'Nissin Brake India Pvt. Ltd.', 'Nissin Brake India Pvt. Ltd.', 42, 0, 5, '08880702699', '', 'AACCN3633K', 'AACCN3633KXM001', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 304, 'Yes'),
(76, 1, 'Saint Gobain Glass India Ltd.', 'Saint Gobain Glass India Ltd.', 42, 0, 7, '08710855314', '', 'AABCS4338M', 'AABCS4338MEM007', 0, 15, 30, 'Cheque', 100000, 3, 1, 2, 1, 2, 305, 'Yes'),
(77, 1, 'Kajaria Ceramics Ltd.', 'KCL', 42, 0, 7, '08930850925', '', 'AABCK1613R', 'AABCK1613RXM001', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 306, 'Yes'),
(78, 7, 'Adani Wilmar Ltd.', 'Unit- Alwar', 42, 0, 12, '08592105419', '', 'AABCA8056G', '', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 363, 'Yes'),
(79, 1, 'Jaquar & Company Pvt. Ltd.', 'Unit-Bhiwadi', 42, 0, 7, '08320852279', '', 'AAACJ2324F', 'AAACJ2324FXM003', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 364, 'Yes'),
(80, 1, 'Siegwerk India Pvt. Ltd.', 'Siegwerk India Pvt. Ltd.', 42, 0, 7, '08330853777', '', 'AAACG4845N', 'AAACG4845NXM010', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 365, 'Yes'),
(81, 1, 'Crystal Chemicals & Engineers', 'CCE', 14, 0, 7, '08041651034', '', 'AFCPS1819Q', '', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 366, 'Yes'),
(83, 4, 'Hindustan Zinc Ltd', 'Rampura Agucha Mines', 5, 0, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM002', 0, 11, 30, 'NEFT', 100000, 7, 1, 2, 1, 2, 368, 'Yes'),
(84, 1, 'Dabur India Limited-Alwar Unit', 'Unit-Alwar', 42, 0, 6, '08720600732', '', 'AAACD0474C', 'AAACD0474CXM008', 0, 15, 30, 'Cheque', 100000, 3, 1, 2, 1, 2, 369, 'Yes'),
(85, 1, 'Sika India Pvt. Ltd.', 'Sika India Pvt. Ltd.', 14, 0, 5, '08152105370', '', 'AAECS1119F', '', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 370, 'Yes'),
(86, 1, 'Nachi Technology India Pvt Ltd ', 'Nachi Technology India Pvt Ltd ', 42, 0, 5, '08200704420', '', 'AADCN9030F', 'AADCN9030FEM001', 0, 15, 25, 'Cheque', 100000, 3, 1, 2, 1, 2, 372, 'Yes'),
(88, 1, 'J.K White Cement Works ', 'Unit of JK Cement Ltd. ', 33, 0, 3, '08841152305', '', 'AABCJ0355R', 'AABCJ0355RXM001', 0, 11, 25, 'NEFT', 100000, 2, 1, 2, 1, 2, 374, 'Yes'),
(89, 1, 'Ajanta Polymer Pvt Ltd', 'APPL', 42, 0, 4, '08360607429', '', 'AAHCA6181G', 'AAHCA6181GEM001', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 375, 'Yes'),
(90, 1, 'Daikin Airconditioning India Pvt. Ltd. ', 'DAIPL', 42, 0, 7, '8452105399', '', 'AABCD0971F', 'AABCD0971FXM001', 0, 15, 30, 'Cheque', 100000, 3, 1, 2, 1, 2, 376, 'Yes'),
(91, 1, 'Vintage Distillers Ltd.', 'Vintage Distillers Ltd.', 42, 0, 6, '08440600401', '', 'AAACV2120K', '', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 377, 'Yes'),
(92, 14, 'Rajshree Pulp And Board Mills Pvt. Ltd.', 'Rajshree Pulp And Board Mills Pvt. Ltd.', 14, 0, 7, '08022253512', '', 'AACCR7812G', 'AACCR7812GXM001', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 378, 'Yes'),
(93, 1, 'Sodexo Food Solution India Pvt. Ltd', '(Jodhpur)', 15, 0, 6, '08222551677', '', 'AAACR2547Q', '', 0, 4, 0, 'NEFT', 0, 2, 1, 2, 1, 2, 379, 'Yes'),
(94, 1, 'A.H. Corporation', 'A.H. Corporation', 1, 0, 10, '08184003789', '', 'AEDPH2393N', '', 0, 7, 7, 'Cheque', 50000, 29, 1, 2, 1, 2, 380, 'Yes'),
(95, 4, 'Hindustan Zinc Ltd', 'Hydro -I ,Unit II', 2, 0, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM005', 0, 11, 30, 'NEFT', 100000, 7, 1, 2, 1, 2, 381, 'Yes'),
(96, 15, 'RSPL', 'RSPL ( Sagar Unit II For OBA)', 46, 0, 11, '23157504482', '', 'AADCS7820A', 'AADCS7820AXM026', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 382, 'Yes'),
(97, 1, 'Rajasthan Rajya Vidhyut Utpadan Ltd', '(Banswara)', 17, 0, 8, '08332105465', '', '', '', 0, 11, 30, 'Cheque', 1000000, 12, 1, 2, 1, 2, 383, 'Yes'),
(98, 7, 'Adani Wilmar Ltd.', 'Unit-Bundi', 21, 0, 12, '08592105419', '', 'AABCA8056G', 'AABCA8056GXM004', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 384, 'Yes'),
(99, 1, 'Manglam Cement Limited', 'Manglam Cement Limited', 13, 0, 3, '08442902696', '', 'AABCM6602Q', 'AABCM6602QXM001', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 385, 'Yes'),
(101, 1, 'Advantage Oils Pvt. Ltd.', 'AOPL', 21, 0, 12, '08512807355', '', 'AAMCA0464H', '', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 387, 'Yes'),
(102, 0, 'Mahesh Edible Oil Industries Ltd.', 'Mahesh Edible Oil Industries Ltd.', 13, 0, 12, '08342909638', '', '', '', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 388, 'Yes'),
(103, 1, 'ACC Limited', 'Unit-Lakheri Cement  Works', 21, 0, 3, '08252801090', '', 'AAACT1507C', 'AAACT1507CXM013', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 389, 'Yes'),
(104, 1, 'Ruchi Soya Industries Ltd.', 'Ruchi Soya Industries Ltd.', 26, 0, 12, '08071606834', '', 'AAACR2892L', 'AAACR2892LEM012', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 390, 'Yes'),
(105, 1, 'K.S.Oils Limited', 'K.S.Oils Limited', 13, 0, 12, '08052558803', '', '', '', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 391, 'Yes'),
(106, 1, 'Khilari Infrastructure Pvt. Ltd.', 'KIPL', 1, 0, 10, '08123965604', '', 'AAFCA9143A', '', 0, 15, 30, 'Cheque', 100000, 29, 1, 2, 1, 2, 392, 'Yes'),
(107, 10, 'Shriram Cement Works ', 'Shriram Cement Works ', 13, 0, 3, '08452101422', '', 'AAAC0097R', 'AAAC0097RXM003', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 393, 'Yes'),
(108, 1, 'KEI Industries Limited ', 'Kei Industries Limited', 42, 0, 13, '08600850088', '', 'AAACK0251C', 'AAACK0251CXM004', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 394, 'Yes'),
(109, 1, 'Juneja Wires Pvt. Ltd.', 'Juneja Wires Pvt. Ltd.', 14, 0, 13, '8552162089', '', 'AABCJ9179M', '', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 395, 'Yes'),
(110, 8, 'Shree Cement Ltd.,', '(Khushkhera Cement Grinding Project)', 42, 0, 3, '08743900079', '', 'AACCS8796G', 'AACCS8796GXM004', 0, 11, 30, 'Cheque', 20000, 1, 1, 2, 1, 2, 396, 'Yes'),
(111, 1, 'Cattle Feed Plant ', '(A Unit of Rajasthan Dairy Federation Limited)', 20, 0, 6, '08890752007', '', '', '', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 397, 'Yes'),
(112, 1, 'Sigma Electric Mfg Corp (P) Ltd.', 'Sigma Electric Mfg Corp (P) Ltd.', 14, 0, 13, '08161665712', '', 'AADCS9493H', 'AADCS9493HXM004', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 398, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE IF NOT EXISTS `customer_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `district_id` int(10) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `transporter_id` int(10) NOT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=319 ;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`id`, `customer_id`, `address`, `district_id`, `telephone`, `mobile`, `transporter_id`, `default_address`) VALUES
(8, 5, '(Formerly Indo Zinc Ltd)\r\n(A Subsidiary of The India Cements Ltd)\r\nPost Wajwana\r\nBanswara -327025', 17, '', '', 1, 1),
(53, 29, 'Bangur City\r\nPO RAS-306107\r\nTehsil :Jaitaran\r\nDist. Pali\r\n', 16, '', '', 6, 1),
(54, 30, 'Village -Khapradig ,Teh :-Simga\r\nBhatapara ,Baloda Bazar Raipur -493332\r\nChattisgarh', 9, '', '', 0, 1),
(71, 39, 'Kailash Nagar, Nimbahera-312617\r\nDistt-Chittorgarh,(Rajasthan)\r\nContact no.-01477220205\r\n', 2, '', '', 7, 1),
(73, 10, 'Sutlej Textiles and Industries Limited\r\nUnit-Rajasthan Textile Mills, \r\nPachpahar Road Bhawanimandi-326502 Distt: Jhalawar', 30, '', '', 3, 1),
(75, 8, 'Unit Of - DCM Shriram Industries Limited\r\nShriram Nagar, Kota-324004', 13, '', '', 1, 1),
(77, 9, 'P.O. Adityanagar - 326 520\r\nMORAK, Distt. Kota (Rajasthan)', 13, '', '', 2, 1),
(78, 40, 'Pali-Marwar-306401\r\nRajastahn', 16, '', '', 0, 1),
(81, 42, 'Rajasthan State Highway 9, \r\nSripati Nagar, Dabok, Udaipur-313201\r\nRajasthan \r\n', 1, '', '', 29, 1),
(83, 2, 'UNIT:ADITYA CEMENT WORKS\r\nAdityapuram Shambhura\r\nChittorgarh', 2, '', '', 1, 1),
(84, 6, 'Unit: Vikram Cement Works\r\nKHOR, Tehsil: Jawad \r\nNeemuch (MP)-458470', 10, '', '', 14, 1),
(85, 22, 'Unit-Birla White\r\nRajashree Nagar, Kharia Khangar\r\nVillage :-Kharia Khangar\r\nDist. Jodhpur 342606', 15, '', '', 1, 1),
(86, 23, 'Unit-Sewagram Cement Works\r\nVillage Vayor , Taluka Abdasa\r\nDist.-Kutch-370511', 38, '', '', 6, 1),
(87, 24, 'Unit-Bathinda Cement Works\r\nLehra Mohabbat, \r\nRampurphul\r\nBathinda (Punjab) - 151111', 39, '', '', 6, 1),
(88, 25, 'Unit-Awarpur Cement Works\r\nP.O. Awarpur\r\nTal :Korpana\r\nDist. Chandrapur \r\nMaharastra -442917', 40, '', '', 6, 1),
(96, 19, 'Unit-Pyro\r\nChanderiya Lead Zinc Smelter\r\nChittorgarh', 2, '', '', 6, 1),
(97, 20, 'Zinc Smelter\r\nDebari\r\nUdaipur-313024', 1, '', '', 6, 1),
(99, 21, 'CPP Zawar Mines\r\nZawar Mines\r\nDist. Udaipur', 1, '', '', 16, 1),
(101, 33, 'Unit:-LNJ Denim\r\nPost Box No 28\r\nLNJ Nagar Mordi\r\nBanswara-327001 (Raj.)', 17, '', '', 6, 1),
(106, 4, 'Bangur Nagar \r\nPost Box no 33\r\nBeawar; 305901', 3, '', '', 6, 1),
(108, 43, '25, Rajasthan Project\r\nA.O. Building Barsingsar-334402\r\nBikaner (Raj.)', 11, '', '', 6, 1),
(120, 52, 'United Spirits Limited, \r\nUnit- Alwar\r\n201-202,M.I.A,-301030\r\nAlwar(Raj.)', 42, '', '', 0, 1),
(130, 34, 'Unit-Rishabhdev\r\nPost ;- Rishabhdev 313802\r\nDist. Udaipur (Raj.)\r\n', 1, '', '', 6, 1),
(132, 45, 'Sangam (India) Limited\r\n(Spinning unit-I)\r\nPost Box No. 126, Biliya Kalan, Chittorgarh Road, Bhilwara-3111001 (Raj.)', 5, '', '', 6, 1),
(136, 48, 'Jindal Saw Ltd. \r\nAraji No. 9697/6711,\r\nNear Tiranga Hills, \r\nVill- PUR, Tehsil- Bhilwara\r\n311802(Raj.)', 5, '', '', 7, 1),
(141, 58, 'J K Tyre & Industries Ltd.\r\nJaykaygram, PO-Tyre Factory,\r\nKankroli-313342(Raj)', 4, '', '', 0, 1),
(145, 62, 'Lucid Colloid Ltd.\r\nB 5/7 Marudhar Industrial Area, Jodhpur-342005 ', 15, '', '', 0, 1),
(147, 64, 'United Breweries Limited,\r\nBlock No. SP 971, RICCO Industrial Area,\r\nCHOPANKI-301019', 42, '', '', 0, 1),
(150, 66, 'RSWM Limited,\r\n(Unit- Mandpam)\r\nPB No. 13\r\nBhilwara-311001', 5, '', '', 7, 1),
(151, 46, 'RSWM Limited, \r\nKharigram, \r\nP.O. Gulabpura.', 5, '', '', 6, 1),
(156, 68, 'Suratgarh Super thermal Power,\r\nRajasthan Rajya Vidyut Utpadan Nigam Limited, Near Village-Raiawali,\r\nSuratgarh-335804\r\nSri Ganganagar (Raj.)', 26, '', '', 7, 0),
(157, 63, 'Kota Super Thermal Power Plant,\r\nRajsthan Rajya Vidyut Utpadan Nigam Limited,\r\nSakatpura, Kota-313003', 13, '', '', 7, 1),
(173, 82, 'Rampura Agucha Mines ,\r\nPO Agucha Dist. Bhilwara - 311029', 5, '', '', 0, 0),
(174, 83, 'Rampura Agucha Mines ,\r\nPO Agucha Dist. Bhilwara - 311029', 5, '', '', 0, 0),
(179, 3, 'Jaykaypuram\r\nBanas\r\nDist. Sirohi', 7, '', '', 2, 1),
(181, 87, 'P.O Gotan ,Dist. Nagaur- 342 902 Rajasthan ', 33, '', '', 0, 0),
(182, 88, 'P.O Gotan ,Dist. Nagaur- 342 902 Rajasthan ', 33, '', '', 0, 0),
(191, 93, 'C-17,Panchwati Colony\r\nNear Bhaskar Circle,\r\nRatanada , Jodhpur -342001', 15, '', '', 0, 1),
(192, 31, '( A Unit of Shree Cement Ltd )\r\nJind Road\r\nKhukhrana,Assan Kalan\r\nPanipat Haryana-132103', 41, '', '', 6, 1),
(197, 69, '68th Milestone, N.H.8, Village-Joniawas,\r\nDHARUHERA-122100,\r\nDistt-Rewari,(Haryana)', 44, '', '', 7, 0),
(198, 53, 'Udaisagar Road,\r\nUdaipur-313003', 1, '', '', 7, 1),
(201, 59, '7J 4,RC Vyas Colony,\r\nBhilwara', 5, '', '', 7, 1),
(202, 47, 'Chittor cement plant,\r\nVill- Bhawalia, Tehsil- Nimbahera-312620', 2, '', '', 14, 1),
(205, 15, '(Unit of J.K. Cement Ltd.)\r\nKailash nagar \r\nNimbahera - 312617', 2, '', '', 7, 1),
(210, 96, 'RSPL Group, Plot No.119-121, Block P&T, Kalpi Road, Fazalganj, Kanpur-208012 (UP)\r\n\r\n', 46, '', '', 6, 1),
(211, 96, 'Plot No. 42 to 47, 49 to 54, MPIIDC Growth Center Sector- MP', 47, '', '', 6, 0),
(214, 95, 'Hydro -I ,Unit II\r\nChanderai Lead Zinc Smelter,\r\nChittorgarh-312021', 2, '', '', 6, 1),
(215, 97, 'The Executive Engineer ( O&M/Ph-I)\r\nGeneration Circle,Vidhyut nagar\r\nBanswara-327001', 17, '', '', 0, 1),
(217, 32, 'Power Plant\r\nLNJ Nagar\r\nVillage :Mordi\r\nBanswara-327001 (Raj.)', 17, '', '', 6, 1),
(218, 99, 'Aditya Nagar, Morak-326520, Distt-Kota (Raj.) ', 13, '', '', 0, 1),
(221, 100, 'NH-12, Ramganj Balaji, Bundi, Rajasthan-323001', 21, '', '', 0, 1),
(223, 102, 'Kathori, Kota (Raj.)', 13, '', '', 0, 1),
(226, 104, 'A-69-70, RICCO Industrial Area Sriganganagar-335002', 26, '', '', 0, 1),
(227, 105, 'Jiwaji Ganj, Morena (M.P.)', 48, '', '', 0, 0),
(228, 105, 'Industrial Area, A.B. Road, Morena (M.P.)', 48, '', '', 0, 0),
(229, 105, 'Baran Road, Village-Tathed, Ditt- Kota, ', 13, '', '', 0, 1),
(231, 107, 'Shriram Nagar, Kota-324004', 13, '', '', 0, 1),
(232, 57, '(Division of DCM Shriram Ltd.)\r\nShriram Nagar, Kota-324004', 13, '', '', 7, 1),
(237, 109, 'G-1017-1018, Phase-III,\r\nSitapura Industrial Area,\r\nTonk Road, Jaipur-302022', 14, '', '', 0, 1),
(241, 73, 'Room 2 & 57th Floor,\r\nRaghukul Tower, \r\nKhatipura Mod , Srisi Road,\r\nJaipur-302021', 14, '', '', 7, 1),
(242, 85, 'A-127 RIICO Indusrial Area,\r\nManda, Kala Dera, Sikar\r\nRoad, Chomu,\r\nJaipur-3037121', 14, '', '', 7, 1),
(243, 74, 'Plot No. SP 290-292,\r\nRIICO Industrial Area,\r\nPhase-VII, Chopanki, \r\nBhiwadi, Alwar-301019', 42, '', '', 6, 1),
(244, 92, '(Dalmia Group Of Companies)\r\nA-129 (N-1), Road No. 9-D, \r\nV.K.I. Area, Jaipur-302013', 14, '', '', 7, 1),
(245, 56, 'Unit-Rochees Breweries,\r\nSP 2-3, RICCO Industrial Area, NH-8, Vill-Neemrana,\r\nTehsil- Behror,PIN-301705\r\n', 42, '', '', 7, 1),
(246, 86, 'SP-86, NIC (M), RIICO \r\nIndustrial Area, Phase -II \r\nNeemrana , Alwar-301705, (Raj.) ', 42, '', '', 7, 0),
(248, 75, 'SP-1-33-35, New Industrial Area, Phase-III, Neemrana-301705', 42, '', '', 7, 1),
(249, 76, 'Plot No. SP-1, Kahrani\r\nIndustrial Area, (Bhiwadi\r\nExtension), RICCO Bhiwadi-\r\n301019', 42, '', '', 7, 1),
(251, 80, '7-8 KM Stone, Bhiwadi-\r\nAlwar Road, Khijuriwas (PO), \r\nAlwar (Dist), Bhiwadi, \r\nRajasthan 301018', 42, '', '', 7, 1),
(253, 91, '117, M.I.A , Alwar (Raj.)', 42, '', '', 7, 1),
(255, 51, 'Sp 2-4, RIICO Industrial Area, Delhi-Jaipur Highway,\r\nNeemrana, Teh. Behror, Distt- Alwar-301705', 42, '', '', 7, 1),
(256, 49, 'Rajasthan Rajya vidyut Utpadan Nigam Limited,\r\nVill-Undal, Tehsil- Jhalarapatn, Distt-Jhalawar\r\nPIN-326023 ', 30, '', '', 6, 1),
(259, 110, '(Khushkhera Cement Grinding Project)\r\nPlot No. SP3-II, A-1, \r\nRIICO Industrial Area\r\nBhiwadi, Taluka-Tijara,\r\nKhushkhera-301707\r\nDistt: Alwar (Raj.)', 42, '', '', 0, 1),
(261, 112, 'A-135-135-136, Road no. 12, Vishwakarma indusrial Area, Jaipur-302013', 14, '', '', 0, 1),
(262, 38, '(A Division of DCM Shriram Cement) Shriram Nagar, Kota-3240004', 13, '', '', 7, 1),
(264, 103, '(Unit-Lakheri Cement  Works)\r\nPO- Lakheri, \r\nDisst- Bundi-323603 (Raj.)', 21, '', '', 6, 1),
(268, 78, 'S. No. 121/135,\r\n Nr. M.I.A. RIICO  Idustrial Area,\r\nAt-Roondh Dhooninath,\r\nTeh-Ramgarh, \r\nNr. Ashok Leyland-999999\r\nAlwar (Raj)\r\n', 42, '', '', 7, 1),
(269, 98, 'Unit-Bundi\r\nSilor Road, \r\nKota-Jaipur Highway\r\nBundi-323001 (Raj)', 21, '', '', 6, 1),
(270, 101, 'NH-12, Ramganj Balaji, \r\nBundi-323001 (Raj)', 21, '', '', 6, 1),
(273, 89, 'A-321,A-321(A), \r\nMatsay Industrial Area , \r\nAlwar-301030 (Raj)', 42, '', '', 6, 1),
(274, 89, '10001, 10th Floor,\r\n Agarwal Corporate Heights,\r\n Netaji Subhash Place, \r\nPitampura , \r\nDelhi-110034', 45, '', '', 6, 0),
(275, 11, 'Unit- Rabriyawas\r\nTehsil-jaitaran \r\nPali (Raj)\r\n\r\n', 16, '', '', 0, 1),
(276, 11, 'City Office:\r\n21-22 Ganpati plaza \r\nBhagat Chauraha\r\nBeawar-305901', 3, '', '', 0, 0),
(279, 108, 'A, 280-284 RIICO \r\nIndustrial Area,\r\nChopanki, Distt-Alwar\r\n301019 (Raj.)', 42, '', '', 6, 1),
(280, 94, '206, MTN, \r\nNeemach Kheda Main Road, \r\nNeenach Mata Scheme, Dewali, UDAIPUR-313001 (Raj.)', 1, '', '', 29, 1),
(281, 54, 'Unit-Chopanki\r\nA-300-305 & 306-313, \r\nRIICO Industrial Area,\r\nPhase-VIII, Chopanki-301707\r\nAlwar', 42, '', '', 6, 1),
(282, 7, 'NH 90, Atru Road, \r\nVillage Kawai, Taluka Atru, \r\nBaran 325 219, (Raj)', 19, '', '', 6, 1),
(283, 55, 'Unit-Bhiwadi\r\nSP-923,Phase-III, \r\nRIICO Industrial Area,\r\nBhiwadi-301019\r\nAlwar\r\n', 42, '', '', 6, 1),
(284, 81, 'B-25-26, RIICO Housing Colony\r\nRoad No. 1-D, V.K.I. Area, \r\nJaipur-302013', 14, '', '', 6, 1),
(285, 50, 'Chhabra Thermal Power   Project, \r\nRajasthan Rajya Vidyut Utpadan Nigam Limited,\r\nMotipura Chowki, \r\nBaran -325220  \r\n', 19, '', '', 30, 1),
(286, 61, 'P.O. Gadepan\r\nKota -325208', 13, '', '', 6, 1),
(287, 35, 'Laksar Tyre Plant 2\r\nVill-Khedimubarakpur, \r\nTeh.: Laksar, -247663\r\nHaridwar  (Uttrakhand)', 37, '', '', 6, 1),
(289, 111, '(A unit of Rajasthan Cooperative Dairy Federation Limited)\r\nNadbai, \r\nBhratpur 321602 (Raj.)\r\n', 20, '', '', 6, 1),
(290, 65, 'Plot# SP1 to & B5 to 8 \r\nAgro Park, M.I.A. (Extention )\r\nAlwar-301030 (Raj.)', 42, '', '', 6, 1),
(291, 26, 'Unit-Kotputli Cement Works\r\nVillage - Mohanpura\r\nTeh - Kotputli\r\nDist. jaipur-303108', 14, '', '', 6, 1),
(293, 60, 'Unit- Birla cement works,\r\nChanderia , 302021\r\nChittorgarh', 2, '', '', 6, 1),
(294, 72, '(A Unit of KG Petrochem Limited),\r\n F-394(G) Road \r\nNo. 9F2, V.K.I. Area \r\nJaipur-302013', 14, '', '', 6, 1),
(297, 41, 'Unit-BTM\r\nP.B. No. 21\r\nIndustrial Area \r\nBanswara -327001 ', 17, '', '', 6, 1),
(298, 36, 'Post Box No 35\r\nLNJ Nagar , Mordi\r\nBanswara ( Raj)', 17, '', '', 6, 1),
(301, 70, 'SPL 1, Tapukara Industrial\r\nArea, Khuskhera\r\nDistt-Alwar \r\n301707 (Raj.)', 42, '', '', 6, 1),
(302, 84, 'SPC-162, MIA,\r\n Alwar -301030\r\n', 42, '', '', 6, 1),
(303, 90, 'SP2-15 & SP2-24 to SP2-27, \r\nRIICO New Industrial Complex\r\nMajrakath,Neemrana, \r\nAlwar-301705 (Raj.)', 42, '', '', 6, 1),
(304, 79, 'SP-53, RIICO Industrial Area, Bhiwadi-301019,\r\n', 42, '', '', 7, 1),
(305, 37, 'RIICO Industrial Area\r\nNeemrana\r\n Alwar-301705', 42, '', '', 6, 1),
(306, 77, '19 KM Stone,\r\n Bhiwadi-Alwar Road, \r\nVill-Gailpur \r\nBhiawdi-301707\r\nDistt-Alwar (Raj.)', 42, '', '', 7, 1),
(307, 67, '1003,Magnum Tower, 2nd Cross Lane, Swami Samarth Nagar,\r\n Andheri (W)-400053,\r\nMumbai(Maharashtra)', 43, '', '', 6, 1),
(308, 1, 'Dariba Smelter Complex\r\nRajpura Dariba Mines\r\nRajsamand - 313211', 4, '', '', 6, 1),
(309, 106, '376, Rukamani Sadan,\r\nNear Alok School, \r\nSector-11, \r\nUdaipur-313001 (Raj.)', 1, '', '', 29, 1),
(310, 44, 'R. K. Nagar, Nimbahera\r\nDistt-Chittorgarh\r\n312601 (Raj.)', 2, '', '', 14, 1),
(311, 12, 'Sindesar Khurd Mine\r\nP.O. Dariba\r\nRajsamand', 4, '', '', 16, 1),
(313, 16, 'Haridwar Zinc Plant\r\nPlot No 2D-1, Sector 10,\r\nIIE , SIDCUL \r\nHaridwar-249403\r\nUttrakhand', 37, '', '', 6, 1),
(314, 17, 'Rajpura Dariba Mines\r\nDariba Smelter Complex \r\nP.O. Dariba Mines\r\nRajsamand', 4, '', '', 16, 1),
(315, 18, 'Chanderia Smelter Complex (CPP)\r\nPO Putholi\r\nChittorgarh', 2, '', '', 6, 1),
(316, 71, 'F-149, "SAKAR"\r\nChandrawardai Nagar,\r\nAjmer-305003 (Raj.)', 18, '', '', 7, 1),
(317, 113, 'RSPL Group, Plot No.119-121, Block P&T, Kalpi Road, Fazalganj, Kanpur-208012 (UP)\r\n', 46, '', '', 0, 1),
(318, 113, 'Plot No. 42 to 47, 49 to 54, MPIIDC Growth Center Sector- MP', 47, '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer_contacts`
--

CREATE TABLE IF NOT EXISTS `customer_contacts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `contact_person` varchar(100) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `default_contact` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=359 ;

--
-- Dumping data for table `customer_contacts`
--

INSERT INTO `customer_contacts` (`id`, `contact_person`, `customer_id`, `designation`, `telephone`, `email`, `mobile`, `default_contact`) VALUES
(8, 'Jitendra Sharma', 5, 'Purchase Executive', '0296230151', 'jitendra.s@indiacements.co.in', '0296230151', 1),
(60, 'Gaurav Maheshwari', 29, 'Purchase Executive', '01462228101', 'maheshwarig@shreecementltd.com', '9214337632', 1),
(61, 'Shadaab Alam Rizvi', 30, 'Purchase Executive', '8349301232', 'rizvis@shreecementltd.com', '8349301232', 1),
(87, 'Piyush Tiwari', 39, 'Astt. Manager-Procurement ', '01477220205', 'Piyush.Tiwari@jkcement.com', '0147722020', 1),
(90, 'Bhanwar Tripathi', 10, 'Sr Purchase officer', '07433222052', 'btripathi@sutlej-rtm.co.in', '9116009797', 1),
(92, 'Ram Kshteri', 8, 'Purchase Manager', '9929590865', 'ramkshetri@dcmsr.com', '9929590865', 1),
(94, 'Vipesh Gupta', 9, 'GM Purchase', '9351468146', 'vipesh.gupta@mangalamcement.com', '9351468146', 1),
(95, 'Mr. Tapasvi Vaidya', 40, 'Manager Material', '2932220286', 'tapasvi.vaidya@lnbgroup.com', '9001099411', 1),
(98, 'Rahul Jain', 42, 'Purchase Executive', '02971244417', 'rahuljain@ucwl.jkmail.com', '7728886069', 1),
(103, 'Satish Shukla', 2, 'Manager Purchase', '1472221001', 'satish.shukla@adityabirla.com', '1472221002', 1),
(104, 'Ankit Swarnkar', 6, 'Purchase Executive', '7420230525', 'anki.swarnkar@adityabilra.com', '7420230525', 1),
(105, 'Hari Kumar Maloo', 6, 'Purchase Excutive', '9826564600', 'hari.maloo@adityabirla.com', '9826564600', 0),
(106, 'Kuldeep Singh Shekhawat', 22, 'Purchase Executive', '02920264040', 'kuldeep.shekhawat@adityabirla.com', '2920264040', 1),
(107, 'Sharik Ahmad', 23, 'Purchase Executive', '9909920364', 'md.ahmad@adityabirla.com', '9909920364', 1),
(108, 'Rajiv Arora', 24, 'Purchase Executive', '01642863170', 'rajiv.arora@adityabirla.com', '0164286317', 1),
(109, 'Amit Kumar Jain', 25, 'Purchase Executive', '07173266342', 'amit.jain@adityabirla.com', '9763712778', 1),
(110, 'TVS Ramkrishna', 25, 'Purchase Executive', '07173266342', 'tangirala.krishna@adityabirla.com', '7722039483', 0),
(118, 'Sandeep Paliwal', 19, 'Purchase Excutive', '01472254285', 'sandeep.paliwal@vedanta.co.in', '0147225428', 1),
(119, 'Sanjay Chaturvedi', 20, 'Store Incharge', '9829405556', 'sanjay.chaturvedi@vedanta.co.in', '9829405556', 1),
(121, 'PC Pareek', 21, 'Purchase Msanager', '9928013967', 'pc.pareek@vedanta.co.in', '9928013967', 1),
(124, 'Mr. Udai Sing Hada', 33, 'Purchase Executive', '02961131661', 'purchasedenim@lnjbhilwara.com', '2961131661', 1),
(131, 'Gaurav Maheshwar', 4, 'Purchase Executive', '0146222811', 'maheshwari@shreecementltd.com', '9214337632', 1),
(133, 'KK Bachhavate', 43, 'Enggineer', '1234567890', 'kk.bachhavate@lncindia.com', '1234567890', 1),
(146, 'Mr. Harsharan Singh ', 52, 'Store Manager', '01442881415', 'harsharan.singh@unitedspirits.in', '8239477381', 0),
(147, 'Mr. Vikas Chawla', 52, 'Store Manager', '01442881417', 'Vikas.chawla@unitedspirits.in', '7073070044', 0),
(158, 'Mr. PC Jain', 34, 'Purchase Manager', '02907230321', 'pcjain@lnjbhilwara.com', '9414005132', 1),
(160, 'Pankaj Bhardwaj', 45, 'Purchase Executive', '01482249071', 'purchase1@sangamgroup.com', '0148224907', 1),
(165, 'Mr. Abhishek Sharma ', 48, 'Purchase Executive', '08003091651', 'abhishek.sharma@jindalsaw.com', '8003091651', 1),
(170, 'Mr. S.S. Sharma', 58, 'Purchase Officer', '02952232090', 'sss@ktp.jkmail.com', '2952232091', 1),
(174, 'Mr. Bharat Goyal', 62, 'Purchase Executive', '9314760025', 'bgoyal@lucidgroup.com', '9314760025', 1),
(176, 'Mr. Nitin Jain ', 64, 'Purchase Executive', '01493512313', 'nitinjain@ubmail.com', '9982044478', 1),
(179, 'Mr. C.P. Chaturvedi', 66, 'Head-Materials', '01482249512', 'cp.chaturvedi@lnjbhilwara.com', '9414034874', 1),
(180, 'S M Jain ', 46, 'Dy Manager (Materials)', '01483223144', 'smjain@lnjbhiwara.com', '1483223150', 1),
(186, 'Mr. Bhagwan Das Jatav', 68, 'Assistant Engineer', '01509245662', 'proc.stps.suratgarh@gmail.com', '1509245662', 0),
(187, 'Mr. Manish Gupta', 68, 'Asst. Account Officer', '01509245689', 'proc.stps.suratgarh@gmail.com', '1509245689', 0),
(188, 'Mr. V.K. Golani', 63, 'Superintending Engineer (MM)', '07442370002', 'semktps@gmail.com', '7442370002', 1),
(206, 'Rupesh Jain', 82, 'sales', '01483229521', 'rupesh.jain@vedanta.co.in', '0148322952', 0),
(207, 'Rupesh Jain', 83, 'Store Incharge', '01483229521', 'rupesh.jain@vedanta.co.in', '0148322952', 0),
(212, 'Mr R V Verma', 3, 'Manager Purchase', '0297124440', 'rvverma@lc.jkmail.com', '0297124440', 1),
(214, 'Bikram Koshlia', 87, 'Store Department', '01591230211', 'bikram.koshlia@jkcement.com', '0159123021', 0),
(215, 'Bikram Koshlia', 88, 'Store Department', '01591230211', 'bikram.koshlia@jkcement.com', '0159123021', 0),
(222, 'Manoj Kumar', 93, 'Head Technical Service', '02271016166', 'manoj.k@sodexo.com', '9930284954', 0),
(223, 'Mangesh Kawade', 93, 'Purchase Executive', '02271016166', 'Mangesh.KAWADE@sodexo.com', '7742505505', 1),
(224, 'Chandrashekhar Ghadigaonkar', 93, 'Purchase Executive', '02271016166', 'Chandrashekhar.GHADIGAONKAR@sodexo.com', '7742555944', 0),
(225, 'Mr Gaurav Maheshwari', 31, 'Purchase Executive', '01462228101', 'maheshwar@shreecementltd.com', '9214337632', 0),
(226, 'Mr Vivek Saxena', 31, 'Purchase Executive', '01462228101', 'saxenav@shreecementltd.com', '9214337462', 1),
(231, 'Mr. Rajnish Malik', 69, 'Procurement', '01274267126', 'rajnishmalik@ubmail.com', '1274267126', 0),
(232, 'Mr. Ajay Prakash Singh', 69, 'Procurement', '01274267126', 'ajayprakash@ubmail.com', '9991735166', 1),
(233, 'Mr. Sagar Roy', 53, 'Store Manger', '02942492333', 'sagar.roy@unitedspirits.in', '2942492333', 1),
(236, 'Mr. Sanjeev Ji', 59, 'Proprieter', '9351734430', 'sanjeevtradersbhl@gmail.com', '9351734430', 1),
(237, 'Suhas Mahadeokar', 47, 'Sr. Manager( Plant inventory)', '08008198553', 'suhas.mahadeokar@in.lafarge.com', '8008198553', 1),
(242, 'Ajay Raj Vaishnav', 15, 'Purchase Excutive', '1477220087', 'ajayraj.vaishnav@jkcement.com', '9799039255', 1),
(243, 'Akshay Agarwal', 15, 'Purchase Excutive', '1477220087', 'purchase.nbh@jkcement.com', '1477220087', 0),
(247, 'Mr. Akshay Agarwal ', 96, 'AM-Procurement', '05122221201', 'akshayk.agarwal@rsplgroup.com', '7318214777', 1),
(250, 'Mr PC Pareek', 95, 'Purchase Excutive', '9928013967', 'pc.pareek@vedanta.co.in', '9928013967', 1),
(251, 'Mr Manish', 97, 'XEN', '9413348292', 'xenmahihydro@gmail.com', '9413348292', 1),
(253, 'Mr. Parveen Rawal', 32, 'Purchase Sr Executive', '9413357059', 'powerpurchase.rswm@lnjbhilwara.com', '9413357059', 1),
(254, 'Mr. Mamtesh Jain', 32, 'Purchase Executive', '02961231672', 'mamteshjain@lnjbhilwara.com', '2961231672', 0),
(255, 'Mr. vipesh Gupta', 99, 'GM (Purchase)', '07459232794', 'vipesh.gupta@mangalamcement.com', '9351468146', 1),
(258, 'Mr. Yusuf Ansari', 100, 'Purchase Head', '07475130021', 'yusuf.ansari@advantageoils.com', '7073458817', 1),
(260, 'Sandhya Sharma', 102, 'Purchase Executive', '8003994354', 'purchase@maheshoil.com', '8003994354', 1),
(263, 'Mr. S.L. Kaushik', 104, 'Manager (Production)', '9829191050', 'sl_kaushik@ruchigroup.com', '9829191050', 1),
(264, 'Mr. Ashok Sharma', 105, 'Purchase Officer', '9352597942', 'ashoksharma@ksoils.com', '9352597942', 1),
(266, 'Mr. Nitin Paliwal', 107, 'Purchaser ', '9829895738', 'nitinpaliwal@dcmshriram.com', '9829895738', 1),
(267, 'Mr. Dileep Sisodia', 57, 'Dy. Manager (Commercial)', '07442480991', 'dileep.sisodia@shriramaxiall.com', '9829516611', 1),
(272, 'Mr. Monal Juneja', 109, 'Proprietor', '8094017010', 'junejawires@yahoo.com', '8094017010', 1),
(276, 'Mr. Vijay Gaur ', 73, 'Purchase Manager ', '9828454836', 'gaurvijay33@yahoo.co.in', '9214334333', 1),
(277, 'Mr, Sunil Nayak ', 85, 'Purchase Manager', '9166011119', 'nayak.sunil@in.sika.com', '9166011119', 1),
(278, 'Mr. Nitin Tiwari', 74, 'Purchase Manager', '01493302765', 'purchase.tiwari@rjcorp.in', '1493302765', 1),
(279, 'Mr. Jitendra Singh Shekhawat', 92, 'Purchase Executive ', '01412330156', 'Shushildalmia2009@gmail.com', '9928038290', 1),
(280, 'Mr. Anirban Mitra', 56, 'RBl', '09672692777', 'anirban.mitra@in.Sabmiller.com', '9672692777', 0),
(281, 'Sachin Sharma ', 86, 'Purchase Dept.', '01494671305', 'sachin@nachi-india.com', '0149467130', 0),
(283, 'Mr. Pradeep Kumar Tripathi', 75, 'Sr. ER(Maintenance)', '01494246733', 'p.tripathi@nissinindia.com', '9680705837', 0),
(284, 'Mr. Niraj Yadav', 76, 'Purchase Executive', '01493301273', 'niraj.yadav@saint-gobain.com', '8000194203', 1),
(286, 'Mr. Ankush Saxena', 80, 'A.M-Indirect Purchase', '01493298371217', 'ankush.saxena@siegwerk.com', '8107291735', 1),
(288, 'Mr. Ram Arjun ', 91, 'DGM-VDL', '01442881247', 'ramarjun.vdl@gmail.com', '7665432554', 1),
(291, 'Mr. Subhash Prajapati', 51, 'Sr. Executive Purchase', '01494246312', 'subhash.prajapati@parle.biz', '9785301234', 1),
(292, 'Mr R P Kapoor', 49, 'Superintending Engg  MM', '07432243009', 'katpp_mm@rediffmail.com', '7432243009', 0),
(295, 'Navneet', 110, 'Purchase Executive', '1462228101', 'navneet13596@shreecementltd.com', '9251077025', 1),
(297, 'Mr. Pankaj Kalani', 112, 'Dy. Manager (Material)', '01413064900', 'pkalani@sigmaelectric.com', '9785022279', 1),
(298, 'Mr. Neelambuj Pareek', 38, 'Purchase manager', '9460483470', 'neelambujpareek@dcmshriram.com', '9460483470', 1),
(300, 'Mr.Pankaj Kumar', 103, 'Purchase Head', '8003195532', 'pankaj.kumar@acclimited.com', '8003195532', 1),
(304, 'Mr. Imran Ali', 78, 'Purchase Officer', '01442881299', 'imran.ali@adaniwilmar.in', '7665006863', 1),
(305, 'Mr. Sachin Kanungo', 98, 'Purchase Head', '9672971122', 'sachin.kanungo@adaniwilmar.in', '9672971122', 1),
(306, 'Mr. Yusuf Ansari', 101, 'Purchase Head', '07475130021', 'yusuf.ansari@advantageoils.com', '7073458817', 1),
(308, 'Mr. Ankit Sharma ', 89, 'Purchase Executive', '01149811111', 'ankit@ajantagroup.in', '9555749096', 1),
(309, 'Mr Nirmal Kumar Bansal', 11, 'Purchase Executive', '9816046481', 'nirmal.bansal@ambujacement.com', '9816046481', 1),
(310, 'Mr Sanjay Jain', 11, 'Purchase Executive', '01462251909', 'sanjay.jain@ambujacement.com', '0146225190', 0),
(311, 'Mr Radhey Shyam Mundra', 11, 'Manager Procurement', '02939288034', 'radheyshyam.mundra@ambujacement.com', '9001013332', 0),
(314, 'Mr. Dilip Mishra ', 108, 'Purchaser', '01493260202', 'dilip.mishra@kei-ind.com', '9672992331', 1),
(315, 'Mr. Ali Hussain', 94, 'Director', '02947073291', 'ahcorp.udr@gmail.com', '9828186876', 1),
(316, 'Mr. Prashant Choudhary', 54, 'Purchase Executive', '01493516607', 'purchase.chopanki@bkt-tires.com', '1493260116', 1),
(317, 'Sanjay Jain', 7, 'Dy Manager Commercial', '8875024904', 'Jain.Sanjay@adani.com', '8875024904', 1),
(318, 'Mr. Subhash Yadav ', 55, 'Purchase deptt', '01493220075', 'purchase.bhiwadi@bkt-tires.com', '1493220075', 1),
(319, 'Vinod Kumar', 81, 'purchaser', '01412330467', 'vks12.crystal@gmail.com', '9414077213', 1),
(320, 'Mr. A.K. Maheshwari', 50, 'Superintending Engineer(MM)', '07452225013', 'ctppse.mm@gmail.com', '7452225013', 1),
(321, 'Mr. Akant Khanduri', 61, 'Dy. Manager-Purchase', '07442782614', 'AKANT.KHANDURI@CHAMBAL.IN', '7442782614', 1),
(322, 'Gaurav Bisht', 35, 'Procurement', '7535001388', 'gaurav.bisht@jkmail.com', '7535001388', 1),
(324, 'Mr. Satish Sharma', 111, 'Purchaser', '05643276530', 'cfpnadbai786@gmail.com', '5643276530', 1),
(325, 'Mr. Anshul Kumar', 65, 'Sr. Executive-Purchase', '09887555388', 'Anshul.Kumar@carlsberg.asia', '8266921599', 1),
(326, 'Mr. Pradeep Ranka', 26, 'Purchase Executive', '01421325703', 'ramakant.mangal@adityabirla.com', '9887480241', 1),
(330, 'Mr. Probir Ghosh ', 60, 'AVP(Materials)', '01472256601', 'purchase@birlacement.com', '1472256601', 1),
(331, 'Mr. Naveen Kumar', 72, 'Purchaser Manager', '01412331231', 'naveen.jpr@bhavik.com', '9983340275', 1),
(334, 'Mr. SK Pathan', 41, 'Purchase Manager ', '02962257679', 'storebsw@banswarafabrics.com', '9251014350', 1),
(335, 'Mr. Manoj Mittal', 36, 'Sr.Purchase Executive', '02962224213', 'manoj.mittal@lnjb.com', '9982232273', 0),
(336, 'Mr. R/Nilesh Shah', 36, 'Purchase Executive', '02962224213', 'bstores@lnjb.com', '9982232902', 1),
(337, 'Mr. Lokesh', 36, 'Enggineer', '02962224213', 'bmdengg@lnjb.com', '9982534110', 0),
(340, 'Mr. Arun Sharma', 70, 'Sr. Executive-General Purchase', '01493250561', 'arunsharma1@hondacarindia.com', '8800283377', 1),
(341, 'Mr. Dinesh Kumar Sharma', 84, 'Purchase Executive', '014442881542', 'dineshsharma@mail.dabur', '9414431447', 1),
(342, 'Mr. Manoj Dhiman ', 90, 'Purchase Executive ', '8003394752', 'manoj.dhiman@daikinindia.com', '8003394752', 1),
(343, 'Mr. Jitender  Yadav', 79, 'Purchase Executive', '01493518608', 'jitender@jaquar.com', '9887849680', 1),
(344, 'D K Jain', 37, 'DGM Purchase', '01494246070', 'dk.jain@ginniint.com', '8739892031', 1),
(345, 'Virender Singh', 37, 'Purchase', '01494246070', 'Purchase.Denim@ginniint.com', '0941358672', 0),
(346, 'Mr. Hari Prakash Jasaiwal', 77, 'Purchase Executive', '09887516123', 'glpvtpuchase@kajariaceramics.com', '9680449223', 1),
(347, 'Mr. Vijay Deshpande', 67, 'Proprietor', '9820203612', 'hsems20@yahoo.com', '9850035415', 1),
(348, 'Debasish Chakladar', 1, 'Store Encharge', '0800309709', 'debasish.chakladar@vedanta.co.in', '8003097090', 1),
(349, 'Mr. Lalit Trivedi', 106, 'Technical Officer', '9829202913', 'khilrai_udaipur@hotmail.com', '9829202913', 1),
(350, 'Vishnu Sharma', 44, 'Purchaser', '09610019610', 'nbh.pur3@wondercement.com', '9610019610', 1),
(351, 'Punit Singh Gurjar', 44, 'Purchaser', '08003095846', 'punit.gurjar@wondercement.com', '8003095846', 0),
(352, 'Aditya jalan', 12, 'Purchase Executive', '8003093638', 'aditya.jalan@vedanta.co.in', '8003093638', 1),
(354, 'Mahendra Yadav', 16, 'Store Incharge', '9557456262', 'mahendra.yadav2@vedanta.co.in', '9557456262', 1),
(355, 'Ronny Thomas', 17, 'Store Incharge', '8003195347', 'ronny.thomas@vedanta.co.in', '8003195347', 1),
(356, 'Rameshwar Sharma', 18, 'Store Incharge', '01472254464', 'rameshwar.sharma@vedanta.co.in', '1472254464', 1),
(357, 'Khushboo Jain', 71, 'Dy. Manager(Commercial)', '01452691456', 'accounts@wassertechnochem.cm', '1452691456', 1),
(358, 'Mr. Akshay Agarwal ', 113, 'AM-Procurement', '05122221201', 'akshayk.agarwal@rsplgroup.com', '7318214777', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE IF NOT EXISTS `customer_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `name`) VALUES
(1, 'General'),
(2, 'UltraTech'),
(4, 'Vedanta'),
(5, 'LNJ Bhilwara'),
(6, 'Sangam'),
(7, 'Adani'),
(8, 'Shree Cement'),
(9, 'The India Cement'),
(10, 'Shriram Group'),
(11, 'Sutlej Textiles'),
(12, 'Johnson'),
(13, 'JK Laxmi'),
(14, 'Dalmia '),
(15, 'RSPL');

-- --------------------------------------------------------

--
-- Table structure for table `customer_segs`
--

CREATE TABLE IF NOT EXISTS `customer_segs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `customer_segs`
--

INSERT INTO `customer_segs` (`id`, `name`) VALUES
(1, 'Metal & Mines'),
(2, 'Textile'),
(3, 'Cement Industries'),
(4, 'Fertiliser & Chemicals'),
(5, 'Automobile & Ancillary Units'),
(6, 'Food & Beverages'),
(7, 'Others'),
(8, 'Power Plants'),
(9, 'Other Government Departments'),
(10, 'OEM Customers'),
(11, 'Detergent'),
(12, 'Oil And Refinery'),
(13, 'Cables');

-- --------------------------------------------------------

--
-- Table structure for table `debit_notes`
--

CREATE TABLE IF NOT EXISTS `debit_notes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `voucher_no` varchar(10) NOT NULL,
  `created_on` date NOT NULL,
  `transaction_date` date NOT NULL,
  `sales_acc_id` int(10) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `party_id` int(10) NOT NULL,
  `narration` text NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `edited_by` int(10) NOT NULL,
  `edited_on` date NOT NULL,
  `cheque_no` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`) VALUES
(1, 'Sales & Marketing'),
(2, 'Finance And Accounts'),
(3, 'Purchases'),
(5, 'Service Department'),
(6, 'HR & Administration'),
(8, 'Logistics');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE IF NOT EXISTS `designations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `name`) VALUES
(1, 'Sales Executive'),
(2, 'Commercial Executive'),
(3, 'Purchase Executive'),
(4, 'Office Assistant'),
(5, 'Chairman'),
(6, 'Director'),
(8, 'Workshop Supervisor'),
(10, 'Dy. Sales Manager'),
(11, 'Asst. Sales Manager'),
(12, 'Accounts Executive');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE IF NOT EXISTS `districts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `state`, `district`) VALUES
(1, 'Rajasthan', 'Udaipur'),
(2, 'Rajasthan', 'Chittorgarh'),
(3, 'Rajasthan', 'Beawer'),
(4, 'Rajasthan', 'Rajsamand'),
(5, 'Rajasthan', 'Bhilwara'),
(6, 'Rajasthan', 'Nimbahera'),
(7, 'Rajasthan', 'Sirohi'),
(8, 'Gujrat', 'Ahmedabad'),
(9, 'Chattisgarh', 'Raipur'),
(10, 'MP', 'Neemuch'),
(11, 'Rajasthan', 'Bikaner'),
(12, 'Rajasthan', 'Barmer'),
(13, 'Rajasthan', 'Kota'),
(14, 'Rajasthan', 'Jaipur'),
(15, 'Rajasthan', 'Jodhpur'),
(16, 'Rajasthan', 'Pali'),
(17, 'Rajasthan', 'Banswara'),
(18, 'Rajasthan', 'Ajmer'),
(19, 'Rajasthan', 'Baran'),
(20, 'Rajasthan', 'Bharatpur'),
(21, 'Rajasthan', 'Bundi'),
(22, 'Rajasthan', 'Churu'),
(23, 'Rajasthan', 'Dausa'),
(24, 'Rajasthan', 'Dholpur'),
(25, 'Rajasthan', 'Dungarpur'),
(26, 'Rajasthan', 'Ganganagar'),
(27, 'Rajasthan', 'Hanumangarh'),
(28, 'Rajasthan', 'Jaisalmer'),
(29, 'Rajasthan', 'Jalor'),
(30, 'Rajasthan', 'Jhalawar'),
(31, 'Rajasthan', 'Jhujhunu'),
(32, 'Rajasthan', 'Karauli'),
(33, 'Rajasthan', 'Nagaur'),
(34, 'Rajasthan', 'Sawai Madhopur'),
(35, 'Rajasthan', 'Sikar'),
(36, 'Rajasthan', 'Tonk'),
(37, 'Uttrakhand', 'Haridwar'),
(38, 'Gujrat', 'Kutch'),
(39, 'Punjab', 'Bathinda'),
(40, 'Maharastra', 'Chandrapur'),
(41, 'Haryana', 'Panipat'),
(42, 'Ra', 'Alwar'),
(43, 'Maharashtra', 'Mumbai'),
(44, 'Haryana', 'Rewari'),
(45, 'New Delhi', 'Delhi'),
(46, 'Uttar Pradesh', 'Kanpur'),
(47, 'Madhya Pradesh', 'Bhopal'),
(48, 'Madhya Pradesh', 'Morena');

-- --------------------------------------------------------

--
-- Table structure for table `email_records`
--

CREATE TABLE IF NOT EXISTS `email_records` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) NOT NULL,
  `send_to` varchar(500) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sex` varchar(6) NOT NULL,
  `dipartment_id` int(10) NOT NULL,
  `designation_id` int(5) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `signature` varchar(100) NOT NULL,
  `account_no` varchar(20) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `ifsc_code` varchar(11) NOT NULL,
  `permanent_address` text NOT NULL,
  `residence_address` text NOT NULL,
  `phone_no` varchar(12) NOT NULL,
  `dob` date NOT NULL,
  `marital_status` varchar(10) NOT NULL,
  `date_of_anniversary` date NOT NULL,
  `spouse_name` varchar(40) NOT NULL,
  `children` int(11) NOT NULL,
  `spouse_working` varchar(3) NOT NULL,
  `qualification` varchar(40) NOT NULL,
  `last_company` varchar(50) NOT NULL,
  `join_date` date NOT NULL,
  `permanent_join_date` date NOT NULL,
  `blood_group` varchar(4) NOT NULL,
  `account_category_id` int(10) NOT NULL,
  `account_group_id` int(10) NOT NULL,
  `account_first_subgroup_id` int(10) NOT NULL,
  `account_second_subgroup_id` int(10) NOT NULL,
  `ledger_account_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `sex`, `dipartment_id`, `designation_id`, `mobile`, `email`, `signature`, `account_no`, `bank_name`, `branch_name`, `ifsc_code`, `permanent_address`, `residence_address`, `phone_no`, `dob`, `marital_status`, `date_of_anniversary`, `spouse_name`, `children`, `spouse_working`, `qualification`, `last_company`, `join_date`, `permanent_join_date`, `blood_group`, `account_category_id`, `account_group_id`, `account_first_subgroup_id`, `account_second_subgroup_id`, `ledger_account_id`) VALUES
(4, 'Jagdish Salvi', 'Male', 1, 1, '9983247774', 'jagdish@mogragroup.com', '58b3ddec698e8.png', '61333933354', 'SBBJ', 'Shobhagpura', 'SBBJ0011485', 'Tulsi Ram Salvi,\r\nHouse No. 77, B Block, Sector 9,\r\nSavina , Udaipur 313001 ( Raj )', 'R C Gehlot, \r\nHouse No. 20/21, Behind Mahadev Properties, Gokul Village, Sector 9,\r\nSavina , Udaipur 313001 ( Raj )', '7300277882', '1980-10-07', 'Married', '2008-02-23', 'Lalita Salvi', 2, 'Yes', 'B Sc.', 'Manikaran Enterprises', '2016-08-24', '2016-09-24', 'A+', 1, 2, 7, 10, 22),
(7, 'Harshit Patel', 'Male', 1, 1, '9772404777', 'harshit@mogragroup.com', '58b3e05583253.png', '394002010065687', 'Union Bank Of India', 'Fatehpura', 'UBIN0539406', '25, vrandavan vihar, hiran magri sec-3 udaipur', '25, vrandavan vihar, hiran magri sec-3 udaipur', '', '1983-07-11', 'Married', '2007-11-21', 'laxita patel', 1, 'Yes', 'B.Com, MCSA, MCSE, CCNA', 'Dani Shares and Stock Brokers Pvt Ltd', '2014-01-27', '2014-01-27', '', 1, 2, 7, 10, 30),
(8, 'Jitendra Singh Jhala', 'Male', 2, 2, '9785177828', 'dispatch@mogragroup.com', '58b3ef21c6926.png', '394002010066287', 'Union Bank Of India', 'Fatehpura', 'UBIN0539406', '11, Ganpati Nagar A, Near Bohra Ganesh ji Temple, Sunderwas, Udaipur', '11, Ganpati Nagar A, Near Bohra Ganesh ji Temple, Sunderwas, Udaipur', '', '1985-01-05', 'Married', '2012-02-10', 'Asha Ranawat', 1, 'Yes', 'M.A., M.Sc., M.B.A.', 'Lakecity Infraproject Pvt. Ltd.,', '2014-08-19', '2015-02-20', 'O+', 1, 2, 7, 10, 31),
(9, 'Usha Mali', 'Female', 3, 3, '9166228856', 'purchase@mogragroup.com', '58da2f9de548e.png', '51111161500', 'SBBJ ', 'Madri ', 'SBBJ0010415', 'H.N. 114 UIT Colony Kanpur Madri .Udaipur  ', 'H.N. 114 UIT Colony Kanpur Madri .Udaipur  ', '0294 2980435', '1992-06-27', 'Single', '1970-01-01', '', 0, '', 'XII', 'AGHQ ', '2015-07-15', '2016-01-15', 'B+', 1, 2, 7, 10, 32),
(10, 'Priya Mogra', 'Female', 6, 6, '9772704888', 'priya@mogragroup.com', '58ba9813e90c8.png', '1234556', 'UCO Bank', 'Ambamata', 'UCO12345', '560, OTC Scheme, \r\nAmbamata,\r\nUdaipur', '560, OTC Scheme,\r\nAmbamata\r\nUdaipur', '', '1981-11-08', 'Married', '2007-04-20', 'Anshul Mogra', 1, 'Yes', 'MCA', '', '2007-11-01', '1970-01-01', 'A-', 2, 6, 8, 11, 42),
(11, 'Pushpendra Nath Chauhan', 'Male', 1, 10, '9672994770', 'pushpendra@mogragroup.com', '58bd0c2f3fb02.png', '394002010064093', 'Union Bank Of India', 'New Fatehpura Udaipur', 'UBIN0539406', 'T 62 Tilak Nagar Hiran Mangri Sector 3 Udaipur', 'T 62 Tilak Nagar Hiran Mangri Sector 3 Udaipur', '8696029999', '1984-12-21', 'Married', '2010-11-23', 'Mrs. Kavita Kanwar', 1, 'No', 'MBA (MKTG & HR)', 'Bhatnagar Engineers', '2010-10-20', '2010-10-20', 'O+', 1, 2, 7, 10, 44),
(12, 'Vikram Singh ', 'Male', 1, 1, '8426932094', 'vikram@mogragroup.com', '58df6633240bc.png', '61333933354', 'SBBJ', 'Shobhagpura', 'SBBJ0011485', 'Bhanwar Singh \r\nVillage PO Basantgarh\r\nTehsil -Pindwara\r\nDist. Sirohi', 'C/O Bhagwat Singh\r\nMeera Nagar\r\nbehind Ambience Hotel\r\nUdaipur', '9828232546', '1994-03-30', 'Single', '1970-01-01', '', 0, '', 'B.Tech ( Mech.)', 'Fresher', '2017-02-27', '2017-08-28', 'A+', 1, 2, 7, 10, 45),
(13, 'Bhopal Singh Jhala', 'Male', 8, 8, '9828447774', 'works@mogragroup.com', '58bd262745e4d.png', '394002010064416', 'Union Bank Of India', 'New Fatehpura', 'UBIN0539406', 'Narayan Singh Jhala\r\nVillage-Talavada\r\nPO -Bilot Teh -Dungla\r\nDist. Chittorgarh', 'C/O Ramesh Jain\r\nH.N. 159 Vivek Nagar\r\nSector no 3\r\nUdaipur', '9828447774', '1980-01-16', 'Married', '2007-03-12', 'Jaya kunwer jhala', 1, 'Yes', 'B.A.', 'Shilpa Trade Links', '2011-11-21', '2012-05-15', 'A+', 1, 2, 7, 10, 46),
(14, 'Reena Khandelwal', 'Female', 6, 4, '9649965452', 'info@mogragroup.com', '58be59bdf2895.docx', '394002100066517', 'Union Bank', 'New Fatehpura', 'UBIN0539406', 'C/o N.K.Gupta , 13-B Kanta Niwas, Snatosh Nagar , Street  No-7,Gariyawas, Udaipur', 'C/o N.K.Gupta , 13-B Kanta Niwas, Snatosh Nagar , Street  No-7,Gariyawas, Udaipur', '9649965452', '1979-01-31', 'Married', '1970-01-01', 'Gopal Khandelwal', 2, 'Yes', 'MA ', 'Phosphate India Pvt.Ltd', '2015-01-16', '2015-07-16', 'B+', 1, 2, 7, 10, 52),
(15, 'Mohammed Arif', 'Male', 1, 11, '9649004777', 'arif@mogragroup.com', '58c397efb67fe.jpg', '310102010457570', 'Union Bank Of India', 'Town Hall', 'UBIN0531014', '15/3 Opposite Matlob Masjid, Rajput Colony, \r\n62 futta road Saharanpur UP', 'Opposite soni general Store, Ganesh nagaer\r\npayda University Road, Udaipur raj', '', '1987-09-17', 'Married', '2014-10-27', 'Bushra Arif', 1, 'No', 'B.Sc and PGDBM', 'Kirloskar', '2011-11-16', '2012-04-02', 'B-', 1, 2, 7, 10, 70),
(16, 'Anshul Mogra', 'Male', 6, 6, '9772704777', 'anshul@mogragroup.com', '58c684d0aa77c.png', '001410091506700', 'IDBI', 'Udaipur', 'IDBI', '560, OTC Scheme,\r\nAmbamata,\r\nUdaipur', '560, OTC Scheme,\r\nAmbamata,\r\nUdaipur', '0294 2980435', '1977-05-23', 'Married', '2007-04-20', 'Priya Mogra', 1, 'Yes', 'CA', 'Danube Building ', '2008-11-12', '2008-11-12', 'B+', 2, 6, 8, 11, 75);

-- --------------------------------------------------------

--
-- Table structure for table `employee_companies`
--

CREATE TABLE IF NOT EXISTS `employee_companies` (
  `employee_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`employee_id`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_companies`
--

INSERT INTO `employee_companies` (`employee_id`, `company_id`) VALUES
(4, 25),
(4, 26),
(4, 27),
(7, 25),
(8, 25),
(8, 26),
(8, 27),
(9, 25),
(9, 26),
(9, 27),
(10, 25),
(10, 26),
(10, 27),
(11, 25),
(11, 26),
(11, 27),
(12, 25),
(12, 26),
(12, 27),
(13, 25),
(13, 26),
(13, 27),
(14, 25),
(14, 26),
(14, 27),
(15, 25),
(15, 26),
(15, 27),
(16, 25),
(16, 26),
(16, 27);

-- --------------------------------------------------------

--
-- Table structure for table `employee_contact_persons`
--

CREATE TABLE IF NOT EXISTS `employee_contact_persons` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `landline` varchar(15) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `relation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=91 ;

--
-- Dumping data for table `employee_contact_persons`
--

INSERT INTO `employee_contact_persons` (`id`, `employee_id`, `name`, `mobile`, `landline`, `email`, `relation`) VALUES
(1, 2, 'VIjay', '9983247774', '9983247774', 'vijay@mogragroup.com', 'Freinds'),
(2, 2, 'Harshit', '9983257774', '9983257774', 'harshit@mogragroup.com', 'Freinds'),
(7, 5, 'Dharma Prakash Chasta', '9785701991', '9785701991', 'dsgaur@gmail.com', 'Freinds'),
(8, 5, 'Vinay Taly', '7877858880', '7877858880', 'vinay_taly@yahoo.co.in', 'Freinds'),
(11, 6, 'Satish Patel', '9950999240', NULL, 'hpharsh0@gmail.com', 'Father'),
(12, 6, 'Harshit Patel', '9950278209', NULL, 'hpharsh0@gmail.com', 'Self'),
(51, 13, 'Pushpendra Nath Chauhan', '9672994770', '9672994770', 'pushpendrac08@gmail.com', 'Brother Inlow'),
(52, 13, 'Jagdish Salvi', '7300277882', '7300277882', 'jagdishsalvi1980@gmail.com', 'Freind'),
(53, 14, 'Gopal Khnadelwal', '9782056114', '9782056114', 'khureenabik@gmail.com', 'Husband'),
(54, 14, 'Ramesh Chandra Gupta', '9214404463', '9214404463', 'khureenabik@gmail.com', 'Father'),
(55, 7, 'Satish Patel', '9950999240', '', 'hpharsh0@gmail.com', 'Father'),
(56, 7, 'Satish Patel', '9950999240', '', 'hpharsh0@gmail.com', 'Father'),
(57, 4, 'Dharam Prakash Chasta', '9460726671', '9460726671', 'dharam@gmail.com', 'Friend'),
(58, 4, 'Vinay Tali', '7877858880', '7877858880', 'Vinay@gmail.com', 'Friend'),
(61, 15, 'Bushra', '7895925857', '', 'bushraarif23@gmail.com', 'Wife'),
(62, 15, 'Ankit Jain', '9828877772', '', 'jain.ankit0002@yahoo.in', 'Friend'),
(67, 11, 'Mr. B S Jhala', '9828447774', '9828447774', 'bhopalsingh.jhala@yahoo.com', 'Brother'),
(68, 11, 'Mr.  Mhmd. Arif', '9649004777', '9649004777', 'arif@mogragroup.com', 'Brother'),
(73, 16, 'K S Mogra', '9829042326', '2431510', 'ksmogra@mogragroup.com', 'Father'),
(74, 16, 'Priya Mogra', '9772704777', '2431510', 'priya@mogragroup.com', 'Wife'),
(75, 8, 'Bhopal Singh Jhala', '9460509987', '', 'bhopal@gmail.com', 'Father'),
(76, 8, 'Asha Ranawat', '9783376214', '', 'asharanawatldc@gmail.com', 'Wife'),
(79, 10, 'Anshul Mogra', '9772704777', '2431510', 'anshul@mogragroup.com', 'Husband'),
(80, 10, 'KS Mogra', '9829042326', '123', 'ksmogra@mogragroup.com', 'Father'),
(83, 9, 'Roop Lal JI ', '9610602013', '9610602013', 'rlj@gmail.com', 'Father '),
(84, 9, 'Satish ', '8003993600', '9460890164', 'satish@gmail.com', 'Friend '),
(89, 12, 'Bhagwat Singh', '9828232546', '9828232546', 'bsinghrana@gmail.com', 'Brother'),
(90, 12, 'Rajveer Singh', '7665510559', '7665510559', 'rajveer.rr497@gmail.com', 'Brother');

-- --------------------------------------------------------

--
-- Table structure for table `filenames`
--

CREATE TABLE IF NOT EXISTS `filenames` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `file1` varchar(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `file2` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=103 ;

--
-- Dumping data for table `filenames`
--

INSERT INTO `filenames` (`id`, `file1`, `customer_id`, `file2`) VALUES
(1, 'BE', 1, 3251),
(2, 'BE', 4, 3239),
(3, 'BE', 2, 3236),
(4, 'BE', 3, 2613),
(5, 'BE', 5, 3127),
(6, 'BE', 6, 2227),
(7, 'BE', 7, 3147),
(8, 'BE', 8, 2932),
(9, 'BE', 9, 3360),
(10, 'BE', 10, 3346),
(11, 'BE', 11, 2971),
(12, 'BE', 11, 3085),
(13, 'BE', 32, 3008),
(14, 'BE', 35, 3325),
(15, 'BE', 37, 3049),
(16, 'BE', 36, 2681),
(18, 'BE', 19, 2986),
(19, 'BE', 55, 2839),
(20, 'BE', 81, 3258),
(21, 'BE', 12, 3156),
(22, 'BE', 1, 3146),
(23, 'BE', 0, 3254),
(24, 'BE', 22, 2827),
(25, 'BE', 30, 3241),
(26, 'BE', 26, 2720),
(27, 'BE', 1, 2879),
(28, 'BE', 0, 2345),
(30, 'BE', 86, 3331),
(32, 'BE', 52, 3332),
(33, 'BE', 88, 3333),
(34, 'BE', 18, 3334),
(35, 'BE', 76, 3335),
(36, 'BE', 56, 3336),
(37, 'BE', 2, 3337),
(38, 'BE', 60, 3338),
(39, 'BE', 85, 3339),
(40, 'BE', 36, 2919),
(41, 'BE', 5, 2977),
(42, 'BE', 40, 3250),
(43, 'BE', 4, 3371),
(44, 'BE', 1, 3361),
(45, 'BE', 33, 3362),
(46, 'BE', 93, 3247),
(47, 'BE', 31, 3240),
(48, 'BE', 29, 3368),
(49, 'BE', 64, 3296),
(50, 'BE', 53, 2454),
(51, 'BE', 94, 3065),
(52, 'BE', 32, 2959),
(53, 'BE', 65, 2748),
(54, 'BE', 70, 3255),
(55, 'BE', 74, 3272),
(56, 'BE', 74, 2809),
(57, 'BE', 59, 3148),
(58, 'DC', 30, 1),
(60, 'BE', 15, 3311),
(61, 'DC', 47, 2),
(62, 'BE', 15, 3212),
(63, 'DC', 95, 3),
(64, 'DC', 86, 4),
(65, 'DC', 97, 5),
(66, 'DC', 96, 6),
(67, 'BE', 77, 3186),
(68, 'BE', 43, 3145),
(69, 'DC', 43, 7),
(70, 'BE', 12, 3140),
(71, 'BE', 53, 3342),
(72, 'BE', 65, 3345),
(73, 'BE', 51, 3353),
(74, 'BE', 52, 3352),
(75, 'BE', 84, 3355),
(76, 'BE', 45, 3356),
(77, 'BE', 15, 3363),
(78, 'BE', 11, 3364),
(79, 'BE', 91, 3365),
(80, 'BE', 45, 3366),
(81, 'BE', 56, 3367),
(82, 'BE', 96, 3372),
(83, 'BE', 12, 3359),
(84, 'BE', 18, 3079),
(85, 'BE', 109, 3354),
(86, 'BE', 108, 3348),
(87, 'DC', 32, 8),
(88, 'BE', 66, 3320),
(89, 'BE', 18, 3249),
(90, 'DC', 61, 9),
(91, 'BE', 70, 3226),
(92, 'BE', 110, 3031),
(93, 'BE', 29, 3064),
(94, 'BE', 80, 3107),
(95, 'BE', 111, 3291),
(96, 'DC', 44, 10),
(98, 'DC', 38, 12),
(99, 'BE', 112, 3194),
(100, 'DC', 57, 13),
(101, 'BE', 107, 2502),
(102, 'BE', 101, 2877);

-- --------------------------------------------------------

--
-- Table structure for table `financial_months`
--

CREATE TABLE IF NOT EXISTS `financial_months` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `financial_year_id` int(10) NOT NULL,
  `month` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=106 ;

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
(78, 18, '03-2017', 'Open'),
(79, 19, '04-2016', 'Open'),
(80, 19, '05-2016', 'Open'),
(81, 19, '06-2016', 'Open'),
(82, 19, '07-2016', 'Open'),
(83, 19, '08-2016', 'Open'),
(84, 19, '09-2016', 'Open'),
(85, 19, '10-2016', 'Open'),
(86, 19, '11-2016', 'Open'),
(88, 19, '12-2016', 'Open'),
(90, 19, '01-2017', 'Open'),
(91, 19, '02-2017', 'Open'),
(92, 19, '03-2017', 'Open'),
(93, 20, '04-2016', 'Open'),
(94, 20, '05-2016', 'Open'),
(95, 20, '06-2016', 'Open'),
(96, 20, '07-2016', 'Open'),
(97, 20, '08-2016', 'Open'),
(98, 20, '09-2016', 'Open'),
(99, 20, '10-2016', 'Open'),
(100, 20, '11-2016', 'Open'),
(101, 20, '12-2016', 'Open'),
(102, 20, '01-2017', 'Open'),
(103, 20, '02-2017', 'Open'),
(104, 20, '03-2017', 'Open'),
(105, 21, '03-2017', 'Open');

-- --------------------------------------------------------

--
-- Table structure for table `financial_years`
--

CREATE TABLE IF NOT EXISTS `financial_years` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `financial_years`
--

INSERT INTO `financial_years` (`id`, `date_from`, `date_to`, `status`, `company_id`) VALUES
(1, '2017-04-01', '2018-03-31', 'Open', 25),
(16, '2015-04-01', '2016-03-31', 'Closed', 25),
(18, '2016-04-01', '2017-03-31', 'Open', 25),
(19, '2017-04-01', '2018-03-31', 'Open', 26),
(20, '2017-04-01', '2018-03-31', 'Open', 27),
(21, '2016-04-01', '2017-03-31', 'Open', 27);

-- --------------------------------------------------------

--
-- Table structure for table `grns`
--

CREATE TABLE IF NOT EXISTS `grns` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(10) NOT NULL,
  `date_created` date NOT NULL,
  `purchase_order_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  `grn1` varchar(10) NOT NULL,
  `grn2` varchar(10) NOT NULL,
  `grn3` varchar(10) NOT NULL,
  `grn4` varchar(10) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Pending',
  `created_by` int(10) NOT NULL,
  `road_permit_no` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `grn_rows`
--

CREATE TABLE IF NOT EXISTS `grn_rows` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `grn_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `quantity` int(5) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_vouchers`
--

CREATE TABLE IF NOT EXISTS `inventory_vouchers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) NOT NULL,
  `iv_number` varchar(10) NOT NULL,
  `created_by` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Incomplete',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_voucher_rows`
--

CREATE TABLE IF NOT EXISTS `inventory_voucher_rows` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inventory_voucher_id` int(10) NOT NULL,
  `invoice_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `left_item_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `temp_limit` decimal(10,2) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `customer_address` text NOT NULL,
  `lr_no` varchar(255) NOT NULL,
  `terms_conditions` text NOT NULL,
  `discount_type` tinyint(1) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `pnf` decimal(10,2) NOT NULL,
  `pnf_type` tinyint(1) NOT NULL,
  `pnf_per` decimal(4,2) NOT NULL,
  `total_after_pnf` decimal(15,2) NOT NULL,
  `sale_tax_per` decimal(4,2) NOT NULL,
  `sale_tax_id` int(10) NOT NULL,
  `sale_tax_amount` decimal(15,2) NOT NULL,
  `exceise_duty` decimal(10,2) NOT NULL,
  `ed_description` varchar(255) NOT NULL,
  `fright_amount` decimal(8,2) NOT NULL,
  `fright_text` varchar(255) NOT NULL,
  `grand_total` decimal(18,2) NOT NULL,
  `due_payment` decimal(18,2) NOT NULL,
  `date_created` date NOT NULL,
  `company_id` int(10) NOT NULL,
  `process_status` varchar(30) NOT NULL,
  `sales_order_id` int(10) NOT NULL,
  `in1` varchar(10) NOT NULL,
  `in2` int(10) NOT NULL,
  `in4` varchar(10) NOT NULL,
  `in3` varchar(10) NOT NULL,
  `customer_po_no` varchar(100) NOT NULL,
  `po_date` date NOT NULL,
  `additional_note` varchar(255) NOT NULL,
  `employee_id` int(10) NOT NULL,
  `created_by` int(11) NOT NULL,
  `transporter_id` int(10) NOT NULL,
  `discount_per` decimal(4,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `form47` varchar(100) NOT NULL,
  `form49` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  `inventory_voucher_status` varchar(20) NOT NULL,
  `payment_mode` varchar(20) NOT NULL,
  `fright_ledger_account` int(10) NOT NULL,
  `sales_ledger_account` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_bookings`
--

CREATE TABLE IF NOT EXISTS `invoice_bookings` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `grn_id` int(10) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `created_on` date NOT NULL,
  `company_id` int(10) NOT NULL,
  `created_by` int(10) NOT NULL,
  `ib1` varchar(10) NOT NULL,
  `ib2` varchar(10) NOT NULL,
  `ib3` varchar(10) NOT NULL,
  `ib4` varchar(10) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `due_payment` decimal(15,2) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `supplier_date` date NOT NULL,
  `purchase_ledger_account` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_booking_rows`
--

CREATE TABLE IF NOT EXISTS `invoice_booking_rows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_booking_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `unit_rate_from_po` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) NOT NULL,
  `pnf` decimal(15,2) NOT NULL,
  `excise_duty` decimal(15,2) NOT NULL,
  `sale_tax` decimal(15,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `rate` decimal(15,2) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_breakups`
--

CREATE TABLE IF NOT EXISTS `invoice_breakups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) NOT NULL,
  `receipt_voucher_id` int(10) NOT NULL,
  `receipt_amount` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_rows`
--

CREATE TABLE IF NOT EXISTS `invoice_rows` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `rate` decimal(15,2) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `height` int(3) NOT NULL,
  `inventory_voucher_status` varchar(10) NOT NULL DEFAULT 'Pending',
  `item_serial_number` varchar(100) NOT NULL,
  `inventory_voucher_applicable` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `item_category_id` int(10) NOT NULL,
  `item_group_id` int(10) NOT NULL,
  `item_sub_group_id` varchar(100) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `ob_quantity` int(5) NOT NULL,
  `ob_rate` decimal(14,8) NOT NULL,
  `ob_value` decimal(20,8) NOT NULL,
  `freeze` tinyint(1) NOT NULL,
  `serial_number_enable` int(1) NOT NULL,
  `source` varchar(30) NOT NULL,
  `minimum_quantity` int(10) NOT NULL,
  `maximum_quantity` int(10) NOT NULL,
  `dynamic_cost` decimal(10,2) NOT NULL,
  `minimum_selling_price_factor` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1004 ;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `alias`, `item_category_id`, `item_group_id`, `item_sub_group_id`, `unit_id`, `ob_quantity`, `ob_rate`, `ob_value`, `freeze`, `serial_number_enable`, `source`, `minimum_quantity`, `maximum_quantity`, `dynamic_cost`, `minimum_selling_price_factor`) VALUES
(556, '0.5 HP / 1500 RPM REMI', 'A', 3, 8, '5', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(557, '1 HP / 1500 RPM REMI', '', 3, 8, '5', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(558, '1.50 HP / 1500 RPM REMI', '', 3, 8, '5', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(559, '2 HP / 1500 RPM REMI', '', 3, 8, '5', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(560, '3 HP / 1500 RPM REMI', '', 3, 8, '5', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(561, '5 HP / 1500 RPM REMI', '', 3, 8, '5', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(562, '7.50 HP / 1500 RPM REMI', '', 3, 8, '5', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(563, '10 HP / 1500 RPM REMI', '', 3, 8, '5', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(564, '12.50 HP / 1500 RPM REMI', '', 3, 8, '5', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(565, '20 HP / 1500 RPM REMI', '', 3, 8, '5', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(566, '1 HP / 3000 RPM REMI', '', 3, 8, '5', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(567, '1.50 HP / 3000 RPM REMI', '', 3, 8, '5', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(568, '2 HP / 3000 RPM REMI', '', 3, 8, '5', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(569, '3 HP / 3000 RPM REMI', '', 3, 8, '5', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(570, '5 HP / 3000 RPM REMI', '', 3, 8, '5', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(571, '7.50 HP / 3000 RPM REMI', '', 3, 8, '5', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(572, '10 HP / 3000 RPM REMI', '', 3, 8, '5', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(573, '12.50 HP / 3000 RPM REMI', '', 3, 8, '5', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(574, '20 HP / 3000 RPM REMI', '', 3, 8, '5', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(575, '15 HP / 3000 RPM REMI', '', 3, 8, '5', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(576, '2 HP / 32 RPM Geared Motor', '', 3, 8, '7', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(577, '1 HP / 1500 RPM BBL', '', 3, 7, '4', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(578, '1.50 HP / 1500 RPM BBL', '', 3, 7, '4', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(579, '2 HP / 1500 RPM BBL', '', 3, 7, '4', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(580, '3 HP / 1500 RPM BBL', '', 3, 7, '4', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(581, '5 HP / 1500 RPM BBL', '', 3, 7, '4', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(582, '7.50 HP / 1500 RPM BBL', '', 3, 7, '4', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(583, '10 HP / 1500 RPM BBL', '', 3, 7, '4', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(584, '12.50 HP / 1500 RPM BBL', '', 3, 7, '4', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(585, '20 HP / 1500 RPM BBL', '', 3, 7, '4', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(586, '1 HP / 3000 RPM BBL', '', 3, 7, '4', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(587, '1.50 HP / 3000 RPM BBL', '', 3, 7, '4', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(588, '2 HP / 3000 RPM BBL', '', 3, 7, '4', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(589, '3 HP / 3000 RPM BBL', '', 3, 7, '4', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(590, '5 HP / 3000 RPM BBL', '', 3, 7, '4', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(591, '7.50 HP / 3000 RPM BBL', '', 3, 7, '4', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(592, '10 HP / 3000 RPM BBL', '', 3, 7, '4', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(593, '12.50 HP / 3000 RPM BBL', '', 3, 7, '4', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(594, '20 HP / 3000 RPM BBL', '', 3, 7, '4', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(595, '15 HP / 3000 RPM BBL', '', 3, 7, '4', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(596, '3 HP / 3000 RPM FLP CGL', '', 3, 14, '57', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(597, '60 HP / 1500 RPM BBL', '', 3, 7, '4', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(598, '1 HP / 1500 RPM CGL Single Phase', '', 3, 14, '58', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(599, 'RT 15 Gear Pump', '', 1, 22, '20', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(600, 'RT 40 Gear Pump', '', 1, 22, '20', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 5, 10, '0.00', '0.00'),
(601, 'RT 80 Gear Pump', '', 1, 22, '20', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 5, 10, '0.00', '0.00'),
(602, 'RT 125/32 Gear Pump', '', 1, 22, '20', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(603, 'RT 125/50 Gear Pump', '', 1, 22, '20', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(604, 'RT 20 Gear Pump', '', 1, 22, '20', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 5, 10, '0.00', '0.00'),
(605, 'R 20 DG Gear Pump', '', 1, 22, '20', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(606, 'T3 S 45 Pump', 'T3 S 45 Pump', 1, 2, '8', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(607, 'T3 S 38 Pump', '', 1, 22, '8', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(608, 'T3 S 52 Pump', '', 1, 22, '8', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '122400.00', '0.00'),
(609, 'T3 S 60 Pump', '', 1, 22, '8', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(610, 'T3 S 80 Pump', '', 1, 22, '8', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(611, 'T3 S 90 Pump', '', 1, 22, '8', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(612, 'Mechanical Seal T3 S 45', 'Mechanical Seal T3 S 45', 6, 15, '17', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(613, 'Mechanical Seal T3 S 38', '', 6, 15, '17', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(614, 'Mechanical Seal T3 S 52', '', 6, 15, '17', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(615, 'Mechanical Seal T3 S 60', '', 6, 15, '17', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(616, 'Mechanical Seal T3 S 80', '', 6, 15, '17', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(617, 'Mechanical Seal T3 S 90', '', 6, 15, '17', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(618, 'T3 SFP 40/38', '', 1, 22, '8', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(619, 'T3 SFP 40/46', '', 1, 22, '8', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(620, 'T3 SFP 20/46', '', 1, 22, '8', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(621, 'Mechanical Seal T3 SFP', 'Mechanical Seal T3 SFP', 6, 15, '17', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(622, 'T1 S 25.1', '', 1, 22, '10', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(623, 'T1 S 50.1', '', 1, 22, '10', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(624, 'T1 S 380.1', '', 1, 22, '10', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(625, 'T3 SA 38/46 JOP', '', 1, 22, '8', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(626, 'IMO Pump', '', 1, 22, '8', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(627, 'R 50 SL ', '', 1, 22, '56', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(628, 'R 100 SL ', '', 1, 22, '56', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(629, 'TRF 660 Pump', '', 1, 22, '8', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(630, 'TRF 1700 Pump', '', 1, 22, '8', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(631, 'TRF 2500 Pump', '', 1, 22, '8', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(632, 'TRF 1300 Pump', '', 1, 22, '8', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(633, 'TRF 660 Sealkit', '', 6, 15, '17', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(634, 'TRF 1700 Sealkit', '', 6, 15, '17', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(635, 'TRF 2500 Sealkit', '', 6, 15, '17', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(636, 'TRF 1300 Sealkit', '', 6, 15, '17', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(637, 'T 2003 H Pump', '', 1, 4, '53', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(638, 'T 2504 Pump', '', 1, 4, '53', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(639, 'T 1503 H Pump', '', 1, 4, '53', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(640, 'J 102 SP', '', 1, 4, '53', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(641, 'J 103', '', 1, 4, '53', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(642, 'J 52', '', 1, 4, '53', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(643, 'J 32', '', 1, 4, '53', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(644, 'J 33', '', 1, 4, '53', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(645, 'WW 101', '', 1, 4, '52', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(646, 'WW 151', '', 1, 4, '52', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(647, 'WV 01 L/40', '', 1, 4, '52', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(648, 'HE 130 CT', '', 1, 5, '60', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(649, 'NSRP 50 Pump Semi Open Impeller', '', 1, 5, '60', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(650, 'NSRP 50 Pump Closed Impeller', '', 1, 5, '60', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(651, 'NZ 25 125 Pump Closed Impeller', '', 1, 5, '59', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(652, 'NZ 32 125 Pump Closed Impeller', '', 1, 5, '59', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(653, 'NZ 50 125 Pump Closed Impeller', '', 1, 5, '59', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(654, 'NZ 25 160 Pump Closed Impeller', '', 1, 5, '59', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(655, 'NZ 32 160 Pump Closed Impeller', '', 1, 5, '59', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(656, 'NZ 50 160 Pump Closed Impeller', '', 1, 5, '59', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(657, 'NZ 25 160 Pump Closed Impeller', '', 1, 5, '59', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(658, 'NZ 50 200 Pump Closed Impeller', '', 1, 5, '59', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(659, 'NZ 25 125 Pump Semi Open Impeller', '', 1, 5, '59', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(660, 'NZ 32 125 Pump Semi Open Impeller', '', 1, 5, '59', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(661, 'NZ 50 125 Pump Semi Open Impeller', '', 1, 5, '59', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(662, 'NZ 25 160 Pump Semi Open Impeller', '', 1, 5, '59', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(663, 'NZ 32 160 Pump Semi Open Impeller', '', 1, 5, '59', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(664, 'NZ 50 160 Pump Semi Open Impeller', '', 1, 5, '59', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(665, 'NZ 25 160 Pump Semi Open Impeller', '', 1, 5, '59', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(666, 'NZ 50 200 Pump Semi Open Impeller', '', 1, 5, '59', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(667, 'Mechanical seal 1" Antico', '', 6, 17, '33', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 3, '0.00', '0.00'),
(668, 'Mechanical seal 1.125" Antico', '', 6, 17, '33', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 3, '0.00', '0.00'),
(669, 'Mechanical seal 1.375" Antico', '', 6, 17, '16', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 3, '0.00', '0.00'),
(670, 'Mechanical seal 1.625" Antico', '', 6, 17, '15', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 3, 3, '0.00', '0.00'),
(671, 'Mechanical seal 1.875" Antico', '', 6, 17, '15', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 3, '0.00', '0.00'),
(672, 'Shaft Sleeve Ceramic 1" Antico', '', 6, 17, '33', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 3, '0.00', '0.00'),
(673, 'Shaft Sleeve Ceramic 1.125" Antico', '', 6, 17, '33', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 3, '0.00', '0.00'),
(674, 'Shaft Sleeve Ceramic 1.375" Antico', '', 6, 17, '16', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 3, '0.00', '0.00'),
(675, 'Shaft Sleeve Ceramic 1.625" Antico', '', 6, 17, '15', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 3, 3, '0.00', '0.00'),
(676, 'Shaft Sleeve Ceramic 1.875" Antico', '', 6, 17, '15', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 3, '0.00', '0.00'),
(677, 'KGEN 11 3 G1', 'KGEN 11 3 G1', 1, 1, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 10, 10, '0.00', '0.00'),
(678, 'KGEN 11 3 G6', '', 1, 1, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 10, 10, '0.00', '0.00'),
(679, 'KGEN 11 4 G1', 'KGEN 11 4 G1', 1, 1, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 10, 10, '0.00', '0.00'),
(680, 'KGEN 11 4 G6', '', 1, 1, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 10, 10, '0.00', '0.00'),
(681, 'KGEN 12 5 G1', 'KGEN 12 5 G1', 1, 1, '21', 1, 10, '7498.00000000', '74982.70000000', 0, 1, 'Purchessed', 1, 1, '7498.27', '1.10'),
(682, 'KGEN 12 5 G6', 'KGEN 12 5 G6', 1, 1, '21', 1, 4, '9566.00000000', '38264.00000000', 0, 1, 'Purchessed', 1, 1, '9566.00', '1.10'),
(683, 'KGEN 12b 5 G1', 'KGEN 12b 5 G1', 1, 1, '21', 1, 0, '0.00000000', '0.00000000', 0, 1, 'Purchessed', 0, 0, '0.00', '0.00'),
(684, 'KGEN 16 3 G1', 'KGEN 16 3 G1', 1, 1, '21', 1, 3, '7156.00000000', '21469.50000000', 0, 1, 'Purchessed', 1, 1, '7156.50', '1.10'),
(685, 'KGEN 16 6 G1', 'KGEN 16 6 G1', 1, 1, '21', 1, 12, '10412.00000000', '124945.08000000', 0, 1, 'Purchessed', 1, 1, '10412.09', '1.10'),
(686, 'KGEN 14 8 G1', 'KGEN 14 8 G1', 1, 1, '21', 1, 10, '11155.00000000', '111550.00000000', 0, 1, 'Purchessed', 1, 1, '111155.00', '0.00'),
(687, 'KGEN 15 6 G1', '', 1, 1, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 10, 10, '0.00', '0.00'),
(688, 'KGEN 25n 10 G1', '', 1, 1, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 10, 10, '0.00', '0.00'),
(689, 'KGEN 25n 10 G6', '', 1, 1, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(690, 'KGEN 21 8 G1', 'KGEN 21 8 G1', 1, 1, '21', 1, 2, '29777.00000000', '59554.80000000', 0, 1, 'Purchessed', 1, 1, '29777.40', '1.10'),
(691, 'KGEN 15 6 G6', '', 1, 1, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 3, 3, '0.00', '0.00'),
(692, 'KGEN 12 6 G1', '', 1, 1, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 10, 10, '0.00', '0.00'),
(693, 'CN 25 125 G1 S2 L3', 'CN 25 125 G1 S2 L3', 1, 1, '1', 1, 1, '7160.00000000', '7160.00000000', 0, 1, 'Purchessed', 1, 1, '7160.00', '1.10'),
(694, 'CN 25 160 G1 S2 L3', 'CN 25 160 G1 S2 L3', 1, 1, '1', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(695, 'CN 32 160 G1 S2 L3', 'CN 32 160 G1 S2 L3', 1, 1, '1', 1, 4, '9348.00000000', '37393.72000000', 0, 1, 'Purchessed', 1, 1, '9348.43', '1.10'),
(696, 'CN 40 160 G1 S2 L3', '', 1, 1, '1', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(697, 'CN 50 160 G1 S2 L3', '', 1, 1, '1', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(698, 'CN 65 160 G1 S2 L3', 'CN 65 160 G1 S2 L3', 1, 1, '1', 1, 2, '13554.00000000', '27108.24000000', 0, 1, 'Purchessed', 1, 1, '13554.12', '1.10'),
(699, 'CN 80 160 G1 S2 L3', 'CN 80 160 G1 S2 L3', 1, 1, '1', 1, 1, '11400.00000000', '11400.00000000', 0, 1, 'Purchessed', 1, 1, '11400.00', '1.10'),
(700, 'CN 100 160 G1 S2 L3', '', 1, 1, '1', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(701, 'CN 32 160 G1 S2 L1', '', 1, 1, '1', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 3, 3, '0.00', '0.00'),
(702, 'CN 40 160 G1 S2 L1', 'CN 40 160 G1 S2 L1', 1, 1, '1', 1, 1, '8367.00000000', '8367.50000000', 0, 1, 'Purchessed', 1, 1, '8367.50', '1.10'),
(703, 'CN 50 160 G1 S2 L1', 'CN 50 160 G1 S2 L1', 1, 1, '1', 1, 1, '9245.00000000', '9245.00000000', 0, 1, 'Purchessed', 1, 1, '9245.00', '1.10'),
(704, 'CB 32 160 G1', 'CB 32 160 G1', 1, 1, '61', 1, 1, '5610.00000000', '5610.00000000', 0, 1, 'Purchessed', 1, 1, '5610.00', '1.10'),
(705, 'CB 40 160 G1', 'CB 40 160 G1', 1, 1, '61', 1, 1, '8318.00000000', '8318.00000000', 0, 1, 'Purchessed', 1, 1, '8318.00', '1.10'),
(706, 'CB 40 200 G1', 'CB 40 200 G1', 1, 1, '61', 1, 1, '9190.00000000', '9190.00000000', 0, 1, 'Purchessed', 1, 1, '9190.00', '1.10'),
(707, 'CB 80 200 G1', '', 1, 1, '61', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(708, 'CB 200 200 G1', 'CB 200 200 G1', 1, 1, '61', 1, 2, '22380.00000000', '44760.00000000', 0, 1, 'Purchessed', 1, 1, '22380.00', '1.10'),
(709, 'CN 32 200 G1 S2 L3', 'CN 32 200 G1 S2 L3', 1, 1, '1', 1, 3, '11172.00000000', '33518.64000000', 0, 1, 'Purchessed', 1, 1, '11172.88', '1.10'),
(710, 'CN 32 125 G1 S2 L1', '', 1, 1, '1', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(711, 'CN 40 125 G1 S2 L1', '', 1, 1, '1', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(712, 'CN 50 125 G1 S2 L1', '', 1, 1, '1', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(713, 'CN 65 125 G1 S2 L1', '', 1, 1, '1', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(714, 'CN 40 200 G1 S2 L3', 'CN 40 200 G1 S2 L3', 1, 1, '1', 1, 1, '11369.00000000', '11369.42000000', 0, 1, 'Purchessed', 1, 1, '11369.42', '1.10'),
(715, 'CN 50 200 G1 S2 L3', 'CN 50 200 G1 S2 L3', 1, 1, '1', 1, 3, '12959.00000000', '38877.59000000', 0, 1, 'Purchessed', 1, 1, '12959.86', '1.10'),
(716, 'CN 65 200 G1 S2 L3', 'CN 65 200 G1 S2 L3', 1, 1, '1', 1, 2, '13887.00000000', '27774.80000000', 0, 1, 'Purchessed', 1, 1, '13887.40', '1.10'),
(717, 'CN 80 200 G1 S2 L3', 'CN 80 200 G1 S2 L3', 1, 1, '1', 1, 1, '16400.00000000', '16400.00000000', 0, 1, 'Purchessed', 1, 1, '16400.00', '1.10'),
(718, 'CN 100 200 G1 S2 L3', '', 1, 1, '1', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(719, 'CN 40 250 G1 S2 L3', 'CN 40 250 G1 S2 L3', 1, 1, '1', 1, 1, '13500.00000000', '13500.00000000', 0, 1, 'Purchessed', 1, 1, '13500.00', '1.10'),
(720, 'CN 50 250 G1 S2 L3', 'CN 50 250 G1 S2 L3', 1, 1, '1', 1, 1, '13586.00000000', '13586.17000000', 0, 1, 'Purchessed', 1, 1, '13586.17', '1.10'),
(721, 'CN 200 200 G1 S2 L3', 'CN 200 200 G1 S2 L3', 1, 1, '1', 1, 1, '29804.00000000', '29804.00000000', 0, 1, 'Purchessed', 1, 1, '29804.00', '1.10'),
(722, 'CN 125 315 G1 S2 L3', 'CN 125 315 G1 S2 L3', 1, 1, '1', 1, 1, '26701.00000000', '26701.50000000', 0, 1, 'Purchessed', 1, 1, '26701.50', '1.10'),
(723, 'CN 100 315 G1 S2 L3', 'CN 100 315 G1 S2 L3', 1, 1, '1', 1, 1, '25200.00000000', '25200.00000000', 0, 1, 'Purchessed', 1, 1, '25200.00', '1.10'),
(724, 'CCR 32 200 R6 S2 L3', 'CCR 32 200 R6 S2 L3', 1, 1, '2', 1, 2, '28844.00000000', '57688.00000000', 0, 1, 'Purchessed', 1, 1, '28844.00', '1.10'),
(725, 'CCR 32 250 R6 M2 L3', 'CCR 32 250 R6 M2 L3', 1, 1, '2', 1, 1, '67000.00000000', '67000.00000000', 0, 1, 'Purchessed', 1, 1, '67000.00', '1.10'),
(726, 'CCR 40 200 R6 S2 L3', '', 1, 1, '2', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 2, '0.00', '0.00'),
(727, 'CCR 50 200 R6 S2 L3', 'CCR 50 200 R6 S2 L3', 1, 1, '2', 1, 2, '34244.00000000', '68488.00000000', 0, 1, 'Purchessed', 1, 1, '34244.00', '1.10'),
(728, 'CCR 65 200 R6 S2 L3', '', 1, 1, '2', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(729, 'CCR 25 125 R6 S2 L3', '', 1, 1, '2', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 2, '0.00', '0.00'),
(730, 'CCR 25 160 R6 S2 L3', '', 1, 1, '2', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(731, 'CCR 32 160 R6 S2 L3', '', 1, 1, '2', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 2, '0.00', '0.00'),
(732, 'CCR 40 160 R6 S2 L3', 'CCR 40 160 R6 S2 L3', 1, 1, '2', 1, 1, '63029.00000000', '63029.00000000', 0, 1, 'Purchessed', 1, 1, '63029.00', '1.10'),
(733, 'CCR 50 160 R6 S2 L3', '', 1, 1, '2', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(734, 'CCR 65 160 R6 S2 L3', 'CCR 65 160 R6 S2 L3', 1, 1, '2', 1, 1, '58404.00000000', '58404.00000000', 0, 1, 'Purchessed', 1, 1, '58404.00', '1.10'),
(735, 'CCR 32 125 R6 S2 L3', '', 1, 1, '2', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(736, 'CCR 65 160 R1 S2 L3', '', 1, 1, '2', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(737, 'CCR 50 200 R6A S2 L6', '', 1, 1, '2', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(738, 'CCR 32 160 R6A M2 L6', 'CCR 32 160 R6A M2 L6', 1, 1, '2', 1, 1, '53347.00000000', '53347.00000000', 0, 1, 'Purchessed', 1, 1, '53347.00', '1.10'),
(739, 'MCH / MCV 12', '', 1, 1, '3', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(740, 'MCH / MCV 16', '', 1, 1, '3', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(741, 'MCH / MCV 20', '', 1, 1, '3', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(742, 'MCH / MCV 12 with Motor', '', 7, 26, '3', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(743, 'MCH / MCV 14 with Motor', '', 7, 26, '3', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(744, 'MCH / MCV 16 with Motor', '', 7, 26, '3', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(745, 'MCH / MCV 20 with Motor', '', 7, 26, '3', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(746, 'Bearing Housing KGEN 11 3 to 11 4', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 5, 5, '0.00', '0.00'),
(747, 'Bearing Housing KGEN 12 5 to 16 6', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 5, 5, '0.00', '0.00'),
(748, 'Bearing Cover KGEN 11 3 to 11 4', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 3, 3, '0.00', '0.00'),
(749, 'Bearing Cover KGEN 12 5 to 16 6', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 3, 3, '0.00', '0.00'),
(750, 'Oil Seal KGEN 11 3 to 11 4', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 5, 5, '0.00', '0.00'),
(751, 'Oil Seal KGEN 12 5 to 16 6', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 5, 5, '0.00', '0.00'),
(752, 'Intermediate Cover KGEN 11 3 to 11 4', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 3, 3, '0.00', '0.00'),
(753, 'Intermediate Cover KGEN 12 5 to 16 6', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 3, 3, '0.00', '0.00'),
(754, 'Intermediate Cover KGEN 25n 10', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(755, 'Mechanical Seal KGEN 11 3 to 11 4', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 10, 10, '0.00', '0.00'),
(756, 'Mechanical Seal KGEN 12 5 to 16 6', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 10, 10, '0.00', '0.00'),
(757, 'Suction Cover KGEN 11 3 to 11 4', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 2, '0.00', '0.00'),
(758, 'Suction Cover KGEN 12 5 & 12b 5', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 2, '0.00', '0.00'),
(759, 'Suction Cover KGEN 12 6, 15 6 & 16 6', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 2, '0.00', '0.00'),
(760, 'Suction Cover KGEN 14 8', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 2, '0.00', '0.00'),
(761, 'Window Cover KGEN 12 5 to 16 6', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 2, '0.00', '0.00'),
(762, 'Valve Assembly KGEN 11 3', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 5, 5, '0.00', '0.00'),
(763, 'Valve Assembly KGEN 11 4', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 5, 5, '0.00', '0.00'),
(764, 'Valve Assembly KGEN 12 5 & 12b 5', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 5, 5, '0.00', '0.00'),
(765, 'Valve Assembly KGEN 12 6, 15 6 & 16 6', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 5, 5, '0.00', '0.00'),
(766, 'Valve Assembly KGEN 14 8', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 5, 5, '0.00', '0.00'),
(767, 'Shaft KGEN 11 3 to 11 4', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 2, 2, '0.00', '0.00'),
(768, 'Shaft KGEN 12 5 to 16 6', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 2, 2, '0.00', '0.00'),
(769, 'Shaft KGEN 25n 10', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 1, 1, '0.00', '0.00'),
(770, 'CI Impeller KGEN 11 3', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 5, 5, '0.00', '0.00'),
(771, 'CI Impeller KGEN 11 4', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 5, 5, '0.00', '0.00'),
(772, 'CI Impeller KGEN 12 5', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 5, 5, '0.00', '0.00'),
(773, 'CI Impeller KGEN 12b 5', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 5, 5, '0.00', '0.00'),
(774, 'CI Impeller KGEN 12 6', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 5, 5, '0.00', '0.00'),
(775, 'CI Impeller KGEN 15 6', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 5, 5, '0.00', '0.00'),
(776, 'CI Impeller KGEN 14 8', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 5, 5, '0.00', '0.00'),
(777, 'CI Impeller KGEN 16 6', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 5, 5, '0.00', '0.00'),
(778, 'CI Impeller KGEN 16 3', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(779, 'CI Impeller KGEN 21 8', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(780, 'CI Impeller KGEN 25n 10', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(781, 'SS Impeller KGEN 11 3', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 2, '0.00', '0.00'),
(782, 'SS Impeller KGEN 11 4', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 2, '0.00', '0.00'),
(783, 'SS Impeller KGEN 12 5', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 2, '0.00', '0.00'),
(784, 'SS Impeller KGEN 12b 5', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 2, '0.00', '0.00'),
(785, 'SS Impeller KGEN 12 6', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 2, '0.00', '0.00'),
(786, 'SS Impeller KGEN 15 6', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 2, '0.00', '0.00'),
(787, 'SS Impeller KGEN 14 8', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 2, '0.00', '0.00'),
(788, 'SS Impeller KGEN 16 6', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 2, 2, '0.00', '0.00'),
(789, 'SS Impeller KGEN 16 3', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(790, 'SS Impeller KGEN 21 8', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(791, 'SS Impeller KGEN 25n 10', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(792, 'Pump Casing KGEN 11 3', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(793, 'Pump Casing KGEN 11 4', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(794, 'Pump Casing KGEN 12 5', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(795, 'Pump Casing KGEN 12b 5', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(796, 'Pump Casing KGEN 12 6', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(797, 'Pump Casing KGEN 15 6', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(798, 'Pump Casing KGEN 14 8', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(799, 'Pump Casing KGEN 16 6', '', 6, 16, '21', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(800, 'KGEN 11 3 with Motor', '', 7, 26, '30', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(801, 'KGEN 11 4 with Motor', '', 7, 26, '30', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(802, 'KGEN 12 6 with Motor', '', 7, 26, '30', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(803, 'KGEN 12 5 with Motor', '', 7, 26, '30', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(804, 'KGEN 12b 5 with Motor', '', 7, 26, '30', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(805, 'KGEN 16 3 with Motor', '', 7, 26, '30', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(806, 'KGEN 16 6 with Motor', '', 7, 26, '30', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(807, 'KGEN 14 8 with Motor', '', 7, 26, '30', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(808, 'KGEN 15 6 with Motor', '', 7, 26, '30', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(809, 'KGEN 25n 10 with Motor', '', 7, 26, '30', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(810, 'CN 32 160 with Motor', '', 7, 26, '62', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(811, 'CN 40 200 with Motor', '', 7, 26, '62', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(812, 'CN 50 160 With Motor', 'CN 50 160 With Motor', 7, 26, '62', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Manufactured', 0, 0, '0.00', '0.00'),
(813, 'CI Impeller CN 200 200', '', 6, 16, '13', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(814, 'CI Impeller CN 80 200', '', 6, 16, '13', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(815, 'CI Impeller CN 65c 200', '', 6, 16, '13', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(816, 'CI Impeller CN 100 400', '', 6, 16, '13', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(817, 'CI Impeller CN 125 250', '', 6, 16, '13', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(818, 'CI Impeller CN 40 160', '', 6, 16, '13', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(819, 'CI Impeller CN 40 200', '', 6, 16, '13', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(820, 'CI Impeller CN 40c 160', '', 6, 16, '13', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(821, 'CI Impeller CN 50 160', '', 6, 16, '13', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(822, 'CI Impeller CN 50 250', '', 6, 16, '13', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(823, 'SS Impeller CCR 40 200 R6A', '', 6, 16, '25', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(824, 'SS Impeller CCR 50 160', '', 6, 16, '25', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(825, 'SS Impeller CCR 50c 160', '', 6, 16, '25', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(826, 'CS Impeller CCR 40 160 R1', '', 6, 16, '25', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(827, 'Bearing Housing CCR 50 160', '', 6, 16, '25', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(828, 'Backplate for EXP 160 CT', '', 6, 17, '16', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(829, 'Bearing Cover for EXP 160 CT', '', 6, 17, '16', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(830, 'Deflector for EXP 160 CT', '', 6, 17, '16', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(831, 'Impeller for EXP 160 CT', '', 6, 17, '16', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(832, 'Locating Flange 1.375" Antico', '', 6, 17, '16', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(833, 'Oil Levellor Antico Pump', '', 6, 17, '16', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(834, 'SS 316 Shaft NZ Pump', '', 6, 17, '15', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 1, 1, '0.00', '0.00'),
(835, 'Adapter Flange 1.375" Antico', '', 6, 17, '16', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(836, 'Cap Nut TS 105/030', '', 6, 15, '18', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(837, 'Circlip NSS 65 250 W8', '', 6, 15, '56', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(838, 'Clamping Band T1SB 50.1', '', 6, 15, '19', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(839, 'Coupling JOP 38/36', '', 6, 15, '17', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(840, 'Coupling Rod Pin T1SB 50.1', '', 6, 15, '19', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(841, 'Cover Sleeve T1SB 50.1', '', 6, 15, '19', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(842, 'Distance Bush TS 105/030', '', 6, 15, '18', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(843, 'Dowel Pin TS 105/030', '', 6, 15, '18', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(844, 'Gasket NSS 65 250 W8', '', 6, 15, '56', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(845, 'Gasket & Ball Bearing T3ST 100/42', '', 6, 15, '17', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(846, 'Gasket & Ball Bearing T3ST 52/46', '', 6, 15, '17', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(847, 'Groove Ball Bearing NSS 65 250 W8', '', 6, 15, '56', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(848, 'Guide Bush T1SB 50.1', '', 6, 15, '19', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(849, 'Hexagon Nut NSS 65 250 W8', '', 6, 15, '56', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(850, 'Impeller NSS 65 250 W8', '', 6, 15, '56', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(851, 'Minor Joint Kit TRF 660', '', 6, 15, '17', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(852, 'Lock nut TS 105/030', '', 6, 15, '18', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(853, 'Mechanical seal TDSH 088/40', '', 6, 15, '18', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(854, 'Retaining Sleeve T1SB 50.1', '', 6, 15, '19', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(855, 'Rotor Set TIGGM 100/50 SSSS', '', 6, 15, '20', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(856, 'Relief Valve Assembly TDSH 088/40', '', 6, 15, '18', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(857, 'Shaft NSS 65 250 W8', '', 6, 15, '56', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(858, 'Supporting Washer NSS 65 250 W8', '', 6, 15, '56', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(859, 'Timing Gear TDSH 088/40', '', 6, 15, '18', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(860, 'Timing Gear TS 105/030', '', 6, 15, '18', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(861, 'Washer Lock TS 105/030', '', 6, 15, '18', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(862, 'Coupling L 075', '', 5, 20, '37', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 10, 10, '0.00', '0.00'),
(863, 'Coupling L 095', '', 5, 20, '37', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 10, 10, '0.00', '0.00'),
(864, 'Coupling L 100', '', 5, 20, '37', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 10, 10, '0.00', '0.00'),
(865, 'Coupling L 110', '', 5, 20, '37', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 10, 10, '0.00', '0.00'),
(866, 'Coupling L 150', '', 5, 20, '37', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(867, 'Coupling L 190', '', 5, 20, '37', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(868, 'Coupling RRL 095', '', 5, 20, '37', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(869, 'Coupling RRL 100', '', 5, 20, '37', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(870, 'Coupling RRL 110', '', 5, 20, '37', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(871, 'Coupling RRL 150', '', 5, 20, '37', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(872, 'Silicon Oil', '', 5, 30, '38', 4, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(873, 'Panel Electronic DPPL', '', 5, 30, '38', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(874, 'Control Panel', '', 5, 30, '38', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(875, 'Starter for Pump / Motor', '', 5, 30, '38', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(876, 'PP Ball Valve', '', 5, 30, '38', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(877, 'PP Flanges', '', 5, 30, '38', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(878, 'PP NRV', '', 5, 30, '38', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(879, 'REMI 200 mm Coach Fan CF 20 12V NDX', '', 6, 21, '39', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(880, 'Ball Valve 1.5"', '', 5, 30, '38', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(881, 'Mechfil 0.5" & 1.0" Filter', '', 2, 12, '40', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(882, 'Mechfil 0.5" & 1.0" Filter Element', '', 2, 32, '42', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(883, 'Mechfil 1.5" & 2.0" Filter', '', 2, 12, '40', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(884, 'Mechfil 1.5" & 2.0" Filter Element', '', 2, 32, '42', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(885, 'Mechfil 2.5" & 3.0" Filter', '', 2, 12, '40', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(886, 'Mechfil 2.5" & 3.0" Filter Element', '', 2, 32, '42', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(887, 'Mechfil 6.0" Filter', '', 2, 12, '40', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(888, 'Coupling Guard Mechfill', '', 5, 30, '38', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(889, 'Coupling Guard Antico', '', 5, 30, '38', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(890, '4" Cutting Wheel', '', 5, 30, '43', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(891, '4" Grinding Wheel', '', 5, 30, '43', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(892, 'Tape for Packing', '', 5, 30, '43', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(893, 'Priming Chamber Antico', '', 6, 17, '15', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(894, '3" Channel', '3" Channel', 5, 30, '38', 5, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(895, '4" Channel', '4" Channel', 5, 30, '38', 5, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(896, 'Tools for Lathe Machine', '', 5, 30, '43', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(897, 'Base Frame 3"', '', 5, 30, '38', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(898, 'Base Frame 4"', '', 5, 30, '38', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(899, 'Cable 6 Core ( 3 *4mm and 3 * 1.5mm )', '', 6, 4, '53', 2, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(900, 'NZ 25 125 Pump SO Impeller with Motor', '', 7, 27, '27', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(901, 'NZ 32 125 Pump SO Impeller with Motor', '', 7, 27, '27', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(902, 'NZ 50 125 Pump SO Impeller with Motor', '', 7, 27, '27', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(903, 'NZ 25 160 Pump SO Impeller with Motor', '', 7, 27, '27', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(904, 'NZ 32 160 Pump SO Impeller with Motor', '', 7, 27, '27', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(905, 'NZ 50 160 Pump SO Impeller with Motor', '', 7, 27, '27', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(906, 'NZ 25 160 Pump SO Impeller with Motor', '', 7, 27, '27', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(907, 'NZ 50 200 Pump SO Impeller with Motor', '', 7, 27, '27', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(908, 'NZ 25 125 Pump Closed Impeller with Motor', '', 7, 27, '27', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(909, 'NZ 32 125 Pump Closed Impeller with Motor', '', 7, 27, '27', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(910, 'NZ 50 125 Pump Closed Impeller with Motor', '', 7, 27, '27', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(911, 'NZ 25 160 Pump Closed Impeller with Motor', '', 7, 27, '27', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(912, 'NZ 32 160 Pump Closed Impeller with Motor', '', 7, 27, '27', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(913, 'NZ 50 160 Pump Closed Impeller with Motor', '', 7, 27, '27', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(914, 'NZ 25 160 Pump Closed Impeller with Motor', '', 7, 27, '27', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(915, 'NZ 50 200 Pump Closed Impeller with Motor', '', 7, 27, '27', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(916, 'Traneter Plate Type Heat Exchanger', '', 8, 33, '44', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(917, 'Mechfill Cooling Unit with Simplex Filter', '', 4, 34, '45', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(918, 'Mechfill Cooling Unit with Duplex Filter', '', 4, 34, '45', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(919, 'Mechfill Cooling Unit without Filter', '', 4, 34, '45', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(920, 'NSRP 50 Pump Closed Impeller with Motor', '', 7, 27, '46', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(921, 'RT 10 Pump with Motor', '', 7, 22, '22', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(922, 'RT 20 Pump with Motor', '', 7, 22, '22', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(923, 'RT 40 Pump with Motor', '', 7, 22, '22', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(924, 'RT 80 Pump with Motor', '', 7, 22, '22', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(925, 'RT 125 Pump with Motor', '', 7, 22, '22', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(926, 'WV 03 L/40', 'Waste Water Pump', 1, 4, '52', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(927, 'CCR 32 160  With Motor', 'CCR 32 160  With Motor', 7, 26, '28', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Manufactured', 0, 0, '1.00', '1.10'),
(928, 'CCR 65 125 With Motor', 'CCR 65 125 With Motor', 7, 26, '28', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Manufactured', 0, 0, '0.00', '0.00'),
(929, 'CN 100 400', 'CN 100 400', 1, 1, '1', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(930, 'CCR 40 160 With Motor', 'CCR 40 160 With Motor', 7, 26, '28', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Manufactured', 0, 0, '0.00', '0.00'),
(931, 'S 630', 'S 630', 1, 4, '52', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(932, 'CB 40C 160', 'CB 40C 160', 1, 1, '61', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(933, 'ED-03', 'ED-03', 1, 3, '24', 1, 1, '8000.00000000', '8000.00000000', 0, 1, 'Purchessed', 1, 1, '1.00', '99.99'),
(934, 'LJ 10', 'LJ 10', 1, 4, '64', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(935, 'LJ 15', 'LJ 15', 1, 4, '64', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(936, 'NZ 25 160 Pump Semi Open Impeller With Motor', 'NZ 25 160 Pump Semi Open Impeller With Motor', 7, 27, '27', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Manufactured', 0, 0, '0.00', '0.00'),
(938, 'CN 40 160 With Motor', 'CN 40 160 With Motor', 7, 26, '62', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(940, 'T3 SFP 20/56 ', 'T3 SFP 20/56 ', 1, 2, '8', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(941, 'CCR 125 315  With Motor', 'CCR 125 315  With Motor', 7, 26, '28', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Manufactured', 0, 0, '0.00', '0.00'),
(942, 'Shaft For CN 80 200', 'Shaft For CN 80 200', 6, 16, '13', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(943, 'Bearing Housing CN 80 200', 'Bearing Housing CN 80 200', 6, 16, '13', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(944, 'Bronze Impeller CN 80 200', 'Bronze Impeller CN 80 200', 6, 16, '13', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00');
INSERT INTO `items` (`id`, `name`, `alias`, `item_category_id`, `item_group_id`, `item_sub_group_id`, `unit_id`, `ob_quantity`, `ob_rate`, `ob_value`, `freeze`, `serial_number_enable`, `source`, `minimum_quantity`, `maximum_quantity`, `dynamic_cost`, `minimum_selling_price_factor`) VALUES
(945, 'CI Impeller CN 100 315', 'CI Impeller CN 100 315', 6, 16, '13', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(946, 'M 3080', 'M 3080', 1, 4, '65', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(947, 'Cartridge Assembly T3 S 45', 'Cartridge Assembly T3 S 45', 6, 15, '17', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(948, 'Gasket  T3 S  45', 'Gasket  T3 S 45', 6, 15, '17', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(949, 'Bearing Housing KGEN 21 8 ', 'Bearing Housing KGEN 21 8 ', 6, 16, '11', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 3, 5, '0.00', '0.00'),
(950, 'CN 150 400 G1 S2 L3', 'CN Pump', 1, 1, '1', 1, 0, '0.00000000', '0.00000000', 0, 1, 'Purchessed', 1, 1, '0.00', '0.00'),
(951, 'Impeller Cap Nut SS 316 (1820) CN 100 / 200-160, 80 To 200-200, 65 To 125-250, 40 To 100-315', 'Impeller Cap Nut (1820)', 6, 16, '13', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(952, 'Shaft Sleeve SS (S2) (1100) CN 100-160, 80 To 200-200, 65 To 125-250, 40 To 100-315', 'Shaft Sleeve (1100)', 6, 16, '13', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(953, 'Shaft Sleeve SS (S2) (1100) CCR 32 To 65-125, 32 To 50-160, 32 To 50-200', 'Shaft Sleeve SS S2 (1100) CCR', 6, 16, '25', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(954, 'CCR 25 125 R6 M2 L3', 'CCR 25 125 R6 M2 L3', 1, 1, '2', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(955, 'CCR 32 125 R6 M2 L3', 'CCR 32 125 R6 M2 L3', 1, 1, '2', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(956, 'Shaft Sleeve SS (M2) (1200) CCR 25-125,25-160', 'Shaft Sleeve M2', 6, 16, '25', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(957, 'Shaft Sleeve SS (M2) (1200) CCR 32 To 65-125,32 To 50-160,32 To 50-200', 'Shaft Sleeve M2', 6, 16, '25', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(958, 'WP 05D/35', 'WP 05D 35', 1, 4, '52', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(959, 'Shaft Sleeve SS (M2) (1200) CCR 32 To 80-250,40 To 50-315,65 To 80-160,65 To 100-200', 'Shaft Sleeve M2', 6, 16, '25', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(960, 'CCR 65 160 R6 M2 L3', 'CCR 65 160 R6 M2 L3', 1, 1, '2', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(961, 'CI Impeller CN 25 160', 'CI Impeller CN 25 160', 6, 16, '13', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(962, 'CCR 65C 160 R6 M2 L3', 'CCR 65C 160 R6 M2 L3', 1, 1, '2', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(963, 'SS Impeller CN 25 160 ', 'SS Impeller CN 25 160 ', 6, 16, '13', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(964, 'CCR 25 160 R6 M2 L3', 'CCR 25 160 R6 M2 L3', 1, 1, '2', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(965, 'CI Bearing Cover CN 25 160 ', 'CI Bearing Cover CN 25 160 ', 6, 16, '13', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(966, 'Pump Casing CN 25 160', 'Pump Casing CN 25 160', 6, 16, '13', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(967, 'Stuffing Box CN 25 160 ', 'Stuffing Box CN 25 160 ', 6, 16, '13', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(968, 'CCR 32C 125 R6 M2 L3', 'CCR 32C 125 R6 M2 L3', 1, 1, '2', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(969, 'CCR 32 160 R6 M2 L3', 'CCR 32 160 R6 M2 L3', 1, 1, '2', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(970, 'CCR 32 200 R6 M2 L3', 'CCR 32 200 R6 M2 L3', 1, 1, '2', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(971, 'DT 33', 'DT 33', 1, 4, '52', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(972, 'HD 2017 / SZ With Motor', 'HD 2017 / SZ With Motor', 7, 28, '66', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(973, 'CN 125 400 G1 S2 L3', 'CN 125 400 G1 S2 L3', 1, 1, '1', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(974, 'CN 125 400 With Motor', 'CN 125 400 With Motor', 7, 26, '62', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(975, 'CCR 25 125 With Motor', 'CCR 25 125 With Motor', 7, 26, '63', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(976, 'TGL 047 2 V', 'TGL 047 2 V', 1, 1, '67', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(977, 'Pump Casing WV 01 L/40', 'Pump Casing WV 01 L/40', 6, 18, '68', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(978, 'Stationary Part 1.375', 'Stationary Part 1.375 ', 6, 17, '16', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(979, 'Rotary Part 1.375', 'Rotay Part 1.375', 6, 17, '16', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(980, 'FRE 80 170 With Motor', 'FRE 80 170 With Motor', 7, 26, '69', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(981, 'CCR 40 250 With Motor', 'CCR 40 250 With Motor', 7, 26, '63', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(982, 'ED-01', 'ED-01', 1, 3, '24', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(983, 'Rotor Set R 50 SL', 'Rotor Set R 50 SL', 6, 15, '20', 5, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(984, 'Shaft HE 120', 'Shaft HE 120', 6, 17, '33', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Manufactured', 1, 1, '0.00', '0.00'),
(985, 'Pump Casing KGEN 16 3', 'Pump Casing KGEN 16 3', 6, 16, '11', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(986, 'WW 201', 'WW 201', 1, 4, '52', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 1, 1, '0.00', '0.00'),
(987, 'CN 32 200 G1 S2 L3 With Motor', 'CN 32 200 G1 S2 L3 With Motor', 7, 26, '62', 3, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed/Manufactured', 0, 0, '0.00', '0.00'),
(988, 'CBR 25 125 R4', 'CBR 25 125 R4', 1, 1, '61', 1, 1, '18710.00000000', '18710.00000000', 0, 1, 'Purchessed', 1, 1, '18710.00', '1.10'),
(989, 'MCV 14B 10 G1', 'MCV 14B 10 G1', 1, 1, '3', 1, 1, '24098.00000000', '24098.00000000', 0, 1, 'Purchessed', 1, 1, '24098.00', '1.10'),
(990, 'CCR 40 250 R6 S2 L3', 'CCR 40 250 R6A/R6  S2 L3', 1, 1, '2', 1, 1, '61162.00000000', '61162.00000000', 0, 1, 'Purchessed', 1, 1, '61162.00', '1.10'),
(991, 'CCR 40C 160 R6 S2 L3', 'CCR 40C 160 R6 S2 L3', 1, 1, '2', 1, 1, '28671.00000000', '28671.00000000', 0, 1, 'Purchessed', 1, 1, '28671.00', '1.10'),
(992, 'CCR 65 250 R1 S2 L3', 'CCR 65 250 R1 S2 L3', 1, 1, '2', 1, 1, '25243.00000000', '25243.00000000', 0, 1, 'Purchessed', 1, 1, '25243.00', '1.10'),
(993, 'CN 40 125 G1 S2 L3', 'CN 40 125 G1 S2 L3', 1, 1, '1', 1, 1, '10802.00000000', '10802.00000000', 0, 1, 'Purchessed', 1, 1, '10802.00', '1.10'),
(994, 'CN 40 200 G1 S2 L1', 'CN 40 200 G1 S2 L1', 1, 1, '1', 1, 2, '10282.00000000', '20564.00000000', 0, 1, 'Purchessed', 1, 1, '10282.00', '1.10'),
(995, 'CN 65 250 G1 S2 L3', 'CN 65 250 G1 S2 L3', 1, 1, '1', 1, 1, '16686.00000000', '16686.00000000', 0, 1, 'Purchessed', 1, 1, '16686.00', '1.10'),
(996, 'Sealing Ring (12) HD 2017', 'Sealing Ring (12) HD 2017', 6, 19, '70', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(997, 'Valve Cage (16) HD 2017', 'Valve Cage (16) HD 2017', 6, 19, '70', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(999, 'Liquid Head (1) HD 2017', 'Liquid Head (1) HD 2017', 6, 19, '70', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(1001, 'Hose Nipple (18) HD 2017', 'Hose Nipple (18) HD 2017', 6, 19, '70', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(1002, 'Plain Washer (33) HD 2017', 'Plain Washer (33) HD 2017', 6, 19, '70', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00'),
(1003, 'Allen Bolt (35) HD 2017', 'Allen Bolt (35) HD 2017', 6, 19, '70', 1, 0, '0.00000000', '0.00000000', 0, 0, 'Purchessed', 0, 0, '0.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE IF NOT EXISTS `item_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `item_categories`
--

INSERT INTO `item_categories` (`id`, `name`) VALUES
(1, 'Pumps'),
(2, 'Filters & Elements'),
(3, 'Motors'),
(4, 'Skids'),
(5, 'Miscllaneous'),
(6, 'Spares'),
(7, 'Motorised Units'),
(8, 'Heat Exchanger');

-- --------------------------------------------------------

--
-- Table structure for table `item_companies`
--

CREATE TABLE IF NOT EXISTS `item_companies` (
  `item_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`,`company_id`),
  KEY `company_key` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_companies`
--

INSERT INTO `item_companies` (`item_id`, `company_id`) VALUES
(556, 25),
(557, 25),
(558, 25),
(559, 25),
(560, 25),
(561, 25),
(562, 25),
(563, 25),
(564, 25),
(565, 25),
(566, 25),
(567, 25),
(568, 25),
(569, 25),
(570, 25),
(571, 25),
(572, 25),
(573, 25),
(574, 25),
(575, 25),
(576, 25),
(577, 25),
(578, 25),
(579, 25),
(580, 25),
(581, 25),
(582, 25),
(583, 25),
(584, 25),
(585, 25),
(586, 25),
(587, 25),
(588, 25),
(589, 25),
(590, 25),
(591, 25),
(592, 25),
(593, 25),
(594, 25),
(595, 25),
(596, 25),
(597, 25),
(598, 25),
(599, 25),
(600, 25),
(601, 25),
(602, 25),
(603, 25),
(604, 25),
(605, 25),
(606, 25),
(607, 25),
(608, 25),
(609, 25),
(610, 25),
(611, 25),
(612, 25),
(613, 25),
(614, 25),
(615, 25),
(616, 25),
(617, 25),
(618, 25),
(619, 25),
(620, 25),
(621, 25),
(622, 25),
(623, 25),
(624, 25),
(625, 25),
(626, 25),
(627, 25),
(628, 25),
(629, 25),
(630, 25),
(631, 25),
(632, 25),
(633, 25),
(634, 25),
(635, 25),
(636, 25),
(637, 25),
(638, 25),
(639, 25),
(640, 25),
(641, 25),
(642, 25),
(643, 25),
(644, 25),
(645, 25),
(646, 25),
(647, 25),
(648, 25),
(649, 25),
(650, 25),
(651, 25),
(652, 25),
(653, 25),
(654, 25),
(655, 25),
(656, 25),
(657, 25),
(658, 25),
(659, 25),
(660, 25),
(661, 25),
(662, 25),
(663, 25),
(664, 25),
(665, 25),
(666, 25),
(667, 25),
(668, 25),
(669, 25),
(670, 25),
(671, 25),
(672, 25),
(673, 25),
(674, 25),
(675, 25),
(676, 25),
(677, 25),
(678, 25),
(679, 25),
(680, 25),
(681, 25),
(682, 25),
(683, 25),
(684, 25),
(685, 25),
(686, 25),
(687, 25),
(688, 25),
(689, 25),
(690, 25),
(691, 25),
(692, 25),
(693, 25),
(694, 25),
(695, 25),
(696, 25),
(697, 25),
(698, 25),
(699, 25),
(700, 25),
(701, 25),
(702, 25),
(703, 25),
(704, 25),
(705, 25),
(706, 25),
(707, 25),
(708, 25),
(709, 25),
(710, 25),
(711, 25),
(712, 25),
(713, 25),
(714, 25),
(715, 25),
(716, 25),
(717, 25),
(718, 25),
(719, 25),
(720, 25),
(721, 25),
(722, 25),
(723, 25),
(724, 25),
(725, 25),
(726, 25),
(727, 25),
(728, 25),
(729, 25),
(730, 25),
(731, 25),
(732, 25),
(733, 25),
(734, 25),
(735, 25),
(736, 25),
(737, 25),
(738, 25),
(739, 25),
(740, 25),
(741, 25),
(742, 25),
(743, 25),
(744, 25),
(745, 25),
(746, 25),
(747, 25),
(748, 25),
(749, 25),
(750, 25),
(751, 25),
(752, 25),
(753, 25),
(754, 25),
(755, 25),
(756, 25),
(757, 25),
(758, 25),
(759, 25),
(760, 25),
(761, 25),
(762, 25),
(763, 25),
(764, 25),
(765, 25),
(766, 25),
(767, 25),
(768, 25),
(769, 25),
(770, 25),
(771, 25),
(772, 25),
(773, 25),
(774, 25),
(775, 25),
(776, 25),
(777, 25),
(778, 25),
(779, 25),
(780, 25),
(781, 25),
(782, 25),
(783, 25),
(784, 25),
(785, 25),
(786, 25),
(787, 25),
(788, 25),
(789, 25),
(790, 25),
(791, 25),
(792, 25),
(793, 25),
(794, 25),
(795, 25),
(796, 25),
(797, 25),
(798, 25),
(799, 25),
(800, 25),
(801, 25),
(802, 25),
(803, 25),
(804, 25),
(805, 25),
(806, 25),
(807, 25),
(808, 25),
(809, 25),
(810, 25),
(811, 25),
(812, 25),
(813, 25),
(814, 25),
(815, 25),
(816, 25),
(817, 25),
(818, 25),
(819, 25),
(820, 25),
(821, 25),
(822, 25),
(823, 25),
(824, 25),
(825, 25),
(826, 25),
(827, 25),
(828, 25),
(829, 25),
(830, 25),
(831, 25),
(832, 25),
(833, 25),
(834, 25),
(835, 25),
(836, 25),
(837, 25),
(838, 25),
(839, 25),
(840, 25),
(841, 25),
(842, 25),
(843, 25),
(844, 25),
(845, 25),
(846, 25),
(847, 25),
(848, 25),
(849, 25),
(850, 25),
(851, 25),
(852, 25),
(853, 25),
(854, 25),
(855, 25),
(856, 25),
(857, 25),
(858, 25),
(859, 25),
(860, 25),
(861, 25),
(862, 25),
(863, 25),
(864, 25),
(865, 25),
(866, 25),
(867, 25),
(868, 25),
(869, 25),
(870, 25),
(871, 25),
(872, 25),
(873, 25),
(874, 25),
(875, 25),
(876, 25),
(877, 25),
(878, 25),
(879, 25),
(880, 25),
(881, 25),
(882, 25),
(883, 25),
(884, 25),
(885, 25),
(886, 25),
(887, 25),
(888, 25),
(889, 25),
(890, 25),
(891, 25),
(892, 25),
(893, 25),
(894, 25),
(895, 25),
(896, 25),
(897, 25),
(898, 25),
(899, 25),
(900, 25),
(901, 25),
(902, 25),
(903, 25),
(904, 25),
(905, 25),
(906, 25),
(907, 25),
(908, 25),
(909, 25),
(910, 25),
(911, 25),
(912, 25),
(913, 25),
(914, 25),
(915, 25),
(916, 25),
(917, 25),
(918, 25),
(919, 25),
(920, 25),
(921, 25),
(922, 25),
(923, 25),
(924, 25),
(925, 25),
(926, 25),
(927, 25),
(928, 25),
(929, 25),
(930, 25),
(931, 25),
(932, 25),
(933, 25),
(934, 25),
(935, 25),
(936, 25),
(938, 25),
(940, 25),
(941, 25),
(942, 25),
(943, 25),
(944, 25),
(945, 25),
(946, 25),
(947, 25),
(948, 25),
(949, 25),
(950, 25),
(951, 25),
(952, 25),
(953, 25),
(954, 25),
(955, 25),
(956, 25),
(957, 25),
(958, 25),
(959, 25),
(960, 25),
(961, 25),
(962, 25),
(963, 25),
(964, 25),
(965, 25),
(966, 25),
(967, 25),
(968, 25),
(969, 25),
(970, 25),
(971, 25),
(972, 25),
(973, 25),
(974, 25),
(975, 25),
(976, 25),
(977, 25),
(978, 25),
(979, 25),
(980, 25),
(981, 25),
(982, 25),
(983, 25),
(984, 25),
(985, 25),
(986, 25),
(987, 25),
(988, 25),
(989, 25),
(990, 25),
(991, 25),
(992, 25),
(993, 25),
(994, 25),
(995, 25),
(996, 25),
(997, 25),
(999, 25),
(1001, 25),
(1002, 25),
(1003, 25),
(949, 26),
(950, 26),
(556, 27),
(557, 27),
(558, 27),
(559, 27),
(560, 27),
(561, 27),
(562, 27),
(563, 27),
(564, 27),
(565, 27),
(566, 27),
(567, 27),
(568, 27),
(569, 27),
(570, 27),
(571, 27),
(572, 27),
(573, 27),
(574, 27),
(575, 27),
(576, 27),
(577, 27),
(578, 27),
(579, 27),
(580, 27),
(581, 27),
(582, 27),
(583, 27),
(584, 27),
(585, 27),
(586, 27),
(587, 27),
(588, 27),
(589, 27),
(590, 27),
(591, 27),
(592, 27),
(593, 27),
(594, 27),
(595, 27),
(596, 27),
(597, 27),
(598, 27),
(599, 27),
(600, 27),
(601, 27),
(602, 27),
(603, 27),
(604, 27),
(605, 27),
(606, 27),
(607, 27),
(608, 27),
(609, 27),
(610, 27),
(611, 27),
(612, 27),
(613, 27),
(614, 27),
(615, 27),
(616, 27),
(617, 27),
(618, 27),
(619, 27),
(620, 27),
(621, 27),
(622, 27),
(623, 27),
(624, 27),
(625, 27),
(626, 27),
(627, 27),
(628, 27),
(629, 27),
(630, 27),
(631, 27),
(632, 27),
(633, 27),
(634, 27),
(635, 27),
(636, 27),
(637, 27),
(638, 27),
(639, 27),
(640, 27),
(641, 27),
(642, 27),
(643, 27),
(644, 27),
(645, 27),
(646, 27),
(647, 27),
(648, 27),
(649, 27),
(650, 27),
(651, 27),
(652, 27),
(653, 27),
(654, 27),
(655, 27),
(656, 27),
(657, 27),
(658, 27),
(659, 27),
(660, 27),
(661, 27),
(662, 27),
(663, 27),
(664, 27),
(665, 27),
(666, 27),
(667, 27),
(668, 27),
(669, 27),
(670, 27),
(671, 27),
(672, 27),
(673, 27),
(674, 27),
(675, 27),
(676, 27),
(677, 27),
(678, 27),
(679, 27),
(680, 27),
(681, 27),
(682, 27),
(683, 27),
(684, 27),
(685, 27),
(686, 27),
(687, 27),
(688, 27),
(689, 27),
(690, 27),
(691, 27),
(692, 27),
(693, 27),
(694, 27),
(695, 27),
(696, 27),
(697, 27),
(698, 27),
(699, 27),
(700, 27),
(701, 27),
(702, 27),
(703, 27),
(704, 27),
(705, 27),
(706, 27),
(707, 27),
(708, 27),
(709, 27),
(710, 27),
(711, 27),
(712, 27),
(713, 27),
(714, 27),
(715, 27),
(716, 27),
(717, 27),
(718, 27),
(719, 27),
(720, 27),
(721, 27),
(722, 27),
(723, 27),
(724, 27),
(725, 27),
(726, 27),
(727, 27),
(728, 27),
(729, 27),
(730, 27),
(731, 27),
(732, 27),
(733, 27),
(734, 27),
(735, 27),
(736, 27),
(737, 27),
(738, 27),
(739, 27),
(740, 27),
(741, 27),
(742, 27),
(743, 27),
(744, 27),
(745, 27),
(746, 27),
(747, 27),
(748, 27),
(749, 27),
(750, 27),
(751, 27),
(752, 27),
(753, 27),
(754, 27),
(755, 27),
(756, 27),
(757, 27),
(758, 27),
(759, 27),
(760, 27),
(761, 27),
(762, 27),
(763, 27),
(764, 27),
(765, 27),
(766, 27),
(767, 27),
(768, 27),
(769, 27),
(770, 27),
(771, 27),
(772, 27),
(773, 27),
(774, 27),
(775, 27),
(776, 27),
(777, 27),
(778, 27),
(779, 27),
(780, 27),
(781, 27),
(782, 27),
(783, 27),
(784, 27),
(785, 27),
(786, 27),
(787, 27),
(788, 27),
(789, 27),
(790, 27),
(791, 27),
(792, 27),
(793, 27),
(794, 27),
(795, 27),
(796, 27),
(797, 27),
(798, 27),
(799, 27),
(800, 27),
(801, 27),
(802, 27),
(803, 27),
(804, 27),
(805, 27),
(806, 27),
(807, 27),
(808, 27),
(809, 27),
(810, 27),
(811, 27),
(812, 27),
(813, 27),
(814, 27),
(815, 27),
(816, 27),
(817, 27),
(818, 27),
(819, 27),
(820, 27),
(821, 27),
(822, 27),
(823, 27),
(824, 27),
(825, 27),
(826, 27),
(827, 27),
(828, 27),
(829, 27),
(830, 27),
(831, 27),
(832, 27),
(833, 27),
(834, 27),
(835, 27),
(836, 27),
(837, 27),
(838, 27),
(839, 27),
(840, 27),
(841, 27),
(842, 27),
(843, 27),
(844, 27),
(845, 27),
(846, 27),
(847, 27),
(848, 27),
(849, 27),
(850, 27),
(851, 27),
(852, 27),
(853, 27),
(854, 27),
(855, 27),
(856, 27),
(857, 27),
(858, 27),
(859, 27),
(860, 27),
(861, 27),
(862, 27),
(863, 27),
(864, 27),
(865, 27),
(866, 27),
(867, 27),
(868, 27),
(869, 27),
(870, 27),
(871, 27),
(872, 27),
(873, 27),
(874, 27),
(875, 27),
(876, 27),
(877, 27),
(878, 27),
(879, 27),
(880, 27),
(881, 27),
(882, 27),
(883, 27),
(884, 27),
(885, 27),
(886, 27),
(887, 27),
(888, 27),
(889, 27),
(890, 27),
(891, 27),
(892, 27),
(893, 27),
(894, 27),
(895, 27),
(896, 27),
(897, 27),
(898, 27),
(899, 27),
(900, 27),
(901, 27),
(902, 27),
(903, 27),
(904, 27),
(905, 27),
(906, 27),
(907, 27),
(908, 27),
(909, 27),
(910, 27),
(911, 27),
(912, 27),
(913, 27),
(914, 27),
(915, 27),
(916, 27),
(917, 27),
(918, 27),
(919, 27),
(920, 27),
(921, 27),
(922, 27),
(923, 27),
(924, 27),
(925, 27),
(926, 27),
(927, 27),
(928, 27),
(929, 27),
(930, 27),
(931, 27),
(932, 27),
(934, 27),
(935, 27),
(936, 27),
(938, 27),
(940, 27),
(941, 27),
(942, 27),
(943, 27),
(944, 27),
(945, 27),
(946, 27),
(947, 27),
(948, 27),
(949, 27),
(950, 27),
(951, 27),
(952, 27),
(953, 27),
(954, 27),
(955, 27),
(956, 27),
(957, 27),
(958, 27),
(959, 27),
(960, 27),
(961, 27),
(962, 27),
(963, 27),
(964, 27),
(965, 27),
(966, 27),
(967, 27),
(968, 27),
(969, 27),
(970, 27),
(971, 27),
(972, 27),
(973, 27),
(974, 27),
(975, 27),
(976, 27),
(977, 27),
(978, 27),
(979, 27),
(980, 27),
(981, 27),
(982, 27),
(983, 27),
(984, 27),
(985, 27),
(986, 27),
(987, 27),
(988, 27),
(989, 27),
(990, 27),
(991, 27),
(992, 27),
(993, 27),
(994, 27),
(995, 27),
(996, 27),
(997, 27),
(999, 27),
(1001, 27),
(1002, 27),
(1003, 27);

-- --------------------------------------------------------

--
-- Table structure for table `item_groups`
--

CREATE TABLE IF NOT EXISTS `item_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_category_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `item_groups`
--

INSERT INTO `item_groups` (`id`, `item_category_id`, `name`) VALUES
(1, 1, 'Johnson Pumps'),
(2, 1, 'Tushaco Pumps'),
(3, 1, 'Positive Pumps'),
(4, 1, 'Darling Pumps'),
(5, 1, 'Antico Pumps'),
(6, 1, 'Other Pumps'),
(7, 3, 'BBL Motors'),
(8, 3, 'REMI Motors'),
(12, 2, 'Filters'),
(13, 3, 'Siemens Motors'),
(15, 6, 'Tushaco Spares'),
(16, 6, 'Johnson Spares'),
(17, 6, 'Antico Spares'),
(18, 6, 'Darling Spares'),
(19, 6, 'Positive Spares'),
(20, 6, 'Other Spares'),
(21, 6, 'Motor Spares'),
(22, 7, 'Tushaco Pump with Motor'),
(26, 7, 'Johnson Pump with Motor'),
(27, 7, 'Antico Pump With Motor'),
(28, 7, 'Positive Pump With Motor'),
(29, 5, 'Other Spares'),
(30, 5, 'Others'),
(31, 6, 'Motor Spares'),
(32, 2, 'Filter Element'),
(33, 8, 'Plate Type Heat Exchanger'),
(34, 4, 'Cooling Units'),
(35, 3, 'CGL Motors');

-- --------------------------------------------------------

--
-- Table structure for table `item_ledgers`
--

CREATE TABLE IF NOT EXISTS `item_ledgers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `rate` decimal(15,2) NOT NULL,
  `source_model` varchar(100) NOT NULL,
  `source_id` int(10) NOT NULL,
  `in_out` varchar(100) NOT NULL,
  `processed_on` date NOT NULL,
  `company_id` int(11) NOT NULL,
  `rate_updated` varchar(5) NOT NULL,
  `left_item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=187 ;

--
-- Dumping data for table `item_ledgers`
--

INSERT INTO `item_ledgers` (`id`, `item_id`, `quantity`, `rate`, `source_model`, `source_id`, `in_out`, `processed_on`, `company_id`, `rate_updated`, `left_item_id`) VALUES
(72, 933, 1, '0.00', 'Items', 933, 'In', '2017-03-28', 25, '', 0),
(76, 937, 1, '0.00', 'Items', 937, 'In', '2017-03-28', 25, '', 0),
(78, 939, 1, '0.00', 'Items', 939, 'In', '2017-03-28', 27, '', 0),
(85, 946, NULL, '0.00', 'Items', 946, 'In', '2017-03-29', 25, '', 0),
(88, 949, 0, '0.00', 'Items', 949, 'In', '2017-03-29', 25, '', 0),
(89, 950, 0, '0.00', 'Items', 950, 'In', '2017-03-29', 25, '', 0),
(94, 954, NULL, '0.00', 'Items', 954, 'In', '2017-03-30', 25, '', 0),
(95, 955, NULL, '0.00', 'Items', 955, 'In', '2017-03-30', 25, '', 0),
(100, 960, NULL, '0.00', 'Items', 960, 'In', '2017-03-30', 25, '', 0),
(101, 961, 0, '0.00', 'Items', 961, 'In', '2017-03-30', 25, '', 0),
(102, 962, NULL, '0.00', 'Items', 962, 'In', '2017-03-30', 25, '', 0),
(103, 963, 0, '0.00', 'Items', 963, 'In', '2017-03-30', 25, '', 0),
(104, 964, NULL, '0.00', 'Items', 964, 'In', '2017-03-30', 25, '', 0),
(106, 966, 0, '0.00', 'Items', 966, 'In', '2017-03-30', 25, '', 0),
(107, 967, 0, '0.00', 'Items', 967, 'In', '2017-03-30', 25, '', 0),
(108, 968, NULL, '0.00', 'Items', 968, 'In', '2017-03-30', 25, '', 0),
(109, 969, NULL, '0.00', 'Items', 969, 'In', '2017-03-30', 25, '', 0),
(110, 970, NULL, '0.00', 'Items', 970, 'In', '2017-03-30', 25, '', 0),
(111, 971, NULL, '0.00', 'Items', 971, 'In', '2017-03-30', 25, '', 0),
(114, 974, NULL, '0.00', 'Items', 974, 'In', '2017-03-30', 25, '', 0),
(115, 975, NULL, '0.00', 'Items', 975, 'In', '2017-03-30', 25, '', 0),
(117, 977, NULL, '0.00', 'Items', 977, 'In', '2017-03-30', 25, '', 0),
(118, 978, NULL, '0.00', 'Items', 978, 'In', '2017-03-30', 25, '', 0),
(119, 979, NULL, '0.00', 'Items', 979, 'In', '2017-03-30', 25, '', 0),
(120, 980, NULL, '0.00', 'Items', 980, 'In', '2017-03-30', 25, '', 0),
(121, 981, NULL, '0.00', 'Items', 981, 'In', '2017-03-30', 25, '', 0),
(122, 982, 0, '0.00', 'Items', 982, 'In', '2017-03-31', 25, '', 0),
(123, 983, 0, '0.00', 'Items', 983, 'In', '2017-03-31', 25, '', 0),
(124, 984, 0, '0.00', 'Items', 984, 'In', '2017-03-31', 25, '', 0),
(125, 985, 0, '0.00', 'Items', 985, 'In', '2017-03-31', 25, '', 0),
(126, 986, 0, '0.00', 'Items', 986, 'In', '2017-03-31', 25, '', 0),
(127, 987, NULL, '0.00', 'Items', 987, 'In', '2017-03-31', 25, '', 0),
(131, 708, 2, '0.00', 'Items', 708, 'In', '2017-03-31', 25, '', 0),
(132, 704, 1, '0.00', 'Items', 704, 'In', '2017-03-31', 25, '', 0),
(134, 705, 1, '0.00', 'Items', 705, 'In', '2017-03-31', 25, '', 0),
(135, 706, 1, '0.00', 'Items', 706, 'In', '2017-03-31', 25, '', 0),
(136, 684, 3, '0.00', 'Items', 684, 'In', '2017-03-31', 25, '', 0),
(137, 686, 10, '0.00', 'Items', 686, 'In', '2017-03-31', 25, '', 0),
(138, 690, 2, '0.00', 'Items', 690, 'In', '2017-03-31', 25, '', 0),
(139, 988, 1, '0.00', 'Items', 988, 'In', '2017-03-31', 25, '', 0),
(140, 685, 12, '0.00', 'Items', 685, 'In', '2017-03-31', 25, '', 0),
(141, 738, 1, '0.00', 'Items', 738, 'In', '2017-03-31', 25, '', 0),
(142, 989, 1, '0.00', 'Items', 989, 'In', '2017-03-31', 25, '', 0),
(143, 724, 2, '0.00', 'Items', 724, 'In', '2017-03-31', 25, '', 0),
(144, 682, 4, '0.00', 'Items', 682, 'In', '2017-03-31', 25, '', 0),
(145, 725, 1, '0.00', 'Items', 725, 'In', '2017-03-31', 25, '', 0),
(146, 681, 10, '0.00', 'Items', 681, 'In', '2017-03-31', 25, '', 0),
(147, 732, 1, '0.00', 'Items', 732, 'In', '2017-03-31', 25, '', 0),
(148, 990, 1, '0.00', 'Items', 990, 'In', '2017-03-31', 25, '', 0),
(149, 991, 1, '0.00', 'Items', 991, 'In', '2017-03-31', 25, '', 0),
(150, 727, 2, '0.00', 'Items', 727, 'In', '2017-03-31', 25, '', 0),
(151, 734, 1, '0.00', 'Items', 734, 'In', '2017-03-31', 25, '', 0),
(152, 992, 1, '0.00', 'Items', 992, 'In', '2017-03-31', 25, '', 0),
(153, 723, 1, '0.00', 'Items', 723, 'In', '2017-03-31', 25, '', 0),
(154, 722, 1, '0.00', 'Items', 722, 'In', '2017-03-31', 25, '', 0),
(155, 721, 1, '0.00', 'Items', 721, 'In', '2017-03-31', 25, '', 0),
(156, 693, 1, '0.00', 'Items', 693, 'In', '2017-03-31', 25, '', 0),
(159, 993, 1, '0.00', 'Items', 993, 'In', '2017-03-31', 25, '', 0),
(160, 702, 1, '0.00', 'Items', 702, 'In', '2017-03-31', 25, '', 0),
(161, 994, 2, '0.00', 'Items', 994, 'In', '2017-03-31', 25, '', 0),
(162, 714, 1, '0.00', 'Items', 714, 'In', '2017-03-31', 25, '', 0),
(163, 719, 1, '0.00', 'Items', 719, 'In', '2017-03-31', 25, '', 0),
(167, 720, 1, '0.00', 'Items', 720, 'In', '2017-03-31', 25, '', 0),
(168, 698, 2, '0.00', 'Items', 698, 'In', '2017-03-31', 25, '', 0),
(169, 716, 2, '0.00', 'Items', 716, 'In', '2017-03-31', 25, '', 0),
(171, 995, 1, '0.00', 'Items', 995, 'In', '2017-03-31', 25, '', 0),
(172, 699, 1, '0.00', 'Items', 699, 'In', '2017-03-31', 25, '', 0),
(173, 717, 1, '0.00', 'Items', 717, 'In', '2017-03-31', 25, '', 0),
(174, 695, 4, '0.00', 'Items', 695, 'In', '2017-04-01', 25, '', 0),
(175, 709, 3, '0.00', 'Items', 709, 'In', '2017-04-01', 25, '', 0),
(176, 715, 3, '0.00', 'Items', 715, 'In', '2017-04-01', 25, '', 0),
(178, 703, 1, '0.00', 'Items', 703, 'In', '2017-04-01', 25, '', 0),
(179, 996, NULL, '0.00', 'Items', 996, 'In', '2017-04-01', 25, '', 0),
(180, 997, NULL, '0.00', 'Items', 997, 'In', '2017-04-01', 25, '', 0),
(181, 998, NULL, '0.00', 'Items', 998, 'In', '2017-04-01', 26, '', 0),
(182, 999, NULL, '0.00', 'Items', 999, 'In', '2017-04-01', 25, '', 0),
(183, 1000, NULL, '0.00', 'Items', 1000, 'In', '2017-04-01', 26, '', 0),
(184, 1001, NULL, '0.00', 'Items', 1001, 'In', '2017-04-01', 25, '', 0),
(185, 1002, NULL, '0.00', 'Items', 1002, 'In', '2017-04-01', 25, '', 0),
(186, 1003, NULL, '0.00', 'Items', 1003, 'In', '2017-04-01', 25, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_serial_numbers`
--

CREATE TABLE IF NOT EXISTS `item_serial_numbers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_id` int(10) NOT NULL,
  `serial_no` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `grn_id` int(10) NOT NULL,
  `invoice_id` int(10) NOT NULL,
  `iv_invoice_id` int(10) NOT NULL,
  `q_item_id` int(10) NOT NULL,
  `in_inventory_voucher_id` int(10) NOT NULL,
  `master_item_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=129 ;

--
-- Dumping data for table `item_serial_numbers`
--

INSERT INTO `item_serial_numbers` (`id`, `item_id`, `serial_no`, `status`, `grn_id`, `invoice_id`, `iv_invoice_id`, `q_item_id`, `in_inventory_voucher_id`, `master_item_id`) VALUES
(6, 608, '1234', 'In', 1, 0, 0, 0, 0, 0),
(8, 933, '16746/3/2017', 'In', 0, 0, 0, 0, 0, 933),
(16, 708, 'B111272043', 'In', 0, 0, 0, 0, 0, 708),
(17, 708, 'B111149007', 'In', 0, 0, 0, 0, 0, 708),
(18, 704, 'B111399018', 'In', 0, 0, 0, 0, 0, 704),
(29, 705, 'B111399019', 'In', 0, 0, 0, 0, 0, 705),
(30, 706, 'B111399020', 'In', 0, 0, 0, 0, 0, 706),
(31, 684, 'B111398064', 'In', 0, 0, 0, 0, 0, 684),
(32, 684, 'B111398065', 'In', 0, 0, 0, 0, 0, 684),
(33, 684, 'B111388064', 'In', 0, 0, 0, 0, 0, 684),
(34, 686, 'B111388057', 'In', 0, 0, 0, 0, 0, 686),
(35, 686, 'B111388058', 'In', 0, 0, 0, 0, 0, 686),
(36, 686, 'B111070044', 'In', 0, 0, 0, 0, 0, 686),
(37, 686, 'B111070037', 'In', 0, 0, 0, 0, 0, 686),
(38, 686, 'A111109036', 'In', 0, 0, 0, 0, 0, 686),
(39, 686, 'B111388055', 'In', 0, 0, 0, 0, 0, 686),
(40, 686, 'B111388056', 'In', 0, 0, 0, 0, 0, 686),
(41, 686, 'B111388054', 'In', 0, 0, 0, 0, 0, 686),
(42, 686, 'B111070036', 'In', 0, 0, 0, 0, 0, 686),
(43, 686, 'B111070041', 'In', 0, 0, 0, 0, 0, 686),
(44, 690, 'Y111293038', 'In', 0, 0, 0, 0, 0, 690),
(45, 690, 'Y111293040', 'In', 0, 0, 0, 0, 0, 690),
(46, 988, 'C111625002', 'In', 0, 0, 0, 0, 0, 988),
(47, 685, 'B111070053', 'In', 0, 0, 0, 0, 0, 685),
(48, 685, 'C111152023', 'In', 0, 0, 0, 0, 0, 685),
(49, 685, 'C111152014', 'In', 0, 0, 0, 0, 0, 685),
(50, 685, 'C111152012', 'In', 0, 0, 0, 0, 0, 685),
(51, 685, 'C111152015', 'In', 0, 0, 0, 0, 0, 685),
(52, 685, 'B111070059', 'In', 0, 0, 0, 0, 0, 685),
(53, 685, 'C111152011', 'In', 0, 0, 0, 0, 0, 685),
(54, 685, 'C111152020', 'In', 0, 0, 0, 0, 0, 685),
(55, 685, 'C111152019', 'In', 0, 0, 0, 0, 0, 685),
(56, 685, 'C111152024', 'In', 0, 0, 0, 0, 0, 685),
(57, 685, 'C111152022', 'In', 0, 0, 0, 0, 0, 685),
(58, 685, 'C111152013', 'In', 0, 0, 0, 0, 0, 685),
(59, 738, 'B111272034', 'In', 0, 0, 0, 0, 0, 738),
(60, 989, 'C111270001', 'In', 0, 0, 0, 0, 0, 989),
(61, 724, 'B111272038', 'In', 0, 0, 0, 0, 0, 724),
(62, 724, 'Y111139010', 'In', 0, 0, 0, 0, 0, 724),
(63, 682, 'B111398046', 'In', 0, 0, 0, 0, 0, 682),
(64, 682, 'B111388046', 'In', 0, 0, 0, 0, 0, 682),
(65, 682, 'B111388044', 'In', 0, 0, 0, 0, 0, 682),
(66, 682, 'B111388045', 'In', 0, 0, 0, 0, 0, 682),
(67, 725, 'B111272040', 'In', 0, 0, 0, 0, 0, 725),
(68, 681, 'B111388049', 'In', 0, 0, 0, 0, 0, 681),
(69, 681, 'B111388050', 'In', 0, 0, 0, 0, 0, 681),
(70, 681, 'B111388038', 'In', 0, 0, 0, 0, 0, 681),
(71, 681, 'B111388042', 'In', 0, 0, 0, 0, 0, 681),
(72, 681, 'B111388039', 'In', 0, 0, 0, 0, 0, 681),
(73, 681, 'B111388033', 'In', 0, 0, 0, 0, 0, 681),
(74, 681, 'B111388038', 'In', 0, 0, 0, 0, 0, 681),
(75, 681, 'B111388041', 'In', 0, 0, 0, 0, 0, 681),
(76, 681, 'B111398049', 'In', 0, 0, 0, 0, 0, 681),
(77, 681, 'C111629013', 'In', 0, 0, 0, 0, 0, 681),
(78, 732, 'Z111241009', 'In', 0, 0, 0, 0, 0, 732),
(79, 990, 'Z111300006', 'In', 0, 0, 0, 0, 0, 990),
(80, 991, 'B111272024', 'In', 0, 0, 0, 0, 0, 991),
(81, 727, 'B111399014', 'In', 0, 0, 0, 0, 0, 727),
(82, 727, 'B111399015', 'In', 0, 0, 0, 0, 0, 727),
(83, 734, 'B111399016', 'In', 0, 0, 0, 0, 0, 734),
(84, 992, 'B111399017', 'In', 0, 0, 0, 0, 0, 992),
(85, 723, 'X111088028', 'In', 0, 0, 0, 0, 0, 723),
(86, 722, 'B111399007', 'In', 0, 0, 0, 0, 0, 722),
(87, 721, 'B111272028', 'In', 0, 0, 0, 0, 0, 721),
(88, 693, 'X111127001', 'In', 0, 0, 0, 0, 0, 693),
(96, 993, 'Z111241005', 'In', 0, 0, 0, 0, 0, 993),
(97, 702, 'C111629001', 'In', 0, 0, 0, 0, 0, 702),
(98, 994, 'C111628001', 'In', 0, 0, 0, 0, 0, 994),
(99, 994, 'C111626001', 'In', 0, 0, 0, 0, 0, 994),
(100, 714, 'C111149008', 'In', 0, 0, 0, 0, 0, 714),
(101, 719, 'X111056001', 'In', 0, 0, 0, 0, 0, 719),
(109, 720, 'C111149009', 'In', 0, 0, 0, 0, 0, 720),
(110, 698, 'C1111421010', 'In', 0, 0, 0, 0, 0, 698),
(111, 698, 'C1111421009', 'In', 0, 0, 0, 0, 0, 698),
(112, 716, 'B111272021', 'In', 0, 0, 0, 0, 0, 716),
(113, 716, 'B111272020', 'In', 0, 0, 0, 0, 0, 716),
(115, 995, 'B111272022', 'In', 0, 0, 0, 0, 0, 995),
(116, 699, 'X111088004', 'In', 0, 0, 0, 0, 0, 699),
(117, 717, 'X111088009', 'In', 0, 0, 0, 0, 0, 717),
(118, 695, 'C111149002', 'In', 0, 0, 0, 0, 0, 695),
(119, 695, 'C111149003', 'In', 0, 0, 0, 0, 0, 695),
(120, 695, 'C111149004', 'In', 0, 0, 0, 0, 0, 695),
(121, 695, 'B111399002', 'In', 0, 0, 0, 0, 0, 695),
(122, 709, 'Y111139005', 'In', 0, 0, 0, 0, 0, 709),
(123, 709, 'Y111139003 ', 'In', 0, 0, 0, 0, 0, 709),
(124, 709, 'B111272011', 'In', 0, 0, 0, 0, 0, 709),
(125, 715, 'B111272016', 'In', 0, 0, 0, 0, 0, 715),
(126, 715, 'B111272014', 'In', 0, 0, 0, 0, 0, 715),
(127, 715, 'B111091006', 'In', 0, 0, 0, 0, 0, 715),
(128, 703, 'C111625003 ', 'In', 0, 0, 0, 0, 0, 703);

-- --------------------------------------------------------

--
-- Table structure for table `item_sources`
--

CREATE TABLE IF NOT EXISTS `item_sources` (
  `item_id` int(10) NOT NULL,
  `source_id` int(10) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `purchased` varchar(100) NOT NULL,
  `purchase_manufactured` varchar(100) NOT NULL,
  PRIMARY KEY (`item_id`,`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item_sub_groups`
--

CREATE TABLE IF NOT EXISTS `item_sub_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_category_id` int(10) NOT NULL,
  `item_group_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=72 ;

--
-- Dumping data for table `item_sub_groups`
--

INSERT INTO `item_sub_groups` (`id`, `item_category_id`, `item_group_id`, `name`) VALUES
(1, 1, 1, 'Combinorm Pump'),
(2, 1, 1, 'Combichem Pump'),
(3, 1, 1, 'Multistage Pumps'),
(4, 3, 7, 'BBL STD TEFC Motors'),
(5, 3, 8, 'REMI STD TEFC Motors'),
(6, 3, 7, 'BBL IE Motors'),
(7, 1, 2, 'Gear Pumps'),
(8, 1, 2, 'Three Screw Pumps'),
(9, 1, 2, 'Twin Screw Pumps'),
(10, 1, 2, 'Single Screw Pumps'),
(11, 6, 16, 'KGEN Spares'),
(13, 6, 16, 'Combinorm Pump Spares'),
(14, 6, 16, 'Valve Assembly'),
(15, 6, 17, 'NZ Pump Spares'),
(16, 6, 17, 'EXP Pumps Spares'),
(17, 6, 15, 'Three Screw Pump Spares'),
(18, 6, 15, 'Twin Screw Pump Spares'),
(19, 6, 15, 'Single Screw Pump Spares'),
(20, 6, 15, 'Gear Pump Spares'),
(21, 1, 1, 'KGEN Pumps'),
(22, 7, 22, 'RT Pump With Motor'),
(23, 2, 12, 'SS Rollers Oil'),
(24, 1, 3, 'Electronic Dosing Pump'),
(25, 6, 16, 'Combichem Pump Spares'),
(27, 7, 27, 'NZ Pump With Motor'),
(28, 7, 26, 'CCR Pump With Motor'),
(29, 6, 16, 'Johnson Multistage Spares'),
(30, 7, 26, 'KGEN Pump With Motor'),
(31, 1, 3, 'Hydraulic Diaphragm Pump'),
(32, 1, 3, 'Mechanical Diaphragm Pump'),
(33, 6, 17, 'HE Pump Spares'),
(36, 7, 26, 'Multistage With Motor'),
(37, 5, 29, 'Coupling'),
(38, 5, 30, 'Others'),
(39, 6, 31, 'Motor Spares'),
(40, 2, 12, 'Filters'),
(42, 2, 32, 'Filter Element'),
(43, 5, 30, 'Consumables'),
(44, 8, 33, 'Tranter PHE'),
(45, 4, 34, 'Cooling Units'),
(46, 7, 27, 'NS Pump With Motor'),
(47, 7, 22, 'RT Pump With Motor'),
(48, 1, 3, 'Plunger Type Dosing Pump'),
(52, 1, 4, 'Waste Water Pump'),
(53, 1, 4, 'Jumbo Pumps'),
(54, 1, 4, 'Unclog Pumps'),
(55, 1, 2, 'Tushaco Centrifugal Pump'),
(56, 1, 2, 'Shuttle Block Pumps'),
(57, 3, 35, 'CGL FLP Motors'),
(58, 3, 35, 'CGL STD TEFC Motors'),
(59, 1, 5, 'NZ Series Pump'),
(60, 1, 5, 'NS Series Pump'),
(61, 1, 1, 'Combibloc Pump'),
(62, 7, 26, 'Combinorm Pump With Motor'),
(63, 7, 26, 'Combichem Pump With Motor'),
(64, 1, 4, 'Little Jumbo Pumps'),
(65, 1, 4, 'Sinco Bloc Pump'),
(66, 7, 28, 'Hydraulic Diaphragm Pump'),
(67, 1, 1, 'Top Gear Pumps'),
(68, 6, 18, 'Waste Water Pump Spares'),
(69, 7, 26, 'FRE Pump With Motor'),
(70, 6, 19, 'HD 2017 Pump Spares'),
(71, 6, 19, 'HD 1011 Pump Spares');

-- --------------------------------------------------------

--
-- Table structure for table `job_cards`
--

CREATE TABLE IF NOT EXISTS `job_cards` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sales_order_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  `jc1` varchar(10) NOT NULL,
  `jc2` varchar(10) NOT NULL,
  `jc3` varchar(10) NOT NULL,
  `jc4` varchar(10) NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_on` date NOT NULL,
  `customer_id` int(10) NOT NULL,
  `dispatch_destination` varchar(255) NOT NULL,
  `customer_po_no` varchar(10) NOT NULL,
  `required_date` date NOT NULL,
  `packing` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `job_card_rows`
--

CREATE TABLE IF NOT EXISTS `job_card_rows` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `job_card_id` int(10) NOT NULL,
  `sales_order_row_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `journal_vouchers`
--

CREATE TABLE IF NOT EXISTS `journal_vouchers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `voucher_no` varchar(10) NOT NULL,
  `created_on` date NOT NULL,
  `transaction_date` date NOT NULL,
  `narration` text NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `edited_on` date NOT NULL,
  `edited_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `journal_voucher_rows`
--

CREATE TABLE IF NOT EXISTS `journal_voucher_rows` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `journal_voucher_id` int(10) NOT NULL,
  `ledger_account_id` int(10) NOT NULL,
  `cr_dr` varchar(10) NOT NULL,
  `amount` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE IF NOT EXISTS `leave_types` (
  `id` int(10) NOT NULL,
  `leave_name` varchar(100) NOT NULL,
  `maximum_leave_in_month` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `leave_name`, `maximum_leave_in_month`) VALUES
(0, 'Casual Leave', '1.25');

-- --------------------------------------------------------

--
-- Table structure for table `ledgers`
--

CREATE TABLE IF NOT EXISTS `ledgers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_date` date NOT NULL,
  `ledger_account_id` int(10) NOT NULL,
  `debit` decimal(18,2) NOT NULL,
  `credit` decimal(18,2) NOT NULL,
  `voucher_id` int(10) NOT NULL,
  `voucher_source` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `ledgers`
--

INSERT INTO `ledgers` (`id`, `transaction_date`, `ledger_account_id`, `debit`, `credit`, `voucher_id`, `voucher_source`, `company_id`) VALUES
(33, '2017-04-01', 399, '0.00', '771700.00', 0, 'Opening Balance', 25),
(34, '2017-04-01', 400, '0.00', '3620029.47', 0, 'Opening Balance', 25),
(35, '2017-04-01', 401, '0.00', '3464263.00', 0, 'Opening Balance', 25),
(36, '2017-04-01', 402, '0.00', '1135420.00', 0, 'Opening Balance', 25),
(37, '2017-04-01', 403, '0.00', '263741.00', 0, 'Opening Balance', 25),
(38, '2017-04-01', 147, '0.00', '250244.40', 0, 'Opening Balance', 25),
(39, '2017-04-01', 149, '0.00', '643170.50', 0, 'Opening Balance', 25),
(40, '2017-04-01', 406, '0.00', '380233.31', 0, 'Opening Balance', 25),
(41, '2017-04-01', 404, '0.00', '5576200.91', 0, 'Opening Balance', 25),
(42, '2017-04-01', 405, '0.00', '844740.34', 0, 'Opening Balance', 25),
(43, '2017-04-01', 408, '0.00', '65531.68', 0, 'Opening Balance', 25),
(44, '2017-04-01', 407, '0.00', '24000.00', 0, 'Opening Balance', 25),
(45, '2017-04-01', 409, '0.00', '13450.00', 0, 'Opening Balance', 25),
(46, '2017-04-01', 411, '0.00', '40147.00', 0, 'Opening Balance', 25),
(47, '2017-04-01', 413, '0.00', '71428.00', 0, 'Opening Balance', 25),
(48, '2017-04-01', 412, '0.00', '176240.00', 0, 'Opening Balance', 25);

-- --------------------------------------------------------

--
-- Table structure for table `ledger_accounts`
--

CREATE TABLE IF NOT EXISTS `ledger_accounts` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `account_second_subgroup_id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `source_model` varchar(255) NOT NULL,
  `source_id` int(10) NOT NULL,
  `bill_to_bill_account` varchar(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=414 ;

--
-- Dumping data for table `ledger_accounts`
--

INSERT INTO `ledger_accounts` (`id`, `account_second_subgroup_id`, `name`, `alias`, `source_model`, `source_id`, `bill_to_bill_account`, `company_id`) VALUES
(4, 1, 'Jagdish', '', 'Employees', 2, 'Yes', 0),
(16, 5, 'Output Sales Tax VAT', '', '', 0, '', 0),
(17, 5, 'Output Sales Tax CST', '', '', 0, '', 0),
(18, 5, 'SaleTax - 14.5', '', 'SaleTax', 1, '', 0),
(19, 5, 'SaleTax - 5.5', '', 'SaleTax', 2, '', 0),
(20, 5, 'SaleTax - 0', '', 'SaleTax', 3, '', 0),
(21, 5, 'SaleTax - 2', '', 'SaleTax', 4, '', 0),
(22, 10, 'Jagdish Salvi', '', 'Employees', 4, '', 25),
(23, 2, 'Hindustan Zinc Ltd', 'Dariba Smelter Complex', 'Customers', 1, 'Yes', 25),
(24, 1, 'Jagdish Salvi', '', 'Employees', 5, '', 0),
(25, 2, 'Ultratech Cement Ltd', 'Unit-Aditya Cement Works', 'Customers', 2, 'Yes', 25),
(26, 2, 'JK Laxmi Cement Ltd', 'JK Laxmi Cement Ltd', 'Customers', 3, 'Yes', 25),
(27, 2, 'Shree Cement Ltd', 'Shree Cement Ltd Unit 1', 'Customers', 4, 'Yes', 25),
(28, 2, 'Trinetra Cement Ltd', 'The India Cement', 'Customers', 5, 'Yes', 25),
(29, 1, 'Harshit Patel', '', 'Employees', 6, '', 0),
(30, 10, 'Harshit Patel', '', 'Employees', 7, '', 25),
(31, 10, 'Jitendra Singh Jhala', '', 'Employees', 8, '', 25),
(32, 10, 'Usha Mali', '', 'Employees', 9, '', 25),
(33, 2, 'Ultratech Cement Limited', 'Unit: Vikram Cement Works', 'Customers', 6, 'Yes', 25),
(34, 13, 'VAT Purchases', '', 'Ledger Account', 0, '', 0),
(35, 14, 'CST Purchases', '', 'Ledger Account', 0, '', 25),
(36, 9, 'Fright Amount', '', 'Ledger Account', 0, '', 0),
(37, 8, 'Sales Income', '', 'Ledger Account', 0, '', 25),
(38, 2, 'Adani Power Rajasthan Ltd', 'Adani Power Rajasthan Ltd', 'Customers', 7, 'Yes', 25),
(39, 1, 'Shriram Rayons', 'Shriram Rayons', 'Customers', 8, 'Yes', 25),
(40, 2, 'Mangalam Cement Ltd', 'Mangalam Cement Ltd', 'Customers', 9, 'Yes', 25),
(41, 2, 'Sutlej Textiles and Industries Limited', 'Sutlej Textiles and Industries Limited', 'Customers', 10, 'Yes', 25),
(42, 11, 'Priya', '', 'Employees', 10, '', 0),
(43, 2, 'Ambuja Cements Limited', 'Unit-Rabriyawas', 'Customers', 11, 'Yes', 25),
(44, 10, 'Pushpendra Nath Chauhan', '', 'Employees', 11, '', 25),
(45, 10, 'Vikram Singh ', '', 'Employees', 12, '', 25),
(46, 10, 'Bhopal Singh Jhala', '', 'Employees', 13, '', 25),
(47, 2, 'Hindustan Zinc Ltd.', 'Sindesar Khurd Mine', 'Customers', 12, 'Yes', 25),
(48, 1, 'Hindustan Zinc Ltd', '', 'Customers', 13, 'Yes', 25),
(49, 2, 'Hindustan Zinc Ltd', '', 'Customers', 14, 'No', 25),
(50, 2, 'J.K. Cement Works Mangrol', 'Unit of J.K. Cement Ltd.', 'Customers', 15, 'Yes', 25),
(51, 2, 'Hindustan Zinc Ltd', 'Haridwar Zinc Plant', 'Customers', 16, 'Yes', 25),
(52, 10, 'Reena Khandelwal', '', 'Employees', 14, '', 25),
(53, 2, 'Hindustan Zinc Ltd', 'Rajpura Dariba Mines', 'Customers', 17, 'Yes', 25),
(54, 2, 'Hindustan Zinc Ltd', 'Chanderia Smelter Complex (CPP)', 'Customers', 18, 'Yes', 25),
(55, 2, 'Hindustan Zinc Ltd', 'Unit-Pyro', 'Customers', 19, 'Yes', 25),
(56, 2, 'Hindustan Zinc ltd', 'Zinc Smelter Debari', 'Customers', 20, 'Yes', 25),
(57, 2, 'Hindustan Zinc Ltd', 'CPP Zawar Mines', 'Customers', 21, 'Yes', 25),
(58, 2, 'Ultratech Cement Limited', 'Unit-Birla White', 'Customers', 22, 'Yes', 25),
(59, 2, 'Ultratech Cement Limited', 'Unit-Sewagram Cement Works', 'Customers', 23, 'Yes', 25),
(60, 2, 'Ultratech Cement Limited', 'Unit-Bathinda Cement Works', 'Customers', 24, 'Yes', 25),
(61, 2, 'Ultratech Cement Limited', 'Unit-Awarpur Cement Works', 'Customers', 25, 'Yes', 25),
(62, 2, 'Ultratech Cement Limited', 'Unit-Kotputli Cement Works', 'Customers', 26, 'Yes', 25),
(63, 2, 'Shree Cement Limited', 'Unit -RAS', 'Customers', 29, 'Yes', 25),
(64, 2, 'Shree Raipur Cement Plant', 'Unit-Shree Cement Ltd', 'Customers', 30, 'Yes', 25),
(65, 2, 'Shree Cement Unit Panipat', 'Panipat', 'Customers', 31, 'Yes', 25),
(66, 2, 'RSWM Limited', 'Power Plant', 'Customers', 32, '', 25),
(67, 2, 'RSWM Limited', 'Unit:-LNJ Denim', 'Customers', 33, 'Yes', 25),
(68, 2, 'RSWM Limited', 'Unit-Rishabhdev', 'Customers', 34, 'Yes', 25),
(69, 2, 'Cavendish Industries Limited', 'Cavendish Industries Limited', 'Customers', 35, 'Yes', 25),
(70, 10, 'Mohammed Arif', '', 'Employees', 15, '', 26),
(71, 2, 'BMD Pvt Ltd', 'BMD ', 'Customers', 36, 'Yes', 25),
(72, 2, 'Ginni international Ltd.', 'Ginni international Ltd.', 'Customers', 37, 'Yes', 25),
(73, 2, 'Shriram Fertilisers & Chemicals', 'Shriram Fertilisers & Chemicals', 'Customers', 38, 'Yes', 25),
(74, 2, 'J.K.CEMENT WORKS MANGROL', '', 'Customers', 39, 'Yes', 25),
(75, 11, 'Anshul Mogra', '', 'Employees', 16, '', 25),
(76, 4, 'SPX Flow Technology Pvt. Ltd.', '', 'Vendors', 1, '', 0),
(77, 2, 'Maharaja Shree Umaid Mills Ltd', 'Maharaja Shree Umaid Mills Ltd', 'Customers', 40, 'Yes', 25),
(78, 2, 'Banawara Syntex Limited', 'Unit BTM', 'Customers', 41, 'Yes', 25),
(79, 2, 'Udaipur Cement Works Ltd', 'Unit of JK Laxmi Cement', 'Customers', 42, 'Yes', 25),
(80, 2, 'Neyveli Lignite Corporation Limited', 'NLC', 'Customers', 43, 'Yes', 25),
(81, 4, 'Mechneers India', '', 'Vendors', 2, '', 0),
(82, 4, 'Tushaco Pumps Pvt Ltd ', '', 'Vendors', 3, '', 0),
(83, 4, 'Antico Equipment Pvt Ltd ', '', 'Vendors', 5, '', 0),
(84, 4, 'Positive Metering Pumps Pvt Ltd ', '', 'Vendors', 6, '', 0),
(85, 2, 'Wonder Cement Ltd.', 'Nimbahera', 'Customers', 44, 'Yes', 25),
(86, 2, 'Sangam (India) Limited', 'Spinning Unit -I', 'Customers', 45, 'Yes', 25),
(87, 2, 'RSWM Limited', 'Unit-Gulabpura', 'Customers', 46, 'Yes', 25),
(88, 2, 'Lafarge India Pvt.Ltd. ', 'Lafarge India Pvt.Ltd. ', 'Customers', 47, 'Yes', 25),
(89, 2, 'Jindal Saw Ltd.', 'Jindal Saw Ltd.', 'Customers', 48, 'Yes', 25),
(90, 2, 'Kalisindh Thermal Power Project ', 'KTPP-RRVUNL', 'Customers', 49, 'Yes', 25),
(91, 2, 'Chhabra Thermal Power Project', 'CTPS-RRVUNL', 'Customers', 50, 'Yes', 25),
(92, 2, 'Parle Biscuit Pvt. Ltd. ', 'Parle Biscuit Pvt. Ltd. ', 'Customers', 51, 'Yes', 25),
(93, 2, 'United Spirits Limited ', 'Unit- Alwar', 'Customers', 52, 'Yes', 25),
(94, 2, 'United Spirits Ltd.', 'Unit- Udaipur', 'Customers', 53, 'Yes', 25),
(95, 2, 'Balkrishna Industries Ltd.', 'Unit-Chopanki', 'Customers', 54, 'Yes', 25),
(96, 2, 'Balkrishna Industries Ltd.', 'Unit-Bhiwadi', 'Customers', 55, 'Yes', 25),
(97, 2, 'Sabmiller India Ltd.', 'Unit-Rochees Breweries', 'Customers', 56, 'Yes', 25),
(98, 2, 'Shriram Axiall', 'Shriram Polytech', 'Customers', 57, 'Yes', 25),
(99, 4, 'Darling Pumps Pvt. Ltd. ', '', 'Vendors', 7, '', 0),
(100, 16, 'VAT Paid Purchases', '', 'Ledger Account', 0, '', 25),
(101, 17, 'Purchase Thela Bhada', '', 'Ledger Account', 0, '', 25),
(102, 2, 'J K Tyre & Industries Ltd.', 'J K Tyre & Industries Ltd.', 'Customers', 58, 'Yes', 25),
(103, 17, 'Purchase Freight', '', 'Ledger Account', 0, '', 25),
(104, 17, 'Purchase Other Expenses', '', 'Ledger Account', 0, '', 25),
(105, 18, 'Sales Thela Bhada', '', 'Ledger Account', 0, '', 25),
(106, 18, 'Sales Freight Expenses', '', 'Ledger Account', 0, '', 25),
(107, 18, 'Sales Promotion', '', 'Ledger Account', 0, '', 25),
(108, 18, 'Exhibition & Seminar Expenses', '', 'Ledger Account', 0, '', 25),
(109, 18, 'Guest Entertainment Expenses', '', 'Ledger Account', 0, '', 25),
(110, 4, 'Remi Elektrotechnik Limited', '', 'Vendors', 8, '', 0),
(111, 18, 'Sales Commission', '', 'Ledger Account', 0, '', 25),
(112, 19, 'Professional & Membership Expenses', '', 'Ledger Account', 0, '', 25),
(113, 20, 'Communication Staff Expenses', '', 'Ledger Account', 0, '', 25),
(114, 19, 'Electricity Expenses', '', 'Ledger Account', 0, '', 25),
(115, 19, 'Rent Expenses', '', 'Ledger Account', 0, '', 25),
(116, 19, 'Water Expenses', '', 'Ledger Account', 0, '', 25),
(117, 19, 'Printing & Stationary Expenses', '', 'Ledger Account', 0, '', 25),
(118, 19, 'Depreciation of Fixed Assets', '', 'Ledger Account', 0, '', 25),
(119, 19, 'Repair & Maintenance Expenses', '', 'Ledger Account', 0, '', 25),
(120, 20, 'Salary & Wages', '', 'Ledger Account', 0, '', 25),
(121, 21, 'Directors Remuneration', '', 'Ledger Account', 0, '', 25),
(122, 21, 'Communication Director Expenses', '', 'Ledger Account', 0, '', 25),
(123, 21, 'Local Conveyance Director Expenses', '', 'Ledger Account', 0, '', 25),
(124, 20, 'Local Conveyance Staff Expenses', '', 'Ledger Account', 0, '', 25),
(125, 19, 'Travelling Expenses', '', 'Ledger Account', 0, '', 25),
(126, 19, 'Postage & Courier Expenses', '', 'Ledger Account', 0, '', 25),
(127, 20, 'Staff Welfare Expenses', '', 'Ledger Account', 0, '', 25),
(128, 2, 'Sanjeev Traders', 'Sanjeev Traders', 'Customers', 59, 'Yes', 25),
(129, 20, 'LTA Expenses', '', 'Ledger Account', 0, '', 25),
(130, 20, 'Mecical Expenses', '', 'Ledger Account', 0, '', 25),
(131, 19, 'Late Delivery Expenses', '', 'Ledger Account', 0, '', 25),
(132, 19, 'Legal Expenses', '', 'Ledger Account', 0, '', 25),
(133, 22, 'Bank Charges', '', 'Ledger Account', 0, '', 25),
(134, 19, 'Office Expenses', '', 'Ledger Account', 0, '', 25),
(135, 19, 'Other Office Expenses', '', 'Ledger Account', 0, '', 25),
(136, 4, 'Liqtech Industries', '', 'Vendors', 9, '', 0),
(137, 22, 'Interest on OD Limit', '', 'Ledger Account', 0, '', 25),
(138, 22, 'Interest Paid', '', 'Ledger Account', 0, '', 25),
(139, 22, 'Interest on Unsecured Loan', '', 'Ledger Account', 0, '', 25),
(140, 23, 'Interest Received', '', 'Ledger Account', 0, '', 25),
(141, 25, 'Sales Commission Received', '', 'Ledger Account', 0, '', 25),
(142, 24, 'SBBJ STL Bank', '', 'Ledger Account', 0, '', 25),
(143, 24, 'SBBJ SML Bank', '', 'Ledger Account', 0, '', 25),
(144, 24, 'SBBJ FMSL Bank', '', 'Ledger Account', 0, '', 25),
(145, 24, 'Union Bank of India Bank', '', 'Ledger Account', 0, '', 25),
(146, 26, 'Kotak Mahindra Bank', '', 'Ledger Account', 0, '', 25),
(147, 27, 'ICICI Bank Loan Account', '', 'Ledger Account', 0, '', 25),
(148, 2, 'Birla Corporation Limited', 'Unit-Birla cement Works', 'Customers', 60, 'Yes', 25),
(149, 27, 'HDFC Bank Loan Account', '', 'Ledger Account', 0, '', 25),
(150, 28, 'Petty Cash', '', 'Ledger Account', 0, '', 25),
(151, 29, 'Plant & Machinery', '', 'Ledger Account', 0, '', 25),
(152, 30, 'Laptop, Computer & Printers', '', 'Ledger Account', 0, '', 25),
(153, 30, 'Office Furniture', '', 'Ledger Account', 0, '', 25),
(154, 4, 'Tranter India Pvt. Ltd. ', '', 'Vendors', 10, '', 0),
(155, 30, 'Office Equipment', '', 'Ledger Account', 0, '', 25),
(156, 31, 'Vehicle ', '', 'Ledger Account', 0, '', 25),
(157, 4, 'Filter Concept Pvt. Ltd. ', '', 'Vendors', 11, '', 0),
(158, 2, 'Chambal Fertilisers And Chemicals Limited', 'Chambal Fertilisers And Chemicals Limited', 'Customers', 61, 'Yes', 25),
(159, 0, 'name', '', 'source_model', 0, 'bill_to_bi', 0),
(160, 13, 'VAT Purchases', '', 'Ledger Account', 0, '', 26),
(161, 14, 'CST Purchases', '', 'Ledger Account', 0, '', 26),
(162, 9, 'Fright Amount', '', 'Ledger Account', 0, '', 26),
(163, 8, 'Sales Income', '', 'Ledger Account', 0, '', 26),
(164, 16, 'VAT Paid Purchases', '', 'Ledger Account', 0, '', 26),
(165, 17, 'Purchase Thela Bhada', '', 'Ledger Account', 0, '', 26),
(166, 17, 'Purchase Freight', '', 'Ledger Account', 0, '', 26),
(167, 17, 'Purchase Other Expenses', '', 'Ledger Account', 0, '', 26),
(168, 18, 'Sales Thela Bhada', '', 'Ledger Account', 0, '', 26),
(169, 18, 'Sales Freight Expenses', '', 'Ledger Account', 0, '', 26),
(170, 18, 'Sales Promotion', '', 'Ledger Account', 0, '', 26),
(171, 18, 'Exhibition & Seminar Expenses', '', 'Ledger Account', 0, '', 26),
(172, 18, 'Guest Entertainment Expenses', '', 'Ledger Account', 0, '', 26),
(173, 18, 'Sales Commission', '', 'Ledger Account', 0, '', 26),
(174, 19, 'Professional & Membership Expenses', '', 'Ledger Account', 0, '', 26),
(175, 20, 'Communication Staff Expenses', '', 'Ledger Account', 0, '', 26),
(176, 19, 'Electricity Expenses', '', 'Ledger Account', 0, '', 26),
(177, 19, 'Rent Expenses', '', 'Ledger Account', 0, '', 26),
(178, 19, 'Water Expenses', '', 'Ledger Account', 0, '', 26),
(179, 19, 'Printing & Stationary Expenses', '', 'Ledger Account', 0, '', 26),
(180, 19, 'Depreciation of Fixed Assets', '', 'Ledger Account', 0, '', 26),
(181, 19, 'Repair & Maintenance Expenses', '', 'Ledger Account', 0, '', 26),
(182, 20, 'Salary & Wages', '', 'Ledger Account', 0, '', 26),
(183, 21, 'Directors Remuneration', '', 'Ledger Account', 0, '', 26),
(184, 21, 'Communication Director Expenses', '', 'Ledger Account', 0, '', 26),
(185, 21, 'Local Conveyance Director Expenses', '', 'Ledger Account', 0, '', 26),
(186, 20, 'Local Conveyance Staff Expenses', '', 'Ledger Account', 0, '', 26),
(187, 19, 'Travelling Expenses', '', 'Ledger Account', 0, '', 26),
(188, 19, 'Postage & Courier Expenses', '', 'Ledger Account', 0, '', 26),
(189, 20, 'Staff Welfare Expenses', '', 'Ledger Account', 0, '', 26),
(190, 20, 'LTA Expenses', '', 'Ledger Account', 0, '', 26),
(191, 20, 'Mecical Expenses', '', 'Ledger Account', 0, '', 26),
(192, 19, 'Late Delivery Expenses', '', 'Ledger Account', 0, '', 26),
(193, 19, 'Legal Expenses', '', 'Ledger Account', 0, '', 26),
(194, 22, 'Bank Charges', '', 'Ledger Account', 0, '', 26),
(195, 19, 'Office Expenses', '', 'Ledger Account', 0, '', 26),
(196, 19, 'Other Office Expenses', '', 'Ledger Account', 0, '', 26),
(197, 22, 'Interest on OD Limit', '', 'Ledger Account', 0, '', 26),
(198, 22, 'Interest Paid', '', 'Ledger Account', 0, '', 26),
(199, 22, 'Interest on Unsecured Loan', '', 'Ledger Account', 0, '', 26),
(200, 23, 'Interest Received', '', 'Ledger Account', 0, '', 26),
(201, 25, 'Sales Commission Received', '', 'Ledger Account', 0, '', 26),
(202, 24, 'SBBJ STL Bank', '', 'Ledger Account', 0, '', 26),
(203, 24, 'SBBJ SML Bank', '', 'Ledger Account', 0, '', 26),
(204, 24, 'SBBJ FMSL Bank', '', 'Ledger Account', 0, '', 26),
(205, 24, 'Union Bank of India Bank', '', 'Ledger Account', 0, '', 26),
(206, 26, 'Kotak Mahindra Bank', '', 'Ledger Account', 0, '', 26),
(207, 27, 'ICICI Bank Loan Account', '', 'Ledger Account', 0, '', 26),
(208, 27, 'HDFC Bank Loan Account', '', 'Ledger Account', 0, '', 26),
(209, 28, 'Petty Cash', '', 'Ledger Account', 0, '', 26),
(210, 29, 'Plant & Machinery', '', 'Ledger Account', 0, '', 26),
(211, 30, 'Laptop, Computer & Printers', '', 'Ledger Account', 0, '', 26),
(212, 30, 'Office Furniture', '', 'Ledger Account', 0, '', 26),
(213, 30, 'Office Equipment', '', 'Ledger Account', 0, '', 26),
(214, 31, 'Vehicle ', '', 'Ledger Account', 0, '', 26),
(271, 2, 'Lucid Colloid Ltd.', 'Lucid Colloid Ltd.', 'Customers', 62, 'Yes', 25),
(272, 2, 'Kota Super Thermal Power Plant ', 'KSTPS-RRVUNL', 'Customers', 63, 'Yes', 25),
(273, 2, 'United Breweries Limited', 'Unit- Chopanki', 'Customers', 64, 'Yes', 25),
(274, 2, 'Carlsberg India Pvt. Ltd.', 'Carlsberg India Pvt. Ltd.', 'Customers', 65, 'Yes', 25),
(275, 2, 'RSWM Limited', 'Unit- Mandpam', 'Customers', 66, 'Yes', 25),
(276, 10, 'Jagdish Salvi', '', 'Employees', 4, '', 26),
(277, 10, 'Jagdish Salvi', '', 'Employees', 4, '', 27),
(278, 2, 'H.S. Engineering & Marketing', 'H.S. Engineering & Marketing', 'Customers', 67, 'Yes', 25),
(279, 10, 'Jitendra Singh Jhala', '', 'Employees', 8, '', 26),
(280, 10, 'Jitendra Singh Jhala', '', 'Employees', 8, '', 27),
(281, 10, 'Usha Mali', '', 'Employees', 9, '', 26),
(282, 10, 'Usha Mali', '', 'Employees', 9, '', 27),
(283, 11, 'Priya', '', 'Employees', 10, '', 26),
(284, 11, 'Priya', '', 'Employees', 10, '', 27),
(285, 10, 'Pushpendra Nath Chauhan', '', 'Employees', 11, '', 26),
(286, 10, 'Pushpendra Nath Chauhan', '', 'Employees', 11, '', 27),
(287, 10, 'Vikram Singh', '', 'Employees', 12, '', 26),
(288, 10, 'Vikram Singh', '', 'Employees', 12, '', 27),
(289, 10, 'Bhopal Singh Jhala', '', 'Employees', 13, '', 26),
(290, 10, 'Bhopal Singh Jhala', '', 'Employees', 13, '', 27),
(291, 2, 'Suratgarh Super thermal Power Station', 'SSTPS-RRVUNL', 'Customers', 68, 'Yes', 25),
(292, 10, 'Reena Khandelwal', '', 'Employees', 14, '', 26),
(293, 10, 'Reena Khandelwal', '', 'Employees', 14, '', 27),
(294, 10, 'Mohammed Arif', '', 'Employees', 15, '', 25),
(295, 10, 'Mohammed Arif', '', 'Employees', 15, '', 27),
(296, 11, 'Anshul Mogra', '', 'Employees', 16, '', 26),
(297, 11, 'Anshul Mogra', '', 'Employees', 16, '', 27),
(298, 2, 'United Breweries Ltd.-Dharuhera', 'Unit-Dharuhera', 'Customers', 69, 'Yes', 25),
(299, 2, 'Honda Cars India Pvt. Ltd.', 'Honda Cars India Pvt. Ltd.', 'Customers', 70, 'Yes', 25),
(300, 2, 'Wasser Technochem (India) Ltd.', 'Wasser Technochem (India) Ltd.', 'Customers', 71, 'Yes', 25),
(301, 2, 'Bhavik Terryfab', 'Unit of KG Petrochem Limited', 'Customers', 72, 'Yes', 25),
(302, 2, 'Rajasthan Liquors Ltd', 'Rajasthan Liquors Ltd', 'Customers', 73, 'Yes', 25),
(303, 2, 'Varun Breverages Ltd.', 'Varun Breverages Ltd.', 'Customers', 74, 'Yes', 25),
(304, 2, 'Nissin Brake India Pvt. Ltd.', 'Nissin Brake India Pvt. Ltd.', 'Customers', 75, 'Yes', 25),
(305, 2, 'Saint Gobain Glass India Ltd.', 'Saint Gobain Glass India Ltd.', 'Customers', 76, 'Yes', 25),
(306, 2, 'Kajaria Ceramics Ltd.', 'Kajaria Ceramics Ltd.', 'Customers', 77, 'Yes', 25),
(307, 0, 'name', '', 'source_model', 0, 'bill_to_bi', 0),
(308, 13, 'VAT Purchases', '', 'Ledger Account', 0, '', 27),
(309, 14, 'CST Purchases', '', 'Ledger Account', 0, '', 27),
(310, 9, 'Fright Amount', '', 'Ledger Account', 0, '', 27),
(311, 8, 'Sales Income', '', 'Ledger Account', 0, '', 27),
(312, 16, 'VAT Paid Purchases', '', 'Ledger Account', 0, '', 27),
(313, 17, 'Purchase Thela Bhada', '', 'Ledger Account', 0, '', 27),
(314, 17, 'Purchase Freight', '', 'Ledger Account', 0, '', 27),
(315, 17, 'Purchase Other Expenses', '', 'Ledger Account', 0, '', 27),
(316, 18, 'Sales Thela Bhada', '', 'Ledger Account', 0, '', 27),
(317, 18, 'Sales Freight Expenses', '', 'Ledger Account', 0, '', 27),
(318, 18, 'Sales Promotion', '', 'Ledger Account', 0, '', 27),
(319, 18, 'Exhibition & Seminar Expenses', '', 'Ledger Account', 0, '', 27),
(320, 18, 'Guest Entertainment Expenses', '', 'Ledger Account', 0, '', 27),
(321, 18, 'Sales Commission', '', 'Ledger Account', 0, '', 27),
(322, 19, 'Professional & Membership Expenses', '', 'Ledger Account', 0, '', 27),
(323, 20, 'Communication Staff Expenses', '', 'Ledger Account', 0, '', 27),
(324, 19, 'Electricity Expenses', '', 'Ledger Account', 0, '', 27),
(325, 19, 'Rent Expenses', '', 'Ledger Account', 0, '', 27),
(326, 19, 'Water Expenses', '', 'Ledger Account', 0, '', 27),
(327, 19, 'Printing & Stationary Expenses', '', 'Ledger Account', 0, '', 27),
(328, 19, 'Depreciation of Fixed Assets', '', 'Ledger Account', 0, '', 27),
(329, 19, 'Repair & Maintenance Expenses', '', 'Ledger Account', 0, '', 27),
(330, 20, 'Salary & Wages', '', 'Ledger Account', 0, '', 27),
(331, 21, 'Directors Remuneration', '', 'Ledger Account', 0, '', 27),
(332, 21, 'Communication Director Expenses', '', 'Ledger Account', 0, '', 27),
(333, 21, 'Local Conveyance Director Expenses', '', 'Ledger Account', 0, '', 27),
(334, 20, 'Local Conveyance Staff Expenses', '', 'Ledger Account', 0, '', 27),
(335, 19, 'Travelling Expenses', '', 'Ledger Account', 0, '', 27),
(336, 19, 'Postage & Courier Expenses', '', 'Ledger Account', 0, '', 27),
(337, 20, 'Staff Welfare Expenses', '', 'Ledger Account', 0, '', 27),
(338, 20, 'LTA Expenses', '', 'Ledger Account', 0, '', 27),
(339, 20, 'Mecical Expenses', '', 'Ledger Account', 0, '', 27),
(340, 19, 'Late Delivery Expenses', '', 'Ledger Account', 0, '', 27),
(341, 19, 'Legal Expenses', '', 'Ledger Account', 0, '', 27),
(342, 22, 'Bank Charges', '', 'Ledger Account', 0, '', 27),
(343, 19, 'Office Expenses', '', 'Ledger Account', 0, '', 27),
(344, 19, 'Other Office Expenses', '', 'Ledger Account', 0, '', 27),
(345, 22, 'Interest on OD Limit', '', 'Ledger Account', 0, '', 27),
(346, 22, 'Interest Paid', '', 'Ledger Account', 0, '', 27),
(347, 22, 'Interest on Unsecured Loan', '', 'Ledger Account', 0, '', 27),
(348, 23, 'Interest Received', '', 'Ledger Account', 0, '', 27),
(349, 25, 'Sales Commission Received', '', 'Ledger Account', 0, '', 27),
(350, 24, 'SBBJ STL Bank', '', 'Ledger Account', 0, '', 27),
(351, 24, 'SBBJ SML Bank', '', 'Ledger Account', 0, '', 27),
(352, 24, 'SBBJ FMSL Bank', '', 'Ledger Account', 0, '', 27),
(353, 24, 'Union Bank of India Bank', '', 'Ledger Account', 0, '', 27),
(354, 26, 'Kotak Mahindra Bank', '', 'Ledger Account', 0, '', 27),
(355, 27, 'ICICI Bank Loan Account', '', 'Ledger Account', 0, '', 27),
(356, 27, 'HDFC Bank Loan Account', '', 'Ledger Account', 0, '', 27),
(357, 28, 'Petty Cash', '', 'Ledger Account', 0, '', 27),
(358, 29, 'Plant & Machinery', '', 'Ledger Account', 0, '', 27),
(359, 30, 'Laptop, Computer & Printers', '', 'Ledger Account', 0, '', 27),
(360, 30, 'Office Furniture', '', 'Ledger Account', 0, '', 27),
(361, 30, 'Office Equipment', '', 'Ledger Account', 0, '', 27),
(362, 31, 'Vehicle ', '', 'Ledger Account', 0, '', 27),
(363, 2, 'Adani Wilmar Ltd.', 'Unit- Alwar', 'Customers', 78, 'Yes', 25),
(364, 2, 'Jaquar & Company Pvt. Ltd.', 'Jaquar & Co. Pvt. Ltd.(Bhiwadi)', 'Customers', 79, 'Yes', 25),
(365, 2, 'Siegwerk India Pvt. Ltd.', 'Siegwerk India Pvt. Ltd.', 'Customers', 80, 'Yes', 25),
(366, 2, 'Crystal Chemicals & Engineers', 'Crystal Chemicals & Engineers', 'Customers', 81, 'Yes', 25),
(367, 2, 'Hindustan Zinc Limited ', '', 'Customers', 82, 'Yes', 25),
(368, 2, 'Hindustan Zinc Ltd', 'Rampura Agucha Mines', 'Customers', 83, 'Yes', 25),
(369, 2, 'Dabur India Limited-Alwar Unit', 'Unit-Alwar', 'Customers', 84, 'Yes', 25),
(370, 2, 'Sika India Pvt. Ltd.', 'Sika India Pvt. Ltd.', 'Customers', 85, 'Yes', 25),
(371, 2, 'Shree Cement Ltd', 'Nachi Technology India Pvt Ltd ', 'Customers', 86, 'Yes', 25),
(372, 2, 'Nachi Technology India Pvt Ltd ', 'Nachi Technology India Pvt Ltd ', 'Customers', 86, 'Yes', 25),
(373, 2, 'J.K White Cement Works ', '', 'Customers', 87, 'Yes', 25),
(374, 2, 'J.K White Cement Works ', 'Unit of JK Cement Ltd. ', 'Customers', 88, 'Yes', 25),
(375, 2, 'Ajanta Polymer (P) lTD.', 'Ajanta Polymer (P) lTD.', 'Customers', 89, 'Yes', 25),
(376, 2, 'Daikin Airconditioning India Pvt. Ltd. ', 'Daikin Airconditioning India Pvt. Ltd. ', 'Customers', 90, 'Yes', 25),
(377, 2, 'Vintage Distillers Ltd.', 'Vintage Distillers Ltd.', 'Customers', 91, 'Yes', 25),
(378, 2, 'Rajshree Pilp And Board Mills Pvt. Ltd.', 'Rajshree Pilp And Board Mills Pvt. Ltd.', 'Customers', 92, 'Yes', 25),
(379, 2, 'Sodexo Food Solution India Pvt. Ltd', '(Jodhpur)', 'Customers', 93, 'Yes', 27),
(380, 2, 'A.H. Corporation', 'A.H. Corporation', 'Customers', 94, 'Yes', 27),
(381, 2, 'Hindustan Zinc Ltd', 'Hydro -I ,Unit II', 'Customers', 95, 'Yes', 25),
(382, 2, 'RSPL', 'RSPL ( Sagar Unit II For OBA)', 'Customers', 96, 'Yes', 27),
(383, 2, 'Rajasthan Rajya Vidhyut Utpadan Ltd', '(Banswara)', 'Customers', 97, 'Yes', 25),
(384, 2, 'Adani Wilmar Ltd.', 'Unit-Bundi', 'Customers', 98, 'Yes', 25),
(385, 2, 'Manglam Cement Limited', 'Manglam Cement Limited', 'Customers', 99, 'Yes', 25),
(386, 2, 'Advantage Oils Pvt. Ltd.', 'Advantage Oils Pvt. Ltd.', 'Customers', 100, 'Yes', 25),
(387, 2, 'Advantage Oils Pvt. Ltd.', 'Advantage Oils Pvt. Ltd.', 'Customers', 101, 'Yes', 25),
(388, 2, 'Mahesh Edible Oil Industries Ltd.', 'Mahesh Edible Oil Industries Ltd.', 'Customers', 102, 'Yes', 25),
(389, 2, 'ACC Limited', 'Unit-Lakheri Cement  Works', 'Customers', 103, 'Yes', 25),
(390, 2, 'Ruchi Soya Industries Ltd.', 'Ruchi Soya Industries Ltd.', 'Customers', 104, 'Yes', 25),
(391, 2, 'K.S.Oils Limited', 'K.S.Oils Limited', 'Customers', 105, 'Yes', 25),
(392, 2, 'Khilari Infrastructure Pvt. Ltd.', 'Khilari Infrastructure Pvt. Ltd.', 'Customers', 106, 'Yes', 27),
(393, 2, 'Shriram Cement Works ', 'Shriram Cement Works ', 'Customers', 107, 'Yes', 27),
(394, 2, 'KEI Industries Limited ', 'Kei Industries Limited', 'Customers', 108, 'Yes', 25),
(395, 2, 'Juneja Wires Pvt. Ltd.', 'Juneja Wires Pvt. Ltd.', 'Customers', 109, 'Yes', 27),
(396, 2, 'Shree Cement Ltd.,', '(Khushkhera Cement Grinding Project)', 'Customers', 110, 'Yes', 25),
(397, 2, 'Cattle Feed Plant ', 'A Unit of Rajasthan Dairy Federation Limited', 'Customers', 111, 'Yes', 25),
(398, 2, 'Sigma Electric Mfg Corp (P) Ltd.', 'Sigma Electric Mfg Corp (P) Ltd.', 'Customers', 112, 'Yes', 25),
(399, 32, 'Share Capital', '', 'Ledger Account', 0, '', 25),
(400, 33, 'Reserves & Surplus', '', 'Ledger Account', 0, '', 25),
(401, 11, 'Unsecured Loan - Anshul Mogra', '', 'Ledger Account', 0, '', 25),
(402, 11, 'Unsecured Loan - K S Mogra', '', 'Ledger Account', 0, '', 25),
(403, 12, 'Unsecured Loan - Rajendra Mehta', '', 'Ledger Account', 0, '', 25),
(404, 37, 'Anshul Mogra Current Account', '', 'Ledger Account', 0, '', 25),
(405, 37, 'K S Mogra Current Account', '', 'Ledger Account', 0, '', 25),
(406, 37, 'Priya Mogra Current Account', '', 'Ledger Account', 0, '', 25),
(407, 38, 'Provision for Audit Fees', '', 'Ledger Account', 0, '', 25),
(408, 38, 'Provision for Sales Tax', '', 'Ledger Account', 0, '', 25),
(409, 38, 'Provision for Turnover Incentive', '', 'Ledger Account', 0, '', 25),
(410, 2, 'RSPL', 'Sagar Unit II For OBA', 'Customers', 113, 'Yes', 27),
(411, 38, 'Provision for Staff Sales Commission', '', 'Ledger Account', 0, '', 25),
(412, 39, 'Lakshmi Enterprises', '', 'Ledger Account', 0, '', 25),
(413, 39, 'Ludhiana Refrigeration', '', 'Ledger Account', 0, '', 25);

-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

CREATE TABLE IF NOT EXISTS `logins` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `logins`
--

INSERT INTO `logins` (`id`, `employee_id`, `username`, `password`, `status`) VALUES
(1, 1, 'admin', 'admin', 'Active'),
(2, 4, 'jagdish', 'jagdish', 'Active'),
(3, 5, 'jagdishs', 'jagdishs', 'Active'),
(4, 8, 'jitendra Singh Jhala', 'mogragroup', 'Active'),
(5, 9, 'usha ', 'usha', 'Active'),
(6, 7, 'harshit', 'harshit', 'Active'),
(7, 10, 'priya', 'ayirp', 'Active'),
(8, 11, 'pushpendra', 'pushpendra', 'Active'),
(9, 12, 'vikram', 'vikram', 'Active'),
(10, 13, 'bhopal', 'bhopal', 'Active'),
(11, 14, 'reena', 'reena', 'Active'),
(12, 15, 'Mohammed ', 'arifmo12', 'Active'),
(13, 16, 'anshul', 'anshul', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `material_indents`
--

CREATE TABLE IF NOT EXISTS `material_indents` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `created_on` date NOT NULL,
  `created_by` int(10) NOT NULL,
  `mi_number` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `material_indents`
--

INSERT INTO `material_indents` (`id`, `company_id`, `created_on`, `created_by`, `mi_number`) VALUES
(1, 25, '2017-03-23', 16, '1');

-- --------------------------------------------------------

--
-- Table structure for table `material_indent_rows`
--

CREATE TABLE IF NOT EXISTS `material_indent_rows` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `material_indent_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `required_quantity` int(10) NOT NULL,
  `processed_quantity` int(10) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Open',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `material_indent_rows`
--

INSERT INTO `material_indent_rows` (`id`, `material_indent_id`, `item_id`, `required_quantity`, `processed_quantity`, `status`) VALUES
(3, 1, 608, 1, 0, 'Open');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controller` varchar(100) NOT NULL,
  `action` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

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
(20, 'UserRights', 'Add');

-- --------------------------------------------------------

--
-- Table structure for table `payment_breakups`
--

CREATE TABLE IF NOT EXISTS `payment_breakups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ref_type` varchar(30) NOT NULL,
  `new_ref_no` varchar(100) DEFAULT NULL,
  `invoice_booking_id` int(10) NOT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `payment_voucher_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_vouchers`
--

CREATE TABLE IF NOT EXISTS `payment_vouchers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `voucher_no` varchar(10) NOT NULL,
  `created_on` date NOT NULL,
  `transaction_date` date NOT NULL,
  `paid_to_id` int(10) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `cash_bank_account_id` int(10) NOT NULL,
  `narration` text NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `cheque_no` varchar(25) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `edited_by` int(10) NOT NULL,
  `edited_on` date NOT NULL,
  `advance_amount` decimal(10,2) NOT NULL,
  `receipt_type` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `petty_cash_receipt_vouchers`
--

CREATE TABLE IF NOT EXISTS `petty_cash_receipt_vouchers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `voucher_no` varchar(10) NOT NULL,
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
  `edited_on` date NOT NULL,
  `cheque_no` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE IF NOT EXISTS `purchase_orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) NOT NULL,
  `vendor_id` int(10) NOT NULL,
  `shipping_method` varchar(100) NOT NULL,
  `shipping_terms` int(5) NOT NULL,
  `delivery_date` date NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `terms_conditions` text NOT NULL,
  `po1` varchar(10) NOT NULL,
  `po2` int(10) NOT NULL,
  `po3` varchar(10) NOT NULL,
  `po4` varchar(10) NOT NULL,
  `discount` decimal(5,2) NOT NULL,
  `discount_per` decimal(5,2) NOT NULL,
  `pnf` varchar(100) NOT NULL,
  `pnf_type` varchar(5) NOT NULL,
  `excise_duty` varchar(50) NOT NULL,
  `descryption` varchar(255) NOT NULL,
  `grand_total` decimal(18,2) NOT NULL,
  `material_to_be_transported` varchar(255) NOT NULL,
  `delivery` varchar(255) NOT NULL,
  `lr_to_be_prepared_in_favour_of` varchar(255) NOT NULL,
  `payment_terms` varchar(255) NOT NULL,
  `road_permit_form47` varchar(255) NOT NULL,
  `transporter_id` int(10) NOT NULL,
  `sale_tax_per` decimal(4,2) NOT NULL,
  `created_by` int(10) NOT NULL,
  `date_created` date NOT NULL,
  `customer_id` int(10) NOT NULL,
  `discount_type` varchar(5) NOT NULL,
  `sale_tax_description` text NOT NULL,
  `is_exceise_for_customer` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_rows`
--

CREATE TABLE IF NOT EXISTS `purchase_order_rows` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `purchase_order_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `processed_quantity` int(5) NOT NULL DEFAULT '0',
  `height` int(3) NOT NULL,
  `pull_status` varchar(20) NOT NULL DEFAULT 'Direct',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE IF NOT EXISTS `quotations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `customer_address` text NOT NULL,
  `employee_id` int(10) NOT NULL,
  `item_group_id` int(10) NOT NULL,
  `finalisation_date` date NOT NULL,
  `customer_for_attention` varchar(100) NOT NULL,
  `customer_contact_no` varchar(200) NOT NULL,
  `enquiry_no` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `text` text NOT NULL,
  `additional_note` text NOT NULL,
  `terms_conditions` text NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Pending',
  `company_id` int(10) NOT NULL,
  `qt1` varchar(10) NOT NULL,
  `qt2` int(10) NOT NULL,
  `qt3` varchar(10) NOT NULL,
  `qt4` varchar(10) NOT NULL,
  `created_by` int(10) NOT NULL,
  `edited_by` int(10) NOT NULL,
  `created_on` date NOT NULL,
  `edited_on` date NOT NULL,
  `reason` varchar(200) NOT NULL,
  `closing_date` date NOT NULL,
  `revision` int(10) NOT NULL,
  `quotation_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=55 ;

--
-- Dumping data for table `quotations`
--

INSERT INTO `quotations` (`id`, `customer_id`, `customer_address`, `employee_id`, `item_group_id`, `finalisation_date`, `customer_for_attention`, `customer_contact_no`, `enquiry_no`, `subject`, `text`, `additional_note`, `terms_conditions`, `total`, `status`, `company_id`, `qt1`, `qt2`, `qt3`, `qt4`, `created_by`, `edited_by`, `created_on`, `edited_on`, `reason`, `closing_date`, `revision`, `quotation_id`) VALUES
(1, 55, 'SP-923, RICCO Phase-III, \r\nP.O.Bhiwadi-301019', 15, 4, '2017-03-28', 'Mr. Manoj Gupta ', '8058998578', 'Your varbel enquiry dated 01.03.2017', 'Submersible Sewage pump Offer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '<ol><li>Price Basis &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: Ex-Our Works Udaipur</li><li>Packing &amp; Forwarding &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: Extra @ 2%</li><li>Sales Tax &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: Vat Extra @ 5.5% </li><li>Excise Duty : Extra as applicable</li><li>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially Clear PO.</li><li>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to claim from your insurance company.</li><li>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.</li><li style="text-align: justify; ">Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly Interchange ability with original equipment is confirmed and any manufacturing defect is covered.</li><li>Discount :  @ 5%</li><li>Validity :30 Days.</li></ol>', '99000.00', 'Pending', 25, 'STL', 1, 'BE-2839', '16-17', 16, 0, '2017-03-18', '0000-00-00', '', '0000-00-00', 0, 1),
(2, 5, '(Formerly Indo Zinc Ltd)\r\n(A Subsidiary of The India Cements Ltd)\r\nPost Wajwana\r\nBanswara -327025', 11, 1, '2017-04-12', 'Gajendra Chauhan', '0296230151', 'As telephonic discussed dt.: 25/03/2017', 'Offer for JOHNSON make Pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'Scope of Supply: Bare Pump', '<p>Price Basis : Ex-Our Works Udaipur</p><p>Packing &amp; Forwarding : Inclusive</p><p>Sales Tax : Vat Extra @ 5.5% </p><p>Excise Duty : Extra as applicable</p><p>Delivery : Within 4 to 6 weeks from date of receipt of Techno-Commercially Clear PO.</p><p>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to claim from your insurance company.</p><p>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.</p><p>Warranty : For Pump &nbsp;Standard As Provided By Manufacturer To Be Free From Defects In Both Material &amp; Workmanship For A Period Of 12 Months From Date Of Installation Or 18 Months From Date Of Supply Whichever Is Earlier. Provided The Motor/Pump Is Installed As Per Instructions. We Shall Not Be Liable For Any Loss And Or Consequential Damages Due To Breakdown Of The Equipment Either For Repair Purpose Or Otherwise.&nbsp;</p><p>Validity : 30 Days.</p>', '55500.00', 'Pending', 25, 'STL', 2, 'BE-2977', '16-17', 4, 0, '2017-03-25', '0000-00-00', '', '0000-00-00', 0, 2),
(3, 36, 'Post Box No 35\r\nLNJ Nagar , Mordi\r\nBanswara ( Raj)', 4, 26, '2017-04-15', 'Mr. R/Nilesh Shah', '9982232902', 'Indent 7464 /7498', 'Offer for Johnson Pump with motor', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'Scope of Supply: \r\nPump with IE2 three phase  BBL / REMI make motor with coupling, \r\ncoupling guard, Foundation Bolt ,Base frame duly assemble.\r\n', '<p>Price Basis : Ex-Our Works Udaipur</p><p>Packing &amp; Forwarding : Extra @ 2%</p><p>Sales Tax : Vat Extra @ 5.5% </p><p>Excise Duty : Extra as applicable</p><p>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially Clear PO.</p><p>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to claim from your insurance company.</p><p>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.</p><p>Warranty : For Pump &amp; Motors\r\nStandard As Provided By Manufacturer To Be Free From Defects In Both Material &amp; Workmanship For A Period Of 12 Months From Date Of Installation Or 18 Months From Date Of Supply Whichever Is Earlier. Provided The Motor/Pump Is Installed As Per Instructions. We Shall Not Be Liable For Any Loss And Or Consequential Damages Due To Breakdown Of The Equipment Either For Repair Purpose Or Otherwise. Winding Failures Is Not Covered Under Warranty. \r\nFor Spare\r\nOnly Interchange Ability With Original Equipment Is Confirmed And Any Manufacturing Defect Is Covered.</p><p>Validity : 30 Days.</p>', '129890.00', 'Pending', 25, 'STL', 3, 'BE-2681', '16-17', 4, 0, '2017-03-25', '0000-00-00', '', '0000-00-00', 0, 3),
(4, 40, 'Pali-Marwar-306401\r\nRajastahn', 4, 26, '2017-04-12', 'Mr. Tapasvi Vaidya', '9001099411', 'Enquiry 16181', 'Offer for Johnson Pump With Motor', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'Scope of Supply :\r\nPrice for pump with REMI / BBL Make STD. Foot mounted motor,\r\nLove Joy Coupling, Coupling Guard MS Base Frame\r\n(Motorised Unit)\r\n', '<p>Price Basis : Transporter Godown Pali</p><p>Packing &amp; Forwarding : Inclusive</p><p>Sales Tax : Vat Extra @ 5.5% </p><p>Excise Duty : Extra as applicable</p><p>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially Clear PO.</p><p>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to claim from your insurance company.</p><p>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.</p><p>Warranty : For Pump &amp; Motors\r\nStandard As Provided By Manufacturer To Be Free From Defects In Both Material &amp; Workmanship For A Period Of 12 Months From Date Of Installation Or 18 Months From Date Of Supply Whichever Is Earlier. Provided The Motor/Pump Is Installed As Per Instructions. We Shall Not Be Liable For Any Loss And Or Consequential Damages Due To Breakdown Of The Equipment Either For Repair Purpose Or Otherwise. Winding Failures Is Not Covered Under Warranty. \r\nFor Spare\r\nOnly Interchange Ability With Original Equipment Is Confirmed And Any Manufacturing Defect Is Covered.</p><p>Discount :  @ 7.5%</p><p>Validity : 30 Days.</p>', '58500.00', 'Converted Into Sales Order', 25, 'STL', 4, 'BE-3250', '16-17', 4, 0, '2017-03-25', '0000-00-00', '', '0000-00-00', 0, 4),
(5, 1, 'Dariba Smelter Complex\r\nRajpura Dariba Mines\r\nDist.: Rajsamand (Raj.)\r\nPin no- 313211', 4, 1, '2017-04-12', 'Debasish Chakladar', '8003097090', 'Pump for DSC', 'Offer for Johnson Pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '  Scope of Supply: Bare Pump', '<ol><li style="text-align: justify; ">Price Basis : Ex-Our Works Udaipur</li><li style="text-align: justify;">Packing &amp; Forwarding : Inclusive</li><li style="text-align: justify;">Sales Tax : Vat Extra @ 5.5% </li><li style="text-align: justify;">Excise Duty : Extra as applicable</li><li style="text-align: justify;">Delivery : Within 6 to 8 weeks from date of receipt of Techno-Commercially Clear PO.</li><li style="text-align: justify;">Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to claim from your insurance company.</li><li style="text-align: justify;">Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.</li><li style="text-align: justify;">Warranty : For Pump &amp; Motors\r\nStandard As Provided By Manufacturer To Be Free From Defects In Both Material &amp; Workmanship For A Period Of 12 Months From Date Of Installation Or 18 Months From Date Of Supply Whichever Is Earlier. Provided The Motor/Pump Is Installed As Per Instructions. We Shall Not Be Liable For Any Loss And Or Consequential Damages Due To Breakdown Of The Equipment Either For Repair Purpose Or Otherwise. Winding Failures Is Not Covered Under Warranty. \r\nFor Spare\r\nOnly Interchange Ability With Original Equipment Is Confirmed And Any Manufacturing Defect Is Covered.</li><li style="text-align: justify;">Validity : 30 Days.</li></ol>', '123000.00', 'Pending', 25, 'STL', 5, 'BE-3251', '16-17', 16, 0, '2017-03-25', '0000-00-00', '', '0000-00-00', 0, 5),
(6, 12, 'Sindesar Khurd Mine\r\nP.O. Dariba\r\nDistt. Rajsamand', 11, 4, '2017-04-12', 'Purva Pancholi', '8003093638', 'RFQ-PR-1610001589 & 1100100683 : Requirement of PuRFQ-PR-1610001589 & 1100100683 : Requirement of Pu', 'Offer for Darling / Johnson Pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'Note: Price are same as per previous supply against Purchase order for \r\nItem no 1 PO No 2000038800/4100087135 Dt. 22.02.17 \r\nItem No 2 PO No. 2000035433/4100084684 Dt. 30.09.16\r\n', '<p>Price Basis : Ex-Our Works Udaipur</p><p>Packing &amp; Forwarding : Inclusive</p><p>Sales Tax : CST Extra @ 2% against form C .</p><p>Excise Duty : Extra as applicable</p><p>Delivery : Within 8 to 10 weeks from date of receipt of Techno-Commercially Clear PO.</p><p>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to claim from your insurance company.</p><p>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.</p><p style="text-align: justify; ">Warranty : For Pump &amp; Motors\r\nStandard As Provided By Manufacturer To Be Free From Defects In Both Material &amp; Workmanship For A Period Of 12 Months From Date Of Installation Or 18 Months From Date Of Supply Whichever Is Earlier. Provided The Motor/Pump Is Installed As Per Instructions. We Shall Not Be Liable For Any Loss And Or Consequential Damages Due To Breakdown Of The Equipment Either For Repair Purpose Or Otherwise. Winding Failures Is Not Covered Under Warranty. \r\nFor Spare\r\nOnly Interchange Ability With Original Equipment Is Confirmed And Any Manufacturing Defect Is Covered.</p><p>Validity : 30 Days.</p>', '65270.00', 'Pending', 25, 'STL', 6, 'BE-3156', '16-17', 16, 0, '2017-03-25', '0000-00-00', '', '0000-00-00', 0, 6),
(7, 33, 'Unit:-LNJ Denim\r\nPost Box No 28\r\nLNJ Nagar Mordi\r\nBanswara-327001 (Raj.)', 11, 26, '2017-04-13', 'Mr. BM Pathak', '2961131661', 'RFQ for Slef Priming PumpRFQ for Slef Priming PumpRFQ for Slef Priming Pump', 'Offer for Johnson Pump With Motor', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '<p>Price Basis : Ex-Our  Works Udaipur .</p><p>Packing &amp; Forwarding : Inclusive</p><p>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.</p><p>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.</p><p>Delivery : Within 6 to 8 weeks from date of receipt of Techno-Commercially clear PO.</p><p>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.</p><p>Payment : Strictly within 15 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.</p><p>Warranty : For Pump &amp; Motors Standard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty.&nbsp;</p><p>Validity : 30 Days.</p>', '93400.00', 'Pending', 25, 'STL', 7, 'BE-3362', '16-17', 4, 0, '2017-03-25', '0000-00-00', '', '0000-00-00', 0, 7),
(8, 93, 'C-17,Panchwati Colony\r\nNear Bhaskar Circle,\r\nRatanada , Jodhpur -342001', 4, 1, '2017-03-27', 'Mangesh Kawade', '7742505505', 'Enquiry for Pump', 'Offer for Johnson Pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'Scope of Supply : Bare Pump', '<p>Price Basis : Ex-Our Works Udaipur</p><p>Packing &amp; Forwarding : NIL</p><p>Sales Tax : Vat Extra @ 5.5% </p><p>Excise Duty : Not applicalbe</p><p>Delivery : Ready Stock</p><p>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to claim from your insurance company.</p><p>Payment : 100 % Advance at the time of Dispatch.</p><p>Warranty : For Pump &amp; Motors\r\nStandard As Provided By Manufacturer To Be Free From Defects In Both Material &amp; Workmanship For A Period Of 12 Months From Date Of Installation Or 18 Months From Date Of Supply Whichever Is Earlier. Provided The Motor/Pump Is Installed As Per Instructions. We Shall Not Be Liable For Any Loss And Or Consequential Damages Due To Breakdown Of The Equipment Either For Repair Purpose Or Otherwise. Winding Failures Is Not Covered Under Warranty. \r\nFor Spare\r\nOnly Interchange Ability With Original Equipment Is Confirmed And Any Manufacturing Defect Is Covered.</p><p>Discount :  @ 5%</p><p>Validity : 30 Days.</p>', '35540.00', 'Converted Into Sales Order', 27, 'FMSL', 1, 'BE-3247', '16-17', 4, 0, '2017-03-27', '0000-00-00', '', '0000-00-00', 0, 8),
(9, 32, 'Power Plant\r\nLNJ Nagar\r\nVillage :Mordi\r\nBanswara-327001 (Raj.)', 11, 17, '2017-04-07', 'Mr. Parveen Rawan', '9413357059', 'Enquiry No.:  12660 dated 25-03-2017', 'Offer for Mechanical Seal of ANTICO pump', 'We thank you for your valued enquiry for spares, We being authorised dealers for ANTICO Pumps are pleased to submit our offer as under :- \r\n\r\n', 'You may placed Repeat PO as per last PO No.: L 120292 dt. : 12.06.2012 \r\n\r\n', 'Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Rs. 150 &nbsp;for Courier Charges<br>Sales Tax : VAT "14.5 %   or as applicable on date of dispatch.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 15 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Validity : 30 Days.<br>', '19000.00', 'Pending', 25, 'STL', 8, 'BE-2959', '16-17', 11, 0, '2017-03-28', '0000-00-00', '', '0000-00-00', 0, 9),
(10, 53, 'United Spirits Ltd.\r\nUdaisagar Road,\r\nUdaipur-313003', 15, 1, '2017-04-18', 'Mr. Bhavesh Pandya', '2942492333', 'As per your verbal enquiry.', 'Quote for Jhonson pump.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', 'Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>', '22000.00', 'Pending', 25, 'STL', 9, 'BE-2454', '16-17', 12, 0, '2017-03-28', '0000-00-00', '', '0000-00-00', 0, 10),
(11, 65, 'Carlsberg India Pvt. Ltd.\r\nPlot# SP1 to & B5 to 8 Agro Park, M.I.A. (Extensio )\r\nAlwar-301030 (Raj.)', 15, 1, '2017-04-20', 'Mr. Amit Yadav', '8266921599', 'As per your email enquiry dated 29.11.2016', 'Qoute for johnson pump.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', 'Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>', '225000.00', 'Pending', 25, 'STL', 10, 'BE-2748', '16-17', 12, 0, '2017-03-28', '0000-00-00', '', '0000-00-00', 0, 11),
(12, 65, 'Plot# SP1 to & B5 to 8 Agro Park, M.I.A. (Extension )\r\nAlwar-301030 (Raj.)', 15, 1, '2017-04-20', 'Mr. Amit Yadav', '8266921599', 'As per your email enquiry dated 29.11.2016', 'Qoute for johnson pump.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '\r\n					Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>\r\n				', '225000.00', 'Pending', 25, 'STL', 10, 'BE-2748', '16-17', 12, 0, '2017-03-28', '0000-00-00', '', '0000-00-00', 1, 11),
(13, 53, 'Udaisagar Road,\r\nUdaipur-313003', 15, 1, '2017-04-18', 'Mr. Bhavesh Pandya', '7742200666', 'As per your verbal enquiry.', 'Quote for Jhonson pump.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '<ol><li style="text-align: justify;">Price Basis : Ex-Our  Works Udaipur .</li><li style="text-align: justify;">Packing &amp; Forwarding : Extra @ 2%</li><li style="text-align: justify;">Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.</li><li style="text-align: justify;">Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.</li><li style="text-align: justify;">Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.</li><li style="text-align: justify;">Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.</li><li style="text-align: justify;">Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise.&nbsp;</li><li style="text-align: justify;">Validity : 30 Days.</li></ol>', '22000.00', 'Pending', 25, 'STL', 9, 'BE-2454', '16-17', 15, 0, '2017-03-28', '0000-00-00', '', '0000-00-00', 1, 10),
(14, 70, 'SPL 1, Tapukara Industrial Area, Khuskhera-301707\r\nDistt-Alwar', 15, 5, '2017-04-20', 'Mr. Shivender Pandey', '8800283377', 'As per your verbal enquiry.', 'Quote for Antico pump.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', 'Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>', '50000.00', 'Pending', 25, 'STL', 11, 'BE-3255', '16-17', 12, 0, '2017-03-28', '0000-00-00', '', '0000-00-00', 0, 14),
(15, 55, 'SP-923, RICCO Phase-III, P.O.Bhiwadi-301019', 15, 4, '2017-04-18', 'Mr. Manoj Gupta', '1493220075', 'As per your verbal enquiry.', 'Quote for Darling pump.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', 'Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>', '100000.00', 'Pending', 25, 'STL', 12, 'BE-2839', '16-17', 12, 0, '2017-03-28', '0000-00-00', '', '0000-00-00', 0, 15),
(16, 74, 'Plot No. SP 290-292, RICCO Industrial Area, Phase-VII, Chopanki,Bhiwadi,\r\nAlwar-301019', 15, 1, '2017-04-20', 'Mr. Nitin Tiwari', '1493302765', 'As per your verbal enquiry. ', 'Quote for Johnson pump.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', 'Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>', '75000.00', 'Pending', 25, 'STL', 13, 'BE-3272', '16-17', 12, 0, '2017-03-28', '0000-00-00', '', '0000-00-00', 0, 16),
(17, 59, '7J 4,RC Vyas Colony,\r\nBhilwara', 15, 1, '2017-04-18', 'Mr. Sanjeev Ji', '9351734430', 'As per your verbal enquiry.', 'Quote for Johnson pump.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', 'Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>', '44000.00', 'Pending', 25, 'STL', 14, 'BE-3148', '16-17', 12, 0, '2017-03-28', '0000-00-00', '', '0000-00-00', 0, 17),
(18, 65, 'Plot# SP1 to & B5 to 8 \r\nAgro Park, \r\nM.I.A. (Extension )\r\nAlwar-301030 (Raj.)', 15, 1, '2017-04-20', 'Mr. Amit Yadav', '8266921599', 'As per your email enquiry dated 29.11.2016', 'Qoute for johnson pump.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '<ol><li style="text-align: justify;">Price Basis : Ex-Our  Works Udaipur .</li><li style="text-align: justify;">Packing &amp; Forwarding : Extra @  %</li><li style="text-align: justify;">Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.</li><li style="text-align: justify;">Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.</li><li style="text-align: justify;">Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.</li><li style="text-align: justify;">Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.</li><li style="text-align: justify;">Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.</li><li style="text-align: justify;">Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.</li><li style="text-align: justify;">Discount :  @ % on quoted price.</li><li style="text-align: justify;">Validity : 30 Days.</li></ol>\r\n				\r\n				', '225000.00', 'Pending', 25, 'STL', 10, 'BE-2748', '16-17', 12, 0, '2017-03-28', '0000-00-00', '', '0000-00-00', 2, 11),
(19, 59, '7J 4,RC Vyas Colony,\r\nBhilwara', 15, 1, '2017-04-18', 'Mr. Sanjeev Ji', '9351734430', 'As per your verbal enquiry.', 'Quote for Johnson pump.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '\r\n					Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>\r\n				', '44000.00', 'Pending', 25, 'STL', 14, 'BE-3148', '16-17', 12, 0, '2017-03-28', '0000-00-00', '', '0000-00-00', 1, 17),
(20, 74, 'Plot No. SP 290-292, RICCO Industrial Area, Phase-VII, Chopanki,Bhiwadi,\r\nAlwar-301019', 15, 1, '2017-04-20', 'Mr. Nitin Tiwari', '1493302765', 'As per your verbal enquiry. ', 'Quote for Johnson pump.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '\r\n					Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>\r\n				', '75000.00', 'Pending', 25, 'STL', 13, 'BE-3272', '16-17', 12, 0, '2017-03-28', '0000-00-00', '', '0000-00-00', 1, 16),
(21, 30, 'Village -Khapradig ,Teh :-Simga\r\nBhatapara ,Baloda Bazar Raipur -493332\r\nChattisgarh', 11, 2, '2017-04-10', 'Mr. Shadaab Alam Rizvi', '8349301232', 'Rfq No. 565369', 'Offer for Tushaco make Pump', 'We are thank you for your enquiry for Pump and we being authorized dealer of Tushaco \r\nPumps are pleased to submit our offer as under:\r\n', 'Please confirm pump serial No. while placing purchase order.', 'Price Basis : Transporter Godown Raipur .<br>Packing &amp; Forwarding : Inclusive<br>Sales Tax : CST Extra @ 2% against form C.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 8 to 10 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty..<br>Discount :  @ 20% on quoted price.<br>Validity : 30 Days.<br>', '106250.00', 'Pending', 25, 'STL', 15, 'DC-1', '16-17', 4, 0, '2017-03-28', '0000-00-00', '', '0000-00-00', 0, 21),
(22, 55, 'SP-923, RICCO Phase-III,\r\nP.O.Bhiwadi-301019', 15, 4, '2017-04-18', 'Mr. Manoj Gupta', '1493220075', 'As per your verbal enquiry.', 'Quote for Darling pump.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '\r\n					Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>\r\n				', '100000.00', 'Pending', 25, 'STL', 12, 'BE-2839', '16-17', 12, 0, '2017-03-28', '0000-00-00', '', '0000-00-00', 1, 15),
(23, 70, 'SPL 1, Tapukara Industrial Area, Khuskhera-301707\r\nDistt-Alwar', 15, 5, '2017-04-20', 'Mr. Shivender Pandey', '8800283377', 'As per your verbal enquiry.', 'Quote for Antico pump.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '\r\n					Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>\r\n				', '50000.00', 'Pending', 25, 'STL', 11, 'BE-3255', '16-17', 12, 0, '2017-03-28', '0000-00-00', '', '2017-03-29', 1, 14),
(24, 15, '(Unit of J.K. Cement Ltd.)\r\nKailash nagar \r\nNimbahera - 312617', 15, 34, '2017-04-18', 'Ajay Raj Vaishnav', '9799039255', 'As per your email enquiry.', 'Quote for cooling unit', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '<ol><li style="text-align: justify;">Price Basis : Ex-Our  Works Udaipur .</li><li style="text-align: justify;">Packing &amp; Forwarding : Extra @  %</li><li style="text-align: justify;">Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.</li><li style="text-align: justify;">Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.</li><li style="text-align: justify;">Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.</li><li style="text-align: justify;">Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.</li><li style="text-align: justify;">Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.</li><li style="text-align: justify;">Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.</li><li style="text-align: justify;">Discount :  @ % on quoted price.</li><li style="text-align: justify;">Validity : 30 Days.</li></ol>', '49000.00', 'Pending', 25, 'STL', 16, 'BE-3311', '16-17', 15, 0, '2017-03-28', '0000-00-00', '', '0000-00-00', 0, 24),
(25, 95, 'Chanderai Lead Zinc Smelter,\r\nChittorgarh-312021', 11, 5, '2017-04-14', 'Mr PC Pareek', '9928013967', 'PR. No. 1100098785', 'Offer for Antico make Pump', 'We are thank you for your enquiry for pump and we being authorized dealer of  \r\nAntico Pumps are pleased to submit our offer as under\r\n', '', 'Price Basis : EX-Transporter Godown Chittorgarh.<br>Packing &amp; Forwarding : Inclusive<br>Sales Tax : Vat Extra @ 14.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra as applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 6 to 8 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty.&nbsp;<br>Validity : 30 Days.<br>', '24500.00', 'Pending', 25, 'STL', 17, 'DC-3', '16-17', 4, 0, '2017-03-29', '0000-00-00', '', '0000-00-00', 0, 25),
(26, 86, 'SP-86, NIC (M), RIICO Industrial Area, Phase -II \r\nNeemrana , Alwar - 301 705 , Rajasthan ', 15, 16, '2017-04-01', 'Mr. Sachin Sharma', '7073720222', 'Your verbal enquiry dated 28.03.2017.', 'Quote for Johnson Pump Spares', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '<ol><li style="text-align: justify;">Price Basis &nbsp; : Ex-Our  Works Udaipur .</li><li style="text-align: justify;">Packing &amp; Forwarding : Extra @ 2%</li><li style="text-align: justify;">Sales Tax &nbsp; &nbsp; &nbsp; : Vat Extra @ 5.5%   or as applicable on date of dispatch.</li><li style="text-align: justify;">Delivery &nbsp; &nbsp; &nbsp; &nbsp;: Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.</li><li style="text-align: justify;">Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.</li><li style="text-align: justify;">Payment &nbsp; &nbsp; &nbsp; : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.</li><li style="text-align: justify;">Validity &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: 30 Days.</li></ol>', '1200.00', 'Pending', 25, 'STL', 18, 'BE-3331', '16-17', 16, 0, '2017-03-29', '0000-00-00', '', '0000-00-00', 0, 26),
(27, 96, 'RSPL Group, Plot No.119-121, Block P&T, Kalpi Road, Fazalganj, Kanpur-208012 (UP)\r\n\r\n', 15, 16, '2017-04-01', 'Mr. Akshay Agarwal ', '7318214777', 'As per your email enquiry dated 27.03.2017', 'Quote for Johnson Pump Spares', 'We being an exclusive accredited Dealer for JOHNSON Pumps, are pleased to submit an offer as under:-', '', 'Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @ 2%<br>Sales Tax : 2% CST extra agts C form &nbsp;or as applicable on date of dispatch.<br>Delivery &nbsp;: Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : &nbsp;For Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount : 5 % on quoted price.<br>Validity : 30 Days.<br>', '9360.00', 'Pending', 27, 'FMSL', 2, 'DC-6', '16-17', 15, 0, '2017-03-29', '0000-00-00', '', '0000-00-00', 0, 27),
(28, 77, '19 KM Stone, Bhiwadi -Alwar Road,\r\nVill-Gailpur ( Bhiwadi ) - 301707', 15, 1, '2017-04-14', 'Mr. Shiv Kumar Ji', '9680449223', 'As per per your email enquiry dated 28.03.2017', 'Quote for Johnson Pump', 'We being an exclusive accredited Dealer for JOHNSON Pumps in the state of Rajasthan, are pleased to submit an offer as under:', 'Note : Item 1 You may please place repeat order your PO no. 14/00001803 dated 03.12.2015.', '<ol><li style="text-align: justify;">Price Basis : Ex-Our  Works Udaipur .</li><li style="text-align: justify;">Packing &amp; Forwarding : Extra @ 2 %</li><li style="text-align: justify;">Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.</li><li style="text-align: justify;">Excise Duty : Extra as applicable for which we shall provide you EDGP to Claim Cenvat.</li><li style="text-align: justify;">Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.</li><li style="text-align: justify;">Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.</li><li style="text-align: justify;">Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.</li><li style="text-align: justify;">Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty.&nbsp;</li><li style="text-align: justify;">Validity : 30 Days.</li></ol>', '124000.00', 'Pending', 25, 'STL', 19, 'BE-3186', '16-17', 16, 0, '2017-03-29', '0000-00-00', '', '0000-00-00', 0, 28);
INSERT INTO `quotations` (`id`, `customer_id`, `customer_address`, `employee_id`, `item_group_id`, `finalisation_date`, `customer_for_attention`, `customer_contact_no`, `enquiry_no`, `subject`, `text`, `additional_note`, `terms_conditions`, `total`, `status`, `company_id`, `qt1`, `qt2`, `qt3`, `qt4`, `created_by`, `edited_by`, `created_on`, `edited_on`, `reason`, `closing_date`, `revision`, `quotation_id`) VALUES
(29, 97, 'The Executive Engineer ( O&M/Ph-I)\r\nGeneration Circle,Vidhyut nagar\r\nBanswara-327001', 11, 4, '2017-05-28', 'Mr Manish', '9413348292', 'Enquiry No. RRVUNLDGN (O&MiPH-II)/BGN20L6-17/F./D1313 Dt. 09.03.17', 'Budgetary Quotation for supply of Clear Water Dewatering submersible pump set for Mahi Power House –II,Bagidora', 'We thank you for your above referred enquiry  and we being EXCLUSIVE AUTHORISED DEALER for DARLING PUMPS AND SPARES in the State of Rajasthan, are pleased to submit an offer as under :-\r\n\r\n“DARLING SINKO BLOC” (SUBMERSIBLE MONO BLOC) PUMPSETS comprising of Fluid tight leak proof motor designed for 320/440 volts. AC supply, filled with oil for effective cooling and life long lubrication of heavy duty Ball Bearings and Mechanical Seal provided in the Motor. Pump Motor assembly no foundation, no foot valve or suction pipe. Unit is self-priming, self-standing and portable.\r\nPump should have special PVC insulated winding .Pump should be diffuser design Mechanical Seal working in oil bath. Pump should have top discharge and suction will be between of pump and motor.\r\nHeight & width of pump should not be more that 1000 mm and 325 mm. Minimum submergence should not be more than 595 mm. Weight of pump-motor assembly should not be more that 230 KG\r\n', 'For installation, Commissioning, Testing Charges  will be extra @ 10000/- for each pump set.', '<div>Quoted prices are firm and Ex Our Works, Udaipur</div><div>P &amp; F Charges extra @ 2 % of basic value.</div><div>Freight to RRVUNL Account .( Maximum &nbsp;0.5% of Value of Order.)VAT @ 5.50 % or as applicable at date of dispatch will be charged on the amount or any other tax as applicable on such contracts at such date of dispatch. Service Tax Nil as we are</div><div>Exempt currently.</div><div>We agree for late delivery clause @ 0.25 % for each week and recovery of amount will be limited to 3 % of basic order value of delayed / undelivered material.</div><div>Date of LR / GTR shall be treated as date of delivery.</div><div>We accept payment terms as usual to negotiate 90% value of the consignment through bank and balance 10% payment to be paid within 30 days from the date of dispatch of material.&nbsp;</div><div>&nbsp;In case if you wish to receive the material on freight paid basis than we shall book material till nearest transporter godown on Freight Paid basis and actual freight amount shall be paid to us against documentary proof. &nbsp;Freight amount will not be more than 4 % on total order value including P &amp; F charges and taxes.</div><div>Authorization certificate attached from DARLING Pumps.</div><div>We confirm to accept visual pre dispatch inspection at our works at Udaipur.</div><div>We shall provide you test &amp; performance certificates for pump.</div><div>We regret to accept part order.</div><div>Insurance will be arranged by RVUNL at your cost and we shall intimate dispatch details to you immediately after dispatch of material.</div><div>We accept standard guarantee as provided by manufacturer for 12 months from date of installation and 18 months from date of supply.</div><div>We agree to execute contract agreement on non judicial stamp paper as per Rajasthan Government rules.</div><div>Delivery period shall be 16 to 18 weeks from the date of acceptance of purchase order. Date of LR / GTR to be treated as date of dispatch.</div><div>Price –validity shall be upto 30.06.2017&nbsp;</div><div><br></div><div>Further to the above, we confirm that the prices offered by us as a AUTHORISED DEALER of DARLING pump and spares are the same as being charged from private or other Govt. / Public Sector Undertakings. &nbsp;We hope you will find our offer to suit your requirement and look forward to have your valued purchase order.</div>', '440000.00', 'Pending', 25, 'STL', 20, 'DC-5', '16-17', 4, 0, '2017-03-29', '0000-00-00', '', '0000-00-00', 0, 29),
(30, 43, '25, Rajasthan Project\r\nA.O. Building Barsingsar-334402\r\nBikaner (Raj.)', 11, 15, '2017-05-28', 'Mr. Kalpesh Kumar', '1234567890', 'Enquiry for spare of Tushaco Pump', 'Budgetory Offer for "TUSHACO" spares ', 'We thank you for your above referred enquiry and we being EXCLUSIVE AUTHORISED DEALER for TUSHACO make Pumps & Spares in the State of Rajasthan, are pleased to submit an offer as under ', 'Spares interchangeable with existing pump serial number 074631 / 1210', '<div>Quoted prices are firm and Ex Our Works, Udaipur</div><div>P &amp; F Charges : Extra @ 4 % of basic value.</div><div>Freight &amp; Insurance :To buyers account.</div><div>We accept payment terms as usual to negotiate 90% value of the consignment through bank and balance 10% payment to be paid within 30 days from the date of dispatch of material.&nbsp;</div><div>&nbsp;Authorization certificate attached from TUSHACO Pumps.</div><div>We confirm to accept visual pre dispatch inspection at our works at Udaipur.</div><div>We shall provide you test &amp; performance certificates for pump.</div><div>We regret to accept part order.</div><div>We accept standard guarantee as provided by manufacturer for 12 months from date of installation and 18 months from date of supply.<br></div><div>Delivery period shall be 16 to 18 weeks from the date of acceptance of purchase order. Date of LR / GTR to be treated as date of dispatch.<br></div><div>Price –validity : 120 Days</div><div><br></div><div>Further to the above, we confirm that the prices offered by us as a AUTHORISED DEALER of TUSHACO pump and spares are the same as being charged from private or other Govt. / Public Sector Undertakings. &nbsp;We hope you will find our offer to suit your requirement and look forward to have your valued purchase order.</div>\r\n					\r\n				', '621200.00', 'Pending', 25, 'STL', 21, 'BE-3145', '16-17', 4, 0, '2017-03-29', '0000-00-00', '', '0000-00-00', 0, 30),
(31, 64, 'United Breweries Limited,\r\nBlock No. SP 971, RICCO Industrial Area,\r\nCHOPANKI-301019', 15, 16, '2017-04-25', 'Vishnu Sharma', '8290553922', 'As per your verbal enquiry dated 01.03.2017', 'Quote for Johnson pump Spares', 'With reference to your enquiry we are pleased to submit our quote as follows :-', '', '<ol><li style="text-align: justify;">Price Basis : Ex-Our  Works Udaipur .</li><li style="text-align: justify;">Packing &amp; Forwarding : Extra @2 &nbsp;%</li><li style="text-align: justify;">Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.</li><li style="text-align: justify;">Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.</li><li style="text-align: justify;">Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.</li><li style="text-align: justify;">Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.</li><li style="text-align: justify;">Warranty : For Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.</li><li style="text-align: justify;">Validity : 30 Days.</li></ol>', '37000.00', 'Pending', 25, 'STL', 22, 'BE-3296', '16-17', 15, 0, '2017-03-29', '0000-00-00', '', '0000-00-00', 0, 31),
(32, 74, 'Plot No. SP 290-292, RIICO Industrial Area,\r\nPhase-VII, Chopanki, Bhiwadi\r\nAlwar - 301019', 15, 1, '2017-04-30', 'Mr. Surjeet Singh', '9828352664', 'As per your email enquiry dated 25.02.2017', 'Quote for Johnson Pump', 'With reference to below enquiry we are pleased to submit our quote as follows :-', '', '<ol><li style="text-align: justify;">Price Basis : Ex-Our  Works Udaipur .</li><li style="text-align: justify;">Packing &amp; Forwarding : Extra @  %</li><li style="text-align: justify;">Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.</li><li style="text-align: justify;">Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.</li><li style="text-align: justify;">Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.</li><li style="text-align: justify;">Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.</li><li style="text-align: justify;">Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise.&nbsp;</li><li style="text-align: justify;">Validity : 30 Days.</li></ol>', '71500.00', 'Pending', 25, 'STL', 23, 'BE-3272', '16-17', 16, 0, '2017-03-29', '0000-00-00', '', '0000-00-00', 0, 32),
(33, 32, 'Power Plant\r\nLNJ Nagar\r\nVillage :Mordi\r\nBanswara-327001 (Raj.)', 11, 16, '2017-04-15', 'Mr. Parveen Rawal', '9413357059', 'Purchase Enquiry No. : 11587', 'Offer for Johnson Pump Spare', 'We are thank you for your enquiry for pump spare and we being authorized dealer of \r\n Johnson Pumps & Spare are pleased to submit our offer as under:\r\n\r\n', '', 'Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @2 &nbsp;%<br>Sales Tax : Vat Extra @ 14.5%   or as applicable on date of dispatch.<br>Excise Duty : Not applicable.<br>Delivery : Within 6 to 8 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : &nbsp;For Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Validity : 30 Days.<br>', '17838.00', 'Pending', 25, 'STL', 24, 'DC-8', '16-17', 4, 0, '2017-03-30', '0000-00-00', '', '0000-00-00', 0, 33),
(34, 8, 'Unit Of - DCM Shriram Industries Limited\r\nShriram Nagar, Kota-324004', 15, 4, '2017-04-27', 'Ram Kshteri', '9929590865', 'Your email enquiry dated 29.01.2017', 'BE 2904 Quote for Darling Submersible Pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'Scope of supply : Pumpset with 10 mtrs cable and electronic type control panel \r\n(OL/UL/Single phase preventer, dry-run protection with liquid level sensor)', '<p></p><p></p><ol></ol><p></p><ol><li style="text-align: justify;">Price Basis : Ex-Our  Works Udaipur</li><li style="text-align: justify;">Packing &amp; Forwarding : Extra @ 2 % of basic order vale</li><li style="text-align: justify;">Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.</li><li style="text-align: justify;">Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.</li><li style="text-align: justify;">Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.</li><li style="text-align: justify;">Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.</li><li style="text-align: justify;">Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.</li><li style="text-align: justify;">Warranty : For Pump &nbsp;Standard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.</li></ol>', '52500.00', 'Pending', 25, 'STL', 25, 'BE-2932', '16-17', 7, 0, '2017-03-30', '0000-00-00', '', '0000-00-00', 0, 34),
(35, 61, 'Chambal Fertilisers And Chemicals Limited,\r\nP.O. Gadepan-325208\r\nDistt-Kota (Raj.)', 15, 4, '2017-05-16', 'Mr. Akant Khanduri', '7442782614', 'Verbal discussion during visit dated 7.11.2016', 'Quote for Darling Pump - Shilpa udr', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'Scope of supply : Pump with 10 mtrs cable and electric type control panel (OL/UL/ Single phase preventer, dry run protection with level sensor', '<p></p><p><ul></ul></p><ol><li style="text-align: left;">Price Basis : Ex-Our  Works Udaipur .</li><li style="text-align: left;">Packing &amp; Forwarding : Extra @  %</li><li style="text-align: left;">Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.</li><li style="text-align: left;">Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.</li><li style="text-align: left;">Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.</li><li style="text-align: left;">Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.</li><li style="text-align: left;">Warranty : For Pump Standard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.</li></ol>', '72500.00', 'Pending', 25, 'STL', 26, 'DC-9', '16-17', 7, 0, '2017-03-30', '0000-00-00', '', '0000-00-00', 0, 35),
(36, 18, 'Chanderia Smelter Complex (CPP)\r\nPO Putholi\r\nDt. Chittorgarh', 11, 27, '2017-04-20', 'Mr. PC Pareek', '1472254464', 'Request for Quotation: 1100102452pcp 24.01.2017 17:24:16 2000033466', 'Offer for Antico & Positive Metering Dosing Pump', 'We are thank you for your enquiry for Pumps and we being authorized dealer of ANTICO  Pump & POSITIVE Metering make Dosing Pumps are pleased to submit our offer as under:', 'For Item no 1 .\r\nYou May placed Repeat order as per last PO No.: 2000024094/4100076827 dated: 12.09.2016', 'Price Basis : Ex Transporter Godown Chittorgarh .<br>Packing &amp; Forwarding : Inclusive.<br>Sales Tax : Vat Extra @ 14.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 6 to 8 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty.&nbsp;<br>Validity : 30 Days.<br>', '149925.00', 'Pending', 25, 'STL', 27, 'BE-3249', '16-17', 4, 0, '2017-03-30', '0000-00-00', '', '0000-00-00', 0, 36),
(37, 8, 'Unit Of - DCM Shriram\r\nIndustries Limited\r\nShriram Nagar, \r\nKota-324004', 15, 26, '2017-05-10', 'Ram Kshteri', '9929590865', 'As per discussion during visit dated 8.3.2017', 'Quote for Johnson Pump - Shilpa Udr', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '<p></p><p></p><ol></ol><p></p><ol><li style="text-align: left;">Price Basis : Ex-Our  Works Udaipur .</li><li style="text-align: left;">Packing &amp; Forwarding : Extra @ 2 % of basic order value</li><li style="text-align: left;">Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.</li><li style="text-align: left;">Excise Duty : Extra as applicable for which we shall provide you EDGP to Claim Cenvat.</li><li style="text-align: left;">Delivery : Within 6 to 8 weeks from date of receipt of Techno-Commercially clear PO.</li><li style="text-align: left;">Payment : 100 % advance against delivery.</li><li style="text-align: left;">Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.</li></ol>', '264400.00', 'Pending', 25, 'STL', 28, 'BE-2932', '16-17', 12, 0, '2017-03-30', '0000-00-00', '', '0000-00-00', 0, 37),
(38, 43, '25, Rajasthan Project\r\nA.O. Building Barsingsar-334402\r\nBikaner (Raj.)', 11, 4, '2017-05-29', 'Mr. Abdul Jalil', '1234567890', 'As telephonic discussion 30.03.17', 'Offer for Darling make Waset Water handling Pump', 'We thank you for your enquiry and we being authorised dealer for DARLING pumps for Rajasthan are pleased to submit our offer as follows :- ', 'Man Days\r\n\r\nSupervision of erection, commissioning, installation and site charges are Rs. 5000 /- per day for fitter or Rs. 6000 / day for service engineer plus with lodging facility. For visits under warranty if product has a fault than visit will be free of charge but if problem is due to site issue than we shall charge you as per these rates.', '<h4><span style="font-family: &quot;Times New Roman&quot;;">Price Basis : Ex-Our  Works Udaipur .<br></span><span style="font-family: &quot;Times New Roman&quot;;">Packing &amp; Forwarding : Extra @ 4% &nbsp;of basic order Value .<br></span><span style="font-family: &quot;Times New Roman&quot;;">Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br></span><span style="font-family: &quot;Times New Roman&quot;;">Delivery : Within 6 to 8 weeks from date of receipt of Techno-Commercially clear PO.<br></span><span style="font-family: &quot;Times New Roman&quot;;">LD Clause :<span style="color: rgb(23, 16, 0); text-align: justify;">Please note date of LR\r\nto be treated as date of delivery and in case of delay in supply LD to be\r\ncalculated from date of LR.</span></span><span style="font-family: &quot;Times New Roman&quot;;"><span style="font-size: 12pt; color: rgb(23, 16, 0);">Penalty @ 0.5 % per week or part thereof after 2 weeks of grace period\r\nafter delivery period and maximum upto 3 % of basic order value is acceptable\r\non the unexecuted portion of the order<br></span></span><span style="font-family: &quot;Times New Roman&quot;;">Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br></span><span style="font-family: &quot;Times New Roman&quot;;">Payment : Strictly within 15 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br></span><span style="font-family: &quot;Times New Roman&quot;;">Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty.&nbsp;<br></span><span style="font-family: &quot;Times New Roman&quot;;">D<br></span><span style="font-family: &quot;Times New Roman&quot;;">Validity : 30 Days.</span></h4>', '80500.00', 'Pending', 25, 'STL', 29, 'DC-7', '16-17', 4, 0, '2017-03-30', '0000-00-00', '', '0000-00-00', 0, 38),
(39, 8, 'Unit Of - DCM Shriram Industries Limited\r\nShriram Nagar, Kota-324004', 15, 18, '2017-04-30', 'Ram Kshteri', '9929590865', 'As per discussion during visit dated 8.3.2017', 'Quote for Darling Pump Spaers', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '<p></p><p><ol></ol></p><ol><li style="text-align: left;">Price Basis : Ex-Our  Works Udaipur .</li><li style="text-align: left;">Packing &amp; Forwarding : Extra @ 2 %</li><li style="text-align: left;">Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.</li><li style="text-align: left;">Delivery : Within 3 to 4 weeks from date of receipt of Techno-Commercially clear PO.</li><li style="text-align: left;">Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.</li><li style="text-align: left;">Payment : 100 % advance against delivery</li><li style="text-align: left;">Warranty : For Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.</li></ol>', '8480.00', 'Pending', 25, 'STL', 30, 'BE-2932', '16-17', 7, 0, '2017-03-30', '0000-00-00', '', '0000-00-00', 0, 39),
(40, 8, 'Unit Of - DCM Shriram Industries Limited\r\nShriram Nagar, Kota-324004', 15, 26, '2017-05-25', 'Ram Kshteri', '9929590865', 'As per discussion dated 20.3.2017', 'BE 2932 : Revised Quote for Johnson Pump - Shilpa Udr', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '<p style="margin-left: 25px;"></p><p style="margin-left: 25px;"><ol></ol></p><ol><li style="text-align: left;">Price Basis : Ex-Our  Works Udaipur .</li><li style="text-align: left;">Packing &amp; Forwarding : Extra @ 2 &nbsp;% on basic order value</li><li style="text-align: left;">Sales Tax : Vat Extra @ 5.50%   or as applicable on date of dispatch.</li><li style="text-align: left;">Excise Duty : Extra as applicable for which we shall provide you EDGP to Claim Cenvat.</li><li style="text-align: left;">Delivery : Within 8 to 10 weeks from date of receipt of Techno-Commercially clear PO.</li><li style="text-align: left;">Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.</li><li style="text-align: left;">Payment : 100 % advance against delivery</li><li style="text-align: left;">Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.</li></ol>', '362460.00', 'Pending', 25, 'STL', 31, 'BE-2932', '16-17', 7, 0, '2017-03-30', '0000-00-00', '', '0000-00-00', 0, 40),
(41, 74, 'Plot No. SP 290-292,\r\nRIICO Industrial Area,\r\nPhase-VII, Chopanki, \r\nBhiwadi, Alwar-301019', 15, 1, '2017-04-21', 'Mr. Nitin Tiwari', '1493302765', 'As per your vebal enquiry.', 'Quote For Johnson pump. ', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', 'Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>', '62900.00', 'Pending', 25, 'STL', 32, 'BE-3272', '16-17', 12, 0, '2017-03-31', '0000-00-00', '', '0000-00-00', 0, 41),
(42, 59, '7J 4,RC Vyas Colony,\r\nBhilwara', 15, 1, '2017-04-20', 'Mr. Sanjeev Ji', '9351734430', 'As per your verbal enquiry.', 'Quote for Johnson pump.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', 'Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>', '44000.00', 'Pending', 25, 'STL', 33, 'BE-3148', '16-17', 12, 0, '2017-03-31', '0000-00-00', '', '0000-00-00', 0, 42),
(43, 111, '(A unit of : Rajasthan Cooperative Dairy Federation Limited)\r\nNadbai (Bharatpur) Rajasthan 321602\r\n', 15, 2, '2017-04-20', 'Mr. Satish Sharma', '5643276530', 'As per your email enquiry.', 'Quote for Tushaco pump.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', 'Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>', '75000.00', 'Pending', 25, 'STL', 34, 'BE-3291', '16-17', 12, 0, '2017-03-31', '0000-00-00', '', '0000-00-00', 0, 43),
(44, 80, '7-8 KM Stone, Bhiwadi-\r\nAlwar Road, Khijuriwas (PO), \r\nAlwar (Dist), Bhiwadi, \r\nRajasthan 301018', 15, 3, '2017-04-20', 'Mr. Ankush Saxena', '8107291735', 'As per your verbal enquiry.', 'Quote for Positive pump.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', 'Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>', '33600.00', 'Pending', 25, 'STL', 35, 'BE-3107', '16-17', 12, 0, '2017-03-31', '0000-00-00', '', '0000-00-00', 0, 44),
(45, 44, 'R. K. Nagar, Nimbahera-312601', 15, 2, '2017-04-21', 'Vishnu Sharma', '9610019610', 'As per email enquiry.', 'Quote for Tushaco spares.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', 'Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>', '8900.00', 'Pending', 25, 'STL', 36, 'DC-10', '16-17', 12, 0, '2017-03-31', '0000-00-00', '', '0000-00-00', 0, 45),
(46, 38, '(A Division of DCM Shriram\r\nCement) Shriram Nagar, \r\nKota-3240004', 15, 15, '2017-04-20', 'Mr. Neelambuj Pareek', '9460483470', 'As per your email enquiry.', 'Quote for Tushco spares.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', 'Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>', '11900.00', 'Pending', 25, 'STL', 37, 'DC-12', '16-17', 12, 0, '2017-03-31', '0000-00-00', '', '0000-00-00', 0, 46),
(47, 112, 'A-135-135-136, Road no. 12,\r\nVishwakarma indusrial Area, Jaipur-302013', 15, 17, '2017-04-20', 'Mr. Pankaj Kalani', '9785022279', 'As per your email enquiry.', 'Quote for Antico Spares.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', 'Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>', '2400.00', 'Pending', 25, 'STL', 38, 'BE-3194', '16-17', 12, 0, '2017-03-31', '0000-00-00', '', '0000-00-00', 0, 47),
(48, 96, 'RSPL Group, Plot No.119-121, Block P&T, Kalpi Road, Fazalganj, Kanpur-208012 (UP)\r\n\r\n', 15, 16, '2017-04-19', 'Mr. Akshay Agarwal ', '7318214777', 'As per your email enquiry.', 'Quote for Johnson spares.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', 'Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>', '8400.00', 'Pending', 25, 'STL', 39, 'BE-3372', '16-17', 12, 0, '2017-03-31', '0000-00-00', '', '0000-00-00', 0, 48),
(49, 70, 'SPL 1, Tapukara Industrial\r\nArea, Khuskhera-301707\r\nDistt-Alwar', 15, 16, '2017-04-22', 'Mr. Arun Sharma', '8800283377', 'As per email enquiry.', 'Quote for Johnson spares.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', 'Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>', '10000.00', 'Pending', 25, 'STL', 40, 'BE-3255', '16-17', 12, 0, '2017-03-31', '0000-00-00', '', '0000-00-00', 0, 49),
(50, 111, '(A unit of : Rajasthan\r\nCooperative Dairy\r\nFederation Limited)\r\nNadbai,\r\nBharatpur-321602 (Raj.)\r\n', 15, 2, '2017-04-22', 'Mr. Satish Sharma', '5643276530', 'As per your email enquiry.', 'Quote for Tushaco pump.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', 'Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>', '54000.00', 'Pending', 25, 'STL', 41, 'BE-3291', '16-17', 12, 0, '2017-03-31', '0000-00-00', '', '0000-00-00', 0, 50),
(51, 26, 'Unit-Kotputli Cement Works\r\nVillage - Mohanpura\r\nTeh - Kotputli\r\nDist. jaipur-303108', 15, 4, '2017-04-22', 'Mr. Pradeep Ranka', '9887480241', 'As per your email enquiry.', 'Quote for Darling pump.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', 'Price Basis : Ex-Our  Works Udaipur .<br>Packing &amp; Forwarding : Extra @  %<br>Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.<br>Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.<br>Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.<br>Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.<br>Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.<br>Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.<br>Discount :  @ % on quoted price.<br>Validity : 30 Days.<br>', '50000.00', 'Pending', 25, 'STL', 42, 'BE-2720', '16-17', 12, 0, '2017-03-31', '0000-00-00', '', '0000-00-00', 0, 51),
(52, 57, '(Division of DCM Shriram Ltd.)\r\nShriram Nagar, Kota-324004', 15, 26, '2017-04-30', 'Mr. Dileep Sisodia', '9829516611', 'Your email enquiry dated 23.2.2017', 'Gen bx: Offer for Johnson centrifugal pump with motor', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '<p></p><p><ol></ol></p><ol><li style="text-align: left;">Price Basis : Ex-Our  Works Udaipur .</li><li style="text-align: left;">Packing &amp; Forwarding : Extra @ 2 &nbsp;%</li><li style="text-align: left;">Sales Tax : Vat Extra @ 5.50 %   or as applicable on date of dispatch.</li><li style="text-align: left;">Excise Duty : Extra as applicable for which we shall provide you EDGP to Claim Cenvat.</li><li style="text-align: left;">Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.</li><li style="text-align: left;">Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.</li><li style="text-align: left;">Payment : Strictly within 15 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.</li><li style="text-align: left;">Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty.</li></ol>', '31250.00', 'Pending', 25, 'STL', 43, 'DC-13', '16-17', 7, 0, '2017-03-31', '0000-00-00', '', '0000-00-00', 0, 52),
(53, 107, 'Shriram Nagar, Kota-324004', 15, 2, '2017-04-30', 'Mr. Nitin Paliwal', '9829895738', 'Your email enquiry dt. 20.03.2017', 'BE 2502 : Quote for Tushaco Pump - Shilpa Udr', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'NOTE : You may place repeat order as per your last PO No. SCW/NIP/7287467 dated 13.12.2014', '<p></p><p><ol></ol></p><ol><li style="text-align: left;">Price Basis : Ex-Our  Works Udaipur .</li><li style="text-align: left;">Sales Tax : Vat Extra @ 14.5 %   or as applicable on date of dispatch.</li><li style="text-align: left;">Delivery : Ready Stock</li><li style="text-align: left;">Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.</li><li style="text-align: left;">Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.</li><li style="text-align: left;">Warranty : For Pump &amp; Motors\r\nStandard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty.&nbsp;</li></ol>', '7650.00', 'Pending', 25, 'STL', 44, 'BE-2502', '16-17', 7, 0, '2017-03-31', '0000-00-00', '', '0000-00-00', 0, 53),
(54, 101, 'NH-12, Ramganj Balaji, \r\nBundi-323001 (Raj)', 15, 3, '2017-04-30', 'Mr. Yusuf Ansari', '7073458817', 'Your email inquiry dated 28.3.2017', 'BE 2877- Quote for Dosing Pump - Shilpa Udr', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'NOTE : You can place repeat order as per your last PO no. PB50C553 dated 8.10.2011', '<ol><li style="text-align: left;">Price Basis : Ex-Our  Works Udaipur .</li><li style="text-align: left;">Packing &amp; Forwarding : Extra @ 2 % of basic order value</li><li style="text-align: left;">Sales Tax : Vat Extra @ 14.5%   or as applicable on date of dispatch.</li><li style="text-align: left;">Delivery : Ready Stock</li><li style="text-align: left;">Freight &amp; Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.</li><li style="text-align: left;">Payment : Strictly within 15 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.</li><li style="text-align: left;">Warranty : For Pump Standard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty.&nbsp;</li></ol>', '8502.50', 'Pending', 25, 'STL', 45, 'BE-2877', '16-17', 7, 0, '2017-03-31', '0000-00-00', '', '0000-00-00', 0, 54);

-- --------------------------------------------------------

--
-- Table structure for table `quotation_close_reasons`
--

CREATE TABLE IF NOT EXISTS `quotation_close_reasons` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `reason` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `quotation_close_reasons`
--

INSERT INTO `quotation_close_reasons` (`id`, `reason`) VALUES
(1, 'Price was Higher'),
(2, 'Delivery was long'),
(3, 'Requirement cancelled'),
(4, 'Requirement Postponed'),
(5, 'Other Brand preferred'),
(6, 'No response or reply'),
(7, 'Order placed without consulting us'),
(8, 'Technically not suitable');

-- --------------------------------------------------------

--
-- Table structure for table `quotation_rows`
--

CREATE TABLE IF NOT EXISTS `quotation_rows` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `quotation_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `height` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=121 ;

--
-- Dumping data for table `quotation_rows`
--

INSERT INTO `quotation_rows` (`id`, `quotation_id`, `item_id`, `description`, `quantity`, `rate`, `amount`, `height`) VALUES
(3, 1, 926, '<div class="MsoNoSpacing" style="MARGIN: 0in 0in 0pt"></div><p>\r\n</p><br>', 2, '49500.00', '99000.00', 21),
(5, 3, 927, '<p>Indent No : 7464</p><p>Pump Model:- CCR 32 160</p><p>Liquid : Normal Water</p><p>Capacity: 5m3/hr</p><p>Head:40 mtr</p><p>Suction X Discharge : 50 X 32 mm</p><p>Design : Centrifugal</p><p>Temperature /PH / SG :Ambient / 6-7/ 1</p><p>Sealing : Gland Packing</p><p>MOC: Casing/Impeller/ Shaft :SS 316</p><p>Bearing Housing: CI</p><p>Motor Power :3 HP ,2900 rpm</p>', 1, '50990.00', '50990.00', 40),
(6, 3, 928, '<p>Indent No : 7498</p><p>Pump Model : CCR 65 125</p><p>Liquid : Effluent</p><p>Capacity : 90 m3/hr</p><p>Head : 20 Mtrs</p><p>Suction X Discharge : 80 X 50 mm</p><p>Design :Centrifugal</p><p>Temperature : 60° / SG : 1&nbsp;</p><p>Sealing :Gland Packing</p><p>MOC: Casing/Impeller/ Shaft :SS 316</p><p>Motor Power :10 HP &nbsp;2900 rpm</p>', 1, '78900.00', '78900.00', 40),
(7, 4, 930, '<p class="MsoNormal"><span style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black">Pump Model : CCR 40 160<o:p></o:p></span></p><p class="MsoNormal"><span style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black">Head: 30\r\nMeters&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p class="MsoNormal"><span style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black"> Flow: 30 M3/Hr<o:p></o:p></span></p><p class="MsoNormal"><span style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black">MOC:&nbsp; SS 316 MOC Pump Shaft, Casing , Shaft Sleeve, Impeller<o:p></o:p></span></p><p class="MsoNormal"><span style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black">Sealing: Gland\r\nPacking&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p class="MsoNormal"><span style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black">\r\nImpeller Type: Closed&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p><p class="MsoNormal"><span style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black">Power: 7.5 HP/2900\r\nRPM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p class="MsoNormal"><span style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black">\r\nLiquid : Clear Water<o:p></o:p></span></p><p class="MsoNormal"><span style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black">Temp.:\r\nAmbient / S G : 1 <o:p></o:p></span></p><p class="MsoNormal"><span style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black">Suc*Dis Size: 50 x 32\r\nMM / P H&nbsp; : 7 <o:p></o:p></span></p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class="MsoNormal"><span style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black">Particle Size: Clear Water<o:p></o:p></span></p>', 1, '58500.00', '58500.00', 0),
(11, 2, 929, '<p>Application Mines Dewatering</p><p>Pump Model : CN 100 400</p><p>Head: 50 Meters</p><p>Flow: 120 M3/hr</p><p>MOC: Cast Iron</p><p>Sealing : Gland Packing</p><p>Reccd. Motor Power: 40 HP/1450 RPM</p><p>Suc*Dis Size: 125*100 MM</p><p><br></p><p><br></p>', 1, '55500.00', '55500.00', 79),
(13, 8, 677, '<p>Pump Model : KGEN 11 3 G1</p>', 2, '8350.00', '16700.00', 0),
(14, 8, 679, '<p>Pump Model : KGEN 11 4 G1<br></p>', 2, '9420.00', '18840.00', 0),
(19, 6, 931, '<p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">&nbsp;PR No :</span><span style="color: black; font-family: &quot;Palatino Linotype&quot;, serif; font-size: 9pt; background-color: transparent;">1610001589</span></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">Your Item Code :&nbsp;</span><span style="color: black; font-family: &quot;Palatino Linotype&quot;, serif; font-size: 9pt; background-color: transparent;">766842027100</span></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">Submersible Pump for Dewatering<o:p></o:p></span></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">Make : Darling &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style="color: black; font-family: &quot;Palatino Linotype&quot;, serif; font-size: 9pt; background-color: transparent;">&nbsp;Model : S 630</span></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">Capacity : 0 to 17.50LPS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color: black; font-family: &quot;Palatino Linotype&quot;, serif; font-size: 9pt; background-color: transparent;">Head Range : 0 to 32 Mtrs</span></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">Delivery Outlet : 65 mm &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color: black; font-family: &quot;Palatino Linotype&quot;, serif; font-size: 9pt; background-color: transparent;">Cable Size 1*3*1.5</span></p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n<span lang="EN-US" style="font-size:9.0pt;line-height:115%;font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US;mso-fareast-language:EN-IN;mso-bidi-language:\r\nAR-SA">Scope of Supply :Pump with 5 mtr Cable&nbsp;</span><br></p>', 2, '15435.00', '30870.00', 0),
(20, 6, 705, '<p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US"><span lang="EN-US" style="font-size: 9pt; line-height: 115%;">PR : 1100100683</span><br></span></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">Your Code :&nbsp;</span><span style="color: black; font-family: &quot;Palatino Linotype&quot;, serif; font-size: 9pt; background-color: transparent;">766872027010</span></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">Make : Johnson Pump<o:p></o:p></span></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">Model : CB 40C-160<o:p></o:p></span></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">Capacity : 25 m3/hr<o:p></o:p></span></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">Head : 30 Mtrs<o:p></o:p></span></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">Suc * Discharge : 65X40mm<o:p></o:p></span></p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n<span lang="EN-US" style="font-size:9.0pt;line-height:115%;font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US;mso-fareast-language:EN-IN;mso-bidi-language:\r\nAR-SA">Rec. Motor Power : 5HP/2900 RPM</span></p><p><span lang="EN-US" style="font-size:9.0pt;line-height:115%;font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US;mso-fareast-language:EN-IN;mso-bidi-language:\r\nAR-SA">Scope Of Supply : Bare Pump<br></span><br></p>', 2, '17200.00', '34400.00', 0),
(23, 5, 735, '<p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span style="color: black; font-family: &quot;Palatino Linotype&quot;, serif; background-color: transparent;">Liquid : Acidic</span><br></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">Model : CCR 32 125<o:p></o:p></span></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">Capacity : 20 m3/hr<o:p></o:p></span></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">Head : 20 Mtrs<o:p></o:p></span></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">SG : 1.3 /</span><span style="color: black; font-family: &quot;Palatino Linotype&quot;, serif; background-color: transparent;">PH : 1.5-4</span></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">Suc * Discharge : 50X32mm<o:p></o:p></span></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">Sealing : Mechanical Seal<o:p></o:p></span></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">Impeller : Closed<o:p></o:p></span></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">Rec. Motor Power : 5HP/2900 RPM<o:p></o:p></span></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">MOC<o:p></o:p></span></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:\r\nnormal"><span lang="EN-US" style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US">Impeller /Casing/Shaft/Shaft Sleeve\r\n:SS316L<o:p></o:p></span></p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n<span lang="EN-US" style="font-size:11.0pt;line-height:115%;font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black;mso-ansi-language:EN-US;mso-fareast-language:EN-IN;mso-bidi-language:\r\nAR-SA">Bearing Housing : CI</span><br></p>', 1, '123000.00', '123000.00', 0),
(26, 9, 669, '<p>Mechanical Seal of Antico Pump</p><p>Pump Model: EXP 50 ATC</p>', 2, '9500.00', '19000.00', 0),
(27, 10, 715, '<p><br></p>', 1, '22000.00', '22000.00', 0),
(28, 11, 708, '<p>CB 200 200 Pump with 25 HP,1500 RPM motor.</p>', 1, '225000.00', '225000.00', 0),
(34, 16, 733, '<p>CCR 50 160 R6 S2 L3<br></p>', 1, '75000.00', '75000.00', 0),
(35, 17, 731, 'CCR 32 160 R6 S2 L3', 1, '44000.00', '44000.00', 0),
(37, 12, 708, '<p>CB 200 200 G1 Pump with 25 HP,1500 RPM motor.</p>', 1, '225000.00', '225000.00', 0),
(38, 14, 654, '<p>NZ 25 160 Pump Closed Impeller<br></p>', 1, '50000.00', '50000.00', 0),
(39, 15, 926, '<p>WV 03 L/40<br></p>', 1, '100000.00', '100000.00', 0),
(41, 19, 731, 'CCR 32 160 R6 S2 L3', 1, '44000.00', '44000.00', 0),
(42, 20, 733, '<p>CCR 50 160 R6 S2 L3<br></p>', 1, '75000.00', '75000.00', 0),
(43, 21, 940, '<p>Your Item Code :PUMPOTHR0415</p><p>Pump Model : T3 SFP 20/56</p><p>Capacity : 50 LPM</p><p><span style="text-decoration: underline; font-weight: bold;">Scope of Supply : </span><span style="font-weight: bold;">Bare Pump</span></p>', 1, '106250.00', '106250.00', 0),
(47, 25, 649, '<p class="MsoNormal"><span lang="EN-US" style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Arial;\r\ncolor:black;mso-ansi-language:EN-US">Pump Model:- NS 50 <br>\r\n</span></p><p class="MsoNormal"><span lang="EN-US" style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Arial;\r\ncolor:black;mso-ansi-language:EN-US">Capacity: 18m3/hr &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Head:18 mtr<br>\r\n</span></p><p class="MsoNormal"><span lang="EN-US" style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Arial;\r\ncolor:black;mso-ansi-language:EN-US">Suction X Discharge : 50 X 40 mm &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Design : Centrifugal</span></p><p class="MsoNormal"><span style="color: black; font-family: &quot;Palatino Linotype&quot;, serif; background-color: transparent;">Impeller Type: SEMI Open &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style="color: black; font-family: &quot;Palatino Linotype&quot;, serif; background-color: transparent;">MOC: Casing/Impeller : PP&nbsp;</span><span style="color: black; font-family: &quot;Palatino Linotype&quot;, serif; background-color: transparent;">&amp; Shaft :SS 316</span></p><p class="MsoNormal"><span style="color: black; font-family: &quot;Palatino Linotype&quot;, serif; background-color: transparent;">Bearing Housing: CI &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style="color: black; font-family: &quot;Palatino Linotype&quot;, serif; background-color: transparent;">Reccd. Motor Power :5Hp ,2900 rpm</span></p><p class="MsoNormal"><span lang="EN-US" style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Arial;\r\ncolor:black;mso-ansi-language:EN-US">\r\nSealing: Mechanical Seal</span><span style="color:black"><o:p></o:p></span></p><p>\r\n\r\n\r\n\r\n\r\n\r\n<strong><span style="font-size:12.0pt;font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;color:black;\r\nmso-ansi-language:EN-IN;mso-fareast-language:EN-IN;mso-bidi-language:AR-SA">Scope\r\nof Supply :Bare Pump</span></strong><br></p>', 1, '24500.00', '24500.00', 0),
(49, 7, 806, '<p>Pump Type : Self Priming Non Clog Centrifugal Pump</p><p>Model : KGEN 16 6 G1</p><p>Flow : 36 m3 /hr &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style="background-color: transparent;">Head : 30 mtr</span></p><p>MOC : Impeller / Pump Shaft : SS 316</p><p>Pump Casing &amp; Bearing Houysing ; CI</p><p>Liquid : Caustic Weak Lye</p><p>Particle Size Handling : 13 MM</p><p>Sealing : Mechanical</p><p>Motor : 7.5 Hp / 2900</p><p><span style="background-color: transparent;">Impeller : Semi Open</span><br></p><p>Scope of Supply : </p><p>Price for Pump with Remi / BBL Std Foot Mounted Motor Coupling , Coupling Gaurd , MS base Frame , Foundation Bolt Duly Assembled<br></p>', 2, '46700.00', '93400.00', 0),
(50, 27, 755, '<p>Johnson Pump Spares</p><p><br></p><p>Mechanical Seal For KGEN 11 3 G1<br><br></p>', 6, '1560.00', '9360.00', 0),
(55, 26, 762, '<p>Johnson Pump KGEN 11 3 Spares&nbsp;</p><p>Valve Assembly Part No. 0310</p><p><br></p><p><br></p>', 2, '600.00', '1200.00', 0),
(59, 24, 917, '<p>Mechfill Cooling Unit with Simplex Filter</p>', 1, '49000.00', '49000.00', 0),
(60, 23, 654, '<p>NZ 25 160 Pump Closed Impeller<br></p>', 1, '50000.00', '50000.00', 0),
(61, 28, 709, '<p class="MsoNormal"><strong style="color: rgb(255, 0, 0); font-family: &quot;Palatino Linotype&quot;; background-color: transparent;"><i><u>Item \r\n3. Clear Water Pump</u></i></strong><br></p><p class="MsoNormal"><strong><em><font face="Palatino Linotype">Delivery &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ready Stock</font></em></strong>&nbsp;</p><table style="color: rgb(0, 0, 0);" cellspacing="0" cellpadding="0" width="412" border="0">\r\n<colgroup>\r\n<col style="WIDTH: 48pt" width="64">\r\n<col style="WIDTH: 131pt; mso-width-source: userset; mso-width-alt: 6400" width="175">\r\n<col style="WIDTH: 130pt; mso-width-source: userset; mso-width-alt: 6326" width="173">\r\n</colgroup><tbody>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" width="238" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">Pump \r\nModel</font></font></td>\r\n<td class="xl68" style="VERTICAL-ALIGN: bottom" width="173"><font style="size: +0"><font style="FONT-SIZE: 9pt">CN 40 200 \r\nG1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</font></font></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">Service</font></font></td>\r\n<td class="xl68" style="VERTICAL-ALIGN: bottom"><font style="size: +0"><font style="FONT-SIZE: 9pt">Water Transfer &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</font></font></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">Make</font></font><font style="size: +0"><font style="FONT-SIZE: 9pt">&nbsp;</font></font></td>\r\n<td class="xl68" style="VERTICAL-ALIGN: bottom"><font style="size: +0"><font style="FONT-SIZE: 9pt">Johnson</font></font></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">Fluid Handled</font></font></td>\r\n<td class="xl68" style="VERTICAL-ALIGN: bottom"><font style="size: +0"><font style="FONT-SIZE: 9pt">Clear Water</font></font></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">Operating Temperature \r\n(oC)</font></font></td>\r\n<td class="xl68" style="VERTICAL-ALIGN: bottom"><font style="size: +0"><font style="FONT-SIZE: 9pt">Ambient</font></font></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">Specific \r\nGravity</font></font></td>\r\n<td class="xl68" style="VERTICAL-ALIGN: bottom"><font style="size: +0"><font style="FONT-SIZE: 9pt">1</font></font></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">PH</font></font></td>\r\n<td class="xl68" style="VERTICAL-ALIGN: bottom"><font style="size: +0"><font style="FONT-SIZE: 9pt">7</font></font></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">Capacity \r\n(m3/hr)</font></font></td>\r\n<td class="xl68" style="VERTICAL-ALIGN: bottom"><font style="size: +0"><font style="FONT-SIZE: 9pt">25</font></font></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">Head (m)</font></font></td>\r\n<td class="xl68" style="VERTICAL-ALIGN: bottom"><font style="size: +0"><font style="FONT-SIZE: 9pt">40</font></font></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">Speed (rpm)</font></font></td>\r\n<td class="xl68" style="VERTICAL-ALIGN: bottom"><font style="size: +0"><font style="FONT-SIZE: 9pt">2900</font></font></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">Efficiency BEP</font></font></td>\r\n<td class="xl68" style="VERTICAL-ALIGN: bottom"><font style="size: +0"><font style="FONT-SIZE: 9pt">63%</font></font></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><strong><font style="FONT-SIZE: 9pt; BACKGROUND-COLOR: #ffff00">Power consumed by pump \r\n(BkW)</font></strong></td>\r\n<td class="xl69" style="VERTICAL-ALIGN: bottom"><strong><font style="FONT-SIZE: 9pt; BACKGROUND-COLOR: #ffff00">4.7</font></strong></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">Recommended Motor Rating ( \r\nH.P)</font></font></td>\r\n<td class="xl68" style="VERTICAL-ALIGN: bottom"><font style="size: +0"><font style="FONT-SIZE: 9pt">7.5 H.P</font></font></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">Pump Type</font></font><font style="size: +0"><font style="FONT-SIZE: 9pt">&nbsp;</font></font></td>\r\n<td class="xl68" style="VERTICAL-ALIGN: bottom"><font style="size: +0"><font style="FONT-SIZE: 9pt">&nbsp;</font></font><font style="size: +0"><font style="FONT-SIZE: 9pt">Horizontal Centrifugal Pump</font></font></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">Pump Suction/Delivery Size \r\n(mm)</font></font></td>\r\n<td class="xl68" style="VERTICAL-ALIGN: bottom"><font style="size: +0"><font style="FONT-SIZE: 9pt">65*40 mm</font></font></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">Shaft Sealing</font></font></td>\r\n<td class="xl68" style="VERTICAL-ALIGN: bottom"><font style="size: +0"><font style="FONT-SIZE: 9pt">Gland Packing</font></font></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">Motor</font></font></td>\r\n<td class="xl68" style="VERTICAL-ALIGN: bottom"><font style="size: +0"><font style="FONT-SIZE: 9pt">BBL/ REMI</font></font></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">Impeller Type</font></font></td>\r\n<td class="xl68" style="VERTICAL-ALIGN: bottom"><font style="size: +0"><font style="FONT-SIZE: 9pt">Closed</font></font></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">Lubrication</font></font></td>\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom"><font style="size: +0"><font style="FONT-SIZE: 9pt">Oil / Grease</font></font></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">Volute Casing</font></font></td>\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom"><font style="size: +0"><font style="FONT-SIZE: 9pt">Cast Iron</font></font></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">Shaft</font></font></td>\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom"><font style="size: +0"><font style="FONT-SIZE: 9pt">SS</font></font><font style="size: +0"><font style="FONT-SIZE: 9pt">&nbsp;</font></font></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">Impeller</font></font></td>\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom"><font style="size: +0"><font style="FONT-SIZE: 9pt">Cast Iron</font></font></td></tr>\r\n<tr style="HEIGHT: 14.25pt" height="19">\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom" height="19" colspan="2"><font style="size: +0"><font style="FONT-SIZE: 9pt">Bearing Housing</font></font></td>\r\n<td class="xl67" style="VERTICAL-ALIGN: bottom"><font style="size: +0"><font style="FONT-SIZE: 9pt">CI</font></font></td></tr></tbody></table><p class="MsoNormal"><font linotype?=""><font style="COLOR: #000000"></font></font>&nbsp;</p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class="MsoNormal">Price for Pump with BBL/REMI Motor, Lovejoy Coupling, \r\nCoupling Guard duly </p><p class="MsoNormal">assembled on MS Base frame&nbsp; : Rs. 33,500/- each set</p>', 2, '33500.00', '67000.00', 0),
(62, 28, 802, '<p class="MsoNormal"><font face="Palatino Linotype" style="color: rgb(255, 0, 0);"><span style="font-weight: 700;"><i><u>Item 2. Sludge Transfer Pump</u></i></span></font></p><p class="MsoNormal"><font face="Palatino Linotype" style="color: rgb(255, 0, 0);"><span style="font-weight: 700;"><i><u></u></i></span></font><span style="font-weight: 700;"><em>Delivery &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ready Stock</em></span>&nbsp;</p><table cellspacing="0" cellpadding="0" width="417" border="0" style="background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);"><colgroup><col width="64" style="width: 48pt;"><col width="183" style="width: 137pt;"><col width="170" style="width: 128pt;"></colgroup><tbody><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" width="246" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Pump Model</font></td><td class="xl67" width="170" style="vertical-align: bottom;"><font style="font-size: 9pt;">KGEN 12 6 G1</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Service</font></td><td class="xl67" style="vertical-align: bottom;"><font style="font-size: 9pt;">Sludge Transfer</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Make</font><font style="font-size: 9pt;">&nbsp;</font></td><td class="xl67" style="vertical-align: bottom;"><font style="font-size: 9pt;">Johnson</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Fluid Handled</font></td><td class="xl67" style="vertical-align: bottom;"><font style="font-size: 9pt;">Clear Water</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Operating Temperature (oC)</font></td><td class="xl67" style="vertical-align: bottom;"><font style="font-size: 9pt;">Ambient</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Specific Gravity</font></td><td class="xl67" style="vertical-align: bottom;"><font style="font-size: 9pt;">1</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">PH</font></td><td class="xl67" style="vertical-align: bottom;"><font style="font-size: 9pt;">7</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Capacity (m3/hr)</font></td><td class="xl67" style="vertical-align: bottom;"><font style="font-size: 9pt;">30</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Head (m)</font></td><td class="xl67" style="vertical-align: bottom;"><font style="font-size: 9pt;">19</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Speed (rpm)</font></td><td class="xl67" style="vertical-align: bottom;"><font style="font-size: 9pt;">2900</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Efficiency BEP</font></td><td class="xl67" style="vertical-align: bottom;"><font style="font-size: 9pt;">64%</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Power consumed by pump (BkW)</font></td><td class="xl68" style="vertical-align: bottom;"><font style="font-size: 9pt;">2.10</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Recommended Motor Rating ( H.P)</font></td><td class="xl67" style="vertical-align: bottom;"><font style="font-size: 9pt;">5 H.P</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Pump Type</font><font style="font-size: 9pt;">&nbsp;</font></td><td class="xl69" style="vertical-align: bottom;"><font style="font-size: 9pt;">Self Priming Mud Pump</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Pump Suction/Delivery Size (mm)</font></td><td class="xl67" style="vertical-align: bottom;"><font style="font-size: 9pt;">65*65</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Shaft Sealing</font></td><td class="xl67" style="vertical-align: bottom;"><font style="font-size: 9pt;">Mechanical Seal</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Motor</font></td><td class="xl67" style="vertical-align: bottom;"><font style="font-size: 9pt;">BBL/ REMI</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Impeller Type</font></td><td class="xl67" style="vertical-align: bottom;"><font style="font-size: 9pt;">Half Open</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Lubrication</font></td><td class="xl66" style="vertical-align: bottom;"><font style="font-size: 9pt;">Oil</font><font style="font-size: 9pt;">&nbsp;</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Volute Casing</font></td><td class="xl66" style="vertical-align: bottom;"><font style="font-size: 9pt;">CI</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Shaft</font></td><td class="xl66" style="vertical-align: bottom;"><font style="font-size: 9pt;">SS</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Impeller</font></td><td class="xl66" style="vertical-align: bottom;"><font style="font-size: 9pt;">CI</font></td></tr><tr height="19" style="height: 14.25pt;"><td class="xl66" height="19" colspan="2" style="vertical-align: bottom;"><font style="font-size: 9pt;">Bearing Housing</font></td><td class="xl66" style="vertical-align: bottom;"><font style="font-size: 9pt;">CI</font></td></tr></tbody></table><p class="MsoNormal"><font linotype?=""><font style="color: rgb(0, 0, 0);"></font></font>&nbsp;</p><p class="MsoNormal">Price for Pump with BBL/REMI Motor, Lovejoy Coupling, Coupling Guard </p><p class="MsoNormal">duly assembled on MS Base frame&nbsp; : Rs. 28500/- each set</p><p class="MsoNormal">&nbsp;</p>', 2, '28500.00', '57000.00', 0),
(63, 29, 946, '<p>Your Requirement :Submersible Dewatering Pump</p><p>Make : Darling Pump</p><p>Model : M-3080</p><p>Liquid : Clean / Muddy / Sandy</p><p>Motor Power HP / KW &nbsp;: 30 / 22.5 &nbsp;/ 2980 rpm</p><p>Flow / Capacity : 1200 LPM @ 60 Mtrs</p><p>Head in Range : 40 - 83 Mtrs</p><p>Discharge Size &nbsp;: 100 MM</p><p>Solid Handling : 8 MM</p><p>Drive : Submersible Motor</p><p>MOC :NRV Cast Iron MOC 4 “ Flanged for discharge pipe line</p><p>Control panel Specification:</p><p>With Single phase Preventer, Dry Run Protection, Over Load, Under Load Protection, Star Delta Starter, Complete panel cover in metal sheet box.</p><p><br></p><p>Scope of supply : -</p><p>Pump set with 5 meters cables with Cast Iron NRV 4 “ &amp; Control panel&nbsp;</p>', 2, '220000.00', '440000.00', 0),
(64, 30, 947, '<p><span style="font-size:12.0pt;font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:#171000;mso-ansi-language:EN-IN;mso-fareast-language:EN-IN;mso-bidi-language:\r\nAR-SA">Cartridge Assembly for Pump Model T3ST 45/46</span><br></p>', 2, '250950.00', '501900.00', 0),
(65, 30, 612, '<p>Mechanical Seal for Pump Model T3ST 45/46</p>', 4, '24850.00', '99400.00', 0),
(66, 30, 948, '<p>Gasket Set for Pump Model T3 ST 45/46</p>', 2, '9950.00', '19900.00', 0),
(67, 13, 715, '<p>CN 50 200 G1 S2 L3 bare pump.<br></p>', 1, '22000.00', '22000.00', 0),
(68, 31, 949, '<p>Johnson Pump Spares</p><p><br></p><p>Complete Bearing Housing&nbsp;</p>', 1, '37000.00', '37000.00', 0),
(70, 32, 950, '<h5 style="MARGIN: 0cm 0cm 0pt"><span style="font-family: Arial;"><font linotype?=""><font style="font-size: 11pt;">Type &nbsp; &nbsp; &nbsp; -&nbsp; Centrifugal End suction \r\nback pull out<br></font></font></span><span style="font-family: Arial;"><font linotype?=""><font style="FONT-SIZE: 11pt">Model &nbsp; &nbsp;- CN 150 400 G1 S2 \r\nL3 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</font></font><span style="font-size: 11pt; background-color: transparent;">Q RATED&nbsp; - 200 m3/hr<br></span></span><span style="font-family: Arial;"><font linotype?=""><font style="FONT-SIZE: 11pt">H RATED -35 MTR &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</font></font><span style="background-color: transparent;">Liquid&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Clear Water<br></span></span><span style="font-family: Arial;"><font linotype?=""><font style="FONT-SIZE: 11pt">Recom MOTOR-40 HP&nbsp; /1440 \r\nRPM &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</font></font><span style="background-color: transparent;">Suc * Dis&nbsp;&nbsp; - 200*150 mm</span><span style="background-color: transparent;">&nbsp;<br></span></span><span style="font-family: Arial;"><span style="background-color: transparent;">Scope of Supply &nbsp;: Bare Pump</span></span></h5>', 1, '71500.00', '71500.00', 0),
(71, 33, 945, '<p>CI Impeller (Full Dia) for Pump CN 100 315</p>', 1, '11288.00', '11288.00', 0),
(72, 33, 951, '<p>Cap Nut impeller &nbsp;for CN 100 315</p>', 1, '1450.00', '1450.00', 0),
(73, 33, 952, '<p>Shaft Sleeve for CN 100 315</p>', 1, '5100.00', '5100.00', 0),
(80, 35, 971, '<p>Application : Transfer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Make : Darling</p><p>Model : DT-33&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Flow : 800 LPM</p><p>Head : 10 mtrs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Liquid : Waste water</p><p>Outlet : 80 mm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Solid handling size : 16 mm</p><p>Power : 3 HP/2820 RPM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;Rated voltage : 415 (+6%, -15%)</p><p>Method of starting : DOL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; Class of protection : IP 68</p><p>Min. Submergence : 120 mm&nbsp; &nbsp;Weight of Pump : 46 kg</p><p><span style="text-decoration: underline;">Material of Construction</span></p><p>Diffuser : 2% NICI&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Impeller : ASTM A 217 GR CA 15 (SS-410)</p><p>Shaft : AISI 410</p>', 1, '72500.00', '72500.00', 0),
(81, 34, 958, '<p class="MsoNoSpacing">Application : Transfer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Make : Darling</p><p class="MsoNoSpacing">Type : Submersible Pump&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Model : WP-05D/35</p><p class="MsoNoSpacing">Flow : 500 to 220 LPM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Head : 16.5 to 20 Mtrs</p><p class="MsoNoSpacing">Liquid : Waste water&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Outlet : 80 mm</p><p class="MsoNoSpacing"></p><p class="MsoNoSpacing">Solid handling size : 35 mm &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Power : 5 HP / 2830 RPM</p><p class="MsoNoSpacing">Rated Voltage : 415 (+6%, -15%) &nbsp; &nbsp; &nbsp; Method of starting : DOL</p><p class="MsoNoSpacing">Class of protection : IP 68 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Min. Submergence : 500 mm</p><p class="MsoNoSpacing">Weight of Pump set : 67 kg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Phase : 3 phase</p><p class="MsoNoSpacing"><span style="text-decoration: underline;">Material of Construction</span> &nbsp;</p><p class="MsoNoSpacing">Casing : CI-FG-200 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Impeller : CI-FG-200</p><p class="MsoNoSpacing">Shaft : AISI 410&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;</p><p class="MsoNoSpacing"></p><p class="MsoNoSpacing"></p><p class="MsoNoSpacing"></p><p class="MsoNoSpacing"></p><p class="MsoNoSpacing"></p><p class="MsoNoSpacing"></p><p class="MsoNoSpacing"></p><p class="MsoNoSpacing"></p><p class="MsoNoSpacing"><span style="font-size:8.0pt;font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;"><o:p></o:p></span></p>', 1, '52500.00', '52500.00', 0),
(82, 36, 908, '<p class="MsoNormal"><strong><u><span style="color: black; font-family: &quot;Times New Roman&quot;;">Item Code:&nbsp; 760842027020</span></u></strong></p><p class="MsoNormal"><span style="font-family: &quot;Times New Roman&quot;;"><span style="color: black;">Application: Fluid Circulation &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color: black; background-color: transparent;">Liquid : Caustic Acid 48 %</span></span></p><p class="MsoNormal"><span style="font-family: &quot;Times New Roman&quot;;"><span style="color: black;">Antico Pump Model: NZRP 25 125 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color: rgb(0, 0, 0); background-color: transparent;">Solid % : Clear Liquid</span></span></p><p class="MsoNormal"><span style="color: black; font-family: &quot;Times New Roman&quot;;">Temp&nbsp;&nbsp;&nbsp; : 50 Centi&nbsp; Max &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Suction&nbsp;&nbsp;&nbsp; : Flooded<o:p></o:p></span></p><div><span style="font-family: &quot;Times New Roman&quot;;"><span style="background-color: transparent; color: black;">Capacity&nbsp;&nbsp; : 10\r\nm3/hr &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Head&nbsp;&nbsp;&nbsp;&nbsp; : 15&nbsp; Mtr&nbsp;</span><br></span></div><p class="MsoNormal"><span style="color: black; font-family: &quot;Times New Roman&quot;;">\r\n</span></p><p class="MsoNormal"><span style="color: black; font-family: &quot;Times New Roman&quot;;">Suc * Dis&nbsp;&nbsp; :&nbsp; 40*25\r\nNB &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Sealing&nbsp;&nbsp; : Mechanical Seal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n<o:p></o:p></span></p><p class="MsoNormal"><span style="color: black; font-family: &quot;Times New Roman&quot;;">Motor Power : 3.7 KW / 5 HP / 2900\r\nRPM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\nS.G.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp; 1.5 <o:p></o:p></span></p><p class="MsoNormal"><span style="color: black; font-family: &quot;Times New Roman&quot;;">MOC: Wetted Parts GFRPP Impeller, Casing, Shaft Sleeve: Alloy 20,\r\nPump Shaft : EN 24</span></p><p class="MsoNormal"><span style="font-weight: bold; text-decoration: underline; font-family: &quot;Times New Roman&quot;;">Scope of Supply</span></p><p class="MsoNormal"><span style="font-family: &quot;Times New Roman&quot;;"><strong><span style="color: black;">Pump with BBL Make Std. Foot Mounted Motor,</span></strong><span style="color: black;"><o:p></o:p></span></span></p><p class="MsoNormal"><span style="font-family: &quot;Times New Roman&quot;;"><strong><span style="color: black;">Love Joy Coupling, Coupling Guard, MS Base Plate ,</span></strong><span style="color: black;"><o:p></o:p></span></span></p><p class="MsoNormal">\r\n\r\n\r\n\r\n</p><p class="MsoNormal"><strong><span style="color: black; font-family: &quot;Times New Roman&quot;;">Mountong Bolt Etc.</span></strong><span style="font-family:&quot;Palatino Linotype&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Calibri;\r\ncolor:black"><o:p></o:p></span></p>', 1, '54625.00', '54625.00', 0);
INSERT INTO `quotation_rows` (`id`, `quotation_id`, `item_id`, `description`, `quantity`, `rate`, `amount`, `height`) VALUES
(83, 36, 972, '<p class="MsoNormal"><strong><u><span style="color: rgb(23, 16, 0); font-family: &quot;Times New Roman&quot;;">Item Code: 768181027010</span></u></strong></p><p class="MsoNormal"><span style="font-family: &quot;Times New Roman&quot;;"><span style="color:#171000">Make :Positive Metering Pump &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Pump\r\nType &nbsp;: Hydraulic Diaphragm Pump</span><span style="color:black"><o:p></o:p></span></span></p><p class="MsoNormal"><span style="font-family: &quot;Times New Roman&quot;;"><span style="color: rgb(23, 16, 0);">Pump Model&nbsp; : HD\r\n2017/SZ2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Liquid &nbsp; &nbsp; &nbsp; &nbsp; :&nbsp; Alum</span><span style="color:black"><o:p></o:p></span></span></p><p class="MsoNormal"><span style="font-family: &quot;Times New Roman&quot;;"><span style="color:#171000">Capacity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n: 0 to 220\r\nLPH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\nWorking Pressure&nbsp;&nbsp; :&nbsp; 1.5 kg/cm2</span><span style="color:black"><o:p></o:p></span></span></p><p class="MsoNormal"><span style="font-family: &quot;Times New Roman&quot;;"><span style="color: rgb(23, 16, 0);">Suction&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n:\r\nFlooded &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Suction * Discharge : 1 " * 1 “ Hose Nipple</span><span style="color:black"><o:p></o:p></span></span></p><p class="MsoNormal"><span style="font-family: &quot;Times New Roman&quot;;"><span style="color:#171000">Motor : &nbsp;0.5 HP,\r\n1500 RPM 3 Phase, Foot Mounted</span><span style="color:black">&nbsp;<o:p></o:p></span></span></p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class="MsoNormal"><span style="color: rgb(23, 16, 0); font-family: &quot;Times New Roman&quot;;">MOC :&nbsp; Liquid End &amp; NRV : PP&nbsp;&nbsp; ,&nbsp;\r\nDiaphragm : P T F E</span></p><p class="MsoNormal"><span style="color: rgb(23, 16, 0); font-weight: bold; text-decoration: underline; font-family: &quot;Times New Roman&quot;;">Scope of Supply</span></p><p class="MsoNormal"><span style="font-family: &quot;Times New Roman&quot;;"><strong><span style="color:#171000">Pump Set withRemi /BBL &nbsp;motor,\r\ncoupling, </span></strong><strong style="background-color: transparent;"><span style="color: rgb(23, 16, 0);">coupling guard, base frame, strainer</span></strong></span></p>', 1, '49800.00', '49800.00', 0),
(84, 36, 920, '<p class="MsoNormal"><span style="font-family: &quot;Times New Roman&quot;;"><strong><u><span style="color: black;">Item Code: 760849027010</span></u></strong><u><span style="color: black;">&nbsp;</span></u></span></p><p class="MsoNormal"><span style="font-family: &quot;Times New Roman&quot;;"><span style="color: black;">Antico&nbsp;</span><span style="color: rgb(0, 0, 0); background-color: transparent;">Pump Model: NS 50 160</span></span></p><p class="MsoNormal"><span style="color: black; font-family: &quot;Times New Roman&quot;;">Liquid : Caustic Acid<o:p></o:p></span></p><p class="MsoNormal"><span style="font-family: &quot;Times New Roman&quot;;"><span style="color: black; background-color: transparent;">Capacity&nbsp;&nbsp; : 10&nbsp;\r\nm3/hr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\nHead&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp; 20 Mtr&nbsp;</span><br></span></p><p class="MsoNormal"><span style="color: black; font-family: &quot;Times New Roman&quot;;">\r\nSuc * Dis&nbsp;&nbsp; :&nbsp; 50*40\r\nNB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\nSealing&nbsp;&nbsp; : Mechanical Seal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n<o:p></o:p></span></p><p class="MsoNormal"><span style="color: black; font-family: &quot;Times New Roman&quot;;">Motor Power : 3 HP / 2900\r\nRPM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p><p class="MsoNormal"><span style="color: black; font-family: &quot;Times New Roman&quot;;">MOC: PP &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Solid % : Clear Liquid<o:p></o:p></span></p><p class="MsoNormal"><span style="color: black; font-family: &quot;Times New Roman&quot;;">Temp&nbsp;&nbsp;&nbsp; : 50 Centi&nbsp;\r\nMax&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\nSuction&nbsp;&nbsp;&nbsp; : Flooded<o:p></o:p></span></p><p class="MsoNormal"><strong><span style="color: black; text-decoration: underline; font-family: &quot;Times New Roman&quot;;">Scope of Supply</span></strong></p><p class="MsoNormal"><span style="font-family: &quot;Times New Roman&quot;;"><strong><span style="color: black;">Pump with BBL Make Std. Foot Mounted Motor,</span></strong><span style="color: black;"><o:p></o:p></span></span></p><p class="MsoNormal"><span style="font-family: &quot;Times New Roman&quot;;"><strong><span style="color: black;">Love Joy Coupling, Coupling Guard, MS Base Plate ,</span></strong><span style="color: black;"><o:p></o:p></span></span></p><p>\r\n\r\n\r\n\r\n<strong><span style="font-size: 12pt; color: black; font-family: &quot;Times New Roman&quot;;">Mountong Bolt Etc</span></strong><br></p>', 1, '45500.00', '45500.00', 0),
(91, 38, 958, '<p>Make DARLING Pump</p><p>Model WP05 D - 35 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Application Dewatering</p><p>Type Submersible Waste Water Handling</p><p>Flow Range 45 – 5 M3/hr &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Head Range 10 – 22 Meters</p><p>Capacity 30 M3/hr @ 17 meters &nbsp; &nbsp; &nbsp; &nbsp; Sealing &nbsp;Mechanical seal</p><p>MOC Cast Iron &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Power 5 HP / 2900 RPM</p><p>Minimum Submergence 475 mm &nbsp; &nbsp; &nbsp; &nbsp; SG / PH 1 / 7</p><p>Liquid Water with Light Slurry</p><p>Particle size Max Upto 35 &nbsp;mm &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style="background-color: transparent;">Temperature Ambient</span></p><p>Outlet &nbsp;Size / Starting Method 80 mm / DOL&nbsp;</p><p>Scope of Supply:</p><p>Price for pump set with 10 meters cables and electronic type control panel.</p>', 1, '80500.00', '80500.00', 0),
(92, 39, 977, '<p class="MsoNoSpacing" style="MARGIN: 0in 0in 0pt"><font size="3" face="Palatino Linotype"><strong><u>Spare for \r\nDarling Make Pump Model : WV-01L/40</u></strong></font></p><p class="MsoNoSpacing" style="MARGIN: 0in 0in 0pt"><font size="3" face="Palatino Linotype"></font>&nbsp;</p><p class="MsoNoSpacing" style="MARGIN: 0in 0in 0pt"><font size="3" face="Palatino Linotype">Part no. : \r\n05</font></p><p class="MsoNoSpacing" style="MARGIN: 0in 0in 0pt"><font size="3" face="Palatino Linotype"><br></font></p><p class="MsoNoSpacing" style="MARGIN: 0in 0in 0pt"><font size="3" face="Palatino Linotype">Item : \r\nCasing</font></p><p class="MsoNoSpacing" style="MARGIN: 0in 0in 0pt"><font size="3" face="Palatino Linotype"><br></font><span style="font-family: &quot;Palatino Linotype&quot;; font-size: medium; background-color: transparent;">MOC : \r\nCI-FG-200</span></p>', 1, '8480.00', '8480.00', 0),
(93, 22, 926, '<p>WV 03 L/40<br></p>', 1, '100000.00', '100000.00', 0),
(94, 18, 708, '<p>CB 200 200 G1 Pump with 25 HP,1500 RPM motor.</p>', 1, '225000.00', '225000.00', 0),
(95, 37, 975, '<p>Application : Transfer &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Make : Johnson</p><p>Type : End suction back pullout type &nbsp; &nbsp; &nbsp; Model : CCR 25-125 R6 M2 L3</p><p>Head : 18 mtrs &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Flow : 10 m3/hr</p><p>Liquid : Brine Solution &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; PH/SG/Temp : 7/1/Ambient</p><p>Reccd. Power : 2 HP/2900 RPM &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Suc*Dis : 32*25 mm</p><p>Suction : Flooded &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Impeller : Half-open</p><p>Sealing : Mechanical Seal &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MOC (Casing/Impeller) : SS/SS</p><p><span style="text-decoration: underline;">Scope of supply </span>: Pump with Remi/BBL make Motor, Coupling, Coupling guard dully assembled on base frame with fasteners.&nbsp;<br></p>', 1, '50800.00', '50800.00', 0),
(96, 37, 974, '<p>Application : Transfer &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Make : Johnson</p><p>Type : End suction back pullout type &nbsp; &nbsp; &nbsp; Model : CN 125 400 G1 S2 L3</p><p>Head : 50 mtrs &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Flow : 180 m3/hr</p><p>Liquid : Clear Water &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; PH/SG/Temp : 7/1/Ambient</p><p>Reccd. Power : 50 HP/1500 RPM &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Suc*Dis : 150*125 mm</p><p>Suction : Negative upto 1 mtrs with &nbsp; &nbsp; &nbsp; &nbsp; Impeller : Closed</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;<span style="background-color: transparent;">foot-valve</span><br></p><p>Sealing : Gland Packing &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MOC (Casing/Impeller) : CI/CI</p><p><span style="text-decoration: underline;">Scope of supply :</span> Pump with Remi/BBL make Motor, Coupling, Coupling guard dully assembled on base frame with fasteners.&nbsp;</p>', 1, '162800.00', '162800.00', 0),
(97, 37, 975, '<p>Application : Transfer &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Make : Johnson</p><p>Type : End suction back pullout type &nbsp; &nbsp; &nbsp; &nbsp;Model : CCR 25-125 R6 M2 L3</p><p>Head : 15 mtrs &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Flow : 3 m3/hr</p><p>Liquid : 99% Caustic &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; PH/SG/Temp : 7/1/Ambient</p><p>Reccd. Power : 2 HP/2900 RPM &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Suc*Dis : 32*25 mm</p><p>Suction : Flooded &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Impeller : Half-open</p><p>Sealing : Mechanical Seal &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MOC (Casing/Impeller) : SS/SS</p><p><span style="text-decoration: underline;">Scope of supply :</span> Pump with Remi/BBL make Motor, Coupling, Coupling guard dully assembled on base frame with fasteners.&nbsp;<br></p>', 1, '50800.00', '50800.00', 0),
(98, 40, 980, '<p>Make : Johnson&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Type : Self priming centrifugal pump</p><p>Model : FRE 80-170&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Application : Colony Water Transfer</p><p>Head : 25 mtrs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Flow : 60 m3/hr</p><p>Liquid : Clear Water&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; PH/SG/Temp: 7/1/ambient</p><p><span style="background-color: transparent;">Suc*Dis : 80*80 mm</span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reccd. Power : 12.5 HP/2900 RPM &nbsp; &nbsp;</p><p>Impeller : Halfopen&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style="background-color: transparent;">Suction : Negative upto 3-4 mtrs with foot-valve</span></p><p><span style="background-color: transparent;">Sealing : Mechanical Seal&nbsp; &nbsp; MOC (Casing/Impeller) : SS 316/SS 316</span></p><p><span style="background-color: transparent;"><span style="text-decoration: underline;">Scope of supply :</span>&nbsp;&nbsp; &nbsp; Pump with Remi/BBL make motor with coupling, coupling guard dully assembled on base frame with fasteners&nbsp;</span></p>', 1, '121630.00', '121630.00', 0),
(99, 40, 981, '<p>Make : Johnson&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Type : End suction back pullout pump</p><p>Model : CCR 40 250 A20 M3 L3 &nbsp; &nbsp; &nbsp; &nbsp; Application : Transfer</p><p>Head : 80 mtrs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Flow : 30 m3/hr</p><p>Liquid : H2SO4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PH/SG/Temp: 2/1.05/ambient</p><p><span style="background-color: transparent;">Suc*Dis : 65*40 mm</span>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;Reccd. Power : 25 HP/2900 RPM &nbsp; &nbsp;</p><p>Impeller : Closed&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style="background-color: transparent;">Suction : Flooded</span></p><p><span style="background-color: transparent;">Sealing : Mechanical Seal&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MOC (Casing/Impeller) : Alloy 20/Alloy 20</span></p><p><span style="background-color: transparent;"><span style="text-decoration: underline;">Scope of supply :</span>&nbsp;&nbsp; &nbsp; Pump with Remi/BBL make motor with coupling, coupling guard dully assembled on base frame with fasteners&nbsp;</span></p>', 1, '240830.00', '240830.00', 0),
(100, 41, 733, '<p>CCR 50 160 R6 S2 L3</p>', 1, '62900.00', '62900.00', 0),
(101, 42, 731, '<p>CCR 32 160 R6 S2 L3</p>', 1, '44000.00', '44000.00', 0),
(102, 43, 605, '<p>R 20 DG Gear Pump</p>', 1, '75000.00', '75000.00', 0),
(103, 44, 982, '<p>ED-01</p>', 2, '16800.00', '33600.00', 0),
(104, 45, 601, '<p>RT 80 Gear Pump&nbsp;</p>', 1, '8900.00', '8900.00', 0),
(106, 46, 983, '<p>Rotor Set R 50 SL&nbsp;</p>', 1, '11900.00', '11900.00', 0),
(108, 47, 984, '<p>Shaft HE 120</p>', 1, '2400.00', '2400.00', 0),
(110, 49, 985, '<p>Pump Casing KGEN 16 3</p>', 1, '10000.00', '10000.00', 0),
(112, 50, 605, '<p>R 20 DG Gear Pump</p>', 1, '54000.00', '54000.00', 0),
(114, 51, 986, '<p><br></p>', 1, '50000.00', '50000.00', 0),
(115, 52, 987, '<p>Make : Johnson&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="background-color: transparent;">Type :&nbsp;</span><span style="background-color: transparent;">End Suction Back Pullout Type</span></p><p>Model :&nbsp; CN 32 200 G1 S2 L3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Application : Transfer</p><p>Head : 35 mtrs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;Flow : 10 m3/hr</p><p>Liquid : Clear Water&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;PH/SG/Temp : 7/1/ambient</p><p>Power : 5 HP/2900 RPM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;Suc*Dis : 50*32 mm</p><p>Suction : Flooded&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;Impeller : Closed</p><p>Sealing : Gland Packing&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; MOC : CI/CI</p><p><span style="text-decoration: underline;">Scope of supply :</span>&nbsp;Pump with Remi/BBL make motor with coupling, coupling guard dully assembled on base frame.&nbsp;</p>', 1, '31250.00', '31250.00', 0),
(116, 53, 601, '<div><font face="Palatino Linotype" linotype?="">Make : \r\nTushaco</font></div><p>\r\n</p><div><font face="Palatino Linotype" linotype?="">Pump Model \r\n: RT-80</font></div>', 1, '7650.00', '7650.00', 0),
(117, 54, 982, '<p class="MsoBodyText3" style="MARGIN: 0in 0in 0pt"><font linotype?="">Item Description&nbsp;&nbsp;&nbsp; : Electronic \r\nDiaphragm Dosing Pump</font></p><p class="MsoBodyText3" style="MARGIN: 0in 0in 0pt"><font linotype?="">Model&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ANT \r\nED 01</font></p><p class="MsoBodyText3" style="MARGIN: 0in 0in 0pt"><font linotype?="">Capacity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;: 0 to 4 \r\nLPH</font></p><p class="MsoBodyText3" style="MARGIN: 0in 0in 0pt"><font linotype?="">Pressure&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;: 0 to \r\n4 kg/cm2</font></p><p class="MsoBodyText3" style="MARGIN: 0in 0in 0pt"><font linotype?="">Suc*Dis&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;: ¼” * \r\n¼”</font></p><p class="MsoBodyText3" style="MARGIN: 0in 0in 0pt"><font linotype?="">MOC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;: Liquid end: PP</font></p><p class="MsoBodyText3" style="MARGIN: 0in 0in 0pt"><font linotype?="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Diaphragm: \r\nPP</font></p><p class="MsoBodyText3" style="MARGIN: 0in 0in 0pt"><font linotype?="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NRV: \r\nPP</font></p><p class="MsoBodyText3" style="MARGIN: 0in 0in 0pt"><font linotype?="">Drive&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: Single phase 230 \r\nV, 50 hz</font></p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class="MsoBodyText3" style="MARGIN: 0in 0in 0pt">Accessories &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; :&nbsp;Strainer cum foot-vale, 1.5 mtrs. tube&nbsp;</p>', 1, '8502.50', '8502.50', 0),
(120, 48, 755, '<p>Mechanical Seal KGEN 11 3</p>', 6, '1400.00', '8400.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `receipt_breakups`
--

CREATE TABLE IF NOT EXISTS `receipt_breakups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ref_type` varchar(30) NOT NULL,
  `new_ref_no` varchar(100) DEFAULT NULL,
  `invoice_id` int(10) NOT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `receipt_voucher_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `receipt_vouchers`
--

CREATE TABLE IF NOT EXISTS `receipt_vouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_no` varchar(10) NOT NULL,
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
  `edited_on` date NOT NULL,
  `cheque_no` varchar(20) NOT NULL,
  `receipt_type` varchar(25) NOT NULL,
  `advance_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `reference_balances`
--

CREATE TABLE IF NOT EXISTS `reference_balances` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `ledger_account_id` int(25) NOT NULL,
  `reference_no` varchar(30) NOT NULL,
  `credit` decimal(15,2) NOT NULL,
  `debit` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `reference_balances`
--

INSERT INTO `reference_balances` (`id`, `ledger_account_id`, `reference_no`, `credit`, `debit`) VALUES
(7, 399, 'NIL', '771700.00', '0.00'),
(8, 400, 'Op.', '3620029.47', '0.00'),
(9, 401, 'Op', '3464263.00', '0.00'),
(10, 402, 'Op', '1135420.00', '0.00'),
(11, 403, 'Op', '263741.00', '0.00'),
(12, 147, 'Op', '250244.40', '0.00'),
(13, 149, 'Op', '643170.50', '0.00'),
(14, 406, 'Op', '380233.31', '0.00'),
(15, 404, 'Op', '5576200.91', '0.00'),
(16, 405, 'Op', '844740.34', '0.00'),
(17, 408, 'Op', '65531.68', '0.00'),
(18, 407, 'Op', '24000.00', '0.00'),
(19, 409, 'Op', '13450.00', '0.00'),
(20, 411, 'Op', '40147.00', '0.00'),
(21, 413, 'Op', '71428.00', '0.00'),
(22, 412, 'Op', '176240.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `reference_details`
--

CREATE TABLE IF NOT EXISTS `reference_details` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `ledger_account_id` int(25) NOT NULL,
  `receipt_voucher_id` int(25) NOT NULL,
  `payment_voucher_id` int(10) NOT NULL,
  `invoice_id` int(10) NOT NULL,
  `reference_no` varchar(50) NOT NULL,
  `credit` decimal(10,2) NOT NULL,
  `debit` decimal(10,2) NOT NULL,
  `reference_type` varchar(30) NOT NULL,
  `invoice_booking_id` int(10) NOT NULL,
  `credit_note_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `reference_details`
--

INSERT INTO `reference_details` (`id`, `ledger_account_id`, `receipt_voucher_id`, `payment_voucher_id`, `invoice_id`, `reference_no`, `credit`, `debit`, `reference_type`, `invoice_booking_id`, `credit_note_id`) VALUES
(7, 399, 0, 0, 0, 'NIL', '771700.00', '0.00', 'New Reference', 0, 0),
(8, 400, 0, 0, 0, 'Op.', '3620029.47', '0.00', 'New Reference', 0, 0),
(9, 401, 0, 0, 0, 'Op', '3464263.00', '0.00', 'New Reference', 0, 0),
(10, 402, 0, 0, 0, 'Op', '1135420.00', '0.00', 'New Reference', 0, 0),
(11, 403, 0, 0, 0, 'Op', '263741.00', '0.00', 'New Reference', 0, 0),
(12, 147, 0, 0, 0, 'Op', '250244.40', '0.00', 'New Reference', 0, 0),
(13, 149, 0, 0, 0, 'Op', '643170.50', '0.00', 'New Reference', 0, 0),
(14, 406, 0, 0, 0, 'Op', '380233.31', '0.00', 'New Reference', 0, 0),
(15, 404, 0, 0, 0, 'Op', '5576200.91', '0.00', 'New Reference', 0, 0),
(16, 405, 0, 0, 0, 'Op', '844740.34', '0.00', 'New Reference', 0, 0),
(17, 408, 0, 0, 0, 'Op', '65531.68', '0.00', 'New Reference', 0, 0),
(18, 407, 0, 0, 0, 'Op', '24000.00', '0.00', 'New Reference', 0, 0),
(19, 409, 0, 0, 0, 'Op', '13450.00', '0.00', 'New Reference', 0, 0),
(20, 411, 0, 0, 0, 'Op', '40147.00', '0.00', 'New Reference', 0, 0),
(21, 413, 0, 0, 0, 'Op', '71428.00', '0.00', 'New Reference', 0, 0),
(22, 412, 0, 0, 0, 'Op', '176240.00', '0.00', 'New Reference', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales_orders`
--

CREATE TABLE IF NOT EXISTS `sales_orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `employee_id` int(10) NOT NULL,
  `customer_address` text NOT NULL,
  `discount_type` tinyint(1) NOT NULL,
  `discount_per` decimal(4,2) NOT NULL,
  `discount` decimal(15,2) NOT NULL,
  `ed_description` text NOT NULL,
  `exceise_duty` decimal(10,2) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `pnf_type` tinyint(1) NOT NULL,
  `pnf_per` decimal(4,2) NOT NULL,
  `pnf` decimal(10,2) NOT NULL,
  `total_after_pnf` decimal(15,2) NOT NULL,
  `additional_note` text NOT NULL,
  `company_id` int(10) NOT NULL,
  `process_status` varchar(30) NOT NULL,
  `quotation_id` int(10) DEFAULT NULL,
  `transporter_id` int(10) NOT NULL,
  `expected_delivery_date` date NOT NULL,
  `delivery_description` text NOT NULL,
  `documents_courier_id` int(10) NOT NULL,
  `customer_po_no` varchar(100) NOT NULL,
  `po_date` date NOT NULL,
  `dispatch_name` varchar(100) NOT NULL,
  `dispatch_mobile` varchar(10) NOT NULL,
  `dispatch_email` varchar(100) NOT NULL,
  `dispatch_address` text NOT NULL,
  `road_permit_required` varchar(5) NOT NULL,
  `form49` varchar(5) NOT NULL,
  `so1` varchar(10) NOT NULL,
  `so2` int(10) NOT NULL,
  `so3` varchar(10) NOT NULL,
  `so4` varchar(10) NOT NULL,
  `created_by` int(10) NOT NULL,
  `edited_by` int(10) NOT NULL,
  `created_on` date NOT NULL,
  `edited_on` date NOT NULL,
  `edited_on_time` varchar(100) NOT NULL,
  `created_on_time` varchar(100) NOT NULL,
  `job_card_status` varchar(10) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `sales_orders`
--

INSERT INTO `sales_orders` (`id`, `customer_id`, `employee_id`, `customer_address`, `discount_type`, `discount_per`, `discount`, `ed_description`, `exceise_duty`, `total`, `pnf_type`, `pnf_per`, `pnf`, `total_after_pnf`, `additional_note`, `company_id`, `process_status`, `quotation_id`, `transporter_id`, `expected_delivery_date`, `delivery_description`, `documents_courier_id`, `customer_po_no`, `po_date`, `dispatch_name`, `dispatch_mobile`, `dispatch_email`, `dispatch_address`, `road_permit_required`, `form49`, `so1`, `so2`, `so3`, `so4`, `created_by`, `edited_by`, `created_on`, `edited_on`, `edited_on_time`, `created_on_time`, `job_card_status`) VALUES
(1, 40, 4, 'Pali-Marwar-306401\r\nRajastahn', 1, '7.50', '8775.00', '', '0.00', '108225.00', 1, '0.00', '0.00', '108225.00', 'Pali-Marwar-306401\r\nRajastahn', 25, 'Pulled From Quotation', 4, 7, '2017-05-15', 'Material Will be booked On Paid Basis FOR Pali.', 6, '4600015892', '2017-03-21', 'Tapasvi Vaidya', '9001099411', 'tapasvi.vaidya@lnbgroup.com', 'Pali-Marwar-306401\r\nRajastahn', 'No', 'No', 'STL', 1, 'BE-3250', '16-17', 4, 4, '2017-03-27', '2017-03-27', '2017-03-27 11:50:24AM', '2017-03-27 11:42:14AM', 'Pending'),
(2, 93, 4, 'C-17,Panchwati Colony\r\nNear Bhaskar Circle,\r\nRatanada , Jodhpur -342001', 1, '5.00', '1777.00', '', '0.00', '33763.00', 0, '0.00', '0.00', '33763.00', 'Party Will be  pay actual Freight Amount.', 27, 'Pulled From Quotation', 8, 2, '2017-04-10', 'Freight "TO-PAY" basis', 6, 'FS/RS/16-17/1058', '2017-03-17', 'Mangesh Kawade', '7742505505', 'Mangesh.KAWADE@sodexo.com', 'C-17,Panchwati Colony\r\nNear Bhaskar Circle,\r\nRatanada , Jodhpur -342001', 'No', 'No', 'FMSL', 1, 'BE-3247', '16-17', 4, 8, '2017-03-27', '2017-03-28', '2017-03-28 01:10:36PM', '2017-03-27 01:17:56PM', 'Pending'),
(3, 8, 7, 'Unit Of - DCM Shriram Industries Limited\r\nShriram Nagar, Kota-324004', 1, '7.50', '3086.25', '', '0.00', '38063.75', 0, '0.00', '0.00', '38063.75', 'Unit Of - DCM Shriram Industries Limited\r\nShriram Nagar, Kota-324004', 25, 'New', 0, 15, '2017-04-05', 'Freight "TO-PAY" basis', 6, 'OSC/4800001336', '2017-02-28', 'Ram Kshetri', '9929590865', 'ramkshetri@dcmsr.com', 'Unit Of - DCM Shriram Industries Limited\r\nShriram Nagar, Kota-324004', 'No', 'No', 'STL', 2, 'BE-2932', '16-17', 8, 0, '2017-03-28', '1970-01-01', '', '2017-03-28 11:40:11AM', 'Pending'),
(4, 31, 11, '( A Unit of Shree Cement Ltd )\r\nJind Road\r\nKhukhrana,Assan Kalan\r\nPanipat Haryana-132103', 1, '20.00', '13790.00', '', '0.00', '55160.00', 0, '0.00', '0.00', '55160.00', 'Document Delivery Address:\r\nShree Cement Ltd.,\r\nBangur Nagar, P.O. No.: 33\r\nBeawer - 305901\r\n\r\nPayment Terms : 30 days of Receipt of PO', 25, 'New', 0, 1, '2017-04-20', 'Paid Basis Panipat Transporter Godown Dispatch From Indore Darling Pumps', 6, '422190', '2017-03-22', 'Mr Vivek Saxena', '9214337462', 'saxenav@shreecementltd.com', '( A Unit of Shree Cement Ltd )\r\nJind Road\r\nKhukhrana,Assan Kalan\r\nPanipat Haryana-132103', 'No', 'No', 'STL', 3, 'BE-3240', '16-17', 11, 11, '2017-03-28', '2017-03-28', '2017-03-28 01:03:29PM', '2017-03-28 12:35:55PM', 'Pending'),
(5, 9, 7, 'P.O. Adityanagar - 326 520\r\nMORAK, Distt. Kota (Rajasthan)', 0, '0.00', '2200.00', '', '0.00', '42500.00', 1, '2.00', '850.00', '43350.00', 'Direct for payment within 30 days. ', 25, 'New', 0, 15, '2017-04-06', 'Freight "TO-PAY" basis upto kota', 6, 'VPG/1100003705', '2017-02-20', 'Vipesh Gupta', '9351468146', 'vipesh.gupta@mangalamcement.com', '93,Dashera Schema, Dadabari\r\nKOTA-324009 (Raj.)', 'No', 'No', 'STL', 4, 'BE-3360', '16-17', 8, 8, '2017-03-28', '2017-03-28', '2017-03-28 02:53:59PM', '2017-03-28 12:55:30PM', 'Pending'),
(6, 22, 11, 'Unit-Birla White\r\nRajashree Nagar, Kharia Khangar\r\nVillage :-Kharia Khangar\r\nDist. Jodhpur 342606', 1, '10.00', '2600.00', '', '0.00', '23400.00', 0, '0.00', '0.00', '23400.00', 'Document delivery Address\r\nUltratech Cement Ltd.,\r\n(Unit - Birla White )\r\nD-7, Shastri Nagar,\r\nJodhpur - 342003\r\n\r\nPayment Terms: 30 days of Receipt of Material', 25, 'New', 0, 2, '2017-05-16', 'To Pay Basis', 6, 'BW/BWJ/6202007086', '2017-03-04', 'Mr. Neeraj Gautam', '2920264040', 'neeraj.gautam@adityabirla.com', 'Unit-Birla White\r\nRajashree Nagar, Kharia Khangar\r\nVillage :-Kharia Khangar\r\nDist. Jodhpur 342606\r\n', 'No', 'No', 'STL', 5, 'BE-2827', '16-17', 11, 0, '2017-03-28', '1970-01-01', '', '2017-03-28 01:19:30PM', 'Pending'),
(7, 29, 11, 'Bangur City\r\nPO RAS-306107\r\nTehsil :Jaitaran\r\nDist. Pali\r\n', 0, '0.00', '0.00', '', '0.00', '340000.00', 0, '0.00', '0.00', '340000.00', 'Document Delivery Address\r\nShree Cement Ltd.,\r\nBangur Nagar, P.O. No.: 33,\r\nBeawer - 305901\r\n\r\nPayment Terms : 30 days from receipt Material', 25, 'New', 0, 7, '2017-05-26', 'Paid Basis : Beawer Transporter Goodown', 6, '420061', '2017-03-10', 'Mr. Vivek Saxena', '9214337462', 'saxenav@shreecementltd.com', 'Bangur City\r\nPO RAS-306107\r\nTehsil :Jaitaran\r\nDist. Pali\r\n', 'No', 'No', 'STL', 6, 'BE-3368', '16-17', 11, 11, '2017-03-28', '2017-03-28', '2017-03-28 02:11:49PM', '2017-03-28 01:56:56PM', 'Pending'),
(8, 29, 11, 'Bangur City\r\nPO RAS-306107\r\nTehsil :Jaitaran\r\nDist. Pali\r\n', 0, '0.00', '0.00', '', '0.00', '350774.00', 0, '0.00', '0.00', '350774.00', 'Document Delivery Address\r\nShree Cement Ltd.,\r\nBangur Nagar, P.O. No.: 33,\r\nBeawer - 305901\r\n\r\nPayment Terms : 30 days from receipt Material', 25, 'New', 0, 7, '2017-05-18', 'Paid Basis Beawer Transporter Goown', 6, '419575', '2017-03-08', 'Mr Vivek Saxena', '9214337462', 'saxenav@shreecementltd.com', 'Bangur City\r\nPO RAS-306107\r\nTehsil :Jaitaran\r\nDist. Pali\r\n', 'No', 'No', 'STL', 7, 'BE-3368', '16-17', 11, 11, '2017-03-28', '2017-03-28', '2017-03-28 02:14:48PM', '2017-03-28 02:09:21PM', 'Pending'),
(9, 30, 11, 'Village -Khapradig ,Teh :-Simga\r\nBhatapara ,Baloda Bazar Raipur -493332\r\nChattisgarh', 0, '0.00', '0.00', '', '0.00', '175387.00', 0, '0.00', '0.00', '175387.00', 'Document Delivery Address\r\nShree Raipur Cement Plant (SRCP),\r\n(A Unit of Shree Cement Ltd),\r\nC-1, Krishnayan Colony, Near City Fuels Petrol Pump, Bhatapara Road, Baloda Bazaar,\r\n Chattisgarh - 493332 (C.G.)\r\n\r\nPayment Terms: 30 Days of Receipt of Material\r\n', 25, 'New', 0, 27, '2017-04-05', 'Paid Basis Transporter Godown Baloda Bazar', 30, '418360', '2017-03-04', 'Mr. Shadaab Rizvi', '8349301232', 'rizvis@shreecementltd.com', 'Village -Khapradig ,Teh :-Simga\r\nBhatapara ,Baloda Bazar Raipur -493332\r\nChattisgarh', 'No', 'Yes', 'STL', 8, 'BE-3241', '16-17', 11, 11, '2017-03-28', '2017-03-28', '2017-03-28 02:42:38PM', '2017-03-28 02:36:30PM', 'Pending'),
(10, 30, 11, 'Village -Khapradig ,Teh :-Simga\r\nBhatapara ,Baloda Bazar Raipur -493332\r\nChattisgarh', 0, '0.00', '0.00', '', '0.00', '340000.00', 0, '0.00', '0.00', '340000.00', 'Shree Raipur Cement Plant (SRCP)\r\n(A unit of Shee Cement Ltd),\r\nC-1, Krishnayan Colony, Near City Fuels Petrol Pump,\r\nBhatapara Road, Baloda Bazaar,\r\nChhattishgarh - 493332 (CG)', 25, 'New', 0, 27, '2017-04-29', 'Paid Basis Transporter Godown Baloda Bazar', 30, '420688', '2017-03-15', 'Mr Shadaab Rizvi', '8349301232', 'rizvis@shreecementltd.com', 'Village -Khapradig ,Teh :-Simga\r\nBhatapara ,Baloda Bazar Raipur -493332\r\nChattisgarh', 'No', 'Yes', 'STL', 9, 'BE-3241', '16-17', 11, 0, '2017-03-28', '1970-01-01', '', '2017-03-28 02:56:08PM', 'Pending'),
(11, 94, 7, '206, MTN, Neemach Kheda Main Road, Neenach Mata Scheme, Dewali, UDAIPUR-313001 (Raj.)', 0, '0.00', '0.00', '', '0.00', '29700.00', 0, '0.00', '0.00', '29700.00', 'Direct for payment within 07 days', 27, 'New', 0, 29, '2017-04-01', 'Hand delivery', 29, 'email confirmation by Mr. Ali Hussain', '2017-03-22', 'Mr. Ali Hussain', '9828186876', 'ahcorp.udr@gmail.com', '206, MTN, Neemach Kheda Main Road, Neenach Mata Scheme, Dewali, UDAIPUR-313001 (Raj.)', 'No', 'No', 'FMSL', 2, 'BE-3065', '16-17', 8, 0, '2017-03-28', '1970-01-01', '', '2017-03-28 03:20:15PM', 'Pending'),
(12, 81, 15, 'B-25-26, RIICO Housing Colony\r\nRoad No. 1-D, V.K.I. Area, Jaipur-302013', 1, '6.00', '5808.00', '', '0.00', '90992.00', 0, '0.00', '0.00', '90992.00', 'Direct for payment within 07 days', 27, 'New', 0, 1, '2017-04-01', 'Freight "TO-PAY" basis', 6, 'Email confirmation by Mr. Vinod Sharma', '2017-03-27', 'Vinod Sharma', '9414077213', 'vks12.crystal@gmail.com', 'B-25-26, RIICO Housing Colony\r\nRoad No. 1-D, V.K.I. Area, Jaipur-302013', 'No', 'No', 'FMSL', 3, 'BE-3258', '16-17', 8, 8, '2017-03-28', '2017-04-01', '2017-04-01 09:31:08AM', '2017-03-28 04:17:57PM', 'Pending'),
(13, 1, 11, 'Dariba Smelter Complex\r\nRajpura Dariba Mines\r\nDist.: Rajsamand (Raj.)\r\nPin no- 313211', 0, '0.00', '0.00', '', '0.00', '90250.00', 0, '0.00', '0.00', '90250.00', 'Direct for payment within 30 days after receipt of material.', 25, 'New', 0, 16, '2017-04-03', 'Your Authorised vehicle', 6, '2000037157/4100085926', '2016-12-13', 'Mr. Sujat', '8003195347', 'Aditya.Jalan@vedanta.co.in', 'Dariba Smelter Complex\r\nRajpura Dariba Mines\r\nDist.: Rajsamand (Raj.)\r\nPin no- 313211', 'No', 'No', 'STL', 10, 'BE-3146', '16-17', 8, 0, '2017-03-29', '1970-01-01', '', '2017-03-29 11:43:23AM', 'Pending'),
(14, 37, 15, 'RIICO INDUSTRIAL AREA NEEMRANA, DIST. ALWAR (RAJ)-301705', 0, '0.00', '0.00', '', '0.00', '198000.00', 0, '0.00', '0.00', '198000.00', 'Direct for payment within 15 days from receipt of material', 25, 'New', 0, 1, '2017-04-05', 'Freight "PAID" basis', 6, '2400000230', '2017-02-10', 'D K Jain', '9413586723', 'dk.jain@ginniint.com', 'RIICO INDUSTRIAL AREA NEEMRANA, DIST. ALWAR (RAJ)-301705', 'No', 'No', 'STL', 11, 'BE-3049', '16-17', 8, 0, '2017-03-30', '1970-01-01', '', '2017-03-30 12:05:42PM', 'Pending'),
(15, 18, 11, 'Chanderia Smelter Complex (CPP)\r\nPO Putholi\r\nDt. Chittorgarh', 0, '0.00', '0.00', '', '0.00', '13455.00', 0, '0.00', '0.00', '13455.00', 'Direct for payment within 30 days', 25, 'New', 0, 7, '2017-04-04', 'Freight "PAID" basis', 6, '4100086596', '2017-01-20', 'Kavya Khazanchi', '1472254819', 'commercial@vedanta.co.in', 'Chanderia Smelter Complex (CPP)\r\nPO Putholi\r\nDt. Chittorgarh', 'No', 'No', 'STL', 12, 'BE-3079', '16-17', 8, 0, '2017-03-30', '1970-01-01', '', '2017-03-30 12:47:05PM', 'Pending'),
(16, 66, 15, 'RSWM Limited,\r\n(Unit- Mandpam)\r\nPB No. 13\r\nBhilwara-311001', 1, '12.50', '2865.63', '', '0.00', '20059.38', 0, '0.00', '0.00', '20059.38', 'Direct for payment within 30 days', 25, 'New', 0, 7, '2017-04-05', 'Freight "TO-PAY'' basis', 6, 'SPA/151601392', '2017-01-21', 'Ashish Tomar', '9782258181', 'stores.mandapam@lnjbhilwara.com', 'RSWM Limited,\r\n(Unit- Mandpam)\r\nPB No. 13\r\nBhilwara-311001', 'No', 'No', 'STL', 13, 'BE-3320', '16-17', 8, 0, '2017-03-30', '1970-01-01', '', '2017-03-30 03:41:04PM', 'Pending'),
(17, 70, 15, 'SPL 1, Tapukara Industrial\r\nArea, Khuskhera-301707\r\nDistt-Alwar', 0, '0.00', '0.00', '', '0.00', '50000.00', 0, '0.00', '0.00', '50000.00', 'Direct for payment within 30 days after after receipt of material ', 25, 'New', 0, 3, '2017-04-03', '"FREIGHT PAID DOOR DELIVERY" Basis', 3, '36507,0 ', '2017-03-16', 'Amit Jain', '8890095343', 'amitjain1@hondacarindia.com', 'SPL 1, Tapukara Industrial\r\nArea, Khuskhera-301707\r\nDistt-Alwar', 'No', 'No', 'STL', 14, 'BE-3226', '16-17', 8, 0, '2017-03-30', '1970-01-01', '', '2017-03-30 06:00:12PM', 'Pending'),
(18, 70, 15, 'SPL 1, Tapukara Industrial\r\nArea, Khuskhera-301707\r\nDistt-Alwar', 1, '5.00', '70.40', '', '0.00', '1337.60', 0, '0.00', '0.00', '1337.60', 'Direct for payment within 30 days\r\nwith this suppy your order is fully executed.', 25, 'New', 0, 3, '2017-04-04', '"FREIGHT PAID DOOR DELIVERY" basis', 3, '35664,0', '2017-01-30', 'Amit Jain', '8890095343', 'amitjain1@hondacarindia.com', 'SPL 1, Tapukara Industrial\r\nArea, Khuskhera-301707\r\nDistt-Alwar', 'No', 'No', 'STL', 15, 'BE-3226', '16-17', 8, 0, '2017-03-30', '1970-01-01', '', '2017-03-30 06:11:50PM', 'Pending'),
(19, 110, 11, '(Khushkhera Cement Grinding Project)\r\nPlot No. SP3-II, A-1, \r\nRIICO Industrial Area\r\nBhiwadi, Taluka-Tijara,\r\nKhushkhera-301707\r\nDistt: Alwar (Raj.)', 1, '20.00', '2760.00', '', '0.00', '11040.00', 0, '14.50', '0.00', '11040.00', 'Direct for payment within 30 days\r\n\r\nDocument delivery Address:\r\nShree Cement Limited,\r\nBangur Nagar\r\nBeawar-305901\r\n', 25, 'New', 0, 1, '2017-04-03', 'Freight "PAID" basis', 6, '415110', '2017-02-15', 'Navneet', '9251077025', 'navneet13596@shreecementltd.com', '(Khushkhera Cement Grinding Project)\r\nPlot No. SP3-II, A-1, \r\nRIICO Industrial Area\r\nBhiwadi, Taluka-Tijara,\r\nKhushkhera-301707\r\nDistt: Alwar (Raj.)', 'No', 'No', 'STL', 16, 'BE-3031', '16-17', 8, 0, '2017-03-30', '1970-01-01', '', '2017-03-30 07:00:57PM', 'Pending'),
(20, 29, 11, 'Bangur City\r\nPO RAS-306107\r\nTehsil :Jaitaran\r\nDist. Pali\r\n', 1, '20.00', '7100.00', '', '0.00', '28400.00', 0, '0.00', '0.00', '28400.00', 'Direct for payment within 30 days\r\nDocument Despatch Address:\r\nBangur Nagar, Beawar-305901', 25, 'New', 0, 7, '2017-04-04', 'Freight "PAID" basis', 6, '419574', '2017-03-08', 'Vivek Saxena', '9214337462', 'saxena@shreecementltd.com', 'Bangur City\r\nPO RAS-306107\r\nTehsil :Jaitaran\r\nDist. Pali\r\n', 'No', 'No', 'STL', 17, 'BE-3064', '16-17', 8, 0, '2017-03-31', '1970-01-01', '', '2017-03-31 12:53:45PM', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_rows`
--

CREATE TABLE IF NOT EXISTS `sales_order_rows` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sales_order_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `excise_duty` varchar(5) NOT NULL,
  `sale_tax_id` int(10) NOT NULL,
  `height` int(10) NOT NULL,
  `processed_quantity` int(5) NOT NULL DEFAULT '0',
  `source_type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `sales_order_rows`
--

INSERT INTO `sales_order_rows` (`id`, `sales_order_id`, `item_id`, `description`, `quantity`, `rate`, `amount`, `excise_duty`, `sale_tax_id`, `height`, `processed_quantity`, `source_type`) VALUES
(2, 1, 930, '<p>Pump Model : CCR 40 160</p><p>Head: 30 Meters</p><p>Flow: 30 M3/Hr</p><p>MOC: SS 316 MOC Pump Shaft, Casing , Shaft Sleeve, Impeller</p><p>Sealing: Gland Packing</p><p>Impeller Type: Closed</p><p>Power: 7.5 HP/2900 RPM</p><p>Liquid :Effluent Reject Water with Colour &amp; TDS 36000</p><p>Temp.: Ambient / S G : 1</p><p>Suc*Dis Size: 50 x 32 MM / P H : 7</p><p>Particle Size: Clear Water</p><p>Scope of Supply :</p><p>Price for pump with REMI / BBL Make STD. Foot mounted motor, 7.5 Hp/2900 rpm</p><p>Love Joy Coupling, Coupling Guard MS Base Frame</p><p>(Motorised Unit)</p>', 2, '58500.00', '117000.00', 'Yes', 2, 0, 0, ''),
(5, 3, 933, '<p>Your item code : 4000000541</p><p><span style="font-weight: bold; text-decoration: underline;">"POSITIVE" Dosing Pump</span></p><p>Model&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;:&nbsp; &nbsp; ED-03</p><p>Capacity&nbsp; &nbsp; :&nbsp; &nbsp; 20 LPH</p><p>Pressure&nbsp; &nbsp; :&nbsp; &nbsp; 2 kg/cm2</p><p>Sr. No.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp; &nbsp; 16746/3/2017</p>', 1, '41150.00', '41150.00', 'No', 1, 200, 0, ''),
(10, 4, 935, '<p><span style="font-weight: bold;">Your Item Code: PUMPWATR0029</span></p><p><span style="font-weight: bold; text-decoration: underline;">DARLING SUBMERSIBLE PUMPS</span></p><p>Pump Model : LJ 15 LN</p><p>Head : 10 Meters</p><p>Flow : 375 LPM</p><p>Power: 1.5 HP / 2980 RPM 3 Phase</p><p>Outlet : 50 MM</p><p>Pump with 10 Meters Cables</p>', 2, '34475.00', '68950.00', 'Yes', 4, 0, 0, ''),
(11, 2, 677, '<p><span style="font-weight: bold; text-decoration: underline;">"JOHNSON" Pumps</span></p><p>Model&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; KGEN 11 3 G1</p><p>Sr. No.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p></p>', 2, '8350.00', '16700.00', 'No', 2, 0, 0, ''),
(12, 2, 679, '<p>Model&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; KGEN 11 4 G1</p><p>Sr. No.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :</p><p></p>', 2, '9420.00', '18840.00', 'No', 2, 0, 0, ''),
(13, 6, 621, '<p>Item Code: 40151700HJ33</p><p>Mechanical Seal For Pump Model: T3SFP 40/38</p><p><br></p>', 1, '16500.00', '16500.00', 'Yes', 1, 0, 0, ''),
(14, 6, 614, '<p>Item Code: 40151700HJ47</p><p>Mechanical Seal for Pump Model: T3ST 52/40</p>', 1, '9500.00', '9500.00', 'Yes', 1, 0, 0, ''),
(17, 7, 606, '<p><span style="font-weight: bold;">Your Item Code : PUMPOILS0016</span></p><p><span style="text-decoration: underline; font-weight: bold;">TUSHACO Three Screw Pump</span></p><p>Pump Model : T3ST 45/42&nbsp;</p><p>Capacity &nbsp;: &nbsp;120 LPM</p><p>Pressure : 40 Kg/cm2</p>', 2, '170000.00', '340000.00', 'Yes', 1, 0, 0, ''),
(18, 8, 606, '<p><span style="font-weight: bold;">Your Item Code: PUMPOILS0016</span></p><p><span style="font-weight: bold; text-decoration: underline;">TUSHACO Three Screw Pump</span></p><p>Pump Model: T3ST 45/42</p><p>Capacity : 120 LPM</p><p>Pressure: 40 Kg/cm2</p><p><br></p>', 2, '175387.00', '350774.00', 'Yes', 1, 0, 0, ''),
(20, 9, 606, '<p><span style="font-weight: bold;">Your Item Code : PUMPOILS0016</span></p><p><span style="font-weight: bold; text-decoration: underline;">TUSHACO Three Screw Pump</span></p><p>Pump Model: T3ST 45/42</p><p>Capacity : 120 LPM</p><p>Pressure : 40 Kg/cm2</p>', 1, '175387.00', '175387.00', 'Yes', 4, 0, 0, ''),
(22, 5, 903, '<p>Your item code&nbsp; &nbsp; :&nbsp; &nbsp; 1000004583</p><p>Part No.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp; &nbsp; 1036314</p><p><span style="font-weight: bold; text-decoration: underline;">"ANTICO" Chemical Process Pump Set</span></p><p>Model&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp; &nbsp; NZRP 25 160 (Impeller Dia-170 mm)</p><p>Head&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp; &nbsp; 40 Mtrs.</p><p>Flow&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp; &nbsp; 100 LPM</p><p>Sealing&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp; &nbsp; Mechanical Seal</p><p>Suc*Dis.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp; &nbsp; 40*25 mm</p><p>with "BBL" 5 HP/2900 RPM Motor, Coupling, Coupling Guard, Fasteners dully assembled on MS BasrFrame</p><p>Pump Sr. No.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; :&nbsp; &nbsp; NZRPTB17033010</p><p>Motor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;:&nbsp; &nbsp; N1628962</p>', 1, '44700.00', '44700.00', 'Yes', 1, 160, 0, ''),
(23, 10, 606, '<p><span style="font-weight: bold;">Your Item Code: PUMPOILS0016</span></p><p><span style="font-weight: bold; text-decoration: underline;">Tushaco Three Screw Pump</span></p><p>Pump Model : T3ST 45/42</p><p>Capacity : 120 LPM</p><p>Pressure : 40 Kg/cm2</p>', 2, '170000.00', '340000.00', 'Yes', 4, 0, 0, ''),
(24, 11, 683, '<p><span style="font-weight: bold; text-decoration: underline;">"JOHNSON" Pumps</span></p><p>Model&nbsp; &nbsp; :&nbsp; &nbsp; KGEN 12b -5 G1</p><p>Sr. No.&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;B111388021, B111388031, B111398023</p>', 3, '9900.00', '29700.00', 'No', 2, 0, 0, ''),
(27, 13, 941, '<p>Your item code&nbsp; &nbsp; :&nbsp; &nbsp; 766168027010</p><p><span style="font-weight: bold; text-decoration: underline;">"JOHNSON" Centrifugal Pump Set</span></p><p>Model&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; CCR 125-315 R1A S2 L3 (Impeller Dia-284 mm)</p><p>Head&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 20 Mtrs.</p><p>Flow&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 225 m3/hr</p><p>Recomd Power&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 30 HP/1500 RPM</p><p>with MS Base Frame, Coupling T7C1PB, Fasteners etc.</p><p>Pump Sr. No.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;</p>', 1, '90250.00', '90250.00', 'Yes', 2, 0, 0, ''),
(28, 14, 927, '<p><span style="font-weight: bold; text-decoration: underline;">"JOHNSON" Pump Sets</span></p><p>Model : CCR 32 160 R6A M2 L6</p><p>Capacity : 12 m3/hr</p><p>Head : 24 Mtrs.</p><p>Sealing : Mechanical Seal</p><p>with "REMI" 5 HP/2900 RPM Motor, Coupling L-95, Coupling Guard, Fasteners dully assembled on MS Baseframe</p><p>Pump Sr. No.:</p><p>Motor SR. No.: 16/12/1999</p>', 2, '99000.00', '198000.00', 'No', 2, 0, 0, 'Manufactured'),
(29, 15, 951, '<p><span style="font-weight: bold; text-decoration: underline;">Spares for "JOHNSON" Pump</span>&nbsp;</p><p>Model&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; CCR 50-200 R6A S2 L6</p><p><span style="font-weight: bold;">Item code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Part No.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Description</span></p><p>766141589020&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 2650&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Lock Nut&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>', 2, '227.50', '455.00', 'No', 2, 0, 0, ''),
(30, 15, 953, '<p>766141775030&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 1100&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Shaft Sleeve&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>', 2, '3250.00', '6500.00', 'No', 2, 0, 0, ''),
(31, 15, 953, '<p>766141775030&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 1100&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Shaft Sleeve<br></p>', 2, '3250.00', '6500.00', 'No', 2, 0, 0, ''),
(32, 16, 963, '<p><span style="font-weight: bold; text-decoration: underline;">Spares for "JOHNSON" Pump</span>&nbsp;</p><p>Model&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; CN 25 160 G1 S2 L3</p><p><span style="font-weight: bold;">Item code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Part No.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Description</span></p><p>ENELOTHE0136&nbsp; &nbsp; 120&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Impeller</p>', 2, '6210.00', '12420.00', 'No', 2, 0, 0, ''),
(33, 16, 965, '<p>ENELOTHG0009&nbsp; &nbsp; 2110&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Bearing Cover</p>', 1, '435.00', '435.00', 'No', 2, 0, 0, ''),
(34, 16, 966, '<p>ENELOTH0006&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 100&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Pump Housing</p>', 1, '6205.00', '6205.00', 'No', 2, 0, 0, ''),
(35, 16, 967, '<p>ENELOTH0007&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 110&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Stuffing Box</p>', 1, '3865.00', '3865.00', 'No', 2, 0, 0, ''),
(36, 17, 803, '<p>Your item code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; RMPII00040946</p><p><span style="font-weight: bold; text-decoration: underline;">"JOHNSON" Centrifugal Pump Sets</span></p><p>Model&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; KGEN 12-5 G1</p><p>Capacity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 8 M3/hr</p><p>Head&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 20 Mtrs.</p><p>with "BBL" 3 HP/2900 RPM Motor, Coupling L-95, Coupling Guard, Fasteners dully assembled on MS Baseframe</p><p>Pump Sr. No.&nbsp; &nbsp; :</p><p>Motor Sr. No.&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; K1631977, N1700893</p>', 2, '25000.00', '50000.00', 'Yes', 2, 0, 0, ''),
(37, 18, 767, '<p><span style="font-weight: bold;">Your item code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; RMPII00033966</span></p><p><span style="font-weight: bold; text-decoration: underline;">Spares for "JOHNSON" Pump</span></p><p>Name of Spares&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Shaft</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; For Pump Model KGEN 11-4 G1<br></p>', 2, '704.00', '1408.00', 'No', 2, 0, 0, ''),
(38, 19, 881, '<p>Your item code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; FILTELEM1177</p><p><span style="font-weight: bold; text-decoration: underline;">"MECHFILL" Basket Type Filter Element</span></p><p>Model&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Filter Element</p><p>Micron&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 80 Micron</p>', 4, '3450.00', '13800.00', 'No', 1, 100, 0, ''),
(39, 20, 923, '<p>Your item code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; PUMPOILS0017</p><p><span style="font-weight: bold; text-decoration: underline;">"TUSHACO" Gear Pump Sets</span></p><p>Model&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; RT 40</p><p>Capacity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 40 LPM</p><p>Head&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 8 Kg/cm2</p><p>with "CGL" 1 HP/1500 RPM Motor, Coupling L-70, Coupling Guard, Fasteners Dully assembled on MS Baseframe</p><p>Pump Sr. No,&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 1594996/2771, 2769</p><p>Motor Sr. No.&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; PGH-43216, 43244</p>', 2, '17750.00', '35500.00', 'Yes', 1, 0, 0, ''),
(44, 12, 938, '<p><span style="font-weight: bold; text-decoration: underline;">"JOHNSON" Pump Sets</span></p><p>Model&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; CN 40 160 G1 S2 L3</p><p>Head&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 25 Mtrs.</p><p>Flow&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 30 m3/hr</p><p>Recco. Power&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 5 HP/2900 RPM</p><p>with, Coupling L-95, Coupling Guard, Fasteners dully assembled on MS Baseframe</p><p>Pump Sr. No.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; C111072003, 005</p>', 2, '19500.00', '39000.00', 'No', 2, 0, 0, ''),
(45, 12, 812, '<p>Model&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; CN 50 160 G1 M2 L3</p><p>Head&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 2 Mtrs.</p><p>Flow&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 16 M3/hr</p><p></p><p>Suc* Dis.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 65*60 mm</p><p>with Coupling L-95, Coupling Guard, Fasteners dully assembled on Ms Baseframe</p><p>Pump Sr. No.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; C111625007, 008</p><p></p><p></p><p></p>', 2, '28900.00', '57800.00', 'No', 2, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `sale_taxes`
--

CREATE TABLE IF NOT EXISTS `sale_taxes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tax_figure` decimal(4,2) NOT NULL,
  `quote_description` varchar(200) NOT NULL,
  `invoice_description` varchar(200) NOT NULL,
  `account_category_id` int(10) NOT NULL,
  `account_group_id` int(10) NOT NULL,
  `account_first_subgroup_id` int(10) NOT NULL,
  `account_second_subgroup_id` int(10) NOT NULL,
  `ledger_account_id` int(10) NOT NULL,
  `freeze` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sale_taxes`
--

INSERT INTO `sale_taxes` (`id`, `tax_figure`, `quote_description`, `invoice_description`, `account_category_id`, `account_group_id`, `account_first_subgroup_id`, `account_second_subgroup_id`, `ledger_account_id`, `freeze`) VALUES
(1, '14.50', 'VAT @ 14.50 % or as applicable on date of dispatch', 'VAT @ 14.50 %', 2, 6, 4, 5, 18, 0),
(2, '5.50', 'VAT @ 5.50 % or as applicable on date of dispatch', 'VAT @ 5.50%', 2, 6, 4, 5, 19, 0),
(3, '0.00', 'NIL CST agst C & E1 Form', 'NIL CST agst C & E1 Form', 2, 6, 4, 5, 20, 0),
(4, '2.00', '2% CST against C Form or as applicable on date of dispatch', '2% CST against C Form ', 2, 6, 4, 5, 21, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sources`
--

CREATE TABLE IF NOT EXISTS `sources` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sources`
--

INSERT INTO `sources` (`id`, `name`) VALUES
(1, 'Assembled'),
(2, 'Purchessed'),
(3, 'Manufactured'),
(4, 'Purchessed/Manufactured');

-- --------------------------------------------------------

--
-- Table structure for table `terms_conditions`
--

CREATE TABLE IF NOT EXISTS `terms_conditions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `text_line` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `terms_conditions`
--

INSERT INTO `terms_conditions` (`id`, `text_line`) VALUES
(1, 'Price Basis : Ex-Our  Works Udaipur .'),
(2, 'Packing & Forwarding : Extra @  %'),
(3, 'Sales Tax : Vat Extra @ 5.5%   or as applicable on date of dispatch.'),
(4, 'Excise Duty : Extra if applicable for which we shall provide you EDGP to Claim Cenvat.'),
(5, 'Delivery : Within 2 to 3 weeks from date of receipt of Techno-Commercially clear PO.'),
(6, 'Freight & Insurance : In Buyers account. In case of transit damage you will have to Claim from your Insurance Company.'),
(7, 'Payment : Strictly within 30 days of receipt of material else interest will be charged @ 18 % p.a. for delayed period.'),
(8, 'Warranty : For Pump & Motors\r\nStandard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the Motor/Pump is installed as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Winding failures is not covered under warranty. \r\nFor Spare\r\nOnly interchange ability with original equipment is confirmed and any manufacturing defect is covered.'),
(9, 'Discount :  @ % on quoted price.'),
(10, 'Validity : 30 Days.');

-- --------------------------------------------------------

--
-- Table structure for table `transporters`
--

CREATE TABLE IF NOT EXISTS `transporters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transporter_name` varchar(100) NOT NULL,
  `mobile` bigint(12) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `transporters`
--

INSERT INTO `transporters` (`id`, `transporter_name`, `mobile`, `address`) VALUES
(1, 'Jaipur Golden Transport', 9314838937, 'Transport nagar Valicha \r\nUdaipur\r\nMr. Daiya\r\n0294-2640052'),
(2, 'Bhati Goods Transport Co', 2942640171, 'D-39 Transport Nagar Valicha \r\nUdaipur\r\n02942640171'),
(3, 'Gati KWE', 8003191783, 'Transport Nagar Valicha\r\nUdaipur'),
(11, 'VRL Logistic', 9309459944, 'MIA\r\nUdaipur\r\nMr. Vikram'),
(10, 'Vijay Laxmi Transport Co', 9351414593, 'Nehru Bazar\r\nUdaipur'),
(6, 'First Flight Courier', 9509281791, 'Delhi, Above Andhra Bank\r\nUdaipur\r\nNaresh ji : 9929499145'),
(7, 'Aastha Logistics', 9462679272, 'Madri Industrial Area, Udaipur\r\nMr. Uttam Jain : 9414167094\r\nMr. Khuman Singh :'),
(8, 'Nutan Rajumani Transport', 9462679272, 'Madri Industrial Area, Udaipur\r\nMr. Uttam Jain : 9414167094\r\nMr. Khuman Singh :'),
(9, 'Singhal Transport Co', 9909949089, 'Near RIICO Office, MIA, Udaipur\r\nMr. Bhatnagar : '),
(12, 'Banswara Golden Transport Co', 294252702, 'Nehru Bazar\r\nUdaipur\r\n0294252702'),
(13, 'Nimahera Golden Tr Co', 9829610969, '14 Nehru Bazar Udaipur-313001 (Raj.)'),
(14, 'Madhur Courier', 8875892435, 'Lodha Complex Near Court Chouraha\r\nUdaipur'),
(15, 'Kota Udaipur Tr. Co., Udaipur', 9460442188, '159, C-Block, Transport Nagar, Goverdhan Villas, Udaipur (Raj.)'),
(16, 'Love Kush Enterprises', 9414163787, ' Rajasthan Mahila Vidyalaya Rd, Brahmpuri, Udaipur, Rajasthan 313001\r\n'),
(17, 'DTDC Courier', 9462966768, 'MIA\r\nNear DIC office\r\nMr. Sharad Kumar\r\n9928014762'),
(18, 'Shree Sanwariya Transport Co', 9829044287, 'Transport Nagar\r\nUdaipur\r\n9829976806\r\nIndore Office 0731-4087259\r\n07828035128'),
(19, 'TCI -XPS', 8824072840, 'Balicha Transport nagar\r\nnear Vijay laxmi Transport\r\nSector 14 Udaipur'),
(20, 'TCI-Frieght', 8955704460, 'Balicha Transport nagar\r\nnear Vijay laxmi Transport\r\nSector 14 Udaipur'),
(21, 'R. B . Roadlines', 9352525361, 'Aklingpura main Road\r\nopp. jadav Nursary\r\nSector no 6\r\n0294-2466806'),
(22, 'Shanker Golden Transport', 9413318437, 'Transport nagar\r\nPratap Nagar\r\nMr. Satish\r\n0294-2492119'),
(23, 'Jain Transport', 2943265656, '100 Feet Road Shobhgpura\r\nnear Ashoka Vatika\r\nUdaipur\r\n02943265656'),
(24, 'Shree Maruti Courier Service Pvt. Ltd.', 2942417430, 'UL-C-4, Madhav Tower, City Station Road, Udaipur, Rajasthan 313004\r\n'),
(25, 'Shreenath Cargo Pvt Ltd', 9214011397, 'City Station Road\r\nBelow Hotel magan palace\r\nNear Hotel Seema\r\nUdaipur\r\n0294-2485888,2485899\r\n9351244727\r\n'),
(26, 'Shreeji Roadlines', 9829841814, 'N.H. 8  By -pass Road\r\nBhuwana Udaipur 313004\r\n0294-2441222'),
(27, 'Associated Road Carriers Limited', 294249254, 'MIA\r\nOpp. FCI Godown\r\nUdaipur\r\n02942492545'),
(28, 'Singhal Carriers', 9414757704, 'Chatri Wala Chowk\r\nDelhi Gate\r\nUdaipur\r\n0294-2422674\r\n9414238996'),
(29, 'Hand Delivery', 1111111111, 'Udaipur '),
(30, 'Indian Post ', 2942429222, 'Shastri Circle Udaipur');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE IF NOT EXISTS `units` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`) VALUES
(1, 'Nos'),
(2, 'Mtrs'),
(3, 'Set'),
(4, 'Ltrs'),
(5, 'Feet'),
(6, 'MM');

-- --------------------------------------------------------

--
-- Table structure for table `user_rights`
--

CREATE TABLE IF NOT EXISTS `user_rights` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `login_id` int(10) NOT NULL,
  `page_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=447 ;

--
-- Dumping data for table `user_rights`
--

INSERT INTO `user_rights` (`id`, `login_id`, `page_id`) VALUES
(67, 4, 1),
(68, 4, 2),
(69, 4, 3),
(70, 4, 4),
(71, 4, 5),
(72, 4, 6),
(73, 4, 7),
(74, 4, 8),
(75, 4, 9),
(76, 4, 10),
(77, 4, 11),
(78, 4, 12),
(79, 4, 13),
(80, 4, 14),
(81, 4, 15),
(82, 4, 16),
(83, 4, 17),
(84, 4, 18),
(103, 6, 1),
(104, 6, 2),
(105, 6, 3),
(106, 6, 4),
(107, 6, 5),
(108, 6, 6),
(109, 7, 1),
(110, 7, 2),
(111, 7, 3),
(112, 7, 4),
(113, 7, 5),
(114, 7, 6),
(115, 7, 7),
(116, 7, 8),
(117, 7, 9),
(118, 7, 10),
(119, 7, 11),
(120, 7, 12),
(121, 7, 13),
(122, 7, 14),
(123, 7, 15),
(124, 7, 16),
(125, 7, 17),
(126, 7, 18),
(299, 8, 1),
(300, 8, 2),
(301, 8, 3),
(302, 8, 4),
(303, 8, 5),
(304, 8, 6),
(305, 8, 7),
(306, 8, 8),
(307, 8, 9),
(308, 8, 10),
(309, 8, 11),
(310, 8, 12),
(311, 8, 13),
(312, 8, 14),
(313, 8, 15),
(314, 8, 16),
(315, 8, 17),
(316, 8, 18),
(317, 9, 1),
(318, 9, 2),
(319, 9, 3),
(320, 9, 4),
(327, 12, 1),
(328, 12, 2),
(329, 12, 3),
(330, 12, 4),
(331, 12, 5),
(332, 12, 6),
(333, 12, 7),
(334, 12, 8),
(335, 12, 9),
(336, 12, 10),
(337, 12, 11),
(338, 12, 12),
(339, 12, 13),
(340, 12, 14),
(341, 12, 15),
(342, 12, 16),
(343, 12, 17),
(344, 12, 18),
(345, 5, 13),
(346, 5, 14),
(385, 13, 1),
(386, 13, 2),
(387, 13, 3),
(388, 13, 4),
(389, 13, 5),
(390, 13, 6),
(391, 13, 7),
(392, 13, 8),
(393, 13, 9),
(394, 13, 10),
(395, 13, 11),
(396, 13, 12),
(397, 13, 13),
(398, 13, 14),
(399, 13, 15),
(400, 13, 16),
(401, 13, 17),
(402, 13, 18),
(403, 13, 19),
(404, 13, 20),
(435, 2, 1),
(436, 2, 2),
(437, 2, 3),
(438, 2, 4),
(439, 2, 5),
(440, 2, 6),
(441, 10, 5),
(442, 10, 6),
(443, 10, 9),
(444, 10, 10),
(445, 10, 15),
(446, 10, 16);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE IF NOT EXISTS `vendors` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `tin_no` varchar(100) NOT NULL,
  `gst_no` varchar(100) NOT NULL,
  `ecc_no` varchar(100) NOT NULL,
  `pan_no` varchar(100) NOT NULL,
  `payment_terms` int(2) NOT NULL,
  `mode_of_payment` varchar(20) NOT NULL,
  `item_group_id` int(10) NOT NULL,
  `account_category_id` int(11) NOT NULL,
  `account_group_id` int(11) NOT NULL,
  `account_first_subgroup_id` int(11) NOT NULL,
  `account_second_subgroup_id` int(11) NOT NULL,
  `ledger_account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `company_name`, `address`, `tin_no`, `gst_no`, `ecc_no`, `pan_no`, `payment_terms`, `mode_of_payment`, `item_group_id`, `account_category_id`, `account_group_id`, `account_first_subgroup_id`, `account_second_subgroup_id`, `ledger_account_id`) VALUES
(1, 'SPX Flow Technology Pvt. Ltd.', 'Survey No. 275, Odhav\r\nAhmedabad - 382415\r\nGujrat - India ', '24575101244', 'U51900GJ1980PTC050281', 'AAACS 7234B/XM/001', 'AAACS7234B', 45, 'NEFT', 1, 2, 6, 2, 4, 76),
(2, 'Mechneers India', '27-A,  Ashwini Marg,\r\n Udaipur  - 313 001  ', '08273902326', '', 'AAVPJ3530BXD001', 'AAVPJ3530b', 7, 'NEFT', 7, 2, 6, 2, 4, 81),
(3, 'Tushaco Pumps Pvt. Ltd. ', 'Plot No. 1,22,23, Sr. No. 653/1, \r\nSomnath Co-op, Ind. Society Ltd., \r\nKachigam Road, Dabhel,  \r\nNani Daman- 396210 ', '25000003930', '', 'AABCT7703KXM001', 'AABCT7703K', 30, 'Cheque', 2, 2, 6, 2, 4, 82),
(5, 'Antico Equipment Pvt. Ltd. ', '119-122 GIDC -ll, Gundlav, \r\nValsad, Gujarat 396035', '24750201713', '', 'AAFCA7145JXM001', 'AAFCA7145', 7, 'NEFT', 5, 2, 6, 2, 4, 83),
(6, 'Positive Metering Pumps Pvt. Ltd. ', 'M- 8, MIDC,\r\nAmbad, NashiK, ', '27960057814C', '', 'AACCP0388DXM001', 'AACCP0388D', 7, 'NEFT', 3, 2, 6, 2, 4, 84),
(7, 'Darling Pumps Pvt. Ltd. ', 'K-No. 340/2 Tigaria Badshah,\r\nNear agarbatti complex, Industrial Estate,\r\nSanwer road, Indore - 452015', '23761100643', '', 'AAACD1664LEM002', 'AAACD1664L', 30, 'NEFT', 4, 2, 6, 2, 4, 99),
(8, 'Remi Elektrotechnik Limited', 'Building A, Survey No. 65/1,\r\nNaikpada, Waliv, Vasai (E), \r\nDist. Palghar - 401 208\r\n Maharashtra ', '27470254557', '', 'AAACR2578PXM002', 'AAACR2578P', 30, 'NEFT', 8, 2, 6, 2, 4, 110),
(9, 'Liqtech Industries', '802, Eastern Majesty \r\nTata Colony, Mulund East \r\nMumbai - 400081 ', '27340701168', '', '-', 'AADFL2020n', 15, 'NEFT', 30, 2, 6, 2, 4, 136),
(10, 'Tranter India Pvt. Ltd. ', 'Gat no.127/128, Dingrajwadi, \r\nTal. Shirur, Pune, \r\nMaharashtra 412208 India \r\n', '27410514065', '', 'AAFCA4598PXM003', 'AAFCA4598P', 15, 'NEFT', 33, 2, 6, 2, 4, 154),
(11, 'Filter Concept Pvt. Ltd. ', '302, Aalin, Opp. Gujarat Vidhyapith, \r\nB/H Jet Airways office, Ashram Road,\r\n Ahmedabad, Gujarat, \r\nIndia, 380014', '24573302855', '', 'AABCF5606MEM002', 'AABCF5606M', 7, 'NEFT', 30, 2, 6, 2, 4, 157);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_contact_persons`
--

CREATE TABLE IF NOT EXISTS `vendor_contact_persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `default_person` int(1) NOT NULL,
  `account_category_id` int(10) NOT NULL,
  `account_group_id` int(10) NOT NULL,
  `account_first_subgroup_id` int(10) NOT NULL,
  `account_second_subgroup_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `vendor_contact_persons`
--

INSERT INTO `vendor_contact_persons` (`id`, `vendor_id`, `name`, `email`, `mobile`, `default_person`, `account_category_id`, `account_group_id`, `account_first_subgroup_id`, `account_second_subgroup_id`) VALUES
(3, 1, 'Mayank Gadhavi', 'mayank.gadhavi@spxflow.com', '9909985454', 1, 0, 0, 0, 0),
(4, 1, '', '', '', 0, 0, 0, 0, 0),
(15, 2, 'R.K Sharma', 'mechind@bsnl.in', '9414458419', 1, 0, 0, 0, 0),
(21, 5, 'Alex ', 'sales@anticopumps.co.in', '9909928823', 1, 0, 0, 0, 0),
(22, 5, '', '', '', 0, 0, 0, 0, 0),
(26, 7, 'Rahul Bhadoriya', 'rahul91dppl@gmail.com', '8435037808', 1, 0, 0, 0, 0),
(27, 7, 'Nilesh', 'nileshc1973@gmail.com', '9981992842', 0, 0, 0, 0, 0),
(28, 7, ' Shriniwas Pujari', 'shriniwaspujari6@gmail.com', '9981992859', 0, 0, 0, 0, 0),
(29, 3, 'Suresh Chandra Sharma', 'Sureshchandra.Sharma@colfaxfluidhandling.com', '9871118961', 1, 0, 0, 0, 0),
(30, 3, 'Pankaj Mishra ', 'Pankaj.Mishra@colfaxfluidhandling.com', '8130891795', 1, 0, 0, 0, 0),
(31, 3, 'Manish Shukla', 'Manish.Shukla@colfaxfluidhandling.com', '8130891794', 1, 0, 0, 0, 0),
(32, 3, '', '', '', 0, 0, 0, 0, 0),
(33, 8, 'Manjunath Poojari', 'rei_sales@remigroup.com', '9967379169', 1, 0, 0, 0, 0),
(34, 6, 'Bhushan Baviskar', 'chn@positivemetering.com', '9922507046', 1, 0, 0, 0, 0),
(35, 6, 'Rajendra Aware', 'dispatch@positivemetering.com', '9881311160', 1, 0, 0, 0, 0),
(36, 6, '', '', '', 0, 0, 0, 0, 0),
(37, 9, 'AMRISH YADAV', 'info@liqueeseals.com', '9167223256', 1, 0, 0, 0, 0),
(38, 10, ' Vivek Choube', 'Vivek.Choube@tranter.com', '7774059449', 1, 0, 0, 0, 0),
(41, 11, 'Kunal Solanki', 'engg1@filter-concept.com', '7927541602', 1, 0, 0, 0, 0),
(42, 11, 'Chirag Basva ', 'factory@filter-concept.com', '9328771700', 1, 0, 0, 0, 0),
(43, 11, '', '', '', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vouchers_references`
--

CREATE TABLE IF NOT EXISTS `vouchers_references` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `voucher_entity` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `company_id` int(10) NOT NULL,
  `module` varchar(255) NOT NULL,
  `sub_entity` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `vouchers_references`
--

INSERT INTO `vouchers_references` (`id`, `voucher_entity`, `description`, `company_id`, `module`, `sub_entity`) VALUES
(1, 'PaymentVoucher -> Paid To', 'payment ', 25, 'Payment Voucher', 'Paid To'),
(2, 'PaymentVoucher -> Cash/Bank', 'payment', 25, 'Payment Voucher', 'Cash/Bank'),
(3, 'Receipt Voucher -> Received From', 'receipt voucher ', 25, 'Receipt Voucher', 'Received From'),
(4, 'Receipt Voucher -> Cash/Bank', 'bnvnb', 25, 'Receipt Voucher', 'Cash/Bank'),
(5, 'Petty Cash Receipt -> Received From', 'bnvnb', 25, 'Petty Cash Receipt', 'Received From'),
(6, 'Petty Cash Receipt -> Cash/Bank', 'bnvnb', 25, 'Petty Cash Receipt', 'Cash/Bank'),
(7, 'Contra Voucher -> Received From', 'bnvnb', 25, 'Contra Voucher', 'Received From'),
(8, 'Contra Voucher -> Cash/Bank', 'bnvnb', 25, 'Contra Voucher', 'Cash/Bank'),
(9, 'Journal Voucher -> Ledger', 'bnvnb', 25, 'Journal Voucher', 'Ledger'),
(10, 'Debit Notes -> Sales Account', 'bnvnb', 25, 'Debit Notes', 'Sales Account'),
(11, 'Debit Notes -> Party', 'bnvnb', 25, 'Debit Notes', 'Party'),
(12, 'Credit Notes -> Purchase Account', 'bnvnb', 25, 'Credit Notes', 'Purchase Account'),
(13, 'Credit Notes -> Party', 'bnvnb', 25, 'Credit Notes', 'Party'),
(14, 'PaymentVoucher -> Paid To', 'payment ', 26, 'Payment Voucher', 'Paid To'),
(15, 'PaymentVoucher -> Cash/Bank', 'payment', 26, 'Payment Voucher', 'Cash/Bank'),
(16, 'Receipt Voucher -> Received From', 'receipt voucher ', 26, 'Receipt Voucher', 'Received From'),
(17, 'Receipt Voucher -> Cash/Bank', 'bnvnb', 26, 'Receipt Voucher', 'Cash/Bank'),
(18, 'Petty Cash Receipt -> Received From', 'bnvnb', 26, 'Petty Cash Receipt', 'Received From'),
(19, 'Petty Cash Receipt -> Cash/Bank', 'bnvnb', 26, 'Petty Cash Receipt', 'Cash/Bank'),
(20, 'Contra Voucher -> Received From', 'bnvnb', 26, 'Contra Voucher', 'Received From'),
(21, 'Contra Voucher -> Cash/Bank', 'bnvnb', 26, 'Contra Voucher', 'Cash/Bank'),
(22, 'Journal Voucher -> Ledger', 'bnvnb', 26, 'Journal Voucher', 'Ledger'),
(23, 'Debit Notes -> Sales Account', 'bnvnb', 26, 'Debit Notes', 'Sales Account'),
(24, 'Debit Notes -> Party', 'bnvnb', 26, 'Debit Notes', 'Party'),
(25, 'Credit Notes -> Purchase Account', 'bnvnb', 26, 'Credit Notes', 'Purchase Account'),
(26, 'Credit Notes -> Party', 'bnvnb', 26, 'Credit Notes', 'Party'),
(27, 'PaymentVoucher -> Paid To', 'payment ', 27, 'Payment Voucher', 'Paid To'),
(28, 'PaymentVoucher -> Cash/Bank', 'payment', 27, 'Payment Voucher', 'Cash/Bank'),
(29, 'Receipt Voucher -> Received From', 'receipt voucher ', 27, 'Receipt Voucher', 'Received From'),
(30, 'Receipt Voucher -> Cash/Bank', 'bnvnb', 27, 'Receipt Voucher', 'Cash/Bank'),
(31, 'Petty Cash Receipt -> Received From', 'bnvnb', 27, 'Petty Cash Receipt', 'Received From'),
(32, 'Petty Cash Receipt -> Cash/Bank', 'bnvnb', 27, 'Petty Cash Receipt', 'Cash/Bank'),
(33, 'Contra Voucher -> Received From', 'bnvnb', 27, 'Contra Voucher', 'Received From'),
(34, 'Contra Voucher -> Cash/Bank', 'bnvnb', 27, 'Contra Voucher', 'Cash/Bank'),
(35, 'Journal Voucher -> Ledger', 'bnvnb', 27, 'Journal Voucher', 'Ledger'),
(36, 'Debit Notes -> Sales Account', 'bnvnb', 27, 'Debit Notes', 'Sales Account'),
(37, 'Debit Notes -> Party', 'bnvnb', 27, 'Debit Notes', 'Party'),
(38, 'Credit Notes -> Purchase Account', 'bnvnb', 27, 'Credit Notes', 'Purchase Account'),
(39, 'Credit Notes -> Party', 'bnvnb', 27, 'Credit Notes', 'Party');

-- --------------------------------------------------------

--
-- Table structure for table `voucher_ledger_accounts`
--

CREATE TABLE IF NOT EXISTS `voucher_ledger_accounts` (
  `vouchers_reference_id` int(10) NOT NULL,
  `ledger_account_id` int(10) NOT NULL,
  PRIMARY KEY (`vouchers_reference_id`,`ledger_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_ledger_accounts`
--

INSERT INTO `voucher_ledger_accounts` (`vouchers_reference_id`, `ledger_account_id`) VALUES
(1, 22),
(1, 23),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 35),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 93),
(1, 94),
(1, 95),
(1, 96),
(1, 97),
(1, 98),
(1, 100),
(1, 101),
(1, 102),
(1, 103),
(1, 104),
(1, 128),
(1, 146),
(1, 147),
(1, 148),
(1, 149),
(1, 158),
(1, 271),
(1, 272),
(1, 273),
(1, 274),
(1, 275),
(1, 278),
(1, 291),
(1, 294),
(1, 298),
(1, 299),
(1, 300),
(1, 301),
(1, 302),
(1, 303),
(1, 304),
(1, 305),
(1, 306),
(1, 363),
(1, 364),
(1, 365),
(1, 366),
(2, 142),
(2, 143),
(2, 144),
(2, 145),
(2, 146),
(2, 150),
(2, 202),
(2, 203),
(2, 204),
(2, 205),
(2, 206),
(2, 209),
(2, 350),
(2, 351),
(2, 352),
(2, 353),
(2, 354),
(2, 357),
(3, 4),
(3, 24),
(3, 29),
(3, 30);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item_companies`
--
ALTER TABLE `item_companies`
  ADD CONSTRAINT `company_key` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `item_key` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
