##-- DDL语句
##
##-- V1.0
##
##-- 表结构非空修改 提交日期2017/05/27


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
	  `C_BUSIN_STATU` varchar(255) DEFAULT NULL COMMENT '资产状态 0:未生效  1生效  2废止 3 转让 4不可用',
	  `C_ASSET_NAME` varchar(120) DEFAULT NULL COMMENT '资产类型id',
	  `C_ASSET_TYPE` varchar(20) DEFAULT NULL COMMENT '保理产品id',
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
	  `F_UNIT` decimal(16,2) DEFAULT '0.00' COMMENT '商品价格',
	  `N_AMOUNT` int(10) DEFAULT '0' COMMENT '采购数量',
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
	  `F_DEDUCTION_BALANCE` decimal(16,2)  DEFAULT '0.00' COMMENT '抵扣金额',
	  `F_STATEMENT_BALANCE` decimal(16,2)  DEFAULT '0.00' COMMENT '结算金额',
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

##--新增结束金额字段 2017/06/06

## --给记录表新增确认状态字段
drop PROCEDURE if EXISTS change_record_table_confirmstatus_col$$
create procedure change_record_table_confirmstatus_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_record' AND COLUMN_NAME='C_CONFIRM_STATUS')
THEN   
   ALTER TABLE `t_cps_record` ADD COLUMN `C_CONFIRM_STATUS` char(2) DEFAULT NULL COMMENT '拜特确认当前记录是否合规 0 未确认  1 确定未通过  2 确认通过';
END IF;
END$$
call change_record_table_confirmstatus_col()$$
drop PROCEDURE if EXISTS change_record_table_confirmstatus_col$$

##-- 给佣金文件表新增确认相关的字段
drop PROCEDURE if EXISTS change_file_table_confirmstatus_col$$
create procedure change_file_table_confirmstatus_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_file' AND COLUMN_NAME='C_CONFIRM_STATUS')
THEN   
   ALTER TABLE `t_cps_file` ADD COLUMN `C_CONFIRM_STATUS` char(2) DEFAULT NULL COMMENT '拜特确认当前记录是否合规 0 未确认  1 确定未通过  2 确认通过';
END IF;
END$$
call change_file_table_confirmstatus_col()$$
drop PROCEDURE if EXISTS change_file_table_confirmstatus_col$$



drop PROCEDURE if EXISTS change_file_table_confirmdate_col$$
create procedure change_file_table_confirmdate_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_file' AND COLUMN_NAME='D_CONFIRM_DATE')
THEN   
   ALTER TABLE `t_cps_file` ADD COLUMN `D_CONFIRM_DATE` char(8) DEFAULT NULL COMMENT '确认日期';
END IF;
END$$
call change_file_table_confirmdate_col()$$
drop PROCEDURE if EXISTS change_file_table_confirmdate_col$$



drop PROCEDURE if EXISTS change_file_table_confirmtime_col$$
create procedure change_file_table_confirmtime_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_file' AND COLUMN_NAME='T_CONFIRM_TIME')
THEN   
   ALTER TABLE `t_cps_file` ADD COLUMN `T_CONFIRM_TIME` char(6) DEFAULT NULL COMMENT '确认时间';
END IF;
END$$
call change_file_table_confirmtime_col()$$
drop PROCEDURE if EXISTS change_file_table_confirmtime_col$$

drop PROCEDURE if EXISTS change_file_table_confirmmessage_col$$
create procedure change_file_table_confirmmessage_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_file' AND COLUMN_NAME='C_CONFRIM_MESSAGE')
THEN   
   ALTER TABLE `t_cps_file` ADD COLUMN `C_CONFRIM_MESSAGE` varchar(255) DEFAULT NULL COMMENT '确认信息';
END IF;
END$$
call change_file_table_confirmmessage_col()$$
drop PROCEDURE if EXISTS change_file_table_confirmmessage_col$$


drop PROCEDURE if EXISTS change_file_table_filedownid_col$$
create procedure change_file_table_filedownid_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_file' AND COLUMN_NAME='L_FILEDOWN_ID')
THEN   
   ALTER TABLE `t_cps_file` ADD COLUMN `L_FILEDOWN_ID` bigint(20) DEFAULT NULL COMMENT '当天审核全部文件的id';
END IF;
END$$
call change_file_table_filedownid_col()$$
drop PROCEDURE if EXISTS change_file_table_filedownid_col$$



drop PROCEDURE if EXISTS change_file_table_auditoperid_col$$
create procedure change_file_table_auditoperid_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_file' AND COLUMN_NAME='L_AUDIT_OPERID')
THEN   
   ALTER TABLE `t_cps_file` ADD COLUMN `L_AUDIT_OPERID` bigint(18) DEFAULT NULL COMMENT '核准人id';
END IF;
END$$
call change_file_table_auditoperid_col()$$
drop PROCEDURE if EXISTS change_file_table_auditoperid_col$$



drop PROCEDURE if EXISTS change_file_table_auditopername_col$$
create procedure change_file_table_auditopername_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_file' AND COLUMN_NAME='C_AUDIT_OPERNAME')
THEN   
   ALTER TABLE `t_cps_file` ADD COLUMN `C_AUDIT_OPERNAME` varchar(40) DEFAULT NULL COMMENT '核准人名称';
END IF;
END$$
call change_file_table_auditopername_col()$$
drop PROCEDURE if EXISTS change_file_table_auditopername_col$$


## ---佣金导出文件新增字段

drop PROCEDURE if EXISTS change_filedown_table_amountconfirfailure_col$$
create procedure change_filedown_table_amountconfirfailure_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_file_down' AND COLUMN_NAME='N_AMOUNT_CONFIRM_FAILURE')
THEN   
   ALTER TABLE `t_cps_file_down` ADD COLUMN `N_AMOUNT_CONFIRM_FAILURE` int(11) DEFAULT NULL COMMENT '不合规数量';
END IF;
END$$
call change_filedown_table_amountconfirfailure_col()$$
drop PROCEDURE if EXISTS change_filedown_table_amountconfirfailure_col$$


drop PROCEDURE if EXISTS change_filedown_table_amountconfirmsuccess_col$$
create procedure change_filedown_table_amountconfirmsuccess_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_file_down' AND COLUMN_NAME='N_AMOUNT_CONFIRM_SUCCESS')
THEN   
   ALTER TABLE `t_cps_file_down` ADD COLUMN `N_AMOUNT_CONFIRM_SUCCESS` int(11) DEFAULT NULL COMMENT '合规数量';
END IF;
END$$
call change_filedown_table_amountconfirmsuccess_col()$$
drop PROCEDURE if EXISTS change_filedown_table_amountconfirmsuccess_col$$


drop PROCEDURE if EXISTS change_filedown_table_balanceconfirmfailure_col$$
create procedure change_filedown_table_balanceconfirmfailure_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_file_down' AND COLUMN_NAME='F_BALANCE_CONFIRM_FAILURE')
THEN   
   ALTER TABLE `t_cps_file_down` ADD COLUMN `F_BALANCE_CONFIRM_FAILURE` decimal(18,2) DEFAULT NULL COMMENT '不合规金额';
END IF;
END$$
call change_filedown_table_balanceconfirmfailure_col()$$
drop PROCEDURE if EXISTS change_filedown_table_balanceconfirmfailure_col$$


drop PROCEDURE if EXISTS change_filedown_table_balanceconfirmsuccess_col$$
create procedure change_filedown_table_balanceconfirmsuccess_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_file_down' AND COLUMN_NAME='F_BALANCE_CONFIRM_SUCCESS')
THEN   
   ALTER TABLE `t_cps_file_down` ADD COLUMN `F_BALANCE_CONFIRM_SUCCESS` decimal(18,2) DEFAULT NULL COMMENT '合规金额';
END IF;
END$$
call change_filedown_table_balanceconfirmsuccess_col()$$
drop PROCEDURE if EXISTS change_filedown_table_balanceconfirmsuccess_col$$


drop PROCEDURE if EXISTS change_filedown_table_confrimstatus_col$$
create procedure change_filedown_table_confrimstatus_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_file_down' AND COLUMN_NAME='C_CONFIRM_STATUS')
THEN   
   ALTER TABLE `t_cps_file_down` ADD COLUMN `C_CONFIRM_STATUS` char(2) DEFAULT NULL COMMENT '拜特确认当前记录是否合规 0 未确认  1 不合规  2 合规';
