--部门表插入数据
/*
INSERT INTO dbo.tab_department VALUES('a1', '技术部', '李田所');
INSERT INTO dbo.tab_department VALUES('a2', '财务部', '张保仔');
INSERT INTO dbo.tab_department VALUES('a3', '人事部', '曹阿满');


--操作员表插入数据
/*
INSERT INTO dbo.tab_operator VALUES('b1', '李一一', 'b1');
INSERT INTO dbo.tab_operator VALUES('b2', '韦二二', 'b2');
*/

INSERT INTO dbo.tab_operator VALUES('b3', '何三三', 'b3');


--资产表插入数据
INSERT INTO dbo.tab_pro_info VALUES(2021001, '联想电脑', '电子设备', 5000, 1000, 4000, '购买', '2021-12-15', '使用中', 'a1', 'b1');
INSERT INTO dbo.tab_pro_info VALUES(2021002,'华为电脑', '电子设备', 4000, 1000, 3000, '捐赠', '2021-12-15', '未使用', 'a1', 'b1');
INSERT INTO dbo.tab_pro_info VALUES(2021003,'华硕电脑', '电子设备', 3500, 1000, 2500, '购买', '2021-12-15', '报废', 'a2', 'b2');
INSERT INTO dbo.tab_pro_info VALUES(2021004, '桌子', '其他', 400, 150,250, '捐赠', '2021-12-15', '使用中', 'a2', 'b2');
INSERT INTO dbo.tab_pro_info VALUES(2021005,'椅子', '其他', 300, 100, 200, '购买', '2021-12-15', '未使用', 'a3', 'b3');
*/


use assets_management
go
INSERT INTO dbo.tab_pro_info VALUES(2021021,'台灯', '其他', 2000, 50, 1950, '购买', '2021-12-21', '报废', 'a3', 'b3');






