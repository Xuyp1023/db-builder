##--合同编号生成 提交日期2017/01/06
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) SELECT 'LIMIT_102202019_QEQHTZQR', 0, NULL, 'SCF', '3', NULL, 5, 50010 FROM 
dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '50010')$$
INSERT INTO `t_cfg_snogeneral` (`C_OPERTYPE`, `L_LASTNO`, `D_LASTDATE`, `C_SYSNO`, `C_TYPE`, `C_MSG`, `L_DATA_LEN`, `ID`) SELECT 'LIMIT_102202019_QEQHTZTZ', 0, NULL, 'SCF', '3', NULL, 5, 50011 FROM 
dual WHERE NOT EXISTS (SELECT 1 FROM `t_cfg_snogeneral` WHERE id = '50011')$$