END IF;
END$$
call change_filedown_table_confrimstatus_col()$$
drop PROCEDURE if EXISTS change_filedown_table_confrimstatus_col$$


drop PROCEDURE if EXISTS change_filedown_table_confrimdate_col$$
create procedure change_filedown_table_confrimdate_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_file_down' AND COLUMN_NAME='D_CONFIRM_DATE')
THEN   
   ALTER TABLE `t_cps_file_down` ADD COLUMN `D_CONFIRM_DATE` char(8) DEFAULT NULL COMMENT '确认日期';
END IF;
END$$
call change_filedown_table_confrimdate_col()$$
drop PROCEDURE if EXISTS change_filedown_table_confrimdate_col$$


drop PROCEDURE if EXISTS change_filedown_table_confrimtime_col$$
create procedure change_filedown_table_confrimtime_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_file_down' AND COLUMN_NAME='T_CONFIRM_TIME')
THEN   
   ALTER TABLE `t_cps_file_down` ADD COLUMN `T_CONFIRM_TIME` char(6) DEFAULT NULL COMMENT '确认时间';
END IF;
END$$
call change_filedown_table_confrimtime_col()$$
drop PROCEDURE if EXISTS change_filedown_table_confrimtime_col$$

  
  drop PROCEDURE if EXISTS change_filedown_table_confrimmessage_col$$
create procedure change_filedown_table_confrimmessage_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_file_down' AND COLUMN_NAME='C_CONFRIM_MESSAGE')
THEN   
   ALTER TABLE `t_cps_file_down` ADD COLUMN `C_CONFRIM_MESSAGE` varchar(255) DEFAULT NULL COMMENT '确认信息';
END IF;
END$$
call change_filedown_table_confrimmessage_col()$$
drop PROCEDURE if EXISTS change_filedown_table_confrimmessage_col$$


  drop PROCEDURE if EXISTS change_filedown_table_auditoperid_col$$
create procedure change_filedown_table_auditoperid_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_file_down' AND COLUMN_NAME='L_AUDIT_OPERID')
THEN   
   ALTER TABLE `t_cps_file_down` ADD COLUMN `L_AUDIT_OPERID` bigint(18) DEFAULT NULL COMMENT '核准人id';
END IF;
END$$
call change_filedown_table_auditoperid_col()$$
drop PROCEDURE if EXISTS change_filedown_table_auditoperid_col$$


  drop PROCEDURE if EXISTS change_filedown_table_auditopername_col$$
create procedure change_filedown_table_auditopername_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_file_down' AND COLUMN_NAME='C_AUDIT_OPERNAME')
THEN   
   ALTER TABLE `t_cps_file_down` ADD COLUMN `C_AUDIT_OPERNAME` varchar(40) DEFAULT NULL COMMENT '核准人名称';
END IF;
END$$
call change_filedown_table_auditopername_col()$$
drop PROCEDURE if EXISTS change_filedown_table_auditopername_col$$

## -- task214  :20170614

## -- 资产表新增字段
 drop PROCEDURE if EXISTS change_scfasset_table_regOperId_col$$
create procedure change_scfasset_table_regOperId_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset' AND COLUMN_NAME='L_REG_OPERID')
THEN   
   ALTER TABLE `t_scf_asset` ADD COLUMN `L_REG_OPERID` bigint(20) DEFAULT NULL;
END IF;
END$$
call change_scfasset_table_regOperId_col()$$
drop PROCEDURE if EXISTS change_scfasset_table_regOperId_col$$

 
 drop PROCEDURE if EXISTS change_scfasset_table_regOperName_col$$
create procedure change_scfasset_table_regOperName_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset' AND COLUMN_NAME='C_REG_OPERNAME')
THEN   
   ALTER TABLE `t_scf_asset` ADD COLUMN `C_REG_OPERNAME` varchar(120) DEFAULT NULL;
END IF;
END$$
call change_scfasset_table_regOperName_col()$$
drop PROCEDURE if EXISTS change_scfasset_table_regOperName_col$$
 
  
   drop PROCEDURE if EXISTS change_scfasset_table_annulOperId_col$$
create procedure change_scfasset_table_annulOperId_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset' AND COLUMN_NAME='L_ANNUL_OPERID')
THEN   
   ALTER TABLE `t_scf_asset` ADD COLUMN `L_ANNUL_OPERID` bigint(20) DEFAULT NULL;
END IF;
END$$
call change_scfasset_table_annulOperId_col()$$
drop PROCEDURE if EXISTS change_scfasset_table_annulOperId_col$$

  
   drop PROCEDURE if EXISTS change_scfasset_table_annulOperName_col$$
create procedure change_scfasset_table_annulOperName_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset' AND COLUMN_NAME='C_ANNUL_OPERNAME')
THEN   
   ALTER TABLE `t_scf_asset` ADD COLUMN `C_ANNUL_OPERNAME` varchar(120) DEFAULT NULL;
END IF;
END$$
call change_scfasset_table_annulOperName_col()$$
drop PROCEDURE if EXISTS change_scfasset_table_annulOperName_col$$

  
     drop PROCEDURE if EXISTS change_scfasset_table_annulDate_col$$
create procedure change_scfasset_table_annulDate_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset' AND COLUMN_NAME='D_ANNUL_DATE')
THEN   
   ALTER TABLE `t_scf_asset` ADD COLUMN `D_ANNUL_DATE` char(8) DEFAULT NULL;
END IF;
END$$
call change_scfasset_table_annulDate_col()$$
drop PROCEDURE if EXISTS change_scfasset_table_annulDate_col$$

       drop PROCEDURE if EXISTS change_scfasset_table_annulTime_col$$
create procedure change_scfasset_table_annulTime_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset' AND COLUMN_NAME='T_ANNUL_TIME')
THEN   
   ALTER TABLE `t_scf_asset` ADD COLUMN `T_ANNUL_TIME` char(6) DEFAULT NULL;
END IF;
END$$
call change_scfasset_table_annulTime_col()$$
drop PROCEDURE if EXISTS change_scfasset_table_annulTime_col$$
  

  drop PROCEDURE if EXISTS change_scfasset_table_balance_col$$
create procedure change_scfasset_table_balance_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset' AND COLUMN_NAME='F_BALANCE')
THEN   
   ALTER TABLE `t_scf_asset` ADD COLUMN `F_BALANCE` decimal(16,2) DEFAULT NULL;
END IF;
END$$
call change_scfasset_table_balance_col()$$
drop PROCEDURE if EXISTS change_scfasset_table_balance_col$$


  drop PROCEDURE if EXISTS change_scfasset_table_statementBatchNo_col$$
create procedure change_scfasset_table_statementBatchNo_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset' AND COLUMN_NAME='N_STATEMENT_BATCHNO')
THEN   
   ALTER TABLE `t_scf_asset` ADD COLUMN `N_STATEMENT_BATCHNO` bigint(20) DEFAULT NULL COMMENT '对账单附件';
END IF;
END$$
call change_scfasset_table_statementBatchNo_col()$$
drop PROCEDURE if EXISTS change_scfasset_table_statementBatchNo_col$$

  
    drop PROCEDURE if EXISTS change_scfasset_table_goodsbatchNo_col$$
create procedure change_scfasset_table_goodsbatchNo_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset' AND COLUMN_NAME='N_GOODS_BATCHNO')
THEN   
   ALTER TABLE `t_scf_asset` ADD COLUMN `N_GOODS_BATCHNO` bigint(20) DEFAULT NULL COMMENT '商品出库单附件';
END IF;
END$$
call change_scfasset_table_goodsbatchNo_col()$$
drop PROCEDURE if EXISTS change_scfasset_table_goodsbatchNo_col$$
  
  
      drop PROCEDURE if EXISTS change_scfasset_table_othersBatchNo_col$$
create procedure change_scfasset_table_othersBatchNo_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset' AND COLUMN_NAME='N_OTHERS_BATCHNO')
THEN   
   ALTER TABLE `t_scf_asset` ADD COLUMN `N_OTHERS_BATCHNO` bigint(20) DEFAULT NULL COMMENT '其他附件';
END IF;
END$$
call change_scfasset_table_othersBatchNo_col()$$
drop PROCEDURE if EXISTS change_scfasset_table_othersBatchNo_col$$

## -- 票据表新增字段


