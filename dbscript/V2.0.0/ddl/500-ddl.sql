##-- DDL���
##
##-- V1.0
##
-- ��ṹ�ǿ��޸�		�ύ����2016/11/18
ALTER TABLE `t_scf_receivable`
	CHANGE COLUMN `C_GOODSNAME` `C_GOODSNAME` VARCHAR(40) NULL COMMENT '��Ʒ����' AFTER `C_DEBTOR`;