##-- 
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_temp_cust_enroll' AND COLUMN_NAME='ID')
	THEN   
	   ALTER TABLE `t_temp_cust_enroll` CHANGE `ID` `ID` BIGINT(30);
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$