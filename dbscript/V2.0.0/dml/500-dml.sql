##-- DML���
##
##-- V1.0
##
-- ���ϵͳ����Ա��Ĭ��Ȩ��  �ύ����2016/11/15
delete from t_cfg_menu_role;
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`) VALUES (1, 'OPERATOR_ADMIN', NULL, 242, NULL, '1');
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`) VALUES (2, 'OPERATOR_ADMIN', NULL, 205, NULL, '1');
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`) VALUES (3, 'OPERATOR_ADMIN', NULL, 206, NULL, '1');
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`) VALUES (4, 'OPERATOR_ADMIN', NULL, 63, NULL, '1');
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`) VALUES (5, 'OPERATOR_ADMIN', NULL, 64, NULL, '1');
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`) VALUES (6, 'OPERATOR_ADMIN', NULL, 60, NULL, '1');

--�˵������޸� �ύ����2016/11/16
update t_cfg_menu set c_name='ѯ��',c_title='ѯ��' where id='218';
update t_cfg_menu set c_name='���ʻ���',c_title='���ʻ���' where id='221';


--bug-254 ��Ʊ���� ����������Ч �ύ����2016/11/16
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (60705, 'queryAcceptBill', 'GTEinvoiceDate', 5, '1');
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (60706, 'queryAcceptBill', 'LTEinvoiceDate', 6, '1');

--bug-286 �ֵ��޸� �ύ����2016/11/17
UPDATE `t_cfg_dictitem` SET `C_NAME`='��ҵ�жһ�Ʊ' WHERE  `ID`=1066;
UPDATE `t_cfg_dictitem` SET `C_NAME`='��ҵ�жһ�Ʊ' WHERE  `ID`=30037;
UPDATE `t_cfg_dictitem` SET `C_NAME`='���гжһ�Ʊ' WHERE  `ID`=1067;
UPDATE `t_cfg_dictitem` SET `C_NAME`='���гжһ�Ʊ' WHERE  `ID`=30038;

--bug-289 �޸Ĺ�Ӧ�̱��  �ύ����2016/11/17
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (60810, 'saveModifyOrder', 'custNO', 10, '1');
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (60410, 'saveModifyReceivable', 'coreCustNo', 10, '1');
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (60411, 'saveModifyReceivable', 'custNo', 11, '1');

-- �˵��޸�		�ύ����2016/11/18
update t_cfg_menu set c_rule_list='SUPPLIER_USER,SELLER_USER' where id=303;
delete from t_cfg_menu where id=309;
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (309, NULL, '��Ʊ����', '��Ʊ����', '../../scf2/views/core/bill/billManage.html', NULL, 223, 6, '', '1', '20161118', '20161118', NULL, '1', 'FACTOR_USER');

--�޸���֤ 	�ύ����2016/11/18
UPDATE `t_rule_validator` SET `C_MUSTITEM`='0' WHERE  `C_SYS`='SALE' AND `C_VALID_NAME`='agreeNo' AND `C_SHOW_NAME`='���׺�ͬ���' AND `C_NAME`='agreeNo' AND `C_MUSTITEM`='1' AND `C_DATA_TYPE`='C' AND `N_DATA_LEN`=40 AND `N_DATA_SCALE`=0 AND `F_MAX`=40 AND `F_MIN`=6 AND `C_VALIDATOR` IS NULL AND `C_PATTERN` IS NULL AND `D_REGDATE` IS NULL AND `D_MODIDATE` IS NULL AND `C_DESCRIPTION` IS NULL AND `C_BUSIN_FIELD` IS NULL AND `C_DEPENDS` IS NULL AND `C_MESSAGE` IS NULL AND `C_REF_VALUE` IS NULL LIMIT 1;