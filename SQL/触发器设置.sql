--�����ݿ�
use assets_management

--����������
go

--����������dbo.stu_TRIGGER_INSTEADOF(�������ʲô��������)		�趨ֻ������3�����ŵļ�¼
CREATE TRIGGER dbo.stu_TRIGGER_INSTEADOF
--ָ��dbo.tab_pro_info��
   ON dbo.tab_pro_info
   --���������ڲ�������
	instead of insert
as 
begin
    declare @depid char;
    select @depid=(select dep_id from inserted)
	--�������Ĳ��Ų������������ţ���������������
if(@depid = 'a1' or @depid = 'a2' or @depid ='a3')
    select 'û���������' as 'ʧ��ԭ��'
end