##-- DDL语句
##
##-- V1.0
##
##-- 表结构非空修改 提交日期2017/05/27

##--添加联行号表
drop PROCEDURE if EXISTS create_table_sys_naps_bankcode$$
create procedure create_table_sys_naps_bankcode() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_naps_bankcode')
	THEN
CREATE TABLE `t_sys_naps_bankcode` (
	`c_pay_sys_num` VARCHAR(20) NOT NULL COMMENT '支付系统行号(联行号)',
	`c_participant_line_num` VARCHAR(20) NULL DEFAULT NULL COMMENT '所属直接参与者行号',
	`c_invalid_flag` VARCHAR(2) NULL DEFAULT NULL COMMENT '失效标识',
	`c_city_code` VARCHAR(20) NULL DEFAULT NULL COMMENT '城市代码',
	`c_org_fullname` VARCHAR(200) NULL DEFAULT NULL COMMENT '机构全称',
	`c_org_name` VARCHAR(200) NULL DEFAULT NULL COMMENT '机构简称',
	`c_line_code` VARCHAR(10) NULL DEFAULT NULL COMMENT '行别代码',
	`c_pay_sys_code` VARCHAR(10) NULL DEFAULT NULL COMMENT '支付系统代码',
	`d_effective_date` VARCHAR(20) NULL DEFAULT NULL COMMENT '生效日期',
	`d_invalid_date` VARCHAR(20) NULL DEFAULT NULL COMMENT '失效日期',
	`d_start_date` VARCHAR(20) NULL DEFAULT NULL COMMENT '开始日期',
	`d_end_date` VARCHAR(20) NULL DEFAULT NULL COMMENT '结束日期',
	PRIMARY KEY (`c_pay_sys_num`),
	INDEX `IDXBANKCODE_C_ORG_FULLNAME` (`c_org_fullname`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
	END IF;
END$$
call create_table_sys_naps_bankcode()$$
drop PROCEDURE if EXISTS create_table_sys_naps_bankcode$$

##-- 添加余利宝商户授权表
drop PROCEDURE if EXISTS create_table_alipayinfo$$
create procedure create_table_alipayinfo() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_alipayinfo')
	THEN
CREATE TABLE `t_cust_alipayinfo` (
	`ID` BIGINT(18) NOT NULL COMMENT '编号',
	`L_CUSTNO` BIGINT(18) NULL DEFAULT NULL COMMENT '客户编号',
	`C_AUTH_CODE` VARCHAR(100) NULL DEFAULT NULL COMMENT '请求的authcode',
	`C_APPID` VARCHAR(100) NULL DEFAULT NULL COMMENT '应用编号',
	`C_AUTH_TOKEN` VARCHAR(100) NULL DEFAULT NULL COMMENT '商户授权令牌',
	`C_USER_ID` VARCHAR(100) NULL DEFAULT NULL COMMENT '授权商户的ID',
	`L_EXPIRES_IN` DECIMAL(10,0) NULL DEFAULT NULL COMMENT '令牌有效期',
	`L_RE_EXPIRES_IN` DECIMAL(10,0) NULL DEFAULT NULL COMMENT '刷新令牌有效期',
	`C_REFRESH_TOKEN` VARCHAR(100) NULL DEFAULT NULL COMMENT '刷新令牌时使用',
	`D_REG_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '创建日期',
	`T_REG_TIME` VARCHAR(8) NULL DEFAULT NULL COMMENT '创建时间',
	`L_MODI_OPERID` BIGINT(18) NULL DEFAULT '0' COMMENT '修改人(操作员)ID号',
	`C_MODI_OPERNAME` VARCHAR(40) NULL DEFAULT NULL COMMENT '修改人(操作员)姓名',
	`D_MODI_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '修改日期',
	`T_MODI_TIME` VARCHAR(8) NULL DEFAULT NULL COMMENT '修改时间',
	`C_OPERORG` VARCHAR(200) NULL DEFAULT NULL COMMENT '操作机构',
	`C_BUSIN_STATUS` CHAR(1) NULL DEFAULT NULL COMMENT '状态:0禁用，1启用',
	PRIMARY KEY (`ID`)
)
COMMENT='余利宝商户授权表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_table_alipayinfo()$$
drop PROCEDURE if EXISTS create_table_alipayinfo$$


##-- 余利宝经营类目表
drop PROCEDURE if EXISTS create_table_management_category$$
create procedure create_table_management_category() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_ylb_management_category')
	THEN
CREATE TABLE `t_sys_ylb_management_category` (
	`id` INT(11) NOT NULL,
	`c_name` VARCHAR(30) NULL DEFAULT NULL COMMENT '经营类型名称',
	`c_code` VARCHAR(60) NULL DEFAULT NULL COMMENT '经营类型代码',
	`n_parent_id` INT(11) NULL DEFAULT NULL COMMENT '父类ID',
	`n_order` SMALLINT(6) NULL DEFAULT NULL COMMENT '排序',
	`c_description` VARCHAR(100) NULL DEFAULT NULL COMMENT '描述',
	`c_status` CHAR(1) NOT NULL DEFAULT '1' COMMENT '是否可用',
	`c_special_cert_flag` CHAR(1) NOT NULL DEFAULT '0' COMMENT '需要特殊资质证书标识(0不需要，1需要)',
	`d_regdate` VARCHAR(8) NULL DEFAULT NULL COMMENT '添加日期',
	`c_endnode` CHAR(1) NULL DEFAULT NULL COMMENT '结束节点',
	PRIMARY KEY (`id`),
	INDEX `IDX_CFG_MENU` (`c_name`)
)
COMMENT='余利宝经营类目表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_table_management_category()$$
drop PROCEDURE if EXISTS create_table_management_category$$


##-- 账户申请表中新增联行号字段
drop PROCEDURE if EXISTS change_table_col_accorequest$$
create procedure change_table_col_accorequest() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_accorequest' AND COLUMN_NAME='c_pay_sys_num')
THEN   
   ALTER TABLE `t_sale_accorequest` ADD COLUMN `c_pay_sys_num` VARCHAR(20) NULL COMMENT '联行号';
END IF;
END$$
call change_table_col_accorequest()$$
drop PROCEDURE if EXISTS change_table_col_accorequest$$

drop PROCEDURE if EXISTS change_table_col_mccode$$
create procedure change_table_col_mccode() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_accorequest' AND COLUMN_NAME='C_MC_CODE')
THEN   
   ALTER TABLE `t_sale_accorequest` ADD COLUMN `C_MC_CODE` VARCHAR(32) NULL COMMENT '经营类目';
END IF;
END$$
call change_table_col_mccode()$$
drop PROCEDURE if EXISTS change_table_col_mccode$$


drop PROCEDURE if EXISTS change_table_col_openaccounttmp$$
create procedure change_table_col_openaccounttmp() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_open_account_tmp' AND COLUMN_NAME='c_pay_sys_num')
THEN   
   ALTER TABLE `t_cust_open_account_tmp` ADD COLUMN `c_pay_sys_num` VARCHAR(20) NULL COMMENT '联行号';
END IF;
END$$
call change_table_col_openaccounttmp()$$
drop PROCEDURE if EXISTS change_table_col_openaccounttmp$$

##--修改字段长度
drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_accorequest' AND COLUMN_NAME='C_SALE_REQUESTNO')
THEN   
   ALTER TABLE `t_sale_accorequest` CHANGE COLUMN `C_SALE_REQUESTNO` `C_SALE_REQUESTNO` VARCHAR(50) NULL COMMENT '基金公司申请单号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_request' AND COLUMN_NAME='C_REQUESTNO')
THEN   
   ALTER TABLE `t_sale_request` CHANGE COLUMN `C_REQUESTNO` `C_REQUESTNO` VARCHAR(50) NULL COMMENT '申请单号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_request' AND COLUMN_NAME='C_SALE_TRADEACCO')
