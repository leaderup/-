/*
SQLyog Professional v12.08 (64 bit)
MySQL - 10.1.16-MariaDB : Database - usercomment
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`usercomment` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `usercomment`;

/*Table structure for table `anwser` */

DROP TABLE IF EXISTS `anwser`;

CREATE TABLE `anwser` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回答问题ID',
  `qid` int(11) DEFAULT NULL COMMENT '问题ID',
  `anwser` text COMMENT '回答问题项',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `anwser` */

insert  into `anwser`(`id`,`qid`,`anwser`) values (1,1,'这个问题你只能问他！'),(2,1,'你觉得呢？'),(3,1,'不好说，不要以貌取人'),(4,1,'我不想说什么！！'),(5,1,'你想说些什么？'),(6,1,'不知道'),(7,1,'Good Night!');

/*Table structure for table `question_list` */

DROP TABLE IF EXISTS `question_list`;

CREATE TABLE `question_list` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '问题ID',
  `question` text COMMENT '问题列表',
  `detail` text COMMENT '原作者回答',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `question_list` */

insert  into `question_list`(`pid`,`question`,`detail`) values (1,'丑人真的多作怪吗？','你有没有发现有些人，只要看一眼你就会感知到与她／他气场是不是相合？有些人只要一眼，你就知道能不能成为朋友或者压根不想深交？为什么？你思考过吗？'),(2,'丑人真的多作怪吗？','你有没有发现有些人，只要看一眼你就会感知到与她／他气场是不是相合？有些人只要一眼，你就知道能不能成为朋友或者压根不想深交？为什么？你思考过吗？'),(3,'日常脸部清洁护理上妆正确顺序','脸部化妆正确步骤如下：\r\n　　①基础护理：洁面——爽肤水——润肤露：\r\n　　说到化妆，最首先的当然是要先清洁面部了，如果有黑头，建议还先去黑头，这样能够更贴妆喔。洗完面后，要给自己补上最适合自己的、最补水的爽肤水跟润肤露。\r\n　　②基本打底：妆前乳——隔离霜\r\n　　在基本打底的阶段，建议大家选择一款质地较厚、较润肤的妆前乳，无论是油皮还是干性皮肤的MM都是如此，这样妆容才能够更贴而不会浮粉。\r\n　　③底妆：粉底液——粉饼——散粉or蜜粉：\r\n　　粉底液主要是为了调和肤色，先用粉底液再用粉饼能够使妆容不那么厚重，在上粉饼的时候其实不需要整张脸都涂上粉饼，只需要在一些需要调和肤色的部位上一下就可以了，上完粉底液跟粉饼后，大家就可以用蜜粉或者散粉定妆了。\r\n　　④眼部：眼影——眼线——眼睫毛\r\n　　在眼部的化妆方面，眼部首先要上的是眼影，上了眼影之后就要轻轻地画眼线了。在画完眼线之后，眼妆基本就完成了。\r\n　　剩最后一步是眼睫毛的处理：\r\n　　先用睫毛夹夹一下眼睫毛，然后上一层睫毛膏，如果你追求的是淡妆，不贴假眼睫毛，这一步就足够了，如果你需要贴假眼睫毛，在完成上面的步骤之后，把假眼睫毛修剪好，贴上，再用睫毛膏把真假两层睫毛刷一遍，眼妆就大功告成了。\r\n　　⑤高光、阴影、画眉、腮红、唇膏：\r\n　　高光跟阴影的处理主要是T区和U区，相关的教程网上都有，这里就不一一介绍了，接着是上腮红，这里需要注意的是，腮红要从太阳穴向苹果肌方向扫，而不是反过来。\r\n　　双眉的部分要选择适合自己的眉粉，如果你本来就浓眉大眼，个人建议不需要画眉，或者是用棕色的眉粉去调和一下。\r\n　　唇部的妆容其实很简单，如果你是追求精致的妆容，应该先从润唇膏开始，接着描唇线，然后上唇膏，唇彩就可以了。');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `passwd` varchar(32) DEFAULT NULL COMMENT '用户密码',
  `email` varchar(32) DEFAULT NULL COMMENT '用户邮箱名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`uid`,`username`,`passwd`,`email`) values (18,NULL,'xiashuangxi','password',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
