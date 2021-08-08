-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 10, 2020 at 02:08 PM
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
-- Database: `shopping`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `delcat`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delcat` (IN `ccod` INT)  NO SQL
DELETE FROM tbcat WHERE catcod=ccod$$

DROP PROCEDURE IF EXISTS `delord`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delord` (IN `ocod` INT)  NO SQL
DELETE FROM tbord where ordcod=ocod$$

DROP PROCEDURE IF EXISTS `delorddet`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delorddet` (IN `odetcod` INT)  NO SQL
DELETE FROM tborddet WHERE orddetcod=odetcod$$

DROP PROCEDURE IF EXISTS `delprd`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delprd` (IN `pcod` INT)  NO SQL
DELETE FROM tbprd WHERE prdcod=pcod$$

DROP PROCEDURE IF EXISTS `delusr`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delusr` (IN `ucod` INT)  NO SQL
DELETE FROM tbusr where usrcod=ucod$$

DROP PROCEDURE IF EXISTS `dspcat`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `dspcat` ()  NO SQL
SELECT * FROM tbcat$$

DROP PROCEDURE IF EXISTS `dspord`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `dspord` ()  NO SQL
SELECT * FROM tbord$$

DROP PROCEDURE IF EXISTS `dsporddet`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `dsporddet` ()  NO SQL
SELECT * FROM tborddet$$

DROP PROCEDURE IF EXISTS `dspprd`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `dspprd` (IN `ccod` INT)  NO SQL
SELECT * FROM tbprd where prdcatcod=ccod$$

DROP PROCEDURE IF EXISTS `dspusr`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `dspusr` ()  NO SQL
SELECT * FROM tbusr$$

DROP PROCEDURE IF EXISTS `fndcat`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `fndcat` (IN `ccod` INT)  NO SQL
SELECT * from tbcat where catcod=ccod$$

DROP PROCEDURE IF EXISTS `fndord`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `fndord` (IN `ocod` INT)  NO SQL
SELECT * FROM tbord WHERE ordcod=ocod$$

DROP PROCEDURE IF EXISTS `fndorddet`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `fndorddet` (IN `odetcod` INT)  NO SQL
SELECT * FROM tborddet WHERE orddetcod=odetcod$$

DROP PROCEDURE IF EXISTS `fndprd`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `fndprd` (IN `pcod` INT)  NO SQL
SELECT * FROM tbprd WHERE prdcod=pcod$$

DROP PROCEDURE IF EXISTS `fndusr`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `fndusr` (IN `ucod` INT)  NO SQL
SELECT * FROM tbusr WHERE usrcod=ucod$$

DROP PROCEDURE IF EXISTS `inscat`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `inscat` (IN `cnam` VARCHAR(100))  NO SQL
INSERT tbcat VALUES(null,cnam)$$

DROP PROCEDURE IF EXISTS `insord`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insord` (IN `odat` DATETIME, IN `ousrcod` INT, IN `odeladd` VARCHAR(500), IN `odelphn` VARCHAR(100), OUT `cod` INT)  NO SQL
begin
INSERT tbord VALUES(null,odat,ousrcod,odeladd,odelphn);
select last_insert_id() into cod;
end$$

DROP PROCEDURE IF EXISTS `insorddet`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insorddet` (IN `odetordcod` INT, IN `odetprdcod` INT, IN `odetprdqty` INT)  NO SQL
INSERT tborddet VALUES(null,odetordcod,odetprdcod,odetprdqty)$$

DROP PROCEDURE IF EXISTS `insprd`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insprd` (IN `pnam` VARCHAR(200), IN `pdsc` VARCHAR(2000), IN `ppic` VARCHAR(50), IN `pprc` FLOAT, IN `poff` VARCHAR(500), IN `pcatcod` INT, IN `pisavl` CHAR(1))  NO SQL
INSERT tbprd VALUES(null,pnam,pdsc,ppic,pprc,poff,pcatcod,pisavl)$$

DROP PROCEDURE IF EXISTS `insusr`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insusr` (IN `ueml` VARCHAR(100), IN `upwd` VARCHAR(100), IN `uregdat` DATETIME, IN `urol` CHAR(1))  NO SQL
INSERT tbusr VALUES(null,ueml,upwd,uregdat,urol)$$

DROP PROCEDURE IF EXISTS `insusr1`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insusr1` (IN `eml` VARCHAR(100), IN `pwd` VARCHAR(100), IN `dat` DATETIME, IN `rol` CHAR(1), OUT `cod` INT)  NO SQL
BEGIN
INSERT tbusr VALUES(null,eml,pwd,dat,rol);
SELECT last_insert_id() INTO cod;
END$$

DROP PROCEDURE IF EXISTS `logincheck`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `logincheck` (IN `eml` VARCHAR(100), IN `pwd` VARCHAR(100), OUT `cod` INT, OUT `rol` CHAR(1))  NO SQL
BEGIN
declare actpwd varchar(50);
select usrpwd from tbusr where usreml=eml into @actpwd;
if @actpwd is null THEN
   set cod=-1;
   set rol='N';
else
if pwd=@actpwd then
select usrrol from tbusr where usreml=eml into rol;
select usrcod from tbusr where usreml=eml into cod;
else
	set cod=-2;
    set rol='N';
end if;
end if;
END$$

DROP PROCEDURE IF EXISTS `updcat`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updcat` (IN `ccod` INT, IN `cnam` VARCHAR(100))  NO SQL
UPDATE tbcat set catnam=cnam where catcod=ccod$$

DROP PROCEDURE IF EXISTS `updord`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updord` (IN `ocod` INT, IN `odat` DATETIME, IN `ousrcod` INT, IN `odeladd` VARCHAR(500), IN `odelphn` VARCHAR(100))  NO SQL
UPDATE tbord SET orddat=odat,ordusrcod=ousrcod,orddeladd=odeladd,orddelphn=odelphn where ordcod=ocod$$

DROP PROCEDURE IF EXISTS `updorddet`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updorddet` (IN `odetcod` INT, IN `odetordcod` INT, IN `odetprdcod` INT, IN `odetprdqty` INT)  NO SQL
UPDATE tborddet SET orddetordcod=odetordcod,orddetprdcod=odetprdcod,orddetprdqty=odetprdqty WHERE orddetcod=odetcod$$

DROP PROCEDURE IF EXISTS `updprd`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updprd` (IN `pcod` INT, IN `pnam` VARCHAR(200), IN `pdsc` VARCHAR(2000), IN `ppic` VARCHAR(50), IN `pprc` FLOAT, IN `poff` VARCHAR(500), IN `pcatcod` INT, IN `pisavl` CHAR(1))  NO SQL
UPDATE tbprd set prdnam=pnam,prddsc=pdsc,prdpic=ppic,prdprc=pprc,prdoff=poff,prdcatcod=pcatcod,prdisavl=pisavl where prdcod=pcod$$

DROP PROCEDURE IF EXISTS `updusr`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updusr` (IN `ucod` INT, IN `ueml` VARCHAR(100), IN `upwd` VARCHAR(100), IN `uregdat` DATETIME, IN `urol` CHAR(1))  NO SQL
UPDATE tbusr SET usreml=ueml,usrpwd=upwd,usrregdat=uregdat,usrrol=urol WHERE usrcod=ucod$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbcat`
--

