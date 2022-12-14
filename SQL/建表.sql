--打开数据库
USE [assets_management]

--建立部门表
GO
/****** Object:  Table [dbo].[tab_department]    Script Date: 2021/12/15 16:18:47 ******/
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

--建立操作员表
GO
/****** Object:  Table [dbo].[tab_operator]    Script Date: 2021/12/15 16:18:47 ******/
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


--建立资产表
GO
/****** Object:  Table [dbo].[tab_pro_info]    Script Date: 2021/12/15 16:18:47 ******/
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

--设置外键与部门表建立关系
GO
ALTER TABLE [dbo].[tab_pro_info]  WITH CHECK ADD FOREIGN KEY([dep_id])
REFERENCES [dbo].[tab_department] ([dep_id])
--设置外键与操作员表建立关系
GO
ALTER TABLE [dbo].[tab_pro_info]  WITH CHECK ADD FOREIGN KEY([oper_id])
REFERENCES [dbo].[tab_operator] ([oper_id])

----设置字段约束
--购买方式
GO
ALTER TABLE [dbo].[tab_pro_info]  WITH CHECK ADD CHECK  (([inc_method]='购买' OR [inc_method]='捐赠'))
--资产分类
GO
ALTER TABLE [dbo].[tab_pro_info]  WITH CHECK ADD CHECK  (([pro_class_name]='其他' OR [pro_class_name]='电子设备'))
--使用状态
GO
ALTER TABLE [dbo].[tab_pro_info]  WITH CHECK ADD CHECK  (([use_state]='未使用' OR [use_state]='使用中' OR [use_state]='报废'))
GO
