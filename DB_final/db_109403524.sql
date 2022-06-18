CREATE DATABASE  IF NOT EXISTS `macbookpro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `macbookpro`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 140.115.81.225    Database: macbookpro
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name_UNIQUE` (`category_name`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (4,'地方創生'),(10,'攝影'),(3,'教育'),(9,'新春賀喜'),(7,'時尚'),(1,'科技'),(5,'空間'),(2,'遊戲'),(8,'音樂'),(6,'飲食');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `member_id` int DEFAULT NULL,
  `user_comment` varchar(255) NOT NULL,
  `proposer_response` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_comment_member1_idx` (`member_id`),
  KEY `fk_comment_proposal1_idx` (`proposal_id`),
  CONSTRAINT `fk_comment_member1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_comment_proposal1` FOREIGN KEY (`proposal_id`) REFERENCES `proposal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,5,9,'不好意思，我的贊助編號是P108681B 想問一下什麼時候會收到呢～！ 感謝','您好，禮盒已經送出，和豐店到店，應該已經抵達喔～ 感謝您對募資計畫的支持喔～ :)','2022-02-07 03:29:33'),(2,1,10,'GoPlus 已更新連線方式，你們還支援24小時不斷線嗎','丹尼的影片 1 : 40 秒有講解如何連線 GoPlus 功能喔～','2022-06-06 03:29:33'),(3,1,3,'請問當寶可夢執行背景應用程式or手機休眠時，247還會持續運作抓怪轉牌嗎?','','2022-06-12 03:29:33'),(4,5,4,'讚！！每日寫日記','太棒了，歡迎在我們FB粉絲頁跟大家分享喔～','2022-02-02 03:29:33'),(5,4,8,'加油！你的作品很有特色，如果size再完整一些，單價低一些應該很有市場的！','謝謝您的支持與鼓勵！！','2022-04-25 03:51:33'),(6,10,1,'上次短褲沒跟到，這次上衣短褲共下買。','謝謝您的支持 : )','2022-05-16 04:59:56'),(7,1,2,'我多訂一個能退嘛','要請您寄一封信到 support@zeczec.com','2022-06-08 10:29:33'),(8,2,6,'請問軟糖保存期限多久呢？因為同事都是垃圾讓人很需要囤貨 :)','您好，保存期限是一年喔！希望可以陪你平靜渡過被垃圾氣到不行的每一天 :)','2022-04-18 03:34:33'),(9,1,7,'有機會可以早點出貨嗎？6/1要等很久','','2022-01-10 09:18:20'),(10,3,1,'請問留言tag兩個人的活動我不小心讓他的網頁跳出來該怎麼再操作一次，謝謝。','您好！已另外傳送嘖嘖站內信給您，再請查收','2022-03-08 03:29:33');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `last_editor_id` int DEFAULT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_faq_proposal1_idx` (`proposal_id`),
  KEY `fk_faq_member1_idx` (`last_editor_id`),
  CONSTRAINT `fk_faq_member1` FOREIGN KEY (`last_editor_id`) REFERENCES `member` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_faq_proposal1` FOREIGN KEY (`proposal_id`) REFERENCES `proposal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES (1,4,8,'要如何下單？','先點擊想要贊助的方案之後，照著以下步驟 1、選擇您想要「信用卡付款」或是「ATM轉帳」2、選擇您要宅配或是超商取貨，並輸入對應的收件資訊 3、確認贊助人資訊，並按下立刻付款。 4、之後會根據付款方式給您相關的付款資料 5、付款後回到嘖嘖頁面，點選右上角選單的贊助紀錄，就可以確認剛剛是否付款成功囉！','2022-06-12 06:43:16'),(2,4,8,'請問何時會出貨？','預計於2022年7月初開始依訂單編號陸續出貨。','2022-06-12 06:43:16'),(3,1,7,'請問有什麼需要注意的呢？','由於新品PVC材質，於生產完成即封裝寄送，初次開啟會有些許味道屬於正常，收到後可先打開放置通風處即可消除。若有需清潔，可用中性清潔劑清洗乾淨並完全晾乾，切勿長時間曝曬於太陽下。 ','2022-06-12 06:43:16'),(4,2,6,'有多入之大宗採購需求該怎麼做？','歡迎加入LINE@好友搜尋「@550yisos」，將會有專人與您接洽喔！','2022-06-12 06:43:16'),(5,7,3,'付款方式有哪些？','目前開放ATM、信用卡。','2022-06-12 06:43:16'),(6,3,4,'可以用信用卡分期嗎？','【台灣的募資平台因應政府規定，均沒有提供分期付款的功能】不過，持卡者如果想以自己信卡來做【分期付款】這樣是可以的。但是，這樣就會有分期利率手續費的衍生（相關利率依每家銀行規範為準）所以，想要以分期付款的朋友，請你先與你持卡銀行確認相關資訊。','2022-06-12 06:43:16'),(7,10,1,'十月才能收到商品嗎？','事實上如果不受疫情或戰爭的影響~八月就能出貨了！目前確定八月最少可以出100組~先下單先拿到喔','2022-06-12 06:43:16'),(8,6,4,'有使用說明嗎?','請至粉絲專頁~魔術吸管~參考一下喔~','2022-06-12 06:43:16'),(9,6,4,'是否有分男女版型呢 ?','我們的版型皆為中性版型，中性版是男女皆適合喔！','2022-06-12 06:43:16'),(10,5,9,'可否寄送到國外？','目前我們的商品可以寄送到下列地區：香港(運費$250) / 澳門(運費$250) / 中國(運費$250) / 美國(運費$800) / 日本(運費$600)','2022-06-12 06:43:16');
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `following_record`
--

DROP TABLE IF EXISTS `following_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `following_record` (
  `proposal_id` int NOT NULL,
  `member_id` int NOT NULL,
  PRIMARY KEY (`proposal_id`,`member_id`),
  UNIQUE KEY `uq_following_record1` (`proposal_id`,`member_id`),
  KEY `fk_following_record_member1_idx` (`member_id`),
  KEY `fk_following_record_proposal1_idx` (`proposal_id`),
  CONSTRAINT `fk_following_record_member1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_following_record_proposal1` FOREIGN KEY (`proposal_id`) REFERENCES `proposal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `following_record`
--

LOCK TABLES `following_record` WRITE;
/*!40000 ALTER TABLE `following_record` DISABLE KEYS */;
INSERT INTO `following_record` VALUES (3,1),(10,1),(1,2),(1,3),(5,4),(2,6),(1,7),(4,8),(6,9),(1,10);
/*!40000 ALTER TABLE `following_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'毛若穎','0921003614','in.consequat@yahoo.com','0oplfZ16tyLX','366 苗栗縣銅鑼鄉民權路31號'),(2,'林芳岑','0988008346','adipiscing.enim.mi@outlook.com','7gB%z9Svg8EW','600 嘉義市東區世賢路24號'),(3,'胡素芝','0922830125','nullam.velit@yahoo.com','JJQF0j%tkx3i','325 桃園市龍潭區淮子埔一路29號'),(4,'童雅婷','0958351743','sed.auctor@hotmail.com','Rv$uGmL&C!%g','540 南投縣南投市三和一路14號'),(5,'賴麗萍','0912587773','sagittis.nullam@google.com','XcZg6Be^cU2y','508 彰化縣和美鎮潭北路15號'),(6,'黃志斌','0960105109','nec.leo.morbi@protonmail.com','aZjy*GvZt@s*','711 臺南市歸仁區崙頂二街11號'),(7,'廖松白','0961749001','sociosqu.ad@yahoo.com','j8tI5!wG88PM','411 臺中市太平區北田路14號'),(8,'徐嘉柏','0928735721','proin.non@protonmail.com','n7UDOe0uspZk','801 高雄市前金區自立二路18號'),(9,'李麗珠','0968169143','arcu.vel.quam@hotmail.com','wlmM33nAD@SR','201 基隆市信義區義四路22號'),(10,'施泓音','0970691667','dui.quis.accumsan@google.com','&@^ODhk0MH&l','622 嘉義縣大林鎮早知31號');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_credential`
--

DROP TABLE IF EXISTS `member_credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_credential` (
  `member_id` int NOT NULL,
  `hashed_pwd_string` varchar(64) NOT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `member_id_UNIQUE` (`member_id`),
  KEY `fk_MemberCredential_Member_idx` (`member_id`),
  CONSTRAINT `fk_MemberCredential_Member` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_credential`
