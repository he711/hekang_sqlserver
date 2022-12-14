USE [master]
GO
/****** Object:  Database [assets_management]    Script Date: 2022/1/2 16:04:28 ******/
CREATE DATABASE [assets_management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'assets_management', FILENAME = N'D:\assets management\assets_management.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'assets_management_log', FILENAME = N'D:\assets management\assets_management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [assets_management] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [assets_management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [assets_management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [assets_management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [assets_management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [assets_management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [assets_management] SET ARITHABORT OFF 
GO
ALTER DATABASE [assets_management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [assets_management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [assets_management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [assets_management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [assets_management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [assets_management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [assets_management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [assets_management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [assets_management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [assets_management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [assets_management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [assets_management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [assets_management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [assets_management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [assets_management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [assets_management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [assets_management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [assets_management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [assets_management] SET  MULTI_USER 
GO
ALTER DATABASE [assets_management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [assets_management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [assets_management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [assets_management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [assets_management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [assets_management] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [assets_management] SET QUERY_STORE = OFF
GO
USE [assets_management]
GO
/****** Object:  Table [dbo].[tab_pro_info]    Script Date: 2022/1/2 16:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tab_pro_info](
	[pro_id] [bigint] NOT NULL,
	[pro_name] [char](50) NOT NULL,
	[pro_class_name] [char](50) NOT NULL,
	[ori_value] [bigint] NOT NULL,
	[all_depre] [bigint] NOT NULL,
	[now_value] [bigint] NOT NULL,
	[inc_method] [char](50) NOT NULL,
	[inc_time] [date] NOT NULL,
	[use_state] [char](50) NOT NULL,
	[dep_id] [char](2) NOT NULL,
	[oper_id] [char](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tab_operator]    Script Date: 2022/1/2 16:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tab_operator](
	[oper_id] [char](3) NOT NULL,
	[operator] [char](10) NOT NULL,
	[password_oper] [char](4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[oper_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tab_department]    Script Date: 2022/1/2 16:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tab_department](
	[dep_id] [char](2) NOT NULL,
	[dep_name] [char](50) NOT NULL,
	[dep_manager] [char](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dep_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Assets_in_use]    Script Date: 2022/1/2 16:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--在使用中的资产视图
create view [dbo].[Assets_in_use]
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
GO
/****** Object:  View [dbo].[abandoned_assets]    Script Date: 2022/1/2 16:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

create view [dbo].[abandoned_assets]
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
GO
/****** Object:  View [dbo].[unused]    Script Date: 2022/1/2 16:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

--查询视图
select * from dbo.abandoned_assets
*/


--未使中的资产
create view [dbo].[unused]
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
GO
INSERT [dbo].[tab_department] ([dep_id], [dep_name], [dep_manager]) VALUES (N'a1', N'技术部                                            ', N'李田所                                            ')
INSERT [dbo].[tab_department] ([dep_id], [dep_name], [dep_manager]) VALUES (N'a2', N'财务部                                            ', N'张保仔                                            ')
INSERT [dbo].[tab_department] ([dep_id], [dep_name], [dep_manager]) VALUES (N'a3', N'人事部                                            ', N'曹阿满                                            ')
GO
INSERT [dbo].[tab_operator] ([oper_id], [operator], [password_oper]) VALUES (N'b1 ', N'李一一    ', N'b1  ')
INSERT [dbo].[tab_operator] ([oper_id], [operator], [password_oper]) VALUES (N'b2 ', N'韦二二    ', N'b2  ')
INSERT [dbo].[tab_operator] ([oper_id], [operator], [password_oper]) VALUES (N'b3 ', N'何三三    ', N'b3  ')
INSERT [dbo].[tab_operator] ([oper_id], [operator], [password_oper]) VALUES (N'b4 ', N'四        ', N'b4  ')
GO
INSERT [dbo].[tab_pro_info] ([pro_id], [pro_name], [pro_class_name], [ori_value], [all_depre], [now_value], [inc_method], [inc_time], [use_state], [dep_id], [oper_id]) VALUES (2021001, N'联想电脑                                          ', N'电子设备                                          ', 5000, 1000, 4000, N'购买                                              ', CAST(N'2021-12-15' AS Date), N'使用中                                            ', N'a1', N'b1 ')
INSERT [dbo].[tab_pro_info] ([pro_id], [pro_name], [pro_class_name], [ori_value], [all_depre], [now_value], [inc_method], [inc_time], [use_state], [dep_id], [oper_id]) VALUES (2021002, N'华为电脑                                          ', N'电子设备                                          ', 4000, 1000, 3000, N'捐赠                                              ', CAST(N'2021-12-15' AS Date), N'未使用                                            ', N'a1', N'b1 ')
INSERT [dbo].[tab_pro_info] ([pro_id], [pro_name], [pro_class_name], [ori_value], [all_depre], [now_value], [inc_method], [inc_time], [use_state], [dep_id], [oper_id]) VALUES (2021003, N'华硕电脑                                          ', N'电子设备                                          ', 3500, 1000, 2500, N'购买                                              ', CAST(N'2021-12-15' AS Date), N'报废                                              ', N'a2', N'b2 ')
INSERT [dbo].[tab_pro_info] ([pro_id], [pro_name], [pro_class_name], [ori_value], [all_depre], [now_value], [inc_method], [inc_time], [use_state], [dep_id], [oper_id]) VALUES (2021004, N'桌子                                              ', N'其他                                              ', 400, 150, 250, N'捐赠                                              ', CAST(N'2021-12-15' AS Date), N'使用中                                            ', N'a2', N'b2 ')
INSERT [dbo].[tab_pro_info] ([pro_id], [pro_name], [pro_class_name], [ori_value], [all_depre], [now_value], [inc_method], [inc_time], [use_state], [dep_id], [oper_id]) VALUES (2021005, N'椅子                                              ', N'其他                                              ', 300, 100, 200, N'购买                                              ', CAST(N'2021-12-15' AS Date), N'使用中                                            ', N'a3', N'b3 ')
INSERT [dbo].[tab_pro_info] ([pro_id], [pro_name], [pro_class_name], [ori_value], [all_depre], [now_value], [inc_method], [inc_time], [use_state], [dep_id], [oper_id]) VALUES (2021006, N'台灯                                              ', N'其他                                              ', 200, 50, 150, N'购买                                              ', CAST(N'2021-12-15' AS Date), N'报废                                              ', N'a3', N'b3 ')
INSERT [dbo].[tab_pro_info] ([pro_id], [pro_name], [pro_class_name], [ori_value], [all_depre], [now_value], [inc_method], [inc_time], [use_state], [dep_id], [oper_id]) VALUES (2021007, N'华硕电脑                                          ', N'电子设备                                          ', 3500, 1000, 2500, N'购买                                              ', CAST(N'2021-12-15' AS Date), N'报废                                              ', N'a2', N'b2 ')
INSERT [dbo].[tab_pro_info] ([pro_id], [pro_name], [pro_class_name], [ori_value], [all_depre], [now_value], [inc_method], [inc_time], [use_state], [dep_id], [oper_id]) VALUES (2021008, N'台灯                                              ', N'其他                                              ', 2000, 50, 1950, N'购买                                              ', CAST(N'2021-12-21' AS Date), N'报废                                              ', N'a2', N'b2 ')
INSERT [dbo].[tab_pro_info] ([pro_id], [pro_name], [pro_class_name], [ori_value], [all_depre], [now_value], [inc_method], [inc_time], [use_state], [dep_id], [oper_id]) VALUES (2021009, N'台灯                                              ', N'其他                                              ', 2000, 50, 1950, N'购买                                              ', CAST(N'2021-12-21' AS Date), N'报废                                              ', N'a3', N'b3 ')
INSERT [dbo].[tab_pro_info] ([pro_id], [pro_name], [pro_class_name], [ori_value], [all_depre], [now_value], [inc_method], [inc_time], [use_state], [dep_id], [oper_id]) VALUES (2021010, N'台灯                                              ', N'其他                                              ', 2000, 50, 1950, N'购买                                              ', CAST(N'2021-12-21' AS Date), N'报废                                              ', N'a3', N'b3 ')
INSERT [dbo].[tab_pro_info] ([pro_id], [pro_name], [pro_class_name], [ori_value], [all_depre], [now_value], [inc_method], [inc_time], [use_state], [dep_id], [oper_id]) VALUES (2021011, N'台灯                                              ', N'其他                                              ', 2000, 50, 1950, N'购买                                              ', CAST(N'2021-12-21' AS Date), N'报废                                              ', N'a3', N'b3 ')
INSERT [dbo].[tab_pro_info] ([pro_id], [pro_name], [pro_class_name], [ori_value], [all_depre], [now_value], [inc_method], [inc_time], [use_state], [dep_id], [oper_id]) VALUES (2021012, N'台灯                                              ', N'其他                                              ', 2000, 50, 1950, N'购买                                              ', CAST(N'2021-12-21' AS Date), N'报废                                              ', N'a1', N'b3 ')
INSERT [dbo].[tab_pro_info] ([pro_id], [pro_name], [pro_class_name], [ori_value], [all_depre], [now_value], [inc_method], [inc_time], [use_state], [dep_id], [oper_id]) VALUES (2021013, N'台灯                                              ', N'其他                                              ', 2000, 50, 1950, N'购买                                              ', CAST(N'2021-12-21' AS Date), N'报废                                              ', N'a2', N'b3 ')
INSERT [dbo].[tab_pro_info] ([pro_id], [pro_name], [pro_class_name], [ori_value], [all_depre], [now_value], [inc_method], [inc_time], [use_state], [dep_id], [oper_id]) VALUES (2021014, N'台灯                                              ', N'其他                                              ', 2000, 50, 1950, N'购买                                              ', CAST(N'2021-12-21' AS Date), N'报废                                              ', N'a2', N'b3 ')
INSERT [dbo].[tab_pro_info] ([pro_id], [pro_name], [pro_class_name], [ori_value], [all_depre], [now_value], [inc_method], [inc_time], [use_state], [dep_id], [oper_id]) VALUES (2021015, N'台灯                                              ', N'其他                                              ', 2000, 50, 1950, N'购买                                              ', CAST(N'2021-12-21' AS Date), N'报废                                              ', N'a2', N'b3 ')
INSERT [dbo].[tab_pro_info] ([pro_id], [pro_name], [pro_class_name], [ori_value], [all_depre], [now_value], [inc_method], [inc_time], [use_state], [dep_id], [oper_id]) VALUES (2021016, N'台灯                                              ', N'其他                                              ', 2000, 50, 1950, N'购买                                              ', CAST(N'2021-12-21' AS Date), N'报废                                              ', N'a2', N'b3 ')
INSERT [dbo].[tab_pro_info] ([pro_id], [pro_name], [pro_class_name], [ori_value], [all_depre], [now_value], [inc_method], [inc_time], [use_state], [dep_id], [oper_id]) VALUES (2021017, N'台灯                                              ', N'其他                                              ', 2000, 50, 1950, N'购买                                              ', CAST(N'2021-12-21' AS Date), N'报废                                              ', N'a2', N'b3 ')
INSERT [dbo].[tab_pro_info] ([pro_id], [pro_name], [pro_class_name], [ori_value], [all_depre], [now_value], [inc_method], [inc_time], [use_state], [dep_id], [oper_id]) VALUES (2021020, N'台灯                                              ', N'其他                                              ', 2000, 50, 1950, N'购买                                              ', CAST(N'2021-12-21' AS Date), N'报废                                              ', N'a3', N'b3 ')
INSERT [dbo].[tab_pro_info] ([pro_id], [pro_name], [pro_class_name], [ori_value], [all_depre], [now_value], [inc_method], [inc_time], [use_state], [dep_id], [oper_id]) VALUES (2021021, N'台灯                                              ', N'其他                                              ', 2000, 50, 1950, N'购买                                              ', CAST(N'2021-12-21' AS Date), N'报废                                              ', N'a3', N'b3 ')
GO
/****** Object:  Index [ori_valueIndx]    Script Date: 2022/1/2 16:04:28 ******/
CREATE NONCLUSTERED INDEX [ori_valueIndx] ON [dbo].[tab_pro_info]
(
	[ori_value] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tab_pro_info]  WITH CHECK ADD FOREIGN KEY([dep_id])
REFERENCES [dbo].[tab_department] ([dep_id])
GO
ALTER TABLE [dbo].[tab_pro_info]  WITH CHECK ADD FOREIGN KEY([oper_id])
REFERENCES [dbo].[tab_operator] ([oper_id])
GO
ALTER TABLE [dbo].[tab_pro_info]  WITH CHECK ADD CHECK  (([inc_method]='购买' OR [inc_method]='捐赠'))
GO
ALTER TABLE [dbo].[tab_pro_info]  WITH CHECK ADD CHECK  (([pro_class_name]='其他' OR [pro_class_name]='电子设备'))
GO
ALTER TABLE [dbo].[tab_pro_info]  WITH CHECK ADD CHECK  (([use_state]='未使用' OR [use_state]='使用中' OR [use_state]='报废'))
GO
/****** Object:  StoredProcedure [dbo].[proStudentByNo1]    Script Date: 2022/1/2 16:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--定义存储过程
CREATE PROCEDURE [dbo].[proStudentByNo1](@operid char(3))
AS
	SELECT *
	FROM dbo.tab_pro_info
	--接收操作员的编号
	WHERE oper_id=@operid



--根据数据流览存储过程
EXECUTE proStudentByNo1 'b2'
GO
USE [master]
GO
ALTER DATABASE [assets_management] SET  READ_WRITE 
GO
