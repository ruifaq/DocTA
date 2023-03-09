/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.27-MariaDB : Database - nilai_harian
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`nilai_harian` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `nilai_harian`;

/*Table structure for table `guru` */

DROP TABLE IF EXISTS `guru`;

CREATE TABLE `guru` (
  `nip` int(10) NOT NULL,
  `guru_nama` char(255) NOT NULL,
  `username` char(255) NOT NULL,
  `password` char(255) NOT NULL,
  `guru_alamat` char(255) NOT NULL,
  `guru_jb` char(255) NOT NULL,
  `guru_hp` char(255) NOT NULL,
  `guru_status` char(255) NOT NULL,
  PRIMARY KEY (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `guru` */

/*Table structure for table `kelas` */

DROP TABLE IF EXISTS `kelas`;

CREATE TABLE `kelas` (
  `kelas_id` int(10) NOT NULL,
  `jumlah_siswa` int(4) NOT NULL,
  `wali_kelas` char(255) NOT NULL,
  `tahun_ajaran` int(4) NOT NULL,
  PRIMARY KEY (`kelas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `kelas` */

/*Table structure for table `mapel` */

DROP TABLE IF EXISTS `mapel`;

CREATE TABLE `mapel` (
  `mapel_id` int(10) NOT NULL,
  `mapel_nama` char(255) NOT NULL,
  `mapel_kkm` int(3) NOT NULL,
  `kelas_id` int(10) NOT NULL,
  PRIMARY KEY (`mapel_id`),
  KEY `kls_id` (`kelas_id`),
  CONSTRAINT `kls_id` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`kelas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mapel` */

/*Table structure for table `nilai` */

DROP TABLE IF EXISTS `nilai`;

CREATE TABLE `nilai` (
  `nilai_id` int(10) NOT NULL,
  `nip` int(10) NOT NULL,
  `nis` int(10) NOT NULL,
  `siswa_nama` char(255) NOT NULL,
  `kelas_id` int(10) NOT NULL,
  `semester` int(1) NOT NULL,
  `tahun_ajaran` int(4) NOT NULL,
  `ipa` int(3) DEFAULT NULL,
  `ips` int(3) DEFAULT NULL,
  `mtk` int(3) DEFAULT NULL,
  `bindo` int(3) DEFAULT NULL,
  `pjok` int(3) DEFAULT NULL,
  `sbdp` int(3) DEFAULT NULL,
  `pkn` int(3) DEFAULT NULL,
  `ag_islam` int(3) DEFAULT NULL,
  `ag_kristen` int(3) DEFAULT NULL,
  `ag_hindu` int(3) DEFAULT NULL,
  PRIMARY KEY (`nilai_id`),
  KEY `nip` (`nip`),
  KEY `nis` (`nis`),
  KEY `kelass_id` (`kelas_id`),
  CONSTRAINT `kelass_id` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`kelas_id`),
  CONSTRAINT `nip` FOREIGN KEY (`nip`) REFERENCES `guru` (`nip`),
  CONSTRAINT `nis` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `nilai` */

/*Table structure for table `siswa` */

DROP TABLE IF EXISTS `siswa`;

CREATE TABLE `siswa` (
  `nis` int(10) NOT NULL,
  `siswa_nama` char(255) NOT NULL,
  `siswa_alamat` char(255) NOT NULL,
  `siswa_hp` char(20) NOT NULL,
  `kelas_id` int(10) NOT NULL,
  `tahun_ajaran` int(1) NOT NULL,
  PRIMARY KEY (`nis`),
  KEY `kelas_id` (`kelas_id`),
  CONSTRAINT `kelas_id` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`kelas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `siswa` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
