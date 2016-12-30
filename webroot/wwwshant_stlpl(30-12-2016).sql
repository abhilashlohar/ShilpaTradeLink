-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Dec 30, 2016 at 10:23 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `account_first_subgroups`
--

INSERT INTO `account_first_subgroups` (`id`, `account_group_id`, `name`) VALUES
(1, 1, 'Sundry Debtors'),
(2, 2, 'Sundry Creditors'),
(3, 2, 'Duties & Taxes'),
(4, 1, 'Staff Advances');

-- --------------------------------------------------------

--
-- Table structure for table `account_groups`
--

CREATE TABLE IF NOT EXISTS `account_groups` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `account_category_id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `account_groups`
--

INSERT INTO `account_groups` (`id`, `account_category_id`, `name`) VALUES
(1, 1, 'Current Assets'),
(2, 2, 'Current Liabilities'),
(3, 1, 'Fixed Assets'),
(4, 1, 'Misllaneous Assets');

-- --------------------------------------------------------

--
-- Table structure for table `account_references`
--

CREATE TABLE IF NOT EXISTS `account_references` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `entity_description` varchar(255) NOT NULL,
  `ledger_account_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

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

CREATE TABLE IF NOT EXISTS `account_second_subgroups` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `account_first_subgroup_id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `account_second_subgroups`
--

INSERT INTO `account_second_subgroups` (`id`, `account_first_subgroup_id`, `name`) VALUES
(1, 1, 'Trade Debtors'),
(2, 2, 'Trade Creditors'),
(5, 3, 'Sales Tax'),
(6, 4, 'Staff Advances');

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
  `ch4` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `challans`
--

INSERT INTO `challans` (`id`, `customer_id`, `company_id`, `invoice_id`, `invoice_booking_id`, `created_on`, `transporter_id`, `lr_no`, `reference_detail`, `total`, `documents`, `customer_address`, `created_by`, `challan_type`, `challan_for`, `vendor_id`, `vendor_address`, `ch1`, `ch2`, `ch3`, `ch4`) VALUES
(1, 5, 25, 2, 0, '2016-11-25', 1, 10000, 'We sent pump vide our Invoice No. STL/V-355/BE-3331/16-17 dt. 19.11.2016', '2000.00', 'Your returnable Gate Pass sent with Materials\r\n\r\nFOC under warranty Replacement ', 'Bangur Nagar\r\nBeawer 305901 ', 6, 'Non Returnable', '', 0, '', '', '', '', ''),
(2, 3, 27, 4, 0, '2016-12-10', 1, 123, 'Verbal discussion with Mr Mayasnk', '14000.00', 'Direct will be sent', 'Adani Wilmar Ltd,\r\nSilor Road, Kota Jaipur Highway, 323001, Bundi', 1, 'Returnable', '', 0, '', '', '', '', ''),
(3, 3, 25, 3, 0, '2016-12-16', 2, 12321, 'sdvd', '726.00', 'dfvfd', 'Adani Wilmar Ltd,\r\nSilor Road, Kota Jaipur Highway, 323001, Bundi', 2, 'Returnable', '', 0, '', '', '', '', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `challan_rows`
--

INSERT INTO `challan_rows` (`id`, `challan_id`, `item_id`, `description`, `quantity`, `rate`, `amount`) VALUES
(1, 1, 38, 'Coupling Guard', 2, '1000.00', '2000.00'),
(2, 2, 38, 'Mobile number in employee contact person should have 10 digit number validation', 1, '14000.00', '14000.00'),
(3, 3, 40, 'ewfewf', 11, '22.00', '242.00'),
(4, 3, 37, 'sdv', 22, '22.00', '484.00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `alias`, `address`, `pan_no`, `tin_no`, `tan_no`, `cin_no`, `service_tax_no`, `landline_no`, `mobile_no`, `email`, `website`, `company_group_id`, `inventory_status`, `logo`) VALUES
(25, 'Shilpa Trade Links Pvt Ltd', 'STL', '"A - SQUARE ", 3rd Floor,\r\n1 Shobhagpura, 100 Ft. Road,  \r\nUdaipur - 313011 ( Raj )', 'AACCS0229A', '08743900079', 'AADS0812F', 'sdsfdsgdfhdhdh', '', '2980435', '8696029999', 'sales@mogragroup.com', 'www.mogragroup.com', 1, 'With Inventory', '57f8c4058dad8.png'),
(26, 'Shilpa Mechtrad Ltd.', 'SML', '"A - SQUARE",  3rd Floor,\r\n1, Shobhagpura, 100 ft. Road, \r\nUdaipur-313011 ( Rajasthan ) ', 'AAEFF0911B', '08453967799', '', '', '', '02942980435', '8696029999', 'info@mogragroup.com', 'www.mogragroup.com', 1, 'With Inventory', '57fca148376b1.jpg'),
(27, 'Fluid Management & Solutions Llp', 'FMSL', '"A Square ", 3rd Floor,\r\n100 Ft. Road, 1 Shobhagpura,\r\nUdaipur 313011', 'aasspp122', '08766490111', 'aasdh31216', 'ansjkhbvd', 'aassddf55678', '2980435', '8696029999', 'info@mogragroup.com', 'www.mogragroup.com', 1, 'With Inventory', '57fcb8149f735.png');

-- --------------------------------------------------------

--
-- Table structure for table `company_banks`
--

CREATE TABLE IF NOT EXISTS `company_banks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `account_no` int(20) NOT NULL,
  `ifsc_code` varchar(100) NOT NULL,
  `default_bank` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `company_banks`
--

