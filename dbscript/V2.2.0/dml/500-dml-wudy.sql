##开户资料包文件类型限制  提交日期 2016/12/20
REPLACE INTO `t_cfg_auth_filegroup` (`c_fileinfotype`, `c_businflag`, `c_description`, `c_sub_rang`, `c_deficiencyinfo`, `c_status`, `c_storetype`, `c_storepath`, `c_permit_filetypes`) VALUES ('CustOpenAccountFilePack', '01', '开户资料包', '开户业务', '开户资料包', '1', '0', NULL, 'zip,rar')$$

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

##字典
replace INTO `t_cfg_dict` (`ID`, `C_SYS`, `C_NAME`, `C_GROUP`, `C_MODIFY`, `C_DESCRIPTION`, `C_OWNER`, `D_MODIDATE`, `C_SCRIPT`, `C_CODE`) VALUES (600009, '2', '标准额合同状态', '1', '0', NULL, NULL, '20170103', '1', 'AgreementStandardStatus')$$
replace INTO `t_cfg_dict` (`ID`, `C_SYS`, `C_NAME`, `C_GROUP`, `C_MODIFY`, `C_DESCRIPTION`, `C_OWNER`, `D_MODIDATE`, `C_SCRIPT`, `C_CODE`) VALUES (600010, '2', '合同类型状态', '1', '0', NULL, NULL, '20170103', '1', 'AgreementTypeStatus')$$

replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (60601, 600009, '0', NULL, '登记', NULL, 0, '1', NULL, NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (60602, 600009, '1', NULL, '生效', NULL, 0, '1', NULL, NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (60603, 600009, '2', NULL, '停用', NULL, 0, '1', NULL, NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (60701, 600008, '0', NULL, '登记', NULL, 0, '1', NULL, NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (60702, 600008, '1', NULL, '生效', NULL, 0, '1', NULL, NULL, '1')$$

##字典排序
delete  from t_cfg_dictitem where L_ITEMNO = '110316'$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11233, 110316, '043', NULL, '保健', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11206, 110316, '016', NULL, '保险', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11246, 110316, '056', NULL, '博彩', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11244, 110316, '054', NULL, '博物馆', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11208, 110316, '018', NULL, '财务', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11212, 110316, '022', NULL, '餐饮', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11245, 110316, '055', NULL, '策展', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11198, 110316, '008', NULL, '出版业', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11240, 110316, '050', NULL, '创意艺术', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11270, 110316, '080', NULL, '大宗交易', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11262, 110316, '072', NULL, '地产建筑', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11293, 110316, '103', NULL, '地面运输', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11289, 110316, '099', NULL, '地热开采', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11279, 110316, '089', NULL, '电力电网', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11199, 110316, '009', NULL, '电影录音', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11257, 110316, '067', NULL, '电子电器', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11193, 110316, '003', NULL, '电子商务', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11194, 110316, '004', NULL, '电子游戏', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11211, 110316, '021', NULL, '法律', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11263, 110316, '073', NULL, '房地产', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11249, 110316, '059', NULL, '纺织皮革业', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11282, 110316, '092', NULL, '非盈利组织', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11210, 110316, '020', NULL, '服务业', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11250, 110316, '060', NULL, '服装业', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11224, 110316, '034', NULL, '高等教育', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11191, 110316, '001', NULL, '高新科技', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11277, 110316, '087', NULL, '给排水', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11272, 110316, '082', NULL, '公共服务', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11280, 110316, '090', NULL, '公共管理', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11216, 110316, '026', NULL, '公关', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11295, 110316, '105', NULL, '管线运输', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11200, 110316, '010', NULL, '广播电视', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11215, 110316, '025', NULL, '广告', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11274, 110316, '084', NULL, '国防军事', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11275, 110316, '085', NULL, '航天', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11296, 110316, '106', NULL, '航运业', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11286, 110316, '096', NULL, '黑色金属', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11192, 110316, '002', NULL, '互联网', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11238, 110316, '048', NULL, '护理服务', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11254, 110316, '064', NULL, '化工业', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11281, 110316, '091', NULL, '环境保护', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11258, 110316, '068', NULL, '机械设备', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11225, 110316, '035', NULL, '基础教育', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11195, 110316, '005', NULL, '计算机软件', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11196, 110316, '006', NULL, '计算机硬件', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11256, 110316, '066', NULL, '家具', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11267, 110316, '077', NULL, '建筑设备', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11290, 110316, '100', NULL, '交通仓储', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11223, 110316, '033', NULL, '教育', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11202, 110316, '012', NULL, '金融', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (1458, 110316, '0', NULL, '金融行业', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11260, 110316, '070', NULL, '金属加工', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11271, 110316, '081', NULL, '进出口贸易', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11217, 110316, '027', NULL, '景观', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11213, 110316, '023', NULL, '酒店', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11261, 110316, '071', NULL, '军火', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11283, 110316, '093', NULL, '开采冶金', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11276, 110316, '086', NULL, '科研', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11237, 110316, '047', NULL, '疗养服务', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11301, 110316, '111', NULL, '林业', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11231, 110316, '041', NULL, '临床医疗', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11269, 110316, '079', NULL, '零售', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11214, 110316, '024', NULL, '旅游', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11268, 110316, '078', NULL, '贸易零售', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11284, 110316, '094', NULL, '煤炭工业', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11234, 110316, '044', NULL, '美容', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11297, 110316, '107', NULL, '民用航空业', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11298, 110316, '108', NULL, '农林牧渔', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11229, 110316, '039', NULL, '培训', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11303, 110316, '113', NULL, '其他', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11255, 110316, '065', NULL, '汽车', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11220, 110316, '030', NULL, '人力资源', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11221, 110316, '031', NULL, '社工服务', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11209, 110316, '019', NULL, '审计', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11236, 110316, '046', NULL, '生物工程', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11285, 110316, '095', NULL, '石油工业', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11248, 110316, '058', NULL, '食品饮料业', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11219, 110316, '029', NULL, '市场推广', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11278, 110316, '088', NULL, '水利能源', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11259, 110316, '069', NULL, '塑料工业', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11266, 110316, '076', NULL, '特殊建造', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11228, 110316, '038', NULL, '特殊教育', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11241, 110316, '051', NULL, '体育健身', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11294, 110316, '104', NULL, '铁路运输', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11201, 110316, '011', NULL, '通信', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11243, 110316, '053', NULL, '图书馆', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11288, 110316, '098', NULL, '土砂石开采', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11292, 110316, '102', NULL, '物流递送', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11265, 110316, '075', NULL, '物业服务', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11207, 110316, '017', NULL, '信贷', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11197, 110316, '007', NULL, '信息传媒', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11300, 110316, '110', NULL, '畜牧养殖业', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11251, 110316, '061', NULL, '烟草业', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11222, 110316, '032', NULL, '养老服务', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11230, 110316, '040', NULL, '医疗服务', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11235, 110316, '045', NULL, '医疗器材', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11239, 110316, '049', NULL, '艺术娱乐', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11203, 110316, '013', NULL, '银行', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11253, 110316, '063', NULL, '印刷业', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11291, 110316, '101', NULL, '邮政', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11287, 110316, '097', NULL, '有色金属', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11227, 110316, '037', NULL, '幼儿教育', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11242, 110316, '052', NULL, '娱乐休闲', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11302, 110316, '112', NULL, '渔业', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11252, 110316, '062', NULL, '造纸业', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11205, 110316, '015', NULL, '证券投资', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11273, 110316, '083', NULL, '政府', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11226, 110316, '036', NULL, '职业教育', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11232, 110316, '042', NULL, '制药', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11247, 110316, '057', NULL, '制造加工', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11299, 110316, '109', NULL, '种植业', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11264, 110316, '074', NULL, '装饰装潢', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11218, 110316, '028', NULL, '咨询分析', NULL, 0, '1', '0', NULL, '1')$$
replace INTO `t_cfg_dictitem` (`ID`, `L_ITEMNO`, `C_VALUE`, `C_CODE`, `C_NAME`, `C_SUBJECT`, `L_SORT`, `C_STATUS`, `C_DEFAULT`, `C_DESCRIPTION`, `C_OUT`) VALUES (11204, 110316, '014', NULL, '资本投资', NULL, 0, '1', '0', NULL, '1')$$
##合同菜单                                                                                                                                                              
insert ignore `t_cfg_menu` (`id`, `c_name`, `c_title`, `n_parent_id`, `n_order`, `c_description`, `d_regdate`, `d_modidate`, `c_endnode`, `C_RULE_LIST`) VALUES (320, '合同管理', '合同管理', 4, 1, '合同管理', '20170104', '20170104', '0', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER')$$

insert ignore `t_cfg_menu` (`id`, `c_name`, `c_title`, `c_url`, `n_parent_id`, `n_order`, `c_description`, `d_regdate`, `d_modidate`, `c_endnode`, `C_RULE_LIST`) VALUES (321, '合同类型登记', '合同类型登记', '../../scf2/home.html#/contractType/contractTypeManage', 320, 1, '合同类型登记', '20170104', '20170104', '1', 'PLATFORM_USER')$$
insert ignore `t_cfg_menu` (`id`, `c_name`, `c_title`, `c_url`, `n_parent_id`, `n_order`, `c_description`, `d_regdate`, `d_modidate`, `c_endnode`, `C_RULE_LIST`) VALUES (322, '合同类型审核', '合同类型审核', '../../scf2/home.html#/contractType/contractTypeAudit', 320, 2, '合同类型审核', '20170104', '20170104', '1', 'PLATFORM_USER')$$
insert ignore `t_cfg_menu` (`id`, `c_name`, `c_title`, `c_url`, `n_parent_id`, `n_order`, `c_description`, `d_regdate`, `d_modidate`, `c_endnode`, `C_RULE_LIST`) VALUES (323, '合同类型查询', '合同类型查询', '../../scf2/home.html#/contractType/contractTypeQuery', 320, 3, '合同类型查询', '20170104', '20170104', '1', 'PLATFORM_USER')$$

insert ignore `t_cfg_menu` (`id`, `c_name`, `c_title`, `c_url`, `n_parent_id`, `n_order`, `c_description`, `d_regdate`, `d_modidate`, `c_endnode`, `C_RULE_LIST`) VALUES (324, '标准合同登记', '标准合同登记', '../../scf2/home.html#/standardContract/list', 320, 4, '标准合同登记', '20170104', '20170104', '1', 'PLATFORM_USER')$$
insert ignore `t_cfg_menu` (`id`, `c_name`, `c_title`, `c_url`, `n_parent_id`, `n_order`, `c_description`, `d_regdate`, `d_modidate`, `c_endnode`, `C_RULE_LIST`) VALUES (325, '标准合同审核', '标准合同审核', '../../scf2/home.html#/standardContract/aduit', 320, 5, '标准合同审核', '20170104', '20170104', '1', 'PLATFORM_USER')$$
insert ignore `t_cfg_menu` (`id`, `c_name`, `c_title`, `c_url`, `n_parent_id`, `n_order`, `c_description`, `d_regdate`, `d_modidate`, `c_endnode`, `C_RULE_LIST`) VALUES (326, '标准合同查询', '标准合同查询', '../../scf2/home.html#/standardContract/query', 320, 6, '标准合同查询', '20170104', '20170104', '1', 'PLATFORM_USER')$$

##更新开户附件信息
UPDATE `t_cfg_auth_filegroup` SET `c_fileinfotype`='CustBankOpenLicenseFile', `c_description`='银行账户开户许可证', `c_deficiencyinfo`='银行账户开户许可证' WHERE  `c_fileinfotype`='bankAcctAckFile'$$
UPDATE `t_cfg_auth_filegroup_agency` set `c_fileinfotype`='CustBankOpenLicenseFile', `c_description`='银行账户开户许可证' WHERE  `c_fileinfotype`='bankAcctAckFile'$$
UPDATE `t_cfg_auth_filegroup` SET `c_fileinfotype`='CustBizLicenseFile', `c_description`='营业执照附件', `c_deficiencyinfo`='营业执照附件' WHERE  `c_fileinfotype`='bizLicenseFile'$$
UPDATE `t_cfg_auth_filegroup_agency` set `c_fileinfotype`='CustBizLicenseFile', `c_description`='营业执照附件' WHERE  `c_fileinfotype`='bizLicenseFile'$$
UPDATE `t_cfg_auth_filegroup` SET `c_fileinfotype`='BrokerIdHeadFile', `c_description`='经办人身份证-头像面', `c_deficiencyinfo`='经办人身份证-头像面' WHERE  `c_fileinfotype`='brokerIdFile'$$
UPDATE `t_cfg_auth_filegroup_agency` set `c_fileinfotype`='BrokerIdHeadFile', `c_description`='经办人身份证-头像面件' WHERE  `c_fileinfotype`='brokerIdFile'$$
UPDATE `t_cfg_auth_filegroup` SET `c_fileinfotype`='CustOrgCodeFile', `c_description`='组织机构代码证', `c_deficiencyinfo`='组织机构代码证' WHERE  `c_fileinfotype`='orgCodeFile'$$
UPDATE `t_cfg_auth_filegroup_agency` set `c_fileinfotype`='CustOrgCodeFile', `c_description`='组织机构代码证' WHERE  `c_fileinfotype`='orgCodeFile'$$
UPDATE `t_cfg_auth_filegroup` SET `c_fileinfotype`='RepresentIdHeadFile', `c_description`='法人身份证-头像面', `c_deficiencyinfo`='法人身份证-头像面' WHERE  `c_fileinfotype`='representIdFile'$$
UPDATE `t_cfg_auth_filegroup_agency` set `c_fileinfotype`='RepresentIdHeadFile', `c_description`='法人身份证-头像面' WHERE  `c_fileinfotype`='representIdFile'$$
UPDATE `t_cfg_auth_filegroup` SET `c_fileinfotype`='CustTaxRegistFile', `c_description`='税务登记证', `c_deficiencyinfo`='税务登记证' WHERE  `c_fileinfotype`='taxRegistFile'$$
UPDATE `t_cfg_auth_filegroup_agency` set `c_fileinfotype`='CustTaxRegistFile', `c_description`='税务登记证' WHERE  `c_fileinfotype`='taxRegistFile'$$
INSERT IGNORE `t_cfg_auth_filegroup` (`c_fileinfotype`, `c_description`, `c_sub_rang`, `c_deficiencyinfo`) VALUES ('CustCreditCodeFile', '机构信用代码证', '保理业务', '机构信用代码证')$$
INSERT IGNORE `t_cfg_auth_filegroup` (`c_fileinfotype`, `c_description`, `c_sub_rang`, `c_deficiencyinfo`) VALUES ('BrokerIdNationFile', '经办人身份证-国徽面', '保理业务', '经办人身份证-国徽面')$$
INSERT IGNORE `t_cfg_auth_filegroup` (`c_fileinfotype`, `c_description`, `c_sub_rang`, `c_deficiencyinfo`) VALUES ('BrokerIdHoldFile', '经办人身份证-手持证件', '保理业务', '经办人身份证-手持证件')$$
INSERT IGNORE `t_cfg_auth_filegroup` (`c_fileinfotype`, `c_description`, `c_sub_rang`, `c_deficiencyinfo`) VALUES ('RepresentIdNationFile', '法人身份证-国徽面', '保理业务', '法人身份证-国徽面')$$
INSERT IGNORE `t_cfg_auth_filegroup` (`c_fileinfotype`, `c_description`, `c_sub_rang`, `c_deficiencyinfo`) VALUES ('RepresentIdHoldFile', '法人身份证-手持证件', '保理业务', '法人身份证-手持证件')$$
##统一机构信息部分附件字典     提交日期:2017/01/05
UPDATE `t_cfg_dictitem` SET `C_VALUE`='RepresentIdHeadFile', `C_NAME`='法人身份证-头像面' WHERE  `ID`=20041$$
UPDATE `t_cfg_dictitem` SET `C_VALUE`='RepresentIdNationFile', `C_NAME`='法人身份证-国徽面' WHERE  `ID`=20042$$
UPDATE `t_cfg_dictitem` SET `C_VALUE`='RepresentIdHoldFile', `C_NAME`='法人身份证-手持证件' WHERE  `ID`=20043$$
UPDATE `t_cfg_dictitem` SET `C_NAME`='营业执照' WHERE  `ID`=20071$$
UPDATE `t_cfg_dictitem` SET `C_NAME`='税务登记证' WHERE  `ID`=20072$$
UPDATE `t_cfg_dictitem` SET `C_NAME`='组织机构代码证' WHERE  `ID`=20073$$
DELETE FROM `t_cfg_dictitem` WHERE  `ID`=20074$$
UPDATE `t_cfg_dictitem` SET `C_VALUE`='CustBankOpenLicenseFile', `C_NAME`='银行账户开户许可证' WHERE  `ID`=20091$$
DELETE FROM `t_cfg_dictitem` WHERE  `ID`=20092$$

##融资申请查询订单、汇票、应收  提交日期:2017/01/10    bug448
replace INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('findOrderList', NULL, NULL, '订单信息无分页查询', NULL, NULL, '1', '20170104', '20170104', 60043, NULL, 'IScfOrderService.webFindOrderList', 'java.util.HashMap')$$
replace INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('findAcceptBillList', NULL, NULL, '汇票信息无分页查询', NULL, NULL, '1', '20170104', '20170104', 60044, NULL, 'IScfAcceptBillService.webFindAcceptBillList', 'java.util.HashMap')$$
replace INTO `t_rule_busin` (`C_NAME`, `C_TYPE`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_GROUP`, `C_ERRORINFO`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_VERSION`, `C_FUNC`, `C_ENTITY`) VALUES ('findReceivableList', NULL, NULL, '应收信息无分页查询', NULL, NULL, '1', '20170104', '20170104', 60045, NULL, 'IScfReceivableService.webFindReceivableList', 'java.util.HashMap')$$
replace INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (63501, 'findOrderList', 'custNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
replace INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (63502, 'findOrderList', 'coreCustNo', 2, '1', NULL, NULL, NULL, NULL, NULL)$$
replace INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (63601, 'findAcceptBillList', 'custNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
replace INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (63602, 'findAcceptBillList', 'coreCustNo', 2, '1', NULL, NULL, NULL, NULL, NULL)$$
replace INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (63701, 'findReceivableList', 'custNo', 1, '1', NULL, NULL, NULL, NULL, NULL)$$
replace INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (63702, 'findReceivableList', 'coreCustNo', 2, '1', NULL, NULL, NULL, NULL, NULL)$$


##融资查询条件修改  提交日期:2017/01/10    bug447
INSERT ignore `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) VALUES (61440, 'queryCoreEnterpriseRequest', 'blk-custType', 4, '1')$$


##合同输入格式限定  提交日期:2017/01/13		bug464
UPDATE `t_rule_validator` SET `N_DATA_LEN`=120, `F_MAX`=120, `C_VALIDATOR`='matchValid', `C_PATTERN`='^[a-zA-Z0-9\\u4e00-\\u9fa5]+$' WHERE  `C_SYS`='SCF' AND `C_VALID_NAME`='agreementTypeName' AND `C_SHOW_NAME`='合同类型名称' AND `C_NAME`='agreementTypeName' AND `C_MUSTITEM`='1' AND `C_DATA_TYPE`='C' AND `N_DATA_LEN`=100 AND `N_DATA_SCALE`=0 AND `F_MAX`=100 AND `F_MIN`=0 AND `C_VALIDATOR` IS NULL AND `C_PATTERN` IS NULL AND `D_REGDATE` IS NULL AND `D_MODIDATE` IS NULL AND `C_DESCRIPTION` IS NULL AND `C_BUSIN_FIELD` IS NULL AND `C_DEPENDS` IS NULL AND `C_MESSAGE` IS NULL AND `C_REF_VALUE` IS NULL LIMIT 1$$
UPDATE `t_rule_validator` SET `N_DATA_LEN`=60, `F_MAX`=60, `C_VALIDATOR`='matchValid', `C_PATTERN`='^[a-zA-Z0-9\\u4e00-\\u9fa5]+$' WHERE  `C_SYS`='SALE' AND `C_VALID_NAME`='agreementStandardName' AND `C_SHOW_NAME`='标准合同名称' AND `C_NAME`='agreementStandardName' AND `C_MUSTITEM`='1' AND `C_DATA_TYPE`='C' AND `N_DATA_LEN`=100 AND `N_DATA_SCALE`=0 AND `F_MAX`=100 AND `F_MIN`=0 AND `C_VALIDATOR` IS NULL AND `C_PATTERN` IS NULL AND `D_REGDATE` IS NULL AND `D_MODIDATE` IS NULL AND `C_DESCRIPTION` IS NULL AND `C_BUSIN_FIELD` IS NULL AND `C_DEPENDS` IS NULL AND `C_MESSAGE` IS NULL AND `C_REF_VALUE` IS NULL LIMIT 1$$

##融资申请查询条件   提交日期:2017/01/13   bug486
UPDATE `t_rule_busin_validator` SET `C_VALID_NAME`='custNo' WHERE  `ID`=63601 AND `C_BUSIN_NAME`='findAcceptBillList' AND `C_VALID_NAME`='holderNo' AND `N_PRIORITY`=1 AND `C_STATUS`='1' AND `D_REGDATE` IS NULL AND `D_MODIDATE` IS NULL AND `C_SHOW_NAME` IS NULL AND `C_NAME` IS NULL AND `C_MUSTITEM` IS NULL LIMIT 1$$


##客户信息查询菜单   提交日期：2017/01/20
REPLACE INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (601, NULL, '客户信息查询', '客户信息查询', '../../scf2/home.html#/plat/custInfo', NULL, 256, 5, '', '1', '20160918', '20160918', NULL, '1', 'PLATFORM_USER')$$
REPLACE INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) VALUES (602, NULL, '客户信息查询', '客户信息查询', '../../scf2/home.html#/fac/custInfo', NULL, 283, 5, '', '1', '20160918', '20160918', NULL, '1', 'FACTOR_USER')$$