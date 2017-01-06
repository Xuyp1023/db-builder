##-- 表结构非空修改		提交日期2016/11/18s
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_receivable' AND COLUMN_NAME='C_GOODSNAME')
	THEN   
	   ALTER TABLE `t_scf_receivable` CHANGE COLUMN `C_GOODSNAME` `C_GOODSNAME` VARCHAR(40) NULL COMMENT '商品名称' AFTER `C_DEBTOR`;
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$

##开户优化相应表增加字段   提交日期2016/11/25
##1 税务登记证号
	drop PROCEDURE if EXISTS add_table_col$$
	create procedure add_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_open_account_tmp' AND COLUMN_NAME='C_TAX_NO')
	THEN   
	   ALTER TABLE `t_cust_open_account_tmp`ADD COLUMN `C_TAX_NO` VARCHAR(120) NULL DEFAULT NULL COMMENT '税务登记证号' AFTER `C_CORELIST`;
	END IF;
	END$$
	call add_table_col()$$
	drop PROCEDURE if EXISTS add_table_col$$
##2 开户许可证核准号
	drop PROCEDURE if EXISTS add_table_col$$
	create procedure add_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_open_account_tmp' AND COLUMN_NAME='C_OPEN_LICENSE')
	THEN   
	   ALTER TABLE `t_cust_open_account_tmp`ADD COLUMN `C_OPEN_LICENSE` VARCHAR(120) NULL DEFAULT NULL COMMENT '开户许可证核准号' AFTER `C_TAX_NO`;
	END IF;
	END$$
	call add_table_col()$$
	drop PROCEDURE if EXISTS add_table_col$$
##3 开户许可证核准号
	drop PROCEDURE if EXISTS add_table_col$$
	create procedure add_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_mech_bankacco' AND COLUMN_NAME='C_OPEN_LICENSE')
	THEN   
	   ALTER TABLE `t_cust_mech_bankacco`ADD COLUMN `C_OPEN_LICENSE` VARCHAR(120) NULL DEFAULT NULL COMMENT '开户许可证核准号' AFTER `N_BATCHNO`;
	END IF;
	END$$
	call add_table_col()$$
	drop PROCEDURE if EXISTS add_table_col$$
##4 微信用户标识
	drop PROCEDURE if EXISTS add_table_col$$
	create procedure add_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_open_account_tmp' AND COLUMN_NAME='C_WECHAT_OPENID')
	THEN   
	   ALTER TABLE `t_cust_open_account_tmp`ADD COLUMN `C_WECHAT_OPENID` VARCHAR(120) NULL DEFAULT NULL COMMENT '微信用户标识' AFTER `C_OPEN_LICENSE`;
	END IF;
	END$$
	call add_table_col()$$
	drop PROCEDURE if EXISTS add_table_col$$
##5 交易密码(仅微信有)
	drop PROCEDURE if EXISTS add_table_col$$
	create procedure add_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_open_account_tmp' AND COLUMN_NAME='C_DEAL_PASSWORD')
	THEN   
	   ALTER TABLE `t_cust_open_account_tmp`ADD COLUMN `C_DEAL_PASSWORD` VARCHAR(120) NULL DEFAULT NULL COMMENT '交易密码(仅微信有)' AFTER `C_WECHAT_OPENID`;
	END IF;
	END$$
	call add_table_col()$$
	drop PROCEDURE if EXISTS add_table_col$$
##6 角色：供应商、经销商
	drop PROCEDURE if EXISTS add_table_col$$
	create procedure add_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_open_account_tmp' AND COLUMN_NAME='C_ROLE')
	THEN   
	   ALTER TABLE `t_cust_open_account_tmp`ADD COLUMN `C_ROLE` VARCHAR(120) NULL DEFAULT NULL COMMENT '角色：供应商、经销商' AFTER `C_DEAL_PASSWORD`;
	END IF;
	END$$
	call add_table_col()$$
	drop PROCEDURE if EXISTS add_table_col$$
	