INSERT INTO `company_banks` (`id`, `company_id`, `bank_name`, `branch`, `account_no`, `ifsc_code`, `default_bank`) VALUES
(1, 24, 'Union Bank Of India', 'New Fatehpura', 2147483647, 'UBIN0539406', 1),
(13, 25, 'Union Bank of India', 'New Fatehpura', 2147483647, 'UBIN0539406', 1),
(14, 26, 'SBBJ', 'Shobhagpura', 2147483647, 'SBBJ0011485', 1),
(15, 28, 'Union Bank', 'Fatehpura', 2147483647, 'UBIN0539406', 1),
(17, 27, 'State Bank of Bikaner & Jaipur', 'Shobhagpura', 2147483647, 'SBBJ001485', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `credit_notes`
--

INSERT INTO `credit_notes` (`id`, `voucher_no`, `created_on`, `transaction_date`, `purchase_acc_id`, `payment_mode`, `party_id`, `narration`, `amount`, `company_id`, `created_by`, `edited_by`, `edited_on`, `cheque_no`) VALUES
(1, '', '2016-12-27', '2016-12-28', 4, 'Cheque', 72, 'rdtfxchgjkb', '589.78', 25, 1, 0, '0000-00-00', '67534fghgfh');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_group_id`, `customer_name`, `alias`, `district_id`, `company_group_id`, `customer_seg_id`, `tin_no`, `gst_no`, `pan_no`, `ecc_no`, `flag`, `employee_id`, `payment_terms`, `mode_of_payment`, `credit_limit`, `transporter_id`, `account_category_id`, `account_group_id`, `account_first_subgroup_id`, `account_second_subgroup_id`, `ledger_account_id`) VALUES
(1, 9, 'Jindal Saw Ltd.', 'BHL', 1, 1, 1, '08044052269', '', 'AABCS7280C', 'AABCS7280CEM018', 0, 1, 30, 'NEFT', 85000, 4, 0, 0, 0, 0, 1),
(3, 9, 'Adani Wilmar Limited', 'Bundi', 4, 1, 4, '08592105419', '', 'AABCA8056G', 'AABCA8056GXM004', 0, 3, 30, 'NEFT', 45000, 1, 1, 1, 1, 1, 2),
(4, 9, 'Adani Power Rajasthan Ltd', '', 12, 0, 3, '08932910817', '', 'AACCS229A', 'AACCSO229AXD001', 0, 3, 30, 'NEFT', 15000, 1, 2, 2, 2, 2, 3),
(5, 21, 'Shree Cement Ltd Beawer', '', 3, 1, 2, '08530101044', '', 'AACCS8796G', 'AACCS8796GXM001', 0, 4, 30, 'NEFT', 4000000, 0, 0, 0, 0, 0, 4),
(6, 10, 'Honda Car India Pvt. Ltd.', '', 10, 0, 6, '08280854435', '08280854435', 'AAACH1765Q', 'AAACH1765QXM002', 0, 1, 30, 'NEFT', 500000, 1, 1, 1, 1, 1, 5),
(7, 9, 'Ginni International Ltd.', '', 10, 1, 5, '08570700482', '08570700482', 'AAACG0182E ', 'AAACG0182EXM001', 0, 1, 30, 'NEFT', 500000, 0, 0, 0, 0, 0, 6),
(8, 26, 'Advantage Oils Pvt Ltd', '', 4, 0, 4, '08512807355', '', 'AAMCA0464H', 'AACCSDCDFCCS', 0, 3, 30, 'NEFT', 15, 0, 0, 0, 0, 0, 7),
(9, 28, 'Balkrishna Industries Limited', '', 10, 0, 7, '08470852051', '08470852051', 'AAACB3333J', 'AAACB3333JXM012', 0, 1, 30, 'NEFT', 500000, 0, 0, 0, 0, 0, 8),
(10, 29, 'Acc Limited', '', 4, 0, 2, '08252801090', '', 'AAACT1507C', 'AAACT1507CXM013', 0, 3, 30, 'NEFT', 30, 0, 0, 0, 0, 0, 9),
(11, 24, 'Gipl', '', 13, 0, 8, '08364000780', '08364000780', 'AEZPP6657H', 'AEZPP6657HED002', 0, 2, 1, 'NEFT', 30, 0, 0, 0, 0, 0, 10),
(12, 30, 'Mangalam Cement Limited', '', 5, 1, 2, '08442902696', '', 'AABCM6602Q', 'AABCM6602QXM001', 0, 3, 30, 'NEFT', 15, 0, 0, 0, 0, 0, 11),
(13, 31, 'Oswal Papers', '', 11, 0, 9, '08782152117', '08782152117', 'AAACO2222K', 'AAACO2222KM002', 0, 1, 0, 'NEFT', 10000, 0, 0, 0, 0, 0, 12),
(14, 32, 'Shriram Rayons', '', 5, 0, 5, '08672951700', '', 'AAACD0204C', 'AAACD0204CXM004', 0, 3, 10, 'Cheque', 5, 0, 0, 0, 0, 0, 13),
(15, 32, 'Shriram Cement Ltd', '', 5, 0, 2, '08452101422', '', 'AAACD0097R', 'AAACD0097RXM003', 0, 3, 30, 'NEFT', 15, 0, 0, 0, 0, 0, 14),
(16, 26, 'Mahindra Holidays & Resorts India Limited', '', 13, 0, 12, '08091257429', '', 'AAHSEDITHL', 'AAHSEDITHLXX301', 0, 3, 5, 'Cheque', 0, 0, 0, 0, 0, 0, 15),
(18, 33, 'Cuarzo', '', 13, 0, 10, '08043963320', '', 'AAHFC3351P', 'AAHFC3351PEM001', 0, 5, 7, 'Cheque', 10000, 0, 0, 0, 0, 0, 16),
(19, 21, 'Shree Cement Ltd RAS', '', 15, 1, 2, '08530101044', '', 'AACCS8796G', 'AACCS8796GXM003', 0, 4, 30, 'NEFT', 30, 0, 0, 0, 0, 0, 17),
(20, 11, 'Hindustan Zinc Ltd Chanderia', '', 14, 1, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM005', 0, 4, 30, 'NEFT', 4000000, 0, 0, 0, 0, 0, 18),
(22, 31, 'Rajshree Pulp & Board Mills Pvt.Ltd.', '', 11, 0, 9, '08022252512', '', 'AACCS0222M', 'TobeProvide', 0, 1, 0, 'NEFT', 10000, 0, 0, 0, 0, 0, 19),
(23, 26, 'Nav Durga Services', '', 13, 0, 8, '08403852930', '', 'AJSPR6875P', 'AJSPR6875PX003', 0, 3, 15, 'Cheque', 50000, 0, 0, 0, 0, 0, 20),
(24, 35, 'United Spirits Ltd.', '', 13, 0, 14, '8432101045', '', 'AACCM8043J', 'tobeprovided', 0, 5, 7, 'NEFT', 100000, 0, 0, 0, 0, 0, 21),
(25, 26, 'Ruchi Soya Industries Limited', '', 4, 0, 4, '08071606834', '', 'AAACR2892I', 'AAACR2892IXM017', 0, 3, 15, 'NEFT', 10000, 0, 0, 0, 0, 0, 22),
(26, 34, 'United Breweries Ltd.,', '', 10, 1, 14, '08040853694', '08040853694', 'AACCS', 'Tobeprovide', 0, 1, 30, 'NEFT', 500000, 0, 0, 0, 0, 0, 23),
(27, 11, 'Hindustan Zinc Ltd Agucha ', '', 1, 1, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM002', 0, 4, 30, 'NEFT', 400000, 0, 0, 0, 0, 0, 24),
(28, 26, 'Sulux Phosphate', '', 13, 0, 15, '08773953170', '', 'tobeprovided', 'tobeprovided', 0, 5, 0, 'Cheque', 0, 0, 0, 0, 0, 0, 25),
(30, 36, 'Carlsberg India Pvt. Ltd.,', '', 10, 0, 14, '08020605967', ' 08020605967', 'AAJCS8454J', 'AAJCS8454J', 0, 1, 30, 'NEFT', 500000, 0, 0, 0, 0, 0, 26),
(31, 9, 'Adani Wilmar Ltd', '', 10, 0, 4, '08592105419', '08592105419', 'AABCA8056G', 'AABCA8056GXM004', 0, 1, 30, 'NEFT', 100000, 0, 0, 0, 0, 0, 27),
(32, 26, 'Crown Colour Chem', '', 13, 0, 10, '08663951048', '', 'tobeprovided', 'tobeprovided', 0, 5, 0, 'Cheque', 0, 0, 0, 0, 0, 0, 28),
(33, 19, 'J K White Cement ', '', 20, 1, 2, '08841152305', '', 'AABCJ0355R', 'AABCJ0355RXM004', 0, 4, 30, 'Cheque', 100000, 0, 0, 0, 0, 0, 29),
(34, 37, 'Daikin Airconditioning India Pvt. Ltd.,', '', 10, 0, 16, '08452105399', '08452105399', 'AABCD0971F', 'AABCD0971F', 0, 1, 30, 'NEFT', 100000, 0, 0, 0, 0, 0, 30),
(35, 26, 'Mewar Hitech Engineering Limited', '', 13, 0, 17, '08614003698', '', 'AAFCM3610E', 'AAFCM3610EXM001', 0, 5, 0, 'Cheque', 0, 0, 0, 0, 0, 0, 31),
(36, 13, 'Miraj Multicolor', '', 13, 0, 10, '08364780780', '', 'Aezpp6666H', 'Aezpp6666HXM001', 0, 2, 30, 'NEFT', 500000, 0, 0, 0, 0, 0, 32),
(37, 8, 'Ultratech Cement Ltd', '', 14, 1, 2, ' 08832112853', '', 'AAACL6442L', 'AAACL6442LEM033', 0, 4, 30, 'NEFT', 1500000, 0, 0, 0, 0, 0, 33),
(38, 38, 'Neyveli Lignite Corporation Limited ', '', 21, 1, 3, '08351305980', '', 'AAACN1121C', 'AAACN1121CEM011', 0, 4, 30, 'NEFT', 2000000, 0, 0, 0, 0, 0, 34),
(39, 8, 'Ultratech Cement Limited ', '', 22, 1, 2, ' 22961302649 ', '', 'AAACL6442L', 'AAACL6442LEM029', 0, 4, 30, 'NEFT', 1500000, 0, 0, 0, 0, 0, 35),
(40, 26, 'Jubliant Life Science', '', 23, 0, 14, '08178174422', '', 'AEDGP3278H', 'AEDGP3278HXM001', 0, 2, 30, 'NEFT', 100000, 0, 0, 0, 0, 0, 36),
(41, 8, 'Ultratech Cement Ltd., ', '', 24, 1, 2, ' 23762701822', '', ' AAACL6442L', 'AAACL6442LEM031 ', 0, 1, 30, 'NEFT', 1500000, 0, 0, 0, 0, 0, 37),
(42, 26, 'Golden Drugs Pvt Ltd', '', 13, 1, 19, '08403967099', '', 'tobeprovided', 'AAECG9048BEM001', 0, 5, 15, 'Cheque', 100000, 0, 0, 0, 0, 0, 38),
(43, 8, 'Ambuja Cement Limited', '', 15, 1, 2, '08160101490', '', 'AAACG0569P', 'AAACG0569PXM008', 0, 4, 30, 'NEFT', 1500000, 0, 0, 0, 0, 0, 39),
(44, 26, 'Choksi Heraeus Pvt. Ltd. ', '', 13, 0, 19, '08533901019', '', 'AABCC1753G', 'AABCC1753GXM001', 0, 5, 7, 'Cheque', 50000, 0, 0, 0, 0, 0, 40),
(45, 26, 'Reliance Chemotex Industries Limited', '', 13, 0, 5, '08253904471', '', 'AABCR3739H', 'AABCR3739HXM001', 0, 5, 30, 'Cheque', 100000, 0, 0, 0, 0, 0, 41),
(46, 26, 'Bhansali Engineering Polymers Ltd', '', 13, 0, 19, '08283101440', '', 'AAACB3368H', 'tobeprovided', 0, 5, 7, 'NEFT', 50000, 0, 0, 0, 0, 0, 42),
(47, 39, 'Udaipur Cement Works Ltd.', '', 13, 0, 2, '08134000373', '', 'AAACU8858M', 'AAACU8858MEM001', 0, 5, 30, 'NEFT', 100000, 0, 0, 0, 0, 0, 43),
(48, 26, 'Shree Nurshing Paper & Oil Mill Pvt Ltd', '', 10, 0, 9, 'tobeprovided', '', 'tobeprovided', 'tobeprovided', 0, 5, 0, 'Cheque', 0, 0, 0, 0, 0, 0, 44),
(49, 26, 'A H Corporation', '', 13, 0, 13, '08184003789', '', 'AEDPH2393N', 'AEDPH2393N', 0, 3, 1, 'Cash', 5, 0, 0, 0, 0, 0, 45),
(50, 19, 'Cavendish Industries Limited,		', '', 25, 0, 7, '05015370839', '', 'AAFCC8999J', 'AAFCC8999J', 0, 3, 30, 'NEFT', 60000, 0, 0, 0, 0, 0, 46),
(51, 19, 'J K Cement Mudupur', 'J K Cement', 26, 0, 2, '08841152305', '', 'AABCJ0355R', 'AABCJ0355RXM005', 0, 2, 30, 'NEFT', 45, 1, 1, 1, 1, 1, 47),
(52, 19, 'J.K. Cement', '', 14, 0, 2, '08841152305', 'tobeprovided', 'AABCJ0355R', 'AABCJ0355RXM003', 0, 5, 30, 'NEFT', 100000, 1, 0, 0, 0, 0, 48),
(53, 29, 'Ambuja Cement Limited (W.B.)', '', 27, 0, 2, '19200024219', '', 'AAACG0569P ', ' AAACG0569PXM013 ', 0, 4, 30, 'NEFT', 28, 0, 0, 0, 0, 0, 49),
(54, 26, 'Nachi KG Technology India Private Limited', '', 10, 0, 19, '08200704420', '', 'AADCN9030F', 'AADCN9030FEM001', 0, 1, 7, 'Cheque', 15, 0, 0, 0, 0, 0, 50),
(55, 34, 'United Breweries Ltd.', '', 10, 0, 14, '08040853694', '', 'AACCS', 'Tobeprovide', 0, 1, 30, 'NEFT', 30, 0, 0, 0, 0, 0, 51),
(56, 11, 'Hindustan Zinc Ltd (SK)', '', 17, 0, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM004', 0, 2, 30, 'NEFT', 45, 0, 0, 0, 0, 0, 52),
(57, 26, 'Western Drugs Ltd.', '', 13, 0, 19, '08434000984', '08434000984', 'AAACR8995E', 'AAACR8995EXM001', 0, 1, 7, 'Cheque', 7, 0, 0, 0, 0, 0, 53),
(58, 40, 'Lucid Colloids Ltd', '', 6, 0, 20, '08692652832', '', ' AAACL26738 ', 'ToBeProvided', 0, 4, 15, 'NEFT', 10, 0, 0, 0, 0, 0, 54),
(59, 26, 'Rock Stone Industries', 'Rock', 13, 0, 10, 'tobeprovided', 'tobeprovided', 'tobeprovided', 'tobeprovided', 0, 5, 0, 'Cheque', 0, 1, 0, 0, 0, 0, 55),
(60, 30, 'Birla Corporation Ltd (Chanderia)', 'Chanderia Cement Works', 14, 0, 2, '08761103461', '', 'AABCB2075J', 'AABCB2075JXM011', 0, 2, 30, 'Cheque', 45, 1, 0, 0, 0, 0, 56),
(61, 26, 'Daurala Organics Ltd ', 'Unit II Hyrdo', 28, 0, 19, '08976543219', '', 'AADCC4444H', 'AADCC4444HXM002', 0, 2, 30, 'NEFT', 0, 1, 0, 0, 0, 0, 57),
(62, 19, 'JK Lakshmi Ltd.', 'JK Lakshmi Ltd', 2, 0, 2, '06211707573', '454568979', 'AAACJ6715G', 'AAACJ6715G00014', 0, 4, 30, 'Cheque', 200000, 22, 2, 2, 2, 2, 58),
(63, 26, 'RK Marble', 'RK Marble', 13, 0, 1, 'tobeprovided', 'tobeprovided', 'tobeprovided', 'tobeprovided', 0, 5, 10, 'Cheque', 40000, 10, 2, 2, 2, 2, 59),
(64, 26, 'SABMiller India Limited', 'SABMiller India Limited', 10, 0, 14, '08332202950', '456456465465', 'AAICS2238R', 'AAICS2238R2258', 0, 1, 30, 'Cheque', 100000, 6, 2, 2, 3, 5, 60),
(65, 26, 'AMZOLE INDIA PVT LTD', 'UDR', 13, 0, 19, '083646000780', '', 'AEZPP6657H', 'AEZPP6657HXD001', 0, 2, 0, 'NEFT', 0, 10, 1, 1, 1, 1, 61),
(66, 26, 'Sanjeev Traders', 'Sanjeev Traders', 1, 0, 8, '08421004320', '7879879879', '546546545', '87987987', 0, 1, 7, 'NEFT', 100000, 1, 2, 2, 2, 2, 62),
(67, 26, 'Sanjeev Traders', 'Sanjeev Traders', 1, 0, 8, '08421004320', '', '', '', 0, 1, 20, 'NEFT', 50000, 1, 2, 2, 2, 2, 63),
(68, 26, 'Wonder Cement', 'Wonder Cement', 14, 0, 2, 'tobeprovided', 'tobeprovided', '123098123098123q', '123098123098123asdf', 0, 5, 30, 'Cheque', 4, 1, 2, 2, 3, 5, 68),
(69, 0, 'Scheiber Dynamix Pvt Ltd', 'Mum', 6, 0, 19, '', '', '', '', 0, 4, 30, 'NEFT', 50000, 19, 1, 1, 1, 1, 69),
(70, 0, 'Anshul Mogra', 'Ash', 1, 0, 1, '', '', '', '', 0, 1, 6, 'NEFT', 30, 3, 1, 1, 1, 1, 73);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=133 ;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`id`, `customer_id`, `address`, `district_id`, `telephone`, `mobile`, `transporter_id`, `default_address`) VALUES
(2, 2, 'Aurangabad', 2, '', '', 0, 1),
(8, 7, 'M/s Ginni International Ltd.(Weaving Division)-DENIM\r\nRIICO Industrial Area \r\nNEEMRANA-301705,\r\nDistt: Alwar (Raj.)', 10, '', '', 0, 1),
(10, 9, 'Balkrishna Industries Limited,\r\nSP-923, RIICO Indutrial Area,\r\nPhase-III, BHIWADI-301019,\r\nDistt: Alwar (Raj.)', 1, '', '', 0, 1),
(11, 10, 'ACC Limited, Unit: Lakheri Cement Works, PO-Lakheri, Dist-Bundi, Lakheri-323603', 4, '', '', 0, 1),
(12, 11, 'CHETAK CIRCLE \r\nNEAR GPO\r\nUDAIPUR', 13, '', '', 0, 1),
(13, 12, 'Mangalam Cement Ltd, Aditya Nagar, Morak 326520, District Kota', 5, '', '', 0, 1),
(14, 12, 'Mangalam Cement Ltd, 93, Dashera Scheme, PO Dadabari, Kota 324009', 1, '', '', 0, 0),
(15, 13, 'M/s Oswal Paper Pvt. Ltd.,\r\n(Dalmia Group of Companies)\r\nA-129 (N-1), Road No. 9-D, V.K.I. Area,\r\nJAIPUR-302013 (Raj.)', 10, '', '', 0, 1),
(16, 14, 'Shriram Rayons,\r\nUnit of DCM Shriram Industries,\r\nShriram Nagar, Kota - 324004', 5, '', '', 0, 1),
(17, 15, 'Shriram Cement Works,\r\nA Division of DCM Shriram Ltd\r\nShriram Nagar, Kota 324004\r\n', 5, '', '', 0, 1),
(18, 16, 'Mahindra Holidays & Resorts India Limited\r\nNH 8 Near Indo American School, Balicha 313002', 13, '', '', 0, 1),
(19, 17, 'Cuarzo\r\nVillage Thoor\r\nUdaipur Rajasthan', 13, '', '', 0, 1),
(20, 18, 'Cuarzo\r\nVillage Thoor\r\nUdaipur Rajasthan', 13, '', '', 0, 1),
(23, 20, ' Smelting Complex, PO Putholi Chittorgarh 312021', 14, '', '', 0, 1),
(24, 20, 'Hindustan Zinc Ltd., Chanderia Smelting Complex, PO Putholi Chittorgarh 312021', 14, '', '', 0, 0),
(25, 21, 'Hindustan Zinc Ltd., Chanderia Smelting Complex, PO Putholi Chittorgarh 312021', 14, '', '', 0, 1),
(26, 21, 'Hindustan Zinc Ltd., Chanderia Smelting Complex, PO Putholi Chittorgarh 312021', 14, '', '', 0, 0),
(27, 22, 'FOR RAJSHREE PULP & BOARD MILLS PVT.LTD.\r\n(Dalmia Group of Companies)\r\n\r\nJitendra Singh Shekhawat \r\n(Cell : 099280-38290)\r\nA-129 (N-1), Road No. 9-D,\r\nV.K.I. Area, Jaipur-302013\r\n(Rajasthan) 0141-2330156\r\n\r\n', 11, '', '', 0, 1),
(29, 24, 'United Spirits Ltd\r\nUnit Udaipur\r\nUdaisagar Road MIA\r\nUdaipur-313001, Rajasthan', 13, '', '', 0, 1),
(30, 25, 'Ruchi Soya Industries Ltd\r\nRIICO Industrty Area\r\nGovindpur Bawri, Bundi 323021', 1, '', '', 0, 1),
(31, 26, 'M/s United Breweries Ltd.,\r\nUnit: Chopanki\r\nBlock No. SP 971, RIICO Industrial Area,\r\nCHOPANKI-301019, Distt: Alwar (Raj.)', 10, '', '', 0, 1),
(32, 27, ' Rampura Agucha Mines, P.O. Agucha Dist.: Bhilwara', 1, '', '', 0, 1),
(33, 27, 'Hindustan Zinc Ltd., Rampura Agucha Mines, P.O. Agucha Dist.: Bhilwara', 1, '', '', 0, 0),
(34, 28, 'Sulux Phosphates Ltd\r\nF-64, Mewar Industrial Area\r\nRoad no. 2, Madri\r\nUdaipur-313001', 13, '', '', 0, 1),
(35, 29, 'Sulux Phosphates Ltd\r\nF-64, Mewar Industrial Area\r\nRoad no. 2, Madri\r\nUdaipur-313001', 13, '', '', 0, 1),
(36, 30, 'M/s Carlsberg India Pvt. Ltd.,\r\nPlot# SP to 4 & B5 to 8 Agro Food Park,\r\nMIA (Extension), ALWAR-301030 (Raj.)\r\n', 10, '', '', 0, 1),
(37, 31, 'Adani Wilmar Ltd,\r\nMIA Alwar', 10, '', '', 0, 1),
(38, 32, 'Crown Colour Chem\r\nE-73, Road B,\r\nMewar Industrial area,\r\nUdaipur-313003\r\n', 13, '', '', 0, 1),
(39, 33, ' P.O. Gotan , Distt.: Nagaur-342902', 6, '', '', 0, 1),
(40, 33, '\r\nJ K White Cement Plot No.: 100 2nd Floor, Panchmukhi, Vishwakarma Tower, New Power House Road Jodhpur-342003', 6, '', '', 0, 0),
(41, 34, 'Daikin Air conditioning India Pvt. Ltd.,\r\nSP2-12 to SP2-15 & SP2-24 to SP2-27, RIICO, \r\nNew Industrial Complex (Majrakath)\r\nNEEMRANA-301705, Distt: Alwar (Raj.)', 10, '', '', 0, 1),
(42, 35, 'Mewar Hitech Engineering Limited\r\nHawa Magri Industrial Area,\r\nUdaipur, Rajasthan', 13, '', '', 0, 1),
(43, 36, 'Miraj Multicolor\r\nUdayog Vihar Opp. Old Raj Petro Suker\r\nUdaipur', 13, '', '', 0, 1),
(44, 37, ' Unit: Aditya Birla Cement Works, Adityapuram, Shambhupura, Dist.: Chittorgarh 312622', 14, '', '', 0, 1),
(45, 37, 'Ultratech Cement Ltd., Unit: Aditya Birla Cement Works, Adityapuram, Shambhupura, Dist.: Chittorgarh 312622', 14, '', '', 0, 0),
(46, 38, 'Barsingsar Project, A.O. Building, Barsingsar Bikaner 334402', 21, '', '', 0, 1),
(47, 39, 'Unit: RAWAN Cement Works, Tehsil: SIMGA, PO Grasim Vihar, Village: Rawan Dist.: Balodabazar-Bhatapara Chatishgarh-493196', 22, '', '', 0, 1),
(48, 40, 'MIDC AREA ODANG\r\nOPP. BPCL PETROL PUMP KANPUR', 23, '', '', 0, 1),
(49, 41, 'Unit: Vikram Cement Works, Khor, Tehsil: Jawad, Dist.: Neemuch 458470 MP', 24, '', '', 0, 1),
(50, 41, 'Ultratech Cement Ltd., Unit: Vikram Cement Works, Khor, Tehsil: Jawad, Dist.: Neemuch 458470 MP', 24, '', '', 0, 0),
(51, 42, 'Golden Drugs Pvt ltd\r\nC-155, Mewar Industrial Area, Madri, Udaipur- 313003 Rajasthan', 13, '', '', 0, 1),
(52, 43, ' (Unit: Rabriyawas) Tehsil: Jaitaran Dist. Pali 306709', 3, '', '', 0, 1),
(53, 43, 'Ambuja Cement Ltd.,  21-22, Ganpati Plaza, Bhagat Chauraha, Beawer Rajasthan ', 3, '', '', 0, 0),
(54, 44, 'Choksi Heraeus Pvt. Ltd.\r\nPost Box No. -178\r\nA 195-196, ''F'' road, MIA, Madri\r\nUdaipur- 313003', 13, '', '', 0, 1),
(55, 45, 'Reliance Chemotex Industries Ltd.\r\nVillage- Kanpur, Post Box No. 73, \r\nUdaipur- 313003', 13, '', '', 0, 1),
(56, 46, 'Bhansali Engineering Polymers Ltd.\r\nS.P. 138- 143, \r\nABU ROAD-307026, Dist: sirohi(Raj.)- ', 13, '', '', 0, 1),
(57, 47, 'Udaipur Cement Works Ltd\r\n(Formally J.K. Udaipur udyog Ltd.)\r\nShripati Nagar, P.O. CFA-313021\r\nDist-Udaipur,\r\nRajastha, India', 13, '', '', 0, 1),
(62, 5, 'Bangur Nagar\r\nBeawer 305901 ', 3, '', '', 1, 1),
(63, 5, 'Shree Cement Ltd., Bangur Nagar\r\nBeawer 305901 ', 3, '', '', 1, 0),
(65, 23, 'M/s Nav Durga Services\r\n10 B Jai Shree Colony\r\nThokar Circle\r\nUdaipur 313001', 13, '', '', 1, 1),
(67, 48, 'Near United Spirits,\r\nMatsya Industrial Area,\r\nAlwar', 10, '', '', 0, 1),
(68, 19, 'Bangur City\r\nP.O. RAS, Tehsil : Jaitaran Dist.: Pali 306107 ', 3, '', '', 1, 1),
(69, 19, 'Shree Cement Ltd., Bangur Nagar\r\nBeawer 305901 ', 3, '', '', 1, 0),
(70, 49, 'Opp. Galaxy Apartment, Saifan Road,\r\nFatehpura, Udaipur 313002', 13, '', '', 0, 1),
(74, 50, 'Laksar Tyre Plant 2\r\nVill KHEDIMUBARAKPUR 247663 Teh Laksar Dist Haridwar Uttarakhand', 25, '', '', 1, 1),
(78, 53, 'SANKRAIL Jaladhulagori, Vill & P.O. Dhulagori, P.S. Sankrail,Dist.Howrah, SANKRAIL PIN : 711302 West Bengal ', 27, '', '', 1, 1),
(79, 54, 'SP-86, NIC (M) NEEMRANA, RIICO Industrial Area Alwar (Raj.)\r\n', 10, '', '', 0, 1),
(80, 55, 'PLOT NO. SP3-3A RIICO INDUSTRIAL AREA NH-8 SHAHJAHANPUR', 10, '', '', 0, 1),
(81, 56, 'SK Mines \r\nRajpura Dariba', 17, '', '', 0, 1),
(82, 57, 'F-271 M.I.A. Madri | Udaipur-313003 | Rajasthan |\r\n', 13, '', '', 0, 1),
(83, 8, 'NH 12 Ramganj Balaji Bundi 323001 Rajasthan', 4, '', '', 1, 1),
(84, 58, 'B/5-7, MIA Basni,\r\nPhase-I,\r\nJODHPUR-342005 (Raj.)', 6, '', '', 0, 1),
(92, 59, 'F-123, fatehpura, udaipur', 13, '', '', 1, 1),
(107, 60, 'Chanderia Cement Work\r\nMadhav Nagar \r\nP.O. Cement Factory Chittorgarh', 14, '', '', 1, 1),
(110, 61, 'Lane No 76, Rajendra Palace,\r\nNew Delhi', 28, '', '', 1, 1),
(111, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 1, '', '', 1, 1),
(112, 1, 'M/s Jindal Saw Limited,     \r\nAraji No. 9697/6711, Near Tiranga Hills,\r\nVill.: PUR-311802,\r\nDistt: Bhilwara (Raj.)\r\n', 1, '', '', 1, 0),
(113, 1, 'M/s Jindal Saw Limited,\r\nNear Krishi Vigyan Kendra,\r\nMahaveer Colony, Gandhi Nagar,\r\nBHILWARA-311001	\r\n', 1, '', '', 1, 0),
(115, 51, 'Village- Muddapur, Taluk- District- Bhagalkot, Mudhol, Karnataka 587313\r\n', 26, '', '', 1, 1),
(116, 62, 'JK Lakshmi Cement Ltd., AAC\r\nAAC Blocks Unit\r\nJHARLI-124106 Distt: Jhajjar (Haryana)', 2, '', '', 0, 1),
(117, 63, '12, Udyog Vihar, Udaipur', 13, '', '', 0, 1),
(118, 64, 'SP2-3, RIICO Industrial Area NH-8 teh.: Behror Vill.: NEEMRANA-301705 Distt: Alwar (raj.)', 10, '', '', 0, 1),
(119, 65, '41 Udhyog Vihar\r\nSuker\r\nUdaipur', 13, '', '', 0, 1),
(120, 66, '7 J 4, RC Vyas Colony Bhilwara (Raj.)', 1, '', '', 0, 1),
(121, 67, '7 J 4, RC Vyas Colony,\r\nBhilwara', 1, '', '', 0, 1),
(123, 68, 'Wonder Cement, Nimbaheda', 14, '', '', 0, 1),
(124, 52, 'JK Cement works Mangarol\r\nUnit of J.K. cxement Ltd\r\nKaulash Nagar, Nimbaheda- 312617 dist.: chittorgarh', 14, '', '', 1, 1),
(126, 69, '"Scheiber House", 2 Cama Road,\r\nNear Industrial Estate,\r\nMumbai -3  ( Maharastra )', 1, '', '', 1, 1),
(129, 4, 'NH 90, Atru Road, Village Kawai, Taluka Atru, Baran 325 219, Rajasthan, India', 1, '', '', 1, 1),
(130, 6, 'M/s Honda Cars India Ltd.,\r\nSPL-1, Tapukara Industrial Area,\r\nKHUSHKHERA-301707, Distt: Alwar (Raj.)', 10, '', '', 1, 1),
(131, 3, 'Adani Wilmar Ltd,\r\nSilor Road, Kota Jaipur Highway, 323001, Bundi', 4, '', '', 1, 1),
(132, 70, 'shobhagpura', 1, '', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_contacts`
--

CREATE TABLE IF NOT EXISTS `customer_contacts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `contact_person` varchar(100) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `default_contact` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=131 ;

--
-- Dumping data for table `customer_contacts`
--

INSERT INTO `customer_contacts` (`id`, `contact_person`, `customer_id`, `designation`, `telephone`, `email`, `mobile`, `default_contact`) VALUES
(2, 'Pradeep Gupta', 2, 'purchase Executive', '9999999999', '', '2147483647', 1),
(8, 'D K Jain', 7, 'GM Purchase', '0149424611', '', '2147483647', 1),
(10, 'Anurag jain', 9, 'AGM Purchase', '8058012345', '', '2147483647', 1),
(11, 'Pankaj Kumar', 10, 'Purchase Manager', '0743826158', '', '2147483647', 1),
(12, 'AJAY', 11, 'PURCHASE EXECUTIVE', '0294248603', '', '2147483647', 1),
(13, 'Vipesh Gupta', 12, 'GM - Purchase', '0745923281', '', '2147483647', 1),
(14, 'Sushil Dalmia', 13, 'Owner', '0141330156', '', '2147483647', 1),
(15, 'Anand Raju', 14, 'Purchase', '0744248000', '', '2147483647', 1),
(16, 'Nitin Paliwal', 15, 'Purchase Manager', '0744248099', '', '2147483647', 1),
(17, 'Sandeep Sharma', 16, 'Purchase Supervisor', '8696018770', '', '2147483647', 1),
(18, 'hemant joshi', 17, 'purchase', '9982887555', '', '2147483647', 1),
(19, 'hemant joshi', 18, 'purchase', '9982887555', '', '2147483647', 1),
(21, 'PC Pareek', 20, 'Manager Purchase', '0147226547', '', '2147483647', 1),
(22, 'PC Pareek', 21, 'Manager Purchase', '0147226547', '', '2147483647', 1),
(23, 'Sushil Dalmia', 22, 'Owner', '0141233015', '', '2147483647', 1),
(25, 'Mr Bhawesh Pandya', 24, 'fermentation process', '7742200666', '', '2147483647', 1),
(26, 'Sandeep Pandya', 25, 'Purchase Executive', '0744220879', '', '2147483647', 1),
(27, 'Nitin Jain', 26, 'Dy Manager Purchase', '0149351231', '', '2147483647', 1),
(28, 'Rupesh Jain', 27, 'Asst. Purchase Manager', '0148324518', '', '2147483647', 1),
(29, 'Mr Nikunj Jethaliya', 28, 'G.M.', '9829041408', '', '2147483647', 1),
(30, 'Mr Nikunj Jethaliya', 29, 'G.M.', '9829041408', '', '2147483647', 1),
(31, 'Anshul Kumar', 30, 'Purchase', '9887555388', '', '2147483647', 1),
(32, 'Imran Ali', 31, 'Purchase', '7665006863', '', '2147483647', 1),
(33, 'Mr Attarwala  Ji', 32, 'owner', '9828360939', '', '2147483647', 1),
(34, 'Sumit Arora', 33, 'Manager Purchase', '0159123020', '', '2147483647', 1),
(35, 'Mukesh Sharma', 34, 'Utility', '1494671110', '', '2147483647', 1),
(36, 'SKS Rathore', 35, 'purchase', '9829301688', '', '2147483647', 1),
(37, 'Mr. Ranveer Singh', 36, 'Project Manager', '0294241841', '', '2147483647', 1),
(38, 'Mr. N.K Paliwal', 36, 'Account Manager', '0294241841', '', '2147483647', 0),
(39, 'Mr. Jayant Kumar', 36, 'Store Incharge', '0294241842', '', '2147483647', 0),
(40, 'Satish Sukla ', 37, 'Asst. Manager Purchase', '0147225678', '', '2147483647', 1),
(41, 'Stores', 38, 'DGM', '0151284757', '', '1512847574', 1),
(42, 'Jivan Agarwal', 39, 'Manager Purchase', '7726288217', '', '2147483647', 1),
(43, 'MR. PANKAJ JHA', 40, 'PURCHASE EXECUTIVE', '0222487878', '', '993243244', 1),
(44, 'Hari Maloo', 41, 'Manager Purchase', '0742023052', '', '2147483647', 1),
(45, 'Gulshan jain', 42, 'Director', '0294249041', '', '2147483647', 1),
(46, 'Sanjay Jain', 43, 'Asst. Manager Purchase', '9460477877', '', '2147483647', 1),
(47, 'Santosh sharma ', 44, 'logistics', '0294249002', '', '2147483647', 1),
(48, 'S.K.Verdia', 45, ' Purchase', '0294249048', '', '2147483647', 1),
(49, 'G.N.Raut', 46, 'mechanical', '8003193301', '', '2147483647', 1),
(50, 'Rahul jain', 47, 'purchase', '7728886069', '', '2147483647', 1),
(56, 'Vivek Saxena', 5, 'Asst. Manager purchase', '0908078989', '', '2147483647', 1),
(58, 'Gopal Singh', 23, 'Director', '9799480639', '', '9823499887', 1),
(60, 'Mr. Bhutoria Ji', 48, 'M.D.', '9414016458', '', '9414016458', 1),
(61, 'Vivek Saxena ', 19, 'Asst. purchase Manager', '6758696956', '', '2147483647', 1),
(62, 'Navneet', 19, 'Asst. Purchase Manager', '9251077025', '', '9251077025', 0),
(63, 'Ali Hussain', 49, 'Director', '9828186876', '', '9828186876', 1),
(67, 'Vineet Dixit', 50, 'Purchase', '0891200027', '', '8912000274', 1),
(71, 'Sanjay Paul', 53, 'Asst. Manager Purchase', '0336608710', '', '9674742088', 1),
(72, 'Sachin Sharma', 54, 'Purchaseer', '294', '', '7073720222', 1),
(73, 'ASHUTOSH SINGH', 55, 'Manager Mechenical', '9057904835', '', '9672993517', 1),
(74, 'Mr. Tamil selvan', 56, 'Electrical Engineer', '9983247774', '', '9983247774', 1),
(75, 'Santosh Shrivastav', 57, 'Purchase Executive', '9001999743', '', '9001999743', 1),
(76, 'Yusuf Ansari', 8, 'Purchase', '7475130021', '', '7475130021', 1),
(77, 'Bharat Goyal', 58, 'Asst.  Sales Manager', '0291272021', '', '9314760025', 1),
(82, 'A.H. Rangwala Sir', 59, 'M.D.', '0980980980', '', '9898989898', 1),
(98, 'NIKHIL SHARDA', 60, 'Purchase Executive', '0147225945', '', '9983247774', 1),
(99, 'K G Badhera', 60, 'Purchase Executive', '0147225663', '', '9983247775', 1),
(102, 'Ajay Kumar Mehta', 61, 'Purchase Excutive', '0112387123', '', '9983247774', 1),
(103, 'Satpal Marwah', 1, 'Dy. Manager', '0114502120', '', '9829043534', 1),
(104, 'Abhishek Sharma', 1, 'Purchase Executive', '8003698108', '', '8003698108', 0),
(107, 'SUJOY KUMAR', 51, 'MANAGER PURCHASE', '9983247774', '', '9983247774', 1),
(108, 'Rama shankar', 62, 'purchaser', '0294255255', 'j.jhala@yahoo.com', '9785177828', 1),
(109, 'vijay', 63, 'purchase ', '0987987987', 'vijay.gohil5@gmail.com', '9879879879', 1),
(110, 'Ram ji', 64, 'purchase', '0294', 'j.jhala@yahoo.com', '9785177828', 1),
(111, 'MR. Kulveer Singh', 65, 'Managing Director', '0294244004', 'ksmatharu@amzole.com', '9829040764', 1),
(112, 'Sanjeev ', 66, 'owner', '9785177828', 'sanjeev@gmail.com', '9785177828', 1),
(113, 'Sanjeev Parikh', 67, 'Director', '9351734430', 'sanjeevtradersbhl@gmail.com', '9351734430', 1),
(116, 'vishnu sharma', 68, 'purchaser', '0294123123', 'vishnu@wondercement.com', '9828948823', 1),
(117, 'Prem Prakash Ji', 52, 'mechanical', '01477', 'fdgdf@erter.reter', '9672861663', 1),
(120, 'Amit Kulkarni', 69, 'Purchase Manager', '0222789045', 'amit@scheiber.com', '9806548259', 1),
(121, 'Yogesh Shah', 69, 'Asstt Purchase Manager', '0223456789', 'yogesh@scheiber.com', '9375652846', 0),
(126, 'Sanjay Jain', 4, 'Asst Manager techno commercial', '0792578663', 'sdfg@wergf.wqert', '2147483647', 1),
(127, 'Arun sharma', 6, 'Purchase Manager', '0149225056', 'honda@gail.com', '2147483647', 1),
(128, 'Sachin kanungo', 3, 'Purchase Manager', '7472446647', 'pnc@mogragroup.com', '9008754873', 1),
(129, 'Sachin Solanki', 3, 'Purchase Executive', '7472446647', 'bundi@adani.com', '2345091274', 0),
(130, 'ansh', 70, 'dirctor', '23957656', 'ansh@mogra.om', '9876512340', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE IF NOT EXISTS `customer_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `name`) VALUES
(9, 'Adani Group'),
(10, 'Honda Group'),
(11, 'VEDANTA'),
(12, 'RK MARBLE'),
(13, 'MIRAJ '),
(16, 'SANGAM'),
(19, 'J.K.'),
(20, 'LAFARZ'),
(21, 'Shree Cement Ltd'),
(22, 'JINDAL'),
(23, 'RELIANCE'),
(24, 'CONTRACTURE'),
(26, 'General'),
(27, 'Ginni International '),
(28, 'BKT'),
(29, 'AMBUJA'),
(30, 'B K Birla Group'),
(31, 'Dalmia Group of Companies '),
(32, 'DCM Group'),
(33, 'Nahar Colour'),
(34, 'UB Group'),
(35, 'DIAGEO Group Company'),
(36, 'Carlsberg '),
(37, 'Daikin'),
(38, 'Neyveli Lignite'),
(39, 'J.K.Lakshmi'),
(40, 'Lucid'),
(41, 'Saras ');

