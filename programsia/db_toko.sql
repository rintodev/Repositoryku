-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 13, 2020 at 04:48 AM
-- Server version: 5.1.37
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_toko`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `kodebarang` char(5) NOT NULL,
  `nmbarang` varchar(25) NOT NULL,
  `satuan` varchar(25) NOT NULL,
  `stok` float NOT NULL,
  `hargabeli` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kodebarang`, `nmbarang`, `satuan`, `stok`, `hargabeli`) VALUES
('B001', 'CUP', 'PCS', 168, 800),
('B002', 'BIJI SEDUH', 'GRAM', 50, 8000),
('B003', 'GULA AREN', 'GRAM', 14.5, 1000),
('B004', 'SUSU CAIR', 'LITER', 10, 17000),
('B005', 'RAM', 'PCS', 10, 25000),
('B006', 'BIJI SANGER', 'GRAM', 9, 10000),
('B007', 'BIJI KENTAL', 'GRAM', 5, 8000),
('B008', 'REGAL', 'KALENG', 66, 18000),
('B009', 'HOUJICHA', 'GRAM', 50, 5000),
('B010', 'GULA CAIR', 'GRAM', 124, 5000),
('B011', 'SIRUP CARAMEL', 'BOTOL', 5, 15000),
('B012', 'MILO', 'PCS', 71, 4000);

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE IF NOT EXISTS `detail_penjualan` (
  `nofaktur` char(5) NOT NULL,
  `kodebarang` varchar(5) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` float NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_penjualan`
--

INSERT INTO `detail_penjualan` (`nofaktur`, `kodebarang`, `nama`, `harga`, `jumlah`, `subtotal`) VALUES
('NF001', 'P005', 'LATTE', 20000, 3, 60000),
('NF002', 'P008', 'CAPPUCINO', 15000, 5, 75000);

-- --------------------------------------------------------

--
-- Table structure for table `eoq`
--

CREATE TABLE IF NOT EXISTS `eoq` (
  `id_eoq` char(5) NOT NULL,
  `kodebarang` char(5) NOT NULL,
  `kbthn_tahun` varchar(25) NOT NULL,
  `by_simpan` int(11) NOT NULL,
  `by_pesan` int(11) NOT NULL,
  `jml_pesan` int(11) NOT NULL,
  `jeda` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eoq`
--

INSERT INTO `eoq` (`id_eoq`, `kodebarang`, `kbthn_tahun`, `by_simpan`, `by_pesan`, `jml_pesan`, `jeda`) VALUES
('I001', 'B001', '78', 1000, 1000, 90, 30),
('I002', 'B008', '50', 1000, 1000, 60, 36),
('I003', 'B010', '100', 1000, 1000, 114, 26),
('I004', 'B012', '50', 1000, 1000, 60, 36);

-- --------------------------------------------------------

--
-- Table structure for table `jurnal`
--

CREATE TABLE IF NOT EXISTS `jurnal` (
  `tgltransaksi` date NOT NULL,
  `kdtransaksi` varchar(25) NOT NULL,
  `kdperkiraan` varchar(25) NOT NULL,
  `ket` varchar(25) NOT NULL,
  `jenis` varchar(10) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `debit` int(11) NOT NULL,
  `kredit` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurnal`
--

INSERT INTO `jurnal` (`tgltransaksi`, `kdtransaksi`, `kdperkiraan`, `ket`, `jenis`, `jumlah`, `debit`, `kredit`) VALUES
('2020-01-01', 'F001', 'J001', 'MODAL AWAL', 'KREDIT', 3000000, 0, 3000000),
('2020-01-01', 'F002', 'J001', 'MODAL AWAL', 'DEBIT', 3000000, 3000000, 0),
('2020-01-01', 'F003', 'J002', 'BELI CUP', 'KREDIT', 72000, 0, 72000),
('2020-01-01', 'F004', 'J002', 'BELI CUP', 'DEBIT', 72000, 72000, 0),
('2020-01-01', 'F006', 'J003', 'PENJUALAN LATTE', 'KREDIT', 60000, 0, 60000),
('2020-01-01', 'F005', 'J002', 'PENJUALAN LATTE', 'DEBIT', 60000, 0, 0),
('2020-01-03', 'F007', 'J003', 'PENJUALAN CAPUCINO', 'KREDIT', 75000, 0, 75000),
('2020-01-03', 'F008', 'J002', 'PENJUALAN CAPUCINO', 'DEBIT', 75000, 75000, 0),
('2020-01-03', 'F009', 'J002', 'PRIVE', 'KREDIT', 50000, 0, 50000),
('2020-01-03', 'F010', 'J008', 'PRIVE', 'DEBIT', 50000, 50000, 0),
('2020-01-01', 'F011', 'J002', 'PEMBELIAN REGAL', 'KREDIT', 1080000, 0, 1080000),
('2020-01-01', 'F012', 'J003', 'PEMBELIAN REGAL', 'DEBIT', 108000, 108000, 0),
('2020-01-15', 'F013', 'J002', 'PEMBELIAN GULA CAIR', 'KREDIT', 570000, 0, 570000),
('2020-01-15', 'F014', 'J003', 'PEMBELIAN GULA CAIR', 'DEBIT', 570000, 570000, 0),
('2020-01-15', 'F015', 'J003', 'PEMBELIAN MILO', 'DEBIT', 200000, 200000, 0),
('2020-01-15', 'F016', 'J002', 'PEMBELIAN MILO', 'KREDIT', 200000, 0, 200000);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE IF NOT EXISTS `pembelian` (
  `no_faktur_beli` char(5) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `idpemasok` char(5) NOT NULL,
  `harga_total` int(11) NOT NULL,
  PRIMARY KEY (`no_faktur_beli`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`no_faktur_beli`, `tgl_pembelian`, `idpemasok`, `harga_total`) VALUES
('F002', '2020-01-01', 'P001', 1080000),
('F001', '2020-01-01', 'P001', 72000),
('F003', '2020-01-15', 'P001', 570000),
('F004', '2020-01-15', 'P001', 200000);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE IF NOT EXISTS `penjualan` (
  `nofaktur` varchar(5) NOT NULL,
  `tgl` date NOT NULL,
  `hargatotal` int(11) NOT NULL,
  PRIMARY KEY (`nofaktur`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`nofaktur`, `tgl`, `hargatotal`) VALUES
('NF001', '2020-01-01', 60000),
('NF002', '2020-01-01', 75000);

-- --------------------------------------------------------

--
-- Table structure for table `perkiraan`
--

CREATE TABLE IF NOT EXISTS `perkiraan` (
  `kdperkiraan` varchar(25) NOT NULL,
  `namaperkiraan` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perkiraan`
--

INSERT INTO `perkiraan` (`kdperkiraan`, `namaperkiraan`) VALUES
('J002', 'KHAS'),
('J001', 'MODAL AWAL'),
('J003', 'PERALATAN'),
('J004', 'PERLENGKAPAN'),
('J005', 'BIAYA GAJI'),
('J006', 'BIAYA AIR DAN LISTRIK'),
('J007', 'PENDAPATAN'),
('J008', 'PRIVE'),
('J009', 'SEWA TOKO'),
('J010', 'PENAMBAHAN MODAL');

-- --------------------------------------------------------

--
-- Table structure for table `posting`
--

CREATE TABLE IF NOT EXISTS `posting` (
  `kdperkiraan` varchar(25) NOT NULL,
  `saldoakhir` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posting`
--

INSERT INTO `posting` (`kdperkiraan`, `saldoakhir`) VALUES
('J001', 3000000),
('J002', 1972000),
('J003', 878000),
('J008', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `rincian_pembelian`
--

CREATE TABLE IF NOT EXISTS `rincian_pembelian` (
  `no_faktur_beli` char(5) NOT NULL,
  `kodebarang` char(5) NOT NULL,
  `nama` varchar(12) NOT NULL,
  `harga_barang` int(11) NOT NULL,
  `jumlah_beli` float NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rincian_pembelian`
--

INSERT INTO `rincian_pembelian` (`no_faktur_beli`, `kodebarang`, `nama`, `harga_barang`, `jumlah_beli`, `subtotal`) VALUES
('F002', 'B008', 'REGAL', 18000, 60, 1080000),
('F001', 'B001', 'CUP', 800, 90, 72000),
('F003', 'B010', 'GULA CAIR', 5000, 114, 570000),
('F004', 'B012', 'MILO', 4000, 50, 200000);

-- --------------------------------------------------------

--
-- Table structure for table `suplier`
--

CREATE TABLE IF NOT EXISTS `suplier` (
  `idpemasok` char(5) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `nohp` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suplier`
--

INSERT INTO `suplier` (`idpemasok`, `nama`, `nohp`) VALUES
('P001', 'TOKO HASAN', '085275750831'),
('P002', 'TOKO ANANDA', '082284450263'),
('P003', 'TOKO YUR', '0852646468902');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user` varchar(25) NOT NULL,
  `pass` varchar(25) NOT NULL,
  `level` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user`, `pass`, `level`) VALUES
('RINTO', '12345', 'ADMIN'),
('RANTI', '12345', 'BAGIAN GUDANG'),
('PUTRA', '12345', 'PIMPINAN');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
