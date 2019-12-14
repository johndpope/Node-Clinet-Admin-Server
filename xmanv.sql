/*
 Navicat Premium Data Transfer

 Source Server         : skd
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : 127.0.0.1:3306
 Source Schema         : xmanv

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 14/12/2019 14:17:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for _mysql_session_store
-- ----------------------------
DROP TABLE IF EXISTS `_mysql_session_store`;
CREATE TABLE `_mysql_session_store`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expires` bigint(20) NULL DEFAULT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for skd_admin
-- ----------------------------
DROP TABLE IF EXISTS `skd_admin`;
CREATE TABLE `skd_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员密码',
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别：0男 1 女',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` int(4) NULL DEFAULT 0 COMMENT '状态；0：启用，1：启用',
  `create_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '上次登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of skd_admin
-- ----------------------------
INSERT INTO `skd_admin` VALUES (2, NULL, 'admin', NULL, 'shanyanwt@163.com', '123456', NULL, '0', NULL, 0, '1567476440', '1567476440', NULL);

-- ----------------------------
-- Table structure for skd_article
-- ----------------------------
DROP TABLE IF EXISTS `skd_article`;
CREATE TABLE `skd_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `user_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '暂时使用用户ip未注册时使用',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者邮箱',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容P标签HTML',
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '摘要',
  `cover` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面img图片',
  `classify` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章类型分类： java，js,vue',
  `type` int(4) NOT NULL COMMENT '文章分类，0：首页头部推荐，1：普通文章，2：资讯，3：公告',
  `status` int(4) NULL DEFAULT 0 COMMENT '状态；0：启用，1：禁用',
  `star_number` int(10) NULL DEFAULT 0 COMMENT '收藏数量',
  `number` int(20) NULL DEFAULT 0 COMMENT '阅读数量',
  `create_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of skd_article
-- ----------------------------
INSERT INTO `skd_article` VALUES (65, NULL, NULL, '二狗子终于跑赢项目了', '', '', '\\image\\2019\\11\\SDK_20191124190835.png', 'svn,Git', 0, 0, 0, 2, '1574593723', '1575698208');
INSERT INTO `skd_article` VALUES (66, NULL, NULL, '阿萨达', '<p><strong>阿萨达多所阿萨达<span class=\"ql-cursor\">﻿</span></strong></p>', '', '\\image\\2019\\11\\SDK_20191124191103.png', 'php,阿萨达', 1, 0, 0, 2, '1574593874', '1576250025');
INSERT INTO `skd_article` VALUES (67, NULL, NULL, 'dreqawdv', '', '', '', 'javascript', 0, 0, 0, 0, '1574594223', '1574594223');
INSERT INTO `skd_article` VALUES (68, NULL, NULL, 'sdf ', '<p>sdfs </p>', '', '', 'html5,sdf ', 1, 0, 0, 8, '1574594361', '1576250034');
INSERT INTO `skd_article` VALUES (69, NULL, NULL, 'xmanv.com', '<h1>xmanv.com</h1><p><br></p>', '', '\\image\\2019\\11\\SDK_20191124193044.png', 'mongodb,0', 0, 0, 0, 3, '1574595060', '1575699324');
INSERT INTO `skd_article` VALUES (70, NULL, NULL, '测试 ', '<p><span style=\"color: rgb(34, 34, 34); background-color: rgb(0, 0, 0);\">b</span><span style=\"color: rgb(0, 138, 0); background-color: rgb(0, 0, 0);\">lob:https</span><span style=\"color: rgb(34, 34, 34); background-color: rgb(0, 0, 0);\">://www.youtube.com/1</span><span style=\"color: rgb(255, 255, 0); background-color: rgb(0, 0, 0);\">c9a22b1-8f05</span><span style=\"color: rgb(34, 34, 34); background-color: rgb(0, 0, 0);\">-4521-af8e-95d56dfcf76b</span></p>', '', '\\image\\2019\\12\\SDK_20191207141236.png', 'Git', 0, 0, 0, 4, '1575699196', '1576250012');
INSERT INTO `skd_article` VALUES (71, NULL, NULL, '欧普拉水电费肯德基folk司法局', '<p>萨达十大</p>', '', '\\image\\2019\\12\\SDK_20191207141440.png', '', 3, 0, 0, 1, '1575699283', '1575708162');
INSERT INTO `skd_article` VALUES (72, NULL, NULL, '接口撒旦教卡萨丁劲啊侃大山', '', '', '', '', 2, 0, 0, 2, '1575699311', '1575708141');
INSERT INTO `skd_article` VALUES (73, NULL, NULL, '阿萨达四大', '<p><span style=\"background-color: rgb(251, 251, 251); color: rgb(36, 41, 46);\">&lt;blockquote&gt; &lt;p&gt;在学习koa2之前先简单屡一下express、koa、koa2的关系；众所周知，这三者都是TJ大神的产物，那他们到底有什么不同呢？&lt;br /&gt; express的异步操作是基于es5的回调函数嵌套，koa的异步操作是基于es6的generator函数来实现的，而koa2则是基于es7的async，await来实现的；&lt;/p&gt; &lt;/blockquote&gt; &lt;table&gt; &lt;thead&gt; &lt;tr&gt; &lt;th&gt;web框架&lt;/th&gt; &lt;th&gt;语法&lt;/th&gt; &lt;th&gt;备注&lt;/th&gt; &lt;/tr&gt; &lt;/thead&gt; &lt;tbody&gt; &lt;tr&gt; &lt;td&gt;express&lt;/td&gt; &lt;td&gt;es5&lt;/td&gt; &lt;td&gt;回调嵌套&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td&gt;koa&lt;/td&gt; &lt;td&gt;es6&lt;/td&gt; &lt;td&gt;Generator函数+yield语句+Promise&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td&gt;koa2&lt;/td&gt; &lt;td&gt;es7&lt;/td&gt; &lt;td&gt;async/await+Promise&lt;/td&gt; &lt;/tr&gt; &lt;/tbody&gt; &lt;/table&gt; &lt;h2&gt;&lt;a id=\"_9\"&gt;&lt;/a&gt;基本用法&lt;/h2&gt; &lt;pre&gt;&lt;div class=\"hljs\"&gt;&lt;code class=\"lang-js\"&gt;&lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; Koa = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'koa\'&lt;/span&gt;); &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; app = &lt;span class=\"hljs-keyword\"&gt;new&lt;/span&gt; Koa(); &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; main = &lt;span class=\"hljs-function\"&gt;&lt;span class=\"hljs-params\"&gt;ctx&lt;/span&gt; =&amp;gt;&lt;/span&gt; { &lt;span class=\"hljs-comment\"&gt;/* Koa 提供一个 Context 对象，表示一次对话的上下文（包括 HTTP 请求和 HTTP 回复）。通过加工这个对象，就可以控制返回给用户的内容。*/&lt;/span&gt; ctx.response.body = &lt;span class=\"hljs-string\"&gt;\'hello world\'&lt;/span&gt; &lt;span class=\"hljs-comment\"&gt;// 或者ctx.body = \'hello koa\';&lt;/span&gt; } &lt;span class=\"hljs-comment\"&gt;// main函数相当于一个中间件，挂载到koa实例上&lt;/span&gt; app.use(main); &lt;span class=\"hljs-comment\"&gt;// 监听端口&lt;/span&gt; app.listen(&lt;span class=\"hljs-number\"&gt;8090&lt;/span&gt;); &lt;/code&gt;&lt;/div&gt;&lt;/pre&gt; &lt;h2&gt;&lt;a id=\"HTTP_Response__23\"&gt;&lt;/a&gt;HTTP Response 的类型&lt;/h2&gt; &lt;pre&gt;&lt;div class=\"hljs\"&gt;&lt;code class=\"lang-js\"&gt;&lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; Koa = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'koa\'&lt;/span&gt;); &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; app = &lt;span class=\"hljs-keyword\"&gt;new&lt;/span&gt; Koa(); &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; main = &lt;span class=\"hljs-function\"&gt;&lt;span class=\"hljs-params\"&gt;ctx&lt;/span&gt; =&amp;gt;&lt;/span&gt; { &lt;span class=\"hljs-comment\"&gt;/* ctx.request.accepts()方法如果没有提供类型，则返回 所有 可接受的类型 形如：[ \'text/html\', \'application/xhtml+xml\', \'image/webp\', \'image/apng\', \'application/xml\' ] 若没有找到匹配项则返回false； 如果接收到任何类型的接收头，则会返回第一个类型。 因此，提供的类型的顺序很重要 */&lt;/span&gt; &lt;span class=\"hljs-keyword\"&gt;if&lt;/span&gt; (ctx.request.accepts(&lt;span class=\"hljs-string\"&gt;\'xml\'&lt;/span&gt;)) { &lt;span class=\"hljs-comment\"&gt;// 这里xml判断在先，所以会被先匹配到，所以返回\'&amp;lt;data&amp;gt;Hello World&amp;lt;/data&amp;gt;\'&lt;/span&gt; ctx.response.type = &lt;span class=\"hljs-string\"&gt;\'xml\'&lt;/span&gt;; ctx.response.body = &lt;span class=\"hljs-string\"&gt;\'&amp;lt;data&amp;gt;Hello World&amp;lt;/data&amp;gt;\'&lt;/span&gt;; } &lt;span class=\"hljs-keyword\"&gt;else&lt;/span&gt; &lt;span class=\"hljs-keyword\"&gt;if&lt;/span&gt; (ctx.request.accepts(&lt;span class=\"hljs-string\"&gt;\'json\'&lt;/span&gt;)) { ctx.response.type = &lt;span class=\"hljs-string\"&gt;\'json\'&lt;/span&gt;; ctx.response.body = { &lt;span class=\"hljs-attr\"&gt;data&lt;/span&gt;: &lt;span class=\"hljs-string\"&gt;\'Hello World\'&lt;/span&gt; }; } &lt;span class=\"hljs-keyword\"&gt;else&lt;/span&gt; &lt;span class=\"hljs-keyword\"&gt;if&lt;/span&gt; (ctx.request.accepts(&lt;span class=\"hljs-string\"&gt;\'html\'&lt;/span&gt;)) { ctx.response.type = &lt;span class=\"hljs-string\"&gt;\'html\'&lt;/span&gt;; ctx.response.body = &lt;span class=\"hljs-string\"&gt;\'&amp;lt;p&amp;gt;Hello World&amp;lt;/p&amp;gt;\'&lt;/span&gt;; } &lt;span class=\"hljs-keyword\"&gt;else&lt;/span&gt; { ctx.response.type = &lt;span class=\"hljs-string\"&gt;\'text\'&lt;/span&gt;; ctx.response.body = &lt;span class=\"hljs-string\"&gt;\'Hello World\'&lt;/span&gt;; } }; app.use(main); app.listen(&lt;span class=\"hljs-number\"&gt;8090&lt;/span&gt;); &lt;/code&gt;&lt;/div&gt;&lt;/pre&gt; &lt;h2&gt;&lt;a id=\"_56\"&gt;&lt;/a&gt;网页模板&lt;/h2&gt; &lt;pre&gt;&lt;div class=\"hljs\"&gt;&lt;code class=\"lang-js\"&gt;&lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; Koa = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'koa\'&lt;/span&gt;); &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; app = &lt;span class=\"hljs-keyword\"&gt;new&lt;/span&gt; Koa(); &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; fs = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'fs\'&lt;/span&gt;) &lt;span class=\"hljs-comment\"&gt;// const fs = require(\'fs.promised\')&lt;/span&gt; &lt;span class=\"hljs-comment\"&gt;// 这里把fs.readFile封装成了一个promise对象&lt;/span&gt; &lt;span class=\"hljs-keyword\"&gt;let&lt;/span&gt; readFilePromise = &lt;span class=\"hljs-function\"&gt;&lt;span class=\"hljs-keyword\"&gt;function&lt;/span&gt;(&lt;span class=\"hljs-params\"&gt;url&lt;/span&gt;) &lt;/span&gt;{ &lt;span class=\"hljs-keyword\"&gt;return&lt;/span&gt; &lt;span class=\"hljs-keyword\"&gt;new&lt;/span&gt; &lt;span class=\"hljs-built_in\"&gt;Promise&lt;/span&gt;(&lt;span class=\"hljs-function\"&gt;(&lt;span class=\"hljs-params\"&gt;resolve,reject&lt;/span&gt;) =&amp;gt;&lt;/span&gt; { fs.readFile(url, (err, data) =&amp;gt; { &lt;span class=\"hljs-keyword\"&gt;if&lt;/span&gt; (err) { reject(err); } resolve(data); }) }) } &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; main = &lt;span class=\"hljs-keyword\"&gt;async&lt;/span&gt; ctx =&amp;gt; { &lt;span class=\"hljs-built_in\"&gt;console&lt;/span&gt;.log(&lt;span class=\"hljs-number\"&gt;123&lt;/span&gt;); ctx.response.type = &lt;span class=\"hljs-string\"&gt;\'html\'&lt;/span&gt;; &lt;span class=\"hljs-comment\"&gt;// 这里会等待 await 后的异步任务完成后，再继续往下执行&lt;/span&gt; &lt;span class=\"hljs-keyword\"&gt;let&lt;/span&gt; data = &lt;span class=\"hljs-keyword\"&gt;await&lt;/span&gt; readFilePromise(&lt;span class=\"hljs-string\"&gt;\'./1.html\'&lt;/span&gt;).then(&lt;span class=\"hljs-function\"&gt;(&lt;span class=\"hljs-params\"&gt;data&lt;/span&gt;) =&amp;gt;&lt;/span&gt; { &lt;span class=\"hljs-keyword\"&gt;return&lt;/span&gt; data; }) ctx.response.body = data; }; app.use(main); app.listen(&lt;span class=\"hljs-number\"&gt;8090&lt;/span&gt;); &lt;/code&gt;&lt;/div&gt;&lt;/pre&gt; &lt;h2&gt;&lt;a id=\"koaroute__87\"&gt;&lt;/a&gt;koa-route 模块&lt;/h2&gt; &lt;pre&gt;&lt;div class=\"hljs\"&gt;&lt;code class=\"lang-js\"&gt;&lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; Koa = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'koa\'&lt;/span&gt;); &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; app = &lt;span class=\"hljs-keyword\"&gt;new&lt;/span&gt; Koa(); &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; route = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'koa-route\'&lt;/span&gt;) &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; about = &lt;span class=\"hljs-function\"&gt;&lt;span class=\"hljs-params\"&gt;ctx&lt;/span&gt; =&amp;gt;&lt;/span&gt; { ctx.response.type = &lt;span class=\"hljs-string\"&gt;\'html\'&lt;/span&gt; ctx.response.body = &lt;span class=\"hljs-string\"&gt;\'&amp;lt;a href=\"/\"&amp;gt;Index Page&amp;lt;/a&amp;gt;\'&lt;/span&gt; } &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; main = &lt;span class=\"hljs-function\"&gt;&lt;span class=\"hljs-params\"&gt;ctx&lt;/span&gt; =&amp;gt;&lt;/span&gt; { ctx.response.body = &lt;span class=\"hljs-string\"&gt;\'Hello World\'&lt;/span&gt; } app.use(route.get(&lt;span class=\"hljs-string\"&gt;\'/\'&lt;/span&gt;,main)); &lt;span class=\"hljs-comment\"&gt;// 当请求路径为\'/\'时调用的时main处理函数&lt;/span&gt; app.use(route.get(&lt;span class=\"hljs-string\"&gt;\'/about\'&lt;/span&gt;,about)); &lt;span class=\"hljs-comment\"&gt;// 当请求路径为\'/about\'时调用的时about处理函数&lt;/span&gt; app.listen(&lt;span class=\"hljs-number\"&gt;8090&lt;/span&gt;); &lt;/code&gt;&lt;/div&gt;&lt;/pre&gt; &lt;h2&gt;&lt;a id=\"_107\"&gt;&lt;/a&gt;静态资源&lt;/h2&gt; &lt;pre&gt;&lt;div class=\"hljs\"&gt;&lt;code class=\"lang-js\"&gt;&lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; Koa = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'koa\'&lt;/span&gt;); &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; app = &lt;span class=\"hljs-keyword\"&gt;new&lt;/span&gt; Koa(); &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; route = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'koa-route\'&lt;/span&gt;) &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; server = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'koa-static\'&lt;/span&gt;) &lt;span class=\"hljs-comment\"&gt;// 加载静态资源的模块&lt;/span&gt; &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; path = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'path\'&lt;/span&gt;) &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; fs = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'fs\'&lt;/span&gt;) &lt;span class=\"hljs-keyword\"&gt;let&lt;/span&gt; readFilePromise = &lt;span class=\"hljs-function\"&gt;&lt;span class=\"hljs-keyword\"&gt;function&lt;/span&gt;(&lt;span class=\"hljs-params\"&gt;url&lt;/span&gt;) &lt;/span&gt;{ &lt;span class=\"hljs-keyword\"&gt;return&lt;/span&gt; &lt;span class=\"hljs-keyword\"&gt;new&lt;/span&gt; &lt;span class=\"hljs-built_in\"&gt;Promise&lt;/span&gt;(&lt;span class=\"hljs-function\"&gt;(&lt;span class=\"hljs-params\"&gt;resolve, reject&lt;/span&gt;) =&amp;gt;&lt;/span&gt; { fs.readFile(url, (err, data) =&amp;gt; { &lt;span class=\"hljs-keyword\"&gt;if&lt;/span&gt; (err) { reject(err); } resolve(data); }) }) } &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; about = &lt;span class=\"hljs-function\"&gt;&lt;span class=\"hljs-params\"&gt;ctx&lt;/span&gt; =&amp;gt;&lt;/span&gt; { ctx.response.type = &lt;span class=\"hljs-string\"&gt;\'html\'&lt;/span&gt; ctx.response.body = &lt;span class=\"hljs-string\"&gt;\'&amp;lt;a href=\"/\"&amp;gt;Index Page&amp;lt;/a&amp;gt;\'&lt;/span&gt; } &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; main = &lt;span class=\"hljs-keyword\"&gt;async&lt;/span&gt; ctx =&amp;gt; { ctx.response.type = &lt;span class=\"hljs-string\"&gt;\'html\'&lt;/span&gt;; &lt;span class=\"hljs-keyword\"&gt;let&lt;/span&gt; data = &lt;span class=\"hljs-keyword\"&gt;await&lt;/span&gt; readFilePromise(&lt;span class=\"hljs-string\"&gt;\'./1.html\'&lt;/span&gt;).then(&lt;span class=\"hljs-function\"&gt;(&lt;span class=\"hljs-params\"&gt;data&lt;/span&gt;) =&amp;gt;&lt;/span&gt; { &lt;span class=\"hljs-comment\"&gt;// 实际可省略，详看异步中间件&lt;/span&gt; &lt;span class=\"hljs-keyword\"&gt;return&lt;/span&gt; data; }) ctx.response.body = data; }; &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; redirect = &lt;span class=\"hljs-function\"&gt;&lt;span class=\"hljs-params\"&gt;ctx&lt;/span&gt; =&amp;gt;&lt;/span&gt; { &lt;span class=\"hljs-comment\"&gt;// 重定向，访问\'/redirect\'会被重定向到根路径，返回的StatusCode为302&lt;/span&gt; ctx.response.redirect(&lt;span class=\"hljs-string\"&gt;\'/\'&lt;/span&gt;); }; app.use(server(path.join(__dirname))) &lt;span class=\"hljs-comment\"&gt;// 加载静态资源&lt;/span&gt; app.use(route.get(&lt;span class=\"hljs-string\"&gt;\'/\'&lt;/span&gt;, main)) app.use(route.get(&lt;span class=\"hljs-string\"&gt;\'/about\'&lt;/span&gt;, about)) app.use(route.get(&lt;span class=\"hljs-string\"&gt;\'/redirect\'&lt;/span&gt;, redirect)) app.listen(&lt;span class=\"hljs-number\"&gt;8090&lt;/span&gt;) &lt;/code&gt;&lt;/div&gt;&lt;/pre&gt; &lt;h2&gt;&lt;a id=\"_149\"&gt;&lt;/a&gt;中间件与中间件栈&lt;/h2&gt; &lt;pre&gt;&lt;div class=\"hljs\"&gt;&lt;code class=\"lang-js\"&gt;&lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; Koa = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'koa\'&lt;/span&gt;); &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; app = &lt;span class=\"hljs-keyword\"&gt;new&lt;/span&gt; Koa(); &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; one = &lt;span class=\"hljs-function\"&gt;(&lt;span class=\"hljs-params\"&gt;ctx, next&lt;/span&gt;) =&amp;gt;&lt;/span&gt; { &lt;span class=\"hljs-built_in\"&gt;console&lt;/span&gt;.log(&lt;span class=\"hljs-string\"&gt;\'&amp;gt;&amp;gt; one\'&lt;/span&gt;); next(); &lt;span class=\"hljs-built_in\"&gt;console&lt;/span&gt;.log(&lt;span class=\"hljs-string\"&gt;\'&amp;lt;&amp;lt; one\'&lt;/span&gt;); } &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; two = &lt;span class=\"hljs-function\"&gt;(&lt;span class=\"hljs-params\"&gt;ctx, next&lt;/span&gt;) =&amp;gt;&lt;/span&gt; { &lt;span class=\"hljs-built_in\"&gt;console&lt;/span&gt;.log(&lt;span class=\"hljs-string\"&gt;\'&amp;gt;&amp;gt; two\'&lt;/span&gt;); next(); &lt;span class=\"hljs-built_in\"&gt;console&lt;/span&gt;.log(&lt;span class=\"hljs-string\"&gt;\'&amp;lt;&amp;lt; two\'&lt;/span&gt;); } &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; three = &lt;span class=\"hljs-function\"&gt;(&lt;span class=\"hljs-params\"&gt;ctx, next&lt;/span&gt;) =&amp;gt;&lt;/span&gt; { &lt;span class=\"hljs-built_in\"&gt;console&lt;/span&gt;.log(&lt;span class=\"hljs-string\"&gt;\'&amp;gt;&amp;gt; three\'&lt;/span&gt;); next(); &lt;span class=\"hljs-built_in\"&gt;console&lt;/span&gt;.log(&lt;span class=\"hljs-string\"&gt;\'&amp;lt;&amp;lt; three\'&lt;/span&gt;); } &lt;span class=\"hljs-comment\"&gt;// 最外层的执行顺序由app.use的顺序决定（下面这三个家伙的顺序）&lt;/span&gt; app.use(one); app.use(two); app.use(three); &lt;span class=\"hljs-comment\"&gt;/* &amp;gt;&amp;gt; one &amp;gt;&amp;gt; two &amp;gt;&amp;gt; three &amp;lt;&amp;lt; three &amp;lt;&amp;lt; two &amp;lt;&amp;lt; one */&lt;/span&gt; app.listen(&lt;span class=\"hljs-number\"&gt;8090&lt;/span&gt;); &lt;/code&gt;&lt;/div&gt;&lt;/pre&gt; &lt;h2&gt;&lt;a id=\"_185\"&gt;&lt;/a&gt;异步中间件&lt;/h2&gt; &lt;pre&gt;&lt;div class=\"hljs\"&gt;&lt;code class=\"lang-js\"&gt;&lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; fs = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'fs\'&lt;/span&gt;); &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; Koa = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'koa\'&lt;/span&gt;); &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; app = &lt;span class=\"hljs-keyword\"&gt;new&lt;/span&gt; Koa(); &lt;span class=\"hljs-keyword\"&gt;let&lt;/span&gt; readFilePromise = &lt;span class=\"hljs-function\"&gt;&lt;span class=\"hljs-keyword\"&gt;function&lt;/span&gt;(&lt;span class=\"hljs-params\"&gt;url&lt;/span&gt;) &lt;/span&gt;{ &lt;span class=\"hljs-keyword\"&gt;return&lt;/span&gt; &lt;span class=\"hljs-keyword\"&gt;new&lt;/span&gt; &lt;span class=\"hljs-built_in\"&gt;Promise&lt;/span&gt;(&lt;span class=\"hljs-function\"&gt;(&lt;span class=\"hljs-params\"&gt;resolve,reject&lt;/span&gt;) =&amp;gt;&lt;/span&gt; { fs.readFile(url, (err, data) =&amp;gt; { &lt;span class=\"hljs-keyword\"&gt;if&lt;/span&gt; (err) { reject(err); } resolve(data); }) }) } &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; main = &lt;span class=\"hljs-keyword\"&gt;async&lt;/span&gt; &lt;span class=\"hljs-function\"&gt;&lt;span class=\"hljs-keyword\"&gt;function&lt;/span&gt; (&lt;span class=\"hljs-params\"&gt;ctx, next&lt;/span&gt;) &lt;/span&gt;{ ctx.response.type = &lt;span class=\"hljs-string\"&gt;\'html\'&lt;/span&gt;; &lt;span class=\"hljs-keyword\"&gt;let&lt;/span&gt; data = &lt;span class=\"hljs-keyword\"&gt;await&lt;/span&gt; readFilePromise(&lt;span class=\"hljs-string\"&gt;\'./1.html\'&lt;/span&gt;) &lt;span class=\"hljs-comment\"&gt;// await的作用其实就是替代了then方法，将resolve的值直接返回，使用起来更加方便。&lt;/span&gt; ctx.response.body = data }; app.use(main); app.listen(&lt;span class=\"hljs-number\"&gt;8090&lt;/span&gt;); &lt;/code&gt;&lt;/div&gt;&lt;/pre&gt; &lt;h2&gt;&lt;a id=\"_210\"&gt;&lt;/a&gt;中间件的合成&lt;/h2&gt; &lt;pre&gt;&lt;div class=\"hljs\"&gt;&lt;code class=\"lang-js\"&gt;&lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; Koa = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'koa\'&lt;/span&gt;) &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; app = &lt;span class=\"hljs-keyword\"&gt;new&lt;/span&gt; Koa() &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; compose = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'koa-compose\'&lt;/span&gt;) &lt;span class=\"hljs-comment\"&gt;// koa-compose模块可以将多个中间件合成为一个,我的理解作用是可以不用写多个app.use了&lt;/span&gt; &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; router = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'koa-route\'&lt;/span&gt;) &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; fs = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'fs.promised\'&lt;/span&gt;) &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; server = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'koa-static\'&lt;/span&gt;) &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; path = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'path\'&lt;/span&gt;) &lt;span class=\"hljs-comment\"&gt;/*为了方便处理错误，最好使用try...catch将其捕获。但是，为每个中间件都写try...catch太麻烦， 我们可以让***最外层***的中间件，负责所有中间件的错误处理。*/&lt;/span&gt; &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; handle = &lt;span class=\"hljs-keyword\"&gt;async&lt;/span&gt; (ctx, next) =&amp;gt; { &lt;span class=\"hljs-keyword\"&gt;try&lt;/span&gt; { &lt;span class=\"hljs-keyword\"&gt;await&lt;/span&gt; next() } &lt;span class=\"hljs-keyword\"&gt;catch&lt;/span&gt;(err) { ctx.response.status = err.statusCode || err.status || &lt;span class=\"hljs-number\"&gt;500&lt;/span&gt; ctx.response.body = { &lt;span class=\"hljs-attr\"&gt;message&lt;/span&gt;: err.message } } } &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; logger = &lt;span class=\"hljs-keyword\"&gt;async&lt;/span&gt; (ctx, next) =&amp;gt; { &lt;span class=\"hljs-built_in\"&gt;console&lt;/span&gt;.log(&lt;span class=\"hljs-string\"&gt;`&lt;span class=\"hljs-subst\"&gt;${&lt;span class=\"hljs-built_in\"&gt;Date&lt;/span&gt;.now()}&lt;/span&gt; &lt;span class=\"hljs-subst\"&gt;${ctx.request.method}&lt;/span&gt; &lt;span class=\"hljs-subst\"&gt;${ctx.request.url}&lt;/span&gt;`&lt;/span&gt;); &lt;span class=\"hljs-keyword\"&gt;await&lt;/span&gt; next(); } &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; main = &lt;span class=\"hljs-keyword\"&gt;async&lt;/span&gt; ctx =&amp;gt; { &lt;span class=\"hljs-keyword\"&gt;let&lt;/span&gt; data = &lt;span class=\"hljs-keyword\"&gt;await&lt;/span&gt; fs.readFile(&lt;span class=\"hljs-string\"&gt;\'./1324.html\'&lt;/span&gt;, &lt;span class=\"hljs-string\"&gt;\'utf8\'&lt;/span&gt;) &lt;span class=\"hljs-comment\"&gt;// ctx.throw(500) // 这条语句可以使程序抛出错误被最外层的handle函数捕捉到（原因请参考中间件与中间件栈里的说明）&lt;/span&gt; ctx.response.type = &lt;span class=\"hljs-string\"&gt;\'html\'&lt;/span&gt;; ctx.response.body = data }; &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; middlewares = compose([handle, logger, main]); &lt;span class=\"hljs-comment\"&gt;// 把多个中间件整合到一起（少些app.use）&lt;/span&gt; app.use(server(path.join(__dirname))) app.use(router.get(&lt;span class=\"hljs-string\"&gt;\'/\'&lt;/span&gt;,middlewares)) &lt;span class=\"hljs-comment\"&gt;// 用路由处理对应的中间件&lt;/span&gt; &lt;span class=\"hljs-comment\"&gt;// app.use(middlewares);&lt;/span&gt; app.listen(&lt;span class=\"hljs-number\"&gt;8090&lt;/span&gt;) &lt;/code&gt;&lt;/div&gt;&lt;/pre&gt; &lt;h2&gt;&lt;a id=\"_249\"&gt;&lt;/a&gt;表单&lt;/h2&gt; &lt;pre&gt;&lt;div class=\"hljs\"&gt;&lt;code class=\"lang-js\"&gt;&lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; Koa = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'koa\'&lt;/span&gt;) &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; koaBody = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'koa-body\'&lt;/span&gt;) &lt;span class=\"hljs-comment\"&gt;// koa-body模块可以用来从 POST 请求的数据体里面提取键值对&lt;/span&gt; &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; app = &lt;span class=\"hljs-keyword\"&gt;new&lt;/span&gt; Koa() &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; main = &lt;span class=\"hljs-keyword\"&gt;async&lt;/span&gt; &lt;span class=\"hljs-function\"&gt;&lt;span class=\"hljs-keyword\"&gt;function&lt;/span&gt;(&lt;span class=\"hljs-params\"&gt;ctx&lt;/span&gt;) &lt;/span&gt;{ &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; body = ctx.request.body; &lt;span class=\"hljs-keyword\"&gt;if&lt;/span&gt; (!body.name) ctx.throw(&lt;span class=\"hljs-number\"&gt;400&lt;/span&gt;, &lt;span class=\"hljs-string\"&gt;\'.name required\'&lt;/span&gt;); ctx.body = { &lt;span class=\"hljs-attr\"&gt;name&lt;/span&gt;: body.name }; }; app.use(koaBody()); app.use(main); app.listen(&lt;span class=\"hljs-number\"&gt;8090&lt;/span&gt;); &lt;/code&gt;&lt;/div&gt;&lt;/pre&gt; &lt;h2&gt;&lt;a id=\"_265\"&gt;&lt;/a&gt;文件上传&lt;/h2&gt; &lt;pre&gt;&lt;div class=\"hljs\"&gt;&lt;code class=\"lang-js\"&gt;&lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; Koa = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'koa\'&lt;/span&gt;); &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; koaBody = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'koa-body\'&lt;/span&gt;); &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; app = &lt;span class=\"hljs-keyword\"&gt;new&lt;/span&gt; Koa(); &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; path = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'path\'&lt;/span&gt;); &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; fs = &lt;span class=\"hljs-built_in\"&gt;require&lt;/span&gt;(&lt;span class=\"hljs-string\"&gt;\'fs\'&lt;/span&gt;); &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; main = &lt;span class=\"hljs-keyword\"&gt;async&lt;/span&gt; (ctx) =&amp;gt; { &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; file = ctx.request.body.files.upload || {} &lt;span class=\"hljs-comment\"&gt;// ctx.request.body.files.upload 为文件对象&lt;/span&gt; &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; filePath = path.join(__dirname, file.name) &lt;span class=\"hljs-comment\"&gt;// 保存文件的路径，当前路径加上文件名&lt;/span&gt; &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; reader = fs.createReadStream(file.path) &lt;span class=\"hljs-comment\"&gt;// 把上传的文件读出来，赋值给reader成为一个可读的对象&lt;/span&gt; &lt;span class=\"hljs-keyword\"&gt;const&lt;/span&gt; writer = fs.createWriteStream(filePath) &lt;span class=\"hljs-comment\"&gt;// 根据路径生成一个可写的writer对象&lt;/span&gt; reader.pipe(writer) &lt;span class=\"hljs-comment\"&gt;// 正式执行写入操作&lt;/span&gt; ctx.response.body = &lt;span class=\"hljs-string\"&gt;\'uploadSuccess!\'&lt;/span&gt; }; app.use(koaBody({ &lt;span class=\"hljs-attr\"&gt;multipart&lt;/span&gt;: &lt;span class=\"hljs-literal\"&gt;true&lt;/span&gt; })); app.use(main); app.listen(&lt;span class=\"hljs-number\"&gt;8090&lt;/span&gt;); &lt;/code&gt;&lt;/div&gt;&lt;/pre&gt; &lt;p&gt;转自&lt;a href=\"http://blog.wadejs.cn/AticleDetail/5b7d79ac8081c23dd30fb4fc\" target=\"_blank\"&gt;blog-wadejs&lt;/a&gt;，如需转载请注明出处。&lt;/p&gt;</span></p>', '', '', '', 0, 0, 0, 1, '1575708133', '1575708144');

-- ----------------------------
-- Table structure for skd_role
-- ----------------------------
DROP TABLE IF EXISTS `skd_role`;
CREATE TABLE `skd_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '读者ID',
  `article_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '已读文章ID',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` int(4) NULL DEFAULT 0 COMMENT '状态；0：启用，1：禁用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for skd_star
-- ----------------------------
DROP TABLE IF EXISTS `skd_star`;
CREATE TABLE `skd_star`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `admin_id` int(11) NOT NULL COMMENT '用户ID',
  `status` int(4) NULL DEFAULT 1 COMMENT '该收藏状态1、正常 2、取消',
  `create_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;