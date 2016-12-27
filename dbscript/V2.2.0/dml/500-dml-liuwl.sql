##-- DML语句
##
##-- V2.2.0
##
##-- 添加系统操作员的默认权限  提交日期2016/12/27

### 菜单
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES ('20001', NULL, '流程定义', '流程定义', NULL, NULL, '1', '1', NULL, '1', '20161227', '20161227', NULL, '0', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES ('20002', NULL, '流程列表', '流程列表', '../../scf2/home.html#/process/list', NULL, '20001', '1', NULL, '1', '20161227', '20161227', NULL, '1', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES ('20010', NULL, '任务管理', '任务管理', NULL, NULL, '1', '2', NULL, '1', '20161227', '20161227', NULL, '0', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES ('20011', NULL, '待办任务', '待办任务', '../../scf2/home.html#/flowTask/backlogTask', NULL, '20010', '1', NULL, '1', '20161227', '20161227', NULL, '1', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES ('20012', NULL, '已办任务', '已办任务', '../../scf2/home.html#/flowTask/finishedTask', NULL, '20010', '2', NULL, '1', '20161227', '20161227', NULL, '1', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES ('20013', NULL, '任务监控', '任务监控', '../../scf2/home.html#/flowTask/processMonitoring', NULL, '20010', '3', NULL, '1', '20161227', '20161227', NULL, '1', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER')$$


### 

