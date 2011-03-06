-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.49-1ubuntu8.1


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema uams_development
--

CREATE DATABASE IF NOT EXISTS uams_development;
USE uams_development;
CREATE TABLE  `uams_development`.`admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `hashed_password` varchar(40) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `salt` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_admin_users_on_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
INSERT INTO `uams_development`.`admin_users` VALUES  (1,'Labinot','Halilaj','labinot@gmail.com','3009139495379c5ee79b2aabba1fff8bf2e24001',NULL,'2010-12-29 16:17:07','2011-01-29 20:49:49','lolziac','09a36dfcfb548920cce4e76ffb53fa84d49f9fbf'),
 (2,'UBT','Uni','info@ubt-uni.net','9f7bb32ebeb48a75af0875ab74622eb36920ee64',NULL,'2011-01-29 20:57:00','2011-01-29 20:57:00','administrator','dd47311b15af497db7565e574ee9729fd8c51053'),
 (3,'Astrit','Zhushi','azhushi@gmail.com','49cb09d2a7852187bce2cd03ad5aae2141476bdd',NULL,'2011-02-07 20:29:36','2011-02-07 20:29:36','astritzh','00e77b02af7242d2de8c7d328cd7c1351521455b');
CREATE TABLE  `uams_development`.`admin_users_products` (
  `admin_user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  KEY `index_admin_users_products_on_admin_user_id_and_product_id` (`admin_user_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `uams_development`.`admin_users_products` VALUES  (1,2);
CREATE TABLE  `uams_development`.`cargo_edits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_user_id` int(11) DEFAULT NULL,
  `cargo_id` int(11) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cargo_edits_on_admin_user_id_and_cargo_id` (`admin_user_id`,`cargo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
INSERT INTO `uams_development`.`cargo_edits` VALUES  (1,1,1,'Test Cargo Edit','2010-12-29 17:50:52','2010-12-29 17:51:50'),
 (2,1,1,'Ch-Ch-Ch-changes','2010-12-29 17:54:57','2010-12-29 17:54:57');
CREATE TABLE  `uams_development`.`cargos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `info` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cargos_on_product_id` (`product_id`),
  KEY `index_cargos_on_worker_id` (`worker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
INSERT INTO `uams_development`.`cargos` VALUES  (1,2,1,'Approved','Worker has accepted the Delivery','2010-12-29 17:46:52','2010-12-29 17:46:52'),
 (2,1,1,'Approved','Worker has accepted the Delivery','2010-12-29 18:13:08','2010-12-29 18:13:08'),
 (3,1,1,'Approved','Worker has accepted the Karuc','2010-12-29 18:19:36','2010-12-29 18:19:36'),
 (4,3,1,'In Progress','Waiting for Worker to Aprove','2010-12-30 16:04:05','2010-12-30 16:04:05');
CREATE TABLE  `uams_development`.`categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `photo_file_name` varchar(255) DEFAULT NULL,
  `photo_content_type` varchar(255) DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
INSERT INTO `uams_development`.`categories` VALUES  (1,'Computers',1,1,'2010-12-28 21:35:00','2011-01-23 16:38:36','computers.png','image/png',198811,'2011-01-23 16:38:36'),
 (2,'Printers',2,1,'2010-12-28 21:37:00','2011-01-23 16:39:37','printers.png','image/png',107248,'2011-01-23 16:39:36'),
 (4,'Laptops',3,0,'2010-12-28 21:55:00','2011-01-23 16:39:56','laptops.png','image/png',52461,'2011-01-23 16:39:56'),
 (5,'Phones',4,1,'2010-12-30 18:34:00','2011-02-04 23:15:50','phones.png','image/png',68772,'2011-01-23 16:40:19'),
 (6,'Digital Camera',5,1,'2011-01-22 03:27:00','2011-01-23 16:40:43','cameras.png','image/png',90519,'2011-01-23 16:40:43'),
 (8,'Extras',7,1,'2011-01-22 03:34:00','2011-01-23 16:42:47','extras.png','image/png',130178,'2011-01-23 16:42:46'),
 (9,'Software',8,1,'2011-01-22 03:35:00','2011-01-23 16:41:40','softwares.png','image/png',15275,'2011-01-23 16:41:40'),
 (10,'Display',8,1,'2011-02-07 20:43:20','2011-02-07 20:43:20','display.png','image/png',131850,'2011-02-07 20:43:19'),
 (11,'Servers',9,1,'2011-02-07 20:48:48','2011-02-07 20:48:48','servers.png','image/png',144576,'2011-02-07 20:48:48');
CREATE TABLE  `uams_development`.`employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `uni_nr` varchar(255) DEFAULT NULL,
  `date_employed` int(11) DEFAULT NULL,
  `profession` varchar(255) DEFAULT NULL,
  `departament` varchar(255) DEFAULT NULL,
  `office` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(40) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `photo_file_name` varchar(255) DEFAULT NULL,
  `photo_content_type` varchar(255) DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
INSERT INTO `uams_development`.`employees` VALUES  (1,'Bekim','Gashi','125',1052009,'Professor','Computer Science','Floor 2 Nr: 205','bekim.gashi@ubt-uni.net',NULL,44111232,'Working','2011-02-09 20:17:27','2011-03-05 18:28:44','bek.jpg','image/jpeg',17449,'2011-03-05 18:28:44'),
 (4,'Arian','Celina','0293',10,'Assistant','Business and Management','Floor 3 nr: 302','arian.celina@ubt-uni.net',NULL,2147483647,'Working','2011-02-18 16:36:15','2011-03-06 18:00:32','ari.jpg','image/jpeg',8387,'2011-03-05 18:28:35'),
 (5,'Abdurrahman','Shaqiri','0292',10,'Administration','Administration','Floor 1 nr: 103','ashaqiri@ubt-uni.net',NULL,44,'Working','2011-02-18 16:38:47','2011-03-05 18:28:25','alb.jpg','image/jpeg',7755,'2011-03-05 18:28:24'),
 (6,'Daut','Kelmendi','1029',5,'Assistant','Mathematics','Floor 2 nr:102','daut.kelmendi@ubt-uni.net',NULL,44,'Working','2011-02-18 16:40:55','2011-03-05 18:28:54','dek.jpg','image/jpeg',7356,'2011-03-05 18:28:53');
CREATE TABLE  `uams_development`.`products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `modelnr` varchar(255) DEFAULT NULL,
  `serialnr` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `date_purchased` datetime DEFAULT NULL,
  `info` text,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `photo_file_name` varchar(255) DEFAULT NULL,
  `photo_content_type` varchar(255) DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_products_on_category_id` (`category_id`),
  KEY `index_products_on_supplier_id` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
INSERT INTO `uams_development`.`products` VALUES  (2,4,'HP','EliteBook','8530p','CZC0170517',1,850,'2010-12-13 00:00:00','Shfrytezohet nga Labinot Halilaj','Available','2010-12-29 15:23:11','2011-01-22 02:27:50','hp-elitebook-8530p.jpg','image/jpeg',37990,'2011-01-22 02:27:50'),
 (3,4,'Lenovo','Lenovo','IdeaPad2','ZDC0130527',2,1850,'2010-12-17 00:00:00','Shfrytezohet nga Labinot Halilaj','In Use','2010-12-29 15:25:04','2011-01-22 02:29:15','Lenovo-IdeaPad2.jpg','image/jpeg',27942,'2011-01-22 02:29:15'),
 (4,5,'LG','Optimus','One','PO0293D',2,600,'2011-01-23 00:00:00','Produkti ju eshte dhene Profesor Agim Zabergja','In Use','2011-01-16 17:07:02','2011-01-22 02:29:38','LG-Optimus-One.jpg','image/jpeg',28878,'2011-01-22 02:29:37'),
 (5,4,'Fujitsu Siemens','Amilo Pro','v3405','OD9201',1,1500,'2010-07-19 00:00:00','Eshte ne dispozicion te ekipes se Adminave. Pergjegjes eshte Jeton Abdullahu.','In Use','2011-01-19 22:21:02','2011-01-22 02:30:29','fujitsu_siemens_amilo_pro_v3405.jpg','image/jpeg',20740,'2011-01-22 02:30:29'),
 (6,1,'Acer','Aspire PC','x1700','XX0129382',2,1290,'2011-01-21 00:00:00','I ri finqe. Ne stock tu nejt.','Available','2011-01-21 19:52:57','2011-01-22 02:26:37','acer-aspire-x1700-small-form-factor-pc.jpg','image/jpeg',44546,'2011-01-22 02:26:37'),
 (7,2,'HP','LaserJet','P1007','P0K192812',1,470,'2011-01-22 00:00:00','I ngarkuar eshte Besim Islami.','In Use','2011-01-22 01:13:29','2011-01-22 02:28:06','HP-LaserJet-P1007-Printer.jpg','image/jpeg',21276,'2011-01-22 02:28:06'),
 (8,2,'HP','LaserJet','P2055dn','X2K129AS',1,689,'2011-01-22 00:00:00','Eshte ne zyren e Administrates...','In Use','2011-01-22 01:15:22','2011-01-22 02:28:19','HP-LaserJet-P2055dn-Printer.jpg','image/jpeg',16632,'2011-01-22 02:28:19'),
 (9,5,'HTC','Leo HD2','T8585','KI8128391',2,300,'2011-01-22 00:00:00','Telefoni eshte ngarkuar tek Dekani.','In Use','2011-01-22 01:17:49','2011-01-22 02:28:36','htc-hd-2.jpg','image/jpeg',56914,'2011-01-22 02:28:36');
CREATE TABLE  `uams_development`.`schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `uams_development`.`schema_migrations` VALUES  ('20101228170303'),
 ('20101228180103'),
 ('20101228190227'),
 ('20101228190300'),
 ('20101228190320'),
 ('20101229160108'),
 ('20101229164104'),
 ('20101229165829'),
 ('20101229170623'),
 ('20110121192906'),
 ('20110122031237'),
 ('20110122031258'),
 ('20110208191427'),
 ('20110305180945');
CREATE TABLE  `uams_development`.`suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `business_nr` varchar(255) DEFAULT NULL,
  `fiscal_nr` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `services` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `photo_file_name` varchar(255) DEFAULT NULL,
  `photo_content_type` varchar(255) DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_suppliers_on_product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
INSERT INTO `uams_development`.`suppliers` VALUES  (1,NULL,'Comtrade','PL092182','1202931','Enver Doko','Instituti Albanologjik','044123912',1,'Shtije, Rregullim, Mirembatje','2010-12-29 20:35:32','2011-03-05 17:35:08','comtradelogo.gif','image/gif',5344,'2011-03-05 17:35:08'),
 (2,NULL,'Daxa Electronics','2LK092182','4302931','Zotri Profa','Bregu i Dielleit 2/12','044144213',1,'Shtije, Rregullim, Mirembatje','2010-12-29 20:38:58','2011-03-05 17:35:27','dxlogo.jpg','image/jpeg',23119,'2011-03-05 17:35:27'),
 (3,NULL,'Cacttus','70028321','12AB8120','4C Group SH.P.K.','Rexhep Mala 29, Aktash, Prishtinë','+381 (0)38 24 68 88',1,'Consulting\r\nSystem Integration\r\nSoftware Development\r\nResale','2011-03-05 16:51:09','2011-03-05 17:53:04','cacttuslogo .jpg','image/jpeg',29320,'2011-03-05 17:34:33'),
 (4,NULL,'IPKO','70064420','1293AK01','Telekom Slovenije, d.d. ','Zija Shemsiu nr 34 Pristina','049-700-004',1,'Telefonia Mobile\r\nTelefonia Fikse\r\nInternet\r\nTelevizioni Digjital\r\nSherbimet e kombinuara','2011-03-05 16:55:29','2011-03-05 17:35:44','ipkonetlogo.gif','image/gif',2121,'2011-03-05 17:35:44'),
 (5,NULL,'Kujtesa','70249238','24AB8220','Kujtesa Max S.A.R.L.','18, Pashko Vasa Pristina','+381 38 248 900',1,'Internet\r\nKabllim\r\nTV\r\n','2011-03-05 17:00:41','2011-03-05 17:35:59','kujtesalogo.gif','image/gif',3320,'2011-03-05 17:35:59');
CREATE TABLE  `uams_development`.`workers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `uni_nr` varchar(255) DEFAULT NULL,
  `date_employed` varchar(255) DEFAULT NULL,
  `profesion` varchar(255) DEFAULT NULL,
  `departament` varchar(255) DEFAULT NULL,
  `office` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(40) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
INSERT INTO `uams_development`.`workers` VALUES  (1,'Bekim','Gashi','666','2009-11-23','Teacher','Computer Science','201','bgashi@ubt-uni.net',NULL,'044123923','working','2010-12-29 17:42:33','2010-12-29 17:42:33');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
