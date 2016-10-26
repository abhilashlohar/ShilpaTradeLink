-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2016 at 09:26 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

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
(17, 'Shilpa Trade Links Pvt Ltd', 'Shilpa', 'S 99/100, Nr DIC Office, Mewar Industrial Area, Madri,, Khempura, Udaipur, Rajasthan 313001', 'P-12345', 'T-12345', 'T123', '', 'S1234', '23456789', '987654321', 'shilpa@gmail.com', 'http://www.mogragroup.com/', 1, 'With Inventory', '57e8af6f3413a.png'),
(18, 'Buildmart Solutions Llp', 'Bs', '"A Square" , 3rd Floor, \r\n1, Shobhagpura, 100 Ft Road, \r\nUdaipur 313011( Rajasthan )', 'AACCS', 'ASDF123', '123dhsk', '', 'AACS01', '0294 2494577', '8696029999', 'info@mogragroup.com', 'www.mogragroup.com', 1, 'With Inventory', '57e8d443ab1a0.png'),
(19, 'Pyrotech Workspace Pvt Ltd', 'Pyrotech', 'afdsfsdf', 'P-12345', '12345', 'T123', '', 'S1234', '456', '45645', 'pyrotech@gmail.com', 'http://www.cyrustechnoedge.com', 1, 'With Inventory', '57e8d443ab1a0.png');

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
(7, 17, 'erter', 'ert', 43534, 'e43543', 1),
(16, 17, 'werwe', 'wer', 3242, '234wer', 1),
(17, 25, 'rrr', 'rrr', 444, 'rrrr', 1),
(18, 27, 'ert', 'erte', 345, '3345', 1);

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
(1, 'Mogra Group'),
(2, 'Sdfsd F Group'),
(3, 'Wer'),
(4, 'Mogra Group 2'),
(5, 'Mogra Group 3');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) NOT NULL,
  `customer_group_id` int(10) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `district_id` int(10) NOT NULL,
  `transporter_id` int(10) NOT NULL,
  `company_group_id` int(10) NOT NULL,
  `customer_seg_id` int(10) NOT NULL,
  `tin_no` varchar(100) NOT NULL,
  `gst_no` varchar(100) NOT NULL,
  `pan_no` varchar(100) NOT NULL,
  `ecc_no` varchar(100) NOT NULL,
  `employee_id` int(10) NOT NULL,
  `payment_terms` int(2) NOT NULL,
  `mode_of_payment` varchar(20) NOT NULL,
  `credit_limit` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_group_id`, `customer_name`, `district_id`, `transporter_id`, `company_group_id`, `customer_seg_id`, `tin_no`, `gst_no`, `pan_no`, `ecc_no`, `employee_id`, `payment_terms`, `mode_of_payment`, `credit_limit`) VALUES
(1, 0, 'Rohit Joshi', 1, 0, 0, 1, 'T-12345', 'G-12345', 'P-12345', 'E-12345', 1, 5, 'Cheque', 0),
(2, 0, 'Gopesh Parihaar', 1, 0, 0, 1, '12345', 'G-12345', 'P-12345', 'E-12345', 1, 1, 'Cheque', 0),
(3, 0, 'Hindustan Zink Pvt Ltd', 1, 0, 0, 1, 'T-12345', 'G-12345', 'P-12345', 'E-12345', 1, 4, 'NEFT', 0),
(4, 0, 'Phppoets It Solution Pvt Ltd', 1, 0, 0, 1, '3423', '324', '23423', '4', 1, 3, 'Cheque', 0),
(5, 1, 'Sdfd', 1, 1, 0, 1, '35', '35', '345', '3453', 2, 4, 'Cheque', 43),
(6, 1, 'Gopal Patel', 1, 1, 0, 1, '3245', '4534', '345', '345345', 2, 34, 'Cheque', 345);

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `district_id` int(10) NOT NULL,
  `transporter_id` int(10) NOT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`id`, `customer_id`, `address`, `district_id`, `transporter_id`, `default_address`) VALUES
(1, 1, 'Address 1 Address 1 Address 1 Address 1 ', 1, 0, 1),
(2, 2, 'erre', 1, 0, 0),
(3, 2, 'ter', 1, 0, 0),
(4, 2, 'tert', 1, 0, 1),
(5, 2, 'ert', 1, 0, 0),
(6, 3, 'werwe', 1, 0, 1),
(7, 3, 'regrt', 1, 0, 0),
(8, 4, 'sdfsd', 1, 0, 1),
(9, 7, '23', 1, 0, 1),
(11, 5, 'erter', 1, 1, 1),
(12, 6, 'dfgdfg', 1, 0, 1);

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
  `mobile` int(10) NOT NULL,
  `default_contact` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_contacts`
