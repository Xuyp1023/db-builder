##-- DML语句
##
##-- V2.1.0
##
##-- 添加系统操作员的默认权限  提交日期2016/11/15

DELETE FROM `t_cfg_snogeneral` WHERE ID >=20600 AND ID <= 20619$$


INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractTemplate.id', '1', NULL, 'SYS', '0', NULL, '10', '20601')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractTemplateStampPlace.id', '1', NULL, 'SYS', '0', NULL, '10', '20602')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractTemplateLog.id', '1', NULL, 'SYS', '0', NULL, '10', '20603')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractStamper.id', '1', NULL, 'SYS', '0', NULL, '10', '20604')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractCorpAccount.id', '1', NULL, 'SYS', '0', NULL, '10', '20605')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractSignerAccount.id', '1', NULL, 'SYS', '0', NULL, '10', '20606')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractCorpSigner.id', '1', NULL, 'SYS', '0', NULL, '10', '20607')$$



DELETE FROM `t_cfg_snogeneral` WHERE ID >=20620 AND ID <= 20629$$

INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('DomainAttribute.id', '1', NULL, 'SYS', '0', NULL, '10', '20621')$$




##-------------------------------------------------------------------------------------------------
##--验签证书 Validator
##-------------------------------------------------------------------------------------------------


