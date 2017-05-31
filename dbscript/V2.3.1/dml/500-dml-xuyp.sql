##-- DML语句
##
##-- V2.1.0
##
##-- 添加系统操作员的默认权限  提交日期2017/05/27


##--订单文件解析明细项
DELETE FROM `t_cust_file_ordercloumn` WHERE `ID` >= 700047 AND `ID` <= 700052$$
INSERT INTO  `t_cust_file_ordercloumn` (`ID`, `C_INFO_TYPE`, `C_UP_FLAG`, `C_BUSIN_STATUS`, `L_CLOUMN_ORDER`, `C_CLOUMN_PROPERTIES`, `C_CLOUMN_NAME`, `L_IS_MUST`, `D_REG_DATE`, `T_REG_TIME`, `C_CLOUMN_TYPE`) VALUES ('700047', '1', '1', '0', '0', 'orderNo', '订单编号', '1', NULL, NULL, 'c')$$
INSERT INTO `t_cust_file_ordercloumn` (`ID`, `C_INFO_TYPE`, `C_UP_FLAG`, `C_BUSIN_STATUS`, `L_CLOUMN_ORDER`, `C_CLOUMN_PROPERTIES`, `C_CLOUMN_NAME`, `L_IS_MUST`, `D_REG_DATE`, `T_REG_TIME`, `C_CLOUMN_TYPE`) VALUES ('700048', '1', '1', '0', '1', 'orderDate', '订单日期', '1', NULL, NULL, 'n')$$
INSERT INTO `t_cust_file_ordercloumn` (`ID`, `C_INFO_TYPE`, `C_UP_FLAG`, `C_BUSIN_STATUS`, `L_CLOUMN_ORDER`, `C_CLOUMN_PROPERTIES`, `C_CLOUMN_NAME`, `L_IS_MUST`, `D_REG_DATE`, `T_REG_TIME`, `C_CLOUMN_TYPE`) VALUES ('700049', '1', '1', '0', '2', 'goodsName', '商品名称', '1', NULL, NULL, 'c')$$
INSERT INTO `t_cust_file_ordercloumn` (`ID`, `C_INFO_TYPE`, `C_UP_FLAG`, `C_BUSIN_STATUS`, `L_CLOUMN_ORDER`, `C_CLOUMN_PROPERTIES`, `C_CLOUMN_NAME`, `L_IS_MUST`, `D_REG_DATE`, `T_REG_TIME`, `C_CLOUMN_TYPE`) VALUES ('700050', '1', '1', '0', '3', 'unit', '商品单价', '0', NULL, NULL, 'n')$$
INSERT INTO `t_cust_file_ordercloumn` (`ID`, `C_INFO_TYPE`, `C_UP_FLAG`, `C_BUSIN_STATUS`, `L_CLOUMN_ORDER`, `C_CLOUMN_PROPERTIES`, `C_CLOUMN_NAME`, `L_IS_MUST`, `D_REG_DATE`, `T_REG_TIME`, `C_CLOUMN_TYPE`) VALUES ('700051', '1', '1', '0', '4', 'amount', '商品数量', '0', NULL, NULL, 'n')$$
INSERT INTO `t_cust_file_ordercloumn` (`ID`, `C_INFO_TYPE`, `C_UP_FLAG`, `C_BUSIN_STATUS`, `L_CLOUMN_ORDER`, `C_CLOUMN_PROPERTIES`, `C_CLOUMN_NAME`, `L_IS_MUST`, `D_REG_DATE`, `T_REG_TIME`, `C_CLOUMN_TYPE`) VALUES ('700052', '1', '1', '0', '5', 'balance', '订单金额', '1', NULL, NULL, 'n')$$

## --给新增的表增加主键生成策越

INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`)  SELECT 'ScfAssetCompany.id', '1299', NULL, 'SCF', '0', NULL, '10', '700053' FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '700053')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`)  SELECT 'ScfAssetBasedata.id', '1299', NULL, 'SCF', '0', NULL, '10', '700054' FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '700054')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`)  SELECT 'ScfAsset.id', '1299', NULL, 'SCF', '0', NULL, '10', '700055' FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '700055')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`)  SELECT 'ScfTransportDO.id', '1002813', NULL, 'SCF', '0', NULL, '18', '700056' FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '700056')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`)  SELECT 'ScfInvoiceDO.id', '1002872', NULL, 'SCF', '0', NULL, '18', '700057' FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '700057')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`)  SELECT 'ScfReceivableDO.id', '1002807', NULL, 'SCF', '0', NULL, '10', '700058' FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '700058')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`)  SELECT 'ScfOrderDO.id', '1002886', NULL, 'SCF', '0', NULL, '18', '700059' FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '700059')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`)  SELECT 'ScfAcceptBillDO.id', '1004759', NULL, 'SCF', '0', NULL, '18', '700060' FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '700060')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`)  SELECT 'CustResolveFile.id', '1007272', NULL, 'SALE', '0', NULL, '20', '700061' FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '700061')$$


##---订单新增过滤规则 700062---700071
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700062 AND `ID` <= 700071$$
DELETE FROM `t_rule_busin` WHERE `ID` = 700062$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('addOrderDO', NULL, NULL, '添加订单信息', NULL, NULL, '1', '20160906', '20160906', '700062', NULL, 'IScfOrderService.webAddOrderDO', 'com.betterjr.modules.order.entity.ScfOrderDO')$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700063', 'addOrderDO', 'orderNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700064', 'addOrderDO', 'goodsName', '2', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700065', 'addOrderDO', 'orderDate', '3', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700066', 'addOrderDO', 'unit', '4', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700067', 'addOrderDO', 'amount', '5', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700068', 'addOrderDO', 'balance', '6', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700069', 'addOrderDO', 'coreCustno', '7', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700070', 'addOrderDO', 'custNo', '8', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700071', 'addOrderDO', 'description', '9', '1', NULL, NULL, NULL, NULL, NULL)$$

##-- 订单编辑过滤规则：700072     ----   700083
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700072 AND `ID` <= 700083$$
DELETE FROM `t_rule_busin` WHERE `ID` = 700072$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('saveModifyOrderDO', NULL, NULL, '编辑订单信息', NULL, NULL, '1', '20160804', '20160804', '700072', NULL, 'IScfOrderService.webSaveModifyOrderDO', 'com.betterjr.modules.order.entity.ScfOrderDO')$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700073', 'saveModifyOrderDO', 'orderNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700074', 'saveModifyOrderDO', 'goodsName', '2', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700075', 'saveModifyOrderDO', 'orderDate', '3', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700076', 'saveModifyOrderDO', 'unit', '4', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700077', 'saveModifyOrderDO', 'amount', '5', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700078', 'saveModifyOrderDO', 'balance', '6', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700079', 'saveModifyOrderDO', 'coreCustNo', '7', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700080', 'saveModifyOrderDO', 'description', '8', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700081', 'saveModifyOrderDO', 'custNO', '9', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700082', 'saveModifyOrderDO', 'refNo', '10', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700083', 'saveModifyOrderDO', 'version', '11', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SCF', 'refNo', '票据凭证', 'refNo', '0', 'C', '32', '0', '32', '0', NULL, NULL, '20160719', '20160719', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SALE', 'version', '版本', 'version', '0', 'C', '255', '0', '255', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$


##-- 订单查询未生效的过滤规则   700084 ----  700089

DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700084 AND `ID` <= 700089$$
DELETE FROM `t_rule_busin` WHERE `ID` = 700084$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('webQueryIneffectiveOrderDO', NULL, NULL, '查询未生效订单信息', NULL, NULL, '1', '20160804', '20160804', '700084', NULL, 'IScfOrderService.webQueryIneffectiveOrderDO', 'java.util.HashMap')$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700085', 'webQueryIneffectiveOrderDO', 'custNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700086', 'webQueryIneffectiveOrderDO', 'coreCustNo', '2', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700087', 'webQueryIneffectiveOrderDO', 'GTEorderDate', '3', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700088', 'webQueryIneffectiveOrderDO', 'LTEorderDate', '4', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700089', 'webQueryIneffectiveOrderDO', 'businStatus', '5', '1', NULL, NULL, NULL, NULL, NULL)$$

##-- 订单生效查询条件    700090  -------   700095
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700090 AND `ID` <= 700095$$
DELETE FROM `t_rule_busin` WHERE `ID` = 700090$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('webQueryEffectiveOrderDO', NULL, NULL, '查询生效订单信息', NULL, NULL, '1', '20160804', '20160804', '700090', NULL, 'IScfOrderService.webQueryEffectiveOrderDO', 'java.util.HashMap')$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700091', 'webQueryEffectiveOrderDO', 'custNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700092', 'webQueryEffectiveOrderDO', 'coreCustNo', '2', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700093', 'webQueryEffectiveOrderDO', 'GTEorderDate', '3', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700094', 'webQueryEffectiveOrderDO', 'LTEorderDate', '4', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700095', 'webQueryEffectiveOrderDO', 'businStatus', '5', '1', NULL, NULL, NULL, NULL, NULL)$$

## --票据新增过滤规则    700096  -----700114
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700096 AND `ID` <= 700114$$
DELETE FROM `t_rule_busin` WHERE `ID` = 700096$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('webAddAcceptBillDO', NULL, NULL, '汇票信息登记', NULL, NULL, '1', '20160804', '20160804', '700096', NULL, 'IScfAcceptBillService.webAddAcceptBillDO', 'com.betterjr.modules.acceptbill.entity.ScfAcceptBillDO')$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700097', 'webAddAcceptBillDO', 'coreCustNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700098', 'webAddAcceptBillDO', 'buyerBankAccount', '2', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700099', 'webAddAcceptBillDO', 'buyerBankName', '3', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700100', 'webAddAcceptBillDO', 'buyer', '4', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700101', 'webAddAcceptBillDO', 'supplierNo', '5', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700102', 'webAddAcceptBillDO', 'suppBankAccount', '6', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700103', 'webAddAcceptBillDO', 'suppBankName', '7', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700104', 'webAddAcceptBillDO', 'supplier', '8', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700105', 'webAddAcceptBillDO', 'billNo', '9', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700106', 'webAddAcceptBillDO', 'agreeNo', '10', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700107', 'webAddAcceptBillDO', 'billType', '11', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700108', 'webAddAcceptBillDO', 'billMode', '12', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700109', 'webAddAcceptBillDO', 'balance', '13', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700110', 'webAddAcceptBillDO', 'invoiceDate', '14', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700111', 'webAddAcceptBillDO', 'endDate', '15', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700112', 'webAddAcceptBillDO', 'acceptor', '16', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700113', 'webAddAcceptBillDO', 'invoicer', '17', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700114', 'webAddAcceptBillDO', 'description', '18', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SCF', 'invoicer', '出票人', 'invoicer', '0', 'C', '50', '0', '50', '0', NULL, NULL, NULL, NULL, '出票人', NULL, NULL, NULL, NULL)$$

## -- 票据修改过滤规则    700115-----------700135
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700115 AND `ID` <= 700135$$
DELETE FROM `t_rule_busin` WHERE `ID` = 700115$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('webSaveModifyAcceptBillDO', NULL, NULL, '编辑汇票信息', NULL, NULL, '1', '20160801', '20160801', '700115', NULL, 'IScfAcceptBillService.webSaveModifyAcceptBillDO', 'com.betterjr.modules.acceptbill.entity.ScfAcceptBillDO')$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700116', 'webSaveModifyAcceptBillDO', 'coreCustNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700117', 'webSaveModifyAcceptBillDO', 'buyerBankAccount', '2', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700118', 'webSaveModifyAcceptBillDO', 'buyerBankName', '3', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700119', 'webSaveModifyAcceptBillDO', 'buyer', '4', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700120', 'webSaveModifyAcceptBillDO', 'supplierNo', '5', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700121', 'webSaveModifyAcceptBillDO', 'suppBankAccount', '6', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700122', 'webSaveModifyAcceptBillDO', 'suppBankName', '7', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700123', 'webSaveModifyAcceptBillDO', 'supplier', '8', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700124', 'webSaveModifyAcceptBillDO', 'billNo', '9', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700125', 'webSaveModifyAcceptBillDO', 'agreeNo', '10', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700126', 'webSaveModifyAcceptBillDO', 'billType', '11', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700127', 'webSaveModifyAcceptBillDO', 'billMode', '12', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700128', 'webSaveModifyAcceptBillDO', 'balance', '13', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700129', 'webSaveModifyAcceptBillDO', 'invoiceDate', '14', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700130', 'webSaveModifyAcceptBillDO', 'endDate', '15', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700131', 'webSaveModifyAcceptBillDO', 'acceptor', '16', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700132', 'webSaveModifyAcceptBillDO', 'invoicer', '17', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700133', 'webSaveModifyAcceptBillDO', 'description', '18', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700134', 'webSaveModifyAcceptBillDO', 'refNo', '19', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700135', 'webSaveModifyAcceptBillDO', 'version', '20', '1', NULL, NULL, NULL, NULL, NULL)$$


## --  票据查询未生效的过滤规则     700136 ------------700144
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700136 AND `ID` <= 700144$$
DELETE FROM `t_rule_busin` WHERE `ID` = 700136$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('webQueryIneffectiveAcceptBill', NULL, NULL, '查询未生效汇票信息', NULL, NULL, '1', '20160804', '20160804', '700136', NULL, 'IScfAcceptBillService.webQueryIneffectiveAcceptBill', 'java.util.HashMap')$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700137', 'webQueryIneffectiveAcceptBill', 'supplierNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700138', 'webQueryIneffectiveAcceptBill', 'coreCustNo', '2', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700139', 'webQueryIneffectiveAcceptBill', 'LIKEbillNo', '3', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700140', 'webQueryIneffectiveAcceptBill', 'businStatus', '4', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700141', 'webQueryIneffectiveAcceptBill', 'GTEinvoiceDate', '5', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700142', 'webQueryIneffectiveAcceptBill', 'LTEinvoiceDate', '6', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700143', 'webQueryIneffectiveAcceptBill', 'GTEendDate', '7', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700144', 'webQueryIneffectiveAcceptBill', 'LTEendDate', '8', '1', NULL, NULL, NULL, NULL, NULL)$$

## -- 票据查询生效的过滤规则   700145  ---------------700153

DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700145 AND `ID` <= 700153$$
DELETE FROM `t_rule_busin` WHERE `ID` = 700145$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('webQueryEffectiveAcceptBill', NULL, NULL, '查询已经生效汇票信息', NULL, NULL, '1', '20160804', '20160804', '700145', NULL, 'IScfAcceptBillService.webQueryEffectiveAcceptBill', 'java.util.HashMap')$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700146', 'webQueryEffectiveAcceptBill', 'supplierNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700147', 'webQueryEffectiveAcceptBill', 'coreCustNo', '2', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700148', 'webQueryEffectiveAcceptBill', 'LIKEbillNo', '3', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700149', 'webQueryEffectiveAcceptBill', 'businStatus', '4', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700150', 'webQueryEffectiveAcceptBill', 'GTEinvoiceDate', '5', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700151', 'webQueryEffectiveAcceptBill', 'LTEinvoiceDate', '6', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700152', 'webQueryEffectiveAcceptBill', 'GTEendDate', '7', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700153', 'webQueryEffectiveAcceptBill', 'LTEendDate', '8', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SALE', 'searchbillNo', '票据编号', 'billNo', '0', 'C', '40', '0', '40', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SALE', 'LIKEbillNo', '票据编号', 'LIKEbillNo', '0', 'C', '40', '0', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$



## -- 票据查询回收过滤规则        700154  ---------700162
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700154 AND `ID` <= 700162$$
DELETE FROM `t_rule_busin` WHERE `ID` = 700154$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('webQueryCanAnnulAcceptBill', NULL, NULL, '查询核准之后废止汇票信息', NULL, NULL, '1', '20160804', '20160804', '700154', NULL, 'IScfAcceptBillService.webQueryCanAnnulAcceptBill', 'java.util.HashMap')$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700155', 'webQueryCanAnnulAcceptBill', 'supplierNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700156', 'webQueryCanAnnulAcceptBill', 'coreCustNo', '2', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700157', 'webQueryCanAnnulAcceptBill', 'LIKEbillNo', '3', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700158', 'webQueryCanAnnulAcceptBill', 'businStatus', '4', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700159', 'webQueryCanAnnulAcceptBill', 'GTEinvoiceDate', '5', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700160', 'webQueryCanAnnulAcceptBill', 'LTEinvoiceDate', '6', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700161', 'webQueryCanAnnulAcceptBill', 'GTEendDate', '7', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700162', 'webQueryCanAnnulAcceptBill', 'LTEendDate', '8', '1', NULL, NULL, NULL, NULL, NULL)$$


## -- 应收账款插入过滤规则  700163 ------------700174
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700163 AND `ID` <= 700174$$
DELETE FROM `t_rule_busin` WHERE `ID` = 700163$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('webAddReceivableDO', NULL, NULL, '新增应收账款', NULL, NULL, '1', '20160728', '20160728', '700163', NULL, 'IScfReceivableService.webAddReceivableDO', 'com.betterjr.modules.receivable.entity.ScfReceivableDO')$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700164', 'webAddReceivableDO', 'agreeNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700165', 'webAddReceivableDO', 'invoiceNos', '2', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700166', 'webAddReceivableDO', 'statementBalance', '3', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700167', 'webAddReceivableDO', 'description', '4', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700168', 'webAddReceivableDO', 'endDate', '5', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700169', 'webAddReceivableDO', 'balance', '6', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700170', 'webAddReceivableDO', 'deductionBalance', '7', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700171', 'webAddReceivableDO', 'surplusBalance', '8', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700172', 'webAddReceivableDO', 'receivableNo', '9', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700173', 'webAddReceivableDO', 'custNo', '10', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700174', 'webAddReceivableDO', 'coreCustNo', '11', '1', NULL, NULL, NULL, NULL, NULL)$$

## -- 应收账款修改过滤规则   700175 ------700188
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700175 AND `ID` <= 700188$$
DELETE FROM `t_rule_busin` WHERE `ID` = 700175$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('webSaveModifyReceivableDO', NULL, NULL, '编辑应收账款', NULL, NULL, '1', '20160728', '20160728', '700175', NULL, 'IScfReceivableService.webSaveModifyReceivableDO', 'com.betterjr.modules.receivable.entity.ScfReceivableDO')$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700176', 'webSaveModifyReceivableDO', 'agreeNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700177', 'webSaveModifyReceivableDO', 'invoiceNos', '2', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700178', 'webSaveModifyReceivableDO', 'statementBalance', '3', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700179', 'webSaveModifyReceivableDO', 'description', '4', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700180', 'webSaveModifyReceivableDO', 'endDate', '5', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700181', 'webSaveModifyReceivableDO', 'balance', '6', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700182', 'webSaveModifyReceivableDO', 'deductionBalance', '7', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700183', 'webSaveModifyReceivableDO', 'surplusBalance', '8', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700184', 'webSaveModifyReceivableDO', 'receivableNo', '9', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700185', 'webSaveModifyReceivableDO', 'custNo', '10', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700186', 'webSaveModifyReceivableDO', 'coreCustNo', '11', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700187', 'webSaveModifyReceivableDO', 'refNo', '12', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700188', 'webSaveModifyReceivableDO', 'version', '13', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SALE', 'surplusBalance', '应付账款余额', 'surplusBalance', '1', 'N', '16', '2', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SALE', 'deductionBalance', '抵扣金额', 'deductionBalance', '1', 'N', '16', '2', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SALE', 'statementBalance', '已结算金额', 'statementBalance', '1', 'N', '16', '2', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SALE', 'invoiceNos', '发票号', 'invoiceNos', '0', 'C', '300', '0', '300', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$

## -- 应收账款查询未生效的过滤规则      700189------------700193
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700189 AND `ID` <= 700193$$
DELETE FROM `t_rule_busin` WHERE `ID` = 700189$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('webQueryIneffectiveReceivable', NULL, NULL, '查询未生效应收账款', NULL, NULL, '1', '20160728', '20160728', '700189', NULL, 'IScfReceivableService.webQueryIneffectiveReceivable', 'java.util.HashMap')$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700190', 'webQueryIneffectiveReceivable', 'custNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700191', 'webQueryIneffectiveReceivable', 'coreCustNo', '2', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700192', 'webQueryIneffectiveReceivable', 'GTEregDate', '3', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700193', 'webQueryIneffectiveReceivable', 'LTEregDate', '4', '1', NULL, NULL, NULL, NULL, NULL)$$

## -- 应收账款查询已生效的过滤规则     700194  --------------  700199
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700194 AND `ID` <= 700199$$
DELETE FROM `t_rule_busin` WHERE `ID` = 700194$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('webQueryEffectiveReceivable', NULL, NULL, '查询未生效应收账款', NULL, NULL, '1', '20160728', '20160728', '700194', NULL, 'IScfReceivableService.webQueryEffectiveReceivable', 'java.util.HashMap')$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700195', 'webQueryEffectiveReceivable', 'custNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700196', 'webQueryEffectiveReceivable', 'coreCustNo', '2', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700197', 'webQueryEffectiveReceivable', 'GTEendDate', '3', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700198', 'webQueryEffectiveReceivable', 'LTEendDate', '4', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700199', 'webQueryEffectiveReceivable', 'businStatus', '5', '1', NULL, NULL, NULL, NULL, NULL)$$


## --  发票新增过滤规则       700200  ------------ 700208
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700200 AND `ID` <= 700208$$
DELETE FROM `t_rule_busin` WHERE `ID` = 700200$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('webAddInvoiceDO', NULL, NULL, '添加订单发票', NULL, NULL, '1', '20160726', '20160725', '700200', NULL, 'IScfInvoiceService.webAddInvoiceDO', 'com.betterjr.modules.order.entity.ScfInvoiceDO')$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700201', 'webAddInvoiceDO', 'invoiceCode', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700202', 'webAddInvoiceDO', 'invoiceNo', '2', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700203', 'webAddInvoiceDO', 'custNo', '3', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700204', 'webAddInvoiceDO', 'coreCustNo', '4', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700205', 'webAddInvoiceDO', 'invoiceDate', '5', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700206', 'webAddInvoiceDO', 'balance', '6', '1', NULL, NULL, NULL, NULL, NULL)$$ 
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700207', 'webAddInvoiceDO', 'drawer', '7', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700208', 'webAddInvoiceDO', 'description', '8', '1', NULL, NULL, NULL, NULL, NULL)$$

## --  发票修改过滤规则      700209  -------------- 700219

DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700209 AND `ID` <= 700219$$
DELETE FROM `t_rule_busin` WHERE `ID` = 700209$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('webSaveModifyInvoiceDO', NULL, NULL, '发票修改', NULL, NULL, '1', '20160726', '20160725', '700209', NULL, 'IScfInvoiceService.webSaveModifyInvoiceDO', 'com.betterjr.modules.order.entity.ScfInvoiceDO')$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700210', 'webSaveModifyInvoiceDO', 'invoiceCode', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700211', 'webSaveModifyInvoiceDO', 'invoiceNo', '2', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700212', 'webSaveModifyInvoiceDO', 'custNo', '3', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700213', 'webSaveModifyInvoiceDO', 'coreCustNo', '4', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700214', 'webSaveModifyInvoiceDO', 'invoiceDate', '5', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700215', 'webSaveModifyInvoiceDO', 'balance', '6', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700216', 'webSaveModifyInvoiceDO', 'drawer', '7', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700217', 'webSaveModifyInvoiceDO', 'description', '8', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700218', 'webSaveModifyInvoiceDO', 'refNo', '9', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700219', 'webSaveModifyInvoiceDO', 'version', '10', '1', NULL, NULL, NULL, NULL, NULL)$$

## --  发票查询未生效的过滤规则       700220  ------------- 700224

DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700220 AND `ID` <= 700224$$
DELETE FROM `t_rule_busin` WHERE `ID` = 700220$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('webQueryIneffectiveInvoice', NULL, NULL, '查询未生效发票', NULL, NULL, '1', '20160727', '20160727', '700220', NULL, 'IScfInvoiceService.webQueryIneffectiveInvoice', 'java.util.HashMap')$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700221', 'webQueryIneffectiveInvoice', 'GTEinvoiceDate', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700222', 'webQueryIneffectiveInvoice', 'LTEinvoiceDate', '2', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700223', 'webQueryIneffectiveInvoice', 'custNo', '3', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700224', 'webQueryIneffectiveInvoice', 'coreCustNo', '4', '1', NULL, NULL, NULL, NULL, NULL)$$


## --  发票查询已经生效的过滤规则    700225  -------------  700231
DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700225 AND `ID` <= 700231$$
DELETE FROM `t_rule_busin` WHERE `ID` = 700225$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('webQueryEffectiveInvoice', NULL, NULL, '查询生效发票', NULL, NULL, '1', '20160727', '20160727', '700225', NULL, 'IScfInvoiceService.webQueryEffectiveInvoice', 'java.util.HashMap')$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700226', 'webQueryEffectiveInvoice', 'businStatus', '4', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700227', 'webQueryEffectiveInvoice', 'GTEinvoiceDate', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700228', 'webQueryEffectiveInvoice', 'LTEinvoiceDate', '2', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700229', 'webQueryEffectiveInvoice', 'custNo', '3', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700230', 'webQueryEffectiveInvoice', 'coreCustNo', '5', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700231', 'webQueryRecycleInvoice', 'coreCustNo', '4', '1', NULL, NULL, NULL, NULL, NULL)$$


## --  发票查询票据池回收过滤规则    700232  ---------------   700236

DELETE FROM `t_rule_busin_validator` WHERE `ID` >= 700232 AND `ID` <= 700236$$
DELETE FROM `t_rule_busin` WHERE `ID` = 700232$$
INSERT INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('webQueryRecycleInvoice', NULL, NULL, '查询可回收发票', NULL, NULL, '1', '20160727', '20160727', '700232', NULL, 'IScfInvoiceService.webQueryRecycleInvoice', 'java.util.HashMap')$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700233', 'webQueryRecycleInvoice', 'GTEinvoiceDate', '1', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700234', 'webQueryRecycleInvoice', 'LTEinvoiceDate', '2', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700235', 'webQueryRecycleInvoice', 'custNo', '3', '1', NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('700236', 'webQueryRecycleInvoice', 'coreCustNo', '4', '1', NULL, NULL, NULL, NULL, NULL)$$



##-------------------------------------------------------------------------------------------------
##--END 请勿 COMMIT
##-------------------------------------------------------------------------------------------------




