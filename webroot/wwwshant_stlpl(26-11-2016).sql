-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Nov 26, 2016 at 05:49 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `account_first_subgroups`
--

INSERT INTO `account_first_subgroups` (`id`, `account_group_id`, `name`) VALUES
(1, 1, 'Sundry Debtors'),
(2, 2, 'Sundry Creditors'),
(3, 2, 'Duties & Taxes');

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
-- Table structure for table `account_second_subgroups`
--

CREATE TABLE IF NOT EXISTS `account_second_subgroups` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `account_first_subgroup_id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `account_second_subgroups`
--

INSERT INTO `account_second_subgroups` (`id`, `account_first_subgroup_id`, `name`) VALUES
(1, 1, 'Trade Debtors'),
(2, 2, 'Trade Creditors'),
(5, 3, 'Sales Tax');

-- --------------------------------------------------------

--
-- Table structure for table `challans`
--

CREATE TABLE IF NOT EXISTS `challans` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `created_on` date NOT NULL,
  `transporter_id` int(11) NOT NULL,
  `lr_no` int(11) NOT NULL,
  `reference_detail` varchar(255) NOT NULL,
  `total` decimal(18,2) NOT NULL,
  `documents` varchar(255) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `challan_type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `challans`
--

INSERT INTO `challans` (`id`, `customer_id`, `company_id`, `invoice_id`, `created_on`, `transporter_id`, `lr_no`, `reference_detail`, `total`, `documents`, `customer_address`, `created_by`, `challan_type`) VALUES
(1, 5, 25, 2, '2016-11-25', 1, 10000, 'We sent pump vide our Invoice No. STL/V-355/BE-3331/16-17 dt. 19.11.2016', '2000.00', 'Your returnable Gate Pass sent with Materials\r\n\r\nFOC under warranty Replacement ', 'Bangur Nagar\r\nBeawer 305901 ', 6, 'Non Returnable');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `challan_rows`
--

INSERT INTO `challan_rows` (`id`, `challan_id`, `item_id`, `description`, `quantity`, `rate`, `amount`) VALUES
(1, 1, 38, 'Coupling Guard', 2, '1000.00', '2000.00');

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
(27, 'Fluid Management & Solutions Llp', 'FMSL', '"A Square ", 3rd Floor,\r\n100 Ft. Road, 1 Shobhagpura,\r\nUdaipur 313011', 'aasspp122', '0987654341', 'aasdh31216', 'ansjkhbvd', 'aassddf55678', '2980435', '8696029999', 'info@mogragroup.com', 'www.mogragroup.com', 1, 'With Inventory', '57fcb8149f735.png');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `company_banks`
--

INSERT INTO `company_banks` (`id`, `company_id`, `bank_name`, `branch`, `account_no`, `ifsc_code`, `default_bank`) VALUES
(1, 24, 'Union Bank Of India', 'New Fatehpura', 2147483647, 'UBIN0539406', 1),
(10, 27, 'SBBJ', 'Shobhagpura', 2147483647, 'SBBJ001485', 1),
(13, 25, 'Union Bank of India', 'New Fatehpura', 2147483647, 'UBIN0539406', 1),
(14, 26, 'SBBJ', 'Shobhagpura', 2147483647, 'SBBJ0011485', 1),
(15, 28, 'Union Bank', 'Fatehpura', 2147483647, 'UBIN0539406', 1);

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
(1, 'Mogra Groups');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=62 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_group_id`, `customer_name`, `alias`, `district_id`, `company_group_id`, `customer_seg_id`, `tin_no`, `gst_no`, `pan_no`, `ecc_no`, `flag`, `employee_id`, `payment_terms`, `mode_of_payment`, `credit_limit`, `transporter_id`, `account_category_id`, `account_group_id`, `account_first_subgroup_id`, `account_second_subgroup_id`) VALUES
(1, 9, 'Jindal Saw Ltd.', 'BHL', 1, 1, 1, '08044052269', '', 'AABCS7280C', 'AABCS7280CEM018', 0, 1, 30, 'NEFT', 45, 4, 0, 0, 0, 0),
(3, 9, 'Adani Wilmar Limited', 'Alwar', 4, 1, 4, '08592105419', '', 'AABCA8056G', 'AABCA8056GXM004', 0, 3, 30, 'NEFT', 45, 1, 0, 0, 0, 0),
(4, 9, 'Adani Power Rajasthan Ltd', '', 12, 0, 3, '08932910817', '', 'AACCS229A', 'AACCSO229AXD001', 0, 3, 30, 'NEFT', 15, 0, 0, 0, 0, 0),
(5, 21, 'Shree Cement Ltd Beawer', '', 3, 1, 2, '08530101044', '', 'AACCS8796G', 'AACCS8796GXM001', 0, 4, 30, 'NEFT', 4000000, 0, 0, 0, 0, 0),
(6, 10, 'Honda Car India Pvt. Ltd.', '', 10, 0, 6, '08280854435', '08280854435', 'AAACH1765Q', 'AAACH1765QXM002', 0, 1, 30, 'NEFT', 500000, 0, 0, 0, 0, 0),
(7, 9, 'Ginni International Ltd.', '', 10, 1, 5, '08570700482', '08570700482', 'AAACG0182E ', 'AAACG0182EXM001', 0, 1, 30, 'NEFT', 500000, 0, 0, 0, 0, 0),
(8, 26, 'Advantage Oils Pvt Ltd', '', 4, 0, 4, '08512807355', '', 'AAMCA0464H', 'AACCSDCDFCCS', 0, 3, 30, 'NEFT', 15, 0, 0, 0, 0, 0),
(9, 28, 'Balkrishna Industries Limited', '', 10, 0, 7, '08470852051', '08470852051', 'AAACB3333J', 'AAACB3333JXM012', 0, 1, 30, 'NEFT', 500000, 0, 0, 0, 0, 0),
(10, 29, 'Acc Limited', '', 4, 0, 2, '08252801090', '', 'AAACT1507C', 'AAACT1507CXM013', 0, 3, 30, 'NEFT', 30, 0, 0, 0, 0, 0),
(11, 24, 'Gipl', '', 13, 0, 8, '08364000780', '08364000780', 'AEZPP6657H', 'AEZPP6657HED002', 0, 2, 1, 'NEFT', 30, 0, 0, 0, 0, 0),
(12, 30, 'Mangalam Cement Limited', '', 5, 1, 2, '08442902696', '', 'AABCM6602Q', 'AABCM6602QXM001', 0, 3, 30, 'NEFT', 15, 0, 0, 0, 0, 0),
(13, 31, 'Oswal Papers', '', 11, 0, 9, '08782152117', '08782152117', 'AAACO2222K', 'AAACO2222KM002', 0, 1, 0, 'NEFT', 10000, 0, 0, 0, 0, 0),
(14, 32, 'Shriram Rayons', '', 5, 0, 5, '08672951700', '', 'AAACD0204C', 'AAACD0204CXM004', 0, 3, 10, 'Cheque', 5, 0, 0, 0, 0, 0),
(15, 32, 'Shriram Cement Ltd', '', 5, 0, 2, '08452101422', '', 'AAACD0097R', 'AAACD0097RXM003', 0, 3, 30, 'NEFT', 15, 0, 0, 0, 0, 0),
(16, 26, 'Mahindra Holidays & Resorts India Limited', '', 13, 0, 12, '08091257429', '', 'AAHSEDITHL', 'AAHSEDITHLXX301', 0, 3, 5, 'Cheque', 0, 0, 0, 0, 0, 0),
(18, 33, 'Cuarzo', '', 13, 0, 10, '08043963320', '', 'AAHFC3351P', 'AAHFC3351PEM001', 0, 5, 7, 'Cheque', 10000, 0, 0, 0, 0, 0),
(19, 21, 'Shree Cement Ltd RAS', '', 15, 1, 2, '08530101044', '', 'AACCS8796G', 'AACCS8796GXM003', 0, 4, 30, 'NEFT', 30, 0, 0, 0, 0, 0),
(20, 11, 'Hindustan Zinc Ltd Chanderia', '', 14, 1, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM005', 0, 4, 30, 'NEFT', 4000000, 0, 0, 0, 0, 0),
(22, 31, 'Rajshree Pulp & Board Mills Pvt.Ltd.', '', 11, 0, 9, '08022252512', '', 'AACCS0222M', 'TobeProvide', 0, 1, 0, 'NEFT', 10000, 0, 0, 0, 0, 0),
(23, 26, 'Nav Durga Services', '', 13, 0, 8, '08403852930', '', 'AJSPR6875P', 'AJSPR6875PX003', 0, 3, 15, 'Cheque', 50000, 0, 0, 0, 0, 0),
(24, 35, 'United Spirits Ltd.', '', 13, 0, 14, '8432101045', '', 'AACCM8043J', 'tobeprovided', 0, 5, 7, 'NEFT', 100000, 0, 0, 0, 0, 0),
(25, 26, 'Ruchi Soya Industries Limited', '', 4, 0, 4, '08071606834', '', 'AAACR2892I', 'AAACR2892IXM017', 0, 3, 15, 'NEFT', 10000, 0, 0, 0, 0, 0),
(26, 34, 'United Breweries Ltd.,', '', 10, 1, 14, '08040853694', '08040853694', 'AACCS', 'Tobeprovide', 0, 1, 30, 'NEFT', 500000, 0, 0, 0, 0, 0),
(27, 11, 'Hindustan Zinc Ltd Agucha ', '', 1, 1, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM002', 0, 4, 30, 'NEFT', 400000, 0, 0, 0, 0, 0),
(28, 26, 'Sulux Phosphate', '', 13, 0, 15, '08773953170', '', 'tobeprovided', 'tobeprovided', 0, 5, 0, 'Cheque', 0, 0, 0, 0, 0, 0),
(30, 36, 'Carlsberg India Pvt. Ltd.,', '', 10, 0, 14, '08020605967', ' 08020605967', 'AAJCS8454J', 'AAJCS8454J', 0, 1, 30, 'NEFT', 500000, 0, 0, 0, 0, 0),
(31, 9, 'Adani Wilmar Ltd', '', 10, 0, 4, '08592105419', '08592105419', 'AABCA8056G', 'AABCA8056GXM004', 0, 1, 30, 'NEFT', 100000, 0, 0, 0, 0, 0),
(32, 26, 'Crown Colour Chem', '', 13, 0, 10, '08663951048', '', 'tobeprovided', 'tobeprovided', 0, 5, 0, 'Cheque', 0, 0, 0, 0, 0, 0),
(33, 19, 'J K White Cement ', '', 20, 1, 2, '08841152305', '', 'AABCJ0355R', 'AABCJ0355RXM004', 0, 4, 30, 'Cheque', 100000, 0, 0, 0, 0, 0),
(34, 37, 'Daikin Airconditioning India Pvt. Ltd.,', '', 10, 0, 16, '08452105399', '08452105399', 'AABCD0971F', 'AABCD0971F', 0, 1, 30, 'NEFT', 100000, 0, 0, 0, 0, 0),
(35, 26, 'Mewar Hitech Engineering Limited', '', 13, 0, 17, '08614003698', '', 'AAFCM3610E', 'AAFCM3610EXM001', 0, 5, 0, 'Cheque', 0, 0, 0, 0, 0, 0),
(36, 13, 'Miraj Multicolor', '', 13, 0, 10, '08364780780', '', 'Aezpp6666H', 'Aezpp6666HXM001', 0, 2, 30, 'NEFT', 500000, 0, 0, 0, 0, 0),
(37, 8, 'Ultratech Cement Ltd', '', 14, 1, 2, ' 08832112853', '', 'AAACL6442L', 'AAACL6442LEM033', 0, 4, 30, 'NEFT', 1500000, 0, 0, 0, 0, 0),
(38, 38, 'Neyveli Lignite Corporation Limited ', '', 21, 1, 3, '08351305980', '', 'AAACN1121C', 'AAACN1121CEM011', 0, 4, 30, 'NEFT', 2000000, 0, 0, 0, 0, 0),
(39, 8, 'Ultratech Cement Limited ', '', 22, 1, 2, ' 22961302649 ', '', 'AAACL6442L', 'AAACL6442LEM029', 0, 4, 30, 'NEFT', 1500000, 0, 0, 0, 0, 0),
(40, 26, 'Jubliant Life Science', '', 23, 0, 14, '08178174422', '', 'AEDGP3278H', 'AEDGP3278HXM001', 0, 2, 30, 'NEFT', 100000, 0, 0, 0, 0, 0),
(41, 8, 'Ultratech Cement Ltd., ', '', 24, 1, 2, ' 23762701822', '', ' AAACL6442L', 'AAACL6442LEM031 ', 0, 1, 30, 'NEFT', 1500000, 0, 0, 0, 0, 0),
(42, 26, 'Golden Drugs Pvt Ltd', '', 13, 1, 19, '08403967099', '', 'tobeprovided', 'AAECG9048BEM001', 0, 5, 15, 'Cheque', 100000, 0, 0, 0, 0, 0),
(43, 8, 'Ambuja Cement Limited', '', 15, 1, 2, '08160101490', '', 'AAACG0569P', 'AAACG0569PXM008', 0, 4, 30, 'NEFT', 1500000, 0, 0, 0, 0, 0),
(44, 26, 'Choksi Heraeus Pvt. Ltd. ', '', 13, 0, 19, '08533901019', '', 'AABCC1753G', 'AABCC1753GXM001', 0, 5, 7, 'Cheque', 50000, 0, 0, 0, 0, 0),
(45, 26, 'Reliance Chemotex Industries Limited', '', 13, 0, 5, '08253904471', '', 'AABCR3739H', 'AABCR3739HXM001', 0, 5, 30, 'Cheque', 100000, 0, 0, 0, 0, 0),
(46, 26, 'Bhansali Engineering Polymers Ltd', '', 13, 0, 19, '08283101440', '', 'AAACB3368H', 'tobeprovided', 0, 5, 7, 'NEFT', 50000, 0, 0, 0, 0, 0),
(47, 39, 'Udaipur Cement Works Ltd.', '', 13, 0, 2, '08134000373', '', 'AAACU8858M', 'AAACU8858MEM001', 0, 5, 30, 'NEFT', 100000, 0, 0, 0, 0, 0),
(48, 26, 'Shree Nurshing Paper & Oil Mill Pvt Ltd', '', 10, 0, 9, 'tobeprovided', '', 'tobeprovided', 'tobeprovided', 0, 5, 0, 'Cheque', 0, 0, 0, 0, 0, 0),
(49, 26, 'A H Corporation', '', 13, 0, 13, '08184003789', '', 'AEDPH2393N', 'AEDPH2393N', 0, 3, 1, 'Cash', 5, 0, 0, 0, 0, 0),
(50, 19, 'Cavendish Industries Limited,		', '', 25, 0, 7, '05015370839', '', 'AAFCC8999J', 'AAFCC8999J', 0, 3, 30, 'NEFT', 60000, 0, 0, 0, 0, 0),
(51, 19, 'J K Cement Mudupur', 'J K Cement', 26, 0, 2, '08841152305', '', 'AABCJ0355R', 'AABCJ0355RXM005', 0, 2, 30, 'NEFT', 45, 1, 1, 1, 1, 1),
(52, 19, 'J.K. Cement', '', 14, 0, 2, '08841152305', 'tobeprovided', 'AABCJ0355R', 'AABCJ0355RXM003', 0, 5, 30, 'NEFT', 1, 0, 0, 0, 0, 0),
(53, 29, 'Ambuja Cement Limited (W.B.)', '', 27, 0, 2, '19200024219', '', 'AAACG0569P ', ' AAACG0569PXM013 ', 0, 4, 30, 'NEFT', 28, 0, 0, 0, 0, 0),
(54, 26, 'Nachi KG Technology India Private Limited', '', 10, 0, 19, '08200704420', '', 'AADCN9030F', 'AADCN9030FEM001', 0, 1, 7, 'Cheque', 15, 0, 0, 0, 0, 0),
(55, 34, 'United Breweries Ltd.', '', 10, 0, 14, '08040853694', '', 'AACCS', 'Tobeprovide', 0, 1, 30, 'NEFT', 30, 0, 0, 0, 0, 0),
(56, 11, 'Hindustan Zinc Ltd (SK)', '', 17, 0, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM004', 0, 2, 30, 'NEFT', 45, 0, 0, 0, 0, 0),
(57, 26, 'Western Drugs Ltd.', '', 13, 0, 19, '08434000984', '08434000984', 'AAACR8995E', 'AAACR8995EXM001', 0, 1, 7, 'Cheque', 7, 0, 0, 0, 0, 0),
(58, 40, 'Lucid Colloids Ltd', '', 6, 0, 20, '08692652832', '', ' AAACL26738 ', 'ToBeProvided', 0, 4, 15, 'NEFT', 10, 0, 0, 0, 0, 0),
(59, 26, 'Rock Stone Industries', 'Rock', 13, 0, 10, 'tobeprovided', 'tobeprovided', 'tobeprovided', 'tobeprovided', 0, 5, 0, 'Cheque', 0, 1, 0, 0, 0, 0),
(60, 30, 'Birla Corporation Ltd (Chanderia)', 'Chanderia Cement Works', 14, 0, 2, '08761103461', '', 'AABCB2075J', 'AABCB2075JXM011', 0, 2, 30, 'Cheque', 45, 1, 0, 0, 0, 0),
(61, 26, 'Daurala Organics Ltd ', 'Unit II Hyrdo', 28, 0, 19, '08976543219', '', 'AADCC4444H', 'AADCC4444HXM002', 0, 2, 30, 'NEFT', 0, 1, 0, 0, 0, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=116 ;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`id`, `customer_id`, `address`, `district_id`, `telephone`, `mobile`, `transporter_id`, `default_address`) VALUES
(2, 2, 'Aurangabad', 2, '', '', 0, 1),
(7, 6, 'M/s Honda Cars India Ltd.,\r\nSPL-1, Tapukara Industrial Area,\r\nKHUSHKHERA-301707, Distt: Alwar (Raj.)', 10, '', '', 0, 1),
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
(66, 4, 'NH 90, Atru Road, Village Kawai, Taluka Atru, Baran 325 219, Rajasthan, India', 1, '', '', 1, 1),
(67, 48, 'Near United Spirits,\r\nMatsya Industrial Area,\r\nAlwar', 10, '', '', 0, 1),
(68, 19, 'Bangur City\r\nP.O. RAS, Tehsil : Jaitaran Dist.: Pali 306107 ', 3, '', '', 1, 1),
(69, 19, 'Shree Cement Ltd., Bangur Nagar\r\nBeawer 305901 ', 3, '', '', 1, 0),
(70, 49, 'Opp. Galaxy Apartment, Saifan Road,\r\nFatehpura, Udaipur 313002', 13, '', '', 0, 1),
(74, 50, 'Laksar Tyre Plant 2\r\nVill KHEDIMUBARAKPUR 247663 Teh Laksar Dist Haridwar Uttarakhand', 25, '', '', 1, 1),
(76, 52, 'JK Cement works Mangarol\r\nUnit of J.K. cxement Ltd\r\nKaulash Nagar, Nimbaheda- 312617 dist.: chittorgarh', 14, '', '', 0, 1),
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
(114, 3, 'Adani Wilmar Ltd,\r\nSilor Road, Kota Jaipur Highway, 323001, Bundi', 4, '', '', 1, 1),
(115, 51, 'Village- Muddapur, Taluk- District- Bhagalkot, Mudhol, Karnataka 587313\r\n', 26, '', '', 1, 1);

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
  `mobile` bigint(10) NOT NULL,
  `default_contact` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=108 ;

--
-- Dumping data for table `customer_contacts`
--

INSERT INTO `customer_contacts` (`id`, `contact_person`, `customer_id`, `designation`, `telephone`, `email`, `mobile`, `default_contact`) VALUES
(2, 'Pradeep Gupta', 2, 'purchase Executive', '9999999999', '', 2147483647, 1),
(7, 'Arun sharma', 6, 'Purchase Manager', '0149225056', '', 2147483647, 1),
(8, 'D K Jain', 7, 'GM Purchase', '0149424611', '', 2147483647, 1),
(10, 'Anurag jain', 9, 'AGM Purchase', '8058012345', '', 2147483647, 1),
(11, 'Pankaj Kumar', 10, 'Purchase Manager', '0743826158', '', 2147483647, 1),
(12, 'AJAY', 11, 'PURCHASE EXECUTIVE', '0294248603', '', 2147483647, 1),
(13, 'Vipesh Gupta', 12, 'GM - Purchase', '0745923281', '', 2147483647, 1),
(14, 'Sushil Dalmia', 13, 'Owner', '0141330156', '', 2147483647, 1),
(15, 'Anand Raju', 14, 'Purchase', '0744248000', '', 2147483647, 1),
(16, 'Nitin Paliwal', 15, 'Purchase Manager', '0744248099', '', 2147483647, 1),
(17, 'Sandeep Sharma', 16, 'Purchase Supervisor', '8696018770', '', 2147483647, 1),
(18, 'hemant joshi', 17, 'purchase', '9982887555', '', 2147483647, 1),
(19, 'hemant joshi', 18, 'purchase', '9982887555', '', 2147483647, 1),
(21, 'PC Pareek', 20, 'Manager Purchase', '0147226547', '', 2147483647, 1),
(22, 'PC Pareek', 21, 'Manager Purchase', '0147226547', '', 2147483647, 1),
(23, 'Sushil Dalmia', 22, 'Owner', '0141233015', '', 2147483647, 1),
(25, 'Mr Bhawesh Pandya', 24, 'fermentation process', '7742200666', '', 2147483647, 1),
(26, 'Sandeep Pandya', 25, 'Purchase Executive', '0744220879', '', 2147483647, 1),
(27, 'Nitin Jain', 26, 'Dy Manager Purchase', '0149351231', '', 2147483647, 1),
(28, 'Rupesh Jain', 27, 'Asst. Purchase Manager', '0148324518', '', 2147483647, 1),
(29, 'Mr Nikunj Jethaliya', 28, 'G.M.', '9829041408', '', 2147483647, 1),
(30, 'Mr Nikunj Jethaliya', 29, 'G.M.', '9829041408', '', 2147483647, 1),
(31, 'Anshul Kumar', 30, 'Purchase', '9887555388', '', 2147483647, 1),
(32, 'Imran Ali', 31, 'Purchase', '7665006863', '', 2147483647, 1),
(33, 'Mr Attarwala  Ji', 32, 'owner', '9828360939', '', 2147483647, 1),
(34, 'Sumit Arora', 33, 'Manager Purchase', '0159123020', '', 2147483647, 1),
(35, 'Mukesh Sharma', 34, 'Utility', '1494671110', '', 2147483647, 1),
(36, 'SKS Rathore', 35, 'purchase', '9829301688', '', 2147483647, 1),
(37, 'Mr. Ranveer Singh', 36, 'Project Manager', '0294241841', '', 2147483647, 1),
(38, 'Mr. N.K Paliwal', 36, 'Account Manager', '0294241841', '', 2147483647, 0),
(39, 'Mr. Jayant Kumar', 36, 'Store Incharge', '0294241842', '', 2147483647, 0),
(40, 'Satish Sukla ', 37, 'Asst. Manager Purchase', '0147225678', '', 2147483647, 1),
(41, 'Stores', 38, 'DGM', '0151284757', '', 1512847574, 1),
(42, 'Jivan Agarwal', 39, 'Manager Purchase', '7726288217', '', 2147483647, 1),
(43, 'MR. PANKAJ JHA', 40, 'PURCHASE EXECUTIVE', '0222487878', '', 993243244, 1),
(44, 'Hari Maloo', 41, 'Manager Purchase', '0742023052', '', 2147483647, 1),
(45, 'Gulshan jain', 42, 'Director', '0294249041', '', 2147483647, 1),
(46, 'Sanjay Jain', 43, 'Asst. Manager Purchase', '9460477877', '', 2147483647, 1),
(47, 'Santosh sharma ', 44, 'logistics', '0294249002', '', 2147483647, 1),
(48, 'S.K.Verdia', 45, ' Purchase', '0294249048', '', 2147483647, 1),
(49, 'G.N.Raut', 46, 'mechanical', '8003193301', '', 2147483647, 1),
(50, 'Rahul jain', 47, 'purchase', '7728886069', '', 2147483647, 1),
(56, 'Vivek Saxena', 5, 'Asst. Manager purchase', '0908078989', '', 2147483647, 1),
(58, 'Gopal Singh', 23, 'Director', '9799480639', '', 9823499887, 1),
(59, 'Sanjay Jain', 4, 'Asst Manager techno commercial', '0792578663', '', 2147483647, 1),
(60, 'Mr. Bhutoria Ji', 48, 'M.D.', '9414016458', '', 9414016458, 1),
(61, 'Vivek Saxena ', 19, 'Asst. purchase Manager', '6758696956', '', 2147483647, 1),
(62, 'Navneet', 19, 'Asst. Purchase Manager', '9251077025', '', 9251077025, 0),
(63, 'Ali Hussain', 49, 'Director', '9828186876', '', 9828186876, 1),
(67, 'Vineet Dixit', 50, 'Purchase', '0891200027', '', 8912000274, 1),
(69, 'Prem Prakash Ji', 52, 'mechanical', '01477', '', 9672861663, 1),
(71, 'Sanjay Paul', 53, 'Asst. Manager Purchase', '0336608710', '', 9674742088, 1),
(72, 'Sachin Sharma', 54, 'Purchaseer', '294', '', 7073720222, 1),
(73, 'ASHUTOSH SINGH', 55, 'Manager Mechenical', '9057904835', '', 9672993517, 1),
(74, 'Mr. Tamil selvan', 56, 'Electrical Engineer', '9983247774', '', 9983247774, 1),
(75, 'Santosh Shrivastav', 57, 'Purchase Executive', '9001999743', '', 9001999743, 1),
(76, 'Yusuf Ansari', 8, 'Purchase', '7475130021', '', 7475130021, 1),
(77, 'Bharat Goyal', 58, 'Asst.  Sales Manager', '0291272021', '', 9314760025, 1),
(82, 'A.H. Rangwala Sir', 59, 'M.D.', '0980980980', '', 9898989898, 1),
(98, 'NIKHIL SHARDA', 60, 'Purchase Executive', '0147225945', '', 9983247774, 1),
(99, 'K G Badhera', 60, 'Purchase Executive', '0147225663', '', 9983247775, 1),
(102, 'Ajay Kumar Mehta', 61, 'Purchase Excutive', '0112387123', '', 9983247774, 1),
(103, 'Satpal Marwah', 1, 'Dy. Manager', '0114502120', '', 9829043534, 1),
(104, 'Abhishek Sharma', 1, 'Purchase Executive', '8003698108', '', 8003698108, 0),
(105, 'Sachin kanungo', 3, 'Purchase Manager', '7472446647', '', 2147483647, 1),
(106, 'Sachin Solanki', 3, 'Purchase Executive', '7472446647', '', 2147483647, 0),
(107, 'SUJOY KUMAR', 51, 'MANAGER PURCHASE', '9983247774', '', 9983247774, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE IF NOT EXISTS `customer_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

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
(40, 'Lucid');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

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
(28, 'New Delhi', 'New Delhi');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `sex`, `dipartment_id`, `designation_id`, `mobile`, `email`, `signature`, `account_no`, `bank_name`, `branch_name`, `ifsc_code`, `permanent_address`, `residence_address`, `phone_no`, `dob`, `marital_status`, `date_of_anniversary`, `spouse_name`, `children`, `spouse_working`, `qualification`, `last_company`, `join_date`, `permanent_join_date`, `blood_group`, `account_category_id`, `account_group_id`, `account_first_subgroup_id`, `account_second_subgroup_id`) VALUES
(1, 'Mohammed Arif', 'Male', 1, 1, '9649004777', 'arif@mogragroup.com', '5806126b0b6e8.png', '', '', '', '', '', '', '0', '0000-00-00', '', '0000-00-00', '', 0, '0', '', '', '0000-00-00', '0000-00-00', '', 0, 0, 0, 0),
(2, 'Jagdish Salvi', 'Male', 1, 2, '9983247774', 'jagdish@mogragroup.com', '580dabf8784e4.png', '', '', '', '', '', '', '0', '0000-00-00', '', '0000-00-00', '', 0, '0', '', '', '0000-00-00', '0000-00-00', '', 0, 0, 0, 0),
(3, 'Harshit Patel', 'Male', 1, 2, '9772404777', 'harshit@mogragroup.com', '580dac166a19d.png', '', '', '', '', '', '', '0', '0000-00-00', '', '0000-00-00', '', 0, '0', '', '', '0000-00-00', '0000-00-00', '', 0, 0, 0, 0),
(4, 'Pushpendra Chauhan', 'Male', 1, 3, '9672994770', 'pushpendra@mogragroup.com', '580dac3905fe0.png', '', '', '', '', '', '', '0', '0000-00-00', '', '0000-00-00', '', 0, '0', '', '', '0000-00-00', '0000-00-00', '', 0, 0, 0, 0),
(5, 'Vijay Gohil', 'Male', 1, 2, '9772604777', 'vijay@mogragroup.com', '580dac676529b.png', '', '', '', '', '', '', '0', '0000-00-00', '', '0000-00-00', '', 0, '0', '', '', '0000-00-00', '0000-00-00', '', 0, 0, 0, 0),
(6, 'Jitendra Singh Jhala', 'Male', 2, 2, '8696029999', 'dispatch@mogragroup.com', '580daaa1c6f38.png', '', '', '', '', '', '', '0', '0000-00-00', '', '0000-00-00', '', 0, '0', '', '-', '0000-00-00', '0000-00-00', '', 0, 0, 0, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `employee_contact_persons`
--

INSERT INTO `employee_contact_persons` (`id`, `employee_id`, `name`, `mobile`, `landline`, `email`, `relation`) VALUES
(1, 18, 'Gops', 127, 127, 'gops@gmail.com', 'Xdcfvgbh'),
(2, 18, 'Gops', 127, 127, 'gops@gmail.com', '45678'),
(5, 19, 'Gops', 98765432, 9876543, 'gops@gmail.com', 'Bro'),
(6, 19, 'Yash', 98764567, 98765, 'yash@gmail.com', 'Bro'),
(7, 20, 'Wer', 23234, 4324, 'we@df.esdg', 'E3r4r'),
(8, 20, 'Wefrt', 2342, 4234, 'we@df.esdg', 'Qwr45');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

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
(75, 'BE', 1, 3361);

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
  `grn3` varchar(10) NOT NULL,
  `grn4` varchar(10) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Pending',
  `created_by` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `grns`
--

INSERT INTO `grns` (`id`, `vendor_id`, `date_created`, `purchase_order_id`, `company_id`, `grn1`, `grn3`, `grn4`, `status`, `created_by`) VALUES
(2, 5, '2016-11-18', 2, 27, 'FMSL', 'rt4', '16-17', '', 19700101),
(3, 1, '2016-11-25', 3, 25, 'STL', 'BE 2334', '16-17', '', 19700101),
(4, 1, '2016-11-25', 3, 25, 'STL', 'BE 4567', '16-17', '', 19700101);

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
(3, 2, 41, 10, ''),
(4, 2, 38, 5, ''),
(5, 3, 38, 1, ''),
(6, 4, 38, 1, '');

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
  `sale_tax_description` varchar(255) NOT NULL,
  `sale_tax_amount` decimal(15,2) NOT NULL,
  `exceise_duty` decimal(10,2) NOT NULL,
  `ed_description` varchar(255) NOT NULL,
  `fright_amount` decimal(8,2) NOT NULL,
  `fright_text` varchar(255) NOT NULL,
  `grand_total` decimal(18,2) NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `customer_id`, `customer_address`, `lr_no`, `terms_conditions`, `discount_type`, `total`, `pnf`, `pnf_type`, `pnf_per`, `total_after_pnf`, `sale_tax_per`, `sale_tax_description`, `sale_tax_amount`, `exceise_duty`, `ed_description`, `fright_amount`, `fright_text`, `grand_total`, `date_created`, `company_id`, `process_status`, `sales_order_id`, `in1`, `in2`, `in4`, `in3`, `customer_po_no`, `po_date`, `additional_note`, `employee_id`, `created_by`, `transporter_id`, `discount_per`, `discount`, `form47`, `form49`) VALUES
