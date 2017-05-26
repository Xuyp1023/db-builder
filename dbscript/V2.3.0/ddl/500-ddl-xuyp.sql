##-- DDL语句
##
##-- V1.0
##
##-- 表结构非空修改 提交日期2016/11/18

##-- task 199
##-- 创建佣金文件表
drop PROCEDURE if EXISTS create_table_cps_file$$
create procedure create_table_cps_file() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_file')
	THEN
	CREATE TABLE `t_cps_file` (
		  `ID` bigint(20) NOT NULL COMMENT '编号',
		  `C_REFNO` varchar(20) DEFAULT NULL COMMENT '凭证编号',
		  `N_BATCHNO` decimal(18,0) DEFAULT NULL COMMENT '文件上传批次号',
		  `C_DIGEST` varchar(255) DEFAULT NULL COMMENT '文件摘要',
		  `C_SIGNATURE` varchar(2000) DEFAULT NULL COMMENT '文件签名',
		  `L_FILE_ID` bigint(18) DEFAULT NULL COMMENT '文件上传ID',
		  `C_FILE_NAME` varchar(60) DEFAULT NULL COMMENT '文件上传名称',
		  `D_IMPORT_DATE` varchar(8) DEFAULT NULL COMMENT '文件导入日期',
		  `T_IMPORT_TIME` varchar(8) DEFAULT NULL COMMENT '文件导入时间',
		  `L_CUSTNO` bigint(18) DEFAULT NULL COMMENT '企业ID',
		  `C_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '当前企业名称',
		  `C_OPERORG` varchar(200) DEFAULT NULL COMMENT '当前企业操作机构',
		  `C_PAY_STATUS` char(1) DEFAULT NULL COMMENT '付款状态 0 未处理 2 支付成功  1 支付失败',
		  `C_BUSIN_STATUS` char(1) DEFAULT NULL COMMENT '业务状态 0 未处理 1 已处理 2已审核 3删除',
		  `C_RESOLVE_STATUS` char(1) DEFAULT NULL COMMENT '文件处理状态 1：解析成功  0 解析失败',
		  `C_SHOW_MESSAGE` varchar(2500) DEFAULT NULL COMMENT '文件解析结果提示信息',
		  `F_TOTAL_BLANCE` decimal(16,0) DEFAULT NULL COMMENT '当前文件总金额',
		  `L_TOTAL_AMOUNT` bigint(10) DEFAULT NULL COMMENT '当前文件总记录',
		  `C_INFO_TYPE` varchar(5) DEFAULT NULL COMMENT '解析的文件类型1订单 2票据  3应收账款 4发票 5 合同 6佣金',
		  `L_REG_OPERID` bigint(18) DEFAULT '0',
		  `C_REG_OPERNAME` varchar(40) DEFAULT ' ',
		  `D_REG_DATE` varchar(8) DEFAULT ' ',
		  `T_REG_TIME` varchar(8) DEFAULT ' ',
		  `L_MODI_OPERID` bigint(18) DEFAULT '0',
		  `C_MODI_OPERNAME` varchar(40) DEFAULT ' ',
		  `D_MODI_DATE` varchar(8) DEFAULT ' ',
		  `T_MODI_TIME` varchar(8) DEFAULT ' ',
		  `N_VERSION` bigint(20) DEFAULT '0',
		  `L_DOWNFILE_ID` bigint(18) DEFAULT NULL COMMENT '下载文件id',
		  PRIMARY KEY (`ID`),
		  KEY `inx_cps_file_tab_refNo` (`C_REFNO`) USING HASH,
		  KEY `inx_cps_file_tab_importDate` (`D_IMPORT_DATE`) USING BTREE,
		  KEY `inx_cps_file_tab_custNo` (`L_CUSTNO`) USING HASH
		) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='佣金文件';

	END IF;
END$$
call create_table_cps_file()$$
drop PROCEDURE if EXISTS create_table_cps_file$$


##-- 创建佣金记录表
drop PROCEDURE if EXISTS create_table_cps_record$$
create procedure create_table_cps_record() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_record')
	THEN
	CREATE TABLE `t_cps_record` (
			  `ID` bigint(20) NOT NULL COMMENT '编号',
			  `L_CPS_FILE_ID` bigint(20) DEFAULT NULL COMMENT '佣金文件ID',
			  `C_REFNO` varchar(18) DEFAULT NULL COMMENT '凭证编号',
			  `D_IMPORT_DATE` char(8) DEFAULT NULL COMMENT '导入日期',
			  `T_IMPORT_TIME` char(6) DEFAULT NULL COMMENT '导入时间',
			  `C_AREA` varchar(255) DEFAULT NULL COMMENT '片区',
			  `C_CUSTOMER_NAME` varchar(255) DEFAULT NULL COMMENT '客户名称',
			  `N_AMOUNT` int(10) DEFAULT NULL COMMENT '数量',
			  `F_UNIT` decimal(16,2) DEFAULT NULL COMMENT '单价',
			  `F_BALANCE` decimal(16,2) DEFAULT NULL COMMENT '金额',
			  `C_BANK_ACCOUNT` varchar(100) DEFAULT NULL COMMENT '银行账户',
			  `C_BANK_ACCOUNT_NAME` varchar(120) DEFAULT NULL COMMENT '银行账户名',
			  `C_BANK` varchar(120) DEFAULT NULL COMMENT '银行',
			  `C_BANK_NAME` varchar(255) DEFAULT NULL COMMENT '银行全称',
			  `C_BANK_ADDRESS` varchar(255) DEFAULT NULL COMMENT '银行地址',
			  `C_CONTACTS` varchar(60) DEFAULT NULL COMMENT '联系人',
			  `C_CONTACTS_MOBILENO` varchar(20) DEFAULT NULL COMMENT '联系人手机号码',
			  `L_CUSTNO` bigint(20) DEFAULT NULL COMMENT '客户ID',
			  `C_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '客户名称',
			  `C_OPERORG` varchar(120) DEFAULT NULL COMMENT '操作机构',
			  `C_PAY_STATUS` char(1) DEFAULT NULL COMMENT '支付状态  0 未处理  2 支付成功  1支付失败',
			  `C_BUSIN_STATUS` char(1) DEFAULT NULL COMMENT '业务状态 0 未处理 1 已审核(最终可供 拜特支付状态)  2已支付 3删除',
			  `L_REG_OPERID` bigint(18) DEFAULT '0',
			  `C_REG_OPERNAME` varchar(40) DEFAULT ' ',
			  `D_REG_DATE` varchar(8) DEFAULT ' ',
			  `T_REG_TIME` varchar(8) DEFAULT ' ',
			  `L_MODI_OPERID` bigint(18) DEFAULT '0',
			  `C_MODI_OPERNAME` varchar(40) DEFAULT ' ',
			  `D_MODI_DATE` varchar(8) DEFAULT ' ',
			  `T_MODI_TIME` varchar(8) DEFAULT ' ',
			  `N_VERSION` bigint(20) DEFAULT '0',
			  PRIMARY KEY (`ID`),
			  KEY `inx_cps_record_tab_refNo` (`C_REFNO`) USING HASH,
			  KEY `inx_cps_record_tab_cpsFileId` (`L_CPS_FILE_ID`) USING HASH,
			  KEY `inx_cps_record_tab_importDate` (`D_IMPORT_DATE`) USING HASH,
			  KEY `inx_cps_record_tab_custNo` (`L_CUSTNO`) USING HASH
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	END IF;
END$$
call create_table_cps_record()$$
drop PROCEDURE if EXISTS create_table_cps_record$$


##-- 创建佣金记录下载表

drop PROCEDURE if EXISTS create_table_cps_file_down$$
create procedure create_table_cps_file_down() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_file_down')
	THEN
	CREATE TABLE `t_cps_file_down` (
		  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
		  `L_CUSTNO` bigint(20) DEFAULT NULL COMMENT '拥有的企业id',
		  `C_OPERORG` varchar(255) DEFAULT NULL,
		  `C_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '拥有的企业名称',
		  `D_IMPORT_DATE` varchar(8) DEFAULT NULL COMMENT '导入日期',
		  `T_IMPORT_TIME` varchar(6) DEFAULT NULL COMMENT '导入时间',
		  `N_AMOUNT` int(11) DEFAULT NULL COMMENT '总的数量',
		  `F_BALANCE` decimal(18,2) DEFAULT NULL COMMENT '总金额',
		  `D_REG_DATE` varchar(8) DEFAULT NULL COMMENT '生成日期',
		  `T_REG_TIME` varchar(6) DEFAULT NULL COMMENT '生成时间',
		  `L_FILE_ID` bigint(20) DEFAULT NULL,
		  `N_BATCHNO` bigint(20) DEFAULT NULL,
		  PRIMARY KEY (`ID`),
		  KEY `inx_file_down_tab_custNo` (`L_CUSTNO`) USING HASH,
		  KEY `inx_file_down_tab_importData` (`D_IMPORT_DATE`) USING BTREE
		) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

	END IF;
END$$
call create_table_cps_file_down()$$
drop PROCEDURE if EXISTS create_table_cps_file_down$$

##-- 创建投递账单投递表
drop PROCEDURE if EXISTS create_table_cps_delivery$$
create procedure create_table_cps_delivery() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_delivery')
	THEN
	
CREATE TABLE `t_cps_delivery` (
		  `ID` int(20) NOT NULL COMMENT '编号',
		  `C_REFNO` varchar(20) DEFAULT NULL COMMENT '凭证编号',
		  `F_TOTAL_BLANCE` decimal(16,2) DEFAULT NULL COMMENT '总金额',
		  `N_TOTAL_AMOUNT` bigint(20) DEFAULT NULL COMMENT '总笔数',
		  `D_POST_DATE` varchar(8) DEFAULT NULL COMMENT '投递日期',
		  `T_POST_TIME` varchar(8) DEFAULT NULL COMMENT '投递时间',
		  `L_POST_CUSTNO` bigint(18) DEFAULT NULL COMMENT '接收公司',
		  `C_POST_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '接收公司名称',
		  `C_POST_OPERORG` varchar(120) DEFAULT NULL COMMENT '接收公司机构',
		  `L_CUSTNO` bigint(18) DEFAULT NULL COMMENT '操作公司',
		  `C_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '操作公司名称',
		  `C_OPERORG` varchar(120) DEFAULT NULL COMMENT '操作公司机构',
		  `C_BUSIN_STATUS` char(1) DEFAULT NULL COMMENT '业务状态  0未处理  1已投递 2确认',
		  `D_CONFIRM_DATE` char(8) DEFAULT NULL COMMENT '确认日期',
		  `T_CONFIRM_TIME` char(6) DEFAULT NULL COMMENT '确认时间',
		  `L_CONFIRM_OPERID` bigint(20) DEFAULT NULL COMMENT '确认操作员',
		  `L_CONFIRM_OPERNAME` varchar(40) DEFAULT NULL COMMENT '确认操作员名称',
		  `L_REG_OPERID` bigint(18) DEFAULT '0',
		  `C_REG_OPERNAME` varchar(40) DEFAULT ' ',
		  `D_REG_DATE` varchar(8) DEFAULT ' ',
		  `T_REG_TIME` varchar(8) DEFAULT ' ',
		  `N_VERSION` bigint(20) DEFAULT '0',
		  `C_DESCRIPTION` varchar(500) DEFAULT NULL COMMENT '提交描述',
		  PRIMARY KEY (`ID`),
		  KEY `inx_delivery_record_tab_refNo` (`C_REFNO`) USING HASH,
		  KEY `inx_delivery_record_tab_postCustNo` (`L_POST_CUSTNO`) USING BTREE,
		  KEY `inx_delivery_record_tab_businstatus` (`C_BUSIN_STATUS`) USING HASH,
		  KEY `inx_delivery_record_tab_custNo` (`L_CUSTNO`) USING HASH,
		  KEY `inx_delivery_record_tab_postDate` (`D_POST_DATE`) USING HASH
		) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投递记录';

	END IF;
END$$
call create_table_cps_delivery()$$
drop PROCEDURE if EXISTS create_table_cps_delivery$$

##-- 创建投递对账单详情表

drop PROCEDURE if EXISTS create_table_cps_delivery_record$$
create procedure create_table_cps_delivery_record() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_delivery_record')
	THEN
	
		CREATE TABLE `t_cps_delivery_record` (
		  `ID` bigint(20) NOT NULL COMMENT '编号',
		  `L_DELIVERY_ID` bigint(20) DEFAULT NULL COMMENT '投递记录主表编号',
		  `C_DELIVERY_REFNO` varchar(20) DEFAULT NULL COMMENT '投递记录主表凭证号',
		  `L_MONTHLY_STATEMENT_ID` bigint(20) DEFAULT NULL COMMENT '月账单编号',
		  `C_MONTHLY_STATEMENT_REFNO` varchar(20) DEFAULT NULL COMMENT '月账单凭证号',
		  `D_PAY_BEGIN_DATE` char(8) DEFAULT NULL COMMENT '开始时间',
		  `D_PAY_END_DATE` char(8) DEFAULT NULL COMMENT '结束时间',
		  `F_TOTAL_BLANCE` decimal(16,2) DEFAULT NULL COMMENT '总金额',
		  `N_TOTAL_AMOUNT` bigint(20) DEFAULT NULL COMMENT '总的佣金笔数',
		  `F_PAY_TOTAL_SUCCESS_BALANCE` decimal(16,2) DEFAULT NULL COMMENT '总的付成功的金额',
		  `N_PAY_TOTAL_SUCCESS_AMOUNT` bigint(20) DEFAULT NULL COMMENT '总的付成功的项',
		  `F_PAY_TOTAL_FAILURE_BALANCE` decimal(16,2) DEFAULT NULL COMMENT '总的付失败的金额',
		  `N_PAY_TOTAL_FAILURE_AMOUNT` bigint(20) DEFAULT NULL COMMENT '总的付失败的项数',
		  `L_OWN_CUSTNO` bigint(18) DEFAULT NULL COMMENT '拥有公司ID',
		  `C_OWN_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '拥有公司名称',
		  `C_OWN_OPERORG` varchar(120) DEFAULT NULL COMMENT '拥有公司操作结构',
		  `C_OPERORG` varchar(200) DEFAULT ' ',
		  `L_REG_OPERID` bigint(18) DEFAULT '0',
		  `C_REG_OPERNAME` varchar(40) DEFAULT ' ',
		  `D_REG_DATE` varchar(8) DEFAULT ' ',
		  `T_REG_TIME` varchar(8) DEFAULT ' ',
		  `N_VERSION` bigint(20) DEFAULT '0',
		  `C_BUSIN_STATUS` varchar(2) DEFAULT NULL COMMENT '0 可用   1 不可用，已删除状态',
		  `C_EXPRESS_STATUS` varchar(2) DEFAULT NULL COMMENT '传递状态  0 未投递  1 已投递   2已确认',
		  `D_BILL_MONTH` varchar(6) DEFAULT NULL COMMENT '对账月份yyyyMM',
		  `L_FILE_ID` bigint(20) DEFAULT NULL,
		  `F_INTEREST_BALANCE` decimal(16,2) DEFAULT NULL,
		  PRIMARY KEY (`ID`),
		  KEY `inx_delivery_statement_tab_monthlyId` (`L_MONTHLY_STATEMENT_ID`) USING HASH,
		  KEY `inx_delivery_statement_tab_monthlyRefNo` (`C_MONTHLY_STATEMENT_REFNO`) USING HASH,
		  KEY `inx_delivery_statement_tab_recordId` (`L_DELIVERY_ID`) USING HASH,
		  KEY `inx_delivery_statement_tab_deliveryRefNo` (`C_DELIVERY_REFNO`) USING HASH,
		  KEY `inx_delivery_statement_tab_owncustno` (`L_OWN_CUSTNO`) USING HASH,
		  KEY `inx_delivery_statement_tab_billMonth` (`D_BILL_MONTH`) USING BTREE,
		  KEY `inx_delivery_statement_tab_businstatus` (`C_BUSIN_STATUS`) USING HASH
		) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='佣金投递详细记录';


	END IF;
END$$
call create_table_cps_delivery_record()$$
drop PROCEDURE if EXISTS create_table_cps_delivery_record$$

drop PROCEDURE if EXISTS create_table_cps_file_ordercloumn$$
create procedure create_table_cps_file_ordercloumn() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_file_ordercloumn')
	THEN
	CREATE TABLE `t_cust_file_ordercloumn` (
	  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
	  `C_INFO_TYPE` varchar(8) DEFAULT NULL COMMENT '解析的文件类型1订单 2票据  3应收账款 4发票 5 合同 6佣金',
	  `C_UP_FLAG` varchar(8) DEFAULT NULL COMMENT '标记上传下载   上传1  下载2',
	  `C_BUSIN_STATUS` varchar(8) DEFAULT NULL COMMENT ' 当前记录是否可用      0 可用  1过期',
	  `L_CLOUMN_ORDER` int(11) DEFAULT NULL COMMENT '文件列排序序号',
	  `C_CLOUMN_PROPERTIES` varchar(255) DEFAULT NULL COMMENT '文件列对应的属性',
	  `C_CLOUMN_NAME` varchar(255) DEFAULT NULL COMMENT '列的中文名称',
	  `L_IS_MUST` int(11) DEFAULT NULL COMMENT '是否必填 1 必须  0 不必须',
	  `D_REG_DATE` varchar(8) DEFAULT NULL COMMENT '创建日期',
	  `T_REG_TIME` varchar(8) DEFAULT NULL COMMENT '创建时间',
	  `C_CLOUMN_TYPE` varchar(5) DEFAULT NULL COMMENT '当前列的类型c字符串   n数字',
	  PRIMARY KEY (`ID`),
	  KEY `inx_order_cloumn_tab_infoType` (`C_INFO_TYPE`) USING HASH
	) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

	END IF;
END$$
call create_table_cps_file_ordercloumn()$$
drop PROCEDURE if EXISTS create_table_cps_file_ordercloumn$$

##--新增结束金额字段 2017/05/16
drop PROCEDURE if EXISTS change_delivery_record_table_col$$
create procedure change_delivery_record_table_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_delivery_record' AND COLUMN_NAME='F_INTEREST_BALANCE')
THEN   
   ALTER TABLE `t_cps_delivery_record` ADD COLUMN `F_INTEREST_BALANCE` DECIMAL(16,2) default 0.00 COMMENT '结算金额';
END IF;
END$$
call change_delivery_record_table_col()$$
drop PROCEDURE if EXISTS change_delivery_record_table_col$$


##-- 版本2.3.0sql

##-- 资产表
drop PROCEDURE if EXISTS create_table_t_scf_asset$$
create procedure create_table_t_scf_asset() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset')
	THEN
	CREATE TABLE `t_scf_asset` (
	  `id` bigint(20) NOT NULL COMMENT '编号',
	  `D_REG_DATE` varchar(8) DEFAULT NULL COMMENT '创建日期',
	  `T_REG_TIME` varchar(8) DEFAULT NULL COMMENT '创建时间',
	  `C_BUSIN_STATU` varchar(255) DEFAULT NULL COMMENT '资产状态 10：可用  20 ：不可用',
	  `C_ASSET_NAME` varchar(120) DEFAULT NULL COMMENT '资产产品名称',
	  `C_ASSET_TYPE` varchar(4) DEFAULT NULL COMMENT '资产产品类型1:订单类资产 2:票据类资产3:应收账款资产',
	  `C_SOURCE_USE_TYPE` varchar(4) DEFAULT NULL COMMENT '资产使用用途 1 询价 2 融资',
	  `L_CUSTNO` bigint(20) DEFAULT NULL COMMENT '债权公司编号(资产所属公司)',
	  `C_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '债权公司名称(资产所有者)',
	  `L_CORE_CUSTNO` bigint(20) DEFAULT NULL COMMENT '债务公司编号(核心企业编号)',
	  `C_CORE_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '债务公司名称(核心企业名称)',
	  `L_PREFIX_ID` bigint(20) DEFAULT NULL COMMENT '上一手资产编号',
	  `L_SUFFIX_ID` bigint(20) DEFAULT NULL COMMENT '下一手资产编号',
	  `C_CUST_TYPE` char(4) DEFAULT NULL COMMENT '资产所属方类型 1：供应商 2 经销商',
	  PRIMARY KEY (`id`),
	  KEY `inx_asset_tab_custNo` (`L_CUSTNO`) USING HASH,
	  KEY `inx_asset_tab_assetType` (`C_ASSET_TYPE`) USING BTREE,
	  KEY `inx_asset_tab_coreCustNo` (`L_CORE_CUSTNO`) USING BTREE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产表，维护公司与订单，票据等关系';


	END IF;
END$$
call create_table_t_scf_asset()$$
drop PROCEDURE if EXISTS create_table_t_scf_asset$$

##-- 资产公司表
drop PROCEDURE if EXISTS create_table_t_scf_asset_company$$
create procedure create_table_t_scf_asset_company() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset_company')
	THEN
	CREATE TABLE `t_scf_asset_company` (
	  `ID` bigint(20) NOT NULL COMMENT '编号',
	  `L_ASSET_ID` bigint(20) DEFAULT NULL COMMENT '资产表编号',
	  `L_CUSTNO` bigint(20) DEFAULT NULL COMMENT '企业编号',
	  `C_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '企业名称',
	  `C_ASSET_ROLE` varchar(4) DEFAULT NULL COMMENT '企业在资产中的角色 1 供应商 2 经销商 3保理公司 4 核心企业',
	  `N_OPERATOR_STATUS` int(11) DEFAULT NULL COMMENT '企业对此资产的操作权限 1 读 2 写 4 删除',
	  `D_REG_DATE` varchar(8) DEFAULT NULL COMMENT '创建日期',
	  `T_REG_TIME` varchar(8) DEFAULT NULL COMMENT '创建时间',
	  `C_BUSIN_STATU` varchar(255) DEFAULT NULL COMMENT '是否关联资产 10 关联  20已经被中止关联',
	  PRIMARY KEY (`ID`),
	  KEY `inx_assetCompany_tab_assetId` (`L_ASSET_ID`) USING BTREE,
	  KEY `inx_assetCompany_tab_custNo` (`L_CUSTNO`) USING BTREE,
	  KEY `inx_assetCompany_tab_businStatus` (`C_BUSIN_STATU`) USING BTREE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用来记录资产关系中的企业的相关权限';


	END IF;
END$$
call create_table_t_scf_asset_company()$$
drop PROCEDURE if EXISTS create_table_t_scf_asset_company$$

##--资产基础数据表

drop PROCEDURE if EXISTS create_table_t_scf_asset_dasedata$$
create procedure create_table_t_scf_asset_dasedata() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset_dasedata')
	THEN
	CREATE TABLE `t_scf_asset_dasedata` (
	  `ID` bigint(20) NOT NULL COMMENT '资产数据编号',
	  `L_ASSET_ID` bigint(20) DEFAULT NULL COMMENT '资产表编号',
	  `D_REG_DATE` varchar(8) DEFAULT NULL COMMENT '创建日期',
	  `T_REG_TIME` varchar(8) DEFAULT NULL COMMENT '创建时间',
	  `C_RELATION_INFO_REFNO` varchar(32) DEFAULT NULL COMMENT '基础数据的唯一标识',
	  `C_RELATION_INFO_VERSION` varchar(255) DEFAULT NULL COMMENT '关联的基础的版本',
	  `C_RELATION_INFO_TYPE` char(2) DEFAULT NULL COMMENT '关联的基础数据的类型1订单2票据3应收账款4发票5贸易合同6运输单单据类型',
	  `C_BUSIN_STATU` varchar(255) DEFAULT NULL COMMENT '是否关联资产 10 关联  20已经被中止关联',
	  PRIMARY KEY (`ID`),
	  KEY `inx_assetDasebata_tab_assetId` (`L_ASSET_ID`) USING BTREE,
	  KEY `inx_assetDasebata_tab_refNoVersion` (`C_RELATION_INFO_REFNO`,`C_RELATION_INFO_VERSION`),
	  KEY `inx_assetDasebata_tab_businStatus` (`C_BUSIN_STATU`) USING BTREE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录询价，融资对应的订单，发票，贸易合同等数据信息';


	END IF;
END$$
call create_table_t_scf_asset_dasedata()$$
drop PROCEDURE if EXISTS create_table_t_scf_asset_dasedata$$

##--票据表

drop PROCEDURE if EXISTS create_table_t_scf_accept_bill_v3$$
create procedure create_table_t_scf_accept_bill_v3() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_accept_bill_v3')
	THEN
	CREATE TABLE `t_scf_accept_bill_v3` (
	  `ID` bigint(18) NOT NULL COMMENT '流水号',
	  `C_BILLNO` varchar(40) NOT NULL COMMENT '票据编号',
	  `C_BILL_TYPE` char(1) NOT NULL COMMENT '票据类型;0：商业票据，1：银行票据',
	  `C_BILL_MODE` char(1) NOT NULL COMMENT '票据流通方式;0：纸票，1：电票',
	  `F_BALANCE` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '确定的金额',
	  `D_INVOICE_DATE` varchar(8) NOT NULL COMMENT '开票日期',
	  `C_INVOICE_CORP` varchar(60) DEFAULT NULL COMMENT '开票单位',
	  `C_DRAWERID` varchar(40) DEFAULT NULL COMMENT '开票人在资金管理系统中的企业编号',
	  `D_END_DATE` varchar(8) NOT NULL COMMENT '到期日期',
	  `D_CASH_DATE` varchar(8) DEFAULT ' ' COMMENT '兑付日期',
	  `C_HOLDER` varchar(60) DEFAULT ' ' COMMENT '持票人',
	  `L_HOLDER_NO` bigint(18) DEFAULT NULL COMMENT '持票人客户号',
	  `C_HOLDER_ACCOUNT` varchar(100) DEFAULT NULL COMMENT '持票人帐号',
	  `C_ACCEPTOR` varchar(60) DEFAULT ' ' COMMENT '承兑人',
	  `C_ACCEPTOR_ACCOUNT` varchar(100) DEFAULT ' ' COMMENT '承兑人银行账户',
	  `C_SUPPLIER` varchar(120) NOT NULL COMMENT '收款人名称',
	  `C_SUPPLIER_BANKACCO` varchar(28) NOT NULL COMMENT '收款方银行账户',
	  `C_SUPPLIER_BANKNAME` varchar(60) DEFAULT NULL COMMENT '收款方银行全称',
	  `C_BUYER` varchar(100) NOT NULL COMMENT '付款人名称',
	  `C_BUYER_REAL` varchar(100) DEFAULT NULL COMMENT '实际付款人名称',
	  `C_BUYER_BANKACCO` varchar(100) DEFAULT NULL COMMENT '付款方银行账户',
	  `C_BUYER_BANKNAME` varchar(120) DEFAULT NULL COMMENT '付款方银行全称',
	  `C_BUSIN_STATUS` char(1) NOT NULL COMMENT '0 未核准 1：核准  2：已使用 3：转让 4废止 5 过期',
	  `C_BILLFROM` char(1) NOT NULL COMMENT '票据来源，0库存票据，1背书转让',
	  `D_REGDATE` varchar(8) NOT NULL COMMENT '登记日期',
	  `D_MODIDATE` varchar(8) DEFAULT ' ' COMMENT '修改日期',
	  `C_BTBILLNO` varchar(40) DEFAULT NULL COMMENT '拜特内部编号',
	  `L_BUYER_NO` bigint(18) DEFAULT '0' COMMENT '买方客户号',
	  `C_BUYER_NAME` varchar(120) DEFAULT NULL,
	  `L_SUPPLIER_NO` bigint(18) DEFAULT '0' COMMENT '卖方客户号',
	  `C_SUPPLIER_NAME` varchar(120) DEFAULT NULL,
	  `C_AGREENO` varchar(40) DEFAULT ' ' COMMENT '合同编号',
	  `L_OPERID` bigint(18) DEFAULT '0' COMMENT '操作员编码',
	  `C_OPERNAME` varchar(40) DEFAULT ' ' COMMENT '操作员名字',
	  `C_OPERORG` varchar(200) DEFAULT ' ' COMMENT '操作机构',
	  `C_CORE_OPERORG` varchar(200) DEFAULT NULL,
	  `N_BATCHNO` bigint(18) unsigned DEFAULT '0' COMMENT '上传的批次号',
	  `C_DESCRIPTION` varchar(2000) DEFAULT ' ' COMMENT '备注',
	  `L_CORE_CUSTNO` bigint(18) DEFAULT '0' COMMENT '核心企业',
	  `C_CORE_CUSTNAME` varchar(120) DEFAULT NULL,
	  `L_MODI_OPERID` bigint(18) DEFAULT '0' COMMENT '修改操作员id',
	  `C_MODI_OPERNAME` varchar(40) DEFAULT '0' COMMENT '修改操作员名称',
	  `T_MODI_TIME` varchar(8) DEFAULT '0' COMMENT '修改时间',
	  `C_SOURCE` char(2) NOT NULL DEFAULT '00' COMMENT '数据来源；00：核心企业自动，01：核心企业手工，10：供应商手工，11：供应商自动',
	  `L_TRANSFERID` bigint(18) DEFAULT NULL COMMENT '背书转让来源票据流水号',
	  `C_Ref_NO` varchar(32) NOT NULL,
	  `N_VERSION` varchar(255) NOT NULL,
	  `C_IS_LATEST` varchar(255) NOT NULL,
	  `C_LOCKED_STATUS` char(2) NOT NULL COMMENT '0 未锁定状态 1 锁定状态',
	  `C_DOC_STATUS` char(2) NOT NULL COMMENT '0：草稿 1：确认 2废止 ',
	  `L_AUDIT_OPERID` bigint(20) DEFAULT NULL,
	  `C_AUDIT_OPERNAME` varchar(255) DEFAULT NULL,
	  `D_AUDIT_DATE` char(8) DEFAULT NULL,
	  `T_AUDIT_TIME` char(8) DEFAULT NULL,
	  `C_BILL_NAME` varchar(255) DEFAULT NULL COMMENT '出票人',
	  PRIMARY KEY (`ID`),
	  KEY `inx_billv3_tab_supplierNo` (`L_SUPPLIER_NO`) USING BTREE,
	  KEY `inx_billv3_tab_coreCustNo` (`L_CORE_CUSTNO`) USING BTREE,
	  KEY `inx_billv3_tab_refNoVersion` (`C_Ref_NO`,`N_VERSION`) USING BTREE,
	  KEY `inx_billv3_tab_billNo` (`C_BILLNO`) USING BTREE,
	  KEY `inx_billv3_tab_invoiceDate` (`D_INVOICE_DATE`) USING BTREE,
	  KEY `inx_billv3_tab_endDate` (`D_END_DATE`) USING BTREE,
	  KEY `inx_billv3_tab_businStatus` (`C_BUSIN_STATUS`) USING BTREE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商业承兑汇票信息';


	END IF;
END$$
call create_table_t_scf_accept_bill_v3()$$
drop PROCEDURE if EXISTS create_table_t_scf_accept_bill_v3$$

##--发票明细表

drop PROCEDURE if EXISTS create_table_t_scf_invoice_detail_v3$$
create procedure create_table_t_scf_invoice_detail_v3() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_invoice_detail_v3')
	THEN
	CREATE TABLE `t_scf_invoice_detail_v3` (
	  `ID` bigint(20) NOT NULL,
	  `L_INVOICE_ID` bigint(20) DEFAULT NULL,
	  `C_SERVICE_NAME` varchar(255) DEFAULT NULL,
	  `C_DESCRIPTION` varchar(2000) DEFAULT NULL,
	  `F_UNIT` decimal(16,0) DEFAULT NULL,
	  `N_AMOUNT` int(11) DEFAULT NULL,
	  `C_COMPANY` varchar(255) DEFAULT NULL,
	  `F_BALANCE` decimal(16,0) DEFAULT NULL,
	  `F_INVOICE_TAX` decimal(16,0) DEFAULT NULL,
	  `F_INVOICE_TAX_BALANCE` decimal(16,0) DEFAULT NULL,
	  `D_REG_DATE` varchar(8) DEFAULT NULL,
	  `T_REG_TIME` varchar(8) DEFAULT NULL,
	  PRIMARY KEY (`ID`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	END IF;
END$$
call create_table_t_scf_invoice_detail_v3()$$
drop PROCEDURE if EXISTS create_table_t_scf_invoice_detail_v3$$

##--发票表
drop PROCEDURE if EXISTS create_table_t_scf_invoice_v3$$
create procedure create_table_t_scf_invoice_v3() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_invoice_v3')
	THEN
	CREATE TABLE `t_scf_invoice_v3` (
	  `ID` bigint(18) NOT NULL COMMENT '流水号',
	  `C_INVOICE_CODE` varchar(30) DEFAULT NULL COMMENT '发票代码',
	  `C_INVOICE_NO` varchar(30) DEFAULT NULL COMMENT '发票号码',
	  `L_CUSTNO` bigint(18) DEFAULT NULL COMMENT '客户编号',
	  `L_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '客户名称',
	  `C_CUST_TAXPAYERNO` varchar(120) DEFAULT NULL COMMENT '购买方纳税人识别号',
	  `C_CUST_PHONE` varchar(30) DEFAULT NULL COMMENT '购买方手机号码',
	  `C_CUST_ACCOUNT` varchar(255) DEFAULT NULL COMMENT '购买方开户行及帐号',
	  `L_REG_OPERID` bigint(18) DEFAULT NULL COMMENT '新增操作员编码',
	  `C_REG_OPERNAME` varchar(40) DEFAULT NULL COMMENT '新增操作员名字',
	  `C_OPERORG` varchar(200) DEFAULT NULL COMMENT '操作机构',
	  `D_REG_DATE` varchar(8) DEFAULT NULL COMMENT '创建日期',
	  `T_REG_TIME` varchar(8) DEFAULT NULL COMMENT '创建时间',
	  `L_MODI_OPERID` bigint(18) DEFAULT NULL COMMENT '编辑操作员编码',
	  `C_MODI_OPERNAME` varchar(40) DEFAULT NULL COMMENT '编辑操作员名字',
	  `D_MODI_DATE` varchar(8) DEFAULT NULL COMMENT '编辑日期',
	  `T_MODI_TIME` varchar(8) DEFAULT NULL COMMENT '编辑时间',
	  `L_CORE_CUSTNO` bigint(18) DEFAULT NULL COMMENT '核心企业编号',
	  `L_CORE_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '核心企业名字',
	  `C_CORECUST_TAXPAYERNO` varchar(120) DEFAULT NULL COMMENT '销售方纳税人识别号',
	  `C_CORECUST_PHONE` varchar(30) DEFAULT NULL COMMENT '销售方手机号码',
	  `C_CORECUST_ACCOUNT` varchar(255) DEFAULT NULL COMMENT '销售方开户行及帐号',
	  `C_CORPVOCATE` varchar(20) DEFAULT NULL COMMENT '行业类别',
	  `D_INVOICE_DATE` varchar(8) DEFAULT NULL COMMENT '开票日期',
	  `F_BALANCE` decimal(16,2) DEFAULT '0.00' COMMENT '发票金额',
	  `C_DRAWER` varchar(40) DEFAULT NULL COMMENT '开票人',
	  `N_BATCHNO` int(18) DEFAULT NULL COMMENT '上传的批次号，对应fileinfo中的ID',
	  `C_BUSIN_STATUS` char(2) DEFAULT '1' COMMENT '0 未核准 1：核准  2：已使用 3：转让 4废止 5 过期',
	  `C_DESCRIPTION` varchar(200) DEFAULT NULL COMMENT '备注',
	  `C_Ref_NO` varchar(32) DEFAULT NULL,
	  `N_VERSION` varchar(255) DEFAULT NULL,
	  `C_IS_LATEST` varchar(255) DEFAULT NULL,
	  `C_DOC_STATUS` char(2) DEFAULT NULL COMMENT '0：草稿 1：确认 2废止',
	  `C_LOCKED_STATUS` char(2) DEFAULT NULL COMMENT '0 未锁定状态 1 锁定状态',
	  `T_AUDIT_TIME` char(8) DEFAULT NULL,
	  `D_AUDIT_DATE` char(8) DEFAULT NULL,
	  `C_AUDIT_OPERNAME` varchar(255) DEFAULT NULL,
	  `L_AUDIT_OPERID` bigint(20) DEFAULT NULL,
	  PRIMARY KEY (`ID`),
	  KEY `inx_invoicev3_tab_invoiceDate` (`D_INVOICE_DATE`) USING BTREE,
	  KEY `inx_invoicev3_tab_businStatus` (`C_BUSIN_STATUS`) USING BTREE,
	  KEY `inx_invoicev3_tab_custNo` (`L_CUSTNO`) USING BTREE,
	  KEY `inx_invoicev3_tab_coreCustNo` (`L_CORE_CUSTNO`) USING BTREE,
	  KEY `inx_incoicev3_tab_refNoVersion` (`C_Ref_NO`,`N_VERSION`) USING BTREE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商发票信息';



	END IF;
END$$
call create_table_t_scf_invoice_v3()$$
drop PROCEDURE if EXISTS create_table_t_scf_invoice_v3$$

##--订单表

drop PROCEDURE if EXISTS create_table_t_scf_order_v3$$
create procedure create_table_t_scf_order_v3() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_order_v3')
	THEN
	CREATE TABLE `t_scf_order_v3` (
	  `ID` bigint(18) NOT NULL COMMENT '流水号',
	  `C_ORDERNO` varchar(100) NOT NULL COMMENT '订单编号',
	  `C_BT_ORDERNO` varchar(40) DEFAULT NULL COMMENT '资金系统中订单编号',
	  `C_BTNO` varchar(20) DEFAULT NULL COMMENT '客户资金系统编号',
	  `C_CUSTNAME` varchar(120) DEFAULT NULL,
	  `L_CUSTNO` bigint(18) DEFAULT NULL COMMENT '客户号',
	  `C_ORDER_TYPE` char(2) DEFAULT NULL COMMENT '订单类型  0:供应商订单 1:经销商订单',
	  `D_REG_DATE` varchar(8) NOT NULL COMMENT '创建日期',
	  `T_REG_TIME` varchar(8) DEFAULT NULL,
	  `C_GOODSNAME` varchar(100) NOT NULL COMMENT '商品名称',
	  `D_ORDER_DATE` varchar(8) DEFAULT NULL COMMENT '订单日期',
	  `D_END_DATE` varchar(8) DEFAULT NULL COMMENT '到期日期',
	  `F_UNIT` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
	  `N_AMOUNT` int(10) NOT NULL DEFAULT '0' COMMENT '采购数量',
	  `F_BALANCE` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '订单总额',
	  `L_CORE_CUSTNO` bigint(18) NOT NULL COMMENT '核心企业编号',
	  `C_CORE_CUSTNAME` varchar(120) DEFAULT NULL,
	  `L_MODI_OPERID` bigint(18) DEFAULT NULL COMMENT '编辑操作员编码',
	  `C_MODI_OPERNAME` varchar(40) DEFAULT NULL COMMENT '编辑操作员名字',
	  `C_OPERORG` varchar(200) DEFAULT NULL COMMENT '操作机构',
	  `D_MODI_DATE` varchar(8) DEFAULT NULL COMMENT '编辑日期',
	  `T_MODI_TIME` varchar(8) DEFAULT NULL COMMENT '编辑时间',
	  `C_SETTLEMENT` char(2) DEFAULT '0' COMMENT '结算方式 0:商业汇票 1:赊销',
	  `C_BUSIN_STATUS` char(2) NOT NULL DEFAULT '0' COMMENT '0 未核准 1：核准  2：已使用 3：转让 4废止 5 过期',
	  `N_BATCHNO` bigint(20) DEFAULT NULL COMMENT '订单附件，对应fileinfo中的ID',
	  `C_DESCRIPTION` varchar(2000) DEFAULT NULL COMMENT '备注',
	  `C_DATASOURCE` char(2) NOT NULL DEFAULT '0' COMMENT '数据来源, 0:关联单据默认生成, 1:用户录入',
	  `C_Ref_NO` varchar(32) NOT NULL,
	  `N_VERSION` varchar(255) NOT NULL,
	  `C_IS_LATEST` varchar(255) NOT NULL,
	  `C_DOC_STATUS` char(2) NOT NULL COMMENT ' 0：草稿 1：确认 2废止',
	  `C_LOCKED_STATUS` char(2) NOT NULL COMMENT '0 未锁定状态 1 锁定状态',
	  `L_AUDIT_OPERID` bigint(20) DEFAULT NULL,
	  `C_AUDIT_OPERNAME` varchar(255) DEFAULT NULL,
	  `D_AUDIT_DATE` char(8) DEFAULT NULL,
	  `T_AUDIT_TIME` char(8) DEFAULT NULL,
	  `N_RESOLVEFILE_ID` bigint(20) DEFAULT NULL COMMENT '解析上传文件id',
	  PRIMARY KEY (`ID`),
	  KEY `inx_orderv3_tab_orderDate` (`D_ORDER_DATE`) USING BTREE,
	  KEY `inx_orderv3_tab_refNoVersion` (`C_Ref_NO`,`N_VERSION`) USING BTREE,
	  KEY `inx_orderv3_tab_custNo` (`L_CUSTNO`) USING BTREE,
	  KEY `inx_orderv3_tab_coreCustNo` (`L_CORE_CUSTNO`) USING BTREE,
	  KEY `inx_orderv3_tab_businStatus` (`C_BUSIN_STATUS`) USING BTREE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单信息';



	END IF;
END$$
call create_table_t_scf_order_v3()$$
drop PROCEDURE if EXISTS create_table_t_scf_order_v3$$

##--应收应付表
drop PROCEDURE if EXISTS create_table_t_scf_receivable_v3$$
create procedure create_table_t_scf_receivable_v3() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_receivable_v3')
	THEN
	CREATE TABLE `t_scf_receivable_v3` (
	  `ID` bigint(18) NOT NULL COMMENT '流水号',
	  `C_RECEIVABLE_NO` varchar(30) NOT NULL COMMENT '应收账款编号',
	  `C_BTNO` varchar(20) DEFAULT NULL COMMENT '客户资金系统编号',
	  `L_CORE_CUSTNO` bigint(18) NOT NULL COMMENT '核心企业编号',
	  `C_CORE_CUSTNAME` varchar(120) DEFAULT NULL,
	  `L_CUSTNO` bigint(18) DEFAULT NULL COMMENT '客户号',
	  `C_CUSTNAME` varchar(120) DEFAULT NULL,
	  `C_CREDITOR` varchar(100) NOT NULL COMMENT '债权人',
	  `C_DEBTOR` varchar(100) NOT NULL COMMENT '债务人',
	  `F_BALANCE` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
	  `F_SURPLUS_BALANCE` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
	  `F_DEDUCTION_BALANCE` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '抵扣金额',
	  `F_STATEMENT_BALANCE` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '结算金额',
	  `C_AGREENO` varchar(255) DEFAULT ' ' COMMENT '贸易合同号',
	  `C_INVOICENO` varchar(255) DEFAULT ' ' COMMENT '发票编号',
	  `D_END_DATE` varchar(8) DEFAULT NULL COMMENT '付款到期日期',
	  `D_REG_DATE` varchar(8) DEFAULT NULL COMMENT '数据创建日期',
	  `L_MODI_OPERID` bigint(18) DEFAULT NULL COMMENT '编辑操作员编码',
	  `C_MODI_OPERNAME` varchar(40) DEFAULT NULL COMMENT '编辑操作员名字',
	  `C_OPERORG` varchar(200) DEFAULT NULL COMMENT '操作机构',
	  `D_MODI_DATE` varchar(8) DEFAULT NULL COMMENT '编辑日期',
	  `T_MODI_TIME` varchar(8) DEFAULT NULL COMMENT '编辑时间',
	  `C_BUSIN_STATUS` char(2) NOT NULL DEFAULT '0' COMMENT '0 未核准 1：核准  2：已使用 3：转让 4废止 5 过期',
	  `N_BATCHNO` int(18) DEFAULT NULL COMMENT '上传的批次号，对应fileinfo中的ID',
	  `C_DESCRIPTION` varchar(200) DEFAULT NULL COMMENT '备注',
	  `C_IS_LATEST` varchar(255) NOT NULL,
	  `N_VERSION` varchar(255) NOT NULL,
	  `C_Ref_NO` varchar(32) NOT NULL,
	  `C_LOCKED_STATUS` char(2) NOT NULL COMMENT '0：草稿 1：确认 2废止 ',
	  `C_DOC_STATUS` char(2) NOT NULL COMMENT ' 0 未锁定状态 1 锁定状态',
	  `T_AUDIT_TIME` char(8) DEFAULT NULL,
	  `D_AUDIT_DATE` char(8) DEFAULT NULL,
	  `C_AUDIT_OPERNAME` varchar(255) DEFAULT NULL,
	  `L_AUDIT_OPERID` bigint(20) DEFAULT NULL,
	  `T_REG_TIME` char(8) DEFAULT NULL COMMENT '注册时间',
	  PRIMARY KEY (`ID`),
	  KEY `inx_receivablev3_tab_refNoVersion` (`N_VERSION`,`C_Ref_NO`) USING BTREE,
	  KEY `inx_receivablev3_tab_regDate` (`D_REG_DATE`) USING BTREE,
	  KEY `inx_receivablev3_tab_endDate` (`D_END_DATE`) USING BTREE,
	  KEY `inx_receivablev3_tab_businStatus` (`C_BUSIN_STATUS`) USING BTREE,
	  KEY `inx_receivablev3_tab_custNo` (`L_CUSTNO`) USING BTREE,
	  KEY `inx_receivablev3_tab_coreCustNo` (`L_CORE_CUSTNO`) USING BTREE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应收账款信息';


	END IF;
END$$
call create_table_t_scf_receivable_v3()$$
drop PROCEDURE if EXISTS create_table_t_scf_receivable_v3$$


##-- 文件解析日志表

drop PROCEDURE if EXISTS create_table_t_cust_resolve_file$$
create procedure create_table_t_cust_resolve_file() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_resolve_file')
	THEN
		CREATE TABLE `t_cust_resolve_file` (
		  `ID` bigint(20) NOT NULL COMMENT '主键',
		  `C_FILElENGTH` decimal(12,0) DEFAULT NULL COMMENT '上传文件大小',
		  `C_FILETYPE` varchar(9) DEFAULT NULL COMMENT '上传文件类型',
		  `D_REG_DATE` varchar(8) DEFAULT NULL COMMENT '解析日期',
		  `T_REG_TIME` varchar(8) DEFAULT NULL COMMENT '解析时间',
		  `D_MODI_DATE` varchar(8) DEFAULT NULL COMMENT '解析结束日期',
		  `T_MODI_TIME` varchar(8) DEFAULT NULL COMMENT '解析结束时间',
		  `C_BUSIN_STATUS` varchar(5) DEFAULT NULL COMMENT '解析结果状态 0 正在解析  1解析错误 2解析成功',
		  `C_SHOW_MESSAGE` varchar(255) DEFAULT NULL COMMENT '解析完成描述信息',
		  `N_FILEITEM_ID` bigint(20) DEFAULT NULL COMMENT '文件上传id关联',
		  `L_MODI_OPERID` bigint(18) DEFAULT NULL COMMENT '解析操作员id',
		  `C_MODI_OPERNAME` varchar(40) DEFAULT NULL COMMENT '解析操作员名字',
		  `C_OPEROPG` varchar(200) DEFAULT NULL COMMENT '所属机构',
		  `L_CUSTNO` bigint(18) DEFAULT NULL COMMENT '供应商id',
		  `C_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '供应商名称',
		  `L_CORE_CUSTNO` bigint(18) DEFAULT NULL COMMENT '核心企业id',
		  `C_CORE_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '核心企业名称',
		  PRIMARY KEY (`ID`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	END IF;
END$$
call create_table_t_cust_resolve_file()$$
drop PROCEDURE if EXISTS create_table_t_cust_resolve_file$$

##-- 文件解析列对应关系字段表

drop PROCEDURE if EXISTS create_table_cps_file_ordercloumn$$
create procedure create_table_cps_file_ordercloumn() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_file_ordercloumn')
	THEN
	CREATE TABLE `t_cust_file_ordercloumn` (
	  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
	  `C_INFO_TYPE` varchar(8) DEFAULT NULL COMMENT '解析的文件类型1订单 2票据  3应收账款 4发票 5 合同 6佣金',
	  `C_UP_FLAG` varchar(8) DEFAULT NULL COMMENT '标记上传下载   上传1  下载2',
	  `C_BUSIN_STATUS` varchar(8) DEFAULT NULL COMMENT ' 当前记录是否可用      0 可用  1过期',
	  `L_CLOUMN_ORDER` int(11) DEFAULT NULL COMMENT '文件列排序序号',
	  `C_CLOUMN_PROPERTIES` varchar(255) DEFAULT NULL COMMENT '文件列对应的属性',
	  `C_CLOUMN_NAME` varchar(255) DEFAULT NULL COMMENT '列的中文名称',
	  `L_IS_MUST` int(11) DEFAULT NULL COMMENT '是否必填 1 必须  0 不必须',
	  `D_REG_DATE` varchar(8) DEFAULT NULL COMMENT '创建日期',
	  `T_REG_TIME` varchar(8) DEFAULT NULL COMMENT '创建时间',
	  `C_CLOUMN_TYPE` varchar(5) DEFAULT NULL COMMENT '当前列的类型c字符串   n数字',
	  PRIMARY KEY (`ID`),
	  KEY `inx_order_cloumn_tab_infoType` (`C_INFO_TYPE`) USING HASH
	) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

	END IF;
END$$
call create_table_cps_file_ordercloumn()$$
drop PROCEDURE if EXISTS create_table_cps_file_ordercloumn$$








