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

--��ӿͻ���ϵ�ֵ�״̬�� �ύ���� 2016/11/23
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
--��ӹ�ϵ�˵� �ύ���� 2016/11/23
delete from t_cfg_menu where id=310;
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (310, NULL, '�ͻ���ϵ����', '�ͻ���ϵ����', '../../scf2/home.html#/customerRelation/coreRelationManage', NULL, 20, 7, '', '1', '20161122', '20161122', NULL, '1', 'SUPPLIER_USER,CORE_USER,SELLER_USER');
