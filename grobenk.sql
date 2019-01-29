-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 29, 2019 at 05:08 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grobenk`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(100) COLLATE utf8mb4_croatian_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_croatian_ci NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('root', 'root');

-- --------------------------------------------------------

--
-- Table structure for table `bolnica`
--

DROP TABLE IF EXISTS `bolnica`;
CREATE TABLE IF NOT EXISTS `bolnica` (
  `idbolnica` int(10) UNSIGNED NOT NULL,
  `naziv_bolnice` varchar(45) COLLATE utf8mb4_croatian_ci NOT NULL,
  `grad` varchar(45) COLLATE utf8mb4_croatian_ci NOT NULL,
  `adresa_bolnice` varchar(45) COLLATE utf8mb4_croatian_ci DEFAULT NULL,
  `postanski_broj` int(11) DEFAULT NULL,
  `password` varchar(10) COLLATE utf8mb4_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`idbolnica`),
  UNIQUE KEY `idbolnica_UNIQUE` (`idbolnica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `bolnica`
--

INSERT INTO `bolnica` (`idbolnica`, `naziv_bolnice`, `grad`, `adresa_bolnice`, `postanski_broj`, `password`) VALUES
(101, 'KBC Susak', 'Zagreb', 'Kreï¿½imirova', 51001, '101'),
(102, 'KBC Sisak', 'Sisak', 'Sisacka 13', 57474, 'kbcri56'),
(103, 'KBC Zagreb', 'Zagreb', 'Ilica 15', 50000, 'zajc45'),
(104, 'KBC', 'Zadar', 'Zadarska 13', 43000, 'dubdub'),
(105, 'KBC Draga', 'Draga', 'Kelinova 14', 51088, 'kbc89');

-- --------------------------------------------------------

--
-- Table structure for table `donacija`
--

