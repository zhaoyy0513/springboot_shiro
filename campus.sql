/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : campus

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 16/10/2019 16:13:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for focus
-- ----------------------------
DROP TABLE IF EXISTS `focus`;
CREATE TABLE `focus`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '关注索引',
  `user_id` int(12) NOT NULL COMMENT '用户索引id',
  `focused_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '被关注者的索引id',
  `deleted` int(20) NULL DEFAULT NULL,
  `version` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of focus
-- ----------------------------
INSERT INTO `focus` VALUES (2, 23, '3;4;5', 1, '1');
INSERT INTO `focus` VALUES (3, 5, '2;3', 1, '1');
INSERT INTO `focus` VALUES (10, 4, '2;', 1, '1');
INSERT INTO `focus` VALUES (12, 6, '1;3', 1, '1');
INSERT INTO `focus` VALUES (18, 2, '3;1;5', 1, '1');
INSERT INTO `focus` VALUES (19, 3, '2;6', 1, '1');
INSERT INTO `focus` VALUES (20, 16, '3;4', 0, '1');
INSERT INTO `focus` VALUES (21, 23, '3;4;5', 0, '1');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(10) NULL DEFAULT NULL COMMENT '菜单拥有者id',
  `name` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单名',
  `url` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 0, '主页', '/index/admin');
INSERT INTO `menu` VALUES (2, 0, '管理员', '/admin');
INSERT INTO `menu` VALUES (3, 0, '增加', '/insert');
INSERT INTO `menu` VALUES (4, 0, '删除', '/delete');
INSERT INTO `menu` VALUES (5, 1, '教师的主页', '/index/teacher');
INSERT INTO `menu` VALUES (6, 2, '学生主页', '/index/student');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '帖子id',
  `post_user_id` int(40) NOT NULL COMMENT '发帖用户的索引id',
  `post_user_name` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '发帖id',
  `post_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '帖子标题',
  `post_tab_id` int(20) NOT NULL COMMENT '帖子标签(分类)',
  `post_tab_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '帖子标签名',
  `tab_parentid` int(10) UNSIGNED NOT NULL COMMENT '帖子标签的父标签名',
  `post_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '帖子内容',
  `post_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '发帖时间 ',
  `post_content_img` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发帖附带的图片',
  `post_user_icon` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发帖人照片',
  `post_click_count` int(10) NULL DEFAULT 0 COMMENT '帖子点击数',
  `post_reply_count` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '帖子回复数',
  `post_last_reply` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '帖子最后回复者',
  `post_last_reply_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '帖子最后回复时间',
  `post_last_reply_time_simple` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '帖子最后回复时间(差值)用来显示在页面上',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userid`(`post_user_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, 2, '吹不散眉弯', '找找一份实习工作', 14, '实习', 2, '本人软件学院的一名15级学生，想要找一份软件工程,java方向的工作，有没有大佬能够帮我引荐一下，或者推荐一下工作什么的啊，非常感谢啊。', '2019-03-29 10:34:51', '226ce810-c32d-4ce5-993f-3986ee9aad06.PNG', '', 108, 1, '深蓝梦境', '2019-05-16 10:14:10', '27天5小时57分钟之前');
INSERT INTO `post` VALUES (2, 2, '吹不散眉弯', '今天学到了一点新的东西，跟同学们分享一下', 9, '工学', 1, '今天学习了设计模式，发现里面很多东西都非常值得思考，今天刚刚学习了策略模式，感觉非常不错，希望大家都可以学习一下，', '2019-03-29 10:38:08', '51d89138-372b-42e7-91c9-78afef1c52a3.PNG', '', 459, 19, '深蓝梦境', '2019-06-12 16:10:56', '1分钟之前');
INSERT INTO `post` VALUES (4, 1, 'root', 'B 站的同学，你们能不能不要在移动端主页投毒了？', 10, '理学', 1, '每次手机重装系统之后去 B 站主页( https://m.bilibili.com/index.html) 下客户端，都会下到国际版。只能安装客户端后去问客服要国内的客户端，再重新装一次。​为什么移动端首页不能改成国内的？国际版的没有免流服务，我要它何用？', '2019-04-01 09:09:08', '', '', 61, 2, '朝气蓬勃', '2019-05-05 15:57:41', '38天0小时15分钟之前');
INSERT INTO `post` VALUES (5, 2, '吹不散眉弯', '测试下管理学代码', 12, '管理学', 1, '如果管理学代码测试成功！，那么今天就完成了很大的一部分工作！加油 2019/4/1', '2019-04-01 11:27:28', '', NULL, 160, 8, '一首歌从深情唱', '2019-05-17 14:36:45', '26天1小时35分钟之前');
INSERT INTO `post` VALUES (6, 2, '吹不散眉弯', '理学的二次测试', 10, '理学', 1, '如果这次理学测试成功，那么真的一二级标题联动就正式写完了！', '2019-04-01 16:09:43', '', NULL, 106, 10, 'root', '2019-05-28 22:13:08', '14天17小时59分钟之前');
INSERT INTO `post` VALUES (7, 1, 'root', 'ajax出问题了', 16, '全职', 2, '后台我将两个list放到了一个map里，但是问题是我想把其中一个list的值渲染到前台的某个div中，因为那个div本身就已经是个list循环出来的(是上一个页面点击渲染的)，但是ajax返回之后 我不知道 应该怎么写下面是前台的代码:(这个list本来是有值的 )', '2019-04-09 14:00:01', '', NULL, 39, 3, '朝气蓬勃', '2019-05-05 17:55:47', '37天22小时16分钟之前');
INSERT INTO `post` VALUES (8, 1, 'root', '有河南老乡在深圳实习吗？', 30, '华中天地', 5, '题主现在在深圳，想看看有没有校友啊，有空一起玩，一起交流，一起学习啊..', '2019-04-19 17:02:26', '', NULL, 9, 1, '一首歌从深情唱', '2019-04-19 17:03:37', '53天22小时43分钟之前');
INSERT INTO `post` VALUES (9, 3, '一首歌从深情唱', '软件学院实验室招新', 41, '软件学院', 8, '软件学院303实验室招新，具体的详情，可以去303实验室查看，获取去302找老师咨询，欢迎各位！', '2019-04-22 14:50:54', '', NULL, 50, 3, '一首歌从深情唱', '2019-05-17 19:00:07', '25天21小时14分钟之前');
INSERT INTO `post` VALUES (10, 2, '吹不散眉弯', '丢了一本书', 37, '不慎丢失', 6, '大家好，今天我不慎在一教楼102丢了一本书，书名为\"数据库设计与案例\",书的第一页写的有我的名字张云雷，希望有见到的朋友    能够@一下我，谢谢你们！', '2019-05-13 17:39:07', '', NULL, 13, 2, '吹不散眉弯', '2019-05-13 17:52:20', '29天21小时55分钟之前');
INSERT INTO `post` VALUES (11, 4, '朝气蓬勃', '柯南2019剧场版出来有一起去看的吗', 19, '动漫天地', 3, '今年的剧场版，很快就要出来啊，啊哈哈，作为柯南迷的我一定是要去看的了，你们谁去看啊，下面评论到时候我们一起啊！', '2019-05-13 17:51:13', '', NULL, 11, 0, '', '', '');
INSERT INTO `post` VALUES (12, 5, '深蓝梦境', '实验室招新', 41, '软件学院', 8, '学院很多实验室又开始新的招新了，具体的招新情况请去学院区查看具体细节！', '2019-05-17 11:37:00', '', NULL, 2, 0, '', '', '');

