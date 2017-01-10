## 创建合同类型表
drop PROCEDURE if EXISTS add_table$$
create procedure add_table() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_agreement_type')
	THEN   
	   CREATE TABLE `t_scf_agreement_type` (
			`ID` BIGINT(18) NOT NULL COMMENT '编号',
			`C_AGREEMENT_TYPE_NO` VARCHAR(20) NOT NULL COMMENT '合同类型编号',
			`C_AGREEMENT_TYPE_NAME` VARCHAR(50) NOT NULL COMMENT '合同类型名称',
			`C_DESCRIPTION` VARCHAR(200) NULL DEFAULT NULL COMMENT '备注',
			`C_BUSIN_STATUS` VARCHAR(2) NULL DEFAULT NULL COMMENT '状态  0登记 1生效',
			`C_DATA_SOURCE` CHAR(1) NULL DEFAULT NULL COMMENT '数据来源:0:默认,1:手动录入',
			`C_OPERORG` VARCHAR(200) NULL DEFAULT NULL COMMENT '操作机构',
			`L_REG_OPERID` BIGINT(18) NULL DEFAULT '0' COMMENT '创建人(操作员)ID号',
			`C_REG_OPERNAME` VARCHAR(40) NULL DEFAULT NULL COMMENT '创建人(操作员)姓名',
			`D_REG_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '创建日期',
			`T_REG_TIME` VARCHAR(8) NULL DEFAULT NULL COMMENT '创建时间',
			`L_MODI_OPERID` BIGINT(18) NULL DEFAULT '0' COMMENT '修改人(操作员)ID号',
			`C_MODI_OPERNAME` VARCHAR(40) NULL DEFAULT NULL COMMENT '修改人(操作员)姓名',
			`D_MODI_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '修改日期',
			`T_MODI_TIME` VARCHAR(8) NULL DEFAULT NULL COMMENT '修改时间',
			`L_AUDIT_OPERID` BIGINT(18) NULL DEFAULT '0' COMMENT '审核人(操作员)ID号',
			`C_AUDIT_OPERNAME` VARCHAR(40) NULL DEFAULT NULL COMMENT '审核人(操作员)姓名',
			`D_AUDIT_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '审核日期',
			`T_AUDIT_TIME` VARCHAR(8) NULL DEFAULT NULL COMMENT '审核时间',
			PRIMARY KEY (`ID`),
			INDEX `AGREEMENT_TYPE_NO` (`C_AGREEMENT_TYPE_NO`)
		);
	END IF;
	END$$
	call add_table()$$
	drop PROCEDURE if EXISTS add_table$$
	
	
## 创建标准合同
drop PROCEDURE if EXISTS add_table$$
create procedure add_table() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_agreement_standard')
	THEN   
	   CREATE TABLE `t_scf_agreement_standard` (
			`ID` BIGINT(18) NOT NULL COMMENT '编号',
			`C_AGREEMENT_STANDARD_NO` VARCHAR(20) NOT NULL COMMENT '标准合同编号',
			`C_AGREEMENT_TYPE_ID` VARCHAR(20) NOT NULL COMMENT '合同类型id',
			`C_AGREEMENT_STANDARD_NAME` VARCHAR(50) NOT NULL COMMENT '标准合同名称',
			`C_DESCRIPTION` VARCHAR(200) NULL DEFAULT NULL COMMENT '备注',
			`C_OPERORG` VARCHAR(200) NULL DEFAULT NULL COMMENT '操作机构',
			`C_BUSIN_STATUS` VARCHAR(2) NULL DEFAULT NULL COMMENT '状态  0登记 1生效 2停用',
			`L_REG_OPERID` BIGINT(18) NULL DEFAULT '0' COMMENT '创建人(操作员)ID号',
			`C_REG_OPERNAME` VARCHAR(40) NULL DEFAULT NULL COMMENT '创建人(操作员)姓名',
			`D_REG_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '创建日期',
			`T_REG_TIME` VARCHAR(8) NULL DEFAULT NULL COMMENT '创建时间',
			`L_MODI_OPERID` BIGINT(18) NULL DEFAULT '0' COMMENT '修改人(操作员)ID号',
			`C_MODI_OPERNAME` VARCHAR(40) NULL DEFAULT NULL COMMENT '修改人(操作员)姓名',
			`D_MODI_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '修改日期',
			`T_MODI_TIME` VARCHAR(8) NULL DEFAULT NULL COMMENT '修改时间',
			`L_AUDIT_OPERID` BIGINT(18) NULL DEFAULT '0' COMMENT '审核人(操作员)ID号',
			`C_AUDIT_OPERNAME` VARCHAR(40) NULL DEFAULT NULL COMMENT '审核人(操作员)姓名',
			`D_AUDIT_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '审核日期',
			`T_AUDIT_TIME` VARCHAR(8) NULL DEFAULT NULL COMMENT '审核时间',
			PRIMARY KEY (`ID`),
			INDEX `AGREEMENT_STANDARD_NO` (`C_AGREEMENT_STANDARD_NO`)
		);
	END IF;
	END$$
	call add_table()$$
	drop PROCEDURE if EXISTS add_table$$
	
	##操作员字段长度   提交日期2017/01/05
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit' AND COLUMN_NAME='C_OPERNO')
	THEN   
	   ALTER TABLE `t_cust_fileaduit` CHANGE COLUMN `C_OPERNO` `C_OPERNO` VARCHAR(20) NULL DEFAULT NULL ;
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$