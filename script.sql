USE [master]
GO
/****** Object:  Database [nimtest]    Script Date: 07-Mar-22 8:54:27 PM ******/
CREATE DATABASE [nimtest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'nimtest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\nimtest.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'nimtest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\nimtest_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [nimtest] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [nimtest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [nimtest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [nimtest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [nimtest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [nimtest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [nimtest] SET ARITHABORT OFF 
GO
ALTER DATABASE [nimtest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [nimtest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [nimtest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [nimtest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [nimtest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [nimtest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [nimtest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [nimtest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [nimtest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [nimtest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [nimtest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [nimtest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [nimtest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [nimtest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [nimtest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [nimtest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [nimtest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [nimtest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [nimtest] SET  MULTI_USER 
GO
ALTER DATABASE [nimtest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [nimtest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [nimtest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [nimtest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [nimtest] SET DELAYED_DURABILITY = DISABLED 
GO
USE [nimtest]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 07-Mar-22 8:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 07-Mar-22 8:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[categoryname] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prodtbl]    Script Date: 07-Mar-22 8:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prodtbl](
	[PId] [int] IDENTITY(1,1) NOT NULL,
	[productname] [nvarchar](max) NULL,
	[cid] [int] NOT NULL,
 CONSTRAINT [PK_dbo.prodtbl] PRIMARY KEY CLUSTERED 
(
	[PId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_cid]    Script Date: 07-Mar-22 8:54:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_cid] ON [dbo].[prodtbl]
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[prodtbl]  WITH CHECK ADD  CONSTRAINT [FK_dbo.prodtbl_dbo.category_cid] FOREIGN KEY([cid])
REFERENCES [dbo].[category] ([cid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[prodtbl] CHECK CONSTRAINT [FK_dbo.prodtbl_dbo.category_cid]
GO
USE [master]
GO
ALTER DATABASE [nimtest] SET  READ_WRITE 
GO
