##-- 后置DML语句
##

##-- V2.3.1
##
##-- 2017/09/26
##-- 增加默认的电子合同模板的位置

drop PROCEDURE if EXISTS modify_t_cfg_snogeneral_lastno$$
create procedure modify_t_cfg_snogeneral_lastno() 
BEGIN
	declare MY_LASTNO  int;
	select L_LASTNO INTO MY_LASTNO from t_cfg_snogeneral a where a.C_OPERTYPE='ContractTemplate.id';
	IF MY_LASTNO < 1000 THEN
		update t_cfg_snogeneral set L_LASTNO =1000 where C_OPERTYPE='ContractTemplate.id';
	END IF;
END $$
call modify_t_cfg_snogeneral_lastno()$$
drop PROCEDURE if EXISTS modify_t_cfg_snogeneral_lastno$$

delete from `t_scf_contract_template` where id <1000;
INSERT INTO `t_scf_contract_template` (`ID`, `L_FACTORNO`, `C_TEMPLATE_NAME`, `C_TEMPLATE_TYPE`, `C_TEMPLATE_PATH`, `C_TEMPLATE_STATUS`, `N_BATCHNO`, `D_REG_DATE`, `T_REG_TIME`) VALUES (977, 102200336, 'model1_latest.ftl', 'receivableRequestProtocolModel1', '20171010/account/signTemplateFile/9911ab1d1ca0499e974ae12e736a8b66', '1', 1003404, '20171010', '153621')$$
INSERT INTO `t_scf_contract_template` (`ID`, `L_FACTORNO`, `C_TEMPLATE_NAME`, `C_TEMPLATE_TYPE`, `C_TEMPLATE_PATH`, `C_TEMPLATE_STATUS`, `N_BATCHNO`, `D_REG_DATE`, `T_REG_TIME`) VALUES (980, 102209682, 'model220170925.ftl', 'receivableRequestProtocolModel2', '20171010/account/signTemplateFile/03251e43783949dba4e2e3d739465d98', '1', 1003475, '20171010', '154347')$$
INSERT INTO `t_scf_contract_template` (`ID`, `L_FACTORNO`, `C_TEMPLATE_NAME`, `C_TEMPLATE_TYPE`, `C_TEMPLATE_PATH`, `C_TEMPLATE_STATUS`, `N_BATCHNO`, `D_REG_DATE`, `T_REG_TIME`) VALUES (981, 102202019, 'billTransNotice.ftl', 'billTransNotice', '20171010/account/signTemplateFile/2a25b513170d410fb4267cdb20b7381c', '1', 1003408, '20171010', '154414')$$
INSERT INTO `t_scf_contract_template` (`ID`, `L_FACTORNO`, `C_TEMPLATE_NAME`, `C_TEMPLATE_TYPE`, `C_TEMPLATE_PATH`, `C_TEMPLATE_STATUS`, `N_BATCHNO`, `D_REG_DATE`, `T_REG_TIME`) VALUES (982, 102202019, 'buyerConfirm.ftl', 'buyerConfirm', '20171010/account/signTemplateFile/df9329183c0f4bb7851db75a457a49dd', '1', 1003409, '20171010', '154426')$$
INSERT INTO `t_scf_contract_template` (`ID`, `L_FACTORNO`, `C_TEMPLATE_NAME`, `C_TEMPLATE_TYPE`, `C_TEMPLATE_PATH`, `C_TEMPLATE_STATUS`, `N_BATCHNO`, `D_REG_DATE`, `T_REG_TIME`) VALUES (983, 102202019, 'threePartProtocol.ftl', 'threePartProtocol', '20171010/account/signTemplateFile/0ef66bf7c3c3473abf57e7a420ceb494', '1', 1003410, '20171010', '154440')$$
INSERT INTO `t_scf_contract_template` (`ID`, `L_FACTORNO`, `C_TEMPLATE_NAME`, `C_TEMPLATE_TYPE`, `C_TEMPLATE_PATH`, `C_TEMPLATE_STATUS`, `N_BATCHNO`, `D_REG_DATE`, `T_REG_TIME`) VALUES (984, 102202019, 'model1_latest.ftl', 'receivableRequestProtocolModel1', '20171010/account/signTemplateFile/4dd5f48cfe3944068243a8ef3cf64e1c', '1', 1003411, '20171010', '154457')$$
INSERT INTO `t_scf_contract_template` (`ID`, `L_FACTORNO`, `C_TEMPLATE_NAME`, `C_TEMPLATE_TYPE`, `C_TEMPLATE_PATH`, `C_TEMPLATE_STATUS`, `N_BATCHNO`, `D_REG_DATE`, `T_REG_TIME`) VALUES (985, 102202019, 'model2_latest.ftl', 'receivableRequestProtocolModel2', '20171010/account/signTemplateFile/42104bd2affe42349ae7d40b97e4257e', '1', 1003412, '20171010', '154508')$$


