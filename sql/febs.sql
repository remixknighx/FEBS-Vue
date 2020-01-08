/*
Navicat MySQL Data Transfer

Source Server         : 111.230.157.133_3306_ubuntu
Source Server Version : 50721
Source Host           : 111.230.157.133:3306
Source Database       : febs

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-01-28 10:30:38
*/

DROP TABLE IF EXISTS QRTZ_FIRED_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_PAUSED_TRIGGER_GRPS;
DROP TABLE IF EXISTS QRTZ_SCHEDULER_STATE;
DROP TABLE IF EXISTS QRTZ_LOCKS;
DROP TABLE IF EXISTS QRTZ_SIMPLE_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_SIMPROP_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_CRON_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_BLOB_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_JOB_DETAILS;
DROP TABLE IF EXISTS QRTZ_CALENDARS;


CREATE TABLE QRTZ_JOB_DETAILS(
    SCHED_NAME VARCHAR(120) NOT NULL,
    JOB_NAME  VARCHAR(200) NOT NULL,
    JOB_GROUP VARCHAR(200) NOT NULL,
    DESCRIPTION VARCHAR(250) NULL,
    JOB_CLASS_NAME   VARCHAR(250) NOT NULL,
    IS_DURABLE VARCHAR(1) NOT NULL,
    IS_NONCONCURRENT VARCHAR(1) NOT NULL,
    IS_UPDATE_DATA VARCHAR(1) NOT NULL,
    REQUESTS_RECOVERY VARCHAR(1) NOT NULL,
    JOB_DATA BLOB NULL
);

CREATE TABLE QRTZ_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    JOB_NAME  VARCHAR(200) NOT NULL,
    JOB_GROUP VARCHAR(200) NOT NULL,
    DESCRIPTION VARCHAR(250) NULL,
    NEXT_FIRE_TIME BIGINT(13) NULL,
    PREV_FIRE_TIME BIGINT(13) NULL,
    PRIORITY INTEGER NULL,
    TRIGGER_STATE VARCHAR(16) NOT NULL,
    TRIGGER_TYPE VARCHAR(8) NOT NULL,
    START_TIME BIGINT(13) NOT NULL,
    END_TIME BIGINT(13) NULL,
    CALENDAR_NAME VARCHAR(200) NULL,
    MISFIRE_INSTR SMALLINT(2) NULL,
    JOB_DATA BLOB NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

DROP TABLE IF EXISTS QRTZ_SIMPLE_TRIGGERS;
CREATE TABLE QRTZ_SIMPLE_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    REPEAT_COUNT BIGINT(7) NOT NULL,
    REPEAT_INTERVAL BIGINT(12) NOT NULL,
    TIMES_TRIGGERED BIGINT(10) NOT NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

DROP TABLE IF EXISTS QRTZ_CRON_TRIGGERS;
CREATE TABLE QRTZ_CRON_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    CRON_EXPRESSION VARCHAR(200) NOT NULL,
    TIME_ZONE_ID VARCHAR(80),
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

DROP TABLE IF EXISTS QRTZ_SIMPROP_TRIGGERS;
CREATE TABLE QRTZ_SIMPROP_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    STR_PROP_1 VARCHAR(512) NULL,
    STR_PROP_2 VARCHAR(512) NULL,
    STR_PROP_3 VARCHAR(512) NULL,
    INT_PROP_1 INT NULL,
    INT_PROP_2 INT NULL,
    LONG_PROP_1 BIGINT NULL,
    LONG_PROP_2 BIGINT NULL,
    DEC_PROP_1 NUMERIC(13,4) NULL,
    DEC_PROP_2 NUMERIC(13,4) NULL,
    BOOL_PROP_1 VARCHAR(1) NULL,
    BOOL_PROP_2 VARCHAR(1) NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

DROP TABLE IF EXISTS QRTZ_BLOB_TRIGGERS;
CREATE TABLE QRTZ_BLOB_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    BLOB_DATA BLOB NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

DROP TABLE IF EXISTS QRTZ_CALENDARS;
CREATE TABLE QRTZ_CALENDARS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    CALENDAR_NAME  VARCHAR(200) NOT NULL,
    CALENDAR BLOB NOT NULL,
    PRIMARY KEY (SCHED_NAME,CALENDAR_NAME)
);