####-- Busin Rule     查询合同文本 ContractTemplate_webQueryText
DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='VerifySignCert_custNo'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'VerifySignCert_custNo', '客户编号', 'custNo', '0', 'C', '18', '0', '18', '0', NULL, NULL, '20160719', '20160719', '客户编号', NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='VerifySignCert_LIKEcustName'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SYS', 'VerifySignCert_LIKEcustName', '客户名称模糊查询', 'LIKEcustName', '0', 'C', '120', '0', '120', '0', NULL, NULL, '20160719', '20160719', '客户名称模糊查询', NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='VerifySignCert_GTEregDate'$$
INSERT INTO t_rule_validator (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SYS', 'VerifySignCert_GTEregDate', '起始日期', 'GTEregDate', '0', 'C', '0', '0', NULL, NULL, NULL, 'yyyyMMdd', NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='VerifySignCert_LTEregDate'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SYS', 'VerifySignCert_LTEregDate', '终止日期', 'LTEregDate', '0', 'C', '0', '0', NULL, NULL, NULL, 'yyyyMMdd', NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='VerifySignCert_businStatus'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SYS', 'VerifySignCert_businStatus', '状态', 'businStatus', '0', 'C', '1', '0', '1', '0', NULL, NULL, '20160719', '20160719', '状态', NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='VerifySignCert_name'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SYS', 'VerifySignCert_name', '证书名称', 'name', '0', 'C', '60', '0', '60', '0', NULL, NULL, '20160719', '20160719', '证书名称', NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='VerifySignCert_type'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SYS', 'VerifySignCert_type', '类型', 'type', '0', 'C', '1', '0', '1', '0', NULL, NULL, '20160719', '20160719', '类型', NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='VerifySignCert_certInfo'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SYS', 'VerifySignCert_certInfo', '证书内容', 'certInfo', '0', 'C', '4096', '0', '4096', '0', NULL, NULL, '20160719', '20160719', '证书内容', NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='VerifySignCert_serialNo'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SYS', 'VerifySignCert_serialNo', '证书序列号', 'serialNo', '0', 'C', '60', '0', '60', '0', NULL, NULL, '20160719', '20160719', '证书序列号', NULL, NULL, NULL, NULL)$$




DELETE FROM `t_rule_busin` WHERE `ID` = 28201$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('VerifySignCertService_webQueryCertList', NULL, NULL, '查询证书列表', NULL, NULL, '1', '20160614', '20160614', 28201, NULL, 'IVerifySignCertService.webQueryCertList', 'java.util.HashMap')$$

##-- Busin Validator
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 28201 AND `ID` <= 28210$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28201, 'VerifySignCertService_webQueryCertList', 'VerifySignCert_businStatus', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28202, 'VerifySignCertService_webQueryCertList', 'VerifySignCert_LIKEcustName', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28203, 'VerifySignCertService_webQueryCertList', 'VerifySignCert_GTEregDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28204, 'VerifySignCertService_webQueryCertList', 'VerifySignCert_LTEregDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$




DELETE FROM `t_rule_busin` WHERE `ID` = 28202$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('VerifySignCertService_webSaveAddCert', NULL, NULL, '添加证书', NULL, NULL, '1', '20160614', '20160614', 28202, NULL, 'IVerifySignCertService.webSaveAddCert', 'com.betterjr.modules.cert.entity.VerifySignCert')$$

##-- Busin Validator
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 28211 AND `ID` <= 28219$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28211, 'VerifySignCertService_webSaveAddCert', 'VerifySignCert_custNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28212, 'VerifySignCertService_webSaveAddCert', 'VerifySignCert_name', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28213, 'VerifySignCertService_webSaveAddCert', 'VerifySignCert_type', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28214, 'VerifySignCertService_webSaveAddCert', 'VerifySignCert_certInfo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28215, 'VerifySignCertService_webSaveAddCert', 'VerifySignCert_serialNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$




DELETE FROM `t_rule_busin` WHERE `ID` = 28203$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('VerifySignCertService_webSaveEditCert', NULL, NULL, '修改证书', NULL, NULL, '1', '20160614', '20160614', 28203, NULL, 'IVerifySignCertService.webSaveEditCert', 'com.betterjr.modules.cert.entity.VerifySignCert')$$

##-- Busin Validator
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 28221 AND `ID` <= 28229$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28221, 'VerifySignCertService_webSaveEditCert', 'VerifySignCert_name', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28222, 'VerifySignCertService_webSaveEditCert', 'VerifySignCert_type', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28223, 'VerifySignCertService_webSaveEditCert', 'VerifySignCert_certInfo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28224, 'VerifySignCertService_webSaveEditCert', 'VerifySignCert_serialNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$





##-------------------------------------------------------------------------------------------------
##--支付结果 Validator
##-------------------------------------------------------------------------------------------------





####-- Busin Rule     平台查询未确认对账结果 CommissionPayResult_webQueryNormalPayResultList

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='CommissionPayResult_custNo'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'CommissionPayResult_custNo', '核心企业编号', 'custNo', '0', 'LONG', '18', '0', '18', '0', NULL, NULL, '20160719', '20160719', '客户编号', NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='CommissionPayResult_payDate'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'CommissionPayResult_payDate', '支付日期', 'payDate', '0', 'C', '0', '0', NULL, NULL, NULL, 'yyyyMMdd', NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='CommissionPayResult_importDate'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'CommissionPayResult_importDate', '导入日期', 'importDate', '0', 'C', '0', '0', NULL, NULL, NULL, 'yyyyMMdd', NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$


DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='CommissionPayResult_payTargetBankAccount'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'CommissionPayResult_payTargetBankAccount', '支付日期', 'payTargetBankAccount', '0', 'C', '20', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='CommissionPayResult_payTargetBankAccountName'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'CommissionPayResult_payTargetBankAccountName', '导入日期', 'payTargetBankAccountName', '0', 'C', '20', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$



DELETE FROM `t_rule_busin` WHERE `ID` = 28081$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('CommissionPayResult_webQueryNormalPayResultList', NULL, NULL, '平台查询未确认对账结果', NULL, NULL, '1', '20160614', '20160614', 28081, NULL, 'ICommissionPayResultService.webQueryNormalPayResultList', 'java.util.HashMap')$$

##-- Busin Validator
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 28080 AND `ID` <= 28084$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28081, 'CommissionPayResult_webQueryNormalPayResultList', 'CommissionPayResult_custNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28082, 'CommissionPayResult_webQueryNormalPayResultList', 'CommissionPayResult_payDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$


DELETE FROM `t_rule_busin` WHERE `ID` = 28082$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('CommissionPayResult_webQueryUncheckPayResultRecords', NULL, NULL, '平台查询未确认对账结果', NULL, NULL, '1', '20160614', '20160614', 28082, NULL, 'ICommissionPayResultService.webQueryUncheckPayResultRecords', 'java.util.HashMap')$$

##-- Busin Validator
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28083, 'CommissionPayResult_webQueryUncheckPayResultRecords', 'CommissionPayResult_payTargetBankAccount', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28084, 'CommissionPayResult_webQueryUncheckPayResultRecords', 'CommissionPayResult_payTargetBankAccountName', 1, '1', NULL, NULL, NULL, NULL, NULL)$$


