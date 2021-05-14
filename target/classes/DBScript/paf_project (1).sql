-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2021 at 03:54 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paf_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `sponser`
--

CREATE TABLE `sponser` (
  `id` int(5) NOT NULL,
  `sponserID` int(5) NOT NULL,
  `productId` int(5) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `sAmount` float NOT NULL,
  `compName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sponser`
--

INSERT INTO `sponser` (`id`, `sponserID`, `productId`, `firstName`, `lastName`, `sAmount`, `compName`) VALUES
(14, 10, 5, 'Shalmi', 'Nisansala', 10000, 'GLOW'),
(27, 12, 7, 'sandamali', 'geethika', 2000, 'WSO'),
(28, 13, 8, 'himasha', 'mandakini', 1800, 'INFOSYS'),
(29, 14, 9, 'nikitha', 'rosarin', 900, 'POLO'),
(31, 15, 10, 'Anuhas', 'Cooray', 680, 'DERENAA'),
(43, 16, 11, 'Shalini', 'Fernando', 3000, 'INFO'),
(44, 17, 12, 'Himasha', 'Fernando', 3500, 'LIVE'),
(45, 18, 13, 'Clifford', 'Murray', 4000, 'BI'),
(46, 19, 14, 'Shamila', 'Fernando', 5000, 'CREW'),
(48, 20, 15, 'heshan', 'shalinka', 1500, 'GLOBAL');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sponser`
--
ALTER TABLE `sponser`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sponser`
--
ALTER TABLE `sponser`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
