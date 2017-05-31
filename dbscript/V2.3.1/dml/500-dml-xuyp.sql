##-- DML语句
##
##-- V2.1.0
##
##-- 添加系统操作员的默认权限  提交日期2017/05/27




DELETE FROM `t_cfg_snogeneral` WHERE ID >=20600 AND ID <= 20619$$


INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractTemplate.id', '1', NULL, 'SYS', '0', NULL, '10', '20601')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractTemplateStampPlace.id', '1', NULL, 'SYS', '0', NULL, '10', '20602')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractTemplateLog.id', '1', NULL, 'SYS', '0', NULL, '10', '20603')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractStamper.id', '1', NULL, 'SYS', '0', NULL, '10', '20604')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractCorpAccount.id', '1', NULL, 'SYS', '0', NULL, '10', '20605')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractSignerAccount.id', '1', NULL, 'SYS', '0', NULL, '10', '20606')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractCorpSigner.id', '1', NULL, 'SYS', '0', NULL, '10', '20607')$$




##-------------------------------------------------------------------------------------------------
##--合同模板 Validator
##-------------------------------------------------------------------------------------------------


####-- Busin Rule     查询合同文本 ContractTemplate_webQueryText
DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='ContractTemplate_custNo'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'ContractTemplate_custNo', '客户编号', 'custNo', '0', 'C', '18', '0', '18', '0', NULL, NULL, '20160719', '20160719', '客户编号', NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='ContractTemplate_textAuditStatus'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'ContractTemplate_textAuditStatus', '文本审核状态', 'textAuditStatus', '0', 'C', '2', '0', NULL, NULL, NULL, NULL, '20160719', '20160719', '文本审核状态', NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='ContractTemplate_GTEoriginDate'$$
INSERT INTO t_rule_validator (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'ContractTemplate_GTEoriginDate', '起始日期', 'GTEoriginDate', '0', 'C', '0', '0', NULL, NULL, NULL, 'yyyyMMdd', NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='ContractTemplate_LTEoriginDate'$$
INSERT INTO t_rule_validator (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'ContractTemplate_LTEoriginDate', '起始日期', 'LTEoriginDate', '0', 'C', '0', '0', NULL, NULL, NULL, 'yyyyMMdd', NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_busin` WHERE `ID` = 28001$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('ContractTemplate_webQueryText', NULL, NULL, '查询模板', NULL, NULL, '1', '20160614', '20160614', 28001, NULL, 'IContractTemplateService.webQueryText', 'java.util.HashMap')$$

##-- Busin Validator
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 28000 AND `ID` <= 28009$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28001, 'ContractTemplate_webQueryText', 'ContractTemplate_custNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28002, 'ContractTemplate_webQueryText', 'ContractTemplate_textAuditStatus', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28003, 'ContractTemplate_webQueryText', 'ContractTemplate_GTEoriginDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28004, 'ContractTemplate_webQueryText', 'ContractTemplate_LTEoriginDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$


####-- Busin Rule     查询审核合同文本 ContractTemplate_webQueryAuditText
DELETE FROM `t_rule_busin` WHERE `ID` = 28011$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('ContractTemplate_webQueryAuditText', NULL, NULL, '查询模板', NULL, NULL, '1', '20160614', '20160614', 28011, NULL, 'IContractTemplateService.webQueryAuditText', 'java.util.HashMap')$$
##-- Busin Validator
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 28010 AND `ID` <= 28019$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28011, 'ContractTemplate_webQueryAuditText', 'ContractTemplate_custNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28012, 'ContractTemplate_webQueryAuditText', 'ContractTemplate_textAuditStatus', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28013, 'ContractTemplate_webQueryAuditText', 'ContractTemplate_GTEoriginDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28014, 'ContractTemplate_webQueryAuditText', 'ContractTemplate_LTEoriginDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$



####-- Busin Rule     上传合同文本 ContractTemplate_webSaveUploadText  
DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='ContractTemplate_templateId'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'ContractTemplate_templateId', '模板编号', 'templateId', '0', 'C', '18', '0', '18', '0', NULL, NULL, '20160719', '20160719', '模板编号', NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='ContractTemplate_originTemplateId'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'ContractTemplate_originTemplateId', '原始文本编号', 'originTemplateId', '0', 'C', '18', '0', '18', '0', NULL, NULL, '20160719', '20160719', '原始文本编号', NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='ContractTemplate_originSimpleId'$$
INSERT INTO t_rule_validator (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'ContractTemplate_originSimpleId', '原始示例文件编号', 'originSimpleId', '0', 'C', '18', '0', '18', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='ContractTemplate_originSignerCount'$$
INSERT INTO t_rule_validator (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'ContractTemplate_originSignerCount', '签署人数量', 'originSignerCount', '0', 'C', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='ContractTemplate_originNoPattern'$$
INSERT INTO t_rule_validator (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'ContractTemplate_originNoPattern', '合同编号模式', 'originNoPattern', '0', 'C', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='ContractTemplate_originComment'$$
INSERT INTO t_rule_validator (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'ContractTemplate_originComment', '备注', 'originComment', '0', 'C', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_busin` WHERE `ID` = 28021$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('ContractTemplate_webSaveUploadText', NULL, NULL, '查询模板', NULL, NULL, '1', '20160614', '20160614', 28021, NULL, 'IContractTemplateService.webSaveUploadText', 'java.util.HashMap')$$

##-- Busin Validator
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 28020 AND `ID` <= 28029$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28021, 'ContractTemplate_webSaveUploadText', 'ContractTemplate_templateId', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28022, 'ContractTemplate_webSaveUploadText', 'ContractTemplate_originTemplateId', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28023, 'ContractTemplate_webSaveUploadText', 'ContractTemplate_originSimpleId', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28024, 'ContractTemplate_webSaveUploadText', 'ContractTemplate_originSignerCount', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28025, 'ContractTemplate_webSaveUploadText', 'ContractTemplate_originNoPattern', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28026, 'ContractTemplate_webSaveUploadText', 'ContractTemplate_originComment', 1, '1', NULL, NULL, NULL, NULL, NULL)$$



####-- Busin Rule     查询合同模板 ContractTemplate_webQueryTemplate


DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='ContractTemplate_templateAuditStatus'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'ContractTemplate_templateAuditStatus', '状态', 'templateAuditStatus', '0', 'C', '2', '0', '2', '0', NULL, NULL, '20160719', '20160719', '状态', NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='ContractTemplate_GTEmakeDate'$$
INSERT INTO t_rule_validator (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'ContractTemplate_GTEmakeDate', '起始日期', 'GTEmakeDate', '0', 'C', '0', '0', NULL, NULL, NULL, 'yyyyMMdd', NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='ContractTemplate_LTEmakeDate'$$
INSERT INTO t_rule_validator (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'ContractTemplate_LTEmakeDate', '起始日期', 'LTEmakeDate', '0', 'C', '0', '0', NULL, NULL, NULL, 'yyyyMMdd', NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_busin` WHERE `ID` = 28031$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) 
VALUES ('ContractTemplate_webQueryTemplate', NULL, NULL, '查询模板', NULL, NULL, '1', '20160614', '20160614', 28031, NULL, 'IContractTemplateService.webQueryTemplate', 'java.util.HashMap')$$
##-- Busin Validator
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 28030 AND `ID` <= 28039$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28031, 'ContractTemplate_webQueryTemplate', 'ContractTemplate_custNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28032, 'ContractTemplate_webQueryTemplate', 'ContractTemplate_templateAuditStatus', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28033, 'ContractTemplate_webQueryTemplate', 'ContractTemplate_GTEmakeDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28034, 'ContractTemplate_webQueryTemplate', 'ContractTemplate_LTEmakeDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$


####-- Busin Rule     查询审核合同模板 ContractTemplate_webQueryAuditTemplate


DELETE FROM `t_rule_busin` WHERE `ID` = 28041$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('ContractTemplate_webQueryAuditTemplate', NULL, NULL, '查询模板', NULL, NULL, '1', '20160614', '20160614', 28041, NULL, 'IContractTemplateService.webQueryAuditTemplate', 'java.util.HashMap')$$
##-- Busin Validator
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 28040 AND `ID` <= 28049$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28041, 'ContractTemplate_webQueryAuditTemplate', 'ContractTemplate_custNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28042, 'ContractTemplate_webQueryAuditTemplate', 'ContractTemplate_templateAuditStatus', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28043, 'ContractTemplate_webQueryAuditTemplate', 'ContractTemplate_GTEmakeDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28044, 'ContractTemplate_webQueryAuditTemplate', 'ContractTemplate_LTEmakeDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$




####-- Busin Rule     上传合同印章 ContractStamper_webSaveAddOwnStamper

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='ContractStamper_custNo'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'ContractStamper_custNo', '客户编号', 'custNo', '0', 'C', '18', '0', '18', '0', NULL, NULL, '20160719', '20160719', '客户编号', NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='ContractStamper_LIKEcustName'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'ContractStamper_LIKEcustName', '客户名称', 'LIKEcustName', '0', 'C', '120', '0', '120', '0', NULL, NULL, '20160719', '20160719', '客户名称', NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='ContractStamper_name'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'ContractStamper_name', '合同印章名称', 'name', '0', 'C', '40', '0', '40', '0', NULL, NULL, '20160719', '20160719', '合同印章名称', NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='ContractStamper_businStatus'$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'ContractStamper_businStatus', '业务状态', 'businStatus', '0', 'C', '2', '0', NULL, NULL, NULL, NULL, '20160719', '20160719', '业务状态', NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='ContractStamper_GTEoriginDate'$$
INSERT INTO t_rule_validator (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'ContractStamper_GTEoriginDate', '起始日期', 'GTEoriginDate', '0', 'C', '0', '0', NULL, NULL, NULL, 'yyyyMMdd', NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='ContractStamper_LTEoriginDate'$$
INSERT INTO t_rule_validator (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) 
VALUES ('SYS', 'ContractStamper_LTEoriginDate', '起始日期', 'LTEoriginDate', '0', 'C', '0', '0', NULL, NULL, NULL, 'yyyyMMdd', NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$



DELETE FROM `t_rule_busin` WHERE `ID` = 28051$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('ContractStamper_webSaveAddOwnStamper', NULL, NULL, '上传合同印章', NULL, NULL, '1', '20160614', '20160614', 28051, NULL, 'IContractStamperService.webSaveAddOwnStamper', 'com.betterjr.modules.contract.entity.ContractStamper')$$
##-- Busin Validator
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 28050 AND `ID` <= 28059$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28051, 'ContractStamper_webSaveAddOwnStamper', 'ContractTemplate_custNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28052, 'ContractStamper_webSaveAddOwnStamper', 'ContractStamper_name', 1, '1', NULL, NULL, NULL, NULL, NULL)$$


####-- Busin Rule     平台上传合同印章 ContractStamper_webSaveAddStamper
DELETE FROM `t_rule_busin` WHERE `ID` = 28061$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('ContractStamper_webSaveAddStamper', NULL, NULL, '上传合同印章', NULL, NULL, '1', '20160614', '20160614', 28061, NULL, 'IContractStamperService.webSaveAddStamper', 'com.betterjr.modules.contract.entity.ContractStamper')$$
##-- Busin Validator
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 28060 AND `ID` <= 28069$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28061, 'ContractStamper_webSaveAddStamper', 'ContractTemplate_custNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28062, 'ContractStamper_webSaveAddStamper', 'ContractStamper_name', 1, '1', NULL, NULL, NULL, NULL, NULL)$$


####-- Busin Rule     平台查询合同印章 ContractStamper_webQueryAllStamper

DELETE FROM `t_rule_busin` WHERE `ID` = 28071$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('ContractStamper_webQueryAllStamper', NULL, NULL, '合同印章', NULL, NULL, '1', '20160614', '20160614', 28071, NULL, 'IContractStamperService.webQueryAllStamper', 'java.util.HashMap')$$
##-- Busin Validator
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 28070 AND `ID` <= 28079$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28071, 'ContractStamper_webQueryAllStamper', 'ContractStamper_LIKEcustName', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28072, 'ContractStamper_webQueryAllStamper', 'ContractStamper_businStatus', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28073, 'ContractStamper_webQueryAllStamper', 'ContractStamper_GTEoriginDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (28074, 'ContractStamper_webQueryAllStamper', 'ContractStamper_LTEoriginDate', 1, '1', NULL, NULL, NULL, NULL, NULL)$$


##-------------------------------------------------------------------------------------------------
##--END 请勿 COMMIT
##-------------------------------------------------------------------------------------------------




