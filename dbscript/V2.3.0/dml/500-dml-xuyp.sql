##-- DML语句
##
##-- V2.1.0
##
##-- 添加系统操作员的默认权限  提交日期2016/11/15

##-- task-199

##--  表的主键生成策越

INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) SELECT 'CommissionRecord.id', '1000', NULL, 'SALE', '0', NULL, '20', '700022' FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '700022')$$

INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) SELECT 'CommissionFile.id', '1000', NULL, 'SALE', '0', NULL, '20', '700023' FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '700023')$$

INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) SELECT 'DeliveryRecord.id', '1000', NULL, 'SALE', '0', NULL, '20', '700024' FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '700024')$$


##--  佣金文件查询

DELETE FROM `t_rule_busin` WHERE `ID` = 700031$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('ICommissionFileService.webQueryFileList', NULL, NULL, '查询报价列表', NULL, NULL, '1', '20160614', '20160614', '700031', NULL, 'ICommissionFileService.webQueryFileList', 'java.util.HashMap')$$

DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700032 AND `ID` <= 700034$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700032', 'ICommissionFileService.webQueryFileList', 'importDate', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700033', 'ICommissionFileService.webQueryFileList', 'custNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700034', 'ICommissionFileService.webQueryFileList', 'businStatus', '1', '1', NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='importDate' and C_NAME='importDate' $$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SALE', 'importDate', '导入日期', 'importDate', '0', 'C', '8', '0', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

##--  佣金记录查询

DELETE FROM `t_rule_busin` WHERE `ID` = 700026$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('ICommissionRecordService.webQueryRecordList', NULL, NULL, '查询佣金记录列表', NULL, NULL, '1', '20160614', '20160614', '700026', NULL, 'ICommissionRecordService.webQueryRecordList', 'java.util.HashMap')$$

DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700027 AND `ID` <= 700030$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700027', 'ICommissionRecordService.webQueryRecordList', 'importDate', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700028', 'ICommissionRecordService.webQueryRecordList', 'custNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700029', 'ICommissionRecordService.webQueryRecordList', 'businStatus', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700030', 'ICommissionRecordService.webQueryRecordList', 'payStatus', '1', '1', NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='payStatus' and C_NAME='payStatus' $$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SCF', 'payStatus', '付款状态', 'payStatus', '0', 'C', '18', '0', NULL, NULL, 'LONG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

##--  投递账单查询

DELETE FROM `t_rule_busin` WHERE `ID` = 700017$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('IDeliveryService.webQueryFileList', NULL, NULL, '查询投递账单列表', NULL, NULL, '1', '20160614', '20160614', '700017', NULL, 'IDeliveryService.webQueryFileList', 'java.util.HashMap')$$

DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700018 AND `ID` <= 700021$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700018', 'IDeliveryService.webQueryFileList', 'postCustNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700019', 'IDeliveryService.webQueryFileList', 'businStatus', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700020', 'IDeliveryService.webQueryFileList', 'GTEpostDate', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700021', 'IDeliveryService.webQueryFileList', 'LTEpostDate', '1', '1', NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='GTEpostDate' and C_NAME='GTEpostDate' $$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SALE', 'GTEpostDate', '投递日期', 'GTEpostDate', '0', 'C', '8', '0', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='LTEpostDate' and C_NAME='LTEpostDate' $$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SALE', 'LTEpostDate', '投递日期', 'LTEpostDate', '0', 'C', '8', '0', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='postCustNo' and C_NAME='postCustNo' $$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SALE', 'postCustNo', '操作企业客户号', 'postCustNo', '0', 'LONG', '0', '0', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

##--  投递账单月账单查询

DELETE FROM `t_rule_busin` WHERE `ID` = 700013$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('IDeliveryService.webQueryMonthlyRecordList', NULL, NULL, '查询投递月账单列表', NULL, NULL, '1', '20160614', '20160614', '700013', NULL, 'IDeliveryService.webQueryMonthlyRecordList', 'java.util.HashMap')$$

DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700014 AND `ID` <= 700016$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700014', 'IDeliveryService.webQueryMonthlyRecordList', 'billMonth', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700015', 'IDeliveryService.webQueryMonthlyRecordList', 'ownCustNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700016', 'IDeliveryService.webQueryMonthlyRecordList', 'businStatus', '1', '1', NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='billMonth' and C_NAME='billMonth' $$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SALE', 'billMonth', '对账月份', 'billMonth', '0', 'C', '6', '0', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='ownCustNo' and C_NAME='ownCustNo' $$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SALE', 'ownCustNo', '操作企业客户号', 'ownCustNo', '0', 'LONG', '0', '0', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

##--  对账单插入

DELETE FROM `t_rule_busin` WHERE `ID` = 700010$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('IDeliveryService.webAddDeliveryRecord', NULL, NULL, '新增对账单', NULL, NULL, '1', '20160614', '20160614', '700010', NULL, 'IDeliveryService.webAddDeliveryRecord', 'java.util.HashMap')$$

DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700011 AND `ID` <= 700012$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700011', 'IDeliveryService.webAddDeliveryRecord', 'monthList', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700012', 'IDeliveryService.webAddDeliveryRecord', 'ownCustNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='monthList' and C_NAME='monthList' $$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SALE', 'monthList', '月账单列表', 'monthList', '0', 'C', '2000', '0', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$


##-- 文件导出下载

DELETE FROM `t_rule_busin` WHERE `ID` = 700006$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('ICommissionFileDownService.webQueryFileDownList', NULL, NULL, '查询导出文件列表', NULL, NULL, '1', '20160614', '20160614', '700006', NULL, 'ICommissionFileDownService.webQueryFileDownList', 'java.util.HashMap')$$

DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700007 AND `ID` <= 700009$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700007', 'ICommissionFileDownService.webQueryFileDownList', 'custNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700008', 'ICommissionFileDownService.webQueryFileDownList', 'GTEimportDate', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700009', 'ICommissionFileDownService.webQueryFileDownList', 'LTEimportDate', '1', '1', NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='GTEimportDate' and C_NAME='GTEimportDate' $$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SALE', 'GTEimportDate', '导入日期', 'GTEimportDate', '0', 'C', '8', '0', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='LTEimportDate' and C_NAME='LTEimportDate' $$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SALE', 'LTEimportDate', '导入日期', 'LTEimportDate', '0', 'C', '8', '0', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$



##-- 对账单查询月账单详情：
DELETE FROM `t_rule_busin` WHERE `ID` = 700001$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('IDeliveryStatementService.webQueryStatementList', NULL, NULL, '查询对账单明细列表', NULL, NULL, '1', '20160614', '20160614', '700001', NULL, 'IDeliveryStatementService.webQueryStatementList', 'java.util.HashMap')$$

DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700002 AND `ID` <= 700005$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700002', 'IDeliveryStatementService.webQueryStatementList', 'ownCustNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700003', 'IDeliveryStatementService.webQueryStatementList', 'expressStatus', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700004', 'IDeliveryStatementService.webQueryStatementList', 'GTEbillMonth', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700005', 'IDeliveryStatementService.webQueryStatementList', 'LTEbillMonth', '1', '1', NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='expressStatus' and C_NAME='expressStatus' $$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SCF', 'expressStatus', '投递状态', 'expressStatus', '0', 'C', '18', '0', NULL, NULL, 'LONG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='GTEbillMonth' and C_NAME='GTEbillMonth' $$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SALE', 'GTEbillMonth', '对账月份', 'GTEbillMonth', '0', 'C', '6', '0', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

DELETE FROM `t_rule_validator` WHERE  C_VALID_NAME='LTEbillMonth' and C_NAME='LTEbillMonth' $$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SALE', 'LTEbillMonth', '对账月份', 'LTEbillMonth', '0', 'C', '6', '0', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

