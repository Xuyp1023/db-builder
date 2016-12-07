##-- DML���
##
##-- V1.0
##
##-- ���ϵͳ����Ա��Ĭ��Ȩ��  �ύ����2016/11/15
delete from t_cfg_menu_role;
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`) VALUES (1, 'OPERATOR_ADMIN', NULL, 242, NULL, '1');
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`) VALUES (2, 'OPERATOR_ADMIN', NULL, 205, NULL, '1');
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`) VALUES (3, 'OPERATOR_ADMIN', NULL, 206, NULL, '1');
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`) VALUES (4, 'OPERATOR_ADMIN', NULL, 63, NULL, '1');
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`) VALUES (5, 'OPERATOR_ADMIN', NULL, 64, NULL, '1');
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`) VALUES (6, 'OPERATOR_ADMIN', NULL, 60, NULL, '1');

##--�˵������޸� �ύ����2016/11/16
update t_cfg_menu set c_name='ѯ��',c_title='ѯ��' where id='218';
update t_cfg_menu set c_name='���ʻ���',c_title='���ʻ���' where id='221';


##--bug-254 ��Ʊ���� ����������Ч �ύ����2016/11/16
delete from `t_rule_busin_validator` where id in (60705,60706);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (60705, 'queryAcceptBill', 'GTEinvoiceDate', 5, '1');
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (60706, 'queryAcceptBill', 'LTEinvoiceDate', 6, '1');

##--bug-286 �ֵ��޸� �ύ����2016/11/17
UPDATE `t_cfg_dictitem` SET `C_NAME`='��ҵ�жһ�Ʊ' WHERE  `ID`=1066;
UPDATE `t_cfg_dictitem` SET `C_NAME`='��ҵ�жһ�Ʊ' WHERE  `ID`=30037;
UPDATE `t_cfg_dictitem` SET `C_NAME`='���гжһ�Ʊ' WHERE  `ID`=1067;
UPDATE `t_cfg_dictitem` SET `C_NAME`='���гжһ�Ʊ' WHERE  `ID`=30038;

##--bug-289 �޸Ĺ�Ӧ�̱��  �ύ����2016/11/17
delete from `t_rule_busin_validator` where id in (60810,60410,60411);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (60810, 'saveModifyOrder', 'custNO', 10, '1');
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (60410, 'saveModifyReceivable', 'coreCustNo', 10, '1');
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (60411, 'saveModifyReceivable', 'custNo', 11, '1');

##-- �˵��޸�		�ύ����2016/11/18
update t_cfg_menu set c_rule_list='SUPPLIER_USER,SELLER_USER' where id=303;
delete from t_cfg_menu where id=309;
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (309, NULL, '��Ʊ����', '��Ʊ����', '../../scf2/views/core/bill/billManage.html', NULL, 223, 6, '', '1', '20161118', '20161118', NULL, '1', 'FACTOR_USER');

##--�޸���֤ 	�ύ����2016/11/18
UPDATE `t_rule_validator` SET `C_MUSTITEM`='0' WHERE  `C_SYS`='SALE' AND `C_VALID_NAME`='agreeNo' AND `C_SHOW_NAME`='���׺�ͬ���' AND `C_NAME`='agreeNo' AND `C_MUSTITEM`='1' AND `C_DATA_TYPE`='C' AND `N_DATA_LEN`=40 AND `N_DATA_SCALE`=0 AND `F_MAX`=40 AND `F_MIN`=6 AND `C_VALIDATOR` IS NULL AND `C_PATTERN` IS NULL AND `D_REGDATE` IS NULL AND `D_MODIDATE` IS NULL AND `C_DESCRIPTION` IS NULL AND `C_BUSIN_FIELD` IS NULL AND `C_DEPENDS` IS NULL AND `C_MESSAGE` IS NULL AND `C_REF_VALUE` IS NULL LIMIT 1;

