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
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_risk_record' AND COLUMN_NAME='c_expireTime')
THEN   
   ALTER TABLE `t_risk_record` ADD COLUMN `c_expireTime` VARCHAR(20) NULL COMMENT '过期时间';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_accorequest' AND COLUMN_NAME='c_company_property')
THEN   
   ALTER TABLE `t_sale_accorequest` ADD COLUMN `c_company_property` VARCHAR(20) NULL COMMENT '企业性质';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_accorequest' AND COLUMN_NAME='c_company_property_describe')
THEN   
   ALTER TABLE `t_sale_accorequest` ADD COLUMN `c_company_property_describe` VARCHAR(200) NULL COMMENT '企业性质描述';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_accorequest' AND COLUMN_NAME='c_aptitude')
THEN   
   ALTER TABLE `t_sale_accorequest` ADD COLUMN `c_aptitude` VARCHAR(20) NULL COMMENT '是否有资质';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_accorequest' AND COLUMN_NAME='c_natural_person')
THEN   
   ALTER TABLE `t_sale_accorequest` ADD COLUMN `c_natural_person` VARCHAR(50) NULL COMMENT '实际投资者的自然人';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_accorequest' AND COLUMN_NAME='c_beneficiary')
THEN   
   ALTER TABLE `t_sale_accorequest` ADD COLUMN `c_beneficiary` VARCHAR(50) NULL COMMENT '实际受益人';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

##修改字段类型
drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_far_function' AND COLUMN_NAME='C_DESCRIPTION')
THEN   
   ALTER TABLE `t_far_function` CHANGE COLUMN `C_DESCRIPTION` `C_DESCRIPTION` MEDIUMTEXT NULL COMMENT '功能描述';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_far_config' AND COLUMN_NAME='C_VALUE')
THEN   
   ALTER TABLE `t_far_config` CHANGE COLUMN `C_VALUE` `C_VALUE` VARCHAR(2000) NULL COMMENT '配置内容';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


##-- 添加列 F_DAYS 
drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_daily_statement' AND COLUMN_NAME='F_DAYS')
THEN   
   ALTER TABLE `t_cps_daily_statement` ADD COLUMN `F_DAYS` BIGINT(10) NULL COMMENT '结算利息的天数';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_monthly_statement_record' AND COLUMN_NAME='F_DAYS')
THEN   
   ALTER TABLE `t_cps_monthly_statement_record` ADD COLUMN `F_DAYS` BIGINT(10) NULL COMMENT '结算利息的天数';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

##-- 增加余利宝门店通知表 2017/07/05
drop PROCEDURE if EXISTS create_table_alipay_notify$$
create procedure create_table_alipay_notify() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_alipay_notify')
	THEN
CREATE TABLE `t_alipay_notify` (
	`id` BIGINT(18) NOT NULL COMMENT '编号',
	`c_partner_id` VARCHAR(16)  NULL DEFAULT NULL COMMENT '店铺所属商户的PID',	
	`c_notify_pid` VARCHAR(16)  NULL DEFAULT NULL COMMENT '店铺所属系统集成商的PID',
	`t_notify_time` VARCHAR(32)  NULL DEFAULT NULL COMMENT '通知发送时间',
	`c_shop_id` VARCHAR(64)  NULL DEFAULT NULL COMMENT '支付宝门店ID',
	`c_busin_status` VARCHAR(10)  NULL DEFAULT NULL COMMENT '门店状态：PAUSED（暂停）,OPEN（开店）,CLOSED（关店）,FREEZE（冻结）',
	`c_sign_type` VARCHAR(10)  NULL DEFAULT NULL COMMENT '签名算法类型，目前支持RSA',
	`c_sign` VARCHAR(256)  NULL DEFAULT NULL COMMENT '签名',
	`c_display_status` VARCHAR(2)  NULL DEFAULT NULL COMMENT '门店在支付宝钱包展示状态，T：展示，F：不展示',
	`c_notify_type` VARCHAR(64)  NULL DEFAULT NULL COMMENT '通知类型：shop_update（门店变更通知）',
	`t_update_time` VARCHAR(32)  NULL DEFAULT NULL COMMENT '店铺变动时间',
	`t_create_time` VARCHAR(32)  NULL DEFAULT NULL COMMENT '店铺创建时间',
	`c_action` VARCHAR(50)  NULL DEFAULT NULL COMMENT 'ON_LINE_SHOP：上架店铺,OFF_LINE_SHOP：下架店铺,MODIFY_SHOP：修改店铺,FREEZE_SHOP：冻结店铺,UNFREEZE_SHOP：解冻店铺,HIDE_SHOP：隐藏店铺,SHOW_SHOP：展示店铺',
	`c_notify_id` VARCHAR(128)  NULL DEFAULT NULL COMMENT '通知ID',	
	d_reg_date varchar(8) null default null,
	t_reg_time varchar(8) null default null,
	PRIMARY KEY (`ID`)
)
COMMENT='余利宝门店被动通知表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
	END IF;
