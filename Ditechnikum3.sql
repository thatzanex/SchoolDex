-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: digitechnikum
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `class_idx` int NOT NULL AUTO_INCREMENT,
  `classname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `class_of` int DEFAULT NULL,
  `classteacher` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mathteacher` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `germanteacher` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hisoryteacher` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `peTeacher` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `englishTeacher` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `musicTeacher` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `artsTeacher` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`class_idx`),
  KEY `classteach_idx` (`classteacher`),
  KEY `mathclass_idx` (`mathteacher`),
  KEY `germanteach_idx` (`germanteacher`),
  KEY `historyteach_idx` (`hisoryteacher`),
  KEY `peteach_idx` (`peTeacher`),
  KEY `englishteach_idx` (`englishTeacher`),
  KEY `musicteach_idx` (`musicTeacher`),
  KEY `artsteach_idx` (`artsTeacher`),
  CONSTRAINT `artsteach` FOREIGN KEY (`artsTeacher`) REFERENCES `teacher` (`abbrevation`),
  CONSTRAINT `classteach` FOREIGN KEY (`classteacher`) REFERENCES `teacher` (`abbrevation`),
  CONSTRAINT `englishteach` FOREIGN KEY (`englishTeacher`) REFERENCES `teacher` (`abbrevation`),
  CONSTRAINT `germanteach` FOREIGN KEY (`germanteacher`) REFERENCES `teacher` (`abbrevation`),
  CONSTRAINT `historyteach` FOREIGN KEY (`hisoryteacher`) REFERENCES `teacher` (`abbrevation`),
  CONSTRAINT `mathclass` FOREIGN KEY (`mathteacher`) REFERENCES `teacher` (`abbrevation`),
  CONSTRAINT `musicteach` FOREIGN KEY (`musicTeacher`) REFERENCES `teacher` (`abbrevation`),
  CONSTRAINT `peteach` FOREIGN KEY (`peTeacher`) REFERENCES `teacher` (`abbrevation`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'5a',2021,'Kle','Kle','Zie','Neu','Kle','Cer','Kle','Frk'),(2,'5b',2021,'Frk','Fou','Kni','Klu','Cer','Zie','Fou','Klu'),(3,'5c',2021,'Amb','Zie','Zie','Kni','Gab','Frk','Klu','Seh'),(4,'5d',2021,'Gab','Neu','Kni','Frk','Neu','Cer','Neu','Seh'),(5,'6a',2020,'Cer','Fou','Gab','Fou','Zie','Gab','Frk','Fou'),(6,'6b',2020,'Kni','Seh','Kni','Frk','Gab','Neu','Zie','Klu'),(7,'6c',2020,'Klu','Kni','Frk','Neu','Fou','Frk','Cer','Kle'),(8,'6d',2020,'Frk','Amb','Neu','Gab','Seh','Seh','Frk','Kni'),(9,'7a',2019,'Amb','Zie','Gab','Neu','Cer','Zie','Gab','Frk'),(10,'7b',2019,'Klu','Neu','Cer','Amb','Gab','Neu','Neu','Kle'),(11,'7c',2019,'Cer','Kle','Klu','Kni','Neu','Gab','Neu','Fou'),(12,'7d',2019,'Neu','Amb','Zie','Zie','Seh','Fou','Neu','Kle'),(13,'8a',2018,'Fou','Kni','Cer','Zie','Gab','Seh','Kle','Klu'),(14,'8b',2018,'Amb','Seh','Kle','Gab','Zie','Kle','Cer','Frk'),(15,'8c',2018,'Kle','Amb','Kle','Fou','Amb','Kni','Klu','Frk'),(16,'8d',2018,'Fou','Zie','Seh','Seh','Neu','Amb','Kle','Kni'),(17,'9a',2017,'Zie','Gab','Frk','Zie','Klu','Kle','Seh','Klu'),(18,'9b',2017,'Seh','Neu','Fou','Frk','Cer','Cer','Frk','Cer'),(19,'9c',2017,'Neu','Frk','Gab','Cer','Amb','Klu','Klu','Seh'),(20,'9d',2017,'Klu','Gab','Cer','Amb','Frk','Fou','Seh','Klu');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nachhilfe`
--

