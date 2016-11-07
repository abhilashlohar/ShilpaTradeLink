-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2016 at 07:06 AM
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
(25, 'Shilpa Trade Links Pvt Ltd', 'STL', '"A SQUARE ", 3rd Floor,\r\n100 Ft. Road, Udaipur - 313011 ( Raj )', 'AACCS0229A', '08743900079', 'AADS0812F', 'sdsfdsgdfhdhdh', '', '2980435', '8696029999', 'sales@mogragroup.com', 'www.mogragroup.com', 1, 'With Inventory', '57f8c4058dad8.png'),
(26, 'Shilpa Mechtrad Ltd.', 'SML', '"A-SQUARE" (3rd Floor),1, shobhagpura, 100 ft. Road, Udaipur-313011', 'AAEFF0911B', '08453967799', '', '', '', '02942980435', '8696029999', 'info@mogragroup.com', 'www.mogragroup.com', 1, 'With Inventory', '57fca148376b1.jpg'),
(27, 'Fluid Management & Solutions Llp', 'FMSL', '"A Square ", 3rd Floor,\r\n100 Ft. Road, 1 Shobhagpura,\r\nUdaipur 313011', 'aasspp122', '0987654341', 'aasdh31216', 'ansjkhbvd', 'aassddf55678', '2980435', '8696029999', 'info@mogragroup.com', 'www.mogragroup.com', 1, 'With Inventory', '57fcb8149f735.png');

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
(1, 24, 'Union Bank Of India', 'New Fatehpura', 2147483647, 'UBIN0539406', 1),
(8, 26, 'SBBJ', 'Shobhagpura', 2147483647, 'SBBJ0011485', 1),
(9, 25, 'Union Bank of India', 'New Fatehpura', 2147483647, 'UBIN0539406', 1),
(10, 27, 'SBBJ', 'Shobhagpura', 2147483647, 'SBBJ001485', 1);

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
(1, 'Mogra Groups');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) NOT NULL,
  `customer_group_id` int(10) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
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
  `alias` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_group_id`, `customer_name`, `district_id`, `company_group_id`, `customer_seg_id`, `tin_no`, `gst_no`, `pan_no`, `ecc_no`, `flag`, `employee_id`, `payment_terms`, `mode_of_payment`, `credit_limit`, `alias`) VALUES
(1, 9, 'Jindal Saw Ltd.', 1, 1, 1, '08044052269', '', 'AABCS7280C', 'AABCS7280CEM018', 0, 1, 30, 'NEFT', 45, ''),
(3, 9, 'Adani Wilmar Limited', 4, 1, 4, '08592105419', '', 'AABCA8056G', 'AABCA8056GXM004', 0, 3, 30, 'NEFT', 45, ''),
(4, 9, 'Adani Power Rajasthan Ltd', 12, 0, 3, '08932910817', '', 'AACCS229A', 'AACCSO229AXD001', 0, 3, 30, 'NEFT', 15, ''),
(5, 21, 'Shree Cement Ltd Beawer', 3, 1, 2, '08530101044', '', 'AACCS8796G', 'AACCS8796GXM001', 0, 4, 30, 'NEFT', 4000000, ''),
(6, 10, 'Honda Car India Pvt. Ltd.', 10, 0, 6, '08280854435', '08280854435', 'AAACH1765Q', 'AAACH1765QXM002', 0, 1, 30, 'NEFT', 500000, ''),
(7, 9, 'Ginni International Ltd.', 10, 1, 5, '08570700482', '08570700482', 'AAACG0182E ', 'AAACG0182EXM001', 0, 1, 30, 'NEFT', 500000, ''),
(8, 26, 'Advantage Oils Pvt Ltd', 4, 0, 4, '08512807355', '', 'AAMCA0464H', 'AACCSDCDFCCS', 0, 3, 30, 'NEFT', 15, ''),
(9, 28, 'Balkrishna Industries Limited', 10, 0, 7, '08470852051', '08470852051', 'AAACB3333J', 'AAACB3333JXM012', 0, 1, 30, 'NEFT', 500000, ''),
(10, 29, 'Acc Limited', 4, 0, 2, '08252801090', '', 'AAACT1507C', 'AAACT1507CXM013', 0, 3, 30, 'NEFT', 30, ''),
(11, 24, 'Gipl', 13, 0, 8, '08364000780', '08364000780', 'AEZPP6657H', 'AEZPP6657HED002', 0, 2, 1, 'NEFT', 30, ''),
(12, 30, 'Mangalam Cement Limited', 5, 1, 2, '08442902696', '', 'AABCM6602Q', 'AABCM6602QXM001', 0, 3, 30, 'NEFT', 15, ''),
(13, 31, 'Oswal Papers', 11, 0, 9, '08782152117', '08782152117', 'AAACO2222K', 'AAACO2222KM002', 0, 1, 0, 'NEFT', 10000, ''),
(14, 32, 'Shriram Rayons', 5, 0, 5, '08672951700', '', 'AAACD0204C', 'AAACD0204CXM004', 0, 3, 10, 'Cheque', 5, ''),
(15, 32, 'Shriram Cement Ltd', 5, 0, 2, '08452101422', '', 'AAACD0097R', 'AAACD0097RXM003', 0, 3, 30, 'NEFT', 15, ''),
(16, 26, 'Mahindra Holidays & Resorts India Limited', 13, 0, 12, '08091257429', '', 'AAHSEDITHL', 'AAHSEDITHLXX301', 0, 3, 5, 'Cheque', 0, ''),
(18, 33, 'Cuarzo', 13, 0, 10, '08043963320', '', 'AAHFC3351P', 'AAHFC3351PEM001', 0, 5, 7, 'Cheque', 10000, ''),
(19, 21, 'Shree Cement Ltd RAS', 15, 1, 2, '08530101044', '', 'AACCS8796G', 'AACCS8796GXM003', 0, 4, 30, 'NEFT', 30, ''),
(20, 11, 'Hindustan Zinc Ltd Chanderia', 14, 1, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM005', 0, 4, 30, 'NEFT', 4000000, ''),
(22, 31, 'Rajshree Pulp & Board Mills Pvt.Ltd.', 11, 0, 9, '08022252512', '', 'AACCS0222M', 'TobeProvide', 0, 1, 0, 'NEFT', 10000, ''),
(23, 26, 'Nav Durga Services', 13, 0, 8, '08403852930', '', 'AJSPR6875P', 'AJSPR6875PX003', 0, 3, 15, 'Cheque', 50000, ''),
(24, 35, 'United Spirits Ltd.', 13, 0, 14, '8432101045', '', 'AACCM8043J', 'tobeprovided', 0, 5, 7, 'NEFT', 100000, ''),
(25, 26, 'Ruchi Soya Industries Limited', 4, 0, 4, '08071606834', '', 'AAACR2892I', 'AAACR2892IXM017', 0, 3, 15, 'NEFT', 10000, ''),
(26, 34, 'United Breweries Ltd.,', 10, 1, 14, '08040853694', '08040853694', 'AACCS', 'Tobeprovide', 0, 1, 30, 'NEFT', 500000, ''),
(27, 11, 'Hindustan Zinc Ltd Agucha ', 1, 1, 1, '08053901768', '', 'AAACH7354K', 'AAACH7354KXM002', 0, 4, 30, 'NEFT', 400000, ''),
(28, 26, 'Sulux Phosphate', 13, 0, 15, '08773953170', '', 'tobeprovided', 'tobeprovided', 0, 5, 0, 'Cheque', 0, ''),
(30, 36, 'Carlsberg India Pvt. Ltd.,', 10, 0, 14, '08020605967', ' 08020605967', 'AAJCS8454J', 'AAJCS8454J', 0, 1, 30, 'NEFT', 500000, ''),
(31, 9, 'Adani Wilmar Ltd', 10, 0, 4, '08592105419', '08592105419', 'AABCA8056G', 'AABCA8056GXM004', 0, 1, 30, 'NEFT', 100000, ''),
(32, 26, 'Crown Colour Chem', 13, 0, 10, '08663951048', '', 'tobeprovided', 'tobeprovided', 0, 5, 0, 'Cheque', 0, ''),
(33, 19, 'J K White Cement ', 20, 1, 2, '08841152305', '', 'AABCJ0355R', 'AABCJ0355RXM004', 0, 4, 30, 'Cheque', 100000, ''),
(34, 37, 'Daikin Airconditioning India Pvt. Ltd.,', 10, 0, 16, '08452105399', '08452105399', 'AABCD0971F', 'AABCD0971F', 0, 1, 30, 'NEFT', 100000, ''),
(35, 26, 'Mewar Hitech Engineering Limited', 13, 0, 17, '08614003698', '', 'AAFCM3610E', 'AAFCM3610EXM001', 0, 5, 0, 'Cheque', 0, ''),
(36, 13, 'Miraj Multicolor', 13, 0, 10, '08364780780', '', 'Aezpp6666H', 'Aezpp6666HXM001', 0, 2, 30, 'NEFT', 500000, ''),
(37, 8, 'Ultratech Cement Ltd', 14, 1, 2, ' 08832112853', '', 'AAACL6442L', 'AAACL6442LEM033', 0, 4, 30, 'NEFT', 1500000, ''),
(38, 38, 'Neyveli Lignite Corporation Limited ', 21, 1, 3, '08351305980', '', 'AAACN1121C', 'AAACN1121CEM011', 0, 4, 30, 'NEFT', 2000000, ''),
(39, 8, 'Ultratech Cement Limited ', 22, 1, 2, ' 22961302649 ', '', 'AAACL6442L', 'AAACL6442LEM029', 0, 4, 30, 'NEFT', 1500000, ''),
(40, 26, 'Jubliant Life Science', 23, 0, 14, '08178174422', '', 'AEDGP3278H', 'AEDGP3278HXM001', 0, 2, 30, 'NEFT', 100000, ''),
(41, 8, 'Ultratech Cement Ltd., ', 24, 1, 2, ' 23762701822', '', ' AAACL6442L', 'AAACL6442LEM031 ', 0, 1, 30, 'NEFT', 1500000, ''),
(42, 26, 'Golden Drugs Pvt Ltd', 13, 1, 19, '08403967099', '', 'tobeprovided', 'AAECG9048BEM001', 0, 5, 15, 'Cheque', 100000, ''),
(43, 8, 'Ambuja Cement Limited', 15, 1, 2, '08160101490', '', 'AAACG0569P', 'AAACG0569PXM008', 0, 4, 30, 'NEFT', 1500000, ''),
(44, 26, 'Choksi Heraeus Pvt. Ltd. ', 13, 0, 19, '08533901019', '', 'AABCC1753G', 'AABCC1753GXM001', 0, 5, 7, 'Cheque', 50000, ''),
(45, 26, 'Reliance Chemotex Industries Limited', 13, 0, 5, '08253904471', '', 'AABCR3739H', 'AABCR3739HXM001', 0, 5, 30, 'Cheque', 100000, ''),
(46, 26, 'Bhansali Engineering Polymers Ltd', 13, 0, 19, '08283101440', '', 'AAACB3368H', 'tobeprovided', 0, 5, 7, 'NEFT', 50000, ''),
(47, 39, 'Udaipur Cement Works Ltd.', 13, 0, 2, '08134000373', '', 'AAACU8858M', 'AAACU8858MEM001', 0, 5, 30, 'NEFT', 100000, '');

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
(2, 2, 'Aurangabad', 2, '', '', 0, 1),
(7, 6, 'M/s Honda Cars India Ltd.,\r\nSPL-1, Tapukara Industrial Area,\r\nKHUSHKHERA-301707, Distt: Alwar (Raj.)', 10, '', '', 0, 1),
(8, 7, 'M/s Ginni International Ltd.(Weaving Division)-DENIM\r\nRIICO Industrial Area \r\nNEEMRANA-301705,\r\nDistt: Alwar (Raj.)', 10, '', '', 0, 1),
(9, 8, 'NH 12 Ramganj Balaji Bundi 323001 Rajasthan', 4, '', '', 0, 1),
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
(21, 19, 'Bangur City\r\nP.O. RAS, Tehsil : Jaitaran Dist.: Pali 306107 ', 3, '', '', 0, 1),
(22, 19, 'Shree Cement Ltd., Bangur Nagar\r\nBeawer 305901 ', 3, '', '', 0, 0),
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
(58, 3, 'Adani Wilmar Ltd,\r\nSilor Road, Kota Jaipur Highway, 323001, Bundi', 4, '', '', 1, 1),
(62, 5, 'Bangur Nagar\r\nBeawer 305901 ', 3, '', '', 1, 1),
(63, 5, 'Shree Cement Ltd., Bangur Nagar\r\nBeawer 305901 ', 3, '', '', 1, 0),
(64, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 1, '', '', 1, 1),
(65, 23, 'M/s Nav Durga Services\r\n10 B Jai Shree Colony\r\nThokar Circle\r\nUdaipur 313001', 13, '', '', 1, 1),
(66, 4, 'NH 90, Atru Road, Village Kawai, Taluka Atru, Baran 325 219, Rajasthan, India', 1, '', '', 1, 1);

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
  `mobile` bigint(10) NOT NULL,
  `default_contact` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_contacts`
