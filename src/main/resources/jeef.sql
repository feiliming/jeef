/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.27 : Database - jeef
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `jeef`;

/*Table structure for table `sys_config` */

CREATE TABLE `sys_config` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `system_name` varchar(50) DEFAULT NULL COMMENT '系统名称',
  `navigation_type` varchar(30) DEFAULT NULL COMMENT '导航类型，字典码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_config` */

insert  into `sys_config`(`id`,`system_name`,`navigation_type`) values (1,'XXX管理系统','tree');

/*Table structure for table `sys_dictionary` */

CREATE TABLE `sys_dictionary` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `code` varchar(30) DEFAULT NULL COMMENT '字典码',
  `name` varchar(30) DEFAULT NULL COMMENT '显示值',
  `category` varchar(30) DEFAULT NULL COMMENT '分类',
  `sequence` int(11) DEFAULT NULL COMMENT '排序',
  `description` varchar(30) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_dictionary` */

insert  into `sys_dictionary`(`id`,`code`,`name`,`category`,`sequence`,`description`) values (1,'accordion','手风琴风格','navigation_type',1,'导航类型-手风琴'),(2,'tree','树风格','navigation_type',2,'导航类型-树'),(3,'button','按钮','resource_type',2,'资源类型-按钮'),(4,'menu','菜单','resource_type',1,'资源类型-菜单');

/*Table structure for table `sys_organization` */

CREATE TABLE `sys_organization` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `name` varchar(50) NOT NULL COMMENT '组织机构名称',
  `code` varchar(50) DEFAULT NULL COMMENT '组织机构代码',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `sequence` int(11) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT '0' COMMENT 'pid',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `org_type` int(11) DEFAULT NULL COMMENT '机构单位类型，参见字典表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_organization` */

insert  into `sys_organization`(`id`,`name`,`code`,`address`,`description`,`sequence`,`pid`,`create_time`,`org_type`) values (1,'东师理想','001',NULL,'东师理想软件股份有限公司',1,-1,NULL,NULL),(2,'财务部',NULL,NULL,'会计',1,1,NULL,NULL),(3,'人力资源',NULL,NULL,NULL,2,1,NULL,NULL),(4,'Java开发',NULL,NULL,'saveMenu',0,1,NULL,NULL),(5,'Lua开发',NULL,NULL,'Lua开发',0,1,NULL,NULL),(6,'Web开发',NULL,NULL,NULL,4,1,NULL,NULL),(7,'js开发',NULL,NULL,'阿斯蒂芬',0,1,NULL,NULL),(8,'html开发',NULL,NULL,NULL,0,1,NULL,NULL),(9,'css开发',NULL,NULL,NULL,0,1,NULL,NULL),(10,'flex开发',NULL,NULL,'阿斯蒂芬',0,1,NULL,NULL),(62,'rrr',NULL,NULL,'rr',0,3,NULL,NULL),(63,'cc',NULL,NULL,'cc',0,2,NULL,NULL),(64,'jjj',NULL,NULL,'jjj',0,4,NULL,NULL),(65,'lllll',NULL,NULL,'asdf',0,5,NULL,NULL),(66,'asdf ',NULL,NULL,'asdf',0,1,NULL,NULL),(67,'as111','sdf',NULL,'ds',2,7,NULL,NULL),(68,'asdf','asdf',NULL,NULL,0,8,NULL,NULL),(69,'ccc','cc',NULL,'c',0,9,NULL,NULL),(70,'ff','fff',NULL,'fff',0,10,NULL,NULL),(71,'cc','cc',NULL,'cc',0,66,NULL,NULL),(72,'ccc224','ccc11','23','11',0,71,NULL,NULL),(73,'asdf',NULL,NULL,NULL,0,67,NULL,NULL),(74,'asdf','asdf','asdf','asdf',0,72,'2015-02-11 09:17:18',NULL),(75,'西山口听课报名',NULL,NULL,NULL,0,66,'2015-03-06 15:41:23',NULL),(76,'6KW/5bGx5Y+j5ZCs6K',NULL,NULL,NULL,0,66,'2015-03-06 15:41:47',NULL);

/*Table structure for table `sys_resource` */

CREATE TABLE `sys_resource` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `name` varchar(50) DEFAULT NULL COMMENT '资源名称',
  `url` varchar(200) DEFAULT NULL COMMENT '资源路径',
  `icon_class` varchar(50) DEFAULT NULL COMMENT '图标样式',
  `sequence` int(11) DEFAULT NULL COMMENT '排序',
  `type` varchar(30) DEFAULT NULL COMMENT '资源类型，字典code值',
  `pid` int(11) DEFAULT NULL COMMENT 'pid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_resource` */