##--�˵��޸�  �ύ����2016/11/21
UPDATE `t_cfg_menu` SET `c_url`='../../scf2/views/sfccom/invoice/InvoiceManage.html' WHERE  `id`=309;

##--��ӿͻ���ϵ�ֵ�״̬�� �ύ���� 2016/11/23
delete from t_cfg_dict where id in (50007,50008,50009);
INSERT INTO `t_cfg_dict` (`ID`, `C_SYS`, `C_NAME`, `C_GROUP`, `C_MODIFY`, `C_DESCRIPTION`, `C_OWNER`, `D_MODIDATE`, `C_SCRIPT`, `C_CODE`) VALUES (50007, '4', '�ͻ���ϵ-��Ӧ����ʾ״̬', '5', '0', NULL, NULL, '20161123', '1', 'SupplierStatus');
INSERT INTO `t_cfg_dict` (`ID`, `C_SYS`, `C_NAME`, `C_GROUP`, `C_MODIFY`, `C_DESCRIPTION`, `C_OWNER`, `D_MODIDATE`, `C_SCRIPT`, `C_CODE`) VALUES (50008, '4', '�ͻ���ϵ-������ҵ��ʾ״̬', '5', '0', NULL, NULL, '20161123', '1', 'CoreStatus');
INSERT INTO `t_cfg_dict` (`ID`, `C_SYS`, `C_NAME`, `C_GROUP`, `C_MODIFY`, `C_DESCRIPTION`, `C_OWNER`, `D_MODIDATE`, `C_SCRIPT`, `C_CODE`) VALUES (50009, '4', '�ͻ���ϵ-��������ʾ״̬', '5', '0', NULL, NULL, '20161123', '1', 'SellerStatus');
delete from t_cfg_dictitem where L_ITEMNO in (50007,50008,50009);
INSERT INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (50018, 50007, '0', NULL, '����˾', NULL, 0, '1', '0', NULL, '1');
INSERT INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (50019, 50007, '1', NULL, '������ҵ', NULL, 0, '1', '0', NULL, '1');
INSERT INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (50020, 50007, '5', NULL, '���Ӻ�ͬ������', NULL, 0, '1', '0', NULL, '1');
INSERT INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (50021, 50008, '1', NULL, '��Ӧ��', NULL, 0, '1', '0', NULL, '1');
INSERT INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (50022, 50008, '2', NULL, '����˾', NULL, 0, '1', '0', NULL, '1');
INSERT INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (50023, 50008, '4', NULL, '������', NULL, 0, '1', '0', NULL, '1');
INSERT INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (50024, 50008, '5', NULL, '���Ӻ�ͬ������', NULL, 0, '1', '0', NULL, '1');
INSERT INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (50025, 50009, '3', NULL, '����˾', NULL, 0, '1', '0', NULL, '1');
INSERT INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (50026, 50009, '4', NULL, '������ҵ', NULL, 0, '1', '0', NULL, '1');
INSERT INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (50027, 50009, '5', NULL, '���Ӻ�ͬ������', NULL, 0, '1', '0', NULL, '1');
##--��ӹ�ϵ�˵� �ύ���� 2016/11/23
delete from t_cfg_menu where id=310;
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (310, NULL, '�ͻ���ϵ����', '�ͻ���ϵ����', '../../scf2/home.html#/customerRelation/coreRelationManage', NULL, 20, 7, '', '1', '20161122', '20161122', NULL, '1', 'SUPPLIER_USER,CORE_USER,SELLER_USER');


