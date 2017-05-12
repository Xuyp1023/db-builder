##-- DML语句
##
##-- V2.1.0
##
##-- 添加系统操作员的默认权限  提交日期20170512
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) SELECT 'CommissionDailyStatement.id', 0, NULL, 'SCF', '0', NULL, 10, 50014 FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '50014')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) SELECT 'CommissionMonthlyStatementRecord.id', 0, NULL, 'SCF', '0', NULL, 10, 50015 FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '50015')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) SELECT 'CommissionMonthlyStatement.id', 0, NULL, 'SCF', '0', NULL, 10, 50017
FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '50017')$$

##-- 新增佣金支付菜单
delete from t_cfg_menu where id=6$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (6, NULL, '佣金支付', '佣金支付', NULL, NULL, 0, 5, '佣金支付', '1', '20170513', '20170513', NULL, '0', 'CORE_USER,PLATFORM_USER')$$

delete from t_cfg_menu where id>=20101 and id <=20122$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (20101, NULL, '佣金支付', '佣金支付', NULL, NULL, 6, 1, NULL, '1', '20170509', '20170509', NULL, '0', 'PLATFORM_USER,CORE_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (20110, NULL, '日账单管理', '日账单管理', '../../scf2/home.html#/1qh-mobile/check.dayManager', NULL, 20101, 7, NULL, '1', '20170509', '20170509', NULL, '1', 'PLATFORM_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (20111, NULL, '月账单管理', '月账单管理', '../../scf2/home.html#/1qh-mobile/check.monthManager', NULL, 20101, 8, NULL, '1', '20170509', '20170509', NULL, '1', 'PLATFORM_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (20112, NULL, '佣金导入', '佣金导入', '../../scf2/home.html#/1qh-mobile/lead.lead', NULL, 20101, 1, NULL, '1', '20170511', '20170511', NULL, '1', 'CORE_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (20113, NULL, '佣金审核', '佣金审核', '../../scf2/home.html#/1qh-mobile/lead.check', NULL, 20101, 2, NULL, '1', '20170511', '20170511', NULL, '1', 'CORE_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (20114, NULL, '佣金查询', '佣金查询', '../../scf2/home.html#/1qh-mobile/lead.query', NULL, 20101, 4, NULL, '1', '20170511', '20170511', NULL, '1', 'CORE_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (20115, NULL, '账单确认', '账单确认', '../../scf2/home.html#/1qh-mobile/lead.ensure', NULL, 20101, 5, NULL, '1', '20170511', '20170511', NULL, '1', 'CORE_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (20116, NULL, '账单下载', '账单下载', '../../scf2/home.html#/1qh-mobile/lead.download', NULL, 20101, 6, NULL, '1', '20170511', '20170511', NULL, '1', 'CORE_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (20117, NULL, '佣金数据导出', '佣金数据导出', '../../scf2/home.html#/1qh-mobile/lead.export', NULL, 20101, 9, NULL, '1', '20170511', '20170511', NULL, '1', 'PLATFORM_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (20118, NULL, '对账单投递', '对账单投递', '../../scf2/home.html#/1qh-mobile/check.mail', NULL, 20101, 10, NULL, '1', '20170511', '20170511', NULL, '1', 'PLATFORM_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (20119, NULL, '付款结果维护', '付款结果维护', '../../scf2/home.html#/1qh-mobile/check.maintenance', NULL, 20101, 11, NULL, '1', '20170511', '20170511', NULL, '1', 'PLATFORM_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (20120, NULL, '付款结果复核', '付款结果复核', '../../scf2/home.html#/1qh-mobile/check.recheck', NULL, 20101, 12, NULL, '1', '20170511', '20170511', NULL, '1', 'PLATFORM_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (20121, NULL, '参数设置', '参数设置', '../../scf2/home.html#/1qh-mobile/check.setting', NULL, 20101, 13, NULL, '1', '20170511', '20170511', NULL, '1', 'PLATFORM_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (20122, NULL, '验签证书管理', '验签证书管理', '../../scf2/home.html#/1qh-mobile/check.certificat', NULL, 20101, 14, NULL, '1', '20170511', '20170511', NULL, '1', 'PLATFORM_USER')$$



delete from t_cfg_dict where c_code='CommissionBusinStatus'$$
INSERT INTO `t_cfg_dict` (`ID`, `C_SYS`, `C_NAME`, `C_GROUP`, `C_MODIFY`, `C_DESCRIPTION`, `C_OWNER`, `D_MODIDATE`, `C_SCRIPT`, `C_CODE`) VALUES (50010, '4', '日月对账单显示状态', '5', '0', NULL, NULL, '20170512', '1', 'CommissionBusinStatus')$$


delete from t_cfg_dict where ID in (50030,50031,50032,50033,50034)$$
INSERT INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (50030, 50010, '0', NULL, '未生效', NULL, 0, '1', '0', NULL, '1')$$
INSERT INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (50031, 50010, '1', NULL, '已确认', NULL, 0, '1', '0', NULL, '1')$$
INSERT INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (50032, 50010, '2', NULL, '已生效', NULL, 0, '1', '0', NULL, '1')$$
INSERT INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (50033, 50010, '3', NULL, '已生成账单', NULL, 0, '1', '0', NULL, '1')$$
INSERT INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (50034, 50010, '9', NULL, '已作废', NULL, 0, '1', '0', NULL, '1')$$

