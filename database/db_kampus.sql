-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Apr 2021 pada 02.53
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kampus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_datasiswa`
--

CREATE TABLE `tbl_datasiswa` (
  `id_datasiswa` int(11) NOT NULL,
  `id_kelas` varchar(60) NOT NULL,
  `nis` varchar(60) NOT NULL,
  `id_jurusan` varchar(60) NOT NULL,
  `tgl_tambah` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_datasiswa`
--

INSERT INTO `tbl_datasiswa` (`id_datasiswa`, `id_kelas`, `nis`, `id_jurusan`, `tgl_tambah`) VALUES
(1, 'X2021', '546988564', 'RPL', '2021-04-26 05:36:40'),
(2, 'X2021', '542836985', 'MM', '2021-04-26 05:36:40'),
(3, 'X2021', '785214562', 'MM', '2021-04-26 05:36:40'),
(4, 'X2021', '965826584', 'RPL', '2021-04-26 05:36:40'),
(5, 'X2021', '162534759', 'RPL', '2021-04-26 05:36:40'),
(6, 'XI2019', '745216935', 'RPL', '2021-04-26 05:36:40'),
(7, 'XI2019', '456287951', 'RPL', '2021-04-26 05:36:40'),
(8, 'XI2019', '485219675', 'MM', '2021-04-26 05:36:40'),
(9, 'XI2019', '125469852', 'RPL', '2021-04-26 05:36:40'),
(10, 'XI2019', '657982415', 'RPL', '2021-04-26 05:36:40'),
(11, 'XII2018', '178293564', 'MM', '2021-04-26 05:36:40'),
(12, 'XII2018', '745216983', 'RPL', '2021-04-26 05:36:40'),
(13, 'XII2018', '985632147', 'RPL', '2021-04-26 05:36:40'),
(14, 'XII2018', '784163985', 'MM', '2021-04-26 05:36:40'),
(15, 'XII2018', '745963584', 'RPL', '2021-04-26 05:36:40'),
(17, 'X2021', '000001111', 'RPL', '2021-04-27 02:51:06'),
(20, 'X2021', '465258563', 'RPL', '2021-04-28 00:51:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_guru`
--

CREATE TABLE `tbl_guru` (
  `id_guru` varchar(60) NOT NULL,
  `nama_guru` text DEFAULT NULL,
  `nip` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_guru`
--

INSERT INTO `tbl_guru` (`id_guru`, `nama_guru`, `nip`) VALUES
('DG-0001', 'Irwansyah Saputra. S.kom.', '65235861975'),
('DG-0002', 'Surya Herdiansyah. S.Kom.', '18624974288'),
('DG-0003', 'Wahyudi. S.T.', '33232323211'),
('DG-0004', 'Kalingga Putra. S.Kom', '28349293488'),
('DG-0005', 'Reni Setiansyah. S.Kom.', '23423423434');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jurusan`
--

CREATE TABLE `tbl_jurusan` (
  `id_jurusan` varchar(60) NOT NULL,
  `jurusan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_jurusan`
--

INSERT INTO `tbl_jurusan` (`id_jurusan`, `jurusan`) VALUES
('MM', 'Multimedia'),
('RPL', 'Rekayasa Perangkat Lunak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kelas`
--

CREATE TABLE `tbl_kelas` (
  `id_kelas` varchar(60) NOT NULL,
  `kelas` text DEFAULT NULL,
  `id_guru` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_kelas`
--

INSERT INTO `tbl_kelas` (`id_kelas`, `kelas`, `id_guru`) VALUES
('X2021', 'Kelas X Angkatan 2021/2022', 'DG-0001'),
('XI2019', 'Kelas XI Angkatan 2018/2019', 'DG-0003'),
('XII2018', 'Kelas XII Angkatan 2019/2020', 'DG-0005');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_siswa`
--

CREATE TABLE `tbl_siswa` (
  `nis` varchar(60) NOT NULL,
  `nama_siswa` text DEFAULT NULL,
  `jenis_kelamin` text DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_telp` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `tgl_terdaftar` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_siswa`
--

INSERT INTO `tbl_siswa` (`nis`, `nama_siswa`, `jenis_kelamin`, `alamat`, `no_telp`, `email`, `tgl_terdaftar`) VALUES
('000001111', 'joestar', 'laki - laki', 'mega', '81XXXXXXXX', 'jo@gmail.com', '2021-04-27 02:51:06'),
('000022222', 'joestar', 'laki - laki', 'mega', '81XXXXXXXX', 'jo@gmail.com', '2021-04-28 00:50:23'),
('125469852', 'Ghina Syafa', 'Perempuan', 'Babatan,Banten', '081xxxxxxxxx', 'syafa@gmail.com', '2021-04-27 03:39:16'),
('162534759', 'Hendi Afrandi', 'Laki-laki', 'Cikarang,Bekasi', '081xxxxxxxxx', 'hendi@gmail.com', '2021-04-26 06:24:54'),
('178293564', 'Putra Aryanto', 'Laki-laki', 'Cikarang,Bekasi', '081xxxxxxxxx', 'putra@gmail.com', '2021-04-26 06:25:59'),
('456287951', 'Wahyu Saputra', 'Laki-laki', 'Pandeglang,Banten', '081xxxxxxxxx', 'wahyu@gmail.com', '2021-04-26 06:25:25'),
('465258563', 'fun', 'laki - laki', 'regency', '81XXXXXXXX', 'fun@gmail.com', '2021-04-28 00:51:42'),
('485219675', 'Wisnu Farnandi', 'Laki-laki', 'Cikarang,Bekasi', '081xxxxxxxxx', 'wisnu@gmail.com', '2021-04-26 06:25:33'),
('542836985', 'Wawan Handoyo', 'Laki-laki', 'Cikarang,Bekasi', '081xxxxxxxxx', 'wawan@gmail.com', '2021-04-26 06:24:16'),
('546988564', 'Lukman', 'Laki-laki', 'Cikarang,Bekasi', '081xxxxxxxxx', 'lukman@gmail.com', '2021-04-26 06:24:05'),
('64221548512', 'joes', 'laki - laki', 'mega', '81XXXXXXXX', 'jo@gmail.com', '2021-04-28 00:50:46'),
('657982415', 'Sufyan Iantara', 'Laki-laki', 'Ciracas,Jakarta', '081xxxxxxxxx', 'sufyan@gmail.com', '2021-04-26 06:25:50'),
('745216935', 'Rendi Ariansyah', 'Laki-laki', 'Cikarang,Bekasi', '081xxxxxxxxx', 'rendi@gmail.com', '2021-04-26 06:25:14'),
('745216983', 'Setya Budi Rahman', 'Laki-laki', 'Cikarang,Bekasi', '081xxxxxxxxx', 'setya@gmail.com', '2021-04-26 06:26:07'),
('745963584', 'Rendra Adijaya', 'Laki-laki', 'Cibitung,Bekasi', '081xxxxxxxxx', 'rendra@gmail.com', '2021-04-26 06:26:38'),
('784163985', 'Wayana Irham', 'Laki-laki', 'Balumbung,Bali', '081xxxxxxxxx', 'wayan@gmail.com', '2021-04-26 06:26:28'),
('785214562', 'Lita Bianka', 'Perempuan', 'Cikarang,Bekasi', '081xxxxxxxxx', 'lita@gmail.com', '2021-04-26 06:24:29'),
('965826584', 'Winda Ayuningtias', 'Perempuan', 'Cikeas,Bogor', '081xxxxxxxxx', 'windah@gmail.com', '2021-04-26 06:24:39'),
('985632147', 'Suci Pudjiastuti', 'Perempuan', 'Cikarang,Bekasi', '081xxxxxxxxx', 'suci@gmail.com', '2021-04-26 06:26:16');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_datasiswa`
--
ALTER TABLE `tbl_datasiswa`
  ADD PRIMARY KEY (`id_datasiswa`,`id_kelas`,`nis`,`id_jurusan`),
  ADD KEY `fk_jur2datasiswa` (`id_jurusan`),
  ADD KEY `fk_kls2datasiswa` (`id_kelas`),
  ADD KEY `fk_ssw2datasiswa` (`nis`);

--
-- Indeks untuk tabel `tbl_guru`
--
ALTER TABLE `tbl_guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indeks untuk tabel `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indeks untuk tabel `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD PRIMARY KEY (`id_kelas`,`id_guru`),
  ADD KEY `fk_gr2kelas` (`id_guru`);

--
-- Indeks untuk tabel `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD PRIMARY KEY (`nis`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_datasiswa`
--
ALTER TABLE `tbl_datasiswa`
  MODIFY `id_datasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_datasiswa`
--
ALTER TABLE `tbl_datasiswa`
  ADD CONSTRAINT `fk_jur2datasiswa` FOREIGN KEY (`id_jurusan`) REFERENCES `tbl_jurusan` (`id_jurusan`),
  ADD CONSTRAINT `fk_kls2datasiswa` FOREIGN KEY (`id_kelas`) REFERENCES `tbl_kelas` (`id_kelas`),
  ADD CONSTRAINT `fk_ssw2datasiswa` FOREIGN KEY (`nis`) REFERENCES `tbl_siswa` (`nis`);

--
-- Ketidakleluasaan untuk tabel `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD CONSTRAINT `fk_gr2kelas` FOREIGN KEY (`id_guru`) REFERENCES `tbl_guru` (`id_guru`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