##��������������   �ύ���� 2016/11/25
delete from `t_rule_busin` where C_NAME = 'saveOpenAccountApply' and id = 60036;
INSERT INTO `t_rule_busin` (`C_NAME`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_FUNC`, `C_ENTITY`) VALUES ('saveOpenAccountApply', NULL, '��������', '1', '20160727', '20160727', 60036, 'ICustOpenAccountService2.webSaveOpenAccountApply', 'com.betterjr.modules.customer.entity.CustOpenAccountTmp');
delete from `t_rule_validator` where C_VALID_NAME in ('acc-taxNo','acc-openLicense');
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `D_REGDATE`, `C_DESCRIPTION`) VALUES ('SCF', 'acc-taxNo', '˰��Ǽ�֤����', 'taxNo', '0', 'C', 30, 0, 30, '20161122', '�ʱ�');
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `D_REGDATE`, `C_DESCRIPTION`) VALUES ('SCF', 'acc-openLicense', '�������֤��׼��', 'openLicense', '0', 'C', 30, 0, 30, '20161122', '�ʱ�');
delete from `t_rule_busin_validator` where id in(10182,10183);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (10182, 'saveOpenAccountApply', 'acc-taxNo', 27, '1');
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (10183, 'saveOpenAccountApply', 'acc-openLicense', 28, '1');

##�����ݴ�������  �ύ���� 2016/11/25
delete from `t_rule_busin` where id = 10020;
INSERT INTO `t_rule_busin` (`C_NAME`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_FUNC`, `C_ENTITY`) VALUES ('saveOpenAccountInfo', NULL, '�ͻ����������ݴ�', '1', '20160727', '20160727', 10020, 'ICustOpenAccountService2.webSaveOpenAccountInfo', 'com.betterjr.modules.customer.entity.CustOpenAccountTmp');
delete from `t_rule_validator` where C_VALID_NAME in ('acc-role','acc-dealPassword','acc-wechatOpenId');
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `D_REGDATE`, `C_DESCRIPTION`) VALUES ('SCF', 'acc-role', '�ͻ���ɫ', 'role', '0', 'C', 30, 0, 30, 0, '20160718', '�����˻�');
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `D_REGDATE`, `C_DESCRIPTION`) VALUES ('SCF', 'acc-dealPassword', '��������', 'dealPassword', '0', 'C', 30, 0, 30, 0, '20160718', '�����˻�');
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `D_REGDATE`, `C_DESCRIPTION`) VALUES ('SCF', 'acc-wechatOpenId', '΢�ű�ʶ��', 'wechatOpenId', '0', 'C', 30, 0, 30, 0, '20160718', '�����˻�');
delete from `t_rule_busin_validator` where id in (10201,10202,10203);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (10201, 'saveOpenAccountInfo', 'acc-role', 27, '1');
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (10202, 'saveOpenAccountInfo', 'acc-dealPassword', 28, '1');
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (10203, 'saveOpenAccountInfo', 'acc-wechatOpenId', 29, '1');
##�����ֶ�ȡ��  �ύ���� 2016/11/25
UPDATE `t_rule_validator` SET `C_MUSTITEM`='0' WHERE  `C_SYS`='SCF' AND `C_VALID_NAME`='acc-bankName' AND `C_SHOW_NAME`='��������ȫ��' AND `C_NAME`='bankName' AND `C_MUSTITEM`='1' AND `C_DATA_TYPE`='C' AND `N_DATA_LEN`=100 AND `N_DATA_SCALE`=0 AND `F_MAX`=100 AND `F_MIN`=5 AND `C_VALIDATOR` IS NULL AND `C_PATTERN` IS NULL AND `D_REGDATE`='20160718' AND `D_MODIDATE` IS NULL AND `C_DESCRIPTION`='��������ȫ��' AND `C_BUSIN_FIELD` IS NULL AND `C_DEPENDS` IS NULL AND `C_MESSAGE` IS NULL AND `C_REF_VALUE` IS NULL LIMIT 1;
UPDATE `t_rule_validator` SET `C_MUSTITEM`='0' WHERE  `C_SYS`='SCF' AND `C_VALID_NAME`='acc-bankNo' AND `C_SHOW_NAME`='���б��' AND `C_NAME`='bankNo' AND `C_MUSTITEM`='1' AND `C_DATA_TYPE`='C' AND `N_DATA_LEN`=30 AND `N_DATA_SCALE`=0 AND `F_MAX` IS NULL AND `F_MIN` IS NULL AND `C_VALIDATOR` IS NULL AND `C_PATTERN` IS NULL AND `D_REGDATE`='20160718' AND `D_MODIDATE` IS NULL AND `C_DESCRIPTION`='���б��' AND `C_BUSIN_FIELD` IS NULL AND `C_DEPENDS` IS NULL AND `C_MESSAGE` IS NULL AND `C_REF_VALUE` IS NULL LIMIT 1;
UPDATE `t_rule_validator` SET `C_MUSTITEM`='0' WHERE  `C_SYS`='SCF' AND `C_VALID_NAME`='acc-lawIdentNo' AND `C_SHOW_NAME`='����֤������' AND `C_NAME`='lawIdentNo' AND `C_MUSTITEM`='1' AND `C_DATA_TYPE`='C' AND `N_DATA_LEN`=30 AND `N_DATA_SCALE`=0 AND `F_MAX` IS NULL AND `F_MIN` IS NULL AND `C_VALIDATOR` IS NULL AND `C_PATTERN` IS NULL AND `D_REGDATE`='20160718' AND `D_MODIDATE` IS NULL AND `C_DESCRIPTION`='����֤������' AND `C_BUSIN_FIELD` IS NULL AND `C_DEPENDS` IS NULL AND `C_MESSAGE` IS NULL AND `C_REF_VALUE` IS NULL LIMIT 1;
UPDATE `t_rule_validator` SET `C_MUSTITEM`='0' WHERE  `C_SYS`='SCF' AND `C_VALID_NAME`='acc-lawName' AND `C_SHOW_NAME`='����' AND `C_NAME`='lawName' AND `C_MUSTITEM`='1' AND `C_DATA_TYPE`='C' AND `N_DATA_LEN`=60 AND `N_DATA_SCALE`=0 AND `F_MAX` IS NULL AND `F_MIN` IS NULL AND `C_VALIDATOR` IS NULL AND `C_PATTERN` IS NULL AND `D_REGDATE`='20160718' AND `D_MODIDATE` IS NULL AND `C_DESCRIPTION`='����' AND `C_BUSIN_FIELD` IS NULL AND `C_DEPENDS` IS NULL AND `C_MESSAGE` IS NULL AND `C_REF_VALUE` IS NULL LIMIT 1;
##��¼��Ϣ�������У��  �ύ���� 2016/11/25
delete from `t_rule_busin_validator` where id in (10184,10185);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (10184, 'saveOpenAccountInfoInstead', 'acc-taxNo', 27, '1');
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (10185, 'saveOpenAccountInfoInstead', 'acc-openLicense', 28, '1');
##���䡢�ֻ��Ÿ�ʽ����У��  �ύ���� 2016/11/29
UPDATE `scfdev`.`t_rule_validator` SET `C_VALIDATOR`='matchValid' WHERE  `C_SYS`='SCF' AND `C_VALID_NAME`='acc-operEmail' AND `C_SHOW_NAME`='����������' AND `C_NAME`='operEmail' AND `C_MUSTITEM`='0' AND `C_DATA_TYPE`='C' AND `N_DATA_LEN`=30 AND `N_DATA_SCALE`=0 AND `F_MAX`=30 AND `F_MIN`=0 AND `C_VALIDATOR` IS NULL AND `C_PATTERN` IS NULL AND `D_REGDATE`='20160718' AND `D_MODIDATE` IS NULL AND `C_DESCRIPTION`='����������' AND `C_BUSIN_FIELD` IS NULL AND `C_DEPENDS` IS NULL AND `C_MESSAGE` IS NULL AND `C_REF_VALUE` IS NULL LIMIT 1;
UPDATE `scfdev`.`t_rule_validator` SET `C_PATTERN`='^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$' WHERE  `C_SYS`='SCF' AND `C_VALID_NAME`='acc-operEmail' AND `C_SHOW_NAME`='����������' AND `C_NAME`='operEmail' AND `C_MUSTITEM`='0' AND `C_DATA_TYPE`='C' AND `N_DATA_LEN`=30 AND `N_DATA_SCALE`=0 AND `F_MAX`=30 AND `F_MIN`=0 AND `C_VALIDATOR`='matchValid' AND `C_PATTERN` IS NULL AND `D_REGDATE`='20160718' AND `D_MODIDATE` IS NULL AND `C_DESCRIPTION`='����������' AND `C_BUSIN_FIELD` IS NULL AND `C_DEPENDS` IS NULL AND `C_MESSAGE` IS NULL AND `C_REF_VALUE` IS NULL LIMIT 1;
UPDATE `scfdev`.`t_rule_validator` SET `F_MAX`=100 WHERE  `C_SYS`='SCF' AND `C_VALID_NAME`='acc-operEmail' AND `C_SHOW_NAME`='����������' AND `C_NAME`='operEmail' AND `C_MUSTITEM`='0' AND `C_DATA_TYPE`='C' AND `N_DATA_LEN`=30 AND `N_DATA_SCALE`=0 AND `F_MAX`=30 AND `F_MIN`=0 AND `C_VALIDATOR`='matchValid' AND `C_PATTERN`='^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$' AND `D_REGDATE`='20160718' AND `D_MODIDATE` IS NULL AND `C_DESCRIPTION`='����������' AND `C_BUSIN_FIELD` IS NULL AND `C_DEPENDS` IS NULL AND `C_MESSAGE` IS NULL AND `C_REF_VALUE` IS NULL LIMIT 1;
UPDATE `scfdev`.`t_rule_validator` SET `F_MIN`=10 WHERE  `C_SYS`='SCF' AND `C_VALID_NAME`='acc-operEmail' AND `C_SHOW_NAME`='����������' AND `C_NAME`='operEmail' AND `C_MUSTITEM`='0' AND `C_DATA_TYPE`='C' AND `N_DATA_LEN`=30 AND `N_DATA_SCALE`=0 AND `F_MAX`=100 AND `F_MIN`=0 AND `C_VALIDATOR`='matchValid' AND `C_PATTERN`='^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$' AND `D_REGDATE`='20160718' AND `D_MODIDATE` IS NULL AND `C_DESCRIPTION`='����������' AND `C_BUSIN_FIELD` IS NULL AND `C_DEPENDS` IS NULL AND `C_MESSAGE` IS NULL AND `C_REF_VALUE` IS NULL LIMIT 1;
UPDATE `scfdev`.`t_rule_validator` SET `C_VALIDATOR`='matchValid' WHERE  `C_SYS`='SCF' AND `C_VALID_NAME`='acc-operMobile' AND `C_SHOW_NAME`='�������ֻ�����' AND `C_NAME`='operMobile' AND `C_MUSTITEM`='0' AND `C_DATA_TYPE`='C' AND `N_DATA_LEN`=30 AND `N_DATA_SCALE`=0 AND `F_MAX`=30 AND `F_MIN`=0 AND `C_VALIDATOR`='' AND `C_PATTERN` IS NULL AND `D_REGDATE`='20160718' AND `D_MODIDATE` IS NULL AND `C_DESCRIPTION`='�������ֻ�����' AND `C_BUSIN_FIELD` IS NULL AND `C_DEPENDS` IS NULL AND `C_MESSAGE` IS NULL AND `C_REF_VALUE` IS NULL LIMIT 1;
UPDATE `scfdev`.`t_rule_validator` SET `C_VALIDATOR`='matchValid' WHERE  `C_SYS`='SCF' AND `C_VALID_NAME`='wx-contMobileNo' AND `C_SHOW_NAME`='�������ֻ�����' AND `C_NAME`='contMobileNo' AND `C_MUSTITEM`='0' AND `C_DATA_TYPE`='C' AND `N_DATA_LEN`=0 AND `N_DATA_SCALE`=0 AND `F_MAX` IS NULL AND `F_MIN` IS NULL AND `C_VALIDATOR`='' AND `C_PATTERN` IS NULL AND `D_REGDATE`='20160924' AND `D_MODIDATE` IS NULL AND `C_DESCRIPTION`='�������ֻ�����' AND `C_BUSIN_FIELD` IS NULL AND `C_DEPENDS` IS NULL AND `C_MESSAGE` IS NULL AND `C_REF_VALUE` IS NULL LIMIT 1;
##�˵�����  �ύ���� 2016/11/29
INSERT INTO `scfdev`.`t_cfg_menu` (`id`, `c_name`, `c_title`, `c_url`, `n_parent_id`, `n_order`, `c_description`, `d_regdate`, `d_modidate`, `c_endnode`, `C_RULE_LIST`) VALUES (313, '����ѡ��', '����ѡ��', '../../scf2/home.html#/account/accountWay', 20, 10, '', '20161125', '20161125', '1', 'SUPPLIER_USER');
UPDATE `scfdev`.`t_cfg_menu` SET `C_RULE_LIST`='SUPPLIER_USER,SELLER_USER' WHERE  `id`=311;
UPDATE `scfdev`.`t_cfg_menu` SET `C_RULE_LIST`='SUPPLIER_USER,SELLER_USER' WHERE  `id`=312;
UPDATE `scfdev`.`t_cfg_menu` SET `C_RULE_LIST`='SUPPLIER_USER,SELLER_USER' WHERE  `id`=313;


