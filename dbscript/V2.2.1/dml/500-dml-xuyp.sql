##-- DML语句
##
##-- V2.1.0
##
##-- 添加系统操作员的默认权限  提交日期2016/11/15



### bug-442


INSERT ignore `t_rule_busin_validator` (`ID`, `C_BUSIN_NAME`, `C_VALID_NAME`, `N_PRIORITY`, `C_STATUS`, `D_REGDATE`, `D_MODIDATE`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`) VALUES ('70069', 'modifyCredit', 'cre-factorNo', '1', '1', NULL, NULL, NULL, NULL, NULL)$$

INSERT ignore `t_rule_validator` (`C_SYS`, `C_VALID_NAME`, `C_SHOW_NAME`, `C_NAME`, `C_MUSTITEM`, `C_DATA_TYPE`, `N_DATA_LEN`, `N_DATA_SCALE`, `F_MAX`, `F_MIN`, `C_VALIDATOR`, `C_PATTERN`, `D_REGDATE`, `D_MODIDATE`, `C_DESCRIPTION`, `C_BUSIN_FIELD`, `C_DEPENDS`, `C_MESSAGE`, `C_REF_VALUE`) VALUES ('SCF', 'cre-factorNo', '保理公司编号', 'factorNo', '0', 'LONG', '0', '0', NULL, NULL, 'LONG', NULL, '20160718', NULL, '保理公司编号', NULL, NULL, NULL, NULL)$$

### bug-459
update t_rule_validator set c_name='GTEregDate' where c_valid_name='pro-GTEregDate'$$


