use assets_management
go
--��ѯ���ű�
SELECT dep_id as '���ű��',
dep_name as '��������',
dep_manager as '���Ÿ�����'
FROM dbo.tab_department

--��ѯ����Ա��
SELECT oper_id as '����Ա���',
operator as '����Ա����',
password_oper as '����Ա����'
FROM dbo.tab_operator

--��ѯ�ʲ���
SELECT  pro_id as '�ʲ����',
pro_name as '�ʲ�����',
pro_class_name as '����',
ori_value as 'ԭֵ',
all_depre as '�ۼ��۾�',
now_value as '��ֵ',
inc_method as '���ӷ�ʽ',
inc_time as '����ʱ��',
use_state as 'ʹ��״̬',
dep_id as '���ű��',
oper_id as '����Ա���'
FROM dbo.tab_pro_info