END$$
call create_table_alipay_notify()$$
drop PROCEDURE if EXISTS create_table_alipay_notify$$

##--银行信息表添加默认 null 值  2017/07/05
drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_mech_bankacco' AND COLUMN_NAME='C_BANK_NO')
THEN   
   ALTER TABLE `t_cust_mech_bankacco` CHANGE COLUMN `C_BANK_NO` `C_BANK_NO` VARCHAR(4) NULL COMMENT '银行编码';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_mech_bankacco' AND COLUMN_NAME='C_BANK_NAME')
THEN   
   ALTER TABLE `t_cust_mech_bankacco` CHANGE COLUMN `C_BANK_NAME` `C_BANK_NAME` VARCHAR(60) NULL COMMENT '银行全称';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_mech_bankacco' AND COLUMN_NAME='C_BANK_ACCO')
THEN   
   ALTER TABLE `t_cust_mech_bankacco` CHANGE COLUMN `C_BANK_ACCO` `C_BANK_ACCO` VARCHAR(30) NULL COMMENT '银行账户';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_mech_bankacco' AND COLUMN_NAME='C_BANK_ACCONAME')
THEN   
   ALTER TABLE `t_cust_mech_bankacco` CHANGE COLUMN `C_BANK_ACCONAME` `C_BANK_ACCONAME` VARCHAR(120) NULL COMMENT '银行户名；个人户的信息必须和客户信息一致，机构户可以不一致';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_mech_bankacco' AND COLUMN_NAME='C_TRADE_ACCO')
THEN   
   ALTER TABLE `t_cust_mech_bankacco` CHANGE COLUMN `C_TRADE_ACCO` `C_TRADE_ACCO` VARCHAR(100) NULL COMMENT '交易账户';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='T_SALE_ACCOREQUEST' AND COLUMN_NAME='C_TRADEACCO')
THEN   
   ALTER TABLE `T_SALE_ACCOREQUEST` CHANGE COLUMN `C_TRADEACCO` `C_TRADEACCO` VARCHAR(100) NULL COMMENT '交易账户';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_request' AND COLUMN_NAME='C_TRADEACCO')
THEN   
   ALTER TABLE `t_sale_request` CHANGE COLUMN `C_TRADEACCO` `C_TRADEACCO` VARCHAR(100) NULL COMMENT '交易账户';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_relation' AND COLUMN_NAME='C_TRADEACCO')
THEN   
   ALTER TABLE `t_sale_relation` CHANGE COLUMN `C_TRADEACCO` `C_TRADEACCO` VARCHAR(100) NULL COMMENT '交易账户';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_flow_order' AND COLUMN_NAME='C_REQUESTNO')
THEN   
   ALTER TABLE `t_cust_flow_order` CHANGE COLUMN `C_REQUESTNO` `C_REQUESTNO` VARCHAR(50) NULL COMMENT '申请单号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_confirm' AND COLUMN_NAME='C_REQUESTNO')
THEN   
   ALTER TABLE `t_sale_confirm` CHANGE COLUMN `C_REQUESTNO` `C_REQUESTNO` VARCHAR(50) NULL COMMENT '申请单号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_confirm' AND COLUMN_NAME='C_TRADEACCO')
THEN   
   ALTER TABLE `t_sale_confirm` CHANGE COLUMN `C_TRADEACCO` `C_TRADEACCO` VARCHAR(100) NULL COMMENT '交易账户';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_tmp_sale_confirm' AND COLUMN_NAME='C_TRADEACCO')
THEN   
   ALTER TABLE `t_tmp_sale_confirm` CHANGE COLUMN `C_TRADEACCO` `C_TRADEACCO` VARCHAR(100) NULL COMMENT '交易账户';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_tmp_sale_confirm' AND COLUMN_NAME='C_REQUESTNO')
THEN   
   ALTER TABLE `t_tmp_sale_confirm` CHANGE COLUMN `C_REQUESTNO` `C_REQUESTNO` VARCHAR(50) NULL COMMENT '申请单号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='T_SALE_ACCOREQUEST' AND COLUMN_NAME='C_SALE_TRADEACCO')
