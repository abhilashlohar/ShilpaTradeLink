-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2017 at 12:13 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

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
-- Table structure for table `account_categories`
--

CREATE TABLE `account_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `account_first_subgroups` (
  `id` int(12) NOT NULL,
  `account_group_id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(17, 2, 'Cash and Cash Equivalents'),
(18, 12, 'Unsecured Loan'),
(20, 11, 'Fixed Assets'),
(21, 6, 'Bank Account OD A/C'),
(22, 4, 'Share Capital'),
(23, 5, 'Reserves & Surplus'),
(24, 12, 'Secured Loans'),
(25, 6, 'Short Term Provisions'),
(26, 3, 'Non Current Investments'),
(27, 2, 'Other Current Assets');

-- --------------------------------------------------------

--
-- Table structure for table `account_groups`
--

CREATE TABLE `account_groups` (
  `id` int(12) NOT NULL,
  `account_category_id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `account_references` (
  `id` int(10) NOT NULL,
  `entity_description` varchar(255) NOT NULL,
  `account_first_subgroup_id` int(10) NOT NULL,
  `account_category_id` int(10) NOT NULL,
  `account_group_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_references`
--

INSERT INTO `account_references` (`id`, `entity_description`, `account_first_subgroup_id`, `account_category_id`, `account_group_id`) VALUES
(1, 'Invoice Sales Account', 6, 3, 7),
(2, 'Invoice Booking Purchase  Account', 9, 4, 8),
(3, 'Invoice Freight Account', 12, 4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `account_second_subgroups`
--

CREATE TABLE `account_second_subgroups` (
  `id` int(12) NOT NULL,
  `account_first_subgroup_id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(18, 12, 'Sales Expenses Direct'),
(19, 13, 'Administration Expenses'),
(20, 13, 'Staff Expenses'),
(21, 13, 'Directors Expenses'),
(22, 14, 'Financial Expenses'),
(23, 15, 'Other Income'),
(24, 17, 'Bank Account'),
(25, 16, 'Other Incomes'),
(26, 21, 'Bank Account OD A/C'),
(27, 24, 'Vehicle Loan'),
(28, 17, 'Petty Cash'),
(29, 20, 'Tangible Assets'),
(30, 20, 'Intangible Assets'),
(31, 20, 'Vehicles'),
(32, 22, 'Share Capital'),
(33, 23, 'Reserves & Surplus'),
(37, 2, 'Due to Related Parties'),
(38, 25, 'Provisions for Expenses'),
(39, 2, 'Other Payables'),
(40, 2, 'Staff Security Deposit'),
(41, 26, 'Shares Investment'),
(44, 20, 'Accrued Depreciation on Tangible Assets'),
(49, 20, 'Accrued Depreciation on Intangible Assets'),
(50, 27, 'Advances and Deposits'),
(51, 17, 'Fixed Deposits in Bank'),
(52, 12, 'Sales Expenses Indirect');

-- --------------------------------------------------------

--
-- Table structure for table `challans`
--

CREATE TABLE `challans` (
  `id` int(10) NOT NULL,
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
  `pass_credit_note` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `challan_rows`
--

CREATE TABLE `challan_rows` (
  `id` int(10) NOT NULL,
  `challan_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `quantity` int(5) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `amount` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) NOT NULL,
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
  `logo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `company_banks` (
  `id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `account_no` bigint(20) NOT NULL,
  `ifsc_code` varchar(100) NOT NULL,
  `default_bank` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `company_groups` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_groups`
--

INSERT INTO `company_groups` (`id`, `name`) VALUES
(1, 'Mogra Group');

-- --------------------------------------------------------

--
-- Table structure for table `contra_vouchers`
--

CREATE TABLE `contra_vouchers` (
  `id` int(10) NOT NULL,
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
  `edited_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `credit_notes`
--

CREATE TABLE `credit_notes` (
  `id` int(10) NOT NULL,
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
  `cheque_no` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) NOT NULL,
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
  `bill_to_bill_account` varchar(10) NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_group_id`, `customer_name`, `alias`, `district_id`, `company_group_id`, `customer_seg_id`, `tin_no`, `gst_no`, `pan_no`, `ecc_no`, `flag`, `employee_id`, `payment_terms`, `mode_of_payment`, `credit_limit`, `transporter_id`, `account_category_id`, `account_group_id`, `account_first_subgroup_id`, `account_second_subgroup_id`, `bill_to_bill_account`) VALUES
(1, 4, 'Hindustan Zinc Ltd ', 'Dariba Smelter Complex', 4, 0, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM003', 0, 11, 30, 'NEFT', 1000000, 7, 1, 2, 1, 2, 'Yes'),
(2, 2, 'Ultratech Cement Limited', 'Unit-Aditya Cement Works', 2, 0, 3, '08832112853', '', 'AAACL6442L', 'AAACL6442LEM033', 0, 11, 30, 'Cheque', 1000000, 7, 1, 2, 1, 2, 'Yes'),
(3, 1, 'JK Laxmi Cement Ltd', 'JK Laxmi Cement Ltd', 7, 0, 3, '08453300051', '', 'AAACJ6715G', 'AAACJ6715GXM003', 0, 15, 30, 'Cheque', 1000000, 2, 1, 2, 1, 2, 'Yes'),
(4, 8, 'Shree Cement Limited', 'Shree Cement Ltd Unit 1', 3, 0, 3, '08530101044', '', 'AACCS8796G', 'AACCS8796GXM001', 0, 4, 30, 'Cheque', 1000000, 7, 1, 2, 1, 2, 'Yes'),
(5, 9, 'Trinetra Cement Ltd', 'The India Cement', 17, 0, 3, '08513750195', '', 'AAACI0990C', 'AAACI0990CXM002', 0, 4, 30, 'Cheque', 1000000, 12, 1, 2, 1, 2, 'Yes'),
(6, 2, 'Ultratech Cement Limited', 'Unit: Vikram Cement Works', 10, 0, 3, '23762701822', '', 'AAACL6442L', 'AAACL6442LEM031', 0, 11, 30, 'Cheque', 100000, 13, 1, 2, 1, 2, 'Yes'),
(7, 7, 'Adani Power Rajasthan Ltd.', 'Adani ', 19, 0, 8, '08932910817', '', 'AAGCA9379P', '', 0, 7, 30, 'NEFT', 100000, 15, 1, 2, 1, 2, 'Yes'),
(8, 10, 'Shriram Rayons', 'Shriram Rayons', 13, 0, 2, '08672951700', '', 'AAACD0204C', 'AAACD0204CXM004', 0, 7, 2, 'Cheque', 10000, 3, 1, 2, 1, 1, 'Yes'),
(9, 1, 'Mangalam Cement Ltd', 'Mangalam Cement Ltd', 13, 0, 3, '08442902696', '', 'AABCM6602Q', 'AABCM6602QXM001', 0, 7, 30, 'NEFT', 100000, 15, 1, 2, 1, 2, 'Yes'),
(10, 11, 'Sutlej Textiles and Industries Limited', 'Sutlej Textiles and Industries Limited', 30, 0, 2, '08223050160', '', 'AAJCS1850N', 'AAJCS1850NXM001', 0, 7, 15, 'NEFT', 200000, 15, 1, 2, 1, 2, 'Yes'),
(11, 1, 'Ambuja Cements Limited', 'Unit-Rabriyawas', 16, 0, 3, '08160101490', '', 'AAACG0569P', 'AAACG0569PXM008', 0, 4, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 'Yes'),
(12, 4, 'Hindustan Zinc Ltd ', 'Sindesar Khurd Mine', 4, 0, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KEM070', 0, 11, 30, 'Cheque', 1000000, 16, 1, 2, 1, 2, 'Yes'),
(15, 0, 'J.K. Cement Works Mangrol', 'Unit of J.K. Cement Ltd.', 2, 0, 3, '08841152305', '', 'AABCJ0355R', 'AABCJ0355RXM003', 0, 15, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 'Yes'),
(16, 4, 'Hindustan Zinc Ltd', 'Haridwar Zinc Plant', 37, 0, 1, '05007432844', '', 'AAACH7354K', 'AAACH7354KXM016', 0, 11, 30, 'NEFT', 100000, 1, 1, 2, 1, 2, 'Yes'),
(17, 4, 'Hindustan Zinc Ltd', 'Rajpura Dariba Mines', 4, 0, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM003', 0, 11, 30, 'NEFT', 100000, 16, 1, 2, 1, 2, 'Yes'),
(18, 4, 'Hindustan Zinc Ltd', 'Chanderia Smelter Complex (CPP)', 2, 0, 1, '08053901768', '', 'AAAPM7450Q', 'AAAPM7450QXD001', 0, 11, 30, 'Cheque', 200000, 7, 1, 2, 1, 2, 'Yes'),
(19, 4, 'Hindustan Zinc Ltd', 'Unit-Pyro Plant', 2, 0, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM005', 0, 11, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 'Yes'),
(20, 4, 'Hindustan Zinc ltd', 'Zinc Smelter Debari', 1, 0, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM010', 0, 11, 30, 'Cheque', 100000, 16, 1, 2, 1, 2, 'Yes'),
(21, 4, 'Hindustan Zinc Ltd', 'CPP Zawar Mines', 1, 0, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM008', 0, 11, 30, 'Cheque', 100000, 16, 1, 2, 1, 2, 'Yes'),
(22, 2, 'Ultratech Cement Limited', 'Unit-Birla White', 15, 0, 3, '08832112853', '', 'AAACL6442L', 'AAACL6442LEM034', 0, 11, 30, 'Cheque', 100000, 2, 1, 2, 1, 2, 'Yes'),
(23, 2, 'Ultratech Cement Limited', 'Unit-Sewagram Cement Works', 38, 0, 3, '24131300430', '', 'AAACL6442L', 'AAACL6442LEM182', 0, 11, 30, 'Cheque', 100000, 26, 1, 2, 1, 2, 'Yes'),
(24, 2, 'Ultratech Cement Limited', 'Unit-Bathinda Cement Works', 39, 0, 3, '03231021288', '', 'AAACL6442L', 'AAACL6442LEM021', 0, 11, 30, 'Cheque', 100000, 27, 1, 2, 1, 2, 'Yes'),
(25, 2, 'Ultratech Cement Limited', 'Unit-Awarpur Cement Works', 40, 0, 3, '27710299627', '', 'AAACL6442L', 'AAACL6442LXM005', 0, 11, 30, 'Cheque', 100000, 27, 1, 2, 1, 2, 'Yes'),
(26, 2, 'Ultratech Cement Limited', 'Unit-Kotputli Cement Works', 14, 0, 3, '08832112853', '', 'AAACL6442L', 'AAACL6442LEM032', 0, 7, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(29, 8, 'Shree Cement Limited', 'Unit -RAS', 16, 0, 3, '08530101044', '', 'AACCS8796G', 'AACCS8796GXM003', 0, 11, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 'Yes'),
(30, 8, 'Shree Raipur Cement Plant', 'Unit-Shree Cement Ltd', 9, 0, 3, '22851308675', '', 'AACCS8796G', 'AACCS8796GEM011', 0, 11, 30, 'Cheque', 100000, 27, 1, 2, 1, 2, 'Yes'),
(31, 8, 'Shree Cement Unit Panipat', 'Panipat', 41, 0, 3, '06021913366', '', 'AACCS8796G', 'AACCS8796GSD015', 0, 11, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(32, 5, 'RSWM Limited', 'Power Plant', 17, 0, 2, '08041001037', '', 'AAACR9700M', 'AAACR9700MXM003', 0, 11, 30, 'Cheque', 100000, 12, 1, 2, 1, 2, 'Yes'),
(33, 5, 'RSWM Limited', 'Unit:-LNJ Denim', 17, 0, 2, '08041001037', '', 'AAACR9700M', 'AAACR9700MXM003', 0, 11, 30, 'Cheque', 100000, 12, 1, 2, 1, 2, 'Yes'),
(34, 5, 'RSWM Limited', 'Unit-Rishabhdev', 1, 0, 2, '08041001037', '', 'AAACR9700M', 'AAACR9700MXM002', 0, 11, 30, 'Cheque', 100000, 28, 1, 2, 1, 2, 'Yes'),
(35, 1, 'Cavendish Industries Limited', 'CIL', 37, 0, 4, '05015370839', '', 'AAFCC8999J', 'AAFCC8999JSD002', 0, 7, 30, 'Cheque', 50000, 3, 1, 2, 1, 2, 'Yes'),
(36, 5, 'BMD Pvt Ltd', 'BMD ', 17, 0, 2, '08671003940', '', 'AABCB2235N', 'AABCB2235NXM001', 0, 11, 30, 'Cheque', 150000, 12, 1, 2, 1, 2, 'Yes'),
(37, 1, 'Ginni international Ltd.', 'GIL', 42, 0, 2, '08570700482', '08570700482', 'AAACG0182E', 'AAACG0182EXM001', 0, 15, 15, 'Cheque', 100000, 3, 1, 2, 1, 2, 'Yes'),
(38, 10, 'Shriram Fertilisers & Chemicals', 'Shriram Fertilisers & Chemicals', 13, 0, 4, '08452101422', '', 'AAACD0097R', 'AAACD0097RST007', 0, 15, 30, 'NEFT', 50000, 15, 1, 2, 1, 2, 'Yes'),
(40, 1, 'Maharaja Shree Umaid Mills Ltd', 'Maharaja Shree Umaid Mills Ltd', 16, 0, 2, '08613251269', '', 'AABCM1849B', 'AABCM1849BXM001', 0, 4, 30, 'Cheque', 100000, 22, 1, 2, 1, 2, 'Yes'),
(41, 1, 'Banawara Syntex Limited', 'Unit BTM', 17, 0, 2, '08203750996', '', 'AAACB8403F', 'AAACB8403FXM001', 0, 4, 30, 'Cheque', 100000, 12, 1, 2, 1, 2, 'Yes'),
(42, 13, 'Udaipur Cement Works Ltd', 'Unit of JK Laxmi Cement', 1, 0, 3, '08134000373', '', 'AAACU8858M', 'AAACU8858MEM001', 0, 4, 30, 'Cheque', 100000, 29, 1, 2, 1, 2, 'Yes'),
(43, 1, 'Neyveli Lignite Corporation Limited', 'NLC', 11, 0, 8, '08351305980', '', 'AAACN1121C', 'AAACN1121CEM011', 0, 11, 45, 'Cheque', 100000, 3, 1, 2, 1, 2, 'Yes'),
(44, 1, 'Wonder Cement Ltd.', 'Unit-Nimbahera', 2, 0, 3, '08400058969', '`', 'AAACW6009L', 'AAACW6009LEM001', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 'Yes'),
(45, 6, 'Sangam (India) Limited', 'Spinning Unit -I', 5, 0, 2, '08111002405', '', 'AACC0486K', 'AACC0486KXM001', 0, 12, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 'Yes'),
(46, 5, 'RSWM Limited', 'Unit-Gulabpura', 5, 0, 2, '08041001037', '', 'AAACR9700M', 'AAACR9700MXM002', 0, 12, 30, 'Cheque', 100000, 2, 1, 2, 1, 2, 'Yes'),
(47, 1, 'Lafarge India Pvt.Ltd. ', 'Lafarge India Pvt.Ltd. ', 2, 0, 3, '08392113289', '', 'AAACL4159L', 'AAACL4159LEM006', 0, 15, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 'Yes'),
(48, 1, 'Jindal Saw Ltd.', 'Jindal Saw Ltd.', 5, 0, 1, '08044052269', '', 'AABCS7280C', 'AABCS7280CEM018', 0, 15, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 'Yes'),
(49, 1, 'Kalisindh Thermal Power Project ', 'KTPP-RRVUNL', 30, 0, 8, '08332105465', '', '', '', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 'Yes'),
(50, 1, 'Chhabra Thermal Power Project', 'CTPS-RRVUNL', 19, 0, 8, '08332105465', '', '', '', 0, 12, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 'Yes'),
(51, 1, 'Parle Biscuit Pvt. Ltd. ', 'Parle Biscuit Pvt. Ltd. ', 42, 0, 7, '08440700796', '', 'AAACP0485D', 'AAACP0485DXM001', 0, 15, 30, 'Cheque', 100000, 27, 1, 2, 1, 2, 'Yes'),
(52, 1, 'United Spirits Limited ', 'Unit- Alwar', 42, 0, 6, '08432101045', '', '', '', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(53, 1, 'United Spirits Ltd.', 'Unit- Udaipur', 1, 0, 6, '08432101045', '', '', '', 0, 15, 30, 'Cheque', 100000, 29, 1, 2, 1, 2, 'Yes'),
(54, 1, 'Balkrishna Industries Ltd.', 'Unit-Chopanki', 42, 0, 7, '08470852051', '', 'AAACB3333J', 'AAACB3333JXM011', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(55, 1, 'Balkrishna Industries Ltd.', 'Unit-Bhiwadi', 42, 0, 7, '05470852051', '', 'AAACB3333J', 'AAACB3333JXM012', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(56, 1, 'Sabmiller India Ltd.', 'Unit-Rochees Breweries', 42, 0, 6, '08743900079', '', 'AAICS2238R', 'AAICS2238R', 0, 15, 30, 'Cheque', 100000, 3, 1, 2, 1, 2, 'Yes'),
(57, 10, 'Shriram Axiall', 'Shriram Axiall', 13, 0, 4, '08762960623', '', 'AAMCS7912E', 'AAMCS7912EEM001', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 'Yes'),
(58, 1, 'J K Tyre & Industries Ltd.', 'J K Tyre & Industries Ltd.', 4, 0, 7, '08851250124', '', 'AAACJ6716F', 'AAACJ6716FXM003', 0, 15, 30, 'Cheque', 100000, 3, 1, 2, 1, 2, 'Yes'),
(59, 1, 'Sanjeev Traders', 'Sanjeev Traders', 5, 0, 10, '08421004320', '', '', '', 0, 15, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 'Yes'),
(60, 1, 'Birla Corporation Limited', 'Unit-Birla cement Works', 2, 0, 3, '08761103461', '', 'AABCB2075J', 'AABCB2075JXM011', 0, 15, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 'Yes'),
(61, 1, 'Chambal Fertilisers And Chemicals Limited', 'CFCL', 13, 0, 4, '08222951511', '', 'AAACC9762A', 'AAACC9762AXM002', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 'Yes'),
(62, 1, 'Lucid Colloid Ltd.', 'Lucid Colloid Ltd.', 15, 0, 7, '08692652832', '', 'AAACL2673B', 'AAACL2673BXM001', 0, 11, 30, 'Cheque', 100000, 2, 1, 2, 1, 2, 'Yes'),
(63, 1, 'Kota Super Thermal Power Plant ', 'KSTPS-RRVUNL', 13, 0, 8, '08332105465', '', '', '', 0, 12, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 'Yes'),
(64, 1, 'United Breweries Limited', 'Unit- Chopanki', 42, 0, 6, '08040583694', '', '', '', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(65, 1, 'Carlsberg India Pvt. Ltd.', 'CIPL', 42, 0, 6, '08020605967', '', 'AAJCS8454J', '', 0, 15, 30, 'Cheque', 100000, 3, 1, 2, 1, 2, 'Yes'),
(66, 5, 'RSWM Limited', 'Unit- Mandpam', 5, 0, 2, '08041001037', '', 'AAACR9700M', 'AAACR9700MXM001', 0, 15, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 'Yes'),
(67, 1, 'H.S. Engineering & Marketing', 'HSEM', 43, 0, 10, '27640135784', '', 'AAEHV9693L', '', 0, 7, 30, 'Cheque', 100000, 10, 1, 2, 1, 2, 'Yes'),
(68, 1, 'Suratgarh Super thermal Power Station', 'SSTPS-RRVUNL', 26, 0, 8, '08332105465', '', 'AABCR7436B', '', 0, 18, 30, 'NEFT', 1000000, 1, 1, 2, 1, 2, 'Yes'),
(69, 1, 'United Breweries Ltd.-Dharuhera', 'Unit-Dharuhera', 44, 0, 6, '06482703178', '', '', '', 0, 15, 30, 'Cheque', 100000, 3, 1, 2, 1, 2, 'Yes'),
(70, 1, 'Honda Cars India Pvt. Ltd.', 'HCIPL', 42, 0, 5, '0828054435', '', 'AAACH1765Q', 'AAACH1765QXM002', 0, 15, 30, 'Cheque', 100000, 3, 1, 2, 1, 2, 'Yes'),
(71, 1, 'Wasser Technochem (India) Ltd.', 'WTIL', 18, 0, 10, '08810002823', '', 'ACGPM7046L', 'ACGPM7046LXD001', 0, 15, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 'Yes'),
(72, 1, 'Bhavik Terryfab', 'Unit of KG Petrochem Limited', 14, 0, 2, '08511659554', '', 'AAACK7052R', 'AAACK7052RXM002', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(73, 1, 'Rajasthan Liquors Ltd', 'Rajasthan Liquors Ltd', 14, 0, 6, '08591757383', '', '', '', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(74, 1, 'Varun Beverages Ltd.', 'Varun Beverages Ltd.', 42, 0, 6, '08621650618', '', 'AAACV2678L', 'AAACV2678LXM005', 0, 15, 30, 'Cheque', 100000, 3, 1, 2, 1, 2, 'Yes'),
(75, 1, 'Nissin Brake India Pvt. Ltd.', 'Nissin Brake India Pvt. Ltd.', 42, 0, 5, '08880702699', '', 'AACCN3633K', 'AACCN3633KXM001', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(76, 1, 'Saint Gobain Glass India Ltd.', 'Saint Gobain Glass India Ltd.', 42, 0, 7, '08710855314', '', 'AABCS4338M', 'AABCS4338MEM007', 0, 15, 30, 'Cheque', 100000, 3, 1, 2, 1, 2, 'Yes'),
(77, 1, 'Kajaria Ceramics Ltd.', 'KCL', 42, 0, 7, '08930850925', '', 'AABCK1613R', 'AABCK1613RXM001', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(78, 7, 'Adani Wilmar Ltd.', 'Unit- Alwar', 42, 0, 12, '08592105419', '', 'AABCA8056G', '', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(79, 1, 'Jaquar & Company Pvt. Ltd.', 'Unit-Bhiwadi', 42, 0, 7, '08320852279', '', 'AAACJ2324F', 'AAACJ2324FXM003', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(80, 1, 'Siegwerk India Pvt. Ltd.', 'Siegwerk India Pvt. Ltd.', 42, 0, 7, '08330853777', '', 'AAACG4845N', 'AAACG4845NXM010', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(81, 1, 'Crystal Chemicals & Engineers', 'CCE', 14, 0, 7, '08041651034', '', 'AFCPS1819Q', '', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(83, 4, 'Hindustan Zinc Ltd', 'Rampura Agucha Mines', 5, 0, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM002', 0, 11, 30, 'NEFT', 1000000, 7, 1, 2, 1, 2, 'Yes'),
(84, 1, 'Dabur India Limited-Alwar Unit', 'Unit-Alwar', 42, 0, 6, '08720600732', '', 'AAACD0474C', 'AAACD0474CXM008', 0, 15, 30, 'Cheque', 100000, 3, 1, 2, 1, 2, 'Yes'),
(85, 1, 'Sika India Pvt. Ltd.', 'Sika India Pvt. Ltd.', 14, 0, 5, '08152105370', '', 'AAECS1119F', '', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(86, 1, 'Nachi Technology India Pvt Ltd ', 'Nachi Technology India Pvt Ltd ', 42, 0, 5, '08200704420', '', 'AADCN9030F', 'AADCN9030FEM001', 0, 15, 25, 'Cheque', 100000, 3, 1, 2, 1, 2, 'Yes'),
(88, 1, 'J.K White Cement Works ', 'Unit of JK Cement Ltd. ', 33, 0, 3, '08841152305', '', 'AABCJ0355R', 'AABCJ0355RXM001', 0, 11, 25, 'NEFT', 100000, 2, 1, 2, 1, 2, 'Yes'),
(89, 1, 'Ajanta Polymer Pvt Ltd', 'APPL', 42, 0, 4, '08360607429', '', 'AAHCA6181G', 'AAHCA6181GEM001', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(90, 1, 'Daikin Airconditioning India Pvt. Ltd. ', 'DAIPL', 42, 0, 7, '8452105399', '', 'AABCD0971F', 'AABCD0971FXM001', 0, 15, 30, 'Cheque', 100000, 3, 1, 2, 1, 2, 'Yes'),
(91, 1, 'Vintage Distillers Ltd.', 'Vintage Distillers Ltd.', 42, 0, 6, '08440600401', '', 'AAACV2120K', '', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(92, 14, 'Rajshree Pulp And Board Mills Pvt. Ltd.', 'Rajshree Pulp And Board Mills Pvt. Ltd.', 14, 0, 7, '08022253512', '', 'AACCR7812G', 'AACCR7812GXM001', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(93, 1, 'Sodexo Food Solution India Pvt. Ltd', '(Jodhpur)', 15, 0, 6, '08222551677', '', 'AAACR2547Q', '', 0, 4, 0, 'NEFT', 0, 2, 1, 2, 1, 2, 'Yes'),
(94, 1, 'A.H. Corporation', 'A.H. Corporation', 1, 0, 10, '08184003789', '', 'AEDPH2393N', '', 0, 7, 7, 'Cheque', 50000, 29, 1, 2, 1, 2, 'Yes'),
(95, 4, 'Hindustan Zinc Ltd', 'Hydro -I ,Unit II', 2, 0, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM005', 0, 11, 30, 'NEFT', 100000, 7, 1, 2, 1, 2, 'Yes'),
(96, 15, 'RSPL', ' Sagar Unit II For OBA', 46, 0, 11, '23157504482', '', 'AADCS7820A', 'AADCS7820AXM026', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(97, 1, 'Rajasthan Rajya Vidhyut Utpadan Ltd', '(Banswara)', 17, 0, 8, '08332105465', '', '', '', 0, 11, 30, 'Cheque', 1000000, 12, 1, 2, 1, 2, 'Yes'),
(98, 7, 'Adani Wilmar Ltd.', 'Unit-Bundi', 21, 0, 12, '08592105419', '', 'AABCA8056G', 'AABCA8056GXM004', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 'Yes'),
(99, 1, 'Manglam Cement Limited', 'Manglam Cement Limited', 13, 0, 3, '08442902696', '', 'AABCM6602Q', 'AABCM6602QXM001', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 'Yes'),
(101, 1, 'Advantage Oils Pvt. Ltd.', 'AOPL', 21, 0, 12, '08512807355', '', 'AAMCA0464H', '', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 'Yes'),
(102, 0, 'Mahesh Edible Oil Industries Ltd.', 'Mahesh Edible Oil Industries Ltd.', 13, 0, 12, '08342909638', '', '', '', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 'Yes'),
(103, 1, 'ACC Limited', 'Unit-Lakheri Cement  Works', 21, 0, 3, '08252801090', '', 'AAACT1507C', 'AAACT1507CXM013', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 'Yes'),
(104, 1, 'Ruchi Soya Industries Ltd.', 'Ruchi Soya Industries Ltd.', 26, 0, 12, '08071606834', '', 'AAACR2892L', 'AAACR2892LEM012', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(105, 1, 'K.S.Oils Limited', 'K.S.Oils Limited', 13, 0, 12, '08052558803', '', '', '', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 'Yes'),
(106, 1, 'Khilari Infrastructure Pvt. Ltd.', 'KIPL', 1, 0, 10, '08123965604', '', 'AAFCA9143A', '', 0, 15, 30, 'Cheque', 100000, 29, 1, 2, 1, 2, 'Yes'),
(107, 10, 'Shriram Cement Works ', 'Shriram Cement Works ', 13, 0, 3, '08452101422', '', 'AAAC0097R', 'AAAC0097RXM003', 0, 15, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 'Yes'),
(108, 1, 'KEI Industries Limited ', 'Kei Industries Limited', 42, 0, 13, '08600850088', '', 'AAACK0251C', 'AAACK0251CXM004', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(109, 1, 'Juneja Wires Pvt. Ltd.', 'Juneja Wires Pvt. Ltd.', 14, 0, 13, '8552162089', '', 'AABCJ9179M', '', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(110, 8, 'Shree Cement Ltd.,', '(Khushkhera Cement Grinding Project)', 42, 0, 3, '08743900079', '', 'AACCS8796G', 'AACCS8796GXM004', 0, 11, 30, 'Cheque', 20000, 1, 1, 2, 1, 2, 'Yes'),
(111, 1, 'Cattle Feed Plant ', '(A Unit of Rajasthan Dairy Federation Limited)', 20, 0, 6, '08890752007', '', '', '', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(112, 1, 'Sigma Electric Mfg Corp (P) Ltd.', 'SEMCPL', 14, 0, 13, '08161665712', '', 'AADCS9493H', 'AADCS9493HXM004', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(114, 8, 'Shree Cement Limited', '(Shree Mega Power)', 18, 0, 3, '085301044', '', 'AACCS8796G', 'AACCS8796GXM001', 0, 11, 30, 'Cheque', 20000, 7, 1, 2, 1, 2, 'Yes'),
(115, 1, 'Raj West Power Limited', 'RWPL', 12, 0, 8, '08771763589', '', 'AAACR8812L', 'AAACR8812LEM001', 0, 4, 30, 'NEFT', 100000, 2, 1, 2, 1, 2, 'Yes'),
(116, 0, 'Heavy Water Project Stores', 'Stores Unit', 13, 0, 8, '08591101081', '', '', '', 0, 11, 30, 'Cheque', 100000, 15, 1, 2, 1, 2, 'Yes'),
(117, 1, 'G.D. Foods Mfg.(I) Pvt. Ltd.', 'G.D. Industrial', 42, 0, 6, '08120700972', '', '', '', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(118, 1, 'Jai Maaa Sagra Construction ', 'JMSC', 2, 0, 7, '08271105525', '', 'AHYPJ6824A', '', 0, 11, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 'Yes'),
(119, 1, 'Mark Splendour Nonwovens (P) Limited', 'MSNPL', 42, 0, 10, '08920853889', '', 'AAECM4716A', 'AAECM4716AXM001', 0, 15, 30, 'Cheque', 100000, 3, 1, 2, 1, 2, 'Yes'),
(120, 1, 'Binai Cement Ltd.', 'BCL', 7, 0, 3, '08763301287', '', 'AABCB3087C', 'AABCB3087CXM001', 0, 11, 30, 'Cheque', 100000, 29, 1, 2, 1, 2, 'Yes'),
(121, 1, 'Bestex MM India Pvt. Ltd. ', 'BIPL', 42, 0, 7, '08714200068', '', 'AACCB8837H', 'AACCB8837HXM001', 0, 15, 30, 'Cheque', 100000, 1, 1, 2, 1, 2, 'Yes'),
(122, 1, 'Taya Ceramics Pvt. Ltd. ', 'TCPL', 1, 0, 7, '08703952772', '', 'AACCT5454E', '', 0, 11, 30, 'Cheque', 100000, 29, 1, 2, 1, 2, 'Yes'),
(123, 1, 'P.I. Industries Ltd.', 'PIIND-Udaipur ', 1, 0, 7, '08613951706', '', 'AABCP2183M', 'AABCP2183MXM001', 0, 11, 30, 'Cheque', 100000, 29, 1, 2, 1, 2, 'Yes'),
(124, 1, 'Ronak Processors Pvt.Ltd', 'RPPL', 5, 0, 2, '08761004618', '', '', '', 0, 15, 30, 'Cheque', 100000, 7, 1, 2, 1, 2, 'Yes'),
(125, 1, 'Fateh Enviro Engineers Pvt Ltd', 'FEPL', 12, 0, 7, '08932406320', '', 'AACCF4379G', '', 0, 4, 0, 'NEFT', 100000, 23, 1, 2, 1, 2, 'Yes'),
(126, 0, 'Reliance Chemotex Industries Limited', 'RCIL', 1, 0, 2, '08253904471', '', 'AABCR3739H', 'AABCR3739HXM001', 0, 4, 7, 'Cheque', 100000, 29, 1, 2, 1, 2, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `district_id` int(10) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `transporter_id` int(10) NOT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`id`, `customer_id`, `address`, `district_id`, `telephone`, `mobile`, `transporter_id`, `default_address`) VALUES
(8, 5, '(Formerly Indo Zinc Ltd)\r\n(A Subsidiary of The India Cements Ltd)\r\nPost Wajwana\r\nBanswara -327025', 17, '', '', 1, 1),
(71, 39, 'Kailash Nagar, Nimbahera-312617\r\nDistt-Chittorgarh,(Rajasthan)\r\nContact no.-01477220205\r\n', 2, '', '', 7, 1),
(73, 10, 'Sutlej Textiles and Industries Limited\r\nUnit-Rajasthan Textile Mills, \r\nPachpahar Road Bhawanimandi-326502 Distt: Jhalawar', 30, '', '', 3, 1),
(75, 8, 'Unit Of - DCM Shriram Industries Limited\r\nShriram Nagar, Kota-324004', 13, '', '', 1, 1),
(78, 40, 'Pali-Marwar-306401\r\nRajastahn', 16, '', '', 0, 1),
(81, 42, 'Rajasthan State Highway 9, \r\nSripati Nagar, Dabok, Udaipur-313201\r\nRajasthan \r\n', 1, '', '', 29, 1),
(83, 2, 'UNIT:ADITYA CEMENT WORKS\r\nAdityapuram Shambhura\r\nChittorgarh', 2, '', '', 1, 1),
(84, 6, 'Unit: Vikram Cement Works\r\nKHOR, Tehsil: Jawad \r\nNeemuch (MP)-458470', 10, '', '', 14, 1),
(85, 22, 'Unit-Birla White\r\nRajashree Nagar, Kharia Khangar\r\nVillage :-Kharia Khangar\r\nDist. Jodhpur 342606', 15, '', '', 1, 1),
(86, 23, 'Unit-Sewagram Cement Works\r\nVillage Vayor , Taluka Abdasa\r\nDist.-Kutch-370511', 38, '', '', 6, 1),
(87, 24, 'Unit-Bathinda Cement Works\r\nLehra Mohabbat, \r\nRampurphul\r\nBathinda (Punjab) - 151111', 39, '', '', 6, 1),
(88, 25, 'Unit-Awarpur Cement Works\r\nP.O. Awarpur\r\nTal :Korpana\r\nDist. Chandrapur \r\nMaharastra -442917', 40, '', '', 6, 1),
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
(157, 63, 'Kota Super Thermal Power Plant,\r\nRajsthan Rajya Vidyut Utpadan Nigam Limited,\r\nSakatpura, Kota-313003', 13, '', '', 7, 1),
(173, 82, 'Rampura Agucha Mines ,\r\nPO Agucha Dist. Bhilwara - 311029', 5, '', '', 0, 0),
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
(214, 95, 'Hydro -I ,Unit II\r\nChanderai Lead Zinc Smelter,\r\nChittorgarh-312021', 2, '', '', 6, 1),
(215, 97, 'The Executive Engineer ( O&M/Ph-I)\r\nGeneration Circle,Vidhyut nagar\r\nBanswara-327001', 17, '', '', 0, 1),
(217, 32, 'Power Plant\r\nLNJ Nagar\r\nVillage :Mordi\r\nBanswara-327001 (Raj.)', 17, '', '', 6, 1),
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
(309, 106, '376, Rukamani Sadan,\r\nNear Alok School, \r\nSector-11, \r\nUdaipur-313001 (Raj.)', 1, '', '', 29, 1),
(310, 44, 'R. K. Nagar, Nimbahera\r\nDistt-Chittorgarh\r\n312601 (Raj.)', 2, '', '', 14, 1),
(313, 16, 'Haridwar Zinc Plant\r\nPlot No 2D-1, Sector 10,\r\nIIE , SIDCUL \r\nHaridwar-249403\r\nUttrakhand', 37, '', '', 6, 1),
(314, 17, 'Rajpura Dariba Mines\r\nDariba Smelter Complex \r\nP.O. Dariba Mines\r\nRajsamand', 4, '', '', 16, 1),
(316, 71, 'F-149, "SAKAR"\r\nChandrawardai Nagar,\r\nAjmer-305003 (Raj.)', 18, '', '', 7, 1),
(317, 113, 'RSPL Group, Plot No.119-121, Block P&T, Kalpi Road, Fazalganj, Kanpur-208012 (UP)\r\n', 46, '', '', 0, 1),
(318, 113, 'Plot No. 42 to 47, 49 to 54, MPIIDC Growth Center Sector- MP', 47, '', '', 0, 0),
(321, 96, 'RSPL Group, Plot No.119-121, Block P&T, Kalpi Road, Fazalganj, Kanpur-208012 (UP)\r\n\r\n', 46, '', '', 6, 1),
(322, 96, 'Plot No. 42 to 47, 49 to 54, MPIIDC Growth Center Sector- MP', 47, '', '', 6, 0),
(323, 114, '(Unit-Shree Mega Power)\r\nBangur Nagar, Beawar-305901 \r\nDistt: Ajmer (Raj.)', 18, '', '', 0, 1),
(324, 115, 'Village-Bhadresh\r\nBarmer -344001', 12, '', '', 0, 1),
(325, 116, 'Stores Officer, Stores Unit\r\nP.O. Anushakti, Via Kota Distt. Kota-323303 (Raj.)', 13, '', '', 0, 1),
(326, 117, 'Plot. No. SP 15 & 16,\r\nRIICO Industrial Area , \r\nNeemarana, Distt.: Alwar\r\n301705 (Raj.)', 42, '', '', 0, 1),
(327, 118, 'Vill- Ajoliya Ka Khera, \r\nNear Hindustan Zinc Ltd.,\r\nCLZS Chanderia,\r\nDistt-Chittorgarh\r\n312021 (Raj.) ', 2, '', '', 0, 0),
(328, 119, 'E- 535, Industrial Area,\r\nChopanki, Bhiwadi,\r\nDistt.- Alwar\r\n301019 (Raj.)', 42, '', '', 0, 1),
(329, 120, 'P.O. BInanigram, \r\nDistt.-Sirohi, \r\n307031 (Raj.)', 7, '', '', 0, 1),
(330, 121, 'Plot No. SPL-2B, \r\nTapukara Industrial Area,\r\nBhiwadi Alwar Road, Tapukara, Distt-Alwar\r\n301707 (Raj.)', 42, '', '', 0, 1),
(331, 122, 'Dakan Kotra,\r\n12 Km Miles Stone,\r\nUdaipur-Banswara Road,\r\nDistt- Udaipur,\r\n313001 (Raj.)', 1, '', '', 0, 1),
(332, 123, 'Udai Sagar Road,\r\nDistt- Udaipur, \r\n313001 (Raj.)', 1, '', '', 0, 1),
(334, 19, 'Unit-Pyro Plant\r\nChanderiya Lead Zinc Smelter\r\nChittorgarh', 2, '', '', 6, 1),
(335, 30, 'Village -Khapradig ,Teh :-Simga\r\nBhatapara ,Baloda Bazar Raipur -493332\r\nChattisgarh', 9, '', '', 7, 1),
(336, 29, 'Bangur City\r\nPO RAS-306107\r\nTehsil :Jaitaran\r\nDist. Pali\r\n', 16, '', '', 6, 1),
(338, 112, 'A-135-135-136, Road no. 12, Vishwakarma indusrial Area, Jaipur-302013', 14, '', '', 6, 1),
(339, 68, 'The Executive Engineer (O & M)\r\nSuratgarh Super thermal Power,\r\nRajasthan Rajya Vidyut Utpadan Nigam Limited, Near Village-Raiawali,\r\nSuratgarh-335804\r\nSri Ganganagar (Raj.)', 26, '', '', 31, 1),
(340, 83, 'Rampura Agucha Mines ,\r\nPO Agucha Dist. Bhilwara - 311029', 5, '', '', 7, 1),
(343, 99, 'Aditya Nagar, Morak-326520, Distt-Kota (Raj.) ', 13, '', '', 7, 1),
(344, 9, 'P.O. Adityanagar - 326 520\r\nMORAK, Distt. Kota (Rajasthan)', 13, '', '', 6, 1),
(345, 124, 'G-138 to 142,4th Phase,\r\nRiico Industrial Area, Bhilwara-311001\r\n(Raj.)\r\n', 5, '', '', 0, 1),
(346, 125, 'WATER & WASTE WATER MANAGEMENT]\r\nPlat No.25 Near Kankariya Textile, \r\n1st Phase, RIICO Ind. Area,\r\nBalotra-344022\r\n', 12, '', '', 0, 1),
(349, 18, 'Chanderia Smelter Complex (CPP)\r\nPO Putholi\r\nChittorgarh', 2, '', '', 6, 1),
(350, 126, 'P.B. 73 ,\r\nKanpur Madri\r\nUdaipur-313003', 1, '', '', 0, 1),
(351, 12, 'Sindesar Khurd Mine\r\nP.O. Dariba\r\nRajsamand', 4, '', '', 16, 1),
(352, 1, 'Dariba Smelter Complex\r\nRajpura Dariba Mines\r\nRajsamand - 313211', 4, '', '', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_companies`
--

CREATE TABLE `customer_companies` (
  `customer_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_companies`
--

INSERT INTO `customer_companies` (`customer_id`, `company_id`) VALUES
(1, 25),
(2, 25),
(3, 25),
(4, 25),
(5, 25),
(6, 25),
(7, 25),
(8, 25),
(9, 25),
(10, 25),
(11, 25),
(12, 25),
(15, 25),
(16, 25),
(17, 25),
(18, 25),
(19, 25),
(20, 25),
(21, 25),
(22, 25),
(23, 25),
(24, 25),
(25, 25),
(26, 25),
(29, 25),
(30, 25),
(31, 25),
(32, 25),
(33, 25),
(34, 25),
(35, 25),
(36, 25),
(37, 25),
(38, 25),
(40, 25),
(41, 25),
(42, 25),
(43, 25),
(44, 25),
(45, 25),
(46, 25),
(47, 25),
(48, 25),
(49, 25),
(50, 25),
(51, 25),
(52, 25),
(53, 25),
(54, 25),
(55, 25),
(56, 25),
(57, 25),
(58, 25),
(59, 25),
(60, 25),
(61, 25),
(62, 25),
(63, 25),
(64, 25),
(65, 25),
(66, 25),
(67, 25),
(68, 25),
(69, 25),
(70, 25),
(71, 25),
(72, 25),
(73, 25),
(74, 25),
(75, 25),
(76, 25),
(77, 25),
(78, 25),
(79, 25),
(80, 25),
(81, 25),
(83, 25),
(84, 25),
(85, 25),
(86, 25),
(88, 25),
(89, 25),
(90, 25),
(91, 25),
(92, 25),
(93, 25),
(94, 25),
(95, 25),
(96, 25),
(97, 25),
(98, 25),
(99, 25),
(101, 25),
(102, 25),
(103, 25),
(104, 25),
(105, 25),
(106, 25),
(107, 25),
(108, 25),
(109, 25),
(110, 25),
(111, 25),
(112, 25),
(114, 25),
(115, 25),
(116, 25),
(117, 25),
(118, 25),
(119, 25),
(120, 25),
(121, 25),
(122, 25),
(123, 25),
(124, 25),
(125, 25),
(125, 26),
(125, 27),
(126, 25),
(126, 26),
(126, 27);

-- --------------------------------------------------------

--
-- Table structure for table `customer_contacts`
--

CREATE TABLE `customer_contacts` (
  `id` int(10) NOT NULL,
  `contact_person` varchar(100) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `default_contact` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_contacts`
--

INSERT INTO `customer_contacts` (`id`, `contact_person`, `customer_id`, `designation`, `telephone`, `email`, `mobile`, `default_contact`) VALUES
(8, 'Jitendra Sharma', 5, 'Purchase Executive', '0296230151', 'jitendra.s@indiacements.co.in', '0296230151', 1),
(87, 'Piyush Tiwari', 39, 'Astt. Manager-Procurement ', '01477220205', 'Piyush.Tiwari@jkcement.com', '0147722020', 1),
(90, 'Bhanwar Tripathi', 10, 'Sr Purchase officer', '07433222052', 'btripathi@sutlej-rtm.co.in', '9116009797', 1),
(92, 'Ram Kshteri', 8, 'Purchase Manager', '9929590865', 'ramkshetri@dcmsr.com', '9929590865', 1),
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
(188, 'Mr. V.K. Golani', 63, 'Superintending Engineer (MM)', '07442370002', 'semktps@gmail.com', '7442370002', 1),
(206, 'Rupesh Jain', 82, 'sales', '01483229521', 'rupesh.jain@vedanta.co.in', '0148322952', 0),
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
(250, 'Mr PC Pareek', 95, 'Purchase Excutive', '9928013967', 'pc.pareek@vedanta.co.in', '9928013967', 1),
(251, 'Mr Manish', 97, 'XEN', '9413348292', 'xenmahihydro@gmail.com', '9413348292', 1),
(253, 'Mr. Parveen Rawal', 32, 'Purchase Sr Executive', '9413357059', 'powerpurchase.rswm@lnjbhilwara.com', '9413357059', 1),
(254, 'Mr. Mamtesh Jain', 32, 'Purchase Executive', '02961231672', 'mamteshjain@lnjbhilwara.com', '2961231672', 0),
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
(349, 'Mr. Lalit Trivedi', 106, 'Technical Officer', '9829202913', 'khilrai_udaipur@hotmail.com', '9829202913', 1),
(350, 'Vishnu Sharma', 44, 'Purchaser', '09610019610', 'nbh.pur3@wondercement.com', '9610019610', 1),
(351, 'Punit Singh Gurjar', 44, 'Purchaser', '08003095846', 'punit.gurjar@wondercement.com', '8003095846', 0),
(354, 'Mahendra Yadav', 16, 'Store Incharge', '9557456262', 'mahendra.yadav2@vedanta.co.in', '9557456262', 1),
(355, 'Ronny Thomas', 17, 'Store Incharge', '8003195347', 'ronny.thomas@vedanta.co.in', '8003195347', 1),
(357, 'Khushboo Jain', 71, 'Dy. Manager(Commercial)', '01452691456', 'accounts@wassertechnochem.cm', '1452691456', 1),
(358, 'Mr. Akshay Agarwal ', 113, 'AM-Procurement', '05122221201', 'akshayk.agarwal@rsplgroup.com', '7318214777', 1),
(360, 'Mr. Akshay Agarwal ', 96, 'AM-Procurement', '05122221201', 'akshayk.agarwal@rsplgroup.com', '7318214777', 1),
(361, 'Vivek Saxena', 114, 'Purchaser', '1462228101', 'saxena@shreecementltd.com', '9214337462', 1),
(362, 'Muheet Mateen', 115, 'Purchase Executive', '02982229100', 'muheet.mateen@jsw.in', '2982229100', 1),
(363, 'Mr.M. Madal', 116, 'Astt. Stores Officer', '01475242228', 'storesofficer@kot.hwb.gov.in', '1475242228', 1),
(364, 'Mr.Pradyut Kar', 117, 'DGM (Purchase)', '01145233333', 'pradyut.kar@tops.co.in', '9268567234', 1),
(365, 'Mr. Satya Narayan  Jat', 118, 'Purchaser', '9928565025', 'jms.cost@yahoo.in', '9928565025', 1),
(366, 'Mr. Deenpreet Singh ', 119, 'Purchaser', '99901493606161', 'Office.marksplendour@gmail.com', '9999274727', 1),
(367, 'Mr. Pankaj Kulkarni', 120, 'Purchaser', '02971235005', 'bcl.purchase@binanicement.co.in', '2971235005', 1),
(368, 'Mr. Mr. Subrata Sinha', 121, 'Purchaser', '01493250587', 'subratasinha@bestex.co.in', '1493250587', 1),
(369, 'Mr. Mahendra Taya', 122, 'Proprietor', '029400000000000', 'mtaya@rediffmail.com', '0294000000', 1),
(370, 'Mr. Vimal Nagar', 123, 'Purchaser', '02942492451', 'v.nagar@piind.com', '2942492451', 1),
(373, 'Sandeep Paliwal', 19, 'Purchase Excutive', '01472254285', 'sandeep.paliwal@vedanta.co.in', '0147225428', 1),
(374, 'Shadaab Alam Rizvi', 30, 'Purchase Executive', '8349301232', 'rizvis@shreecementltd.com', '8349301232', 1),
(375, 'Gaurav Maheshwari', 29, 'Purchase Executive', '01462228101', 'maheshwarig@shreecementltd.com', '9214337632', 1),
(378, 'Mr. Pankaj Kalani', 112, 'Dy. Manager (Material)', '01413064900', 'pkalani@sigmaelectric.com', '9785022279', 1),
(379, 'Mr. Bhagwan Das Jatav', 68, 'Assistant Engineer', '01509245662', 'proc.stps.suratgarh@gmail.com', '1509245662', 0),
(380, 'Mr. Manish Gupta', 68, 'Asst. Account Officer', '01509245689', 'proc.stps.suratgarh@gmail.com', '1509245689', 0),
(381, 'Rupesh Jain', 83, 'Store Incharge', '01483229521', 'rupesh.jain@vedanta.co.in', '0148322952', 1),
(384, 'Mr. vipesh Gupta', 99, 'GM (Purchase)', '07459232794', 'vipesh.gupta@mangalamcement.com', '9351468146', 1),
(385, 'Vipesh Gupta', 9, 'GM Purchase', '9351468146', 'vipesh.gupta@mangalamcement.com', '9351468146', 1),
(386, 'Mr. Atul ', 124, 'Purchase Manager', '09460578251', 'ronakprocessorspvtltd@gmail.com', '9001895174', 1),
(387, 'Mr. Aslam', 125, 'Purchase Manager', '9414755534', 'aslamcetp@gmail.com', '9983755534', 1),
(390, 'Rameshwar Sharma', 18, 'Store Incharge', '01472254464', 'rameshwar.sharma@vedanta.co.in', '1472254464', 1),
(391, 'Mr. SK Verdia', 126, 'Manager Stores', '02942490488', 'stores@reliancechemotex.com', '2942490488', 1),
(392, 'Aditya jalan', 12, 'Purchase Executive', '8003093638', 'aditya.jalan@vedanta.co.in', '8003093638', 1),
(393, 'Debasish Chakladar', 1, 'Store Encharge', '0800309709', 'debasish.chakladar@vedanta.co.in', '8003097090', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `customer_segs` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `debit_notes` (
  `id` int(10) NOT NULL,
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
  `cheque_no` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `designations` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `districts` (
  `id` int(11) NOT NULL,
  `state` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) NOT NULL,
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
  `ledger_account_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `sex`, `dipartment_id`, `designation_id`, `mobile`, `email`, `signature`, `account_no`, `bank_name`, `branch_name`, `ifsc_code`, `permanent_address`, `residence_address`, `phone_no`, `dob`, `marital_status`, `date_of_anniversary`, `spouse_name`, `children`, `spouse_working`, `qualification`, `last_company`, `join_date`, `permanent_join_date`, `blood_group`, `account_category_id`, `account_group_id`, `account_first_subgroup_id`, `account_second_subgroup_id`, `ledger_account_id`) VALUES
(4, 'Jagdish Salvi', 'Male', 1, 1, '9983247774', 'jagdish@mogragroup.com', '58b3ddec698e8.png', '61333933354', 'SBBJ', 'Shobhagpura', 'SBBJ0011485', 'Tulsi Ram Salvi,\r\nHouse No. 77, B Block, Sector 9,\r\nSavina , Udaipur 313001 ( Raj )', 'R C Gehlot, \r\nHouse No. 20/21, Behind Mahadev Properties, Gokul Village, Sector 9,\r\nSavina , Udaipur 313001 ( Raj )', '7300277882', '1980-10-07', 'Married', '2008-02-23', 'Lalita Salvi', 2, 'Yes', 'B Sc.', 'Manikaran Enterprises', '2016-08-24', '2016-09-24', 'A+', 1, 2, 7, 10, 22),
(7, 'Harshit Patel', 'Male', 1, 1, '9772404777', 'harshit@mogragroup.com', '58b3e05583253.png', '394002010065687', 'Union Bank Of India', 'Fatehpura', 'UBIN0539406', '25, vrandavan vihar, hiran magri sec-3 udaipur', '25, vrandavan vihar, hiran magri sec-3 udaipur', '', '1983-07-11', 'Married', '2007-11-21', 'laxita patel', 1, 'Yes', 'B.Com, MCSA, MCSE, CCNA', 'Dani Shares and Stock Brokers Pvt Ltd', '2014-01-27', '2014-01-27', '', 1, 2, 7, 10, 30),
(8, 'Jitendra Singh Jhala', 'Male', 2, 2, '9785177828', 'dispatch@mogragroup.com', '58b3ef21c6926.png', '394002010066287', 'Union Bank Of India', 'Fatehpura', 'UBIN0539406', '11, Ganpati Nagar A, Near Bohra Ganesh ji Temple, Sunderwas, Udaipur', '11, Ganpati Nagar A, Near Bohra Ganesh ji Temple, Sunderwas, Udaipur', '', '1985-01-05', 'Married', '2012-02-10', 'Asha Ranawat', 1, 'Yes', 'M.A., M.Sc., M.B.A.', 'Lakecity Infraproject Pvt. Ltd.,', '2014-08-19', '2015-02-20', 'O+', 1, 2, 7, 10, 31),
(9, 'Usha Mali', 'Female', 3, 3, '9166228856', 'purchase@mogragroup.com', '58da2f9de548e.png', '51111161500', 'SBBJ ', 'Madri ', 'SBBJ0010415', 'H.N. 114 UIT Colony Kanpur Madri .Udaipur  ', 'H.N. 114 UIT Colony Kanpur Madri .Udaipur  ', '0294 2980435', '1992-06-27', 'Single', '1970-01-01', '', 0, '', 'XII', 'AGHQ ', '2015-07-15', '2016-01-15', 'B+', 1, 2, 7, 10, 32),
(11, 'Pushpendra Nath Chauhan', 'Male', 1, 10, '9672994770', 'pushpendra@mogragroup.com', '58bd0c2f3fb02.png', '394002010064093', 'Union Bank Of India', 'New Fatehpura Udaipur', 'UBIN0539406', 'T 62 Tilak Nagar Hiran Mangri Sector 3 Udaipur', 'T 62 Tilak Nagar Hiran Mangri Sector 3 Udaipur', '8696029999', '1984-12-21', 'Married', '2010-11-23', 'Mrs. Kavita Kanwar', 1, 'No', 'MBA (MKTG & HR)', 'Bhatnagar Engineers', '2010-10-20', '2010-10-20', 'O+', 1, 2, 7, 10, 44),
(12, 'Vikram Singh ', 'Male', 1, 1, '8426932094', 'vikram@mogragroup.com', '58df6633240bc.png', '61333933354', 'SBBJ', 'Shobhagpura', 'SBBJ0011485', 'Bhanwar Singh \r\nVillage PO Basantgarh\r\nTehsil -Pindwara\r\nDist. Sirohi', 'C/O Bhagwat Singh\r\nMeera Nagar\r\nbehind Ambience Hotel\r\nUdaipur', '9828232546', '1994-03-30', 'Single', '1970-01-01', '', 0, '', 'B.Tech ( Mech.)', 'Fresher', '2017-02-27', '2017-08-28', 'A+', 1, 2, 7, 10, 45),
(13, 'Bhopal Singh Jhala', 'Male', 8, 8, '9828447774', 'works@mogragroup.com', '58bd262745e4d.png', '394002010064416', 'Union Bank Of India', 'New Fatehpura', 'UBIN0539406', 'Narayan Singh Jhala\r\nVillage-Talavada\r\nPO -Bilot Teh -Dungla\r\nDist. Chittorgarh', 'C/O Ramesh Jain\r\nH.N. 159 Vivek Nagar\r\nSector no 3\r\nUdaipur', '9828447774', '1980-01-16', 'Married', '2007-03-12', 'Jaya kunwer jhala', 1, 'Yes', 'B.A.', 'Shilpa Trade Links', '2011-11-21', '2012-05-15', 'A+', 1, 2, 7, 10, 46),
(14, 'Reena Khandelwal', 'Female', 6, 4, '9649965452', 'info@mogragroup.com', '58be59bdf2895.docx', '394002100066517', 'Union Bank', 'New Fatehpura', 'UBIN0539406', 'C/o N.K.Gupta , 13-B Kanta Niwas, Snatosh Nagar , Street  No-7,Gariyawas, Udaipur', 'C/o N.K.Gupta , 13-B Kanta Niwas, Snatosh Nagar , Street  No-7,Gariyawas, Udaipur', '9649965452', '1979-01-31', 'Married', '1970-01-01', 'Gopal Khandelwal', 2, 'Yes', 'MA ', 'Phosphate India Pvt.Ltd', '2015-01-16', '2015-07-16', 'B+', 1, 2, 7, 10, 52),
(15, 'Mohammed Arif', 'Male', 1, 11, '9649004777', 'arif@mogragroup.com', '58c397efb67fe.jpg', '310102010457570', 'Union Bank Of India', 'Town Hall', 'UBIN0531014', '15/3 Opposite Matlob Masjid, Rajput Colony, \r\n62 futta road Saharanpur UP', 'Opposite soni general Store, Ganesh nagaer\r\npayda University Road, Udaipur raj', '', '1987-09-17', 'Married', '2014-10-27', 'Bushra Arif', 1, 'No', 'B.Sc and PGDBM', 'Kirloskar', '2011-11-16', '2012-04-02', 'B-', 1, 2, 7, 10, 70),
(16, 'Anshul Mogra', 'Male', 6, 6, '9772704777', 'anshul@mogragroup.com', '58e3324748064.png', '001410091506700', 'IDBI', 'Udaipur', 'IDBI', '560, OTC Scheme,\r\nAmbamata,\r\nUdaipur', '560, OTC Scheme,\r\nAmbamata,\r\nUdaipur', '0294 2980435', '1977-05-23', 'Married', '2007-04-20', 'Priya Mogra', 1, 'Yes', 'CA', 'Danube Building ', '2008-11-12', '2008-11-12', 'B+', 2, 6, 8, 11, 75),
(17, 'Priya Mogra', 'Female', 2, 6, '9772704888', 'priya@mogragroup.com', '58e0ffa003ced.jpg', '1234567890', 'UCO Bank', 'Ambamata', 'uCO12345', '560 OTC Scheme \r\nAmbamata Udaipur', '560 OTC Scheme \r\nAmbamata Udaipur', '02942431510', '1981-11-08', 'Married', '2007-04-20', 'Anshul Mogra', 1, 'Yes', 'MCA', 'None', '2007-05-01', '2007-05-01', 'A-', 2, 6, 2, 37, 0),
(18, 'Mukesh Jain ', 'Male', 1, 11, '9829042542', 'mukesh@mogragroup.com', '58e33d60a0bf9.docx', '394002010064091', 'Union Bank ', 'Kota Arodurm Barnch', 'UBIN0535265', '1488,  RK.PURAM, NEAR WATER TANK, KOTA,', '113/28 , Partap Nagar Sector -11, JAIPUR', '', '2069-10-15', 'Married', '1995-04-20', 'Sonali Jain', 1, 'Yes', 'BSC', 'Shilpa Trade Links Pvt. Ltd.', '2009-07-15', '2010-01-15', 'AB-', 1, 2, 7, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee_companies`
--

CREATE TABLE `employee_companies` (
  `employee_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL
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
(16, 27),
(17, 25),
(18, 25),
(18, 26),
(18, 27);

-- --------------------------------------------------------

--
-- Table structure for table `employee_contact_persons`
--

CREATE TABLE `employee_contact_persons` (
  `id` int(10) NOT NULL,
  `employee_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `landline` varchar(15) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `relation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(75, 8, 'Bhopal Singh Jhala', '9460509987', '', 'bhopal@gmail.com', 'Father'),
(76, 8, 'Asha Ranawat', '9783376214', '', 'asharanawatldc@gmail.com', 'Wife'),
(83, 9, 'Roop Lal JI ', '9610602013', '9610602013', 'rlj@gmail.com', 'Father '),
(84, 9, 'Satish ', '8003993600', '9460890164', 'satish@gmail.com', 'Friend '),
(89, 12, 'Bhagwat Singh', '9828232546', '9828232546', 'bsinghrana@gmail.com', 'Brother'),
(90, 12, 'Rajveer Singh', '7665510559', '7665510559', 'rajveer.rr497@gmail.com', 'Brother'),
(91, 10, 'Anshul Mogra', '9772704777', '2431510', 'anshul@mogragroup.com', 'Husband'),
(92, 10, 'KS Mogra', '9829042326', '123', 'ksmogra@mogragroup.com', 'Father'),
(93, 17, 'Prakash Chhajed', '9425067062', '', 'prakashchhajed@rediffmail.com', 'Father'),
(94, 17, 'Pratibha Chhajed', '9755386566', '', 'pratibha@rediffmail.com', 'Mother'),
(97, 16, 'K S Mogra', '9829042326', '2431510', 'ksmogra@mogragroup.com', 'Father'),
(98, 16, 'Priya Mogra', '9772704777', '2431510', 'priya@mogragroup.com', 'Wife'),
(101, 18, 'Sonali Jain', '9982687697', '9982687697', 'sonali.sonalijain.sonalijn@gmail.com', 'Wife'),
(102, 18, 'Atika Jain ', '9116110880', '9116110880', 'atikajain95@gmail.com', 'Daughter');

-- --------------------------------------------------------

--
-- Table structure for table `filenames`
--

CREATE TABLE `filenames` (
  `id` int(10) NOT NULL,
  `file1` varchar(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `file2` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(24, 'BE', 22, 2827),
(25, 'BE', 30, 3241),
(26, 'BE', 26, 2720),
(27, 'BE', 1, 2879),
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
(102, 'BE', 101, 2877),
(103, 'BE', 115, 2890),
(104, 'BE', 68, 2982),
(105, 'DC', 4, 14),
(106, 'BE', 29, 2979),
(107, 'DC', 2, 15),
(108, 'BE', 19, 3369),
(109, 'BE', 21, 3142),
(111, 'DC', 1, 16),
(112, 'BE', 4, 2830),
(113, 'BE', 83, 3254),
(114, 'BE', 17, 2546),
(115, 'BE', 107, 2405),
(116, 'BE', 4, 2626),
(117, 'BE', 40, 3370),
(118, 'BE', 51, 3174),
(119, 'DC', 124, 17),
(120, 'BE', 42, 3102),
(121, 'BE', 122, 3350),
(122, 'BE', 95, 2900),
(123, 'BE', 69, 2942),
(124, 'BE', 125, 3349),
(125, 'BE', 1, 3293),
(126, 'BE', 126, 3080);

-- --------------------------------------------------------

--
-- Table structure for table `financial_months`
--

CREATE TABLE `financial_months` (
  `id` int(10) NOT NULL,
  `financial_year_id` int(10) NOT NULL,
  `month` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(106, 21, '04-2016', 'Open'),
(107, 21, '05-2016', 'Open'),
(108, 21, '06-2016', 'Open'),
(109, 21, '07-2016', 'Open'),
(110, 21, '08-2016', 'Open'),
(111, 21, '09-2016', 'Open'),
(112, 21, '10-2016', 'Open'),
(113, 21, '11-2016', 'Open'),
(114, 21, '12-2016', 'Open'),
(115, 21, '1-2017', 'Open'),
(116, 21, '2-2017', 'Open'),
(117, 21, '3-2017', 'Open'),
(118, 22, '04-2016', 'Open'),
(119, 22, '05-2016', 'Open'),
(120, 22, '06-2016', 'Open'),
(121, 22, '07-2016', 'Open'),
(122, 22, '08-2016', 'Open'),
(123, 22, '09-2016', 'Open'),
(124, 22, '10-2016', 'Open'),
(125, 22, '11-2016', 'Open'),
(126, 22, '12-2016', 'Open'),
(127, 22, '1-2017', 'Open'),
(128, 22, '2-2017', 'Open'),
(129, 22, '3-2017', 'Open');

-- --------------------------------------------------------

--
-- Table structure for table `financial_years`
--

CREATE TABLE `financial_years` (
  `id` int(11) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `financial_years`
--

INSERT INTO `financial_years` (`id`, `date_from`, `date_to`, `status`, `company_id`) VALUES
(1, '2017-04-01', '2018-03-31', 'Open', 25),
(16, '2015-04-01', '2016-03-31', 'Closed', 25),
(18, '2016-04-01', '2017-03-31', 'Open', 25),
(19, '2017-04-01', '2018-03-31', 'Open', 26),
(20, '2017-04-01', '2018-03-31', 'Open', 27),
(21, '2016-04-01', '2017-03-31', 'Open', 27),
(22, '2016-04-01', '2017-03-31', 'Open', 26);

-- --------------------------------------------------------

--
-- Table structure for table `grns`
--

CREATE TABLE `grns` (
  `id` int(10) NOT NULL,
  `vendor_id` int(10) NOT NULL,
  `date_created` date NOT NULL,
  `purchase_order_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  `grn1` varchar(10) NOT NULL,
  `grn2` int(10) NOT NULL,
  `grn3` varchar(10) NOT NULL,
  `grn4` varchar(10) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Pending',
  `created_by` int(10) NOT NULL,
  `road_permit_no` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `grn_rows`
--

CREATE TABLE `grn_rows` (
  `id` int(10) NOT NULL,
  `grn_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `quantity` int(5) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_vouchers`
--

CREATE TABLE `inventory_vouchers` (
  `id` int(10) NOT NULL,
  `invoice_id` int(10) NOT NULL,
  `iv_number` varchar(10) NOT NULL,
  `created_by` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Incomplete'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_voucher_rows`
--

CREATE TABLE `inventory_voucher_rows` (
  `id` int(10) NOT NULL,
  `inventory_voucher_id` int(10) NOT NULL,
  `invoice_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `left_item_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) NOT NULL,
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
  `inventory_voucher_status` varchar(20) NOT NULL DEFAULT 'Pending',
  `payment_mode` varchar(20) NOT NULL,
  `fright_ledger_account` int(10) NOT NULL,
  `sales_ledger_account` int(10) NOT NULL,
  `st_ledger_account_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_bookings`
--

CREATE TABLE `invoice_bookings` (
  `id` int(10) NOT NULL,
  `grn_id` int(10) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `created_on` date NOT NULL,
  `company_id` int(10) NOT NULL,
  `created_by` int(10) NOT NULL,
  `ib1` varchar(10) NOT NULL,
  `ib2` int(10) NOT NULL,
  `ib3` varchar(10) NOT NULL,
  `ib4` varchar(10) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `due_payment` decimal(15,2) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `supplier_date` date NOT NULL,
  `purchase_ledger_account` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_booking_rows`
--

CREATE TABLE `invoice_booking_rows` (
  `id` int(11) NOT NULL,
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
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_rows`
--

CREATE TABLE `invoice_rows` (
  `id` int(10) NOT NULL,
  `invoice_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `rate` decimal(15,2) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `height` int(3) NOT NULL,
  `inventory_voucher_status` varchar(10) NOT NULL DEFAULT 'Pending',
  `item_serial_number` varchar(100) NOT NULL,
  `inventory_voucher_applicable` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `item_category_id` int(10) NOT NULL,
  `item_group_id` int(10) NOT NULL,
  `item_sub_group_id` varchar(100) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `freeze` tinyint(1) NOT NULL,
  `source` varchar(30) NOT NULL,
  `minimum_quantity` int(10) NOT NULL,
  `maximum_quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `alias`, `item_category_id`, `item_group_id`, `item_sub_group_id`, `unit_id`, `freeze`, `source`, `minimum_quantity`, `maximum_quantity`) VALUES
(556, '0.5 HP / 1500 RPM REMI', 'A', 3, 8, '5', 1, 0, 'Manufactured', 0, 0),
(557, '1 HP / 1500 RPM REMI', '', 3, 8, '5', 1, 0, 'Purchessed', 0, 0),
(558, '1.50 HP / 1500 RPM REMI', '', 3, 8, '5', 1, 0, 'Purchessed', 0, 0),
(559, '2 HP / 1500 RPM REMI', '2 HP / 1500 RPM REMI', 3, 8, '5', 1, 0, 'Purchessed', 0, 0),
(560, '3 HP / 1500 RPM REMI', '', 3, 8, '5', 1, 0, 'Purchessed', 0, 0),
(561, '5 HP / 1500 RPM REMI', '', 3, 8, '5', 1, 0, 'Purchessed', 0, 0),
(562, '7.50 HP / 1500 RPM REMI', '', 3, 8, '5', 1, 0, 'Purchessed', 0, 0),
(563, '10 HP / 1500 RPM REMI', '', 3, 8, '5', 1, 0, 'Purchessed', 0, 0),
(564, '12.50 HP / 1500 RPM REMI', '', 3, 8, '5', 1, 0, 'Purchessed', 0, 0),
(565, '20 HP / 1500 RPM REMI', '', 3, 8, '5', 1, 0, 'Purchessed', 0, 0),
(566, '1 HP / 3000 RPM REMI', '1 HP / 3000 RPM REMI', 3, 8, '5', 1, 0, 'Purchessed', 1, 1),
(567, '1.50 HP / 3000 RPM REMI', '', 3, 8, '5', 1, 0, 'Purchessed', 0, 0),
(568, '2 HP / 3000 RPM REMI', '', 3, 8, '5', 1, 0, 'Purchessed', 0, 0),
(569, '3 HP / 3000 RPM REMI', '3 HP / 3000 RPM REMI', 3, 8, '5', 1, 0, 'Purchessed', 1, 1),
(570, '5 HP / 3000 RPM REMI', '5 HP / 3000 RPM REMI', 3, 8, '5', 1, 0, 'Purchessed', 1, 1),
(572, '10 HP / 3000 RPM REMI', '', 3, 8, '5', 1, 0, 'Purchessed', 0, 0),
(573, '12.50 HP / 3000 RPM REMI', '', 3, 8, '5', 1, 0, 'Purchessed', 0, 0),
(574, '20 HP / 3000 RPM REMI', '', 3, 8, '5', 1, 0, 'Purchessed', 0, 0),
(575, '15 HP / 3000 RPM REMI', '15 HP / 3000 RPM REMI', 3, 8, '5', 1, 0, 'Purchessed', 0, 0),
(576, '2 HP / 32 RPM Geared Motor', '', 3, 8, '7', 1, 0, 'Purchessed', 0, 0),
(577, '1 HP / 1500 RPM BBL', '', 3, 7, '4', 1, 0, 'Purchessed', 0, 0),
(578, '1.50 HP / 1500 RPM BBL', '', 3, 7, '4', 1, 0, 'Purchessed', 0, 0),
(579, '2 HP / 1500 RPM BBL', '', 3, 7, '4', 1, 0, 'Purchessed', 0, 0),
(580, '3 HP / 1500 RPM BBL', '', 3, 7, '4', 1, 0, 'Purchessed', 0, 0),
(581, '5 HP / 1500 RPM BBL', '', 3, 7, '4', 1, 0, 'Purchessed', 0, 0),
(582, '7.50 HP / 1500 RPM BBL', '', 3, 7, '4', 1, 0, 'Purchessed', 0, 0),
(583, '10 HP / 1500 RPM BBL', '10 HP / 1500 RPM BBL', 3, 7, '4', 1, 0, 'Purchessed', 0, 0),
(584, '12.50 HP / 1500 RPM BBL', '', 3, 7, '4', 1, 0, 'Purchessed', 0, 0),
(585, '20 HP / 1500 RPM BBL', '', 3, 7, '4', 1, 0, 'Purchessed', 0, 0),
(586, '1 HP / 3000 RPM BBL', '', 3, 7, '4', 1, 0, 'Purchessed', 0, 0),
(587, '1.50 HP / 3000 RPM BBL', '', 3, 7, '4', 1, 0, 'Purchessed', 0, 0),
(588, '2 HP / 3000 RPM BBL', '', 3, 7, '4', 1, 0, 'Purchessed', 0, 0),
(589, '3 HP / 3000 RPM BBL', '3 HP / 3000 RPM BBL', 3, 7, '4', 1, 0, 'Purchessed', 0, 0),
(590, '5 HP / 3000 RPM BBL', '5 HP / 3000 RPM BBL', 3, 7, '4', 1, 0, 'Purchessed', 0, 0),
(591, '7.50 HP / 3000 RPM BBL', '', 3, 7, '4', 1, 0, 'Purchessed', 0, 0),
(592, '10 HP / 3000 RPM BBL', '', 3, 7, '4', 1, 0, 'Purchessed', 0, 0),
(593, '12.50 HP / 3000 RPM BBL', '', 3, 7, '4', 1, 0, 'Purchessed', 0, 0),
(594, '20 HP / 3000 RPM BBL', '', 3, 7, '4', 1, 0, 'Purchessed', 0, 0),
(595, '15 HP / 3000 RPM BBL', '', 3, 7, '4', 1, 0, 'Purchessed', 0, 0),
(596, '3 HP / 3000 RPM FLP CGL', '', 3, 14, '57', 1, 0, 'Purchessed', 0, 0),
(597, '60 HP / 1500 RPM BBL', '60 HP / 1500 RPM BBL', 3, 7, '4', 1, 0, 'Purchessed', 0, 0),
(598, '1 HP / 1500 RPM CGL Single Phase', '', 3, 14, '58', 1, 0, 'Purchessed', 0, 0),
(599, 'RT 15 Gear Pump', '', 1, 22, '20', 1, 0, 'Purchessed', 0, 0),
(600, 'RT 40 Gear Pump', 'RT 40 Gear Pump', 1, 2, '7', 1, 0, 'Purchessed', 1, 1),
(601, 'RT 80 Gear Pump', 'RT 80 Gear Pump', 1, 2, '7', 1, 0, 'Purchessed', 1, 1),
(602, 'RT 125/32 Gear Pump', '', 1, 22, '20', 1, 0, 'Purchessed', 0, 0),
(603, 'RT 125/50 Gear Pump', 'Asd', 1, 4, '64', 1, 0, 'Assembled', 0, 0),
(604, 'RT 20 Gear Pump', 'RT 20 Gear Pump', 1, 2, '7', 1, 0, 'Purchessed', 1, 1),
(605, 'R 20 DG Gear Pump', '', 1, 22, '20', 1, 0, 'Purchessed', 0, 0),
(606, 'T3 S 45 Pump', 'T3 S 45 Pump', 1, 2, '8', 1, 0, 'Purchessed', 0, 0),
(607, 'T3 S 38 Pump', 'T3 S 38 Pump', 1, 2, '8', 1, 0, 'Purchessed', 0, 0),
(608, 'T3 S 52 Pump', 'T3 S 52 Pump', 1, 2, '8', 1, 0, 'Purchessed', 0, 0),
(609, 'T3 S 60 Pump', 'T3 S 60 Pump', 1, 2, '8', 1, 0, 'Purchessed', 0, 0),
(610, 'T3 S 80 Pump', 'T3 S 80 Pump', 1, 2, '8', 1, 0, 'Purchessed', 0, 0),
(611, 'T3 S 90 Pump', 'T3 S 90 Pump', 1, 2, '8', 1, 0, 'Purchessed', 0, 0),
(612, 'Mechanical Seal T3 S 45', 'Mechanical Seal T3 S 45', 6, 15, '17', 1, 0, 'Purchessed', 0, 0),
(613, 'Mechanical Seal T3 S 38', '', 6, 15, '17', 1, 0, 'Purchessed', 0, 0),
(614, 'Mechanical Seal T3 S 52', '', 6, 15, '17', 1, 0, 'Purchessed', 0, 0),
(615, 'Mechanical Seal T3 S 60', '', 6, 15, '17', 1, 0, 'Purchessed', 0, 0),
(616, 'Mechanical Seal T3 S 80', '', 6, 15, '17', 1, 0, 'Purchessed', 0, 0),
(617, 'Mechanical Seal T3 S 90', '', 6, 15, '17', 1, 0, 'Purchessed', 0, 0),
(618, 'T3 SFP 40/38', 'T3 SFP 40/38', 1, 2, '8', 1, 0, 'Purchessed', 0, 0),
(619, 'T3 SFP 40/46', 'T3 SFP 40/46', 1, 2, '8', 1, 0, 'Purchessed', 0, 0),
(620, 'T3 SFP 20/46', 'T3 SFP 20/46', 1, 2, '8', 1, 0, 'Purchessed', 0, 0),
(621, 'Mechanical Seal T3 SFP', 'Mechanical Seal T3 SFP', 6, 15, '17', 1, 0, 'Purchessed', 0, 0),
(622, 'T1 S 25.1', '', 1, 22, '10', 1, 0, 'Purchessed', 0, 0),
(623, 'T1 S 50.1', '', 1, 22, '10', 1, 0, 'Purchessed', 0, 0),
(624, 'T1 S 380.1', '', 1, 22, '10', 1, 0, 'Purchessed', 0, 0),
(625, 'T3 SA 38/46 JOP', 'T3 SA 38/46 JOP', 1, 2, '8', 1, 0, 'Purchessed', 0, 0),
(626, 'IMO Pump', '', 1, 22, '8', 1, 0, 'Purchessed', 0, 0),
(627, 'R 50 SL ', '', 1, 22, '56', 1, 0, 'Purchessed', 0, 0),
(628, 'R 100 SL ', '', 1, 22, '56', 1, 0, 'Purchessed', 0, 0),
(629, 'TRF 660 Pump', '', 1, 22, '8', 1, 0, 'Purchessed', 0, 0),
(630, 'TRF 1700 Pump', '', 1, 22, '8', 1, 0, 'Purchessed', 0, 0),
(631, 'TRF 2500 Pump', '', 1, 22, '8', 1, 0, 'Purchessed', 0, 0),
(632, 'TRF 1300 Pump', '', 1, 22, '8', 1, 0, 'Purchessed', 0, 0),
(633, 'TRF 660 Sealkit', '', 6, 15, '17', 3, 0, 'Purchessed', 0, 0),
(634, 'TRF 1700 Sealkit', '', 6, 15, '17', 3, 0, 'Purchessed', 0, 0),
(635, 'TRF 2500 Sealkit', '', 6, 15, '17', 3, 0, 'Purchessed', 0, 0),
(636, 'TRF 1300 Sealkit', '', 6, 15, '17', 3, 0, 'Purchessed', 0, 0),
(637, 'T 2003 H Pump', '', 1, 4, '53', 1, 0, 'Purchessed', 0, 0),
(638, 'T 2504 Pump', '', 1, 4, '53', 1, 0, 'Purchessed', 0, 0),
(639, 'T 1503 H Pump', '', 1, 4, '53', 1, 0, 'Purchessed', 0, 0),
(640, 'J 102 SP', '', 1, 4, '53', 1, 0, 'Purchessed', 0, 0),
(641, 'J 103', '', 1, 4, '53', 1, 0, 'Purchessed', 0, 0),
(642, 'J 52', '', 1, 4, '53', 1, 0, 'Purchessed', 0, 0),
(643, 'J 32', '', 1, 4, '53', 1, 0, 'Purchessed', 0, 0),
(644, 'J 33', '', 1, 4, '53', 1, 0, 'Purchessed', 0, 0),
(645, 'WW 101 With Control Panel', 'WW 101 With Control Panel', 1, 4, '52', 1, 0, 'Purchessed', 1, 1),
(646, 'WW 151', '', 1, 4, '52', 1, 0, 'Purchessed', 0, 0),
(647, 'WV 01 L/40', '', 1, 4, '52', 1, 0, 'Purchessed', 0, 0),
(648, 'HE 130 CT', 'HE 130 CT', 1, 5, '60', 1, 0, 'Purchessed', 1, 1),
(649, 'NSRP 50 Pump Semi Open Impeller', '', 1, 5, '60', 1, 0, 'Purchessed', 0, 0),
(650, 'NSRP 50 Pump Closed Impeller', '', 1, 5, '60', 1, 0, 'Purchessed', 0, 0),
(651, 'NZ 25 125 Pump Closed Impeller', '', 1, 5, '59', 1, 0, 'Purchessed', 0, 0),
(652, 'NZ 32 125 Pump Closed Impeller', '', 1, 5, '59', 1, 0, 'Purchessed', 0, 0),
(653, 'NZ 50 125 Pump Closed Impeller', '', 1, 5, '59', 1, 0, 'Purchessed', 0, 0),
(654, 'NZ 25 160 Pump Closed Impeller', '', 1, 5, '59', 1, 0, 'Purchessed', 0, 0),
(655, 'NZ 32 160 Pump Closed Impeller', '', 1, 5, '59', 1, 0, 'Purchessed', 0, 0),
(656, 'NZ 50 160 Pump Closed Impeller', '', 1, 5, '59', 1, 0, 'Purchessed', 0, 0),
(657, 'NZ 25 160 Pump Closed Impeller', '', 1, 5, '59', 1, 0, 'Purchessed', 0, 0),
(658, 'NZ 50 200 Pump Closed Impeller', '', 1, 5, '59', 1, 0, 'Purchessed', 0, 0),
(659, 'NZ 25 125 Pump Semi Open Impeller', '', 1, 5, '59', 1, 0, 'Purchessed', 0, 0),
(660, 'NZ 32 125 Pump Semi Open Impeller', '', 1, 5, '59', 1, 0, 'Purchessed', 0, 0),
(661, 'NZ 50 125 Pump Semi Open Impeller', '', 1, 5, '59', 1, 0, 'Purchessed', 0, 0),
(663, 'NZ 32 160 Pump Semi Open Impeller', '', 1, 5, '59', 1, 0, 'Purchessed', 0, 0),
(664, 'NZ 50 160 Pump Semi Open Impeller', '', 1, 5, '59', 1, 0, 'Purchessed', 0, 0),
(665, 'NZ 25 160 Pump Semi Open Impeller', '', 1, 5, '59', 1, 0, 'Purchessed', 0, 0),
(666, 'NZ 50 200 Pump Semi Open Impeller', '', 1, 5, '59', 1, 0, 'Purchessed', 0, 0),
(667, 'Mechanical seal 1" Antico', '', 6, 17, '33', 1, 0, 'Purchessed', 2, 3),
(668, 'Mechanical seal 1.125" Antico', '', 6, 17, '33', 1, 0, 'Purchessed', 2, 3),
(669, 'Mechanical Seal 1.375" Antico', 'Mechanical Seal 1.375" Antico', 6, 17, '16', 3, 0, 'Purchessed', 1, 1),
(670, 'Mechanical Seal 1.625" Antico', 'Mechanical Seal 1.625" Antico', 6, 17, '15', 1, 0, 'Purchessed', 1, 1),
(671, 'Mechanical seal 1.875" Antico', '', 6, 17, '15', 1, 0, 'Purchessed', 2, 3),
(672, 'Shaft Sleeve Ceramic 1" Antico', '', 6, 17, '33', 1, 0, 'Purchessed', 2, 3),
(673, 'Shaft Sleeve Ceramic 1.125" Antico', '', 6, 17, '33', 1, 0, 'Purchessed', 2, 3),
(674, 'Shaft Sleeve Ceramic 1.375" Antico', '', 6, 17, '16', 1, 0, 'Purchessed', 2, 3),
(675, 'Shaft Sleeve Ceramic 1.625" ', 'Shaft Sleeve Ceramic 1.625" Antico', 6, 17, '15', 1, 0, 'Purchessed/Manufactured', 1, 1),
(676, 'Shaft Sleeve Ceramic 1.875" Antico', '', 6, 17, '15', 1, 0, 'Purchessed', 2, 3),
(677, 'KGEN 11 3 G1', 'KGEN 11 3 G1', 1, 1, '21', 1, 0, 'Purchessed', 10, 10),
(678, 'KGEN 11 3 G6', '', 1, 1, '21', 1, 0, 'Purchessed', 10, 10),
(679, 'KGEN 11 4 G1', 'KGEN 11 4 G1', 1, 1, '21', 1, 0, 'Purchessed', 10, 10),
(680, 'KGEN 11 4 G6', '', 1, 1, '21', 1, 0, 'Purchessed', 10, 10),
(681, 'KGEN 12 5 G1', 'KGEN 12 5 G1', 1, 1, '21', 1, 0, 'Purchessed', 1, 1),
(682, 'KGEN 12 5 G6', 'KGEN 12 5 G6', 1, 1, '21', 1, 0, 'Purchessed', 1, 1),
(683, 'KGEN 12b 5 G1', 'KGEN 12b 5 G1', 1, 1, '21', 1, 0, 'Purchessed', 0, 0),
(684, 'KGEN 16 3 G1', 'KGEN 16 3 G1', 1, 1, '21', 1, 0, 'Purchessed', 1, 1),
(685, 'KGEN 16 6 G1', 'KGEN 16 6 G1', 1, 1, '21', 1, 0, 'Purchessed', 1, 1),
(686, 'KGEN 14 8 G1', 'KGEN 14 8 G1', 1, 1, '21', 1, 0, 'Purchessed', 1, 1),
(687, 'KGEN 15 6 G1', '', 1, 1, '21', 1, 0, 'Purchessed', 10, 10),
(688, 'KGEN 25N 10 G1', 'KGEN 25N 10 G1', 1, 1, '21', 1, 0, 'Purchessed', 1, 1),
(689, 'KGEN 25N 10 G6', 'KGEN 25N 10 G6', 1, 1, '21', 1, 0, 'Purchessed', 1, 1),
(690, 'KGEN 21 8 G1', 'KGEN 21 8 G1', 1, 1, '21', 1, 0, 'Purchessed', 1, 1),
(691, 'KGEN 15 6 G6', '', 1, 1, '21', 1, 0, 'Purchessed', 3, 3),
(692, 'KGEN 12 6 G1', '', 1, 1, '21', 1, 0, 'Purchessed', 10, 10),
(693, 'CN 25 125 G1 S2 L3', 'CN 25 125 G1 S2 L3', 1, 1, '1', 1, 0, 'Purchessed', 1, 1),
(694, 'CN 25 160 G1 S2 L3', 'CN 25 160 G1 S2 L3', 1, 1, '1', 1, 0, 'Purchessed', 0, 0),
(695, 'CN 32 160 G1 S2 L3', 'CN 32 160 G1 S2 L3', 1, 1, '1', 1, 0, 'Purchessed', 1, 1),
(696, 'CN 40 160 G1 S2 L3', '', 1, 1, '1', 1, 0, 'Purchessed', 1, 1),
(697, 'CN 50 160 G1 S2 L3', '', 1, 1, '1', 1, 0, 'Purchessed', 1, 1),
(698, 'CN 65 160 G1 S2 L3', 'CN 65 160 G1 S2 L3', 1, 1, '1', 1, 0, 'Purchessed', 1, 1),
(699, 'CN 80 160 G1 S2 L3', 'CN 80 160 G1 S2 L3', 1, 1, '1', 1, 0, 'Purchessed', 1, 1),
(700, 'CN 100 160 G1 S2 L3', '', 1, 1, '1', 1, 0, 'Purchessed', 0, 0),
(701, 'CN 32 160 G1 S2 L1', '', 1, 1, '1', 1, 0, 'Purchessed', 3, 3),
(702, 'CN 40 160 G1 S2 L1', 'CN 40 160 G1 S2 L1', 1, 1, '1', 1, 0, 'Purchessed', 1, 1),
(703, 'CN 50 160 G1 S2 L1', 'CN 50 160 G1 S2 L1', 1, 1, '1', 1, 0, 'Purchessed', 1, 1),
(704, 'CB 32 160 G1', 'CB 32 160 G1', 1, 1, '61', 1, 0, 'Purchessed', 1, 1),
(705, 'CB 40 160 G1', 'CB 40 160 G1', 1, 1, '61', 1, 0, 'Purchessed', 1, 1),
(706, 'CB 40 200 G1', 'CB 40 200 G1', 1, 1, '61', 1, 0, 'Purchessed', 1, 1),
(707, 'CB 80 200 G1', '', 1, 1, '61', 1, 0, 'Purchessed', 1, 1),
(708, 'CB 200 200 G1', 'CB 200 200 G1', 1, 1, '61', 1, 0, 'Purchessed', 1, 1),
(709, 'CN 32 200 G1 S2 L3', 'CN 32 200 G1 S2 L3', 1, 1, '1', 1, 0, 'Purchessed', 1, 1),
(710, 'CN 32 125 G1 S2 L1', '', 1, 1, '1', 1, 0, 'Purchessed', 0, 0),
(711, 'CN 40 125 G1 S2 L1', '', 1, 1, '1', 1, 0, 'Purchessed', 0, 0),
(712, 'CN 50 125 G1 S2 L1', '', 1, 1, '1', 1, 0, 'Purchessed', 0, 0),
(713, 'CN 65 125 G1 S2 L1', '', 1, 1, '1', 1, 0, 'Purchessed', 0, 0),
(714, 'CN 40 200 G1 S2 L3', 'CN 40 200 G1 S2 L3', 1, 1, '1', 1, 0, 'Purchessed', 1, 1),
(715, 'CN 50 200 G1 S2 L3', 'CN 50 200 G1 S2 L3', 1, 1, '1', 1, 0, 'Purchessed', 1, 1),
(716, 'CN 65 200 G1 S2 L3', 'CN 65 200 G1 S2 L3', 1, 1, '1', 1, 0, 'Purchessed', 1, 1),
(717, 'CN 80 200 G1 S2 L3', 'CN 80 200 G1 S2 L3', 1, 1, '1', 1, 0, 'Purchessed', 1, 1),
(718, 'CN 100 200 G1 S2 L3', '', 1, 1, '1', 1, 0, 'Purchessed', 0, 0),
(719, 'CN 40 250 G1 S2 L3', 'CN 40 250 G1 S2 L3', 1, 1, '1', 1, 0, 'Purchessed', 1, 1),
(720, 'CN 50 250 G1 S2 L3', 'CN 50 250 G1 S2 L3', 1, 1, '1', 1, 0, 'Purchessed', 1, 1),
(721, 'CN 200 200 G1 S2 L3', 'CN 200 200 G1 S2 L3', 1, 1, '1', 1, 0, 'Purchessed', 1, 1),
(722, 'CN 125 315 G1 S2 L3', 'CN 125 315 G1 S2 L3', 1, 1, '1', 1, 0, 'Purchessed', 1, 1),
(723, 'CN 100 315 G1 S2 L3', 'CN 100 315 G1 S2 L3', 1, 1, '1', 1, 0, 'Purchessed', 1, 1),
(724, 'CCR 32 200 R6 S2 L3', 'CCR 32 200 R6 S2 L3', 1, 1, '2', 1, 0, 'Purchessed', 1, 1),
(725, 'CCR 32 250 R6 M2 L3', 'CCR 32 250 R6 M2 L3', 1, 1, '2', 1, 0, 'Purchessed', 1, 1),
(726, 'CCR 40 200 R6 S2 L3', '', 1, 1, '2', 1, 0, 'Purchessed', 2, 2),
(727, 'CCR 50 200 R6 S2 L3', 'CCR 50 200 R6 S2 L3', 1, 1, '2', 1, 0, 'Purchessed', 1, 1),
(728, 'CCR 65 200 R6 S2 L3', '', 1, 1, '2', 1, 0, 'Purchessed', 0, 0),
(729, 'CCR 25 125 R6 S2 L3', '', 1, 1, '2', 1, 0, 'Purchessed', 2, 2),
(730, 'CCR 25 160 R6 S2 L3', '', 1, 1, '2', 1, 0, 'Purchessed', 1, 1),
(731, 'CCR 32 160 R6 S2 L3', '', 1, 1, '2', 1, 0, 'Purchessed', 2, 2),
(732, 'CCR 40 160 R6 S2 L3', 'CCR 40 160 R6 S2 L3', 1, 1, '2', 1, 0, 'Purchessed', 1, 1),
(733, 'CCR 50 160 R6 S2 L3', '', 1, 1, '2', 1, 0, 'Purchessed', 1, 1),
(734, 'CCR 65 160 R6 S2 L3', 'CCR 65 160 R6 S2 L3', 1, 1, '2', 1, 0, 'Purchessed', 1, 1),
(735, 'CCR 32 125 R6 S2 L3', '', 1, 1, '2', 1, 0, 'Purchessed', 0, 0),
(736, 'CCR 65 160 R1 S2 L3', '', 1, 1, '2', 1, 0, 'Purchessed', 0, 0),
(737, 'CCR 50 200 R6A S2 L6', '', 1, 1, '2', 1, 0, 'Purchessed', 0, 0),
(738, 'CCR 32 160 R6A M2 L6', 'CCR 32 160 R6A M2 L6', 1, 1, '2', 1, 0, 'Purchessed', 1, 1),
(739, 'MCH / MCV 12', '', 1, 1, '3', 1, 0, 'Purchessed', 0, 0),
(740, 'MCH / MCV 16', '', 1, 1, '3', 1, 0, 'Purchessed', 0, 0),
(741, 'MCH / MCV 20', '', 1, 1, '3', 1, 0, 'Purchessed', 0, 0),
(742, 'MCH / MCV 12 with Motor', '', 7, 26, '3', 3, 0, 'Purchessed/Manufactured', 0, 0),
(743, 'MCH / MCV 14 with Motor', '', 7, 26, '3', 3, 0, 'Purchessed/Manufactured', 0, 0),
(744, 'MCH / MCV 16 with Motor', '', 7, 26, '3', 3, 0, 'Purchessed/Manufactured', 0, 0),
(745, 'MCH / MCV 20 with Motor', '', 7, 26, '3', 3, 0, 'Purchessed/Manufactured', 0, 0),
(746, 'Bearing Housing KGEN 11 3 to 11 4', '', 6, 16, '21', 1, 0, 'Purchessed', 5, 5),
(747, 'Bearing Housing KGEN 12 5 To 16 6', 'Bearing Housing KGEN 12 5 To 16 6', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(748, 'Bearing Cover KGEN 11 3 To 11 4', 'Bearing Cover KGEN 11 3 To 11 4', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(749, 'Bearing Cover KGEN 12 5 To 16 6', 'Bearing Cover KGEN 12 5 To 16 6', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(750, 'Oil Seal KGEN 11 3 To 11 4', 'Oil Seal KGEN 11 3 To 11 4', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(751, 'Oil Seal KGEN 12 5 To 16 6', 'Oil Seal KGEN 12 5 To 16 6', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(752, 'Intermediate Cover KGEN 11 3 To 11 4', 'Intermediate Cover KGEN 11 3 To 11 4', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(753, 'Intermediate Cover KGEN 12 5 to 16 6', '', 6, 16, '21', 1, 0, 'Purchessed', 3, 3),
(754, 'Intermediate Cover KGEN 25n 10', 'Intermediate Cover KGEN 25n 10', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(755, 'Mechanical Seal KGEN 11 3 To 11 4', 'Mechanical Seal KGEN 11 3 To 11 4', 6, 16, '11', 1, 0, 'Purchessed', 0, 0),
(756, 'Mechanical Seal KGEN 12 5 To 16 6', 'Mechanical Seal KGEN 12 5 To 16 6', 6, 16, '11', 1, 0, 'Purchessed', 10, 10),
(757, 'Suction Cover KGEN 11 3 To 11 4', 'Suction Cover KGEN 11 3 To 11 4', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(758, 'Suction Cover KGEN 12 5 & 12b 5', 'Suction Cover KGEN 12 5 & 12b 5', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(759, 'Suction Cover KGEN 12 6, 15 6 & 16 6', '', 6, 16, '21', 1, 0, 'Purchessed', 2, 2),
(760, 'Suction Cover KGEN 14 8', 'Suction Cover KGEN 14 8', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(761, 'Window Cover KGEN 12 5 To 16 6', 'Window Cover KGEN 12 5 To 16 6', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(762, 'Valve Assembly KGEN 11 3', '', 6, 16, '21', 1, 0, 'Purchessed', 5, 5),
(763, 'Valve Assembly KGEN 11 4', 'Valve Assembly KGEN 11 4', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(764, 'Valve Assembly KGEN 12 5 & 12b 5', 'Valve Assembly KGEN 12 5 & 12b 5', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(765, 'Valve Assembly KGEN 12 6, 15 6 & 16 6', '', 6, 16, '21', 1, 0, 'Purchessed', 5, 5),
(766, 'Valve Assembly KGEN 14 8', 'Valve Assembly KGEN 14 8', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(767, 'Shaft KGEN 11 3 to 11 4', '', 6, 16, '21', 1, 0, 'Purchessed/Manufactured', 2, 2),
(768, 'Shaft KGEN 12 5 to 16 6', '', 6, 16, '21', 1, 0, 'Purchessed/Manufactured', 2, 2),
(769, 'Shaft KGEN 25n 10', '', 6, 16, '21', 1, 0, 'Purchessed/Manufactured', 1, 1),
(770, 'CI Impeller KGEN 11 3', 'CI Impeller KGEN 11 3', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(771, 'CI Impeller KGEN 11 4', 'CI Impeller KGEN 11 4', 6, 16, '11', 1, 0, 'Purchessed', 0, 0),
(772, 'CI Impeller KGEN 12 5', 'CI Impeller KGEN 12 5', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(773, 'CI Impeller KGEN 12b 5', 'CI Impeller KGEN 12b 5', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(774, 'CI Impeller KGEN 12 6', 'CI Impeller KGEN 12 6', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(775, 'CI Impeller KGEN 15 6', '', 6, 16, '21', 1, 0, 'Purchessed', 5, 5),
(776, 'CI Impeller KGEN 14 8', 'CI Impeller KGEN 14 8', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(777, 'CI Impeller KGEN 16 6', '', 6, 16, '21', 1, 0, 'Purchessed', 5, 5),
(778, 'CI Impeller KGEN 16 3', 'CI Impeller KGEN 16 3', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(779, 'CI Impeller KGEN 21 8', '', 6, 16, '21', 1, 0, 'Purchessed', 0, 0),
(780, 'CI Impeller KGEN 25n 10', 'CI Impeller KGEN 25n 10', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(781, 'SS Impeller KGEN 11 3', '', 6, 16, '21', 1, 0, 'Purchessed', 2, 2),
(782, 'SS Impeller KGEN 11 4', '', 6, 16, '21', 1, 0, 'Purchessed', 2, 2),
(783, 'SS Impeller KGEN 12 5', '', 6, 16, '21', 1, 0, 'Purchessed', 2, 2),
(784, 'SS Impeller KGEN 12b 5', '', 6, 16, '21', 1, 0, 'Purchessed', 2, 2),
(785, 'SS Impeller KGEN 12 6', '', 6, 16, '21', 1, 0, 'Purchessed', 2, 2),
(786, 'SS Impeller KGEN 15 6', '', 6, 16, '21', 1, 0, 'Purchessed', 2, 2),
(787, 'SS Impeller KGEN 14 8', '', 6, 16, '21', 1, 0, 'Purchessed', 2, 2),
(788, 'SS Impeller KGEN 16 6', '', 6, 16, '21', 1, 0, 'Purchessed', 2, 2),
(789, 'SS Impeller KGEN 16 3', '', 6, 16, '21', 1, 0, 'Purchessed', 0, 0),
(790, 'SS Impeller KGEN 21 8', '', 6, 16, '21', 1, 0, 'Purchessed', 0, 0),
(791, 'SS Impeller KGEN 25n 10', '', 6, 16, '21', 1, 0, 'Purchessed', 1, 1),
(792, 'Pump Casing KGEN 11 3', '', 6, 16, '21', 1, 0, 'Purchessed', 0, 0),
(793, 'Pump Casing KGEN 11 4', '', 6, 16, '21', 1, 0, 'Purchessed', 0, 0),
(794, 'Pump Casing KGEN 12 5', '', 6, 16, '21', 1, 0, 'Purchessed', 0, 0),
(795, 'Pump Casing KGEN 12b 5', '', 6, 16, '21', 1, 0, 'Purchessed', 0, 0),
(796, 'Pump Casing KGEN 12 6', '', 6, 16, '21', 1, 0, 'Purchessed', 0, 0),
(797, 'Pump Casing KGEN 15 6', '', 6, 16, '21', 1, 0, 'Purchessed', 0, 0),
(798, 'Pump Casing KGEN 14 8', '', 6, 16, '21', 1, 0, 'Purchessed', 0, 0),
(799, 'Pump Casing KGEN 16 6', '', 6, 16, '21', 1, 0, 'Purchessed', 0, 0),
(800, 'KGEN 11 3 with Motor', '', 7, 26, '30', 3, 0, 'Purchessed/Manufactured', 0, 0),
(801, 'KGEN 11 4 with Motor', '', 7, 26, '30', 3, 0, 'Purchessed/Manufactured', 0, 0),
(802, 'KGEN 12 6 with Motor', '', 7, 26, '30', 3, 0, 'Purchessed/Manufactured', 0, 0),
(803, 'KGEN 12 5 with Motor', '', 7, 26, '30', 3, 0, 'Purchessed/Manufactured', 0, 0),
(804, 'KGEN 12b 5 with Motor', '', 7, 26, '30', 3, 0, 'Purchessed/Manufactured', 0, 0),
(805, 'KGEN 16 3 with Motor', '', 7, 26, '30', 3, 0, 'Purchessed/Manufactured', 0, 0),
(806, 'KGEN 16 6 with Motor', '', 7, 26, '30', 3, 0, 'Purchessed/Manufactured', 0, 0),
(807, 'KGEN 14 8 with Motor', '', 7, 26, '30', 3, 0, 'Purchessed/Manufactured', 0, 0),
(808, 'KGEN 15 6 with Motor', '', 7, 26, '30', 3, 0, 'Purchessed/Manufactured', 0, 0),
(809, 'KGEN 25n 10 with Motor', '', 7, 26, '30', 3, 0, 'Purchessed/Manufactured', 0, 0),
(810, 'CN 32 160 with Motor', '', 7, 26, '62', 3, 0, 'Purchessed/Manufactured', 0, 0),
(811, 'CN 40 200 with Motor', '', 7, 26, '62', 3, 0, 'Purchessed/Manufactured', 0, 0),
(812, 'CN 50 160 With Motor', 'CN 50 160 With Motor', 7, 26, '62', 3, 0, 'Manufactured', 0, 0),
(813, 'CI Impeller CN 200 200', '', 6, 16, '13', 1, 0, 'Purchessed', 1, 1),
(814, 'CI Impeller CN 80 200', '', 6, 16, '13', 1, 0, 'Purchessed', 1, 1),
(815, 'CI Impeller CN 65c 200', '', 6, 16, '13', 1, 0, 'Purchessed', 0, 0),
(816, 'CI Impeller CN 100 400', 'CI Impeller CN 100 400', 6, 16, '13', 1, 0, 'Purchessed', 1, 1),
(817, 'CI Impeller CN 125 250', 'CI Impeller CN 125 250', 6, 16, '13', 1, 0, 'Purchessed', 1, 1),
(818, 'CI Impeller CN 40 160', 'CI Impeller CN 40 160', 6, 16, '13', 1, 0, 'Purchessed', 1, 1),
(819, 'CI Impeller CN 40 200', 'CI Impeller CN 40 200', 6, 16, '13', 1, 0, 'Purchessed', 1, 1),
(820, 'CI Impeller CN 40C 160 G1', 'CI Impeller CN 40C 160 G1', 6, 16, '13', 1, 0, 'Purchessed', 1, 1),
(821, 'CI Impeller CN 50 160', 'CI Impeller CN 50 160', 6, 16, '13', 1, 0, 'Purchessed', 0, 0),
(822, 'CI Impeller CN 50 250', '', 6, 16, '13', 1, 0, 'Purchessed', 0, 0),
(823, 'SS Impeller CCR 40 200 R6A', '', 6, 16, '25', 1, 0, 'Purchessed', 0, 0),
(824, 'SS Impeller CCR 50 160', '', 6, 16, '25', 1, 0, 'Purchessed', 0, 0),
(825, 'SS Impeller CCR 50c 160', '', 6, 16, '25', 1, 0, 'Purchessed', 0, 0),
(826, 'CS Impeller CCR 40 160 R1', 'CS Impeller CCR 40 160 R1', 6, 16, '25', 1, 0, 'Purchessed', 1, 1),
(827, 'Bearing Housing CCR 50 160', 'Bearing Housing CCR 50 160', 6, 16, '25', 1, 0, 'Purchessed', 1, 1),
(828, 'Backplate for EXP 160 CT', '', 6, 17, '16', 1, 0, 'Purchessed', 0, 0),
(829, 'Bearing Cover for EXP 160 CT', '', 6, 17, '16', 1, 0, 'Purchessed', 0, 0),
(830, 'Deflector For EXP 160 CT', 'Deflector For EXP 160 CT', 6, 17, '16', 1, 0, 'Purchessed', 1, 1),
(831, 'Impeller For EXP 160 CT', 'Impeller For EXP 160 CT', 6, 17, '16', 1, 0, 'Purchessed', 1, 1),
(832, 'Locating Flange 1.375" Antico', '', 6, 17, '16', 1, 0, 'Purchessed', 0, 0),
(833, 'Oil Levellor Antico Pump', '', 6, 17, '16', 1, 0, 'Purchessed', 0, 0),
(834, 'Shaft SS 316 NZ ', 'Shaft SS 316 NZ ', 6, 17, '15', 1, 0, 'Purchessed/Manufactured', 1, 1),
(835, 'Adapter Flange 1.375" Antico', '', 6, 17, '16', 1, 0, 'Purchessed', 0, 0),
(836, 'Cap Nut TS 105/030', '', 6, 15, '18', 1, 0, 'Purchessed', 0, 0),
(837, 'Circlip NSS 65 250 W8', 'Circlip NSS 65 250 W8', 6, 15, '85', 1, 0, 'Purchessed', 1, 1),
(838, 'Clamping Band T1SB 50.1', '', 6, 15, '19', 1, 0, 'Purchessed', 0, 0),
(839, 'Coupling JOP T3SA 38/36', 'Coupling JOP T3SA 38/36', 6, 15, '17', 3, 0, 'Purchessed', 1, 1),
(840, 'Coupling Rod Pin T1SB 50.1', '', 6, 15, '19', 1, 0, 'Purchessed', 0, 0),
(841, 'Cover Sleeve T1SB 50.1', '', 6, 15, '19', 1, 0, 'Purchessed', 0, 0),
(842, 'Distance Bush TS 105/030', '', 6, 15, '18', 1, 0, 'Purchessed', 0, 0),
(843, 'Dowel Pin TS 105/030', '', 6, 15, '18', 1, 0, 'Purchessed', 0, 0),
(844, 'Gasket NSS 65 250 W8', 'Gasket NSS 65 250 W8', 6, 15, '85', 1, 0, 'Purchessed', 1, 1),
(845, 'Gasket & Ball Bearing T3ST 100/42', '', 6, 15, '17', 1, 0, 'Purchessed', 0, 0),
(846, 'Gasket & Ball Bearing T3ST 52/46', 'Gasket & Ball Bearing T3ST 52/46', 6, 15, '17', 1, 0, 'Purchessed', 1, 1),
(847, 'Groove Ball Bearing NSS 65 250 W8', 'Groove Ball Bearing NSS 65 250 W8', 6, 15, '85', 1, 0, 'Purchessed', 1, 1),
(848, 'Guide Bush T1SB 50.1', '', 6, 15, '19', 1, 0, 'Purchessed', 0, 0),
(849, 'Hexagon Nut NSS 65 250 W8', 'Hexagon Nut NSS 65 250 W8', 6, 15, '85', 1, 0, 'Purchessed', 1, 1),
(850, 'Impeller NSS 65 250 W8', 'Impeller NSS 65 250 W8', 6, 15, '85', 1, 0, 'Purchessed', 1, 1),
(851, 'Minor Joint Kit TRF 660', '', 6, 15, '17', 1, 0, 'Purchessed', 0, 0),
(852, 'Lock nut TS 105/030', '', 6, 15, '18', 1, 0, 'Purchessed', 0, 0),
(853, 'Mechanical Seal TDSH 088/40', 'Mechanical Seal TDSH 088/40', 6, 15, '18', 1, 0, 'Purchessed', 1, 1),
(854, 'Retaining Sleeve T1SB 50.1', '', 6, 15, '19', 1, 0, 'Purchessed', 0, 0),
(855, 'Rotor Set TIGGM 100/50 SSSS', '', 6, 15, '20', 1, 0, 'Purchessed', 0, 0),
(856, 'Relief Valve Assembly TDSH 088/40', '', 6, 15, '18', 1, 0, 'Purchessed', 0, 0),
(857, 'Shaft NSS 65 250 W8', 'Shaft NSS 65 250 W8', 6, 15, '85', 1, 0, 'Purchessed/Manufactured', 1, 0),
(858, 'Supporting Washer NSS 65 250 W8', 'Supporting Washer NSS 65 250 W8', 6, 15, '85', 1, 0, 'Purchessed', 1, 1),
(859, 'Timing Gear TDSH 088/40', 'Timing Gear TDSH 088/40', 6, 15, '18', 1, 0, 'Purchessed', 1, 1),
(860, 'Timing Gear TS 105/030', '', 6, 15, '18', 1, 0, 'Purchessed', 0, 0),
(861, 'Washer Lock TS 105/030', '', 6, 15, '18', 1, 0, 'Purchessed', 0, 0),
(862, 'Coupling L 075', '', 5, 20, '37', 1, 0, 'Purchessed', 10, 10),
(863, 'Coupling L 095', '', 5, 20, '37', 1, 0, 'Purchessed', 10, 10),
(864, 'Coupling L 100', '', 5, 20, '37', 1, 0, 'Purchessed', 10, 10),
(865, 'Coupling L 110', '', 5, 20, '37', 1, 0, 'Purchessed', 10, 10),
(866, 'Coupling L 150', '', 5, 20, '37', 1, 0, 'Purchessed', 1, 1),
(867, 'Coupling L 190', '', 5, 20, '37', 1, 0, 'Purchessed', 0, 0),
(868, 'Coupling RRL 095', '', 5, 20, '37', 1, 0, 'Purchessed', 0, 0),
(869, 'Coupling RRL 100', '', 5, 20, '37', 1, 0, 'Purchessed', 0, 0),
(870, 'Coupling RRL 110', '', 5, 20, '37', 1, 0, 'Purchessed', 0, 0),
(871, 'Coupling RRL 150', '', 5, 20, '37', 1, 0, 'Purchessed', 0, 0),
(872, 'Silicon Oil', 'Silicon Oil', 5, 30, '38', 4, 0, 'Purchessed', 1, 1),
(873, 'Panel Electronic DPPL', '', 5, 30, '38', 1, 0, 'Purchessed', 0, 0),
(874, 'Control Panel', 'Control Panel', 5, 30, '38', 1, 0, 'Purchessed', 1, 1),
(875, 'Starter for Pump / Motor', '', 5, 30, '38', 1, 0, 'Purchessed', 0, 0),
(876, 'PP Ball Valve', 'PP Ball Valve', 5, 30, '38', 1, 0, 'Purchessed', 1, 1),
(877, 'PP Flanges', 'PP Flanges', 5, 30, '38', 1, 0, 'Purchessed', 1, 1),
(878, 'PP NRV', 'PP NRV', 5, 30, '38', 1, 0, 'Purchessed', 1, 1),
(879, 'REMI 200 Mm Coach Fan CF 20 12V NDX', 'REMI 200 Mm Coach Fan CF 20 12V NDX', 6, 31, '84', 1, 0, 'Purchessed', 1, 1),
(880, 'Ball Valve 1.5"', '', 5, 30, '38', 1, 0, 'Purchessed', 0, 0),
(881, 'Mechfil 0.5" & 1.0" Filter', '', 2, 12, '40', 1, 0, 'Purchessed/Manufactured', 0, 0),
(882, 'Mechfil 0.5" & 1.0" Filter Element', '', 2, 32, '42', 1, 0, 'Purchessed/Manufactured', 0, 0),
(883, 'Mechfil 1.5" & 2.0" Filter', '', 2, 12, '40', 1, 0, 'Purchessed/Manufactured', 0, 0),
(884, 'Mechfil 1.5" & 2.0" Filter Element', '', 2, 32, '42', 1, 0, 'Purchessed/Manufactured', 0, 0),
(885, 'Mechfil 2.5" & 3.0" Filter', '', 2, 12, '40', 1, 0, 'Purchessed/Manufactured', 0, 0),
(886, 'Mechfil 2.5" & 3.0" Filter Element', '', 2, 32, '42', 1, 0, 'Purchessed/Manufactured', 0, 0),
(887, 'Mechfil 6.0" Filter', '', 2, 12, '40', 1, 0, 'Purchessed/Manufactured', 0, 0),
(888, 'Coupling Guard Mechfill', '', 5, 30, '38', 1, 0, 'Purchessed/Manufactured', 0, 0),
(889, 'Coupling Guard Antico', '', 5, 30, '38', 1, 0, 'Purchessed/Manufactured', 0, 0),
(890, '4" Cutting Wheel', '', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(891, '4" Grinding Wheel', '', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(892, 'Tape for Packing', '', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(893, 'Priming Chamber Antico', '', 6, 17, '15', 1, 0, 'Purchessed/Manufactured', 0, 0),
(894, '3" Channel', '3" Channel', 5, 30, '38', 5, 0, 'Purchessed', 0, 0),
(895, '4" Channel', '4" Channel', 5, 30, '38', 5, 0, 'Purchessed', 0, 0),
(896, 'Tools for Lathe Machine', '', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(897, 'Base Frame 3"', 'Base Frame 3"', 5, 30, '38', 1, 0, 'Purchessed/Manufactured', 0, 0),
(898, 'Base Frame 4"', '', 5, 30, '38', 1, 0, 'Purchessed/Manufactured', 0, 0),
(899, 'Cable 6 Core ( 3 *4mm and 3 * 1.5mm )', '', 6, 4, '53', 2, 0, 'Purchessed/Manufactured', 0, 0),
(900, 'NZ 25 125 Pump SO Impeller with Motor', '', 7, 27, '27', 3, 0, 'Purchessed/Manufactured', 0, 0),
(901, 'NZ 32 125 Pump SO Impeller with Motor', '', 7, 27, '27', 3, 0, 'Purchessed/Manufactured', 0, 0),
(902, 'NZ 50 125 Pump SO Impeller with Motor', '', 7, 27, '27', 3, 0, 'Purchessed/Manufactured', 0, 0),
(903, 'NZ 25 160 Pump SO Impeller with Motor', '', 7, 27, '27', 3, 0, 'Purchessed/Manufactured', 0, 0),
(904, 'NZ 32 160 Pump SO Impeller with Motor', '', 7, 27, '27', 3, 0, 'Purchessed/Manufactured', 0, 0),
(905, 'NZ 50 160 Pump SO Impeller with Motor', '', 7, 27, '27', 3, 0, 'Purchessed/Manufactured', 0, 0),
(906, 'NZ 25 160 Pump SO Impeller with Motor', '', 7, 27, '27', 3, 0, 'Purchessed/Manufactured', 0, 0),
(907, 'NZ 50 200 Pump SO Impeller with Motor', '', 7, 27, '27', 3, 0, 'Purchessed/Manufactured', 0, 0),
(908, 'NZ 25 125 Pump Closed Impeller with Motor', '', 7, 27, '27', 3, 0, 'Purchessed/Manufactured', 0, 0),
(909, 'NZ 32 125 Pump Closed Impeller with Motor', '', 7, 27, '27', 3, 0, 'Purchessed/Manufactured', 0, 0),
(910, 'NZ 50 125 Pump Closed Impeller with Motor', '', 7, 27, '27', 3, 0, 'Purchessed/Manufactured', 0, 0),
(911, 'NZ 25 160 Pump Closed Impeller with Motor', '', 7, 27, '27', 3, 0, 'Purchessed/Manufactured', 0, 0),
(912, 'NZ 32 160 Pump Closed Impeller with Motor', '', 7, 27, '27', 3, 0, 'Purchessed/Manufactured', 0, 0),
(913, 'NZ 50 160 Pump Closed Impeller with Motor', '', 7, 27, '27', 3, 0, 'Purchessed/Manufactured', 0, 0),
(914, 'NZ 25 160 Pump Closed Impeller with Motor', '', 7, 27, '27', 3, 0, 'Purchessed/Manufactured', 0, 0),
(915, 'NZ 50 200 Pump Closed Impeller with Motor', '', 7, 27, '27', 3, 0, 'Purchessed/Manufactured', 0, 0),
(916, 'Traneter Plate Type Heat Exchanger', '', 8, 33, '44', 1, 0, 'Purchessed', 0, 0),
(917, 'Mechfill Cooling Unit with Simplex Filter', '', 4, 34, '45', 3, 0, 'Purchessed/Manufactured', 0, 0),
(918, 'Mechfill Cooling Unit with Duplex Filter', '', 4, 34, '45', 3, 0, 'Purchessed/Manufactured', 0, 0),
(919, 'Mechfill Cooling Unit without Filter', '', 4, 34, '45', 3, 0, 'Purchessed/Manufactured', 0, 0),
(920, 'NSRP 50 Pump Closed Impeller with Motor', '', 7, 27, '46', 3, 0, 'Purchessed/Manufactured', 0, 0),
(921, 'RT 10 Pump with Motor', '', 7, 22, '22', 3, 0, 'Purchessed/Manufactured', 0, 0),
(922, 'RT 20 Pump with Motor', '', 7, 22, '22', 3, 0, 'Purchessed/Manufactured', 0, 0),
(923, 'RT 40 Pump with Motor', '', 7, 22, '22', 3, 0, 'Purchessed/Manufactured', 0, 0),
(924, 'RT 80 Pump with Motor', '', 7, 22, '22', 3, 0, 'Purchessed/Manufactured', 0, 0),
(925, 'RT 125 Pump with Motor', '', 7, 22, '22', 3, 0, 'Purchessed/Manufactured', 0, 0),
(926, 'WV 03 L/40', 'Waste Water Pump', 1, 4, '52', 1, 0, 'Purchessed', 0, 0),
(927, 'CCR 32 160  With Motor', 'CCR 32 160  With Motor', 7, 26, '28', 3, 0, 'Manufactured', 0, 0),
(928, 'CCR 65 125 With Motor', 'CCR 65 125 With Motor', 7, 26, '28', 3, 0, 'Manufactured', 0, 0),
(929, 'CN 100 400', 'CN 100 400', 1, 1, '1', 1, 0, 'Purchessed', 0, 0),
(930, 'CCR 40 160 With Motor', 'CCR 40 160 With Motor', 7, 26, '28', 3, 0, 'Manufactured', 0, 0),
(931, 'S 630', 'S 630', 1, 4, '52', 1, 0, 'Purchessed', 0, 0),
(932, 'CB 40C 160', 'CB 40C 160', 1, 1, '61', 1, 0, 'Purchessed', 0, 0),
(933, 'ED-03', 'ED-03', 1, 3, '24', 1, 0, 'Purchessed', 1, 1),
(934, 'LJ 10', 'LJ 10', 1, 4, '64', 1, 0, 'Purchessed', 0, 0),
(935, 'LJ 15', 'LJ 15', 1, 4, '64', 1, 0, 'Purchessed', 0, 0),
(936, 'NZ 25 160 Pump Semi Open Impeller With Motor', 'NZ 25 160 Pump Semi Open Impeller With Motor', 7, 27, '27', 3, 0, 'Manufactured', 0, 0),
(938, 'CN 40 160 With Motor', 'CN 40 160 With Motor', 7, 26, '62', 3, 0, 'Purchessed/Manufactured', 0, 0),
(940, 'T3 SFP 20/56 ', 'T3 SFP 20/56 ', 1, 2, '8', 1, 0, 'Purchessed', 0, 0),
(941, 'CCR 125 315  With Motor', 'CCR 125 315  With Motor', 7, 26, '28', 3, 0, 'Manufactured', 0, 0),
(942, 'Shaft For CN 80 200', 'Shaft For CN 80 200', 6, 16, '13', 1, 0, 'Purchessed/Manufactured', 0, 0),
(943, 'Bearing Housing CN 80 200', 'Bearing Housing CN 80 200', 6, 16, '13', 1, 0, 'Purchessed', 0, 0),
(944, 'Bronze Impeller CN 80 200', 'Bronze Impeller CN 80 200', 6, 16, '13', 1, 0, 'Purchessed', 0, 0),
(945, 'CI Impeller CN 100 315', 'CI Impeller CN 100 315', 6, 16, '13', 1, 0, 'Purchessed', 0, 0),
(946, 'M 3080', 'M 3080', 1, 4, '65', 1, 0, 'Purchessed', 0, 0),
(947, 'Cartridge Assembly T3 S 45', 'Cartridge Assembly T3 S 45', 6, 15, '17', 3, 0, 'Purchessed', 0, 0),
(948, 'Gasket  T3 S  45', 'Gasket  T3 S 45', 6, 15, '17', 3, 0, 'Purchessed', 0, 0),
(949, 'Bearing Housing KGEN 21 8 ', 'Bearing Housing KGEN 21 8 ', 6, 16, '11', 1, 0, 'Purchessed', 0, 0),
(950, 'CN 150 400 G1 S2 L3', 'CN Pump', 1, 1, '1', 1, 0, 'Purchessed', 0, 0),
(951, 'Impeller Cap Nut SS 316 (1820) CN 100 / 200-160, 80 To 200-200, 65 To 125-250, 40 To 100-315', 'Impeller Cap Nut (1820)', 6, 16, '13', 1, 0, 'Purchessed', 0, 0),
(952, 'Shaft Sleeve SS (S2) (1100) CN 100-160, 80 To 200-200, 65 To 125-250, 40 To 100-315', 'Shaft Sleeve (1100)', 6, 16, '13', 1, 0, 'Purchessed/Manufactured', 0, 0),
(953, 'Shaft Sleeve SS (S2) (1100) CCR 32 To 65-125, 32 To 50-160, 32 To 50-200', 'Shaft Sleeve SS S2 (1100) CCR', 6, 16, '25', 1, 0, 'Purchessed/Manufactured', 0, 0),
(954, 'CCR 25 125 R6 M2 L3', 'CCR 25 125 R6 M2 L3', 1, 1, '2', 1, 0, 'Purchessed', 0, 0),
(955, 'CCR 32 125 R6 M2 L3', 'CCR 32 125 R6 M2 L3', 1, 1, '2', 1, 0, 'Purchessed', 0, 0),
(956, 'Shaft Sleeve SS (M2) (1200) CCR 25-125,25-160', 'Shaft Sleeve M2', 6, 16, '25', 1, 0, 'Purchessed/Manufactured', 0, 0),
(957, 'Shaft Sleeve SS (M2) (1200) CCR 32 To 65-125,32 To 50-160,32 To 50-200', 'Shaft Sleeve M2', 6, 16, '25', 1, 0, 'Purchessed/Manufactured', 0, 0),
(958, 'WP 05D/35', 'WP 05D 35', 1, 4, '52', 1, 0, 'Purchessed', 0, 0),
(959, 'Shaft Sleeve SS (M2) (1200) CCR 32 To 80-250,40 To 50-315,65 To 80-160,65 To 100-200', 'Shaft Sleeve M2', 6, 16, '25', 1, 0, 'Purchessed/Manufactured', 0, 0),
(960, 'CCR 65 160 R6 M2 L3', 'CCR 65 160 R6 M2 L3', 1, 1, '2', 1, 0, 'Purchessed', 0, 0),
(961, 'CI Impeller CN 25 160', 'CI Impeller CN 25 160', 6, 16, '13', 1, 0, 'Purchessed', 0, 0),
(962, 'CCR 65C 160 R6 M2 L3', 'CCR 65C 160 R6 M2 L3', 1, 1, '2', 1, 0, 'Purchessed', 0, 0),
(963, 'SS Impeller CN 25 160 ', 'SS Impeller CN 25 160 ', 6, 16, '13', 1, 0, 'Purchessed', 0, 0),
(964, 'CCR 25 160 R6 M2 L3', 'CCR 25 160 R6 M2 L3', 1, 1, '2', 1, 0, 'Purchessed', 0, 0),
(965, 'CI Bearing Cover CN 25 160 ', 'CI Bearing Cover CN 25 160 ', 6, 16, '13', 1, 0, 'Purchessed', 0, 0),
(966, 'Pump Casing CN 25 160', 'Pump Casing CN 25 160', 6, 16, '13', 1, 0, 'Purchessed', 1, 1),
(967, 'Stuffing Box CN 25 160 ', 'Stuffing Box CN 25 160 ', 6, 16, '13', 1, 0, 'Purchessed', 1, 1),
(968, 'CCR 32C 125 R6 M2 L3', 'CCR 32C 125 R6 M2 L3', 1, 1, '2', 1, 0, 'Purchessed', 0, 0),
(969, 'CCR 32 160 R6 M2 L3', 'CCR 32 160 R6 M2 L3', 1, 1, '2', 1, 0, 'Purchessed', 0, 0),
(970, 'CCR 32 200 R6 M2 L3', 'CCR 32 200 R6 M2 L3', 1, 1, '2', 1, 0, 'Purchessed', 0, 0),
(971, 'DT 33', 'DT 33', 1, 4, '52', 1, 0, 'Purchessed', 0, 0),
(972, 'HD 2017 / SZ With Motor', 'HD 2017 / SZ With Motor', 7, 28, '66', 3, 0, 'Purchessed/Manufactured', 0, 0),
(973, 'CN 125 400 G1 S2 L3', 'CN 125 400 G1 S2 L3', 1, 1, '1', 1, 0, 'Purchessed', 0, 0),
(974, 'CN 125 400 With Motor', 'CN 125 400 With Motor', 7, 26, '62', 3, 0, 'Purchessed/Manufactured', 0, 0),
(975, 'CCR 25 125 With Motor', 'CCR 25 125 With Motor', 7, 26, '63', 3, 0, 'Purchessed/Manufactured', 0, 0),
(976, 'TGL 047 2 V', 'TGL 047 2 V', 1, 1, '67', 1, 0, 'Purchessed', 1, 1),
(977, 'Pump Casing WV 01 L/40', 'Pump Casing WV 01 L/40', 6, 18, '68', 1, 0, 'Purchessed', 0, 0),
(978, 'Stationary Part 1.375', 'Stationary Part 1.375 ', 6, 17, '16', 1, 0, 'Purchessed', 0, 0),
(979, 'Rotary Part 1.375', 'Rotay Part 1.375', 6, 17, '16', 1, 0, 'Purchessed', 0, 0),
(980, 'FRE 80 170 With Motor', 'FRE 80 170 With Motor', 7, 26, '69', 1, 0, 'Manufactured', 0, 0),
(981, 'CCR 40 250 With Motor', 'CCR 40 250 With Motor', 7, 26, '63', 1, 0, 'Manufactured', 0, 0),
(982, 'ED-01', 'ED-01', 1, 3, '24', 1, 0, 'Purchessed', 1, 1),
(983, 'Rotor Set R 50 SL', 'Rotor Set R 50 SL', 6, 15, '20', 5, 0, 'Purchessed', 0, 0),
(984, 'Shaft HE 120', 'Shaft HE 120', 6, 17, '33', 1, 0, 'Manufactured', 1, 1),
(985, 'Pump Casing KGEN 16 3', 'Pump Casing KGEN 16 3', 6, 16, '11', 1, 0, 'Purchessed', 0, 0),
(986, 'WW 201', 'WW 201', 1, 4, '52', 1, 0, 'Purchessed', 0, 0),
(987, 'CN 32 200 G1 S2 L3 With Motor', 'CN 32 200 G1 S2 L3 With Motor', 7, 26, '62', 3, 0, 'Manufactured', 0, 0),
(988, 'CBR 25 125 R4', 'CBR 25 125 R4', 1, 1, '61', 1, 0, 'Purchessed', 1, 1),
(989, 'MCH / MCV 14', 'MCH / MCV 14', 1, 1, '3', 1, 0, 'Purchessed', 1, 1),
(990, 'CCR 40 250 R6 S2 L3', 'CCR 40 250 R6A/R6  S2 L3', 1, 1, '2', 1, 0, 'Purchessed', 1, 1),
(991, 'CCR 40C 160 R6 S2 L3', 'CCR 40C 160 R6 S2 L3', 1, 1, '2', 1, 0, 'Purchessed', 1, 1),
(992, 'CCR 65 250 R1 S2 L3', 'CCR 65 250 R1 S2 L3', 1, 1, '2', 1, 0, 'Purchessed', 1, 1),
(993, 'CN 40 125 G1 S2 L3', 'CN 40 125 G1 S2 L3', 1, 1, '1', 1, 0, 'Purchessed', 1, 1),
(994, 'CN 40 200 G1 S2 L1', 'CN 40 200 G1 S2 L1', 1, 1, '1', 1, 0, 'Purchessed', 1, 1),
(995, 'CN 65 250 G1 S2 L3', 'CN 65 250 G1 S2 L3', 1, 1, '1', 1, 0, 'Purchessed', 1, 1),
(996, 'Sealing Ring (12) HD 2017', 'Sealing Ring (12) HD 2017', 6, 19, '70', 1, 0, 'Purchessed', 0, 0),
(997, 'Valve Cage (16) HD 2017', 'Valve Cage (16) HD 2017', 6, 19, '70', 1, 0, 'Purchessed', 0, 0),
(999, 'Liquid Head (1) HD 2017', 'Liquid Head (1) HD 2017', 6, 19, '70', 1, 0, 'Purchessed', 0, 0),
(1001, 'Hose Nipple (18) HD 2017', 'Hose Nipple (18) HD 2017', 6, 19, '70', 1, 0, 'Purchessed', 0, 0),
(1002, 'Plain Washer (33) HD 2017', 'Plain Washer (33) HD 2017', 6, 19, '70', 1, 0, 'Purchessed', 0, 0),
(1003, 'Allen Bolt (35) HD 2017', 'Allen Bolt (35) HD 2017', 6, 19, '70', 1, 0, 'Purchessed', 0, 0),
(1004, 'Circlip (36) HD 2017', 'Circlip (36) HD 2017', 6, 19, '70', 1, 0, 'Purchessed', 0, 0),
(1005, 'SL Guide (37) HD 2017', 'SL Guide (37) HD 2017', 6, 19, '70', 1, 0, 'Purchessed', 0, 0),
(1006, 'Allen Bolt (38) HD 2017', 'Allen Bolt (38) HD 2017', 6, 19, '70', 1, 0, 'Purchessed', 0, 0),
(1007, 'Circlip (42) HD 2017', 'Circlip (42) HD 2017', 6, 19, '70', 1, 0, 'Purchessed', 0, 0),
(1008, 'Nail 1"', 'Nail 1"', 5, 30, '38', 8, 0, 'Purchessed', 500, 1000),
(1009, 'Top Cover (44) HD 2017', 'Top Cover (44) HD 2017', 6, 19, '70', 1, 0, 'Purchessed', 0, 0),
(1010, 'SL Screw (45) HD 2017', 'SL Screw (45) HD 2017', 6, 19, '70', 1, 0, 'Purchessed', 0, 0),
(1011, 'SL Indicator (46) HD 2017', 'SL Indicator (46) HD 2017', 6, 19, '70', 1, 0, 'Purchessed', 0, 0),
(1012, 'Grubs Screw (49) HD 2017', 'Grubs Screw (49) HD 2017', 6, 19, '70', 1, 0, 'Purchessed', 0, 0),
(1013, 'Barrel (50) HD 2017', 'Barrel (50) HD 2017', 6, 19, '70', 1, 0, 'Purchessed', 0, 0),
(1014, 'Valve Seat (13) HD 2017', 'Valve Seat (13) HD 2017', 6, 19, '70', 1, 0, 'Purchessed', 0, 0),
(1015, 'GI Bolt 6 X 25 MM', 'GI Bolt 6 X 25 MM', 5, 30, '38', 1, 0, 'Purchessed', 20, 50),
(1016, 'GI Bolt 6 X35 MM', 'GI Bolt 6 X 35 MM', 5, 30, '38', 1, 0, 'Purchessed', 20, 50),
(1017, 'GI Bolt 8 X 25 MM', 'GI Bolt 8 X 25 MM', 5, 30, '38', 1, 0, 'Purchessed', 20, 50),
(1018, 'GI Bolt 8 X 35 MM', 'GI Bolt 8 X 35 MM', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(1019, 'GI Bolt 8 X 50 MM', 'GI Bolt 8 X 50 MM', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(1020, 'GI Bolt 10 X 25 MM', 'GI Bolt 10 X 25 MM', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(1021, 'GI Bolt 10 X 35 MM', 'GI Bolt 10 X 35 MM', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(1022, 'GI Bolt 10 X 50 MM', 'GI Bolt 10 X 50 MM', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(1023, 'GI Bolt 12 X 25 MM', 'GI Bolt 12 X 25 MM', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(1024, 'GI Bolt 12 X 35 MM', 'GI Bolt 12 X 35 MM', 5, 30, '43', 1, 0, '', 0, 0),
(1025, 'GI Bolt 12 X 50 MM', 'GI Bolt 12 X 50 MM', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(1026, 'GI Bolt 16 X 50 MM', 'GI Bolt 16 X 50 MM', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(1027, 'GI Bolt 16 X 75 MM', 'GI Bolt 16 X 75 MM', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(1028, 'GI Nut 6 MM', 'GI Nut 6 MM', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(1029, 'GI Nut 8 MM', 'GI Nut 8 MM', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(1030, 'GI Nut 10 MM', 'GI Nut 10 MM', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(1031, 'GI Nut 12 MM', 'GI Nut 12 MM', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(1032, 'GI Nut 16 MM', 'GI Nut 16 MM', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(1033, 'GI Washer 6 MM', 'GI Washer 6 MM', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(1034, 'GI Washer 8 MM', 'GI Washer 8 MM', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(1035, 'GI Washer 10 MM', 'GI Washer 10 MM', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(1036, 'GI Washer 12 MM', 'GI Washer 12 MM', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(1037, 'GI Washer 16 MM', 'GI Washer 16 MM', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(1038, 'Channel 3"', 'Channel 3"', 5, 30, '43', 6, 0, 'Purchessed', 0, 0),
(1039, 'Channel 4"', 'Channel 4"', 5, 30, '43', 6, 0, 'Purchessed', 0, 0),
(1040, 'Angle 1.5"', 'Angle 1.5"', 5, 30, '43', 6, 0, 'Purchessed', 0, 0),
(1041, 'MS Pattha 10 X 40 MM', 'MS Pattha 10 X 40 MM', 5, 30, '43', 6, 0, 'Purchessed', 0, 0),
(1042, 'Paint Colour OX Blue', 'Paint Colour OX Blue', 5, 30, '43', 4, 0, 'Purchessed', 0, 0),
(1043, 'Paint Colour Sky Blue', 'Paint Colour Sky Blue', 5, 30, '43', 4, 0, 'Purchessed', 0, 0),
(1044, 'Paint Colour Black', 'Paint Colour Black', 5, 30, '43', 4, 0, 'Purchessed', 0, 0),
(1045, 'Paint Red Oxide', 'Paint Red Oxide', 5, 30, '43', 4, 0, 'Purchessed', 0, 0),
(1046, 'Paint Thiner', 'Paint Thiner', 5, 30, '43', 4, 0, 'Purchessed', 0, 0),
(1047, 'Paint Brush 2"', 'Paint Brush 2"', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(1048, 'Name Plate STL', 'Name Plate STL', 5, 30, '43', 1, 0, 'Purchessed', 0, 0),
(1049, 'Coupling Guard Sheet', 'Coupling Guard Sheet', 5, 30, '38', 9, 0, 'Purchessed', 0, 0),
(1050, 'Base Frame Antico', 'Base Frame Antico', 5, 30, '38', 1, 0, 'Purchessed', 0, 0),
(1051, 'Bottom End Shield (02) 4DRR 40J / 32', 'Bottom End Shield (02) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1052, 'Top End Shield (03) 4DRR 40J / 32', 'Top End Shield (03) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1053, 'Suction Stand (04) 4DRR 40J / 32', 'Suction Stand (04) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1054, 'Casing Cover Plate (06) 4DRR 40J / 32', 'Casing Cover Plate (06) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1055, 'Spacer SS 410 4DRR 40J / 32', 'Spacer SS 410 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1056, 'Adjusting Plate (07) 4DRR 40J / 32', 'Adjusting Plate (07) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1057, 'HC Alloy Impeller (08) 4DRR 40J / 32', 'HC Alloy Impeller (08) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1058, 'Cable Gland (10) 4DRR 40J / 32', 'Cable Gland (10) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1059, 'Neckring For Impeller (11) 4DRR 40J / 32', 'Necking For Impeller (11) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1060, 'Bearing Cover (11A) 4DRR 40J / 32', 'Bearing Cover (11A) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1061, 'Rotor Fitted Shaft (12/22) 4DRR 40J / 32', 'Rotor Fitted Shaft (12/22) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1062, 'Spacer For Agitator (12A) 4DRR 40J / 32', 'Spacer For Agitator (12A) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1063, 'Key For Impeller & Agitator (13) 4DRR 40J / 32', 'Key For Impeller & Agitator (13) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1064, 'Mechanical Seal  (14) 4DRR 40J / 32', 'Mechanical Seal  (14) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1065, 'Mechanical Seal Motor (15) 4DRR 40J / 32', 'Mechanical Seal Motor (15) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1066, 'Lock Nut For Agitator (18) 4DRR 40J / 32', 'Lock Nut For Agitator (18) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1067, 'Thermostat 80 Deg.  C (23A) 4DRR 40J / 32', 'Thermostat 80 Deg.  C (23A) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1068, 'Rubber Grommet (24 & 24A) 4DRR 40J / 32', 'Rubber Grommet (24 & 24A) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1069, 'Gasket & O Ring Set (41,26,27) 4DRR 40J / 32', 'Gasket & O Ring Set (41,26,27) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1070, 'Probe For Moisture Sensor (27A) 4DRR 40J / 32', 'Probe For Moisture Sensor (27A) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1071, 'Oil Plug (28) 4DRR 40J / 32', 'Oil Plug (28) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1072, 'Eye Bolt (31) 4DRR 40J / 32', 'Eye Bolt (31) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1073, 'Agitator (40) 4DRR 40J / 32', 'Agitator (40) 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1074, 'Control Panel 4DRR 40J / 32', 'Control Panel 4DRR 40J / 32', 6, 18, '73', 1, 0, 'Purchessed', 0, 0),
(1075, 'CT 50C 160 NG1 M5 L1', 'CT 50C 160 NG1 M5 L1', 1, 1, '74', 1, 0, 'Purchessed', 0, 0),
(1076, 'Bearing 6306 CCR 50 160', 'Bearing 6306 CCR 50 160', 6, 16, '25', 1, 0, 'Purchessed', 1, 1),
(1077, 'Bearing Bush CCR 50C 160', 'Bearing Bush CCR 50C 160', 6, 16, '25', 1, 0, 'Purchessed', 0, 0),
(1078, 'Bearing Cover CCR 50C 160', 'Bearing Cover CCR 50C 160', 6, 16, '25', 1, 0, 'Purchessed', 1, -1),
(1079, 'Bearing Cover CN 100 160 L1', 'Bearing Cover CN 100 160 L1', 6, 16, '13', 1, 0, 'Purchessed', 1, 1),
(1080, 'Bearing Cover For EXP 160CT', 'Bearing Cover For EXP 160CT', 6, 16, '75', 1, 0, 'Purchessed', 1, 1),
(1081, 'Bearing Lock Nut CCR 50C 160', 'Bearing Lock Nut CCR 50C 160', 6, 16, '25', 1, 0, 'Purchessed', 1, 1),
(1082, 'Bush For Gland CCR 50 160', 'Bush For Gland CCR 50 160', 6, 16, '25', 1, 0, 'Purchessed', 1, 1),
(1083, 'Bush For Gland CN 100 400', 'Bush For Gland CN 100 400', 6, 16, '13', 1, 0, 'Purchessed', 1, 1),
(1084, 'CT 50C 160 With Motor', 'CT 50C 160 With Motor', 7, 26, '76', 1, 0, 'Manufactured', 0, 0),
(1085, 'Casing Bolt CCR 50C 160', 'Casing Bolt CCR 50C 160', 6, 16, '25', 1, 0, 'Purchessed', 1, 1),
(1087, 'Diffuser For J52', 'Diffuser For J52', 6, 18, '68', 1, 0, 'Purchessed', 1, 1),
(1088, 'Gasket For TGH 58 80 (PN 0220)', 'Gasket For TGH 58 80 (PN 0220)', 6, 16, '77', 1, 0, 'Purchessed', 1, 1),
(1089, 'Gland Packing CCR 50C 160', 'Gland Packing CCR 50C 160', 6, 16, '25', 1, 0, 'Purchessed', 1, 1),
(1090, 'Grub Screw For TGH 58 80 (PN 0603)', 'Grub Screw For TGH 58 80 (PN 0603)', 6, 16, '77', 1, 0, 'Purchessed', 1, 1),
(1091, 'Grub Screw For TGH 58 80 (PN 703)', 'Grub Screw For TGH 58 80 (PN 703)', 6, 16, '77', 1, 0, 'Purchessed', 1, 1),
(1092, 'Cabin Fan 150-4-DC- 12 Volt', 'Cabin Fan 150-4-DC- 12 Volt', 6, 37, '79', 1, 0, 'Purchessed', 0, 0),
(1093, 'Idler Bush For TGH 58 80', 'Idler Bush For TGH 58 80', 6, 16, '77', 1, 0, 'Purchessed', 1, 1),
(1094, 'Idler For TGH 58 80', 'Idler For TGH 58 80', 6, 16, '77', 1, 0, 'Purchessed', 1, 1),
(1095, 'Impeller CB 200 200 ', 'Impeller CB 200 200 ', 6, 16, '80', 1, 0, 'Purchessed', 1, 1),
(1096, 'PL 2017 Pump', 'PL 2017 Pump', 1, 3, '48', 1, 0, 'Purchessed', 0, 0),
(1097, 'PL 1011 Pump', 'PL 1011 Pump', 1, 3, '48', 1, 0, 'Purchessed', 0, 0),
(1098, 'Impeller CB 65C 200', 'Impeller CB 65C 200', 6, 16, '80', 1, 0, 'Purchessed', 1, 1),
(1099, 'NRV Ball (15) PL 2017', 'NRV Ball (15) PL 2017', 6, 19, '81', 1, 0, 'Purchessed', 0, 0),
(1100, 'NRV Ball PL 1011', 'NRV Ball PL 1011', 6, 19, '82', 1, 0, 'Purchessed', 0, 0),
(1101, 'Eccentric (30) PL 2017', 'Eccentric (30) PL 2017', 6, 19, '81', 1, 0, 'Purchessed', 0, 0),
(1102, 'Gasket Set (60,66,69) PL 2017', 'Gasket Set (60,66,69) PL 2017', 6, 19, '81', 3, 0, 'Purchessed', 0, 0),
(1103, 'Spring Dowel Pin (54) PL 2017', 'Spring Dowel Pin (54) PL 2017', 6, 19, '81', 3, 0, 'Purchessed', 0, 0),
(1104, 'Sealing Ring (14) PL 2017', 'Sealing Ring (14) PL 2017', 6, 19, '81', 1, 0, 'Purchessed', 0, 0),
(1105, 'Sealing Ring (12) PL 2017', 'Sealing Ring (12) PL 2017', 6, 19, '81', 1, 0, 'Purchessed', 0, 0),
(1106, 'Sealing Ring (17) PL 2017', 'Sealing Ring (17) PL 2017', 6, 19, '81', 1, 0, 'Purchessed', 0, 0),
(1107, 'Plunger Ring (2) PL 2017', 'Plunger Ring (2) PL 2017', 6, 19, '81', 1, 0, 'Purchessed', 0, 0),
(1108, 'Plunger Ring (4) PL 2017', 'Plunger Ring (4) PL 2017', 6, 19, '81', 1, 0, 'Purchessed', 0, 0),
(1109, 'Worm Shaft (67) PL 2017', 'Worm Shaft (67) PL 2017', 6, 19, '81', 1, 0, 'Purchessed', 0, 0),
(1110, 'Valve Seat (13) PL 2017', 'Valve Seat (13) PL 2017', 6, 19, '81', 3, 0, 'Purchessed', 0, 0),
(1111, 'Worm Wheel (56) PL 2017', 'Worm Wheel (56) PL 2017', 6, 19, '81', 1, 0, 'Purchessed', 0, 0),
(1112, 'CCR 25 160 With Motor ', 'CCR 25 160 With Motor ', 7, 26, '28', 3, 0, 'Manufactured', 0, 0),
(1113, 'Plunger (6) PL 2017', 'Plunger (6) PL 2017', 6, 19, '81', 1, 0, 'Purchessed', 0, 0),
(1114, 'Impeller For J52', 'Impeller For J52', 6, 18, '83', 1, 0, 'Purchessed', 1, 1),
(1115, 'Shaft Key CCR 50C 160', 'Shaft Key CCR 50C 160', 6, 16, '25', 1, 0, 'Purchessed', 1, 1),
(1116, 'Impeller SS CCR 40 200 R6A ', 'Impeller SS CCR 40 200 R6A ', 6, 16, '25', 1, 0, 'Purchessed', 1, 1),
(1117, 'Impeller SS CCR 50 160', 'Impeller SS CCR 50 160', 6, 16, '25', 1, 0, 'Purchessed', 1, 1),
(1118, 'Impeller SS CCR  50C 160', 'Impeller SS CCR  50C 160', 6, 16, '25', 1, 0, 'Purchessed', 1, 1),
(1119, 'Impeller SS KGEN 11 3', 'Impeller SS KGEN 11 3', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(1120, 'Impeller SS KGEN 12 5', 'Impeller SS KGEN 12 5', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(1121, 'Impeller SS KGEN 12 6', 'Impeller SS KGEN 12 6', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(1122, 'Impeller SS KGEN 12B 5', 'Impeller SS KGEN 12B 5', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(1123, 'Impeller SS KGEN 14 8', 'Impeller SS KGEN 14 8', 6, 16, '11', 1, 0, 'Purchessed', -1, 1),
(1124, 'Impeller SS KGEN 15 6 ', 'Impeller SS KGEN 15 6 ', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(1125, 'Impeller SS KGEN 16 6 ', 'Impeller SS KGEN 16 6 ', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(1126, 'Lantern Piece CB 32 200 ', 'Lantern Piece CB 32 200 ', 6, 16, '80', 1, 0, 'Purchessed', 1, 1),
(1127, 'Leg Guard With Bolt & Washer CCR 50 160', 'Leg Guard With Bolt & Washer CCR 50 160', 6, 16, '25', 1, 0, 'Purchessed/Manufactured', 1, 1),
(1128, 'Mechanical Seal CCR 25 125 ', 'Mechanical Seal CCR 25 125 ', 6, 16, '25', 1, 0, 'Purchessed', 1, 1),
(1129, 'Nilos Ring KGEN  12 5 To 16 6', 'Nilos Ring KGEN  12 5 To 16 6', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(1130, 'Oil Catcher (Baffle) CCR 50 160 R6 S2 L3(2120) ', 'Oil Catcher (Baffle) CCR 50 160 R6 S2 L3(2120) ', 6, 16, '25', 1, 0, 'Purchessed/Manufactured', 1, 1),
(1131, 'Oil Levellor Antico ', 'Oil Leveller Antico ', 6, 17, '16', 1, 0, 'Purchessed', 1, 1);
INSERT INTO `items` (`id`, `name`, `alias`, `item_category_id`, `item_group_id`, `item_sub_group_id`, `unit_id`, `freeze`, `source`, `minimum_quantity`, `maximum_quantity`) VALUES
(1132, 'Pump Casing CCR 50 200', 'Pump Casing CCR 50 200', 6, 16, '25', 1, 0, 'Purchessed', 1, 1),
(1133, 'Rotor For TGH 58 80', 'Rotor For TGH 58 80', 6, 16, '77', 1, 0, 'Purchessed', 1, 1),
(1134, 'Rotor/ Gasket TIGGM Pump', 'Rotor/Gasket TIGGM Pump', 6, 15, '20', 3, 0, 'Purchessed', 1, 1),
(1135, 'Shaft For TGH  58 80', 'Shaft For TGH  58 80', 6, 16, '77', 1, 0, 'Purchessed/Manufactured', 1, 1),
(1136, 'Shaft For TGH  58 80', 'Shaft For TGH  58 80', 6, 16, '77', 1, 0, 'Purchessed/Manufactured', 1, 1),
(1137, 'Shaft Sleeve CCR 50 200', 'Shaft Sleeve CCR 50 200', 6, 16, '25', 1, 0, 'Purchessed/Manufactured', 1, 1),
(1138, 'Star Washer CCR 50C 160', 'Star Washer CCR 50C 160', 6, 16, '25', 1, 0, 'Purchessed', 1, 1),
(1139, 'Suffing Box CCR 50C 160', 'Suffing Box CCR 50C 160', 6, 16, '25', 1, 0, 'Purchessed', 1, 1),
(1140, 'Wear Ring CCR 32 160', 'Wear Ring CCR 32 160', 6, 16, '25', 1, 0, 'Purchessed', 1, 1),
(1141, 'Window Cover KGEN 11 3', 'Window Cover KGEN 11 3', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(1142, 'Shaft HE 100 CT', 'Shaft HE 100 CT', 6, 17, '33', 1, 0, 'Assembled', 0, 0),
(1143, 'HPG 3E Pump', 'HPG 3E Pump', 1, 2, '7', 1, 0, 'Purchessed', 0, 0),
(1144, '10 HP/ 1500 RPM Siemens', '10 HP/ 1500 RPM Siemens', 3, 13, '86', 1, 0, 'Purchessed', 0, 0),
(1145, '7.5 HP / 3000 RPM REMI', '7.5 HP / 3000 RPM REMI', 3, 8, '5', 1, 0, 'Purchessed', 0, 0),
(1146, '5 HP / 3000 RPM BBL ', '5 HP / 3000 RPM BBL ', 3, 7, '6', 1, 0, 'Purchessed', 0, 0),
(1147, '5 HP/ 3000 RPM BBL', '5 HP/ 3000 RPM BBL', 3, 7, '87', 5, 0, 'Purchessed', 0, 0),
(1148, 'RT 10 Gear Pump', 'RT 10 Gear Pump', 1, 2, '7', 1, 0, 'Purchessed', 1, 1),
(1149, 'RT 10 F', 'RT 10 F', 1, 2, '7', 1, 0, 'Purchessed', 1, 1),
(1150, 'Wear Plate KGEN 21 8', 'Wear Plate KGEN 21 8', 6, 16, '11', 1, 0, 'Purchessed', 1, 1),
(1151, '1 HP/1500 RPM CGL ', '1 HP/1500 RPM CGL ', 3, 35, '58', 1, 0, 'Purchessed', 1, 1),
(1152, 'SS 316 ROD (OD-32 Mm) ', 'SS 316 ROD (OD-32 Mm) ', 5, 30, '38', 10, 0, 'Purchessed', 0, 0),
(1153, 'Coupling Guard Johnson ', 'Coupling Guard Johnson', 5, 30, '38', 1, 0, 'Purchessed', 0, 0),
(1155, 'T3 S 20 Pump', 'T3 S 20 Pump', 1, 2, '8', 1, 0, 'Purchessed', 0, 0),
(1156, 'TUFP 088', 'TUFP 088', 1, 2, '9', 1, 0, 'Purchessed', 0, 0),
(1157, 'Mechanical Seal  CB 200 200', 'Mechanical Seal  CB 200 200', 6, 16, '80', 1, 0, 'Purchessed', 0, 0),
(1158, 'AFP 050', 'AFP 050', 5, 30, '38', 1, 0, 'Purchessed', 1, 1),
(1159, 'CCR 50 200 With Motor', 'CCR 50 200 With Motor', 7, 26, '28', 3, 0, 'Purchessed/Manufactured', 0, 0),
(1160, 'Back Plate EXP 160 CT', 'Back Plate EXP 160 CT', 6, 17, '16', 1, 0, 'Purchessed', 1, 1),
(1161, 'Bearing ', 'Bearing ', 5, 30, '38', 1, 0, 'Purchessed', 1, 1),
(1162, 'Adapter Flange HE 120/HE 130 CT', 'Adapter Flange HE 120/HE 130 CT', 6, 17, '33', 1, 0, 'Purchessed', 1, 1),
(1163, 'Casing Plug CCR 50C 160', 'Casing Plug CCR 50C 160', 6, 16, '25', 1, 0, 'Purchessed', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE `item_categories` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `item_companies` (
  `item_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `serial_number_enable` tinyint(1) NOT NULL,
  `dynamic_cost` decimal(18,5) NOT NULL,
  `minimum_selling_price_factor` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_companies`
--

INSERT INTO `item_companies` (`item_id`, `company_id`, `serial_number_enable`, `dynamic_cost`, `minimum_selling_price_factor`) VALUES
(556, 25, 1, '57.50000', '1.15'),
(556, 26, 1, '44.56000', '1.25'),
(556, 27, 0, '0.00000', '0.00'),
(557, 25, 1, '0.00000', '0.00'),
(557, 27, 0, '0.00000', '0.00'),
(558, 25, 0, '0.00000', '0.00'),
(558, 27, 0, '0.00000', '0.00'),
(559, 25, 0, '0.00000', '0.00'),
(559, 27, 0, '0.00000', '0.00'),
(560, 25, 0, '0.00000', '0.00'),
(560, 27, 0, '0.00000', '0.00'),
(561, 25, 0, '0.00000', '0.00'),
(561, 27, 0, '0.00000', '0.00'),
(562, 25, 0, '0.00000', '0.00'),
(562, 27, 0, '0.00000', '0.00'),
(563, 25, 0, '0.00000', '0.00'),
(563, 27, 0, '0.00000', '0.00'),
(564, 25, 0, '0.00000', '0.00'),
(564, 27, 0, '0.00000', '0.00'),
(565, 25, 0, '0.00000', '0.00'),
(565, 27, 0, '0.00000', '0.00'),
(566, 25, 0, '0.00000', '0.00'),
(566, 27, 0, '0.00000', '0.00'),
(567, 25, 0, '0.00000', '0.00'),
(567, 27, 0, '0.00000', '0.00'),
(568, 25, 0, '0.00000', '0.00'),
(568, 27, 0, '0.00000', '0.00'),
(569, 25, 0, '0.00000', '0.00'),
(569, 27, 0, '0.00000', '0.00'),
(570, 25, 0, '0.00000', '0.00'),
(570, 27, 0, '0.00000', '0.00'),
(572, 25, 0, '0.00000', '0.00'),
(572, 27, 0, '0.00000', '0.00'),
(573, 25, 0, '0.00000', '0.00'),
(573, 27, 0, '0.00000', '0.00'),
(574, 25, 0, '0.00000', '0.00'),
(574, 27, 0, '0.00000', '0.00'),
(575, 25, 0, '0.00000', '0.00'),
(575, 27, 0, '0.00000', '0.00'),
(576, 25, 0, '0.00000', '0.00'),
(576, 27, 0, '0.00000', '0.00'),
(577, 25, 0, '0.00000', '0.00'),
(577, 27, 0, '0.00000', '0.00'),
(578, 25, 0, '0.00000', '0.00'),
(578, 27, 0, '0.00000', '0.00'),
(579, 25, 1, '0.00000', '0.00'),
(579, 27, 0, '0.00000', '0.00'),
(580, 25, 0, '0.00000', '0.00'),
(580, 27, 0, '0.00000', '0.00'),
(581, 25, 0, '0.00000', '0.00'),
(581, 27, 0, '0.00000', '0.00'),
(582, 25, 0, '0.00000', '0.00'),
(582, 27, 0, '0.00000', '0.00'),
(583, 25, 0, '0.00000', '0.00'),
(583, 27, 0, '0.00000', '0.00'),
(584, 25, 0, '0.00000', '0.00'),
(584, 27, 0, '0.00000', '0.00'),
(585, 25, 0, '0.00000', '0.00'),
(585, 27, 0, '0.00000', '0.00'),
(586, 25, 0, '0.00000', '0.00'),
(586, 27, 0, '0.00000', '0.00'),
(587, 25, 0, '0.00000', '0.00'),
(587, 27, 0, '0.00000', '0.00'),
(588, 25, 0, '0.00000', '0.00'),
(588, 27, 0, '0.00000', '0.00'),
(589, 25, 0, '0.00000', '0.00'),
(589, 27, 0, '0.00000', '0.00'),
(590, 25, 0, '0.00000', '0.00'),
(590, 27, 0, '0.00000', '0.00'),
(591, 25, 0, '0.00000', '0.00'),
(591, 27, 0, '0.00000', '0.00'),
(592, 25, 0, '0.00000', '0.00'),
(592, 27, 0, '0.00000', '0.00'),
(593, 25, 0, '0.00000', '0.00'),
(593, 27, 0, '0.00000', '0.00'),
(594, 25, 0, '0.00000', '0.00'),
(594, 27, 0, '0.00000', '0.00'),
(595, 25, 0, '0.00000', '0.00'),
(595, 27, 0, '0.00000', '0.00'),
(596, 25, 0, '0.00000', '0.00'),
(596, 27, 0, '0.00000', '0.00'),
(597, 25, 0, '0.00000', '0.00'),
(597, 27, 0, '0.00000', '0.00'),
(598, 25, 0, '0.00000', '0.00'),
(598, 27, 0, '0.00000', '0.00'),
(599, 25, 0, '0.00000', '0.00'),
(599, 27, 0, '0.00000', '0.00'),
(600, 25, 0, '0.00000', '0.00'),
(600, 27, 0, '0.00000', '0.00'),
(601, 25, 0, '0.00000', '0.00'),
(601, 27, 0, '0.00000', '0.00'),
(602, 25, 0, '0.00000', '0.00'),
(602, 27, 0, '0.00000', '0.00'),
(603, 25, 0, '100.00000', '1.20'),
(603, 27, 0, '0.00000', '0.00'),
(604, 25, 0, '0.00000', '0.00'),
(604, 27, 0, '0.00000', '0.00'),
(605, 25, 0, '0.00000', '0.00'),
(605, 27, 0, '0.00000', '0.00'),
(606, 25, 0, '0.00000', '0.00'),
(606, 27, 0, '0.00000', '0.00'),
(607, 25, 0, '0.00000', '0.00'),
(607, 27, 0, '0.00000', '0.00'),
(608, 25, 0, '0.00000', '0.00'),
(608, 27, 0, '0.00000', '0.00'),
(609, 25, 0, '0.00000', '0.00'),
(609, 27, 0, '0.00000', '0.00'),
(610, 25, 0, '0.00000', '0.00'),
(610, 27, 0, '0.00000', '0.00'),
(611, 25, 0, '0.00000', '0.00'),
(611, 27, 0, '0.00000', '0.00'),
(612, 25, 0, '0.00000', '0.00'),
(612, 27, 0, '0.00000', '0.00'),
(613, 25, 0, '0.00000', '0.00'),
(613, 27, 0, '0.00000', '0.00'),
(614, 25, 0, '0.00000', '0.00'),
(614, 27, 0, '0.00000', '0.00'),
(615, 25, 0, '0.00000', '0.00'),
(615, 27, 0, '0.00000', '0.00'),
(616, 25, 0, '0.00000', '0.00'),
(616, 27, 0, '0.00000', '0.00'),
(617, 25, 0, '0.00000', '0.00'),
(617, 27, 0, '0.00000', '0.00'),
(618, 25, 0, '0.00000', '0.00'),
(618, 27, 0, '0.00000', '0.00'),
(619, 25, 0, '0.00000', '0.00'),
(619, 27, 0, '0.00000', '0.00'),
(620, 25, 0, '0.00000', '0.00'),
(621, 25, 0, '0.00000', '0.00'),
(621, 27, 0, '0.00000', '0.00'),
(622, 25, 0, '0.00000', '0.00'),
(622, 27, 0, '0.00000', '0.00'),
(623, 25, 0, '0.00000', '0.00'),
(623, 27, 0, '0.00000', '0.00'),
(624, 25, 0, '0.00000', '0.00'),
(624, 27, 0, '0.00000', '0.00'),
(625, 25, 0, '0.00000', '0.00'),
(625, 27, 0, '0.00000', '0.00'),
(626, 25, 0, '0.00000', '0.00'),
(626, 27, 0, '0.00000', '0.00'),
(627, 25, 0, '0.00000', '0.00'),
(627, 27, 0, '0.00000', '0.00'),
(628, 25, 0, '0.00000', '0.00'),
(628, 27, 0, '0.00000', '0.00'),
(629, 25, 0, '0.00000', '0.00'),
(629, 27, 0, '0.00000', '0.00'),
(630, 25, 0, '0.00000', '0.00'),
(630, 27, 0, '0.00000', '0.00'),
(631, 25, 0, '0.00000', '0.00'),
(631, 27, 0, '0.00000', '0.00'),
(632, 25, 0, '0.00000', '0.00'),
(632, 27, 0, '0.00000', '0.00'),
(633, 25, 0, '0.00000', '0.00'),
(633, 27, 0, '0.00000', '0.00'),
(634, 25, 0, '0.00000', '0.00'),
(634, 27, 0, '0.00000', '0.00'),
(635, 25, 0, '0.00000', '0.00'),
(635, 27, 0, '0.00000', '0.00'),
(636, 25, 0, '0.00000', '0.00'),
(636, 27, 0, '0.00000', '0.00'),
(637, 25, 0, '0.00000', '0.00'),
(637, 27, 0, '0.00000', '0.00'),
(638, 25, 0, '0.00000', '0.00'),
(638, 27, 0, '0.00000', '0.00'),
(639, 25, 0, '0.00000', '0.00'),
(639, 27, 0, '0.00000', '0.00'),
(640, 25, 0, '0.00000', '0.00'),
(640, 27, 0, '0.00000', '0.00'),
(641, 25, 0, '0.00000', '0.00'),
(641, 27, 0, '0.00000', '0.00'),
(642, 25, 0, '0.00000', '0.00'),
(642, 27, 0, '0.00000', '0.00'),
(643, 25, 0, '0.00000', '0.00'),
(643, 27, 0, '0.00000', '0.00'),
(644, 25, 0, '0.00000', '0.00'),
(644, 27, 0, '0.00000', '0.00'),
(645, 25, 0, '0.00000', '0.00'),
(645, 27, 0, '0.00000', '0.00'),
(646, 25, 0, '0.00000', '0.00'),
(646, 27, 0, '0.00000', '0.00'),
(647, 25, 0, '0.00000', '0.00'),
(647, 27, 0, '0.00000', '0.00'),
(648, 25, 0, '0.00000', '0.00'),
(648, 27, 0, '0.00000', '0.00'),
(649, 25, 0, '0.00000', '0.00'),
(649, 27, 0, '0.00000', '0.00'),
(650, 25, 0, '0.00000', '0.00'),
(650, 27, 0, '0.00000', '0.00'),
(651, 25, 0, '0.00000', '0.00'),
(651, 27, 0, '0.00000', '0.00'),
(652, 25, 0, '0.00000', '0.00'),
(652, 27, 0, '0.00000', '0.00'),
(653, 25, 0, '0.00000', '0.00'),
(653, 27, 0, '0.00000', '0.00'),
(654, 25, 0, '0.00000', '0.00'),
(654, 27, 0, '0.00000', '0.00'),
(655, 25, 0, '0.00000', '0.00'),
(655, 27, 0, '0.00000', '0.00'),
(656, 25, 0, '0.00000', '0.00'),
(656, 27, 0, '0.00000', '0.00'),
(657, 25, 0, '0.00000', '0.00'),
(657, 27, 0, '0.00000', '0.00'),
(658, 25, 0, '0.00000', '0.00'),
(658, 27, 0, '0.00000', '0.00'),
(659, 25, 0, '0.00000', '0.00'),
(659, 27, 0, '0.00000', '0.00'),
(660, 25, 0, '0.00000', '0.00'),
(660, 27, 0, '0.00000', '0.00'),
(661, 25, 0, '0.00000', '0.00'),
(661, 27, 0, '0.00000', '0.00'),
(663, 25, 0, '0.00000', '0.00'),
(663, 27, 0, '0.00000', '0.00'),
(664, 25, 0, '0.00000', '0.00'),
(664, 27, 0, '0.00000', '0.00'),
(665, 25, 0, '0.00000', '0.00'),
(665, 27, 0, '0.00000', '0.00'),
(666, 25, 0, '0.00000', '0.00'),
(666, 27, 0, '0.00000', '0.00'),
(667, 25, 0, '0.00000', '0.00'),
(667, 27, 0, '0.00000', '0.00'),
(668, 25, 0, '0.00000', '0.00'),
(668, 27, 0, '0.00000', '0.00'),
(669, 25, 0, '0.00000', '0.00'),
(669, 27, 0, '0.00000', '0.00'),
(670, 25, 0, '0.00000', '0.00'),
(670, 27, 0, '0.00000', '0.00'),
(671, 25, 0, '0.00000', '0.00'),
(671, 27, 0, '0.00000', '0.00'),
(672, 25, 0, '0.00000', '0.00'),
(672, 27, 0, '0.00000', '0.00'),
(673, 25, 0, '0.00000', '0.00'),
(673, 27, 0, '0.00000', '0.00'),
(674, 25, 0, '0.00000', '0.00'),
(674, 27, 0, '0.00000', '0.00'),
(675, 25, 0, '0.00000', '0.00'),
(675, 27, 0, '0.00000', '0.00'),
(676, 25, 0, '0.00000', '0.00'),
(676, 27, 0, '0.00000', '0.00'),
(677, 25, 0, '0.00000', '0.00'),
(677, 27, 0, '0.00000', '0.00'),
(678, 25, 0, '0.00000', '0.00'),
(678, 27, 0, '0.00000', '0.00'),
(679, 25, 0, '0.00000', '0.00'),
(679, 27, 0, '0.00000', '0.00'),
(680, 25, 0, '0.00000', '0.00'),
(680, 27, 0, '0.00000', '0.00'),
(681, 25, 0, '0.00000', '0.00'),
(681, 27, 0, '0.00000', '0.00'),
(682, 25, 0, '0.00000', '0.00'),
(682, 27, 0, '0.00000', '0.00'),
(683, 25, 0, '0.00000', '0.00'),
(683, 27, 0, '0.00000', '0.00'),
(684, 25, 0, '0.00000', '0.00'),
(684, 27, 0, '0.00000', '0.00'),
(685, 25, 0, '0.00000', '0.00'),
(685, 27, 0, '0.00000', '0.00'),
(686, 25, 0, '0.00000', '0.00'),
(686, 27, 0, '0.00000', '0.00'),
(687, 25, 0, '0.00000', '0.00'),
(687, 27, 0, '0.00000', '0.00'),
(688, 25, 0, '0.00000', '0.00'),
(688, 27, 0, '0.00000', '0.00'),
(689, 25, 0, '0.00000', '0.00'),
(689, 27, 0, '0.00000', '0.00'),
(690, 25, 0, '0.00000', '0.00'),
(690, 27, 0, '0.00000', '0.00'),
(691, 25, 0, '0.00000', '0.00'),
(691, 27, 0, '0.00000', '0.00'),
(692, 25, 0, '0.00000', '0.00'),
(692, 27, 0, '0.00000', '0.00'),
(693, 25, 0, '0.00000', '0.00'),
(693, 27, 0, '0.00000', '0.00'),
(694, 25, 0, '0.00000', '0.00'),
(694, 27, 0, '0.00000', '0.00'),
(695, 25, 0, '0.00000', '0.00'),
(695, 27, 0, '0.00000', '0.00'),
(696, 25, 0, '0.00000', '0.00'),
(696, 27, 0, '0.00000', '0.00'),
(697, 25, 0, '0.00000', '0.00'),
(697, 27, 0, '0.00000', '0.00'),
(698, 25, 0, '0.00000', '0.00'),
(698, 27, 0, '0.00000', '0.00'),
(699, 25, 0, '0.00000', '0.00'),
(699, 27, 0, '0.00000', '0.00'),
(700, 25, 0, '0.00000', '0.00'),
(700, 27, 0, '0.00000', '0.00'),
(701, 25, 0, '0.00000', '0.00'),
(701, 27, 0, '0.00000', '0.00'),
(702, 25, 0, '0.00000', '0.00'),
(702, 27, 0, '0.00000', '0.00'),
(703, 25, 0, '0.00000', '0.00'),
(703, 27, 0, '0.00000', '0.00'),
(704, 25, 0, '0.00000', '0.00'),
(704, 27, 0, '0.00000', '0.00'),
(705, 25, 0, '0.00000', '0.00'),
(705, 27, 0, '0.00000', '0.00'),
(706, 25, 0, '0.00000', '0.00'),
(706, 27, 0, '0.00000', '0.00'),
(707, 25, 0, '0.00000', '0.00'),
(707, 27, 0, '0.00000', '0.00'),
(708, 25, 0, '0.00000', '0.00'),
(708, 27, 0, '0.00000', '0.00'),
(709, 25, 0, '0.00000', '0.00'),
(709, 27, 0, '0.00000', '0.00'),
(710, 25, 0, '0.00000', '0.00'),
(710, 27, 0, '0.00000', '0.00'),
(711, 25, 0, '0.00000', '0.00'),
(711, 27, 0, '0.00000', '0.00'),
(712, 25, 0, '0.00000', '0.00'),
(712, 27, 0, '0.00000', '0.00'),
(713, 25, 0, '0.00000', '0.00'),
(713, 27, 0, '0.00000', '0.00'),
(714, 25, 0, '0.00000', '0.00'),
(714, 27, 0, '0.00000', '0.00'),
(715, 25, 0, '0.00000', '0.00'),
(715, 27, 0, '0.00000', '0.00'),
(716, 25, 0, '0.00000', '0.00'),
(716, 27, 0, '0.00000', '0.00'),
(717, 25, 0, '0.00000', '0.00'),
(717, 27, 0, '0.00000', '0.00'),
(718, 25, 0, '0.00000', '0.00'),
(718, 27, 0, '0.00000', '0.00'),
(719, 25, 0, '0.00000', '0.00'),
(719, 27, 0, '0.00000', '0.00'),
(720, 25, 0, '0.00000', '0.00'),
(720, 27, 0, '0.00000', '0.00'),
(721, 25, 0, '0.00000', '0.00'),
(721, 27, 0, '0.00000', '0.00'),
(722, 25, 0, '0.00000', '0.00'),
(722, 27, 0, '0.00000', '0.00'),
(723, 25, 0, '0.00000', '0.00'),
(723, 27, 0, '0.00000', '0.00'),
(724, 25, 0, '0.00000', '0.00'),
(724, 27, 0, '0.00000', '0.00'),
(725, 25, 0, '0.00000', '0.00'),
(725, 27, 0, '0.00000', '0.00'),
(726, 25, 0, '0.00000', '0.00'),
(726, 27, 0, '0.00000', '0.00'),
(727, 25, 0, '0.00000', '0.00'),
(727, 27, 0, '0.00000', '0.00'),
(728, 25, 0, '0.00000', '0.00'),
(728, 27, 0, '0.00000', '0.00'),
(729, 25, 0, '0.00000', '0.00'),
(729, 27, 0, '0.00000', '0.00'),
(730, 25, 0, '0.00000', '0.00'),
(730, 27, 0, '0.00000', '0.00'),
(731, 25, 0, '0.00000', '0.00'),
(731, 27, 0, '0.00000', '0.00'),
(732, 25, 1, '0.00000', '0.00'),
(732, 27, 0, '0.00000', '0.00'),
(733, 25, 0, '0.00000', '0.00'),
(733, 27, 0, '0.00000', '0.00'),
(734, 25, 0, '0.00000', '0.00'),
(734, 27, 0, '0.00000', '0.00'),
(735, 25, 0, '0.00000', '0.00'),
(735, 27, 0, '0.00000', '0.00'),
(736, 25, 0, '0.00000', '0.00'),
(736, 27, 0, '0.00000', '0.00'),
(737, 25, 0, '0.00000', '0.00'),
(737, 27, 0, '0.00000', '0.00'),
(738, 25, 0, '0.00000', '0.00'),
(738, 27, 0, '0.00000', '0.00'),
(739, 25, 0, '0.00000', '0.00'),
(739, 27, 0, '0.00000', '0.00'),
(740, 25, 0, '0.00000', '0.00'),
(740, 27, 0, '0.00000', '0.00'),
(741, 25, 0, '0.00000', '0.00'),
(741, 27, 0, '0.00000', '0.00'),
(742, 25, 0, '0.00000', '0.00'),
(742, 27, 0, '0.00000', '0.00'),
(743, 25, 0, '0.00000', '0.00'),
(743, 27, 0, '0.00000', '0.00'),
(744, 25, 0, '0.00000', '0.00'),
(744, 27, 0, '0.00000', '0.00'),
(745, 25, 0, '0.00000', '0.00'),
(745, 27, 0, '0.00000', '0.00'),
(746, 25, 0, '0.00000', '0.00'),
(746, 27, 0, '0.00000', '0.00'),
(747, 25, 0, '0.00000', '0.00'),
(747, 27, 0, '0.00000', '0.00'),
(748, 25, 0, '0.00000', '0.00'),
(748, 27, 0, '0.00000', '0.00'),
(749, 25, 0, '0.00000', '0.00'),
(749, 27, 0, '0.00000', '0.00'),
(750, 25, 0, '0.00000', '0.00'),
(750, 27, 0, '0.00000', '0.00'),
(751, 25, 0, '0.00000', '0.00'),
(751, 27, 0, '0.00000', '0.00'),
(752, 25, 0, '0.00000', '0.00'),
(752, 27, 0, '0.00000', '0.00'),
(753, 25, 0, '0.00000', '0.00'),
(753, 27, 0, '0.00000', '0.00'),
(754, 25, 0, '0.00000', '0.00'),
(754, 27, 0, '0.00000', '0.00'),
(755, 25, 0, '0.00000', '0.00'),
(755, 27, 0, '0.00000', '0.00'),
(756, 25, 0, '0.00000', '0.00'),
(756, 27, 0, '0.00000', '0.00'),
(757, 25, 0, '0.00000', '0.00'),
(757, 27, 0, '0.00000', '0.00'),
(758, 25, 0, '0.00000', '0.00'),
(758, 27, 0, '0.00000', '0.00'),
(759, 25, 0, '0.00000', '0.00'),
(759, 27, 0, '0.00000', '0.00'),
(760, 25, 0, '0.00000', '0.00'),
(760, 27, 0, '0.00000', '0.00'),
(761, 25, 0, '0.00000', '0.00'),
(761, 27, 0, '0.00000', '0.00'),
(762, 25, 0, '0.00000', '0.00'),
(762, 27, 0, '0.00000', '0.00'),
(763, 25, 0, '0.00000', '0.00'),
(763, 27, 0, '0.00000', '0.00'),
(764, 25, 0, '0.00000', '0.00'),
(764, 27, 0, '0.00000', '0.00'),
(765, 25, 0, '0.00000', '0.00'),
(765, 27, 0, '0.00000', '0.00'),
(766, 25, 0, '0.00000', '0.00'),
(766, 27, 0, '0.00000', '0.00'),
(767, 25, 0, '0.00000', '0.00'),
(767, 27, 0, '0.00000', '0.00'),
(768, 25, 0, '0.00000', '0.00'),
(768, 27, 0, '0.00000', '0.00'),
(769, 25, 0, '0.00000', '0.00'),
(769, 27, 0, '0.00000', '0.00'),
(770, 25, 0, '0.00000', '0.00'),
(770, 27, 0, '0.00000', '0.00'),
(771, 25, 0, '0.00000', '0.00'),
(771, 27, 0, '0.00000', '0.00'),
(772, 25, 0, '0.00000', '0.00'),
(772, 27, 0, '0.00000', '0.00'),
(773, 25, 0, '0.00000', '0.00'),
(773, 27, 0, '0.00000', '0.00'),
(774, 25, 0, '0.00000', '0.00'),
(774, 27, 0, '0.00000', '0.00'),
(775, 25, 0, '0.00000', '0.00'),
(775, 27, 0, '0.00000', '0.00'),
(776, 25, 0, '0.00000', '0.00'),
(776, 27, 0, '0.00000', '0.00'),
(777, 25, 0, '0.00000', '0.00'),
(777, 27, 0, '0.00000', '0.00'),
(778, 25, 0, '0.00000', '0.00'),
(778, 27, 0, '0.00000', '0.00'),
(779, 25, 0, '0.00000', '0.00'),
(779, 27, 0, '0.00000', '0.00'),
(780, 25, 0, '0.00000', '0.00'),
(780, 27, 0, '0.00000', '0.00'),
(781, 25, 0, '0.00000', '0.00'),
(781, 27, 0, '0.00000', '0.00'),
(782, 25, 0, '0.00000', '0.00'),
(782, 27, 0, '0.00000', '0.00'),
(783, 25, 0, '0.00000', '0.00'),
(783, 27, 0, '0.00000', '0.00'),
(784, 25, 0, '0.00000', '0.00'),
(784, 27, 0, '0.00000', '0.00'),
(785, 25, 0, '0.00000', '0.00'),
(785, 27, 0, '0.00000', '0.00'),
(786, 25, 0, '0.00000', '0.00'),
(786, 27, 0, '0.00000', '0.00'),
(787, 25, 0, '0.00000', '0.00'),
(787, 27, 0, '0.00000', '0.00'),
(788, 25, 0, '0.00000', '0.00'),
(788, 27, 0, '0.00000', '0.00'),
(789, 25, 0, '0.00000', '0.00'),
(789, 27, 0, '0.00000', '0.00'),
(790, 25, 0, '0.00000', '0.00'),
(790, 27, 0, '0.00000', '0.00'),
(791, 25, 0, '0.00000', '0.00'),
(791, 27, 0, '0.00000', '0.00'),
(792, 25, 0, '0.00000', '0.00'),
(792, 27, 0, '0.00000', '0.00'),
(793, 25, 0, '0.00000', '0.00'),
(793, 27, 0, '0.00000', '0.00'),
(794, 25, 0, '0.00000', '0.00'),
(794, 27, 0, '0.00000', '0.00'),
(795, 25, 0, '0.00000', '0.00'),
(795, 27, 0, '0.00000', '0.00'),
(796, 25, 0, '0.00000', '0.00'),
(796, 27, 0, '0.00000', '0.00'),
(797, 25, 0, '0.00000', '0.00'),
(797, 27, 0, '0.00000', '0.00'),
(798, 25, 0, '0.00000', '0.00'),
(798, 27, 0, '0.00000', '0.00'),
(799, 25, 0, '0.00000', '0.00'),
(799, 27, 0, '0.00000', '0.00'),
(800, 25, 0, '0.00000', '0.00'),
(800, 27, 0, '0.00000', '0.00'),
(801, 25, 0, '0.00000', '0.00'),
(801, 27, 0, '0.00000', '0.00'),
(802, 25, 0, '0.00000', '0.00'),
(802, 27, 0, '0.00000', '0.00'),
(803, 25, 0, '0.00000', '0.00'),
(803, 27, 0, '0.00000', '0.00'),
(804, 25, 0, '0.00000', '0.00'),
(804, 27, 0, '0.00000', '0.00'),
(805, 25, 0, '0.00000', '0.00'),
(805, 27, 0, '0.00000', '0.00'),
(806, 25, 0, '0.00000', '0.00'),
(806, 27, 0, '0.00000', '0.00'),
(807, 25, 0, '0.00000', '0.00'),
(807, 27, 0, '0.00000', '0.00'),
(808, 25, 0, '0.00000', '0.00'),
(808, 27, 0, '0.00000', '0.00'),
(809, 25, 0, '0.00000', '0.00'),
(809, 27, 0, '0.00000', '0.00'),
(810, 25, 0, '0.00000', '0.00'),
(810, 27, 0, '0.00000', '0.00'),
(811, 25, 0, '0.00000', '0.00'),
(811, 27, 0, '0.00000', '0.00'),
(812, 25, 0, '0.00000', '0.00'),
(812, 27, 0, '0.00000', '0.00'),
(813, 25, 0, '0.00000', '0.00'),
(813, 27, 0, '0.00000', '0.00'),
(814, 25, 0, '0.00000', '0.00'),
(814, 27, 0, '0.00000', '0.00'),
(815, 25, 0, '0.00000', '0.00'),
(815, 27, 0, '0.00000', '0.00'),
(816, 25, 0, '0.00000', '0.00'),
(816, 27, 0, '0.00000', '0.00'),
(817, 25, 0, '0.00000', '0.00'),
(817, 27, 0, '0.00000', '0.00'),
(818, 25, 0, '0.00000', '0.00'),
(818, 27, 0, '0.00000', '0.00'),
(819, 25, 0, '0.00000', '0.00'),
(819, 27, 0, '0.00000', '0.00'),
(820, 25, 0, '0.00000', '0.00'),
(820, 27, 0, '0.00000', '0.00'),
(821, 25, 0, '0.00000', '0.00'),
(821, 27, 0, '0.00000', '0.00'),
(822, 25, 0, '0.00000', '0.00'),
(822, 27, 0, '0.00000', '0.00'),
(823, 25, 0, '0.00000', '0.00'),
(823, 27, 0, '0.00000', '0.00'),
(824, 25, 0, '0.00000', '0.00'),
(824, 27, 0, '0.00000', '0.00'),
(825, 25, 0, '0.00000', '0.00'),
(825, 27, 0, '0.00000', '0.00'),
(826, 25, 0, '0.00000', '0.00'),
(826, 27, 0, '0.00000', '0.00'),
(827, 25, 0, '0.00000', '0.00'),
(827, 27, 0, '0.00000', '0.00'),
(828, 25, 0, '0.00000', '0.00'),
(828, 27, 0, '0.00000', '0.00'),
(829, 25, 0, '0.00000', '0.00'),
(829, 27, 0, '0.00000', '0.00'),
(830, 25, 0, '0.00000', '0.00'),
(830, 27, 0, '0.00000', '0.00'),
(831, 25, 0, '0.00000', '0.00'),
(831, 27, 0, '0.00000', '0.00'),
(832, 25, 0, '0.00000', '0.00'),
(832, 27, 0, '0.00000', '0.00'),
(833, 25, 0, '0.00000', '0.00'),
(833, 27, 0, '0.00000', '0.00'),
(834, 25, 0, '0.00000', '0.00'),
(834, 27, 0, '0.00000', '0.00'),
(835, 25, 0, '0.00000', '0.00'),
(835, 27, 0, '0.00000', '0.00'),
(836, 25, 0, '0.00000', '0.00'),
(836, 27, 0, '0.00000', '0.00'),
(837, 25, 0, '0.00000', '0.00'),
(837, 27, 0, '0.00000', '0.00'),
(838, 25, 0, '0.00000', '0.00'),
(838, 27, 0, '0.00000', '0.00'),
(839, 25, 0, '0.00000', '0.00'),
(839, 27, 0, '0.00000', '0.00'),
(840, 25, 0, '0.00000', '0.00'),
(840, 27, 0, '0.00000', '0.00'),
(841, 25, 0, '0.00000', '0.00'),
(841, 27, 0, '0.00000', '0.00'),
(842, 25, 0, '0.00000', '0.00'),
(842, 27, 0, '0.00000', '0.00'),
(843, 25, 0, '0.00000', '0.00'),
(843, 27, 0, '0.00000', '0.00'),
(844, 25, 0, '0.00000', '0.00'),
(844, 27, 0, '0.00000', '0.00'),
(845, 25, 0, '0.00000', '0.00'),
(845, 27, 0, '0.00000', '0.00'),
(846, 25, 0, '0.00000', '0.00'),
(846, 27, 0, '0.00000', '0.00'),
(847, 25, 0, '0.00000', '0.00'),
(847, 27, 0, '0.00000', '0.00'),
(848, 25, 0, '0.00000', '0.00'),
(848, 27, 0, '0.00000', '0.00'),
(849, 25, 0, '0.00000', '0.00'),
(849, 27, 0, '0.00000', '0.00'),
(850, 25, 0, '0.00000', '0.00'),
(850, 27, 0, '0.00000', '0.00'),
(851, 25, 0, '0.00000', '0.00'),
(851, 27, 0, '0.00000', '0.00'),
(852, 25, 0, '0.00000', '0.00'),
(852, 27, 0, '0.00000', '0.00'),
(853, 25, 0, '0.00000', '0.00'),
(853, 27, 0, '0.00000', '0.00'),
(854, 25, 0, '0.00000', '0.00'),
(854, 27, 0, '0.00000', '0.00'),
(855, 25, 0, '0.00000', '0.00'),
(855, 27, 0, '0.00000', '0.00'),
(856, 25, 0, '0.00000', '0.00'),
(856, 27, 0, '0.00000', '0.00'),
(857, 25, 0, '0.00000', '0.00'),
(857, 27, 0, '0.00000', '0.00'),
(858, 25, 0, '0.00000', '0.00'),
(858, 27, 0, '0.00000', '0.00'),
(859, 25, 0, '0.00000', '0.00'),
(859, 27, 0, '0.00000', '0.00'),
(860, 25, 0, '0.00000', '0.00'),
(860, 27, 0, '0.00000', '0.00'),
(861, 25, 0, '0.00000', '0.00'),
(861, 27, 0, '0.00000', '0.00'),
(862, 25, 0, '0.00000', '0.00'),
(862, 27, 0, '0.00000', '0.00'),
(863, 25, 0, '0.00000', '0.00'),
(863, 27, 0, '0.00000', '0.00'),
(864, 25, 0, '0.00000', '0.00'),
(864, 27, 0, '0.00000', '0.00'),
(865, 25, 0, '0.00000', '0.00'),
(865, 27, 0, '0.00000', '0.00'),
(866, 25, 0, '0.00000', '0.00'),
(866, 27, 0, '0.00000', '0.00'),
(867, 25, 0, '0.00000', '0.00'),
(867, 27, 0, '0.00000', '0.00'),
(868, 25, 0, '0.00000', '0.00'),
(868, 27, 0, '0.00000', '0.00'),
(869, 25, 0, '0.00000', '0.00'),
(869, 27, 0, '0.00000', '0.00'),
(870, 25, 0, '0.00000', '0.00'),
(870, 27, 0, '0.00000', '0.00'),
(871, 25, 0, '0.00000', '0.00'),
(871, 27, 0, '0.00000', '0.00'),
(872, 25, 0, '0.00000', '0.00'),
(872, 27, 0, '0.00000', '0.00'),
(873, 25, 0, '0.00000', '0.00'),
(873, 27, 0, '0.00000', '0.00'),
(874, 25, 0, '0.00000', '0.00'),
(874, 27, 0, '0.00000', '0.00'),
(875, 25, 0, '0.00000', '0.00'),
(875, 27, 0, '0.00000', '0.00'),
(876, 25, 0, '0.00000', '0.00'),
(876, 27, 0, '0.00000', '0.00'),
(877, 25, 0, '0.00000', '0.00'),
(877, 27, 0, '0.00000', '0.00'),
(878, 25, 0, '0.00000', '0.00'),
(878, 27, 0, '0.00000', '0.00'),
(879, 25, 0, '0.00000', '0.00'),
(879, 27, 0, '0.00000', '0.00'),
(880, 25, 0, '0.00000', '0.00'),
(880, 27, 0, '0.00000', '0.00'),
(881, 25, 0, '0.00000', '0.00'),
(881, 27, 0, '0.00000', '0.00'),
(882, 25, 0, '0.00000', '0.00'),
(882, 27, 0, '0.00000', '0.00'),
(883, 25, 0, '0.00000', '0.00'),
(883, 27, 0, '0.00000', '0.00'),
(884, 25, 0, '0.00000', '0.00'),
(884, 27, 0, '0.00000', '0.00'),
(885, 25, 0, '0.00000', '0.00'),
(885, 27, 0, '0.00000', '0.00'),
(886, 25, 0, '0.00000', '0.00'),
(886, 27, 0, '0.00000', '0.00'),
(887, 25, 0, '0.00000', '0.00'),
(887, 27, 0, '0.00000', '0.00'),
(888, 25, 0, '0.00000', '0.00'),
(888, 27, 0, '0.00000', '0.00'),
(889, 25, 0, '0.00000', '0.00'),
(889, 27, 0, '0.00000', '0.00'),
(890, 25, 0, '0.00000', '0.00'),
(890, 27, 0, '0.00000', '0.00'),
(891, 25, 0, '0.00000', '0.00'),
(891, 27, 0, '0.00000', '0.00'),
(892, 25, 0, '0.00000', '0.00'),
(892, 27, 0, '0.00000', '0.00'),
(893, 25, 0, '0.00000', '0.00'),
(893, 27, 0, '0.00000', '0.00'),
(894, 25, 0, '0.00000', '0.00'),
(894, 27, 0, '0.00000', '0.00'),
(895, 25, 0, '0.00000', '0.00'),
(895, 27, 0, '0.00000', '0.00'),
(896, 25, 0, '0.00000', '0.00'),
(896, 27, 0, '0.00000', '0.00'),
(897, 25, 0, '0.00000', '0.00'),
(897, 27, 0, '0.00000', '0.00'),
(898, 25, 0, '0.00000', '0.00'),
(898, 27, 0, '0.00000', '0.00'),
(899, 25, 0, '0.00000', '0.00'),
(899, 27, 0, '0.00000', '0.00'),
(900, 25, 0, '0.00000', '0.00'),
(900, 27, 0, '0.00000', '0.00'),
(901, 25, 0, '0.00000', '0.00'),
(901, 27, 0, '0.00000', '0.00'),
(902, 25, 0, '0.00000', '0.00'),
(902, 27, 0, '0.00000', '0.00'),
(903, 25, 0, '0.00000', '0.00'),
(903, 27, 0, '0.00000', '0.00'),
(904, 25, 0, '0.00000', '0.00'),
(904, 27, 0, '0.00000', '0.00'),
(905, 25, 0, '0.00000', '0.00'),
(905, 27, 0, '0.00000', '0.00'),
(906, 25, 0, '0.00000', '0.00'),
(906, 27, 0, '0.00000', '0.00'),
(907, 25, 0, '0.00000', '0.00'),
(907, 27, 0, '0.00000', '0.00'),
(908, 25, 0, '0.00000', '0.00'),
(908, 27, 0, '0.00000', '0.00'),
(909, 25, 0, '0.00000', '0.00'),
(909, 27, 0, '0.00000', '0.00'),
(910, 25, 0, '0.00000', '0.00'),
(910, 27, 0, '0.00000', '0.00'),
(911, 25, 0, '0.00000', '0.00'),
(911, 27, 0, '0.00000', '0.00'),
(912, 25, 0, '0.00000', '0.00'),
(912, 27, 0, '0.00000', '0.00'),
(913, 25, 0, '0.00000', '0.00'),
(913, 27, 0, '0.00000', '0.00'),
(914, 25, 0, '0.00000', '0.00'),
(914, 27, 0, '0.00000', '0.00'),
(915, 25, 0, '0.00000', '0.00'),
(915, 27, 0, '0.00000', '0.00'),
(916, 25, 0, '0.00000', '0.00'),
(916, 27, 0, '0.00000', '0.00'),
(917, 25, 0, '0.00000', '0.00'),
(917, 27, 0, '0.00000', '0.00'),
(918, 25, 0, '0.00000', '0.00'),
(918, 27, 0, '0.00000', '0.00'),
(919, 25, 0, '0.00000', '0.00'),
(919, 27, 0, '0.00000', '0.00'),
(920, 25, 0, '0.00000', '0.00'),
(920, 27, 0, '0.00000', '0.00'),
(921, 25, 0, '0.00000', '0.00'),
(921, 27, 0, '0.00000', '0.00'),
(922, 25, 0, '0.00000', '0.00'),
(922, 27, 0, '0.00000', '0.00'),
(923, 25, 0, '0.00000', '0.00'),
(923, 27, 0, '0.00000', '0.00'),
(924, 25, 0, '0.00000', '0.00'),
(924, 27, 0, '0.00000', '0.00'),
(925, 25, 0, '0.00000', '0.00'),
(925, 27, 0, '0.00000', '0.00'),
(926, 25, 0, '0.00000', '0.00'),
(926, 27, 0, '0.00000', '0.00'),
(927, 25, 0, '0.00000', '0.00'),
(927, 27, 0, '0.00000', '0.00'),
(928, 25, 0, '0.00000', '0.00'),
(928, 27, 0, '0.00000', '0.00'),
(929, 25, 0, '0.00000', '0.00'),
(929, 27, 0, '0.00000', '0.00'),
(930, 25, 0, '0.00000', '0.00'),
(930, 27, 0, '0.00000', '0.00'),
(931, 25, 0, '0.00000', '0.00'),
(931, 27, 0, '0.00000', '0.00'),
(932, 25, 0, '0.00000', '0.00'),
(932, 27, 0, '0.00000', '0.00'),
(933, 25, 0, '0.00000', '0.00'),
(933, 27, 0, '0.00000', '0.00'),
(934, 25, 0, '0.00000', '0.00'),
(934, 27, 0, '0.00000', '0.00'),
(935, 25, 0, '0.00000', '0.00'),
(935, 27, 0, '0.00000', '0.00'),
(936, 25, 0, '0.00000', '0.00'),
(936, 27, 0, '0.00000', '0.00'),
(938, 25, 0, '0.00000', '0.00'),
(938, 27, 0, '0.00000', '0.00'),
(940, 25, 0, '0.00000', '0.00'),
(940, 27, 0, '0.00000', '0.00'),
(941, 25, 0, '0.00000', '0.00'),
(941, 27, 0, '0.00000', '0.00'),
(942, 25, 0, '0.00000', '0.00'),
(942, 27, 0, '0.00000', '0.00'),
(943, 25, 0, '0.00000', '0.00'),
(943, 27, 0, '0.00000', '0.00'),
(944, 25, 0, '0.00000', '0.00'),
(944, 27, 0, '0.00000', '0.00'),
(945, 25, 0, '0.00000', '0.00'),
(945, 27, 0, '0.00000', '0.00'),
(946, 25, 0, '0.00000', '0.00'),
(946, 27, 0, '0.00000', '0.00'),
(947, 25, 0, '0.00000', '0.00'),
(947, 27, 0, '0.00000', '0.00'),
(948, 25, 0, '0.00000', '0.00'),
(948, 27, 0, '0.00000', '0.00'),
(949, 25, 0, '0.00000', '0.00'),
(949, 27, 0, '0.00000', '0.00'),
(950, 25, 0, '22.00000', '2.20'),
(950, 26, 1, '33.00000', '1.20'),
(950, 27, 0, '0.00000', '0.00'),
(951, 25, 0, '0.00000', '0.00'),
(951, 27, 0, '0.00000', '0.00'),
(952, 25, 0, '0.00000', '0.00'),
(952, 27, 0, '0.00000', '0.00'),
(953, 25, 0, '0.00000', '0.00'),
(953, 27, 0, '0.00000', '0.00'),
(954, 25, 0, '0.00000', '0.00'),
(954, 27, 0, '0.00000', '0.00'),
(955, 25, 0, '0.00000', '0.00'),
(955, 27, 0, '0.00000', '0.00'),
(956, 25, 0, '0.00000', '0.00'),
(956, 27, 0, '0.00000', '0.00'),
(957, 25, 0, '0.00000', '0.00'),
(957, 27, 0, '0.00000', '0.00'),
(958, 25, 0, '0.00000', '0.00'),
(958, 27, 0, '0.00000', '0.00'),
(959, 25, 0, '0.00000', '0.00'),
(959, 27, 0, '0.00000', '0.00'),
(960, 25, 0, '0.00000', '0.00'),
(960, 27, 0, '0.00000', '0.00'),
(961, 25, 0, '0.00000', '0.00'),
(961, 27, 0, '0.00000', '0.00'),
(962, 25, 0, '0.00000', '0.00'),
(962, 27, 0, '0.00000', '0.00'),
(963, 25, 0, '0.00000', '0.00'),
(963, 27, 0, '0.00000', '0.00'),
(964, 25, 0, '0.00000', '0.00'),
(964, 27, 0, '0.00000', '0.00'),
(965, 25, 0, '0.00000', '0.00'),
(965, 27, 0, '0.00000', '0.00'),
(966, 25, 0, '0.00000', '0.00'),
(966, 27, 0, '0.00000', '0.00'),
(967, 25, 0, '0.00000', '0.00'),
(967, 27, 0, '0.00000', '0.00'),
(968, 25, 0, '0.00000', '0.00'),
(968, 27, 0, '0.00000', '0.00'),
(969, 25, 0, '0.00000', '0.00'),
(969, 27, 0, '0.00000', '0.00'),
(970, 25, 0, '0.00000', '0.00'),
(970, 27, 0, '0.00000', '0.00'),
(971, 25, 0, '0.00000', '0.00'),
(971, 27, 0, '0.00000', '0.00'),
(972, 25, 0, '0.00000', '0.00'),
(972, 27, 0, '0.00000', '0.00'),
(973, 25, 0, '0.00000', '0.00'),
(973, 27, 0, '0.00000', '0.00'),
(974, 25, 0, '0.00000', '0.00'),
(974, 27, 0, '0.00000', '0.00'),
(975, 25, 0, '0.00000', '0.00'),
(975, 27, 0, '0.00000', '0.00'),
(976, 25, 0, '0.00000', '0.00'),
(976, 27, 0, '0.00000', '0.00'),
(977, 25, 0, '0.00000', '0.00'),
(977, 27, 0, '0.00000', '0.00'),
(978, 25, 0, '0.00000', '0.00'),
(978, 27, 0, '0.00000', '0.00'),
(979, 25, 0, '0.00000', '0.00'),
(979, 27, 0, '0.00000', '0.00'),
(980, 25, 0, '0.00000', '0.00'),
(980, 27, 0, '0.00000', '0.00'),
(981, 25, 0, '0.00000', '0.00'),
(981, 27, 0, '0.00000', '0.00'),
(982, 25, 0, '0.00000', '0.00'),
(982, 27, 0, '0.00000', '0.00'),
(983, 25, 0, '0.00000', '0.00'),
(983, 27, 0, '0.00000', '0.00'),
(984, 25, 0, '0.00000', '0.00'),
(984, 27, 0, '0.00000', '0.00'),
(985, 25, 0, '0.00000', '0.00'),
(985, 27, 0, '0.00000', '0.00'),
(986, 25, 0, '0.00000', '0.00'),
(986, 27, 0, '0.00000', '0.00'),
(987, 25, 0, '0.00000', '0.00'),
(987, 27, 0, '0.00000', '0.00'),
(988, 25, 0, '0.00000', '0.00'),
(988, 27, 0, '0.00000', '0.00'),
(989, 25, 0, '0.00000', '0.00'),
(989, 27, 0, '0.00000', '0.00'),
(990, 25, 0, '0.00000', '0.00'),
(990, 27, 0, '0.00000', '0.00'),
(991, 25, 0, '0.00000', '0.00'),
(991, 27, 0, '0.00000', '0.00'),
(992, 25, 0, '0.00000', '0.00'),
(992, 27, 0, '0.00000', '0.00'),
(993, 25, 0, '0.00000', '0.00'),
(993, 27, 0, '0.00000', '0.00'),
(994, 25, 0, '0.00000', '0.00'),
(994, 27, 0, '0.00000', '0.00'),
(995, 25, 0, '0.00000', '0.00'),
(995, 27, 0, '0.00000', '0.00'),
(996, 25, 0, '0.00000', '0.00'),
(996, 27, 0, '0.00000', '0.00'),
(997, 25, 0, '0.00000', '0.00'),
(997, 27, 0, '0.00000', '0.00'),
(999, 25, 0, '0.00000', '0.00'),
(999, 27, 0, '0.00000', '0.00'),
(1001, 25, 0, '0.00000', '0.00'),
(1001, 27, 0, '0.00000', '0.00'),
(1002, 25, 0, '0.00000', '0.00'),
(1002, 27, 0, '0.00000', '0.00'),
(1003, 25, 0, '0.00000', '0.00'),
(1003, 27, 0, '0.00000', '0.00'),
(1004, 25, 0, '0.00000', '0.00'),
(1004, 27, 0, '0.00000', '0.00'),
(1005, 25, 0, '0.00000', '0.00'),
(1005, 27, 0, '0.00000', '0.00'),
(1006, 25, 0, '0.00000', '0.00'),
(1006, 27, 0, '0.00000', '0.00'),
(1007, 25, 0, '0.00000', '0.00'),
(1007, 27, 0, '0.00000', '0.00'),
(1008, 25, 0, '0.00000', '0.00'),
(1008, 26, 0, '0.00000', '0.00'),
(1008, 27, 0, '0.00000', '0.00'),
(1009, 25, 0, '0.00000', '0.00'),
(1009, 27, 0, '0.00000', '0.00'),
(1010, 25, 0, '0.00000', '0.00'),
(1010, 27, 0, '0.00000', '0.00'),
(1011, 25, 0, '0.00000', '0.00'),
(1011, 27, 0, '0.00000', '0.00'),
(1012, 25, 0, '0.00000', '0.00'),
(1012, 27, 0, '0.00000', '0.00'),
(1013, 25, 0, '0.00000', '0.00'),
(1013, 27, 0, '0.00000', '0.00'),
(1014, 25, 0, '0.00000', '0.00'),
(1014, 27, 0, '0.00000', '0.00'),
(1015, 25, 0, '0.00000', '0.00'),
(1015, 27, 0, '0.00000', '0.00'),
(1016, 25, 0, '0.00000', '0.00'),
(1016, 27, 0, '0.00000', '0.00'),
(1017, 25, 0, '0.00000', '0.00'),
(1017, 27, 0, '0.00000', '0.00'),
(1018, 25, 0, '0.00000', '0.00'),
(1018, 27, 0, '0.00000', '0.00'),
(1019, 25, 0, '0.00000', '0.00'),
(1019, 27, 0, '0.00000', '0.00'),
(1020, 25, 0, '0.00000', '0.00'),
(1020, 27, 0, '0.00000', '0.00'),
(1021, 25, 0, '0.00000', '0.00'),
(1021, 27, 0, '0.00000', '0.00'),
(1022, 25, 0, '0.00000', '0.00'),
(1022, 27, 0, '0.00000', '0.00'),
(1023, 25, 0, '0.00000', '0.00'),
(1023, 27, 0, '0.00000', '0.00'),
(1025, 25, 0, '0.00000', '0.00'),
(1025, 27, 0, '0.00000', '0.00'),
(1026, 25, 0, '0.00000', '0.00'),
(1026, 27, 0, '0.00000', '0.00'),
(1027, 25, 0, '0.00000', '0.00'),
(1027, 27, 0, '0.00000', '0.00'),
(1028, 25, 0, '0.00000', '0.00'),
(1028, 27, 0, '0.00000', '0.00'),
(1029, 25, 0, '0.00000', '0.00'),
(1029, 27, 0, '0.00000', '0.00'),
(1030, 25, 0, '0.00000', '0.00'),
(1030, 27, 0, '0.00000', '0.00'),
(1031, 25, 0, '0.00000', '0.00'),
(1031, 27, 0, '0.00000', '0.00'),
(1032, 25, 0, '0.00000', '0.00'),
(1032, 27, 0, '0.00000', '0.00'),
(1033, 25, 0, '0.00000', '0.00'),
(1033, 27, 0, '0.00000', '0.00'),
(1034, 25, 0, '0.00000', '0.00'),
(1034, 27, 0, '0.00000', '0.00'),
(1035, 25, 0, '0.00000', '0.00'),
(1035, 27, 0, '0.00000', '0.00'),
(1036, 25, 0, '0.00000', '0.00'),
(1036, 27, 0, '0.00000', '0.00'),
(1037, 25, 0, '0.00000', '0.00'),
(1037, 27, 0, '0.00000', '0.00'),
(1038, 25, 0, '0.00000', '0.00'),
(1038, 27, 0, '0.00000', '0.00'),
(1039, 25, 0, '0.00000', '0.00'),
(1039, 27, 0, '0.00000', '0.00'),
(1040, 25, 0, '0.00000', '0.00'),
(1040, 27, 0, '0.00000', '0.00'),
(1041, 25, 0, '0.00000', '0.00'),
(1041, 27, 0, '0.00000', '0.00'),
(1042, 25, 0, '0.00000', '0.00'),
(1042, 27, 0, '0.00000', '0.00'),
(1043, 25, 0, '0.00000', '0.00'),
(1043, 27, 0, '0.00000', '0.00'),
(1044, 25, 0, '0.00000', '0.00'),
(1044, 27, 0, '0.00000', '0.00'),
(1045, 25, 0, '0.00000', '0.00'),
(1045, 27, 0, '0.00000', '0.00'),
(1046, 25, 0, '0.00000', '0.00'),
(1046, 27, 0, '0.00000', '0.00'),
(1047, 25, 0, '0.00000', '0.00'),
(1047, 27, 0, '0.00000', '0.00'),
(1048, 25, 0, '0.00000', '0.00'),
(1048, 26, 0, '0.00000', '0.00'),
(1048, 27, 0, '0.00000', '0.00'),
(1049, 25, 0, '0.00000', '0.00'),
(1049, 26, 0, '0.00000', '0.00'),
(1049, 27, 0, '0.00000', '0.00'),
(1050, 25, 0, '0.00000', '0.00'),
(1050, 26, 0, '0.00000', '0.00'),
(1050, 27, 0, '0.00000', '0.00'),
(1051, 25, 0, '0.00000', '0.00'),
(1051, 27, 0, '0.00000', '0.00'),
(1052, 25, 0, '0.00000', '0.00'),
(1052, 27, 0, '0.00000', '0.00'),
(1053, 25, 0, '0.00000', '0.00'),
(1053, 27, 0, '0.00000', '0.00'),
(1054, 25, 0, '0.00000', '0.00'),
(1054, 27, 0, '0.00000', '0.00'),
(1055, 25, 0, '0.00000', '0.00'),
(1055, 27, 0, '0.00000', '0.00'),
(1056, 25, 0, '0.00000', '0.00'),
(1056, 27, 0, '0.00000', '0.00'),
(1057, 25, 0, '0.00000', '0.00'),
(1057, 27, 0, '0.00000', '0.00'),
(1058, 25, 0, '0.00000', '0.00'),
(1058, 27, 0, '0.00000', '0.00'),
(1059, 25, 0, '0.00000', '0.00'),
(1059, 27, 0, '0.00000', '0.00'),
(1060, 25, 0, '0.00000', '0.00'),
(1060, 27, 0, '0.00000', '0.00'),
(1061, 25, 0, '0.00000', '0.00'),
(1061, 27, 0, '0.00000', '0.00'),
(1062, 25, 0, '0.00000', '0.00'),
(1062, 27, 0, '0.00000', '0.00'),
(1063, 25, 0, '0.00000', '0.00'),
(1063, 27, 0, '0.00000', '0.00'),
(1064, 25, 0, '0.00000', '0.00'),
(1064, 27, 0, '0.00000', '0.00'),
(1065, 25, 0, '0.00000', '0.00'),
(1065, 27, 0, '0.00000', '0.00'),
(1066, 25, 0, '0.00000', '0.00'),
(1066, 27, 0, '0.00000', '0.00'),
(1067, 25, 0, '0.00000', '0.00'),
(1067, 27, 0, '0.00000', '0.00'),
(1068, 25, 0, '0.00000', '0.00'),
(1068, 27, 0, '0.00000', '0.00'),
(1069, 25, 0, '0.00000', '0.00'),
(1069, 27, 0, '0.00000', '0.00'),
(1070, 25, 0, '0.00000', '0.00'),
(1070, 27, 0, '0.00000', '0.00'),
(1071, 25, 0, '0.00000', '0.00'),
(1071, 27, 0, '0.00000', '0.00'),
(1072, 25, 0, '0.00000', '0.00'),
(1072, 27, 0, '0.00000', '0.00'),
(1073, 25, 0, '0.00000', '0.00'),
(1073, 27, 0, '0.00000', '0.00'),
(1074, 25, 0, '0.00000', '0.00'),
(1074, 27, 0, '0.00000', '0.00'),
(1075, 25, 0, '0.00000', '0.00'),
(1075, 27, 0, '0.00000', '0.00'),
(1076, 25, 0, '0.00000', '0.00'),
(1076, 27, 0, '0.00000', '0.00'),
(1077, 25, 0, '0.00000', '0.00'),
(1077, 27, 0, '0.00000', '0.00'),
(1078, 25, 0, '0.00000', '0.00'),
(1078, 27, 0, '0.00000', '0.00'),
(1079, 25, 0, '0.00000', '0.00'),
(1079, 27, 0, '0.00000', '0.00'),
(1080, 25, 0, '0.00000', '0.00'),
(1080, 27, 0, '0.00000', '0.00'),
(1081, 25, 0, '0.00000', '0.00'),
(1081, 27, 0, '0.00000', '0.00'),
(1082, 25, 0, '0.00000', '0.00'),
(1082, 27, 0, '0.00000', '0.00'),
(1083, 25, 0, '0.00000', '0.00'),
(1083, 27, 0, '0.00000', '0.00'),
(1084, 25, 0, '0.00000', '0.00'),
(1084, 27, 0, '0.00000', '0.00'),
(1085, 25, 0, '0.00000', '0.00'),
(1085, 27, 0, '0.00000', '0.00'),
(1087, 25, 0, '0.00000', '0.00'),
(1087, 27, 0, '0.00000', '0.00'),
(1088, 25, 0, '0.00000', '0.00'),
(1088, 27, 0, '0.00000', '0.00'),
(1089, 25, 0, '0.00000', '0.00'),
(1089, 27, 0, '0.00000', '0.00'),
(1090, 25, 0, '0.00000', '0.00'),
(1090, 27, 0, '0.00000', '0.00'),
(1091, 25, 0, '0.00000', '0.00'),
(1091, 27, 0, '0.00000', '0.00'),
(1092, 25, 0, '0.00000', '0.00'),
(1092, 27, 0, '0.00000', '0.00'),
(1093, 25, 0, '0.00000', '0.00'),
(1093, 27, 0, '0.00000', '0.00'),
(1094, 25, 0, '0.00000', '0.00'),
(1094, 27, 0, '0.00000', '0.00'),
(1095, 25, 0, '0.00000', '0.00'),
(1095, 27, 0, '0.00000', '0.00'),
(1096, 25, 0, '0.00000', '0.00'),
(1096, 27, 0, '0.00000', '0.00'),
(1097, 25, 0, '0.00000', '0.00'),
(1097, 27, 0, '0.00000', '0.00'),
(1098, 25, 0, '0.00000', '0.00'),
(1098, 27, 0, '0.00000', '0.00'),
(1099, 25, 0, '0.00000', '0.00'),
(1099, 27, 0, '0.00000', '0.00'),
(1100, 25, 0, '0.00000', '0.00'),
(1100, 27, 0, '0.00000', '0.00'),
(1101, 25, 0, '0.00000', '0.00'),
(1101, 27, 0, '0.00000', '0.00'),
(1102, 25, 0, '0.00000', '0.00'),
(1102, 27, 0, '0.00000', '0.00'),
(1103, 25, 0, '0.00000', '0.00'),
(1103, 27, 0, '0.00000', '0.00'),
(1104, 25, 0, '0.00000', '0.00'),
(1104, 27, 0, '0.00000', '0.00'),
(1105, 25, 0, '0.00000', '0.00'),
(1105, 27, 0, '0.00000', '0.00'),
(1106, 25, 0, '0.00000', '0.00'),
(1106, 27, 0, '0.00000', '0.00'),
(1107, 25, 0, '0.00000', '0.00'),
(1107, 27, 0, '0.00000', '0.00'),
(1108, 25, 0, '0.00000', '0.00'),
(1108, 27, 0, '0.00000', '0.00'),
(1109, 25, 0, '0.00000', '0.00'),
(1109, 27, 0, '0.00000', '0.00'),
(1110, 25, 0, '0.00000', '0.00'),
(1110, 27, 0, '0.00000', '0.00'),
(1111, 25, 0, '0.00000', '0.00'),
(1111, 27, 0, '0.00000', '0.00'),
(1112, 25, 0, '0.00000', '0.00'),
(1112, 27, 0, '0.00000', '0.00'),
(1113, 25, 0, '0.00000', '0.00'),
(1113, 27, 0, '0.00000', '0.00'),
(1114, 25, 0, '0.00000', '0.00'),
(1114, 27, 0, '0.00000', '0.00'),
(1115, 25, 0, '0.00000', '0.00'),
(1115, 27, 0, '0.00000', '0.00'),
(1116, 25, 0, '0.00000', '0.00'),
(1116, 27, 0, '0.00000', '0.00'),
(1117, 25, 0, '0.00000', '0.00'),
(1117, 27, 0, '0.00000', '0.00'),
(1118, 25, 0, '0.00000', '0.00'),
(1118, 27, 0, '0.00000', '0.00'),
(1119, 25, 0, '0.00000', '0.00'),
(1119, 27, 0, '0.00000', '0.00'),
(1120, 25, 0, '0.00000', '0.00'),
(1120, 27, 0, '0.00000', '0.00'),
(1121, 25, 0, '0.00000', '0.00'),
(1121, 27, 0, '0.00000', '0.00'),
(1122, 25, 0, '0.00000', '0.00'),
(1122, 27, 0, '0.00000', '0.00'),
(1123, 25, 0, '0.00000', '0.00'),
(1123, 27, 0, '0.00000', '0.00'),
(1124, 25, 0, '0.00000', '0.00'),
(1124, 27, 0, '0.00000', '0.00'),
(1125, 25, 0, '0.00000', '0.00'),
(1125, 27, 0, '0.00000', '0.00'),
(1126, 25, 0, '0.00000', '0.00'),
(1126, 27, 0, '0.00000', '0.00'),
(1127, 25, 0, '0.00000', '0.00'),
(1127, 27, 0, '0.00000', '0.00'),
(1128, 25, 0, '0.00000', '0.00'),
(1128, 27, 0, '0.00000', '0.00'),
(1129, 25, 0, '0.00000', '0.00'),
(1129, 27, 0, '0.00000', '0.00'),
(1130, 25, 0, '0.00000', '0.00'),
(1130, 27, 0, '0.00000', '0.00'),
(1131, 25, 0, '0.00000', '0.00'),
(1131, 27, 0, '0.00000', '0.00'),
(1132, 25, 0, '0.00000', '0.00'),
(1132, 27, 0, '0.00000', '0.00'),
(1133, 25, 0, '0.00000', '0.00'),
(1133, 27, 0, '0.00000', '0.00'),
(1134, 25, 0, '0.00000', '0.00'),
(1134, 27, 0, '0.00000', '0.00'),
(1135, 25, 0, '0.00000', '0.00'),
(1135, 27, 0, '0.00000', '0.00'),
(1136, 25, 0, '0.00000', '0.00'),
(1136, 27, 0, '0.00000', '0.00'),
(1137, 25, 0, '0.00000', '0.00'),
(1137, 27, 0, '0.00000', '0.00'),
(1138, 25, 0, '0.00000', '0.00'),
(1138, 27, 0, '0.00000', '0.00'),
(1139, 25, 0, '0.00000', '0.00'),
(1139, 27, 0, '0.00000', '0.00'),
(1140, 25, 0, '0.00000', '0.00'),
(1140, 27, 0, '0.00000', '0.00'),
(1141, 25, 0, '0.00000', '0.00'),
(1141, 27, 0, '0.00000', '0.00'),
(1142, 25, 1, '0.00000', '0.00'),
(1142, 27, 0, '0.00000', '0.00'),
(1143, 25, 0, '0.00000', '0.00'),
(1143, 27, 0, '0.00000', '0.00'),
(1144, 25, 0, '0.00000', '0.00'),
(1144, 27, 0, '0.00000', '0.00'),
(1145, 25, 0, '0.00000', '0.00'),
(1145, 27, 0, '0.00000', '0.00'),
(1146, 25, 0, '0.00000', '0.00'),
(1146, 27, 0, '0.00000', '0.00'),
(1147, 25, 0, '0.00000', '0.00'),
(1147, 27, 0, '0.00000', '0.00'),
(1148, 25, 0, '0.00000', '0.00'),
(1148, 27, 0, '0.00000', '0.00'),
(1149, 25, 0, '0.00000', '0.00'),
(1149, 27, 0, '0.00000', '0.00'),
(1150, 25, 0, '0.00000', '0.00'),
(1150, 27, 0, '0.00000', '0.00'),
(1151, 25, 0, '0.00000', '0.00'),
(1151, 27, 0, '0.00000', '0.00'),
(1152, 25, 0, '0.00000', '0.00'),
(1152, 27, 0, '0.00000', '0.00'),
(1153, 25, 0, '0.00000', '0.00'),
(1153, 27, 0, '0.00000', '0.00'),
(1155, 25, 0, '0.00000', '0.00'),
(1155, 27, 0, '0.00000', '0.00'),
(1156, 25, 0, '0.00000', '0.00'),
(1156, 27, 0, '0.00000', '0.00'),
(1157, 25, 0, '0.00000', '0.00'),
(1157, 27, 0, '0.00000', '0.00'),
(1158, 25, 0, '0.00000', '0.00'),
(1158, 27, 0, '0.00000', '0.00'),
(1159, 25, 0, '0.00000', '0.00'),
(1159, 27, 0, '0.00000', '0.00'),
(1160, 25, 0, '0.00000', '0.00'),
(1160, 27, 0, '0.00000', '0.00'),
(1161, 25, 0, '0.00000', '0.00'),
(1161, 27, 0, '0.00000', '0.00'),
(1162, 25, 0, '0.00000', '0.00'),
(1162, 27, 0, '0.00000', '0.00'),
(1163, 25, 0, '0.00000', '0.00'),
(1163, 27, 0, '0.00000', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `item_groups`
--

CREATE TABLE `item_groups` (
  `id` int(10) NOT NULL,
  `item_category_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(35, 3, 'CGL Motors'),
(37, 6, 'Remi Spares');

-- --------------------------------------------------------

--
-- Table structure for table `item_ledgers`
--

CREATE TABLE `item_ledgers` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `rate` decimal(18,5) NOT NULL,
  `source_model` varchar(100) NOT NULL,
  `source_id` int(10) NOT NULL,
  `in_out` varchar(100) NOT NULL,
  `processed_on` date NOT NULL,
  `company_id` int(11) NOT NULL,
  `rate_updated` varchar(5) NOT NULL,
  `left_item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_ledgers`
--

INSERT INTO `item_ledgers` (`id`, `item_id`, `quantity`, `rate`, `source_model`, `source_id`, `in_out`, `processed_on`, `company_id`, `rate_updated`, `left_item_id`) VALUES
(1, 579, 5, '11.00000', 'Items', 579, 'In', '2017-04-01', 25, 'Yes', 0),
(2, 556, 3, '5249.65000', 'Items', 556, 'In', '2017-04-01', 25, 'Yes', 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_serial_numbers`
--

CREATE TABLE `item_serial_numbers` (
  `id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `serial_no` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `grn_id` int(10) NOT NULL,
  `invoice_id` int(10) NOT NULL,
  `iv_invoice_id` int(10) NOT NULL,
  `q_item_id` int(10) NOT NULL,
  `in_inventory_voucher_id` int(10) NOT NULL,
  `master_item_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_serial_numbers`
--

INSERT INTO `item_serial_numbers` (`id`, `item_id`, `serial_no`, `status`, `grn_id`, `invoice_id`, `iv_invoice_id`, `q_item_id`, `in_inventory_voucher_id`, `master_item_id`, `company_id`) VALUES
(1, 579, 'stl-2hp-1', 'In', 0, 0, 0, 0, 0, 579, 25),
(2, 579, 'stl-2hp-2', 'In', 0, 0, 0, 0, 0, 579, 25),
(3, 579, 'stl-2hp-3', 'In', 0, 0, 0, 0, 0, 579, 25),
(4, 579, 'stl-2hp-4', 'In', 0, 0, 0, 0, 0, 579, 25),
(5, 579, 'stl-2hp-5', 'In', 0, 0, 0, 0, 0, 579, 25),
(6, 556, 'stl-0.5hp-1', 'In', 0, 0, 0, 0, 0, 556, 25),
(7, 556, 'stl-0.5hp-2', 'In', 0, 0, 0, 0, 0, 556, 25),
(8, 556, 'stl-0.5hp-3', 'In', 0, 0, 0, 0, 0, 556, 25);

-- --------------------------------------------------------

--
-- Table structure for table `item_sources`
--

CREATE TABLE `item_sources` (
  `item_id` int(10) NOT NULL,
  `source_id` int(10) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `purchased` varchar(100) NOT NULL,
  `purchase_manufactured` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item_sub_groups`
--

CREATE TABLE `item_sub_groups` (
  `id` int(10) NOT NULL,
  `item_category_id` int(10) NOT NULL,
  `item_group_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(71, 6, 19, 'HD 1011 Pump Spares'),
(72, 1, 4, 'Dredger Pump'),
(73, 6, 18, 'Dredger Pump 4DRR 40J / 32 Spare'),
(74, 1, 1, 'CombiTherm Pump'),
(75, 6, 16, 'Combitherm Pump Spares'),
(76, 7, 26, 'CombiTherm Pump With Motor'),
(77, 6, 16, 'Top Gear Pump Spares'),
(78, 6, 15, 'Shuttle Block Pump Spares'),
(79, 6, 37, 'Cabin Fan'),
(80, 6, 16, 'Combibloc Spares Pump'),
(81, 6, 19, 'PL 2017 Pump Spares'),
(82, 6, 19, 'PL 1011 Pump Spares'),
(83, 6, 18, 'Jumbo Pump Spares'),
(84, 6, 31, 'Remi Motor Spares'),
(85, 6, 15, 'Allweiler Spares'),
(86, 3, 13, 'Siemens STD Motors'),
(87, 3, 7, 'BBL Flame Proof');

-- --------------------------------------------------------

--
-- Table structure for table `job_cards`
--

CREATE TABLE `job_cards` (
  `id` int(10) NOT NULL,
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
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_cards`
--

INSERT INTO `job_cards` (`id`, `sales_order_id`, `company_id`, `jc1`, `jc2`, `jc3`, `jc4`, `created_by`, `created_on`, `customer_id`, `dispatch_destination`, `customer_po_no`, `required_date`, `packing`, `status`) VALUES
(1, 1, 26, 'SML', '1', 'BE-3065', '17-18', 16, '2017-04-06', 94, 'asdas', 'fdsfsdf', '2017-04-06', 'dasdasd', 'Pending'),
(2, 2, 25, 'STL', '1', 'BE-3065', '17-18', 16, '2017-04-06', 94, 'sdfsdf', 'sf', '2017-04-06', 'sdfsdf', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `job_card_rows`
--

CREATE TABLE `job_card_rows` (
  `id` int(10) NOT NULL,
  `job_card_id` int(10) NOT NULL,
  `sales_order_row_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `remark` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_card_rows`
--

INSERT INTO `job_card_rows` (`id`, `job_card_id`, `sales_order_row_id`, `item_id`, `quantity`, `remark`) VALUES
(1, 1, 1, 1050, 1, 'asdasd'),
(2, 1, 1, 950, 2, ''),
(3, 2, 3, 567, 1, 'sdfsdfdsf'),
(4, 2, 3, 1151, 2, ''),
(5, 2, 3, 580, 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `journal_vouchers`
--

CREATE TABLE `journal_vouchers` (
  `id` int(10) NOT NULL,
  `voucher_no` varchar(10) NOT NULL,
  `created_on` date NOT NULL,
  `transaction_date` date NOT NULL,
  `narration` text NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `edited_on` date NOT NULL,
  `edited_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `journal_voucher_rows`
--

CREATE TABLE `journal_voucher_rows` (
  `id` int(10) NOT NULL,
  `journal_voucher_id` int(10) NOT NULL,
  `ledger_account_id` int(10) NOT NULL,
  `cr_dr` varchar(10) NOT NULL,
  `amount` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` int(10) NOT NULL,
  `leave_name` varchar(100) NOT NULL,
  `maximum_leave_in_month` decimal(4,2) NOT NULL
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

CREATE TABLE `ledgers` (
  `id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `ledger_account_id` int(10) NOT NULL,
  `debit` decimal(18,2) NOT NULL,
  `credit` decimal(18,2) NOT NULL,
  `voucher_id` int(10) NOT NULL,
  `voucher_source` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL,
  `ref_no` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ledger_accounts`
--

CREATE TABLE `ledger_accounts` (
  `id` int(12) NOT NULL,
  `account_second_subgroup_id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `source_model` varchar(255) NOT NULL,
  `source_id` int(10) NOT NULL,
  `bill_to_bill_account` varchar(10) NOT NULL,
  `company_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ledger_accounts`
--

INSERT INTO `ledger_accounts` (`id`, `account_second_subgroup_id`, `name`, `alias`, `source_model`, `source_id`, `bill_to_bill_account`, `company_id`) VALUES
(22, 10, 'Jagdish Salvi', '', 'Employees', 4, '', 25),
(23, 2, 'Hindustan Zinc Ltd', 'Dariba Smelter Complex', 'Customers', 1, 'Yes', 25),
(25, 2, 'Ultratech Cement Ltd', 'Unit-Aditya Cement Works', 'Customers', 2, 'Yes', 25),
(26, 2, 'JK Laxmi Cement Ltd', 'JK Laxmi Cement Ltd', 'Customers', 3, 'Yes', 25),
(27, 2, 'Shree Cement Ltd', 'Shree Cement Ltd Unit 1', 'Customers', 4, 'Yes', 25),
(28, 2, 'Trinetra Cement Ltd', 'The India Cement', 'Customers', 5, 'Yes', 25),
(31, 10, 'Jitendra Singh Jhala', '', 'Employees', 8, '', 25),
(32, 10, 'Usha Mali', '', 'Employees', 9, '', 25),
(33, 2, 'Ultratech Cement Limited', 'Unit: Vikram Cement Works', 'Customers', 6, 'Yes', 25),
(35, 14, 'CST Purchases', '', 'Ledger Account', 0, '', 25),
(37, 8, 'Sales Income', '', 'Ledger Account', 0, '', 25),
(38, 2, 'Adani Power Rajasthan Ltd', 'Adani Power Rajasthan Ltd', 'Customers', 7, 'Yes', 25),
(39, 1, 'Shriram Rayons', 'Shriram Rayons', 'Customers', 8, 'Yes', 25),
(40, 2, 'Mangalam Cement Ltd', 'Mangalam Cement Ltd', 'Customers', 9, 'Yes', 25),
(41, 2, 'Sutlej Textiles and Industries Limited', 'Sutlej Textiles and Industries Limited', 'Customers', 10, 'Yes', 25),
(43, 2, 'Ambuja Cements Limited', 'Unit-Rabriyawas', 'Customers', 11, 'Yes', 25),
(44, 10, 'Pushpendra Nath Chauhan', '', 'Employees', 11, '', 25),
(45, 10, 'Vikram Singh ', '', 'Employees', 12, '', 25),
(46, 10, 'Bhopal Singh Jhala', '', 'Employees', 13, '', 25),
(47, 2, 'Hindustan Zinc Ltd.', 'Sindesar Khurd Mine', 'Customers', 12, 'Yes', 25),
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
(75, 11, 'Anshul Mogra', '', 'Employees', 16, '', 25),
(77, 2, 'Maharaja Shree Umaid Mills Ltd', 'Maharaja Shree Umaid Mills Ltd', 'Customers', 40, 'Yes', 25),
(78, 2, 'Banawara Syntex Limited', 'Unit BTM', 'Customers', 41, 'Yes', 25),
(79, 2, 'Udaipur Cement Works Ltd', 'Unit of JK Laxmi Cement', 'Customers', 42, 'Yes', 25),
(80, 2, 'Neyveli Lignite Corporation Limited', 'NLC', 'Customers', 43, 'Yes', 25),
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
(100, 16, 'VAT Paid Purchases', '', 'Ledger Account', 0, '', 25),
(101, 17, 'Purchase Thela Bhada', '', 'Ledger Account', 0, '', 25),
(102, 2, 'J K Tyre & Industries Ltd.', 'J K Tyre & Industries Ltd.', 'Customers', 58, 'Yes', 25),
(103, 17, 'Purchase Freight', '', 'Ledger Account', 0, '', 25),
(104, 17, 'Purchase Other Expenses', '', 'Ledger Account', 0, '', 25),
(105, 18, 'Sales Thela Bhada', '', 'Ledger Account', 0, '', 25),
(106, 18, 'Sales Freight Expenses', '', 'Ledger Account', 0, '', 25),
(107, 52, 'Sales Promotion', '', 'Ledger Account', 0, '', 25),
(108, 52, 'Exhibition & Seminar Expenses', '', 'Ledger Account', 0, '', 25),
(109, 52, 'Guest Entertainment Expenses', '', 'Ledger Account', 0, '', 25),
(111, 52, 'Sales Commission', '', 'Ledger Account', 0, '', 25),
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
(137, 22, 'Interest on OD Limit', '', 'Ledger Account', 0, '', 25),
(138, 22, 'Interest Paid', '', 'Ledger Account', 0, '', 25),
(139, 22, 'Interest on Unsecured Loan', '', 'Ledger Account', 0, '', 25),
(140, 23, 'Interest Received', '', 'Ledger Account', 0, '', 25),
(141, 25, 'Sales Commission Received', '', 'Ledger Account', 0, '', 25),
(142, 24, 'SBBJ STL Bank', '', 'Ledger Account', 0, '', 25),
(145, 24, 'Union Bank of India Bank', '', 'Ledger Account', 0, '', 25),
(146, 24, 'Kotak Mahindra Bank', '', 'Ledger Account', 0, '', 25),
(147, 27, 'ICICI Bank Loan Account', '', 'Ledger Account', 0, '', 25),
(148, 2, 'Birla Corporation Limited', 'Unit-Birla cement Works', 'Customers', 60, 'Yes', 25),
(149, 27, 'HDFC Bank Loan Account', '', 'Ledger Account', 0, '', 25),
(151, 29, 'Plant & Machinery', '', 'Ledger Account', 0, '', 25),
(152, 29, 'Laptop, Computer & Printers', '', 'Ledger Account', 0, '', 25),
(153, 30, 'Office Furniture', '', 'Ledger Account', 0, '', 25),
(155, 30, 'Office Equipment', '', 'Ledger Account', 0, '', 25),
(158, 2, 'Chambal Fertilisers And Chemicals Limited', 'Chambal Fertilisers And Chemicals Limited', 'Customers', 61, 'Yes', 25),
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
(203, 24, 'SBBJ SML Bank', '', 'Ledger Account', 0, '', 26),
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
(368, 2, 'Hindustan Zinc Ltd', 'Rampura Agucha Mines', 'Customers', 83, 'Yes', 25),
(369, 2, 'Dabur India Limited-Alwar Unit', 'Unit-Alwar', 'Customers', 84, 'Yes', 25),
(370, 2, 'Sika India Pvt. Ltd.', 'Sika India Pvt. Ltd.', 'Customers', 85, 'Yes', 25),
(372, 2, 'Nachi Technology India Pvt Ltd ', 'Nachi Technology India Pvt Ltd ', 'Customers', 86, 'Yes', 25),
(374, 2, 'J.K White Cement Works ', 'Unit of JK Cement Ltd. ', 'Customers', 88, 'Yes', 25),
(375, 2, 'Ajanta Polymer (P) lTD.', 'Ajanta Polymer (P) lTD.', 'Customers', 89, 'Yes', 25),
(376, 2, 'Daikin Airconditioning India Pvt. Ltd. ', 'Daikin Airconditioning India Pvt. Ltd. ', 'Customers', 90, 'Yes', 25),
(377, 2, 'Vintage Distillers Ltd.', 'Vintage Distillers Ltd.', 'Customers', 91, 'Yes', 25),
(378, 2, 'Rajshree Pilp And Board Mills Pvt. Ltd.', 'Rajshree Pilp And Board Mills Pvt. Ltd.', 'Customers', 92, 'Yes', 25),
(381, 2, 'Hindustan Zinc Ltd', 'Hydro -I ,Unit II', 'Customers', 95, 'Yes', 25),
(383, 2, 'Rajasthan Rajya Vidhyut Utpadan Ltd', '(Banswara)', 'Customers', 97, 'Yes', 25),
(384, 2, 'Adani Wilmar Ltd.', 'Unit-Bundi', 'Customers', 98, 'Yes', 25),
(385, 2, 'Manglam Cement Limited', 'Manglam Cement Limited', 'Customers', 99, 'Yes', 25),
(387, 2, 'Advantage Oils Pvt. Ltd.', 'Advantage Oils Pvt. Ltd.', 'Customers', 101, 'Yes', 25),
(388, 2, 'Mahesh Edible Oil Industries Ltd.', 'Mahesh Edible Oil Industries Ltd.', 'Customers', 102, 'Yes', 25),
(389, 2, 'ACC Limited', 'Unit-Lakheri Cement  Works', 'Customers', 103, 'Yes', 25),
(390, 2, 'Ruchi Soya Industries Ltd.', 'Ruchi Soya Industries Ltd.', 'Customers', 104, 'Yes', 25),
(391, 2, 'K.S.Oils Limited', 'K.S.Oils Limited', 'Customers', 105, 'Yes', 25),
(394, 2, 'KEI Industries Limited ', 'Kei Industries Limited', 'Customers', 108, 'Yes', 25),
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
(411, 38, 'Provision for Staff Sales Commission', '', 'Ledger Account', 0, '', 25),
(412, 39, 'Lakshmi Enterprises', '', 'Ledger Account', 0, '', 25),
(413, 39, 'Ludhiana Refrigeration', '', 'Ledger Account', 0, '', 25),
(414, 40, 'Security Deposit - Ger Singh', '', 'Ledger Account', 0, '', 25),
(415, 40, 'Security Deposit - Jayanti Jain', '', 'Ledger Account', 0, '', 25),
(416, 40, 'Security Deposit - Anjana Jain', '', 'Ledger Account', 0, '', 25),
(417, 40, 'Security Deposit - Jagdish Salvi', '', 'Ledger Account', 0, '', 25),
(418, 40, 'Security Deposit - Jitendra Jhala', '', 'Ledger Account', 0, '', 25),
(419, 40, 'Security Deposit - Lehari Lal', '', 'Ledger Account', 0, '', 25),
(420, 40, 'Security Deposit - Reena Khandelwal', '', 'Ledger Account', 0, '', 25),
(421, 40, 'Security Deposit - Usha Mali', '', 'Ledger Account', 0, '', 25),
(422, 40, 'Security Deposit - Mukesh Jain', '', 'Ledger Account', 0, '', 25),
(423, 40, 'Security Deposit - Snigdha Bhattacharya', '', 'Ledger Account', 0, '', 25),
(424, 40, 'Security Deposit - Vikram Singh', '', 'Ledger Account', 0, '', 25),
(425, 40, 'Security Deposit - Waheed Khan', '', 'Ledger Account', 0, '', 25),
(426, 40, 'Security Deposit - Ajita Chopra', '', 'Ledger Account', 0, '', 25),
(427, 40, 'Security Deposit - Rajendra Mehta', '', 'Ledger Account', 0, '', 25),
(428, 40, 'Security Deposit - Others', '', 'Ledger Account', 0, '', 25),
(429, 2, 'Shree Cement Limited', '(Shree Mega Power)', 'Customers', 114, 'Yes', 25),
(430, 41, 'Shares - Kandhari Rubbers Ltd.', '', 'Ledger Account', 0, '', 25),
(431, 41, 'Shares - Shilpa Mechtrad Ltd.', '', 'Ledger Account', 0, '', 25),
(432, 41, 'Shares - Sinetron Power Ltd.', '', 'Ledger Account', 0, '', 25),
(433, 29, 'Plant & Machinery', '', 'Ledger Account', 0, '', 25),
(434, 29, 'Vehicles', '', 'Ledger Account', 0, '', 25),
(435, 30, 'Software Accounting', '', 'Ledger Account', 0, '', 25),
(436, 29, 'Auto Battery Operated', '', 'Ledger Account', 0, '', 25),
(437, 44, 'Accrued Depreciation on Computer, Laptop & Printers', '', 'Ledger Account', 0, '', 25),
(438, 44, 'Accrued Depreciation on Furniture & Fixtures', '', 'Ledger Account', 0, '', 25),
(439, 44, 'Accrued Depreciation on Office Equipments', '', 'Ledger Account', 0, '', 25),
(440, 44, 'Accrued Depreciation on Vehicles', '', 'Ledger Account', 0, '', 25),
(441, 49, 'Accrued Depreciation on Accounting Softwares', '', 'Ledger Account', 0, '', 25),
(442, 50, 'Deposit Mobile 97727 04777', '', 'Ledger Account', 0, '', 25),
(443, 50, 'EMD Deposit', '', 'Ledger Account', 0, '', 25),
(444, 50, 'Deposit Office Premises', '', 'Ledger Account', 0, '', 25),
(445, 50, 'Prepaid Insurance', '', 'Ledger Account', 0, '', 25),
(446, 50, 'Deposit - Dealership', '', 'Ledger Account', 0, '', 25),
(447, 50, 'Deposit - Electricity Connection', '', 'Ledger Account', 0, '', 25),
(448, 50, 'Deposit - Others', '', 'Ledger Account', 0, '', 25),
(449, 50, 'Deposit - Telephone', '', 'Ledger Account', 0, '', 25),
(450, 50, 'Deposit - Advance Income tax', '', 'Ledger Account', 0, '', 25),
(451, 51, 'Accrued Interest on FD UBI', '', 'Ledger Account', 0, '', 25),
(452, 51, 'Fixed Deposits UBI', '', 'Ledger Account', 0, '', 25),
(453, 28, 'Petty Cash - B S Jhala', '', 'Ledger Account', 0, '', 25),
(454, 28, 'Petty Cash - Jaya Kuwar', '', 'Ledger Account', 0, '', 25),
(455, 2, 'Raj West Power Limited', 'RWPL', 'Customers', 115, 'Yes', 25),
(456, 2, 'Heavy Water Project Stores', 'Stores Unit', 'Customers', 116, 'Yes', 25),
(457, 2, 'G.D. Foods Mfg.(I) Pvt. Ltd.', 'G.D. Industrial', 'Customers', 117, 'Yes', 25),
(458, 2, 'Jai Maaa Sagra Construction ', 'JMSC', 'Customers', 118, 'Yes', 25),
(459, 2, 'Mark Splendour Nonwovens (P) Limited', 'MSNPL', 'Customers', 119, 'Yes', 25),
(460, 2, 'Binai Cement Ltd.', 'BCL', 'Customers', 120, 'Yes', 25),
(461, 2, 'Bestex MM India Pvt. Ltd. ', 'BIPL', 'Customers', 121, 'Yes', 25),
(462, 2, 'Taya Ceramics Pvt. Ltd. ', 'TCPL', 'Customers', 122, 'Yes', 25),
(463, 2, 'P.I. Industries Ltd.', 'PIIND-Udaipur ', 'Customers', 123, 'Yes', 25),
(465, 10, 'Mukesh Jain ', '', 'Employees', 18, '', 25),
(466, 10, 'Mukesh Jain ', '', 'Employees', 18, '', 26),
(467, 10, 'Mukesh Jain ', '', 'Employees', 18, '', 27),
(468, 2, 'Sodexo Food Solution India Pvt. Ltd', '(Jodhpur)', 'Customers', 93, 'Yes', 25),
(469, 2, 'A.H. Corporation', 'A.H. Corporation', 'Customers', 94, 'Yes', 25),
(470, 2, 'RSPL', ' Sagar Unit II For OBA', 'Customers', 96, 'Yes', 25),
(471, 2, 'Khilari Infrastructure Pvt. Ltd.', 'KIPL', 'Customers', 106, 'Yes', 25),
(472, 2, 'Shriram Cement Works ', 'Shriram Cement Works ', 'Customers', 107, 'Yes', 25),
(473, 2, 'Juneja Wires Pvt. Ltd.', 'Juneja Wires Pvt. Ltd.', 'Customers', 109, 'Yes', 25),
(474, 4, 'SPX Flow Technology Pvt. Ltd.', '', 'Vendors', 1, 'Yes', 25),
(475, 4, 'Mechneers India', '', 'Vendors', 2, 'Yes', 25),
(476, 4, 'Tushaco Pumps Pvt. Ltd. ', '', 'Vendors', 3, 'Yes', 25),
(477, 4, 'Antico Equipment Pvt. Ltd. ', '', 'Vendors', 5, 'Yes', 25),
(478, 4, 'Positive Metering Pumps Pvt. Ltd. ', '', 'Vendors', 6, 'Yes', 25),
(479, 4, 'Darling Pumps Pvt. Ltd. ', '', 'Vendors', 7, 'Yes', 25),
(480, 4, 'Remi Elektrotechnik Limited', '', 'Vendors', 8, 'Yes', 25),
(481, 4, 'Liqtech Industries', '', 'Vendors', 9, 'Yes', 25),
(482, 4, 'Tranter India Pvt. Ltd. ', '', 'Vendors', 10, 'Yes', 25),
(483, 4, 'Filter Concept Pvt. Ltd. ', '', 'Vendors', 11, 'Yes', 25),
(484, 4, 'Remi Sales And Engg. Ltd.', '', 'Vendors', 12, 'Yes', 25),
(485, 10, 'Harshit Patel', '', 'Employees', 7, '', 25),
(486, 37, 'Priya Mogra', '', 'Employees', 17, '', 25),
(487, 5, '14.50', '', 'SaleTaxes', 1, '', 25),
(488, 5, '5.50', '', 'SaleTaxes', 2, '', 25),
(489, 5, '0.00', '', 'SaleTaxes', 3, '', 25),
(490, 5, '2.00', '', 'SaleTaxes', 4, '', 25),
(491, 5, '2', '', 'SaleTaxes', 5, '', 25),
(492, 5, '2', '', 'SaleTaxes', 5, '', 27),
(493, 4, 'ATUL ENTERPRISES', '', 'Vendors', 13, '', 25),
(494, 4, 'ATUL ENTERPRISES', '', 'Vendors', 13, '', 27),
(495, 2, 'Ronak Processors Pvt.Ltd', 'RPPL', 'Customers', 124, 'Yes', 25),
(496, 2, 'Fateh Enviro Engineers Pvt Ltd', 'FEPL', 'Customers', 125, 'Yes', 25),
(497, 2, 'Fateh Enviro Engineers Pvt Ltd', 'FEPL', 'Customers', 125, 'Yes', 26),
(498, 2, 'Fateh Enviro Engineers Pvt Ltd', 'FEPL', 'Customers', 125, 'Yes', 27),
(499, 5, '14.50', '', 'SaleTaxes', 1, '', 26),
(500, 5, '5.50', '', 'SaleTaxes', 2, '', 26),
(501, 5, '0.00', '', 'SaleTaxes', 3, '', 26),
(502, 5, '2.00', '', 'SaleTaxes', 4, '', 26),
(503, 5, '2', '', 'SaleTaxes', 5, '', 26),
(504, 5, '2', '', 'SaleTaxes', 1, '', 27),
(505, 5, '2', '', 'SaleTaxes', 2, '', 27),
(506, 5, '2', '', 'SaleTaxes', 3, '', 27),
(507, 5, '2', '', 'SaleTaxes', 4, '', 27),
(508, 2, 'Reliance Chemotex Industries Limited', 'RCIL', 'Customers', 126, 'Yes', 25),
(509, 2, 'Reliance Chemotex Industries Limited', 'RCIL', 'Customers', 126, 'Yes', 26),
(510, 2, 'Reliance Chemotex Industries Limited', 'RCIL', 'Customers', 126, 'Yes', 27);

-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

CREATE TABLE `logins` (
  `id` int(5) NOT NULL,
  `employee_id` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(13, 16, 'anshul', 'anshul', 'Active'),
(14, 17, 'priyamogra', 'priya', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `material_indents`
--

CREATE TABLE `material_indents` (
  `id` int(10) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_on` date NOT NULL,
  `created_by` int(10) NOT NULL,
  `mi_number` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `material_indent_rows`
--

CREATE TABLE `material_indent_rows` (
  `id` int(10) NOT NULL,
  `material_indent_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `required_quantity` int(10) NOT NULL,
  `processed_quantity` int(10) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Open'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(20, 'UserRights', 'Add');

-- --------------------------------------------------------

--
-- Table structure for table `payment_vouchers`
--

CREATE TABLE `payment_vouchers` (
  `id` int(10) NOT NULL,
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
  `receipt_type` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `petty_cash_receipt_vouchers`
--

CREATE TABLE `petty_cash_receipt_vouchers` (
  `id` int(10) NOT NULL,
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
  `cheque_no` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` int(10) NOT NULL,
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
  `is_exceise_for_customer` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_rows`
--

CREATE TABLE `purchase_order_rows` (
  `id` int(10) NOT NULL,
  `purchase_order_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `processed_quantity` int(5) NOT NULL DEFAULT '0',
  `height` int(3) NOT NULL,
  `pull_status` varchar(20) NOT NULL DEFAULT 'Direct'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` int(11) NOT NULL,
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
  `quotation_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quotations`
--

INSERT INTO `quotations` (`id`, `customer_id`, `customer_address`, `employee_id`, `item_group_id`, `finalisation_date`, `customer_for_attention`, `customer_contact_no`, `enquiry_no`, `subject`, `text`, `additional_note`, `terms_conditions`, `total`, `status`, `company_id`, `qt1`, `qt2`, `qt3`, `qt4`, `created_by`, `edited_by`, `created_on`, `edited_on`, `reason`, `closing_date`, `revision`, `quotation_id`) VALUES
(1, 94, '206, MTN, \r\nNeemach Kheda Main Road, \r\nNeenach Mata Scheme, Dewali, UDAIPUR-313001 (Raj.)', 7, 27, '2017-04-06', 'Mr. Ali Hussain', '9828186876', 'asdas', 'asdas', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'asdasd', 'sadasd', '5250.73', 'Converted Into Sales Order', 25, 'STL', 1, 'BE-3065', '17-18', 16, 0, '2017-04-06', '0000-00-00', '', '0000-00-00', 0, 1),
(2, 94, '206, MTN, \r\nNeemach Kheda Main Road, \r\nNeenach Mata Scheme, Dewali, UDAIPUR-313001 (Raj.)', 7, 27, '2017-04-06', 'Mr. Ali Hussain', '9828186876', 'asdas', 'asdas', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'asdasd', '\r\n					sadasd\r\n				', '5270.73', 'Pending', 25, 'STL', 2, 'BE-3065', '17-18', 16, 0, '2017-04-06', '0000-00-00', '', '0000-00-00', 0, 2),
(3, 125, '206, MTN, \r\nNeemach Kheda Main Road, \r\nNeenach Mata Scheme, Dewali, UDAIPUR-313001 (Raj.)', 7, 27, '2017-04-06', 'Mr. Ali Hussain', '9828186876', 'dfsdf', 'sdfsdf', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'sdfsdf', 'sdfsdf', '55.70', 'Converted Into Sales Order', 26, 'SML', 1, 'BE-3065', '17-18', 16, 0, '2017-04-06', '0000-00-00', '', '0000-00-00', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `quotation_close_reasons`
--

CREATE TABLE `quotation_close_reasons` (
  `id` int(10) NOT NULL,
  `reason` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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

CREATE TABLE `quotation_rows` (
  `id` int(10) NOT NULL,
  `quotation_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `height` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quotation_rows`
--

INSERT INTO `quotation_rows` (`id`, `quotation_id`, `item_id`, `description`, `quantity`, `rate`, `amount`, `height`) VALUES
(1, 1, 556, '<p>asdasdasd</p>', 1, '5250.73', '5250.73', 0),
(2, 2, 556, '<p>asdasdasd</p>', 1, '5250.73', '5250.73', 0),
(3, 2, 577, '<p>zczxczxc</p>', 2, '10.00', '20.00', 0),
(4, 3, 556, '<p>safdsfdsf</p>', 1, '55.70', '55.70', 0);

-- --------------------------------------------------------

--
-- Table structure for table `receipt_vouchers`
--

CREATE TABLE `receipt_vouchers` (
  `id` int(11) NOT NULL,
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
  `advance_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reference_balances`
--

CREATE TABLE `reference_balances` (
  `id` int(25) NOT NULL,
  `ledger_account_id` int(25) NOT NULL,
  `reference_no` varchar(30) NOT NULL,
  `credit` decimal(15,2) NOT NULL,
  `debit` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reference_details`
--

CREATE TABLE `reference_details` (
  `id` int(25) NOT NULL,
  `ledger_account_id` int(25) NOT NULL,
  `receipt_voucher_id` int(25) NOT NULL,
  `payment_voucher_id` int(10) NOT NULL,
  `invoice_id` int(10) NOT NULL,
  `reference_no` varchar(50) NOT NULL,
  `credit` decimal(10,2) NOT NULL,
  `debit` decimal(10,2) NOT NULL,
  `reference_type` varchar(30) NOT NULL,
  `invoice_booking_id` int(10) NOT NULL,
  `credit_note_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales_orders`
--

CREATE TABLE `sales_orders` (
  `id` int(10) NOT NULL,
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
  `job_card_status` varchar(10) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_orders`
--

INSERT INTO `sales_orders` (`id`, `customer_id`, `employee_id`, `customer_address`, `discount_type`, `discount_per`, `discount`, `ed_description`, `exceise_duty`, `total`, `pnf_type`, `pnf_per`, `pnf`, `total_after_pnf`, `additional_note`, `company_id`, `process_status`, `quotation_id`, `transporter_id`, `expected_delivery_date`, `delivery_description`, `documents_courier_id`, `customer_po_no`, `po_date`, `dispatch_name`, `dispatch_mobile`, `dispatch_email`, `dispatch_address`, `road_permit_required`, `form49`, `so1`, `so2`, `so3`, `so4`, `created_by`, `edited_by`, `created_on`, `edited_on`, `edited_on_time`, `created_on_time`, `job_card_status`) VALUES
(1, 125, 7, '206, MTN, \r\nNeemach Kheda Main Road, \r\nNeenach Mata Scheme, Dewali, UDAIPUR-313001 (Raj.)', 0, '0.00', '0.00', '', '0.00', '55.70', 0, '0.00', '0.00', '55.70', '206, MTN, \r\nNeemach Kheda Main Road, \r\nNeenach Mata Scheme, Dewali, UDAIPUR-313001 (Raj.)', 26, 'Pulled From Quotation', 3, 29, '2017-04-06', 'sadasd', 29, 'fdsfsdf', '2017-04-06', 'Asdas', '2342343243', 'sfsdf@erter.yryrty', '206, MTN, \r\nNeemach Kheda Main Road, \r\nNeenach Mata Scheme, Dewali, UDAIPUR-313001 (Raj.)', 'No', 'No', 'SML', 1, 'BE-3065', '17-18', 16, 0, '2017-04-06', '1970-01-01', '', '2017-04-06 06:04:20PM', 'Pending'),
(2, 94, 7, '206, MTN, \r\nNeemach Kheda Main Road, \r\nNeenach Mata Scheme, Dewali, UDAIPUR-313001 (Raj.)', 1, '1.00', '105.37', '', '0.00', '10432.09', 1, '2.00', '208.64', '10640.73', '206, MTN, \r\nNeemach Kheda Main Road, \r\nNeenach Mata Scheme, Dewali, UDAIPUR-313001 (Raj.)', 25, 'Pulled From Quotation', 1, 29, '2017-04-21', 'sdfsdf', 29, 'sf', '2017-04-06', 'Sdfsdf', '4324234234', 'fsfsd@wrwe.reter', '206, MTN, \r\nNeemach Kheda Main Road, \r\nNeenach Mata Scheme, Dewali, UDAIPUR-313001 (Raj.)', 'No', 'No', 'STL', 1, 'BE-3065', '17-18', 16, 16, '2017-04-06', '2017-04-07', '2017-04-07 03:06:31PM', '2017-04-06 06:05:09PM', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_rows`
--

CREATE TABLE `sales_order_rows` (
  `id` int(10) NOT NULL,
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
  `source_type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_order_rows`
--

INSERT INTO `sales_order_rows` (`id`, `sales_order_id`, `item_id`, `description`, `quantity`, `rate`, `amount`, `excise_duty`, `sale_tax_id`, `height`, `processed_quantity`, `source_type`) VALUES
(1, 1, 556, '', 1, '55.70', '55.70', 'Yes', 1, 0, 0, ''),
(3, 2, 556, '<p>sdasdsadsd</p>', 2, '5250.73', '10501.46', 'Yes', 1, 0, 0, ''),
(4, 2, 579, '', 3, '12.00', '36.00', 'Yes', 1, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `sale_taxes`
--

CREATE TABLE `sale_taxes` (
  `id` int(10) NOT NULL,
  `tax_figure` decimal(4,2) NOT NULL,
  `quote_description` varchar(200) NOT NULL,
  `invoice_description` varchar(200) NOT NULL,
  `account_category_id` int(10) NOT NULL,
  `account_group_id` int(10) NOT NULL,
  `account_first_subgroup_id` int(10) NOT NULL,
  `account_second_subgroup_id` int(10) NOT NULL,
  `ledger_account_id` int(10) NOT NULL,
  `freeze` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale_taxes`
--

INSERT INTO `sale_taxes` (`id`, `tax_figure`, `quote_description`, `invoice_description`, `account_category_id`, `account_group_id`, `account_first_subgroup_id`, `account_second_subgroup_id`, `ledger_account_id`, `freeze`) VALUES
(1, '14.50', 'VAT @ 14.50 % or as applicable on date of dispatch', 'VAT @ 14.50 %', 2, 6, 4, 5, 18, 0),
(2, '5.50', 'VAT @ 5.50 % or as applicable on date of dispatch', 'VAT @ 5.50%', 2, 6, 4, 5, 19, 0),
(3, '0.00', 'NIL CST agst C & E1 Form', 'NIL CST agst C & E1 Form', 2, 6, 4, 5, 20, 0),
(4, '2.00', '2% CST against C Form or as applicable on date of dispatch', '2% CST against C Form ', 2, 6, 4, 5, 21, 0),
(5, '2.00', '2 % CST against C & E1 Form', '2 % CST against C & E1 Form', 2, 6, 4, 5, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sale_tax_companies`
--

CREATE TABLE `sale_tax_companies` (
  `sale_taxe_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale_tax_companies`
--

INSERT INTO `sale_tax_companies` (`sale_taxe_id`, `company_id`) VALUES
(1, 25),
(1, 26),
(1, 27),
(2, 25),
(2, 26),
(2, 27),
(3, 25),
(3, 26),
(3, 27),
(4, 25),
(4, 26),
(4, 27),
(5, 25),
(5, 26),
(5, 27);

-- --------------------------------------------------------

--
-- Table structure for table `sources`
--

CREATE TABLE `sources` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `terms_conditions` (
  `id` int(10) NOT NULL,
  `text_line` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `transporters` (
  `id` int(11) NOT NULL,
  `transporter_name` varchar(100) NOT NULL,
  `mobile` bigint(12) NOT NULL,
  `address` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
(30, 'Indian Post ', 2942429222, 'Shastri Circle Udaipur'),
(31, 'Speed Post', 1111111111, '111');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`) VALUES
(1, 'Nos'),
(2, 'Mtrs'),
(3, 'Set'),
(4, 'Ltrs'),
(5, 'Feet'),
(6, 'MM'),
(7, 'Sqr Inch'),
(8, 'Grams'),
(9, 'Sqr MM'),
(10, 'Cms');

-- --------------------------------------------------------

--
-- Table structure for table `user_rights`
--

CREATE TABLE `user_rights` (
  `id` int(10) NOT NULL,
  `login_id` int(10) NOT NULL,
  `page_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(446, 10, 16),
(447, 7, 1),
(448, 7, 2),
(449, 7, 3),
(450, 7, 4),
(451, 7, 5),
(452, 7, 6),
(453, 7, 7),
(454, 7, 8),
(455, 7, 9),
(456, 7, 10),
(457, 7, 11),
(458, 7, 12),
(459, 7, 13),
(460, 7, 14),
(461, 7, 15),
(462, 7, 16),
(463, 7, 17),
(464, 7, 18),
(465, 7, 19),
(466, 7, 20);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(10) NOT NULL,
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
  `account_second_subgroup_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `company_name`, `address`, `tin_no`, `gst_no`, `ecc_no`, `pan_no`, `payment_terms`, `mode_of_payment`, `item_group_id`, `account_category_id`, `account_group_id`, `account_first_subgroup_id`, `account_second_subgroup_id`) VALUES
(1, 'SPX Flow Technology Pvt. Ltd.', 'Survey No. 275, Odhav\r\nAhmedabad - 382415\r\nGujrat - India ', '24575101244', 'U51900GJ1980PTC050281', 'AAACS 7234B/XM/001', 'AAACS7234B', 45, 'NEFT', 1, 2, 6, 2, 4),
(2, 'Mechneers India', '27-A,  Ashwini Marg,\r\n Udaipur  - 313 001  ', '08273902326', '', 'AAVPJ3530BXD001', 'AAVPJ3530b', 7, 'NEFT', 7, 2, 6, 2, 4),
(3, 'Tushaco Pumps Pvt. Ltd. ', 'Plot No. 1,22,23, Sr. No. 653/1, \r\nSomnath Co-op, Ind. Society Ltd., \r\nKachigam Road, Dabhel,  \r\nNani Daman- 396210 ', '25000003930', '', 'AABCT7703KXM001', 'AABCT7703K', 30, 'Cheque', 2, 2, 6, 2, 4),
(5, 'Antico Equipment Pvt. Ltd. ', '119-122 GIDC -ll, Gundlav, \r\nValsad, Gujarat 396035', '24750201713', '', 'AAFCA7145JXM001', 'AAFCA7145', 7, 'NEFT', 5, 2, 6, 2, 4),
(6, 'Positive Metering Pumps Pvt. Ltd. ', 'M- 8, MIDC,\r\nAmbad, NashiK, ', '27960057814C', '', 'AACCP0388DXM001', 'AACCP0388D', 7, 'NEFT', 3, 2, 6, 2, 4),
(7, 'Darling Pumps Pvt. Ltd. ', 'K-No. 340/2 Tigaria Badshah,\r\nNear agarbatti complex, Industrial Estate,\r\nSanwer road, Indore - 452015', '23761100643', '', 'AAACD1664LEM002', 'AAACD1664L', 30, 'NEFT', 4, 2, 6, 2, 4),
(8, 'Remi Elektrotechnik Limited', 'Building A, Survey No. 65/1,\r\nNaikpada, Waliv, Vasai (E), \r\nDist. Palghar - 401 208\r\n Maharashtra ', '27470254557', '', 'AAACR2578PXM002', 'AAACR2578P', 30, 'NEFT', 8, 2, 6, 2, 4),
(9, 'Liqtech Industries', '802, Eastern Majesty \r\nTata Colony, Mulund East \r\nMumbai - 400081 ', '27340701168', '', '-', 'AADFL2020n', 15, 'NEFT', 30, 2, 6, 2, 4),
(10, 'Tranter India Pvt. Ltd. ', 'Gat no.127/128, Dingrajwadi, \r\nTal. Shirur, Pune, \r\nMaharashtra 412208 India \r\n', '27410514065', '', 'AAFCA4598PXM003', 'AAFCA4598P', 15, 'NEFT', 33, 2, 6, 2, 4),
(11, 'Filter Concept Pvt. Ltd. ', '302, Aalin, Opp. Gujarat Vidhyapith, \r\nB/H Jet Airways office, Ashram Road,\r\n Ahmedabad, Gujarat, \r\nIndia, 380014', '24573302855', '', 'AABCF5606MEM002', 'AABCF5606M', 7, 'NEFT', 30, 2, 6, 2, 4),
(12, 'Remi Sales And Engg. Ltd.', '18A/19A, M R Estate, \r\nKanchan Pharma ni Gali.\r\nNr. Aslali Bypass, Aslali-382427\r\nDist. Ahmedabad, Gujarat\r\nPh: 02718-261578\r\n', '24572900001', '-', '-', '-', 7, 'NEFT', 21, 2, 6, 2, 4),
(13, 'ATUL ENTERPRISES', 'Near Swapnalok Cinema,\r\nOutside Hathipole\r\nUdaipur ( Raj ) -313001', '08983901596', '-', '-', '-', 7, 'NEFT', 30, 2, 6, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_companies`
--

CREATE TABLE `vendor_companies` (
  `vendor_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_companies`
--

INSERT INTO `vendor_companies` (`vendor_id`, `company_id`) VALUES
(1, 25),
(2, 25),
(3, 25),
(5, 25),
(6, 25),
(7, 25),
(8, 25),
(9, 25),
(10, 25),
(11, 25),
(12, 25),
(13, 25),
(13, 27);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_contact_persons`
--

CREATE TABLE `vendor_contact_persons` (
  `id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `default_person` int(1) NOT NULL,
  `account_category_id` int(10) NOT NULL,
  `account_group_id` int(10) NOT NULL,
  `account_first_subgroup_id` int(10) NOT NULL,
  `account_second_subgroup_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_contact_persons`
--

INSERT INTO `vendor_contact_persons` (`id`, `vendor_id`, `name`, `email`, `mobile`, `default_person`, `account_category_id`, `account_group_id`, `account_first_subgroup_id`, `account_second_subgroup_id`) VALUES
(3, 1, 'Mayank Gadhavi', 'mayank.gadhavi@spxflow.com', '9909985454', 1, 0, 0, 0, 0),
(4, 1, '', '', '', 0, 0, 0, 0, 0),
(15, 2, 'R.K Sharma', 'mechind@bsnl.in', '9414458419', 1, 0, 0, 0, 0),
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
(43, 11, '', '', '', 0, 0, 0, 0, 0),
(44, 5, 'Alex ', 'sales@anticopumps.co.in', '9909928823', 1, 0, 0, 0, 0),
(45, 5, '', '', '', 0, 0, 0, 0, 0),
(46, 7, 'Rahul Bhadoriya', 'rahul91dppl@gmail.com', '8435037808', 1, 0, 0, 0, 0),
(47, 7, 'Nilesh', 'nileshc1973@gmail.com', '9981992842', 1, 0, 0, 0, 0),
(48, 7, ' Shriniwas Pujari', 'shriniwaspujari6@gmail.com', '9981992859', 1, 0, 0, 0, 0),
(49, 7, '', '', '', 0, 0, 0, 0, 0),
(51, 12, 'chetan shah', 'cishah@remigroup.com', '9824013863', 1, 0, 0, 0, 0),
(52, 12, '', '', '', 0, 0, 0, 0, 0),
(53, 13, 'Yogesh Solanki ', 'north3.rtpl@rathigroup.com', '9829127329', 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vouchers_references`
--

CREATE TABLE `vouchers_references` (
  `id` int(10) NOT NULL,
  `voucher_entity` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `company_id` int(10) NOT NULL,
  `module` varchar(255) NOT NULL,
  `sub_entity` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `voucher_ledger_accounts` (
  `vouchers_reference_id` int(10) NOT NULL,
  `ledger_account_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_categories`
--
ALTER TABLE `account_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_first_subgroups`
--
ALTER TABLE `account_first_subgroups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_groups`
--
ALTER TABLE `account_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_references`
--
ALTER TABLE `account_references`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_second_subgroups`
--
ALTER TABLE `account_second_subgroups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `challans`
--
ALTER TABLE `challans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `challan_rows`
--
ALTER TABLE `challan_rows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_banks`
--
ALTER TABLE `company_banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_groups`
--
ALTER TABLE `company_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contra_vouchers`
--
ALTER TABLE `contra_vouchers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_notes`
--
ALTER TABLE `credit_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_companies`
--
ALTER TABLE `customer_companies`
  ADD PRIMARY KEY (`customer_id`,`company_id`);

--
-- Indexes for table `customer_contacts`
--
ALTER TABLE `customer_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_segs`
--
ALTER TABLE `customer_segs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `debit_notes`
--
ALTER TABLE `debit_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_companies`
--
ALTER TABLE `employee_companies`
  ADD PRIMARY KEY (`employee_id`,`company_id`);

--
-- Indexes for table `employee_contact_persons`
--
ALTER TABLE `employee_contact_persons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filenames`
--
ALTER TABLE `filenames`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `financial_months`
--
ALTER TABLE `financial_months`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `financial_years`
--
ALTER TABLE `financial_years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grns`
--
ALTER TABLE `grns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grn_rows`
--
ALTER TABLE `grn_rows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_vouchers`
--
ALTER TABLE `inventory_vouchers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_voucher_rows`
--
ALTER TABLE `inventory_voucher_rows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_bookings`
--
ALTER TABLE `invoice_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_booking_rows`
--
ALTER TABLE `invoice_booking_rows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_rows`
--
ALTER TABLE `invoice_rows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_companies`
--
ALTER TABLE `item_companies`
  ADD PRIMARY KEY (`item_id`,`company_id`),
  ADD KEY `company_key` (`company_id`);

--
-- Indexes for table `item_groups`
--
ALTER TABLE `item_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_ledgers`
--
ALTER TABLE `item_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_serial_numbers`
--
ALTER TABLE `item_serial_numbers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_sources`
--
ALTER TABLE `item_sources`
  ADD PRIMARY KEY (`item_id`,`source_id`);

--
-- Indexes for table `item_sub_groups`
--
ALTER TABLE `item_sub_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_cards`
--
ALTER TABLE `job_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_card_rows`
--
ALTER TABLE `job_card_rows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal_vouchers`
--
ALTER TABLE `journal_vouchers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal_voucher_rows`
--
ALTER TABLE `journal_voucher_rows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ledgers`
--
ALTER TABLE `ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ledger_accounts`
--
ALTER TABLE `ledger_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `material_indents`
--
ALTER TABLE `material_indents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `material_indent_rows`
--
ALTER TABLE `material_indent_rows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_vouchers`
--
ALTER TABLE `payment_vouchers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `petty_cash_receipt_vouchers`
--
ALTER TABLE `petty_cash_receipt_vouchers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_rows`
--
ALTER TABLE `purchase_order_rows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_close_reasons`
--
ALTER TABLE `quotation_close_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_rows`
--
ALTER TABLE `quotation_rows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receipt_vouchers`
--
ALTER TABLE `receipt_vouchers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reference_balances`
--
ALTER TABLE `reference_balances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reference_details`
--
ALTER TABLE `reference_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_orders`
--
ALTER TABLE `sales_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_order_rows`
--
ALTER TABLE `sales_order_rows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_taxes`
--
ALTER TABLE `sale_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_tax_companies`
--
ALTER TABLE `sale_tax_companies`
  ADD PRIMARY KEY (`sale_taxe_id`,`company_id`);

--
-- Indexes for table `sources`
--
ALTER TABLE `sources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms_conditions`
--
ALTER TABLE `terms_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transporters`
--
ALTER TABLE `transporters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_rights`
--
ALTER TABLE `user_rights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_companies`
--
ALTER TABLE `vendor_companies`
  ADD PRIMARY KEY (`vendor_id`,`company_id`);

--
-- Indexes for table `vendor_contact_persons`
--
ALTER TABLE `vendor_contact_persons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vouchers_references`
--
ALTER TABLE `vouchers_references`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher_ledger_accounts`
--
ALTER TABLE `voucher_ledger_accounts`
  ADD PRIMARY KEY (`vouchers_reference_id`,`ledger_account_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_categories`
--
ALTER TABLE `account_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `account_first_subgroups`
--
ALTER TABLE `account_first_subgroups`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `account_groups`
--
ALTER TABLE `account_groups`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `account_references`
--
ALTER TABLE `account_references`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `account_second_subgroups`
--
ALTER TABLE `account_second_subgroups`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `challans`
--
ALTER TABLE `challans`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `challan_rows`
--
ALTER TABLE `challan_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `company_banks`
--
ALTER TABLE `company_banks`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `company_groups`
--
ALTER TABLE `company_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `contra_vouchers`
--
ALTER TABLE `contra_vouchers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `credit_notes`
--
ALTER TABLE `credit_notes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;
--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=353;
--
-- AUTO_INCREMENT for table `customer_contacts`
--
ALTER TABLE `customer_contacts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=394;
--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `customer_segs`
--
ALTER TABLE `customer_segs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `debit_notes`
--
ALTER TABLE `debit_notes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `employee_contact_persons`
--
ALTER TABLE `employee_contact_persons`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT for table `filenames`
--
ALTER TABLE `filenames`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;
--
-- AUTO_INCREMENT for table `financial_months`
--
ALTER TABLE `financial_months`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;
--
-- AUTO_INCREMENT for table `financial_years`
--
ALTER TABLE `financial_years`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `grns`
--
ALTER TABLE `grns`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `grn_rows`
--
ALTER TABLE `grn_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `inventory_vouchers`
--
ALTER TABLE `inventory_vouchers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `inventory_voucher_rows`
--
ALTER TABLE `inventory_voucher_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice_bookings`
--
ALTER TABLE `invoice_bookings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice_booking_rows`
--
ALTER TABLE `invoice_booking_rows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice_rows`
--
ALTER TABLE `invoice_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1164;
--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `item_groups`
--
ALTER TABLE `item_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `item_ledgers`
--
ALTER TABLE `item_ledgers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `item_serial_numbers`
--
ALTER TABLE `item_serial_numbers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `item_sub_groups`
--
ALTER TABLE `item_sub_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT for table `job_cards`
--
ALTER TABLE `job_cards`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `job_card_rows`
--
ALTER TABLE `job_card_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `journal_vouchers`
--
ALTER TABLE `journal_vouchers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `journal_voucher_rows`
--
ALTER TABLE `journal_voucher_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ledgers`
--
ALTER TABLE `ledgers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ledger_accounts`
--
ALTER TABLE `ledger_accounts`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=511;
--
-- AUTO_INCREMENT for table `logins`
--
ALTER TABLE `logins`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `material_indents`
--
ALTER TABLE `material_indents`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `material_indent_rows`
--
ALTER TABLE `material_indent_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `payment_vouchers`
--
ALTER TABLE `payment_vouchers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `petty_cash_receipt_vouchers`
--
ALTER TABLE `petty_cash_receipt_vouchers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchase_order_rows`
--
ALTER TABLE `purchase_order_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `quotation_close_reasons`
--
ALTER TABLE `quotation_close_reasons`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `quotation_rows`
--
ALTER TABLE `quotation_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `receipt_vouchers`
--
ALTER TABLE `receipt_vouchers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reference_balances`
--
ALTER TABLE `reference_balances`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `reference_details`
--
ALTER TABLE `reference_details`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `sales_orders`
--
ALTER TABLE `sales_orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sales_order_rows`
--
ALTER TABLE `sales_order_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sale_taxes`
--
ALTER TABLE `sale_taxes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sources`
--
ALTER TABLE `sources`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `terms_conditions`
--
ALTER TABLE `terms_conditions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `transporters`
--
ALTER TABLE `transporters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `user_rights`
--
ALTER TABLE `user_rights`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=467;
--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `vendor_contact_persons`
--
ALTER TABLE `vendor_contact_persons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `vouchers_references`
--
ALTER TABLE `vouchers_references`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
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
