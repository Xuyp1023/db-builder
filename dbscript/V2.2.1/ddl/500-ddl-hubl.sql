##-- 角色菜单关系表修改		提交日期2017/03/24
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cfg_menu_role' AND COLUMN_NAME='c_shirouser_type')
	THEN   
	   ALTER TABLE `t_cfg_menu_role` ADD COLUMN `c_shirouser_type` VARCHAR(100) NULL COMMENT '身份标识';
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$
	
	
	
	
	
##-- 创建基金流程表	提交日期2017/04/05
drop PROCEDURE if EXISTS create_table_flow$$
	create procedure create_table_flow() 
	BEGIN
		IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_flow_activity')
		THEN
		CREATE TABLE `t_cust_flow_activity` (
		  `ID` bigint(20) NOT NULL COMMENT '流水号',
		  `N_FLOW_ID` bigint(20) DEFAULT NULL COMMENT '流程编号',
		  `C_NAME` varchar(120) NOT NULL COMMENT '任务名称',
		  `N_STEP` tinyint(4) DEFAULT NULL COMMENT '审批步骤',
		  `C_DESCRIPTION` varchar(100) DEFAULT NULL COMMENT '摘要',
		  `C_OPERORG` varchar(90) NOT NULL COMMENT '操作员所在机构，如果证书登录；则是证书公钥的摘要',
		  `C_ADUIT_TYPE` char(1) NOT NULL COMMENT '审批类型，0层级审批，1跳级审批',
		  `C_URL` varchar(100) DEFAULT NULL COMMENT '执行的URL地址',
		  `C_OPERTYPE` varchar(4) NOT NULL COMMENT '操作别名，经办，复核，审批',
		  `N_NEXT_STEP` tinyint(4) DEFAULT NULL COMMENT '审批下一步',
		  PRIMARY KEY (`ID`),
		  KEY `IDX_CUST_FLOW_ACTIVITY` (`C_OPERORG`)
		);
		END IF;
	END$$
call create_table_flow()$$
drop PROCEDURE if EXISTS create_table_flow$$

drop PROCEDURE if EXISTS create_table_flow$$
	create procedure create_table_flow() 
	BEGIN
		IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_flow_def')
		THEN
		CREATE TABLE `t_cust_flow_def` (
		  `ID` bigint(20) NOT NULL COMMENT '流水号',
		  `C_OPERORG` varchar(90) NOT NULL COMMENT '操作员所在机构，如果证书登录；则是证书公钥的摘要',
		  `C_CODE` varchar(20) NOT NULL COMMENT '流程编号',
		  `C_NAME` varchar(120) DEFAULT NULL COMMENT '流程名称',
		  `C_BUSINFLAG` varchar(60) NOT NULL COMMENT '适用业务代码',
		  `C_BUSINCLASS` varchar(3) NOT NULL COMMENT '业务种类;账户业务，交易业务，账户撤单，交易撤单',
		  `C_MODIFY` char(1) DEFAULT NULL COMMENT '是否允许修改；0禁止修改，1允许修改',
		  `C_DESCRIPTION` varchar(100) DEFAULT NULL COMMENT '摘要',
		  `C_STATUS` char(1) NOT NULL COMMENT '状态  0 停用1，启用 ',
		  `D_REGDATE` char(8) NOT NULL COMMENT '登记日期',
		  `D_MODIDATE` varchar(15) NOT NULL COMMENT '修改日期',
		  `N_VALIDDAY` smallint(6) DEFAULT NULL COMMENT '有效天数；默认是7天',
		  PRIMARY KEY (`ID`)
		);
		END IF;
	END$$
call create_table_flow()$$
drop PROCEDURE if EXISTS create_table_flow$$


drop PROCEDURE if EXISTS create_table_flow$$
	create procedure create_table_flow() 
	BEGIN
		IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_flow_executor')
		THEN		
		CREATE TABLE `t_cust_flow_executor` (
		  `ID` bigint(20) NOT NULL COMMENT '流水号',
		  `N_ACTION_ID` bigint(20) DEFAULT NULL COMMENT '活动编号',
		  `C_CODE` varchar(20) DEFAULT NULL COMMENT '执行者代码',
		  `C_NAME` varchar(60) NOT NULL COMMENT '执行者名称',
		  `N_WEIGHT` tinyint(4) DEFAULT NULL COMMENT '权重；按100分处理，只要审批结果大于等于100分即通过',
		  `C_DESCRIPTION` varchar(100) DEFAULT NULL COMMENT '摘要',
		  `C_OPERORG` varchar(90) NOT NULL COMMENT '操作员所在机构，如果证书登录；则是证书公钥的摘要',
		  `F_PER_MIN` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '审批单笔最低额',
		  `F_PER_MAX` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '审批单笔最高额',
		  PRIMARY KEY (`ID`),
		  KEY `IDX_CUST_FLOW_EXECUTOR` (`C_OPERORG`)
		);
		END IF;
	END$$
