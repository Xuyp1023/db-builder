##--合同编号生成 提交日期2017/01/06
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) SELECT 'LIMIT_102202019_QEQHTZQR', 0, NULL, 'SCF', '3', NULL, 5, 50010 FROM 
dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '50010')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) SELECT 'LIMIT_102202019_QEQHTZTZ', 0, NULL, 'SCF', '3', NULL, 5, 50011 FROM 
dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '50011')$$

##--添加帮助菜单  提交日期2017/01/12
delete from t_cfg_menu where id in (5,314,315,316)$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (5, NULL, '帮助中心', '帮助中心', NULL, NULL, 0, 5, '帮助中心', '1', '20170112', '20170112', NULL, '0', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (314, NULL, '帮助中心', '帮助中心', '', NULL, 5, 1, '', '1', '20170112', '20170112', NULL, '0', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (315, NULL, '帮助中心', '帮助中心', '../../scf2/home.html#/help/helpCenter', NULL, 314, 1, '', '1', '20170112', '20170112', NULL, '1', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (316, NULL, '帮助', '帮助', '../../scf2/home.html#/help/help', NULL, 314, 2, '', '0', '20170112', '20170112', NULL, '1', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER')$$


##--添加贸易台账菜单  提交日期2017/02/09
delete from t_cfg_menu where id in (330,331,332,333,334,335,336)$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (330, NULL, '合同台账管理', '合同台账管理', NULL, NULL, 4, 10, '合同台账管理', '1', '20170123', '20170123', NULL, '0', 'SUPPLIER_USER,SELLER_USER,PLATFORM_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (331, NULL, '贸易合同台账登记', '贸易合同台账登记', '../../scf2/home.html#/sellerContract/list', NULL, 330, 1, '贸易合同台账登记', '1', '20170123', '20170123', NULL, '1', 'SELLER_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (332, NULL, '贸易合同台账审核', '贸易合同台账审核', '../../scf2/home.html#/sellerContract/aduit', NULL, 330, 2, '贸易合同台账审核', '1', '20170123', '20170123', NULL, '1', 'SELLER_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (333, NULL, '贸易合同台账查询', '贸易合同台账查询', '../../scf2/home.html#/sellerContract/query', NULL, 330, 3, '贸易合同台账查询', '1', '20170123', '20170123', NULL, '1', 'SELLER_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (334, NULL, '贸易合同台账登记', '贸易合同台账登记', '../../scf2/home.html#/supplierContract/list', NULL, 330, 1, '贸易合同台账登记', '1', '20170123', '20170123', NULL, '1', 'SUPPLIER_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (335, NULL, '贸易合同台账审核', '贸易合同台账审核', '../../scf2/home.html#/supplierContract/aduit', NULL, 330, 1, '贸易合同台账审核', '1', '20170123', '20170123', NULL, '1', 'SUPPLIER_USER')$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (336, NULL, '贸易合同台账查询', '贸易合同台账查询', '../../scf2/home.html#/supplierContract/query', NULL, 330, 1, '贸易合同台账查询', '1', '20170123', '20170123', NULL, '1', 'SUPPLIER_USER')$$


##--添加贸易台账配置  提交日期2017/02/09
delete from t_rule_busin where id in (50009,50010)$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('webAddContractLedger', NULL, NULL, '添加合同台账', NULL, NULL, '1', '20170119', '20170119', 50009, NULL, 'IContractLedgerService.webAddContractLedger', 'com.betterjr.modules.ledger.entity.ContractLedger')$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('webSaveContractLedger', NULL, NULL, '修改合同台账', NULL, NULL, '1', '20170119', '20170119', 50010, NULL, 'IContractLedgerService.webSaveContractLedger', 'com.betterjr.modules.ledger.entity.ContractLedger')$$


delete from t_rule_busin_validator where c_busin_name in ('webAddContractLedger','webSaveContractLedger')$$
delete from t_rule_busin_validator where ID in (50107,50108)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50107, 'webAddContractLedger', 'agreeNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50108, 'webAddContractLedger', 'agreeName', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50109, 'webAddContractLedger', 'buyer', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50110, 'webAddContractLedger', 'supplierNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50111, 'webAddContractLedger', 'signDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50112, 'webAddContractLedger', 'signAddr', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50113, 'webAddContractLedger', 'agreeStartDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50114, 'webAddContractLedger', 'agreeEndDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50115, 'webAddContractLedger', 'balance', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50116, 'webAddContractLedger', 'checkAccept', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50117, 'webAddContractLedger', 'objectionPeriod', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50118, 'webAddContractLedger', 'deliveryDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50119, 'webAddContractLedger', 'deliveryAddr', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50120, 'webAddContractLedger', 'des', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50121, 'webAddContractLedger', 'buyerNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50122, 'webAddContractLedger', 'supplier', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50123, 'webSaveContractLedger', 'agreeNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50124, 'webSaveContractLedger', 'agreeName', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50125, 'webSaveContractLedger', 'buyer', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50126, 'webSaveContractLedger', 'supplierNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50127, 'webSaveContractLedger', 'signDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50128, 'webSaveContractLedger', 'signAddr', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50129, 'webSaveContractLedger', 'agreeStartDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50130, 'webSaveContractLedger', 'agreeEndDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50131, 'webSaveContractLedger', 'balance', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50132, 'webSaveContractLedger', 'checkAccept', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50133, 'webSaveContractLedger', 'objectionPeriod', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50134, 'webSaveContractLedger', 'deliveryDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50135, 'webSaveContractLedger', 'deliveryAddr', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50136, 'webSaveContractLedger', 'des', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50137, 'webSaveContractLedger', 'buyerNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50138, 'webSaveContractLedger', 'supplier', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50139, 'webSaveContractLedger', 'id', 1, '1', NULL, NULL, NULL, NULL, NULL)$$


delete from t_rule_validator where c_valid_name in ('signAddr','des')$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SCF', 'signAddr', '签订地点', 'signAddr', '0', 'C', 100, 0, 100, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SCF', 'des', '描述', 'des', '0', 'C', 200, 0, 200, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$


INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) SELECT 'ContractLedger.id', 1, NULL, 'SCF', '0', NULL, 10, 50009 FROM dual 
WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '50009')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) SELECT 'ContractLedgerRecode.id', 1, NULL, 'SCF', '0', NULL, 10, 50012 FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '50012')$$

## -- 添加合同/发票删除标识
delete from t_rule_busin_validator where id in (50140,50141)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50140, 'webAddCustAgreement', 'isDeleted', 21, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (50141, 'addInvoice', 'isDeleted', 13, '1', NULL, NULL, NULL, NULL, NULL)$$




