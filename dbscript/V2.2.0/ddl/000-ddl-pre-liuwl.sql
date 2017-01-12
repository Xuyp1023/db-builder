##-- 前置DDL语句
##
##-- V1.0
##

## task-153  为t_sys_wf_base表添加 C_WECHAT_FORM 字段
drop PROCEDURE if EXISTS change_table_col_wechatform$$
create procedure change_table_col_wechatform() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_wf_base' AND COLUMN_NAME='C_WECHAT_FORM')
THEN   
   ALTER TABLE `t_sys_wf_base` ADD COLUMN `C_WECHAT_FORM`  VARCHAR(120) NULL COMMENT '微信表单' AFTER `C_FORM`;
END IF;
END$$
call change_table_col_wechatform()$$
drop PROCEDURE if EXISTS change_table_col_wechatform$$

## task-153  为t_sys_wf_node表添加 C_WECHAT_FORM 字段
drop PROCEDURE if EXISTS change_table_col_wechatform$$
create procedure change_table_col_wechatform() BEGIN   
IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_sys_wf_node' AND COLUMN_NAME='C_WECHAT_FORM')
THEN   
   ALTER TABLE `t_sys_wf_node` ADD COLUMN `C_WECHAT_FORM`  VARCHAR(120) NULL COMMENT '微信表单' AFTER `C_FORM`;
END IF;
END$$
call change_table_col_wechatform()$$
drop PROCEDURE if EXISTS change_table_col_wechatform$$