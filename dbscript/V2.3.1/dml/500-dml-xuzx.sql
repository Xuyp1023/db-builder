##-- DML语句
##
##-- V2.1.0
##
##-- 添加系统操作员的默认权限  提交日期2017/10/11

##-- 添加标准合同类型过滤规则
DELETE FROM `t_rule_busin` WHERE `ID` = '9100001'$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('addContractType', NULL, NULL, '添加标准合同类型', NULL, NULL, '1', '20170925', '20170925', 9100001, NULL, 'IContractStandardTypeService.webContractStandards', 'com.betterjr.modules.contract.entity.ContractStandardType')$$
DELETE FROM `t_rule_busin_validator` where id='9100003'$$
INSERT INTO  t_rule_busin_validator (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (9100003, 'addContractType', 'name', 1, '1', NULL, NULL, NULL, NULL, NULL)$$

##-- 编辑标准合同类型过滤规则
DELETE FROM `t_rule_busin` WHERE `ID` = '9100002'$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('updateContractType', NULL, NULL, '编辑标准合同类型', NULL, NULL, '1', '20170925', '20170925', 9100002, NULL, 'IContractStandardTypeService.webSaveModifyContractType', 'com.betterjr.modules.contract.entity.ContractStandardType')$$
DELETE FROM `t_rule_busin_validator` where id='9100004'$$
INSERT INTO  t_rule_busin_validator (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (9100004, 'updateContractType', 'description', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
DELETE FROM `t_rule_busin_validator` where id='9100005'$$
INSERT INTO  t_rule_busin_validator (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (9100005, 'updateContractType', 'name', 1, '1', NULL, NULL, NULL, NULL, NULL)$$

##-- 添加标准合同id生成规则
DELETE FROM `t_cfg_snogeneral` WHERE ID ='910001'$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractStandardType.id', '10000', NULL, 'SCF', '0', NULL, '18', '910001')$$


##-------------------------------------------------------------------------------------------------
##--END 请勿 COMMIT
##-------------------------------------------------------------------------------------------------




