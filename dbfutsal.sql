-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql107.infinityfree.com
-- Generation Time: Sep 26, 2024 at 02:57 PM
-- Server version: 10.6.19-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_37284333_dbfutsal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_212279`
--

CREATE TABLE `admin_212279` (
  `212279_id_user` int(11) NOT NULL,
  `212279_username` varchar(20) NOT NULL,
  `212279_password` varchar(20) NOT NULL,
  `212279_nama` varchar(50) NOT NULL,
  `212279_no_handphone` varchar(15) NOT NULL,
  `212279_email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_212279`
--

INSERT INTO `admin_212279` (`212279_id_user`, `212279_username`, `212279_password`, `212279_nama`, `212279_no_handphone`, `212279_email`) VALUES
(1, 'admin', '123456', 'Admin', '', 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `bayar_212279`
--

CREATE TABLE `bayar_212279` (
  `212279_id_bayar` int(11) NOT NULL,
  `212279_id_sewa` int(11) NOT NULL,
  `212279_bukti` text NOT NULL,
  `212279_tanggal_upload` date NOT NULL DEFAULT current_timestamp(),
  `212279_konfirmasi` varchar(50) NOT NULL DEFAULT 'Belum'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bayar_212279`
--

INSERT INTO `bayar_212279` (`212279_id_bayar`, `212279_id_sewa`, `212279_bukti`, `212279_tanggal_upload`, `212279_konfirmasi`) VALUES
(69, 166, '66ea6552cda4f.jpg', '2024-09-17', 'Terkonfirmasi');

-- --------------------------------------------------------

--
-- Table structure for table `lapangan_212279`
--

CREATE TABLE `lapangan_212279` (
  `212279_id_lapangan` int(11) NOT NULL,
  `212279_id_user` int(11) NOT NULL,
  `212279_nama` varchar(35) NOT NULL,
  `212279_keterangan` text NOT NULL,
  `212279_harga` int(11) NOT NULL,
  `212279_foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `lapangan_212279`
--

INSERT INTO `lapangan_212279` (`212279_id_lapangan`, `212279_id_user`, `212279_nama`, `212279_keterangan`, `212279_harga`, `212279_foto`) VALUES
(35, 1, 'Lapangan 1', '', 100000, '66cdfdfbdd9a1.jpg'),
(37, 1, 'Lapangan 2', '', 100000, '66ce0df251fa6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sewa_212279`
--

CREATE TABLE `sewa_212279` (
  `212279_id_sewa` int(11) NOT NULL,
  `212279_id_user` int(11) NOT NULL,
  `212279_id_lapangan` int(11) NOT NULL,
  `212279_tanggal_pesan` date NOT NULL DEFAULT current_timestamp(),
  `212279_lama_sewa` int(11) NOT NULL,
  `212279_jam_mulai` datetime NOT NULL,
  `212279_jam_habis` datetime NOT NULL,
  `212279_harga` int(11) NOT NULL,
  `212279_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sewa_212279`
--

INSERT INTO `sewa_212279` (`212279_id_sewa`, `212279_id_user`, `212279_id_lapangan`, `212279_tanggal_pesan`, `212279_lama_sewa`, `212279_jam_mulai`, `212279_jam_habis`, `212279_harga`, `212279_total`) VALUES
(166, 106, 35, '2024-09-17', 1, '2024-09-19 13:00:00', '2024-09-19 14:00:00', 100000, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `user_212279`
--

CREATE TABLE `user_212279` (
  `212279_id_user` int(11) NOT NULL,
  `212279_email` varchar(50) NOT NULL,
  `212279_password` varchar(32) NOT NULL,
  `212279_no_handphone` varchar(20) NOT NULL,
  `212279_jenis_kelamin` varchar(10) NOT NULL,
  `212279_nama_lengkap` varchar(60) NOT NULL,
  `212279_alamat` text NOT NULL,
  `212279_foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_212279`
--

INSERT INTO `user_212279` (`212279_id_user`, `212279_email`, `212279_password`, `212279_no_handphone`, `212279_jenis_kelamin`, `212279_nama_lengkap`, `212279_alamat`, `212279_foto`) VALUES
(102, 'r@gmail.com', '123', '08123124', 'Laki-laki', 'erzha', 'kkl', '66e2c1d413589.png'),
(105, 'e@gmail.com', '123', '12345678910', 'Laki-Laki', 'Coba', 'Depok', '66e2db5549ee2.jpg'),
(106, 'a@gmail.com', '123', '1235448', 'Laki-Laki', 'test', 'test', '66ea64955b482.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_212279`
--
ALTER TABLE `admin_212279`
  ADD PRIMARY KEY (`212279_id_user`);

--
-- Indexes for table `bayar_212279`
--
ALTER TABLE `bayar_212279`
  ADD PRIMARY KEY (`212279_id_bayar`),
  ADD KEY `id_sewa_bayar` (`212279_id_sewa`);

--
-- Indexes for table `lapangan_212279`
--
ALTER TABLE `lapangan_212279`
  ADD PRIMARY KEY (`212279_id_lapangan`),
  ADD KEY `212279_id_user` (`212279_id_user`);

--
-- Indexes for table `sewa_212279`
--
ALTER TABLE `sewa_212279`
  ADD PRIMARY KEY (`212279_id_sewa`),
  ADD KEY `212279_id_user` (`212279_id_user`),
  ADD KEY `id_lapangan_sewa` (`212279_id_lapangan`);

--
-- Indexes for table `user_212279`
--
ALTER TABLE `user_212279`
  ADD PRIMARY KEY (`212279_id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_212279`
--
ALTER TABLE `admin_212279`
  MODIFY `212279_id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bayar_212279`
--
ALTER TABLE `bayar_212279`
  MODIFY `212279_id_bayar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `lapangan_212279`
--
ALTER TABLE `lapangan_212279`
  MODIFY `212279_id_lapangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `sewa_212279`
--
ALTER TABLE `sewa_212279`
  MODIFY `212279_id_sewa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `user_212279`
--
ALTER TABLE `user_212279`
  MODIFY `212279_id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sewa_212279`
--
ALTER TABLE `sewa_212279`
  ADD CONSTRAINT `id_lapangan_sewa` FOREIGN KEY (`212279_id_lapangan`) REFERENCES `lapangan_212279` (`212279_id_lapangan`),
  ADD CONSTRAINT `id_user_sewa` FOREIGN KEY (`212279_id_user`) REFERENCES `user_212279` (`212279_id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
