##-- DDL语句
##
##-- V2.2.1
##
##-- scf 资金系统数据推送 处理 优化



DROP PROCEDURE IF EXISTS change_scf_table_col$$
create procedure change_scf_table_col() BEGIN  
 
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_accept_bill' AND COLUMN_NAME='C_CORE_OPERORG')
THEN   
   ALTER TABLE `t_scf_accept_bill`	ADD COLUMN `C_CORE_OPERORG` VARCHAR(200) NULL DEFAULT NULL AFTER `C_OPERORG`;
END IF;

IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_supplier' AND COLUMN_NAME='C_CORE_OPERORG')
THEN   
   ALTER TABLE `t_scf_supplier`	ADD COLUMN `C_CORE_OPERORG` VARCHAR(200) NULL DEFAULT NULL AFTER `C_OPERORG`;
END IF;

IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_bank' AND COLUMN_NAME='C_CORE_OPERORG')
THEN   
   ALTER TABLE `t_scf_bank`	ADD COLUMN `C_CORE_OPERORG` VARCHAR(200) NULL DEFAULT NULL AFTER `C_OPERORG`;
END IF;

IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_bank_flow' AND COLUMN_NAME='C_CORE_OPERORG')
THEN   
   ALTER TABLE `t_scf_bank_flow`	ADD COLUMN `C_CORE_OPERORG` VARCHAR(200) NULL DEFAULT NULL AFTER `C_OPERORG`;
END IF;

IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_capital_flow' AND COLUMN_NAME='C_CORE_OPERORG')
THEN   
   ALTER TABLE `t_scf_capital_flow`	ADD COLUMN `C_CORE_OPERORG` VARCHAR(200) NULL DEFAULT NULL AFTER `C_OPERORG`;
END IF;

IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_core_corp' AND COLUMN_NAME='C_OPERORG')
THEN   
   ALTER TABLE `t_cust_core_corp`	ADD COLUMN `C_OPERORG` VARCHAR(200) NULL DEFAULT NULL;
END IF;

END$$
CALL change_scf_table_col()$$
DROP PROCEDURE IF EXISTS change_scf_table_col$$

