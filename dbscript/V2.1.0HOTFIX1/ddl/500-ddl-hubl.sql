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
	
	
	