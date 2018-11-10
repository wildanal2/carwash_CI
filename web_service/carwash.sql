-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2018 at 01:08 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carwash`
--

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nohp` varchar(14) NOT NULL,
  `alamat` varchar(75) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id`, `nama`, `nohp`, `alamat`, `password`) VALUES
(1, 'rizky', '0813425667', 'fjjkh', 'sasdas'),
(2, 'effendy', '081223', 'malang', 'jhjkhasd'),
(3, 'firmansyah', '08844452', 'asdasdas', 'jhjkhasd');

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id` int(11) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `harga` varchar(20) NOT NULL,
  `img` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`id`, `nama`, `harga`, `img`) VALUES
(9, 'Trail', '9000', 'https://cdn.pixabay.com/photo/2012/04/12/22/38/moped-30973_960_720.png'),
(11, 'Matic', '7000', 'https://i0.wp.com/neton.id/wp-content/uploads/2016/01/04ec2e681bd9cbd3efd0d88a8b47cffe_f1860.jpg?fit=2000%2C1326&ssl=1'),
(12, 'Sport', '10000', 'https://1.bp.blogspot.com/-oScSXlp8pqs/WmN4eXNLQnI/AAAAAAAAES0/LtcMx62hdDETf2ekRQvdO4mumUflDdMxQCLcBGAs/s1600/Motor%2B250%2Bcc%2Bpilihan%2Bterbaik.jpg'),
(13, 'Moge', '18000', 'https://adm982.kabaroto.com/media/d2/ee/b4/d2eeb42baf5853301f0272fa9b287268.jpg'),
(14, 'Matic Sport', '10000', 'https://asset.kompas.com/crop/0x0:900x600/750x500/data/photo/2017/12/15/3835512052.jpg'),
(15, 'Bebek', '7000', 'https://edorusyanto.files.wordpress.com/2011/09/supra-x-cw-hijau.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kondisi`
--

CREATE TABLE `kondisi` (
  `id` int(11) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `harga` int(11) NOT NULL,
  `img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kondisi`
--

INSERT INTO `kondisi` (`id`, `nama`, `harga`, `img`) VALUES
(1, 'Normal', 0, 'https://c1.staticflickr.com/8/7451/28020546912_36d45d3c3e_b.jpg'),
(2, 'Parah', 5000, 'http://gigitiga.com/wp-content/uploads/2017/11/dirty-dirt-bike-01.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kondisi`
--
ALTER TABLE `kondisi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kendaraan`
--
ALTER TABLE `kendaraan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `kondisi`
--
ALTER TABLE `kondisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
