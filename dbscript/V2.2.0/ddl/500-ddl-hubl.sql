##-- 表结构非空修改		提交日期2017/01/05
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_request_notice' AND COLUMN_NAME='C_EMAIL')
	THEN   
	   ALTER TABLE `t_scf_request_notice` ADD COLUMN `C_EMAIL` VARCHAR(28) NULL COMMENT '邮件';
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$
	
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_request_notice' AND COLUMN_NAME='C_PHONE')
	THEN   
	   ALTER TABLE `t_scf_request_notice` ADD COLUMN `C_PHONE` VARCHAR(20) NULL COMMENT '联系电话';
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$
	
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_request_opinion' AND COLUMN_NAME='C_LINKNAME')
	THEN   
	   ALTER TABLE `t_scf_request_opinion` ADD COLUMN `C_LINKNAME` VARCHAR(32) NULL COMMENT '联系电话';
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$
	
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_request_opinion' AND COLUMN_NAME='C_EMAIL')
	THEN   
	   ALTER TABLE `t_scf_request_opinion` ADD COLUMN `C_EMAIL` VARCHAR(28) NULL COMMENT '邮件';
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$
	
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_request_opinion' AND COLUMN_NAME='C_PHONE')
	THEN   
	   ALTER TABLE `t_scf_request_opinion` ADD COLUMN `C_PHONE` VARCHAR(20) NULL COMMENT '联系电话';
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$
	
	
	
	
##-- 修改operNo 字段相关表 		提交日期2017/01/06
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit' AND COLUMN_NAME='C_OPERNO')
	THEN   
	   ALTER TABLE `t_cust_fileaduit` CHANGE COLUMN `C_OPERNO` `C_OPERNO` VARCHAR(18) NULL COMMENT '操作员编号';
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$
	
	
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit_temp' AND COLUMN_NAME='C_OPERNO')
	THEN   
	   ALTER TABLE `t_cust_fileaduit_temp` CHANGE COLUMN `C_OPERNO` `C_OPERNO` VARCHAR(18) NULL COMMENT '操作员编号';
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$
	
	
	
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_agreement' AND COLUMN_NAME='C_OPERNO')
	THEN   
	   ALTER TABLE `t_cust_agreement` CHANGE COLUMN `C_OPERNO` `C_OPERNO` VARCHAR(18) NULL COMMENT '操作员编号';
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$
	
	
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit_temp' AND COLUMN_NAME='C_ADUITORNO')
	THEN   
	   ALTER TABLE `t_cust_fileaduit_temp` CHANGE COLUMN `C_ADUITORNO` `C_ADUITORNO` VARCHAR(18) NULL COMMENT '操作员编号';
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$
	
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_agreement_stub' AND COLUMN_NAME='c_operno')
	THEN   
	   ALTER TABLE `t_scf_agreement_stub` CHANGE COLUMN `c_operno` `c_operno` VARCHAR(18) NULL COMMENT '操作员编号';
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$
	
	
	

##-- 创建贸易合同台账相关表	提交日期2017/02/08
drop PROCEDURE if EXISTS create_table_contractLedger$$
	create procedure create_table_contractLedger() 
	BEGIN
		IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_contract_ledger')
		THEN
		CREATE TABLE `t_contract_ledger` (
			`id` DECIMAL(10,0) NOT NULL COMMENT '流水号',
			`c_agreename` VARCHAR(100) NOT NULL COMMENT '合同名称',
			`c_agreeno` VARCHAR(40) NOT NULL COMMENT '合同编号',
			`c_supplier` VARCHAR(100) NOT NULL COMMENT '卖方',
			`c_buyer` VARCHAR(100) NOT NULL COMMENT '买方',
			`f_balance` DECIMAL(16,2) NULL DEFAULT NULL COMMENT '合同金额',
			`d_delivery_date` VARCHAR(8) NULL DEFAULT NULL COMMENT '交付日期',
			`c_delivery_addr` VARCHAR(100) NULL DEFAULT NULL COMMENT '交付地点',
			`c_check_accept` VARCHAR(20) NULL DEFAULT NULL COMMENT '验收方式',
			`c_objection_period` VARCHAR(10) NULL DEFAULT NULL COMMENT '提出异议期限',
			`d_agree_start_date` VARCHAR(8) NULL DEFAULT NULL COMMENT '合同起始日期',
			`d_agree_end_date` VARCHAR(8) NULL DEFAULT NULL COMMENT '合同截止日期',
			`d_regdate` VARCHAR(8) NULL DEFAULT NULL COMMENT '登记日期',
			`d_regtime` VARCHAR(8) NULL DEFAULT NULL COMMENT '登记时间',
			`d_modidate` VARCHAR(8) NULL DEFAULT NULL COMMENT '修改日期',
			`d_moditime` VARCHAR(8) NULL DEFAULT NULL COMMENT '修改时间',
			`c_busin_status` VARCHAR(2) NULL DEFAULT NULL COMMENT '状态；0登记，1生效，2作废',
			`l_buyer_no` DECIMAL(18,0) NULL DEFAULT NULL COMMENT '买方客户号',
			`l_supplier_no` DECIMAL(18,0) NULL DEFAULT NULL COMMENT '卖方客户号',
			`l_operid` BIGINT(18) NULL DEFAULT NULL COMMENT '操作员编号',
			`c_opername` VARCHAR(40) NULL DEFAULT NULL COMMENT '操作员名字',
			`c_operorg` VARCHAR(200) NULL DEFAULT NULL COMMENT '操作机构',
			`n_batchno` DECIMAL(18,0) NULL DEFAULT NULL COMMENT '上传的批次号，对应fileinfo中的ID',
			`c_default` CHAR(1) NULL DEFAULT NULL COMMENT '0系统加入，1前端加入',
			`c_describe` VARCHAR(200) NULL DEFAULT NULL COMMENT '描述',
			`d_signdate` VARCHAR(8) NULL DEFAULT NULL COMMENT '签暑日期',
			`c_sign_addr` VARCHAR(100) NULL DEFAULT NULL COMMENT '签订地点',
			PRIMARY KEY (`id`),
			INDEX `IDX_CONTRACT_LEDGER` (`c_agreeno`)
		);
		END IF;
	END$$
