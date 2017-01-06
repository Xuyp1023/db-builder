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