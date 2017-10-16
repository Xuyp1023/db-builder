##-- 后置DML语句
##

##-- V2.3.1
##
##--修改电子合同相关表，并且修改这些表的字符集  提交日期2017/09/26
drop PROCEDURE if EXISTS modify_table_stamper_info$$
create procedure modify_table_stamper_info() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_corp_account' and column_name='C_MOBILENO')
	THEN 
		ALTER TABLE `t_sys_contract_corp_account`
		ADD COLUMN `C_MOBILENO` VARCHAR(20) NOT NULL AFTER `L_REG_OPERID`;
	END IF;

	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_stamper' and column_name='C_CUSTTYPE')
	THEN 
		ALTER TABLE `t_sys_contract_stamper`
		ADD COLUMN `C_CUSTTYPE` CHAR(1) NULL DEFAULT '0' COMMENT '客户类型：0：机构；1：个人' AFTER `C_NAME`;
	END IF;

	ALTER TABLE `t_sys_contract_corp_account`
		CHANGE COLUMN `C_ACCOUNT` `C_ACCOUNT` VARCHAR(50) NULL DEFAULT NULL COMMENT '帐号' AFTER `C_IDENT_NO`;

	ALTER TABLE `t_sys_contract_signer_account`
		CHANGE COLUMN `C_ACCOUNT` `C_ACCOUNT` VARCHAR(50) NULL DEFAULT NULL COMMENT '帐号' AFTER `C_IDENT_NO`;

	ALTER TABLE `t_sys_contract_stub`
		CHANGE COLUMN `N_PAGINATION` `C_PAGINATION` VARCHAR(30) NULL DEFAULT NULL COMMENT '签署页码，若为多页签章，支持页码格式；类似打印指定打印页' AFTER `C_POSITION_TYPE`;

	ALTER TABLE `t_sys_contract_template_stamp_place`
		CHANGE COLUMN `N_PAGINATION` `C_PAGINATION` VARCHAR(30) NULL DEFAULT NULL COMMENT '签署页码，若为多页签章，支持页码格式；类似打印指定打印页' AFTER `C_TYPE`;

	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_agreement' and column_name='L_TEMPLATEID')
	THEN 
		ALTER TABLE `t_scf_agreement`
		ADD COLUMN `L_TEMPLATEID` BIGINT(20) NULL DEFAULT NULL COMMENT '电子合同模板编号' AFTER `C_ENDDATE`;
	END IF;
	
	ALTER TABLE `t_sys_contract_stub`
	CHANGE COLUMN `L_OPERNAME` `C_OPERNAME` VARCHAR(50) NULL DEFAULT NULL COMMENT '操作员名称' AFTER `L_OPERID`;
	
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_stub' and column_name='C_SIGN_SERVICEID')
	THEN 
		ALTER TABLE `t_sys_contract_stub`
		ADD COLUMN `C_SIGN_SERVICEID` VARCHAR(50) NULL DEFAULT NULL COMMENT '签署记录id' AFTER `C_OPERNAME`；
	END IF;
	
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_agreement_stub' and column_name='N_SEQUENCE')
	THEN 
		ALTER TABLE `t_scf_agreement_stub`
		ADD COLUMN `N_SEQUENCE` INT NOT NULL COMMENT '签署序号' AFTER `l_custno`;
	END IF;
	
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_agreement_stub' and column_name='C_SIGN_SERVICEID')	
	THEN 
		ALTER TABLE `t_scf_agreement_stub`
		ADD COLUMN `C_SIGN_SERVICEID` VARCHAR(50) NULL COMMENT '在电子合同服务商那边的签署记录id' AFTER `D_REGDATE`;
	END IF;
	
	ALTER TABLE `t_sys_contract_corp_account`
		CHANGE COLUMN `C_SIGNER_ACCOUNT` `C_SIGNER_ACCOUNT` VARCHAR(200) NULL DEFAULT NULL COMMENT '电子合同签署人帐号' AFTER `C_SIGNER_OPERNAME`;

	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_corp_account' and column_name='C_ORG_REGTYPE')	
	THEN 
		ALTER TABLE `t_sys_contract_corp_account`
		ADD COLUMN `C_ORG_REGTYPE` VARCHAR(1) NOT NULL COMMENT ' 证件形式，0：三证合一，1：一证一码' AFTER `C_MOBILENO`;
	END IF;
	
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_agreement' and column_name='n_htmlno')	
	THEN 	
		ALTER TABLE `t_scf_agreement`
		ADD COLUMN `n_htmlno` BIGINT(20) NULL DEFAULT NULL COMMENT '原始的HTML的文件信息' AFTER `L_TEMPLATEID`;
	END IF;
		
	ALTER TABLE t_contract_ledger  CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
	ALTER TABLE t_contract_ledger_cust CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
	ALTER TABLE t_contract_ledger_recode CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
	ALTER TABLE t_cps_daily_statement CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
	ALTER TABLE t_cps_daily_statement_record  CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
	ALTER TABLE t_cps_monthly_statement CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
	ALTER TABLE t_cps_monthly_statement_record  CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
	ALTER TABLE t_scf_agreement_standard CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
	ALTER TABLE t_scf_agreement_type CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
		
