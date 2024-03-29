-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: store
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Pneus'),(2,'Pi├¿ces auto'),(3,'Equipements et entretien'),(4,'V├®lo ├®lectrique, moto');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `id_category` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Pneu MICHELIN PRIMACY 4+ 205/55 R16 91 V','Le pneu MICHELIN Primacy 4+ est le profil ├®t├® de la marque Michelin excellent en s├®curit├® faite pour durer.\nExcellentes performances en freinage sur sol mouill├® du premier au dernier kilom├¿tre gr├óce aux technologies Evergrip. Gr├óce ├á une nouvelle sculpture orient├®e s├®curit├®, m├¬me us├®, le pneu MICHELIN Primacy 4+ assure un haut niveau d\'├®vacuation de l\'eau.',93.90,12,1),(2,'Pneu MICHELIN ALPIN 6 185/65 R15 88 T',' L\'Alpin 6 est le nouveau profil tourisme hiver de MICHELIN, il est destin├® aux berlines et citadines.',83.50,16,1),(3,'Batterie NORAUTO BV13 70 Ah - 640 A','LA batterie auto sert ├á d├®marer sa voiture, ainsi qu\'a alimenter en ├®lectricit├® les diff├®rents ├®l├®ments ├®lectriques (phares...) et ├®lectroniques (autoradio...). Au moment de choisir sa batterie, il est n├®cessaire de prendre en compte la taille de la batterie, sa puissance, ainsi que la tension.\nFabriqu├®e par un ├®quipementier d\'origine, elle est pr├¬te ├á l\'emploi.\nLa gamme couvre aujourd\'hui la quasi-totalit├® des v├®hicules actuels.',119.99,8,2),(4,'2 balais d\'essuie-glace BOSH Clearview 455V 650/400 mm','En assurant une bonne visibilit├® par tous les temps, les balais d\'essuie-glace sont un ├®l├®ment essentiel de la s├®curit├® du v├®hicule. Des essuie-glaces en mauvais ├®tat r├®duisent le champ de vision et peuvent endommager le pare-brise.',39.99,7,2),(5,'Moufle gratte-givre NORAUTO bleu','La moufle gratte-givre NORAUTO est l\'accessoire indispensable lorsque les vitres sont recouvertes de givre.\nEn effet, la moufle en plyester, rembour├®e et r├®sisante ├á l\'eau vous permettra de retirer le givre de vos votres tout en gardant vos mains au chaud et au sec, procurant un confort incomparable face aux grattes-givre classiques. Resserr├®e au poignet, la protection est optimale contre les projections.',4.99,23,3),(6,'Rehausseur avec dossier NORAUTO IMAX Groupes 2/3','Avec son dossier ├®lev├® et son large si├¿ge monobloc, le rehausseur NORAUTO garantit un maximum de s├®curit├® et de confort pour votre enfant. Il dispose d\'un appuie-t├¬te r├®glable en hauteur avec des coussins int├®gr├®s qui prot├¿gent contre les chocs lat├®raux. De plus, il est ├®quip├® d\'un guide de ceinture de s├®curit├® qui vous permet d\'utiliser 3 points d\'ancrage de ceinture de s├®curit├® dans votre v├®hicule. Remplie de mousse ultra-confortable et ultra-├®paisse, la housse du si├¿ge, du dossier et de l\'accoudoir donne un look haut de gamme ├á ces rehausseurs NORAUTO. Il est d├®tachable, donc facile ├á nettoyer.',84.99,5,3),(7,'V├®lo ├®lectrique de ville WAYSCRAL Everyway E450 28\" T48 Bosch ActiveLine plus','Le v├®lo de ville ├®lectrique WAYSCRAL Everyway E450 28\" Bleu est le v├®lo le plus ├®quip├® de la gamme.\nCe v├®lo de ville est id├®al pour vous amener au travail tous les matins et rentrer chez vous le soir. Il dispose de 60 ├á 80 km d\'autonomie selon votre vitesse gr├óce ├á son moteur central p├®dalier BoOSCH Active Plus de 250 W et 50 Nm de couple ainsi que d\'une batterie BOSCH Power Tube 396 Wh.',1999.00,10,4),(8,'Casque moto modulable WAYSCRAL Evolve Vision taille M Jaune','Certifi├® sous la nouvelle norme ECE 22.06, la protection de ce casque est ├á la pointe de l\'innovation. Ce modulable dispose de toutes les options possibles en termes de confort; ventilation, visi├¿re solaire, mentonni├¿re mobile et emplacements pour lunettes de vue.\nC\'est un casque pens├® pour un usage polyvalent, de la longue route aux petits trajets du quotidien. Sa mentonni├¿re mobile vous conf├¿re un confort optimal sur des trajets courts, et une protection accrue sur les trajets longs.',99.99,9,4);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-31 16:24:16