##文件类型字段长度   提交日期2016/11/29
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit' AND COLUMN_NAME='C_STATUS')
	THEN   
	   ALTER TABLE `t_cust_fileaduit` CHANGE COLUMN `C_TYPE` `C_TYPE` VARCHAR(60) NULL DEFAULT NULL AFTER `C_STATUS`;
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$
	
##开户增加自主开户状态   	提交日期2016/12/2
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_open_account_tmp' AND COLUMN_NAME='C_BUSIN_STATUS')
	THEN   
	   ALTER TABLE `t_cust_open_account_tmp` CHANGE COLUMN `C_BUSIN_STATUS` `C_BUSIN_STATUS` CHAR(1) NULL DEFAULT NULL COMMENT '0未使用  1使用中  2已使用 3驳回4自主开户' AFTER `T_MODI_TIME`;
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$
	
##开户优化点增加字段			提交日期2016/12/6
## 经办人其他证件类型
	drop PROCEDURE if EXISTS add_table_col$$
	create procedure add_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_open_account_tmp' AND COLUMN_NAME='C_OPER_OTHER_IDENTTYPE')
	THEN   
	   ALTER TABLE `t_cust_open_account_tmp`ADD COLUMN `C_OPER_OTHER_IDENTTYPE` VARCHAR(20) NULL DEFAULT NULL COMMENT '经办人其他证件类型' AFTER `C_OPER_IDENTTYPE`;
	END IF;
	END$$
	call add_table_col()$$
	drop PROCEDURE if EXISTS add_table_col$$
## 法人其他证件类型
	drop PROCEDURE if EXISTS add_table_col$$
	create procedure add_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_open_account_tmp' AND COLUMN_NAME='C_LAW_OTHER_IDENTTYPE')
	THEN   
	   ALTER TABLE `t_cust_open_account_tmp`ADD COLUMN `C_LAW_OTHER_IDENTTYPE` VARCHAR(20) NULL DEFAULT NULL COMMENT '法人其他证件类型' AFTER `C_LAW_IDENTTYPE`;
	END IF;
	END$$
	call add_table_col()$$
	drop PROCEDURE if EXISTS add_table_col$$
## 数据来源:0:PC自主开户,1:PC平台代录,2:微信平台代录
	drop PROCEDURE if EXISTS add_table_col$$
	create procedure add_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_open_account_tmp' AND COLUMN_NAME='C_DATA_SOURCE')
	THEN   
	   ALTER TABLE `t_cust_open_account_tmp`ADD COLUMN `C_DATA_SOURCE` CHAR(1)  NULL DEFAULT NULL COMMENT '数据来源:0:PC自主开户,1:PC平台代录,2:微信平台代录' AFTER `C_ROLE`;
	END IF;
	END$$
	call add_table_col()$$
	drop PROCEDURE if EXISTS add_table_col$$