DELETE FROM `t_rule_busin` WHERE `ID` = 28085$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('CommissionPayResult_webQueryConfirmPayResultList', NULL, NULL, '平台查询已确认对账结果', NULL, NULL, '1', '20160614', '20160614', 28085, NULL, 'ICommissionPayResultService.webQueryConfirmPayResultList', 'java.util.HashMap')$$

##-- Busin Validator
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 28085 AND `ID` <= 28089$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28085, 'CommissionPayResult_webQueryConfirmPayResultList', 'CommissionPayResult_custNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28086, 'CommissionPayResult_webQueryConfirmPayResultList', 'CommissionPayResult_payDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$


DELETE FROM `t_rule_busin` WHERE `ID` = 28087$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('CommissionPayResult_webCreatePayResult', NULL, NULL, '平台查询已确认对账结果', NULL, NULL, '1', '20160614', '20160614', 28087, NULL, 'ICommissionPayResultService.webCreatePayResult', 'java.util.HashMap')$$

##-- Busin Validator
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28087, 'CommissionPayResult_webCreatePayResult', 'CommissionPayResult_custNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28088, 'CommissionPayResult_webCreatePayResult', 'CommissionPayResult_payDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28089, 'CommissionPayResult_webCreatePayResult', 'CommissionPayResult_importDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$



DELETE FROM `t_rule_busin` WHERE `ID` = 28091$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('CommissionPayResult_webQueryAuditPayResultList', NULL, NULL, '平台查询已审核对账结果', NULL, NULL, '1', '20160614', '20160614', 28091, NULL, 'ICommissionPayResultService.webQueryAuditPayResultList', 'java.util.HashMap')$$

##-- Busin Validator
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 28091 AND `ID` <= 28095$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28091, 'CommissionPayResult_webQueryAuditPayResultList', 'CommissionPayResult_custNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28092, 'CommissionPayResult_webQueryAuditPayResultList', 'CommissionPayResult_payDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$




DELETE FROM `t_rule_busin` WHERE `ID` = 28095$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('CommissionPayResult_webQueryUncheckCommissionRecord', NULL, NULL, '平台查询导入记录', NULL, NULL, '1', '20160614', '20160614', 28095, NULL, 'ICommissionPayResultService.webQueryUncheckCommissionRecord', 'java.util.HashMap')$$

##-- Busin Validator
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 28095 AND `ID` <= 28099$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28095, 'CommissionPayResult_webQueryUncheckCommissionRecord', 'CommissionPayResult_custNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28096, 'CommissionPayResult_webQueryUncheckCommissionRecord', 'CommissionPayResult_importDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$



DELETE FROM `t_rule_busin` WHERE `ID` = 28097$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('CommissionPayResult_webFindCountCommissionRecord', NULL, NULL, '平台查询导入记录', NULL, NULL, '1', '20160614', '20160614', 28097, NULL, 'ICommissionPayResultService.webFindCountCommissionRecord', 'java.util.HashMap')$$


INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28097, 'CommissionPayResult_webFindCountCommissionRecord', 'CommissionPayResult_custNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28098, 'CommissionPayResult_webFindCountCommissionRecord', 'CommissionPayResult_importDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$



INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) SELECT 'DomainAttribute.id', '1', NULL, 'SYS', '0', NULL, '10', '20621' FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '20621')$$

INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) SELECT 'CommissionPayResult.id', '1', NULL, 'SYS', '0', NULL, '10', '20622' FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '20622')$$

INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) SELECT 'VerifySignCert.id', '1', NULL, 'SYS', '0', NULL, '10', '20623' FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '20623')$$