END$$
call modify_table_stamper_info()$$
drop PROCEDURE if EXISTS modify_table_stamper_info$$


##-- 修改文件相关处理的字段类型和增加文件批次号信息，字段明细和验证规则  提交日期2017/10/16
drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileitem')
THEN   

ALTER TABLE `t_cust_fileitem`
	CHANGE COLUMN `N_BATCHNO` `N_BATCHNO` BIGINT NULL DEFAULT NULL AFTER `ID`;
	
ALTER TABLE `t_cust_fileitem`
	CHANGE COLUMN `ID` `ID` BIGINT NULL DEFAULT NULL FIRST,
	CHANGE COLUMN `N_LENGTH` `N_LENGTH` INT NULL DEFAULT NULL AFTER `C_FILEPATH`;
	
ALTER TABLE `t_cust_fileaduit`
	ALTER `ID` DROP DEFAULT,
	ALTER `L_CUSTNO` DROP DEFAULT,
	ALTER `C_TYPE` DROP DEFAULT;
	
ALTER TABLE `t_cust_fileaduit`
	CHANGE COLUMN `ID` `ID` BIGINT NOT NULL FIRST,
	CHANGE COLUMN `L_CUSTNO` `L_CUSTNO` BIGINT NOT NULL AFTER `ID`,
	CHANGE COLUMN `N_COUNT` `N_COUNT` SMALLINT NULL DEFAULT NULL AFTER `L_CUSTNO`,
	CHANGE COLUMN `C_TYPE` `C_TYPE` VARCHAR(60) NOT NULL AFTER `C_STATUS`,
	CHANGE COLUMN `L_ADUIT_CUSTNO` `L_ADUIT_CUSTNO` BIGINT NULL DEFAULT NULL AFTER `C_OPERNO`;

	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit' and column_name='N_BATCHNO')
	THEN 
	ALTER TABLE `t_cust_fileaduit`
		ADD COLUMN `N_BATCHNO` BIGINT(20) NOT NULL AFTER `ID`;
	END IF;

ALTER TABLE `t_cust_fileaduit_temp`
	ALTER `ID` DROP DEFAULT,
	ALTER `L_CUSTNO` DROP DEFAULT,
	ALTER `N_COUNT` DROP DEFAULT,
	ALTER `C_STATUS` DROP DEFAULT,
	ALTER `C_TYPE` DROP DEFAULT;
	
ALTER TABLE `t_cust_fileaduit_temp`
	CHANGE COLUMN `ID` `ID` BIGINT NOT NULL FIRST,
	CHANGE COLUMN `L_CUSTNO` `L_CUSTNO` BIGINT NOT NULL AFTER `ID`,
	CHANGE COLUMN `N_COUNT` `N_COUNT` SMALLINT NULL AFTER `L_CUSTNO`,
	CHANGE COLUMN `C_STATUS` `C_STATUS` VARCHAR(1) NOT NULL AFTER `N_COUNT`,
	CHANGE COLUMN `C_TYPE` `C_TYPE` VARCHAR(60) NOT NULL AFTER `C_STATUS`,
	CHANGE COLUMN `L_ADUIT_CUSTNO` `L_ADUIT_CUSTNO` BIGINT NULL DEFAULT NULL AFTER `C_OPERNO`;
	
ALTER TABLE `t_cust_fileaduit_temp`
	ALTER `L_CUSTNO` DROP DEFAULT,
	ALTER `C_STATUS` DROP DEFAULT,
	ALTER `C_TYPE` DROP DEFAULT;
	
ALTER TABLE `t_cust_fileaduit_temp`
	CHANGE COLUMN `L_CUSTNO` `L_CUSTNO` BIGINT(20) NULL AFTER `ID`,
	CHANGE COLUMN `C_STATUS` `C_STATUS` VARCHAR(1) NULL AFTER `N_COUNT`,
	CHANGE COLUMN `C_TYPE` `C_TYPE` VARCHAR(60) NOT NULL AFTER `C_STATUS`;

	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit_temp' and column_name='N_BATCHNO')
	THEN 
	ALTER TABLE `t_cust_fileaduit_temp`
		ADD COLUMN `N_BATCHNO` BIGINT(18) NULL DEFAULT '0' COMMENT '审批临时文件信息';
	END IF;
	 
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_operator' and column_name='N_BATCHNO')
	THEN 
	ALTER TABLE `t_cust_operator`
		ADD COLUMN `N_BATCHNO` BIGINT(18) NULL DEFAULT '0' COMMENT '经办人附件信息' AFTER `C_CLERK`;
	END IF;
	
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$