call create_table_flow()$$
drop PROCEDURE if EXISTS create_table_flow$$


drop PROCEDURE if EXISTS create_table_flow$$
	create procedure create_table_flow() 
	BEGIN
		IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_flow_order')
		THEN		
		CREATE TABLE `t_cust_flow_order` (
		  `ID` bigint(20) NOT NULL COMMENT '流水号',
		  `N_FLOW_ID` bigint(20) NOT NULL COMMENT '流程编码',
		  `C_FLOWNAME` varchar(120) NOT NULL COMMENT '流程实例名字',
		  `C_TASKNAME` varchar(120) DEFAULT NULL COMMENT '任务名称',
		  `C_ACCEPT` varchar(1) NOT NULL COMMENT '受理方式 ；0柜台，1电话，2网上交易，3传真，4手机，5机构',
		  `C_BUSINFLAG` varchar(3) NOT NULL COMMENT '业务代码',
		  `C_REQUESTNO` varchar(24) NOT NULL COMMENT '业务流水号',
		  `C_FUNDCODE` varchar(6) DEFAULT NULL COMMENT '基金代码',
		  `F_SHARE` decimal(16,2) DEFAULT NULL COMMENT '申请份额',
		  `F_BALANCE` decimal(16,2) DEFAULT NULL COMMENT '申请金额',
		  `T_OPERTIME` varchar(15) NOT NULL COMMENT '下单时间；将操作日期和操作时间合并 yyyyMMdd HHMISS',
		  `C_BUSINCLASS` varchar(3) NOT NULL COMMENT '业务种类;01账户业务，02交易业务，03账户撤单，04交易撤单',
		  `C_DESCRIPTION` varchar(100) DEFAULT NULL COMMENT '摘要',
		  `C_NAME` varchar(18) NOT NULL COMMENT '订单操作员名字',
		  `C_CODE` varchar(18) NOT NULL COMMENT '订单操作员编码',
		  `C_OPERORG` varchar(90) NOT NULL COMMENT '操作员所在机构，如果证书登录；则是证书公钥的摘要',
		  `L_CUSTNO` bigint(20) NOT NULL COMMENT '客户编号',
		  `N_RESULT` tinyint(4) NOT NULL COMMENT '审批结果，0未审批，1审批中， 2同意，3驳回修改，4作废',
		  `D_VALIDDATE` varchar(8) DEFAULT NULL COMMENT '有效日期，业务发起日+流程定义的有效天数',
		  `N_VERSION` bigint(20) NOT NULL DEFAULT '0' COMMENT '数据版本号，主要处理并发问题；处理逻辑是：更新表时，将版本号加+1然后更新的条件加版本号',
		  `C_STATUS` varchar(3) DEFAULT NULL COMMENT '业务状态；根据不同的业务处理不同的状态',
		  `N_TASK_ID` bigint(20) NOT NULL COMMENT '当前任务',
		  `N_ADUIT_AMT_STEP` smallint(6) DEFAULT NULL,
		  PRIMARY KEY (`ID`),
		  UNIQUE KEY `IDX_CUST_FLOW_ORDER2` (`C_REQUESTNO`,`C_BUSINCLASS`),
		  KEY `IDX_CUST_FLOW_ORDER` (`C_OPERORG`)
		);
		END IF;
	END$$
call create_table_flow()$$
drop PROCEDURE if EXISTS create_table_flow$$


drop PROCEDURE if EXISTS create_table_flow$$
	create procedure create_table_flow() 
	BEGIN
		IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_flow_params')
		THEN		
		CREATE TABLE `t_cust_flow_params` (
		  `n_flow_id` int(11) DEFAULT NULL,
		  `c_aduit_min_amount` decimal(16,2) NOT NULL,
		  `c_aduit_max_amount` decimal(16,2) DEFAULT NULL,
		  `n_step` smallint(6) DEFAULT NULL,
		  `c_operorg` varchar(90) NOT NULL,
		  PRIMARY KEY (`c_aduit_min_amount`,`c_operorg`)
		);
		END IF;
	END$$
