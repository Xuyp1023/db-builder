##-- 后置DDL语句
##
##-- V1.0
##


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
	`C_RISKLEVEL` VARCHAR(2) NULL DEFAULT NULL COMMENT '风险等级',
	`D_AUTOREDEM_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '到期自动赎回日期',
	`F_MAXBALANCE` DECIMAL(16,2) NULL DEFAULT NULL COMMENT '最大投资金额',
	`F_MINBALANCE` DECIMAL(16,2) NULL DEFAULT NULL COMMENT '最小投资金额',
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
	`F_MINBALANCE` DECIMAL(16,2) NULL DEFAULT NULL COMMENT '最小投资占比',
	`F_MIN_TENURE` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '最小投资占比',
	PRIMARY KEY (`id`)
)
COMMENT='方案基金组合表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_t_scheme_fund_combin()$$
drop PROCEDURE if EXISTS create_t_scheme_fund_combin$$


##--创建方案自动赎回任务表 2017/10/16
drop PROCEDURE if EXISTS create_t_scheme_autoredem_task$$
create procedure create_t_scheme_autoredem_task() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scheme_autoredem_task')
	THEN
CREATE TABLE `t_scheme_autoredem_task` (
	`id` BIGINT(18) NOT NULL,
	`L_SCHEME_ID` BIGINT(18) NULL DEFAULT NULL COMMENT '方案编号',
	`D_REDEM_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '赎回日期',
	`c_busin_status` VARCHAR(2) NULL DEFAULT NULL COMMENT '状态：1可用，0禁用',
	`d_regdate` VARCHAR(8) NULL DEFAULT NULL COMMENT '注册日期',
	`t_regtime` VARCHAR(8) NULL DEFAULT NULL COMMENT '注册时间',
	PRIMARY KEY (`id`)
)
COMMENT='方案自动赎回任务表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_t_scheme_autoredem_task()$$
drop PROCEDURE if EXISTS create_t_scheme_autoredem_task$$





##--创建方案申请主表 2017/10/16
drop PROCEDURE if EXISTS create_t_create_t_scheme_request$$
create procedure create_t_create_t_scheme_request() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scheme_request')
	THEN
CREATE TABLE `t_scheme_request` (
	`C_SCHEME_REQUESTNO` VARCHAR(50) NOT NULL COMMENT '方案申请编号',
	`L_SCHEME_ID` BIGINT(18) NOT NULL COMMENT '方案编号',
	`L_CUSTNO` BIGINT(20) NOT NULL COMMENT '客户编号',
	`C_TRADEACCO` VARCHAR(100) NULL DEFAULT NULL COMMENT '交易账户',
	`F_BALANCE` DECIMAL(16,2) NULL DEFAULT '0.00' COMMENT '申请金额',
	`D_OPERDATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '下单日期',
	`T_OPERTIME` VARCHAR(8) NULL DEFAULT NULL COMMENT '下单时间',
	`C_BUSIN_STATUS` CHAR(2) NOT NULL COMMENT '申请状态；0未处理，1下单成功，2下单失败，3撤单作废，4等待签约，5签约失败，6已报，7上报成功，8确认失败，9确认成功',
	`C_LAST_STATUS` CHAR(2) NOT NULL COMMENT '上次申请状态',
	`C_OPERNO` VARCHAR(8) NULL DEFAULT NULL COMMENT '操作员编码',
	`C_CHECKNO` VARCHAR(8) NULL DEFAULT NULL COMMENT '复核人编码',
	`C_CONTACT` VARCHAR(30) NULL DEFAULT NULL COMMENT '经办人姓名',
	`C_BUSINFLAG` VARCHAR(3) NULL DEFAULT NULL COMMENT '业务代码',
	`C_ERRCODE` VARCHAR(4) NULL DEFAULT NULL COMMENT '错误代码',
	`C_LARGEREDEEM_FLAG` CHAR(1) NULL DEFAULT NULL COMMENT '巨额赎回处理标志 0-取消，1-顺延',
	`C_CUSTTYPE` CHAR(1) NULL DEFAULT NULL COMMENT '客户类型；0机构，1个人',
	`C_SPECIFICATION` VARCHAR(60) NULL DEFAULT NULL COMMENT '摘要/说明',
	`C_ADUIT` CHAR(1) NULL DEFAULT NULL COMMENT '0未审批，1审核中，2终审',
	`C_BUSINCLASS` VARCHAR(2) NULL DEFAULT NULL COMMENT '业务类型 01 账户类业务 02 交易类业务 03 账户撤单 04 交易撤单',
	`C_OPERORG` VARCHAR(50) NULL DEFAULT NULL COMMENT '机构',
	`D_REDEEM_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '预约赎回日期',
	PRIMARY KEY (`C_SCHEME_REQUESTNO`),
	INDEX `IDX_SCHEME_REQUEST` (`L_SCHEME_ID`)
)
COMMENT='方案申请主表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_t_create_t_scheme_request()$$
drop PROCEDURE if EXISTS create_t_create_t_scheme_request$$



