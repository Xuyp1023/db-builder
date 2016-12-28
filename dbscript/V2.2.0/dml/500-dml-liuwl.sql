##-- DML语句
##
##-- V2.2.0
##
##-- 添加系统操作员的默认权限  提交日期2016/12/27

### 菜单
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) SELECT '20001', NULL, '流程定义', '流程定义', NULL, NULL, '1', '1', NULL, '1', '20161227', '20161227', NULL, '0', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER' FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_menu` WHERE id = '20001')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) SELECT '20002', NULL, '流程列表', '流程列表', '../../scf2/home.html#/process/list', NULL, '20001', '1', NULL, '1', '20161227', '20161227', NULL, '1', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER' FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_menu` WHERE id = '20002')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) SELECT '20010', NULL, '任务管理', '任务管理', NULL, NULL, '1', '2', NULL, '1', '20161227', '20161227', NULL, '0', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER' FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_menu` WHERE id = '20010')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) SELECT '20011', NULL, '待办任务', '待办任务', '../../scf2/home.html#/flowTask/backlogTask', NULL, '20010', '1', NULL, '1', '20161227', '20161227', NULL, '1', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER' FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_menu` WHERE id = '20011')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) SELECT '20012', NULL, '已办任务', '已办任务', '../../scf2/home.html#/flowTask/finishedTask', NULL, '20010', '2', NULL, '1', '20161227', '20161227', NULL, '1', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER' FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_menu` WHERE id = '20012')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) SELECT '20013', NULL, '任务监控', '任务监控', '../../scf2/home.html#/flowTask/processMonitoring', NULL, '20010', '3', NULL, '1', '20161227', '20161227', NULL, '1', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER' FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_menu` WHERE id = '20013')$$


DELETE FROM `t_cfg_snogeneral` WHERE ID >=20500 AND ID <= 20599$$


REPLACE INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('WorkFlowStep.id', '1', NULL, 'SYS', '0', NULL, '10', '20501')$$

REPLACE INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('WorkFlowNode.id', '1', NULL, 'SYS', '0', NULL, '10', '20502')$$

REPLACE INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('WorkFlowMoney.id', '1', NULL, 'SYS', '0', NULL, '10', '20503')$$

REPLACE INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('WorkFlowBase.id', '1', NULL, 'SYS', '0', NULL, '10', '20504')$$

REPLACE INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('WorkFlowApprover.id', '1', NULL, 'SYS', '0', NULL, '10', '20505')$$

REPLACE INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('WorkFlowBusiness.id', '1', NULL, 'SYS', '0', NULL, '10', '20506')$$

REPLACE INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('WorkFlowAudit.id', '1', NULL, 'SYS', '0', NULL, '10', '20507')$$




### 

