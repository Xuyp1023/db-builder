##-- DDL语句
##
##-- V1.0
##
##-- 融资相关表 提交日期2017/6/16
drop PROCEDURE if EXISTS create_table_domain_attribute$$
	create procedure create_table_domain_attribute() 
	BEGIN
		IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset_register')
		THEN
		CREATE TABLE `t_scf_asset_register` (
			`ID` BIGINT(18) NOT NULL,
			`C_REQUESTNO` VARCHAR(50) NULL DEFAULT NULL,
			`C_ASSET_CODE` VARCHAR(50) NULL DEFAULT NULL COMMENT '资产编号',
			`C_REGISTER_CUSTNO` VARCHAR(50) NULL DEFAULT NULL COMMENT '登记企业编号',
			`C_REGISTER_CUSTNAME` VARCHAR(50) NULL DEFAULT NULL COMMENT '登记企业',
			`C_REGISTRANT` VARCHAR(50) NULL DEFAULT NULL COMMENT '登记人',
			`C_ZDW_REG_CODE` VARCHAR(50) NULL DEFAULT NULL COMMENT '登记编号',
			`D_ZDW_REG_DATE` VARCHAR(50) NULL DEFAULT NULL COMMENT '登记日期',
			`L_BATCHNO` BIGINT(18) NULL DEFAULT NULL COMMENT '文件',
			`C_OPERORG` VARCHAR(200) NULL DEFAULT ' ' COMMENT '操作机构',
			`L_REG_OPERID` BIGINT(18) NULL DEFAULT '0',
			`C_REG_OPERNAME` VARCHAR(40) NULL DEFAULT ' ',
			`D_REG_DATE` VARCHAR(8) NULL DEFAULT ' ',
			`T_REG_TIME` VARCHAR(8) NULL DEFAULT ' ',
			`L_MODI_OPERID` BIGINT(18) NULL DEFAULT '0',
			`C_MODI_OPERNAME` VARCHAR(40) NULL DEFAULT ' ',
			`D_MODI_DATE` VARCHAR(8) NULL DEFAULT ' ',
			`T_MODI_TIME` VARCHAR(8) NULL DEFAULT ' ',
			`N_VERSION` BIGINT(20) NULL DEFAULT '0',
			`C_DESCRIPTION` VARCHAR(200) NULL DEFAULT '0',
			PRIMARY KEY (`ID`)
		)
		COMMENT='中征登记检查表'
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
		IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset_check')
		THEN
		CREATE TABLE `t_scf_asset_check` (
			`ID` BIGINT(18) NOT NULL,
			`C_REQUESTNO` VARCHAR(50) NULL DEFAULT NULL,
			`C_ASSET_CODE` VARCHAR(50) NULL DEFAULT NULL COMMENT '资产编号',
			`C_CHECKER` VARCHAR(50) NULL DEFAULT NULL COMMENT '检查人',
			`D_CHECK_DATE` VARCHAR(50) NULL DEFAULT NULL COMMENT '检查日期',
			`C_CHECK_RESULT` VARCHAR(50) NULL DEFAULT NULL COMMENT '检查结果',
			`C_ZDW_REG_CODE` VARCHAR(50) NULL DEFAULT NULL COMMENT '登记编号',
			`D_ZDW_REG_DATE` VARCHAR(50) NULL DEFAULT NULL COMMENT '登记日期',
			`L_BATCHNO` BIGINT(18) NULL DEFAULT NULL COMMENT '文件',
			`C_OPERORG` VARCHAR(200) NULL DEFAULT ' ' COMMENT '操作机构',
			`L_REG_OPERID` BIGINT(18) NULL DEFAULT '0',
			`C_REG_OPERNAME` VARCHAR(40) NULL DEFAULT ' ',
			`D_REG_DATE` VARCHAR(8) NULL DEFAULT ' ',
			`T_REG_TIME` VARCHAR(8) NULL DEFAULT ' ',
			`L_MODI_OPERID` BIGINT(18) NULL DEFAULT '0',
			`C_MODI_OPERNAME` VARCHAR(40) NULL DEFAULT ' ',
			`D_MODI_DATE` VARCHAR(8) NULL DEFAULT ' ',
			`T_MODI_TIME` VARCHAR(8) NULL DEFAULT ' ',
			`N_VERSION` BIGINT(20) NULL DEFAULT '0',
			`C_DESCRIPTION` VARCHAR(200) NULL DEFAULT '0',
			PRIMARY KEY (`ID`)
		)
		COMMENT='中征登记检查表'
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
		IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_request_temp')
		THEN
			CREATE TABLE `t_scf_request_temp` (
			`C_REQUESTNO` VARCHAR(50) NOT NULL COMMENT '申请编号',
			`C_LOAN_NO` VARCHAR(50) NULL DEFAULT NULL COMMENT '融资编号',
			`L_BALANCE` DECIMAL(18,2) NULL DEFAULT NULL COMMENT '申请期限',
			`N_PERIOD` INT(11) NULL DEFAULT NULL COMMENT '申请期限',
			`C_PRODUCT_CODE` VARCHAR(50) NULL DEFAULT NULL COMMENT '产品编号',
			`L_FACTORNO` BIGINT(18) NULL DEFAULT NULL COMMENT '保理公司编号',
			`C_SUPP_BANK_ACCOUNT` VARCHAR(50) NULL DEFAULT NULL COMMENT '收款方银行账户',
			`C_BUSIN_STATUS` VARCHAR(2) NULL DEFAULT NULL COMMENT '申请状态',
			`N_PERIOD_UNIT` VARCHAR(2) NULL DEFAULT NULL COMMENT '申请状态',
			`L_CUSTNO` BIGINT(18) NULL DEFAULT NULL COMMENT '申请企业编号',
			`L_CORE_CUSTNO` BIGINT(18) NULL DEFAULT NULL COMMENT '核心企业编号',
			`C_OPERORG` VARCHAR(200) NULL DEFAULT ' ' COMMENT '操作机构',
			`L_REG_OPERID` BIGINT(18) NULL DEFAULT '0',
			`C_REG_OPERNAME` VARCHAR(40) NULL DEFAULT ' ',
			`D_REG_DATE` VARCHAR(8) NULL DEFAULT ' ',
			`T_REG_TIME` VARCHAR(8) NULL DEFAULT ' ',
			`L_MODI_OPERID` BIGINT(18) NULL DEFAULT '0',
			`C_MODI_OPERNAME` VARCHAR(40) NULL DEFAULT ' ',
			`D_MODI_DATE` VARCHAR(8) NULL DEFAULT ' ',
			`T_MODI_TIME` VARCHAR(8) NULL DEFAULT ' ',
			`N_VERSION` BIGINT(20) NULL DEFAULT '0',
			`C_ORDERS` VARCHAR(50) NULL DEFAULT '0' COMMENT '联资产编号',
			`C_DESCRIPTION` VARCHAR(200) NULL DEFAULT '0',
			PRIMARY KEY (`C_REQUESTNO`)
		)
		COMMENT='融资申请暂存实体'
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
		IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_sign_agreement_relation')
		THEN
		CREATE TABLE `t_scf_sign_agreement_relation` (
			`ID` BIGINT(18) NOT NULL,
			`C_REQUEST_NO` VARCHAR(50) NULL DEFAULT NULL COMMENT '申请编号',
			`L_AGREEMENT_ID` BIGINT(18) NULL DEFAULT NULL COMMENT '合同id',
			`C_TYPE` VARCHAR(2) NULL DEFAULT NULL COMMENT '合同类型',
			PRIMARY KEY (`ID`)
		)
		COMMENT='融资申请暂存实体'
		COLLATE='utf8_general_ci'
		ENGINE=InnoDB
			;
		END IF;
	END$$
