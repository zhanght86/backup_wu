/*
修改了银行信息表的 银行代码 的数据类型
Date: 2015-05-18 
*/
ALTER TABLE t_bank MODIFY COLUMN Bank_Code VARCHAR(20) DEFAULT NULL COMMENT "银行代码"
ALTER TABLE t_bankcard MODIFY COLUMN BankCode VARCHAR(20) DEFAULT NULL COMMENT "银行代码"