THEN   
   ALTER TABLE `T_SALE_ACCOREQUEST` CHANGE COLUMN `C_SALE_TRADEACCO` `C_SALE_TRADEACCO` VARCHAR(100) NULL COMMENT '基金公司交易账户';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_relation' AND COLUMN_NAME='C_SALE_TRADEACCO')
THEN   
   ALTER TABLE `t_sale_relation` CHANGE COLUMN `C_SALE_TRADEACCO` `C_SALE_TRADEACCO` VARCHAR(100) NULL COMMENT '基金交易账户';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_confirm' AND COLUMN_NAME='C_SALE_REQUESTNO')
THEN   
   ALTER TABLE `t_sale_confirm` CHANGE COLUMN `C_SALE_REQUESTNO` `C_SALE_REQUESTNO` VARCHAR(50) NULL COMMENT '申请单号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_tmp_sale_confirm' AND COLUMN_NAME='C_SALE_REQUESTNO')
THEN   
   ALTER TABLE `t_tmp_sale_confirm` CHANGE COLUMN `C_SALE_REQUESTNO` `C_SALE_REQUESTNO` VARCHAR(50) NULL COMMENT '申请单号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_tmp_sale_confirm' AND COLUMN_NAME='C_SALE_TRADEACCO')
THEN   
   ALTER TABLE `t_tmp_sale_confirm` CHANGE COLUMN `C_SALE_TRADEACCO` `C_SALE_TRADEACCO` VARCHAR(100) NULL COMMENT '申请单号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_tmp_sale_confirm' AND COLUMN_NAME='C_CSERIALNO')
THEN   
   ALTER TABLE `t_tmp_sale_confirm` CHANGE COLUMN `C_CSERIALNO` `C_CSERIALNO` VARCHAR(100) NULL COMMENT '确认单号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_confirm' AND COLUMN_NAME='C_CSERIALNO')
THEN   
   ALTER TABLE `t_sale_confirm` CHANGE COLUMN `C_CSERIALNO` `C_CSERIALNO` VARCHAR(100) NULL COMMENT '确认单号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_confirm' AND COLUMN_NAME='C_CITYNO')
THEN   
   ALTER TABLE `t_sale_confirm` CHANGE COLUMN `C_CITYNO` `C_CITYNO` VARCHAR(100) NULL COMMENT '城市地区代码';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_tmp_sale_confirm' AND COLUMN_NAME='C_CITYNO')
THEN   
   ALTER TABLE `t_tmp_sale_confirm` CHANGE COLUMN `C_CITYNO` `C_CITYNO` VARCHAR(100) NULL COMMENT '城市地区代码';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='T_SALE_SHARES' AND COLUMN_NAME='C_TRADEACCO')
THEN   
   ALTER TABLE `T_SALE_SHARES` CHANGE COLUMN `C_TRADEACCO` `C_TRADEACCO` VARCHAR(100) NULL COMMENT '交易账户';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='T_SALE_SHARES' AND COLUMN_NAME='C_SALE_TRADEACCO')
THEN   
   ALTER TABLE `T_SALE_SHARES` CHANGE COLUMN `C_SALE_TRADEACCO` `C_SALE_TRADEACCO` VARCHAR(100) NULL COMMENT '销售商交易账户';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_request' AND COLUMN_NAME='C_TANO')
THEN   
   ALTER TABLE `t_sale_request` CHANGE COLUMN `C_TANO` `C_TANO` VARCHAR(2) NULL COMMENT 'TA代码';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_request' AND COLUMN_NAME='C_EXCEPTFLAG')
THEN   
   ALTER TABLE `t_sale_request` CHANGE COLUMN `C_EXCEPTFLAG` `C_EXCEPTFLAG` CHAR(1) NULL COMMENT '异常交易标志';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_request' AND COLUMN_NAME='C_BUSINCLASS')
THEN   
   ALTER TABLE `t_sale_request` CHANGE COLUMN `C_BUSINCLASS` `C_BUSINCLASS` CHAR(1) NULL COMMENT '业务种类，0普通业务，1预约业务，2赎回转认购，3钱柜充值提现，6赎回转申购';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_confirm' AND COLUMN_NAME='C_BUSINCLASS')
THEN   
   ALTER TABLE `t_sale_confirm` CHANGE COLUMN `C_BUSINCLASS` `C_BUSINCLASS` CHAR(1) NULL COMMENT '业务种类，0普通业务，1预约业务，2赎回转认购，3钱柜充值提现，6赎回转申购';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_monthly_statement' AND COLUMN_NAME='f_tax_balance')
