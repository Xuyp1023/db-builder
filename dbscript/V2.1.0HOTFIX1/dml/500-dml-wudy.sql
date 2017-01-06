##--bug-254 出票日期 搜索条件无效 提交日期2016/11/16
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) select 60705, 'queryAcceptBill', 'GTEinvoiceDate', 5, '1' from dual where not exists (select 1 from t_rule_busin_validator where id = 60705)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) select 60706, 'queryAcceptBill', 'LTEinvoiceDate', 6, '1' from dual where not exists (select 1 from t_rule_busin_validator where id = 60706)$$

##--bug-286 字典修改 提交日期2016/11/17
UPDATE `t_cfg_dictitem` SET `C_NAME`='商业承兑汇票' WHERE  `ID`=1066$$
UPDATE `t_cfg_dictitem` SET `C_NAME`='商业承兑汇票' WHERE  `ID`=30037$$
UPDATE `t_cfg_dictitem` SET `C_NAME`='银行承兑汇票' WHERE  `ID`=1067$$
UPDATE `t_cfg_dictitem` SET `C_NAME`='银行承兑汇票' WHERE  `ID`=30038$$

##--bug-289 修改供应商变更  提交日期2016/11/17
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) select 60810, 'saveModifyOrder', 'custNO', 10, '1' from dual where not exists (select 1 from t_rule_busin_validator where id = 60810)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) select 60410, 'saveModifyReceivable', 'coreCustNo', 10, '1' from dual where not exists (select 1 from t_rule_busin_validator where id = 60410)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) select 60411, 'saveModifyReceivable', 'custNo', 11, '1' from dual where not exists (select 1 from t_rule_busin_validator where id = 60411)$$

##-- 菜单修改		提交日期2016/11/18
update t_cfg_menu set c_rule_list='SUPPLIER_USER,SELLER_USER' where id=303$$
INSERT INTO `t_cfg_menu` (`id`, `c_sys`, `c_name`, `c_title`, `c_url`, `c_target`, `n_parent_id`, `n_order`, `c_description`, `c_status`, `d_regdate`, `d_modidate`, `c_openmode`, `c_endnode`, `C_RULE_LIST`) select 309, NULL, '发票管理', '发票管理', '../../scf2/views/core/bill/billManage.html', NULL, 223, 6, '', '1', '20161118', '20161118', NULL, '1', 'FACTOR_USER' from dual where not exists(select 1 from t_cfg_menu where id = 309)$$

##--菜单修改  提交日期2016/11/21
UPDATE `t_cfg_menu` SET `c_url`='../../scf2/views/sfccom/invoice/InvoiceManage.html' WHERE  `id`=309$$

