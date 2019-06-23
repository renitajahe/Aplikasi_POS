-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Jun 2019 pada 14.11
-- Versi server: 10.1.40-MariaDB
-- Versi PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_aplikasipos`
--

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `query_fakturtransaksi`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `query_fakturtransaksi` (
`kd_transaksi` varchar(10)
,`kd_barang` varchar(10)
,`nama_barang` varchar(100)
,`harga_satuan` int(11)
,`jumlah` int(11)
,`subtotal` int(255)
,`kd_transaksilaporan` varchar(10)
,`total` int(11)
,`bayar` int(11)
,`kembali` int(11)
,`tanggal` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `query_laporanpasok`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `query_laporanpasok` (
`kd_pasok` varchar(10)
,`kd_barang` varchar(10)
,`nama_barang` varchar(100)
,`jumlah` int(11)
,`tanggal_masuk` varchar(20)
,`stok_total` bigint(12)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `query_stoktotal`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `query_stoktotal` (
`kd_barang` varchar(10)
,`stok_total` bigint(12)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `query_total`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `query_total` (
`total_harga` decimal(65,0)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kd_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `jenis_barang` varchar(50) DEFAULT NULL,
  `harga_beli` int(11) DEFAULT NULL,
  `harga_jual` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`kd_barang`, `nama_barang`, `jenis_barang`, `harga_beli`, `harga_jual`, `jumlah`) VALUES
('F001', 'Bakpia Pathok', 'Makanan', 1000, 2000, -1),
('F002', 'Talubi', 'Makanan', 18000, 30000, -1),
('M001', 'Minuman Halal', 'Minuman', 3000, 5000, 20108);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_laporan`
--

