USE [master]
GO
/****** Object:  Database [Mia_Cosmetics]    Script Date: 7/11/2023 11:48:39 PM ******/
CREATE DATABASE [Mia_Cosmetics]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Mia_Cosmetics', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Mia_Cosmetics.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Mia_Cosmetics_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Mia_Cosmetics_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Mia_Cosmetics] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Mia_Cosmetics].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Mia_Cosmetics] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Mia_Cosmetics] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Mia_Cosmetics] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Mia_Cosmetics] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Mia_Cosmetics] SET ARITHABORT OFF 
GO
ALTER DATABASE [Mia_Cosmetics] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Mia_Cosmetics] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Mia_Cosmetics] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Mia_Cosmetics] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Mia_Cosmetics] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Mia_Cosmetics] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Mia_Cosmetics] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Mia_Cosmetics] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Mia_Cosmetics] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Mia_Cosmetics] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Mia_Cosmetics] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Mia_Cosmetics] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Mia_Cosmetics] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Mia_Cosmetics] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Mia_Cosmetics] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Mia_Cosmetics] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Mia_Cosmetics] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Mia_Cosmetics] SET RECOVERY FULL 
GO
ALTER DATABASE [Mia_Cosmetics] SET  MULTI_USER 
GO
ALTER DATABASE [Mia_Cosmetics] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Mia_Cosmetics] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Mia_Cosmetics] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Mia_Cosmetics] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Mia_Cosmetics] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Mia_Cosmetics] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Mia_Cosmetics', N'ON'
GO
ALTER DATABASE [Mia_Cosmetics] SET QUERY_STORE = OFF
GO
USE [Mia_Cosmetics]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 7/11/2023 11:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[brand_name] [nvarchar](150) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/11/2023 11:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](150) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/11/2023 11:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[name] [nvarchar](150) NULL,
	[phone] [varchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[order_date] [datetime] NULL,
	[total] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/11/2023 11:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[oder_id] [int] NULL,
	[product_model_id] [int] NULL,
	[quantity] [int] NULL,
	[detail_total] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/11/2023 11:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NULL,
	[description] [nvarchar](max) NULL,
	[brand_id] [int] NULL,
	[subcategory_id] [int] NULL,
	[thumbnail] [varchar](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductModel]    Script Date: 7/11/2023 11:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductModel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[variant] [nvarchar](150) NULL,
	[image] [varchar](max) NULL,
	[origin_price] [float] NULL,
	[sale_price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_ProductModel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 7/11/2023 11:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subcategory_name] [nvarchar](150) NULL,
	[category_id] [int] NULL,
	[image] [varchar](max) NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/11/2023 11:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NULL,
	[username] [varchar](150) NULL,
	[password] [varchar](150) NULL,
	[email] [nvarchar](250) NULL,
	[phone_number] [varchar](15) NULL,
	[avatar] [varchar](max) NULL,
	[is_admin] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([oder_id])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_ProductModel] FOREIGN KEY([product_model_id])
REFERENCES [dbo].[ProductModel] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_ProductModel]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brand] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubCategory] FOREIGN KEY([subcategory_id])
REFERENCES [dbo].[SubCategory] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SubCategory]
GO
ALTER TABLE [dbo].[ProductModel]  WITH CHECK ADD  CONSTRAINT [FK_ProductModel_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[ProductModel] CHECK CONSTRAINT [FK_ProductModel_Product]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
USE [master]
GO
ALTER DATABASE [Mia_Cosmetics] SET  READ_WRITE 
GO
