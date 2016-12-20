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