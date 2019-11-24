-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2019 at 06:02 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mbc_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

CREATE TABLE `admin_details` (
  `sl_no` int(11) NOT NULL,
  `status` varchar(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `card_id` varchar(20) NOT NULL,
  `lab_id` varchar(100) NOT NULL COMMENT 'Refer labs table',
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `entered_by` varchar(100) NOT NULL,
  `entered_on` date NOT NULL,
  `remarks` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_details`
--

INSERT INTO `admin_details` (`sl_no`, `status`, `user_name`, `card_id`, `lab_id`, `from_date`, `to_date`, `entered_by`, `entered_on`, `remarks`) VALUES
(1, '', 'Admin', '1234567890', '1', '2018-11-30', '2019-01-31', 'Admin', '2018-11-30', ''),
(2, '', 'Test', '1122334455', '2', '2018-12-04', '2019-01-31', 'Admin', '2018-12-04', ''),
(3, '', 'Admin', '1234567890', '2', '2019-01-04', '2019-03-31', 'Admin', '2019-01-04', ''),
(4, '', 'Admin', '1234567890', '3', '2019-01-04', '2019-03-31', 'Admin', '2019-01-04', ''),
(5, '', 'Test', '1122334455', '1', '2019-01-04', '2020-03-31', 'Admin', '2019-01-04', ''),
(6, '', 'Kurian Thomas', '0008355083', '1', '2019-03-11', '2020-03-11', 'admin', '2019-03-11', ''),
(7, '', 'Test', '1122334455', '4', '2019-04-06', '2020-03-31', 'Admin', '2019-04-06', '');

-- --------------------------------------------------------

--
-- Table structure for table `admin_logged`
--

CREATE TABLE `admin_logged` (
  `lab` int(11) NOT NULL COMMENT 'Refer labs table',
  `id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_logged`
--

INSERT INTO `admin_logged` (`lab`, `id`) VALUES
(1, '1122334455'),
(2, '0'),
(3, '0');

-- --------------------------------------------------------

--
-- Table structure for table `entry_register`
--

CREATE TABLE `entry_register` (
  `sl_no` int(200) NOT NULL,
  `status` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `login_id` varchar(100) NOT NULL,
  `user_id` varchar(200) NOT NULL,
  `user_category` int(10) NOT NULL COMMENT '0 - Student, 1 - Staff',
  `time_in` time(6) NOT NULL,
  `lab_id` int(11) NOT NULL COMMENT '1 - Central Computing Lab, 2 - CS Lab, 3 - EC Lab',
  `system_id` varchar(200) NOT NULL,
  `exit_type` int(11) NOT NULL DEFAULT 1 COMMENT '1- self, 2- admin exit, 3 - unauthorised-exit',
  `remarks` varchar(200) NOT NULL,
  `time_out` time(6) NOT NULL,
  `in_out_log` varchar(10) NOT NULL DEFAULT 'In',
  `date_in` date NOT NULL,
  `entry_type` int(10) NOT NULL COMMENT '0- Users, 1-Admin',
  `allot_type` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entry_register`
--

INSERT INTO `entry_register` (`sl_no`, `status`, `user_name`, `login_id`, `user_id`, `user_category`, `time_in`, `lab_id`, `system_id`, `exit_type`, `remarks`, `time_out`, `in_out_log`, `date_in`, `entry_type`, `allot_type`) VALUES
(1, 0, 'Sharon P Raju', '5070', '', 0, '15:42:43.000000', 1, 'A01', 1, '', '15:52:30.000000', 'out', '2019-04-07', 0, 0),
(2, 0, 'Sharon P Raju', '5070', '', 0, '15:53:39.000000', 1, 'A02', 1, 'admin login-logout', '15:54:02.000000', 'out', '2019-04-07', 0, 0),
(3, 0, 'Test', '', '', 0, '15:53:59.000000', 1, '', 1, '', '00:00:00.000000', 'In', '2019-04-07', 1, 0),
(4, 0, 'Test', '', '', 0, '15:54:04.000000', 1, '', 1, '', '15:54:05.000000', 'out', '2019-04-07', 1, 0),
(5, 0, 'Test', '', '', 0, '15:54:11.000000', 4, '', 1, '', '00:00:00.000000', 'In', '2019-04-07', 1, 0),
(6, 0, 'Sharon P Raju', '5070', '', 0, '15:54:21.000000', 4, 'Seat NO 1', 1, '', '15:58:04.000000', 'out', '2019-04-07', 0, 1),
(7, 0, 'Sharon P Raju', '5070', '', 0, '15:58:11.000000', 4, 'Seat NO 1', 1, '', '15:58:35.000000', 'out', '2019-04-07', 0, 1),
(8, 0, 'Sharon P Raju', '5070', '', 0, '15:58:45.000000', 4, 'Seat NO 1', 1, '', '13:18:46.000000', 'out', '2019-04-07', 0, 1),
(9, 0, 'Test', '', '', 0, '13:18:04.000000', 4, '', 1, '', '00:00:00.000000', 'In', '2019-04-26', 1, 0),
(10, 0, 'Aibin Thomas Mathew', '5050', '', 0, '13:18:31.000000', 4, 'Seat No 2', 1, '', '00:00:00.000000', 'In', '2019-04-26', 0, 1),
(11, 0, 'Sharon P Raju', '5070', '', 0, '13:18:53.000000', 4, 'System 1', 1, '', '13:19:24.000000', 'out', '2019-04-26', 0, 2),
(12, 0, 'Sharon P Raju', '5070', '', 0, '13:19:33.000000', 4, 'Seat NO 1', 1, '', '13:23:48.000000', 'out', '2019-04-26', 0, 1),
(13, 0, 'Sharon P Raju', '5070', '', 0, '13:23:57.000000', 4, 'Seat NO 1', 1, '', '13:24:12.000000', 'out', '2019-04-26', 0, 1),
(14, 0, 'Sharon P Raju', '5070', '', 0, '13:24:21.000000', 4, 'Seat NO 1', 1, '', '00:00:00.000000', 'In', '2019-04-26', 0, 1),
(15, 0, 'Test', '', '', 0, '13:39:43.000000', 4, '', 1, '', '00:00:00.000000', 'In', '2019-04-26', 1, 0),
(16, 0, 'Test', '', '', 0, '13:40:00.000000', 4, '', 1, '', '00:00:00.000000', 'In', '2019-04-26', 1, 0),
(17, 0, 'Test', '', '', 0, '13:41:36.000000', 4, '', 1, '', '00:00:00.000000', 'In', '2019-04-26', 1, 0),
(18, 0, 'Test', '', '', 0, '21:28:40.000000', 1, '', 1, '', '00:00:00.000000', 'In', '2019-05-04', 1, 0),
(19, 0, 'Sharon P Raju', '5070', '', 0, '21:29:05.000000', 1, 'E09', 1, '', '21:29:40.000000', 'out', '2019-05-04', 0, 0),
(20, 0, 'Sijo John Thomas', '5075', '', 0, '21:29:28.000000', 1, 'E10', 1, '', '21:29:46.000000', 'out', '2019-05-04', 0, 0),
(21, 0, 'Test', '', '', 0, '21:30:10.000000', 1, '', 1, '', '21:30:13.000000', 'out', '2019-05-04', 1, 0),
(22, 0, 'Test', '', '', 0, '15:37:38.000000', 1, '', 1, '', '00:00:00.000000', 'In', '2019-05-22', 1, 0),
(23, 0, 'Sharon P Raju', '5070', '', 0, '15:43:21.000000', 1, 'E09', 1, '', '00:00:00.000000', 'In', '2019-05-22', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `inv_admins`
--

CREATE TABLE `inv_admins` (
  `sl_no` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `id` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `section_id` int(11) NOT NULL,
  `admin_type` int(11) NOT NULL,
  `admin_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_admins`
--

INSERT INTO `inv_admins` (`sl_no`, `name`, `id`, `password`, `section_id`, `admin_type`, `admin_status`) VALUES
(1, 'test', '1122334455', '456', 1, 2, 1),
(2, 'tester', '1234', '37693cfc748049e45d87b8c7d8b9aacd', 1, 2, 1),
(3, 'final', '4969', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', 1, 1, 2),
(4, 'Admin', 'Admin', '1a1dc91c907325c69271ddf0c944bc72', 1, 0, 1),
(5, 'Admin', 'admin', '1a1dc91c907325c69271ddf0c944bc72', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `inv_category`
--

CREATE TABLE `inv_category` (
  `sl_no` int(11) NOT NULL,
  `category_name` varchar(20) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `section_id` int(11) NOT NULL,
  `category_type` varchar(20) NOT NULL COMMENT '0-main `1-sub',
  `category_prefix` varchar(20) DEFAULT NULL COMMENT 'Parent Category (Sub Category)',
  `category_description` varchar(100) NOT NULL,
  `category_remarks` varchar(20) NOT NULL,
  `category_status` int(10) NOT NULL COMMENT '0-disable, 1-Enable',
  `reference_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_category`
--

INSERT INTO `inv_category` (`sl_no`, `category_name`, `category_id`, `section_id`, `category_type`, `category_prefix`, `category_description`, `category_remarks`, `category_status`, `reference_no`) VALUES
(1, 'test', NULL, 1, '0', NULL, 'test', 'test', 0, 1),
(2, 'test_1234', NULL, 1, '1', '1', 'test_123', 'test_123', 0, 2),
(3, 'test_1', NULL, 1, '0', NULL, 'test_1', 'test_1', 0, 3),
(4, 'test_2', 4, 1, '1', '1', 'test_2', 'test_2', 1, NULL),
(5, 'test_edited', NULL, 1, '0', NULL, 'test', 'test', 0, 5),
(6, 'test_1_edited', NULL, 1, '0', NULL, 'test_1', 'test_1', 0, 6),
(7, 'test_edited_1', NULL, 1, '0', NULL, 'test', 'test', 0, 7),
(8, 'test_1_edited_1', NULL, 1, '0', NULL, 'test_1', 'test_1', 0, 8),
(9, 'test_edited_1_2', NULL, 1, '0', NULL, 'test', 'test', 0, 9),
(10, 'test_1_edited_1_2', NULL, 1, '0', NULL, 'test_1', 'test_1', 0, 10),
(11, 'test', 1, 1, '0', NULL, 'test', 'test', 1, NULL),
(12, 'test_1', 2, 1, '0', NULL, 'test_1', 'test_1', 1, NULL),
(13, 'test_123', 13, 1, '1', '1', 'test_123', 'test_123', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inv_config`
--

CREATE TABLE `inv_config` (
  `organisation` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `location` varchar(20) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gst_in` varchar(100) NOT NULL,
  `primary_clr` varchar(10) NOT NULL,
  `secondary_clr` varchar(10) NOT NULL,
  `component_color` varchar(10) NOT NULL,
  `client_code` varchar(10) NOT NULL,
  `section_id` int(11) NOT NULL,
  `primary_warning_limit` int(11) NOT NULL,
  `final_warning_limit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_config`
--

INSERT INTO `inv_config` (`organisation`, `address`, `location`, `phone_number`, `email`, `gst_in`, `primary_clr`, `secondary_clr`, `component_color`, `client_code`, `section_id`, `primary_warning_limit`, `final_warning_limit`) VALUES
('Mar Baselios Christian College of Engineering and Technology', 'Pallikunnu Peermade Rd, Peermade, Kuttikkanam, Kerala 685531', 'Peermade', '04869 233 571', 'mbc@mbcpeermade.com', 'xxxxxxxxxxxx', '#2c3338', '#ffffff', '#ff7510', '7', 1, 5, 7);

-- --------------------------------------------------------

--
-- Table structure for table `inv_current_bill`
--

CREATE TABLE `inv_current_bill` (
  `sl_no` int(11) NOT NULL,
  `item_name` varchar(10) NOT NULL,
  `item_code` varchar(10) NOT NULL,
  `item_quantity` int(11) NOT NULL DEFAULT 1,
  `item_mrp` int(11) NOT NULL,
  `item_selling_price` int(11) NOT NULL,
  `item_discount` int(11) NOT NULL,
  `section_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inv_distribution`
--

CREATE TABLE `inv_distribution` (
  `sl_no` int(11) NOT NULL,
  `stock_no` int(11) NOT NULL,
  `dist_bill_no` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `dist_user_id` varchar(100) NOT NULL,
  `department` varchar(100) NOT NULL,
  `dist_issued_to` varchar(11) NOT NULL,
  `dist_place` varchar(11) NOT NULL,
  `dist_issued_by` varchar(100) NOT NULL,
  `dist_issued_on` date NOT NULL DEFAULT current_timestamp(),
  `dist_indent_no` int(11) NOT NULL,
  `dist_indent_date` datetime NOT NULL DEFAULT current_timestamp(),
  `dist_created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `place` varchar(20) NOT NULL,
  `remarks` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inv_distribution`
--

INSERT INTO `inv_distribution` (`sl_no`, `stock_no`, `dist_bill_no`, `section_id`, `dist_user_id`, `department`, `dist_issued_to`, `dist_place`, `dist_issued_by`, `dist_issued_on`, `dist_indent_no`, `dist_indent_date`, `dist_created_on`, `place`, `remarks`) VALUES
(233, 226, 226, 1, 'Sharon P Raju', 'CS', 'LAB', 'test', 'Admin', '2019-11-24', 226, '2019-11-24 16:04:55', '2019-11-24 16:04:55', 'test', 'test'),
(235, 228, 228, 1, 'Sharon P Raju', 'CS', 'LAB', 'test', 'Admin', '2019-11-24', 228, '2019-11-24 16:06:33', '2019-11-24 16:06:33', 'test', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `inv_history`
--

CREATE TABLE `inv_history` (
  `sl_no` int(11) NOT NULL,
  `reference_no` varchar(20) NOT NULL COMMENT 'old id of the item',
  `changed_from` varchar(20) NOT NULL,
  `changed_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_by` varchar(20) NOT NULL,
  `section_id` int(11) NOT NULL,
  `remarks` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inv_history`
--

INSERT INTO `inv_history` (`sl_no`, `reference_no`, `changed_from`, `changed_on`, `changed_by`, `section_id`, `remarks`) VALUES
(1, '1', 'inv_category', '2019-11-10 10:18:07', 'Admin', 1, 'edited'),
(2, '1', 'inv_category', '2019-11-10 10:18:07', 'Admin', 1, 'edited'),
(3, '3', 'inv_category', '2019-11-10 10:20:57', 'Admin', 1, 'edited'),
(4, '5', 'inv_category', '2019-11-10 10:24:06', 'Admin', 1, 'edited'),
(5, '5', 'inv_category', '2019-11-10 10:24:06', 'Admin', 1, 'edited'),
(6, '6', 'inv_category', '2019-11-10 10:25:45', 'Admin', 1, 'edited'),
(7, '7', 'inv_category', '2019-11-10 10:26:23', 'Admin', 1, 'edited'),
(8, '8', 'inv_category', '2019-11-10 10:27:20', 'Admin', 1, 'edited'),
(9, '9', 'inv_category', '2019-11-10 10:28:29', 'Admin', 1, 'edited'),
(10, '10', 'inv_category', '2019-11-10 10:28:46', 'Admin', 1, 'edited'),
(11, '2', 'inv_category', '2019-11-10 10:32:37', 'Admin', 1, 'edited'),
(12, '', 'inv_supplier', '2019-11-10 11:04:52', 'Admin', 1, 'edited'),
(13, '', 'inv_supplier', '2019-11-10 11:07:44', 'Admin', 1, 'edited'),
(14, '', 'inv_supplier', '2019-11-10 11:08:50', 'Admin', 1, 'edited'),
(15, '6', 'inv_supplier', '2019-11-10 11:09:31', 'Admin', 1, 'edited'),
(16, '7', 'inv_supplier', '2019-11-10 11:11:11', 'Admin', 1, 'edited'),
(17, '1212345', 'inv_stock', '2019-11-10 15:52:39', 'Admin', 1, 'edited'),
(18, '1212345', 'inv_stock', '2019-11-10 15:59:01', 'Admin', 1, 'edited'),
(19, '1212345', 'inv_stock', '2019-11-10 16:00:20', 'Admin', 1, 'edited'),
(20, '1212345', 'inv_stock', '2019-11-10 16:00:46', 'Admin', 1, 'edited'),
(21, '1212345', 'inv_stock', '2019-11-10 16:02:11', 'Admin', 1, 'edited'),
(22, '1212345', 'inv_stock', '2019-11-10 16:03:02', 'Admin', 1, 'edited'),
(23, '10', 'inv_stock', '2019-11-10 16:04:29', 'Admin', 1, 'edited'),
(24, '21', 'inv_stock', '2019-11-10 16:07:13', 'Admin', 1, 'edited'),
(25, '21', 'inv_stock', '2019-11-10 16:07:39', 'Admin', 1, 'edited'),
(26, '12', 'inv_stock', '2019-11-10 16:10:18', 'Admin', 1, 'edited'),
(27, '12', 'inv_stock', '2019-11-10 16:10:38', 'Admin', 1, 'deleted'),
(28, '1234', 'inv_stock', '2019-11-10 16:12:32', 'Admin', 1, 'edited'),
(29, '1234', 'inv_stock', '2019-11-10 16:13:15', 'Admin', 1, 'deleted'),
(30, '2111', 'inv_stock', '2019-11-10 16:13:52', 'Admin', 1, 'edited'),
(31, '12113', 'inv_stock', '2019-11-10 16:37:09', 'Admin', 1, 'edited'),
(32, '12113', 'inv_stock', '2019-11-10 16:38:43', 'Admin', 1, 'edited'),
(33, '2414124', 'inv_stock', '2019-11-10 16:39:49', 'Admin', 1, 'edited'),
(34, '2414124', 'inv_stock', '2019-11-10 16:40:44', 'Admin', 1, 'edited'),
(35, '12113', 'inv_stock', '2019-11-10 16:49:58', 'Admin', 1, 'edited'),
(36, '12113', 'inv_stock', '2019-11-10 16:52:28', 'Admin', 1, 'edited'),
(37, '2414124', 'inv_stock', '2019-11-10 16:54:45', 'Admin', 1, 'edited'),
(38, '2414124', 'inv_stock', '2019-11-10 16:55:22', 'Admin', 1, 'edited'),
(39, '2414124', 'inv_stock', '2019-11-10 16:55:37', 'Admin', 1, 'edited'),
(40, '2414124', 'inv_stock', '2019-11-10 16:57:02', 'Admin', 1, 'edited'),
(41, '12113', 'inv_stock', '2019-11-10 17:25:16', 'Admin', 1, 'edited'),
(42, '12113', 'inv_stock', '2019-11-10 17:27:39', 'Admin', 1, 'edited'),
(43, '12113', 'inv_stock', '2019-11-10 17:29:12', 'Admin', 1, 'edited'),
(44, '2414124', 'inv_stock', '2019-11-10 17:45:10', 'Admin', 1, 'edited'),
(45, '12113', 'inv_stock', '2019-11-10 17:49:54', 'Admin', 1, 'edited'),
(46, '2414124', 'inv_stock', '2019-11-10 17:50:11', 'Admin', 1, 'edited'),
(47, '2414124', 'inv_stock', '2019-11-10 17:52:28', 'Admin', 1, 'edited'),
(48, '2414124', 'inv_stock', '2019-11-10 17:52:51', 'Admin', 1, 'edited'),
(49, '2414124', 'inv_stock', '2019-11-10 17:54:49', 'Admin', 1, 'edited'),
(50, '2414124', 'inv_stock', '2019-11-10 17:56:33', 'Admin', 1, 'edited'),
(51, '2414124', 'inv_stock', '2019-11-10 17:57:49', 'Admin', 1, 'edited'),
(52, '2414124', 'inv_stock', '2019-11-10 17:58:09', 'Admin', 1, 'edited'),
(53, '2414124', 'inv_stock', '2019-11-10 17:58:43', 'Admin', 1, 'edited'),
(54, '12113', 'inv_stock', '2019-11-10 18:11:01', 'Admin', 1, 'edited'),
(55, '2414124', 'inv_stock', '2019-11-10 18:18:43', 'Admin', 1, 'edited'),
(56, '12113', 'inv_stock', '2019-11-10 18:20:42', 'Admin', 1, 'edited'),
(57, '12113', 'inv_stock', '2019-11-10 18:21:55', 'Admin', 1, 'edited'),
(58, '12113', 'inv_stock', '2019-11-10 18:22:27', 'Admin', 1, 'edited'),
(59, '12113', 'inv_stock', '2019-11-10 18:23:32', 'Admin', 1, 'edited'),
(60, '12113', 'inv_stock', '2019-11-10 18:30:23', 'Admin', 1, 'edited'),
(61, '12113', 'inv_stock', '2019-11-10 18:31:04', 'Admin', 1, 'edited'),
(62, '2414124', 'inv_stock', '2019-11-10 18:33:59', 'Admin', 1, 'edited'),
(63, '2414124', 'inv_stock', '2019-11-10 18:36:24', 'Admin', 1, 'deleted'),
(64, '1234567890', 'inv_stock', '2019-11-10 18:38:59', 'Admin', 1, 'edited'),
(65, '8', 'inv_supplier', '2019-11-10 18:56:14', 'Admin', 1, 'deleted'),
(66, '12113', 'inv_stock', '2019-11-10 20:28:47', 'Admin', 1, 'edited'),
(67, '1234567890', 'inv_stock', '2019-11-10 20:29:18', 'Admin', 1, 'edited'),
(68, '1234', 'inv_stock', '2019-11-17 11:35:38', 'Admin', 1, 'edited'),
(69, '10', 'inv_stock', '2019-11-21 20:17:03', 'Admin', 1, 'deleted'),
(70, '10123', 'inv_stock', '2019-11-21 20:17:06', 'Admin', 1, 'deleted'),
(71, '100', 'inv_stock', '2019-11-21 20:17:09', 'Admin', 1, 'deleted'),
(72, '10010', 'inv_stock', '2019-11-21 20:17:11', 'Admin', 1, 'deleted'),
(73, 'test', 'inv_stock', '2019-11-21 21:05:21', 'Admin', 1, 'edited'),
(74, '1234', 'inv_stock', '2019-11-22 15:25:22', 'Admin', 1, 'edited'),
(75, '12345', 'inv_stock', '2019-11-22 15:25:36', 'Admin', 1, 'edited'),
(76, '10', 'inv_stock', '2019-11-22 15:25:57', 'Admin', 1, 'edited'),
(77, '1234', 'inv_stock', '2019-11-22 16:30:51', 'Admin', 1, 'deleted'),
(78, '12345', 'inv_stock', '2019-11-22 22:18:44', 'Admin', 1, 'deleted'),
(79, '48', 'inv_stock', '2019-11-22 22:18:45', 'Admin', 1, 'deleted'),
(80, '1010', 'inv_stock', '2019-11-22 22:18:45', 'Admin', 1, 'deleted'),
(81, '1010101010', 'inv_stock', '2019-11-22 22:18:45', 'Admin', 1, 'deleted'),
(82, '51', 'inv_stock', '2019-11-22 22:18:46', 'Admin', 1, 'deleted'),
(83, '52', 'inv_stock', '2019-11-22 22:18:49', 'Admin', 1, 'deleted');

-- --------------------------------------------------------

--
-- Table structure for table `inv_items`
--

CREATE TABLE `inv_items` (
  `sl_no` int(11) NOT NULL,
  `Item_name` varchar(100) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_alert1` int(11) DEFAULT NULL,
  `item_alert2` int(11) DEFAULT NULL,
  `max_expected` int(11) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `added_by` varchar(100) NOT NULL,
  `section_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `reference_no` int(11) DEFAULT NULL,
  `remarks` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_items`
--

INSERT INTO `inv_items` (`sl_no`, `Item_name`, `item_id`, `item_alert1`, `item_alert2`, `max_expected`, `added_on`, `added_by`, `section_id`, `status`, `reference_no`, `remarks`) VALUES
(1, 'test', 1, 100, 10, 100, '2019-11-10 20:29:18', 'Admin', 1, 1, NULL, 'Test'),
(2, 'Pen', 2, 100, 10, 100, '2019-11-10 20:28:47', 'Admin', 1, 1, NULL, 'Pen'),
(3, 'test555', 3, 5, 2, 0, '2019-11-20 06:09:09', 'Admin', 1, 1, NULL, 'test555'),
(4, 'apple', 4, 5, 2, 0, '2019-11-21 17:59:27', 'Admin', 1, 1, NULL, ''),
(5, 'abcd', 5, 10, 5, 0, '2019-11-21 18:54:07', 'Admin', 1, 1, NULL, ''),
(6, 'test_1', 6, 10, 5, 100, '2019-11-21 19:52:13', 'Admin', 1, 1, NULL, ''),
(7, 'item', 7, 100, 10, 100, '2019-11-21 20:09:56', 'Admin', 1, 1, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `inv_purchase_log`
--

CREATE TABLE `inv_purchase_log` (
  `sl_no` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `supplier` varchar(100) NOT NULL,
  `total_cost` int(11) NOT NULL,
  `total_tax` int(11) NOT NULL,
  `remarks` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inv_purchase_log`
--

INSERT INTO `inv_purchase_log` (`sl_no`, `invoice_no`, `section_id`, `date`, `supplier`, `total_cost`, `total_tax`, `remarks`) VALUES
(1, 12113, 1, '2019-11-17 12:13:17', 'test', 100, 10, 'test'),
(3, 123131, 1, '2019-11-21 18:38:49', 'test', 0, 0, ''),
(7, 1231312131, 1, '2019-11-21 18:49:36', 'test', 10, 0, ''),
(8, 54654, 1, '2019-11-21 18:50:44', 'test', 10, 0, ''),
(9, 5465487, 1, '2019-11-21 18:51:50', 'test', 10, 0, ''),
(10, 1231434, 1, '2019-11-21 18:55:55', 'test', 10, 0, ''),
(11, 324243, 1, '2019-11-21 19:02:29', 'test', 0, 0, ''),
(12, 324232, 1, '2019-11-21 19:02:52', 'test', 0, 0, ''),
(15, 324257, 1, '2019-11-21 19:07:17', 'test', 100, 100, '100'),
(16, 324207, 1, '2019-11-21 19:53:10', 'test', 100, 100, '100'),
(17, 324217, 1, '2019-11-21 20:11:59', 'test', 100, 100, '100'),
(18, 12345, 1, '2019-11-21 20:12:23', 'test', 100, 100, '100'),
(19, 1211345, 1, '2019-11-22 16:37:34', 'test', 100, 10, 'test'),
(20, 1231313, 1, '2019-11-22 22:19:56', 'test', 0, 0, ''),
(21, 1323124, 1, '2019-11-22 22:31:46', 'test', 1323124, 1323124, '132343');

-- --------------------------------------------------------

--
-- Table structure for table `inv_sales_log`
--

CREATE TABLE `inv_sales_log` (
  `bill_no` int(11) NOT NULL,
  `item_name` varchar(20) NOT NULL,
  `item_code` int(11) NOT NULL,
  `client_id` varchar(20) NOT NULL,
  `section_id` int(11) NOT NULL,
  `total_units` int(11) NOT NULL,
  `unit_price` float NOT NULL,
  `unit_mrp` float NOT NULL,
  `total_cost` float NOT NULL,
  `date_time_log` datetime NOT NULL DEFAULT current_timestamp(),
  `admin_id` varchar(20) NOT NULL,
  `conformation` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_sales_log`
--

INSERT INTO `inv_sales_log` (`bill_no`, `item_name`, `item_code`, `client_id`, `section_id`, `total_units`, `unit_price`, `unit_mrp`, `total_cost`, `date_time_log`, `admin_id`, `conformation`) VALUES
(1, '1234', 21, '', 1, 1, 2112, 21, 2112, '2019-11-10 21:49:27', 'Admin', 0),
(2, 'pen', 2111, '', 1, 1, 21, 2121, 21, '2019-11-10 21:49:27', 'Admin', 0),
(3, 'test', 1234567890, '', 1, 1, 10, 10, 10, '2019-11-11 00:25:29', 'Admin', 0),
(4, 'Pen', 1234, '', 1, 1000, 12113, 12113, 12113000, '2019-11-17 13:16:31', 'Admin', 0),
(5, 'Pen', 1234, '', 1, 11116, 12113, 12113, 134648000, '2019-11-17 16:09:25', 'Admin', 0),
(6, 'test', 0, '', 1, 1, 10, 10, 10, '2019-11-17 16:09:25', 'Admin', 0),
(7, '', 0, '', 1, 0, 0, 0, 0, '2019-11-17 16:15:39', 'Admin', 0),
(8, 'Pen', 1234, '', 1, 1000, 1, 12113, 1000, '2019-11-17 16:17:26', 'Admin', 0),
(9, 'Pen', 1234, '', 1, 2, 10, 10, 20, '2019-11-19 18:51:04', 'test_admin', 0),
(10, 'Pen', 1234, '', 1, 1, 10, 10, 10, '2019-11-19 18:52:34', 'test_admin', 0),
(11, '', 0, '', 1, 0, 0, 0, 0, '2019-11-19 18:53:08', 'test_admin', 0),
(12, '', 0, '', 1, 0, 0, 0, 0, '2019-11-19 18:53:42', 'test_admin', 0),
(13, '', 0, '', 1, 0, 0, 0, 0, '2019-11-19 18:56:11', 'test_admin', 0),
(14, 'Pen', 1234, '', 1, 1, 10, 10, 10, '2019-11-19 18:58:25', 'test_admin', 0),
(15, 'Pen', 1234, '', 1, 1, 10, 10, 10, '2019-11-19 19:12:08', 'Admin', 0),
(16, '', 0, '', 1, 0, 0, 0, 0, '2019-11-20 00:22:09', 'Admin', 0),
(17, '', 0, '', 1, 0, 0, 0, 0, '2019-11-20 00:23:04', 'Admin', 0),
(18, '', 0, '', 1, 0, 0, 0, 0, '2019-11-20 00:23:47', 'Admin', 0),
(19, '', 0, '', 1, 0, 0, 0, 0, '2019-11-20 00:25:11', 'Admin', 0),
(20, '', 0, '', 1, 0, 0, 0, 0, '2019-11-20 00:53:48', 'Admin', 0),
(21, 'Pen', 1234, '', 1, 1, 10, 10, 10, '2019-11-20 10:23:45', 'Admin', 0),
(22, 'test', 0, '', 1, 1, 10, 10, 10, '2019-11-20 22:14:46', 'Admin', 0),
(23, '', 0, '', 1, 0, 0, 0, 0, '2019-11-20 22:15:43', 'Admin', 0),
(24, 'test', 0, '', 1, 1, 10, 10, 10, '2019-11-20 22:17:03', 'Admin', 0),
(25, 'test', 0, '', 1, 1, 10, 10, 10, '2019-11-20 22:24:19', 'Admin', 0),
(26, 'test', 0, '', 1, 1, 10, 10, 10, '2019-11-20 22:32:31', 'Admin', 0),
(27, 'Pen', 1234, '', 1, 1, 10, 10, 10, '2019-11-22 02:19:24', 'Admin', 0),
(28, 'apple', 10, '', 1, 1, 10, 10, 10, '2019-11-22 20:54:57', 'Admin', 0),
(29, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-23 04:13:22', 'Admin', 0),
(30, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:16:03', 'Admin', 0),
(31, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:16:18', 'Admin', 0),
(32, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:16:44', 'Admin', 0),
(33, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:17:02', 'Admin', 0),
(34, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:17:27', 'Admin', 0),
(35, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:17:36', 'Admin', 0),
(36, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:17:41', 'Admin', 0),
(37, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:17:49', 'Admin', 0),
(38, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:17:57', 'Admin', 0),
(39, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:18:46', 'Admin', 0),
(40, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:19:08', 'Admin', 0),
(41, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:19:33', 'Admin', 0),
(42, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:19:43', 'Admin', 0),
(43, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:20:05', 'Admin', 0),
(44, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:20:14', 'Admin', 0),
(45, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:23:06', 'Admin', 0),
(46, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:23:41', 'Admin', 0),
(47, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:25:35', 'Admin', 0),
(48, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:25:58', 'Admin', 0),
(49, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:26:16', 'Admin', 0),
(50, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:26:26', 'Admin', 0),
(51, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:26:51', 'Admin', 0),
(52, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:27:14', 'Admin', 0),
(53, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:27:23', 'Admin', 0),
(54, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:27:39', 'Admin', 0),
(55, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:27:41', 'Admin', 0),
(56, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:27:50', 'Admin', 0),
(57, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:28:11', 'Admin', 0),
(58, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:28:23', 'Admin', 0),
(59, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:28:33', 'Admin', 0),
(60, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:28:37', 'Admin', 0),
(61, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:29:37', 'Admin', 0),
(62, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:29:54', 'Admin', 0),
(63, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:30:01', 'Admin', 0),
(64, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:30:15', 'Admin', 0),
(65, '', 0, '', 1, 0, 0, 0, 0, '2019-11-23 04:30:32', 'Admin', 0),
(66, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 11:36:02', 'Admin', 0),
(67, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 11:47:43', 'Admin', 0),
(68, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:41:47', 'Admin', 0),
(69, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:42:46', 'Admin', 0),
(70, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:45:13', 'Admin', 0),
(71, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:45:16', 'Admin', 0),
(72, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:45:25', 'Admin', 0),
(73, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:45:43', 'Admin', 0),
(74, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:46:28', 'Admin', 0),
(75, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:48:31', 'Admin', 0),
(76, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:49:10', 'Admin', 0),
(77, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:49:22', 'Admin', 0),
(78, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:49:37', 'Admin', 0),
(79, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:49:54', 'Admin', 0),
(80, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:50:35', 'Admin', 0),
(81, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:51:14', 'Admin', 0),
(82, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:51:57', 'Admin', 0),
(83, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:52:16', 'Admin', 0),
(84, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:52:29', 'Admin', 0),
(85, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:54:00', 'Admin', 0),
(86, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:55:45', 'Admin', 0),
(87, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:56:44', 'Admin', 0),
(88, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 12:56:59', 'Admin', 0),
(89, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:57:31', 'Admin', 0),
(90, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 12:57:52', 'Admin', 0),
(91, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 12:58:15', 'Admin', 0),
(92, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 12:58:26', 'Admin', 0),
(93, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 12:59:16', 'Admin', 0),
(94, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:00:51', 'Admin', 0),
(95, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:01:58', 'Admin', 0),
(96, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:02:54', 'Admin', 0),
(97, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 13:03:03', 'Admin', 0),
(98, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:04:14', 'Admin', 0),
(99, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:04:48', 'Admin', 0),
(100, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:07:55', 'Admin', 0),
(101, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:08:59', 'Admin', 0),
(102, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:09:35', 'Admin', 0),
(103, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:10:20', 'Admin', 0),
(104, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:10:44', 'Admin', 0),
(105, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:11:26', 'Admin', 0),
(106, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:11:39', 'Admin', 0),
(107, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:11:50', 'Admin', 0),
(108, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:12:01', 'Admin', 0),
(109, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:12:10', 'Admin', 0),
(110, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:12:12', 'Admin', 0),
(111, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:12:49', 'Admin', 0),
(112, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:13:15', 'Admin', 0),
(113, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:13:47', 'Admin', 0),
(114, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:15:56', 'Admin', 0),
(115, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:16:13', 'Admin', 0),
(116, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:16:25', 'Admin', 0),
(117, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:16:34', 'Admin', 0),
(118, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:17:26', 'Admin', 0),
(119, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:17:48', 'Admin', 0),
(120, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:18:11', 'Admin', 0),
(121, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:19:15', 'Admin', 0),
(122, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:20:08', 'Admin', 0),
(123, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:20:53', 'Admin', 0),
(124, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:22:48', 'Admin', 0),
(125, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:23:00', 'Admin', 0),
(126, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:23:15', 'Admin', 0),
(127, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:24:22', 'Admin', 0),
(128, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:24:58', 'Admin', 0),
(129, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:25:17', 'Admin', 0),
(130, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:25:38', 'Admin', 0),
(131, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:27:27', 'Admin', 0),
(132, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:27:45', 'Admin', 0),
(133, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:28:30', 'Admin', 0),
(134, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:28:51', 'Admin', 0),
(135, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:29:45', 'Admin', 0),
(136, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 13:30:18', 'Admin', 0),
(137, 'test', 61, '', 1, 1, 100, 100, 100, '2019-11-24 13:57:34', 'Admin', 0),
(138, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 13:58:58', 'Admin', 0),
(139, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 13:59:35', 'Admin', 0),
(140, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 14:00:01', 'Admin', 0),
(141, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:00:10', 'Admin', 0),
(142, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 14:00:46', 'Admin', 0),
(143, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:02:12', 'Admin', 0),
(144, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:02:27', 'Admin', 0),
(145, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:02:40', 'Admin', 0),
(146, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:04:11', 'Admin', 0),
(147, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:04:51', 'Admin', 0),
(148, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:05:17', 'Admin', 0),
(149, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:05:18', 'Admin', 0),
(150, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:05:38', 'Admin', 0),
(151, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:05:45', 'Admin', 0),
(152, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:09:00', 'Admin', 0),
(153, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:10:52', 'Admin', 0),
(154, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:11:07', 'Admin', 0),
(155, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:16:18', 'Admin', 0),
(156, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 14:17:21', 'Admin', 0),
(157, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 14:31:43', 'Admin', 0),
(158, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 14:33:00', 'Admin', 0),
(159, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 14:35:26', 'Admin', 0),
(160, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:36:24', 'Admin', 0),
(161, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:37:27', 'Admin', 0),
(162, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:37:29', 'Admin', 0),
(163, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:37:52', 'Admin', 0),
(164, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:38:49', 'Admin', 0),
(165, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:38:59', 'Admin', 0),
(166, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:39:15', 'Admin', 0),
(167, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:39:52', 'Admin', 0),
(168, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:40:09', 'Admin', 0),
(169, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 14:40:35', 'Admin', 0),
(170, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:42:18', 'Admin', 0),
(171, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:42:21', 'Admin', 0),
(172, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 14:42:37', 'Admin', 0),
(173, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:46:34', 'Admin', 0),
(174, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:50:22', 'Admin', 0),
(175, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:50:41', 'Admin', 0),
(176, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:51:12', 'Admin', 0),
(177, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:51:26', 'Admin', 0),
(178, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:51:34', 'Admin', 0),
(179, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:52:17', 'Admin', 0),
(180, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:52:26', 'Admin', 0),
(181, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:53:25', 'Admin', 0),
(182, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:55:40', 'Admin', 0),
(183, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:56:19', 'Admin', 0),
(184, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:56:57', 'Admin', 0),
(185, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:57:00', 'Admin', 0),
(186, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:57:51', 'Admin', 0),
(187, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 14:58:20', 'Admin', 0),
(188, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 14:59:51', 'Admin', 0),
(189, 'test', 61, '', 1, 1, 100, 100, 100, '2019-11-24 14:59:52', 'Admin', 0),
(190, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 15:00:38', 'Admin', 0),
(191, 'test', 61, '', 1, 1, 100, 100, 100, '2019-11-24 15:00:38', 'Admin', 0),
(192, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 15:05:05', 'Admin', 0),
(193, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:05:31', 'Admin', 0),
(194, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:05:33', 'Admin', 0),
(195, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:06:03', 'Admin', 0),
(196, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:06:24', 'Admin', 0),
(197, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:07:03', 'Admin', 0),
(198, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:09:20', 'Admin', 0),
(199, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:10:46', 'Admin', 0),
(200, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:11:14', 'Admin', 0),
(201, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:11:38', 'Admin', 0),
(202, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:12:02', 'Admin', 0),
(203, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:12:35', 'Admin', 0),
(204, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:13:05', 'Admin', 0),
(205, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:14:33', 'Admin', 0),
(206, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:15:27', 'Admin', 0),
(207, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:15:35', 'Admin', 0),
(208, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:15:51', 'Admin', 0),
(209, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:15:54', 'Admin', 0),
(210, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:16:33', 'Admin', 0),
(211, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:16:59', 'Admin', 0),
(212, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 15:17:16', 'Admin', 0),
(213, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:18:00', 'Admin', 0),
(214, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:18:45', 'Admin', 0),
(215, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:19:23', 'Admin', 0),
(216, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:20:13', 'Admin', 0),
(217, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:20:38', 'Admin', 0),
(218, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:21:11', 'Admin', 0),
(219, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:21:57', 'Admin', 0),
(220, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:22:20', 'Admin', 0),
(221, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:23:09', 'Admin', 0),
(222, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:23:31', 'Admin', 0),
(223, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 15:24:02', 'Admin', 0),
(224, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 15:25:34', 'Admin', 0),
(225, 'test', 61, '', 1, 1, 100, 100, 100, '2019-11-24 15:25:34', 'Admin', 0),
(226, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 16:04:55', 'Admin', 0),
(227, '', 0, '', 1, 0, 0, 0, 0, '2019-11-24 16:05:51', 'Admin', 0),
(228, 'Pen', 60, '', 1, 1, 100, 100, 100, '2019-11-24 16:06:33', 'Admin', 0);

-- --------------------------------------------------------

--
-- Table structure for table `inv_sections`
--

CREATE TABLE `inv_sections` (
  `section_name` varchar(20) NOT NULL,
  `section_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_sections`
--

INSERT INTO `inv_sections` (`section_name`, `section_id`) VALUES
('college', 1),
('store', 2);

-- --------------------------------------------------------

--
-- Table structure for table `inv_stock`
--

CREATE TABLE `inv_stock` (
  `sl_no` int(11) NOT NULL,
  `item_name` varchar(20) NOT NULL,
  `item_code` varchar(10) DEFAULT NULL,
  `category_id` varchar(10) NOT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `section_id` int(11) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp(),
  `barcode` int(11) NOT NULL,
  `total_units` int(11) NOT NULL,
  `total_cost` float NOT NULL,
  `unit` varchar(10) NOT NULL,
  `mrp` float NOT NULL,
  `selling_price` float NOT NULL,
  `tax_percent` int(11) NOT NULL,
  `item_description` varchar(100) NOT NULL,
  `priority` int(11) NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `order_no` varchar(100) NOT NULL,
  `order_date` date NOT NULL,
  `invoice_date` date NOT NULL,
  `transportation_cost` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0-disabled, 1-enabled',
  `reference_no` varchar(20) DEFAULT NULL,
  `remarks` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_stock`
--

INSERT INTO `inv_stock` (`sl_no`, `item_name`, `item_code`, `category_id`, `sub_category_id`, `section_id`, `invoice_no`, `date_updated`, `barcode`, `total_units`, `total_cost`, `unit`, `mrp`, `selling_price`, `tax_percent`, `item_description`, `priority`, `supplier`, `order_no`, `order_date`, `invoice_date`, `transportation_cost`, `status`, `reference_no`, `remarks`) VALUES
(1, 'pen', NULL, '1', 4, 1, '12113', '2019-11-10 21:57:59', 12113, 12113, 12113, '12113', 12113, 12113, 12113, '', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '12113', '12113'),
(2, 'abcd', NULL, '1', 4, 1, '12113', '2019-11-10 21:58:24', 132424, 12113, 12113, '12113', 12113, 12113, 12113, '', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '2414124', '12113'),
(3, 'penop', NULL, '1', 4, 1, '12113', '2019-11-10 22:07:09', 12113, 12113, 12113, '12113', 12113, 12113, 12113, '', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '12113', '12113'),
(4, 'penopen', NULL, '1', 4, 1, '12113', '2019-11-10 22:08:43', 12113, 12113, 12113, '12113', 12113, 12113, 12113, '', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '12113', '12113'),
(5, 'abcd1', NULL, '1', 4, 1, '12113', '2019-11-10 22:09:49', 132424, 12113, 12113, '12113', 12113, 12113, 12113, '', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '2414124', '12113'),
(6, 'abcd12', NULL, '1', 4, 1, '12113', '2019-11-10 22:10:44', 132424, 12113, 12113, '12113', 12113, 12113, 12113, '', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '2414124', '12113'),
(7, 'pen', NULL, '1', 4, 1, '12113', '2019-11-10 22:19:58', 12113, 12113, 12113, '12113', 12113, 12113, 12113, 'pen', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '12113', '12113'),
(8, 'pen', NULL, '1', 4, 1, '12113', '2019-11-10 22:22:27', 12113, 12113, 12113, '12113', 12113, 12113, 12113, 'pen', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '12113', '12113'),
(9, 'abcd', NULL, '1', 4, 1, '12113', '2019-11-10 22:24:45', 132424, 12113, 12113, '12113', 12113, 12113, 12113, 'abcd', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '2414124', '12113'),
(10, 'abcd', NULL, '1', 4, 1, '12113', '2019-11-10 22:25:22', 132424, 12113, 12113, '12113', 12113, 12113, 12113, 'abcd', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '2414124', '12113'),
(11, 'abcd', NULL, '1', 4, 1, '12113', '2019-11-10 22:25:37', 132424, 12113, 12113, '12113', 12113, 12113, 12113, 'abcd', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '2414124', '12113'),
(12, 'abcd', NULL, '2', 4, 1, '12113', '2019-11-10 22:27:02', 100, 100, 100, '100', 100, 100, 100, 'abcd', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '2414124', '100'),
(13, 'pen1', NULL, '1', 4, 1, '12113', '2019-11-10 22:55:16', 12113, 12113, 12113, '12113', 12113, 12113, 12113, 'pen1', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '12113', '12113'),
(14, 'pen1', NULL, '1', 4, 1, '12113', '2019-11-10 22:57:39', 12113, 12113, 12113, '12113', 12113, 12113, 12113, 'pen1', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '12113', '12113'),
(15, 'pen1', NULL, '1', 4, 1, '12113', '2019-11-10 22:59:12', 12113, 12113, 12113, '12113', 12113, 12113, 12113, 'pen001', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '12113', '12113'),
(16, 'abcd', NULL, '1', 4, 1, '12113', '2019-11-10 23:15:10', 100, 100, 100, '100', 100, 100, 100, 'abcd', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '2414124', '100'),
(17, 'pen1', NULL, '1', 4, 1, '12113', '2019-11-10 23:19:54', 12113, 12113, 12113, '12113', 12113, 12113, 12113, 'pen001', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '12113', '12113'),
(18, 'abcd', NULL, '1', 4, 1, '12113', '2019-11-10 23:20:11', 100, 100, 100, '100', 100, 100, 100, 'abcd', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '2414124', '100'),
(19, 'abcd', NULL, '1', 4, 1, '12113', '2019-11-10 23:22:28', 100, 100, 100, '100', 100, 100, 100, 'abcd', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '2414124', '100'),
(20, 'abcd', NULL, '1', 4, 1, '12113', '2019-11-10 23:22:51', 100, 100, 100, '100', 100, 100, 100, 'abcd', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '2414124', '100'),
(21, 'abcd', NULL, '1', 4, 1, '12113', '2019-11-10 23:24:49', 100, 100, 100, '100', 100, 100, 100, 'abcd', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '2414124', '100'),
(22, 'abcd', NULL, '1', 4, 1, '12113', '2019-11-10 23:26:33', 100, 100, 100, '100', 100, 100, 100, 'abcd', 0, 'test1', '12113', '2019-11-20', '2019-11-15', 12113, 0, '2414124', '100'),
(23, 'abcd', NULL, '1', 13, 1, '12113', '2019-11-10 23:27:49', 100, 100, 100, '100', 100, 100, 100, 'abcd', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '2414124', '100'),
(24, 'abcd', NULL, '1', 13, 1, '12113', '2019-11-10 23:28:09', 100, 100, 100, '100', 100, 100, 100, 'abcd', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '2414124', '100'),
(25, 'abcd', NULL, '1', 4, 1, '12113', '2019-11-10 23:28:43', 100, 100, 100, '100', 100, 100, 100, 'abcd', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '2414124', '100'),
(26, 'pen1', NULL, '1', 4, 1, '12113', '2019-11-10 23:41:01', 12113, 12113, 12113, '12113', 12113, 12113, 12113, 'pen001', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '12113', '12113'),
(27, 'abcd', NULL, '1', 4, 1, '12113', '2019-11-10 23:48:42', 100, 100, 100, '100', 100, 100, 100, 'abcd', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '2414124', '100'),
(28, 'pen1', NULL, '1', 4, 1, '12113', '2019-11-10 23:50:42', 12113, 12113, 12113, '12113', 12113, 12113, 12113, 'pen001', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '12113', '12113'),
(29, 'pen1', NULL, '1', 4, 1, '12113', '2019-11-10 23:51:55', 12113, 12113, 12113, '12113', 12113, 12113, 12113, 'pen001', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '12113', '12113'),
(30, 'pen2', NULL, '1', 4, 1, '12113', '2019-11-10 23:52:27', 12113, 12113, 12113, '12113', 12113, 12113, 12113, 'pen001', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '12113', '12113'),
(31, 'pen', NULL, '1', 4, 1, '12113', '2019-11-10 23:53:32', 12113, 12113, 12113, '12113', 12113, 12113, 12113, 'pen002', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '12113', '12113'),
(32, 'pen2', NULL, '1', 4, 1, '12113', '2019-11-11 00:00:23', 12113, 12113, 12113, '12113', 12113, 12113, 12113, 'pen002', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '12113', '12113'),
(33, 'pen2', NULL, '1', 4, 1, '12113', '2019-11-11 00:01:04', 12113, 12113, 12113, '12113', 12113, 12113, 12113, 'pen002', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '12113', '12113'),
(34, 'test', NULL, '1', 4, 1, '12113', '2019-11-11 00:03:59', 100, 100, 100, '100', 100, 100, 100, 'test', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '2414124', '100'),
(35, 'test', NULL, '1', 4, 1, '12113', '2019-11-11 00:08:20', 1234567890, 100, 100, '10', 10, 10, 10, '', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '1234567890', 'test'),
(36, 'test', NULL, '1', 4, 1, '12113', '2019-11-11 00:08:59', 1234567890, 99, 100, '10', 10, 10, 10, 'test', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '1234567890', 'test'),
(37, 'Pen', NULL, '1', 4, 1, '12113', '2019-11-11 01:58:47', 12113, 0, 12113, '12113', 12113, 12113, 12113, 'pen', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '1234', '12113'),
(38, 'test', NULL, '1', 4, 1, '12113', '2019-11-11 01:59:18', 1234567890, 94, 100, '10', 10, 10, 10, 'test', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, 'test', 'test'),
(39, 'Pen', NULL, '1', 4, 1, '12113', '2019-11-17 17:05:38', 1234, 0, 100, '10', 10, 10, 100, 'pen', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '1234', '1234'),
(40, 'apple', NULL, '1', 4, 1, '5465487', '2019-11-22 00:08:49', 10, 70, 10, '10', 10, 10, 10, '', 0, 'test', '31231', '2019-11-20', '2019-11-15', 12313131, 0, '10', '10'),
(41, 'abcd', NULL, '1', 4, 1, '324257', '2019-11-22 00:25:55', 10, 240, 10, '10', 10, 10, 10, '', 0, 'test', '31231', '2019-11-20', '2019-11-15', 12313131, 0, '10123', '10'),
(42, 'test_1', NULL, '1', 4, 1, '324207', '2019-11-22 01:23:10', 100, 220, 100, '100', 100, 100, 100, '', 0, 'test', '31231', '2019-11-20', '2019-11-15', 12313131, 0, '100', '100'),
(43, 'item', NULL, '1', 4, 1, '12345', '2019-11-22 01:40:54', 100, 300, 100, '100', 100, 100, 100, '', 0, 'test', '31231', '2019-11-20', '2019-11-15', 12313131, 0, '10010', '100'),
(44, 'test', NULL, '1', 4, 1, '12113', '2019-11-22 02:35:21', 1234567890, 0, 100, '10', 10, 10, 10, 'test', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '12345', 'test'),
(45, 'apple', NULL, '1', 4, 1, '12113', '2019-11-22 20:53:28', 10, 0, 10, '10', 10, 10, 10, '', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '10', '10'),
(46, 'Pen', NULL, '1', 4, 1, '12113', '2019-11-22 20:55:22', 1234, 100, 100, '10', 10, 10, 100, 'pen', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '1234', '1234'),
(47, 'test', NULL, '1', 4, 1, '12113', '2019-11-22 20:55:36', 1234567890, 100, 100, '10', 10, 10, 10, 'test', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '12345', 'test'),
(48, 'apple', NULL, '1', 4, 1, '1211345', '2019-11-22 20:55:57', 10, 10, 10, '10', 10, 10, 10, '', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '48', '10'),
(49, 'Pen', NULL, '1', 4, 1, '1211345', '2019-11-22 22:07:34', 10, 0, 10, '10', 10, 10, 10, '', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '1010', '10'),
(50, 'test_1', NULL, '1', 4, 1, '1211345', '2019-11-22 22:08:38', 101010, 0, 1010, '1010', 1010, 1010, 1010, '', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '1010101010', '1010'),
(51, 'abcd', NULL, '1', 4, 1, '1211345', '2019-11-23 02:19:50', 10, 10, 10, '10', 10, 10, 10, '', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '51', '10'),
(52, 'test555', NULL, '1', 4, 1, '1211345', '2019-11-23 02:25:21', 10, 10, 10, '10', 10, 10, 10, '', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, NULL, '10'),
(53, 'test555', NULL, '1', 4, 1, '1211345', '2019-11-23 02:30:00', 10, 10, 10, 'pcs', 10, 10, 10, '', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, NULL, '10'),
(54, 'test555', NULL, '1', 4, 1, '1211345', '2019-11-23 02:32:00', 10, 10, 10, 'pcs', 10, 10, 10, '', 0, 'test', '12113', '2019-11-20', '2019-11-15', 12113, 0, '52', '10'),
(60, 'Pen', '60', '1', 4, 1, '1323124', '2019-11-23 04:01:46', 100, 100, 100, 'pcs', 100, 100, 100, '', 0, 'test', '132343', '2019-11-23', '2019-11-23', 1323124, 1, NULL, '100'),
(61, 'test', '61', '1', 4, 1, '1323124', '2019-11-23 04:04:50', 100, 96, 100, 'pcs', 100, 100, 100, '', 0, 'test', '132343', '2019-11-23', '2019-11-23', 1323124, 1, NULL, '100');

-- --------------------------------------------------------

--
-- Table structure for table `inv_stock_request`
--

CREATE TABLE `inv_stock_request` (
  `sl_no` int(11) NOT NULL,
  `item_name` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL,
  `remarks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inv_supplier`
--

CREATE TABLE `inv_supplier` (
  `sl_no` int(11) NOT NULL,
  `supplier_name` varchar(20) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `section_id` int(11) NOT NULL,
  `supplier_email` varchar(20) NOT NULL,
  `supplier_status` int(11) NOT NULL COMMENT '0-disabled, 1-enabled',
  `supplier_account_no` varchar(20) NOT NULL,
  `supplier_branch` varchar(20) NOT NULL,
  `supplier_address` varchar(20) NOT NULL,
  `supplier_contact_name` varchar(20) NOT NULL,
  `supplier_remarks` varchar(20) NOT NULL,
  `supplier_bank` varchar(20) NOT NULL,
  `supplier_ifsc_no` varchar(11) NOT NULL,
  `supplier_phone_no` varchar(11) NOT NULL,
  `supplier_mob_no` varchar(20) NOT NULL,
  `supplier_gst_no` varchar(20) NOT NULL,
  `reference_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_supplier`
--

INSERT INTO `inv_supplier` (`sl_no`, `supplier_name`, `supplier_id`, `section_id`, `supplier_email`, `supplier_status`, `supplier_account_no`, `supplier_branch`, `supplier_address`, `supplier_contact_name`, `supplier_remarks`, `supplier_bank`, `supplier_ifsc_no`, `supplier_phone_no`, `supplier_mob_no`, `supplier_gst_no`, `reference_no`) VALUES
(1, 'test', 1, 1, '1234', 1, '1234', '1234', 'test', '1234', '1234', '1234', '1234', '1234', '1234', '1234', NULL),
(2, 'test1', NULL, 1, '123', 0, '123', '123', 'test1', '123', '123', '123', '123', '123', '123', '123', 2),
(3, 'test123', NULL, 1, '12124', 0, '12124', '12124', 'test123', '12124', '12124', '12124', '12124', '12124', '12124', '12124', 0),
(4, 'test12345', NULL, 1, '121245', 0, '', '', 'test123', '12124', '12124', '', '', '', '12124', '', 0),
(5, 'test1234567', NULL, 1, '121245', 0, '', '', 'test123', '12124', '12124', '', '', '', '12124', '', 0),
(6, 'test1234567890', NULL, 1, '121245', 0, '', '', 'test123', '12124', '12124', '', '', '', '12124', '', 6),
(7, 'test12345', NULL, 1, '121245', 0, '', '', 'test123', '12124', '12124', '', '', '', '12124', '', 7),
(8, 'test1', NULL, 1, '121245', 0, '', '', 'test123', '12124', '12124', '', '', '', '12124', '', 8);

-- --------------------------------------------------------

--
-- Table structure for table `inv_type`
--

CREATE TABLE `inv_type` (
  `sl_no` int(11) NOT NULL,
  `cat_type` varchar(20) NOT NULL,
  `section` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inv_type`
--

INSERT INTO `inv_type` (`sl_no`, `cat_type`, `section`) VALUES
(1, 'LAB', 1),
(2, 'asdada', 1),
(3, 'asdsa', 1),
(4, 'iiii', 1),
(5, 'asdas', 1),
(6, 'twttw', 1),
(7, 'asdasd', 1),
(8, 'sasad', 1),
(9, 'jhhgf', 1),
(10, 'test123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `labs`
--

CREATE TABLE `labs` (
  `sl_no` int(10) NOT NULL,
  `lab_name` varchar(100) NOT NULL,
  `lab_id` int(10) NOT NULL,
  `lab_type` int(11) NOT NULL COMMENT '1- System priority labs, 2- User priority labs',
  `lab_allot_type` varchar(20) NOT NULL DEFAULT 'System No:',
  `remarks` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `labs`
--

INSERT INTO `labs` (`sl_no`, `lab_name`, `lab_id`, `lab_type`, `lab_allot_type`, `remarks`) VALUES
(1, 'Central Computing Lab', 1, 1, 'System No:', ''),
(2, 'Python Lab', 2, 2, 'System No:', ''),
(3, 'C Lab', 3, 2, 'System No:', ''),
(4, 'Library', 4, 3, 'Seat/System No:', '');

-- --------------------------------------------------------

--
-- Table structure for table `super_admin`
--

CREATE TABLE `super_admin` (
  `username` varchar(10) NOT NULL COMMENT 'Please do not change the username. It may affect the program code.',
  `card_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `super_admin`
--

INSERT INTO `super_admin` (`username`, `card_id`) VALUES
('admin', '147852369');

-- --------------------------------------------------------

--
-- Table structure for table `system_master`
--

CREATE TABLE `system_master` (
  `sl_no` int(200) NOT NULL,
  `lab_id` int(11) NOT NULL COMMENT 'Refer labs table',
  `system_number` int(11) NOT NULL,
  `system_name` varchar(200) NOT NULL,
  `allot_type` int(2) NOT NULL COMMENT '1-Seat, 2- Digital Library.',
  `status` int(200) NOT NULL DEFAULT 0 COMMENT '0 - not using, 1 - using',
  `crnt_user` varchar(100) NOT NULL DEFAULT '0' COMMENT 'Current system user',
  `working_status` int(200) NOT NULL COMMENT '0 - not working, 1 - working',
  `res_status` int(10) NOT NULL COMMENT '0 - not reserved, 1 - reserved',
  `user_category` int(11) NOT NULL COMMENT '0 - students, 1 - staffs',
  `priority` int(200) NOT NULL DEFAULT 0 COMMENT 'System with priority 1 will be allotted',
  `remarks` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_master`
--

INSERT INTO `system_master` (`sl_no`, `lab_id`, `system_number`, `system_name`, `allot_type`, `status`, `crnt_user`, `working_status`, `res_status`, `user_category`, `priority`, `remarks`) VALUES
(1, 1, 0, 'A01', 0, 0, '0', 1, 0, 0, 1, ''),
(2, 1, 0, 'A02', 0, 0, '0', 1, 0, 0, 2, ''),
(3, 1, 0, 'A03', 0, 0, '0', 1, 0, 0, 3, ''),
(4, 1, 0, 'A04', 0, 0, '0', 1, 0, 0, 4, ''),
(5, 1, 0, 'A05', 0, 0, '0', 1, 0, 0, 4, ''),
(6, 1, 0, 'A06', 0, 0, '0', 1, 0, 0, 6, ''),
(7, 1, 0, 'A07', 0, 0, '0', 1, 0, 0, 7, ''),
(8, 1, 0, 'A08', 0, 0, '0', 1, 0, 0, 7, ''),
(9, 1, 0, 'A09', 0, 0, '0', 1, 0, 0, 9, ''),
(10, 1, 0, 'A10', 0, 0, '0', 1, 1, 0, 10, ''),
(11, 1, 0, 'A11', 0, 0, '0', 1, 1, 0, 11, ''),
(12, 1, 0, 'B01', 0, 0, '0', 1, 1, 0, 12, ''),
(13, 1, 0, 'B02', 0, 0, '0', 1, 1, 0, 13, ''),
(14, 1, 0, 'B03', 0, 0, '0', 1, 1, 0, 14, ''),
(15, 1, 0, 'B04', 0, 0, '0', 1, 1, 0, 15, ''),
(16, 1, 0, 'B05', 0, 0, '0', 1, 1, 0, 16, ''),
(17, 1, 0, 'B06', 0, 0, '0', 1, 1, 0, 17, ''),
(18, 1, 0, 'B07', 0, 0, '0', 1, 1, 0, 18, ''),
(19, 1, 0, 'B08', 0, 0, '0', 1, 1, 0, 19, ''),
(20, 1, 0, 'B09', 0, 0, '0', 1, 1, 0, 20, ''),
(21, 1, 0, 'B10', 0, 0, '0', 1, 1, 0, 21, ''),
(22, 1, 0, 'B11', 0, 0, '0', 1, 1, 0, 22, ''),
(23, 1, 0, 'C01', 0, 0, '0', 1, 1, 0, 23, ''),
(24, 1, 0, 'C02', 0, 0, '0', 1, 1, 0, 24, ''),
(25, 1, 0, 'C03', 0, 0, '0', 1, 1, 0, 25, ''),
(26, 1, 0, 'C04', 0, 0, '0', 1, 1, 0, 26, ''),
(27, 1, 0, 'C05', 0, 0, '0', 1, 1, 0, 27, ''),
(28, 1, 0, 'C06', 0, 0, '0', 1, 1, 0, 28, ''),
(29, 1, 0, 'C07', 0, 0, '0', 1, 1, 0, 29, ''),
(30, 1, 0, 'C08', 0, 0, '0', 1, 1, 0, 30, ''),
(31, 1, 0, 'C09', 0, 0, '0', 1, 1, 0, 31, ''),
(32, 1, 0, 'C10', 0, 0, '0', 1, 1, 0, 32, ''),
(33, 1, 0, 'C11', 0, 0, '0', 1, 1, 0, 33, ''),
(34, 1, 0, 'D01', 0, 0, '0', 1, 1, 0, 34, ''),
(35, 1, 0, 'D02', 0, 0, '0', 1, 1, 0, 35, ''),
(36, 1, 0, 'D03', 0, 0, '0', 1, 1, 0, 36, ''),
(37, 1, 0, 'D04', 0, 0, '0', 1, 1, 0, 37, ''),
(38, 1, 0, 'D05', 0, 0, '0', 1, 1, 0, 38, ''),
(39, 1, 0, 'D06', 0, 0, '0', 1, 1, 0, 39, ''),
(40, 1, 0, 'D07', 0, 0, '0', 1, 1, 0, 40, ''),
(41, 1, 0, 'D08', 0, 0, '0', 1, 1, 0, 41, ''),
(42, 1, 0, 'D09', 0, 0, '0', 1, 1, 0, 42, ''),
(43, 1, 0, 'D10', 0, 0, '0', 1, 1, 0, 43, ''),
(44, 1, 0, 'D11', 0, 0, '0', 1, 1, 0, 44, ''),
(45, 1, 0, 'E01', 0, 0, '0', 1, 1, 0, 45, ''),
(46, 1, 0, 'E02', 0, 0, '0', 1, 1, 0, 46, ''),
(47, 1, 0, 'E03', 0, 0, '0', 1, 1, 0, 47, ''),
(48, 1, 0, 'E04', 0, 0, '0', 1, 1, 0, 48, ''),
(49, 1, 0, 'E05', 0, 0, '0', 1, 1, 0, 49, ''),
(50, 1, 0, 'E06', 0, 0, '0', 1, 1, 0, 50, ''),
(51, 1, 0, 'E07', 0, 0, '0', 1, 1, 0, 51, ''),
(52, 1, 0, 'E08', 0, 0, '0', 1, 1, 0, 52, ''),
(53, 1, 0, 'E09', 0, 1, '5070', 1, 0, 0, 53, ''),
(54, 1, 0, 'E10', 0, 0, '0', 1, 0, 0, 54, ''),
(55, 1, 0, 'E11', 0, 0, '0', 1, 0, 0, 55, ''),
(56, 1, 0, 'F01', 0, 0, '0', 1, 1, 1, 56, ''),
(57, 1, 0, 'F02', 0, 0, '0', 1, 1, 1, 57, ''),
(58, 1, 0, 'F03', 0, 0, '0', 1, 1, 1, 58, ''),
(59, 1, 0, 'F04', 0, 0, '0', 1, 1, 1, 59, ''),
(60, 1, 0, 'F05', 0, 0, '0', 1, 1, 1, 60, ''),
(61, 1, 0, 'F06', 0, 0, '0', 1, 1, 1, 61, ''),
(62, 1, 0, 'F07', 0, 0, '0', 1, 1, 1, 62, ''),
(63, 1, 0, 'F08', 0, 0, '0', 1, 1, 1, 63, ''),
(64, 1, 0, 'F09', 0, 0, '0', 1, 1, 1, 64, ''),
(65, 1, 0, 'F10', 0, 0, '0', 1, 1, 1, 65, ''),
(66, 1, 0, 'F11', 0, 0, '0', 1, 1, 1, 66, ''),
(67, 4, 0, 'Seat NO 1', 1, 1, '5070', 1, 0, 0, 1, 'seat'),
(68, 4, 0, 'Seat No 2', 1, 1, '5050', 1, 0, 0, 2, 'seat'),
(69, 4, 0, 'System 1', 2, 0, '0', 1, 0, 0, 1, 'Digital Library'),
(70, 4, 0, 'System 2', 2, 0, '0', 1, 0, 0, 2, 'Digital Library');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `sl_no` int(11) NOT NULL,
  `login_id` varchar(15) NOT NULL COMMENT 'admission number or employer id',
  `userid` varchar(20) NOT NULL,
  `card_id` varchar(20) DEFAULT NULL,
  `smart_id` varchar(20) DEFAULT '',
  `user_name` varchar(30) NOT NULL,
  `user_category` varchar(20) NOT NULL COMMENT '0 - Student, 1 - Staff',
  `sub_category` varchar(20) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `branch` varchar(20) NOT NULL,
  `user_status` varchar(20) NOT NULL COMMENT '0 - Not Working/Not Studying,    1 - Working/Studying '
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`sl_no`, `login_id`, `userid`, `card_id`, `smart_id`, `user_name`, `user_category`, `sub_category`, `semester`, `branch`, `user_status`) VALUES
(3, 'EC1003', 'EC1003', 'EC1003', '0007588754', 'Elias Janson K.', 'Staff', 'Teaching', 'Associate Professor', 'EC', 'Working'),
(5, 'EC1007', 'EC1007', 'EC1007', '0008349491', 'Amol Joy', 'Staff', 'Teaching', 'Assistant Professor', 'EC', 'Working'),
(10, 'EC1018', 'EC1018', 'EC1018', '0008349057', 'Lijosh Mathews', 'Staff', 'Teaching', 'Assistant Professor', 'EC', 'Working'),
(21, 'CS1002', 'CS1002', 'CS1002', '0015171860', 'Josmy George', 'Staff', 'Teaching', 'Assistant Professor', 'CS', 'Working'),
(25, 'CS1007', 'CS1007', 'CS1007', '0007584028', 'Annie Chacko', 'Staff', 'Teaching', 'Associate Professor', 'CS', 'Working'),
(26, 'CS1008', 'CS1008', 'CS1008', '0015165554', 'Ushus Maria Joseph', 'Staff', 'Teaching', 'Assistant Professor', 'CS', 'Working'),
(28, 'CS1010', 'CS1010', 'CS1010', '0007617411', 'Sijimol A. S.', 'Staff', 'Teaching', 'Assistant Professor', 'CS', 'Working'),
(29, 'CS1014', 'CS1014', 'CS1014', '0007610570', 'Jyolsna Mary P', 'Staff', 'Teaching', 'Assistant Professor', 'CS', 'Working'),
(33, 'CS1021', 'CS1021', 'CS1021', '0008352714', 'Pradeep P. Mathew', 'Staff', 'Teaching', 'Assistant Professor', 'CS', 'Working'),
(44, 'EE1018', 'EE1018', 'EE1018', '0007588529', 'Anoop Joy', 'Staff', 'Teaching', 'Assistant Professor', 'EE', 'Working'),
(46, 'EE1020', 'EE1020', 'EE1020', '0007588437', 'Resmara S.', 'Staff', 'Teaching', 'Assistant Professor', 'EE', 'Working'),
(47, 'EE1021', 'EE1021', 'EE1021', '0008345177', 'Fini Fathima', 'Staff', 'Teaching', 'Assistant Professor', 'EE', 'Working'),
(76, 'SH1002', 'SH1002', 'SH1002', '0007603437', 'Meera N.', 'Staff', 'Teaching', 'Assistant Professor', 'SH', 'Working'),
(77, 'SH1003', 'SH1003', 'SH1003', '0007609745', 'Prathibha Philip', 'Staff', 'Teaching', 'Assistant Professor', 'SH', 'Working'),
(78, 'SH1007', 'SH1007', 'SH1007', '0015156108', 'Rengitha M. Thomas', 'Staff', 'Teaching', 'Assistant Professor', 'SH', 'Working'),
(81, 'SH1012', 'SH1012', 'SH1012', '0015169526', 'Aleyamma Varghese', 'Staff', 'Teaching', 'Assistant Professor', 'SH', 'Working'),
(82, 'SH1013', 'SH1013', 'SH1013', '0008370925', 'Divyamol V', 'Staff', 'Teaching', 'Assistant Professor', 'SH', 'Working'),
(88, 'CS2001', 'CS2001', 'CS2001', '0008353184', 'Deepu Jacob', 'Staff', 'Non-teaching', 'System Administrator', 'CS', 'Working'),
(89, 'OF3007', 'OF3007', 'OF3007', '0008345265', 'Tinku Parakulam', 'Staff', 'Non-teaching', 'Assistant Office Man', 'OF', 'Working'),
(93, 'OF3002', 'OF3002', 'OF3002', '0008384073', 'Raji Abraham Chandy', 'Staff', 'Non-teaching', 'Assistant Office Man', 'OF', 'Working'),
(94, 'ME1028', 'ME1028', 'ME1028', '0007588442', 'Manikandan S.', 'Staff', 'Teaching', 'Assistant Professor', 'ME', 'Working'),
(96, 'OF3005', 'OF3005', 'OF3005', '0008384116', 'Biju Kuriakose', 'Staff', 'Non-teaching', 'Assistant Office Man', 'OF', 'Working'),
(97, 'OF3001', 'OF3001', 'OF3001', '0008353191', 'E.P. Varghese', 'Staff', 'Non-teaching', 'Deputy Office Manage', 'OF', 'Working'),
(100, 'EE1012', 'EE1012', 'EE1012', '0007603444', 'Sneha Priya Sebastian', 'Staff', 'Teaching', 'Assistant Professor', 'EE', 'Working'),
(103, 'EE1023', 'EE1023', 'EE1023', '0008447327', 'Tomina Thomas', 'Staff', 'Teaching', 'Assistant Professor', 'EE', 'Working'),
(104, 'EC1032', 'EC1032', 'EC1032', '0015170027', 'Anu Mary Mathew', 'Staff', 'Teaching', 'Assistant Professor', 'EC', 'Working'),
(107, 'CE1014', 'CE1014', 'CE1014', '0015172047', 'Bobeena George', 'Staff', 'Teaching', 'Assistant Professor', 'CE', 'Working'),
(108, 'EC1034', 'EC1034', 'EC1034', '0015171477', 'Tom J. Kuriakose', 'Staff', 'Teaching', 'Assistant Professor', 'EC', 'Working'),
(112, 'ME1032', 'ME1032', 'ME1032', '0008352759', 'Biju Chacko', 'Staff', 'Teaching', 'Assistant Professor', 'ME', 'Working'),
(114, 'EE1024', 'EE1024', 'EE1024', '0015153418', 'R. Griesh', 'Staff', 'Teaching', 'Assistant Professor', 'EE', 'Working'),
(117, 'ME1033', 'ME1033', 'ME1033', '0007613935', 'Dr. Roja Abraham Raju', 'Staff', 'Teaching', 'Associate Professor', 'ME', 'Working'),
(120, 'CS2002', 'CS2002', 'CS2002', '0015149877', 'Thejal Laly Jose', 'Staff', 'Non-teaching', 'Lab Instructor Grade', 'CS', 'Working'),
(122, 'CS2004', 'CS2004', 'CS2004', '0007577160', 'Manoj Mathew', 'Staff', 'Non-teaching', 'Lab Instructor Grade', 'CS', 'Working'),
(123, 'CS2005', 'CS2005', 'CS2005', '0015155506', 'Jomy Alex', 'Staff', 'Non-teaching', 'Lab Instructor Grade', 'CS', 'Working'),
(124, 'CS2006', 'CS2006', 'CS2006', '0015149982', 'Asha V.K', 'Staff', 'Non-teaching', 'Lab Instructor Grade', 'CS', 'Working'),
(125, 'CS2007', 'CS2007', 'CS2007', '0008355083', 'Kurian Thomas', 'Staff', 'Non-teaching', 'Lab Assistant', 'CS', 'Working'),
(131, 'CE1018', 'CE1018', 'CE1018', '0007612107', 'Dhaniesh J. Danam', 'Staff', 'Teaching', 'Assistant Professor', 'CE', 'Working'),
(136, 'OF3004', 'OF3004', 'OF3004', '0008327447', 'Gimmy K. Cherian', 'Staff', 'Non-teaching', 'Assistant Office Man', 'OF', 'Working'),
(2406, 'LI3001', 'LI3001', 'LI3001', '0007611921', 'Sunu P. Raju', 'Staff', 'Non-teaching', 'Librarian Grade-III', 'LI', 'Working'),
(2407, 'LI3002', 'LI3002', 'LI3002', '0007588226', 'Jijy Abraham', 'Staff', 'Non-teaching', 'Librarian Grade-IV', 'LI', 'Working'),
(2408, 'LI3004', 'LI3004', 'LI3004', '0007560059', 'C.T. Cherian', 'Staff', 'Non-teaching', 'Library Assistant', 'LI', 'Working'),
(2411, 'SU3005', 'SU3005', 'SU3005', '0008384095', 'Jomon K.K.', 'Staff', 'Non-teaching', 'Attender', 'SU', 'Working'),
(2412, 'CE2001', 'CE2001', 'CE2001', '0007588223', 'Sithara S.', 'Staff', 'Non-teaching', 'Lab Instructor Grade', 'CE', 'Working'),
(2413, 'EC2008', 'EC2008', 'EC2008', '0007613777', 'Bobby George', 'Staff', 'Non-teaching', 'Senior Lab Assistant', 'EC', 'Working'),
(2425, 'ME1037', 'ME1037', 'ME1037', '0008385358', 'Sunil Dutt', 'Staff', 'Teaching', 'Assistant Professor', 'ME', 'Working'),
(2427, 'CE2002', 'CE2002', 'CE2002', '0007613243', 'Kochumon Thomas', 'Staff', 'Non-teaching', 'Lab Instructor Grade', 'CE', 'Working'),
(2428, 'EC2005', 'EC2005', 'EC2005', '0007617404', 'Julimol Roshy', 'Staff', 'Non-teaching', 'Lab Instructor', 'EC', 'Working'),
(2430, 'EC2006', 'EC2006', 'EC2006', '0007613246', 'Hari Krishnan', 'Staff', 'Non-teaching', 'Lab Assistant', 'EC', 'Working'),
(2431, 'EC2011', 'EC2011', 'EC2011', '0015158326', 'Mobin T. Abraham', 'Staff', 'Non-teaching', 'Lab Assistant', 'EC', 'Working'),
(2432, 'ME2001', 'ME2001', 'ME2001', '0007617413', 'Thomas P. Varughese', 'Staff', 'Non-teaching', 'Lab Instructor Grade', 'ME', 'Working'),
(2434, 'EE2001', 'EE2001', 'EE2001', '0007615734', 'Raju T.M.', 'Staff', 'Non-teaching', 'Lab Instructor Grade', 'EE', 'Working'),
(2435, 'EE2007', 'EE2007', 'EE2007', '0015164107', 'Noble Baby', 'Staff', 'Non-teaching', 'Lab Assistant', 'EE', 'Working'),
(2436, 'ME2002', 'ME2002', 'ME2002', '0007611918', 'Lenu Peter', 'Staff', 'Non-teaching', 'Lab Instructor Grade', 'ME', 'Working'),
(2437, 'ME2009', 'ME2009', 'ME2009', '0008345243', 'Vishnu Kumar S', 'Staff', 'Non-teaching', 'Lab Instructor Grade', 'ME', 'Working'),
(2438, 'EC2013', 'EC2013', 'EC2013', '0015157527', 'Devajan A.', 'Staff', 'Non-teaching', 'Lab Assistant', 'EC', 'Working'),
(2439, 'EE2011', 'EE2011', 'EE2011', '0007610554', 'Mobin M.', 'Staff', 'Non-teaching', 'Lab Instructor Grade', 'EE', 'Working'),
(2441, 'ME2008', 'ME2008', 'ME2008', '0015157758', 'Anilkumar E.S.', 'Staff', 'Non-teaching', 'Lab Instructor Grade', 'ME', 'Working'),
(2443, 'OF3003', 'OF3003', 'OF3003', '0008328517', 'Shaiju Varghese', 'Staff', 'Non-teaching', 'Deputy Office Manage', 'OF', 'Working'),
(2444, 'SU3013', 'SU3013', 'SU3013', '0008351580', 'Chacko Ulahannan', 'Staff', 'Non-teaching', 'Driver', 'SU', 'Working'),
(2445, 'SU3014', 'SU3014', 'SU3014', '0008375784', 'Johny Kunjumon', 'Staff', 'Non-teaching', 'Driver', 'SU', 'Working'),
(2446, 'SU3015', 'SU3015', 'SU3015', '0008331585', 'Alby M.M', 'Staff', 'Non-teaching', 'Attender', 'SU', 'Working'),
(2447, 'PR3003', 'PR3003', 'PR3003', '0008349040', 'Anil C. Kuriakose', 'Staff', 'Non-teaching', 'Electrician', 'PR', 'Working'),
(2449, 'SU3001', 'SU3001', 'SU3001', '0007615737', 'Antony K.C.', 'Staff', 'Non-teaching', 'Senior Attender', 'SU', 'Working'),
(2450, 'PR3002', 'PR3002', 'PR3002', '0008244083', 'Babu K.', 'Staff', 'Non-teaching', 'Plumber', 'PR', 'Working'),
(2451, 'SU3017', 'SU3017', 'SU3017', '0008447288', 'Binu P.C.', 'Staff', 'Non-teaching', 'Attender', 'SU', 'Working'),
(2453, 'SU3008', 'SU3008', 'SU3008', '0008253001', 'Chacko C.C', 'Staff', 'Non-teaching', 'Driver', 'SU', 'Working'),
(2454, 'SU3002', 'SU3002', 'SU3002', '0008328514', 'Sijo K.J.', 'Staff', 'Non-teaching', 'Office Assistant', 'LI', 'Working'),
(2456, 'SE3003', 'SE3003', 'SE3003', '0015167875', 'Pious Mathew', 'Staff', 'Non-teaching', 'Chief Security Offic', 'SE', 'Working'),
(2457, 'SU3007', 'SU3007', 'SU3007', '0007588749', 'Johnson Mathew', 'Staff', 'Non-teaching', 'Driver', 'SU', 'Working'),
(2460, 'SU3009', 'SU3009', 'SU3009', '0008348583', 'Thomas C. C', 'Staff', 'Non-teaching', 'Driver', 'SU', 'Working'),
(2461, 'SU3012', 'SU3012', 'SU3012', '0007610565', 'Kochumon Varghese', 'Staff', 'Non-teaching', 'Vehicle Attender', 'SU', 'Working'),
(2462, 'SU3019', 'SU3019', 'SU3019', '0008385336', 'Joseph Thomas', 'Staff', 'Non-teaching', 'Driver', 'SU', 'Working'),
(2463, 'PR3001', 'PR3001', 'PR3001', '0007611266', 'Cheriyan Thomas', 'Staff', 'Non-teaching', 'Civil Construction S', 'PR', 'Working'),
(2465, 'SU3006', 'SU3006', 'SU3006', '0015166170', 'Louis Lave G.', 'Staff', 'Non-teaching', 'Driver', 'SU', 'Working'),
(2466, 'SE3006', 'SE3006', 'SE3006', '0008345166', 'Rajan K.', 'Staff', 'Non-teaching', 'Security Staff', 'SE', 'Working'),
(2468, 'AD4001', 'AD4001', 'AD4001', '0008345221', 'Fr. Kuruvilla Perumal Chacko', 'Staff', 'Administrative', 'Students Advisor', 'AD', 'Working'),
(2472, 'EE1027', 'EE1027', 'EE1027', '0008457189', 'Sherin Samuel', 'Staff', 'Teaching', 'Assistant Professor', 'EE', 'Working'),
(2473, 'EE1028', 'EE1028', 'EE1028', '0007616482', 'Vineetha P. Joseph', 'Staff', 'Teaching', 'Assistant Professor', 'EE', 'Working'),
(2476, 'ME1039', 'ME1039', 'ME1039', '0008450911', 'Arun Thomas George', 'Staff', 'Teaching', 'Assistant Professor', 'ME', 'Working'),
(2479, 'HO3003', 'HO3003', 'HO3003', '0015156437', 'John Jacob', 'Staff', 'Non-teaching', 'Hostel Manager', 'HO', 'Working'),
(2490, 'HO3001', 'HO3001', 'HO3001', '0008328629', 'Radhika Menon', 'Staff', 'Non-teaching', 'Hostel Matron', 'HO', 'Working'),
(2491, 'OF3006', 'OF3006', 'OF3006', '0008247371', 'Jijo Abraham', 'Staff', 'Non-teaching', 'Assistant Office Man', 'OF', 'Working'),
(2492, 'SE3001', 'SE3001', 'SE3001', '0015162705', 'Sebastian P.J.', 'Staff', 'Non-teaching', 'Security Staff', 'SE', 'Working'),
(2493, 'SU3010', 'SU3010', 'SU3010', '0015168478', 'Oommen M. Koruthu', 'Staff', 'Non-teaching', 'Vehicle Attender', 'SU', 'Working'),
(2494, 'LI3005', 'LI3005', 'LI3005', '0007610560', 'Shinoy C.', 'Staff', 'Non-teaching', 'Vehicle Attender', 'LI', 'Working'),
(2495, 'SU3011', 'SU3011', 'SU3011', '0007613367', 'Kuriachen P Mathew', 'Staff', 'Non-teaching', 'Vehicle Attender', 'SU', 'Working'),
(2501, 'SE3004', 'SE3004', 'SE3004', '0008355061', 'Shaji G', 'Staff', 'Non-teaching', 'Security Officer', 'SE', 'Working'),
(2504, 'SE3005', 'SE3005', 'SE3005', '0007609738', 'Thomas P.M.', 'Staff', 'Non-teaching', 'Security Staff', 'SE', 'Working'),
(2510, 'HO3004', 'HO3004', 'HO3004', '0008342548', 'Jayachandran V.', 'Staff', 'Non-teaching', 'Hostel Manager', 'HO', 'Working'),
(2511, 'SE3011', 'SE3011', 'SE3011', '0008342441', 'Uthaman P.K.', 'Staff', 'Non-teaching', 'Security Staff', 'SE', 'Working'),
(2512, 'HO3005', 'HO3005', 'HO3005', '0008342551', 'Susan Paul', 'Staff', 'Non-teaching', 'Hostel Matron', 'HO', 'Working'),
(2523, 'PR3007', 'PR3007', 'PR3007', '0008450934', 'Jijo Abraham', 'Staff', 'Non-teaching', 'Electrician', 'PR', 'Working'),
(2524, 'EE1030', 'EE1030', 'EE1030', '0008385525', 'Robins Anto', 'Staff', 'Teaching', 'Associate Professor', 'EE', 'Working'),
(2527, 'ME1043', 'ME1043', 'ME1043', '0007588426', 'Ashif S', 'Staff', 'Teaching', 'Assistant Professor', 'ME', 'Working'),
(2533, '3914', '3914', NULL, '', 'Anand U S', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2534, '3915', '3915', NULL, '', 'Sachu Prakash K', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2538, '3919', '3919', NULL, '', 'Christina Stantly', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2546, '3925', '3925', '141125', '', 'Steven Varughese', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2547, '3926', '3926', '144015', '', 'Jophin M George', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2548, '3927', '3927', '141025', '', 'Jincy James', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2549, '3928', '3928', '142017', '', 'Jibina Mathew', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2550, '3929', '3929', '144002', '', 'Ajay M Thomas', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2551, '3930', '3930', '141023', '', 'Gisha Joseph', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2552, '3931', '3931', '144026', '', 'Rwithu Kovakkallil', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2553, '3932', '3932', '141119', '', 'Shelvin James', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2554, '3933', '3933', '144001', '', 'Abhishek Balachandran', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2555, '3934', '3934', '141103', '', 'Jude George', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2557, '3936', '3936', '141010', '', 'Amal Johny', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2558, '3937', '3937', '144018', '', 'Lakshmi S Raveendran', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2560, '3939', '3939', '144025', '', 'Reeba Mathews', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2562, '3941', '3941', '144009', '', 'Basil P Joy', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2563, '3942', '3942', '141114', '', 'Rahul C. R.', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2564, '3943', '3943', '144012', '', 'Jibin Varghese', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2565, '3944', '3944', '141026', '', 'Jinta Thankam Jacob', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2566, '3945', '3945', '144005', '', 'Anaz Shajahan', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2567, '3946', '3946', '141105', '', 'Kuriakose Sunny', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2568, '3947', '3947', '141123', '', 'Sivin Wilson', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2569, '3948', '3948', '141121', '', 'Shiffin Alex', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2570, '3949', '3949', '144017', '', 'Justin Johnson', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2571, '3950', '3950', '144004', '', 'Alex Thomas', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2572, '3951', '3951', '141021', '', 'Elizabeth Joseph', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2573, '3952', '3952', '144010', '', 'Bibil K Biju', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2574, '3953', '3953', '141020', '', 'Dona Maria John', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2575, '3954', '3954', '144035', '', 'Thomas Joseph', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2576, '3955', '3955', '141126', '', 'Varun Chandh V P', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2577, '3956', '3956', '144006', '', 'Anoop Kumar R', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2578, '3957', '3957', '141116', '', 'Rijo Sam Mathew', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2579, '3958', '3958', '144034', '', 'Supin J Varghese', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2581, '3960', '3960', '144019', '', 'Libin P Joseph', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2582, '3961', '3961', '144024', '', 'Nikhil P Krishnan', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2583, '3962', '3962', '141006', '', 'Aida Ann Mathews', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2584, '3963', '3963', '144036', '', 'Vineetha Vijayan', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2585, '3964', '3964', '141124', '', 'Sonu Suresh John', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2586, '3965', '3965', '144011', '', 'Jebin M', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2587, '3966', '3966', '141018', '', 'Bijila Susan Viju', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2588, '3967', '3967', '144013', '', 'Jiffin Sebastian', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2589, '3968', '3968', '147063', '', 'Shinu Mariam Thomas B', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2590, '3969', '3969', '145063', '', 'Jinu V James', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2591, '3970', '3970', '144016', '', 'Joseph C Chacko', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2592, '3971', '3971', '141107', '', 'Maffin Manoj', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2593, '3972', '3972', '144023', '', 'Nijin Varghese John', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2594, '3973', '3973', '141106', '', 'Lija  Maria Varghese', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2595, '3974', '3974', '144021', '', 'Meenu P Shaji', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2596, '3975', '3975', '141111', '', 'Neenu Rachel  Geogy', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2597, '3976', '3976', '144020', '', 'Linto V Jacob', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2598, '3977', '3977', '141015', '', 'Ansa Elsa Thomas', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2599, '3978', '3978', '141016', '', 'Ansu  Susan Mathew', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2600, '3979', '3979', '141113', '', 'Praveen M', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2601, '3980', '3980', '141011', '', 'Amal Shibu', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2602, '3981', '3981', '141120', '', 'Shibin Varghese', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2603, '3982', '3982', '141007', '', 'Aishwarya Rajee', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2604, '3983', '3983', '141004', '', 'Aby Shaji', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2605, '3984', '3984', '141014', '', 'Aneena Benny', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2606, '3985', '3985', '141102', '', 'Jobin John Mathew', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2607, '3986', '3986', '141001', '', 'Abdul Rahim E B', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2609, '3988', '3988', '141022', '', 'Fabitha Samsheer', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2610, '3989', '3989', '141108', '', 'Melbin Das', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2611, '3990', '3990', '141009', '', 'Alex K Varghese', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2612, '3991', '3991', '141017', '', 'Ashwin Sunil', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2613, '3992', '3992', '141109', '', 'Melvin Varghese George', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2614, '3993', '3993', '141115', '', 'Reshma Elizabeth Siby', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2615, '3994', '3994', '141002', '', 'Abin Roy', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2616, '3995', '3995', '141024', '', 'Jicku Maria George', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2617, '3996', '3996', '141012', '', 'Amal V Kumar', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2618, '3997', '3997', '147007', '', 'Alex P Jose', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2619, '3998', '3998', '145003', '', 'Ajai P Thomas', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2620, '3999', '3999', '147055', '', 'Suha Farsana', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2622, '4001', '4001', '145038', '', 'Leon Biji Chacko', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2623, '4002', '4002', '147013', '', 'Anson T Jose', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2624, '4003', '4003', '145036', '', 'Kevin Koshy Tom', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2625, '4004', '4004', '147027', '', 'Jeffin Eapen', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2627, '4006', '4006', '147032', '', 'Jins Alex', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2628, '4007', '4007', '147054', '', 'Sudev  S Nair', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2629, '4008', '4008', '147046', '', 'Rameez  Rafeek', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2630, '4009', '4009', '145059', '', 'Varun Vijay', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2631, '4010', '4010', '147035', '', 'Jovash Joekutty Iype E', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2632, '4011', '4011', '145020', '', 'Ashwin Ashok', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2633, '4012', '4012', '147017', '', 'Aswin Jacob', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2634, '4013', '4013', '145050', '', 'Sebin K Thomas', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2635, '4014', '4014', '147050', '', 'Sanju Benny', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2636, '4015', '4015', '145062', '', 'Vishnu V Vijayan', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2637, '4016', '4016', '145046', '', 'Rony Raju', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2638, '4017', '4017', '147002', '', 'Abin Thomas George P', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2640, '4019', '4019', '145049', '', 'Sayanth Soman', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2641, '4020', '4020', '147052', '', 'Shine Susan Saji', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2642, '4021', '4021', '145004', '', 'Ajay Thomas', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2643, '4022', '4022', '145027', '', 'Issac Jobe John', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2644, '4023', '4023', '147018', '', 'Athira Mohan', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2645, '4024', '4024', '145035', '', 'Joseph Sabu Kuriackal', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2646, '4025', '4025', '147058', '', 'Tonia George', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2647, '4026', '4026', '145053', '', 'Sibin Ninan Philip', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2648, '4027', '4027', '147025', '', 'Ittyavirah Abraham', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2649, '4028', '4028', '145051', '', 'Shabin Mathews', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2650, '4029', '4029', '145018', '', 'Ashik Ansary M', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2651, '4030', '4030', '147028', '', 'Jeffin Joseph', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2652, '4031', '4031', '145039', '', 'Manu Thomas', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2654, '4033', '4033', '147044', '', 'Nirmal Kasper', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2655, '4034', '4034', '145060', '', 'Vishak Nair P T', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2656, '4035', '4035', '147037', '', 'Lijo Saji', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2657, '4036', '4036', '145029', '', 'Jewel V Joseph', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2658, '4037', '4037', '147030', '', 'Jerin Simon', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2659, '4038', '4038', '145042', '', 'Philip Vijee Baby', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2660, '4039', '4039', '147057', '', 'Tom Jones', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2661, '4040', '4040', '145057', '', 'Titty George', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2662, '4041', '4041', '147047', '', 'Saino Jacob', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2663, '4042', '4042', '145021', '', 'Basil Sleeba', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2664, '4043', '4043', '145048', '', 'Savio Jose', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2665, '4044', '4044', '147043', '', 'Neenu Jabbar', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2666, '4045', '4045', '145007', '', 'Akhil Abraham Raju', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2667, '4046', '4046', '147003', '', 'Afsal N Sainu', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2668, '4047', '4047', '145040', '', 'Muhammed Noufal P S', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2669, '4048', '4048', '147042', '', 'Milan John', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2670, '4049', '4049', '145028', '', 'Jacob Kuruvila', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2672, '4051', '4051', '145037', '', 'Krishnaroop A', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2673, '4052', '4052', '147034', '', 'Josmy Maria Jose', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2674, '4053', '4053', '145055', '', 'Suhail P N', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2675, '4054', '4054', '147040', '', 'Liya Joy', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2676, '4055', '4055', '147061', '', 'Vishnuprasad V Prabhakar', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2677, '4056', '4056', '142042', '', 'Varghese Thomas', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2678, '4057', '4057', '147045', '', 'Nithin Saji', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2679, '4058', '4058', '142007', '', 'Anu P A', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2680, '4059', '4059', '142021', '', 'Joel Shanty', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2681, '4060', '4060', '142022', '', 'Jomin Mathew', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2682, '4061', '4061', '142030', '', 'Rachel Sara Jacob', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2683, '4062', '4062', '142034', '', 'Reshma Susan Thomas', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2684, '4063', '4063', '142019', '', 'Jiss Joseph Thomas', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2685, '4064', '4064', '142009', '', 'Ashik Eapen Mathews', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2686, '4065', '4065', NULL, '', 'Ajmal Sherief', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2687, '4066', '4066', '142031', '', 'Reethu Elza Joseph', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2688, '4067', '4067', '142032', '', 'Reethu Rachel Varughese', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2689, '4068', '4068', '142027', '', 'Nissu Simon', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2690, '4069', '4069', '142002', '', 'Adarsh Balachandran', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2691, '4070', '4070', '142038', '', 'Sharon  J  Wilson', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2692, '4071', '4071', '142005', '', 'Anisha Anil', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2693, '4072', '4072', '142004', '', 'Aneena Elizabeth Chandy', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2694, '4073', '4073', '142033', '', 'Reshma Susan Biju', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2695, '4074', '4074', '142036', '', 'Sanju Mathew', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2696, '4075', '4075', '142016', '', 'Jewel Susan Lalu', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2697, '4076', '4076', '142026', '', 'Nezrin Naushad', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2698, '4077', '4077', '142028', '', 'Nourin Naushad', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2699, '4078', '4078', '142040', '', 'Sneha Anna Koshy', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2700, '4079', '4079', '142008', '', 'Arun . E Kuriakose', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2701, '4080', '4080', '142039', '', 'Shehin Basheer', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2702, '4081', '4081', '142023', '', 'Leni Reji Abraham', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2703, '4082', '4082', '142018', '', 'Jibiya Benny', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2704, '4083', '4083', '142011', '', 'Ebin M. Francis', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2705, '4084', '4084', '142029', '', 'Omkar Sudhakar Patil', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2706, '4085', '4085', '142014', '', 'Hanok C Jacob', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2707, '4086', '4086', '142025', '', 'Melvin Mathew Joseph', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2708, '4087', '4087', '142015', '', 'Jerin Mathew', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2709, 'ME1045', 'ME1045', 'ME1045', '0007588715', 'Rojin Mathews', 'Staff', 'Teaching', 'Assistant Professor', 'ME', 'Working'),
(2711, '4088', '4088', '147014', '', 'Arshad  Ahammed Hussain', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2712, '4089', '4089', '142006', '', 'Anju Shaji', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2713, '4090', '4090', '147033', '', 'Jisna Jose', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2714, '4091', '4091', '147008', '', 'Alwin Sebastian', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2715, '4092', '4092', '147012', '', 'Ann  Mariya Jose', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2716, '4093', '4093', '144003', '', 'Akhilesh S', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2717, '4094', '4094', '145012', '', 'Anandan P Shaji', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2718, '4095', '4095', '147024', '', 'Henny Mariam Titus', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2719, '4096', '4096', '147016', '', 'Ashik Sam Alex', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2720, '4097', '4097', '145010', '', 'Alan Alex', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2721, '4098', '4098', '141101', '', 'Jinto Jose', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2722, '4099', '4099', '141005', '', 'Ahana Sethulekshmi', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2723, '4100', '4100', '141118', '', 'Sanjo James', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2724, '4101', '4101', '142020', '', 'Jobin Joe Kurian', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2725, '4102', '4102', '145013', '', 'Anandhu Krishnan R', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2726, '4103', '4103', '147021', '', 'Blessy Elsa Mathew', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2727, '4104', '4104', '145015', '', 'Aravind Jayan K', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2728, '4105', '4105', '145043', '', 'Pramod P Prasad', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2729, '4106', '4106', '142037', '', 'Sarath S Sankar', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2730, '4107', '4107', '147026', '', 'Jacob Mathew', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2731, '4108', '4108', '147053', '', 'Shinto V Sabu', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2733, '4110', '4110', '145008', '', 'Akhil Ajay', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2734, '4111', '4111', '147049', '', 'Sandhra Elsa Kurian', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2735, '4112', '4112', '144037', '', 'Vivin George Varghese', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2736, '4113', '4113', '141013', '', 'Ammu Raj', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2738, '4115', '4115', '144029', '', 'Sibin Babu', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2739, '4116', '4116', '144032', '', 'Sunish Suresh', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2740, '4117', '4117', '141008', '', 'Aksa Mathew', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2742, '4119', '4119', '142013', '', 'Greena Maria Joy', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2744, '4120', '4120', '145006', '', 'Akash Mathew', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2745, '4121', '4121', '147019', '', 'Beksy Thomas', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2747, '4123', '4123', '145047', '', 'Sajin P.B', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2748, '4124', '4124', '145041', '', 'Nithin Chacko', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2749, '4125', '4125', '144008', '', 'Arya T R', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2750, '4126', '4126', '144027', '', 'Saiju T Jacob', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2751, '4127', '4127', '142001', '', 'Abin Pious', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2752, '4000', '4000', '145009', '', 'Akhila Vijayan', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2753, '4128', '4128', '147038', '', 'Liny Ann Thomas', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2754, '4129', '4129', '147009', '', 'Amal Ashok', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2755, '4130', '4130', '145052', '', 'Shine Mathew Varghese', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2756, '4131', '4131', '141110', '', 'Merin Johnson', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2757, '4132', '4132', '147056', '', 'Thasleema Asharuf', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2758, '4133', '4133', '145054', '', 'Sreejith S Kumar', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2759, '4134', '4134', '147029', '', 'Jeny Jacob', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2760, '4135', '4135', '145023', '', 'Chedambath Satyajith', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2761, '4136', '4136', '147062', '', 'Vyshnavi M S', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2762, '4137', '4137', '147036', '', 'Jyothish Joy', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2763, '4138', '4138', '144031', '', 'Stejin Thankachan', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2764, '4139', '4139', '147015', '', 'Aryalakshmi Babu', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2765, '4140', '4140', '145014', '', 'Anoob Cherian', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2766, '4141', '4141', '147005', '', 'Akhil Saju', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2767, '4142', '4142', '147048', '', 'Sajith P Shukur', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2768, '4143', '4143', '145061', '', 'Vishnu Kalesh', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2769, '4144', '4144', '147020', '', 'Binju K Biji', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2770, '4145', '4145', '142024', '', 'Mathew Joseph', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2771, '4146', '4146', '145022', '', 'Bijeesh K.B', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2772, '4147', '4147', '145033', '', 'Jithin C T', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2773, '4148', '4148', '145034', '', 'Joel Saju', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2774, '4149', '4149', '145024', '', 'Danimon', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2776, '4151', '4151', '147031', '', 'Jesbin Jo Thomas', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2779, '4154', '4154', '145025', '', 'Darin Abraham Bennet', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2780, '4155', '4155', '145031', '', 'Jishnu Janakan', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2781, '4156', '4156', '147001', '', 'Abin Scaria', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2782, '4157', '4157', '145019', '', 'Ashin Jose Jacob', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2783, '4158', '4158', '141003', '', 'Abin Shaji', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2785, '4160', '4160', '145026', '', 'Dinu Maxin', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2786, '4161', '4161', '147004', '', 'Ajin Geo Jacob', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2787, '4162', '4162', '147051', '', 'Sethulakshmi S', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2788, '4163', '4163', '147041', '', 'Mathew Idiculla', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2789, '4164', '4164', '142010', '', 'Betcy Mathew', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2790, '4165', '4165', '145005', '', 'Ajin R L', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2791, '4166', '4166', '145056', '', 'Swadhin Krishna A', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2792, '4167', '4167', '145001', '', 'Adhithyan K R', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2793, '4168', '4168', '142012', '', 'Febin Antony', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2794, '4169', '4169', '145045', '', 'Robin Raju', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2795, '4170', '4170', '145058', '', 'Tona Dominic Varghese', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2796, '4171', '4171', '145011', '', 'Amal Raj', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2797, '4172', '4172', '147022', '', 'Goutham Prakash', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2798, '4173', '4173', '142035', '', 'Richu Mathew', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2799, '4174', '4174', '145030', '', 'Jinto Jacob', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2800, '4175', '4175', '145002', '', 'Afsal P V', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2801, '4176', '4176', '147006', '', 'Akhil T M', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2802, '4177', '4177', '142041', '', 'Sony George', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2803, '4178', '4178', '144033', '', 'Sunu Mariyam Alex', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2804, '4179', '4179', '147059', '', 'Vani Prasad', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2805, '4180', '4180', '147039', '', 'Lithin V T', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2806, '4181', '4181', '141104', '', 'Kanjiraparambil Jerin Benny', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2807, '4182', '4182', '144028', '', 'Shahana Beegum O S', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2812, '4183', '4183', '144022', '', 'Naveen K Tom', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2813, 'ME1047', 'ME1047', 'ME1047', '0008457100', 'Stephen George', 'Staff', 'Teaching', 'Assistant Professor', 'ME', 'Working'),
(2814, '4184', '4184', '147010', '', 'Amina P M', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2818, '4186', '4186', '144007', '', 'Arya Satheesan', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2822, 'CE1032', 'CE1032', 'CE1032', '0007588710', 'Mintu Sara George', 'Staff', 'Teaching', 'Assistant Professor', 'CE', 'Working'),
(2826, '4187', '4187', '141131', '', 'Sijo Joseph', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2827, '4188', '4188', '147064', '', 'Aboothahir T A', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2828, '4189', '4189', '151024', '', 'Jesbin George', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2830, '4191', '4191', '151045', '', 'Subinamol', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2831, '4192', '4192', '147065', '', 'Jissin Joy', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2833, '4194', '4194', '141031', '', 'Edwin C Jossy', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2834, '4195', '4195', '141132', '', 'Susmi Mathew', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2835, '4196', '4196', '141128', '', 'Harikrishnan Nair P M', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2836, '4197', '4197', '141027', '', 'Ananthu S Pillai', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2837, '4198', '4198', '141028', '', 'Ashamol P S', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2838, '4199', '4199', '141129', '', 'Nithin Varghese', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2839, '4200', '4200', '141032', '', 'Joseph Benadict', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2840, '4201', '4201', '141130', '', 'Rahul K R', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2841, '4202', '4202', '141029', '', 'Bichumon C B', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2843, '4204', '4204', '142046', '', 'Faseena Noushad', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2844, '4205', '4205', '142048', '', 'Sarathkumar M S', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2845, '4206', '4206', '154008', '', 'Amal K Joseph', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2846, '4207', '4207', '142050', '', 'Vipin Joseph', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2847, '4208', '4208', '142049', '', 'Sophiya Joseph', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2848, '4209', '4209', '142043', '', 'Anjumol V M', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2849, '4210', '4210', '142045', '', 'Brijit Sebastian', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2850, '4211', '4211', '154010', '', 'Anjana A Kumar', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2851, '4212', '4212', '151026', '', 'Jobin Johnson', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2852, '4213', '4213', '151020', '', 'Gishamol R', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2853, '4214', '4214', '151019', '', 'Ebin George Jose', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2854, '4215', '4215', '147066', '', 'Saju Alex', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2855, '4216', '4216', '141030', '', 'Dhanesh V N', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2856, '4217', '4217', '157014', '', 'Angel Elsa Simon', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2858, '4219', '4219', '155017', '', 'Felix Mathew Koshy', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2862, '4223', '4223', '141134', '', 'Arjun Das P.', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2864, '4225', '4225', '155018', '', 'Flemin Joychan', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2866, '4227', '4227', '157052', '', 'Trassan M Udayan', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2867, '4228', '4228', '154012', '', 'Aromal Krishna', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2868, '4229', '4229', '151028', '', 'John J', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2869, '4230', '4230', '151029', '', 'Jose J', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2870, '4231', '4231', '155012', '', 'Ashish P Kunjumon', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2871, '4232', '4232', '155010', '', 'Amal Sabu', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2872, '4233', '4233', '151048', '', 'Vishak V Thampy', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2873, '4234', '4234', '157009', '', 'Alona Sara Sajan', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2875, 'CS1024', 'CS1024', 'CS1024', '0007588217', 'Sneha Thankachan', 'Staff', 'Teaching', 'Assistant Professor', 'CS', 'Working'),
(2876, '4235', '4235', '157037', '', 'Minnu Rosy Varghese', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2877, '4236', '4236', '157019', '', 'Athythya Nath', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2878, '4237', '4237', '155039', '', 'Nazim Hussain M M', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2879, '4238', '4238', '155021', '', 'Gokul S', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2880, '4239', '4239', '155033', '', 'Johnson Mathew', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2882, '4241', '4241', '157047', '', 'Sebhalakshmi K', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2883, '4242', '4242', '154018', '', 'Emy Ann Jacob', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2884, '4243', '4243', '157004', '', 'Alan James', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2885, '4244', '4244', '157046', '', 'Saneeshmon K N', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2887, '4246', '4246', '157017', '', 'Ashna P Nazar', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2888, '4247', '4247', '151044', '', 'Srithi Sethukumar', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2889, '4248', '4248', '154019', '', 'Fathima Sabila M N', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2890, '4249', '4249', '151025', '', 'Jilu Joseph', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2892, '4251', '4251', '157022', '', 'Chinnu Ann John', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2893, '4252', '4252', '152019', '', 'Gifty Mariam Abraham', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2894, '4253', '4253', '154029', '', 'Joel Shajan Varghese', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2895, '4254', '4254', '157029', '', 'Joel John Jacob', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2896, '4255', '4255', '152018', '', 'Gayathri S', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2897, '4256', '4256', '157021', '', 'Bithin Varghese Biji', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2898, '4257', '4257', '155038', '', 'Mobin Thomas', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2899, '4258', '4258', '154014', '', 'Beena P Thomas', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2901, '4260', '4260', '157048', '', 'Shefin Anas', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2902, '4261', '4261', '154031', '', 'Libin Liya', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2903, '4262', '4262', '154024', '', 'Jibin Joseph', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2904, '4263', '4263', '157035', '', 'Kishore K', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2905, '4264', '4264', '152029', '', 'Mithun Raju', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2906, 'EE1033', 'EE1033', 'EE1033', '0007610670', 'Rinu Susan Roy', 'Staff', 'Teaching', 'Assistant Professor', 'EE', 'Working'),
(2911, '4269', '4269', '152031', '', 'Neenu Anna Koshy', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2912, '4270', '4270', '152048', '', 'Yohannan Alias', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2914, '4272', '4272', '157040', '', 'Reshma P S', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2915, '4273', '4273', '152044', '', 'Sreejith Chandran', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2916, '4274', '4274', '152006', '', 'Alphonsa George', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2917, '4275', '4275', '155048', '', 'Sachin K Sasi', 'Student', 'B.Tech', 'S5', 'ME', 'Studying'),
(2918, '4276', '4276', '152001', '', 'Aiby Ann Abraham', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2920, '4278', '4278', '154039', '', 'Regin Tom Tommey Jose', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2921, '4279', '4279', '155043', '', 'Rahul Raj', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2922, '4280', '4280', '155015', '', 'Dhanesh M Nair', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2923, '4281', '4281', '155034', '', 'Manu George', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2924, '4282', '4282', '155040', '', 'Nibin Benny', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2926, '4284', '4284', '155046', '', 'Rubin Mathew Ranji', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2927, '4285', '4285', '155037', '', 'Midhun Sudhir S P', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2928, '4286', '4286', '155050', '', 'Shibin Shaji', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2929, '4287', '4287', '155049', '', 'Sarath K V', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2930, '4288', '4288', '155029', '', 'Jerry Jacob Varghese', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2931, '4289', '4289', '152020', '', 'Gopika Suresh', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2933, '4291', '4291', '151039', '', 'Roshin A A', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2934, '4292', '4292', '152034', '', 'Nikhil Varghese', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2935, '4293', '4293', '155041', '', 'Nizam Nazeer', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2937, '4295', '4295', '155054', '', 'Thomas Thampi', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2938, '4296', '4296', '157010', '', 'Amal J S Luke', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2939, '4297', '4297', '155035', '', 'Manu Raj', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2940, '4298', '4298', '157002', '', 'Ajayraj S', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2942, '4300', '4300', '154003', '', 'Akhil K George Abraham', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2943, '4301', '4301', '154006', '', 'Alan Sam Zakaria', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2944, '4302', '4302', '151034', '', 'Nikki Mariam Kuruvilla', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2945, '4303', '4303', '155036', '', 'Mebin C Mathew', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2946, '4304', '4304', '155002', '', 'Abijith A', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2947, '4305', '4305', '152025', '', 'Jisha Anie Jiji', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2949, '4307', '4307', '152043', '', 'Sivapriya B', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2952, 'EC1041', 'EC1041', 'EC1041', '0015144889', 'Neethu Susan Rajan', 'Staff', 'Teaching', 'Assistant Professor', 'EC', 'Working'),
(2953, '4310', '4310', '152040', '', 'Shalu Elsa Shaji', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2955, 'EC1043', 'EC1043', 'EC1043', '0007610871', 'Maria Joseph', 'Staff', 'Teaching', 'Assistant Professor', 'EC', 'Working'),
(2961, '4311', '4311', '157043', '', 'Rijo K George', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2962, 'SH1023', 'SH1023', 'SH1023', '0007612114', 'Dr. Nirmala Joseph', 'Staff', 'Teaching', 'Professor', 'SH', 'Working'),
(2964, '4312', '4312', '151035', '', 'Richards', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2965, '4313', '4313', '152022', '', 'Hima Kurian', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2966, '4314', '4314', '157034', '', 'Kevin Mulamkeezhil Alex', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2967, 'EC1044', 'EC1044', 'EC1044', '0015164357', 'Roshna T.R', 'Staff', 'Teaching', 'Assistant Professor', 'EC', 'Working'),
(2968, '4315', '4315', '154013', '', 'Aysha Sulaiman', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(2970, '4317', '4317', '151008', '', 'Akshaya Susan Mathew', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2972, '4319', '4319', '155013', '', 'Betson Philipose Thomas', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2973, '4320', '4320', '157030', '', 'Joel Joy', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(2975, '4322', '4322', '141133', '', 'Favas C. Saji', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(2976, '4323', '4323', '145065', '', 'Arun V. A.', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(2977, '4324', '4324', '152002', '', 'Aibymol Varghese', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2978, '4325', '4325', '152003', '', 'Akshay R.Nair', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2980, '4327', '4327', '152005', '', 'Aleesha Maria Siby', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2982, '4329', '4329', '152008', '', 'Anitta Lukose', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2983, '4330', '4330', '152009', '', 'Anjali Salimon', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2984, '4331', '4331', '152010', '', 'Anjitha Joy', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2985, '4332', '4332', '152011', '', 'Anumol Mariyam Shaji', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2986, '4333', '4333', '152012', '', 'Ashique Muhammed', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2987, '4334', '4334', '152013', '', 'Ashish Kurian', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2988, '4335', '4335', '152015', '', 'Bini Mariam Babu', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2989, '4336', '4336', '152016', '', 'Buela.M', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2991, '4338', '4338', '152021', '', 'Hepsy Mariam Thomas', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2992, '4339', '4339', '152023', '', 'Jaison Mathew', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2993, '4340', '4340', '152026', '', 'Jomish.T. John', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2994, '4341', '4341', '152027', '', 'Lakshmi Krishna', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2995, '4342', '4342', '152028', '', 'Mariya Joseph', 'Student', 'B.Tech', 'S8', 'CS', 'Studying');
INSERT INTO `user_details` (`sl_no`, `login_id`, `userid`, `card_id`, `smart_id`, `user_name`, `user_category`, `sub_category`, `semester`, `branch`, `user_status`) VALUES
(2996, '4343', '4343', '152030', '', 'Nakhil Kurian', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2997, '4344', '4344', '152033', '', 'Neethu Merin K.Suresh', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2998, '4345', '4345', '152036', '', 'Rachel Mathew George', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(2999, '4346', '4346', '152037', '', 'Riya Rachel Shaji', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(3000, '4347', '4347', '152039', '', 'Rony Mathew Joykutty', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(3001, '4348', '4348', '152041', '', 'Sharon Koshy Varghese', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(3002, '4349', '4349', '152042', '', 'Siji Johnson', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(3003, '4350', '4350', '152045', '', 'Thabitha Ignatious Fernandez', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(3004, '4351', '4351', '152046', '', 'Tina Elsa Varghese', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(3006, '4353', '4353', '155003', '', 'Abin Aji John', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(3007, '4354', '4354', '155004', '', 'Abin Johns Thomas', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(3008, '4355', '4355', '155005', '', 'Ajil Alias', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(3010, '4357', '4357', '155008', '', 'Allen Easo Mathew', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(3012, '4359', '4359', '155001', '', 'Aaron Varghese Koshy', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(3013, '4360', '4360', '165062', '', 'Arun K.Saleelan', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3014, '4361', '4361', '155014', '', 'Bijo Varughese', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(3015, '4362', '4362', '155020', '', 'Gokul Anilkumar', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(3016, '4363', '4363', '155023', '', 'Gracious Thomas Chacko', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(3018, '4365', '4365', '155027', '', 'Jeffy Joe Abraham', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(3020, '4367', '4367', '155030', '', 'Jibin Raju', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(3021, '4368', '4368', '155031', '', 'Joby Nebu John', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(3023, '4370', '4370', '155044', '', 'Rohan Thomas Abraham', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(3025, '4372', '4372', '155051', '', 'Steevo Tom Jacob', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(3027, '4374', '4374', '155053', '', 'Thomas John', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(3028, '4375', '4375', '155055', '', 'Tinu Tom George', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(3029, '4376', '4376', '157003', '', 'Akshay Mohan', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3030, '4377', '4377', '157012', '', 'Ameer Suhail', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3031, '4378', '4378', '157001', '', 'Abhivishnu V.S.', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3033, '4380', '4380', '157005', '', 'Alan Tom', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3035, '4382', '4382', '157013', '', 'Aneena Merin Sony', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3036, '4383', '4383', '157015', '', 'Anita Ann Oommen', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3038, '4385', '4385', '157023', '', 'Christeena P.S.', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3039, '4386', '4386', '157024', '', 'Glady Thomas', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3040, '4387', '4387', '157026', '', 'Gopu S.Nair', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3041, '4388', '4388', '155026', '', 'Jeffin M.Johnson', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(3042, '4389', '4389', '157027', '', 'Jibin Thomas John', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3043, '4390', '4390', '157028', '', 'Joby Thomas Johnson', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3044, '4391', '4391', '157032', '', 'Jomol John', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3045, '4392', '4392', '157031', '', 'John Koshy M.', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3046, '4393', '4393', '157033', '', 'Kalidas C.', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3047, '4394', '4394', '157036', '', 'Minnu Babu', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3048, '4395', '4395', '157039', '', 'Rahul P.Santhosh', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3049, '4396', '4396', '157041', '', 'Reshma Philip', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3050, '4397', '4397', '157042', '', 'Richa Susan', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3051, '4398', '4398', '157045', '', 'Sachin Kumar P.S.', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3053, '4400', '4400', '157050', '0007616399', 'Sighin Sunny', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3054, '4401', '4401', '157051', '', 'Suby Cherian', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3055, '4402', '4402', '157016', '', 'Anu Xavier', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3057, '4404', '4404', '154002', '', 'Abraham Mathew', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3059, '4406', '4406', '154005', '', 'Alan Abraham Koshy', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3060, '4407', '4407', '154007', '', 'Alen Joseph', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3061, '4408', '4408', '154009', '', 'Amal V.Nair', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3063, '4410', '4410', '154015', '', 'Benson M.Mathew', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3064, '4411', '4411', '154016', '', 'Della Susan Joy', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3066, '4413', '4413', '154020', '', 'Geevar Paul', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3067, '4414', '4414', '154021', '', 'Jeffin Jacob Paul', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3070, '4417', '4417', '154025', '', 'Jijo John', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3073, '4420', '4420', '154028', '', 'Joel Benny Thomas', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3076, '4423', '4423', '154033', '', 'Mathew Jose', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3078, '4425', '4425', '154035', '', 'Pravin Sam G.', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3080, '4427', '4427', '154037', '', 'Prince Abraham Varghese', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3081, '4428', '4428', '154038', '', 'Rahul Raj', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3082, '4429', '4429', '151036', '', 'Rin Kunjumon', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3083, '4430', '4430', '154040', '', 'S.Sreedev', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3084, '4431', '4431', '154041', '', 'Sachin Sam Stephen', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3085, '4432', '4432', '154042', '', 'Sharon Thomas Mammen', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3086, '4433', '4433', '154043', '', 'Shealtieal Sacharia Koshy', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3088, '4435', '4435', '154045', '', 'Vipin Benny', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3089, '4436', '4436', '151003', '', 'Abin Thankachan', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3090, '4437', '4437', '151006', '', 'Aiswarya Roy', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3091, '4438', '4438', '151023', '', 'Jerry Wilson', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3092, '4439', '4439', '151001', '', 'Abhishek K.P', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3093, '4440', '4440', '155024', '', 'Hyzam Kenz.M', 'Student', 'B.Tech', 'S5', 'ME', 'Studying'),
(3094, '4441', '4441', '151002', '', 'Abin K.Mthews', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3095, '4442', '4442', '151004', '', 'Adarsh K.P', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3096, '4443', '4443', '151005', '', 'Ahammad Ali Asharaf', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3098, '4445', '4445', '157008', '', 'Allen Joseph', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3100, '4447', '4447', '151011', '', 'Arjun S.Dev', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3102, '4449', '4449', '151013', '', 'Bevin Varughese', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3103, '4450', '4450', '151015', '', 'Bilu Mathew', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3104, '4451', '4451', '151016', '', 'Bincy B.M', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3105, '4452', '4452', '151017', '', 'Blessy Elsa Varghese', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3106, '4453', '4453', '151018', '', 'Cyril Sam Cheriyan', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3107, '4454', '4454', '151022', '', 'Hannah Mary Wilson', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3108, '4455', '4455', '161053', '', 'Jobymol Jose', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3109, '4456', '4456', '151030', '', 'K.Sujith Thomas', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3111, '4458', '4458', '152035', '', 'Nikhil Varghese Babu', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(3112, '4459', '4459', '157044', '', 'Risa Nasar', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3114, '4461', '4461', '151038', '', 'Robin Rajan Thomas', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3115, '4462', '4462', '151040', '', 'S.H.Muhsina Parvin', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3116, '4463', '4463', '151042', '', 'Sinu Varghese', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3117, '4464', '4464', '151043', '', 'Sneha Elizebeth Tom', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3120, '4467', '4467', '152047', '', 'Vignesh Prabhu P.J.', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(3121, '4468', '4468', '151021', '', 'Greeshma G.', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3125, 'SH1024', 'SH1024', 'SH1024', '0015162226', 'Jaimi Paul', 'Staff', 'Teaching', 'Assistant Professor', 'SH', 'Working'),
(3130, '4469', '4469', '155016', '', 'Edwin Jacob Manoj', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(3131, 'SH1026', 'SH1026', 'SH1026', '0007588519', 'Rosina Xavier', 'Staff', 'Teaching', 'Assistant Professor', 'SH', 'Working'),
(3133, 'SH1027', 'SH1027', 'SH1027', '0015162678', 'Manjula C. Nair', 'Staff', 'Teaching', 'Assistant Professor', 'SH', 'Working'),
(3134, '4471', '4471', '157011', '', 'Ameela Benny', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3136, '4473', '4473', '151032', '', 'Lovis Elsa Mammen', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3145, 'EC1045', 'EC1045', 'EC1045', '0007608854', 'Almaria Joseph', 'Staff', 'Teaching', 'Assistant Professor', 'EC', 'Working'),
(3147, 'AD1003', 'AD1003', 'AD1003', '0006449017', 'Dr. Pradeep C.', 'Staff', 'Teaching', 'Principal', 'AD', 'Working'),
(3150, 'EC1049', 'EC1049', 'EC1049', '0015162582', 'Jobin Varghese', 'Staff', 'Teaching', 'Assistant Professor', 'EC', 'Working'),
(3151, 'EC1047', 'EC1047', 'EC1047', '0007608857', 'Geethos Ninan', 'Staff', 'Teaching', 'Assistant Professor', 'EC', 'Working'),
(3153, 'CE1038', 'CE1038', 'CE1038', '0008449845', 'Benila S.M.', 'Staff', 'Teaching', 'Assistant Professor', 'CE', 'Working'),
(3156, 'SE3015', 'SE3015', 'SE3015', '0008460724', 'Ipe K. thomas', 'Staff', 'Non-teaching', 'Security Staff', 'SE', 'Working'),
(3160, '4474', '4474', '165039', '0008369194', 'Mishel Johny', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3161, '4475', '4475', '165001', '0008334614', 'Abhyudai K Mohan', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3162, '4476', '4476', '161020', '0008328720', 'Ashitha Joseph', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3163, '4477', '4477', '161013', '0008370938', 'Anandhu Madhu', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3165, '4478', '4478', '167027', '0008428600', 'K.A. Aakash', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3166, '4479', '4479', '167042', '0008456519', 'Steffin Jose', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3167, '4480', '4480', '167040', '0008460671', 'Sherwin Panamthundil Soy', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3168, '4481', '4481', '161012', '0008342529', 'Anaida Babychen', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3170, '4483', '4483', '162047', '0008371845', 'Omar Sajid', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3171, '4484', '4484', '167020', '0008454082', 'Eapen C Mathew', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3172, '4485', '4485', '167043', '0008456522', 'Surya Suresh', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3173, '4486', '4486', '164018', '0008383978', 'Joel Oommen Varghese', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3176, '4489', '4489', '167019', '0008361770', 'Durga Rajan', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3177, '4490', '4490', '162033', '0008384360', 'Krisselle Sara Philip', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3178, '4491', '4491', '161010', '0008342463', 'Alphonsa Varghese', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3179, '4492', '4492', '167030', '0007608865', 'Mikku Thomas John', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3180, '4493', '4493', '164004', '0008253038', 'Anu Rani Thomas', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3182, '4495', '4495', '165019', '0008336180', 'Daney Joseph', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3183, '4496', '4496', '161002', '0008353206', 'Aiswarya P Jemini', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3184, '4497', '4497', '161038', '0008238589', 'Libin K B', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3185, '4498', '4498', '162016', '0008454104', 'Ashly M', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3186, '4499', '4499', '165054', '0008452374', 'Simon Peter Cheriyan', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3187, '4500', '4500', '162057', '0008243873', 'Sneha Grace Abraham', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3188, '4501', '4501', '162045', '0008375311', 'Nova P Daniel', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3190, '4503', '4503', '164009', '0008243895', 'Eldhose Mathew', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3192, '4505', '4505', '165027', '0008384056', 'Jisen T George', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3193, '4506', '4506', '162004', '0008459378', 'Ajay Alex Mathew', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3194, '4507', '4507', '165024', '0008384078', 'Gijo P Mathew', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3195, '4508', '4508', '167035', '0007617494', 'Praisy Elezabeth Varghese', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3196, '4509', '4509', '162013', '0008454095', 'Ariyamol', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3197, '4510', '4510', '162028', '0008372629', 'Jinsu Sosa Mathew', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3198, '4511', '4511', '161025', '0008371181', 'Christy C Manuel', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3201, '4514', '4514', '165008', '0008363273', 'Amal Joseph', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3202, '4515', '4515', '162002', '0008459385', 'Abijith Manoj', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3203, '4516', '4516', '165016', '0008373442', 'Augustine Mathew', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3204, '4517', '4517', '164024', '0008353250', 'Paul P Mathew', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3205, '4518', '4518', '162037', '0008372585', 'Minu Anna Benoi', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3206, '4519', '4519', '162058', '0008238439', 'Sonu Yohannan', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3207, '4520', '4520', '162061', '0008384072', 'Sudhan T', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3208, '4521', '4521', '162054', '0008375123', 'Shery Jacob', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3209, '4522', '4522', '162011', '0008372673', 'Amal P Varghese', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3210, '4523', '4523', '164019', '0008460658', 'Justin Varghese', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3211, '4524', '4524', '165030', '0008384045', 'Jobin Joseph', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3213, '4526', '4526', '165043', '0008369216', 'Rishin Akram Hamza P S', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3214, '4527', '4527', '161004', '0008371031', 'Akhil Raj', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3215, '4528', '4528', '167004', '0008373420', 'Amal G Kumar', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3216, '4529', '4529', '165037', '0008384089', 'Mefy S Kollettu', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3218, '4530', '4530', '162038', '0008384441', 'Mohamed Rinoj Hashim', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3221, '4533', '4533', '165035', '0008369172', 'Krishnaprasad J', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3222, '4534', '4534', '161023', '0008328699', 'Bittu M Benny', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3223, '4535', '4535', '165047', '0008334462', 'Sanjay S', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3224, '4536', '4536', '161043', '0008253083', 'Noel Nelson John', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3225, '4537', '4537', '165045', '0008363415', 'Sachin Saji', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3226, '4538', '4538', '161036', '0008428399', 'Judith Rachel Jenny', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3227, '4539', '4539', '167010', '0008459466', 'Anju Mol J', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3228, '4540', '4540', '164022', '0007588699', 'Meenu Saji', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3229, '4541', '4541', '162044', '0008372607', 'Nimitha Joseph', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3231, '4543', '4543', '167023', '0008459429', 'Harikrishnan M C', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3232, '4544', '4544', '161031', '0008328765', 'J. John Winsley', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3233, '4545', '4545', '167026', '0008434288', 'Jimit P Cherian', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3234, '4546', '4546', '165053', '0008384111', 'Sibin K Mathews', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3235, '4547', '4547', '162060', '0008238424', 'Sruthy Marium Jacob', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3236, '4548', '4548', '165055', '0008453373', 'Sriram Chandrasekhar', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3239, '4551', '4551', '161042', '0008253126', 'Mintu Mary Mathew', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3240, '4552', '4552', '167036', '0007584297', 'Rajeev Rajagopal', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3241, '4553', '4553', '164025', '0008353235', 'Sabin Samuel', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3242, '4554', '4554', '161035', '0008375880', 'Jose Kurian', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3243, '4555', '4555', '162036', '0008338758', 'Milan K Jayan', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3244, '4556', '4556', '167009', '0007609635', 'Anjana Biju', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3245, '4557', '4557', '165049', '0008334570', 'Sejo Abraham', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3246, '4558', '4558', '165025', '0008369187', 'Jack J Manthuruthil', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3249, '4561', '4561', '165040', '0008369008', 'Nandhu Santhosh', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3251, '4563', '4563', '162026', '0008372454', 'Jesal B Sunny', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3252, '4564', '4564', '161001', '0008383979', 'Aby David Kurian', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3253, '4565', '4565', '164011', '0008238461', 'Guruprasad A R', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3254, '4566', '4566', '162003', '0008459263', 'Aditya Vishnu', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3255, '4567', '4567', '167012', '0008456327', 'Annie Thomas', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3256, '4568', '4568', '162046', '0008375312', 'Noyal Jose', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3257, '4569', '4569', '162025', '0008372614', 'Jerin P Jimmy', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3258, '4570', '4570', '161022', '0008341892', 'Betty Thomas', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3260, '4572', '4572', '165012', '0008334636', 'Anoop Nadarajan', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3261, '4573', '4573', '164023', '0008384028', 'Nithin Raj', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3262, '4574', '4574', '167006', '0008353430', 'Aman Dileep Jan', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3264, '4576', '4576', '167002', '0008263900', 'Ajithkumar P K', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3265, '4577', '4577', '165031', '0008342485', 'Jomit Mathew', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3266, '4578', '4578', '7612227', '0007612227', 'Allen Thomas Kuruvilla', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3268, '4580', '4580', '167014', '0008253566', 'Anu Sree Krishna', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3269, '4581', '4581', '162024', '0008372447', 'Jacob Binu', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3270, '4582', '4582', '162027', '0008384323', 'Jini Thomas', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3271, '4583', '4583', '162001', '0008456541', 'Abel M. Alex', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3272, '4584', '4584', '162029', '0008384338', 'Joan Bency', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3273, '4585', '4585', '162030', '0008372469', 'Joby Jose Varghese', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3274, '4586', '4586', '162006', '0007613515', 'Akhil Raju', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3275, '4587', '4587', '162031', '0006569621', 'Judy Jose', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3276, '4588', '4588', '162008', '0008372680', 'Alan Sebi', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3277, '4589', '4589', '162032', '0008384345', 'Kevin Shibu', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3278, '4590', '4590', '162035', '0008338761', 'Mariya Sajan', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3279, '4591', '4591', '162009', '0008384367', 'Alfas Ahmed T.T', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3281, '4593', '4593', '162010', '0008372658', 'Algy Rachel Mathew', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3283, '4595', '4595', '162014', '0008450601', 'Arun Sailan', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3284, '4596', '4596', '162041', '0008372432', 'Nekha K Jose', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3285, '4597', '4597', '162012', '0008454214', 'Ansu Anil', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3286, '4598', '4598', '162043', '0008384316', 'Nikhil Sam Ninan', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3287, '4599', '4599', '162048', '0008375101', 'Prince Mathew', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3290, '4602', '4602', '162017', '0007608775', 'Basil Paulose', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3292, '4604', '4604', '162020', '0008434293', 'Don Jiji', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3293, '4605', '4605', '162050', '0007613938', 'Rinu Sunny', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3294, '4606', '4606', '162022', '0008447221', 'Helna Varkichan', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3295, '4607', '4607', '162052', '0008375333', 'Rohan Mathew Alex', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3296, '4608', '4608', '162023', '0008447224', 'Honey Varghese', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3297, '4609', '4609', '164001', '0008253046', 'Abin Geevarghese', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3298, '4610', '4610', '162056', '0008238552', 'Silpa K Benny', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3299, '4611', '4611', '164003', '0008460636', 'Anto Xaviour', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3300, '4612', '4612', '164005', '0008460649', 'Aravind Vijayan', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3301, '4613', '4613', '162059', '0008238545', 'Sreeraj P.S.', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3302, '4614', '4614', '164008', '0008243892', 'Edwin Jerome', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3303, '4615', '4615', '162062', '0008384139', 'Tincy Thomas', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3304, '4616', '4616', '164006', '0007617504', 'Bibin Alex', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3305, '4617', '4617', '162063', '0008384051', 'Vishal S Karivelil', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3306, '4618', '4618', '164007', '0008238446', 'Bilwin Binoy', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3307, '4619', '4619', '164012', '0008243914', 'Jacob Antony', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3308, '4620', '4620', '164017', '0008384050', 'Joel Monachan', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3311, '4623', '4623', '161003', '0008452348', 'Ajith Kuriakose', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3312, '4624', '4624', '164014', '0008238468', 'Jinu Jose', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3313, '4625', '4625', '161005', '0008452411', 'Akhila Mary Jacob', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3316, '4628', '4628', '165041', '0007608867', 'Noble C. Philip', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3317, '4629', '4629', '161007', '0008371036', 'Akshay Kumar S', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3318, '4630', '4630', '164032', '0008334611', 'Swetha Ann Mathew', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3320, '4632', '4632', '161008', '0008342482', 'Alan Thomas', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3321, '4633', '4633', '164026', '0008335946', 'Sanju Thomas', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3322, '4634', '4634', '161009', '0008342526', 'Alona George', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3323, '4635', '4635', '164027', '0008334633', 'Senu Mathulla George', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3324, '4636', '4636', '161011', '0008385380', 'Anagha Mohan', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3326, '4638', '4638', '164028', '0008334680', 'Sharon Shajan George', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3327, '4639', '4639', '161015', '0008375810', 'Anju Biju', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3328, '4640', '4640', '164029', '0008334592', 'Shinto Tony', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3329, '4641', '4641', '164030', '0008363229', 'Silpa J. Vadakkan', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3330, '4642', '4642', '161018', '0008375921', 'Arun Baby', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3331, '4643', '4643', '164033', '0008363232', 'Tinu K. Thomas', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3332, '4644', '4644', '164034', '0007609626', 'Vishal Chacko', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3334, '4646', '4646', '161024', '0008328698', 'Christy Babu', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3335, '4647', '4647', '161026', '0008375902', 'Christy Tom Abraham', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3336, '4648', '4648', '167021', '0008450606', 'Elzy Abraham', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3337, '4649', '4649', '161028', '0008375813', 'Feba Susan Mathew', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3338, '4650', '4650', '167039', '0008260504', 'Shabana Haris', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3339, '4651', '4651', '167015', '0008335960', 'Arjun A.J', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3341, '4653', '4653', '167003', '0008361616', 'Alwin Varghese', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3342, '4654', '4654', '167005', '0008343298', 'Amal George', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3343, '4655', '4655', '161032', '0007617499', 'Jeffin Jose', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3344, '4656', '4656', '167007', '0008371867', 'Anandhu Ramachandran', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3347, '4659', '4659', '167011', '0008465937', 'Ann Maria Joy', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3348, '4660', '4660', '167017', '0008454382', 'Christy Clare Tom', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3349, '4661', '4661', '167016', '0008361789', 'Christina Merin Sunny', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3351, '4663', '4663', '161034', '0008375832', 'Jomon Shaji', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3352, '4664', '4664', '161037', '0008238611', 'Justin Paul', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3355, '4667', '4667', '161041', '0008460467', 'Minnu Susan Abraham', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3356, '4668', '4668', '161044', '0008447201', 'Noma Susan Thomas', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3359, '4671', '4671', '167024', '0008459444', 'Helen Rachel Raji', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3360, '4672', '4672', '167025', '0008456330', 'Jestin Joe George', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3363, '4675', '4675', '167031', '0008260346', 'Minu Elizabeth Philip', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3364, '4676', '4676', '167029', '0008260578', 'Melvin Varghese Philip', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3367, '4679', '4679', '167034', '0008260515', 'Pournami Ashok', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3369, '4681', '4681', '167037', '0008260324', 'Reshma Anna Mathew', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3370, '4682', '4682', '161049', '0007588716', 'Sijin M Mathew', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3372, '4684', '4684', '161050', '0008460436', 'Sona John', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3373, '4685', '4685', '167041', '0008373389', 'Sojan Philip Thomas', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3374, '4686', '4686', '161051', '0008253061', 'Tessy Mariam Rajeev', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3376, '4688', '4688', '167044', '0008459400', 'Thomaskutty Joseph', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3377, '4689', '4689', '165005', '0007616417', 'Alan Jacob', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3378, '4690', '4690', '165002', '0008363251', 'Adithyan K S', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3379, '4691', '4691', '165017', '0008374762', 'Bipin Mamman Varghese', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3380, '4692', '4692', '165003', '0008328764', 'Ajesh Ashok Thomas', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3381, '4693', '4693', '165018', '0007609273', 'Cyril Kuriakose Kurian', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3383, '4695', '4695', '165020', '0008371166', 'Dawn Abraham', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3384, '4696', '4696', '165009', '0008334655', 'Amal V Jayalal', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3386, '4698', '4698', '162019', '0008428617', 'Divya Merin Alex', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3387, '4699', '4699', '165006', '0008328786', 'Alan Kurian Saji', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3388, '4700', '4700', '165010', '0008334677', 'Anjit Thomas John', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3390, '4702', '4702', '162005', '0008459270', 'Ajin Alex', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3391, '4703', '4703', '165014', '0008374745', 'Ashlin B George', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3393, '4705', '4705', '165023', '0008452305', 'George Mathew Chawkayil', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3395, '4707', '4707', '165015', '0008373435', 'Asish Joy', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3396, '4708', '4708', '165028', '0008369165', 'Joash E. Blessan', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3397, '4709', '4709', '165029', '0008368964', 'Jobin George', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3399, '4711', '4711', '165034', '0008368971', 'Kevin Abraham Thomas', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3401, '4713', '4713', '165038', '0008368993', 'Melvin Martin', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3402, '4714', '4714', '165044', '0008334465', 'Roji Roice Daniel', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3403, '4715', '4715', '165050', '0008363441', 'Seomon Jose', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3404, '4716', '4716', '165051', '0008363438', 'Shahid Meeran', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3405, '4717', '4717', '165048', '0008363418', 'Sanjo Joseph Santhosh', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3406, '4718', '4718', '165056', '0006569622', 'Subin Thomas', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3407, '4719', '4719', '165052', '0008369015', 'Shijo Varghese', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3408, '4720', '4720', '165058', '0008452326', 'Thejas P. Reji', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3410, '4722', '4722', '165060', '0008452440', 'Vishnu A.S', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3415, 'SH1028', 'SH1028', 'SH1028', '0015158239', 'Anie T. Thomas', 'Staff', 'Teaching', 'Assistant Professor', 'SH', 'Working'),
(3416, '4725', '4725', '161027', '0008328742', 'Faiz Nazar', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3417, '4726', '4726', '164002', '0008252972', 'Amaljith P Murali', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3419, '4728', '4728', NULL, '', 'Amal Suresh', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3420, '4729', '4729', NULL, '', 'Geo Jose', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3421, 'EE1034', 'EE1034', 'EE1034', '0007615726', 'Annu Mary Zacharias', 'Staff', 'Teaching', 'Assistant Professor', 'EE', 'Working'),
(3422, '4730', '4730', '165033', '0008342507', 'Karunya Shibi', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3423, '4731', '4731', '161030', '0008328743', 'Greeny Ann Joseph', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3424, '4732', '4732', '161029', '0008375899', 'Gokul Biju', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3425, '4733', '4733', '165042', '0008384100', 'Remith P R', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3426, '4734', '4734', '151051', '', 'Neethu Benny', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3427, '4735', '4735', '161017', '0008328721', 'Ardra P Murali', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3428, '4736', '4736', '151049', '', 'Alvin Antony', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3429, '4737', '4737', '164031', '0008334484', 'Suresh V', 'Student', 'B.Tech', 'S6', 'EE', 'Studying'),
(3430, '4738', '4738', '165032', '0008385402', 'Joseph Varkey', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3431, '4739', '4739', '162042', '0008384301', 'Nikhil M Varghese', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3432, '4740', '4740', '162053', '0008371823', 'Serah Ann Thomas', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3433, '4741', '4741', '165004', '0008375855', 'Akthar A Muhammed', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3434, '4742', '4742', '162007', '0008372651', 'Alan Jose', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3436, '4744', '4744', '165026', '0008368986', 'Jijo G. Joppen', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3437, '4745', '4745', '165057', '0008452273', 'Swithin Johny', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3438, '4746', '4746', '157054', '', 'Basil Ipe', 'Student', 'B.Tech', 'S8', 'CE', 'Studying'),
(3439, '4747', '4747', NULL, '', 'Akhila A Sasikumar', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(3440, '4748', '4748', '155056', '', 'Anandhu Vijayakumar', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(3441, '4749', '4749', NULL, '', 'Ajin Joseph', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(3443, '4751', '4751', '155057', '', 'Elias V P', 'Student', 'B.Tech', 'S8', 'ME', 'Studying'),
(3444, '4752', '4752', '151050', '', 'Muhammed Hisham', 'Student', 'B.Tech', 'S8', 'EC', 'Studying'),
(3445, '4753', '4753', NULL, '', 'Visakh M S', 'Student', 'B.Tech', 'S8', 'EE', 'Studying'),
(3446, '4754', '4754', '161019', '0008375791', 'Ashish Lalu Varghese', 'Student', 'B.Tech', 'S6', 'EC', 'Studying'),
(3447, '100008', '100008', '169001', '0008341870', 'Anjumol T. Many', 'Student', 'M.Tech', 'S4', 'CP', 'Studying'),
(3448, '100009', '100009', '169002', '0008385352', 'Aryalakshmi R.', 'Student', 'M.Tech', 'S4', 'CP', 'Studying'),
(3449, '100010', '100010', '169003', '0008385547', 'Shilpa Rajan', 'Student', 'M.Tech', 'S4', 'CP', 'Studying'),
(3450, '100011', '100011', '169004', '0008385377', 'Siji Mol K.', 'Student', 'M.Tech', 'S4', 'CP', 'Studying'),
(3451, '100012', '100012', '169005', '0008341848', 'Sincy Abraham', 'Student', 'M.Tech', 'S4', 'CP', 'Studying'),
(3452, '100013', '100013', '168001', '0008385374', 'Blessy Thomas', 'Student', 'M.Tech', 'S4', 'CO', 'Studying'),
(3453, '100014', '100014', '168002', '0008385399', 'Chinchu Mariam Raju', 'Student', 'M.Tech', 'S4', 'CO', 'Studying'),
(3455, '100017', '100017', '168005', '0008341851', 'Syamol Saseendran', 'Student', 'M.Tech', 'S4', 'CO', 'Studying'),
(3456, '100018', '100018', '168006', '0008385355', 'Thushara Mathew', 'Student', 'M.Tech', 'S4', 'CO', 'Studying'),
(3458, '100016', '100016', '168004', '0008385550', 'Shibina Sainudeen', 'Student', 'M.Tech', 'S4', 'CO', 'Studying'),
(3459, 'HO3006', 'HO3006', 'HO3006', '0008247393', 'Dasappan P.T.', 'Staff', 'Non-teaching', 'Hostel Manager', 'HO', 'Working'),
(3463, 'EE1039', 'EE1039', 'EE1039', '', 'Deepa K. Suresh', 'Staff', 'Teaching', 'Assistant Professor', 'EE', 'Working'),
(3464, 'CS1029', 'CS1029', 'CS1029', '0007610551', 'Susan M. George', 'Staff', 'Teaching', 'Assistant Professor', 'CS', 'Working'),
(3469, 'CE1049', 'CE1049', 'CE1049', '0008452389', 'Surya Ravindran', 'Staff', 'Teaching', 'Assistant Professor', 'CE', 'Working'),
(3472, 'ME1050', 'ME1050', 'ME1050', '0008341829', 'Aby Alias', 'Staff', 'Teaching', 'Assistant Professor', 'ME', 'Working'),
(3473, '4755', '4755', '177015', '0007611533', 'Aneetta K Varghese', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3475, 'EE1036', 'EE1036', 'EE1036', '0007615723', 'Ansu Thomas', 'Staff', 'Teaching', 'Assistant Professor', 'EE', 'Working'),
(3477, 'EE2012', 'EE2012', 'EE2012', '0008452266', 'Abhilash K.R', 'Staff', 'Non-teaching', 'Lab Instructor Grade', 'EE', 'Working'),
(3478, '4756', '4756', '174013', '0007557414', 'Jairus J', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3479, '4757', '4757', '174029', '0007588595', 'Treesa Varghese', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3480, '4758', '4758', '172038', '0007611409', 'Shabina Basheer', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3482, '4760', '4760', '172020', '0015166375', 'Hariharan S', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3483, '4761', '4761', '172009', '0007566298', 'Anandhu M', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3484, '4762', '4762', '171007', '0007610542', 'Harikrishnan D', 'Student', 'B.Tech', 'S4', 'EC', 'Studying'),
(3485, '4763', '4763', '177001', '0007613705', 'Abhijith K S', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3486, '4764', '4764', '177039', '0007557422', 'Sreereshmi P S', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3487, '4765', '4765', '177021', '0007609585', 'Ashna Ansari', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3488, '4766', '4766', '174016', '0007556207', 'Midhun Cherian', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3490, '4768', '4768', '177035', '0007556196', 'Sachin Thomas Mathew', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3492, '4770', '4770', '172008', '', 'Anandhu A', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3493, '4771', '4771', '172018', '0015158120', 'Geena Elizebeth James', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3494, '4772', '4772', '172011', '0015174537', 'Ashik Abraham Baby', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3495, '4773', '4773', '177010', '0007617396', 'Akshay S Santhi', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3496, '4774', '4774', '177011', '0007617399', 'Alan Joseph', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3497, '4775', '4775', '174017', '0007556204', 'Nandhakumar C S', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3498, '4776', '4776', '175040', '0007608873', 'Rijo Reji', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3499, '4777', '4777', '177006', '0007612125', 'Agnes Manoj', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3500, '4778', '4778', '172031', '0007588427', 'Nasheeth P', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3501, '4779', '4779', '177023', '0007609586', 'Blessin K Manoj', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3502, '4780', '4780', '172035', '0007610669', 'Reshma Rachel George', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3504, '4782', '4782', '172010', '0015162791', 'Anto Joby Joseph', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3505, '4783', '4783', '174011', '0007608946', 'Chris V Mathew', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3506, '4784', '4784', '174020', '0007610561', 'Rivi Thomas', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3507, '4785', '4785', '177004', '0007588726', 'Adarsh Jai', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3508, '4786', '4786', '172021', '0015165348', 'Jiny Mariam Jerry', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3510, '4788', '4788', '175027', '0007613577', 'Johnsu Babu', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3512, '4790', '4790', '175028', '0007584295', 'Karan Jacob Joseph', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3516, '4794', '4794', '174023', '0015163568', 'Sebin Sunny', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3517, '4795', '4795', '174002', '0007588436', 'Abitta Mathew', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3518, '4796', '4796', '174004', '0007561361', 'Aleena John', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3519, '4797', '4797', '177016', '0007611536', 'Angela Mariam Regi', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3520, '4798', '4798', '175022', '0007590582', 'Jeevan Jibu', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3522, '4800', '4800', '175026', '0007589425', 'Joel Reji', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3524, '4802', '4802', '175023', '0007590585', 'Jeffin Augustin', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3525, '4803', '4803', '174010', '0007608949', 'Binit Varghese Binu', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3526, '4804', '4804', '175006', '0007612367', 'Akhil Chacko', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3527, '4805', '4805', '175035', '0007613573', 'Nijith P', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3528, '4806', '4806', '175012', '0015177634', 'Christin Regi', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3529, '4807', '4807', '177017', '0007611617', 'Anjala Shaji', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3531, '4809', '4809', '175034', '0007612120', 'Nelwin Samuel Santhosh', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3532, '4810', '4810', '171003', '0007590809', 'Anoop George', 'Student', 'B.Tech', 'S4', 'EC', 'Studying'),
(3533, '4811', '4811', '174030', '0007583312', 'Vigil Vinoy', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3534, '4812', '4812', '175033', '0015139608', 'Mathew Varghese', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3535, 'EE1037', 'EE1037', 'EE1037', '0008374630', 'Prasanth K.G.', 'Staff', 'Teaching', 'Assistant Professor', 'EE', 'Working'),
(3536, 'EE1038', 'EE1038', 'EE1038', '0007610868', 'Lordson Devasia', 'Staff', 'Teaching', 'Assistant Professor', 'EE', 'Working'),
(3537, 'CE1051', 'CE1051', 'CE1051', '0007609268', 'Christina Jacob', 'Staff', 'Teaching', 'Assistant Professor', 'CE', 'Working'),
(3538, 'CE1052', 'CE1052', 'CE1052', '0008373413', 'Abhijith L.', 'Staff', 'Teaching', 'Assistant Professor', 'CE', 'Working'),
(3540, '4813', '4813', '171020', '0007610811', 'Sony K Mathew', 'Student', 'B.Tech', 'S4', 'EC', 'Studying'),
(3542, '4815', '4815', '171016', '0007559320', 'Sherin Reba Philip', 'Student', 'B.Tech', 'S4', 'EC', 'Studying'),
(3543, '4816', '4816', '171018', '0007610814', 'Sibi Thomas John', 'Student', 'B.Tech', 'S4', 'EC', 'Studying'),
(3544, '4817', '4817', '171017', '0007610480', 'Shijin Shaji', 'Student', 'B.Tech', 'S4', 'EC', 'Studying'),
(3545, '4818', '4818', '171015', '0007559319', 'Shambhu S', 'Student', 'B.Tech', 'S4', 'EC', 'Studying'),
(3546, '4819', '4819', '171013', '0007559309', 'Nibin Binoy', 'Student', 'B.Tech', 'S4', 'EC', 'Studying'),
(3547, '4820', '4820', '171012', '0007559082', 'Mons Joseph', 'Student', 'B.Tech', 'S4', 'EC', 'Studying'),
(3548, '4821', '4821', '171010', '0007611399', 'Joanna John Thomas', 'Student', 'B.Tech', 'S4', 'EC', 'Studying'),
(3549, '4822', '4822', '171009', '0007609488', 'Jithin Koshy Jacob', 'Student', 'B.Tech', 'S4', 'EC', 'Studying'),
(3550, '4823', '4823', '171008', '0007609487', 'Jeevan Jose', 'Student', 'B.Tech', 'S4', 'EC', 'Studying'),
(3551, '4824', '4824', '171006', '0007632418', 'Gowtham T', 'Student', 'B.Tech', 'S4', 'EC', 'Studying'),
(3552, '4825', '4825', '171005', '0007632261', 'Ben Kurian', 'Student', 'B.Tech', 'S4', 'EC', 'Studying'),
(3553, '4826', '4826', '171004', '0008341914', 'Aravind Chandran', 'Student', 'B.Tech', 'S4', 'EC', 'Studying'),
(3554, '4827', '4827', '171014', '0007559310', 'Priyanka Sunny', 'Student', 'B.Tech', 'S4', 'EC', 'Studying'),
(3556, '4829', '4829', '172022', '0015164314', 'Jismol Mathew', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3557, '4830', '4830', '172019', '0015157914', 'Geethu Gopakumar', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3558, '4831', '4831', '172017', '0015170223', 'Flemin V S', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3559, '4832', '4832', '172016', '0015170419', 'Dona Ritto Raju', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3560, '4833', '4833', '172015', '0015172149', 'Blessy M Yasudasan', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3561, '4834', '4834', '172014', '0015172337', 'Basil P Varghese', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3562, '4835', '4835', '172013', '0015158033', 'Avani Saji', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3563, '4836', '4836', '172012', '0015172719', 'Athira Soman', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3566, '4839', '4839', '172006', '0007609261', 'Allen Abraham Varghese', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3567, '4840', '4840', '172005', '0007609260', 'Alexy Meppurathu Binu', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3568, '4841', '4841', '171001', '0007561352', 'Ajas Thomas', 'Student', 'B.Tech', 'S4', 'EC', 'Studying'),
(3570, '4843', '4843', '172003', '0007608947', 'Achumon R', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3571, '4844', '4844', '172002', '0007557412', 'Aaron Jacob Thomas', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3572, '4845', '4845', '172047', '0007610652', 'Tony K John', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3573, '4846', '4846', '172046', '0007610653', 'Tom C Jesus', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3574, '4847', '4847', '172045', '0007610662', 'Teddy Thomas', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3575, '4848', '4848', '172044', '0006546342', 'Sonia Rachel Thomas', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3576, '4849', '4849', '172043', '0007588449', 'Sona John', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3577, '4850', '4850', '172042', '0007612375', 'Sinu M Joseph', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3578, '4851', '4851', '172041', '0007612366', 'Sibin Sam', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3579, '4852', '4852', '172039', '0007611410', 'Shilpa Biju', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3580, '4853', '4853', '172037', '0007610869', 'Serin Susan Sunny', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3581, '4854', '4854', '172036', '0007610870', 'Saurav Sadanandan', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3582, '4855', '4855', '172034', '0007610668', 'Niviya Varghese', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3583, '4856', '4856', '172033', '0007612106', 'Nithin Sunny', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3584, '4857', '4857', '172032', '0007588428', 'Nissy Elsa Jacob', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3585, '4858', '4858', '172030', '0007588418', 'Liya P S', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3586, '4859', '4859', '172029', '0015162852', 'Karun Kumar C P', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3588, '4861', '4861', '172026', '0007612146', 'Johncy Ann George', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3589, '4862', '4862', '172040', '0007612365', 'Shybin Sam Mathew', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3590, '4863', '4863', '172024', '0015154595', 'Jobin George Kurian', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3591, '4864', '4864', '174027', '0007589704', 'Sreejith K G', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3592, '4865', '4865', '174026', '0007589493', 'Smitha Mariyam Samson', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3593, '4866', '4866', '174025', '0007589497', 'Sibil P Thomas', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3594, '4867', '4867', '174022', '0015177177', 'Savin Tomy', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3595, '4868', '4868', '174021', '0007610564', 'Robin Sam', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3596, '4869', '4869', '174019', '0007556194', 'Rithin Rajan', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3597, '4870', '4870', '174018', '0007556197', 'Rijo Yohannan', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3598, '4871', '4871', '174012', '0007557411', 'Hanna Sara Abey', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3599, '4872', '4872', '174009', '0007616483', 'Binil Abraham', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3600, '4873', '4873', '174008', '0007609262', 'Ansu Sara Mathew', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3601, '4874', '4874', '174007', '0007609269', 'Anandhu Anil', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3602, '4875', '4875', '174006', '0007609272', 'Amalu Sebastian', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3603, '4876', '4876', '174005', '0007613706', 'Alen Alexander', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3605, '4878', '4878', '174001', '0007588443', 'Abhiram K Ashok', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3606, '4879', '4879', '175001', '0006453430', 'Abel Varkey Varghese', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3607, '4880', '4880', '175002', '0007612374', 'Abhishek Varghese', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3608, '4881', '4881', '175003', '0007608864', 'Abin Saji Issac', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3609, '4882', '4882', '175004', '0007610654', 'Abin Thomas', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3610, '4883', '4883', '171002', '0007561351', 'Akash M J', 'Student', 'B.Tech', 'S4', 'EC', 'Studying'),
(3611, '4884', '4884', '175007', '0007612364', 'Amal Kuriakose', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3613, '4886', '4886', '175009', '0007611408', 'Aphrems K Jose', 'Student', 'B.Tech', 'S4', 'ME', 'Studying');
INSERT INTO `user_details` (`sl_no`, `login_id`, `userid`, `card_id`, `smart_id`, `user_name`, `user_category`, `sub_category`, `semester`, `branch`, `user_status`) VALUES
(3614, '4887', '4887', '175010', '0007588448', 'Ashwin R', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3615, '4888', '4888', '175011', '0007610664', 'Bobi Sam Thomas', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3616, '4889', '4889', '175013', '0015178504', 'Derlin Ann Bennet', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3617, '4890', '4890', '175014', '0015158194', 'Elson Philip', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3618, '4891', '4891', '175015', '0015155555', 'George P J', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3619, '4892', '4892', '175016', '0015152999', 'Georgie Juddy Joseph', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3620, '4893', '4893', '175038', '0007616418', 'Pratheesh G', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3621, '4894', '4894', '175017', '0015152809', 'Hansal Shanty', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3622, '4895', '4895', '175019', '0015167582', 'Jais Jacob', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3623, '4896', '4896', '175020', '0007589530', 'Jeevan Biju', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3624, '4897', '4897', '175021', '0007589527', 'Jeevan James Abraham', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3625, '4898', '4898', '175025', '0007589432', 'Jerin Ani', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3626, '4899', '4899', '175029', '0007584298', 'Kevin George', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3629, '4902', '4902', '175031', '0015141578', 'Leo Philips Philips Thomas', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3630, '4903', '4903', '175032', '0015140057', 'Libin Y', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3631, '4904', '4904', '175036', '0007613368', 'Nixon C Prinson', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3632, '4905', '4905', '175037', '0007616398', 'Prabhu Lal Krishna A', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3633, '4906', '4906', '175039', '0007608866', 'Richu Harees', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3634, '4907', '4907', '175041', '0007608876', 'Rony Abraham James', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3635, '4908', '4908', '175043', '0007612140', 'Sarath Krishna  S', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3636, '4909', '4909', '175044', '0007612137', 'Sebin Thomas', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3637, '4910', '4910', '175045', '0007612226', 'Sebin V Babychen', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3638, '4911', '4911', '175046', '0007612223', 'Sumin George Geevarghese', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3639, '4912', '4912', '175047', '0007612127', 'Vishnu Rajan', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3640, '4913', '4913', '177002', '0007608877', 'Abhinandh P S', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3641, '4914', '4914', '177003', '0007588719', 'Aby B Jacob', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3644, '4917', '4917', '177007', '0007610524', 'Ajin P George', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3646, '4951', '4951', '177009', '0007617389', 'Aju Abraham', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3647, '4920', '4920', '177012', '0007608782', 'Amalu Saji', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3648, '4921', '4921', '177014', '0007611526', 'Anandu E Shaji', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3649, '4922', '4922', '177018', '0007611614', 'Anjali Sara Mathew', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3650, '4923', '4923', '177019', '0007611557', 'Ann Maria James', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3652, '4925', '4925', '177022', '', 'Aziel Susan Vinod', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3653, '4926', '4926', '177024', '0007609478', 'Chaithra Sabu', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3654, '4927', '4927', '177025', '0007610482', 'Feba  Mariam Thomas', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3655, '4928', '4928', '177029', '0007610803', 'Jerin Chethimattathil Joseph', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3657, '4930', '4930', '177027', '0007610813', 'Jaik Jacob Mathew', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3659, '4932', '4932', '177028', '0007610812', 'Jeena P Koshy', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3660, '4933', '4933', '177031', '0007588435', 'Jijo Varghese', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3661, '4934', '4934', '177032', '0007588434', 'Livya Mariam Varkey', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3662, '4935', '4935', '177033', '0007610563', 'Mahima K Sanal', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3663, '4936', '4936', '177036', '0007556205', 'Sanjana Biju', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3664, '4937', '4937', '177037', '0007556206', 'Sharika Soman', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3665, '4938', '4938', '177038', '0007556803', 'Sijo J Saji', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3666, '4939', '4939', '175024', '0007590592', 'Jeffy B John', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3670, '4941', '4941', '174024', '0007589504', 'Sheik Abdulla', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3671, '4942', '4942', '177030', '0007588444', 'Jestin  Sunny', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3672, '4943', '4943', '177034', '0007556195', 'Ruth Mariam James', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3674, '4945', '4945', '175042', '0007612147', 'Roshin  Roy Thomas', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3675, '4946', '4946', '162064', '0007613371', 'Anita Joseph', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3676, 'SH1030', 'SH1030', 'SH1030', '0008252994', 'Abel George', 'Staff', 'Teaching', 'Assistant Professor', 'SH', 'Working'),
(3678, '4947', '4947', NULL, '0015150276', 'Yadhukrishnan V B', 'Student', 'B.Tech', 'S6', 'CE', 'Studying'),
(3679, '4948', '4948', NULL, '0007588522', 'Nikhil Varghese Boby', 'Student', 'B.Tech', 'S6', 'ME', 'Studying'),
(3680, '4949', '4949', '172027', '0015151473', 'Joshy N Samuel', 'Student', 'B.Tech', 'S4', 'CS', 'Studying'),
(3682, '100019', '100019', NULL, '', 'Jeena Raju Poikayil', 'Student', 'M.Tech', 'S1', 'CO', 'Studying'),
(3684, '100021', '100021', '179001', '0007588721', 'Anand Y', 'Student', 'M.Tech', 'S4', 'CP', 'Studying'),
(3685, '100022', '100022', '179002', '0007588724', 'Aswathy S', 'Student', 'M.Tech', 'S4', 'CP', 'Studying'),
(3686, '100023', '100023', '179003', '0007588258', 'Athira Sajeevan', 'Student', 'M.Tech', 'S4', 'CP', 'Studying'),
(3687, '100024', '100024', '179005', '0007588533', 'Peter Jose Morris', 'Student', 'M.Tech', 'S4', 'CP', 'Studying'),
(3688, '100025', '100025', '179006', '0007588536', 'Reshma K Rajan', 'Student', 'M.Tech', 'S4', 'CP', 'Studying'),
(3689, '100026', '100026', '179007', '0007588543', 'Reshma Sherin Jacob', 'Student', 'M.Tech', 'S4', 'CP', 'Studying'),
(3690, '100027', '100027', '179008', '0007588737', 'Surya Suresh', 'Student', 'M.Tech', 'S4', 'CP', 'Studying'),
(3696, '4919', '4919', '174014', '0007557421', 'Jerin Kuttikkattil Renny', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3697, '4952', '4952', '174015', '0007556804', 'Jomi Joseph', 'Student', 'B.Tech', 'S4', 'EE', 'Studying'),
(3698, '4953', '4953', '142051', '', 'Jobin Joseph', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(3699, '4954', '4954', '142052', '', 'Ramkumar Raju', 'Student', 'B.Tech', 'S8', 'CS', 'Studying'),
(3701, '100029', '100029', '179004', '0007615804', 'Jitti Annie Abraham', 'Student', 'M.Tech', 'S4', 'CP', 'Studying'),
(3706, 'SH1032', 'SH1032', 'SH1032', '0007588419', 'Bibin Thomas', 'Staff', 'Teaching', 'Assistant Professor', 'SH', 'Working'),
(3709, 'SH1033', 'SH1033', 'SH1033', '0007612218', 'Edin K Abraham', 'Staff', 'Teaching', 'Physical Education A', 'SH', 'Working'),
(3710, 'SE3018', 'SE3018', 'SE3018', '0006453427', 'Vinodkumar', 'Staff', 'Non-teaching', 'Security Staff', 'SE', 'Working'),
(3713, 'CE1056', 'CE1056', 'CE1056', '', 'Jithin P. Zachariah', 'Staff', 'Teaching', 'Assistant Professor', 'CE', 'Working'),
(3715, 'CS1032', 'CS1032', 'CS1032', '', 'Rahul Ajithkumar', 'Staff', 'Teaching', 'Assistant Professor', 'CS', 'Working'),
(3716, 'CS1033', 'CS1033', 'CS1033', '', 'Anju V. Abraham', 'Staff', 'Teaching', 'Assistant Professor', 'CS', 'Working'),
(3719, 'CS1034', 'CS1034', 'CS1034', '', 'Anju Rachel Oommen', 'Staff', 'Teaching', 'Assistant Professor', 'CS', 'Working'),
(3721, '4955', '4955', '187044', '0007610672', 'Sugin N George', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3723, '4957', '4957', '187027', '0007609506', 'Josmy Jacob', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3724, '4958', '4958', '181034', '0007612363', 'Sona Mariya Baby', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3725, '4959', '4959', '187013', '0015156235', 'Betty Varghese', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3726, '4960', '4960', '182027', '0007588441', 'Riya K Vinod', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3727, '4961', '4961', '181032', '0007615271', 'Seruba Sam', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3728, '4962', '4962', '181016', '0007609582', 'Gifty Mol T R', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3729, '4963', '4963', '181010', '0007613711', 'Britty B Mathew', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3730, '4964', '4964', '181017', '0007609579', 'Gilsmon P Cherian', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3731, '4965', '4965', '187010', '0007613572', 'Ashik S John', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3732, '4966', '4966', '185033', '0007617506', 'Roy J Ben', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3733, '4967', '4967', '187001', '0007588720', 'Adithyasankar R', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3734, '4968', '4968', '182015', '0007613779', 'Emil Jacob John', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3735, '4969', '4969', '182040', '0007612369', 'Tibin Sunny', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3736, '4970', '4970', '184006', '0015178222', 'Anandhu S', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3738, '4972', '4972', '182025', '0007610569', 'Prince Babu', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3739, '4973', '4973', '187025', '0007610802', 'Jintu Johnson', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3740, '4974', '4974', '187024', '0007609075', 'Jincy Ann Jiji', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3741, '4975', '4975', '187037', '0006546341', 'Rachel N Raju', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3742, '4976', '4976', '187014', '0007557314', 'Bharathi R K', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3743, '4977', '4977', '187045', '0007612112', 'Susan K Uthuppan', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3744, '4978', '4978', '187041', '0007608777', 'Saif Ali Khan', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3745, '4979', '4979', '187035', '0015162260', 'Praveena M', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3746, '4980', '4980', '187030', '0007610530', 'Kishan Suresh', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3747, '4981', '4981', '187009', '0007588755', 'Anu Antony', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3749, '4983', '4983', '182009', '0007611916', 'Ashik Saleem', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3750, '4984', '4984', '185030', '0007617393', 'Nazeeb Hussain  M M', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3751, '4985', '4985', '185014', '0015178364', 'Danny Varghese', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3752, '4986', '4986', '185029', '0007617392', 'Midhun P Abraham', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3753, '4987', '4987', '185032', '0007608779', 'Richu K Philip', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3754, '4988', '4988', '185017', '0007588735', 'Dino Thomas', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3755, '4989', '4989', '185021', '0007615793', 'Jerrin P Jacob', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3756, '4990', '4990', '185019', '0007615803', 'Jaison Mathew', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3757, '4991', '4991', '185001', '0007610491', 'Abin Alex', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3758, '4992', '4992', '185004', '0007611832', 'Akhil Reji', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3759, '4993', '4993', '185028', '0007610527', 'Mebin Mathew', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3760, '4994', '4994', '185007', '0007611572', 'Andrish Varghese Kurian', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3761, '4995', '4995', '182032', '0007589499', 'Shalu Merin John', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3763, '4997', '4997', '184033', '0007610756', 'Syril Thomas Ajith', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3764, '4998', '4998', '184009', '0007590624', 'Bincymol Samuel', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3765, '4999', '4999', '184027', '0015150606', 'Saju Varghese', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3766, '5000', '5000', '184018', '0007585344', 'Irin Elsa Peter', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3767, '5001', '5001', '184017', '0007589369', 'Gopika Gopan', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3768, '5002', '5002', '187006', '0007584019', 'Anciya V Nazar', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3769, '5003', '5003', '181012', '0007610478', 'Dhanoop Dhanapalan', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3770, '5004', '5004', '181011', '0007610816', 'Davidson G Thomas', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3771, '5005', '5005', '181004', '0007588446', 'Albin S Mathew', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3772, '5006', '5006', '181019', '0007609562', 'Jabin Babu', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3773, '5007', '5007', '181037', '0007588447', 'Vinayak Ghosh', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3774, '5008', '5008', '187017', '0015158962', 'Deeptha Thomas', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3775, '5009', '5009', '187002', '0007588725', 'Ajesh S Kumar', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3776, '5010', '5010', '185024', '0007588723', 'Joel Thomas', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3779, '5013', '5013', '181002', '0007611413', 'Aju Alex', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3780, '5014', '5014', '181003', '0007611406', 'Akhila Anns Jacob', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3781, '5015', '5015', '181005', '0007610666', 'Alby Mareena Varghese', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3782, '5016', '5016', '181006', '0007610659', 'Alwin George Philip', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3783, '5017', '5017', '181007', '0007610656', 'Ashina Aziz', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3784, '5018', '5018', '181008', '0007608862', 'Ayana Rachel Kuriakose', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3785, '5019', '5019', '181009', '0007613708', 'Benet Elsa Thomas', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3786, '5020', '5020', '181013', '0007610485', 'Elias Prince', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3787, '5021', '5021', '181014', '0007609592', 'Geevar Jacob', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3788, '5022', '5022', '181015', '0007609589', 'Georgekuty Binu', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3789, '5023', '5023', '181018', '0007611560', 'Heera Hari', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3790, '5024', '5024', '175048', '0015141454', 'Abel Sanjay', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3791, '5025', '5025', '162065', '0007589433', 'Ashly T Jose', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3792, '5026', '5026', '162066', '0007613575', 'Helan Abey', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3793, '5027', '5027', '162067', '0007613574', 'Iline Rachel Biju', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3794, '5028', '5028', '162068', '0007608874', 'Jeena Mary Kurian', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3795, '5029', '5029', '162069', '0007588753', 'Sumesh Kumar M S', 'Student', 'B.Tech', 'S6', 'CS', 'Studying'),
(3796, '5030', '5030', '171022', '0015139909', 'Jyothis T James', 'Student', 'B.Tech', 'S4', 'EC', 'Studying'),
(3797, '5031', '5031', '181022', '0007613442', 'Jithin R', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3798, '5032', '5032', '181020', '0007609567', 'Jaimon Monichan', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3799, '5033', '5033', '181021', '0007609572', 'James B Koshy', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3800, '5034', '5034', '181023', '0007613437', 'Libin Varghese', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3801, '5035', '5035', '181024', '0007611611', 'Lijin Wilson', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3802, '5036', '5036', '181025', '0007611620', 'Linumol Mathew', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3803, '5037', '5037', '181026', '0007611539', 'Megha Prasad', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3804, '5038', '5038', '181027', '0007611530', 'Melwen T Abraham', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3805, '5039', '5039', '181028', '0007611529', 'Neenu Jose', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3806, '5040', '5040', '181029', '0007613953', 'Nijin Joy', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3808, '5042', '5042', '181030', '0007589680', 'Rahana Raju', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3809, '5043', '5043', '181031', '0007615272', 'Rosily J', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3810, '5044', '5044', '181033', '0007589529', 'Shilpa Chandy', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3811, '5045', '5045', '181035', '0007611412', 'Stella C Rajan', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3812, '5046', '5046', '181036', '0007611407', 'Subin Abraham', 'Student', 'B.Tech', 'S2', 'EC', 'Studying'),
(3813, '5047', '5047', '182004', '0007613520', 'Ajith M James', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3814, '5048', '5048', '182001', '0007588431', 'Abin Oommen Joseph', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3815, '5049', '5049', '182002', '0007588424', 'Afraim Joseph', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3816, '5050', '5050', '182003', '0007588421', 'Aibin Thomas Mathew', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3817, '5051', '5051', '182005', '0007613517', 'Akash C Babu', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3818, '5052', '5052', '182006', '0007612216', 'Amal Santhosh', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3819, '5053', '5053', '182007', '0007616397', 'Amina Ubaid', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3821, '5055', '5055', '182008', '0007611923', 'Ansu Sara Shajan', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3822, '5056', '5056', '182011', '0007611264', 'Athul Baby', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3823, '5057', '5057', '182012', '0007613241', 'Diya Navneeth Prasad', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3824, '5058', '5058', '182013', '0007613248', 'Don Joseph', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3825, '5059', '5059', '182014', '0007613251', 'Ebinu Suneer', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3826, '5060', '5060', '182016', '0007589678', 'Jeffery Thomas Paul', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3827, '5061', '5061', '182018', '0007556199', 'Jithin T Jacob', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3828, '5062', '5062', '182019', '0007556227', 'Jitin Joby', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3829, '5063', '5063', '182020', '0007611547', 'Joel Jacob', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3830, '5064', '5064', '182021', '0007611605', 'Joel Mathews', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3831, '5065', '5065', '182030', '0007590625', 'Rosemary Scaria', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3832, '5066', '5066', '182026', '0007588438', 'Richy Thampi', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3833, '5067', '5067', '182028', '0007610806', 'Rohan Moses', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3834, '5068', '5068', '182028', '0007610809', 'Rony Zacharia George', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3835, '5069', '5069', '182031', '0007616419', 'Sandra Ann Sunny', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3836, '5070', '5070', '182033', '0007589491', 'Sharon P Raju', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3839, '5073', '5073', '182034', '0007589706', 'Shijin George Stephen', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3840, '5074', '5074', '182035', '0007588788', 'Shijin Joseph', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3841, '5075', '5075', '182036', '0007583307', 'Sijo John Thomas', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3842, '5076', '5076', '182037', '0007583310', 'Sneha Mariam Chacko', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3843, '5077', '5077', '182038', '0007583317', 'Solamon J Purackan', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3844, '5078', '5078', '182039', '0007612372', 'Soumya M S', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3846, '5080', '5080', '184001', '0007610665', 'Abhijith Soman', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3847, '5081', '5081', '184002', '0007610660', 'Abiya Mariam Mathew', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3848, '5082', '5082', '184003', '0007610655', 'Albi Jinu', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3849, '5083', '5083', '184004', '0007608863', 'Amalkrishna A', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3850, '5084', '5084', '184005', '0015158812', 'Ameer Khan K N', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3852, '5086', '5086', '184031', '0007610766', 'Sradha K.S.', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3853, '5087', '5087', '184008', '0015176545', 'Biminu Biju', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3854, '5088', '5088', '184010', '0007589500', 'Blessy Thomas', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3855, '5089', '5089', '184011', '0007577487', 'Bronymon Babu', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3856, '5090', '5090', '184013', '0007585343', 'Danin Reji', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3857, '5091', '5091', '184014', '0007585331', 'Dipu T Rajesh', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3858, '5092', '5092', '184015', '0007613947', 'Drishya R', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3859, '5093', '5093', '184012', '0007577478', 'Cyril Mathew George', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3860, '5094', '5094', '184016', '0007585332', 'George Joseph', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3861, '5095', '5095', '184019', '0015149742', 'Jobin Mathew Abraham', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3863, '5097', '5097', '184020', '0015151554', 'Nandakishore M', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3864, '5098', '5098', '184025', '0015152356', 'Nithin Varghese', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3865, '5099', '5099', '184021', '0015151740', 'Nibin Siby Varghese', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3866, '5100', '5100', '184022', '0015164279', 'Nidhin S Pillai', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3867, '5101', '5101', '184024', '0015170213', 'Nithin Manoj', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3868, '5102', '5102', '184023', '0015170017', 'Nidhin V Raj', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3869, '5103', '5103', '184028', '0015172419', 'Sanjay Manikkuttan', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3870, '5104', '5104', '184026', '0015169312', 'Sajan Saji', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3871, '5105', '5105', '184029', '0015174246', 'Shinoy John', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3872, '5106', '5106', '184030', '0015174424', 'Sijo Abraham', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3873, '5107', '5107', '184032', '0007610765', 'Stalin Varghese Mathew', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3874, '5108', '5108', '184034', '0007610755', 'Tony James', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3875, '5109', '5109', '184035', '0007610743', 'Veena Prasad', 'Student', 'B.Tech', 'S2', 'EE', 'Studying'),
(3876, '5110', '5110', '185002', '0007611822', 'Adarsh T', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3877, '5111', '5111', '185003', '0007584027', 'Akhil Dev Aji', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3878, '5112', '5112', '185005', '0007613370', 'Amal Dev Aji', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3879, '5113', '5113', '185008', '0007617359', 'Arif T Kabeer', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3880, '5114', '5114', '185009', '0007617360', 'Basil Jacob Cherian', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3881, '5115', '5115', '185010', '0007617369', 'Bestin Babu', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3882, '5116', '5116', '185011', '0007611615', 'Bijin Binu', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3883, '5117', '5117', '185006', '0007611562', 'Anandu M Pillay', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3884, '5118', '5118', '185012', '0007611616', 'Bijin K Babu', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3885, '5119', '5119', '185013', '0015158606', 'Christy Mathew Thomas', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3886, '5120', '5120', '185015', '0015177932', 'Davis Martin', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3887, '5121', '5121', '185016', '0015176863', 'Dennies Saji Varghese', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3888, '5122', '5122', '185018', '0007588736', 'Dylan Sangeeth', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3889, '5123', '5123', '185020', '0007615802', 'Jaiwin Samuel', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3890, '5124', '5124', '185022', '0007588713', 'Jeswin T Varghese', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3891, '5125', '5125', '185023', '0007588722', 'Jinson Joy', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3892, '5126', '5126', '185025', '0007612119', 'Justin Thomas', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3893, '5127', '5127', '185027', '0007610528', 'Mathew A Jacob', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3894, '5128', '5128', '185031', '0007617402', 'Nirmal Babu', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3895, '5129', '5129', '185034', '0007617497', 'Sanju  Sekhar', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3896, '5130', '5130', '185035', '0007617496', 'Sharon Tony', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3897, '5131', '5131', '185036', '0007588219', 'Sheldon Johny', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3898, '5132', '5132', '185038', '0007632260', 'Shibin  S Philip', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3899, '5133', '5133', '185037', '0007632417', 'Sherin Saji', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3900, '5134', '5134', '185040', '0007561350', 'Shine George Simon', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3901, '5135', '5135', '185042', '0007590583', 'Sneha Susan Johnson', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3902, '5136', '5136', '185043', '0007584017', 'Sonu Kunjumon', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3903, '5137', '5137', '185044', '0007590584', 'Vinil John Mathew', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3904, '5138', '5138', '185046', '0007590593', 'Vishnu Satheesh', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3905, '5139', '5139', '185039', '0007590810', 'Shijin Chacko', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3906, '5140', '5140', '185045', '0007584026', 'Vishnu Binu', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3907, '5141', '5141', '187003', '0007612121', 'Ajith M G', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3908, '5142', '5142', '187004', '0007613929', 'Aleena Mariyam Mathew', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3909, '5143', '5143', '187005', '0007613924', 'Anandhu Ajith', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3910, '5144', '5144', '187007', '0007584024', 'Aneeta Thankam Mathew', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3911, '5145', '5145', '187011', '0007612126', 'Ashique Muhammed', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3912, '5146', '5146', '187012', '0015156034', 'Ashwany Ajith', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3913, '5147', '5147', '187015', '0007557184', 'Bibin Thankachan', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3914, '5148', '5148', '187016', '0007557323', 'Cijo Jose', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3915, '5149', '5149', '187018', '0015148623', 'Eldhose Siju', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3916, '5150', '5150', '187019', '0006456383', 'Esther Ani Josen', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3917, '5151', '5151', '187020', '0007613369', 'Gladson Varghese', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3918, '5152', '5152', '187038', '0007588524', 'Rathika R', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3919, '5153', '5153', '187021', '0007610748', 'Jackson Thomas Johnson', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3920, '5154', '5154', '187022', '0007610749', 'Jestin James', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3921, '5155', '5155', '187023', '0007609076', 'Jibin V Thomas', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3922, '5156', '5156', '187026', '0007609505', 'Joel Baby', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3923, '5157', '5157', '187029', '0007609686', 'Kevin George Sabu', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3924, '5158', '5158', '187032', '0007613931', 'Midhun K Varghese', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3925, '5159', '5159', '187033', '0007617395', 'Mithun Madhusudhanan', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3926, '5160', '5160', '187034', '0007617400', 'Nishan Mathews', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3927, '5161', '5161', '187036', '0015162469', 'Priya K', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3928, '5162', '5162', '187039', '0007588517', 'Riya Susan Varghese', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3929, '5163', '5163', '187040', '0007608770', 'Rohan P Koshy', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3930, '5164', '5164', '187042', '0007610866', 'Sajan Saji', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3931, '5165', '5165', '187043', '0007610873', 'Sona Ann Eby', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3932, '5166', '5166', '187046', '0007612109', 'Vasanth K', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3933, '5167', '5167', '187008', '0007584029', 'Anit Ann Thomas', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3934, '5168', '5168', '187028', '0007609687', 'Juby Sebastian', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3936, '5170', '5170', '175049', '0015141328', 'Shehil Ismail', 'Student', 'B.Tech', 'S4', 'ME', 'Studying'),
(3937, '5171', '5171', '177041', '0015139759', 'Jeeva Melettu', 'Student', 'B.Tech', 'S4', 'CE', 'Studying'),
(3938, 'EC1052', 'EC1052', 'EC1052', '', 'Dr. Anoop T.R.', 'Staff', 'Teaching', 'Associate Professor', 'EC', 'Working'),
(3939, 'EC1053', 'EC1053', 'EC1053', '', 'Asha R.S.', 'Staff', 'Teaching', 'Assistant Professor', 'EC', 'Working'),
(3940, '5172', '5172', '187031', '0007610525', 'Krishna Prasad P S', 'Student', 'B.Tech', 'S2', 'CE', 'Studying'),
(3941, '5173', '5173', '182023', '0007610559', 'Leon James', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3942, '5174', '5174', '182010', '0007615789', 'Astin Kurien  Siby', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3943, 'CE1059', 'CE1059', 'CE1059', '0007584018', 'Dr. Chithra V.S.', 'Staff', 'Teaching', 'Associate Professor', 'CE', 'Working'),
(3945, 'EC1054', 'EC1054', 'EC1054', '0007556198', 'Anju C. Achankunju', 'Staff', 'Teaching', 'Assistant Professor', 'CS', 'Working'),
(3946, 'ME1053', 'ME1053', 'ME1053', '0007557415', 'Abdul Rahman K.', 'Staff', 'Teaching', 'Assistant Professor', 'ME', 'Working'),
(3947, '100030', '100030', '189002', '0007612225', 'Anju G S', 'Student', 'M.Tech', 'S2', 'CP', 'Studying'),
(3948, '100031', '100031', '189004', '0007612139', 'Nissu Simon', 'Student', 'M.Tech', 'S2', 'CP', 'Studying'),
(3949, '100032', '100032', '189005', '0007612148', 'Reshma Susan Biju', 'Student', 'M.Tech', 'S2', 'CP', 'Studying'),
(3950, '100033', '100033', '189001', '0007612224', 'Aleena Sebastian', 'Student', 'M.Tech', 'S2', 'CP', 'Studying'),
(3952, '5175', '5175', '182017', '0007556202', 'Jisha Varghese', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3953, '5176', '5176', '182024', '0007610566', 'Loriene Brighty Kishore', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3954, '100035', '100035', '188001', '0007608875', 'Anu G S', 'Student', 'M.Tech', 'S2', 'CO', 'Studying'),
(3955, '100036', '100036', '188002', '0007584296', 'Bijila Susan Viju', 'Student', 'M.Tech', 'S2', 'CO', 'Studying'),
(3956, 'SE3019', 'SE3019', 'SE3019', '0006453411', 'G. Vincent', 'Staff', 'Teaching', 'Security Staff', 'SE', 'Working'),
(3957, 'SE3020', 'SE3020', 'SE3020', '0006453293', 'V.A James', 'Staff', 'Teaching', 'Security Staff', 'SE', 'Working'),
(3958, '5177', '5177', '185026', '0007612128', 'Kannan P S', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3959, '5178', '5178', '182022', '0007611606', 'Kripa Mariam Sunny', 'Student', 'B.Tech', 'S2', 'CS', 'Studying'),
(3960, '5179', '5179', '185041', '0007589528', 'Shivashankar S', 'Student', 'B.Tech', 'S2', 'ME', 'Studying'),
(3961, '100037', '100037', '188003', '0015139456', 'Suja Susan Thomas', 'Student', 'M.Tech', 'S2', 'CO', 'Studying'),
(3963, '100038', '100038', '189003', '0007612138', 'Appu Thankappan', 'Student', 'M.Tech', 'S2', 'CP', 'Studying'),
(3965, 'AD2002', 'AD2002', 'AD2002', '0006453290', 'K.A. Abraham', 'Staff', 'Administrative', 'Bursar', 'AD', 'Working'),
(3966, 'SE3022', 'SE3022', 'SE3022', '0007584286', 'Joseph George', 'Staff', 'Non-teaching', 'Security Staff', 'SE', 'Working'),
(3967, 'SE3023', 'SE3023', 'SE3023', '0007584287', 'V.E. Thomas', 'Staff', 'Non-teaching', 'Security Staff', 'SE', 'Working'),
(3968, 'EE1040', 'EE1040', 'EE1040', '0006453282', 'Dr. Anoop K.J', 'Staff', 'Teaching', 'Professor', 'EE', 'Working'),
(3969, 'EE1041', 'EE1041', 'EE1041', '0006453279', 'K. Kanchana', 'Staff', 'Teaching', 'Associate Professor', 'EE', 'Working'),
(3970, 'ME1054', 'ME1054', 'ME1054', '0006453396', 'Anu Nair P.', 'Staff', 'Teaching', 'Assistant Professor', 'ME', 'Working'),
(3971, 'ME1055', 'ME1055', 'ME1055', '0006449020', 'Febin Felix', 'Staff', 'Teaching', 'Assistant Professor', 'ME', 'Working'),
(3972, 'CS1036', 'CS1036', 'CS1036', '0006453204', 'Dr. Teena Joseph', 'Staff', 'Teaching', 'Associate Professor', 'CS', 'Working'),
(3973, 'CE1060', 'CE1060', 'CE1060', '0006453404', 'Manoj Nallanathel', 'Staff', 'Teaching', 'Associate Professor', 'CE', 'Working'),
(3974, 'CE1061', 'CE1061', 'CE1061', '0006453420', 'Molsy Joseph', 'Staff', 'Teaching', 'Assistant Professor', 'CE', 'Working'),
(3975, 'CE2007', 'CE2007', 'CE2007', '', 'Jojin K. Abraham', 'Staff', 'Teaching', 'Lab Instructor Grade', 'CE', 'Working'),
(3976, 'SE3024', 'SE3024', 'SE3024', '', 'John Varghese', 'Staff', 'Teaching', 'Security Staff', 'SE', 'Working');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_details`
--
ALTER TABLE `admin_details`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `entry_register`
--
ALTER TABLE `entry_register`
  ADD UNIQUE KEY `sl_no` (`sl_no`),
  ADD UNIQUE KEY `sl_no_2` (`sl_no`);

--
-- Indexes for table `inv_admins`
--
ALTER TABLE `inv_admins`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `inv_category`
--
ALTER TABLE `inv_category`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `inv_config`
--
ALTER TABLE `inv_config`
  ADD UNIQUE KEY `section_id` (`section_id`),
  ADD UNIQUE KEY `organisation` (`organisation`);

--
-- Indexes for table `inv_current_bill`
--
ALTER TABLE `inv_current_bill`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `inv_distribution`
--
ALTER TABLE `inv_distribution`
  ADD PRIMARY KEY (`sl_no`),
  ADD UNIQUE KEY `stock_no` (`stock_no`,`dist_indent_no`);

--
-- Indexes for table `inv_history`
--
ALTER TABLE `inv_history`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `inv_items`
--
ALTER TABLE `inv_items`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `inv_purchase_log`
--
ALTER TABLE `inv_purchase_log`
  ADD PRIMARY KEY (`sl_no`),
  ADD UNIQUE KEY `invoice_no` (`invoice_no`);

--
-- Indexes for table `inv_sales_log`
--
ALTER TABLE `inv_sales_log`
  ADD PRIMARY KEY (`bill_no`);

--
-- Indexes for table `inv_sections`
--
ALTER TABLE `inv_sections`
  ADD UNIQUE KEY `section_name` (`section_name`,`section_id`);

--
-- Indexes for table `inv_stock`
--
ALTER TABLE `inv_stock`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `inv_stock_request`
--
ALTER TABLE `inv_stock_request`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `inv_supplier`
--
ALTER TABLE `inv_supplier`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `inv_type`
--
ALTER TABLE `inv_type`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `labs`
--
ALTER TABLE `labs`
  ADD PRIMARY KEY (`sl_no`),
  ADD UNIQUE KEY `lab_id` (`lab_id`);

--
-- Indexes for table `system_master`
--
ALTER TABLE `system_master`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`sl_no`),
  ADD UNIQUE KEY `login_id` (`login_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_details`
--
ALTER TABLE `admin_details`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `entry_register`
--
ALTER TABLE `entry_register`
  MODIFY `sl_no` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `inv_admins`
--
ALTER TABLE `inv_admins`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inv_category`
--
ALTER TABLE `inv_category`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `inv_current_bill`
--
ALTER TABLE `inv_current_bill`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_distribution`
--
ALTER TABLE `inv_distribution`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT for table `inv_history`
--
ALTER TABLE `inv_history`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `inv_items`
--
ALTER TABLE `inv_items`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `inv_purchase_log`
--
ALTER TABLE `inv_purchase_log`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `inv_sales_log`
--
ALTER TABLE `inv_sales_log`
  MODIFY `bill_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `inv_stock`
--
ALTER TABLE `inv_stock`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `inv_stock_request`
--
ALTER TABLE `inv_stock_request`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_supplier`
--
ALTER TABLE `inv_supplier`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `inv_type`
--
ALTER TABLE `inv_type`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `labs`
--
ALTER TABLE `labs`
  MODIFY `sl_no` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `system_master`
--
ALTER TABLE `system_master`
  MODIFY `sl_no` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3977;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
