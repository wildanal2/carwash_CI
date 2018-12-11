-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2018 at 02:02 AM
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
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `nama_event` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `diskon` double NOT NULL,
  `required` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `nama_event`, `img`, `detail`, `diskon`, `required`, `bulan`, `status`) VALUES
(1, 'Gratis Cuci motor 1X', 'http://3.bp.blogspot.com/-R0O1htN63Cg/VV0xk4EU3II/AAAAAAAADPs/SlhAi7P6gWA/s1600/2014-12-11%2B08.36.30.jpg', 'gratis cuci motor setelah 5X cuci, dengan motor yang sama. promo hanya berlaku dibulan November.', 100, 5, 12, 'Aktif'),
(2, 'Gratis 1 Teh Kotak', 'https://i.imgur.com/pHHWYEd.jpg', 'Setelah cuci di bulan ini sebanyak 3X untuk mendapatkan Teh Kotak 340ml', 0, 3, 12, 'nonAktif'),
(6, 'sdfsad', 'http://1.bp.blogspot.com/-Np4r7GIlxWA/U6UUaamK7CI/AAAAAAAABU4/e0LswrOqPFY/s1600/BANNER+LOOK+1718.jpg', 'asdas', 22, 2, 12, 'nonAktif');

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id` int(11) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `harga` int(20) NOT NULL,
  `img` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`id`, `nama`, `harga`, `img`) VALUES
(9, 'Trail', 9000, 'https://cdn.pixabay.com/photo/2012/04/12/22/38/moped-30973_960_720.png'),
(11, 'Matic', 7000, 'https://i0.wp.com/neton.id/wp-content/uploads/2016/01/04ec2e681bd9cbd3efd0d88a8b47cffe_f1860.jpg?fit=2000%2C1326&ssl=1'),
(12, 'Sport', 10000, 'https://1.bp.blogspot.com/-oScSXlp8pqs/WmN4eXNLQnI/AAAAAAAAES0/LtcMx62hdDETf2ekRQvdO4mumUflDdMxQCLcBGAs/s1600/Motor%2B250%2Bcc%2Bpilihan%2Bterbaik.jpg'),
(13, 'Moge', 17000, 'https://adm982.kabaroto.com/media/d2/ee/b4/d2eeb42baf5853301f0272fa9b287268.jpg'),
(14, 'Matic Sport', 10000, 'https://asset.kompas.com/crop/0x0:900x600/750x500/data/photo/2017/12/15/3835512052.jpg'),
(15, 'Bebek', 7000, 'https://edorusyanto.files.wordpress.com/2011/09/supra-x-cw-hijau.jpg');

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

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `nopol` varchar(15) NOT NULL,
  `kendaraan` varchar(20) NOT NULL,
  `harga_kendaraan` int(11) NOT NULL,
  `kondisi` varchar(20) NOT NULL,
  `harga_kondisi` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `kasir` int(11) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `nopol`, `kendaraan`, `harga_kendaraan`, `kondisi`, `harga_kondisi`, `total`, `kasir`, `tanggal`) VALUES
(1, 'S4312ZZ', 'Matic', 8000, 'normal', 0, 8000, 3, '2018-11-10 05:23:45'),
(2, 'S123A', 'Moge', 13000, 'Normal', 2000, 15000, 3, '2018-11-10 08:38:58'),
(3, 'a223x', 'Trail', 9000, 'Normal', 0, 9000, 1, '2018-11-10 08:31:01'),
(4, 'W4458ZZ', 'Bebek', 7000, 'Normal', 0, 7000, 1, '2018-11-10 08:55:08'),
(5, 'F2231ZZ', 'Matic', 7000, 'Parah', 5000, 12000, 4, '2018-11-10 08:55:56'),
(6, 'aa', 'Bebek', 7000, 'Normal', 0, 7000, 4, '2018-11-10 09:34:42'),
(7, 'zz', 'Matic', 7000, 'Normal', 0, 7000, 4, '2018-11-10 09:34:55'),
(8, 'aas', 'Matic', 7000, 'Normal', 0, 7000, 4, '2018-11-10 09:35:04'),
(9, 'ee', 'Matic', 7000, 'Normal', 0, 7000, 4, '2018-11-10 09:35:12'),
(10, 'ssd', 'Matic', 7000, 'Parah', 5000, 12000, 4, '2018-11-10 09:35:20'),
(11, 'aas', 'Matic', 7000, 'Normal', 0, 7000, 4, '2018-11-10 09:35:29'),
(12, 'zzx', 'Matic', 7000, 'Normal', 0, 7000, 4, '2018-11-10 09:35:38'),
(13, 'dd', 'Trail', 9000, 'Parah', 5000, 14000, 4, '2018-11-10 09:35:45'),
(14, 'gggh', 'Matic', 7000, 'Parah', 5000, 12000, 4, '2018-11-10 09:36:03'),
(15, 'xx', 'Trail', 9000, 'Parah', 5000, 14000, 4, '2018-11-10 09:36:11'),
(16, 'n7673p', 'Trail', 9000, 'Parah', 5000, 14000, 4, '2018-11-10 09:40:31'),
(17, 'AG6675ZA', 'Matic Sport', 10000, 'Normal', 0, 10000, 1, '2018-11-10 10:24:03'),
(18, 'S123A', 'Moge', 13000, 'Normal', 2000, 15000, 2, '2018-11-11 06:17:15'),
(19, 'AG64125XU', 'Trail', 9000, 'Normal', 0, 9000, 1, '2018-11-11 06:28:55'),
(20, 'AG6678AS', 'Matic', 7000, 'Normal', 0, 7000, 1, '2018-11-11 07:19:30'),
(21, 'S1223Z', 'Matic', 7000, 'Normal', 0, 7000, 1, '2018-11-11 08:38:28'),
(22, 'm9878hh', 'Trail', 9000, 'Normal', 0, 9000, 4, '2018-11-11 09:48:59'),
(23, 'AG8807CC', 'Bebek', 7000, 'Normal', 0, 7000, 1, '2018-11-11 14:40:25'),
(24, 'sasa', 'Moge', 18000, 'Parah', 5000, 23000, 1, '2018-11-11 15:11:44'),
(25, 'AG 5955 XC', 'Moge', 18000, 'Parah', 5000, 23000, 1, '2018-11-11 21:31:25'),
(26, 'M 9985 KT', 'Bebek', 7000, 'Parah', 5000, 12000, 4, '2018-11-11 21:42:45'),
(27, 'S 1241 ZZ', 'Matic', 7000, 'Normal', 0, 7000, 1, '2018-11-12 06:29:12'),
(28, 'DR 1145 A', 'Trail', 9000, 'Normal', 0, 9000, 1, '2018-11-12 08:25:51'),
(29, 'N 2121 AA', 'Moge', 18000, 'Parah', 5000, 23000, 1, '2018-11-12 09:08:27'),
(30, 'S 4444 Z', 'Trail', 9000, 'Parah', 5000, 14000, 1, '2018-11-11 09:09:32'),
(31, 'N1321BJ', 'Moge', 18000, 'Normal', 0, 18000, 1, '2018-11-12 19:13:19'),
(32, 'A 6453 ZU', 'Matic', 7000, 'Normal', 0, 7000, 1, '2018-11-13 08:48:24'),
(33, 'N 2046 GQ', 'Moge', 18000, 'Parah', 5000, 23000, 1, '2018-11-13 09:09:46'),
(34, 'n 2518 aaj', 'Bebek', 7000, 'Parah', 5000, 12000, 1, '2018-11-14 14:47:47'),
(35, 'S 4444 Z', 'Trail', 9000, 'Parah', 5000, 14000, 1, '2018-11-01 19:51:51'),
(36, 'N 111 GA', 'Trail', 9000, 'Parah', 5000, 14000, 1, '2018-11-23 08:35:28'),
(37, 'AG 9999 WE', 'Matic', 7000, 'Parah', 5000, 12000, 1, '2018-11-23 08:35:33'),
(38, 'A 9971 Z', 'Matic', 7000, '', 0, 7000, 1, '2018-11-29 23:02:25'),
(39, 'b7544hg', 'Trail', 9000, 'Normal', 0, 9000, 1, '2018-11-30 15:09:44'),
(40, 'S 4444 Z', 'Matic', 7000, 'Parah', 5000, 12000, 1, '2018-12-01 17:49:47'),
(41, 'S 4444 Z', 'Trail', 9000, 'Normal', 0, 9000, 1, '2018-12-01 20:55:43'),
(42, 's 4444 z', 'Matic', 7000, 'Normal', 0, 7000, 1, '2018-12-02 10:45:36'),
(43, 'S 1111 X', 'Matic', 7000, 'Normal', 0, 7000, 1, '2018-12-03 18:49:10'),
(44, 'S 1111 X', 'Matic', 7000, 'Normal', 0, 7000, 1, '2018-12-03 18:49:21'),
(45, 'S 1111 X', 'Matic', 7000, 'Normal', 0, 7000, 1, '2018-12-03 18:49:43'),
(46, 'S 1111 X', 'Matic', 7000, 'Normal', 0, 7000, 1, '2018-12-03 18:49:55'),
(47, 'S 1111 X', 'Matic', 7000, 'Normal', 0, 7000, 1, '2018-12-03 18:50:09'),
(48, 'S 4453 XZ', 'Matic', 7000, 'Normal', 0, 7000, 1, '2018-12-10 07:20:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nohp` varchar(14) NOT NULL,
  `alamat` varchar(75) NOT NULL,
  `password` varchar(32) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `nohp`, `alamat`, `password`, `level`) VALUES
(1, 'rizky', '081', 'fjjkh', 'aa', 1),
(2, 'effendy', '081223', 'malang', 'jhjkhasd', 1),
(3, 'firmansyah', '08844452', 'asdasdas', 'jhjkhasd', 1),
(4, 'yahay', '11', 'ss', '11', 1),
(5, 'Admin', '088', 'mlg', '088', 0),
(6, 'saya', '0811', 'fgjfdf', '0811', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
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
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nohp` (`nohp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
