CREATE DATABASE  IF NOT EXISTS `serviceorder` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `serviceorder`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: serviceorder
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `equipamento`
--

DROP TABLE IF EXISTS `equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipamento` (
  `idequipamento` int NOT NULL AUTO_INCREMENT,
  `tipo_equipamento` varchar(45) NOT NULL,
  PRIMARY KEY (`idequipamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipamento`
--

LOCK TABLES `equipamento` WRITE;
/*!40000 ALTER TABLE `equipamento` DISABLE KEYS */;
INSERT INTO `equipamento` VALUES (3,'Rafael'),(4,'biricutico');
/*!40000 ALTER TABLE `equipamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local`
--

DROP TABLE IF EXISTS `local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local` (
  `idlocal` int NOT NULL AUTO_INCREMENT,
  `local_manutencao` varchar(45) NOT NULL,
  PRIMARY KEY (`idlocal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local`
--

LOCK TABLES `local` WRITE;
/*!40000 ALTER TABLE `local` DISABLE KEYS */;
/*!40000 ALTER TABLE `local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manutencao`
--

DROP TABLE IF EXISTS `manutencao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manutencao` (
  `idmanutencao` int NOT NULL AUTO_INCREMENT,
  `tipo_manutencao` varchar(45) NOT NULL,
  PRIMARY KEY (`idmanutencao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manutencao`
--

LOCK TABLES `manutencao` WRITE;
/*!40000 ALTER TABLE `manutencao` DISABLE KEYS */;
/*!40000 ALTER TABLE `manutencao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordemservico`
--

DROP TABLE IF EXISTS `ordemservico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordemservico` (
  `idOrdemServico` int NOT NULL AUTO_INCREMENT,
  `manutencao_idmanutencao` int NOT NULL,
  `equipamento_idequipamento` int NOT NULL,
  `local_idlocal` int NOT NULL,
  `servico_idservico` int NOT NULL,
  `usuarios_idusuarios` int NOT NULL,
  `primeira_manutencao` varchar(45) NOT NULL,
  `proxima_manutencao` varchar(45) NOT NULL,
  `periodicidade` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`idOrdemServico`,`manutencao_idmanutencao`,`equipamento_idequipamento`,`local_idlocal`,`servico_idservico`,`usuarios_idusuarios`),
  KEY `fk_OrdemServico_manutencao_idx` (`manutencao_idmanutencao`),
  KEY `fk_OrdemServico_equipamento1_idx` (`equipamento_idequipamento`),
  KEY `fk_OrdemServico_local1_idx` (`local_idlocal`),
  KEY `fk_OrdemServico_servico1_idx` (`servico_idservico`),
  KEY `fk_OrdemServico_usuarios1_idx` (`usuarios_idusuarios`),
  CONSTRAINT `fk_OrdemServico_equipamento1` FOREIGN KEY (`equipamento_idequipamento`) REFERENCES `mydb`.`equipamento` (`idequipamento`),
  CONSTRAINT `fk_OrdemServico_local1` FOREIGN KEY (`local_idlocal`) REFERENCES `mydb`.`local` (`idlocal`),
  CONSTRAINT `fk_OrdemServico_manutencao` FOREIGN KEY (`manutencao_idmanutencao`) REFERENCES `mydb`.`manutencao` (`idmanutencao`),
  CONSTRAINT `fk_OrdemServico_servico1` FOREIGN KEY (`servico_idservico`) REFERENCES `mydb`.`servico` (`idservico`),
  CONSTRAINT `fk_OrdemServico_usuarios1` FOREIGN KEY (`usuarios_idusuarios`) REFERENCES `usuarios` (`idusuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordemservico`
--

LOCK TABLES `ordemservico` WRITE;
/*!40000 ALTER TABLE `ordemservico` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordemservico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico` (
  `idservico` int NOT NULL AUTO_INCREMENT,
  `descricao_servico` varchar(45) NOT NULL,
  PRIMARY KEY (`idservico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idusuarios` int NOT NULL AUTO_INCREMENT,
  `user` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `empresa` varchar(45) NOT NULL,
  `contato` varchar(45) NOT NULL,
  PRIMARY KEY (`idusuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'Rafael','$2a$10$3HqzcuiPwXnB1VoES9OKOeAKqnhgxRgIx7ImrRPAExSZ98RmDoTQm','ADM','Rafael@gmail.com','DEV','(XX) XXXXX-XXXX');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'serviceorder'
--

--
-- Dumping routines for database 'serviceorder'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-22 16:36:32
