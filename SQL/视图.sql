--��ʹ���е��ʲ���ͼ
/*
create view dbo.Assets_in_use
as
SELECT  dbo.tab_pro_info.pro_id AS �ʲ����, dbo.tab_pro_info.pro_name AS �ʲ�����, 
                   dbo.tab_pro_info.pro_class_name AS �ʲ����, dbo.tab_pro_info.use_state AS ʹ��״̬, 
                   dbo.tab_department.dep_id AS ���ű��, dbo.tab_department.dep_name AS ��������, 
                   dbo.tab_department.dep_manager AS ���Ÿ�����, dbo.tab_operator.oper_id AS ����Ա���, 
                   dbo.tab_operator.operator AS ����Ա����
FROM      dbo.tab_department INNER JOIN
                   dbo.tab_pro_info ON dbo.tab_department.dep_id = dbo.tab_pro_info.dep_id INNER JOIN
                   dbo.tab_operator ON dbo.tab_pro_info.oper_id = dbo.tab_operator.oper_id
WHERE   (dbo.tab_pro_info.use_state = 'ʹ����')
go
*/
--��ѯ��ͼ
--select * from dbo.Assets_in_use
	




--���ϵ��ʲ���ͼ
/*
create view dbo.abandoned_assets
as
SELECT  dbo.tab_pro_info.pro_id AS �ʲ����, dbo.tab_pro_info.pro_name AS �ʲ�����, 
                   dbo.tab_pro_info.pro_class_name AS �ʲ����, dbo.tab_pro_info.use_state AS ʹ��״̬, 
                   dbo.tab_department.dep_id AS ���ű��, dbo.tab_department.dep_name AS ��������, 
                   dbo.tab_department.dep_manager AS ���Ÿ�����, dbo.tab_operator.oper_id AS ����Ա���, 
                   dbo.tab_operator.operator AS ����Ա����
FROM      dbo.tab_department INNER JOIN
                   dbo.tab_pro_info ON dbo.tab_department.dep_id = dbo.tab_pro_info.dep_id INNER JOIN
                   dbo.tab_operator ON dbo.tab_pro_info.oper_id = dbo.tab_operator.oper_id
WHERE   (dbo.tab_pro_info.use_state = '����')
go
*/
--��ѯ��ͼ
--select * from dbo.abandoned_assets



--δʹ�е��ʲ�
/*
create view dbo.unused
as
SELECT  dbo.tab_pro_info.pro_id AS �ʲ����, dbo.tab_pro_info.pro_name AS �ʲ�����, 
                   dbo.tab_pro_info.pro_class_name AS �ʲ����, dbo.tab_pro_info.use_state AS ʹ��״̬, 
                   dbo.tab_department.dep_id AS ���ű��, dbo.tab_department.dep_name AS ��������, 
                   dbo.tab_department.dep_manager AS ���Ÿ�����, dbo.tab_operator.oper_id AS ����Ա���, 
                   dbo.tab_operator.operator AS ����Ա����
FROM      dbo.tab_department INNER JOIN
                   dbo.tab_pro_info ON dbo.tab_department.dep_id = dbo.tab_pro_info.dep_id INNER JOIN
                   dbo.tab_operator ON dbo.tab_pro_info.oper_id = dbo.tab_operator.oper_id
WHERE   (dbo.tab_pro_info.use_state = 'δʹ��')
go
*/
--��ѯ��ͼ
--select * from dbo.unused
