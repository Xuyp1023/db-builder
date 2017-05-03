##-- DML语句
##
##-- V2.1.0
##
##-- 添加系统操作员的默认权限  提交日期2016/11/15


DELETE FROM `t_cfg_snogeneral` WHERE ID >=20620 AND ID <= 20629;

INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('DomainAttribute.id', '1', NULL, 'SYS', '0', NULL, '10', '20601')$$
