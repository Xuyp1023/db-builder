##-- 表结构非空修改		提交日期2016/11/18s
	delimiter $$
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cfg_auth_filegroup' AND COLUMN_NAME='c_permit_filetypes')
	THEN   
		ALTER TABLE `t_cfg_auth_filegroup`	ADD COLUMN `c_permit_filetypes` VARCHAR(100) NULL DEFAULT NULL COMMENT '该类型允许的文件类型，多个使用逗号分隔，默认是全部平台允许的类型' AFTER `c_storepath`;
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$