DROP TABLE IF EXISTS `tbcat`;
CREATE TABLE IF NOT EXISTS `tbcat` (
  `catcod` int(11) NOT NULL AUTO_INCREMENT,
  `catnam` varchar(100) NOT NULL,
  PRIMARY KEY (`catcod`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbcat`
--

INSERT INTO `tbcat` (`catcod`, `catnam`) VALUES
(5, 'women\'s clothing'),
(6, 'men\'s clothing'),
(8, 'shoes'),
(9, 'accessories'),
(13, 'bags'),
(14, 'watches'),
(15, 'kids and baby and toys'),
(17, 'beauty and health'),
(18, 'electronics');

-- --------------------------------------------------------

--
-- Table structure for table `tbord`
--

DROP TABLE IF EXISTS `tbord`;
CREATE TABLE IF NOT EXISTS `tbord` (
  `ordcod` int(11) NOT NULL AUTO_INCREMENT,
  `orddat` datetime NOT NULL,
  `ordusrcod` int(11) NOT NULL,
  `orddeladd` varchar(500) NOT NULL,
  `orddelphn` varchar(100) NOT NULL,
  PRIMARY KEY (`ordcod`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbord`
--

INSERT INTO `tbord` (`ordcod`, `orddat`, `ordusrcod`, `orddeladd`, `orddelphn`) VALUES
(5, '2019-02-09 00:00:00', 1, 'safsadf', '2344'),
(6, '2019-11-04 00:00:00', 18, 'sdufyudsfchvjdxhfviuawds', '98457345436'),
(7, '2019-11-08 00:00:00', 20, 'khhxbxnzXcbx', '98457345436'),
(8, '2019-11-08 00:00:00', 20, 'MKLDJVKHF', '98457345436'),
(9, '2020-03-10 00:00:00', 18, 'kandaghat', '123456789'),
(10, '2020-03-10 00:00:00', 18, 'kandaghat ', '1234567789');

-- --------------------------------------------------------

--
-- Table structure for table `tborddet`
--

DROP TABLE IF EXISTS `tborddet`;
CREATE TABLE IF NOT EXISTS `tborddet` (
  `orddetcod` int(11) NOT NULL AUTO_INCREMENT,
  `orddetordcod` int(11) NOT NULL,
  `orddetprdcod` int(11) NOT NULL,
  `orddetprdqty` int(11) NOT NULL,
  PRIMARY KEY (`orddetcod`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tborddet`
--

INSERT INTO `tborddet` (`orddetcod`, `orddetordcod`, `orddetprdcod`, `orddetprdqty`) VALUES
(1, 5, 15, 1),
(2, 6, 1, 2),
(3, 7, 76, 1),
(4, 8, 33, 1),
(5, 9, 2, 1),
(6, 10, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbprd`
--

DROP TABLE IF EXISTS `tbprd`;
CREATE TABLE IF NOT EXISTS `tbprd` (
  `prdcod` int(11) NOT NULL AUTO_INCREMENT,
  `prdnam` varchar(200) NOT NULL,
  `prddsc` varchar(2000) NOT NULL,
  `prdpic` varchar(50) NOT NULL,
  `prdprc` float NOT NULL,
  `prdoff` varchar(500) NOT NULL,
  `prdcatcod` int(11) NOT NULL,
  `prdisavl` char(1) NOT NULL,
  PRIMARY KEY (`prdcod`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbprd`
--

INSERT INTO `tbprd` (`prdcod`, `prdnam`, `prddsc`, `prdpic`, `prdprc`, `prdoff`, `prdcatcod`, `prdisavl`) VALUES
(1, 'short\'s', 'girl\'s fashion combination of black and white makes a perfect look .pure cotton ', '1.jpg', 900, '', 5, 'm'),
(2, 'skirt', 'Type : a-line mini skirt, fabric type : polyester fabric, waist line : elastic band\r\nStyle details: broomstick, frill round skirt, length type : mini length divider short\r\nFit : regular fit, comfort fit, team up with top and tunic, t-shirt, tank top\r\nWash care : hand wash, machine wash, normal wash, wash in cold water separately\r\n', '2.jpg', 500, '', 5, 't'),
(5, '50s ribbon tie Floral Print Flared Dress', '\r\nStyle details: broomstick, frill round skirt, length type : mini length divider short\r\nFit : regular fit, comfort fit, team up with top and tunic, t-shirt, tank top\r\nWash care : hand wash, machine wash, normal wash, wash in cold water separately\r\n', '3.jpg', 1000, '', 5, 'T'),
(6, 'flounce sleeve Drawsting waist Floral', 'Care Instructions: Machine wash\r\nFit Type: Regular Fit\r\nMaterial: Synthetic\r\nMachine wash\r\nThree quarter sleeve\r\n', '4.jpg', 1000, '', 5, 'T'),
(7, 'lace top ruffle flare dress', 'Fit Type: Regular\r\nMaterial :- synthetic\r\nFit type:- knee length , regular fit\r\nLifestle : casual and festival and moods\r\nClosure type:zip and durable fabric and dureable colour\r\nWash care instructions:first wash dryclean and then after easy cold wash\r\n', '6.jpg', 975, '', 5, 'T'),
(8, '50s ribbon tie Floral Print Flared Dress', 'Fit Type: regular fit\r\nColor Name: White\r\n100% Viscose\r\nMachine wash\r\nBody Blouse\r\nLong sleeve\r\n', '5.jpg', 700, '', 5, 't'),
(9, 'frock', 'Care Instructions: Machine Wash. Do not bleach. Wash separately.\r\nFit Type: Regular Fit\r\nColor : Rust\r\nFabric : 95% Polyester 5% Elastane ; Fabric Quality : Looper Knit\r\nPackage Content : 1 Tops\r\nMachine Wash. Do not bleach. Wash separately.', 'images (4).jpg', 700, '', 5, 't'),
(10, 'women\'s skirt bottom', 'Care Instructions: Machine wash\r\nFit Type: Regular Fit\r\nMaterial: Synthetic\r\nmachine wash\r\nA-Line\r\nShort Sleeve\r\nKnee length\r\nCare Instructions: Machine wash\r\nFit Type: Regular Fit\r\nMaterial: Synthetic\r\nmachine wash\r\nA-Line\r\nShort Sleeve\r\nKnee length\r\n', '7.jpg', 1645, '', 5, 'T'),
(14, 'A-line maxi skirt', 'Care Instructions: Machine wash\r\nFit Type: Regular Fit\r\nMaterial: Synthetic\r\nmachine wash\r\nA-Line\r\nShort Sleeve\r\nKnee length\r\n', 'one.png', 795, '', 5, 'T'),
(15, 'net top', 'Fit Type: Regular\r\nMaterial :- synthetic\r\nFit type:- knee length , regular fit\r\nLifestle : casual and festival and moods\r\nClosure type:zip and durable fabric and dureable colour\r\nWash care instructions:first wash dryclean and then after easy cold wash\r\n', '9.jpg', 895, '', 5, 'T'),
(19, 'van heusen woman', 'Care Instructions: Machine wash\r\nFit Type: Regular Fit\r\nMaterial: Synthetic\r\nmachine wash\r\nA-Line\r\nShort Sleeve\r\nKnee length\r\n\r\nAd ', 'similar2.jpg', 1000, '', 5, 'T'),
(20, 'splash', 'Care Instructions: Machine wash\r\nFit Type: Regular Fit\r\nMaterial: Synthetic\r\nmachine wash\r\nA-Line\r\nShort Sleeve\r\nKnee length\r\n\r\nAd ', 'similar3.jpg', 500, '', 5, 'T'),
(21, 'vero moda', 'Care Instructions: Machine wash\r\nFit Type: Regular Fit\r\nMaterial: Synthetic\r\nmachine wash\r\nA-Line\r\nShort Sleeve\r\nKnee length\r\n\r\nAd ', 'project_img3.jpg', 795, '', 5, 'T'),
(24, 'marks and spencer', ' Machine wash\r\nFit Type: Regular Fit\r\nMaterial: Synthetic\r\nmachine wash\r\nA-Line\r\nShort Sleeve\r\nKnee length\r\n\r\nAd ', 'girl1.jpg', 989, '', 5, 'T'),
(25, 'globus', 'Fit Type: Regular\r\nMaterial :- synthetic\r\nFit type:- knee length , regular fit\r\nLifestle : casual and festival and moods\r\nClosure type:zip and durable fabric and dureable colour\r\nWash care instructions:first wash dryclean and then after easy cold wash\r\n', 'girl2.jpg', 1000, '', 5, 'T'),
(26, 'long frock', 'A wedge is born venice beach. california.From handcrafted beginnings and steeped in autencity', 'images (4).jpg', 2000, '', 5, 'T'),
(27, 'levi\'s', 'Mint red shirt long gown', 'download (14).jpg', 1895, '', 5, 'T'),
(28, 'harpa', 'shop latest collection of girl\'s dresses', 'download (4).jpg', 2495, '', 5, 'T'),
(29, 'skater skirt', 'Care Instructions: Machine wash\r\nFit Type: Regular Fit\r\nMaterial: Synthetic\r\nmachine wash\r\nA-Line\r\nShort Sleeve\r\nKnee length\r\n\r\nAd ', 'download (11).jpg', 1899, '', 5, 'T'),
(30, 'fashion', 'long grey gown for girls ', 'download (12).jpg', 700, '', 5, 'T'),
(31, 'wrap skirt', 'quality stainless stegirls dress', 'images (2).jpg', 999, '', 5, 'T'),
(32, 'pink frock', 'Care Instructions: Machine wash\r\nFit Type: Regular Fit\r\nMaterial: Synthetic\r\nmachine wash\r\nA-Line\r\nShort Sleeve\r\nKnee length\r\n\r\nAd ', 'download.jpg', 500, '', 5, 'T'),
(33, 'shirt', 'Blue and black colourblocked jacket, has a hooded, 4 pockets, zip closure, long sleeves, straight hem, and cotton lining\r\n\r\nSize & Fit\r\nThe model (height 6\') is wearing a size M\r\n\r\nMaterial & Care\r\nCotton\r\nMachine-wash\r\n\r\n', 'IMG-20191005-WA0003.jpg', 1000, '', 6, 'T'),
(35, 'full arms shirt', 'Mustard and Navy Blue checked casual shirt, has a spread collar, long sleeves, button placket, curved hem, and 1 patch pocket\r\n\r\nSize & Fit\r\nSlim fit\r\nThe model (height 6\') is wearing a size 40\r\n\r\nMaterial & Care\r\n100% cotton\r\nMachine-wash', 'IMG-20191005-WA0006.jpg', 600, '', 6, 'T'),
(37, 'double shirts', 'Mustard and Navy Blue checked casual shirt, has a spread collar, long sleeves, button placket, curved hem, and 1 patch pocket\r\n\r\nSize & Fit\r\nSlim fit\r\nThe model (height 6\') is wearing a size 40\r\n\r\nMaterial & Care\r\n100% cotton\r\nMachine-wash', 'IMG-20191005-WA0011.jpg', 1000, '', 6, 'T'),
(38, 'bts ', 'Black and grey sweater, has an attached hood with a drawstring fastening, hooded neck, long sleeves, ribbed hem\r\n\r\nSize & Fit\r\nThe model (height 6\') is wearing a size M\r\n\r\nMaterial & Care\r\n100% acrylic\r\nMachine-wash\r\nYou are unique and wouldn\'t like it if the Creator made too many people ditto.\r\nSimilarly, this product is unique, handmade and crafted with love.\r\nThere are no two products we make, which will ever be ditto.\r\nTo maintain a high degree of authenticity, we advise our patrons to wash our products separately and expect some fading, colour bleeding and wear & tear.\r\nThe article ages uniquely as you treat it, acquiring your personalised feel.\r\nGo on, enjoy this specially created product to the hilt. Have fun.', 'IMG-20191005-WA0013.jpg', 700, '', 6, 'T'),
(39, 'men clothes', 'Mustard and Navy Blue checked casual shirt, has a spread collar, long sleeves, button placket, curved hem, and 1 patch pocket\r\n\r\nSize & Fit\r\nSlim fit\r\nThe model (height 6\') is wearing a size 40\r\n\r\nMaterial & Care\r\n100% cotton\r\nMachine-wash', 'IMG-20191005-WA0026.jpg', 800, '', 6, 'T'),
(40, 'boys shirt', '\r\nBlue and black colourblocked jacket, has a hooded, 4 pockets, zip closure, long sleeves, straight hem, and cotton lining\r\n\r\nSize & Fit\r\nThe model (height 6\') is wearing a size M\r\n\r\nMaterial & Care\r\nCotton\r\nMachine-wash\r\n\r\n', 'IMG-20191005-WA0012.jpg', 900, '', 6, 'T'),
(41, 'bts hoodie', 'Black and grey sweater, has an attached hood with a drawstring fastening, hooded neck, long sleeves, ribbed hem\r\n\r\nSize & Fit\r\nThe model (height 6\') is wearing a size M\r\n\r\nMaterial & Care\r\n100% acrylic\r\nMachine-wash\r\nYou are unique and wouldn\'t like it if the Creator made too many people ditto.\r\nSimilarly, this product is unique, handmade and crafted with love.\r\nThere are no two products we make, which will ever be ditto.\r\nTo maintain a high degree of authenticity, we advise our patrons to wash our products separately and expect some fading, colour bleeding and wear & tear.\r\nThe article ages uniquely as you treat it, acquiring your personalised feel.\r\nGo on, enjoy this specially created product to the hilt. Have fun.', 'IMG-20191005-WA0025.jpg', 700, '', 6, 'T'),
(42, 'casual shirt', 'White solid formal shirt, has a spread collar, long sleeves, straight hem, one patch pocket\r\n\r\nSize & Fit\r\nSlim fit\r\nThe model (height 6\') is wearing a size 40\r\n\r\nMaterial & Care\r\nPolycotton\r\nMachine-wash', 'IMG-20191005-WA0016.jpg', 3745, '', 6, 'T'),
(43, 'formal shirt', 'Mustard and Navy Blue checked casual shirt, has a spread collar, long sleeves, button placket, curved hem, and 1 patch pocket\r\n\r\nSize & Fit\r\nSlim fit\r\nThe model (height 6\') is wearing a size 40\r\n\r\nMaterial & Care\r\n100% cotton\r\nMachine-wash', 'IMG-20191005-WA0009.jpg', 900, '', 6, 'T'),
(44, 'shoes', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nSize & Fit\r\nRoundToe\r\n\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (13).jpg', 999, '', 8, 's'),
(45, 'laces shoes', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nSize & Fit\r\nRoundToe\r\n\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (12).jpg', 700, '', 8, 's'),
(46, 'stylish shoes', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (7).jpg', 800, '', 8, 's'),
(47, 'shoes', 'Roti maker with durable stainless steel body.\r\nCord wrap for storage.\r\nPower and ready light indicator.\r\n8\"non stick coating plates for easy cleaning.', 'images (11).jpg', 699, '', 8, 's'),
(48, 'casual shoes', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (9).jpg', 2399, '', 8, 'T'),
(49, 'shoes', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (16).jpg', 499, '', 8, 's'),
(50, 'fashionable shoes', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (10).jpg', 999, '', 8, 's'),
(51, 'shoes ', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (8).jpg', 899, '', 8, 's'),
(52, 'boot', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (5).jpg', 799, '', 8, 's'),
(53, 'lofar', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (12).jpg', 4019, '', 8, 's'),
(54, 'stylish', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (21).jpg', 990, '', 8, 's'),
(55, 'casual', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (18).jpg', 795, '', 8, 's'),
(56, 'shoes', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (17).jpg', 595, '', 8, 's'),
(57, 'shoes', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (19).jpg', 795, '', 8, 's'),
(58, 'lofar2', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (22).jpg', 699, '', 8, 's'),
(60, 'boots', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (20).jpg', 629, '', 8, 's'),
(61, 'shoes', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (23).jpg', 695, '', 8, 's'),
(62, 'shoes', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (24).jpg', 849, '', 8, 's'),
(63, 'stylish', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (25).jpg', 695, '', 8, 's'),
(64, 'shoes', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (26).jpg', 999, '', 8, 's'),
(65, 'nike', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (30).jpg', 995, '', 8, 's'),
(66, 'shoes', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (27).jpg', 599, '', 8, 's'),
(67, 'addidas', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (28).jpg', 449, '', 8, 's'),
(68, 'shoes', 'A pair of round-toe white sneakers, has regular styling, lace-up detail\r\nSynthetic Leather upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nWarranty: 3 months\r\nWarranty provided by brand/manufacturer\r\n\r\nMaterial & Care\r\nSynthetic Leather\r\nWipe with a clean, dry cloth to remove dust', 'images (29).jpg', 449, '', 8, 's'),
(76, 'accessories', 'Incolor is a global color cosmetics products company whose vision is glamour, excitement, and innovation through high-quality products at affordable prices. The brand\'s mission is to create a world with more empowered women because empowered women bring more beauty to the world. The products are available across PAN India. The products have international formulations and packaging with the premium appeal and high level of research to ensure that the products stand the test of quality and consistency.\r\n\r\n\r\nSize & Fit\r\n15g\r\n\r\n', 'download (23).jpg', 1595, '', 9, 'T'),
(77, 'accessories', 'Incolor is a global color cosmetics products company whose vision is glamour, excitement, and innovation through high-quality products at affordable prices. The brand\'s mission is to create a world with more empowered women because empowered women bring more beauty to the world. The products are available across PAN India. The products have international formulations and packaging with the premium appeal and high level of research to ensure that the products stand the test of quality and consistency.\r\n\r\n\r\nSize & Fit\r\n15g\r\n\r\n', 'download (24).jpg', 100, '', 9, 'T'),
(78, 'accessroies for friends', 'This light, cool facial gel incorporates pure Rosewater with Cucumber and Aloe Vera gel to soothe, refresh and moisturize the skin. Highly emollient Plum fruit extract supplies additional nourishment, leaving the skin luxuriously pampered and radiant.\r\n\r\nCONTAINS:\r\nCucumber Extract , Organic Aloe Vera , Rose\r\n\r\nSize & Fit\r\n50 g', 'images (45).jpg', 1395, '', 9, 'T'),
(79, 'special gift', 'This light, cool facial gel incorporates pure Rosewater with Cucumber and Aloe Vera gel to soothe, refresh and moisturize the skin. Highly emollient Plum fruit extract supplies additional nourishment, leaving the skin luxuriously pampered and radiant.\r\n\r\nCONTAINS:\r\nCucumber Extract , Organic Aloe Vera , Rose\r\n\r\nSize & Fit\r\n50 g', 'images (42).jpg', 825, '', 9, 'T'),
(80, 'accessories', 'The look of a lipstick meets the feel of a balm for the most wearable lip yet. Loaded with crushed pigments and lip-loving ingredients, the Bobbi Brown\'s Crushed Lip Color is the ultimate swipe and go formula.', 'images (43).jpg', 755, '', 9, 'T'),
(83, 'fashionable', 'The look of a lipstick meets the feel of a balm for the most wearable lip yet. Loaded with crushed pigments and lip-loving ingredients, the Bobbi Brown\'s Crushed Lip Color is the ultimate swipe and go formula.', 'download (31).jpg', 795, '', 9, 'T'),
(84, 'fashion', 'Long-wearing, 12 hour\r\nReduces appearance of pores\r\nControls oil and shine\r\nNon-drying\r\nFor all skin types, especially oily skin\r\nProvides stay-true colour, 12 hours\r\nNon-fading, 12 hours\r\nNon-streaking, 12 hours\r\nNon-caking, 12 hours\r\nNon-settling/creasing, 12 hours\r\nPhoto-friendly', 'download (30).jpg', 1945, '', 9, 'T'),
(85, 'accessories', 'Long-wearing, 12 hour\r\nReduces appearance of pores\r\nControls oil and shine\r\nNon-drying\r\nFor all skin types, especially oily skin\r\nProvides stay-true colour, 12 hours\r\nNon-fading, 12 hours\r\nNon-streaking, 12 hours\r\nNon-caking, 12 hours\r\nNon-settling/creasing, 12 hours\r\nPhoto-friendly', 'images (52).jpg', 1180, '', 9, 'T'),
(86, 'accessories', 'Long-wearing, 12 hour\r\nReduces appearance of pores\r\nControls oil and shine\r\nNon-drying\r\nFor all skin types, especially oily skin\r\nProvides stay-true colour, 12 hours\r\nNon-fading, 12 hours\r\nNon-streaking, 12 hours\r\nNon-caking, 12 hours\r\nNon-settling/creasing, 12 hours\r\nPhoto-friendly', 'images (44).jpg', 1895, '', 9, 'T'),
(87, 'accessories', 'Contour in a minute with the Face Studio Master Contour Palette by Maybelline New York\r\nThree blendable and buildable shades help shape, define, and highlight the face for fool proof contouring\r\nThis easy-to-use 3-step contouring kit features bronzer, blush, and highlighter shades and an angled contour brush', 'images (45).jpg', 1195, '', 9, 'T'),
(88, 'accessories', 'Contour in a minute with the Face Studio Master Contour Palette by Maybelline New York\r\nThree blendable and buildable shades help shape, define, and highlight the face for fool proof contouring\r\nThis easy-to-use 3-step contouring kit features bronzer, blush, and highlighter shades and an angled contour brush', 'images (46).jpg', 1195, '', 9, 'T'),
(89, 'accessories', 'Contour in a minute with the Face Studio Master Contour Palette by Maybelline New York\r\nThree blendable and buildable shades help shape, define, and highlight the face for fool proof contouring\r\nThis easy-to-use 3-step contouring kit features bronzer, blush, and highlighter shades and an angled contour brush', 'images (47).jpg', 1195, '', 9, 'T'),
(91, 'accessories', 'Established in 2009, Incolor is a leading global beauty company bringing a wide range of luxurious, high-quality makeup products at affordable prices. The products have international formulations and packaging with the premium appeal and high level of research to ensure that the products stand the test of quality and consistency.', 'images (48).jpg', 4995, '', 9, 'T'),
(92, 'accessories', 'Established in 2009, Incolor is a leading global beauty company bringing a wide range of luxurious, high-quality makeup products at affordable prices. The products have international formulations and packaging with the premium appeal and high level of research to ensure that the products stand the test of quality and consistency.', 'images (49).jpg', 579, '', 9, 'T'),
(93, 'accessories', 'Established in 2009, Incolor is a leading global beauty company bringing a wide range of luxurious, high-quality makeup products at affordable prices. The products have international formulations and packaging with the premium appeal and high level of research to ensure that the products stand the test of quality and consistency.', 'images (49).jpg', 2195, '', 9, 'T'),
(94, 'fashion', 'Established in 2009, Incolor is a leading global beauty company bringing a wide range of luxurious, high-quality makeup products at affordable prices. The products have international formulations and packaging with the premium appeal and high level of research to ensure that the products stand the test of quality and consistency.', 'images (50).jpg', 695, '', 9, 'T'),
(95, 'gifts', 'GUESS Seductive Women EDT Spray\r\nTop notes are bergamot, black currant and pear\r\nMiddle notes are jasmine, African orange flower and orris root\r\nBase notes are vanille, olibanum and cashmere wood.', 'images (51).jpg', 895, '', 9, 'T'),
(96, 'natural accessories', 'GUESS Seductive Women EDT Spray\r\nTop notes are bergamot, black currant and pear\r\nMiddle notes are jasmine, African orange flower and orris root\r\nBase notes are vanille, olibanum and cashmere wood.', 'images (52).jpg', 149, '', 9, 'T'),
(97, 'fashion jewelry', 'This jewellery set consists of a necklace and a pair of earrings\r\nRose gold-plated American diamond necklace, has an adjustable hook closure\r\nA pair of matching drop earrings, secured with post and back closure\r\n\r\nSize & Fit\r\nLength of necklace: 42 cm\r\nLength of earrings: 4.5 cm\r\n\r\nMaterial & Care\r\nMaterial: Rose gold-plated brass\r\nStones: American Diamond stones\r\nCare Instructions:\r\nWipe your jewellery with a soft cloth after every use\r\nAlways store your jewellery in a flat box to avoid accidental scratches\r\nKeep sprays and perfumes away from your jewellery\r\nDo not soak your jewellery in water\r\nClean your jewellery using a soft brush, dipped in jewellery cleaning solution only', 'images (53).jpg', 1195, '', 9, 'T'),
(98, 'fashion franchises', 'This jewellery set consists of a necklace and a pair of earrings\r\nRose gold-plated American diamond necklace, has an adjustable hook closure\r\nA pair of matching drop earrings, secured with post and back closure\r\n\r\nSize & Fit\r\nLength of necklace: 42 cm\r\nLength of earrings: 4.5 cm\r\n\r\nMaterial & Care\r\nMaterial: Rose gold-plated brass\r\nStones: American Diamond stones\r\nCare Instructions:\r\nWipe your jewellery with a soft cloth after every use\r\nAlways store your jewellery in a flat box to avoid accidental scratches\r\nKeep sprays and perfumes away from your jewellery\r\nDo not soak your jewellery in water\r\nClean your jewellery using a soft brush, dipped in jewellery cleaning solution only', 'images (54).jpg', 1195, '', 9, 'T'),
(99, 'china', 'This jewellery set consists of a necklace and a pair of earrings\r\nRose gold-plated American diamond necklace, has an adjustable hook closure\r\nA pair of matching drop earrings, secured with post and back closure\r\n\r\nSize & Fit\r\nLength of necklace: 42 cm\r\nLength of earrings: 4.5 cm\r\n\r\nMaterial & Care\r\nMaterial: Rose gold-plated brass\r\nStones: American Diamond stones\r\nCare Instructions:\r\nWipe your jewellery with a soft cloth after every use\r\nAlways store your jewellery in a flat box to avoid accidental scratches\r\nKeep sprays and perfumes away from your jewellery\r\nDo not soak your jewellery in water\r\nClean your jewellery using a soft brush, dipped in jewellery cleaning solution only', 'download (24).jpg', 995, '', 9, 'T'),
(100, 'accessories', 'This jewellery set consists of a necklace and a pair of earrings\r\nRose gold-plated American diamond necklace, has an adjustable hook closure\r\nA pair of matching drop earrings, secured with post and back closure\r\n\r\nSize & Fit\r\nLength of necklace: 42 cm\r\nLength of earrings: 4.5 cm\r\n\r\nMaterial & Care\r\nMaterial: Rose gold-plated brass\r\nStones: American Diamond stones\r\nCare Instructions:\r\nWipe your jewellery with a soft cloth after every use\r\nAlways store your jewellery in a flat box to avoid accidental scratches\r\nKeep sprays and perfumes away from your jewellery\r\nDo not soak your jewellery in water\r\nClean your jewellery using a soft brush, dipped in jewellery cleaning solution only', 'download (25).jpg', 545, '', 9, 'T'),
(101, 'fashion', 'Biotique advancedayurveda bringswisdom of traditional Indian medicine and ingredients. The science of clinically-proven Swiss bio-technology. With exclusive BXL Complex, a new power source for intercellular communication and youthful reinvention.', 'download (26).jpg', 495, '', 9, 'T'),
(102, 'accessories', 'Biotique advancedayurveda bringswisdom of traditional Indian medicine and ingredients. The science of clinically-proven Swiss bio-technology. With exclusive BXL Complex, a new power source for intercellular communication and youthful reinvention.', 'download (27).jpg', 545, '', 9, 'T'),
(118, 'tulik bag', 'Black backpack\r\n2 Stash Pockets\r\n1 main compartment with zip closure\r\nPadded Mesh back\r\n1 External Zip Pocket\r\nPadded shoulder strap: Padded\r\nWater-resistance: No\r\nWarranty: 6 months\r\nWarranty provided by brand/manufacturer\r\n\r\nSize & Fit\r\nHeight: 32 cm\r\nWidth: 25 cm\r\nDepth: 12 cm\r\n\r\nMaterial & Care\r\nPolyester\r\nWipe with a clean, dry cloth to remove dust', 'download (35).jpg', 795, '', 13, 'T'),
(119, 'backpacks', 'Black backpack\r\n2 Stash Pockets\r\n1 main compartment with zip closure\r\nPadded Mesh back\r\n1 External Zip Pocket\r\nPadded shoulder strap: Padded\r\nWater-resistance: No\r\nWarranty: 6 months\r\nWarranty provided by brand/manufacturer\r\n\r\nSize & Fit\r\nHeight: 32 cm\r\nWidth: 25 cm\r\nDepth: 12 cm\r\n\r\nMaterial & Care\r\nPolyester\r\nWipe with a clean, dry cloth to remove dust', 'download (34).jpg', 2000, '', 13, 'T'),
(120, 'nike', 'Nike Kids Gym Club Duffel Bag Versatile Storage For Everyday Gear\r\nProduct Color: Black\r\nThe Nike Kids Gym Club Duffel Bag features a durable design built to carry your training essentials.\r\nInterior pockets help keep you organized, while its shoe compartment keeps your wet and dry footwear separate.\r\nMain compartment provides spacious storage.\r\nMesh compartment separates wet and dry shoes.\r\nDual handles can be closed together for easy carrying.\r\nPadded shoulder strap is removable and adjustable for custom comfort.\r\n\r\nWarranty: 6 months\r\n\r\nSize & Fit\r\nLength: 49 cm\r\nHeight: 24 cm\r\nWidth: 27 cm\r\n\r\n\r\n\r\nMaterial & Care\r\n100% polyester', 'download (39).jpg', 1000, '', 13, 'T'),
(121, 'turneep', 'Nike Kids Gym Club Duffel Bag Versatile Storage For Everyday Gear\r\nProduct Color: Black\r\nThe Nike Kids Gym Club Duffel Bag features a durable design built to carry your training essentials.\r\nInterior pockets help keep you organized, while its shoe compartment keeps your wet and dry footwear separate.\r\nMain compartment provides spacious storage.\r\nMesh compartment separates wet and dry shoes.\r\nDual handles can be closed together for easy carrying.\r\nPadded shoulder strap is removable and adjustable for custom comfort.\r\n\r\nWarranty: 6 months\r\n\r\nSize & Fit\r\nLength: 49 cm\r\nHeight: 24 cm\r\nWidth: 27 cm\r\n\r\n\r\n\r\nMaterial & Care\r\n100% polyester', 'download (40).jpg', 1700, '', 13, 'T'),
(122, 'handbag purse', 'Pink printed hard-sided cabin trolley bag\r\nOne handle on the top, has a trolley with a retractable handle and corner-mounted 360-degree inline skate wheels\r\nOne main zip compartment, has a zip lining, tabs secured with click clasps\r\nOne zipper compartment on the flap, and one zipper pocket\r\nWarranty: 5 years global warranty\r\nWarranty provided by the brand owner / manufacturer\r\n\r\n\r\nSize & Fit\r\nDimensions: 58 cm x 35 cm x 27 cm\r\n\r\n\r\nMaterial & Care\r\nPolycarbonate\r\nNormal hand wash', 'download (43).jpg', 500, '', 13, 'T'),
(123, 'bag and purse', 'Pink printed hard-sided cabin trolley bag\r\nOne handle on the top, has a trolley with a retractable handle and corner-mounted 360-degree inline skate wheels\r\nOne main zip compartment, has a zip lining, tabs secured with click clasps\r\nOne zipper compartment on the flap, and one zipper pocket\r\nWarranty: 5 years global warranty\r\nWarranty provided by the brand owner / manufacturer\r\n\r\n\r\nSize & Fit\r\nDimensions: 58 cm x 35 cm x 27 cm\r\n\r\n\r\nMaterial & Care\r\nPolycarbonate\r\nNormal hand wash', 'download (44).jpg', 1099, '', 13, 'T'),
(124, 'boat and tote', 'Blue backpack\r\nPadded haul loop\r\n3 and more main compartments with zip closure\r\nPadded Mesh back\r\nZip Pocket\r\nPadded shoulder strap: Padded\r\nWater-resistance: Yes\r\nWarranty: 1 year\r\nWarranty provided by brand/manufacturer\r\n\r\nSize & Fit\r\nProduct Dimensions - 48x33x23 cm (height x width x depth) in cm\r\nVolume: 36 L\r\n\r\nMaterial & Care\r\nNylon\r\nWipe with a clean, dry cloth to remove dust', 'download (45).jpg', 2500, '', 13, 'T'),
(126, 'discount bag', 'Blue backpack\r\nPadded haul loop\r\n3 and more main compartments with zip closure\r\nPadded Mesh back\r\nZip Pocket\r\nPadded shoulder strap: Padded\r\nWater-resistance: Yes\r\nWarranty: 1 year\r\nWarranty provided by brand/manufacturer\r\n\r\nSize & Fit\r\nProduct Dimensions - 48x33x23 cm (height x width x depth) in cm\r\nVolume: 36 L\r\n\r\nMaterial & Care\r\nNylon\r\nWipe with a clean, dry cloth to remove dust', 'download (46).jpg', 2400, '', 13, 'T'),
(127, 'hacking bags', 'Blue backpack\r\nPadded haul loop\r\n3 and more main compartments with zip closure\r\nPadded Mesh back\r\nZip Pocket\r\nPadded shoulder strap: Padded\r\nWater-resistance: Yes\r\nWarranty: 1 year\r\nWarranty provided by brand/manufacturer\r\n\r\nSize & Fit\r\nProduct Dimensions - 48x33x23 cm (height x width x depth) in cm\r\nVolume: 36 L\r\n\r\nMaterial & Care\r\nNylon\r\nWipe with a clean, dry cloth to remove dust', 'download (47).jpg', 2400, '', 13, 'T'),
(128, 'tommy hilfiger', 'Teal blue bucket shoulder bag, secured with a magnetic button closure\r\nTwo short adjustable handles with tasseled detail\r\nOne long sling strap\r\nOne main compartment\r\nComes with a pouch\r\n\r\nSize & Fit\r\nHeight: 26 cm\r\nWidth: 33 cm\r\nDepth: 16.5 cm\r\n\r\nMaterial & Care\r\nPU\r\nWipe with a clean, dry cloth when needed', 'download (48).jpg', 2700, '', 13, 'T'),
(129, 'designer bag', 'Teal blue bucket shoulder bag, secured with a magnetic button closure\r\nTwo short adjustable handles with tasseled detail\r\nOne long sling strap\r\nOne main compartment\r\nComes with a pouch\r\n\r\nSize & Fit\r\nHeight: 26 cm\r\nWidth: 33 cm\r\nDepth: 16.5 cm\r\n\r\nMaterial & Care\r\nPU\r\nWipe with a clean, dry cloth when needed', 'download (49).jpg', 2100, '', 13, 'T'),
(130, 'supreem collection', 'Teal blue bucket shoulder bag, secured with a magnetic button closure\r\nTwo short adjustable handles with tasseled detail\r\nOne long sling strap\r\nOne main compartment\r\nComes with a pouch\r\n\r\nSize & Fit\r\nHeight: 26 cm\r\nWidth: 33 cm\r\nDepth: 16.5 cm\r\n\r\nMaterial & Care\r\nPU\r\nWipe with a clean, dry cloth when needed', 'download (50).jpg', 2000, '', 13, 'T'),
(131, 'domyos', 'Teal blue bucket shoulder bag, secured with a magnetic button closure\r\nTwo short adjustable handles with tasseled detail\r\nOne long sling strap\r\nOne main compartment\r\nComes with a pouch\r\n\r\nSize & Fit\r\nHeight: 26 cm\r\nWidth: 33 cm\r\nDepth: 16.5 cm\r\n\r\nMaterial & Care\r\nPU\r\nWipe with a clean, dry cloth when needed', 'download (51).jpg', 2100, '', 13, 'T'),
(132, 'casual bag', 'Teal blue bucket shoulder bag, secured with a magnetic button closure\r\nTwo short adjustable handles with tasseled detail\r\nOne long sling strap\r\nOne main compartment\r\nComes with a pouch\r\n\r\nSize & Fit\r\nHeight: 26 cm\r\nWidth: 33 cm\r\nDepth: 16.5 cm\r\n\r\nMaterial & Care\r\nPU\r\nWipe with a clean, dry cloth when needed', 'IMG-20191006-WA0106.jpg', 2100, '', 13, 'T'),
(133, 'vip dapper', 'Beige solid satchel, has a button closure\r\n1 main compartment, 1 inner pocket\r\nTablet sleeve: Yes\r\nOne Handle and detachable sling strap\r\n\r\nSize & Fit\r\nHeight: 19 cm\r\nWidth: 20 cm\r\nDepth: 8.5 cm\r\n\r\nMaterial & Care\r\nSynthetic\r\nWipe with a clean, dry cloth to remove dust', 'IMG-20191006-WA0107.jpg', 2400, '', 13, 'T'),
(134, 'polyester', 'Beige solid satchel, has a button closure\r\n1 main compartment, 1 inner pocket\r\nTablet sleeve: Yes\r\nOne Handle and detachable sling strap\r\n\r\nSize & Fit\r\nHeight: 19 cm\r\nWidth: 20 cm\r\nDepth: 8.5 cm\r\n\r\nMaterial & Care\r\nSynthetic\r\nWipe with a clean, dry cloth to remove dust', 'IMG-20191006-WA0108.jpg', 2100, '', 13, 'T'),
(136, 'king styler', 'Beige solid satchel, has a button closure\r\n1 main compartment, 1 inner pocket\r\nTablet sleeve: Yes\r\nOne Handle and detachable sling strap\r\n\r\nSize & Fit\r\nHeight: 19 cm\r\nWidth: 20 cm\r\nDepth: 8.5 cm\r\n\r\nMaterial & Care\r\nSynthetic\r\nWipe with a clean, dry cloth to remove dust', 'IMG-20191006-WA0109.jpg', 2300, '', 13, 'T'),
(137, 'elegant', 'Beige solid satchel, has a button closure\r\n1 main compartment, 1 inner pocket\r\nTablet sleeve: Yes\r\nOne Handle and detachable sling strap\r\n\r\nSize & Fit\r\nHeight: 19 cm\r\nWidth: 20 cm\r\nDepth: 8.5 cm\r\n\r\nMaterial & Care\r\nSynthetic\r\nWipe with a clean, dry cloth to remove dust', 'IMG-20191006-WA0117.jpg', 2645, '', 13, 'T'),
(138, 'bijarre', 'Black solid sling bag, has a button closure\r\n2 main compartments\r\nDetachable sling strap\r\nWarranty: 3 months\r\nWarranty provided by manufacturer/ brand owner\r\n\r\nSize & Fit\r\nHeight: 17 cm\r\nWidth: 21 cm\r\nDepth: 8 cm\r\n\r\nMaterial & Care\r\nPU\r\nWipe with a clean, dry cloth to remove dust', 'IMG-20191006-WA0111.jpg', 1845, '', 13, 'T'),
(151, 'watches', 'Black solid sling bag, has a button closure\r\n2 main compartments\r\nDetachable sling strap\r\nWarranty: 3 months\r\nWarranty provided by manufacturer/ brand owner\r\n\r\nSize & Fit\r\nHeight: 17 cm\r\nWidth: 21 cm\r\nDepth: 8 cm\r\n\r\nMaterial & Care\r\nPU\r\nWipe with a clean, dry cloth to remove dust', 'IMG-20191006-WA0058.jpg', 1895, '', 14, 'T'),
(152, 'watches', 'Display: Analogue\r\nMovement: Quartz\r\nPower source: Battery\r\nDial style: Solid round stainless steel dial\r\nFeatures: Reset Time\r\nStrap style: Black bracelet style, metal strap with a foldover closure\r\nWater resistance: 30 m\r\nWarranty: 2 years\r\nWarranty provided by brand/manufacturer\r\nManufacture By Daniel Klein Group based in Hong Kong\r\nCountry of origin: China\r\n\r\nSize & Fit\r\nDial width: 40 mm\r\nStrap width: 20 mm', 'IMG-20191006-WA0059.jpg', 1095, '', 14, 'T'),
(153, 'watches', 'Display: Analogue\r\nMovement: Quartz\r\nPower source: Battery\r\nDial style: Solid round stainless steel dial\r\nFeatures: Reset Time\r\nStrap style: Black bracelet style, metal strap with a foldover closure\r\nWater resistance: 30 m\r\nWarranty: 2 years\r\nWarranty provided by brand/manufacturer\r\nManufacture By Daniel Klein Group based in Hong Kong\r\nCountry of origin: China\r\n\r\nSize & Fit\r\nDial width: 40 mm\r\nStrap width: 20 mm', 'IMG-20191006-WA0057.jpg', 1545, '', 14, 'T'),
(154, 'watches', 'Display: Analogue\r\nMovement: Quartz\r\nPower source: Battery\r\nDial style: Solid round stainless steel dial\r\nFeatures: Reset Time\r\nStrap style: Black bracelet style, metal strap with a foldover closure\r\nWater resistance: 30 m\r\nWarranty: 2 years\r\nWarranty provided by brand/manufacturer\r\nManufacture By Daniel Klein Group based in Hong Kong\r\nCountry of origin: China\r\n\r\nSize & Fit\r\nDial width: 40 mm\r\nStrap width: 20 mm', 'IMG-20191006-WA0067.jpg', 995, '', 14, 'T'),
(155, 'watches', 'The all new Mi Band 3 has an OLED touch display allowing you to read messages and notification without taking your phone out.\r\nMeasure step count, distance covered, heart rate, body temperature, sleep quality and many other useful data with just one touch of a finger.\r\nSmart technology responds to your movements.\r\nWith water resistance up to 50m and a unique feature to track your phone, take it wherever you go.\r\nOLED Touchscreen\r\nWater Resistance up to 50 M\r\nReal-time Activity Tracking\r\nMonitor heart rate continuously\r\nWarranty: 6 months\r\nWarranty provided by brand/manufaturer\r\nSpecifications:\r\n\r\nDisplay: Digital\r\nDial Material: Plastic\r\nDial Shape: Oval\r\nStrap Material: Rubber\r\nWater Resistance: Yes\r\nPedometer: Yes\r\nHeart Rate: Yes\r\nMonitor: Yes\r\nBluetooth: Yes\r\nCall Function: Yes\r\nSleep Monitor: Yes\r\nCaller ID: Yes\r\nGPS Tracking: No\r\nNotifications: Yes\r\nActivity Tracking: Yes\r\nOS: Other\r\nInternal Memory: NA\r\nActivity Training: No\r\nVoice Recognition: No\r\nBluetooth Version: V4.0\r\nDust Resistance: Yes\r\nAltimeter: No\r\nBarometer: No\r\nScreen Type: OLED\r\nDisplay Resolution: NA\r\nMicrophone: No\r\nProcessor Name: NA\r\nProcessor Speed: NA\r\nRAM: NA\r\nGlass Type: Normal\r\nBattery Capacity: NA\r\nBattery Type: Lithium ion\r\nCharging Type: Wired\r\nGyroscope: No\r\nSensor: Yes\r\nFlight Mode: No\r\nCompatibility: Android and iOS\r\nWi-Fi: No\r\nWi-Fi Version: NA\r\nFeatures: Swimming', 'download (53).jpg', 1195, '', 14, 'T'),
(156, 'watches', 'The all new Mi Band 3 has an OLED touch display allowing you to read messages and notification without taking your phone out.\r\nMeasure step count, distance covered, heart rate, body temperature, sleep quality and many other useful data with just one touch of a finger.\r\nSmart technology responds to your movements.\r\nWith water resistance up to 50m and a unique feature to track your phone, take it wherever you go.\r\nOLED Touchscreen\r\nWater Resistance up to 50 M\r\nReal-time Activity Tracking\r\nMonitor heart rate continuously\r\nWarranty: 6 months\r\nWarranty provided by brand/manufaturer\r\nSpecifications:\r\n\r\nDisplay: Digital\r\nDial Material: Plastic\r\nDial Shape: Oval\r\nStrap Material: Rubber\r\nWater Resistance: Yes\r\nPedometer: Yes\r\nHeart Rate: Yes\r\nMonitor: Yes\r\nBluetooth: Yes\r\nCall Function: Yes\r\nSleep Monitor: Yes\r\nCaller ID: Yes\r\nGPS Tracking: No\r\nNotifications: Yes\r\nActivity Tracking: Yes\r\nOS: Other\r\nInternal Memory: NA\r\nActivity Training: No\r\nVoice Recognition: No\r\nBluetooth Version: V4.0\r\nDust Resistance: Yes\r\nAltimeter: No\r\nBarometer: No\r\nScreen Type: OLED\r\nDisplay Resolution: NA\r\nMicrophone: No\r\nProcessor Name: NA\r\nProcessor Speed: NA\r\nRAM: NA\r\nGlass Type: Normal\r\nBattery Capacity: NA\r\nBattery Type: Lithium ion\r\nCharging Type: Wired\r\nGyroscope: No\r\nSensor: Yes\r\nFlight Mode: No\r\nCompatibility: Android and iOS\r\nWi-Fi: No\r\nWi-Fi Version: NA\r\nFeatures: Swimming', 'download (54).jpg', 495, '', 14, 'T'),
(157, 'watches', 'The all new Mi Band 3 has an OLED touch display allowing you to read messages and notification without taking your phone out.\r\nMeasure step count, distance covered, heart rate, body temperature, sleep quality and many other useful data with just one touch of a finger.\r\nSmart technology responds to your movements.\r\nWith water resistance up to 50m and a unique feature to track your phone, take it wherever you go.\r\nOLED Touchscreen\r\nWater Resistance up to 50 M\r\nReal-time Activity Tracking\r\nMonitor heart rate continuously\r\nWarranty: 6 months\r\nWarranty provided by brand/manufaturer\r\nSpecifications:\r\n\r\nDisplay: Digital\r\nDial Material: Plastic\r\nDial Shape: Oval\r\nStrap Material: Rubber\r\nWater Resistance: Yes\r\nPedometer: Yes\r\nHeart Rate: Yes\r\nMonitor: Yes\r\nBluetooth: Yes\r\nCall Function: Yes\r\nSleep Monitor: Yes\r\nCaller ID: Yes\r\nGPS Tracking: No\r\nNotifications: Yes\r\nActivity Tracking: Yes\r\nOS: Other\r\nInternal Memory: NA\r\nActivity Training: No\r\nVoice Recognition: No\r\nBluetooth Version: V4.0\r\nDust Resistance: Yes\r\nAltimeter: No\r\nBarometer: No\r\nScreen Type: OLED\r\nDisplay Resolution: NA\r\nMicrophone: No\r\nProcessor Name: NA\r\nProcessor Speed: NA\r\nRAM: NA\r\nGlass Type: Normal\r\nBattery Capacity: NA\r\nBattery Type: Lithium ion\r\nCharging Type: Wired\r\nGyroscope: No\r\nSensor: Yes\r\nFlight Mode: No\r\nCompatibility: Android and iOS\r\nWi-Fi: No\r\nWi-Fi Version: NA\r\nFeatures: Swimming', 'download (55).jpg', 2295, '', 14, 'T'),
(158, 'watches', 'The all new Mi Band 3 has an OLED touch display allowing you to read messages and notification without taking your phone out.\r\nMeasure step count, distance covered, heart rate, body temperature, sleep quality and many other useful data with just one touch of a finger.\r\nSmart technology responds to your movements.\r\nWith water resistance up to 50m and a unique feature to track your phone, take it wherever you go.\r\nOLED Touchscreen\r\nWater Resistance up to 50 M\r\nReal-time Activity Tracking\r\nMonitor heart rate continuously\r\nWarranty: 6 months\r\nWarranty provided by brand/manufaturer\r\nSpecifications:\r\n\r\nDisplay: Digital\r\nDial Material: Plastic\r\nDial Shape: Oval\r\nStrap Material: Rubber\r\nWater Resistance: Yes\r\nPedometer: Yes\r\nHeart Rate: Yes\r\nMonitor: Yes\r\nBluetooth: Yes\r\nCall Function: Yes\r\nSleep Monitor: Yes\r\nCaller ID: Yes\r\nGPS Tracking: No\r\nNotifications: Yes\r\nActivity Tracking: Yes\r\nOS: Other\r\nInternal Memory: NA\r\nActivity Training: No\r\nVoice Recognition: No\r\nBluetooth Version: V4.0\r\nDust Resistance: Yes\r\nAltimeter: No\r\nBarometer: No\r\nScreen Type: OLED\r\nDisplay Resolution: NA\r\nMicrophone: No\r\nProcessor Name: NA\r\nProcessor Speed: NA\r\nRAM: NA\r\nGlass Type: Normal\r\nBattery Capacity: NA\r\nBattery Type: Lithium ion\r\nCharging Type: Wired\r\nGyroscope: No\r\nSensor: Yes\r\nFlight Mode: No\r\nCompatibility: Android and iOS\r\nWi-Fi: No\r\nWi-Fi Version: NA\r\nFeatures: Swimming', 'download (56).jpg', 2795, '', 14, 'T'),
(159, 'watches', 'The all new Mi Band 3 has an OLED touch display allowing you to read messages and notification without taking your phone out.\r\nMeasure step count, distance covered, heart rate, body temperature, sleep quality and many other useful data with just one touch of a finger.\r\nSmart technology responds to your movements.\r\nWith water resistance up to 50m and a unique feature to track your phone, take it wherever you go.\r\nOLED Touchscreen\r\nWater Resistance up to 50 M\r\nReal-time Activity Tracking\r\nMonitor heart rate continuously\r\nWarranty: 6 months\r\nWarranty provided by brand/manufaturer\r\nSpecifications:\r\n\r\nDisplay: Digital\r\nDial Material: Plastic\r\nDial Shape: Oval\r\nStrap Material: Rubber\r\nWater Resistance: Yes\r\nPedometer: Yes\r\nHeart Rate: Yes\r\nMonitor: Yes\r\nBluetooth: Yes\r\nCall Function: Yes\r\nSleep Monitor: Yes\r\nCaller ID: Yes\r\nGPS Tracking: No\r\nNotifications: Yes\r\nActivity Tracking: Yes\r\nOS: Other\r\nInternal Memory: NA\r\nActivity Training: No\r\nVoice Recognition: No\r\nBluetooth Version: V4.0\r\nDust Resistance: Yes\r\nAltimeter: No\r\nBarometer: No\r\nScreen Type: OLED\r\nDisplay Resolution: NA\r\nMicrophone: No\r\nProcessor Name: NA\r\nProcessor Speed: NA\r\nRAM: NA\r\nGlass Type: Normal\r\nBattery Capacity: NA\r\nBattery Type: Lithium ion\r\nCharging Type: Wired\r\nGyroscope: No\r\nSensor: Yes\r\nFlight Mode: No\r\nCompatibility: Android and iOS\r\nWi-Fi: No\r\nWi-Fi Version: NA\r\nFeatures: Swimming', 'download (57).jpg', 5025, '', 14, 'T'),
(160, 'watches', 'The all new Mi Band 3 has an OLED touch display allowing you to read messages and notification without taking your phone out.\r\nMeasure step count, distance covered, heart rate, body temperature, sleep quality and many other useful data with just one touch of a finger.\r\nSmart technology responds to your movements.\r\nWith water resistance up to 50m and a unique feature to track your phone, take it wherever you go.\r\nOLED Touchscreen\r\nWater Resistance up to 50 M\r\nReal-time Activity Tracking\r\nMonitor heart rate continuously\r\nWarranty: 6 months\r\nWarranty provided by brand/manufaturer\r\nSpecifications:\r\n\r\nDisplay: Digital\r\nDial Material: Plastic\r\nDial Shape: Oval\r\nStrap Material: Rubber\r\nWater Resistance: Yes\r\nPedometer: Yes\r\nHeart Rate: Yes\r\nMonitor: Yes\r\nBluetooth: Yes\r\nCall Function: Yes\r\nSleep Monitor: Yes\r\nCaller ID: Yes\r\nGPS Tracking: No\r\nNotifications: Yes\r\nActivity Tracking: Yes\r\nOS: Other\r\nInternal Memory: NA\r\nActivity Training: No\r\nVoice Recognition: No\r\nBluetooth Version: V4.0\r\nDust Resistance: Yes\r\nAltimeter: No\r\nBarometer: No\r\nScreen Type: OLED\r\nDisplay Resolution: NA\r\nMicrophone: No\r\nProcessor Name: NA\r\nProcessor Speed: NA\r\nRAM: NA\r\nGlass Type: Normal\r\nBattery Capacity: NA\r\nBattery Type: Lithium ion\r\nCharging Type: Wired\r\nGyroscope: No\r\nSensor: Yes\r\nFlight Mode: No\r\nCompatibility: Android and iOS\r\nWi-Fi: No\r\nWi-Fi Version: NA\r\nFeatures: Swimming', 'download (59).jpg', 2967, '', 14, 'T'),
(161, 'watches', 'Display: Analogue\r\nMovement: Quartz\r\nPower source: Battery\r\nDial style: Embellished round stainless steel dial\r\nFeatures: Reset Time, Multi Function\r\nStrap style: Rose Gold-Toned bracelet style, stainless steel strap with a butterfly closure\r\nWater resistance: 50 m\r\nWarranty: 2 years\r\nWarranty provided by brand/manufacturer\r\nComes in a signature CASIO case\r\n\r\nSize & Fit\r\nDial Width: 32mm, Dial Height: 38.8mm, Dial Thickness: 8.4mm\r\nStrap Width:18mm\r\n\r\nMaterial & Care\r\nStainless Steel\r\nWipe with a clean, dry cloth when needed', 'download (61).jpg', 2999, '', 14, 'T'),
(162, 'watches', 'Display: Analogue\r\nMovement: Quartz\r\nPower source: Battery\r\nDial style: Embellished round stainless steel dial\r\nFeatures: Reset Time, Multi Function\r\nStrap style: Rose Gold-Toned bracelet style, stainless steel strap with a butterfly closure\r\nWater resistance: 50 m\r\nWarranty: 2 years\r\nWarranty provided by brand/manufacturer\r\nComes in a signature CASIO case\r\n\r\nSize & Fit\r\nDial Width: 32mm, Dial Height: 38.8mm, Dial Thickness: 8.4mm\r\nStrap Width:18mm\r\n\r\nMaterial & Care\r\nStainless Steel\r\nWipe with a clean, dry cloth when needed', 'download (62).jpg', 4999, '', 14, 'T'),
(163, 'toys', '\r\nBATTERY OPERATED REMOTE WIRE CONTROLLED TOY JCB TRUCK CRANE WHICH MOVES FORWARD AND BACKWARD WITH THE PRESS OF A SWITCH ON THE REMOTE THE LOADER OF THE TRUCK ALSO MOVES UP AND DOWN WITH THE PRESS OF A SWITCH ON THE REMOTE PLAY WITH IT FOR EVERLASTING FUN AND ENJOYMENT SUPER QUALITY PRODUCT WITH AWESOME PERFORMANCE REQUIRES 2 AA BATTERIES', 'download (64).jpg', 5295, '', 15, 'T'),
(164, 'toys', '\r\nBATTERY OPERATED REMOTE WIRE CONTROLLED TOY JCB TRUCK CRANE WHICH MOVES FORWARD AND BACKWARD WITH THE PRESS OF A SWITCH ON THE REMOTE THE LOADER OF THE TRUCK ALSO MOVES UP AND DOWN WITH THE PRESS OF A SWITCH ON THE REMOTE PLAY WITH IT FOR EVERLASTING FUN AND ENJOYMENT SUPER QUALITY PRODUCT WITH AWESOME PERFORMANCE REQUIRES 2 AA BATTERIES', 'download (65).jpg', 335, '', 15, 'T');
INSERT INTO `tbprd` (`prdcod`, `prdnam`, `prddsc`, `prdpic`, `prdprc`, `prdoff`, `prdcatcod`, `prdisavl`) VALUES
(165, 'toys', '\r\nBATTERY OPERATED REMOTE WIRE CONTROLLED TOY JCB TRUCK CRANE WHICH MOVES FORWARD AND BACKWARD WITH THE PRESS OF A SWITCH ON THE REMOTE THE LOADER OF THE TRUCK ALSO MOVES UP AND DOWN WITH THE PRESS OF A SWITCH ON THE REMOTE PLAY WITH IT FOR EVERLASTING FUN AND ENJOYMENT SUPER QUALITY PRODUCT WITH AWESOME PERFORMANCE REQUIRES 2 AA BATTERIES', 'download (66).jpg', 454, '', 15, 'T'),
(170, 'kid\'s toy', '\r\nPull Back Action. Excellent Body Graphics . Non Toxic Material. Dimension(14.4x6.3x6)cm\r\n', 'download (67).jpg', 299, '', 15, 'T'),
(171, 'kid\'s toy', '\r\nPull Back Action. Excellent Body Graphics . Non Toxic Material. Dimension(14.4x6.3x6)cm\r\n', 'download (68).jpg', 369, '', 15, 'T'),
(172, 'kids', '\r\nPull Back Action. Excellent Body Graphics . Non Toxic Material. Dimension(14.4x6.3x6)cm\r\n', 'download (69).jpg', 750, '', 15, 'T'),
(173, 'kid\'s clothes', 'Navy Blue and Yellow self-design knitted maxi dress, has a round neck, sleeveless, concealed zip closure, an attached lining, and flared hem\r\n\r\nMaterial & Care\r\nSilk', 'download (71).jpg', 795, '', 15, 'T'),
(174, 'kid\'s clothes', 'Navy Blue and Yellow self-design knitted maxi dress, has a round neck, sleeveless, concealed zip closure, an attached lining, and flared hem\r\n\r\nMaterial & Care\r\nSilk', 'download (72).jpg', 795, '', 15, 'T'),
(176, 'kid\'s clothes', 'Navy Blue and Yellow self-design knitted maxi dress, has a round neck, sleeveless, concealed zip closure, an attached lining, and flared hem\r\n\r\nMaterial & Care\r\nSilk', 'download (73).jpg', 745, '', 15, 'T'),
(177, 'kid\'s clothes', 'Navy Blue and Yellow self-design knitted maxi dress, has a round neck, sleeveless, concealed zip closure, an attached lining, and flared hem\r\n\r\nMaterial & Care\r\nSilk', 'download (75).jpg', 965, '', 15, 'T'),
(178, 'kid\'s clothes', 'Navy Blue and Yellow self-design knitted maxi dress, has a round neck, sleeveless, concealed zip closure, an attached lining, and flared hem\r\n\r\nMaterial & Care\r\nSilk', 'download (74).jpg', 1045, '', 15, 'T'),
(179, 'kid\'s clothes', 'Set with a top and joggers in sweatshirt fabric. Round-necked top with ribbing around the neckline and cuffs. Joggers with covered elastication and a drawstring at the waist, and ribbed hems. Soft brushed inside.\r\n\r\n\r\nMaterial & Care\r\n100% Cotton\r\nMachine wash', 'download (76).jpg', 900, '', 15, 'T'),
(180, 'beauty and health', 'Lakme is India\'s No.1 color cosmetics brand offering a wide range of high-end, world-class color cosmetics and skincare products. Lakme has a vast product range specially crafted by experts for the Indian skin. The brand has also been redefining fashion in India with Lakme Fashion Week, India\'s premier fashion event.\r\n\r\n\r\n', 'images (68).jpg', 900, '', 17, 'T'),
(181, 'beauty and health', 'Lakme is India\'s No.1 color cosmetics brand offering a wide range of high-end, world-class color cosmetics and skincare products. Lakme has a vast product range specially crafted by experts for the Indian skin. The brand has also been redefining fashion in India with Lakme Fashion Week, India\'s premier fashion event.\r\n\r\n', 'images (69).jpg', 900, '', 17, 'T'),
(182, '\r\nbeauty and health', 'A luxurious, slow-baked domed face powder with low-level pearlized pigments that provide a dimensional yet natural-satin finish\r\nCan be used to set foundation and to touch-up makeup throughout the day\r\nFeatures our 77-Mineral Complex and vitamin E\r\n', 'images (70).jpg', 900, '', 17, 'T'),
(183, 'beauty and health', 'A luxurious, slow-baked domed face powder with low-level pearlized pigments that provide a dimensional yet natural-satin finish\r\nCan be used to set foundation and to touch-up makeup throughout the day\r\nFeatures our 77-Mineral Complex and vitamin E', 'images (71).jpg', 750, '', 17, 'T'),
(184, 'beauty and health', 'A luxurious, slow-baked domed face powder with low-level pearlized pigments that provide a dimensional yet natural-satin finish\r\nCan be used to set foundation and to touch-up makeup throughout the day\r\nFeatures our 77-Mineral Complex and vitamin E', 'images (69).jpg', 750, '', 17, 'T'),
(185, 'beauty and health', 'A luxurious, slow-baked domed face powder with low-level pearlized pigments that provide a dimensional yet natural-satin finish\r\nCan be used to set foundation and to touch-up makeup throughout the day\r\nFeatures our 77-Mineral Complex and vitamin E', 'images (73).jpg', 750, '', 17, 'T'),
(186, 'beauty and health', 'Contour in a minute with the Face Studio Master Contour Palette by Maybelline New York\r\nThree blendable and buildable shades help shape, define, and highlight the face for fool proof contouring\r\nThis easy-to-use 3-step contouring kit features bronzer, blush, and highlighter shades and an angled contour brush', 'images (74).jpg', 800, '', 17, 'T'),
(187, 'beauty and health', 'Contour in a minute with the Face Studio Master Contour Palette by Maybelline New York\r\nThree blendable and buildable shades help shape, define, and highlight the face for fool proof contouring\r\nThis easy-to-use 3-step contouring kit features bronzer, blush, and highlighter shades and an angled contour brush', 'images (75).jpg', 800, '', 17, 'T'),
(188, 'beauty and health', 'Contour in a minute with the Face Studio Master Contour Palette by Maybelline New York\r\nThree blendable and buildable shades help shape, define, and highlight the face for fool proof contouring\r\nThis easy-to-use 3-step contouring kit features bronzer, blush, and highlighter shades and an angled contour brush', 'images (76).jpg', 800, '', 17, 'T'),
(189, 'beauty and health', 'Contour in a minute with the Face Studio Master Contour Palette by Maybelline New York\r\nThree blendable and buildable shades help shape, define, and highlight the face for fool proof contouring\r\nThis easy-to-use 3-step contouring kit features bronzer, blush, and highlighter shades and an angled contour brush', 'images (78).jpg', 648, '', 17, 'T'),
(190, 'beauty and health', 'Contour in a minute with the Face Studio Master Contour Palette by Maybelline New York\r\nThree blendable and buildable shades help shape, define, and highlight the face for fool proof contouring\r\nThis easy-to-use 3-step contouring kit features bronzer, blush, and highlighter shades and an angled contour brush', 'images (80).jpg', 648, '', 17, 'T'),
(191, 'beauty and health', '\r\nContour in a minute with the Face Studio Master Contour Palette by Maybelline New York\r\nThree blendable and buildable shades help shape, define, and highlight the face for fool proof contouring\r\nThis easy-to-use 3-step contouring kit features bronzer, blush, and highlighter shades and an angled contour brush', 'images (81).jpg', 649, '', 17, 'T'),
(192, 'beauty and  health', 'Contour in a minute with the Face Studio Master Contour Palette by Maybelline New York\r\nThree blendable and buildable shades help shape, define, and highlight the face for fool proof contouring\r\nThis easy-to-use 3-step contouring kit features bronzer, blush, and highlighter shades and an angled contour brush', 'images (79).jpg', 748, '', 17, 'T'),
(193, 'laptop', 'Performance: Core i3 5th Gen 2.0 Ghz 4 GB RAM\r\nDesign: 14.0 inches 1366 x 768 pixels 2.0 Kg 25.4 mm thick\r\nBattery: Li-Ion 4 Cell 4.5 Hrs\r\nStorage: 500 GB HDD SATA 5400 RPM', 'IMG-20191006-WA0033.jpg', 748, '', 18, 'T'),
(194, 'phones', '16MP+5MP rear camera | 16MP front facing camera\r\n14.732 centimeters (5.8-inch) with 1080 x 2280 pixels resolution\r\nMemory, Storage and SIM: 6GB RAM | 64GB internal memory | Expandable to 400 GB |Dual SIM dual-standby (4G+4G)\r\nAndroid v8 Oreo operating system with Qualcomm Snapdragon SD 636 quad core processor\r\n3060mAH lithium-ion battery\r\n1 year manufacturer warranty for device and 6 months manufacturer warranty for in-box accessories including batteries from the date of purchase\r\nBox includes: Charger and Data cable', 'IMG-20191006-WA0034.jpg', 550, '', 18, 'T'),
(195, 'realme', '16MP+5MP rear camera | 16MP front facing camera\r\n14.732 centimeters (5.8-inch) with 1080 x 2280 pixels resolution\r\nMemory, Storage and SIM: 6GB RAM | 64GB internal memory | Expandable to 400 GB |Dual SIM dual-standby (4G+4G)\r\nAndroid v8 Oreo operating system with Qualcomm Snapdragon SD 636 quad core processor\r\n3060mAH lithium-ion battery\r\n1 year manufacturer warranty for device and 6 months manufacturer warranty for in-box accessories including batteries from the date of purchase\r\nBox includes: Charger and Data cable', 'IMG-20191006-WA0035.jpg', 699, '', 18, 'T'),
(197, 'lenovo viBE K4 note', '16MP+5MP rear camera | 16MP front facing camera\r\n14.732 centimeters (5.8-inch) with 1080 x 2280 pixels resolution\r\nMemory, Storage and SIM: 6GB RAM | 64GB internal memory | Expandable to 400 GB |Dual SIM dual-standby (4G+4G)\r\nAndroid v8 Oreo operating system with Qualcomm Snapdragon SD 636 quad core processor\r\n3060mAH lithium-ion battery\r\n1 year manufacturer warranty for device and 6 months manufacturer warranty for in-box accessories including batteries from the date of purchase\r\nBox includes: Charger and Data cable\r\n', 'IMG-20191006-WA0036.jpg', 530, '', 18, 'T'),
(198, 'hp laptop', 'Performance: Core i3 5th Gen 2.0 Ghz 4 GB RAM\r\nDesign: 14.0 inches 1366 x 768 pixels 2.0 Kg 25.4 mm thick\r\nBattery: Li-Ion 4 Cell 4.5 Hrs\r\nStorage: 500 GB HDD SATA 5400 RPM', 'IMG-20191006-WA0037.jpg', 530, '', 18, 'T'),
(199, 'mobiles', '16MP+5MP rear camera | 16MP front facing camera\r\n14.732 centimeters (5.8-inch) with 1080 x 2280 pixels resolution\r\nMemory, Storage and SIM: 6GB RAM | 64GB internal memory | Expandable to 400 GB |Dual SIM dual-standby (4G+4G)\r\nAndroid v8 Oreo operating system with Qualcomm Snapdragon SD 636 quad core processor\r\n3060mAH lithium-ion battery\r\n1 year manufacturer warranty for device and 6 months manufacturer warranty for in-box accessories including batteries from the date of purchase\r\nBox includes: Charger and Data cable', 'IMG-20191006-WA0038.jpg', 530, '', 18, 'T'),
(200, 'lava iries fuel', '16MP+5MP rear camera | 16MP front facing camera\r\n14.732 centimeters (5.8-inch) with 1080 x 2280 pixels resolution\r\nMemory, Storage and SIM: 6GB RAM | 64GB internal memory | Expandable to 400 GB |Dual SIM dual-standby (4G+4G)\r\nAndroid v8 Oreo operating system with Qualcomm Snapdragon SD 636 quad core processor\r\n3060mAH lithium-ion battery\r\n1 year manufacturer warranty for device and 6 months manufacturer warranty for in-box accessories including batteries from the date of purchase\r\nBox includes: Charger and Data cable', 'IMG-20191006-WA0038.jpg', 530, '', 18, 'T'),
(201, 'micromax', 'Performance: Core i3 5th Gen 2.0 Ghz 4 GB RAM\r\nDesign: 14.0 inches 1366 x 768 pixels 2.0 Kg 25.4 mm thick\r\nBattery: Li-Ion 4 Cell 4.5 Hrs\r\nStorage: 500 GB HDD SATA 5400 RPM', 'IMG-20191006-WA0039.jpg', 900, '', 18, 'T'),
(202, 'red mi', '16MP+5MP rear camera | 16MP front facing camera\r\n14.732 centimeters (5.8-inch) with 1080 x 2280 pixels resolution\r\nMemory, Storage and SIM: 6GB RAM | 64GB internal memory | Expandable to 400 GB |Dual SIM dual-standby (4G+4G)\r\nAndroid v8 Oreo operating system with Qualcomm Snapdragon SD 636 quad core processor\r\n3060mAH lithium-ion battery\r\n1 year manufacturer warranty for device and 6 months manufacturer warranty for in-box accessories including batteries from the date of purchase\r\nBox includes: Charger and Data cable', 'IMG-20191006-WA0041.jpg', 900, '', 18, 'T'),
(203, 'intex', '16MP+5MP rear camera | 16MP front facing camera\r\n14.732 centimeters (5.8-inch) with 1080 x 2280 pixels resolution\r\nMemory, Storage and SIM: 6GB RAM | 64GB internal memory | Expandable to 400 GB |Dual SIM dual-standby (4G+4G)\r\nAndroid v8 Oreo operating system with Qualcomm Snapdragon SD 636 quad core processor\r\n3060mAH lithium-ion battery\r\n1 year manufacturer warranty for device and 6 months manufacturer warranty for in-box accessories including batteries from the date of purchase\r\nBox includes: Charger and Data cable\r\n', 'IMG-20191006-WA0042.jpg', 900, '', 18, 'T'),
(204, 'electronics', '16MP+5MP rear camera | 16MP front facing camera\r\n14.732 centimeters (5.8-inch) with 1080 x 2280 pixels resolution\r\nMemory, Storage and SIM: 6GB RAM | 64GB internal memory | Expandable to 400 GB |Dual SIM dual-standby (4G+4G)\r\nAndroid v8 Oreo operating system with Qualcomm Snapdragon SD 636 quad core processor\r\n3060mAH lithium-ion battery\r\n1 year manufacturer warranty for device and 6 months manufacturer warranty for in-box accessories including batteries from the date of purchase\r\nBox includes: Charger and Data cable', 'IMG-20191006-WA0043.jpg', 700, '', 18, 'T'),
(205, 'electronic', '\r\n16MP+5MP rear camera | 16MP front facing camera\r\n14.732 centimeters (5.8-inch) with 1080 x 2280 pixels resolution\r\nMemory, Storage and SIM: 6GB RAM | 64GB internal memory | Expandable to 400 GB |Dual SIM dual-standby (4G+4G)\r\nAndroid v8 Oreo operating system with Qualcomm Snapdragon SD 636 quad core processor\r\n3060mAH lithium-ion battery\r\n1 year manufacturer warranty for device and 6 months manufacturer warranty for in-box accessories including batteries from the date of purchase\r\nBox includes: Charger and Data cable', 'IMG-20191006-WA0044.jpg', 650, '', 18, 'T'),
(206, '\r\nelectronic', '16MP+5MP rear camera | 16MP front facing camera\r\n14.732 centimeters (5.8-inch) with 1080 x 2280 pixels resolution\r\nMemory, Storage and SIM: 6GB RAM | 64GB internal memory | Expandable to 400 GB |Dual SIM dual-standby (4G+4G)\r\nAndroid v8 Oreo operating system with Qualcomm Snapdragon SD 636 quad core processor\r\n3060mAH lithium-ion battery\r\n1 year manufacturer warranty for device and 6 months manufacturer warranty for in-box accessories including batteries from the date of purchase\r\nBox includes: Charger and Data cable\r\n', 'IMG-20191006-WA0045.jpg', 2000, '', 18, 'T'),
(207, 'electronic', '16MP+5MP rear camera | 16MP front facing camera\r\n14.732 centimeters (5.8-inch) with 1080 x 2280 pixels resolution\r\nMemory, Storage and SIM: 6GB RAM | 64GB internal memory | Expandable to 400 GB |Dual SIM dual-standby (4G+4G)\r\nAndroid v8 Oreo operating system with Qualcomm Snapdragon SD 636 quad core processor\r\n3060mAH lithium-ion battery\r\n1 year manufacturer warranty for device and 6 months manufacturer warranty for in-box accessories including batteries from the date of purchase\r\nBox includes: Charger and Data cable', 'IMG-20191006-WA0046.jpg', 1800, '', 18, 'T');

-- --------------------------------------------------------

--
-- Table structure for table `tbrat`
--

DROP TABLE IF EXISTS `tbrat`;
CREATE TABLE IF NOT EXISTS `tbrat` (
  `ratcod` int(11) NOT NULL AUTO_INCREMENT,
  `ratusrcod` int(11) NOT NULL,
  `ratprdcod` int(11) NOT NULL,
  `ratscr` int(11) NOT NULL,
  PRIMARY KEY (`ratcod`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbrat`
--

INSERT INTO `tbrat` (`ratcod`, `ratusrcod`, `ratprdcod`, `ratscr`) VALUES
(1, 18, 1, 5),
(2, 18, 2, 4),
(3, 18, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbusr`
--

DROP TABLE IF EXISTS `tbusr`;
CREATE TABLE IF NOT EXISTS `tbusr` (
  `usrcod` int(11) NOT NULL AUTO_INCREMENT,
  `usreml` varchar(100) NOT NULL,
  `usrpwd` varchar(100) NOT NULL,
  `usrregdat` datetime NOT NULL,
  `usrrol` char(1) NOT NULL,
  PRIMARY KEY (`usrcod`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbusr`
--

INSERT INTO `tbusr` (`usrcod`, `usreml`, `usrpwd`, `usrregdat`, `usrrol`) VALUES
(15, 'ashupatial067@gmail.com', '669372', '2019-02-07 00:00:00', 'U'),
(16, 'anujkmr25299@gmail.com', '719635', '2019-02-08 00:00:00', 'U'),
(17, 'adminshopping@gmail.com', 'admin123', '2019-02-08 00:00:00', 'A'),
(18, 'kavita6593@gmail.com', '123456', '2019-11-04 00:00:00', 'U'),
(20, 'vasuQ@gamil.com', '1234567', '2019-11-08 00:00:00', 'U');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
