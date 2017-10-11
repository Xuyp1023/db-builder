##-- DDL语句
##
##-- V1.0
##
##-- 表结构非空修改 提交日期2017/10/11

##-- 给标准合同表增加备注字段
drop PROCEDURE if EXISTS change_contrant_table_remark_col$$
create procedure change_contrant_table_remark_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_standard_type' AND COLUMN_NAME='C_DESCRIPTION')
THEN   
   ALTER TABLE `t_sys_contract_standard_type` ADD COLUMN `C_DESCRIPTION` char(200) DEFAULT NULL COMMENT '备注';
END IF;
END$$
call change_contrant_table_remark_col()$$
drop PROCEDURE if EXISTS change_contrant_table_remark_col$$

##-- 给标准合同表增加登记时间字段
drop PROCEDURE if EXISTS change_contrant_table_regdate_col$$
create procedure change_contrant_table_regdate_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_standard_type' AND COLUMN_NAME='D_REG_DATE')
THEN   
   ALTER TABLE `t_sys_contract_standard_type` ADD COLUMN `D_REG_DATE` char(16) DEFAULT NULL COMMENT '登记时间';
END IF;
END$$
call change_contrant_table_regdate_col()$$
drop PROCEDURE if EXISTS change_contrant_table_regdate_col$$

##-- 给标准合同表增加合同名称字段
drop PROCEDURE if EXISTS change_contrant_table_typeid_name_col$$
create procedure change_contrant_table_typeid_name_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_standard_type' AND COLUMN_NAME='C_TYPEID_NAME')
THEN   
   ALTER TABLE `t_sys_contract_standard_type` ADD COLUMN `C_TYPEID_NAME` char(50) DEFAULT NULL COMMENT '合同类型名称';
END IF;
END$$
call change_contrant_table_typeid_name_col()$$
drop PROCEDURE if EXISTS change_contrant_table_typeid_name_col$$

##-- 给保理机构合同关联表增加合同名称字段
drop PROCEDURE if EXISTS change_contrant_template_table_typeid_name_col$$
create procedure change_contrant_template_table_typeid_name_col() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_contract_template' AND COLUMN_NAME='C_TYPEID_NAME')
THEN   
   ALTER TABLE `t_sys_contract_template` ADD COLUMN `C_TYPEID_NAME` char(50) DEFAULT NULL COMMENT '合同类型名称';
END IF;
END$$
call change_contrant_template_table_typeid_name_col()$$
drop PROCEDURE if EXISTS change_contrant_template_table_typeid_name_col$$





