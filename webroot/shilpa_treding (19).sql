-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2016 at 07:00 AM
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
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) NOT NULL,
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
  `sale_tax_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `customer_id`, `customer_address`, `lr_no`, `terms_conditions`, `discount_type`, `total`, `pnf`, `pnf_type`, `pnf_per`, `total_after_pnf`, `sale_tax_per`, `sale_tax_amount`, `exceise_duty`, `ed_description`, `fright_amount`, `fright_text`, `grand_total`, `due_payment`, `date_created`, `company_id`, `process_status`, `sales_order_id`, `in1`, `in2`, `in4`, `in3`, `customer_po_no`, `po_date`, `additional_note`, `employee_id`, `created_by`, `transporter_id`, `discount_per`, `discount`, `form47`, `form49`, `sale_tax_id`) VALUES
(1, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 'erfdg', '', 0, '500.00', '0.00', 0, '0.00', '500.00', '5.50', '27.50', '0.00', '', '0.00', '', '527.50', '527.50', '2016-12-13', 25, 'Pulled From Sales-Order', 1, 'STL', 1, '16-17', 'BE-3065', '234', '2016-12-13', '', 1, 1, 4, '0.00', '0.00', 'ert', 'ert', 1),
(2, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 'yt546', '', 0, '13000.00', '0.00', 0, '0.00', '13000.00', '5.50', '715.00', '0.00', '', '0.00', '', '13715.00', '13715.00', '2016-12-14', 25, 'Pulled From Sales-Order', 2, 'STL', 2, '16-17', 'BE-3', '324', '2016-12-13', '', 1, 1, 1, '0.00', '0.00', '45645', '456', 1),
(3, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 'dfh', '', 0, '31197.00', '0.00', 0, '0.00', '31197.00', '5.50', '1715.84', '0.00', '', '0.00', '', '32912.83', '32912.83', '2016-12-14', 25, 'Pulled From Sales-Order', 2, 'STL', 3, '16-17', 'BE-3', '324', '2016-12-13', '', 1, 1, 1, '0.00', '0.00', '346', 'e5t', 1);

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
  `height` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_rows`
--

INSERT INTO `invoice_rows` (`id`, `invoice_id`, `item_id`, `description`, `quantity`, `rate`, `amount`, `height`) VALUES
(1, 1, 61, 'sdsdfsd\r\nsdfsdf', 5, '100.00', '500.00', 0),
(4, 2, 38, '<b>ewwere</b><div><i>erewr</i></div><div>&nbsp;<u>sdfsdfsfds</u><br></div><div><u><br></u></div><div><u><br></u></div><div><u><br></u></div><div><i><b><u>asdasdas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dsfsdfsdfsdfsd</u></b></i></div>', 1, '11000.00', '11000.00', 0),
(5, 2, 40, '<span style="font-weight: 700;">ewwere</span><div><i>erewr</i></div><div>&nbsp;<u>sdfsdfsfds</u><br></div><div><u><br></u></div><div><u><br></u></div><div><u><br></u></div><div><i><span style="font-weight: 700;"><u>asdasdas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dsfsdfsdfsdfsd</u></span></i></div>', 2, '1000.00', '2000.00', 0),
(8, 3, 58, '<span style="font-weight: 700;">ewwere</span><div><i>erewr</i></div><div>&nbsp;<u>sdfsdfsfds</u><br></div><div><u><br></u></div><div><u><br></u></div><div><u><br></u></div><div><i><span style="font-weight: 700;"><u>asdasdas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dsfsdfsdfsdfsd</u></span></i></div>', 3, '400.00', '1200.00', 0),
(9, 3, 108, '<span style="font-weight: 700;">ewwere</span><div><i>erewr</i></div><div>&nbsp;<u>sdfsdfsfds</u><br></div><div><u><br></u></div><div><u><br></u></div><div><u><br></u></div><div><i><span style="font-weight: 700;"><u>asdasdas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dsfsdfsdfsdfsd</u></span></i></div>', 5, '5999.40', '29997.00', 0);

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
  `qt2` varchar(10) NOT NULL,
  `qt3` varchar(10) NOT NULL,
  `qt4` varchar(10) NOT NULL,
  `created_by` int(10) NOT NULL,
  `edited_by` int(10) NOT NULL,
  `created_on` date NOT NULL,
  `edited_on` date NOT NULL,
  `revision` int(10) NOT NULL,
  `quotation_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quotations`
--