--

INSERT INTO `customer_contacts` (`id`, `contact_person`, `customer_id`, `designation`, `telephone`, `mobile`, `default_contact`) VALUES
(1, 'xvcvxcv', 1, '5', 'Telephone1', 2147483647, 1),
(2, '', 2, '4', '324', 234, 1),
(3, '', 3, '4', '3223', 234445, 1),
(4, '', 4, '4', '32432', 999999, 1),
(5, '', 4, '3', '32432', 423, 0),
(6, '', 7, '324', '324', 234, 1),
(7, '', 7, '234', '234', 234, 0),
(9, 'et', 5, '3ert', '43534', 435, 1),
(10, 'dfgdf', 6, 'dfgdfg', '436', 4645, 1);

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
(1, 'Groups 1'),
(2, 'Groups 2');

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
(1, 'Customer Segments 1'),
(2, 'Customer Segments 2');

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
(1, 'Salesman'),
(2, 'Finance'),
(3, 'HR Department');

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
(1, 'Sr. Saleman'),
(2, 'Sr. Persion');

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
(1, 'Rajsthan', 'Udaipur'),
(2, 'Rajsthan', 'Dungarpur'),
(3, 'We', 'We'),
(4, 'We', 'We');

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
  `address` text NOT NULL,
  `signature` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `sex`, `dipartment_id`, `designation_id`, `mobile`, `email`, `address`, `signature`) VALUES
(2, 'Yashraj', 'Male', 1, 1, '234', 'asd@esfd.dtgr', 'wrwer', '5800f979704ca.png'),
(3, 'Yashraj 2', 'Male', 1, 2, '9876543245', 'werfe@etry.ytut', 'dfgdf', '5801d3cb314a9.png'),
(4, 'Sfsd', 'Male', 2, 2, 'erewr', 'sdf@eerr.er', 'weew', '5805d2cb2fb40.png');

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
(8, 'BE', 1, 842),
(9, 'DC', 1, 441),
(10, 'BE', 2, 843),
(11, 'DC', 2, 442),
(12, 'BE', 5, 844);

-- --------------------------------------------------------

--
-- Table structure for table `grns`
--