--

LOCK TABLES `member_credential` WRITE;
/*!40000 ALTER TABLE `member_credential` DISABLE KEYS */;
INSERT INTO `member_credential` VALUES (1,'5459ffea690882061cfa56fa9033278370e48de356c700637aad68d14f2ae0ae'),(2,'07703ba76ae595a212c8317146fb292fb773f34314a3708a6f3e916bbf6e499c'),(3,'1caf7cfa34bdb90fd7a332dfed5a5e0d1a153d6a164234aa98b7ba611b83abe7'),(4,'ea8ced964d6826e1eede67dccaea05e543e4bcf84ff06d6af8f7877413a91538'),(5,'7a09363a667de652e1666b0810219bb7886036dca13af909cd755c80df946365'),(6,'ccd108b762527fcdcdb8c5b6cad6480e9b81a5d92f29e6793d6865b274bc50dc'),(7,'a5c5e74448987538a8bffda3518f59e2f3785cf460d4f882a2c563af654fe13f'),(8,'1a4c96ddeda1e2bfc16abd7bd6f8a72dc416c10c824747cbe5b1f9cc20671c40'),(9,'e9c59dd5748d8c0be520b37658c8da542720916cc6d7ff627ad2ba0e76237bca'),(10,'5ad2e13f01b6c6597301b4dd8fa5b2a055c6e4245e84f63344f6bbb5c0f3c802');
/*!40000 ALTER TABLE `member_credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal`
--

DROP TABLE IF EXISTS `proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext,
  `amount` int NOT NULL DEFAULT '0',
  `goal` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `viewed_num` int NOT NULL DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `due_date` datetime DEFAULT NULL,
  `is_deactivated` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_proposal_Category1_idx` (`category_id`),
  CONSTRAINT `fk_proposal_Category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal`
--

LOCK TABLES `proposal` WRITE;
/*!40000 ALTER TABLE `proposal` DISABLE KEYS */;
INSERT INTO `proposal` VALUES (1,1,'《 247 Catcher 》｜ 最全面的【抓寶 & 打團】輔助道具','大家好！我們是 PhotoFast 銀箭資訊。今年，我們創造出了一款能符合 Pokemon GO 玩家需求的抓寶利器！不只能突破現有的連線一小時限制，更讓您能夠在打團戰或攻道館時輕鬆應戰！',2393696,100000,2,1150,'2022-04-06 00:00:00','2022-07-05 00:00:00',0),(2,6,'【最後 3 天】台灣首發輕機能舒壓軟糖 ✧ Kimóo 情緒平衡軟糖 ✧ 日本專利「特濃舒壓ＧＡＢＡ」Ｘ「快樂Ｌ色氨酸」，面對再多鳥事也能有平靜好心情！','喜劇演員的起笑配方！募資前百人實測 → 75.8% 有感回饋：「吃了真的有鬆～」——— 你的心累了嗎？\"Not being O.K. is O.K.\" 沒關係，是情緒啊！吃一顆回到內在平靜小宇宙！',377200,200000,2,251,'2022-03-23 00:00:00','2022-06-21 00:00:00',0),(3,3,'數感宇宙探索課程｜為國小生打造的生活數學 DIY 影音學習組｜給孩子一堂不一樣的數學課','本課程結合數感實驗室逾 10 年數學教育經驗、史丹佛大學「成長型數學思維」理論。內容針對國小中年級以上的孩子，強調具體、跨域、手作、情境。鼓勵孩子探索思考，讓孩子愛上數學。',3737138,500000,2,641,'2022-05-04 00:00:00','2022-08-02 00:00:00',0),(4,7,'『Organs without body 2014 S/S 服裝秀』','「ORGANS WITHOUT BODY 」為 藝術家「安地羊 Andy Yen」2012創立之服裝品牌。',5050,100000,3,4,'2013-08-21 00:00:00','2013-11-19 00:00:00',1),(5,4,'x5 Project 台灣茶葉禮盒 | 邀請您一起用45款台灣茶重新認識『在地』','本次募資計畫是由茶品牌 Three Leafs Tea 透過45款茶做為與消費者連結的媒介，結合茶與藝術向世界說台灣。以「人、事、物、學、遊」五個層面介紹清晰易懂的台灣在地文化故事。',852482,50000,3,194,'2021-12-12 00:00:00','2022-03-12 00:00:00',1),(6,5,'樂待STAY 桃園水岸店 on Line 募資企劃-我們讓孩子樂呆 父母樂待','',282244,943038,2,63,'2022-05-25 00:00:00','2022-08-23 00:00:00',0),(7,3,'謎路⼈Way of Puzzle 2022【It\'s All I Have】專輯發⾏企劃','',45651,400000,2,31,'2022-05-23 00:00:00','2022-08-21 00:00:00',0),(8,2,'邏輯解謎｜密室逃脫桌遊 破解古老的秘密','益智解謎新視野，結合密室逃脫與立體拼圖的概念，打造一個全新的益智桌遊。你可以舒適地在家中享受愉快的動腦時光，將大腦發揮至極限。',0,100000,1,0,'2022-03-22 00:00:00','0000-00-00 00:00:00',0),(9,10,'SIRUI 75mm ​變形鏡頭','還停留在變形鏡頭既沉且大的印象中？還以為變形鏡頭是高昂的貴族鏡頭？不！消費級別的變形鏡頭世界早已誕生——思銳1.33X寬銀幕變形鏡頭！目前，思銳已推出24mm/F2.8、35mm/F1.8、50mm/F1.8三個焦段，其以更小的體積、更高的性價比、更強的電影質感，讓大眾影友真正能無負擔地接觸變形鏡頭。',532600,100000,3,200,'2021-07-20 00:00:00','2021-10-18 00:00:00',1),(10,1,'【 HOMI｜地表最強全情境短袖 & EAM 登山防曬衣 】featuring CORDURA fabric / MIT 設計製造！','ㄧ件夏天的短袖可以有什麼不同？CORDURA 柔軟強韌，非塗層物理涼感，抗UV 前所未有的透氣調節，MIT 質感獨家設計製造 # 針對夏天的穿著環境，更舒適的穿著體驗而衍生出 HOMI 的第一件短袖物件 Movement T shirt，利用材料及設計創造出ㄧ件可以在夏日的不同環境下，隨時給你舒適機能與質感外型的短袖！',1556942,100000,3,3148,'2022-05-24 00:00:00','2022-08-22 00:00:00',1);
/*!40000 ALTER TABLE `proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_member`
--

DROP TABLE IF EXISTS `proposal_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposal_member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `member_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_proposal_member1` (`proposal_id`,`member_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_proposal_member_proposal1_idx` (`proposal_id`),
  KEY `fk_proposal_member_member1_idx` (`member_id`),
  CONSTRAINT `fk_proposal_member_member1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_proposal_member_proposal1` FOREIGN KEY (`proposal_id`) REFERENCES `proposal` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_member`
--

LOCK TABLES `proposal_member` WRITE;
/*!40000 ALTER TABLE `proposal_member` DISABLE KEYS */;
INSERT INTO `proposal_member` VALUES (2,1,7),(3,2,6),(5,3,4),(1,4,8),(9,5,9),(8,6,3),(7,6,4),(4,7,3),(10,8,2),(11,9,10),(6,10,1),(12,10,8);
/*!40000 ALTER TABLE `proposal_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_option`
--

DROP TABLE IF EXISTS `proposal_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposal_option` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_proposal_option_proposal1_idx` (`proposal_id`),
  CONSTRAINT `fk_proposal_option_proposal1` FOREIGN KEY (`proposal_id`) REFERENCES `proposal` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_option`
--

LOCK TABLES `proposal_option` WRITE;
/*!40000 ALTER TABLE `proposal_option` DISABLE KEYS */;
INSERT INTO `proposal_option` VALUES (1,1,'247 早鳥超值組',2290,'內容物包含：247 Catcher x 1 自動點擊器 x 1 usb - C 充電線 x 1 專屬收納包 x 1 247 Catcher 說明書 x 1【重要提醒】台灣本島地區免運費，外島地區收額外運費。全球地區皆可寄，運費於結帳時顯示。若需統編請輸入收件資訊時備註。'),(2,3,'單組 體驗初學',1790,'Ａ數學分析／Ｂ邏輯推演／Ｃ策略規劃：３組擇１ '),(3,9,'【好評追加！超早鳥衣褲組合】',3899,'Movement 全情境短T X1 +  Movement 全情境短褲 X1 +  ▲未來售價：5060，現省1161 '),(4,5,'小資支持 12個月每月茶包禮',800,'【感謝禮】回饋您對我們計畫的支持，我們每個月會寄一包茶葉體驗包 + 電子刊物'),(5,10,'75mm 超級早鳥價格',18800,'75mm F1.8 Anamorphic 1.33X Lens X1 '),(6,8,'【 嘖嘖超早鳥優惠 】 未來售價 $1790｜現省300元',1490,'金字塔、諾克斯碉堡、龍之屋（三選一） ×1 款'),(7,6,'x5 Project 台灣茶葉禮盒 | 邀請您一起用45款台灣茶重新認識『在地』',1888,'想參與STAY最有名的親子活動嗎，此為一大一小體驗邀請，歡迎爸媽帶著你的孩子，或是孩子帶著你最愛的爸媽，參加我們90分鐘的專屬親子派對，和我們一起慶祝STAY桃園水岸店的開幕'),(8,7,'【只想聽歌組】',720,'【謎路人 2022 It\'s All I Have】 概念專輯 1張 '),(9,4,'原畫畫作一件10號',15000,'原畫畫作'),(10,2,'【嘖嘖價】1 入 83 折',690,'Kimóo情緒平衡軟糖 1 盒');
/*!40000 ALTER TABLE `proposal_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor_record`
--

DROP TABLE IF EXISTS `sponsor_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsor_record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `proposal_option_id` int NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_sponsor_record_proposal_option1_idx` (`proposal_option_id`),
  KEY `fk_sponsor_record_member1_idx` (`member_id`),
  CONSTRAINT `fk_sponsor_record_member1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_sponsor_record_proposal_option1` FOREIGN KEY (`proposal_option_id`) REFERENCES `proposal_option` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor_record`
--

LOCK TABLES `sponsor_record` WRITE;
/*!40000 ALTER TABLE `sponsor_record` DISABLE KEYS */;
INSERT INTO `sponsor_record` VALUES (1,9,4,800),(2,10,1,2290),(3,3,1,2290),(4,4,4,800),(5,8,9,15000),(6,1,5,18800),(7,2,1,2290),(8,6,10,690),(9,7,1,2290),(10,1,2,1790);
/*!40000 ALTER TABLE `sponsor_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'macbookpro'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_CreateProposal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`macbookpro`@`%` PROCEDURE `sp_CreateProposal`(
	in 	in_member_id int,
		in_title varchar(120),
        in_content text,
        in_goal int,
        in_category_id int,
    
    out affected_row_num int 
)
BEGIN
	declare p_id int;
	insert into proposal (
		category_id,
        title,
        content,
        goal
	) values (
		in_category_id,
        in_title,
        in_content,
        in_goal
	);
    
    set affected_row_num := row_count();
    
    set p_id = (
		select id
        from proposal
        where category_id = in_category_id
			and title = in_title
            and goal = in_goal
	);
    
    insert into proposal_member (
		proposal_id,
        member_id
	) values (
		p_id,
        in_member_id
	);
    set affected_row_num := affected_row_num + row_count();
    
    select 
		proposal.id as proposal_id,
        proposal.title as proposal_title,
        proposal.content as proposal_content,
        amount,
        goal,
        status,
        viewed_num,
        create_date,
        due_date,
        category.category_name
    from proposal 
    left join category
    on proposal.category_id = category.id
    where proposal.id = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`macbookpro`@`%` PROCEDURE `sp_DeleteMember`(
	in 	in_member_id int,
        
	out affected_row_num int
)
BEGIN
	/*
    在實作時有考慮過加 deactive 的欄位，但是需要修改的 store procedure 實在太多alter
    期末在燒阿><
    因此就直接將使用者刪除，child record 不重要的直接 cascade，重要的就 set null
    但最好還是不要立即刪掉，應該有 deactive 欄位以及 delete_date maybe 30 天後再做刪除
    */
	delete from member where id = in_member_id;
	
    set affected_row_num := row_count();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetFollowedProposalsByMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`macbookpro`@`%` PROCEDURE `sp_GetFollowedProposalsByMember`(
	in in_member_id int,
    
    out num_of_rows int
)
BEGIN
	select
		any_value(proposal_member.member_id) as member_id,
        proposal.title as proposal_title,
        sum(ifnull(sponsor_record.amount, 0)) as proposal_amount,
        proposal.goal as proposal_goal
    from proposal
    join proposal_member
    on proposal.id = proposal_member.proposal_id
    join proposal_option
    on proposal.id = proposal_option.proposal_id
    left join sponsor_record
    on proposal_option.id = sponsor_record.proposal_option_id
    where proposal_member.member_id = in_member_id
    group by proposal.id;
    
	/*
	給定的假資料有兩個 amount 欄位，根據資料正確性使用 sponsor_record 這張表格一定會是正確的
    再按照正規畫邏輯，並不應該出現 proposal 表格的 amount 欄位，浪費空間
    下面為撈 prorosal table 的作法，怕假資料 amount 相加總合不符被扣分
    留下以下程式碼為證，兩個做法都實作了
    */

	/*
	select
		proposal_member.member_id,
        proposal.title as proposal_title,
        proposal.amount as proposal_amount,
        proposal.goal as proposal_goal
    from proposal
    join proposal_member
    on proposal.id = proposal_member.proposal_id
    where proposal_member.member_id = in_member_id;
	*/
	
	
    
	set num_of_rows := found_rows();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetHistorySponsorByMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`macbookpro`@`%` PROCEDURE `sp_GetHistorySponsorByMember`(
	in in_member_id int,
    
    out num_of_rows int
)
BEGIN
	select
		sponsor_record.member_id,
        proposal.id as proposal_id,
        proposal.title as proposal_title,
        proposal_option.title as proposal_option_title,
        sponsor_record.amount,
        proposal.status
	from proposal
    join proposal_option
    on proposal.id = proposal_option.proposal_id
    join sponsor_record
    on proposal_option.id = sponsor_record.proposal_option_id
    where sponsor_record.member_id = in_member_id;
    
    set num_of_rows := found_rows();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetProposalByCompletionRate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`macbookpro`@`%` PROCEDURE `sp_GetProposalByCompletionRate`(
	in in_ratio float,
    
    out affected_row_num int 
)
BEGIN
	select
		id as proposal_id,
        title as proposal_title,
        amount,
        goal,
        amount / goal as ratio 
    from proposal
    where amount / goal > in_ratio
		and status > 1
    order by amount / goal desc;
    
    set affected_row_num := found_rows();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetProposalsByKeyword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`macbookpro`@`%` PROCEDURE `sp_GetProposalsByKeyword`(
	in 	in_keyword varchar(64),
        
	out num_of_rows int
)
BEGIN
	select
		id as proposal_id,
        title as proposal_title,
        due_date,
        amount 
	from proposal
	where title like concat('%', in_keyword, '%');
        
    set num_of_rows := found_rows();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetRecommendedProposals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`macbookpro`@`%` PROCEDURE `sp_GetRecommendedProposals`(
	in in_member_id int,
    
    out num_of_rows int
)
BEGIN
	if 
		exists(select * from member where id = in_member_id)
        and exists(
			select *
			from (
				 select distinct proposal.*
					from proposal
					join proposal_option
					on proposal.id = proposal_option.proposal_id
					join sponsor_record
					on proposal_option.id = sponsor_record.proposal_option_id
					where sponsor_record.member_id in (
						select distinct sponsor_record.member_id
						from sponsor_record
						join proposal_option
						on proposal_option.id = sponsor_record.proposal_option_id
						join proposal
						on proposal.id = proposal_option.proposal_id
						where sponsor_record.member_id != in_member_id
							and proposal.id in (
								select proposal.id
								from proposal
								join proposal_option
								on proposal.id = proposal_option.proposal_id
								join sponsor_record
								on proposal_option.id = sponsor_record.proposal_option_id
								where sponsor_record.member_id = in_member_id
							)
						)
					union
					select *
					from proposal
					where id not in (
						select proposal.id
						from proposal
						join proposal_option
						on proposal.id = proposal_option.proposal_id
						join sponsor_record
						on proposal_option.id = sponsor_record.proposal_option_id
						where sponsor_record.member_id = in_member_id
					)
			) p
			join proposal_member
			on p.id = proposal_member.proposal_id
			where p.status = 2
				and proposal_member.member_id != in_member_id
        )
	then 
		select 
			p.id as proposal_id,
			p.title as proposal_title,
			p.status,
			p.viewed_num
		from (
			 select distinct proposal.*
				from proposal
				join proposal_option
				on proposal.id = proposal_option.proposal_id
				join sponsor_record
				on proposal_option.id = sponsor_record.proposal_option_id
				where sponsor_record.member_id in (
					select distinct sponsor_record.member_id
					from sponsor_record
					join proposal_option
					on proposal_option.id = sponsor_record.proposal_option_id
					join proposal
					on proposal.id = proposal_option.proposal_id
					where sponsor_record.member_id != in_member_id
						and proposal.id in (
							select proposal.id
							from proposal
							join proposal_option
							on proposal.id = proposal_option.proposal_id
							join sponsor_record
							on proposal_option.id = sponsor_record.proposal_option_id
							where sponsor_record.member_id = in_member_id
						)
					)
				union
				select *
				from proposal
				where id not in (
					select proposal.id
					from proposal
					join proposal_option
					on proposal.id = proposal_option.proposal_id
					join sponsor_record
					on proposal_option.id = sponsor_record.proposal_option_id
					where sponsor_record.member_id = in_member_id
				)
		) p
		join proposal_member
		on p.id = proposal_member.proposal_id
		where p.status = 2
			and proposal_member.member_id != in_member_id;
	else
		select 
			id as prososal_id,
            title as proposal_title,
            status,
            viewed_num
        from proposal
        order by viewed_num desc
        limit 5;
	end if;
    
    set num_of_rows := found_rows();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetUnrepliedComments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`macbookpro`@`%` PROCEDURE `sp_GetUnrepliedComments`(
	in in_member_id int,
    
    out num_of_rows int
)
BEGIN
	/*
	在匯入假資料時發現， proposal 1 member 7 的留言質疑出貨等很久
    回頭檢查 proposal owner 時，發現 owner 也是　ｍｅｍｂｅｒ　７
    自己留言嗆自己，分明就是網軍刷流量的行為，差評
    */
	select
		proposal_member.member_id,
        proposal.id as proposal_id,
        proposal.title as proposal_title,
        comment.id as comment_id,
        comment.user_comment as comment_comment,
        comment.created_at as comment_time,
        comment.proposer_response
	from proposal
    join proposal_member
    on proposal.id = proposal_member.proposal_id
    join member
    on proposal_member.member_id = member.id
    join comment
    on proposal.id = comment.proposal_id
    where proposal_member.member_id = in_member_id
		and (
			comment.proposer_response is null
            or comment.proposer_response = ''
		);
        
	set num_of_rows := found_rows();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`macbookpro`@`%` PROCEDURE `sp_Login`(
	in 	in_email varchar(254),
		in_hashed_pwd varchar(64),
        
	out status_code int
)
login: BEGIN

	/*
	參照問題整理集-其他項目第二點
	以上我修改了 input 欄位名稱，按照 mysql 官方給的 guideline， naming conventions(如下) 應該為 snake case 而非 camel case
	為了統一整體 coding style，我將 hashedPwd 改為 hashed_pwd 且整份專案欄位都遵循 snake case 命名
	且以上並未更動 input 參數內容，符合規範
	https://dev.mysql.com/doc/internals/en/coding-style.html
	https://dev.mysql.com/doc/dev/mysql-server/latest/PAGE_NAMING_CONVENTIONS.html
	再者根據當初作業的設計，為確保安全性我選擇 SHA-512 作為 hash funciton， hashed 完的 passwd 長度為 512 bits，放到 varchar(64) 就剛好了(64*8)
	varchar(200) 浪費執行階段的資源，因此改為 varchar(64)
	*/
    
    /*
    根據 RFC2821 指出，目前網路規範的 mail address max length 應考慮為 254 個 char，因此更該 varchar(64) to varchar(254)
    用以滿足特定情況
    https://7php.com/the-maximum-length-limit-of-an-email-address-is-254-not-320/
    */
    
	select id
	into @pwd_id
	from member
	where email = in_email
    limit 1;
    
    /*
    透過 early return 的寫法，可以在不同階段就將無法登入的輸入值 return 掉，無須進行全部的操作降低 DB 負擔
    */
    
    if @pwd_id is null then
		set status_code := 3;
		leave login;
	end if;
    
    if not exists(
		select *
        from member_credential
        where member_id = @pwd_id
			and hashed_pwd_string = in_hashed_pwd
	) then
		set status_code := 2;
		leave login;
	end if;
		
    set status_code := 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegisterMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`macbookpro`@`%` PROCEDURE `sp_RegisterMember`(
	in 	in_name varchar(64),
        in_phone varchar(64),
        in_email varchar(64),
		in_hashed_pwd varchar(64),
        in_salt char(64),
        in_address varchar(255),
        
	out affected_row_num int
    
)
BEGIN
	/*
	參照問題整理集-其他項目第二點
	以上我修改了 input 欄位名稱，按照 mysql 官方給的 guideline， naming conventions(如下) 應該為 snake case 而非 camel case
	為了統一整體 coding style，我將 hashedPwd 改為 hashed_pwd 且整份專案欄位都遵循 snake case 命名
	且以上並未更動 input 參數內容，符合規範
	https://dev.mysql.com/doc/internals/en/coding-style.html
	https://dev.mysql.com/doc/dev/mysql-server/latest/PAGE_NAMING_CONVENTIONS.html
	再者根據當初作業的設計，為確保安全性我選擇 SHA-512 作為 hash funciton， hashed 完的 passwd 長度為 512 bits，放到 varchar(64) 就剛好了(64*8)
	varchar(200) 浪費執行階段的資源，因此改為 varchar(64)
	*/
	declare pwd_id int default null;
    declare _rollback int default 0;
    
    declare continue handler for sqlexception set _rollback = 1;
	begin
		start transaction; -- 透過 transaction funciton 設定斷點，確保兩個斷點的操作會成功，如果失敗不會有不完全的資料寫入 DB
        
		set affected_row_num := 0;
    
		insert into member (
			name,
			phone,
			email,
			salt,
			address
		) values (
			in_name,
			in_phone,
			in_email,
			in_salt,
			in_address
		);
		
		set affected_row_num := row_count();
		set pwd_id = last_insert_id();
		
        insert into member_credential (
			member_id,
			hashed_pwd_string
		) values (
			pwd_id,
			in_hashed_pwd
		);
        
        set affected_row_num := affected_row_count + row_count();
        
        if _rollback then -- 操作失敗，回溯資料
			rollback; 
		else -- 操作成功，寫入 DB
			commit;
		end if;
	end;
    
    select 
		member.id as member_id,
        member.name,
        member.email,
        member_credential.hashed_pwd_string as password,
        member.salt,
        member.phone,
        member.address
	from member
    left join member_credential
    on member.id = member_credential.member_id
    where member.id = pwd_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateProposalStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`macbookpro`@`%` PROCEDURE `sp_UpdateProposalStatus`(
	in 	in_proposal_id int,
        in_status int,
        
	out affected_row_num int
)
BEGIN
	set affected_row_num := 0;
    
	select status
    into @status
    from proposal
    where id = in_proposal_id;
    
    if
		@status = 1
		and @status + 1 = in_status
	then
		update proposal set status = in_status , due_date = date_add(now(0), interval 90 day)
        where id = in_proposal_id;
		set affected_row_num := row_count();
    end if;
    
    if
		@status = 2
		and @status + 1 = in_status
	then
		update proposal set status = in_status
        where id = in_proposal_id;
		set affected_row_num := row_count();
    end if;
    
    select
		id as proposal_id,
        status
	from proposal
    where id = in_proposal_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdatePwd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`macbookpro`@`%` PROCEDURE `sp_UpdatePwd`(
	in 	in_member_id int,
		in_hashed_pwd varchar(64),
        in_salt char(64),
        
	out affected_row_num int
)
BEGIN
	/*
	參照問題整理集-其他項目第二點
	以上我修改了 input 欄位名稱，按照 mysql 官方給的 guideline， naming conventions(如下) 應該為 snake case 而非 camel case
	為了統一整體 coding style，我將 hashedPwd 改為 hashed_pwd 且整份專案欄位都遵循 snake case 命名
	且以上並未更動 input 參數內容，符合規範
	https://dev.mysql.com/doc/internals/en/coding-style.html
	https://dev.mysql.com/doc/dev/mysql-server/latest/PAGE_NAMING_CONVENTIONS.html
	再者根據當初作業的設計，為確保安全性我選擇 SHA-512 作為 hash funciton， hashed 完的 passwd 長度為 512 bits，放到 varchar(64) 就剛好了(64*8)
	varchar(200) 浪費執行階段的資源，因此改為 varchar(64)
	*/
	declare _rollback int default 0;
    
    declare continue handler for sqlexception set _rollback = 1;
    begin
		start transaction; -- 透過 transaction funciton 設定斷點，確保兩個斷點的操作會成功，如果失敗不會有不完全的資料寫入 DB
		
        set affected_row_num := 0;
		
        update member_credential
        set hashed_pwd_string = in_hashed_pwd
        where member_id = in_member_id;
		
		set affected_row_num := row_count();
		
        update member
        set salt = in_salt
        where id = in_member_id;
		
        set affected_row_num := affected_row_num + row_count();
        
        if _rollback then -- 操作失敗，回溯資料
			rollback; 
		else -- 操作成功，寫入 DB
			commit; 
		end if;
	end;
    
    select
		member.id as member_id,
        member.name,
        member.email,
        member_credential.hashed_pwd_string as password,
        member.salt,
        member.phone,
        member.address
	from member
    left join member_credential
    on member.id = member_credential.member_id
    where member.id = in_member_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-12 15:20:57
