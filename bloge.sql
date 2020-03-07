/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50556
Source Host           : localhost:53306
Source Database       : bloge

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2020-03-07 16:37:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `picture` varchar(300) DEFAULT NULL,
  `pic` varchar(300) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`aid`),
  KEY `cid` (`cid`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '云中君', '云中君曾是一只孤鸟，与一只鹿结伴生存。在楚汉战火燃烧至云梦泽森林的时候，小鹿中箭死去，不久，悲伤至极的它将身躯粉碎在峭壁岩石。目睹这一幕的鬼谷子心怀同情，将其尸身骸骨运用转生之术重造，新生命具有人类的大部分形态，但可化作鸟类飞翔与战斗。', '2019-02-05 00:00:00', '1', '28', '3', '/imgs/14-2.jpg', '/imgs/14-1.jpg');
INSERT INTO `article` VALUES ('2', '鲁班大师', '鲁班是与墨子不分伯仲的机关天才。为了心无旁骛地研究机关科学，他在本该毕业的年纪，依赖稷下无限制的学年机制，长期驻留院内。开启“代号鲁班”研发计划后，他创造出首个具有生命力的第七号机关，他也不由与之产生了父子般的感情。\r\n\r\n稷下为邻城所受威胁提供兵力支援时，鲁班七号也被送至战场，在途中却因突袭走失。鲁班亲自去往邻城，一边支援前线，一边寻找七号下落。在此期间，他创造了一副六臂机械以应付各种混乱的局面。但直到战争结束，鲁班七号仍旧没有下落。', '2019-02-05 00:00:00', '1', '1', '1', '/imgs/15-2.jpg', '/imgs/15-1.jpg');
INSERT INTO `article` VALUES ('3', '西施', '南荒并非无忧童年的乐土，西施自小学会了各种谋生的小把戏。但她童年首次倒卖捡来的宝贝，就意外欠下了一大笔债务。在躲避追赶时，她闯进了女神的古祠堂，并带出来一条富有魔力的轻纱。\r\n纱的力量来自遥远神秘的南洲，和她的家族息息相关。这力量在随后几年多次保护她，但也引来了觊觎之人。他们假借债主之名纠缠不休，并精心筹划了一场诱捕。不明真相的西施被庄周所救，隐姓埋名来到稷下。一边学习魔道课程，一边参与各种大奖赛事，希望在还清债务后，能像庄周老师一样行走世间。', '2019-02-05 00:00:00', '1', '66', '2', '/imgs/16-2.jpg', '/imgs/16-1.jpg');
INSERT INTO `article` VALUES ('4', '大乔', '前尘往事，如烟如梦，想来缘浅，奈何情深\r\n沉迷凄美传说的少女姐妹，扮作心目中的青蛇白蛇，漫步在山水依旧的西子湖畔，找寻那些古老的浪漫。杨柳岸边，细雨如烟。她们依倚断桥，凭栏远眺，西湖畔的美丽传说在波光碎影中浮现。倒影中缠绵交织的青白蛇翩然起舞，那些穿越前世今生的回忆纷纷袭来。原来青白蛇的故事不止是凄美的传说。情定前尘，人间百转，今生的姐妹情正是倒影中青白蛇的前缘再续。断桥青石已老，刻骨铭心的记忆却没有斑驳。青白蛇形影相依、出生入死的姐妹之情，越过了生生世世，如今化作少女二人，仍相守在人间。千年之缘，终会相会。今生，还有你作伴。', '2019-02-05 00:00:00', '2', '11', '1', '/imgs/1.jpg', '/imgs/1.jpg');
INSERT INTO `article` VALUES ('5', '嫦娥', '如梦令,月嶂星津难渡，玉矢金盟信误。若忆鹊仙桥，永夜迢迢谁顾。,所谓“主人”的信息碎片\r\n,朝暮，朝暮，又到梦逢君处。“梦指引了命运般的邂逅……,自相逢之时，碎片样的往事就不断涌现……”,在梦中看到鹊桥上命定之人后，云上的神女就邂逅了人间的神射手，而他们之间，却早注定了不知来自哪个前生的羁绊……', '2019-02-05 00:00:00', '2', '12', '2', '/imgs/2.jpg', '/imgs/2.jpg');
INSERT INTO `article` VALUES ('6', '典韦', '他放眼望去，目之所及只有黑沉沉的夜。魔魇潜伏在暗处，他看不见它们，但能闻到风中传来的恶臭。崇泰五天五夜没合过眼，巍峨的身躯宛如一座铁塔镇守着身后这方土地。他累极了，体力早已透支，手中的铁斧重逾千斤，刃口卷曲，诱惑着他倒向大地。全凭最后一点信念支撑，崇泰才没有倒下。', '2019-02-05 00:00:00', '2', '99', '2', '/imgs/3.jpg', '/imgs/3.jpg');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '运', '3');
INSERT INTO `category` VALUES ('2', '心情', '2');

