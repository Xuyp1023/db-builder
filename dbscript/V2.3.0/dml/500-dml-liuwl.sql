##-- DML语句
##
##-- V2.1.0
##
##-- 添加系统操作员的默认权限  提交日期2016/11/15

DELETE FROM `t_cfg_snogeneral` WHERE ID >=20600 AND ID <= 20619;


INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractTemplate.id', '1', NULL, 'SYS', '0', NULL, '10', '20601');
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractTemplateStampPlace.id', '1', NULL, 'SYS', '0', NULL, '10', '20602');
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractTemplateLog.id', '1', NULL, 'SYS', '0', NULL, '10', '20603');
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractStamper.id', '1', NULL, 'SYS', '0', NULL, '10', '20604');
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractCorpAccount.id', '1', NULL, 'SYS', '0', NULL, '10', '20605');
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractSignerAccount.id', '1', NULL, 'SYS', '0', NULL, '10', '20606');
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('ContractCorpSigner.id', '1', NULL, 'SYS', '0', NULL, '10', '20606');



DELETE FROM `t_cfg_snogeneral` WHERE ID >=20620 AND ID <= 20629;

INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('DomainAttribute.id', '1', NULL, 'SYS', '0', NULL, '10', '20621')$$