THEN   
   ALTER TABLE `t_cps_monthly_statement` CHANGE COLUMN `f_tax_balance` `f_tax_balance` DECIMAL(16,2) NULL COMMENT '税额(手续费)';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_relation' AND COLUMN_NAME='C_SALE_REQUESTNO')
THEN   
   ALTER TABLE `t_sale_relation` CHANGE COLUMN `C_SALE_REQUESTNO` `C_SALE_REQUESTNO` VARCHAR(50) NULL COMMENT '基金公司申请单号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_request' AND COLUMN_NAME='C_FUNDACCO')
THEN   
   ALTER TABLE `t_sale_request` CHANGE COLUMN `C_FUNDACCO` `C_FUNDACCO` VARCHAR(50) NULL COMMENT '基金账户';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_confirm' AND COLUMN_NAME='C_FUNDACCO')
THEN   
   ALTER TABLE `t_sale_confirm` CHANGE COLUMN `C_FUNDACCO` `C_FUNDACCO` VARCHAR(50) NULL COMMENT '基金账户';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


##--新增结束金额字段 2017/08/26
drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_confirm' AND COLUMN_NAME='C_SALE_TRADEACCO')
THEN   
   ALTER TABLE `t_sale_confirm` ADD COLUMN `C_SALE_TRADEACCO` VARCHAR(50)  COMMENT '基金交易账号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='T_SALE_ACCOCONFIRM' AND COLUMN_NAME='C_SALE_NETNO')
THEN   
   ALTER TABLE `T_SALE_ACCOCONFIRM` ADD COLUMN `C_SALE_NETNO` VARCHAR(50)  COMMENT '网点编码';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='T_SALE_ACCOCONFIRM' AND COLUMN_NAME='C_SALE_PAYCENTER')
THEN   
   ALTER TABLE `T_SALE_ACCOCONFIRM` ADD COLUMN `C_SALE_PAYCENTER` VARCHAR(50)  COMMENT '分中心';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='T_SALE_ACCOCONFIRM' AND COLUMN_NAME='C_SALE_TRADEACCO')
THEN   
   ALTER TABLE `T_SALE_ACCOCONFIRM` ADD COLUMN `C_SALE_TRADEACCO` VARCHAR(50)  COMMENT '基金交易账号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='T_SALE_ACCOCONFIRM' AND COLUMN_NAME='C_SALE_CUSTNO')
THEN   
   ALTER TABLE `T_SALE_ACCOCONFIRM` ADD COLUMN `C_SALE_CUSTNO` VARCHAR(50)  COMMENT '基金客户号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='T_SALE_ACCOCONFIRM' AND COLUMN_NAME='C_SALE_MONEYACCOUNT')
THEN   
   ALTER TABLE `T_SALE_ACCOCONFIRM` ADD COLUMN `C_SALE_MONEYACCOUNT` VARCHAR(50)  COMMENT '资金账户';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='T_SALE_ACCOCONFIRM' AND COLUMN_NAME='C_SALE_REQUESTNO')
THEN   
   ALTER TABLE `T_SALE_ACCOCONFIRM` ADD COLUMN `C_SALE_REQUESTNO` VARCHAR(50)  COMMENT '基金公司申请单号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_shares' AND COLUMN_NAME='C_FUNDACCO')
THEN   
   ALTER TABLE `t_sale_shares` CHANGE COLUMN `C_FUNDACCO` `C_FUNDACCO` VARCHAR(50) NULL COMMENT '基金账户';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_fund_limit' AND COLUMN_NAME='F_FIRST_PER_MIN')
THEN   
   ALTER TABLE `t_sale_fund_limit` CHANGE COLUMN `F_FIRST_PER_MIN` `F_FIRST_PER_MIN` DECIMAL(20,2) NULL COMMENT '首次最低额 当购买类型为预约时预约总额度';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_fund_limit' AND COLUMN_NAME='F_FIRST_PER_MAX')
THEN   
   ALTER TABLE `t_sale_fund_limit` CHANGE COLUMN `F_FIRST_PER_MAX` `F_FIRST_PER_MAX` DECIMAL(20,2) NULL COMMENT '首次最高额';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_fund_limit' AND COLUMN_NAME='F_APP_PER_MIN')
THEN   
   ALTER TABLE `t_sale_fund_limit` CHANGE COLUMN `F_APP_PER_MIN` `F_APP_PER_MIN` DECIMAL(20,2) NULL COMMENT '追加最低额';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_fund_limit' AND COLUMN_NAME='F_APP_PER_MAX')
