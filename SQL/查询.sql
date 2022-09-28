use assets_management
go
--查询部门表
SELECT dep_id as '部门编号',
dep_name as '部门名称',
dep_manager as '部门负责人'
FROM dbo.tab_department

--查询操作员表
SELECT oper_id as '操作员编号',
operator as '操作员名字',
password_oper as '操作员密码'
FROM dbo.tab_operator

--查询资产表
SELECT  pro_id as '资产编号',
pro_name as '资产名称',
pro_class_name as '类型',
ori_value as '原值',
all_depre as '累计折旧',
now_value as '现值',
inc_method as '增加方式',
inc_time as '增加时间',
use_state as '使用状态',
dep_id as '部门编号',
oper_id as '操作员编号'
FROM dbo.tab_pro_info