--

INSERT INTO `customer_contacts` (`id`, `contact_person`, `customer_id`, `designation`, `telephone`, `mobile`, `default_contact`) VALUES
(2, 'Pradeep Gupta', 2, 'purchase Executive', '9999999999', 2147483647, 1),
(7, 'Arun sharma', 6, 'Purchase Manager', '0149225056', 2147483647, 1),
(8, 'D K Jain', 7, 'GM Purchase', '0149424611', 2147483647, 1),
(9, 'Yusuf Ansari', 8, 'Purchase Executive', '7475130021', 2147483647, 1),
(10, 'Anurag jain', 9, 'AGM Purchase', '8058012345', 2147483647, 1),
(11, 'Pankaj Kumar', 10, 'Purchase Manager', '0743826158', 2147483647, 1),
(12, 'AJAY', 11, 'PURCHASE EXECUTIVE', '0294248603', 2147483647, 1),
(13, 'Vipesh Gupta', 12, 'GM - Purchase', '0745923281', 2147483647, 1),
(14, 'Sushil Dalmia', 13, 'Owner', '0141330156', 2147483647, 1),
(15, 'Anand Raju', 14, 'Purchase', '0744248000', 2147483647, 1),
(16, 'Nitin Paliwal', 15, 'Purchase Manager', '0744248099', 2147483647, 1),
(17, 'Sandeep Sharma', 16, 'Purchase Supervisor', '8696018770', 2147483647, 1),
(18, 'hemant joshi', 17, 'purchase', '9982887555', 2147483647, 1),
(19, 'hemant joshi', 18, 'purchase', '9982887555', 2147483647, 1),
(20, 'Vivek Saxena ', 19, 'Asst. purchase Manager', '6758696956', 2147483647, 1),
(21, 'PC Pareek', 20, 'Manager Purchase', '0147226547', 2147483647, 1),
(22, 'PC Pareek', 21, 'Manager Purchase', '0147226547', 2147483647, 1),
(23, 'Sushil Dalmia', 22, 'Owner', '0141233015', 2147483647, 1),
(25, 'Mr Bhawesh Pandya', 24, 'fermentation process', '7742200666', 2147483647, 1),
(26, 'Sandeep Pandya', 25, 'Purchase Executive', '0744220879', 2147483647, 1),
(27, 'Nitin Jain', 26, 'Dy Manager Purchase', '0149351231', 2147483647, 1),
(28, 'Rupesh Jain', 27, 'Asst. Purchase Manager', '0148324518', 2147483647, 1),
(29, 'Mr Nikunj Jethaliya', 28, 'G.M.', '9829041408', 2147483647, 1),
(30, 'Mr Nikunj Jethaliya', 29, 'G.M.', '9829041408', 2147483647, 1),
(31, 'Anshul Kumar', 30, 'Purchase', '9887555388', 2147483647, 1),
(32, 'Imran Ali', 31, 'Purchase', '7665006863', 2147483647, 1),
(33, 'Mr Attarwala  Ji', 32, 'owner', '9828360939', 2147483647, 1),
(34, 'Sumit Arora', 33, 'Manager Purchase', '0159123020', 2147483647, 1),
(35, 'Mukesh Sharma', 34, 'Utility', '1494671110', 2147483647, 1),
(36, 'SKS Rathore', 35, 'purchase', '9829301688', 2147483647, 1),
(37, 'Mr. Ranveer Singh', 36, 'Project Manager', '0294241841', 2147483647, 1),
(38, 'Mr. N.K Paliwal', 36, 'Account Manager', '0294241841', 2147483647, 0),
(39, 'Mr. Jayant Kumar', 36, 'Store Incharge', '0294241842', 2147483647, 0),
(40, 'Satish Sukla ', 37, 'Asst. Manager Purchase', '0147225678', 2147483647, 1),
(41, 'Stores', 38, 'DGM', '0151284757', 1512847574, 1),
(42, 'Jivan Agarwal', 39, 'Manager Purchase', '7726288217', 2147483647, 1),
(43, 'MR. PANKAJ JHA', 40, 'PURCHASE EXECUTIVE', '0222487878', 993243244, 1),
(44, 'Hari Maloo', 41, 'Manager Purchase', '0742023052', 2147483647, 1),
(45, 'Gulshan jain', 42, 'Director', '0294249041', 2147483647, 1),
(46, 'Sanjay Jain', 43, 'Asst. Manager Purchase', '9460477877', 2147483647, 1),
(47, 'Santosh sharma ', 44, 'logistics', '0294249002', 2147483647, 1),
(48, 'S.K.Verdia', 45, ' Purchase', '0294249048', 2147483647, 1),
(49, 'G.N.Raut', 46, 'mechanical', '8003193301', 2147483647, 1),
(50, 'Rahul jain', 47, 'purchase', '7728886069', 2147483647, 1),
(51, 'Sachin kanungo', 3, 'Purchase Manager', '7472446647', 2147483647, 1),
(52, 'Sachin Solanki', 3, 'Purchase Executive', '7472446647', 2147483647, 0),
(56, 'Vivek Saxena', 5, 'Asst. Manager purchase', '0908078989', 2147483647, 1),
(57, 'Satpal Marwah', 1, 'Dy. Manager', '0114502120', 9829043534, 1),
(58, 'Gopal Singh', 23, 'Director', '9799480639', 9823499887, 1),
(59, 'Sanjay Jain', 4, 'Asst Manager techno commercial', '0792578663', 2147483647, 1);

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
(39, 'J.K.Lakshmi');

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
(19, 'Drugs & Chemical');

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
(1, 'Sale'),
(2, 'Finance'),
(3, 'HR Department'),
(4, 'Purchase '),
(8, 'Store');

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
(1, 'Asst. Sales Manager'),
(2, 'Sales Executive'),
(3, 'Dy. Sales Manager'),
(4, 'Office Executive'),
(5, 'Commercial Executive');

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
(24, 'Madhyapardesh', 'Neemuch');

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
(1, 'Mohammed Arif', 'Male', 1, 1, '9649004777', 'arif@mogragroup.com', '"A" Square 3rd Floor, Shobhagpura\r\n100 Ft Road Udaipur ', '5806126b0b6e8.png'),
(2, 'Jagdish Salvi', 'Male', 1, 2, '9983247774', 'jagdish@mogragroup.com', 'Jagdish Salvi\r\nS/o Tulsi Ram Salvi\r\nH. N 77 B -Block Sector 9\r\nSavina Udaipur 313002', '580dabf8784e4.png'),
(3, 'Harshit Patel', 'Male', 1, 2, '9772404777', 'harshit@mogragroup.com', '"A" Square 3rd Floor, Shobhagpura\r\n100 Ft Road Udaipur', '580dac166a19d.png'),
(4, 'Pushpendra Chauhan', 'Male', 1, 3, '9672994770', 'pushpendra@mogragroup.com', 'T-62 Tilak Nagar Hiran Magri Sector 3 Udaipur', '580dac3905fe0.png'),
(5, 'Vijay Gohil', 'Male', 1, 2, '9772604777', 'vijay@mogragroup.com', 'B- 80 , Balicha By pass', '580dac676529b.png'),
(6, 'Jitendra Singh Jhala', 'Male', 2, 2, '9785177828', 'dispatch@mogragroup.com', '11 A, Ganpati Nagar, Near Bohra Ganesh Ji, sundarwas, Udaipur', '580daaa1c6f38.png');

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
(1, 'BE', 0, 1),
(2, 'BE', 0, 1),
(3, 'DC', 1, 1),
(4, 'BE', 2, 2),
(5, 'DC', 2, 2),
(6, 'BE', 1, 3),
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
(44, 'BE', 3, 3325),
(45, 'DC', 3, 27),
(46, 'BE', 44, 3326);

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
  `total` decimal(15,2) NOT NULL,
  `discount_type` tinyint(1) NOT NULL,
  `discount_per` decimal(4,2) NOT NULL,
  `discount` decimal(8,2) NOT NULL,
  `pnf` decimal(10,2) NOT NULL,
  `pnf_type` tinyint(1) NOT NULL,
  `pnf_per` decimal(4,2) NOT NULL,
  `total_after_pnf` decimal(14,2) NOT NULL,
  `sale_tax_per` decimal(4,2) NOT NULL,
  `sale_tax_amount` decimal(12,2) NOT NULL,
  `exceise_duty` decimal(10,2) NOT NULL,
  `ed_description` text NOT NULL,
  `fright_amount` decimal(8,2) NOT NULL,
  `fright_text` varchar(255) NOT NULL,
  `grand_total` decimal(18,2) NOT NULL,
  `date_created` date NOT NULL,
  `company_id` int(10) NOT NULL,
  `process_status` varchar(30) NOT NULL,
  `sales_order_id` int(10) NOT NULL,
  `in1` varchar(10) NOT NULL,
  `in4` varchar(10) NOT NULL,
  `in3` varchar(10) NOT NULL,
  `customer_po_no` varchar(100) NOT NULL,
  `po_date` date NOT NULL,
  `additional_note` varchar(255) NOT NULL,
  `employee_id` int(10) NOT NULL,
  `created_by` int(11) NOT NULL,
  `transporter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `customer_id`, `customer_address`, `lr_no`, `total`, `discount_type`, `discount_per`, `discount`, `pnf`, `pnf_type`, `pnf_per`, `total_after_pnf`, `sale_tax_per`, `sale_tax_amount`, `exceise_duty`, `ed_description`, `fright_amount`, `fright_text`, `grand_total`, `date_created`, `company_id`, `process_status`, `sales_order_id`, `in1`, `in4`, `in3`, `customer_po_no`, `po_date`, `additional_note`, `employee_id`, `created_by`, `transporter_id`) VALUES
(1, 3, 'Silor Road, Kota Jaipur Highway, \r\n323001, Bundi', 'lr1234', '9000100.00', 0, '0.00', '100.00', '360004.00', 1, '4.00', '9360104.00', '5.50', '514805.72', '200.00', 'SS Shaft for Johnson Pump \r\nPump Mode@ KGEN 11-3 G1\r\nSR No  @ 41013', '300.00', 'Fright FrightFright FrightFright FrightFright Fright', '9875209.72', '2016-11-06', 26, 'Pulled From Sales-Order', 9, 'SML', '16-17', 'BE-3325', 'cpono123', '2016-11-01', '', 3, 1, 7);

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
(1, 1, 66, ' Mechanical seal Complete Unit\r\nPump Model                         KGEN 11-3 G1\r\nSR No                                        141013\r\n', 2, '4500000.00', '9000000.00');

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
(37, '120x1c', 'Coper Armad', 2, 2, 2, 3, 500, 900, '450000.00', 1, 1, '', 500, 500),
(38, 'KGEN 11-3 G1', 'KGEN 11 3', 1, 3, 5, 2, 1, 10000, '10000.00', 0, 1, '', 1, 1),
(39, 'Exp ', 'Sr No', 1, 1, 1, 2, 1, 50000, '50000.00', 1, 1, '', 1, 1),
(40, 'Star Delta Panel', '40hp', 1, 1, 1, 2, 1, 40000, '40000.00', 0, 0, '', 1, 1),
(41, '3 HP / 1500 RPM BBL Motor', '3 HP / 1500 RPM Motor', 2, 12, 20, 2, 1, 10000, '10000.00', 0, 1, '', 1, 1),
(42, 'Cable Tray', '450x50x50', 1, 1, 1, 3, 100, 2, '200.00', 0, 0, '', 100, 100),
(43, 'Cable Tray', '750x75x75x2', 1, 1, 1, 3, 100, 700, '70000.00', 0, 0, '', 100, 100),
(44, 'Transformer 415/15kva', '415/15kva', 1, 1, 1, 2, 1, 100000, '100000.00', 0, 0, '', 1, 1),
(45, 'Cable', '35x3c', 1, 1, 1, 3, 1, 48, '48.00', 0, 0, '', 50, 50),
(46, 'Panel', 'Distribution', 1, 1, 1, 2, 1, 20000, '20000.00', 0, 0, '', 1, 1),
(47, 'Cable Gland', 'Cable Gland 1.25"', 1, 1, 1, 2, 1, 18, '18.00', 0, 0, '', 1, 1),
(48, 'Lugs', 'Lugs', 1, 1, 1, 2, 1, 10, '10.00', 0, 0, '', 1, 1),
(49, 'Coupling', '45', 1, 1, 1, 9, 10, 250, '2500.00', 1, 0, '', 2, 10),
(50, 'Ms Baseframe', '45', 1, 1, 1, 9, 10, 2500, '25000.00', 0, 0, '', 2, 10),
(52, 'Tushaco Pump Spare', '0', 1, 1, 1, 2, 1, 15000, '15000.00', 1, 0, '', 1, 2),
(53, 'Jointing Kit', 'Indoor Type', 1, 1, 1, 4, 1, 1500, '1500.00', 0, 0, '', 1, 1),
(54, 'Mcv 14 B 6', 'Johnson', 1, 1, 1, 8, 1, 44500, '44500.00', 0, 0, '', 2, 4),
(55, 'Tushaco Pump', '0', 1, 1, 1, 2, 1, 16000, '16000.00', 1, 0, '', 1, 2),
(56, 'WW 201', 'Darling Waste Water Pump', 1, 5, 10, 2, 5, 12500, '62500.00', 0, 1, '', 2, 6),
(57, 'Ww 101', 'Ww 101', 1, 1, 1, 2, 10, 10500, '105000.00', 0, 1, '', 5, 10),
(58, 'Motor 1 HP / 2980 RPM', 'Motor 1 Hp / 2980 Rpm', 2, 2, 2, 2, 12, 5000, '60000.00', 0, 1, '', 3, 8),
(59, 'Cn 40 200 G1 S2 L3  With 2 Hp Motor', 'Cn 40 200', 1, 1, 1, 2, 9, 20000, '180000.00', 0, 1, '', 5, 10),
(60, 'CCR 25 160 R6m2l3', 'Centrifugal Pump', 1, 1, 1, 2, 2, 25000, '50000.00', 0, 0, '', 2, 5),
(61, 'KGEN 11 3 G1', 'KGEN 11 3 G1', 1, 3, 5, 2, 1, 1350, '1350.00', 0, 1, '', 10, 15),
(62, 'Ccr 40 200 Bare Pump', 'Ccr Pump', 1, 1, 1, 2, 10, 45000, '450000.00', 0, 1, '', 2, 4),
(63, 'Rt10 ', 'Oil Pump', 1, 1, 1, 2, 5, 9000, '45000.00', 0, 1, '', 5, 7),
(64, 'Ccr 25 160 G1 S2 L3', 'Centrifugal Pump', 1, 1, 1, 2, 1, 30000, '30000.00', 0, 1, '', 2, 4),
(65, 'Cn 40 160 G1 S2 L3', 'Centrifugal Pump', 1, 1, 1, 2, 1, 15000, '15000.00', 0, 1, '', 2, 5),
(66, 'Mechanical Seal', 'Spares Of Fre Pump', 1, 1, 1, 2, 1, 15000, '15000.00', 0, 0, '', 0, 1),
(67, 'Impeller', 'Spares Of Fre Pump', 1, 1, 1, 2, 1, 8000, '8000.00', 0, 0, '', 0, 1),
(68, 'Wear Plate', 'Spares Of Fre Pump', 1, 1, 1, 2, 1, 5000, '5000.00', 0, 0, '', 0, 1),
(69, 'Shaft Ss', 'Spares Of Fre Pump', 1, 1, 1, 2, 1, 3000, '3000.00', 0, 0, '', 0, 1),
(70, 'Spring Washer', 'Spares Of Fre Pump', 1, 1, 1, 2, 1, 150, '150.00', 0, 0, '', 0, 1),
(71, 'Wp-05d/35', 'Sewage Pump', 1, 1, 1, 2, 1, 50000, '50000.00', 0, 0, '', 0, 1),
(72, 'Kgen 15 6 G1', 'Johnson Make Self Priming Pump', 1, 1, 1, 2, 1, 15000, '15000.00', 0, 1, '', 5, 8),
(73, 'name', 'alias', 0, 0, 0, 0, 0, 0, '0.00', 0, 0, 'source', 0, 0),
(74, 'IMPELLER', 'KGEN 15- 6', 3, 6, 3, 2, 10, 3000, '30000.00', 1, 0, '', 5, 15),
(75, 'ED-01', 'ED-01', 1, 11, 13, 1, 1, 4000, '4000.00', 1, 1, '', 2, 10),
(76, '1 HP / 1500 RPM BBL Motor', '1 HP / 1500 RPM BBL Motor', 2, 12, 20, 2, 1, 1234, '1234.00', 0, 1, '', 1, 1),
(77, 'Heat Exchanger', 'Heat Exchanger', 4, 14, 21, 2, 1, 400000, '400000.00', 0, 1, '', 1, 1),
(78, 'KGEN 25n 10', 'KGEN 25 N 10', 1, 3, 5, 2, 0, 0, '0.00', 0, 1, '', 2, 3);

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
(2, 'Motor'),
(3, 'Spares'),
(4, 'Heat Exchanger');

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
(37, 25),
(37, 26),
(38, 25),
(38, 26),
(38, 27),
(41, 25),
(41, 26),
(41, 27),
(56, 25),
(56, 27),
(58, 25),
(58, 26),
(61, 25),
(61, 26),
(61, 27),
(74, 25),
(75, 25),
(76, 25),
(76, 26),
(76, 27),
(77, 25),
(77, 26),
(77, 27),
(78, 25),
(78, 26),
(78, 27);

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
(14, 4, 'Trenter');

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
(37, 1),
(37, 2),
(38, 2),
(41, 2),
(56, 2),
(58, 1),
(58, 2),
(61, 2),
(74, 2),
(76, 2),
(77, 2),
(78, 2);

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
(21, 14, 'Shall Type');

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
(2, 1, 'mohammed', 'mohammed', 'Active'),
(4, 2, 'jagdish', 'jagdish', 'Active'),
(5, 4, 'pushpendra', 'pushpendra', 'Active'),
(6, 6, 'jitendra', 'jitendra', 'Active'),
(7, 3, 'harshit', 'harshit', 'Active'),
(8, 5, 'vijay', 'vijay', 'Active');

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
  `vendor_id` int(10) NOT NULL,
  `shipping_method` varchar(100) NOT NULL,
  `shipping_terms` int(5) NOT NULL,
  `delivery_date` date NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `terms_conditions` text NOT NULL,
  `po1` varchar(10) NOT NULL,
  `po3` varchar(10) NOT NULL,
  `po4` varchar(10) NOT NULL
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
  `processed_quantity` int(5) NOT NULL DEFAULT '0'
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
(1, 1, 'Corporate Procurement Dept.(NRM)\r\nJindal ITF Centre 28 Shivaji Marg\r\nNew Delhi', 1, 1, '2016-10-16', 'Satpal Marwah', '2147483647', 'Tender ID 22773', 'Offer against Tender/Ref ID 22773', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Warranty : For Pump or Motor : Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.\r\n', '18246.72', 'Converted Into Sales Order', 25, 'STL', 'DC-1', '16-17', 1, 2, '2016-10-16', '0000-00-00'),
(2, 24, 'Unit Udaipur\r\nUdaisagar Road MIA\r\nUdaipur-313001, Rajasthan', 2, 3, '2016-11-01', 'Mr Bhawesh Pandya', '02147483647', 'Your enquiry No. 123445 dated 21.10.2016', 'Offer for johnson make pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment : Within 30 Days Date Of Receipt Of Material.\r\n7. Price Validity : 30 Days\r\n', '30148.00', 'Pending', 26, 'SML', 'BE-3321', '16-17', 1, 2, '2016-10-24', '0000-00-00'),
(3, 11, 'CHETAK CIRCLE \r\nNEAR GPO\r\nUDAIPUR', 2, 2, '2016-10-28', 'AJAY', '2147483647', 'Enquiry for 1 HP Motor', 'Offer for Motor', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis : Ex Our Works, Udaipur, Freight Extra as actual \r\n2. Excise Duty  : Extra @ 12.5%\r\n3. Sales Tax : Extra @ 14.5%\r\n4. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n5. Payment : 10% advance balance agaisnt PI before dispatch.\r\n6. Price Validity : 30 Days\r\n', '8900.00', 'Pending', 25, 'STL', 'BE-3', '16-17', 1, 2, '2016-10-22', '0000-00-00'),
(4, 23, 'M/s Nav Durga Services\r\n10 B Jai Shree Colony\r\nThokar Circle\r\nUdaipur 313001', 3, 11, '2016-10-22', 'Gopal Singh', '9829056432', 'Verbal Enquiry dated 22.10.2016', 'BE 3066 - Quote for Positive Dosing Pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'We supply to HZL and many other companies.', '1. Price Basis : Ex Our Works, Udaipur\r\n2. Sales Tax : 14.5% Vat Or As Applicable On The Date Of Dispatch\r\n3. Delivery : Ready Stock.\r\n4. Payment : 100 % Advance\r\n5. Warranty : For Pump or Motor : Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.\r\n', '4256780.00', 'Pending', 25, 'STL', 'DC-14', '16-17', 1, 1, '2016-10-22', '2016-10-25'),
(5, 5, 'Bangur Nagar\r\nBeawer 305901 ', 4, 3, '2016-11-26', 'Vivek Saxena', '2147483647', 'Your enquiry No. 506790 dated 22.10.2016', 'Quotation for pump and spares for Johnson Pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'We are regularly supplying to all your units and you may place repeat order as per last PO no. 123765 dated 10.10.2015', '1. Price Basis : Ex Our Works, Udaipur\r\n2. Discount : 20 % as per agreed terms\r\n3. P & F : 2% On Basic Order Value\r\n4. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n5. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n6. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n7. Payment : Within 30 Days Date Of Receipt Of Material.\r\n8. Price Validity : 30 Days\r\n9. Warranty : For Pump or Motor : Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.\r\n', '125922.50', 'Converted Into Sales Order', 25, 'STL', 'BE-2992', '16-17', 1, 1, '2016-10-24', '2016-11-02'),
(6, 6, 'M/s Honda Cars India Ltd.,\r\nSPL-1, Tapukara Industrial Area,\r\nKHUSHKHERA-301707, Distt: Alwar (Raj.)', 1, 3, '2016-10-31', 'Arun sharma', '2147483647', 'enq no.  1567 dated 22.10.2016', 'quote for Johnson spares', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment : Within 30 Days Date Of Receipt Of Material.\r\n7. Price Validity : 30 Days\r\n', '1345.00', 'Pending', 27, 'FMSL', 'DC-17', '16-17', 1, 2, '2016-10-24', '0000-00-00'),
(7, 23, 'M/s Nav Durga Services\r\n10 B Jai Shree Colony\r\nThokar Circle\r\nUdaipur 313001', 1, 3, '2016-10-31', 'Gopal Singh', '9823499887', 'Your email enquiry for pump', 'Quotation for Johnson pump', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n', '4500.00', 'Pending', 25, 'STL', 'DC-14', '16-17', 1, 0, '2016-10-25', '0000-00-00'),
(8, 8, 'NH 12 Ramganj Balaji Bundi 323001 Rajasthan', 3, 3, '2016-10-29', 'Yusuf Ansari', '2147483647', 'Your email enquiry dated 25.10.2016', 'Quote for Johnson Pump ', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'Scope of supply : Pump with REMI / BBL Std. TEFC  Motor,  Lovejoy Coupling, Coupling guard duly assembled on Base frame\r\n', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n4. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n5. Payment : Within 30 Days Date Of Receipt Of Material.\r\n6. Price Validity : 30 Days\r\n7. Freight & Insurance : In Buyers account\r\n8. Warranty : For Pump or Motor : Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.\r\n', '14100.00', 'Pending', 25, 'STL', 'DC-8', '16-17', 3, 3, '2016-10-25', '2016-10-25'),
(9, 3, 'Adani Wilmar Ltd,\r\nSilor Road, Kota Jaipur Highway, 323001, Bundi', 2, 3, '2016-11-08', 'Sachin kanungo', '2147483647', 'QRF NO 251016', 'Offer against RFQ No 251016 ', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'Note:-This pump already supply by us in last year against your purchase order no 160315.', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment : Within 30 Days Date Of Receipt Of Material.\r\n7. Price Validity : 30 Days\r\n8. Freight & Insurance : In Buyers account\r\n9. Warranty : For Pump or Motor : Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.\r\n10. Discount : As Agreed ......\r\n', '17500.00', 'Pending', 25, 'STL', 'DC-5', '16-17', 2, 0, '2016-10-25', '0000-00-00'),
(10, 12, 'Mangalam Cement Ltd, Aditya Nagar, Morak 326520, District Kota', 3, 6, '2016-10-29', 'Vipesh Gupta', '2147483647', 'Email enquiry dated 25.10.2016', 'Quote for Johnson Spares', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment : Within 30 Days Date Of Receipt Of Material.\r\n7. Price Validity : 30 Days\r\n', '19150.00', 'Converted Into Sales Order', 25, 'STL', 'DC-10', '16-17', 3, 3, '2016-10-25', '2016-10-25'),
(11, 18, 'Cuarzo\r\nVillage Thoor\r\nUdaipur Rajasthan', 5, 1, '2016-10-31', 'hemant joshi', '2147483647', 'As per your verbal enquiry dt: 15/10/2016', 'Offer for trolley mounted diesel unloading unit ', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'We have already supplied this type of unit to AAAA, BBBB, CCCC, DDDD etc.\r\n\r\nFor any clarification you may call or write back to us. ', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n5. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment : Within 30 Days Date Of Receipt Of Material.\r\n7. Price Validity : 30 Days\r\n', '36000.00', 'Pending', 25, 'STL', 'DC-23', '16-17', 5, 0, '2016-10-25', '0000-00-00'),
(12, 3, 'Silor Road, Kota Jaipur Highway, \r\n323001, Bundi', 2, 6, '2016-11-17', 'Sachin kanungo', '98340987', 'RFQ 251016 mail on dated 25.10.16', 'RFQ 251016 mail on dated 25.10.16', 'With reference to above enquiry we are pleased to submit our quote as follows :-', '', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Excise Duty  : Extra If Applicable On The Time Of Dispatch\r\n4. Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch\r\n', '18028000.00', 'Converted Into Sales Order', 26, 'SML', 'DC-5', '16-17', 2, 1, '2016-10-25', '2016-11-01'),
(13, 19, 'Bangur City\r\nP.O. RAS, Tehsil : Jaitaran Dist.: Pali 306107 ', 2, 14, '2016-10-31', 'Vivek Saxena ', '2147483647', 'Tender ID 22948 Dated 24.10.16', 'Offer against Tender 22948 ', 'With reference to above enquiry we are pleased to submit our quote as follows :-', 'Heat Exchanger as per given Drawing   NO S4-A3-CM-M-244', '1. Price Basis : Ex Our Works, Udaipur\r\n2. P&F : 2% On Basic Order Value\r\n3. Excise Duty  : Extra @ 12.5% against modvate Invoice to avail EDGP Benefit.\r\n4. Sales Tax : Extra Vat @ 5.5% against Vat Deceleration form Other wise Vat @ 14.5%\r\n5. Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.\r\n6. Payment : Within 30 Days Date Of Receipt Of Material.\r\n7. Price Validity : 30 Days\r\n8. Freight & Insurance : In Buyers account\r\n9. Warranty :  Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. \r\n10. Discount : Price Are Net.\r\n', '186000.00', 'Converted Into Sales Order', 25, 'STL', 'DC-26', '16-17', 2, 0, '2016-10-26', '0000-00-00');

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
(1, 1, 37, 'HT Cable 35X3C Al Armad', 2, '36.36', '72.72'),
(2, 1, 40, 'HT Cable 35X3C Al Armad', 4, '4543.50', '18174.00'),
(3, 2, 38, 'Johnson make end suction pump', 2, '15074.00', '30148.00'),
(4, 3, 58, 'Make Remi', 1, '8900.00', '8900.00'),
(5, 4, 75, 'Item Description    : Electronic Diaphragm Dosing Pump\r\nModel                           : ED 01\r\nCapacity                     : 4 to 0 LPH\r\nPressure                    : 0 to 4 kg/cm2\r\nSuc*Dis                       : ¼” * ¼”\r\nMOC                           : Liquid end: PP\r\nDiaphragm              : PP\r\nNRV                            : PP\r\nDrive                          : Single phase 230 V, 50 hz', 1, '4256780.00', '4256780.00'),
(6, 5, 54, 'Bare Pump MCV Pump  \r\nFlow 10 m3/hr    Head 10 Mtrs   \r\nSG / Ph / Temp : Ambient', 2, '39560.50', '79121.00'),
(7, 5, 67, 'Impeller for MCV 14b 6', 3, '15600.50', '46801.50'),
(8, 6, 41, 'Motor three phase', 1, '1345.00', '1345.00'),
(9, 7, 38, 'Item Description    : Electronic Diaphragm Dosing Pump\r\nModel                           : ED 01\r\nCapacity                     : 4 to 0 LPH\r\nPressure                    : 0 to 4 kg/cm2\r\nSuc*Dis                       : ¼” * ¼”\r\nMOC                           : Liquid end: PP\r\nDiaphragm              : PP\r\nNRV                            : PP\r\nDrive                          : Single phase 230 V, 50 hz', 1, '4500.00', '4500.00'),
(10, 8, 38, 'Make	Johnson\r\nModel 	KGEN 11-3 G1 (Self priming pump)\r\nApplication	Transfer\r\nHead	15 mtr\r\nFlow	3 m3/hr\r\nLiquid	Waste water\r\nPH /SG / Temp	7/1/ambient\r\nPower : Motor HP / RPM  	1 HP / 2900 RPM\r\nSuc*Dis (inch)	1 1/4" * 1 1/4"\r\nSolid Handling	7.5 mm\r\nTemperature	Ambient\r\nSealing	Mechanical Seal\r\nMOC - Casing /Impeller	CI/ CI - Halfopen\r\n', 1, '14100.00', '14100.00'),
(11, 9, 38, 'Pump Model                      : KGEN 11-3 G1\r\nHead                                      :13 Meter\r\nCapacity                              :6 M3/hr\r\nPower                                   ; .5KW\r\nSolid Handling                 :30mm\r\nDischarge                          :50MM\r\n', 1, '17500.00', '17500.00'),
(12, 10, 67, 'CN 25 160 - Impeller', 5, '2150.00', '10750.00'),
(13, 10, 69, 'CCR 50 250 - Shaft', 2, '4200.00', '8400.00'),
(14, 11, 63, 'Trolley Mounted Unit, \r\nPump Model      :  Tushaco Make RT 10 \r\nMotor                  :  BBL Make 1 HP/ 2900 RPM\r\nApplication        :  Diesel transfer\r\n\r\nPump with motor , coupling , CG, Filter- 1/2 inch duly assembled on MS trolley.\r\n\r\n', 1, '36000.00', '36000.00'),
(15, 12, 66, ' Mechanical seal Complete Unit\r\nPump Model                         KGEN 11-3 G1\r\nSR No                                        141013\r\n', 4, '4500000.00', '18000000.00'),
(16, 12, 69, 'SS Shaft for Johnson Pump \r\nPump Model                         KGEN 11-3 G1\r\nSR No                                        141013', 4, '7000.00', '28000.00'),
(17, 13, 77, 'HEAT EXCHANGER COMPLETE WITH END COVER COPPER TUBE-12 MM OD THICKNESS-20 SWG LENGTH-1030 MM QTY-242 BAFFLES-M.S. 20 MM THICK PLATE-M.S. OUTERBODY FABRICATED \r\nMake Trenter\r\n', 4, '46500.00', '186000.00');

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
  `discount` decimal(8,2) NOT NULL,
  `ed_description` text NOT NULL,
  `exceise_duty` decimal(10,2) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `pnf_type` tinyint(1) NOT NULL,
  `pnf_per` decimal(4,2) NOT NULL,
  `pnf` decimal(10,2) NOT NULL,
  `total_after_pnf` decimal(15,2) NOT NULL,
  `fright_text` text NOT NULL,
  `fright_amount` decimal(10,2) NOT NULL,
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

INSERT INTO `sales_orders` (`id`, `customer_id`, `employee_id`, `customer_address`, `subject`, `terms_conditions`, `discount_type`, `discount_per`, `discount`, `ed_description`, `exceise_duty`, `total`, `pnf_type`, `pnf_per`, `pnf`, `total_after_pnf`, `fright_text`, `fright_amount`, `additional_note`, `company_id`, `process_status`, `quotation_id`, `transporter_id`, `expected_delivery_date`, `delivery_description`, `documents_courier_id`, `customer_po_no`, `po_date`, `dispatch_name`, `dispatch_mobile`, `dispatch_email`, `road_permit_required`, `form49`, `so1`, `so3`, `so4`, `created_by`, `edited_by`, `created_on`, `edited_on`) VALUES
(1, 44, 5, 'Choksi Heraeus Pvt. Ltd.\r\nPost Box No. -178\r\nA 195-196, ''F'' road, MIA, Madri\r\nUdaipur- 313003', '', '', 1, '1.00', '308.01', 'Excise duty text', '10.00', '30503.49', 1, '2.00', '610.07', '31113.55', 'Fright Amount text', '100.00', '', 27, 'New', NULL, 4, '2016-11-09', 'safsdf sdf sdf', 8, 'cpono123', '2016-11-04', 'Sdf Sdf', ' 2435235 3', 'cfhdf@werert.dryer', 'Yes', 'Yes', 'FMSL', 'BE-3326', '16-17', 1, 0, '2016-11-07', '1970-01-01');

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
(1, 1, 41, 'qwer', 1, '12000.00', '12000.00', 'Yes', '14.50', '', 0),
(2, 1, 42, 'qwer', 3, '3600.50', '10801.50', 'Yes', '5.50', '', 0),
(3, 1, 77, 'qwr', 200, '40.00', '8000.00', 'No', '0.00', '', 0);

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
(1, '5.50', '5.50 % VAT or as applicable on date of dispatch'),
(2, '14.50', '14.50 % VAT or as applicable on date of dispatch'),
(3, '2.00', '2 % CST against C Form'),
(4, '0.00', 'NIL CST agst C & E1 Form');

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
(1, 'Price Basis : Ex Our Works, Udaipur'),
(2, 'P&F : 2% On Basic Order Value'),
(4, 'Excise Duty  : Extra If Applicable On The Time Of Dispatch'),
(5, 'Sales Tax : 5.5 Vat Or As Applicable On The Date Of Dispatch'),
(7, 'Delivery : Within 3 To 4 Weeks After Receipt Of Techno Commercially Clear Po.'),
(8, 'Payment : Within 30 Days Date Of Receipt Of Material.'),
(10, 'Price Validity : 30 Days'),
(13, 'Freight & Insurance : In Buyers account'),
(16, 'Warranty : For Pump or Motor : Standard as provided by manufacturer to be free from defects in both material & workmanship for a period of 12 months from date of installation or 18 months from date of supply whichever is earlier. Provided the pump is installed for pumping liquid as per instructions. We shall not be liable for any loss and or consequential damages due to breakdown of the equipment either for repair purpose or otherwise. Mechanical seal and Winding failures are not covered under warranty.  Under warranty claim material to be sent on freight paid basis to our Works / Factory for repairing on FOC basis.'),
(27, 'Discount : As Agreed ......');

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
(1, 'First Flig', 9999, 'Udaipur'),
(2, 'Singhal Tr', 9999999999, 'Ahmedabad'),
(3, 'Kota Udaipur', 2147483647, 'asa'),
(4, 'Bhati Good', 1, 'Jodhpur'),
(5, 'Love Kush', 1, 'Udaipur'),
(6, 'GATI cargo', 1, 'GATI CARGO PVT LTD\r\n'),
(7, 'Asthaa Log', 1, 'Udaipur'),
(8, 'STAR TREK', 1, 'STAR TREK LOGISTIC (SPOT ON)\r\n\r\n'),
(9, 'Authorised', 1, 'Dariba Smelter'),
(10, 'Hand Deliv', 1, 'S K Mines Dariba'),
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

CREATE TABLE `units` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `user_rights` (
  `id` int(10) NOT NULL,
  `login_id` int(10) NOT NULL,
  `page_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(89, 2, 1),
(90, 2, 2),
(91, 2, 3),
(92, 2, 4);

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
  ADD PRIMARY KEY (`item_id`,`company_id`),
  ADD KEY `company_key` (`company_id`);

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
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `company_banks`
--
ALTER TABLE `company_banks`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `company_groups`
--
ALTER TABLE `company_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `customer_contacts`
--
ALTER TABLE `customer_contacts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `customer_segs`
--
ALTER TABLE `customer_segs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `filenames`
--
ALTER TABLE `filenames`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `item_groups`
--
ALTER TABLE `item_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `item_sub_groups`
--
ALTER TABLE `item_sub_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `logins`
--
ALTER TABLE `logins`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `quotation_rows`
--
ALTER TABLE `quotation_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `sales_orders`
--
ALTER TABLE `sales_orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sales_order_rows`
--
ALTER TABLE `sales_order_rows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sale_taxes`
--
ALTER TABLE `sale_taxes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sources`
--
ALTER TABLE `sources`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `terms_conditions`
--
ALTER TABLE `terms_conditions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `transporters`
--
ALTER TABLE `transporters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `user_rights`
--
ALTER TABLE `user_rights`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
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