##--创建方案申请流水表 2017/10/16
drop PROCEDURE if EXISTS create_t_scheme_request_detail$$
create procedure create_t_scheme_request_detail() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scheme_request_detail')
	THEN
CREATE TABLE `t_scheme_request_detail` (
	`C_SCHEME_REQUESTNO` VARCHAR(50) NOT NULL COMMENT '方案申请单号',
	`L_CUSTNO` BIGINT(20) NOT NULL COMMENT '客户编号',
	`C_TRADEACCO` VARCHAR(100) NULL DEFAULT NULL COMMENT '交易账户',
	`C_TANO` VARCHAR(2) NULL DEFAULT NULL COMMENT 'TA代码',
	`C_FUNDACCO` VARCHAR(50) NULL DEFAULT NULL COMMENT '基金账户',
	`C_AGENCYNO` VARCHAR(9) NOT NULL COMMENT '销售人代码',
	`C_NETNO` VARCHAR(9) NOT NULL COMMENT '网点编码',
	`C_ERRDETAIL` VARCHAR(128) NULL DEFAULT NULL COMMENT '交易申请结果描述',
	`C_CAUSE` VARCHAR(128) NULL DEFAULT NULL COMMENT '交易处理返回代码系统处理后返回错误信息',
	`C_CSERIALNO` VARCHAR(32) NULL DEFAULT NULL COMMENT '确认单号',
	`D_CDATE` CHAR(8) NULL DEFAULT NULL COMMENT 'TA确认日期',
	`C_FUNDCODE` VARCHAR(6) NOT NULL COMMENT '基金代码',
	`C_SHARETYPE` CHAR(1) NULL DEFAULT NULL COMMENT '份额类别',
	`C_OLD_CSERIALNO` VARCHAR(32) NULL DEFAULT NULL COMMENT '原TA确认流水号',
	`C_OLD_REQUESTNO` VARCHAR(32) NULL DEFAULT NULL COMMENT '原申请单编号',
	`D_OLD_DATE` CHAR(8) NULL DEFAULT NULL COMMENT '原申请日期',
	`F_OLD_DISCOUNT` DECIMAL(5,4) NULL DEFAULT NULL COMMENT '原销售佣金折扣率  对投资人的总佣金折扣率，取值为投资人实付佣金/投资人应付佣金',
	`D_OLD_CDATE` CHAR(8) NULL DEFAULT NULL COMMENT 'TA的原确认日期',
	`D_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '交易申请日期',
	`T_TIME` VARCHAR(8) NULL DEFAULT NULL COMMENT '申请时间',
	`F_SHARE` DECIMAL(16,2) NULL DEFAULT '0.00' COMMENT '申请份额',
	`F_BALANCE` DECIMAL(16,2) NULL DEFAULT '0.00' COMMENT '申请金额',
	`F_CONFIRMBALANCE` DECIMAL(16,2) NULL DEFAULT '0.00' COMMENT '确认金额',
	`F_CONFIRMSHARES` DECIMAL(16,2) NULL DEFAULT '0.00' COMMENT '确认份额',
	`C_CURRENCY` CHAR(3) NULL DEFAULT NULL COMMENT '结算币种',
	`F_DISCOUNT` DECIMAL(5,4) NULL DEFAULT NULL COMMENT '销售佣金折扣率  对投资人的总佣金折扣率，取值为投资人实付佣金/投资人应付佣金',
	`C_TAGET_FUNDCODE` VARCHAR(6) NULL DEFAULT NULL COMMENT '对方基金代码',
	`C_TAGET_SHARETYPE` CHAR(1) NULL DEFAULT NULL COMMENT '对方份额类别',
	`C_TAGET_TRADEACCO` VARCHAR(17) NULL DEFAULT NULL COMMENT '对方交易账户',
	`C_TAGET_FUNDACCO` VARCHAR(12) NULL DEFAULT NULL COMMENT '对方基金账号',
	`C_TAGET_AGENCYNO` CHAR(3) NULL DEFAULT NULL COMMENT '对方销售商',
	`C_TAGET_NETNO` VARCHAR(10) NULL DEFAULT NULL COMMENT '对方网点   转销售商、非交易过户时使用',
	`C_BONUSTYPE` CHAR(1) NULL DEFAULT NULL COMMENT '分红方式',
	`C_FROZENCAUSE` CHAR(1) NULL DEFAULT NULL COMMENT '冻结原因',
	`D_FROZENENDLINE` VARCHAR(8) NULL DEFAULT NULL COMMENT '冻结截止日期',
	`D_OPERDATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '下单日期',
	`T_OPERTIME` VARCHAR(8) NULL DEFAULT NULL COMMENT '下单时间',
	`C_CANCELFLAG` CHAR(1) NULL DEFAULT NULL COMMENT '撤单标志',
	`C_PRESTATUS` CHAR(1) NOT NULL COMMENT '预约单状态',
	`C_PAYSTATUS` CHAR(2) NULL DEFAULT NULL COMMENT '支付状态；00未支付，01委托正在处理，02支付成功，03支付失败，07托收成功',
	`C_STATUS` CHAR(2) NOT NULL COMMENT '申请状态；0未处理，1下单成功，2下单失败，3撤单作废，4等待签约，5签约失败，6正在处理，7系统作废，8确认失败，9确认成功',
	`C_LAST_STATUS` CHAR(2) NOT NULL COMMENT '上次申请状态',
	`C_ORDER_FLAG` CHAR(1) NOT NULL COMMENT '下单方式(0 客户下单 1 系统自动下单)',
	`C_BROKER` VARCHAR(8) NULL DEFAULT NULL COMMENT '经纪人',
	`C_OPERNO` VARCHAR(8) NULL DEFAULT NULL COMMENT '操作员编码',
	`C_CHECKNO` VARCHAR(8) NULL DEFAULT NULL COMMENT '复核人编码',
	`C_CONTACT` VARCHAR(30) NULL DEFAULT NULL COMMENT '经办人姓名',
	`C_PROMOTION` VARCHAR(32) NULL DEFAULT NULL COMMENT '促销活动代码',
	`C_IPADDR` VARCHAR(32) NULL DEFAULT NULL COMMENT '网络地址',
	`C_PAYCENTER` VARCHAR(9) NULL DEFAULT NULL COMMENT '分中心',
	`C_CUSTMANAGER` VARCHAR(16) NULL DEFAULT NULL COMMENT '客户经理代码',
	`C_REFERRAL` VARCHAR(32) NULL DEFAULT NULL COMMENT '推荐人姓名',
	`C_REFERRALMOBILE` VARCHAR(16) NULL DEFAULT NULL COMMENT '推荐人手机号码',
	`L_CONTACTOR` BIGINT(20) NULL DEFAULT NULL COMMENT '经办人编号',
	`C_RISKMATCHING` CHAR(1) NULL DEFAULT NULL COMMENT '风险等级是否匹配',
	`C_EXCEPTFLAG` CHAR(1) NULL DEFAULT NULL COMMENT '异常交易标志',
	`C_BUSINCLASS` CHAR(1) NULL DEFAULT NULL COMMENT '业务种类，0普通业务，1预约业务，2赎回转认购，3钱柜充值提现，6赎回转申购',
	`C_PAYTYPE` CHAR(1) NULL DEFAULT NULL COMMENT '支付方式；0无，1托收方式，2银行卡转账，3银行卡汇款，4货币转换方式',
	`C_ACCEPT` CHAR(1) NULL DEFAULT NULL COMMENT '受理方式 ；0柜台，1电话，2网上交易，3传真，4手机，5其它',
	`C_BUSINFLAG` VARCHAR(3) NULL DEFAULT NULL COMMENT '业务代码',
	`C_DETAIL` CHAR(1) NULL DEFAULT NULL COMMENT '明细字段，默认0；1表示明细；只有在组合交易中，该字段才能为1',
	`C_ERRCODE` VARCHAR(4) NULL DEFAULT NULL COMMENT '错误代码',
	`C_CHECKER` VARCHAR(20) NULL DEFAULT NULL COMMENT '机构客户的复核人员名字',
	`L_MONEYACCOUNT` BIGINT(20) NULL DEFAULT NULL COMMENT '资金账户',
	`C_LARGEREDEEM_FLAG` CHAR(1) NULL DEFAULT NULL COMMENT '巨额赎回处理标志 0-取消，1-顺延',
	`C_CITYNO` VARCHAR(6) NULL DEFAULT NULL COMMENT '城市地区代码',
	`C_CUSTTYPE` CHAR(1) NULL DEFAULT NULL COMMENT '客户类型；0机构，1个人',
	`C_TAGET_CITYNO` VARCHAR(4) NULL DEFAULT NULL COMMENT '对方城市地区代码',
	`C_SPECIFICATION` VARCHAR(60) NULL DEFAULT NULL COMMENT '摘要/说明',
	`D_HOPEDATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '指定交易日期；只有在指定日期才处理业务；在日初清算时处理（例如预约赎回的份额冻结），为空不处理',
	`D_REDEEM_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '预约赎回日期',
	`C_CHARGETYPE` VARCHAR(1) NULL DEFAULT '0' COMMENT '收费类型；0-折扣率方式 1-指定费率 2-指定费用。对于未指定费率（费用）的那些费用，仍可使用折扣率方式。',
	`C_SALE_CUSTNO` VARCHAR(24) NULL DEFAULT NULL COMMENT '基金公司客户编号',
	`C_SALE_REQUESTNO` VARCHAR(50) NULL DEFAULT NULL COMMENT '基金公司申请单号',
	`C_OPERORG` VARCHAR(240) NULL DEFAULT NULL COMMENT '操作机构；用于远程接口调用',
	`C_SOURCE_KEY` VARCHAR(64) NULL DEFAULT NULL COMMENT '关联协议号',
	`C_OPERWAY` CHAR(1) NULL DEFAULT NULL COMMENT '操作方式；0-柜台；2-网上交易',
	`C_SALE_PAYCENTER` VARCHAR(9) NULL DEFAULT NULL COMMENT '基金公司分中心',
	`C_SALE_NETNO` VARCHAR(9) NULL DEFAULT NULL COMMENT '基金公司网点编码',
	`C_SALE_TRADEACCO` VARCHAR(50) NULL DEFAULT NULL COMMENT '基金交易账号',
	`C_DEAL` CHAR(1) NULL DEFAULT '0' COMMENT '数据报送标志，0未处理，1已处理；对于盘后交易，数据都挂在平台上，下一交易日的10点钟将在途的交易发送到基金公司',
	`C_ADUIT` CHAR(1) NULL DEFAULT '0' COMMENT '0未审批，1审核中，2终审',
	`C_SALE_MONEYACCOUNT` VARCHAR(17) NULL DEFAULT NULL COMMENT '基金公司资金账户',
	PRIMARY KEY (`C_SCHEME_REQUESTNO`, `C_AGENCYNO`, `C_FUNDCODE`),
	INDEX `IDX_SALE_REQUEST` (`L_CUSTNO`),
	INDEX `IDX_SALE_REQUEST1` (`D_DATE`),
	INDEX `IDX_SALE_REQUEST2` (`C_TRADEACCO`)
)
COMMENT='方案申请流水表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
	END IF;