##����Ա��Ӷ��⾭���˱�ʶ��֤������   �ύ���� 2016/11/30
delete from t_rule_busin_validator where id in (50103,50104);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50103, 'addCustOperator', 'clerkMan', 16, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50104, 'updateCustOperator', 'clerkMan', 7, '1', NULL, NULL, NULL, NULL, NULL);

delete from t_rule_validator where C_VALID_NAME='clerkMan';
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SCF', 'clerkMan', '���⾭���˱�ʶ', 'clerkMan', '0', 'C', 1, 0, 1, 0, NULL, NULL, '20161130', '20161130', '���⾭���˱�ʶ', NULL, NULL, NULL, NULL);


##У�����������ʽ  �ύ���� 2016/11/30
UPDATE `t_rule_validator` SET `C_VALIDATOR`='matchValid', `C_PATTERN`='[1-9]\\d{5}(?!\\d)' WHERE  `C_SYS`='SCF' AND `C_VALID_NAME`='acc-zipCode' AND `C_SHOW_NAME`='�ʱ�' AND `C_NAME`='zipCode' AND `C_MUSTITEM`='0' AND `C_DATA_TYPE`='C' AND `N_DATA_LEN`=0 AND `N_DATA_SCALE`=0 AND `F_MAX` IS NULL AND `F_MIN` IS NULL AND `C_VALIDATOR` IS NULL AND `C_PATTERN` IS NULL AND `D_REGDATE`='20160718' AND `D_MODIDATE` IS NULL AND `C_DESCRIPTION`='�ʱ�' AND `C_BUSIN_FIELD` IS NULL AND `C_DEPENDS` IS NULL AND `C_MESSAGE` IS NULL AND `C_REF_VALUE` IS NULL LIMIT 1;
UPDATE `t_rule_validator` SET `C_PATTERN`='^1(3|4|5|7|8)\\d{9}$' WHERE  `C_SYS`='SCF' AND `C_VALID_NAME`='acc-operMobile' AND `C_SHOW_NAME`='�������ֻ�����' AND `C_NAME`='operMobile' AND `C_MUSTITEM`='0' AND `C_DATA_TYPE`='C' AND `N_DATA_LEN`=30 AND `N_DATA_SCALE`=0 AND `F_MAX`=30 AND `F_MIN`=0 AND `C_VALIDATOR`='matchValid' AND `C_PATTERN`='0?(13|14|15|18)[0-9]{9}' AND `D_REGDATE`='20160718' AND `D_MODIDATE` IS NULL AND `C_DESCRIPTION`='�������ֻ�����' AND `C_BUSIN_FIELD` IS NULL AND `C_DEPENDS` IS NULL AND `C_MESSAGE` IS NULL AND `C_REF_VALUE` IS NULL LIMIT 1;