DROP TABLE IF EXISTS `donacija`;
CREATE TABLE IF NOT EXISTS `donacija` (
  `id_donacija` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kolicina_krvi_donacije` float UNSIGNED NOT NULL,
  `krvna_grupa_zal` varchar(45) COLLATE utf8mb4_croatian_ci NOT NULL,
  `OIB_donora` double UNSIGNED NOT NULL,
  `idlokacija` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_donacija`),
  UNIQUE KEY `id_donacija_UNIQUE` (`id_donacija`),
  KEY `fk_donacija_donor_idx` (`OIB_donora`),
  KEY `fk_donacija_lokacija1_idx` (`idlokacija`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `donacija`
--

INSERT INTO `donacija` (`id_donacija`, `kolicina_krvi_donacije`, `krvna_grupa_zal`, `OIB_donora`, `idlokacija`) VALUES
(14, 0.5, 'A+', 62039216922, 2),
(15, 0.6, 'AB-', 57523379503, 2),
(16, 0.2, 'B+', 18814952778, 2),
(17, 0.5, 'AB-', 25905508615, 11),
(18, 0.5, 'AB-', 25905508615, 10),
(19, 0.2, 'A+', 62039216922, 1),
(20, 0.4, 'B+', 18814952778, 12);

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
CREATE TABLE IF NOT EXISTS `donor` (
  `OIB_donora` double UNSIGNED NOT NULL,
  `krvna_grupa_don` varchar(100) COLLATE utf8mb4_croatian_ci NOT NULL,
  `ime_prezime_donora` varchar(45) COLLATE utf8mb4_croatian_ci NOT NULL,
  `datum_rodenja` date NOT NULL,
  `prebivaliste` varchar(45) COLLATE utf8mb4_croatian_ci NOT NULL,
  `postanski_broj` int(10) UNSIGNED NOT NULL,
  `broj_mobitela` int(10) UNSIGNED NOT NULL,
  `mail_donora` varchar(45) COLLATE utf8mb4_croatian_ci DEFAULT NULL,
  `spol` varchar(2) COLLATE utf8mb4_croatian_ci NOT NULL,
  `adresa_donora` varchar(45) COLLATE utf8mb4_croatian_ci DEFAULT NULL,
  `username` varchar(100) COLLATE utf8mb4_croatian_ci NOT NULL,
  `password` varchar(10) COLLATE utf8mb4_croatian_ci DEFAULT NULL,
  `br_donacija` int(11) DEFAULT NULL,
  `image` varchar(300) COLLATE utf8mb4_croatian_ci NOT NULL,
  PRIMARY KEY (`OIB_donora`),
  UNIQUE KEY `OIB_donora_UNIQUE` (`OIB_donora`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`OIB_donora`, `krvna_grupa_don`, `ime_prezime_donora`, `datum_rodenja`, `prebivaliste`, `postanski_broj`, `broj_mobitela`, `mail_donora`, `spol`, `adresa_donora`, `username`, `password`, `br_donacija`, `image`) VALUES
(6781251619, 'A+', 'Romano Polić', '2019-01-11', 'Rijeka', 51000, 998861132, 'romano@gmail.com', 'M', 'Rastočine 8', 'romano12', 'romano', 0, 'mario_PNG55.png'),
(10528147607, 'AB+', 'Domagoj Buljubašić', '1995-02-03', 'Zagreb', 51000, 954472385, 'dodoz43@gmail.com', 'M', 'Turni?i 12', 'domagoj', 'dodo123', 7, 'image2.jpg'),
(13115585171, 'A-', 'Marko Stojaković', '1960-02-12', 'Zagreb', 51000, 924563789, 'marko_stokjo@gmail.com', 'M', 'Grabovac', 'marko', 'marko123', 23, 'image3.jpg'),
(13115585172, 'AB+', 'Maja Vrsaljko', '1998-11-01', 'Zadar', 23000, 924563780, 'mvrsaljko@riteh.hr', 'Z', 'Benkovac 22', 'maja2', 'majab91', 0, 'image11.png'),
(18814952778, 'B+', 'Tyrion Lannister', '1968-06-10', 'Kings Landing', 51000, 997763321, 'tyrion123@gmail.com', 'M', 'Casterly Rock', 'tyrion', 'got123', 27, 'image12.jpg'),
(24821182322, 'B-', 'Patricija Dadič', '1992-05-23', 'Rijeka', 51000, 998751246, 'patry@gmail.com', 'Z', 'Kapelska', 'patricija', '123456', 11, 'image5.png'),
(25905508615, 'AB-', 'Katarina Anić', '2019-01-12', 'Rijeka', 51000, 914537810, 'anica_frketic@gmail.com', 'Z', 'Vojni put 16', 'katarina', 'anica123', 17, 'preuzmi.jpg'),
(29389527738, '0+', 'Maja Vukelić', '1987-12-21', 'Kaštel Sućurac', 21213, 924789234, 'majavuk@hotmail.com', 'Z', 'Suva?a 10', 'maja', 'maja123', 14, 'image6.jpg'),
(46834013129, 'B-', 'Marija Čupić', '2018-08-31', 'Zagreb', 51000, 567345, 'cucic@gmail.com', 'Z', 'Ilica 12', 'mare', 'marica', 0, 'image5.png'),
(47903334648, '0-', 'Jasmin Stanković', '1990-05-08', 'Rijeka', 51000, 925563594, 'jasmin456@gmail.com', 'Z', 'Adami?eva 3', 'jasmin', 'jasmin123', 14, 'image8.jpg'),
(57523379503, 'AB-', 'Dalibor Trumbetić', '1972-06-12', 'Split', 21000, 998845574, 'dalibor_trumbetic@gmail.com', 'M', 'Trumbi?eva obala 13', 'dali12', '12345', 12, 'image4.jpg'),
(62039216922, 'A+', 'Irma Plantak', '1992-06-18', 'Zagreb', 21000, 953341523, 'irma123@gmail.com', 'Z', 'Ante Star?evi?a 10', 'irma', 'irma123', 15, 'image7.jpg'),
(79220235879, 'AB+', 'Vinko Sabić', '1983-08-05', 'Split', 21000, 991132563, 'vino_sab@gmail.com', 'M', 'ï¿½abanova 24', 'vinko', 'vinko123', 10, 'image10.jpg'),
(92279595902, '0-', 'Karolina Tušek', '1965-09-06', 'Split', 21000, 991142589, 'karolina_tusek@gmail.com', 'Z', 'Hercegova?ka 1', 'karolina', 'karolina', 23, 'image6.jpg'),
(99218368216, 'A+', 'Klara Vidaković', '1970-05-02', 'Split', 21000, 994573109, 'klara1234@gmail.com', 'Z', 'Pojišanska 18', 'klara', 'klara213', 21, 'image9.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
CREATE TABLE IF NOT EXISTS `followers` (
  `donor_OIB_donora` double UNSIGNED NOT NULL,
  `OIB_prijatelja` double DEFAULT NULL,
  KEY `fk_followers_donor1` (`donor_OIB_donora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`donor_OIB_donora`, `OIB_prijatelja`) VALUES
(29389527738, 62039216922),
(25905508615, 62039216922),
(25905508615, 57523379503),
(29389527738, 62039216922),
(25905508615, 62039216922),
(25905508615, 57523379503),
(57523379503, 13115585171),
(25905508615, 13115585172),
(62039216922, 25905508615),
(29389527738, 25905508615),
(57523379503, 25905508615),
(13115585172, 25905508615),
(13115585172, 10528147607),
(25905508615, 10528147607),
(10528147607, 25905508615);

-- --------------------------------------------------------

--
-- Table structure for table `following`
--

DROP TABLE IF EXISTS `following`;
CREATE TABLE IF NOT EXISTS `following` (
  `donor_OIB_donora` double UNSIGNED NOT NULL,
  `OIB_prijatelja` double DEFAULT NULL,
  KEY `donor_OIB_donora` (`donor_OIB_donora`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `following`
--

INSERT INTO `following` (`donor_OIB_donora`, `OIB_prijatelja`) VALUES
(62039216922, 74678436),
(62039216922, 29389527738),
(62039216922, 25905508615),
(62039216922, 74678436),
(62039216922, 29389527738),
(62039216922, 25905508615),
(13115585171, 57523379503),
(13115585172, 25905508615),
(25905508615, 62039216922),
(25905508615, 29389527738),
(25905508615, 57523379503),
(25905508615, 13115585172),
(10528147607, 13115585172),
(10528147607, 25905508615),
(25905508615, 10528147607);

-- --------------------------------------------------------

--
-- Table structure for table `komentari`
--

DROP TABLE IF EXISTS `komentari`;
CREATE TABLE IF NOT EXISTS `komentari` (
  `user_autora` varchar(300) COLLATE utf8mb4_croatian_ci NOT NULL,
  `autor` varchar(100) COLLATE utf8mb4_croatian_ci NOT NULL,
  `idbolnica_bol` int(10) UNSIGNED NOT NULL,
  `tekst_komentara` varchar(300) COLLATE utf8mb4_croatian_ci DEFAULT NULL,
  `datum_kom` datetime NOT NULL,
  KEY `id_bolnica_fk` (`idbolnica_bol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `komentari`
--

INSERT INTO `komentari` (`user_autora`, `autor`, `idbolnica_bol`, `tekst_komentara`, `datum_kom`) VALUES
('', 'KBC Rijeka', 101, 'Hvala svima na donacijama! Ovdje možete ostavljati svoje komentare, prijedloge i slično!', '2018-12-27 00:00:00'),
('domagoj', 'Domagoj Buljubasic', 101, 'Pozdrav plavoj sestri sa šaltera 5 hehe xD', '2019-01-02 00:00:00'),
('domagoj', 'Domagoj Buljubasic', 101, 'gegep', '2019-01-04 00:00:00'),
('anica6', 'Katarina Ani?', 101, 'test test\r\n', '2019-01-08 00:00:00'),
('101', 'KBC Susak', 101, 'dobro jutro', '2019-01-09 00:00:00'),
('anica6', 'Katarina Ani?', 101, 'test12', '2019-01-09 00:00:00'),
('101', 'KBC Susak', 101, 'lalalalla', '2019-01-09 00:00:00'),
('anica6', 'Katarina Ani?', 103, 'nenenen', '2019-01-09 00:00:00'),
('101', 'KBC Susak', 101, 'HEHE\r\n', '2019-01-10 00:00:00'),
('101', 'KBC Susak', 101, 'test 12', '2019-01-10 00:00:00'),
('101', 'KBC Susak', 101, 'lalala', '2019-01-10 00:00:00'),
('anica6', 'Katarina Ani?', 101, 'fztztfzt', '2019-01-10 00:00:00'),
('101', 'KBC Susak', 101, 'hehehe', '2019-01-23 00:00:00'),
('101', 'KBC Susak', 101, 'gjhfhg', '2019-01-23 00:00:00'),
('101', 'KBC Susak', 101, 'gjhfhg', '2019-01-23 00:00:00'),
('101', 'KBC Susak', 101, 'gjhfhg', '2019-01-23 00:00:00'),
('anica6', 'Katarina Ani?', 101, 'hejjj', '2019-01-23 00:00:00'),
('domagoj', 'Domagoj Buljubasic', 101, 'lalalalal', '2019-01-23 00:00:00'),
('domagoj', 'Domagoj Buljubasic', 101, 'lalalalal', '2019-01-23 00:00:00'),
('101', 'KBC Susak', 101, 'ćao ćao', '2019-01-23 00:00:00'),
('101', 'KBC Susak', 101, '1 2 3 ', '2019-01-24 00:00:00'),
('101', 'KBC Susak', 101, '1 2 3 ', '2019-01-24 00:00:00'),
('101', 'KBC Susak', 101, '1 2 3 ', '2019-01-24 00:00:00'),
('101', 'KBC Susak', 101, '1 2 3 ', '2019-01-24 00:00:00'),
('101', 'KBC Susak', 101, 'test test test', '2019-01-24 00:00:00'),
('101', 'KBC Susak', 101, '1 2 danas je dacn', '2019-01-25 00:00:00'),
('domagoj', 'Domagoj Buljubasic', 101, 'dan je dan za metak', '2019-01-25 00:00:00'),
('domagoj', 'Domagoj Buljubasic', 101, 'dan je dan za metak', '2019-01-25 00:00:00'),
('domagoj', 'Domagoj Buljubasic', 101, 'jhfsdf', '2019-01-25 00:00:00'),
('domagoj', 'Domagoj Buljubasic', 101, 'jhfsdf', '2019-01-25 00:00:00'),
('domagoj', 'Domagoj Buljubasic', 101, 'sranjeee', '2019-01-25 00:00:00'),
('domagoj', 'Domagoj Buljubasic', 101, 'hellou', '2019-01-25 14:02:59'),
('katarina', 'Katarina CocaCola', 101, 'Dobra večer prijatelji', '2019-01-25 17:48:04');

-- --------------------------------------------------------

--
-- Table structure for table `lokacija`
--

DROP TABLE IF EXISTS `lokacija`;
CREATE TABLE IF NOT EXISTS `lokacija` (
  `id_lokacije` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `grad` varchar(45) COLLATE utf8mb4_croatian_ci NOT NULL,
  `naziv_lokacije` varchar(45) COLLATE utf8mb4_croatian_ci DEFAULT NULL,
  `adresa_lokacije` varchar(45) COLLATE utf8mb4_croatian_ci DEFAULT NULL,
  `postanski_broj` int(10) UNSIGNED DEFAULT NULL,
  `datum_dogadaja` date NOT NULL,
  `start` time NOT NULL,
  `kraj` time NOT NULL,
  `image` varchar(300) COLLATE utf8mb4_croatian_ci NOT NULL,
  PRIMARY KEY (`id_lokacije`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `lokacija`
--

INSERT INTO `lokacija` (`id_lokacije`, `grad`, `naziv_lokacije`, `adresa_lokacije`, `postanski_broj`, `datum_dogadaja`, `start`, `kraj`, `image`) VALUES
(1, 'Rijeka', 'Studentski Centar Rijeka', 'Radmile Matejcic 6', 51000, '2018-12-28', '07:00:00', '12:00:00', 'studentski_centar.jpg'),
(2, 'Rijeka', 'Studentski Centar Rijeka', 'Radmile Matejcic 5', 51000, '2019-01-05', '10:00:00', '14:00:00', 'studentski_centar.jpg'),
(3, 'Rijeka', 'Fakultet Zdravstvenih studija', 'Viktora cara Emina 5', 51000, '2019-01-15', '08:00:00', '09:00:00', 'fzs_ri.JPG'),
(4, 'Zagreb', 'Fakultet elektrotehnike i računarstva', 'Unska ul. 3', 10000, '2019-01-05', '11:30:00', '13:30:00', 'fer_02.jpg'),
(5, 'Zagreb', 'Klinicki bolnicki cetar Sestre milosrdnice', 'Vinogradska cesta 29', 10000, '2019-01-08', '07:15:00', '13:45:00', 'sestre_milosrdnice.jpg'),
(6, 'Rijeka', 'Gradska knjižnica Rijeka', 'Ul. Matije Gupca 23', 51000, '2019-01-02', '15:00:00', '18:30:00', 'Gorana-Tuskan-v.d.-ravnateljice-Gradske-knjiznice-Rijeka_ca_large.jpg'),
(7, 'Rijeka', 'Filozofski fakultet Rijeka', 'Sveučilišna Avenija 4', 51000, '2019-01-02', '09:00:00', '11:15:00', 'filozofski.jpg'),
(8, 'Zagreb', 'Medicinski fakultet Zagreb', 'Šalata ul. 2', 10000, '2019-01-09', '15:00:00', '17:00:00', 'med_zg.jpg'),
(9, 'Zagreb', 'Crveni križ Zagreb', 'Ilica 23', 10000, '2019-01-12', '13:00:00', '15:00:00', 'crveni_kriz.png'),
(10, 'Zagreb', 'Prehrabeno-biotehnološki fakultet', 'Pierottijeva ul. 6', 1000, '2019-01-10', '14:00:00', '19:00:00', 'pbf_zg.jpg'),
(12, 'Rijeka', 'Tehnički fakultet Rijeka', 'Vukovarska 58', 51000, '2019-01-09', '10:00:00', '13:00:00', 'tehnicki.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `moj_event`
--

DROP TABLE IF EXISTS `moj_event`;
CREATE TABLE IF NOT EXISTS `moj_event` (
  `OIB_donora_don` double UNSIGNED NOT NULL,
  `id_lokacije` int(11) UNSIGNED NOT NULL,
  `prisutnost` tinyint(4) NOT NULL,
  KEY `OIB_donora_idx` (`OIB_donora_don`),
  KEY `lokacija_fk` (`id_lokacije`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `moj_event`
--

INSERT INTO `moj_event` (`OIB_donora_don`, `id_lokacije`, `prisutnost`) VALUES
(29389527738, 1, 1),
(47903334648, 1, 1),
(92279595902, 3, 1),
(6781251619, 6, 1),
(79220235879, 10, -1),
(79220235879, 4, -1),
(46834013129, 4, 1),
(6781251619, 7, -1),
(18814952778, 8, -1),
(13115585171, 5, 0),
(18814952778, 6, 0),
(13115585171, 10, 1),
(99218368216, 5, 1),
(10528147607, 5, 1),
(13115585172, 10, 1),
(13115585172, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `obavijesti`
--

DROP TABLE IF EXISTS `obavijesti`;
CREATE TABLE IF NOT EXISTS `obavijesti` (
  `id_obavijesti` int(11) NOT NULL AUTO_INCREMENT,
  `OIBdonora` double NOT NULL,
  `ID_posiljatelja` double UNSIGNED NOT NULL,
  `tekst_obav` varchar(100) COLLATE utf8mb4_croatian_ci NOT NULL,
  `datum_obav` datetime NOT NULL,
  `procitano` int(11) NOT NULL,
  PRIMARY KEY (`id_obavijesti`),
  KEY `OIB_donora_fk` (`OIBdonora`)
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `obavijesti`
--

INSERT INTO `obavijesti` (`id_obavijesti`, `OIBdonora`, `ID_posiljatelja`, `tekst_obav`, `datum_obav`, `procitano`) VALUES
(577, 62039216922, 1, 'Trenutno je manjak vaše krvne grupe u zalihi. Razmislite o donaciji! Hvala!', '2019-01-26 00:00:00', 0),
(578, 99218368216, 1, 'Trenutno je manjak vaše krvne grupe u zalihi. Razmislite o donaciji! Hvala!', '2019-01-26 00:00:00', 0),
(579, 13115585172, 1, 'Trenutno je manjak vaše krvne grupe u zalihi. Razmislite o donaciji! Hvala!', '2019-01-26 00:00:00', 0),
(580, 13115585172, 10528147607, 'hejjjjjjjjj', '2019-01-27 13:53:23', 0),
(581, 13115585172, 10528147607, '123', '2019-01-27 13:53:26', 0),
(582, 10528147607, 13115585172, 'kako si', '2019-01-27 13:53:54', 0),
(583, 13115585172, 10528147607, '', '2019-01-27 14:54:59', 0),
(584, 13115585172, 10528147607, 'dobro ti', '2019-01-27 15:08:59', 0),
(585, 13115585172, 10528147607, '', '2019-01-27 15:09:03', 0),
(586, 25905508615, 10528147607, 'hejjj', '2019-01-27 15:29:21', 0),
(587, 10528147607, 25905508615, 'ćaoo', '2019-01-27 15:29:36', 0),
(588, 25905508615, 10528147607, 'kako si maco ? ', '2019-01-27 15:33:13', 0),
(589, 13115585172, 10528147607, 'poruka maji', '2019-01-27 15:33:42', 0),
(590, 25905508615, 10528147607, 'poruka kati', '2019-01-27 15:34:44', 0),
(591, 13115585172, 10528147607, 'zadnja poruka u 16:37 kati', '2019-01-27 15:37:10', 0),
(592, 10528147607, 13115585172, 'poruka domagojujujuujuj', '2019-01-28 14:59:56', 0),
(593, 25905508615, 10528147607, 'hejjj kako si katooooo', '2019-01-28 15:00:23', 0),
(594, 62039216922, 1, 'Trenutno je manjak vaše krvne grupe u zalihi. Razmislite o donaciji! Hvala!', '2019-01-28 00:00:00', 0),
(595, 99218368216, 1, 'Trenutno je manjak vaše krvne grupe u zalihi. Razmislite o donaciji! Hvala!', '2019-01-28 00:00:00', 0),
(596, 6781251619, 1, 'gufhgjg', '2019-01-28 00:00:00', 0),
(597, 24821182322, 1, 'gufhgjg', '2019-01-28 00:00:00', 0),
(598, 25905508615, 1, 'gufhgjg', '2019-01-28 00:00:00', 0),
(599, 47903334648, 1, 'gufhgjg', '2019-01-28 00:00:00', 0),
(600, 10528147607, 25905508615, 'zguhgj', '2019-01-28 15:49:16', 0);

-- --------------------------------------------------------

--
-- Table structure for table `poruke`
--

DROP TABLE IF EXISTS `poruke`;
CREATE TABLE IF NOT EXISTS `poruke` (
  `OIB_primatelja` double UNSIGNED NOT NULL,
  `OIB_prijatelja` int(11) NOT NULL,
  `tekst_poruke` varchar(300) COLLATE utf8mb4_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`OIB_primatelja`),
  UNIQUE KEY `OIB_donora_UNIQUE` (`OIB_primatelja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zahtjev`
--

DROP TABLE IF EXISTS `zahtjev`;
CREATE TABLE IF NOT EXISTS `zahtjev` (
  `idzahtjev` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_bolnica` int(10) UNSIGNED NOT NULL,
  `kolicina_krvi_zaht` float UNSIGNED NOT NULL,
  `krvna_grupa_zaht` varchar(45) COLLATE utf8mb4_croatian_ci NOT NULL,
  `datum_zahtjeva` date DEFAULT NULL,
  `odobreno` int(11) NOT NULL,
  PRIMARY KEY (`idzahtjev`),
  UNIQUE KEY `idzahtjev_UNIQUE` (`idzahtjev`),
  KEY `fk_zahtjev_bolnica1_idx` (`id_bolnica`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `zahtjev`
--

INSERT INTO `zahtjev` (`idzahtjev`, `id_bolnica`, `kolicina_krvi_zaht`, `krvna_grupa_zaht`, `datum_zahtjeva`, `odobreno`) VALUES
(1, 101, 1.5, 'A+', '2019-01-02', 1),
(5, 102, 2, 'AB-', '2019-01-02', -1),
(6, 104, 2, 'A+', '2019-01-02', -1),
(7, 103, 0.2, 'A+', '2019-01-02', -1),
(25, 101, 0.5, 'AB+', '2019-01-02', -1),
(26, 101, 1.5, 'B+', '2018-12-27', 1),
(27, 101, 5.5, 'A-', '2018-12-12', 1),
(29, 101, 0.4, 'B+', '2019-01-09', 1),
(30, 101, 0.4, 'B+', '2019-01-09', 1),
(31, 101, 0.5, 'A+', '2019-01-10', 1),
(32, 101, 0.5, 'A+', '2019-01-23', 0),
(33, 101, 0.5, 'A+', '2019-01-23', 0),
(34, 101, 0.5, 'A+', '2019-01-25', 0),
(35, 101, 25, 'AB+', '2019-01-26', 0),
(36, 101, 52, 'B-', '2019-01-26', 0);

-- --------------------------------------------------------

--
-- Table structure for table `zaliha`
--

DROP TABLE IF EXISTS `zaliha`;
CREATE TABLE IF NOT EXISTS `zaliha` (
  `krvna_grupa` varchar(10) COLLATE utf8mb4_croatian_ci NOT NULL,
  `kolicina_grupe` varchar(45) COLLATE utf8mb4_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`krvna_grupa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `zaliha`
--

INSERT INTO `zaliha` (`krvna_grupa`, `kolicina_grupe`) VALUES
('A+', '0.19999999999999996'),
('A-', '0'),
('AB+', '0'),
('AB-', '1.6'),
('B+', '49.2'),
('B-', '0'),
('0+', '0'),
('0-', '0');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `fk_followers_donor1` FOREIGN KEY (`donor_OIB_donora`) REFERENCES `donor` (`OIB_donora`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `following`
--
ALTER TABLE `following`
  ADD CONSTRAINT `fk_following_donor1` FOREIGN KEY (`donor_OIB_donora`) REFERENCES `donor` (`OIB_donora`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `komentari`
--
ALTER TABLE `komentari`
  ADD CONSTRAINT `id_bolnica_fk` FOREIGN KEY (`idbolnica_bol`) REFERENCES `bolnica` (`idbolnica`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `moj_event`
--
ALTER TABLE `moj_event`
  ADD CONSTRAINT `OIB_donora_don` FOREIGN KEY (`OIB_donora_don`) REFERENCES `donor` (`OIB_donora`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lokacija_fk` FOREIGN KEY (`id_lokacije`) REFERENCES `lokacija` (`id_lokacije`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `obavijesti`
--
ALTER TABLE `obavijesti`
  ADD CONSTRAINT `OIB_donora_fk` FOREIGN KEY (`OIBdonora`) REFERENCES `donor` (`OIB_donora`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `poruke`
--
ALTER TABLE `poruke`
  ADD CONSTRAINT `OIB_primatelja` FOREIGN KEY (`OIB_primatelja`) REFERENCES `donor` (`OIB_donora`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `zahtjev`
--
ALTER TABLE `zahtjev`
  ADD CONSTRAINT `id_bolnice_fk` FOREIGN KEY (`id_bolnica`) REFERENCES `bolnica` (`idbolnica`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
