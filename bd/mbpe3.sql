CREATE DATABASE  IF NOT EXISTS `mbpe` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mbpe`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: mbpe
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `boleta`
--

DROP TABLE IF EXISTS `boleta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boleta` (
  `id_boleta` int NOT NULL AUTO_INCREMENT,
  `monto_total` double NOT NULL,
  `fecha` date NOT NULL,
  `id_usuario` int NOT NULL,
  `id_metodo` int NOT NULL,
  `id_detalle` int NOT NULL,
  `UsuCrea` varchar(255) DEFAULT NULL,
  `FecCrea` datetime DEFAULT NULL,
  `UsuModif` varchar(255) DEFAULT NULL,
  `FecModif` datetime DEFAULT NULL,
  PRIMARY KEY (`id_boleta`),
  KEY `fk_boleta_usuario1_idx` (`id_usuario`),
  KEY `fk_boleta_metodo_de_pago1_idx` (`id_metodo`),
  KEY `fk_boleta_detalle_boleta1_idx` (`id_detalle`),
  CONSTRAINT `fk_boleta_detalle_boleta1` FOREIGN KEY (`id_detalle`) REFERENCES `detalle_boleta` (`id_detalle`),
  CONSTRAINT `fk_boleta_metodo_de_pago1` FOREIGN KEY (`id_metodo`) REFERENCES `metodo_de_pago` (`id_metodo`),
  CONSTRAINT `fk_boleta_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boleta`
--

LOCK TABLES `boleta` WRITE;
/*!40000 ALTER TABLE `boleta` DISABLE KEYS */;
/*!40000 ALTER TABLE `boleta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T01I_boleta` BEFORE INSERT ON `boleta` FOR EACH ROW BEGIN
set new.UsuCrea = USER();
set new.FecCrea = NOW();
set new.UsuModif = USER();
set new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T02U_boleta` BEFORE UPDATE ON `boleta` FOR EACH ROW BEGIN
set new.UsuModif = USER();
set new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `box_plantilla`
--