CREATE TABLE `grns` (
  `id` int(10) NOT NULL,
  `date` date NOT NULL,
  `purchase_order_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  `grn1` varchar(10) NOT NULL,
  `grn3` varchar(10) NOT NULL,
  `grn4` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `grn_rows`
--

CREATE TABLE `grn_rows` (
  `id` int(10) NOT NULL,
  `grn_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `customer_address` text NOT NULL,
  `lr_no` varchar(50) NOT NULL,
  `terms_conditions` text NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `pnf` decimal(10,2) NOT NULL,
  `pnf_type` tinyint(1) NOT NULL,
  `pnf_per` decimal(4,2) NOT NULL,
  `total_after_pnf` decimal(10,2) NOT NULL,
  `sale_tax_description` varchar(255) NOT NULL,
  `sale_tax_per` decimal(4,2) NOT NULL,
  `sale_tax_amount` decimal(10,2) NOT NULL,
  `discount_type` tinyint(1) NOT NULL,
  `discount_per` decimal(4,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `exceise_duty` decimal(10,2) NOT NULL,
  `ed_description` varchar(255) NOT NULL,
  `fright_amount` decimal(8,2) NOT NULL,
  `fright_text` varchar(255) NOT NULL,
  `grand_total` decimal(15,2) NOT NULL,
  `date_created` date NOT NULL,
  `company_id` int(10) NOT NULL,
  `process_status` varchar(30) NOT NULL,
  `sales_order_id` int(10) NOT NULL,
  `in1` varchar(10) NOT NULL,
  `in4` varchar(10) NOT NULL,
  `in3` varchar(10) NOT NULL,
  `customer_po_no` varchar(100) NOT NULL,
  `additional_note` varchar(255) NOT NULL,
  `employee_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `customer_id`, `customer_address`, `lr_no`, `terms_conditions`, `total`, `pnf`, `pnf_type`, `pnf_per`, `total_after_pnf`, `sale_tax_description`, `sale_tax_per`, `sale_tax_amount`, `discount_type`, `discount_per`, `discount`, `exceise_duty`, `ed_description`, `fright_amount`, `fright_text`, `grand_total`, `date_created`, `company_id`, `process_status`, `sales_order_id`, `in1`, `in4`, `in3`, `customer_po_no`, `additional_note`, `employee_id`) VALUES
(1, 1, 'Address 1 Address 1 Address 1 Address 1 ', '3456', '', '1343.45', '53.74', 1, '4.00', '1397.19', 'sfdsf sf sdf sdf ', '14.60', '203.99', 1, '5.00', '52.55', '345.00', 'werrwer', '3434.00', '43543', '5035.18', '2016-10-25', 17, 'Pulled From Sales-Order', 1, 'Shilpa', '16-17', 'BE-842', '34567', '435', 3);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_bookings`
--

CREATE TABLE `invoice_bookings` (
  `id` int(10) NOT NULL,
  `grn_id` int(10) NOT NULL,
  `invoice_no` varchar(100) NOT NULL
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
  `amount` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_rows`
--

INSERT INTO `invoice_rows` (`id`, `invoice_id`, `item_id`, `description`, `quantity`, `rate`, `amount`) VALUES
(1, 1, 8, 'The requested URL was not found on this server. If you entered the URL manually please check your spelling and try again.\r\n\r\nIf you think this is a server error, please contact the', 3, '345.00', '1035.00'),
(2, 1, 9, 'The requested URL was not found on this server. If you entered the URL manually please check your spelling and try again.\r\n\r\nIf you think this is a server error, please contact the', 4, '4.00', '16.00');

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
  `source` varchar(20) NOT NULL,
  `minimum_quantity` int(10) NOT NULL,
  `maximum_quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `alias`, `item_category_id`, `item_group_id`, `item_sub_group_id`, `unit_id`, `ob_quantity`, `ob_rate`, `ob_value`, `freeze`, `serial_number_enable`, `source`, `minimum_quantity`, `maximum_quantity`) VALUES
(8, 'Item 1', 'Dsfsd', 1, 3, 3, 1, 4, 44, '176.00', 0, 0, '', 44, 4),
(9, 'Item 2', 'Item 2', 1, 3, 3, 1, 1, 22, '22.00', 0, 1, '', 2, 33);

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
(1, 'Category 1	'),
(2, 'Category 2');

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
(8, 17),
(8, 27),
(9, 17),
(9, 18),
(9, 19);

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
(3, 1, 'Item Group 1');

-- --------------------------------------------------------

--
-- Table structure for table `item_sources`
--

CREATE TABLE `item_sources` (
  `item_id` int(10) NOT NULL,
  `source_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_sources`
--

INSERT INTO `item_sources` (`item_id`, `source_id`) VALUES
(8, 1),
(8, 3),
(9, 1),
(9, 2),
(9, 3);

-- --------------------------------------------------------

--
-- Table structure for table `item_sub_groups`
--

CREATE TABLE `item_sub_groups` (
  `id` int(10) NOT NULL,
  `item_group_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_sub_groups`
--

INSERT INTO `item_sub_groups` (`id`, `item_group_id`, `name`) VALUES
(1, 1, 'Item Sub Group 1'),
(2, 2, 'Item Sub Group 2'),
(3, 3, 'ITEM SUB GROUPS 1');

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
(1, 0, 'admin', 'admin', '0'),
(4, 2, 'yash', 'yash', 'Active');

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
-- Table structure for table `phinxlog`
--

CREATE TABLE `phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
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

CREATE TABLE `purchase_orders` (
  `id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  `date_created` date NOT NULL,
  `vendor_id` int(10) NOT NULL,
  `text` text NOT NULL,
  `po1` varchar(10) NOT NULL,
  `po3` varchar(10) NOT NULL,
  `po4` varchar(10) NOT NULL,
  `material_to_be_transported` varchar(255) NOT NULL,
  `sale_tax_per` decimal(4,2) NOT NULL,
  `sale_tax_description` varchar(255) NOT NULL,
  `exceise_duty` varchar(255) NOT NULL,
  `delivery` varchar(255) NOT NULL,
  `lr_to_be_prepared_in_favour_of` varchar(255) NOT NULL,
  `payment_terms` varchar(255) NOT NULL,
  `road_permit_form47` varchar(255) NOT NULL,
  `transporter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `company_id`, `date_created`, `vendor_id`, `text`, `po1`, `po3`, `po4`, `material_to_be_transported`, `sale_tax_per`, `sale_tax_description`, `exceise_duty`, `delivery`, `lr_to_be_prepared_in_favour_of`, `payment_terms`, `road_permit_form47`, `transporter_id`) VALUES
(1, 17, '0000-00-00', 5, 'Dear Sir,\r\nWith reference to your price list we are pleased to place an order for the following items as per conditions given below.', 'Shilpa', 'BE-842', '16-17', '', '0.00', '', '', '', '', '', '', 0),
(2, 18, '0000-00-00', 5, 'Dear Sir,\r\nWith reference to your price list we are pleased to place an order for the following items as per conditions given below.', 'Bs', 'BE-842', '16-17', '', '0.00', '', '', '', '', '', '', 0),
(3, 18, '2016-10-21', 5, 'Dear Sir,\r\nWith reference to your price list we are pleased to place an order for the following items as per conditions given below.', 'Bs', 'BE-842', '16-17', '', '0.00', '', '', '', '', '', '', 0);

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
  `processed_quantity` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_order_rows`
--

INSERT INTO `purchase_order_rows` (`id`, `purchase_order_id`, `item_id`, `description`, `quantity`, `rate`, `amount`, `processed_quantity`) VALUES
(1, 1, 8, 'd1', 2, '12.00', '24.00', 0),
(2, 1, 8, 'd2', 3, '4.00', '12.00', 0),
(3, 2, 8, '', 2, '2.00', '4.00', 0),
(4, 3, 8, 'd1', 2, '3.00', '6.00', 0);

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
  `customer_contact` varchar(10) NOT NULL,
  `enquiry_no` varchar(50) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `text` text NOT NULL,
  `additional_note` text NOT NULL,
  `terms_conditions` text NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Pending',
  `company_id` int(10) NOT NULL,
  `qt1` varchar(10) NOT NULL,
  `qt3` varchar(10) NOT NULL,
  `qt4` varchar(10) NOT NULL,
  `created_by` int(10) NOT NULL,
  `edited_by` int(10) NOT NULL,
  `created_on` date NOT NULL,
  `edited_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quotations`
--

INSERT INTO `quotations` (`id`, `customer_id`, `customer_address`, `employee_id`, `item_group_id`, `finalisation_date`, `customer_for_attention`, `customer_contact`, `enquiry_no`, `subject`, `text`, `additional_note`, `terms_conditions`, `total`, `status`, `company_id`, `qt1`, `qt3`, `qt4`, `created_by`, `edited_by`, `created_on`, `edited_on`) VALUES
(2, 1, 'Address 1 Address 1 Address 1 Address 1 ', 2, 3, '1970-01-01', 'xvcvxcv', '2147483647', 'dfv', 'sdfsd', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Sturdy drive design provides strength for rigorous continuous operation.\r\n2. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '6400.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 2, '2016-10-24', '2016-10-24'),
(3, 1, 'Address 1 Address 1 Address 1 Address 1 ', 2, 3, '1970-01-01', 'xvcvxcv', '2147483647', 'asdfg', 'sdfg', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Sturdy drive design provides strength for rigorous continuous operation.\r\n2. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '99.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-24', '0000-00-00'),
(4, 1, 'Address 1 Address 1 Address 1 Address 1 ', 2, 3, '2016-10-24', 'xvcvxcv', '9999999999', 'asd', 'asdsad', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Sturdy drive design provides strength for rigorous continuous operation.\r\n2. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '102.00', 'Converted Into Sales Order', 17, 'Shilpa', 'BE-842', '16-17', 2, 2, '2016-10-24', '2016-10-24'),
(5, 1, 'Address 1 Address 1 Address 1 Address 1 ', 2, 3, '2016-10-25', 'xvcvxcv', '2147483647', 'aesdt', 'werty', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Sturdy drive design provides strength for rigorous continuous operation.\r\n2. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n3. Close coupled models with built-on speed reducers offer compact pumping unit.\r\n4. The candidate should have Diploma/Degree in Electrical Engineering with 1-3 years experience\r\n', '308.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 2, '2016-10-25', '2016-10-25'),
(6, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(7, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(8, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(9, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(10, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(11, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(12, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(13, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(14, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(15, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(16, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(17, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(18, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(19, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(20, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(21, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(22, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(23, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(24, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(25, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(26, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(27, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(28, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(29, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(30, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(31, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(32, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(33, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(34, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(35, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(36, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(37, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(38, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(39, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(40, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(41, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(42, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(43, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(44, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(45, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(46, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(47, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(48, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(49, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(50, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(51, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(52, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(53, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(54, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(55, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(56, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(57, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(58, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(59, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(60, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(61, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(62, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(63, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(64, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(65, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(66, 1, 'Address 1 Address 1 Address 1 Address 1 ', 3, 3, '2016-10-25', 'xvcvxcv', '9876543345', 'erer', 'reer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.\r\n', '136.00', 'Pending', 17, 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00');

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
  `amount` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quotation_rows`
--

INSERT INTO `quotation_rows` (`id`, `quotation_id`, `item_id`, `description`, `quantity`, `rate`, `amount`) VALUES
(4, 2, 8, 'qwertyuiop', 1, '2000.00', '2000.00'),
(5, 2, 9, 'sdfg fsf sdf sdf sadf sdf sd\r\nfsd fsd fsd f ', 2, '2200.00', '4400.00'),
(6, 3, 8, 'sdfg', 3, '33.00', '99.00'),
(7, 4, 8, 'sdfsdf', 3, '34.00', '102.00'),
(8, 5, 8, 'The requested URL was not found on this server. If you entered the URL manually please check your spelling and try again.\r\n\r\nIf you think this is a server error, please contact\r\nThe requested URL was not found on this server. If you entered the URL manually please check your spelling and try again.\r\n\r\nIf you think this is a server error, please contact', 3, '44.00', '132.00'),
(9, 5, 9, 'The requested URL was not found on this server. If you entered the URL manually please check your spelling and try again.\r\n\r\nIf you think this is a server error, please contactThe requested URL was not found on this server. If you entered the URL manually please check your spelling and try again.\r\n\r\nIf you think this is a server error, please contactThe requested URL was not found on this server. If you entered the URL manually please check your spelling and try again.\r\n\r\nIf you think this is a server error, please contactThe requested URL was not found on this server. If you entered the URL manually please check your spelling and try again.\r\n\r\nIf you think this is a server error, please contact', 44, '4.00', '176.00'),
(10, 6, 8, 'dfgdf', 4, '34.00', '136.00'),
(11, 7, 8, 'dfgdf', 4, '34.00', '136.00'),
(12, 8, 8, 'dfgdf', 4, '34.00', '136.00'),
(13, 9, 8, 'dfgdf', 4, '34.00', '136.00'),
(14, 10, 8, 'dfgdf', 4, '34.00', '136.00'),
(15, 11, 8, 'dfgdf', 4, '34.00', '136.00'),
(16, 12, 8, 'dfgdf', 4, '34.00', '136.00'),
(17, 13, 8, 'dfgdf', 4, '34.00', '136.00'),
(18, 14, 8, 'dfgdf', 4, '34.00', '136.00'),
(19, 15, 8, 'dfgdf', 4, '34.00', '136.00'),
(20, 16, 8, 'dfgdf', 4, '34.00', '136.00'),
(21, 17, 8, 'dfgdf', 4, '34.00', '136.00'),
(22, 18, 8, 'dfgdf', 4, '34.00', '136.00'),
(23, 19, 8, 'dfgdf', 4, '34.00', '136.00'),
(24, 20, 8, 'dfgdf', 4, '34.00', '136.00'),
(25, 21, 8, 'dfgdf', 4, '34.00', '136.00'),
(26, 22, 8, 'dfgdf', 4, '34.00', '136.00'),
(27, 23, 8, 'dfgdf', 4, '34.00', '136.00'),
(28, 24, 8, 'dfgdf', 4, '34.00', '136.00'),
(29, 25, 8, 'dfgdf', 4, '34.00', '136.00'),
(30, 26, 8, 'dfgdf', 4, '34.00', '136.00'),
(31, 27, 8, 'dfgdf', 4, '34.00', '136.00'),
(32, 28, 8, 'dfgdf', 4, '34.00', '136.00'),
(33, 29, 8, 'dfgdf', 4, '34.00', '136.00'),
(34, 30, 8, 'dfgdf', 4, '34.00', '136.00'),
(35, 31, 8, 'dfgdf', 4, '34.00', '136.00'),
(36, 32, 8, 'dfgdf', 4, '34.00', '136.00'),
(37, 33, 8, 'dfgdf', 4, '34.00', '136.00'),
(38, 34, 8, 'dfgdf', 4, '34.00', '136.00'),
(39, 35, 8, 'dfgdf', 4, '34.00', '136.00'),
(40, 36, 8, 'dfgdf', 4, '34.00', '136.00'),
(41, 37, 8, 'dfgdf', 4, '34.00', '136.00'),
(42, 38, 8, 'dfgdf', 4, '34.00', '136.00'),
(43, 39, 8, 'dfgdf', 4, '34.00', '136.00'),
(44, 40, 8, 'dfgdf', 4, '34.00', '136.00'),
(45, 41, 8, 'dfgdf', 4, '34.00', '136.00'),
(46, 42, 8, 'dfgdf', 4, '34.00', '136.00'),
(47, 43, 8, 'dfgdf', 4, '34.00', '136.00'),
(48, 44, 8, 'dfgdf', 4, '34.00', '136.00'),
(49, 45, 8, 'dfgdf', 4, '34.00', '136.00'),
(50, 46, 8, 'dfgdf', 4, '34.00', '136.00'),
(51, 47, 8, 'dfgdf', 4, '34.00', '136.00'),
(52, 48, 8, 'dfgdf', 4, '34.00', '136.00'),
(53, 49, 8, 'dfgdf', 4, '34.00', '136.00'),
(54, 50, 8, 'dfgdf', 4, '34.00', '136.00'),
(55, 51, 8, 'dfgdf', 4, '34.00', '136.00'),
(56, 52, 8, 'dfgdf', 4, '34.00', '136.00'),
(57, 53, 8, 'dfgdf', 4, '34.00', '136.00'),
(58, 54, 8, 'dfgdf', 4, '34.00', '136.00'),
(59, 55, 8, 'dfgdf', 4, '34.00', '136.00'),
(60, 56, 8, 'dfgdf', 4, '34.00', '136.00'),
(61, 57, 8, 'dfgdf', 4, '34.00', '136.00'),
(62, 58, 8, 'dfgdf', 4, '34.00', '136.00'),
(63, 59, 8, 'dfgdf', 4, '34.00', '136.00'),
(64, 60, 8, 'dfgdf', 4, '34.00', '136.00'),
(65, 61, 8, 'dfgdf', 4, '34.00', '136.00'),
(66, 62, 8, 'dfgdf', 4, '34.00', '136.00'),
(67, 63, 8, 'dfgdf', 4, '34.00', '136.00'),
(68, 64, 8, 'dfgdf', 4, '34.00', '136.00'),
(69, 65, 8, 'dfgdf', 4, '34.00', '136.00'),
(70, 66, 8, 'dfgdf', 4, '34.00', '136.00');

-- --------------------------------------------------------

--
-- Table structure for table `sales_orders`
--

CREATE TABLE `sales_orders` (
  `id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `employee_id` int(10) NOT NULL,
  `customer_address` text NOT NULL,
  `subject` varchar(200) NOT NULL,
  `terms_conditions` text NOT NULL,
  `total` decimal(15,2) NOT NULL,
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
  `road_permit_required` varchar(5) NOT NULL,
  `form49` varchar(5) NOT NULL,
  `so1` varchar(10) NOT NULL,
  `so3` varchar(10) NOT NULL,
  `so4` varchar(10) NOT NULL,
  `created_by` int(10) NOT NULL,
  `edited_by` int(10) NOT NULL,
  `created_on` date NOT NULL,
  `edited_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_orders`
--

INSERT INTO `sales_orders` (`id`, `customer_id`, `employee_id`, `customer_address`, `subject`, `terms_conditions`, `total`, `additional_note`, `company_id`, `process_status`, `quotation_id`, `transporter_id`, `expected_delivery_date`, `delivery_description`, `documents_courier_id`, `customer_po_no`, `po_date`, `dispatch_name`, `dispatch_mobile`, `dispatch_email`, `road_permit_required`, `form49`, `so1`, `so3`, `so4`, `created_by`, `edited_by`, `created_on`, `edited_on`) VALUES
(1, 1, 3, 'Address 1 Address 1 Address 1 Address 1 ', '', '', '1051.00', 'The requested URL was not found on this server. If you entered the URL manually please check your spelling and try again.\r\n\r\nIf you think this is a server error, please contact the', 17, 'New', NULL, 3, '2016-10-25', 'The requested URL was not found on this server. If you entered the URL manually please check your spelling and try again.\r\n\r\nIf you think this is a server error, please contact the', 3, '34567', '2016-10-24', 'Sdfgh', '234567', 'sdfyg@werty.ertyui', 'Yes', 'No', 'Shilpa', 'BE-842', '16-17', 2, 0, '2016-10-25', '0000-00-00');

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
  `so_sale_tax` decimal(4,2) NOT NULL,
  `sale_tax_description` varchar(255) NOT NULL,
  `processed_quantity` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_order_rows`
--

INSERT INTO `sales_order_rows` (`id`, `sales_order_id`, `item_id`, `description`, `quantity`, `rate`, `amount`, `excise_duty`, `so_sale_tax`, `sale_tax_description`, `processed_quantity`) VALUES
(1, 1, 8, 'The requested URL was not found on this server. If you entered the URL manually please check your spelling and try again.\r\n\r\nIf you think this is a server error, please contact the', 3, '345.00', '1035.00', 'Yes', '5.50', 'sfdsf sf sdf sdf ', 3),
(2, 1, 9, 'The requested URL was not found on this server. If you entered the URL manually please check your spelling and try again.\r\n\r\nIf you think this is a server error, please contact the', 4, '4.00', '16.00', 'Yes', '14.60', 'saasd asihd iashdukha sukd ask', 4);

-- --------------------------------------------------------

--
-- Table structure for table `sale_taxes`
--

CREATE TABLE `sale_taxes` (
  `id` int(10) NOT NULL,
  `tax_figure` decimal(4,2) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale_taxes`
--

INSERT INTO `sale_taxes` (`id`, `tax_figure`, `description`) VALUES
(1, '14.60', 'saasd asihd iashdukha sukd ask'),
(2, '5.50', 'sfdsf sf sdf sdf ');

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
(1, 'Sturdy drive design provides strength for rigorous continuous operation.'),
(2, 'Unique Pivot-Joint Design Extends Service Life And Reduces Replacement Cost.'),
(3, 'Close coupled models with built-on speed reducers offer compact pumping unit.'),
(4, 'The candidate should have Diploma/Degree in Electrical Engineering with 1-3 years experience'),
(5, 'All Information Received By Us From Your Registration On Business-Standard.Com Or Other Digital Products Of Business Standard Will Be Used '),
(6, 'Each Registration Is For A Single User Only. On Registration, You Will Choose A User Name And Password ("Id"). You Are Not Allowed To Share Your '),
(7, 'Sturdy drive design provides strength for rigorous continuous operation.'),
(8, 'Unique pivot-joint design extends service life and reduces replacement cost.	'),
(9, 'Close coupled models with built-on speed reducers offer compact pumping unit.	'),
(10, 'The candidate should have Diploma/Degree in Electrical Engineering with 1-3 years experience'),
(11, 'All Information Received By Us From Your Registration On Business-Standard.Com Or Other Digital Products Of Business Standard Will Be Used	');

-- --------------------------------------------------------

--
-- Table structure for table `transporters`
--

CREATE TABLE `transporters` (
  `id` int(10) NOT NULL,
  `transporter_name` varchar(100) NOT NULL,
  `mobile` bigint(10) UNSIGNED ZEROFILL NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transporters`
--

INSERT INTO `transporters` (`id`, `transporter_name`, `mobile`, `address`) VALUES
(1, 'Transporter 1555', 0222222222, 'dfdg'),
(2, 'DTDC Courier', 99999999999, 'Udaipur'),
(3, 'Transporter 2', 0000000000, 'sdsd sds  daes \r\ns fsdf '),
(4, 'rdfgdf', 0000000000, 'r');

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
(1, 'KM3'),
(5, 'D');

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
(50, 4, 1),
(51, 4, 2),
(52, 4, 3),
(53, 4, 4);

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
  `item_group_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `company_name`, `address`, `tin_no`, `gst_no`, `ecc_no`, `pan_no`, `payment_terms`, `mode_of_payment`, `item_group_id`) VALUES
(5, 'Supp Company 1', 'wef', '234', '', '23', '234', 2, '234', 3),
(6, 'Q', 'q', 'q', 'q', 'qq', 'qq', 1, 'q', 3);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_contact_persons`
--

CREATE TABLE `vendor_contact_persons` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` int(10) NOT NULL,
  `default_person` tinyint(1) NOT NULL,
  `vendor_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_contact_persons`
--

INSERT INTO `vendor_contact_persons` (`id`, `name`, `email`, `mobile`, `default_person`, `vendor_id`) VALUES
(8, 'wdfvb', 'sdf@wefg.wsf', 234234234, 0, 5),
(9, 'asdf', 'qwe@wer.qwer', 234343434, 0, 5),
(10, '3', '3@3.3', 3, 1, 5),
(12, 'w', 'w@f.t', 2, 0, 6),
(13, 'q', 'q', 2, 0, 6);

--
-- Indexes for dumped tables
--

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
-- Indexes for table `filenames`
--
ALTER TABLE `filenames`
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
  ADD PRIMARY KEY (`item_id`,`company_id`);

--
-- Indexes for table `item_groups`
--
ALTER TABLE `item_groups`
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
-- Indexes for table `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phinxlog`
--
ALTER TABLE `phinxlog`
  ADD PRIMARY KEY (`version`);

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
-- Indexes for table `quotation_rows`
--
ALTER TABLE `quotation_rows`
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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `company_banks`
--
ALTER TABLE `company_banks`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `company_groups`
--
ALTER TABLE `company_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `customer_contacts`
--
ALTER TABLE `customer_contacts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `customer_segs`
--
ALTER TABLE `customer_segs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `filenames`
--
ALTER TABLE `filenames`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
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
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `invoice_bookings`
--
ALTER TABLE `invoice_bookings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice_rows`
--
ALTER TABLE `invoice_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `item_groups`
--
ALTER TABLE `item_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `item_sub_groups`
--
ALTER TABLE `item_sub_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `logins`
--
ALTER TABLE `logins`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `purchase_order_rows`
--
ALTER TABLE `purchase_order_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `quotation_rows`
--
ALTER TABLE `quotation_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT for table `sales_orders`
--
ALTER TABLE `sales_orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sales_order_rows`
--
ALTER TABLE `sales_order_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sale_taxes`
--
ALTER TABLE `sale_taxes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sources`
--
ALTER TABLE `sources`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `terms_conditions`
--
ALTER TABLE `terms_conditions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `transporters`
--
ALTER TABLE `transporters`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user_rights`
--
ALTER TABLE `user_rights`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `vendor_contact_persons`
--
ALTER TABLE `vendor_contact_persons`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
