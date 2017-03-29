##-- DML语句
##
##-- V2.1.0
##
##-- 添加系统操作员的默认权限  提交日期2017/03/26



###-- 广西建工 接口 配置
REPLACE INTO `t_far_interface` (`C_FACE`, `C_NAME`, `C_SIGN`, `C_FORMAT`, `C_ENCRYPT`, `C_HEADSIGN`, `C_FIELDORDER`, `C_FTP`, `C_URL`, `C_CHARSET`, `C_KEYPATH`, `C_KEYPASS`, `C_OWNER`, `C_GROUP`, `C_PROVIDER`, `D_MODIDATE`, `C_MUSTITEM`, `C_ERR_MODE`) VALUES ('GXJG', '广西建工', '1', 'JSON', '9', '0', '0', '', '', 'UTF-8', 'keys/gxjg', 'priv:123456', 'zhoucy', 'SCF', NULL, '20160330', '0', 'yqr')$$


REPLACE INTO `t_far_function` (`C_FACE`, `C_FUN`, `C_CODE`, `C_NAME`, `C_DESCRIPTION`, `C_URL`, `C_FACEURL`, `C_INCLASS`, `C_OUTCLASS`, `D_MODIDATE`, `C_INPUT_MODE`, `C_OUTPUT_MODE`, `C_INVOKE_MODE`, `C_DATA_ENCODER`, `C_DATA_DECODER`, `C_RESULTCODE`) VALUES ('GXJG', 'accessFristLogin', 'accessFristLogin', '首次登陆', 'webservice接口', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', NULL, NULL, NULL)$$
REPLACE INTO `t_far_function` (`C_FACE`, `C_FUN`, `C_CODE`, `C_NAME`, `C_DESCRIPTION`, `C_URL`, `C_FACEURL`, `C_INCLASS`, `C_OUTCLASS`, `D_MODIDATE`, `C_INPUT_MODE`, `C_OUTPUT_MODE`, `C_INVOKE_MODE`, `C_DATA_ENCODER`, `C_DATA_DECODER`, `C_RESULTCODE`) VALUES ('GXJG', 'accessTicket', 'accessTicket', '获取ticket', 'webservice接口', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', NULL, NULL, NULL)$$
REPLACE INTO `t_far_function` (`C_FACE`, `C_FUN`, `C_CODE`, `C_NAME`, `C_DESCRIPTION`, `C_URL`, `C_FACEURL`, `C_INCLASS`, `C_OUTCLASS`, `D_MODIDATE`, `C_INPUT_MODE`, `C_OUTPUT_MODE`, `C_INVOKE_MODE`, `C_DATA_ENCODER`, `C_DATA_DECODER`, `C_RESULTCODE`) VALUES ('GXJG', 'batchProcessData', 'batchProcessData', '批量数据处理，一次性处理一种类型', 'webservice接口', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', NULL, NULL, NULL)$$
REPLACE INTO `t_far_function` (`C_FACE`, `C_FUN`, `C_CODE`, `C_NAME`, `C_DESCRIPTION`, `C_URL`, `C_FACEURL`, `C_INCLASS`, `C_OUTCLASS`, `D_MODIDATE`, `C_INPUT_MODE`, `C_OUTPUT_MODE`, `C_INVOKE_MODE`, `C_DATA_ENCODER`, `C_DATA_DECODER`, `C_RESULTCODE`) VALUES ('GXJG', 'findDataProcess', 'findDataProcess', '查找需要处理的数据', 'webservice接口', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', NULL, NULL, NULL)$$
REPLACE INTO `t_far_function` (`C_FACE`, `C_FUN`, `C_CODE`, `C_NAME`, `C_DESCRIPTION`, `C_URL`, `C_FACEURL`, `C_INCLASS`, `C_OUTCLASS`, `D_MODIDATE`, `C_INPUT_MODE`, `C_OUTPUT_MODE`, `C_INVOKE_MODE`, `C_DATA_ENCODER`, `C_DATA_DECODER`, `C_RESULTCODE`) VALUES ('GXJG', 'findUnCheckAccount', 'findUnCheckAccount', '查找未注册的客户资料信息', 'webservice接口', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', NULL, NULL, NULL)$$
REPLACE INTO `t_far_function` (`C_FACE`, `C_FUN`, `C_CODE`, `C_NAME`, `C_DESCRIPTION`, `C_URL`, `C_FACEURL`, `C_INCLASS`, `C_OUTCLASS`, `D_MODIDATE`, `C_INPUT_MODE`, `C_OUTPUT_MODE`, `C_INVOKE_MODE`, `C_DATA_ENCODER`, `C_DATA_DECODER`, `C_RESULTCODE`) VALUES ('GXJG', 'findWorkAccount', 'findWorkAccount', '查找处理数据需要的银行账户信息等', 'webservice接口', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', NULL, NULL, NULL)$$
REPLACE INTO `t_far_function` (`C_FACE`, `C_FUN`, `C_CODE`, `C_NAME`, `C_DESCRIPTION`, `C_URL`, `C_FACEURL`, `C_INCLASS`, `C_OUTCLASS`, `D_MODIDATE`, `C_INPUT_MODE`, `C_OUTPUT_MODE`, `C_INVOKE_MODE`, `C_DATA_ENCODER`, `C_DATA_DECODER`, `C_RESULTCODE`) VALUES ('GXJG', 'processCoreCorp', 'processCoreCorp', '批量接收核心组织机构信息', 'webservice接口', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', NULL, NULL, NULL)$$
REPLACE INTO `t_far_function` (`C_FACE`, `C_FUN`, `C_CODE`, `C_NAME`, `C_DESCRIPTION`, `C_URL`, `C_FACEURL`, `C_INCLASS`, `C_OUTCLASS`, `D_MODIDATE`, `C_INPUT_MODE`, `C_OUTPUT_MODE`, `C_INVOKE_MODE`, `C_DATA_ENCODER`, `C_DATA_DECODER`, `C_RESULTCODE`) VALUES ('GXJG', 'processData', 'processData', '单账户数据处理', 'webservice接口', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', NULL, NULL, NULL)$$
REPLACE INTO `t_far_function` (`C_FACE`, `C_FUN`, `C_CODE`, `C_NAME`, `C_DESCRIPTION`, `C_URL`, `C_FACEURL`, `C_INCLASS`, `C_OUTCLASS`, `D_MODIDATE`, `C_INPUT_MODE`, `C_OUTPUT_MODE`, `C_INVOKE_MODE`, `C_DATA_ENCODER`, `C_DATA_DECODER`, `C_RESULTCODE`) VALUES ('GXJG', 'processPushData', 'processPushData', '接收资金管理系统推送的数据', 'webservice接口', NULL, NULL, NULL, NULL, NULL, '0', '0', '0', NULL, NULL, NULL)$$



REPLACE INTO `t_far_config` (`C_FACE`, `C_NAME`, `C_VALUE`, `C_TYPE`, `C_SPLIT`, `C_SCOPE`, `C_DESCRIPTION`, `N_ORDER`, `ID`) VALUES ('GXJG', 'attachData', '广西建工集团有限责任公司', NULL, '0', '0', '附加数据，用于被客户端调用时，传递数据到服务端实现接口', 0, 22)$$
REPLACE INTO `t_far_config` (`C_FACE`, `C_NAME`, `C_VALUE`, `C_TYPE`, `C_SPLIT`, `C_SCOPE`, `C_DESCRIPTION`, `N_ORDER`, `ID`) VALUES ('GXJG', 'encrypt_use', 'false', NULL, '0', '0', '使用加密模式；默认使用', 0, 6)$$
REPLACE INTO `t_far_config` (`C_FACE`, `C_NAME`, `C_VALUE`, `C_TYPE`, `C_SPLIT`, `C_SCOPE`, `C_DESCRIPTION`, `N_ORDER`, `ID`) VALUES ('GXJG', 'partnerCode', 'gxjg', NULL, '0', '0', '合作商代码-webservice', 0, NULL)$$
REPLACE INTO `t_far_config` (`C_FACE`, `C_NAME`, `C_VALUE`, `C_TYPE`, `C_SPLIT`, `C_SCOPE`, `C_DESCRIPTION`, `N_ORDER`, `ID`) VALUES ('GXJG', 'partnerToken', 'gxjg123', NULL, '0', '0', '提供给合作商的token-webservice', 0, NULL)$$
REPLACE INTO `t_far_config` (`C_FACE`, `C_NAME`, `C_VALUE`, `C_TYPE`, `C_SPLIT`, `C_SCOPE`, `C_DESCRIPTION`, `N_ORDER`, `ID`) VALUES ('GXJG', 'process_Input', 'false', NULL, '0', '0', '是否需要映射转换处理，默认是需要', 0, 16)$$
REPLACE INTO `t_far_config` (`C_FACE`, `C_NAME`, `C_VALUE`, `C_TYPE`, `C_SPLIT`, `C_SCOPE`, `C_DESCRIPTION`, `N_ORDER`, `ID`) VALUES ('GXJG', 'sign_data', 'true', NULL, '0', '0', '使用签名模式', 0, 7)$$
REPLACE INTO `t_far_config` (`C_FACE`, `C_NAME`, `C_VALUE`, `C_TYPE`, `C_SPLIT`, `C_SCOPE`, `C_DESCRIPTION`, `N_ORDER`, `ID`) VALUES ('GXJG', 'token', 'bytter123456789', NULL, '0', '0', '避免外部攻击，约定的token，定期更换', 0, NULL)$$



INSERT INTO `t_scf_process_log` (`c_operorg`, `c_process_type`, `d_date`, `c_status`, `c_bankacco`, `d_startdate`, `d_enddate`, `id`) SELECT '广西建工集团有限责任公司', 'account', '20160602', '1', NULL, '20160601', NULL, 1 FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_scf_process_log` WHERE `c_operorg`='广西建工集团有限责任公司' AND `c_process_type` = 'account') $$

INSERT INTO `t_scf_process_log` (`c_operorg`, `c_process_type`, `d_date`, `c_status`, `c_bankacco`, `d_startdate`, `d_enddate`, `id`) SELECT '广西建工集团有限责任公司', 'accountBank', '20160602', '1', NULL, '20160601', NULL, 2 FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_scf_process_log` WHERE `c_operorg`='广西建工集团有限责任公司' AND `c_process_type` = 'accountBank')$$
INSERT INTO `t_scf_process_log` (`c_operorg`, `c_process_type`, `d_date`, `c_status`, `c_bankacco`, `d_startdate`, `d_enddate`, `id`) SELECT '广西建工集团有限责任公司', 'accountBankFlow', '20150101', '1', NULL, '20110101', '20160601', 3 FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_scf_process_log` WHERE `c_operorg`='广西建工集团有限责任公司' AND `c_process_type` = 'accountBankFlow')$$

INSERT INTO `t_scf_process_log` (`c_operorg`, `c_process_type`, `d_date`, `c_status`, `c_bankacco`, `d_startdate`, `d_enddate`, `id`) SELECT '广西建工集团有限责任公司', 'accountPayStream', '20150101', '1', NULL, '20110101', '20160601', 4 FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_scf_process_log` WHERE `c_operorg`='广西建工集团有限责任公司' AND `c_process_type` = 'accountPayStream')$$

INSERT INTO `t_scf_process_log` (`c_operorg`, `c_process_type`, `d_date`, `c_status`, `c_bankacco`, `d_startdate`, `d_enddate`, `id`) SELECT '广西建工集团有限责任公司', 'acceptBill', '20160602', '1', NULL, '20110601', NULL, 5 FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_scf_process_log` WHERE `c_operorg`='广西建工集团有限责任公司' AND `c_process_type` = 'acceptBill')$$

INSERT INTO `t_scf_process_log` (`c_operorg`, `c_process_type`, `d_date`, `c_status`, `c_bankacco`, `d_startdate`, `d_enddate`, `id`) SELECT '广西建工集团有限责任公司', 'coreAccountBalance', '20160602', '1', NULL, '20160601', NULL, 6 FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_scf_process_log` WHERE `c_operorg`='广西建工集团有限责任公司' AND `c_process_type` = 'coreAccountBalance')$$

INSERT INTO `t_scf_process_log` (`c_operorg`, `c_process_type`, `d_date`, `c_status`, `c_bankacco`, `d_startdate`, `d_enddate`, `id`) SELECT '广西建工集团有限责任公司', 'processCoreCorp', '20170326', '1', NULL, '20170325', NULL, 7 FROM dual WHERE NOT EXISTS (SELECT 1 FROM `t_scf_process_log` WHERE `c_operorg`='广西建工集团有限责任公司' AND `c_process_type` = 'processCoreCorp')$$




#### --  茂业接口配置