## 激活日期
	drop PROCEDURE if EXISTS add_table_col$$
	create procedure add_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_open_account_tmp' AND COLUMN_NAME='D_ACTIVE_DATE')
	THEN   
	   ALTER TABLE `t_cust_open_account_tmp`ADD COLUMN `D_ACTIVE_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '激活日期' AFTER `C_DATA_SOURCE`;
	END IF;
	END$$
	call add_table_col()$$
	drop PROCEDURE if EXISTS add_table_col$$
## 激活时间
	drop PROCEDURE if EXISTS add_table_col$$
	create procedure add_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_open_account_tmp' AND COLUMN_NAME='T_ACTIVE_TIME')
	THEN   
	   ALTER TABLE `t_cust_open_account_tmp`ADD COLUMN `T_ACTIVE_TIME` VARCHAR(8) NULL DEFAULT NULL COMMENT '激活时间' AFTER `D_ACTIVE_DATE`;
	END IF;
	END$$
	call add_table_col()$$
	drop PROCEDURE if EXISTS add_table_col$$
##交易密码加密SALT(仅微信有)
	drop PROCEDURE if EXISTS add_table_col$$
	create procedure add_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_open_account_tmp' AND COLUMN_NAME='C_DEAL_PASSWORD_SALT')
	THEN   
	   ALTER TABLE `t_cust_open_account_tmp`ADD COLUMN `C_DEAL_PASSWORD_SALT` VARCHAR(120) NULL DEFAULT NULL COMMENT '交易密码加密SALT(仅微信有)' AFTER `D_ACTIVE_DATE`;
	END IF;
	END$$
	call add_table_col()$$
	drop PROCEDURE if EXISTS add_table_col$$
##登录用户名
	drop PROCEDURE if EXISTS add_table_col$$
	create procedure add_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_open_account_tmp' AND COLUMN_NAME='C_LOGIN_USERNAME')
	THEN   
	   ALTER TABLE `t_cust_open_account_tmp`ADD COLUMN `C_LOGIN_USERNAME` VARCHAR(120) NULL DEFAULT NULL COMMENT '登录用户名' AFTER `D_ACTIVE_DATE`;
	END IF;
	END$$
	call add_table_col()$$
	drop PROCEDURE if EXISTS add_table_col$$
##登录密码(仅微信有)
	drop PROCEDURE if EXISTS add_table_col$$
	create procedure add_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_open_account_tmp' AND COLUMN_NAME='C_LOGIN_PASSWORD')
	THEN   
	   ALTER TABLE `t_cust_open_account_tmp`ADD COLUMN `C_LOGIN_PASSWORD` VARCHAR(120) NULL DEFAULT NULL COMMENT '登录密码(仅微信有)' AFTER `D_ACTIVE_DATE`;
	END IF;
	END$$
	call add_table_col()$$
	drop PROCEDURE if EXISTS add_table_col$$
##登录密码加密SALT(仅微信有)
	drop PROCEDURE if EXISTS add_table_col$$
	create procedure add_table_col() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_open_account_tmp' AND COLUMN_NAME='C_LOGIN_PASSWORD_SALT')
	THEN   
	   ALTER TABLE `t_cust_open_account_tmp`ADD COLUMN `C_LOGIN_PASSWORD_SALT` VARCHAR(120) NULL DEFAULT NULL COMMENT '登录密码加密SALT(仅微信有)' AFTER `D_ACTIVE_DATE`;
	END IF;
	END$$
	call add_table_col()$$
	drop PROCEDURE if EXISTS add_table_col$$
	
## 创建合同类型表
drop PROCEDURE if EXISTS add_table$$
create procedure add_table() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_agreement_type')
	THEN   
	   CREATE TABLE `t_scf_agreement_type` (
			`ID` BIGINT(18) NOT NULL COMMENT '编号',
			`C_AGREEMENT_TYPE_NO` VARCHAR(20) NOT NULL COMMENT '合同类型编号',
			`C_AGREEMENT_TYPE_NAME` VARCHAR(50) NOT NULL COMMENT '合同类型名称',
			`C_DESCRIPTION` VARCHAR(200) NULL DEFAULT NULL COMMENT '备注',
			`C_BUSIN_STATUS` VARCHAR(2) NULL DEFAULT NULL COMMENT '状态  0登记 1生效',
			`C_DATA_SOURCE` CHAR(1) NULL DEFAULT NULL COMMENT '数据来源:0:默认,1:手动录入',
			`C_OPERORG` VARCHAR(200) NULL DEFAULT NULL COMMENT '操作机构',
			`L_REG_OPERID` BIGINT(18) NULL DEFAULT '0' COMMENT '创建人(操作员)ID号',
			`C_REG_OPERNAME` VARCHAR(40) NULL DEFAULT NULL COMMENT '创建人(操作员)姓名',
			`D_REG_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '创建日期',
			`T_REG_TIME` VARCHAR(8) NULL DEFAULT NULL COMMENT '创建时间',
			`L_MODI_OPERID` BIGINT(18) NULL DEFAULT '0' COMMENT '修改人(操作员)ID号',
			`C_MODI_OPERNAME` VARCHAR(40) NULL DEFAULT NULL COMMENT '修改人(操作员)姓名',
			`D_MODI_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '修改日期',
			`T_MODI_TIME` VARCHAR(8) NULL DEFAULT NULL COMMENT '修改时间',
			`L_AUDIT_OPERID` BIGINT(18) NULL DEFAULT '0' COMMENT '审核人(操作员)ID号',
			`C_AUDIT_OPERNAME` VARCHAR(40) NULL DEFAULT NULL COMMENT '审核人(操作员)姓名',
			`D_AUDIT_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '审核日期',
			`T_AUDIT_TIME` VARCHAR(8) NULL DEFAULT NULL COMMENT '审核时间',
			PRIMARY KEY (`ID`),
			INDEX `AGREEMENT_TYPE_NO` (`C_AGREEMENT_TYPE_NO`)
		);
	END IF;
	END$$
	call add_table()$$
	drop PROCEDURE if EXISTS add_table$$
	
	
