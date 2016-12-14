##-- �ļ����ͱ��������ֶ�������ļ�����	�ύ����2016/12/14s
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cfg_auth_filegroup' AND COLUMN_NAME='c_permit_filetypes')
	THEN   
		ALTER TABLE `t_cfg_auth_filegroup`	ADD COLUMN `c_permit_filetypes` VARCHAR(100) NULL DEFAULT NULL COMMENT '������������ļ����ͣ����ʹ�ö��ŷָ���Ĭ����ȫ��ƽ̨���������' AFTER `c_storepath`;
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$