INSERT INTO `quotations` (`id`, `customer_id`, `customer_address`, `employee_id`, `item_group_id`, `finalisation_date`, `customer_for_attention`, `customer_contact`, `enquiry_no`, `subject`, `text`, `additional_note`, `terms_conditions`, `total`, `status`, `company_id`, `qt1`, `qt2`, `qt3`, `qt4`, `created_by`, `edited_by`, `created_on`, `edited_on`, `revision`, `quotation_id`) VALUES
(1, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 1, 1, '2016-12-14', 'Satpal Marwah', '2147483647', 'df', 'dfgdfg', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', 'dfgdf', '17776.00', 'Pending', 25, 'STL', '1', 'BE-3', '16-17', 1, 0, '2016-12-13', '0000-00-00', 0, 1),
(3, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 1, 1, '2016-12-14', 'Satpal Marwah', '2147483647', 'df', 'dfgdfg', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', 'dfgdf', '17776.00', 'Pending', 25, 'STL', '1', 'BE-3', '16-17', 1, 0, '2016-12-13', '0000-00-00', 1, 1),
(4, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 1, 1, '2016-12-14', 'Satpal Marwah', '2147483647', 'df', 'dfgdfg', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', 'dfgdf', '17776.00', 'Pending', 25, 'STL', '1', 'BE-3', '16-17', 1, 0, '2016-12-13', '0000-00-00', 2, 1),
(5, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 1, 3, '2016-12-27', 'Satpal Marwah', '2147483647', 'sdfdsf', 'sdfsdf', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', 'werwe', '99.00', 'Pending', 25, 'STL', '2', 'BE-3', '16-17', 1, 0, '2016-12-13', '0000-00-00', 0, 5),
(6, 5, 'Bangur Nagar\r\nBeawer 305901 ', 4, 2, '2016-12-20', 'Vivek Saxena', '2147483647', 'sdds', 'dsfsdf', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'dfg', 'sdds', '100.00', 'Pending', 25, 'STL', '3', 'DC-22', '16-17', 1, 0, '2016-12-13', '0000-00-00', 0, 6),
(7, 5, 'Bangur Nagar\r\nBeawer 305901 ', 4, 2, '2016-12-20', 'Vivek Saxena', '2147483647', 'sdds', 'dsfsdf', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'dfg', 'sdds', '100.00', 'Pending', 25, 'STL', '3', 'DC-22', '16-17', 1, 0, '2016-12-13', '0000-00-00', 1, 6),
(8, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 1, 2, '2016-12-28', 'Satpal Marwah', '2147483647', 'erwe', 'rwer', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis     : Ex Our Works, Udaipur\r\n2. P&F             : 2% On Basic Order Value\r\n3. Excise Duty     : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax       : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery        : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n', '44197.00', 'Converted Into Sales Order', 25, 'STL', '4', 'BE-3', '16-17', 1, 0, '2016-12-14', '0000-00-00', 0, 0);

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
  `height` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quotation_rows`
--

INSERT INTO `quotation_rows` (`id`, `quotation_id`, `item_id`, `description`, `quantity`, `rate`, `amount`, `height`) VALUES
(1, 1, 41, 'dfgdfg', 4, '4444.00', '17776.00', 0),
(3, 3, 41, 'dfgdfg', 4, '4444.00', '17776.00', 0),
(4, 4, 41, 'dfgdfg', 4, '4444.00', '17776.00', 0),
(5, 5, 58, 'werwe', 3, '33.00', '99.00', 0),
(6, 6, 58, 'sdfasdfsd&nbsp;&nbsp;&nbsp;&nbsp;<b>werewrew</b><div><b><br></b></div><div><b>dgdfgdg</b></div>', 1, '100.00', '100.00', 0),
(7, 7, 58, 'sdfasdfsd&nbsp;&nbsp;&nbsp;&nbsp;<b>werewrew</b><div><b><br></b></div><div><b>dgdfgdg</b></div>', 1, '100.00', '100.00', 0),
(8, 8, 38, '<b>ewwere</b><div><i>erewr</i></div><div>&nbsp;<u>sdfsdfsfds</u><br></div><div><u><br></u></div><div><u><br></u></div><div><u><br></u></div><div><i><b><u>asdasdas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dsfsdfsdfsdfsd</u></b></i></div>', 1, '11000.00', '11000.00', 0),
(9, 8, 40, '<span style="font-weight: 700;">ewwere</span><div><i>erewr</i></div><div>&nbsp;<u>sdfsdfsfds</u><br></div><div><u><br></u></div><div><u><br></u></div><div><u><br></u></div><div><i><span style="font-weight: 700;"><u>asdasdas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dsfsdfsdfsdfsd</u></span></i></div>', 2, '1000.00', '2000.00', 0),
(10, 8, 58, '<span style="font-weight: 700;">ewwere</span><div><i>erewr</i></div><div>&nbsp;<u>sdfsdfsfds</u><br></div><div><u><br></u></div><div><u><br></u></div><div><u><br></u></div><div><i><span style="font-weight: 700;"><u>asdasdas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dsfsdfsdfsdfsd</u></span></i></div>', 3, '400.00', '1200.00', 0),
(11, 8, 108, '<span style="font-weight: 700;">ewwere</span><div><i>erewr</i></div><div>&nbsp;<u>sdfsdfsfds</u><br></div><div><u><br></u></div><div><u><br></u></div><div><u><br></u></div><div><i><span style="font-weight: 700;"><u>asdasdas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dsfsdfsdfsdfsd</u></span></i></div>', 5, '5999.40', '29997.00', 0);

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
  `job_card` varchar(10) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_orders`
--

INSERT INTO `sales_orders` (`id`, `customer_id`, `employee_id`, `customer_address`, `subject`, `terms_conditions`, `discount_type`, `discount_per`, `discount`, `ed_description`, `exceise_duty`, `total`, `pnf_type`, `pnf_per`, `pnf`, `total_after_pnf`, `additional_note`, `company_id`, `process_status`, `quotation_id`, `transporter_id`, `expected_delivery_date`, `delivery_description`, `documents_courier_id`, `customer_po_no`, `po_date`, `dispatch_name`, `dispatch_mobile`, `dispatch_email`, `dispatch_address`, `road_permit_required`, `form49`, `so1`, `so2`, `so3`, `so4`, `created_by`, `edited_by`, `created_on`, `edited_on`, `edited_on_time`, `created_on_time`, `job_card`) VALUES
(1, 1, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', '', '', 0, '0.00', '0.00', '', '0.00', '200480.00', 0, '0.00', '0.00', '200480.00', '', 25, 'New', NULL, 4, '2016-12-28', 'sdfsd', 1, '234', '2016-12-13', 'Sdfsd', '32432', 'sfsd@rtr.rter', 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 'Yes', 'Yes', 'STL', 1, 'BE-3065', '16-17', 1, 0, '2016-12-13', '1970-01-01', '', '2016-12-13 03:42:30PM', 'Pending'),
(2, 1, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', '', '', 1, '0.00', '0.00', '', '0.00', '44197.00', 0, '0.00', '0.00', '44197.00', '', 25, 'Pulled From Quotation', NULL, 1, '2016-12-22', 'werewr', 1, '324', '2016-12-13', 'Ewrwe', '32432', 'ewr@erwer.rtert', 'ertert', 'Yes', 'Yes', 'STL', 2, 'BE-3', '16-17', 1, 0, '2016-12-14', '1970-01-01', '', '2016-12-14 10:59:58AM', 'Pending');

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
  `height` int(10) NOT NULL,
  `processed_quantity` int(5) NOT NULL DEFAULT '0',
  `sale_tax_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_order_rows`
--

INSERT INTO `sales_order_rows` (`id`, `sales_order_id`, `item_id`, `description`, `quantity`, `rate`, `amount`, `excise_duty`, `height`, `processed_quantity`, `sale_tax_id`) VALUES
(1, 1, 61, 'sdsdfsd\r\nsdfsdf', 5, '100.00', '500.00', 'Yes', 0, 5, 1),
(2, 1, 119, 'safdsaf', 2, '99990.00', '199980.00', 'Yes', 0, 0, 1),
(3, 2, 38, '<b>ewwere</b><div><i>erewr</i></div><div>&nbsp;<u>sdfsdfsfds</u><br></div><div><u><br></u></div><div><u><br></u></div><div><u><br></u></div><div><i><b><u>asdasdas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dsfsdfsdfsdfsd</u></b></i></div>', 1, '11000.00', '11000.00', 'Yes', 0, 1, 1),
(4, 2, 40, '<span style="font-weight: 700;">ewwere</span><div><i>erewr</i></div><div>&nbsp;<u>sdfsdfsfds</u><br></div><div><u><br></u></div><div><u><br></u></div><div><u><br></u></div><div><i><span style="font-weight: 700;"><u>asdasdas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dsfsdfsdfsdfsd</u></span></i></div>', 2, '1000.00', '2000.00', 'Yes', 0, 2, 1),
(5, 2, 58, '<span style="font-weight: 700;">ewwere</span><div><i>erewr</i></div><div>&nbsp;<u>sdfsdfsfds</u><br></div><div><u><br></u></div><div><u><br></u></div><div><u><br></u></div><div><i><span style="font-weight: 700;"><u>asdasdas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dsfsdfsdfsdfsd</u></span></i></div>', 3, '400.00', '1200.00', 'Yes', 0, 3, 1),
(6, 2, 108, '<span style="font-weight: 700;">ewwere</span><div><i>erewr</i></div><div>&nbsp;<u>sdfsdfsfds</u><br></div><div><u><br></u></div><div><u><br></u></div><div><u><br></u></div><div><i><span style="font-weight: 700;"><u>asdasdas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dsfsdfsdfsdfsd</u></span></i></div>', 5, '5999.40', '29997.00', 'Yes', 0, 5, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_rows`
--
ALTER TABLE `invoice_rows`
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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `invoice_rows`
--
ALTER TABLE `invoice_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `quotation_rows`
--
ALTER TABLE `quotation_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `sales_orders`
--
ALTER TABLE `sales_orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sales_order_rows`
--
ALTER TABLE `sales_order_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
