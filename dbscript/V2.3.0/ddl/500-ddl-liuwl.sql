##-- DDL语句
##
##-- V1.0
##
##-- 表结构非空修改 提交日期2016/11/18


##-- task 194

drop PROCEDURE if EXISTS create_table_seq_record$$
	create procedure create_table_seq_record() 
	BEGIN
		IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_seq_record')
		THEN
		CREATE TABLE `t_sys_seq_record` (
			`ID` BIGINT(18) NOT NULL AUTO_INCREMENT COMMENT '编号',
			`N_VERSION` BIGINT(20) NULL DEFAULT NULL COMMENT '数据版本号',
			`C_CYCLE` CHAR(1) NOT NULL DEFAULT 'Y' COMMENT '周期 D W M Y',
			`D_CYCLE_START_DATE` CHAR(8) NOT NULL COMMENT '周期开始时间',
			`N_NEXT_VALUE` BIGINT(18) NULL DEFAULT NULL,
			`N_INCREMENT_STEP` BIGINT(18) NULL DEFAULT NULL,
			`N_START_VALUE` BIGINT(18) NULL DEFAULT NULL,
			`N_MAX_VALUE` BIGINT(18) NULL DEFAULT NULL,
			`C_OPERORG` VARCHAR(50) NOT NULL DEFAULT 'DEFAULT' COMMENT '机构代码',
			`L_CUSTNO` BIGINT(18) NOT NULL DEFAULT '0' COMMENT '公司编号',
			`C_SEQ_ID` VARCHAR(20) NOT NULL COMMENT '序列号',
			PRIMARY KEY (`ID`),
			INDEX `seqId_operOrg_custNo` (`C_SEQ_ID`, `C_OPERORG`, `L_CUSTNO`)
		)
		COMMENT='序列号生成记录'
		COLLATE='utf8_general_ci'
		ENGINE=InnoDB;
		END IF;
	END$$
call create_table_seq_record()$$
drop PROCEDURE if EXISTS create_table_seq_record$$





##-- task 193
drop PROCEDURE if EXISTS create_table_domain_attribute$$
	create procedure create_table_domain_attribute() 
	BEGIN
		IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_domain_attribute')
		THEN
			CREATE TABLE `t_sys_domain_attribute` (
				`ID` BIGINT(20) NOT NULL COMMENT '编号',
				`C_NAME` VARCHAR(120) NULL DEFAULT NULL COMMENT '参数名',
				`C_CODE` VARCHAR(120) NULL DEFAULT NULL COMMENT '参数编码',
				`C_TYPE` CHAR(2) NULL DEFAULT NULL COMMENT '参数类型',
				`C_DATA_TYPE` CHAR(2) NULL DEFAULT NULL COMMENT '数据类型',
				`C_OPERORG` VARCHAR(120) NULL DEFAULT NULL COMMENT '机构',
				`L_CUSTNO` BIGINT(20) NULL DEFAULT NULL COMMENT '公司',
				`C_CUSTNAME` VARCHAR(120) NULL DEFAULT NULL COMMENT '公司名称',
				`C_STRING_VALUE` VARCHAR(1024) NULL DEFAULT NULL COMMENT '字符串参数',
				`N_NUMBER_VALUE` BIGINT(20) NULL DEFAULT NULL COMMENT '数字参数',
				`F_MONEY_VALUE` DECIMAL(16,2) NULL DEFAULT NULL COMMENT '货币参数',
				`C_OBJECT_VALUE` LONGTEXT NULL COMMENT '对象参数(JSON)',
				`T_MODI_TIME` VARCHAR(8) NULL DEFAULT ' ',
				`D_MODI_DATE` VARCHAR(8) NULL DEFAULT ' ',
				`C_MODI_OPERNAME` VARCHAR(40) NULL DEFAULT ' ',
				`L_MODI_OPERID` BIGINT(18) NULL DEFAULT '0',
				`T_REG_TIME` VARCHAR(8) NULL DEFAULT ' ',
				`D_REG_DATE` VARCHAR(8) NULL DEFAULT ' ',
				`C_REG_OPERNAME` VARCHAR(40) NULL DEFAULT ' ',
				`L_REG_OPERID` BIGINT(18) NULL DEFAULT '0',
				`N_VERSION` BIGINT(20) NULL DEFAULT '0',
				`C_BUSIN_STATUS` CHAR(1) NULL DEFAULT NULL COMMENT '状态：0暂存，1已发布，2已撤回，3已删除',
				`C_LAST_STATUS` CHAR(1) NULL DEFAULT NULL,
				PRIMARY KEY (`ID`),
				UNIQUE INDEX `CODE_OPERORG_CUSTNO` (`C_CODE`, `C_OPERORG`, `L_CUSTNO`)
			)
			COLLATE='utf8_general_ci'
			ENGINE=InnoDB
			;
		END IF;
	END$$
call create_table_domain_attribute()$$
drop PROCEDURE if EXISTS create_table_domain_attribute$$

drop PROCEDURE if EXISTS create_table_domain_attribute$$
	create procedure create_table_domain_attribute() 
	BEGIN
		IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_domain_attribute')
		THEN
			CREATE TABLE `t_sys_business_type` (
				`ID` BIGINT(20) NOT NULL COMMENT '编号',
				`C_CODE` VARCHAR(10) NOT NULL COMMENT '业务类型编码',
				`C_NAME` VARCHAR(50) NULL DEFAULT NULL COMMENT '业务类型名称',
				`C_CREDIT_FLAG` CHAR(1) NULL DEFAULT NULL COMMENT '授信标志',
				`L_MOCK_DATA_ID` BIGINT(20) NULL DEFAULT NULL COMMENT '预览数据编号',
				`C_COMMENTS` VARCHAR(200) NULL DEFAULT NULL COMMENT '备注',
				`C_BUSIN_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '业务状态',
				`C_DOC_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '文档状态',
				`N_VERSION` BIGINT(20) NULL DEFAULT NULL COMMENT '数据版本',
				PRIMARY KEY (`ID`, `C_CODE`)
			)
			COLLATE='utf8_general_ci'
			ENGINE=InnoDB
			;
		END IF;
	END$$
call create_table_domain_attribute()$$
drop PROCEDURE if EXISTS create_table_domain_attribute$$







