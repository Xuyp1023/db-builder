##-- 角色菜单关系表修改		提交日期2017/03/24
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cfg_menu_role' AND COLUMN_NAME='c_shirouser_type')
	THEN   
	   ALTER TABLE `t_cfg_menu_role` ADD COLUMN `c_shirouser_type` VARCHAR(100) NULL COMMENT '身份标识';
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$