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