DROP TABLE IF EXISTS QRTZ_PAUSED_TRIGGER_GRPS;
CREATE TABLE QRTZ_PAUSED_TRIGGER_GRPS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_GROUP  VARCHAR(200) NOT NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_GROUP)
);

DROP TABLE IF EXISTS QRTZ_FIRED_TRIGGERS;
CREATE TABLE QRTZ_FIRED_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    ENTRY_ID VARCHAR(95) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    INSTANCE_NAME VARCHAR(200) NOT NULL,
    FIRED_TIME BIGINT(13) NOT NULL,
    SCHED_TIME BIGINT(13) NOT NULL,
    PRIORITY INTEGER NOT NULL,
    STATE VARCHAR(16) NOT NULL,
    JOB_NAME VARCHAR(200) NULL,
    JOB_GROUP VARCHAR(200) NULL,
    IS_NONCONCURRENT VARCHAR(1) NULL,
    REQUESTS_RECOVERY VARCHAR(1) NULL,
    PRIMARY KEY (SCHED_NAME,ENTRY_ID)
);

DROP TABLE IF EXISTS QRTZ_SCHEDULER_STATE;
CREATE TABLE QRTZ_SCHEDULER_STATE
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    INSTANCE_NAME VARCHAR(200) NOT NULL,
    LAST_CHECKIN_TIME BIGINT(13) NOT NULL,
    CHECKIN_INTERVAL BIGINT(13) NOT NULL,
    PRIMARY KEY (SCHED_NAME,INSTANCE_NAME)
);

CREATE TABLE QRTZ_LOCKS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    LOCK_NAME  VARCHAR(40) NOT NULL,
    PRIMARY KEY (SCHED_NAME,LOCK_NAME)
);

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `PARENT_ID` bigint(20) NOT NULL COMMENT '上级部门ID',
  `DEPT_NAME` varchar(100) NOT NULL COMMENT '部门名称',
  `ORDER_NUM` int(10) DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `CREATE_USER` VARCHAR(50) DEFAULT NULL COMMENT '创建用户',
  `MODIFY_USER` VARCHAR(50) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept`(`ID`, `PARENT_ID`, `DEPT_NAME`, `ORDER_NUM`) VALUES ('1', '0', '开发部', '1');
INSERT INTO `t_dept`(`ID`, `PARENT_ID`, `DEPT_NAME`, `ORDER_NUM`) VALUES ('2', '1', '开发一部', '1');
INSERT INTO `t_dept`(`ID`, `PARENT_ID`, `DEPT_NAME`, `ORDER_NUM`) VALUES ('3', '1', '开发二部', '2');
INSERT INTO `t_dept`(`ID`, `PARENT_ID`, `DEPT_NAME`, `ORDER_NUM`) VALUES ('4', '0', '市场部', '2');
INSERT INTO `t_dept`(`ID`, `PARENT_ID`, `DEPT_NAME`, `ORDER_NUM`) VALUES ('5', '0', '人事部', '3');
INSERT INTO `t_dept`(`ID`, `PARENT_ID`, `DEPT_NAME`, `ORDER_NUM`) VALUES ('6', '0', '测试部', '4');

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典ID',
  `KEYY` bigint(20) NOT NULL COMMENT '键',
  `VALUEE` varchar(100) NOT NULL COMMENT '值',
  `FIELD_NAME` varchar(100) NOT NULL COMMENT '字段名称',
  `TABLE_NAME` varchar(100) NOT NULL COMMENT '表名',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES ('1', '0', '男', 'ssex', 't_user');
INSERT INTO `t_dict` VALUES ('2', '1', '女', 'ssex', 't_user');
INSERT INTO `t_dict` VALUES ('3', '2', '保密', 'ssex', 't_user');
INSERT INTO `t_dict` VALUES ('4', '1', '有效', 'status', 't_user');
INSERT INTO `t_dict` VALUES ('5', '0', '锁定', 'status', 't_user');
INSERT INTO `t_dict` VALUES ('6', '0', '菜单', 'type', 't_menu');
INSERT INTO `t_dict` VALUES ('7', '1', '按钮', 'type', 't_menu');
INSERT INTO `t_dict` VALUES ('30', '0', '正常', 'status', 't_job');
INSERT INTO `t_dict` VALUES ('31', '1', '暂停', 'status', 't_job');
INSERT INTO `t_dict` VALUES ('32', '0', '成功', 'status', 't_job_log');
INSERT INTO `t_dict` VALUES ('33', '1', '失败', 'status', 't_job_log');

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `BEAN_NAME` varchar(100) NOT NULL COMMENT 'spring bean名称',
  `METHOD_NAME` varchar(100) NOT NULL COMMENT '方法名',
  `PARAMS` varchar(200) DEFAULT NULL COMMENT '参数',
  `CRON_EXPRESSION` varchar(100) NOT NULL COMMENT 'cron表达式',
  `STATUS` char(2) NOT NULL COMMENT '任务状态  0：正常  1：暂停',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '备注',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` VARCHAR(50) DEFAULT NULL COMMENT '创建用户',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `MODIFY_USER` VARCHAR(50) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_job
