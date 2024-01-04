-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Okt 2023 pada 15.04
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sewamobil-ganta`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `mobil`
--

CREATE TABLE `mobil` (
  `ID_mobil` int(11) NOT NULL,
  `merek` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `tahun_produksi` int(11) NOT NULL,
  `warna` varchar(255) NOT NULL,
  `nomor_plat` varchar(20) NOT NULL,
  `harga_perhari` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mobil`
--

INSERT INTO `mobil` (`ID_mobil`, `merek`, `model`, `tahun_produksi`, `warna`, `nomor_plat`, `harga_perhari`) VALUES
(2, 'toyota', 'avanza', 2017, 'silver', 'AB1904DC', 300000.00),
(3, 'daihatsu', 'xenia', 2014, 'black', 'AA3452BM', 300000.00),
(4, 'suzuki', 'ertiga', 2014, 'grey', 'AB1908UH', 300000.00),
(5, 'honda', 'mobilio', 2015, 'white', 'AD2005CC', 300000.00),
(6, 'toyota', 'agya', 2016, 'red', 'AD2302DF', 250000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `ID_pelanggan` int(11) NOT NULL,
  `Nama_pelanggan` varchar(255) NOT NULL,
  `Alamat` varchar(255) NOT NULL,
  `No_telpon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`ID_pelanggan`, `Nama_pelanggan`, `Alamat`, `No_telpon`) VALUES
(1, 'Haikal permata', 'perumahan neo city', '089513362389'),
(2, 'jeman nareshwari', 'perumahan citra lestari', '089546462343'),
(3, 'Miko sanjaya', 'Jl. merdeka raya no 8', '087362837459'),
(4, 'shaka antares', 'Jl. kwangya no 3', '087745632890'),
(5, 'karina gisellea', 'Jl. melati indah no 6', '08654132898');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `ID_pembayaran` int(11) NOT NULL,
  `ID_penyewaan` int(11) NOT NULL,
  `metode_pembayaran` varchar(255) NOT NULL,
  `tanggal_pembayaran` date NOT NULL,
  `jumlah_pembayran` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`ID_pembayaran`, `ID_penyewaan`, `metode_pembayaran`, `tanggal_pembayaran`, `jumlah_pembayran`) VALUES
(12, 1, 'Tunai', '2023-09-05', 600000.00),
(13, 2, 'transfer', '2023-09-10', 900000.00),
(14, 3, 'tunai', '2023-09-15', 600000.00),
(15, 4, 'tunai', '2023-09-22', 1200000.00),
(16, 5, 'transfer', '2023-09-27', 1000000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyewaan`
--

CREATE TABLE `penyewaan` (
  `ID_penyewaan` int(11) NOT NULL,
  `ID_pelanggan` int(11) NOT NULL,
  `ID_mobil` int(11) NOT NULL,
  `Tanggal_penyewaan` date NOT NULL,
  `Tanggal_pengembalian` date NOT NULL,
  `total_biaya` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penyewaan`
--

INSERT INTO `penyewaan` (`ID_penyewaan`, `ID_pelanggan`, `ID_mobil`, `Tanggal_penyewaan`, `Tanggal_pengembalian`, `total_biaya`) VALUES
(1, 1, 2, '2023-09-05', '2023-09-07', 60000.00),
(2, 2, 3, '2023-09-10', '2023-10-13', 900000.00),
(3, 3, 4, '2023-09-15', '2023-10-17', 600000.00),
(4, 4, 5, '2023-09-22', '2023-10-26', 1200000.00),
(5, 5, 6, '2023-10-27', '2023-10-31', 1000000.00);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`ID_mobil`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`ID_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`ID_pembayaran`),
  ADD KEY `FK_penyewaan` (`ID_penyewaan`);

--
-- Indeks untuk tabel `penyewaan`
--
ALTER TABLE `penyewaan`
  ADD PRIMARY KEY (`ID_penyewaan`),
  ADD KEY `FK_pelanggan` (`ID_pelanggan`),
  ADD KEY `FK_mobil` (`ID_mobil`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `mobil`
--
ALTER TABLE `mobil`
  MODIFY `ID_mobil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `ID_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `ID_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `penyewaan`
--
ALTER TABLE `penyewaan`
  MODIFY `ID_penyewaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `FK_penyewaan` FOREIGN KEY (`ID_penyewaan`) REFERENCES `penyewaan` (`ID_penyewaan`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penyewaan`
--
ALTER TABLE `penyewaan`
  ADD CONSTRAINT `FK_mobil` FOREIGN KEY (`ID_mobil`) REFERENCES `mobil` (`ID_mobil`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pelanggan` FOREIGN KEY (`ID_pelanggan`) REFERENCES `pelanggan` (`ID_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
