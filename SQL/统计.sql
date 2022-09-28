--SELECT COUNT(use_state) as '未使用的资产' FROM dbo.tab_pro_info WHERE use_state = '未使用'

--SELECT COUNT(use_state) as '在使用中的资产' FROM dbo.tab_pro_info WHERE use_state = '使用中'

--SELECT COUNT(use_state) as '己报废的资产' FROM dbo.tab_pro_info WHERE use_state = '报废'


--统计资产情怳
/*
SELECT SUM(case when use_state='使用中' then 1 else 0 end) as '使用中',
SUM(case when use_state='未使用' then 1 else 0 end) as '未使用',
SUM(case when use_state='报废' then 1 else 0 end) as '报废'
FROM dbo.tab_pro_info
*/


--各部门拥有资产情怳

SELECT SUM(case when dbo.tab_pro_info.dep_id='a1' then 1 else 0 end) as '技术部',
SUM(case when dbo.tab_pro_info.dep_id='a3' then 1 else 0 end) as '人事部',
SUM(case when dbo.tab_pro_info.dep_id='a2' then 1 else 0 end) as '财务部'
FROM dbo.tab_pro_info