THEN   
   ALTER TABLE `t_sale_fund_limit` CHANGE COLUMN `F_APP_PER_MAX` `F_APP_PER_MAX` DECIMAL(20,2) NULL COMMENT '追加最高额';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_fund_limit' AND COLUMN_NAME='F_DAY_MAX')
THEN   
   ALTER TABLE `t_sale_fund_limit` CHANGE COLUMN `F_DAY_MAX` `F_DAY_MAX` DECIMAL(20,2) NULL COMMENT '当日累计最高额度';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_fund_limit' AND COLUMN_NAME='F_PER_MIN')
THEN   
   ALTER TABLE `t_sale_fund_limit` CHANGE COLUMN `F_PER_MIN` `F_PER_MIN` DECIMAL(20,2) NULL COMMENT '单笔最低额';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_fund_limit' AND COLUMN_NAME='F_PER_MAX')
THEN   
   ALTER TABLE `t_sale_fund_limit` CHANGE COLUMN `F_PER_MAX` `F_PER_MAX` DECIMAL(20,2) NULL COMMENT '单笔最高额';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_fund_limit' AND COLUMN_NAME='F_HOLD_MAX')
THEN   
   ALTER TABLE `t_sale_fund_limit` CHANGE COLUMN `F_HOLD_MAX` `F_HOLD_MAX` DECIMAL(20,2) NULL COMMENT '最高持有';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_fund_limit' AND COLUMN_NAME='F_HOLD_MIN')
THEN   
   ALTER TABLE `t_sale_fund_limit` CHANGE COLUMN `F_HOLD_MIN` `F_HOLD_MIN` DECIMAL(20,2) NULL COMMENT '最低持有';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_tmp_sale_accoconfirm' AND COLUMN_NAME='C_ERRCODE')
THEN   
   ALTER TABLE `t_tmp_sale_accoconfirm` CHANGE COLUMN `C_ERRCODE` `C_ERRCODE` varchar(6) NULL COMMENT '错误代码';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_tmp_sale_accoconfirm' AND COLUMN_NAME='C_SALE_REQUESTNO')
THEN   
   ALTER TABLE `t_tmp_sale_accoconfirm` CHANGE COLUMN `C_SALE_REQUESTNO` `C_SALE_REQUESTNO` varchar(50) NULL COMMENT '销售机构申请编号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_tmp_sale_accoconfirm' AND COLUMN_NAME='C_SALE_TRADEACCO')
THEN   
   ALTER TABLE `t_tmp_sale_accoconfirm` CHANGE COLUMN `C_SALE_TRADEACCO` `C_SALE_TRADEACCO` varchar(50) NULL COMMENT '销售机构交易账号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_tmp_sale_accoconfirm' AND COLUMN_NAME='C_SALE_CUSTNO')
THEN   
   ALTER TABLE `t_tmp_sale_accoconfirm` CHANGE COLUMN `C_SALE_CUSTNO` `C_SALE_CUSTNO` varchar(50) NULL COMMENT '销售机构客户号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$



drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_tmp_sale_accoconfirm' AND COLUMN_NAME='C_SALE_MONEYACCOUNT')
THEN   
   ALTER TABLE `t_tmp_sale_accoconfirm` CHANGE COLUMN `C_SALE_MONEYACCOUNT` `C_SALE_MONEYACCOUNT` varchar(50) NULL COMMENT '销售基金账户';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_accoconfirm' AND COLUMN_NAME='C_TRADEACCO')
THEN   
   ALTER TABLE `t_sale_accoconfirm` CHANGE COLUMN `C_TRADEACCO` `C_TRADEACCO` varchar(50) NULL COMMENT '交易账户';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_accoconfirm' AND COLUMN_NAME='C_NETNO')
THEN   
   ALTER TABLE `t_sale_accoconfirm` CHANGE COLUMN `C_NETNO` `C_NETNO` varchar(50) NULL COMMENT '网点编码';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_accoconfirm' AND COLUMN_NAME='C_CSERIALNO')
THEN   
   ALTER TABLE `t_sale_accoconfirm` CHANGE COLUMN `C_CSERIALNO` `C_CSERIALNO` varchar(50) NULL COMMENT '确认单号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_accoconfirm' AND COLUMN_NAME='C_TAGET_TRADEACCO')