##开户申请规则添加   提交日期 2016/11/25
INSERT INTO `t_rule_busin` (`C_NAME`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_FUNC`, `C_ENTITY`) select 'saveOpenAccountApply', NULL, '开户申请', '1', '20160727', '20160727', 60036, 'ICustOpenAccountService2.webSaveOpenAccountApply', 'com.betterjr.modules.customer.entity.CustOpenAccountTmp' from dual where not exists (select 1 from `t_rule_busin` where C_NAME = 'saveOpenAccountApply' and id = 60036)$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `D_REGDATE`, `C_DESCRIPTION`) select 'SCF', 'acc-taxNo', '税务登记证号码', 'taxNo', '0', 'C', 30, 0, 30, '20161122', '邮编' from dual where not exists (select 1 from t_rule_validator where C_VALID_NAME = 'acc-taxNo')$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `D_REGDATE`, `C_DESCRIPTION`) select 'SCF', 'acc-openLicense', '开户许可证核准号', 'openLicense', '0', 'C', 30, 0, 30, '20161122', '邮编' from dual where not exists (select 1 from t_rule_validator where C_VALID_NAME = 'acc-openLicense')$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) select 10182, 'saveOpenAccountApply', 'acc-taxNo', 27, '1' from dual where not exists (select 1 from `t_rule_busin_validator` where id = 10182)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) select 10183, 'saveOpenAccountApply', 'acc-openLicense', 28, '1' from dual where not exists (select 1 from `t_rule_busin_validator` where id = 10183)$$

##开户暂存规则添加  提交日期 2016/11/25
INSERT INTO `t_rule_busin` (`C_NAME`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_FUNC`, `C_ENTITY`) select 'saveOpenAccountInfo', NULL, '客户开户资料暂存', '1', '20160727', '20160727', 10020, 'ICustOpenAccountService2.webSaveOpenAccountInfo', 'com.betterjr.modules.customer.entity.CustOpenAccountTmp' from dual where not exists (select 1 from `t_rule_busin` where id = 10020)$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `D_REGDATE`, `C_DESCRIPTION`) select 'SCF', 'acc-role', '客户角色', 'role', '0', 'C', 30, 0, 30, 0, '20160718', '银行账户' from dual where not exists (select 1 from `t_rule_validator` where C_VALID_NAME = 'acc-role')$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `D_REGDATE`, `C_DESCRIPTION`) select 'SCF', 'acc-dealPassword', '交易密码', 'dealPassword', '0', 'C', 30, 0, 30, 0, '20160718', '银行账户' from dual where not exists (select 1 from `t_rule_validator` where C_VALID_NAME = 'acc-dealPassword')$$
INSERT INTO `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `D_REGDATE`, `C_DESCRIPTION`) select 'SCF', 'acc-wechatOpenId', '微信标识号', 'wechatOpenId', '0', 'C', 30, 0, 30, 0, '20160718', '银行账户' from dual where not exists (select 1 from `t_rule_validator` where C_VALID_NAME = 'acc-wechatOpenId')$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) select 10201, 'saveOpenAccountInfo', 'acc-role', 27, '1' from dual where not exists (select 1 from `t_rule_busin_validator` where id = 10201)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) select 10202, 'saveOpenAccountInfo', 'acc-dealPassword', 28, '1' from dual where not exists (select 1 from `t_rule_busin_validator` where id = 10202)$$
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) select 10203, 'saveOpenAccountInfo', 'acc-wechatOpenId', 29, '1' from dual where not exists (select 1 from `t_rule_busin_validator` where id = 10203)$$

##必填字段取消  提交日期 2016/11/25
UPDATE `t_rule_validator` SET `C_MUSTITEM`='0' WHERE  `C_SYS`='SCF' AND `C_VALID_NAME`='acc-bankName' AND `C_SHOW_NAME`='开户银行全称' AND `C_NAME`='bankName' AND `C_MUSTITEM`='1' AND `C_DATA_TYPE`='C' AND `N_DATA_LEN`=100 AND `N_DATA_SCALE`=0 AND `F_MAX`=100 AND `F_MIN`=5 AND `C_VALIDATOR` IS NULL AND `C_PATTERN` IS NULL AND `D_REGDATE`='20160718' AND `D_MODIDATE` IS NULL AND `C_DESCRIPTION`='开户银行全称' AND `C_BUSIN_FIELD` IS NULL AND `C_DEPENDS` IS NULL AND `C_MESSAGE` IS NULL AND `C_REF_VALUE` IS NULL LIMIT 1$$
UPDATE `t_rule_validator` SET `C_MUSTITEM`='0' WHERE  `C_SYS`='SCF' AND `C_VALID_NAME`='acc-bankNo' AND `C_SHOW_NAME`='银行编号' AND `C_NAME`='bankNo' AND `C_MUSTITEM`='1' AND `C_DATA_TYPE`='C' AND `N_DATA_LEN`=30 AND `N_DATA_SCALE`=0 AND `F_MAX` IS NULL AND `F_MIN` IS NULL AND `C_VALIDATOR` IS NULL AND `C_PATTERN` IS NULL AND `D_REGDATE`='20160718' AND `D_MODIDATE` IS NULL AND `C_DESCRIPTION`='银行编号' AND `C_BUSIN_FIELD` IS NULL AND `C_DEPENDS` IS NULL AND `C_MESSAGE` IS NULL AND `C_REF_VALUE` IS NULL LIMIT 1$$
UPDATE `t_rule_validator` SET `C_MUSTITEM`='0' WHERE  `C_SYS`='SCF' AND `C_VALID_NAME`='acc-lawIdentNo' AND `C_SHOW_NAME`='法人证件号码' AND `C_NAME`='lawIdentNo' AND `C_MUSTITEM`='1' AND `C_DATA_TYPE`='C' AND `N_DATA_LEN`=30 AND `N_DATA_SCALE`=0 AND `F_MAX` IS NULL AND `F_MIN` IS NULL AND `C_VALIDATOR` IS NULL AND `C_PATTERN` IS NULL AND `D_REGDATE`='20160718' AND `D_MODIDATE` IS NULL AND `C_DESCRIPTION`='法人证件号码' AND `C_BUSIN_FIELD` IS NULL AND `C_DEPENDS` IS NULL AND `C_MESSAGE` IS NULL AND `C_REF_VALUE` IS NULL LIMIT 1$$
UPDATE `t_rule_validator` SET `C_MUSTITEM`='0' WHERE  `C_SYS`='SCF' AND `C_VALID_NAME`='acc-lawName' AND `C_SHOW_NAME`='法人' AND `C_NAME`='lawName' AND `C_MUSTITEM`='1' AND `C_DATA_TYPE`='C' AND `N_DATA_LEN`=60 AND `N_DATA_SCALE`=0 AND `F_MAX` IS NULL AND `F_MIN` IS NULL AND `C_VALIDATOR` IS NULL AND `C_PATTERN` IS NULL AND `D_REGDATE`='20160718' AND `D_MODIDATE` IS NULL AND `C_DESCRIPTION`='法人' AND `C_BUSIN_FIELD` IS NULL AND `C_DEPENDS` IS NULL AND `C_MESSAGE` IS NULL AND `C_REF_VALUE` IS NULL LIMIT 1$$

##代录信息保存规则校验  提交日期 2016/11/25
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`) select 10184, 'saveOpenAccountInfoInstead', 'acc-taxNo', 27, '1' from dual where not exists (select 1 from `t_rule_busin_validator` where id = 10184)$$
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