DROP TABLE IF EXISTS `nachhilfe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nachhilfe` (
  `helpId` int NOT NULL AUTO_INCREMENT,
  `schüler_id` int DEFAULT NULL,
  `Text` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Fach` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Klassen` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`helpId`),
  KEY `tutor_idx` (`schüler_id`),
  CONSTRAINT `tutor` FOREIGN KEY (`schüler_id`) REFERENCES `student` (`idStudent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nachhilfe`
--

LOCK TABLES `nachhilfe` WRITE;
/*!40000 ALTER TABLE `nachhilfe` DISABLE KEYS */;
/*!40000 ALTER TABLE `nachhilfe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `newsId` int NOT NULL AUTO_INCREMENT,
  `Lehrer` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Fach` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Inhalt` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`newsId`),
  UNIQUE KEY `newsId_UNIQUE` (`newsId`),
  KEY `writer_idx` (`Lehrer`),
  CONSTRAINT `writer` FOREIGN KEY (`Lehrer`) REFERENCES `teacher` (`abbrevation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'KLE','Fach','Inhalt'),(2,'ZIE',NULL,NULL),(3,'KLU',NULL,NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `idStudent` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `secondName` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `class` int DEFAULT NULL,
  PRIMARY KEY (`idStudent`),
  UNIQUE KEY `idStudent_UNIQUE` (`idStudent`),
  KEY `pupil_idx` (`class`),
  CONSTRAINT `pupil` FOREIGN KEY (`class`) REFERENCES `class` (`class_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Ben','Johnson','B.Johnson@gmail.com',1),(2,'Mya','Jeferson','Mya.Jeferson@mail.de',1),(3,'bernd','Hofstadter','bernd.Hofstadter@gmail.com',2),(4,'Helen','Keller','Helen.Keller@gmail.com',2),(5,'Anis','Fischer','Anis.Fischer@gmail.com',3),(6,'Claire','Renken','Claire.Renken@gmail.com',3),(7,'Amelie','Strenz','Amelie.Strenz@yahoo.com',4),(8,'Carla','Corales','Carla.Corales@web.de',4),(9,'Justin','West','Justin.West@grb.de',5),(10,'Micheal','Chaimy','Micheal.Chaimy@gmail.com',5),(11,'Will','Wheaton','Will.Wheaton@gmail.com',6),(12,'Stuart','Bloom','Stuart.Bloom@gmail.com',6),(13,'Penny','Fowler','Penny.Fowler@gmailo.com',7),(14,'Howard','Wolowitz','Howard.Wolowitz@gmail.com',7),(15,'Bernadette','Rostenkowski','Bernadette.Rostenkowski@gmail.com',8),(16,'Jonah','Finster','Jonah.Finster@gmail.com',8),(17,'Mattes ','Meier','Mattes.Meier@gmail.com',9),(18,'Josefina','Trapp','J.Trapp@gmail.com',9),(19,'Natasha ','Romanov','Natasha.Romanov@gmail.com',10),(20,'Christina','Alguira','Christina.Alguira@gmail.com',10),(21,'David','Hasselhof','David.Hasselhof@gmail.com',11),(22,'Freddie ','Mercury','Queens@gmail.com',11),(23,'Natahalie','Portmann','Nathalie.Portman@gmail.com',12),(24,'Sarah','Conner','Sarah.Conner@gmail.com',12),(25,'Bruce','Banner','Bruce.Banner@gmail.com',13),(26,'Lex','Luther','Lex.Luther@gmail.com',13),(27,'Nelson','Mandela','Nelson.mandela@gmail.com',14),(28,'Mariah','Carey','Mariah.Carey@gmail.com',14),(29,'Elisabeth','Windsor','Magesty@gmail.coim',15),(30,'Bilie','Eilish','Bilie.Eilish@gmail.com',15),(31,'Micheal','Jackson','Micheal.Jackson@gmail.com',16),(32,'Selena','Gomes','Selena.Gomes@gmail.com',16),(33,'Stephanie','Mendel','Stephanie.Mendel@gmail.com',17),(34,'Padme','Amidala','Padme.Amidala@naboo.com',17),(35,'Anakin ','Skywalker','Ani.Skywalker@jedi.com',18),(36,'Obi-wan','Kenobi','Obi.Kenobi@jedi.com',18),(37,'Bill','Gates','Bill.Gates@mc.com',19),(38,'Mace','Windu','Mace.Windu@jedi.com',19),(39,'Asoka','Tarnow','Asoka.Tarnow@gmail.com',20),(40,'Savage','Ventress','Savage.Ventress@sith.com',20);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `abbrevation` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `firstName` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `secondName` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `t_email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`abbrevation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('Amb','Detleff','Amberg','Detleff.Amberg@mail.de'),('Cer','Thorsten','Cerny','Th.Cerny@yahoo.com'),('Fou','Amy','Foulien','Amy.Foulien@geb.de'),('Frk','Elaine','Frickler','Elaine_frickler@gmail.com'),('Gab','Albert','Gabler','Albert_Gabler@outlook.com'),('Kle','Johanna','Klemberg','Johanna.K@gmail.com'),('Klu','Steffan','Kluge','S.Kluge@web.de'),('Kni','Hans','Knittel','H.Knittel@yahoo.com'),('Neu','Mark','Neumeier','Mark.neu@gmail.com'),('Seh','Mila','Seher','Mila.Seher@gmail.com'),('Zie','Hannah','Ziegler','Hannah.Ziegler@grb.de');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-14 15:47:11