THEN   
   ALTER TABLE `t_sale_accoconfirm` CHANGE COLUMN `C_TAGET_TRADEACCO` `C_TAGET_TRADEACCO` varchar(50) NULL COMMENT '对方交易帐号 对代理人申报008或058，此处赋值为新交易帐号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_accoconfirm' AND COLUMN_NAME='C_ERRCODE')
THEN   
   ALTER TABLE `t_sale_accoconfirm` CHANGE COLUMN `C_ERRCODE` `C_ERRCODE` varchar(50) NULL COMMENT '错误代码';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$



drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_fundinfo' AND COLUMN_NAME='F_MAXSHARE')
THEN   
   ALTER TABLE `t_sale_fundinfo` CHANGE COLUMN `F_MAXSHARE` `F_MAXSHARE` DECIMAL(20,2) NULL COMMENT '最高持有份额';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$



drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_fundinfo' AND COLUMN_NAME='F_MINSHARE')
THEN   
   ALTER TABLE `t_sale_fundinfo` CHANGE COLUMN `F_MINSHARE` `F_MINSHARE` DECIMAL(20,2) NULL COMMENT '最小持有份额';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


##--上传文件字段加长
drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileupload' AND COLUMN_NAME='C_REQUESTNO')
THEN   
   ALTER TABLE `t_cust_fileupload` CHANGE COLUMN `C_REQUESTNO` `C_REQUESTNO` VARCHAR(50) NULL COMMENT '申请单号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileupload' AND COLUMN_NAME='C_TRADEACCO')
THEN   
   ALTER TABLE `t_cust_fileupload` CHANGE COLUMN `C_TRADEACCO` `C_TRADEACCO` VARCHAR(50) NULL COMMENT '交易账户';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileupload' AND COLUMN_NAME='C_SALE_REQUESTNO')
THEN   
   ALTER TABLE `t_cust_fileupload` CHANGE COLUMN `C_SALE_REQUESTNO` `C_SALE_REQUESTNO` VARCHAR(50) NULL COMMENT '销售机构申请编号';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$






##--创建企业方案表 2017/09/04  
drop PROCEDURE if EXISTS create_table_comMoneyScheme$$
create procedure create_table_comMoneyScheme() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_com_money_scheme')
	THEN