drop PROCEDURE if EXISTS change_acceptBill_table_custName_col$$
create procedure change_acceptBill_table_custName_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_accept_bill_v3' AND COLUMN_NAME='C_CUSTNAME')
THEN   
   ALTER TABLE `t_scf_accept_bill_v3` ADD COLUMN `C_CUSTNAME` varchar(120) DEFAULT NULL;
END IF;
END$$
call change_acceptBill_table_custName_col()$$
drop PROCEDURE if EXISTS change_acceptBill_table_custName_col$$


drop PROCEDURE if EXISTS change_acceptBill_table_custId_col$$
create procedure change_acceptBill_table_custId_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_accept_bill_v3' AND COLUMN_NAME='L_CUSTNO')
THEN   
   ALTER TABLE `t_scf_accept_bill_v3` ADD COLUMN `L_CUSTNO` bigint(18) NOT NULL;
END IF;
END$$
call change_acceptBill_table_custId_col()$$
drop PROCEDURE if EXISTS change_acceptBill_table_custId_col$$

##---贸易合同新增字段

drop PROCEDURE if EXISTS change_contractLedger_table_lockedStatus_col$$
create procedure change_contractLedger_table_lockedStatus_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_contract_ledger' AND COLUMN_NAME='C_LOCKED_STATUS')
THEN   
   ALTER TABLE `t_contract_ledger` ADD COLUMN `C_LOCKED_STATUS` char(2) DEFAULT NULL;
END IF;
END$$
call change_contractLedger_table_lockedStatus_col()$$
drop PROCEDURE if EXISTS change_contractLedger_table_lockedStatus_col$$
  
  drop PROCEDURE if EXISTS change_contractLedger_table_refNo_col$$
create procedure change_contractLedger_table_refNo_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_contract_ledger' AND COLUMN_NAME='C_Ref_NO')
THEN   
   ALTER TABLE `t_contract_ledger` ADD COLUMN `C_Ref_NO` char(32) DEFAULT NULL;
END IF;
END$$
call change_contractLedger_table_refNo_col()$$
drop PROCEDURE if EXISTS change_contractLedger_table_refNo_col$$
  
    drop PROCEDURE if EXISTS change_contractLedger_table_version_col$$
create procedure change_contractLedger_table_version_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_contract_ledger' AND COLUMN_NAME='N_VERSION')
THEN   
   ALTER TABLE `t_contract_ledger` ADD COLUMN `N_VERSION` varchar(255) DEFAULT NULL;
END IF;
END$$
call change_contractLedger_table_version_col()$$
drop PROCEDURE if EXISTS change_contractLedger_table_version_col$$
  
      drop PROCEDURE if EXISTS change_contractLedger_table_islatest_col$$
create procedure change_contractLedger_table_islatest_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_contract_ledger' AND COLUMN_NAME='C_IS_LATEST')
THEN   
   ALTER TABLE `t_contract_ledger` ADD COLUMN `C_IS_LATEST` varchar(255) DEFAULT NULL;
END IF;
END$$
call change_contractLedger_table_islatest_col()$$
drop PROCEDURE if EXISTS change_contractLedger_table_islatest_col$$
  
        drop PROCEDURE if EXISTS change_contractLedger_table_custNo_col$$
create procedure change_contractLedger_table_custNo_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_contract_ledger' AND COLUMN_NAME='L_CUSTNO')
THEN   
   ALTER TABLE `t_contract_ledger` ADD COLUMN `L_CUSTNO` bigint(18) NOT NULL;
END IF;
END$$
call change_contractLedger_table_custNo_col()$$
drop PROCEDURE if EXISTS change_contractLedger_table_custNo_col$$

          drop PROCEDURE if EXISTS change_contractLedger_table_custName_col$$
create procedure change_contractLedger_table_custName_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_contract_ledger' AND COLUMN_NAME='C_CUSTNAME')
THEN   
   ALTER TABLE `t_contract_ledger` ADD COLUMN `C_CUSTNAME` varchar(255) DEFAULT NULL;
END IF;
END$$
call change_contractLedger_table_custName_col()$$
drop PROCEDURE if EXISTS change_contractLedger_table_custName_col$$

          drop PROCEDURE if EXISTS change_contractLedger_table_businVersionStatus_col$$
create procedure change_contractLedger_table_businVersionStatus_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_contract_ledger' AND COLUMN_NAME='c_busin_version_status')
THEN   
   ALTER TABLE `t_contract_ledger` ADD COLUMN `c_busin_version_status` char(1) DEFAULT NULL COMMENT '0 未核准 1：核准  2：已使用 3：转让 4废止 5 过期';
END IF;
END$$
call change_contractLedger_table_businVersionStatus_col()$$
drop PROCEDURE if EXISTS change_contractLedger_table_businVersionStatus_col$$


          drop PROCEDURE if EXISTS change_contractLedger_table_core_custNo_col$$
create procedure change_contractLedger_table_core_custNo_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_contract_ledger' AND COLUMN_NAME='l_core_custNo')
THEN   
   ALTER TABLE `t_contract_ledger` ADD COLUMN `l_core_custNo` bigint(18) DEFAULT NULL;
END IF;
END$$
call change_contractLedger_table_core_custNo_col()$$
drop PROCEDURE if EXISTS change_contractLedger_table_core_custNo_col$$