##����Ա�޸�֤������֤������   �ύ���� 2016/12/01
delete from t_rule_busin_validator where id in (50105,50106);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50105, 'updateCustOperator', 'contIdentType', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50106, 'updateCustOperator', 'contIdentNo', 2, '1', NULL, NULL, NULL, NULL, NULL);
##����֤������   �ύ���� 2016/12/7
INSERT INTO `scfdev`.`t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `D_REGDATE`, `C_DESCRIPTION`) VALUES ('SCF', 'acc-lawOtherIdentType', '��������֤������', 'lawOtherIdentType', '0', 'C', 20, 0, 20, '20160718', '����֤������');
INSERT INTO `scfdev`.`t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `D_REGDATE`, `C_DESCRIPTION`) VALUES ('SCF', 'acc-operOtherIdenttype', '����������֤������', 'operOtherIdenttype', '0', 'C', 20, 0, 20, 0, '20160718', '������֤������');
INSERT INTO `scfdev`.`t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (10205, 'saveOpenAccountInfo', 'acc-operOtherIdenttype', 27, '1');
INSERT INTO `scfdev`.`t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (10204, 'saveOpenAccountInfo', 'acc-lawOtherIdentType', 26, '1');
INSERT INTO `scfdev`.`t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (10206, 'saveOpenAccountInfoInstead', 'acc-operOtherIdenttype', 27, '1');
INSERT INTO `scfdev`.`t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (10207, 'saveOpenAccountInfoInstead', 'acc-lawOtherIdentType', 26, '1');
INSERT INTO `scfdev`.`t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (10208, 'saveOpenAccountApply', 'acc-operOtherIdenttype', 29, '1');
INSERT INTO `scfdev`.`t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (10209, 'saveOpenAccountApply', 'acc-lawOtherIdentType', 30, '1');
##�����Ż�   �ύ���� 2016/12/7
UPDATE `scfdev`.`t_rule_busin` SET `C_FUNC`='ICustOpenAccountService.webSaveOpenAccountApplySubmit' WHERE  `C_NAME`='saveOpenAccountApply' AND `C_TYPE` IS NULL AND `C_EXECUTE_CONTENT` IS NULL AND `C_DESCRIPTION`='��������' AND `C_GROUP` IS NULL AND `C_ERRORINFO` IS NULL AND `C_STATUS`='1' AND `D_REGDATE`='20160727' AND `D_MODIDATE`='20160727' AND `ID`=60036 AND `C_VERSION` IS NULL AND `C_FUNC`='ICustOpenAccountService2.webSaveOpenAccountApply' AND `C_ENTITY`='com.betterjr.modules.customer.entity.CustOpenAccountTmp' LIMIT 1;
DELETE FROM `scfdev`.`t_rule_busin` WHERE  `C_NAME`='saveOpenAccountInfo' AND `C_TYPE` IS NULL AND `C_EXECUTE_CONTENT` IS NULL AND `C_DESCRIPTION`='�ͻ����������ݴ�' AND `C_GROUP` IS NULL AND `C_ERRORINFO` IS NULL AND `C_STATUS`='1' AND `D_REGDATE`='20160727' AND `D_MODIDATE`='20160727' AND `ID`=10020 AND `C_VERSION` IS NULL AND `C_FUNC`='ICustOpenAccountService2.webSaveOpenAccountInfo' AND `C_ENTITY`='com.betterjr.modules.customer.entity.CustOpenAccountTmp' LIMIT 1;
