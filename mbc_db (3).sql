@@ -0,0 +1,79 @@
-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2019 at 07:25 PM
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
-- Table structure for table `inv_stock_request`
--

CREATE TABLE `inv_stock_request` (
  `sl_no` int(11) NOT NULL,
  `item_name` varchar(11) NOT NULL,
  `added_by` varchar(20) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1,
  `remarks` varchar(11) NOT NULL,
  `section` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inv_stock_request`
--

INSERT INTO `inv_stock_request` (`sl_no`, `item_name`, `added_by`, `added_on`, `status`, `remarks`, `section`) VALUES
(13, '', 'Admin', '2019-11-24 18:12:54', 0, '', 0),
(14, 'dsa', 'Admin', '2019-11-24 18:11:58', 0, ',m,m', 0),
(15, 'pen', 'Admin', '2019-11-24 18:12:05', 1, 'df', 0),
(19, 'mnm', 'Admin', '2019-11-24 18:13:49', 1, 'mnm', 0),
(20, 'mnmn', 'Admin', '2019-11-24 18:13:52', 1, '', 0),
(26, 'nnnn', 'Admin', '2019-11-24 18:20:20', 0, 'nnnnn', 1),
(28, 'dads', 'Admin', '2019-11-24 18:19:31', 1, 'jjiji', 1),
(31, 'fsdf', 'Admin', '2019-11-24 18:20:19', 0, 'fgdf', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inv_stock_request`
--
ALTER TABLE `inv_stock_request`
  ADD PRIMARY KEY (`sl_no`),
  ADD UNIQUE KEY `item_name` (`item_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inv_stock_request`
--
ALTER TABLE `inv_stock_request`
  MODIFY `sl_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;