DROP TABLE IF EXISTS `box_plantilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `box_plantilla` (
  `id_plantilla` int NOT NULL AUTO_INCREMENT,
  `nombre_plantilla` varchar(45) NOT NULL,
  `precio` double NOT NULL,
  `id_categoria` int NOT NULL,
  `id_capacidad` int NOT NULL,
  `UsuCrea` varchar(255) DEFAULT NULL,
  `FecCrea` datetime DEFAULT NULL,
  `UsuModif` varchar(255) DEFAULT NULL,
  `FecModif` datetime DEFAULT NULL,
  PRIMARY KEY (`id_plantilla`),
  UNIQUE KEY `nombre_plantilla_UNIQUE` (`nombre_plantilla`),
  KEY `fk_box_plantilla_categoria1_idx` (`id_categoria`),
  KEY `id_capacidad_idx` (`id_capacidad`),
  CONSTRAINT `fk_box_plantilla_categoria1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `id_capacidad` FOREIGN KEY (`id_capacidad`) REFERENCES `capacidad` (`id_capacidad`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `box_plantilla`
--

LOCK TABLES `box_plantilla` WRITE;
/*!40000 ALTER TABLE `box_plantilla` DISABLE KEYS */;
INSERT INTO `box_plantilla` VALUES (1,'Anime Mini',69.99,1,1,NULL,NULL,NULL,NULL),(2,'Anime Mediano',135.99,1,2,NULL,NULL,NULL,NULL),(3,'Anime Grande',199.99,1,3,NULL,NULL,NULL,NULL),(4,'Anime Super',260.99,1,4,NULL,NULL,NULL,NULL),(5,'Anime Ultra',320.99,1,5,NULL,NULL,NULL,NULL),(6,'Tecnologia Mini',79.99,2,1,NULL,NULL,NULL,NULL),(7,'Tecnologia Mediano',155.99,2,2,NULL,NULL,NULL,NULL),(8,'Tecnologia Grande',235.99,2,3,NULL,NULL,NULL,NULL),(9,'Tecnologia Super',310.99,2,4,NULL,NULL,NULL,NULL),(10,'Tecnologia Ultra',360.99,2,5,NULL,NULL,NULL,NULL),(11,'Moda Mini',59.99,3,1,NULL,NULL,NULL,NULL),(12,'Moda Mediano',115.99,3,2,NULL,NULL,NULL,NULL),(13,'Moda Grande',179.99,3,3,NULL,NULL,NULL,NULL),(14,'Moda Super',220.99,3,4,NULL,NULL,NULL,NULL),(15,'Moda Ultra',260.99,3,5,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `box_plantilla` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T01I_box_plantilla` BEFORE INSERT ON `box_plantilla` FOR EACH ROW BEGIN
  SET new.UsuCrea = USER();
  SET new.FecCrea = NOW();
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T02U_box_plantilla` BEFORE UPDATE ON `box_plantilla` FOR EACH ROW BEGIN
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `box_venta`
--

DROP TABLE IF EXISTS `box_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `box_venta` (
  `id_caja` int NOT NULL AUTO_INCREMENT,
  `mensaje` varchar(50) DEFAULT NULL,
  `id_plantilla` int NOT NULL,
  `id_skin` int NOT NULL,
  `id_contenido` int NOT NULL,
  `UsuCrea` varchar(255) DEFAULT NULL,
  `FecCrea` datetime DEFAULT NULL,
  `UsuModif` varchar(255) DEFAULT NULL,
  `FecModif` datetime DEFAULT NULL,
  PRIMARY KEY (`id_caja`),
  KEY `fkbox_plantilla1_idx` (`id_plantilla`),
  KEY `fk_box_venta_skin_caja1_idx` (`id_skin`),
  KEY `fk_box_venta_contenido_box1_idx` (`id_contenido`),
  CONSTRAINT `fk_box_venta_contenido_box1` FOREIGN KEY (`id_contenido`) REFERENCES `contenido_box` (`id_contenido`),
  CONSTRAINT `fk_box_venta_skin_caja1` FOREIGN KEY (`id_skin`) REFERENCES `skin_caja` (`id_skin`),
  CONSTRAINT `fkbox_plantilla1` FOREIGN KEY (`id_plantilla`) REFERENCES `box_plantilla` (`id_plantilla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `box_venta`
--

LOCK TABLES `box_venta` WRITE;
/*!40000 ALTER TABLE `box_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `box_venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T01I_box_venta` BEFORE INSERT ON `box_venta` FOR EACH ROW BEGIN
  SET new.UsuCrea = USER();
  SET new.FecCrea = NOW();
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T02U_box_venta` BEFORE UPDATE ON `box_venta` FOR EACH ROW BEGIN
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `capacidad`
--

DROP TABLE IF EXISTS `capacidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capacidad` (
  `id_capacidad` int NOT NULL AUTO_INCREMENT,
  `nombre_capacidad` varchar(45) NOT NULL,
  `capacidad` int NOT NULL,
  `UsuCrea` varchar(255) DEFAULT NULL,
  `FecCrea` datetime DEFAULT NULL,
  `UsuModif` varchar(255) DEFAULT NULL,
  `FecModif` datetime DEFAULT NULL,
  PRIMARY KEY (`id_capacidad`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capacidad`
--

LOCK TABLES `capacidad` WRITE;
/*!40000 ALTER TABLE `capacidad` DISABLE KEYS */;
INSERT INTO `capacidad` VALUES (1,'S',3,NULL,NULL,NULL,NULL),(2,'M',6,NULL,NULL,NULL,NULL),(3,'L',9,NULL,NULL,NULL,NULL),(4,'XL',12,NULL,NULL,NULL,NULL),(5,'XXL',15,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `capacidad` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T01I_capacidad` BEFORE INSERT ON `capacidad` FOR EACH ROW BEGIN
  SET new.UsuCrea = USER();
  SET new.FecCrea = NOW();
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T02U_capacidad` BEFORE UPDATE ON `capacidad` FOR EACH ROW BEGIN
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(45) NOT NULL,
  `UsuCrea` varchar(255) DEFAULT NULL,
  `FecCrea` datetime DEFAULT NULL,
  `UsuModif` varchar(255) DEFAULT NULL,
  `FecModif` datetime DEFAULT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nombre_categoria_UNIQUE` (`nombre_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Anime',NULL,NULL,NULL,NULL),(2,'Tecnologia',NULL,NULL,NULL,NULL),(3,'Moda',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T01I_categoria` BEFORE INSERT ON `categoria` FOR EACH ROW BEGIN
  SET new.UsuCrea = USER();
  SET new.FecCrea = NOW();
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T02U_categoria` BEFORE UPDATE ON `categoria` FOR EACH ROW BEGIN
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `contenido_box`
--

DROP TABLE IF EXISTS `contenido_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenido_box` (
  `id_contenido` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `UsuCrea` varchar(255) DEFAULT NULL,
  `FecCrea` datetime DEFAULT NULL,
  `UsuModif` varchar(255) DEFAULT NULL,
  `FecModif` datetime DEFAULT NULL,
  PRIMARY KEY (`id_contenido`),
  KEY `fk_contenido_box_producto1_idx` (`id_producto`),
  CONSTRAINT `fk_contenido_box_producto1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenido_box`
--

LOCK TABLES `contenido_box` WRITE;
/*!40000 ALTER TABLE `contenido_box` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenido_box` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T01I_contenido_box` BEFORE INSERT ON `contenido_box` FOR EACH ROW BEGIN
  SET new.UsuCrea = USER();
  SET new.FecCrea = NOW();
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T02U_contenido_box` BEFORE UPDATE ON `contenido_box` FOR EACH ROW BEGIN
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalle_boleta`
--

DROP TABLE IF EXISTS `detalle_boleta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_boleta` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `id_caja` int NOT NULL,
  `UsuCrea` varchar(255) DEFAULT NULL,
  `FecCrea` datetime DEFAULT NULL,
  `UsuModif` varchar(255) DEFAULT NULL,
  `FecModif` datetime DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `fk_detalle_boleta_mystery_box1_idx` (`id_caja`),
  CONSTRAINT `fk_detalle_boleta_mystery_box1` FOREIGN KEY (`id_caja`) REFERENCES `box_venta` (`id_caja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_boleta`
--

LOCK TABLES `detalle_boleta` WRITE;
/*!40000 ALTER TABLE `detalle_boleta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_boleta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T01I_detalle_boleta` BEFORE INSERT ON `detalle_boleta` FOR EACH ROW BEGIN
  SET new.UsuCrea = USER();
  SET new.FecCrea = NOW();
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T02U_detalle_boleta` BEFORE UPDATE ON `detalle_boleta` FOR EACH ROW BEGIN
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id_direccion` int NOT NULL AUTO_INCREMENT,
  `departamento` varchar(45) DEFAULT NULL,
  `distrito` varchar(45) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `referencias` varchar(200) DEFAULT NULL,
  `UsuCrea` varchar(255) DEFAULT NULL,
  `FecCrea` datetime DEFAULT NULL,
  `UsuModif` varchar(255) DEFAULT NULL,
  `FecModif` datetime DEFAULT NULL,
  PRIMARY KEY (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (2,'','','','',NULL,NULL,NULL,NULL),(3,'','','','',NULL,NULL,NULL,NULL),(4,'','','','',NULL,NULL,NULL,NULL),(5,'','','','',NULL,NULL,NULL,NULL),(6,'','','','',NULL,NULL,NULL,NULL),(7,'','','','',NULL,NULL,NULL,NULL),(8,'','','','',NULL,NULL,NULL,NULL),(9,'','','','',NULL,NULL,NULL,NULL),(10,'','','','',NULL,NULL,NULL,NULL),(11,'','','','',NULL,NULL,NULL,NULL),(12,'','','','',NULL,NULL,NULL,NULL),(13,'','','','',NULL,NULL,NULL,NULL),(14,'','','','',NULL,NULL,NULL,NULL),(15,'','','','',NULL,NULL,NULL,NULL),(16,'','','','','root@localhost','2023-12-03 13:07:47','root@localhost','2023-12-03 13:07:47'),(17,'','','','','root@localhost','2023-12-03 13:08:50','root@localhost','2023-12-03 13:08:50');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T01I_direccion` BEFORE INSERT ON `direccion` FOR EACH ROW BEGIN
  SET new.UsuCrea = USER();
  SET new.FecCrea = NOW();
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T02U_direccion` BEFORE UPDATE ON `direccion` FOR EACH ROW BEGIN
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `metodo_de_pago`
--

DROP TABLE IF EXISTS `metodo_de_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_de_pago` (
  `id_metodo` int NOT NULL AUTO_INCREMENT,
  `nombre_metodo` varchar(45) NOT NULL,
  `UsuCrea` varchar(255) DEFAULT NULL,
  `FecCrea` datetime DEFAULT NULL,
  `UsuModif` varchar(255) DEFAULT NULL,
  `FecModif` datetime DEFAULT NULL,
  PRIMARY KEY (`id_metodo`),
  UNIQUE KEY `nombre_metodo_pago_UNIQUE` (`nombre_metodo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_de_pago`
--

LOCK TABLES `metodo_de_pago` WRITE;
/*!40000 ALTER TABLE `metodo_de_pago` DISABLE KEYS */;
INSERT INTO `metodo_de_pago` VALUES (1,'Visa',NULL,NULL,NULL,NULL),(2,'MasterCard',NULL,NULL,NULL,NULL),(3,'Yape',NULL,NULL,NULL,NULL),(4,'PagoEfectivo',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `metodo_de_pago` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T01I_metodo_de_pago` BEFORE INSERT ON `metodo_de_pago` FOR EACH ROW BEGIN
  SET new.UsuCrea = USER();
  SET new.FecCrea = NOW();
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T02U_metodo_de_pago` BEFORE UPDATE ON `metodo_de_pago` FOR EACH ROW BEGIN
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `plantillas`
--

DROP TABLE IF EXISTS `plantillas`;
/*!50001 DROP VIEW IF EXISTS `plantillas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `plantillas` AS SELECT 
 1 AS `id_plantilla`,
 1 AS `nombre_plantilla`,
 1 AS `precio`,
 1 AS `nombre_categoria`,
 1 AS `capacidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(100) NOT NULL,
  `stock` int NOT NULL,
  `precio` double NOT NULL,
  `id_rareza` int NOT NULL,
  `id_categoria` int NOT NULL,
  `UsuCrea` varchar(255) DEFAULT NULL,
  `FecCrea` datetime DEFAULT NULL,
  `UsuModif` varchar(255) DEFAULT NULL,
  `FecModif` datetime DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `nombre_producto_UNIQUE` (`nombre_producto`),
  KEY `fk_producto_rareza1_idx` (`id_rareza`),
  KEY `fk_producto_categoria1_idx` (`id_categoria`),
  CONSTRAINT `fk_producto_categoria1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `fk_producto_rareza1` FOREIGN KEY (`id_rareza`) REFERENCES `rareza` (`id_rareza`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Naruto Shippuden DVD Box Set',50,30,1,1,NULL,NULL,NULL,NULL),(2,'One Piece Collectible Figure',30,50,1,1,NULL,NULL,NULL,NULL),(3,'Dragon Ball Z Poster',20,70,2,1,NULL,NULL,NULL,NULL),(4,'Attack on Titan Manga Volume 1',15,100,2,1,NULL,NULL,NULL,NULL),(5,'My Hero Academia Blu-ray Box Set',10,150,3,1,NULL,NULL,NULL,NULL),(6,'Neon Genesis Evangelion Collectible Statue',5,200,3,1,NULL,NULL,NULL,NULL),(7,'Apple iPhone 13 Pro',30,1000,1,2,NULL,NULL,NULL,NULL),(8,'Samsung 4K QLED TV',20,1500,1,2,NULL,NULL,NULL,NULL),(9,'Sony Noise-Canceling Headphones',15,2000,2,2,NULL,NULL,NULL,NULL),(10,'Dell XPS 15 Laptop',10,2500,2,2,NULL,NULL,NULL,NULL),(11,'Sony PlayStation 5',5,3000,3,2,NULL,NULL,NULL,NULL),(12,'NVIDIA GeForce RTX 3080 Graphics Card',5,4000,3,2,NULL,NULL,NULL,NULL),(13,'Designer T-Shirt',50,50,1,3,NULL,NULL,NULL,NULL),(14,'Fashionable Sunglasses',40,75,1,3,NULL,NULL,NULL,NULL),(15,'Leather Jacket',30,120,2,3,NULL,NULL,NULL,NULL),(16,'High Heels',20,160,2,3,NULL,NULL,NULL,NULL),(17,'Vintage Rolex Watch',10,300,3,3,NULL,NULL,NULL,NULL),(18,'Custom Tailored Suit',5,500,3,3,NULL,NULL,NULL,NULL),(19,'Sailor Moon Plushie',40,25,1,1,NULL,NULL,NULL,NULL),(20,'One Punch Man Manga Volume 1',25,40,1,1,NULL,NULL,NULL,NULL),(21,'Demon Slayer Poster',15,60,2,1,NULL,NULL,NULL,NULL),(22,'Google Pixel 6',20,900,1,2,NULL,NULL,NULL,NULL),(23,'Sony 65\" OLED TV',15,1400,1,2,NULL,NULL,NULL,NULL),(24,'Bose Wireless Earbuds',10,1800,2,2,NULL,NULL,NULL,NULL),(25,'Designer Scarf',40,40,1,3,NULL,NULL,NULL,NULL),(26,'Stylish Backpack',30,65,1,3,NULL,NULL,NULL,NULL),(27,'Leather Boots',20,100,2,3,NULL,NULL,NULL,NULL),(28,'One Piece Poster',35,45,1,1,NULL,NULL,NULL,NULL),(29,'Naruto Action Figure',30,55,1,1,NULL,NULL,NULL,NULL),(30,'Attack on Titan T-shirt',25,70,2,1,NULL,NULL,NULL,NULL),(31,'Dragon Ball Z Collectible Statue',20,90,2,1,NULL,NULL,NULL,NULL),(32,'My Hero Academia Manga Volume 5',15,120,3,1,NULL,NULL,NULL,NULL),(33,'Neon Genesis Evangelion Blu-ray Box Set',10,180,3,1,NULL,NULL,NULL,NULL),(34,'Sony PlayStation 4',25,300,1,2,NULL,NULL,NULL,NULL),(35,'Apple AirPods',20,350,1,2,NULL,NULL,NULL,NULL),(36,'Samsung Galaxy Tab',15,450,2,2,NULL,NULL,NULL,NULL),(37,'LG 55\" 4K Smart TV',10,600,2,2,NULL,NULL,NULL,NULL),(38,'Dell Alienware Gaming Laptop',5,1000,3,2,NULL,NULL,NULL,NULL),(39,'NVIDIA RTX 3090 Graphics Card',5,1500,3,2,NULL,NULL,NULL,NULL),(51,'Cotton T-Shirt',30,20,1,3,NULL,NULL,NULL,NULL),(52,'Denim Jeans',40,25,1,3,NULL,NULL,NULL,NULL),(53,'Sunglasses',25,15,1,3,NULL,NULL,NULL,NULL),(54,'Leather Belt',30,22,1,3,NULL,NULL,NULL,NULL),(55,'Casual Sneakers',35,30,1,3,NULL,NULL,NULL,NULL),(56,'Summer Dress',30,28,1,3,NULL,NULL,NULL,NULL),(57,'Beanie Hat',25,10,1,3,NULL,NULL,NULL,NULL),(58,'Leather Wallet',35,18,1,3,NULL,NULL,NULL,NULL),(59,'Wristwatch',30,40,1,3,NULL,NULL,NULL,NULL),(60,'Cotton Socks',40,8,1,3,NULL,NULL,NULL,NULL),(71,'Sailor Moon Notebook',35,8,1,1,NULL,NULL,NULL,NULL),(72,'Attack on Titan Wristband',30,10,1,1,NULL,NULL,NULL,NULL),(73,'My Hero Academia Pencil Case',25,7,1,1,NULL,NULL,NULL,NULL),(74,'Neon Genesis Evangelion Stickers',35,9,1,1,NULL,NULL,NULL,NULL),(75,'Pokémon Trading Cards',30,20,1,1,NULL,NULL,NULL,NULL),(76,'Studio Ghibli Poster',40,15,1,1,NULL,NULL,NULL,NULL),(77,'USB Flash Drive 32GB',30,15,1,2,NULL,NULL,NULL,NULL),(78,'Wireless Mouse',40,12,1,2,NULL,NULL,NULL,NULL),(79,'HDMI Cable',25,8,1,2,NULL,NULL,NULL,NULL),(80,'Laptop Sleeve',30,20,1,2,NULL,NULL,NULL,NULL),(81,'Portable Power Bank',35,18,1,2,NULL,NULL,NULL,NULL),(82,'External Hard Drive 1TB',30,45,1,2,NULL,NULL,NULL,NULL),(83,'Bluetooth Speaker',25,30,1,2,NULL,NULL,NULL,NULL),(84,'Computer Keyboard',35,25,1,2,NULL,NULL,NULL,NULL),(85,'Headset with Microphone',30,28,1,2,NULL,NULL,NULL,NULL),(86,'Wireless Router',40,40,1,2,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T01I_producto` BEFORE INSERT ON `producto` FOR EACH ROW BEGIN
  SET new.UsuCrea = USER();
  SET new.FecCrea = NOW();
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T02U_producto` BEFORE UPDATE ON `producto` FOR EACH ROW BEGIN
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rareza`
--

DROP TABLE IF EXISTS `rareza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rareza` (
  `id_rareza` int NOT NULL AUTO_INCREMENT,
  `nombre_rareza` varchar(100) NOT NULL,
  `probabilidad` double NOT NULL,
  `UsuCrea` varchar(255) DEFAULT NULL,
  `FecCrea` datetime DEFAULT NULL,
  `UsuModif` varchar(255) DEFAULT NULL,
  `FecModif` datetime DEFAULT NULL,
  PRIMARY KEY (`id_rareza`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rareza`
--

LOCK TABLES `rareza` WRITE;
/*!40000 ALTER TABLE `rareza` DISABLE KEYS */;
INSERT INTO `rareza` VALUES (1,'Comun',0.8,NULL,NULL,NULL,NULL),(2,'Poco Comun',0.15,NULL,NULL,NULL,NULL),(3,'Raro',0.045,NULL,NULL,NULL,NULL),(4,'Epecial',0.005,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `rareza` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T01I_rareza` BEFORE INSERT ON `rareza` FOR EACH ROW BEGIN
  SET new.UsuCrea = USER();
  SET new.FecCrea = NOW();
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T02U_rareza` BEFORE UPDATE ON `rareza` FOR EACH ROW BEGIN
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `skin_caja`
--

DROP TABLE IF EXISTS `skin_caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skin_caja` (
  `id_skin` int NOT NULL AUTO_INCREMENT,
  `nombre_skin` varchar(45) NOT NULL,
  `UsuCrea` varchar(255) DEFAULT NULL,
  `FecCrea` datetime DEFAULT NULL,
  `UsuModif` varchar(255) DEFAULT NULL,
  `FecModif` datetime DEFAULT NULL,
  PRIMARY KEY (`id_skin`),
  UNIQUE KEY `nombre_skin_UNIQUE` (`nombre_skin`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skin_caja`
--

LOCK TABLES `skin_caja` WRITE;
/*!40000 ALTER TABLE `skin_caja` DISABLE KEYS */;
INSERT INTO `skin_caja` VALUES (1,'Default',NULL,NULL,NULL,NULL),(2,'Cumpleaños',NULL,NULL,NULL,NULL),(3,'Romantico',NULL,NULL,NULL,NULL),(4,'Navidad',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `skin_caja` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T01I_skin_caja` BEFORE INSERT ON `skin_caja` FOR EACH ROW BEGIN
  SET new.UsuCrea = USER();
  SET new.FecCrea = NOW();
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T02U_skin_caja` BEFORE UPDATE ON `skin_caja` FOR EACH ROW BEGIN
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `dni` int DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `telefono` int DEFAULT NULL,
  `contraseña` varchar(100) NOT NULL,
  `id_direccion` int NOT NULL,
  `UsuCrea` varchar(255) DEFAULT NULL,
  `FecCrea` datetime DEFAULT NULL,
  `UsuModif` varchar(255) DEFAULT NULL,
  `FecModif` datetime DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo_UNIQUE` (`correo`) /*!80000 INVISIBLE */,
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `dni_UNIQUE` (`dni`),
  UNIQUE KEY `telefono_UNIQUE` (`telefono`),
  KEY `fk_usuario_direccion_idx` (`id_direccion`),
  CONSTRAINT `fk_usuario_direccion` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (2,NULL,NULL,NULL,'alexdsa131@gmail.com','alexdsa131',NULL,'123',2,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,'XD@gmail.com','prueba',NULL,'prueba',3,NULL,NULL,NULL,NULL),(4,NULL,NULL,NULL,'alex@gmail.com','alex',NULL,'123',5,NULL,NULL,NULL,NULL),(9,NULL,NULL,NULL,'cristian123@gmail.com','tusobrinito12',NULL,'123',10,NULL,NULL,NULL,NULL),(10,NULL,NULL,NULL,'3123@dasdas.com','231231231',NULL,'123',11,NULL,NULL,NULL,NULL),(11,NULL,NULL,NULL,'ada@gmail.com','adas',NULL,'123',12,NULL,NULL,NULL,NULL),(12,NULL,NULL,NULL,'123@gmail.com','123',NULL,'123',13,NULL,NULL,NULL,NULL),(13,NULL,NULL,NULL,'adsda@gmail.com','asda',NULL,'123',14,NULL,NULL,NULL,NULL),(14,NULL,NULL,NULL,'ads@gmail.com','13123',NULL,'123',15,NULL,NULL,NULL,NULL),(16,NULL,NULL,NULL,'albert123@gmail.com','albert123',NULL,'123',17,'root@localhost','2023-12-03 13:08:50','root@localhost','2023-12-03 13:08:50');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T01I_usuario` BEFORE INSERT ON `usuario` FOR EACH ROW BEGIN
  SET new.UsuCrea = USER();
  SET new.FecCrea = NOW();
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `T02U_usuario` BEFORE UPDATE ON `usuario` FOR EACH ROW BEGIN
  SET new.UsuModif = USER();
  SET new.FecModif = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'mbpe'
--

--
-- Dumping routines for database 'mbpe'
--
/*!50003 DROP PROCEDURE IF EXISTS `CrearUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CrearUsuario`(IN correo VARCHAR(45), IN username VARCHAR(45), IN contraseña VARCHAR(100))
BEGIN
INSERT INTO direccion(departamento,distrito,direccion,referencias)
values('', '', '', '');
set @nuevo_id_direccion= LAST_INSERT_ID();
INSERT INTO usuario(correo, username, contraseña, id_direccion)
values(correo, username, contraseña, @nuevo_id_direccion); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VerificarContraseña` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VerificarContraseña`(IN usernameA VARCHAR(45), IN contraseña_ingresada VARCHAR(100), OUT resultado INT)
BEGIN
  DECLARE contraseña_bd VARBINARY(100);
  -- Obtener la contraseña almacenada en la base de datos para el usuario dado
  SELECT contraseña INTO contraseña_bd FROM usuario WHERE username = usernameA;

  -- Verificar si la contraseña ingresada coincide con la contraseña almacenada
  IF contraseña_bd IS NULL THEN
    -- El usuario no existe
    SET resultado = -1;
  ELSEIF contraseña_bd = AES_ENCRYPT(contraseña_ingresada, 'clave') THEN
    -- La contraseña es correcta
    SET resultado = 1;
  ELSE
    -- La contraseña es incorrecta
    SET resultado = 0;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `plantillas`
--

/*!50001 DROP VIEW IF EXISTS `plantillas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `plantillas` AS select `bp`.`id_plantilla` AS `id_plantilla`,`bp`.`nombre_plantilla` AS `nombre_plantilla`,`bp`.`precio` AS `precio`,`cat`.`nombre_categoria` AS `nombre_categoria`,`cap`.`capacidad` AS `capacidad` from ((`box_plantilla` `bp` join `categoria` `cat` on((`bp`.`id_categoria` = `cat`.`id_categoria`))) join `capacidad` `cap` on((`bp`.`id_capacidad` = `cap`.`id_capacidad`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-03 13:21:20