call create_table_contractLedger()$$
drop PROCEDURE if EXISTS create_table_contractLedger$$

drop PROCEDURE if EXISTS create_table_contractLedgerCust$$
	create procedure create_table_contractLedgerCust() 
	BEGIN
		IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_contract_ledger_cust')
		THEN
		CREATE TABLE `t_contract_ledger_cust` (
			`l_custNo` DECIMAL(18,0) NOT NULL COMMENT '客户号',
			`l_contractId` DECIMAL(18,0) NULL DEFAULT NULL COMMENT '合同台账编号',
			`c_custName` VARCHAR(100) NULL DEFAULT NULL COMMENT '客户名称',
			`c_representative` VARCHAR(100) NULL DEFAULT NULL COMMENT '授权代表人',
			`c_bankName` VARCHAR(100) NULL DEFAULT NULL COMMENT '开户行名称',
			`c_bankAccount` VARCHAR(50) NULL DEFAULT NULL COMMENT '银行账号',
			`c_tax_code` VARCHAR(50) NULL DEFAULT NULL COMMENT '税务登记证号',
			`c_phone` VARCHAR(20) NULL DEFAULT NULL COMMENT '联系电话',
			`c_fax` VARCHAR(20) NULL DEFAULT NULL COMMENT '传真',
			`c_address` VARCHAR(200) NULL DEFAULT NULL COMMENT '地址',
			`c_email` VARCHAR(20) NULL DEFAULT NULL COMMENT '邮编',
			`c_busin_status` VARCHAR(2) NULL DEFAULT NULL COMMENT '状态 0不可用，1可用',
			`c_reg_date` VARCHAR(8) NULL DEFAULT NULL COMMENT '注册日期',
			`c_reg_time` VARCHAR(8) NULL DEFAULT NULL COMMENT '注册时间',
			`c_bankAccountName` VARCHAR(100) NULL DEFAULT NULL COMMENT '户名',
			INDEX `idx_cust_contract` (`l_custNo`, `l_contractId`)
		);
		END IF;
	END$$
call create_table_contractLedgerCust()$$
drop PROCEDURE if EXISTS create_table_contractLedgerCust$$


drop PROCEDURE if EXISTS create_table_contractLedgerRecode$$
	create procedure create_table_contractLedgerRecode() 
	BEGIN
		IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_contract_ledger_recode')
		THEN
		CREATE TABLE `t_contract_ledger_recode` (
			`id` DECIMAL(18,0) NOT NULL COMMENT '流水号',
			`l_contractId` DECIMAL(18,0) NOT NULL COMMENT '合同台账编号',
			`L_OPERID` BIGINT(18) NULL DEFAULT NULL COMMENT '操作人ID',
			`C_OPERNAME` VARCHAR(40) NULL DEFAULT NULL COMMENT '操作人名字',
			`D_OPER_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '操作日期',
			`D_OPER_TIME` VARCHAR(8) NULL DEFAULT NULL COMMENT '操作时间',
			`C_BUSIN_STATUS` VARCHAR(2) NULL DEFAULT NULL COMMENT '操作状态.0登记，1审核，2作废，3编辑，4取消审核',
			`C_OPERORG` VARCHAR(200) NULL DEFAULT NULL COMMENT '操作机构',
			PRIMARY KEY (`id`)
		);
		END IF;
	END$$
call create_table_contractLedgerRecode()$$
drop PROCEDURE if EXISTS create_table_contractLedgerRecode$$