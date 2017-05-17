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

