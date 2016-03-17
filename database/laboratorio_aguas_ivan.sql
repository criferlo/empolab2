-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: laboratorio_aguas_ivan
-- ------------------------------------------------------
-- Server version	5.6.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `nombre_representante_legal` varchar(300) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `activo` int(11) DEFAULT NULL,
  `tipomunicipio_id` int(11) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `tipocliente_id` int(11) NOT NULL,
  `nit` varchar(20) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `celular` varchar(10) NOT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipocliente_tipomunicipio1_idx` (`tipomunicipio_id`),
  KEY `tipocliente_id_idx` (`tipocliente_id`),
  CONSTRAINT `fk_tipocliente_tipomunicipio1` FOREIGN KEY (`tipomunicipio_id`) REFERENCES `tipomunicipio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipocliente` FOREIGN KEY (`tipocliente_id`) REFERENCES `tipocliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (17,'EMPOPASTO','OSCAR Z',1,714,'PASTO',1,'900','999','999','hola@empopasto.com'),(18,'ALCALDIA DE CHACHAGUI','OSCAR Z',1,714,'CHACHAGUI',2,'12344','999','999','hola@alcaldia.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constantetipoensayo`
--

DROP TABLE IF EXISTS `constantetipoensayo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `constantetipoensayo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipoensayo_id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `valor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_constantetipoensayo_1` (`tipoensayo_id`),
  CONSTRAINT `FK_constantetipoensayo_1` FOREIGN KEY (`tipoensayo_id`) REFERENCES `tipoensayo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constantetipoensayo`
--

LOCK TABLES `constantetipoensayo` WRITE;
/*!40000 ALTER TABLE `constantetipoensayo` DISABLE KEYS */;
INSERT INTO `constantetipoensayo` VALUES (1,2,'TAMAÑO','50'),(2,2,'NORMALIDAD NaOH','0.02'),(3,2,'PESO Eq - g CaCO3','50.04'),(4,2,'FACTOR DE CONVERSION (g - mg)','1000'),(5,46,'VOLUMEN MUESTRA (mL)','120'),(6,46,'NORMALIDAD H2SO4','0.02'),(7,46,'FACTOR DE CONVERSIÃƒâ€œN (eqCaCO3/L - gCaCO3/L)','50.04'),(8,46,'FACTOR DE CONVERSIÃƒâ€œN (g - mg)','1000'),(9,3,'VOLUMEN MUESTRA (mL)','50'),(10,3,'NORMALIDAD H2SO4','0.02'),(11,3,'PESO Eq - g CaCO3','50.04'),(12,3,'FACTOR DE CONVERSIÃƒâ€œN (g - mg)','1000'),(13,22,'VOLUMEN MUESTRA TITULADO (mL)','50'),(14,22,'MOLARIDAD EDTA','0.01'),(15,22,'PESO MOLECULAR CaCO3 (g/mol)','100.08'),(16,22,'FACTOR DE CONVERSIÃƒâ€œN \n(g - mg)','1000'),(17,20,'VOLUMEN MUESTRA TITULADO  (mL)','50'),(18,20,'MOLARIDAD EDTA','0.01'),(19,20,'PESO MOLECULAR CaCO3 (g/mol)','100.08'),(20,20,'FACTOR DE CONVERSIÃƒâ€œN \n(g - mg) ','1000'),(21,8,'VOLUMEN MUESTRA (mL)','50'),(22,8,'VOLUMEN AgNO3  GASTADO BLANCO (mL)','0.43'),(23,8,'NORMALIDAD AgNO3','0.0141'),(24,8,'PESO Eq - g Cl','35.453'),(25,8,'FACTOR DE CONVERSIÃƒâ€œN (g - mg) ','1000'),(26,50,'COLIFORMES TOTALES Microorganismos /100cmÃ‚Â³','<1'),(27,50,'E- COLI\nMicroorganismos /100cmÃ‚Â³','<1'),(28,49,'CALCIO_C1','40.08'),(29,49,'CALCIO_C2','100.08'),(30,49,'MAGNESIO_C1','24.312'),(31,49,'MAGNESIO_C2','100.08');
/*!40000 ALTER TABLE `constantetipoensayo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresatomadormuestra`
--

DROP TABLE IF EXISTS `empresatomadormuestra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresatomadormuestra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresatomadormuestra`
--

LOCK TABLES `empresatomadormuestra` WRITE;
/*!40000 ALTER TABLE `empresatomadormuestra` DISABLE KEYS */;
INSERT INTO `empresatomadormuestra` VALUES (1,'LABORATORIO EMPOPASTO S.A E.S.P'),(2,'CLIENTE EXTERNO');
/*!40000 ALTER TABLE `empresatomadormuestra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formato`
--

DROP TABLE IF EXISTS `formato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fechaemision` date DEFAULT NULL,
  `tipocliente_id` int(11) NOT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  `empresatomadormuestra_id` int(11) NOT NULL,
  `lugartomamuestra` varchar(255) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `codigoinformesecuencial` int(11) DEFAULT NULL,
  `codigoinformeano` int(11) DEFAULT NULL,
  `codigoinformeleyenda` varchar(45) DEFAULT NULL,
  `estado` varchar(1) NOT NULL DEFAULT '0',
  `usuario_id_1` int(11) DEFAULT NULL,
  `usuario_id_2` int(11) DEFAULT NULL,
  `tomadorexterno` varchar(200) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `cerrado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_formato_empresatomadormuestra1_idx` (`empresatomadormuestra_id`),
  KEY `fk_formato_cliente1_idx` (`cliente_id`),
  KEY `fk_formato_tipocliente1_idx` (`tipocliente_id`),
  KEY `fk_formato_lugartomamuestra1_idx` (`lugartomamuestra`) USING BTREE,
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `fk_formato_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_formato_empresatomadormuestra1` FOREIGN KEY (`empresatomadormuestra_id`) REFERENCES `empresatomadormuestra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_formato_tipocliente1` FOREIGN KEY (`tipocliente_id`) REFERENCES `tipocliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `formato_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formato`
--

LOCK TABLES `formato` WRITE;
/*!40000 ALTER TABLE `formato` DISABLE KEYS */;
INSERT INTO `formato` VALUES (137,'2016-05-02',1,NULL,1,'ALTOS DE LA COLINA',17,1,2016,'LAT','1',NULL,NULL,NULL,1,'N'),(138,'1969-12-31',2,NULL,2,'CHACHAGUI',18,2,2016,'LAT','1',NULL,NULL,'alguien',NULL,'S'),(139,'1969-12-31',2,NULL,1,'CHACHAGUI',18,3,2016,'LAT','1',NULL,NULL,NULL,21,'S'),(140,'1969-12-31',1,NULL,1,'CASTILLOS DEL NORTE',17,4,2016,'LAT','0',NULL,NULL,NULL,21,NULL),(141,'2016-04-02',2,NULL,2,'CHACHAGUI',18,5,2016,'LAT','0',NULL,NULL,'alguien',NULL,NULL),(142,'2016-05-02',2,NULL,2,'CHACHAGUI',18,6,2016,'LAT','0',NULL,NULL,NULL,NULL,NULL),(143,'2016-05-02',2,NULL,2,'CHACHAGUI',18,7,2016,'LAT','1',NULL,NULL,'dfgfd',NULL,NULL),(144,'2016-05-02',1,NULL,1,'ESTACION DE BOMBEROS',17,8,2016,'LAT','1',NULL,NULL,NULL,21,NULL),(145,'2016-05-02',1,NULL,1,'CASTILLOS DEL NORTE',17,9,2016,'LAT','1',NULL,NULL,NULL,1,NULL),(146,'1969-12-31',2,NULL,2,'CHACHAGUI',18,10,2016,'LAT','1',NULL,NULL,'alguien',NULL,'S');
/*!40000 ALTER TABLE `formato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `irca`
--

DROP TABLE IF EXISTS `irca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `irca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipoensayo_id` int(10) unsigned NOT NULL,
  `unidades` varchar(45) NOT NULL,
  `limiteinferior` decimal(10,4) NOT NULL,
  `limitesuperior` decimal(10,4) NOT NULL,
  `puntajeriesgo` decimal(10,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `irca`
--

LOCK TABLES `irca` WRITE;
/*!40000 ALTER TABLE `irca` DISABLE KEYS */;
INSERT INTO `irca` VALUES (1,10,'UPC',0.0000,15.0000,6.0000),(2,36,'UNIDADES DE pH ',6.5000,9.0000,1.5000),(3,12,'uS/cm',0.0000,1000.0000,0.0000),(4,45,'NTU',0.0000,2.0000,15.0000),(5,8,'mgCl-/L',0.0000,250.0000,1.0000),(6,7,'mgCl2/L',0.3000,2.0000,15.0000),(7,22,'mg CaCO3/L',0.0000,300.0000,1.0000),(8,20,'mg CaCO3/L',0.0000,0.0000,0.0000),(9,21,'mg CaCO3/L',0.0000,0.0000,0.0000),(10,3,'mg CaCO3/L',0.0000,200.0000,1.0000),(11,4,'mgAl+3/L',0.0000,0.2000,3.0000),(12,5,'mg Ca/L',0.0000,60.0000,1.0000),(13,29,'mg Mg/L',0.0000,36.0000,1.0000),(14,28,'mgFe/L',0.0000,0.3000,1.5000),(15,32,'mgNO2/L',0.0000,0.1000,3.0000),(16,31,'mgNO3/L',0.0000,10.0000,1.0000),(17,44,'mgSO4/L',0.0000,250.0000,1.0000),(18,9,'UFC/100mL',0.0000,0.0000,15.0000),(19,23,'UFC/100mL',0.0000,0.0000,25.0000);
/*!40000 ALTER TABLE `irca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lugartomamuestra`
--

DROP TABLE IF EXISTS `lugartomamuestra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lugartomamuestra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  `tipomunicipio_id` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lugartomamuestra_tipomunicipio1_idx` (`tipomunicipio_id`),
  CONSTRAINT `fk_lugartomamuestra_tipomunicipio1` FOREIGN KEY (`tipomunicipio_id`) REFERENCES `tipomunicipio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugartomamuestra`
--

LOCK TABLES `lugartomamuestra` WRITE;
/*!40000 ALTER TABLE `lugartomamuestra` DISABLE KEYS */;
INSERT INTO `lugartomamuestra` VALUES (10,'ALTAMIRA MZ 7 C 9',1,714,'9501'),(11,'ALTOS DE CHAPALITO',1,714,'9491'),(12,'ALTOS DE LA COLINA',1,714,'9497'),(13,'BACHUE CRA 22A CALLE 1',1,714,'9494'),(14,'CAI BOMBONA',1,714,'9475'),(15,'CAI CHAMBU',1,714,'9465'),(16,'CAI EL DORADO',1,714,'9481'),(17,'CAI EL POTRERILLO',1,714,'9477'),(18,'CAI OBRERO',1,714,'9467'),(19,'CAI SAN AGUSTIN',1,714,'9476'),(20,'CAI SANTA MONICA',1,714,'9462'),(21,'CAI TAMASAGRA',1,714,'9495'),(22,'CASTILLOS DEL NORTE',1,714,'9461'),(23,'COSITAS RICAS MORASURCO',1,714,'9485'),(24,'EL ALJIBE',1,714,'9479'),(25,'EL EDEN CALLE 4 A ESTE CRA 28',1,714,'9497'),(26,'EL TEJAR',1,714,'9466'),(27,'ESTACION DE BOMBEROS',1,714,'9471'),(28,'GUALCALOMA MZ P C 28',1,714,'9502'),(29,'HOSPITAL CIVIL',1,714,'9463'),(30,'IGLESIA DE JESUCRISTO AV. SANTANDER',1,714,'9472'),(31,'LAS MARGARITAS',1,714,'9473'),(32,'LAS VIOLETAS',1,714,'9474'),(33,'LOS CRISTALES',1,714,'9492'),(34,'LOS ROSALES MZ C C 1',1,714,'9500'),(35,'MARIA PAZ MZ C C 12',1,714,'9486'),(36,'MARILUZ III',1,714,'9468'),(37,'MORASURCO CALLE 21A  No. 41 -102',1,714,'9480'),(38,'NIZA MZ A C 1',1,714,'9469'),(39,'PARQUE INFANTIL CRA 31',1,714,'9483'),(40,'PARQUEADERO COMFAMILIAR',1,714,'9478'),(41,'PISCINA SEMIOLIMPICA ARANDA',1,714,'9487'),(42,'POSTOBON TOROBAJO',1,714,'9483'),(43,'PUCALPA II',1,714,'9470'),(44,'PUESTO DE SALUD SAN VICENTE',1,714,'9490'),(45,'SALIDA PLANTA MIJITAYO',1,714,'9498'),(46,'SOL DE ORIENTE MZK C 7',1,714,'9488'),(47,'SUBESTACION CEDENAR SAN CARLOS',1,714,'9493'),(48,'SUBIDA HOSPITAL SAN PEDRO',1,714,'9464'),(49,'SUMATAMBO 2000',1,714,'9489'),(50,'TERRAZAS DE BRICEÑO',1,714,'9482'),(51,'VILLA DE LOS RIOS  MZ H C 1',1,714,'9499'),(52,'BOCATOMA PLANTA MIJITAYO',1,714,'9999'),(53,'BOCATOMA PLANTA SAN FELIPE',1,714,'9999'),(54,'RIO BOBO',1,714,'9999'),(55,'QUEBRADA CHAPAL',1,714,'9999'),(56,'QUEBRADA LOPE',1,714,'9999'),(57,'QUEBRADA BUESAQUILLO',1,714,'9999'),(58,'QUEBRADA CHAPAL-PUNTO DE VERTIMIENTO PLANTA DE GUADALUPE',1,714,'9999'),(59,'BOCATOMA CENTENARIO',1,714,'9999'),(60,'ANTES BOX COULVERT HOSPITAL DEPARTAMENTAL-',1,714,'9999'),(61,'EN BOX COULVERT HOSPITAL DEPARTAMENTAL',1,714,'9999'),(62,'DESPUÉS BOX COULVERT HOSPITAL DEPARTAMENTAL',1,714,'9999'),(63,'ANTES BOX COULVERT COLEGIO PEDAGÓGICO',1,714,'9999'),(64,'EN BOX COULVERT COLEGIO PEDAGÓGICO',1,714,'9999'),(65,'DESPUÉS BOX COULVERT COLEGIO PEDAGÓGICO',1,714,'9999'),(66,'ANTES BOX COULVERT HOSPITAL INFANTIL',1,714,'9999'),(67,'EN BOX COULVERT HOSPITAL INFANTIL',1,714,'9999'),(68,'DESPUÉS BOX COULVERT HOSPITAL INFANTIL',1,714,'9999'),(69,'ANTES COLECTOR CIRCULAR JUAN XXIII',1,714,'9999'),(70,'EN COLECTOR CIRCULAR JUAN XXIII',1,714,'9999'),(71,'ANTES COLECTOR CIRCULAR CLUB TENNIS',1,714,'9999'),(72,'EN COLECTOR CIRCULAR CLUB TENNIS',1,714,'9999'),(73,'DESPUÉS COLECTOR CIRCULAR CLUB TENNIS',1,714,'9999'),(74,'UNIVERSIDAD DE NARIÑO',1,714,'9999'),(75,'ANTES BOX COULVERT HOSPITAL DEPARTAMENTAL',1,714,'9999'),(76,'EN BOX COULVERT HOSPITAL DEPARTAMENTAL',1,714,'9999'),(77,'BOX COULVERT COLEGIO PEDAGÒGICO',1,714,'9999'),(78,'BOX COULVERT HOSPITAL INFANTIL',1,714,'9999'),(79,'ANTES COLECTOR CIRCULAR JUAN XXIII',1,714,'9999'),(80,'COLECTOR CIRCULAR JUAN XXIII',1,714,'9999'),(81,'COLECTOR CIRCULAR CLUB TENNIS',1,714,'9999'),(82,'PARSHALL CENTENARIO',1,714,'9999'),(83,'PARSHALL SAN FELIPE',1,714,'9999'),(84,'PARSHALL MIJITAYO',1,714,'9999');
/*!40000 ALTER TABLE `lugartomamuestra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo`
--

DROP TABLE IF EXISTS `metodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metodo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo`
--

LOCK TABLES `metodo` WRITE;
/*!40000 ALTER TABLE `metodo` DISABLE KEYS */;
INSERT INTO `metodo` VALUES (1,'SM 5520D',1),(2,'SM 2310 B',1),(3,'SM 2320B (Indicador)',1),(4,'Fotometrico',1),(5,'3500 -Ca B',1),(6,'SM 4500-Cl G',1),(7,'SM 4500- Cl B',1),(8,'SM 9223 B',1),(9,'SM 2120 C',1),(10,'SM 2510 B',1),(11,'EPA 1623',1),(12,'SM 3500-Mg B',1),(13,'SM 2340 C',1),(14,'S.M. 4500-F- C',1),(15,'SM 4500-P - B Ã¢â‚¬â€œ E',1),(16,'3500 -Mg B',1),(17,'SM 3500-Cr B',1),(18,'SM 5210B, 4500-0 G',1),(19,'SM 2540 C',1),(20,'SM 2340 C',1),(21,'SM 2540 F',1),(22,'SM 2540 D',1),(23,'SM 5220 D',1),(24,'SM 5540C',1),(25,'SM 3500-Ca B',1),(26,'SM 2540 E',1),(27,'SM 2540 B',1),(28,'SM 2130 B',1),(29,'SM 9215 D',1),(30,'SM 4500-NORG C, 4500- NH3 B Ã¢â‚¬â€œ C JUNTO',1),(31,'SM 4500- H+B',1),(32,'S.M. 4500-F-Ã‚Â C',1),(33,'SM 4500-P - B - E',1),(34,'SM 4500-NORG C, 4500-NH3 B - C',1),(35,'SM 4500-0 G',1);
/*!40000 ALTER TABLE `metodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombremodulo` varchar(200) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (1,'Administracion',1),(2,'Laboratorio',1),(3,'Sesion',1),(4,'Invitado',1);
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muestra`
--

DROP TABLE IF EXISTS `muestra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muestra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tomamuestra_fecha` date DEFAULT NULL,
  `tomamuestra_hora` time DEFAULT NULL,
  `recepcionmuestra_fecha` date DEFAULT NULL,
  `recepcionmuestra_hora` time DEFAULT NULL,
  `tipomatrizanalizada_id` int(11) NOT NULL,
  `tipomuestra_id` int(11) NOT NULL,
  `codigomuestra` varchar(45) DEFAULT NULL,
  `lugartomamuestra_id` int(11) NOT NULL,
  `formato_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestra_tipomatrizanalizada1_idx` (`tipomatrizanalizada_id`),
  KEY `fk_muestra_tipomuestra1_idx` (`tipomuestra_id`),
  KEY `fk_muestra_lugartomamuestra1_idx` (`lugartomamuestra_id`),
  KEY `fk_muestra_formato1_idx` (`formato_id`),
  CONSTRAINT `fk_muestra_formato1` FOREIGN KEY (`formato_id`) REFERENCES `formato` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_muestra_lugartomamuestra1` FOREIGN KEY (`lugartomamuestra_id`) REFERENCES `lugartomamuestra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_muestra_tipomatrizanalizada1` FOREIGN KEY (`tipomatrizanalizada_id`) REFERENCES `tipomatrizanalizada` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_muestra_tipomuestra1` FOREIGN KEY (`tipomuestra_id`) REFERENCES `tipomuestra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=506 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muestra`
--

LOCK TABLES `muestra` WRITE;
/*!40000 ALTER TABLE `muestra` DISABLE KEYS */;
INSERT INTO `muestra` VALUES (468,'2016-03-02','00:00:00','2016-03-02','00:00:00',1,1,'16F3T1',10,137),(469,'2016-03-02','00:00:00','2016-03-02','00:00:00',1,1,'16F3T2',10,137),(470,'2016-03-02','00:00:00','2016-03-02','00:00:00',1,1,'16F3T3',10,137),(471,'2016-03-02','00:00:00','2016-03-02','00:00:00',1,1,'16F3T4',10,137),(472,'2016-03-02','00:00:00','2016-03-02','00:00:00',1,1,'16F3T5',10,137),(473,'2016-03-02','00:00:00','2016-03-02','00:00:00',1,1,'16F3T6',10,137),(474,'2016-03-02','00:00:00','2016-03-02','00:00:00',1,1,'16F3T7',10,137),(475,'2016-03-02','00:00:00','2016-03-02','00:00:00',1,1,'16F3T8',10,137),(476,'2016-03-02','00:00:00','2016-03-02','00:00:00',2,1,'16F3C1',10,137),(477,'2016-03-02','00:00:00','2016-03-02','00:00:00',2,1,'16F3C2',10,137),(478,'2016-03-02','00:00:00','2016-03-02','00:00:00',2,1,'16F3C3',10,137),(479,'2016-07-05','00:00:00',NULL,'00:00:00',2,1,'16My7C1',10,138),(480,NULL,'00:00:00',NULL,'00:00:00',2,1,NULL,10,139),(481,'2016-02-02','00:00:00','1969-12-31','17:16:00',2,1,'16F24C1',10,143),(482,'2016-05-02','00:00:00','2016-05-02','00:00:00',1,1,'16F5T1',10,144),(483,'2016-05-02','00:00:00','2016-05-02','00:00:00',1,1,'16F5T2',10,144),(484,'2016-05-02','00:00:00','2016-05-02','00:00:00',1,1,'16F5T3',10,144),(485,'2016-05-02','00:00:00','2016-05-02','00:00:00',1,1,'16F5T4',10,144),(486,'2016-05-02','00:00:00','2016-05-02','00:00:00',1,1,'16F5T5',10,144),(487,'2016-05-02','00:00:00','2016-05-02','00:00:00',1,1,'16F5T6',10,144),(488,'2016-05-02','00:00:00','2016-05-02','00:00:00',1,1,'16F5T7',10,144),(489,'2016-05-02','00:00:00','2016-05-02','00:00:00',1,1,'16F5T8',10,144),(490,'2016-05-02','00:00:00','2016-05-02','00:00:00',2,1,'16F5C1',10,144),(491,'2016-05-02','00:00:00','2016-05-02','00:00:00',2,1,'16F5C2',10,144),(492,'2016-05-02','00:00:00','2016-05-02','00:00:00',2,1,'16F5C3',10,144),(493,'2016-11-02','00:00:00','2016-11-02','00:00:00',1,1,'16F11T1',10,145),(494,'2016-11-02','00:00:00','2016-11-02','00:00:00',1,1,'16F11T2',10,145),(495,'2016-11-02','00:00:00','2016-11-02','00:00:00',1,1,'16F11T3',10,145),(496,'2016-11-02','00:00:00','2016-11-02','00:00:00',1,1,'16F11T4',10,145),(497,'2016-11-02','00:00:00','2016-11-02','00:00:00',1,1,'16F11T5',10,145),(498,'2016-11-02','00:00:00','2016-11-02','00:00:00',1,1,'16F11T6',10,145),(499,'2016-11-02','00:00:00','2016-11-02','00:00:00',1,1,'16F11T7',10,145),(500,'2016-11-02','00:00:00','2016-11-02','00:00:00',1,1,'16F11T8',10,145),(501,'2016-11-02','00:00:00','2016-11-02','00:00:00',2,1,'16F11C1',10,145),(502,'2016-11-02','00:00:00','2016-11-02','00:00:00',2,1,'16F11C2',10,145),(503,'2016-11-02','00:00:00','2016-11-02','00:00:00',2,1,'16F11C3',10,145),(504,'2016-10-02','00:00:00','1969-12-31','00:00:00',2,1,'16F16C1',10,146),(505,'2016-10-02','00:00:00','1969-12-31','00:00:00',3,1,'16F16C1',10,146);
/*!40000 ALTER TABLE `muestra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muestramemoriacalculo`
--

DROP TABLE IF EXISTS `muestramemoriacalculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muestramemoriacalculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `muestra_id` int(11) NOT NULL,
  `valor1` decimal(10,4) DEFAULT NULL,
  `valor2` decimal(10,4) DEFAULT NULL,
  `valor3` decimal(10,4) DEFAULT NULL,
  `valor4` decimal(10,4) DEFAULT NULL,
  `valor5` decimal(10,4) DEFAULT NULL,
  `resultado` decimal(10,4) DEFAULT NULL,
  `tipoensayo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_muestramemoriacalculo_1` (`muestra_id`),
  KEY `FK_muestramemoriacalculo_2` (`tipoensayo_id`),
  CONSTRAINT `FK_muestramemoriacalculo_1` FOREIGN KEY (`muestra_id`) REFERENCES `muestra` (`id`),
  CONSTRAINT `FK_muestramemoriacalculo_2` FOREIGN KEY (`tipoensayo_id`) REFERENCES `tipoensayo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14815 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muestramemoriacalculo`
--

LOCK TABLES `muestramemoriacalculo` WRITE;
/*!40000 ALTER TABLE `muestramemoriacalculo` DISABLE KEYS */;
INSERT INTO `muestramemoriacalculo` VALUES (14620,468,NULL,NULL,NULL,NULL,NULL,5.0000,1),(14621,468,5.0000,NULL,NULL,NULL,NULL,100.0800,2),(14622,468,5.0000,NULL,NULL,NULL,NULL,100.0800,3),(14623,468,5.0000,5.0000,5.0000,5.0000,NULL,50.0400,46),(14624,468,5.0000,NULL,NULL,NULL,NULL,45.6897,8),(14625,468,5.0000,NULL,NULL,NULL,NULL,100.0800,20),(14626,468,5.0000,NULL,NULL,NULL,NULL,100.0800,22),(14627,468,NULL,NULL,NULL,NULL,NULL,0.0000,9),(14628,468,NULL,NULL,NULL,NULL,NULL,0.0000,23),(14629,468,NULL,NULL,NULL,NULL,NULL,5.0000,30),(14630,468,NULL,NULL,NULL,NULL,NULL,40.0800,5),(14631,468,NULL,NULL,NULL,NULL,NULL,0.0000,21),(14632,468,NULL,NULL,NULL,NULL,NULL,0.0000,29),(14633,469,NULL,NULL,NULL,NULL,NULL,5.0000,1),(14634,469,5.0000,NULL,NULL,NULL,NULL,100.0800,2),(14635,469,5.0000,NULL,NULL,NULL,NULL,100.0800,3),(14636,469,5.0000,5.0000,5.0000,5.0000,NULL,50.0400,46),(14637,469,5.0000,NULL,NULL,NULL,NULL,45.6897,8),(14638,469,5.0000,NULL,NULL,NULL,NULL,100.0800,20),(14639,469,5.0000,NULL,NULL,NULL,NULL,100.0800,22),(14640,469,NULL,NULL,NULL,NULL,NULL,0.0000,9),(14641,469,NULL,NULL,NULL,NULL,NULL,0.0000,23),(14642,469,NULL,NULL,NULL,NULL,NULL,5.0000,30),(14643,469,NULL,NULL,NULL,NULL,NULL,40.0800,5),(14644,469,NULL,NULL,NULL,NULL,NULL,0.0000,21),(14645,469,NULL,NULL,NULL,NULL,NULL,0.0000,29),(14646,470,NULL,NULL,NULL,NULL,NULL,5.0000,1),(14647,470,5.0000,NULL,NULL,NULL,NULL,100.0800,2),(14648,470,5.0000,NULL,NULL,NULL,NULL,100.0800,3),(14649,470,5.0000,5.0000,5.0000,5.0000,NULL,50.0400,46),(14650,470,5.0000,NULL,NULL,NULL,NULL,45.6897,8),(14651,470,5.0000,NULL,NULL,NULL,NULL,100.0800,20),(14652,470,5.0000,NULL,NULL,NULL,NULL,100.0800,22),(14653,470,NULL,NULL,NULL,NULL,NULL,0.0000,9),(14654,470,NULL,NULL,NULL,NULL,NULL,0.0000,23),(14655,470,NULL,NULL,NULL,NULL,NULL,5.0000,30),(14656,470,NULL,NULL,NULL,NULL,NULL,40.0800,5),(14657,470,NULL,NULL,NULL,NULL,NULL,0.0000,21),(14658,470,NULL,NULL,NULL,NULL,NULL,0.0000,29),(14659,471,NULL,NULL,NULL,NULL,NULL,5.0000,1),(14660,471,5.0000,NULL,NULL,NULL,NULL,100.0800,2),(14661,471,5.0000,NULL,NULL,NULL,NULL,100.0800,3),(14662,471,5.0000,5.0000,5.0000,5.0000,NULL,50.0400,46),(14663,471,5.0000,NULL,NULL,NULL,NULL,45.6897,8),(14664,471,5.0000,NULL,NULL,NULL,NULL,100.0800,20),(14665,471,5.0000,NULL,NULL,NULL,NULL,100.0800,22),(14666,471,NULL,NULL,NULL,NULL,NULL,0.0000,9),(14667,471,NULL,NULL,NULL,NULL,NULL,0.0000,23),(14668,471,NULL,NULL,NULL,NULL,NULL,5.0000,30),(14669,471,NULL,NULL,NULL,NULL,NULL,40.0800,5),(14670,471,NULL,NULL,NULL,NULL,NULL,0.0000,21),(14671,471,NULL,NULL,NULL,NULL,NULL,0.0000,29),(14672,472,NULL,NULL,NULL,NULL,NULL,5.0000,1),(14673,472,5.0000,NULL,NULL,NULL,NULL,100.0800,2),(14674,472,5.0000,NULL,NULL,NULL,NULL,100.0800,3),(14675,472,5.0000,5.0000,5.0000,5.0000,NULL,50.0400,46),(14676,472,5.0000,NULL,NULL,NULL,NULL,45.6897,8),(14677,472,5.0000,NULL,NULL,NULL,NULL,100.0800,20),(14678,472,5.0000,NULL,NULL,NULL,NULL,100.0800,22),(14679,472,NULL,NULL,NULL,NULL,NULL,0.0000,9),(14680,472,NULL,NULL,NULL,NULL,NULL,0.0000,23),(14681,472,NULL,NULL,NULL,NULL,NULL,5.0000,30),(14682,472,NULL,NULL,NULL,NULL,NULL,40.0800,5),(14683,472,NULL,NULL,NULL,NULL,NULL,0.0000,21),(14684,472,NULL,NULL,NULL,NULL,NULL,0.0000,29),(14685,473,NULL,NULL,NULL,NULL,NULL,5.0000,1),(14686,473,5.0000,NULL,NULL,NULL,NULL,100.0800,2),(14687,473,5.0000,NULL,NULL,NULL,NULL,100.0800,3),(14688,473,5.0000,5.0000,5.0000,5.0000,NULL,50.0400,46),(14689,473,5.0000,NULL,NULL,NULL,NULL,45.6897,8),(14690,473,5.0000,NULL,NULL,NULL,NULL,100.0800,20),(14691,473,5.0000,NULL,NULL,NULL,NULL,100.0800,22),(14692,473,NULL,NULL,NULL,NULL,NULL,0.0000,9),(14693,473,NULL,NULL,NULL,NULL,NULL,0.0000,23),(14694,473,NULL,NULL,NULL,NULL,NULL,5.0000,30),(14695,473,NULL,NULL,NULL,NULL,NULL,40.0800,5),(14696,473,NULL,NULL,NULL,NULL,NULL,0.0000,21),(14697,473,NULL,NULL,NULL,NULL,NULL,0.0000,29),(14698,474,NULL,NULL,NULL,NULL,NULL,5.0000,1),(14699,474,5.0000,NULL,NULL,NULL,NULL,100.0800,2),(14700,474,5.0000,NULL,NULL,NULL,NULL,100.0800,3),(14701,474,5.0000,5.0000,5.0000,5.0000,NULL,50.0400,46),(14702,474,5.0000,NULL,NULL,NULL,NULL,45.6897,8),(14703,474,5.0000,NULL,NULL,NULL,NULL,100.0800,20),(14704,474,5.0000,NULL,NULL,NULL,NULL,100.0800,22),(14705,474,NULL,NULL,NULL,NULL,NULL,0.0000,9),(14706,474,NULL,NULL,NULL,NULL,NULL,0.0000,23),(14707,474,NULL,NULL,NULL,NULL,NULL,5.0000,30),(14708,474,NULL,NULL,NULL,NULL,NULL,40.0800,5),(14709,474,NULL,NULL,NULL,NULL,NULL,0.0000,21),(14710,474,NULL,NULL,NULL,NULL,NULL,0.0000,29),(14711,475,NULL,NULL,NULL,NULL,NULL,5.0000,1),(14712,475,5.0000,NULL,NULL,NULL,NULL,100.0800,2),(14713,475,5.0000,NULL,NULL,NULL,NULL,100.0800,3),(14714,475,5.0000,5.0000,5.0000,5.0000,NULL,50.0400,46),(14715,475,5.0000,NULL,NULL,NULL,NULL,45.6897,8),(14716,475,5.0000,NULL,NULL,NULL,NULL,100.0800,20),(14717,475,5.0000,NULL,NULL,NULL,NULL,100.0800,22),(14718,475,NULL,NULL,NULL,NULL,NULL,0.0000,9),(14719,475,NULL,NULL,NULL,NULL,NULL,0.0000,23),(14720,475,NULL,NULL,NULL,NULL,NULL,5.0000,30),(14721,475,NULL,NULL,NULL,NULL,NULL,40.0800,5),(14722,475,NULL,NULL,NULL,NULL,NULL,0.0000,21),(14723,475,NULL,NULL,NULL,NULL,NULL,0.0000,29),(14724,476,NULL,NULL,NULL,NULL,NULL,5.0000,1),(14725,476,5.0000,NULL,NULL,NULL,NULL,100.0800,2),(14726,476,5.0000,NULL,NULL,NULL,NULL,100.0800,3),(14727,476,5.0000,5.0000,5.0000,5.0000,NULL,50.0400,46),(14728,476,5.0000,NULL,NULL,NULL,NULL,45.6897,8),(14729,476,5.0000,NULL,NULL,NULL,NULL,100.0800,20),(14730,476,5.0000,NULL,NULL,NULL,NULL,100.0800,22),(14731,476,NULL,NULL,NULL,NULL,NULL,0.0000,9),(14732,476,NULL,NULL,NULL,NULL,NULL,0.0000,23),(14733,476,NULL,NULL,NULL,NULL,NULL,5.0000,30),(14734,476,NULL,NULL,NULL,NULL,NULL,40.0800,5),(14735,476,NULL,NULL,NULL,NULL,NULL,0.0000,21),(14736,476,NULL,NULL,NULL,NULL,NULL,0.0000,29),(14737,477,NULL,NULL,NULL,NULL,NULL,5.0000,1),(14738,477,5.0000,NULL,NULL,NULL,NULL,100.0800,2),(14739,477,5.0000,NULL,NULL,NULL,NULL,100.0800,3),(14740,477,5.0000,5.0000,5.0000,5.0000,NULL,50.0400,46),(14741,477,5.0000,NULL,NULL,NULL,NULL,45.6897,8),(14742,477,5.0000,NULL,NULL,NULL,NULL,100.0800,20),(14743,477,5.0000,NULL,NULL,NULL,NULL,100.0800,22),(14744,477,NULL,NULL,NULL,NULL,NULL,0.0000,9),(14745,477,NULL,NULL,NULL,NULL,NULL,0.0000,23),(14746,477,NULL,NULL,NULL,NULL,NULL,5.0000,30),(14747,477,NULL,NULL,NULL,NULL,NULL,40.0800,5),(14748,477,NULL,NULL,NULL,NULL,NULL,0.0000,21),(14749,477,NULL,NULL,NULL,NULL,NULL,0.0000,29),(14750,478,NULL,NULL,NULL,NULL,NULL,5.0000,1),(14751,478,5.0000,NULL,NULL,NULL,NULL,100.0800,2),(14752,478,5.0000,NULL,NULL,NULL,NULL,100.0800,3),(14753,478,5.0000,5.0000,5.0000,5.0000,NULL,50.0400,46),(14754,478,5.0000,NULL,NULL,NULL,NULL,45.6897,8),(14755,478,5.0000,NULL,NULL,NULL,NULL,100.0800,20),(14756,478,5.0000,NULL,NULL,NULL,NULL,100.0800,22),(14757,478,NULL,NULL,NULL,NULL,NULL,0.0000,9),(14758,478,NULL,NULL,NULL,NULL,NULL,0.0000,23),(14759,478,NULL,NULL,NULL,NULL,NULL,5.0000,30),(14760,478,NULL,NULL,NULL,NULL,NULL,40.0800,5),(14761,478,NULL,NULL,NULL,NULL,NULL,0.0000,21),(14762,478,NULL,NULL,NULL,NULL,NULL,0.0000,29),(14763,479,NULL,NULL,NULL,NULL,NULL,5.0000,1),(14764,479,5.0000,NULL,NULL,NULL,NULL,100.0800,2),(14765,479,5.0000,NULL,NULL,NULL,NULL,100.0800,3),(14766,479,5.0000,5.0000,5.0000,5.0000,NULL,50.0400,46),(14767,479,5.0000,NULL,NULL,NULL,NULL,45.6897,8),(14768,479,5.0000,NULL,NULL,NULL,NULL,100.0800,20),(14769,479,5.0000,NULL,NULL,NULL,NULL,100.0800,22),(14770,479,NULL,NULL,NULL,NULL,NULL,0.0000,9),(14771,479,NULL,NULL,NULL,NULL,NULL,0.0000,23),(14772,479,NULL,NULL,NULL,NULL,NULL,5.0000,30),(14773,479,NULL,NULL,NULL,NULL,NULL,40.0800,5),(14774,479,NULL,NULL,NULL,NULL,NULL,0.0000,21),(14775,479,NULL,NULL,NULL,NULL,NULL,0.0000,29),(14789,480,NULL,NULL,NULL,NULL,NULL,5.0000,1),(14790,480,5.0000,NULL,NULL,NULL,NULL,100.0800,2),(14791,480,5.0000,NULL,NULL,NULL,NULL,100.0800,3),(14792,480,5.0000,55.0000,5.0000,5.0000,NULL,50.0400,46),(14793,480,5.0000,NULL,NULL,NULL,NULL,45.6897,8),(14794,480,5.0000,NULL,NULL,NULL,NULL,100.0800,20),(14795,480,5.0000,NULL,NULL,NULL,NULL,100.0800,22),(14796,480,NULL,NULL,NULL,NULL,NULL,0.0000,9),(14797,480,NULL,NULL,NULL,NULL,NULL,0.0000,23),(14798,480,NULL,NULL,NULL,NULL,NULL,5.0000,30),(14799,480,NULL,NULL,NULL,NULL,NULL,40.0800,5),(14800,480,NULL,NULL,NULL,NULL,NULL,0.0000,21),(14801,480,NULL,NULL,NULL,NULL,NULL,0.0000,29),(14802,481,NULL,NULL,NULL,NULL,NULL,5.0000,1),(14803,481,5.0000,NULL,NULL,NULL,NULL,100.0800,2),(14804,481,5.0000,NULL,NULL,NULL,NULL,100.0800,3),(14805,481,5.0000,5.0000,5.0000,5.0000,NULL,50.0400,46),(14806,481,5.0000,NULL,NULL,NULL,NULL,45.6897,8),(14807,481,5.0000,NULL,NULL,NULL,NULL,100.0800,20),(14808,481,5.0000,NULL,NULL,NULL,NULL,100.0800,22),(14809,481,NULL,NULL,NULL,NULL,NULL,0.0000,9),(14810,481,NULL,NULL,NULL,NULL,NULL,0.0000,23),(14811,481,NULL,NULL,NULL,NULL,NULL,5.0000,30),(14812,481,NULL,NULL,NULL,NULL,NULL,40.0800,5),(14813,481,NULL,NULL,NULL,NULL,NULL,0.0000,21),(14814,481,NULL,NULL,NULL,NULL,NULL,0.0000,29);
/*!40000 ALTER TABLE `muestramemoriacalculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muestraparametro`
--

DROP TABLE IF EXISTS `muestraparametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muestraparametro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fechaanalisis` varchar(200) DEFAULT NULL,
  `muestra_id` int(11) NOT NULL,
  `parametromuestra_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestraparametro_muestra1_idx` (`muestra_id`),
  KEY `fk_muestraparametro_parametromuestra1_idx` (`parametromuestra_id`),
  CONSTRAINT `fk_muestraparametro_muestra1` FOREIGN KEY (`muestra_id`) REFERENCES `muestra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_muestraparametro_parametromuestra1` FOREIGN KEY (`parametromuestra_id`) REFERENCES `parametromuestra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muestraparametro`
--

LOCK TABLES `muestraparametro` WRITE;
/*!40000 ALTER TABLE `muestraparametro` DISABLE KEYS */;
/*!40000 ALTER TABLE `muestraparametro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcionmodulo`
--

DROP TABLE IF EXISTS `opcionmodulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcionmodulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombreopcion` varchar(200) DEFAULT NULL,
  `activo` varchar(45) DEFAULT NULL,
  `modulo_id` int(11) NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_opcionmodulo_modulo_idx` (`modulo_id`),
  CONSTRAINT `fk_opcionmodulo_modulo` FOREIGN KEY (`modulo_id`) REFERENCES `modulo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcionmodulo`
--

LOCK TABLES `opcionmodulo` WRITE;
/*!40000 ALTER TABLE `opcionmodulo` DISABLE KEYS */;
INSERT INTO `opcionmodulo` VALUES (1,'Gestion de usuarios','1',1,'usuario/index'),(3,'Gestion de variables','1',1,'variable/index'),(4,'Gestion de formatos','1',2,'home/seleccionarUsuario'),(5,'Gestion de analisis','1',2,'formato/lista'),(6,'Reportes','1',2,'formato/lista_reporte'),(7,'Perfil','1',3,'usuario/editar'),(8,'Cerrar sesion','1',3,'login/cerrar'),(9,'Gestion de clientes','1',1,'cliente/index'),(10,'Gestion irca','1',1,'irca/index'),(11,'Reportes invitado','1',4,'cliente/homeinvitado'),(12,'Promedio en Red','1',2,'formato/reporte_promedio'),(13,'SUI Red','1',2,'formato/reporte_sui');
/*!40000 ALTER TABLE `opcionmodulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametromuestra`
--

DROP TABLE IF EXISTS `parametromuestra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametromuestra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tecnicaanalitica_id` int(11) NOT NULL,
  `metodo_id` int(11) NOT NULL,
  `unidad_id` int(11) NOT NULL,
  `limitedeteccion` varchar(4) DEFAULT NULL,
  `resolucion2115` varchar(45) DEFAULT NULL,
  `decreto1594convencional` varchar(45) DEFAULT NULL,
  `decreto1594desinfeccion` varchar(45) DEFAULT NULL,
  `tipoensayo_id` int(11) NOT NULL,
  `valor` varchar(45) DEFAULT NULL,
  `fechaanalisis` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_parametromuestra_tecnicaanalitica1_idx` (`tecnicaanalitica_id`),
  KEY `fk_parametromuestra_metodo1_idx` (`metodo_id`),
  KEY `fk_parametromuestra_unidad1_idx` (`unidad_id`),
  KEY `fk_parametromuestra_tipoensayo1_idx` (`tipoensayo_id`),
  CONSTRAINT `fk_parametromuestra_metodo1` FOREIGN KEY (`metodo_id`) REFERENCES `metodo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_parametromuestra_tecnicaanalitica1` FOREIGN KEY (`tecnicaanalitica_id`) REFERENCES `tecnicaanalitica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_parametromuestra_tipoensayo1` FOREIGN KEY (`tipoensayo_id`) REFERENCES `tipoensayo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_parametromuestra_unidad1` FOREIGN KEY (`unidad_id`) REFERENCES `unidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametromuestra`
--

LOCK TABLES `parametromuestra` WRITE;
/*!40000 ALTER TABLE `parametromuestra` DISABLE KEYS */;
/*!40000 ALTER TABLE `parametromuestra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametrosistema`
--

DROP TABLE IF EXISTS `parametrosistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametrosistema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametrosistema`
--

LOCK TABLES `parametrosistema` WRITE;
/*!40000 ALTER TABLE `parametrosistema` DISABLE KEYS */;
/*!40000 ALTER TABLE `parametrosistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision`
--

DROP TABLE IF EXISTS `revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `observaciones` varchar(45) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `aprobado` int(11) DEFAULT NULL,
  `formato_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_revision_usuario1_idx` (`usuario_id`),
  KEY `fk_revision_formato1_idx` (`formato_id`),
  CONSTRAINT `fk_revision_formato1` FOREIGN KEY (`formato_id`) REFERENCES `formato` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_revision_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision`
--

LOCK TABLES `revision` WRITE;
/*!40000 ALTER TABLE `revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisionformato`
--

DROP TABLE IF EXISTS `revisionformato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisionformato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision` varchar(500) DEFAULT NULL,
  `formato_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `realizado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `formato_id` (`formato_id`),
  CONSTRAINT `revisionformato_ibfk_1` FOREIGN KEY (`formato_id`) REFERENCES `formato` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisionformato`
--

LOCK TABLES `revisionformato` WRITE;
/*!40000 ALTER TABLE `revisionformato` DISABLE KEYS */;
INSERT INTO `revisionformato` VALUES (16,'revision 1',137,1,'S'),(17,'revision 2',137,21,'N'),(18,'revision 3',137,21,'N');
/*!40000 ALTER TABLE `revisionformato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnicaanalitica`
--

DROP TABLE IF EXISTS `tecnicaanalitica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnicaanalitica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnicaanalitica`
--

LOCK TABLES `tecnicaanalitica` WRITE;
/*!40000 ALTER TABLE `tecnicaanalitica` DISABLE KEYS */;
INSERT INTO `tecnicaanalitica` VALUES (1,'ExtracciÃƒÂ³n Soxhlet',1),(2,'Titulometrica',1),(3,'ColorimÃƒÂ©trica',1),(4,'CÃƒÂ¡lculo a partir de la Dureza CÃƒÂ¡lcica',1),(5,'Sustrato Definido',1),(6,'EspectrofotomÃƒÂ©trico',1),(7,'ElectromÃƒÂ©trico',1),(8,'FiltraciÃƒÂ³n/IMS/FA',1),(9,'IncubaciÃƒÂ³n 5 dÃƒÂ­as ',1),(10,'ElectromÃƒÂ©trica',1),(11,'Reflujo cerrado',1),(12,'ColorimÃƒÂ©trico',1),(13,'Diferencia  Dureza Total y CÃƒÂ¡lcica',1),(14,'ElectromÃƒÂ©trica',1),(15,'Calculo estequiometrico',1),(16,'FiltraciÃƒÂ³n por membrana  (Agua Tratada)',1),(17,'Kjeldahl',1),(18,'GravimÃƒÂ©trica-calculo',1),(19,'Cono Imhoft',1),(20,'GravimÃƒÂ©trica',1),(21,'NefelomÃƒÂ©trico',1),(22,'IncubaciÃƒÂ³n 5 dÃƒÂ­as ElectromÃƒÂ©trica',1),(23,'Reflujo cerrado ColorimÃƒÂ©trico',1);
/*!40000 ALTER TABLE `tecnicaanalitica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tempformatotipoensayo`
--

DROP TABLE IF EXISTS `tempformatotipoensayo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tempformatotipoensayo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formato_id` int(11) DEFAULT NULL,
  `tipoensayo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1773 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tempformatotipoensayo`
--

LOCK TABLES `tempformatotipoensayo` WRITE;
/*!40000 ALTER TABLE `tempformatotipoensayo` DISABLE KEYS */;
INSERT INTO `tempformatotipoensayo` VALUES (1676,137,1),(1677,138,1),(1678,139,1),(1679,143,1),(1680,144,14),(1681,145,1),(1682,145,2),(1683,145,3),(1684,145,4),(1685,145,5),(1686,145,6),(1687,145,7),(1688,145,8),(1689,145,9),(1690,145,10),(1691,145,11),(1692,145,12),(1693,145,13),(1694,145,14),(1695,145,15),(1696,145,16),(1697,145,17),(1698,145,18),(1699,145,19),(1700,145,20),(1701,145,21),(1702,145,22),(1703,145,23),(1704,145,24),(1705,145,25),(1706,145,26),(1707,145,27),(1708,145,28),(1709,145,29),(1710,145,30),(1711,145,31),(1712,145,32),(1713,145,33),(1714,145,34),(1715,145,35),(1716,145,36),(1717,145,37),(1718,145,38),(1719,145,39),(1720,145,40),(1721,145,41),(1722,145,42),(1723,145,43),(1724,145,44),(1725,145,45),(1726,145,46),(1727,146,1),(1728,146,2),(1729,146,3),(1730,146,4),(1731,146,5),(1732,146,6),(1733,146,7),(1734,146,8),(1735,146,9),(1736,146,10),(1737,146,11),(1738,146,12),(1739,146,13),(1740,146,14),(1741,146,15),(1742,146,16),(1743,146,17),(1744,146,18),(1745,146,19),(1746,146,20),(1747,146,21),(1748,146,22),(1749,146,23),(1750,146,24),(1751,146,25),(1752,146,26),(1753,146,27),(1754,146,28),(1755,146,29),(1756,146,30),(1757,146,31),(1758,146,32),(1759,146,33),(1760,146,34),(1761,146,35),(1762,146,36),(1763,146,37),(1764,146,38),(1765,146,39),(1766,146,40),(1767,146,41),(1768,146,42),(1769,146,43),(1770,146,44),(1771,146,45),(1772,146,46);
/*!40000 ALTER TABLE `tempformatotipoensayo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tempvaloresmuestras`
--

DROP TABLE IF EXISTS `tempvaloresmuestras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tempvaloresmuestras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipensayo_id` int(11) DEFAULT NULL,
  `tecnicaanaliticavalor` varchar(45) DEFAULT NULL,
  `metodovalor` varchar(45) DEFAULT NULL,
  `unidadesvalor` varchar(45) DEFAULT NULL,
  `limitedeteccionvalor` varchar(45) DEFAULT NULL,
  `resolucion2115valor` varchar(45) DEFAULT NULL,
  `decreto1594valor` varchar(45) DEFAULT NULL,
  `decreto1594solovalor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tempvaloresmuestras`
--

LOCK TABLES `tempvaloresmuestras` WRITE;
/*!40000 ALTER TABLE `tempvaloresmuestras` DISABLE KEYS */;
INSERT INTO `tempvaloresmuestras` VALUES (1,1,'1','1','2','1','...','Ausencia','Ausencia'),(2,2,'2','2','3','0,08','...','...','...'),(3,3,'2','3','3','0,00','200','...','...'),(4,4,'3','4','9','0,008','0,2','...','...'),(5,5,'4','5','4','0,00','60','...','...'),(6,6,'3','4','5','0,30','5','...','...'),(7,7,'3','6','6','...','0,3 - 2,0','...','...'),(8,8,'2','7','7','2,00','250','250','250'),(9,9,'5','8','27','<1','<1','20000','1000'),(10,10,'6','9','29','2','15','...','...'),(11,11,'6','9','29','2','...','75','20'),(12,12,'7','10','30','< 1 ','1000','...','...'),(13,13,'7','10','1','...','...','...','...'),(14,15,'8','11','40','0','0','...','...'),(15,16,'3','17','8','0,01','0,05','0,05','0,05'),(16,17,'22','18','10','1,3','...','...','...'),(17,18,'23','23','10','>100','...','...','...'),(18,19,'3','24','12','0,01','...','...','...'),(19,20,'2','25','13','0.01','...','...','...'),(20,21,'...','12','3','0,00','...','...','...'),(21,22,'2','13','3','0,00','300','...','....'),(22,23,'5','8','27','<1','<1','2000','...'),(23,24,'10','32','14','0,01','1','...','...'),(24,25,'3','4','15','0,02','0,5','...','...'),(25,26,'4','33','16','0,25','...','...','...'),(26,27,'8','11','33','0','0','...','...'),(27,28,'3','4','11','0,02','0,3','...','...'),(28,29,'10','16','34','0','36','...','...'),(29,30,'16','29','35','0','100','...','...'),(30,31,'3','4','17','0,1','10','10','10'),(31,33,'3','4','19','0,14','...','...','...'),(32,34,'17','34','20','0,5','...','...','...'),(33,35,'10','35','10','0','...','...','...'),(34,36,'10','31','36','0,01','6,5 - 9,0','5,0 - 9,0','6,5 - 8,5'),(35,37,'10','31','1','...','...','...','...'),(36,38,'18','19','21','0,2','...','...','...'),(37,39,'19','21','22','10','...','...','...'),(38,40,'20','22','23','<1','...','...','...'),(39,41,'20','26','24','...','...','...','...'),(40,42,'20','27','25','...','...','...','...'),(41,43,'20','26','43','10','...','...','...'),(42,44,'3','4','26','0','250','400','400'),(43,45,'21','28','28','<1','2','...','10');
/*!40000 ALTER TABLE `tempvaloresmuestras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoaccion`
--

DROP TABLE IF EXISTS `tipoaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoaccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoaccion`
--

LOCK TABLES `tipoaccion` WRITE;
/*!40000 ALTER TABLE `tipoaccion` DISABLE KEYS */;
INSERT INTO `tipoaccion` VALUES (1,'ELABORA'),(2,'REVISION 1'),(3,'REVISION 2');
/*!40000 ALTER TABLE `tipoaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocliente`
--

DROP TABLE IF EXISTS `tipocliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipocliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocliente`
--

LOCK TABLES `tipocliente` WRITE;
/*!40000 ALTER TABLE `tipocliente` DISABLE KEYS */;
INSERT INTO `tipocliente` VALUES (1,'Empopasto',1),(2,'Cliente externo',1);
/*!40000 ALTER TABLE `tipocliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodepartamento`
--

DROP TABLE IF EXISTS `tipodepartamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodepartamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `codigo` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodepartamento`
--

LOCK TABLES `tipodepartamento` WRITE;
/*!40000 ALTER TABLE `tipodepartamento` DISABLE KEYS */;
INSERT INTO `tipodepartamento` VALUES (2,'Antioquia','05'),(3,'AtlÃƒÂ¡ntico','08'),(4,'BogotÃƒÂ¡ D. C.','11'),(5,'BolÃƒÂ­var','13'),(6,'BoyacÃƒÂ¡','15'),(7,'Caldas','17'),(8,'CaquetÃƒÂ¡','18'),(9,'Cauca','19'),(10,'Cesar','20'),(11,'CÃƒÂ³rdoba','23'),(12,'Cundinamarca','25'),(13,'ChocÃƒÂ³','27'),(14,'Huila','41'),(15,'La Guajira','44'),(16,'Magdalena','47'),(17,'Meta','50'),(18,'NariÃƒÂ±o','52'),(19,'Norte de Santander','54'),(20,'Quindio','63'),(21,'Risaralda','66'),(22,'Santander','68'),(23,'Sucre','70'),(24,'Tolima','73'),(25,'Valle del Cauca','76'),(26,'Arauca','81'),(27,'Casanare','85'),(28,'Putumayo','86'),(29,'ArchipiÃƒÂ©lago de San AndrÃƒÂ©s, Providencia y Santa Catalina','88'),(30,'Amazonas','91'),(31,'GuainÃƒÂ­a','94'),(32,'Guaviare','95'),(33,'VaupÃƒÂ©s','97'),(34,'Vichada','99');
/*!40000 ALTER TABLE `tipodepartamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoensayo`
--

DROP TABLE IF EXISTS `tipoensayo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoensayo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  `tecnicaanalitica_id` int(11) NOT NULL,
  `unidad_id` int(11) NOT NULL,
  `metodo_id` int(11) NOT NULL,
  `editable` int(11) DEFAULT NULL,
  `limitedeteccion` varchar(45) NOT NULL,
  `digitossignificativos` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tecnicaanalitica_id_idx` (`tecnicaanalitica_id`),
  KEY `unidad_id_idx` (`unidad_id`),
  KEY `metodo_id_idx` (`metodo_id`),
  CONSTRAINT `metodo_id` FOREIGN KEY (`metodo_id`) REFERENCES `metodo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tecnicaanalitica_id` FOREIGN KEY (`tecnicaanalitica_id`) REFERENCES `tecnicaanalitica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `unidad_id` FOREIGN KEY (`unidad_id`) REFERENCES `unidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoensayo`
--

LOCK TABLES `tipoensayo` WRITE;
/*!40000 ALTER TABLE `tipoensayo` DISABLE KEYS */;
INSERT INTO `tipoensayo` VALUES (1,'ACEITES Y GRASAS',1,1,2,1,1,'0.25',2),(2,'ACIDEZ',1,2,3,2,1,'0.25',2),(3,'ALCALINIDAD TOTAL',1,2,3,3,1,'0.25',2),(4,'ALUMINIO RESIDUAL',1,3,9,4,1,'0.25',2),(5,'CALCIO',1,4,4,5,1,'0.25',2),(6,'CARBONO ORGANICO TOTAL',1,3,5,4,1,'0.25',2),(7,'CLORO RESIDUAL',1,3,6,6,1,'0.25',2),(8,'CLORUROS',1,2,7,7,1,'0.25',2),(9,'COLIFORMES TOTALES',1,5,27,8,1,'0.25',2),(10,'COLOR APARENTE',1,6,29,9,1,'0.25',2),(11,'COLOR VERDADERO',1,6,29,9,1,'0.25',2),(12,'CONDUCTIVIDAD ELÃƒâ€°CTRICA',1,7,30,10,1,'0.25',2),(13,'CONDUCTIVIDAD ELECTRICA',1,7,30,10,1,'0.25',2),(14,'TEMPERATURA',1,7,1,10,1,'0.25',2),(15,'CRYPTOSPORIDIUM (Oquistes de Cryptosporidium/1l)',1,8,40,11,1,'0.25',2),(16,'CROMO TOTAL',1,3,8,17,1,'0.25',2),(17,'DEMANDA BIOQUIMICA  DE OXIGENO',1,22,10,18,1,'0.25',2),(18,'DEMANDA QUIMICA DE OXIGENO',1,23,10,23,1,'0.25',2),(19,'DETERGENTES',1,3,12,24,1,'0.25',2),(20,'DUREZA CALCICA',1,2,3,25,1,'0.25',2),(21,'DUREZA MAGNESICA',1,13,3,12,1,'0.25',2),(22,'DUREZA TOTAL',1,2,3,13,1,'0.25',2),(23,'ESCHERICHIA COLI',1,5,27,8,1,'0.25',2),(24,'FLUORUROS',1,10,14,32,1,'0.25',2),(25,'FOSFATOS',1,3,15,4,1,'0.25',2),(26,'FOSFORO TOTAL',1,3,16,33,1,'0.25',2),(27,'GIARDIA (Quistes de Giardia/1L)',1,8,16,33,1,'0.25',2),(28,'HIERRO TOTAL',1,3,11,4,1,'0.25',2),(29,'MAGNESIO',1,15,34,16,1,'0.25',2),(30,'MESÃƒâ€œFILOS',1,16,35,29,1,'0.25',2),(31,'NITRATOS',1,3,17,4,1,'0.25',2),(32,'NITRITOS',1,3,18,4,1,'0.25',2),(33,'NITROGENO AMONIACAL',1,3,19,4,1,'0.25',2),(34,'NITRÃƒâ€œGENO TOTAL',1,17,19,34,1,'0.25',2),(35,'OXÃƒÂGENO DISUELTO',1,10,10,35,1,'0.25',2),(36,'PH',1,10,36,31,1,'0.25',2),(37,'TEMPERATURA',1,10,1,31,1,'0.25',2),(38,'SÃƒâ€œLIDOS DISUELTOS TOTALES',1,18,21,19,1,'0.25',2),(39,'SÃƒâ€œLIDOS SEDIMENTABLES',1,19,22,21,1,'0.25',2),(40,'SÃƒâ€œLIDOS SUSPENDIDOS TOTALES',1,20,23,22,1,'0.25',2),(41,'SÃƒâ€œLIDOS SUSPENDIDOS VOLÃƒÂTILES',1,20,24,26,1,'0.25',2),(42,'SÃƒâ€œLIDOS TOTALES',1,20,25,27,1,'0.25',2),(43,'SÃƒâ€œLIDOS TOTALES VOLATILES',1,20,43,26,1,'0.25',2),(44,'SULFATOS',1,3,26,4,1,'0.25',2),(45,'TURBIEDAD',1,21,28,28,1,'0.25',2),(46,'ALCALINIDAD RANGO BAJO',1,2,3,3,1,'0.25',2),(49,'VARIOS',0,2,3,3,1,'0.25',2),(50,'MICROBIOLOGIA',0,2,3,3,1,'0.25',2);
/*!40000 ALTER TABLE `tipoensayo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipomatrizanalizada`
--

DROP TABLE IF EXISTS `tipomatrizanalizada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipomatrizanalizada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  `abrv` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipomatrizanalizada`
--

LOCK TABLES `tipomatrizanalizada` WRITE;
/*!40000 ALTER TABLE `tipomatrizanalizada` DISABLE KEYS */;
INSERT INTO `tipomatrizanalizada` VALUES (1,'Agua tratada',1,'T'),(2,'Agua cruda',1,'C'),(3,'Agua residual',1,'R'),(4,'Agua queja',1,'Q');
/*!40000 ALTER TABLE `tipomatrizanalizada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipomuestra`
--

DROP TABLE IF EXISTS `tipomuestra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipomuestra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `activo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipomuestra`
--

LOCK TABLES `tipomuestra` WRITE;
/*!40000 ALTER TABLE `tipomuestra` DISABLE KEYS */;
INSERT INTO `tipomuestra` VALUES (1,'Simple','1'),(2,'Compuesta','1');
/*!40000 ALTER TABLE `tipomuestra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipomunicipio`
--

DROP TABLE IF EXISTS `tipomunicipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipomunicipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `codigo` varchar(5) DEFAULT NULL,
  `tipodepartamento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipomunicipio_tipodepartamento1_idx` (`tipodepartamento_id`),
  CONSTRAINT `fk_tipomunicipio_tipodepartamento1` FOREIGN KEY (`tipodepartamento_id`) REFERENCES `tipodepartamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1121 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipomunicipio`
--

LOCK TABLES `tipomunicipio` WRITE;
/*!40000 ALTER TABLE `tipomunicipio` DISABLE KEYS */;
INSERT INTO `tipomunicipio` VALUES (2,'MEDELLIN','05001',2),(3,'ABEJORRAL','05002',2),(4,'ABRIAQUI','05004',2),(5,'ALEJANDRIA','05021',2),(6,'AMAGA','05030',2),(7,'AMALFI','05031',2),(8,'ANDES','05034',2),(9,'ANGELOPOLIS','05036',2),(10,'ANGOSTURA','05038',2),(11,'ANORI','05040',2),(12,'SANTAFE DE ANTIOQUIA','05042',2),(13,'ANZA','05044',2),(14,'APARTADO','05045',2),(15,'ARBOLETES','05051',2),(16,'ARGELIA','05055',2),(17,'ARMENIA','05059',2),(18,'BARBOSA','05079',2),(19,'BELMIRA','05086',2),(20,'BELLO','05088',2),(21,'BETANIA','05091',2),(22,'BETULIA','05093',2),(23,'CIUDAD BOLIVAR','05101',2),(24,'BRICENO','05107',2),(25,'BURITICA','05113',2),(26,'CACERES','05120',2),(27,'CAICEDO','05125',2),(28,'CALDAS','05129',2),(29,'CAMPAMENTO','05134',2),(30,'CANAS GORDAS','05138',2),(31,'CARACOLI','05142',2),(32,'CARAMANTA','05145',2),(33,'CAREPA','05147',2),(34,'EL CARMEN DE VIBORAL','05148',2),(35,'CAROLINA','05150',2),(36,'CAUCASIA','05154',2),(37,'CHIGORODO','05172',2),(38,'CISNEROS','05190',2),(39,'COCORNA','05197',2),(40,'CONCEPCION','05206',2),(41,'CONCORDIA','05209',2),(42,'COPACABANA','05212',2),(43,'DABEIBA','05234',2),(44,'DON MATIAS','05237',2),(45,'EBEJICO','05240',2),(46,'EL BAGRE','05250',2),(47,'ENTRERRIOS','05264',2),(48,'ENVIGADO','05266',2),(49,'FREDONIA','05282',2),(50,'FRONTINO','05284',2),(51,'GIRALDO','05306',2),(52,'GIRARDOTA','05308',2),(53,'GOMEZ PLATA','05310',2),(54,'GRANADA','05313',2),(55,'GUADALUPE','05315',2),(56,'GUARNE','05318',2),(57,'GUATAPE','05321',2),(58,'HELICONIA','05347',2),(59,'HISPANIA','05353',2),(60,'ITAGUI','05360',2),(61,'ITUANGO','05361',2),(62,'JARDIN','05364',2),(63,'JERICO','05368',2),(64,'LA CEJA','05376',2),(65,'LA ESTRELLA','05380',2),(66,'LA PINTADA','05390',2),(67,'LA UNION','05400',2),(68,'LIBORINA','05411',2),(69,'MACEO','05425',2),(70,'MARINILLA','05440',2),(71,'MONTEBELLO','05467',2),(72,'MURINDO','05475',2),(73,'MUTATA','05480',2),(74,'NARINO','05483',2),(75,'NECOCLI','05490',2),(76,'NECHI','05495',2),(77,'OLAYA','05501',2),(78,'PENOL','05541',2),(79,'PEQUE','05543',2),(80,'PUEBLORRICO','05576',2),(81,'PUERTO BERRIO','05579',2),(82,'PUERTO NARE','05585',2),(83,'PUERTO TRIUNFO','05591',2),(84,'REMEDIOS','05604',2),(85,'RETIRO','05607',2),(86,'RIONEGRO','05615',2),(87,'SABANALARGA','05628',2),(88,'SABANETA','05631',2),(89,'SALGAR','05642',2),(90,'SAN ANDRES','05647',2),(91,'SAN CARLOS','05649',2),(92,'SAN FRANCISCO','05652',2),(93,'SAN JERONIMO','05656',2),(94,'SAN JOSE DE LA MONTANA','05658',2),(95,'SAN JUAN DE URABA','05659',2),(96,'SAN LUIS','05660',2),(97,'SAN PEDRO','05664',2),(98,'SAN PEDRO DE URABA','05665',2),(99,'SAN RAFAEL','05667',2),(100,'SAN ROQUE','05670',2),(101,'SAN VICENTE','05674',2),(102,'SANTA BARBARA','05679',2),(103,'SANTA ROSA DE OSOS','05686',2),(104,'SANTO DOMINGO','05690',2),(105,'EL SANTUARIO','05697',2),(106,'SEGOVIA','05736',2),(107,'SONSON','05756',2),(108,'SOPETRAN','05761',2),(109,'TAMESIS','05789',2),(110,'TARAZA','05790',2),(111,'TARSO','05792',2),(112,'TITIRIBI','05809',2),(113,'TOLEDO','05819',2),(114,'TURBO','05837',2),(115,'URAMITA','05842',2),(116,'URRAO','05847',2),(117,'VALDIVIA','05854',2),(118,'VALPARAISO','05856',2),(119,'VEGACHI','05858',2),(120,'VENECIA','05861',2),(121,'VIGIA DEL FUERTE','05873',2),(122,'YALI','05885',2),(123,'YARUMAL','05887',2),(124,'YOLOMBO','05890',2),(125,'YONDO','05893',2),(126,'ZARAGOZA','05895',2),(127,'BARRANQUILLA','08001',3),(128,'BARANOA','08078',3),(129,'CAMPO DE LA CRUZ','08137',3),(130,'CANDELARIA','08141',3),(131,'GALAPA','08296',3),(132,'JUAN DE ACOSTA','08372',3),(133,'LURUACO','08421',3),(134,'MALAMBO','08433',3),(135,'MANATI','08436',3),(136,'PALMAR DE VARELA','08520',3),(137,'PIOJO','08549',3),(138,'POLONUEVO','08558',3),(139,'PONEDERA','08560',3),(140,'PUERTO COLOMBIA','08573',3),(141,'REPELON','08606',3),(142,'SABANAGRANDE','08634',3),(143,'SABANALARGA','08638',3),(144,'SANTA LUCIA','08675',3),(145,'SANTO TOMAS','08685',3),(146,'SOLEDAD','08758',3),(147,'SUAN','08770',3),(148,'TUBARA','08832',3),(149,'USIACURI','08849',3),(150,'BOGOTA','11001',4),(151,'CARTAGENA','13001',5),(152,'ACHI','13006',5),(153,'ALTOS DEL ROSARIO','13030',5),(154,'ARENAL','13042',5),(155,'ARJONA','13052',5),(156,'ARROYOHONDO','13062',5),(157,'BARRANCO DE LOBA','13074',5),(158,'CALAMAR','13140',5),(159,'CANTAGALLO','13160',5),(160,'CICUCO','13188',5),(161,'CORDOBA','13212',5),(162,'CLEMENCIA','13222',5),(163,'EL CARMEN DE BOLIVAR','13244',5),(164,'EL GUAMO','13248',5),(165,'EL PENON','13268',5),(166,'HATILLO DE LOBA','13300',5),(167,'MAGANGUE','13430',5),(168,'MAHATES','13433',5),(169,'MARGARITA','13440',5),(170,'MARIA LA BAJA','13442',5),(171,'MONTECRISTO','13458',5),(172,'MOMPOS','13468',5),(173,'MORALES','13473',5),(174,'PINILLOS','13549',5),(175,'REGIDOR','13580',5),(176,'RIO VIEJO','13600',5),(177,'SAN CRISTOBAL','13620',5),(178,'SAN ESTANISLAO','13647',5),(179,'SAN FERNANDO','13650',5),(180,'SAN JACINTO','13654',5),(181,'SAN JACINTO DEL CAUCA','13655',5),(182,'SAN JUAN NEPOMUCENO','13657',5),(183,'SAN MARTIN DE LOBA','13667',5),(184,'SAN PABLO','13670',5),(185,'SANTA CATALINA','13673',5),(186,'SANTA ROSA','13683',5),(187,'SANTA ROSA DEL SUR','13688',5),(188,'SIMITI','13744',5),(189,'SOPLAVIENTO','13760',5),(190,'TALAIGUA NUEVO','13780',5),(191,'TIQUISIO','13810',5),(192,'TURBACO','13836',5),(193,'TURBANA','13838',5),(194,'VILLANUEVA','13873',5),(195,'ZAMBRANO','13894',5),(196,'TUNJA','15001',6),(197,'ALMEIDA','15022',6),(198,'AQUITANIA','15047',6),(199,'ARCABUCO','15051',6),(200,'BELEN','15087',6),(201,'BERBEO','15090',6),(202,'BETEITIVA','15092',6),(203,'BOAVITA','15097',6),(204,'BOYACA','15104',6),(205,'BRICENO','15106',6),(206,'BUENAVISTA','15109',6),(207,'BUSBANZA','15114',6),(208,'CALDAS','15131',6),(209,'CAMPOHERMOSO','15135',6),(210,'CERINZA','15162',6),(211,'CHINAVITA','15172',6),(212,'CHIQUINQUIRA','15176',6),(213,'CHISCAS','15180',6),(214,'CHITA','15183',6),(215,'CHITARAQUE','15185',6),(216,'CHIVATA','15187',6),(217,'CIENEGA','15189',6),(218,'COMBITA','15204',6),(219,'COPER','15212',6),(220,'CORRALES','15215',6),(221,'COVARACHIA','15218',6),(222,'CUBARA','15223',6),(223,'CUCAITA','15224',6),(224,'CUITIVA','15226',6),(225,'CHIQUIZA','15232',6),(226,'CHIVOR','15236',6),(227,'DUITAMA','15238',6),(228,'EL COCUY','15244',6),(229,'EL ESPINO','15248',6),(230,'FIRAVITOBA','15272',6),(231,'FLORESTA','15276',6),(232,'GACHANTIVA','15293',6),(233,'GAMEZA','15296',6),(234,'GARAGOA','15299',6),(235,'GUACAMAYAS','15317',6),(236,'GUATEQUE','15322',6),(237,'GUAYATA','15325',6),(238,'GAICAN','15332',6),(239,'IZA','15362',6),(240,'JENESANO','15367',6),(241,'JERICO','15368',6),(242,'LABRANZAGRANDE','15377',6),(243,'LA CAPILLA','15380',6),(244,'LA VICTORIA','15401',6),(245,'LA UVITA','15403',6),(246,'VILLA DE LEYVA','15407',6),(247,'MACANAL','15425',6),(248,'MARIPI','15442',6),(249,'MIRAFLORES','15455',6),(250,'MONGUA','15464',6),(251,'MONGUI','15466',6),(252,'MONIQUIRA','15469',6),(253,'MOTAVITA','15476',6),(254,'MUZO','15480',6),(255,'NOBSA','15491',6),(256,'NUEVO COLON','15494',6),(257,'OICATA','15500',6),(258,'OTANCHE','15507',6),(259,'PACHAVITA','15511',6),(260,'PAEZ','15514',6),(261,'PAIPA','15516',6),(262,'PAJARITO','15518',6),(263,'PANQUEBA','15522',6),(264,'PAUNA','15531',6),(265,'PAYA','15533',6),(266,'PAZ DE RIO','15537',6),(267,'PESCA','15542',6),(268,'PISBA','15550',6),(269,'PUERTO BOYACA','15572',6),(270,'QUIPAMA','15580',6),(271,'RAMIRIQUI','15599',6),(272,'RAQUIRA','15600',6),(273,'RONDON','15621',6),(274,'SABOYA','15632',6),(275,'SACHICA','15638',6),(276,'SAMACA','15646',6),(277,'SAN EDUARDO','15660',6),(278,'SAN JOSE DE PARE','15664',6),(279,'SAN LUIS DE GACENO','15667',6),(280,'SAN MATEO','15673',6),(281,'SAN MIGUEL DE SEMA','15676',6),(282,'SAN PABLO DE BORBUR','15681',6),(283,'SANTANA','15686',6),(284,'SANTA MARIA','15690',6),(285,'SANTA ROSA DE VITERBO','15693',6),(286,'SANTA SOFIA','15696',6),(287,'SATIVANORTE','15720',6),(288,'SATIVASUR','15723',6),(289,'SIACHOQUE','15740',6),(290,'SOATA','15753',6),(291,'SOCOTA','15755',6),(292,'SOCHA','15757',6),(293,'SOGAMOSO','15759',6),(294,'SOMONDOCO','15761',6),(295,'SORA','15762',6),(296,'SOTAQUIRA','15763',6),(297,'SORACA','15764',6),(298,'SUSACON','15774',6),(299,'SUTAMARCHAN','15776',6),(300,'SUTATENZA','15778',6),(301,'TASCO','15790',6),(302,'TENZA','15798',6),(303,'TIBANA','15804',6),(304,'TIBASOSA','15806',6),(305,'TINJACA','15808',6),(306,'TIPACOQUE','15810',6),(307,'TOCA','15814',6),(308,'TOGA','15816',6),(309,'TOPAGA','15820',6),(310,'TOTA','15822',6),(311,'TUNUNGUA','15832',6),(312,'TURMEQUE','15835',6),(313,'TUTA','15837',6),(314,'TUTAZA','15839',6),(315,'UMBITA','15842',6),(316,'VENTAQUEMADA','15861',6),(317,'VIRACACHA','15879',6),(318,'ZETAQUIRA','15897',6),(319,'MANIZALES','17001',7),(320,'AGUADAS','17013',7),(321,'ANSERMA','17042',7),(322,'ARANZAZU','17050',7),(323,'BELALCAZAR','17088',7),(324,'CHINCHINA','17174',7),(325,'FILADELFIA','17272',7),(326,'LA DORADA','17380',7),(327,'LA MERCED','17388',7),(328,'MANZANARES','17433',7),(329,'MARMATO','17442',7),(330,'MARQUETALIA','17444',7),(331,'MARULANDA','17446',7),(332,'NEIRA','17486',7),(333,'NORCASIA','17495',7),(334,'PACORA','17513',7),(335,'PALESTINA','17524',7),(336,'PENSILVANIA','17541',7),(337,'RIOSUCIO','17614',7),(338,'RISARALDA','17616',7),(339,'SALAMINA','17653',7),(340,'SAMANA','17662',7),(341,'SAN JOSE','17665',7),(342,'SUPIA','17777',7),(343,'VICTORIA','17867',7),(344,'VILLAMARIA','17873',7),(345,'VITERBO','17877',7),(346,'FLORENCIA','18001',8),(347,'ALBANIA','18029',8),(348,'BELEN DE LOS ANDAQUIES','18094',8),(349,'CARTAGENA DEL CHAIRA','18150',8),(350,'CURILLO','18205',8),(351,'EL DONCELLO','18247',8),(352,'EL PAUJIL','18256',8),(353,'LA MONTANITA','18410',8),(354,'MILAN','18460',8),(355,'MORELIA','18479',8),(356,'PUERTO RICO','18592',8),(357,'SAN JOSE DE LA FRAGUA','18610',8),(358,'SAN VICENTE DEL CAGUAN','18753',8),(359,'SOLANO','18756',8),(360,'SOLITA','18785',8),(361,'VALPARAISO','18860',8),(362,'POPAYAN','19001',9),(363,'ALMAGUER','19022',9),(364,'ARGELIA','19050',9),(365,'BALBOA','19075',9),(366,'BOLIVAR','19100',9),(367,'BUENOS AIRES','19110',9),(368,'CAJIBIO','19130',9),(369,'CALDONO','19137',9),(370,'CALOTO','19142',9),(371,'CORINTO','19212',9),(372,'EL TAMBO','19256',9),(373,'FLORENCIA','19290',9),(374,'GUAPI','19318',9),(375,'INZA','19355',9),(376,'JAMBALO','19364',9),(377,'LA SIERRA','19392',9),(378,'LA VEGA','19397',9),(379,'LOPEZ','19418',9),(380,'MERCADERES','19450',9),(381,'MIRANDA','19455',9),(382,'MORALES','19473',9),(383,'PADILLA','19513',9),(384,'PAEZ','19517',9),(385,'PATIA','19532',9),(386,'PIAMONTE','19533',9),(387,'PIENDAMO','19548',9),(388,'PUERTO TEJADA','19573',9),(389,'PURACE','19585',9),(390,'ROSAS','19622',9),(391,'SAN SEBASTIAN','19693',9),(392,'SANTANDER DE QUILICHAO','19698',9),(393,'SANTA ROSA','19701',9),(394,'SILVIA','19743',9),(395,'SOTARA','19760',9),(396,'SUAREZ','19780',9),(397,'SUCRE','19785',9),(398,'TIMBIO','19807',9),(399,'TIMBIQUI','19809',9),(400,'TORIBIO','19821',9),(401,'TOTORO','19824',9),(402,'VILLA RICA','19845',9),(403,'VALLEDUPAR','20001',10),(404,'AGUACHICA','20011',10),(405,'AGUSTIN CODAZZI','20013',10),(406,'ASTREA','20032',10),(407,'BECERRIL','20045',10),(408,'BOSCONIA','20060',10),(409,'CHIMICHAGUA','20175',10),(410,'CHIRIGUANA','20178',10),(411,'CURUMANI','20228',10),(412,'EL COPEY','20238',10),(413,'EL PASO','20250',10),(414,'GAMARRA','20295',10),(415,'GONZALEZ','20310',10),(416,'LA GLORIA','20383',10),(417,'LA JAGUA DE IBIRICO','20400',10),(418,'MANAURE','20443',10),(419,'PAILITAS','20517',10),(420,'PELAYA','20550',10),(421,'PUEBLO BELLO','20570',10),(422,'RIO DE ORO','20614',10),(423,'LA PAZ','20621',10),(424,'SAN ALBERTO','20710',10),(425,'SAN DIEGO','20750',10),(426,'SAN MARTIN','20770',10),(427,'TAMALAMEQUE','20787',10),(428,'MONTERIA','23001',11),(429,'AYAPEL','23068',11),(430,'BUENAVISTA','23079',11),(431,'CANALETE','23090',11),(432,'CERETE','23162',11),(433,'CHIMA','23168',11),(434,'CHINU','23182',11),(435,'CIENAGA DE ORO','23189',11),(436,'COTORRA','23300',11),(437,'LA APARTADA','23350',11),(438,'LORICA','23417',11),(439,'LOS CORDOBAS','23419',11),(440,'MOMIL','23464',11),(441,'MONTELIBANO','23466',11),(442,'MOÃƒâ€˜ITOS','23500',11),(443,'PLANETA RICA','23555',11),(444,'PUEBLO NUEVO','23570',11),(445,'PUERTO ESCONDIDO','23574',11),(446,'PUERTO LIBERTADOR','23580',11),(447,'PURISIMA','23586',11),(448,'SAHAGUN','23660',11),(449,'SAN ANDRES DE SOTAVENTO','23670',11),(450,'SAN ANTERO','23672',11),(451,'SAN BERNARDO DEL VIENTO','23675',11),(452,'SAN CARLOS','23678',11),(453,'SAN PELAYO','23686',11),(454,'TIERRALTA','23807',11),(455,'VALENCIA','23855',11),(456,'AGUA DE DIOS','25001',12),(457,'ALBAN','25019',12),(458,'ANAPOIMA','25035',12),(459,'ANOLAIMA','25040',12),(460,'ARBELAEZ','25053',12),(461,'BELTRAN','25086',12),(462,'BITUIMA','25095',12),(463,'BOJACA','25099',12),(464,'CABRERA','25120',12),(465,'CACHIPAY','25123',12),(466,'CAJICA','25126',12),(467,'CAPARRAPI','25148',12),(468,'CAQUEZA','25151',12),(469,'CARMEN DE CARUPA','25154',12),(470,'CHAGUANI','25168',12),(471,'CHIA','25175',12),(472,'CHIPAQUE','25178',12),(473,'CHOACHI','25181',12),(474,'CHOCONTA','25183',12),(475,'COGUA','25200',12),(476,'COTA','25214',12),(477,'CUCUNUBA','25224',12),(478,'EL COLEGIO','25245',12),(479,'EL PEÃƒâ€˜ON','25258',12),(480,'EL ROSAL','25260',12),(481,'FACATATIVA','25269',12),(482,'FOMEQUE','25279',12),(483,'FOSCA','25281',12),(484,'FUNZA','25286',12),(485,'FUQUENE','25288',12),(486,'FUSAGASUGA','25290',12),(487,'GACHALA','25293',12),(488,'GACHANCIPA','25295',12),(489,'GACHETA','25297',12),(490,'GAMA','25299',12),(491,'GIRARDOT','25307',12),(492,'GRANADA','25312',12),(493,'GUACHETA','25317',12),(494,'GUADUAS','25320',12),(495,'GUASCA','25322',12),(496,'GUATAQUI','25324',12),(497,'GUATAVITA','25326',12),(498,'GUAYABAL DE SIQUIMA','25328',12),(499,'GUAYABETAL','25335',12),(500,'GUTIERREZ','25339',12),(501,'JERUSALEN','25368',12),(502,'JUNIN','25372',12),(503,'LA CALERA','25377',12),(504,'LA MESA','25386',12),(505,'LA PALMA','25394',12),(506,'LA PEÃƒâ€˜A','25398',12),(507,'LA VEGA','25402',12),(508,'LENGUAZAQUE','25407',12),(509,'MACHETA','25426',12),(510,'MADRID','25430',12),(511,'MANTA','25436',12),(512,'MEDINA','25438',12),(513,'MOSQUERA','25473',12),(514,'NARIÃƒâ€˜O','25483',12),(515,'NEMOCON','25486',12),(516,'NILO','25488',12),(517,'NIMAIMA','25489',12),(518,'NOCAIMA','25491',12),(519,'VENECIA','25506',12),(520,'PACHO','25513',12),(521,'PAIME','25518',12),(522,'PANDI','25524',12),(523,'PARATEBUENO','25530',12),(524,'PASCA','25535',12),(525,'PUERTO SALGAR','25572',12),(526,'PULI','25580',12),(527,'QUEBRADANEGRA','25592',12),(528,'QUETAME','25594',12),(529,'QUIPILE','25596',12),(530,'APULO','25599',12),(531,'RICAURTE','25612',12),(532,'SAN ANTONIO DEL TEQUENDAMA','25645',12),(533,'SAN BERNARDO','25649',12),(534,'SAN CAYETANO','25653',12),(535,'SAN FRANCISCO','25658',12),(536,'SAN JUAN DE RIO SECO','25662',12),(537,'SASAIMA','25718',12),(538,'SESQUILE','25736',12),(539,'SIBATE','25740',12),(540,'SILVANIA','25743',12),(541,'SIMIJACA','25745',12),(542,'SOACHA','25754',12),(543,'SOPO','25758',12),(544,'SUBACHOQUE','25769',12),(545,'SUESCA','25772',12),(546,'SUPATA','25777',12),(547,'SUSA','25779',12),(548,'SUTATAUSA','25781',12),(549,'TABIO','25785',12),(550,'TAUSA','25793',12),(551,'TENA','25797',12),(552,'TENJO','25799',12),(553,'TIBACUY','25805',12),(554,'TIBIRITA','25807',12),(555,'TOCAIMA','25815',12),(556,'TOCANCIPA','25817',12),(557,'TOPAIPI','25823',12),(558,'UBALA','25839',12),(559,'UBAQUE','25841',12),(560,'VILLA DE SAN DIEGO DE UBATE','25843',12),(561,'UNE','25845',12),(562,'UTICA','25851',12),(563,'VERGARA','25862',12),(564,'VIANI','25867',12),(565,'VILLAGOMEZ','25871',12),(566,'VILLAPINZON','25873',12),(567,'VILLETA','25875',12),(568,'VIOTA','25878',12),(569,'YACOPI','25885',12),(570,'ZIPACON','25898',12),(571,'ZIPAQUIRA','25899',12),(572,'QUIBDO','27001',13),(573,'ACANDI','27006',13),(574,'ALTO BAUDO','27025',13),(575,'ATRATO','27050',13),(576,'BAGADO','27073',13),(577,'BAHIA SOLANO','27075',13),(578,'BAJO BAUDO','27077',13),(579,'BELEN DE BAJIRA','27086',13),(580,'BOJAYA','27099',13),(581,'EL CANTON DEL SAN PABLO','27135',13),(582,'CARMEN DEL DARIEN','27150',13),(583,'CERTEGUI','27160',13),(584,'CONDOTO','27205',13),(585,'EL CARMEN DE ATRATO','27245',13),(586,'EL LITORAL DEL SAN JUAN','27250',13),(587,'ISTMINA','27361',13),(588,'JURADO','27372',13),(589,'LLORO','27413',13),(590,'MEDIO ATRATO','27425',13),(591,'MEDIO BAUDO','27430',13),(592,'MEDIO SAN JUAN','27450',13),(593,'NOVITA','27491',13),(594,'NUQUI','27495',13),(595,'RIO IRO','27580',13),(596,'RIO QUITO','27600',13),(597,'RIOSUCIO','27615',13),(598,'SAN JOSE DEL PALMAR','27660',13),(599,'SIPI','27745',13),(600,'TADO','27787',13),(601,'UNGUIA','27800',13),(602,'UNION PANAMERICANA','27810',13),(603,'NEIVA','41001',14),(604,'ACEVEDO','41006',14),(605,'AGRADO','41013',14),(606,'AIPE','41016',14),(607,'ALGECIRAS','41020',14),(608,'ALTAMIRA','41026',14),(609,'BARAYA','41078',14),(610,'CAMPOALEGRE','41132',14),(611,'COLOMBIA','41206',14),(612,'ELIAS','41244',14),(613,'GARZON','41298',14),(614,'GIGANTE','41306',14),(615,'GUADALUPE','41319',14),(616,'HOBO','41349',14),(617,'IQUIRA','41357',14),(618,'ISNOS','41359',14),(619,'LA ARGENTINA','41378',14),(620,'LA PLATA','41396',14),(621,'NATAGA','41483',14),(622,'OPORAPA','41503',14),(623,'PAICOL','41518',14),(624,'PALERMO','41524',14),(625,'PALESTINA','41530',14),(626,'PITAL','41548',14),(627,'PITALITO','41551',14),(628,'RIVERA','41615',14),(629,'SALADOBLANCO','41660',14),(630,'SAN AGUSTIN','41668',14),(631,'SANTA MARIA','41676',14),(632,'SUAZA','41770',14),(633,'TARQUI','41791',14),(634,'TESALIA','41797',14),(635,'TELLO','41799',14),(636,'TERUEL','41801',14),(637,'TIMANA','41807',14),(638,'VILLAVIEJA','41872',14),(639,'YAGUARA','41885',14),(640,'RIOHACHA','44001',15),(641,'ALBANIA','44035',15),(642,'BARRANCAS','44078',15),(643,'DIBULLA','44090',15),(644,'DISTRACCION','44098',15),(645,'EL MOLINO','44110',15),(646,'FONSECA','44279',15),(647,'HATONUEVO','44378',15),(648,'LA JAGUA DEL PILAR','44420',15),(649,'MAICAO','44430',15),(650,'MANAURE','44560',15),(651,'SAN JUAN DEL CESAR','44650',15),(652,'URIBIA','44847',15),(653,'URUMITA','44855',15),(654,'VILLANUEVA','44874',15),(655,'SANTA MARTA','47001',16),(656,'ALGARROBO','47030',16),(657,'ARACATACA','47053',16),(658,'ARIGUANI','47058',16),(659,'CERRO SAN ANTONIO','47161',16),(660,'CHIVOLO','47170',16),(661,'CIENAGA','47189',16),(662,'CONCORDIA','47205',16),(663,'EL BANCO','47245',16),(664,'EL PIÃƒâ€˜ON','47258',16),(665,'EL RETEN','47268',16),(666,'FUNDACION','47288',16),(667,'GUAMAL','47318',16),(668,'NUEVA GRANADA','47460',16),(669,'PEDRAZA','47541',16),(670,'PIJIÃƒâ€˜O DEL CARMEN','47545',16),(671,'PIVIJAY','47551',16),(672,'PLATO','47555',16),(673,'PUEBLOVIEJO','47570',16),(674,'REMOLINO','47605',16),(675,'SABANAS DE SAN ANGEL','47660',16),(676,'SALAMINA','47675',16),(677,'SAN SEBASTIAN DE BUENAVISTA','47692',16),(678,'SAN ZENON','47703',16),(679,'SANTA ANA','47707',16),(680,'SANTA BARBARA DE PINTO','47720',16),(681,'SITIONUEVO','47745',16),(682,'TENERIFE','47798',16),(683,'ZAPAYAN','47960',16),(684,'ZONA BANANERA','47980',16),(685,'VILLAVICENCIO','50001',17),(686,'ACACIAS','50006',17),(687,'BARRANCA DE UPIA','50110',17),(688,'CABUYARO','50124',17),(689,'CASTILLA LA NUEVA','50150',17),(690,'CUBARRAL','50223',17),(691,'CUMARAL','50226',17),(692,'EL CALVARIO','50245',17),(693,'EL CASTILLO','50251',17),(694,'EL DORADO','50270',17),(695,'FUENTE DE ORO','50287',17),(696,'GRANADA','50313',17),(697,'GUAMAL','50318',17),(698,'MAPIRIPAN','50325',17),(699,'MESETAS','50330',17),(700,'LA MACARENA','50350',17),(701,'URIBE','50370',17),(702,'LEJANIAS','50400',17),(703,'PUERTO CONCORDIA','50450',17),(704,'PUERTO GAITAN','50568',17),(705,'PUERTO LOPEZ','50573',17),(706,'PUERTO LLERAS','50577',17),(707,'PUERTO RICO','50590',17),(708,'RESTREPO','50606',17),(709,'SAN CARLOS DE GUAROA','50680',17),(710,'SAN JUAN DE ARAMA','50683',17),(711,'SAN JUANITO','50686',17),(712,'SAN MARTIN','50689',17),(713,'VISTA HERMOSA','50711',17),(714,'PASTO','52001',18),(715,'ALBAN','52019',18),(716,'ALDANA','52022',18),(717,'ANCUYA','52036',18),(718,'ARBOLEDA','52051',18),(719,'BARBACOAS','52079',18),(720,'BELEN','52083',18),(721,'BUESACO','52110',18),(722,'COLON','52203',18),(723,'CONSACA','52207',18),(724,'CONTADERO','52210',18),(725,'CORDOBA','52215',18),(726,'CUASPUD','52224',18),(727,'CUMBAL','52227',18),(728,'CUMBITARA','52233',18),(729,'CHACHAGÃ…Â¡I','52240',18),(730,'EL CHARCO','52250',18),(731,'EL PEÃƒâ€˜OL','52254',18),(732,'EL ROSARIO','52256',18),(733,'EL TABLON DE GOMEZ','52258',18),(734,'EL TAMBO','52260',18),(735,'FUNES','52287',18),(736,'GUACHUCAL','52317',18),(737,'GUAITARILLA','52320',18),(738,'GUALMATAN','52323',18),(739,'ILES','52352',18),(740,'IMUES','52354',18),(741,'IPIALES','52356',18),(742,'LA CRUZ','52378',18),(743,'LA FLORIDA','52381',18),(744,'LA LLANADA','52385',18),(745,'LA TOLA','52390',18),(746,'LA UNION','52399',18),(747,'LEIVA','52405',18),(748,'LINARES','52411',18),(749,'LOS ANDES','52418',18),(750,'MAGÃƒÅ“I','52427',18),(751,'MALLAMA','52435',18),(752,'MOSQUERA','52473',18),(753,'NARIÃƒâ€˜O','52480',18),(754,'OLAYA HERRERA','52490',18),(755,'OSPINA','52506',18),(756,'FRANCISCO PIZARRO','52520',18),(757,'POLICARPA','52540',18),(758,'POTOSI','52560',18),(759,'PROVIDENCIA','52565',18),(760,'PUERRES','52573',18),(761,'PUPIALES','52585',18),(762,'RICAURTE','52612',18),(763,'ROBERTO PAYAN','52621',18),(764,'SAMANIEGO','52678',18),(765,'SANDONA','52683',18),(766,'SAN BERNARDO','52685',18),(767,'SAN LORENZO','52687',18),(768,'SAN PABLO','52693',18),(769,'SAN PEDRO DE CARTAGO','52694',18),(770,'SANTA BARBARA','52696',18),(771,'SANTACRUZ','52699',18),(772,'SAPUYES','52720',18),(773,'TAMINANGO','52786',18),(774,'TANGUA','52788',18),(775,'TUMACO','52835',18),(776,'TUQUERRES','52838',18),(777,'YACUANQUER','52885',18),(778,'CUCUTA','54001',19),(779,'ABREGO','54003',19),(780,'ARBOLEDAS','54051',19),(781,'BOCHALEMA','54099',19),(782,'BUCARASICA','54109',19),(783,'CACOTA','54125',19),(784,'CACHIRA','54128',19),(785,'CHINACOTA','54172',19),(786,'CHITAGA','54174',19),(787,'CONVENCION','54206',19),(788,'CUCUTILLA','54223',19),(789,'DURANIA','54239',19),(790,'EL CARMEN','54245',19),(791,'EL TARRA','54250',19),(792,'EL ZULIA','54261',19),(793,'GRAMALOTE','54313',19),(794,'HACARI','54344',19),(795,'HERRAN','54347',19),(796,'LABATECA','54377',19),(797,'LA ESPERANZA','54385',19),(798,'LA PLAYA','54398',19),(799,'LOS PATIOS','54405',19),(800,'LOURDES','54418',19),(801,'MUTISCUA','54480',19),(802,'OCAÃƒâ€˜A','54498',19),(803,'PAMPLONA','54518',19),(804,'PAMPLONITA','54520',19),(805,'PUERTO SANTANDER','54553',19),(806,'RAGONVALIA','54599',19),(807,'SALAZAR','54660',19),(808,'SAN CALIXTO','54670',19),(809,'SAN CAYETANO','54673',19),(810,'SANTIAGO','54680',19),(811,'SARDINATA','54720',19),(812,'SILOS','54743',19),(813,'TEORAMA','54800',19),(814,'TIBU','54810',19),(815,'TOLEDO','54820',19),(816,'VILLA CARO','54871',19),(817,'VILLA DEL ROSARIO','54874',19),(818,'ARMENIA','63001',20),(819,'BUENAVISTA','63111',20),(820,'CALARCA','63130',20),(821,'CIRCASIA','63190',20),(822,'CORDOBA','63212',20),(823,'FILANDIA','63272',20),(824,'GENOVA','63302',20),(825,'LA TEBAIDA','63401',20),(826,'MONTENEGRO','63470',20),(827,'PIJAO','63548',20),(828,'QUIMBAYA','63594',20),(829,'SALENTO','63690',20),(830,'PEREIRA','66001',21),(831,'APIA','66045',21),(832,'BALBOA','66075',21),(833,'BELEN DE UMBRIA','66088',21),(834,'DOSQUEBRADAS','66170',21),(835,'GUATICA','66318',21),(836,'LA CELIA','66383',21),(837,'LA VIRGINIA','66400',21),(838,'MARSELLA','66440',21),(839,'MISTRATO','66456',21),(840,'PUEBLO RICO','66572',21),(841,'QUINCHIA','66594',21),(842,'SANTA ROSA DE CABAL','66682',21),(843,'SANTUARIO','66687',21),(844,'BUCARAMANGA','68001',22),(845,'AGUADA','68013',22),(846,'ALBANIA','68020',22),(847,'ARATOCA','68051',22),(848,'BARBOSA','68077',22),(849,'BARICHARA','68079',22),(850,'BARRANCABERMEJA','68081',22),(851,'BETULIA','68092',22),(852,'BOLIVAR','68101',22),(853,'CABRERA','68121',22),(854,'CALIFORNIA','68132',22),(855,'CAPITANEJO','68147',22),(856,'CARCASI','68152',22),(857,'CEPITA','68160',22),(858,'CERRITO','68162',22),(859,'CHARALA','68167',22),(860,'CHARTA','68169',22),(861,'CHIMA','68176',22),(862,'CHIPATA','68179',22),(863,'CIMITARRA','68190',22),(864,'CONCEPCION','68207',22),(865,'CONFINES','68209',22),(866,'CONTRATACION','68211',22),(867,'COROMORO','68217',22),(868,'CURITI','68229',22),(869,'EL CARMEN DE CHUCURI','68235',22),(870,'EL GUACAMAYO','68245',22),(871,'EL PEÃƒâ€˜ON','68250',22),(872,'EL PLAYON','68255',22),(873,'ENCINO','68264',22),(874,'ENCISO','68266',22),(875,'FLORIAN','68271',22),(876,'FLORIDABLANCA','68276',22),(877,'GALAN','68296',22),(878,'GAMBITA','68298',22),(879,'GIRON','68307',22),(880,'GUACA','68318',22),(881,'GUADALUPE','68320',22),(882,'GUAPOTA','68322',22),(883,'GUAVATA','68324',22),(884,'GÃ…Â¡EPSA','68327',22),(885,'HATO','68344',22),(886,'JESUS MARIA','68368',22),(887,'JORDAN','68370',22),(888,'LA BELLEZA','68377',22),(889,'LANDAZURI','68385',22),(890,'LA PAZ','68397',22),(891,'LEBRIJA','68406',22),(892,'LOS SANTOS','68418',22),(893,'MACARAVITA','68425',22),(894,'MALAGA','68432',22),(895,'MATANZA','68444',22),(896,'MOGOTES','68464',22),(897,'MOLAGAVITA','68468',22),(898,'OCAMONTE','68498',22),(899,'OIBA','68500',22),(900,'ONZAGA','68502',22),(901,'PALMAR','68522',22),(902,'PALMAS DEL SOCORRO','68524',22),(903,'PARAMO','68533',22),(904,'PIEDECUESTA','68547',22),(905,'PINCHOTE','68549',22),(906,'PUENTE NACIONAL','68572',22),(907,'PUERTO PARRA','68573',22),(908,'PUERTO WILCHES','68575',22),(909,'RIONEGRO','68615',22),(910,'SABANA DE TORRES','68655',22),(911,'SAN ANDRES','68669',22),(912,'SAN BENITO','68673',22),(913,'SAN GIL','68679',22),(914,'SAN JOAQUIN','68682',22),(915,'SAN JOSE DE MIRANDA','68684',22),(916,'SAN MIGUEL','68686',22),(917,'SAN VICENTE DE CHUCURI','68689',22),(918,'SANTA BARBARA','68705',22),(919,'SANTA HELENA DEL OPON','68720',22),(920,'SIMACOTA','68745',22),(921,'SOCORRO','68755',22),(922,'SUAITA','68770',22),(923,'SUCRE','68773',22),(924,'SURATA','68780',22),(925,'TONA','68820',22),(926,'VALLE DE SAN JOSE','68855',22),(927,'VELEZ','68861',22),(928,'VETAS','68867',22),(929,'VILLANUEVA','68872',22),(930,'ZAPATOCA','68895',22),(931,'SINCELEJO','70001',23),(932,'BUENAVISTA','70110',23),(933,'CAIMITO','70124',23),(934,'COLOSO','70204',23),(935,'COROZAL','70215',23),(936,'COVEÃƒâ€˜AS','70221',23),(937,'CHALAN','70230',23),(938,'EL ROBLE','70233',23),(939,'GALERAS','70235',23),(940,'GUARANDA','70265',23),(941,'LA UNION','70400',23),(942,'LOS PALMITOS','70418',23),(943,'MAJAGUAL','70429',23),(944,'MORROA','70473',23),(945,'OVEJAS','70508',23),(946,'PALMITO','70523',23),(947,'SAMPUES','70670',23),(948,'SAN BENITO ABAD','70678',23),(949,'SAN JUAN DE BETULIA','70702',23),(950,'SAN MARCOS','70708',23),(951,'SAN ONOFRE','70713',23),(952,'SAN PEDRO','70717',23),(953,'SINCE','70742',23),(954,'SUCRE','70771',23),(955,'SANTIAGO DE TOLU','70820',23),(956,'TOLUVIEJO','70823',23),(957,'IBAGUE','73001',24),(958,'ALPUJARRA','73024',24),(959,'ALVARADO','73026',24),(960,'AMBALEMA','73030',24),(961,'ANZOATEGUI','73043',24),(962,'ARMERO','73055',24),(963,'ATACO','73067',24),(964,'CAJAMARCA','73124',24),(965,'CARMEN DE APICALA','73148',24),(966,'CASABIANCA','73152',24),(967,'CHAPARRAL','73168',24),(968,'COELLO','73200',24),(969,'COYAIMA','73217',24),(970,'CUNDAY','73226',24),(971,'DOLORES','73236',24),(972,'ESPINAL','73268',24),(973,'FALAN','73270',24),(974,'FLANDES','73275',24),(975,'FRESNO','73283',24),(976,'GUAMO','73319',24),(977,'HERVEO','73347',24),(978,'HONDA','73349',24),(979,'ICONONZO','73352',24),(980,'LERIDA','73408',24),(981,'LIBANO','73411',24),(982,'MARIQUITA','73443',24),(983,'MELGAR','73449',24),(984,'MURILLO','73461',24),(985,'NATAGAIMA','73483',24),(986,'ORTEGA','73504',24),(987,'PALOCABILDO','73520',24),(988,'PIEDRAS','73547',24),(989,'PLANADAS','73555',24),(990,'PRADO','73563',24),(991,'PURIFICACION','73585',24),(992,'RIOBLANCO','73616',24),(993,'RONCESVALLES','73622',24),(994,'ROVIRA','73624',24),(995,'SALDAÃƒâ€˜A','73671',24),(996,'SAN ANTONIO','73675',24),(997,'SAN LUIS','73678',24),(998,'SANTA ISABEL','73686',24),(999,'SUAREZ','73770',24),(1000,'VALLE DE SAN JUAN','73854',24),(1001,'VENADILLO','73861',24),(1002,'VILLAHERMOSA','73870',24),(1003,'VILLARRICA','73873',24),(1004,'CALI','76001',25),(1005,'ALCALA','76020',25),(1006,'ANDALUCIA','76036',25),(1007,'ANSERMANUEVO','76041',25),(1008,'ARGELIA','76054',25),(1009,'BOLIVAR','76100',25),(1010,'BUENAVENTURA','76109',25),(1011,'BUGA','76111',25),(1012,'BUGALAGRANDE','76113',25),(1013,'CAICEDONIA','76122',25),(1014,'CALIMA','76126',25),(1015,'CANDELARIA','76130',25),(1016,'CARTAGO','76147',25),(1017,'DAGUA','76233',25),(1018,'EL AGUILA','76243',25),(1019,'EL CAIRO','76246',25),(1020,'EL CERRITO','76248',25),(1021,'EL DOVIO','76250',25),(1022,'FLORIDA','76275',25),(1023,'GINEBRA','76306',25),(1024,'GUACARI','76318',25),(1025,'JAMUNDI','76364',25),(1026,'LA CUMBRE','76377',25),(1027,'LA UNION','76400',25),(1028,'LA VICTORIA','76403',25),(1029,'OBANDO','76497',25),(1030,'PALMIRA','76520',25),(1031,'PRADERA','76563',25),(1032,'RESTREPO','76606',25),(1033,'RIOFRIO','76616',25),(1034,'ROLDANILLO','76622',25),(1035,'SAN PEDRO','76670',25),(1036,'SEVILLA','76736',25),(1037,'TORO','76823',25),(1038,'TRUJILLO','76828',25),(1039,'TULUA','76834',25),(1040,'ULLOA','76845',25),(1041,'VERSALLES','76863',25),(1042,'VIJES','76869',25),(1043,'YOTOCO','76890',25),(1044,'YUMBO','76892',25),(1045,'ZARZAL','76895',25),(1046,'ARAUCA','81001',26),(1047,'ARAUQUITA','81065',26),(1048,'CRAVO NORTE','81220',26),(1049,'FORTUL','81300',26),(1050,'PUERTO RONDON','81591',26),(1051,'SARAVENA','81736',26),(1052,'TAME','81794',26),(1053,'YOPAL','85001',27),(1054,'AGUAZUL','85010',27),(1055,'CHAMEZA','85015',27),(1056,'HATO COROZAL','85125',27),(1057,'LA SALINA','85136',27),(1058,'MANI','85139',27),(1059,'MONTERREY','85162',27),(1060,'NUNCHIA','85225',27),(1061,'OROCUE','85230',27),(1062,'PAZ DE ARIPORO','85250',27),(1063,'PORE','85263',27),(1064,'RECETOR','85279',27),(1065,'SABANALARGA','85300',27),(1066,'SACAMA','85315',27),(1067,'SAN LUIS DE PALENQUE','85325',27),(1068,'TAMARA','85400',27),(1069,'TAURAMENA','85410',27),(1070,'TRINIDAD','85430',27),(1071,'VILLANUEVA','85440',27),(1072,'MOCOA','86001',28),(1073,'COLON','86219',28),(1074,'ORITO','86320',28),(1075,'PUERTO ASIS','86568',28),(1076,'PUERTO CAICEDO','86569',28),(1077,'PUERTO GUZMAN','86571',28),(1078,'LEGUIZAMO','86573',28),(1079,'SIBUNDOY','86749',28),(1080,'SAN FRANCISCO','86755',28),(1081,'SAN MIGUEL','86757',28),(1082,'SANTIAGO','86760',28),(1083,'VALLE DEL GUAMUEZ','86865',28),(1084,'VILLAGARZON','86885',28),(1085,'SAN ANDRES','88001',29),(1086,'PROVIDENCIA','88564',29),(1087,'LETICIA','91001',30),(1088,'EL ENCANTO','91263',30),(1089,'LA CHORRERA','91405',30),(1090,'LA PEDRERA','91407',30),(1091,'LA VICTORIA','91430',30),(1092,'MIRITI - PARANA','91460',30),(1093,'PUERTO ALEGRIA','91530',30),(1094,'PUERTO ARICA','91536',30),(1095,'PUERTO NARIÃƒâ€˜O','91540',30),(1096,'PUERTO SANTANDER','91669',30),(1097,'TARAPACA','91798',30),(1098,'INIRIDA','94001',31),(1099,'BARRANCO MINAS','94343',31),(1100,'MAPIRIPANA','94663',31),(1101,'SAN FELIPE','94883',31),(1102,'PUERTO COLOMBIA','94884',31),(1103,'LA GUADALUPE','94885',31),(1104,'CACAHUAL','94886',31),(1105,'PANA PANA','94887',31),(1106,'MORICHAL','94888',31),(1107,'SAN JOSE DEL GUAVIARE','95001',32),(1108,'CALAMAR','95015',32),(1109,'EL RETORNO','95025',32),(1110,'MIRAFLORES','95200',32),(1111,'MITU','97001',33),(1112,'CARURU','97161',33),(1113,'PACOA','97511',33),(1114,'TARAIRA','97666',33),(1115,'PAPUNAUA','97777',33),(1116,'YAVARATE','97889',33),(1117,'PUERTO CARREÃƒâ€˜O','99001',34),(1118,'LA PRIMAVERA','99524',34),(1119,'SANTA ROSALIA','99624',34),(1120,'CUMARIBO','99773',34);
/*!40000 ALTER TABLE `tipomunicipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES (1,'Profesional',1),(2,'Auxiliar administrativo',1),(3,'Profesional especializado',1),(5,'Administrador',1),(6,'Externo',1);
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tomadormuestraaccion`
--

DROP TABLE IF EXISTS `tomadormuestraaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tomadormuestraaccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `tipoaccion_id` int(11) DEFAULT NULL,
  `formato_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipoaccion_id` (`tipoaccion_id`),
  KEY `formato_id` (`formato_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `tomadormuestraaccion_ibfk_2` FOREIGN KEY (`tipoaccion_id`) REFERENCES `tipoaccion` (`id`),
  CONSTRAINT `tomadormuestraaccion_ibfk_3` FOREIGN KEY (`formato_id`) REFERENCES `formato` (`id`),
  CONSTRAINT `tomadormuestraaccion_ibfk_4` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tomadormuestraaccion`
--

LOCK TABLES `tomadormuestraaccion` WRITE;
/*!40000 ALTER TABLE `tomadormuestraaccion` DISABLE KEYS */;
INSERT INTO `tomadormuestraaccion` VALUES (26,1,1,137),(27,21,2,137),(28,23,3,137),(29,1,1,138),(30,21,2,138),(31,23,3,138),(32,1,1,139),(33,21,2,139),(34,21,3,139),(35,1,1,143),(36,21,2,143),(37,22,3,143),(38,1,1,144),(39,21,2,144),(40,22,3,144),(42,1,1,145),(43,1,1,146),(44,21,2,146),(45,23,2,146),(46,22,2,146);
/*!40000 ALTER TABLE `tomadormuestraaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad`
--

DROP TABLE IF EXISTS `unidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad`
--

LOCK TABLES `unidad` WRITE;
/*!40000 ALTER TABLE `unidad` DISABLE KEYS */;
INSERT INTO `unidad` VALUES (1,'Ã‚ÂºC',1),(2,'mg G y A/l',1),(3,'mgCaCO3/l',1),(4,'mgCa/l',1),(5,'mgC/L',1),(6,'mgCL2/l',1),(7,'mgCL-/l',1),(8,'mgCr+6/l',1),(9,'mgAL/l',1),(10,'mgO2/l',1),(11,'mgFe/l',1),(12,'mg SAAM/l',1),(13,'mgCaCO3/l',1),(14,'mgF-/l',1),(15,'mgPO4/l',1),(16,'mgP/l',1),(17,'mgN-NO3/l',1),(18,'mgN-NO2/l',1),(19,'mgNH4/l',1),(20,'mgN- NH4/l',1),(21,'mgSDT/l',1),(22,'mlSSed/l',1),(23,'mgSS/l',1),(24,'mgSSV/l',1),(25,'mgST/l',1),(26,'mgSO4/l',1),(27,'Microorganismos /100cmÃ‚Â³',1),(28,'NTU',1),(29,'UPC',1),(30,'Ã‚ÂµS/cm',1),(31,'Ooquistes ',1),(32,'Cryptosporidium/10l',1),(33,'Quistes Giardia / 10l',1),(34,'mgMg/l',1),(35,'UFC//100cmÃ‚Â³',1),(36,'Unidades de pH',1),(37,'SM 5520D',1),(38,'SM 2310 B',1),(39,'Unidades de pH',1),(40,'Ooquistes Cryptosporidium/10l',1),(41,'Quistes Giardia / 10l',1),(42,'Quistes Giardia / 10l',1),(43,'mgSTV/l',1);
/*!40000 ALTER TABLE `unidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombrecompleto` varchar(200) DEFAULT NULL,
  `cedula` varchar(45) DEFAULT NULL,
  `clave` varchar(45) DEFAULT NULL,
  `sesionabierta` int(11) DEFAULT NULL,
  `tipousuario_id` int(11) NOT NULL,
  `estomador` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_tipousuario1_idx` (`tipousuario_id`),
  CONSTRAINT `fk_usuario_tipousuario1` FOREIGN KEY (`tipousuario_id`) REFERENCES `tipousuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'CHRISTIAN DARIO LUNA SANTANDER','888','888',0,1,'S'),(19,'EMPOPASTO','900','900',0,6,'N'),(20,'ALCALDIA DE CHACHAGUI','12344','12344',0,6,'N'),(21,'MARIBEL MARTINEZ','999','999',NULL,2,'S'),(22,'VIVIAN ARTURO CANAL','666','666',NULL,5,'S'),(23,'SOFIA GUZMAN','555','555',NULL,5,'S'),(24,'oscar','900900900','900900900',NULL,5,NULL),(26,'pablo','120','120',NULL,5,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariomodulo`
--

DROP TABLE IF EXISTS `usuariomodulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuariomodulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modulo_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuariomodulo_modulo1_idx` (`modulo_id`),
  KEY `fk_usuariomodulo_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_usuariomodulo_modulo1` FOREIGN KEY (`modulo_id`) REFERENCES `modulo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuariomodulo_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariomodulo`
--

LOCK TABLES `usuariomodulo` WRITE;
/*!40000 ALTER TABLE `usuariomodulo` DISABLE KEYS */;
INSERT INTO `usuariomodulo` VALUES (1,1,1),(2,2,1),(3,3,1),(30,3,19),(31,4,19),(32,3,20),(33,4,20),(35,1,24),(36,2,24),(37,3,24),(38,4,24),(43,1,26),(44,2,26),(45,3,26),(46,1,21),(47,3,21);
/*!40000 ALTER TABLE `usuariomodulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarioopcion`
--

DROP TABLE IF EXISTS `usuarioopcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarioopcion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opcionmodulo_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuarioopcion_opcionmodulo1_idx` (`opcionmodulo_id`),
  KEY `fk_usuarioopcion_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_usuarioopcion_opcionmodulo1` FOREIGN KEY (`opcionmodulo_id`) REFERENCES `opcionmodulo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarioopcion_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarioopcion`
--

LOCK TABLES `usuarioopcion` WRITE;
/*!40000 ALTER TABLE `usuarioopcion` DISABLE KEYS */;
INSERT INTO `usuarioopcion` VALUES (1,1,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(25,12,1),(26,13,1),(53,8,19),(54,11,19),(55,8,20),(56,11,20),(57,5,21),(58,1,24),(59,3,24),(60,4,24),(61,5,24),(62,6,24),(63,7,24),(64,8,24),(65,9,24),(66,10,24),(67,11,24),(68,12,24),(69,13,24),(81,1,26),(82,3,26),(83,4,26),(84,5,26),(85,6,26),(86,7,26),(87,8,26),(88,9,26),(89,10,26),(90,12,26),(91,13,26),(92,1,21),(93,7,21),(94,8,21),(95,9,21);
/*!40000 ALTER TABLE `usuarioopcion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-07  9:00:14
