-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2017 at 06:10 AM
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
(1, 1, 'Sundry Debtors'),
(2, 1, 'Inventory');

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
(1, 1, 'Current Assets'),
(2, 2, 'Current Liabilities');

-- --------------------------------------------------------

--
-- Table structure for table `account_references`
--

CREATE TABLE `account_references` (
  `id` int(10) NOT NULL,
  `entity_description` varchar(255) NOT NULL,
  `ledger_account_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_references`
--

INSERT INTO `account_references` (`id`, `entity_description`, `ledger_account_id`) VALUES
(1, 'mazole Idia PVT LTD', 64),
(2, 'Invoice Booking Purchase  Account', 65),
(3, 'Fright Account', 66);

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
(1, 1, 'Credit Customers'),
(2, 1, 'Advance Customers');

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
  `lr_no` int(11) NOT NULL,
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
  `ch2` varchar(10) NOT NULL,
  `ch3` varchar(10) NOT NULL,
  `ch4` varchar(10) NOT NULL
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
(25, 'Shilpa Trade Links Pvt Ltd', 'STL', '"A - SQUARE ", 3rd Floor,\r\n1 Shobhagpura, 100 Ft. Road,  \r\nUdaipur - 313011 ( Raj )', 'AACCS0229A', '08743900079', 'AADS0812F', 'sdsfdsgdfhdhdh', '', '02942980435', '8696029999', 'sales@mogragroup.com', 'www.mogragroup.com', 1, 'With Inventory', '5895926279bf0.png'),
(26, 'Shilpa Mechtrad Ltd.', 'SML', '"A - SQUARE",  3rd Floor,\r\n1, Shobhagpura, 100 ft. Road, \r\nUdaipur-313011 ( Rajasthan ) ', 'AAEFF0911B', '08453967799', '', '', '', '02942980435', '8696029999', 'info@mogragroup.com', 'www.mogragroup.com', 1, 'With Inventory', '57fca148376b1.jpg'),
(27, 'Fluid Management & Solutions Llp', 'FMSL', '"A Square ", 3rd Floor,\r\n100 Ft. Road, 1 Shobhagpura,\r\nUdaipur 313011', 'aasspp122', '08766490111', 'aasdh31216', 'ansjkhbvd', 'aassddf55678', '2980435', '8696029999', 'info@mogragroup.com', 'www.mogragroup.com', 1, 'With Inventory', '57fcb8149f735.png');

-- --------------------------------------------------------

--
-- Table structure for table `company_banks`
--

CREATE TABLE `company_banks` (
  `id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `account_no` int(20) NOT NULL,
  `ifsc_code` varchar(100) NOT NULL,
  `default_bank` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_banks`
--

INSERT INTO `company_banks` (`id`, `company_id`, `bank_name`, `branch`, `account_no`, `ifsc_code`, `default_bank`) VALUES
(5, 26, 'test', 'test', 9888888, '988', 1),
(8, 27, 'test', 'test', 7867777, '72', 1),
(9, 25, 'Union Bank of India', 'New Fatehpura Udaipur', 2147483647, 'UBIN0539406', 1);

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
  `ledger_account_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_group_id`, `customer_name`, `alias`, `district_id`, `company_group_id`, `customer_seg_id`, `tin_no`, `gst_no`, `pan_no`, `ecc_no`, `flag`, `employee_id`, `payment_terms`, `mode_of_payment`, `credit_limit`, `transporter_id`, `account_category_id`, `account_group_id`, `account_first_subgroup_id`, `account_second_subgroup_id`, `ledger_account_id`) VALUES
(1, 1, 'BSL LITD', '', 1, 0, 1, '98765432', '', '', '', 0, 2, 7, 'NEFT', 10000000, 1, 1, 1, 1, 1, 5),
(2, 2, 'Sona Processors Pvt Ltd', 'Sona', 1, 0, 1, 'tobe', '', 'tobe', 'tobe', 0, 2, 7, 'NEFT', 100000, 1, 1, 1, 1, 1, 10),
(3, 2, 'Ronak Processors Pvt Ltd', 'Ronak', 1, 0, 1, '08345000780', '', 'AEZPP6677H', '', 0, 2, 7, 'Cheque', 100000, 1, 1, 1, 1, 1, 11);

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
(5, 1, 'PB NO 112\r\nMandal Bhilwara', 1, '', '', 1, 1),
(6, 2, 'PB No 12\r\nMandal Road\r\nBhilwara', 1, '', '', 0, 1),
(7, 3, 'Phase IV RIICO Ind Area\r\nPur Road \r\nBhilwara', 1, '', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_contacts`
--

CREATE TABLE `customer_contacts` (
  `id` int(10) NOT NULL,
  `contact_person` varchar(100) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `default_contact` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_contacts`
--

INSERT INTO `customer_contacts` (`id`, `contact_person`, `customer_id`, `designation`, `telephone`, `email`, `mobile`, `default_contact`) VALUES
(5, 'R BAKLIWAL', 1, 'DGM', '9929998431', 'rbakliwal@bsl.com', '9929998431', 1),
(6, 'Nirmal Shortriya', 2, 'Enggi', '9983247774', 'nirmal@gmail.com', '9983247774', 1),
(7, 'Atul Shah', 3, 'Purchase Executive', '9460578251', 'atul@gmail.com', '9460578251', 1);

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
(1, 'RSWM'),
(2, 'Genral');

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
(1, 'Textile');

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
(2, 'FinanceandAccounts');

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
(2, 'DySalesManager');

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
(1, 'Rajasthan', 'Bhilwara');

-- --------------------------------------------------------

--
-- Table structure for table `email_records`
--

CREATE TABLE `email_records` (
  `id` int(10) NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `send_to` varchar(500) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `bank_name` varchar(40) NOT NULL,
  `branch_name` varchar(40) NOT NULL,
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
(2, 'Jagdish', 'Male', 1, 1, '9983247774', 'jagdish@mogragroup.com', '5873682f85080.png', '61333933354', 'SBBJ', 'SHOBHAGPURA', 'SBBJ0011485', 'Tulsi Ram Salvi\r\nHouse Ho 77 B  Block \r\nOpp. Decent Public School\r\nSector 9 ,Savina\r\n', 'Tulsi Ram Salvi\r\nHouse Ho 77 B  Block \r\nOpp. Decent Public School\r\nSector 9 ,Savina\r\n', '9983247774', '1980-10-07', 'Married', '1979-03-30', 'Lalita Salvi', 2, 'Yes', 'B.SC>', 'MAnikaran Enterprises', '2016-08-24', '2017-02-24', 'B+', 1, 1, 1, 1, 4);

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
(1, 25),
(2, 25),
(2, 27);

-- --------------------------------------------------------

--
-- Table structure for table `employee_contact_persons`
--

CREATE TABLE `employee_contact_persons` (
  `id` int(10) NOT NULL,
  `employee_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` bigint(15) NOT NULL,
  `landline` bigint(15) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `relation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_contact_persons`
--

INSERT INTO `employee_contact_persons` (`id`, `employee_id`, `name`, `mobile`, `landline`, `email`, `relation`) VALUES
(1, 2, 'VIjay', 9983247774, 9983247774, 'vijay@mogragroup.com', 'Freinds'),
(2, 2, 'Harshit', 9983257774, 9983257774, 'harshit@mogragroup.com', 'Freinds');

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
(1, 'BE', 1, 1),
(2, 'BE', 2, 2),
(3, 'BE', 3, 3);

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
(78, 18, '03-2017', 'Open');

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
(18, '2016-04-01', '2017-03-31', 'Open', 25);

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
  `grn2` varchar(10) NOT NULL,
  `grn3` varchar(10) NOT NULL,
  `grn4` varchar(10) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Pending',
  `created_by` int(10) NOT NULL,
  `road_permit_no` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grns`
--

INSERT INTO `grns` (`id`, `vendor_id`, `date_created`, `purchase_order_id`, `company_id`, `grn1`, `grn2`, `grn3`, `grn4`, `status`, `created_by`, `road_permit_no`) VALUES
(1, 1, '2017-01-31', 1, 25, 'STL', '1', 'BE-1', '16-17', 'Invoice-Booked', 1, 'ter'),
(2, 1, '2017-02-05', 1, 25, 'STL', '2', 'BE-1', '16-17', 'Pending', 2, '345678');

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

--
-- Dumping data for table `grn_rows`
--

INSERT INTO `grn_rows` (`id`, `grn_id`, `item_id`, `quantity`, `description`) VALUES
(1, 1, 144, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_vouchers`
--

CREATE TABLE `inventory_vouchers` (
  `id` int(10) NOT NULL,
  `invoice_id` int(10) NOT NULL,
  `iv1` varchar(10) NOT NULL,
  `iv2` varchar(10) NOT NULL,
  `iv3` varchar(10) NOT NULL,
  `iv4` varchar(10) NOT NULL,
  `created_by` int(10) NOT NULL,
  `company_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory_vouchers`
--

INSERT INTO `inventory_vouchers` (`id`, `invoice_id`, `iv1`, `iv2`, `iv3`, `iv4`, `created_by`, `company_id`) VALUES
(1, 5, 'STL', '1', 'BE-1', '16-17', 2, 25);

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
  `inventory_voucher_status` varchar(20) NOT NULL,
  `payment_mode` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `temp_limit`, `customer_id`, `customer_address`, `lr_no`, `terms_conditions`, `discount_type`, `total`, `pnf`, `pnf_type`, `pnf_per`, `total_after_pnf`, `sale_tax_per`, `sale_tax_id`, `sale_tax_amount`, `exceise_duty`, `ed_description`, `fright_amount`, `fright_text`, `grand_total`, `due_payment`, `date_created`, `company_id`, `process_status`, `sales_order_id`, `in1`, `in2`, `in4`, `in3`, `customer_po_no`, `po_date`, `additional_note`, `employee_id`, `created_by`, `transporter_id`, `discount_per`, `discount`, `form47`, `form49`, `status`, `inventory_voucher_status`, `payment_mode`) VALUES
(1, '0.00', 1, 'PB NO 112\r\nMandal Bhilwara', 'werewf', '', 1, '109.76', '0.00', 0, '0.00', '109.76', '14.50', 1, '15.92', '0.00', '', '0.00', '', '125.68', '125.68', '2017-01-31', 25, 'Pulled From Sales-Order', 2, 'STL', 1, '16-17', 'BE-1', 'reg', '2017-01-25', '3rwr', 2, 2, 1, '2.00', '2.24', 'ewf', '', 'Cancel', '', 'New_ref'),
(2, '0.00', 1, 'PB NO 112\r\nMandal Bhilwara', 'v', '', 1, '1097.60', '0.00', 0, '0.00', '1097.60', '14.50', 1, '159.15', '0.00', '', '0.00', '', '1256.75', '1256.75', '2017-01-31', 25, 'Pulled From Sales-Order', 1, 'STL', 2, '16-17', 'BE-1', 'reg', '2017-01-25', 'r', 2, 2, 1, '2.00', '22.40', 'svds', '', '', '', 'New_ref'),
(3, '0.00', 1, 'PB NO 112\r\nMandal Bhilwara', 'fef', '', 1, '109.76', '0.00', 0, '0.00', '109.76', '14.50', 1, '15.92', '0.00', '', '0.00', '', '125.68', '125.68', '2017-01-31', 25, 'Pulled From Sales-Order', 1, 'STL', 3, '16-17', 'BE-1', 'reg', '2017-01-25', '', 2, 2, 1, '2.00', '2.24', 'frvd', '', 'Cancel', '', ''),
(4, '0.00', 2, 'PB No 12\r\nMandal Road\r\nBhilwara', '1234', '', 1, '25200.00', '504.00', 1, '2.00', '25704.00', '5.50', 2, '1413.72', '0.00', '', '0.00', '', '27117.72', '27117.72', '2017-02-04', 25, 'Pulled From Sales-Order', 3, 'STL', 4, '16-17', 'BE-2', '1233', '2017-02-04', 'XYZbeeeeeeeeeeeeeeeeeeeeeeeeeee', 2, 2, 1, '10.00', '2800.00', '', '', '', '', 'Agst_ref'),
(5, '0.00', 1, 'PB NO 112\r\nMandal Bhilwara', '_', '', 1, '83090.65', '1661.81', 1, '2.00', '84752.46', '5.50', 2, '4661.39', '280.65', 'Paid vide inv no 11223 fof spx flow technology of ahmedabd dated 11.2.2015', '150.00', 'Amount of freight paid to gaki courier docket nui\r\n12345693636759 dated 5.2.2017', '89563.85', '89563.85', '2017-02-05', 25, 'Pulled From Sales-Order', 4, 'STL', 5, '16-17', 'BE-1', 'PB 90685 / 14550 / 13', '2017-02-01', 'Direct for payment', 2, 2, 1, '2.00', '1690.00', '', '', '', 'Converted', 'New_ref');

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
  `ib2` varchar(10) NOT NULL,
  `ib3` varchar(10) NOT NULL,
  `ib4` varchar(10) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `due_payment` decimal(15,2) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `supplier_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_bookings`
--

INSERT INTO `invoice_bookings` (`id`, `grn_id`, `invoice_no`, `created_on`, `company_id`, `created_by`, `ib1`, `ib2`, `ib3`, `ib4`, `total`, `due_payment`, `vendor_id`, `supplier_date`) VALUES
(1, 1, 'efwfw', '2017-01-31', 25, 1, 'STL', '1', 'BE-1', '16-17', '44.80', '44.80', 1, '2017-01-25');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_booking_rows`
--

CREATE TABLE `invoice_booking_rows` (
  `id` int(11) NOT NULL,
  `invoice_booking_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `rate` decimal(15,2) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_booking_rows`
--

INSERT INTO `invoice_booking_rows` (`id`, `invoice_booking_id`, `item_id`, `quantity`, `rate`, `amount`, `description`) VALUES
(1, 1, 144, 2, '22.40', '44.8000', 'dc');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_breakups`
--

CREATE TABLE `invoice_breakups` (
  `id` int(10) NOT NULL,
  `invoice_id` int(10) NOT NULL,
  `receipt_voucher_id` int(10) NOT NULL,
  `receipt_amount` int(10) NOT NULL,
  `amount` int(10) NOT NULL
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
  `item_serial_number` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_rows`
--

INSERT INTO `invoice_rows` (`id`, `invoice_id`, `item_id`, `description`, `quantity`, `rate`, `amount`, `height`, `inventory_voucher_status`, `item_serial_number`) VALUES
(1, 1, 144, 'wefef', 1, '112.00', '112.00', 0, 'Pending', ''),
(2, 2, 144, 'wefef', 10, '112.00', '1120.00', 0, 'Pending', ''),
(3, 3, 144, 'wefef', 1, '112.00', '112.00', 0, 'Pending', ''),
(4, 4, 152, 'Dosing Pump Model: ED-01<div>Capacity : 0-6 LPH</div><div>Pressure : 0-4 Kg/Cm2</div><div>Suction /Discharge 1/4" X 1/4"</div><div>MOC</div><div>Liquid End :PP</div><div>Diaphragm :PTEF</div><div>NRV : PP</div><div>Drive : 1 Phase 230V AC</div>', 4, '7000.00', '28000.00', 0, 'Pending', ''),
(8, 5, 145, '<span style="white-space: pre-wrap;">Model&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;KGEN 25n 10 G1 </span><div style="white-space: pre-wrap;">Make &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp; Johnosn&nbsp;&nbsp;&nbsp;&nbsp;</div><div style="white-space: pre-wrap;">Flow 10 m3/ hr        Head 13 Mtrs</div>', 1, '84500.00', '84500.00', 100, 'Pending', '');

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
  `item_sub_group_id` int(10) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `ob_quantity` int(5) NOT NULL,
  `ob_rate` int(10) NOT NULL,
  `ob_value` decimal(15,2) NOT NULL,
  `freeze` tinyint(1) NOT NULL,
  `serial_number_enable` tinyint(1) NOT NULL,
  `source` varchar(30) NOT NULL,
  `minimum_quantity` int(10) NOT NULL,
  `maximum_quantity` int(10) NOT NULL,
  `dynamic_cost` decimal(10,2) NOT NULL,
  `minimum_selling_price_factor` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `alias`, `item_category_id`, `item_group_id`, `item_sub_group_id`, `unit_id`, `ob_quantity`, `ob_rate`, `ob_value`, `freeze`, `serial_number_enable`, `source`, `minimum_quantity`, `maximum_quantity`, `dynamic_cost`, `minimum_selling_price_factor`) VALUES
(144, 'KGEN12B-5', 'KGEN12B-5', 1, 1, 3, 1, 1, 13000, '13000.00', 0, 1, 'Purchessed/Manufactured', 1, 1, '22.40', '1.10'),
(145, 'KGEN25N10', 'KGEN25N10', 1, 1, 2, 1, 1, 70000, '70000.00', 0, 1, 'Purchessed', 1, 1, '70000.00', '1.10'),
(146, 'NSR50', 'NSS50', 1, 4, 7, 1, 1, 50000, '50000.00', 0, 1, 'Assembled', 1, 1, '50000.00', '1.10'),
(147, 'NZK40 25 125', 'NZK40 25 125', 1, 4, 6, 1, 1, 150000, '150000.00', 0, 1, 'Purchessed/Manufactured', 1, 1, '150000.00', '1.10'),
(148, 'RT10', 'RT10', 1, 3, 5, 1, 1, 20000, '20000.00', 0, 1, 'Purchessed', 1, 1, '20000.00', '1.10'),
(149, 'T1 100.1', 'T1 100.1', 1, 3, 4, 1, 1, 30000, '30000.00', 0, 1, 'Purchessed', 1, 1, '30000.00', '1.10'),
(150, 'WR03LM/20', 'WR03LM/20', 2, 5, 8, 1, 1, 150000, '150000.00', 0, 1, 'Manufactured', 1, 1, '150000.00', '1.20'),
(152, 'ED-01', 'ED-01', 1, 7, 11, 1, 1, 6000, '6000.00', 0, 1, 'Purchessed', 1, 1, '6000.00', '1.10'),
(153, 'CN 50 200 G1', 'CN 50 200 G1', 1, 1, 12, 1, 1, 12000, '12000.00', 0, 1, 'Purchessed', 1, 1, '12000.00', '1.10');

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
(1, 'Pump'),
(2, 'Submersible Pump');

-- --------------------------------------------------------

--
-- Table structure for table `item_companies`
--

CREATE TABLE `item_companies` (
  `item_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_companies`
--

INSERT INTO `item_companies` (`item_id`, `company_id`) VALUES
(144, 25),
(144, 26),
(144, 27),
(145, 25),
(145, 26),
(145, 27),
(146, 25),
(146, 26),
(146, 27),
(147, 25),
(147, 26),
(147, 27),
(148, 25),
(148, 26),
(148, 27),
(149, 25),
(149, 26),
(149, 27),
(150, 25),
(150, 26),
(150, 27),
(152, 25),
(152, 26),
(152, 27),
(153, 25);

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
(1, 1, 'Johnson Pump'),
(3, 1, 'Tushaco Pump'),
(4, 1, 'Antico Pump'),
(5, 2, 'Darling Pump'),
(6, 1, 'ALL'),
(7, 1, 'Positive Metering Pump');

-- --------------------------------------------------------

--
-- Table structure for table `item_ledgers`
--

CREATE TABLE `item_ledgers` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `rate` decimal(15,2) NOT NULL,
  `source_model` varchar(100) NOT NULL,
  `source_id` int(10) NOT NULL,
  `in_out` varchar(100) NOT NULL,
  `processed_on` date NOT NULL,
  `company_id` int(11) NOT NULL,
  `rate_updated` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_ledgers`
--

INSERT INTO `item_ledgers` (`id`, `item_id`, `quantity`, `rate`, `source_model`, `source_id`, `in_out`, `processed_on`, `company_id`, `rate_updated`) VALUES
(1, 144, 2, '22.40', 'Grns', 1, 'In', '2017-01-31', 25, 'Yes'),
(3, 144, 10, '125.68', 'Invoices', 2, 'Out', '2017-01-31', 25, ''),
(5, 152, 4, '6779.43', 'Invoices', 4, 'Out', '2017-02-04', 25, ''),
(9, 145, 1, '89563.85', 'Invoices', 5, 'Out', '2017-02-05', 25, '');

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
  `invoice_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_serial_numbers`
--

INSERT INTO `item_serial_numbers` (`id`, `item_id`, `serial_no`, `status`, `grn_id`, `invoice_id`) VALUES
(1, 144, 'g1', 'In', 1, 0),
(2, 144, 'p1', 'In', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_sources`
--

CREATE TABLE `item_sources` (
  `item_id` int(10) NOT NULL,
  `source_id` int(10) NOT NULL
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
(1, 1, 1, 'CN 32 200'),
(2, 1, 1, 'KGEN 25N 10'),
(3, 1, 1, 'KGEN 12B-5'),
(4, 1, 3, 'T1S 100.1'),
(5, 1, 3, 'RT 10'),
(6, 1, 4, 'NZK40 25 125'),
(7, 1, 4, 'NSR 50'),
(8, 2, 5, 'WR03LM/20'),
(9, 0, 0, '4SC/80+'),
(10, 2, 5, '4scr'),
(11, 1, 7, 'Dosing Pump ED-01'),
(12, 1, 1, 'CN 50 200 G1');

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
(1, 2, 25, 'STL', '1', 'BE-1', '16-17', 1, '2017-01-31', 1, 'eff', 'reg', '2017-01-31', 'efe', 'Pending'),
(2, 1, 25, 'STL', '2', 'BE-1', '16-17', 2, '2017-02-05', 1, 'jaipur  on freight paid basis ', 'reg', '2017-02-15', 'wooden box packing  with perfect fitting', 'Pending');

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
(1, 1, 2, 148, 11, 'efef'),
(2, 1, 2, 147, 22, ''),
(12, 2, 3, 144, 1, 'Motorised unit'),
(13, 2, 3, 148, 1, ''),
(14, 2, 3, 152, 1, '');

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

--
-- Dumping data for table `journal_vouchers`
--

INSERT INTO `journal_vouchers` (`id`, `voucher_no`, `created_on`, `transaction_date`, `narration`, `company_id`, `created_by`, `edited_on`, `edited_by`) VALUES
(1, '1', '2017-01-21', '2017-01-21', 'retyujikjnbv', 25, 2, '0000-00-00', 0);

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

--
-- Dumping data for table `journal_voucher_rows`
--

INSERT INTO `journal_voucher_rows` (`id`, `journal_voucher_id`, `ledger_account_id`, `cr_dr`, `amount`) VALUES
(19, 1, 4, 'Dr', 600),
(20, 1, 5, 'Dr', 200),
(21, 1, 6, 'Cr', 800);

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
  `debit` decimal(15,2) NOT NULL,
  `credit` decimal(15,2) NOT NULL,
  `voucher_id` int(10) NOT NULL,
  `voucher_source` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ledgers`
--

INSERT INTO `ledgers` (`id`, `transaction_date`, `ledger_account_id`, `debit`, `credit`, `voucher_id`, `voucher_source`, `company_id`) VALUES
(1, '2017-01-18', 9, '0.00', '50000.00', 1, 'Invoice Booking', 25),
(2, '2017-01-18', 5, '118255.65', '0.00', 1, 'Invoice', 25),
(3, '2017-01-18', 6, '0.00', '14785.65', 1, 'Invoice', 25),
(4, '2017-01-18', 5, '15400.00', '0.00', 1, 'Payment Voucher', 0),
(5, '2017-01-18', 6, '0.00', '15400.00', 1, 'Payment Voucher', 0),
(8, '2017-01-18', 5, '152185.83', '0.00', 2, 'Invoice', 25),
(9, '2017-01-18', 7, '0.00', '7920.82', 2, 'Invoice', 25),
(28, '2017-01-21', 4, '600.00', '0.00', 1, 'Journal Voucher', 0),
(29, '2017-01-21', 5, '200.00', '0.00', 1, 'Journal Voucher', 0),
(30, '2017-01-21', 6, '0.00', '800.00', 1, 'Journal Voucher', 0),
(31, '2017-01-21', 9, '5000.00', '0.00', 2, 'Payment Voucher', 0),
(32, '2017-01-21', 7, '0.00', '5000.00', 2, 'Payment Voucher', 0),
(33, '2017-01-21', 9, '3000.00', '0.00', 3, 'Payment Voucher', 0),
(34, '2017-01-21', 6, '0.00', '3000.00', 3, 'Payment Voucher', 0),
(35, '2017-01-21', 6, '2000.00', '0.00', 1, 'Receipt Voucher', 0),
(36, '2017-01-21', 5, '0.00', '2000.00', 1, 'Receipt Voucher', 0),
(37, '2017-01-21', 6, '5000.00', '0.00', 2, 'Receipt Voucher', 0),
(38, '2017-01-21', 5, '0.00', '5000.00', 2, 'Receipt Voucher', 0),
(39, '2017-01-31', 9, '0.00', '44.80', 1, 'Invoice Booking', 25),
(40, '2017-01-31', 5, '125.68', '0.00', 1, 'Invoice', 25),
(41, '2017-01-31', 6, '0.00', '15.92', 1, 'Invoice', 25),
(42, '2017-01-31', 5, '1256.75', '0.00', 2, 'Invoice', 25),
(43, '2017-01-31', 6, '0.00', '159.15', 2, 'Invoice', 25),
(44, '2017-01-31', 5, '125.68', '0.00', 3, 'Invoice', 25),
(45, '2017-01-31', 6, '0.00', '15.92', 3, 'Invoice', 25),
(46, '2017-02-04', 10, '27117.72', '0.00', 4, 'Invoice', 25),
(47, '2017-02-04', 7, '0.00', '1413.72', 4, 'Invoice', 25),
(54, '2017-02-05', 5, '89563.85', '0.00', 5, 'Invoice', 25),
(55, '2017-02-05', 7, '0.00', '4661.39', 5, 'Invoice', 25),
(56, '2017-02-05', 9, '134.00', '0.00', 1, 'Receipt Voucher', 25),
(57, '2017-02-05', 5, '0.00', '134.00', 1, 'Receipt Voucher', 25);

-- --------------------------------------------------------

--
-- Table structure for table `ledger_accounts`
--

CREATE TABLE `ledger_accounts` (
  `id` int(12) NOT NULL,
  `account_second_subgroup_id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `source_model` varchar(255) NOT NULL,
  `source_id` int(10) NOT NULL,
  `bill_to_bill_account` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ledger_accounts`
--

INSERT INTO `ledger_accounts` (`id`, `account_second_subgroup_id`, `name`, `source_model`, `source_id`, `bill_to_bill_account`) VALUES
(4, 1, 'Jagdish', 'Employees', 2, ''),
(5, 1, 'BSL LITD', 'Customers', 1, ''),
(6, 1, 'SaleTax - 14.5', 'SaleTax', 1, ''),
(7, 1, 'SaleTax - 5.5', 'SaleTax', 2, ''),
(8, 1, 'SaleTax - 2', 'SaleTax', 3, ''),
(9, 1, 'Qwerty', 'Vendors', 1, ''),
(10, 1, 'Sona Processors Pvt Ltd', 'Customers', 2, 'Yes'),
(11, 1, 'Ronak Processors Pvt Ltd', 'Customers', 3, 'Yes');

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
(2, 2, 'jagdish', 'jagdish', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `material_indents`
--

CREATE TABLE `material_indents` (
  `id` int(10) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_on` date NOT NULL,
  `created_by` int(10) NOT NULL,
  `mi_number` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `material_indents`
--

INSERT INTO `material_indents` (`id`, `company_id`, `created_on`, `created_by`, `mi_number`) VALUES
(1, 25, '2017-02-13', 2, '1'),
(2, 25, '2017-02-13', 2, '2');

-- --------------------------------------------------------

--
-- Table structure for table `material_indent_rows`
--

CREATE TABLE `material_indent_rows` (
  `id` int(10) NOT NULL,
  `material_indent_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `required_quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `material_indent_rows`
--

INSERT INTO `material_indent_rows` (`id`, `material_indent_id`, `item_id`, `required_quantity`) VALUES
(3, 2, 144, 3),
(4, 2, 152, 4),
(5, 1, 144, 12),
(6, 1, 145, 5);

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
(4, 'SalesOrders', 'Edit');

-- --------------------------------------------------------

--
-- Table structure for table `payment_breakups`
--

CREATE TABLE `payment_breakups` (
  `id` int(10) NOT NULL,
  `ref_type` varchar(30) NOT NULL,
  `new_ref_no` varchar(100) DEFAULT NULL,
  `invoice_booking_id` int(10) NOT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `payment_voucher_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `po2` varchar(10) NOT NULL,
  `po3` varchar(10) NOT NULL,
  `po4` varchar(10) NOT NULL,
  `discount` decimal(5,2) NOT NULL,
  `discount_per` decimal(5,2) NOT NULL,
  `pnf` decimal(5,2) NOT NULL,
  `pnf_type` varchar(5) NOT NULL,
  `excise_duty` decimal(10,2) NOT NULL,
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
  `sale_tax_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `company_id`, `vendor_id`, `shipping_method`, `shipping_terms`, `delivery_date`, `total`, `terms_conditions`, `po1`, `po2`, `po3`, `po4`, `discount`, `discount_per`, `pnf`, `pnf_type`, `excise_duty`, `descryption`, `grand_total`, `material_to_be_transported`, `delivery`, `lr_to_be_prepared_in_favour_of`, `payment_terms`, `road_permit_form47`, `transporter_id`, `sale_tax_per`, `created_by`, `date_created`, `customer_id`, `discount_type`, `sale_tax_description`) VALUES
(1, 25, 1, '', 0, '1970-01-01', '2000.00', '', 'STL', '1', 'BE-1', '16-17', '10.00', '0.00', '20.00', '%', '0.00', 'Dear Sir,\r\nWith reference to your price list we are pleased to place an order for the following items as per conditions given below.', '0.00', 'eff', '1wedfwef', 'Shilpa Trade Links Pvt Ltd', 'wefwf', 'wefwf', 2, '2.00', 1, '2017-01-31', 1, '%', '2'),
(2, 25, 1, '', 0, '1970-01-01', '16208138.76', '', 'STL', '2', 'BE-1', '16-17', '30.00', '0.00', '0.00', '', '12.50', 'Dear Sir,\r\nWith reference to your price list we are pleased to place an order for the following items as per conditions given below.', '0.00', 'Udaipur', 'Within 4 to 6 weeks', 'Shilpa Trade Links Pvt Ltd', 'Within 30 days', 'Will be provided agst Invoice copy', 1, '2.00', 2, '2017-02-05', 2, '%', '2 % CST against C Form');

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
  `height` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_order_rows`
--

INSERT INTO `purchase_order_rows` (`id`, `purchase_order_id`, `item_id`, `description`, `quantity`, `rate`, `amount`, `processed_quantity`, `height`) VALUES
(1, 1, 144, 'dc', 100, '20.00', '2000.00', 2, 0),
(4, 2, 148, 'RT 10 Pump with Oil seal', 12, '1350678.23', '16208138.76', 0, 0);

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
  `enquiry_no` varchar(50) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `text` text NOT NULL,
  `additional_note` text NOT NULL,
  `terms_conditions` text NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Pending',
  `company_id` int(10) NOT NULL,
  `qt1` varchar(10) NOT NULL,
  `qt2` varchar(10) NOT NULL,
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
(1, 1, 'PB NO 112\r\nMandal Bhilwara', 2, 3, '2017-02-01', 'R BAKLIWAL', '9929998431', 'sdrf', 'er', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'wf', '1. Payment<br>2. Discount<br>', '1232.00', 'Converted Into Sales Order', 25, 'STL', '1', 'BE-1', '16-17', 1, 0, '2017-01-31', '0000-00-00', '', '0000-00-00', 0, 1),
(2, 2, 'PB No 12\r\nMandal Road\r\nBhilwara', 2, 7, '2017-02-04', 'Nirmal Shortriya', '9983247774', 'Enquiry for Dosing Pump', 'Offer for Positive make Dosing Pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'Scope of Supply : Bare Pump', '1. Price : Ex-works Udaipur<br>2. P&amp;F : Extra @ 2%<br>3. Sale Tax Extra<br>4. Excise Duty : Extra or As applicable<br>5. Delivery<br>6. Payment<br>7. Discount<br>8. Freight &amp; Insurance : In byer Account<br>9.  Warranty: Standard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise.  Winding failures is not covered under warranty. <br>10. Validity : <br>', '28000.00', 'Converted Into Sales Order', 25, 'STL', '2', 'BE-2', '16-17', 2, 0, '2017-02-04', '0000-00-00', '', '0000-00-00', 0, 2),
(3, 2, 'PB No 12\r\nMandal Road\r\nBhilwara', 2, 1, '2017-02-23', 'Nirmal Shortriya', '9983247774', 'Your email enquiry dated 3.2.2017', 'Quote for Johnson Pump', 'With reference to above enquiry we being authorised dealer for Johnson pumps are pleased to submit our quote as follows :-', 'We are regular suppliers to your unit and we have been supplied similar units also.', '1. Price : Ex-works Udaipur<br>2. P&amp;F : Extra @ 2%<br>3. Sale Tax Extra<br>4. Excise Duty : Extra or As applicable<br>5. Delivery<br>6. Payment<br>7. Discount<br>8. Freight &amp; Insurance : In byer Account<br>9.  Warranty: Standard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise.  Winding failures is not covered under warranty. <br>10. Validity : <br>', '25000.00', 'Pending', 25, 'STL', '3', 'BE-2', '16-17', 2, 0, '2017-02-05', '0000-00-00', '', '0000-00-00', 0, 3),
(4, 2, 'PB No 12\r\nMandal Road\r\nBhilwara', 2, 1, '2017-02-23', 'Nirmal Shortriya', '9983247774', 'Your email enquiry dated 3.2.2017', 'Quote for Johnson Pump', 'With reference to above enquiry we being authorised dealer for Johnson pumps are pleased to submit our quote as follows :-', 'We are regular suppliers to your unit and we have been supplied similar units also.', '1. Price : Ex-works Udaipur<br>2. P&amp;F : Extra @ 2%<br>3. Sale Tax Extra<br>4. Excise Duty : Extra or As applicable<br>5. Delivery<br>6. Payment<br>7. Discount<br>8. Freight &amp; Insurance : In byer Account<br>9. Validity : <br>', '195000.00', 'Pending', 25, 'STL', '3', 'BE-2', '16-17', 2, 0, '2017-02-05', '0000-00-00', '', '0000-00-00', 1, 3),
(5, 3, 'Phase IV RIICO Ind Area\r\nPur Road \r\nBhilwara', 2, 1, '2017-02-06', 'Atul Shah', '9460578251', 'ENQUIRY FOR cn200 ', 'offer for johnson pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'Scope of Supply', '1. Price : Ex-works Udaipur<br>2. P&amp;F : Extra @ 2%<br>3. Sale Tax Extra<br>4. Excise Duty : Extra or As applicable<br>5. Delivery<br>6. Payment<br>7. Discount<br>8. Freight &amp; Insurance : In byer Account<br>9.  Warranty: Standard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise.  Winding failures is not covered under warranty. <br>10. Validity : <br>', '26800.00', 'Pending', 25, 'STL', '4', 'BE-3', '16-17', 2, 0, '2017-02-06', '0000-00-00', '', '0000-00-00', 0, 5);

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
(1, 'Delivery Period too long'),
(2, 'Price on Higher side'),
(3, 'Customer did not discuss'),
(4, 'Technical specs did not suit'),
(5, 'Wanted other brand only'),
(6, 'Requirement cancelled');

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
(1, 1, 144, 'wefef', 11, '112.00', '1232.00', 0),
(2, 2, 152, 'Dosing Pump Model: ED-01<div>Capacity : 0-6 LPH</div><div>Pressure : 0-4 Kg/Cm2</div><div>Suction /Discharge 1/4" X 1/4"</div><div>MOC</div><div>Liquid End :PP</div><div>Diaphragm :PTEF</div><div>NRV : PP</div><div>Drive : 1 Phase 230V AC</div>', 4, '7000.00', '28000.00', 0),
(3, 3, 144, 'Model&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;KGEN 12b 5 G1 <div>Make &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp; Johnosn&nbsp;&nbsp;&nbsp;&nbsp;</div><div>Flow 10 m3/ hr        Head 13 Mtrs</div><div><br></div>', 2, '12500.00', '25000.00', 0),
(4, 4, 144, 'Model&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;KGEN 12b 5 G1 <div>Make &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp; Johnosn&nbsp;&nbsp;&nbsp;&nbsp;</div><div>Flow 10 m3/ hr        Head 13 Mtrs</div><div><br></div>', 2, '12500.00', '25000.00', 0),
(5, 4, 145, 'KGEN 25 n 10 pump<div>Model&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;KGEN 25n 10 G1 </div><div><span style="background-color: transparent;">Make &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp; Johnosn&nbsp;&nbsp;&nbsp;&nbsp;</span><div>Flow 10 m3/ hr        Head 13 Mtrs</div></div>', 2, '85000.00', '170000.00', 0),
(7, 5, 153, 'Pump Model : CN 50 200 G1<div>Liquid : Clear Water</div><div>Capacitiy : 54 m3 /Hr</div><div>Head :44 Mtr</div><div>Impller Dia : 196 mm</div><div><br></div>', 2, '13400.00', '26800.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `receipt_breakups`
--

CREATE TABLE `receipt_breakups` (
  `id` int(10) NOT NULL,
  `ref_type` varchar(30) NOT NULL,
  `new_ref_no` varchar(100) DEFAULT NULL,
  `invoice_id` int(10) NOT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `receipt_voucher_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

--
-- Dumping data for table `receipt_vouchers`
--

INSERT INTO `receipt_vouchers` (`id`, `voucher_no`, `received_from_id`, `bank_cash_id`, `narration`, `amount`, `created_by`, `created_on`, `payment_mode`, `company_id`, `transaction_date`, `edited_by`, `edited_on`, `cheque_no`, `receipt_type`, `advance_amount`) VALUES
(1, '1', 5, 9, 'cash recd agst advance', '134.00', 2, '2017-02-05', 'NEFT', 25, '2017-02-05', 0, '0000-00-00', '', 'New Ref', '134.00');

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
  `so2` varchar(10) NOT NULL,
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
(1, 1, 2, 'PB NO 112\r\nMandal Bhilwara', 1, '2.00', '24.64', '', '0.00', '0.00', 1, '2.00', '24.15', '1231.51', 'PB NO 112\r\nMandal Bhilwara', 25, 'Pulled From Quotation', 1, 1, '2017-01-31', 'erge', 1, 'reg', '2017-01-25', 'Sfde', '3242423243', 'sfdf@ewfew.wf', 'PB NO 112\r\nMandal Bhilwara', 'Yes', 'No', 'STL', '1', 'BE-1', '16-17', 1, 1, '2017-01-31', '2017-01-31', '2017-01-31 05:49:34PM', '2017-01-31 05:21:47PM', 'Converted'),
(2, 1, 2, 'PB NO 112\r\nMandal Bhilwara', 1, '2.00', '24.64', '', '0.00', '1207.36', 1, '2.00', '24.15', '1231.51', 'PB NO 112\r\nMandal Bhilwara', 25, 'Pulled From Quotation', 1, 1, '2017-01-31', 'erge', 1, 'reg', '2017-01-25', 'Sfde', '3242423243', 'sfdf@ewfew.wf', 'PB NO 112\r\nMandal Bhilwara', 'Yes', 'No', 'STL', '2', 'BE-1', '16-17', 1, 0, '2017-01-31', '1970-01-01', '', '2017-01-31 05:21:48PM', 'Converted'),
(3, 2, 2, 'PB No 12\r\nMandal Road\r\nBhilwara', 1, '10.00', '2800.00', '', '0.00', '25200.00', 1, '2.00', '504.00', '25704.00', 'PB No 12\r\nMandal Road\r\nBhilwara', 25, 'Pulled From Quotation', 2, 1, '2017-02-10', 'Material Must be book to topay basis .', 2, '1233', '2017-02-04', 'Nirmal ', '9983247774', 'nirmal@gmail.com', 'PB No 12\r\nMandal Road\r\nBhilwara', 'No', 'No', 'STL', '3', 'BE-2', '16-17', 2, 0, '2017-02-04', '1970-01-01', '', '2017-02-04 02:33:22PM', 'Pending'),
(4, 1, 2, 'PB NO 112\r\nMandal Bhilwara', 1, '2.00', '3380.00', '', '0.00', '165620.00', 1, '2.00', '3312.40', '168932.40', 'Documents direct delivery', 25, 'New', 0, 1, '2017-02-15', 'Freight Paid Door Delivery. Freight to be charged in invoice', 2, 'PB 90685 / 14550 / 13', '2017-02-01', 'Mr Hemant', '9073098210', 'hemant@gmail.com', 'PB NO 112\r\nMandal Bhilwara', 'No', 'No', 'STL', '4', 'BE-1', '16-17', 2, 0, '2017-02-05', '1970-01-01', '', '2017-02-05 04:11:26PM', 'Pending');

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
(2, 2, 144, 'wefef', 11, '112.00', '1232.00', 'Yes', 1, 0, 1, 'Manufactured'),
(3, 1, 144, 'wefef', 11, '112.00', '1232.00', 'Yes', 1, 0, 11, 'Manufactured'),
(4, 3, 152, 'Dosing Pump Model: ED-01<div>Capacity : 0-6 LPH</div><div>Pressure : 0-4 Kg/Cm2</div><div>Suction /Discharge 1/4" X 1/4"</div><div>MOC</div><div>Liquid End :PP</div><div>Diaphragm :PTEF</div><div>NRV : PP</div><div>Drive : 1 Phase 230V AC</div>', 4, '7000.00', '28000.00', 'No', 2, 0, 4, ''),
(5, 4, 145, '<span style="white-space: pre-wrap;">Model&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;KGEN 25n 10 G1 </span><div style="white-space: pre-wrap;">Make &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp; Johnosn&nbsp;&nbsp;&nbsp;&nbsp;</div><div style="white-space: pre-wrap;">Flow 10 m3/ hr        Head 13 Mtrs</div>', 2, '84500.00', '169000.00', 'Yes', 2, 0, 1, '');

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
(1, '14.50', 'Output VAT', 'VAT @ 14.5%', 1, 1, 1, 1, 6, 0),
(2, '5.50', 'VAT', 'VAT @ 5.5%', 1, 1, 1, 1, 7, 0),
(3, '2.00', 'CST', '2 % CST against C Form', 1, 1, 1, 1, 8, 0);

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
(3, 'Manufactured');

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
(1, 'Price : Ex-works Udaipur'),
(2, 'P&F : Extra @ 2%'),
(3, 'Sale Tax Extra'),
(4, 'Excise Duty : Extra or As applicable'),
(5, 'Delivery'),
(6, 'Payment'),
(7, 'Discount'),
(8, 'Freight & Insurance : In byer Account'),
(9, ' Warranty: Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise.  Winding failures is not covered under warranty. '),
(10, 'Validity : ');

-- --------------------------------------------------------

--
-- Table structure for table `transporters`
--

CREATE TABLE `transporters` (
  `id` int(11) NOT NULL,
  `transporter_name` varchar(100) NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `address` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transporters`
--

INSERT INTO `transporters` (`id`, `transporter_name`, `mobile`, `address`) VALUES
(1, 'Bhati Goods Transport', 9983246667, 'Transport nagar Valicha\r\nUdaipur'),
(2, 'First Flight Courier', 9983245554, 'New Market Delhi gate \r\nUdaipur'),
(4, 'JGTCL', 294592847, 'Madri Industrial area\r\nUdaipur');

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
(2, 'Set');

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
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 1),
(6, 2, 2),
(7, 2, 3),
(8, 2, 4);

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
  `account_second_subgroup_id` int(11) NOT NULL,
  `ledger_account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `company_name`, `address`, `tin_no`, `gst_no`, `ecc_no`, `pan_no`, `payment_terms`, `mode_of_payment`, `item_group_id`, `account_category_id`, `account_group_id`, `account_first_subgroup_id`, `account_second_subgroup_id`, `ledger_account_id`) VALUES
(1, 'Tushaco Pumps Pvt Ltd', 'Nani Daman\r\nGujrat', '11111', '22222', '33333', '55555', 30, 'NEFT', 3, 1, 1, 1, 1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_contact_persons`
--

CREATE TABLE `vendor_contact_persons` (
  `id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` bigint(10) NOT NULL,
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
(2, 1, 'gops', 'gops@gmail.com', 9876543456, 1, 0, 0, 0, 0),
(3, 1, '', '', 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vouchers_references`
--

CREATE TABLE `vouchers_references` (
  `id` int(10) NOT NULL,
  `voucher_entity` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vouchers_references`
--

INSERT INTO `vouchers_references` (`id`, `voucher_entity`, `description`) VALUES
(1, 'PaymentVoucher -> Paid To', 'payment '),
(2, 'PaymentVoucher -> Cash/Bank', 'payment'),
(3, 'Receipt Voucher -> Received From', 'receipt voucher '),
(4, 'Receipt Voucher -> Cash/Bank', 'bnvnb'),
(5, 'Petty Cash Receipt -> Received From', 'bnvnb'),
(6, 'Petty Cash Receipt -> Cash/Bank', 'bnvnb'),
(7, 'Contra Voucher -> Cash/Bank', 'bnvnb'),
(8, 'Contra Voucher -> Cash/Bank', 'bnvnb'),
(9, 'Journal Voucher -> Ledger', 'bnvnb'),
(10, 'Debit Notes -> Sales Account', 'bnvnb'),
(11, 'Debit Notes -> Party ', 'bnvnb'),
(12, 'Credit Notes -> Purchase Account', 'bnvnb'),
(13, 'Credit Notes -> Party ', 'bnvnb');

-- --------------------------------------------------------

--
-- Table structure for table `voucher_ledger_accounts`
--

CREATE TABLE `voucher_ledger_accounts` (
  `vouchers_reference_id` int(10) NOT NULL,
  `ledger_account_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_ledger_accounts`
--

INSERT INTO `voucher_ledger_accounts` (`vouchers_reference_id`, `ledger_account_id`) VALUES
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(9, 4),
(9, 5),
(9, 6),
(9, 7),
(9, 8),
(9, 9),
(12, 4),
(12, 5),
(12, 6),
(12, 7),
(12, 8),
(12, 9),
(13, 4),
(13, 5),
(13, 6),
(13, 7),
(13, 8),
(13, 9);

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
-- Indexes for table `email_records`
--
ALTER TABLE `email_records`
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
-- Indexes for table `invoice_breakups`
--
ALTER TABLE `invoice_breakups`
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
-- Indexes for table `payment_breakups`
--
ALTER TABLE `payment_breakups`
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
-- Indexes for table `receipt_breakups`
--
ALTER TABLE `receipt_breakups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receipt_vouchers`
--
ALTER TABLE `receipt_vouchers`
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
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `account_groups`
--
ALTER TABLE `account_groups`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `account_references`
--
ALTER TABLE `account_references`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `account_second_subgroups`
--
ALTER TABLE `account_second_subgroups`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `customer_contacts`
--
ALTER TABLE `customer_contacts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `customer_segs`
--
ALTER TABLE `customer_segs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `debit_notes`
--
ALTER TABLE `debit_notes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `email_records`
--
ALTER TABLE `email_records`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employee_contact_persons`
--
ALTER TABLE `employee_contact_persons`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `filenames`
--
ALTER TABLE `filenames`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `financial_months`
--
ALTER TABLE `financial_months`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `financial_years`
--
ALTER TABLE `financial_years`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `grns`
--
ALTER TABLE `grns`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `grn_rows`
--
ALTER TABLE `grn_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `inventory_vouchers`
--
ALTER TABLE `inventory_vouchers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `inventory_voucher_rows`
--
ALTER TABLE `inventory_voucher_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `invoice_bookings`
--
ALTER TABLE `invoice_bookings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `invoice_booking_rows`
--
ALTER TABLE `invoice_booking_rows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `invoice_breakups`
--
ALTER TABLE `invoice_breakups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice_rows`
--
ALTER TABLE `invoice_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;
--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `item_groups`
--
ALTER TABLE `item_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `item_ledgers`
--
ALTER TABLE `item_ledgers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `item_serial_numbers`
--
ALTER TABLE `item_serial_numbers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `item_sub_groups`
--
ALTER TABLE `item_sub_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `job_cards`
--
ALTER TABLE `job_cards`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `job_card_rows`
--
ALTER TABLE `job_card_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `journal_vouchers`
--
ALTER TABLE `journal_vouchers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `journal_voucher_rows`
--
ALTER TABLE `journal_voucher_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `ledgers`
--
ALTER TABLE `ledgers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `ledger_accounts`
--
ALTER TABLE `ledger_accounts`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `logins`
--
ALTER TABLE `logins`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `material_indents`
--
ALTER TABLE `material_indents`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `material_indent_rows`
--
ALTER TABLE `material_indent_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `payment_breakups`
--
ALTER TABLE `payment_breakups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `purchase_order_rows`
--
ALTER TABLE `purchase_order_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `quotation_close_reasons`
--
ALTER TABLE `quotation_close_reasons`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `quotation_rows`
--
ALTER TABLE `quotation_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `receipt_breakups`
--
ALTER TABLE `receipt_breakups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `receipt_vouchers`
--
ALTER TABLE `receipt_vouchers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sales_orders`
--
ALTER TABLE `sales_orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sales_order_rows`
--
ALTER TABLE `sales_order_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sale_taxes`
--
ALTER TABLE `sale_taxes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sources`
--
ALTER TABLE `sources`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `terms_conditions`
--
ALTER TABLE `terms_conditions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `transporters`
--
ALTER TABLE `transporters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_rights`
--
ALTER TABLE `user_rights`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `vendor_contact_persons`
--
ALTER TABLE `vendor_contact_persons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vouchers_references`
--
ALTER TABLE `vouchers_references`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
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