-- --------------------------------------------------------

--
-- Table structure for table `customer_segs`
--

CREATE TABLE IF NOT EXISTS `customer_segs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `customer_segs`
--

INSERT INTO `customer_segs` (`id`, `name`) VALUES
(1, 'Metal And Mines'),
(2, 'Cement'),
(3, 'Power'),
(4, 'Oil & Refinery'),
(5, 'Textile'),
(6, 'Automobile'),
(7, 'Tires '),
(8, 'Contactor'),
(9, 'Paper Mill '),
(10, 'Colour '),
(12, 'Hotels & Resorts'),
(13, 'Stp / Wtp / Etp'),
(14, 'Beverage '),
(15, 'Phosphate'),
(16, 'Air Condition '),
(17, 'Gangsaw'),
(18, 'Infra Projects'),
(19, 'Drugs & Chemical'),
(20, 'Gum ');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `debit_notes`
--

INSERT INTO `debit_notes` (`id`, `voucher_no`, `created_on`, `transaction_date`, `sales_acc_id`, `payment_mode`, `party_id`, `narration`, `amount`, `company_id`, `created_by`, `edited_by`, `edited_on`, `cheque_no`) VALUES
(1, '', '2016-12-27', '2016-12-29', 7, 'Cheque', 72, 'sdrfcgfhgjh', '600.98', 25, 1, 1, '2016-12-27', 'rdgytf58678');

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
(1, 'Sale'),
(2, 'Finance'),
(3, 'HR Department'),
(4, 'Purchase '),
(8, 'Store');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE IF NOT EXISTS `designations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `name`) VALUES
(1, 'Asst. Sales Manager'),
(2, 'Sales Executive'),
(3, 'Dy. Sales Manager'),
(4, 'Office Executive'),
(5, 'Commercial Executive');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE IF NOT EXISTS `districts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `state`, `district`) VALUES
(1, 'Rajasthan', 'Bhilwara'),
(2, 'Aurangabad', 'Aurangabad'),
(3, 'Rajasthan', 'Beawer'),
(4, 'Rajasthan', 'Bundi'),
(5, 'Rajasthan', 'Kota'),
(6, 'Rajasthan', 'Jodhpur'),
(8, 'Uttar Pradesh', 'Noida'),
(10, 'Rajasthan', 'Alwar'),
(11, 'Rajasthan', 'Jaipur'),
(12, 'Rajasthan', 'Baran'),
(13, 'Rajasthan', 'Udaipur'),
(14, 'Rajasthan ', 'Chittorgarh'),
(15, 'Rajasthan ', 'Pali'),
(17, 'Rajasthan ', 'Rajasmand'),
(18, 'Rajasthan ', 'Barmer'),
(19, 'Rajasthan ', 'Barmer'),
(20, 'Rajasthan ', 'Nagaur'),
(21, 'Rajasthan', 'Bikaner'),
(22, 'Chattisgarh', 'Balodabazar'),
(23, 'Up', 'Kanpur'),
(24, 'Madhyapardesh', 'Neemuch'),
(25, 'Uttrakhand', 'Haridwar'),
(26, 'Karnatka', 'Mudupur 587313'),
(27, 'West Bengal', 'Howrah'),
(28, 'New Delhi', 'New Delhi'),
(29, 'GUJRAT', 'AHMEDABAD');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `email_records`
--

INSERT INTO `email_records` (`id`, `quotation_id`, `send_to`, `subject`, `message`) VALUES
(6, 2, 'customer@gmail.com', 'Revision hello', 'sa'),
(7, 4, 'honda@gail.com,honda2@gmail.com', 'thhis is subject', 'this is meessage'),
(8, 2, 'gopalkrishanp3@gmail.com', 'this is subject', 'sdfsdfsd');

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
  `ledger_account_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `sex`, `dipartment_id`, `designation_id`, `mobile`, `email`, `signature`, `account_no`, `bank_name`, `branch_name`, `ifsc_code`, `permanent_address`, `residence_address`, `phone_no`, `dob`, `marital_status`, `date_of_anniversary`, `spouse_name`, `children`, `spouse_working`, `qualification`, `last_company`, `join_date`, `permanent_join_date`, `blood_group`, `account_category_id`, `account_group_id`, `account_first_subgroup_id`, `account_second_subgroup_id`, `ledger_account_id`) VALUES
(1, 'Mohammed Arif', 'Male', 1, 1, '9649004777', 'arif@mogragroup.com', '5851195b0f4a9.png', '456456', 'Ryeryy', 'Fhgfj', '57547', 'dfg', 'dfgdfg', '0', '1970-01-01', 'Single', '1970-01-01', '', 0, '', '', '', '1970-01-01', '1970-01-01', '', 0, 0, 0, 0, 0),
(2, 'Jagdish Salvi', 'Male', 1, 2, '9983247774', 'jagdish@mogragroup.com', '580dabf8784e4.png', '', '', '', '', 'sdfsdf', 'sdfsdf', '0', '1970-01-01', 'Single', '1970-01-01', '', 0, '', '', '', '1970-01-01', '1970-01-01', '', 0, 0, 0, 0, 0),
(3, 'Harshit Patel', 'Male', 1, 2, '9772404777', 'harshit@mogragroup.com', '580dac166a19d.png', '', '', '', '', 'sdfsd', 'fdsf', '0', '1970-01-01', 'Single', '1970-01-01', '', 0, '', '', '', '1970-01-01', '1970-01-01', '', 0, 0, 0, 0, 0),
(4, 'Pushpendra Chauhan', 'Male', 1, 3, '9672994770', 'pushpendra@mogragroup.com', '580dac3905fe0.png', '', '', '', '', 'dgsd', 'gdg', '0', '1970-01-01', 'Single', '1970-01-01', '', 0, '', '', '', '1970-01-01', '1970-01-01', '', 0, 0, 0, 0, 0),
(5, 'Vijay Gohil', 'Male', 1, 2, '9772604777', 'vijay@mogragroup.com', '580dac676529b.png', '', '', '', '', 'dfg', 'dfgdf', '0', '1970-01-01', 'Single', '1970-01-01', '', 0, '', '', '', '1970-01-01', '1970-01-01', '', 0, 0, 0, 0, 0),
(6, 'Jitendra Singh Jhala', 'Male', 2, 2, '8696029999', 'dispatch@mogragroup.com', '580daaa1c6f38.png', '', '', '', '', 'ert', 'ert', '0', '1970-01-01', 'Single', '1970-01-01', '', 0, '', '', '-', '1970-01-01', '1970-01-01', '', 0, 0, 0, 0, 0),
(18, 'Priya Mogra', 'Female', 3, 5, 'abcd', 'priya@mogragroup.com', '583eb276a4850.jpg', '', '', '', '', 'rwerwer', 'hiurgehugfte', '', '2016-11-08', 'Married', '1970-01-01', '', 0, '', 'M.c.A', '123jhjkbjb', '1970-01-01', '1970-01-01', 'A-', 2, 2, 2, 2, 0),
(19, 'Priyanka', 'Female', 1, 1, '9876567567', 'pika@gmail.coom', '584aa24972d1a.png', '987664347867865', 'Canara', 'Subhasnagar', '987876', 'pratap colony badgaon', 'pratp colony badgaon', '', '2016-12-01', 'Single', '1970-01-01', '', 0, '', 'MCA', 'Vodafone', '2016-12-15', '2016-12-29', 'O+', 1, 1, 1, 1, 14),
(20, 'Jayanti Mehta', 'Female', 2, 4, '936734648', 'jayanti@mogragroup.com', '584c3e325b904.jpg', '', '', '', '', 'Mehta ji ki khidki	', 'mehta ji ki khidki	', '02942450890', '1994-06-14', 'Single', '1970-01-01', '', 0, '', 'B Com', 'Ostwal Group', '2016-12-01', '2016-12-10', 'B+', 1, 1, 4, 6, 71);

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
(5, 27),
(6, 25),
(6, 26),
(6, 27),
(18, 25),
(18, 26),
(18, 27),
(19, 25),
(19, 26),
(19, 27),
(20, 25);

-- --------------------------------------------------------

--
-- Table structure for table `employee_contact_persons`
--

CREATE TABLE IF NOT EXISTS `employee_contact_persons` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` bigint(15) NOT NULL,
  `landline` bigint(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `relation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `employee_contact_persons`
--

INSERT INTO `employee_contact_persons` (`id`, `employee_id`, `name`, `mobile`, `landline`, `email`, `relation`) VALUES
(29, 2, 'Sdfsdf', 32532, 345, 'dgd@ewtwet4.etert', 'Ertert'),
(30, 2, 'Sdfsdf', 345345, 34534, 'erter@ewwe.werwe', 'werwer'),
(31, 3, 'Sdfds', 32432, 435, 'fds@wert.reyer', 'Dfgdf'),
(32, 3, 'Sdfds', 23432, 34534, 'fds@wert.reyer', 'Dfg'),
(33, 4, 'Dfgfd', 45435, 34543, 'dfgd@ert.erte', 'Dfgd'),
(34, 4, 'Dfgdf', 34534, 34534, 'dfgd@ert.ertefdg', 'dfgf'),
(35, 5, 'Sdfsd', 4543, 345, 'dfgd@ewt.ryer', 'Dfg'),
(36, 5, 'Fsdfsd', 43534, 34534, 'dfgd@ewt.ryerfdg', 'Dfg'),
(37, 19, 'Myks', 9878678656, 2942876765, 'myks@gmail.com', 'Friend'),
(38, 19, 'Saru', 9877765675, 9988778787, 'mjh@nhj.vc', 'Mother'),
(39, 6, 'Dfg', 43634, 346, 'df@ery.ry', 'Ert'),
(40, 6, 'Dfg', 43643, 346, 'eryer@er.ery', 'Ert'),
(41, 18, 'Hvhgvh', 2, -1, 'priya@mogragroup.com', 'Hghjghj'),
(42, 18, 'Ftdttdghd', 3, 3, 'priya@mogragroup.com', 'Ygyutyt'),
(43, 20, 'Mehta Ji', 923746548273676, 2945669847, 'mehta@gmail.com', 'Husband'),
(44, 20, 'Mehta Sh', 9287678594, 2954847658, 'nal@gmail.com', 'Cousin'),
(45, 1, 'Dfg', 546546, 5454654, 'dfdf@etre.rytery', 'Ryr'),
(46, 1, 'Dfgdfg', 456456, 546546, 'ryer@ert.eryrey', 'Yrtyery');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=88 ;

--
-- Dumping data for table `filenames`
--

