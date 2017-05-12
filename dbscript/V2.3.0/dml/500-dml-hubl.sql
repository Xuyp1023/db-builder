##-- DML语句
##
##-- V2.1.0
##
##-- 添加系统操作员的默认权限  提交日期20170512
delete from t_cfg_snogeneral where id in (50014,50015,50017)$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('CommissionDailyStatement.id', 0, NULL, 'SCF', '0', NULL, 10, 50014)$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('CommissionMonthlyStatementRecord.id', 0, NULL, 'SCF', '0', NULL, 10, 50015)$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) VALUES ('CommissionMonthlyStatement.id', 0, NULL, 'SCF', '0', NULL, 10, 50017)$$