(1, 56, 'SK Mines \r\nRajpura Dariba', 'LR-12345', '', 0, '99999974.75', '0.00', 0, '0.00', '99999974.75', '14.50', '14.50 % VAT or as applicable on date of dispatch', '14499996.34', '3.00', 'Excose Duot text', '10.00', 'Fright Amo\r\nFright Amo', '114499981.09', '2016-11-12', 25, 'Pulled From Sales-Order', 31, 'STL', 0, '16-17', 'BE-3355', '123456789', '2016-11-03', '', 2, 1, 5, '0.00', '28.25', '', ''),
(2, 8, 'NH 12 Ramganj Balaji Bundi 323001 Rajasthan', 'gdfgdf', '', 0, '12500.00', '0.00', 0, '0.00', '12500.00', '5.50', '5.50 % VAT or as applicable on date of dispatch', '687.50', '0.00', '', '0.00', '', '13187.50', '2016-11-12', 25, 'Pulled From Sales-Order', 26, 'STL', 0, '16-17', 'BE-3356', '15001', '2016-11-03', '', 4, 1, 3, '0.00', '0.00', '', ''),
(3, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 'Lr23', '', 0, '6000.00', '0.00', 0, '0.00', '6000.00', '0.00', 'NIL CST agst C & E1 Form', '0.00', '0.00', '', '0.00', '', '6000.00', '2016-11-12', 27, 'Pulled From Sales-Order', 32, 'FMSL', 0, '16-17', 'BE-3', 'we43', '2016-11-09', '', 1, 1, 4, '0.00', '0.00', '', ''),
(4, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 'LR34', '', 0, '2940.00', '58.80', 1, '2.00', '2998.80', '5.50', '5.50 % VAT or as applicable on date of dispatch', '164.93', '123.00', 'Reimbursement of excise as per invocie no. 123 dated 2.11.2016', '510.00', 'Fregit paid vide Docket number 2234567874 datede 2.11.2016 of Gatio Cargo', '3673.73', '2016-11-14', 27, 'Pulled From Sales-Order', 32, 'FMSL', 0, '16-17', 'BE-3', 'we43', '2016-11-09', 'Balcne material will be shipped after 20.11.2016', 1, 1, 4, '0.00', '60.00', '', ''),
(5, 60, 'Chanderia Cement Work\r\nMadhav Nagar \r\nP.O. Cement Factory', '12345678', '', 0, '30787.00', '615.74', 1, '2.00', '31402.74', '5.50', '', '1727.15', '2990.00', 'Excise duty INR  2990 wide johnson invoce no 274 date 12.11.16', '0.00', 'NA', '33129.89', '2016-11-14', 25, 'Pulled From Sales-Order', 33, 'STL', 0, '16-17', 'BE-3358', '4500054519', '2016-11-14', 'Local Cartage Will be add in GR INR 500', 2, 2, 7, '5.00', '1463.00', '', ''),
(6, 1, 'M/s Jindal Saw Limited,     \r\nAraji No. 9697/6711, Near Tiranga Hills,\r\nVill.: PUR-311802,\r\nDistt: Bhilwara (Raj.)\r\n', '12', '', 0, '9990.00', '0.00', 0, '0.00', '9990.00', '5.50', '5.50 % VAT or as applicable on date of dispatch', '549.45', '0.00', '', '0.00', '', '10539.45', '2016-11-14', 25, 'Pulled From Sales-Order', 29, 'STL', 0, '16-17', 'BE-3', '450078456', '2016-11-03', '', 1, 1, 7, '0.00', '210.00', '', ''),
(7, 51, 'Address: Village- Muddapur, \r\nTaluk- District- Bhagalkot, \r\nMudhol, \r\nKarnataka 587313\r\n', '789 Dated 21.11.2016  On Freight Paid Door Delivery on TD', '', 0, '18834260.00', '10000.00', 0, '0.00', '18844260.00', '2.00', '2 % CST against C Form', '376885.20', '811260.00', 'Excise Reimbursement agst invoice number 159 dated 24.11.2016\r\n', '0.00', '', '19221145.20', '2016-11-25', 26, 'Pulled From Sales-Order', 34, 'SML', 0, '16-17', 'BE-3336', '123456', '2016-11-14', '', 2, 2, 20, '0.00', '5000.00', '', ''),
(8, 61, 'Lane No 76 Rajendra Palace', '23456', '', 0, '9800.00', '294.00', 1, '3.00', '10094.00', '2.00', '2 % CST against C Form', '201.88', '14800.00', 'excise duty 21400 wide johnson invoice 274 date 10.11.16', '0.00', '', '10295.88', '2016-11-18', 25, 'Pulled From Sales-Order', 35, 'STL', 0, '16-17', 'BE-3359', '123456789', '2016-11-17', 'VAT 47   Vat 49', 2, 2, 20, '0.00', '2450.00', '', ''),
(9, 61, 'Lane No 76 Rajendra Palace', 'fgh5', '', 1, '189000.00', '0.00', 0, '0.00', '189000.00', '2.00', '2 % CST against C Form', '3780.00', '0.00', '', '0.00', '\r\n', '192780.00', '2016-11-22', 25, 'Pulled From Sales-Order', 35, 'STL', 0, '16-17', 'BE-3359', '123456789', '2016-11-17', '', 3, 1, 20, '10.00', '21000.00', '', ''),
(10, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 'qqqqqqq', '', 0, '121.00', '11.00', 0, '0.00', '132.00', '5.50', '5.50 % VAT or as applicable on date of dispatch', '7.26', '11.00', '', '111111.00', '', '111250.26', '2016-11-25', 25, 'Pulled From Sales-Order', 40, 'STL', 1, '16-17', 'BE-3', 'q24r5ty', '2016-11-22', 'qertyuiop[]\\', 1, 1, 4, '0.00', '11.00', '123123', ''),
(11, 33, ' P.O. Gotan , Distt.: Nagaur-342902', '333', '', 1, '22800.00', '1140.00', 1, '5.00', '23940.00', '5.50', '5.50 % VAT or as applicable on date of dispatch', '1316.70', '0.00', '', '250.00', 'Local Cartage', '25506.70', '2016-11-25', 25, 'Pulled From Sales-Order', 41, 'STL', 2, '16-17', 'BE-3325', '11111111', '2016-11-25', '', 2, 2, 7, '5.00', '1200.00', '', ''),
(12, 5, 'Bangur Nagar\r\nBeawer 305901 ', '18746 dt. 27.07.2016', '', 1, '105648.00', '0.00', 0, '0.00', '105648.00', '5.50', '5.50 % VAT or as applicable on date of dispatch', '5810.64', '0.00', '', '0.00', '', '111458.64', '2016-11-25', 25, 'Pulled From Sales-Order', 39, 'STL', 3, '16-17', 'BE-2992', '376360', '2016-11-19', 'Direct for Payment within 30 days after receive the materials', 4, 6, 7, '20.00', '26412.00', '', ''),
(13, 24, 'Unit Udaipur\r\nUdaisagar Road MIA\r\nUdaipur-313001, Rajasthan', '12345', '', 1, '2940.00', '58.80', 1, '2.00', '2998.80', '5.50', '', '164.93', '0.00', '', '0.00', '', '3163.73', '2016-11-25', 25, 'Pulled From Sales-Order', 42, 'STL', 4, '16-17', 'BE-3321', '123', '2016-11-25', '', 1, 1, 10, '2.00', '60.00', '', ''),
(14, 55, 'PLOT NO. SP3-3A RIICO INDUSTRIAL AREA NH-8 SHAHJAHANPUR', '789798798 dt. 26.11.2016 "FREIGHT PAID DOOR DELIVERY" basis', '', 0, '122610.00', '2452.20', 1, '2.00', '125062.20', '5.50', '5.50 % VAT or as applicable on date of dispatch', '6878.42', '0.00', '', '4500.00', 'Re-imbursement of freight charges', '136440.62', '2016-11-25', 25, 'Pulled From Sales-Order', 43, 'STL', 5, '16-17', 'BE-3296', '4501445065', '2016-09-28', 'Direct for payment within 10 days', 1, 6, 6, '0.00', '0.00', '', ''),
(15, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', '_', '', 1, '1402.20', '28.04', 1, '2.00', '1430.24', '5.50', '5.50 % VAT or as applicable on date of dispatch', '78.66', '0.00', '', '510.00', 'Paid to Gati Cargo agst docket no. 1234567 8754 dated 26.11.2016', '2018.91', '2016-11-26', 25, 'Pulled From Sales-Order', 38, 'STL', 6, '16-17', 'BE-3', '12345qwert', '2016-11-22', 'Payment against dispatch documents', 1, 1, 5, '5.00', '73.80', 'AACCH1235', '');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_bookings`
--

CREATE TABLE IF NOT EXISTS `invoice_bookings` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `grn_id` int(10) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `created_on` date NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=92 ;

--
-- Dumping data for table `invoice_rows`
--

INSERT INTO `invoice_rows` (`id`, `invoice_id`, `item_id`, `description`, `quantity`, `rate`, `amount`, `height`) VALUES
(13, 1, 96, 'Impeller\r\n', 100, '1000000.00', '100000000.00', 0),
(14, 2, 67, 'Impeller for Pump Model - KGEN 12b-5 G1', 5, '2500.00', '12500.00', 0),
(16, 3, 41, '', 2, '3000.00', '6000.00', 0),
(19, 5, 104, 'Item Code: 200020816\r\nName : Casing\r\nPump Model : MCH 14BX 4-5', 2, '2270.00', '4540.00', 0),
(20, 5, 105, 'Item Code: 200020982\r\nName : Ring\r\nPump Model : MCH 14BX 4-5', 4, '670.00', '2680.00', 0),
(21, 5, 106, 'Item Code: 200088108\r\nName : Wearing\r\nPump Model : MCH 14BX 4-5', 4, '990.00', '3960.00', 0),
(22, 5, 107, 'Item Code: 200020847\r\nName : Gasket\r\nPump Model : MCH 14BX 4-5', 8, '50.00', '400.00', 0),
(23, 5, 108, 'Item Code: 200020880\r\nName : Impeller Key\r\nPump Model : MCH 14BX 4-5', 8, '110.00', '880.00', 0),
(24, 5, 109, 'Item Code: 200088109\r\nName : Smotheing Bush\r\nPump Model : MCH 14BX 4-5', 8, '2100.00', '16800.00', 100),
(26, 4, 41, 'Motor 3 HP  / 1500 RPM', 1, '3000.00', '3000.00', 0),
(28, 6, 38, 'Item Code :-10115542\r\nMake : Darling\r\n\r\n Water dewatering submersible pump 50m³/hr capacity and 25 to 30 mtr head With all accessories  ( As per last Supply ) \r\n\r\nPrice for Complete Set  : Rs. 49500/- each set', 1, '10200.00', '10200.00', 0),
(36, 8, 38, 'PUMP MODEL:KGEN 11-3 G1\r\nHEAD:30MTR\r\nOUTLET:50MM\r\nFLOW;1200LPM', 7, '1750.00', '12250.00', 300),
(38, 9, 38, 'PUMP MODEL:KGEN 11-3 G1\r\nHEAD:30MTR\r\nOUTLET:50MM\r\nFLOW;1200LPM', 12, '17500.00', '210000.00', 250),
(59, 7, 66, ' Mechanical seal Complete Unit\r\nPump Model                         KGEN 11-3 G1\r\nSR No                                        141013\r\n', 4, '4500000.00', '18000000.00', 0),
(60, 7, 69, 'SS Shaft for Johnson Pump \r\nPump Model                         KGEN 11-3 G1\r\nSR No                                        141013', 4, '7000.00', '28000.00', 230),
(61, 10, 37, 'dddd', 11, '11.00', '121.00', 0),
(63, 11, 63, 'Pump Model\r\nCapacity\r\nHead\r\nSeal', 2, '12000.00', '24000.00', 0),
(80, 12, 111, 'Spares for "JOHNSON" Pump Model  CCR 50 160 R6 M2 L3\r\nItem code : PUMPSPAR0373  Pump Casing    \r\n', 2, '46100.00', '92200.00', 0),
(81, 12, 112, 'Item code : PUMPSPAR0400  Pump Shaft', 2, '8500.00', '17000.00', 0),
(82, 12, 113, 'Item code : PUMPSPAR0651 Wear Ring', 2, '3780.00', '7560.00', 0),
(83, 12, 114, 'Item code : SLEVSEAL0293  Shaft Sleeve', 3, '5100.00', '15300.00', 260),
(84, 13, 112, 'Pump Shaft for Pump Model CN 25 160', 2, '1500.00', '3000.00', 250),
(88, 14, 115, '"JOHNSON" Centrifugal Pump Sets\r\nModel          :       CN 65 160 G1 S2 L3\r\nCapacity     :       100 M3/HR\r\nHead            :       34 Mtrs.\r\nSuc*Dis.       :       80*65 mm\r\nSealing         :       Gland Packing\r\nwith "SIEMENS" 20 HP/2900 RPM Motor, Coupling L-110, Coupling Guard Fasteners dully assembled on MS Baseframe\r\nPump Sr. No. : B111272019, B111272018\r\nMotor Sr. No. : 22850862, 22850856\r\n  \r\n', 2, '61305.00', '122610.00', 200),
(91, 15, 38, 'Kgen 11 3 G1 Pump', 12, '123.00', '1476.00', 200);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=116 ;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `alias`, `item_category_id`, `item_group_id`, `item_sub_group_id`, `unit_id`, `ob_quantity`, `ob_rate`, `ob_value`, `freeze`, `serial_number_enable`, `source`, `minimum_quantity`, `maximum_quantity`, `dynamic_cost`, `minimum_selling_price_factor`) VALUES
(37, '120x1c', 'Coper Armad', 2, 2, 2, 3, 500, 900, '450000.00', 1, 1, '', 500, 500, '0.00', '0.00'),
(38, 'KGEN 11-3 G1', 'KGEN 11 3', 1, 3, 5, 2, 1, 10000, '10000.00', 0, 1, '', 1, 1, '10000.00', '1.10'),
(39, 'Exp ', 'Sr No', 1, 1, 1, 2, 1, 50000, '50000.00', 1, 1, '', 1, 1, '0.00', '1.15'),
(40, 'Star Delta Panel', '40hp', 1, 1, 1, 2, 1, 40000, '40000.00', 0, 0, '', 1, 1, '0.00', '0.00'),
(41, '3 HP / 1500 RPM BBL Motor', '3 HP / 1500 RPM Motor', 2, 12, 20, 2, 1, 10000, '10000.00', 0, 1, '', 1, 1, '555.00', '1.50'),
(42, 'Cable Tray', '450x50x50', 1, 1, 1, 3, 100, 2, '200.00', 0, 0, '', 100, 100, '0.00', '0.00'),
(43, 'Cable Tray', '750x75x75x2', 1, 1, 1, 3, 100, 700, '70000.00', 0, 0, '', 100, 100, '0.00', '0.00'),
(44, 'Transformer 415/15kva', '415/15kva', 1, 1, 8, 2, 1, 100000, '100000.00', 0, 0, '', 1, 1, '0.00', '1.10'),
(45, 'Cable', '35x3c', 1, 1, 1, 3, 1, 48, '48.00', 0, 0, '', 50, 50, '0.00', '0.00'),
(46, 'Panel', 'Distribution', 1, 1, 1, 2, 1, 20000, '20000.00', 0, 0, '', 1, 1, '0.00', '0.00'),
(47, 'Cable Gland', 'Cable Gland 1.25"', 1, 1, 1, 2, 1, 18, '18.00', 0, 0, '', 1, 1, '0.00', '0.00'),
(48, 'Lugs', 'Lugs', 1, 1, 1, 2, 1, 10, '10.00', 0, 0, '', 1, 1, '0.00', '0.00'),
(49, 'Coupling', '45', 1, 1, 1, 9, 10, 250, '2500.00', 1, 0, '', 2, 10, '0.00', '0.00'),
(50, 'Ms Baseframe', '45', 1, 1, 1, 9, 10, 2500, '25000.00', 0, 0, '', 2, 10, '0.00', '0.00'),
(52, 'Tushaco Pump Spare', '0', 1, 1, 1, 2, 1, 15000, '15000.00', 1, 0, '', 1, 2, '0.00', '0.00'),
(53, 'Jointing Kit', 'Indoor Type', 1, 1, 1, 4, 1, 1500, '1500.00', 0, 0, '', 1, 1, '0.00', '0.00'),
(54, 'Mcv 14 B 6', 'Johnson', 1, 1, 1, 8, 1, 44500, '44500.00', 0, 0, '', 2, 4, '0.00', '0.00'),
(55, 'Tushaco Pump', '0', 1, 1, 1, 2, 1, 16000, '16000.00', 1, 0, '', 1, 2, '0.00', '0.00'),
(57, 'Ww 101', 'Ww 101', 1, 5, 10, 2, 10, 10500, '105000.00', 0, 1, '', 5, 10, '12500.00', '1.10'),
(58, 'Motor 1 HP / 2980 RPM', 'Motor 1 Hp / 2980 Rpm', 2, 2, 2, 2, 12, 5000, '60000.00', 0, 1, '', 3, 8, '0.00', '0.00'),
(59, 'Cn 40 200 G1 S2 L3  With 2 Hp Motor', 'Cn 40 200', 1, 1, 1, 2, 9, 20000, '180000.00', 0, 1, '', 5, 10, '0.00', '0.00'),
(60, 'CCR 25 160 R6m2l3', 'Centrifugal Pump', 1, 1, 1, 2, 2, 25000, '50000.00', 0, 0, '', 2, 5, '0.00', '0.00'),
(61, 'KGEN 11 3 G1', 'KGEN 11 3 G1', 1, 3, 5, 2, 1, 1350, '1350.00', 0, 1, '', 10, 15, '0.00', '0.00'),
(62, 'Ccr 40 200 Bare Pump', 'Ccr Pump', 1, 1, 1, 2, 10, 45000, '450000.00', 0, 1, '', 2, 4, '0.00', '0.00'),
(63, 'Rt10 ', 'Oil Pump', 1, 1, 1, 2, 5, 9000, '45000.00', 0, 1, '', 5, 7, '10000.00', '1.10'),
(64, 'Ccr 25 160 G1 S2 L3', 'Centrifugal Pump', 1, 1, 1, 2, 1, 30000, '30000.00', 0, 1, '', 2, 4, '0.00', '0.00'),
(65, 'Cn 40 160 G1 S2 L3', 'Centrifugal Pump', 1, 1, 1, 2, 1, 15000, '15000.00', 0, 1, '', 2, 5, '0.00', '0.00'),
(66, 'Mechanical Seal', 'Spares Of Fre Pump', 1, 1, 1, 2, 1, 15000, '15000.00', 0, 0, '', 0, 1, '0.00', '0.00'),
(67, 'Impeller', 'Spares Of Fre Pump', 1, 1, 1, 2, 1, 8000, '8000.00', 0, 0, '', 0, 1, '0.00', '0.00'),
(68, 'Wear Plate', 'Spares Of Fre Pump', 1, 1, 1, 2, 1, 5000, '5000.00', 0, 0, '', 0, 1, '0.00', '0.00'),
(69, 'Shaft Ss', 'Spares Of Fre Pump', 1, 1, 1, 2, 1, 3000, '3000.00', 0, 0, '', 0, 1, '0.00', '0.00'),
(70, 'Spring Washer', 'Spares Of Fre Pump', 1, 1, 1, 2, 1, 150, '150.00', 0, 0, '', 0, 1, '0.00', '0.00'),
(71, 'Wp-05d/35', 'Sewage Pump', 1, 1, 1, 2, 1, 50000, '50000.00', 0, 0, '', 0, 1, '0.00', '0.00'),
(72, 'Kgen 15 6 G1', 'Johnson Make Self Priming Pump', 1, 1, 1, 2, 1, 15000, '15000.00', 0, 1, '', 5, 8, '0.00', '0.00'),
(73, 'name', 'alias', 0, 0, 0, 0, 0, 0, '0.00', 0, 0, 'source', 0, 0, '0.00', '0.00'),
(74, 'IMPELLER', 'KGEN 15- 6', 3, 6, 3, 2, 10, 3000, '30000.00', 1, 0, '', 5, 15, '0.00', '0.00'),
(75, 'ED-01', 'ED-01', 1, 11, 13, 1, 1, 4000, '4000.00', 1, 1, '', 2, 10, '0.00', '0.00'),
(76, '1 HP / 1500 RPM BBL Motor', '1 HP / 1500 RPM BBL Motor', 2, 12, 20, 2, 1, 1234, '1234.00', 0, 1, '', 1, 1, '0.00', '0.00'),
(77, 'Heat Exchanger', 'Heat Exchanger', 4, 14, 21, 2, 1, 400000, '400000.00', 0, 1, '', 1, 1, '0.00', '0.00'),
(78, 'KGEN 25n 10', 'KGEN 25 N 10', 1, 3, 5, 2, 0, 0, '0.00', 0, 1, '', 2, 3, '0.00', '0.00'),
(79, 'RT 125/32', 'RT 125/32', 1, 1, 22, 2, 1, 10000, '10000.00', 1, 1, '', 1, 1, '15000.00', '1.10'),
(80, 'Stator T1SB 100.1', 'Stator T1SB 100.1', 3, 8, 23, 2, 1, 14535, '14535.00', 1, 0, '', 1, 1, '0.00', '0.00'),
(81, 'KGEN 12-6 G1', 'KGEN 12-6 G1', 1, 3, 5, 2, 4, 8000, '32000.00', 1, 1, '', 1, 4, '0.00', '0.00'),
(82, 'Seal Kit Set Of TRF 1300 Pump', 'Seal Kit', 3, 16, 24, 2, 1, 180000, '180000.00', 1, 0, '', 1, 1, '0.00', '0.00'),
(83, 'NS 50 160', 'NS 50 160', 1, 4, 27, 2, 1, 34500, '34500.00', 1, 1, '', 1, 1, '0.00', '0.00'),
(84, 'Valve Assembely KGEN 11 4', 'Valve Assembely KGEN 11 4', 3, 6, 4, 2, 1, 410, '410.00', 1, 0, '', 1, 1, '0.00', '0.00'),
(85, 'Mechfill Make Filter Element 80 Mesh', 'Filter Element', 5, 15, 26, 2, 2, 5000, '10000.00', 1, 0, '', 3, 3, '0.00', '0.00'),
(86, 'Filter Element Size: OD 101 X 50 ID X 421 Long', 'SS 304 Wire Mesh 50 Micron', 5, 15, 26, 2, 12, 5000, '60000.00', 1, 0, '', 12, 12, '0.00', '0.00'),
(87, 'CCR 25-125', 'CCR 25-125', 6, 18, 29, 4, 1, 55000, '55000.00', 1, 1, '', 1, 1, '0.00', '0.00'),
(88, 'CCR 25-160 R6S2L3', 'CCR 25-160 R6S2L3', 1, 3, 7, 2, 2, 25000, '50000.00', 1, 1, '', 2, 2, '0.00', '0.00'),
(89, 'Suction Cover', 'Suction Cover', 3, 6, 30, 2, 1, 550, '550.00', 1, 0, '', 1, 1, '0.00', '0.00'),
(90, 'R 50 EG Bare Pump', 'R 50 EG Bare Pump', 1, 1, 25, 2, 1, 20000, '20000.00', 1, 0, '', 1, 1, '0.00', '0.00'),
(91, 'NZRP 25 125 TB R V1L', 'NZRP 25 125 TB R V1L', 1, 4, 31, 2, 1, 50000, '50000.00', 1, 1, '', 1, 1, '0.00', '0.00'),
(92, 'CN 100 160 G1S2L1', 'CN 100 160 G1S2L1', 1, 3, 6, 2, 1, 19000, '19000.00', 1, 1, '', 1, 2, '0.00', '0.00'),
(93, 'S 528', 'S528', 8, 20, 32, 2, 1, 10000, '10000.00', 1, 0, '', 1, 1, '0.00', '0.00'),
(94, 'Impeller CI KGEN 15 - 6 CI MOC', 'Impeller', 3, 6, 3, 2, 5, 700, '3500.00', 1, 0, '', 6, 6, '0.00', '0.00'),
(95, 'Mechanical Seal KGEN 15 - 6 G1', 'Mechanical Seal', 3, 6, 30, 2, 5, 700, '3500.00', 1, 0, '', 6, 6, '0.00', '0.00'),
(96, '0120', '0120', 3, 6, 3, 5, 1, 565, '565.00', 1, 1, '', 10, 10, '0.00', '0.00'),
(97, '2110', 'Bearing Cover', 3, 6, 33, 2, 10, 145, '1450.00', 1, 1, '', 10, 10, '0.00', '0.00'),
(98, '2160', 'Gasket', 3, 6, 34, 4, 10, 29, '290.00', 1, 1, '', 10, 10, '0.00', '0.00'),
(99, '2200', 'Pump Shaft SS 316', 3, 6, 35, 2, 10, 2217, '22170.00', 1, 1, '', 10, 10, '0.00', '0.00'),
(100, '2200', 'Pump Shaft SS 431', 3, 6, 36, 2, 10, 1238, '12380.00', 1, 1, '', 10, 10, '0.00', '0.00'),
(101, '2230', 'Ball Bearing', 3, 6, 37, 2, 10, 364, '3640.00', 1, 1, '', 10, 10, '0.00', '0.00'),
(102, '2240', 'Ball Bearing', 3, 6, 37, 2, 10, 364, '3640.00', 1, 1, '', 10, 10, '0.00', '0.00'),
(103, '2300', 'Inner Cerclip', 3, 6, 38, 2, 10, 117, '1170.00', 0, 0, '', 10, 10, '0.00', '0.00'),
(104, '510', '510', 3, 6, 39, 2, 10, 2000, '20000.00', 0, 1, '', 10, 100, '2000.00', '99.99'),
(105, '590', '590', 3, 6, 39, 2, 10, 670, '6700.00', 0, 1, '', 10, 100, '500.00', '99.99'),
(106, '610', '610', 3, 6, 39, 2, 10, 1000, '10000.00', 0, 1, '', 1, 10, '800.00', '99.99'),
(107, '660', '660', 3, 6, 39, 2, 10, 50, '500.00', 0, 1, '', 10, 50, '20.00', '50.00'),
(108, '520', '520', 3, 6, 39, 2, 1, 110, '110.00', 0, 1, '', 10, 10, '60.00', '99.99'),
(109, '050', '050', 3, 6, 39, 2, 1, 2100, '2100.00', 0, 1, '', 1, 1, '1500.00', '99.99'),
(110, 'CCR 50 160 R6 M2 L3', 'Spares', 1, 3, 7, 9, 10, 10000, '100000.00', 0, 0, '', 5, 10, '0.51', '10.00'),
(111, 'Casing ', 'Spares', 3, 6, 40, 9, 10, 1000, '10000.00', 0, 0, '', 5, 10, '4.00', '10.00'),
(112, 'Pump Shaft', 'Spares', 3, 6, 40, 9, 10, 1000, '10000.00', 0, 0, '', 5, 10, '4.00', '10.00'),
(113, 'Wear Ring', 'Spares', 3, 6, 40, 9, 10, 1000, '10000.00', 0, 0, '', 5, 10, '4.00', '10.00'),
(114, 'Shaft Sleeve', 'Spares', 3, 6, 40, 9, 10, 1000, '10000.00', 0, 0, '', 5, 10, '4.00', '10.00'),
(115, 'CN 65 160 G1 S2 L3', 'Pump', 1, 3, 6, 2, 10, 50000, '500000.00', 0, 0, '', 5, 10, '4.00', '99.99');

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
(1, 'Pump'),
(2, 'Motor'),
(3, 'Spares'),
(4, 'Heat Exchanger'),
(5, 'Filter Element'),
(6, 'Pump With Motor'),
(8, 'Submersible Pump');

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
(37, 26),
(38, 26),
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
(95, 27);

