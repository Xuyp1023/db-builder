##-- 合同模板表		提交日期2017/03/10
     CREATE TABLE `t_scf_product` (
	`id` BIGINT(18) NOT NULL AUTO_INCREMENT COMMENT '产品流水号',
	`L_CORE_CUSTNO` BIGINT(20) NOT NULL COMMENT '核心企业',
	`C_CORE_CUSTNAME` VARCHAR(120) NOT NULL COMMENT '核心企业名称',
	`L_FACTORNO` BIGINT(18) NOT NULL COMMENT '保理公司',
	`C_FACTORNAME` VARCHAR(120) NOT NULL COMMENT '保理公司名称',
	`C_FACTORCORP` VARCHAR(30) NULL DEFAULT NULL COMMENT '保理公司简称/名称',
	`C_PRODUCT_CODE` VARCHAR(40) NOT NULL COMMENT '产品编号',
	`C_PRODUCT_NAME` VARCHAR(40) NOT NULL COMMENT '产品名称',
	`C_FEATURE` VARCHAR(500) NULL DEFAULT ' ' COMMENT '产品特征',
	`C_FIT_CROWD` VARCHAR(500) NULL DEFAULT ' ' COMMENT '产品使用范围',
	`F_STARTMONEY` DECIMAL(16,2) NOT NULL COMMENT '最低融资金额/单笔放款额度（起）',
	`F_ENDMONEY` DECIMAL(16,2) NOT NULL COMMENT '最高融资金额/单笔放款额度（终）',
	`C_FINANCTYPE` VARCHAR(100) NOT NULL COMMENT '融资方式(1:折扣方式;2:比例方式;)',
	`F_RATIO` DECIMAL(7,4) NULL DEFAULT '0.0000' COMMENT '通用利率',
	`N_MINDAYS` INT(11) NULL DEFAULT '0' COMMENT '最短放款天数',
	`N_MAXDAYS` INT(11) NULL DEFAULT '0' COMMENT '最长放款天数',
	`C_FACTORTYPE` CHAR(1) NOT NULL COMMENT '保理类型(1:应收账款融资;2:应收账款票据质押融资;3:预付款融资;)',
	`C_BUSIN_STATUS` CHAR(1) NOT NULL DEFAULT '0' COMMENT '状态(0:登记;1:上架;2:下架;)',
	`L_REG_OPERID` BIGINT(18) NOT NULL COMMENT '产品录入操作员ID号',
	`C_REG_OPERNAME` VARCHAR(40) NOT NULL COMMENT '产品录入操作员姓名',
	`D_REG_DATE` VARCHAR(8) NOT NULL COMMENT '产品录入日期',
	`T_REG_TIME` VARCHAR(8) NOT NULL COMMENT '产品录入时间',
	`L_MODI_OPERID` VARCHAR(18) NULL DEFAULT NULL COMMENT '产品修改操作员ID号',
	`C_MODI_OPERNAME` VARCHAR(40) NULL DEFAULT NULL COMMENT '产品修改操作员姓名',
	`D_MODI_DATE` VARCHAR(8) NULL DEFAULT '0' COMMENT '产品修改日期',
	`T_MODI_TIME` VARCHAR(8) NULL DEFAULT ' ' COMMENT '产品修改时间',
	`L_SHELVES_OPERID` BIGINT(18) NULL DEFAULT '0' COMMENT '产品上架操作员ID号',
	`C_SHELVES_OPERNAME` VARCHAR(40) NULL DEFAULT ' ' COMMENT '产品上架操作员姓名',
	`C_SHELVES_DATE` VARCHAR(8) NULL DEFAULT ' ' COMMENT '产品上架日期',
	`T_SHELVES_TIME` VARCHAR(8) NULL DEFAULT ' ' COMMENT '产品上架时间',
	`L_OFFLINE_OPERID` BIGINT(18) NULL DEFAULT '0' COMMENT '产品下架操作员ID号',
	`C_OFFLINE_OPERNAME` VARCHAR(40) NULL DEFAULT ' ' COMMENT '产品下架操作员姓名',
	`D_OFFLINE_DATE` VARCHAR(8) NULL DEFAULT ' ' COMMENT '产品下架日期',
	`T_OFFLINE_TIME` VARCHAR(8) NULL DEFAULT ' ' COMMENT '产品下架时间',
	`C_OPERORG` VARCHAR(200) NOT NULL COMMENT '操作机构',
	PRIMARY KEY (`id`),
	INDEX `idxT_SCF_PRODUCT_L_CORE_CUSTNO` (`L_CORE_CUSTNO`),
	INDEX `idxT_SCF_PRODUCT_C_FACTOR_CODE_C_FACTORCORP` (`C_PRODUCT_CODE`, `L_FACTORNO`)
   )
  COLLATE='utf8_general_ci'
  ENGINE=InnoDB
  AUTO_INCREMENT=1000602
	;;

		
	