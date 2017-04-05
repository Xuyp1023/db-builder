##--证书管理员默认角色菜单关系数据 提交日期2017/03/24
DELETE FROM t_cfg_menu_role  where ID in (1,2,3,4,5,6)$$
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`, `c_shirouser_type`) VALUES (1, 'OPERATOR_ADMIN', NULL, 242, NULL, '1', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER')$$
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`, `c_shirouser_type`) VALUES (6, 'OPERATOR_ADMIN', NULL, 60, NULL, '1', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER')$$
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`, `c_shirouser_type`) VALUES (5, 'OPERATOR_ADMIN', NULL, 64, NULL, '1', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER')$$
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`, `c_shirouser_type`) VALUES (4, 'OPERATOR_ADMIN', NULL, 63, NULL, '1', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER')$$
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`, `c_shirouser_type`) VALUES (3, 'OPERATOR_ADMIN', NULL, 206, NULL, '1', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER')$$
INSERT INTO `t_cfg_menu_role` (`id`, `n_rule_id`, `c_rule_name`, `n_menu_id`, `c_menu_name`, `c_status`, `c_shirouser_type`) VALUES (2, 'OPERATOR_ADMIN', NULL, 205, NULL, '1', 'SUPPLIER_USER,SELLER_USER,CORE_USER,FACTOR_USER,PLATFORM_USER')$$




##--茂业集团远程调用接口信息sql 添加
DELETE FROM t_far_interface WHERE C_FACE='MAOY'$$
INSERT INTO `t_far_interface` (`C_FACE`, `C_NAME`, `C_SIGN`, `C_FORMAT`, `C_ENCRYPT`, `C_HEADSIGN`, `C_FIELDORDER`, `C_FTP`, `C_URL`, `C_CHARSET`, `C_KEYPATH`, `C_KEYPASS`, `C_OWNER`, `C_GROUP`, `C_PROVIDER`, `D_MODIDATE`, `C_MUSTITEM`, `C_ERR_MODE`) VALUES ('MAOY', '茂业', '1', 'JSON', '9', '0', '0', ' ', ' ', 'UTF-8', 'keys/maoy', 'priv:maoye', 'hubl', 'SCF', NULL, '20170330', '0', 'yqr')$$

DELETE FROM t_far_function WHERE C_FACE='MAOY'$$
INSERT INTO `t_far_function` (`C_FACE`, `C_FUN`, `C_CODE`, `C_NAME`, `C_DESCRIPTION`, `C_URL`, `C_FACEURL`, `C_INCLASS`, `C_OUTCLASS`, `D_MODIDATE`, `C_INPUT_MODE`, `C_OUTPUT_MODE`, `C_INVOKE_MODE`, `C_DATA_ENCODER`, `C_DATA_DECODER`, `C_RESULTCODE`) VALUES ('MAOY', 'accessFristLogin', 'accessFristLogin', '首次登陆', 'webservice接口', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', NULL, NULL, NULL)$$
INSERT INTO `t_far_function` (`C_FACE`, `C_FUN`, `C_CODE`, `C_NAME`, `C_DESCRIPTION`, `C_URL`, `C_FACEURL`, `C_INCLASS`, `C_OUTCLASS`, `D_MODIDATE`, `C_INPUT_MODE`, `C_OUTPUT_MODE`, `C_INVOKE_MODE`, `C_DATA_ENCODER`, `C_DATA_DECODER`, `C_RESULTCODE`) VALUES ('MAOY', 'accessTicket', 'accessTicket', '获取ticket', 'webservice接口', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', NULL, NULL, NULL)$$
INSERT INTO `t_far_function` (`C_FACE`, `C_FUN`, `C_CODE`, `C_NAME`, `C_DESCRIPTION`, `C_URL`, `C_FACEURL`, `C_INCLASS`, `C_OUTCLASS`, `D_MODIDATE`, `C_INPUT_MODE`, `C_OUTPUT_MODE`, `C_INVOKE_MODE`, `C_DATA_ENCODER`, `C_DATA_DECODER`, `C_RESULTCODE`) VALUES ('MAOY', 'batchProcessData', 'batchProcessData', '批量数据处理，一次性处理一种类型', 'webservice接口', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', NULL, NULL, NULL)$$
INSERT INTO `t_far_function` (`C_FACE`, `C_FUN`, `C_CODE`, `C_NAME`, `C_DESCRIPTION`, `C_URL`, `C_FACEURL`, `C_INCLASS`, `C_OUTCLASS`, `D_MODIDATE`, `C_INPUT_MODE`, `C_OUTPUT_MODE`, `C_INVOKE_MODE`, `C_DATA_ENCODER`, `C_DATA_DECODER`, `C_RESULTCODE`) VALUES ('MAOY', 'findDataProcess', 'findDataProcess', '查找需要处理的数据', 'webservice接口', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', NULL, NULL, NULL)$$
INSERT INTO `t_far_function` (`C_FACE`, `C_FUN`, `C_CODE`, `C_NAME`, `C_DESCRIPTION`, `C_URL`, `C_FACEURL`, `C_INCLASS`, `C_OUTCLASS`, `D_MODIDATE`, `C_INPUT_MODE`, `C_OUTPUT_MODE`, `C_INVOKE_MODE`, `C_DATA_ENCODER`, `C_DATA_DECODER`, `C_RESULTCODE`) VALUES ('MAOY', 'findUnCheckAccount', 'findUnCheckAccount', '查找未注册的客户资料信息', 'webservice接口', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', NULL, NULL, NULL)$$
INSERT INTO `t_far_function` (`C_FACE`, `C_FUN`, `C_CODE`, `C_NAME`, `C_DESCRIPTION`, `C_URL`, `C_FACEURL`, `C_INCLASS`, `C_OUTCLASS`, `D_MODIDATE`, `C_INPUT_MODE`, `C_OUTPUT_MODE`, `C_INVOKE_MODE`, `C_DATA_ENCODER`, `C_DATA_DECODER`, `C_RESULTCODE`) VALUES ('MAOY', 'findWorkAccount', 'findWorkAccount', '查找处理数据需要的银行账户信息等', 'webservice接口', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', NULL, NULL, NULL)$$
INSERT INTO `t_far_function` (`C_FACE`, `C_FUN`, `C_CODE`, `C_NAME`, `C_DESCRIPTION`, `C_URL`, `C_FACEURL`, `C_INCLASS`, `C_OUTCLASS`, `D_MODIDATE`, `C_INPUT_MODE`, `C_OUTPUT_MODE`, `C_INVOKE_MODE`, `C_DATA_ENCODER`, `C_DATA_DECODER`, `C_RESULTCODE`) VALUES ('MAOY', 'processCoreCorp', 'processCoreCorp', '批量接收核心组织机构信息', 'webservice接口', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', NULL, NULL, NULL)$$
INSERT INTO `t_far_function` (`C_FACE`, `C_FUN`, `C_CODE`, `C_NAME`, `C_DESCRIPTION`, `C_URL`, `C_FACEURL`, `C_INCLASS`, `C_OUTCLASS`, `D_MODIDATE`, `C_INPUT_MODE`, `C_OUTPUT_MODE`, `C_INVOKE_MODE`, `C_DATA_ENCODER`, `C_DATA_DECODER`, `C_RESULTCODE`) VALUES ('MAOY', 'processData', 'processData', '单账户数据处理', 'webservice接口', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', NULL, NULL, NULL)$$
INSERT INTO `t_far_function` (`C_FACE`, `C_FUN`, `C_CODE`, `C_NAME`, `C_DESCRIPTION`, `C_URL`, `C_FACEURL`, `C_INCLASS`, `C_OUTCLASS`, `D_MODIDATE`, `C_INPUT_MODE`, `C_OUTPUT_MODE`, `C_INVOKE_MODE`, `C_DATA_ENCODER`, `C_DATA_DECODER`, `C_RESULTCODE`) VALUES ('MAOY', 'processPushData', 'processPushData', '接收资金管理系统推送的数据', 'webservice接口', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', NULL, NULL, NULL)$$


DELETE FROM t_far_config WHERE C_FACE='MAOY'$$
INSERT INTO `t_far_config` (`C_FACE`, `C_NAME`, `C_VALUE`, `C_TYPE`, `C_SPLIT`, `C_SCOPE`, `C_DESCRIPTION`, `N_ORDER`, `ID`) VALUES ('MAOY', 'attachData', '茂业商厦有限公司', NULL, '0', '0', '附加数据，用于被客户端调用时，传递数据到服务端实现接口', 0, 22)$$
INSERT INTO `t_far_config` (`C_FACE`, `C_NAME`, `C_VALUE`, `C_TYPE`, `C_SPLIT`, `C_SCOPE`, `C_DESCRIPTION`, `N_ORDER`, `ID`) VALUES ('MAOY', 'encrypt_use', 'false', NULL, '0', '0', '使用加密模式；默认使用', 0, 6)$$
INSERT INTO `t_far_config` (`C_FACE`, `C_NAME`, `C_VALUE`, `C_TYPE`, `C_SPLIT`, `C_SCOPE`, `C_DESCRIPTION`, `N_ORDER`, `ID`) VALUES ('MAOY', 'partnerCode', 'maoy', NULL, '0', '0', '合作商代码-webservice', 0, NULL)$$
INSERT INTO `t_far_config` (`C_FACE`, `C_NAME`, `C_VALUE`, `C_TYPE`, `C_SPLIT`, `C_SCOPE`, `C_DESCRIPTION`, `N_ORDER`, `ID`) VALUES ('MAOY', 'partnerToken', 'maoy123', NULL, '0', '0', '提供给合作商的token-webservice', 0, NULL)$$
INSERT INTO `t_far_config` (`C_FACE`, `C_NAME`, `C_VALUE`, `C_TYPE`, `C_SPLIT`, `C_SCOPE`, `C_DESCRIPTION`, `N_ORDER`, `ID`) VALUES ('MAOY', 'process_Input', 'false', NULL, '0', '0', '是否需要映射转换处理，默认是需要', 0, 16)$$
INSERT INTO `t_far_config` (`C_FACE`, `C_NAME`, `C_VALUE`, `C_TYPE`, `C_SPLIT`, `C_SCOPE`, `C_DESCRIPTION`, `N_ORDER`, `ID`) VALUES ('MAOY', 'sign_data', 'true', NULL, '0', '0', '使用签名模式', 0, 7)$$
INSERT INTO `t_far_config` (`C_FACE`, `C_NAME`, `C_VALUE`, `C_TYPE`, `C_SPLIT`, `C_SCOPE`, `C_DESCRIPTION`, `N_ORDER`, `ID`) VALUES ('MAOY', 'token', 'bytter123456789', NULL, '0', '0', '避免外部攻击，约定的token，定期更换', 0, NULL)$$


##--基金附件类型添加
delete from t_cfg_auth_filegroup where C_FILEINFOTYPE in ('authorizeFile','bankAcctAckFile','bizLicenseFile','brokerIdFile','capitalReportFile','orgCodeFile', 'proveAssetsFile','representIdFile','serviceContractFile','taxRegistFile')$$
insert into t_cfg_auth_filegroup (C_FILEINFOTYPE, C_BUSINFLAG, C_DESCRIPTION, C_SUB_RANG, C_DEFICIENCYINFO, C_STATUS)
values ('authorizeFile', '01', '授权书', '基金业务', '授权书', '1')$$

insert into t_cfg_auth_filegroup (C_FILEINFOTYPE, C_BUSINFLAG, C_DESCRIPTION, C_SUB_RANG, C_DEFICIENCYINFO, C_STATUS)
values ('bankAcctAckFile', '01', '银行开户证明附件', '保理业务', '银行开户证明附件', '1')$$

insert into t_cfg_auth_filegroup (C_FILEINFOTYPE, C_BUSINFLAG, C_DESCRIPTION, C_SUB_RANG, C_DEFICIENCYINFO, C_STATUS)
values ('bizLicenseFile', '01', '企业营业执照附件', '保理业务', '企业营业执照附件', '1')$$

insert into t_cfg_auth_filegroup (C_FILEINFOTYPE, C_BUSINFLAG, C_DESCRIPTION, C_SUB_RANG, C_DEFICIENCYINFO, C_STATUS)
values ('brokerIdFile', '01', '经办人身份证附件', '保理业务', '经办人身份证附件', '1')$$

insert into t_cfg_auth_filegroup (C_FILEINFOTYPE, C_BUSINFLAG, C_DESCRIPTION, C_SUB_RANG, C_DEFICIENCYINFO, C_STATUS)
values ('capitalReportFile', '01', '验资报告', '保理业务', '验资报告', '1')$$

insert into t_cfg_auth_filegroup (C_FILEINFOTYPE, C_BUSINFLAG, C_DESCRIPTION, C_SUB_RANG, C_DEFICIENCYINFO, C_STATUS)
values ('orgCodeFile', '01', '组织机构代码证附件', '保理业务', '组织机构代码证附件', '1')$$

insert into t_cfg_auth_filegroup (C_FILEINFOTYPE, C_BUSINFLAG, C_DESCRIPTION, C_SUB_RANG, C_DEFICIENCYINFO, C_STATUS)
values ('proveAssetsFile', '01', '资产证明文件', '保理业务', '资产证明文件', '1')$$

insert into t_cfg_auth_filegroup (C_FILEINFOTYPE, C_BUSINFLAG, C_DESCRIPTION, C_SUB_RANG, C_DEFICIENCYINFO, C_STATUS)
values ('representIdFile', '01', '法人身份证附件', '保理业务', '法人身份证附件', '1')$$

insert into t_cfg_auth_filegroup (C_FILEINFOTYPE, C_BUSINFLAG, C_DESCRIPTION, C_SUB_RANG, C_DEFICIENCYINFO, C_STATUS)
values ('serviceContractFile', '01', '服务协议', '基金业务', '服务协议', '1')$$

insert into t_cfg_auth_filegroup (C_FILEINFOTYPE, C_BUSINFLAG, C_DESCRIPTION, C_SUB_RANG, C_DEFICIENCYINFO, C_STATUS)
values ('taxRegistFile', '01', '税务登记证附件', '保理业务', '税务登记证附件', '1')$$

delete from t_cfg_auth_filegroup_agency where C_AGENCYNO='227'$$

insert into `t_cfg_auth_filegroup_agency`(`C_AGENCYNO`,`C_FILEINFOTYPE`,`C_BUSINFLAG`,`C_DESCRIPTION`,`D_REGDATE`,`D_MODIDATE`,`N_INVALID_TIME`,`C_STATUS`,`C_BUSINCLASS`,`C_RULE_LIST`,`c_demo_file_path`,`c_temp_file_path`,`c_file_class`)
values('227','authorizeFile','08','授权书','20160926','20160926','30','1','fund',null,null,null,null)$$
insert into `t_cfg_auth_filegroup_agency`(`C_AGENCYNO`,`C_FILEINFOTYPE`,`C_BUSINFLAG`,`C_DESCRIPTION`,`D_REGDATE`,`D_MODIDATE`,`N_INVALID_TIME`,`C_STATUS`,`C_BUSINCLASS`,`C_RULE_LIST`,`c_demo_file_path`,`c_temp_file_path`,`c_file_class`)
values('227','BrokerIdHeadFile','08','经办人身份证-头像面件','20160417','20160417','30','1','fund',null,null,null,null)$$
insert into `t_cfg_auth_filegroup_agency`(`C_AGENCYNO`,`C_FILEINFOTYPE`,`C_BUSINFLAG`,`C_DESCRIPTION`,`D_REGDATE`,`D_MODIDATE`,`N_INVALID_TIME`,`C_STATUS`,`C_BUSINCLASS`,`C_RULE_LIST`,`c_demo_file_path`,`c_temp_file_path`,`c_file_class`)
values('227','CustBankOpenLicenseFile','08','银行账户开户许可证','20160417','20160417','30','1','fund',null,null,null,null)$$
insert into `t_cfg_auth_filegroup_agency`(`C_AGENCYNO`,`C_FILEINFOTYPE`,`C_BUSINFLAG`,`C_DESCRIPTION`,`D_REGDATE`,`D_MODIDATE`,`N_INVALID_TIME`,`C_STATUS`,`C_BUSINCLASS`,`C_RULE_LIST`,`c_demo_file_path`,`c_temp_file_path`,`c_file_class`)
values('227','CustBizLicenseFile','08','营业执照附件','20160417','20160417','30','1','fund',null,null,null,null)$$
insert into `t_cfg_auth_filegroup_agency`(`C_AGENCYNO`,`C_FILEINFOTYPE`,`C_BUSINFLAG`,`C_DESCRIPTION`,`D_REGDATE`,`D_MODIDATE`,`N_INVALID_TIME`,`C_STATUS`,`C_BUSINCLASS`,`C_RULE_LIST`,`c_demo_file_path`,`c_temp_file_path`,`c_file_class`)
values('227','CustOrgCodeFile','08','组织机构代码证','20160417','20160417','30','1','fund',null,null,null,null)$$
insert into `t_cfg_auth_filegroup_agency`(`C_AGENCYNO`,`C_FILEINFOTYPE`,`C_BUSINFLAG`,`C_DESCRIPTION`,`D_REGDATE`,`D_MODIDATE`,`N_INVALID_TIME`,`C_STATUS`,`C_BUSINCLASS`,`C_RULE_LIST`,`c_demo_file_path`,`c_temp_file_path`,`c_file_class`)
values('227','CustTaxRegistFile','08','税务登记证','20160417','20160417','30','1','fund',null,null,null,null)$$
insert into `t_cfg_auth_filegroup_agency`(`C_AGENCYNO`,`C_FILEINFOTYPE`,`C_BUSINFLAG`,`C_DESCRIPTION`,`D_REGDATE`,`D_MODIDATE`,`N_INVALID_TIME`,`C_STATUS`,`C_BUSINCLASS`,`C_RULE_LIST`,`c_demo_file_path`,`c_temp_file_path`,`c_file_class`)
values('227','RepresentIdHeadFile','08','法人身份证-头像面','20160417','20160417','30','1','fund',null,null,null,null)$$
insert into `t_cfg_auth_filegroup_agency`(`C_AGENCYNO`,`C_FILEINFOTYPE`,`C_BUSINFLAG`,`C_DESCRIPTION`,`D_REGDATE`,`D_MODIDATE`,`N_INVALID_TIME`,`C_STATUS`,`C_BUSINCLASS`,`C_RULE_LIST`,`c_demo_file_path`,`c_temp_file_path`,`c_file_class`)
values('227','serviceContractFile','08','服务协议','20160926','20160926','30','1','fund',null,null,null,null)$$

