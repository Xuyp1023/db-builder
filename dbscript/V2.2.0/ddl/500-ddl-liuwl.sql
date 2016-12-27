##-- DDL语句
##
##-- V2.2.0
##
##-- 表结构非空修改 提交日期2016/12/27


### --- 流程定义相关表
CREATE TABLE IF NOT EXISTS `t_sys_wf_approver` (
  `ID` bigint(18) NOT NULL COMMENT '编号',
  `C_PARENT_TYPE` char(1) NOT NULL COMMENT '父节点类型',
  `L_PARENT_ID` bigint(18) NOT NULL COMMENT '父节点编号',
  `L_OPERID` bigint(18) NOT NULL COMMENT '操作员编号',
  `L_MONEY_ID` bigint(18) DEFAULT NULL COMMENT '金额段编号',
  `N_WEIGHT` bigint(18) DEFAULT '0' COMMENT '权重',
  `L_REG_OPERID` bigint(18) DEFAULT '0' COMMENT '创建人(操作员)ID号',
  `C_REG_OPERNAME` varchar(40) DEFAULT NULL COMMENT '创建人(操作员)姓名',
  `D_REG_DATE` varchar(8) NOT NULL COMMENT '创建日期',
  `T_REG_TIME` varchar(8) DEFAULT NULL COMMENT '创建时间',
  `L_MODI_OPERID` bigint(18) DEFAULT NULL COMMENT '修改人(操作员)ID号',
  `C_MODI_OPERNAME` varchar(40) DEFAULT NULL COMMENT '修改人(操作员)姓名',
  `D_MODI_DATE` varchar(8) NOT NULL COMMENT '修改日期',
  `T_MODI_TIME` varchar(8) DEFAULT NULL COMMENT '修改时间',
  `C_BUSIN_STATUS` char(1) DEFAULT NULL,
  `C_LAST_STATUS` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审批人表'$$

/*Table structure for table `t_sys_wf_audit` */

CREATE TABLE IF NOT EXISTS `t_sys_wf_audit` (
  `ID` bigint(18) NOT NULL COMMENT '编号',
  `L_BASE_ID` bigint(18) NOT NULL COMMENT '基础表编号',
  `L_NODE_ID` bigint(18) NOT NULL COMMENT '节点编号',
  `L_STEP_ID` bigint(18) DEFAULT NULL COMMENT '步骤编号',
  `L_BUSINESS_ID` bigint(18) NOT NULL COMMENT '实例编号',
  `C_ORDER_ID` varchar(32) NOT NULL COMMENT '实例编号 snaker',
  `C_TASK_ID` varchar(32) NOT NULL COMMENT '任务编号 snaker',
  `L_OPERID` bigint(18) DEFAULT '0' COMMENT '审批操作员',
  `C_OPERNAME` varchar(30) DEFAULT '0' COMMENT '审批操作员名称',
  `L_CUSTNO` bigint(18) DEFAULT '0' COMMENT '审批公司',
  `L_CUSTNAME` varchar(120) DEFAULT '0' COMMENT '审批公司',
  `C_OPERORG` varchar(30) DEFAULT '0' COMMENT '审批机构',
  `D_AUDIT_DATE` char(8) DEFAULT '0' COMMENT '审批日期',
  `T_AUDIT_TIME` char(8) DEFAULT '0' COMMENT '审批时间',
  `C_AUDIT_CONTENT` varchar(200) DEFAULT '0' COMMENT '审批内容',
  `C_AUDIT_RESULT` char(1) DEFAULT '0' COMMENT '审批结果 0通过 1驳回 2办理 3作废',
  `L_REG_OPERID` bigint(18) DEFAULT '0' COMMENT '创建人(操作员)ID号',
  `C_REG_OPERNAME` varchar(40) DEFAULT NULL COMMENT '创建人(操作员)姓名',
  `D_REG_DATE` varchar(8) NOT NULL COMMENT '创建日期',
  `T_REG_TIME` varchar(8) DEFAULT NULL COMMENT '创建时间',
  `L_MODI_OPERID` bigint(18) DEFAULT NULL COMMENT '修改人(操作员)ID号',
  `C_MODI_OPERNAME` varchar(40) DEFAULT NULL COMMENT '修改人(操作员)姓名',
  `D_MODI_DATE` varchar(8) NOT NULL COMMENT '修改日期',
  `T_MODI_TIME` varchar(8) DEFAULT NULL COMMENT '修改时间',
  `C_BUSIN_STATUS` char(1) DEFAULT NULL,
  `C_LAST_STATUS` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程审批表'$$

/*Table structure for table `t_sys_wf_base` */

CREATE TABLE IF NOT EXISTS `t_sys_wf_base` (
  `ID` bigint(18) NOT NULL COMMENT '编号',
  `L_CATEGORY_ID` bigint(18) NOT NULL COMMENT '分类编号',
  `C_NAME` varchar(30) NOT NULL COMMENT '流程名称',
  `C_NICKNAME` varchar(30) NOT NULL COMMENT '流程别名',
  `C_OPERROLE` varchar(30) NOT NULL COMMENT '流程角色',
  `C_OPERORG` varchar(200) NOT NULL COMMENT '流程机构',
  `L_CUSTNO` bigint(18) NOT NULL COMMENT '流程公司',
  `C_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '客户名称',
  `C_HANDLER` varchar(120) DEFAULT NULL COMMENT '流程事件处理',
  `C_FORM` varchar(120) DEFAULT NULL COMMENT '查看审批历史',
  `N_VERSION` bigint(18) NOT NULL COMMENT '版本',
  `C_IS_LATEST` char(1) NOT NULL COMMENT '最新版状态',
  `C_IS_PUBLISHED` char(1) NOT NULL COMMENT '发布状态',
  `C_IS_DEFAULT` char(1) NOT NULL COMMENT '默认流程标识',
  `C_IS_DISABLED` char(1) NOT NULL COMMENT '停用流程标识',
  `C_IS_SUBPROCESS` char(1) DEFAULT NULL COMMENT '是否是子流程',
  `C_PROCESS_ID` varchar(32) DEFAULT NULL COMMENT 'snaker流程对应',
  `C_MONEY_VARIABLE` varchar(100) DEFAULT NULL COMMENT '流程全局金额变量',
  `L_REG_OPERID` bigint(18) DEFAULT '0' COMMENT '创建人(操作员)ID号',
  `C_REG_OPERNAME` varchar(40) DEFAULT NULL COMMENT '创建人(操作员)姓名',
  `D_REG_DATE` varchar(8) NOT NULL COMMENT '创建日期',
  `T_REG_TIME` varchar(8) DEFAULT NULL COMMENT '创建时间',
  `L_MODI_OPERID` bigint(18) DEFAULT NULL COMMENT '修改人(操作员)ID号',
  `C_MODI_OPERNAME` varchar(40) DEFAULT NULL COMMENT '修改人(操作员)姓名',
  `D_MODI_DATE` varchar(8) NOT NULL COMMENT '修改日期',
  `T_MODI_TIME` varchar(8) DEFAULT NULL COMMENT '修改时间',
  `C_BUSIN_STATUS` char(1) DEFAULT NULL,
  `C_LAST_STATUS` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程基础表'$$

/*Table structure for table `t_sys_wf_business` */

CREATE TABLE IF NOT EXISTS `t_sys_wf_business` (
  `ID` bigint(18) NOT NULL COMMENT '编号',
  `C_ORDER_ID` varchar(32) NOT NULL COMMENT 'snaker order id',
  `L_BUSINESS_ID` varchar(50) NOT NULL COMMENT '业务编号',
  `L_BASE_ID` bigint(18) NOT NULL COMMENT '基础表编号',
  `C_BUSINESS_TYPE` char(2) NOT NULL COMMENT '业务类型',
  `L_REG_OPERID` bigint(18) DEFAULT '0' COMMENT '创建人(操作员)ID号',
  `L_CUSTNO` bigint(18) DEFAULT '0' COMMENT '发起公司',
  `C_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '发起公司名称',
  `C_REG_OPERNAME` varchar(40) DEFAULT NULL COMMENT '创建人(操作员)姓名',
  `D_REG_DATE` varchar(8) NOT NULL COMMENT '创建日期',
  `T_REG_TIME` varchar(8) DEFAULT NULL COMMENT '创建时间',
  `L_MODI_OPERID` bigint(18) DEFAULT NULL COMMENT '修改人(操作员)ID号',
  `C_MODI_OPERNAME` varchar(40) DEFAULT NULL COMMENT '修改人(操作员)姓名',
  `D_MODI_DATE` varchar(8) NOT NULL COMMENT '修改日期',
  `T_MODI_TIME` varchar(8) DEFAULT NULL COMMENT '修改时间',
  `C_BUSIN_STATUS` char(1) DEFAULT NULL,
  `C_LAST_STATUS` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程业务表'$$

/*Table structure for table `t_sys_wf_category` */

CREATE TABLE IF NOT EXISTS `t_sys_wf_category` (
  `ID` bigint(18) NOT NULL COMMENT '编号',
  `C_NAME` varchar(20) NOT NULL COMMENT '分类名称',
  `C_DESCRIPTION` varchar(200) NOT NULL COMMENT '分类描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程分类表'$$

/*Table structure for table `t_sys_wf_money` */

CREATE TABLE IF NOT EXISTS `t_sys_wf_money` (
  `ID` bigint(18) NOT NULL COMMENT '编号',
  `N_SEQ` bigint(18) NOT NULL COMMENT '序号',
  `L_BASE_ID` bigint(18) DEFAULT '0' COMMENT '基础表编号',
  `N_BEGIN_MONEY` decimal(10,0) DEFAULT '0' COMMENT '起始金额',
  `N_END_MONEY` decimal(10,0) DEFAULT '0' COMMENT '结束金额',
  `L_REG_OPERID` bigint(18) DEFAULT '0' COMMENT '创建人(操作员)ID号',
  `C_REG_OPERNAME` varchar(40) DEFAULT NULL COMMENT '创建人(操作员)姓名',
  `D_REG_DATE` varchar(8) NOT NULL COMMENT '创建日期',
  `T_REG_TIME` varchar(8) DEFAULT NULL COMMENT '创建时间',
  `L_MODI_OPERID` bigint(18) DEFAULT NULL COMMENT '修改人(操作员)ID号',
  `C_MODI_OPERNAME` varchar(40) DEFAULT NULL COMMENT '修改人(操作员)姓名',
  `D_MODI_DATE` varchar(8) NOT NULL COMMENT '修改日期',
  `T_MODI_TIME` varchar(8) DEFAULT NULL COMMENT '修改时间',
  `C_BUSIN_STATUS` char(1) DEFAULT NULL,
  `C_LAST_STATUS` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程金额段表'$$

/*Table structure for table `t_sys_wf_node` */

CREATE TABLE IF NOT EXISTS `t_sys_wf_node` (
  `ID` bigint(18) NOT NULL COMMENT '编号',
  `L_BASE_ID` bigint(18) NOT NULL COMMENT '流程基础表编号',
  `N_SEQ` bigint(18) NOT NULL COMMENT '节点顺序',
  `C_NAME` varchar(30) NOT NULL COMMENT '流程节点名称',
  `C_NICKNAME` varchar(30) NOT NULL COMMENT '流程节点别名',
  `C_IS_DISABLED` char(1) NOT NULL COMMENT '是否停用',
  `C_HANDLER` varchar(100) DEFAULT NULL COMMENT '流程节点处理类',
  `C_FORM` varchar(100) DEFAULT NULL COMMENT '流程节点表单',
  `C_TYPE` char(1) NOT NULL COMMENT '流程节点类型 0开始 1结束 2经办 3审批 4子流程',
  `C_OPERROLE` varchar(30) DEFAULT NULL COMMENT '流程节点所属角色(子流程)',
  `C_MONEY_VARIABLE` varchar(100) DEFAULT NULL COMMENT '流程全局金额变量',
  `L_REG_OPERID` bigint(18) DEFAULT '0' COMMENT '创建人(操作员)ID号',
  `C_REG_OPERNAME` varchar(40) DEFAULT NULL COMMENT '创建人(操作员)姓名',
  `D_REG_DATE` varchar(8) NOT NULL COMMENT '创建日期',
  `T_REG_TIME` varchar(8) DEFAULT NULL COMMENT '创建时间',
  `L_MODI_OPERID` bigint(18) DEFAULT NULL COMMENT '修改人(操作员)ID号',
  `C_MODI_OPERNAME` varchar(40) DEFAULT NULL COMMENT '修改人(操作员)姓名',
  `D_MODI_DATE` varchar(8) NOT NULL COMMENT '修改日期',
  `T_MODI_TIME` varchar(8) DEFAULT NULL COMMENT '修改时间',
  `C_BUSIN_STATUS` char(1) DEFAULT NULL,
  `C_LAST_STATUS` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程节点表'$$

/*Table structure for table `t_sys_wf_step` */

CREATE TABLE IF NOT EXISTS `t_sys_wf_step` (
  `ID` bigint(18) NOT NULL COMMENT '编号',
  `L_NODE_ID` bigint(18) NOT NULL COMMENT '节点编号',
  `N_SEQ` bigint(18) NOT NULL COMMENT '顺序',
  `C_NAME` varchar(30) NOT NULL COMMENT '步骤名称',
  `C_NICKNAME` varchar(30) DEFAULT NULL COMMENT '步骤别名',
  `C_AUDIT_TYPE` char(1) DEFAULT NULL COMMENT '审批类型 1并行，0串行',
  `C_IS_MONEY` char(1) DEFAULT NULL COMMENT '是否金额段审批',
  `L_REG_OPERID` bigint(18) DEFAULT '0' COMMENT '创建人(操作员)ID号',
  `C_REG_OPERNAME` varchar(40) DEFAULT NULL COMMENT '创建人(操作员)姓名',
  `D_REG_DATE` varchar(8) NOT NULL COMMENT '创建日期',
  `T_REG_TIME` varchar(8) DEFAULT NULL COMMENT '创建时间',
  `L_MODI_OPERID` bigint(18) DEFAULT NULL COMMENT '修改人(操作员)ID号',
  `C_MODI_OPERNAME` varchar(40) DEFAULT NULL COMMENT '修改人(操作员)姓名',
  `D_MODI_DATE` varchar(8) NOT NULL COMMENT '修改日期',
  `T_MODI_TIME` varchar(8) DEFAULT NULL COMMENT '修改时间',
  `C_BUSIN_STATUS` char(1) DEFAULT NULL,
  `C_LAST_STATUS` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE-NODE-SEQ` (`L_NODE_ID`,`N_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程步骤表'$$


### -- 流程表结构修改
DROP PROCEDURE IF EXISTS change_wf_process_col$$
CREATE PROCEDURE change_wf_process_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='wf_process' AND COLUMN_NAME='cust_No')
	THEN   
	   ALTER TABLE `wf_process` ADD COLUMN `cust_No` BIGINT NULL COMMENT '机构编号';
	END IF;
END$$
CALL change_wf_process_col()$$
DROP PROCEDURE IF EXISTS change_wf_process_col$$

