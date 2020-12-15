-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2020 at 09:27 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `2`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga_beli` varchar(100) NOT NULL,
  `harga_jual` varchar(100) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `id_kategori`, `stok`, `harga_beli`, `harga_jual`, `date_added`) VALUES
(15, 'Pizza', 16, 19, '15000', '20000', '2020-12-15 20:22:44'),
(16, 'Burger', 16, 28, '17000', '23000', '2020-12-15 20:07:17'),
(17, 'Lemon Tea', 17, 25, '5000', '7000', '2020-12-15 19:58:02'),
(20, 'Ice Cream', 18, 27, '6000', '8000', '2020-12-15 19:58:09'),
(21, 'Cappucino', 17, 575, '6000', '10000', '2020-12-15 20:22:49'),
(22, 'Lemon Squash', 17, 80, '8000', '12000', '2020-12-15 20:02:36'),
(23, 'Nasi Goreng', 16, 100, '8000', '15000', '2020-12-15 20:03:14');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(16, 'Makanan'),
(17, 'Minuman'),
(18, 'Dessert');

-- --------------------------------------------------------

--
-- Table structure for table `sub_transaksi`
--

CREATE TABLE `sub_transaksi` (
  `id_subtransaksi` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `total_harga` varchar(20) NOT NULL,
  `no_invoice` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_transaksi`
--

INSERT INTO `sub_transaksi` (`id_subtransaksi`, `id_barang`, `id_transaksi`, `jumlah_beli`, `total_harga`, `no_invoice`) VALUES
(12, 20, 22, 5, '40000', '15/AF/5/20/08/20/03'),
(13, 16, 23, 40, '920000', '15/AF/5/20/08/20/36'),
(14, 15, 24, 2, '40000', '15/AF/5/20/08/31/27'),
(15, 17, 25, 4, '28000', '15/AF/5/20/08/31/36'),
(16, 15, 26, 5, '100000', '15/AF/5/20/08/43/53'),
(17, 15, 27, 8, '160000', '15/AF/5/20/08/45/49'),
(18, 15, 28, 12, '240000', '15/AF/5/20/08/46/24'),
(19, 15, 29, 8, '160000', '15/AF/5/20/08/49/13'),
(20, 15, 30, 4, '80000', '15/AF/5/20/08/49/53'),
(21, 16, 31, 10, '230000', '15/AF/5/20/08/55/28'),
(22, 15, 32, 1, '20000', '15/AF/5/20/08/58/14'),
(23, 17, 32, 1, '7000', '15/AF/5/20/08/58/14'),
(24, 16, 32, 1, '23000', '15/AF/5/20/08/58/14'),
(25, 20, 32, 1, '8000', '15/AF/5/20/08/58/14'),
(26, 21, 33, 5, '50000', '15/AF/5/20/09/07/21'),
(27, 16, 33, 5, '115000', '15/AF/5/20/09/07/21');

-- --------------------------------------------------------

--
-- Table structure for table `tempo`
--

CREATE TABLE `tempo` (
  `id_subtransaksi` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `total_harga` varchar(20) NOT NULL,
  `trx` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tempo`
--

INSERT INTO `tempo` (`id_subtransaksi`, `id_barang`, `jumlah_beli`, `total_harga`, `trx`) VALUES
(72, 15, 1, '20000', '15/AF/2/20'),
(73, 21, 20, '200000', '15/AF/2/20');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `tgl_transaksi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `kode_kasir` int(11) NOT NULL,
  `total_bayar` varchar(20) NOT NULL,
  `no_invoice` varchar(20) NOT NULL,
  `nomor_meja` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `tgl_transaksi`, `kode_kasir`, `total_bayar`, `no_invoice`, `nomor_meja`) VALUES
(22, '2020-12-15 19:20:03', 5, '40000', '15/AF/5/20/08/20/03', 12),
(23, '2020-12-15 19:20:36', 5, '920000', '15/AF/5/20/08/20/36', 5),
(24, '2020-12-15 19:31:27', 5, '40000', '15/AF/5/20/08/31/27', 4),
(25, '2020-12-15 19:31:36', 5, '28000', '15/AF/5/20/08/31/36', 10),
(26, '2020-12-15 19:43:53', 5, '100000', '15/AF/5/20/08/43/53', 7),
(27, '2020-12-15 19:45:49', 5, '160000', '15/AF/5/20/08/45/49', 22),
(28, '2020-12-15 19:46:24', 5, '240000', '15/AF/5/20/08/46/24', 8),
(29, '2020-12-15 19:49:13', 5, '160000', '15/AF/5/20/08/49/13', 1),
(30, '2020-12-15 19:49:53', 5, '80000', '15/AF/5/20/08/49/53', 5),
(31, '2020-12-15 19:55:28', 5, '230000', '15/AF/5/20/08/55/28', 7),
(32, '2020-12-15 19:58:14', 5, '58000', '15/AF/5/20/08/58/14', 9),
(33, '2020-12-15 20:07:21', 5, '165000', '15/AF/5/20/09/07/21', 20);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `status` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `status`, `date_created`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, '2017-12-11 17:44:45'),
(5, 'Kasir', 'fb5ff76f1668a8d36b4f5797bfa77f986bc8a356', 2, '2020-12-15 19:16:09'),
(6, 'Pelayan', '6b0e6a33926a9f113b04017a55600278df78973a', 2, '2020-12-15 19:18:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `sub_transaksi`
--
ALTER TABLE `sub_transaksi`
  ADD PRIMARY KEY (`id_subtransaksi`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- Indexes for table `tempo`
--
ALTER TABLE `tempo`
  ADD UNIQUE KEY `id_subtransaksi` (`id_subtransaksi`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `jumlah_beli` (`jumlah_beli`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sub_transaksi`
--
ALTER TABLE `sub_transaksi`
  MODIFY `id_subtransaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tempo`
--
ALTER TABLE `tempo`
  MODIFY `id_subtransaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