## ---业务类型表  task-213
drop PROCEDURE if EXISTS create_table_scf_busin_type$$
create procedure create_table_scf_busin_type() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_busintype')
	THEN
	CREATE TABLE `t_scf_busintype` (
	  `ID` bigint(20) NOT NULL COMMENT '编号id',
	  `C_BUSIN_TYPE_NAME` varchar(255) NOT NULL COMMENT '业务类型名称',
	  `C_CREDIT_FLAG` char(1) DEFAULT NULL COMMENT '授信标识',
	  `C_DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '备注',
	  `C_BUSIN_STATUS` char(1) DEFAULT NULL COMMENT '业务状态 0 不可用  1 生效',
	  `D_REG_DATE` char(8) DEFAULT NULL COMMENT '新建日期',
	  `T_REG_TIME` char(6) DEFAULT NULL COMMENT '新建时间',
	  `L_REG_OPERID` bigint(20) DEFAULT NULL COMMENT '新建人',
	  `C_REG_OPERNAME` varchar(140) DEFAULT NULL COMMENT '新建名称',
	  PRIMARY KEY (`ID`),
	  UNIQUE KEY `inx_busintype_tab_businName` (`C_BUSIN_TYPE_NAME`) USING HASH
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	END IF;
END$$
call create_table_scf_busin_type()$$
drop PROCEDURE if EXISTS create_table_scf_busin_type$$

## --修改资产表类型字段
   drop PROCEDURE if EXISTS change_scfasset_table_assetType_col$$
create procedure change_scfasset_table_assetType_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset' AND COLUMN_NAME='C_ASSET_TYPE')
THEN   
   alter table t_scf_asset modify column `C_ASSET_TYPE` varchar(20) DEFAULT NULL COMMENT '保理产品id';
END IF;
END$$
call change_scfasset_table_assetType_col()$$
drop PROCEDURE if EXISTS change_scfasset_table_assetType_col$$

## ---bug718  定时任务


drop PROCEDURE if EXISTS create_table_scf_jobLog$$
create procedure create_table_scf_jobLog() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_joblog')
	THEN
	CREATE TABLE `t_scf_joblog` (
	  `ID` bigint(18) NOT NULL,
	  `C_BUSIN_STATUS` char(2) DEFAULT NULL COMMENT '业务状态 0 设置失败       1 设置成功',
	  `D_REG_DATE` char(8) DEFAULT NULL COMMENT '注册日期',
	  `T_REG_TIME` char(6) DEFAULT NULL COMMENT '注册时间',
	  `C_SHOW_MESSAGE` varchar(2500) DEFAULT NULL COMMENT '日志记录信息',
	  `C_ORDER_BY` char(10) DEFAULT NULL COMMENT '多条排序序号',
	  `C_DATAINFO_TYPE` char(2) DEFAULT NULL COMMENT '数据类型：1订单2票据3应收账款4发票5贸易合同',
	  `C_BUSIN_TYPE` char(3) DEFAULT NULL COMMENT '业务模型  1:过期日志',
	  PRIMARY KEY (`ID`),
	  KEY `inx_joblog_tab_businstatus_col` (`C_BUSIN_STATUS`) USING BTREE,
	  KEY `inx_joblog_tab_businType_col` (`C_BUSIN_TYPE`) USING BTREE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	END IF;
END$$
call create_table_scf_jobLog()$$
drop PROCEDURE if EXISTS create_table_scf_jobLog$$



## ---bug767

          drop PROCEDURE if EXISTS change_requesttemp_table_total_balance_col$$
create procedure change_requesttemp_table_total_balance_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_request_temp' AND COLUMN_NAME='F_TOTALBALANCE')
THEN   
   ALTER TABLE `t_scf_request_temp` ADD COLUMN `F_TOTALBALANCE` decimal(18,2) DEFAULT NULL COMMENT '融资总金额，来自资产';
END IF;
END$$
call change_requesttemp_table_total_balance_col()$$
drop PROCEDURE if EXISTS change_requesttemp_table_total_balance_col$$

## ---bug771

          drop PROCEDURE if EXISTS change_receivablev3_table_expire_flag_status_col$$
create procedure change_receivablev3_table_expire_flag_status_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_receivable_v3' AND COLUMN_NAME='C_EXPIRE_FLAG_STATUS')
THEN   
   ALTER TABLE `t_scf_receivable_v3` ADD COLUMN `C_EXPIRE_FLAG_STATUS` char(2) DEFAULT NULL COMMENT '0: 未生效单据自动任务过期来源  1：已生效的单据自动任务过期来源';
END IF;
END$$
call change_receivablev3_table_expire_flag_status_col()$$
drop PROCEDURE if EXISTS change_receivablev3_table_expire_flag_status_col$$



          drop PROCEDURE if EXISTS change_orderv3_table_expire_flag_status_col$$
create procedure change_orderv3_table_expire_flag_status_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_order_v3' AND COLUMN_NAME='C_EXPIRE_FLAG_STATUS')
THEN   
   ALTER TABLE `t_scf_order_v3` ADD COLUMN `C_EXPIRE_FLAG_STATUS` char(2) DEFAULT NULL COMMENT '0: 未生效单据自动任务过期来源  1：已生效的单据自动任务过期来源';
END IF;
END$$
call change_orderv3_table_expire_flag_status_col()$$
drop PROCEDURE if EXISTS change_orderv3_table_expire_flag_status_col$$


          drop PROCEDURE if EXISTS change_invoicev3_table_expire_flag_status_col$$
create procedure change_invoicev3_table_expire_flag_status_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_invoice_v3' AND COLUMN_NAME='C_EXPIRE_FLAG_STATUS')
THEN   
   ALTER TABLE `t_scf_invoice_v3` ADD COLUMN `C_EXPIRE_FLAG_STATUS` char(2) DEFAULT NULL COMMENT '0: 未生效单据自动任务过期来源  1：已生效的单据自动任务过期来源';
END IF;
END$$
call change_invoicev3_table_expire_flag_status_col()$$
drop PROCEDURE if EXISTS change_invoicev3_table_expire_flag_status_col$$


          drop PROCEDURE if EXISTS change_billv3_table_expire_flag_status_col$$
create procedure change_billv3_table_expire_flag_status_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_accept_bill_v3' AND COLUMN_NAME='C_EXPIRE_FLAG_STATUS')
THEN   
   ALTER TABLE `t_scf_accept_bill_v3` ADD COLUMN `C_EXPIRE_FLAG_STATUS` char(2) DEFAULT NULL COMMENT '0: 未生效单据自动任务过期来源  1：已生效的单据自动任务过期来源';
END IF;
END$$
call change_billv3_table_expire_flag_status_col()$$
drop PROCEDURE if EXISTS change_billv3_table_expire_flag_status_col$$


## --task216
drop PROCEDURE if EXISTS create_table_scf_commissionParam$$
create procedure create_table_scf_commissionParam() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_commission_param')
	THEN
	CREATE TABLE `t_cps_commission_param` (
	  `ID` bigint(18) NOT NULL COMMENT '主键',
	  `L_CUSTNO` bigint(18) DEFAULT NULL COMMENT '平台id',
	  `C_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '平台名称',
	  `L_CORE_CUSTNO` bigint(18) DEFAULT NULL COMMENT '核心企业对账企业Id',
	  `C_CORE_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '对账企业名称',
	  `F_INTEREST_RATE` decimal(18,2) DEFAULT NULL COMMENT '佣金年利率',
	  `F_TAX_RATE` decimal(18,2) DEFAULT NULL COMMENT '商业发票税率',
	  `L_REG_OPERID` bigint(18) DEFAULT NULL COMMENT '注册人Id',
	  `C_REG_OPERNAME` varchar(120) DEFAULT NULL COMMENT '注册人名称',
	  `D_REG_DATE` char(8) DEFAULT NULL COMMENT '注册日期',
	  `T_REG_TIME` char(6) DEFAULT NULL COMMENT '注册时间',
	  `C_BUSIN_STATUS` char(2) DEFAULT NULL COMMENT '状态: 0 不可用   1 可用',
	  PRIMARY KEY (`ID`),
	  KEY `inx_commissionparam_tab_custno` (`L_CUSTNO`) USING BTREE,
	  KEY `inx_commissionparam_tab_corecustno` (`L_CORE_CUSTNO`) USING BTREE,
	  KEY `inx_commissionparam_tab_businstatus` (`C_BUSIN_STATUS`) USING BTREE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='佣金成本维护表';



	END IF;
END$$
call create_table_scf_commissionParam()$$
drop PROCEDURE if EXISTS create_table_scf_commissionParam$$


drop PROCEDURE if EXISTS create_table_cps_invoice$$
create procedure create_table_cps_invoice() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_invoice')
	THEN
		CREATE TABLE `t_cps_invoice` (
		  `ID` bigint(18) NOT NULL COMMENT '流水号',
		  `C_INVOICE_CODE` varchar(255) DEFAULT NULL COMMENT '发票代码',
		  `C_INVOICE_NO` varchar(255) DEFAULT NULL COMMENT '发票号码',
		  `L_CUSTNO` bigint(18) DEFAULT NULL COMMENT '客户编号',
		  `L_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '客户名称',
		  `L_REG_OPERID` bigint(18) DEFAULT NULL COMMENT '申请人',
		  `C_REG_OPERNAME` varchar(1200) DEFAULT NULL COMMENT '申请人姓名',
		  `C_OPERORG` varchar(255) DEFAULT NULL COMMENT '操作机构',
		  `D_REG_DATE` char(8) DEFAULT NULL COMMENT '申请日期',
		  `T_REG_TIME` char(6) DEFAULT NULL COMMENT '申请时间',
		  `L_CORE_CUSTNO` bigint(18) DEFAULT NULL COMMENT '核心企业Id',
		  `L_CORE_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '核心企业名称',
		  `D_INVOICE_DATE` char(8) DEFAULT NULL COMMENT '开票日期',
		  `F_BALANCE` decimal(16,2) DEFAULT NULL COMMENT '发票总金额',
		  `C_DRAWER` varchar(255) DEFAULT NULL COMMENT '开票人',
		  `N_BATCHNO` bigint(18) DEFAULT NULL COMMENT '上传的批次号',
		  `C_BUSIN_STATUS` char(2) DEFAULT NULL COMMENT '状态 0 初始化状态 1 待开票  2 开票中  3 已开票   4 作废',
		  `C_DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '备注',
		  `L_CONFIRM_OPERID` bigint(18) DEFAULT NULL COMMENT '确认人',
		  `C_CONFIRM_OPERNAME` varchar(120) DEFAULT NULL COMMENT '确认人名称',
		  `D_CONFIRM_DATE` char(8) DEFAULT NULL COMMENT '确认日期',
		  `T_CONFIRM_TIME` char(6) DEFAULT NULL COMMENT '确认时间',
		  `L_AUDIT_OPERID` bigint(18) DEFAULT NULL COMMENT '提交开票人',
		  `C_AUDIT_OPERNAME` varchar(120) DEFAULT NULL COMMENT '提交开票人姓名',
		  `D_AUDIT_DATE` char(8) DEFAULT NULL COMMENT '提交日期',
		  `T_AUDIT_TIME` char(6) DEFAULT NULL COMMENT '提交时间',
		  `L_CUSTINVOICE_ID` bigint(18) DEFAULT NULL COMMENT '平台发票抬头Id',
		  `L_CORECUSTINVOICE_ID` bigint(18) DEFAULT NULL COMMENT '核心企业发票抬头id',
		  `C_INVOICE_TYPE` char(2) DEFAULT NULL COMMENT '发票种类  0 普通发票  1 专用发票',
		  `C_INVOICE_CONTENT` varchar(255) DEFAULT NULL COMMENT '发票内容',
		  `F_TAX_BALANCE` decimal(16,2) DEFAULT NULL COMMENT '税额',
		  `F_INTEREST_BALANCE` decimal(16,2) DEFAULT NULL COMMENT '发票金额',
		  `F_TAX_RATE` decimal(16,2) DEFAULT NULL COMMENT '税率',
		  `C_REFNO` varchar(20) DEFAULT NULL COMMENT '编号',
		  PRIMARY KEY (`ID`),
		  KEY `inx_cpsInvoice_tab_custNo` (`L_CUSTNO`) USING BTREE,
		  KEY `inx_cpsInvoice_tab_coreCustno` (`L_CORE_CUSTNO`) USING BTREE,
		  KEY `inx_cpsInvoice_tab_businstatus` (`C_BUSIN_STATUS`) USING BTREE,
		  KEY `inx_cpsInvoice_tab_regdate` (`D_REG_DATE`) USING BTREE
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;



	END IF;
END$$
call create_table_cps_invoice()$$
drop PROCEDURE if EXISTS create_table_cps_invoice$$


drop PROCEDURE if EXISTS create_table_cps_invoice_custinfo$$
create procedure create_table_cps_invoice_custinfo() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_invoice_custinfo')
	THEN
		CREATE TABLE `t_cps_invoice_custinfo` (
		  `ID` bigint(18) NOT NULL COMMENT '发票主键',
		  `L_CUSTNO` bigint(18) NOT NULL COMMENT '企业id',
		  `L_CORE_CUSTNO` bigint(18) DEFAULT NULL COMMENT '核心企业id',
		  `C_CORE_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '核心企业名称',
		  `C_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '企业名称',
		  `C_CORE_BANK` varchar(255) DEFAULT NULL COMMENT '开户银行',
		  `C_CORE_BANK_ACCOUNT` varchar(120) DEFAULT NULL COMMENT '银行帐号',
		  `C_CORE_TAXPAYERNO` varchar(120) DEFAULT NULL COMMENT '纳税人识别号',
		  `C_CORE_PHONE` varchar(30) DEFAULT NULL COMMENT '电话',
		  `C_CORE_ADDRESS` varchar(255) DEFAULT NULL COMMENT '地址',
		  `C_BUSIN_STATUS` char(2) DEFAULT NULL COMMENT '状态  0 不可用   1 可用',
		  `L_REG_OPERID` bigint(18) DEFAULT NULL COMMENT '注册人',
		  `C_REG_OPERNAME` varchar(40) DEFAULT NULL COMMENT '注册人名字',
		  `D_REG_DATE` char(8) DEFAULT NULL COMMENT '注册日期',
		  `T_REG_TIME` char(6) DEFAULT NULL COMMENT '注册时间',
		  `C_IS_LATEST` char(2) DEFAULT NULL COMMENT '是否默认  0 不是默认   1是默认',
		  `C_COREINFO_TYPE` char(2) DEFAULT NULL COMMENT '发票抬头的类型  1  企业     0个人',
		  PRIMARY KEY (`ID`),
		  KEY `inx_invoice_custinfo_tab_custno` (`L_CUSTNO`) USING BTREE,
		  KEY `inx_invoice_custinfo_tab_coreCustno` (`L_CORE_CUSTNO`) USING BTREE,
		  KEY `inx_invoice_custinfo_tab_businstatus` (`C_BUSIN_STATUS`) USING BTREE
		) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发票抬头信息维护';



	END IF;
END$$
call create_table_cps_invoice_custinfo()$$
drop PROCEDURE if EXISTS create_table_cps_invoice_custinfo$$


drop PROCEDURE if EXISTS create_table_cps_invoice_record$$
create procedure create_table_cps_invoice_record() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_invoice_record')
	THEN
		CREATE TABLE `t_cps_invoice_record` (
		  `ID` bigint(18) NOT NULL COMMENT '主键',
		  `L_INVOICE_ID` bigint(18) DEFAULT NULL COMMENT '发票Id',
		  `L_MONTHLY_STATEMENT_ID` bigint(18) DEFAULT NULL COMMENT '月账单Id',
		  `F_BLANCE` decimal(16,2) DEFAULT NULL COMMENT '总金额',
		  `F_TAX_RATE` decimal(16,2) DEFAULT NULL COMMENT '税率',
		  `C_INVOICE_TYPE` char(2) DEFAULT NULL COMMENT '发票种类  0 普通发票  1 专用发票',
		  `L_REG_OPERID` bigint(18) DEFAULT NULL COMMENT '申请人',
		  `C_REG_OPERNAME` varchar(120) DEFAULT NULL COMMENT '申请人姓名',
		  `D_REG_DATE` char(8) DEFAULT NULL COMMENT '申请日期',
		  `T_REG_TIME` char(6) DEFAULT NULL COMMENT '申请时间',
		  PRIMARY KEY (`ID`),
		  KEY `inx_invoice_record_tab_invoiceid` (`L_INVOICE_ID`) USING BTREE
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;


	END IF;
END$$
call create_table_cps_invoice_record()$$
drop PROCEDURE if EXISTS create_table_cps_invoice_record$$



          drop PROCEDURE if EXISTS change_monthlystatement_table_plain_invoice_flag_col$$
create procedure change_monthlystatement_table_plain_invoice_flag_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_monthly_statement' AND COLUMN_NAME='C_PLAININVOICE_FLAG')
THEN   
   ALTER TABLE `t_cps_monthly_statement` ADD COLUMN `C_PLAININVOICE_FLAG` char(2) DEFAULT '0' COMMENT '是否用于普通发票 默认为0 未使用  1已经使用';
END IF;
END$$
call change_monthlystatement_table_plain_invoice_flag_col()$$
drop PROCEDURE if EXISTS change_monthlystatement_table_plain_invoice_flag_col$$



          drop PROCEDURE if EXISTS change_monthlystatement_table_special_invoice_flag_col$$
create procedure change_monthlystatement_table_special_invoice_flag_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cps_monthly_statement' AND COLUMN_NAME='C_SPECIALINVOICE_FLAG')
THEN   
   ALTER TABLE `t_cps_monthly_statement` ADD COLUMN `C_SPECIALINVOICE_FLAG` char(2) DEFAULT '0' COMMENT '是否用于专用发票 默认为0 未使用  1已经使用';
END IF;
END$$
call change_monthlystatement_table_special_invoice_flag_col()$$
drop PROCEDURE if EXISTS change_monthlystatement_table_special_invoice_flag_col$$


##------ 新增供应商利率

drop PROCEDURE if EXISTS create_table_scf_supplier_offer$$
create procedure create_table_scf_supplier_offer() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_supplier_offer')
	THEN
		CREATE TABLE `t_scf_supplier_offer` (
		  `ID` bigint(20) NOT NULL COMMENT 'Id主键',
		  `L_CUSTNO` bigint(20) DEFAULT NULL COMMENT '供应商客户号',
		  `C_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '供应商名称',
		  `L_CORE_CUSTNO` bigint(20) DEFAULT NULL COMMENT '核心企业客户号',
		  `C_CORE_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '核心企业名称',
		  `L_CORECUST_RATE` decimal(16,2) DEFAULT NULL COMMENT '核心企业给供应商的利率',
		  `D_REG_DATE` char(8) DEFAULT NULL COMMENT '注册日期',
		  `T_REG_TIME` char(6) DEFAULT NULL COMMENT '注册时间',
		  `L_REG_OPERID` bigint(20) DEFAULT NULL COMMENT '注册人',
		  `C_REG_OPERNAME` varchar(120) DEFAULT NULL COMMENT '注册人名称',
		  `C_OPERORG` varchar(200) DEFAULT NULL COMMENT '核心企业的操作机构',
		  `C_BUSIN_STATUS` char(2) DEFAULT NULL COMMENT '状态  0： 不可用  1 正常使用',
		  PRIMARY KEY (`ID`),
		  KEY `inx_supplieroffer_tab_t_scf_supplier_offer_index` (`L_CUSTNO`,`L_CORE_CUSTNO`,`C_BUSIN_STATUS`) USING BTREE,
		  KEY `inx_supplieroffer_tab_cust_core_index` (`L_CUSTNO`,`L_CORE_CUSTNO`) USING BTREE
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	END IF;
END$$
call create_table_scf_supplier_offer()$$
drop PROCEDURE if EXISTS create_table_scf_supplier_offer$$


##-------给资产新增字段

drop PROCEDURE if EXISTS change_scfAsset_table_endDate$$
create procedure change_scfAsset_table_endDate() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset' AND COLUMN_NAME='D_END_DATE')
THEN   
   ALTER TABLE `t_scf_asset` ADD COLUMN `D_END_DATE` char(8) DEFAULT NULL COMMENT '融资到期时间';
END IF;
END$$
call change_scfAsset_table_endDate()$$
drop PROCEDURE if EXISTS change_scfAsset_table_endDate$$


drop PROCEDURE if EXISTS change_scfAsset_table_custBankName$$
create procedure change_scfAsset_table_custBankName() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset' AND COLUMN_NAME='c_cust_bankName')
THEN   
   ALTER TABLE `t_scf_asset` ADD COLUMN `c_cust_bankName` varchar(100) DEFAULT NULL COMMENT '供应商的银行名称';
END IF;
END$$
call change_scfAsset_table_custBankName()$$
drop PROCEDURE if EXISTS change_scfAsset_table_custBankName$$

drop PROCEDURE if EXISTS change_scfAsset_table_custBankAccount$$
create procedure change_scfAsset_table_custBankAccount() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset' AND COLUMN_NAME='c_cust_bankAccount')
THEN   
   ALTER TABLE `t_scf_asset` ADD COLUMN `c_cust_bankAccount` varchar(100) DEFAULT NULL COMMENT '供应商的银行帐户名称';
END IF;
END$$
call change_scfAsset_table_custBankAccount()$$
drop PROCEDURE if EXISTS change_scfAsset_table_custBankAccount$$

drop PROCEDURE if EXISTS change_scfAsset_table_custBankAccountName$$
create procedure change_scfAsset_table_custBankAccountName() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset' AND COLUMN_NAME='c_cust_bankAccountName')
THEN   
   ALTER TABLE `t_scf_asset` ADD COLUMN `c_cust_bankAccountName` varchar(100) DEFAULT NULL COMMENT '供应商的开户人名称';
END IF;
END$$
call change_scfAsset_table_custBankAccountName()$$
drop PROCEDURE if EXISTS change_scfAsset_table_custBankAccountName$$

drop PROCEDURE if EXISTS change_scfAsset_table_cforeCustBankName$$
create procedure change_scfAsset_table_cforeCustBankName() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset' AND COLUMN_NAME='c_corecust_bankName')
THEN   
   ALTER TABLE `t_scf_asset` ADD COLUMN `c_corecust_bankName` varchar(100) DEFAULT NULL COMMENT '核心企业的银行名称';
END IF;
END$$
call change_scfAsset_table_cforeCustBankName()$$
drop PROCEDURE if EXISTS change_scfAsset_table_cforeCustBankName$$

drop PROCEDURE if EXISTS change_scfAsset_table_cforeCustBankAccount$$
create procedure change_scfAsset_table_cforeCustBankAccount() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset' AND COLUMN_NAME='c_corecust_bankAccount')
THEN   
   ALTER TABLE `t_scf_asset` ADD COLUMN `c_corecust_bankAccount` varchar(100) DEFAULT NULL COMMENT '核心企业的银行帐户名称';
END IF;
END$$
call change_scfAsset_table_cforeCustBankAccount()$$
drop PROCEDURE if EXISTS change_scfAsset_table_cforeCustBankAccount$$


drop PROCEDURE if EXISTS change_scfAsset_table_cforeCustBankAccountName$$
create procedure change_scfAsset_table_cforeCustBankAccountName() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset' AND COLUMN_NAME='c_corecust_bankAccountName')
THEN   
   ALTER TABLE `t_scf_asset` ADD COLUMN `c_corecust_bankAccountName` varchar(100) DEFAULT NULL COMMENT '核心企业的开户人名称';
END IF;
END$$
call change_scfAsset_table_cforeCustBankAccountName()$$
drop PROCEDURE if EXISTS change_scfAsset_table_cforeCustBankAccountName$$


drop PROCEDURE if EXISTS change_scfAssetdaseDate_table_relationInfoId$$
create procedure change_scfAssetdaseDate_table_relationInfoId() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset_dasedata' AND COLUMN_NAME='L_RELATION_INFO_ID')
THEN   
   ALTER TABLE `t_scf_asset_dasedata` ADD COLUMN `L_RELATION_INFO_ID` bigint(20) DEFAULT NULL COMMENT '资产基础数据主键id';
END IF;
END$$
call change_scfAssetdaseDate_table_relationInfoId()$$
drop PROCEDURE if EXISTS change_scfAssetdaseDate_table_relationInfoId$$

drop PROCEDURE if EXISTS change_scfAssetCompany_table_bankName$$
create procedure change_scfAssetCompany_table_bankName() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset_company' AND COLUMN_NAME='c_bankName')
THEN   
   ALTER TABLE `t_scf_asset_company` ADD COLUMN `c_bankName` varchar(100) DEFAULT NULL COMMENT '开户银行行名称';
END IF;
END$$
call change_scfAssetCompany_table_bankName()$$
drop PROCEDURE if EXISTS change_scfAssetCompany_table_bankName$$


drop PROCEDURE if EXISTS change_scfAssetCompany_table_bankaccount$$
create procedure change_scfAssetCompany_table_bankaccount() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset_company' AND COLUMN_NAME='c_bankAccount')
THEN   
   ALTER TABLE `t_scf_asset_company` ADD COLUMN `c_bankAccount` varchar(100) DEFAULT NULL COMMENT '银行帐号';
END IF;
END$$
call change_scfAssetCompany_table_bankaccount()$$
drop PROCEDURE if EXISTS change_scfAssetCompany_table_bankaccount$$

drop PROCEDURE if EXISTS change_scfAssetCompany_table_bankaccountName$$
create procedure change_scfAssetCompany_table_bankaccountName() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset_company' AND COLUMN_NAME='c_bankAccountName')
THEN   
   ALTER TABLE `t_scf_asset_company` ADD COLUMN `c_bankAccountName` varchar(100) DEFAULT NULL COMMENT '开户人户名名称';
END IF;
END$$
call change_scfAssetCompany_table_bankaccountName()$$
drop PROCEDURE if EXISTS change_scfAssetCompany_table_bankaccountName$$


drop PROCEDURE if EXISTS change_custFileOrderCloumn_table_beginRow$$
create procedure change_custFileOrderCloumn_table_beginRow() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_file_ordercloumn' AND COLUMN_NAME='N_BEGIN_ROW')
THEN   
   ALTER TABLE `t_cust_file_ordercloumn` ADD COLUMN `N_BEGIN_ROW` int(4) DEFAULT NULL COMMENT '解析开始行';
END IF;
END$$
call change_custFileOrderCloumn_table_beginRow()$$
drop PROCEDURE if EXISTS change_custFileOrderCloumn_table_beginRow$$

drop PROCEDURE if EXISTS change_custFileOrderCloumn_table_EndRow$$
create procedure change_custFileOrderCloumn_table_EndRow() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_file_ordercloumn' AND COLUMN_NAME='N_END_ROW')
THEN   
   ALTER TABLE `t_cust_file_ordercloumn` ADD COLUMN `N_END_ROW` int(4) DEFAULT NULL COMMENT '末尾有几行数据无法使用';
END IF;
END$$
call change_custFileOrderCloumn_table_EndRow()$$
drop PROCEDURE if EXISTS change_custFileOrderCloumn_table_EndRow$$


drop PROCEDURE if EXISTS change_recievablev3_table_commissionfileid$$
create procedure change_recievablev3_table_commissionfileid() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_receivable_v3' AND COLUMN_NAME='L_CCOMMISSIONFILE_ID')
THEN   
   ALTER TABLE `t_scf_receivable_v3` ADD COLUMN `L_CCOMMISSIONFILE_ID` bigint(18) DEFAULT NULL COMMENT '佣金文件导入佣金文件id';
END IF;
END$$
call change_recievablev3_table_commissionfileid()$$
drop PROCEDURE if EXISTS change_recievablev3_table_commissionfileid$$



drop PROCEDURE if EXISTS create_table_scf_receivable_request$$
create procedure create_table_scf_receivable_request() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_receivable_request')
	THEN
		CREATE TABLE `t_scf_receivable_request` (
		  `C_REQUESTNO` char(18) NOT NULL COMMENT '申请编号',
		  `C_EQUITYNO` char(18) DEFAULT NULL COMMENT '融资编号',
		  `L_CUSTNO` bigint(20) DEFAULT NULL COMMENT '供应商编号',
		  `C_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '供应商名称',
		  `C_CUST_BANKACCOUNT` varchar(100) DEFAULT NULL COMMENT '收款帐号',
		  `C_CUST_BANKACCOUNTNAME` varchar(100) DEFAULT NULL COMMENT '收款开户名称',
		  `C_CUST_BANKNAME` varchar(100) DEFAULT NULL COMMENT '收款银行',
		  `L_CORE_CUSTNO` bigint(20) DEFAULT NULL COMMENT '核心企业编号',
		  `C_CORE_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '核心企业名称',
		  `N_BUSINTYPE_NO` int(4) DEFAULT NULL COMMENT '业务类型',
		  `L_ASSET_ID` bigint(20) DEFAULT NULL COMMENT '资产Id',
		  `F_BALANCE` decimal(16,2) DEFAULT NULL COMMENT '申请总金额',
		  `F_CUST_CORE_RATE` decimal(16,2) DEFAULT NULL COMMENT '核心企业提供的折扣率',
		  `F_REQUEST_PAY_BALANCE` decimal(16,2) DEFAULT NULL COMMENT '申请提前付款金额',
		  `F_CUST_OPAT_RATE` decimal(16,2) DEFAULT NULL COMMENT '平台提供利率',
		  `C_REQUEST_PAY_DATE` char(8) DEFAULT NULL COMMENT '提前付款日期',
		  `C_DESCRIPTION` varchar(1000) DEFAULT NULL COMMENT '备注',
		  `C_BUSINSTATUS` char(2) DEFAULT NULL COMMENT '状态 0 未生效 1供应商提交申请 2供应商签署合同 3 供应商转让合同给核心企业签署 4核心企业确认并签署合同 5资金方付款 6完结 7废止',
		  `C_OPERORG` varchar(200) DEFAULT NULL COMMENT '所属机构',
		  `L_OWN_COMPANY` bigint(20) DEFAULT NULL COMMENT '当前流程所属公司',
		  `D_REG_DATE` char(8) DEFAULT NULL COMMENT '申请日期',
		  `T_REG_TIME` char(6) DEFAULT NULL COMMENT '申请时间',
		  `D_END_DATE` char(8) DEFAULT NULL COMMENT '到期时间',
		  `F_REQUEST_PAY_PLAT_BALANCE` decimal(16,2) DEFAULT NULL COMMENT '付款给平台的钱',
		  `N_CORE_AGREEMENT_ID` bigint(20) DEFAULT NULL COMMENT '核心企业与供应商签订的合同id',
		  `N_PLAT_AGREEMENT_ID` bigint(20) DEFAULT NULL COMMENT '平台和供应商签订的合同id',
		  `C_RECEIVABLE_REQUEST_TYPE` char(2) DEFAULT NULL COMMENT '应收账款融资类型',
		  `L_FACTORY_CUSTNO` bigint(20) DEFAULT NULL COMMENT '保理公司编号',
		  `C_FACTORY_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '保理公司名称',
		  `N_REQUEST_BALANCE` decimal(16,2) DEFAULT NULL COMMENT '申请金额',
		  PRIMARY KEY (`C_REQUESTNO`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	END IF;
END$$
call create_table_scf_receivable_request()$$
drop PROCEDURE if EXISTS create_table_scf_receivable_request$$



drop PROCEDURE if EXISTS create_table_scf_receivable_request_agreement$$
create procedure create_table_scf_receivable_request_agreement() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_receivable_request_agreement')
	THEN
		CREATE TABLE `t_scf_receivable_request_agreement` (
		  `ID` bigint(18) NOT NULL COMMENT '编号',
		  `C_REF_NO` char(23) DEFAULT NULL COMMENT '合同凭证编号',
		  `C_AGREEMENT_CODE` char(23) DEFAULT NULL COMMENT '合同编号',
		  `L_CUSTNO` bigint(18) DEFAULT NULL COMMENT '供应商企业编号',
		  `C_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '供应商名称',
		  `L_CORE_CUSTNO` bigint(18) DEFAULT NULL COMMENT '核心企业编号',
		  `C_CORE_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '核心企业名称',
		  `C_AGREEMENT_NAME` varchar(255) DEFAULT NULL COMMENT '合同名称',
		  `C_BUSIN_STATUS` char(2) DEFAULT NULL COMMENT '状态 0 未签署  1供应商已签 2采购商已签 3 作废',
		  `D_CUST_DATE` char(8) DEFAULT NULL COMMENT '供应商签署日期',
		  `T_CUST_TIME` char(6) DEFAULT NULL COMMENT '供应商签署时间',
		  `D_CORE_DATE` char(8) DEFAULT NULL COMMENT '核心企业签署日期',
		  `T_CORE_TIME` char(6) DEFAULT NULL COMMENT '核心企业签署时间',
		  `L_CUST_OPERID` bigint(20) DEFAULT NULL COMMENT '供应商签署人名称',
		  `C_CUST_OPERNAME` varchar(120) DEFAULT NULL COMMENT '核心企业签署人名称',
		  `L_CORE_OPERID` bigint(20) DEFAULT NULL COMMENT '核心企业签署人名称',
		  `C_CORE_OPERNAME` varchar(120) DEFAULT NULL COMMENT '核心企业签署人名称',
		  `L_AGREEMENT_TEMPLATE_ID` bigint(20) DEFAULT NULL COMMENT '合同模版存放地址',
		  `F_BALANCE` decimal(16,2) DEFAULT NULL COMMENT '金额',
		  `L_RECEIVABLEREQUEST_NO` char(18) DEFAULT NULL COMMENT '融资申请编号',
		  `L_AGREEMENT_CONFIRM_FILE_ID` bigint(20) DEFAULT NULL COMMENT '各方签署合同的文件上传到服务器存放id',
		  `C_AGREEMENT_TYPE` char(2) DEFAULT NULL COMMENT '合同类型  0 企业金服平台  1 核心企业签订',
		  `D_SIGN_DATE` char(8) DEFAULT NULL COMMENT '合同最后签署日期',
		  PRIMARY KEY (`ID`),
		  KEY `inx_receivable_agreement_tab_core_cust_index` (`L_CUSTNO`,`L_CORE_CUSTNO`) USING BTREE,
		  KEY `inx_receivbale_agreement_coreCustBusin_index` (`L_CUSTNO`,`L_CORE_CUSTNO`,`C_BUSIN_STATUS`) USING BTREE
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	END IF;
END$$
call create_table_scf_receivable_request_agreement()$$
drop PROCEDURE if EXISTS create_table_scf_receivable_request_agreement$$


drop PROCEDURE if EXISTS create_table_scf_receivable_request_log$$
create procedure create_table_scf_receivable_request_log() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_receivable_request_log')
	THEN
		CREATE TABLE `t_scf_receivable_request_log` (
		  `ID` bigint(18) NOT NULL AUTO_INCREMENT,
		  `C_EQUITYNO` char(18) DEFAULT NULL COMMENT '融资编号',
		  `L_MODI_OPERID` bigint(20) DEFAULT NULL COMMENT '操作员Id',
		  `C_MODI_OPERNAME` varchar(120) DEFAULT NULL COMMENT '操作员名称',
		  `T_MODI_TIME` char(6) DEFAULT NULL COMMENT '操作时间',
		  `D_MODI_DATE` char(8) DEFAULT NULL COMMENT '操作日期',
		  `C_MODI_MESSAGE` varchar(500) DEFAULT NULL COMMENT '操作步骤信息',
		  `L_CUSTNO` bigint(18) DEFAULT NULL COMMENT '操作员所属公司',
		  `C_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '所属公司名称',
		  PRIMARY KEY (`ID`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	END IF;
END$$
call create_table_scf_receivable_request_log()$$
drop PROCEDURE if EXISTS create_table_scf_receivable_request_log$$



drop PROCEDURE if EXISTS change_recievablev3_table_custCoreRate$$
create procedure change_recievablev3_table_custCoreRate() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_receivable_v3' AND COLUMN_NAME='F_CUST_CORE_RATE')
THEN   
   ALTER TABLE `t_scf_receivable_v3` ADD COLUMN `F_CUST_CORE_RATE` decimal(16,2) DEFAULT NULL COMMENT '折扣率';
END IF;
END$$
call change_recievablev3_table_custCoreRate()$$
drop PROCEDURE if EXISTS change_recievablev3_table_custCoreRate$$


##---------模式2

drop PROCEDURE if EXISTS change_receivableRequestAgreement_table_factoryNo$$
create procedure change_receivableRequestAgreement_table_factoryNo() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_receivable_request_agreement' AND COLUMN_NAME='L_FACTORYNO')
THEN   
   ALTER TABLE `t_scf_receivable_request_agreement` ADD COLUMN `L_FACTORYNO` bigint(20) DEFAULT NULL COMMENT '保理公司Id';
END IF;
END$$
call change_receivableRequestAgreement_table_factoryNo()$$
drop PROCEDURE if EXISTS change_receivableRequestAgreement_table_factoryNo$$

drop PROCEDURE if EXISTS change_receivableRequestAgreement_table_factoryName$$
create procedure change_receivableRequestAgreement_table_factoryName() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_receivable_request_agreement' AND COLUMN_NAME='C_FACTORYNAME')
THEN   
   ALTER TABLE `t_scf_receivable_request_agreement` ADD COLUMN `C_FACTORYNAME` varchar(200) DEFAULT NULL COMMENT '保理公司名称';
END IF;
END$$
call change_receivableRequestAgreement_table_factoryName()$$
drop PROCEDURE if EXISTS change_receivableRequestAgreement_table_factoryName$$


drop PROCEDURE if EXISTS change_custRelation_table_isInside$$
create procedure change_custRelation_table_isInside() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_relation' AND COLUMN_NAME='C_IS_INSIDE')
THEN   
   ALTER TABLE `t_cust_relation` ADD COLUMN `C_IS_INSIDE` char(2) DEFAULT NULL COMMENT '企业内部资金提供方  0 不是   1 是';
END IF;
END$$
call change_custRelation_table_isInside()$$
drop PROCEDURE if EXISTS change_custRelation_table_isInside$$


drop PROCEDURE if EXISTS change_supplierOffer_table_operRole$$
create procedure change_supplierOffer_table_operRole() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_supplier_offer' AND COLUMN_NAME='C_OPER_ROLE')
THEN   
   ALTER TABLE `t_scf_supplier_offer` ADD COLUMN `C_OPER_ROLE` char(2) DEFAULT NULL COMMENT '新增利率的角色1 核心企业  2 平台   3 保理公司';
END IF;
END$$
call change_supplierOffer_table_operRole()$$
drop PROCEDURE if EXISTS change_supplierOffer_table_operRole$$


drop PROCEDURE if EXISTS change_receivableRequest_table_depositRate$$
create procedure change_receivableRequest_table_depositRate() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_receivable_request' AND COLUMN_NAME='F_DEPOSIT_RATE')
THEN   
   ALTER TABLE `t_scf_receivable_request` ADD COLUMN `F_DEPOSIT_RATE` decimal(16,2) DEFAULT NULL COMMENT '供应商折扣率';
END IF;
END$$
call change_receivableRequest_table_depositRate()$$
drop PROCEDURE if EXISTS change_receivableRequest_table_depositRate$$



drop PROCEDURE if EXISTS change_receivableRequest_table_requestproductCode$$
create procedure change_receivableRequest_table_requestproductCode() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_receivable_request' AND COLUMN_NAME='N_REQUEST_PRODUCT_CODE')
THEN   
   ALTER TABLE `t_scf_receivable_request` ADD COLUMN `N_REQUEST_PRODUCT_CODE` varchar(50) DEFAULT '' COMMENT '保理产品Id';
END IF;
END$$
call change_receivableRequest_table_requestproductCode()$$
drop PROCEDURE if EXISTS change_receivableRequest_table_requestproductCode$$


drop PROCEDURE if EXISTS change_productCOnfig_table_receivableType$$
create procedure change_productCOnfig_table_receivableType() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_product_config' AND COLUMN_NAME='C_RECEIVABLE_REQUEST_TYPE')
THEN   
   ALTER TABLE `t_scf_product_config` ADD COLUMN `C_RECEIVABLE_REQUEST_TYPE` char(2) DEFAULT NULL COMMENT '应收账款融资类型  1 采购方提前付款  2结算中心提前付款 3：内部保理付款  4 银行保理 5 外部保理付款';
END IF;
END$$
call change_productCOnfig_table_receivableType()$$
drop PROCEDURE if EXISTS change_productCOnfig_table_receivableType$$

drop PROCEDURE if EXISTS change_assetdict_table_assetinfotype$$
create procedure change_assetdict_table_assetinfotype() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_asset_dict' AND COLUMN_NAME='C_ASSET_INFO_TYPE')
THEN   
   ALTER TABLE `t_scf_asset_dict` ADD COLUMN `C_ASSET_INFO_TYPE` char(2) DEFAULT NULL COMMENT '关联的基础数据的类型1订单2票据3应收账款4发票5贸易合同6运输单单据类型';
END IF;
END$$
call change_assetdict_table_assetinfotype()$$
drop PROCEDURE if EXISTS change_assetdict_table_assetinfotype$$


drop PROCEDURE if EXISTS create_table_coreproduct_cust$$
create procedure create_table_coreproduct_cust() 
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_coreproduct_cust')
	THEN
		CREATE TABLE `t_scf_coreproduct_cust` (
		  `ID` bigint(20) NOT NULL COMMENT '主键Id',
		  `C_PRODUCT_NAME` varchar(50) DEFAULT NULL COMMENT '保理产品名称',
		  `C_PRODUCT_CODE` varchar(50) DEFAULT NULL COMMENT '保理产品编号',
		  `C_RECEIVABLE_REQUEST_TYPE` char(2) DEFAULT NULL COMMENT '融资申请类型 1 采购方提前付款  2结算中心提前付款 3：内部保理付款  4 银行保理 5 外部保理付款',
		  `L_FACTORY_CUSTNO` bigint(20) DEFAULT NULL COMMENT '资金方编号',
		  `C_FACTORY_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '资金方名称',
		  `L_CORE_CUSTNO` bigint(20) DEFAULT NULL COMMENT '核心企业编号',
		  `C_CORE_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '核心企业名称',
		  `L_CUSTNO` bigint(20) DEFAULT NULL COMMENT '供应商名称',
		  `C_CUSTNAME` varchar(120) DEFAULT NULL COMMENT '供应商名称',
		  `D_REG_DATE` char(8) DEFAULT NULL COMMENT '注册日期',
		  `T_REG_TIME` char(6) DEFAULT NULL COMMENT '注册时间',
		  `L_REG_OPERID` bigint(20) DEFAULT NULL COMMENT '注册人',
		  `C_REG_OPERNAME` varchar(120) DEFAULT NULL COMMENT '注册人名称',
		  `C_BUSIN_STATUS` char(2) DEFAULT NULL COMMENT '业务状态 0 不可用   1 未分配给供应商   2 已经分配给供应商',
		  `L_PRODUCT_ID` bigint(18) DEFAULT NULL COMMENT '保理产品Id',
		  PRIMARY KEY (`ID`),
		  KEY `inx_coreproductcust_table_cust_corecust_index` (`L_CORE_CUSTNO`,`L_CUSTNO`) USING BTREE
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	END IF;
END$$
call create_table_coreproduct_cust()$$
drop PROCEDURE if EXISTS create_table_coreproduct_cust$$



drop PROCEDURE if EXISTS change_receivablerequest_table_coreAgreementid$$
create procedure change_receivablerequest_table_coreAgreementid() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_receivable_request' AND COLUMN_NAME='N_CORE_AGREEMENT_ID')
THEN   
   ALTER TABLE `t_scf_receivable_request` ADD COLUMN `N_CORE_AGREEMENT_ID` varchar(40) DEFAULT NULL COMMENT '核心企业与供应商签订的合同id';
END IF;
END$$
call change_receivablerequest_table_coreAgreementid()$$
drop PROCEDURE if EXISTS change_receivablerequest_table_coreAgreementid$$















