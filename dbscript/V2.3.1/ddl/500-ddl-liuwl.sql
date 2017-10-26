##-- DDL语句
##
##-- V1.0
##
##-- 表结构非空修改 提交日期2017/05/27

drop PROCEDURE if EXISTS create_table_sys_business_type$$
create procedure create_table_sys_business_type() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_business_type')
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
ENGINE=InnoDB;
	END IF;
END$$
call create_table_sys_business_type()$$
drop PROCEDURE if EXISTS create_table_sys_business_type$$




drop PROCEDURE if EXISTS create_table_sys_contract$$
create procedure create_table_sys_contract() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract')
	THEN
CREATE TABLE `t_sys_contract` (
	`ID` BIGINT(20) NOT NULL COMMENT '编号',
	`C_NO` VARCHAR(20) NULL DEFAULT NULL COMMENT '电子合同编号',
	`C_NAME` VARCHAR(50) NULL DEFAULT NULL COMMENT '电子合同名称',
	`C_TYPE` CHAR(2) NULL DEFAULT NULL COMMENT '类型 1 模板  2 自定义',
	`L_TYPE_ID` BIGINT(20) NULL DEFAULT NULL COMMENT '合同类型',
	`L_STANDARD_TYPE_ID` BIGINT(20) NULL DEFAULT NULL COMMENT '标准合同类型',
	`L_DATA_SOURCE_ID` BIGINT(20) NULL DEFAULT NULL COMMENT '数据源编号',
	`L_ORIGIN_HTML` BIGINT(20) NULL DEFAULT NULL COMMENT '合同原始html',
	`L_ORIGIN_PDF` BIGINT(20) NULL DEFAULT NULL COMMENT '合同原始pdf',
	`D_SIGN_START_DATE` CHAR(8) NULL DEFAULT NULL COMMENT '签署开始日期',
	`T_SIGN_START_TIME` CHAR(6) NULL DEFAULT NULL COMMENT '签署开始时间',
	`D_SIGN_END_DATE` CHAR(8) NULL DEFAULT NULL COMMENT '签署结束日期',
	`T_SIGN_END_TIME` CHAR(6) NULL DEFAULT NULL COMMENT '签署结束时间',
	`L_SIGN_PDF` BIGINT(20) NULL DEFAULT NULL COMMENT '签署后pdf',
	`C_BUSIN_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '业务状态',
	`C_DOC_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '文档状态',
	`L_CUSTNO` BIGINT(18) NULL DEFAULT NULL COMMENT '公司',
	`C_CUSTNAME` VARCHAR(120) NULL DEFAULT NULL COMMENT '公司名称',
	`C_OPERORG` VARCHAR(200) NULL DEFAULT NULL COMMENT '机构',
	`D_MODI_DATE` CHAR(8) NULL DEFAULT NULL,
	`T_MODI_TIME` CHAR(6) NULL DEFAULT NULL,
	`C_MODI_OPERNAME` VARCHAR(50) NULL DEFAULT NULL,
	`L_MODI_OPERID` BIGINT(20) NULL DEFAULT NULL,
	`T_REG_TIME` CHAR(6) NULL DEFAULT NULL,
	`D_REG_DATE` CHAR(8) NULL DEFAULT NULL,
	`C_REG_OPERNAME` VARCHAR(50) NULL DEFAULT NULL,
	`L_REG_OPERID` BIGINT(20) NULL DEFAULT NULL,
	PRIMARY KEY (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_table_sys_contract()$$
drop PROCEDURE if EXISTS create_table_sys_contract$$


drop PROCEDURE if EXISTS create_table_sys_contract_corp_account$$
create procedure create_table_sys_contract_corp_account() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_corp_account')
	THEN
CREATE TABLE `t_sys_contract_corp_account` (
	`ID` BIGINT(20) NOT NULL COMMENT '编号',
	`C_NAME` VARCHAR(50) NULL DEFAULT NULL COMMENT '名称',
	`C_TYPE` CHAR(2) NULL DEFAULT NULL COMMENT '类型',
	`C_ORG_CODE` VARCHAR(20) NULL DEFAULT NULL COMMENT '组织机构代码',
	`C_IDENT_NO` VARCHAR(20) NULL DEFAULT NULL COMMENT '身份证号',
	`C_ACCOUNT` VARCHAR(20) NULL DEFAULT NULL COMMENT '帐号',
	`C_BUSIN_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '业务状态',
	`C_DOC_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '文档状态',
	`L_CUSTNO` BIGINT(18) NULL DEFAULT NULL COMMENT '公司',
	`C_CUSTNAME` VARCHAR(120) NULL DEFAULT NULL COMMENT '公司名称',
	`C_OPERORG` VARCHAR(200) NULL DEFAULT NULL COMMENT '机构',
	`L_SERVICE_CUSTNO` BIGINT(18) NULL DEFAULT NULL COMMENT '电子合同服务商编号',
	`C_SERVICE_CUSTNAME` VARCHAR(120) NULL DEFAULT NULL COMMENT '电子合同服务商名称',
	`L_SIGNER_ID` BIGINT(20) NULL DEFAULT NULL COMMENT '电子合同签署人编号',
	`L_SIGNER_OPERID` BIGINT(20) NULL DEFAULT NULL COMMENT '电子合同签署人操作员编号',
	`C_SIGNER_OPERNAME` VARCHAR(50) NULL DEFAULT NULL COMMENT '电子合同签署人操作员名称',
	`C_SIGNER_ACCOUNT` VARCHAR(20) NULL DEFAULT NULL COMMENT '电子合同签署人帐号',
	`C_SIGNER_MOBILE_NO` VARCHAR(20) NULL DEFAULT NULL COMMENT '电子合同签署人手机号',
	`D_MODI_DATE` CHAR(8) NULL DEFAULT NULL,
	`T_MODI_TIME` CHAR(6) NULL DEFAULT NULL,
	`C_MODI_OPERNAME` VARCHAR(50) NULL DEFAULT NULL,
	`L_MODI_OPERID` BIGINT(20) NULL DEFAULT NULL,
	`T_REG_TIME` CHAR(6) NULL DEFAULT NULL,
	`D_REG_DATE` CHAR(8) NULL DEFAULT NULL,
	`C_REG_OPERNAME` VARCHAR(50) NULL DEFAULT NULL,
	`L_REG_OPERID` BIGINT(20) NULL DEFAULT NULL,
	PRIMARY KEY (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_table_sys_contract_corp_account()$$
drop PROCEDURE if EXISTS create_table_sys_contract_corp_account$$



drop PROCEDURE if EXISTS create_table_sys_contract_data_source$$
create procedure create_table_sys_contract_data_source() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_data_source')
	THEN
CREATE TABLE `t_sys_contract_data_source` (
	`ID` BIGINT(20) NOT NULL COMMENT '编号',
	`C_NAME` VARCHAR(50) NULL DEFAULT NULL COMMENT '名称',
	`C_TYPE` CHAR(2) NULL DEFAULT NULL COMMENT '类型',
	`C_DATA` LONGTEXT NULL COMMENT '数据',
	`C_EXTERNAL_DATA` LONGTEXT NULL COMMENT '外部数据',
	`C_BUSIN_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '业务状态',
	`C_DOC_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '文档状态',
	`L_CUSTNO` BIGINT(18) NULL DEFAULT NULL COMMENT '公司',
	`C_CUSTNAME` VARCHAR(120) NULL DEFAULT NULL COMMENT '公司名称',
	`C_OPERORG` VARCHAR(200) NULL DEFAULT NULL COMMENT '机构',
	`D_MODI_DATE` CHAR(8) NULL DEFAULT NULL,
	`T_MODI_TIME` CHAR(6) NULL DEFAULT NULL,
	`C_MODI_OPERNAME` VARCHAR(50) NULL DEFAULT NULL,
	`L_MODI_OPERID` BIGINT(20) NULL DEFAULT NULL,
	`T_REG_TIME` CHAR(6) NULL DEFAULT NULL,
	`D_REG_DATE` CHAR(8) NULL DEFAULT NULL,
	`C_REG_OPERNAME` VARCHAR(50) NULL DEFAULT NULL,
	`L_REG_OPERID` BIGINT(20) NULL DEFAULT NULL,
	PRIMARY KEY (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_table_sys_contract_data_source()$$
drop PROCEDURE if EXISTS create_table_sys_contract_data_source$$



drop PROCEDURE if EXISTS create_table_sys_contract_signer_account$$
create procedure create_table_sys_contract_signer_account() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_signer_account')
	THEN
CREATE TABLE `t_sys_contract_signer_account` (
	`ID` BIGINT(20) NOT NULL COMMENT '编号',
	`L_OPERID` BIGINT(20) NULL DEFAULT NULL COMMENT '操作员编号',
	`C_OPERNAME` VARCHAR(50) NULL DEFAULT NULL COMMENT '操作员名称',
	`C_MOBILE_NO` VARCHAR(20) NULL DEFAULT NULL COMMENT '手机号码',
	`C_IDENT_NO` VARCHAR(20) NULL DEFAULT NULL COMMENT '身份证号',
	`C_ACCOUNT` VARCHAR(20) NULL DEFAULT NULL COMMENT '帐号',
	`C_BUSIN_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '业务状态',
	`C_DOC_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '文档状态',
	`C_OPERORG` VARCHAR(200) NULL DEFAULT NULL COMMENT '机构',
	`L_SERVICE_CUSTNO` BIGINT(18) NULL DEFAULT NULL COMMENT '电子合同服务商编号',
	`C_SERVICE_CUSTNAME` VARCHAR(120) NULL DEFAULT NULL COMMENT '电子合同服务商名称',
	`D_MODI_DATE` CHAR(8) NULL DEFAULT NULL,
	`T_MODI_TIME` CHAR(6) NULL DEFAULT NULL,
	`C_MODI_OPERNAME` VARCHAR(50) NULL DEFAULT NULL,
	`L_MODI_OPERID` BIGINT(20) NULL DEFAULT NULL,
	`T_REG_TIME` CHAR(6) NULL DEFAULT NULL,
	`D_REG_DATE` CHAR(8) NULL DEFAULT NULL,
	`C_REG_OPERNAME` VARCHAR(50) NULL DEFAULT NULL,
	`L_REG_OPERID` BIGINT(20) NULL DEFAULT NULL,
	PRIMARY KEY (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_table_sys_contract_signer_account()$$
drop PROCEDURE if EXISTS create_table_sys_contract_signer_account$$



drop PROCEDURE if EXISTS create_table_sys_contract_stamper$$
create procedure create_table_sys_contract_stamper() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_stamper')
	THEN
CREATE TABLE `t_sys_contract_stamper` (
	`ID` BIGINT(20) NOT NULL COMMENT '编号',
	`C_NAME` VARCHAR(50) NULL DEFAULT NULL COMMENT '名称',
	`L_ORIGIN_STAMPER` BIGINT(20) NULL DEFAULT NULL COMMENT '原始文件(BATCHNO)',
	`D_ORIGIN_DATE` CHAR(8) NULL DEFAULT NULL COMMENT '原始文件日期',
	`T_ORIGIN_TIME` CHAR(6) NULL DEFAULT NULL COMMENT '原始文件时间',
	`L_STAMPER` BIGINT(20) NULL DEFAULT NULL COMMENT '印章文件',
	`C_STAMPER_DATA` TEXT NULL COMMENT '印章数据',
	`D_MAKE_DATE` CHAR(8) NULL DEFAULT NULL COMMENT '制作日期',
	`T_MAKE_TIME` CHAR(6) NULL DEFAULT NULL COMMENT '制作时间',
	`L_CUSTNO` BIGINT(18) NULL DEFAULT NULL COMMENT '所属公司',
	`C_CUSTNAME` VARCHAR(120) NULL DEFAULT NULL COMMENT '所属公司名称',
	`C_OPERORG` VARCHAR(200) NULL DEFAULT NULL COMMENT '所属机构',
	`C_BUSIN_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '业务状态',
	`C_DOC_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '文档状态',
	`L_REG_OPERID` BIGINT(20) NULL DEFAULT NULL,
	`C_REG_OPERNAME` VARCHAR(50) NULL DEFAULT NULL,
	`D_REG_DATE` CHAR(8) NULL DEFAULT NULL,
	`T_REG_TIME` CHAR(6) NULL DEFAULT NULL,
	`L_MODI_OPERID` BIGINT(20) NULL DEFAULT NULL,
	`C_MODI_OPERNAME` VARCHAR(50) NULL DEFAULT NULL,
	`D_MODI_DATE` CHAR(8) NULL DEFAULT NULL,
	`T_MODI_TIME` CHAR(6) NULL DEFAULT NULL,
	PRIMARY KEY (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_table_sys_contract_stamper()$$
drop PROCEDURE if EXISTS create_table_sys_contract_stamper$$



drop PROCEDURE if EXISTS create_table_sys_contract_standard_type$$
create procedure create_table_sys_contract_standard_type() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_standard_type')
	THEN
CREATE TABLE `t_sys_contract_standard_type` (
	`ID` BIGINT(20) NOT NULL COMMENT '编号',
	`C_CODE` VARCHAR(10) NOT NULL COMMENT '类型编码',
	`C_NAME` VARCHAR(50) NULL DEFAULT NULL COMMENT '类型名称',
	`L_TYPE_ID` BIGINT(20) NOT NULL COMMENT '合同类型',
	`L_BUSIN_TYPE_ID` BIGINT(20) NOT NULL COMMENT '业务类型',
	`D_ENABLE_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '启用日期',
	`C_BUSIN_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '业务状态 00 未启用  01 启用',
	`C_DOC_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '文档状态',
	`N_VERSION` BIGINT(20) NULL DEFAULT NULL COMMENT '数据版本',
	PRIMARY KEY (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_table_sys_contract_standard_type()$$
drop PROCEDURE if EXISTS create_table_sys_contract_standard_type$$




drop PROCEDURE if EXISTS create_table_sys_contract_stub$$
create procedure create_table_sys_contract_stub() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_stub')
	THEN
CREATE TABLE `t_sys_contract_stub` (
	`ID` BIGINT(20) NOT NULL COMMENT '编号',
	`L_CONTRACT_ID` BIGINT(20) NULL DEFAULT NULL COMMENT '电子合同编号',
	`C_SIGNATORY` CHAR(1) NULL DEFAULT NULL COMMENT '签署方',
	`N_SEQUENCE` INT(11) NULL DEFAULT NULL COMMENT '签署顺序',
	`L_OPERID` BIGINT(18) NULL DEFAULT NULL COMMENT '操作员编号',
	`L_OPERNAME` VARCHAR(50) NULL DEFAULT NULL COMMENT '操作员名称',
	`L_CORP_ACCOUNT_ID` BIGINT(20) NULL DEFAULT NULL COMMENT '企业帐号',
	`L_SIGNER_ACCOUNT_ID` BIGINT(20) NULL DEFAULT NULL COMMENT '签署人帐号',
	`L_CORP_SIGNER_ID` BIGINT(20) NULL DEFAULT NULL COMMENT '公司签署人编号',
	`C_POSITION_TYPE` CHAR(2) NULL DEFAULT NULL COMMENT '位置类型',
	`N_PAGINATION` INT(11) NULL DEFAULT NULL COMMENT '页码',
	`N_AXIS_X` INT(11) NULL DEFAULT NULL COMMENT 'X轴',
	`N_AXIS_Y` INT(11) NULL DEFAULT NULL COMMENT 'Y轴',
	`C_KEY_WORD` VARCHAR(50) NULL DEFAULT NULL COMMENT '关键字',
	`D_SIGN_DATE` CHAR(6) NULL DEFAULT NULL COMMENT '签署日期',
	`T_SIGN_TIME` CHAR(6) NULL DEFAULT NULL COMMENT '签署时间',
	`L_SIGN_PDF` BIGINT(20) NULL DEFAULT NULL COMMENT '签署后pdf',
	`C_BUSIN_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '业务状态',
	`C_DOC_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '文档状态',
	`L_CUSTNO` BIGINT(18) NULL DEFAULT NULL COMMENT '公司',
	`C_CUSTNAME` VARCHAR(120) NULL DEFAULT NULL COMMENT '公司名称',
	`C_OPERORG` VARCHAR(200) NULL DEFAULT NULL COMMENT '机构',
	`D_MODI_DATE` CHAR(8) NULL DEFAULT NULL,
	`T_MODI_TIME` CHAR(6) NULL DEFAULT NULL,
	`C_MODI_OPERNAME` VARCHAR(50) NULL DEFAULT NULL,
	`L_MODI_OPERID` BIGINT(20) NULL DEFAULT NULL,
	`T_REG_TIME` CHAR(6) NULL DEFAULT NULL,
	`D_REG_DATE` CHAR(8) NULL DEFAULT NULL,
	`C_REG_OPERNAME` VARCHAR(50) NULL DEFAULT NULL,
	`L_REG_OPERID` BIGINT(20) NULL DEFAULT NULL,
	PRIMARY KEY (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_table_sys_contract_stub()$$
drop PROCEDURE if EXISTS create_table_sys_contract_stub$$




drop PROCEDURE if EXISTS create_table_sys_contract_template$$
create procedure create_table_sys_contract_template() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_template')
	THEN
CREATE TABLE `t_sys_contract_template` (
	`ID` BIGINT(20) NOT NULL COMMENT '编号',
	`L_TYPE_ID` BIGINT(20) NULL DEFAULT NULL COMMENT '合同类型',
	`L_STANDARD_TYPE_ID` BIGINT(20) NULL DEFAULT NULL COMMENT '标准合同类型',
	`C_NAME` VARCHAR(50) NULL DEFAULT NULL COMMENT '模板名称',
	`C_ORIGIN_APPLY_NO` VARCHAR(50) NULL DEFAULT NULL COMMENT '申请编号',
	`L_ORIGIN_TEMPLATE` BIGINT(20) NULL DEFAULT NULL COMMENT '原始模板',
	`L_ORIGIN_SIMPLE` BIGINT(20) NULL DEFAULT NULL COMMENT '原始示例文件',
	`D_ORIGIN_DATE` CHAR(8) NULL DEFAULT NULL COMMENT '原始文件日期',
	`T_ORIGIN_TIME` CHAR(6) NULL DEFAULT NULL COMMENT '原始文件时间',
	`C_ORIGIN_COMMENT` VARCHAR(100) NULL DEFAULT NULL COMMENT '原始备注',
	`N_ORIGIN_SIGNER_COUNT` BIGINT(20) NULL DEFAULT NULL COMMENT '签署人数量',
	`C_ORIGIN_NO_PATTERN` VARCHAR(50) NULL DEFAULT NULL COMMENT '合同编号模式',
	`L_ORIGIN_OPERID` BIGINT(18) NULL DEFAULT NULL COMMENT '申请人',
	`C_ORIGIN_OPERNAME` VARCHAR(50) NULL DEFAULT NULL COMMENT '申请人',
	`L_TEMPLATE` BIGINT(20) NULL DEFAULT NULL COMMENT '模板文件',
	`D_MAKE_DATE` CHAR(8) NULL DEFAULT NULL COMMENT '制作日期',
	`T_MAKE_TIME` CHAR(6) NULL DEFAULT NULL COMMENT '制作时间',
	`L_MAKE_OPERID` BIGINT(20) NULL DEFAULT NULL COMMENT '制作人',
	`C_MAKE_OPERNAME` VARCHAR(20) NULL DEFAULT NULL COMMENT '制作人名称',
	`C_COMMON` VARCHAR(50) NULL DEFAULT NULL COMMENT '备注',
	`L_CUSTNO` BIGINT(18) NULL DEFAULT NULL COMMENT '所属公司',
	`C_CUSTNAME` VARCHAR(120) NULL DEFAULT NULL COMMENT '所属公司名称',
	`C_OPERORG` VARCHAR(200) NULL DEFAULT NULL COMMENT '所属机构',
	`C_TEXT_AUDIT_REMARK` VARCHAR(100) NULL DEFAULT NULL COMMENT '文本审核意见',
	`C_TEXT_AUDIT_STATUS` CHAR(2) NULL DEFAULT '00' COMMENT '文本审核状态  00 未审核  01 审核通过  02 审核不通过',
	`L_TEXT_AUDIT_OPERID` BIGINT(20) NULL DEFAULT NULL,
	`C_TEXT_AUDIT_OPERNAME` VARCHAR(50) NULL DEFAULT NULL,
	`D_TEXT_AUDIT_DATE` CHAR(8) NULL DEFAULT NULL,
	`T_TEXT_AUDIT_TIME` CHAR(6) NULL DEFAULT NULL,
	`C_TEMPLATE_AUDIT_STATUS` CHAR(2) NULL DEFAULT '00' COMMENT '模板审核状态  00 未审核  01 审核通过  02 审核不通过',
	`C_TEMPLATE_AUDIT_REMARK` VARCHAR(100) NULL DEFAULT NULL COMMENT '模板审核意见 ',
	`L_TEMPLATE_AUDIT_OPERID` BIGINT(20) NULL DEFAULT NULL,
	`C_TEMPLATE_AUDIT_OPERNAME` VARCHAR(50) NULL DEFAULT NULL,
	`D_TEMPLATE_AUDIT_DATE` CHAR(8) NULL DEFAULT NULL,
	`T_TEMPLATE_AUDIT_TIME` CHAR(6) NULL DEFAULT NULL,
	`C_BUSIN_STATUS` CHAR(2) NULL DEFAULT '00' COMMENT '业务状态 00 未使用  01 合同文本   02 合同模板',
	`C_DOC_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '文档状态',
	`L_REG_OPERID` BIGINT(20) NULL DEFAULT NULL,
	`C_REG_OPERNAME` VARCHAR(50) NULL DEFAULT NULL,
	`D_REG_DATE` CHAR(8) NULL DEFAULT NULL,
	`T_REG_TIME` CHAR(6) NULL DEFAULT NULL,
	`L_MODI_OPERID` BIGINT(20) NULL DEFAULT NULL,
	`C_MODI_OPERNAME` VARCHAR(50) NULL DEFAULT NULL,
	`D_MODI_DATE` CHAR(8) NULL DEFAULT NULL,
	`T_MODI_TIME` CHAR(6) NULL DEFAULT NULL,
	PRIMARY KEY (`ID`),
	UNIQUE INDEX `CUST_STANDARD_TYPE_UNIQUE_KEY` (`L_CUSTNO`, `L_STANDARD_TYPE_ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_table_sys_contract_template()$$
drop PROCEDURE if EXISTS create_table_sys_contract_template$$




drop PROCEDURE if EXISTS create_table_sys_contract_template_log$$
create procedure create_table_sys_contract_template_log() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_template_log')
	THEN
CREATE TABLE `t_sys_contract_template_log` (
	`ID` BIGINT(20) NOT NULL COMMENT '编号',
	`L_TEMPLATE_ID` BIGINT(20) NULL DEFAULT NULL COMMENT '合同模板编号',
	`C_TEMPLATE_NAME` VARCHAR(50) NULL DEFAULT NULL COMMENT '合同模板名称',
	`D_OPER_DATE` CHAR(8) NULL DEFAULT NULL COMMENT '操作日期',
	`T_OPER_TIME` CHAR(6) NULL DEFAULT NULL COMMENT '操作时间',
	`C_OPER_TYPE` CHAR(2) NULL DEFAULT NULL COMMENT '操作类型',
	`C_OPER_CONTENT` VARCHAR(100) NULL DEFAULT NULL COMMENT '操作内容',
	`L_CUSTNO` BIGINT(18) NULL DEFAULT NULL COMMENT '操作公司',
	`C_CUSTNAME` VARCHAR(120) NULL DEFAULT NULL COMMENT '操作公司名称',
	`C_OPERORG` VARCHAR(200) NULL DEFAULT NULL COMMENT '操作机构',
	`C_BUSIN_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '业务状态',
	`C_DOC_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '文档状态',
	`D_MODI_DATE` CHAR(8) NULL DEFAULT NULL,
	`C_MODI_OPERNAME` VARCHAR(50) NULL DEFAULT NULL,
	`L_MODI_OPERID` BIGINT(20) NULL DEFAULT NULL,
	`T_REG_TIME` CHAR(6) NULL DEFAULT NULL,
	`D_REG_DATE` CHAR(8) NULL DEFAULT NULL,
	`C_REG_OPERNAME` VARCHAR(50) NULL DEFAULT NULL,
	`L_REG_OPERID` BIGINT(20) NULL DEFAULT NULL,
	`T_MODI_TIME` CHAR(6) NULL DEFAULT NULL,
	PRIMARY KEY (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_table_sys_contract_template_log()$$
drop PROCEDURE if EXISTS create_table_sys_contract_template_log$$




drop PROCEDURE if EXISTS create_table_sys_contract_template_stamp_place$$
create procedure create_table_sys_contract_template_stamp_place() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_template_stamp_place')
	THEN
CREATE TABLE `t_sys_contract_template_stamp_place` (
	`ID` BIGINT(20) NOT NULL COMMENT '编号',
	`L_TEMPLATE_ID` BIGINT(20) NULL DEFAULT NULL COMMENT '合同模板编号',
	`C_TEMPLATE_NAME` VARCHAR(50) NULL DEFAULT NULL COMMENT '合同模板名称',
	`C_SIGNATORY` CHAR(1) NULL DEFAULT NULL COMMENT '签约方',
	`N_SEQUENCE` INT(11) NULL DEFAULT NULL COMMENT '签约顺序',
	`C_TYPE` CHAR(2) NULL DEFAULT NULL COMMENT '位置类型',
	`N_PAGINATION` INT(11) NULL DEFAULT NULL COMMENT '页码',
	`N_AXIS_X` INT(11) NULL DEFAULT NULL COMMENT 'X轴',
	`N_AXIS_Y` INT(11) NULL DEFAULT NULL COMMENT 'Y轴',
	`C_KEY_WORD` VARCHAR(40) NULL DEFAULT NULL COMMENT '关键字',
	`C_BUSIN_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '业务状态',
	`C_DOC_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '文档状态',
	`L_REG_OPERID` BIGINT(20) NULL DEFAULT NULL,
	`C_REG_OPERNAME` VARCHAR(50) NULL DEFAULT NULL,
	`D_REG_DATE` CHAR(8) NULL DEFAULT NULL,
	`T_REG_TIME` CHAR(6) NULL DEFAULT NULL,
	`L_MODI_OPERID` BIGINT(20) NULL DEFAULT NULL,
	`C_MODI_OPERNAME` VARCHAR(50) NULL DEFAULT NULL,
	`D_MODI_DATE` CHAR(8) NULL DEFAULT NULL,
	`T_MODI_TIME` CHAR(6) NULL DEFAULT NULL,
	PRIMARY KEY (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_table_sys_contract_template_stamp_place()$$
drop PROCEDURE if EXISTS create_table_sys_contract_template_stamp_place$$




drop PROCEDURE if EXISTS create_table_sys_contract_type$$
create procedure create_table_sys_contract_type() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_type')
	THEN
CREATE TABLE `t_sys_contract_type` (
	`ID` BIGINT(20) NOT NULL COMMENT '编号',
	`C_CODE` VARCHAR(10) NOT NULL COMMENT '类型编码',
	`C_NAME` VARCHAR(50) NULL DEFAULT NULL COMMENT '类型名称',
	`C_BUSIN_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '业务状态',
	`C_DOC_STATUS` CHAR(2) NULL DEFAULT NULL COMMENT '文档状态',
	`N_VERSION` BIGINT(20) NULL DEFAULT NULL COMMENT '数据版本',
	PRIMARY KEY (`ID`, `C_CODE`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_table_sys_contract_type()$$
drop PROCEDURE if EXISTS create_table_sys_contract_type$$





## -- copy zhoucy ddl   to  liuwl
##--修改电子合同相关表，并且修改这些表的字符集  提交日期2017/09/26
drop PROCEDURE if EXISTS modify_table_stamper_info$$
create procedure modify_table_stamper_info() 
BEGIN

	IF  EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_corp_account' and column_name='C_ACCOUNT')
	THEN 
		ALTER TABLE `t_sys_contract_corp_account`
		CHANGE COLUMN `C_ACCOUNT` `C_ACCOUNT` VARCHAR(50) NULL DEFAULT NULL COMMENT '帐号' AFTER `C_IDENT_NO`;
	END IF;
	
	IF  EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_signer_account' and column_name='C_ACCOUNT')
	THEN 
		ALTER TABLE `t_sys_contract_signer_account`
		CHANGE COLUMN `C_ACCOUNT` `C_ACCOUNT` VARCHAR(50) NULL DEFAULT NULL COMMENT '帐号' AFTER `C_IDENT_NO`;
	END IF;
	
	IF  EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_stub' and column_name='N_PAGINATION')
	THEN 
		ALTER TABLE `t_sys_contract_stub`
		CHANGE COLUMN `N_PAGINATION` `C_PAGINATION` VARCHAR(30) NULL DEFAULT NULL COMMENT '签署页码，若为多页签章，支持页码格式；类似打印指定打印页' AFTER `C_POSITION_TYPE`;
	END IF;
	
	IF  EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_template_stamp_place' and column_name='N_PAGINATION')
	THEN 
		ALTER TABLE `t_sys_contract_template_stamp_place`
		CHANGE COLUMN `N_PAGINATION` `C_PAGINATION` VARCHAR(30) NULL DEFAULT NULL COMMENT '签署页码，若为多页签章，支持页码格式；类似打印指定打印页' AFTER `C_TYPE`;
	END IF;

	IF  EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_stub' and column_name='L_OPERNAME')
	THEN 
		ALTER TABLE `t_sys_contract_stub`
	CHANGE COLUMN `L_OPERNAME` `C_OPERNAME` VARCHAR(50) NULL DEFAULT NULL COMMENT '操作员名称' AFTER `L_OPERID`;
	END IF;

	IF  EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_corp_account' and column_name='C_SIGNER_ACCOUNT')
	THEN 
		ALTER TABLE `t_sys_contract_corp_account`
		CHANGE COLUMN `C_SIGNER_ACCOUNT` `C_SIGNER_ACCOUNT` VARCHAR(200) NULL DEFAULT NULL COMMENT '电子合同签署人帐号' AFTER `C_SIGNER_OPERNAME`;
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

	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_agreement' and column_name='L_TEMPLATEID')
	THEN 
		ALTER TABLE `t_scf_agreement`
		ADD COLUMN `L_TEMPLATEID` BIGINT(20) NULL DEFAULT NULL COMMENT '电子合同模板编号' AFTER `C_ENDDATE`;
	END IF;

IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_stub' and column_name='C_SIGN_SERVICEID')
	THEN 
		ALTER TABLE `t_sys_contract_stub`
		ADD COLUMN `C_SIGN_SERVICEID` VARCHAR(50) NULL DEFAULT NULL COMMENT '签署记录id' AFTER `C_OPERNAME`;
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
		
END$$
call modify_table_stamper_info()$$
drop PROCEDURE if EXISTS modify_table_stamper_info$$




##-- 修改文件相关处理的字段类型和增加文件批次号信息，字段明细和验证规则  提交日期2017/10/16
drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN

IF  EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileitem' and column_name='N_BATCHNO')	
		THEN 	
			ALTER TABLE `t_cust_fileitem`
			CHANGE COLUMN `N_BATCHNO` `N_BATCHNO` BIGINT NULL DEFAULT NULL AFTER `ID`;
	END IF;

	IF  EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileitem' and column_name='ID')	
		THEN 	
			ALTER TABLE `t_cust_fileitem`
			CHANGE COLUMN `ID` `ID` BIGINT NULL DEFAULT NULL FIRST;
	END IF;
	
	IF  EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileitem' and column_name='N_LENGTH')	
		THEN 	
			ALTER TABLE `t_cust_fileitem`
			CHANGE COLUMN `N_LENGTH` `N_LENGTH` INT NULL DEFAULT NULL AFTER `C_FILEPATH`;
	END IF;

IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileitem')
THEN   

	IF  EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit' and column_name='ID')	
		THEN 	
			ALTER TABLE `t_cust_fileaduit`
			CHANGE COLUMN `ID` `ID` BIGINT NOT NULL FIRST;
	END IF;
	
	IF  EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit' and column_name='L_CUSTNO')	
		THEN 	
			ALTER TABLE `t_cust_fileaduit`
			CHANGE COLUMN `L_CUSTNO` `L_CUSTNO` BIGINT NOT NULL AFTER `ID`;
	END IF;
	
	IF  EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit' and column_name='N_COUNT')	
		THEN 	
			ALTER TABLE `t_cust_fileaduit`
			CHANGE COLUMN `N_COUNT` `N_COUNT` SMALLINT NULL DEFAULT NULL AFTER `L_CUSTNO`;
	END IF;
	
	IF  EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit' and column_name='C_TYPE')	
		THEN 	
			ALTER TABLE `t_cust_fileaduit`
			CHANGE COLUMN `C_TYPE` `C_TYPE` VARCHAR(60) NOT NULL AFTER `C_STATUS`;
	END IF;
	
	IF  EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit' and column_name='L_ADUIT_CUSTNO')	
		THEN 	
			ALTER TABLE `t_cust_fileaduit`
			CHANGE COLUMN `L_ADUIT_CUSTNO` `L_ADUIT_CUSTNO` BIGINT NULL DEFAULT NULL AFTER `C_OPERNO`;
	END IF;
	

	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit' and column_name='N_BATCHNO')
		THEN 
			ALTER TABLE `t_cust_fileaduit`
			ADD COLUMN `N_BATCHNO` BIGINT(20) NOT NULL AFTER `ID`;
		END IF;

	IF  EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit_temp' and column_name='ID')
		THEN 
			ALTER TABLE `t_cust_fileaduit_temp`
			CHANGE COLUMN `ID` `ID` BIGINT NOT NULL FIRST;
		END IF;
	
	IF  EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit_temp' and column_name='L_CUSTNO')
		THEN 
			ALTER TABLE `t_cust_fileaduit_temp`
			CHANGE COLUMN `L_CUSTNO` `L_CUSTNO` BIGINT NOT NULL AFTER `ID`;
	END IF;
	
	IF  EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit_temp' and column_name='N_COUNT')
		THEN 
			ALTER TABLE `t_cust_fileaduit_temp`
			CHANGE COLUMN `N_COUNT` `N_COUNT` SMALLINT NULL AFTER `L_CUSTNO`;
	END IF;
	
	IF  EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit_temp' and column_name='C_STATUS')
		THEN 
			ALTER TABLE `t_cust_fileaduit_temp`
			CHANGE COLUMN `C_STATUS` `C_STATUS` VARCHAR(1) NOT NULL AFTER `N_COUNT`;
	END IF;
	
	IF  EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit_temp' and column_name='C_TYPE')
		THEN 
			ALTER TABLE `t_cust_fileaduit_temp`
			CHANGE COLUMN `C_TYPE` `C_TYPE` VARCHAR(60) NOT NULL AFTER `C_STATUS`;
	END IF;
	
	IF  EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit_temp' and column_name='L_ADUIT_CUSTNO')
		THEN 
			ALTER TABLE `t_cust_fileaduit_temp`
			CHANGE COLUMN `L_ADUIT_CUSTNO` `L_ADUIT_CUSTNO` BIGINT NULL DEFAULT NULL AFTER `C_OPERNO`;
	END IF;
	

	IF  EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit_temp' and column_name='L_ADUIT_CUSTNO')
		THEN 
			ALTER TABLE `t_cust_fileaduit_temp`
			CHANGE COLUMN `L_CUSTNO` `L_CUSTNO` BIGINT(20) NULL AFTER `ID`;
	END IF;
	
	

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