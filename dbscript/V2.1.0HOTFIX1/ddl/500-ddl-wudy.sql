
	##文件审核表   提交日期2017/01/05
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit' AND COLUMN_NAME='C_OPERNO')
	THEN   
	   ALTER TABLE `t_cust_fileaduit` CHANGE COLUMN `C_OPERNO` `C_OPERNO` VARCHAR(20) NULL DEFAULT NULL ;
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$
	