##-- 佣金文件解析明细项
DELETE FROM `t_cust_file_ordercloumn` WHERE `ID` >= 700035 AND `ID` <= 700046$$
INSERT INTO `t_cust_file_ordercloumn` (`ID`, `C_INFO_TYPE`, `C_UP_FLAG`, `C_BUSIN_STATUS`, `L_CLOUMN_ORDER`, `C_CLOUMN_PROPERTIES`, `C_CLOUMN_NAME`, `L_IS_MUST`, `D_REG_DATE`, `T_REG_TIME`, `C_CLOUMN_TYPE`) VALUES ('700035', '6', '1', '0', '0', 'area', '片区', '0', NULL, NULL, 'c')$$
INSERT INTO `t_cust_file_ordercloumn` (`ID`, `C_INFO_TYPE`, `C_UP_FLAG`, `C_BUSIN_STATUS`, `L_CLOUMN_ORDER`, `C_CLOUMN_PROPERTIES`, `C_CLOUMN_NAME`, `L_IS_MUST`, `D_REG_DATE`, `T_REG_TIME`, `C_CLOUMN_TYPE`) VALUES ('700036', '6', '1', '0', '1', 'customerName', '客户名称', '1', NULL, NULL, 'c')$$
INSERT INTO `t_cust_file_ordercloumn` (`ID`, `C_INFO_TYPE`, `C_UP_FLAG`, `C_BUSIN_STATUS`, `L_CLOUMN_ORDER`, `C_CLOUMN_PROPERTIES`, `C_CLOUMN_NAME`, `L_IS_MUST`, `D_REG_DATE`, `T_REG_TIME`, `C_CLOUMN_TYPE`) VALUES ('700037', '6', '1', '0', '2', 'amount', '销量', '1', NULL, NULL, 'n')$$
INSERT INTO `t_cust_file_ordercloumn` (`ID`, `C_INFO_TYPE`, `C_UP_FLAG`, `C_BUSIN_STATUS`, `L_CLOUMN_ORDER`, `C_CLOUMN_PROPERTIES`, `C_CLOUMN_NAME`, `L_IS_MUST`, `D_REG_DATE`, `T_REG_TIME`, `C_CLOUMN_TYPE`) VALUES ('700038', '6', '1', '0', '3', 'unit', '单台SO', '1', NULL, NULL, 'n')$$
INSERT INTO `t_cust_file_ordercloumn` (`ID`, `C_INFO_TYPE`, `C_UP_FLAG`, `C_BUSIN_STATUS`, `L_CLOUMN_ORDER`, `C_CLOUMN_PROPERTIES`, `C_CLOUMN_NAME`, `L_IS_MUST`, `D_REG_DATE`, `T_REG_TIME`, `C_CLOUMN_TYPE`) VALUES ('700039', '6', '1', '0', '4', 'balance', '合计金额', '1', NULL, NULL, 'n')$$
INSERT INTO `t_cust_file_ordercloumn` (`ID`, `C_INFO_TYPE`, `C_UP_FLAG`, `C_BUSIN_STATUS`, `L_CLOUMN_ORDER`, `C_CLOUMN_PROPERTIES`, `C_CLOUMN_NAME`, `L_IS_MUST`, `D_REG_DATE`, `T_REG_TIME`, `C_CLOUMN_TYPE`) VALUES ('700040', '6', '1', '0', '5', 'bankAccountName', '收款银行账户名称', '1', NULL, NULL, 'c')$$
INSERT INTO `t_cust_file_ordercloumn` (`ID`, `C_INFO_TYPE`, `C_UP_FLAG`, `C_BUSIN_STATUS`, `L_CLOUMN_ORDER`, `C_CLOUMN_PROPERTIES`, `C_CLOUMN_NAME`, `L_IS_MUST`, `D_REG_DATE`, `T_REG_TIME`, `C_CLOUMN_TYPE`) VALUES ('700041', '6', '1', '0', '6', 'bankAccount', '收款银行账号', '1', NULL, NULL, 'n')$$
INSERT INTO `t_cust_file_ordercloumn` (`ID`, `C_INFO_TYPE`, `C_UP_FLAG`, `C_BUSIN_STATUS`, `L_CLOUMN_ORDER`, `C_CLOUMN_PROPERTIES`, `C_CLOUMN_NAME`, `L_IS_MUST`, `D_REG_DATE`, `T_REG_TIME`, `C_CLOUMN_TYPE`) VALUES ('700042', '6', '1', '0', '7', 'bank', '收款银行', '1', NULL, NULL, 'c')$$
INSERT INTO `t_cust_file_ordercloumn` (`ID`, `C_INFO_TYPE`, `C_UP_FLAG`, `C_BUSIN_STATUS`, `L_CLOUMN_ORDER`, `C_CLOUMN_PROPERTIES`, `C_CLOUMN_NAME`, `L_IS_MUST`, `D_REG_DATE`, `T_REG_TIME`, `C_CLOUMN_TYPE`) VALUES ('700043', '6', '1', '0', '8', 'bankName', '收款银行全称', '1', NULL, NULL, 'c')$$
INSERT INTO `t_cust_file_ordercloumn` (`ID`, `C_INFO_TYPE`, `C_UP_FLAG`, `C_BUSIN_STATUS`, `L_CLOUMN_ORDER`, `C_CLOUMN_PROPERTIES`, `C_CLOUMN_NAME`, `L_IS_MUST`, `D_REG_DATE`, `T_REG_TIME`, `C_CLOUMN_TYPE`) VALUES ('700044', '6', '1', '0', '9', 'bankAddress', '开户行所在地', '1', NULL, NULL, 'c')$$
INSERT INTO `t_cust_file_ordercloumn` (`ID`, `C_INFO_TYPE`, `C_UP_FLAG`, `C_BUSIN_STATUS`, `L_CLOUMN_ORDER`, `C_CLOUMN_PROPERTIES`, `C_CLOUMN_NAME`, `L_IS_MUST`, `D_REG_DATE`, `T_REG_TIME`, `C_CLOUMN_TYPE`) VALUES ('700045', '6', '1', '0', '10', 'contacts', '收款联系人', '1', NULL, NULL, 'c')$$
INSERT INTO `t_cust_file_ordercloumn` (`ID`, `C_INFO_TYPE`, `C_UP_FLAG`, `C_BUSIN_STATUS`, `L_CLOUMN_ORDER`, `C_CLOUMN_PROPERTIES`, `C_CLOUMN_NAME`, `L_IS_MUST`, `D_REG_DATE`, `T_REG_TIME`, `C_CLOUMN_TYPE`) VALUES ('700046', '6', '1', '0', '11', 'contactsMobileNo', '手机号', '1', NULL, NULL, 'n')$$

