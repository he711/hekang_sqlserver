--在使用中的资产视图
/*
create view dbo.Assets_in_use
as
SELECT  dbo.tab_pro_info.pro_id AS 资产编号, dbo.tab_pro_info.pro_name AS 资产名称, 
                   dbo.tab_pro_info.pro_class_name AS 资产类别, dbo.tab_pro_info.use_state AS 使用状态, 
                   dbo.tab_department.dep_id AS 部门编号, dbo.tab_department.dep_name AS 部门名称, 
                   dbo.tab_department.dep_manager AS 部门负责人, dbo.tab_operator.oper_id AS 操作员编号, 
                   dbo.tab_operator.operator AS 操作员姓名
FROM      dbo.tab_department INNER JOIN
                   dbo.tab_pro_info ON dbo.tab_department.dep_id = dbo.tab_pro_info.dep_id INNER JOIN
                   dbo.tab_operator ON dbo.tab_pro_info.oper_id = dbo.tab_operator.oper_id
WHERE   (dbo.tab_pro_info.use_state = '使用中')
go
*/
--查询视图
--select * from dbo.Assets_in_use
	




--报废的资产视图
/*
create view dbo.abandoned_assets
as
SELECT  dbo.tab_pro_info.pro_id AS 资产编号, dbo.tab_pro_info.pro_name AS 资产名称, 
                   dbo.tab_pro_info.pro_class_name AS 资产类别, dbo.tab_pro_info.use_state AS 使用状态, 
                   dbo.tab_department.dep_id AS 部门编号, dbo.tab_department.dep_name AS 部门名称, 
                   dbo.tab_department.dep_manager AS 部门负责人, dbo.tab_operator.oper_id AS 操作员编号, 
                   dbo.tab_operator.operator AS 操作员姓名
FROM      dbo.tab_department INNER JOIN
                   dbo.tab_pro_info ON dbo.tab_department.dep_id = dbo.tab_pro_info.dep_id INNER JOIN
                   dbo.tab_operator ON dbo.tab_pro_info.oper_id = dbo.tab_operator.oper_id
WHERE   (dbo.tab_pro_info.use_state = '报废')
go
*/
--查询视图
--select * from dbo.abandoned_assets



--未使中的资产
/*
create view dbo.unused
as
SELECT  dbo.tab_pro_info.pro_id AS 资产编号, dbo.tab_pro_info.pro_name AS 资产名称, 
                   dbo.tab_pro_info.pro_class_name AS 资产类别, dbo.tab_pro_info.use_state AS 使用状态, 
                   dbo.tab_department.dep_id AS 部门编号, dbo.tab_department.dep_name AS 部门名称, 
                   dbo.tab_department.dep_manager AS 部门负责人, dbo.tab_operator.oper_id AS 操作员编号, 
                   dbo.tab_operator.operator AS 操作员姓名
FROM      dbo.tab_department INNER JOIN
                   dbo.tab_pro_info ON dbo.tab_department.dep_id = dbo.tab_pro_info.dep_id INNER JOIN
                   dbo.tab_operator ON dbo.tab_pro_info.oper_id = dbo.tab_operator.oper_id
WHERE   (dbo.tab_pro_info.use_state = '未使用')
go
*/
--查询视图
--select * from dbo.unused