-- --------------------------------------------------------

--
-- Table structure for table `item_groups`
--

CREATE TABLE IF NOT EXISTS `item_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_category_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

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
(20, 8, 'Darling Pump');

-- --------------------------------------------------------

--
-- Table structure for table `item_ledger`
--

CREATE TABLE IF NOT EXISTS `item_ledger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `source_model` varchar(100) NOT NULL,
  `source_id` int(10) NOT NULL,
  `in_out` varchar(100) NOT NULL,
  `processed_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `item_ledger`
--

INSERT INTO `item_ledger` (`id`, `item_id`, `quantity`, `source_model`, `source_id`, `in_out`, `processed_on`) VALUES
(13, 37, 5, 'Grns', 1, 'In', '2016-11-16'),
(14, 38, 5, 'Grns', 1, 'In', '2016-11-16'),
(15, 41, 1, 'Grns', 1, 'In', '2016-11-16'),
(16, 37, 5, 'Grns', 2, 'In', '2016-11-16'),
(17, 37, 1, 'Invoices', 3, 'Out', '2016-11-16'),
(18, 38, 1, 'Invoices', 3, 'Out', '2016-11-16'),
(19, 37, 7, 'Invoices', 4, 'Out', '2016-11-16'),
(20, 38, 4, 'Invoices', 4, 'Out', '2016-11-16'),
(21, 41, 1, 'Invoices', 4, 'Out', '2016-11-16'),
(22, 38, 1, 'Grns', 3, 'In', '2016-11-25'),
(23, 38, 1, 'Grns', 4, 'In', '2016-11-25'),
(24, 37, 11, 'Invoices', 10, 'Out', '2016-11-25'),
(25, 63, 2, 'Invoices', 11, 'Out', '2016-11-25'),
(26, 111, 2, 'Invoices', 12, 'Out', '2016-11-25'),
(27, 112, 2, 'Invoices', 12, 'Out', '2016-11-25'),
(28, 113, 2, 'Invoices', 12, 'Out', '2016-11-25'),
(29, 114, 3, 'Invoices', 12, 'Out', '2016-11-25'),
(30, 112, 2, 'Invoices', 13, 'Out', '2016-11-25'),
(31, 115, 2, 'Invoices', 14, 'Out', '2016-11-25'),
(32, 38, 12, 'Invoices', 15, 'Out', '2016-11-26');

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
(110, 2);

-- --------------------------------------------------------

--
-- Table structure for table `item_sub_groups`
--

CREATE TABLE IF NOT EXISTS `item_sub_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_group_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

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
(40, 6, 'CCR 50-160 R6 M2 L3');

-- --------------------------------------------------------

--
-- Table structure for table `ledgers`
--

