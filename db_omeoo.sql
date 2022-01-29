-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2022 at 09:53 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_omeoo`
--

-- --------------------------------------------------------

--
-- Table structure for table `images_product`
--

CREATE TABLE `images_product` (
  `id` int(11) NOT NULL,
  `img_name` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images_product`
--

INSERT INTO `images_product` (`id`, `img_name`, `product_id`, `variant_id`) VALUES
(1, 'Foto Baju merah M', 1, 2),
(2, 'foto baju merah L', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ID`, `Name`, `Price`) VALUES
(1, 'Baju merah', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_json`
--

CREATE TABLE `tb_json` (
  `Category_ID` int(11) NOT NULL,
  `Parent_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_json`
--

INSERT INTO `tb_json` (`Category_ID`, `Parent_ID`, `Name`) VALUES
(1, 0, 'Category 1'),
(2, 1, 'Category 2'),
(3, 1, 'Category 3'),
(4, 0, 'Category 4'),
(5, 3, 'Category 5'),
(6, 2, 'Category 6'),
(7, 1, 'Category 7');

-- --------------------------------------------------------

--
-- Table structure for table `variant`
--

CREATE TABLE `variant` (
  `ID` int(11) NOT NULL,
  `variant_name` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `variant`
--

INSERT INTO `variant` (`ID`, `variant_name`, `product_id`) VALUES
(1, 'Baju merah L', 1),
(2, 'Baju Merah M', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_prod`
-- (See below for the actual view)
--
CREATE TABLE `vw_prod` (
`ID` int(11)
,`Name` varchar(255)
,`Price` double
,`variant_name` varchar(255)
,`img_name` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `vw_prod`
--
DROP TABLE IF EXISTS `vw_prod`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_prod`  AS  select `product`.`ID` AS `ID`,`product`.`Name` AS `Name`,`product`.`Price` AS `Price`,`variant`.`variant_name` AS `variant_name`,`images_product`.`img_name` AS `img_name` from ((`product` join `variant` on(`product`.`ID` = `variant`.`product_id`)) join `images_product` on(`product`.`ID` = `images_product`.`product_id` and `images_product`.`variant_id` = `variant`.`product_id`)) group by `product`.`ID`,`variant`.`product_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `images_product`
--
ALTER TABLE `images_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tb_json`
--
ALTER TABLE `tb_json`
  ADD PRIMARY KEY (`Category_ID`);

--
-- Indexes for table `variant`
--
ALTER TABLE `variant`
  ADD PRIMARY KEY (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