-- ----------------------------
INSERT INTO `t_job`(`ID`, `BEAN_NAME`, `METHOD_NAME`, `PARAMS`, `CRON_EXPRESSION`, `STATUS`, `REMARK`) VALUES ('1', 'testTask', 'test', 'mrbird', '0/1 * * * * ?1', '1', '有参任务调度测试');
INSERT INTO `t_job`(`ID`, `BEAN_NAME`, `METHOD_NAME`, `PARAMS`, `CRON_EXPRESSION`, `STATUS`, `REMARK`) VALUES ('2', 'testTask', 'test1', null, '0/10 * * * * ?', '1', '无参任务调度测试');
INSERT INTO `t_job`(`ID`, `BEAN_NAME`, `METHOD_NAME`, `PARAMS`, `CRON_EXPRESSION`, `STATUS`, `REMARK`) VALUES ('3', 'testTask', 'test', 'hello world', '0/1 * * * * ?', '1', '有参任务调度测试,每隔一秒触发');
INSERT INTO `t_job`(`ID`, `BEAN_NAME`, `METHOD_NAME`, `PARAMS`, `CRON_EXPRESSION`, `STATUS`, `REMARK`) VALUES ('11', 'testTask', 'test2', null, '0/5 * * * * ?', '1', '测试异常');