CREATE TABLE `tb_laporan` (
  `kd_transaksilaporan` varchar(10) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `bayar` int(11) DEFAULT NULL,
  `kembali` int(11) DEFAULT NULL,
  `tanggal` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_laporan`
--

INSERT INTO `tb_laporan` (`kd_transaksilaporan`, `total`, `bayar`, `kembali`, `tanggal`) VALUES
('T0001', 14000, 20000, 6000, '2019-06-15'),
('T0002', 10000, 50000, 40000, '2019-06-15'),
('T0003', 10000, 50000, 40000, '2019-06-15'),
('T0004', 134000, 150000, 16000, '2019-06-16'),
('T0005', 169000, 200000, 31000, '2019-06-16'),
('T0006', 59000, 100000, 41000, '2019-06-16'),
('T0007', 59000, 100000, 41000, '2019-06-16'),
('T0008', 10000, 5000, -5000, '2019-06-22'),
('T0009', 75000, 100000, 25000, '2019-06-22'),
('T10', 70000, 100000, 30000, '2019-06-22'),
('T11', 70000, 100000, 30000, '2019-06-22'),
('T12', 19000, 20000, 1000, '2019-06-22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pasok`
--

CREATE TABLE `tb_pasok` (
  `kd_pasok` varchar(10) NOT NULL,
  `kd_barang` varchar(10) DEFAULT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `tanggal_masuk` varchar(20) DEFAULT NULL,
  `pemasok` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pasok`
--

INSERT INTO `tb_pasok` (`kd_pasok`, `kd_barang`, `nama_barang`, `jumlah`, `tanggal_masuk`, `pemasok`) VALUES
('P0001', 'D001', 'Mbok Darmi', 30, '2019-05-13', 'Darmi Milk'),
('P0002', 'F001', 'Bakpia Pathok', 20, '2019-05-13', 'Mamang Pathok'),
('P0003', 'F002', 'Talubi', 40, '2019-05-13', 'Tante Robbi'),
('P0004', 'D002', 'Cappuccino Cincau', 50, '2019-05-09', 'Niall Horan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pemasok`
--

CREATE TABLE `tb_pemasok` (
  `kd_pemasok` varchar(10) DEFAULT NULL,
  `nama_pemasok` varchar(100) DEFAULT NULL,
  `alamat` varchar(500) DEFAULT NULL,
  `no_hp` int(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `kd_pengguna` varchar(10) DEFAULT NULL,
  `nama_pengguna` varchar(100) DEFAULT NULL,
  `jk` varchar(10) DEFAULT NULL,
  `no_hp` varchar(13) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`kd_pengguna`, `nama_pengguna`, `jk`, `no_hp`, `jabatan`, `username`, `password`) VALUES
('11706006', 'Daris Dzakwan Kamiil', 'Pria', '086969696969', 'Admin', 'daris', 'despacito'),
('11706123', 'Resa Dwi Putra Mahendra', 'Pria', '089638560960', 'Kasir', 'resa', 'buahnanas'),
('11706254', 'Muhammad Robbi Zulfikar', 'Wanita', '081384593009', 'Manager', 'robbi', 'robbi'),
('11706241', 'Muhammad Mukhlis Rifai', 'Pria', '082210091173', 'Manager', 'mukhlis', 'permenkaret205');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `kd_transaksi` varchar(10) DEFAULT NULL,
  `kd_barang` varchar(10) DEFAULT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `harga_satuan` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `subtotal` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Trigger `tb_transaksi`
--
DELIMITER $$
CREATE TRIGGER `ajukan_barang` AFTER INSERT ON `tb_transaksi` FOR EACH ROW BEGIN

UPDATE tb_barang

SET jumlah = jumlah - NEW.jumlah

WHERE kd_barang= NEW.kd_barang;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `undurkan_barang` AFTER DELETE ON `tb_transaksi` FOR EACH ROW BEGIN

UPDATE tb_barang

SET jumlah = jumlah + OLD.jumlah

WHERE kd_barang= OLD.kd_barang;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur untuk view `query_fakturtransaksi`
--
DROP TABLE IF EXISTS `query_fakturtransaksi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `query_fakturtransaksi`  AS  select `tb_transaksi`.`kd_transaksi` AS `kd_transaksi`,`tb_transaksi`.`kd_barang` AS `kd_barang`,`tb_transaksi`.`nama_barang` AS `nama_barang`,`tb_transaksi`.`harga_satuan` AS `harga_satuan`,`tb_transaksi`.`jumlah` AS `jumlah`,`tb_transaksi`.`subtotal` AS `subtotal`,`tb_laporan`.`kd_transaksilaporan` AS `kd_transaksilaporan`,`tb_laporan`.`total` AS `total`,`tb_laporan`.`bayar` AS `bayar`,`tb_laporan`.`kembali` AS `kembali`,`tb_laporan`.`tanggal` AS `tanggal` from (`tb_transaksi` join `tb_laporan`) where (`tb_transaksi`.`kd_transaksi` = `tb_laporan`.`kd_transaksilaporan`) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `query_laporanpasok`
--
DROP TABLE IF EXISTS `query_laporanpasok`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `query_laporanpasok`  AS  select `tb_pasok`.`kd_pasok` AS `kd_pasok`,`tb_pasok`.`kd_barang` AS `kd_barang`,`tb_pasok`.`nama_barang` AS `nama_barang`,`tb_pasok`.`jumlah` AS `jumlah`,`tb_pasok`.`tanggal_masuk` AS `tanggal_masuk`,`query_stoktotal`.`stok_total` AS `stok_total` from (`tb_pasok` join `query_stoktotal`) where (`tb_pasok`.`kd_barang` = `query_stoktotal`.`kd_barang`) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `query_stoktotal`
--
DROP TABLE IF EXISTS `query_stoktotal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `query_stoktotal`  AS  select `tb_pasok`.`kd_barang` AS `kd_barang`,(`tb_pasok`.`jumlah` + `tb_barang`.`jumlah`) AS `stok_total` from (`tb_pasok` join `tb_barang`) where (`tb_pasok`.`kd_barang` = `tb_barang`.`kd_barang`) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `query_total`
--
DROP TABLE IF EXISTS `query_total`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `query_total`  AS  select sum(`tb_transaksi`.`subtotal`) AS `total_harga` from `tb_transaksi` ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indeks untuk tabel `tb_pasok`
--
ALTER TABLE `tb_pasok`
  ADD PRIMARY KEY (`kd_pasok`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
