--SELECT COUNT(use_state) as 'δʹ�õ��ʲ�' FROM dbo.tab_pro_info WHERE use_state = 'δʹ��'

--SELECT COUNT(use_state) as '��ʹ���е��ʲ�' FROM dbo.tab_pro_info WHERE use_state = 'ʹ����'

--SELECT COUNT(use_state) as '�����ϵ��ʲ�' FROM dbo.tab_pro_info WHERE use_state = '����'


--ͳ���ʲ���U
/*
SELECT SUM(case when use_state='ʹ����' then 1 else 0 end) as 'ʹ����',
SUM(case when use_state='δʹ��' then 1 else 0 end) as 'δʹ��',
SUM(case when use_state='����' then 1 else 0 end) as '����'
FROM dbo.tab_pro_info
*/


--������ӵ���ʲ���U

SELECT SUM(case when dbo.tab_pro_info.dep_id='a1' then 1 else 0 end) as '������',
SUM(case when dbo.tab_pro_info.dep_id='a3' then 1 else 0 end) as '���²�',
SUM(case when dbo.tab_pro_info.dep_id='a2' then 1 else 0 end) as '����'
FROM dbo.tab_pro_info
