
USE `valor`;


Update base_objects set wall = '9' where classname like '%zed_kamenna%' and wall = '1' and id > 0;
Update base_objects set wall = '8' where classname like '%Land_Gate_IndVar2_5%' and wall = '1' and id > 0;
Update base_objects set wall = '10' where classname like '%Land_Hlaska%' and wall = '1' and id > 0;
Update base_objects set wall = '11' where classname like '%Land_GH_Stairs_F%' and wall = '1' and id > 0;


DROP TABLE IF EXISTS `animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classname` varchar(256) NOT NULL,
  `pos` varchar(50) NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `parent1` int(10) DEFAULT NULL,
  `parent2` int(10) DEFAULT NULL,
  `alive` tinyint(1) DEFAULT '1',
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=372 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animals`
--

LOCK TABLES `animals` WRITE;
/*!40000 ALTER TABLE `animals` DISABLE KEYS */;
INSERT INTO `animals` VALUES (359,'\"valor_Sheep_random_F\"','\"[[0.573083,0.0390982,42.7861],356.099]\"','2019-12-14 21:24:36',NULL,NULL,1,'2019-12-15 14:38:42'),(360,'\"valor_Goat_random_F\"','\"[[7674.39,7901.77,0.192841],54.4423]\"','2019-12-14 21:24:36',NULL,NULL,1,'2019-12-14 23:34:28'),(361,'\"valor_Hen_random_F\"','\"[[4082.95,8188.38,-0.00335693],112.231]\"','2019-12-14 21:24:36',NULL,NULL,1,'2019-12-15 14:38:42'),(362,'\"dbo_horse_dark\"','\"[[4639.7,2954.51,0.000152588],226.752]\"','2019-12-14 21:24:36',NULL,NULL,1,'2019-12-15 13:58:04'),(363,'\"valor_Sheep_random_F\"','\"[[1.12508,0.157062,0.00675201],0]\"','2019-12-14 21:31:16',NULL,NULL,1,'2019-12-15 14:38:42'),(364,'\"valor_Goat_random_F\"','\"[[-1.04503,-0.0841176,0.060791],0]\"','2019-12-14 21:31:16',NULL,NULL,1,'2019-12-14 23:27:18'),(365,'\"valor_Hen_random_F\"','\"[[9031.46,13993.4,-0.00157928],218.961]\"','2019-12-14 21:31:16',NULL,NULL,1,'2019-12-15 14:38:42'),(366,'\"dbo_horse_dark\"','\"[[1848.28,10956.1,-0.0093689],2.51197]\"','2019-12-14 21:31:16',NULL,NULL,1,'2019-12-15 14:38:42'),(367,'\"valor_Goat_random_F\"','\"[[0,0,0.0624275],0]\"','2019-12-14 21:41:41',360,364,1,'2019-12-14 23:27:18'),(368,'\"valor_Goat_random_F\"','\"[[-0.522576,0.0412785,0.0625725],0]\"','2019-12-14 21:42:41',360,364,1,'2019-12-14 23:27:18'),(369,'\"valor_Goat_random_F\"','\"[[8502.45,9215.54,0.124023],254.904]\"','2019-12-14 21:43:41',360,364,1,'2019-12-14 23:27:18'),(370,'\"valor_Goat_random_F\"','\"[[7551.14,8775.4,0.0919189],44.8171]\"','2019-12-14 21:44:41',360,364,1,'2019-12-14 23:27:18'),(371,'\"valor_Goat_random_F\"','\"[[3440.73,9771.68,-0.00131226],286.514]\"','2019-12-14 21:47:41',360,364,1,'2019-12-15 14:38:42');
/*!40000 ALTER TABLE `animals` ENABLE KEYS */;
UNLOCK TABLES;


Update animals set alive = '0' where id > 0;