-- ----------------------------
-- Table structure for mark
-- ----------------------------
DROP TABLE IF EXISTS `mark`;
CREATE TABLE `mark` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  PRIMARY KEY (`mid`),
  KEY `uid` (`uid`),
  CONSTRAINT `mark_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mark
-- ----------------------------
INSERT INTO `mark` VALUES ('1', '云中君气息调息完成后展翅飞行', '2020-02-05 00:00:00', '3', '1');
INSERT INTO `mark` VALUES ('2', '增加移动速度的同时能够免受地形阻挡的影响', '2020-02-05 00:00:00', '5', '1');
INSERT INTO `mark` VALUES ('3', '飞行期间云中君的普通攻击将会变为爪击', '2020-02-05 00:00:00', '1', '1');
INSERT INTO `mark` VALUES ('4', '鲁班大师的技能在施法或命中目标时会为自己提供1层吸收30', '2020-02-05 00:00:00', '2', '2');
INSERT INTO `mark` VALUES ('5', '西施的技能伤害会随着自身与敌人间的距离增加而增加', '2020-02-05 00:00:00', '4', '3');
INSERT INTO `mark` VALUES ('6', '西施将法器的力量灌注到自己体内', '2020-02-05 00:00:00', '2', '3');
INSERT INTO `mark` VALUES ('7', '大乔召唤鲤鱼向指定方向跳跃', '2020-02-05 00:00:00', '5', '4');
INSERT INTO `mark` VALUES ('8', '嫦娥受到月光的守护，以自身法力值产生的护盾抵挡60%伤害', '2020-02-05 00:00:00', '3', '5');
INSERT INTO `mark` VALUES ('9', '短暂的施法后，嫦娥在身边和指定位置召唤法力旋涡持续4秒', '2020-02-05 00:00:00', '3', '5');
INSERT INTO `mark` VALUES ('10', '典韦每一次击败英雄或者助攻会增加1层激怒效果', '2020-02-05 00:00:00', '1', '6');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  KEY `aid` (`aid`),
  CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `article` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', '流云之翼', '1');
INSERT INTO `tag` VALUES ('2', '神匠', '2');
INSERT INTO `tag` VALUES ('3', '幻纱之灵', '3');
INSERT INTO `tag` VALUES ('4', '沧海之曜', '4');
INSERT INTO `tag` VALUES ('5', '寒月公主', '5');
INSERT INTO `tag` VALUES ('6', '狂战士', '6');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` int(3) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `portrait` varchar(300) DEFAULT NULL,
  `regtime` datetime DEFAULT NULL,
  `isforbid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'aa', '123', '11111111111', '11111111@qq.com', '/imgs/14-1.jpg', '2020-02-05 00:00:00', null);
INSERT INTO `user` VALUES ('2', 'bb', '123', '22222222222', '22222222@qq.com', null, '2020-02-05 00:00:00', null);
INSERT INTO `user` VALUES ('3', 'cc', '123', '33333333333', '33333333@qq.com', null, '2020-02-05 00:00:00', null);
INSERT INTO `user` VALUES ('4', 'dd', '123', '44444444444', '44444444@qq.com', null, '2020-02-05 00:00:00', null);
INSERT INTO `user` VALUES ('5', 'ee', '123', '55555555555', '55555555@qq.com', null, '2020-02-05 00:00:00', null);
INSERT INTO `user` VALUES ('6', 'xcxc', '123', '15304451002', null, null, null, '0');
INSERT INTO `user` VALUES ('7', 'de', '123', '15304451002', null, null, null, '0');
INSERT INTO `user` VALUES ('8', 'fr', '123', '15304451002', null, null, null, '0');
INSERT INTO `user` VALUES ('9', 'gt', '433', '15464437882', null, null, null, '0');
INSERT INTO `user` VALUES ('11', 'cdd', '123', '15304451002', '123@qq.com', '/static/img/avatar-1.jpg', null, '0');
INSERT INTO `user` VALUES ('12', 'derr', '123', '15304451002', '123@qq.com', '/static/img/avatar-1.jpg', null, '0');
INSERT INTO `user` VALUES ('13', 'frtt', '123', '15304451002', '123@qq.com', '/static/img/avatar-1.jpg', null, '0');
INSERT INTO `user` VALUES ('14', 'derg', '123', '15304451002', '123@qq.com', '/static/img/avatar-1.jpg', null, '0');
INSERT INTO `user` VALUES ('15', 'zx', '123', '15377283293', '123@qq.com', '/static/img/avatar-1.jpg', null, '0');