call create_table_domain_attribute()$$
drop PROCEDURE if EXISTS create_table_domain_attribute$$



DROP PROCEDURE IF EXISTS change_scf_table_col$$
create procedure change_scf_table_col() BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_request' AND COLUMN_NAME='C_LOANNO')
	THEN
	   ALTER TABLE `t_scf_request` ADD COLUMN	`C_LOANNO` VARCHAR(50) NULL DEFAULT NULL COMMENT '融资编号';
	END IF;

	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_request' AND COLUMN_NAME='C_SUPP_BANK_ACCOUNT')
	THEN
	   ALTER TABLE `t_scf_request` ADD COLUMN  `C_SUPP_BANK_ACCOUNT` VARCHAR(50) NULL DEFAULT NULL COMMENT '收款方银行账户';
	END IF;

	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_request' AND COLUMN_NAME='F_EXTENSION_RATIO')
	THEN
	   ALTER TABLE `t_scf_request` ADD COLUMN	`F_EXTENSION_RATIO` DECIMAL(18,2) NULL DEFAULT '0.00' COMMENT '展期利率';
	END IF;

	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_request' AND COLUMN_NAME='F_OVERDUE_RATIO')
	THEN
	   ALTER TABLE `t_scf_request` ADD COLUMN	`F_OVERDUE_RATIO` DECIMAL(18,2) NULL DEFAULT '0.00' COMMENT '逾期利率';
	END IF;

	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_request_scheme' AND COLUMN_NAME='F_EXTENSION_RATIO')
	THEN
	   ALTER TABLE `t_scf_request_scheme` 	ADD COLUMN `F_EXTENSION_RATIO` DECIMAL(18,2) NULL DEFAULT '0.00' COMMENT '展期利率' ;
	END IF;

	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_request_scheme' AND COLUMN_NAME='F_OVERDUE_RATIO')
	THEN
	   ALTER TABLE `t_scf_request_scheme` ADD COLUMN `F_OVERDUE_RATIO` DECIMAL(18,2) NULL DEFAULT '0.00' COMMENT '逾期利率';
	END IF;
END$$
CALL change_scf_table_col()$$
DROP PROCEDURE IF EXISTS change_scf_table_col$$