-- ----------------------------
-- Table structure for t_job_log
-- ----------------------------
DROP TABLE IF EXISTS `t_job_log`;
CREATE TABLE `t_job_log` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `JOB_ID` bigint(20) NOT NULL COMMENT '任务id',
  `BEAN_NAME` varchar(100) NOT NULL COMMENT 'spring bean名称',
  `METHOD_NAME` varchar(100) NOT NULL COMMENT '方法名',
  `PARAMS` varchar(200) DEFAULT NULL COMMENT '参数',
  `STATUS` char(2) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `ERROR` text COMMENT '失败信息',
  `TIMES` int(10) DEFAULT NULL COMMENT '耗时(单位：毫秒)',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '操作用户',
  `OPERATION` text COMMENT '操作内容',
  `TIME` int(10) DEFAULT NULL COMMENT '耗时',
  `METHOD` VARCHAR(50) COMMENT '操作方法',
  `PARAMS` VARCHAR(150) COMMENT '方法参数',
  `IP` varchar(64) DEFAULT NULL COMMENT '操作者IP',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `location` varchar(50) DEFAULT NULL COMMENT '操作地点',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `USERNAME` varchar(100) NOT NULL COMMENT '用户名',
  `LOGIN_TIME` datetime NOT NULL COMMENT '登录时间',
  `LOCATION` varchar(255) NOT NULL COMMENT '登录地点',
  `IP` varchar(100) NOT NULL COMMENT 'IP地址',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_system`;
CREATE TABLE `t_system` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `SYSTEM_NAME` VARCHAR(50) DEFAULT NULL COMMENT '系统名称',
  `STATUS` TINYINT(4) NOT NULL DEFAULT '1' COMMENT '系统状态',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `CREATE_USER` VARCHAR(50) DEFAULT NULL COMMENT '创建用户',
  `MODIFY_USER` VARCHAR(50) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

insert into t_system (`SYSTEM_NAME`,`STATUS`)values('auth权限系统', '1');


-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单/按钮ID',
  `SYSTEM_ID` bigint(20) NOT NULL COMMENT '系统ID',
  `PARENT_ID` bigint(20) NOT NULL COMMENT '上级菜单ID',
  `MENU_NAME` varchar(50) NOT NULL COMMENT '菜单/按钮名称',
  `PATH` varchar(255) DEFAULT NULL COMMENT '对应路由path',
  `COMPONENT` varchar(255) DEFAULT NULL COMMENT '对应路由组件component',
  `PERMS` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `ICON` varchar(50) DEFAULT NULL COMMENT '图标',
  `TYPE` char(2) NOT NULL COMMENT '类型 0菜单 1按钮',
  `ORDER_NUM` double(20,0) DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `CREATE_USER` VARCHAR(50) DEFAULT NULL COMMENT '创建用户',
  `MODIFY_USER` VARCHAR(50) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('1', '0', '系统管理', '/system', 'PageView', null, 'appstore-o', '0', '1', '1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('2', '0', '系统监控', '/monitor', 'PageView', null, 'dashboard', '0', '2','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('3', '1', '用户管理', '/system/user', 'system/user/User', 'user:view', '', '0', '1','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('4', '1', '角色管理', '/system/role', 'system/role/Role', 'role:view', '', '0', '2','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('5', '1', '菜单管理', '/system/menu', 'system/menu/Menu', 'menu:view', '', '0', '3','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('6', '1', '部门管理', '/system/dept', 'system/dept/Dept', 'dept:view', '', '0', '4','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('8', '2', '在线用户', '/monitor/online', 'monitor/Online', 'user:online', '', '0', '1','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('10', '2', '系统日志', '/monitor/systemlog', 'monitor/SystemLog', 'log:view', '', '0', '2','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('11', '3', '新增用户', '', '', 'user:add', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('12', '3', '修改用户', '', '', 'user:update', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('13', '3', '删除用户', '', '', 'user:delete', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('14', '4', '新增角色', '', '', 'role:add', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('15', '4', '修改角色', '', '', 'role:update', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('16', '4', '删除角色', '', '', 'role:delete', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('17', '5', '新增菜单', '', '', 'menu:add', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('18', '5', '修改菜单', '', '', 'menu:update', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('19', '5', '删除菜单', '', '', 'menu:delete', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('20', '6', '新增部门', '', '', 'dept:add', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('21', '6', '修改部门', '', '', 'dept:update', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('22', '6', '删除部门', '', '', 'dept:delete', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('23', '8', '踢出用户', '', '', 'user:kickout', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('24', '10', '删除日志', '', '', 'log:delete', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('58', '0', '网络资源', '/web', 'PageView', null, 'compass', '0', '4','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('59', '58', '天气查询', '/web/weather', 'web/Weather', 'weather:view', '', '0', '1','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('61', '58', '每日一文', '/web/dailyArticle', 'web/DailyArticle', 'article:view', '', '0', '2','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('64', '1', '字典管理', '/system/dict', 'system/dict/Dict', 'dict:view', '', '0', '5','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('65', '64', '新增字典', '', '', 'dict:add', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('66', '64', '修改字典', '', '', 'dict:update', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('67', '64', '删除字典', '', '', 'dict:delete', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('81', '58', '影视资讯', '/web/movie', 'EmptyPageView', null, null, '0', '3','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('82', '81', '正在热映', '/web/movie/hot', 'web/MovieHot', 'movie:hot', '', '0', '1','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('83', '81', '即将上映', '/web/movie/coming', 'web/MovieComing', 'movie:coming', '', '0', '2','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('101', '0', '任务调度', '/job', 'PageView', null, 'clock-circle-o', '0', '3','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('102', '101', '定时任务', '/job/job', 'quartz/job/Job', 'job:view', '', '0', '1','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`) 
