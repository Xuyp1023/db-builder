##-- DDL语句
##
##-- V1.0
##
-- 表结构非空修改		提交日期2016/11/18
ALTER TABLE `t_scf_receivable`
	CHANGE COLUMN `C_GOODSNAME` `C_GOODSNAME` VARCHAR(40) NULL COMMENT '商品名称' AFTER `C_DEBTOR`;