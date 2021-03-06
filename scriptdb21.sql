USE [master]
GO
/****** Object:  Database [DB21]    Script Date: 4/14/2019 4:30:20 AM ******/
CREATE DATABASE [DB21]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MobileInfo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.USMANSQL\MSSQL\DATA\MobileInfo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MobileInfo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.USMANSQL\MSSQL\DATA\MobileInfo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DB21] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB21].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB21] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB21] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB21] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB21] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB21] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB21] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB21] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB21] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB21] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB21] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB21] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB21] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB21] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB21] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB21] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB21] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB21] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB21] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB21] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB21] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB21] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB21] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB21] SET RECOVERY FULL 
GO
ALTER DATABASE [DB21] SET  MULTI_USER 
GO
ALTER DATABASE [DB21] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB21] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB21] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB21] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB21] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB21', N'ON'
GO
ALTER DATABASE [DB21] SET QUERY_STORE = OFF
GO
USE [DB21]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 4/14/2019 4:30:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 4/14/2019 4:30:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[model]    Script Date: 4/14/2019 4:30:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[model](
	[modelId] [int] IDENTITY(1,1) NOT NULL,
	[categoryId] [int] NULL,
	[modelName] [nvarchar](50) NOT NULL,
	[ram] [int] NOT NULL,
	[rom] [int] NOT NULL,
	[memory] [int] NOT NULL,
	[imageUrlOfMob] [nvarchar](max) NOT NULL,
	[camera] [int] NOT NULL,
	[battery] [int] NOT NULL,
	[marketPrice] [int] NOT NULL,
	[shape] [float] NOT NULL,
	[createdDate] [date] NOT NULL,
 CONSTRAINT [PK_model] PRIMARY KEY CLUSTERED 
(
	[modelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[news]    Script Date: 4/14/2019 4:30:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news](
	[newsId] [int] IDENTITY(1,1) NOT NULL,
	[modelId] [int] NULL,
	[description] [nvarchar](50) NOT NULL,
	[imageUrl] [nvarchar](max) NULL,
	[newsDate] [date] NULL,
 CONSTRAINT [PK_news] PRIMARY KEY CLUSTERED 
(
	[newsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[outlet]    Script Date: 4/14/2019 4:30:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[outlet](
	[outletId] [int] IDENTITY(1,1) NOT NULL,
	[categoryId] [int] NULL,
	[city] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_outlet] PRIMARY KEY CLUSTERED 
(
	[outletId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reviews]    Script Date: 4/14/2019 4:30:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviews](
	[reviewId] [int] IDENTITY(1,1) NOT NULL,
	[modelId] [int] NULL,
	[reviews] [int] NOT NULL,
 CONSTRAINT [PK_reviews] PRIMARY KEY CLUSTERED 
(
	[reviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[model]  WITH CHECK ADD  CONSTRAINT [FK_model_category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[category] ([categoryId])
GO
ALTER TABLE [dbo].[model] CHECK CONSTRAINT [FK_model_category]
GO
ALTER TABLE [dbo].[news]  WITH CHECK ADD  CONSTRAINT [FK_news_model] FOREIGN KEY([modelId])
REFERENCES [dbo].[model] ([modelId])
GO
ALTER TABLE [dbo].[news] CHECK CONSTRAINT [FK_news_model]
GO
ALTER TABLE [dbo].[outlet]  WITH CHECK ADD  CONSTRAINT [FK_outlet_category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[category] ([categoryId])
GO
ALTER TABLE [dbo].[outlet] CHECK CONSTRAINT [FK_outlet_category]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [FK_reviews_model] FOREIGN KEY([modelId])
REFERENCES [dbo].[model] ([modelId])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [FK_reviews_model]
GO
USE [master]
GO
ALTER DATABASE [DB21] SET  READ_WRITE 
GO