END$$
call create_t_scheme_request_detail()$$
drop PROCEDURE if EXISTS create_t_scheme_request_detail$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_com_money_scheme' AND COLUMN_NAME='C_RISKLEVEL')
THEN   
   ALTER TABLE `t_com_money_scheme` ADD COLUMN `C_RISKLEVEL` VARCHAR(2)  COMMENT '风险等级';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_com_money_scheme' AND COLUMN_NAME='D_AUTOREDEM_DATE')
THEN   
   ALTER TABLE `t_com_money_scheme` ADD COLUMN `D_AUTOREDEM_DATE` VARCHAR(8)  COMMENT '到期自动赎回日期';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_com_money_scheme' AND COLUMN_NAME='F_MAXBALANCE')
THEN   
   ALTER TABLE `t_com_money_scheme` ADD COLUMN `F_MAXBALANCE` DECIMAL(16,2)  COMMENT '最大投资金额';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_com_money_scheme' AND COLUMN_NAME='F_MINBALANCE')
THEN   
   ALTER TABLE `t_com_money_scheme` ADD COLUMN `F_MINBALANCE` DECIMAL(16,2)  COMMENT '最小投资金额';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scheme_fund_combin' AND COLUMN_NAME='F_MINBALANCE')
THEN   
   ALTER TABLE `t_scheme_fund_combin` ADD COLUMN `F_MINBALANCE` DECIMAL(16,2)  COMMENT '最小投资金额';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$

drop PROCEDURE if EXISTS change_table_col$$
create procedure change_table_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scheme_fund_combin' AND COLUMN_NAME='F_MIN_TENURE')
THEN   
   ALTER TABLE `t_scheme_fund_combin` ADD COLUMN `F_MIN_TENURE` DECIMAL(16,2)  COMMENT '最小投资占比';
END IF;
END$$
call change_table_col()$$
drop PROCEDURE if EXISTS change_table_col$$


##-- 份额信息中添加方案ID来查询方案组合收益信息   2017/10/23 L_SCHEMEID(方案投资编号)
drop procedure if exists create_column_L_SCHEMEID$$
create procedure create_column_L_SCHEMEID()
BEGIN
    IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS where TABLE_SCHEMA in (select database()) AND table_name='T_SALE_SHARES' and COLUMN_NAME='L_SCHEMEID')
	THEN
		ALTER TABLE `T_SALE_SHARES` ADD COLUMN `L_SCHEMEID` BIGINT(18) NULL COMMENT '方案编号';
	END IF;
END$$
call create_column_L_SCHEMEID()$$
drop procedure if EXISTS create_column_L_SCHEMEID$$