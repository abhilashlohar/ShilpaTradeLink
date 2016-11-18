-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2016 at 06:07 AM
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
  `blood_group` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `sex`, `dipartment_id`, `designation_id`, `mobile`, `email`, `signature`, `account_no`, `bank_name`, `branch_name`, `ifsc_code`, `permanent_address`, `residence_address`, `phone_no`, `dob`, `marital_status`, `date_of_anniversary`, `spouse_name`, `children`, `spouse_working`, `qualification`, `last_company`, `join_date`, `permanent_join_date`, `blood_group`) VALUES
(1, 'Mohammed Arif', 'Male', 1, 1, '9649004777', 'arif@mogragroup.com', '5806126b0b6e8.png', '', '', '', '', '', '', '0', '0000-00-00', '', '0000-00-00', '', 0, '0', '', '', '0000-00-00', '0000-00-00', ''),
(2, 'Jagdish Salvi', 'Male', 1, 2, '9983247774', 'jagdish@mogragroup.com', '580dabf8784e4.png', '', '', '', '', '', '', '0', '0000-00-00', '', '0000-00-00', '', 0, '0', '', '', '0000-00-00', '0000-00-00', ''),
(3, 'Harshit Patel', 'Male', 1, 2, '9772404777', 'harshit@mogragroup.com', '580dac166a19d.png', '', '', '', '', '', '', '0', '0000-00-00', '', '0000-00-00', '', 0, '0', '', '', '0000-00-00', '0000-00-00', ''),
(4, 'Pushpendra Chauhan', 'Male', 1, 3, '9672994770', 'pushpendra@mogragroup.com', '580dac3905fe0.png', '', '', '', '', '', '', '0', '0000-00-00', '', '0000-00-00', '', 0, '0', '', '', '0000-00-00', '0000-00-00', ''),
(5, 'Vijay Gohil', 'Male', 1, 2, '9772604777', 'vijay@mogragroup.com', '580dac676529b.png', '', '', '', '', '', '', '0', '0000-00-00', '', '0000-00-00', '', 0, '0', '', '', '0000-00-00', '0000-00-00', ''),
(7, 'Priyanka Harkawat', 'Female', 1, 1, '8233815237', 'hpika@gmail.com', '582d4de4ea923.png', '678778656768768', 'Canara', 'Subhashnagar', '23459878678', '1, pratap  colony badgaon,udaipur', '1, pratap  colony badgaon,udaipur', '0', '0000-00-00', '', '0000-00-00', '', 0, '0', 'MCA', '-', '0000-00-00', '0000-00-00', 'o+'),
(8, 'Pika Jain', 'Female', 1, 1, '8466778898', 'hpika@gmail.com', '582d533243fa5.png', '978767546546546', 'Canara', 'Subhashnagar', '98786544', 'badgaon', 'badgaon', '0', '1970-01-01', '', '1970-01-01', '', 0, '0', 'MCA', '-', '2016-11-06', '2016-11-07', 'o+'),
(9, 'Pika Jain', 'Female', 1, 1, '8466778898', 'hpika@gmail.com', '582d535832af6.png', '978767546546546', 'Canara', 'Subhashnagar', '98786544', 'badgaon', 'badgaon', '0', '2016-11-01', '', '1970-01-01', '', 0, '0', 'MCA', '-', '2016-11-06', '2016-11-07', 'o+'),
(10, 'Priyanka', 'Female', 1, 1, '876576578', 'hpika@gmail.com', '582d55fa1258d.png', '', '', '', '', 'a', 'a', '0', '1970-01-01', '', '1970-01-01', '', 0, '0', '', '', '1970-01-01', '1970-01-01', ''),
(17, 'ASDS', 'Female', 2, 2, '9876543212', 'ASFSA@JHGHJ.SEFSD', '582d62829b6fd.png', '9087654321', 'Canara', 'SDF', 'ZDSF', 'SZDSA', 'ssdfsd', '876543256768', '2016-11-10', 'Married', '2016-11-17', 'ASFSD', 3, 'No', 'ASDA', 'SAD', '1970-01-01', '2010-02-10', '7');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
