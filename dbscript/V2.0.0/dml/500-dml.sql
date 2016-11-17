##-- DML语句
##
##-- V1.0
##
##-- 添加系统操作员的默认权限  提交日期2016/11/15
delete from t_cfg_menu_role;
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`) VALUES (1, 'OPERATOR_ADMIN', NULL, 242, NULL, '1');
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`) VALUES (2, 'OPERATOR_ADMIN', NULL, 205, NULL, '1');
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`) VALUES (3, 'OPERATOR_ADMIN', NULL, 206, NULL, '1');
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`) VALUES (4, 'OPERATOR_ADMIN', NULL, 63, NULL, '1');
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`) VALUES (5, 'OPERATOR_ADMIN', NULL, 64, NULL, '1');
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`) VALUES (6, 'OPERATOR_ADMIN', NULL, 60, NULL, '1');

##--菜单名称修改 提交日期2016/11/16
update t_cfg_menu set c_name='询价',c_title='询价' where id='218';
update t_cfg_menu set c_name='融资还款',c_title='融资还款' where id='221';


##--bug-254 出票日期 搜索条件无效 提交日期2016/11/16
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (60705, 'queryAcceptBill', 'GTEinvoiceDate', 5, '1');
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (60706, 'queryAcceptBill', 'LTEinvoiceDate', 6, '1');

##--bug-286 字典修改 提交日期2016/11/17
UPDATE `t_cfg_dictitem` SET `C_NAME`='商业承兑汇票' WHERE  `ID`=1066;
UPDATE `t_cfg_dictitem` SET `C_NAME`='商业承兑汇票' WHERE  `ID`=30037;
UPDATE `t_cfg_dictitem` SET `C_NAME`='银行承兑汇票' WHERE  `ID`=1067;
UPDATE `t_cfg_dictitem` SET `C_NAME`='银行承兑汇票' WHERE  `ID`=30038;

##--bug-289 修改供应商变更  提交日期2016/11/17
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (60810, 'saveModifyOrder', 'custNO', 10, '1');
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (60410, 'saveModifyReceivable', 'coreCustNo', 10, '1');
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (60411, 'saveModifyReceivable', 'custNo', 11, '1');

