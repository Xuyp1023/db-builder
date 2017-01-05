##-- 创建附件关系审核临时表	提交日期2016/12/16
drop PROCEDURE if EXISTS create_table_custFileAduitTemp$$
	create procedure create_table_custFileAduitTemp() 
	BEGIN
		drop table t_cust_fileaduit_temp;
		CREATE TABLE `t_cust_fileaduit_temp` (
		`ID` DECIMAL(18,0) NULL DEFAULT NULL,
		`L_CUSTNO` DECIMAL(18,0) NULL DEFAULT NULL,
		`N_COUNT` DECIMAL(5,0) NULL DEFAULT NULL,
		`C_STATUS` VARCHAR(1) NULL DEFAULT NULL,
		`C_TYPE` VARCHAR(60) NULL DEFAULT NULL,
		`C_DESCRIPTION` VARCHAR(200) NULL DEFAULT NULL,
		`D_REGDATE` VARCHAR(8) NULL DEFAULT NULL,
		`D_REGTIME` VARCHAR(8) NULL DEFAULT NULL,
		`D_MODIDATE` VARCHAR(15) NULL DEFAULT NULL,
		`C_OPERNO` VARCHAR(8) NULL DEFAULT NULL,
		`L_ADUIT_CUSTNO` DECIMAL(18,0) NULL DEFAULT NULL,
		`C_ADUITORNO` VARCHAR(8) NULL DEFAULT NULL,
		`D_ADUIT_DATE` VARCHAR(15) NULL DEFAULT NULL,
		UNIQUE INDEX `PK_CUST_FILEADUIT` (`ID`, `L_CUSTNO`, `C_TYPE`)
		);
	END$$
call create_table_custFileAduitTemp()$$
drop PROCEDURE if EXISTS create_table_custFileAduitTemp$$


##-- 表结构非空修改		提交日期2017/01/05
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_request_notice' AND COLUMN_NAME='C_EMAIL')
	THEN   
	   ALTER TABLE `t_scf_request_notice` CHANGE COLUMN `C_EMAIL` `C_EMAIL` VARCHAR(28) NULL COMMENT '邮件';
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$
	
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_request_notice' AND COLUMN_NAME='C_PHONE')
	THEN   
	   ALTER TABLE `t_scf_request_notice` CHANGE COLUMN `C_PHONE` `C_PHONE` VARCHAR(20) NULL COMMENT '联系电话';
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$
	
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_request_opinion' AND COLUMN_NAME='C_LINKNAME')
	THEN   
	   ALTER TABLE `t_scf_request_opinion` CHANGE COLUMN `C_LINKNAME` `C_LINKNAME` VARCHAR(32) NULL COMMENT '联系电话';
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$
	
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_request_opinion' AND COLUMN_NAME='C_EMAIL')
	THEN   
	   ALTER TABLE `t_scf_request_opinion` CHANGE COLUMN `C_EMAIL` `C_EMAIL` VARCHAR(28) NULL COMMENT '邮件';
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$
	
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_request_opinion' AND COLUMN_NAME='C_PHONE')
	THEN   
	   ALTER TABLE `t_scf_request_opinion` CHANGE COLUMN `C_PHONE` `C_PHONE` VARCHAR(20) NULL COMMENT '联系电话';
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$
	
	
	