delete from `t_sys_contract_template_stamp_place` where ID < 1000;
INSERT INTO `t_sys_contract_template_stamp_place` (`ID`, `L_TEMPLATE_ID`, `C_TEMPLATE_NAME`, `C_SIGNATORY`, `N_SEQUENCE`, `C_TYPE`, `C_PAGINATION`, `N_AXIS_X`, `N_AXIS_Y`, `C_KEY_WORD`, `C_BUSIN_STATUS`, `C_DOC_STATUS`, `L_REG_OPERID`, `C_REG_OPERNAME`, `D_REG_DATE`, `T_REG_TIME`, `L_MODI_OPERID`, `C_MODI_OPERNAME`, `D_MODI_DATE`, `T_MODI_TIME`) VALUES (2, 970, '应收账款转让申请书', '甲', 0, NULL, NULL, 0, 0, '买方（签章）', NULL, NULL, 1000695, '平台工作人员', '20170916', '092906', 1000695, '平台工作人员', '20170916', '092906')$$
INSERT INTO `t_sys_contract_template_stamp_place` (`ID`, `L_TEMPLATE_ID`, `C_TEMPLATE_NAME`, `C_SIGNATORY`, `N_SEQUENCE`, `C_TYPE`, `C_PAGINATION`, `N_AXIS_X`, `N_AXIS_Y`, `C_KEY_WORD`, `C_BUSIN_STATUS`, `C_DOC_STATUS`, `L_REG_OPERID`, `C_REG_OPERNAME`, `D_REG_DATE`, `T_REG_TIME`, `L_MODI_OPERID`, `C_MODI_OPERNAME`, `D_MODI_DATE`, `T_MODI_TIME`) VALUES (3, 970, '应收账款转让申请书', '乙', 1, NULL, NULL, 0, 0, '卖方（签章）', NULL, NULL, 1000695, '平台工作人员', '20170916', '092906', 1000695, '平台工作人员', '20170916', '092906')$$
INSERT INTO `t_sys_contract_template_stamp_place` (`ID`, `L_TEMPLATE_ID`, `C_TEMPLATE_NAME`, `C_SIGNATORY`, `N_SEQUENCE`, `C_TYPE`, `C_PAGINATION`, `N_AXIS_X`, `N_AXIS_Y`, `C_KEY_WORD`, `C_BUSIN_STATUS`, `C_DOC_STATUS`, `L_REG_OPERID`, `C_REG_OPERNAME`, `D_REG_DATE`, `T_REG_TIME`, `L_MODI_OPERID`, `C_MODI_OPERNAME`, `D_MODI_DATE`, `T_MODI_TIME`) VALUES (111, 981, '转让通知书', NULL, 1, NULL, '1', 80, 0, '卖方(公章)', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_sys_contract_template_stamp_place` (`ID`, `L_TEMPLATE_ID`, `C_TEMPLATE_NAME`, `C_SIGNATORY`, `N_SEQUENCE`, `C_TYPE`, `C_PAGINATION`, `N_AXIS_X`, `N_AXIS_Y`, `C_KEY_WORD`, `C_BUSIN_STATUS`, `C_DOC_STATUS`, `L_REG_OPERID`, `C_REG_OPERNAME`, `D_REG_DATE`, `T_REG_TIME`, `L_MODI_OPERID`, `C_MODI_OPERNAME`, `D_MODI_DATE`, `T_MODI_TIME`) VALUES (112, 981, '转让通知书', NULL, 2, NULL, '1', 80, 0, '保理公司(公章)', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_sys_contract_template_stamp_place` (`ID`, `L_TEMPLATE_ID`, `C_TEMPLATE_NAME`, `C_SIGNATORY`, `N_SEQUENCE`, `C_TYPE`, `C_PAGINATION`, `N_AXIS_X`, `N_AXIS_Y`, `C_KEY_WORD`, `C_BUSIN_STATUS`, `C_DOC_STATUS`, `L_REG_OPERID`, `C_REG_OPERNAME`, `D_REG_DATE`, `T_REG_TIME`, `L_MODI_OPERID`, `C_MODI_OPERNAME`, `D_MODI_DATE`, `T_MODI_TIME`) VALUES (113, 985, '结算中心提前付款', NULL, 2, NULL, '1', 80, 0, '甲方（全称）：', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_sys_contract_template_stamp_place` (`ID`, `L_TEMPLATE_ID`, `C_TEMPLATE_NAME`, `C_SIGNATORY`, `N_SEQUENCE`, `C_TYPE`, `C_PAGINATION`, `N_AXIS_X`, `N_AXIS_Y`, `C_KEY_WORD`, `C_BUSIN_STATUS`, `C_DOC_STATUS`, `L_REG_OPERID`, `C_REG_OPERNAME`, `D_REG_DATE`, `T_REG_TIME`, `L_MODI_OPERID`, `C_MODI_OPERNAME`, `D_MODI_DATE`, `T_MODI_TIME`) VALUES (114, 985, '结算中心提前付款', NULL, 1, NULL, '1', 80, 0, '乙方（全称）：', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_sys_contract_template_stamp_place` (`ID`, `L_TEMPLATE_ID`, `C_TEMPLATE_NAME`, `C_SIGNATORY`, `N_SEQUENCE`, `C_TYPE`, `C_PAGINATION`, `N_AXIS_X`, `N_AXIS_Y`, `C_KEY_WORD`, `C_BUSIN_STATUS`, `C_DOC_STATUS`, `L_REG_OPERID`, `C_REG_OPERNAME`, `D_REG_DATE`, `T_REG_TIME`, `L_MODI_OPERID`, `C_MODI_OPERNAME`, `D_MODI_DATE`, `T_MODI_TIME`) VALUES (115, 984, '采购方提前付款', NULL, 1, NULL, '1', 80, 0, '乙方（全称）：', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_sys_contract_template_stamp_place` (`ID`, `L_TEMPLATE_ID`, `C_TEMPLATE_NAME`, `C_SIGNATORY`, `N_SEQUENCE`, `C_TYPE`, `C_PAGINATION`, `N_AXIS_X`, `N_AXIS_Y`, `C_KEY_WORD`, `C_BUSIN_STATUS`, `C_DOC_STATUS`, `L_REG_OPERID`, `C_REG_OPERNAME`, `D_REG_DATE`, `T_REG_TIME`, `L_MODI_OPERID`, `C_MODI_OPERNAME`, `D_MODI_DATE`, `T_MODI_TIME`) VALUES (116, 984, '采购方提前付款', NULL, 2, NULL, '1', 80, 0, '甲方（全称）：', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_sys_contract_template_stamp_place` (`ID`, `L_TEMPLATE_ID`, `C_TEMPLATE_NAME`, `C_SIGNATORY`, `N_SEQUENCE`, `C_TYPE`, `C_PAGINATION`, `N_AXIS_X`, `N_AXIS_Y`, `C_KEY_WORD`, `C_BUSIN_STATUS`, `C_DOC_STATUS`, `L_REG_OPERID`, `C_REG_OPERNAME`, `D_REG_DATE`, `T_REG_TIME`, `L_MODI_OPERID`, `C_MODI_OPERNAME`, `D_MODI_DATE`, `T_MODI_TIME`) VALUES (117, 982, '确认书', NULL, 1, NULL, '1', 80, 0, '买方（公章）', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_sys_contract_template_stamp_place` (`ID`, `L_TEMPLATE_ID`, `C_TEMPLATE_NAME`, `C_SIGNATORY`, `N_SEQUENCE`, `C_TYPE`, `C_PAGINATION`, `N_AXIS_X`, `N_AXIS_Y`, `C_KEY_WORD`, `C_BUSIN_STATUS`, `C_DOC_STATUS`, `L_REG_OPERID`, `C_REG_OPERNAME`, `D_REG_DATE`, `T_REG_TIME`, `L_MODI_OPERID`, `C_MODI_OPERNAME`, `D_MODI_DATE`, `T_MODI_TIME`) VALUES (118, 977, '采购方提前付款', NULL, 1, NULL, '1', 80, 0, '乙方（全称）：', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_sys_contract_template_stamp_place` (`ID`, `L_TEMPLATE_ID`, `C_TEMPLATE_NAME`, `C_SIGNATORY`, `N_SEQUENCE`, `C_TYPE`, `C_PAGINATION`, `N_AXIS_X`, `N_AXIS_Y`, `C_KEY_WORD`, `C_BUSIN_STATUS`, `C_DOC_STATUS`, `L_REG_OPERID`, `C_REG_OPERNAME`, `D_REG_DATE`, `T_REG_TIME`, `L_MODI_OPERID`, `C_MODI_OPERNAME`, `D_MODI_DATE`, `T_MODI_TIME`) VALUES (119, 977, '采购方提前付款', NULL, 2, NULL, '1', 80, 0, '甲方（全称）：', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_sys_contract_template_stamp_place` (`ID`, `L_TEMPLATE_ID`, `C_TEMPLATE_NAME`, `C_SIGNATORY`, `N_SEQUENCE`, `C_TYPE`, `C_PAGINATION`, `N_AXIS_X`, `N_AXIS_Y`, `C_KEY_WORD`, `C_BUSIN_STATUS`, `C_DOC_STATUS`, `L_REG_OPERID`, `C_REG_OPERNAME`, `D_REG_DATE`, `T_REG_TIME`, `L_MODI_OPERID`, `C_MODI_OPERNAME`, `D_MODI_DATE`, `T_MODI_TIME`) VALUES (120, 980, '结算中心提前付款', NULL, 2, NULL, '1', 80, 0, '甲方（全称）：', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_sys_contract_template_stamp_place` (`ID`, `L_TEMPLATE_ID`, `C_TEMPLATE_NAME`, `C_SIGNATORY`, `N_SEQUENCE`, `C_TYPE`, `C_PAGINATION`, `N_AXIS_X`, `N_AXIS_Y`, `C_KEY_WORD`, `C_BUSIN_STATUS`, `C_DOC_STATUS`, `L_REG_OPERID`, `C_REG_OPERNAME`, `D_REG_DATE`, `T_REG_TIME`, `L_MODI_OPERID`, `C_MODI_OPERNAME`, `D_MODI_DATE`, `T_MODI_TIME`) VALUES (121, 980, '结算中心提前付款', NULL, 1, NULL, '1', 80, 0, '乙方（全称）：', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)$$
INSERT INTO `t_sys_contract_template_stamp_place` (`ID`, `L_TEMPLATE_ID`, `C_TEMPLATE_NAME`, `C_SIGNATORY`, `N_SEQUENCE`, `C_TYPE`, `C_PAGINATION`, `N_AXIS_X`, `N_AXIS_Y`, `C_KEY_WORD`, `C_BUSIN_STATUS`, `C_DOC_STATUS`, `L_REG_OPERID`, `C_REG_OPERNAME`, `D_REG_DATE`, `T_REG_TIME`, `L_MODI_OPERID`, `C_MODI_OPERNAME`, `D_MODI_DATE`, `T_MODI_TIME`) VALUES (494, 986, '保理业务合同', '甲', 0, NULL, NULL, 4, 5, '甲方', NULL, NULL, 1000859, '李长江', '20171012', '171913', 1000859, '李长江', '20171012', '171913')$$
INSERT INTO `t_sys_contract_template_stamp_place` (`ID`, `L_TEMPLATE_ID`, `C_TEMPLATE_NAME`, `C_SIGNATORY`, `N_SEQUENCE`, `C_TYPE`, `C_PAGINATION`, `N_AXIS_X`, `N_AXIS_Y`, `C_KEY_WORD`, `C_BUSIN_STATUS`, `C_DOC_STATUS`, `L_REG_OPERID`, `C_REG_OPERNAME`, `D_REG_DATE`, `T_REG_TIME`, `L_MODI_OPERID`, `C_MODI_OPERNAME`, `D_MODI_DATE`, `T_MODI_TIME`) VALUES (495, 986, '保理业务合同', '乙', 1, NULL, NULL, 5, 4, '乙方', NULL, NULL, 1000859, '李长江', '20171012', '171913', 1000859, '李长江', '20171012', '171913')$$
INSERT INTO `t_sys_contract_template_stamp_place` (`ID`, `L_TEMPLATE_ID`, `C_TEMPLATE_NAME`, `C_SIGNATORY`, `N_SEQUENCE`, `C_TYPE`, `C_PAGINATION`, `N_AXIS_X`, `N_AXIS_Y`, `C_KEY_WORD`, `C_BUSIN_STATUS`, `C_DOC_STATUS`, `L_REG_OPERID`, `C_REG_OPERNAME`, `D_REG_DATE`, `T_REG_TIME`, `L_MODI_OPERID`, `C_MODI_OPERNAME`, `D_MODI_DATE`, `T_MODI_TIME`) VALUES (496, 986, '保理业务合同', '丙', 2, NULL, NULL, 0, 0, '丙方', NULL, NULL, 1000859, '李长江', '20171012', '171913', 1000859, '李长江', '20171012', '171913')$$
INSERT INTO `t_sys_contract_template_stamp_place` (`ID`, `L_TEMPLATE_ID`, `C_TEMPLATE_NAME`, `C_SIGNATORY`, `N_SEQUENCE`, `C_TYPE`, `C_PAGINATION`, `N_AXIS_X`, `N_AXIS_Y`, `C_KEY_WORD`, `C_BUSIN_STATUS`, `C_DOC_STATUS`, `L_REG_OPERID`, `C_REG_OPERNAME`, `D_REG_DATE`, `T_REG_TIME`, `L_MODI_OPERID`, `C_MODI_OPERNAME`, `D_MODI_DATE`, `T_MODI_TIME`) VALUES (497, 992, '采购方提前付款协议', '甲', 0, NULL, NULL, 5, 5, '甲方签字', NULL, NULL, 1000859, '李长江', '20171013', '161117', 1000859, '李长江', '20171013', '165941')$$
INSERT INTO `t_sys_contract_template_stamp_place` (`ID`, `L_TEMPLATE_ID`, `C_TEMPLATE_NAME`, `C_SIGNATORY`, `N_SEQUENCE`, `C_TYPE`, `C_PAGINATION`, `N_AXIS_X`, `N_AXIS_Y`, `C_KEY_WORD`, `C_BUSIN_STATUS`, `C_DOC_STATUS`, `L_REG_OPERID`, `C_REG_OPERNAME`, `D_REG_DATE`, `T_REG_TIME`, `L_MODI_OPERID`, `C_MODI_OPERNAME`, `D_MODI_DATE`, `T_MODI_TIME`) VALUES (498, 992, '采购方提前付款协议', '乙', 1, NULL, NULL, 4, 2, '乙方签字', NULL, NULL, 1000859, '李长江', '20171013', '161117', 1000859, '李长江', '20171013', '165941')$$


##-- V2.3.1
##
##-- 2017/10/16
##-- 文件审批表中，增加批次号信息字段，并且将审批字段的ID赋值给批次号
update t_cust_fileaduit a set a.N_BATCHNO = a.id $$

##增加联系人影像资料的文档类型
delete from  `t_cfg_auth_filegroup` where c_fileinfotype in ('CustContacterIdHoldFile', 'CustContacterIdNationFile', 'CustContacterIdHeadFile');
INSERT INTO `t_cfg_auth_filegroup` (`c_fileinfotype`, `c_description`, `c_sub_rang`, `c_deficiencyinfo`) VALUES ('CustContacterIdHoldFile', '联系人身份证-手持证件', '保理业务', '联系人身份证-手持证件');
INSERT INTO `t_cfg_auth_filegroup` (`c_fileinfotype`, `c_description`, `c_sub_rang`, `c_deficiencyinfo`) VALUES ('CustContacterIdNationFile', '联系人身份证-国徽面', '保理业务', '联系人身份证-国徽面');
INSERT INTO `t_cfg_auth_filegroup` (`c_fileinfotype`, `c_description`, `c_sub_rang`, `c_deficiencyinfo`) VALUES ('CustContacterIdHeadFile', '联系人身份证-头像面', '保理业务', '联系人身份证-头像面');


##-- V2.3.1
##
##-- 2017/10/20
##-- 操作员增加影像文件的附件信息

delete from `t_rule_busin` where id = 51004;
INSERT INTO `t_rule_busin` (`C_NAME`, `C_EXECUTE_CONTENT`, `C_DESCRIPTION`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `ID`, `C_FUNC`, `C_ENTITY`) VALUES ('updateOperatorWithImageFile', NULL, '编辑操作员带上附件信息', '1', '20161017', '20161017', 51004, 'IOperatorService.webUpdateOperatorWithImageFile', 'com.betterjr.modules.account.entity.CustOperatorInfoRequest');

delete from `t_rule_busin_validator` where `C_BUSIN_NAME`='updateOperatorWithImageFile';

INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (51037, 'updateOperatorWithImageFile', 'password', 1, '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (51038, 'updateOperatorWithImageFile', 'address', 2, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (51039, 'updateOperatorWithImageFile', 'ruleList', 3, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (51040, 'updateOperatorWithImageFile', 'phone', 4, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (51041, 'updateOperatorWithImageFile', 'id', 5, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (51060, 'updateOperatorWithImageFile', 'operCode', 6, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (51062, 'updateOperatorWithImageFile', 'name', 7, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (51063, 'updateOperatorWithImageFile', 'mobileNo', 7, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (51065, 'updateOperatorWithImageFile', 'zipCode', 7, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (51066, 'updateOperatorWithImageFile', 'faxNo', 7, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (51067, 'updateOperatorWithImageFile', 'email', 7, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (51093, 'updateOperatorWithImageFile', 'status', 7, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (51104, 'updateOperatorWithImageFile', 'clerkMan', 7, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (51105, 'updateOperatorWithImageFile', 'contIdentType', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES (51106, 'updateOperatorWithImageFile', 'contIdentNo', 2, '1', NULL, NULL, NULL, NULL, NULL);

##-------------------------------------------------------------------------------------------------
##--END 请勿 COMMIT
##-------------------------------------------------------------------------------------------------