INSERT INTO `filenames` (`id`, `file1`, `customer_id`, `file2`) VALUES
(1, 'BE', 0, 1),
(2, 'BE', 0, 1),
(4, 'BE', 2, 2),
(5, 'DC', 2, 2),
(7, 'BE', 1, 3),
(8, 'DC', 3, 5),
(10, 'BE', 11, 3),
(11, 'DC', 4, 7),
(12, 'DC', 8, 8),
(13, 'DC', 10, 9),
(14, 'DC', 12, 10),
(15, 'DC', 14, 11),
(16, 'DC', 15, 12),
(17, 'DC', 16, 13),
(18, 'DC', 23, 14),
(19, 'DC', 25, 15),
(20, 'DC', 34, 20),
(21, 'DC', 9, 16),
(22, 'DC', 6, 17),
(23, 'BE', 6, 3226),
(24, 'BE', 7, 3104),
(25, 'DC', 7, 18),
(26, 'DC', 13, 19),
(27, 'BE', 36, 3228),
(28, 'BE', 42, 3234),
(29, 'DC', 1, 21),
(30, 'DC', 5, 22),
(31, 'BE', 5, 2992),
(32, 'DC', 18, 23),
(33, 'BE', 24, 3321),
(34, 'BE', 45, 3080),
(35, 'BE', 46, 3025),
(36, 'BE', 47, 3102),
(37, 'DC', 32, 24),
(38, 'DC', 28, 25),
(39, 'BE', 7, 1234),
(40, 'BE', 12, 3322),
(41, 'DC', 19, 26),
(42, 'BE', 19, 3323),
(43, 'BE', 39, 3324),
(44, 'BE', 33, 3325),
(45, 'BE', 1, 3326),
(46, 'BE', 19, 3090),
(47, 'BE', 48, 3333),
(48, 'BE', 1, 3065),
(49, 'BE', 50, 3334),
(50, 'BE', 1, 3335),
(51, 'DC', 20, 27),
(52, 'BE', 51, 3336),
(53, 'BE', 49, 3337),
(54, 'BE', 52, 3350),
(55, 'BE', 23, 3351),
(56, 'BE', 53, 3047),
(57, 'BE', 53, 3047),
(58, 'BE', 54, 3352),
(59, 'BE', 20, 3353),
(60, 'DC', 55, 30),
(61, 'BE', 55, 3296),
(62, 'BE', 14, 3354),
(63, 'BE', 56, 3355),
(64, 'BE', 57, 2158),
(65, 'BE', 8, 3356),
(66, 'BE', 58, 2668),
(67, 'BE', 8, 3357),
(69, 'DC', 1, 31),
(71, 'BE', 60, 3358),
(72, 'BE', 61, 3359),
(73, 'BE', 1, 3360),
(74, 'DC', 1, 32),
(75, 'BE', 1, 3361),
(76, 'DC', 19, 33),
(77, 'BE', 62, 3362),
(78, 'BE', 63, 3363),
(79, 'BE', 64, 3364),
(80, 'BE', 19, 2642),
(81, 'BE', 65, 3365),
(82, 'BE', 66, 3366),
(83, 'BE', 68, 2903),
(84, 'BE', 46, 3342),
(87, 'BE', 69, 3367);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `grns`
--

INSERT INTO `grns` (`id`, `vendor_id`, `date_created`, `purchase_order_id`, `company_id`, `grn1`, `grn2`, `grn3`, `grn4`, `status`, `created_by`) VALUES
(1, 2, '2016-12-28', 1, 25, 'STL', '1', 'BE-1', '16-17', 'Pending', 1),
(2, 2, '2016-12-28', 1, 25, 'STL', '2', 'BE-1', '16-17', 'Pending', 1),
(3, 2, '2016-12-28', 1, 25, 'STL', '3', 'BE-1', '16-17', 'Pending', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `grn_rows`
--

INSERT INTO `grn_rows` (`id`, `grn_id`, `item_id`, `quantity`, `description`) VALUES
(3, 1, 37, 60, ''),
(4, 2, 37, 5, ''),
(5, 2, 38, 100, ''),
(6, 3, 37, 45, '');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_vouchers`
--

CREATE TABLE IF NOT EXISTS `inventory_vouchers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) NOT NULL,
  `invoice_row_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `iv1` varchar(10) NOT NULL,
  `iv2` varchar(10) NOT NULL,
  `iv3` varchar(10) NOT NULL,
  `iv4` varchar(10) NOT NULL,
  `created_by` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `inventory_vouchers`
--

INSERT INTO `inventory_vouchers` (`id`, `invoice_id`, `invoice_row_id`, `item_id`, `iv1`, `iv2`, `iv3`, `iv4`, `created_by`, `company_id`) VALUES
(1, 1, 1, 38, 'STL', '1', 'BE-3', '16-17', 1, 25),
(2, 4, 8, 0, 'STL', '2', 'BE-3104', '16-17', 1, 25);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_voucher_rows`
--

CREATE TABLE IF NOT EXISTS `inventory_voucher_rows` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inventory_voucher_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `inventory_voucher_rows`
--

INSERT INTO `inventory_voucher_rows` (`id`, `inventory_voucher_id`, `item_id`, `quantity`) VALUES
(1, 1, 38, 3),
(2, 1, 41, 5),
(3, 1, 54, 6),
(4, 2, 38, 1),
(5, 2, 37, 2);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `customer_id`, `customer_address`, `lr_no`, `terms_conditions`, `discount_type`, `total`, `pnf`, `pnf_type`, `pnf_per`, `total_after_pnf`, `sale_tax_per`, `sale_tax_id`, `sale_tax_amount`, `exceise_duty`, `ed_description`, `fright_amount`, `fright_text`, `grand_total`, `due_payment`, `date_created`, `company_id`, `process_status`, `sales_order_id`, `in1`, `in2`, `in4`, `in3`, `customer_po_no`, `po_date`, `additional_note`, `employee_id`, `created_by`, `transporter_id`, `discount_per`, `discount`, `form47`, `form49`) VALUES
(1, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 'lr234', '', 1, '11684.59', '204.48', 1, '1.75', '11889.07', '14.50', 2, '1723.92', '0.00', '', '0.00', '', '13612.99', '13612.99', '2016-12-26', 25, 'Pulled From Sales-Order', 1, 'STL', 1, '16-17', 'BE-3', '9876543', '2016-12-01', '', 1, 1, 1, '1.25', '147.91', '876543', '567i'),
(2, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 'lr3324', '', 0, '35668.72', '831.27', 0, '0.00', '36499.99', '14.50', 2, '5292.50', '0.00', '', '0.00', '', '41792.49', '41792.49', '2016-12-27', 25, 'Pulled From Sales-Order', 1, 'STL', 2, '16-17', 'BE-3', '9876543', '2016-12-01', '', 1, 1, 1, '0.00', '601.28', '234', '23423'),
(3, 3, 'Adani Wilmar Ltd,\r\nSilor Road, Kota Jaipur Highway, 323001, Bundi', 'ltr4', '', 0, '33309.40', '666.19', 0, '2.00', '33975.59', '14.50', 2, '4926.46', '10.00', 'this is excise duty description\r\nthis is excise duty description gekkei\r\nhello', '0.00', 'Fright  amount descripotion\r\nsdffbdsjkfhkdsj\r\nsdfsdf', '38902.05', '38902.05', '2016-12-28', 25, 'Pulled From Sales-Order', 4, 'STL', 3, '16-17', 'DC-5', '6543', '2016-12-27', '', 3, 1, 3, '40.00', '22199.60', '', ''),
(4, 7, 'M/s Ginni International Ltd.(Weaving Division)-DENIM\r\nRIICO Industrial Area \r\nNEEMRANA-301705,\r\nDistt: Alwar (Raj.)', 'lr34', '', 0, '832.50', '0.00', 0, '0.00', '832.50', '14.50', 2, '120.71', '0.00', '', '0.00', '', '953.21', '953.21', '2016-12-28', 25, 'Pulled From Sales-Order', 5, 'STL', 4, '16-17', 'BE-3104', '435', '2016-12-28', '', 1, 1, 4, '0.00', '0.00', '324', '234');

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
  `inventory_voucher` varchar(10) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `invoice_rows`
--

INSERT INTO `invoice_rows` (`id`, `invoice_id`, `item_id`, `description`, `quantity`, `rate`, `amount`, `height`, `inventory_voucher`) VALUES
(1, 1, 38, 'hello', 1, '11000.00', '11000.00', 0, 'Done'),
(2, 1, 41, 'hello', 1, '832.50', '832.50', 0, 'Pending'),
(3, 2, 57, 'hello', 1, '13750.00', '13750.00', 0, 'Pending'),
(4, 2, 63, 'hello', 1, '11000.00', '11000.00', 0, 'Pending'),
(5, 2, 124, 'hello', 4, '2880.00', '11520.00', 0, 'Pending'),
(6, 3, 44, 'sdfsd', 3, '33.00', '99.00', 0, 'Pending'),
(7, 3, 57, '<b><u><i>sdfsdf</i></u></b><div><br></div><div><br></div><div><br></div><div><br></div><div>sdfdsf</div>', 4, '13850.00', '55400.00', 0, 'Pending'),
(8, 4, 41, 'hello', 1, '832.50', '832.50', 0, 'Done');

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
  `item_sub_group_id` int(10) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `ob_quantity` int(5) NOT NULL,
  `ob_rate` int(10) NOT NULL,
  `ob_value` decimal(15,2) NOT NULL,
  `freeze` tinyint(1) NOT NULL,
  `serial_number_enable` tinyint(1) NOT NULL,
  `source` varchar(20) NOT NULL,
  `minimum_quantity` int(10) NOT NULL,
  `maximum_quantity` int(10) NOT NULL,
  `dynamic_cost` decimal(10,2) NOT NULL,
  `minimum_selling_price_factor` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=131 ;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `alias`, `item_category_id`, `item_group_id`, `item_sub_group_id`, `unit_id`, `ob_quantity`, `ob_rate`, `ob_value`, `freeze`, `serial_number_enable`, `source`, `minimum_quantity`, `maximum_quantity`, `dynamic_cost`, `minimum_selling_price_factor`) VALUES