THEN   
   ALTER TABLE `t_sale_request` CHANGE COLUMN `C_SALE_TRADEACCO` `C_SALE_TRADEACCO` VARCHAR(50) NULL COMMENT '基金交易账号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_request' AND COLUMN_NAME='C_SALE_REQUESTNO')
THEN   
   ALTER TABLE `t_sale_request` CHANGE COLUMN `C_SALE_REQUESTNO` `C_SALE_REQUESTNO` VARCHAR(50) NULL COMMENT '基金公司申请单号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_risk_record' AND COLUMN_NAME='c_expireTime')
THEN   
   ALTER TABLE `t_risk_record` ADD COLUMN `c_expireTime` VARCHAR(20) NULL COMMENT '过期时间';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_accorequest' AND COLUMN_NAME='c_company_property')
THEN   
   ALTER TABLE `t_sale_accorequest` ADD COLUMN `c_company_property` VARCHAR(20) NULL COMMENT '企业性质';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_accorequest' AND COLUMN_NAME='c_company_property_describe')
THEN   
   ALTER TABLE `t_sale_accorequest` ADD COLUMN `c_company_property_describe` VARCHAR(200) NULL COMMENT '企业性质描述';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_accorequest' AND COLUMN_NAME='c_aptitude')
THEN   
   ALTER TABLE `t_sale_accorequest` ADD COLUMN `c_aptitude` VARCHAR(20) NULL COMMENT '是否有资质';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_accorequest' AND COLUMN_NAME='c_natural_person')
THEN   
   ALTER TABLE `t_sale_accorequest` ADD COLUMN `c_natural_person` VARCHAR(50) NULL COMMENT '实际投资者的自然人';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_accorequest' AND COLUMN_NAME='c_beneficiary')
THEN   
   ALTER TABLE `t_sale_accorequest` ADD COLUMN `c_beneficiary` VARCHAR(50) NULL COMMENT '实际受益人';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$





