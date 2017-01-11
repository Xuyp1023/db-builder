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
	
	
	