(37, '120x1c', 'Coper Armad', 2, 2, 2, 3, 500, 900, '450000.00', 1, 1, 'Assembled', 500, 500, '0.00', '0.00'),
(38, 'KGEN 11-3 G1', 'KGEN 11 3', 1, 3, 5, 2, 1, 10000, '10000.00', 0, 1, 'Assembled', 1, 1, '10000.00', '1.10'),
(39, 'Exp ', 'Sr No', 1, 1, 1, 2, 1, 50000, '50000.00', 1, 1, 'Assembled', 1, 1, '0.00', '1.15'),
(40, 'Star Delta Panel', '40hp', 1, 1, 1, 2, 1, 40000, '40000.00', 0, 0, 'Assembled', 1, 1, '0.00', '0.00'),
(41, '3 HP / 1500 RPM BBL Motor', '3 HP / 1500 RPM Motor', 2, 12, 20, 2, 1, 10000, '10000.00', 0, 1, 'Purchessed', 1, 1, '555.00', '1.50'),
(42, 'Cable Tray', '450x50x50', 1, 1, 1, 3, 100, 2, '200.00', 0, 0, 'Assembled', 100, 100, '0.00', '0.00'),
(43, 'Cable Tray', '750x75x75x2', 1, 1, 1, 3, 100, 700, '70000.00', 0, 0, 'Assembled', 100, 100, '0.00', '0.00'),
(44, 'Transformer 415/15kva', '415/15kva', 1, 1, 8, 2, 1, 100000, '100000.00', 0, 0, 'Assembled', 1, 1, '0.00', '1.10'),
(45, 'Cable', '35x3c', 1, 1, 1, 3, 1, 48, '48.00', 0, 0, 'Assembled', 50, 50, '0.00', '0.00'),
(46, 'Panel', 'Distribution', 1, 1, 1, 2, 1, 20000, '20000.00', 0, 0, 'Assembled', 1, 1, '0.00', '0.00'),
(47, 'Cable Gland', 'Cable Gland 1.25"', 1, 1, 1, 2, 1, 18, '18.00', 0, 0, 'Assembled', 1, 1, '0.00', '0.00'),
(48, 'Lugs', 'Lugs', 1, 1, 1, 2, 1, 10, '10.00', 0, 0, 'Assembled', 1, 1, '0.00', '0.00'),
(49, 'Coupling', '45', 1, 1, 1, 9, 10, 250, '2500.00', 1, 0, 'Assembled', 2, 10, '0.00', '0.00'),
(50, 'Ms Baseframe', '45', 1, 1, 1, 9, 10, 2500, '25000.00', 0, 0, 'Assembled', 2, 10, '0.00', '0.00'),
(52, 'Tushaco Pump Spare', '0', 1, 1, 1, 2, 1, 15000, '15000.00', 1, 0, 'Assembled', 1, 2, '0.00', '0.00'),
(53, 'Jointing Kit', 'Indoor Type', 1, 1, 1, 4, 1, 1500, '1500.00', 0, 0, 'Assembled', 1, 1, '0.00', '0.00'),
(54, 'Mcv 14 B 6', 'Johnson', 1, 1, 1, 8, 1, 44500, '44500.00', 0, 0, 'Assembled', 2, 4, '0.00', '0.00'),
(55, 'Tushaco Pump', '0', 1, 1, 1, 2, 1, 16000, '16000.00', 1, 0, 'Assembled', 1, 2, '0.00', '0.00'),
(57, 'Ww 101', 'Ww 101', 1, 5, 10, 2, 10, 10500, '105000.00', 0, 1, 'Assembled', 5, 10, '12500.00', '1.10'),
(58, 'Motor 1 HP / 2980 RPM', 'Motor 1 Hp / 2980 Rpm', 2, 2, 2, 2, 12, 5000, '60000.00', 0, 1, 'Assembled', 3, 8, '0.00', '0.00'),
(59, 'Cn 40 200 G1 S2 L3  With 2 Hp Motor', 'Cn 40 200', 1, 1, 1, 2, 9, 20000, '180000.00', 0, 1, 'Assembled', 5, 10, '0.00', '0.00'),
(60, 'CCR 25 160 R6m2l3', 'Centrifugal Pump', 1, 1, 1, 2, 2, 25000, '50000.00', 0, 0, 'Assembled', 2, 5, '0.00', '0.00'),
(61, 'KGEN 11 3 G1', 'KGEN 11 3 G1', 1, 3, 5, 2, 1, 1350, '1350.00', 0, 1, 'Assembled', 10, 15, '0.00', '0.00'),
(62, 'Ccr 40 200 Bare Pump', 'Ccr Pump', 1, 1, 1, 2, 10, 45000, '450000.00', 0, 1, 'Assembled', 2, 4, '0.00', '0.00'),
(63, 'Rt10 ', 'Oil Pump', 1, 1, 1, 2, 5, 9000, '45000.00', 0, 1, 'Assembled', 5, 7, '10000.00', '1.10'),
(64, 'Ccr 25 160 G1 S2 L3', 'Centrifugal Pump', 1, 1, 1, 2, 1, 30000, '30000.00', 0, 1, 'Assembled', 2, 4, '0.00', '0.00'),
(65, 'Cn 40 160 G1 S2 L3', 'Centrifugal Pump', 1, 1, 1, 2, 1, 15000, '15000.00', 0, 1, 'Assembled', 2, 5, '0.00', '0.00'),
(66, 'Mechanical Seal', 'Spares Of Fre Pump', 1, 1, 1, 2, 1, 15000, '15000.00', 0, 0, 'Assembled', 0, 1, '0.00', '0.00'),
(67, 'Impeller', 'Spares Of Fre Pump', 1, 1, 1, 2, 1, 8000, '8000.00', 0, 0, 'Assembled', 0, 1, '0.00', '0.00'),
(68, 'Wear Plate', 'Spares Of Fre Pump', 1, 1, 1, 2, 1, 5000, '5000.00', 0, 0, 'Assembled', 0, 1, '0.00', '0.00'),
(69, 'Shaft Ss', 'Spares Of Fre Pump', 1, 1, 1, 2, 1, 3000, '3000.00', 0, 0, 'Assembled', 0, 1, '0.00', '0.00'),
(70, 'Spring Washer', 'Spares Of Fre Pump', 1, 1, 1, 2, 1, 150, '150.00', 0, 0, 'Assembled', 0, 1, '0.00', '0.00'),
(71, 'Wp-05d/35', 'Sewage Pump', 1, 1, 1, 2, 1, 50000, '50000.00', 0, 0, 'Assembled', 0, 1, '0.00', '0.00'),
(72, 'Kgen 15 6 G1', 'Johnson Make Self Priming Pump', 1, 1, 1, 2, 1, 15000, '15000.00', 0, 1, 'Assembled', 5, 8, '0.00', '0.00'),
(73, 'name', 'alias', 0, 0, 0, 0, 0, 0, '0.00', 0, 0, 'Assembled', 0, 0, '0.00', '0.00'),
(74, 'IMPELLER', 'KGEN 15- 6', 3, 6, 3, 2, 10, 3000, '30000.00', 1, 0, 'Assembled', 5, 15, '0.00', '0.00'),
(75, 'ED-01', 'ED-01', 1, 11, 13, 1, 1, 4000, '4000.00', 1, 1, 'Assembled', 2, 10, '0.00', '0.00'),
(76, '1 HP / 1500 RPM BBL Motor', '1 HP / 1500 RPM BBL Motor', 2, 12, 20, 2, 1, 1234, '1234.00', 0, 1, 'Assembled', 1, 1, '0.00', '0.00'),
(77, 'Heat Exchanger', 'Heat Exchanger', 4, 14, 21, 2, 1, 400000, '400000.00', 0, 1, 'Assembled', 1, 1, '0.00', '0.00'),
(78, 'KGEN 25n 10', 'KGEN 25 N 10', 1, 3, 5, 2, 0, 0, '0.00', 0, 1, 'Assembled', 2, 3, '0.00', '0.00'),
(79, 'RT 125/32', 'RT 125/32', 1, 1, 22, 2, 1, 10000, '10000.00', 1, 1, 'Assembled', 1, 1, '15000.00', '1.10'),
(80, 'Stator T1SB 100.1', 'Stator T1SB 100.1', 3, 8, 23, 2, 1, 14535, '14535.00', 1, 0, 'Assembled', 1, 1, '0.00', '0.00'),
(81, 'KGEN 12-6 G1', 'KGEN 12-6 G1', 1, 3, 5, 2, 4, 8000, '32000.00', 1, 1, 'Assembled', 1, 4, '0.00', '0.00'),
(82, 'Seal Kit Set Of TRF 1300 Pump', 'Seal Kit', 3, 16, 24, 2, 1, 180000, '180000.00', 1, 0, 'Assembled', 1, 1, '0.00', '0.00'),
(83, 'NS 50 160', 'NS 50 160', 1, 4, 27, 2, 1, 34500, '34500.00', 1, 1, 'Assembled', 1, 1, '0.00', '0.00'),
(84, 'Valve Assembely KGEN 11 4', 'Valve Assembely KGEN 11 4', 3, 6, 4, 2, 1, 410, '410.00', 1, 0, 'Assembled', 1, 1, '0.00', '0.00'),
(85, 'Mechfill Make Filter Element 80 Mesh', 'Filter Element', 5, 15, 26, 2, 2, 5000, '10000.00', 1, 0, 'Assembled', 3, 3, '0.00', '0.00'),
(86, 'Filter Element Size: OD 101 X 50 ID X 421 Long', 'SS 304 Wire Mesh 50 Micron', 5, 15, 26, 2, 12, 5000, '60000.00', 1, 0, 'Assembled', 12, 12, '0.00', '0.00'),
(87, 'CCR 25-125', 'CCR 25-125', 6, 18, 29, 4, 1, 55000, '55000.00', 1, 1, 'Assembled', 1, 1, '0.00', '0.00'),
(88, 'CCR 25-160 R6S2L3', 'CCR 25-160 R6S2L3', 1, 3, 7, 2, 2, 25000, '50000.00', 1, 1, 'Assembled', 2, 2, '0.00', '0.00'),
(89, 'Suction Cover', 'Suction Cover', 3, 6, 30, 2, 1, 550, '550.00', 1, 0, 'Assembled', 1, 1, '0.00', '0.00'),
(90, 'R 50 EG Bare Pump', 'R 50 EG Bare Pump', 1, 1, 25, 2, 1, 20000, '20000.00', 1, 0, 'Assembled', 1, 1, '0.00', '0.00'),
(91, 'NZRP 25 125 TB R V1L', 'NZRP 25 125 TB R V1L', 1, 4, 31, 2, 1, 50000, '50000.00', 1, 1, 'Assembled', 1, 1, '0.00', '0.00'),
(92, 'CN 100 160 G1S2L1', 'CN 100 160 G1S2L1', 1, 3, 6, 2, 1, 19000, '19000.00', 1, 1, 'Assembled', 1, 2, '0.00', '0.00'),
(93, 'S 528', 'S528', 8, 20, 32, 2, 1, 10000, '10000.00', 1, 0, 'Assembled', 1, 1, '0.00', '0.00'),
(94, 'Impeller CI KGEN 15 - 6 CI MOC', 'Impeller', 3, 6, 3, 2, 5, 700, '3500.00', 1, 0, 'Assembled', 6, 6, '0.00', '0.00'),
(95, 'Mechanical Seal KGEN 15 - 6 G1', 'Mechanical Seal', 3, 6, 30, 2, 5, 700, '3500.00', 1, 0, 'Assembled', 6, 6, '0.00', '0.00'),
(96, '0120', '0120', 3, 6, 3, 5, 1, 565, '565.00', 1, 1, 'Assembled', 10, 10, '0.00', '0.00'),
(97, '2110', 'Bearing Cover', 3, 6, 33, 2, 10, 145, '1450.00', 1, 1, 'Assembled', 10, 10, '0.00', '0.00'),
(98, '2160', 'Gasket', 3, 6, 34, 4, 10, 29, '290.00', 1, 1, 'Assembled', 10, 10, '0.00', '0.00'),
(99, '2200', 'Pump Shaft SS 316', 3, 6, 35, 2, 10, 2217, '22170.00', 1, 1, 'Assembled', 10, 10, '0.00', '0.00'),
(100, '2200', 'Pump Shaft SS 431', 3, 6, 36, 2, 10, 1238, '12380.00', 1, 1, 'Assembled', 10, 10, '0.00', '0.00'),
(101, '2230', 'Ball Bearing', 3, 6, 37, 2, 10, 364, '3640.00', 1, 1, 'Assembled', 10, 10, '0.00', '0.00'),
(102, '2240', 'Ball Bearing', 3, 6, 37, 2, 10, 364, '3640.00', 1, 1, 'Assembled', 10, 10, '0.00', '0.00'),
(103, '2300', 'Inner Cerclip', 3, 6, 38, 2, 10, 117, '1170.00', 0, 0, 'Assembled', 10, 10, '0.00', '0.00'),
(104, '510', '510', 3, 6, 39, 2, 10, 2000, '20000.00', 0, 1, 'Assembled', 10, 100, '2000.00', '99.99'),
(105, '590', '590', 3, 6, 39, 2, 10, 670, '6700.00', 0, 1, 'Assembled', 10, 100, '500.00', '99.99'),
(106, '610', '610', 3, 6, 39, 2, 10, 1000, '10000.00', 0, 1, 'Assembled', 1, 10, '800.00', '99.99'),
(107, '660', '660', 3, 6, 39, 2, 10, 50, '500.00', 0, 1, 'Assembled', 10, 50, '20.00', '50.00'),
(108, '520', '520', 3, 6, 39, 2, 1, 110, '110.00', 0, 1, 'Assembled', 10, 10, '60.00', '99.99'),
(109, '050', '050', 3, 6, 39, 2, 1, 2100, '2100.00', 0, 1, 'Assembled', 1, 1, '1500.00', '99.99'),
(110, 'CCR 50 160 R6 M2 L3', 'Spares', 1, 3, 7, 9, 10, 10000, '100000.00', 0, 0, 'Assembled', 5, 10, '0.51', '10.00'),
(111, 'Casing ', 'Spares', 3, 6, 40, 9, 10, 1000, '10000.00', 0, 0, 'Assembled', 5, 10, '4.00', '10.00'),
(112, 'Pump Shaft', 'Spares', 3, 6, 40, 9, 10, 1000, '10000.00', 0, 0, 'Assembled', 5, 10, '4.00', '10.00'),
(113, 'Wear Ring', 'Spares', 3, 6, 40, 9, 10, 1000, '10000.00', 0, 0, 'Assembled', 5, 10, '4.00', '10.00'),
(114, 'Shaft Sleeve', 'Spares', 3, 6, 40, 9, 10, 1000, '10000.00', 0, 0, 'Assembled', 5, 10, '4.00', '10.00'),
(115, 'CN 65 160 G1 S2 L3', 'Pump', 1, 3, 6, 2, 10, 50000, '500000.00', 0, 0, 'Assembled', 5, 10, '4.00', '99.99'),
(116, 'Seal Kit TRF 660', 'Seal Kit', 3, 16, 41, 2, 2, 113000, '226000.00', 0, 0, 'Assembled', 2, 2, '0.00', '0.00'),
(117, 'FRE 32 110', 'BBL Motor', 6, 22, 42, 4, 1, 48000, '48000.00', 1, 1, 'Assembled', 1, 1, '50000.00', '1.10'),
(118, 'Packing Ring', 'Packing Ring', 3, 6, 44, 9, 10, 900, '9000.00', 0, 0, 'Assembled', 900, 900, '900.00', '99.99'),
(119, 'Bottom Ring', 'Bottom Ring', 3, 6, 44, 9, 10, 1000, '10000.00', 0, 0, 'Assembled', 1000, 1000, '1000.00', '99.99'),
(120, 'Shaft Sleeve', 'Shaft Sleeve', 3, 6, 44, 9, 10, 1000, '10000.00', 0, 0, 'Assembled', 1000, 1000, '1000.00', '99.99'),
(121, 'Pump Shaft', 'Pump Shaft', 3, 6, 44, 9, 10, 1000, '10000.00', 0, 0, 'Assembled', 100, 100, '100.00', '99.99'),
(122, 'CCR 25 125 R6 M2 L6', 'CCR 25 125 R6 M2 L6', 1, 3, 7, 2, 1, 33500, '33500.00', 1, 1, 'Assembled', 1, 1, '0.00', '0.00'),
(123, 'CCR 50 315 R1A S2 L3', 'CCR 50 315 R1A S2 L3', 1, 3, 7, 2, 1, 33500, '33500.00', 0, 1, 'Assembled', 1, 1, '0.00', '0.00'),
(124, 'LDPE Dosing Pipe OD*ID: 10* 6 MM', 'LDPE Dosing Pipe OD*ID: 10* 6 MM', 3, 10, 48, 3, 3, 42, '84.00', 0, 0, 'Assembled', 30, 50, '48.00', '60.00'),
(125, 'CCR 40 200 R6 S2 L1', 'CCR 40 200', 1, 3, 7, 2, 2, 14580, '29160.50', 0, 1, 'Assembled', 1, 2, '0.00', '1.10'),
(126, '4SC-05 G/80+', '4SC-05 G/80+', 1, 5, 9, 2, 1, 160000, '160000.00', 0, 1, 'Assembled', 1, 1, '130000.00', '1.10'),
(127, 'T1S-100.1', 'T1S-100.1', 9, 24, 50, 4, 1, 50000, '50000.00', 1, 1, 'Assembled', 1, 1, '45000.00', '1.10'),
(128, '4SR-50M/100+', '4SR-50M/100+', 8, 20, 52, 2, 1, 670000, '670000.00', 1, 1, 'Assembled', 1, 1, '1.00', '1.10'),
(129, 'Mechanical Seal KGEN 14-8', 'Mechanical Seal KGEN 14-8', 3, 6, 30, 2, 10, 1500, '15000.00', 0, 0, 'Assembled', 10, 15, '0.00', '0.00'),
(130, 'Mechanical Seal Kit', 'Mechanical Seal Kit', 3, 6, 54, 2, 1, 15600, '15600.00', 0, 0, 'Assembled', 1, 1, '0.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE IF NOT EXISTS `item_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `item_categories`
--

INSERT INTO `item_categories` (`id`, `name`) VALUES
(1, 'Pump'),
(2, 'Motor'),
(3, 'Spares'),
(4, 'Heat Exchanger'),
(5, 'Filter Element'),
(6, 'Pump With Motor'),
(8, 'Submersible Pump'),
(9, 'Pump With BBL Make Motor'),
(10, 'Project');

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
(37, 25),
(38, 25),
(41, 25),
(44, 25),
(57, 25),
(58, 25),
(61, 25),
(63, 25),
(74, 25),
(75, 25),
(76, 25),
(77, 25),
(78, 25),
(79, 25),
(80, 25),
(81, 25),
(82, 25),
(83, 25),
(84, 25),
(85, 25),
(86, 25),
(87, 25),
(88, 25),
(89, 25),
(90, 25),
(91, 25),
(92, 25),
(93, 25),
(96, 25),
(97, 25),
(98, 25),
(99, 25),
(100, 25),
(101, 25),
(102, 25),
(104, 25),
(105, 25),
(106, 25),
(107, 25),
(108, 25),
(109, 25),
(110, 25),
(111, 25),
(112, 25),
(113, 25),
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
(126, 25),
(127, 25),
(128, 25),
(129, 25),
(130, 25),
(37, 26),
(38, 26),
(40, 26),
(41, 26),
(57, 26),
(58, 26),
(61, 26),
(76, 26),
(77, 26),
(78, 26),
(79, 26),
(80, 26),
(83, 26),
(84, 26),
(87, 26),
(89, 26),
(91, 26),
(38, 27),
(40, 27),
(41, 27),
(44, 27),
(57, 27),
(61, 27),
(76, 27),
(77, 27),
(78, 27),
(79, 27),
(80, 27),
(83, 27),
(84, 27),
(87, 27),
(89, 27),
(91, 27),
(94, 27),
(95, 27),
(118, 27),
(119, 27),
(120, 27),
(121, 27),
(125, 27),
(130, 27);

-- --------------------------------------------------------

--
-- Table structure for table `item_groups`
--

CREATE TABLE IF NOT EXISTS `item_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_category_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `item_groups`
--

INSERT INTO `item_groups` (`id`, `item_category_id`, `name`) VALUES
(1, 1, 'Tushaco Pumps'),
(2, 2, 'REMI Motors'),
(3, 1, 'Johnson Pumps'),
(4, 1, 'Antico Pumps'),
(5, 1, 'Darling Pumps'),
(6, 3, 'Johnson Spares'),
(7, 3, 'Antico Spares'),
(8, 3, 'Tushaco Spares'),
(9, 3, 'Darling  Spares'),
(10, 3, 'Positive Spares'),
(11, 1, 'Positive Pumps'),
(12, 2, 'BBL Motors'),
(13, 2, 'Siemens Motor'),
(14, 4, 'Trenter'),
(15, 5, 'Mechfill Filter Element'),
(16, 3, 'Allweiler Pump Spares'),
(17, 1, 'Allweiler Pumps'),
(18, 6, 'johnson Pump With Kirlosker Motor'),
(19, 6, 'ANTICO PUMP WITH BBT MOTOR'),
(20, 8, 'Darling Pump'),
(22, 6, 'Johnson Pump With BBL Motor'),
(24, 9, 'TUSHACO PUMP'),
(25, 9, 'POSITIVE PUMP'),
(26, 10, 'ALL Kind Of Pump');

-- --------------------------------------------------------

--
-- Table structure for table `item_ledgers`
--

CREATE TABLE IF NOT EXISTS `item_ledgers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `source_model` varchar(100) NOT NULL,
  `source_id` int(10) NOT NULL,
  `in_out` varchar(100) NOT NULL,
  `processed_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `item_ledgers`
--

INSERT INTO `item_ledgers` (`id`, `item_id`, `quantity`, `source_model`, `source_id`, `in_out`, `processed_on`) VALUES
(1, 37, 50, 'Grns', 1, 'In', '2016-12-28'),
(2, 38, 50, 'Grns', 1, 'In', '2016-12-28'),
(3, 37, 5, 'Grns', 2, 'In', '2016-12-28'),
(4, 38, 100, 'Grns', 2, 'In', '2016-12-28'),
(5, 37, 45, 'Grns', 3, 'In', '2016-12-28');

-- --------------------------------------------------------

--
-- Table structure for table `item_sources`
--

CREATE TABLE IF NOT EXISTS `item_sources` (
  `item_id` int(10) NOT NULL,
  `source_id` int(10) NOT NULL,
  PRIMARY KEY (`item_id`,`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_sources`
--

INSERT INTO `item_sources` (`item_id`, `source_id`) VALUES
(37, 1),
(37, 2),
(38, 2),
(41, 2),
(44, 2),
(58, 1),
(58, 2),
(61, 2),
(63, 2),
(74, 2),
(76, 2),
(77, 2),
(78, 2),
(79, 2),
(80, 2),
(81, 2),
(82, 2),
(83, 2),
(84, 2),
(85, 3),
(86, 3),
(87, 2),
(88, 2),
(89, 2),
(90, 2),
(91, 2),
(92, 2),
(93, 2),
(94, 2),
(95, 2),
(96, 2),
(97, 2),
(98, 2),
(99, 2),
(100, 2),
(101, 2),
(102, 2),
(104, 2),
(105, 2),
(106, 2),
(107, 2),
(108, 2),
(109, 2),
(110, 2),
(116, 2),
(117, 1),
(117, 2),
(122, 2),
(123, 2),
(125, 2),
(127, 2),
(128, 2),
(130, 2);

-- --------------------------------------------------------

--
-- Table structure for table `item_sub_groups`
--

CREATE TABLE IF NOT EXISTS `item_sub_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_group_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=58 ;

--
-- Dumping data for table `item_sub_groups`
--

INSERT INTO `item_sub_groups` (`id`, `item_group_id`, `name`) VALUES
(1, 1, 'Item Sub Group 1'),
(2, 2, 'REMI STD Motors'),
(3, 6, 'Impeller'),
(4, 6, 'Valve Assembly'),
(5, 3, 'KGEN Pumps'),
(6, 3, 'CN Pumps'),
(7, 3, 'CCR Pumps'),
(8, 1, 'Gear Pumps'),
(9, 5, 'Jumbo Pumps'),
(10, 5, 'Waste Water Pumps'),
(11, 7, 'Antico Spares'),
(12, 9, 'Darling Spares'),
(13, 11, 'Dosing Pump'),
(14, 2, 'REMI Geared Motors'),
(15, 12, 'BBL FLP Motors'),
(16, 12, 'BBL IE2 Motors'),
(17, 12, 'BBL IE3 Motors'),
(18, 13, 'Siemens IE3 Motor'),
(19, 13, 'Siemens IE2 Motor'),
(20, 12, 'BBL STD Motors'),
(21, 14, 'Shall Type'),
(22, 1, 'RT 125/32'),
(23, 8, 'Stator T1SB 100.1'),
(24, 16, 'Seal Kit Of TRF 1300 Pump'),
(25, 1, 'R 50 EG Bare Pump'),
(26, 15, 'Filter Element For Oil Application'),
(27, 4, 'NS 50 160'),
(28, 3, 'Valve Assembely KGEN 11 3'),
(29, 18, 'Johnson Pump '),
(30, 6, 'KGEN Spares'),
(31, 4, 'NZRP 25 125 TB G V1L'),
(32, 20, 'S 528'),
(33, 6, 'Bearing Cover'),
(34, 6, 'Gasket'),
(35, 6, 'Pump Shaft SS 316'),
(36, 6, 'Pump Shaft SS 431'),
(37, 6, 'Ball Bearing'),
(38, 6, 'Inner Cerclip'),
(39, 6, 'MCH 14B X 4-5'),
(40, 6, 'CCR 50-160 R6 M2 L3'),
(41, 16, 'Seal Kit TRF 660'),
(42, 22, '1 HP 2900RPM'),
(43, 6, 'CCR 95-125'),
(44, 6, 'CCR 65-125'),
(45, 0, 'FRE Pumps'),
(46, 3, 'FRE Pump'),
(47, 0, 'POSITIVE Spares'),
(48, 10, 'Positive Spares'),
(49, 10, 'Positive Spares'),
(50, 24, 'T1S-100.1'),
(51, 25, 'MD-10'),
(52, 20, '4SR-50M/100+'),
(53, 26, 'TUSH/Darling/Positive'),
(54, 6, 'Mechanical Seal'),
(55, 0, 'Shaft Sleeve'),
(56, 6, 'Shaft Sleeve'),
(57, 6, 'Mechanical Seal Cover');

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
  `dispatch_name` varchar(100) NOT NULL,
  `dispatch_email` varchar(100) NOT NULL,
  `dispatch_address` varchar(100) NOT NULL,
  `customer_po_no` varchar(10) NOT NULL,
  `required_date` date NOT NULL,
  `packing` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `job_cards`
--

INSERT INTO `job_cards` (`id`, `sales_order_id`, `company_id`, `jc1`, `jc2`, `jc3`, `jc4`, `created_by`, `created_on`, `customer_id`, `dispatch_name`, `dispatch_email`, `dispatch_address`, `customer_po_no`, `required_date`, `packing`) VALUES
(1, 1, 25, 'STL', '1', 'BE-3', '16-17', 1, '2016-12-27', 1, 'Qwert', 'wert@erty.wert', 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', '9876543', '2016-12-14', 'packing text'),
(2, 2, 25, 'STL', '2', 'BE-3', '16-17', 1, '2016-12-27', 1, 'Ankit', 'ankit@phppoets.com', 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', '1234', '2016-12-14', ''),
(3, 3, 25, 'STL', '3', 'DC-5', '16-17', 2, '2016-12-27', 3, 'Sdfsdf', 'sdfsd@erter.ertyry', 'Adani Wilmar Ltd,\r\nSilor Road, Kota Jaipur Highway, 323001, Bundi', '6543', '2016-12-13', 'erfregergereg'),
(4, 3, 25, 'STL', '4', 'DC-5', '16-17', 2, '2016-12-27', 3, 'Sdfsdf', 'sdfsd@erter.ertyry', 'Adani Wilmar Ltd,\r\nSilor Road, Kota Jaipur Highway, 323001, Bundi', '6543', '2016-12-26', 'dfvdv'),
(5, 1, 25, 'STL', '5', 'BE-3', '16-17', 2, '2016-12-27', 1, 'Qwert', 'wert@erty.wert', 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', '9876543', '2016-12-13', 'gops'),
(6, 4, 25, 'STL', '6', 'DC-5', '16-17', 1, '2016-12-28', 3, 'Sdfsdf', 'sdfsd@erter.ertyry', 'Adani Wilmar Ltd,\r\nSilor Road, Kota Jaipur Highway, 323001, Bundi', '6543', '2016-12-08', 'thiwenkwer wer '),
(7, 5, 25, 'STL', '7', 'BE-3104', '16-17', 1, '2016-12-28', 7, 'Sdfsdf', 'sdfds@wrwe.esrwer', 'M/s Ginni International Ltd.(Weaving Division)-DENIM\r\nRIICO Industrial Area \r\nNEEMRANA-301705,\r\nDist', '435', '2017-01-06', 'dfdgfdg');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `job_card_rows`
--

INSERT INTO `job_card_rows` (`id`, `job_card_id`, `sales_order_row_id`, `item_id`, `quantity`, `remark`) VALUES
(1, 1, 1, 37, 1, 'remark 1'),
(2, 1, 2, 38, 2, 'remark 2'),
(3, 1, 2, 37, 3, ''),
(4, 1, 3, 37, 4, 'remark 3'),
(5, 1, 3, 38, 5, ''),
(6, 1, 3, 39, 6, ''),
(7, 1, 4, 41, 7, 'remark 4'),
(8, 1, 4, 37, 8, ''),
(9, 1, 4, 38, 9, ''),
(10, 1, 4, 57, 10, ''),
(11, 1, 5, 38, 11, 'remark 5'),
(12, 1, 5, 42, 12, ''),
(13, 1, 5, 39, 13, ''),
(14, 1, 5, 37, 14, ''),
(15, 1, 5, 64, 15, ''),
(16, 2, 6, 37, 1, ''),
(17, 2, 6, 42, 24, ''),
(18, 2, 6, 41, 3, ''),
(19, 3, 10, 37, 10, 'wfeewdf'),
(20, 3, 10, 37, 15, ''),
(21, 3, 11, 38, 20, 'wefwe'),
(22, 3, 11, 38, 25, ''),
(23, 3, 12, 39, 10, 'rw'),
(24, 3, 12, 40, 20, ''),
(25, 4, 10, 37, 33, 'rtyui'),
(26, 4, 11, 37, 33, 'fdg'),
(27, 4, 12, 37, 33, 'ff'),
(28, 5, 1, 37, 11, 'r'),
(29, 5, 1, 37, 22, ''),
(30, 5, 2, 38, 33, 'r1'),
(31, 5, 2, 38, 44, ''),
(32, 5, 3, 39, 55, 'r2'),
(33, 5, 3, 39, 66, ''),
(34, 5, 4, 40, 77, 'r3'),
(35, 5, 4, 40, 88, ''),
(36, 5, 5, 41, 99, 'r4'),
(37, 5, 5, 41, 100, ''),
(38, 6, 16, 42, 3, 'wer wer'),
(39, 6, 16, 40, 4, ''),
(40, 6, 17, 41, 3, 'erwer'),
(41, 6, 17, 42, 4, ''),
(42, 6, 18, 42, 3, 'werwe'),
(43, 6, 18, 38, 34, ''),
(44, 6, 18, 70, 4, ''),
(45, 7, 19, 40, 1, 'dfdsd'),
(46, 7, 19, 43, 1, '');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `journal_vouchers`
--

INSERT INTO `journal_vouchers` (`id`, `voucher_no`, `created_on`, `transaction_date`, `narration`, `company_id`, `created_by`) VALUES
(1, '', '2016-12-27', '2016-12-27', 'ertysertbvnfdghj', 25, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `journal_voucher_rows`
--

INSERT INTO `journal_voucher_rows` (`id`, `journal_voucher_id`, `ledger_account_id`, `cr_dr`, `amount`) VALUES
(3, 1, 72, 'Dr', 700),
(4, 1, 68, 'Cr', 400),
(5, 1, 70, 'Cr', 300);

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
(0, 'cxvcxv', '1.00');

-- --------------------------------------------------------

--
-- Table structure for table `ledgers`
--

CREATE TABLE IF NOT EXISTS `ledgers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_date` date NOT NULL,
  `ledger_account_id` int(10) NOT NULL,
  `debit` decimal(15,2) NOT NULL,
  `credit` decimal(15,2) NOT NULL,
  `voucher_id` int(10) NOT NULL,
  `voucher_source` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=132 ;

--
-- Dumping data for table `ledgers`
--

INSERT INTO `ledgers` (`id`, `transaction_date`, `ledger_account_id`, `debit`, `credit`, `voucher_id`, `voucher_source`) VALUES
(1, '2016-12-14', 1, '75242.60', '0.00', 1, 'Invoice'),
(2, '2016-12-14', 64, '0.00', '65714.06', 1, 'Invoice'),
(3, '2016-12-14', 65, '0.00', '9528.54', 1, 'Invoice'),
(10, '2016-12-15', 5, '278859.39', '0.00', 4, 'Invoice'),
(11, '2016-12-15', 64, '0.00', '146505.14', 4, 'Invoice'),
(12, '2016-12-15', 65, '0.00', '21243.25', 4, 'Invoice'),
(13, '2016-12-15', 66, '0.00', '111111.00', 4, 'Invoice'),
(14, '2016-12-15', 22, '27599.52', '0.00', 2, 'Invoice'),
(15, '2016-12-15', 64, '0.00', '24017.05', 2, 'Invoice'),
(16, '2016-12-15', 65, '0.00', '3482.47', 2, 'Invoice'),
(17, '2016-12-15', 66, '0.00', '100.00', 2, 'Invoice'),
(18, '2016-12-15', 66, '0.00', '120.00', 5, 'Invoice'),
(19, '2016-12-15', 1, '27938.90', '0.00', 6, 'Invoice'),
(20, '2016-12-15', 64, '0.00', '24295.38', 6, 'Invoice'),
(21, '2016-12-15', 65, '0.00', '3522.83', 6, 'Invoice'),
(22, '2016-12-15', 66, '0.00', '120.69', 6, 'Invoice'),
(23, '2016-12-16', 65, '60.00', '0.00', 1, 'Invoice Booking'),
(24, '2016-12-16', 72, '0.00', '60.00', 1, 'Invoice Booking'),
(25, '2016-12-16', 65, '100.00', '0.00', 2, 'Invoice Booking'),
(29, '2016-12-16', 22, '48184.11', '0.00', 7, 'Invoice'),
(30, '2016-12-16', 64, '0.00', '11177.04', 7, 'Invoice'),
(31, '2016-12-16', 65, '0.00', '1620.67', 7, 'Invoice'),
(32, '2016-12-16', 66, '0.00', '35386.40', 7, 'Invoice'),
(40, '2016-12-16', 22, '14653.71', '0.00', 8, 'Invoice'),
(41, '2016-12-16', 64, '0.00', '12798.00', 8, 'Invoice'),
(42, '2016-12-16', 65, '0.00', '1855.71', 8, 'Invoice'),
(43, '2016-12-16', 5, '272.31', '0.00', 9, 'Invoice'),
(44, '2016-12-16', 64, '0.00', '140.88', 9, 'Invoice'),
(45, '2016-12-16', 65, '0.00', '20.43', 9, 'Invoice'),
(46, '2016-12-16', 66, '0.00', '111.00', 9, 'Invoice'),
(47, '2016-12-20', 1, '22900.00', '0.00', 1, 'Invoice'),
(48, '2016-12-20', 64, '0.00', '20000.00', 1, 'Invoice'),
(49, '2016-12-20', 65, '0.00', '2900.00', 1, 'Invoice'),
(50, '2016-12-20', 1, '22900.00', '0.00', 2, 'Invoice'),
(51, '2016-12-20', 64, '0.00', '20000.00', 2, 'Invoice'),
(52, '2016-12-20', 65, '0.00', '2900.00', 2, 'Invoice'),
(53, '2016-12-20', 1, '22900.00', '0.00', 1, 'Invoice'),
(54, '2016-12-20', 64, '0.00', '20000.00', 1, 'Invoice'),
(55, '2016-12-20', 65, '0.00', '2900.00', 1, 'Invoice'),
(62, '2016-12-24', 3, '13969.00', '0.00', 1, 'Invoice'),
(63, '2016-12-24', 64, '0.00', '12200.00', 1, 'Invoice'),
(64, '2016-12-24', 65, '0.00', '1769.00', 1, 'Invoice'),
(65, '2016-12-24', 6, '15743.75', '0.00', 2, 'Invoice'),
(66, '2016-12-24', 64, '0.00', '13750.00', 2, 'Invoice'),
(67, '2016-12-24', 65, '0.00', '1993.75', 2, 'Invoice'),
(70, '2016-12-24', 5, '86754.00', '0.00', 1, 'PettyCashReceipt Voucher'),
(71, '2016-12-24', 68, '0.00', '86754.00', 1, 'PettyCashReceipt Voucher'),
(78, '2016-12-24', 22, '12437.56', '0.00', 3, 'Invoice'),
(79, '2016-12-24', 64, '0.00', '10862.50', 3, 'Invoice'),
(80, '2016-12-24', 65, '0.00', '1575.06', 3, 'Invoice'),
(81, '2016-12-26', 1, '13612.99', '0.00', 1, 'Invoice'),
(82, '2016-12-26', 64, '0.00', '11889.07', 1, 'Invoice'),
(83, '2016-12-26', 65, '0.00', '1723.92', 1, 'Invoice'),
(86, '2016-12-06', 71, '5000.50', '0.00', 2, 'Payment Voucher'),
(87, '2016-12-06', 70, '0.00', '5000.50', 2, 'Payment Voucher'),
(90, '2016-12-27', 2, '3000.00', '0.00', 2, 'PettyCashReceipt Voucher'),
(91, '2016-12-27', 72, '0.00', '3000.00', 2, 'PettyCashReceipt Voucher'),
(102, '2016-12-27', 5, '600.00', '0.00', 3, 'PettyCashReceipt Voucher'),
(103, '2016-12-27', 72, '0.00', '600.00', 3, 'PettyCashReceipt Voucher'),
(104, '2016-12-28', 4, '0.00', '589.78', 1, 'Credit Note'),
(105, '2016-12-28', 72, '589.78', '0.00', 1, 'Credit Note'),
(108, '2016-12-29', 72, '0.00', '600.98', 1, 'Debit Note'),
(109, '2016-12-29', 7, '600.98', '0.00', 1, 'Debit Note'),
(112, '2016-12-27', 72, '700.00', '0.00', 1, 'Journal Voucher'),
(113, '2016-12-27', 68, '0.00', '400.00', 1, 'Journal Voucher'),
(114, '2016-12-27', 70, '0.00', '300.00', 1, 'Journal Voucher'),
(119, '2016-12-01', 68, '5000.00', '0.00', 1, 'Payment Voucher'),
(120, '2016-12-01', 70, '0.00', '5000.00', 1, 'Payment Voucher'),
(121, '2016-12-27', 1, '41792.49', '0.00', 2, 'Invoice'),
(122, '2016-12-27', 64, '0.00', '36499.99', 2, 'Invoice'),
(123, '2016-12-27', 65, '0.00', '5292.50', 2, 'Invoice'),
(124, '2016-12-28', 2, '38902.05', '0.00', 3, 'Invoice'),
(125, '2016-12-28', 64, '0.00', '33975.59', 3, 'Invoice'),
(126, '2016-12-28', 65, '0.00', '4926.46', 3, 'Invoice'),
(127, '2016-12-28', 6, '953.21', '0.00', 4, 'Invoice'),
(128, '2016-12-28', 64, '0.00', '832.50', 4, 'Invoice'),
(129, '2016-12-28', 65, '0.00', '120.71', 4, 'Invoice'),
(130, '2016-12-28', 68, '25000.00', '0.00', 3, 'Payment Voucher'),
(131, '2016-12-28', 71, '0.00', '25000.00', 3, 'Payment Voucher');

-- --------------------------------------------------------

--
-- Table structure for table `ledger_accounts`
--

CREATE TABLE IF NOT EXISTS `ledger_accounts` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `account_second_subgroup_id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `source_model` varchar(255) NOT NULL,
  `source_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=74 ;

--
-- Dumping data for table `ledger_accounts`
--

INSERT INTO `ledger_accounts` (`id`, `account_second_subgroup_id`, `name`, `source_model`, `source_id`) VALUES
(1, 1, 'Jindal Saw Ltd.', 'Customers', 1),
(2, 1, 'Adani Wilmar Limited', 'Customers', 3),
(3, 1, 'Adani Power Rajasthan Ltd', 'Customers', 4),
(4, 1, 'Shree Cement Ltd Beawer', 'Customers', 5),
(5, 1, 'Honda Car India Pvt. Ltd.', 'Customers', 6),
(6, 1, 'Ginni International Ltd.', 'Customers', 7),
(7, 1, 'Advantage Oils Pvt Ltd', 'Customers', 8),
(8, 1, 'Balkrishna Industries Limited', 'Customers', 9),
(9, 1, 'Acc Limited', 'Customers', 10),
(10, 1, 'Gipl', 'Customers', 11),
(11, 1, 'Mangalam Cement Limited', 'Customers', 12),
(12, 1, 'Oswal Papers', 'Customers', 13),
(13, 1, 'Shriram Rayons', 'Customers', 14),
(14, 1, 'Shriram Cement Ltd', 'Customers', 15),
(15, 1, 'Mahindra Holidays & Resorts India Limited', 'Customers', 16),
(16, 1, 'Cuarzo', 'Customers', 18),
(17, 1, 'Shree Cement Ltd RAS', 'Customers', 19),
(18, 1, 'Hindustan Zinc Ltd Chanderia', 'Customers', 20),
(19, 1, 'Rajshree Pulp & Board Mills Pvt.Ltd.', 'Customers', 22),
(20, 1, 'Nav Durga Services', 'Customers', 23),
(21, 1, 'United Spirits Ltd.', 'Customers', 24),
(22, 1, 'Ruchi Soya Industries Limited', 'Customers', 25),
(23, 1, 'United Breweries Ltd.', 'Customers', 26),
(24, 1, 'Hindustan Zinc Ltd Agucha ', 'Customers', 27),
(25, 1, 'Sulux Phosphate', 'Customers', 28),
(26, 1, 'Carlsberg India Pvt. Ltd.,', 'Customers', 30),
(27, 1, 'Adani Wilmar Ltd', 'Customers', 31),
(28, 1, 'Crown Colour Chem', 'Customers', 32),
(29, 1, 'J K White Cement ', 'Customers', 33),
(30, 1, 'Daikin Airconditioning India Pvt. Ltd.,', 'Customers', 34),
(31, 1, 'Mewar Hitech Engineering Limited', 'Customers', 35),
(32, 1, 'Miraj Multicolor', 'Customers', 36),
(33, 1, 'Ultratech Cement Ltd', 'Customers', 37),
(34, 1, 'Neyveli Lignite Corporation Limited ', 'Customers', 38),
(35, 1, 'Ultratech Cement Limited ', 'Customers', 39),
(36, 1, 'Jubliant Life Science', 'Customers', 40),
(37, 1, 'Ultratech Cement Ltd.', 'Customers', 41),
(38, 1, 'Golden Drugs Pvt Ltd', 'Customers', 42),
(39, 1, 'Ambuja Cement Limited', 'Customers', 43),
(40, 1, 'Choksi Heraeus Pvt. Ltd. ', 'Customers', 44),
(41, 1, 'Reliance Chemotex Industries Limited', 'Customers', 45),
(42, 1, 'Bhansali Engineering Polymers Ltd', 'Customers', 46),
(43, 1, 'Udaipur Cement Works Ltd.', 'Customers', 47),
(44, 1, 'Shree Nurshing Paper & Oil Mill Pvt Ltd', 'Customers', 48),
(45, 1, 'A H Corporation', 'Customers', 49),
(46, 1, 'Cavendish Industries Limited,        ', 'Customers', 50),
(47, 1, 'J K Cement Mudupur', 'Customers', 51),
(48, 1, 'J.K. Cement', 'Customers', 52),
(49, 1, 'Ambuja Cement Limited (W.B.)', 'Customers', 53),
(50, 1, 'Nachi KG Technology India Private Limited', 'Customers', 54),
(51, 1, 'United Breweries Ltd.', 'Customers', 55),
(52, 1, 'Hindustan Zinc Ltd (SK)', 'Customers', 56),
(53, 1, 'Western Drugs Ltd.', 'Customers', 57),
(54, 1, 'Lucid Colloids Ltd', 'Customers', 58),
(55, 1, 'Rock Stone Industries', 'Customers', 59),
(56, 1, 'Birla Corporation Ltd (Chanderia)', 'Customers', 60),
(57, 1, 'Daurala Organics Ltd ', 'Customers', 61),
(58, 1, 'JK Lakshmi Ltd.', 'Customers', 62),
(59, 1, 'RK Marble', 'Customers', 63),
(60, 1, 'SABMiller India Limited', 'Customers', 64),
(61, 1, 'AMZOLE INDIA PVT LTD', 'Customers', 65),
(62, 1, 'Sanjeev Traders', 'Customers', 66),
(63, 1, 'Sanjeev Traders', 'Customers', 67),
(64, 1, 'Sale Tax -> 5.50', 'Sale Tax', 1),
(65, 1, 'Sale Tax -> 14.50', 'Sale Tax', 2),
(66, 1, 'Sale Tax -> 2.00', 'Sale Tax', 3),
(67, 1, 'Sale Tax -> 0.00', 'Sale Tax ', 4),
(68, 5, 'Wonder Cement', 'Customers', 68),
(69, 1, 'Scheiber Dynamix Pvt Ltd', 'Customers', 69),
(70, 5, 'SaleTax - 5.5', 'SaleTax', 6),
(71, 6, 'Jayanti Mehta', 'Employees', 20),
(72, 2, 'SPX Flow Technology Ltd', 'Vendors', 2),
(73, 1, 'Anshul Mogra', 'Customers', 70);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `logins`
--

INSERT INTO `logins` (`id`, `employee_id`, `username`, `password`, `status`) VALUES
(2, 1, 'mohammed', 'mohammed', 'Active'),
(4, 2, 'jagdish', 'jagdish', 'Active'),
(5, 4, 'pushpendra', 'pushpendra', 'Active'),
(6, 6, 'jitendra', 'jitendra', 'Active'),
(7, 3, 'harshit', 'harshit', 'Active'),
(8, 5, 'vijay', 'vijay', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `material_indents`
--

CREATE TABLE IF NOT EXISTS `material_indents` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `job_card_id` int(11) NOT NULL,
  `required_date` date NOT NULL,
  `created_on` date NOT NULL,
  `created_by` int(10) NOT NULL,
  `mi1` varchar(10) NOT NULL,
  `mi2` varchar(10) NOT NULL,
  `mi3` varchar(10) NOT NULL,
  `mi4` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `material_indents`
--

INSERT INTO `material_indents` (`id`, `company_id`, `job_card_id`, `required_date`, `created_on`, `created_by`, `mi1`, `mi2`, `mi3`, `mi4`) VALUES
(1, 25, 4, '1970-01-01', '2016-12-27', 2, 'STL', '1', 'DC-5', '16-17'),
(2, 25, 4, '1970-01-01', '2016-12-27', 2, 'STL', '2', 'DC-5', '16-17');

-- --------------------------------------------------------

--
-- Table structure for table `material_indent_rows`
--

CREATE TABLE IF NOT EXISTS `material_indent_rows` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `material_indent_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `approved_purchased_quantity` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `material_indent_rows`
--

INSERT INTO `material_indent_rows` (`id`, `material_indent_id`, `item_id`, `quantity`, `approved_purchased_quantity`) VALUES
(1, 1, 37, 99, 100),
(2, 2, 37, 99, 123);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controller` varchar(100) NOT NULL,
  `action` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `payment_vouchers`
--

INSERT INTO `payment_vouchers` (`id`, `voucher_no`, `created_on`, `transaction_date`, `paid_to_id`, `payment_mode`, `cash_bank_account_id`, `narration`, `amount`, `cheque_no`, `company_id`, `created_by`, `edited_by`, `edited_on`) VALUES
(1, '', '2016-12-24', '2016-12-01', 68, 'Cheque', 70, 'Narration', '5000.00', '', 25, 1, 1, '2016-12-27'),
(2, '', '2016-12-27', '2016-12-06', 71, 'Cash', 70, 'zxdsxfgfhghjk', '5000.50', '0', 25, 1, 1, '2016-12-27'),
(3, '1', '2016-12-28', '2016-12-28', 68, 'Cheque', 71, 'cfg', '25000.00', '1134', 25, 1, 0, '0000-00-00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `petty_cash_receipt_vouchers`
--

INSERT INTO `petty_cash_receipt_vouchers` (`id`, `voucher_no`, `received_from_id`, `bank_cash_id`, `narration`, `amount`, `company_id`, `created_on`, `transaction_date`, `payment_mode`, `created_by`, `edited_by`, `edited_on`, `cheque_no`) VALUES
(1, '', 68, 5, 'sedrfj', '86754.00', 25, '2016-12-24', '2016-12-24', 'Cheque', 1, 1, '2016-12-24', '657868543'),
(2, '', 72, 2, 'sdfghjkl', '3000.00', 25, '2016-12-27', '2016-12-27', 'Cheque', 1, 1, '2016-12-27', '89767'),
(3, '', 72, 5, 'tfgyhjk', '600.00', 25, '2016-12-27', '2016-12-27', 'Cash', 1, 1, '2016-12-27', '');

-- --------------------------------------------------------

--
-- Table structure for table `phinxlog`
--

CREATE TABLE IF NOT EXISTS `phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phinxlog`
--

INSERT INTO `phinxlog` (`version`, `migration_name`, `start_time`, `end_time`) VALUES
(20160930090925, 'CreateCategories', '2016-09-30 03:39:40', '2016-09-30 03:39:40');

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
  `sale_tax_description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `company_id`, `vendor_id`, `shipping_method`, `shipping_terms`, `delivery_date`, `total`, `terms_conditions`, `po1`, `po2`, `po3`, `po4`, `discount`, `discount_per`, `pnf`, `pnf_type`, `excise_duty`, `descryption`, `grand_total`, `material_to_be_transported`, `delivery`, `lr_to_be_prepared_in_favour_of`, `payment_terms`, `road_permit_form47`, `transporter_id`, `sale_tax_per`, `created_by`, `date_created`, `customer_id`, `discount_type`, `sale_tax_description`) VALUES
(1, 25, 2, '', 0, '2016-12-30', '325000.00', '', 'STL', '1', 'BE-1', '16-17', '100.00', '0.00', '10.00', '', '234234.00', 'Dear Sir,\r\nWith reference to your price list we are pleased to place an order for the following items as per conditions given below.', '0.00', 'wewq', 'qwe', 'Shilpa Trade Links Pvt Ltd', '234', '1234', 4, '2.00', 1, '2016-12-28', 6, '', '');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `purchase_order_rows`
--

INSERT INTO `purchase_order_rows` (`id`, `purchase_order_id`, `item_id`, `description`, `quantity`, `rate`, `amount`, `processed_quantity`, `height`) VALUES
(1, 1, 37, 'hello', 100, '1000.00', '100000.00', 100, 0),
(2, 1, 38, 'hello', 150, '1500.00', '225000.00', 150, 0);

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
  `quotation_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `quotations`
--

INSERT INTO `quotations` (`id`, `customer_id`, `customer_address`, `employee_id`, `item_group_id`, `finalisation_date`, `customer_for_attention`, `customer_contact_no`, `enquiry_no`, `subject`, `text`, `additional_note`, `terms_conditions`, `total`, `status`, `company_id`, `qt1`, `qt2`, `qt3`, `qt4`, `created_by`, `edited_by`, `created_on`, `edited_on`, `reason`, `closing_date`, `revision`, `quotation_id`) VALUES
(1, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 1, 3, '2016-12-28', 'Satpal Marwah', '98765432', 'hgf', 'rtre', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis     : Ex Our Works, Udaipur<br>2. P&amp;F             : 2% On Basic Order Value<br>3. Excise Duty     : Extra If Applicable On The Time Of Dispatch<br>', '25582.50', 'Pending', 25, 'STL', '1', 'BE-3', '16-17', 1, 0, '2016-12-26', '0000-00-00', '', '0000-00-00', 0, 1),
(3, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 1, 3, '2016-12-28', 'Satpal Marwah', '98765432', 'hgf', 'rtre', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis     : Ex Our Works, Udaipur<br>2. P&amp;F             : 2% On Basic Order Value<br>3. Excise Duty     : Extra If Applicable On The Time Of Dispatch<br>', '158803.50', 'Pending', 25, 'STL', '1', 'BE-3', '16-17', 1, 0, '2016-12-26', '0000-00-00', '', '0000-00-00', 1, 1),
(4, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 1, 3, '2016-12-28', 'Satpal Marwah', '98765432', 'hgf', 'rtre', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis     : Ex Our Works, Udaipur<br>2. P&amp;F             : 2% On Basic Order Value<br>3. Excise Duty     : Extra If Applicable On The Time Of Dispatch<br>', '48102.50', 'Converted Into Sales Order', 25, 'STL', '1', 'BE-3', '16-17', 1, 0, '2016-12-26', '0000-00-00', '', '0000-00-00', 2, 1),
(5, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 1, 1, '2016-12-28', 'Satpal Marwah', '', 'ankit', 'quote for custom app', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Delivery        : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.<br>2. Sales Tax       : 5.5 Vat Or As Applicable On The Date Of Dispatch<br>', '99900.00', 'Converted Into Sales Order', 25, 'STL', '2', 'DC-31', '16-17', 1, 0, '2016-12-26', '0000-00-00', '', '0000-00-00', 0, 5),
(6, 3, 'Adani Wilmar Ltd,\r\nSilor Road, Kota Jaipur Highway, 323001, Bundi', 3, 3, '2016-12-29', 'Sachin kanungo', '9876543', 'dgrd', 'dfgdf', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis     : Ex Our Works, Udaipur<br>2. P&amp;F             : 2% On Basic Order Value<br>', '99.00', 'Pending', 25, 'STL', '3', 'DC-5', '16-17', 1, 0, '2016-12-27', '0000-00-00', '', '0000-00-00', 0, 6),
(7, 6, 'M/s Honda Cars India Ltd.,\r\nSPL-1, Tapukara Industrial Area,\r\nKHUSHKHERA-301707, Distt: Alwar (Raj.)', 3, 3, '2016-12-29', 'Arun sharma', '9876543', 'dgrd', 'dfgdf', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis     : Ex Our Works, Udaipur<br>2. P&amp;F             : 2% On Basic Order Value<br>', '999.00', 'Converted Into Sales Order', 25, 'STL', '3', 'DC-17', '16-17', 1, 0, '2016-12-27', '0000-00-00', '', '2016-12-27', 1, 6),
(8, 5, 'Bangur Nagar\r\nBeawer 305901 ', 4, 3, '2016-12-28', 'Vivek Saxena', '7654', '', 'er', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis     : Ex Our Works, Udaipur<br>2. P&amp;F             : 2% On Basic Order Value<br>3. Excise Duty     : Extra If Applicable On The Time Of Dispatch<br>4. Sales Tax       : 5.5 Vat Or As Applicable On The Date Of Dispatch<br>', '90991.00', 'Pending', 25, 'STL', '4', 'DC-22', '16-17', 1, 0, '2016-12-28', '0000-00-00', '', '0000-00-00', 0, 8),
(9, 63, '12, Udyog Vihar, Udaipur', 4, 3, '2016-12-28', 'vijay', '7654', '', 'er', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'kjfksbksf\r\nddmbdfbsd\r\ndfmnsdmbs\r\ndfmnsdfmsf                                              rgggd                                        fgfgg', '1. Price Basis     : Ex Our Works, Udaipur<br>2. P&amp;F             : 2% On Basic Order Value<br>3. Excise Duty     : Extra If Applicable On The Time Of Dispatch<br>4. Sales Tax       : 5.5 Vat Or As Applicable On The Date Of Dispatch<br>', '90991.00', 'Pending', 25, 'STL', '4', 'BE-3363', '16-17', 1, 0, '2016-12-28', '0000-00-00', '', '0000-00-00', 1, 8),
(10, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 1, 1, '2017-01-07', 'Satpal Marwah', '766', 'asdd', 'cddgdgd', 'With reference to above enquiry we are pleased to submit our quote as follows :- hvjhvjhjhjhhhhhhhhj', 'mbbfdjfjnsj', '1. Price Basis     : &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ex Our Works, Udaipur<br>2. P&amp;F             : &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2% On Basic Order Value<br>3. Excise Duty     : &nbsp; &nbsp; &nbsp; &nbsp;Extra If Applicable On The Time Of Dispatch<br>4. Sales Tax       : 5.5 Vat Or As Applicable On The Date Of Dispatch<br>5. Delivery        : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.<br>6. Payment         : Within 30 Days Date Of Receipt Of Material.<br>7. Price Validity : 30 Days<br>', '37500.00', 'Pending', 25, 'STL', '5', 'BE-3335', '16-17', 1, 0, '2016-12-28', '0000-00-00', '', '0000-00-00', 0, 10),
(11, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 1, 1, '2017-01-07', 'Satpal Marwah', '766', 'asdd', 'cddgdgd', 'With reference to above enquiry we are pleased to submit our quote as follows :-hfhghjhjhjggg', 'mbbfdjfjnsj', '1. Price Basis     : &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ex Our Works, Udaipur<br>2. P&amp;F                    :&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2% On Basic Order Value<br>3. Excise Duty     : &nbsp; &nbsp; &nbsp; &nbsp;Extra If Applicable On The Time Of Dispatch<br>4. Sales Tax       : 5.5 Vat O  r As Applicable On The Date Of Dispatch<br>5. Delivery        : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.<br>6. Payment         : Within 30 Days Date Of Receipt Of Material.<br>7. Price Validity : 30 Days<br>', '37500.00', 'Pending', 25, 'STL', '5', 'BE-3335', '16-17', 1, 0, '2016-12-28', '0000-00-00', '', '0000-00-00', 1, 10),
(12, 4, 'NH 90, Atru Road, Village Kawai, Taluka Atru, Baran 325 219, Rajasthan, India', 3, 1, '2017-01-07', 'Sanjay Jain', '766', 'asdd', 'cddgdgd', 'With reference to above enquiry we are pleased to submit our quote as follows :-hvjhjhjhhjh', 'mbbfdjfjnsj', '1. Price Basis     : Ex Our Works, Udaipur<br>2. P&amp;F             : 2% On Basic Order Value<br>3. Excise Duty     : Extra If Applicable On The Time Of Dispatch<br>4. Sales Tax       : 5.5 Vat Or As Applicable On The Date Of Dispatch<br>5. Delivery        : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.<br>6. Payment         : Within 30 Days Date Of Receipt Of Material.<br>7. Price Validity : 30 Days<br>8. Freight &amp; Insurance : In Buyers account<br>9. Warranty : For Pump or Motor : Standard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.<br>10. Discount : As Agreed ......<br>', '37500.00', 'Pending', 25, 'STL', '5', 'DC-7', '16-17', 1, 0, '2016-12-28', '0000-00-00', '', '0000-00-00', 2, 10),
(13, 4, 'NH 90, \r\nAtru Road, Village Kawai, \r\nTaluka Atru, \r\nBaran 325 219, \r\nRajasthan,\r\n India', 3, 1, '2017-01-07', 'Sanjay Jain', '7660998760', 'asdd', 'cddgdgd', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'mbbfdjfjnsj', '1. Price Basis     : Ex Our Works, Udaipur<br>2. P&amp;F             : 2% On Basic Order Value<br>3. Excise Duty     : Extra If Applicable On The Time Of Dispatch<br>4. Sales Tax       : 5.5 Vat Or As Applicable On The Date Of Dispatch<br>5. Delivery        : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.<br>6. Payment         : Within 30 Days Date Of Receipt Of Material.<br>7. Price Validity : 30 Days<br>8. Freight &amp; Insurance : In Buyers account<br>9. Warranty : For Pump or Motor : Standard as provided by manufacturer to be free from defects in both material &amp; workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.<br>10. Discount : As Agreed ......<br>', '37500.00', 'Pending', 25, 'STL', '5', 'DC-7', '16-17', 1, 0, '2016-12-28', '0000-00-00', '', '0000-00-00', 3, 10),
(14, 63, '12, Udyog Vihar, Udaipur', 4, 3, '2016-12-28', 'vijay', '7654', '', 'er', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'kjfksbksf\r\nddmbdfbsd\r\ndfmnsdmbs\r\ndfmnsdfmsf                                              rgggd                                        fgfgg', '1. Price Basis     : Ex Our Works, Udaipur<br>2. P&amp;F             : 2% On Basic Order Value<br>3. Excise Duty     : Extra If Applicable On The Time Of Dispatch<br>4. Sales Tax       : 5.5 Vat Or As Applicable On The Date Of Dispatch<br>', '90991.00', 'Pending', 25, 'STL', '5', 'BE-3363', '16-17', 1, 0, '2016-12-28', '0000-00-00', '', '0000-00-00', 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `quotation_close_reasons`
--

CREATE TABLE IF NOT EXISTS `quotation_close_reasons` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `reason` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `quotation_close_reasons`
--

INSERT INTO `quotation_close_reasons` (`id`, `reason`) VALUES
(1, 'Delivery period was too long'),
(2, 'Rate was too high'),
(3, 'No response'),
(4, 'Other brands preferred'),
(5, 'Wanted cheap material only');

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
  `height` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `quotation_rows`
--

INSERT INTO `quotation_rows` (`id`, `quotation_id`, `item_id`, `description`, `quantity`, `rate`, `amount`, `height`) VALUES
(1, 1, 38, 'hello', 1, '11000.00', '11000.00', 0),
(2, 1, 41, 'hello', 1, '832.50', '832.50', 0),
(3, 1, 57, 'hello', 1, '13750.00', '13750.00', 0),
(5, 3, 38, 'hello', 1, '11000.00', '11000.00', 0),
(6, 3, 41, 'hello', 1, '832.50', '832.50', 0),
(7, 3, 57, 'hello', 1, '13750.00', '13750.00', 0),
(8, 3, 63, '', 1, '11000.00', '11000.00', 0),
(9, 3, 124, '', 11, '11111.00', '122221.00', 0),
(10, 4, 38, 'hello', 1, '11000.00', '11000.00', 0),
(11, 4, 41, 'hello', 1, '832.50', '832.50', 0),
(12, 4, 57, 'hello', 1, '13750.00', '13750.00', 0),
(13, 4, 63, 'hello', 1, '11000.00', '11000.00', 0),
(14, 4, 124, 'hello', 4, '2880.00', '11520.00', 0),
(15, 5, 44, 'abcd%%^ 77788', 111, '900.00', '99900.00', 0),
(16, 6, 44, 'sdfsd', 3, '33.00', '99.00', 0),
(17, 7, 44, 'sdfsd', 3, '33.00', '99.00', 0),
(18, 7, 41, 'sdasf', 1, '900.00', '900.00', 0),
(19, 8, 44, 'hello', 1, '1000.00', '1000.00', 100),
(20, 8, 118, 'hello', 1, '89991.00', '89991.00', 0),
(21, 9, 44, 'hello', 1, '1000.00', '1000.00', 0),
(22, 9, 118, 'hello', 1, '89991.00', '89991.00', 0),
(23, 10, 38, 'as,mccbd &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;jjhh<div>sdsnb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:        kkkkn</div><div>dmsb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sddff</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;kjj&nbsp;&nbsp;&nbsp;&nbsp;<br></div>', 3, '12500.00', '37500.00', 0),
(24, 11, 38, 'as,mccbd &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;jjhh<div>sdsnb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:        kkkkn</div><div>dmsb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sddff</div><div>kjj&nbsp;&nbsp;&nbsp;&nbsp;<br></div>', 3, '12500.00', '37500.00', 0),
(25, 12, 38, 'as,mccbd &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;jjhh<div>sdsnb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:        kkkkn</div><div>dmsb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sddff</div><div>kjj&nbsp;&nbsp;&nbsp;&nbsp;<br></div>', 3, '12500.00', '37500.00', 0),
(26, 13, 38, 'as,mccbd &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;jjhh<div>sdsnb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:        kkkkn</div><div>dmsb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sddff</div><div>kjj&nbsp;&nbsp;&nbsp;&nbsp;<br></div>', 3, '12500.00', '37500.00', 0),
(27, 14, 44, '', 1, '1000.00', '1000.00', 0),
(28, 14, 118, '', 1, '89991.00', '89991.00', 0),
(29, 15, 44, '', 1, '1000.00', '1000.00', 0),
(30, 15, 118, '', 1, '89991.00', '89991.00', 0);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `receipt_vouchers`
--

INSERT INTO `receipt_vouchers` (`id`, `voucher_no`, `received_from_id`, `bank_cash_id`, `narration`, `amount`, `created_by`, `created_on`, `payment_mode`, `company_id`, `transaction_date`, `edited_by`, `edited_on`, `cheque_no`) VALUES
(1, '', 1, 7, 'Against Reference Number', '12321.00', 2, '2016-12-10', 'Cheque', 25, '2016-12-10', 0, '0000-00-00', ''),
(2, '', 1, 3, 'sdfsdf', '100.00', 2, '2016-12-10', 'Cheque', 25, '2016-12-10', 0, '0000-00-00', ''),
(3, '', 1, 4, 'dsfsd', '1.00', 2, '2016-12-10', 'Cheque', 25, '2016-12-10', 0, '0000-00-00', ''),
(4, '', 1, 1, 'recd cheque', '15678.00', 1, '2016-12-10', 'Cash', 27, '2016-12-10', 0, '0000-00-00', '');

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
  `so2` varchar(10) NOT NULL,
  `so3` varchar(10) NOT NULL,
  `so4` varchar(10) NOT NULL,
  `created_by` int(10) NOT NULL,
  `edited_by` int(10) NOT NULL,
  `created_on` date NOT NULL,
  `edited_on` date NOT NULL,
  `edited_on_time` varchar(100) NOT NULL,
  `created_on_time` varchar(100) NOT NULL,
  `job_card` varchar(10) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sales_orders`
--

INSERT INTO `sales_orders` (`id`, `customer_id`, `employee_id`, `customer_address`, `discount_type`, `discount_per`, `discount`, `ed_description`, `exceise_duty`, `total`, `pnf_type`, `pnf_per`, `pnf`, `total_after_pnf`, `additional_note`, `company_id`, `process_status`, `quotation_id`, `transporter_id`, `expected_delivery_date`, `delivery_description`, `documents_courier_id`, `customer_po_no`, `po_date`, `dispatch_name`, `dispatch_mobile`, `dispatch_email`, `dispatch_address`, `road_permit_required`, `form49`, `so1`, `so2`, `so3`, `so4`, `created_by`, `edited_by`, `created_on`, `edited_on`, `edited_on_time`, `created_on_time`, `job_card`) VALUES
(1, 1, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 1, '1.25', '601.28', '', '0.00', '47501.22', 1, '1.75', '831.27', '48332.49', '', 25, 'Pulled From Quotation', NULL, 1, '2016-12-26', 'werwr  ter t', 1, '9876543', '2016-12-01', 'Qwert', '765432', 'wert@erty.wert', 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 'Yes', 'Yes', 'STL', '1', 'BE-3', '16-17', 1, 0, '2016-12-26', '1970-01-01', '', '2016-12-26 04:43:00PM', 'Pending'),
(2, 1, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 1, '1.00', '999.00', '', '0.00', '98901.00', 0, '0.00', '0.00', '98901.00', '', 25, 'Pulled From Quotation', NULL, 1, '2016-12-28', 'udaipur', 1, '1234', '2016-12-21', 'Ankit', '9549993335', 'ankit@phppoets.com', 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 'No', 'Yes', 'STL', '2', 'BE-3', '16-17', 1, 0, '2016-12-26', '1970-01-01', '', '2016-12-26 05:08:17PM', 'Pending'),
(3, 3, 3, 'Adani Wilmar Ltd,\r\nSilor Road, Kota Jaipur Highway, 323001, Bundi', 1, '1.25', '704.99', '', '0.00', '55694.01', 1, '1.75', '974.65', '56668.66', '', 25, 'Pulled From Quotation', NULL, 3, '2016-12-29', 'fssdfsdf.sf\r\nsdf\r\nsdfsdfsdfsd sadf sd sd ', 3, '6543', '2016-12-27', 'Sdfsdf', '35325', 'sdfsd@erter.ertyry', 'Adani Wilmar Ltd,\r\nSilor Road, Kota Jaipur Highway, 323001, Bundi', 'No', 'No', 'STL', '3', 'DC-5', '16-17', 1, 1, '2016-12-27', '2016-12-27', '2016-12-27 02:49:53PM', '2016-12-27 02:49:23PM', 'Pending'),
(4, 3, 3, 'Adani Wilmar Ltd,\r\nSilor Road, Kota Jaipur Highway, 323001, Bundi', 1, '0.00', '0.00', '', '0.00', '56399.00', 1, '0.00', '0.00', '56399.00', '', 25, '', NULL, 3, '2016-12-29', 'fssdfsdf.sf\r\nsdf\r\nsdfsdfsdfsd sadf sd sd ', 3, '6543', '2016-12-27', 'Sdfsdf', '35325', 'sdfsd@erter.ertyry', 'Adani Wilmar Ltd,\r\nSilor Road, Kota Jaipur Highway, 323001, Bundi', 'No', 'No', 'STL', '4', 'DC-5', '16-17', 1, 1, '2016-12-28', '2016-12-28', '2016-12-28 12:27:32PM', '2016-12-28 12:27:22PM', 'Pending'),
(5, 7, 1, 'M/s Ginni International Ltd.(Weaving Division)-DENIM\r\nRIICO Industrial Area \r\nNEEMRANA-301705,\r\nDistt: Alwar (Raj.)', 0, '0.00', '0.00', '', '0.00', '11832.50', 0, '0.00', '0.00', '11832.50', '', 25, 'New', NULL, 4, '2016-12-29', 'sdfsdf', 3, '435', '2016-12-28', 'Sdfsdf', '35325', 'sdfds@wrwe.esrwer', 'M/s Ginni International Ltd.(Weaving Division)-DENIM\r\nRIICO Industrial Area \r\nNEEMRANA-301705,\r\nDistt: Alwar (Raj.)', 'Yes', 'Yes', 'STL', '5', 'BE-3104', '16-17', 1, 0, '2016-12-28', '1970-01-01', '', '2016-12-28 12:51:45PM', 'Pending');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `sales_order_rows`
--

INSERT INTO `sales_order_rows` (`id`, `sales_order_id`, `item_id`, `description`, `quantity`, `rate`, `amount`, `excise_duty`, `sale_tax_id`, `height`, `processed_quantity`) VALUES
(1, 1, 38, 'hello', 1, '11000.00', '11000.00', 'Yes', 2, 0, 1),
(2, 1, 41, 'hello', 1, '832.50', '832.50', 'Yes', 2, 0, 1),
(3, 1, 57, 'hello', 1, '13750.00', '13750.00', 'Yes', 2, 0, 1),
(4, 1, 63, 'hello', 1, '11000.00', '11000.00', 'Yes', 2, 0, 1),
(5, 1, 124, 'hello', 4, '2880.00', '11520.00', 'Yes', 2, 0, 4),
(6, 2, 44, 'abcd%%^ 77788', 111, '900.00', '99900.00', 'Yes', 2, 0, 0),
(10, 3, 44, 'sdfsd', 3, '33.00', '99.00', 'Yes', 2, 0, 0),
(11, 3, 41, 'sdasf', 1, '900.00', '900.00', 'Yes', 2, 0, 0),
(12, 3, 57, '<b><u><i>sdfsdf</i></u></b><div><br></div><div><br></div><div><br></div><div><br></div><div>sdfdsf</div>', 4, '13850.00', '55400.00', 'Yes', 6, 0, 0),
(16, 4, 44, 'sdfsd', 3, '33.00', '99.00', 'Yes', 2, 0, 3),
(17, 4, 41, 'sdasf', 1, '900.00', '900.00', 'Yes', 6, 0, 0),
(18, 4, 57, '<b><u><i>sdfsdf</i></u></b><div><br></div><div><br></div><div><br></div><div><br></div><div>sdfdsf</div>', 4, '13850.00', '55400.00', 'Yes', 2, 0, 4),
(19, 5, 38, 'hello&nbsp;&nbsp;&nbsp;&nbsp;', 1, '11000.00', '11000.00', 'No', 6, 0, 0),
(20, 5, 41, 'hello', 1, '832.50', '832.50', 'Yes', 2, 0, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `sale_taxes`
--

INSERT INTO `sale_taxes` (`id`, `tax_figure`, `quote_description`, `invoice_description`, `account_category_id`, `account_group_id`, `account_first_subgroup_id`, `account_second_subgroup_id`, `ledger_account_id`, `freeze`) VALUES
(2, '14.50', '14.50 % VAT or as applicable on date of dispatch', '14.50 % VAT or as applicable on date of dispatch', 0, 0, 0, 0, 65, 0),
(3, '2.00', '2 % CST against C Form', '2 % CST against C Form', 0, 0, 0, 0, 66, 0),
(4, '0.00', 'NIL CST agst C & E1 Form', 'NIL CST agst C & E1 Form', 0, 0, 0, 0, 67, 0),
(6, '5.50', 'VAT @ 5.50 % ', 'VAT @ 5.50 % ', 2, 2, 3, 5, 70, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sources`
--

CREATE TABLE IF NOT EXISTS `sources` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

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

CREATE TABLE IF NOT EXISTS `terms_conditions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `text_line` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `terms_conditions`
--

INSERT INTO `terms_conditions` (`id`, `text_line`) VALUES
(1, 'Price Basis     : Ex Our Works, Udaipur'),
(2, 'P&F             : 2% On Basic Order Value'),
(4, 'Excise Duty     : Extra If Applicable On The Time Of Dispatch'),
(5, 'Sales Tax       : 5.5 Vat Or As Applicable On The Date Of Dispatch'),
(7, 'Delivery        : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.'),
(8, 'Payment         : Within 30 Days Date Of Receipt Of Material.'),
(10, 'Price Validity : 30 Days'),
(13, 'Freight & Insurance : In Buyers account'),
(16, 'Warranty : For Pump or Motor : Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.'),
(27, 'Discount : As Agreed ......');

-- --------------------------------------------------------

--
-- Table structure for table `transporters`
--

CREATE TABLE IF NOT EXISTS `transporters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transporter_name` varchar(100) NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `transporters`
--

INSERT INTO `transporters` (`id`, `transporter_name`, `mobile`, `address`) VALUES
(1, 'First Flight Courier', 9999, 'Mr Asok\r\nUdaipur'),
(2, 'Singhal Tr', 9890356789, 'Ahmedabad'),
(3, 'Kota Udaipur', 345763290, 'asa'),
(4, 'Bhati Good', 1, 'Jodhpur'),
(5, 'Love Kush', 1, 'Udaipur'),
(6, 'GATI cargo', 1, 'GATI CARGO PVT LTD\r\n'),
(7, 'Asthaa Log', 1, 'Udaipur'),
(8, 'STAR TREK', 1, 'STAR TREK LOGISTIC (SPOT ON)\r\n\r\n'),
(9, 'Authorised', 1, 'Dariba Smelter'),
(10, 'Hand Delivery ', 1, 'Udaipur'),
(11, 'Associated', 1, 'MIA Udaipur'),
(12, 'SHANKER GO', 1, 'SHANKER GOLDEN TRANSPORT\r\n'),
(13, 'Nimbahera', 1, 'Bapu Bazar Udaipur'),
(14, 'PRAGATI CA', 1, 'PRAGATI CAROGO\r\n'),
(15, 'DTDC Couri', 1, 'MIA Udaipur'),
(16, 'Bittu Road', 1, 'Indore'),
(17, 'VIJAY LAXM', 1, 'VIJAY LAXMI TRANSPORT CO\r\n'),
(18, 'Madur Cour', 1, 'Lodha Complex Udaipur'),
(19, 'TCI EXPRES', 1, 'TCI EXPRESS\r\n'),
(20, 'Jaipur Golden Transport Co. Pvt Ltd', 2147483647, 'JGTCL, Balicha\r\n'),
(21, 'Jain Goods', 1, '100 ft. Road Shobhagpura\r\n'),
(22, 'ARC', 1, 'aaaaaaaaaaaaaaa\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE IF NOT EXISTS `units` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`) VALUES
(1, 'KM'),
(2, 'No'),
(3, 'Mtr'),
(4, 'Set'),
(5, 'Mechanical Seal'),
(6, 'Pkt'),
(7, 'Kg'),
(8, 'Unit'),
(9, 'Pic');

-- --------------------------------------------------------

--
-- Table structure for table `user_rights`
--

CREATE TABLE IF NOT EXISTS `user_rights` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `login_id` int(10) NOT NULL,
  `page_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `user_rights`
--

INSERT INTO `user_rights` (`id`, `login_id`, `page_id`) VALUES
(65, 4, 1),
(66, 4, 2),
(67, 4, 3),
(68, 4, 4),
(69, 5, 1),
(70, 5, 2),
(71, 5, 3),
(72, 5, 4),
(73, 6, 1),
(74, 6, 2),
(75, 6, 3),
(76, 6, 4),
(77, 7, 1),
(78, 7, 2),
(79, 7, 3),
(80, 7, 4),
(81, 8, 1),
(82, 8, 2),
(83, 8, 3),
(84, 8, 4),
(97, 2, 1),
(98, 2, 2),
(99, 2, 3),
(100, 2, 4);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `company_name`, `address`, `tin_no`, `gst_no`, `ecc_no`, `pan_no`, `payment_terms`, `mode_of_payment`, `item_group_id`, `account_category_id`, `account_group_id`, `account_first_subgroup_id`, `account_second_subgroup_id`, `ledger_account_id`) VALUES
(1, 'Tushaco Pumps Pvt Ltd', 'Nani Daman', '088374748478', '83746383279587', '9848937257293298', '398589589598754', 30, 'NEFT', 1, 2, 2, 2, 2, 0),
(2, 'SPX Flow Technology Ltd', 'Odhav Industrial Area,\r\nAhmedabad	', '893648946349', '', 'aasd', 'asdd', 30, 'NEFT', 3, 2, 2, 2, 2, 72);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_contact_persons`
--

CREATE TABLE IF NOT EXISTS `vendor_contact_persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `default_person` int(1) NOT NULL,
  `account_category_id` int(10) NOT NULL,
  `account_group_id` int(10) NOT NULL,
  `account_first_subgroup_id` int(10) NOT NULL,
  `account_second_subgroup_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vendor_contact_persons`
--

INSERT INTO `vendor_contact_persons` (`id`, `vendor_id`, `name`, `email`, `mobile`, `default_person`, `account_category_id`, `account_group_id`, `account_first_subgroup_id`, `account_second_subgroup_id`) VALUES
(1, 1, 'Suresh Chandra', 'suresh@tushacopumps.com', 9871123470, 1, 0, 0, 0, 0),
(2, 2, 'Mayank Gadhavi', 'mayank@spx.com', 928465482939997, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vouchers_references`
--

CREATE TABLE IF NOT EXISTS `vouchers_references` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `voucher_entity` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

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

CREATE TABLE IF NOT EXISTS `voucher_ledger_accounts` (
  `vouchers_reference_id` int(10) NOT NULL,
  `ledger_account_id` int(10) NOT NULL,
  PRIMARY KEY (`vouchers_reference_id`,`ledger_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_ledger_accounts`
--

INSERT INTO `voucher_ledger_accounts` (`vouchers_reference_id`, `ledger_account_id`) VALUES
(1, 68),
(1, 70),
(1, 71),
(2, 71),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(3, 19),
(3, 20),
(3, 21),
(3, 22),
(3, 23),
(3, 24),
(3, 25),
(3, 26),
(3, 27),
(3, 28),
(3, 29),
(3, 30),
(3, 31),
(3, 32),
(3, 33),
(3, 34),
(3, 35),
(3, 36),
(3, 37),
(3, 38),
(3, 39),
(3, 40),
(3, 41),
(3, 42),
(3, 43),
(3, 44),
(3, 45),
(3, 46),
(3, 47),
(3, 48),
(3, 49),
(3, 50),
(3, 51),
(3, 52),
(3, 53),
(3, 54),
(3, 55),
(3, 56),
(3, 57),
(3, 58),
(3, 59),
(3, 60),
(3, 61),
(3, 62),
(3, 63),
(3, 64),
(3, 65),
(3, 66),
(3, 67),
(3, 68),
(3, 69),
(3, 70),
(3, 72),
(4, 68),
(4, 70),
(4, 71),
(5, 68),
(5, 70),
(5, 72),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10),
(6, 11),
(6, 12),
(6, 13),
(6, 14),
(6, 15),
(6, 16),
(6, 17),
(6, 18),
(6, 19),
(6, 20),
(6, 21),
(6, 22),
(6, 23),
(6, 24),
(6, 25),
(6, 26),
(6, 27),
(6, 28),
(6, 29),
(6, 30),
(6, 31),
(6, 32),
(6, 33),
(6, 34),
(6, 35),
(6, 36),
(6, 37),
(6, 38),
(6, 39),
(6, 40),
(6, 41),
(6, 42),
(6, 43),
(6, 44),
(6, 45),
(6, 46),
(6, 47),
(6, 48),
(6, 49),
(6, 50),
(6, 51),
(6, 52),
(6, 53),
(6, 54),
(6, 55),
(6, 56),
(6, 57),
(6, 58),
(6, 59),
(6, 60),
(6, 61),
(6, 62),
(6, 63),
(6, 64),
(6, 65),
(6, 66),
(6, 67),
(6, 69),
(6, 73),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(7, 7),
(7, 8),
(7, 9),
(7, 10),
(7, 11),
(7, 12),
(7, 13),
(7, 14),
(7, 15),
(7, 16),
(7, 17),
(7, 18),
(7, 19),
(7, 20),
(7, 21),
(7, 22),
(7, 23),
(7, 24),
(7, 25),
(7, 26),
(7, 27),
(7, 28),
(7, 29),
(7, 30),
(7, 31),
(7, 32),
(7, 33),
(7, 34),
(7, 35),
(7, 36),
(7, 37),
(7, 38),
(7, 39),
(7, 40),
(7, 41),
(7, 42),
(7, 43),
(7, 44),
(7, 45),
(7, 46),
(7, 47),
(7, 48),
(7, 49),
(7, 50),
(7, 51),
(7, 52),
(7, 53),
(7, 54),
(7, 55),
(7, 56),
(7, 57),
(7, 58),
(7, 59),
(7, 60),
(7, 61),
(7, 62),
(7, 63),
(7, 64),
(7, 65),
(7, 66),
(7, 67),
(7, 68),
(7, 69),
(7, 70),
(7, 72),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(8, 6),
(8, 7),
(8, 8),
(8, 9),
(8, 10),
(8, 11),
(8, 12),
(8, 13),
(8, 14),
(8, 15),
(8, 16),
(8, 17),
(8, 18),
(8, 19),
(8, 20),
(8, 21),
(8, 22),
(8, 23),
(8, 24),
(8, 25),
(8, 26),
(8, 27),
(8, 28),
(8, 29),
(8, 30),
(8, 31),
(8, 32),
(8, 33),
(8, 34),
(8, 35),
(8, 36),
(8, 37),
(8, 38),
(8, 39),
(8, 40),
(8, 41),
(8, 42),
(8, 43),
(8, 44),
(8, 45),
(8, 46),
(8, 47),
(8, 48),
(8, 49),
(8, 50),
(8, 51),
(8, 52),
(8, 53),
(8, 54),
(8, 55),
(8, 56),
(8, 57),
(8, 58),
(8, 59),
(8, 60),
(8, 61),
(8, 62),
(8, 63),
(8, 64),
(8, 65),
(8, 66),
(8, 67),
(8, 69),
(9, 68),
(9, 70),
(9, 72),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(10, 5),
(10, 6),
(10, 7),
(10, 8),
(10, 9),
(10, 10),
(10, 11),
(10, 12),
(10, 13),
(10, 14),
(10, 15),
(10, 16),
(10, 17),
(10, 18),
(10, 19),
(10, 20),
(10, 21),
(10, 22),
(10, 23),
(10, 24),
(10, 25),
(10, 26),
(10, 27),
(10, 28),
(10, 29),
(10, 30),
(10, 31),
(10, 32),
(10, 33),
(10, 34),
(10, 35),
(10, 36),
(10, 37),
(10, 38),
(10, 39),
(10, 40),
(10, 41),
(10, 42),
(10, 43),
(10, 44),
(10, 45),
(10, 46),
(10, 47),
(10, 48),
(10, 49),
(10, 50),
(10, 51),
(10, 52),
(10, 53),
(10, 54),
(10, 55),
(10, 56),
(10, 57),
(10, 58),
(10, 59),
(10, 60),
(10, 61),
(10, 62),
(10, 63),
(10, 64),
(10, 65),
(10, 66),
(10, 67),
(10, 69),
(10, 71),
(10, 73),
(11, 68),
(11, 70),
(11, 72),
(12, 1),
(12, 2),
(12, 3),
(12, 4),
(12, 5),
(12, 6),
(12, 7),
(12, 8),
(12, 9),
(12, 10),
(12, 11),
(12, 12),
(12, 13),
(12, 14),
(12, 15),
(12, 16),
(12, 17),
(12, 18),
(12, 19),
(12, 20),
(12, 21),
(12, 22),
(12, 23),
(12, 24),
(12, 25),
(12, 26),
(12, 27),
(12, 28),
(12, 29),
(12, 30),
(12, 31),
(12, 32),
(12, 33),
(12, 34),
(12, 35),
(12, 36),
(12, 37),
(12, 38),
(12, 39),
(12, 40),
(12, 41),
(12, 42),
(12, 43),
(12, 44),
(12, 45),
(12, 46),
(12, 47),
(12, 48),
(12, 49),
(12, 50),
(12, 51),
(12, 52),
(12, 53),
(12, 54),
(12, 55),
(12, 56),
(12, 57),
(12, 58),
(12, 59),
(12, 60),
(12, 61),
(12, 62),
(12, 63),
(12, 64),
(12, 65),
(12, 66),
(12, 67),
(12, 69),
(12, 71),
(12, 73),
(13, 68),
(13, 70),
(13, 72);

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
