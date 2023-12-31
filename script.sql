USE [master]
GO
/****** Object:  Database [Mia_Cosmetics]    Script Date: 10/30/2023 4:44:42 PM ******/
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
/****** Object:  Table [dbo].[Brand]    Script Date: 10/30/2023 4:44:42 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 10/30/2023 4:44:42 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 10/30/2023 4:44:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[name] [nvarchar](250) NULL,
	[phone] [varchar](15) NULL,
	[address] [nvarchar](max) NULL,
	[order_date] [datetime] NULL,
	[status] [int] NULL,
	[total] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/30/2023 4:44:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_model_id] [int] NULL,
	[quantity] [int] NULL,
	[detail_total] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/30/2023 4:44:42 PM ******/
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
/****** Object:  Table [dbo].[ProductModel]    Script Date: 10/30/2023 4:44:42 PM ******/
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
/****** Object:  Table [dbo].[SubCategory]    Script Date: 10/30/2023 4:44:42 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 10/30/2023 4:44:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NULL,
	[username] [varchar](150) NULL,
	[password] [varchar](150) NULL,
	[email] [varchar](250) NULL,
	[phone_number] [varchar](15) NULL,
	[avatar] [varchar](max) NULL,
	[is_admin] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (1, N'Maybelline')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (2, N'Estée Lauder')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (3, N'MAC')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (4, N'L’ORÉAL')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (5, N'Espoir')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (6, N'Clio')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (7, N'Laneige')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (8, N'Lemonade')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (9, N'Missha')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (10, N'Gilla')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (11, N'Merzy')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (12, N'Romand')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (13, N'Black Rouge')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (14, N'The Saem')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (15, N'Nars')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (16, N'3CE')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (17, N'Tom Ford')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (18, N'Bbia')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (19, N'Silkygirl')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (20, N'Vacosi')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (21, N'Lilybyred')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (22, N'Innisfree')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (23, N'Eglips')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (24, N'Cocoon')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (25, N'Garnier')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (26, N'Senka')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (27, N'Skin1004')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (28, N'Lameila')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (29, N'Ipek')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (30, N'Cosrx')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (31, N'Cerave')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (32, N'Simple')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (33, N'Bioderma')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (34, N'SVR')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (35, N'Some By Mi')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (36, N'Cetaphil')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (37, N'Hada Labo')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (38, N'Kiehl''s')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (39, N'Klairs')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (40, N'Shiseido')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (41, N'Obagi')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (42, N'La Roche-Posay')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (43, N'Eucerin')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (44, N'Dr.G')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (45, N'Hatomugi')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (46, N'Vaseline')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (47, N'Bio Essence')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (48, N'Mediheal')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (49, N'Naruko')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (50, N'Vichy')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (51, N'Sunplay')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (52, N'Bioré')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (53, N'Lifebuoy')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (54, N'Hazeline')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (55, N'Dove')
INSERT [dbo].[Brand] ([id], [brand_name]) VALUES (56, N'Tresemmé')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [category_name]) VALUES (1, N'Trang điểm')
INSERT [dbo].[Category] ([id], [category_name]) VALUES (2, N'Chăm sóc da')
INSERT [dbo].[Category] ([id], [category_name]) VALUES (3, N'Chăm sóc cơ thể')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (1, 19, N'Nguyễn Thị Ngọc Mai', N'0378716727', N'hanoi', CAST(N'2023-07-16T21:04:34.090' AS DateTime), 3, 100)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (2, 12, N'Nguyễn Hồng Vân', N'0123456798', N'Ha Noi', CAST(N'2023-07-14T22:31:53.690' AS DateTime), 4, 589)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (3, 12, N'Nguyễn Hồng Vân', N'0123456798', N'Thạch Thất', CAST(N'2023-07-15T22:38:22.380' AS DateTime), 4, 1703)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (4, 12, N'Nguyễn Hồng Vân', N'0123456798', N'Ha Noi', CAST(N'2023-07-17T22:41:18.230' AS DateTime), 4, 1018)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (5, 12, N'Nguyễn Hồng Vân', N'0123456798', N'Huyện Hà Trung', CAST(N'2023-06-19T15:48:07.253' AS DateTime), 4, 195)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (7, 12, N'Nguyễn Hồng Vân', N'0123456798', N'Huyện Hà Trung', CAST(N'2023-05-11T16:11:25.703' AS DateTime), 3, 155)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (8, 3, N'Nguyễn Thị Hoa', N'0987123456', N'Huyện Hà Trung', CAST(N'2023-07-07T04:55:36.940' AS DateTime), 4, 355)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (9, 3, N'Nguyễn Thị Hoa', N'0987123456', N'Hưng Mỹ, Hưng Yên', CAST(N'2023-05-27T04:58:21.507' AS DateTime), 4, 874)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (10, 3, N'Nguyễn Thị Hoa', N'0987123456', N'Ý Yên, nam Định', CAST(N'2023-06-10T04:59:24.133' AS DateTime), 4, 1008)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (11, 22, N'Lại Khánh Trang', N'0123456789', N'Vĩnh Yên, Vĩnh Phúc', CAST(N'2023-06-11T05:01:44.220' AS DateTime), 4, 534)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (12, 22, N'Lại Khánh Trang', N'0123456789', N'Long Biên, Hà Nội', CAST(N'2023-04-18T05:06:46.313' AS DateTime), 4, 1109)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (13, 22, N'Lại Khánh Trang', N'0123456789', N'Vĩnh Yên, Vĩnh Phúc', CAST(N'2023-05-22T05:08:53.393' AS DateTime), 4, 245)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (14, 13, N'Nguyễn Thị Quỳnh', N'0123456789', N'Hưng Mỹ, Hưng Yên', CAST(N'2023-04-05T11:13:15.507' AS DateTime), 4, 1239)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (15, 13, N'Nguyễn Thị Quỳnh', N'0123456789', N'Đông Anh, Hà Nội', CAST(N'2023-05-20T11:22:09.487' AS DateTime), 4, 1542)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (16, 13, N'Nguyễn Thị Quỳnh', N'0123456789', N'Cầu Giấy, Hà Nội', CAST(N'2023-06-25T11:25:02.840' AS DateTime), 4, 845)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (17, 8, N'Lê Vân Khánh', N'0912345678', N'Gia Lâm, Hà Nội', CAST(N'2023-06-04T11:28:12.330' AS DateTime), 4, 1886)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (18, 19, N'Nguyễn Thị Ngọc Mai', N'0123456387', N'Vĩnh Yên, Vĩnh Phúc', CAST(N'2023-06-02T11:30:38.170' AS DateTime), 4, 1562)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (19, 19, N'Nguyễn Thị Ngọc Mai', N'0123456387', N'Thanh Xuân, Hà Nội', CAST(N'2023-07-12T11:34:38.117' AS DateTime), 4, 1060)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (20, 19, N'Nguyễn Thị Ngọc Mai', N'0123456387', N'Hà Đông, Hà Nội', CAST(N'2023-06-19T11:36:32.817' AS DateTime), 4, 424)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (21, 19, N'Nguyễn Thị Ngọc Mai', N'0123456387', N'Hoàn Kiếm, Hà Nội', CAST(N'2023-05-26T11:38:10.000' AS DateTime), 4, 390)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (22, 9, N'Phạm Thị Thủy', N'0987654321', N'Hoằng Hóa, Thanh Hóa', CAST(N'2023-05-09T11:39:36.290' AS DateTime), 4, 429)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (23, 9, N'Phạm Thị Thủy', N'0987654321', N'Hoa Lư, Ninh Bình', CAST(N'2023-06-23T11:40:33.707' AS DateTime), 4, 1108)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (24, 9, N'Phạm Thị Thủy', N'0987654321', N'Từ Hải, Thái Bình', CAST(N'2023-07-10T11:41:31.987' AS DateTime), 4, 1110)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (25, 10, N'Trần Thị Hồng', N'0912345678', N'Thành phố Vinh, Nghệ An', CAST(N'2023-07-01T11:42:52.203' AS DateTime), 4, 999)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (26, 10, N'Trần Thị Hồng', N'0912345678', N'Thành phố Vinh, Nghệ An', CAST(N'2023-06-14T11:43:16.920' AS DateTime), 4, 805)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (27, 10, N'Trần Thị Hồng', N'0912345678', N'Thành phố Vinh, Nghệ An', CAST(N'2023-05-13T11:43:51.637' AS DateTime), 4, 768)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (28, 6, N'Phạm Thị Ánh', N'0987654321', N'Hạ Long, Quảng Ninh', CAST(N'2023-07-08T11:45:57.033' AS DateTime), 4, 798)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (29, 6, N'Phạm Thị Ánh', N'0987654321', N'Hạ Long, Quảng Ninh', CAST(N'2023-07-03T11:46:26.590' AS DateTime), 4, 400)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (30, 6, N'Phạm Thị Ánh', N'0987654321', N'Hạ Long, Quảng Ninh', CAST(N'2023-06-18T11:46:48.027' AS DateTime), 4, 288)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (31, 2, N'Trần Thị Bình', N'0987654321', N'Thanh Xuân, Hà Nội', CAST(N'2023-06-21T11:47:59.293' AS DateTime), 4, 294)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (32, 2, N'Trần Thị Bình', N'0987654321', N'Thanh Xuân, Hà Nội', CAST(N'2023-05-05T11:48:35.550' AS DateTime), 4, 549)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (33, 12, N'Nguyễn Hồng Vân', N'0123456798', N'Hà Nội', CAST(N'2023-02-17T17:55:17.393' AS DateTime), 2, 190)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (34, 4, N'Vũ Thị Mai', N'0987654321', N'Hà Tĩnh', CAST(N'2023-03-17T18:09:26.463' AS DateTime), 1, 155)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (35, 12, N'Nguyễn Hồng Vân', N'0123456798', N'Huyện Hà Trung', CAST(N'2023-07-17T18:58:33.377' AS DateTime), 4, 195)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (36, 27, N'Mai Thị Hoa', N'0123456789', N'Huyện Hà Trung', CAST(N'2023-07-05T14:47:59.197' AS DateTime), 4, 369)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (37, 27, N'Mai Thị Hoa', N'0123456789', N'Huyện Hà Trung', CAST(N'2022-12-19T14:55:25.547' AS DateTime), 4, 300)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (38, 27, N'Mai Thị Hoa', N'0123456789', N'Huyện Hà Trung', CAST(N'2023-07-06T15:02:04.090' AS DateTime), 4, 640)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (39, 27, N'Mai Thị Hoa', N'0123456789', N'Huyện Hà Trung', CAST(N'2023-07-19T15:02:42.313' AS DateTime), 4, 435)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (40, 27, N'Mai Thị Hoa', N'0123456789', N'Huyện Hà Trung', CAST(N'2023-07-19T15:03:04.540' AS DateTime), 4, 406)
INSERT [dbo].[Order] ([id], [user_id], [name], [phone], [address], [order_date], [status], [total]) VALUES (41, 12, N'Nguyễn Hồng Vân', N'0123456798', N'Huyện Hà Trung', CAST(N'2023-07-19T15:40:37.807' AS DateTime), 1, 520)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (1, 1, 3, 4, 100)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (2, 2, 25, 1, 330)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (3, 2, 87, 1, 229)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (4, 3, 24, 1, 370)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (5, 3, 30, 3, 507)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (6, 3, 119, 2, 796)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (7, 4, 36, 1, 340)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (8, 4, 96, 1, 399)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (9, 4, 136, 1, 249)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (10, 5, 35, 1, 165)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (11, 7, 130, 1, 125)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (12, 8, 8, 1, 160)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (13, 8, 35, 1, 165)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (14, 9, 106, 1, 339)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (15, 9, 107, 1, 260)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (16, 9, 111, 1, 245)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (17, 10, 70, 1, 155)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (18, 10, 72, 2, 458)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (19, 10, 73, 1, 365)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (20, 11, 58, 1, 159)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (21, 11, 67, 1, 95)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (22, 11, 125, 1, 250)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (23, 12, 78, 1, 430)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (24, 12, 83, 1, 360)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (25, 12, 112, 1, 289)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (26, 13, 31, 1, 95)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (27, 13, 94, 1, 120)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (28, 14, 45, 1, 349)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (29, 14, 103, 2, 430)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (30, 14, 130, 1, 125)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (31, 14, 132, 1, 305)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (32, 15, 105, 1, 255)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (33, 15, 121, 2, 760)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (34, 15, 124, 1, 299)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (35, 15, 128, 2, 198)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (36, 16, 26, 1, 400)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (37, 16, 86, 1, 415)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (38, 17, 24, 2, 740)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (39, 17, 30, 2, 338)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (40, 17, 119, 1, 398)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (41, 17, 121, 1, 380)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (42, 18, 5, 1, 215)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (43, 18, 60, 1, 320)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (44, 18, 96, 1, 399)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (45, 18, 102, 1, 399)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (46, 18, 135, 1, 199)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (47, 19, 61, 2, 270)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (48, 19, 62, 1, 760)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (49, 20, 35, 1, 165)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (50, 20, 87, 1, 229)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (51, 21, 13, 2, 360)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (52, 22, 9, 1, 160)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (53, 22, 69, 1, 239)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (54, 23, 36, 2, 680)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (55, 23, 135, 2, 398)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (56, 24, 60, 1, 320)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (57, 24, 62, 1, 760)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (58, 25, 24, 2, 740)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (59, 25, 72, 1, 229)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (60, 26, 10, 1, 185)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (61, 26, 38, 1, 590)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (62, 27, 36, 1, 340)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (63, 27, 119, 1, 398)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (64, 28, 122, 1, 289)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (65, 28, 123, 1, 229)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (66, 28, 125, 1, 250)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (67, 29, 24, 1, 370)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (68, 30, 17, 1, 258)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (69, 31, 30, 1, 169)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (70, 31, 31, 1, 95)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (71, 32, 44, 1, 270)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (72, 32, 136, 1, 249)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (73, 33, 8, 1, 160)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (74, 34, 130, 1, 125)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (75, 35, 35, 1, 165)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (76, 36, 139, 1, 339)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (77, 37, 44, 1, 270)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (78, 38, 132, 2, 610)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (79, 39, 138, 3, 405)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (80, 40, 127, 2, 376)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (81, 41, 11, 1, 160)
INSERT [dbo].[OrderDetail] ([id], [order_id], [product_model_id], [quantity], [detail_total]) VALUES (82, 41, 35, 2, 330)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (1, N'Kem Nền Maybelline Fit Me Matte And Poreless Đầu Pump', N'Kem Nền Kiềm Dầu, Cho Lớp Nền Mịn Lì Tự Nhiên Maybelline Fit Me Matte Poreless Foundation là kem nền đến từ thương hiệu Maybelline với khả năng kiềm dầu hiệu quả, cùng với độ che phủ hoàn hảo cho lớp nền luôn được mịn lì tự nhiên, bền màu lâu trôi suốt cả ngày dài.', 1, 1, N'https://product.hstatic.net/1000006063/product/123_3c5336837e7e4b1eb51818818c3346fd_1024x1024.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (2, N'Kem Nền Maybelline Superstay Full Coverage', N'Kem Nền Che Phủ Hoàn Hảo, Bền Màu Lâu Trôi Maybelline Super Stay 24H Full Coverage Foundation là kem nền của thương hiệu Maybelline. Kem nền với hạt phấn mịn lì trên da cho lớp nền mịn màng, lâu trôi, che khuyết điểm suốt cả ngày cùng tông màu tiệp da tự nhiên phù hợp với làn da châu Á, cho lớp nền hoàn hảo năng động suốt cả ngày.', 1, 1, N'https://product.hstatic.net/1000006063/product/63_2bf6501193384386a18e5afaa15d19c3_1024x1024.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (3, N'Kem Nền Estee Lauder Lâu Trôi 1W2 Sand 30ml', N'Kem Nền Estee Lauder Double Wear Stay in Place SPF10 30ml 

“Double Wear” sẽ che phủ khuyết điểm của bạn từ mụn, nám, quầng thâm chỉ với một lớp nền nhưng đem lại cảm giác nhẹ tênh trên da
“Stay-in-Place” với khả năng giữ lớp nền lâu trôi, không bị lem hay dính khi chạm vào', 2, 1, N'https://mint07.com/wp-content/uploads/2019/01/kem-nen-estee-lauder-double-wear-stay-in-place-spf10-30ml.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (4, N'Kem Nền Mac Studio Fix Fluid Spf15 30ml', N'Nếu các Nàng hay trang điểm, thông thường những phấn nền dạng lỏng thường có lớp phấn dày, trang điểm không tự nhiên, gây bí da…gạt bỏ qua những nổi lo của phái đẹp về trang điểm, kem nền Mac Studio Fix Fluid là một sự lựa chọn hoàn toàn đáng tin tưởng trong việc làm đẹp của phái đẹp. Đây là sản phẩm kem nền lâu đời và bán chạy nhất của Mac.', 3, 1, N'https://mint07.com/wp-content/uploads/2018/09/kem-nen-mac-studio-fix-fluid-spf156.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (5, N'Kem Nền L’Oreal Infallible 24H Fresh Wear', N'Kem nền L''Oreal Infallible 24H Fresh Wear Foundation là kem nền đến từ thương hiệu L''Oreal với công nghệ Oxygen Techology đột phá mới giúp lớp nền thoáng mịn, lâu trôi suốt 24H, đồng thời mang đến độ che phủ hoàn hảo. Công thức chống thấm nước, không lem không trôi, thoáng mịn tự nhiên để bạn thoải mái năng động, thách thức cả ngày dài.', 4, 1, N'https://mint07.com/wp-content/uploads/2019/04/kem-nen-loreal-infallible-24h-fresh-wear.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (6, N'Kem Nền L’Oreal True Match Super – Blendable Foundation ', N'Kem Nền L’Oreal True Match Super – Blendable Foundation SPF16/ PA++ là phiên bản cải tiến với công thức dưỡng ẩm vượt trội chứa Hyaluronic Acid & Glycerin cùng Vitamin E, Collagen và Pro-Vitamin B5, kết hợp cùng thành phần Khoáng Kaolin giúp kiểm soát bóng nhờn, cho da mịn và đẹp hơn.

Ngoài ra, sản phẩm còn sử dụng công nghệ Micro-Matching cùng các hạt phấn dạng lỏng siêu mịn giúp tệp màu da tự nhiên, đem lại lớp finish mỏng mịn lì, che phủ tự nhiên như không trang điểm.', 4, 1, N'https://product.hstatic.net/1000006063/product/51.4_4057c19208e9481fb572bc67992af94b_1024x1024.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (8, N'Kem Nền Clio Kill Cover Glow Foundation SPF50 PA++++ 38G', N'Kem Nền Clio Kill Cover Glow Foundation SPF50 PA++++ 38G (Tặng Kèm Cọ) là sản phẩm kem nền hot hit đến từ thương hiệu Clio với khả năng che phủ đỉnh cao cùng khả năng dưỡng ẩm cho da luôn căng mướt rạng rỡ suốt ngày dài. Đặc biệt, sản phẩm lại có chất kem lỏng cho lớp nền mỏng nhẹ tự nhiên hơn.', 6, 1, N'https://mint07.com/wp-content/uploads/2023/04/kem-nen-clio-kill-cover-glow-foundation.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (9, N'Cushion Clio Kill Cover The New Founwear SPF50', N'Cushion Clio Kill Cover The New Founwear SPF50 là phiên bản nâng cấp với diện mạo hoàn toàn mới. Thiết kế dạng hộp vuông vắn độc đáo phá cách, cùng mút dạng vát độc lạ giúp dễ dàng che phủ các vùng hẹp và mỏng manh như vùng khoé mũi và mắt. Sản phẩm vẫn giữ được khả năng che phủ đỉnh cao của dòng “Founwear” nhưng tạo cảm giác mỏng nhẹ, tự nhiên hơn. Chất cushion thì mịn mướt, mang đến lớp finish semi – matte cho lớp nền mịn lì trong suốt, bền màu và lâu trôi trên da.', 6, 2, N'https://mint07.com/wp-content/uploads/2022/11/cushionclio-kill-cover-the-new-founwear-spf50.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (10, N'Cushion Clio Kill Cover Fixer SPF50 PA+++', N'Cushion Clio Kill Cover Fixer SPF50 PA+++ là phiên bản độc đáo vẫn thừa hưởng khả năng che phủ đỉnh cao và cho lớp nền mịn lì, nhưng cải tiến thêm khả năng cố định lớp nền trang điểm trong nhiều giờ, giúp bền màu và không gây lem hay dây vào khẩu trang. Sản phẩm chứa công thức hạt phấn oil cutting power cùng các thành phần chiết xuất từ thiên nhiên như: Phức hợp từ lá trà xanh + bạc hà + cọ xạ hương giúp tăng khả năng hấp thụ và kiểm soát dầu thừa, cho lớp nền khô thoáng và mịn màng tự nhiên. Ngoài ra còn chứa chỉ số chống nắng SPF 50+ PA+++ giúp bảo vệ da và ngăn chặn các tác hại của tia UV cho lớp nền mịn mướt tự nhiên trong nhiều giờ.', 6, 2, N'https://mint07.com/wp-content/uploads/2023/01/cushion-clio-kill-cover-fixer-spf50-pa7.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (11, N'Phấn Nước Espoir Pro Tailor Be Glow Cushion SPF42 PA++', N'Phấn Nước Espoir Pro Tailor Be Glow Cushion SPF42 PA++ là dòng cushion có kết cấu mỏng nhẹ, tệp nhanh vào da cùng khả năng bám màu và che phủ tốt cho lớp nền mịn màng và finsish căng bóng tự nhiên. Ngoài ra, sản phẩm còn có khả năng kiềm dầu tốt lên đến 8 tiếng, tích hợp cùng công thức làm mát da, giữ ẩm giúp da luôn khô thoáng, mịn màng suốt ngày dài.', 5, 2, N'https://mint07.com/wp-content/uploads/2023/02/phan-nuocespoirpro-tailor-be-glow-cushion-spf42-pa.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (12, N'Phấn Nước Espoir Pro Tailor Be Velvet Cover Cushion SPF34', N'Phấn Nước Espoir Pro Tailor Be Velvet Cover Cushion SPF34 là siêu phẩm hot hit đầu năm 2022 với thiết kế vô cùng sang chảnh, cùng chất phấn mềm mỏng như nhung giúp mang lại lớp nền căng bóng mịn màng tự nhiên. Sản phẩm đã được chứng nhận thuần chay vô cùng lành tính cho da nhạy cảm', 5, 2, N'https://mint07.com/wp-content/uploads/2022/10/phan-nuoc-espoir-pro-tailor-be-velvet-cover-cushion-spf34-8.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (13, N'Phấn Nước Romand NU Zero Cushion SPF 24 PA++', N'Phấn Nước Romand NU Zero Cushion SPF 24 PA++ là sản phẩm phấn nước có chất cushion mỏng nhẹ, tự nhiên nhưng vẫn có khả năng che phủ cao, cùng khả năng kiềm dầu hiệu quả và khả năng bám màu tốt, bền màu, lâu trôi mang lại lớp nền trang điểm nhẹ nhàng tự nhiên cho bạn rạng rỡ, tự tin suốt ngày dài.', 12, 2, N'https://mint07.com/wp-content/uploads/2023/04/phan-nuoc-romand-nu-zero-cushion-spf-24-pa-4.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (15, N'Che Khuyết Điểm Lemonade Matte Addict Concealer', N'Che Khuyết Điểm Lemonade Matte Addict Concealer là dòng kem che khuyết điểm đến từ thương hiệu Lemonade có khả năng che phủ tốt, kiềm dầu và bền màu đỉnh cao cùng chất kem mỏng nhẹ cho lớp nền mịn lì hoàn hảo. Đặc biệt, sản phẩm có chiết xuất hoa cúc La Mã có tác dụng trong việc kháng viêm và làm dịu cho da mụn vì thế da dầu mụn nhạy cảm có thể yên tâm sử dụng nha.', 8, 3, N'https://mint07.com/wp-content/uploads/2022/11/che-khuyet-diem-lemonade-matte-addict-concealer-2.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (16, N'Che Khuyết Điểm The Saem Cover Perfection Tip Concealer', N'Che Khuyết Điểm The Saem Cover Perfection Tip Concealer chất kem khá đặc nên chỉ cần chấm nhẹ thôi là đã che được rất nhiều, hầu như không xuống tone. Hiệu ứng trên da tự nhiên, không bị nặng mặt. Khả năng che phủ cao, có SPF28/PA++ bảo vệ da.', 14, 3, N'https://mint07.com/wp-content/uploads/2019/11/kem-che-khuyet-diem-the-saem-cover-perfection-tip-concealer1.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (17, N'Che Khuyết Điểm Mac Smooth Wear Concealer', N'Chất kem của Che Khuyết Điểm Mac Smooth Wear Concealer không quá lỏng mà cũng chẳng dày, đủ để mượt mà tán thành nhiều lớp đến khi đạt được độ che phủ ưng ý. Chỉ cần 1 lớp mỏng là đã đủ che hết cả quầng thâm mắt lẫn thâm mụn. Finish glowly căng khỏe, nhiên, lại bền màu được cả ngày.', 3, 3, N'https://mint07.com/wp-content/uploads/2019/01/che-khuyet-diem-mac-smooth-wear-concealer4.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (18, N'Che Khuyết Điểm Maybelline Fit Me Concealer', N'Che Khuyết Điểm Maybelline Fit Me kết cấu dạng lỏng, nhiểu tông màu. Độ che phủ khá cao nhưng chất kem lại vô cùng mỏng mịn. Dễ dàng tán đều và bám vào da, che giấu tất cả những khuyết điểm khiến bạn không hài lòng trên gương mặt.', 1, 3, N'https://mint07.com/wp-content/uploads/2018/12/che-khuyet-diem-maybelline-fit-me1.jpeg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (19, N'Che Khuyết Điểm Maybeline Instant Age Rewind Treatment', N'Che Khuyết Điểm Maybeline Instant Age Rewind Treatment Concealer giúp che giấu các khuyết điểm quầng thâm và bọng mắt một cách hoàn hảo. Đồng thời, các vết mụn, vết thâm cũng được khéo léo che đậy không bị dầy cộp mà rất tự nhiên.', 1, 3, N'https://mint07.com/wp-content/uploads/2018/11/kem-che-khuyet-diem-maybelline-age-rewind-eraser-dark-circles-concealer.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (20, N'Son Kem Black Rouge Air Fit Velvet Tint Ver 9 Acoustic Mood', N'Son Kem Black Rouge Air Fit Velvet Tint Ver 9 Acoustic Mood là BST mới nhất đến từ nhà Black Rouge được lấy cảm hứng từ sự mới mẻ của bài hát được cover lại bằng đàn ghi ta. Son được thiết kế vỏ mờ lì và mịn như nhung, kết hợp cùng thân son được in logo màu đen tạo nên sự sang trọng, quý phái. Chất son kem lì mềm mịn chứa nhiều dưỡng chất cho đôi môi mềm mướt, chuẩn màu lại có độ bền màu cao.', 13, 4, N'https://mint07.com/wp-content/uploads/2022/12/son-kem-black-rouge-air-fit-velvet-tint-ver9-acoustic-mood-3.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (21, N'Son Kem Lì Cực Mịn Romand Zero Velvet Tint', N'Son Kem Romand Zero Velvet Tint là son kem lì mịn như nhung. Son khá bền màu dành cho những cô nàng yêu thích son kem lì nhẹ môi. Đây là dòng son đã làm nên tiếng tăm của hãng Romand.', 12, 4, N'https://mint07.com/wp-content/uploads/2020/03/son-kem-romand-zero-velvet-tint.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (22, N'Son Thỏi Merzy Academia Cotton Lipstick 1.8g', N'Son Thỏi Merzy Academia Cotton Lipstick 1.8g thuộc BST Academia Collection đến từ thương hiệu Merzy có thiết kế vỏ son độc đáo với tone màu vintage bắt mắt kết hợp cùng kết cấu high-soft và chất son nhẹ, mềm mịn và cực kì dễ tán, tạo hiệu ứng đôi môi sương mờ. Công thức Pigment’s Authentic Coloration giúp chất son bền màu vượt trội, giữ màu son rạng rỡ suốt ngày dài.', 11, 4, N'https://mint07.com/wp-content/uploads/2022/11/son-thoi-merzy-academia-cotton-lipstick-18g-2.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (24, N'Son Kem Lì BBIA Last Velvet Lip Tint Version 5', N'Son Kem BBIA Last Velvet Lip Tint là dòng son kem lì mịn và nhẹ môi. Chất son kem mềm nhẹ, lướt trên môi mềm mịn, mướt mượt, không gây khô, chẳng cần tới son dưỡng phù hợp với đôi môi khô. Bbia Last Velvet Lip Tint là một trong những dòng son hot nhất của hãng.', 18, 4, N'https://mint07.com/wp-content/uploads/2020/07/son-kem-bbia-last-velvet-lip-tint.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (25, N'Son Kem Lì MAC Locked Kiss Ink 4ml', N'Son Kem Lì MAC Locked Kiss Ink 4ml là tân binh nhà MAC được thiết kế mới lạ với nắp kim loại sáng bóng sang trọng cùng thân son trong suốt giúp dễ dàng quan sát rõ màu sắc bên trong. Sử dụng công nghệ “khoá màu” độc quyền giữ màu đỉnh cao, bền màu, lâu trôi lên đến 24h, có khả năng chống thấm nước, không sợ lem trôi khi uống nước hay đi mưa.', 3, 4, N'https://mint07.com/wp-content/uploads/2023/06/son-kem-li-mac-locked-kiss-ink-4ml-3.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (27, N'Son Kem Black Rouge Air Fit Velvet Tint Ver 7 Velvet Crown', N'Son Kem Black Rouge Air Fit Velvet Tint Ver 7 Velvet Crown kết cấu đặc biệt từ chất son kem xốp mềm, chuyển sang finish lì mịn mà sắc son vẫn được tái hiện nguyên vẹn trên môi, chẳng hề sai lệch dù nền môi bạn có khô hay bợt màu. Với 5 gam màu, đa sắc đỏ quyền lực, visual của nàng sẽ được nâng cấp từ “nàng thơ” thành “nữ hoàng” trong tích tắc.', 13, 4, N'https://mint07.com/wp-content/uploads/2020/11/son-kem-black-rouge-air-fit-velvet-tint-ver-7-velvet-crown.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (28, N'Son thỏi Tom Ford Lip Color Satin Matte', N'Son Thỏi Tom Ford Lip Color Matte với thiết kế sang trọng, quý phái cùng chất son mịn lì và khả năng bám màu tốt, lên màu siêu chuẩn, hứa hẹn đốn tim phái đẹp trong tích tắc.', 17, 4, N'https://mint07.com/wp-content/uploads/2022/09/son-thoi-tom-ford-lip-color-24-firebrand.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (29, N'Son Kem Maybelline Superstay Vinyl Ink 4.2ml', N'Son Kem Maybelline Superstay Vinyl Ink 4.2ml là siêu phẩm mới nhất đến từ thương hiệu Maybeline với sự đột phá về công nghệ “khoá” màu giúp bền màu, lâu trôi, không gây lem trôi suốt ngày dài. Chất son bóng nhẹ mềm mượt và ẩm mịn cho môi luôn căng bóng, rạng rỡ. Bảng màu ấn tượng, đa dạng phong cách cho các nàng tha hồ lựa chọn.', 1, 4, N'https://mint07.com/wp-content/uploads/2023/03/son-kem-maybeline-superstay-vinyl-ink-42ml-4.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (30, N'Son Kem Merzy The First Velvet Tint Season 3', N'Chất son kem Merzy lần này không còn lỏng như nước như ở season 1 nữa, season 3 thiên về dạng xốp đặc hơn. Son rất dễ tán trên môi, không bị bột, không vón cục và lướt rất êm. Sau khoảng vài giây son sẽ set vào môi và tạo finish mờ lì nhưng vẫn giữ được độ dưỡng.

Vỏ son kem Merzy The First Velvet Tint Season 3 mang lại thiết kế ấm áp, tông cam ombre với thiết kế son dáng vuông cầm đầm tay, Merzy The First Velvet Tint mang lại cảm giác sang chảnh khi sở hữu', 11, 4, N'https://mint07.com/wp-content/uploads/2020/12/son-kem-merzy-the-first-velvet-tint-v.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (31, N'Phấn Mắt Espoir Real Eye Palette 7 Ô', N'Phấn Mắt Espoir Real Eye Palette 7 Ô là sự kết hợp giữa các chất phấn khác nhau gồm glitter, shimmer, matte và satin giúp dễ dàng tạo bọng mắt hoặc mở góc mắt. Sản phẩm có hạt phấn siêu mịn bám tốt trên từng đường cọ, dễ dàng tán đều lên mắt cùng bảng màu đa dạng dễ dùng, dễ phối cho nhiều phong cách makeup khác nhau.', 5, 5, N'https://mint07.com/wp-content/uploads/2023/03/phan-mat-espoir-real-eye-palette-1-1.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (33, N'Bảng Mắt Romand 10 Ô Better Than Eye Palette', N'Bảng Mắt Romand 10 Ô Better Than Eye Palette là sự kết hợp màu sắc độc đáo với 5 mức độ màu sắc khác nhau giúp tạo điểm nhấn cho đôi mắt có chiều sâu hơn. Đặc biệt, các ô nhũ với những hạt nhũ có kích thước khác nhau, tạo điểm nhấn bắt sáng cho đôi mắt thêm tỏa sáng lung linh hơn.', 12, 5, N'https://mint07.com/wp-content/uploads/2023/04/bang-mat-romand-10-o-better-than-eye-palette-5.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (34, N'Bảng Mắt Black Rouge Colordation Mood Palette 9 Ô', N'Bảng Mắt Black Rouge Colordation Mood Palette 9 Ô là bảng mắt hot hit mới nhất của nhà Black Rouge. Với 9 ô màu đủ các cấp độ và phân cấp rõ ràng: 3 cấp Light – Point – Deep cho nàng thỏa sức sáng tạo phong cách makeup. Màu sắc trendy trẻ trung đầy lôi cuốn.', 13, 5, N'https://mint07.com/wp-content/uploads/2022/09/bang-mat-black-rouge-colordation-mood-palette-9-o-11.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (35, N'Bảng Mắt Lemonade Asthetic Eyeshadow Palette 16 Ô', N'Bảng Mắt Lemonade Asthetic Eyeshadow Palette 16 Ô được lấy cảm hứng từ những màu sắc cơ bản trong mỹ thuật nhưng khi hòa phối lại có thể tạo nên những tác phẩm nghệ thuật kinh điển. Aesthetic của Lemonade là một trong những góc nhìn nghệ thuật mà ở đó có những gợi ý màu sắc phù hợp cho con gái Việt Nam chúng mình ngày càng tiến xa trên hành trình làm đẹp và trang điểm.', 8, 5, N'https://mint07.com/wp-content/uploads/2022/07/bang-mat-lemonade-aesthetic-eyeshadow-e1657708185318.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (36, N'Bảng Mắt 4 Ô 3CE Mini Multi Eye Color Palette 3.2g', N'Bảng Mắt 4 Ô 3CE Mini Multi Eye Color Palette 3.2g là bảng mắt phiên bản mini bao gồm 4 ô màu với kích thước nhỏ gọn tiện dụng, dễ dàng cho vào túi xách để đi lại. Mỗi bảng màu là một tông màu khác nhau phù hợp với mọi tông da, dễ kết hợp với nhau nên không gặp tình trạng không biết mix match như các bảng nhiều ô. Chất phấn mềm mịn, độ lên màu tương đối, không bị rơi lả tả. Với kích thước nhỏ gọn, bạn có thể dễ dàng sử dụng, cho vào túi xách mang theo mỗi ngày.', 16, 5, N'https://mint07.com/wp-content/uploads/2022/01/bang-mat-3ce-4-o-6.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (37, N'Mascara Maybelline The Hyper Curl Volum Express Waterproof', N'Mascara Maybelline The Hyper Curl Volum Express Waterproof phù hợp với hàng mi mỏng, thưa, ngắn, giúp làm dày, cong mi. Đầu cọ được thiết kế dễ dàng chải tận gốc sợi mi, giúp mascara bao phủ làn mi hiệu quả. Dạng gel nhẹ, mượt, giữ mi CONG SUỐT 18H và làm DÀY GẤP 3 LẦN, KHÔNG VÓN CỤC. Hoàn toàn CHỐNG THẤM NƯỚC, không lem.', 1, 6, N'https://mint07.com/wp-content/uploads/2019/06/mascara-maybelline-the-hyper-curl-volum-express-waterproof3.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (38, N'Mascara Lemonade SuperNatural Lengthening', N'Mascara Lemonade SuperNatural Lengthening là dòng chuốt mi cong dài tự nhiên đến từ nhà Lemonade mới được ra mắt cuối năm 2020. Đây sẽ là siêu phẩm đắc lực cho những cô nàng mi thưa và dài.', 8, 6, N'https://mint07.com/wp-content/uploads/2021/04/mascara-lemonade-super-natural-lengthening.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (39, N'Mascara Maybelline The Colossal Volume Express Waterproof', N'Maybelline The Colossal Volume Express Waterproof – mascara với công thức làm dầy mi gấp 7 lần, ngay lập tức mang đến hàng mi “không khoảng trống” ở mọi góc nhìn, cho đôi mắt có chiều sâu và quyến rũ hơn rất nhiều. Được bổ sung Collagen để tăng cường dưỡng chất nuôi dưỡng cho hàng mi tránh tình trạng bị khô, gãy rụng, mascara Maybelline The Colossal cho bạn hàng mi dầy đến mức “maximum” mà không cần đeo mi giả trong khi mi vẫn rất mềm, nhẹ, không nặng nề hay vón cục một chút nào.', 1, 6, N'https://mint07.com/wp-content/uploads/2015/11/maybelline-the-colossal-waterproof-mascara-92ml.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (40, N'Mascara Vacosi 2 Đầu Dài Và Cong Mi Natural Lash Domination', N'Mascara Vacosi 2 Đầu Dài Và Cong Mi Natural Lash Domination 10g – VM09 là sản phẩm mascara có thiết kế 2 đầu độc đáo và cải tiến giúp làm dài, dày và cong mi nhanh chóng hiệu quả cho đôi mắt to tròn và thu hút hơn. Đặc biệt sản phẩm không gây vón cục, không lem, không trôi trong nhiều giờ.', 20, 6, N'https://mint07.com/wp-content/uploads/2022/12/mascara-vacosi-2-dau-dai-va-cong-mi-natural-lash-domination-10g-vm09-3.webp')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (41, N'Mascara Lilybyred Am9 To Pm9 Survival Colorcara', N'Mascara Lilybyred Am9 To Pm9 Survival Colorcara giữ nếp mi cong cả ngày, cũng không bị lem trôi kém sang bất chấp cả mí dầu. Đầu cọ không bị to nên chuốt mi trên mi dưới đều đẹp, chuốt 1 2 lần có ngay hiệu ứng mi tơi sương sương nhẹ nhàng, chuốt thêm nữa có ngay style mi cong dày dậm lồng lộn sang chảnh.', 21, 6, N'https://mint07.com/wp-content/uploads/2020/04/mascara-lilybyred-am9-to-pm9-survival-colorcara2.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (42, N'Kẻ Mắt Nước Lemonade SuperNatural Eyeliner', N'Kẻ Mắt Nước Lemonade SuperNatural Eyeliner là bút kẻ mắt có thiết kế như một cây bút máy, kết cấu có hệ thống bình mực trải dài giữa thân bút, để mực luôn được phân phối đều cho đầu bút không bao giờ bị khô. Đầu bút được thiết kế khác lạ với những bút kẻ mắt thông thường chính là đầu bút dạng mũ lưỡi trai đôi, để mực ra đều và không khô đầu bút.', 8, 7, N'https://mint07.com/wp-content/uploads/2021/04/ke-mat-nuoc-lemonade-super-natural-eyeliner.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (43, N'Kẻ Mắt Nước Merzy Another Me The First Pen Eyeliner', N'Kẻ Mắt Nước Merzy Another Me The First Pen Eyeliner này không lem, không trôi, không thấm nước đến 24H. Đặc biệt đầu cọ siêu mảnh giúp đường kẻ được tự nhiên và sắc nét hơn. Mint có đủ 3 màu đa dạng dễ dùng.', 11, 7, N'https://mint07.com/wp-content/uploads/2020/05/ke-mat-nuoc-merzy-another-me-the-first-pen-eyeliner-1.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (44, N'Chì Kẻ Mắt Clio Sharp So Simple Waterproof Pencil Liner', N'Chì Kẻ Mắt Clio Sharp So Simple Waterproof Pencil Liner là sản phẩm kẻ mắt hoàn hảo giúp cho đôi mắt thêm quyến rũ và có chiều sâu hơn. Với thiết dạng đầu chì nhỏ gọn siêu mảnh chỉ 2mm giúp dễ dàng tạo ra các đường kẻ mắt sắc nét và thanh mảnh. Đặc biệt sản phẩm có khả năng chống thấm nước, chống lem cực đỉnh giúp bạn luôn tự tin suốt ngày dài.', 6, 7, N'https://mint07.com/wp-content/uploads/2023/02/chi-ke-mat-clio-sharp-so-simple-waterproof-pencil-liner-7.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (45, N'Bút Kẻ Mắt Nước Vacosi 24H Waterproof Pen', N'Bút Kẻ Mắt Nước Vacosi 24H Waterproof Pen là sản phẩm kẻ mắt nước siêu mảnh chỉ 0.05mm thuộc thương hiệu Vacosi với thiết kế bao bì màu rose gold sang trọng cùng chất mực đen bóng và khả năng chống lem, chống trôi siêu định tạo nên sức hút cho đôi mắt thêm ấn tượng và quyến rũ hơn suốt ngày dài.', 20, 7, N'https://mint07.com/wp-content/uploads/2022/11/but-ke-mat-nuoc-vacosi-24h-waterproof-pen-6.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (46, N'Kẻ Mắt Black Rouge Power Proof Pen Liner', N'Kẻ Mắt Black Rouge Power Proof Pen Liner là phiên bản kẻ mắt nước nâng cấp hoàn hảo với diện mạo mới toanh và chất lượng cải tiến vượt trội. Thiết kế bên ngoài màu Rose Brown óng ánh nhẹ nhàng, thanh lịch, toát lên vẻ sang trọng, hiện đại. Cùng đầu cọ cải tiến với lông cọ mỏng và mảnh, giúp nét vẽ mềm mại, uyển chuyển, đặc biệt không gây cay mắt. Chỉ với vài đường nét sắc sảo và mỏng nhẹ, đôi mắt của bạn sẽ toát lên thần thái sang chảnh, thanh lịch và thời trang vô cùng thu hút!', 13, 7, N'https://mint07.com/wp-content/uploads/2022/09/ke-mat-black-rouge-power-proof-pen-liner-5.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (47, N'Phấn Phủ 3CE Dạng Bột Blur Filter Powder 7g', N'Phấn Phủ 3CE Dạng Bột Blur Filter Powder 7g với thiết kế độc đáo chia làm 2 ngăn màu riêng biệt tiện dụng giúp giữ và cố định lớp nền mỏng mịn tự nhiên. Kết cấu sản phẩm dạng phấn bột có màu giúp cân bằng sắc tố cho da, kiềm dầu và che phủ tốt hơn.', 16, 8, N'https://mint07.com/wp-content/uploads/2022/10/phan-phu-3ce-dang-bot-blur-filter-powder-7g-4.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (48, N'Phấn Phủ Dạng Bột Innisfree No Sebum Moisture Powder 5G', N'Phấn Phủ Dạng Bột Innisfree No Sebum Moisture Powder 5G là phấn phủ dạng bột vừa kiềm dầu, vừa cân bằng độ ẩm giúp da mịn màng, khô thoáng, rạng rỡ tự nhiên. Chất phấn siêu mỏng mịn có màu nude nhẹ giúp da đều màu hơn và bảo vệ lớp nền mịn màng suốt ngày dài.', 22, 8, N'https://mint07.com/wp-content/uploads/2022/09/phan-phu-dang-bot-innisfree-no-sebum-moisture-powder-5g-4.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (50, N'Phấn Phủ Maybelline Fit Me Matte Poreless', N'Chất phấn của Phấn Phủ Maybelline Fit Me Matte Poreless mỏng mịn, chỉ cần dặm 2 3 lần là đã thấy lỗ chân lông mờ hẳn đi, thoáng da, nhẹ tênh nữa. Không lo bị bí bách nặng mặt tí nào. Em Fit me tạo nên lớp finish lì kiềm dầu cho da, tuy nhiên nhìn lại siêu tự nhiên', 1, 8, N'https://mint07.com/wp-content/uploads/2018/12/phan-phu-maybelline-matte-poreless.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (51, N'Phấn Phủ Eglips Blur Powder Pact Màu Đen', N'Phấn Phủ Eglips Blur Powder Pact Màu Đen có khả năng phủ lên các chỗ không “bằng phẳng” của da như sẹo lõm, lỗ chân lông. Làm da trở nên bằng phẳng hơn, da sẽ trở nên mướt hơn và lớp makeup sẽ hoàn hảo hơn. Kết cấu hạt phấn cực mịn, chồng nhiều lớp cũng không bị cakey.', 23, 8, N'https://mint07.com/wp-content/uploads/2020/03/phan-phu-eglips-blur-powder-pact-mau-den.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (52, N'
Bộ Cọ Trang Điểm Cá Nhân Nâng Cao Da Đỏ 20 Cây Vacosi', N'Bộ Cọ Cá Nhân Vacosi 20 Cây BC25 (Da Đỏ) là bộ cọ cá nhân phù hợp với các bạn mới bắt đầu học trang điểm hoặc nhu cầu trang điểm cá nhân mỗi ngày. Bộ cọ gồm có 20 cây chuyên biệt dành cho cá nhân đựng trong bóp da màu đỏ cá tính, mạnh mẽ.', 20, 9, N'https://mint07.com/wp-content/uploads/2022/06/bo-co-ca-nhan-vacosi-20-cay-bc25-5-1.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (53, N'Cọ Trang Điểm Mắt Mac 252s Large Shader Brush', N'Cọ Trang Điểm Mắt Mac 252s Large Shader Brush là sản phẩm cọ mắt đến từ thương hiệu mỹ phẩm nổi tiếng M.A.C Cosmetics với thiết kế đầu cọ to rộng, lông cọ chắc chắn phù hợp để tán base, primer hoặc tán phấn cả bầu mắt. Đặc biệt, cọ rất hữu dụng với kiểu đánh mắt cut crease.', 3, 9, N'https://mint07.com/wp-content/uploads/2023/01/co-trang-diem-mat-mac-252s-large-shader-brush.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (54, N'CỌ MÁ HỒNG & PHỦ VACOSI ĐẦU TRÒN -50g', N'Cọ trang điểm Vacosi dòng M là dòng cọ trang điểm chuyên biệt dành cho mặt gồm những chiếc cọ như cọ phấn phủ, cọ tạo khối, cọ má hồng và những phiên bản cọ đặc biệt để phủ phấn', 20, 9, N'https://mint07.com/wp-content/uploads/2021/02/vacosi-large-deluxe-powder-m23.jpeg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (55, N'Bấm Mi Cán Đen Siêu Cong VACOSI BM03', N'Kẹp Mi Vacosi là sản phẩm siêu hạt rẻ với chất liệu thép không rỉ kết hợp cùng miếng đệm từ silicon cao cấp giúp uốn cong hàng mi từ gốc đến ngọn một cách hoàn hảo, dễ dàng sử dụng.', 20, 9, N'https://mint07.com/wp-content/uploads/2022/09/kep-mi-vacosi-can-den.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (56, N'Nước Tẩy Trang Cocoon Bí Đao 500ml
', N'Nước Tẩy Trang Cocoon Bí Đao 500ml là sản phẩm nước tẩy trang siêu lành tính với chiết xuất thiên nhiên như Bí Đao, Rau Má, Tinh Dầu Tràm Trà cùng công nghệ Micellar giúp làm sạch hiệu quả lớp trang điểm, bụi bẩn và dầu thừa, mang lại làn da sạch hoàn toàn và dịu nhẹ.', 24, 10, N'https://mint07.com/wp-content/uploads/2023/05/nuoc-tay-trang-cocoon-bi-dao-500ml-3.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (57, N'Nước Tẩy Trang Garnier Salicylic BHA Micellar Cleansing Water', N'Nước Tẩy Trang Garnier Salicylic BHA Micellar Cleansing Water là sản phẩm cải tiến của dòng nước tẩy trang cho da dầu mụn được bổ sung thêm thành phần Salicylic BHA giúp làm sạch sâu, hỗ trợ giảm và ngăn ngừa mụn. Đồng thời, sản phẩm còn được bổ sung thêm thành phần Vitamin C giúp dưỡng sáng, giảm thâm và làm đều màu da hơn.', 25, 10, N'https://mint07.com/wp-content/uploads/2023/03/nuoc-tay-trang-garnier-salicylic-bha-micellar-cleansing-water-3.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (58, N'Nước Sữa Tẩy Trang Senka All Clear Milky Water 230ml', N'Nước Sữa Tẩy Trang Senka All Clear Milky Water 230ml là nước tẩy trang có công thức mỏng nhẹ độc đáo kết hợp 2 lớp từ nước tẩy trang Micellar làm sạch sâu lớp trang điểm đậm cùng sữa tẩy trang có thanh phần chiết xuất Đậu Nành Nhật giúp nuôi dưỡng, cấp ẩm cho làn da sạch thoáng, mịn màng, đàn hồi và rạng rỡ.', 26, 10, N'https://mint07.com/wp-content/uploads/2022/07/nuoc-tay-trang-senka-dang-sua-8.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (60, N'Dầu Tẩy Trang Skin1004 Madagascar Centella Cleansing Oil ', N'Dầu Tẩy Trang Skin1004 Madagascar Centella Cleansing Oil 200ml là dòng dầu tẩy trang đình đám thuộc dòng rau má của Skin1004 với kết cấu dầu lỏng sẽ chiều lòng tất cả mọi loại da, kể cả làn da nhạy cảm. Sản phẩm chứa đến 6 loại dầu thực vật hứa hẹn khả năng làm sạch tốt, chống lão hóa và giữ lại độ mềm ẩm cho da sau khi sử dụng. Dầu tẩy trang Skin1004 sẽ thực sự phù hợp với những làn da hay trang điểm, muốn nhũ hóa nhanh, không gây mụn và khô da.', 27, 10, N'https://mint07.com/wp-content/uploads/2021/11/dau-tay-trang-madagascar-centella-200ml-0.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (61, N'Nước Tẩy Trang Mắt Môi Maybelline Make Up Remover 40ml', N'Dung dịch tẩy trang mắt và môi MAYBELLINE Make Up Remover là loại nước tẩy trang kết hợp nhiều thành phần làm mềm da nhẹ nhàng như Rose water, Kawa extract,… Sản phẩm có tác dụng tẩy trang, làm sạch da và nuôi dưỡng đặc biệt cho vùng da quanh mắt, lông mi, lông mày và đôi môi. Các hoạt chất trong MAYBELLINE Make Up Remover sẽ giúp tẩy sạch các vết trang điểm cứng đầu nhất như mascara không trôi, son lâu phai… đồng thời đưa vùng da quanh mắt và môi trở về trạng thái tự nhiên, mềm mại.', 1, 10, N'https://mint07.com/wp-content/uploads/2018/01/nuoc-tay-trang-mat-moi-maybelline-make-remover-40ml-2.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (62, N'Nước tẩy trang La Roche-Posay Micellar Water Ultra – Da Nhạy Cảm', N'Nước tẩy trang La Roche-Posay Micellar Water Ultra – Da Nhạy Cảm là nước tẩy trang có khả năng làm sạch da lên đến 99%. Sản phẩm có thể loại bỏ kem chống nắng, bụi mịn, giúp lỗ chân lông được thông thoáng. Bảng thành phần tối giản. Không paraben / không chất tạo màu / không cồn/ không chứa xà phòng.', 42, 10, N'https://mint07.com/wp-content/uploads/2017/08/nuoc-tay-trang-laroche-posay.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (63, N'Nước Tẩy Trang Bioderma Sensibio H20 Solution Micellaire', N'Nước Tẩy Trang Bioderma Sensibio H20 Solution Micellaire – nước tẩy trang trong top các loại tẩy trang. Sản phẩm nằm trong list must-have của các tạp chí, các chuyên gia trang điểm nổi tiếng, bởi vì hiệu quả mà nước tẩy trang này mang đến thật kì diệu, tẩy đi lớp bị bẩn, trang điểm nhanh và sạch. Sau khi tẩy da sẽ có cảm giác rất dịu nhẹ, không hề gây kích ứng, an toàn với mọi loại da, kể cả làn da nhạy cảm.', 33, 10, N'https://mint07.com/wp-content/uploads/2014/06/nuoc-tay-trang-bioderma-sensibio-h20-solution-micellaire.jpeg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (64, N'Sữa Rửa Mặt Cetaphil Gentle Skin Cleanser', N'Sữa Rửa Mặt Cetaphil Gentle Skin Cleanser là dòng gel rửa mặt làm sạch nổi tiếng được nhiều người sử dụng trên toàn thế giới nhờ độ dịu nhẹ, không kích ứng phù hợp với làn da nhạy cảm nhất. Sản phẩm được đảm bảo về các tiêu chuẩn về y tế và da liễu với thành phần an toàn, không chứa chất độc hại cho da. Đây là một trong những sản phẩm bán chạy nhất và tạo nên tên tuổi của hãng.', 36, 11, N'https://mint07.com/wp-content/uploads/2021/09/sua-rua-mat-cetaphil-diu-nhe-khong-xa-phong-moi-473ml1-scaled.webp')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (65, N'Sữa Rửa Mặt SVR Sebiaclear Gel Moussant 400ml', N'Sữa Rửa Mặt Dạng Gel SVR Dành Cho Da Dầu Mụn là sữa rửa mặt với công thức dịu nhẹ không chứa thành phần xà phòng đặc biệt phù hợp với làn da dầu mụn và nhạy cảm, có tác dụng làm sạch, làm sạch tế bào da chết và dầu nhờn trong lỗ chân lông giúp ngăn ngừa tối đa mụn ẩn và mụn đậu đen hiệu quả thuộc thương hiệu dược mỹ phẩm SVR đến từ Pháp.', 34, 11, N'https://mint07.com/wp-content/uploads/2018/08/sua-rua-mat-da-dau-mun-nhay-cam-svr-sebiaclear-gel-moussant-400ml-4.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (66, N'Sữa Rửa Mặt Cosrx Good Morning Low pH Gel 150ml', N'Sữa Rửa Mặt Dạng Gel Cosrx Low PH Good Morning Gel Cleanser là dòng sữa rửa mặt dịu nhẹ, thuộc thương hiệu Cosrx. Có độ pH gần như là làn da tự nhiên có khả năng làm sạch mà không gây khô căng da, dễ dàng làm sạch bụi bẩn, bã nhờn và lớp trang điểm, mang đến làn da sạch mịn, thông thoáng lỗ chân lông.

', 30, 11, N'https://mint07.com/wp-content/uploads/2019/01/srm-cosrx-1.jpeg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (67, N'Sữa Rửa Mặt Hada Labo Advanced Nourish Cleanser', N'Sữa Rửa Mặt Hada Labo Advanced Nourish Cleanser tạo bọt mịn nhẹ nhàng rửa sạch lớp tế bào chết, bụi bẫn, bã nhờn ẩn sâu trong lỗ chân lông. Hệ dưỡng ẩm sâu HA, SHA, Nano HA cung cấp độ ẩm tối ưu cho các lớp biểu bì. Khắc phục tình trạng khô sạm do mất nước. Tái tạo cấu trúc đàn hồi cho làn da luôn ẩm mượt, sáng mịn.', 37, 11, N'https://mint07.com/wp-content/uploads/2019/06/srm-hadalabo-hyaluron-advance-nourish-tuyt-3.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (68, N'Sữa Rửa Mặt Hatomugi Moisturizing & Facial Washing', N'Sữa Rửa Mặt Hatomugi Moisturizing & Facial Washing bên cạnh khả năng làm sạch tối ưu còn Có khả năng kháng khuẩn, ngăn ngừa và hỗ trợ điều trị mụn xịn xò. Bên cạnh đó cũng làm sáng, đều màu và mờ thâm đáng kể cho những làn da bị thâm mụn tuổi dậy thì. Cực an toàn, lành tính, không chứa cồn hay paraben.', 45, 11, N'https://mint07.com/wp-content/uploads/2020/09/sua-rua-mat-hatomugi-moisturizing-facial-washing.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (69, N'Sữa Rửa Mặt Bioderma Sensibio Gel Moussant', N'Sữa Rửa Mặt Bioderma Sensibio Gel Moussant Hồng là sữa rửa mặt dành cho da nhạy cảm, cực kỳ dịu nhẹ và không gây kích ứng mang đến cảm giác bề mặt da sạch, mướt và thông thoáng sau khi rửa mặt. Sản phẩm thuộc dòng Sensibio thiết kế cho mọi loại da, đặc biệt là làn da nhạy cảm, dễ kích ứng với thành phần làm sạch của sữa rửa mặt để cảm nhận sự mềm ẩm tự nhiên của bề mặt da.', 33, 11, N'https://mint07.com/wp-content/uploads/2020/11/sensibio-gel-moussant.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (70, N'Sữa rửa mặt CeraVe Hydrating Cleanser, Normal to Dry', N'Sữa rửa mặt CeraVe Hydrating Cleanser là sữa rửa mặt được phát triển bởi các bác sĩ da liễu tại Mỹ, và được các bác sĩ khuyên dùng hằng ngày vì độ dịu nhẹ cũng như khả năng làm sạch da lý tưởng cho da thường đến da khô, kể cả da nhạy cảm nhất. Sản phẩm được bình chọn là sữa rửa mặt bán chạy nhất trên Amazon, đạt nhiều giải thưởng top 1 tại các tạp chí làm đẹp.', 31, 11, N'https://mint07.com/wp-content/uploads/2021/03/cerave-hydrating-cleanser-473ml.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (71, N'Sữa Rửa Mặt Innisfree Trà Xanh Green Tea Cleansing Foam', N'Sữa Rửa Mặt Innisfree Trà Xanh Green Tea Cleansing Foam có tác dụng tái tạo tế bào da, cân bằng dầu thừa và hạn chế mụn, giúp da căng đầy sức sống. Sử dụng cho mọi loại da, đặc biệt da nhạy cảm, da bị kích ứng với ô nhiễm môi trường, da mụn.', 22, 11, N'https://mint07.com/wp-content/uploads/2021/01/innisfree-green-tea-foam-cleanser-150ml.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (72, N'Sữa Rửa Mặt Làm Sạch Sâu Senka Perfect Whip Foam', N'Sữa Rửa Mặt Senka Perfect Whip Tạo Bọt làm sạch sâu cho da. Cứu làn da khỏi bụi bẩn, dầu thừa còn sót lại trên da. Phiên bản mới được thay đổi vào năm ngoái đã giúp Perfect Whip không còn bị khô căng như lời đồn. Độ pH hợp lý hơn cho da dầu. Chỉ cần tạo bọt bông với 1 hạt ngô sữa rửa mặt Perfect Whip thôi là đã sạch sâu mà không khô da đâu nhé', 26, 11, N'https://mint07.com/wp-content/uploads/2019/06/sua-rua-mat-senka-perfect-whip-tao-bot2.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (73, N'Sữa Rửa Mặt La Roche-Posay Effaclar Purifying Foaming Gel', N'Sữa rửa mặt La Roche-Posay Effaclar Purifying Foaming Gel Cleanser thuộc dòng Effaclar – một dòng sản phẩm được hãng dược mỹ phẩm La Roche-Posay phát triển dành riêng cho những làn da dầu, nhờn, có mụn và nhạy cảm. Effaclar cung cấp đầy đủ các giải pháp điều trị hiệu quả với da dầu mụn và thêm nữa lại có độ an toàn, thân thiện cao với những làn da nhạy cảm vì thế các sản phẩm thuộc dòng Effaclar được các bác sĩ da liễu trên toàn thế giới khuyến khích sử dụng và khuyên dùng.', 42, 11, N'https://mint07.com/wp-content/uploads/2015/09/la-roche-posay-effaclar-gel-moussant-purifiant.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (74, N'Nước Hoa Hồng Klairs Supple Preparation Facial Toner 180ml', N'Nước hoa hồng Klairs Supple Preparation Facial Toner 180ml là dòng nước hoa hồng cung cấp độ ẩm, cân bằng da giúp da lấy lại sức sống, tươi tỉnh hơn. Đây là một trong những sản phẩm best-seller của hãng với công dụng đơn giản nhưng mang đến trải nghiệm cấp ẩm tuyệt vời cho mọi loại da.', 39, 12, N'https://mint07.com/wp-content/uploads/2021/06/klairs-supple-preparation-facial-toner-180ml.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (75, N'Nước Hoa Hồng Skin1004 Madagascar Centella Toning Toner', N'Nước Hoa Hồng Skin1004 Madagascar Centella Toning Toner 210ml là dòng nước hoa hồng cung cấp độ ẩm, giúp phục hồi da, làm mềm bề mặt da bằng tinh chất rau má, PHA phù hợp với mọi loại da, kể cả làn da nhạy cảm. Sản phẩm với bảng thành phần lành tính nên được nhiều tín đồ làm đẹp tin dùng.', 27, 12, N'https://mint07.com/wp-content/uploads/2021/09/nuoc-hoa-hong-skin1004-madagascar.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (76, N'Nước Hoa Hồng Hatomugi Moisturizing & Conditioning', N'Nước Hoa Hồng Hatomugi Moisturizing & Conditioning có thành phần chính là chiết xuất ý dĩ Coix được các brand Nhật siêu chuộng trong các sản phẩm dưỡng trắng vì vừa hiệu quả lại vừa lành tính. Kết hợp với Hyaluronic Acid và chiết xuất dầu thầu dầu dưỡng ẩm cho da.', 45, 12, N'https://mint07.com/wp-content/uploads/2020/06/nuoc-hoa-hong-hatomugi-moisturizing-conditioning.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (78, N'Nước Hoa Hồng Cho Da Dầu Mụn Bioderma Sebium Lotion', N'Nước Hoa Hồng Cho Da Dầu Mụn Bioderma Sebium Lotion 200ml được thiết kế dành riêng cho làn da dầu, mụn với khả năng cân bằng độ ẩm trên da, giữ cho làn da khô thoáng lên tới 8 tiếng đồng hồ. Sản phẩm nhận được nhiều sự quan tâm bởi công dụng tuyệt vời cho làn da dầu, mụn. Với sáng chế Fluidacitv giảm thiếu bã nhờn, giữ lỗ chân lông thông thoáng, ngăn ngừa mụn và sáng chế D.A.F giúp da tăng khả năng dung nạp sản phẩm và tăng sức đề kháng cho da.', 33, 12, N'https://mint07.com/wp-content/uploads/2019/02/sebium-lotion.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (79, N'Nước hoa hồng La Roche-Posay EFFACLAR Astringent Micro', N'Nước hoa hồng  La Roche-Posay  EFFACLAR Astringent Micro-Exfoliating Lotion với công thức thích hợp dành riêng cho da dầu, mụn, những làn da có vấn đề về lỗ chân lông lớn của hãng dược mỹ phẩm lành tính nước Pháp La Roche-Posay', 42, 12, N'https://mint07.com/wp-content/uploads/2015/11/toner-la-roche-posay-effaclar.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (80, N'Nước hoa hồng Kiehl’s Calendula Herbal Extract Toner', N'Toner Hoa Cúc Calendula Herbal Extract Alcohol-Free Toner là dòng sản phẩm nước cân bằng da bán chạy nhất của thương hiệu Kiehl’s, được khách hàng ưa chuộng từ những năm 1960, với công thức không cồn và chiết xuất từ cánh hoa Cúc giúp làm dịu và cân bằng da hiệu quả.', 38, 12, N'https://mint07.com/wp-content/uploads/2017/05/nuoc-hoa-hong-kiehls-hoa-cuc-250ml.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (81, N'Nước hoa hồng Simple Kind To Skin Soothing Facial Toner', N'Simple Kind To Skin Soothing Facial Toner – best seller của hãng mỹ phẩm lành tính Simple, là loại nước hoa hồng được rất nhiều cô gái ưa thích lựa chọn là sản phẩm gắn bó trong skincare routine nhờ khả năng làm sạch, nuôi dưỡng và cân bằng độ ph tốt nhất cho da mà không hề gây kích ứng.', 32, 12, N'https://mint07.com/wp-content/uploads/2015/11/simple-soothing-facial-toner.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (82, N'Nước Hoa Hồng Hada Labo Perfect White Tranexamic Acid', N'Nước Hoa Hồng Hada Labo Perfect White Tranexamic Acid 170ml là nước hoa hồng giúp dưỡng sáng da và cấp ẩm sâu đến từ thương hiệu Hada Labo của Nhật Bản. Với thành phần chính là 1% Tranexamic Acid cùng Niacinamide, Vitamin C&E giúp dưỡng sáng, mờ thâm, làm đều màu da, thúc đẩy tái tạo tế bào da mới, chống oxy hoá cho da tươi sáng rạng rỡ hơn. Ngoài ra, sản phẩm còn chứa gấp đôi Hyaluronic Acid giúp cung cấp độ ẩm sâu, hỗ trợ tái tạo cấu trúc da đàn hồi dưỡng da ẩm mượt & mềm mịn hơn.', 37, 12, N'https://mint07.com/wp-content/uploads/2023/03/nuoc-hoa-hong-hada-labo-perfect-white-tranexamic-acid-170ml-1.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (83, N'Serum Some By Mi Retinol Intense 30ml', N'Serum Some By Mi Retinol Intense 30ml là sản phẩm serum cải thiện các vấn đề lão hoá trên da như mờ rãnh nhăn, thu nhỏ lỗ chân lông, làm mịn bề mặt da, tăng độ đàn hồi cho da. Sử dụng công nghệ Elastics – Liposome cùng Triple retinol (Retinol 0.1%, Retinal 1ppm, Bakuchiol 5000ppm) đưa phức hợp Retinol và thành phần hoạt tính thâm nhập vào sâu trong da giúp bổ sung độ ẩm, cải thiện độ đàn hồi và hỗ trợ giảm các nếp nhăn trên da, làm sáng da, cải thiện lỗ chân lông, cho da khỏe từ trong ra ngoài.', 35, 13, N'https://mint07.com/wp-content/uploads/2023/06/serum-some-by-mi-retinol-intense-30ml-11.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (84, N'Serum Kiehl’s Retinol Skin-Renewing Daily Micro Dose 30ml', N'Serum Kiehl’s Retinol Skin-Renewing Daily Micro Dose 30ml là sản phẩm giúp tái tạo da, cho da căng mướt và sáng khoẻ hơn. Với thành Retinol nguyên chất thế hệ mới cùng công nghệ đột phá, kết hợp với Niacinamide, Peptides & Ceramides giúp hỗ trợ quá trình tái tạo da, kết quả mang tới làn da săn chắc, đàn hồi và rạng rỡ hơn và hạn chế tối đa tình trạng bong tróc, mẩn đỏ, khó chịu.', 38, 13, N'https://mint07.com/wp-content/uploads/2023/01/serum-kiehls-retinol-skin-renewing-daily-micro-dose-30ml.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (85, N'Serum Skin1004 Madagascar Centella Hyalu Cica Blue 50ml', N'Serum Skin1004 Madagascar Centella Hyalu Cica Blue 50ml là serum giúp cấp nước, làm mờ vết thâm nám, dưỡng sáng và chống lão hoá cho da săn chắc mịn màng. Với thành phần rau má Madagascar làm chủ lực kết hợp cùng 5 loại Hyaluronic Acid và Ceramide Biom lấy cảm hứng từ đại dương sâu thẳm, tạo hàng rào bảo vệ da, cung cấp độ ẩm cho da và giúp cân bằng dầu nhờn, mang đến cảm giác ẩm mượt. Đồng thời Niacinamide & Adenosine giúp làm sáng da, ngăn ngừa lão hóa, mang lại làn da sáng bóng. Ngoài ra sản phẩm còn chứa chiết xuất cây thường xuân là thành phần nổi bật được sử dụng rộng rãi từ thời cổ đại trong việc làm dịu da làm giảm sự kích ứng của da, kích thích đẩy nhanh tốc độ làm lành vết thương hiệu quả.', 27, 13, N'https://mint07.com/wp-content/uploads/2022/11/serum-skin1004-madagascar-centella-hyalu-cica-blue-50ml-8.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (86, N'Serum Klairs Midnight Blue Youth Activating Drop 20ml', N'Serum Klairs Midnight Blue Youth Activating Drop 20ml là tinh chất dưỡng da đến từ thương hiệu Klairs của Hàn Quốc, chứa EGF và bFGF không chỉ giảm thiểu nếp nhăn, làm căng mịn làn da mà còn tăng cường độ đàn hồi của da, đẩy lùi các dấu hiệu lão hóa, cùng 95% nguyên liệu tự nhiên giúp cải thiện chất lượng tổng thể của da.', 39, 13, N'https://mint07.com/wp-content/uploads/2022/09/serum-klairs-midnight-blue-youth-activating-drop-20ml-1.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (87, N'Serum La Roche Posay Cicaplast B5 30ml', N'Serum La Roche Posay Cicaplast B5 30ml là serum có khả năng cấp ẩm lên đến 24H, giúp phục hồi và giảm các dấu hiệu kích ứng đáng kể trong thời gian ngắn sử dụng.
Với công thức chứa 10% Panthenol kết hợp cùng nước khoáng nhà La Roche Posay giúp làm dịu và phục hồi hàng rào bảo vệ da. Ngoài ra sự xuất hiện của Hepes được biết đến như axit tổng hợp có khả năng đào thải da chết, thúc đấy quá trình tái tạo lớp da trên bề mặt giúp da mềm mịn hơn.', 42, 13, N'https://mint07.com/wp-content/uploads/2022/08/serum-la-roche-posay-cicaplast-b5-30ml-4.webp')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (88, N'Serum Garnier Bright Complete Anti-Acnes Booster 30ml', N'Serum Garnier Bright Complete Anti-Acnes Booster 30ml là serum có công dụng 2 trong 1 vượt trội với công thức nổi bật chứa 4% Phức Hợp [Vit C + BHA + Niacinamide + AHA] không chỉ làm mềm lớp sừng trên da, làm dịu tình trạng mụn mà còn bổ sung dưỡng chất thiết yếu giúp nâng tone da tự nhiên từ sâu bên trong, làm đều màu da, đem lại vẻ rạng rỡ, căng tràn sức sống cho nàng thêm tự tin.', 25, 13, N'https://mint07.com/wp-content/uploads/2022/09/serumgarnierbright-complete-anti-acnes-booster-30ml.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (90, N'Serum Dưỡng Ẩm Senka Deep Moist 3X HA 30ml', N'Serum Dưỡng Ẩm Senka Deep Moist 3X HA 30ml là dòng tinh chất dưỡng ẩm chuyên sâu cùng với khả năng chống lão hóa, tăng cường độ ẩm làn da lên tới 170% nhờ công nghệ và thành phần độc quyền của hãng. Sản phẩm hứa hẹn một làn da căng bóng, rạng ngời cho mọi loại da, kể cả da nhạy cảm cũng có thể sử dụng với tiêu chí 3 không: không cồn – không mùi – không màu. ', 26, 13, N'https://mint07.com/wp-content/uploads/2021/10/senka-deep-moist-3x-ha-30ml.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (91, N'Serum dưỡng ẩm Vichy Mineral 89 Probiotic Fractions 30mL', N'Serum Vichy Mineral 89 Probiotic 30ml là phiên bản cấp nước cao cấp mới nhất của Vichy. Với khả năng vượt trội trong cung cấp độ ẩm, cùng khả năng làm khỏe da nhờ thành phần mới Probiotic và nước khoáng Vichy phù hợp với mọi loại da, kể cả làn da nhạy cảm, đây sẽ là giải pháp hoàn hảo cho làn da thiếu nước, dễ kích ứng mẩn đỏ.', 50, 13, N'https://mint07.com/wp-content/uploads/2021/07/vichy-mineral-89-probiotic.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (92, N'Serum làm sáng Klairs Freshly Juiced Vitamin Drop 35ml', N'Serum làm sáng Klairs Freshly Juiced Vitamin Drop 35ml là tinh chất giúp hỗ trợ làm đều màu da, mờ các vết thâm và chống oxy hóa cho da. Serum có thành phần chiết xuất từ Ascorbic Acid – là một loại dẫn xuất từ Vitamin C tinh khiết với hàm lượng 5% có tác dụng làm mờ vết thâm, ức chế việc hình thành sắc tố melanin, chống oxy hóa mạnh mẽ và kích thích tăng sinh collagen nhằm phục hồi, tăng cường độ đàn hồi cho da.', 39, 13, N'https://mint07.com/wp-content/uploads/2021/04/serum-klairs-vitamin-c.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (93, N'Kem Dưỡng Cocoon Bí Đao Winter Melon Gel Cream 100ml', N'Kem Dưỡng Cocoon Bí Đao Winter Melon Gel Cream 100ml là sự kết hợp giữa chiết xuất bí đao thanh mát, 5α-AVOCUTA® được chưng cất phân tử từ dầu quả bơ và TECA™ trích ly từ rau má, cùng kết cấu dạng thạch mỏng nhẹ tan nhanh vào da giúp mang lại độ ẩm cân bằng, giảm lượng dầu thừa và cải thiện tình trạng mụn cho da.', 24, 14, N'https://mint07.com/wp-content/uploads/2023/06/kem-duong-cocoon-bi-dao-winter-melon-gel-cream-100ml-4-1.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (94, N'Kem Dưỡng Hada Labo Perfect White Tranexamic Acid Gel Cream', N'Kem Dưỡng Hada Labo Perfect White Tranexamic Acid Gel Cream 50G là kem dưỡng giúp dưỡng sáng da và cấp ẩm sâu đến từ thương hiệu Hada Labo của Nhật Bản. Với thành phần chính là 2% Tranexamic Acid cùng Vitamin C&E giúp dưỡng sáng, mờ thâm, làm đều màu da, thúc đẩy tái tạo tế bào da mới, chống oxy hoá cho da tươi sáng rạng rỡ hơn. Ngoài ra, sản phẩm còn chứa gấp đôi Hyaluronic Acid giúp cung cấp độ ẩm sâu, hỗ trợ tái tạo cấu trúc da đàn hồi dưỡng da ẩm mượt & mềm mịn hơn.', 37, 14, N'https://mint07.com/wp-content/uploads/2023/03/kem-duonghada-labo-perfect-white-tranexamic-acid-gel-cream-50g-2-2.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (96, N'Kem Dưỡng Đêm Kiehl’s Midnight Recovery Omega Rich Cloud 14ml', N'Kem Dưỡng Đêm Kiehl’s Midnight Recovery Omega Rich Cloud 14ml có nguồn gốc tự nhiên chứa các chiết xuất thiên nhiên giàu Omega 3 & 6 giúp bổ sung nhiều dưỡng chất cho da mềm mại, căng bóng và rạng rỡ hơn. Cung cấp độ ẩm sâu giúp củng cố hàng rào bảo vệ da, cải thiện tình trạng khô da, lão hoá và xỉn màu, thiếu sức sống.

 ', 38, 14, N'https://mint07.com/wp-content/uploads/2022/10/kem-duong-kiehls-midnight-recovery-omega-rich-cloud-14ml.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (97, N'Kem Dưỡng Bio Essence Water B5 Moisturizing Gel 50G', N'Kem Dưỡng Bio Essence Water B5 Moisturizing Gel 50g là kem dưỡng giúp dưỡng ẩm, cấp nước chuyên sâu cho da nhạy cảm, thiếu ẩm, thiếu nước. Với thành phần chính chứa Vitamin B5 và Hyaluronic Acid dạng Nano HA cực nhỏ cùng Niacinamide giúp thẩm thấu dưỡng chất nhanh chóng, làm dịu, phục hồi cải thiện da khỏe mạnh, cung cấp độ ẩm cho làn da ẩm mượt hơn. Ngoài ra, sản phẩm còn kết hợp công thức Anti-pollution giúp bảo vệ da khỏi ô nhiễm, bụi bẩn, ngăn tắc nghẽn lỗ chân lông, gây bí da.', 47, 14, N'https://mint07.com/wp-content/uploads/2023/05/kem-duong-bio-essence-water-b5-moisturizing-gel-50g-5.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (98, N'Kem Dưỡng Senka Aqua Bright Glow UV Moist Whip SPF25 50g', N'Kem Dưỡng Senka Aqua Bright Glow UV Moist Whip SPF25 50g là kem dưỡng sáng da dành riêng cho ban ngày với chỉ số chống nắng SPF 25+, PA++ giúp bảo vệ da khỏi các tác hại của tia UVA và UVB. Cùng chất kem màu trắng mỏng nhẹ với khả năng thẩm thấu sâu vào các tầng da và nâng tone cho da trắng hồng tự nhiên. Sản phẩm chứa các thành phần dưỡng da từ Nhật Bản như: Tranexamic Acid, Tinh chất Hoa Anh Đào, Tơ Tằm Trắng, Cám Gạo, Mật Ong và gấp đôi Hyaluronic Acid giúp da căng mướt, ẩm mềm, tươi sáng và đều màu hơn.', 26, 14, N'https://mint07.com/wp-content/uploads/2023/02/kem-duong-senka-aqua-bright-glow-uv-moist-whip-spf25-50g.webp')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (99, N'Kem Dưỡng Ban Đêm L’Oreal Paris Glycolic Bright Night 50ml', N'Kem Dưỡng Ban Đêm L’Oreal Paris Glycolic Bright Night 50ml là kem dưỡng cấp ẩm sâu ban đêm giúp dưỡng sáng, giảm thâm nám và làm đều màu da hơn. Kem dưỡng giúp sửa chữa mạnh mẽ hàng rào bảo vệ da và giảm các đốm đen. Với công thức đặc biệt giúp tái tạo, ngăn ngừa lão hóa, kích thích sản sinh collagen cho da.', 4, 14, N'https://mint07.com/wp-content/uploads/2022/07/kem-duong-loreal-paris-glycolic-bright-night-cream-5.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (100, N'Kem Dưỡng Eucerin Ato Control Face Cream 50ml', N'Kem Dưỡng Eucerin Ato Control Face Cream 50ml là kem dưỡng ẩm giúp phục hồi và tái tạo cho da khô nhạy cảm, dễ kích ứng, da đang bị tổn thương. Công thức vượt trội với 12% các acid béo Omega-6, Licochalcone A sẽ giúp làm dịu da, cung cấp độ ẩm sâu và giảm tình trạng viêm ngứa, mẩn đỏ, khô rát hiệu quả. Đặc biệt sản phẩm vô cùng lành tính và an toàn có thể dùng cho trẻ sơ sinh từ 4 tuần tuổi.', 43, 14, N'https://mint07.com/wp-content/uploads/2022/08/kem-duong-eucerin-ato-control-face-cream-50ml.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (101, N'Mặt Nạ Giấy Mediheal Essence Mask 20ml', N'Mặt Nạ Giấy Mediheal Essence Mask 20ml là dòng mặt nạ giúp dưỡng ẩm, làm trắng, ngăn ngừa lão hoá cao cấp với các thành phần chính như Glycerin, Niacinamide, Peptide, Collagen,… giúp dưỡng da căng mịn, mọng nước, làm đều màu, sáng mịn da, ngăn ngừa các nếp nhăn và lão hóa, mang lại làn da tươi sáng, rạng ngời.', 48, 15, N'https://mint07.com/wp-content/uploads/2023/06/mat-na-giay-mediheal-essence-mask-20ml-1.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (102, N'Mặt Nạ Giấy Mediheal Solution Mask 21ml', N'Mặt Nạ Giấy Mediheal Solution Mask là dòng mặt nạ giúp dưỡng da, phục hồi chuyên sâu với các thành phần chiết xuất từ thiên nhiên như than tre, rau má, tràm trà,… giúp giảm tình trạng tiết dầu thừa, bã nhờn, làm cân bằng, phục hồi và dịu da đem lại làn da căng mịn, mềm mượt.', 48, 15, N'https://mint07.com/wp-content/uploads/2023/06/mat-na-giay-mediheal-solution-mask-1.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (103, N'Mặt Nạ Innisfree Squeeze Energy Mask 22ml', N'Mặt Nạ Innisfree Squeeze Energy Mask 22ml là dòng mặt nạ được nhiều tín đồ làm đẹp yêu thích nhờ chất liệu cellulose từ cây bạch đàn cho thiết kế mỏng nhẹ, bền chắc, vừa ôm sát mặt vừa không tạo cảm giác dày, bí, đưa dưỡng chất vào da hiệu quả hơn. Đây nguyên liệu tự phân hủy nên rất thân thiện với môi trường. Dưỡng chất trong mặt nạ được chiết xuất từ nước ép tự nhiên tại đảo Jeju, ứng dụng công nghệ vắt – ép lạnh để tối ưu hóa dưỡng chất hơn.', 22, 15, N'https://mint07.com/wp-content/uploads/2023/03/mat-na-innisfree-squeeze-energy-mask-22ml-1.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (104, N'Mặt Nạ Giấy Some By Mi Real Care Sheet Mask 20g', N'Mặt Nạ Giấy Some By Mi Real Care Sheet Mask 20g là dòng mặt nạ giấy “hot hit” nhà Some By Mi với các chiết xuất thiên nhiên và giàu dưỡng chất giúp da cung cấp độ ẩm, làm dịu da, hỗ trợ điều trị mụn cho làn da khoẻ mạnh, tràn đầy sức sống và mềm mại hơn', 35, 15, N'https://mint07.com/wp-content/uploads/2022/10/mat-na-giay-some-by-mi-real-care-sheet-mask-20g.webp')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (105, N'
Mặt Nạ Giấy Naruko Mask Taiwan 25ml', N'Bộ Mặt Nạ Giấy Naruko Sheet Mask đầy đủ nhu cầu cho chị em: Trị Mụn – Dưỡng Ẩm – Làm Sáng – Chống Lão Hoá. Chất giấy dày vừa phải, ôm khít khuôn mặt. Các loại mặt nạ giấy của Naruko với 4 loại cụ thể như sau.', 49, 15, N'https://mint07.com/wp-content/uploads/2019/08/mat-na-giay-naruko-sheet-mask.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (107, N'Kem Chống Nắng Cocoon Bí Đao 50ml', N'Kem Chống Nắng Cocoon Bí Đao 50ml với công thức đột phá kết hợp các màng lọc thế hệ mới, chiết xuất bí đao và các thành phần chống oxi hoá, kem chống nắng bí đao mang lại khả năng bảo vệ phổ rộng chống lại bức xạ UVA và UVB là nguyên nhân gây ra tác hại lên da như bỏng rát, cháy nắng, kích ứng, lão hoá và tổn thương tế bào da.', 24, 16, N'https://mint07.com/wp-content/uploads/2023/05/kem-chong-nang-cocoon-bi-dao-50ml-3.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (108, N'Kem Chống Nắng La Roche Posay Anthelios UVMUNE 400 Gel ', N'Kem Chống Nắng La Roche Posay Anthelios UVMUNE 400 Gel – Cream SPF50 50ml là phiên bản nâng cấp mới nhất của dòng La Roche Posay Anthelios XL Gel cải tiến vượt trội về 8 màng lọc chống nắng xịn xò giúp tăng cường khả năng chống nắng, bảo vệ da toàn diện hơn, chống lại cả các tia không nhìn thấy được như tia HEV (ánh sáng xanh).', 42, 16, N'https://mint07.com/wp-content/uploads/2023/03/kem-chong-nang-la-roche-posay-anthelios-uvmune-400-gel-cream-spf50-50ml-4.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (109, N'Kem Chống Nắng Skin1004 Madagascar Centella Air Fit ', N'Kem Chống Nắng Skin1004 Madagascar Centella Air Fit Suncream Plus SPF50 50ml là dòng kem chống nắng phiên bản nâng cấp với nhiều cải tiến vượt trội mang đến khả năng bảo vệ, làm dịu hiệu quả cho mọi loại da. Được thiết kế là dòng kem chống nắng vật lý có màu da để giúp làn da tươi sáng, đều màu hơn và finish hoàn hảo cho da không gây bết dính, khó chịu.', 27, 16, N'https://mint07.com/wp-content/uploads/2021/11/madagascar-centella-air-fit-suncream-plus-spf50-50ml-1.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (110, N'Kem chống nắng Innisfree Tone Up No Sebum Sunscreen SPF50', N'Kem chống nắng Innisfree Tone Up No Sebum Sunscreen SPF50 50ml là kem chống nắng nâng tông vật lý của Innisfree. Kem chống nắng với finish ráo mịn đẹp mê hồn cho những cô nàng da dầu, nhạy cảm. Kem chống nắng thích hợp để che đi khuyết điểm nhỏ trên gương mặt và giúp làn da tươi tắn, tràn đầy sức sống hơn.', 22, 16, N'https://mint07.com/wp-content/uploads/2021/06/kem-chong-nang-innisfree-tone-up-no-sebum-sunscreen-spf50-50ml-1-1.jpg')
GO
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (111, N'Kem Chống Nắng Loreal Paris UV Defender 50ml​', N'Kem Chống Nắng Loreal Paris UV Defender 50ml​ là kem chống nắng thế hệ mới của L’Oreal khi sở hữu màng lọc chống nắng Mexoryl SX và Mexorul XL được sử dụng rộng rãi trong kem chống nắng Châu Âu, cho hiệu quả bảo vệ da tối ưu trước tia UVA và UVB. Sản phẩm được thiết kế 4 loại cho các loại da và vấn đề da khác nhau.', 4, 16, N'https://mint07.com/wp-content/uploads/2021/05/kcn-loreal-uv-defender-correct-protect-1.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (112, N'Kem Chống Nắng Missha Soft Finish Sun Milk SPF50', N'Kem Chống Nắng Missha Soft Finish Sun Milk SPF50 là kem chống nắng lai nên an toàn. Ít gây kích ứng da, có độ quang phổ rộng. Chống lại bụi, ô nhiễm và tia UV. Cung cấp độ ẩm và duy trì làn da khỏe mạnh, mịn màng. Texture không lỏng cũng không đặc, vừa vặn đến hoàn hảo để có thể tán ra và giữ trên mặt cả ngày mà không gây mụn. Có màu hồng nhạt giúp da trắng hồng mịn màng khỏe khoắn.', 9, 16, N'https://mint07.com/wp-content/uploads/2020/05/kem-chong-nang-missha-soft-finish-sun-milk-spf50.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (113, N'Kem Chống Nắng Senka Dạng Gel Perfect UV Gel SPF50', N'Kem Chống Nắng Senka Dạng Gel Perfect UV Gel SPF50 là kem chống nắng hoá học. Dễ rửa trôi, phù hợp da hay tắc nghẽn. Ngoài chiết xuất tơ tằm giúp dưỡng da mịn mượt, tăng độ đàn hồi và nâng độ sáng, em này cũng bổ sung phức hợp 2 loại Hyaluronic Acid giúp tăng cường độ ẩm cho da, nhờ đó giảm tiết dầu thừa suốt cả ngày.', 26, 16, N'https://mint07.com/wp-content/uploads/2019/06/kem-chong-nang-senka-dang-gel-perfect-uv-gel-spf50.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (114, N'Kem Chống Nắng Biore UV Color Control CC Milk', N'Bản kết hợp của kem chống nắng và cushion 2 trong 1 cho những cô nàng bận rộn, không thích make-up mà vẫn muốn da “ăn gian” mịn đẹp hơn tí tẹo này. 

Biore UV Color Control CC Milk là chống nắng dạng sữa, dễ bôi, đảm bảo thoáng da. Nhờ bổ sung thêm màu vàng nude rất tiệp da châu Á nên em ý có khả năng che nhẹ những khuyết điểm nhỏ như lỗ chân lông, thâm mụn nhẹ, tàn nhang, da không đều màu. Trông da đẹp hơn mà vẫn tự nhiên, không phát hiện nổi.

 ', 52, 16, N'https://mint07.com/wp-content/uploads/2018/01/biore-cc-milk.jpeg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (115, N'Kem Chống Nắng Sunplay Skin Aqua Clear White Outdoor SPF50', N'Kem Chống Nắng Sunplay Skin Aqua Clear White Outdoor SPF50+ PA++++ 30G là kem có chỉ số chống nắng SPF 50+ PA ++++ giúp chống nắng hiệu quả, bảo vệ da khỏi sạm nám, tàn nhang, cháy nắng và các dấu hiệu lão hóa da. Sử dụng công nghệ Watery Capsule chứa các hạt chống nắng được bao bọc trong lớp màng nước giúp phản xạ đa chiều tia UVA/UVB, cho khả năng chống nắng tối ưu và bền bỉ trên da nhiều giờ liền. Sản phẩm có công thức giải nhiệt da, kháng nước và mồ hôi cao, phù hợp sử dụng khi vận động ngoài trời.', 51, 16, N'https://mint07.com/wp-content/uploads/2023/03/kem-chong-nang-sunplay-skin-aqua-clear-white-outdoor-spf50-pa-30g-1.jpeg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (116, N'Sữa Tắm Cocoon Bí Đao Giảm Mụn 310ml', N'Sữa Tắm Cocoon Bí Đao Giảm Mụn 310ml giúp làm sạch cho da mịn màng và tươi mới hơn, đồng thời loại bỏ vi khuẩn, giảm mụn vùng lưng, làm mờ vết thâm do mụn để lại. Với thành phần chính bí đao có đặc tính làm mát, làm giảm nhiệt, kháng viêm và diệt khuẩn giúp điều trị mụn trứng cá, mụn viêm cùng tinh dầu sả chanh và tinh dầu bạc hà giúp kháng khuẩn, giảm mùi cơ thể, tạo cảm giác sảng khoái và thư giãn.', 24, 17, N'https://mint07.com/wp-content/uploads/2023/05/sua-tam-cocoon-bi-dao-giam-mun-310ml-1.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (117, N'Sữa Tắm Hatomugi Moisturizing & Washing 800ml', N'Sữa Tắm Hatomugi Moisturizing & Washing 800ml là dòng sản phẩm sữa tắm đến từ Nhật Bản với chiết xuất từ hạt ý dĩ & vitamin các loại giúp cung cấp độ ẩm cho da ẩm mượt hơn, đồng thời giảm sự hình thành nếp nhăn, làm mờ các đốm nâu, dưỡng da sáng và đều màu hơn.', 45, 17, N'https://mint07.com/wp-content/uploads/2023/02/sua-tam-hatomugi-moisturizing-washing-800ml.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (118, N'Sữa tắm Senka Perfect Bubble for Body 500ml', N'Sữa tắm Senka Perfect Bubble for Body với lớp bọt tơ tằm trắng dày và mịn nhẹ nhàng làm sạch bụi bẩn trên da, đồng thời cung cấp độ ẩm, nuôi dưỡng độ ẩm tự nhiên, cho làn da giúp da mềm mịn, ẩm mượt.', 6, 17, N'https://mint07.com/wp-content/uploads/2021/04/sua-tam-senka-perfect-bubble-for-body1.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (119, N'Sữa Tắm Some By Mi AHA BHA PHA 30 Days', N'Sữa Tắm Some By Mi AHA BHA PHA 30 Days chứa AHA – BHA – PHA, ba nhóm tẩy tế bào chết hoá học giúp làm sạch lỗ chân lông giảm sự bí tắc và chất bẩn trên cơ thể kết hợp cùng chiết xuất Tràm Trà và Bạch Đàn để ngăn ngừa mụn quay trở lại và cải thiện vùng mụn trên cơ thể.', 35, 17, N'https://mint07.com/wp-content/uploads/2020/07/sua-tam-some-by-mi-aha-bha-pha-30-days400g.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (120, N'Sữa Tắm Sáng Da, Dưỡng Ẩm Cho Da Mềm Mịn, Rạng Ngời Hazeline', N'Sữa Tắm Sáng Da Hazeline là dòng sữa tắm đến từ thương hiệu chăm sóc da Hazeline với sự kết hợp từ các loại trái cây thiên nhiên, bổ sung lượng Vitamin dồi dào giúp nuôi dưỡng làn da sáng mịn từ sâu bên trong, mang đến hương thơm tươi mát và thư giãn.', 54, 17, N'https://product.hstatic.net/1000006063/product/dd_562cbc3efad4498981e50064a58fc9ad_1024x1024_e29a9bbc2ea54833a2ec535f6c7b4cc2_1024x1024.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (121, N'Sữa Tắm Dưỡng Thể Căng Bóng Da Chiết Xuất Từ Thiên Nhiên', N'Sữa Tắm Dưỡng Thể Căng Bóng Da Chiết Xuất Từ Thiên Nhiên Dove Nouishing Secret là dòng sữa tắm đến từ thương hiệu Dove với thành phần chính chiết xuất từ thiên nhiên an toàn lành tính giúp nhẹ nhàng làm sạch da cùng công thức dưỡng ẩm sâu, mang lại làn da mềm mại, căng bóng thuộc thương hiệu Dove đến từ Mỹ', 55, 17, N'https://product.hstatic.net/1000006063/product/3_3ccd87c4c7a24673a9273149dc3c4ae4_1024x1024.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (122, N'Tẩy Da Chết Dove Exfoliating Body Scrub 225ml', N'Tẩy Da Chết Dove Exfoliating Body Scrub 225ml là sản phẩm tẩy da chết đình đám của hãng Dove với sự kết hợp giữa hạt tẩy tế bào và mùi hương đến từ thiên nhiên sẽ mang đến sự mịn màng, thơm ngát và tươi mới cho làn da cơ thể của bạn. Sản phẩm còn đoạt giải thưởng sản phẩm làm đẹp thời trang nhất năm 2019 cho mục tẩy da chết body.', 55, 18, N'https://mint07.com/wp-content/uploads/2022/11/tay-da-chet-dove-exfoliating-body-scrub-225ml-1.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (123, N'Tẩy Da Chết Body Cocoon Dak Lak Coffee Body Polish 200ml', N'Tẩy Da Chết Body Cocoon Dak Lak Coffee Body Polish 200ml là tẩy da chết dành riêng cho body với hạt cà phê nguyên chất từ Đắk Lắk kết hợp với bơ ca cao Tiền Giang giúp làm sạch da chết cơ thể hiệu quả, làm đều màu da, khơi dậy năng lượng giúp da trở nên mềm mịn và rạng rỡ hơn.', 24, 18, N'https://mint07.com/wp-content/uploads/2023/05/tay-da-chet-bodycocoon-dak-lak-coffee-body-polish-200ml.jpeg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (124, N'Dưỡng Thể Hatomugi Chống Nắng SPF50 UV Milky Gel 250ml', N'Dưỡng Thể Hatomugi Chống Nắng SPF50 UV Milky Gel 250ml là dưỡng thể có chỉ số chống nắng SPF50, PA ++++ giúp chống nắng bảo vệ da khỏi các tác hại của tia UV như cháy nắng, đỏ rát da. Sản phẩm có chứa các thành phần chiết xuất từ thiên nhiên như hạt ý dĩ, lá đào, lô hội, dầu dừa, tinh dầu vỏ cam cùng Sodium Hyaluronate vừa giúp dưỡng ẩm, giảm ngứa cho da bị mất nước và kích ứng lại vừa có tác dụng dưỡng trắng, cấp ẩm cho da mềm mịn, đàn hồi suốt ngày dài.', 45, 19, N'https://mint07.com/wp-content/uploads/2022/12/duong-the-hatomugi-chong-nang-spf50-uv-milky-gel-250ml-1.webp')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (125, N'Dưỡng thể Vaseline Healthy Bright Instant Radiance 4X', N'Dưỡng thể Vaseline Healthy Bright Instant Radiance 4X là dưỡng thể giúp dưỡng ẩm, hỗ trợ phục hồi hư tổn từ sâu bên trong và dưỡng sáng da tức thì gấp 4X lần nhờ công thức cải tiến với vi chất phản quang kết hợp cùng giọt Vaseline Jelly siêu nhỏ độc quyền nhà Vaseline. Ngoài ra, sản phẩm còn được bổ sung màng chống nắng 3 tác động sẽ bảo vệ làn da khỏi các tác hại từ tia UVA và UVB, là những tác nhân gây ra lão hóa, sạm nám da.', 46, 19, N'https://mint07.com/wp-content/uploads/2022/08/duong-the-vaseline-healthy-bright-instant-radiance-4x-350ml-6.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (126, N'Kem Dưỡng Cơ Thể Kiehl’s Creme de Corphs Body Lotion', N'Kem Dưỡng Cơ Thể Kiehl’s Creme de Corphs Body Lotion 125ml là dòng dưỡng thể có độ ẩm sâu thuộc top bán chạy của hãng trong nhiều năm liền với các thành phần nuôi dưỡng da tốt nhất được biết đến của Kiehl’s cho một làn da giàu độ ẩm lý tưởng nhất. Kiehl’s trung thành với 3 thành phần chính: bơ ca cao và dầu mè dưỡng ẩm và làm mềm da, Beta – carotene chống oxy hóa, ngăn ngừa rạn da và nếp nhăn chảy xệ trên các vùng cơ thể tích mỡ như đùi, mông. Một sản phẩm dưỡng thể không cầu kì nhưng làm rất tốt chức cả 2 chức năng dưỡng ẩm và làm mịn bề mặt da tốt phù hợp với da khô, kém đàn hồi và có dấu hiệu lão hóa. ', 38, 19, N'https://mint07.com/wp-content/uploads/2022/01/duong-the-kiehls-creme-de-corps-125ml.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (127, N'Dầu Gội Dove Botanical Selection Hồng – Hoa Sen & Dầu Jojoba', N'Dầu Gội Dove Botanical Selection Hồng – Hoa Sen & Dầu Jojoba dành cho tóc KHÔ, thiếu sức sống, cần độ bóng mượt. Giúp tóc bóng mượt và nước gạo làm sạch tóc và mượt mà, óng ả. Hương thơm của dòng này nhẹ nhàng pha giữa hương hoa sen và trái cây.', 55, 20, N'https://mint07.com/wp-content/uploads/2019/07/dau-goi-dove-botanical-selection-hong-hoa-sen-dau-jojoba.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (128, N'Kem Nền Espoir Pro Tailor Foundation Be Velvet SPF22', N'Kem Nền Espoir Pro Tailor Foundation Be Velvet SPF22 nằm trong bộ sưu tập mới nhất của nhà Espoir với sắc đỏ quyền lực, cùng chất kem mỏng nhẹ, mềm mịn sử dụng công thức Comfort Velvet Formula cho lớp nền mềm mượt không gây khô da hay bết rít. Đặc biệt, sản phẩm chứa bột sapphire trắng bền vững (ALUMINA) giúp lớp nền bền màu và không bị xuống tone suốt ngày dài.', 5, 1, N'https://mint07.com/wp-content/uploads/2023/01/kem-nen-espoir-pro-tailor-foundation-be-velvet-spf22-1.webp')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (129, N'Cushion Lemonade Super Matte SPF50 PA+++', N'Cushion Lemonade Super Matte SPF50 PA+++ là cushion siêu kiềm dầu đến từ nhà Lemonade. Ngoài khả năng kiềm dầu vượt trôi, giúp lớp nền lì mịn, lâu trôi, bền màu suốt ngày dài. Còn có độ che phủ đỉnh cao có thể phủ cả những nốt mụn đỏ, vết thâm mà vẫn đảm bảo lớp nền tự nhiên.', 8, 2, N'https://mint07.com/wp-content/uploads/2022/08/cushion-lemonade-super-matte-8.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (130, N'Son Romand See-Through Matte Tint', N'Son Romand See-Through Matte Tint với phiên bản đặc biệt Hanbok Project với một diện mạo xinh xắn, trang nhã với chất son kem lì mịn mượt cùng với bảng màu trendy quyến rũ giúp da trở nên tươi sáng.', 12, 4, N'https://mint07.com/wp-content/uploads/2021/04/son-kem-romand-see-through-matte-tint.jpeg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (131, N'Son Kem Dạng Tint 3CE Blur Water Tint 4.6g', N'Son Kem Dạng Tint 3CE Blur Water Tint 4.6g là dòng son kem mới ra mắt của 3CE trong năm 2021 được thiết kế hoàn hảo tuyệt đối không lem ra thành cốc hay khẩu trang, siêu hợp sử dụng trong mùa dịch. Chất son được hãng mô tả có hiệu ứng blur nhẹ, trông mờ mờ ảo ảo như dùng filter tạo finish căng bóng, nhẹ môi hoàn hảo với màu sắc trendy phù hợp với nhiều tông da khác nhau. Đây hứa hẹn là một dòng son mà bạn cần phải thử và sở hữu một lần để trải nghiệm độ mềm mại, khác biệt trên đôi môi.', 16, 4, N'https://mint07.com/wp-content/uploads/2021/12/3ce-blur-water-tint.jpeg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (132, N'Bảng Phấn Mắt Clio Pro Eye Palette 10 Ô', N'Bảng Phấn Mắt Clio Pro Eye Palette (Koshort In Seoul Limited) thuộc BST Limited mới nhất nhà Clio vẫn với chất phấn mướt mềm, dễ blend cùng khả năng lên màu vừa phải, không đậm quá cũng không nhạt nhòa nhưng được thay thành bao bì siêu cute, đáng yêu cùng các ô phấn được in nổi họa tiết chân mèo dễ thương, đi kèm 1 set sticker đốn tim các con sen.', 6, 5, N'https://mint07.com/wp-content/uploads/2023/06/bang-phan-mat-clio-pro-eye-palette-koshort-in-seoul-limited-3.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (133, N'Phấn Phủ Mac Studio Fix Powder Plus Foundation', N'Phấn Phủ Mac Studio Fix Powder Plus Foundation là vật “bất li thân” với các nàng có làn da bóng dầu, những nàng có nhiều khuyết điểm cần che phủ. Vỏ hộp chắc chắn nhưng cực nhẹ, phấn nén chặt, ngăn dưới đựng bông phấn. Giúp che phủ tốt, độ mịn cao, kiềm dầu tốt, không khô cứng, đọng vệt, đem lại cảm giác mềm mịn dễ chịu trên da.', 3, 8, N'https://mint07.com/wp-content/uploads/2019/04/phan-phu-mac-studio-fix-powder-plus-foundation.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (134, N'Nước Tẩy Trang Loreal Revitalift HA 400ml', N'Nước Tẩy Trang Loreal Revitalift HA 400ml là dòng tẩy trang cao cấp dành cho riêng cho da khô, da hỗn hợp với khả năng làm sạch sâu nhờ công nghệ Micellar đột phá giúp hút sạch cặn trang điểm, bụi bẩn. Cùng khả năng cấp ẩm làm dịu da cho da vừa sạch vừa mềm mịn.', 4, 10, N'https://mint07.com/wp-content/uploads/2022/12/nuoc-tay-trang-loreal-revitalift-ha-400ml-1.webp')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (135, N'Nước Hoa Hồng Some By Mi AHA – BHA – PHA 30 Days Toner', N'Nước Hoa Hồng Some By Mi AHA – BHA – PHA 30 Days Toner giúp kháng viêm, cải thiện nhỏ lỗ chân lông, làm sáng da. Tăng cường độ ẩm giúp da không bị khô căng khó chịu, vậy nên chúng mình có thể sử dụng em ấy để đắp LOTION MASK cũng hợp lý lắm đó.', 35, 12, N'https://mint07.com/wp-content/uploads/2019/05/nuoc-hoa-hong-some-by-mi-aha-bha-pha-30-days.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (136, N'Serum L’Oreal Glycolic Bright 1.0% Glycolic Acid', N'Serum L’Oreal Glycolic Bright 1.0% Glycolic Acid là tinh chất dưỡng sáng da tức thì với công thức chứa 1.0% Glycolic Acid. Sản phẩm được chứng minh làm sáng và giúp da trông rạng rỡ hơn tức thì, giảm các vết thâm nám đối với làn da châu Á.', 4, 13, N'https://mint07.com/wp-content/uploads/2022/05/tinh-chat-lam-sang-l-oreal-glycolic-bright.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (137, N'Kem Dưỡng Skin1004 Madagascar Centella Soothing Cream 75ml', N'Kem Dưỡng Skin1004 Madagascar Centella Soothing Cream 75ml là kem dưỡng giúp làm dịu và giảm kích ứng dành riêng cho da dầu với chất gel lỏng như nước có màu nâu nhẹ giúp thấm thấu sâu và nhanh vào da mà không gây nhờn dính. Bảng thành phần chứa đến 72% chiết xuất rau má cùng 4 loại Ceramide có nguồn gốc từ thực vật và Sodium Hyaluronic giúp cung cấp độ ẩm, tăng cường sức đề kháng cho da luôn khoẻ mạnh và mềm mượt.', 27, 14, N'https://mint07.com/wp-content/uploads/2022/11/kem-duong-skin1004-madagascar-centella-soothing-cream-75ml.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (138, N'Kem Chống Nắng Dr.G Brightening Up Sun+ SPF50+ PA+++ 50ml', N'Kem Chống Nắng Dr.G Brightening Up Sun+ SPF50+ PA+++ 50ml là sản phẩm kem chống nắng vật lý lai hoá học có chỉ số chống nắng SPF50+ PA+++ giúp bảo vệ da mạnh mẽ trước các tác hại của tia UV và cả ánh sáng xanh. Ngoài ra, sản phẩm còn có khả năng kiềm soát dầu thừa, hạn chế bóng nhờn, giảm tắc nghẽn lỗ chân lông gây mụn cùng các thành phần dưỡng ẩm giúp cung cấp độ ẩm, làm mềm và làm dịu cho da, hạn chế tình trạng khô mốc da. Sản phẩm có chất kem có màu beige giúp nâng tone tự nhiên cho da tươi sáng rạng rỡ hơn.', 44, 16, N'https://mint07.com/wp-content/uploads/2023/04/kem-chong-nang-drg-brightening-up-sun-spf50-pa-50ml-5.jpg')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (140, N'sonbhdg', N'<p>djyg</p>', 16, 1, N'https://images2.thanhnien.vn/Uploaded/dieutrang-qc/2021_10_22/mai-han-duoc-my-pham-2-4439.png')
INSERT [dbo].[Product] ([id], [name], [description], [brand_id], [subcategory_id], [thumbnail]) VALUES (141, N'Son kem lì', N'<p>uhyg</p>', 16, 1, N'https://images2.thanhnien.vn/Uploaded/dieutrang-qc/2021_10_22/mai-han-duoc-my-pham-2-4439.png')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductModel] ON 

INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (1, 1, N'103 Fair', N'https://product.hstatic.net/200000198575/product/103_e7b660bbf1e1431682ca359a211a5292_master.jpg', 238, 215, 25)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (2, 1, N'108 Light Porcelain', N'https://product.hstatic.net/200000198575/product/108__1__c1f0a935c8c54bde884186e393489381_master.jpg', 245, 225, 38)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (3, 1, N'110 Porcelain', N'https://product.hstatic.net/200000198575/product/110_e7098f7726a44524bc0c3f590103a347_master.jpg', 238, 215, 35)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (4, 1, N'112 Natural Ivory', N'https://product.hstatic.net/200000198575/product/112__1__347f860b66f74304b2591566eec1d167_master.jpg', 238, 215, 30)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (5, 1, N'115 Ivory', N'https://product.hstatic.net/200000198575/product/115_66435742439548ca8fe5372a243a747e_master.jpg', 250, 230, 44)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (6, 1, N'118 Light Beige', N'https://product.hstatic.net/200000198575/product/118_bff7a206413448f193c506b316a967da_master.jpg', 238, 215, 30)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (7, 1, N'120 Classic Ivory', N'https://product.hstatic.net/200000198575/product/120_821cffdffd6047f48c240f6e8e9365a4_master.jpg', 238, 215, 35)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (8, 20, N'A49 – Pastel Rose', N'https://product.hstatic.net/1000006063/product/a49_c39905b7f20a4172a55bf6b649099706_1024x1024.jpg', 205, 160, 55)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (9, 20, N'A50 – Soldout Chili', N'https://product.hstatic.net/1000006063/product/a50_453fd73ddce94c27b9fae92c998a5d1f_1024x1024.jpg', 205, 160, 59)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (10, 20, N'A51 – Rad Brick', N'https://product.hstatic.net/1000006063/product/a50_453fd73ddce94c27b9fae92c998a5d1f_1024x1024.jpg', 235, 185, 69)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (11, 20, N'A52 – Cinnamon Brown', N'https://product.hstatic.net/1000006063/product/a52_6fe70bd60b794047ba2dad241acde537_1024x1024.jpg', 205, 160, 61)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (12, 22, N'#AL1. Aesthetic Plum', N'https://mint07.com/wp-content/uploads/2022/11/son-thoi-merzy-academia-cotton-lipstick-18g-al01-1.webp', 250, 180, 40)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (13, 22, N'#AL2. Beige Taupe', N'https://mint07.com/wp-content/uploads/2022/11/son-thoi-merzy-academia-cotton-lipstick-18g-al02-1.webp', 250, 180, 46)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (14, 22, N'#AL3. Inspired Red', N'https://mint07.com/wp-content/uploads/2022/11/son-thoi-merzy-academia-cotton-lipstick-18g-al03-1.webp', 250, 180, 37)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (15, 22, N'#AL4. Preppy Ruby', N'https://mint07.com/wp-content/uploads/2022/11/son-thoi-merzy-academia-cotton-lipstick-18g-al04-1.webp', 250, 180, 35)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (16, 22, N'#AL5. Dutch Tulips', N'https://mint07.com/wp-content/uploads/2022/11/son-thoi-merzy-academia-cotton-lipstick-18g-al05.webp', 250, 180, 50)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (17, 2, NULL, NULL, 330, 258, 199)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (18, 3, NULL, NULL, 1200, 990, 190)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (19, 4, NULL, NULL, 980, 780, 180)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (20, 5, NULL, NULL, 308, 259, 170)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (21, 6, NULL, NULL, 319, 278, 160)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (22, 128, NULL, NULL, 278, 270, 150)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (23, 8, NULL, NULL, 550, 450, 140)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (24, 9, NULL, NULL, 500, 370, 193)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (25, 10, NULL, NULL, 450, 330, 188)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (26, 11, NULL, NULL, 529, 400, 178)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (27, 12, NULL, NULL, 480, 400, 169)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (28, 13, NULL, NULL, 339, 280, 159)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (29, 129, NULL, NULL, 349, 299, 149)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (30, 15, NULL, NULL, 189, 169, 192)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (31, 16, NULL, NULL, 110, 95, 176)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (32, 17, NULL, NULL, 420, 379, 158)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (33, 18, NULL, NULL, 155, 139, 148)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (34, 19, NULL, NULL, 190, 160, 140)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (35, 21, NULL, NULL, 260, 165, 171)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (36, 131, NULL, NULL, 365, 340, 186)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (37, 24, NULL, NULL, 210, 159, 182)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (38, 25, NULL, NULL, 660, 590, 174)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (39, 130, NULL, NULL, 199, 169, 168)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (40, 27, NULL, NULL, 205, 165, 160)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (41, 28, NULL, NULL, 850, 750, 154)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (42, 29, NULL, NULL, 280, 215, 149)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (43, 30, NULL, NULL, 190, 155, 143)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (44, 31, NULL, NULL, 330, 270, 194)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (45, 132, NULL, NULL, 450, 349, 185)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (46, 33, NULL, NULL, 420, 320, 176)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (47, 34, NULL, NULL, 380, 320, 166)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (48, 35, NULL, NULL, 399, 369, 156)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (49, 36, NULL, NULL, 379, 330, 146)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (50, 37, NULL, NULL, 155, 139, 188)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (51, 38, NULL, NULL, 189, 170, 174)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (52, 39, NULL, NULL, 215, 190, 164)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (53, 40, NULL, NULL, 239, 195, 157)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (54, 41, NULL, NULL, 169, 140, 141)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (55, 42, NULL, NULL, 200, 179, 158)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (56, 43, NULL, NULL, 142, 125, 185)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (57, 44, NULL, NULL, 169, 145, 169)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (58, 45, NULL, NULL, 179, 159, 156)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (59, 46, NULL, NULL, 157, 120, 146)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (60, 47, NULL, NULL, 380, 320, 193)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (61, 48, NULL, NULL, 179, 135, 178)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (62, 133, NULL, NULL, 850, 760, 166)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (63, 50, NULL, NULL, 269, 219, 157)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (64, 51, NULL, NULL, 165, 139, 146)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (65, 52, NULL, NULL, 340, 305, 167)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (66, 53, NULL, NULL, 120, 90, 153)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (67, 54, NULL, NULL, 139, 95, 147)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (68, 55, NULL, NULL, 149, 115, 160)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (69, 56, NULL, NULL, 295, 239, 194)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (70, 57, NULL, NULL, 170, 155, 182)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (71, 58, NULL, NULL, 125, 105, 175)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (72, 134, NULL, NULL, 249, 229, 165)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (73, 60, NULL, NULL, 420, 365, 159)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (74, 61, NULL, NULL, 120, 95, 154)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (75, 62, NULL, NULL, 415, 360, 150)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (76, 63, NULL, NULL, 340, 290, 180)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (77, 64, NULL, NULL, 389, 330, 167)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (78, 65, NULL, NULL, 490, 430, 186)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (79, 66, NULL, NULL, 245, 189, 174)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (80, 67, NULL, NULL, 78, 69, 169)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (81, 68, NULL, NULL, 139, 129, 156)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (82, 69, NULL, NULL, 380, 349, 149)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (83, 70, NULL, NULL, 420, 360, 181)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (84, 71, NULL, NULL, 230, 185, 142)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (85, 72, NULL, NULL, 120, 99, 165)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (86, 73, NULL, NULL, 450, 415, 159)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (87, 74, NULL, NULL, 369, 229, 196)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (88, 75, NULL, NULL, 376, 312, 189)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (89, 76, NULL, NULL, 199, 149, 182)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (90, 135, NULL, NULL, 310, 263, 176)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (91, 78, NULL, NULL, 409, 389, 169)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (92, 79, NULL, NULL, 389, 359, 161)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (93, 80, NULL, NULL, 660, 540, 154)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (94, 81, NULL, NULL, 159, 120, 148)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (95, 82, NULL, NULL, 165, 135, 145)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (96, 83, NULL, NULL, 426, 399, 195)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (97, 84, NULL, NULL, 750, 665, 192)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (98, 85, NULL, NULL, 367, 341, 188)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (99, 86, NULL, NULL, 424, 354, 180)
GO
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (100, 87, NULL, NULL, 850, 749, 173)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (101, 88, NULL, NULL, 310, 289, 164)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (102, 136, NULL, NULL, 429, 399, 159)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (103, 90, NULL, NULL, 265, 215, 151)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (104, 91, NULL, NULL, 760, 635, 184)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (105, 92, NULL, NULL, 290, 255, 176)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (106, 93, NULL, NULL, 385, 339, 183)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (107, 94, NULL, NULL, 280, 260, 193)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (108, 137, NULL, NULL, 420, 369, 173)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (109, 96, NULL, NULL, 260, 230, 167)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (110, 97, NULL, NULL, 499, 449, 159)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (111, 98, NULL, NULL, 289, 245, 150)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (112, 99, NULL, NULL, 330, 289, 148)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (113, 100, NULL, NULL, 550, 420, 146)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (114, 101, NULL, NULL, 35, 29, 191)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (115, 102, NULL, NULL, 27, 21, 185)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (116, 103, NULL, NULL, 32, 27, 170)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (117, 104, NULL, NULL, 27, 23, 163)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (118, 105, NULL, NULL, 25, 20, 154)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (119, 138, NULL, NULL, 530, 398, 194)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (120, 107, NULL, NULL, 395, 329, 194)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (121, 108, NULL, NULL, 440, 380, 186)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (122, 109, NULL, NULL, 379, 289, 183)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (123, 110, NULL, NULL, 278, 229, 178)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (124, 111, NULL, NULL, 349, 299, 173)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (125, 112, NULL, NULL, 299, 250, 166)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (126, 113, NULL, NULL, 180, 169, 161)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (127, 114, NULL, NULL, 200, 188, 151)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (128, 115, NULL, NULL, 115, 99, 144)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (129, 116, NULL, NULL, 245, 220, 150)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (130, 117, NULL, NULL, 185, 125, 187)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (131, 118, NULL, NULL, 160, 145, 152)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (132, 119, NULL, NULL, 355, 305, 177)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (133, 120, NULL, NULL, 167, 148, 145)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (134, 121, NULL, NULL, 210, 179, 141)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (135, 122, NULL, NULL, 250, 199, 172)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (136, 123, NULL, NULL, 279, 249, 162)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (137, 124, NULL, NULL, 300, 245, 188)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (138, 125, NULL, NULL, 160, 135, 167)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (139, 126, NULL, NULL, 380, 339, 183)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (140, 127, NULL, NULL, 195, 175, 155)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (149, 140, NULL, NULL, 200, 180, 20)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (150, 141, N'1', N'https://artia.vn/wp-content/uploads/2020/11/my-pham-Skincare-1200x800.jpg', 300, 250, 30)
INSERT [dbo].[ProductModel] ([id], [product_id], [variant], [image], [origin_price], [sale_price], [quantity]) VALUES (151, 141, N'2', N'https://artia.vn/wp-content/uploads/2020/11/my-pham-Skincare-1200x800.jpg', 350, 250, 23)
SET IDENTITY_INSERT [dbo].[ProductModel] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (1, N'Kem nền', 1, N'images/home/Sub.jpg')
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (2, N'Phấn nước', 1, N'images/home/Sub1.jpg')
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (3, N'Che khuyết điểm', 1, NULL)
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (4, N'Son Môi', 1, N'//theme.hstatic.net/1000006063/1000748098/14/home_category_1_medium.png?v=12447')
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (5, N'Phấn mắt', 1, NULL)
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (6, N'Chuốt mi', 1, NULL)
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (7, N'Kẻ mắt', 1, NULL)
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (8, N'Phấn phủ', 1, NULL)
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (9, N'Dụng cụ trang điểm', 1, NULL)
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (10, N'Tẩy trang', 2, N'//theme.hstatic.net/1000006063/1000748098/14/home_category_11_medium.png?v=12447')
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (11, N'Sữa rửa mặt', 2, N'//theme.hstatic.net/1000006063/1000748098/14/home_category_5_medium.png?v=12447')
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (12, N'Nước hoa hồng', 2, N'//theme.hstatic.net/1000006063/1000748098/14/home_category_6_medium.png?v=12447')
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (13, N'Tinh chất', 2, N'//theme.hstatic.net/1000006063/1000748098/14/home_category_2_medium.png?v=12447')
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (14, N'Kem dưỡng', 2, N'//theme.hstatic.net/1000006063/1000748098/14/home_category_4_medium.png?v=12447')
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (15, N'Mặt nạ', 2, N'//theme.hstatic.net/1000006063/1000748098/14/home_category_3_medium.png?v=12447')
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (16, N'Kem chống nắng', 2, N'//theme.hstatic.net/1000006063/1000748098/14/home_category_9_medium.png?v=12447')
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (17, N'Sữa tắm', 3, NULL)
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (18, N'Tẩy da chết', 3, N'//theme.hstatic.net/1000006063/1000748098/14/home_category_8_medium.png?v=12447')
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (19, N'Dưỡng thể', 3, N'//theme.hstatic.net/1000006063/1000748098/14/home_category_10_medium.png?v=12447')
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (20, N'Dầu gội', 3, NULL)
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (21, N'Dầu xả', 3, NULL)
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (22, N'Kem ủ tóc', 3, NULL)
INSERT [dbo].[SubCategory] ([id], [subcategory_name], [category_id], [image]) VALUES (24, N'123', 1, NULL)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (1, N'Hoang Mai Dung', N'maidung', N'e10adc3949ba59abbe56e057f20f883e', N'maidung@gmail.com', N'0834235369', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 2)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (2, N'Trần Thị Bình', N'tranbinh', N'202CB962AC59075B964B07152D234B70', N'tranbinh@gmail.com', N'0987654321', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 1)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (3, N'Nguyễn Thị Hoa', N'nguyenhoa', N'202CB962AC59075B964B07152D234B70', N'nguyenhoa@gmail.com', N'0987123456', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 1)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (4, N'Vũ Thị Mai', N'vumai', N'202CB962AC59075B964B07152D234B70', N'vumai@gmail.com', N'0987654321', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 1)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (5, N'Nguyễn Thị Ngọc', N'nguyenngoc', N'202CB962AC59075B964B07152D234B70', N'nguyenngoc@gmail.com', N'0987654321', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 1)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (6, N'Phạm Thị Ánh', N'phamanh', N'202CB962AC59075B964B07152D234B70', N'phamanh@gmail.com', N'0987654321', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', -3)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (7, N'Đỗ Văn Quang', N'doquang', N'202CB962AC59075B964B07152D234B70', N'doquang@gmail.com', N'0912345678', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 1)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (8, N'Lê Vân Khánh', N'vankhanh', N'202CB962AC59075B964B07152D234B70', N'vankhanh@gmail.com', N'0912345678', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 1)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (9, N'Phạm Thị Thủy', N'phamthuy', N'202CB962AC59075B964B07152D234B70', N'phamthuy@gmail.com', N'0987654321', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 1)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (10, N'Trần Thị Hồng', N'tranhong', N'202CB962AC59075B964B07152D234B70', N'tranhong@gmail.com', N'0912345678', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 1)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (11, N'Phạm Thị Thanh', N'phamthanh', N'202CB962AC59075B964B07152D234B70', N'phamthanh@gmail.com', N'0912345678', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 1)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (12, N'Nguyễn Hồng Vân', N'hongvan', N'202CB962AC59075B964B07152D234B70', N'hongvan@gmail.com', N'0123456798', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 1)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (13, N'Nguyễn Thị Quỳnh', N'quynhnt', N'202CB962AC59075B964B07152D234B70', N'quynhnt@gmail.com', N'0123456789', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 1)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (18, N'dung', N'dung', N'202CB962AC59075B964B07152D234B70', N'maidung1602@gmail.com', N'0123456747', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 1)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (19, N'Nguyễn Thị Ngọc Mai', N'ngocmai', N'202CB962AC59075B964B07152D234B70', N'ngocmai@gmail.com', N'0123456387', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 1)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (20, N'Quản lý', N'admin', N'e10adc3949ba59abbe56e057f20f883e', N'admin@gmail.com', N'0398726465', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 3)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (21, N'Nguyễn Lê Quỳnh Trang', N'quynhtrang', N'202CB962AC59075B964B07152D234B70', N'maidung1602@gmail.com', N'097473645', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 1)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (22, N'Lại Khánh Trang', N'khanhtrang', N'202CB962AC59075B964B07152D234B70', N'khanhtrang@gmail.com', N'0123456789', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 1)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (23, N'Phạm Ánh Nguyệt', N'anhnguyet', N'202CB962AC59075B964B07152D234B70', N'anhnguyet@gmail.com', N'0123456789', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 2)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (24, N'Mai Thị Hoa', N'maihoa', N'202CB962AC59075B964B07152D234B70', N'maihoa@gmail.com', N'0123456789', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 3)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (25, N'dunghmhe17657', N'dunghmhe176572@fpt.edu.vn', N'08038D0C80E726994145DDB924EFBE1C', N'dunghmhe176572@fpt.edu.vn', N'', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 1)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (26, N'maidung1602', N'maidung1602@gmail.com', N'CDD0AEC68C9DA3C9967233BFCE688402', N'maidung1602@gmail.com', NULL, N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 1)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (27, N'Mai Thị Hoa', N'maihoa2', N'81DC9BDB52D04DC20036DBD8313ED055', N'maihoa@gmail.com', N'0123456789', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 1)
INSERT [dbo].[User] ([id], [name], [username], [password], [email], [phone_number], [avatar], [is_admin]) VALUES (28, N'Đặng Châu Anh', N'chauanh', N'202CB962AC59075B964B07152D234B70', N'chauanh@gmail.com', N'0123456789', N'images/home/avatar-doi-ban-than-2021-182-696x696.webp', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([order_id])
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