## 创建标准合同
drop PROCEDURE if EXISTS add_table$$
create procedure add_table() BEGIN   
	IF NOT EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_scf_agreement_standard')
	THEN   
	   CREATE TABLE `t_scf_agreement_standard` (
			`ID` BIGINT(18) NOT NULL COMMENT '编号',
			`C_AGREEMENT_STANDARD_NO` VARCHAR(20) NOT NULL COMMENT '标准合同编号',
			`C_AGREEMENT_TYPE_ID` VARCHAR(20) NOT NULL COMMENT '合同类型id',
			`C_AGREEMENT_STANDARD_NAME` VARCHAR(50) NOT NULL COMMENT '标准合同名称',
			`C_DESCRIPTION` VARCHAR(200) NULL DEFAULT NULL COMMENT '备注',
			`C_OPERORG` VARCHAR(200) NULL DEFAULT NULL COMMENT '操作机构',
			`C_BUSIN_STATUS` VARCHAR(2) NULL DEFAULT NULL COMMENT '状态  0登记 1生效 2停用',
			`L_REG_OPERID` BIGINT(18) NULL DEFAULT '0' COMMENT '创建人(操作员)ID号',
			`C_REG_OPERNAME` VARCHAR(40) NULL DEFAULT NULL COMMENT '创建人(操作员)姓名',
			`D_REG_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '创建日期',
			`T_REG_TIME` VARCHAR(8) NULL DEFAULT NULL COMMENT '创建时间',
			`L_MODI_OPERID` BIGINT(18) NULL DEFAULT '0' COMMENT '修改人(操作员)ID号',
			`C_MODI_OPERNAME` VARCHAR(40) NULL DEFAULT NULL COMMENT '修改人(操作员)姓名',
			`D_MODI_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '修改日期',
			`T_MODI_TIME` VARCHAR(8) NULL DEFAULT NULL COMMENT '修改时间',
			`L_AUDIT_OPERID` BIGINT(18) NULL DEFAULT '0' COMMENT '审核人(操作员)ID号',
			`C_AUDIT_OPERNAME` VARCHAR(40) NULL DEFAULT NULL COMMENT '审核人(操作员)姓名',
			`D_AUDIT_DATE` VARCHAR(8) NULL DEFAULT NULL COMMENT '审核日期',
			`T_AUDIT_TIME` VARCHAR(8) NULL DEFAULT NULL COMMENT '审核时间',
			PRIMARY KEY (`ID`),
			INDEX `AGREEMENT_STANDARD_NO` (`C_AGREEMENT_STANDARD_NO`)
		)
	END IF;
	END$$
	call add_table()$$
	drop PROCEDURE if EXISTS add_table$$
	
	##操作员字段长度   提交日期2017/01/05
	drop PROCEDURE if EXISTS change_table_col$$
	create procedure change_table_col() BEGIN   
	IF EXISTS (SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA in (select database()) AND table_name='t_cust_fileaduit' AND COLUMN_NAME='C_OPERNO')
	THEN   
	   ALTER TABLE `t_cust_fileaduit` CHANGE COLUMN `C_OPERNO` `C_OPERNO` VARCHAR(20) NULL DEFAULT NULL ;
	END IF;
	END$$
	call change_table_col()$$
	drop PROCEDURE if EXISTS change_table_col$$
	