VALUES ('103', '102', '新增任务', '', '', 'job:add', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('104', '102', '修改任务', '', '', 'job:update', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('105', '102', '删除任务', '', '', 'job:delete', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('106', '102', '暂停任务', '', '', 'job:pause', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('107', '102', '恢复任务', '', '', 'job:resume', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('108', '102', '立即执行任务', '', '', 'job:run', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('109', '101', '调度日志', '/job/log', 'quartz/log/JobLog', 'jobLog:view', '', '0', '2','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('110', '109', '删除日志', '', '', 'jobLog:delete', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('113', '2', 'Redis监控', '/monitor/redis/info', 'monitor/RedisInfo', 'redis:view', '', '0', '3','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('121', '2', '请求追踪', '/monitor/httptrace', 'monitor/Httptrace', null, null, '0', '4','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('122', '2', '系统信息', '/monitor/system', 'EmptyPageView', null, null, '0', '5','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('123', '122', 'Tomcat信息', '/monitor/system/tomcatinfo', 'monitor/TomcatInfo', null, null, '0', '2','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('124', '122', 'JVM信息', '/monitor/system/jvminfo', 'monitor/JvmInfo', null, null, '0', '1','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('127', '122', '服务器信息', '/monitor/system/info', 'monitor/SystemInfo', null, null, '0', '3','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('128', '0', '其他模块', '/others', 'PageView', null, 'coffee', '0', '5','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('129', '128', '导入导出', '/others/excel', 'others/Excel', null, null, '0', '1','1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('130', '3', '导出Excel', null, null, 'user:export', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('131', '4', '导出Excel', null, null, 'role:export', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('132', '5', '导出Excel', null, null, 'menu:export', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('133', '6', '导出Excel', null, null, 'dept:export', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('134', '64', '导出Excel', null, null, 'dict:export', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('135', '3', '密码重置', null, null, 'user:reset', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('136', '10', '导出Excel', null, null, 'log:export', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('137', '102', '导出Excel', null, null, 'job:export', null, '1', null,'1');
INSERT INTO `t_menu`(`ID`,`PARENT_ID`, `MENU_NAME`, `PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`SYSTEM_ID`)
VALUES ('138', '109', '导出Excel', null, null, 'jobLog:export', null, '1', null,'1');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `SYSTEM_ID` bigint(20) NOT NULL COMMENT '系统ID',
  `ROLE_NAME` varchar(10) NOT NULL COMMENT '角色名称',
  `REMARK` varchar(100) DEFAULT NULL COMMENT '角色描述',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `CREATE_USER` VARCHAR(50) DEFAULT NULL COMMENT '创建用户',
  `MODIFY_USER` VARCHAR(50) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role`(`ID`,`ROLE_NAME`,`REMARK`,`SYSTEM_ID`) VALUES ('1', '管理员', '管理员','1');
INSERT INTO `t_role`(`ID`,`ROLE_NAME`,`REMARK`,`SYSTEM_ID`) VALUES ('2', '注册用户', '可查看，新增，导出','1');
INSERT INTO `t_role`(`ID`,`ROLE_NAME`,`REMARK`,`SYSTEM_ID`) VALUES ('3', '普通用户', '只可查看，好可怜哦','1');

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `ROLE_ID` bigint(20) NOT NULL,
  `MENU_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES ('1', '1');
INSERT INTO `t_role_menu` VALUES ('1', '3');
INSERT INTO `t_role_menu` VALUES ('1', '11');
INSERT INTO `t_role_menu` VALUES ('1', '12');
INSERT INTO `t_role_menu` VALUES ('1', '13');
INSERT INTO `t_role_menu` VALUES ('1', '4');
INSERT INTO `t_role_menu` VALUES ('1', '14');
INSERT INTO `t_role_menu` VALUES ('1', '15');
INSERT INTO `t_role_menu` VALUES ('1', '16');
INSERT INTO `t_role_menu` VALUES ('1', '5');
INSERT INTO `t_role_menu` VALUES ('1', '17');
INSERT INTO `t_role_menu` VALUES ('1', '18');
INSERT INTO `t_role_menu` VALUES ('1', '19');
INSERT INTO `t_role_menu` VALUES ('1', '6');
INSERT INTO `t_role_menu` VALUES ('1', '20');
INSERT INTO `t_role_menu` VALUES ('1', '21');
INSERT INTO `t_role_menu` VALUES ('1', '22');
INSERT INTO `t_role_menu` VALUES ('1', '64');
INSERT INTO `t_role_menu` VALUES ('1', '65');
INSERT INTO `t_role_menu` VALUES ('1', '66');
INSERT INTO `t_role_menu` VALUES ('1', '67');
INSERT INTO `t_role_menu` VALUES ('1', '2');
INSERT INTO `t_role_menu` VALUES ('1', '8');
INSERT INTO `t_role_menu` VALUES ('1', '23');
INSERT INTO `t_role_menu` VALUES ('1', '10');
INSERT INTO `t_role_menu` VALUES ('1', '24');
INSERT INTO `t_role_menu` VALUES ('1', '113');
INSERT INTO `t_role_menu` VALUES ('1', '121');
INSERT INTO `t_role_menu` VALUES ('1', '122');
INSERT INTO `t_role_menu` VALUES ('1', '124');
INSERT INTO `t_role_menu` VALUES ('1', '123');
INSERT INTO `t_role_menu` VALUES ('1', '125');
INSERT INTO `t_role_menu` VALUES ('1', '101');
INSERT INTO `t_role_menu` VALUES ('1', '102');
INSERT INTO `t_role_menu` VALUES ('1', '103');
INSERT INTO `t_role_menu` VALUES ('1', '104');
INSERT INTO `t_role_menu` VALUES ('1', '105');
INSERT INTO `t_role_menu` VALUES ('1', '106');
INSERT INTO `t_role_menu` VALUES ('1', '107');
INSERT INTO `t_role_menu` VALUES ('1', '108');
INSERT INTO `t_role_menu` VALUES ('1', '109');
INSERT INTO `t_role_menu` VALUES ('1', '110');
INSERT INTO `t_role_menu` VALUES ('1', '58');
INSERT INTO `t_role_menu` VALUES ('1', '59');
INSERT INTO `t_role_menu` VALUES ('1', '61');
INSERT INTO `t_role_menu` VALUES ('1', '81');
INSERT INTO `t_role_menu` VALUES ('1', '82');
INSERT INTO `t_role_menu` VALUES ('1', '83');
INSERT INTO `t_role_menu` VALUES ('1', '127');
INSERT INTO `t_role_menu` VALUES ('1', '128');
INSERT INTO `t_role_menu` VALUES ('1', '129');
INSERT INTO `t_role_menu` VALUES ('1', '130');
INSERT INTO `t_role_menu` VALUES ('1', '135');
INSERT INTO `t_role_menu` VALUES ('1', '131');
INSERT INTO `t_role_menu` VALUES ('1', '132');
INSERT INTO `t_role_menu` VALUES ('1', '133');
INSERT INTO `t_role_menu` VALUES ('1', '134');
INSERT INTO `t_role_menu` VALUES ('1', '136');
INSERT INTO `t_role_menu` VALUES ('1', '137');
INSERT INTO `t_role_menu` VALUES ('1', '138');
INSERT INTO `t_role_menu` VALUES ('3', '1');
INSERT INTO `t_role_menu` VALUES ('3', '3');
INSERT INTO `t_role_menu` VALUES ('3', '4');
INSERT INTO `t_role_menu` VALUES ('3', '5');
INSERT INTO `t_role_menu` VALUES ('3', '6');
INSERT INTO `t_role_menu` VALUES ('3', '64');
INSERT INTO `t_role_menu` VALUES ('3', '2');
INSERT INTO `t_role_menu` VALUES ('3', '8');
INSERT INTO `t_role_menu` VALUES ('3', '10');
INSERT INTO `t_role_menu` VALUES ('3', '113');
INSERT INTO `t_role_menu` VALUES ('3', '121');
INSERT INTO `t_role_menu` VALUES ('3', '122');
INSERT INTO `t_role_menu` VALUES ('3', '124');
INSERT INTO `t_role_menu` VALUES ('3', '123');
INSERT INTO `t_role_menu` VALUES ('3', '127');
INSERT INTO `t_role_menu` VALUES ('3', '101');
INSERT INTO `t_role_menu` VALUES ('3', '102');
INSERT INTO `t_role_menu` VALUES ('3', '109');
INSERT INTO `t_role_menu` VALUES ('3', '58');
INSERT INTO `t_role_menu` VALUES ('3', '59');
INSERT INTO `t_role_menu` VALUES ('3', '61');
INSERT INTO `t_role_menu` VALUES ('3', '81');
INSERT INTO `t_role_menu` VALUES ('3', '82');
INSERT INTO `t_role_menu` VALUES ('3', '83');
INSERT INTO `t_role_menu` VALUES ('3', '128');
INSERT INTO `t_role_menu` VALUES ('3', '129');
INSERT INTO `t_role_menu` VALUES ('2', '3');
INSERT INTO `t_role_menu` VALUES ('2', '1');
INSERT INTO `t_role_menu` VALUES ('2', '4');
INSERT INTO `t_role_menu` VALUES ('2', '5');
INSERT INTO `t_role_menu` VALUES ('2', '6');
INSERT INTO `t_role_menu` VALUES ('2', '64');
INSERT INTO `t_role_menu` VALUES ('2', '2');
INSERT INTO `t_role_menu` VALUES ('2', '8');
INSERT INTO `t_role_menu` VALUES ('2', '10');
INSERT INTO `t_role_menu` VALUES ('2', '113');
INSERT INTO `t_role_menu` VALUES ('2', '121');
INSERT INTO `t_role_menu` VALUES ('2', '122');
INSERT INTO `t_role_menu` VALUES ('2', '124');
INSERT INTO `t_role_menu` VALUES ('2', '123');
INSERT INTO `t_role_menu` VALUES ('2', '125');
INSERT INTO `t_role_menu` VALUES ('2', '101');
INSERT INTO `t_role_menu` VALUES ('2', '102');
INSERT INTO `t_role_menu` VALUES ('2', '109');
INSERT INTO `t_role_menu` VALUES ('2', '58');
INSERT INTO `t_role_menu` VALUES ('2', '59');
INSERT INTO `t_role_menu` VALUES ('2', '61');
INSERT INTO `t_role_menu` VALUES ('2', '81');
INSERT INTO `t_role_menu` VALUES ('2', '82');
INSERT INTO `t_role_menu` VALUES ('2', '83');
INSERT INTO `t_role_menu` VALUES ('2', '127');
INSERT INTO `t_role_menu` VALUES ('2', '128');
INSERT INTO `t_role_menu` VALUES ('2', '129');
INSERT INTO `t_role_menu` VALUES ('2', '130');
INSERT INTO `t_role_menu` VALUES ('2', '14');
INSERT INTO `t_role_menu` VALUES ('2', '17');
INSERT INTO `t_role_menu` VALUES ('2', '132');
INSERT INTO `t_role_menu` VALUES ('2', '20');
INSERT INTO `t_role_menu` VALUES ('2', '133');
INSERT INTO `t_role_menu` VALUES ('2', '65');
INSERT INTO `t_role_menu` VALUES ('2', '134');
INSERT INTO `t_role_menu` VALUES ('2', '136');
INSERT INTO `t_role_menu` VALUES ('2', '103');
INSERT INTO `t_role_menu` VALUES ('2', '137');
INSERT INTO `t_role_menu` VALUES ('2', '138');
INSERT INTO `t_role_menu` VALUES ('2', '131');

-- ----------------------------
-- Table structure for t_test
-- ----------------------------
DROP TABLE IF EXISTS `t_test`;
CREATE TABLE `t_test` (
  `ID` bigint(11) NOT NULL AUTO_INCREMENT,
  `FIELD1` varchar(20) NOT NULL,
  `FIELD2` int(11) NOT NULL,
  `FIELD3` varchar(100) NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT = 100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_test
-- ----------------------------
INSERT INTO `t_test` VALUES (1,'字段1', '1', 'mrbird@gmail.com', '2019-01-22 16:26:51');
INSERT INTO `t_test` VALUES (2,'字段1', '1', 'mrbird0@gmail.com', '2019-01-23 03:01:03');
INSERT INTO `t_test` VALUES (3,'字段1', '2', 'mrbird1@gmail.com', '2019-01-23 03:01:03');
INSERT INTO `t_test` VALUES (4,'字段1', '3', 'mrbird2@gmail.com', '2019-01-23 03:01:03');
INSERT INTO `t_test` VALUES (5,'字段1', '4', 'mrbird3@gmail.com', '2019-01-23 03:01:03');
INSERT INTO `t_test` VALUES (6,'字段1', '5', 'mrbird4@gmail.com', '2019-01-23 03:01:03');
INSERT INTO `t_test` VALUES (7,'字段1', '10', 'mrbird9@gmail.com', '2019-01-23 03:01:03');
INSERT INTO `t_test` VALUES (8,'字段1', '1', 'mrbird0@gmail.com', '2019-01-23 03:03:49');
INSERT INTO `t_test` VALUES (9,'字段1', '2', 'mrbird1@gmail.com', '2019-01-23 03:03:49');
INSERT INTO `t_test` VALUES (10,'字段1', '3', 'mrbird2@gmail.com', '2019-01-23 03:03:49');
INSERT INTO `t_test` VALUES (11,'字段1', '4', 'mrbird3@gmail.com', '2019-01-23 03:03:49');


-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `USERNAME` varchar(50) NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(128) NOT NULL COMMENT '密码',
  `DEPT_ID` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `EMAIL` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `MOBILE` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `STATUS` char(1) NOT NULL COMMENT '状态 0锁定 1有效',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `LAST_LOGIN_TIME` datetime DEFAULT NULL COMMENT '最近访问时间',
  `SSEX` char(1) DEFAULT NULL COMMENT '性别 0男 1女 2保密',
  `DESCRIPTION` varchar(100) DEFAULT NULL COMMENT '描述',
  `AVATAR` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `CREATE_USER` VARCHAR(50) DEFAULT NULL COMMENT '创建用户',
  `MODIFY_USER` VARCHAR(50) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user`(`ID`,`USERNAME`, `PASSWORD`, `DEPT_ID`, `EMAIL`,`MOBILE`,`STATUS`,`SSEX`,`DESCRIPTION`,`AVATAR`) VALUES ('1', 'mrbird', '94f860c4bbfeb2f49c84e321fdda4b07', '1', 'mrbird123@hotmail.com', '13455533233', '1', '2', '我是帅比作者。', 'ubnKSIfAJTxIgXOKlciN.png');
INSERT INTO `t_user`(`ID`,`USERNAME`, `PASSWORD`, `DEPT_ID`, `EMAIL`,`MOBILE`,`STATUS`,`SSEX`,`DESCRIPTION`,`AVATAR`) VALUES ('2', 'scott', '7b44a5363e3fd52435beb472e1d2b91f', '6', 'scott@qq.com', '15134627380', '1', '0', '我是scott，嗯嗯', 'jZUIxmJycoymBprLOUbT.png');
INSERT INTO `t_user`(`ID`,`USERNAME`, `PASSWORD`, `DEPT_ID`, `EMAIL`,`MOBILE`,`STATUS`,`SSEX`,`DESCRIPTION`,`AVATAR`) VALUES ('3', 'jack', '552649f10640385d0728a80a4242893e', '6', 'jack@hotmail.com', null, '1', '0', null, 'default.jpg');

-- ----------------------------
-- Table structure for t_user_config
-- ----------------------------
DROP TABLE IF EXISTS `t_user_config`;
CREATE TABLE `t_user_config` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户配置表ID',
  `USER_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `THEME` varchar(10) DEFAULT NULL COMMENT '系统主题 dark暗色风格，light明亮风格',
  `LAYOUT` varchar(10) DEFAULT NULL COMMENT '系统布局 side侧边栏，head顶部栏',
  `MULTI_PAGE` char(1) DEFAULT NULL COMMENT '页面风格 1多标签页 0单页',
  `FIX_SIDERBAR` char(1) DEFAULT NULL COMMENT '页面滚动是否固定侧边栏 1固定 0不固定',
  `FIX_HEADER` char(1) DEFAULT NULL COMMENT '页面滚动是否固定顶栏 1固定 0不固定',
  `COLOR` varchar(20) DEFAULT NULL COMMENT '主题颜色 RGB值',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_user_config
-- ----------------------------
INSERT INTO `t_user_config`(`USER_ID`, `THEME`, `LAYOUT`, `MULTI_PAGE`, `FIX_SIDERBAR`, `FIX_HEADER`, `COLOR`) VALUES ('1', 'light', 'side', '1', '1', '1', 'rgb(24, 144, 255)');
INSERT INTO `t_user_config`(`USER_ID`, `THEME`, `LAYOUT`, `MULTI_PAGE`, `FIX_SIDERBAR`, `FIX_HEADER`, `COLOR`) VALUES ('2', 'light', 'head', '0', '1', '1', 'rgb(24, 144, 255)');
INSERT INTO `t_user_config`(`USER_ID`, `THEME`, `LAYOUT`, `MULTI_PAGE`, `FIX_SIDERBAR`, `FIX_HEADER`, `COLOR`) VALUES ('3', 'dark', 'side', '1', '1', '1', 'rgb(66, 185, 131)');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `USER_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '1');
INSERT INTO `t_user_role` VALUES ('2', '2');
INSERT INTO `t_user_role` VALUES ('3', '3');


