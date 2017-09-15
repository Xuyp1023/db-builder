##-- 后置DML语句
##

##-- V2.3.1
##
##-- 添加电子合同企业注册接口，字段明细和验证规则  提交日期2017/09/15

##--电子合同企业注册接口
delete from t_rule_busin where C_NAME in ('IContractCorpAccountService_webSaveRegistCorpAccount')$$
INSERT INTO t_rule_busin(`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) 
VALUES ('IContractCorpAccountService_webSaveRegistCorpAccount', NULL, NULL, '电子合同企业注册', NULL, NULL, '1', '20160614', '20160614', '10020', NULL, 'IContractCorpAccountService.webSaveRegistCorpAccount', 'com.betterjr.modules.contract.entity.ContractCorpAccount')$$

##--电子合同企业注册接口字段明细项
delete from t_rule_busin_validator where id in ('22500','22501','22502','22503','22504','22505','22506')$$
INSERT INTO t_rule_busin_validator(`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) 
VALUES ('22500', 'IContractCorpAccountService_webSaveRegistCorpAccount', 'serviceCustNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO t_rule_busin_validator(`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) 
VALUES ('22501', 'IContractCorpAccountService_webSaveRegistCorpAccount', 'custNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO t_rule_busin_validator(`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) 
VALUES ('22502', 'IContractCorpAccountService_webSaveRegistCorpAccount', 'orgCode', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO t_rule_busin_validator(`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) 
VALUES ('22503', 'IContractCorpAccountService_webSaveRegistCorpAccount', 'mobileNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO t_rule_busin_validator(`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) 
VALUES ('22504', 'IContractCorpAccountService_webSaveRegistCorpAccount', 'type', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO t_rule_busin_validator(`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) 
VALUES ('22505', 'IContractCorpAccountService_webSaveRegistCorpAccount', 'name', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO t_rule_busin_validator(`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) 
VALUES ('22506', 'IContractCorpAccountService_webSaveRegistCorpAccount', 'identNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$

##--电子合同企业注册接口字段规则明细项
delete from t_rule_validator where C_VALID_NAME in ('serviceCustNo','type','name')$$
INSERT INTO t_rule_validator(`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SCF', 'serviceCustNo', '合同服务商', 'serviceCustNo', '1', 'LONG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO t_rule_validator(`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SCF', 'type', '法人或者代理人', 'type', '1', 'C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO t_rule_validator(`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SCF', 'name', '法人或者代理人姓名', 'name', '1', 'C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

##-------------------------------------------------------------------------------------------------
##--END 请勿 COMMIT
##-------------------------------------------------------------------------------------------------