call create_table_flow()$$
drop PROCEDURE if EXISTS create_table_flow$$


drop PROCEDURE if EXISTS create_table_flow$$
	create procedure create_table_flow() 
	BEGIN
		IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_flow_task')
		THEN		
		CREATE TABLE `t_cust_flow_task` (
		  `ID` bigint(20) NOT NULL COMMENT '流水号',
		  `N_ORDER_ID` bigint(20) NOT NULL COMMENT '流程实例编码',
		  `C_OPERTYPE` varchar(4) NOT NULL COMMENT '操作别名，经办，复核，审批',
		  `C_DESCRIPTION` varchar(100) DEFAULT NULL COMMENT '摘要',
		  `C_OPERORG` varchar(90) NOT NULL COMMENT '操作员所在机构，如果证书登录；则是证书公钥的摘要',
		  `C_STATUS` varchar(3) DEFAULT NULL COMMENT '处理后状态；0未处理，1下单成功，2下单失败，3撤单作废，4等待签约，5签约失败，6正在处理，7系统作废，8确认失败，9确认成功',
		  `C_LAST_STATUS` varchar(3) DEFAULT NULL COMMENT '处理前状态',
		  `N_ACTION_ID` bigint(20) DEFAULT NULL COMMENT '活动编号',
		  `N_RESULT` tinyint(4) NOT NULL COMMENT '审批结果，0未审批，1审批中， 2同意，3驳回修改，4作废',
		  `N_WEIGHT` tinyint(4) DEFAULT NULL COMMENT '完成进度，根据执行者执行情况合计',
		  `N_VERSION` bigint(20) NOT NULL DEFAULT '0' COMMENT '数据版本号，主要处理并发问题；处理逻辑是：更新表时，将版本号加+1然后更新的条件加版本号',
		  `T_ADUITTIME` varchar(15) DEFAULT NULL COMMENT '完成时间 yyyyMMdd HHMISS',
		  PRIMARY KEY (`ID`),
		  KEY `IDX_CUST_FLOW_TASK` (`C_OPERORG`)
		);
		END IF;
	END$$
call create_table_flow()$$
drop PROCEDURE if EXISTS create_table_flow$$


drop PROCEDURE if EXISTS create_table_flow$$
	create procedure create_table_flow() 
	BEGIN
		IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_flow_task_executor')
		THEN		
		CREATE TABLE `t_cust_flow_task_executor` (
		  `ID` bigint(20) NOT NULL COMMENT '流水号',
		  `N_TASK_ID` bigint(20) DEFAULT NULL COMMENT '任务编号',
		  `C_CODE` varchar(20) DEFAULT NULL COMMENT '执行者代码',
		  `C_NAME` varchar(60) NOT NULL COMMENT '执行者名称',
		  `N_RESULT` tinyint(4) NOT NULL COMMENT '审批结果，0未审批，1审批中， 2同意，3驳回修改，4作废',
		  `N_WEIGHT` tinyint(4) DEFAULT NULL COMMENT '权重；按100分处理，只要审批结果大于等于100分即通过',
		  `C_DESCRIPTION` varchar(100) DEFAULT NULL COMMENT '摘要',
		  `C_OPERORG` varchar(90) NOT NULL COMMENT '操作员所在机构，如果证书登录；则是证书公钥的摘要',
		  `F_PER_MIN` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '审批单笔最低额',
		  `F_PER_MAX` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '审批单笔最高额',
		  `T_OPERTIME` varchar(15) NOT NULL COMMENT '执行时间；将操作日期和操作时间合并 yyyyMMdd HHMISS',
		  `N_VERSION` bigint(20) NOT NULL DEFAULT '0' COMMENT '数据版本号，主要处理并发问题；处理逻辑是：更新表时，将版本号加+1然后更新的条件加版本号',
		  PRIMARY KEY (`ID`),
		  KEY `IDX_FLOW_TASK_EXECUTOR` (`C_OPERORG`,`C_CODE`)
		);
		END IF;
	END$$
call create_table_flow()$$
drop PROCEDURE if EXISTS create_table_flow$$