insert  into `sys_resource`(`id`,`name`,`url`,`icon_class`,`sequence`,`type`,`pid`) values (1,'系统管理',NULL,'icon-operation',1,'menu',-1),(2,'业务管理',NULL,'icon-business',2,'menu',-1),(3,'常用模块',NULL,'icon-collection',3,'menu',-1),(4,'用户管理','/user','icon-resource',0,'menu',1),(5,'角色管理','/role','icon-resource',4,'menu',1),(6,'部门管理','/org','icon-department',3,'menu',1),(7,'资源管理','/resource','icon-resource',2,'menu',1),(8,'系统配置','/config','icon-config',1,'menu',1);

/*Table structure for table `sys_role` */

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `sequence` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`description`,`sequence`) values (1,'超级管理员','超级管理员，拥有所有权限',1),(2,'角色8','角色1',2),(4,'阿什顿',NULL,0),(5,'角色3','角色3',4),(6,'角色4','角色1',2),(7,'角色2','角色2',3),(8,'双好\'asdf\'','asdf',0),(9,'角色6','角色1',2),(10,'角色10','角色1',2),(11,'角色1','角色1',2),(12,'角色11','角色1',2),(13,'角色5','角色1',2),(15,'角色9','角色1',2),(16,'test角色','阿斯蒂芬',2),(17,'啊','啊',3),(19,'角色7','角色1',2),(28,'第三关','阿斯蒂芬',0),(29,'阿斯蒂芬',' 阿斯蒂芬',0),(30,'阿斯蒂芬去1','地方个',0),(31,'11','111',5),(32,'222','222',5),(33,'33','33',6);

/*Table structure for table `sys_role_resource` */

CREATE TABLE `sys_role_resource` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `resource_id` int(11) NOT NULL COMMENT '资源ID',
  PRIMARY KEY (`role_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_resource` */

/*Table structure for table `sys_user` */

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `login_name` varchar(50) DEFAULT NULL COMMENT '登录名',
  `real_name` varchar(50) DEFAULT NULL COMMENT '真是姓名',
  `gender` int(11) DEFAULT '1' COMMENT '性别',
  `age` int(11) DEFAULT '0' COMMENT '年龄',
  `password` varchar(50) DEFAULT NULL COMMENT '登录密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `org_id` int(11) DEFAULT '0' COMMENT '机构id',
  `disabled` int(11) DEFAULT '0' COMMENT '状态，1禁用，0启用',
  `deleted` int(11) DEFAULT '0' COMMENT '删除状态，1删除，0未删除',
  `login_times` int(11) DEFAULT '0' COMMENT '登录次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginname` (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`login_name`,`real_name`,`gender`,`age`,`password`,`create_time`,`org_id`,`disabled`,`deleted`,`login_times`) values (1,'feilm','费',1,18,'e10adc3949ba59abbe56e057f20f883e','2013-11-23 16:46:09',1,0,0,0),(2,'admin','管理员',1,18,'e10adc3949ba59abbe56e057f20f883e','2013-11-23 16:46:09',1,0,0,0),(3,'zs','zhangsan',1,18,'e10adc3949ba59abbe56e057f20f883e','2015-02-13 14:03:48',1,1,0,0),(4,'lisi','李四',1,18,'e10adc3949ba59abbe56e057f20f883e','2015-02-13 14:10:37',1,0,0,0),(5,'ww11','ww11',2,15,'e10adc3949ba59abbe56e057f20f883e','2015-02-14 13:25:20',66,0,0,0),(6,'zl','zl',1,12,'e10adc3949ba59abbe56e057f20f883e','2015-02-14 13:25:57',66,1,0,0),(7,'zzzz','sfdaa',1,17,'e10adc3949ba59abbe56e057f20f883e','2015-02-14 16:54:36',1,0,0,0),(8,'mmmm','zzzz',1,14,'e10adc3949ba59abbe56e057f20f883e','2015-02-14 16:55:02',66,0,0,0),(9,'sadf','df',1,0,'e10adc3949ba59abbe56e057f20f883e','2015-02-14 16:55:02',1,0,0,0),(10,'sdf','sdf',1,0,'e10adc3949ba59abbe56e057f20f883e','2015-02-14 16:55:02',7,1,0,0),(11,'bb','bb',1,0,'e10adc3949ba59abbe56e057f20f883e','2015-02-14 16:55:02',7,0,0,0),(12,'cc','cc',1,0,'e10adc3949ba59abbe56e057f20f883e','2015-02-14 16:55:02',7,0,0,0),(13,'dd','dd',1,0,'e10adc3949ba59abbe56e057f20f883e','2015-02-14 16:55:02',1,0,0,0),(14,'ff','ff',1,0,'e10adc3949ba59abbe56e057f20f883e','2015-02-14 16:55:02',8,0,0,0),(15,'ee','ee',1,0,'e10adc3949ba59abbe56e057f20f883e','2015-02-14 16:55:02',1,0,0,0),(16,'gg','gg',1,0,'e10adc3949ba59abbe56e057f20f883e',NULL,1,0,0,0);

/*Table structure for table `sys_user_role` */

CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_role` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