CREATE TABLE `t_com_money_scheme` (
	`id` BIGINT(18) NOT NULL,
	`c_scheme_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '方案名称',
	`F_INCOMEUNIT` DECIMAL(9,5) NULL DEFAULT '0.00000' COMMENT '万份单位收益',
	`F_INCOMERATIO` DECIMAL(9,5) NULL DEFAULT '0.00000' COMMENT '七日年化收益',
	`D_CDATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '发布日期',
	`D_VALID_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '有效日期',
	`c_scheme_type` VARCHAR(2) NULL DEFAULT NULL COMMENT '方案类型',
	`f_investment_amount` DECIMAL(16,2) NULL DEFAULT NULL COMMENT '投资金额',
	`c_first_choice` CHAR(1) NULL DEFAULT '1' COMMENT '是否为首选：9首选，1正常',
	`c_auto_redem` CHAR(1) NULL DEFAULT '0' COMMENT '到期自动赎回：1自动赎回',
	`l_investment_term` BIGINT(10) NULL DEFAULT NULL COMMENT '投资期限',
	`c_scheme_describe` VARCHAR(200) NULL DEFAULT NULL COMMENT '方案描述',
	`c_busin_status` VARCHAR(2) NULL DEFAULT NULL COMMENT '状态：1可用，0禁用',
	`d_regdate` VARCHAR(8) NULL DEFAULT NULL COMMENT '注册日期',
	`t_regtime` VARCHAR(8) NULL DEFAULT NULL COMMENT '注册时间',
	`d_modifydate` VARCHAR(8) NULL DEFAULT NULL COMMENT '修改日期',
	`t_modeifytime` VARCHAR(8) NULL DEFAULT NULL COMMENT '修改时间',
	`c_operorg` VARCHAR(200) NULL DEFAULT NULL COMMENT '方案所属机构',
	`c_add_operorg` VARCHAR(200) NULL DEFAULT NULL COMMENT '添加的操作机构',
	`c_add_operid` BIGINT(18) NULL DEFAULT NULL COMMENT '添加的操作员编号',
	`c_add_opername` VARCHAR(120) NULL DEFAULT NULL COMMENT '添加的操作员名称',
	`c_modify_operorg` VARCHAR(200) NULL DEFAULT NULL COMMENT '修改的操作机构',
	`c_modify_operid` BIGINT(18) NULL DEFAULT NULL COMMENT '修改的操作员编号',
	`c_modify_opername` VARCHAR(120) NULL DEFAULT NULL COMMENT '修改的操作员名称',
	`C_RULE_TYPE` VARCHAR(120) NULL DEFAULT NULL COMMENT '角色类型（平台添加大家都可以查看）',
	PRIMARY KEY (`id`)
)
COMMENT='企额宝方案表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_table_comMoneyScheme()$$
drop PROCEDURE if EXISTS create_table_comMoneyScheme$$


drop PROCEDURE if EXISTS create_table_comMoneyScheme_Temp$$
create procedure create_table_comMoneyScheme_Temp() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_com_money_scheme_temp')
	THEN
CREATE TABLE `t_com_money_scheme_temp` (
	`id` BIGINT(18) NOT NULL,
	`c_scheme_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '方案名称',
	`F_INCOMEUNIT` DECIMAL(9,5) NULL DEFAULT '0.00000' COMMENT '万份单位收益',
	`F_INCOMERATIO` DECIMAL(9,5) NULL DEFAULT '0.00000' COMMENT '七日年化收益',
	`D_CDATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '发布日期',
	`D_VALID_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '有效日期',
	`c_scheme_type` VARCHAR(2) NULL DEFAULT NULL COMMENT '方案类型',
	`f_investment_amount` DECIMAL(16,2) NULL DEFAULT NULL COMMENT '投资金额',
	`c_first_choice` CHAR(1) NULL DEFAULT '1' COMMENT '是否为首选：9首选，1正常',
	`c_auto_redem` CHAR(1) NULL DEFAULT '0' COMMENT '到期自动赎回：1自动赎回',
	`l_investment_term` BIGINT(10) NULL DEFAULT NULL COMMENT '投资期限',
	`c_scheme_describe` VARCHAR(200) NULL DEFAULT NULL COMMENT '方案描述',
	`c_busin_status` VARCHAR(2) NULL DEFAULT NULL COMMENT '状态：1可用，0禁用',
	`d_regdate` VARCHAR(8) NULL DEFAULT NULL COMMENT '注册日期',
	`t_regtime` VARCHAR(8) NULL DEFAULT NULL COMMENT '注册时间',
	`d_modifydate` VARCHAR(8) NULL DEFAULT NULL COMMENT '修改日期',
	`t_modeifytime` VARCHAR(8) NULL DEFAULT NULL COMMENT '修改时间',
	`c_operorg` VARCHAR(200) NULL DEFAULT NULL COMMENT '方案所属机构',
	`c_add_operorg` VARCHAR(200) NULL DEFAULT NULL COMMENT '添加的操作机构',
	`c_add_operid` BIGINT(18) NULL DEFAULT NULL COMMENT '添加的操作员编号',
	`c_add_opername` VARCHAR(120) NULL DEFAULT NULL COMMENT '添加的操作员名称',
	`c_modify_operorg` VARCHAR(200) NULL DEFAULT NULL COMMENT '修改的操作机构',
	`c_modify_operid` BIGINT(18) NULL DEFAULT NULL COMMENT '修改的操作员编号',
	`c_modify_opername` VARCHAR(120) NULL DEFAULT NULL COMMENT '修改的操作员名称',
	`C_RULE_TYPE` VARCHAR(120) NULL DEFAULT NULL COMMENT '角色类型（平台添加大家都可以查看）',
	PRIMARY KEY (`id`)
)
COMMENT='企额宝方案临时表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_table_comMoneyScheme_Temp()$$
drop PROCEDURE if EXISTS create_table_comMoneyScheme_Temp$$


drop PROCEDURE if EXISTS create_t_scheme_fund_combin$$
create procedure create_t_scheme_fund_combin() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scheme_fund_combin')
	THEN
