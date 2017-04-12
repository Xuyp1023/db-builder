##-- DDL语句
##
##-- V1.0
##
##-- 表结构非空修改 提交日期2016/11/18


##-- task 194

drop PROCEDURE if EXISTS create_table_seq_record$$
	create procedure create_table_seq_record() 
	BEGIN
		IF NOT EXISTS (SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_seq_record')
		THEN
		CREATE TABLE `t_sys_seq_record` (
			`ID` BIGINT(18) NOT NULL AUTO_INCREMENT COMMENT '编号',
			`N_VERSION` BIGINT(20) NULL DEFAULT NULL COMMENT '数据版本号',
			`C_CYCLE` CHAR(1) NOT NULL DEFAULT 'Y' COMMENT '周期 D W M Y',
			`D_CYCLE_START_DATE` CHAR(8) NOT NULL COMMENT '周期开始时间',
			`N_NEXT_VALUE` BIGINT(18) NULL DEFAULT NULL,
			`N_INCREMENT_STEP` BIGINT(18) NULL DEFAULT NULL,
			`N_START_VALUE` BIGINT(18) NULL DEFAULT NULL,
			`N_MAX_VALUE` BIGINT(18) NULL DEFAULT NULL,
			`C_OPERORG` VARCHAR(50) NOT NULL DEFAULT 'DEFAULT' COMMENT '机构代码',
			`L_CUSTNO` BIGINT(18) NOT NULL DEFAULT '0' COMMENT '公司编号',
			`C_SEQ_ID` VARCHAR(20) NOT NULL COMMENT '序列号',
			PRIMARY KEY (`ID`),
			INDEX `seqId_operOrg_custNo` (`C_SEQ_ID`, `C_OPERORG`, `L_CUSTNO`)
		)
		COMMENT='序列号生成记录'
		COLLATE='utf8_general_ci'
		ENGINE=InnoDB;
		END IF;
	END$$
call create_table_seq_record()$$
drop PROCEDURE if EXISTS create_table_seq_record$$



