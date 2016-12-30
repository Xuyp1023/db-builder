##开户资料包文件类型限制  提交日期 2016/12/20
REPLACE INTO `t_cfg_auth_filegroup` (`c_fileinfotype`, `c_businflag`, `c_description`, `c_sub_rang`, `c_deficiencyinfo`, `c_status`, `c_storetype`, `c_storepath`, `c_permit_filetypes`) VALUES ('CustOpenAccountFilePack', '01', '开户资料包', '开户业务', '开户资料包', '1', '0', NULL, 'zip,rar');

##合同类型id   提交日期2016/12/23
REPLACE INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `C_SYSNO`, `C_TYPE`, `L_DATA_LEN`, `ID`) VALUES ('ScfAgreementType.id', 1, 'SCF', '0', 10, 600002)$$
##合同类型名称 提交日期2016/12/23
REPLACE INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`) VALUES ('SCF', 'agreementTypeName', '合同类型名称', 'agreementTypeName', '1', 'C', 100, 0, 100, 0)$$
##合同类型id   提交日期2016/12/23
REPLACE INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`) VALUES ('SCF', 'agreementTypeId', '合同类型id', 'agreementTypeId', '0', 'C', 18, 0, 18, 0)$$
##标准合同名称 提交日期2016/12/23
REPLACE INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`) VALUES ('SALE', 'agreementStandardName', '标准合同名称', 'agreementStandardName', '1', 'C', 100, 0, 100, 0)$$
##合同类型相关业务
REPLACE INTO `t_rule_busin` (`C_NAME`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_FUNC`, `C_ENTITY`) VALUES ('addAgreementType', NULL, '添加合同类型', '1', '20161223', '20161223', 60037, 'IScfAgreementTypeService.webAddAgreementType', 'com.betterjr.modules.agreement.entity.ScfAgreementType')$$
REPLACE INTO `t_rule_busin` (`C_NAME`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_FUNC`, `C_ENTITY`) VALUES ('saveModifyAgreementType', NULL, '编辑合同类型', '1', '20161223', '20161223', 60038, 'IScfAgreementTypeService.webSaveModifyAgreementType', 'com.betterjr.modules.agreement.entity.ScfAgreementType')$$
REPLACE INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (62801, 'addAgreementType', 'agreementTypeName', 1, '1')$$
REPLACE INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (62802, 'addAgreementType', 'description', 1, '1')$$
REPLACE INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (62901, 'saveModifyAgreementType', 'agreementTypeName', 1, '1')$$
REPLACE INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (62902, 'saveModifyAgreementType', 'description', 1, '1')$$
REPLACE INTO `t_rule_busin` (`C_NAME`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_FUNC`, `C_ENTITY`) VALUES ('queryAgreementType', NULL, '查询合同类型', '1', '20161223', '20161223', 60039, 'IScfAgreementTypeService.webQueryAgreementType', 'java.util.HashMap')$$
REPLACE INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (63101, 'queryAgreementType', 'GTEregDate', 1, '1')$$
REPLACE INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (63102, 'queryAgreementType', 'LTEregDate', 1, '1')$$
REPLACE INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (63103, 'queryAgreementType', 'businStatus', 1, '1')$$

##标准合同相关业务
##合同类型id   提交日期2016/12/23
REPLACE INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `C_SYSNO`, `C_TYPE`, `L_DATA_LEN`, `ID`) VALUES ('ScfAgreementStandard.id', 1, 'SCF', '0', 10, 600003)$$
REPLACE INTO `t_rule_busin` (`C_NAME`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_FUNC`, `C_ENTITY`) VALUES ('addAgreementStandard', NULL, '添加标准合同', '1', '20161223', '20161223', 60040, 'IScfAgreementStandardService.webAddAgreementStandard', 'com.betterjr.modules.agreement.entity.ScfAgreementStandard')$$
REPLACE INTO `t_rule_busin` (`C_NAME`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_FUNC`, `C_ENTITY`) VALUES ('saveModifyAgreementStandard', NULL, '编辑标准合同', '1', '20161223', '20161223', 60041, 'IScfAgreementStandardService.webSaveModifyAgreementStandard', 'com.betterjr.modules.agreement.entity.ScfAgreementStandard')$$
REPLACE INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (63201, 'addAgreementStandard', 'agreementStandardName', 1, '1')$$
REPLACE INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (63202, 'addAgreementStandard', 'agreementTypeId', 1, '1')$$
REPLACE INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (63203, 'addAgreementStandard', 'description', 1, '1')$$
REPLACE INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (63301, 'saveModifyAgreementStandard', 'agreementStandardName', 1, '1')$$
REPLACE INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (63302, 'saveModifyAgreementStandard', 'agreementTypeId', 1, '1')$$
REPLACE INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (63303, 'saveModifyAgreementStandard', 'description', 1, '1')$$
REPLACE INTO `t_rule_busin` (`C_NAME`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_FUNC`, `C_ENTITY`) VALUES ('queryAgreementStandard', NULL, '查询标准合同', '1', '20161223', '20161223', 60042, 'IScfAgreementStandardService.webQueryAgreementStandard', 'java.util.HashMap')$$
REPLACE INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (63401, 'queryAgreementStandard', 'GTEregDate', 1, '1')$$
REPLACE INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (63402, 'queryAgreementStandard', 'LTEregDate', 1, '1')$$
REPLACE INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (63403, 'queryAgreementStandard', 'businStatus', 1, '1')$$
REPLACE INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (63404, 'queryAgreementStandard', 'agreementTypeId', 1, '1')$$