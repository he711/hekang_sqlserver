--打开数据库
use assets_management

--建立触发器
go

--触发器名叫dbo.stu_TRIGGER_INSTEADOF(看你想叫什么都行名字)		设定只能输入3个部门的记录
CREATE TRIGGER dbo.stu_TRIGGER_INSTEADOF
--指向dbo.tab_pro_info表
   ON dbo.tab_pro_info
   --触发器属于插入类型
	instead of insert
as 
begin
    declare @depid char;
    select @depid=(select dep_id from inserted)
	--如果插入的部门不是这三个部门，触发器启动操作
if(@depid = 'a1' or @depid = 'a2' or @depid ='a3')
    select '没有这个部门' as '失败原因'
end