-- ----------------------------
-- Table structure for postcollection
-- ----------------------------
DROP TABLE IF EXISTS `postcollection`;
CREATE TABLE `postcollection`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '收藏帖子索引',
  `user_id` int(12) NOT NULL COMMENT '收藏者id',
  `post_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '帖子索引id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of postcollection
-- ----------------------------
INSERT INTO `postcollection` VALUES (2, 4, '5;3;4;6;8;');
INSERT INTO `postcollection` VALUES (4, 2, '6;10;');
INSERT INTO `postcollection` VALUES (5, 5, '1;');
INSERT INTO `postcollection` VALUES (6, 3, '2;');

-- ----------------------------
-- Table structure for problem
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem`  (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '问题的索引id',
  `problem_id` int(12) NOT NULL COMMENT '问题id',
  `problem_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '问题名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of problem
-- ----------------------------
INSERT INTO `problem` VALUES (1, 1, '初中学校的名字');
INSERT INTO `problem` VALUES (2, 2, '高中学校的名字');
INSERT INTO `problem` VALUES (3, 3, '初中班主任名字');
INSERT INTO `problem` VALUES (4, 4, '高中班主任名字');
INSERT INTO `problem` VALUES (5, 5, '印象最深刻的同桌');
INSERT INTO `problem` VALUES (6, 6, '母亲的姓名');
INSERT INTO `problem` VALUES (7, 7, '父亲的姓名');
INSERT INTO `problem` VALUES (8, 8, '伴侣的姓名');
INSERT INTO `problem` VALUES (9, 9, '最难忘的日期(20xx-xx-xx)');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '回复id',
  `post_id` int(20) NOT NULL COMMENT '帖子id',
  `reply_user_id` int(40) NULL DEFAULT NULL COMMENT '回复者索引Id',
  `reply_user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '回复者用户名',
  `reply_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '回复内容',
  `reply_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '回复时间',
  `reply_floor` int(10) UNSIGNED NOT NULL COMMENT '回复层数',
  `reply_time_simple` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '回复时间简写',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `postid`(`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES (1, 6, 2, '吹不散眉弯', '我感觉这次测试会成功!', '2019-04-02 17:11:30', 1, '70天22小时41分钟之前');
INSERT INTO `reply` VALUES (2, 6, 2, '吹不散眉弯', '这测试的第二条回复 看看会不会成功', '2019-04-02 17:39:52', 2, '70天22小时13分钟之前');
INSERT INTO `reply` VALUES (3, 6, 2, '吹不散眉弯', '现在进行第三条回复测试', '2019-04-02 18:04:21', 3, '70天21小时48分钟之前');
INSERT INTO `reply` VALUES (4, 6, 2, '吹不散眉弯', '第四次测试看看到底哪里有问题', '2019-04-02 18:07:16', 4, '70天21小时45分钟之前');
INSERT INTO `reply` VALUES (5, 6, 2, '吹不散眉弯', '第五次测试！，这次一定要成功啊！', '2019-04-02 18:10:02', 5, '70天21小时43分钟之前');
INSERT INTO `reply` VALUES (6, 2, 1, 'root', '那本书我也看了，我打算明天再看一遍', '2019-04-08 14:40:15', 1, '65天1小时32分钟之前');
INSERT INTO `reply` VALUES (7, 2, 1, 'root', '那本书我也看了，我打算明天再看一遍', '2019-04-08 14:41:05', 2, '65天1小时31分钟之前');
INSERT INTO `reply` VALUES (9, 5, 3, '一首歌从深情唱', '哈哈，测试差不多可以结束了，真正的实现了相应的功能操作，和应有的逻辑，不负初心，不负己！', '2019-04-08 15:35:53', 1, '65天0小时19分钟之前');
INSERT INTO `reply` VALUES (10, 2, 3, '一首歌从深情唱', '现在测试一下时间的更新看看对不对', '2019-04-08 16:54:52', 3, '64天23小时18分钟之前');
INSERT INTO `reply` VALUES (11, 2, 3, '一首歌从深情唱', '我来更新一下时间，看看时间对不对', '2019-04-08 17:27:07', 4, '64天22小时45分钟之前');
INSERT INTO `reply` VALUES (13, 4, 3, '一首歌从深情唱', '真是个悲伤的故事，时间测试还是没有完全成功！', '2019-04-08 18:16:30', 1, '53天0小时11分钟之前');
INSERT INTO `reply` VALUES (14, 4, 2, '吹不散眉弯', '我感觉如果真的可能的话，或许我们可以调整一下思路，重新把时间好好划分一下，这样的话应该就不会有太大问题', '2019-04-09 09:08:22', 2, '52天9小时19分钟之前');
INSERT INTO `reply` VALUES (15, 2, 2, '吹不散眉弯', '就奇怪不知道为啥感觉效率很慢呢，', '2019-04-09 09:18:06', 5, '64天6小时54分钟之前');
INSERT INTO `reply` VALUES (16, 2, 1, 'root', '测试', '2019-04-09 09:53:51', 6, '64天6小时19分钟之前');
INSERT INTO `reply` VALUES (17, 2, 1, 'root', '测试下时间是否是正确的', '2019-04-09 09:55:55', 7, '64天6小时17分钟之前');
INSERT INTO `reply` VALUES (18, 7, 2, '吹不散眉弯', '测试一下距离！', '2019-04-09 15:10:06', 1, '61天22小时27分钟之前');
INSERT INTO `reply` VALUES (19, 8, 3, '一首歌从深情唱', '有啊，我就在深圳，现在在龙岗区，你在哪个区呢，有空可以见个面啊，，哈哈~', '2019-04-19 17:03:37', 1, '19天20小时54分钟之前');
INSERT INTO `reply` VALUES (20, 9, 1, 'root', '今天下午去，老师不在办公室，明天再去看一下', '2019-04-22 15:57:04', 1, '39天2小时51分钟之前');
INSERT INTO `reply` VALUES (26, 2, 3, '一首歌从深情唱', '测试一下，回复为空和不为空的区别6', '2019-04-23 13:41:04', 8, '50天2小时31分钟之前');
INSERT INTO `reply` VALUES (27, 9, 3, '一首歌从深情唱', '今天再去看一眼，看看老师在不在办公室~', '2019-04-24 09:36:35', 7, '37天9小时12分钟之前');
INSERT INTO `reply` VALUES (28, 5, 2, '吹不散眉弯', '我先来测试一下，不@人试一试！', '2019-04-26 09:15:33', 2, '47天6小时39分钟之前');
INSERT INTO `reply` VALUES (29, 5, 2, '吹不散眉弯', '啊啊啊啊啊', '2019-04-26 09:25:21', 2, '47天6小时29分钟之前');
INSERT INTO `reply` VALUES (30, 6, 2, '吹不散眉弯', '我来测试一下是不是能成功', '2019-04-26 14:02:41', 6, '47天1小时50分钟之前');
INSERT INTO `reply` VALUES (31, 2, 2, '吹不散眉弯', '我就是为了测试看看动画', '2019-04-26 15:34:19', 9, '47天0小时38分钟之前');
INSERT INTO `reply` VALUES (32, 2, 2, '吹不散眉弯', '我就是为了测试看看动画', '2019-04-26 15:34:21', 10, '47天0小时38分钟之前');
INSERT INTO `reply` VALUES (33, 2, 2, '吹不散眉弯', '我就是为了测试看看动画', '2019-04-26 15:34:24', 11, '47天0小时38分钟之前');
INSERT INTO `reply` VALUES (34, 2, 2, '吹不散眉弯', '我就是为了测试看看动画', '2019-04-26 15:34:27', 12, '47天0小时38分钟之前');
INSERT INTO `reply` VALUES (35, 2, 2, '吹不散眉弯', '我就是为了测试看看动画', '2019-04-26 15:34:30', 13, '47天0小时38分钟之前');
INSERT INTO `reply` VALUES (36, 2, 2, '吹不散眉弯', '我就是为了测试看看动画', '2019-04-26 15:34:34', 14, '47天0小时38分钟之前');
INSERT INTO `reply` VALUES (37, 2, 2, '吹不散眉弯', '@root 我来试试到底有没有给你发信息成功啊 如果成功！信息发送功能就完成了 ！哈哈哈', '2019-04-26 16:45:44', 15, '46天23小时27分钟之前');
INSERT INTO `reply` VALUES (43, 7, 4, '朝气蓬勃', '测试一下如果不@是不是成功！', '2019-05-05 17:55:18', 2, '35天19小时41分钟之前');
INSERT INTO `reply` VALUES (44, 7, 4, '朝气蓬勃', '测试一下@是否能成功！ 如果成功就完成了！', '2019-05-05 17:55:47', 3, '35天19小时41分钟之前');
INSERT INTO `reply` VALUES (47, 5, 2, '吹不散眉弯', '@一首歌从深情唱  这时候测试一下应该没啥问题了 就可以收工了！', '2019-05-07 17:56:55', 4, '35天21小时58分钟之前');
INSERT INTO `reply` VALUES (48, 5, 3, '一首歌从深情唱', '@吹不散眉弯 测试下东西啊！成功了就完成了！', '2019-05-07 18:20:09', 5, '35天21小时35分钟之前');
INSERT INTO `reply` VALUES (49, 5, 2, '吹不散眉弯', '我知道啊，如果这一块没有问题了，那么久彻底的成功了 未读信息这个模块！', '2019-05-07 18:35:00', 6, '35天21小时20分钟之前');
INSERT INTO `reply` VALUES (50, 5, 4, '朝气蓬勃', '@吹不散眉弯 再来测试一下是，未读信息功能是不是实现', '2019-05-07 18:40:21', 7, '35天21小时14分钟之前');
INSERT INTO `reply` VALUES (53, 6, 4, '朝气蓬勃', '@吹不散眉弯 应该是测试成功了吧！测试成功之后这个模块就结束了！', '2019-05-08 11:45:27', 7, '35天4小时7分钟之前');
INSERT INTO `reply` VALUES (54, 6, 1, 'root', '@朝气蓬勃 未读信息算是彻底完成了！，加油帖子收藏模块', '2019-05-08 11:53:40', 8, '35天3小时59分钟之前');
INSERT INTO `reply` VALUES (55, 6, 3, '一首歌从深情唱', '@吹不散眉弯 对的 ，加油，最后一个大模块-收藏模块！', '2019-05-08 11:54:33', 9, '35天3小时58分钟之前');
INSERT INTO `reply` VALUES (56, 10, 4, '朝气蓬勃', '我今天好像看见啦，一本红皮子的，放在一教外面的管理处了，你去看看啊', '2019-05-13 17:50:10', 1, '14天20小时7分钟之前');
INSERT INTO `reply` VALUES (57, 10, 2, '吹不散眉弯', '@朝气蓬勃 好的，我知道了~谢谢你啊，一会下课我就去看看！', '2019-05-13 17:52:20', 2, '14天20小时5分钟之前');
INSERT INTO `reply` VALUES (60, 6, 5, '深蓝梦境', '哈哈哈哈哈哈', '2019-05-15 10:32:15', 10, '28天5小时20分钟之前');
INSERT INTO `reply` VALUES (66, 1, 5, '深蓝梦境', '收藏一下，说不定以后我也需要找实习工作！', '2019-05-16 10:14:10', 1, '0秒之前');
INSERT INTO `reply` VALUES (67, 5, 3, '一首歌从深情唱', '@朝气蓬勃 我感觉有必要重新好好测一下东西~', '2019-05-17 14:36:45', 9, '26天1小时18分钟之前');
INSERT INTO `reply` VALUES (68, 9, 3, '一首歌从深情唱', '我今天去办公室发现确实有人了啊，同学们可以去看看', '2019-05-17 19:00:07', 8, '13天23小时48分钟之前');
INSERT INTO `reply` VALUES (69, 2, 3, '一首歌从深情唱', '啊实打实的', '2019-05-28 13:50:00', 13, '15天2小时22分钟之前');
INSERT INTO `reply` VALUES (70, 6, 1, 'root', '@吹不散眉弯 现在测试下内容校验，看看非法回复是否能提交成功，这是测试正常的语句！', '2019-05-28 22:13:08', 13, '14天17小时40分钟之前');
INSERT INTO `reply` VALUES (72, 2, 5, '深蓝梦境', '@一首歌从深情唱 测试1', '2019-06-12 16:08:52', 13, '4分钟之前');
INSERT INTO `reply` VALUES (73, 2, 5, '深蓝梦境', '你是一条狗', '2019-06-12 16:10:22', 13, '2分钟之前');
INSERT INTO `reply` VALUES (74, 2, 5, '深蓝梦境', '你像一条狗', '2019-06-12 16:10:56', 13, '2分钟之前');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 0, '管理员');
INSERT INTO `role` VALUES (2, 1, '普通用户');
INSERT INTO `role` VALUES (3, 2, '教师');

-- ----------------------------
-- Table structure for tab
-- ----------------------------
DROP TABLE IF EXISTS `tab`;
CREATE TABLE `tab`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `tab_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签名',
  `parent_id` int(20) NOT NULL COMMENT '父标签id',
  `tab_describe` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签简介',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tab
-- ----------------------------
INSERT INTO `tab` VALUES (1, '学霸', 0, '0');
INSERT INTO `tab` VALUES (2, '酷工作', 0, '0');
INSERT INTO `tab` VALUES (3, '娱乐畅享', 0, '0');
INSERT INTO `tab` VALUES (4, '知性感性', 0, '0');
INSERT INTO `tab` VALUES (5, '乡情友谊', 0, '0');
INSERT INTO `tab` VALUES (6, '失物招领', 0, '0');
INSERT INTO `tab` VALUES (7, '二手交易', 0, '0');
INSERT INTO `tab` VALUES (8, '学院分区', 0, '0');
INSERT INTO `tab` VALUES (9, '工学', 1, '分享你的工学生活');
INSERT INTO `tab` VALUES (10, '理学', 1, '分享你的理学生活');
INSERT INTO `tab` VALUES (11, '法学', 1, '分享你的法学生活');
INSERT INTO `tab` VALUES (12, '管理学', 1, '分享你的管理学生活');
INSERT INTO `tab` VALUES (13, '教育学', 1, '分享你的教育学生活');
INSERT INTO `tab` VALUES (14, '实习', 2, '发布实习&&寻找实习');
INSERT INTO `tab` VALUES (15, '兼职', 2, '发布兼职&&寻找兼职');
INSERT INTO `tab` VALUES (16, '全职', 2, '发布全职&&寻找全职');
INSERT INTO `tab` VALUES (17, 'Geek', 3, '我是Geek，我为自己代言');
INSERT INTO `tab` VALUES (18, '游戏天地', 3, '游戏虽好，可别贪时');
INSERT INTO `tab` VALUES (19, '动漫天地', 3, '二次元，三次元，萌即是王道');
INSERT INTO `tab` VALUES (20, '美食天地', 3, '做一个吃货，是这辈子最幸福的事');
INSERT INTO `tab` VALUES (21, '旅行分享', 3, '成为背包客，带你看世界');
INSERT INTO `tab` VALUES (22, '笑口常开', 3, '笑口常开，好彩自然来');
INSERT INTO `tab` VALUES (23, '流行歌坛', 3, '初闻不知曲中意，再听已是曲中人');
INSERT INTO `tab` VALUES (24, '鹊桥', 4, '在天愿作比翼鸟，在地愿做连理枝');
INSERT INTO `tab` VALUES (25, '别问我是谁', 4, '说说秘密吧');
INSERT INTO `tab` VALUES (26, '谈情说爱', 4, '分享感情，共同成长');
INSERT INTO `tab` VALUES (27, '梦之彼岸', 4, '每个人都是大梦想家');
INSERT INTO `tab` VALUES (28, '男孩子', 4, '属于男孩子的小天堂，女孩子勉强进来吧');
INSERT INTO `tab` VALUES (29, '女孩子', 4, '属于女孩子的小天堂，男孩子勉强进来吧');
INSERT INTO `tab` VALUES (30, '华中天地', 5, '我来自华中');
INSERT INTO `tab` VALUES (31, '华南风采', 5, '我来自华南');
INSERT INTO `tab` VALUES (32, '华东风情', 5, '我来自华东');
INSERT INTO `tab` VALUES (33, '华北风韵', 5, '我来自华北');
INSERT INTO `tab` VALUES (34, '西南美景', 5, '我来自西南');
INSERT INTO `tab` VALUES (35, '西北风光', 5, '我来自西北');
INSERT INTO `tab` VALUES (36, '东北豪情', 5, '我来自东北');
INSERT INTO `tab` VALUES (37, '不慎丢失', 6, '不小心丢掉了个重要的东西');
INSERT INTO `tab` VALUES (38, '刚好碰到', 6, '有幸捡到了这个重要的东西');
INSERT INTO `tab` VALUES (39, '我想买', 7, '我想淘点好东东~');
INSERT INTO `tab` VALUES (40, '我想卖', 7, '我想忍痛卖点货');
INSERT INTO `tab` VALUES (41, '软件学院', 8, '软件学院事务通知');
INSERT INTO `tab` VALUES (42, '政法学院', 8, '政法学院事务通知');
INSERT INTO `tab` VALUES (43, '体育学院', 8, '体育学院事务通知');
INSERT INTO `tab` VALUES (44, '外国语学院', 8, '外国语学院事务通知');
INSERT INTO `tab` VALUES (45, '艺术设计学院', 8, '艺术设计学院事务通知');
INSERT INTO `tab` VALUES (46, '机电工程学院', 8, '机电工程学院事务通知');
INSERT INTO `tab` VALUES (47, '国际教育学院', 8, '国际教育学院事务通知');
INSERT INTO `tab` VALUES (48, '继续教育学院', 8, '继续教育学院事务通知');
INSERT INTO `tab` VALUES (49, '马克思主义学院', 8, '马克思主义学院事务通知');
INSERT INTO `tab` VALUES (50, '经济与管理学院', 8, '经济与管理学院事务通知');
INSERT INTO `tab` VALUES (51, '电子信息工程学院', 8, '电子信息工程学院事务通知');
INSERT INTO `tab` VALUES (52, '电气信息工程学院', 8, '电气信息工程学院事务通知');
INSERT INTO `tab` VALUES (53, '建筑环境工程学院', 8, '建筑环境工程学院事务通知');
INSERT INTO `tab` VALUES (54, '数学与信息科学学院', 8, '数学与信息科学学院事务通知');
INSERT INTO `tab` VALUES (55, '能源与动力工程学院', 8, '能源与动力学院事务通知');
INSERT INTO `tab` VALUES (56, '食品与生物工程学院', 8, '食品与生物工程学院事务通知');
INSERT INTO `tab` VALUES (57, '烟草科学与工程学院', 8, '烟草科学与工程学院事务通知');
INSERT INTO `tab` VALUES (58, '物理与电子工程学院', 8, '物理与电子工程学院事务通知');
INSERT INTO `tab` VALUES (59, '计算机与通信工程学院', 8, '计算机与通信工程学院事务通知');
INSERT INTO `tab` VALUES (60, '文学', 1, '分享你的文学生活');
INSERT INTO `tab` VALUES (61, '考研', 1, '考研经验分享与收获');
INSERT INTO `tab` VALUES (62, '四六级', 1, '四六级经验分享与收获');
INSERT INTO `tab` VALUES (63, '雅思', 1, '雅思经验分享与收获');
INSERT INTO `tab` VALUES (67, '跟书有关', 7, '这个模块都是跟书有关的，可以买书，卖书');

-- ----------------------------
-- Table structure for timeline
-- ----------------------------
DROP TABLE IF EXISTS `timeline`;
CREATE TABLE `timeline`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` int(12) NOT NULL COMMENT '时间轴对应的用户索引Id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '时间轴内容',
  `release_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '时间轴发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of timeline
-- ----------------------------
INSERT INTO `timeline` VALUES (2, 5, '<svg class=\"icon\" aria-hidden=\"true\"><use xlink:href=\"#icon-xingxingyan\"></use></svg>&nbsp;今天周五了，哈哈，可以休息两天了，回家吃顿大餐~<svg class=\"icon\" aria-hidden=\"true\"><use xlink:href=\"#icon-tiaopi\"></use></svg>&nbsp;', '2019-05-17 14:10:11 星期五');
INSERT INTO `timeline` VALUES (3, 5, '测试一下看看关闭弹窗是否成功！<svg class=\"icon\" aria-hidden=\"true\"><use xlink:href=\"#icon-fennu\"></use></svg>&nbsp;', '2019-05-17 14:14:19 星期五');
INSERT INTO `timeline` VALUES (4, 5, '啊啊啊啊？<svg class=\"icon\" aria-hidden=\"true\"><use xlink:href=\"#icon-baiyan\"></use></svg>&nbsp;', '2019-05-17 14:14:48 星期五');
INSERT INTO `timeline` VALUES (5, 5, '我还就不信了！<svg class=\"icon\" aria-hidden=\"true\"><use xlink:href=\"#icon-jingya\"></use></svg>&nbsp;', '2019-05-17 14:16:23 星期五');
INSERT INTO `timeline` VALUES (6, 5, '测试下自动刷新能不能成功！<svg class=\"icon\" aria-hidden=\"true\"><use xlink:href=\"#icon-kaixin\"></use></svg>&nbsp;', '2019-05-17 14:21:54 星期五');
INSERT INTO `timeline` VALUES (7, 3, '<svg class=\"icon\" aria-hidden=\"true\"><use xlink:href=\"#icon-fankun\"></use></svg>&nbsp;哈哈', '2019-05-24 22:27:40 星期五');

-- ----------------------------
-- Table structure for unread
-- ----------------------------
DROP TABLE IF EXISTS `unread`;
CREATE TABLE `unread`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '未读信息索引',
  `user_id` int(12) NOT NULL COMMENT '用户索引id',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '未读信息',
  `infocome_id` int(12) NOT NULL COMMENT '发送信息者的索引id',
  `infocome_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '回复者用户名',
  `infocome_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '回复时间',
  `post_id` int(12) NOT NULL COMMENT '回复的帖子的索引id',
  `post_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '帖子标题',
  `reply_id` int(12) NULL DEFAULT NULL COMMENT '回复的id(楼层)用来删除评论',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of unread
-- ----------------------------
INSERT INTO `unread` VALUES (1, 1, '我来试试到底有没有给你发信息成功啊 如果成功！信息发送功能就完成了 ！哈哈哈', 2, '吹不散眉弯', '2019-05-05 15:37:21', 2, '今天学到了一点新的东西，跟同学们分享一下', 37);
INSERT INTO `unread` VALUES (8, 1, '测试一下如果不@是不是成功！', 4, '朝气蓬勃', '2019-05-05 15:57:41', 7, 'ajax出问题了', 43);
INSERT INTO `unread` VALUES (9, 2, '测试一下@是否能成功！ 如果成功就完成了！', 4, '朝气蓬勃', '2019-05-05 16:52:14', 7, 'ajax出问题了', 44);
INSERT INTO `unread` VALUES (14, 2, '再来测试一下是，未读信息功能是不是实现', 4, '朝气蓬勃', '2019-05-07 18:40:21', 5, '测试下管理学代码', 50);
INSERT INTO `unread` VALUES (17, 2, '应该是测试成功了吧！测试成功之后这个模块就结束了！', 4, '朝气蓬勃', '2019-05-08 11:45:27', 6, '理学的二次测试', 53);
INSERT INTO `unread` VALUES (18, 4, '未读信息算是彻底完成了！，加油帖子收藏模块', 1, 'root', '2019-05-08 11:53:40', 6, '理学的二次测试', 54);
INSERT INTO `unread` VALUES (19, 2, '对的 ，加油，最后一个大模块-收藏模块！', 3, '一首歌从深情唱', '2019-05-08 11:54:33', 6, '理学的二次测试', 55);
INSERT INTO `unread` VALUES (20, 2, '我今天好像看见啦，一本红皮子的，放在一教外面的管理处了，你去看看啊', 4, '朝气蓬勃', '2019-05-13 17:50:10', 10, '丢了一本书', 56);
INSERT INTO `unread` VALUES (21, 4, '好的，我知道了~谢谢你啊，一会下课我就去看看！', 2, '吹不散眉弯', '2019-05-13 17:52:20', 10, '丢了一本书', 57);
INSERT INTO `unread` VALUES (25, 2, '收藏一下，说不定以后我也需要找实习工作！', 5, '深蓝梦境', '2019-05-16 10:14:10', 1, '找找一份实习工作', 61);
INSERT INTO `unread` VALUES (26, 4, '我感觉有必要重新好好测一下东西~', 3, '一首歌从深情唱', '2019-05-17 14:36:45', 5, '测试下管理学代码', 67);
INSERT INTO `unread` VALUES (27, 2, '啊实打实的', 3, '一首歌从深情唱', '2019-05-28 13:50:00', 2, '今天学到了一点新的东西，跟同学们分享一下', 69);
INSERT INTO `unread` VALUES (28, 2, '现在测试下内容校验，看看非法回复是否能提交成功，这是测试正常的语句！', 1, 'root', '2019-05-28 22:13:08', 6, '理学的二次测试', 70);
INSERT INTO `unread` VALUES (29, 2, '@root@吹不散眉弯 现在测试下内容校验，看看非法回复是否能提交成功，这是测试正常的语句！', 1, 'root', '2019-05-28 22:13:08', 6, '理学的二次测试', 70);
INSERT INTO `unread` VALUES (30, 2, '我感觉你有病', 3, '一首歌从深情唱', '2019-05-31 19:18:00', 2, '今天学到了一点新的东西，跟同学们分享一下', 71);
INSERT INTO `unread` VALUES (31, 3, '测试1', 5, '深蓝梦境', '2019-06-12 16:08:52', 2, '今天学到了一点新的东西，跟同学们分享一下', 71);
INSERT INTO `unread` VALUES (32, 2, '@深蓝梦境@一首歌从深情唱 测试1', 5, '深蓝梦境', '2019-06-12 16:08:52', 2, '今天学到了一点新的东西，跟同学们分享一下', 71);
INSERT INTO `unread` VALUES (33, 2, '你是一条狗', 5, '深蓝梦境', '2019-06-12 16:10:22', 2, '今天学到了一点新的东西，跟同学们分享一下', 73);
INSERT INTO `unread` VALUES (34, 2, '你像一条狗', 5, '深蓝梦境', '2019-06-12 16:10:56', 2, '今天学到了一点新的东西，跟同学们分享一下', 74);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(1) NOT NULL AUTO_INCREMENT COMMENT '索引id',
  `user_role` int(10) NOT NULL COMMENT '用户角色类型(0管理员,2老师可以发学院帖子,1学生不可以)',
  `user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id(学号、工号)',
  `user_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `user_pwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `user_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户手机号',
  `user_college` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户所处院系',
  `problem_id` int(5) NOT NULL COMMENT '找回功能问题的问题id',
  `problem_answer` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '找回功能问题答案',
  `user_sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户性别',
  `user_img` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `unread_message` int(255) UNSIGNED NOT NULL DEFAULT 0 COMMENT '未读消息数',
  `post_collection_num` int(255) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收藏帖子数',
  `focus_number` int(255) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关注的人数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `role_name`(`user_role`) USING BTREE,
  CONSTRAINT `role_name` FOREIGN KEY (`user_role`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 0, '541513250153', 'root', 'admin', '13222222222', '软件学院', 2, '息县三中', '男', NULL, 2, 0, 0);
INSERT INTO `user` VALUES (2, 2, '541513250132', '吹不散眉弯', '1111', '18539270747', '软件学院', 2, '息县第一高级中学', '男', NULL, 11, 2, 1);
INSERT INTO `user` VALUES (3, 1, '541513250222', '一首歌从深情唱', '111', '15299999999', '计算机与通信工程学院', 1, '息县三中', '男', NULL, 1, 1, 2);
INSERT INTO `user` VALUES (4, 1, '544513250136', '朝气蓬勃', '111', '15638053724', '软件学院', 1, '', '男', NULL, 3, 5, 1);
INSERT INTO `user` VALUES (5, 2, '541513250100', '深蓝梦境', '111', '18539270789', '软件学院', 5, '刘华', '男', NULL, 0, 1, 1);
INSERT INTO `user` VALUES (6, 1, '541513250101', 'root2', 'asd', '18539270789', '经济与管理学院', 5, 'ss', '男', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (7, 1, '54151325101', 'asd', 'asd', '18539270777', '物理学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (8, 1, '54151325101', 'asd', 'asd', '18539270777', '物理学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (9, 1, '54151325101', 'asd', 'asd', '18539270777', '物理学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (10, 1, '54151325101', 'asd', 'asd', '18539270777', '物理学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (11, 1, '54151325101', 'asd', 'asd', '18539270777', '物理学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (12, 1, '54151325101', 'asd', 'asd', '18539270777', '物理学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (13, 1, '54151325101', 'asd', 'asd', '18539270777', '物理学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (14, 1, '54151325101', 'asd', 'asd', '18539270777', '物理学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (15, 1, '54151325101', 'asd', 'asd', '18539270777', '物理学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (16, 1, '54151325101', 'asd', 'asd', '18539270777', '软件学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (17, 1, '54151325101', 'asd', 'asd', '18539270777', '软件学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (18, 1, '54151325101', 'asd', 'asd', '18539270777', '软件学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (19, 1, '54151325101', 'asd', 'asd', '18539270777', '软件学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (20, 1, '54151325101', 'asd', 'asd', '18539270777', '软件学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (21, 1, '54151325101', 'asd', 'asd', '18539270777', '软件学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (22, 1, '54151325101', 'asd', 'asd', '18539270777', '软件学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (23, 1, '54151325101', 'asd', 'asd', '18539270777', '软件学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (24, 1, '54151325101', 'asd', 'asd', '18539270777', '体育学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (25, 1, '54151325101', 'asd', 'asd', '18539270777', '软件学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (26, 1, '54151325101', 'asd', 'asd', '18539270777', '软件学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (27, 1, '54151325101', 'asd', 'asd', '18539270777', '体育学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (28, 1, '54151325101', 'asd', 'asd', '18539270777', '软件学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (29, 1, '54151325101', 'asd', 'asd', '18539270777', '体育学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (30, 1, '54151325101', 'asd', 'asd', '18539270777', '软件学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (31, 1, '54151325101', 'asd', 'asd', '18539270777', '体育学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (32, 1, '54151325101', 'asd', 'asd', '18539270777', '外国语学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (33, 1, '54151325101', 'asd', 'asd', '18539270777', '艺术设计学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (34, 1, '54151325101', 'asd', 'asd', '18539270777', '外国语学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (35, 1, '54151325101', 'asd', 'asd', '18539270777', '艺术设计学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (36, 1, '54151325101', 'asd', 'asd', '18539270777', '艺术设计学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (37, 1, '54151325101', 'asd', 'asd', '18539270777', '艺术设计学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (38, 1, '54151325101', 'asd', 'asd', '18539270777', '艺术设计学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (39, 1, '54151325101', 'asd', 'asd', '18539270777', '艺术设计学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (40, 1, '54151325101', 'asd', 'asd', '18539270777', '机电工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (41, 1, '54151325101', 'asd', 'asd', '18539270777', '机电工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (42, 1, '54151325101', 'asd', 'asd', '18539270777', '机电工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (43, 1, '54151325101', 'asd', 'asd', '18539270777', '机电工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (44, 1, '54151325101', 'asd', 'asd', '18539270777', '机电工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (45, 1, '54151325101', 'asd', 'asd', '18539270777', '机电工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (46, 1, '54151325101', 'asd', 'asd', '18539270777', '艺术设计学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (47, 1, '54151325101', 'asd', 'asd', '18539270777', '艺术设计学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (48, 1, '54151325101', 'asd', 'asd', '18539270777', '机电工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (49, 1, '54151325101', 'asd', 'asd', '18539270777', '机电工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (50, 1, '54151325101', 'asd', 'asd', '18539270777', '机电工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (51, 1, '54151325101', 'asd', 'asd', '18539270777', '能源与动力工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (52, 1, '54151325101', 'asd', 'asd', '18539270777', '能源与动力工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (53, 1, '54151325101', 'asd', 'asd', '18539270777', '能源与动力工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (54, 1, '54151325101', 'asd', 'asd', '18539270777', '艺术设计学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (55, 1, '54151325101', 'asd', 'asd', '18539270777', '能源与动力工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (56, 1, '54151325101', 'asd', 'asd', '18539270777', '食品与生物工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (57, 1, '54151325101', 'asd', 'asd', '18539270777', '食品与生物工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (58, 1, '54151325101', 'asd', 'asd', '18539270777', '食品与生物工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (59, 1, '54151325101', 'asd', 'asd', '18539270777', '能源与动力工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (60, 1, '54151325101', 'asd', 'asd', '18539270777', '食品与生物工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (61, 1, '54151325101', 'asd', 'asd', '18539270777', '食品与生物工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (62, 1, '54151325101', 'asd', 'asd', '18539270777', '艺术设计学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (63, 1, '54151325101', 'asd', 'asd', '18539270777', '食品与生物工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (64, 1, '54151325101', 'asd', 'asd', '18539270777', '烟草科学与工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (65, 1, '54151325101', 'asd', 'asd', '18539270777', '烟草科学与工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (66, 1, '54151325101', 'asd', 'asd', '18539270777', '烟草科学与工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (67, 1, '54151325101', 'asd', 'asd', '18539270777', '烟草科学与工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (68, 1, '54151325101', 'asd', 'asd', '18539270777', '食品与生物工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (69, 1, '54151325101', 'asd', 'asd', '18539270777', '烟草科学与工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (70, 1, '54151325101', 'asd', 'asd', '18539270777', '艺术设计学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (71, 1, '54151325101', 'asd', 'asd', '18539270777', '食品与生物工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (72, 1, '54151325101', 'asd', 'asd', '18539270777', '物理与电子工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (73, 1, '54151325101', 'asd', 'asd', '18539270777', '物理与电子工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (74, 1, '54151325101', 'asd', 'asd', '18539270777', '物理与电子工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (75, 1, '54151325101', 'asd', 'asd', '18539270777', '物理与电子工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (76, 1, '54151325101', 'asd', 'asd', '18539270777', '食品与生物工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (77, 1, '54151325101', 'asd', 'asd', '18539270777', '物理与电子工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (78, 1, '54151325101', 'asd', 'asd', '18539270777', '艺术设计学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (79, 1, '54151325101', 'asd', 'asd', '18539270777', '物理与电子工程学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (80, 1, '54151325101', 'asd', 'asd', '18539270777', '数学与信息科学学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (81, 1, '54151325101', 'asd', 'asd', '18539270777', '数学与信息科学学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (82, 1, '54151325101', 'asd', 'asd', '18539270777', '数学与信息科学学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (83, 1, '54151325101', 'asd', 'asd', '18539270777', '数学与信息科学学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (84, 1, '54151325101', 'asd', 'asd', '18539270777', '数学与信息科学学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (85, 1, '54151325101', 'asd', 'asd', '18539270777', '数学与信息科学学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (86, 1, '54151325101', 'asd', 'asd', '18539270777', '数学与信息科学学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (87, 1, '54151325101', 'asd', 'asd', '18539270777', '数学与信息科学学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (88, 1, '54151325101', 'asd', 'asd', '18539270777', '数学与信息科学学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (89, 1, '54151325101', 'asd', 'asd', '18539270777', '数学与信息科学学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (90, 1, '54151325101', 'asd', 'asd', '18539270777', '数学与信息科学学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (91, 1, '54151325101', 'asd', 'asd', '18539270777', '数学与信息科学学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (92, 1, '54151325101', 'asd', 'asd', '18539270777', '数学与信息科学学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (93, 1, '54151325101', 'asd', 'asd', '18539270777', '数学与信息科学学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (94, 1, '54151325101', 'asd', 'asd', '18539270777', '数学与信息科学学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (95, 1, '54151325101', 'asd', 'asd', '18539270777', '数学与信息科学学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (96, 1, '54151325101', 'asd', 'asd', '18539270777', '国际教育学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (97, 1, '54151325101', 'asd', 'asd', '18539270777', '软件学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (98, 1, '54151325101', 'asd', 'asd', '18539270777', '国际教育学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (99, 1, '54151325101', 'asd', 'asd', '18539270777', '软件学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (100, 1, '54151325101', 'asd', 'asd', '18539270777', '软件学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (101, 1, '54151325101', 'asd', 'asd', '18539270777', '国际教育学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (102, 1, '54151325101', 'asd', 'asd', '18539270777', '软件学院', 5, 'sss', '女', NULL, 0, 0, 0);
INSERT INTO `user` VALUES (103, 1, '54151325101', 'asd', 'asd', '18539270777', '软件学院', 5, 'sss', '女', NULL, 0, 0, 0);

-- ----------------------------
-- Table structure for user_menu
-- ----------------------------
DROP TABLE IF EXISTS `user_menu`;
CREATE TABLE `user_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(15) NULL DEFAULT NULL COMMENT '用户id',
  `menus` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户权限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