CREATE TABLE `t_scheme_fund_combin` (
	`id` BIGINT(18) NOT NULL,
	`l_schemeid` BIGINT(18) NOT NULL COMMENT '方案投资编号',
	`c_agencyNo` VARCHAR(3) NULL DEFAULT NULL COMMENT '销售机构代码',
	`c_fundCode` CHAR(6) NULL DEFAULT NULL COMMENT '基金代码',
	`C_FUNDNAME` VARCHAR(60) NULL DEFAULT NULL COMMENT '基金名称',
	`F_INCOMEUNIT` DECIMAL(9,5) NULL DEFAULT '0.00000' COMMENT '万份单位收益',
	`F_INCOMERATIO` DECIMAL(9,5) NULL DEFAULT '0.00000' COMMENT '七日年化收益',
	`F_MAXBALANCE` DECIMAL(16,2) NULL DEFAULT '0.00' COMMENT '最大投资金额',
	`C_MAX_PROPORTION` VARCHAR(10) NULL DEFAULT NULL COMMENT '最大投资占比',
	`C_INVESTMENT_PROPORTION` VARCHAR(10) NULL DEFAULT NULL COMMENT '当前投资占比',
	`f_investment_balance` DECIMAL(16,2) NULL DEFAULT NULL COMMENT '当前投资金额',
	`c_busin_status` VARCHAR(2) NULL DEFAULT NULL COMMENT '状态：1可用，0草稿',
	`c_regdate` VARCHAR(8) NULL DEFAULT NULL COMMENT '添加日期',
	`t_regtime` VARCHAR(8) NULL DEFAULT NULL COMMENT '添加时间',
	`c_operorg` VARCHAR(120) NULL DEFAULT NULL COMMENT '所属机构',
	PRIMARY KEY (`id`)
)
COMMENT='方案基金组合表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_t_scheme_fund_combin()$$
drop PROCEDURE if EXISTS create_t_scheme_fund_combin$$


drop PROCEDURE if EXISTS create_t_sale_sms_dayfund$$
create procedure create_t_sale_sms_dayfund() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_sms_dayfund')
	THEN
CREATE TABLE `t_sale_sms_dayfund` (
	`id` BIGINT(18) NOT NULL DEFAULT '0' COMMENT '编号',
	`c_product_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '产品名称',
	`c_requestNo` VARCHAR(50) NULL DEFAULT NULL COMMENT '申请单号',
	`c_busin_type` VARCHAR(5) NULL DEFAULT NULL COMMENT '业务类型(01开户，22申购，24赎回,801活期宝充值，802活期宝赎回)',
	`c_context_id` VARCHAR(100) NULL DEFAULT NULL COMMENT '上下文编号',
	`c_mobileNo` VARCHAR(20) NULL DEFAULT NULL COMMENT '手机号',
	`c_busin_status` VARCHAR(2) NULL DEFAULT NULL COMMENT '业务状态(1成功，0未发送，2已过期，3失败)',
	`d_createTime` VARCHAR(20) NULL DEFAULT NULL COMMENT '添加时间',
	`l_custNo` BIGINT(18) NULL DEFAULT NULL COMMENT '企业客户号',
	`c_custname` VARCHAR(200) NULL DEFAULT NULL COMMENT '企业名称',
	`c_operorg` VARCHAR(200) NULL DEFAULT NULL COMMENT '操作机构',
	`l_operid` BIGINT(18) NULL DEFAULT NULL COMMENT '操作编号',
	`c_opername` VARCHAR(100) NULL DEFAULT NULL COMMENT '操作员名称',
	`c_trade_class` VARCHAR(100) NULL DEFAULT NULL COMMENT '转换类名',
	`c_sale_tradeacco` VARCHAR(100) NULL DEFAULT NULL COMMENT '销售商交易账户',
	PRIMARY KEY (`id`)
)
COMMENT='天天基金短信验证表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_t_sale_sms_dayfund()$$
drop PROCEDURE if EXISTS create_t_sale_sms_dayfund$$


drop PROCEDURE if EXISTS create_t_sale_sms_dayfund_record$$
create procedure create_t_sale_sms_dayfund_record() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sale_sms_dayfund_record')
	THEN
CREATE TABLE `t_sale_sms_dayfund_record` (
	`id` BIGINT(18) NOT NULL DEFAULT '0' COMMENT '编号',
	`l_dayfund_id` BIGINT(18) NULL DEFAULT NULL COMMENT '验证主表外键',
	`c_busin_status` VARCHAR(2) NULL DEFAULT NULL COMMENT '验证状态',
	`c_identify_code` VARCHAR(10) NULL DEFAULT NULL COMMENT '验证码',
	`d_createTime` VARCHAR(20) NULL DEFAULT NULL COMMENT '发送的时间',
	`c_operorg` VARCHAR(200) NULL DEFAULT NULL COMMENT '操作机构',
	`l_operid` BIGINT(18) NULL DEFAULT NULL COMMENT '操作编号',
	`c_opername` VARCHAR(100) NULL DEFAULT NULL COMMENT '操作员名称',
	PRIMARY KEY (`id`)
)
COMMENT='天天基金短信验证记录表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_t_sale_sms_dayfund_record()$$
drop PROCEDURE if EXISTS create_t_sale_sms_dayfund_record$$