CREATE TABLE IF NOT EXISTS `ledgers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ledger_account_id` int(10) NOT NULL,
  `debit` decimal(15,2) NOT NULL,
  `credit` decimal(15,2) NOT NULL,
  `voucher_id` int(10) NOT NULL,
  `voucher_source` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ledger_accounts`
--

INSERT INTO `ledger_accounts` (`id`, `account_second_subgroup_id`, `name`, `source_model`, `source_id`) VALUES
(1, 1, 'This is the body of the article', 'This is the body of the article', 97),
(2, 1, 'Sdfsd', 'Customers', 98),
(3, 1, 'Sdfsd', 'Customers', 99),
(4, 1, 'Sdfsd', 'Customers', 100),
(5, 1, 'Gopaliya', 'Customers', 1),
(6, 2, 'Tushaco Pumps Pvt Ltd', 'Vendors', 1);

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
(8, 5, 'vijay', 'vijay', 'Active'),
(9, 1, 'MG001', 'mohammed', 'Active');

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
  `created_on` date NOT NULL,
  `voucher_date` date NOT NULL,
  `paid_to_id` int(10) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `cash_bank_account_id` int(10) NOT NULL,
  `narration` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `po3` varchar(10) NOT NULL,
  `po4` varchar(10) NOT NULL,
  `discount` decimal(5,2) NOT NULL,
  `discount_per` decimal(5,2) NOT NULL,
  `pnf_per` decimal(5,2) NOT NULL,
  `total_after_pnf` decimal(15,2) NOT NULL,
  `exceise_duty` decimal(10,2) NOT NULL,
  `descryption` varchar(255) NOT NULL,
  `grand_total` decimal(18,2) NOT NULL,
  `material_to_be_transported` varchar(255) NOT NULL,
  `delivery` varchar(255) NOT NULL,
  `lr_to_be_prepared_in_favour_of` varchar(255) NOT NULL,
  `payment_terms` varchar(255) NOT NULL,
  `road_permit_form47` varchar(255) NOT NULL,
  `transporter_id` int(10) NOT NULL,
  `sale_tax_per` int(10) NOT NULL,
  `created_by` int(10) NOT NULL,
  `date_created` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `company_id`, `vendor_id`, `shipping_method`, `shipping_terms`, `delivery_date`, `total`, `terms_conditions`, `po1`, `po3`, `po4`, `discount`, `discount_per`, `pnf_per`, `total_after_pnf`, `exceise_duty`, `descryption`, `grand_total`, `material_to_be_transported`, `delivery`, `lr_to_be_prepared_in_favour_of`, `payment_terms`, `road_permit_form47`, `transporter_id`, `sale_tax_per`, `created_by`, `date_created`) VALUES
(1, 25, 5, '', 0, '2016-11-30', '1177.86', '', 'STL', 'BE-3353', '16-17', '27.64', '2.50', '0.50', '0.00', '100.00', 'Dear Sir,\r\nWith reference to your price list we are pleased to place an order for the following items as per conditions given below.', '1183.75', 'Material to be transported at ', 'Delivery ', 'LR to be prepared in favour of ', 'Payment Terms ', 'Road permit form 47 ', 14, 5, 1, '2016-11-11'),
(2, 27, 5, '', 0, '2016-11-24', '3470.00', '', 'FMSL', 'BE-2', '16-17', '30.00', '0.00', '0.00', '0.00', '0.00', 'Dear Sir,\r\nWith reference to your price list we are pleased to place an order for the following items as per conditions given below.', '3470.00', 'Material to be transported ', 'Delivery ', 'LR to be prepared in favour of ', 'Payment Terms ', 'Road permit form 47 ', 6, 14, 1, '2016-11-18'),
(3, 25, 1, '', 0, '2016-12-31', '6300.00', '', 'STL', 'BE-3226', '16-17', '999.99', '0.00', '0.00', '0.00', '0.00', 'Dear Sir,\r\nWith reference to your price list we are pleased to place an order for the following items as per conditions given below.', '6394.50', 'Udaipur - Freight Paid', 'Within 3 to 4 weeks', '"SELF"', 'Within 30 days', 'Will provide agst Invoice', 7, 2, 1, '2016-11-25');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `purchase_order_rows`
--

INSERT INTO `purchase_order_rows` (`id`, `purchase_order_id`, `item_id`, `description`, `quantity`, `rate`, `amount`, `processed_quantity`) VALUES
(1, 1, 41, '', 11, '100.50', '1105.50', 0),
(2, 2, 41, '', 10, '100.00', '1000.00', 10),
(3, 2, 38, '', 5, '500.00', '2500.00', 5),
(6, 3, 38, '', 2, '4500.00', '9000.00', 2);

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
  `customer_contact` varchar(200) NOT NULL,
  `enquiry_no` varchar(50) NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `quotations`
--

INSERT INTO `quotations` (`id`, `customer_id`, `customer_address`, `employee_id`, `item_group_id`, `finalisation_date`, `customer_for_attention`, `customer_contact`, `enquiry_no`, `subject`, `text`, `additional_note`, `terms_conditions`, `total`, `status`, `company_id`, `qt1`, `qt2`, `qt3`, `qt4`, `created_by`, `edited_by`, `created_on`, `edited_on`) VALUES
(1, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 1, 1, '2016-10-16', 'Satpal Marwah', '2147483647', 'Tender ID 22773', 'Offer against Tender/Ref ID 22773', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Warranty : For Pump or Motor : Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.\r\n', '18246.72', 'Converted Into Sales Order', 25, 'STL', 0, 'DC-1', '16-17', 1, 2, '2016-10-16', '0000-00-00'),
(2, 24, 'Unit Udaipur\r\nUdaisagar Road MIA\r\nUdaipur-313001, Rajasthan', 2, 3, '2016-11-01', 'Mr Bhawesh Pandya', '02147483647', 'Your enquiry No. 123445 dated 21.10.2016', 'Offer for johnson make pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment : Within 30 Days Date Of Receipt Of Material.\r\n7. Price Validity : 30 Days\r\n', '30148.00', 'Closed', 26, 'SML', 0, 'BE-3321', '16-17', 1, 2, '2016-10-24', '0000-00-00'),
(3, 61, 'Lane No 76, Rajendra Palace,\r\nNew Delhi', 2, 2, '2016-10-28', 'Ajay Kumar Mehta', '9983247774', 'Enquiry for 1 HP Motor', 'Offer for Motor', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis : Ex Our Works, Udaipur, Freight Extra as actual \r\n2. Excise Duty  : Extra @ 12.5%\r\n3. Sales Tax : Extra @ 14.5%\r\n4. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n5. Payment : 10% advance balance agaisnt PI before dispatch.\r\n6. Price Validity : 30 Days\r\n', '8900.00', 'Pending', 25, 'STL', 0, 'BE-3359', '16-17', 1, 1, '2016-10-22', '2016-11-18'),
(4, 23, 'M/s Nav Durga Services\r\n10 B Jai Shree Colony\r\nThokar Circle\r\nUdaipur 313001', 3, 11, '2016-10-22', 'Gopal Singh', '9829056432', 'Verbal Enquiry dated 22.10.2016', 'BE 3066 - Quote for Positive Dosing Pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'We supply to HZL and many other companies.', '1. Price Basis : Ex Our Works, Udaipur\r\n2. Sales Tax : 14.5% Vat Or As Applicable On The Date Of Dispatch\r\n3. Delivery : Ready Stock.\r\n4. Payment : 100 % Advance\r\n5. Warranty : For Pump or Motor : Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.\r\n', '4256780.00', 'Converted Into Sales Order', 25, 'STL', 0, 'DC-14', '16-17', 1, 1, '2016-10-22', '2016-10-25'),
(5, 5, 'Bangur Nagar\r\nBeawer 305901 ', 4, 3, '2016-11-26', 'Vivek Saxena', '2147483647', 'Your enquiry No. 506790 dated 22.10.2016', 'Quotation for pump and spares for Johnson Pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'We are regularly supplying to all your units and you may place repeat order as per last PO no. 123765 dated 10.10.2015', '1. Price Basis : Ex Our Works, Udaipur\r\n2. Discount : 20 % as per agreed terms\r\n3. P & F : 2% On Basic Order Value\r\n4. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n5. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n6. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n7. Payment : Within 30 Days Date Of Receipt Of Material.\r\n8. Price Validity : 30 Days\r\n9. Warranty : For Pump or Motor : Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.\r\n', '125922.50', 'Converted Into Sales Order', 25, 'STL', 0, 'BE-2992', '16-17', 1, 1, '2016-10-24', '2016-11-02'),
(6, 6, 'M/s Honda Cars India Ltd.,\r\nSPL-1, Tapukara Industrial Area,\r\nKHUSHKHERA-301707, Distt: Alwar (Raj.)', 1, 3, '2016-10-31', 'Arun sharma', '2147483647', 'enq no.  1567 dated 22.10.2016', 'quote for Johnson spares', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment : Within 30 Days Date Of Receipt Of Material.\r\n7. Price Validity : 30 Days\r\n', '1345.00', 'Converted Into Sales Order', 27, 'FMSL', 0, 'DC-17', '16-17', 1, 2, '2016-10-24', '0000-00-00'),
(7, 23, 'M/s Nav Durga Services\r\n10 B Jai Shree Colony\r\nThokar Circle\r\nUdaipur 313001', 1, 3, '2016-10-31', 'Gopal Singh', '9823499887', 'Your email enquiry for pump', 'Quotation for Johnson pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n', '4500.00', 'Pending', 25, 'STL', 0, 'DC-14', '16-17', 1, 0, '2016-10-25', '0000-00-00'),
(8, 8, 'NH 12 Ramganj Balaji Bundi 323001 Rajasthan', 3, 3, '2016-10-29', 'Yusuf Ansari', '2147483647', 'Your email enquiry dated 25.10.2016', 'Quote for Johnson Pump ', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'Scope of supply : Pump with REMI / BBL Std. TEFC  Motor,  Lovejoy Coupling, Coupling guard duly assembled on Base frame\r\n', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n4. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n5. Payment : Within 30 Days Date Of Receipt Of Material.\r\n6. Price Validity : 30 Days\r\n7. Freight & Insurance : In Buyers account\r\n8. Warranty : For Pump or Motor : Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.\r\n', '14100.00', 'Pending', 25, 'STL', 0, 'DC-8', '16-17', 3, 3, '2016-10-25', '2016-11-03'),
(9, 3, 'Adani Wilmar Ltd,\r\nSilor Road, Kota Jaipur Highway, 323001, Bundi', 2, 3, '2016-11-08', 'Sachin kanungo', '2147483647', 'QRF NO 251016', 'Offer against RFQ No 251016 ', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'Note:-This pump already supply by us in last year against your purchase order no 160315.', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment : Within 30 Days Date Of Receipt Of Material.\r\n7. Price Validity : 30 Days\r\n8. Freight & Insurance : In Buyers account\r\n9. Warranty : For Pump or Motor : Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.\r\n10. Discount : As Agreed ......\r\n', '17500.00', 'Closed', 25, 'STL', 0, 'DC-5', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(10, 12, 'Mangalam Cement Ltd, Aditya Nagar, Morak 326520, District Kota', 3, 6, '2016-10-29', 'Vipesh Gupta', '2147483647', 'Email enquiry dated 25.10.2016', 'Quote for Johnson Spares', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment : Within 30 Days Date Of Receipt Of Material.\r\n7. Price Validity : 30 Days\r\n', '19150.00', 'Converted Into Sales Order', 25, 'STL', 0, 'DC-10', '16-17', 3, 3, '2016-10-25', '2016-10-25'),
(11, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 5, 1, '2016-10-31', 'Satpal Marwah', '9829043534', 'As per your verbal enquiry dt: 15/10/2016', 'Offer for trolley mounted diesel unloading unit ', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'We have already supplied this type of unit to AAAA, BBBB, CCCC, DDDD etc.\r\n\r\nFor any clarification you may call or write back to us. ', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment : Within 30 Days Date Of Receipt Of Material.\r\n7. Price Validity : 30 Days\r\n', '36000.00', 'Pending', 25, 'STL', 0, 'DC-1', '16-17', 5, 1, '2016-10-25', '2016-11-18'),
(12, 51, 'Address: Village- Muddapur, Taluk- District- Bhagalkot, Mudhol, Karnataka 587313\r\n', 2, 6, '2016-11-14', 'SUJOY KUMAR', '9983247774', 'RFQ 251016 mail on dated 25.10.16', 'Offer for Johnson Spares for your ETP Location', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'as per Privious Supply against PO 123456 date 6.6.16', '1. Price Basis     : Ex Our Works, Udaipur\r\n2. P&F             : 2% On Basic Order Value\r\n3. Excise Duty     : Extra as actual.\r\n4. Sales Tax       : CST Extra @ 2% against Form C\r\n5. Discount : 10%\r\n', '18028000.00', 'Converted Into Sales Order', 26, 'SML', 0, 'BE-3336', '16-17', 2, 2, '2016-10-25', '2016-11-14'),
(13, 19, 'Bangur City\r\nP.O. RAS, Tehsil : Jaitaran Dist.: Pali 306107 ', 2, 14, '2016-10-31', 'Vivek Saxena ', '2147483647', 'Tender ID 22948 Dated 24.10.16', 'Offer against Tender 22948 ', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'Heat Exchanger as per given Drawing   NO S4-A3-CM-M-244', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Excise Duty  : Extra @ 12.5% against modvate Invoice to avail EDGP Benefit.\r\n4. Sales Tax : Extra Vat @ 5.5% against Vat Deceleration form Other wise Vat @ 14.5%\r\n5. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment : Within 30 Days Date Of Receipt Of Material.\r\n7. Price Validity : 30 Days\r\n8. Freight & Insurance : In Buyers account\r\n9. Warranty :  Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. \r\n10. Discount : Price Are Net.\r\n', '186000.00', 'Converted Into Sales Order', 25, 'STL', 0, 'DC-26', '16-17', 2, 0, '2016-10-26', '0000-00-00'),
(14, 33, ' P.O. Gotan , Distt.: Nagaur-342902', 2, 1, '2016-11-18', 'Sumit Arora', '2147483647', 'RFQ NO 1000104077', 'Offer TUSHACO make pump against RFQ 1000104077 Dated  22.10.16', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'BARE PUMP', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : Inclusive\r\n3. Sales Tax : Vat Extra @5.5%\r\n5. Delivery : Within 6 To 8 Weeks or earlier from date of receipt of Techno Commercially Clear Po.\r\n6. Payment : Strictly within 30 Days of receipt of material else interest will be charged @ 18% p.a. for delayed period.\r\n7. Price Validity : 30 Days\r\n8. Freight & Insurance : In Buyers account In case of transit damage you will have to claim from your insurance company.\r\n9. Warranty : For Pump  : Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.\r\n10. Discount : NET Rate\r\n', '44000.00', 'Converted Into Sales Order', 25, 'STL', 0, 'BE-3325', '16-17', 2, 0, '2016-11-02', '0000-00-00'),
(15, 48, 'Near United Spirits,\r\nMatsya Industrial Area,\r\nAlwar', 5, 3, '2016-11-30', 'Mr. Bhutoria Ji', '9414016458', 'As per your verbal enquiry dt: 10/10/2016', 'Quotation for Johnson make Selfpriming pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'We have already installed this type of pump in JK Cement, Ultratech Cement, United Spirits, Ginni internationals, Vintage, Kajaria Ceramics etc.', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n4. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n5. Payment : Within 30 Days Date Of Receipt Of Material.\r\n6. Freight & Insurance : In Buyers account\r\n7. Warranty : For Pump or Motor : Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.\r\n8. Price Validity : 30 Days\r\n', '18000.00', 'Converted Into Sales Order', 25, 'STL', 0, 'BE-3333', '16-17', 5, 0, '2016-11-02', '0000-00-00'),
(16, 19, 'Bangur City\r\nP.O. RAS, Tehsil : Jaitaran Dist.: Pali 306107 ', 4, 16, '2016-11-10', 'Navneet Kumar', '9251077025', 'Enquiry No.: 164242 dated: 28.10.2016', 'Offer for Seal Kit Set of Allweiler Pump ', 'We thank you for your valued enquiry. We being authorised dealers for Allweiler Pump are pleased to submit our offer as under :-\r\n', 'You may placed repeat order as per last PO No.: 284476  dated 12.02.2015\r\n', '1. Price Basis : Ex Transport Godown Beawer\r\n2. P&F : Inclusive]\r\n3. Discount: 20 %\r\n4. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n5. Sales Tax : 14.5 Vat Or As Applicable On The Date Of Dispatch\r\n6. Delivery : Within 10 To 12 Weeks After Receipt Of Techno Commercially Clear Po.\r\n7. Payment : Within 30 Days Date Of Receipt Of Material.\r\n8. Warranty For Spares : Only Interchangeability with original equipment is confirmed and any manufacturing defect is covered.\r\n9. Price Validity : 30 days \r\n', '275000.00', 'Converted Into Sales Order', 25, 'STL', 0, 'BE-3090', '16-17', 4, 0, '2016-11-02', '0000-00-00'),
(17, 50, 'Laksar Tyre Plant 2\r\nVill KHEDIMUBARAKPUR 247663 Teh Laksar Dist Haridwar Uttarakhand', 3, 4, '2016-11-16', 'Vineet Dixit', '8912000274', 'Email enquiry dated 9.10.2016', 'Quote for Antico Pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'Scope of Supply : Pump with BBL make motor, Base Frame, Coupling, Coupling Guard and Fasteners', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Sales Tax : 14.5 Vat Or As Applicable On The Date Of Dispatch\r\n4. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n5. Payment : Within 30 Days Date Of Receipt Of Material.\r\n6. Price Validity : 30 Days\r\n7. Freight & Insurance : In Buyers account\r\n8. Warranty : For Pump or Motor : Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.\r\n9. Discount : As Agreed 15%\r\n', '32500.00', 'Converted Into Sales Order', 25, 'STL', 0, 'BE-3334', '16-17', 3, 3, '2016-11-02', '2016-11-02'),
(18, 49, 'Opp. Galaxy Apartment, Saifan Road,\r\nFatehpura, Udaipur 313002', 3, 7, '2016-11-15', 'Ali Hussain', '9828186876', 'Verbal confirmation dated 21.10.2016', 'Quote for Johnson Pump Spares', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis : Ex Our Works, Udaipur\r\n2. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n3. Delivery : Ready Stock\r\n4. Payment : Advance on receipt of Material.\r\n5. Freight & Insurance : In Buyers account\r\n', '1640.00', 'Converted Into Sales Order', 27, 'FMSL', 0, 'BE-3337', '16-17', 3, 0, '2016-11-02', '0000-00-00'),
(19, 51, 'Address: Village- Muddapur, Taluk- District- Bhagalkot, Mudhol, Karnataka 587313\r\n', 2, 18, '2016-11-02', 'SUJOY KUMAR', '9983247774', 'By Mail On  1.11.16', 'Offer for Johnson pump with motor', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'as per privious supply against PO no 1234567 dated 14.4.16', '1. Price Basis : Ex Our Works, Udaipur\r\n2. Excise Duty  : Extra as actual .current rate @ 12.5% on assesseble Value.\r\n3. Sales Tax : CST Extra @ 2% against form C\r\n4. Delivery : Ex-Stock\r\n5. Payment : Within 30 Days Date Of Receipt Of Material.\r\n6. Price Validity : 30 Days\r\n7. Freight & Insurance : In Buyers account\r\n8. Warranty : For Pump or Motor : Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.\r\n9. Discount : 10%.\r\n', '60000.00', 'Converted Into Sales Order', 25, 'STL', 0, 'BE-3336', '16-17', 2, 0, '2016-11-02', '0000-00-00'),
(20, 23, 'M/s Nav Durga Services\r\n10 B Jai Shree Colony\r\nThokar Circle\r\nUdaipur 313001', 3, 6, '2016-11-02', 'Gopal Singh', '9823499887', 'Telephonic discussion dated 2.11.2016', 'Quote for Johnson Pump Spare', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis : Ex Our Works, Udaipur\r\n2. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n3. Delivery : Ready Stock\r\n4. Payment : Advance against PO\r\n5. Freight & Insurance : In Buyers account\r\n', '550.00', 'Converted Into Sales Order', 27, 'FMSL', 0, 'BE-3351', '16-17', 3, 3, '2016-11-02', '2016-11-02'),
(21, 20, ' Smelting Complex, PO Putholi Chittorgarh 312021', 4, 15, '2016-11-10', 'Ashish Agarwal', '9799903005', 'RFQ. No.: 1100099215 dated: 21.09.2016', 'Offer for Mech Fill make filter Element', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '1. For Sr. No. 1 Filter Element interchangeable with existing replacement Filter element fitment guarantee in Existing Strainers as we have taken dimensions.\r\n\r\n2. For Sr. No. 2 Filter Element interchangeable as drawing provided by you.', '1. Price Basis : Ex Transport Godown Chittor\r\n2. P&F : Inclusive\r\n3. Discount : 10 %\r\n4. Sales Tax : 14.5 % Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery : Within 4 To 6 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment : Within 30 Days Date Of Receipt Of Material.\r\n7. Price Validity : 30 Days\r\n9. Warranty / Guarantee : As mentioned in above note ', '133600.00', 'Converted Into Sales Order', 25, 'STL', 0, 'DC-27', '16-17', 4, 0, '2016-11-02', '0000-00-00'),
(22, 52, 'JK Cement works Mangarol\r\nUnit of J.K. cxement Ltd\r\nKaulash Nagar, Nimbaheda- 312617 dist.: chittorgarh', 5, 3, '2016-11-02', 'Prem Prakash Ji', '9672861663', 'As per your mail enquiry dt: 08/10/2016', 'Quotation for johnson make centrifugal pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n4. Discount : As Agreed ......\r\n5. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n6. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n7. Payment : Within 30 Days Date Of Receipt Of Material.\r\n8. Price Validity : 30 Days\r\n9. Freight & Insurance : In Buyers account\r\n10. Warranty : For Pump or Motor : Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.\r\n', '53350.00', 'Converted Into Sales Order', 25, 'STL', 0, 'BE-3350', '16-17', 5, 0, '2016-11-02', '0000-00-00'),
(23, 24, 'United Spirits Ltd\r\nUnit Udaipur\r\nUdaisagar Road MIA\r\nUdaipur-313001, Rajasthan', 5, 3, '2016-11-02', 'Mr Bhawesh Pandya', '02147483647', 'As per your verbal Enquiry dated 12/ 10/2016', 'Quotation of Johnson make Centrifugal pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'The quoted pump is replaceable as per your existing pump.', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment : Within 30 Days Date Of Receipt Of Material.\r\n7. Price Validity : 30 Days\r\n8. Freight & Insurance : In Buyers account\r\n9. Warranty : For Pump or Motor : Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.\r\n', '15654.00', 'Converted Into Sales Order', 25, 'STL', 0, 'BE-3321', '16-17', 5, 0, '2016-11-02', '0000-00-00'),
(24, 53, 'SANKRAIL Jaladhulagori, Vill & P.O. Dhulagori, P.S. Sankrail,Dist.Howrah, SANKRAIL PIN : 711302 West Bengal ', 4, 1, '2016-11-06', 'Sanjay Paul', '9674742088', 'RFQ. No.2701281489 dated 20.10.2016', 'Offer for TUSHACO make Bare Pump', 'We thank your for your valued enquiry we being authorised dealers for TUSAHCO Pumps are pleased to submit our offer as under : \r\n', '', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : Inclusive\r\n3. Discount : 5 %\r\n4. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n5. Sales Tax : 2 % CST Against C forn Or As Applicable On The Date Of Dispatch\r\n6. Delivery : Within 6 To 8  Weeks After Receipt Of Techno Commercially Clear Po.\r\n7. Payment : Within 30 Days Date Of Receipt Of Material.\r\n8. Price Validity : 30 Days\r\n9. Freight & Insurance : In Buyers account\r\n10. Warranty : For Pump  : Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal is  not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.\r\n', '29500.00', 'Converted Into Sales Order', 25, 'STL', 0, 'BE-3047', '16-17', 4, 0, '2016-11-02', '0000-00-00'),
(25, 20, ' Smelting Complex, PO Putholi Chittorgarh 312021', 2, 19, '2016-11-02', 'PC Pareek', '2147483647', 'RFQ1100099940', 'OFFER AGAINST ', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'AS PER PERIVIOUS SUPPLY. 4100076827 12.9.16', '1. Price Basis : Transporter Godown ,chittor\r\n2. P&F : Inclusive\r\n3. Excise Duty  : Extra as actual\r\n4. Sales Tax :vaT Extra @ 5.5% AGAISNT VAT DELC. FORM \r\n5. Delivery : Within 6 To 8 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment : Within 30 Days Date Of Receipt Of Material.\r\n7. Price Validity : 30 Days\r\n8. Freight & Insurance : In Buyers account\r\n9. Warranty : For Pump or Motor : Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.\r\n', '54625.00', 'Converted Into Sales Order', 25, 'STL', 0, 'BE-3353', '16-17', 2, 0, '2016-11-02', '0000-00-00'),
(26, 55, 'PLOT NO. SP3-3A RIICO INDUSTRIAL AREA NH-8 SHAHJAHANPUR ALWAR', 1, 6, '2016-11-03', 'ASHUTOSH SINGH', '9672993517', 'Your Verbal enquiry dated 02.11.2016 ', 'Quote for Johnson Pump Spares', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n4. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n5. Payment : Within 30 Days Date Of Receipt Of Material.\r\n6. Price Validity : 30 Days\r\n', '5000.00', 'Converted Into Sales Order', 25, 'STL', 0, 'DC-30', '16-17', 1, 0, '2016-11-02', '0000-00-00'),
(27, 56, 'SK Mines \r\nRajpura Dariba', 2, 5, '2016-11-03', 'Mr. Tamil selvan', '9983247774', 'RFQ 2000028699 2000030123 dated: 2.11.16', 'Offer for Darling make pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'Balance item we regret to quote you', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : Inclusive\r\n3. Excise Duty  : Extra as actual present rate @ 12.5%\r\n4. Sales Tax :Vat Extra @  5.5% against VAT del. form otherwise vat @ 14.5%\r\n5. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment : Within 30 Days Date Of Receipt Of Material.\r\n7. Price Validity : 30 Days\r\n8. Freight & Insurance : In Buyers account\r\n9. Warranty : For Pump or Motor : Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on F.O.C. basis.\r\n10. Discount : 30%\r\n', '69300.00', 'Converted Into Sales Order', 25, 'STL', 0, 'BE-3355', '16-17', 2, 2, '2016-11-03', '2016-11-03'),
(28, 57, 'F-271 M.I.A. Madri | Udaipur-313003 | Rajasthan |\r\n', 1, 1, '2016-11-05', 'Santosh Shrivastav', '9001999743', 'Your Email enquiry dated 03.11.2016. ', 'Offer for Tushaco Pump.', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax : 14.5 Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery : Ready Stock or Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment : Within 30 Days Date Of Receipt Of Material.\r\n7. Price Validity : 30 Days\r\n', '6650.00', 'Converted Into Sales Order', 25, 'STL', 0, 'BE-2158', '16-17', 1, 0, '2016-11-03', '0000-00-00'),
(29, 8, 'NH 12 Ramganj Balaji Bundi 323001 Rajasthan', 3, 3, '2016-11-16', 'Yusuf Ansari', '2147483647', 'email confirmation dated 28.10.2016', 'Quote for johnson pump spares', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis : Ex Our Works, Udaipur\r\n2. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n3. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n4. Payment : Within 30 Days Date Of Receipt Of Material.\r\n5. Price Validity : 30 Days\r\n6. Freight & Insurance : In Buyers account\r\n', '18500.00', 'Converted Into Sales Order', 25, 'STL', 0, 'DC-8', '16-17', 3, 0, '2016-11-03', '0000-00-00'),
(30, 1, 'M/s Jindal Saw Limited,     \r\nAraji No. 9697/6711, Near Tiranga Hills,\r\nVill.: PUR-311802,\r\nDistt: Bhilwara (Raj.)\r\n', 1, 5, '2016-11-05', 'Manish Agarwal', '8003698108', 'Your Email enquiry PR No: 2002000124 dated 24.10.2', 'Quote for Darling Pump set', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'You may please place repeat order your PO no. 4806004889 dated 22.01.2015.', '1. Price Basis      : Ex Our Works, Udaipur\r\n2. P&F                     : 2% On Basic Order Value\r\n3. Excise Duty    : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax          : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery           : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment         : Within 30 Days Date Of Receipt Of Material.\r\n7. Price Validity : 30 Days\r\n', '49500.00', 'Converted Into Sales Order', 25, 'STL', 0, 'DC-1', '16-17', 1, 1, '2016-11-03', '2016-11-03'),
(31, 58, 'B/5-7, MIA Basni,\r\nPhase-I,\r\nJODHPUR-342005 (Raj.)', 4, 6, '2016-11-03', 'Bharat Goyal', '9314760025', 'Email Enquiry dated: 29.10.2016', 'Offer for Spares of JOHNSON Pump', 'We thank you for your valuable enquiry, we being exclusive dealer for Johnson Pumps in state of Rajasthan are pleased to submit our offer as under:\r\n\r\n \r\n\r\n', '', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n4. Delivery : Ready Stock Else Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n5. Payment : Within 15 Days Date Of Receipt Of Material.\r\n6. Price Validity : 30 Days\r\n7. Warranty : For spares : Only Interchangeability with original equipment is confirmed and any manufacturing defect is covered.', '10860.00', 'Converted Into Sales Order', 27, 'FMSL', 0, 'BE-2668', '16-17', 4, 0, '2016-11-03', '0000-00-00'),
(32, 56, 'SK Mines \r\nRajpura Dariba', 2, 6, '2016-11-03', 'Mr. Tamil selvan', '9983247774', 'RFQ 12345678 dt. 30.10.16', 'Offer for spare of Johnson pump  CN 25 160', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'Pump Model- CN 25-160  G6S2L3 \r\nSr. No. - B111358005\r\n			\r\n', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n', '25195.00', 'Converted Into Sales Order', 25, 'STL', 0, 'BE-3355', '16-17', 2, 0, '2016-11-03', '0000-00-00'),
(33, 60, 'Chanderia Cement Work\r\nMadhav Nagar \r\nP.O. Cement Factory', 2, 6, '2016-11-14', 'K G Badhera', '9983247775', 'RFQ 6000060786', 'Offer for Johnson Make Pump Spare', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'As per Last Supply Against Purchase Order NO 4500054517  Dated 06.06.2016', '1. Price Basis     : Ex Our Works, Udaipur\r\n2. P&F             : 2% On Basic Order Value\r\n3. Excise Duty     : Extra @ 12.5%\r\n4. Sales Tax       : Extra @5.5% Vat \r\n5. Delivery        : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment         : Within 30 Days Date Of Receipt Of Material.\r\n7. Price Validity : 30 Days\r\n8. Discount : 5%\r\n', '29260.00', 'Converted Into Sales Order', 25, 'STL', 0, 'BE-3358', '16-17', 2, 0, '2016-11-14', '0000-00-00'),
(34, 61, 'Lane No 76 Rajendra Palace', 2, 3, '2016-11-17', 'Ajay Kumar Mehta', '9983247774', 'Rfq no 600001234', 'offer for Johnson make Pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'SAME PUMP SUPPLY IN YOUR OTHER UNIT III AT PYRO  RATHAN PUR AGAINST PO 1234 DATED 1.4.2015', '1. Price Basis     : Ex Our Works, Udaipur\r\n2. P&F             : 4% On Basic Order Value\r\n3. Excise Duty     : Extra AS ACTUAL\r\n4. Sales Tax       : CST EXTRA @ 2% AGAINST FORM C\r\n5. Discount : 15%\r\n', '122500.00', 'Converted Into Sales Order', 25, 'STL', 0, 'BE-3359', '16-17', 2, 2, '2016-11-17', '2016-11-17'),
(35, 5, 'Bangur Nagar\r\nBeawer 305901 ', 4, 2, '2016-11-30', 'Vivek Saxena', '2147483647', 'email query', 'Quote for spares', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis     : Ex Our Works, Udaipur\r\n2. P&F             : 2% On Basic Order Value\r\n3. Excise Duty     : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax       : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery        : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment         : Within 30 Days Date Of Receipt Of Material.\r\n7. Price Validity : 30 Days\r\n', '13500.00', 'Pending', 27, 'FMSL', 0, 'DC-22', '16-17', 1, 1, '2016-11-18', '2016-11-18'),
(36, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 1, 3, '2016-11-23', 'Satpal Marwah', '9001855886', 'gops', 'testing', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'ADDITIONAL NOTE (OPTIONAL):', 'COMMERCIAL TERMS & CONDITIONS', '20130520.50', 'Converted Into Sales Order', 25, 'STL', 0, 'BE-3', '16-17', 1, 2, '2016-11-23', '2016-11-23'),
(37, 3, 'Adani Wilmar Ltd,\r\nSilor Road, Kota Jaipur Highway, 323001, Bundi', 3, 2, '2016-12-01', 'Sachin kanungo', '2147483647', 'gops', 'qwerty', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'ewfrrfw', 'reffcc', '0.00', 'Pending', 25, 'STL', 0, 'DC-5', '16-17', 2, 2, '2016-11-23', '2016-11-23'),
(38, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 1, 2, '2016-11-25', 'Satpal Marwah', '9829043534', 'gops', 'xyz', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'edcf', 'cs', '15045858.00', 'Converted Into Sales Order', 25, 'STL', 0, 'BE-3', '16-17', 1, 1, '2016-11-25', '2016-11-25'),
(39, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 1, 2, '2016-11-25', 'Satpal Marwah', '9829043534', 'gops', 'xyz', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'edcf', 'sdcdsc', '15178892.00', 'Pending', 25, 'STL', 0, 'BE-3', '16-17', 1, 1, '2016-11-25', '2016-11-25'),
(40, 61, 'Lane No 76, Rajendra Palace,\r\nNew Delhi', 2, 1, '2016-11-25', 'Ajay Kumar Mehta', '9983247774', 'rfq 600000567', 'offer for tushaco pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'Same pump Excting at your Acid Process Unit.', '1. Price Basis     : Ex Our Works, Udaipur\r\n2. P&F             : 2% On Basic Order Value\r\n3. Excise Duty     : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax       : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery        : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment         : Within 30 Days Date Of Receipt Of Material.\r\n7. Discount :    20%\r\n', '1925000.00', 'Pending', 25, 'STL', 1, 'BE-3359', '16-17', 2, 1, '2016-11-25', '2016-11-25'),
(41, 33, ' P.O. Gotan , Distt.: Nagaur-342902', 2, 1, '2016-11-25', 'Sumit Arora', '2147483647', '778899', 'offer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'ABCD', '1. Price Basis     : Ex Our Works, Udaipur\r\n2. P&F             : 2% On Basic Order Value\r\n3. Sales Tax       : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n', '24000.00', 'Converted Into Sales Order', 25, 'STL', 2, 'BE-3325', '16-17', 2, 0, '2016-11-25', '0000-00-00'),
(42, 61, 'Lane No 76, Rajendra Palace,\r\nNew Delhi', 2, 1, '2016-11-25', 'Ajay Kumar Mehta', '9983247774', '1122334455', 'offer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis     : Ex Our Works, Udaipur\r\n2. P&F             : 2% On Basic Order Value\r\n3. Sales Tax       : 2% CST against form C\r\n', '51000.00', 'Pending', 25, 'STL', 3, 'BE-3359', '16-17', 2, 0, '2016-11-25', '0000-00-00'),
(43, 24, 'United Spirits Ltd\r\nUnit Udaipur\r\nUdaisagar Road MIA\r\nUdaipur-313001, Rajasthan', 1, 3, '2016-11-29', 'Mr Bhawesh Pandya', '9929727740', 'Your verbal enquiry dated 25.11.2016', 'Offer for Johnson pump Spares', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis     : Ex Our Works, Udaipur\r\n2. P&F                    : 2% On Basic Order Value\r\n3. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax        : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery         : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment         : Within 30 Days Date Of Receipt Of Material.\r\n7. Price Validity : 30 Days\r\n8. Freight & Insurance : In Buyers account\r\n9. Discount         : As Agreed ......\r\n', '3000.00', 'Converted Into Sales Order', 25, 'STL', 4, 'BE-3321', '16-17', 1, 0, '2016-11-25', '0000-00-00'),
(44, 61, 'Lane No 76, Rajendra Palace,\r\nNew Delhi', 2, 1, '2016-11-25', 'Ajay Kumar Mehta', '9983247774', '1122334455', 'offer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis     : Ex Our Works, Udaipur\r\n2. P&F             : 2% On Basic Order Value\r\n', '51000.00', 'Pending', 25, 'STL', 5, 'BE-3359', '16-17', 2, 0, '2016-11-25', '0000-00-00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=85 ;

--
-- Dumping data for table `quotation_rows`
--

INSERT INTO `quotation_rows` (`id`, `quotation_id`, `item_id`, `description`, `quantity`, `rate`, `amount`, `height`) VALUES
(1, 1, 37, 'HT Cable 35X3C Al Armad', 2, '36.36', '72.72', 0),
(2, 1, 40, 'HT Cable 35X3C Al Armad', 4, '4543.50', '18174.00', 0),
(3, 2, 38, 'Johnson make end suction pump', 2, '15074.00', '30148.00', 0),
(4, 3, 58, 'Make Remi', 1, '8900.00', '8900.00', 0),
(5, 4, 75, 'Item Description    : Electronic Diaphragm Dosing Pump\r\nModel                           : ED 01\r\nCapacity                     : 4 to 0 LPH\r\nPressure                    : 0 to 4 kg/cm2\r\nSuc*Dis                       : ¼” * ¼”\r\nMOC                           : Liquid end: PP\r\nDiaphragm              : PP\r\nNRV                            : PP\r\nDrive                          : Single phase 230 V, 50 hz', 1, '4256780.00', '4256780.00', 0),
(6, 5, 54, 'Bare Pump MCV Pump  \r\nFlow 10 m3/hr    Head 10 Mtrs   \r\nSG / Ph / Temp : Ambient', 2, '39560.50', '79121.00', 0),
(7, 5, 67, 'Impeller for MCV 14b 6', 3, '15600.50', '46801.50', 0),
(8, 6, 41, 'Motor three phase', 1, '1345.00', '1345.00', 0),
(9, 7, 38, 'Item Description    : Electronic Diaphragm Dosing Pump\r\nModel                           : ED 01\r\nCapacity                     : 4 to 0 LPH\r\nPressure                    : 0 to 4 kg/cm2\r\nSuc*Dis                       : ¼” * ¼”\r\nMOC                           : Liquid end: PP\r\nDiaphragm              : PP\r\nNRV                            : PP\r\nDrive                          : Single phase 230 V, 50 hz', 1, '4500.00', '4500.00', 0),
(10, 8, 38, 'Make	Johnson\r\nModel 	KGEN 11-3 G1 (Self priming pump)\r\nApplication	Transfer\r\nHead	15 mtr\r\nFlow	3 m3/hr\r\nLiquid	Waste water\r\nPH /SG / Temp	7/1/ambient\r\nPower : Motor HP / RPM  	1 HP / 2900 RPM\r\nSuc*Dis (inch)	1 1/4" * 1 1/4"\r\nSolid Handling	7.5 mm\r\nTemperature	Ambient\r\nSealing	Mechanical Seal\r\nMOC - Casing /Impeller	CI/ CI - Halfopen\r\n', 1, '14100.00', '14100.00', 0),
(11, 9, 38, 'Pump Model                      : KGEN 11-3 G1\r\nHead                                      :13 Meter\r\nCapacity                              :6 M3/hr\r\nPower                                   ; .5KW\r\nSolid Handling                 :30mm\r\nDischarge                          :50MM\r\n', 1, '17500.00', '17500.00', 0),
(12, 10, 67, 'CN 25 160 - Impeller', 5, '2150.00', '10750.00', 0),
(13, 10, 69, 'CCR 50 250 - Shaft', 2, '4200.00', '8400.00', 0),
(14, 11, 63, 'Trolley Mounted Unit, \r\nPump Model      :  Tushaco Make RT 10 \r\nMotor                  :  BBL Make 1 HP/ 2900 RPM\r\nApplication        :  Diesel transfer\r\n\r\nPump with motor , coupling , CG, Filter- 1/2 inch duly assembled on MS trolley.\r\n\r\n', 1, '36000.00', '36000.00', 0),
(15, 12, 66, ' Mechanical seal Complete Unit\r\nPump Model                         KGEN 11-3 G1\r\nSR No                                        141013\r\n', 4, '4500000.00', '18000000.00', 0),
(16, 12, 69, 'SS Shaft for Johnson Pump \r\nPump Model                         KGEN 11-3 G1\r\nSR No                                        141013', 4, '7000.00', '28000.00', 0),
(17, 13, 77, 'HEAT EXCHANGER COMPLETE WITH END COVER COPPER TUBE-12 MM OD THICKNESS-20 SWG LENGTH-1030 MM QTY-242 BAFFLES-M.S. 20 MM THICK PLATE-M.S. OUTERBODY FABRICATED \r\nMake Trenter\r\n', 4, '46500.00', '186000.00', 0),
(18, 14, 79, 'ITEM CODE :558062100010407\r\nPUMP MODEL : RT 125/32\r\nFLOW RATING ; 125 LPM\r\nOPERATING PRESSURE ; UP TO 8 KG/SQ. CM\r\nSIZE ; 1.5X 1.5 INCH SCREWED\r\nSEALING : OIL SEAL\r\nMOUNTING TYPE : FOOT , INBUILT RELIEF VALVE\r\n', 2, '22000.00', '44000.00', 0),
(19, 15, 81, 'Johnson make Pump, \r\nModel: KGEN 12-6 G1, \r\nHead: 15 Mtr, Flow: 24 m3/hr, \r\nImpeller: Half Open ,CI\r\nMotor Recm: 3 HP/2900 RPM\r\n', 1, '18000.00', '18000.00', 0),
(20, 16, 82, 'Item Code: PUMPSPAR3282\r\n\r\nSEAL SET FOR SCREW PUMP,TYPE TRF 1300 R 42 U 18.4V-W203, NOMINAL PRESSURE :PN 16\r\n', 1, '275000.00', '275000.00', 0),
(21, 17, 83, 'Application : Unloading \r\nMake : Antico \r\nPump Model : NS 50 40 160 \r\nLiquid : HCL 33% \r\nTemp : Ambient \r\nHead : 16 mtrs \r\nFlow : 6 m3/hr \r\nMotor Power : 2 HP / 2900 RPPM \r\nSuc*Dis : 50*40 \r\nImpeller type : Semi-Open \r\nMOC : Casing/Impeller PP ', 1, '32500.00', '32500.00', 0),
(22, 18, 84, 'Valve Assembly for Pump Model KGEN 11 4', 4, '410.00', '1640.00', 0),
(23, 19, 87, 'Johnson make Pump Model CCR 25-125 G1 S2 L3\r\nCapacity :150 LPM\r\nHead :24 Mter\r\nMotor;Kirlosker 3.7 Kw/5HP 1440 RPM Foot mountend', 1, '60000.00', '60000.00', 0),
(24, 20, 89, 'Suction Cover for Pump Model - KGEN 11 3', 1, '550.00', '550.00', 0),
(25, 21, 85, 'Element for Unloading Pump \r\nPump Location : Pump No. 3 for Unloading Section \r\nLiquid: Tyre Oil\r\nMesh Size: 75 / 80 Mesh \r\nMOC of Element :  SS     ', 2, '9800.00', '19600.00', 0),
(26, 21, 86, 'MECH FILL Make Filter Element OD 101 MM x 50 MM ID × 421 MM LONG SS304 WIRE MESH PLEATED FILTER ELEMENT (FILTRATION RATING: 50 MICRON) TECHNICAL SPECIFICATION :     - OUTSIDE DIAMETER Ø 101 MM :     - INSIDE DIAMETER Ø 50 MM :     - LENGTH OF ELEMENT 421 MM LONG :     - FILTRATION RATING 50 MICRON :     - NO. OF PLEATS 45 Nos. :     - PLEAT DEPTH 20 MM :     - FILTRATION AREA 0.75 M² :     - CONFIGURATION SS 304 Wire Mesh Pleated Filter Element MATERIAL OF CONSTRUCTION :     - FILTER MEDIA SS 304 Wire Mesh :     - TOP CAP SS 304 :     - BOTTOM CAP SS 304 :     - INNER CYLINDER Ø 6 mm Hole X 1.2 mm Thk, SS 304 :     - SUPPORTING MESH SS 304 (40 X 36) Both Side :     - O-RING Buna-N (49 mm ID X 4 mm Thk)', 12, '9500.00', '114000.00', 0),
(27, 22, 88, 'Johnson make Centrifugal pump\r\nModel: CCR 25 160 R6S2L3\r\nApplication: Hazardous liquid transfer\r\nHead: 44 Mtr, Flow: 3.7 m3/hr\r\nMotor: 5HP/ 2900 RPM\r\n\r\nBare pump with motor , coupling, CG, duly assembled on MS baseframe', 1, '53350.00', '53350.00', 0),
(28, 23, 65, 'Johnson make Centrifugal pump\r\nApplication : STP\r\nImpeller: closed\r\nMOC: CI\r\nSuction : Flooded', 1, '15654.00', '15654.00', 0),
(29, 24, 90, 'Item Code : 308000153515\r\nPump interchangeable with Existing Pump Sr. No.: 095161/1721\r\n', 1, '29500.00', '29500.00', 0),
(30, 25, 91, 'ITEM CODE; 760842027020\r\nPUMP MODEL;ANTICO NZRP 25 125 TB R V1L\r\nAPPLICATION;FLUID CIRCULATION\r\nLIQUID;CAUSTIC ACID 48%\r\nCAPACITY:10 m3/hr\r\nHEAD: 15 MTR\r\nSUCTION DISCHARGE;40x25 NB\r\nSEALING;MECHENICAL SEAL\r\nMOTOR:BBL  3.7KW/5HP/2900 RPM\r\nS.G.:1.5\r\nMOC:WETTED PART GFRPP,IMPELLER ,CASING,SHAFT SLEVE :ALLOY 20,PUMP SHAFT EN24\r\nTEMP: 50 CENTI MAX\r\nSUCTION:FLOODED\r\nSOLID:CELEAR LQUID\r\n\r\nCOMPLETE UNIT MOTOR BBL MAKE FOOT MOUNTED ,LOVE JOY COUPLING, MS BASE PLATEMOUNTING BOLT,ETC.', 1, '54625.00', '54625.00', 0),
(31, 26, 67, 'KGEN 14 8 Pump Impeller', 2, '2500.00', '5000.00', 0),
(32, 27, 93, 'Item Code : 766842027300  \r\nLiquid : Water   \r\nPump Model:S 528\r\nHead: 41 Meters Max\r\nFlow: 12 M3/hr @ 24 Meter Head\r\nDischarge Size: 50 MM\r\nPUMP,SUBMERSIBLE,SPEED RATING: 2900 RPM,\r\nPOWER RATING: 3.7 KW,VOLTAGE\r\n RA TING: 415 V,50 C/S with 5 meter Cable\r\n', 7, '9900.00', '69300.00', 0),
(33, 28, 55, 'Make   : Tushaco\r\nModel  : RT 80\r\nFlow     : 40-80 LPM\r\nPressure : 6 kg/cm2\r\nRecom Motor : 3 H.P/1500 RPM ', 1, '6650.00', '6650.00', 0),
(34, 29, 67, 'Impeller for Pump Model - KGEN 12b-5 G1', 5, '2500.00', '12500.00', 0),
(35, 29, 67, 'Impeller for Pump Model - KGEN 11 3 G1', 2, '1200.00', '2400.00', 0),
(36, 29, 67, 'Impeller for Pump Model - KGEN 12 5 G1', 2, '1800.00', '3600.00', 0),
(37, 30, 71, 'Item Code :-10115542\r\nMake : Darling\r\n\r\n Water dewatering submersible pump 50m³/hr capacity and 25 to 30 mtr head With all accessories  ( As per last Supply ) \r\n\r\nPrice for Complete Set  : Rs. 49500/- each set', 1, '49500.00', '49500.00', 0),
(38, 31, 95, 'Mechanical Seal for Pump Model : 15 - 6 G1 ', 3, '1920.00', '5760.00', 0),
(39, 31, 94, 'CI MOC Pump Impeller for Pump Model : KGEN 15 - 6 G1', 5, '1020.00', '5100.00', 0),
(40, 32, 96, 'Impeller\r\n', 5, '565.00', '2825.00', 0),
(41, 32, 97, 'Bearing Cover\r\n', 5, '145.00', '725.00', 0),
(42, 32, 98, 'Gasket\r\n', 5, '29.00', '145.00', 0),
(43, 32, 99, 'Pump Shaft SS 316\r\n', 5, '2217.00', '11085.00', 0),
(44, 32, 100, 'Pump Shaft SS 431\r\n', 5, '1238.00', '6190.00', 0),
(45, 32, 101, 'Ball Bearing\r\n', 5, '364.00', '1820.00', 0),
(46, 32, 102, 'Ball Bearing\r\n', 5, '364.00', '1820.00', 0),
(47, 32, 103, 'Inner Cerclip\r\n', 5, '117.00', '585.00', 0),
(48, 33, 104, 'Item Code: 200020816\r\nName : Casing\r\nPump Model : MCH 14BX 4-5', 2, '2270.00', '4540.00', 0),
(49, 33, 105, 'Item Code: 200020982\r\nName : Ring\r\nPump Model : MCH 14BX 4-5', 4, '670.00', '2680.00', 0),
(50, 33, 106, 'Item Code: 200088108\r\nName : Wearing\r\nPump Model : MCH 14BX 4-5', 4, '990.00', '3960.00', 0),
(51, 33, 107, 'Item Code: 200020847\r\nName : Gasket\r\nPump Model : MCH 14BX 4-5', 8, '50.00', '400.00', 0),
(52, 33, 108, 'Item Code: 200020880\r\nName : Impeller Key\r\nPump Model : MCH 14BX 4-5', 8, '110.00', '880.00', 0),
(53, 33, 109, 'Item Code: 200088109\r\nName : Smotheing Bush\r\nPump Model : MCH 14BX 4-5', 8, '2100.00', '16800.00', 0),
(54, 34, 38, 'PUMP MODEL:KGEN 11-3 G1\r\nHEAD:30MTR\r\nOUTLET:50MM\r\nFLOW;1200LPM', 7, '17500.00', '122500.00', 0),
(56, 35, 42, 'Cable tray for use', 10, '150.00', '1500.00', 0),
(57, 35, 38, 'KGEN 11 3', 10, '1200.00', '12000.00', 0),
(61, 36, 37, 'f', 10, '2000000.00', '20000000.00', 0),
(62, 36, 37, 'qwertuy', 11, '11.00', '121.00', 0),
(63, 36, 38, 'rety', 11, '11000.00', '121000.00', 0),
(64, 36, 37, 'asdfgy', 11, '11.00', '121.00', 0),
(65, 36, 41, 'edf', 11, '832.50', '9157.50', 0),
(66, 36, 37, 'zxcxz', 11, '11.00', '121.00', 0),
(67, 37, 38, 'ertyuio', 11, '11000.00', '121000.00', 0),
(68, 37, 38, 'fv', 1100, '11000.00', '12100000.00', 0),
(71, 38, 43, 'cedrcds', 12, '123.00', '1476.00', 0),
(72, 38, 41, 'de', 444, '33333.00', '14799852.00', 0),
(73, 38, 37, 'fv', 11, '9.00', '99.00', 0),
(74, 38, 38, 'fgrv', 11, '22221.00', '244431.00', 0),
(75, 39, 38, 'cedrcds', 12, '11200.00', '134400.00', 0),
(76, 39, 41, 'de', 444, '33333.00', '14799852.00', 0),
(77, 39, 37, 'fv', 11, '9.00', '99.00', 0),
(78, 39, 38, 'fgrv', 11, '22221.00', '244431.00', 0),
(79, 39, 37, 'wd', 11, '10.00', '110.00', 0),
(80, 40, 79, 'Item Code:554433221166\r\nPump Model:RT 125/32\r\nCapacity:300LPM\r\nPressure: 8 kg/Sq.Cm\r\nSize: 1.5 X 1.5 "\r\nSeal:Oil\r\n', 11, '175000.00', '1925000.00', 36),
(81, 41, 63, 'Pump Model\r\nCapacity\r\nHead\r\nSeal', 2, '12000.00', '24000.00', 0),
(82, 42, 79, 'PUMP MODEL TR 125/32\r\nCAPACITY\r\nHEAD\r\nSEAL\r\n', 3, '17000.00', '51000.00', 125),
(83, 43, 112, 'Pump Shaft for Pump Model CN 25 160', 2, '1500.00', '3000.00', 0),
(84, 44, 79, 'PUMP MODEL TR 125/32\r\nCAPACITY\r\nHEAD\r\nSEAL\r\n', 3, '17000.00', '51000.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales_orders`
--

