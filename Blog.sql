-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: Blog
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
-- Table structure for table `blogtype`
--

DROP TABLE IF EXISTS `blogtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogtype`
--

LOCK TABLES `blogtype` WRITE;
/*!40000 ALTER TABLE `blogtype` DISABLE KEYS */;
INSERT INTO `blogtype` VALUES (1,'个人博客'),(2,'公开博客'),(3,'其他博客');
/*!40000 ALTER TABLE `blogtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Python基础'),(2,'Web开发'),(3,'爬虫'),(4,'数据分析'),(5,'人工智能'),(6,'其他');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `reply_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (1,'楼上说的对','2018-10-17 11:34:50',2,1),(2,'很好，很不错','2018-10-17 11:34:53',3,2),(3,'楼上说的对','2018-10-17 11:34:55',4,3),(4,'值得推荐','2018-10-17 11:34:56',5,4),(5,'楼上说的对','2018-10-17 11:34:58',2,5),(6,'第一','2018-11-06 06:34:45',2,7),(7,'第一','2018-05-06 06:35:01',3,8),(8,'第一','2018-01-02 06:35:36',4,9),(9,'第一','2018-07-10 06:35:44',5,10),(10,'第一','2018-07-27 06:36:06',3,11),(11,'第一','2018-03-30 02:39:24',2,14);
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `pub_date` datetime NOT NULL,
  `read_num` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `images` text,
  `category_id` int(11) DEFAULT NULL,
  `blogtype_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cate_id` (`category_id`),
  KEY `blog_id` (`blogtype_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'爬虫微课5小时python学习路线!','2018-01-17 11:16:29',39,'From：https://www.oschina.net/question/5189_4306\\r\\n\\r\\nFrom：https://www.oschina.net/question/5189_4306\\r\\n\\r\\n\\r\\n\\r\\nWeb.py Cookbook 简体中文版：http://webpy.org/cookbook/index.zh-cn\\r\\n\\r\\nweb.py 0.3 新手指南：http://webpy.org/docs/0.3/tutorial.zh-cn\\r\\n\\r\\n\\r\\n\\r\\nwebpy 官网文档：http://webpy.org/ web.py 十分钟创建简易博客：http://blog.csdn.net/freeking101/article/details/53020728\\r\\n\\r\\nweb.py 是一个Python 的web 框架，它简单而且功能强大。web.py 是公开的，无论用于什么用途都是没有限制的。而且相当的小巧，应当归属于轻量级的web 框架。但这并不影响web.py 的强大，而且使用起来很简单、很直接。在实际应用上，web.py 更多的是学术上的价值，因为你可以看到更多web 应用的底层，这在当今“抽象得很好”的web 框架上是学不到的 ：） 如果想了解更多web.py，可以访问web.py 的官方文档。 先感受一下web.py 的简单而强大：\\r\\n\\r\\n上面就是一个基于web.py 的完整的Web 应用。将上面的代码保存为文件code.py，在命令行下执行python code.py。然后打开你的浏览器，打开地址：http://localhost:8080 或者 http://localhost:8080/test 没有意外的话(当然要先安装web.py，下面会有介绍)，浏览器会显示“Hello, world”或者 “Hello, test”。 \\r\\n\\r\\n\\r\\n\\r\\n1. 安装 下载 web.py 的安装文件，将下载得到的文件 web.py 解压，进入解压后的文件夹，在命令行下执行：python setup.py install，在Linux 等系统下，需要root 的权限，可以执行：sudo python setup.py install。 2. URL 处理 对于一个站点来说，URL 的组织是最重要的一个部分，因为这是用户看得到的部分，而且直接影响到站点是如何工作的，例如：www.baidu.com ，其URLs 甚至是网页界面的一部分。而web.py 以简单的方式就能够构造出一个强大的URLs。 在每个web.py 应用，必须先import web 模块：','images/banner01.jpg',3,2,1),(2,'干货|如何优雅的在手机上进行Python编程','2018-01-31 19:16:54',37,'webpy 官网文档：http://webpy.org/ web.py 十分钟创建简易博客：http://blog.csdn.net/freeking101/article/details/53020728\\r\\n\\r\\nweb.py 是一个Python 的web 框架，它简单而且功能强大。web.py 是公开的，无论用于什么用途都是没有限制的。而且相当的小巧，应当归属于轻量级的web 框架。但这并不影响web.py 的强大，而且使用起来很简单、很直接。在实际应用上，web.py 更多的是学术上的价值，因为你可以看到更多web 应用的底层，这在当今“抽象得很好”的web 框架上是学不到的 ：） 如果想了解更多web.py，可以访问web.py 的官方文档。 先感受一下web.py 的简单而强大：\\r\\n\\r\\n上面就是一个基于web.py 的完整的Web 应用。将上面的代码保存为文件code.py，在命令行下执行python code.py。然后打开你的浏览器，打开地址：http://localhost:8080 或者 http://localhost:8080/test 没有意外的话(当然要先安装web.py，下面会有介绍)，浏览器会显示“Hello, world”或者 “Hello, test”。 \\r\\n\\r\\n\\r\\n\\r\\n1. 安装 下载 web.py 的安装文件，将下载得到的文件 web.py 解压，进入解压后的文件夹，在命令行下执行：python setup.py install，在Linux 等系统下，需要root 的权限，可以执行：sudo python setup.py install。 2. URL 处理 对于一个站点来说，URL 的组织是最重要的一个部分，因为这是用户看得到的部分，而且直接影响到站点是如何工作的，例如：www.baidu.com ，其URLs 甚至是网页界面的一部分。而web.py 以简单的方式就能够构造出一个强大的URLs。 在每个web.py 应用，必须先import web 模块：\\r\\nwebpy 官网文档：http://webpy.org/ web.py 十分钟创建简易博客：http://blog.csdn.net/freeking101/article/details/53020728\\r\\n\\r\\nweb.py 是一个Python 的web 框架，它简单而且功能强大。web.py 是公开的，无论用于什么用途都是没有限制的。而且相当的小巧，应当归属于轻量级的web 框架。但这并不影响web.py 的强大，而且使用起来很简单、很直接。在实际应用上，web.py 更多的是学术上的价值，因为你可以看到更多web 应用的底层，这在当今“抽象得很好”的web 框架上是学不到的 ：） 如果想了解更多web.py，可以访问web.py 的官方文档。 先感受一下web.py 的简单而强大：\\r\\n\\r\\n上面就是一个基于web.py 的完整的Web 应用。将上面的代码保存为文件code.py，在命令行下执行python code.py。然后打开你的浏览器，打开地址：http://localhost:8080 或者 http://localhost:8080/test 没有意外的话(当然要先安装web.py，下面会有介绍)，浏览器会显示“Hello, world”或者 “Hello, test”。 \\r\\n\\r\\n\\r\\n\\r\\n1. 安装 下载 web.py 的安装文件，将下载得到的文件 web.py 解压，进入解压后的文件夹，在命令行下执行：python setup.py install，在Linux 等系统下，需要root 的权限，可以执行：sudo python setup.py install。 2. URL 处理 对于一个站点来说，URL 的组织是最重要的一个部分，因为这是用户看得到的部分，而且直接影响到站点是如何工作的，例如：www.baidu.com ，其URLs 甚至是网页界面的一部分。而web.py 以简单的方式就能够构造出一个强大的URLs。 在每个web.py 应用，必须先import web 模块：\\r\\nwebpy 官网文档：http://webpy.org/ web.py 十分钟创建简易博客：http://blog.csdn.net/freeking101/article/details/53020728\\r\\n\\r\\nweb.py 是一个Python 的web 框架，它简单而且功能强大。web.py 是公开的，无论用于什么用途都是没有限制的。而且相当的小巧，应当归属于轻量级的web 框架。但这并不影响web.py 的强大，而且使用起来很简单、很直接。在实际应用上，web.py 更多的是学术上的价值，因为你可以看到更多web 应用的底层，这在当今“抽象得很好”的web 框架上是学不到的 ：） 如果想了解更多web.py，可以访问web.py 的官方文档。 先感受一下web.py 的简单而强大：\\r\\n\\r\\n上面就是一个基于web.py 的完整的Web 应用。将上面的代码保存为文件code.py，在命令行下执行python code.py。然后打开你的浏览器，打开地址：http://localhost:8080 或者 http://localhost:8080/test 没有意外的话(当然要先安装web.py，下面会有介绍)，浏览器会显示“Hello, world”或者 “Hello, test”。 \\r\\n\\r\\n\\r\\n\\r\\n1. 安装 下载 web.py 的安装文件，将下载得到的文件 web.py 解压，进入解压后的文件夹，在命令行下执行：python setup.py install，在Linux 等系统下，需要root 的权限，可以执行：sudo python setup.py install。 2. URL 处理 对于一个站点来说，URL 的组织是最重要的一个部分，因为这是用户看得到的部分，而且直接影响到站点是如何工作的，例如：www.baidu.com ，其URLs 甚至是网页界面的一部分。而web.py 以简单的方式就能够构造出一个强大的URLs。 在每个web.py 应用，必须先import web 模块：\\r\\nFrom：https://www.oschina.net/question/5189_4306\\r\\n\\r\\nFrom：https://www.oschina.net/question/5189_4306\\r\\n\\r\\n\\r\\n\\r\\nWeb.py Cookbook 简体中文版：http://webpy.org/cookbook/index.zh-cn\\r\\n\\r\\nweb.py 0.3 新手指南：http://webpy.org/docs/0.3/tutorial.zh-cn\\r\\n\\r\\n\\r\\n\\r\\nwebpy 官网文档：http://webpy.org/ web.py 十分钟创建简易博客：http://blog.csdn.net/freeking101/article/details/53020728\\r\\n\\r\\nweb.py 是一个Python 的web 框架，它简单而且功能强大。web.py 是公开的，无论用于什么用途都是没有限制的。而且相当的小巧，应当归属于轻量级的web 框架。但这并不影响web.py 的强大，而且使用起来很简单、很直接。在实际应用上，web.py 更多的是学术上的价值，因为你可以看到更多web 应用的底层，这在当今“抽象得很好”的web 框架上是学不到的 ：） 如果想了解更多web.py，可以访问web.py 的官方文档。 先感受一下web.py 的简单而强大：\\r\\n\\r\\n上面就是一个基于web.py 的完整的Web 应用。将上面的代码保存为文件code.py，在命令行下执行python code.py。然后打开你的浏览器，打开地址：http://localhost:8080 或者 http://localhost:8080/test 没有意外的话(当然要先安装web.py，下面会有介绍)，浏览器会显示“Hello, world”或者 “Hello, test”。 \\r\\n\\r\\n\\r\\n\\r\\n1. 安装 下载 web.py 的安装文件，将下载得到的文件 web.py 解压，进入解压后的文件夹，在命令行下执行：python setup.py install，在Linux 等系统下，需要root 的权限，可以执行：sudo python setup.py install。 2. URL 处理 对于一个站点来说，URL 的组织是最重要的一个部分，因为这是用户看得到的部分，而且直接影响到站点是如何工作的，例如：www.baidu.com ，其URLs 甚至是网页界面的一部分。而web.py 以简单的方式就能够构造出一个强大的URLs。 在每个web.py 应用，必须先import web 模块：','images/banner02.jpg',1,2,1),(3,'python-win10下使用定时任务执行程序','2018-02-21 14:11:57',35,'Python 安装配置及基本语法篇 Python 语言速成 Python 基本知识 Python 常用表达式 Python 基础语法 Python 语法篇：菜鸟的Python笔记 Python精要参考：快速入门 《Python标... ','images/banner03.jpg',2,2,1),(4,'linux升级py3,安装pip,svn','2018-03-02 08:16:59',29,'python中打开TXT文件报错2017年03月09日 14:30:57 阅读数:676 在IDLE命令行引用一文件夹下的函数来了条错误提示:FileNotFoundError: [Errno 2] No such ...','images/toppic01.jpg',1,2,1),(5,'精通Python编程——Python深入浅出教程','2018-03-17 11:17:02',28,'随便写点内容吧','images/toppic02.jpg',2,2,1),(6,'Python语言在人工智能(AI)中的优势','2018-04-20 11:17:04',7,'本文探讨了Python语言在AI领域的优势与运用。 谁会成为AI 和大数据时代的第一开发语言? 这本已是一个不需要争论的问题。如果说三年前,Matlab、Scala、R、Java\n          ...','images/zd01.jpg',5,2,1),(7,'python中打开TXT文件报错','2018-04-29 11:17:05',5,'python中打开TXT文件报错2017年03月09日 14:30:57 阅读数:676 在IDLE命令行引用一文件夹下的函数,来了条错误提示:FileNotFoundError:\n          [Errno 2] No such ...','',1,2,1),(8,'精通Python编程——Python深入浅出教程','2018-05-10 11:17:09',8,'Python 安装配置及基本语法篇 Python 语言速成 Python 基本知识 Python 常用表达式 Python 基础语法 Python 语法篇：菜鸟的Python笔记\n          Python精要参考：快速入门 《Python标...','images/avatar.jpg',1,2,1),(9,'Python基础学习总结（一）','2018-05-23 11:17:11',10,'Python是一种解释型、面向对象、动态数据类型的高级程序设计语言。 Python 缩进与空行 Python 中文编码 Python 注释 Python 标识符 Python 保留字Python 数据类型 Python 运算','images/v1.jpg',1,2,1),(10,'人生苦短 Python当歌','2018-06-21 11:17:13',14,'os模块对目录的操作os.getcwd() 获取当前工作目录,即当前Python脚本工作的目录路径import os print(os.getcwd()) #\n          C:\\Users\\Administrator\\Desktop...','images/v2.jpg',1,2,1),(11,'Sublime text3作为Python的IDE不能正常使用input和raw_input','2018-07-09 06:12:19',17,'[ {\"key\": [\"ctrl+r\"], \"caption\": \"SublimeREPL: Python - RUN current file\", \"command\":\n          \"run_existing_window_command\", \"args\": { \"id\": \"......','',6,2,1),(12,'Python学习笔记：虚拟环境和包','2018-07-24 06:13:41',4,'本文来自：入门指南 开胃菜参考：开胃菜 使用Python解释器：使用Python解释器 本文对Python的简介：Python 简介 Python流程介绍：深入Python 流程\n          Python数据结构：Python 数据结构 Python：模块：Python 模块 Python：输入和输出Python 输入和输出 Python：错误和异常Python 错误和异常 Python：类Python：类\n          ...','images/bi05.jpg',2,2,1),(13,'python学习网址以及笔记','2018-08-05 06:14:59',5,'python学习网址 点击打开链接 http://www.runoob.com/python/python-dictionary.html 主要内容有 Python 基础教程\n          Python 基础教程Python 简介Python 环境搭建Python 中文编码Python 基础语法Python 变量类型Python 运算符Python 条件语句... ','images/b05.jpg',4,2,1),(14,'Ubuntu下python开发环境配置','2018-08-12 06:20:39',8,'Python在官方网站提供的Windows版本的安装包非常好用,一直‘下一步’就能够成功安装并配置好相应的运行环境,同时还自带pip等工具,非常的好用,Ubuntu上的自带Python......','images/a.jpg',1,2,1),(15,'Python 入门第一课--连接数据库的环境搭建','2018-08-30 06:22:35',5,'Python 入门第一课 本文直接学习python连接数据库基本知识： Python环境搭建 Python连接Mysql数据库 Python连接oracle数据库\n          Python环境搭建 Python不做过多的介绍，本文安装的是3.5.0版本，开发工具使用PyCharm，安装步骤请参照。 —— [ python安装步骤 ] Python连接Mysql数据库 ...','images/b.jpg',2,2,1),(16,'linux升级py3,安装pip,svn','2018-09-11 06:23:53',6,'【查看当前linux下python版本】 [root@localhost /]# python --version Python 2.6.6\n          【想要查看ubuntu中安装的Python路径】 【1.whereis python】： [root@localhost /]# whereis python python: /usr/bin/python\n          /us... ','images/c.jpg',1,2,1),(17,'Python之if判断语句与while和for循环','2018-09-28 06:24:51',19,'Python之if判断语句与while和for循环 Python之if判断语句与while和for循环 5-1 Python之if语句 5-2 Python之 if-else 5-3\n          Python之 if-elif-else 5-4 Python之 for循环 5-5 Python之 while循环 5-6 Python之 break退出循环 5-7 Python之 continue继续循环\n          5-8... ','images/d.jpg',1,2,1),(18,'requests库和正则表达式之淘宝爬虫实战!','2018-10-28 06:25:41',22,'使用requests库是需要安装的，requests库相比urllib\n          库来说更高级方便一点，同时与scrapy相比较还是不够强大，本文主要介绍利用requests库和正则表达式完成一项简单的爬虫小项目----淘宝商品爬虫。... ','images/e.jpg',3,2,1);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `email` varchar(200) NOT NULL,
  `upwd` varchar(30) NOT NULL,
  `is_author` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'mingyueye','明月夜','mingyueye@163.com','123456',1),(2,'aaa','第一','aaa@163.com','123456',0),(3,'bbb','第二','bbb@163.com','123456',0),(4,'ccc','第三','ccc@163.com','123456',0),(5,'ddd','第四','ddd@163.com','123456',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voke`
--

DROP TABLE IF EXISTS `voke`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voke` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voke`
--

LOCK TABLES `voke` WRITE;
/*!40000 ALTER TABLE `voke` DISABLE KEYS */;
INSERT INTO `voke` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18);
/*!40000 ALTER TABLE `voke` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-06 16:42:14
