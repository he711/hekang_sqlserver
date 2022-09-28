--定义存储过程
/*CREATE PROCEDURE proStudentByNo1(@operid char(3))
AS
	SELECT *
	FROM dbo.tab_pro_info
	--接收操作员的编号
	WHERE oper_id=@operid
*/


--根据数据流览存储过程
EXECUTE proStudentByNo1 'b2'