CREATE TABLE IF NOT EXISTS `sales_orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `employee_id` int(10) NOT NULL,
  `customer_address` text NOT NULL,
  `subject` varchar(200) NOT NULL,
  `terms_conditions` text NOT NULL,
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
  `fright_text` text NOT NULL,
  `fright_amount` decimal(10,2) NOT NULL,
  `grand_total` decimal(18,2) NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `sales_orders`
--

INSERT INTO `sales_orders` (`id`, `customer_id`, `employee_id`, `customer_address`, `subject`, `terms_conditions`, `discount_type`, `discount_per`, `discount`, `ed_description`, `exceise_duty`, `total`, `pnf_type`, `pnf_per`, `pnf`, `total_after_pnf`, `fright_text`, `fright_amount`, `grand_total`, `additional_note`, `company_id`, `process_status`, `quotation_id`, `transporter_id`, `expected_delivery_date`, `delivery_description`, `documents_courier_id`, `customer_po_no`, `po_date`, `dispatch_name`, `dispatch_mobile`, `dispatch_email`, `dispatch_address`, `road_permit_required`, `form49`, `so1`, `so2`, `so3`, `so4`, `created_by`, `edited_by`, `created_on`, `edited_on`, `edited_on_time`, `created_on_time`) VALUES
(1, 1, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', '', '', 0, '0.00', '0.00', '', '0.00', '18246.72', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', '', 25, 'Pulled From Quotation', NULL, 20, '2016-11-04', 'Material to be delivered Freight paid Door Delivery\r\nFreight to be charged to customer', 1, '12345', '2016-11-10', 'Mr Amit Sharma', '9778923467', 'amit@shreecementltd.com', '', 'Yes', 'No', 'STL', 0, 'BE-3', '16-17', 1, 1, '2016-10-25', '2016-11-12', '', ''),
(2, 5, 1, 'Bangur Nagar\r\nBeawer 305901 ', '', '', 0, '0.00', '0.00', '', '0.00', '83801.60', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', '', 25, 'Pulled From Quotation', NULL, 7, '2016-11-15', 'Freight Paid Transporter Godown', 1, '389760', '2016-11-11', 'Vivek Saxena', '9413325896', 'vivek@shreecementltd.com', '', 'No', 'No', 'STL', 0, 'BE-2992', '16-17', 1, 1, '2016-10-24', '2016-11-12', '', ''),
(3, 6, 1, 'M/s Honda Cars India Ltd.,\r\nSPL-1, Tapukara Industrial Area,\r\nKHUSHKHERA-301707, Distt: Alwar (Raj.)', '', '', 0, '0.00', '0.00', '', '0.00', '20260.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', '11', 27, 'New', NULL, 6, '2016-11-03', 'Friehgt Paid to reimburse in invoice', 6, '1234', '2016-10-25', 'Mr. Arun Sharma', '966432198', 'arun@hondacarindia.com', '', 'No', 'No', 'FMSL', 0, 'BE-3226', '16-17', 1, 1, '2016-10-25', '2016-11-01', '', ''),
(4, 12, 1, 'Mangalam Cement Ltd, Aditya Nagar, Morak 326520, District Kota', '', '', 0, '0.00', '0.00', '', '0.00', '19150.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', '', 25, 'Pulled From Quotation', NULL, 3, '2016-10-27', '3-4 weeks', 1, 'sfsdf', '2016-10-25', 'Vipesh', '9568564524', 'purchase@mangalamcement.com', '', 'No', 'No', 'STL', 0, 'BE-3322', '16-17', 3, 3, '2016-10-25', '2016-10-25', '', ''),
(5, 19, 1, 'Bangur City\r\nP.O. RAS, Tehsil : Jaitaran Dist.: Pali 306107 ', '', '', 0, '0.00', '0.00', '', '0.00', '186000.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', 'Customer  Drawing must be attached at the time of Generate purchase order.Material must be as per Drawing.', 25, 'Pulled From Quotation', NULL, 21, '2016-11-30', 'Material will be booked on paid basis at Beawar.', 1, '241016', '2016-10-26', 'Mr. Vivek Saxena', '9983247774', 'saxenav@shreecement.com', '', 'No', 'No', 'STL', 0, 'BE-3323', '16-17', 2, 6, '2016-10-26', '2016-10-29', '', ''),
(6, 5, 1, 'Bangur Nagar\r\nBeawer 305901 ', '', '', 0, '0.00', '0.00', '', '0.00', '470000.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', 'As per Privious Supply aGAINST po 221013 Dated 24.03.16', 25, 'New', NULL, 21, '2016-12-08', 'Material booked On paid Basis.', 1, '11111', '2016-10-26', 'Mr. Gaurav Maheshwari', '9983247774', 'gauravm@shreecementltd.com', '', 'No', 'No', 'STL', 0, 'BE-2992', '16-17', 2, 6, '2016-10-26', '2016-10-29', '', ''),
(7, 39, 1, 'Unit: RAWAN Cement Works, Tehsil: SIMGA, PO Grasim Vihar, Village: Rawan Dist.: Balodabazar-Bhatapara Chatishgarh-493196', '', '', 0, '0.00', '0.00', '', '0.00', '10000.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', 'Balance pumps shall be supplied shortly.', 25, 'New', NULL, 20, '2016-11-05', 'TO-PAY Godown', 1, '123456', '2016-10-29', 'Vivek Saxena', '9785177828', 'vsaxena@ult.com', '', 'No', 'No', 'STL', 0, 'BE-3324', '16-17', 6, 1, '2016-10-29', '2016-11-01', '', ''),
(8, 6, 1, 'M/s Honda Cars India Ltd.,\r\nSPL-1, Tapukara Industrial Area,\r\nKHUSHKHERA-301707, Distt: Alwar (Raj.)', '', '', 0, '0.00', '0.00', '', '0.00', '50000.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', 'fffff', 25, 'New', NULL, 3, '2016-11-04', 'PAID DOOR DELIVERY', 6, '33936,0', '2016-10-29', 'Navneet', '9785178828', 'navneet@hondacars.com', '', 'No', 'No', 'STL', 0, 'BE-3226', '16-17', 6, 1, '2016-10-29', '2016-11-01', '', ''),
(9, 33, 1, ' P.O. Gotan , Distt.: Nagaur-342902', '', '', 0, '0.00', '0.00', '', '0.00', '44000.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', 'Note:Local Cartage will be  add  at the time on making GR INR 500.', 25, 'Pulled From Quotation', NULL, 4, '2017-01-01', 'Material will be booked on topay basis. Through Bhati Goods Only.\r\n', 1, '342902', '2016-11-02', 'Mr. Sumit Arora', '9983247774', 'sumit@jkcement.com', '', 'No', 'No', 'STL', 0, 'BE-3325', '16-17', 2, 1, '2016-11-02', '2016-11-02', '', ''),
(10, 48, 1, 'Near United Spirits,\r\nMatsya Industrial Area,\r\nAlwar', '', '', 0, '0.00', '0.00', '', '0.00', '18000.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', '', 25, 'Pulled From Quotation', NULL, 6, '2016-11-18', 'only by Gati cargo', 15, 'XXXXXXXXXXXX', '2016-11-01', 'Bhutoria Ji', '9414016458', 'rajbhutoria@yahoo.com', '', 'No', 'No', 'STL', 0, 'BE-3333', '16-17', 5, 0, '2016-11-02', '0000-00-00', '', ''),
(11, 51, 1, 'Address: Village- Muddapur, Taluk- District- Bhagalkot, Mudhol, Karnataka 587313\r\n', '', '', 0, '0.00', '0.00', '', '0.00', '60000.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', 'Material Booked for Out of Rajasthan. We must be sent request for Vat 47 at the time of dispatch.', 25, 'Pulled From Quotation', NULL, 20, '2016-11-09', 'Booked Topay basis. & Local Cartage will be add in GR .', 1, '123456789', '2016-11-02', 'Mr Sujoy', '9983247774', 'sujoy@jkcement.com', '', 'Yes', 'Yes', 'STL', 0, 'BE-3336', '16-17', 2, 2, '2016-11-02', '2016-11-02', '', ''),
(12, 52, 1, 'JK Cement works Mangarol\r\nUnit of J.K. cxement Ltd\r\nKaulash Nagar, Nimbaheda- 312617 dist.: chittorgarh', '', '', 0, '0.00', '0.00', '', '0.00', '53350.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', 'Pump send with extra mechanical seal after confirmation of user.', 25, 'Pulled From Quotation', NULL, 20, '2016-11-04', 'complete  unit required', 18, '4100089151', '2016-11-02', 'Prem Prakash Ji', '9981230789', 'prem.prakash@jkcement.com', '', 'No', 'No', 'STL', 0, 'BE-3350', '16-17', 5, 0, '2016-11-02', '0000-00-00', '', ''),
(13, 23, 1, 'M/s Nav Durga Services\r\n10 B Jai Shree Colony\r\nThokar Circle\r\nUdaipur 313001', '', '', 0, '0.00', '0.00', '', '0.00', '550.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', '', 27, 'Pulled From Quotation', NULL, 10, '2016-11-03', 'Hand Delivery', 10, 'Telephonic order dated 2.11.2016', '2016-11-02', 'Mr Gopal Singh', '9799480639', 'navdurga17@gmail.com', '', 'No', 'No', 'FMSL', 0, 'BE-3351', '16-17', 3, 0, '2016-11-02', '0000-00-00', '', ''),
(14, 49, 1, 'Opp. Galaxy Apartment, Saifan Road,\r\nFatehpura, Udaipur 313002', '', '', 0, '0.00', '0.00', '', '0.00', '1640.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', '', 27, 'Pulled From Quotation', NULL, 10, '2016-11-02', 'Hand Delivery', 10, 'Telephonic order', '2016-10-27', 'Ali Hussain', '9828186876', 'ahcorp.udr@gmail.com', '', 'No', 'No', 'FMSL', 0, 'BE-3337', '16-17', 3, 0, '2016-11-02', '0000-00-00', '', ''),
(15, 50, 1, 'Laksar Tyre Plant 2\r\nVill KHEDIMUBARAKPUR 247663 Teh Laksar Dist Haridwar Uttarakhand', '', '', 0, '0.00', '0.00', '', '0.00', '32500.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', 'Scope of supply : Pump with motor, coupling, coupling guard dully assembeled on base frame.', 25, 'Pulled From Quotation', NULL, 6, '2016-11-02', 'Door Delivery from Gati Cargo', 6, '1100000473', '2016-11-02', 'Vineet Dixit', '8192000274', 'vineet.dixit@jkmail.com', '', 'Yes', 'Yes', 'STL', 0, 'BE-3334', '16-17', 3, 3, '2016-11-02', '2016-11-02', '', ''),
(16, 54, 1, 'SP-86, NIC (M) NEEMRANA, RIICO Industrial Area Alwar (Raj.)\r\n', '', '', 0, '0.00', '0.00', '', '0.00', '22278.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', 'To-PAY basis', 25, 'New', NULL, 1, '2016-11-05', 'Jaipur Golden Tr. Co., Udaipur\r\nFreight "TO-PAY" basis', 1, '16POD00348 ', '2016-10-15', 'Sachin Sharma', '7073720222', 'sachin@nachi-india.com', '', 'No', 'No', 'STL', 0, 'BE-3352', '16-17', 6, 0, '2016-11-02', '0000-00-00', '', ''),
(17, 53, 1, 'SANKRAIL Jaladhulagori, Vill & P.O. Dhulagori, P.S. Sankrail,Dist.Howrah, SANKRAIL PIN : 711302 West Bengal ', '', '', 0, '0.00', '0.00', '', '0.00', '29500.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', 'Discount @ 5 %\r\nPayment Term : 30 days of receipt of Material', 25, 'Pulled From Quotation', NULL, 11, '2016-12-12', 'Book Material through ARC transport To Pay Basis', 1, ' 2800618256/NE13', '2016-10-31', 'Sanjay Paul', '967474208', 'sanjay.paul@ambujacement.com', '', 'Yes', 'Yes', 'STL', 0, 'BE-3047', '16-17', 4, 0, '2016-11-02', '0000-00-00', '', ''),
(18, 20, 1, ' Smelting Complex, PO Putholi Chittorgarh 312021', '', '', 0, '0.00', '0.00', '', '0.00', '133600.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', 'Discount @ 10 %', 25, 'Pulled From Quotation', NULL, 7, '2016-11-10', 'Material Book Paid Basis Transporter Godown Chittor', 1, '12345', '2016-11-02', 'Ashish Kumar', '979990300', 'ashish.agarwal@vedanta.co.in', '', 'No', 'No', 'STL', 0, 'BE-3353', '16-17', 4, 4, '2016-11-02', '2016-11-02', '', ''),
(19, 23, 1, 'M/s Nav Durga Services\r\n10 B Jai Shree Colony\r\nThokar Circle\r\nUdaipur 313001', '', '', 0, '0.00', '0.00', '', '0.00', '4256780.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', '', 25, 'Pulled From Quotation', NULL, 10, '2016-11-02', 'Hand Delivery', 10, 'hand delivery', '2016-10-10', 'Gopal Singh', '9799480639', 'navdurga17@gmail.com', '', 'No', 'No', 'STL', 0, 'BE-3351', '16-17', 3, 0, '2016-11-02', '0000-00-00', '', ''),
(20, 19, 1, 'Bangur City\r\nP.O. RAS, Tehsil : Jaitaran Dist.: Pali 306107 ', '', '', 0, '0.00', '0.00', '', '0.00', '275000.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', 'Discount @ 20 %', 25, 'Pulled From Quotation', NULL, 7, '2016-12-23', 'Material Book Paid Basis Beawer Transporter Godown', 1, '12345', '2016-11-11', 'Navneet Kumar', '925107702', 'navneet13596@shreecementltd.com', '', 'No', 'No', 'STL', 0, 'BE-3323', '16-17', 4, 1, '2016-11-02', '2016-11-11', '', ''),
(21, 24, 1, 'United Spirits Ltd\r\nUnit Udaipur\r\nUdaisagar Road MIA\r\nUdaipur-313001, Rajasthan', '', '', 0, '0.00', '0.00', '', '0.00', '116991.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', 'ankit addtional note', 25, 'Pulled From Quotation', NULL, 10, '2016-12-15', 'freight paid', 10, '4501433562', '2016-11-02', 'Bhawesh Pandya', '7742200666', 'bhawesh.pandya@unitedspirits.in', '', 'No', 'No', 'STL', 0, 'BE-3321', '16-17', 5, 1, '2016-11-02', '2016-11-03', '', ''),
(22, 20, 1, ' Smelting Complex, PO Putholi Chittorgarh 312021', '', '', 0, '0.00', '0.00', '', '0.00', '54625.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', 'XYZ', 25, 'Pulled From Quotation', NULL, 7, '2016-11-16', 'material booked on paid baisi FOR chittor.', 15, '11112222', '2016-11-02', 'MR PC Pareek', '9983247774', 'pareek@vedanta.co.in', '', 'No', 'No', 'STL', 0, 'BE-3353', '16-17', 2, 0, '2016-11-02', '0000-00-00', '', ''),
(23, 55, 1, 'PLOT NO. SP3-3A RIICO INDUSTRIAL AREA NH-8 SHAHJAHANPUR ALWAR', '', '', 0, '0.00', '0.00', '', '0.00', '5000.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', 'CI Impeller and dispatch immediately.', 25, 'Pulled From Quotation', NULL, 6, '2016-11-07', 'Fright paid basis and charge in invoice as actual and Max charge Rs. 700/-', 6, '12345', '2016-11-03', 'Jitendra Kumar', '9057904835', 'jitendrakumar@ubmail.com', '', 'No', 'No', 'STL', 0, 'BE-3296', '16-17', 1, 1, '2016-11-03', '2016-11-03', '', ''),
(24, 56, 1, 'SK Mines \r\nRajpura Dariba', '', '', 0, '0.00', '0.00', '', '0.00', '69300.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', '', 25, 'Pulled From Quotation', NULL, 5, '2016-11-16', 'Material Must be book on Love kush Transport Along with customer PO copy. ', 1, '99998888', '2016-11-03', 'Mr. Tamil Selvan', '9983247774', 'tamils@vedanta.co.in', '', 'No', 'No', 'STL', 0, 'BE-3355', '16-17', 2, 0, '2016-11-03', '0000-00-00', '', ''),
(25, 57, 1, 'F-271 M.I.A. Madri | Udaipur-313003 | Rajasthan |\r\n', '', '', 0, '0.00', '0.00', '', '0.00', '6500.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', '', 25, 'Pulled From Quotation', NULL, 10, '2016-11-04', 'Material will be delivered hand delivery.', 10, '456', '2016-11-03', 'Santosh Shrivastav', '9001999743', 'purchaseudaipur@westerndrugs.com', '', 'No', 'No', 'STL', 0, 'BE-2158', '16-17', 1, 0, '2016-11-03', '0000-00-00', '', ''),
(26, 8, 1, 'NH 12 Ramganj Balaji Bundi 323001 Rajasthan', '', '', 0, '0.00', '0.00', '', '0.00', '18500.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', 'dOCUMENT DISPATCH TO :- 242 Ramganj Balaji Bundi 323001 Rajasthan', 25, 'Pulled From Quotation', NULL, 3, '2016-11-05', 'Discount : 5%\r\n\r\nKota Udaipur Transport - To Pay, Upto Bundi\r\n\r\nDOCUMENT DISPATCH TO :- 242 Ramganj Balaji Bundi 323001 Rajasthan', 15, '15001', '2016-11-03', 'Yusuf Ansari', '9001796815', 'yusuf.ansari@advantageoils.com', '', 'No', 'No', 'STL', 0, 'BE-3356', '16-17', 3, 1, '2016-11-03', '2016-11-03', '', ''),
(27, 6, 1, 'M/s Honda Cars India Ltd.,\r\nSPL-1, Tapukara Industrial Area,\r\nKHUSHKHERA-301707, Distt: Alwar (Raj.)', '', '', 0, '0.00', '0.00', '', '0.00', '1345.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', '', 27, 'Pulled From Quotation', NULL, 6, '2016-11-05', 'Fright paid door delivery basis', 6, '450', '2016-11-11', 'Atul Sehgal', '9649004777', 'atul.sehgal@hondacar.com', '', 'No', 'No', 'FMSL', 0, 'BE-3226', '16-17', 1, 1, '2016-11-03', '2016-11-11', '', ''),
(28, 50, 1, 'Laksar Tyre Plant 2\r\nVill KHEDIMUBARAKPUR 247663 Teh Laksar Dist Haridwar Uttarakhand', '', '', 0, '0.00', '0.00', '', '0.00', '97000.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', 'Bare Pump without motor', 25, 'New', NULL, 6, '2016-11-23', 'Through Gati Cargo To-pay door delivery basis.\r\nExcise Extra', 6, '12506', '2016-11-03', 'Vinnet Dixit', '9856425625', 'vineet.dixit@jkmail.com', '', 'Yes', 'Yes', 'STL', 0, 'BE-3334', '16-17', 3, 3, '2016-11-03', '2016-11-03', '', ''),
(29, 1, 1, 'M/s Jindal Saw Limited,     \r\nAraji No. 9697/6711, Near Tiranga Hills,\r\nVill.: PUR-311802,\r\nDistt: Bhilwara (Raj.)\r\n', '', '', 0, '0.00', '0.00', '', '0.00', '10500.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', 'Pump with control panel and  matching flanges suc*dis and self standing stand.', 25, 'Pulled From Quotation', NULL, 7, '2016-11-24', 'Booked Transporter Godown Bhilwara\r\n\r\nDocument send to Bhilwara city address\r\nM/s Jindal Saw Limited,\r\nNear Krishi Vigyan Kendra,\r\nMahaveer Colony, Gandhi Nagar,\r\nBHILWARA-311001\r\n', 1, '450078456', '2016-11-03', 'Manish Agarwal', '8003698108', 'manish.agarwal@jindalsaw.com', '', 'No', 'No', 'STL', 0, 'BE-3335', '16-17', 1, 1, '2016-11-03', '2016-11-14', '', ''),
(30, 58, 1, 'B/5-7, MIA Basni,\r\nPhase-I,\r\nJODHPUR-342005 (Raj.)', '', '', 0, '0.00', '0.00', '', '0.00', '10860.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', 'Material send through Bhati Goods/Shankar Golden Paid Basis for Jodhpur Transporter Godown and Charge in invocie', 27, 'Pulled From Quotation', NULL, 12, '2016-11-04', 'Book For Transporter Godown', 1, 'P0/16-17/0228', '2016-11-03', 'Bharat Goyal', '9314760025', 'bgoyal@lucidgroup.com', '', 'No', 'No', 'FMSL', 0, 'BE-2668', '16-17', 4, 0, '2016-11-03', '0000-00-00', '', ''),
(31, 56, 4, 'SK Mines \r\nRajpura Dariba', '', '', 0, '0.00', '0.00', '', '0.00', '25195.00', 0, '0.00', '0.00', '0.00', '', '0.00', '0.00', '"Pump Model- CN 25-160  G6S2L3 \r\nSr. No. - B111358005\r\n"			\r\n', 25, 'Pulled From Quotation', NULL, 5, '2016-11-10', 'Booked Love Kush Trasnport ON Freight To Pay Basis and to be claimed in invocie', 1, '123456789', '2016-11-04', 'Mr. Selvan ', '9999999999', 'tamil@VEDANTA.CO.IN', '', 'No', 'No', 'STL', 0, 'BE-3355', '16-17', 2, 1, '2016-11-03', '2016-11-14', '', ''),
(32, 1, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', '', '', 1, '2.00', '180.00', '', '0.00', '8820.00', 0, '0.00', '0.00', '8820.00', '', '0.00', '0.00', '', 27, 'New', NULL, 4, '2016-11-29', 'werewr', 5, 'we43', '2016-11-09', 'Ewrwer', '42342', 'wewe@qweqw.ryret', '', 'Yes', 'Yes', 'FMSL', 0, 'BE-3', '16-17', 1, 0, '2016-11-12', '1970-01-01', '', ''),
(33, 60, 2, 'Chanderia Cement Work\r\nMadhav Nagar \r\nP.O. Cement Factory', '', '', 1, '5.00', '1463.00', 'Extra 12.5%', '2990.00', '30787.00', 1, '2.00', '615.74', '31402.74', 'Material booked  through topay basis .local Cartage Will be Add in GR Maxi. 500.\r\nIt Will be rebersh form Trnasporter.', '0.00', '0.00', 'Local Cartage Charge Will be rembers form transporter in cash.', 25, 'Pulled From Quotation', NULL, 7, '2016-11-24', 'Material booked  through topay basis .local Cartage Will be Add in GR Maxi. 500.\r\n', 1, '4500054519', '2016-11-14', 'Mr. S L Khandelwal', '0147222667', 'SLK@birlacement.com', '', 'No', 'No', 'STL', 0, 'BE-3358', '16-17', 2, 2, '2016-11-14', '2016-11-14', '', ''),
(34, 51, 2, 'Address: Village- Muddapur, Taluk- District- Bhagalkot, Mudhol, Karnataka 587313\r\n', '', '', 1, '10.00', '999999.99', 'ExtraExcise from invoice 12345 dt. 6.6.16', '811260.00', '17036460.00', 1, '2.00', '340729.20', '17377189.20', '', '0.00', '0.00', '', 26, 'Pulled From Quotation', NULL, 20, '2016-11-24', 'Material will be booked on topay basis.\r\nLocal cartage will be rembersh form transporter.', 1, '123456', '2016-11-14', 'Mr. Sujoy', '9983247774', 'sujoy@jkcement.com', '', 'Yes', 'Yes', 'SML', 0, 'BE-3336', '16-17', 2, 1, '2016-11-14', '2016-11-14', '', ''),
(35, 61, 2, 'Lane No 76 Rajendra Palace', '', '', 1, '0.00', '0.00', 'eXCISE', '0.00', '210000.00', 1, '3.00', '0.00', '207896.00', 'TOPAY BASIS AS                                                            ', '0.00', '0.00', '', 25, 'Pulled From Quotation', NULL, 20, '2016-11-24', 'TO PAY BASIS LOCAL CARTAGE WILL BE ADD IN GR IN REIMBRUSH FROM TRANSPORTER', 1, '123456789', '2016-11-17', 'AJAY KUMAR MEHTA', '9983247774', 'AJAY.KUMAR@DOL.COM', '', 'Yes', 'Yes', 'STL', 0, 'BE-3359', '16-17', 2, 1, '2016-11-17', '2016-11-18', '', ''),
(36, 56, 4, 'SK Mines \r\nRajpura Dariba', '', '', 1, '5.00', '1536308.25', '', '0.00', '29189856.75', 1, '2.00', '583797.14', '29773653.89', '', '0.00', '29773653.89', '', 25, '', NULL, 5, '2016-11-10', 'Booked Love Kush Trasnport ON Freight To Pay Basis and to be claimed in invocie', 1, '123456789', '2016-11-04', 'Mr. Selvan ', '9999999999', 'tamil@VEDANTA.CO.IN', 'qwerty', 'No', 'No', 'STL', 0, 'BE-3355', '16-17', 1, 1, '2016-11-22', '2016-11-25', '2016-11-25 07:22:29PM', '2016-11-22 06:03:23PM'),
(37, 1, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', '', '', 0, '0.00', '7959.08', '', '0.00', '522646.42', 0, '2.00', '12000.00', '534646.42', 'Fright Amount', '12.00', '534658.42', '', 25, 'Pulled From Quotation', NULL, 1, '2016-11-23', 'DELIVERY DESCRIPTION ', 1, 'qwerty12345', '2016-11-14', 'Gopu', '9876545678', 'Gopu@mail.com', 'savina', 'Yes', 'No', 'STL', 0, 'BE-3', '16-17', 2, 1, '2016-11-23', '2016-11-25', '2016-11-25 02:03:30PM', '2016-11-23 12:09:02PM'),
(38, 1, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', '', '', 1, '1.00', '149280.48', 'Excise-Duty', '0.00', '14778767.52', 0, '0.00', '104600.00', '14883367.52', 'Fright Amount', '0.58', '0.00', '', 25, 'Pulled From Quotation', NULL, 5, '2016-11-25', 'EXPECTED DELIVERY D', 1, '12345qwert', '2016-11-22', 'Abhi', '9876543456', 'dfgh@dfghj.hjk', 'edrfgyhEXPECTED DELIVERY D', 'Yes', 'No', 'STL', 0, 'BE-3', '16-17', 1, 1, '2016-11-25', '2016-11-25', '2016-11-25 12:27:30PM', '2016-11-25 10:40:55AM'),
(39, 5, 4, 'Bangur Nagar\r\nBeawer 305901 ', '', '', 1, '20.00', '26412.00', '', '0.00', '105648.00', 0, '0.00', '0.00', '105648.00', 'Freight "PAID" basis', '0.00', '105648.00', '', 25, 'New', NULL, 7, '2016-11-29', 'Freight "PAID" basis upto Beawar', 1, '376360', '2016-11-19', 'Vivek Saxena', '9214337462', 'saxenav@shreecementltd.com', 'Bangur Nagar\r\nBeawer 305901 ', 'No', 'No', 'STL', 1, 'BE-2992', '16-17', 6, 6, '2016-11-25', '2016-11-25', '2016-11-25 06:40:56PM', '2016-11-25 06:27:26PM'),
(40, 1, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', '', '', 0, '0.00', '1.00', '', '0.00', '120.00', 0, '0.00', '11.00', '131.00', '', '11.00', '142.00', '', 25, 'New', NULL, 4, '2016-11-25', 'fdfdvv', 1, 'q24r5ty', '2016-11-22', 'Wertyu', '987654', 'wef@qwsedr.ert', 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 'Yes', 'No', 'STL', 2, 'BE-3', '16-17', 1, 0, '2016-11-25', '1970-01-01', '', '2016-11-25 06:28:32PM'),
(41, 33, 2, ' P.O. Gotan , Distt.: Nagaur-342902', '', '', 1, '5.00', '1200.00', '', '0.00', '22800.00', 1, '5.00', '1140.00', '23940.00', 'Local & GR Chagres', '250.00', '24190.00', '', 25, 'Pulled From Quotation', NULL, 7, '2016-11-30', 'Topay Basis', 1, '11111111', '2016-11-25', 'My Ajay', '9983247774', 'ajay@jkcement.com', 'Nagor', 'No', 'No', 'STL', 3, 'BE-3325', '16-17', 2, 0, '2016-11-25', '1970-01-01', '', '2016-11-25 06:36:10PM'),
(42, 24, 1, 'Unit Udaipur\r\nUdaisagar Road MIA\r\nUdaipur-313001, Rajasthan', '', '', 1, '5.00', '150.00', '', '0.00', '2850.00', 1, '2.00', '57.00', '2907.00', '', '0.00', '2907.00', '', 25, 'Pulled From Quotation', NULL, 10, '2016-11-29', 'Hand Delivered to customer', 1, '123', '2016-11-25', 'Ramesh Singh', '9660642260', 'ramesh.singh@unitedspirits.com', 'Udaisagar Road Udaipur', 'No', 'No', 'STL', 4, 'BE-3321', '16-17', 1, 1, '2016-11-25', '2016-11-25', '2016-11-25 07:25:33PM', '2016-11-25 07:24:08PM'),
(43, 55, 1, 'PLOT NO. SP3-3A RIICO INDUSTRIAL AREA NH-8 SHAHJAHANPUR', '', '', 0, '0.00', '0.00', '', '0.00', '122610.00', 1, '2.00', '2452.20', '125062.20', '"FREIGHT PAID DOOR DELIVERY" basis', '4500.00', '129562.20', '', 25, 'New', NULL, 6, '2016-11-30', '"FREIGHT PAID DOOR DELIVERY" basis', 6, '4501445065', '2016-09-28', 'Vikram Ji', '9460509987', 'bhopals@mogragroup.com', 'PLOT NO. SP3-3A RIICO INDUSTRIAL AREA NH-8 SHAHJAHANPUR', 'No', 'No', 'STL', 5, 'BE-3296', '16-17', 6, 0, '2016-11-25', '1970-01-01', '', '2016-11-25 07:26:15PM');

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
  `so_sale_tax` decimal(4,2) NOT NULL,
  `sale_tax_description` varchar(255) NOT NULL,
  `height` int(10) NOT NULL,
  `processed_quantity` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=270 ;

--
-- Dumping data for table `sales_order_rows`
--

INSERT INTO `sales_order_rows` (`id`, `sales_order_id`, `item_id`, `description`, `quantity`, `rate`, `amount`, `excise_duty`, `so_sale_tax`, `sale_tax_description`, `height`, `processed_quantity`) VALUES
(18, 4, 67, 'CN 25 160 ', 5, '2150.00', '10750.00', '', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(19, 4, 69, 'CCR 50 250', 2, '4200.00', '8400.00', '', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(26, 5, 77, 'HEAT EXCHANGER COMPLETE WITH END COVER COPPER TUBE-12 MM OD THICKNESS-20 SWG LENGTH-1030 MM QTY-242 BAFFLES-M.S. 20 MM THICK PLATE-M.S. OUTERBODY FABRICATED \r\nMake Trenter\r\n', 4, '46500.00', '186000.00', '', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(27, 6, 40, '40 HP Star Delta Panel As I/C 63A SFU & Catactor must be 32A Size 650X600X300M ', 1, '400000.00', '400000.00', '', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(28, 6, 41, '40 HP Star Delta Panel As I/C 63A SFU & Catactor must be 32A Size 650X600X300M ', 2, '35000.00', '70000.00', '', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(38, 3, 39, 'EXP Impeller for spares', 12, '1355.00', '16260.00', '', '14.50', '14.50 % VAT or as applicable on date of dispatch', 0, 0),
(39, 3, 41, '', 1, '4000.00', '4000.00', '', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(40, 7, 38, '', 2, '5000.00', '10000.00', '', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(42, 8, 61, 'Pump Model : KGEN 11 3 G1\r\nItem Code : RMPII00040946\r\nWith Motor 3 HP /2900 RPM Coupling, Coupling Guard, Fasteners dully assembled on MS Baseframe\r\nPump Sr. No. B11111111, 1111111112\r\nMotor Sr. No.N4445, N5554 ', 2, '25000.00', '50000.00', '', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(44, 10, 81, 'Johnson make Pump, \r\nModel: KGEN 12-6 G1, \r\nHead: 15 Mtr, Flow: 24 m3/hr, \r\nImpeller: Half Open ,CI\r\nMotor Recm: 3 HP/2900 RPM\r\nApplication :Water Transfer', 1, '18000.00', '18000.00', 'No', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(46, 12, 88, 'Johnson make Centrifugal pump\r\nModel: CCR 25 160 R6S2L3\r\nApplication: Hazardous liquid transfer\r\nHead: 44 Mtr, Flow: 3.7 m3/hr\r\nMotor: 5HP/ 2900 RPM\r\n\r\nBare pump with motor , coupling, CG, duly assembled on MS baseframe', 1, '53350.00', '53350.00', 'Yes', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(47, 13, 89, 'Suction Cover for Pump Model - KGEN 11 3', 1, '550.00', '550.00', 'No', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(48, 14, 84, 'Valve Assembly for Pump Model KGEN 11 4', 4, '410.00', '1640.00', 'No', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(49, 11, 87, 'Johnson  Pump Model CCR 25-125 G1 S2 L3\r\nCapacity :150 LPM\r\nHead :24 Mter\r\nMotor; make Kirlosker 3.7 Kw/5HP 1440 RPM Foot mounted \r\nComplete Set alongwith coupling ,base frame', 1, '60000.00', '60000.00', '', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(51, 16, 38, 'Pump Model KGEN 11-3 G1\r\nPump Sr. No. B111388002', 1, '13253.00', '13253.00', 'No', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(52, 16, 38, 'Pump Model KGEN 11-3 G1\r\nPump Sr. No. B111389002', 1, '9025.00', '9025.00', 'No', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(54, 17, 90, 'Item Code : 308000153515\r\nPump interchangeable with Existing Pump Sr. No.: 095161/1721\r\n', 1, '29500.00', '29500.00', 'Yes', '2.00', '2 % CST against C Form', 0, 0),
(58, 19, 75, 'Item Description    : Electronic Diaphragm Dosing Pump\r\nModel                           : ED 01\r\nCapacity                     : 4 to 0 LPH\r\nPressure                    : 0 to 4 kg/cm2\r\nSuc*Dis                       : ¼” * ¼”\r\nMOC                           : Liquid end: PP\r\nDiaphragm              : PP\r\nNRV                            : PP\r\nDrive                          : Single phase 230 V, 50 hz', 1, '4256780.00', '4256780.00', 'Yes', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(63, 18, 85, 'Element for Unloading Pump \r\nPump Location : Pump No. 3 for Unloading Section \r\nLiquid: Tyre Oil\r\nMesh Size: 75 / 80 Mesh \r\nMOC of Element :  SS     ', 2, '9800.00', '19600.00', '', '14.50', '14.50 % VAT or as applicable on date of dispatch', 0, 0),
(64, 18, 86, 'MECH FILL Make Filter Element OD 101 MM x 50 MM ID × 421 MM LONG SS304 WIRE MESH PLEATED FILTER ELEMENT (FILTRATION RATING: 50 MICRON) TECHNICAL SPECIFICATION :     - OUTSIDE DIAMETER Ø 101 MM :     - INSIDE DIAMETER Ø 50 MM :     - LENGTH OF ELEMENT 421 MM LONG :     - FILTRATION RATING 50 MICRON :     - NO. OF PLEATS 45 Nos. :     - PLEAT DEPTH 20 MM :     - FILTRATION AREA 0.75 M² :     - CONFIGURATION SS 304 Wire Mesh Pleated Filter Element MATERIAL OF CONSTRUCTION :     - FILTER MEDIA SS 304 Wire Mesh :     - TOP CAP SS 304 :     - BOTTOM CAP SS 304 :     - INNER CYLINDER Ø 6 mm Hole X 1.2 mm Thk, SS 304 :     - SUPPORTING MESH SS 304 (40 X 36) Both Side :     - O-RING Buna-N (49 mm ID X 4 mm Thk)', 12, '9500.00', '114000.00', '', '14.50', '14.50 % VAT or as applicable on date of dispatch', 0, 0),
(65, 22, 91, 'ITEM CODE; 760842027020\r\nPUMP MODEL;ANTICO NZRP 25 125 TB R V1L\r\nAPPLICATION;FLUID CIRCULATION\r\nLIQUID;CAUSTIC ACID 48%\r\nCAPACITY:10 m3/hr\r\nHEAD: 15 MTR\r\nSUCTION DISCHARGE;40x25 NB\r\nSEALING;MECHENICAL SEAL\r\nMOTOR:BBL  3.7KW/5HP/2900 RPM\r\nS.G.:1.5\r\nMOC:WETTED PART GFRPP,IMPELLER ,CASING,SHAFT SLEVE :ALLOY 20,PUMP SHAFT EN24\r\nTEMP: 50 CENTI MAX\r\nSUCTION:FLOODED\r\nSOLID:CELEAR LQUID\r\n\r\nCOMPLETE UNIT MOTOR BBL MAKE FOOT MOUNTED ,LOVE JOY COUPLING, MS BASE PLATEMOUNTING BOLT,ETC.', 1, '54625.00', '54625.00', 'Yes', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(69, 15, 83, 'Complete Motorised Unit\r\nApplication : Unloading \r\nMake : Antico \r\nPump Model : NS 50 40 160 \r\nLiquid : HCL 33% \r\nTemp : Ambient \r\nHead : 16 mtrs \r\nFlow : 6 m3/hr \r\nMotor Power : 2 HP / 2900 RPPM \r\nSuc*Dis : 50*40 \r\nImpeller type : Semi-Open \r\nMOC : Casing/Impeller PP ', 1, '32500.00', '32500.00', '', '14.50', '14.50 % VAT or as applicable on date of dispatch', 0, 0),
(70, 9, 79, 'ITEM CODE :558062100010407\r\nPUMP MODEL : RT 125/32\r\nFLOW RATING ; 125 LPM\r\nOPERATING PRESSURE ; UP TO 8 KG/SQ. CM\r\nSIZE ; 1.5X 1.5 INCH SCREWED\r\nSEALING : OIL SEAL\r\nMOUNTING TYPE : FOOT , INBUILT RELIEF VALVE\r\n', 2, '22000.00', '44000.00', '', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(73, 21, 92, 'Johnson make Centrifugal pump\r\nApplication : STP\r\nImpeller: closed\r\nMOC: CI\r\nSuction : Flooded\r\nMotor: 40 HP/2900 RPM\r\n\r\nBare Pump with BBL make motor, Coupling, Coupling guard, duly assembled on MS Baseframe', 1, '116991.00', '116991.00', '', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(75, 23, 67, 'KGEN 14 8 Pump Impeller', 2, '2500.00', '5000.00', '', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(76, 24, 93, 'Item Code : 766842027300  \r\nLiquid : Water   \r\nPump Model:S 528\r\nHead: 41 Meters Max\r\nFlow: 12 M3/hr @ 24 Meter Head\r\nDischarge Size: 50 MM\r\nPUMP,SUBMERSIBLE,SPEED RATING: 2900 RPM,\r\nPOWER RATING: 3.7 KW,VOLTAGE\r\n RA TING: 415 V,50 C/S with 5 meter Cable\r\n', 7, '9900.00', '69300.00', 'Yes', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(77, 25, 55, 'Make   : Tushaco\r\nModel  : RT 80\r\nFlow     : 40-80 LPM\r\nPressure : 6 kg/cm2\r\nRecom Motor : 3 H.P/1500 RPM ', 1, '6500.00', '6500.00', 'No', '14.50', '14.50 % VAT or as applicable on date of dispatch', 0, 0),
(91, 26, 67, 'Impeller for Pump Model - KGEN 12b-5 G1', 5, '2500.00', '12500.00', '', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 5),
(92, 26, 67, 'Impeller for Pump Model - KGEN 11 3 G1', 2, '1200.00', '2400.00', '', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(93, 26, 67, 'Impeller for Pump Model - KGEN 12 5 G1', 2, '1800.00', '3600.00', '', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(107, 30, 95, 'Mechanical Seal for Pump Model : 15 - 6 G1 ', 3, '1920.00', '5760.00', 'Yes', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(108, 30, 94, 'CI MOC Pump Impeller for Pump Model : KGEN 15 - 6 G1', 5, '1020.00', '5100.00', 'Yes', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(119, 28, 87, 'Bare Pump :\r\nJohnson Pump Model - CCR 25 125 R6 M2 L3', 1, '45000.00', '45000.00', '', '2.00', '2 % CST against C Form', 0, 0),
(120, 28, 60, 'Bare Pump :\r\nJohnson Pump Model - CCR 25 160 R6 M2 L3', 1, '52000.00', '52000.00', '', '2.00', '2 % CST against C Form', 0, 0),
(122, 20, 82, 'Item Code: PUMPSPAR3282\r\n\r\nSEAL SET FOR SCREW PUMP,TYPE TRF 1300 R 42 U 18.4V-W203, NOMINAL PRESSURE :PN 16\r\n', 1, '275000.00', '275000.00', '', '14.50', '14.50 % VAT or as applicable on date of dispatch', 0, 0),
(125, 27, 41, 'Motor three phase', 1, '1345.00', '1345.00', 'Yes', '14.50', '14.50 % VAT or as applicable on date of dispatch', 0, 0),
(142, 1, 37, 'HT Cable 35X3C Al Armad', 2, '36.36', '72.72', 'Yes', '14.50', '14.50 % VAT or as applicable on date of dispatch', 0, 0),
(143, 1, 40, 'HT Cable 35X3C Al Armad', 4, '4543.50', '18174.00', 'Yes', '2.00', '2 % CST against C Form', 0, 0),
(144, 2, 54, 'Bare Pump MCV Pump  \r\nFlow 10 m3/hr    Head 10 Mtrs   \r\nSG / Ph / Temp : Ambient', 2, '39560.50', '79121.00', 'No', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 0),
(145, 2, 67, 'Impeller for MCV 14b 6', 3, '1560.20', '4680.60', 'No', '14.50', '14.50 % VAT or as applicable on date of dispatch', 0, 0),
(146, 32, 41, '', 3, '3000.00', '9000.00', 'Yes', '0.00', 'NIL CST agst C & E1 Form', 0, 3),
(163, 31, 96, 'Impeller\r\n', 5, '565.00', '2825.00', 'Yes', '5.50', '', 0, 0),
(164, 31, 97, 'Bearing Cover\r\n', 5, '145.00', '725.00', 'No', '5.50', '', 0, 0),
(165, 31, 98, 'Gasket\r\n', 5, '29.00', '145.00', 'No', '5.50', '', 0, 0),
(166, 31, 99, 'Pump Shaft SS 316\r\n', 5, '2217.00', '11085.00', 'No', '5.50', '', 0, 0),
(167, 31, 100, 'Pump Shaft SS 431\r\n', 5, '1238.00', '6190.00', 'No', '5.50', '', 0, 0),
(168, 31, 101, 'Ball Bearing\r\n', 5, '364.00', '1820.00', 'No', '5.50', '', 0, 0),
(169, 31, 102, 'Ball Bearing\r\n', 5, '364.00', '1820.00', 'No', '5.50', '', 0, 0),
(170, 31, 103, 'Inner Cerclip\r\n', 5, '117.00', '585.00', 'No', '5.50', '', 0, 0),
(177, 33, 104, 'Item Code: 200020816\r\nName : Casing\r\nPump Model : MCH 14BX 4-5', 2, '2270.00', '4540.00', 'Yes', '5.50', '', 0, 2),
(178, 33, 105, 'Item Code: 200020982\r\nName : Ring\r\nPump Model : MCH 14BX 4-5', 4, '670.00', '2680.00', 'Yes', '5.50', '', 0, 4),
(179, 33, 106, 'Item Code: 200088108\r\nName : Wearing\r\nPump Model : MCH 14BX 4-5', 4, '990.00', '3960.00', 'Yes', '5.50', '', 0, 4),
(180, 33, 107, 'Item Code: 200020847\r\nName : Gasket\r\nPump Model : MCH 14BX 4-5', 8, '50.00', '400.00', 'Yes', '5.50', '', 0, 8),
(181, 33, 108, 'Item Code: 200020880\r\nName : Impeller Key\r\nPump Model : MCH 14BX 4-5', 8, '110.00', '880.00', 'Yes', '5.50', '', 0, 8),
(182, 33, 109, 'Item Code: 200088109\r\nName : Smotheing Bush\r\nPump Model : MCH 14BX 4-5', 8, '2100.00', '16800.00', 'Yes', '5.50', '', 0, 8),
(187, 34, 66, ' Mechanical seal Complete Unit\r\nPump Model                         KGEN 11-3 G1\r\nSR No                                        141013\r\n', 4, '4500000.00', '18000000.00', 'Yes', '2.00', '', 0, 4),
(188, 34, 69, 'SS Shaft for Johnson Pump \r\nPump Model                         KGEN 11-3 G1\r\nSR No                                        141013', 4, '7000.00', '28000.00', 'Yes', '2.00', '', 0, 4),
(190, 29, 38, 'Item Code :-10115542\r\nMake : Darling\r\n\r\n Water dewatering submersible pump 50m³/hr capacity and 25 to 30 mtr head With all accessories  ( As per last Supply ) \r\n\r\nPrice for Complete Set  : Rs. 49500/- each set', 1, '10500.00', '10500.00', 'Yes', '5.50', '', 0, 1),
(194, 35, 38, 'PUMP MODEL:KGEN 11-3 G1\r\nHEAD:30MTR\r\nOUTLET:50MM\r\nFLOW;1200LPM', 12, '17500.00', '210000.00', 'Yes', '2.00', '', 0, 12),
(226, 38, 43, 'cedrcds', 12, '123.00', '1476.00', 'Yes', '5.50', '', 0, 12),
(227, 38, 41, 'de', 444, '33333.00', '14799852.00', 'Yes', '5.50', '', 0, 0),
(228, 38, 37, 'fv', 11, '9.00', '99.00', 'Yes', '5.50', '', 0, 0),
(229, 38, 38, 'fgrv', 11, '10300.00', '113300.00', 'Yes', '5.50', '', 0, 0),
(230, 38, 39, '', 11, '1211.00', '13321.00', 'Yes', '5.50', '', 0, 0),
(238, 37, 37, 'f', 2, '200000.00', '400000.00', 'Yes', '5.50', '', 0, 0),
(239, 37, 37, 'qwertuy', 11, '11.00', '121.00', 'Yes', '5.50', '', 0, 0),
(240, 37, 38, 'rety', 11, '11000.00', '121000.00', 'Yes', '5.50', '', 0, 0),
(241, 37, 37, 'asdfgy', 11, '11.00', '121.00', 'Yes', '5.50', '', 0, 0),
(242, 37, 41, 'edf', 11, '832.50', '9157.50', 'Yes', '5.50', '', 0, 0),
(243, 37, 37, 'zxcxz', 11, '11.00', '121.00', 'Yes', '5.50', '', 0, 0),
(244, 37, 37, 'rftgyhj', 5, '17.00', '85.00', 'Yes', '5.50', '', 0, 0),
(249, 40, 37, 'dddd', 11, '11.00', '121.00', 'Yes', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 11),
(250, 41, 63, 'Pump Model\r\nCapacity\r\nHead\r\nSeal', 2, '12000.00', '24000.00', 'No', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 2),
(255, 39, 111, 'Pump Model : CCR 50 160 R6 M2 L3\r\nItem code : PUMPSPAR0373', 2, '46100.00', '92200.00', 'No', '5.50', '', 0, 2),
(256, 39, 112, 'Pump Model : CCR 50 160 R6 M2 L3\r\nItem code : PUMPSPAR0400', 2, '8500.00', '17000.00', 'No', '5.50', '', 0, 2),
(257, 39, 113, 'Pump Model : CCR 50 160 R6 M2 L3\r\nItem code : PUMPSPAR0651', 2, '3780.00', '7560.00', 'No', '5.50', '', 0, 2),
(258, 39, 114, 'Pump Model : CCR 50 160 R6 M2 L3\r\nItem code : SLEVSEAL0293', 3, '5100.00', '15300.00', 'No', '5.50', '', 0, 3),
(259, 36, 96, 'Impeller\r\n', 54343, '565.00', '30703795.00', 'Yes', '5.50', '', 0, 0),
(260, 36, 97, 'Bearing Cover\r\n', 5, '145.00', '725.00', 'No', '5.50', '', 0, 0),
(261, 36, 98, 'Gasket\r\n', 5, '29.00', '145.00', 'No', '5.50', '', 0, 0),
(262, 36, 99, 'Pump Shaft SS 316\r\n', 5, '2217.00', '11085.00', 'No', '5.50', '', 0, 0),
(263, 36, 100, 'Pump Shaft SS 431\r\n', 5, '1238.00', '6190.00', 'No', '5.50', '', 0, 0),
(264, 36, 101, 'Ball Bearing\r\n', 5, '364.00', '1820.00', 'No', '5.50', '', 0, 0),
(265, 36, 102, 'Ball Bearing\r\n', 5, '364.00', '1820.00', 'No', '5.50', '', 0, 0),
(266, 36, 103, 'Inner Cerclip\r\n', 5, '117.00', '585.00', 'No', '5.50', '', 0, 0),
(268, 42, 112, 'Pump Shaft for Pump Model CN 25 160', 2, '1500.00', '3000.00', 'No', '5.50', '', 0, 2),
(269, 43, 115, '"JOHNSON" Pump Model CN 65 160 G1 S2 L3', 2, '61305.00', '122610.00', 'No', '5.50', '5.50 % VAT or as applicable on date of dispatch', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sale_taxes`
--

