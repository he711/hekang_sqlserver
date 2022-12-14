--打开数据库
USE [master]

--建立资产管理数据库
GO
/****** Object:  Database [assets_management]    Script Date: 2021/12/15 16:25:51 ******/
CREATE DATABASE [assets_management]
 CONTAINMENT = NONE
 ON  PRIMARY								 --数据库文件路径							最小		最大自动増长				增量
( NAME = N'assets_management', FILENAME = N'D:\assets management\assets_management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON										 --数据库日志文件路径
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
