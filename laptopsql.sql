
USE laptopsql
GO
/****** Object:  Table [dbo].[_Order]    Script Date: 5/28/2024 6:03:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Order](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[staffID] [int] NULL,
	[customerID] [int] NULL,
	[timeOrder] [datetime] NULL,
	[method] [nvarchar](30) NULL,
	[fee] [int] NULL,
	[total] [int] NULL,
	[status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 5/28/2024 6:03:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accountID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[role] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/28/2024 6:03:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[birthDate] [date] NULL,
	[gender] [bit] NULL,
	[address] [nvarchar](70) NULL,
	[phoneNumber] [varchar](15) NULL,
	[accountStatus] [nvarchar](30) NULL,
 CONSTRAINT [PK_Customer_1] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 5/28/2024 6:03:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[discountID] [int] IDENTITY(1,1) NOT NULL,
	[nameDiscount] [nvarchar](100) NULL,
	[ngayBatDau] [datetime] NULL,
	[ngayKetThuc] [datetime] NULL,
	[per_cent] [int] NOT NULL,
 CONSTRAINT [PK__Discount__D2130A0679E6222E] PRIMARY KEY CLUSTERED 
(
	[discountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Export]    Script Date: 5/28/2024 6:03:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Export](
	[exportID] [int] IDENTITY(1,1) NOT NULL,
	[staffID] [int] NULL,
	[managerID] [int] NULL,
	[orderID] [int] NULL,
	[pickUpTime] [datetime] NULL,
	[status] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[exportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Import]    Script Date: 5/28/2024 6:03:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import](
	[importID] [int] IDENTITY(1,1) NOT NULL,
	[managerID] [int] NULL,
	[importDate] [datetime] NULL,
	[total] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[importID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 5/28/2024 6:03:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[managerID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NULL,
	[fullName] [nvarchar](50) NULL,
	[birthDate] [date] NULL,
	[gender] [bit] NULL,
	[address] [nvarchar](70) NULL,
	[phoneNumber] [varchar](15) NULL,
	[experience] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[managerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderDetail]    Script Date: 5/28/2024 6:03:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetail](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[productID] [varchar](30) NULL,
	[quantity] [int] NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 5/28/2024 6:03:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[paymentID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[paymentTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/28/2024 6:03:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [varchar](30) NOT NULL,
	[name] [nvarchar](100) NULL,
	[brand] [nvarchar](50) NULL,
	[price] [int] NULL,
	[quantity] [int] NULL,
	[color] [nvarchar](15) NULL,
	[ram] [nvarchar](100) NULL,
	[memory] [nvarchar](100) NULL,
	[specID] [varchar](50) NULL,
	[img] [varchar](30) NULL,
	[type] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Discount]    Script Date: 5/28/2024 6:03:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Discount](
	[productID] [varchar](30) NOT NULL,
	[discountID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC,
	[discountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImport]    Script Date: 5/28/2024 6:03:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImport](
	[importID] [int] NOT NULL,
	[productID] [varchar](30) NOT NULL,
	[priceImport] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[importID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 5/28/2024 6:03:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[reviewID] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [varchar](30) NULL,
	[star] [int] NULL,
	[cmtCustomer] [nvarchar](100) NULL,
	[nameCustomer] [nvarchar](100) NULL,
	[cmtTime] [datetime] NULL,
 CONSTRAINT [PK__Review__2ECD6E24FC0966EA] PRIMARY KEY CLUSTERED 
(
	[reviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specification]    Script Date: 5/28/2024 6:03:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specification](
	[SpecID] [varchar](50) NOT NULL,
	[CPU] [nvarchar](150) NULL,
	[GPU] [nvarchar](100) NULL,
	[OS] [nvarchar](50) NULL,
	[screen] [varchar](100) NULL,
	[pin] [varchar](100) NULL,
	[camera] [nvarchar](max) NULL,
	[size] [nvarchar](200) NULL,
	[warrantly] [int] NULL,
	[sound] [nvarchar](max) NULL,
	[weight] [varchar](30) NULL,
	[conectivityTechnologies] [nvarchar](max) NULL,
	[charge] [nvarchar](100) NULL,
	[yearOfDebut] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SpecID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 5/28/2024 6:03:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[staffID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NULL,
	[fullName] [nvarchar](50) NULL,
	[birthDate] [date] NULL,
	[gender] [bit] NULL,
	[address] [nvarchar](70) NULL,
	[phoneNumber] [varchar](15) NULL,
	[salary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[staffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 5/28/2024 6:03:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[customerID] [int] NOT NULL,
	[productID] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customerID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_Order] ON 

INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (4, NULL, 10, CAST(N'2024-05-14T00:00:00.000' AS DateTime), N'KXÐ', 0, 0, N'Chua hoàn thành')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (5, NULL, 10, CAST(N'2024-05-14T22:24:28.500' AS DateTime), N'KXĐ', 0, 0, N'Chưa hoàn thành')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (6, NULL, 10, CAST(N'2024-05-14T22:37:26.500' AS DateTime), N'COD', 0, 0, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (7, NULL, 0, CAST(N'2024-05-16T18:34:33.670' AS DateTime), N'COD', 0, 0, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (8, NULL, 2, CAST(N'2024-05-16T18:37:20.427' AS DateTime), N'COD', 0, 0, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (9, NULL, 2, CAST(N'2024-05-16T18:37:38.450' AS DateTime), N'COD', 0, 0, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (10, NULL, 2, CAST(N'2024-05-16T18:37:45.950' AS DateTime), N'COD', 0, 0, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (11, NULL, 2, CAST(N'2024-05-16T18:45:00.300' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (12, NULL, 2, CAST(N'2024-05-16T18:45:00.387' AS DateTime), N'COD', 0, 32490000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (13, NULL, 2, CAST(N'2024-05-16T18:45:00.460' AS DateTime), N'COD', 0, 36990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (14, NULL, 2, CAST(N'2024-05-16T18:59:49.043' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (15, NULL, 2, CAST(N'2024-05-16T18:59:49.130' AS DateTime), N'COD', 0, 31490000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (16, NULL, 2, CAST(N'2024-05-16T18:59:49.183' AS DateTime), N'COD', 0, 23990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (17, NULL, 2, CAST(N'2024-05-16T19:20:34.177' AS DateTime), N'COD', 0, 12190000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (18, NULL, 2, CAST(N'2024-05-16T19:20:34.297' AS DateTime), N'COD', 0, 17990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (19, NULL, 2, CAST(N'2024-05-16T19:20:34.333' AS DateTime), N'COD', 0, 23990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (20, NULL, 2, CAST(N'2024-05-17T17:02:22.853' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (21, NULL, 2, CAST(N'2024-05-17T17:02:23.717' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (22, NULL, 2, CAST(N'2024-05-17T17:07:43.430' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (23, NULL, 2, CAST(N'2024-05-17T17:07:43.780' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (24, NULL, 2, CAST(N'2024-05-17T17:07:44.067' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (25, NULL, 2, CAST(N'2024-05-17T17:11:17.203' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (26, NULL, 2, CAST(N'2024-05-17T18:36:00.590' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (27, NULL, 2, CAST(N'2024-05-17T18:36:27.373' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (28, NULL, 2, CAST(N'2024-05-17T18:36:30.710' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (29, NULL, 2, CAST(N'2024-05-17T18:37:02.427' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (30, NULL, 2, CAST(N'2024-05-17T18:56:44.303' AS DateTime), N'COD', 0, 87980000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (31, NULL, 2, CAST(N'2024-05-17T18:56:44.530' AS DateTime), N'COD', 0, 59980000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (32, NULL, 2, CAST(N'2024-05-17T18:56:47.830' AS DateTime), N'COD', 0, 87980000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (33, NULL, 2, CAST(N'2024-05-17T18:56:47.847' AS DateTime), N'COD', 0, 59980000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (34, NULL, 2, CAST(N'2024-05-17T18:56:47.953' AS DateTime), N'COD', 0, 87980000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (35, NULL, 2, CAST(N'2024-05-17T18:56:47.960' AS DateTime), N'COD', 0, 59980000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (36, NULL, 2, CAST(N'2024-05-17T18:56:48.023' AS DateTime), N'COD', 0, 87980000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (37, NULL, 2, CAST(N'2024-05-17T18:56:48.033' AS DateTime), N'COD', 0, 59980000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (38, NULL, 2, CAST(N'2024-05-17T18:56:48.197' AS DateTime), N'COD', 0, 87980000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (39, NULL, 2, CAST(N'2024-05-17T18:56:48.210' AS DateTime), N'COD', 0, 59980000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (40, NULL, 2, CAST(N'2024-05-17T18:57:00.760' AS DateTime), N'COD', 0, 87980000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (41, NULL, 2, CAST(N'2024-05-17T18:57:00.777' AS DateTime), N'COD', 0, 59980000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (42, NULL, 2, CAST(N'2024-05-17T18:58:47.693' AS DateTime), N'COD', 0, 87980000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (43, NULL, 2, CAST(N'2024-05-17T18:58:47.713' AS DateTime), N'COD', 0, 59980000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (44, NULL, 2, CAST(N'2024-05-17T18:59:53.700' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (45, NULL, 2, CAST(N'2024-05-17T19:05:37.267' AS DateTime), N'COD', 0, 31490000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (46, NULL, 2, CAST(N'2024-05-17T19:05:45.630' AS DateTime), N'COD', 0, 31490000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (47, NULL, 2, CAST(N'2024-05-17T19:11:43.637' AS DateTime), N'COD', 0, 29990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (48, NULL, 2, CAST(N'2024-05-17T19:18:27.687' AS DateTime), N'COD', 0, 29990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (49, NULL, 2, CAST(N'2024-05-17T19:18:27.703' AS DateTime), N'COD', 0, 31490000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (50, NULL, 2, CAST(N'2024-05-17T19:18:27.717' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (51, NULL, 2, CAST(N'2024-05-17T19:19:43.433' AS DateTime), N'COD', 0, 29990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (52, NULL, 2, CAST(N'2024-05-17T19:19:43.450' AS DateTime), N'COD', 0, 31490000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (53, NULL, 2, CAST(N'2024-05-17T19:19:43.460' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (54, NULL, 2, CAST(N'2024-05-17T19:39:56.463' AS DateTime), N'COD', 0, 62980000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (55, NULL, 2, CAST(N'2024-05-17T19:40:52.130' AS DateTime), N'COD', 0, 62980000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (56, NULL, 2, CAST(N'2024-05-25T08:00:28.563' AS DateTime), N'COD', 0, 62980000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (57, NULL, 2, CAST(N'2024-05-25T08:19:18.617' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (58, NULL, 2, CAST(N'2024-05-25T08:19:58.377' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (59, NULL, 2, CAST(N'2024-05-25T22:47:10.817' AS DateTime), N'COD', 0, 29990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (60, NULL, 2, CAST(N'2024-05-25T22:49:54.007' AS DateTime), N'COD', 0, 29990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (61, NULL, 2, CAST(N'2024-05-25T22:51:51.430' AS DateTime), N'COD', 0, 29990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (62, NULL, 2, CAST(N'2024-05-25T22:51:57.027' AS DateTime), N'COD', 0, 31490000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (63, NULL, 2, CAST(N'2024-05-25T22:52:02.817' AS DateTime), N'COD', 0, 29990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (64, NULL, 2, CAST(N'2024-05-25T22:52:03.963' AS DateTime), N'COD', 0, 31490000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (65, NULL, 2, CAST(N'2024-05-25T22:54:33.890' AS DateTime), N'COD', 0, 87980000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (66, NULL, 2, CAST(N'2024-05-25T22:55:28.383' AS DateTime), N'COD', 0, 131970000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (67, NULL, 2, CAST(N'2024-05-25T22:57:22.930' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (68, NULL, 2, CAST(N'2024-05-25T22:59:33.630' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (69, NULL, 2, CAST(N'2024-05-25T22:59:38.313' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (70, NULL, 2, CAST(N'2024-05-25T23:02:45.103' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (71, NULL, 2, CAST(N'2024-05-27T06:08:41.213' AS DateTime), N'COD', 0, 31490000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (72, NULL, 2, CAST(N'2024-05-27T08:43:03.197' AS DateTime), N'COD', 0, 87980000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (73, NULL, 2, CAST(N'2024-05-27T08:43:03.300' AS DateTime), N'COD', 0, 32490000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (74, NULL, 2, CAST(N'2024-05-27T08:43:03.310' AS DateTime), N'COD', 0, 15490000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (75, NULL, 2, CAST(N'2024-05-27T08:53:37.937' AS DateTime), N'COD', 0, 15490000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (76, NULL, 2, CAST(N'2024-05-27T08:53:37.950' AS DateTime), N'COD', 0, 36990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (77, NULL, 2, CAST(N'2024-05-27T08:53:37.957' AS DateTime), N'COD', 0, 29990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (78, NULL, 2, CAST(N'2024-05-27T08:54:18.190' AS DateTime), N'COD', 0, 15490000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (79, NULL, 2, CAST(N'2024-05-27T08:54:18.210' AS DateTime), N'COD', 0, 36990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (80, NULL, 2, CAST(N'2024-05-27T08:54:18.220' AS DateTime), N'COD', 0, 29990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (81, NULL, 2, CAST(N'2024-05-27T09:04:52.890' AS DateTime), N'COD', 0, 15490000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (82, NULL, 2, CAST(N'2024-05-27T09:04:52.907' AS DateTime), N'COD', 0, 36990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (83, NULL, 2, CAST(N'2024-05-27T09:04:53.010' AS DateTime), N'COD', 0, 59980000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (84, NULL, 2, CAST(N'2024-05-27T09:04:53.103' AS DateTime), N'COD', 0, 31490000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (85, NULL, 2, CAST(N'2024-05-27T10:15:33.673' AS DateTime), N'COD', 0, 76480000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (86, NULL, 2, CAST(N'2024-05-27T10:15:39.563' AS DateTime), N'COD', 0, 76480000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (87, NULL, 2, CAST(N'2024-05-28T10:25:12.710' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (88, NULL, 2, CAST(N'2024-05-28T10:32:31.170' AS DateTime), N'COD', 0, 43990000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (89, NULL, 2, CAST(N'2024-05-28T12:40:50.010' AS DateTime), N'COD', 0, 38580000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (90, NULL, 2, CAST(N'2024-05-28T12:40:53.923' AS DateTime), N'COD', 0, 38580000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (91, NULL, 2, CAST(N'2024-05-28T12:43:54.290' AS DateTime), N'COD', 0, 38580000, N'Chờ xác nhận')
INSERT [dbo].[_Order] ([orderID], [staffID], [customerID], [timeOrder], [method], [fee], [total], [status]) VALUES (92, NULL, 2, CAST(N'2024-05-28T12:44:00.800' AS DateTime), N'COD', 0, 38580000, N'Chờ xác nhận')
SET IDENTITY_INSERT [dbo].[_Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accountID], [userName], [password], [email], [role]) VALUES (8, N'a', N'1', N'cc@cc.com', N'Guest')
INSERT [dbo].[Account] ([accountID], [userName], [password], [email], [role]) VALUES (9, N'db yeu', N'123456', N'dattran10102k4@gmail.com', N'Guest')
INSERT [dbo].[Account] ([accountID], [userName], [password], [email], [role]) VALUES (10, N'A_0', N'A_2', N'A_0', N'A_2')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([customerID], [accountID], [fullName], [birthDate], [gender], [address], [phoneNumber], [accountStatus]) VALUES (2, 8, N'Huy', CAST(N'2004-06-19' AS Date), 1, N'282 Hà Huy Tập', N'05113713271', N'Kích ho?t')
INSERT [dbo].[Customer] ([customerID], [accountID], [fullName], [birthDate], [gender], [address], [phoneNumber], [accountStatus]) VALUES (3, 9, N'Trần Nguyên Đạt', CAST(N'2000-01-01' AS Date), 1, N'Quảng Nam', N'0704631137', N'Kích hoạt')
INSERT [dbo].[Customer] ([customerID], [accountID], [fullName], [birthDate], [gender], [address], [phoneNumber], [accountStatus]) VALUES (4, 10, N'A_0', CAST(N'2024-05-11' AS Date), 1, N'A_2', N'A_0', N'A_1')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([discountID], [nameDiscount], [ngayBatDau], [ngayKetThuc], [per_cent]) VALUES (1, N'Summer Sale', CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(N'2024-06-30T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Discount] ([discountID], [nameDiscount], [ngayBatDau], [ngayKetThuc], [per_cent]) VALUES (2, N'Back to School', CAST(N'2024-08-01T00:00:00.000' AS DateTime), CAST(N'2024-08-31T00:00:00.000' AS DateTime), 15)
INSERT [dbo].[Discount] ([discountID], [nameDiscount], [ngayBatDau], [ngayKetThuc], [per_cent]) VALUES (3, N'Black Friday', CAST(N'2024-11-25T00:00:00.000' AS DateTime), CAST(N'2024-11-29T00:00:00.000' AS DateTime), 20)
INSERT [dbo].[Discount] ([discountID], [nameDiscount], [ngayBatDau], [ngayKetThuc], [per_cent]) VALUES (4, N'Christmas Sale', CAST(N'2024-12-20T00:00:00.000' AS DateTime), CAST(N'2024-12-25T00:00:00.000' AS DateTime), 25)
INSERT [dbo].[Discount] ([discountID], [nameDiscount], [ngayBatDau], [ngayKetThuc], [per_cent]) VALUES (5, N'New Year Sale', CAST(N'2024-12-31T00:00:00.000' AS DateTime), CAST(N'2025-01-01T00:00:00.000' AS DateTime), 30)
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[orderDetail] ON 

INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (4, 4, N'ASUSROGSTRIX16-02', 10000000, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (5, 5, N'ASUSROGSTRIX16-02', 10000000, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (6, 6, N'ASUSROGSTRIX16-02', 0, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (7, 7, N'ASUSROGSTRIX16-03', 43990000, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (8, 8, N'ASUSROGSTRIX16-03', 43990000, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (9, 9, N'ASUSROGSTRIX16-01', 31490000, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (10, 10, N'ASUSROGSTRIX16-02', 36990000, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (11, 11, N'ASUSROGSTRIX16-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (12, 12, N'ASUSTUFF15-01', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (13, 13, N'ASUSROGSTRIX16-02', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (14, 14, N'ASUSROGSTRIX16-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (15, 15, N'ASUSROGSTRIX16-01', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (16, 16, N'IP12-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (17, 17, N'IP12-01', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (18, 18, N'IP12-02', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (19, 19, N'IP12-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (20, 20, N'ASUSROGSTRIX16-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (21, 21, N'ASUSROGSTRIX16-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (22, 22, N'ASUSROGSTRIX16-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (23, 23, N'ASUSROGSTRIX16-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (24, 24, N'ASUSROGSTRIX16-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (25, 25, N'ASUSROGSTRIX16-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (26, 26, N'ASUSROGSTRIX16-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (27, 27, N'ASUSROGSTRIX16-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (28, 28, N'ASUSROGSTRIX16-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (29, 29, N'ASUSROGSTRIX16-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (30, 30, N'ASUSROGSTRIX16-03', 2, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (31, 31, N'ASUSTUFF15-02', 2, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (32, 32, N'ASUSROGSTRIX16-03', 2, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (33, 33, N'ASUSTUFF15-02', 2, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (34, 34, N'ASUSROGSTRIX16-03', 2, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (35, 35, N'ASUSTUFF15-02', 2, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (36, 36, N'ASUSROGSTRIX16-03', 2, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (37, 37, N'ASUSTUFF15-02', 2, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (38, 38, N'ASUSROGSTRIX16-03', 2, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (39, 39, N'ASUSTUFF15-02', 2, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (40, 40, N'ASUSROGSTRIX16-03', 2, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (41, 41, N'ASUSTUFF15-02', 2, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (42, 42, N'ASUSROGSTRIX16-03', 2, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (43, 43, N'ASUSTUFF15-02', 2, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (44, 44, N'ASUSROGSTRIX16-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (45, 45, N'ASUSROGSTRIX16-01', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (46, 46, N'ASUSROGSTRIX16-01', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (47, 47, N'ASUSTUFF15-02', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (48, 48, N'ASUSTUFF15-02', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (49, 49, N'ASUSROGSTRIX16-01', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (50, 50, N'ASUSROGSTRIX16-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (51, 51, N'ASUSTUFF15-02', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (52, 52, N'ASUSROGSTRIX16-01', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (53, 53, N'ASUSROGSTRIX16-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (54, 54, N'ASUSROGSTRIX16-01', 2, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (55, 55, N'ASUSROGSTRIX16-01', 2, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (56, 56, N'ASUSROGSTRIX16-01', 2, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (57, 57, N'ASUSROGSTRIX16-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (58, 58, N'ASUSROGSTRIX16-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (59, 59, N'ASUSTUFF15-02', 1, 0)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (60, 60, N'ASUSTUFF15-02', 1, 0)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (61, 61, N'ASUSTUFF15-02', 1, 0)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (62, 62, N'ASUSROGSTRIX16-01', 1, 0)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (63, 63, N'ASUSTUFF15-02', 1, 0)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (64, 64, N'ASUSROGSTRIX16-01', 1, 0)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (65, 65, N'ASUSROGSTRIX16-03', 2, 0)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (66, 66, N'ASUSROGSTRIX16-03', 3, 0)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (67, 67, N'ASUSROGSTRIX16-03', 1, 0)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (68, 68, N'ASUSROGSTRIX16-03', 1, 0)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (69, 69, N'ASUSROGSTRIX16-03', 1, 0)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (70, 70, N'ASUSROGSTRIX16-03', 1, 43990000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (71, 71, N'ASUSROGSTRIX16-01', 1, 31490000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (72, 72, N'ASUSROGSTRIX16-03', 2, 43990000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (73, 73, N'ASUSTUFF15-01', 1, 32490000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (74, 74, N'ASUSVIVO15OLED-01', 1, 15490000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (75, 75, N'ASUSVIVO15OLED-01', 1, 15490000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (76, 76, N'ASUSROGSTRIX16-02', 1, 36990000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (77, 77, N'ASUSTUFF15-02', 1, 29990000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (78, 78, N'ASUSVIVO15OLED-01', 1, 15490000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (79, 79, N'ASUSROGSTRIX16-02', 1, 36990000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (80, 80, N'ASUSTUFF15-02', 1, 29990000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (81, 81, N'ASUSVIVO15OLED-01', 1, 15490000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (82, 82, N'ASUSROGSTRIX16-02', 1, 36990000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (83, 83, N'ASUSTUFF15-02', 2, 29990000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (84, 84, N'ASUSROGSTRIX16-01', 1, 31490000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (85, 85, N'ASUSROGSTRIX16-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (86, 85, N'ASUSTUFF15-01', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (87, 86, N'ASUSROGSTRIX16-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (88, 86, N'ASUSTUFF15-01', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (89, 87, N'ASUSROGSTRIX16-03', 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (90, 88, N'ASUSROGSTRIX16-03', 1, 43990000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (91, 89, N'ASUSTUFF15-05', 1, 20990000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (92, 89, N'ASUSVIVO15OLED-02', 1, 17590000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (93, 90, N'ASUSTUFF15-05', 1, 20990000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (94, 90, N'ASUSVIVO15OLED-02', 1, 17590000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (95, 91, N'ASUSTUFF15-05', 1, 20990000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (96, 91, N'ASUSVIVO15OLED-02', 1, 17590000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (97, 92, N'ASUSTUFF15-05', 1, 20990000)
INSERT [dbo].[orderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (98, 92, N'ASUSVIVO15OLED-02', 1, 17590000)
SET IDENTITY_INSERT [dbo].[orderDetail] OFF
GO
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'ASUSROGSTRIX16-01', N'ASUS ROG Strix G16 i5-13450HX RTX 4050', N'Asus', 31490000, 10, N'Đen', N'8GB DDR5-4800 SO-DIMM', N'512GB NVMe M.2 SSD', N'ASUSROGSTRIXG16-G614JU-N3135W', N'asusrogstrixg16.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'ASUSROGSTRIX16-02', N'ASUS ROG Strix G16 i7-13650HX RTX 4050', N'Asus', 36990000, 10, N'Đen', N'16GB DDR5-4800 SO-DIMM', N'512GB NVMe M.2 SSD', N'ASUSROGSTRIXG16-G614JU-N3777W', N'asusrogstrixg16.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'ASUSROGSTRIX16-03', N'ASUS ROG Strix G16 i7-13650HX RTX 4070', N'Asus', 43990000, 10, N'Đen', N'16GB DDR5-4800 SO-DIMM', N'1TB NVMe M.2 SSD', N'ASUSROGSTRIXG16-G614JI-N4084W', N'asusrogstrixg16.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'ASUSTUFF15-01', N'ASUS TUF Gaming F15 i9-13900H RTX4060', N'Asus', 32490000, 10, N'Đen', N'16GB DDR4-3200Mhz Nâng cấp tối đa 32GB', N'512GB NVMe M.2 SSD ( 1 khe SSD M.2 trống nâng cấp tối đa 2TB)', N'ASUSTUF15-FX507VV4-LP382W', N'asustufgamingf15.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'ASUSTUFF15-02', N'ASUS TUF Gaming F15 i7-13620H RTX4060', N'Asus', 29990000, 10, N'Đen', N'16GB DDR5-4800Mhz (Nâng cấp tối đa 32GB)', N'512GB NVMe M.2 SSD ( 1 khe SSD M.2 trống nâng cấp tối đa 2TB)', N'ASUSTUF15-FX507VV-LP157W', N'asustufgamingf15.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'ASUSTUFF15-03', N'ASUS TUF Gaming F15 i7-12700H RTX4060', N'Asus', 28390000, 10, N'Đen', N'16GB DDR4-3200Mhz (Nâng cấp tối đa 32GB)', N'512GB NVMe M.2 SSD ( 1 khe SSD M.2 trống nâng cấp tối đa 2TB)', N'ASUSTUF15-FX507ZV4-LP042W', N'asustufgamingf15.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'ASUSTUFF15-04', N'ASUS TUF Gaming F15 i7-12700H RTX4050', N'Asus', 25990000, 10, N'Đen', N'16GB DDR4-3200Mhz (Nâng cấp tối đa 32GB)', N'512GB NVMe M.2 SSD ( 1 khe SSD M.2 trống nâng cấp tối đa 2TB)', N'ASUSTUF15-FX507ZU4-LP054W', N'asustufgamingf15.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'ASUSTUFF15-05', N'ASUS TUF Gaming F15 i7-12700H RTX3050', N'Asus', 20990000, 10, N'Đen', N'8GB DDR4-3200Mhz (Nâng cấp tối đa 32GB)', N'512GB NVMe M.2 SSD ( 1 khe SSD M.2 trống nâng cấp tối đa 1TB)', N'ASUSTUF15-FX507ZC4-HN099W', N'asustufgamingf15.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'ASUSTUFF15-06', N'ASUS TUF Gaming F15 i5-12500H RTX3050', N'Asus', 19490000, 10, N'Đen', N'8GB DDR4-3200Mhz (Nâng cấp tối đa 32GB)', N'512GB NVMe M.2 SSD ( 1 khe SSD M.2 trống nâng cấp tối đa 1TB)', N'ASUSTUF15-FX507ZC4-HN074W', N'asustufgamingf15.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'ASUSVIVO15OLED-01', N'ASUS Vivobook 15 OLED i5-12500H', N'Asus', 15490000, 10, N'Đen', N'8GB DDR4-3200Mhz (Nâng cấp tối đa 16GB)', N'512GB NVMe M.2 SSD', N'ASUSV15OLED-A1505ZA-L1245W', N'asusvivobook15.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'ASUSVIVO15OLED-02', N'ASUS Vivobook 15 OLED i5-13500H', N'Asus', 17590000, 10, N'Đen', N'16GB DDR4-3200Mhz', N'512GB NVMe M.2 SSD', N'ASUSV15OLED-A1505VA-L1114W', N'asusvivobook15.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'ASUSVIVO15OLED-03', N'ASUS Vivobook 15 OLED i9-13900H', N'Asus', 20990000, 10, N'Đen', N'16GB DDR4-3200Mhz', N'512GB NVMe M.2 SSD', N'ASUSV15OLED-A1505VA-L1201W', N'asusvivobook15.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'ASUSZ14OLED-01', N'ASUS Zenbook 14 OLED R5-7530U', N'Asus', 20490000, 10, N'Đen', N'16GB LPDDR4X Onboard', N'512GB NVMe M.2 SSD', N'ASUSZ14OLED-UM3402YA-KM405W', N'asuszenbook14.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'ASUSZ14OLED-02', N'ASUS Zenbook 14 OLED i3-1340P', N'Asus', 22690000, 10, N'Đen', N'16GB LPDDR5 Onboard', N'512GB NVMe M.2 SSD', N'ASUSZ14OLED-UX3402VA-KM203W', N'asuszenbook14.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'ASUSZ14OLED-03', N'ASUS Zenbook 14 OLED i3-1360P', N'Asus', 25390000, 10, N'Đen', N'16GB LPDDR5 Onboard', N'512GB NVMe M.2 SSD', N'ASUSZ14OLED-UX3402VA-KM068W', N'asuszenbook14.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'ASUSZ14OLED-04', N'ASUS Zenbook 14 OLED U5-125H', N'Asus', 26990000, 10, N'Đen', N'16GB LPDDR5X Onboard', N'512GB NVMe M.2 SSD', N'ASUSZ14OLED-UX3405MA-PP151W', N'asuszenbook14.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'ASUSZ14OLED-05', N'ASUS Zenbook 14 OLED U7-155H', N'Asus', 32890000, 10, N'Đen', N'32GB LPDDR5X Onboard', N'1TB NVMe M.2 SSD', N'ASUSZ14OLED-UX3405MA-PP152W', N'asuszenbook14.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP12-01', N'Iphone 12 64GB', N'Apple', 12190000, 10, N'Trắng', N'4GB', N'64GB', N'IP12', N'ip12.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP12-02', N'Iphone 12 128GB', N'Apple', 17990000, 10, N'Trắng', N'4GB', N'128GB', N'IP12', N'ip12.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP12-03', N'Iphone 12 256GB', N'Apple', 23990000, 10, N'Trắng', N'4GB', N'256GB', N'IP12', N'ip12.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP12-04', N'Iphone 12 64GB', N'Apple', 12190000, 10, N'Đen', N'4GB', N'64GB', N'IP12', N'ip12.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP12-05', N'Iphone 12 128GB', N'Apple', 17990000, 10, N'Đen', N'4GB', N'128GB', N'IP12', N'ip12.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP12-06', N'Iphone 12 256GB', N'Apple', 23990000, 10, N'Đen', N'4GB', N'256GB', N'IP12', N'ip12.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP12-07', N'Iphone 12 64GB', N'Apple', 12190000, 10, N'Tím', N'4GB', N'64GB', N'IP12', N'ip12.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP12-08', N'Iphone 12 128GB', N'Apple', 17990000, 10, N'Tím', N'4GB', N'128GB', N'IP12', N'ip12.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP12-09', N'Iphone 12 256GB', N'Apple', 23990000, 10, N'Tím', N'4GB', N'256GB', N'IP12', N'ip12.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP12PM-01', N'Iphone 12 Pro Max 128GB', N'Apple', 23490000, 10, N'Xanh', N'6GB', N'128GB', N'IP12PM', N'ip12pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP12PM-02', N'Iphone 12 Pro Max 256GB', N'Apple', 27590000, 10, N'Xanh', N'6GB', N'256GB', N'IP12PM', N'ip12pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP12PM-03', N'Iphone 12 Pro Max 512GB', N'Apple', 31000000, 10, N'Xanh', N'6GB', N'512GB', N'IP12PM', N'ip12pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP12PM-04', N'Iphone 12 Pro Max 128GB', N'Apple', 23490000, 10, N'Đen', N'6GB', N'128GB', N'IP12PM', N'ip12pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP12PM-05', N'Iphone 12 Pro Max 256GB', N'Apple', 27590000, 10, N'Đen', N'6GB', N'256GB', N'IP12PM', N'ip12pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP12PM-06', N'Iphone 12 Pro Max 512GB', N'Apple', 31000000, 10, N'Đen', N'6GB', N'512GB', N'IP12PM', N'ip12pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP13-01', N'Iphone 13 128GB', N'Apple', 13590000, 10, N'Trắng', N'4GB', N'128GB', N'IP13', N'ip13.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP13-02', N'Iphone 13 128GB', N'Apple', 13590000, 10, N'Xanh Dương', N'4GB', N'128GB', N'IP13', N'ip13.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP13-03', N'Iphone 13 128GB', N'Apple', 13590000, 10, N'Đen', N'4GB', N'128GB', N'IP13', N'ip13.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP13-04', N'Iphone 13 256GB', N'Apple', 17490000, 10, N'Trắng', N'4GB', N'256GB', N'IP13', N'ip13.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP13-05', N'Iphone 13 256GB', N'Apple', 17490000, 10, N'Xanh Dương', N'4GB', N'256GB', N'IP13', N'ip13.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP13-06', N'Iphone 13 256GB', N'Apple', 17490000, 10, N'Đen', N'4GB', N'256GB', N'IP13', N'ip13.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP13-07', N'Iphone 13 512GB', N'Apple', 24390000, 10, N'Trắng', N'4GB', N'512GB', N'IP13', N'ip13.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP13-08', N'Iphone 13 512GB', N'Apple', 24390000, 10, N'Xanh Dương', N'4GB', N'512GB', N'IP13', N'ip13.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP13-09', N'Iphone 13 512GB', N'Apple', 24390000, 10, N'Đen', N'4GB', N'512GB', N'IP13', N'ip13.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP13PM-01', N'Iphone 13 Pro Max 128GB', N'Apple', 22900000, 10, N'Trắng', N'6GB', N'128GB', N'IP13PM', N'ip13pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP13PM-02', N'Iphone 13 Pro Max 128GB', N'Apple', 22900000, 10, N'Đen', N'6GB', N'128GB', N'IP13PM', N'ip13pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP13PM-03', N'Iphone 13 Pro Max 256GB', N'Apple', 23900000, 10, N'Trắng', N'6GB', N'256GB', N'IP13PM', N'ip13pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP13PM-04', N'Iphone 13 Pro Max 256GB', N'Apple', 23900000, 10, N'Đen', N'6GB', N'256GB', N'IP13PM', N'ip13pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP13PM-05', N'Iphone 13 Pro Max 512GB', N'Apple', 25900000, 10, N'Trắng', N'6GB', N'512GB', N'IP13PM', N'ip13pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP13PM-06', N'Iphone 13 Pro Max 512GB', N'Apple', 25900000, 10, N'Đen', N'6GB', N'512GB', N'IP13PM', N'ip13pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP14-01', N'Iphone 14 128GB', N'Apple', 24190000, 10, N'Tím', N'6GB', N'128GB', N'IP14', N'ip14.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP14-02', N'Iphone 14 128GB', N'Apple', 26990000, 10, N'Đen', N'6GB', N'128GB', N'IP14', N'ip14.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP14-03', N'Iphone 14 256GB', N'Apple', 26990000, 10, N'Tím', N'6GB', N'256GB', N'IP14', N'ip14.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP14-04', N'Iphone 14 256GB', N'Apple', 32990000, 10, N'Đen', N'6GB', N'256GB', N'IP14', N'ip14.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP14-05', N'Iphone 14 512GB', N'Apple', 32990000, 10, N'Tím', N'6GB', N'512GB', N'IP14', N'ip14.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP14-06', N'Iphone 14 512GB', N'Apple', 32990000, 10, N'Đen', N'6GB', N'512GB', N'IP14', N'ip14.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP14PM-01', N'Iphone 14 Pro Max 128GB', N'Apple', 27190000, 10, N'Tím', N'6GB', N'128GB', N'IP14PM', N'ip14pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP14PM-02', N'Iphone 14 Pro Max 128GB', N'Apple', 27190000, 10, N'Đen', N'6GB', N'128GB', N'IP14PM', N'ip14pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP14PM-03', N'Iphone 14 Pro Max 256GB', N'Apple', 27990000, 10, N'Tím', N'6GB', N'256GB', N'IP14PM', N'ip14pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP14PM-04', N'Iphone 14 Pro Max 256GB', N'Apple', 27990000, 10, N'Đen', N'6GB', N'256GB', N'IP14PM', N'ip14pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP14PM-05', N'Iphone 14 Pro Max 512GB', N'Apple', 35390000, 10, N'Tím', N'6GB', N'512GB', N'IP14PM', N'ip14pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP14PM-06', N'Iphone 14 Pro Max 512GB', N'Apple', 35390000, 10, N'Đen', N'6GB', N'512GB', N'IP14PM', N'ip14pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP14PM-07', N'Iphone 14 Pro Max 1TB', N'Apple', 41790000, 10, N'Tím', N'6GB', N'1TB', N'IP14PM', N'ip14pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP14PM-08', N'Iphone 14 Pro Max 1TB', N'Apple', 41790000, 10, N'Đen', N'6GB', N'1TB', N'IP14PM', N'ip14pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP15-01', N'Iphone 15 128GB', N'Apple', 19190000, 10, N'Hồng', N'6GB', N'128GB', N'IP15', N'ip15.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP15-02', N'Iphone 15 128GB', N'Apple', 19190000, 10, N'Đen', N'6GB', N'128GB', N'IP15', N'ip15.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP15-03', N'Iphone 15 128GB', N'Apple', 19190000, 10, N'Xanh Dương', N'6GB', N'128GB', N'IP15', N'ip15.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP15-04', N'Iphone 15 256GB', N'Apple', 22790000, 10, N'Hồng', N'6GB', N'256GB', N'IP15', N'ip15.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP15-05', N'Iphone 15 256GB', N'Apple', 22790000, 10, N'Đen', N'6GB', N'256GB', N'IP15', N'ip15.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP15-06', N'Iphone 15 256GB', N'Apple', 22790000, 10, N'Xanh Dương', N'6GB', N'256GB', N'IP15', N'ip15.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP15-07', N'Iphone 15 512GB', N'Apple', 28490000, 10, N'Hồng', N'6GB', N'512GB', N'IP15', N'ip15.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP15-08', N'Iphone 15 512GB', N'Apple', 28490000, 10, N'Đen', N'6GB', N'512GB', N'IP15', N'ip15.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP15-09', N'Iphone 15 512GB', N'Apple', 28490000, 10, N'Xanh Dương', N'6GB', N'512GB', N'IP15', N'ip15.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP15PM-01', N'Iphone 15 Pro Max 256GB', N'Apple', 29090000, 10, N'Titan Xanh', N'8GB', N'256GB', N'IP15PM', N'ip15pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP15PM-02', N'Iphone 15 Pro Max 256GB', N'Apple', 29090000, 10, N'Titan Trắng', N'8GB', N'256GB', N'IP15PM', N'ip15pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP15PM-03', N'Iphone 15 Pro Max 256GB', N'Apple', 29090000, 10, N'Titan Đen', N'8GB', N'256GB', N'IP15PM', N'ip15pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP15PM-04', N'Iphone 15 Pro Max 512GB', N'Apple', 36390000, 10, N'Titan Xanh', N'8GB', N'512GB', N'IP15PM', N'ip15pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP15PM-05', N'Iphone 15 Pro Max 512GB', N'Apple', 36390000, 10, N'Titan Trắng', N'8GB', N'512GB', N'IP15PM', N'ip15pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP15PM-06', N'Iphone 15 Pro Max 512GB', N'Apple', 36390000, 10, N'Titan Đen', N'8GB', N'512GB', N'IP15PM', N'ip15pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP15PM-07', N'Iphone 15 Pro Max 1TB', N'Apple', 43490000, 10, N'Titan Xanh', N'8GB', N'1TB', N'IP15PM', N'ip15pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP15PM-08', N'Iphone 15 Pro Max 1TB', N'Apple', 43490000, 10, N'Titan Trắng', N'8GB', N'1TB', N'IP15PM', N'ip15pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IP15PM-09', N'Iphone 15 Pro Max 1TB', N'Apple', 43490000, 10, N'Titan Đen', N'8GB', N'1TB', N'IP15PM', N'ip15pm.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADAIR5-01', N'iPad Air 5 10.9 inch (2022) WIFI 64GB', N'Apple', 14290000, 10, N'Xanh', N'8GB', N'64GB', N'IPA5', N'ipadair5.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADAIR5-02', N'iPad Air 5 10.9 inch (2022) WIFI 64GB', N'Apple', 14290000, 10, N'Hồng', N'8GB', N'64GB', N'IPA5', N'ipadair5.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADAIR5-03', N'iPad Air 5 10.9 inch (2022) WIFI 64GB', N'Apple', 14290000, 10, N'Tím', N'8GB', N'64GB', N'IPA5', N'ipadair5.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADAIR5-04', N'iPad Air 5 10.9 inch (2022) WIFI 256GB', N'Apple', 18590000, 10, N'Xanh', N'8GB', N'256GB', N'IPA5', N'ipadair5.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADAIR5-05', N'iPad Air 5 10.9 inch (2022) WIFI 256GB', N'Apple', 18590000, 10, N'Hồng', N'8GB', N'256GB', N'IPA5', N'ipadair5.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADAIR5-06', N'iPad Air 5 10.9 inch (2022) WIFI 256GB', N'Apple', 18590000, 10, N'Tím', N'8GB', N'256GB', N'IPA5', N'ipadair5.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADGEN10-01', N'iPad Gen 10 10.9 inch 2022 Wifi 64GB', N'Apple', 9790000, 10, N'Xanh', N'4GB', N'64GB', N'IPG10', N'ipadgen10.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADGEN10-02', N'iPad Gen 10 10.9 inch 2022 Wifi 64GB', N'Apple', 9790000, 10, N'Hồng', N'4GB', N'64GB', N'IPG10', N'ipadgen10.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADGEN10-03', N'iPad Gen 10 10.9 inch 2022 Wifi 64GB', N'Apple', 9790000, 10, N'Bạc', N'4GB', N'64GB', N'IPG10', N'ipadgen10.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADGEN10-04', N'iPad Gen 10 10.9 inch 2022 Wifi 256GB', N'Apple', 13990000, 10, N'Xanh', N'4GB', N'256GB', N'IPG10', N'ipadgen10.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADGEN10-05', N'iPad Gen 10 10.9 inch 2022 Wifi 256GB', N'Apple', 13990000, 10, N'Hồng', N'4GB', N'256GB', N'IPG10', N'ipadgen10.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADGEN10-06', N'iPad Gen 10 10.9 inch 2022 Wifi 256GB', N'Apple', 13990000, 10, N'Bạc', N'4GB', N'256GB', N'IPG10', N'ipadgen10.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADPRO11-01', N'iPad Pro 11 inch 2022 M2 Wifi 128GB', N'Apple', 20890000, 10, N'Xám', N'8GB', N'128GB', N'IPP11', N'ipadpro11.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADPRO11-02', N'iPad Pro 11 inch 2022 M2 Wifi 128GB', N'Apple', 20890000, 10, N'Bạc', N'8GB', N'128GB', N'IPP11', N'ipadpro11.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADPRO11-03', N'iPad Pro 11 inch 2022 M2 Wifi 256GB', N'Apple', 23790000, 10, N'Xám', N'8GB', N'256GB', N'IPP11', N'ipadpro11.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADPRO11-04', N'iPad Pro 11 inch 2022 M2 Wifi 256GB', N'Apple', 23790000, 10, N'Bạc', N'8GB', N'256GB', N'IPP11', N'ipadpro11.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADPRO11-05', N'iPad Pro 11 inch 2022 M2 Wifi 512GB', N'Apple', 29990000, 10, N'Xám', N'8GB', N'512GB', N'IPP11', N'ipadpro11.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADPRO11-06', N'iPad Pro 11 inch 2022 M2 Wifi 512GB', N'Apple', 29990000, 10, N'Bạc', N'8GB', N'512GB', N'IPP11', N'ipadpro11.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADPRO11-07', N'iPad Pro 11 inch 2022 M2 Wifi 1TB', N'Apple', 44990000, 10, N'Xám', N'8GB', N'1TB', N'IPP11', N'ipadpro11.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADPRO11-08', N'iPad Pro 11 inch 2022 M2 Wifi 1TB', N'Apple', 44990000, 10, N'Bạc', N'8GB', N'1TB', N'IPP11', N'ipadpro11.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADPRO11-09', N'iPad Pro 11 inch 2022 M2 Wifi 2TB', N'Apple', 55990000, 10, N'Xám', N'8GB', N'2TB', N'IPP11', N'ipadpro11.png', N'Tablet')
GO
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'IPADPRO11-10', N'iPad Pro 11 inch 2022 M2 Wifi 2TB', N'Apple', 55990000, 10, N'Bạc', N'8GB', N'2TB', N'IPP11', N'ipadpro11.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'LENOVOLOG-01', N'Lenovo LOQ i5-12450HX RTX 3050', N'Lenovo', 19790000, 10, N'Xám', N'12GB', N'512GB', N'LENOVOLOG15IAX9-3050', N'lenovoloq.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'LENOVOLOG-02', N'Lenovo LOQ i5-12450HX RTX 4050', N'Lenovo', 23990000, 10, N'Xám', N'16GB', N'512GB', N'LENOVOLOG15IAX9-4050', N'lenovoloq.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKAM2-01', N'Macbook Air M2 2022 8GB 256GB', N'Apple', 24790000, 10, N'Xám', N'8GB', N'256GB', N'MACBOOKAIRM2', N'macbookairm2.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKAM2-02', N'Macbook Air M2 2022 8GB 256GB', N'Apple', 24790000, 10, N'Đen', N'8GB', N'256GB', N'MACBOOKAIRM2', N'macbookairm2.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKAM2-03', N'Macbook Air M2 2022 8GB 256GB', N'Apple', 24790000, 10, N'Trắng', N'8GB', N'256GB', N'MACBOOKAIRM2', N'macbookairm2.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKAM2-04', N'Macbook Air M2 2022 8GB 512GB', N'Apple', 29290000, 10, N'Xám', N'8GB', N'512GB', N'MACBOOKAIRM2', N'macbookairm2.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKAM2-05', N'Macbook Air M2 2022 8GB 512GB', N'Apple', 29290000, 10, N'Đen', N'8GB', N'512GB', N'MACBOOKAIRM2', N'macbookairm2.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKAM2-06', N'Macbook Air M2 2022 8GB 512GB', N'Apple', 29290000, 10, N'Trắng', N'8GB', N'512GB', N'MACBOOKAIRM2', N'macbookairm2.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKAM2-07', N'Macbook Air M2 2022 16GB 256GB', N'Apple', 29990000, 10, N'Xám', N'16GB', N'256GB', N'MACBOOKAIRM2', N'macbookairm2.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKAM2-08', N'Macbook Air M2 2022 16GB 256GB', N'Apple', 29990000, 10, N'Đen', N'16GB', N'256GB', N'MACBOOKAIRM2', N'macbookairm2.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKAM2-09', N'Macbook Air M2 2022 16GB 256GB', N'Apple', 29990000, 10, N'Trắng', N'16GB', N'256GB', N'MACBOOKAIRM2', N'macbookairm2.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKAM2-10', N'Macbook Air M2 2022 24GB 256GB', N'Apple', 33990000, 10, N'Xám', N'24GB', N'256GB', N'MACBOOKAIRM2', N'macbookairm2.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKAM2-11', N'Macbook Air M2 2022 24GB 256GB', N'Apple', 33990000, 10, N'Đen', N'24GB', N'256GB', N'MACBOOKAIRM2', N'macbookairm2.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKAM2-12', N'Macbook Air M2 2022 24GB 256GB', N'Apple', 33990000, 10, N'Trắng', N'24GB', N'256GB', N'MACBOOKAIRM2', N'macbookairm2.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKAM2-13', N'Macbook Air M2 2022 16GB 512GB', N'Apple', 34690000, 10, N'Xám', N'16GB', N'512GB', N'MACBOOKAIRM2', N'macbookairm2.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKAM2-14', N'Macbook Air M2 2022 16GB 512GB', N'Apple', 34690000, 10, N'Đen', N'16GB', N'512GB', N'MACBOOKAIRM2', N'macbookairm2.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKAM2-15', N'Macbook Air M2 2022 16GB 512GB', N'Apple', 34690000, 10, N'Trắng', N'16GB', N'512GB', N'MACBOOKAIRM2', N'macbookairm2.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKAM3-01', N'Macbook Air M3 13 inch 2024 8GB - 256GB', N'Apple', 27990000, 10, N'Trắng vàng', N'8GB', N'256GB', N'MACBOOKAIRM3', N'macbookairm3.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKAM3-02', N'Macbook Air M3 13 inch 2024 8GB - 256GB', N'Apple', 27990000, 10, N'Đen', N'8GB', N'256GB', N'MACBOOKAIRM3', N'macbookairm3.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKAM3-03', N'Macbook Air M3 13 inch 2024 8GB - 256GB', N'Apple', 27990000, 10, N'Bạc', N'8GB', N'256GB', N'MACBOOKAIRM3', N'macbookairm3.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKP16M3P-01', N'Macbook Pro 16 M3 Pro 18GB - 512GB', N'Apple', 62990000, 10, N'Đen', N'18GB', N'512GB', N'MACBOOKPRO16M3Pro', N'macbookpro16m3pro.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKP16M3P-02', N'Macbook Pro 16 M3 Pro 18GB - 512GB', N'Apple', 62990000, 10, N'Bạc', N'18GB', N'512GB', N'MACBOOKPRO16M3Pro', N'macbookpro16m3pro.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKP16M3P-03', N'Macbook Pro 16 M3 Pro 32GB - 512GB', N'Apple', 72990000, 10, N'Đen', N'32GB', N'512GB', N'MACBOOKPRO16M3Pro', N'macbookpro16m3pro.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'MACBOOKP16M3P-04', N'Macbook Pro 16 M3 Pro 32GB - 512GB', N'Apple', 72990000, 10, N'Bạc', N'32GB', N'512GB', N'MACBOOKPRO16M3Pro', N'macbookpro16m3pro.png', N'Laptop')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'OPPOA77S-01', N'OPPO A77s 8GB 128GB', N'Oppo', 5190000, 10, N'Đen', N'8GB', N'128GB', N'OPA77S', N'oppoa77s.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'OPPOA77S-02', N'OPPO A77s 8GB 128GB', N'Oppo', 5190000, 10, N'Xanh', N'8GB', N'128GB', N'OPA77S', N'oppoa77s.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'OPPOA78-01', N'OPPO A78 4G (8GB 256GB)', N'Oppo', 6490000, 10, N'Xanh', N'8GB', N'256GB', N'OPA78', N'oppoa78.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'OPPOA78-02', N'OPPO A78 4G (8GB 256GB)', N'Oppo', 6490000, 10, N'Đen', N'8GB', N'256GB', N'OPA78', N'oppoa78.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'OPPOR10-01', N'OPPO Reno10 128GB', N'Oppo', 7890000, 10, N'Xanh', N'8GB', N'128GB', N'OPR10', N'opporeno10.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'OPPOR10-02', N'OPPO Reno10 5G 8GB 256GB', N'Oppo', 8890000, 10, N'Xanh', N'8GB', N'256GB', N'OPR10', N'opporeno10.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'OPPOR10-03', N'OPPO Reno10 5G 8GB 256GB', N'Oppo', 8890000, 10, N'Xám', N'8GB', N'256GB', N'OPR10', N'opporeno10.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'OPPOR7-01', N'OPPO Reno7 5G', N'Oppo', 7590000, 10, N'Đen', N'8GB', N'256GB', N'OPR7', N'opporeno7.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'OPPOR7-02', N'OPPO Reno7 5G', N'Oppo', 7590000, 10, N'Xanh', N'8GB', N'256GB', N'OPR7', N'opporeno7.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'OPPOR7Z-01', N'OPPO Reno7 Z (5G)', N'Oppo', 7000000, 10, N'Đen', N'8GB', N'128GB', N'OPR7Z', N'opporeno7z.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'OPPORF11-01', N'OPPO Reno11 F 5G 8GB 256GB', N'Oppo', 8390000, 10, N'Xanh đen', N'8GB', N'256GB', N'OPR11F', N'opporenof11.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'OPPORF11-02', N'OPPO Reno11 F 5G 8GB 256GB', N'Oppo', 8390000, 10, N'Xanh dương', N'8GB', N'256GB', N'OPR11F', N'opporenof11.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'RN12-01', N'Xiaomi Redmi Note 12 4GB 128GB', N'Xiaomi', 3790000, 10, N'Xanh lá', N'4GB', N'128GB', N'XRN12', N'redminote12.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'RN12-02', N'Xiaomi Redmi Note 12 4GB 128GB', N'Xiaomi', 3790000, 10, N'Xanh dương', N'4GB', N'128GB', N'XRN12', N'redminote12.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'RN12-03', N'Xiaomi Redmi Note 12 8GB 128GB', N'Xiaomi', 4290000, 10, N'Xanh lá', N'8GB', N'128GB', N'XRN12', N'redminote12.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'RN12-04', N'Xiaomi Redmi Note 12 8GB 128GB', N'Xiaomi', 4290000, 10, N'Xanh dương', N'8GB', N'128GB', N'XRN12', N'redminote12.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'RN12P-01', N'Xiaomi Redmi Note 12 Pro 5G', N'Xiaomi', 7390000, 10, N'Đen', N'8GB', N'256GB', N'XRN12P', N'redminote12pro.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'RN12P-02', N'Xiaomi Redmi Note 12 Pro 5G', N'Xiaomi', 7390000, 10, N'Xanh dương', N'8GB', N'256GB', N'XRN12P', N'redminote12pro.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'RN13-01', N'Xiaomi Redmi Note 13 6GB 128GB', N'Xiaomi', 4690000, 10, N'Xanh lá', N'6GB', N'128GB', N'XRN13', N'redminote13.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'RN13-02', N'Xiaomi Redmi Note 13 6GB 128GB', N'Xiaomi', 4690000, 10, N'Đen', N'6GB', N'128GB', N'XRN13', N'redminote13.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'RN13-03', N'Xiaomi Redmi Note 13 6GB 128GB', N'Xiaomi', 4690000, 10, N'Vàng', N'6GB', N'128GB', N'XRN13', N'redminote13.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'RN13P+-01', N'Xiaomi Redmi Note 13 Pro Plus 5G 8GB 256GB', N'Xiaomi', 10490000, 10, N'Tím', N'8GB', N'256GB', N'XRN13PP', N'redminote13proplus.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'RN13P+-02', N'Xiaomi Redmi Note 13 Pro Plus 5G 8GB 256GB', N'Xiaomi', 10490000, 10, N'Trắng', N'8GB', N'256GB', N'XRN13PP', N'redminote13proplus.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'RN13P+-03', N'Xiaomi Redmi Note 13 Pro Plus 5G 8GB 256GB', N'Xiaomi', 10490000, 10, N'Đen', N'8GB', N'256GB', N'XRN13PP', N'redminote13proplus.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'RN13P-01', N'Xiaomi Redmi Note 13 Pro 4G', N'Xiaomi', 6890000, 10, N'Đen', N'8GB', N'128GB', N'XRN13P', N'redminote13pro.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'RN13P-02', N'Xiaomi Redmi Note 13 Pro 4G', N'Xiaomi', 6890000, 10, N'Xanh lá', N'8GB', N'128GB', N'XRN13P', N'redminote13pro.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'RN13P-03', N'Xiaomi Redmi Note 13 Pro 4G', N'Xiaomi', 6890000, 10, N'Tím', N'8GB', N'128GB', N'XRN13P', N'redminote13pro.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSA05-01', N'Samsung Galaxy A05 4GB 128GB', N'Samsung', 3090000, 10, N'Bạc', N'4GB', N'128GB', N'SSA05', N'ssa05.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSA05-02', N'Samsung Galaxy A05 4GB 128GB', N'Samsung', 3090000, 10, N'Xanh', N'4GB', N'128GB', N'SSA05', N'ssa05.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSA05-03', N'Samsung Galaxy A05 4GB 128GB', N'Samsung', 3090000, 10, N'Đen', N'4GB', N'128GB', N'SSA05', N'ssa05.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSA15-01', N'Samsung Galaxy A15 LTE 8GB 128GB', N'Samsung', 4790000, 10, N'Xanh', N'8GB', N'128GB', N'SSA15', N'ssa15.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSA15-02', N'Samsung Galaxy A15 LTE 8GB 128GB', N'Samsung', 4790000, 10, N'Đen', N'8GB', N'128GB', N'SSA15', N'ssa15.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSA15-03', N'Samsung Galaxy A15 LTE 8GB 128GB', N'Samsung', 4790000, 10, N'Vàng', N'8GB', N'128GB', N'SSA15', N'ssa15.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSA35-01', N'Samsung Galaxy A35 8GB 128GB', N'Samsung', 7990000, 10, N'Đen', N'8GB', N'128GB', N'SSA35', N'ssa35.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSA35-02', N'Samsung Galaxy A35 8GB 128GB', N'Samsung', 7990000, 10, N'Vàng', N'8GB', N'128GB', N'SSA35', N'ssa35.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSA35-03', N'Samsung Galaxy A35 8GB 128GB', N'Samsung', 7990000, 10, N'Xanh nhạt', N'8GB', N'128GB', N'SSA35', N'ssa35.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSA55-01', N'Samsung Galaxy A55 8GB 128GB', N'Samsung', 9690000, 10, N'Đen', N'8GB', N'128GB', N'SSA55', N'ssa55.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSA55-02', N'Samsung Galaxy A55 8GB 128GB', N'Samsung', 9690000, 10, N'Tím', N'8GB', N'128GB', N'SSA55', N'ssa55.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSA55-03', N'Samsung Galaxy A55 8GB 128GB', N'Samsung', 9690000, 10, N'Xanh nhạt', N'8GB', N'128GB', N'SSA55', N'ssa55.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSGTS7P-01', N'Samsung Galaxy Tab S7 Plus', N'Samsung', 23990000, 10, N'Bạc', N'6GB', N'128GB', N'SSGTS7P', N'sstabs7plus.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSGTS8U-01', N'Samsung Galaxy Tab S8 Ultra 5G', N'Samsung', 27990000, 10, N'Bạc', N'8GB', N'128GB', N'SSGTS8U', N'sstabs8ultra.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS23-01', N'Samsung Galaxy S23 8GB 128GB', N'Samsung', 12990000, 10, N'Trắng', N'8GB', N'128GB', N'SSS23', N'sss23.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS23-02', N'Samsung Galaxy S23 8GB 128GB', N'Samsung', 12990000, 10, N'Đen', N'8GB', N'128GB', N'SSS23', N'sss23.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS23-03', N'Samsung Galaxy S23 8GB 128GB', N'Samsung', 12990000, 10, N'Tím', N'8GB', N'128GB', N'SSS23', N'sss23.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS23-04', N'Samsung Galaxy S23 8GB 256GB', N'Samsung', 14590000, 10, N'Trắng', N'8GB', N'256GB', N'SSS23', N'sss23.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS23-05', N'Samsung Galaxy S23 8GB 256GB', N'Samsung', 14590000, 10, N'Đen', N'8GB', N'256GB', N'SSS23', N'sss23.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS23-06', N'Samsung Galaxy S23 8GB 256GB', N'Samsung', 14590000, 10, N'Tím', N'8GB', N'256GB', N'SSS23', N'sss23.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS23FE-01', N'Samsung Galaxy S23 FE 5G 8GB 128GB', N'Samsung', 12890000, 10, N'Tím', N'8GB', N'128GB', N'SSS23FE', N'sss23fe.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS23FE-02', N'Samsung Galaxy S23 FE 5G 8GB 128GB', N'Samsung', 12890000, 10, N'Xanh', N'8GB', N'128GB', N'SSS23FE', N'sss23fe.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS23Ultra-01', N'Samsung Galaxy S23 Ultra 256GB', N'Samsung', 21990000, 10, N'Trắng', N'8GB', N'256GB', N'SSS23ULTRA', N'sss23ultra.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS23Ultra-02', N'Samsung Galaxy S23 Ultra 256GB', N'Samsung', 21990000, 10, N'Đen', N'8GB', N'256GB', N'SSS23ULTRA', N'sss23ultra.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS23Ultra-03', N'Samsung Galaxy S23 Ultra 256GB', N'Samsung', 21990000, 10, N'Xanh', N'8GB', N'256GB', N'SSS23ULTRA', N'sss23ultra.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS23Ultra-04', N'Samsung Galaxy S23 Ultra 12GB 512GB', N'Samsung', 24490000, 10, N'Trắng', N'12GB', N'512GB', N'SSS23ULTRA', N'sss23ultra.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS23Ultra-05', N'Samsung Galaxy S23 Ultra 12GB 512GB', N'Samsung', 24490000, 10, N'Đen', N'12GB', N'512GB', N'SSS23ULTRA', N'sss23ultra.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS23Ultra-06', N'Samsung Galaxy S23 Ultra 12GB 512GB', N'Samsung', 24490000, 10, N'Xanh', N'12GB', N'512GB', N'SSS23ULTRA', N'sss23ultra.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS23Ultra-07', N'Samsung Galaxy S23 Ultra 12GB 1TB', N'Samsung', 44990000, 10, N'Trắng', N'12GB', N'1TB', N'SSS23ULTRA', N'sss23ultra.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS23Ultra-08', N'Samsung Galaxy S23 Ultra 12GB 1TB', N'Samsung', 44990000, 10, N'Đen', N'12GB', N'1TB', N'SSS23ULTRA', N'sss23ultra.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS23Ultra-09', N'Samsung Galaxy S23 Ultra 12GB 1TB', N'Samsung', 44990000, 10, N'Xanh', N'12GB', N'1TB', N'SSS23ULTRA', N'sss23ultra.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS24-01', N'Samsung Galaxy S24 8GB 256GB', N'Samsung', 21990000, 10, N'Xám', N'8GB', N'256GB', N'SSS24', N'sss24.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS24-02', N'Samsung Galaxy S24 8GB 256GB', N'Samsung', 21990000, 10, N'Đen', N'8GB', N'256GB', N'SSS24', N'sss24.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS24-03', N'Samsung Galaxy S24 8GB 256GB', N'Samsung', 21990000, 10, N'Vàng', N'8GB', N'256GB', N'SSS24', N'sss24.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS24-04', N'Samsung Galaxy S24 8GB 512GB', N'Samsung', 25490000, 10, N'Xám', N'8GB', N'512GB', N'SSS24', N'sss24.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS24-05', N'Samsung Galaxy S24 8GB 512GB', N'Samsung', 25490000, 10, N'Đen', N'8GB', N'512GB', N'SSS24', N'sss24.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS24-06', N'Samsung Galaxy S24 8GB 512GB', N'Samsung', 25490000, 10, N'Vàng', N'8GB', N'512GB', N'SSS24', N'sss24.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS24Plus-01', N'Samsung Galaxy S24 Plus 12GB 256GB', N'Samsung', 24990000, 10, N'Xám', N'12GB', N'256GB', N'SSS24+', N'sss24plus.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS24Plus-02', N'Samsung Galaxy S24 Plus 12GB 256GB', N'Samsung', 24990000, 10, N'Đen', N'12GB', N'256GB', N'SSS24+', N'sss24plus.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS24Plus-03', N'Samsung Galaxy S24 Plus 12GB 256GB', N'Samsung', 24990000, 10, N'Vàng', N'12GB', N'256GB', N'SSS24+', N'sss24plus.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS24Plus-04', N'Samsung Galaxy S24 Plus 12GB 512GB', N'Samsung', 28490000, 10, N'Xám', N'12GB', N'512GB', N'SSS24+', N'sss24plus.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS24Plus-05', N'Samsung Galaxy S24 Plus 12GB 512GB', N'Samsung', 28490000, 10, N'Đen', N'12GB', N'512GB', N'SSS24+', N'sss24plus.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS24Plus-06', N'Samsung Galaxy S24 Plus 12GB 512GB', N'Samsung', 28490000, 10, N'Vàng', N'12GB', N'512GB', N'SSS24+', N'sss24plus.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS24Ultra-01', N'Samsung Galaxy S24 Ultra 12GB 256GB', N'Samsung', 31990000, 10, N'Xám', N'12GB', N'256GB', N'SSS24ULTRA', N'sss24ultra.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS24Ultra-02', N'Samsung Galaxy S24 Ultra 12GB 256GB', N'Samsung', 31990000, 10, N'Đen', N'12GB', N'256GB', N'SSS24ULTRA', N'sss24ultra.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS24Ultra-03', N'Samsung Galaxy S24 Ultra 12GB 256GB', N'Samsung', 31990000, 10, N'Vàng', N'12GB', N'256GB', N'SSS24ULTRA', N'sss24ultra.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS24Ultra-04', N'Samsung Galaxy S24 Ultra 12GB 512GB', N'Samsung', 35490000, 10, N'Xám', N'12GB', N'512GB', N'SSS24ULTRA', N'sss24ultra.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS24Ultra-05', N'Samsung Galaxy S24 Ultra 12GB 512GB', N'Samsung', 35490000, 10, N'Đen', N'12GB', N'512GB', N'SSS24ULTRA', N'sss24ultra.png', N'Phone')
GO
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS24Ultra-06', N'Samsung Galaxy S24 Ultra 12GB 512GB', N'Samsung', 35490000, 10, N'Vàng', N'12GB', N'512GB', N'SSS24ULTRA', N'sss24ultra.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS24Ultra-07', N'Samsung Galaxy S24 Ultra 12GB 1TB', N'Samsung', 42490000, 10, N'Xám', N'12GB', N'1TB', N'SSS24ULTRA', N'sss24ultra.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS24Ultra-08', N'Samsung Galaxy S24 Ultra 12GB 1TB', N'Samsung', 42490000, 10, N'Đen', N'12GB', N'1TB', N'SSS24ULTRA', N'sss24ultra.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSS24Ultra-09', N'Samsung Galaxy S24 Ultra 12GB 1TB', N'Samsung', 42490000, 10, N'Vàng', N'12GB', N'1TB', N'SSS24ULTRA', N'sss24ultra.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSZFlip4-01', N'Samsung Galaxy Z Flip4 128GB', N'Samsung', 11190000, 10, N'Đen', N'8GB', N'128GB', N'SSFL4', N'sszflip4.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSZFlip4-02', N'Samsung Galaxy Z Flip4 256GB', N'Samsung', 11490000, 10, N'Đen', N'8GB', N'256GB', N'SSFL4', N'sszflip4.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSZFlip5-01', N'Samsung Galaxy Z Flip5 256GB', N'Samsung', 16090000, 10, N'Xanh lá', N'8GB', N'256GB', N'SSFL5', N'sszflip5.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSZFlip5-02', N'Samsung Galaxy Z Flip5 256GB', N'Samsung', 16090000, 10, N'Xám', N'8GB', N'256GB', N'SSFL5', N'sszflip5.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSZFlip5-03', N'Samsung Galaxy Z Flip5 256GB', N'Samsung', 16090000, 10, N'Tím', N'8GB', N'256GB', N'SSFL5', N'sszflip5.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSZFlip5-04', N'Samsung Galaxy Z Flip5 512GB', N'Samsung', 17990000, 10, N'Xanh lá', N'8GB', N'512GB', N'SSFL5', N'sszflip5.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSZFlip5-05', N'Samsung Galaxy Z Flip5 512GB', N'Samsung', 17990000, 10, N'Xám', N'8GB', N'512GB', N'SSFL5', N'sszflip5.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSZFlip5-06', N'Samsung Galaxy Z Flip5 512GB', N'Samsung', 17990000, 10, N'Tím', N'8GB', N'512GB', N'SSFL5', N'sszflip5.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSZFold5-01', N'Samsung Galaxy Z Fold5 12GB 256GB', N'Samsung', 31990000, 10, N'Đen', N'12GB', N'256GB', N'SSF5', N'sszfold5.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSZFold5-02', N'Samsung Galaxy Z Fold5 12GB 256GB', N'Samsung', 31990000, 10, N'Xanh dương', N'12GB', N'256GB', N'SSF5', N'sszfold5.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSZFold5-03', N'Samsung Galaxy Z Fold5 12GB 256GB', N'Samsung', 31990000, 10, N'Kem', N'12GB', N'256GB', N'SSF5', N'sszfold5.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSZFold5-04', N'Samsung Galaxy Z Fold5 12GB 512GB', N'Samsung', 32990000, 10, N'Đen', N'12GB', N'512GB', N'SSF5', N'sszfold5.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSZFold5-05', N'Samsung Galaxy Z Fold5 12GB 512GB', N'Samsung', 32990000, 10, N'Xanh dương', N'12GB', N'512GB', N'SSF5', N'sszfold5.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSZFold5-06', N'Samsung Galaxy Z Fold5 12GB 512GB', N'Samsung', 32990000, 10, N'Kem', N'12GB', N'512GB', N'SSF5', N'sszfold5.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSZFold5-07', N'Samsung Galaxy Z Fold5 12GB 1TB', N'Samsung', 46990000, 10, N'Đen', N'12GB', N'1TB', N'SSF5', N'sszfold5.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSZFold5-08', N'Samsung Galaxy Z Fold5 12GB 1TB', N'Samsung', 46990000, 10, N'Xanh dương', N'12GB', N'1TB', N'SSF5', N'sszfold5.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'SSZFold5-09', N'Samsung Galaxy Z Fold5 12GB 1TB', N'Samsung', 46990000, 10, N'Kem', N'12GB', N'1TB', N'SSF5', N'sszfold5.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'X14-01', N'Xiaomi 14 12GB 256GB', N'Xiaomi', 20990000, 10, N'Đen', N'12GB', N'256GB', N'X14', N'xiaomi14.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'X14-02', N'Xiaomi 14 12GB 256GB', N'Xiaomi', 20990000, 10, N'Trắng', N'12GB', N'256GB', N'X14', N'xiaomi14.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'X14-03', N'Xiaomi 14 12GB 256GB', N'Xiaomi', 20990000, 10, N'Xanh', N'12GB', N'256GB', N'X14', N'xiaomi14.png', N'Phone')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'XP6-01', N'Xiaomi Pad 6 8GB 128GB', N'Xiaomi', 8390000, 10, N'Xám', N'8GB', N'128GB', N'XP6', N'xiaomipad6.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'XP6-02', N'Xiaomi Pad 6 8GB 128GB', N'Xiaomi', 8390000, 10, N'Vàng', N'8GB', N'128GB', N'XP6', N'xiaomipad6.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'XP6-03', N'Xiaomi Pad 6 8GB 128GB', N'Xiaomi', 8390000, 10, N'Xanh dương', N'8GB', N'128GB', N'XP6', N'xiaomipad6.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'XP6-04', N'Xiaomi Pad 6 8GB 256GB', N'Xiaomi', 9490000, 10, N'Xám', N'8GB', N'256GB', N'XP6', N'xiaomipad6.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'XP6-05', N'Xiaomi Pad 6 8GB 256GB', N'Xiaomi', 9490000, 10, N'Vàng', N'8GB', N'256GB', N'XP6', N'xiaomipad6.png', N'Tablet')
INSERT [dbo].[Product] ([productID], [name], [brand], [price], [quantity], [color], [ram], [memory], [specID], [img], [type]) VALUES (N'XP6-06', N'Xiaomi Pad 6 8GB 256GB', N'Xiaomi', 9490000, 10, N'Xanh dương', N'8GB', N'256GB', N'XP6', N'xiaomipad6.png', N'Tablet')
GO
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'ASUSROGSTRIX16-01', 1)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'ASUSROGSTRIX16-02', 1)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'ASUSROGSTRIX16-03', 2)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'ASUSTUFF15-01', 2)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'ASUSTUFF15-02', 3)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'ASUSTUFF15-03', 3)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'ASUSTUFF15-04', 4)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'ASUSTUFF15-05', 4)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'ASUSTUFF15-06', 5)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'ASUSVIVO15OLED-01', 5)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'ASUSVIVO15OLED-02', 1)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'ASUSVIVO15OLED-03', 2)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'ASUSZ14OLED-01', 3)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'ASUSZ14OLED-02', 4)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'ASUSZ14OLED-03', 5)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'ASUSZ14OLED-04', 1)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'ASUSZ14OLED-05', 2)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'IP12-01', 3)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'IP12-02', 4)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'IP12-03', 5)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'IP12-04', 1)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'IP12-05', 2)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'IP12-06', 3)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'IP12-07', 4)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'IP12-08', 5)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'IP12-09', 1)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'IP12PM-01', 2)
INSERT [dbo].[Product_Discount] ([productID], [discountID]) VALUES (N'IP12PM-02', 3)
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([reviewID], [ProductId], [star], [cmtCustomer], [nameCustomer], [cmtTime]) VALUES (1, N'ASUSROGSTRIX16-03', NULL, N'ok đấy', NULL, NULL)
INSERT [dbo].[Review] ([reviewID], [ProductId], [star], [cmtCustomer], [nameCustomer], [cmtTime]) VALUES (2, N'ASUSROGSTRIX16-03', NULL, N'Sản phẩm tốt', N'Manh', CAST(N'2024-05-28T09:59:22.947' AS DateTime))
INSERT [dbo].[Review] ([reviewID], [ProductId], [star], [cmtCustomer], [nameCustomer], [cmtTime]) VALUES (3, N'ASUSTUFF15-01', NULL, N'Sản phẩm tốt', N'Manh', CAST(N'2024-05-28T09:59:22.953' AS DateTime))
INSERT [dbo].[Review] ([reviewID], [ProductId], [star], [cmtCustomer], [nameCustomer], [cmtTime]) VALUES (4, N'ASUSROGSTRIX16-03', NULL, N'Sản phẩm rất tốt', N'An ', CAST(N'2024-05-28T10:07:42.437' AS DateTime))
INSERT [dbo].[Review] ([reviewID], [ProductId], [star], [cmtCustomer], [nameCustomer], [cmtTime]) VALUES (5, N'ASUSTUFF15-01', NULL, N'Sản phẩm rất tốt', N'An ', CAST(N'2024-05-28T10:07:42.437' AS DateTime))
INSERT [dbo].[Review] ([reviewID], [ProductId], [star], [cmtCustomer], [nameCustomer], [cmtTime]) VALUES (6, N'ASUSROGSTRIX16-03', NULL, N'', N'', CAST(N'2024-05-28T10:26:24.217' AS DateTime))
INSERT [dbo].[Review] ([reviewID], [ProductId], [star], [cmtCustomer], [nameCustomer], [cmtTime]) VALUES (7, N'ASUSTUFF15-05', NULL, N'Sản phẩm tốt', N'Huy', CAST(N'2024-05-28T12:41:34.117' AS DateTime))
INSERT [dbo].[Review] ([reviewID], [ProductId], [star], [cmtCustomer], [nameCustomer], [cmtTime]) VALUES (8, N'ASUSVIVO15OLED-02', NULL, N'Sản phẩm tốt', N'Huy', CAST(N'2024-05-28T12:41:34.120' AS DateTime))
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'ASUSROGSTRIXG16-G614JI-N4084W', N'Intel Core i7-13650HX Gen 13 (2.6 GHz-24M Cache up to 4.9 GHz 14 lõi: 6 P / 8 E)', N'NVIDIA GeForce RTX 4070 8GB GDDR6', N'Windows 11 Home', N'IPS 240Hz 16 inches 2560 x 1600 (WQXGA)', N'90WHrs-4S1P-4-cell Li-ion', N'Webcam : 720p HD camera', N'35.4 x 26.4 x 2.26 ~ 3.04 cm', 24, N'Công nghệ khử tiếng ồn AI/Dolby Atmos/Hi-Res certification/Smart Amp Technology/Hỗ trợ Microsoft Cortana trường gần/Trường xa', N'2.50 kg', N'Wi-Fi 6E (802.11ax) (Triple band) 2*2 Bluetooth 5.2', N'200W', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'ASUSROGSTRIXG16-G614JU-N3135W', N'Intel Core i5-13450HX Gen 13 (2.4 GHz-20M Cache up to 4.6 GHz-10 lõi: 6 P / 4 E)', N'NVIDIA GeForce RTX 4050 6GB GDDR6', N'Windows 11 Home', N'IPS 165Hz 16 inches 1920 x 1200 pixels (FullHD+)', N'90WHrs-4S1P-4-cell Li-ion', N'Webcam : 720p HD camera', N'35.4 x 26.4 x 2.26 ~ 3.04 cm', 24, N'Công nghệ khử tiếng ồn AI/Dolby Atmos/Hi-Res certification/Smart Amp Technology/Hỗ trợ Microsoft Cortana trường gần/Trường xa', N'2.50 kg', N'Wi-Fi 6E (802.11ax) (Triple band) 2*2 Bluetooth 5.2', N'200W', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'ASUSROGSTRIXG16-G614JU-N3777W', N'Intel Core i7-13650HX Gen 13 (2.6 GHz-24M Cache up to 4.9 GHz 14 lõi: 6 P / 8 E)', N'NVIDIA GeForce RTX 4050 6GB GDDR6', N'Windows 11 Home', N'IPS 165Hz 16 inches 1920 x 1200 pixels (FullHD+)', N'90WHrs-4S1P-4-cell Li-ion', N'Webcam : 720p HD camera', N'35.4 x 26.4 x 2.26 ~ 3.04 cm', 24, N'Công nghệ khử tiếng ồn AI/Dolby Atmos/Hi-Res certification/Smart Amp Technology/Hỗ trợ Microsoft Cortana trường gần/Trường xa', N'2.50 kg', N'Wi-Fi 6E (802.11ax) (Triple band) 2*2 Bluetooth 5.2', N'200W', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'ASUSTUF15-FX507VV-LP157W', N'Intel Core i7-13620H ( 2.4 GHz - 4.9 GHz - 24MB - 10 nhân / 16 luồng )', N'NVIDIA GeForce RTX 4060 8GB GDDR6/Intel UHD Graphics 770', N'Windows 11 Home', N'IPS 144Hz 15.6 inches 1920 x 1080 pixels(FullHD)', N'4 cell 90 Wh-Pin li?n', N'HD webcam', N'35.4 x 25.1 x 2.24 - 2.49 cm', 24, N'Công nghệ khử tiếng ồn AI/Dolby Atmos/Hi-Res certification/Hỗ trợ Microsoft Cortana trường gần/Trường xa', N'2.2kg', N'Wi-Fi 6 (802.11ax) (Dual band) 2*2 Bluetooth 5.2', N'200 W', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'ASUSTUF15-FX507VV4-LP382W', N'Intel Core i9-13900H 2.6 GHz (24M Cache-up to 5.4 GHz-14 lõi: 6 P / 8 E)', N'NVIDIA GeForce RTX 4060 8GB GDDR6/Intel Iris Xe Graphics', N'Windows 11 Home', N'IPS 144Hz 15.6 inches 1920 x 1080 pixels(FullHD)', N'90WHr/4S1P/4-cell Li-ion', N'Webcam : 720P HD camera', N'35.4 x 25.1 x 2.24 ~ 2.49 cm (W x D x H)', 24, N'Công nghệ khử tiếng ồn AI/Dolby Atmos/Hi-Res certification/Hỗ trợ Microsoft Cortana trường gần/Trường xa', N'2.2kg', N'Wi-Fi 6 (802.11ax) (Dual band) 2*2 Bluetooth 5.2', N'200 W', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'ASUSTUF15-FX507ZC4-HN074W', N'Intel Core i5-12500H (2.5 GHz-18M Cache-up to 4.5 GHz-12 lõi: 4 P-cores/8 E-cores)', N'NVIDIA GeForce RTX 3050 4GB GDDR6/Intel Iris Xe Graphics', N'Windows 11 Home', N'IPS 144Hz 15.6 inches 1920 x 1080 pixels(FullHD)', N'56WHrs-4S1P-4-cell Li-ion', N'Webcam : 720P HD camera', N'35.4 x 25.1 x 2.24 - 2.49 cm', 24, N'Công nghệ khử tiếng ồn AI/Dolby Atmos/Hi-Res certification/Hỗ trợ Microsoft Cortana trường gần/Trường xa', N'2.2kg', N'Wi-Fi 6 (802.11ax) (Dual band) 2*2 Bluetooth 5.2', N'200 W', 2023)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'ASUSTUF15-FX507ZC4-HN099W', N'Intel Core i7-12700H (2.3 GHz-24M Cache-up to 4.7 GHz-14 lõi: 6 P-cores/8 E-cores)', N'NVIDIA GeForce RTX 3050 4GB GDDR6/Intel Iris Xe Graphics', N'Windows 11 Home', N'IPS 144Hz 15.6 inches 1920 x 1080 pixels(FullHD)', N'56WHrs-4S1P-4-cell Li-ion', N'Webcam : 720P HD camera', N'35.4 x 25.1 x 2.24 - 2.49 cm', 24, N'Công nghệ khử tiếng ồn AI/Dolby Atmos/Hi-Res certification/Hỗ trợ Microsoft Cortana trường gần/Trường xa', N'2.2kg', N'Wi-Fi 6 (802.11ax) (Dual band) 2*2 Bluetooth 5.2', N'200 W', 2023)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'ASUSTUF15-FX507ZU4-LP054W', N'Intel Core i7-12700H (2.3 GHz-24M Cache-up to 4.7 GHz-14 lõi: 6 P-cores/8 E-cores)', N'NVIDIA GeForce RTX 4050 6GB GDDR6', N'Windows 11 Home', N'IPS 144Hz 15.6 inches 1920 x 1080 pixels(FullHD)', N'90WHrs-4S1P-4-cell Li-ion', N'Webcam : 720P HD camera', N'35.4 x 25.1 x 2.24 - 2.49 cm', 24, N'Công nghệ khử tiếng ồn AI/Dolby Atmos/Hi-Res certification/Hỗ trợ Microsoft Cortana trường gần/Trường xa', N'2.2kg', N'Wi-Fi 6 (802.11ax) (Dual band) 2*2 Bluetooth 5.2', N'200 W', 2023)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'ASUSTUF15-FX507ZV4-LP042W', N'Intel Core i7-12700H (2.3 GHz-24M Cache-up to 4.7 GHz-14 lõi: 6 P-cores/8 E-cores)', N'NVIDIA GeForce RTX 4060 8GB GDDR6 2420MHz', N'Windows 11 Home', N'IPS 144Hz 15.6 inches 1920 x 1080 pixels(FullHD)', N'90WHrs-4S1P-4-cell Li-ion', N'Webcam : 720P HD camera', N'35.4 x 25.1 x 2.24 - 2.49 cm', 24, N'Công nghệ khử tiếng ồn AI/Dolby Atmos/Hi-Res certification/Hỗ trợ Microsoft Cortana trường gần/Trường xa', N'2.2kg', N'Wi-Fi 6 (802.11ax) (Dual band) 2*2 Bluetooth 5.2', N'200 W', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'ASUSV15OLED-A1505VA-L1114W', N'Intel Core i5-13500H (2.6 GHz-18M Cache-up to 4.7 GHz-12 lõi/16 luồng)', N'Intel Iris Xe Graphics', N'Windows 11 Home', N'OLED 60Hz 15.6 inches 1920 x 1080 pixels (FullHD)', N'50WHrs-3S1P-3-cell Li-ion', N'Webcam : 720p HD với màn trập camera', N'35.68 x 22.76 x 1.99 ~ 1.99 cm', 24, N'SonicMaster/Loa tích hợp/Micrô mảng tích hợp', N'1.7kg', N'Wi-Fi 6 (802.11ax) (Dual band) 1*1 Bluetooth 5', N'65W', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'ASUSV15OLED-A1505VA-L1201W', N'Intel Core i9-13900H 2.6 GHz (24MB Cache-up to 5.4 GHz-14 lõi / 20 luồng)', N'Intel Iris Xe Graphics', N'Windows 11 Home', N'OLED 60Hz 15.6 inches 1920 x 1080 pixels (FullHD)', N'50WHrs-3S1P-3-cell Li-ion', N'Webcam : 720p HD với màn trập camera', N'35.68 x 22.76 x 1.99 ~ 1.99 cm', 24, N'SonicMaster/Loa tích hợp/Micrô mảng tích hợp', N'1.7kg', N'Wi-Fi 6 (802.11ax) (Dual band) 1*1 Bluetooth 5', N'65W', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'ASUSV15OLED-A1505ZA-L1245W', N'Intel Core i5-12500H (2.5 GHz-18M Cache-up to 4.5 GHz-12 lõi: 4 P-cores/8 E-cores)', N'Intel UHD Graphics', N'Windows 11 Home', N'OLED/AMOLED 60Hz 15.6 inches 1920 x 1080 pixels (FullHD)', N'50WHrs-3S1P-3-cell Li-ion', N'Webcam : 720p HD với màn trập camera', N'35.68 x 22.76 x 1.99 ~ 1.99 cm', 24, N'Loa tích hợp/Micrô mảng tích hợp', N'1.7kg', N'Wi-Fi 6 (802.11ax) (Dual band) 2*2 Bluetooth 5', N'65W', 2023)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'ASUSZ14OLED-UM3402YA-KM405W', N'AMD Ryzen 5 7530U (2.0GHz-6 lõi / 12 luồng-16MB cache up to 4.5 GHz max boost)', N'AMD Radeon Graphics', N'Windows 11 Home', N'OLED 90Hz 14 inches 2880 x 1800 pixels', N'75WHrs- 2S2P-4-cell Li-ion', N'Webcam : 1080p FHD camera', N'31.36 x 22.06 x 1.69 ~ 1.69 cm', 24, N'Công nghệ khuếch đại thông minh/Loa tích hợp/Micrô mảng tích hợp/Harman/kardon (Premium)', N'1.35kg', N'Wi-Fi 6E(802.11ax) (Dual band) 2*2 Bluetooth 5', N'65W', 2023)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'ASUSZ14OLED-UX3402VA-KM068W', N'Intel Core i7-1360P 2.2 GHz (18MB Cache tối đa 5.0 GHz-12 lõi / 16 luồng)', N'Intel Iris Xe Graphics', N'Windows 11 Home', N'OLED/AMOLED 90Hz 14 inches 2880 x 1800 pixels', N'75WHrs- 2S2P-4-cell Li-ion', N'Webcam : 1080p FHD camera', N'31.36 x 22.06 x 1.69 ~ 1.69 cm', 24, N'Công nghệ khuếch đại thông minh/Loa tích hợp/Micrô mảng tích hợp/Harman/kardon (Premium)', N'1.35kg', N'Wi-Fi 6E(802.11ax) (Dual band) 2*2 Bluetooth 5', N'65W', 2023)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'ASUSZ14OLED-UX3402VA-KM203W', N'Intel Core i5-1340P (1.9 GHz-12MB Cache up to 4.6 GHz-12 lõi / 16 luồng)', N'Intel Iris Xe Graphics', N'Windows 11 Home', N'OLED/AMOLED 90Hz 14 inches 2880 x 1800 pixels', N'75WHrs- 2S2P-4-cell Li-ion', N'Webcam : 1080p FHD camera', N'31.36 x 22.06 x 1.69 ~ 1.69 cm', 24, N'Công nghệ khuếch đại thông minh/Loa tích hợp/Micrô mảng tích hợp/Harman/kardon (Premium)', N'1.35kg', N'Wi-Fi 6E(802.11ax) (Dual band) 2*2 Bluetooth 5', N'65W', 2023)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'ASUSZ14OLED-UX3405MA-PP151W', N'Intel® Core™ Ultra 5 125H 1.2 GHz (18MB Cache tối đa 4.5 GHz-14 nhân-18 luồng)-Intel® AI Boost NPU', N'Intel® Arc Graphics', N'Windows 11 Home', N'OLED 120Hz 14 inches 2880 x 1800 pixels', N'75WHrs- 2S2P-4-cell Li-ion', N'Webcam : 1080p FHD camera', N'31.24 x 22.01 x 1.49 ~ 1.49 cm', 24, N'Công nghệ khuếch đại thông minh/Loa tích hợp/Micrô mảng tích hợp/Harman/kardon (Premium)', N'1.2kg', N'Wi-Fi 6E(802.11ax) (Dual band) 2*2 Bluetooth 5.3', N'65W', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'ASUSZ14OLED-UX3405MA-PP152W', N'Intel® Core™ Ultra 7 155H', N'Intel® Arc Graphics', N'Windows 11 Home', N'OLED 120Hz 14 inches 2880 x 1800 pixels', N'75WHrs- 2S2P-4-cell Li-ion', N'Webcam : 1080p FHD camera', N'31.24 x 22.01 x 1.49 ~ 1.49 cm', 24, N'Công nghệ khuếch đại thông minh/Loa tích hợp/Micrô mảng tích hợp/Harman/kardon (Premium)', N'1.2kg', N'Wi-Fi 6E(802.11ax) (Dual band) 2*2 Bluetooth 5.3', N'65W', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'IP12', N'Apple A14 Bionic(5nm)', N'Apple GPU (4-core)', N'iOS 14', N'Super Retina XDR OLED 6.1 inch 2532 x 1170 px', N'2815 mAh Lithium-ion', N'Camera trước : 12 MP f/2.2 Camera sau 12 MP f/1.6 Quay video 4K/60fps 1080p/120fps', N'146.7x71.5x7.4mm', 12, N'Stereo công nghệ Dolby Atmos', N'164 gram', N'5G Wif-i 6 Bluetooth', N'Sạc nhanh 20W/Sạc không dây 15W', 2020)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'IP12PM', N'Apple A14 Bionic(5nm)', N'Apple GPU (4-core)', N'iOS 14', N'Super Retina XDR OLED 6.7 inch 2778 x 1284 px', N'3687 mAh Lithium-ion', N'Camera trước : 12 MP f/2.2 Camera sau 12 MP f/1.6 Quay video 4K/60fps 1080p/120fps', N'160.8x78.1x7.4mm', 12, N'Stereo công nghệ Dolby Atmos', N' 228 gram', N'5G Wif-i 6 Bluetooth 5.0', N'Sạc nhanh 18W/Sạc không dây 15W', 2020)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'IP13', N'Apple A15 Bionic(5nm)', N'Apple GPU(4-core)', N'iOS 15', N'Super Retina XDR OLED 6.1 inch 2532 x 1170 px', N'3240 mAh Lithium-ion', N'Camera trước : 12 MP f/2.2 Camera sau 12 MP f/1.6 Quay video 4K/60fps 1080p/120fps', N'146.7x71.5x7.7mm', 12, N'Stereo công nghệ Dolby Atmos Hi-res Audio Adaptive EQ Spatial Audio', N'173 gram', N'5G Wif-i 6 Bluetooth 5.0', N'Sạc nhanh 20W/Sạc không dây 15W', 2021)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'IP13PM', N'Apple A15 Bionic(5nm)', N'Apple GPU(5-core)', N'iOS 15', N'Super Retina XDR OLED 6.7 inch 2778 x 1284 px', N'4352 mAh Lithium-ion', N'Camera trước : 12 MP f/2.2 Camera sau 12 MP f/1.6 Quay video 4K/60fps 1080p/120fps', N'160.8x78.1x7.65mm', 12, N'Stereo công nghệ Dolby Atmos Hi-res Audio Adaptive EQ Spatial Audio', N'240 gram', N'5G Wif-i 6 Bluetooth 5.0', N'Sạc nhanh 20W/Sạc không dây 15W', 2021)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'IP14', N'Apple A15 Bionic(5nm)', N'Apple GPU(5-core)', N'iOS 16', N'OLED 6.7 inch 2532 x 1170 px', N'3279 mAh Lithium-ion', N'Camera trước : 12 MP f/2.2 Camera sau 12 MP f/1.6 Quay video 4K/60fps 1080p/120fps', N'146.7x71.5x7.8 mm', 12, N'Stereo công nghệ Dolby Atmos Hi-res Audio Adaptive EQ Spatial Audio', N'172 gram', N'5G Wif-i 6 Bluetooth 5.0', N'Sạc nhanh 20W/Sạc không dây 15W', 2022)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'IP14PM', N'Apple A16 Bionic(5nm)', N'Apple GPU(5-core)', N'iOS 16', N'Super Retina XDR OLED 6.7 inch 2796 x 1290 px', N'4323 mAh Lithium-ion', N'Camera trước : 12 MP f/1.9 Camera sau 48 MP f/1.8 Camera góc siêu rộng 12 MP f/2.2 Camera tele 12 MP f/2.8 Quay video 4K/60fps 1080p/240fps', N'160.7x77.6x7.9 mm', 12, N'Stereo công nghệ Dolby Atmos Hi-res Audio Adaptive EQ Spatial Audio', N'172 gram', N'5G Wif-i 6 Bluetooth 5.0', N'Sạc nhanh PD 2.0 30W/Sạc không dây MageSafe 15W/Sạc không dây chuẩn Qi 7.5W', 2022)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'IP15', N'Apple A16 Bionic(5nm)', N'Apple GPU(5-core)', N'iOS 17', N'Super Retina XDR OLED 6.1 inch 2556 x 1179 px', N'3349 mAh Lithium-ion', N'Camera trước : 12 MP f/1.9 Camera sau chính 48 MP & Phụ 12 MP Quay video 4K/60fps 1080p/240fps 720p/30fps', N'147.6x71.6x7.8mm', 12, N'AAC/MP3/Apple LosslessFLAC/Dolby Digital/Dolby Digital Plus/Dolby Atmos', N'172 gram', N'5G Wif-i 6 Bluetooth 5.3', N'Hỗ trợ sạc tối đa 20W/ Sạc pin nhanh/Sạc không dây MagSafe', 2023)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'IP15PM', N'Apple A17 Pro(5nm)', N'Apple GPU(6-core)', N'iOS 17', N'Super Retina XDR OLED 6.7 inch 2796 x 1290 px', N'4422 mAh Lithium-ion', N'Camera trước : 12 MP f/1.9 Camera sau chính 48 MP & Góc siêu rộng 12 MP & Góc siêu rộng 12 MP Quay video 4K/60fps 1080p/60fps 720p/30fps', N'159.9x76.7x8.25mm', 12, N'AAC/MP3/Apple LosslessFLAC/Dolby Digital/Dolby Digital Plus/Dolby Atmos', N'221 gram', N'5G Wif-i 6E Bluetooth 5.3', N'Sạc nhanh 20W/ Sạc không dây 15W/Sạc không dây Qi 75W', 2023)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'IPA5', N'Apple M1 8 core', N'Apple GPU 8 core', N'iPadOS 15', N'Liquid Retina 10.9 inch 1640 x 2360 px', N'7587 mAh Lithium-ion', N'Camera trước: Camera góc siêu rộng: 12MP Camera sau: 12MP Quay video 4K 2160p@30fps & 4K 2160p@24fps & 4K 2160p@25fps & 4K 2160p@60fps & FullHD 1080p@25fps & FullHD 1080p@30fps & FullHD 1080p@60fps & HD 720p@30fps', N'247.6 mm x 178.5 mm x 6.1 mm', 12, N'Dolby Atmos', N'461 g', N'Wi-Fi 802.11ax Wi-Fi 6 Bluetooth 5.0', N'Sạc tối đa 20W ', 2022)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'IPG10', N'Apple A14 Bionic 6 core', N'Apple GPU 4 core', N'iPadOS 16', N'IPS LCD 10.9 inch 1640 x 2360 px', N'7587 mAh Lithium-ion', N'Camera trước: Camera góc siêu rộng: 12MP Camera sau: Camera góc rộng: 12MP Quay video 4K 2160p@30fps & 4K 2160p@24fps & 4K 2160p@25fps & 4K 2160p@60fps & FullHD 1080p@25fps & FullHD 1080p@30fps & FullHD 1080p@60fps & HD 720p@30fps', N'248.6 x 179.5 x 7 mm', 12, N'Dolby Atmos', N'477g', N'Wi-Fi Dual-band MIMO Wi-Fi 802.11 a/b/g/n/ac/ax Wi-Fi hotspot Bluetooth v5.2', N'Sạc tối đa 20W & Sạc pin nhanh & Tiết kiệm pin', 2022)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'IPP11', N'Apple M2', N'Apple GPU 10 core', N'iPadOS 16', N'Liquid Retina 11 inch 1668 x 2388  px', N'7538 mAh Lithium-ion', N'Camera trước: Camera góc siêu rộng: 12MP Camera sau: 12MP Quay video 4K 2160p@30fps & 4K 2160p@24fps & 4K 2160p@25fps & 4K 2160p@60fps & FullHD 1080p@25fps & FullHD 1080p@30fps & FullHD 1080p@60fps & HD 720p@30fps', N'247.6 x 178.5 x 5.9 mm', 12, N'Dolby Atmos', N'466g', N'Wi-Fi Wi‑Fi 6E Bluetooth 5.3', N'Sạc tối đa 20W ', 2022)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'LENOVOLOG15IAX9-3050', N'Intel Core i5-12450HX (8 lõi (4P + 4E) / 12 luồng-P-core up to 4.4GHz-E-core up to 3.1GHz-12MB)', N'NVIDIA GeForce RTX 3050 6GB GDDR6/Boost Clock 1732MHz/TGP 95W', N'Windows 11 Home Single Language', N'IPS 144Hz 15.6 inches 1920 x 1080 pixels (FullHD)', N'60Wh', N'Webcam :FHD 1080p với màn trập E-shutter', N'36 x 25.9 x 2.19 cm', 24, N'Âm thanh độ phân giải cao (HD)/codec Realtek/ALC3287/Loa âm thanh nổi 2W x2/Nahimic Audio', N'2.38 kg', N'Wi-Fi 6 11ax 2x2 Bluetooth 5.2', N'120~230W', 2023)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'LENOVOLOG15IAX9-4050', N'Intel Core i5-12450HX (8 lõi (4P + 4E) / 12 luồng-P-core up to 4.4GHz-E-core up to 3.1GHz-12MB)', N'NVIDIA GeForce RTX 4050 6GB GDDR6/Boost Clock 2370MHz/TGP 105W', N'Windows 11 Home Single Language', N'IPS 144Hz 15.6 inches 1920 x 1080 pixels (FullHD)', N'60Wh', N'Webcam :FHD 1080p với màn trập E-shutter', N'36 x 25.9 x 2.19 cm', 24, N'Âm thanh độ phân giải cao (HD)/codec Realtek/ALC3287/Loa âm thanh nổi 2W x2/Nahimic Audio', N'2.38 kg', N'Wi-Fi 6 11ax 2x2 Bluetooth 5.2', N'120~230W', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'MACBOOKAIRM2', N'Apple M2', N'8 nhân GPU/16 nhân Neural Engine', N'MacOS', N'IPS/Liquid Retina Display 13.6 inches 2560 x 1664 pixels', N'52.6 Wh', N'Webcam :1080p FaceTime HD camera', N'30.41 x 21.5 x 1.13 cm', 24, N'3 microphones/4 Loa', N'1.27kg', N'802.11ax Wi-Fi 6 Bluetooth 5', N'30~65W', 2022)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'MACBOOKAIRM3', N'Apple M3 8 Lõi Neural Engine 16 lõi', N'8 nhân GPU/16 nhân Neural Engine', N'MacOS', N'Liquid Retina XDR 13.6 inches', N'52.6 Wh', N'Webcam :1080p FaceTime HD camera', N'30.41 x 21.5 x 1.13 cm', 24, N'3 microphones/4 Loa', N'1.27kg', N'802.11ax Wi-Fi 6 Bluetooth 5', N'30~65W', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'MACBOOKPRO16M3Pro', N'Apple M3 Pro 12 nhân', N'18 nhân Neural Engine 16 nhân', N'MacOS', N'Liquid Retina XDR 120Hz 16.2 inches 3024 x 1964 pixels', N'72.4 Wh', N'Webcam :1080p FaceTime HD camera', N'31.26 x 22.12 x 1.15 cm', 24, N'Âm thanh stereo rộng/Dolby Atmos', N'1.55kg', N'Wi-Fi 6E (802.11ax) Bluetooth 5.3', N'30~96W', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'OPA77S', N' Snapdragon 680 4G', N'Adreno 610', N'Android 12', N'IPS LCD 6.56 inch 720 x 1612', N' 5000mAh Lithium-ion', N'Camera trước: 8 MP Camera sau: Camera góc rộng: 50 MP & Camera chân dung: 2 MP Quay video 1080p@30fps', N' 163.8 x 75 x 8 mm', 12, N'Dolby Atmos', N'187 g', N'4G Wi-Fi 802.11 a/b/g/n/ac dual-band & Wi-Fi Direct/Hotspot Bluetooth 5.0 A2DP LE', N'Sạc nhanh VOCC 33W', 2022)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'OPA78', N'Qualcomm Snapdragon 680', N'Adreno 610', N'Android 13', N'AMOLED 6.43 inch 1080 x 2400 px', N'5000mah Lithium-ion', N'Camera trước: 8 MP Camera sau 50 MP (chính) + 2 MP (Xóa phông) Quay video HD 720p@120fps HD 720p@30fps', N' 160 x 73.23 x 7.93 mm', 12, N'Dolby Atmos', N'180g', N'Wi-Fi Wi-Fi 802.11 Wi-Fi Direct Wi-Fi hotspot Bluetooth v5.0', N'Siêu sạc nhanh SUPERVOOC 67W ', 2023)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'OPR10', N'MediaTek Dimensity 7050', N'ARM Mail-G68 MC4', N'Android 13', N'AMOLED 6.7 inch 1080 x 2412 px', N'5000 mAh Lithium-ion', N'Camera trước: Camera góc rộng: 32 MP Camera sau: Camera góc rộng: 64MP Chụp Telephoto chân dung:32 MP Camera góc siêu rộng: 8 MP  Quay video 4K@30fps & 1080P@60fps/30fps & 720P@60fps/30fps', N'162.4 x 74.2 x 7.99 mm', 12, N'Dolby Atmos', N'185 g', N' 5G Wi-Fi Wi-Fi MIMO Wi-Fi 6 Wi-Fi Direct Wi-Fi hotspot Dual-band (2.4 GHz/5 GHz) Bluetooth 5.3', N'Sạc nhanh SUPERVOOCTM 67W & SUPERVOOCTM 2.0 & SUPERVOOCTM VOOC 3.0PD3', 2023)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'OPR11F', N'Mediatek Dimensity 7050 (6 nm)', N'Octa-core', N'ColorOS 14 Android 14', N'AMOLED 6.7 inch 1080 x 2412 px', N'5000 mAh Lithium-ion', N'Camera trước: Camera góc rộng: 32 MP Camera sau: Camera góc rộng: 64 MP f/1.7 Camera góc siêu rộng: 8 MP Camera macro: 2 MP  Quay video 4K@30fps 1080@30/60/480 fps', N'161.1 x 74.7 x 7.5 mm', 12, N'Dolby Atmos', N'178g', N'5G Wi-Fi 802.11 a/b/g/n/ac/6  Bluetooth A2DP & LE & v5.2', N'Sạc nhanh 67W', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'OPR7', N'MediaTek Dimensity 900', N'ARM Mali-G68 MC4', N'Android 12', N'AMOLED 6.4 inch 1080 x 2400 px', N'Li-Po 4500 mAh Lithium-ion', N'Camera trước:32MP Camera sau: Camera chính: 64MP Camera góc siêu rộng:8MP Quay video 4K@30fps 1080p@30/60/120fps', N'160.6 x 73.2 x 7.81', 12, N'Dolby Atmos', N'173 g', N' 5G Bluetooth v5.1', N'Sạc nhanh 65W', 2022)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'OPR7Z', N'Snapdragon 695 5G 8 core', N'Adreno 619', N'Android 11', N'AMOLED 6.4 inch 1080 x 2400 px', N' 4500 mAh Li-Po', N'Camera trước:16MP Camera sau: Camera chính: 64MP Phụ 2 MP Quay video 4K@30fps 1080p@30/60/120fps', N'159.9 x 73.2 x7.49 mm', 12, N'Dolby Atmos', N'173 g', N' Wi-Fi Wi-Fi 802.11 Dual-band Bluetooth v5.0 ', N'Sạc siêu nhanh SuperVOOC', 2022)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'SSA05', N'Mediatek Helio G85', N'4 core 2.0 GHz & 4 core 1.8 GHz', N'Android 12', N'IPS LCD 6.7 inch 720 x 1600 px', N'5000 mAh Lithium-ion', N'Camera trước 8MP Camera sau:Camera chính: 50MP Camera cảm biến độ sâu: 2MP Quay video HD 720p@120fps FullHD 1080p@60fps FullHD 1080p@30fps', N'168.8 x 78.2 x 8.8 mm', 12, N'Dolby Atmos', N'164.6 g', N'4G Wi-Fi 802.11 a/b/g/n/ac/ax 2.4GHz+5GHz WiFi Direct Bluetooth 5.3', N'Sạc nhanh 25W', 2023)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'SSA15', N'MediaTek Helio G99', N'Mali-G57', N'Android 14', N'Super AMOLED 6.5 inch 1080 x 2340 px', N'5000 mAh Lithium-ion', N'Camera trước 13MP Camera sau: Chính 50 MP & Phụ 5 MP 2 MP Quay video 1080p@30fps', N'160.1 x 76.8 x 8.4 mm', 12, N'Dolby Atmos', N'200 g', N'4G Wi-Fi Dual-band (2.4 GHz/5 GHz) Wi-Fi 802.11 a/b/g/n/ac Wi-Fi Direct Bluetooth 5.3', N'Sạc nhanh 25W', 2023)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'SSA35', N'Exynos 1380', N'Mali-G68 MP5', N'Android 14', N'Super AMOLED 6.6 inch 1080 x 2340 px', N'5000 mAh Lithium-ion', N'Camera trước 13MP Camera sau: Camera chính rộng: 50 MP OIS+HDR Camera siêu rộng: 8MP  Camera Macro: 5MP Quay video UHD 4K (3840 x 2160)@30fps Quay chậm 240fps @HD', N'161.7 x 78.0 x 8.2 mm', 12, N'Dolby Atmos', N'209g', N'5G Wi-Fi 802.11 a/b/g/n/ac/ax 2.4GHz+5GHz WiFi Direct Bluetooth 5.3', N'Sạc nhanh 25W', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'SSA55', N'Exynos 1480 4nm 2.4GHz', N'AMD Titan 1WGP', N'Android 14', N'Super AMOLED 6.6 inch 1080 x 2400 px', N'5000 mAh Lithium-ion', N'Camera trước 32MP Camera sau: Camera chính: 50 MP OIS+HDR Camera góc rộng: 12MP Camera macro: 5MP Quay video UHD 4K (3840 x 2160)@30fps Quay chậm 240fps @HD', N' 161.1 x 77.4 x 8.2 mm', 12, N'Dolby Atmos', N'213g', N'5G Wi-Fi 802.11 a/b/g/n/ac/ax 2.4GHz+5GHz WiFi Direct Bluetooth 5.3', N'Sạc nhanh 25W', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'SSF5', N'Snapdragon 8 Gen 2 for Galaxy (4nm)', N'Adreno 740', N'Android 13 One UI 5.1', N'Dynamic AMOLED 2X 7.6 inch 2176 x 1812 px', N'4.400 mAh Lithium-ion', N'Camera trước : Camera bên ngoài:10 MP f/2.2 Camera bên trong: 4 MP F1.8 Camera siêu rộng: 12MP F2.2 & 123° & 1.12μm Camera góc rộng: 50MP F1.8 Dual Pixel AF OIS 2.0μm Camera Tele: 10 MP F2.4 PDAF OIS 1.0μm zoom 3X zoom kỹ thuật số 30X Quay video 8K 4320p@30fps', N'Mở: 154.9 x 129.9 x 6.1mm Gập: 154.9 x 67.1 x 13.4mm', 12, N'Dolby Atmos', N'253g', N'5G Wif-i Dual-band (2.4 GHz/5 GHz)& Wi-Fi 802.11 a/b/g/n/ac/ax & Wi-Fi MIMO Bluetooth 5.3', N'Sạc tối đa: 25W &Sạc không dây & Sạc pin nhanh & Tiết kiệm pin', 2023)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'SSFL4', N'Snapdragon 8+ Gen 1 (4 nm)', N'Adreno 730', N'Android 12', N'Dynamic AMOLED 2X 6.7 inch 1080 x 2640 px', N'3700 mAh Lithium-ion', N'Camera trước : 10MP F2.4  Camera chính:12MP & F1.8 & Dual Pixel & 1.8μm & OIS Camera siêu rộng: 12MP & F2.2 & 123° & 1.12 μm & FF Quay video 4K 2160p@60fps & 1080p@60/240fps & 720p@960fps & HDR10+', N'165.1 x 71.9 x 6.9mm Gập: 84.9 x 71.9 x 15.1mm', 20, N'Dolby Atmos', N'187g', N'5G Wif-i Dual-band (2.4 GHz/5 GHz)& Wi-Fi 802.11 a/b/g/n/ac/ax & Wi-Fi MIMO Bluetooth 5.3', N'Sạc tối đa: 25W &Sạc không dây & Sạc pin nhanh & Sạc không dây ngược 4.5W', 2022)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'SSFL5', N'Snapdragon 8 Gen 2 for Galaxy', N'Adreno 740', N'Android 13', N'Dynamic AMOLED 2X 6.7 inch 1080 x 2640 px', N'3700 mAh Lithium-ion', N'Camera trước : 10MP F2.4 1.22μm Camera chính:12MP & F1.8 & Dual Pixel & 1.8μm & OIS Camera siêu rộng: 12MP & F2.2 & 123° & 1.12 μm & FF Quay video 4K 2160p@60fps', N'165.1 x 71.9 x 6.9mm Gập: 85.1 x 71.9 x 15.1mm', 12, N'Dolby Atmos', N'187g', N'5G Wif-i Dual-band (2.4 GHz/5 GHz)& Wi-Fi 802.11 a/b/g/n/ac/ax & Wi-Fi MIMO Bluetooth 5.3', N'Sạc tối đa: 25W &Sạc không dây & Sạc pin nhanh & Tiết kiệm pin', 2023)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'SSGTS7P', N'Qualcomm SM8250 Snapdragon 865+ (7 nm+)', N'Adreno 650', N'Android 11 One UI 3.1', N'Super AMOLED 12.4 inch 2.800 x 1.752 px', N' 10090 mAh Li-Po ', N'Camera trước: Góc rộng:8 MP Camera sau: Góc rộng:13 MP Góc siêu rộng:5 MP Quay video 4K@30/60fps', N'285 x 185 x 5.7 mm', 12, N'Dolby Atmos', N'575g', N' 5G Wi-Fi Wi-Fi 802.11 Bluetooth5.1 A2DP LE', N'Sạc nhanh 45W ', 2020)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'SSGTS8U', N'Qualcomm Snapdragon 8 Gen 1 (4 nm)', N'Adreno 730', N'Android 12 One UI 3.1', N'Super AMOLED 14.6 inch 1848 x 2960 px', N' 11200 mAh Li-Po ', N'Camera trước: 12 MP f/2.2 (góc rộng) 12MP (góc siêu rộng) Camera sau: Góc rộng:13 MP Góc siêu rộng:6 MP Quay video 4K@30/60fps & 1080p@30fps', N'326.4 x 208.6 x 5.5 mm', 12, N'Dolby Atmos', N'726 g', N'Wi-Fi Wi-Fi 802.11 Bluetooth5.2 A2DP LE', N'Sạc nhanh 45W ', 2022)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'SSS23', N'Snapdragon 8 Gen 2', N'Adreno 740', N'Android', N'Dynamic AMOLED 2X 6.1 inch 1080 x 2340 px', N'3900 mAh Lithium-ion', N'Camera trước : 12 MP f/2.2 Camera chính 50 MP &f/1.8 & Phụ 12 MP f/2.2 10 MP f/2.4 Quay video FullHD 1080p@30fps & 4K 2160p@60fps & HD 720p@30fps & 8K 4320p@24fps & 8K 4320p@30fps', N'146.3 x 70.9 x 7.6 mm', 12, N' Dolby Atmos', N'168 g', N'5G Wif-i Dual-band (2.4 GHz/5 GHz)& Wi-Fi Direct & Wi-Fi 802.11 a/b/g/n/ac/ax & 6 GHz Bluetooth 5.3', N'Sạc pin nhanh & Sạc không dây & Sạc ngược không dây', 2023)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'SSS23FE', N'Exynos 2200', N'Xclipse 920', N'Android 13', N'Dynamic AMOLED 2X 6.4 inch 1080 x 2340 px', N'4500 mAh Lithium-ion', N'Camera trước : 12 MP f/2.2 Camera chính 50 MP & Phụ 12 MP & 8 MP Quay video FullHD 1080p@30fps & 4K 2160p@60fps & HD 720p@30fps & 8K 4320p@24fps & 8K 4320p@30fps', N'158 x 76.5 x 8.2 mm', 12, N'Dolby Atmos', N'209 g', N'5G Wif-i 802.11 a/b/g/n/ac/ax Bluetooth 5.3', N'Sạc nhanh 25 W', 2023)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'SSS23ULTRA', N'Snapdragon 8 Gen 2 (4 nm)', N'Adreno 740', N'Android 13', N'Dynamic AMOLED 2X 6.8 inch 1440 x 3088 px', N'5000mAh Lithium-ion', N'Camera trước : 12 MP f/2.2 Camera chính: 200MP F1.7 OIS ±3° (Super Quad Pixel AF) Siêu rộng: 12MP F2.2 (Dual Pixel AF) & Tele 1: 10MP F4.9 (10X Dual Pixel AF) OIS &Tele 2: 10MP F2.4 (3X & Dual Pixel AF) OIS Thu phóng chuẩn không gian 100X Quay video 8K@24/30fps 4K@30/60fps 1080p@30/60/240fps 720p@960fps', N'163.4 x 78.1 x 8.9 mm', 12, N' Dolby Atmos', N'233 g', N'5G Wif-i Wi-Fi 802.11 a/b/g/n/ac/6e tri-band & Wi-Fi Direct Bluetooth 5.3', N'Sạc nhanh 45W Chia sẻ pin không dây Sạc siêu nhanh Sạc không dây', 2023)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'SSS24', N'Exynos 2400', N'Xclipse 940', N'Android 14 One UI 6.1', N'Dynamic AMOLED 2X 6.2 inch 1080 x 2340 px', N'4000 mAh Lithium-ion', N'Camera trước : 12 MP f/2.2 Camera chính 50 MP f/1.8 Camera tele: 10 MP f/2.4 PDAF OIS zoom quang học 3x Camera góc siêu rộng: 12 MP f/2.2 120 Quay video 8K@24/30fps 4K@30/60fps 1080p@30/60/240fps 1080p@960fps', N'147.0 x 70.6 x 7.6mm', 12, N' Dolby Atmos', N'167g', N'5G Wif-i 2.4GHz+5GHz+6GHz HE160 MIMO 1024-QAM Bluetooth 5.3', N'Sạc nhanh 25W Chia sẻ pin không dây Sạc siêu nhanh Sạc không dây', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'SSS24+', N'Exynos 2400', N'Adreno 750', N'Android 14 One UI 6.1', N'Dynamic AMOLED 2X 6.7 inch 3120 x 1440 px', N'4900 mAh Lithium-ion', N'Camera trước : 12 MP f/2.2 Camera chính 50 MP f/1.8 Camera tele: 10 MP f/2.4 PDAF OIS zoom quang học 3x Camera góc siêu rộng: 12 MP f/2.2 120˚ Quay video 8K@24/30fps 4K@30/60fps 1080p@30/60/240fps 1080p@960fps', N'158.5 x 75.9 x 7.75mm', 12, N' Dolby Atmos', N'196g', N'5G Wif-i 2.4GHz+5GHz+6GHz HE160 MIMO 1024-QAM Bluetooth 5.3', N'Sạc nhanh 25W Chia sẻ pin không dây Sạc siêu nhanh Sạc không dây', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'SSS24ULTRA', N'Snapdragon 8 Gen 3 For Galaxy', N'Adreno 750', N'Android 14 One UI 6.1', N'Dynamic AMOLED 2X 6.8 inch 1440 x 3120 px', N'5000mAh Lithium-ion', N'Camera trước : 12 MP f/2.2 Camera chính: 200MP Laser AF OIS Camera: 50MP & PDAF & OIS & zoom quang học 5x Camera tele: 10MP Camera góc siêu rộng: 12 MP & f/2.2 & 13mm & 120˚ Quay video 8K@24/30fps 4K@30/60fps 1080p@30/60/240fps 1080p@960fps', N'162.3 x 79.0 x 8.6mm', 12, N' Dolby Atmos', N'196g', N'5G Wif-i 2.4GHz+5GHz+6GHz EHT320 MIMO 4096-QAM Bluetooth 5.3', N'Sạc nhanh 45W Chia sẻ pin không dây Sạc siêu nhanh Sạc không dây', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'X14', N'Qualcomm Snapdragon 8 Gen 3', N'Adreno 750', N'Android 14', N'LTPO OLED 6.36 inch 1200 x 2670 px', N'4610 mAh Lithium-ion', N'Camera trước Camera góc rộng: 50 MP f/ 2.2 PDAF Camera sau: Camera góc rộng: 50 MP f/1.6 23mm 2.4µm PDAF OIS Camera chụp xa: 50 MP f/1.9 50mm 1/2.88" 0.61µm PDAF 2x optical zoom Camera góc siêu rộng: 50 MP f/1.8 12mm 122˚ 1/2.51" PDAF Quay video 8K@24fps (HDR) 4K@24/30/60fps 1080p@30/120/240/960fps ', N' 152.8 x 71.5 x 8.2 mm', 12, N'Dolby Atmos', N'193 g', N' 5G Wi-Fi 802.11 a/b/g/n/ac/6e/Bluetooth 5.4', N'Sạc có dây 90W & Sạc không dây 50W & Sạc không dây đảo ngược 10W', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'XP6', N'Qualcomm Snapdragon 870 5G (7 nm)', N'Adreno 650', N'Android 13', N'IPS LCD 11 inch 2880 x 1800 px', N'8840 mAh Lithium-ion', N'Camera trước: 8 MP Camera sau: 13 MP Quay video 4K@30fps 1080p@30/60fps', N'253.95 x 165.18 x 6.51 mm', 12, N'Dolby Atmos', N'490 g', N'Wi-Fi Wi-Fi 802.11 Wi-Fi Direct Wi-Fi hotspot Bluetooth v5.2', N'Sạc nhanh 33W', 2023)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'XRN12', N'Qualcomm Snapdragon 685', N'Adreno 610', N'Android 12', N'AMOLED 6.67 inch 1080 x 2400 px', N'5000mAh Lithium-ion', N'Camera trước: 13MP Camera sau: Camera chính: 50MP Camera góc rộng: 8MP Camera Macro: 2MP Quay video 1080p@30fps 720p@30fps', N'165.66 x 75.96 x 7.85 mm', 12, N'Dolby Atmos', N'183.5 g', N'Wi-Fi 802.11 Bluetooth v5.0', N'Sạc nhanh 33W', 2022)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'XRN12P', N'Qualcomm SM7150 Snapdragon', N'Adreno 618', N' MIUI 13  Android 11', N'AMOLED 6.67 inch 1080 x 2400 px', N' 5000mAh Lithium-ion ', N'Camera trước: 16MP Camera sau: Camera chính: 108MP Camera góc siêu rộng: 8MP Quay video FullHD 1080p@60fps  4K 2160p@30fps', N' 164.2 x 76.1 x 8.1 mm', 12, N'Dolby Atmos', N'201.8 g', N'Wi-Fi Wi-Fi 802.11 Dual-band Bluetooth v5.1', N'Sạc nhanh 67W', 2023)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'XRN13', N'Snapdragon 685', N'Adreno 610', N'Android 13', N'AMOLED 6.67 inch 1080 x 2400 px', N'5000 mAh Lithium-ion', N'Camera trước: 16MP Camera sau: Chính 108 MP & Phụ 8 MP 2 MP Quay video HD 720p@30fpsFullHD 1080p@30fps', N' 162.24 x 75.55 x 7.97mm', 12, N' Dolby Atmos', N'188.5 g', N' 4G Wi-Fi Wi-Fi Direct & Wi-Fi 802.11 a/b/g/n/ac & Wi-Fi hotspot Dual-band (2.4 GHz/5 GHz) Bluetooth A2DP & LE & v5.1', N'Sạc nhanh 33W', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'XRN13P', N'MediaTek Helio G99-Ultra 8 core', N'Mali-G57 MC2', N'Android 13', N'AMOLED 6.67 inch 1080 x 2400 px', N'5000 mAh Lithium-ion', N'Camera trước: 16MP Camera sau: Chính 108 MP & Phụ 8 MP 2 MP Quay video HD 720p@30fpsFullHD 1080p@30fps', N' 161.1 x 74.95 x 7.98 mm', 12, N' Dolby Atmos', N'188 g', N' 4G Wi-Fi Wi-Fi Direct & Wi-Fi 802.11 a/b/g/n/ac & Wi-Fi hotspot Dual-band (2.4 GHz/5 GHz) Bluetooth v5.2', N'Sạc nhanh 67 W', 2024)
INSERT [dbo].[Specification] ([SpecID], [CPU], [GPU], [OS], [screen], [pin], [camera], [size], [warrantly], [sound], [weight], [conectivityTechnologies], [charge], [yearOfDebut]) VALUES (N'XRN13PP', N'Mediatek Dimensity 7200 Ultra (4 nm)', N'Mali-G610 MC4', N'Android 13', N'AMOLED 6.67 inch 1220 x 2712 px', N'5000 mAh Lithium-ion', N'Camera trước: 16MP Camera sau:Chính 200 MP & Phụ 8 MP 2 MP Quay video HD 720p@30fps & FullHD 1080p@60fps & FullHD 1080p@30fps & 4K 2160p@24fps&4K 2160p@30fps&FullHD 1080p@120fps', N'161.4 x 74.2 x 8.9 mm', 12, N'Dolby Atmos', N'204.5 g', N'5G Wi-Fi MIMO & Wi-Fi Direct & Wi-Fi 802.11 a/b/g/n/ac & Wi-Fi hotspot & Dual-band (2.4 GHz/5 GHz) Bluetooth A2DP & LE & v5.2', N'Sạc nhanh 120W', 2024)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__66DCF95C41119F91]    Script Date: 5/28/2024 6:03:59 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__66DCF95CF4EB218A]    Script Date: 5/28/2024 6:03:59 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__AB6E61647F0B5A3B]    Script Date: 5/28/2024 6:03:59 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__AB6E6164EE7CE2EA]    Script Date: 5/28/2024 6:03:59 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Discount] ADD  CONSTRAINT [DF_Discount_per_cent]  DEFAULT ((0)) FOR [per_cent]
GO
ALTER TABLE [dbo].[_Order]  WITH CHECK ADD FOREIGN KEY([staffID])
REFERENCES [dbo].[Staff] ([staffID])
GO
ALTER TABLE [dbo].[_Order]  WITH CHECK ADD FOREIGN KEY([staffID])
REFERENCES [dbo].[Staff] ([staffID])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK__Customer__accoun__3B75D760] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK__Customer__accoun__3B75D760]
GO
ALTER TABLE [dbo].[Export]  WITH CHECK ADD FOREIGN KEY([managerID])
REFERENCES [dbo].[Manager] ([managerID])
GO
ALTER TABLE [dbo].[Export]  WITH CHECK ADD FOREIGN KEY([managerID])
REFERENCES [dbo].[Manager] ([managerID])
GO
ALTER TABLE [dbo].[Export]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[_Order] ([orderID])
GO
ALTER TABLE [dbo].[Export]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[_Order] ([orderID])
GO
ALTER TABLE [dbo].[Export]  WITH CHECK ADD FOREIGN KEY([staffID])
REFERENCES [dbo].[Staff] ([staffID])
GO
ALTER TABLE [dbo].[Export]  WITH CHECK ADD FOREIGN KEY([staffID])
REFERENCES [dbo].[Staff] ([staffID])
GO
ALTER TABLE [dbo].[Import]  WITH CHECK ADD FOREIGN KEY([managerID])
REFERENCES [dbo].[Manager] ([managerID])
GO
ALTER TABLE [dbo].[Import]  WITH CHECK ADD FOREIGN KEY([managerID])
REFERENCES [dbo].[Manager] ([managerID])
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[_Order] ([orderID])
GO
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[_Order] ([orderID])
GO
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[_Order] ([orderID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[_Order] ([orderID])
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD FOREIGN KEY([specID])
REFERENCES [dbo].[Specification] ([SpecID])
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD FOREIGN KEY([specID])
REFERENCES [dbo].[Specification] ([SpecID])
GO
ALTER TABLE [dbo].[Product_Discount]  WITH CHECK ADD  CONSTRAINT [FK__Product_D__disco__6B24EA82] FOREIGN KEY([discountID])
REFERENCES [dbo].[Discount] ([discountID])
GO
ALTER TABLE [dbo].[Product_Discount] CHECK CONSTRAINT [FK__Product_D__disco__6B24EA82]
GO
ALTER TABLE [dbo].[Product_Discount]  WITH CHECK ADD  CONSTRAINT [FK__Product_D__disco__6C190EBB] FOREIGN KEY([discountID])
REFERENCES [dbo].[Discount] ([discountID])
GO
ALTER TABLE [dbo].[Product_Discount] CHECK CONSTRAINT [FK__Product_D__disco__6C190EBB]
GO
ALTER TABLE [dbo].[Product_Discount]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Product_Discount]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[ProductImport]  WITH CHECK ADD FOREIGN KEY([importID])
REFERENCES [dbo].[Import] ([importID])
GO
ALTER TABLE [dbo].[ProductImport]  WITH CHECK ADD FOREIGN KEY([importID])
REFERENCES [dbo].[Import] ([importID])
GO
ALTER TABLE [dbo].[ProductImport]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[ProductImport]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Product]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
/****** Object:  StoredProcedure [dbo].[Proc_DetailSP]    Script Date: 5/28/2024 6:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_DetailSP]
@productID varchar(30)
as
BEGIN
    SELECT 
        a.productID,
        a.name,
        a.brand,
        a.price,
        a.quantity,
        a.color,
        a.ram,
        a.memory,
        a.specID ,
        a.specID as specID1,
        a.img,
        a.type,
        b.CPU,
        b.GPU,
        b.OS,
        b.screen,
        b.pin,
        b.camera,
        b.size,
        b.warrantly,
        b.sound,
        b.weight,
        b.conectivityTechnologies,
        b.charge,
        b.yearOfDebut,
        d.discountID,
        d.nameDiscount,
        d.ngayBatDau,
        d.ngayKetThuc,
        COALESCE(d.per_cent, 0) AS per_cent, -- Sử dụng COALESCE để đặt per_cent = 0 nếu per_cent là NULL
        -- Tính giá sau khi giảm giá nếu có giảm giá
        CASE 
            WHEN d.per_cent IS NOT NULL THEN a.price * (1 - d.per_cent / 100.0)
            ELSE a.price 
        END AS discountedPrice
    FROM 
        Product a 
        JOIN Specification b ON a.specID = b.SpecID
        LEFT JOIN Product_Discount c ON a.productID = c.productID
        LEFT JOIN Discount d ON c.discountID = d.discountID

where a.productID=@productID
end
GO
/****** Object:  StoredProcedure [dbo].[Proc_SanPham]    Script Date: 5/28/2024 6:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_SanPham]
@type varchar(30)
AS
BEGIN
    SELECT 
        a.productID,
        a.name,
        a.brand,
        a.price,
        a.quantity,
        a.color,
        a.ram,
        a.memory,
        a.specID ,
        a.specID as specID1,
        a.img,
        a.type,
        b.CPU,
        b.GPU,
        b.OS,
        b.screen,
        b.pin,
        b.camera,
        b.size,
        b.warrantly,
        b.sound,
        b.weight,
        b.conectivityTechnologies,
        b.charge,
        b.yearOfDebut,
        d.discountID,
        d.nameDiscount,
        d.ngayBatDau,
        d.ngayKetThuc,
        COALESCE(d.per_cent, 0) AS per_cent, -- Sử dụng COALESCE để đặt per_cent = 0 nếu per_cent là NULL
        -- Tính giá sau khi giảm giá nếu có giảm giá
        CASE 
            WHEN d.per_cent IS NOT NULL THEN a.price * (1 - d.per_cent / 100.0)
            ELSE a.price 
        END AS discountedPrice
    FROM 
        Product a 
        JOIN Specification b ON a.specID = b.SpecID
        LEFT JOIN Product_Discount c ON a.productID = c.productID
        LEFT JOIN Discount d ON c.discountID = d.discountID
    WHERE 
        a.type = @type
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_ShopingCart]    Script Date: 5/28/2024 6:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_ShopingCart] 
    @customerID int,
    @timeOrder datetime,
    @method NVARCHAR(30),
    @fee int,
    @total int,
    @status NVARCHAR(50),
    @productID NVARCHAR(30),
	@quantity int,
	@price int
AS
BEGIN
DECLARE @orderID INT;
    INSERT INTO _Order ( customerID, timeOrder,method,fee,total,[status])
    VALUES (@customerID,@timeOrder,@method,@fee,@total,@status)
	SET @orderID = SCOPE_IDENTITY();
    INSERT INTO orderDetail(orderID,productID, quantity,price)
    VALUES (@orderID,@productID,@quantity,@price)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 5/28/2024 6:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Login] --'a','1'
    @username NVARCHAR(50),
    @password NVARCHAR(50)
AS
BEGIN
    DECLARE @count INT;
    SELECT @count = COUNT(*)
    FROM Account
    WHERE userName = @username AND [password] = @password;
    IF @count > 0
    BEGIN
        SELECT N'Đăng nhập thành công' AS Result,
		c.customerID,
			C.accountID,
               C.fullName,
               C.birthDate,
               C.gender,
               C.address,
               C.phoneNumber,
               C.accountStatus
        FROM Account A
        INNER JOIN Customer C ON A.accountID = C.accountID
        WHERE A.userName = @username AND A.[password] = @password;
    END
    ELSE
        SELECT N'Đăng nhập thất bại' AS Result;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_Reg]    Script Date: 5/28/2024 6:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Reg] --'a','1','cc@cc.com','admin','2004',1,'ádasdasdsd','09','Kích hoạt','Guest'
    @userName VARCHAR(50),
    @password VARCHAR(50),
    @email VARCHAR(50),
    @fullName NVARCHAR(50),
    @birthDate DATE,
    @gender BIT,
    @address NVARCHAR(70),
    @phoneNumber VARCHAR(15),
    @accountStatus NVARCHAR(30),
	@role varchar(20)
AS
BEGIN
DECLARE @accountID INT;
    INSERT INTO Account (userName, [password], [email],[role])
    VALUES (@userName, @password, @email,@role)
	SET @accountID = SCOPE_IDENTITY();
    INSERT INTO Customer (accountID,fullName, birthDate, gender, [address], phoneNumber, accountStatus)
    VALUES (@accountID,@fullName, @birthDate, @gender, @address, @phoneNumber, @accountStatus)
END

GO