CREATE TABLE IF NOT EXISTS `sale_taxes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tax_figure` decimal(4,2) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sale_taxes`
--

INSERT INTO `sale_taxes` (`id`, `tax_figure`, `description`) VALUES
(1, '5.50', '5.50 % VAT or as applicable on date of dispatch'),
(2, '14.50', '14.50 % VAT or as applicable on date of dispatch'),
(3, '2.00', '2 % CST against C Form'),
(4, '0.00', 'NIL CST agst C & E1 Form');

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
(1, 'First Flight Courier', 9999, 'Udaipur'),
(2, 'Singhal Tr', 9999999999, 'Ahmedabad'),
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `company_name`, `address`, `tin_no`, `gst_no`, `ecc_no`, `pan_no`, `payment_terms`, `mode_of_payment`, `item_group_id`, `account_category_id`, `account_group_id`, `account_first_subgroup_id`, `account_second_subgroup_id`) VALUES
(1, 'Tushaco Pumps Pvt Ltd', 'Nani Daman', '088374748478', '83746383279587', '9848937257293298', '398589589598754', 30, 'NEFT', 1, 2, 2, 2, 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `vendor_contact_persons`
--

INSERT INTO `vendor_contact_persons` (`id`, `vendor_id`, `name`, `email`, `mobile`, `default_person`, `account_category_id`, `account_group_id`, `account_first_subgroup_id`, `account_second_subgroup_id`) VALUES
(1, 1, 'Suresh Chandra', 'suresh@tushacopumps.com', 9871123470, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vouchers_references`
--

CREATE TABLE IF NOT EXISTS `vouchers_references` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `voucher_entity` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vouchers_references_groups`
--

CREATE TABLE IF NOT EXISTS `vouchers_references_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `vouchers_reference_id` int(10) NOT NULL,
  `account_group_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
